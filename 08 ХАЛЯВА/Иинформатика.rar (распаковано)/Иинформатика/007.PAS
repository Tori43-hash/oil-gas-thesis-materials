program v007;
 uses crt;
 var ed,a:array[1..10,1..10] of real;
     z,x:array[1..10] of real;
     i,j,n,k:integer;
     y,min,c:real;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;
 write('Введите кол-во элементов (не более 10)?');readln(n);
 writeln('Заданная матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=sin(pi*(i*j+0.5))*arctan(s(i+j,1/3))/(2*i*(j+1/j));
   write(a[i,j]:9:5);
  end;
  writeln;
 end;
 writeln('Заданный вектор X');
 for i:=1 to n do begin
  x[i]:=0;
  for j:=1 to n do
   if a[j,n-i+1]>0 then x[i]:=x[i]+a[j,n-i+1];
  write(x[i]:9:5);
 end;
 writeln;writeln('Z');
 for j:=1 to n do
  for i:=1 to n do
   if i=j then ed[j,i]:=a[j,i]-1 else ed[j,i]:=a[j,i];
 for i:=1 to n do
  for j:=1 to n do
   z[i]:=z[i]+x[j]*ed[j,i];
 c:=0;
 for i:=1 to n do
  c:=c+sqr(a[i,n-i+1]);
 for i:=1 to n do z[i]:=z[i]*c;
 for i:=1 to n do write(z[i]:9:5);
 writeln;writeln('Упорядоченная матрица');
 i:=2;
 while i<=n do begin
  if a[n,i]<>0 then
   j:=i;
   while j<=n do begin
    if (a[n,j]<>0) then
     if a[n,j]<a[n,i] then begin
      y:=a[n,j];a[n,j]:=a[n,i];a[n,i]:=y;end;
    j:=j+2;
   end;
  i:=i+2;
 end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:9:5);
  writeln;
 end;
 y:=0;
 for i:=n downto 2 do begin
  min:=a[i,2];
  k:=4;
  while k<=n do begin
   if a[i,k]<min then min:=a[i,k];
   k:=k+2;
  end;
  y:=y+min;
 end;
 c:=1;i:=1;
 while i<=n do begin
  if a[i,i]<>0 then c:=c*ln(i)/(ln(10)*a[i,i]);
  i:=i+2;
 end;
 y:=y+c;
 writeln('Значение Y=',y:4:4);
 readln;
end.

Полученные данные:

Введите кол-во элементов (не более 10)?6
Заданная матрица А
 -0.22498  0.19291 -0.15130  0.12254 -0.10266  0.08831
  0.12057  0.10086  0.07812  0.06281  0.05236  0.04488
 -0.08405  0.06944 -0.05339  0.04271 -0.03549  0.03034
  0.06510  0.05339  0.04084  0.03256  0.02699  0.02303
 -0.05339  0.04356 -0.03321  0.02642 -0.02185  0.01862
  0.04538  0.03690  0.02807  0.02228  0.01840  0.01566
Заданный вектор X
  0.22085  0.09775  0.30932  0.14703  0.49707  0.23105
Z
 -0.00524  0.00026 -0.00640 -0.00140 -0.00950 -0.00327
Упорядоченная матрица
 -0.22498  0.19291 -0.15130  0.12254 -0.10266  0.08831
  0.12057  0.10086  0.07812  0.06281  0.05236  0.04488
 -0.08405  0.06944 -0.05339  0.04271 -0.03549  0.03034
  0.06510  0.05339  0.04084  0.03256  0.02699  0.02303
 -0.05339  0.04356 -0.03321  0.02642 -0.02185  0.01862
  0.04538  0.01566  0.02807  0.02228  0.01840  0.03690
Значение Y=0.1325
