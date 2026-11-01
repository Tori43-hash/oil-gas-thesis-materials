program v789;
 uses crt;
 label 1;
 var k,n,i,j:integer;
 a,e:array[1..10,1..10] of real;
 z,x:array[1..10] of real;
 min,c,y:real;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
 f:=k;
 end;
 {функция котангенс}
 function ctg(a:real):real;
  begin
   ctg:=cos(a)/sin(a);
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
 write('Введите размерность матрицы (<10)-');
 readln(n);
 writeln('A=');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=ctg(pi*(8.25+(i+j)/2))*ln(sqr(n)-i/j+1)/ln(2)/(pi*exp(j/i));
   write(a[i,j]:9:5);
  end;
  writeln;
 end;
 writeln('X=');
 for i:=1 to n do begin
  x[i]:=a[1,i];
  k:=3;
  repeat
   if a[k,i]>x[i] then x[i]:=a[k,i];
   k:=k+2
  until k>n;
  write(x[i]:9:5);
 end;
 writeln;writeln('Z=');
 for i:=1 to n do
  for j:=1 to n do
   if i=j then e[i,j]:=a[j,i]-1 else e[i,j]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do z[i]:=z[i]+a[n-i+1,i]*e[j,i];
 c:=0;
 for i:=1 to n do c:=c+x[i]*x[n-i+1];
 for i:=1 to n do begin
  z[i]:=z[i]*c;
  write(z[i]:9:5);
 end;
 writeln;writeln('Матрица после упорядочивания');
 i:=2;
 while i<=n do begin
  j:=n-2;
  if a[i,n]<0 then
   while j>=i do begin
    if a[j,n]<0 then
     if a[j,n]<a[j+2,n] then
      begin
       c:=a[j,n];a[j,n]:=a[j+2,n];a[j+2,n]:=c;
      end;
    j:=j-2;
   end;
  i:=i+2;
 end;
 for i:=1 to n do begin
  for j:=1 to n do
   write(a[i,j]:9:5);
  writeln;
 end;
 y:=a[n,1];
 for k:=1 to n-1 do
  if a[n-k,1]<y then y:=a[n-k,1];
 i:=3;
 while i<=n do begin
  min:=a[n,i];
  for k:=1 to n do
   if a[n-k,i]<min then min:=a[n-k,i];
  if min<y then y:=min;
  i:=i+2;
 end;
 c:=0;k:=2;
 while k<=n do begin
  c:=c+x[k]*s(f(k),1/k);
  k:=k+2;
 end;
 y:=y+c;
 writeln('Y=',y:5:5);
 readln;
end.

Результат работы программы-
Введите размерность матрицы (<10)-6
A=
  0.60540 -0.22357  0.08235 -0.03031  0.01116 -0.00411
 -0.99028  0.60540 -0.36814  0.22357 -0.13571  0.08235
  1.16034 -0.84160  0.60540 -0.43462  0.31178 -0.22357
 -1.25051  0.99028 -0.77533  0.60540 -0.47221  0.36814
  1.30305 -1.09000  0.89843 -0.73799  0.60540 -0.49630
 -1.33488  1.16034 -0.99028  0.84160 -0.71408  0.60540
X=
  1.30305 -0.22357  0.89843 -0.03031  0.60540 -0.00411
Z=
 -0.25066 -0.57946 -0.10996 -0.22396 -0.02358 -0.00197
Матрица после упорядочивания
  0.60540 -0.22357  0.08235 -0.03031  0.01116 -0.00411
 -0.99028  0.60540 -0.36814  0.22357 -0.13571  0.08235
  1.16034 -0.84160  0.60540 -0.43462  0.31178 -0.22357
 -1.25051  0.99028 -0.77533  0.60540 -0.47221  0.36814
  1.30305 -1.09000  0.89843 -0.73799  0.60540 -0.49630
 -1.33488  1.16034 -0.99028  0.84160 -0.71408  0.60540
Y=-1.68566
