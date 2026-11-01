function zz1(p,t:real;st:vectst;u:vect;kk:integer):real;
Const R=0.0083675;
      eps=0.00001;
     Tk1:Array[1..7] of real = (126.3, 304.2, 190.55,
     305.43, 369.82, 425.2, 470.4);
     Pk1:Array[1..7] of real = (3.4, 7.381, 4.7,
     4.9, 4.3, 3.8, 3.4);
     w1: Array[1..7] of real = (0.04, 0.231, 0.013,
     0.108, 0.182, 0.201, 0.252);
     m1:array[1..7] of real = (28.016,44.011,16.043,30.7,44.097,58.124,72.151);
     c1: Array[1..7,1..7] of real =
    ((0,     0.012, 0.031, 0.042, 0.091, 0.005, 0.005),
     (0.012, 0,     0.098, 0.005, 0.124, 0.131, 0.127),
     (0.031, 0.098, 0,     0.005, 0.017,  0.027, 0.03),
     (0.042, 0.005, 0.005, 0,     0.005, 0.01,  0.01),
     (0.091, 0.124, 0.017, 0.005, 0,     0.003, 0.012),
     (0.005, 0.135, 0.027, 0.01,  0.003, 0,     0.005),
     (0.005, 0.127, 0.03,  0.01,  0.012,  0.017, 0));
Type
     matr=Array[1..7,1..7] of real;
     Func=function(a,b,c,d,z:real;n:vect;kk:integer):real;
Var  c:matr;
     Pk,Tk,ww,w,mm,a,b,x,y,k,lnw,lnl,fw,fl:vect;
     Rn: Array[1..7] of Integer;
     i,j,n,chiclo,chiclo2,iter,zikl,iter2:integer;
    bm,am,s,Az,Bz,z2,z,z1,F,F1,F2,amw,bmw,aml,bml,al,bl,
     pn,pkk,aw,bw,zw,zl,ZF,aa,bb,ss,s1:Real;
     rep:boolean;
Procedure COMP(st:vectst;kk:integer;var pk,tk,w:vect;var c:matr);
var j,i:integer;
begin
 For j:=1 to kk do
 begin
    if st[j]='азот' then i:=1;
    if st[j]='углекислый газ'  then i:=2;
    if st[j]='метан'then i:=3;
    if st[j]='этан'then i:=4;
    if st[j]='пропан'then i:=5;
    if st[j]='бутан'then i:=6;
    if st[j]='пентан'then i:=7;
    Pk[j]:=Pk1[i]; Tk[j]:=Tk1[i];
    w[j]:=w1[i]; mm[j]:=m1[i];
    Rn[j]:=i;
 end;
  For j:=1 to kk do  For i:=1 to kk do c[j,i]:=c1[Rn[j],Rn[i]];
end;
 Procedure AB(pk,tk,w:vect;c:matr;t:real;kk:integer;var a,b:vect);
    var i:integer;
        m,ac,alf:real;
    Begin
    For i:=1 to kk do
     begin
       ac:=0.457235*sqr(R*Tk[i])/Pk[i];
       m:=0.37464+1.54226*w[i]-0.26992*w[i]*w[i];
       alf:=sqr(1+m*(1-sqrt(T/Tk[i])));
       b[i]:=0.077796*R*Tk[i]/Pk[i];
       a[i]:=ac*alf;
     end;
    end;
Procedure AMBM(x,a,b:vect;c:matr;p,t:real;kk:integer;var am,bm,AA,BB:real);
var i,j:integer;
    a1,b1:real;
    Begin
    am:=0;bm:=0;
    for i:=1 to kk do
    begin
    bm:=bm+x[i]*b[i];
    for j:=1 to kk do Am:=Am+x[i]*x[j]*(1-C[i,j])*sqrt(a[i]*a[j]);
    end;
    AA:=(am*p)/(sqr(r)*sqr(t));
    BB:=(bm*p)/(r*t);
    end;
FUNCTION Z_W(al,bl,aw,bw,z:real;n:vect;kk:integer):real;far;
var f:real;
    i:integer;
begin
    F:=z*z*z-(1-Bw)*z*z+(Aw-3*Bw*Bw-2*Bw)*z-(Aw*Bw-Bw*Bw-Bw*Bw*Bw);
    Z_W:=f;
end;
Procedure KORNY(a,b,c,d:real;kk:integer ; var koren:real);
 Var zz1,zz2,z1,z2,z,f1,f2,f0:real;
     i:integer;
 label AAA,BBB,1,2;
begin
     z1:=a; z2:=b;
AAA:  z1:=z1+c; z2:=z2+d;
    If a=0.5 then
     begin
     z2:=k[1];
     for i:=2 to kk do
     begin if k[i]<z2 then z2:=k[i];
     end;
     z2:=1/(1-z2);
     z1:=k[1];
     for i:=2 to kk do
     begin if k[i]>z1 then z1:=k[i];
     end;
     z1:=1/(1-z1);
     zz1:=z1+0.01;
   1:f1:=Z_W(Al,Bl,Aw,Bw,zz1,u,kk);
     if f1<0 then begin zz1:=(z1+zz1)/2;goto 1;end;
    zz2:=z2-0.01;
     2:f2:=Z_W(Al,Bl,Aw,Bw,zz2,u,kk);
     if f2>0 then begin zz2:=(z2+zz2)/2;goto 2;end;
     z1:=zz1;z2:=zz2;
     end;

    F1:=Z_W(Al,Bl,Aw,Bw,z1,u,kk);
    F2:=Z_W(Al,Bl,Aw,Bw,z2,u,kk);
   If F1*F2>0 then goto AAA;
BBB:  z:=(z1+z2)/2; F0:=Z_W(Al,Bl,Aw,Bw,z,u,kk);
   if abs((z1-z2)*10)>eps then
    begin
       If f0*f2>0 then z2:=z else z1:=z; goto BBB;
    end;
    koren:=z;
end;
{Основная программа}
BEGIN
    COMP(st,kk,pk,tk,w,c);;
    AB(pk,tk,w,c,t,kk,a,b);
    AMBM(u,a,b,c,p,t,kk,amw,bmw,aw,bw);
    KORNY(0,2.5,0,-0.01,kk,Zw);
    zz1:=zw
END;