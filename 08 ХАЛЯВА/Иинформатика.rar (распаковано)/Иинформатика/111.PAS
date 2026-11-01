program v111;
 uses crt;
 var a,at,a2:array[1..11,1..11] of real;
     z,x:array[1..11] of real;
     i,j,n,k:integer;
     y,m:real;
 {функция максимума}
 function max(a,b:integer):integer;
 begin
  if a>=b then max:=a else max:=b;
 end;
 {функция факториал}
 function f(d:integer):integer;
 var r:integer;
 begin
  k:=1;
  for r:=1 to d do k:=k*r;
  f:=k;
 end;
 {функция возведения в степень}
 function s(a:real;b:integer):real;
  begin
   if (a<0) then
    if b mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;
 write('Введите размер массива (не больше 11)-');
 readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,i*j-3)*max(i,j)/(3*ln(i*j+3/i)/ln(3));
   write(a[i,j]:8:4);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  k:=1;while a[k,i]>=0 do k:=k+1;
  m:=a[k,i];
  for j:=k+1 to n do
   if (a[j,i]<0) and (a[j,i]>m) then m:=a[j,i];
  x[i]:=m;
  write(x[i]:8:4);
 end;
 writeln;writeln('Z');
 for i:=1 to n do
  for j:=1 to n do at[i,j]:=a[j,i]-a[i,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do  a2[i,j]:=a2[i,j]+at[i,k]*at[k,j];
 for i:=1 to n do
  for j:=1 to n do z[i]:=z[i]+a[n-i+1,n-i+1]*a2[j,i];
 m:=0;
 for i:=1 to n do m:=m+a[i,i];
 for i:=1 to n do z[i]:=z[i]*m;
 for i:=1 to n do write(z[i]:8:4);
 writeln;
 for i:=1 to n-1 do
  for j:=n downto i do
   if x[j]<0 then begin
    k:=j-1;while x[k]>=0 do k:=k-1;
     if abs(x[k])<abs(x[j]) then begin
       y:=x[j];x[j]:=x[k];x[k]:=y;
     end;
   end;
 writeln('Упорядоченный вектор');
 for i:=1 to n do write(x[i]:8:4);
 y:=1;
 if a[1,1]<0 then y:=y*a[1,1];
 for i:=2 to n do begin
  m:=1;
  for k:=i downto 1 do if a[k,i]<0 then m:=m*a[k,i];
  if m<y then y:=m;
 end;
 m:=0;
 for i:=n downto 1 do if abs(a[i,i])>1 then m:=m+f(n-i)/s(a[i,i],i);
 y:=y+m;
 writeln;writeln('Значение Y=',y:1:4);
 readln;
end.



