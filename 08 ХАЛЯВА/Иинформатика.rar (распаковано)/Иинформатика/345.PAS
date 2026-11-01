program v345;
 uses crt;
 var z,a,a2:array[1..10,1..10] of real;
     x:array[1..10] of real;
     i,j,n,k:integer;
     y,m,min:real;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
  f:=k;
 end;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
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
begin
 clrscr;
 n:=5;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*max(4,i/j,j)/(1.31*arctan(i/j));
   write(a[i,j]:10:5);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=0;j:=1;k:=0;
  repeat
  x[i]:=x[i]+a[j,i];
  k:=k+1;
  j:=j+2;
  until j>n;
  x[i]:=x[i]/k;
  write(x[i]:10:5);
 end;
 writeln;writeln('Z');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[i,k]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do z[i,j]:=z[i,j]+a2[i,k]*a2[k,j];
 m:=0;
 for i:=1 to n do m:=m+a[i,i]*a[i,n-i+1];
 for i:=1 to n do
  for j:=1 to n do z[i,j]:=z[i,j]*(m+1);
 for i:=1 to n do begin
  for j:=1 to n do write(z[i,j]:13:2);
  writeln;
 end;
 writeln('Упорядоченный массив');
 for i:=1 to n do
  for j:=1 to n do a2[i,j]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do
   if a2[i,j]<>0 then
    for k:=n-1 downto j do
     if a2[i,k]<>0 then
      if abs(1/a2[i,k])<abs(1/a2[i,k+1]) then begin
       y:=a2[i,k];a2[i,k]:=a2[i,k+1];a2[i,k+1]:=y;end;
 for i:=1 to n do begin
  for j:=1 to n do write(a2[i,j]:10:5);
  writeln;
 end;
 m:=abs(a[2,n]);
 for k:=1 to n-1 do if abs(a[2,n-k])<m then m:=abs(a[2,n-k]);
 i:=4;
 repeat
  min:=a[i,n];
  for k:=1 to n-1 do if abs(a[i,n-k])<min then min:=abs(a[i,n-k]);
  if min>m then m:=min;
  i:=i+2;
 until i>n;
 y:=0;
 for i:=1 to n do
  if x[i]>2 then y:=y+s(x[i],i)/f(i);
 y:=y+m;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты работы программы-

Матрица А
   3.88775  -6.58568   9.49007 -12.46409  19.33576
  -2.75793   3.88775  -5.19289   6.58568 -10.03083
   2.44461  -3.10689   3.88775  -4.74503   7.06265
  -2.30306   2.75793  -3.29284   3.88775  -5.65668
   2.77908  -2.56529   2.96342  -3.40764   4.85969
Вектор Х
   3.03715  -4.08595   5.44708  -6.87225  10.41937
Z
  10401288.72 -12773651.67  16261760.85 -19990817.56  29841941.45
  -5911507.30   7262576.88  -9247308.55  11368982.92 -16972470.18
   4538388.20  -5577372.05   7102537.50  -8732837.80  13037699.63
  -3903145.41   4797802.99  -6110404.61   7513425.94 -11217597.92
   3791197.48  -4662375.00   5939140.74  -7303734.14  10905358.73
Упорядоченный массив
  -2.30306   2.44461  -2.75793   2.77908   3.88775
  -2.56529   2.75793  -3.10689   3.88775  -6.58568
   2.96342  -3.29284   3.88775  -5.19289   9.49007
  -3.40764   3.88775  -4.74503   6.58568 -12.46409
   4.85969  -5.65668   7.06265 -10.03083  19.33576
Значение Y=1056.085
