program v981;
 uses crt;
 var a,at:array[1..20,1..20] of real;
     z,w,c,x:array[1..20] of real;
     i,j,n,k:integer;
     y,m,min:real;
{функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
{функция факториал}
 function f(d:integer):integer;
 begin
  k:=1;for i:=1 to d do k:=k*i;f:=k;end;
{функция максимума}
 function max(a,b:real):real;
  begin
   if a>b then max:=a else max:=b;end;
 procedure matr;
  begin
   a[j,i]:=s(-1,i+j)*max(i,j)/(pi*exp(j/i));
   write(a[j,i]:7:3);end;
 procedure vect;
  begin
  j:=1;min:=a[1,i];while j<=n do begin
    if min>a[j,i] then min:=a[j,i];
  j:=j+2;end;x[i]:=min;write(x[i]:7:3);end;
begin
 clrscr;
 write('Введите размер массива (не больше 20)-');readln(n);
 writeln('Заданный массив');
 for j:=1 to n do begin
  for i:=1 to n do matr;
 writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do vect;
 writeln;writeln('Z');
 for i:=1 to n do c[i]:=a[i,n-i+1];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[i,j]:=at[i,j]+a[j,i]*a[i,k];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+at[j,i]*c[n-i+1];
 for i:=1 to n do y:=y+a[i,i];
 for i:=1 to n do begin
  z[i]:=w[i]*y;write(z[i]:7:3);end;writeln;
 i:=2;while i<=n do begin
  if x[j]<0 then
   j:=n;while j>=i do begin
    if x[j]<0 then
     if x[i]>x[j] then begin
      y:=x[i];x[i]:=x[j];x[j]:=y;end;
 j:=j-2;end;i:=i+2;end;
 writeln('Упорядоченный вектор');
 for i:=1 to n do write(x[i]:7:3);
 writeln;
 m:=a[n,1];for i:=2 to n do if a[n,i]<m then m:=a[n,i];
 for i:=1 to n do begin
  min:=a[1,i];
  for k:=1 to n-1 do if a[n-k,i]<min then min:=a[n-k,i];
  if min>m then m:=min;
 end;y:=0;
 for i:=1 to n do if abs(a[i,i])>1 then y:=y+f(n-i)/s(a[i,i],i);
 y:=y+m;
 writeln('Значение Y=',y:1:2);readln;end.

Полученные результаты

Введите размер массива (не больше 20)-6
Заданный массив                            
  0.117 -0.386  0.684 -0.992  1.303 -1.617 
 -0.086  0.234 -0.490  0.772 -1.067  1.368 
  0.048 -0.213  0.351 -0.601  0.873 -1.158 
 -0.023  0.172 -0.336  0.468 -0.715  0.981 
  0.011 -0.131  0.301 -0.456  0.585 -0.830 
 -0.005  0.095 -0.258  0.426 -0.575  0.703 
Заданный вектор                            
  0.011 -0.386  0.301 -0.992  0.585 -1.617 
Z                                          
 -0.011 -0.135 -0.417 -0.509 -0.736 -0.590 
Упорядоченный вектор                       
  0.011 -1.617  0.301 -0.992  0.585 -0.386 
Значение Y=-0.09                           
                                           
                                           