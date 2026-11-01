program termod;
 uses crt;
 var alf2t,alf2r,tc1,tc2,tc3,del1,del2,del3,lamb1,lamb2,lamb3:real;
 q,tp1,tp2,tp3,tv,delt2,q1,q2,q3,qt,qd,c,d,t1,t2,t3,tcl1,tcl2,tcl3,tcl1n,tcl2n:real;
 k:integer;
 label 3,4;

 {расчет двухслойной изоляции}
 procedure dviz;
  label 1;
 begin
  writeln('Двухслойная изоляция');
  tcl1:=(tc1+tc2)/2;tcl2:=tc2;
  writeln('Начальные tcl1=',tcl1:4:1,' tcl2=',tcl2:4:1);
1:
  t1:=(tc1+tcl1)/2;lamb1:=0.9+0.0007*t1;
  t2:=(tcl1+tcl2)/2;lamb2:=0.143+0.00019*t2;
  writeln('t1=',t1:4:4,', lamb1=',lamb1:4:4,', t2=',t2:4:4,', lamb2=',lamb2:4:4,',');
  tcl1n:=((tc1*lamb1/del1)+(tc2*lamb2/del2))/(lamb1/del1+lamb2/del2);
  writeln('tcl1n=',tcl1n:4:4);
  if abs(tcl1n-tcl1)>0.001 then begin tcl1:=tcl1n;goto 1;end;
  q1:=lamb1*(tc1-tcl1)/del1;q2:=lamb2*(tcl1-tc2)/del2;
  writeln('q1=',q1:4:4,' q2=',q2:4:4);
  if abs(q1-q2)<0.1 then qd:=(q1+q2)/2;
  writeln('Плотность теплового потока q=',qd:3:6,' Вт/м2');
  writeln('tcl1=',tcl1:4:4,' tcl2=',tcl2:4:0);
 end;

 {расчет трехслойной изоляции}
 procedure triz;
  label 2;
 begin
  writeln('Трехслойная изоляция ');
  tcl1:=(tc1+tc2)/2;tcl2:=(tcl1+tc2)/2;
  writeln('Начальные tcl1=',tcl1:4:1,' tcl2=',tcl2:4:1);
2: t1:=(tc1+tcl1)/2; t2:=(tcl1+tcl2)/2;t3:=(tc2+tcl2)/2;
  lamb1:=0.1+0.0002*t1;
  lamb2:=0.081+0.00023*t2;
  lamb3:=0.157+0.00018*t3;
  write('t1=',t1:4:4,', lamb1=',lamb1:4:4,', t2=',t2:4:4,', lamb2=',lamb2:4:4);
  writeln(', t3=',t3:4:4,', lamb3=',lamb3:4:4);
  c:=(lamb1*lamb2)/(del1*del2);d:=(lamb1/del1+lamb2/del2)*lamb3/del3;
  write('c=',c:4:4,' d=',d:4:4);
  tcl2n:=(c*tc1+d*tc2)/(c+d);
  tcl1n:=((tc1*lamb1/del1)+(tcl2n*lamb2/del2))/(lamb1/del1+lamb2/del2);
  writeln(' tcl1n=',tcl1n:4:4,' tcl2n=',tcl2n:4:4);
  if (abs(tcl1n-tcl1)>0.001) or (abs(tcl2n-tcl2)>0.0001) then begin
   tcl1:=tcl1n;tcl2:=tcl2n;goto 2;end;
  q1:=lamb1*(tc1-tcl1)/del1;
  q2:=lamb2*(tcl1-tcl2)/del2;
  q3:=lamb3*(tcl2-tc2)/del3;
  writeln('q1=',q1:4:4,' q2=',q2:4:4,' q3=',q3:4:4);
  if (abs(q1-q2)<0.1) and (abs(q1-q3)<0.1) then qt:=(q1+q2+q3)/3;
  writeln('Плотность теплового потока q=',qt:3:6,' Вт/м2');
  writeln('tcl1=',tcl1:4:4,' tcl2=',tcl2:4:4);
 end;

 {проверка результатов расчета тепловой изоляции}
 procedure prov;
 begin
  tv:=5;delt2:=tc2-tv;
  write(' delt2=',delt2:1:0);
  alf2r:=q/delt2;
  write(' Расчетное alf2=',alf2r:5:2,' Введите табличное alf2-');readln(alf2t);
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
 k:=0;tc1:=800;
3:
 clrscr;
 tc2:=100+10*k;del1:=0.065;del2:=0.01;tp1:=1650;tp2:=700;
 dviz;write('tc2=',tc2:4:0);q:=qd;prov;
 if abs(alf2r-alf2t)>1 then begin
  k:=k+1;writeln('Нажмите клавишу ENTER');readln;goto 3;
 end;
 if (tcl1<tp1) and (tcl2<tp2) then writeln('Условие tcli<tpi выполняется')
  else writeln('Условие tcli<tpi не выполняется');
 k:=0;readln;
4:
 clrscr;
 tc2:=50+10*k;del1:=0.04;del2:=0.03;del3:=0.005;
 tp1:=1050;tp2:=600;tp3:=600;
 triz;write('tc1=',tc1:4:0,' tc2=',tc2:4:0);q:=qt;prov;
 if abs(alf2r-alf2t)>1 then begin
  k:=k+1;writeln('Нажмите клавишу ENTER');readln;goto 4;
 end;
 if (tcl1<tp1) and (tcl2<tp2) then writeln('Условие tcli<tpi выполняется')
  else writeln('Условие tcli<tpi не выполняется');
 rasek;readln;
end.




