import concurrent.futures
import datetime
import hashlib
import json
import os
from pathlib import Path
import threading
import time
import urllib.error
import urllib.parse
import urllib.request

ROOT = Path('/home/tori/student')
SOURCES = [
('ОСНОВНОЙ МАТЕРИАЛ','https://disk.yandex.ru/d/QLw9R2kHSnMuFA'),
('Диплом ГДИС','https://disk.yandex.ru/d/2BPQM3gYMz721w'),
('rtyrty.doc','https://disk.yandex.ru/i/D5BeUGSyFHmwlQ'),
('КНИГИ','https://disk.yandex.ru/d/1qddPwpoKpdqnQ'),
('Артур диплом','https://disk.yandex.ru/d/h1oj0XsirNusAA'),
('презентация Репин.pptx','https://disk.yandex.ru/i/5QqJfadkzm1yiw'),
('Диплом ГРП','https://disk.yandex.ru/d/z0YHQE4UT1MdkQ'),
('ХАЛЯВА','https://disk.yandex.ru/d/ISKfK5RPxxyUeQ'),
('методичка дипл 2010.doc','https://disk.yandex.ru/i/zO_k5YMi0DVoHQ'),
('Диплом ГРП.rar','https://disk.yandex.ru/d/FRjirJBCOPABog'),
('диплом','https://disk.yandex.ru/d/ov_HYLiFsGeFEw'),
('Глава6.xls','https://disk.yandex.ru/i/RyuFPU1yuomi1g'),
('дип по Федоровское','https://disk.yandex.ru/d/B1CfsjcTW8ClRQ'),
('МОЙ ДИПЛОМ','https://disk.yandex.ru/d/E-nfXqY1X3Tj_g'),
('ДП(готовое2003).ppt','https://disk.yandex.ru/i/GayZ-BtSlK9IMA'),
('Диплом Рожкова','https://disk.yandex.ru/d/3YKPAyNckuHwvQ'),
('34483.doc','https://disk.yandex.ru/d/Iu_zvZjqd3tYBg'),
('РАБОТА','https://disk.yandex.ru/d/tEgjm0AkoBpooA'),
('по диплому.rar','https://disk.yandex.ru/d/cZ_cUGQEaExF6g'),
('ОПТИМИЗАЦИЯ НЕФТЕГАЗОСБОРНОЙ СИСТЕМЫ ТЕНГИЗСКОГО МЕСТОРОЖДЕНИЯ.ppt','https://disk.yandex.ru/i/qomouwjYmXXhFw'),
('Доклад Куатов.doc','https://disk.yandex.ru/i/-801wCw5l7nV_A'),
('гидродинамические методы исследования','https://disk.yandex.ru/d/RqRKyUVWIdr79g'),
('ОПТИМИЗАЦИЯ НЕФТЕГАЗОСБОРНОЙ СИСТЕМЫ ТЕНГИЗСКОГО МЕСТОРОЖДЕНИЯ.pptx','https://disk.yandex.ru/i/WwFlfe_WbEJfYQ'),
('Диплом ГРП, мой','https://disk.yandex.ru/d/dBi3fbfmLB-GLA'),
('Доклад.doc','https://disk.yandex.ru/i/iofvjLuqQbdfGQ'),
('Наброски диплома.doc','https://disk.yandex.ru/i/jSyNAVYKEty9lA'),
('Расчеты абсорбции.doc','https://disk.yandex.ru/i/gqoCuYiXEj9GlA'),
]
LOCK = threading.Lock()
API_TIMEOUT = int(os.environ.get('DIPLOMA_API_TIMEOUT', '60'))
FILE_TIMEOUT = int(os.environ.get('DIPLOMA_FILE_TIMEOUT', '90'))
ATTEMPTS = int(os.environ.get('DIPLOMA_ATTEMPTS', '3'))
REPORT = ROOT / '_загрузка_диплома'
REPORT.mkdir(exist_ok=True)
PARTS = REPORT / '.данные_загрузки'
PARTS.mkdir(exist_ok=True)
LOG = REPORT / ('журнал_' + datetime.datetime.now().strftime('%Y%m%d_%H%M%S_%f') + '.jsonl')

def log(record):
    with LOCK:
        with LOG.open('a', encoding='utf-8') as f:
            f.write(json.dumps(record, ensure_ascii=False) + '\n')

def api(url, path=None, download=False, offset=0):
    params = {'public_key':url}
    if path: params['path'] = path
    if not download: params.update(limit=100, offset=offset)
    endpoint = 'https://cloud-api.yandex.net/v1/disk/public/resources' + ('/download' if download else '')
    for attempt in range(4):
        try:
            with urllib.request.urlopen(endpoint + '?' + urllib.parse.urlencode(params), timeout=API_TIMEOUT) as r:
                return json.load(r)
        except urllib.error.HTTPError as e:
            if e.code not in (429,500,502,503,504) or attempt == 3:
                raise RuntimeError(f'API HTTP {e.code}: {e.read(2000).decode(errors="replace")}') from e
        except (OSError, TimeoutError):
            if attempt == 3: raise
        time.sleep(2 ** attempt)

def safe_name(name):
    if not name or name in ('.','..') or '/' in name or '\x00' in name:
        raise ValueError('Unsafe name: ' + repr(name))
    if len(name.encode('utf-8')) > 255:
        suffix = Path(name).suffix
        tail = ' [' + hashlib.sha256(name.encode('utf-8')).hexdigest()[:10] + ']' + suffix
        return Path(name).stem.encode('utf-8')[:255-len(tail.encode('utf-8'))].decode('utf-8','ignore') + tail
    return name

def target_dir(index):
    return ROOT / f'{index+1:02d} {SOURCES[index][0]}'

def collect(index):
    label,url = SOURCES[index]
    base = target_dir(index)
    meta = api(url)
    jobs = []
    def walk(node, dest):
        if node['type'] == 'file':
            jobs.append({'source':index+1, 'url':url, 'remote_path':node['path'], 'name':node['name'], 'size':node['size'], 'md5':node.get('md5'), 'sha256':node.get('sha256'), 'local':str(dest)})
            return
        dest.mkdir(parents=True, exist_ok=True)
        offset = 0
        while True:
            page = api(url, node['path'], offset=offset)['_embedded']
            for child in page['items']:
                walk(child, dest / safe_name(child['name']))
            offset += len(page['items'])
            if offset >= page['total']: break
            if not page['items']: raise RuntimeError('Empty page before total')
    walk(meta, base / safe_name(meta['name']) if meta['type']=='file' else base)
    log({'event':'listing','source':index+1,'url':url,'name':meta['name'],'count':len(jobs),'bytes':sum(j['size'] for j in jobs)})
    return jobs

def matches(path, job):
    if not path.is_file() or path.stat().st_size != job['size']: return False
    if job.get('md5'):
        h = hashlib.md5()
        with path.open('rb') as f:
            for chunk in iter(lambda:f.read(1024*1024),b''): h.update(chunk)
        return h.hexdigest() == job['md5']
    return False

def download(job):
    dest = Path(job['local'])
    dest.parent.mkdir(parents=True, exist_ok=True)
    if dest.exists():
        if matches(dest,job):
            log({'event':'verified_existing',**job})
            return True
        log({'event':'error',**job,'error':'Destination exists with different content; preserved'})
        print('CONFLICT',dest,flush=True)
        return False
    for attempt in range(ATTEMPTS):
        part = PARTS / f'{time.time_ns()}-{threading.get_ident()}.part'
        try:
            href = api(job['url'],job['remote_path'],download=True)['href']
            md5,sha = hashlib.md5(),hashlib.sha256()
            size = 0
            with urllib.request.urlopen(href,timeout=FILE_TIMEOUT) as response, part.open('xb') as out:
                for chunk in iter(lambda:response.read(1024*1024),b''):
                    out.write(chunk)
                    md5.update(chunk)
                    sha.update(chunk)
                    size += len(chunk)
                out.flush()
                os.fsync(out.fileno())
            if size != job['size'] or (job.get('md5') and md5.hexdigest()!=job['md5']) or (job.get('sha256') and sha.hexdigest()!=job['sha256']):
                raise ValueError('Downloaded size or checksum mismatch')
            # Hard link publishes verified content without replacing any file.
            os.link(part,dest)
            # Keep temporary download too: user explicitly asked never to delete.
            log({'event':'downloaded',**job,'actual_md5':md5.hexdigest(),'actual_sha256':sha.hexdigest(),'retained_part':str(part)})
            print(f'OK [{job["source"]:02}] {dest.relative_to(ROOT)} ({size} bytes)',flush=True)
            return True
        except Exception as e:
            log({'event':'attempt_failed',**job,'attempt':attempt+1,'error':str(e),'part':str(part)})
            if attempt == ATTEMPTS - 1:
                print(f'ERROR [{job["source"]:02}] {job["name"]}: {e}',flush=True)
                return False
            time.sleep(2**attempt)

if __name__ == '__main__':
    import sys
    mode = sys.argv[1]
    if mode == 'test':
        jobs = collect(2)
        assert len(jobs) == 1
        assert download(jobs[0])
        assert matches(Path(jobs[0]['local']),jobs[0])
        print('TEST PASSED: size and MD5 verified',flush=True)
    elif mode == 'all':
        jobs,errors = [],[]
        for i in range(len(SOURCES)):
            try:
                found=collect(i)
                jobs.extend(found)
                print(f'LIST [{i+1:02}] {len(found)} files, {sum(j["size"] for j in found)} bytes',flush=True)
            except Exception as e:
                errors.append({'source':i+1,'url':SOURCES[i][1],'error':str(e)})
                log({'event':'listing_error',**errors[-1]})
                print(f'LIST ERROR [{i+1:02}]: {e}',flush=True)
        inventory=REPORT / ('список_' + datetime.datetime.now().strftime('%Y%m%d_%H%M%S_%f') + '.json')
        with inventory.open('x',encoding='utf-8') as f:
            json.dump({'sources':SOURCES,'files':jobs,'listing_errors':errors},f,ensure_ascii=False,indent=2)
        print(f'TOTAL: {len(jobs)} files, {sum(j["size"] for j in jobs)} bytes; listing errors {len(errors)}',flush=True)
        with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
            results=list(pool.map(download,jobs))
        print(f'FINISHED: verified {sum(results)}/{len(jobs)} files; listing errors {len(errors)}; report {REPORT}',flush=True)
