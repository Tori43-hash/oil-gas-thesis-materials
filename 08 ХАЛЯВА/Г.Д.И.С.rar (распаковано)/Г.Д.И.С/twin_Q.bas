CLS
Pkr = 4.7
Tkr = 193.61
ro = .569
Tz = 319
H = 2175
d = .076
n = 8
DIM Pus(n), Tus(n), d(n)
FOR i = 1 TO n
 READ Pus(i), Tus(i), d(i)
NEXT i
PRINT "  Tpr   Ppr     z     c     del     Q"
FOR i = 1 TO n
 Tpr = Tus(i) / Tkr
 Ppr = Pus(i) / Pkr
 z = (.4 * LOG(Tpr) / LOG(10) + .73) ^ Ppr + .1 * Ppr
 c = .189 * d(i) ^ 2
 del = -.517 + 1.618 * Tpr + (1.204 - 1.231 * Tpr + .322 * Tpr ^ 2) * Ppr + (-.101 + .11 * Tpr - .33 * Tpr ^ 2) * Ppr ^ 2
 Q = 10 * c * del * Pus(i) / (ro * z * Tus(i)) ^ .5
 PRINT " "; USING "#.###"; Tpr;
 PRINT " "; USING "#.###"; Ppr;
 PRINT " "; USING "#.####"; z;
 PRINT " "; USING "##.###"; c;
 PRINT " "; USING "#.###"; del;
 PRINT " "; USING "###.###"; Q
NEXT i
DATA 1.61,257,6,1.12,263,8,2.38,268,10,2.14,270,12
DATA 1.69,270,14,1.33,270.5,16,2.16,271,12,1.9,265,8

