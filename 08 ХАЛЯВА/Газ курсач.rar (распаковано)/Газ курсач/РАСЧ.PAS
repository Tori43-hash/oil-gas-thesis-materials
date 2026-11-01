  Program kurs;
      Type Vector=array[1..20] of real;
           Matrica=array[1..20,1..20] of real;
           Label 1,2;
      Var
        Q1,Qd1:Matrica;
        Q,Qd,Ppl,x,Pc,qc,Ppl1,x1,Pc1,qc1,m:Vector;
        Qg,Pn,Tn,A,B,d,e,f,c,Zn,Vgn,k:real;
        i,n,j:integer;
  Begin
    Writeln (' Расчёт показателей разработки газового ');
    Writeln ('    месторождения при газовом режиме    ');
    Write ('Запасы газа Qg=');Readln(Qg);
    Write ('Начальные пластовое давление Pn=');Readln(Pn);
    Write ('Начальная пластовая температура Tn=');Readln(Tn);
    Write ('Коэффициент фильтрационных сопротивлений A=');Readln(A);
    Write ('коэффициент фильтрационных сопротивлений B=');Readln(B);
    Write ('Депрессия на пласт d=');Readln(d);
    n:=13;
     For i:=1 to n do begin
       Write ('Добыча гоза по годам Q',i,'=');Read(Q[i]);
     end;
    e:=0.000482;
    f:=0.01685;
    c:=1.01;
    Zn:=e*Pn*Pn-f*Pn+c;
    Vgn:=Qg*Zn*0.1*Tn/(Pn*293);
    Qd[1]:=Q[1];
     For i:=1 to n-1 do
      Qd[i+1]:=Qd[i]+Q[i+1];
     Writeln (' Результаты расчётов');
     Writeln (' Ppl','    ','  Pc','   ','  qc','  ',' m');
     For i:=1 to n do begin
      x[i]:=Pn/Zn-Qd[i]*0.1*Tn/(Vgn*293);
      Ppl[i]:=(f+1/x[i]-SQRT(SQR(f+1/x[i])-4*e*c))/(2*e);
      Pc[i]:=Ppl[i]-d;
      qc[i]:=-A/(2*B)+SQRT(A*A/(4*B*B)+(Ppl[i]*Ppl[i]-Pc[i]*Pc[i])/B);
      m[i]:=Q[i]*1000000/(qc[i]*330);
      Writeln (Ppl[i]:5:2, Pc[i]:10:2, qc[i]:10:2, m[i]:6:0);
     end;
      k:=m[13];
     For i:=14 to 18 do begin
      j:=0;
      Q1[i,1]:=Q[i-1];
   1:  j:=j+1;
      Qd1[i,j]:=Qd[i-1]+(Q[i-1]+Q1[i,j])*0.5;
      x1[j]:=Pn/Zn-Qd1[i,j]*0.1*Tn/(Vgn*293);
      Ppl1[j]:=(f+1/x1[j]-SQRT(SQR(f+1/x1[j])-4*e*c))/(2*e);
      Pc1[j]:=Ppl1[j]-d;
      qc1[j]:=-A/(2*B)+SQRT(A*A/(4*B*B)+(Ppl1[j]*Ppl1[j]-Pc1[j]*Pc1[j])/B);
      Q1[i,j+1]:=k*qc1[j]*330/1000000;
      If j>=3 then goto 2;
       j:=j+1;
       Qd1[i,j]:=Qd[i-1]+(Q[i-1]+Q1[i,j])*0.5;
       x1[j]:=Pn/Zn-Qd1[i,j]*0.1*Tn/(Vgn*293);
       Ppl1[j]:=(f+1/x1[j]-SQRT(SQR(f+1/x1[j])-4*e*c))/(2*e);
       Pc1[j]:=Ppl1[j]-d;
       qc1[j]:=-A/(2*B)+SQRT(A*A/(4*B*B)+(Ppl1[j]*Ppl1[j]-Pc1[j]*Pc1[j])/B);
       Q1[i,j+1]:=k*qc1[j]*330/1000000;
     2: If ABS((Ppl1[j]-Ppl1[j-1]))>0.01 then goto 1;
        Qd[i]:=Qd1[i,j];
        Q[i]:=Q1[i,j];
       Writeln (Ppl1[j]:5:2, Pc1[j]:10:2, qc1[j]:10:2, m[13]:6:0, Q[i]:10:2);
      end;
    end.
