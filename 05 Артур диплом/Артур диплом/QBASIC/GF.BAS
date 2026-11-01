FOR i = 1 TO 25
READ Q(i)
 NEXT i
 Q = 0: P = Pn
 Zn = .000482 * P ^ 2 - .01685 * P + 1.01
 FOR i = 1 TO 25
 Q = Q + Q(i)
1 : Z = .000482 * P ^ 2 - .01685 * P + 1.01
 P1 = (Pn / Zn - Pat * Tpl * Q / (ao * Tct)) * Z
 IF ABC(P1 - P) > .05 THEN GOTO 2 ELSE GOTO 3
2 : P = P1: GOTO 1
3 : P(i) = P1
 qc(i) = -A / (2 * B) + ((A / 2 * B) ^ 2 + (2 * P(i) - dP) * dP / B) ^ .5
n(i) = Q(i) / (.33 * qc(i))
 NEXT i
 FOR i = 1 TO 25
 qc(i) = -A / (2 * B) + ((A / 2 * B) ^ 2 + (2 * P(i) - dP) * dP / B) ^ .5
 n(i) = 1000 * Q(i) / (.33 * qc(i))
 NEXT i
PRINT "|  ƒŽ„|"
FOR i = 1 TO 25
PRINT USING " | ##  |       ##      |##.####|   ###.####     | ### |"; i; Q(i); P(i); qc(i); n(i): END
NEXT i
 DATA 3.5,75,10,15,15,15,15,15,15,15,15,15,15
 DATA 15,15,15,15,14,13,12,11,10,9,8,7

