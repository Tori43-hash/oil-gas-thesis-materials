program izol3;
 uses crt;
   label 1;
   const tc1=800;delta1=0.04;delta2=0.03;delta3=0.005;tv=4;
var
   qq,dq,dg,c1,f,n,qn,qc,z,tsl1,tsl2,tc2,t1,t2,t3,l1,l2,l3,b1,a1,b2,a2:real;
   dc,tau,c,d,tsl22,tsl11,x,y,q1,q2,q3,q,a,deltat2:real;
begin
          clrscr;
    writeln('***********************************');
    writeln('Расчет трехслойной изоляции');
     writeln('***********************************');
   write('tc2=');readln(tc2);
          tsl1:=(tc1+tc2)/2;
          tsl2:=(tsl1+tc2)/2;
         1:
          t1:=(tc1+tsl1)/2;
          l1:=0.117+0.000122*t1;
          t2:=(tsl1+tsl2)/2;
          l2:=-0.125+0.0066*t2;
          t3:=(tsl2+tc2)/2; l3:=0.157+0.00018*t3;
          c:=(l1*l2)/(delta1*delta2);
          d:=(l1/delta1+l2/delta2)*l3/delta3;
          tsl22:=(c*tc1+d*tc2)/(c+d);
          tsl11:=(tc1*l1/delta1+tsl2*l2/delta2)/(l1/delta1+l2/delta2);
          x:=abs(tsl22-tsl2);
          y:=abs(tsl11-tsl1);
     writeln('L1=',l1:4:6,'   L2=',l2:4:6,'   L3=',l3:4:6);
     writeln('Tc1=',tsl11:4:7,'   Tc2=',tsl22:4:7);
   if (x>0.0001) and (y>0.0001) then
begin
     tsl1:=tsl11;
     tsl2:=tsl22;
     goto 1;
end
  else  begin
     writeln('L1=',l1:4:6,'   L2=',l2:4:6,'   L3=',l3:4:6);
     writeln('Tc1=',tsl11:4:7,'   Tc2=',tsl22:4:7);
          q1:=(l1/delta1)*(tc1-tsl1){/delta1};
          q2:=(l2/delta2)*(tsl1-tsl2){/delta2};
          q3:=(l3/delta3)*(tsl2-tc2){/delta3};
          q:=(q1+q2+q3)/3;
     writeln('q1=',q1:6:6,'   q2=',q2:6:6,'   q3=',q3:6:6,'   q=',q:6:6);
          deltat2:=(tc2-tv);
          a:=q/deltat2;
     writeln('deltaT2=',deltat2:6:1,'   a=',a:6:2);
   end;
writeln('Продолжить ? да-1,нет-2');
readln(z);
writeln('****************************');
writeln('Расчет экономии');
writeln('****************************');
if z=1 then begin
write('Введите qc=');
readln(qc);
qn:=q;
n:=qc/qn;
dq:=qc-qn;
dc:=0.925;tau:=25920000;
F:=3.14*(dc*1.65+(1-sqr(0.3)));
qq:=dq*F*tau/1000;
dG:=qq/42000;
c1:=30*dg/1000;
writeln('отличие теплопотерь n=',n:2:2);
writeln('разность в плотностях тепл. потока  dq=',dq:4:4,'Вт/м2');
writeln('площадь изоляции F=',F:2:2,'м2');
writeln( 'годовая экономия теплоты  dQ=',qq:6:3,'кДж/год');
writeln('годовая экономия топлива dG=',dG:4:2,'кг');
writeln('экономия в денежном выражении C=',c1:3:2,'руб/год');
end;
end.





