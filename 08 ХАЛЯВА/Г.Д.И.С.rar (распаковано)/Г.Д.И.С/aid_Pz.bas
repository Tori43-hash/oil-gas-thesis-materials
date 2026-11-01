CLS
r = .569
Pkr = 4.7
Tkr = 193.61
Tz = 319
Tu = 265
Q = 19240
mu = .02
H = 1748.5
n = 14
DIM Pu(n), Pz1(n), Pz2(n), P(n)
FOR i = 1 TO n
 READ Pu(i)
NEXT i
Tsr = (Tz - Tu) / LOG(Tz / Tu)
Tpr = Tsr / Tkr
PRINT "Tsr="; Tsr;
PRINT "Tpr="; Tpr
FOR i = 1 TO n
 P(i) = Pu(i)
NEXT i
m = 1
1 : PRINT "кол-во итераций -"; m
FOR i = 1 TO n
 Pz1(i) = P(i)
 Psr = (Pz1(i) + Pu(i)) / 2
 Ppr = Psr / Pkr
 z = (.4 * LOG(Tpr) / LOG(10) + .73) ^ Ppr + .1 * Ppr
 s = .03415 * r * H / (z * Tsr)
 Pz2(i) = Pu(i) * EXP(s)
 eps = ABS(Pz1(i) - Pz2(i))
 P(i) = Pz2(i)
 PRINT " Psr="; USING "#.###"; Psr;
 PRINT " Ppr="; USING "#.##"; Ppr;
 PRINT " z="; USING "#.####"; z;
 PRINT " s="; USING "#.####"; s;
 PRINT " Pz2="; USING "#.###"; Pz2(i);
 PRINT " eps="; USING "#.###"; eps
NEXT i
FOR i = 1 TO n
 IF ABS(Pz1(i) - Pz2(i)) > .05 THEN SLEEP: m = m + 1: GOTO 1
NEXT i



DATA 3.51,3.51,3.52,3.52,3.56,3.61,3.65,3.67,3.79,3.84,3.86,3.87,3.88,3.88

