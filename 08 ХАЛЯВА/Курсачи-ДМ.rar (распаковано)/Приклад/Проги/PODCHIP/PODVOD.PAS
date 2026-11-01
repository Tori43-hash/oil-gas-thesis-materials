Program Kursovoy;
{$m 16384,0,40000}
USES CRT,Printer,GRAPH,dos;
  {$I initgrap.inc}
  {$I sline.inc}
  {$I printer.inc}
   VAR L:ARRAY[1..6] OF REAL;
       Fr1,Ft1,Fa1,La1:ARRAY[1..5] OF REAL;
       Fr2,Ft2,Fa2,La2:ARRAY[1..5] OF REAL;
       Fr3,Ft3,Fa3,La3:ARRAY[1..5] OF REAL;
       Fr4,Ft4,Fa4,La4:ARRAY[1..5] OF REAL;
       X,XA,I,YA,YB,XL1,XL2,X1,X2,Y1,Y2,CV,AF,EA1,EB1,
       A,K,XT,YT,XF,YF,eA,eB,AF1,AA,VOPROS:INTEGER;
       A1,C1,F,Raz,Rbz,Ray,Rby,P,{Проверка}F3T,
       A23,Fa,Ra,Rb,N,KT,KB,V,D1,LH:REAL;
       is,ls,C:string;
       CH:CHAR;
       data:text;
   LABEL 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,
	 25,26,27,28,29,30,31,32,161,162,163,164,165,166;
{              *****************╔╦╦╦╦╦╦╦╦╦╗*****************
********************************╠ПРОЦЕДУРЫ╣***********************************
		      **********╚╩╩╩╩╩╩╩╩╩╝**********                                    }
Procedure Opora1;
  BEGIN
   CIRCLE(140,154,3);LINE(131,168,140,154);LINETO(149,168);
   LINE(125,168,155,168);
   BAR(125,169,155,175);SETCOLOR(11);OUTTEXTXY(140,135,'A');SETCOLOR(13);
  END;
Procedure Opora2;
  BEGIN
   CIRCLE(X,154,3);LINETO(X-9,168);LINETO(X+9,168);LINETO(X,154);
   CIRCLE(X,172,3);LINE(X-15,176,X+15,176);
   BAR(X-15,177,X+15,182);SETCOLOR(11);OUTTEXTXY(X,135,'B');SETCOLOR(13);
  END;

PROCEDURE LM(I,XA,CV:INTEGER);
  BEGIN
   SETTEXTSTYLE(0,0,1);SETCOLOR(CV);str(i:2,is);
   OUTTEXTXY(XA,236,'L');outtextxy(XA,236,is);
  END;

PROCEDURE LM1(I,YA:INTEGER);
  BEGIN
   SETCOLOR(11);SETTEXTSTYLE(1,0,1);OUTTEXTXY(50,YA,'L');
   str(i:2,is);OUTTEXTXY(52,YA,IS);
   OUTTEXTXY(80,YA,'=');OUTTEXTXY(150,YA,'mm');TEXTCOLOR(11);
  END;

PROCEDURE ERROR(YA:INTEGER);
  BEGIN
   SETTEXTSTYLE(0,0,3);SETCOLOR(12);
   OUTTEXTXY(250,400,'ОШИБКА');DELAY(3000);
   SETCOLOR(0);OUTTEXTXY(250,400,'ОШИБКА');
   SETTEXTSTYLE(0,0,3);OUTTEXTXY(91,YA,'██');SETCOLOR(11);
  END;

PROCEDURE ERROR1(XAA,YA:INTEGER);
  BEGIN
   SETTEXTSTYLE(0,0,3);SETCOLOR(0);
   OUTTEXTXY(XAA,YA,'██');SETCOLOR(11);SETTEXTSTYLE(0,0,1);
  END;

PROCEDURE DL1;
  BEGIN
  LINE(70,149,70,250);SLINE(3,70,245,140,245);
  END;
PROCEDURE DL2;
   BEGIN
   LINE(X,149,X,250);LINE(X+90,149,X+90,250);SLINE(3,X,245,X+90,245);
   END;
PROCEDURE DL3;
  BEGIN
   LINE(X+70,149,X+70,250);SLINE(3,X,245,X+70,245);
   END;

PROCEDURE RAMKA;
   BEGIN
    SETCOLOR(4);
    MOVETO(293,5);LINETO(3,5);LINETO(3,475);LINETO(637,475);
    LINETO(637,5);LINETO(335,5);
    MOVETO(293,2);LINETO(1,2);LINETO(1,478);LINETO(639,478);
    LINETO(639,2);LINETO(335,2);
    SETTEXTSTYLE(0,0,1);SETCOLOR(9);OUTTEXTXY(295,0,'УГНТУ');
   END;

PROCEDURE RAM(CV:INTEGER);
   BEGIN
  SETLINESTYLE(0,0,3);SETCOLOR(CV);MOVETO(240,310);LINETO(240,345);
  LINETO(405,345);LINETO(405,310);LINETO(240,310);
  MOVETO(235,305);LINETO(235,350);LINETO(410,350);LINETO(410,305);
  LINETO(235,305);SETLINESTYLE(0,0,1);
   END;

PROCEDURE EL(eA,eB,Z:Integer;Var eA1,eB1,AF:Integer);
   LABEL 1;
   BEGIN
    SETCOLOR(14);Ellipse(EA,EB,0,360,20,50);AF:=0;
    SETCOLOR(11);LINE(EA+16,EB-32,EA-17,EB+30);LINE(EA,EB-50,EA,EB+50);
    SETCOLOR(1);ELLIPSE(EA+16,EB-32,0,360,2,2);
    ELLIPSE(EA-17,EB+30,0,360,2,2);ELLIPSE(EA,EB-50,0,360,2,2);
    ELLIPSE(EA,EB+50,0,360,2,2);SETCOLOR(11);SETTEXTSTYLE(0,0,1);
    OUTTEXTXY(EA-29,EB+23,'1');OUTTEXTXY(EA-10,EB-60,'2');
    OUTTEXTXY(EA+21,EB-43,'3');OUTTEXTXY(EA+5,EB+55,'4');
  is:='ВВЕДИТЕ ТОЧКУ ЗАЦЕПЛЕНИЯ (1-4)?';
  ls:='ПРОПУСТИТЬ - ЛЮБАЯ ДРУГАЯ КЛАВИША';
  SETTEXTSTYLE(0,0,1);setcolor(10);OUTTEXTXY(191,455,is);
  OUTTEXTXY(185,465,ls);CH:=READKEY;setcolor(0);
  OUTTEXTXY(191,455,is);OUTTEXTXY(185,465,ls);
  IF (CH=#49) THEN Begin EA1:=EA-17;EB1:=EB+30;AF:=1;End;
  IF (CH=#50) THEN Begin EA1:=EA;EB1:=EB-50;AF:=2;End;
  IF (CH=#51) THEN Begin EA1:=EA+16;EB1:=EB-32;AF:=3;End;
  IF (CH=#52) THEN Begin EA1:=EA;EB1:=EB+50;AF:=4;End;
    SETCOLOR(0);Ellipse(EA,EB,0,360,20,50);
    LINE(EA+16,EB-32,EA-17,EB+30);LINE(EA,EB-50,EA,EB+50);
    ELLIPSE(EA+16,EB-32,0,360,2,2);
    ELLIPSE(EA-17,EB+30,0,360,2,2);ELLIPSE(EA,EB-50,0,360,2,2);
    ELLIPSE(EA,EB+50,0,360,2,2);SETTEXTSTYLE(0,0,1);
    OUTTEXTXY(EA-29,EB+23,'1');OUTTEXTXY(EA-10,EB-60,'2');
    OUTTEXTXY(EA+21,EB-43,'3');OUTTEXTXY(EA+5,EB+55,'4');
  IF Z=1 THEN BEGIN SETCOLOR(10);LINE(EA,EB+1,EA,EB+53);SETCOLOR(13);
	  LINE(EA,EB,EA-23,EB);SETLINESTYLE(0,0,3);SETCOLOR(6);
	  LINE(EA-1,EB,EA+23,EB);GOTO 1;END;
  IF Z=2 THEN BEGIN SETCOLOR(10);LINE(EA,EB+1,EA,EB+53);SETCOLOR(13);
	  LINE(EA,EB,EA+23,EB);SETLINESTYLE(0,0,3);SETCOLOR(6);
	  LINE(EA,EB,EA-23,EB);GOTO 1;END;
    SETCOLOR(10);LINE(EA,EB+1,EA,EB+53);
    SETLINESTYLE(0,0,3);SETCOLOR(6);LINE(EA-23,EB,EA+23,EB);
1:  SETLINESTYLE(0,0,1);
   END;

PROCEDURE KLAVA;
   LABEL 1;
   BEGIN
SETTEXTSTYLE(0,0,2);is:='НАЖМИТЕ ЛЮБУЮ КЛАВИШУ';REPEAT
SETCOLOR(1);OUTTEXTXY(150,455,is);DELAY(150);IF KEYPRESSED THEN GOTO 1;
SETCOLOR(4);OUTTEXTXY(150,455,is);DELAY(150);IF KEYPRESSED THEN GOTO 1;
SETCOLOR(13);OUTTEXTXY(150,455,is);DELAY(150);IF KEYPRESSED THEN GOTO 1;
SETCOLOR(14);OUTTEXTXY(150,455,is);DELAY(150);IF KEYPRESSED THEN GOTO 1;
SETCOLOR(15);OUTTEXTXY(150,455,is);DELAY(1000);IF KEYPRESSED THEN GOTO 1;
SETCOLOR(0);OUTTEXTXY(150,455,is);DELAY(500);UNTIL KEYPRESSED;
1:READKEY;
   END;

PROCEDURE NOMER_3(AA:INTEGER);
VAR AB:INTEGER;
   BEGIN
AB:=0;IF AA<>0 THEN AB:=AA+10;
line(50+AA,310,60+AA,300);line(50+AA,330,60+AA,340);
line(70+AA,300,80+AA,310);line(70+AA,340,80+AA,330);
line(240-AB,310,260-AB,310);line(240-AB,330,260-AB,330);
   END;

PROCEDURE CILA;
   BEGIN
    SETCOLOR(12);SETTEXTSTYLE(2,0,0);
    SLINE(A,X1,Y1,X2,Y2);SETCOLOR(14);OUTTEXTXY(XT,YT,C);
    OUTTEXTXY(XT+6,YT,CH);OUTTEXTXY(XT+12,YT,IS);
    TEXTCOLOR(14);SETTEXTSTYLE(1,0,1);GOTOXY(39,21);
	 OUTTEXTXY(258,314,C);OUTTEXTXY(270,314,CH);OUTTEXTXY(279,314,IS);
	 OUTTEXTXY(291,314,'=');OUTTEXTXY(365,314,'H');
	 SETTEXTSTYLE(2,0,0);
    READLN(F);
     IF F<0 THEN BEGIN SETCOLOR(0);SLINE(A,X1,Y1,X2,Y2);A:=A+K;
		       IF A=0 THEN A:=2;
		       SETCOLOR(12);SLINE(A,X1,Y1,X2,Y2);END;
     IF F=0 THEN BEGIN
	     SETCOLOR(0);SLINE(A,X1,Y1,X2,Y2);OUTTEXTXY(XT,YT,C);
	     OUTTEXTXY(XT+6,YT,CH);OUTTEXTXY(XT+12,YT,IS);END;
   END;

PROCEDURE CILA1;
   LABEL 1;
   BEGIN
    SETCOLOR(10);SLINE(3,x1,Y1,x2,Y2);
    settextstyle(2,1,0);OUTTEXTXY(xt,yt,'L ');OUTTEXTXY(xt,yt,ch);
    OUTTEXTXY(xt,yt-7,IS);settextstyle(2,0,0);
    TEXTCOLOR(10);SETTEXTSTYLE(1,0,1);
    GOTOXY(39,21);OUTTEXTXY(250,314,'L ');OUTTEXTXY(262,314,ch);
    OUTTEXTXY(273,314,IS);
    OUTTEXTXY(284,314,'=');OUTTEXTXY(348,314,'mm');
1:  READLN(F);
    IF F<=0 THEN BEGIN SETTEXTSTYLE(0,0,3);SETCOLOR(12);
       OUTTEXTXY(250,400,'ОШИБКА');DELAY(3000);SETCOLOR(0);
       OUTTEXTXY(250,400,'ОШИБКА');SETTEXTSTYLE(1,0,1);
       OUTTEXTXY(300,315,'█████');GOTOXY(39,21);;GOTO 1;END;
   END;

PROCEDURE NETU(X11,Y11:INTEGER);
   BEGIN
    SETCOLOR(0);SETTEXTSTYLE(1,0,1);ls:='███████████████';
    OUTTEXTXY(X11,Y11,ls);OUTTEXTXY(X11,Y11+5,ls);
    SETTEXTSTYLE(2,0,0);ls:='';
   END;

PROCEDURE SILA;
   BEGIN
    STR(I,IS);A:=2;C:='F';
 IF AF=1 THEN Begin X1:=EA1-7;Y1:=EB1;X2:=EA1+17;Y2:=EB1-30;
		    XT:=X2-2;YT:=Y2-13;CH:='r';CILA;NETU(250,314);FR1[I]:=F;
		 X1:=EA1-7;Y1:=EB1-45;X2:=EA1-7;Y2:=EB1;A:=1;
		 xt:=x2-21;yt:=y2-43;CH:='t';CILA;NETU(250,314);FT1[I]:=F;
	      X1:=EA1-7;Y1:=EB1;X2:=EA1+35;Y2:=EB1;A:=2;
	      XT:=x2-15;YT:=y2+5;CH:='a';CILA;NETU(250,314);FA1[I]:=F;
	      IF F<>0 THEN BEGIN X1:=X2+18;Y1:=Y2-30;XT:=X2+13;ch:='y';
		 YT:=Y2-16;CILA1;NETU(250,314);LA1[I]:=F;END;End;
 IF AF=2 THEN Begin X1:=EA1;Y1:=EB1;X2:=EA1;Y2:=EB1+48;
		    XT:=X2+6;YT:=Y2-12;CH:='r';CILA;NETU(250,314);FR2[I]:=F;
		 X1:=EA1;Y1:=EB1;X2:=EA1-25;Y2:=EB1+32;A:=1;
		 xt:=x2-5;yt:=y2+3;CH:='t';CILA;NETU(250,314);FT2[I]:=F;
	      X1:=EA1;Y1:=EB1;X2:=EA1+37;Y2:=EB1;A:=2;
	      XT:=x2-12;YT:=y2-13;CH:='a';CILA;NETU(250,314);FA2[I]:=F;
	      IF F<>0 THEN BEGIN X1:=X2;Y1:=Y2;Y2:=Y2+48;ch:='z';
		 XT:=X2+4;YT:=Y2-27;CILA1;NETU(250,314);LA2[I]:=F;END;End;
 IF AF=3 THEN Begin X1:=EA1-16;Y1:=EB1+30;X2:=EA1+7;Y2:=EB1;A:=1;
		    XT:=X2-40;YT:=Y2+18;CH:='r';CILA;NETU(250,314);FR3[I]:=F;
		 X1:=EA1+7;Y1:=EB1-45;X2:=EA1+7;Y2:=EB1;A:=1;
		 xt:=x2+6;yt:=y2-43;CH:='t';CILA;NETU(250,314);FT3[I]:=F;
	      X1:=EA1+7;Y1:=EB1;X2:=EA1+35;Y2:=EB1;A:=2;
	      XT:=x2-13;YT:=y2-14;CH:='a';CILA;NETU(250,314);FA3[I]:=F;
	      IF F<>0 THEN BEGIN X1:=X2;Y1:=Y2;X2:=X2-18;Y2:=Y2+30;ch:='y';
		 XT:=X2+13;YT:=Y2-16;CILA1;NETU(250,314);LA3[I]:=F;END;End;
 IF AF=4 THEN Begin X1:=EA1;Y1:=EB1-48;X2:=EA1;Y2:=EB1;A:=1;
		    XT:=X1-6;YT:=Y1-15;CH:='r';CILA;NETU(250,314);FR4[I]:=F;
		 IF F=0 THEN BEGIN SETCOLOR(10);LINE(X1,Y1,X2,Y2);END;
		 X1:=EA1-25;Y1:=EB1+32;X2:=EA1;Y2:=EB1;A:=1;
		 xt:=x1-19;yt:=y1-11;CH:='t';CILA;NETU(250,314);FT4[I]:=F;
	      X1:=EA1;Y1:=EB1;X2:=EA1+35;Y2:=EB1;A:=2;
	      XT:=x2-13;YT:=y2+4;CH:='a';CILA;NETU(250,314);FA4[I]:=F;
	      IF F<>0 THEN BEGIN X1:=X2;Y1:=Y2-48;XT:=X2+4;ch:='z';
		 YT:=Y2-25;CILA1;NETU(250,314);LA4[I]:=F;END;End;
END;

PROCEDURE PODSHIP(XX1,YY1:INTEGER);
LABEL 1;
   BEGIN
  SETLINESTYLE(0,0,3);SETCOLOR(5);MOVETO(230,360);LINETO(230,395);
  LINETO(395,395);LINETO(395,360);LINETO(230,360);
  MOVETO(225,355);LINETO(225,400);LINETO(400,400);LINETO(400,355);
  LINETO(225,355);SETLINESTYLE(0,0,1);
    SETCOLOR(12);SLINE(1,XX1,YY1-30,XX1,YY1);
    SETCOLOR(14);SETTEXTSTYLE(2,0,0);OUTTEXTXY(XX1+10,YY1-27,'Ra');
    SETCOLOR(10);SETTEXTSTYLE(1,0,1);OUTTEXTXY(240,362,'Ra =');
    OUTTEXTXY(360,364,'H');GOTOXY(37,24);READLN(Ra);NETU(240,362);
      SETCOLOR(12);SLINE(1,XX1+190,YY1-30,XX1+190,YY1);
      SETCOLOR(14);SETTEXTSTYLE(2,0,0);OUTTEXTXY(XX1+200,YY1-27,'Rb');
      SETCOLOR(10);SETTEXTSTYLE(1,0,1);OUTTEXTXY(240,362,'Rb =');
      OUTTEXTXY(360,364,'H');GOTOXY(37,24);READLN(Rb);NETU(240,362);
    IF AF=1 THEN BEGIN Fa:=0;GOTO 1;END;
    SETCOLOR(12);SLINE(2,XX1+70,YY1,XX1+110,YY1);
    SETCOLOR(14);SETTEXTSTYLE(2,0,0);OUTTEXTXY(XX1+80,YY1-15,'Fa');
    SETCOLOR(10);SETTEXTSTYLE(1,0,1);OUTTEXTXY(240,362,'Fa =');
    OUTTEXTXY(360,364,'H');GOTOXY(37,24);READLN(Fa);NETU(240,362);
     IF Fa<0 THEN BEGIN SETCOLOR(0);SLINE(2,XX1+70,YY1,XX1+110,YY1);
			SETCOLOR(12);SLINE(1,XX1+70,YY1,XX1+110,YY1);END;
     IF Fa=0 THEN BEGIN  SETCOLOR(0);SLINE(3,XX1+70,YY1,XX1+110,YY1);
			OUTTEXTXY(XX1+80,YY1-15,'Fa');END;
1:SETLINESTYLE(0,0,3);SETCOLOR(0);MOVETO(230,360);LINETO(230,395);
  LINETO(395,395);LINETO(395,360);LINETO(230,360);
  MOVETO(225,355);LINETO(225,400);LINETO(400,400);LINETO(400,355);
  LINETO(225,355);SETLINESTYLE(0,0,1);
   END;

PROCEDURE NULI(I:INTEGER);
   BEGIN
    FR1[i]:=0;FR2[i]:=0;FR3[i]:=0;FR4[i]:=0;
    FA1[i]:=0;FA2[i]:=0;FA3[i]:=0;FA4[i]:=0;
    FT1[i]:=0;FT2[i]:=0;FT3[i]:=0;FT4[i]:=0;
    LA1[i]:=0;LA2[i]:=0;LA3[i]:=0;LA4[i]:=0;
   END;

{                   ************╔╦╦╦╦╦╦╦╦╦╦╦╦╦╦╗************
********************************╠КОНЕЦ ПРОЦЕДУР╣******************************
			   *****╚╩╩╩╩╩╩╩╩╩╩╩╩╩╩╝*****                         }

   BEGIN
    GRINIT;
    CLEARDEVICE;RAMKA;
    SETCOLOR(1);SETTEXTSTYLE(0,0,13);outtextxy(15,30,'ПОДБОР');
    SETCOLOR(4);SETTEXTSTYLE(0,0,7);OUTTEXTXY(15,200,'ПОДШИПНИКОВ');
    setTEXTstyle(0,0,1);SETCOLOR(7);
    OUTTEXTXY(270,300,'СОСТАВИЛИ: ст.гр.ТП-95-02 Куклин В.С.');
    OUTTEXTXY(358,310,'ст.гр.ТП-97-01 Лебедьков А.Е.');KLAVA;
24: Assign(data,'data.txt');Reset(data);
    CLEARDEVICE;RAMKA;SETCOLOR(11);
    FOR I:=1 TO 5 DO NULI(I);VOPROS:=0;SETTEXTSTYLE(0,0,2);
    outtextxy(35,50,'БУДЕТЕ РАСЧИТЫВАТЬ ОПОРНЫЕ РЕАКЦИИ');
    outtextxy(65,70,'ИЛИ ВВЕДЕТЕ ГОТОВЫЕ ЗНАЧЕНИЯ ?');SETCOLOR(7);
23: outtextxy(10,110,'"Y" - БУДУ РАСЧИТЫВАТЬ ОПОРНЫЕ РЕАКЦИИ.');
    outtextxy(10,130,'"N" - ВВЕДУ ГОТОВЫЕ ЗНАЧЕНИЯ.');
    CH:=READKEY;
    IF CH=#27 THEN GOTO 15;
    IF (CH=#89) or (CH=#121) THEN GOTO 1;
    IF (CH=#78) or (CH=#110) THEN BEGIN VOPROS:=1999;GOTO 22;END;
    CV:=RANDOM(15);IF CV=0 THEN CV:=1;SETCOLOR(CV);GOTO 23;

1: CLEARDEVICE;SETLINESTYLE(0,0,1);SETCOLOR(LIGHTGREEN);
   DL1;X:=140;
   FOR I:=0 TO 3 DO BEGIN DL2;X:=X+90;END;
   DL3;RAMKA;SETTEXTSTYLE(0,0,1);

   XA:=100;setcolor(10);
   FOR I:=1 TO 6 DO BEGIN str(i:2,is);
   OUTTEXTXY(XA,236,'L');outtextxy(XA,236,is);
   XA:=XA+86;END;

   SETCOLOR(13);SETFILLSTYLE(4,4);
   OPORA1;OPORA2;
   setlinestyle(0,0,3);setcolor(6);
   line(70,149,570,149);setcolor(11);SETTEXTSTYLE(0,0,2);
   OUTTEXTXY(130,15,'ВВЕДИТЕ ИСХОДНЫЕ ДАННЫЕ.');SETTEXTSTYLE(0,0,1);
   OUTTEXTXY(170,35,'(Если участок отсутствует введите "0")');

   XA:=100;YA:=284;YB:=19;
   FOR I:=1 TO 6 DO BEGIN LM(I,XA,12);LM1(I,YA);
5: GOTOXY(13,YB);READ(L[I]);
   IF L[I]<0 THEN BEGIN ERROR(YA);GOTO 5;END;
   YA:=YA+16;YB:=YB+1;
   LM(I,XA,10);XA:=XA+86;
   END;

17:is:='КОРРЕКЦИЯ ДЛИН ДА-"Y", НЕТ-ЛЮБАЯ ДРУГАЯ КЛАВИША';
   SETCOLOR(10);OUTTEXTXY(140,465,is);CH:=READKEY;
   SETCOLOR(0);OUTTEXTXY(140,465,is);SETCOLOR(10);
   IF (CH=#121) OR (ch=#89) THEN GOTO 16 ELSE GOTO 2;
16:is:='КАКУЮ ДЛИНУ ХОТИТЕ ИСПРАВИТЬ ? (1-6),"A" - ВСЕ.';
   ls:='НИЧЕГО НЕ ИСПРАВЛЯТЬ - ЛЮБАЯ ДРУГАЯ КЛАВИША';
   OUTTEXTXY(130,455,is);OUTTEXTXY(141,465,ls);
   CH:=READKEY;SETCOLOR(0);
   OUTTEXTXY(130,455,is);OUTTEXTXY(141,465,ls);

    IF CH=#27 THEN GOTO 15;
    IF (CH=#97) OR (ch=#65) THEN GOTO 1;
161:IF (CH=#49) THEN Begin I:=1;YA:=284;XA:=100;LM(I,XA,12);
      ERROR1(91,YA);GOTOXY(13,19);READLN(L[i]);LM(I,XA,10);
       IF L[I]<0 THEN Begin ERROR(YA);GOTO 161;End;GOTO 17;End;
162:IF (CH=#50) THEN Begin I:=2;YA:=284+16;XA:=100+86;LM(I,XA,12);
      ERROR1(91,YA);GOTOXY(13,20);READLN(L[i]);LM(I,XA,10);
       IF L[I]<0 THEN Begin ERROR(YA);GOTO 162;End;GOTO 17;End;
163:IF (CH=#51) THEN Begin I:=3;YA:=284+16*2;XA:=100+86*2;LM(I,XA,12);
      ERROR1(91,YA);GOTOXY(13,21);READLN(L[i]);LM(I,XA,10);
       IF L[I]<0 THEN Begin ERROR(YA);GOTO 163;End;GOTO 17;End;
164:IF (CH=#52) THEN Begin I:=4;YA:=284+16*3;XA:=100+86*3;LM(I,XA,12);
      ERROR1(91,YA);GOTOXY(13,22);READLN(L[i]);LM(I,XA,10);
       IF L[I]<0 THEN Begin ERROR(YA);GOTO 164;End;GOTO 17;End;
165:IF (CH=#53) THEN Begin I:=5;YA:=284+16*4;XA:=100+86*4;LM(I,XA,12);
      ERROR1(91,YA);GOTOXY(13,23);READLN(L[i]);LM(I,XA,10);
       IF L[I]<0 THEN Begin ERROR(YA);GOTO 165;End;GOTO 17;End;
166:IF (CH=#54) THEN Begin I:=6;YA:=284+16*5;XA:=100+86*5;LM(I,XA,12);
      ERROR1(91,YA);GOTOXY(13,24);READLN(L[i]);LM(I,XA,10);
       IF L[I]<0 THEN Begin ERROR(YA);GOTO 166;End;GOTO 17;End;

2:CLEARDEVICE;SETLINESTYLE(0,0,1);SETCOLOR(10);
   X:=140;XL1:=70;XL2:=70;XA:=90;
   IF L[1]<>0 THEN BEGIN DL1;STR(L[1]:0:0,LS);OUTTEXTXY(XA,236,LS);END
	      ELSE XL1:=140;XA:=XA+86;
   IF L[2]<>0 THEN BEGIN DL2;STR(L[2]:0:0,LS);OUTTEXTXY(XA,236,LS);
		   XA:=XA+86;X:=X+90;END;
   IF L[3]<>0 THEN BEGIN DL2;STR(L[3]:0:0,LS);OUTTEXTXY(XA,236,LS);
		   XA:=XA+86;X:=X+90;END;
   IF L[4]<>0 THEN BEGIN DL2;STR(L[4]:0:0,LS);OUTTEXTXY(XA,236,LS);
		   XA:=XA+86;X:=X+90;END;
   IF L[5]<>0 THEN BEGIN DL2;STR(L[5]:0:0,LS);OUTTEXTXY(XA,236,LS);
		   XA:=XA+86;X:=X+90;END;
   IF L[6]<>0 THEN BEGIN DL3;STR(L[6]:0:0,LS);OUTTEXTXY(XA,236,LS);END
	      ELSE XL2:=0;
   RAMKA;SETCOLOR(13);OPORA1;OPORA2;
   SLINE(2,40,149,X+XL2+55,149);OUTTEXTXY(X+XL2+49,155,'X');
   SLINE(1,40,80,40,149);OUTTEXTXY(27,75,'Z');
   SLINE(1,40,149,10,185);OUTTEXTXY(7,165,'Y');
   SETLINESTYLE(0,0,3);SETCOLOR(6);
   LINE(XL1,149,X+XL2,149);SETLINESTYLE(0,0,1);

     setcolor(11);SETTEXTSTYLE(0,0,2);
   OUTTEXTXY(130,15,'ВВЕДИТЕ ДЕЙСТВУЮЩИЕ СИЛЫ');SETTEXTSTYLE(0,0,1);
OUTTEXTXY(100,35,'(Если сила отсутствует введите "0",если сила направлена');
OUTTEXTXY(110,43,'противоположно оси действия - отрецательное значение)');
I:=1;K:=-1;EA:=70;EB:=149;AA:=160;
   IF L[1]<>0 THEN begin EL(EA,EB,1,EA1,EB1,AF);
		   IF AF<>0 THEN begin RAM(5);SILA;RAM(0);end;End
	      ELSE NULI(I);
I:=2;K:=-1;
   IF (L[2]<>0) and ((L[3]<>0) or (L[4]<>0) or (L[5]<>0)) THEN
		   begin EL(EA+AA,EB,0,EA1,EB1,AF);AA:=AA+90;
		   IF AF<>0 THEN begin RAM(5);SILA;RAM(0);end;End
	      ELSE NULI(I);
I:=3;K:=-1;
   IF (L[3]<>0) and ((L[4]<>0) or (L[5]<>0)) THEN
		   begin EL(EA+AA,EB,0,EA1,EB1,AF);AA:=AA+90;
		   IF AF<>0 THEN begin RAM(5);SILA;RAM(0);end;End
	      ELSE NULI(I);
I:=4;K:=-1;
   IF (L[4]<>0) and (L[5]<>0) THEN
		   begin EL(EA+AA,EB,0,EA1,EB1,AF);AA:=AA+90;
		   IF AF<>0 THEN begin RAM(5);SILA;RAM(0);end;End
	      ELSE NULI(I);
I:=5;K:=-1;
   IF L[6]<>0 THEN begin X1:=X+XL2;EL(X1,EB,2,EA1,EB1,AF);
		    IF AF<>0 THEN begin RAM(5);SILA;RAM(0);end;End
	      ELSE NULI(I);
RAM(0);
SETCOLOR(9);SETTEXTSTYLE(0,0,1);OUTTEXTXY(80,260,'Таблица сил');
SETTEXTSTYLE(1,0,1); OUTTEXTXY(140,270,'Fr');OUTTEXTXY(215,270,'Ft');
OUTTEXTXY(290,270,'Fa');OUTTEXTXY(365,270,'Ly');OUTTEXTXY(440,270,'Lz');
K:=1;AA:=300;FOR I:=1 TO 5 DO BEGIN
IF (FT1[I]<>0) OR (FT2[I]<>0) OR (FT3[I]<>0) OR (FT4[I]<>0) OR
   (FR1[I]<>0) OR (FR2[I]<>0) OR (FR3[I]<>0) OR (FR4[I]<>0) OR
   (FA1[I]<>0) OR (FA2[I]<>0) OR (FA3[I]<>0) OR (FA4[I]<>0) THEN
    BEGIN K:=K+1;STR(I,IS);
	OUTTEXTXY(93,AA,IS);LINE(80,AA,490,AA);AA:=AA+25;END;END;
MOVETO(80,272);LINETO(80,AA);LINETO(490,AA);
LINETO(490,272);LINETO(80,272);
MOVETO(78,270);LINETO(78,AA+2);LINETO(492,AA+2);
LINETO(492,270);LINETO(78,270);
I:=115;REPEAT LINE(I,272,I,275+25*K);I:=I+75;UNTIL I>470;
YF:=310;SETTEXTSTYLE(0,0,1);SETCOLOR(10);
FOR I:=1 TO 5 DO BEGIN XF:=120;AA:=0;
 IF ((FR2[I]<>0) or (FT2[I]<>0) or (FA2[I]<>0)) THEN BEGIN AA:=1;
  STR(ABS(FR2[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FT2[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FA2[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  IS:=' ---';OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(LA2[I]:3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;END;
 IF ((FR4[I]<>0) or (FT4[I]<>0) or (FA4[I]<>0)) THEN BEGIN AA:=1;
  STR(ABS(FR4[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FT4[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FA4[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  IS:=' ---';OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(LA4[I]:3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;END;
 IF (FR1[I]<>0) or (FT1[I]<>0) or (FA1[I]<>0) THEN BEGIN AA:=1;
  STR(ABS(FR1[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FT1[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FA1[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(LA1[I]:3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  IS:=' ---';OUTTEXTXY(XF,YF,IS);XF:=XF+75;END;
 IF (FR3[I]<>0) or (FT3[I]<>0) or (FA3[I]<>0) THEN BEGIN AA:=1;
  STR(ABS(FR3[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FT3[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(ABS(FA3[I]):3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  STR(LA3[I]:3:1,IS);OUTTEXTXY(XF,YF,IS);XF:=XF+75;
  IS:=' ---';OUTTEXTXY(XF,YF,IS);XF:=XF+75;END;
 IF AA=1 THEN YF:=YF+25;
20: END;
is:='КОРРЕКЦИЯ СИЛ ДА-"Y",НЕТ-ЛЮБАЯ КЛАВИША';OUTTEXTXY(150,465,is);
CH:=READKEY;IF CH=#27 THEN GOTO 15;
IF (CH=#121) OR (ch=#89) THEN BEGIN FOR I:=1 TO 5 DO NULI(I);GOTO 2;END;
SETCOLOR(0);OUTTEXTXY(150,465,is);
SETTEXTSTYLE(0,0,2);
 OUTTEXTXY(130,15,'ВВЕДИТЕ ДЕЙСТВУЮЩИЕ СИЛЫ');SETTEXTSTYLE(0,0,1);
OUTTEXTXY(100,35,'(Если сила отсутствует введите "0",если сила направлена');
OUTTEXTXY(110,43,'противоположно оси действия - отрецательное значение)');

A1:=L[2]+L[3]+L[4]+L[5];
C1:=-FT1[1]*(L[1]+A1)+FR2[1]*(L[1]+A1)-FA2[1]*LA2[1]-
     FT3[1]*(L[1]+A1)-FR4[1]*(L[1]+A1)+FA4[1]*LA4[1]-
  FT1[2]*(A1-L[2])+FR2[2]*(A1-L[2])-FA2[2]*LA2[2]-
  FT3[2]*(A1-L[2])-FR4[2]*(A1-L[2])+FA4[2]*LA4[2]-
     FT1[3]*(L[4]+L[5])+FR2[3]*(L[4]+L[5])-FA2[3]*LA2[3]-
     FT3[3]*(L[4]+L[5])-FR4[3]*(L[4]+L[5])+FA4[3]*LA4[3]-
  FT1[4]*L[5]+FR2[4]*L[5]-FA2[4]*LA2[4]-
  FT3[4]*L[5]-FR4[4]*L[5]+FA4[4]*LA4[4]+
     FT1[5]*L[6]-FR2[5]*L[6]-FA2[5]*LA2[5]+
     FT3[5]*L[6]+FR4[5]*L[6]+FA4[5]*LA4[5];
Raz:=C1/A1;
C1:=-FT1[1]*L[1]+FR2[1]*L[1]-FA2[1]*LA2[1]-
     FT3[1]*L[1]-FR4[1]*L[1]+FA4[1]*LA4[1]+
  FT1[2]*L[2]-FR2[2]*L[2]-FA2[2]*LA2[2]+
  FT3[2]*L[2]+FR4[2]*L[2]+FA4[2]*LA4[2]+
     FT1[3]*(L[2]+L[3])-FR2[3]*(L[2]+L[3])-FA2[3]*LA2[3]+
     FT3[3]*(L[2]+L[3])+FR4[3]*(L[2]+L[3])+FA4[3]*LA4[3]+
  FT1[4]*(A1-L[5])-FR2[4]*(A1-L[5])-FA2[4]*LA2[4]+
  FT3[4]*(A1-L[5])+FR4[4]*(A1-L[5])+FA4[4]*LA4[4]+
     FT1[5]*(A1+L[6])-FR2[5]*(A1+L[6])-FA2[5]*LA2[5]+
     FT3[5]*(A1+L[6])+FR4[5]*(A1+L[6])+FA4[5]*LA4[5];
Rbz:=-(C1/A1);
C1:=-FR1[1]*(L[1]+A1)+FA1[1]*LA1[1]+FT2[1]*(L[1]+A1)+
     FR3[1]*(L[1]+A1)-FA3[1]*LA3[1]+FT4[1]*(L[1]+A1)-
  FR1[2]*(A1-L[2])+FA1[2]*LA1[2]+FT2[2]*(A1-L[2])+
  FR3[2]*(A1-L[2])-FA3[2]*LA3[2]+FT4[2]*(A1-L[2])-
     FR1[3]*(L[4]+L[5])+FA1[3]*LA1[3]+FT2[3]*(L[4]+L[5])+
     FR3[3]*(L[4]+L[5])-FA3[3]*LA3[3]+FT4[3]*(L[4]+L[5])-
  FR1[4]*L[5]+FA1[4]*LA1[4]+FT2[4]*L[5]+
  FR3[4]*L[5]-FA3[4]*LA3[4]+FT4[4]*L[5]+
     FR1[5]*L[6]+FA1[5]*LA1[5]-FT2[5]*L[6]-
     FR3[5]*L[6]-FA3[5]*LA3[5]-FT4[5]*L[6];
Ray:=C1/A1;
C1:=-FR1[1]*L[1]+FA1[1]*LA1[1]+FT2[1]*L[1]+
     FR3[1]*L[1]-FA3[1]*LA3[1]+FT4[1]*L[1]+
  FR1[2]*L[2]+FA1[2]*LA1[2]-FT2[2]*L[2]-
  FR3[2]*L[2]-FA3[2]*LA3[2]-FT4[2]*L[2]+
     FR1[3]*(L[2]+L[3])+FA1[3]*LA1[3]-FT2[3]*(L[2]+L[3])-
     FR3[3]*(L[2]+L[3])-FA3[3]*LA3[3]-FT4[3]*(L[2]+L[3])+
  FR1[4]*(A1-L[5])+FA1[4]*LA1[4]-FT2[4]*(A1-L[5])-
  FR3[4]*(A1-L[5])-FA3[4]*LA3[4]-FT4[4]*(A1-L[5])+
     FR1[5]*(L[6]+A1)+FA1[5]*LA1[5]-FT2[5]*(L[6]+A1)-
     FR3[5]*(L[6]+A1)-FA3[5]*LA3[5]-FT4[5]*(L[6]+A1);
Rby:=-(C1/A1);
RA:=SQRT(SQR(Raz)+SQR(Ray));
RB:=SQRT(SQR(Rbz)+SQR(Rby));
fa:=0;FOR I:=1 TO 5 DO FA:=FA+(FA1[I]+FA2[I]+FA3[I]+FA4[I]);
{Проверка XOZ}
{F3T:=0;
FOR I:=1 TO 5 DO F3T:=F3T+(FT1[I]-FR2[I]+FT3[I]+FR4[I]);
C1:=Raz+Rbz+F3T;}
{Проверка XOY}
{F3T:=0;
FOR I:=1 TO 5 DO F3T:=F3T+(-FR1[I]+FT2[I]+FR3[I]+FT4[I]);
A1:=-Ray-Rby+F3T;}

SETTEXTSTYLE(0,0,2);SETCOLOR(11);
OUTTEXTXY(20,10,'СИЛЫ РЕАКЦИИ <H>');OUTTEXTXY(370,10,'ОСЕВАЯ СИЛА <H>');
SETTEXTSTYLE(1,0,1);SETCOLOR(14);STR(RA:6:2,IS);STR(RB:6:2,LS);
OUTTEXTXY(30,25,'Ra=');OUTTEXTXY(65,25,IS);
OUTTEXTXY(190,25,'Rb=');OUTTEXTXY(226,25,LS);STR(FA:6:2,IS);
OUTTEXTXY(380,25,'Fa=');OUTTEXTXY(410,25,IS);
SETTEXTSTYLE(0,0,1);SETCOLOR(7);STR(RAZ:6:2,IS);STR(RBZ:6:2,LS);
OUTTEXTXY(40,50,'Raz=');OUTTEXTXY(72,50,IS);
OUTTEXTXY(200,50,'Rbz=');OUTTEXTXY(232,50,LS);
STR(RAY:6:2,IS);STR(RBY:6:2,LS);
OUTTEXTXY(40,60,'Ray=');OUTTEXTXY(72,60,IS);
OUTTEXTXY(200,60,'Rby=');OUTTEXTXY(232,60,LS);
{Вывод результатов проверки на экран}
{ STR(C1:6:5,IS);STR(A1:6:5,LS);
 OUTTEXTXY(410,50,'F(z)=');OUTTEXTXY(450,50,IS);
 OUTTEXTXY(410,60,'F(y)=');OUTTEXTXY(450,60,LS);}
SETTEXTSTYLE(0,0,2);SETCOLOR(12);
is:='НУЖЕН ВЫВОД НА ПЕЧАТЬ (Y/N) ?';
27:OUTTEXTXY(70,450,is);CH:=READKEY;
   SETCOLOR(0);OUTTEXTXY(70,450,is);
   IF CH=#27 THEN GOTO 15;
   IF (CH=#89) or (CH=#121) THEN GOTO 28;
   IF (CH=#78) or (CH=#110) THEN GOTO 22;
   CV:=RANDOM(15);IF CV=0 THEN CV:=1;SETCOLOR(CV);GOTO 27;
28:SETCOLOR(7);COPYTOPRN(1,0,639,479,0,1,FALSE,6);
   is:='НУЖНА ЕЩЕ ОДНА КОПИЯ (Y/N) ?';GOTO 27;

22: CLEARDEVICE;RAMKA;
SETTEXTSTYLE(0,0,2);SETCOLOR(13);TEXTCOLOR(11);
OUTTEXTXY(150,20,'ВЫБИРИТЕ НОМЕР СХЕМЫ.');
is:='1: ШАРИКОВЫЕ И РОЛИКОВЫЕ';
ls:='РАДИАЛЬНЫЕ ПОДШИПНИКИ';
SETTEXTSTYLE(0,0,1);SETCOLOR(10);
OUTTEXTXY(45,53,is);OUTTEXTXY(68,63,ls);
OUTTEXTXY(320,53,'2: В РАСПОР РАДИАЛЬНО-УПОРНЫЕ');
OUTTEXTXY(343,63,'ПОДШИПНИКИ');
OUTTEXTXY(25,233,'3: ФИКСИРУЮЩАЯ И ПЛАВАЮЩАЯ ОПОРА');
OUTTEXTXY(320,233,'4: В РАСТЯЖКУ РАДИАЛЬНО-УПОРНЫЕ');
OUTTEXTXY(343,243,'ПОДШИПНИКИ');
setlinestyle(0,0,3);setcolor(6);line(40,149,270,149);line(340,149,560,149);
line(40,320,270,320);line(340,320,560,320);setcolor(11);
{1}line(50,139,70,139);line(240,139,260,139);line(50,159,70,159);
line(240,159,260,159);{2}line(350,139,360,129);line(350,159,360,169);
line(540,129,550,139);line(540,169,550,159);{4}line(360,310,350,300);
line(360,330,350,340);line(540,310,550,300);line(540,330,550,340);
IF Fa<>0 THEN BEGIN SETCOLOR(7);OUTTEXTXY(45,53,is);
  OUTTEXTXY(68,63,ls);line(50,139,70,139);
  line(240,139,260,139);line(50,159,70,159);line(240,159,260,159);
  line(40,149,270,149);SETCOLOR(12);SETTEXTSTYLE(0,0,2);
  OUTTEXTXY(25,90,'СХЕМА НЕДОСТУПНА');END;
AA:=0;SETCOLOR(11);NOMER_3(0);
21:SETCOLOR(10);SETTEXTSTYLE(0,0,1);c:='ВЫБИРИТЕ НОМЕР СХЕМЫ (1-4) ?';
   OUTTEXTXY(190,460,c);CH:=READKEY;SETCOLOR(0);OUTTEXTXY(190,460,c);
   IF CH=#27 THEN GOTO 15;
   IF Fa<>0 THEN GOTO 26;
   IF (CH=#49) THEN Begin AF:=1;
      IF VOPROS=1999 THEN Begin PODSHIP(60,130);KLAVA;End;GOTO 19;End;
26:IF (CH=#50) THEN Begin AF:=2;
      IF VOPROS=1999 THEN Begin PODSHIP(355,120);KLAVA;End;GOTO 19;End;
   IF (CH=#52) THEN Begin AF:=4;
      IF VOPROS=1999 THEN Begin PODSHIP(355,290);KLAVA;End;GOTO 19;End;
   IF (CH=#51) THEN Begin AF:=3;SETCOLOR(0);NOMER_3(0);
      SETCOLOR(13);SETTEXTSTYLE(0,0,1);
      OUTTEXTXY(25,390,'УКАЖИТЕ ФИКСИРУЮЩУЮ ОПОРУ ? (1 ИЛИ 2)');
      SETTEXTSTYLE(0,0,2);OUTTEXTXY(55,340,'1');OUTTEXTXY(240,340,'2');
  CH:=READKEY;SETCOLOR(0);OUTTEXTXY(55,340,'1');OUTTEXTXY(240,340,'2');
      SETTEXTSTYLE(0,0,1);
      OUTTEXTXY(25,390,'УКАЖИТЕ ФИКСИРУЮЩУЮ ОПОРУ ? (1 ИЛИ 2)');
 IF (CH=#49) THEN Begin AF1:=1;SETCOLOR(11);NOMER_3(0);
    IF VOPROS=1999 THEN PODSHIP(60,290);KLAVA;GOTO 19;End;
 IF (CH=#50) THEN Begin AF1:=2;SETCOLOR(11);NOMER_3(180);
    IF VOPROS=1999 THEN PODSHIP(60,290);KLAVA;GOTO 19;End;
 SETCOLOR(11);NOMER_3(0);End;
ERROR(543);GOTO 21;

19:CLEARDEVICE;setlinestyle(0,0,1);
RAMKA;SETTEXTSTYLE(0,0,2);SETCOLOR(13);TEXTCOLOR(11);
OUTTEXTXY(130,20,'ВВЕДИТЕ ИСХОДНЫЕ ДАННЫЕ.');
SETTEXTSTYLE(0,0,1);P:=0;
    SETCOLOR(10);
6:OUTTEXTXY(55,53,'1:Частота вращения (об/мин) n=');
    GOTOXY(38,4);READLN(N);IF (N<10) THEN N:=10;IF P<>0 THEN GOTO 13;
  setcolor(9);
OUTTEXTXY(70,88, '┌────────────────────────┬────┬────┬───┬────┬────┬────┬───┐');
OUTTEXTXY(70,95, '│ Рабочая тем-ра,<C>  До │ 100│ 125│150│175 │200 │225 │250│');
outtextxy(70,103,'├────────────────────────┼────┼────┼───┼────┼────┼────┼───┤');
OUTTEXTXY(70,110,'│       Kт               │  1 │1.05│1.1│1.15│1.25│1.35│1.4│');
outtextxy(70,117,'└────────────────────────┴────┴────┴───┴────┴────┴────┴───┘');
    setcolor(10);
7:OUTTEXTXY(55,69,'2:Температурный коэфициент Кт=');
    GOTOXY(38,5);READLN(KT);IF P<>0 THEN GOTO 13;
  setcolor(9);
  OUTTEXTXY(70,148,'┌─────────────────────┬───────┐');
  OUTTEXTXY(70,155,'│Характер нагрузки    │   Кб  │');
  outtextxy(70,163,'├─────────────────────┼───────┤');
  OUTTEXTXY(70,170,'│Спокойная            │  1-1.1│');
  outtextxy(70,178,'├─────────────────────┼───────┤');
  outtextxy(70,185,'│Легкие толчки        │1.1-1.2│');
  outtextxy(70,193,'├─────────────────────┼───────┤');
  OUTTEXTXY(70,200,'│Умеренные толчки     │1.3-1.4│');
  outtextxy(70,208,'├─────────────────────┼───────┤');
  outtextxy(70,215,'│Значительные  толчки │1.7-2  │');
  outtextxy(70,222,'└─────────────────────┴───────┘');
8:SETCOLOR(10);OUTTEXTXY(55,133,'3:Kоэфициент безопасности Кб=');
     GOTOXY(37,9);READLN(KB);IF P<>0 THEN GOTO 13;
9:OUTTEXTXY(55,245,'4:Kоэфициент вращения V=');
    GOTOXY(32,16);READLN(V);IF P<>0 THEN GOTO 13;
11:OUTTEXTXY(55,261,'5:Диаметр вала под подшипник (мм) d=');setcolor(12);
   OUTTEXTXY(73,277,
    'ДИАМЕТР ВАЛА ДОЛЖЕН ЗАКАНЧИВАТЬСЯ НА 0 или 5 (кроме 12 и 17)');
   SETCOLOR(10);GOTOXY(44,17);READLN(D1);
    IF (D1>80) THEN BEGIN setcolor(7);OUTTEXTXY(456,261,'(10<d<80)');
	       ERROR1(343,250);setcolor(10);GOTO 11;END;
    IF (D1>=10) and ((D1=12) OR (D1=17) OR ((D1/5)=TRUNC(D1/5))) THEN GOTO 10
	  ELSE BEGIN ERROR1(343,250);setcolor(10);GOTO 11;END;
10: IF P<>0 THEN GOTO 13;
12:OUTTEXTXY(55,293,'6:Требуемая долговечность (час) Lh=');
    GOTOXY(43,19);READLN(LH);IF P<>0 THEN GOTO 13;
    setcolor(9);
  OUTTEXTXY(70,343,'┌─────────────────────────┬───────┬───────┬───────┐');
  OUTTEXTXY(70,350,'│  Условие эксплуатации   │   1   │   2   │   3   │');
  outtextxy(70,358,'├─────────────────────────┼───────┼───────┼───────┤');
  OUTTEXTXY(70,365,'│Для шариковых            │0.7-0.8│  1.0  │1.2-1.4│');
  outtextxy(70,373,'├─────────────────────────┼───────┼───────┼───────┤');
  outtextxy(70,380,'│Для роликовых            │0.5-0.6│  0.8  │1.0-1.2│');
  outtextxy(70,388,'├─────────────────────────┼───────┼───────┼───────┤');
  OUTTEXTXY(70,395,'│Для роликовых-конических │0.6-0.7│  0.9  │1.1-1.3│');
  outtextxy(70,403,'└─────────────────────────┴───────┴───────┴───────┘');
  outtextxy(75,415,'1 - Обычные условия применения подшипника.');
  outtextxy(75,423,'2 - Условия характеризующие смазку подшипника.');
  outtextxy(75,431,'3 - Условия характеризующие материал подшипника.');
    setcolor(10);
25:OUTTEXTXY(55,309,'7:Коэффициент учитывающий качество метала и');
   OUTTEXTXY(71,325,'условие эксплуатации подшипников A23=');
    GOTOXY(47,21);READLN(A23);
13:OUTTEXTXY(150,455,'ЕСЛИ НУЖНО ИСПРАВИТЬ КАКОЙ-ЛИБО ПАРАМЕТР,');
   OUTTEXTXY(150,465,'НАБЕРИТЕ ЕГО НОМЕР.  НЕТ - ЛЮБАЯ КЛАВИША');
   CH:=READKEY;P:=1;setcolor(0);
   OUTTEXTXY(150,455,'ЕСЛИ НУЖНО ИСПРАВИТЬ КАКОЙ-ЛИБО ПАРАМЕТР,');
   OUTTEXTXY(150,465,'НАБЕРИТЕ ЕГО НОМЕР.  НЕТ - ЛЮБАЯ КЛАВИША');
CASE CH OF
   #27:goto 15;
   #49:begin ERROR1(295,39);SETCOLOR(10);GOTO 6;END;
   #50:begin ERROR1(295,63);SETCOLOR(10);GOTO 7;END;
   #51:begin ERROR1(287,124);GOTO 8;END;
   #52:begin ERROR1(247,234);setcolor(10);GOTO 9;END;
   #53:begin ERROR1(343,250);setcolor(10);GOTO 11;END;
   #54:begin ERROR1(335,285);setcolor(10);GOTO 12;END;
   #55:begin ERROR1(367,318);setcolor(10);GOTO 25;END;
   END;

31:rewrite(data);
 writeln(data,ra:5:3);writeln(data,rb:5:3);
 WRITELN(DATA,FA:5:3);WRITELN(DATA,N:5:3);
 WRITELN(DATA,KT:5:3);WRITELN(DATA,KB:5:3);
 WRITELN(DATA,V:5:3);WRITELN(DATA,D1:5:3);
 WRITELN(DATA,LH:5:3);WRITELN(DATA,A23:5:3);
 WRITELN(DATA,AF);WRITELN(DATA,AF1);
 close(data);
 swapVectors;
 Exec('podbor.exe','');
 SwapVectors;
CLEARDEVICE;RAMKA;SETTEXTSTYLE(0,0,2);SETCOLOR(7);
OUTTEXTXY(20,200,'Будете менять диаметр под подшипник ?');
OUTTEXTXY(270,230,'(Y/N)');
29:OUTTEXTXY(110,290,'<Пробел> - начать сначало');
OUTTEXTXY(110,310,'<Esc> - выход из программы');
14:CH:=READKEY;
   IF (CH=#89) or (CH=#121) THEN GOTO 30;
   IF (CH=#78) or (CH=#110) THEN begin CLEARDEVICE;RAMKA;
      SETTEXTSTYLE(0,0,2);goto 29;end;
   IF CH=#32 THEN GOTO 24;
   IF CH=#27 THEN GOTO 15;
   GOTO 14;
30:CLEARDEVICE;RAMKA;SETTEXTSTYLE(0,0,1);SETCOLOR(10);TEXTCOLOR(11);
OUTTEXTXY(55,53,'Диаметр вала под подшипник (мм) d=');setcolor(12);
32:OUTTEXTXY(63,77,
    'ДИАМЕТР ВАЛА ДОЛЖЕН ЗАКАНЧИВАТЬСЯ НА 0 или 5 (кроме 12 и 17)');
   SETCOLOR(10);GOTOXY(42,4);READLN(D1);
   IF (D1>80) THEN BEGIN setcolor(7);OUTTEXTXY(400,55,'(10<d<80)');
	      ERROR1(327,47);setcolor(12);GOTO 32;END;
   IF (D1>=10) and ((D1=12) OR (D1=17) OR ((D1/5)=TRUNC(D1/5))) THEN
	      begin Assign(data,'data.txt');Reset(data);GOTO 31;end
	  ELSE BEGIN ERROR1(327,47);setcolor(12);GOTO 32;END;
15:END.
