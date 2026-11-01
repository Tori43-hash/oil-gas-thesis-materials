program v067;
 uses crt;
 var e,a:array[0..6,0..6] of real;
 z,q,c,x:array[0..6] of real;
 i,j,n,k:integer;
 max,s,y:real;
 {функция возведения в степень}
 function st(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then st:=exp(b*ln(abs(a))) else st:=-exp(b*ln(abs(a)))
    else st:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;
 n:=6;
 writeln('Заданная матрица');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=sin(pi*(i*j+0.5))*arctan(st(i+j,1/3))/(5*sqrt(i+2/j));
   write(a[i,j]:8:4);
  end;
  writeln;
 end;
 writeln('Полученный вектор');
 for i:=1 to n do begin
  x[i]:=0;
  for j:=n-i downto 1 do x[i]:=x[i]+a[j,n-i+1];
  write(x[i]:8:4);
 end;
 i:=n;y:=0;
 while i>=2 do begin
  max:=a[1,i];
  for k:=2 to n do if a[k,i]>max then max:=a[k,i];
  y:=y+max;
  i:=i-1;
 end;
 i:=1;s:=1;
 while i<=n do begin
  if a[i,i]<>0 then s:=s*ln(i)/ln(10)/a[i,i];
  i:=i+2;
 end;
 y:=y+s;
 writeln;writeln('Y=',y:5:4);
 for i:=1 to n do
  for j:=1 to n do if i=j then e[i,j]:=a[i,j]-1 else e[i,j]:=a[i,j];
 for i:=1 to n do c[i]:=a[i,i]+a[n-i+1,i];
 for i:=1 to n do
  for j:=1 to n do q[i]:=q[i]+c[j]*e[i,j];
 y:=0;for i:=1 to n do y:=y+a[n-i+1,i]*a[n-i+1,i];
 for i:=1 to n do z[i]:=z[i]+q[i]*y;
 write('Z-');for i:=1 to n do write(z[i]:6:3);
 writeln;writeln('Упорядоченная матрица');
 i:=2;
 while i<=n do begin
  j:=n-2;
  while j>=i do begin
   if a[n,j]>a[n,j+2] then begin
    y:=a[n,j];a[n,j]:=a[n,j+2];a[n,j+2]:=y;end;
   j:=j-2;
  end;
  i:=i+2;
 end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:8:4);
  writeln;
 end;
 readln;
end.

Полученные результаты:

Заданная матрица
 -0.1039  0.1364 -0.1563  0.1701 -0.1805  0.1886
  0.0965  0.1165  0.1276  0.1351  0.1406  0.1450
 -0.0902  0.1042 -0.1115  0.1164 -0.1201  0.1230
  0.0850  0.0955  0.1008  0.1044  0.1070  0.1092
 -0.0807  0.0889 -0.0930  0.0957 -0.0978  0.0994
  0.0770  0.0837  0.0870  0.0891  0.0908  0.0921
Полученный вектор                               
  0.6652 -0.0529  0.4216 -0.0287  0.1364  0.0000
Y=0.7633                                        
Z- 0.013-0.010 0.008-0.014 0.002-0.020          
Упорядоченная матрица                           
 -0.1039  0.1364 -0.1563  0.1701 -0.1805  0.1886
  0.0965  0.1165  0.1276  0.1351  0.1406  0.1450
 -0.0902  0.1042 -0.1115  0.1164 -0.1201  0.1230
  0.0850  0.0955  0.1008  0.1044  0.1070  0.1092
 -0.0807  0.0889 -0.0930  0.0957 -0.0978  0.0994
  0.0770  0.0837  0.0870  0.0891  0.0908  0.0921