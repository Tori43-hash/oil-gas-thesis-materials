INPUT Pu
INPUT Tu
INPUT Tz
INPUT D
INPUT H
INPUT lam
INPUT Q
INPUT ro
Tu = Tu + 273: Tz = Tz + 273: Tcp = (Tz - Tu) / ln(Tz / Tu)
P = Pu
1 : Pcp = (P + Pu) / 2
Zcp = 4.82 * 10 ^ -4 * Pcp ^ 2 - 1.685 * 10 ^ -2 * Pcp + 1.01
S = .03415 * ro * H / (Zcp * Tcp)
O = 1.377 ^ -12 * lam * Zcp * Tcp * (EXP(2 * S) - 1) / D ^ 5
Pz = (Pu ^ 2 * EXP(2 * S) + O * Q ^ 2) ^ .5
PRINT "Pcp=   "  Pcp ; "Zcp=  " Zcp=  ; "S=   "  S; "O=   " O;"Pz=  " Pz  ; ABS(P-Pz)
IF ABS(P - Pz) > .01 THEN P = Pz: n = n + 1: GOTO 1
PRINT "ŠŽ‹ ‚Ž   ˆ’…€–ˆ‰"
PRINT "„€‚‹…ˆ…"


