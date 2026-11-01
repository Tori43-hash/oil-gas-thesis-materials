program Skvazhina;
uses crt;
  const

  tau=180;
  A=0.00234;
  Hm=450; {толщина слоя вечномерзлых пород}
  G=0.04; {геотермический градиент}
  Gm=0.024324; {геотермический градиент в зоне вечной мерзлоты}
  lambda=0.021; {коэф-т гидравл-го сопротивления (вычислять!!!)}
  Cg=2590;
  Cg1=2668;
  Cp=1843600;
  lambdap=1.7;
  Cm=1440000;
  lambdam=1.8;
  betta=0.0007;
{Описание состава газа и свойств компонентов}
        y1=0.978;y2=0.0015;y3=0.0002;y4=0.0023;y5=0.018;R=8.31441;mu1=3.89;
        ro1=0.717;ro2=1.344;ro3=1.967;ro4=1.977;ro5=1.251;mu=4.09;
        Pkr1=4.7;Pkr2=4.9;Pkr3=4.3;Pkr4=7.64;Pkr5=3.53;
        Tkr1=190.7;Tkr2=306.2;Tkr3=369.8;Tkr4=304.0;Tkr5=125.9;
        M1=16.043;M2=30.07;M3=44.097;M4=44.011;M5=28.016;
{END}{Описание состава газа и свойств компонентов}
var Tpl,Py,Ppl,Q,H,Hp,Rc,Rk,Ppk,Tpk,ROsm,ro,Gg,f,alfa,alfam:real;
      fm,Teta,Dvn,dT,Pz,Pmo,Pz1,Pz2,Di,Di1,Pmo1,Pmo2,Psr,Tsr,Ppr,Tpr:real;
      Ty,Zsr,Tz,Tmo,Smo,S,Tetamo,x,T,P,Msm:real;


{функция возведения в степень}
function step(a,b:real):real;
begin
if (a<0) then
 if round(b) mod 2=0 then step:=exp(b*ln(abs(a))) else step:=-exp(b*ln(abs(a)))
  else step:=exp(b*ln(abs(a)))
end;

begin clrscr;
  writeln('Ввод исходных данных:');
  write('   Пластовое давление,МПа Ppl=');readln(Ppl);
  write('   Пластовая температура,К Tpl=');readln(Tpl);
  write('   Давление на устье скважины,МПа Py=');readln(Py);
  write('   Дебит скважины,м3/сут Q=');readln(Q);
  write('   Глубина скважины,м H=');readln(H);
  write('   Толщина пласта,м Hp=');readln(Hp);
  write('   Внутренний диаметр НКТ,м Dvn=');readln(Dvn);
  write('   Радиус скважины,м Rc=');readln(Rc);
  write('   Радиус контура питания,м Rk=');readln(Rk);
  {Расчет свойств смеси}
  Ppk:=y1*Pkr1+y2*Pkr2+y3*Pkr3+y4*Pkr4+y5*Pkr5;
  Tpk:=y1*Tkr1+y2*Tkr2+y3*Tkr3+y4*Tkr4+y5*Tkr5;
  ROsm:=y1*ro1+y2*ro2+y3*ro3+y4*ro4+y5*ro5;
  Msm:=y1*M1+y2*M2+y3*M3+y4*M4+y5*M5;
  ro:=ROsm/1.293;
  {END}{Расчет свойств смеси}
  Gg:=54*ro*Q;
  f:=ln(1+sqrt(pi*lambdap*tau/(Cp*sqr(Rc))));
  alfa:=2*pi*lambdap/(Gg*Cg*f);
  fm:=ln(1+sqrt(pi*lambdam*tau/(Cm*sqr(Rc))));
  alfam:=2*pi*lambdam/(Gg*Cm*fm);
  Pz:=Py+0.005;
  Pmo:=Py+0.2;
  Tsr:=283; Psr:=(Py+Ppl)/2;
  Tpr:=Tsr/Tpk;
  Ppr:=Psr/Ppk;
  Zsr:=step(0.4*ln(Tpr)/ln(10)+0.73, Ppr) + 0.1*Ppr;
{  Zsr:=0.91;}
{  Psr:=(Py+Pz)/2;
  Tsr:=293;}
  Di1:=mu1-Zsr*R*Tpl/(Msm*Cg1*Ppl);
  Di:=mu-Zsr*R*Tsr/(Msm*Cg*Psr);
  repeat
    Pz1:=Pz;
    Pmo1:=Pmo;
    dT:=Di1*(Ppl-Pz1)*(ln(1+Gg*Cg1*tau/(pi*Hp*Cp*sqr(Rc)))/(ln(Rk/Rc)));
    writeln(' (Ppl-Pz1)=',(Ppl-Pz1):4:3);
    writeln(' dT=',dT:4:3);
    Tz:=Tpl-dT;
    writeln(' Tz=',Tz:4:3);
    Tmo:=Tpl-G*(H-Hm)-dT*exp(-alfa*(H-Hm))+(G-Di*(Pz1-Pmo1)/(H-Hm)-A/Cg)*((1-exp(-alfa*(H-Hm)))/alfa);
    writeln('мерзлые породы Tm=',Tmo:4:3); readln;
    Ty:=Tmo-Gm*Hm+(Gm-Di*(Pmo1-Py)/Hm-A/Cg)*((1-exp(-alfam*Hm))*betta/alfam);
    Psr:=(Py+Pz1)/2;
    Tsr:=(Tz-Ty)/ln(Tz/Ty);
    Ppr:=Psr/Ppk;
    Tpr:=Tsr/Tpk;
   {Zsr:=exp(Ppr*ln(0.4*ln(Tpr)/ln(10)+0.73))+0.1*Ppr;}
    Zsr:=step(0.4*ln(Tpr)/ln(10)+0.73, Ppr) + 0.1*Ppr;
    Smo:=0.03415*ro*Hm/(Tsr*Zsr);
    Tetamo:=1.325e-12*lambda*sqr(Zsr)*sqr(Tsr)/step(Dvn,5)*(exp(2*Smo)-1);
    Pmo2:=sqrt(sqr(Py)*exp(2*Smo)+Tetamo*sqr(Q/1000));
    S:=0.03415*ro*H/(Tsr*Zsr);
    Teta:=1.325e-12*lambda*sqr(Zsr)*sqr(Tsr)/step(Dvn,5)*(exp(2*S)-1);
    Pz2:=sqrt(sqr(Py)*exp(2*S)+Teta*sqr(Q/1000));
    Di1:=mu1-Zsr*R*Tpl/(Msm*Cg1*Ppl);
    Di:=mu-Zsr*R*Tsr/(Msm*Cg*Psr);
    Pz:=Pz2;
    if Pz2>Ppl then begin  writeln('Неточные исходные данные...'); halt(0); end;
    Pmo:=Pmo2;
  until abs(Pz1-Pz2)<=0.01;
  writeln('Давление на забое скважины,МПа Pz=',Pz:8:3);
  writeln('Температура на забое скважины,К Tz=',Tz:8:3);
  writeln('Температура на устье скважины,К Ty=',Ty:8:3);
  writeln('Диф.коэффициент Джоуля-Томпсона в трубе,К/МПа Di=',Di:8:3);
writeln('Диф.коэффициент Джоуля-Томпсона в пласте,К/МПа Di1=',Di1:8:3);
  x:=H-200; {200 м - шаг расчета}

  {Распределение температуры}
  repeat
    S:=0.03415*ro*x/(Tsr*Zsr);
    Teta:=1.325e-12*lambda*sqr(Zsr)*sqr(Tsr)/step(Dvn,5)*(exp(2*S)-1);
    P:=sqrt(sqr(Py)*exp(2*S)+Teta*sqr(Q/1000));
    if x>=Hm then T:=Tpl-G*(H-x)-dT*exp(-alfa*(H-x))
                      +(G-Di*(Pz-P)/(H-x)-A/Cg)*((1-exp(-alfa*(H-x)))/alfa)
      else T:=Tmo-Gm*(Hm-x)+(Gm-Di*(Pmo-P)/(Hm-x)-A/Cg)
              *((1-exp(-alfam*(Hm-x)))/alfam*betta);
writeln('Глубина,м x=',x:6:1,' Давление,МПа P=',P:6:3,' Температура,К T=',T:8:3);
    x:=x-200; {200 м - шаг расчета}
  until x<0;
end.

