 {функция котангенс}
 function ctg(a:real):real;
  begin
   ctg:=cos(a)/sin(a);
  end;
 {функция тангенс}
 function tg(a:real):real;
  begin
   tg:=sin(a)/cos(a);
  end;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
  f:=k;
 end;
 {функция минимума}
 function min(m1,m2:real):real;
 begin
  if m1<m2 then min:=m1 else min:=m2;
 end;
 {функция максимума}
 function max(d,f,g:real):real;
 var m:real;
 begin
  m:=d;
  if f>m then m:=f;
  if g>m then m:=g;
  max:=m;
 end;

