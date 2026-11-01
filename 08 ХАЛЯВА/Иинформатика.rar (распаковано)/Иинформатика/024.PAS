program v024;
 uses crt;
 var ae,a,at:array[1..50,1..50] of real;
     z,x:array[1..50] of real;
     l,i,j,n,k:integer;
     y,max:real;
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
  k:=1;
  for l:=1 to d do k:=k*l;
 f:=k;
 end;
begin
 clrscr;write('Введите размер массива ');readln(n);
 writeln('Заданная матрица массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[j,i]:=(sin(pi*(i*j+0.5)))*(ln(f(n-j+1)))/(pi*ln(j/i+1));
   write(a[j,i]:6:2);end;writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=0;for j:=1 to n do
   if a[j,i]<>0 then x[i]:=x[i]+a[j,i];
  write(x[i]:7:2);end;
 writeln;writeln('Z');
 for j:=1 to n do
  for i:=1 to n do
   if i=j then ae[j,i]:=a[j,i]-1 else ae[j,i]:=a[j,i];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+ae[j,i]*a[i,k];
 for j:=1 to n do
  for i:=1 to n do z[j]:=z[j]+at[i,j]*x[i];
 for i:=1 to n do write(z[i]:7:2);writeln;
 writeln('Упорядоченный вектор');
 j:=1;while j<=n/2 do begin
  i:=1;while i<=n/2-j do begin
   if x[i]>x[i+3] then begin
    y:=x[i];x[i]:=x[i+3];x[i+3]:=y;end;
 i:=i+3;end;j:=j+3;end;
 for j:=1 to n do write(x[j]:7:2);writeln;
 y:=0;for i:=1 to n do begin
  max:=a[i,n];
  for k:=n downto 2 do
   if a[i,n-k+1]>max then max:=a[i,n-k+1];
  y:=y+max;
 end;
 max:=a[1,1];for k:=2 to n do
  if a[k,k]>0 then
   if s(a[k,k],1/k)>max then max:=s(a[k,k],1/k);
 writeln('Значение Y=',y:5:2);readln;end.

Полученные результаты

Введите размер массива 7
Заданная матрица массив                            
 -3.91  1.91 -1.10  0.63 -0.32  0.11  0.00         
  6.69  3.02  1.66  0.92  0.46  0.16  0.00         
 -9.43  4.10 -2.20  1.19 -0.58  0.20  0.00         
 12.16  5.17  2.72  1.46  0.70  0.24  0.00         
-14.88  6.22 -3.24  1.72 -0.82  0.28  0.00         
 17.60  7.28  3.76  1.98  0.94  0.32  0.00         
-20.32  8.33 -4.27  2.24 -1.06  0.36  0.00         
Заданный вектор                                    
  -2.68  12.91  -6.72  22.45 -10.72  31.88 -14.73  
Z                                                  
-802.39 642.33-371.36 265.77-142.53  56.96   0.00  
Упорядоченный вектор                               
  -2.68  12.91  -6.72  22.45 -10.72  31.88 -14.73  
Значение Y=33.23                                   
                                                   