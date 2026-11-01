program v693;
 uses crt;
 var a,at:array[1..10,1..10] of real;
     x,w:array[1..10] of real;
     i,j,n,k:integer;
     z,y,m:real;
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
 {функция минимума}
 function min(m1,m2:real):real;
 begin
  if m1<m2 then min:=m1 else min:=m2;
 end;
begin
 clrscr;
 n:=5;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,i+j-2)*min(sqr(i),j+1)/(2*exp(ln(i/j+1)/ln(10)));
   write(a[i,j]:10:5);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=0;
  for j:=1 to n do
   if abs(a[j,n-i+1])<5 then x[i]:=x[i]+a[j,n-i+1];
  write(x[i]:10:5);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do at[i,j]:=a[i,j]*a[j,i];
 for i:=1 to n do
  for j:=1 to n do w[i]:=w[i]+a[i,i]*at[j,i];
 for i:=1 to n do z:=z+w[i]*a[n-i+1,i];
 writeln(z:4:5);
 write;writeln('Упорядоченный массив');
 for k:=1 to n do
  for i:=1 to n do
   if (a[i,k]<=9) and (a[i,k]>=-9) then
    for j:=n-1 downto i do
     if (a[j,k]<=9) and (a[j,k]>=-9) then
      if abs(a[j,k])>abs(a[j+1,k]) then begin
       y:=a[j,k];a[j,k]:=a[j+1,k];a[j+1,k]:=y;end;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:10:5);
  writeln;
 end;
 y:=1;
 for i:=n downto 1 do begin
  k:=1;m:=1;
  while k<=i do begin
   if a[k,i]<>0 then m:=m/a[k,i];
   k:=k+2;
  end;
  y:=y*m;
 end;
 m:=1;i:=1;
 repeat
   m:=m*f(i)/exp(i);
   i:=i+2;
 until i>n;
 y:=y+m;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты вычислений-

Матрица А
   0.37003  -0.41927   0.44128  -0.45382   0.46194
  -0.62057   1.11008  -1.60207   1.67708  -1.72809
   0.54768  -1.00755   1.48011  -1.96060   2.44609
  -0.49710   0.93085  -1.38427   1.85014  -2.32412
   0.45925  -0.87057   1.30627  -1.75788   2.22017
Вектор Х                                          
   1.07599  -0.64508   0.24132  -0.25646   0.25930
Z=79.91674                                        
Упорядоченный массив                              
   0.37003  -0.41927   0.44128  -0.45382   0.46194
   0.45925  -0.87057   1.30627   1.67708  -1.72809
  -0.49710   0.93085  -1.38427  -1.75788   2.22017
   0.54768  -1.00755   1.48011   1.85014  -2.32412
  -0.62057   1.11008  -1.60207  -1.96060   2.44609
Значение Y=5.362