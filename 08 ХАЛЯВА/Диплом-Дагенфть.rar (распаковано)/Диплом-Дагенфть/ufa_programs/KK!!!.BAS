        CLS
        PRINT TAB(20)" ПРОЕКТИРОВАНИЕ  ТЕХНОЛОГИЧЕСКОГО"
        PRINT TAB(20)"РЕЖИМА РАБОТЫ ШТАНГОВОЙ УСТАНОВКИ"
        PRINT TAB(20)"С  ГИДРАВЛИЧЕСКИМ  ПРИВОДОМ   АГН"
        PRINT:PRINT:PRINT:PRINT:PRINT:PRINT
        PRINT "ЕСЛИ ИМЕЕТЕ С СОБОЙ справочное руководство
        print "ПО ПРОЕКТИРОВАНИЮ РАЗРАБОТКИ И ЭКСПЛ-ЦИИ
        PRINT "НЕФТЯНЫХ М-ДЕНИЙ   (добыча нефти)"
        :INPUT " ПОД редакцией Гиматудинова Ш.К. ---НАЖМИ (Entor)"q
        CLS:PRINT tab(15)"ЗАДАЙТЕ ХАРАКТЕРИСТИКИ СКВАЖИНЫ"
        PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:dim h(5),d(5),qsh(5)
        input "       ДЛИНА НКТ    (или ГЛУБИНА ФИЛЬТРА) (м.)"l:l=1300
        input "       СТАТИЧЕСКИЙ     УРОВЕНЬ            (м.)"hc:hc=850
        input "КОЭФФИЦИЕНТ ПРОДУКТИВНОСТИ ПЛАСТА (т./сут.МПа)"kK:kK=1.45
        input "ПОКАЗАТЕЛЬ В УРАВНЕНИИ ПРИТОКА     (доли ед.) "m:m=.94
         input "ПЛОТНОСТЬ ДОБЫВАЕМОЙ ЖИДКОСТИ     (т./м.куб.)"rg:rg=1
         input "БУФЕРНОЕ ДАВЛЕНИЕ НА УСТЬЕ СКВ.      (МПа.)  "pb:pb=pb*1e6
	pb=0.98e6


         qm=kk*(rg/10*(l-hc-50))^m:INPUT " ---НАЖМИ (Entor)"q:cls
	:print tab(15)"Максимальный дебит ="qm"(т./сут.)"
	:print tab(15)"Оптимальный дебит ="qm/qm*25"(т./сут.)"
          qm1= 25/qm
         hd=10/rg*(qm1*qm/kk)^1/m+hc:h=hd+50
	:print tab(15)"Динамческий уровень ="hd"(м.)"
	print tab(15)"Длина подвески ="h"(м.)" :INPUT " ---НАЖМИ (Entor)"q:cls
         print tab(15)"      ПО таблце IV.2 на с.137 справочника"
         print tab(15)"ВЫБЕРЕМ СКВАЖИННЫЙ НАСОС С ДИАМЕТРОМ";
	input " ПЛУНЖЕРА (мм.)"dp:dp=43
         dk=0.062:print "КОНСТРУКЦИЮ КОЛОННЫ ШТАНГ ВЫБРАТЬ"
         print "по табл.(IV.8-IV.11)  на с.158-161          "
	input "кол-во ступеней"n:n=3:for i=1 to n :cls
	print "диаметр"i" ступени  в (мм.)";:input d(I)
	print "длина"i;:input "ступени колонны,% к глубине спуска в(%)"h(I)
	next:cls	:print "исходя из выбранных диаметров НКТ,"
	print "насоса и штанг определяем по табл. V.8"
	input "ЛИНЕЙНУЮ ПЛОТНОСТЬ  НКТ  qт в (кг./м.)"qt:qt=9.53:cls

	d(1)=22:h(1)=32:d(2)=19:h(2)=28:d(3)=16:h(3)=40

	print "по табл. V.9 ЛИНЕЙНУЮ ПЛОТНОСТЬ столба  "
	input "Ж-ТИ НАД ПОЛНОЙ ПЛОЩАДЬЮ ПЛУНЖЕРА qж,(кг./м.)"qg:qg=1.52:cls
	print "по табл. V.11 ЛИНЕЙНУЮ ПЛОТНОСТЬ"    :qshp=0
	input "КОЛЬЦЕВОГО СТОЛБА Ж-ТИ qк,(кг./м.)"qk:qk=1.499         :cls
	for i=1 to n:	print "по табл. V.7   для диаметра "d(I);
	input " определить  qш	"qsh(I):cls:qshp=qshp+ qsh(I)*h(I)/100:next

	qshp=2.03
	print " по табл. V.10 площадь кольца fк (cм.кв.)";:input fk:fk=14.99
	print " по табл. V.9 площадь плунжера fн (cм.кв.)";:input lfn:lfn=15.2
	qg1=lfn*1e-4*pb/h/9.81*1e6:qk1=fk*1e-4*pb/h/9.81*1e6
	print "qsh="qshp
	e1=1e-8:h1=1e-4:ks=0.197            :dd=180:d=80
	x1=-ks*(qt+qk)+qshp+sqr((ks*(qt+qk)-qshp)^2+4*(qt+qk+qg)*ks*(qshp+qg))
	x1=x1/2/(qt+qk+qg)
        print "по номограмме на с.212 определим Кф при Кр="x1;:input kp:kp=.24
	 ln=2.2:lfn=15.2:lf=1.8:kf=0.24:fsh=42.2e-4:nn=1.19:qskv=25

	  dsht=32:Dfsh=sqr((x1*dd^2-d^2+dsht^2)/x1)
        print "Dfsh="dfsh
	aa=qg+qt+qk:bb=ks*(qt+qk)-qshp:cc=-ks*(qshp+qg)
	lf=1.8:n=qskv/(1440*lf*0.75*lfn)	
	qqq=n*ln*fsh*nn*(ks+kf)/60/ks/(kf+1):qqn=qqq/.98     :print "qqn="qqn
	print "по таблице V.4 на с.217 находим наиболее"
       print "блиизкое значение подачи силового насоса при "qm1*qm" (м.куб./с.)	
	pp=h*qg*9.81*(1+kp)*ks/(nn*fsh*(kf+ks)):print "pp="pp ,"q="qm1*qm
	:INPUT " ---НАЖМИ (Entor)"q:cls
	print "ОПРЕДЕЛЕНИЕ ВЛИЯНИЯ ПРОМЫСЛОВЫХ ФАКТОРОВ"
	PRINT tab(15)"обусловленых буферным давленем"   :fp=15.2
	tv2=(fp/kp-fk)*1e-4/((qshp+qg)/kp-(qt+qk))
	nbv=1+tv2*pb/h/9.81
	print tab(10)"при ходе вверх" tv2;"nb="nbv
	tn2=kp*(fp+fk)*1e-4/(kp*(qt+qk+qg)-qshp)	
	nb=1+tn2*pb/h/9.81	
	print tab(10)"при ходе вверх" tn2;"nb="nb
	PRINT tab(15)"обусловленых плотностью пл-ой ж-ти"
	rss=rg/7.8/(1-(rg/7.8))
	tv4=((qg-rss*qshp)/kp-qk)/((qshp+qg)/kp-(qt+qk))
	print tab(10)"при ходе вверх" tv4
	tn4=(kp*(qk+qg)+rss*qshp)/(kp*(qt+qg+qk)-qshp)
	print tab(10)"при ходе вниз" tn4
	PRINT tab(15)"обусловленых силами трениия"
	tv5=(1+1/kp)*qshp/((qshp+qg)/kp-(qt+qk))
	tv6=(qt+qshp+qk+qg)/((qshp+qg)/kp-qt-qk)
	ntr=1+.005*tv5+.015*tv6
	print tab(10)"при ходе вверх" tv5;tv6
	print "ntr="ntr
	tn5=(1+kp)*qshp/(kp*(qt+qg+qk)-qshp)
	tn6=kp*(qt+qshp+qk+qg)/(kp*(qt+qk+qg)-qshp)
	ntr=1+.005*tn5+.015*tn6
	print tab(10)"при ходе вниз" tn5;tn6
	print "ntr="ntr
	PRINT tab(15)"обусловленых высотой динамического уровня"
	tv3=(qg/kp-qt*rg/7.8-qk)/((qshp+qg)/kp-qt-qk)
	ny=1-tv3*(h-hd)/h
	print tab(10)"при ходе вверх" tv3;"ny="ny
	tn3=kp*(qt*rg/7.8+qk+qg)/(kp*(qt+qk+qg)-qshp)
	ny=1-tn3*(h-hd)/h
	print tab(10)"при ходе вниз" tn3;"ny="ny
        :INPUT " ---НАЖМИ (Entor)"q:cls
	print tab(15)"ОПРЕДЕЛЕНИЕ ПАРАМЕТРОВ ЦИКЛОГРАММЫ"
	XX=9.81*(qt+qk+qg-qshp/kp+2.41e6*254e-4/9.81/h)/(qt*.131+qshp*.489)
   xxn=9.81*(-kp*(qt+qk)+qg+qshp+2.41e6*50.2e-4/9.81/h)/(qt*.131+qshp*.489)
	print tab(15)"x''в="xx,"x''н="xxn
	tsum=ln*fsh*nn*(kp+ks)/qm/qm1/ks/(1+kp)
	print kc"общая продолжтельность двойного хода"tsum
	tver=tsum*ks/(kp+ks):tni=tsum-tver
	print tab(15)"Время хода штанг вверх"tver
	print tab(15)"Время хода штанг вниз"tni
        :INPUT " ---НАЖМИ (Entor)"q:cls
	print "ОПРЕДЕЛЕНИЕ МОЩНОСТИ ПРИВОДНОГО ДВИГАТЕЛЯ"
	NDV=qm*qm1*1e-4*h*qg*(1+kp)*ks*9.81/(0.97*0.95*nn*fsh*(kp+ks))
	ndv=ndv*sqr(0.03*1.69^2+0.97*1.36^2)
	print "Nдв="ndv"Вт."