program v223;
 uses crt;
 var a,ed,w:array[1..30,1..30] of real;
     z,c,x:array[1..30] of real;
     i,j,n,k:integer;
     y,q,m,max:real;
 {функция факториал}
 function f(d:integer):integer;
 begin k:=1;for j:=1 to d do k:=k*j;f:=k;end;
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
 write('Введите размер массива (не больше 30)-');readln(n);
 writeln('Массив А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=cos(0.0625*pi*(i-j))*min(sqr(i),j+1)/(pi*ln(j/i+1));
   write(a[i,j]:7:3);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  m:=1;k:=0;
  for j:=1 to n do begin
   if a[j,n-i+1]<>0 then begin
    m:=m*a[j,n-i+1];
    k:=k+1;
   end;
  end;
  x[i]:=s(m,1/k);write(x[i]:7:3);
 end;
 writeln;writeln('Z=');
 for i:=1 to n do
  for j:=1 to n do
   if i=j then ed[i,j]:=a[i,j]+1 else ed[i,j]:=a[i,j];
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do  w[i,j]:=w[i,j]+ed[k,i]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do z[i]:=z[i]+a[n-j+1,j]*w[j,i];
 for i:=1 to n do write(z[i]:7:2);
 writeln;
 for k:=1 to n do begin
  i:=1;
  while i<=n do begin
   j:=n-3;
   while j>=i do begin
    if 1/a[j+3,k]>1/a[j,k] then begin
      y:=a[j,k];a[j,k]:=a[j+3,k];a[j+3,k]:=y;end;
    j:=j-3;
   end;
   i:=i+3;
  end;
 end;
 writeln('Массив А после упорядочивания');
 for j:=1 to n do begin
  for i:=1 to n do write(a[j,i]:7:3);
  writeln;
 end;
 y:=1;i:=1;
 while i<=n-1 do begin
  max:=a[i,1];
  for k:=1 to n do if a[i,n-k+1]>max then max:=a[i,n-k+1];
  y:=y*max;
  i:=i+2;
 end;
 q:=1;i:=1;
 while i<=n do begin
  q:=q*f(i)/exp(i);
  i:=i+2;
 end;
 y:=y+q;writeln('Значение Y=',y:1:2);
 readln;
end.

Результаты вычислений-

Введите размер массива (не больше 30)-5
Массив А
  0.459  0.284  0.212  0.164  0.126
  1.540  1.378  1.363  1.071  0.845
  2.044  1.833  1.837  1.842  1.799
  2.372  2.176  2.231  2.296  2.310
  2.469  2.360  2.503  2.656  2.755
Вектор Х
  1.040  1.146  1.243  1.298  1.533
Z=
 146.61 134.51 137.80 138.06 136.45
Массив А после упорядочивания
  0.459  0.284  0.212  0.164  0.126
  1.540  1.378  1.363  1.071  0.845
  2.044  1.833  1.837  1.842  1.799
  2.372  2.176  2.231  2.296  2.310
  2.469  2.360  2.503  2.656  2.755
Значение Y=1.03
