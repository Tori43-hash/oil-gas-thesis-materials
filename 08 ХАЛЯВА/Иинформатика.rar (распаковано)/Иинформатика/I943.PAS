program vI943;
 uses crt;
 var j,e,c,m,a,b,i,n:integer;
 r:array[1..39] of integer;
 p:real;
begin
 randomize;
 clrscr;
 a:=-7;b:=8;n:=39;
 writeln('Часть 1. Массив R-');
 for i:=1 to n do begin
  r[i]:=round((b-a+1)*random(100)/100+a);
  write(r[i]:4);
 end;
 i:=20;p:=1;e:=0;
 while i<=30 do begin
  if r[i]<>0 then begin
   p:=p*r[i];
   e:=e+1;
  end;
  i:=i+2;
 end;
 if e<>0 then if p>0 then p:=exp((1/e)*ln(p))
   else if e mod 2=0 then p:=exp((1/e)*ln(abs(p))) else p:=-exp((1/e)*ln(abs(p)))
  else p:=0;
 writeln;writeln('Часть 2. Среднегеометрическое значение=',p:4:4);
 write('Введите число-');
 readln(c);
 j:=20;
 while (r[j]<a/2) or (r[j]>b/2) and (j<39) do j:=j+1;
 m:=r[j];e:=abs(abs(r[j])-abs(c));
 for i:=j+1 to 39 do
  if (r[i]>=a/2) and (r[i]<=b/2) and (abs(abs(r[i])-abs(c))<e) then
   begin
    m:=r[i];j:=i;
    e:=abs(abs(r[i])-abs(c));
   end;
 writeln('Часть 3. Число самое близкое к числу ',c,' среди принадлежащих отрезку [a/2,b/2]');
 writeln('второй половины вектора R это ',j,'-ый элемент ',m);
 writeln('Часть 4. Упорядоченный вектор');
 i:=10;
 repeat
  if r[i]>0 then begin
   j:=20;
   repeat
    if (r[j]>0) and (sqr(r[i])<sqr(r[j])) then
     begin
      e:=r[i];r[i]:=r[j];r[j]:=e;
     end;
    j:=j-1;
   until j<i;
  end;
  i:=i+1;
 until i>20;
 for i:=1 to n do write(r[i]:4);
 readln;
end.

Результаты:

Часть 1. Массив R-
  -4  -4   5   1   3   3  -6  -5  -3  -4   9   1   1  -6   2  -2   0  -4  -5   6
  -3  -3  -3   8   4  -7   3   5   6   3  -1   0  -5   4  -1  -3   5  -4   0    
Часть 2. Среднегеометрическое значение=4.9727                                   
Введите число-6                                                                 
Часть 3. Число самое близкое к числу 6 среди принадлежащих отрезку [a/2,b/2]    
второй половины вектора R это 25-ый элемент 4                                   
Часть 4. Упорядоченный вектор                                                   
  -4  -4   5   1   3   3  -6  -5  -3  -4   9   6   2  -6   1  -2   0  -4  -5   1
  -3  -3  -3   8   4  -7   3   5   6   3  -1   0  -5   4  -1  -3   5  -4   0    