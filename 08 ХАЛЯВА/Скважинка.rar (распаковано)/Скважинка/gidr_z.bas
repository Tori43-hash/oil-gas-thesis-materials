CLS
n = 8: r = .0083675
INPUT "Введите рабочее давление, МПа"; P
INPUT "Введите рабочую температуру, К"; T
DIM nu(n), Pkr(n), Tkr(n), ac(n), a(n), b(n), alf(n), m(n), c(n, n), w(n), el$(n)
DEF fnz (z) = z ^ 3 - (1 - Bb) * z ^ 2 + (Ab - 3 * Bb ^ 2 - 2 * Bb) * z - (Ab * Bb - Bb ^ 2 - Bb ^ 3)

FOR i = 1 TO n
 READ nu(i), Tkr(i), Pkr(i), w(i)
NEXT i

FOR i = 1 TO n
 FOR j = i TO n
  READ c(i, j)
  c(j, i) = c(i, j)
 NEXT j
NEXT i

FOR i = 1 TO n
 READ el$(i)
NEXT i


FOR i = 1 TO n
 b(i) = .077796 * r * Tkr(i) / Pkr(i)
 ac(i) = .457235 * (r * Tkr(i)) ^ 2 / Pkr(i)
 m(i) = .37464 + 1.54226 * w(i) - .26992 * w(i) ^ 2
 alf(i) = (1 + m(i) * (1 - (T / Tkr(i)) ^ .5)) ^ 2
 a(i) = ac(i) * alf(i)
NEXT i

a = 0: b = 0
FOR i = 1 TO n
 b = b + nu(i) * b(i)
 FOR j = 1 TO n
  a = a + nu(i) * nu(j) * (1 - c(i, j)) * (a(i) * a(j)) ^ .5
 NEXT j
NEXT i

Ab = a * P / (r * T) ^ 2
Bb = b * P / (r * T)

z2 = 2.5: z = 2.5
f2 = fnz(z2)
10
z = z - .01
f = fnz(z)
IF f2 * f > 0 THEN f2 = f: z2 = z: GOTO 10
f1 = f: z1 = z

z0 = z1 + z2
20
z = (z1 + z2) / 2
f = fnz(z)
IF ABS(z0 - z) <= .0001 THEN GOTO 30
IF f1 * f > 0 THEN z1 = z ELSE z2 = z
z0 = z: GOTO 20

30
PRINT "Коэффициент сверхсжимаемости смеси z="; USING "#.######"; z;

DATA 0.0025, 126.20, 3.40, 0.039
DATA 0.0013, 304.13, 7.37, 0.239
DATA 0.9536, 190.66, 4.61, 0.011
DATA 0.0314, 305.33, 4.87, 0.099
DATA 0.0057, 369.85, 4.25, 0.153
DATA 0.0016, 407.84, 3.63, 0.183
DATA 0.0015, 425.16, 3.80, 0.199
DATA 0.0026, 469.80, 3.38, 0.251

DATA 0.000, 0.000, 0.025, 0.010, 0.090, 0.095, 0.095, 0.100
DATA        0.000, 0.105, 0.130, 0.125, 0.115, 0.115, 0.115
DATA               0.000, 0.005, 0.010, 0.025, 0.025, 0.030
DATA                      0.000, 0.005, 0.010, 0.010, 0.010
DATA                             0.000, 0.000, 0.000, 0.020
DATA                                    0.000, 0.000, 0.005
DATA                                           0.000, 0.005
DATA                                                  0.000

DATA "азот", "углекислый газ","метан","этан","пропан","изобутан","бутан","пентан+в"

