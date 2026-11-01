"""Проверка выгрузки и пробной регрессии. Только стандартная библиотека Python."""
import csv
import math
import statistics
from collections import defaultdict
from pathlib import Path

folder = Path(__file__).resolve().parent
with (folder / 'Исходные строки куста 608.csv').open(encoding='utf-8-sig', newline='') as f:
    rows = list(csv.DictReader(f, delimiter=';'))
with (folder / 'Пробный расчет продуктивности.csv').open(encoding='utf-8-sig', newline='') as f:
    summaries = {(r['год'], r['скважина']): r for r in csv.DictReader(f, delimiter=';')}

assert len(rows) == 91
assert sum(r['год'] == '1998' for r in rows) == 49
assert sum(r['год'] == '2001' for r in rows) == 42
groups = defaultdict(list)
for row in rows:
    groups[row['год'], row['скважина']].append(row)
assert len(groups) == 14

for key, group in sorted(groups.items()):
    q = [float(r['дебит_тыс_м3_сут']) for r in group]
    y = [(float(r['Рпл_ата_из_акта'])**2 - float(r['Рзаб_ата'])**2) / rate
         for r, rate in zip(group, q)]
    b, a = statistics.linear_regression(q, y)
    result = summaries[key]
    assert int(result['число_режимов']) == len(group)
    assert math.isclose(a, float(result['A_пробная_регрессия']), rel_tol=1e-10)
    assert math.isclose(b, float(result['B_пробная_регрессия']), rel_tol=1e-10)
    if key[0] == '1998':
        assert a > 0 and b > 0
    print(f'{key[0]} / {key[1]}: {len(group)} режимов; A={a:.6f}; B={b:.8f}')

sample = next(r for r in rows if r['год'] == '1998' and r['скважина'] == '6080'
              and float(r['номер_режима']) == 1)
gas_volume = float(sample['дебит_тыс_м3_сут']) * 1000 * float(sample['время_мин']) / 1440
sand = float(sample['песок_г_за_замер']) * 1000 / gas_volume
assert math.isclose(sand, float(sample['песок_мг_м3_значение_XLS']), rel_tol=1e-10)
print('Проверено: 91 строка, 14 серий, регрессии и удельный вынос песка.')
