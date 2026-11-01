program ingibitor;
    uses crt,dos;
    const M=32;K=1220;Rk=753
var Tg,dT,T,C1,C2,Qw,a,Qg,Q:real;
        B1,B2,P,Py,Og,Qs:real;
       begin
        clrscr;
          writeln('Введите следующие данные:');
          write('Давление на устье скважины, МПа  Pу=');readln(Py);
          write('Давление на входе в УКПГ, МПа  P=');readln(P);
          write('Температура на входе в УКПГ,K  T=');readln(T);
          write('Расход газа, тыс.м3/сут  Og=');readln(Og);
          write('Массовая доля свежего метанола, %  C1=');readln(C1);
          write('Температура гидратообразования, К Tg=');readln(Tg);
          write('Коэффициент а, а=');readln(a);
    dT:=Tg-T;
    C2:=1.2*100*M*dT/(K+M*dT);
    B1:=12.7775/10.2*Py+0.087375;
    B2:=4.27/10.2*P+0.0392375;
    Qw:=1.2*(B1-B2)*C2/(C1-C2);
    Qg:=0.001*a*C2;
Q:=Qw+Qg;
    Qs:=Q*Og;
          write('Температура понижения гидратообразования , K  dT=');
          writeln(dT:6:3);
          write('Массовая доля отработанного метанола,  C2=');
          writeln(C2:6:3);
          write('Количество метанола в жидкой фазе, кг/1000м3  Qw=');
          writeln(Qw:5:3);
Продолжение приложения Г
          write('Количество метанола в газовой фазе, кг/1000м3  Qg=');
          writeln(Qg:5:3);
          write('Удельный расход метанола, кг/1000м3 Q=');
          writeln(Q:6:3);
          write('Суммарный расход метанола, кг/сут.  Qs=');
          writeln(Qs:8:3);
end.

