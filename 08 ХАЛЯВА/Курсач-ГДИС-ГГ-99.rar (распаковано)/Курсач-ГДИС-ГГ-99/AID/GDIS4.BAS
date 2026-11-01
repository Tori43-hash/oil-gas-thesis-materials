CLS
INPUT "Введите расход, тыс.м3/сут"; Q
INPUT "Введите пластовую температуру, К"; Tpl
INPUT "Введите B"; B
INPUT "Введите радиус скважины, м"; rc
INPUT "Введите коэффициенты несовершенства скважины с1 и c2"; c1, c2
Q = 754: Tpl = 303: B = .000308: rc = .1
c1 = 1.3: c2 = .33: n = 16: Pz0 = 14.778
DIM Pz(n), t(n)
FOR i = 1 TO n
READ Pz(i), t(i)
NEXT i
Sx = 0: Sy = 0: Sxy = 0: Sx2 = 0: Sy2 = 0
FOR i = 1 TO n
Sx = Sx + LOG(t(i))
Sy = Sy + Pz(i) ^ 2
Sxy = Sxy + Pz(i) ^ 2 * LOG(t(i))
Sx2 = Sx2 + (LOG(t(i))) ^ 2
Sy2 = Sy2 + Pz(i) ^ 4
NEXT i
alf = (Sx2 * Sy - Sx * Sxy) / (n * Sx2 - Sx ^ 2)
bet = (n * Sxy - Sx * Sy) / (n * Sx2 - Sx ^ 2)
R = (n * Sxy - Sx * Sy) / ((n * Sx2 - Sx ^ 2) * (n * Sy2 - Sy ^ 2)) ^ .5
PRINT "alf="; USING "###.#######"; alf
PRINT "bet="; USING "#.#######"; bet
PRINT "R="; USING "#.#######"; R
khmu = 2.3 * Q * 10 ^ 3 / 86400 * Tpl * .1013 * 10 ^ 6 / (293 * bet * 10 ^ 12)
rcpr = rc * EXP(-c1 - c2)
PRINT USING "#.#######"; rcpr
kappa = EXP((alf - Pz0 ^ 2 - B * Q ^ 2) / bet) * rcpr ^ 2 / 2.25
PRINT "kh/mu="; USING "#.###########"; khmu;
PRINT " м3/(Па*с)"
PRINT "kappa="; kappa
DATA 16.936,30,17.956,60,18.073,120,18.524,180,18.7,300,18.858,600,18.897,900
DATA 19.093,7200,19.142,25200,19.221,39600,19.23,75600,19.26,162000
DATA 19.29,248400,19.34,601200,19.35,1112400,19.417,1285200



