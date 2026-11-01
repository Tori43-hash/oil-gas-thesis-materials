CLS
Ppl = 4.53
Pkr = 4.7
Tkr = 193.61
eps = .0395
ro = .569
Tz = 319
mu = .02
H = 2175
d = .076
REM INPUT "Введите расход тыс.м3/сут"; Q
REM INPUT "Введите замеренное устьевое давление, МПа"; Pus
REM INPUT "Введите замеренную устьевое температуру, K"; Tus
Pus = 1.61: Q = 14.84: Tus = 275
P = Pus: m = 1
PRINT "  Tsr   Tpr   Pz   Psr   Ppr     z     s       Re    lam     tetta   Pz'"
1 : PRINT "итерация №"; m
Tsr = (Tz - Tus) / LOG(Tz / Tus)
Tpr = Tsr / Tkr
Pz1 = P
Psr = (Pz1 + Pus) / 2
Ppr = Psr / Pkr
z = (.4 * LOG(Tpr) / LOG(10) + .73) ^ Ppr + .1 * Ppr
s = .03415 * ro * H / (z * Tsr)
Re = 1.943 * Q * ro / (d * mu)
lam = 1 / (2 * LOG(5.62 / Re ^ .9 + eps / 7.41)) ^ 2
O = 1.377 * 10 ^ (-12) * lam * z ^ 2 * Tsr ^ 2 * (EXP(2 * s) - 1) / d ^ 5
Pz = (Pus ^ 2 * EXP(2 * s) + O * Q ^ 2) ^ .5
e = ABS(Pz - Pz1)
P = Pz
PRINT " "; : PRINT USING "###.#"; Tsr;
PRINT " "; : PRINT USING "#.##"; Tpr;
PRINT " "; : PRINT USING "#.###"; Pz1;
PRINT " "; : PRINT USING "#.###"; Psr;
PRINT " "; : PRINT USING "#.###"; Ppr;
PRINT " "; : PRINT USING "#.####"; z;
PRINT " "; : PRINT USING "#.####"; s;
PRINT " "; : PRINT USING "######"; Re;
PRINT " "; : PRINT USING "#.#####"; lam;
PRINT " "; : PRINT USING "#.######"; O;
PRINT " "; : PRINT USING "#.###"; Pz
IF ABS(Pz - Pz1) > .05 THEN m = m + 1: GOTO 1

