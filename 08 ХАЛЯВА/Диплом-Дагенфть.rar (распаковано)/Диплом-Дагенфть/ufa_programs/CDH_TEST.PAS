{            Эта программа определяет изменение    взаимодействия
        нефтяных скважин,проверяя гипотезу об отсутсвии изменений.
	 Программа разработана  в июне 1992 г. Тропиным В.Г.
				Инструкция
     1. После вызова программы исправить константы  n, m, c2=n(n-1)/2,  где
	n - общее число скважин (уже введенных ранее и  плюс предполагаемых
	    для добавления в данном сеансе работы);
	m - число замеров по каждой скважине.
     2. Транслировать и запустить программу.
     3. По запросу можно назначить свои имена файлов.
     4. Работать по запросам программы.
     5. Результаты и исходные данные выдаются на  экран, а  по  требованию -
	на печать.  Для печати необходимо инициировать системный драйвер для
	печати русских текстов  dir_prn.bat , вкючив предварительно принтер.
     6. В файл исходной информации можно добавлять новые данные о скважинах.
	( При добавлении число замеров должно быть неизменным ! )
     7. При автоматическом выходе в редактор исправить константы  n, c2.
     8. Для продолжения работы программы повторить запуск.
     9. Режимы EGA/VGA определяются константой EVMode.
}
Program InterfaseTestingDH(prn);
Uses tpcrt;
Const n=13; m=8; c2=78;               {    c2=n*(n-1)/2     }
      Esch=9999; EVMode=25; Plot=1;
Type kin=0..n; kim=0..m; kinn=0..c2;
     vecm=array[kim] of real;
     vecn=array[kin] of integer;
     vecnn=array[kinn] of boolean;
Var R                        :vecnn;
    HoleNum                  :vecn;
    ch,b                     :char;
    fp                       :text;
    fi,fc                    :file of real;
    k,l                      :longint;
    sch                      :real;
    OrigMode,LastCol,LastRow :word;
    s1,s2                    :string[3];
    status                   :1..2;
(*==========================================================================*)
Procedure Initialize;
Begin
 CheckBreak:=False; OrigMode:=LastMode; TextMode(7);
 LastCol:=Lo(WindMax)+1; LastRow:=Hi(WindMax)+1;GotoXY(1,LastRow);
 TextBackGround(0); TextColor(15); Dec(LastRow,80 div LastCol);
End;
(*--------------------------------------------------------------------------*)
Procedure MakeHoleNum;
var x1:real; i:integer;
Begin reset(fi);
  for i:=1 to n do
    begin read(fi,x1);HoleNum[i]:=trunc(x1); while x1<>Esch do read(fi,x1);end
end;
(*--------------------------------------------------------------------------*)
Procedure MakeWin(x,y,w,h:word;fcol,tcol:byte);
Begin  Window(x,y,w,h); TextBackGround(fcol); TextColor(tcol);
 ClrScr; gotoXY(X,Y);
end;
(*--------------------------------------------------------------------------*)
Procedure Beep; var i:integer;
Begin
 for i:=3000 downto 1 do begin
 sound(i);delay(1);end;nosound;ch:=readkey; end;
(*--------------------------------------------------------------------------*)
Procedure WaitKey;
begin repeat ch:=readkey until(ch='y') or (ch='n');
end;
(*--------------------------------------------------------------------------*)
Procedure Errors(e:integer);
Begin
  case e of
       1: begin  MakeWin(1,EVMode-5,80,EVMode,0,15); writeln; writeln;
           write('   Файл исходных данных испорчен');Beep;halt(1);end;
       2: begin MakeWin(1,EVMode-5,80,EVMode,0,15);  writeln; writeln;
           write('или неверно задана константа c2');
            write('   В файле исходной информации имеются данне о ',
	    k,' скважинах, а константа n <= ',k);  Beep; halt(1);
          end;
       3: begin MakeWin(1,EVMode-5,80,EVMode,0,15);   writeln; writeln;
           write('   Данных введено недостаточно n= ',n,
	    ' ,  а пока имеются данные о ',l,' скважинах'); b:=readkey;
          end;
       4: begin MakeWin(1,EVMode-5,80,EVMode,0,15); writeln; writeln;
           write('   Введена информация о скважинах в соответствии');
            writeln(' с константой n.');
            write('   Если данные еще есть, то изменить константу n.');
            Beep; halt(1);
          end;
       5: begin MakeWin(1,EVMode-5,80,EVMode,0,15);  writeln; writeln;
           writeln('   Можно набирать символы:цифры,точка,знаки:плюс,минус,');
           write('   перевод курсора влево(l),вправо(r),конец числа(enter) ');
           b:=readkey;
          end;
  end;{case e}
End;
(*--------------------------------------------------------------------------*)
Procedure CoeffCorrMax(var x,y:vecm; var ccm:real);
Var s1,s2,s3,s4,s5,rmod,r :real;
    k,j                   :kim;
Begin s1:=0; s2:=0; s4:=0; s5:=0;
  for j:=1 to m do begin s1:=s1+x[j]; s2:=s2+y[j]; end;
  s1:=s1/m; s2:=s2/m;
  for j:=1 to m do
  begin s4:=s4+(x[j]-s1)*(x[j]-s1);
    s5:=s5+(y[j]-s2)*(y[j]-s2);
  end;
  s4:=s4/(m-1); s5:=s5/(m-1); rmod:=0;
  for k:=0 to m div 2-1  do
  begin s3:=0;
    for j:=1 to m-k do s3:=s3+(x[j]-s1)*(y[j+k]-s2);
    s3:=s3/(m-k);
    if abs(s3) > rmod then begin r:=s3; rmod:=abs(s3); end;
  end;      r:=r/sqrt(s5*s4);
  if abs(r) > 1 then
     if r<0 then r:=-0.99 else r:= 0.99;
  ccm:=r
End;(*CoeffCorrMax*)
(*--------------------------------------------------------------------------*)
Procedure CorrMatrixComputer;
Var l,i,k,k1 :integer; a,x1 :real; x,y :vecm;
Begin rewrite(fc);  l:=0;
  for i:=1 to n-1 do
  begin reset(fi); k1:=i-1;
    while k1>0 do
    begin read(fi,x1); while x1<> Esch do read(fi,x1); k1:=k1-1; end;
      k:=1; read(fi,x1); read(fi,x1);
      while x1<>Esch do begin x[k]:=x1; k:=k+1; read(fi,x1);  end;
      while not eof(fi) do
      begin k:=1; read(fi,x1);read(fi,x1);
 	while x1<>Esch do begin y[k]:=x1; k:=k+1; read(fi,x1); end;
	l:=l+1;
        writeln(l);
	CoeffCorrMax(x,y,a);
	write(fc,a);
      end;   (* eof fi *)
    end;  (* for  i  *)
  close(fc);
  If l<>c2 then Errors(1);
end;(* Вычисление корреляционной матрицы *)
(*--------------------------------------------------------------------------*)
Procedure ChRead(i,j:integer;var xr:real);
var x1,x2,v     :real;i1,i2,k,k1,k2,j1:integer;b1,b2:boolean;
      stc       :string[12];
Begin j1:=0; b1:=false; b2:=false;
 repeat
  ch:=readkey;
  case ch of
        ' ':  ch:=readkey;
   '0'..'9': begin j1:=j1+1; stc[j1]:=ch; write(ch);end;
        '.': begin j1:=j1+1;b2:=true; stc[j1]:=ch; write(ch);end;
        #0: begin ch:=readkey;
              case ch of
               #75: begin j1:=j1-1; gotoxy(wherex-1,wherey) end;
               #77: begin j1:=j1+1; gotoxy(wherex+1,wherey) end;
              end;
             end;
        #13: b1:=true;
    '+','-': begin if ch='-' then k:=-1 else k:=1; write(ch);end;
    else
    begin k1:=WhereX; k2:=WhereY; Errors(5);
      MakeWin(1+10*(i-1),6+plot*(j-1),9+10*(i-1),6+plot*(j-1),15,0);
      GotoXY(k1,k2); end;
   end; {case ch of}
  until b1; x1:=0; if k<>-1 then k:=1;
  if not b2 then
    Begin  for i1:=1 to j1 do begin Val(stc[i1],v,k1); x1:=x1*10+v; end;
      xr:=x1;
    end
   else
    Begin i1:=1; x1:=0;
    while stc[i1]<>'.' do Begin  Val(stc[i1],v,k1); x1:=x1*10+v;i1:=i1+1; end;
     x2:=0;
     for i2:=j1 downto i1+1 do
      begin  Val(stc[i2],v,k2); x2:= x2 * 0.1 + v;  end;
     x2:= x2 * 0.1 ;  xr:= x1 + x2;
    end; xr:=xr*k;
 End;{ ChRead}
(*-------------------------------------------------------------------------*)
Procedure DataInputProcessing;
var x,y       :real;
    Lgint,i,j :longint;
    p         :word;
Begin  writeln; MakeWin(5,20,80,25,15,0);
	write('   Новые данные [n], добавление к старым [y]');  WaitKey;
  if ch='n' then
    begin l:=1; k:=0; rewrite(fi); end
  else
    begin reset(fi); Lgint:=FileSize(fi); l:=1;
      while not eof(fi) do
      begin read(fi,y);
        if (l mod(m+2)=1)and(status=1)
        then HoleNum[l div(m+2)+1]:=trunc(y);
        l:=l+1
      end;
      k:=Lgint div (m+2); j:=(l-1)div(m+2);
      if j<>k then Errors(1) else l:=j+1;
     if n<=k then Errors(2);
    end;
  While l<=n do
  begin  MakeWin(1,1,80,EVMode,0,15);
    If (n-l+1)div 8=0 then p:=(n-l+1)mod 8 else p:=8;
    for i:=1 to p do
    begin MakeWin(1+10*(i-1),1,9+10*(i-1),4,15,0);
      write('номер    '); writeln('скважины'); write(' ');
      If status=1 then



       begin ChRead(i,-1,x);write(fi,x); HoleNum[l]:=trunc(x) end
                  else
                  begin x:=HoleNum[l]; write(fi,x); write(HoleNum[l]);end;
      for j:=1 to m do
      begin MakeWin(1+10*(i-1),6+plot*(j-1),9+10*(i-1),6+plot*(j-1),15,0);
        write(' '); ChRead(i,j,x); write(fi,x);
      end;
      write(fi,sch); l:=l+1;
    end;
  end(*While l<n*);
  MakeWin(1,EVMode-5,80,EVMOde,0,15);
  writeln('Пока введены данные о',l-1-k:4,
          '  скважинах без учета ранее введенных');
  write('   Есть еще данные ?[y/n] ');
  WaitKey;
  If (ch='n')and(n>l) then Errors(3);
  If (ch='y')and(n=l) then Errors(4);
  Close(fi);
End;(*DataInputProcessing*)
(*--------------------------------------------------------------------------*)
Procedure CMOutput;
Var x :real; i,j,k,l :longint;
Begin AssignCrt(fp); rewrite(fp);
  Repeat
    MakeWin(5,20,80,25,15,0); writeln; writeln;
    write('  Исходные данные о скважинах показать на экране? [y/n]');
    WaitKey;
    MakeWin(1,1,80,EVMode,15,0);  MakeWin(2,2,79,EVMode-1,15,0);
    If ch='y' then
    begin
     writeln(fp,'   ═════════════ Исходные данные о скважинах ═════════════');
      writeln(fp); reset(fi);
      for i:=1 to n do
      begin read(fi,x); writeln(fp);
       writeln(fp,'   ─────────── Номер скважины:  ',trunc(x):7,' ───────────');
       writeln(fp);
       writeln(fp,'   ───────────  Временной ряд:'); writeln(fp);
       for j:=1 to m div 6 do
        begin
          for k:=1 to 6 do
          begin read(fi,x); write(fp,x:12:3); end;
          writeln(fp);
       end;
       for j:=1 to m mod 6 do
       begin read(fi,x); write(fp,x:12:3); end;
        read(fi,x); writeln(fp); if i mod 4 = 0 then b:=ReadKey;
      end;(*for i*)     writeln(fp);
      Close(fi);
    end;(*If ch='y'*)
    ch:=readkey;  reset(fc);
    write(fp,'   Корр.матрица, сопровождаемая парами соотв. номеров скважин ');
    l:=0; writeln(fp);
    for i:=1 to n-1 do for j:=i+1 to n do
    begin read(fc,x);
      write(fp,'   (',HoleNum[i]:5,',',HoleNum[j]:5,'):',x:8:4);
      l:=l+1;
      If l=3 then begin writeln(fp); l:=0; end;
    end;
    writeln(fp);
    ch:=readkey;
    Writeln('       Корр.матрицу напечатать ? [y/n]'); WaitKey;
    If ch='y' then begin Assign(fp,'prn'); rewrite(fp); end;
  until(ch='n'); close(fp);
End;(*CMOutput*)
(*--------------------------------------------------------------------------*)
Procedure AnswerOutput;
Var i,j,j1,l,Count:Longint;s:string[10];
Begin MakeWin(1,1,80,EVMode,15,0); Assigncrt(fp);Rewrite(fp);
  Repeat Count:=0; l:=0; writeln(fp);
    writeln(fp,'        И т о г и  проверки гипотез'); writeln(fp);
    for i:=1 to n-1 do for j:=i+1 to n do
    begin j1:=(i-1)*(2*n-i) div 2 +j-i;
      if R[j1]=true then s:='отверг.' else s:='принять';
      write(fp,'   (',HoleNum[i]:5,',',HoleNum[j]:5,'):  ',s);
      l:=l+1;
      if l=3 then begin l:=0; writeln(fp) end;
      if R[j1]=true then Count:=Count+1;
    end(*for i,j*);
    writeln(fp);
    writeln(fp,'     Число отвергнутых=',count:8);
    writeln(fp,'     Число принятых=   ',c2-count:8);
    writeln; write('     Эти результаты напечатать ? [y/n]'); WaitKey;
    If ch='y' then begin Assign(fp,'prn'); rewrite(fp); end;
  until(ch='n'); close(fp);
End; (*AnswerOutput;*)
(*--------------------------------------------------------------------------*)
Procedure AnswerGenerator;
Var a,b,z1,z2,u :real; j :longint;
Begin Assign(fi,s2+'st1.dta'); reset(fi);
  Assign(fc,s2+'st2.dta'); reset(fc);
  for j:=1 to c2 do
  begin read(fi,a); read(fc,b);
    z1:=ln((1+a)/(1-a))/2;
    z2:=ln((1+b)/(1-b))/2;
    u:=(z1-z2)/sqrt((2*m-6)/((m-3)*(m-3)));
    if abs(u)>1.96*sqrt(2/(m-3)) then R[j]:=true  else R[j]:=False;
  end;(*for j*)
  close(fi); close(fc);
End;(*AnswerGenerator*)
(*------------------- P r o g r a m   b o d y ------------------------------*)
Begin  Initialize; MakeWin(5,20,40,25,15,0); sch:=trunc(Esch);
  writeln;writeln;
  write('   Имена файлов стандартны ? [y/n] '); WaitKey;
  if ch='y' then begin s1:='InD'; s2:='CrM'; end
  else
  begin MakeWin(1,1,80,5,15,0);
    writeln;writeln;
    write('   Имя файла для исходных данных типа string[3]'); readln(s1);
    write('   Имя файла для корреляционной матрицы типа string[3]');
    readln(s2);
  end;
  for status:=1 to 2 do
  begin
    if status=1
    then begin Assign(fi,s1+'st1.dta'); Assign(fc,s2+'st1.dta'); end
    else begin Assign(fi,s1+'st2.dta'); Assign(fc,s2+'st2.dta'); end;
    MakeWin(5,20,70,25,0,15); writeln;
    writeln; write('   Файл данных для состояния  ',status);
             write(' на диске создан полностью?[y/n]'); WaitKey;
    if ch='n' then  DataInputProcessing;
    MakeHoleNum;
    CorrMatrixComputer;
    CMOutput;
  end;
  AnswerGenerator;
  AnswerOutput;
  End.