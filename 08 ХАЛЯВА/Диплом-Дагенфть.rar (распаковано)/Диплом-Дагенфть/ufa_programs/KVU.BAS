   20 Input"ç¨á«® â®ç¥ª Š‚„ N=";N
    30 DIM P(N),H(N),T(N),L(N),P1(N),P2(N)
    35 INPUT"£«ã¡¨­  áª¢ ¦¨­ë L1";L1
    40 input"Ž’Š‹Ž…ˆ… Ž’ ‡€ŽŸ,Œ L2=";L2
    45 INPUT"„ˆ€Œˆ—…‘Šˆ‰ “Ž‚…œ,L3=";L3
    50 K=SQR(1-(L2/L1)^2)
    55 INPUT "‹Ž’Ž‘’œ …”’ˆ,Šƒ/Œ^3 R2=";R2
    60 INPUT"‹Ž’Ž‘’œ ‚Ž„›,Šƒ/Œ^ R3=";R3
    65 INPUT"Ž‚Ž„…Ž‘’œ R4=";R4
    70 R1=R2*(1-R4)+R3*R4
    75 FOR I=1 TO N
    80 INPUT "“Ž‚…œ,Œ H(I)=";H(I)
    85 INPUT "‚…ŒŸ,Œˆ T(I)=";T(I)
    90 G=9.8: P0=R1*G*K*(L1-L3)
    95 P(I)=R1*G*K*(L1-H(I))
    100 P1(I)=(P(I)-P0)/1E006
    105 NEXT I
    110 PRINT "—ˆ‘‹Ž Ž’Ž˜…›• ’Ž—…Š ŠŽ”.€ ŠŽ”.‚ ŠŽ”.ŠŽ…‹Ÿ–ˆˆ"
    115 LET S1=0:LET S2=0:LET S3=0:LET S4=0:LET S5=0
    120 FOR I=1 TO N
    125 LET L(I)=LOG(T(I))/log(10)
    130 LET S1=S1+L(I)^2:LET S2=S2+L(I):LET S3=S3+P1(I)*L(I)
    135 LET S4=S4+P1(I): LET S5=S5+P1(I)^2
    140 IF I<=2 GOTO 160
    145 LET A=(S1*S4-S2*S3)/(I*S1-S2^2):LET B=(I*S3-S2*S4)/(I*SS1-S2^2)
    150 LET R=(I*S3-S2*S4)/SQR((I*S5-S4^2)*(I*S1-S2^2))
    155 lPRINT N-1;A;B;R
    160 NEXT I
    165 PRINT"‚›……Œ ŠŽ””ˆ–ˆ…’›"
    170 INPUT "A,B=";a,B
    185 INPUT"„ˆ€Œ…’ ‘Š‚€†ˆ›,Œ D1=";D1
    190 INPUT "„ˆ€Œ…’ Š’,Œ D2=";D2
    200 INPUT "“Ž‚…œ,M H1=";H1
    210 INPUT "“Ž‚…œ,M H2=";H2
    220 V1=(3.14*(D1^2-D2^2)/4)*H1
    225 V2=(3.14*(D1^2-D2^2)/4)*H2
    230 V3=V1-V2
    240 INPUT "H3=";H3
    245 INPUT "H4=";H4
    250 P3=(L1-H3-H4)*G*R1/1E06
    255 P4=(H3+H4-L3)*G*R2/1E06
    260 P5=(P3+P4)*K
    265 LPRINT " P5="P5;
    270 INPUT"T5=";T5
    275 W=V3/T5
    280 X=2.3*W/(4*3.14*B)
    285 LPRINT " X="X;
   290 INPUT "‹€‘’Ž‚Ž… „€‚‹…ˆ… P6=";P6
    295 INPUT"„…ˆ’ ‘Š‚€†ˆ›,Œ^3/‘“’ Q=";Q
    300 K1=Q/(P6-P5)
    305 LPRINT" K1="K1
    310 INPUT "€„ˆ“‘ ŠŽ’“€ ˆ’€ˆŸ,M R6=";R6
    315 A9=(K1/(2*3.14*X))*Log(R6/D1/2)
    320 LPRINT" A9="A9;
    325 K3=K1/A9
    335 LPRINT "B="B;
    350 LPRINT "K3="K3
    355 END
                     system


