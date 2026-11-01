program v855;
 uses crt;
 var a,at:array[1..20,1..20] of real;
     z,w,x:array[1..20] of real;
     i,j,n,k:integer;
     y,q,p:real;
 {функция максимума}
 function max(a,b,c:real):real;
 begin
  if a>=b then
   if a>=c then max:=a else
   else if b>=c then max:=b else max:=c;
 end;
 {функция факториал}
 function f(d:integer):integer;
 begin
  k:=1;for j:=1 to d do k:=k*j;f:=k;end;
 {функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then s:=exp(b*ln(abs(a))) else s:=-exp(b*ln(abs(a)))
    else s:=exp(b*ln(abs(a)))
  end;
 procedure matr;
  begin
   a[i,j]:=arctan(sin(pi*(j+0.5)))*max(4,i/j,j)/(pi*(i/j+sqr(i)+3));
   write(a[i,j]:6:2);end;
 procedure vect;
  begin
   x[i]:=1;for j:=i+1 to n do x[i]:=x[i]*a[j,i];
   write(x[i]:11:7);end;
begin
 clrscr;
 write('Введите размер массива (не больше 20)-');
 readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do matr;writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do vect;
 writeln;writeln('Z');
 for i:=1 to n do q:=q+a[i,i]*a[i,n-i+1];
 for j:=1 to n do
  for i:=1 to n do
   for k:=1 to n do at[i,j]:=at[i,j]+a[i,j]*a[i,k];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+at[j,i]*x[n-i+1];
 for i:=1 to n do z[i]:=w[i]*q;
 for i:=1 to n do write(z[i]:11:7);
 writeln;
 for j:=1 to n do
  for i:=1 to n do at[j,i]:=a[i,j];
 for k:=1 to n do
  for i:=1 to n do
   if (at[k,i]<=-1) and (at[k,i]>=0) then
    for j:=1 to n-i do
     if (at[k,j]<=-1) and (at[k,j]>=0) then
      if abs(at[k,i])>abs(at[k,j]) then begin
     y:=at[k,i];at[k,i]:=at[k,j];at[k,j]:=y;end;
 writeln('Упорядоченная матрица');
 for j:=1 to n do begin
  for i:=1 to n do begin
   write(at[j,i]:6:2);
  end;writeln;end;
 i:=2;while i<=n do begin
  p:=1;for k:=1 to n do
    if a[i,k]>0 then p:=p*sqrt(a[i,k]);
 y:=y+p;i:=i+2;end;
 p:=0;for i:=1 to n do
  if x[i]>2 then p:=p+s(x[i],i)/f(i);
 y:=y+p;
 writeln('Значение Y=',y);readln;end.

Полученные результаты

Введите размер массива (не больше 20)-6
Заданный массив                                                    
 -0.20  0.22 -0.23  0.24 -0.00  0.00                               
 -0.11  0.13 -0.13  0.13 -0.00  0.00                               
 -0.07  0.07 -0.08  0.08 -0.00  0.00                               
 -0.04  0.05 -0.05  0.05 -0.00  0.00                               
 -0.04  0.03 -0.03  0.03 -0.00  0.00                               
 -0.03  0.02 -0.02  0.02 -0.00  0.00                               
Заданный вектор                                                    
 -0.0000004  0.0000028 -0.0000404  0.0008441 -0.0000000  1.0000000 
Z                                                                  
  0.0000455  0.0000159  0.0000051  0.0000018 -0.0000015 -0.0000026 
Упорядоченная матрица                                              
 -0.20 -0.11 -0.07 -0.04 -0.04 -0.03                               
  0.22  0.13  0.07  0.05  0.03  0.02                               
 -0.23 -0.13 -0.08 -0.05 -0.03 -0.02                               
  0.24  0.13  0.08  0.05  0.03  0.02                               
 -0.00 -0.00 -0.00 -0.00 -0.00 -0.00                               
  0.00  0.00  0.00  0.00  0.00  0.00                               
Значение Y= 5.01388165102126E-0017                                 
                                                                   
