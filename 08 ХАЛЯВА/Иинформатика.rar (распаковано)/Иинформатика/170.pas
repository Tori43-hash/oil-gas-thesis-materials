program v170;
 uses crt;
 var z,ae,a,at:array[1..50,1..50] of real;
     x:array[1..50] of real;
     i,j,n,k:integer;
     q,y,max:real;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
 {функция факториал}
 function f(d:integer):integer;
 begin
  k:=1;for i:=1 to d do k:=k*i;f:=k;end;
 procedure matr;
  begin
   a[i,j]:=s(-1,i*j-3)*j*sin(f(i))/(pi*i*(1+j/i));
   write(a[i,j]:7:3);end;
 procedure vect;
  begin
  x[j]:=a[j,1];for i:=2 to n do
   if (a[j,i]>=-10) and (a[j,i]<=10) then
    if a[j,i]>x[j] then x[j]:=a[j,i];
   write(x[j]:7:3);end;
begin
 clrscr;write('Введите размер массива ');readln(n);
 writeln('Заданная матрица массив');
 for i:=1 to n do begin
  for j:=1 to n do matr;
 writeln;end;
 writeln('Заданный вектор');
 for j:=1 to n do vect;
 writeln;writeln('Z');
 for j:=1 to n do
  for i:=1 to n do if i=j then ae[j,i]:=a[j,i]-1 else ae[j,i]:=a[j,i];
 for j:=1 to n do
   for i:=1 to n do z[j,i]:=a[i,j]-a[j,i];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[i,j]:=at[i,j]+z[i,j]*z[k,i];
 for j:=1 to n do
  for i:=1 to n do begin
   z[j,i]:=0;
   for k:=1 to n do z[j,i]:=z[j,i]+at[j,i]*ae[i,k];
  end;
 for i:=1 to n do q:=q+sqr(x[i]);
 for i:=1 to n do begin
  for j:=1 to n do begin
   z[i,j]:=z[i,j]+z[i,j]*(q+1);
   write(z[i,j]:7:3);end;writeln;end;
 writeln('Упоядоченная матрица');
 for i:=1 to n do
  for k:=n downto i do
     if abs(a[2,k])<abs(a[2,k+1]) then begin
      y:=a[2,k];a[2,k]:=a[2,k+1];a[2,k+1]:=y;end;
 for j:=1 to n do begin
  for i:=1 to n do write(a[j,i]:7:3);writeln;end;
 k:=2;y:=0;
 while k<=n do begin
  y:=y+ln(abs(a[1,k]))/ln(10);
  k:=k+2;
 end;
 for i:=2 to n do begin
  k:=2;
  while k<=n do begin
   if ln(abs(a[i,k])/ln(10))<y then y:=ln(abs(a[i,k])/ln(10));
 k:=k+2;end;end;
 max:=x[1];for i:=2 to n do if x[i]>max then max:=x[i];
 y:=y+max;writeln('Значение Y=',y:5:2);readln;end.

Полученные результаты

Заданная матрица массив
  0.134 -0.179  0.201 -0.214  0.223
 -0.096 -0.145 -0.174 -0.193 -0.207
 -0.022  0.036 -0.044  0.051 -0.056
  0.058  0.096  0.124  0.144  0.160
  0.031 -0.053  0.069 -0.082  0.092
Заданный вектор                    
  0.223 -0.096  0.051  0.160  0.092
Z                                  
  0.000 -0.019  0.030 -0.015  0.023
 -0.082  0.000  0.259  0.145  0.173
  0.083 -0.168  0.000  0.013  0.052
  0.417  0.963  0.138  0.000  0.419
  0.052 -0.091 -0.042  0.033  0.000
Упоядоченная матрица               
  0.134 -0.179  0.201 -0.214  0.223
 -0.207 -0.193 -0.174 -0.145 -0.096
 -0.022  0.036 -0.044  0.051 -0.056
  0.058  0.096  0.124  0.144  0.160
  0.031 -0.053  0.069 -0.082  0.092
Значение Y=-3.95                   