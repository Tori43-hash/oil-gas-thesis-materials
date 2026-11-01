program v376;
 uses crt;
 var ae,a,a2,at:array[1..50,1..50] of real;
     z,w,c,x:array[1..50] of real;
     i,j,n,k:integer;
     y,max,min:real;
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
  for i:=1 to d do k:=k*i;
 f:=k;
 end;
begin
 clrscr;
 write('Введите размер массива (не больше 50)-');
 readln(n);
 writeln('Заданный массив');
 for j:=1 to n do begin
  for i:=1 to n do begin
   a[j,i]:=s(-1,sqr(i)-sqr(j))*(s(f(i),1/i))/(pi*i*(1+i/j));
   write(a[j,i]:8:3);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  y:=0;
  for j:=1 to n do
   if (a[n-i+1,j]>=-10) and (a[n-i+1,j]<=10) then begin
    y:=y+a[n-i+1,j];
    k:=k+1;
   end;
  x[i]:=y/k;
  write(x[i]:10:6);
 end;
 writeln;
 writeln('Z');
 for i:=1 to n do begin
  c[i]:=a[i,i]+a[i,n-i+1];
 end;
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do a2[j,i]:=a2[j,i]+a[k,i]*a[i,k];
 for j:=1 to n do
  for i:=1 to n do
   if i=j then ae[j,i]:=a[j,i]-1 else ae[j,i]:=a[j,i];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+a2[i,k]*ae[k,i];
 for i:=1 to n do begin
  for j:=1 to n do z[i]:=z[i]+at[i,j]*c[n-j+1];
  write(z[i]:11:6);
 end;writeln;
 for i:=1 to n do
  if a[i,i]>0 then
   for j:=i to n do
    if a[j,j]>0 then
     if abs(1/a[i,i])>abs(1/a[j,j]) then begin
      y:=a[i,i];a[i,i]:=a[j,j];a[j,j]:=y;end;
 writeln('Упорядоченный массив');
 for j:=1 to n do begin
  for i:=1 to n do write(a[j,i]:8:3);
  writeln;end;
 i:=2;max:=ln(a[2,2])/ln(10);while i<=n do begin
  k:=2;while k<=n do begin
   if a[i,k]<>0 then
    if ln(a[i,k])/ln(10)>max then max:=ln(a[i,k])/ln(10);
   k:=k+2;end;
  i:=i+2;
 end;
 min:=s(abs(x[1]),1);i:=1;
 while i<=n do begin
  if min>s(abs(x[i]),1/i) then min:=s(abs(x[i]),1/i);
  i:=i+2;end;y:=min+max;
 writeln('Значение Y=',y:1:3);readln;end.

Полученные результаты

Введите размер массива (не больше 50)-6                            
Заданный массив                                                    
   0.159  -0.075   0.048  -0.035   0.028  -0.023                   
  -0.212   0.113  -0.077   0.059  -0.047   0.040                   
   0.239  -0.135   0.096  -0.075   0.062  -0.053                   
  -0.255   0.150  -0.110   0.088  -0.074   0.064                   
   0.265  -0.161   0.121  -0.098   0.083  -0.072                   
  -0.273   0.169  -0.129   0.106  -0.090   0.079                   
Заданный вектор                                                    
 -0.000190  0.000188 -0.000185  0.000180 -0.000168  0.000135       
Z                                                                  
   0.011421   0.011421   0.011421   0.011421   0.011421   0.011421 
Упорядоченный массив                                               
   0.159  -0.075   0.048  -0.035   0.028  -0.023                   
  -0.212   0.113  -0.077   0.059  -0.047   0.040                   
   0.239  -0.135   0.096  -0.075   0.062  -0.053                   
  -0.255   0.150  -0.110   0.088  -0.074   0.064                   
   0.265  -0.161   0.121  -0.098   0.083  -0.072                   
  -0.273   0.169  -0.129   0.106  -0.090   0.079                   
Значение Y=-0.772                                                  
                                                                   
