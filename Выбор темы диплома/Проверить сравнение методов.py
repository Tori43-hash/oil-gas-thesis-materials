"""Пробная проверка двух зависимостей на архивных данных 1998 года."""
import csv
import math
import statistics
from collections import defaultdict
from pathlib import Path

path = Path(__file__).with_name('Исходные строки куста 608.csv')
groups = defaultdict(list)
with path.open(encoding='utf-8-sig', newline='') as f:
    for row in csv.DictReader(f, delimiter=';'):
        if row['год'] == '1998':
            q = float(row['дебит_тыс_м3_сут'])
            d = float(row['Рпл_ата_из_акта'])**2 - float(row['Рзаб_ата'])**2
            choke = float(row['диаметр_шайбы_мм_как_в_источнике'].replace('*', '').replace(',', '.'))
            groups[row['скважина']].append((q, d, choke))

def fit(rows, method):
    if method == 'двучленная':
        b, a = statistics.linear_regression([q for q, d, c in rows], [d/q for q, d, c in rows])
        return lambda d: 2*d / (a + math.sqrt(a*a + 4*b*d))
    n, log_c = statistics.linear_regression([math.log(d) for q, d, c in rows], [math.log(q) for q, d, c in rows])
    return lambda d: math.exp(log_c) * d**n

errors = defaultdict(list)
differences = []
assert len(groups) == 7 and sum(map(len, groups.values())) == 49
for well, rows in sorted(groups.items()):
    quadratic, power = (fit(rows, m) for m in ('двучленная', 'степенная'))
    differences.extend(abs(quadratic(d) - power(d))/q*100 for q, d, c in rows)
    for method in ('двучленная', 'степенная'):
        current = []
        for choke in sorted({c for q, d, c in rows}):
            training = [r for r in rows if r[2] != choke]
            predictor = fit(training, method)
            current.extend(abs(predictor(d)/q - 1)*100 for q, d, c in rows if c == choke)
        assert len(current) == len(rows) and all(math.isfinite(e) for e in current)
        errors[method].extend(current)
        print(f'{well}, {method}: средняя ошибка восстановления исключённых замеров {statistics.mean(current):.2f}%')

for method, values in errors.items():
    assert len(values) == 49
    print(f'Всего, {method}: средняя {statistics.mean(values):.2f}%, максимальная {max(values):.2f}%')
assert max(differences) < 1.5
print(f'Максимальное расхождение полных моделей в измеренных точках: {max(differences):.2f}% измеренного дебита.')
print('Проверка ограничена этим архивом; ошибки приборов и точность прогноза будущей эксплуатации не установлены.')
