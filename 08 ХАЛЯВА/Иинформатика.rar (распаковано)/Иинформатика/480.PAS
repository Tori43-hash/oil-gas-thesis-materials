program v480;
 uses crt;
 var b,ae,a,at:array[1..50,1..50] of real;
     z,x:array[1..50] of real;
     i,j,n,k:integer;
     min,y,max:real;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))end;
begin
 clrscr;write('Введите размер массива ');readln(n);
 writeln('Матрица A');
 for j:=1 to n do begin
  for i:=1 to n do begin
   a[j,i]:=arctan(sqrt(1-s(-1,(i+j))))*3*sin(i*j)/(pi*exp(3/i));
   write(a[j,i]:7:3 );end;writeln;end;
 writeln('Вектор X');
 for i:=1 to n do begin
  j:=1;x[i]:=1;
  repeat
   x[i]:=x[i]*a[i,j];
   j:=j+2;
  until j>n;
  write(x[i]:7:3);
 end;
 writeln;writeln('Z');
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do ae[j,i]:=ae[j,i]+a[j,k]*a[j,k];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+ae[j,k]*a[k,j];
 for j:=1 to n do
  for i:=1 to n do begin z[j]:=z[j]+at[j,i]*(sqr(x[i])+1);end;
 for j:=1 to n do write(z[j]:7:3);writeln;
 writeln('Упоядоченная матрица');
 for i:=1 to n do
  for k:=i to n do
   if a[2,k]<>0 then
    for j:=k to n do
     if a[2,j]<>0 then
      if abs(a[2,k])>abs(a[2,j]) then begin
       y:=a[2,k];a[2,k]:=a[2,j];a[2,j]:=y;end;
 for j:=1 to n do begin
  for i:=1 to n do write(a[j,i]:7:3);writeln;end;
 y:=0;i:=2;
 while i<=n do begin
  min:=a[i,1];
  for k:=2 to n do if a[i,k]<min then min:=a[i,k];
  y:=y+min;i:=i+2;end;
 max:=x[1];
 for i:=2 to n do if x[i]>max then max:=x[i];
 y:=y+max;writeln('Значение Y=',y:7:3);readln;
 end.

Полученые результаты

Введите размер массива 6
Матрица A
  0.000  0.185  0.000 -0.326  0.000 -0.155
  0.041  0.000 -0.094  0.000 -0.272  0.000
  0.000 -0.057  0.000 -0.231  0.000 -0.416
 -0.034  0.000 -0.180  0.000  0.457  0.000
  0.000 -0.111  0.000  0.393  0.000 -0.547
 -0.013  0.000 -0.252  0.000 -0.495  0.000
Вектор X
  0.000  0.001  0.000  0.003  0.000 -0.002
Z
 -0.006  0.009 -0.724 -0.239 -0.866 -2.066
Упоядоченная матрица
  0.000  0.185  0.000 -0.326  0.000 -0.155
  0.041  0.000 -0.094  0.000 -0.272  0.000
  0.000 -0.057  0.000 -0.231  0.000 -0.416
 -0.034  0.000 -0.180  0.000  0.457  0.000
  0.000 -0.111  0.000  0.393  0.000 -0.547
 -0.013  0.000 -0.252  0.000 -0.495  0.000
Значение Y=-0.944
