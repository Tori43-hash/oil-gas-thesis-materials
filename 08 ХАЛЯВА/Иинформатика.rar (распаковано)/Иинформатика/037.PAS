program v037;
 uses crt;
 var e,a:array[1..50,1..50] of real;
     z,w,x:array[1..50] of real;
     i,j,n,k:integer;
     y,s:real;
 function step(a,b:real):real;
  begin
   if (a<0) then
    if round(b) mod 2=0 then step:=exp(b*ln(abs(a))) else step:=-exp(b*ln(abs(a)))
    else step:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;write('Введите размер массива-');readln(n);
 writeln('Заданный массив');
 for i:=1 to n do begin
  for j:=1 to n do begin
   a[i,j]:=(sin(pi*(i*j+0.5)))*arctan(step((i+j),1/3))/(i*step(exp(i/j),1/j));
   write(a[i,j]:7:3);
  end;
  writeln;
 end;
 writeln('Заданный вектор');
 for i:=1 to n do begin
  x[i]:=0;
  j:=2;while j<=n do begin
   x[i]:=x[i]+a[j,n-i+1];
   j:=j+2;
  end;
  write(x[i]:7:3);
 end;
 writeln;writeln('Z-');
 for j:=1 to n do
  for i:=1 to n do if i=j then e[j,i]:=a[j,i]-1 else e[j,i]:=a[j,i];
 for j:=1 to n do
  for i:=1 to n do w[j]:=w[j]+a[n-i+1,i]*e[i,j];
 y:=0;for i:=1 to n do y:=y+a[n-i+1,i]*a[n-i+1,i];
 for i:=1 to n do begin
  z[i]:=w[i]*y;
  write(z[i]:7:3);
 end;
 j:=1;while j<=n do begin
  i:=n;while i>=j do begin
   if a[n,i]>a[n,i+2] then
    begin s:=a[n,i];a[n,i]:=a[n,i+2];a[n,i+2]:=s;end;
   i:=i-2;
  end;
  j:=j+2;
 end;
 writeln;writeln('Упорядоченный массив');
 for i:=1 to n do begin
  for j:=1 to n do write(a[i,j]:7:3);writeln;end;
 y:=0;for i:=n downto 2 do begin
  s:=0;for k:=0 to n-1 do s:=s+a[i,n-k];
  y:=y+s;
 end;
 i:=1;s:=1;while i<=n do begin
  if a[i,i]<>0 then s:=s*ln(i)/(ln(10)*a[i,i]);
  i:=i+2;
 end;
 y:=y+s;writeln('Значение Y=',y:2:2);
 readln;
end.

Полученные результаты:

Введите размер массива-5           
Заданный массив                    
 -0.331  0.751 -0.903  0.979 -1.026
  0.065  0.306  0.417  0.471  0.503
 -0.017  0.164 -0.255  0.301 -0.327
  0.005  0.098  0.175  0.216  0.239
 -0.001  0.062 -0.127  0.164 -0.186
Заданный вектор                    
  0.742  0.687  0.592  0.404  0.070
Z-                                 
  0.022 -0.174  0.775 -0.769  1.974
Упорядоченный массив               
 -0.331  0.751 -0.903  0.979 -1.026
  0.065  0.306  0.417  0.471  0.503
 -0.017  0.164 -0.255  0.301 -0.327
  0.005  0.098  0.175  0.216  0.239
 -0.186  0.062 -0.127  0.164 -0.001
Значение Y=2.27                    
