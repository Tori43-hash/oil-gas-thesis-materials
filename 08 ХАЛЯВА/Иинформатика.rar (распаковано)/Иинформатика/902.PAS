program v902;
 uses crt;
 var a,at:array[1..50,1..50] of real;
     w,c,x:array[1..50] of real;
     l,i,j,n,k:integer;
     z,y,max,min:real;
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
  k:=1;for l:=1 to d do k:=k*l;f:=k;end;
begin
 clrscr;write('Введите размер массива (не больше 50)-');readln(n);
 writeln('Заданный массив');
 for j:=1 to n do begin
  for i:=1 to n do begin
   a[j,i]:=s(-1,i+j)*f(n-i)/(2*i*(i+i/j));
   write(a[j,i]:7:3);
  end;writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  k:=1;while a[n,k]<=0 do k:=k+1;min:=a[n,k];
  for j:=k to n do
   if a[n-i+1,j]>0 then
    if a[n-i+1,j]<min then min:=a[n-i+1,j];
  x[i]:=min;
  write(x[i]:7:3);
 end;
 writeln;writeln('Z');
 for i:=1 to n do c[i]:=a[i,i];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+a[i,j]*a[k,i];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+at[i,j]*x[i];
 for i:=1 to n do z:=z+w[i]*c[i];
 write(z:7:2);writeln;
 i:=2;while i<=n do begin
  if a[i,n-i+1]<>0 then
   j:=i+2;while j<=n do begin
    if a[j,n-j+1]<>0 then
     if a[j,n-j+1]<a[i,n-i] then begin
      y:=a[j,n-j+1];a[j,n-j+1]:=a[i,n-i+1];a[i,n-i+1]:=y;end;
  j:=j+2;end;i:=i+2;end;
 writeln('Упорядоченный массив');
 for j:=1 to n do begin
  for i:=1 to n do write(a[j,i]:8:3);
 writeln;end;
 min:=a[1,2];j:=4;while j<=n do begin
  if a[1,j]<min then min:=a[1,j];
  j:=j+2;
 end;
 max:=min;
 for i:=2 to n do begin
 min:=a[i,2];k:=4;while k<=n do begin
  if a[i,k]<min then min:=a[i,k];
   k:=k+2;end;
 if min>max then max:=min;
 end;
 min:=1/x[1];
 for i:=2 to n do if 1/x[i]<min then min:=1/x[i];
 y:=max+min;
 writeln('Значение Y=',y:1:3);readln;end.

Полученные результаты

Введите размер массива (не больше 50)-6            
Заданный массив                                    
 30.000 -1.500  0.167 -0.031  0.010 -0.007         
-40.000  2.000 -0.222  0.042 -0.013  0.009         
 45.000 -2.250  0.250 -0.047  0.015 -0.010         
-48.000  2.400 -0.267  0.050 -0.016  0.011         
 50.000 -2.500  0.278 -0.052  0.017 -0.012         
-51.429  2.571 -0.286  0.054 -0.017  0.012         
Заданный вектор                                    
  0.012  0.017  0.011  0.015  0.009  0.010         
Z                                                  
-145.03                                            
Упорядоченный массив                               
  30.000  -1.500   0.167  -0.031   0.010  -0.007   
 -40.000   2.000  -0.222   0.042 -51.429   0.009   
  45.000  -2.250   0.250  -0.047   0.015  -0.010   
 -48.000   2.400  -0.267   0.050  -0.016   0.011   
  50.000  -2.500   0.278  -0.052   0.017  -0.012   
  -0.013   2.571  -0.286   0.054  -0.017   0.012   
Значение Y=60.012                                  
