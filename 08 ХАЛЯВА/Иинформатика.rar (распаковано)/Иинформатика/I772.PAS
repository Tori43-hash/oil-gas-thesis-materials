program vI772;
 uses crt;
 var k1,k2,j,m1,m2,a,b,e,i,n:integer;
     w:array[1..37] of integer;
     s:real;
begin
 randomize;
 clrscr;
 a:=-7;b:=9;n:=37;
 writeln('Сгенерированный массив W в промежутке от -7 до 9');
 for i:=1 to n do begin
  w[i]:=round((b-a+1)*random(100)/100+a);
  write(w[i]:4);
 end;
 s:=0;e:=0;
 for i:=12 to 24 do
  if w[i] mod 2<>0 then begin
   s:=s+sqr(w[i]);
   e:=e+1;
  end;
 if e<>0 then s:=sqrt(s/e) else s:=0;
 writeln;writeln('Среднеквадратичное значение нечетных по значению элементов второй трети вектора=',s:3:3);
 if w[1]<w[2] then begin
    m1:=w[1];k1:=1;m2:=w[2];k2:=2;
   end
  else
   m1:=w[2];k1:=2;m2:=w[1];k2:=1;
 for i:=3 to round(n/2) do begin
  if (w[i]<m2) and (w[i]>m1) then begin
   m2:=w[i];
   k2:=i;
  end;
  if w[i]<m1 then begin
   m2:=m1;
   m1:=w[i];
   k2:=k1;
   k1:=i;
  end;
 end;
 writeln('Два наименьших элемента среди ненулевых элементов первой половины вектора');
 writeln(k1,'-ый элемент=',m1,' ',k2,'-ый элемент=',m2);
 i:=2;
 repeat
  j:=8;
  repeat
   if 1/w[j]>1/w[j+2] then begin
      e:=w[j];w[j]:=w[j+2];w[j+2]:=e;
     end;
   j:=j-2;
  until j<i;
  i:=i+2;
 until i>10;
 writeln('Упорядоченный вектор W');
 for i:=1 to n do write(w[i]:4);
 readln;
end.

Результаты:

Сгенерированный массив W в промежутке от -7 до 9
   5   6   9   7  -3   6   7   8  -2   2  -4   7   5  -2   7   6   6   0   8  -3
   8   6  -1   8   1  -2  -3   1  -5   1  -3   2   1   7  -2   4   9            
Среднеквадратичное значение нечетных по значению элементов второй трети вектора=
5.158                                                                           
Два наименьших элемента среди ненулевых элементов первой половины вектора       
11-ый элемент=-4 5-ый элемент=-3                                                
Упорядоченный вектор W                                                          
   5   8   9   7  -3   6   7   6  -2   2  -4   7   5  -2   7   6   6   0   8  -3
   8   6  -1   8   1  -2  -3   1  -5   1  -3   2   1   7  -2   4   9            