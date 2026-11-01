program v369;
 uses crt;
 var a,at:array[1..50,1..50] of real;
     z,w,c,x:array[1..50] of real;
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
 procedure matr;
  begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*ln((sqr(n)-i)/(j+1))/(ln(2)/(5*sqrt((i+2)/j)));
   write(a[i,j]:7:2);end;
 procedure vect;
  begin
  x[i]:=1;k:=0;for j:=i+1 to n do
   if a[j,i]<>0 then begin x[i]:=x[i]*a[j,i];k:=k+1;end;
    if k<>0 then x[i]:=s(abs(x[i]),1/k)
     else x[i]:=0;
  write(x[i]:7:2);end;
begin
 clrscr;
 write('Введите размер массива (не больше 50)-');readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do matr;
 writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do vect;
 writeln;writeln('Z');
 for i:=1 to n do c[i]:=a[i,i]+a[i,n-i+1];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+a[j,i]*a[i,k];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+at[j,i]*c[i];
 for i:=1 to n do y:=y+x[i]*x[n-i+1];
 for i:=1 to n do begin
  z[i]:=w[i]*y;
  write(z[i]:1:1,' ');
 end;writeln;
 i:=2;while i<=n do begin
  j:=i;while j<=n do begin
  if abs(1/a[i,n])<abs(1/a[j,n]) then begin
   y:=a[i,n];a[i,n]:=a[j,n];a[j,n]:=y;end;
  j:=j+2;end;i:=i+2;
  end;
 writeln('Упорядоченный массив');
 for j:=1 to n do begin
  for i:=1 to n do begin
   write(a[j,i]:7:2);
 end;writeln;end;
 max:=0;j:=2;
 while j<=n do begin
  y:=a[1,j];
  for k:=2 to n do if a[k,j]>y then y:=a[k,j];
  if y>max then max:=y;j:=j+2;end;
 y:=0;k:=2;
 while k<=n do begin
  y:=y+x[k]*s(f(k),1/k);
  k:=k+2;end;
 y:=y+max;writeln('Значение Y=',y:1:2);readln;end.

Полученные результаты

Введите размер массива (не больше 50)-6
Заданный массив                                                            
  35.76 -21.70  15.65 -12.16   9.85  -8.21                                 
 -40.87  24.77 -17.83  13.83 -11.19   9.31                                 
  45.22 -27.35  19.65 -15.22  12.30 -10.21                                 
 -48.99  29.58 -21.21  16.40 -13.23  10.96                                 
  52.31 -31.52  22.56 -17.41  14.02 -11.59                                 
 -55.25  33.22 -23.73  18.28 -14.69  12.12                                 
Заданный вектор                                                            
  48.26  30.34  22.48  17.84  14.69   0.00                                 
Z                                                                          
16923288.4 -19550317.5 21868267.5 -23967171.4 25900525.3 -27703203.3       
Упорядоченный массив                                                       
  35.76 -21.70  15.65 -12.16   9.85  -8.21                                 
 -40.87  24.77 -17.83  13.83 -11.19   9.31                                 
  45.22 -27.35  19.65 -15.22  12.30 -10.21                                 
 -48.99  29.58 -21.21  16.40 -13.23  10.96                                 
  52.31 -31.52  22.56 -17.41  14.02 -11.59                                 
 -55.25  33.22 -23.73  18.28 -14.69  12.12                                 
y=33.21928Значение Y=96.49                                                 
                                                                           