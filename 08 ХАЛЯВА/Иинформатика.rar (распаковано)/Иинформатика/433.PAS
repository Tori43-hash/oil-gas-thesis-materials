program v433;
 uses crt;
 var a,at:array[1..50,1..50] of real;
     q,x:array[1..50] of real;
     i,j,n,k:integer;
     z,m,y:real;
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
    else s:=exp(b*ln(abs(a)))end;
 {функция минимума}
 function min(m1,m2:real):real;
 begin
  if m1<m2 then min:=m1 else min:=m2;
 end;
begin
 clrscr;write('Введите размер массива ');readln(n);
 writeln('Матрица A');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=sqrt(1-sqr(arctan(s(-1,(i+j)))))*0.5*pi*min(sqr(i),j+1)/(i*s(exp(i/j),1/j));
   write(a[i,j]:8:4 );end;writeln;end;
 writeln('Вектор X');
 for i:=1 to n do begin
  j:=2;x[i]:=1;
  repeat
   x[i]:=x[i]*a[j,n-i+1];
   j:=j+2;
  until j>n;
  write(x[i]:8:4);
 end;
 writeln;write('Z=');
 for j:=1 to n do
  for i:=1 to n do
   at[j,i]:=a[i,j]+a[j,i];
 for i:=1 to n do
  for j:=1 to n do
   q[i]:=q[i]+a[i,n-i+1]*at[j,i];
 for i:=1 to n do
  for j:=1 to n do z:=z+q[j]*a[j,n-j+1];
 write(z:2:2);writeln;
 writeln('Упорядоченная матрица');
 for i:=1 to n do begin
  j:=2;
  while j<=n do begin
   k:=n-2;
    while k>=j do  begin
     if a[k,i]<a[k+1,i] then begin
      y:=a[k,i];a[k,i]:=a[k+2,i];a[k+2,i]:=y;end;
     k:=k-2;
    end;
   j:=j+2;
  end;
 end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:8:4);
  writeln;
 end;
 y:=0;
 for i:=1 to n do begin
  m:=0;
  for k:=0 to n-1 do
   m:=m+a[i,n-k];
  y:=y+m;
 end;
 i:=1;m:=1;
 while i<=n do begin
  m:=m*f(i)/exp(i);
  i:=i+2;
 end;
 y:=y+m;
 writeln('Значение Y=',y:4:2);
 readln;
end.


Результаты вычислений-

Введите размер массива 6
Матрица A
  0.3577  0.7572  0.8701  0.9134  0.9342  0.9457
  0.1316  0.8846  1.5571  1.7161  1.7951  1.8395
  0.0323  0.4593  0.9289  1.3435  1.7247  2.0873
  0.0089  0.2683  0.6234  0.9465  1.2428  1.5226
  0.0026  0.1671  0.4463  0.7114  0.9553  1.1847
  0.0008  0.1085  0.3328  0.5569  0.7648  0.9602
Вектор X
  2.6894  1.7064  0.9046  0.3231  0.0257  0.0000
Z=382.61
Упорядоченная матрица
  0.3577  0.7572  0.8701  0.9134  0.9342  0.9457
  0.1316  0.8846  1.5571  1.7161  1.7951  1.5226
  0.0323  0.4593  0.9289  1.3435  1.7247  2.0873
  0.0089  0.2683  0.6234  0.9465  1.2428  1.8395
  0.0026  0.1671  0.4463  0.7114  0.9553  1.1847
  0.0008  0.1085  0.3328  0.5569  0.7648  0.9602
Значение Y=30.17
