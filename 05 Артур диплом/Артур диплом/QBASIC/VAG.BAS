CLS
du = .05
t = .0015
q = .15
n = 20
DIM a(n, 7), P(n, 7), C(n, 7)

FOR j = 1 TO 7
P(1, 0) = 1
a(1, j) = 1 - (du ^ 2 * EXP(2 * du) / (4 * t * P(1, j - 1) ^ .5))
C(1, j) = du ^ 2 * P(1, j - 1) * EXP(2 * du) / (4 * t) - q * du / 2

FOR i = 2 TO n
P(i, 0) = 1
a(i, j) = 1 / (2 + du ^ 2 * EXP(2 * du * i) / (2 * t * P(i - 1, j - 1) ^ .5) - a(i - 1, j))
C(i, j) = a(i, j) * (C(i - 1, j) + du ^ 2 * EXP(2 * du * i) * P(i - 1, j - 1) ^ .5 / (2 * t))
NEXT i

P(n - 1, j) = C(n, j) / (1 - a(n, j))
FOR i = n - 1 TO 1 STEP -1
P(i - 1, j) = a(i, j) * P(i, j) + C(i, j)
NEXT i
P(n, j) = P(n - 1, j)
NEXT j
    INPUT "Введите имя файла: "; n$
    OPEN n$ FOR OUTPUT AS #1
  
   PRINT " ---------------------------------------------------"
PRINT "|i\j    1      2      3      4      5      6       7  |"
PRINT " ------------------------------------------------------"
FOR i = 1 TO n
FOR j = 1 TO 7
P(i, j) = P(i, j) ^ .5
NEXT j
NEXT i
FOR i = 1 TO n
PRINT #1, USING " ## #.#### #.#### #.#### #.#### #.#### #.#### #.##### "; i; P(i, 1); P(i, 2); P(i, 3); P(i, 4); P(i, 5); P(i, 6); P(i, 7)
NEXT i
PRINT " ------------------------------------------------------"
 CLOSE
 END


