 INPUT Py, H, R, Ty, Tz
 Tc = (Tz - Ty) / Ln(Tz / Ty)
 Py = Pz
10 Pz = Pz1
 Pc = (Py + Pz) / 2
z = 4.82 * 10 ^ (-4) * Pc * Pc - 1.658 * .01 * Pc + 1.01
 IF ABS(Py - Pz) <= .5 THEN PRINT "z="; z: END
 GOTO 10
 Pz1 = Py * 2.7183 ^ S
 PRINT "z1="; z1












p

