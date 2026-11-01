program d2;
 uses crt;
 var
  hc,Ps,ro,h,hvc,hvd,dV,V,ht,Q,Re1,Re2,Re,ld,nu,d,L,eps,ke,z:real;
  n,i:integer;u:char;
  k:array[0..10] of real;
  hm:array[0..10] of real;
 const
  Pa=100000;g=9.81;Reg=2320;
{функция возведения в степень}
 function s(a,b:real):real;
  begin
   if (a<0) then if round(b) mod 2=0 then s:=exp(b*ln(abs(a)))
                                     else s:=-exp(b*ln(abs(a)))
            else s:=exp(b*ln(abs(a)))
  end;
begin
 clrscr;textcolor(15);
 {ввод начальных данных}
 writeln('Все данные вводить в системе СИ');
 write('Введите расход-');readln(Q);
 write('Введите длину трубопровода-');readln(L);
 write('Введите действующий напор-');readln(z);
 write('Введите кинематическую вязкость-');readln(nu);
 write('Введите эквивалентную шероховатость-');readln(ke);
 write('Введите требуемую точность-');readln(eps);
 write('Введите количество местных сопротивлений-');readln(n);
 for i:=1 to n do begin
  write('Введите коэффициент ',i,'-го местного сопротивления-');readln(k[i]);
 end;
 write('Требуется ли проверять условие кавитации Y/N ');readln(u);
 if (u='y') or (u='Y')then begin
  write('Введите давление насыщенных паров-');readln(Ps);
  write('Введите плотность жидкости-');readln(ro);
  write('Введите высоту точки С-');readln(hc);
 end;
 clrscr;V:=eps;dV:=sqr(eps);
 while abs(z-h)>eps do begin
  h:=0;d:=sqrt(4*Q/(pi*V));
  Re:=4*Q/(pi*d*nu);
  Re1:=10*d/ke;
  Re2:=500*d/ke;
{определение зоны трения и коэффициениа Дарси}
{ламинарная зона}
  if Re<=Reg then ld:=Re/64;
{зона гладких труб}
  if (Re>Reg) and (Re<=Re1) then ld:=0.3164/s(Re,0.25);
{зона смешанного трения}
  if (Re>Re1) and (Re<=Re2) then ld:=011*s((ke/d+68/Re),0.25);
{зона шероховатых труб}
  if Re>Re2 then ld:=0.11*s(ke/d,0.25);
{определение потерь по длине}
  ht:=ld*L*sqr(V)/(2*d*g);
  h:=ht;
{определение местных потерь}
  for i:=1 to n do begin
   hm[i]:=k[i]*sqr(V)/(2*g);
   h:=h+hm[i];
  end;
  gotoxy(1,1);writeln('Искомый диаметр-',d:6:5,' м  ');
  writeln('При скорости-',V:2:4,' м/с');
  writeln('коэф. Дарси-',ld:2:3,' Re-',Re:2:3);
  textcolor(21);gotoxy(27,6);write('Подождите идет расчет!!!');
  textcolor(15);
  V:=V+dV;
 end;
 textcolor(5);gotoxy(27,6);writeln('     Расчет окончен     ');
{вывод результатов}
 textcolor(15);write('Местные потери-');
 for i:=1 to n do write(hm[i]:2:3,' м ');
 writeln(#13#10,'Потери по длине-',ht:2:4,' м');
 if (u='Y') or (u='y') then begin
{проверка условия кавитации}
  hvc:=hc+hm[i]+hm[2]+hm[3]+ht+sqr(V)/(2*g);
  hvd:=(Pa-Ps)/(ro*g);
  if hvc<=hvd then writeln('Сифон работает нормально')
              else writeln('Сифон работает ненормально');
 end;
 readln;
end.












