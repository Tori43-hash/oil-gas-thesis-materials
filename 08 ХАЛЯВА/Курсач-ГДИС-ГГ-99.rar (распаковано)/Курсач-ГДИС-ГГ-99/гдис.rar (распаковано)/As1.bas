INPUT "введите n,ppl"; n, ppl
DIM pz(n), q(n)
FOR i = 1 TO n
READ pz(i)
NEXT i
FOR i = 1 TO n
READ q(i)
NEXT i
sx = 0: sy = 0: sxy = 0: sx2 = 0: sy2 = 0:
FOR i = 1 TO n
y = (ppl ^ 2 - pz(i) ^ 2) / q(i)
x = q(i)
sx = sx + x: sy = sy + y: sxy = sxy + x * y:
sx2 = sx2 + x ^ 2: sy2 = sy2 + y ^ 2
NEXT i
a = (sx2 * sy - sx * sxy) / (n * sx2 - sx ^ 2)
b = (n * sxy - sx * sy) / (n * sx2 - sx ^ 2)
r = (n * sxy - sx * sy) / SQR((n * sx2 - sx ^ 2) * (n * sy2 - sy ^ 2))
PRINT "a="; a; "b="; b; "r="; r

DATA 9.245,9.021,8.653,8.442,8.241,9.241

DATA 485.3,698.6,809.3,993.4,1187.3,481.4


