10 LPRINT "Žƒ€ŒŒ€ •€”ˆ‡Ž‚€ ƒ-91-02"
20 REM "Ž…„…‹…ˆ… ‡€Ž‰ŽƒŽ „€‚‹…ˆŸ "
30 INPUT "ƒ‹“ˆ€ ‘Š‚€†ˆ› „Ž ‚„ LW";LW
40 INPUT "„‹ˆ€ •‚Ž‘’Ž‚ˆŠ€ LX";LX
50 INPUT "’ˆ „Ž›—ˆ A";A
60 INPUT "“ƒŽ‹ Ž’Š‹Ž…ˆŸ Y";Y
70 INPUT "ƒ‹“ˆ€ ‘“‘Š€ LS";LS
80 INPUT "„ˆ€Œˆ—…‘Šˆ‰ “Ž‚…œ H1";H1
90 INPUT "„€‚‹…ˆ… ‚ ‡€’“ŽŒ Ž‘’€‘’‚… PZT";PZT
100 INPUT "‹Ž’Ž‘’œ ‹€‘’Ž‚Ž‰ …”’ˆ RZ ";RZ
110 INPUT "‹Ž’Ž‘’œ „…ƒ …”’ˆ RD";RD
120 INPUT "‹Ž’Ž‘’œ ‹€‘’Ž‚Ž‰ ‚Ž„› RV";RV
130 INPUT "‹Ž’Ž‘’œ ƒ€‡€ RG";RG
140 INPUT "Ž‚Ž„…Ž‘’œ B";B
150 INPUT "ƒ‹“ˆ€ ‘Š‚€†ˆ› L";L
160 IF A=0.7 THEN 170 ELSE  200
170 H2=LS-H1
180 H3=LW-LS
190 GOTO 230
200 IF A=0.5 THEN 210
210 H2=(LS-LX)-H1
220 H3=(LW-(LS+LX))
230 R2=(RP+RD)/2
240 R3=(A*RP+RD)/2
250 PG=RG*9.8*H1*COS(Y)
260 PN=R2*9.8*H2*COS(Y)
270 PV=(R3+(1-B)+RV*B)*9.8*H3*COS(Y)
280 PZ=PZT+PG+PN+PV
290 LPRINT "----------------------"
300 LPRINT "!ƒ‹“ˆ€!  „€‚‹…ˆ…  !"
310 LPRINT "---------------------!"
320 LPRINT "!      0!";USING"####.##";PZT;:LPRINT"     !"
330 LPRINT "!";USING"####.##";H1;:LPRINT"!";USING" ###.###^^^^";PG;:LPRINT"!"
340 LPRINT "!";USING"####.##";H2+H1;:LPRINT"!"USING"###.###^^^^";PN/10E+6;:LPRINT" !"
350 LPRINT "!";USING"####.##";H3+H2+H1;:LPRINT"!";USING"###.###^^^^";PV/10E+6;:LPRINT" !"
360 LPRINT "!";USING"####.##";L;:LPRINT"!";USING"###.###^^^^";PZ/10E+6;:LPRINT" !"
370 LPRINT "----------------------"
END