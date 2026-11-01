program vI013;
 uses crt;
 var max,s,a,b,j,i,n:integer;
     f:array[1..30] of integer;
begin
 randomize;
 clrscr;
 a:=-7;b:=8;n:=30;
 writeln('Массив F полученный случайным образом в интервале (-7,8)');
 for i:=1 to n do begin
  f[i]:=round((b-a+1)*random(100)/100+a);
  write(f[i]:4);
 end;
 i:=15;s:=0;
 while i<=23 do begin
  if f[i]>0 then s:=s+f[i];
  i:=i+1;
 end;
 writeln;writeln('Сумма положительных элементов третьей четверти вектора=',s);
 max:=f[15];i:=15;
 j:=17;
 repeat
  if f[j]>max then
   begin
    max:=f[j];
    i:=j;
   end;
  j:=j+2;
 until j>n;
 writeln('Максимум среди нечетных по номеру второй половины вектора ',i,'-ый элемент=',max);
 i:=22;
 repeat
  j:=28;
  repeat
   if sqr(f[j])<sqr(f[j+2]) then
    begin
     s:=f[j];f[j]:=f[j+2];f[j+2]:=s;
    end;
   j:=j-2;
  until j<i;
  i:=i+2;
 until i>30;
 writeln('Упорядоченный массив F');
 for i:=1 to n do write(f[i]:4);
 readln;
end.

Результаты:

Массив F полученный случайным образом в интервале (-7,8)
  -4   8  -2   5   8   1   4   5   5   7  -4   2   0   7  -3   0   0   4  -1  -5
  -2  -4   0  -2  -7   5   3   3  -3  -6                                        
Сумма положительных элементов третьей четверти вектора=4                        
Максимум среди нечетных по номеру второй половины вектора 27-ый элемент=3       
Упорядоченный массив F                                                          
  -4   8  -2   5   8   1   4   5   5   7  -4   2   0   7  -3   0   0   4  -1  -5
  -2  -6   0   5  -7  -4   3   3  -3  -2                                        