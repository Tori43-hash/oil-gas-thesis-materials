   data .159,570,264,0,0,0
   data .219,2180,1311,0,0,0
   data .219,560,1564,0,0,0
print"	        Расчет движения газожидкостных смесей"
print"  	        в промысловых трубопроводах"
print"          	      Потери давления"
10 dim b(100),ph(100),pg(100),pb(100),ba(100),mg(100),mf(100),n(10)
20 print
   input "	 Содержание воды в долях b="b
   input "	 Плотность нефти ph="ph
   input "	 Плотность газа pg="pg
   input " 	 Плотность воды pb="pb
   input "	 Расходное газосод-ие смеси ba="ba
   input "       Вязкость жидкой фазы mf="mf
   input "	 Вязкость газовой фазы mg="mg
   input "	 Количесво участков n="n
   for mf=5e-3 to 5e-2 step 5e-3
40 for i=1 to n
'   read d,l,qf,fp,zk,zn
    print"	"i"-ый участок"
    input "	 Диаметр трубопровода d="d
    input "	 Длина трубопровода l="l
    input "	 Дебит скважины по жидкости gf="qf
    input "	 Площадь под участками подъема и спуска fp="fp
    input "	 Профиль трубопровода на конце zk="zk
    input " 	 Профиль трубопровода в начале zn="zn
    input "	 Кол-во задвижек o1="o1
    input "	 Кол-во поворотов o2="o2
70 rg=ph*(1-b)+b*pb
80 q1=qf*1000/(rg*86400)
90 q2=q1*ba/(1-ba)
100 f1=3.14*d^2/4
110 v1=mf/ph
120 rein=4*q1/(3.14*d*v1)
130 if rein<=2000 then m=1:f=4.15:goto 150
140 m=0.25:f=0.0246
150 dpg=(f*q1^(2-m)*v1^m*l*rg)/(d^(5-m))
160 usm=(q1+q2)/(3.14*d^2/4)
170 fr=usm^2/(9.81*d)
190 a=ba*(mg/mf)^.0475
200 u1=q1/((1-a)*f1)
210 re=u1*d*sqr(1-a)/v1
    ff=(.284-.156*2/7)*re^.25
    dp1=dpg*ff/sqr((1-a)^(2-m))
    dp2=(pg*(1-a)*a)/((mg/mf)^.0475-a)^2
    dps=dp1*(1+dp2)
     if zk=0 and zn=0 then print"	 Общие потери гориз-го.труб-да ";
     if zk=0 and zn=0 then print"на "i" участке =";USING"#########.###";dps
    if zk=0 and zn=0 then dp0=dps : goto 300
    c1=.0079*2-2*exp(-15*.85)
    rs=rg*(1-ba)+pg*ba
    dp0=dps*(1+c1*fp)+(zk-zn)*9.81*rs
     print "        Общие потери DP0 на "i" участке рельефной местности ="dp0
300 dp=dp+dp0
    next i
    print"	 Общие потери ++dp="dp" при вязкости жидкости mf=";using"##.######";mf
'    restore
    next mf
    end