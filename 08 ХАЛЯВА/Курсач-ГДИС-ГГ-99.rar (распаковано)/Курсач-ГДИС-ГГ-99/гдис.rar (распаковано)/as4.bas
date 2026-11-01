'INPUT "‚‚…„ˆ’… Tust, Pust, Q, d, H, ro, Tz, Lk, mu:"; Tust, Pust, Q, d, H, ro, Tz, Lk, mu
PRINT "‚‚…„ˆ’… Tust, Pust, Q, d, H, ro, Tz, Lk, mu:"

Tust = 313
Pust = 13.5
Q = 450
d = .076
H = 2500
ro = .73
Tz = 354
Lk = 10 ^ (-4)
mu = .016

Tsr = (Tz - Tust) / LOG(Tz / Tust)
Pz = Pust
1 : PRINT "i"
Psr = (Pz + Pust) / 2
Z = 4.82 * 10 ^ (-4) * Psr ^ 2 - 1.685 * Psr * 10 ^ (-2) + 1.01
s = (.03415 * ro * H) / (Z * Tsr)
Re = 14.74 * Q * ro / (d * mu)
IF Re < 2300 THEN lam = 64 / Re
eps = (2 * Lk / d)
lam = .25 / (LOG(5.62 / Re ^ .9 + 7.41 / eps) / 2.3) ^ 2
teta = (1.377 * 10 ^ (-12) * lam * Z * Tsr * (EXP(2 * s) - 1)) / d ^ 5
Pz1 = SQR(Pust ^ 2 * EXP(2 * s) + teta * Q ^ 2)
IF ABS(Pz - Pz1) >= .03 THEN Pz = Pz1: GOTO 1

PRINT "Tsr", Tsr
PRINT "Z", Z
PRINT "Psr", Psr
PRINT "S", s
PRINT "Re", Re
PRINT "lam", lam
PRINT "teta", teta
PRINT "Pz", Pz

