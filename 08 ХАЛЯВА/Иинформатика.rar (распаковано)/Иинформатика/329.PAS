program v329;
 uses crt;
 var z,a2,a:array[1..10,1..10] of real;
     x:array[1..10] of real;
     i,j,n,k:integer;
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
  k:=1;for i:=1 to d do k:=k*i;f:=k;end;
begin
 clrscr;
 write('Введите размер массива (не больше 10)-');readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*ln(sqr(n)-i/j+1)/ln(2)/(pi*ln(j/i+1));
   write(a[i,j]:7:2);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=0;
  k:=0;
  for j:=1 to n do
   if a[j,i]<>0 then begin
    x[i]:=x[i]+a[j,i];
    k:=k+1;
   end;
  x[i]:=x[i]/k;
  write(x[i]:7:2);
 end;
 writeln;writeln('Z');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[i,k]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do z[i,j]:=z[i,j]+a2[i,k]*a[k,j];
 for i:=1 to n do y:=y+x[i]*x[n-i+1];
 for i:=1 to n do begin
  for j:=1 to n do begin
   z[i,j]:=z[i,j]*y;
   write(z[i,j]:7:2);
  end;
  writeln;
 end;
 i:=1;
 while i<=n do begin
  j:=1;
  while j<=n-3 do begin
   if abs(1/a[j,n])<abs(1/a[j+3,n]) then
    begin
     y:=a[j,n];a[j,n]:=a[j+3,n];a[j+3,n]:=y;
    end;
   j:=j+3;
  end;
  i:=i+3;
 end;
 writeln('Упорядоченный массив');
 for j:=1 to n do begin
  for i:=1 to n do begin
   write(a[j,i]:7:2);
 end;writeln;end;
 max:=0;j:=2;
 while i<=n do begin
  y:=a[i,n];
  for k:=2 to n do if a[i,n-k+1]>y then y:=a[i,n-k+1];
  if y>max then max:=y;
  i:=i+2;
 end;
 y:=0;k:=2;
 while k<=n do begin
  y:=y+x[k]*s(f(k),1/k);
  k:=k+2;end;
 y:=y+max;writeln('Значение Y=',y:1:2);readln;end.

Полученные результаты

Заданный массив
   2.13  -1.35   1.08  -0.93   0.83
  -3.60   2.13  -1.62   1.35  -1.19
   5.01  -2.88   2.13  -1.75   1.51
  -6.36   3.60  -2.63   2.13  -1.83
   7.67  -4.31   3.12  -2.51   2.13
Заданный вектор                    
   0.97  -0.56   0.42  -0.34   0.29
Z                                  
  56.13 -11.95   5.19  -2.99   2.00
 -94.73  18.82  -7.83   4.37  -2.86
 131.73 -25.38  10.30  -5.65   3.64
-167.43  31.77 -12.71   6.89  -4.39
 201.83 -38.03  15.07  -8.10   5.13
Упорядоченный массив               
   2.13  -1.35   1.08  -0.93   0.83
  -3.60   2.13  -1.62   1.35  -1.19
   5.01  -2.88   2.13  -1.75   1.51
  -6.36   3.60  -2.63   2.13  -1.83
   7.67  -4.31   3.12  -2.51   2.13
Значение Y=6.49                    
