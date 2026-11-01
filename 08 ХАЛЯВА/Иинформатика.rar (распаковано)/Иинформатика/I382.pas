program vI382;
 uses crt;
 var j,c,m,a,b,e,i,n:integer;
     x:array[1..33] of integer;
     s:real;
begin
 randomize;
 clrscr;
 a:=-7;b:=9;n:=33;
 writeln('Сгенерированный массив R в промежутке от -7 до 9');
 for i:=1 to n do begin
  x[i]:=round((b-a+1)*random(100)/100+a);
  write(x[i]:4);
 end;
 i:=11;s:=0;
 while i<=22 do begin
  s:=s+sqr(x[i]);
  i:=i+3;
 end;
 s:=sqrt(s/11);
 writeln;writeln('Среднеквадратичное значение каждых третьих элементов второй трети вектора=',s:3:3);
 write('Введите число-');
 readln(c);j:=1;
 while x[j] mod 2=0 do j:=j+1;
 e:=abs(x[j]-c);m:=x[j];
 for i:=j+1 to round(n/2) do
  if (x[i] mod 2=0) and (abs(x[i]-c)<e) then begin
   e:=abs(x[i]-c);
   m:=x[i];
   j:=i;
  end;
 writeln('Четный по значению из 1-ой половины массива самый близкий к ',c,' ',j,'-ый элемент=',m);
 for i:=1 to 16 do
  if x[i] mod 2<>0 then
   for j:=16 downto i do
    if x[j] mod 2<>0 then
     if 1/x[i]>1/x[j] then begin
      m:=x[i];x[i]:=x[j];x[j]:=m;
     end;
 writeln('Упорядоченный массив R');
 for i:=1 to n do write(x[i]:4);
 readln;
end.

Результаты:

Сгенерированный массив R в промежутке от -7 до 9
   7   0  -5   4  -7   7  -2  -2   2  -2   6  -7  -2  -3   8   5   8   0  -1   6
   9   0  -3   0   3  -5   5   9   4   9   4   8  -4                            
Среднеквадратичное значение каждых третьих элементов второй трети вектора=3.631 
Введите число-5                                                                 
Четный по значению из 1-ой половины массива самый близкий к 5 4-ый элемент=4    
Упорядоченный массив R                                                          
  -3   0  -5   4  -7  -7  -2  -2   2  -2   6   7  -2   7   8   5   8   0  -1   6
   9   0  -3   0   3  -5   5   9   4   9   4   8  -4                            
