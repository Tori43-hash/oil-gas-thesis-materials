
CLS

N = 6: R = .0083675
X(1) = .99147: M(1) = 16.042: R(1) = .6679: W(1) = .013: Tk(1) = 190.55: Pk(1) = 4.695   ' CH4
X(2) = .00041: M(2) = 30.068: R(2) = 1.263: W(2) = .108: Tk(2) = 305.43: Pk(2) = 4.976   ' C2H6
X(3) = .00001: M(3) = 44.094: R(3) = 1.872: W(3) = .182: Tk(3) = 369.82: Pk(3) = 4.333   ' C3H8
X(4) = .00019: M(4) = 44.011: R(4) = 1.842: W(4) = .231: Tk(4) = 304.2:  Pk(4) = 7.381   ' CO2
X(5) = .00781: M(5) = 28.016: R(5) = 1.165: W(5) = .04:  Tk(5) = 126.3:  Pk(5) = 3.425   ' N2
X(6) = .00011: M(6) = 32:     R(6) = 1.331: W(6) = .019: Tk(6) = 154.78: Pk(6) = 5.18    ' O2

Pkrcm = 0: Tkrcm = 0
FOR I = 1 TO N
  Pkrcm = Pkrcm + Pk(I) * X(I)
    Tkrcm = Tkrcm + Tk(I) * X(I)
    NEXT I
    'PRINT "Pkrcm="; Pkrcm; " Tkrcm="; Tkrcm

    INPUT " ‚‚…„’… … ‘‚€†›"; NNN
    INPUT " ‚‚…„’… „€…’ €‰›, mm"; D2: D2 = D2 / 1000
    INPUT " ‚‚…„’… „€‚‹…… „ €‰› P1,  β¬."; P1: P1 = P1 / 10
    INPUT " ‚‚…„’… „€‚‹…… ‘‹… €‰› P2,  β¬."; P2: P2 = P2 / 10
    P = (P1 + P2) / 2:
INPUT " ‚‚…„’… ’……€’““ t, grad.C"; t1: T = t1 + 273

FOR I = 1 TO N
  Ac(I) = .457235 * R ^ 2 * Tk(I) ^ 2 / Pk(I)
    B(I) = .077796 * R * Tk(I) / Pk(I)
      M1(I) = .37464 + 1.54226 * W(I) - .26992 * W(I) ^ 2
        ALFA(I) = (1 + M1(I) * (1 - (T / Tk(I)) ^ .5)) ^ 2
          A(I) = Ac(I) * ALFA(I)
          NEXT I
 
'      CH4    C2H6   C3H8  CO2   N2    O2
DATA   0,    .005,  .01,  .105, .025, .025
DATA  .005,   0,    .005, .13,  .01,  .01
DATA  .01,   .005,   0,   .125, .09,  .09
DATA  .105,  .13,   .125,  0,    0,    0
DATA  .025,  .01,   .09,   0,    0,    0
DATA  .025,  .01,   .09,   0,    0,    0
FOR I = 1 TO N: FOR J = 1 TO N: READ c(I, J): NEXT J: NEXT I

Acm = 0: Bcm = 0
FOR I = 1 TO N
  FOR J = 1 TO N
      Acm = Acm + X(I) * X(J) * (1 - c(I, J)) * (A(I) * A(J)) ^ .5
        NEXT J
          Bcm = Bcm + B(I) * X(I)
          NEXT I
           
Z = .8: E = .000001: A = Acm * P / (R * T) ^ 2: B = Bcm * P / (R * T)
1 : f1 = Z ^ 3 - (1 - B) * Z ^ 2 + (A - 3 * B ^ 2 - 2 * B) * Z - (A * B - B ^ 2 - B ^ 3)
    F2 = 3 * Z ^ 2 - 2 * (1 - B) * Z + (A - 3 * B ^ 2 - 2 * B)
        Z0 = Z - f1 / F2
            IF ABS(Z - Z0) < E THEN 2: Z = Z0: GOTO 1
2 : PRINT
D1 = .1: D3 = .1: ' ¤¨ ¬¥β
M = 0: FOR I = 1 TO N: M = M + M(I) * X(I): NEXT I
Rootn = M / 28.96
Ksi = .5 * (1 - (D2 / D1) ^ 2) ^ (3 / 4) + (1 - (D2 / D3) ^ 2) ^ 2
Q = ((P1 ^ 2 - P2 ^ 2) * D2 ^ 3 / (2.85E-12 * Ksi * Z * Rootn * T)) ^ .5
PRINT : PRINT "    *** „¥΅¨β αªΆ ¦¨­λ"; NNN; ":   q="; Q; "βλα.¬3/αγβ"

