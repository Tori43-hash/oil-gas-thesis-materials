program izol2;
    uses crt;
     const d1=0.065; d2=0.01; tc1=800; tv=1;
     label lb1;
var
     a,tsl1,t1,t2,tsl2,x,l1,l2,q1,q2,q,tc2,deltat2:real;
begin
             clrscr;
             writeln('***********************************');
             writeln('Расчет двухслойной изоляции');
             writeln('***********************************');
             write('tc2=');readln(tc2);
             tsl1:=(tc1+tc2)/2;
     lb1:
             t1:=(tc1+tsl1)/2; l1:=1.3+0.00041*t1;
             t2:=(tsl1+tc2)/2; l2:=0.162+0.000169*t2;
             tsl2:=(tc1*l1/d1+tc2*l2/d2)/(l1/d1+l2/d2);
             x:=abs(tsl2-tsl1);
        writeln('l1=',l1:4:6,'  l2=',l2:4:6);
        writeln('Tc1=',tsl2:4:6);
     if x>0.0001 then begin
             tsl1:=tsl2;
             goto lb1;
  end
       else begin
        writeln('l1=',l1:4:6,'  l2=',l2:4:6);
        writeln('Tc1=',tsl2:4:6);
             q1:=l1/d1*(tc1-tsl1);
             q2:=l2/d2*(tsl2-tc2);
             q:=(q1+q2)/2;
        writeln('q1=',q1:4:4,' q2=',q2:4:4,'  q=',q:4:4);
             deltat2:=tc2-tv;
             a:=q/deltat2;
        writeln('deltaT2:=',deltat2:4:2,'   a=',a:4:4);
   end;
end.




