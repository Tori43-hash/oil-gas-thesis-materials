CLS
INPUT "Введите число режимов"; N
INPUT "Введите пластовое давление Р(pl)"; P(pl)
INPUT "Введите СZ(0)"; CZ(0)
   d2 = P(pl) - SQR(P(pl) ^ 2 - CZ(0))
         s = 0
         c = 0
         k = 0
         l = 0
         d = 0
       
        FOR i = 1 TO N
 READ Pz(i):
 READ Q(i):
  CZ(i) = 2 * Pz(i) * d2 - d2 ^ 2
  dP(i) = P(pl) ^ 2 - Pz(i) ^ 2 - CZ(i)
               
         x(i) = dP(i) / Q(i)
         g(i) = x(i) * x(i)
         m(i) = Q(i) ^ 2
        s = s + Q(i)
        c = c + dP(i)
        k = k + x(i)
        l = l + g(i)
        d = d + m(i)
                 NEXT

     A = (k * d - c * s) / (N * d - s ^ 2)
     B = (N * c - s * k) / (N * d - s ^ 2)
     R = (N * c - s * k) / SQR((N * d - s ^ 2) * (N * l - k ^ 2))

     PRINT "Коэффициенты фильтрационных сопротивлений A="; A; " B= "; B
     PRINT "Коэффициент парной корреляции R = "; R

    


PRINT "A="; USING "##.##########"; A
PRINT "B="; USING "##.##########"; B
PRINT "R="; USING "##.##########"; R

DATA 3.835, 131.3
DATA 3.723, 183.07
DATA 3.590, 234.89
DATA 3.440, 292.99
DATA 3.290, 345.09
DATA 3.434, 292.60


