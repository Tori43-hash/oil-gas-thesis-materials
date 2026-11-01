program vI049;
 uses crt;
 var c,max,s,a,b,j,i,n:integer;
     r:array[1..30] of integer;
begin
 randomize;
 clrscr;
 a:=-10;b:=10;n:=30;
 writeln('Массив R полученный случайным образом в интервале (-10,10)');
 for i:=1 to n do begin
  r[i]:=round((b-a+1)*random(100)/100+a);
  write(r[i]:4);
 end;
 i:=8;s:=0;
 while i<=15 do begin
  s:=s+r[i];
  i:=i+2;
 end;
 writeln;writeln('Сумма четных по номеру элементов второй четверти вектора=',s);
 i:=1;while (r[i]<a/2) or (r[i]>b/2) do i:=i+1;
 max:=r[i];
 for j:=i+1 to n do
  if (r[j]>=a/2) and (r[j]<=b/2) then
   if r[j]>max then begin
    max:=r[j];i:=j;
   end;
 writeln('Максимум среди принадлежащих [a/2,b/2] элементов всего вектора ',i,'-ый элемент=',max);
 i:=8;
 repeat
  j:=12;
  repeat
   if abs(1/r[j])<abs(1/r[j+2]) then
    begin
     s:=r[j];r[j]:=r[j+2];r[j+2]:=s;
    end;
   j:=j-2;
  until j<i;
  i:=i+2;
 until i>14;
 writeln('Упорядоченный массив R');
 for i:=1 to n do write(r[i]:4);
 readln;
end.

Результаты:

Массив R полученный случайным образом в интервале (-10,10)
  -1  -9  -8   6   8  -5   0  -7  -4  -1   3  -6  -7  -9   7   9  -9  -3  -3  -6
   3  -4   9   1  -8   0   5   7   3   0                                        
Сумма четных по номеру элементов второй четверти вектора=-23                    
Максимум среди принадлежащих [a/2,b/2] элементов всего вектора 27-ый элемент=5  
Упорядоченный массив R                                                          
  -1  -9  -8   6   8  -5   0  -1  -4  -6   3  -7  -7  -9   7   9  -9  -3  -3  -6
   3  -4   9   1  -8   0   5   7   3   0                                        