program v844;
 uses crt;
 var w,a,at:array[1..20,1..20] of real;
     z,x:array[1..20] of real;
     i,j,n,k:integer;
     y,m:real;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;for l:=1 to d do k:=k*l;f:=k;end;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;
 write('Ввод размера массива: максимум 20-');
 readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=arctan(sin(pi*(j+0.5)))*ln(f(n-j+1))/(1.31*arctan(i/j));
   write(a[i,j]:3:3,' ');
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=1;j:=1;
  while j<=n do begin
   x[i]:=x[i]*a[i,j];
   j:=j+2;
  end;
  write(x[i]:3:3,' ');
 end;
 writeln;writeln('Z=');
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[j,i]:=at[j,i]+a[j,k]*a[i,k];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do w[i,j]:=w[i,j]+at[i,k]*a[j,k];
 for i:=1 to n do
  for j:=1 to n do z[i]:=z[i]+x[j]*w[j,i];
 for i:=1 to n do write(z[i]:3:2,' ');
 for i:=1 to round(n/2) do
  if x[i]<>0 then
   for j:=round(n/2) downto i do
    if (x[j]<>0) and (abs(x[j])>abs(x[j+1])) then begin
      y:=x[i];x[i]:=x[j+1];x[j+1]:=y;end;
 writeln;writeln('Упорядоченный вектор');
 for i:=1 to n do write(x[i]:3:3,' ');
 y:=0;i:=2;
 while i<=n do begin
  m:=abs(a[i,1]);
  for k:=2 to n do
   if abs(a[k,i])<m then m:=abs(a[k,i]);
  y:=y+m;
  i:=i+2;
 end;
 m:=a[1,1];
 for k:=1 to n do
  if (a[k,k]>0) and (s(a[k,k],1/k)>m) then  m:=s(a[k,k],1/k);
 y:=y+m;
 writeln;writeln('Значение Y=',y:1:2);
 readln;
end.


