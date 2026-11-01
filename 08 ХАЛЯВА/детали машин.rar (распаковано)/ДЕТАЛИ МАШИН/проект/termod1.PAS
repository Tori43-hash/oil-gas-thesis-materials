program termod;
 uses crt;
 var alf2t,alf2r,tc1,tc2t,tc2d,tc3,del1,del2,del3,lamb1,lamb2,lamb3:real;
 tp1,tp2,tp3,tv,delt2,q1,q2,q3,qt,qd,c,d,t1,t2,t3,tcl1,tcl2,tcl3,tcl1n,tcl2n:real;
 label 3;

 {расчет двухслойной изоляции}
 procedure dviz;
  label 1;
 begin
  tcl1:=(tc1+tc2d)/2;tcl2:=tc2d;
1: t1:=(tc1+tcl1)/2;lamb1:=0.84+0.00006*t1;
  t2:=(tcl1+tcl2)/2;lamb2:=0.162+0.000169*t2;
  tcl1n:=((tc1*lamb1/del1)+(tc2d*lamb2/del2))/(lamb1/del1+lamb2/del2);
  if abs(tcl1n-tcl1)>0.0001 then begin tcl1:=tcl1n;goto 1;end;
  q1:=lamb1*(tc1-tcl1)/del1;q2:=lamb2*(tcl1-tc2d)/del2;
  if abs(q1-q2)<0.1 then qd:=(q1+q2)/2;
  writeln('Двухслойная изоляция');
  writeln('Плотность теплового потока q=',qd:3:6,' Вт/м2');
  writeln('tcl1=',tcl1:4:4);
  if (tcl1<tp1) and (tcl2<tp2) then writeln('Условие tcli<tpi выполняется')
   else writeln('Условие tcli<tpi не выполняется');
 end;

 {расчет трехслойной изоляции}
 procedure triz;
  label 2;
 begin
  tcl1:=(tc1+tc2t)/2;tcl2:=(tc1+tc2t)/2;
2: t1:=(tc1+tcl1)/2; t2:=(tcl1+tcl2)/2;t3:=(tc2t+tcl2)/2;
  if t1>500 then lamb1:=0.178 else lamb1:=0.12;
  if t2>125 then lamb2:=0.7 else lamb2:=0.42;
  lamb3:=0.157+0.00018*t3;
  c:=(lamb1*lamb2)/(del1*del2);d:=(lamb1/del1+lamb2/del2)*lamb3/del3;
  tcl2n:=(c*tc1+d*tc2t)/(c+d);
  tcl1n:=((tc1*lamb1/del1)+(tcl2*lamb2/del2))/(lamb1/del1+lamb2/del2);
  if (abs(tcl1n-tcl1)>0.0001) or (abs(tcl2n-tcl2)>0.0001) then begin
   tcl1:=tcl1n;tcl2:=tcl2n;goto 2;end;
  q1:=lamb1*(tc1-tcl1)/del1;
  q2:=lamb2*(tcl1-tcl2)/del2;
  q3:=lamb3*(tcl2-tc2t)/del3;
  if (abs(q1-q2)<0.1) and (abs(q1-q3)<0.1) then qt:=(q1+q2+q3)/3;
  writeln('Трехслойная изоляция ');
  writeln('Плотность теплового потока q=',qt:3:6,' Вт/м2');
  writeln('tcl1=',tcl1:4:4,' tcl2=',tcl2:4:4);
  if (tcl1<tp1) and (tcl2<tp2) and (tcl3<tp3) then writeln('Условие tcli<tpi выполняется')
   else writeln('Условие tcli<tpi не выполняется');
 end;

 {проверка результатов расчета тепловой изоляции}
 procedure prov;
 begin
  tv:=1;delt2:=tc2t-tv;
  writeln('delt2=',delt2:1:0);
  write('Введите alf2 (по таблице)-');readln(alf2t);
  alf2r:=qt/delt2;
  writeln('расчетное alf=',alf2r:5:2,' табличное alf=',alf2t:5:2)
 end;

 {расчет экономии топлива}
 procedure rasek;
 var h,Qpn,dcr,dn,dv,d0,tau,n,dQb,f,dq,ch,dG,Cb:real;
 begin
  tau:=2592*10000;dn:=1;dv:=0.85;d0:=0.3;h:=1.65;
  Qpn:=42000;ch:=30;dcr:=(dv+dn)/2;
  n:=qd/qt;dq:=qd-qt;f:=pi*(dcr*h+(dn*dn-d0*d0));
  dqb:=dq*f*tau/1000;
  dG:=dQb/Qpn;
  Cb:=ch*dG/1000;
  writeln('Коэффициент отличия теплопотерь в окружающую среду при новой и старой изоляции');
  writeln('n=',n:4:4);
  writeln('Теплота сгорания-42000 кДж/кг');
  writeln('Цена одной тонны-30 р/т');
  writeln('Время работы-300 дней=25920000 с');
  writeln('экономия топлива в денежном выражении=',Cb:2:2,' р/г');
 end;

 {основная программа}
begin

 tc2d:=100;tc2t:=50;
3:
 clrscr;
 del1:=0.065;del2:=0.01;tc1:=800;tp1:=1400;tp2:=300;
 dviz;
 del1:=0.04;del2:=0.03;del3:=0.005;tc1:=800;tp1:=1100;tp2:=400;tp3:=600;
 triz;
 prov;
 if abs(alf2r-alf2t)>1 then begin
  tc2d:=tc2d+20;tc2t:=tc2t+20;
  writeln('Нажмите клавишу ENTER');
  readln;
  goto 3;
 end;
 rasek;
 readln;
end.




