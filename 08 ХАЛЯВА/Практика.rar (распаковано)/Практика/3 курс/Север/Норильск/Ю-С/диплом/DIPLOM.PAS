uses crt;
Const n1=9;
Pz : array[1..n1] of real=(214.2,158.1,132.6,102,76.5,61.2,45.9,40.8,35.7);{кгс/см^2}
Pp : array[1..n1] of real=(229.5,209.1,173.4,137.7,102,81.6,66.3,53.04,51);{кгс/см^2}
q: array[1..n1] of real=(610,570,410,260,200,125,105,90,70);{тыс.м^3}

type
 vect1=array[1..n1] of real;
  vectst=Array[1..8] of string;
     vect=Array[1..8] of real;
 var
  x,y:vect1;
  Qg,G,G0,Gost,Pzz,Pplkon1,Ppln,tt,t1,Ppl1,Constanta,S,F1,F2,Ppl,Gconst : real;

  i,t,Ns,Ns1:integer;
  r,c,n: real;

  zzz:real;
    p:real;st:vectst;u:vect;kk,j:integer;

label 1,2;

Procedure dataxy(var x1,y1: vect1);
  var i: integer;
{$I a:\z_w.pas}
  begin
  for i:=1 to n1 do
     begin
      x1[i]:=ln((pp[i]*pp[i])-(pz[i]*pz[i]));
      y1[i]:=ln(q[i]);
     end;
  end;

Procedure line(x,y: vect1; m1,m2: integer; var a,b,r: real);
  var i:integer;
  a1,a2,b1,b2: real;
  begin
  a1:=0; a2:=0; b1:=0; b2:=0; r:=0;
  for i:=m1 to m2 do begin
  a1:=a1+x[i]; a2:=a2+x[i]*x[i];
  b1:=b1+y[i]; b2:=b2+x[i]*y[i];
  end;
  a:=(b1*a2-b2*a1)/((m2-m1+1)*a2-a1*a1);
  b:=((m2-m1+1)*b2-a1*b1)/((m2-m1+1)*a2-a1*a1);
  for i:=m1 to m2 do begin
  r:=r+sqr(y[i]-(a+b*x[i]));
  end;
 end;

{$I a:\z_w.pas}
BEGIN
  clrscr;

  dataxy(x,y);
  line(x,y,1,n1,c,n,r);
  C:=exp(c);{тыс.м^3/сут}
  n:=round(n*10)/10;
  {   Write('Введите число компонентов N=');Readln(kk);}
{ Write('Введите давление (в МПа) P=');Readln(P);
 Write('Введите температуру (в кельвинах) T=');Readln(T);}
{ for j:=1 to kk do begin
Write('Введите название ',j,'-го компонента - ');Readln(st[j]);
Write('Введите мольную долю компонента u=');Readln(u[j]);
end;}
st[1]:='метан'; u[1]:=0. ;
st[2]:='этан'; u[2]:=0.;
u[3]:=0.0008;st[3]:='пропан';
st[4]:='бутан'  ;u[4]:=0.0017;
st[5]:='пентан'  ;u[5]:=0.003;
st[6]:='азот'     ;u[6]:=0.0018;
st[7]:='углекислый газ';u[7]:=0.0005;kk:=7;
  write('Введите потенциальную производительность скважины в тыс.м^3/сут Qг= ');readln(Qg);
  write('Введите среднее количество скважин на период стабилизации в шт. Ns= ');readln(Ns1);
  write('Забойное давление забрасывания в кгс/см^2 Рз.забр= ');readln(Pzz);{n:=0.8;}
  Pplkon1:=sqrt(exp(1/n*ln(Qg/c))+Pzz*Pzz);
{  zzz:=zz1(Pplkon1,tpl,st,u,kk);
  zzz:=zz1( Pzz/10.2,tpl,st,u,kk);}

  write('Введите запасы в тыс.м^3 G= ');readln(G);
  write('Введите начальное пластовое давление в кгс/см^2 Рпл.н= ');readln(Ppln);
{   zzz:=zz1(Ppln,tpl,st,u,kk);     }
  G0:=G*((Ppln{/zz1(ppln/10.2,tpl,st,u,kk)})-(Pplkon1{/zz1(pplkon1/10.2,tpl,st,u,kk)}))
  /(Ppln{/zz1(ppln/10.2,tpl,st,u,kk)});{в тыс.м^3}
  tt:=G0/(Qg*Ns1*365);{год}
  Gconst:=g0;
  t:=trunc(tt)+1;{год}
  t1:=t-tt;{год}
  Ppl1:=Pplkon1;{кгс/см^2}
  Gost:=G-G0;{в тыс.м^3}
  write('Введите количество скважин на конец периода стабилизации в шт. N= ');readln(Ns);

;{(кгс/см^2)^2n*шт/год}
  s:=0;
  writeln('Введите значение Ф-функции для (Рз.забр/Рпл.нач) = '
  ,(Pzz{*zz1(ppl1/10.2,tpl,st,u,kk)})/(Ppl1{*zz1(pzz/10.2,tpl,st,u,kk)}):7:6,'  и  n= ',n:4:2);
  write('Фнач = ');readln(F1);
  clrscr;
  Ppl1:=Ppl1{/zz1(ppl1/10.2,tpl,st,u,kk)};
1:write('Фнач = ',F1);writeln('момент времени T = ',t,' год');
  Constanta:=365*Ns*c*Ppln*exp((2*n-1)*ln(Pzz{/zz1(pzz/10.2,tpl,st,u,kk)}))/(G{*zz1(ppln/10.2,tpl,st,u,kk)});
  F2:=f1+constanta*t1;{(кгс/см^2)^2n*шт}
  write('Фкон = ',f2:7:6);writeln('Определите и введите Рпл.кон{/Zпл.кон} = ');readln(Ppl);

F1:=F2;{(кгс/см^2)^2n*шт}
  t1:=1;t:=t+1;{год}ns:=ns-3; if ns<=7 then ns:=7;
  G0:=Gost*(Ppl1-Ppl)/(Ppl1);{в тыс.м^3}
  writeln('G0=',g0 );
  Ppl1:=Ppl;{кгс/см^2}
  If F2<=2.55738 then
                Begin Gost:=Gost-G0;S:=S+G0;goto 1; end
              else goto 2;
2:write('Накопленная добыча за период падающей добычи = ',S,'  в тыс.м^3');
  write('Накопленная добыча за все периоды  = ',S+Gconst,'  в тыс.м^3');
  write('Продолжительность периода падающей добычи = ',t-tt,'год');
  write('Продолжительность всех периодов  = ',t,'год');

  readln;
  end.
