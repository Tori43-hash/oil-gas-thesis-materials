cls:SCREEN 0
90 PRINT" € „ˆ‘Š… ˆŒ…ž’‘Ÿ ‘‹…„“ž™ˆ… ”€‰‹› ‘ ˆ”ŽŒ€–ˆ…‰ Ž ‘Ž‘’€‚… ˆ ‘‚Ž‰‘’‚€•"
   PRINT"====================================================================="
FILES"*.INF":U4=CSRLIN
LOCATE U4-1,1: PRINT"====================================================================="
INPUT"‚‚…„ˆ’… ˆŒŸ ”€‰‹€ ‘ ‘Ž‘’€‚ŽŒ(…‡ €‘˜ˆ…ˆŸ)";NM$:NM$=NM$+".INF"
NM$="3:"+NM$
PRINT NM$
OPEN NM$ AS#1
FIELD#1,2 AS N4$,2 AS N1$,4 AS RA$
GET#1,1
N4=CVI(N4$):N1=CVI(N1$):RA=CVS(RA$)
DIM DYNAMIC K(N4),TK(N4),PK(N4),W(N4),N(N4),MR(N4)
DIM DYNAMIC K$(N4),TK$(N4),PK$(N4),W$(N4),N$(N4),MR$(N4)
FOR I=1 TO N4
FIELD#1,4 AS K$(I),4 AS TK$(I),4 AS PK$(I),4 AS W$(I),2 AS N$(I),4 AS MR$(I)
NEXT I
FOR I=1 TO N4
J=I+1
GET#1,J
K(I)=CVS(K$(I))
TK(I)=CVS(TK$(I))
PK(I)=CVS(PK$(I))
W(I)=CVS(W$(I))
N(I)=CVI(N$(I))
MR(I)=CVS(MR$(I))
NEXT I
ERASE K$,TK$,PK$,W$,N$,MR$
DIM DYNAMIC RO(N1),RO$(N1)
FOR I=1 TO N1
FIELD#1,4 AS RO$(I)
NEXT I
FOR I=1 TO N1
N5=N4+1+I
GET#1,N5
RO(I)=CVS(RO$(I)):PRINT"RO=";RO(I)
NEXT I
ERASE RO$
CLOSE#1
CLS
DIM DYNAMIC X(N4),Y(N4),K2(N4),L(N4),LV(N4),LL(N4)
PRINT"***********************************************************************"
PRINT"        €‘—…’ €Ž†ˆ„ŠŽ‘’ŽƒŽ €‚Ž‚…‘ˆŸ “ƒ‹…‚Ž„ŽŽ„Ž‰ ‘Œ…‘ˆ"
PRINT"***********************************************************************"
'PLAY"   o3 a b >c#4<ab>c#<bag#f#g#a b g# e"
'PLAY"   O3 a b >c#4<ab>c#<bag#f#bg# e a4"
PRINT
100 PRINT"‚‚…„ˆ’… ’…ŒŽ€ˆ—…‘Šˆ… “‘‹Ž‚ˆŸ"
PRINT"-------------------------------"
 INPUT"’…Œ…€’“€,K";T
 INPUT"„€‚‹…ˆ…,Œa";P
CLS
PRINT"************************************************************************"
PRINT"                         Ž„Ž†„ˆ’… Ÿ ‘—ˆ’€ž"
PRINT"************************************************************************"
U7=0
S=1
  FOR I=1 TO N4  '€‘—…’ ŠŽ””ˆ–ˆ…’Ž‚ €‘…„…‹…ˆŸ
  KR(I)=(EXP(5.372697*(1+W(I))*(1-TK(I)/T))*PK(I)/P)^0.25
  NEXT I
102 DV=1:V1=0:V=V1  '€—€‹Ž ˆ’’…€–ˆ‰ Ž €‘—…’“ ŒŽ‹œŽ‰ „Ž‹ˆ ƒ€‡Ž‚Ž‰ ”€‡›
  GOSUB 120
  Y1=Y
103 V2=V1+DV:V=V2
  GOSUB 120
 Y2=Y:PRINT"Y1=";Y1;"Y2=";Y2:DELAY(5)
 IF Y1<0 THEN V=0:GOTO 130
 IF Y2>0 THEN V=1:GOTO 130
105 V=(V1+V2)/2
 GOSUB 120
 IF ABS(Y)<=0.001 GOTO 130
 IF Y2*Y>0 THEN V2=V:GOTO 105
 V1=V:GOTO 105
 END
120 Y=0 'Ž„Žƒ€ŒŒ€ €•Ž†„…ˆŸ ‘“ŒŒ›,„‹Ÿ ˆ’’…€–ˆ‰
    FOR I=1 TO N4
    Y=Y+K(I)*(KR(I)-1)/(V*(KR(I)-1)+1)
    NEXT I
   RETURN
130 IF V>0.95 OR V<0.05 THEN
     CLS
     IF V>0.95 THEN V=1
     IF V<0.05 THEN V=0
LOCATE 12,19:PRINT"‘Œ…‘œ €•Ž„ˆ’‘Ÿ ‚ Ž„Ž”€‡ŽŒ ‘Ž‘’ŽŸˆˆ"
LOCATE 13,19:PRINT"ŒŽ‹œ€Ÿ „Ž‹Ÿ ƒ€‡Ž‚Ž‰ ”€‡› =";V
LOCATE 14,19:INPUT"“„…’… ‚‚Ž„ˆ’œ Ž‚›… ’…ŒŽ€ˆ—…‘Šˆ… “‘‹Ž‚ˆŸ(1-„€,0-…’)";U4
CLS:IF U4<>0 GOTO 100
    END IF
  FOR I=1 TO N4   'Ž…„…‹…ˆ… ‘Ž‘’€‚€ ”€‡
 X(I)=K(I)/(V*(KR(I)-1)+1)
 Y(I)=K(I)*KR(I)/(V*(KR(I)-1)+1)
 NEXT I
 FOR I=1 TO N4
 K2(I)=X(I)
 NEXT I
 U2=1  '“‘‹Ž‚ˆ… Ž…„…‹Ÿž™…… ‡€—…ˆ… Z(1-„‹Ÿ †ˆ„ŠŽ‰,0-„‹Ÿ ƒ€‡Ž‚Ž‰ ”€‡›)
 call sost
FOR I=12 TO 60
4 LOCATE 12,73-I:PRINT" ";
NEXT I
 FOR I=1 TO N4
 LL(I)=L(I)
 NEXT I
 FOR I=1 TO N4
 K2(I)=Y(I)
 NEXT I
 U2=0
 call sost
FOR I=1 TO 60
5 LOCATE 12,73-I:PRINT" ";
NEXT I
 FOR I=1 TO N4
 LV(I)=L(I)
 NEXT I
 FOR I=1 TO N4 '“’Ž—…ˆ… ŠŽ””.€‘…„…‹…ˆŸ
 KR(I)=KR(I)*LL(I)/LV(I)
 NEXT I
 S7=0
 FOR I=1 TO N4  'Ž‚…Š€ ’…ŒŽ„ˆ€Œˆ—…‘ŠŽƒŽ €‚Ž‚…‘‘ˆŸ -
 IF ABS(LL(I)/LV(I)-1)>0.1 GOTO 130
 NEXT I
 FOR I=1 TO N4
 IF ABS(KR(I)-1)>0.001 GOTO 140
 NEXT I
 IF S>3 GOTO 150
 S=S+1
 IF S=3 GOTO 102
 FOR I=1 TO N4
 KR(I)=SQR(EXP(5.372697*(1+W(I))*(1-TK(I)/T))*PK(I)/P)
 NEXT I
 GOTO 102
140CLS
   PRINT"------------------------------------------------------------"
   PRINT"    P    !    T    !    V    !    X    !    Y    !  KR   "
   PRINT"------------------------------------------------------------"
   PRINT USING"###.###";P;
   PRINT TAB(10)"!";
   PRINT USING"####.###";T;
   PRINT TAB(20)"!";
   PRINT USING"###.###";V;
   PRINT TAB(30)"!";
   PRINT TAB(40)"!";
   PRINT TAB(50)"!";
   FOR I=1 TO N4
   PRINT TAB(10)"!";
   PRINT TAB(20)"!";
   PRINT TAB(30)"!";
   PRINT USING"###.###";X(I);
   PRINT TAB(40)"!";
   PRINT USING"###.###";Y(I);
   PRINT TAB(50)"!";
   PRINT USING"####.###";KR(I)
   NEXT I
   PRINT"------------------------------------------------------------"
INPUT"‚›‚Ž„ˆ’œ € ˆ’…(1-„€,0-…’)";U4
INPUT"‚‘’€‚’… “Œ€ƒ“ ‚Š‹ž—ˆ’… ˆ’…. „‹Ÿ Ž„Ž‹†…ˆŸ €†Œˆ’… ‚‚Ž„";U3
IF U4<>1 GOTO 160
   LPRINT"------------------------------------------------------------"
   LPRINT"    P    !    T    !    V    !    X    !    Y    !  KR   "
   LPRINT"------------------------------------------------------------"
   LPRINT USING"###.###";P;
   LPRINT TAB(10)"!";
   LPRINT USING"####.###";T;
   LPRINT TAB(20)"!";
   LPRINT USING"###.###";V;
   LPRINT TAB(30)"!";
   LPRINT TAB(40)"!";
   LPRINT TAB(50)"!";
   FOR I=1 TO N4
   LPRINT TAB(10)"!";
   LPRINT TAB(20)"!";
   LPRINT TAB(30)"!";
   LPRINT USING"###.###";X(I);
   LPRINT TAB(40)"!";
   LPRINT USING"###.###";Y(I);
   LPRINT TAB(50)"!";
   LPRINT USING"####.###";KR(I)
   NEXT I
   LPRINT"------------------------------------------------------------"
GOTO 160
150 PRINT"‘Œ…‘œ €•Ž„ˆ’‘Ÿ ‚ Ž„Ž”€‡ŽŒ ‘Ž‘’ŽŸˆˆ"
   PRINT"ˆ‹ˆ ‚ Šˆ’ˆ—…‘ŠŽ‰ Ž‹€‘’ˆ."
   PRINT"(ˆ§¬¥­¨â¥ ¤ ¢«¥­¨¥ ¨ â¥¬¯¥à âãàã ?)"
   INPUT"1-„€,0-…’";U4
   IF U<>0 GOTO 100
160 INPUT"“„ˆ’… Ž„Ž‹†€’œ €‘—…’ Ž ’ŽŒ“ †… ‘Ž‘’€‚“(1-„€,0-…’)";U4
IF U4<>0 GOTO 100
    INPUT"“„ˆ’… ‘—ˆ’€’œ Ž Ž‚ŽŒ“ ‘Ž‘’€‚“(1-„€,0-…’)";U5
IF U5<>0 THEN CLEAR:GOTO 90
 END
sub sost
shared t,p,n4,tk(),pk(),w(),n(),k2(),l(),RO(),N1,U7,U2
DIM DYNAMIC A(N4),B(N4),C(N4,N4)
PLAY"B"
U7=U7+1
LOCATE 10,11+U7:PRINT U7
 S1=0
 FOR I=1 TO N4
 M=0.37464+1.54226*W(I)-0.26992*W(I)^2
 TPR=T/TK(I)
 ALF=(1+M*(1-SQR(TPR)))^2
 B(I)=0.0778*8.2057*TK(I)/PK(I):AH=0.45724*8.2057^2*TK(I)^2/PK(I):A(I)=AH*ALF
 S1=S1+K2(I)*B(I)
 NEXT I
 FOR I=1 TO N4
 FOR J=1 TO N4
6 LOCATE 12,11+J:PRINT"˜";
  IF FIX(N(I))=1 AND FIX(N(J))=4 THEN C(I,J)=0.02
  IF (FIX(N(I))=1 AND FIX(N(J))=12) AND FIX(N1)=0 THEN C(I,J)=0.02
  IF FIX(N(I))=6 THEN C(I,J)=0.12
  IF FIX(N(I))=17 THEN C(I,J)=0.15
  IF FIX(N(I))=1 AND FIX(N(J))=14 THEN C(I,J)=0.025
  IF FIX(N(I))=1 AND FIX(N(J))=15 THEN C(I,J)=0.025
  IF FIX(N(I))=1 AND FIX(N(J))=16 THEN C(I,J)=0.035
  IF (FIX(N(I))=1 AND FIX(N(J))>=18) AND J=FIX(N4-N1+1) THEN C(I,J)=-0.06+0.13*RO(1)
  IF (FIX(N(I))=1 AND FIX(N(J))>=18) AND J<>FIX(N4-N1+1) THEN C(I,J)=-0.06+0.13*RO(J-N4+N1)
 C(J,I)=C(I,J)
 NEXT J
FOR K=12 TO 60
LOCATE 12,73-K:PRINT" ";
NEXT K
 NEXT I
 S2=0
 FOR I=1 TO N4
 FOR J=1 TO N4
 S2=S2+K2(I)*K2(J)*(1-C(I,J))*SQR(A(I)*A(J))
 NEXT J
 NEXT I
 A=S2*P/(8.2057^2*T^2)
 B=S1*P/(8.2057*T)
M1=1-B:M2=A-3*B^2-2*B:M3=A*B-B^2-B^3
    Z2=3:F2=Z2^3-M1*Z2^2+M2*Z2-M3
170 Z1=Z2-0.1:F1=Z1^3-M1*Z1^2+M2*Z1-M3
    IF F1*F2>0 THEN Z2=Z1:F2=F1:GOTO 170
180  Z3=(Z1+Z2)/2:F=Z3^3-M1*Z3^2+M2*Z3-M3
    IF ABS(F)<=0.0001 GOTO 190
    IF F2*F>0 THEN Z2=Z3:GOTO 180
    Z1=Z3:GOTO 180
190 M11=-M1+Z3:M22=M2+Z3*(-M1+Z3)
    D=M11^2-4*M22
 IF D<0 THEN Z=Z3:GOTO 200
 Z1=(-M11+SQR(D))/2:Z2=(-M11-SQR(D))/2:PRINT"U2=";U2
 IF FIX(U2)=0 GOTO 195:REM …‘‹ˆ U2=1 ’Ž €‘—…’ ‚…„…’‘Ÿ „‹Ÿ †.”€‡›
    IF Z1>0 AND Z1<Z3 THEN Z=Z1
    IF Z2>0 AND Z2<Z1 THEN Z=Z2
    IF Z3<Z1 AND Z3<Z2 THEN Z=Z3
GOTO 200
195 IF Z1>Z2 AND Z1>Z3 THEN Z=Z1
    IF Z2>Z1 AND Z2>Z3 THEN Z=Z2
    IF Z3>Z1 AND Z3>Z2 THEN Z=Z3
200 FOR I=1 TO N4
      S3=0
    FOR J=1 TO N4
     S3=S3+K2(J)*(1-C(I,J))*SQR(A(I)*A(J))
    NEXT J
     KSI=EXP(B(I)*(Z-1)/S1-LOG(Z-B)-A/(2*SQR(2)*B)*(2*S3/S2-B(I)/S1)*LOG((Z+2.414*B)/(Z-0.414*B)))
     L(I)=KSI*K2(I)*P
    NEXT I
ERASE A,B,C
end sub