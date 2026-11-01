CLS
INPUT "Введите N, Pпл", N, ppl
DIM Pz(N), Q(N)
FOR i = 1 TO N
 READ Pz(i), Q(i)
NEXT i
Sx = 0: Sy = 0: Sxy = 0: Sx2 = 0: Sy2 = 0
FOR i = 1 TO N
Sx = Sx + Q(i)
dP2 = ppl ^ 2 - Pz(i) ^ 2
PRINT USING "#.############"; dP2 / Q(i)
Sy = Sy + dP2 / Q(i)
Sxy = Sxy + dP2
Sx2 = Sx2 + Q(i) ^ 2
Sy2 = Sy2 + (dP2 / Q(i)) ^ 2
NEXT i
A = (Sx2 * Sy - Sx * Sxy) / (N * Sx2 - Sx ^ 2)
B = (N * Sxy - Sx * Sy) / (N * Sx2 - Sx ^ 2)
R = (N * Sxy - Sx * Sy) / ((N * Sx2 - Sx ^ 2) * (N * Sy2 - Sy ^ 2)) ^ .5
PRINT "A="; USING "##.#######"; A
PRINT "B="; USING "##.#######"; B
PRINT "R="; USING "##.#######"; R

DATA 3.737, 181.38
DATA 3.624, 236.25
DATA 3.471, 290.50
DATA 3.243, 350.56
DATA 3.016, 385.87
DATA 3.737, 181.28

