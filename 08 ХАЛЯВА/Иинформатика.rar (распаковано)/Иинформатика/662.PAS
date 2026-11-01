program v662;
 uses crt;
 var a,at:array[1..10,1..10] of real;
     q,x,w:array[1..10] of real;
     i,j,n,k:integer;
     min,z,y,max:real;
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
 n:=8;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,i+j-2)*f(n-i)/(5*sqrt(i+2/j));
   write(a[i,j]:9:3);
  end;
  writeln;
 end;
 writeln('Вектор Х=');
 for i:=1 to n do begin
  x[i]:=0;
  for j:=n-i downto 1 do
   x[i]:=x[i]+a[j,n-i+1];
  write(x[i]:9:3);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do at[i,j]:=a[i,j]-a[j,i];
 for i:=1 to n do w[i]:=a[i,i]+a[n-i+1,i];
 for i:=1 to n do
  for j:=1 to n do q[i]:=q[i]+w[j]*at[j,i];
 for i:=1 to n do z:=z+q[i]*a[i,i];
 write(z:4:5);
 writeln;writeln('Упорядоченный массив');
 i:=2;
 repeat
  j:=n-2;
  repeat
   if abs(a[n-j+1,j])>abs(a[n-j-1,j+2]) then begin
    y:=a[n-j+1,j];a[n-j+1,j]:=a[n-j-1,j+2];a[n-j-1,j+2]:=y;
   end;
   j:=j-2;
  until j<i;
  i:=i+2;
 until i>n-2;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:9:3);
  writeln;
 end;
 y:=1;
 for i:=n downto 1 do begin
  max:=a[1,i];
  for k:=2 to n do
   if a[k,i]>max then max:=a[k,i];
  y:=y*max;
 end;
 j:=1;
 while x[j]=0 do j:=j+1;
 min:=1/x[j];
 for i:=j+1 to n do
  if x[i]<>0 then
   if 1/x[i]<min then min:=1/x[i];
 y:=y+min;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты вычислений:

