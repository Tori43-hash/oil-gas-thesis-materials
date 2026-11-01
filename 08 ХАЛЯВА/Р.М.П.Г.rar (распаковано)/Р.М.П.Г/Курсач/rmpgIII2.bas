CLS
OPEN "c:\dos\basic\result.txt" FOR OUTPUT AS #1
ns = 21: n1 = 10: n2 = 27: n = 7: T = 319
DEF fnz (Ppr) = (.4 * LOG(Tpr) / LOG(10) + .73) ^ Ppr + .1 * Ppr
DIM dep(ns), Nscv(ns), d(ns), l(ns), A(ns), B(ns), qs(ns)
DIM Pu(n2), Pz(10 * n2), Qt(10 * n2), Pr(10 * n2), Q(10 * n2), P(n1)
DIM nu(n), Pkr(n), Tkr(n), ro(n)
FOR i = 1 TO n
 READ nu(i), Tkr(i), Pkr(i), ro(i)
NEXT i
FOR i = 1 TO n
 Tpkr = Tpkr + nu(i) * Tkr(i)
 Ppkr = Ppkr + nu(i) * Pkr(i)
 rost = rost + nu(i) * ro(i)
NEXT i
PRINT #1, "Псевдокритическая температура Tpkr=";
PRINT #1, USING "###.##"; Tpkr;
PRINT #1, " K"
Tpr = T / Tpkr
PRINT #1, "Псевдоприведенная температура Tpr=";
PRINT #1, USING "#.###"; Tpr
PRINT #1, "Псевдокритическое давление Ppkr=";
PRINT #1, USING "#.###"; Ppkr;
PRINT #1, " МПа"
FOR i = 1 TO n1: READ Q(i): NEXT i
FOR i = 1 TO n1: READ P(i): NEXT i
FOR i = 1 TO n1 - 1: Qt(i) = Q(i + 1) - Q(i): NEXT i
s1 = 0: s2 = 0: s3 = 0: s4 = 0: s5 = 0
FOR i = 1 TO n1
 Ppr = P(i) / Ppkr
 z = fnz(Ppr)
 Pz = P(i) / z
 s1 = s1 + Q(i)
 s2 = s2 + Pz
 s3 = s3 + Pz * Q(i)
 s4 = s4 + Q(i) ^ 2
 s5 = s5 + Pz ^ 2
NEXT i
A = (n1 * s3 - s1 * s2) / (n1 * s4 - s1 ^ 2)
B = (s4 * s2 - s3 * s1) / (n1 * s4 - s1 ^ 2)
R = (s1 * s2 - n1 * s3) / ((n1 * s4 - s1 ^ 2) * (n1 * s5 - s2 ^ 2)) ^ .5
PRINT #1, "a=";
PRINT #1, USING "##.#####"; A
PRINT #1, "b=";
PRINT #1, USING "##.#####"; B
PRINT #1, "R=";
PRINT #1, USING "#.#####"; R
Qzap = -B / A
PRINT #1, "Запасы газа Qзап=";
PRINT #1, USING "#####.##"; Qzap;
PRINT #1, " млн. м3"
PRINT #1, "Определение начального пластового давления"
P2 = P(1)
10 : Ppr = P2 / Ppkr: z = fnz(Ppr): P1 = z * B
PRINT #1, "z=";
PRINT #1, USING "#.####"; z;
PRINT #1, " P2=";
PRINT #1, USING "##.##"; P2;
PRINT #1, " P1=";
PRINT #1, USING "##.##"; P1;
PRINT #1, " P2-P1=";
PRINT #1, USING "#.##"; ABS(P2 - P1)
IF ABS(P1 - P2) > .0001 THEN P2 = P1: GOTO 10
Pn = P1: Ppr = Pn / Ppkr: zn = fnz(Ppr)
Pnzn = Pn / zn
PRINT #1, "Начальное пластовое давление Pн=";
PRINT #1, USING "##.##"; Pn;
PRINT #1, " МПа"
PRINT #1, "Коэффициент сверхсжимаемости при начальных пластовых условиях zн=";
PRINT #1, USING "#.####"; zn
PRINT #1, "Pн/zн=";
PRINT #1, USING "##.###"; Pnzn
H1 = Pn * 1000 / 9.81
Pk = (50 + 50 * H1 / (.3048 * 1000)) * .007
PRINT #1, "Конечное давление Pкон=";
PRINT #1, USING "#.##"; Pk;
PRINT #1, " МПа"
Ppr = Pk / Ppkr: zk = fnz(Ppr)
PRINT #1, "Коэффициент сверхсжимаемости при конечных пластовых условиях zкон=";
PRINT #1, USING "#.####"; zk
Pkzk = Pk / zk
PRINT #1, "Pкон/zкон=";
PRINT #1, USING "#.###"; Pkzk
Qizvl = -(Pnzn - Pkzk) / A
PRINT #1, "Извлекаемые запасы газа Qзап.извл=";
PRINT #1, USING "#####.##"; Qizvl;
PRINT #1, " млн. м3"
FOR i = 1 TO ns: READ A(i): NEXT i
FOR i = 1 TO ns: READ B(i): B(i) = B(i) / 100: NEXT i
FOR i = 1 TO ns: READ Nscv(i): NEXT i
FOR i = 1 TO ns: READ dep(i): NEXT i
FOR i = 1 TO ns
 qs(i) = -A(i) * .5 / B(i) + (A(i) ^ 2 * .25 / B(i) ^ 2 + (2 * Pn - dep(i)) * dep(i) / B(i)) ^ .5
 qs(i) = qs(i) * 1000 / 86400
NEXT i
s1 = 0: s2 = 0
FOR i = 1 TO ns: s1 = s1 + A(i) * qs(i): NEXT i
FOR i = 1 TO ns: s2 = s2 + qs(i): NEXT i
Asr = s1 / s2
s1 = 0
FOR i = 1 TO ns
 s1 = s1 + B(i) * qs(i) ^ 2
NEXT i
Bsr = ns * s1 / s2 ^ 2
PRINT #1, "Средние коэффициенты фильтрационных сопротивлений Аср=";
PRINT #1, USING "#.####"; Asr;
PRINT #1, " МПа2/(тыс.м3/сут)"
PRINT #1, "Вср=";
PRINT #1, USING "#.######"; Bsr;
PRINT #1, " МПа2/(тыс.м3/сут)2"
s = 0
FOR i = 1 TO ns
 s = s + (2 * P(n1) - dep(i)) * dep(i)
NEXT i
dep = P(n1) - (P(n1) ^ 2 - s / ns) ^ .5
PRINT #1, "Депрессия на пласт del=";
PRINT #1, USING "#.###"; dep;
PRINT #1, " МПа"
PRINT #1, "---------------------"
PRINT #1, "|  годы  | Рпл, МПа |"
PRINT #1, "|--------|----------|"
z = zn
FOR i = 1 TO n1
 Pr(i) = (Pnzn + A * Q(i)) * z
 Ppr = Pr(i) / Ppkr
 z = fnz(Ppr)
 PRINT #1, "| "; 1990 + i; " |"; TAB(13);
 PRINT #1, USING "##.##"; Pr(i);
 PRINT #1, "   |"
NEXT i
PRINT #1, "---------------------"
ks = 26
PRINT #1, "Расчет на стадии падающей добычи"
Nscv = 26
PRINT #1, "----------------------------------------------------------------------------"
PRINT #1, "|  годы  | Рпл, МПа | Накопл. добыча млн. м3 | Pзаб, МПа | qср, тыс.м3/сут |"
PRINT #1, "|--------|----------|------------------------|-----------|-----------------|"
Ppr = Pr(n1) / Ppkr
z = fnz(Ppr)
Qd = Q(n1) + Qt(n1 - 1)
i = n1
WHILE Pr(i) > Pk
 i = i + 1
 Qt1 = Qt(i - 1)
 Pv = Pr(i - 1)
30 : Pr(i) = (Pnzn + A * Qd) * z
 Ppr = Pr(i) / Ppkr
 z = fnz(Ppr)
 qsr = -Asr * .5 / Bsr + ((Asr * .5 / Bsr) ^ 2 + (2 * Pr(i) - dep) * dep / Bsr) ^ .5
 Qt2 = qsr * .33 * Nscv
 IF ABS(Pr(i) - Pv) < .0001 THEN GOTO 40
  Pv = Pr(i)
  Qt1 = (Qt2 + Qt1) / 2
  Qd = Q(i - 1) + Qt1
  GOTO 30
40 : Q(i) = Qd
 Qt(i) = Qt1
 Qd = Q(i) + Qt(i)
 Pz(i) = Pr(i) - dep
 qsr = Qt(i) / (.33 * ks)
 PRINT #1, "| "; 1990 + i; " |"; TAB(13); USING "##.##"; Pr(i);
 PRINT #1, "   | "; TAB(31); USING "#####.#"; Q(i);
 PRINT #1, TAB(46); "|"; TAB(50); USING "#.###"; Pz(i);
 PRINT #1, TAB(58); "|"; TAB(65); USING "##.##"; qsr;
 PRINT #1, TAB(76); "|"
WEND
PRINT #1, "----------------------------------------------------------------------------"
FOR i = 1 TO ns: READ l(i): l(i) = l(i) * 1000: NEXT i
FOR i = 1 TO ns: READ d(i): d(i) = d(i) / 1000: NEXT i
Pcol = 2.3: Tus = 283: mu = .00013: lk = .001: H = 2175: d = .076
del = rost / 1.29
ror = rost * Pcol * 293 / (.1013 * Tus * z)
FOR i = 1 TO ns
 eps = 2 * lk / d(i)
 v = (4 * qs(i) / 3.14 * d(i) ^ 2) ^ .5
 Re = v * d(i) * ror / mu
 IF Re < 11 * eps ^ -1.5 THEN lam = .067 * eps ^ .2 ELSE lam = (.067 * (158 / Re + eps) ^ .2)
 lam = 1.05 * lam
 c = z * Tus * lam * del / .0384 ^ 2 / d(i) ^ 5
 Pu(i) = ((Pcol * 10 ^ 6) ^ 2 + c * qs(i) ^ 2 * l(i)) ^ .5 / 10 ^ 6
NEXT i
eps = 2 * lk / d
FOR i = 1 TO ns
 P = Pu(i): m = 1
20 : Tsr = (T - Tus) / LOG(T / Tus)
 Tpr = Tsr / Tpkr
 Pz1 = P
 Psr = (Pz1 + Pu(i)) / 2
 Ppr = Psr / Ppkr
 z = fnz(Ppr)
 s = .03415 * del * H / (z * Tsr)
 v = (4 * qs(i) / 3.14 * d ^ 2) ^ .5
 Re = v * d * ror * Psr / Pcol / mu
 IF Re < 2302 THEN lam = 64 / Re ELSE lam = 1 / (2 * LOG(5.62 / Re ^ .9 + e / 7.41)) ^ 2
 O = 1.325 * 10 ^ (-12) * lam * z ^ 2 * Tsr ^ 2 * (EXP(2 * s) - 1) / d ^ 5
 Pz = (Pu(i) ^ 2 * EXP(2 * s) + O * qs(i) ^ 2) ^ .5
 e = ABS(Pz - Pz1)
 P = Pz
 IF ABS(Pz - Pz1) > .05 THEN m = m + 1: GOTO 20
 Pz(i) = Pz
NEXT i
PRINT #1, "Минимально допустимые значения забойных и устьевых давлений"
PRINT #1, "---------------------------------"
PRINT #1, "| № скв | Рзаб, МПа | Руст, МПа |"
PRINT #1, "|-------|-----------|-----------|"
s = 0
FOR i = 1 TO ns
 s = s + Pz(i)
 PRINT #1, "| "; Nscv(i); " |"; TAB(13);
 PRINT #1, USING "#.###"; Pz(i);
 PRINT #1, "   |"; TAB(25);
 PRINT #1, USING "#.###"; Pu(i);
 PRINT #1, "   |"
NEXT i
PRINT #1, "---------------------------------"
s = s / ns
PRINT #1, "Среднее забойное давление Рзаб=";
PRINT #1, USING "#.##"; s;
PRINT #1, " МПа"
END
REM Азот
DATA 0.0018, 126.20, 3.400, 1.251
REM Угл. газ
DATA 0.0138, 304.13, 7.370, 1.977
REM Метан
DATA 0.9363, 190.66, 4.601, 0.717
REM Этан
DATA 0.0370, 305.33, 4.870, 1.344
REM Пропан
DATA 0.0012, 369.85, 4.250, 1.967
REM Бутан
DATA 0.0001, 407.84, 3.630, 2.600
REM Пентан
DATA 0.0098, 460.39, 3.380, 3.220
REM Накопленная добыча
DATA 7965, 9312, 10608, 11823, 13002, 14173, 15300, 16366, 17347, 18267
REM Пластовые давления
DATA 15.79, 14.53, 13.46, 12.60, 11.42, 10.36, 09.64, 08.65, 8.03, 7.48
REM Коэффициенты А
DATA 0.12, 0.16, 0.08, 0.26, 0.23, 0.27, 0.36, 0.30, 0.41, 0.06, 0.23
DATA 0.32, 0.39, 0.56, 0.40, 0.82, 0.12, 0.05, 0.32, 0.42, 0.40
REM Коэффициенты В
DATA 0.745,0.005,0.007,0.180,0.020,0.057,4.567,0.109,0.014,0.065
DATA 0.056,0.214,0.044,0.047,0.012,0.233,0.017,0.004,0.002,0.740,0.075
REM Номера скважин
DATA 301, 401, 402, 403, 404, 405, 406, 407, 409, 410, 411
DATA 412, 413, 414, 415, 416, 422, 423, 424, 425, 431
REM Депрессии
DATA 2.76, 0.88, 2.42, 1.75, 1.46, 0.69, 0.63, 2.02, 2.40, 1.18, 2.36
DATA 1.77, 4.47, 0.85, 2.29, 4.59, 0.82, 0.63, 0.96, 1.18, 0.67
REM Длины шлейфов
DATA 5.80, 5.80, 6.60, 4.65, 4.70, 6.00, 5.80, 3.65, 4.20, 4.95, 5.55
DATA 2.60, 2.70, 3.70, 4.14, 1.70, 2.62, 3.60, 5.22, 6.13, 5.55
REM Диаметры шлейфов
DATA 211, 211, 139, 211, 139, 139, 139, 191, 139, 139, 139
DATA 139, 139, 139, 143, 143, 141, 141, 141, 141, 145

