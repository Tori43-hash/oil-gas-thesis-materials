program v053;
 uses crt;
 var ae,a:array[1..50,1..50] of real;
     w,c,x:array[1..50] of real;
     t,i,j,n,k:integer;
     z,y,s:real;
 {функция минимума}
 function min(m1,m2:real):real;
 begin
  if m1<m2 then min:=m1 else min:=m2;
 end;
 {функция факториал}
 function f(d:integer):integer;
 begin
  k:=1;for i:=1 to d do k:=k*i;f:=k;end;
begin
 clrscr;write('Введите размер массива-');readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=(sin(pi*(i*j+0.5)))*min(sqr(i),(1+j))/(pi*(i/j+sqr(i)+3));
   write(a[i,j]:7:3);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=0;
  for j:=n-i+2 to n do x[i]:=x[i]+a[j,n-i+1];
  write(x[i]:7:3);
 end;
 writeln;write('Z=');
 for j:=1 to n do
  for i:=1 to n do if i=j then ae[j,i]:=a[j,i]-1 else ae[j,i]:=a[j,i];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+x[n-i+1]*ae[j,i];
 for i:=1 to n do z:=z+w[i]*a[n-i+1,i];
 writeln(z:3:3);
 for j:=1 to n do
  for t:=1 to n do
   for i:=t downto 1 do
    if (a[i,j]<=-1) or (a[i,j]>=0) then
     for k:=i+1 to n do
      if (a[k,j]<=-1) or (a[k,j]>=0) and (a[k,j]<a[i,j]) then
       begin y:=a[i,j];a[i,j]:=a[k,j];a[k,j]:=y;end;
 writeln('Упорядоченный массив');
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:7:3);writeln;end;
 y:=0;
 for i:=n downto 2 do begin
  s:=1;
  for k:=1 to n do if a[i,k]>0 then s:=s*sqrt(a[i,k]);
  y:=y+s;
 end;
 i:=1;
 while i<=n do begin
  y:=y+f(i)/exp(i);
  i:=i+2;
 end;
 writeln('Значение Y=',y:2:2);
 readln;
end.

Результаты:

Введите размер массива-5           
Заданный массив                    
 -0.064  0.071 -0.073  0.075 -0.076
  0.071  0.119  0.166  0.170  0.172
 -0.042  0.071 -0.098  0.125 -0.152
  0.028  0.045  0.063  0.080  0.096
 -0.019  0.031 -0.043  0.054 -0.066
Заданный вектор                    
  0.000  0.054  0.020  0.148  0.037
Z=-0.012                           
Упорядоченный массив               
 -0.064  0.031 -0.073  0.054 -0.076
  0.028  0.045  0.063  0.075  0.096
 -0.042  0.071 -0.098  0.080 -0.152
  0.071  0.071  0.166  0.125  0.172
 -0.019  0.119 -0.043  0.170 -0.066
Значение Y=1.70                    

