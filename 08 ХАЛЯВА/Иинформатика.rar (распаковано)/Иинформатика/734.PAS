program v734;
 uses crt;
 var k,n,b,i,j:integer;
 a,e:array[1..10,1..10] of real;
 x,q:array[1..10] of real;
 z,min,c,y:real;
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
 {функция котангенс}
 function ctg(a:real):real;
  begin
   ctg:=cos(a)/sin(a);
  end;
begin
 clrscr;
 write('Введите размерность матрицы (<10)-');
 readln(n);
 writeln('A=');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=ctg(pi*(8.25+(i+j)/2))*ln(f(n-j+1))/(i*s(exp(i/j),1/j));
   write(a[i,j]:7:3);
  end;
  writeln;
 end;
 write('X=');
 for i:=1 to n do begin
  x[i]:=a[i,2];
  k:=4;
  while k<=n do begin
   if a[i,k]>x[i] then x[i]:=a[i,k];
   k:=k+2;
  end;
  write(x[i]:7:3);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do
   if i=j then e[i,j]:=a[j,i]-1 else e[i,j]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do
   q[i]:=q[i]+a[n-i+1,i]*e[j,i];
 z:=0;
 for i:=1 to n do
  z:=z+q[i]*x[i];
 write(z:3:3);
 writeln;writeln('Вектор после упорядочивания');
 i:=1;
 while i<=round(n/2) do begin
  if n mod 2=0 then k:=round(n/2) else k:=round(n/2)-1;
  j:=k-2;
  while j>=i do begin
   if x[j]<x[j+2] then
    begin
     c:=x[j];x[j]:=x[j+2];x[j+2]:=c;
    end;
   j:=j-2;
  end;
  i:=i+2;
 end;
 for i:=1 to n do write(x[i]:7:3);
 y:=0;
 for k:=0 to n-1 do y:=y+a[1,n-k];
 i:=3;
 while i<=n do begin
  min:=0;
  for k:=1 to n do min:=min+a[i,n-k];
  if min<y then y:=min;
  i:=i+2;
 end;
 c:=a[1,1];
 for k:=2 to n do
  if a[k,k]>0 then
   if s(a[k,k],1/k)>c then c:=s(a[k,k],1/k);
 y:=y+c;
 writeln;writeln('Y=',y:3:3);
 readln;
end.

Вывод резулдьтатов

Введите размерность матрицы (<10)-7
A=
  3.136 -5.124  4.284 -2.986  1.722 -0.674  0.000
 -0.577  1.995 -1.917  1.402 -0.827  0.328  0.000
  0.141 -1.036  1.143 -0.878  0.530 -0.213  0.000
 -0.039  0.605 -0.767  0.619 -0.382  0.155  0.000
  0.011 -0.377  0.549 -0.465  0.293 -0.121  0.000
 -0.004  0.245 -0.410  0.364 -0.235  0.098  0.000
  0.001 -0.163  0.314 -0.293  0.193 -0.082  0.000
X= -0.674  1.995 -0.213  0.619 -0.121  0.364 -0.082
Z=-0.488
Вектор после упорядочивания
 -0.213  1.995 -0.674  0.619 -0.121  0.364 -0.082
Y=2.824
