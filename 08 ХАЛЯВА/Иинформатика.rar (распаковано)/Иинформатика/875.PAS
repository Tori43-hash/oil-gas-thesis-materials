program v875;
 uses crt;
 var z,w,ae,a,at:array[1..20,1..20] of real;
     x:array[1..20] of real;
     i,j,n,k:integer;
     y,q,p:real;
 {функция максимума}
 function max(a,b,c:real):real;
 begin
  if a>=b then
   if a>=c then max:=a else
   else if b>=c then max:=b else max:=c;
 end;
 {функция факториал}
 function f(d:integer):integer;
 begin
  k:=1;for j:=1 to d do k:=k*j;f:=k;end;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
 procedure matr;
  begin
   a[i,j]:=arctan(sin(pi*(j+0.5)))*max(4,i/j,j)/(pi*i*(i/j+1));
   write(a[i,j]:7:3);end;
 procedure vect;
  begin
   x[i]:=1;for j:=1 to n do
    if (x[i]>=-10) and (x[i]<=10) then x[i]:=x[i]*a[j,i];
    write(x[i]:8:5);end;
begin
 clrscr;
 write('Введите размер массива (не больше 20)-');
 readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do matr;writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do vect;
 writeln;writeln('Z');
 for i:=1 to n do q:=q+a[i,i]*a[i,n-i+1];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+a[j,i]*a[i,k];
 for i:=1 to n do
  for j:=1 to n do
   if i=j then ae[j,i]:=a[j,i]-1 else ae[j,i]:=a[j,i];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do w[j,i]:=w[j,i]+at[j,i]*ae[i,k];
 for j:=1 to n do
  for i:=1 to n do z[i,j]:=w[i,j]*q;
 for j:=1 to n do begin
  for i:=1 to n do write(z[i,j]:7:3);
 writeln;end;
 for j:=1 to n do
  for i:=1 to n do at[j,i]:=a[i,j];
 for k:=1 to n do
  for i:=1 to n do
   if at[k,i]>0 then
    for j:=i to n do
     if at[k,j]>0 then
      if at[k,i]>at[k,j] then begin
       y:=at[k,i];at[k,i]:=at[k,j];at[k,j]:=y;end;
 writeln('Упорядоченная матрица');
 for j:=1 to n do begin
  for i:=1 to n do write(at[j,i]:7:3);
 writeln;end;
 i:=2;while i<=n do begin
  p:=0;k:=1;
  while k<=n do begin
   if a[i,k]<>0 then p:=p+ln(abs(a[i,k]))/ln(10);
 k:=k+2;end;y:=y+p;i:=i+2;end;
 p:=0;for i:=1 to n do
  if x[i]>2 then p:=p+s(x[i],i)/f(i);
 y:=y+p;
 writeln('Значение Y=',y:3:3);readln;end.

Полученные результаты

Заданный массив
 -0.500  0.667 -0.750  0.800 -0.000        
 -0.167  0.250 -0.300  0.333 -0.000        
 -0.083  0.133 -0.167  0.190 -0.000        
 -0.050  0.083 -0.107  0.125 -0.000        
 -0.042  0.057 -0.075  0.089 -0.000        
Заданный вектор                            
-0.00001 0.00011-0.00030 0.00056 0.00000   
Z                                          
  0.010  0.003  0.002  0.001  0.001        
 -0.008 -0.003 -0.002 -0.001 -0.001        
  0.006  0.002  0.001  0.001  0.001        
 -0.005 -0.002 -0.001 -0.001 -0.001        
  0.000  0.000  0.000  0.000  0.000        
Упорядоченная матрица                      
 -0.500 -0.167 -0.083 -0.050 -0.042        
  0.057  0.083  0.133  0.250  0.667        
 -0.750 -0.300 -0.167 -0.107 -0.075        
  0.089  0.125  0.190  0.333  0.800        
 -0.000 -0.000 -0.000 -0.000 -0.000        
Значение Y=-65.664                         