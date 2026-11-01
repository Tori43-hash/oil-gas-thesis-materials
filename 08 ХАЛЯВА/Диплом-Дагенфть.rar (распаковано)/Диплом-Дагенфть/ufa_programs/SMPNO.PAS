   program fgh;
   uses crt,graph3,printer;
   label 1,2,3,4,100;
   const ns=500;way='d:\';
   type dim=array[1..ns] of real;
        dim1=array[1..16] of real;
;       dim2=array[1..16] of integer;
        line=string;
   var x,y,y1,qt,qx,tt:dim;
       dis,qni,cc:dim1;
       nom:dim2;
       ff1:file of real;
       bn,bk,boil,a,b,r,t,xb,yb,xm,ym,h0,qn,qp,qv,ga,kga,qxy:real;
       ng,yer,mn,begyr,begmn,begyr0,begmn0,m,iv,n0y,nbr,j,n,i,l,k,key,nqu,12,ior:integer;
       s,st,name,name1,name3,name4,l1:line;
       aa,dd:string[16];ch:char;
       c:array[1..15] of string[16];
       bb:[1..7] of byte;
       dat:array[1..12] of string[4];
       naz:array[1..16] of string[50];
       ll:text;

   procedure dan1(var y1:dim;var n:integer;var name:line);
   label 1,2;
   var i:integer;
   begin
   {$I-}
   goto 2;
   1:write('введите имя файла');readln(name);name:=way+name;
   2:assign(ff1,name);reset(ff1);
   for i:=1 to n do begin read(ff1,y1[i]);
   if I0result<>0 then begin
    writeln('Внимание!Данных менньше ',n,'.Кол-во точек изменено :n=', i-1);
    n:=i-1;close(ff1);
    {$I+} exit end;
   end;
   {$I+}
   close(ff1)
   end;

   function ext(x,y:real):real;
   begin ext:=exp(ln(x)*y);
   end;

   procedure mdat;
   begin
   dat[1]:='   I';dat[2]:='  II';dat[3]:=' III';
   dat[4]:='  IV';dat[5]:='   V';dat[6]:='  VI';
   dat[7]:=' VII';dat[8]:='VIII';dat[9]:='  IX';
   dat[10]:='  X';dat[11]:=' XI';dat[12]:='XII';
   naz[1]:='Metod cambarova Qn=A/Qg+B';naz[2]:='Metod pirverdyana Qn=(A/(Qg)*1/2)+B';
   naz[3]:='Metod Sazonova Qn=A*LnQg+B';naz[4]:='Metod Maximova Qn=LnQv+B';
   naz[5]:='Metod Nazarova ,Sipacheva Qg/Qn=A*Qv+B';
   naz[6]:='Metod Cherepahina,Movmgy Qn=(A*(qn/qv))+B';
   naz[7]:='Metod Garba,Zimmermana Qn=A*Ln(qv/qn)';naz[8]:='Metod  LnQg=A*LnQg+B';
   naz[9]:='Metod BashNIPI Qg/Qn=A*Qg+B';naz[10]:='Metod Tkachenko Qn/Qg=A*Qg+B';
   naz[11]:='Metod Permyakova';naz[12]:='Metod Leybenzona';
   naz[13]:='Metod     ';naz[14]:='Metod Coptova Qn=A/t+B';
   naz[15]:='Metod Cazacova';naz[16]:='Metod phran.instituta';
   end;

   procedure month(by,bm,j:integer;var jyt,jmt:integer);
   begin jmt:=j+bm-1;jyt:=by+(jmt-1) div 12;
   jmt:=(jmt-1) mod 12+1;end;

   function lchr(n:integer;a:string):string;
   var i:integer;l:string;
   begin
   l:='';for i:=1 to n do l:=l+a;lchr:=l;
   end;

   procedure font;
   var m,j:integer;
   begin
   hires;
   j:=0;m:=0;
   for i:=48 to 57 do begin
   write(chr(i));m:=m+1;
   getpic(c[m],j,0,7+j,7);j:=j+8;
   end;
   write(chr(32));getpic(c[11],j,0,j+7,7);j:=j+8;

   write(chr(101));getpic(c[12],j,0,j+7,7);j:=j+8;
   write(chr(45));getpic(c[13],j,0,j+7,7);j:=j+8;
   write(chr(43));getpic(c[14],j,0,j+7,7);j:=j+8;
   clearscreen;
   end;

   procedure fout(r:real;nx,ny,flag:integer);
   const mp='0123456789 E-+.,*';
   var i1,i2:byte;
    begin
    case flag of
    1:begin i1:=1;i2:=5;str(r:5:2,s)end;
    2:begin i1:=14;i2:=17;str(r,s)end;
    end;
   j:=0;
   for k:=i1 to i2 do begin
   st:=copy(s,k,1);m:=pos(st,mp);
   j:=j+8;end;
   end;

   procedure graf(nqu,l,k:integer;var x,y,y1:dim);
   label 1
   var i,lt,x0,y0,w,h,ix,iy,dx,dy,iy1,ix1:integer;
       s:string;
   begin
   yb:=y[l];ym:=y[l];xb:=x[l];xm:=x[l];
     for i:=l+1 to k do
       begin
       if xb<x[i] then xb:=x[i];
       if yb<y[i] then yb:=y[i];
       if xm>x[i] then xm:=x[i];
       if ym>y[i] then ym:=y[i];
       end;
   str(xb,st);st:='1'+copy(st,14,4);val(st,xnr,i);
   str(yb,st);st:='1'+copy(st,14,4);val(st,ynr,i);
   hires;
   graphwindow(x0,y0,w,h);
   xs:=(xb-xm)/(w-x0);ys:=(yb-ym)/(h-y0);
   dy:=round((h-y0)/5);dx:=round((w-x0)/5);
   fout(ynr,10,10,2);
   for i:=1 to k do begin
     ix:=round((x[i]-xm)/xs);iy:=h-round((y[i]-ym)/ys)-y0;
     draw(ix-1,iy,ix+1,iy,1);draw(ix,iy-1,ix,iy+1,1);
   end;
   writeln(ll,'!  ',i,' !  ',dat[n],' !',qn/boil:7:2,' !',qv:6:2,' !',qt[j]/boil:7:2,' !',qx[j]:8:2,' !');end;
   writeln(ll,lchr(53,'-'));
   ciose(ll);
   end;

   procedure rang(i1,i2:integer;xi:dim1;var nom:dim2);
   label 1;
   var t:real;l,j1,j2:integer;
   begin if (i2-i1+1)<=1  then goto 1;
   for j1:=i1 to i2-1 do
     for j2:=i1 to i2-1 do
   end;
   1:end;

   procedure sqrm(l,n:integer;x,y:dim;var a,b,r:real);
   var sx,sy,m,sx2,sxy,sy2:real;
   begin
   m:=n-l+1;
   sx:=0;sy:=0;sx2:=0;sxy:=0;sy:0;sy2:=0;
   for j:=l to n do begin
     sx:=sx+x[j];sy:=sy+y[j];sx2:=sx2+sqr(x[j]);sy2:=sy2+sqr(y[j]);
   end;
   a:=(m*sxy-sy*sx)/(m*sx2-sx*sx);b:=(sy-a*sx)/m;
   r:=(sxy-sx*sy/m)/sqrt((sx2-sx*sx/m)*(sy2-sy*sy/m));
   end;

   function divhqn(A,B:real):real;
   label 1;
   var eps,x1,x2,x3,f1,f3:real;

   function f(x:real):real;
   begin
   { writeln(' Ч  func f  :x= ',x,'  (qx[j]-qx[j-1]-x+qni[iv])= ',(qx[j]-qx[j-1]-x+qni[iv]),'(x-qni[iv])= ',(x-qni[iv]));}
   case if of
   4:f:=b+a*ln(qx[j]-x)-x;
   7:f:=x-a*(ln(qx[j]-qx[j-1]-x+qni[iv])-ln(x-qni[iv]))-b;
   11:f:=a*(-ln(qx[j]-qx[j-1]-x+qni[iv])+ln(x-qni[iv]))+b-x;
   16:f:=qx[j]-x-x*a*exp(cc[iv]*x-b*x;
   end;
   end; { func f }

   begin { func divhqn }
   eps:=0.001;
   x1:=qni[iv]+0.0001;x2:=qx[j]-qx[j-1]+qni[iv]-0.0001;
   if (f(x1)*f(x2)>0)then begin writeln(' Корень по одну сторону от оси: ');halt end;
   1:x3:=(x1+x2)/2;i:=i+1;
   f1:=f(x1);f3:=f(x3);
   end;

   procedure squa(a1,b1:real;var xx:real);
   var d1,s1,s2:real;
   begin
   d1:=sqr(a1)-4*b1;
   if d1<0 then begin writeln(' В proc squa нет корней');halt end;
   s1:=(-al-sqrt(d1))/2;s2:=(-al+sqrt(d1))/2;
   if (((qni[iv]<=s1)and(s1<=qx[j]-qx[j-1]+qni[iv]))and
      ((qni[iv]<=s2) and (s2<=qx[j]-qx[j-1]+qni[iv]))) then begin writeln(' 2 корня');half end;
   end;

   procedure sel(j:integer;a,b:real;var xx:real);
   begin
      case iv of
      1:xx:=a/qx[j]+b;
      2:xx:=a/sqrt(qx[j])+b;
      3:xx:=a*ln(qx[j])+b;
      4,7,11,16:begin xx:=divhgn(a,b);qni[iv]:=xx end;
      5:squa(-qx[j]-b/a,qx[j]/a,xx);
      6:begin squa(-qx[j]+qx[j-1]-qni[iv]-b+a,b*qx[j]-b*qx[j-1]+b*qni[iv]-a*qni[iv],xx);qni[iv]:=xx end;
      8:begin xx:=qni[iv]+exp(a*ln(qx[j])+b+ln(qx[j]-qx[j-i]));qni[iv]:=xx end;
      9:xx:=qx[j]/(a*qx[j]+b);
      10:xx:=a*sqr(qx[j])+b*qx[j];
      12:begin xx:=qni[iv]+exp(a*tt[j]+b);qni[iv]:=xx end;
      13:begin xx:=qni[iv]+1/(a*tt[j]+b);qni[iv]:=xx end;
      14:xx:=a/tt[j]+b;
      15:xx:=a*ext(qx[j],cc[iv])+b;
     end;
   end;

   procedure sig(l,n:integer;a,b:real;var dis:dim1);
   begin
   dis[iv]:=0;
   {writeln( 'iv= ',iv);}
   for j:=1 to n do begin
   { writeln(' j:= ',j,' xx= ',xx);}
   dis[iv]:=dis[iv]+sqr(qt[j]-xx);
   end;
   dis[iv]:=sqrt(dis[iv]/(n-1));
   writeln('Среднеквадр.откл.на ин-ле "обучения":для ',iv,-ой модели ',dis[iv]:12);
   end;{proc sig }

   prcedure modess(iv:integer;var x,y:dim);
   begin
   for j:=l to n do begin
     case iv of
      15:begin y[j]:=ln((qt[j]-qt[j-1])/(qx[j]-qx[j-1]));x[j]:=ln(qx[j]) end;
      end;
     end;
   end;end;

   procedure tabl(l,n,nbr:integer;var a,b:real;var x,y,y1:dim);
   label 1,2,3,4;
   begin
   4:write('Печатать таблйцу на дисплей-1; на принтер-2');readln(l2);
   case l2 of
    1:l1:='con';
    2:l1:='lpt1';
    else begin writeln('ошибочный набор - повторите ввод');goto 4 end;
   end;
   assign(ll,l1);rewrite(ll);
   writeln('        Введите номер таблицы ');readln(name3);writeln(ll,name3);
   writeln(ll,' ');writeln(ll,' ');writeln(ll,' ');writeln(ll,' ');
   writeln('     Введите название ');
   writeln(ll,' Накопленая дополнительная добыча нефти ');
   writeln(ll,'    по методу ');

   writeln(ll,' ');writeln(ll,' ');
   writeln(ll,'        ',naz[iv]);
   writeln(ll,'              (обработка в интервале :',l,' - ',n,')');writeln(ll,'');
   writeln(ll,lchr(53,'-'));
   writeln(ll,'! год   ','!месяц! ',' добыыча!',' накопл добыча !',' доп  !');
   writeln(ll,'!       ','!     ! ',' нефти  !',' факт  ! расч. !','добыча!');
   writeln(ll,lchr(53,'-'));
   1:dis[iv]:=0;
   for j:=1 to nbr do begin sel(j,a,b,xx);
    x[j]:=j;y[j]:=qt[j];qf:=qt[j]-qt[j-1];y1[j]:=xx;dp:=qt[j]-y1[j];
    month(begyr,begmn,j,yer,mn);
    writeln(ll,'! ',yer:5,' !  ',dat[mn],' ! ',qf/boil:7:2,'! 'qt[j]/boil:7:2,
                          ' ! ',y1[j]/boil:7:2,' !',dp/boil:7:2,'!');
    2:if ((j>=1) and (j<=n)) then dis[iv]:=dis[iv]+sqr(dp);
   end;
   dis[iv]:=sqrt(dis[iv]/(n-1));
   writeln(ll,lchr(53,'-'));writelnll,'');writeln(ll,'');
   writeln(ll,'сред.квадр.откл. на интервале:для ',iv,'-ой модели= 'dis[iv]:12);
   close(ll);
   3:end; { proc tabl }

   begin
   for j:=1 to nbr do begin
   case iv of
   1:begin y[j]:=qt[j];x[j]:=1/(qx[j]) end;
   2:begin y[j]:=qt[j];x[j]:=1/sqrt(qx[j]) end;
   3:begin  y[j]:=qt[j];x[j]:=ln(qx[j]) end;
   4:begin y[j]:=qt[j];x[j]:=ln(qx[j]-qt[j]) end;
   5:begin y[j]:=qx[j]/qt[j];x[j]:=qx[j]-qt[j] end;
   6:begin y[j]:=qt[j];x[j]:=(qt[j]-qt[j-1])/qx[j]-qx[j-1]-(qt[j]-qt[j-1])) end;
   7:begin y[j]:=qt[j];x[j]:=ln((qx[j]-qx[j-1]-(qt[j]-qt[j-1]))/(qt[j]-qt[j-1])) end;
   8:begin y[j]:=ln((qt[j]-qt[j-1])/qx[j]-qx[j-1]));x[j]:=ln(qx[j]) end;
   9:begin y[j]:=qx[j]/qt[j];x[j]:=qx[j] end;
   10:begin y[j]:=qt[j]/qx[j];x[j]:=qx[j] end;
   11:begin y[j]:=qt[j];x[j]:=ln((qt[j]-qt[j-1])/(qx[j]-qx[j-1]-qt[j]-qt[j-1]))) end;
   12:begin y[j]:=ln(qt[j]-qt[j-1]);x[j]:=tt[j] end;
   13:begin y[j]:=1/(qt[j]-qt[j-1])x[j]:=tt[j] end;
   14:begin y[j]:=qt[j];x[j]:=1/tt[j] end;
   15:begin y[j]:=qt[j];x[j]:=ext(qx[j],cc[iv]) end;
   16:begin y[j]:=(qx[j]-qt[j])/qt[j];x[j]:=exp(qt[j]*cc[iv]) end;
  end;end;
  end;

  begin
  4:write('число точек nbr= ');readln(nbr);
  write('ввод файла qn: ');readln(name);name:=way+name;dan1(qt,nbr,name);
  write(' ввод файла qv:');readln(name1);name1:=way+name1;dan1(qx,nbr,name1);
  {for i:=1 to nbr do writeln(' i:= ',' qt:= ',qt[i],' qx= ',qx[i]);}
  write('перев.коэф. по воде:нач.;кон. и граница:bn,bk,ng ');readln(bn,bk,ng);
  write('перев.коэф. по нефти:boil  ');readln(boil);
  write(' работать с данными в тыс.тонн? ');readln(key);if key<>0 then
  for i:=1 to nbr do begin qt[i]:=qt[i]/1000;qx[i]:=qx[i]/1000 end;
  qt[1]:=qt[1]*boil;qx[1]:=qx[1]/bn+qt[1];
  for i:=2 to nbr do begin
     if i<ng then qx[i]:=qx[i-1]+qx[i]/nb+qt[i]*boil else qx[i]:=qx[i-1]+qx[i]/bk+qt[i]*boil;
     qt[i]:=qt[i-1]+qt[i]*boil;end;
  write('начало периода: год и месяц ');readln(begyr,begmn);
  write('начало разработки: год и месяц ');readln(begyr0,begmn0);

  for iv:=1 to 16 do begin
     mode(iv,x,y);sqrm(l,n,x,y,a,b,r);sig(l,n,a,b,dis); end;
  for i:=1 to 16 do nom[i]:=i;
  for i:=1 to 16 do writeln(' модель ',nom[i],'ср.кв.от.= ',dis[nom[i]]);
  rang(1,16,dis,nom);s:=readkey;writeln;writeln;
  for i:=1 to 16 do writeln(lst,i,' модель N' ,nom[i],' ср.кв.от.= ',dis[nom[i]]);
   *)
  2:write('вариант ');readln(iv);if iv>14 then goto 2;
  if iv=0 then goto 1;
  for iv:=1 to 14 do qni[i]:=qt[l-1];
  mode(iv,x,y);sqrm(l,n,x,y,a,b,r);graf(1,l,nbr,x,y,y1);readln;textmode(3);
  write(' печатать таблицу? ');readln(key);if key=0 then goto 2;
  tabl(l,n,nbr,a,b,x,y,y1);{readln;graf(2,l,nbr,x,y,y1);readln;textmode(3);}
  goto 2;
  1:write(' изменить базу? ');readln(key);if key=0 then goto 100;
  goto 3;
  100:end.



