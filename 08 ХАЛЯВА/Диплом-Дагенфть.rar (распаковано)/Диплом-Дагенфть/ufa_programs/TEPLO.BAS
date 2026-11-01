REM €‘—…’ ’…‹Ž‚Ž‰ Ž€Ž’Šˆ ‡‘
REM  ŒŽ™Ž‘’œ ‹€‘’€ ; R €„ˆ“‘ ‘Š‚ ;T ’…Œ…€’“€ ‹€‘’€
REM P Žˆ‘’Ž‘’œ ; RP ‹Ž’Ž‘’œ ŽŽ„ ;RV ‹Ž’Ž‘’œ €ƒ…’€ 
REM CP ’…‹Ž…ŒŠŽ‘’œ ‹€‘’€ ;CV ’…‹Ž…ŒŠŽ‘’œ €ƒ…’€ 
REM TO ’…Œ…€’“€ Ž„Žƒ…‚€ ; TP ’…Œ…€’“€ Ž‚ ŠŽ‹ ; HS ƒ‹“ˆ€ ‘Š‚;
REM RC €„ˆ“‘ €ƒ…‚€ ;Q €‘•Ž„ €ƒ…’€ ;K ŠŽ”” ’…‹Ž……„€—ˆ ;
REM S “„…‹œ Ž‚; N ’…‹ŽŽ‚Ž„Ž‘’œ ŽŽ„ ;
INPUT "H,R,T,P,RP,RV,CP,CV="H,R,T,P,RP,RV,CP,CV
INPUT " T0,TP,HS,RC,Q,K,A,S,N="T0,TP,HS,RC,Q,K,A,S,N
V=3.14*(RC^2-R^2)*H
PRINT"V Žœ…Œ ˆ‡€‰Ž‰ ‡Ž› ="V
VC=3.14*(RC^2-R^2)*(1-P)*H
PRINT "VC Žœ…Œ ‘Š…‹…’€ ‹€‘’€ Ž„‹…†€™…‰ Ž„Žƒ‚“ =";VC
VA=3.14*(RC^2-R^2)*P*H
PRINT "VA Žœ…Œ €ƒ…’€ €‡Œ…™ ‚ Žœ…Œ… Ž ‹€‘’€ ";VA
X=K*3.14*2*R*HS/(CV*Q)
PRINT "X=";X
T1=TP+(T0-TP)*2.718^X
PRINT "T1 ’…Œ…€’“€ ‚Ž„› “ “‘’œŸ=";T1
Y=A*S*V/(CV*Q)
PRINT "Y …‡€‡Œ… ……Œ…=";Y
Y1=SQR(Y)
PRINT"Y1=";Y1
Z1=(Y1-2)^2
PRINT"Z1=";Z1
Z2=(Y1+2)^2
PRINT "Z2=";Z2
Z3=A*S/(CP*RP*(1-P)) : ZZ=Z1/Z3+(P*V*1000/Q)
PRINT "ZZ=";ZZ
ZZZ=Z2/Z3+(P*V*1000/Q)
PRINT"ZZZ=";ZZZ
DZ=ZZZ-ZZ
PRINT"DZ=";DZ
W1=(CV*Q*(T0-T)*ZZZ)
PRINT "W1 ŠŽ‹ˆ—…‘’‚Ž ’…‹€ ……„€Ž‰ Žˆ‘’Ž‰ ‘…„… =";W1
KA=N/(CP*RP)
PRINT"KA=";KA
W2=3.14*RP*CP*H*(T0-T)*4*KA*ZZZ/(LOG(4*KA*ZZZ/(R^2)))
PRINT"W2 ŠŽ‹ˆ—…‘’‚Ž ’…‹€ ‡€ ‘—…’ ’…‹ŽŽ‚Ž„Ž‘’ˆ=";W2
RN=2*SQR(KA*ZZZ)
PRINT"RN €„ˆ“‘ ‚‹ˆŸˆŸ Žƒ…‚€ =";RN
















