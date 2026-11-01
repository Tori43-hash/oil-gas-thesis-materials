5 PRINT "Введите время разработки"
10 INPUT N
15 DIM Q(N), QG(N), J(N), J1(N), Q1(N), QS(N), QSG(N)
20 PRINT "Введите шаг по времени DT"
25 INPUT DT
30 PRINT "Введите накопленную добычу"
40 FOR i = 1 TO N
50 INPUT Q(i)
60 NEXT i
70 PRINT "Введите темп годового отбора"
80 FOR i = 1 TO N
90 INPUT QG(i)
100 NEXT i
110 S1 = 0: S2 = 0
120 FOR i = 1 TO N
130 QS(i) = Q(i) * DT
140 IF i = 1 OR i = 2 THEN Q1(i) = (-3 * QG + 4 * QG(i + 1) - QG(i + 2)) / (2 * DT)
145 IF i <= (N - 2) AND i >= 3 THEN Q1(i) = (-2 * QG(i - 2) - QG(i - 1) - QG(i + 1) + 2 * QG(i + 2)) / (10 * DT)
150 IF i = (N - 1) OR i = N THEN Q1(i) = (QG(i - 2) - 4 * QG(i - 1) + 3 * QG(i)) / (2 * DT)
160 IF Q1(i) = 0 THEN Q1(i) = 1E-08
170 QSG(i) = DT * QG(i) / Q1(i)
180 S1 = S1 + QS(i)
185 S2 = S2 + QSG(i)
190 J(i) = S1 / i
195 J1(i) = S2 / i
200 NEXT i
210 PRINT "                                     таблица 1 "
215 PRINT "-------------------------------------------------------"
220 PRINT ": T    : Q(t)      : q(t)      : J(t)     : J1(t)         :"
225 PRINT ":год   :тыс.т      : тыс.т     :          :               :"
230 PRINT "-------------------------------------------------------"
240 FOR i = 1 TO N
250 PRINT ":   "; i; ":      "; Q(i); ":         "; QG(i); ": "; J(i); "      : "; J1(i); "        :"
260 NEXT i
290 END


