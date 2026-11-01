CLS
10 INPUT n, T, P
20 DIM c(n, n), y(n), pk(n), tk(n), w(n), ac(n), m(n), alfa(n), A(n), B(n)
30 R = .0083675#: E = .00001
40 FOR i = 1 TO n
50 READ pk(i), tk(i), w(i), y(i)
60 NEXT i
70 FOR i = 1 TO n
80 ac(i) = .457235 * R ^ 2 * tk(i) ^ 2 / pk(i)
90 m(i) = .37464 + 1.54226 * w(i) - .26992 * w(i) ^ 2
100 alfa(i) = (1 + m(i) * (1 - SQR(T / tk(i)))) ^ 2
110 A(i) = ac(i) * alfa(i)
120 B(i) = .077796 * R * tk(i) / pk(i)
130 NEXT i
140 FOR i = 1 TO n
150 FOR j = 1 TO n
160 READ c(i, j): c(j, i) = c(i, j)
170 NEXT j
180 NEXT i
190 FOR i = 1 TO n
200 NEXT i
210 A = 0: B = 0
220 FOR i = 1 TO n
230 bm = B + y(i) * B(i)
240 NEXT i
250 FOR j = 1 TO n
260 am = A + y(i) * y(j) * (1 - c(i, j) * (SQR(A(i) * A(j))))
270 NEXT j
280 A = A * P / (R ^ 2 * T ^ 2)
290 B = B * P / (R * T)
300 DEF FNF (z) = z ^ 3 - (1 - B) * z ^ 2 + (A - 3 * B62 - 2 * B) * z - (A * B - B ^ 2 - B ^ 3)
310 z2 = 2.5: z = 2.5
320 F2 = FNF(z2)
330 z = z - .01
340 F = FNF(z)
350 IF F2 * F < 0 THEN
360 F2 = F: z2 = z
370 END IF
380 GOTO 330
390 F1 = F: z1 = z
400 z = (z1 + z2) / 2
410 F = FNF(z)
420 IF ABS(F) < E GOTO 460
430 IF F1 * F < 0 GOTO 450
440 z1 = z: GOTO 390
450 z2 = z: GOTO 390
460 PRINT z, P, T

DATA 4.7,190.55,0.013
DATA 7.381,304.2,0.231
DATA 3.4,470.4,0.252
DATA 0,0.105,0.03
DATA 0,0.115
DATA 0




