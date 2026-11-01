program v392;
 uses crt;
 var a,a2:array[1..10,1..10] of real;
     x,w:array[1..10] of real;
     i,j,n,k:integer;
     z,y,m,max:real;
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
 n:=6;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*f(n-i)/(2*exp(ln(i/j+1)/ln(10)));
   write(a[i,j]:10:5);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=0;k:=0;
  for j:=1 to n do
   if abs(a[n-i+1,j])<5 then begin
    x[i]:=x[i]+a[n-i+1,j];
    k:=k+1;
   end;
  if k<>0 then x[i]:=x[i]/k else x[i]:=0;
  write(x[i]:10:5);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[i,k]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do w[i]:=w[i]+a[j,j]*a2[j,i];
 for i:=1 to n do z:=z+w[i]*a[i,i];
 writeln(z:4:5);
 write;writeln('Упорядоченный массив');
 for i:=1 to n do
  if (a[n-i+1,i]>=-9) and (a[n-i+1,i]<=9) then
   for j:=n-1 downto i do
    if (a[n-j+1,j]>=-9) and (a[n-j+1,j]<=9) then
     if abs(1/a[n-j+1,j])>abs(1/a[n-i+1,i]) then begin
      y:=a[n-j+1,j];a[n-j+1,j]:=a[n-i+1,i];a[n-i+1,i]:=y;
     end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:10:5);
  writeln;
 end;
 max:=1;
 if a[1,2]<>0 then max:=max/a[1,2];
 i:=4;
 repeat
  m:=1;k:=1;
  repeat
   if a[k,i]<>0 then m:=m/a[k,i];
   k:=k+2;
  until k>i;
  if m>max then max:=m;
  i:=i+2;
 until i>n;
 j:=1;
 while x[j]=0 do j:=j+1;
 y:=1/x[j];
 for i:=j to n do
  if x[i]<>0 then
   if y>x[i] then y:=x[i];
 y:=y+max;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты вычислений-

Матрица А
  44.40333 -50.31249  52.95306 -54.45826  55.43235 -56.11470
  -7.44681   8.88067  -9.61244  10.06250 -10.36856  10.59061
   1.64305  -2.01511   2.22017  -2.35273   2.44609  -2.51562
  -0.49710   0.62057  -0.69213   0.74006  -0.77471   0.80104
   0.22963  -0.29019   0.32657  -0.35158   0.37003  -0.38428
  -0.21476   0.27384  -0.31028   0.33585  -0.35502   0.37003
Вектор Х                                                    
   0.01661  -0.01664   0.03295  -0.09569   0.00000   0.00000
Z=3841554.32080                                             
Упорядоченный массив                                        
  44.40333 -50.31249  52.95306 -54.45826  55.43235 -56.11470
  -7.44681   8.88067  -9.61244  10.06250 -10.36856  10.59061
   1.64305  -2.01511   2.22017  -2.35273   2.44609  -2.51562
  -0.49710   0.62057  -0.69213   0.74006  -0.77471   0.80104
   0.22963  -0.29019   0.32657  -0.35158   0.37003  -0.38428
  -0.21476   0.27384  -0.31028   0.33585  -0.35502   0.37003
Значение Y=-0.088                                           