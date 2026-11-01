program v333;
 uses crt;
 var a,a2:array[1..10,1..10] of real;
     x,w:array[1..10] of real;
     i,j,n,k:integer;
     z,y,m,max:real;
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
 {функция минимума}
 function min(m1,m2:real):real;
 begin
  if m1<m2 then min:=m1 else min:=m2;
 end;
begin
 clrscr;
 n:=5;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*min(sqr(i),j+1)/(i*s(exp(i/j),1/j));
   write(a[i,j]:10:5);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=0;j:=2;k:=0;
  repeat
  x[i]:=x[i]+a[j,n-i+1];
  k:=k+1;
  j:=j+2;
  until j>n;
  x[i]:=x[i]/k;
  write(x[i]:10:5);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[i,k]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do w[i]:=w[i]+a[j,n-j+1]*a2[j,i];
 for i:=1 to n do z:=z+w[i]*a[n-i+1,i];
 writeln(z:4:5);
 write;writeln('Упорядоченный массив');
 for k:=1 to n do begin
  i:=1;
  repeat
   j:=n-2;
   repeat
    if abs(1/a[j,k])<abs(1/a[j+2,k]) then begin
     y:=a[j,k];a[j,k]:=a[j+2,k];a[j+2,k]:=y;end;
    j:=j-2;
   until j<i;
   i:=i+2;
  until i>n-2;
 end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:10:5);
  writeln;
 end;
 max:=0;
 for k:=0 to n-1 do max:=max+a[2,n-k];
 i:=4;
 repeat
  m:=0;
  for k:=0 to n-1 do m:=m+a[i,n-k];
  if m>max then max:=m;
  i:=i+2;
 until i>n;
 y:=1;i:=1;
  repeat
   y:=y*f(i)/exp(i);
   i:=i+2;
 until i>n;
 y:=y+max;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты вычислений-

Матрица А
   0.36788  -0.77880   0.89484  -0.93941   0.96079
  -0.13534   0.90980  -1.60147   1.76499  -1.84623
   0.03319  -0.47237   0.95538  -1.38172   1.77384
  -0.00916   0.27591  -0.64118   0.97350  -1.27822
   0.00270  -0.17190   0.45900  -0.73162   0.98248
Вектор Х
  -1.56222   1.36925  -1.12133   0.59285  -0.07225
Z=-0.13980
Упорядоченный массив
   0.36788  -0.77880   0.89484  -0.93941   0.96079
  -0.13534   0.90980  -1.60147   1.76499  -1.84623
   0.03319  -0.47237   0.95538  -1.38172   1.77384
  -0.00916   0.27591  -0.64118   0.97350  -1.27822
   0.00270  -0.17190   0.45900  -0.73162   0.98248
Значение Y=0.690

