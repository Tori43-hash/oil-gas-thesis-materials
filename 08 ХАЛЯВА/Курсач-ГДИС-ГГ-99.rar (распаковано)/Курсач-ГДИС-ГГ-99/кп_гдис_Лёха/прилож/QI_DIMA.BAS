INPUT "Введите N, ro:"; N, ro

Pkr = 4.695
Tkr = 190.55

FOR i = 1 TO N
 READ Pu(i), Dsht(i), Tu(i)
 Ppr(i) = Pu(i) / Pkr
 Tu(i) = Tu(i) + 273.15
 Tpr(i) = Tu(i) / Tkr

' Z(i) = 4.82 * 10 ^ (-4) * Ppr(i) ^ 2 - 1.658 * 10 ^ (-2) * Ppr(i) + 1.01
 Z(i) = (.4 * LOG(Tpr(i)) / LOG(10) + .73) ^ Ppr(i) + .1 * Ppr(i)
 PRINT "Z(i)="; USING "#.#########"; Z(i)
 PRINT "Tpr="; Tpr(i); " Ppr="; Ppr(i)
 
 delta = -.517 + 1.618 * Tpr(i) + (1.204 - 1.231 * Tpr(i) + .322 * Tpr(i) ^ 2) * Ppr(i) + (-.101 + .11 * Tpr(i) - .33 * Tpr(i) ^ 2) * Ppr(i) ^ 2

 PRINT "delta="; delta
 Q(i) = delta * 10 * Pu(i) * .184 * Dsht(i) ^ 2 / (SQR(Tu(i) * Z(i) * ro))
 PRINT "Q(i)="; USING "#############.#####"; Q(i)
NEXT


END


DATA 4.075, 16, 10
DATA 3.907, 19, 11
DATA 3.613, 22, 11
DATA 3.304, 25, 11.2
DATA 3.082, 28, 11

