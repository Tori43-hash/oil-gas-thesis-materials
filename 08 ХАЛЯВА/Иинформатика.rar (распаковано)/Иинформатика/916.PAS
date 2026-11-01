program v916;
 uses crt;
 var a,at:array[1..15,1..15] of real;
     w,x:array[1..15] of real;
     l,i,j,n,k:integer;
     m,z,y,max:real;
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
  k:=1;for l:=1 to d do k:=k*l;f:=k;end;
begin
 clrscr;write('Введите размер массива (не больше 15)-');readln(n);
 writeln('Заданный массив');
 for j:=1 to n do begin
  for i:=1 to n do begin
   a[j,i]:=s(-1,i+j)*s(f(j),1/i)/(3*ln(i*j+3/i)/ln(3));
   write(a[j,i]:7:3);
  end;writeln;end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  k:=1;while a[n-i+1,k]>=0 do k:=k+1;x[i]:=a[n-i+1,k];
  for j:=k+1 to n do
   if a[n-i+1,j]<0 then
    if a[n-i+1,j]<x[i] then x[i]:=a[n-i+1,j];
  write(x[i]:7:3);
 end;
 writeln;write('Z=');
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to n do at[i,j]:=at[i,j]+a[k,j]*a[j,k];
 for i:=1 to n do
  for j:=1 to n do w[i]:=w[i]+a[n-i+1,n-i+1]*at[j,i];
 for i:=1 to n do z:=z+w[i]*a[n-i+1,n-i+1];
 writeln(z:2:3);
 for i:=1 to n do
  if a[i,i]<0 then
   for j:=1 to n do
    if a[j,n-j+1]<0 then
     if a[j,j]>a[i,i] then begin
      y:=a[j,j];a[j,j]:=a[i,i];a[i,i]:=y;
     end;
 writeln('Упорядоченный массив');
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:7:3);
 writeln;end;
 max:=1;
 if a[1,1]<0 then max:=max*a[1,1];
 for i:=2 to n do begin
  m:=1;
  for k:=i downto 1 do
   if a[k,i]<0 then m:=m*a[k,i];
  if m>max then max:=m;
 end;
 m:=abs(x[1]);i:=3;
 while i<=n do begin
  if s(abs(x[i]),1/i)<m then m:=s(abs(x[i]),1/i);
  i:=i+2;
 end;
 y:=max+m;
 writeln('Значение Y=',y:1:3);readln;end.

Полученные результаты

Введите размер массива (не больше 15)-5
Заданный массив                        
  0.264 -0.292  0.264 -0.235  0.213    
 -0.455  0.304 -0.237  0.201 -0.178    
  1.226 -0.445  0.289 -0.225  0.191    
 -4.517  0.797 -0.412  0.288 -0.229    
 21.133 -1.643  0.651 -0.400  0.294    
Заданный вектор                        
 -1.643 -4.517 -0.445 -0.455 -0.292    
Z=5.722                                
Упорядоченный массив                   
  0.264 -0.292  0.264 -0.235  0.213    
 -0.455  0.304 -0.237  0.201 -0.178    
  1.226 -0.445  0.289 -0.225  0.191    
 -4.517  0.797 -0.412  0.288 -0.229    
 21.133 -1.643  0.651 -0.400  0.294    
Значение Y=1.764                       