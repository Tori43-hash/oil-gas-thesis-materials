CLS
INPUT "Введите кол-во компонентов рабочее давление и температуру"; n, P, T
m = 1
r = .0083675
DIM k(n), y(n), x(n), a(n), b(n), fw(n), fl(n)
DIM alf(n), m(n), W(n), ac(n), C(n, n), nu(n), Pkr(n), Tkr(n)
DEF fnf (z) = z ^ 3 - (1 - Bb) * z ^ 2 + (Ab - 3 * Bb ^ 2 - 2 * Bb) * z - (Ab * Bb - Bb ^ 2 - Bb ^ 3)

REM Чтение мольных долей, крит-х давлений, тем-р и ацентрических факторов для каждого компонента
FOR i = 1 TO n
READ nu(i), Tkr(i), Pkr(i), W(i)
NEXT i

REM Чтение коэффициентов парного взаимодействия
FOR i = 1 TO n
FOR j = i TO n
READ C(i, j)
C(j, i) = C(i, j)
NEXT j
NEXT i

REM Расчет коэффициентов ур-я П-Р для чистых компонентов
FOR i = 1 TO n
ac(i) = .457235 * (r * Tkr(i)) ^ 2 / Pkr(i)
m(i) = .37464 + 1.54226 * W(i) - .26992 * W(i) ^ 2
alf(i) = (1 + m(i) * (1 - (T / Tkr(i)) ^ .5)) ^ 2
a(i) = ac(i) * alf(i)
b(i) = .077796 * r * Tkr(i) / Pkr(i)
NEXT i

REM Начальное приближение распределения компонентов по фазам
st = 1
FOR i = 1 TO n
k(i) = (EXP(5.373 * (1 + W(i)) * (1 - Tkr(i) / T)) * Pkr(i) / P) ^ st
NEXT i

REM Нахождение мольной доли паровой фазы
1 w1 = .79
w2 = .81
2 W = w1
GOSUB 1000
fw1 = fw
W = w2
GOSUB 1000
fw2 = fw
IF fw2 * fw1 > 0 THEN w1 = w1 - .01: w2 = w2 + .01: GOTO 2

REM Уточнение корня W
w0 = w1 + w2
3 W = (w1 + w2) / 2
GOSUB 1000
IF ABS(w0 - W) < 10 ^ -5 THEN GOTO 4
IF fw1 * fw > 0 THEN w1 = W ELSE w2 = W
w0 = W
GOTO 3

4 LOCATE 3, 1
PRINT "W="; USING "#.######"; W

REM Начальное приближение концентраций компонентов в паровой и жидкой фазах
FOR i = 1 TO n
y(i) = nu(i) * k(i) / (W * (k(i) - 1) + 1)
x(i) = y(i) / k(i)
NEXT i

REM Нахождение коэффициентов ур-я П-Р для паровой фазы
Aw = 0
Bw = 0
FOR i = 1 TO n
Bw = Bw + y(i) * b(i)
FOR j = 1 TO n
Aw = Aw + y(i) * y(j) * (1 - C(i, j)) * (a(i) * a(j)) ^ .5
NEXT j
NEXT i

AbW = Aw * P / (r * T) ^ 2
BbW = Bw * P / (r * T)


REM Нахождение коэффициента сверхсжимаемости паровой фазы
Ab = AbW
Bb = BbW
z2 = 2.5
z = 2.5:
f2 = fnf(z2)
5 z = z - .01
f = fnf(z)
IF f2 * f > 0 THEN f2 = f: z2 = z: GOTO 5
f1 = f
z1 = z
GOSUB 2000
zw = z
PRINT "zw="; USING "#.######"; zw

REM Нахождение летучестей каждого компонента в паровой фазе
FOR i = 1 TO n
s = 0
FOR j = 1 TO n
s = s + y(j) * (1 - C(i, j)) * (a(i) * a(j)) ^ .5
NEXT j
fw(i) = EXP(LOG(y(i) * P) - LOG(zw - BbW) + b(i) * (zw - 1) / Bw - LOG((zw + (1 + 2 ^ .5) * BbW) / (zw + (1 - 2 ^ .5) * BbW)) * AbW / (2 * 2 ^ .5 * BbW) * (2 * Sw / Aw - b(i) / Bw))
NEXT i

REM Нахождение коэффициентов ур-я П-Р для жидкой фазы
Al = 0
Bl = 0
FOR i = 1 TO n
Bl = Bl + x(i) * b(i)
FOR j = 1 TO n
Al = Al + x(i) * x(j) * (1 - C(i, j)) * (a(i) * a(j)) ^ .5
NEXT j
NEXT i

Abl = Al * P / (r * T) ^ 2
BbL = Bl * P / (r * T)

REM Нахождение коэффициента сверхсжимаемости жидкой фазы
Ab = Abl
Bb = BbL
z1 = 0
z = 0
f2 = fnf(z1)
6 z = z + .01
f = fnf(z)
IF f1 * f > 0 THEN f1 = f: z1 = z: GOTO 6
f2 = f
z2 = z
GOSUB 2000
zl = z
PRINT "zl="; USING "#.######"; zl

REM Нахождение летучестей каждого компонента в жидкой фазе
FOR i = 1 TO n
s = 0
FOR j = 1 TO n
s = s + x(j) * (1 - C(i, j)) * (a(i) * a(j)) ^ .5
NEXT j
fl(i) = EXP(LOG(x(i) * P) - LOG(zl - BbL) + b(i) * (zl - 1) / Bl - LOG((zl + (1 + 2 ^ .5) * BbL) / (zl + (1 - 2 ^ .5) * BbL)) * Abl / (2 * 2 ^ .5 * BbL) * (2 * s / Al - b(i) / Bl))
NEXT i

REM Корректировка коэффициентов распределения
FOR i = 1 TO n
k(i) = k(i) * fl(i) / fw(i)
NEXT i

REM Проверка равенства летучестей
FOR i = 1 TO n
IF ABS(fl(i) / fw(i) - 1) > 10 ^ -5 THEN m = m + 1: IF m < 20 * n + 20 THEN PRINT "m="; m: GOTO 1
NEXT i

LOCATE 7, 1
PRINT " i"; "       y(i)", "       x(i)"
FOR i = 1 TO n
PRINT i;
PRINT USING "#####.######"; y(i), x(i)
NEXT i
END

REM Ур-е фазовых концентраций в форме Рэчфорда
1000
fw = 0
FOR i = 1 TO n
fw = fw + nu(i) * (k(i) - 1) / (W * (k(i) - 1) + 1)
NEXT i
RETURN

REM Подпрограмма уточнения корня
2000
z0 = z1 + z2
120
z = (z1 + z2) / 2
f = fnf(z)
IF ABS(z0 - z) <= 10 ^ -5 THEN RETURN
IF f1 * f > 0 THEN z1 = z ELSE z2 = z
z0 = z: GOTO 120

REM Мольные доли, крит-е давления, температуры, ацентрические факторы
DATA 0.94,190.55,4.7,0.013
DATA 0.03,305.43,4.9,0.108
DATA 0.03,470.4,3.5,0.252

REM Коэффициенты парного взаимодействия
DATA 0,0.005,0.03,0,0.01,0

Введите кол-во компонентов рабочее давление и температуру? 3,2,293
                                                                  
W=0.991058                                                        
zw=0.945558                                                       
zl=0.082568                                                       
m= 6                                                              
 i       y(i)        x(i)                                         
 1     0.947458    0.113416                                       
 2     0.030065    0.022780                                       
 3     0.022477    0.863806                                       