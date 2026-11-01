CLS
n = 1
REM INPUT "Введите устьевое давление, МПа"; Pu
REM INPUT "Введите устьевую температуру, ~C"; Tu
REM INPUT "Введите забойную температуру, ~C"; Tz
REM INPUT "Введите внутренний диаметр НКТ, см"; d
REM INPUT "Введите глубину скважины, м"; H
REM INPUT "Введите абсолютную шероховатость НКТ, м"; lk
REM INPUT "Введите плотность жидкости, кг/м3"; ro
REM INPUT "Введите объёмный расход, тыс*м3/сут"; Q
REM INPUT "Введите динамическую вязкость, мПа*с"; mu
Pu = 13.5: Tu = 40: Tz = 81: d = 7.6: H = 2500: lk = .0001: ro = .73: Q = 450: mu = .016
Tu = Tu + 273: Tz = Tz + 273: d = d / 100
Tcp = (Tz - Tu) / LOG(Tz / Tu)
P = Pu
1 : pcp = (P + Pu) / 2
zcp = 4.82 * 10 ^ -4 * pcp ^ 2 - 1.685 * 10 ^ -2 * pcp + 1.01
S = .03415 * ro * H / (zcp * Tcp * .29)
Re = 14.74 * Q * ro / (d * mu)
IF Re < 2300 THEN lam = 64 / Re
IF Re >= 2300 THEN lam = .25 / (LOG(5.62 / Re ^ .9 + 7.41 * d * .5 / lk) / LOG(10)) ^ 2
O = 1.377 * 10 ^ -12 * lam * zcp * Tcp * (EXP(2 * S) - 1) / d ^ 5
Pz = (Pu ^ 2 * EXP(2 * S) + O * Q ^ 2) ^ .5
PRINT "pcp="; pcp; " zcp="; zcp; " S="; S; " Re="; Re; " lam="; lam; " O="; O; " Pz="; Pz; " "; ABS(P - Pz)
IF ABS(P - Pz) > .01 THEN P = Pz: n = n + 1: GOTO 1
PRINT "Количество итераций="; n
PRINT "Pзаб="; Pz; "МПа"

