5 REM'Расчет параметров сепарационных элементов УВС'
7 CLS
10 PRINT "Введите D газопровода,мм": INPUT d
15 Dk = 1.5 * d
20 PRINT "диаметр корпуса УВС Dk,мм"; Dk
30 PRINT " Введите наружный и внутренний D стандартной трубы,мм"
40 INPUT "Dn="; dn
50 INPUT "dv="; dv
60 l = 25 * dn
70 dgp = dv / 1.3
80 PRINT "dgp="; dgp
90 PRINT "ВВ диам. станд. трубы dgps,мм ": INPUT dgps
100 s = 1 / 4 * (dv - dgps)
110 IF dn <= 400 GOTO 130
120 IF dn >= 400 GOTO 140
130 lgp = 1200: GOTO 150
140 lgp = 1500
150 PRINT "диам. корп. УВС dn,мм"; dn
160 PRINT "длина УВС L,мм"; l
170 PRINT "диам.газоотв.патр. dgps,мм"; dgps
180 PRINT "осевое смещение газоотв. патр.S,мм"; s
190 PRINT "дл.газоотв. патр.lgp,мм"; lgp
200 END

