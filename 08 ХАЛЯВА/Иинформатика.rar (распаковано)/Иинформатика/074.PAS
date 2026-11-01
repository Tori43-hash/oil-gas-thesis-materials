program v074;
 uses crt;
 var ae,a,at:array[1..10,1..10] of real;
     z,x:array[1..10] of real;
     l,i,j,n,k:integer;
     y,m:real;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   s:=exp(b*ln(abs(a)))
  end;
 {функция факториал}
 function f(d:integer):integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
 f:=k;
 end;
begin
 clrscr;write('Введите размер массива не более 10-');readln(n);
 writeln('Заданная матрица массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=(sin(pi*(i*j+0.5)))*(ln(f(n-j+1)))/(pi*i*(1+i/j));
   write(a[i,j]:7:3);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=0;for j:=1 to n do
   if (a[j,i]>=-10) and (a[j,i]<=10) then x[i]:=x[i]+a[j,i];
  write(x[i]:7:3);end;
 writeln;writeln('Z');
 for j:=1 to n do
  for i:=1 to n do
   if i=j then ae[j,i]:=a[j,i]-1 else ae[j,i]:=a[j,i];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+ae[j,i]*ae[k,i];
 for j:=1 to n do
  for i:=1 to n do z[j]:=z[j]+at[i,j]*x[i];
 for i:=1 to n do write(z[i]:7:3);writeln;
 writeln('Упорядоченный вектор');
 for i:=1 to round(n/2) do
  for j:=i to round(n/2)-1 do
   if x[j]>0 then begin
    k:=j+1;while (x[k]<=0) and (k<=round(n/2)) do k:=k+1;
    if x[j]>x[k] then begin
     y:=x[j];x[j]:=x[k];x[k]:=y;end;
   end;
 for j:=1 to n do write(x[j]:7:3);writeln;
 y:=0;
 for i:=n downto 2 do begin
  m:=0;k:=2;
  while k<=n do begin
   if a[i,k]<>0 then m:=m+ln(abs(a[i,k]))/ln(10);
   k:=k+2;
  end;
  y:=y+m;
 end;
 m:=a[1,1];
 for k:=2 to n do
  if a[k,k]>0 then
   if s(a[k,k],1/k)>m then m:=s(a[k,k],1/k);
 y:=y+m;
 writeln('Значение Y=',y:5:2);
 readln;
end.

Полученные результаты

Введите размер массива не более 10-7
Заданная матрица массив                          
 -1.357  1.396 -1.143  0.809 -0.475  0.189  0.000
  0.452  0.524  0.457  0.337  0.204  0.083  0.000
 -0.226  0.279 -0.254  0.193 -0.119  0.049  0.000
  0.136  0.175  0.163  0.126  0.079  0.033  0.000
 -0.090  0.120 -0.114  0.090 -0.057  0.024  0.000
  0.065  0.087  0.085  0.067  0.043  0.018  0.000
 -0.048  0.066 -0.065  0.053 -0.034  0.015  0.000
Заданный вектор                                  
 -1.069  2.647 -0.871  1.676 -0.359  0.411  0.000
Z                                                
 -8.693 -4.466 -7.250 -1.087 -2.284  0.225  0.000
Упорядоченный вектор                             
 -1.069  1.676 -0.871  2.647 -0.359  0.411  0.000
Значение Y=-18.67                                
