10 CLS
30 N = 6: P = 10.1
35 DIM PZ(N), Q(N)
40 FOR I = 1 TO N
50 READ PZ(I), Q(I)
60 NEXT I
70 S1 = 0: S2 = 0: S3 = O: S4 = 0: S5 = 0
80 FOR I = 1 TO N
85 PP = P ^ 2 - PZ(I) ^ 2
90 S1 = S1 + Q(I)
100 S2 = S2 + Q(I) ^ 2
110 S3 = S3 + PP / Q(I)
120 S4 = S4 + PP
130 S5 = S5 + (PP / Q(I)) ^ 2
140 NEXT I
160 A = (S3 * S2 - S4 * S1) / (N * S2 - S1 ^ 2)
170 B = (N * S4 - S1 * S3) / (N * S2 - (S1) ^ 2)
180 R = (N * S4 - S1 * S3) / SQR((N * S2 - (S1) ^ 2) * (N * S5 - (S3) ^ 2))
190 PRINT "äéùîîàñàÖçí Ä="; A
200 PRINT "äéùîîàñàÖçí Ç="; B
210 PRINT "äéùîîàñàÖçí R="; R
220 END
230 DATA 9.93,115,9.34,294,9.27,357,8.68,468,7.46,638,6.67,689













































