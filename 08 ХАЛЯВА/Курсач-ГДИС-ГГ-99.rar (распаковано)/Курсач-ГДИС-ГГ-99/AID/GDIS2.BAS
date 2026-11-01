CLS
INPUT "Введите N, Pпл.зам, cпл"; N, pplz, cpl
DIM Pz(N), Q(N)
FOR i = 1 TO N
READ Pz(i), Q(i)
NEXT i
Sx = 0: Sy = 0: Sxy = 0: Sx2 = 0: Sy2 = 0
del = (pplz ^ 2 - cpl) ^ .5 - pplz: ppl = pplz + del
FOR i = 1 TO N
Sx = Sx + Q(i)
dP2 = ppl ^ 2 - Pz(i) ^ 2
Sy = Sy + dP2 / Q(i)
Sxy = Sxy + dP2
Sx2 = Sx2 + Q(i) ^ 2
Sy2 = Sy2 + (dP2 / Q(i)) ^ 2
NEXT i
A = (Sx2 * Sy - Sx * Sxy) / (N * Sx2 - Sx ^ 2)
B = (N * Sxy - Sx * Sy) / (N * Sx2 - Sx ^ 2)
R = (N * Sxy - Sx * Sy) / ((N * Sx2 - Sx ^ 2) * (N * Sy2 - Sy ^ 2)) ^ .5
PRINT "A="; USING "##.##########"; A
PRINT "B="; USING "##.##########"; B
PRINT "R="; USING "##.##########"; R
DATA 9.88,265,9.75,370,9.63,440,9.58,470,9.38,600,9.22,680,9.1,730

