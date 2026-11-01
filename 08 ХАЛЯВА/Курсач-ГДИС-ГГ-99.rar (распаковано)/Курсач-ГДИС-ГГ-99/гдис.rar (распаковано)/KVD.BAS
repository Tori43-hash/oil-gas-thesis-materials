 CLS
 DIM Pz(n), t(n)
 INPUT n
 FOR i = 1 TO n
 READ Pz(i), t(i)
 NEXT i
 Sx = 0: Sy = 0: Sxy = 0: Sx2 = 0: Sy2 = 0
 FOR i = 1 TO n
 Sx = Sx + lgt(i)
 Sy = S + Pz(i) ^ 2
 Sxy = Sxy + Pz(i) ^ 2 * lgt(i)
 Sx2 = Sx2 + lgt(i)
 Sy2 = Sy2 + Pz(i) ^ 4
 NEXT i
 Alf = (Sx2 * Sy - Sx * Sxy) / (n * Sx2 - Sx ^ 2)
 Bet = (n * Sxy - Sxy) / (n * Sx2 - Sx ^ 2)
 R = (n * Sxy - Sxy) / SQR((n * Sx2 - Sx ^ 2) * (n * Sy2 - Sy ^ 2))
 PRINT A, B, R
 DATA


