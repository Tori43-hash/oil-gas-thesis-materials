program v330;
 uses crt;
 var a,a2:array[1..10,1..10] of real;
     z,x:array[1..10] of real;
     i,j,n,k:integer;
     y,m,max:real;
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
begin
 clrscr;
 n:=6;
 writeln('Матрица А');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=s(-1,sqr(i)-sqr(j))*j*sin(f(i))/(i*s(exp(i/j),1/j));
   write(a[i,j]:8:4);
  end;
  writeln;
 end;
 writeln('Вектор Х');
 for i:=1 to n do begin
  x[i]:=0;j:=2;k:=0;
  repeat
  x[i]:=x[i]+a[i,j];
  k:=k+1;
  j:=j+2;
  until j>n;
  x[i]:=x[i]/k;
  write(x[i]:8:4);
 end;
 writeln;writeln('Z');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do a2[i,j]:=a2[i,j]+a[i,k]*a[k,j];
 for i:=1 to n do
  for j:=1 to n do z[i]:=z[i]+a[j,n-j+1]*a2[j,i];
 m:=0;
 for i:=1 to n do m:=m+sqr(x[i]);
 for i:=1 to n do z[i]:=z[i]*(m+1);
 for i:=1 to n do write(z[i]:8:3);
 writeln;writeln('Упорядоченный массив');
 i:=1;
 repeat
  j:=i;
  repeat
   if abs(1/a[2,j])<abs(1/a[2,j+2]) then begin
    y:=a[2,j];a[2,j]:=a[2,j+2];a[2,j+2]:=y;end;
   j:=j+2;
  until j>n-2;
  i:=i+2;
 until i>n-2;
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:8:4);
  writeln;
 end;
 max:=0;
 for k:=0 to n-1 do max:=max+a[2,n-k];
 i:=4;
 repeat
  m:=0;
  for k:=0 to n-1 do m:=m+a[i,n-k];
  if m>max then max:=m;
  i:=i+2;
 until i>n;
 y:=x[1];
 for i:=2 to n do
  if x[i]>y then y:=x[i];
 y:=y+max;
 writeln('Значение Y=',y:1:3);
 readln;
end.


Результаты работы программы-

Матрица А
  0.3096 -1.3107  2.2589 -3.1620  4.0424 -4.9105
 -0.0615  0.5515 -1.0922  1.6049 -2.0985  2.5805
 -0.0046  0.0880 -0.2002  0.3089 -0.4130  0.5141
  0.0041 -0.1666  0.4355 -0.7053  0.9646 -1.2155
  0.0008 -0.0665  0.1999 -0.3398  0.4754 -0.6064
  0.0002 -0.0405  0.1397 -0.2493  0.3567 -0.4605
Вектор Х
 -3.1277  1.5790  0.3037 -0.6958 -0.3376 -0.2501
Z
 -9.407  31.150 -33.390  31.708 -30.119  29.157
Упорядоченный массив
  0.3096 -1.3107  2.2589 -3.1620  4.0424 -4.9105
 -0.0615  0.5515 -1.0922  1.6049 -2.0985  2.5805
 -0.0046  0.0880 -0.2002  0.3089 -0.4130  0.5141
  0.0041 -0.1666  0.4355 -0.7053  0.9646 -1.2155
  0.0008 -0.0665  0.1999 -0.3398  0.4754 -0.6064
  0.0002 -0.0405  0.1397 -0.2493  0.3567 -0.4605
Значение Y=3.064
