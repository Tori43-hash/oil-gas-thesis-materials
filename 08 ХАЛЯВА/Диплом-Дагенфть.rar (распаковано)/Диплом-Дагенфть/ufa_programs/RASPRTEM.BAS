5 print "РАСПРЕДЕЛЕНИЕ ТЕМПЕРАТУРЫ ПО СТВОЛУ СКВАЖИНЫ"
10 print "вв.пл.дав.ppl в мпа": ppl=20
15 print "вв.зб.дав.pz в мпа":pz=16
20 print "вв.уст.дав.py в мпа":py=12
25 print "вв.геот.градиент g в к/м";g=.02
30 print "вв.диф.коэф.дж.-т.в пласте в к/мпа": dip=0.1
35 print "вв.----в трубе в к/мпа": di=3
40 print "вв.радйус контура питанйя rk в м":rk=100
45 print "вв. радиус скв.rs в м":rs=.1
50 print "вв.обьем.теплоемкость г/п в кдж/(м*м*м*к)":cp=1200
55 print "вв.изоб.тепл.газа cr в кдж/(кг*к)":cr=2.5
60 print "вв.тепл.г/п lam в квт/(м*к)": lam=.0015
65 print "вв.мощность пласта hpl в м": hpl=10
70 print "вв.пл.температуру tpl в к": tpl=320
75 print "вв.глубйну скв. h в м": h=2000
80 print "вв. интервал расчета x в м":x=200
85 print "вв.массовый расход gg в кг/с":input gg
95 dim f(3),a(3),dt(3):print
100 for i=1 to 3
105 lprint "номер" i:lprint
110 input "tau=";tau(i)
115 f(i)=log(1+(3.14*lam*tau(i)/cp/(rs*rs))^(1/2))
120 a(i)=2*3.14*lam/gg/cr/f(i)
125 dt(i)=dip*(ppl-pz)*log(1+(gg*cr*tau(i)/3.14/hpl/cp/(rs^2)))/log(rk/rs)
    lprint "    tau         gg         f          a          dt  "
    lprint"----------------------------------------------------"
    lprint " ";using" ##.##^^^^ ";tau(i);gg;f(i);a(i);dt(i)
    lprint
    lprint "     t          hx  "
    lprint"-------------------"
130 j=0
145 c(j)=tpl-g*(-x*j+h)-dt(i)*exp(-a(i)*(-x*j+h))
146 d(j)=(1-exp(-a(i)*(h-x*j)))*(g-di*(pz-py)/h-1/(102*cr))/a(i)
147 t(j)=c(j)+d(j)
155 lprint using" ##.##^^^^ ";t(j);x*j
157 j=j+1
160 if x*j<=h goto 145
    lprint
170 next i
180 end




		


