program v845;
 uses crt;
 var z,a,a1:array[1..10,1..10] of real;
     x:array[1..10] of real;
     i,j,n,k:integer;
     y,m:real;
 {функция вычисления факториала}
 function fac(d:integer):integer;
 var l:integer;
 begin
  k:=1;for l:=1 to d do k:=k*l;fac:=k;end;
 {функция максимума для 3-х переменных}
 function max(d,f,g:real):real;
 var m:real;
 begin
  m:=d;
  if f>m then m:=f;
  if g>m then m:=g;
  max:=m;
 end;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;
 write('Введите размерность матрицы (max=10)-');
 readln(n);
 writeln('Полученная матрица А-');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=arctan(sin(pi*(j+0.5)))*max(4,i/j,j)/(1.31*arctan(i/j));
   write(a[i,j]:7:2);
  end;
  writeln;
 end;
 writeln('Полученный вектор Х-');
 for i:=1 to n do begin
  x[i]:=1;j:=1;
  repeat
   x[i]:=x[i]*a[j,i];
   j:=j+2;
  until j>n;
  write(x[i]:2:2,' ');
 end;
 writeln;writeln('Вычисление матричных операций Z-');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a1[i,j]:=a1[i,j]+a[i,k]*a[j,k];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do z[i,j]:=z[i,j]+a1[i,k]*a[j,k];
 m:=0;
 for i:=1 to n do m:=m+a[i,i]*a[n-i+1,i];
 for i:=1 to n do begin
  for j:=1 to n do begin
   z[i,j]:=z[i,j]*m;
   write(z[i,j]:11:2);
  end;
  writeln;
 end;
 for i:=1 to n do
  for j:=1 to n do
   a1[i,j]:=a[j,i];
 for k:=1 to n do
  for i:=1 to n do
   if a1[k,i]<>0 then
    for j:=n-1 downto i do
     if (a1[k,j]<>0) and (abs(a1[k,j])>abs(a1[k,j+1])) then begin
       y:=a1[k,j];a1[k,j]:=a1[k,j+1];a1[k,j+1]:=y;end;
 writeln('Упорядоченная матрица-');
 for i:=1 to n do begin
  for j:=1 to n do write(a1[i,j]:7:2,' ');
  writeln;
 end;
 y:=0;i:=2;
 repeat
  m:=abs(a[i,1]);
  for k:=2 to n do
   if abs(a[i,k])<m then m:=a[i,k];
  y:=y+m;
  i:=i+2;
 until i>n;
 m:=0;
 for i:=1 to n do
  if x[i]>2 then m:=m+s(x[i],i)/fac(i);
 y:=y+m;
 writeln('Значение Y=',y:1:2);
 readln;
end.


