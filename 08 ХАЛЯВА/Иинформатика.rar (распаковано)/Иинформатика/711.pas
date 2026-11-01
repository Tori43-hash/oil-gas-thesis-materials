program v711;
 uses crt;
 var k,n,i,j:integer;
 a,ae:array[1..10,1..10] of real;
 z,x:array[1..10] of real;
 m,c,y:real;
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
 {функция котангенс}
 function ctg(a:real):real;
  begin
   ctg:=cos(a)/sin(a);
  end;
 {функция максимум}
 function max(m1,m2:real):real;
 begin
  if m1>m2 then max:=m1 else max:=m2;
 end;

begin
 clrscr;
 write('Введите размерность матрицы (<10)-');
 readln(n);
 writeln('A=');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=ctg(pi*(8.25+(i+j)/2))*max(i,j)/(3*ln(i*j+3/i)/ln(3));
   write(a[i,j]:9:5);
  end;
  writeln;
 end;
 writeln('X=');
 for i:=1 to n do begin
  j:=1;
  while a[j,i]>=0 do j:=j+1;
  m:=a[j,i];
  for k:=j+1 to n do
   if  (a[k,i]<0) and (a[k,i]>m) then m:=a[k,i];
  x[i]:=m;
  write(x[i]:9:5);
 end;
 writeln;writeln('Z=');
 for i:=1 to n do
  for j:=1 to n do
   if i=j then ae[i,j]:=a[j,i]-1 else ae[i,j]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do
    z[i]:=z[i]+a[n-j+1,n-j+1]*ae[j,i];
 c:=0;
 for i:=1 to n do c:=c+a[i,i];
 for i:=1 to n do begin
  z[i]:=z[i]*c;
  write(z[i]:9:5);
 end;
 writeln;writeln('Вектор после упорядочивания');
 for i:=1 to n do
  if x[i]<0 then
   for j:=n-1 downto i do
    if x[j]<0 then
     if x[i]<x[j] then
      begin
       c:=x[i];x[i]:=x[j];x[j]:=c;
      end;
 for i:=1 to n do write(x[i]:9:5);
 i:=1;c:=1;
 if a[1,1]<0 then c:=c*a[1,1];
 m:=c;
 while i<=n do begin
  c:=1;
  for k:=i downto 1 do
   if a[k,i]<0 then c:=c*a[k,i];
  if c<m then m:=c;
  i:=i+2;
 end;
 y:=0;
 for i:=n downto 1 do
  if abs(a[i,i])>1 then y:=y+f(n-i)/s(a[i,i],i);
 y:=y+m;
 writeln;writeln('Y=',y:5:5);
 readln;
end.

Результат работы:

