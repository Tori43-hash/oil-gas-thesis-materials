Program Kursovoy;
{$m 16384,0,40000}
USES GRAPH,CRT,dos;
  {$I initgrap.pas}
  {$I sline.pas}
   VAR L:ARRAY[1..6] OF REAL;
       Fr1,Ft1,Fa1,La1:ARRAY[1..5] OF REAL;
       Fr2,Ft2,Fa2,La2:ARRAY[1..5] OF REAL;
       X,XA,I,YA,YB,XL1,XL2,X1,X2,Y1,Y2,CV,AF,EA1,EB1,AA,VOPROS,
       A,K,XT,YT,XF,YF,A23,{XAA,XX1,YY1,X22,Y22,}eA,eB,dm:INTEGER;
       {A1,B,C1,D,F,FL,Raz,Rbz,Ray,Rby,Fa,}Ra,Rb,M,KT,KB,V,{KS,D1,}LH,P,
       Db,B,Cb,N:REAL;
       is,LS,C:string;
       CH:CHAR;
       data:text;
   LABEL 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,
	 25,161,162,163,164,165,166;
{}
PROCEDURE ERROR1(XAA,YA:INTEGER);
  BEGIN
   SETTEXTSTYLE(0,0,3);SETCOLOR(0);
   OUTTEXTXY(XAA,YA,'██');SETCOLOR(11);SETTEXTSTYLE(0,0,1);
  END;
{}
   BEGIN
    GRINIT;
CLEARDEVICE;setlinestyle(0,0,1);
SETTEXTSTYLE(0,0,2);SETCOLOR(13);TEXTCOLOR(11);
OUTTEXTXY(130,20,'ВВЕДИТЕ ИСХОДНЫЕ ДАННЫЕ.');
SETTEXTSTYLE(0,0,1);P:=0;
    SETCOLOR(10);
6:OUTTEXTXY(55,53,'1:Частота вращения (об/мин) n=');
    GOTOXY(38,4);READLN(N);IF P<>0 THEN GOTO 13;
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
   SETCOLOR(10);GOTOXY(44,17);READLN(dm);
  IF (dm>=10) and ((dm=12) OR (dm=17) OR ((dm/5)=TRUNC(dm/5))) THEN GOTO 10
       ELSE BEGIN ERROR1(343,250);setcolor(10);GOTO 11;END;
10: IF P<>0 THEN GOTO 13;
12:OUTTEXTXY(55,293,'6:Требуемая долговечность (час) Lh=');
    GOTOXY(43,19);READLN(LH);
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
   #49:begin  ERROR1(295,39);SETCOLOR(10);GOTO 6;END;
   #50:begin  ERROR1(295,63);SETCOLOR(10);GOTO 7;END;
   #51:begin  ERROR1(287,124);GOTO 8;END;
   #52:begin  ERROR1(247,234);setcolor(10);GOTO 9;END;
   #53:begin  ERROR1(343,250);setcolor(10);GOTO 11;END;
   #54:begin  ERROR1(335,285);setcolor(10);GOTO 12;END;
   #55:begin  ERROR1(367,318);setcolor(10);GOTO 25;END;
   END;
{}
cleardevice;setcolor(13);settextstyle(0,0,2);
outtextxy(105,10,'ИСХОДНЫЕ ДАННЫЕ');setcolor(10);settextstyle(0,0,1);
outtextxy(30,30,'Радиальная реакция в левой опоре  (H)     Frл=');
setcolor(11);str(Ra:3:1,is);outtextxy(400,30,is);setcolor(10);
outtextxy(30,40,'Радиальная реакция в правой опоре  (H)    Frп=');
setcolor(11);str(Rb:3:1,is);outtextxy(400,40,is);setcolor(10);
outtextxy(30,50,'Диаметр вала под подшипник  (мм)          d=');
setcolor(11);str(dm:3,is);outtextxy(375,50,is);setcolor(10);
outtextxy(30,60,'Частота вращения  (об/мин)                h=');
setcolor(11);str(N:3:1,is);outtextxy(383,60,is);setcolor(10);
outtextxy(30,70,'Требуемая долговечность  (час)            Lh=');
setcolor(11);str(Lh:3:1,is);outtextxy(392,70,is);setcolor(10);
outtextxy(30,80,'Температурный коэффициент                 Kт=');
setcolor(11);str(Kt:3:1,is);outtextxy(392,80,is);setcolor(10);
outtextxy(30,90,'Коэффициент безопасности                  Кб=');
setcolor(11);str(Kb:3:1,is);outtextxy(392,90,is);setcolor(10);
outtextxy(30,100,'Коэффициент вращения                      V=');
setcolor(11);str(V:3:1,is);outtextxy(385,100,is);
outtextxy(55,130,'ПАРАМЕТРЫ ПОДШИПНИКА ДЛЯ НАГРУЖЕННОЙ {} ОПОРЫ');
setcolor(9);
outtextxy(25,150,'╔════════════╦═════╦═════╦═══════╦════════╦════════════╗');
outtextxy(25,158,'║    Номер   ║  d  ║  D  ║   B   ║   C    ║   Lh       ║');
outtextxy(25,166,'║ подшипника ║ мм  ║ мм  ║  мм   ║   H    ║   час      ║');
outtextxy(25,174,'╠════════════╩═════╩═════╩═══════╩════════╩════════════╣');
outtextxy(25,182,'║        ОДНОРЯДНЫЕ  РАДИАЛЬНЫЕ РОЛИКОПОДШИПНИКИ       ║');
outtextxy(25,190,'╠════════════╦═════╦═════╦═══════╦════════╦════════════╣');

outtextxy(25,208,'║            ║     ║     ║       ║        ║            ║');

outtextxy(25,226,'╠════════════╩═════╩═════╩═══════╩════════╩════════════╣');
outtextxy(25,234,'║        ОДНОРЯДНЫЕ  РАДИАЛЬНЫЕ ШАРИКОПДШИПНИКИ        ║');
outtextxy(25,242,'╠════════════╦═════╦═════╦═══════╦════════╦════════════╣');

outtextxy(25,255,'║            ║     ║     ║       ║        ║            ║');

outtextxy(25,270,'╚════════════╩═════╩═════╩═══════╩════════╩════════════╝');
{outtextxy(,,'');
outtextxy(,,'');
{obr outtextxy(,,'');}

{100}
CASE dm OF
   10:begin  N:=100;Db:=26;B:=8;Cb:=4620;END;
   12:begin  N:=101;Db:=28;B:=8;Cb:=5070;END;
   15:begin  N:=102;Db:=0;B:=0;Cb:=0;END;
   17:begin  N:=103;Db:=0;B:=0;Cb:=0;END;
   20:begin  N:=104;Db:=42;B:=12;Cb:=9360;END;
   25:begin  N:=105;Db:=47;B:=12;Cb:=11200;END;
   30:begin  N:=106;Db:=55;B:=13;Cb:=13300;END;
   35:begin  N:=107;Db:=62;B:=14;Cb:=15900;END;
   40:begin  N:=108;Db:=68;B:=15;Cb:=16800;END;
   45:begin  N:=109;Db:=75;B:=16;Cb:=21200;END;
   50:begin  N:=110;Db:=80;B:=16;Cb:=21600;END;
   55:begin  N:=111;Db:=90;B:=18;Cb:=28100;END;
   60:begin  N:=112;Db:=95;B:=18;Cb:=29600;END;
   65:begin  N:=113;Db:=100;B:=18;Cb:=30700;END;
   70:begin  N:=114;Db:=110;B:=20;Cb:=37700;END;
   75:begin  N:=115;Db:=115;B:=20;Cb:=39700;END;
   80:begin  N:=116;Db:=125;B:=22;Cb:=47700;END;
   85:begin  N:=117;Db:=130;B:=22;Cb:=49400;END;
   90:begin  N:=118;Db:=140;B:=24;Cb:=57200;END;
   95:begin  N:=119;Db:=145;B:=24;Cb:=60500;END;
   100:begin  N:=120;Db:=150;B:=24;Cb:=60500;END;
   105:begin  N:=121;Db:=160;B:=26;Cb:=72800;END;
   110:begin  N:=122;Db:=170;B:=28;Cb:=81900;END;
   END;
{200}
CASE dm OF
   10:begin  N:=200;Db:=30;B:=9;Cb:=5900;END;
   12:begin  N:=201;Db:=32;B:=10;Cb:=6890;END;
   15:begin  N:=202;Db:=35;B:=11;Cb:=7800;END;
   17:begin  N:=203;Db:=40;B:=12;Cb:=9560;END;
   20:begin  N:=204;Db:=47;B:=14;Cb:=12700;END;
   25:begin  N:=205;Db:=52;B:=15;Cb:=14000;END;
   30:begin  N:=206;Db:=62;B:=16;Cb:=19500;END;
   35:begin  N:=207;Db:=72;B:=17;Cb:=25500;END;
   40:begin  N:=208;Db:=80;B:=18;Cb:=32000;END;
   45:begin  N:=209;Db:=85;B:=19;Cb:=33200;END;
   50:begin  N:=210;Db:=90;B:=20;Cb:=35100;END;
   55:begin  N:=211;Db:=100;B:=21;Cb:=43600;END;
   60:begin  N:=212;Db:=110;B:=22;Cb:=52000;END;
   65:begin  N:=213;Db:=120;B:=23;Cb:=56000;END;
   70:begin  N:=214;Db:=125;B:=24;Cb:=61800;END;
   75:begin  N:=215;Db:=130;B:=25;Cb:=66300;END;
   80:begin  N:=216;Db:=140;B:=26;Cb:=70200;END;
   85:begin  N:=217;Db:=150;B:=28;Cb:=84200;END;
   90:begin  N:=218;Db:=160;B:=30;Cb:=95600;END;
   95:begin  N:=219;Db:=170;B:=32;Cb:=108000;END;
   100:begin  N:=220;Db:=180;B:=34;Cb:=124000;END;
   105:begin  N:=221;Db:=190;B:=36;Cb:=133000;END;
   110:begin  N:=222;Db:=200;B:=38;Cb:=146000;END;
   END;
{300}
CASE dm OF
   10:begin  N:=300;Db:=35;B:=11;Cb:=8060;END;
   12:begin  N:=301;Db:=37;B:=12;Cb:=9750;END;
   15:begin  N:=302;Db:=42;B:=13;Cb:=11400;END;
   17:begin  N:=303;Db:=47;B:=14;Cb:=13500;END;
   20:begin  N:=304;Db:=52;B:=15;Cb:=15900;END;
   25:begin  N:=305;Db:=62;B:=17;Cb:=22500;END;
   30:begin  N:=306;Db:=72;B:=19;Cb:=28100;END;
   35:begin  N:=307;Db:=80;B:=21;Cb:=33200;END;
   40:begin  N:=308;Db:=90;B:=23;Cb:=41000;END;
   45:begin  N:=309;Db:=100;B:=25;Cb:=52700;END;
   50:begin  N:=310;Db:=110;B:=27;Cb:=61800;END;
   55:begin  N:=311;Db:=120;B:=29;Cb:=71500;END;
   60:begin  N:=312;Db:=130;B:=31;Cb:=81900;END;
   65:begin  N:=313;Db:=140;B:=33;Cb:=92300;END;
   70:begin  N:=314;Db:=150;B:=35;Cb:=104000;END;
   75:begin  N:=315;Db:=160;B:=37;Cb:=112000;END;
   80:begin  N:=316;Db:=170;B:=39;Cb:=124000;END;
   85:begin  N:=317;Db:=180;B:=41;Cb:=133000;END;
   90:begin  N:=318;Db:=190;B:=43;Cb:=143000;END;
   95:begin  N:=319;Db:=200;B:=45;Cb:=153000;END;
   100:begin  N:=320;Db:=215;B:=47;Cb:=174000;END;
   105:begin  N:=321;Db:=225;B:=49;Cb:=182000;END;
   110:begin  N:=322;Db:=240;B:=50;Cb:=203000;END;
   END;
{400}
CASE dm OF
   10:begin  N:=400;Db:=0;B:=0;Cb:=0;END;
   12:begin  N:=401;Db:=0;B:=0;Cb:=0;END;
   15:begin  N:=402;Db:=0;B:=0;Cb:=0;END;
   17:begin  N:=403;Db:=62;B:=17;Cb:=22900;END;
   20:begin  N:=404;Db:=0;B:=0;Cb:=0;END;
   25:begin  N:=405;Db:=80;B:=21;Cb:=36400;END;
   30:begin  N:=406;Db:=90;B:=23;Cb:=47000;END;
   35:begin  N:=407;Db:=100;B:=25;Cb:=55300;END;
   40:begin  N:=408;Db:=110;B:=27;Cb:=63700;END;
   45:begin  N:=409;Db:=120;B:=29;Cb:=76100;END;
   50:begin  N:=410;Db:=130;B:=31;Cb:=87100;END;
   55:begin  N:=411;Db:=140;B:=33;Cb:=100000;END;
   60:begin  N:=412;Db:=150;B:=35;Cb:=108000;END;
   65:begin  N:=413;Db:=160;B:=37;Cb:=119000;END;
   70:begin  N:=414;Db:=180;B:=42;Cb:=143000;END;
   75:begin  N:=415;Db:=0;B:=0;Cb:=0;END;
   80:begin  N:=416;Db:=200;B:=48;Cb:=163000;END;
   85:begin  N:=417;Db:=210;B:=52;Cb:=174000;END;
   90:begin  N:=418;Db:=0;B:=0;Cb:=0;END;
   95:begin  N:=419;Db:=0;B:=0;Cb:=0;END;
   100:begin  N:=420;Db:=0;B:=0;Cb:=0;END;
   105:begin  N:=421;Db:=0;B:=0;Cb:=0;END;
   110:begin  N:=422;Db:=0;B:=0;Cb:=0;END;
   END;
{2100}
CASE dm OF
   10:begin  N:=2100;Db:=0;B:=0;Cb:=0;END;
   12:begin  N:=2101;Db:=0;B:=0;Cb:=0;END;
   15:begin  N:=2102;Db:=0;B:=0;Cb:=0;END;
   17:begin  N:=2103;Db:=0;B:=0;Cb:=0;END;
   20:begin  N:=2104;Db:=42;B:=12;Cb:=8800;END;
   25:begin  N:=2105;Db:=0;B:=0;Cb:=0;END;
   30:begin  N:=2106;Db:=0;B:=0;Cb:=0;END;
   35:begin  N:=2107;Db:=0;B:=0;Cb:=0;END;
   40:begin  N:=2108;Db:=0;B:=0;Cb:=0;END;
   45:begin  N:=2109;Db:=0;B:=0;Cb:=0;END;
   50:begin  N:=2110;Db:=80;B:=16;Cb:=30800;END;
   55:begin  N:=2111;Db:=90;B:=18;Cb:=34700;END;
   60:begin  N:=2112;Db:=0;B:=0;Cb:=0;END;
   65:begin  N:=2113;Db:=100;B:=18;Cb:=38000;END;
   70:begin  N:=2114;Db:=0;B:=0;Cb:=0;END;
   75:begin  N:=2115;Db:=0;B:=0;Cb:=0;END;
   80:begin  N:=2116;Db:=0;B:=0;Cb:=0;END;
   85:begin  N:=2117;Db:=0;B:=0;Cb:=0;END;
   90:begin  N:=2118;Db:=140;B:=24;Cb:=80900;END;
   95:begin  N:=2119;Db:=0;B:=0;Cb:=0;END;
   100:begin  N:=2120;Db:=0;B:=0;Cb:=0;END;
   105:begin  N:=2121;Db:=0;B:=0;Cb:=0;END;
   110:begin  N:=2122;Db:=0;B:=0;Cb:=0;END;
   END;
{2200}
CASE dm OF
   10:begin  N:=2200;Db:=0;B:=0;Cb:=0;END;
   12:begin  N:=2201;Db:=0;B:=0;Cb:=0;END;
   15:begin  N:=2202;Db:=35;B:=11;Cb:=8970;END;
   17:begin  N:=2203;Db:=0;B:=0;Cb:=0;END;
   20:begin  N:=2204;Db:=47;B:=14;Cb:=14700;END;
   25:begin  N:=2205;Db:=0;B:=0;Cb:=0;END;
   30:begin  N:=2206;Db:=62;B:=16;Cb:=22400;END;
   35:begin  N:=2207;Db:=72;B:=17;Cb:=31900;END;
   40:begin  N:=2208;Db:=80;B:=18;Cb:=41800;END;
   45:begin  N:=2209;Db:=85;B:=19;Cb:=44000;END;
   50:begin  N:=2210;Db:=90;B:=20;Cb:=45700;END;
   55:begin  N:=2211;Db:=100;B:=21;Cb:=56100;END;
   60:begin  N:=2212;Db:=110;B:=22;Cb:=64400;END;
   65:begin  N:=2213;Db:=120;B:=23;Cb:=76500;END;
   70:begin  N:=2214;Db:=125;B:=24;Cb:=79200;END;
   75:begin  N:=2215;Db:=130;B:=25;Cb:=91300;END;
   80:begin  N:=2216;Db:=140;B:=26;Cb:=106000;END;
   85:begin  N:=2217;Db:=150;B:=28;Cb:=119000;END;
   90:begin  N:=2218;Db:=160;B:=38;Cb:=142000;END;
   95:begin  N:=2219;Db:=0;B:=0;Cb:=0;END;
   100:begin  N:=2220;Db:=180;B:=34;Cb:=183000;END;
   105:begin  N:=2221;Db:=0;B:=0;Cb:=0;END;
   110:begin  N:=2222;Db:=200;B:=30;Cb:=229000;END;
   END;
{2300}
CASE dm OF
   10:begin  N:=2300;Db:=0;B:=0;Cb:=0;END;
   12:begin  N:=2301;Db:=0;B:=0;Cb:=0;END;
   15:begin  N:=2302;Db:=0;B:=0;Cb:=0;END;
   17:begin  N:=2303;Db:=0;B:=0;Cb:=0;END;
   20:begin  N:=2304;Db:=0;B:=0;Cb:=0;END;
   25:begin  N:=2305;Db:=62;B:=17;Cb:=28600;END;
   30:begin  N:=2306;Db:=72;B:=19;Cb:=36900;END;
   35:begin  N:=2307;Db:=80;B:=21;Cb:=44600;END;
   40:begin  N:=2308;Db:=90;B:=23;Cb:=56100;END;
   45:begin  N:=2309;Db:=100;B:=25;Cb:=72100;END;
   50:begin  N:=2310;Db:=110;B:=27;Cb:=88000;END;
   55:begin  N:=2311;Db:=120;B:=29;Cb:=102000;END;
   60:begin  N:=2312;Db:=130;B:=31;Cb:=123000;END;
   65:begin  N:=2313;Db:=140;B:=33;Cb:=138000;END;
   70:begin  N:=2314;Db:=150;B:=35;Cb:=151000;END;
   75:begin  N:=2315;Db:=160;B:=37;Cb:=183000;END;
   80:begin  N:=2316;Db:=170;B:=39;Cb:=190000;END;
   85:begin  N:=2317;Db:=180;B:=41;Cb:=212000;END;
   90:begin  N:=2318;Db:=190;B:=43;Cb:=242000;END;
   95:begin  N:=2319;Db:=200;B:=45;Cb:=264000;END;
   100:begin  N:=2320;Db:=251;B:=47;Cb:=303000;END;
   105:begin  N:=2321;Db:=0;B:=0;Cb:=0;END;
   110:begin  N:=2322;Db:=240;B:=50;Cb:=391000;END;
   END;
{2400}
CASE dm OF
   10:begin  N:=2400;Db:=0;B:=0;Cb:=0;END;
   12:begin  N:=2401;Db:=0;B:=0;Cb:=0;END;
   15:begin  N:=2402;Db:=0;B:=0;Cb:=0;END;
   17:begin  N:=2403;Db:=0;B:=0;Cb:=0;END;
   20:begin  N:=2404;Db:=0;B:=0;Cb:=0;END;
   25:begin  N:=2405;Db:=0;B:=0;Cb:=0;END;
   30:begin  N:=2406;Db:=0;B:=0;Cb:=0;END;
   35:begin  N:=2407;Db:=0;B:=0;Cb:=0;END;
   40:begin  N:=2408;Db:=0;B:=0;Cb:=0;END;
   45:begin  N:=2409;Db:=120;B:=29;Cb:=106000;END;
   50:begin  N:=2410;Db:=0;B:=0;Cb:=0;END;
   55:begin  N:=2411;Db:=140;B:=33;Cb:=142000;END;
   60:begin  N:=2412;Db:=0;B:=0;Cb:=0;END;
   65:begin  N:=2413;Db:=160;B:=37;Cb:=183000;END;
   70:begin  N:=2414;Db:=0;B:=0;Cb:=0;END;
   75:begin  N:=2415;Db:=0;B:=0;Cb:=0;END;
   80:begin  N:=2416;Db:=200;B:=48;Cb:=303000;END;
   85:begin  N:=2417;Db:=0;B:=0;Cb:=0;END;
   90:begin  N:=2418;Db:=0;B:=0;Cb:=0;END;
   95:begin  N:=2419;Db:=0;B:=0;Cb:=0;END;
   100:begin  N:=2420;Db:=0;B:=0;Cb:=0;END;
   105:begin  N:=2421;Db:=0;B:=0;Cb:=0;END;
   110:begin  N:=2422;Db:=0;B:=0;Cb:=0;END;
   END;
{obr}
{CASE dm OF
   10:begin  N:=300;Db:=;B:=;Cb:=;END;
   12:begin  N:=301;Db:=;B:=;Cb:=;END;
   15:begin  N:=302;Db:=;B:=;Cb:=;END;
   17:begin  N:=303;Db:=;B:=;Cb:=;END;
   20:begin  N:=304;Db:=;B:=;Cb:=;END;
   25:begin  N:=305;Db:=;B:=;Cb:=;END;
   30:begin  N:=306;Db:=;B:=;Cb:=;END;
   35:begin  N:=307;Db:=;B:=;Cb:=;END;
   40:begin  N:=308;Db:=;B:=;Cb:=;END;
   45:begin  N:=309;Db:=;B:=;Cb:=;END;
   50:begin  N:=310;Db:=;B:=;Cb:=;END;
   55:begin  N:=311;Db:=;B:=;Cb:=;END;
   60:begin  N:=312;Db:=;B:=;Cb:=;END;
   65:begin  N:=313;Db:=;B:=;Cb:=;END;
   70:begin  N:=314;Db:=;B:=;Cb:=;END;
   75:begin  N:=315;Db:=;B:=;Cb:=;END;
   80:begin  N:=316;Db:=;B:=;Cb:=;END;
   85:begin  N:=317;Db:=;B:=;Cb:=;END;
   90:begin  N:=318;Db:=;B:=;Cb:=;END;
   95:begin  N:=319;Db:=;B:=;Cb:=;END;
   100:begin  N:=320;Db:=;B:=;Cb:=;END;
   105:begin  N:=321;Db:=;B:=;Cb:=;END;
   110:begin  N:=322;Db:=;B:=;Cb:=;END;
   END;}
READKEY;
End.