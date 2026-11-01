program v777;
 uses crt;
 label 1;
 var k,n,i,j:integer;
 z,a,e,et:array[1..10,1..10] of real;
 x:array[1..10] of real;
 min,c,y:real;
 {функция факториал}
 function f(d:integer):integer;
 var l:integer;
 begin
  k:=1;
  for l:=1 to d do k:=k*l;
 f:=k;
 end;
 {функция тангенс}
 function tg(a:real):real;
  begin
   tg:=sin(a)/cos(a);
  end;
begin
 clrscr;
 write('Введите размерность матрицы (<10)-');
 readln(n);
 writeln('A=');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=1/tg(pi*(8.25+(i+j)/2))*tg(f(i)/f(j))/(pi*i*(1+i/j));
   write(a[i,j]:9:5);
  end;
  writeln;
 end;
 writeln('X=');
 for i:=1 to n do begin
  for k:=1 to n do if (a[k,n-i+1]>=-10) and (a[k,n-i+1]<=10) then
   begin
    x[i]:=a[k,n-i+1];
    goto 1;
   end;
  1: for j:=k+1 to n do
   if (a[j,n-i+1]>=-10) and (a[j,n-i+1]<=10) then
    if a[j,n-i+1]>x[i] then x[i]:=a[j,n-i+1];
  write(x[i]:9:5);
 end;
 writeln;writeln('Z=');
 for i:=1 to n do
  for j:=1 to n do
   if i=j then e[i,j]:=a[j,i]-1 else e[i,j]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do
   if i=j then et[i,j]:=a[i,j]-1 else et[i,j]:=a[i,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do
    z[i,j]:=z[i,j]+e[i,k]*et[j,k];
 c:=0;
 for i:=1 to n do
  c:=c+sqr(a[n-i+1,i]);
 for i:=1 to n do begin
  for j:=1 to n do begin
   z[i,j]:=z[i,j]*c;
   write(z[i,j]:9:5);
  end;
  writeln;
 end;
 writeln('Матрица после упорядочивания');
 for i:=1 to n do
  for j:=n-1 downto i do
   if a[n,j]<a[n,j+1] then
    begin
     c:=a[n,j];a[n,j]:=a[n,j+1];a[n,j+1]:=c;
    end;
 for i:=1 to n do begin
  for j:=1 to n do
   write(a[i,j]:9:5);
  writeln;
 end;
 k:=2;y:=0;
 while k<=n do begin
  if a[1,k]<>0 then y:=y+ln(abs(a[1,k]))/ln(10);
  k:=k+2;
 end;
 i:=3;
 while i<=n do begin
  k:=2;min:=0;
  while k<=n do begin
   if a[i,k]<>0 then min:=min+ln(abs(a[1,k]))/ln(10);
   k:=k+2;
  end;
  if min<y then y:=min;
  i:=i+2;
 end;
 c:=1;i:=1;
 while i<=n do begin
  if a[i,i]<>0 then c:=c*ln(i)/(ln(10)*a[i,i]);
  i:=i+2;
 end;
 y:=y+c;
 writeln('Y=',y:5:5);
 readln;
end.