CLS
n = 8: R = .0083675
INPUT "Введите рабочее давление, МПа-", P
INPUT "Введите рабочую температуру, К-", T
DIM nu(n), Pkr(n), tkr(n), ac(n), a(n), b(n), alf(n), m(n), c(n, n), w(n)
DIM x(n), y(n), k(n), fw(n), fl(n), el$(n)
DEF fnz (z) = z ^ 3 - (1 - Bb) * z ^ 2 + (Ab - 3 * Bb ^ 2 - 2 * Bb) * z - (Ab * Bb - Bb ^ 2 - Bb ^ 3)

FOR i = 1 TO n
 READ nu(i), tkr(i), Pkr(i), w(i)
NEXT i

FOR i = 1 TO n
 FOR j = i TO n
  READ c(i, j)
  c(j, i) = c(i, j)
 NEXT j
NEXT i

FOR i = 1 TO n: READ el$(i): NEXT i


FOR i = 1 TO n
 b(i) = .077796 * R * tkr(i) / Pkr(i)
 ac(i) = .457235 * (R * tkr(i)) ^ 2 / Pkr(i)
 m(i) = .37464 + 1.54226 * w(i) - .26992 * w(i) ^ 2
 alf(i) = (1 + m(i) * (1 - (T / tkr(i)) ^ .5)) ^ 2
 a(i) = ac(i) * alf(i)
NEXT i

st = .1
15
m = 0
IF st > 2 THEN IF w > 1 THEN PRINT "Система находится в однофазном газообразном состоянии": GOTO 90
FOR i = 1 TO n
 k(i) = (EXP(5.373 * (1 + w(i)) * (1 - tkr(i) / T)) * Pkr(i) / P) ^ st
NEXT i
st = st + .1

17
w1 = .5: w2 = .5
20
w = w1: GOSUB 100: fw1 = fw
w = w2: GOSUB 100: fw2 = fw
IF fw2 * fw1 > 0 THEN w1 = w1 - .01: w2 = w2 + .01: GOTO 20

w0 = w1 + w2
30
w = (w1 + w2) / 2
GOSUB 100
IF ABS(w0 - w) < .0001 THEN GOTO 40
IF fw1 * fw > 0 THEN w1 = w ELSE w2 = w
w0 = w: GOTO 30

40
IF w > 1 OR w < 0 THEN GOTO 15
GOSUB 100

FOR i = 1 TO n
 y(i) = nu(i) * k(i) / (w * (k(i) - 1) + 1)
 x(i) = y(i) / k(i)
NEXT i

Aw = 0: Bw = 0: al = 0: Bl = 0
FOR i = 1 TO n
 Bw = Bw + y(i) * b(i): Bl = Bl + x(i) * b(i)
 FOR j = 1 TO n
  Aw = Aw + y(i) * y(j) * (1 - c(i, j)) * (a(i) * a(j)) ^ .5
  al = al + x(i) * x(j) * (1 - c(i, j)) * (a(i) * a(j)) ^ .5
 NEXT j
NEXT i

AbW = Aw * P / (R * T) ^ 2: BbW = Bw * P / (R * T)
Abl = al * P / (R * T) ^ 2: BbL = Bl * P / (R * T)


Ab = AbW: Bb = BbW
z2 = 1: z = 1:
f2 = fnz(z2)
50
z = z - .01
f = fnz(z)
IF f2 * f > 0 THEN f2 = f: z2 = z: GOTO 50
f1 = f: z1 = z

GOSUB 200: zw = z

Ab = Abl: Bb = BbL
z1 = 0: z = 0: f2 = fnz(z1)
60
z = z + .01
f = fnz(z)
IF f1 * f > 0 THEN f1 = f: z1 = z: GOTO 60
f2 = f: z2 = z

GOSUB 200: zl = z

FOR i = 1 TO n
 sl = 0: Sw = 0
 FOR j = 1 TO n
  sl = sl + x(j) * (1 - c(i, j)) * (a(i) * a(j)) ^ .5
  Sw = Sw + y(j) * (1 - c(i, j)) * (a(i) * a(j)) ^ .5
 NEXT j
 fw(i) = EXP(LOG(y(i) * P) - LOG(zw - BbW) + b(i) * (zw - 1) / Bw - LOG((zw + (1 + 2 ^ .5) * BbW) / (zw + (1 - 2 ^ .5) * BbW)) * AbW / (2 * 2 ^ .5 * BbW) * (2 * Sw / Aw - b(i) / Bw))
 fl(i) = EXP(LOG(x(i) * P) - LOG(zl - BbL) + b(i) * (zl - 1) / Bl - LOG((zl + (1 + 2 ^ .5) * BbL) / (zl + (1 - 2 ^ .5) * BbL)) * Abl / (2 * 2 ^ .5 * BbL) * (2 * sl / al - b(i) / Bl))
NEXT i

FOR i = 1 TO n
 k(i) = k(i) * fl(i) / fw(i)
NEXT i

FOR i = 1 TO n
 IF ABS(fl(i) / fw(i) - 1) > .001 THEN m = m + 1: IF m < 20 * n + 20 THEN GOTO 17 ELSE GOTO 15
NEXT i

LOCATE 3, 1
PRINT "Мольная доля паровой фазы W="; USING "#.#####"; w;
PRINT " f(w)="; USING "#.#######"; fw
PRINT "Коэффициент сверхсжимаемости паровой фазы zw="; USING "#.####"; zw;
PRINT " f(zw)="; USING "#.####"; fnz(zw)
PRINT "Коэффициент сверхсжимаемости жидкой фазы  zl="; USING "#.####"; zl;
PRINT " f(zl)="; USING "#.####"; fnz(zl)
FOR i = 1 TO n
 PRINT "Летучесть"; i; "-го компонента в паровой фазе Fw="; USING "##.######"; fw(i);
 PRINT " в жидкой фазе Fl="; USING "#.######"; fl(i)
NEXT i
PRINT "|  №  |  газовая фаза  |  жидкая фаза |  компонент      |"
PRINT "---------------------------------------------------------"
FOR i = 1 TO n
 PRINT "| "; i; " |  ";
 PRINT USING "###.######"; y(i) * 100;
 PRINT "    | "; USING "###.#######"; x(i) * 100;
 PRINT "  |  "; el$(i);
 LOCATE 15 + i, 57
 PRINT "|"
CLOSE #1
NEXT i
90 END

100
fw = 0
FOR i = 1 TO n
 fw = fw + nu(i) * (k(i) - 1) / (w * (k(i) - 1) + 1)
NEXT i
RETURN


200
z0 = z1 + z2
120
z = (z1 + z2) / 2
f = fnz(z)
IF ABS(z0 - z) <= .0001 THEN RETURN
IF f1 * f > 0 THEN z1 = z ELSE z2 = z
z0 = z: GOTO 120

DATA 0.0026, 126.20, 3.40, 0.039
DATA 0.0005, 304.13, 7.37, 0.239
DATA 0.9371, 190.66, 4.61, 0.011
DATA 0.0315, 305.33, 4.87, 0.099
DATA 0.0093, 369.85, 4.25, 0.153
DATA 0.0017, 407.84, 3.63, 0.183
DATA 0.0028, 425.16, 3.80, 0.199
DATA 0.0145, 469.80, 3.38, 0.251

DATA 0.000, 0.000, 0.025, 0.010, 0.090, 0.095, 0.095, 0.100
DATA        0.000, 0.105, 0.130, 0.125, 0.115, 0.115, 0.115
DATA               0.000, 0.005, 0.010, 0.025, 0.025, 0.030
DATA                      0.000, 0.005, 0.010, 0.010, 0.010
DATA                             0.000, 0.000, 0.000, 0.020
DATA                                    0.000, 0.000, 0.005
DATA                                           0.000, 0.005
DATA                                                  0.000

DATA "азот", "углекислый газ","метан","этан","пропан","изобутан","бутан","пентан+в"


