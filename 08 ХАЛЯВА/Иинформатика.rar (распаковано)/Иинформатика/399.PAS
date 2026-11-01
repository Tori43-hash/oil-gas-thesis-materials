program v399;
 uses crt;
 var a,a2:array[1..10,1..10] of real;
     z,x,w:array[1..10] of real;
     i,j,n,k:integer;
     y,m,max:real;
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
begin
 clrscr;
 n:=6;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*ln(sqr(n)-i/j+1)/ln(2)/(2*exp(ln(i/j+1)/ln(10)));
   write(a[i,j]:10:5);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=0;k:=0;
  for j:=1 to n do
   if abs(a[j,i])<5 then begin
    x[i]:=x[i]+a[j,i];
    k:=k+1;
   end;
  if k<>0 then x[i]:=x[i]/k else x[i]:=0;
  write(x[i]:10:5);
 end;
 writeln;writeln('Z=');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[i,k]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do w[i]:=w[i]+a[j,j]*a2[j,i];
 for i:=1 to n do y:=y+x[i]*x[n-i+1];
 for i:=1 to n do z[i]:=w[i]*y;
 for i:=1 to n do write(z[i]:10:5);
 writeln;writeln('Упорядоченный массив');
 for i:=1 to n do
  if (a[i,n]>=-9) and (a[i,n]<=9) then
   for j:=n-1 downto i do
    if (a[j,n]>=-9) and (a[j,n]<=9) then
     if abs(1/a[j,n])<abs(1/a[j+1,n]) then begin
      y:=a[j,n];a[j,n]:=a[j+1,n];a[j+1,n]:=y;
     end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:10:5);
  writeln;
 end;
 j:=1;
 while (a[j,2]=0) and (j<n) do j:=j+1;
 max:=1/a[j,2];
 for k:=j+1 to n do
  if (a[k,2]<>0) and (1/a[k,2]>max) then max:=1/a[k,2];
 i:=4;
 repeat
  m:=1;k:=1;
  repeat
   if a[k,i]<>0 then m:=m/a[k,i];
   k:=k+2;
  until k>i;
  if m>max then max:=m;
  i:=i+2;
 until i>n;
 y:=0;
 k:=2;
 repeat
  y:=y+x[k]*s(f(k),1/k);
  k:=k+2;
 until k>n;
 y:=y+max;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты вычислени:

Матрица А
   1.91302  -2.17594   2.29304  -2.35971   2.40282  -2.43301
  -1.59153   1.91302  -2.07597   2.17594  -2.24383   2.29304
   1.39316  -1.72955   1.91302  -2.03115   2.11419  -2.17594
  -1.25378   1.59153  -1.78449   1.91302  -2.00568   2.07597
   1.14814  -1.48245   1.67953  -1.81409   1.91302  -1.98925
  -1.06395   1.39316  -1.59153   1.72955  -1.83259   1.91302
Вектор Х                                                    
   0.09084  -0.08171   0.07226  -0.06441   0.05799  -0.05269
Z=                                                          
  -0.19786   0.24114  -0.26442   0.27943  -0.29004   0.29798
Упорядоченный массив                                        
   1.91302  -2.17594   2.29304  -2.35971   2.40282   1.91302
  -1.59153   1.91302  -2.07597   2.17594  -2.24383  -1.98925
   1.39316  -1.72955   1.91302  -2.03115   2.11419   2.07597
  -1.25378   1.59153  -1.78449   1.91302  -2.00568  -2.17594
   1.14814  -1.48245   1.67953  -1.81409   1.91302   2.29304
  -1.06395   1.39316  -1.59153   1.72955  -1.83259  -2.43301
Значение Y=0.020                                            