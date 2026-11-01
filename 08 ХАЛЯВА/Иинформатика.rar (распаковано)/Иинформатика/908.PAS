program v908;
 uses crt;
 var a,at:array[1..20,1..20] of real;
     z,w,c,x:array[1..20] of real;
     i,j,n,k:integer;
     y,max,min:real;
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
 procedure matr;
  begin
   a[j,i]:=s(-1,i+j)*(j*sin(f(i)))/(pi*exp(j/i));
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
   for k:=1 to n do at[i,j]:=at[i,j]+a[k,i]*a[i,k];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+at[j,i]*c[n-i+1];
 for i:=1 to n do y:=y+sqr(x[i]);
 for i:=1 to n do begin
  z[i]:=w[i]*(y+1);write(z[i]:7:3);end;writeln;
 i:=2;while i<=n do begin
  j:=i;while j<=n do begin
   if a[2,i]<0 then
    if (a[2,j]<0) and (a[2,i]>a[2,j]) then begin
     y:=a[2,i];a[2,i]:=a[2,j];a[2,j]:=y;end;
 j:=j+2;end;i:=i+2;end;
 writeln('Упорядоченный массив');
 for j:=1 to n do begin
  for i:=1 to n do write(a[j,i]:7:3);
 writeln;end;
 max:=0;
 for i:=1 to n do begin
  min:=a[1,i];
  for k:=0 to n-1 do if a[n-k,i]<min then min:=a[n-k,i];
  if min>max then max:=min;
 end;
 y:=x[1];
 for i:=2 to n do if x[i]>y then y:=x[i];
 y:=y+max;
 writeln('Значение Y=',y:1:2);readln;end.

Полученные результаты

Введите размер массива (не больше 20)-6
Заданный массив
  0.099 -0.176 -0.064  0.224  0.151  0.147
 -0.072  0.213  0.091 -0.350 -0.248 -0.248
  0.040 -0.194 -0.098  0.408  0.304  0.315
 -0.020  0.157  0.094 -0.424 -0.332 -0.356
  0.009 -0.119 -0.084  0.413  0.340  0.376
 -0.004  0.086  0.072 -0.386 -0.334 -0.382
Заданный вектор
  0.009 -0.194 -0.098  0.224  0.151  0.147
Z
  0.005 -0.002  0.008  0.051 -0.045  0.050
Упорядоченный массив
  0.099 -0.176 -0.064  0.224  0.151  0.147
 -0.072  0.213  0.091 -0.350 -0.248 -0.248
  0.040 -0.194 -0.098  0.408  0.304  0.315
 -0.020  0.157  0.094 -0.424 -0.332 -0.356
  0.009 -0.119 -0.084  0.413  0.340  0.376
 -0.004  0.086  0.072 -0.386 -0.334 -0.382
Значение Y=0.22
