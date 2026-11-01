 PROGRAM MGUA;
uses Crt;
LABEL 65,33,11,13,93,51,59,49,47,41,120;
    TYPE MASS=ARRAY[1..100,1..23] OF real;
    TYPE MASSMAL=ARRAY[1..22,1..23] OF extended;
    TYPE VEKTy=ARRAY[1..100] OF real;
    type vekt=array[1..23] of extended;
    TYPE VEKTINT=ARRAY[1..23] OF longint;
VAR X,UD,YS:MASS;
    PS,FS,FS1,QN:MASSMAL;
    IA,IP,ID:VEKTINT;
    Y:vekty;
    OS,OA,P,P1,R:VEKT;
    MO,IQ,KCH,IPRZ,FFF,PARAM,
    I,J,K,L,M,N,N1,LM,IT,MP,MA1,NB,KB,KB1,MPR,MA,JF:longint;
    LST:TEXT;
    OSH,OSH2,OSH1,Z,AF,R5,R1,R7:real;



PROCEDURE FILREA;
VAR NFIL:string;
    FL:TEXT;
    I,J:longint;
BEGIN
   WRITELN('“Š€†ˆ’… ˆŒŸ ”€‰‹€ ‘ Œ€’ˆ–…‰ €‹ž„…ˆ‰');
   readln(NFIL);
   WRITELN(NFIL);
   ASSIGN (FL,NFIL);
   RESET (FL);
 FOR I:=1 TO M DO
  BEGIN
   FOR J:=1 TO L DO
   READ(FL,X[I,J]);
   READ(FL,Y[I]);
     END;
  CLOSE(FL);
 WRITE('€‘…—€’€’œ ‘Ž„…†ˆŒŽ… ”€‰‹€ (1-„€,0-…’)-?');READLN(I);
 IF I=1 THEN
 BEGIN
  WRITELN(LST,'‚ • Ž „  › …     „ €   › …');
  FOR I:=1 TO M DO
   BEGIN
    FOR J:=1 TO L DO
    WRITE(LST,X[I,J]:12:5,' ');
   WRITELN(LST,Y[I]:12:5)
  END;
 END;
END;




PROCEDURE FILMONITOR;
LABEL 1;
VAR NFIL:string;
    I,J:longint;
    FL:TEXT;
BEGIN
WRITELN('‚‚Ž„ˆ’… ˆ‘•Ž„›… „€›…');
FOR I:=1 TO M DO
BEGIN
FOR J:=1 TO L DO
 BEGIN
 WRITE('X[',I,',',J,']=');
 READLN(X[I,J]);
 END;
END;
FOR I:=1 TO M DO
 BEGIN
  WRITE('Y[',I,']=');
  READLN(Y[I])
 END;
1: WRITE('‡€ˆ‘€’œ „€›… € „ˆ‘Š (1-„€,0-…’)');
   READLN(I);
   IF I=1 THEN
   BEGIN
    WRITELN('Ž„ Š€ŠˆŒ ˆŒ……Œ');
    READln(NFIL);
    ASSIGN(FL,NFIL);
    REWRITE(FL);
    FOR I:=1 TO M DO
    BEGIN
    FOR J:=1 TO L DO
    WRITE(FL,X[I,J],' ');
    WRITELN(FL,Y[I]);
    END;
  WRITELN('ˆ”ŽŒ€–ˆŸ ‡€ˆ‘€€ € „ˆ‘Š ‘ ˆŒ……Œ-',NFIL);
  CLOSE(FL);
 END
  ELSE
   IF I=0 THEN
   WRITELN('ˆ”ŽŒ€–ˆž € „ˆ‘Š … ˆ˜…Œ')
    ELSE
    GOTO 1;
END;


PROCEDURE PROG1;
VAR I,K:longint;
BEGIN
  WRITE(LST,' … ‡ “ ‹ œ ’ € ’ ›     €    Ž Š ‘ ˆ Œ € – ˆ ˆ     ˆ');
  WRITE(LST,'    Š ‘ ’  €  Ž ‹ Ÿ – ˆ ˆ    Ž   ‚ ›   €   › Œ');
  WRITELN(LST,'   Œ Ž „ … ‹ Ÿ Œ');
  WRITELN(LST,'Ž  “ — € ž ™ € Ÿ     Ž ‘ ‹ … „ Ž ‚ € ’… ‹ œ  Ž ‘ ’ œ');
  FOR I:=1 TO M DO
   BEGIN
    FOR K:=1 TO NB DO
     WRITE(LST,YS[I,K]:13:7,' ');
    WRITELN(LST,Y[I]:13:7);
     IF I=MO THEN WRITELN(LST,
     '  Ž ‚ …  Ž —  € Ÿ    Ž ‘ ‹ … „ Ž ‚ € ’ … ‹ œ  Ž ‘ ’ œ')
     ELSE
     IF I=MA THEN WRITELN(LST,
     ' Š ‡ € Œ …  € – ˆ Ž   € Ÿ     Ž ‘ ‹ … „ Ž ‚ € ’ … ‹ œ  Ž ‘ ’ œ');
   END;
 END;


FUNCTION EXPONA(A,B:longint):longint;
VAR E,I:longint;
BEGIN
 E:=1;
 FOR I:=1 TO B DO
 E:=E*A;
 EXPONA:=E;
END;








FUNCTION EXPO(A:extended;B:longint):extended;
VAR E:extended;  I:longint;
BEGIN
 E:=1.0;
 FOR I:=1 TO B DO
 E:=E*A;
  EXPO:=E;
END;

PROCEDURE GAUSS(VAR A:MASSMAL;
                    N,N1:longint;
                VAR X:VEKT);
 LABEL 1,3,6,12,14;
 VAR L,K,N2,NL2,J,K1,L1,NI,I,NI1,M,KGA,ipr,jpr:longint;
     T,AP:extended;
 BEGIN
    L:=0;
1:  L:=L+1;
    FOR K:=L TO N DO
    IF A[K,L]<>0.0 THEN GOTO 3;
    GOTO 12;
3:  IF K=L THEN GOTO 6;
    FOR M:=L TO N1 DO
     BEGIN
      T:=A[L,M];
      A[L,M]:=A[K,M];
      A[K,M]:=T
     END;
6:  N2:=N+2;
    NL2:=N2-L;
    FOR J:=1 TO NL2 DO
    begin
    {    writeln('a=',a[l,l]);       }
    A[L,N2-J]:=A[L,N2-J]/A[L,L];
    end;
    K1:=K+1;
    FOR I:=K1 TO N DO
     BEGIN
      T:=A[I,L];
      L1:=L+1;
      FOR J:=L1 TO N1 DO
       A[I,J]:=A[I,J]-A[L,J]*T
     END;
    IF L<>N THEN GOTO 1;
    FOR I:=1 TO N DO
     BEGIN
     X[N1-I]:=A[N1-I,N1];
      NI:=N-I;
      NI1:=NI+1;
      FOR K:=1 TO NI DO
       BEGIN
        AP:=A[NI1-K,N1-I];
        IF (ABS(AP))>=0.0 THEN
        A[NI1-K,N1]:=A[NI1-K,N1]-A[NI1-K,N1-I]*X[N1-I];
       END;
     END;
    KGA:=1;
    GOTO 14;
12: KGA:=2;
    WRITELN(' … ’    … ˜ …  ˆ Ÿ   “   ‘ ˆ ‘ ’ … Œ ›   “  € ‚  …  ˆ ‰ ');
14: END;


PROCEDURE MAX(VAR G:VEKT;JE:longint;
              VAR C:real;
              VAR M:longint);
LABEL 20;
VAR I:longint;
  BEGIN
     C:=G[1];
     M:=1;
     I:=2;
20:  IF C<G[I] THEN
     BEGIN
     C:=G[I];
     M:=I
     END;
     I:=I+1;
     IF I<=JE THEN GOTO 20;
  END;


PROCEDURE PAP(VAR ID:VEKTINT;N,N1,IS,IS1:longint;FS:MASSMAL;
              VAR P:VEKT;
              VAR IA:VEKTINT;
              VAR QN:MASSMAL;R:VEKT);
VAR K,I,J:longint;
BEGIN
    K:=0;
    FOR I:=1 TO N DO
     BEGIN
      P[I]:=0.0;
      IF(ID[I]<>0) THEN
      BEGIN
       K:=K+1;
       IA[K]:=I;
       QN[K,IS+1]:=FS[I,N+1];
      END;
     END;
    FOR I:=1 TO IS DO
     BEGIN
      FOR J:=1 TO IS DO
       QN[I,J]:=FS[IA[I],IA[J]];
     END;
     GAUSS(QN,IS,IS1,R);
     FOR K:=1 TO IS DO
      P[IA[K]]:=R[K]
END;


PROCEDURE DICH(JQ:longint;
               VAR ID:VEKTINT;JN,JS:longint);
LABEL 16;
VAR JL,I,JN1,JC:longint;
BEGIN
    JL:=JQ;
    FOR I:=1 TO JN DO
    ID[I]:=0;
    IF JS<>1 THEN
    BEGIN
    I:=0;
    JN1:=JN+1;
16: I:=I+1;
    IF JS<=JL THEN
    BEGIN
     JC:=JL DIV JS;
     ID[JN1-I]:=JL-JC*JS;
     JL:=JC;
     GOTO 16
    END;
    ID[JN1-I]:=JL
    END;
   END;


PROCEDURE FORD(ICT,L,M,N:longint;X:MASS;
               VAR UD:MASS;IP:VEKTINT);
LABEL 25,29;
VAR IC,JF,ICT1,IS,I,J:longint;

BEGIN
   WRITELN(LST,'‘’“Š’“€ Ž‹ŽƒŽ Ž‹ˆŽŒ€');
   IC:=0;
   JF:=0;
   ICT1:=ICT+1;
25:DICH(IC,IP,L,ICT1);
   IC:=IC+1;
   IS:=0;
   FOR J:=1 TO L DO
   IS:=IS+IP[J];
   IF IS>ICT THEN GOTO 25;
   JF:=JF+1;
   FOR J:=1 TO L DO
   WRITE(LST,IP[J]:3,' ');
   WRITELN(LST);
   FOR I:=1 TO M DO
   BEGIN
   UD[I,JF]:=1.0;
   IF JF<=1 THEN GOTO 29;
   FOR J:=1 TO L DO
   BEGIN
{   writeln('ip=',ip[j]);     }
   IF IP[J]>0 THEN UD[I,JF]:=UD[J,JF]*EXPO(X[I,J],IP[J]);
   END;
29:END;
   IF IP[1]<ICT THEN GOTO 25
END;


PROCEDURE NOS(VAR N,N1,ML,MB,M1:longint;UD:MASS;Y:VEKTy;
              VAR FS:MASSMAL);
VAR I,J,K:longint;
BEGIN
FOR I:=1 TO N DO
 BEGIN
  FS[I,N1]:=0.0;
  FOR J:=MB TO M1 DO
  FS[I,N1]:=FS[I,N1]+UD[J,I]*Y[J];
 END;
FOR I:=1 TO N DO
 BEGIN
 FOR J:=1 TO N DO
  BEGIN
  FS[I,J]:=0.0;
  FOR K:=MB TO M1 DO
  begin
{     writeln('fs=',fs[i,j],' ud1=',ud[k,i], ' ud2=',ud[k,j]);   }
  FS[I,J]:=FS[I,J]+UD[K,I]*UD[K,J];
  end;
  END;
 END;
END;

(* £®«®¢­ ï ¯à®£à ¬¬¬  ¬£ã    *)
BEGIN
ClrScr;
ASSIGN(LST,'rez');
REWRITE(LST);
65: WRITELN('‚‚…„ˆ’… Šˆ’…ˆ‰ Ž’Ž€ ŒŽ„…‹…‰:(1-…ƒ“‹ŸŽ‘’ˆ,2-…‘Œ…™…Ž‘’ˆ');
    WRITE('3-KOMˆˆŽ‚€›‰ )'); READLN(LM);
    IF((LM<1) OR (LM>3)) THEN GOTO 65;
    WRITE('Œ€Š‘ˆŒ€‹œ€Ÿ ‘’……œ Ž‹ˆŽŒ€-'); READLN(IT);
    WRITE('—ˆ‘‹Ž ’Ž—…Š €‹ž„…ˆŸ - ');READLN(M);
    WRITE('—ˆ‘‹Ž …‡€‚ˆ‘ˆŒ›• ……Œ…›• -');READLN(L);
    WRITE('—ˆ‘‹Ž ’Ž—…Š  Ž‚…Ž—Ž‰ Ž‘‹…„Ž‚€’…‹œŽ‘’ˆ-');READLN(MP);
    WRITE('—ˆ‘‹Ž ’Ž—…Š Š‡€Œ…€–ˆŽŽ‰ Ž‘‹…„Ž‚€’…‹œŽ‘’ˆ-');READLN(MA1);
    WRITELN('‚›—ˆ‘‹ˆŒ —ˆ‘‹Ž ’Ž—…Š Ž“—€ž™…‰ Ž‘‹…„Ž‚€’…‹œŽ‘’ˆ');
    MO:=M-MA1-MP;
    WRITELN('ŽŽ €‚Ž-',MO:3);
    WRITE('‘‚ŽŽ„€ ‚›Ž€ -');READLN(NB);
33: WRITE('ˆ‡€Š …—€’ˆ …‡“‹œ’€’Ž‚ €ŽŠ‘ˆŒ€–ˆˆ (1-„€,0-…’)-');
    READLN(IPRZ);
 11: WRITE('ˆ‘•Ž„›… „€›… —ˆ’€’œ ‘ ”€‰‹€ (0-…’, 1-„€)?');
    READLN(FFF);
    IF FFF=1 THEN
    BEGIN
       FILREA;
       FOR I:=1 TO M DO
        BEGIN
         FOR J:=1 TO L DO
         WRITE(X[I,J],' ');
        WRITELN(Y[I]);
        END;
        GOTO 13
    END
    ELSE
     IF FFF=0 THEN
     BEGIN
     FILMONITOR;
     GOTO 13;
     END
     ELSE GOTO 11;
13: N:=1;
    FOR J:=1 TO L DO
    N:=(N*(IT+J)) DIV J;
    {IF N>15  THEN
    BEGIN
    WRITELN('—ˆ‘‹Ž ‘‹€ƒ€…Œ›• ŒŽƒŽ—‹…€ Ž‹œ˜… 15 ˆ €‚Ž-',N:10);
    WRITELN(' €  Ž ’ €   Ž ‘ ’ €  Ž ‚ ‹ …  € ');
    WRITELN('‘ˆ‡œ’… ‘’……œ ŒŽƒŽ—‹…€ ˆ‹ˆ ˆ‘Š‹ž—ˆ’… …ŠŽ’Ž›… ”€Š’Ž›') ;
    GOTO 120;
    END;}  { § ªà®¥¬ ­>15}
    KCH:=EXPONA(2,N)-1;
    WRITELN(LST,'—ˆ‘‹Ž ‘‹€ƒ€…Œ›• Ž‹ˆŽŒ€=',N:2);
    WRITELN(LST,'ŠŽ‹ˆ—…‘’‚Ž —€‘’›• Žˆ‘€ˆ‰ ŒŽ„…‹ˆ=',KCH:6);
    WRITELN('—ˆ‘‹Ž ‘‹€ƒ€…Œ›• Ž‹ˆŽŒ€=',N:2);
    WRITELN('ŠŽ‹ˆ—…‘’‚Ž —€‘’›• Žˆ‘€ˆ‰ ŒŽ„…‹ˆ=',KCH:6);
    writeln('Ž„Ž‹†…ˆ… Ž ‹žŽ‰ Š‹€‚ˆ˜… ...');
    REPEAT UNTIL KEYPRESSED;
    MPR:=MO+1;N1:=N+1; MA:=M-MA1;
    FORD(IT,L,M,N,X,UD,IP);
    PARAM:=1;
    NOS(N,N1,M,PARAM,MO,UD,Y,FS);
    NOS(N,N1,M,MPR,MA,UD,Y,FS1);
    FOR IQ:=1 TO KCH DO
    BEGIN
    WRITELN('IQ=',IQ);
     DICH(IQ,ID,N,2);
     KB:=0;
     FOR I:=1 TO N DO
     KB:=KB+ID[I];
     KB1:=KB+1;
     PAP(ID,N,N1,KB,KB1,FS,P,IA,QN,R);
     PAP(ID,N,N1,KB,KB1,FS1,P1,IA,QN,R);
     IF LM=2 THEN  GOTO 93;
     OSH:=0.0;
     FOR J:=MPR TO MA DO
     BEGIN
      Z:=0.0;
      FOR I:=1 TO N DO
      Z:=Z+P[I]*UD[J,I];
      OSH:=OSH+SQR(Z-Y[J]);
     END;
     OSH1:=SQRT(OSH)/MP;
     IF LM<2 THEN GOTO 51;
93:  OSH:=0.0;
     FOR J:=1 TO MA DO
      BEGIN
       Z:=0.0;
       AF:=0.0;
       FOR I:=1 TO N DO
        BEGIN
         Z:=Z+P[I]*UD[J,I];
         AF:=AF+P1[I]*UD[J,I]
        END;
       OSH:=OSH+SQR(Z-AF)
      END;
     OSH2:=SQRT(OSH)/MA;
     IF LM=2 THEN
     OSH:=OSH2;
     GOTO 59;
51:  IF LM=1 THEN
     OSH:=OSH1;
     GOTO 59;
     OSH:=OSH1+OSH2;
59:  IF IQ<=NB THEN
      BEGIN
      JF:=IQ;
      GOTO 47;
      END;
     IF NB=1 THEN
      BEGIN
      R5:=OS[1];
      GOTO 49;
      END
      ELSE
       MAX(OS,NB,R5,JF);
49:  IF OSH>=R5 THEN GOTO 41;
47:  OS[JF]:=OSH;
     FOR I:=1 TO N DO
     PS[I,JF]:=P[I];
41: END;
    ClrScr;
    IF LM=1 THEN
    WRITELN(LST,'OTŽ Ž Šˆ’…ˆž …ƒ“‹ŸŽ‘’ˆ')
    ELSE IF LM=2 THEN
    WRITELN(LST,'Ž’Ž Ž Šˆ’…ˆž …‘Œ…™…Ž‘’ˆ')
      ELSE WRITELN(LST,'Ž’Ž Ž ŠŽŒˆˆŽ‚€ŽŒ“ Šˆ’…ˆž');
    WRITELN(LST,'ƒ ‹ “  ˆ  €   Œ ˆ  ˆ Œ “ Œ €');
    FOR I:=1 TO NB DO
    WRITE(LST,OS[I]:13:7,' ');
    WRITELN(LST);
    FOR K:=1 TO NB DO
     BEGIN
      FOR I:=1 TO N DO
       BEGIN
        IF PS[I,K]<>0.0 THEN
         ID[I]:=1
        ELSE
         ID[I]:=0;
       END;
      PARAM:=1;
      NOS(N,N1,M,PARAM,MA,UD,Y,FS);
      KB:=0;
      FOR I:=1 TO N DO
      KB:=KB+ID[I];
      KB1:=KB+1;
      PAP(ID,N,N1,KB,KB1,FS,P,IA,QN,R);
      FOR I:=1 TO N DO
      PS[I,K]:=P[I];
      OSH:=0.0;
      AF:=0.0;
      FOR J:=1 TO M DO
       BEGIN
        Z:=0.0;
        FOR I:=1 TO N DO
        Z:=Z+PS[I,K]*UD[J,I];
        YS[J,K]:=Z;
        OSH:=OSH+SQR(Z-Y[J]);
        AF:=AF+SQR(Y[J]);
        IF J=MA THEN
        BEGIN
         R5:=OSH;
         R1:=AF;
        END;
       END;
      R7:=R5/R1;
      OS[K]:=SQRT(R7);
      IF MA1<=0.0 THEN
      OA[K]:=0.0
      ELSE
      OA[K]:=SQRT((OSH-R5)/(AF-R1));
     END;
     WRITELN(LST,'Š Ž  ” ” ˆ – ˆ …  ’ ›    ‘ ’  “ Š ’ “  ');
     FOR J:=1 TO NB DO
      BEGIN
       FOR I:=1 TO N DO
       WRITE(LST,PS[I,J]:15:7,' ');
      WRITELN(LST);
      END;
      IF IPRZ=1 THEN
      PROG1;
 {     WRITELN(LST,'‘ Š Ž    Ž ‘ ‹ …   € „ €  ’ € – ˆ ˆ');
      FOR I:=1 TO NB DO
      WRITE(LST,OS[I]:15:7,' ');
      WRITELN(LST);}
      WRITELN(LST,'Ž ˜ ˆ  Š €    €    Š ‡ € Œ …  …');
      FOR I:=1 TO NB DO
      WRITE(LST,OA[I]:15:7,' ');
      WRITELN(LST);
      close(lst);
 120: END.
