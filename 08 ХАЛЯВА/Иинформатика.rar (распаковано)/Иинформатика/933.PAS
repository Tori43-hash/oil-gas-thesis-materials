program v933;
 uses crt;
 var a,a2:array[1..10,1..10] of real;
     x,w:array[1..10] of real;
     i,j,n,k:integer;
     z,y,m,max:real;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
  f:=k;
 end;
 {функция возведения в степень}
 function s(a,b:real):real;
 begin
  if (a<0) then
   if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
 end;
 {функция минимума}
 function min(m1,m2:real):real;
 begin
  if m1<m2 then min:=m1 else min:=m2;
 end;
begin
 clrscr;
 n:=7;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,i+j)*min(sqr(i),j+1)/(i*s(exp(i/j),1/j));
   write(a[i,j]:10:5);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=a[2,n-i+1];j:=4;
  repeat
  if x[i]<a[j,n-i+1] then x[i]:=a[j,n-i+1];
  j:=j+2;
  until j>n;
  write(x[i]:10:5);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[k,i]*a[j,k];
 for i:=1 to n do
  for j:=1 to n do w[i]:=w[i]+a[j,n-j+1]*a2[j,i];
 for i:=1 to n do z:=z+w[i]*a[n-i+1,i];
 writeln(z:4:5);
 write;writeln('Упорядоченный массив');
 for k:=1 to n do begin
  i:=1;
  repeat
   j:=1;
   repeat
    if a[j,k]>a[j+2,k] then begin
     y:=a[j,k];a[j,k]:=a[j+2,k];a[j+2,k]:=y;end;
    j:=j+2;
   until j>n-i;
   i:=i+2;
  until i>n;
 end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:10:5);
  writeln;
 end;
 max:=0;
 for k:=0 to n-1 do max:=max+a[1,n-k];
 for i:=2 to n do begin
  m:=0;
  for k:=0 to n-1 do m:=m+a[i,n-k];
  if m>max then max:=m;
 end;
 y:=1;i:=1;
 repeat
  y:=y*f(i)/exp(i);
  i:=i+2;
 until i>n;
 y:=y+max;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты вычислений-

Матрица А
   0.36788  -0.77880   0.89484  -0.93941   0.96079  -0.97260   0.97980
  -0.13534   0.90980  -1.60147   1.76499  -1.84623   1.89192  -1.92001
   0.03319  -0.47237   0.95538  -1.38172   1.77384  -2.14677   2.50830
  -0.00916   0.27591  -0.64118   0.97350  -1.27822   1.56597  -1.84322
   0.00270  -0.17190   0.45900  -0.73162   0.98248  -1.21845   1.44479
  -0.00083   0.11157  -0.34228   0.57274  -0.78663   0.98756  -1.17967
   0.00026  -0.07447   0.26253  -0.46118   0.64781  -0.82329   0.99072
Вектор Х                                                              
  -1.17967   1.89192  -0.78663   1.76499  -0.34228   0.90980  -0.00083
Z=0.11267                                                             
Упорядоченный массив                                                  
   0.00026  -0.77880   0.26253  -1.38172   0.64781  -2.14677   0.97980
  -0.13534   0.90980  -1.60147   1.76499  -1.84623   1.89192  -1.92001
   0.00270  -0.47237   0.45900  -0.93941   0.96079  -1.21845   0.99072
  -0.00916   0.27591  -0.64118   0.97350  -1.27822   1.56597  -1.84322
   0.03319  -0.17190   0.89484  -0.73162   0.98248  -0.97260   1.44479
  -0.00083   0.11157  -0.34228   0.57274  -0.78663   0.98756  -1.17967
   0.36788  -0.07447   0.95538  -0.46118   1.77384  -0.82329   2.50830
Значение Y=4.655                                                      
