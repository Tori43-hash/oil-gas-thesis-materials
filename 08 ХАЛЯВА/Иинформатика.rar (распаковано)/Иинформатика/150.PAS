program v150;
 uses crt;
 var a2,a,at:array[1..50,1..50] of real;
     z,x:array[1..50] of real;
     i,j,n,k:integer;
     q,y,min:real;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
  f:=k;
 end;
begin
 clrscr;
 n:=5;
 writeln('A=');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,i*j-3)*(j*sin(f(i)))/(pi*(i/j+sqr(i)+3));
   write(a[i,j]:8:4);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=a[i+1,i];
  for j:=i+1 to n do
   if a[j,i]>x[i] then x[i]:=a[j,i];
  write(x[i]:8:4);
 end;
 writeln;writeln('Z');
 for i:=1 to n do
   for j:=1 to n do at[i,j]:=a[j,i]-a[i,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+at[i,k]*at[k,j];
 for i:=1 to n do
  for j:=1 to n do z[i]:=z[i]+x[n-j+1]*at[j,i];
 for i:=1 to n do q:=q+sqr(x[i]);
 for i:=1 to n do begin
  z[i]:=z[i]*(q+1);
  write(z[i]:8:4);
 end;
 writeln;writeln('Упорядоченная матрица');
 for i:=1 to n do
  if (a[2,i]>=0) or (a[2,i]<=-1) then
   for k:=n downto i+1 do
    if (a[2,k]>=0) or (a[2,k]<=-1) then
     if abs(a[2,k])<abs(a[2,k+1]) then begin
      y:=a[2,k];a[2,k]:=a[2,k+1];a[2,k+1]:=y;end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:8:4);
  writeln;
 end;
 min:=1;
 for k:=1 to n do if a[1,k]>0 then min:=min*sqrt(a[1,k]);
 for i:=2 to n do begin
  q:=1;
  for k:=1 to n do if a[i,k]>0 then q:=q*sqrt(a[i,k]);
  if q<min then min:=q;
 end;
 y:=x[1];
 for i:=2 to n do if x[i]>y then y:=x[i];
 y:=y+min;
 writeln('Значение Y=',y:3:3);
 readln;
end.

Результаты:

A=
  0.0536 -0.1190  0.1854 -0.2521  0.3189
 -0.0322 -0.0724 -0.1133 -0.1544 -0.1956
 -0.0059  0.0132 -0.0205  0.0279 -0.0353
  0.0125  0.0275  0.0425  0.0577  0.0728
  0.0056 -0.0121  0.0187 -0.0253  0.0319
Заданный вектор
  0.0125  0.0275  0.0425 -0.0253  0.0000
Z
  0.0070 -0.0127 -0.0043 -0.0028 -0.0050
Упорядоченная матрица
  0.0536 -0.1190  0.1854 -0.2521  0.3189
 -0.0322 -0.0724 -0.1133 -0.1544 -0.1956
 -0.0059  0.0132 -0.0205  0.0279 -0.0353
  0.0125  0.0275  0.0425  0.0577  0.0728
  0.0056 -0.0121  0.0187 -0.0253  0.0319
Значение Y=0.043
