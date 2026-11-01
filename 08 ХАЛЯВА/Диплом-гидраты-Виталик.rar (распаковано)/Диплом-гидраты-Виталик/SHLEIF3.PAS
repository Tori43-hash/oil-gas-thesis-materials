program shleif3;
uses crt,dos;
var
   Q, Toc: real;
   x,Pk,Tcp,Tg,Tl,a,Pcp,Px:real;
   Tn,Pn,r,Cp,K,Z,Di,Dn,Dvn:real;
   L,i{,j,n}:integer;

   Ppk,Tpk,Tpr,Ppr:real;
   q_sek, w, myu, ro_0, ro_p, RE, K_sh, lambda: real;


{функция возведения в степень}
function step(a,b:real):real;
begin
if (a<0) then
 if round(b) mod 2=0 then step:=exp(b*ln(abs(a))) else step:=-exp(b*ln(abs(a)))
  else step:=exp(b*ln(abs(a)))
end;

{функция вычисления логарифма с основанием 10}
function lg(a: real):real;
begin lg:=ln(a)/ln(10); end;

{функция вычисления коэффициента сверхсжимаемости от Рпр, Тпр}
function calcZ(_Ppr, _Tpr:real):real;
begin
 calcZ:=step(0.4*lg(_Tpr)+0.73, _Ppr) + 0.1*_Ppr;
end;

{│││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││}
{│││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││}
{│││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││││}

begin
 clrscr;

Ppk:=4.63; {псевдокретическое давление известной смеси}
Tpk:=190.49; {псевдокретическая температура известной смеси}
r:=0.562;{  write (' Относительная плотность газа,  r=');    read (r);}
        {Z:=0.91;} {   write (' Коэф. сверхсжимаемости газа,  Z=');    read (Z);}
Dvn:=300; {   write (' Внутренний диаметр шлейфа, мм  db=');    read (db);}
Dn:=375; {   write (' Наружный диаметр шлейфа(учитывать изоляцию?), мм  dn=');    read (dn);   }
L:=2859; {   write (' Длина шлейфа, м  L=');                read (L);          }
Q:=1.736; {   write (' Добыча газа, млн.м3/сут  Q=');    read (Q);}
Pn:=3.4;  {  write (' Давление в начале расчетного участка, МПа  Pу=');     read (Py);  }
Tn:=283.7;{   write (' Температура в начале расчетного участка, K  Tу=');    read (Ty);}
Toc:=243;  { write (' Температура окружающей среды, К  Toc=');    read (Toc);}
{ ??? }
Di:=4; {   write (' Эффект Джоуля-Томсона, С/МПа  Di=');    read (Di); }
K:=1.2; {   write (' Коэф. теплопередачи,Вт/(м2*С)  К=');    read (K);}
Cp:=2.2; {  write (' Изобарическая теплоемкость газа,кДж/кг  Cp=');    read (Cp);}
{********************************************************}

Ppr:=Pn/Ppk;  Tpr:=Tn/Tpk;
q_sek:=Q * calcZ(Ppr,Tpr) * 1E6 / (Pn * 1 * 86400 * 9.8); { вопрос по ф-ле: 9.8 ???}
w:=q_sek * 1E6 / (0.785 * sqr(Dvn));
myu:=0.011 * 1E-3; {Па*с ?? Вязкость заданного газа при Р и Т !!!}
K_sh:=500; {мкм, коэфф-т абс-й шероховатости}
ro_0:=r * 1.29; {Переводим пл-ть отн-ю в абс-ю, 1.29 -пл-ть возд., кг/м3}
ro_p:=ro_0*273*Pn/(0.1013*calcZ(Ppr,Tpr)*Tn);

RE:=w*(Dvn/1000)*ro_p/myu;

lambda:=0.0677*step((158/RE + 2*K_sh* 1E-3/Dvn),0.2);

writeln('q_sek=',q_sek:10:8,' м3/с');
writeln('w=',w:10:8,' м/с');
writeln('Z=',calcZ(Ppr,Tpr):8:6);
writeln('ro_p=',ro_p:6:2,' кг/м3');
writeln('RE=',RE:0:0);
writeln('lam=',lambda:8:6);


{readln;}


writeln('Результаты гидравлического и теплового расчета шлейфа:  '#13#10);
writeln( '│   X, м   │ Px, МПа │   Tl, K  │  Tg, K   │');
x:=200;
while x<=L do begin
   a:=262.3*K*Dn/(Q*r*Cp*1e+6);

   Tcp:=Toc + (Tn - Toc)*(1-exp(-a*(x/1000)))/(a*(x/1000));
   Ppr:=Pn / Ppk;
   Tpr:=Tn / Tpk;
   Z:=calcZ(Ppr,Tpr);
{   writeln('Z=',Z:8:6);}
 Pk:=sqrt(sqr(Pn) - lambda * r * Z * Tcp * sqr(Q) *({было x, поставил L ? }L/1000)/(10.23e-12*step(Dvn,5)));

{   write('Pk=',Pk:4:2);}
   Pcp:= 2/3 * (Pn + sqr(Pk) / (Pn + Pk));
   Px:=sqrt(sqr(Pn) - (sqr(Pn) - sqr(Pk)) *x/L);
   Tl:=Toc + (Tn - Toc) * exp(-a * (x/1000)) - Di*(sqr(Pn) - sqr(Pk))*(1-exp(-a*x/(1000)))/(2*a*(x/1000)*Pcp);
   Tg:=8960.19/(33.3386-ln(Px));
   writeln('│  ',x:6:1,'  │   ', Px:4:2,'  │  ', Tl:4:2,'  │  ',Tg:4:2, '  │');
if x=L then break;
if x+200>L then x:=L else x:=x+200;
end;

end.

