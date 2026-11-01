program v145;
 uses crt;
 var z,w,a,at:array[1..50,1..50] of real;
     x:array[1..50] of real;
     i,j,n,k:integer;
     q,y,min:real;
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
 {функция максимума}
 function max(d,f,g:real):real;
 var m:real;
 begin
  m:=d;
  if f>m then m:=f;
  if g>m then m:=g;
  max:=m;
 end;
begin
 clrscr;
 n:=5;
 writeln('A=');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,i*j-3)*max(4,i/j,j)/(1.31*arctan(i/j));
   write(a[i,j]:8:3);
  end;
  writeln;
 end;
 writeln('X=');
 for i:=1 to n do begin
  x[i]:=a[1,i];
  j:=1;
  while j<=n do begin
   if a[j,i]>x[i] then x[i]:=a[j,i];
   j:=j+2;
  end;
  write(x[i]:7:3);
 end;
 writeln;writeln('Z=');
 for i:=1 to n do
  for j:=1 to n do at[i,j]:=a[j,i]-a[i,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do w[i,j]:=w[i,j]+at[i,k]*at[k,j];
 q:=0;
 for i:=1 to n do q:=q+a[i,i]*a[n-i+1,i];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do z[i,j]:=z[i,j]+at[i,k]*a[j,k];
 for i:=1 to n do
  for j:=1 to n do z[i,j]:=z[i,j]*q;
 for i:=1 to n do begin
  for j:=1 to n do write(z[i,j]:10:2);
  writeln;
 end;
 writeln('Упорядоченная матрица');
 for i:=1 to n do
  for j:=1 to n do at[i,j]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do
  if at[i,j]<>0 then
   for k:=n-1 downto j do
    if at[i,k]<>0 then
     if abs(at[i,k])<abs(at[i,k+1]) then begin
      y:=at[i,k];at[i,k]:=at[i,k+1];at[i,k+1]:=y;end;
 for i:=1 to n do begin
  for j:=1 to n do write(at[i,j]:8:3);
  writeln;
 end;
 min:=abs(a[1,1]);
 for k:=2 to n do if abs(a[1,k])<min then min:=abs(a[1,k]);
 for i:=2 to n do begin
  q:=abs(a[i,1]);
  for k:=2 to n do if abs(a[i,k])<q then q:=abs(a[i,k]);
  if q<min then min:=q;
 end;
 y:=0;
 for i:=1 to n do if x[i]>2 then y:=y+s(x[i],i)/f(i);
 y:=y+min;
 writeln('Значение Y=',y:3:3);
 readln;
end.

Результаты:

A=
   3.888  -6.586   9.490 -12.464  19.336
  -2.758  -3.888  -5.193  -6.586 -10.031
   2.445  -3.107   3.888  -4.745   7.063
  -2.303  -2.758  -3.293  -3.888  -5.657
   2.779  -2.565   2.963  -3.408   4.860
X=
  3.888 -2.565  9.490 -3.408 19.336
Z=
 -84174.71  18880.37 -31934.42  10434.11 -22772.91
  15864.34 -15678.80   5204.33  -8617.34   2933.74
  -8784.25   3160.77  -1896.05   1104.29      9.61
   2407.24   4356.10   -423.17   4064.26  -1842.17
  28191.04  -3610.55  14102.36  -3482.87  13274.04
Упорядоченная матрица
   3.888   2.779  -2.758   2.445  -2.303
  -6.586  -3.888  -3.107  -2.758  -2.565
   9.490  -5.193   3.888  -3.293   2.963
 -12.464  -6.586  -4.745  -3.888  -3.408
  19.336 -10.031   7.063  -5.657   4.860
Значение Y=22671.596
