CLS
Pkr = 4.7: Tkr = 193.61: Tz = 319: Tu = 265
Q = 19240: H = 1748.5: n = 14: R = .569:
DIM Pu(n), Pz1(n), Pz(n), P(n), t(n)
FOR i = 1 TO n: READ Pu(i): NEXT i
Tsr = (Tz - Tu) / LOG(Tz / Tu): Tpr = Tsr / Tkr
PRINT "Tsr="; Tsr; " Tpr="; Tpr
FOR i = 1 TO n: P(i) = Pu(i): NEXT i
m = 1
1 : PRINT "кол-во итераций -"; m
FOR i = 1 TO n
 Pz1(i) = P(i)
 Psr = (Pz1(i) + Pu(i)) / 2
 Ppr = Psr / Pkr
 z = (.4 * LOG(Tpr) / LOG(10) + .73) ^ Ppr + .1 * Ppr
 s = .03415 * R * H / (z * Tsr)
 Pz(i) = Pu(i) * EXP(s)
 eps = ABS(Pz1(i) - Pz(i))
 P(i) = Pz(i)
 PRINT " Psr="; USING "#.###"; Psr;
 PRINT " Ppr="; USING "#.##"; Ppr;
 PRINT " z="; USING "#.####"; z;
 PRINT " s="; USING "#.####"; s;
 PRINT " Pz'="; USING "#.###"; Pz(i);
 PRINT " eps="; USING "#.###"; eps
NEXT i
FOR i = 1 TO n
 IF ABS(Pz1(i) - Pz(i)) > .05 THEN SLEEP: m = m + 1: GOTO 1
NEXT i

FOR i = 1 TO n
 READ t(i)
NEXT i
sx = 0: sy = 0: sxy = 0: sx2 = 0: sy2 = 0
FOR i = 2 TO n
 sx = sx + LOG(t(i)) / LOG(10)
 sy = sy + Pz(i) ^ 2
 sxy = sxy + Pz(i) ^ 2 * LOG(t(i)) / LOG(10)
 sx2 = sx2 + (LOG(t(i)) / LOG(10)) ^ 2
 sy2 = sy2 + Pz(i) ^ 4
NEXT i
n = 13
alf = (sx2 * sy - sx * sxy) / (n * sx2 - sx ^ 2)
bet = (n * sxy - sx * sy) / (n * sx2 - sx ^ 2)
R = (n * sxy - sx * sy) / ((n * sx2 - sx ^ 2) * (n * sy2 - sy ^ 2)) ^ .5
PRINT "alf="; alf; "bet="; bet; "R="; R

DATA 3.51,3.51,3.52,3.52,3.56,3.61,3.65,3.67,3.79,3.84,3.86,3.87,3.88,3.88
DATA 0,20,40,60,120,180,240,300,600,900,1500,2400,3600,5400












