program TVPodbor

{$X+};
{$L EgaVga.Obj}
uses
  Dos, Objects, Drivers, Memory, Views, Menus, Dialogs, StdDlg, MsgBox, App,
  Podborhl, HelpFile, Gauges, Mouse,  Puzzle, Calendar, AsciiTab, Calc,
  Graph;

var
  FName:PathStr;
  comand:integer;
  StrNckb:String[7];
  Bool:Boolean;
  Bool1:Boolean;
  Pzab,B,Lnkt:Real;
const
  cmFileOpen        = 1000;
  cmChangeDir       = 1001;
  cmAbout           = 1002;
  cmPuzzle          = 1003;
  cmCalendar        = 1004;
  cmAsciiTab        = 1005;
  cmCalculator      = 1006;
  cmMouse           = 1007;
  cmColors          = 1008;
  cmDosShell        = 1009;
  cmFLoad           = 1010;
  cmFWrite          = 202;
  cmKl              = 1012;
  cmSm              = 204;
  cmDis             = 200;
  cmPrn             = 201;
  cmGef             = 205;
  cmPmin            = 206;
  cmNkt             = 207;
  cmKpd             = 208;
  cmObv             = 209;
  cmGr              = 203;
  cmDis1            = 211;
  cmPrn1            = 212;
  N                 = 10;
type
  Par = array [1..N] of Real;

type

  PTVDemo = ^TTVDemo;
  TTVDemo = object(TApplication)
    Clock: PClockView;
    Heap: PHeapView;
    Rb,Qn,G0,Alfa,Ppl,Pnas,Dek,Dnkt,Py,Nckb,Rng,Rg0,Ya,Ym,Tpl,
    Gef,Ropt,Hc,Pmin,Nb1,Dopt,Mng,Mg,C,Lc,Mb,Fnkt:Real;
    DpDh,DpDhs,Gsod,T,P,H,H2,Mef,Rsm1,Vgs,Vgv,Rg,Rn,Rsm :Par;
    Reg  : Registers;
    constructor Init;
    procedure GetEvent(var Event: TEvent); virtual;
    procedure HandleEvent(var Event: TEvent); virtual;
    function GetPalette: PPalette; virtual;
    function St(var Digit,stepen:real):real;
    procedure Idle; virtual;
    procedure InitMenuBar; virtual;
    procedure InitStatusLine; virtual;
    procedure FileOpen;
    procedure LoadData(var FileName:PathStr);
    procedure WriteData(var FileName:PathStr);
    procedure FPrint;
    procedure FPrint1;
    procedure ReadWindow;
    procedure NewWindow(AT,AP,AH,AMef,AVgv,AVgs,ARsm1,AH2,AGsod:Par;
                        AGef,ARopt,AHc,APmin,ADopt,ANb1:Real);
    procedure Compute;
    procedure Graphic;
    procedure G_ef;
  end;

  PWin = ^TWin;
  TWin = object(TScroller)
    TT,TP,TH,TMef,TVgv,TVgs,TRsm1,TH2,TGsod : Par;
    TGef,TRopt,THc,TPmin,TDopt,TNb1   : Real;
    constructor Init(var Bounds: TRect;AHScrollBar,
    AVScrollBar:PScrollBar;T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod:Par;
                  Gef,Ropt,Hc,Pmin,Dopt,Nb1: Real);
    destructor Done; virtual;
    procedure Draw; virtual;
  end;

  PWinD = ^TWinD;
  TWinD = object(TwINDOW)
    constructor Init(var Bounds: TRect; ATitle: TTitleStr; ANumber:Integer;
    T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod:Par;Gef,Ropt,Hc,Pmin,Dopt,Nb1:Real);
  end;

  PReadWindow = ^TReadWindow;
  TReadWindow = object(TDialog)
  end;

constructor TWinD.Init(var Bounds: TRect; ATitle: TTitleStr; ANumber:
                       Integer;T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod:Par;
                       Gef,Ropt,Hc,Pmin,Dopt,Nb1: Real);
var
  WP : PWin;
  HScrollBar,VScrollBar:PScrollBar;
begin
  TWindow.Init(Bounds,ATitle,ANumber);
  VScrollBar:=StandardScrollBar(sbVertical+sbHandleKeyboard);
  HScrollBar:=StandardScrollBar(sbHorizontal+sbHandleKeyboard);
  GetExtent(Bounds);
  Bounds.Grow(-1,-1);
  Palette := wpGrayWindow;
  WP:=New(PWin,Init(Bounds,HScrollBar,VScrollBar,T,P,H,Mef,Vgv,Vgs,Rsm1,H2,
                     Gsod,Gef,Ropt,Hc,Pmin,Dopt,Nb1));
  Insert(WP);
end;

constructor TWin.Init(var Bounds: TRect;AHScrollBar,
AVScrollBar:PScrollBar;T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod:Par;
Gef,Ropt,Hc,Pmin,Dopt,Nb1: Real);
begin
  TScroller.Init(Bounds,AHScrollBar,AVScrollBar);
  GrowMode:=(gfGrowHiX+gfGrowHiY);
  Options:=Options+ofFramed;
  SetLimit(80,N+7);
  TT:=T;
  TP:=P;
  TH:=H;
  TMef:=Mef;
  TVgv:=Vgv;
  TVgs:=Vgs;
  TRsm1:=Rsm1;
  TH2:=H2;
  TGef:=Gef;
  TRopt:=Ropt;
  THc:=Hc;
  TPmin:=Pmin;
  TDopt:=Dopt;
  TNb1:=Nb1;
  TGsod:=Gsod;
  Bool:=False;
  Bool1:=False;
  EnableCommands([cmPrn,cmPrn1]);
  DisableCommands([cmDis,cmDis1]);
end;

destructor TWin.Done;
begin
  EnableCommands([cmDis,cmDis1]);
  DisableCommands([cmPrn,cmPrn1]);
  Bool:=True;
  Bool1:=True;
  TScroller.Done;
end;


procedure TWin.Draw;
type
  Sta = array [0..N+7] of String[80];
var
  StrPzab,StrNb1,StrGef,StrRopt,StrHc,StrLc,StrPmin,StrDopt,StrNbT: String[7];
  i,k,c: byte;
  s2,s5,s8,s9 :String[7];
  s1 :String[2];
  s3,s4,s6,s7 :String[6];
  B1:TDrawBuffer;
  St : Sta;
  begin
    c:=GetColor(1);
    case comand of
    cmDis:
    begin
    St[0]:='   р счет  движения г з(r)жидк(r)стн(r)(c) смеси п(r) ств(r)"у скв жины н(r)мер '+StrNckb+'';
    St[1]:='╔════╤═════════╤═════════╤═══════╤════════╤════════╤═══════╤═══════╤════════"';
    St[2]:='║    │ Р счет  │ Р счет  │Д в"е- │'емпер -│Эф.вяз- │Объем  │Г з(r)с(r)-│ П"(r)тн. ║';
    St[3]:='║ N  │   (r)т    │   (r)т    │ ние,  │  тур , │ к(r)сть, │выд.г. │держ н.│ смеси, ║';
    St[4]:='║ п/п│ устья,м │ з б(r)я,м │  МП   │   К    │ мП /с  │с.у.,М3│д(r)"и ед│ кг/м3  ║';
    St[5]:='╟────┼─────────┼─────────┼───────┼────────┼────────┼───────┼───────┼────────╢';
    St[N+6]:='╚════╧═════════╧═════════╧═══════╧════════╧════════╧═══════╧═══════╧════════╝';
  for i:=1 to N do
  begin
    Str(i:2,s1);
    Str(TH[i]:7:2,s2);
    Str(TP[i]:6:2,s3);
    Str(TT[i]:6:2,s4);
    Str(TMef[i]:7:2,s5);
    Str(TVgv[i]:6:2,s6);
    Str(TGsod[i]:6:3,s7);
    Str(TRsm1[i]:7:2,s8);
    Str(TH2[N+1-i]:7:2,s9);
    St[i+5]:='║ '+s1+' │ '+s2+' │ '+s9+' │'+s3+' │ '+
           +s4+' │'+s5+' │'+s6+' │'+s7+' │'+s8+' ║';
  end;
  For k:=0 to Size.Y do
  begin
    MoveChar(B1,' ',C,100);
    i:=Delta.Y+k;
    If i<N+7 then
    MoveStr(B1,Copy(St[i],Delta.X+1,Size.X),c);
    WriteLine(0,k,100,1,B1);
  end;
  end;
  cmDis1:
  begin
   Str(TGef:7:2,StrGef);
   Str(TRopt:7:2,StrRopt);
   Str(THc:7:2,StrHc);
   Str(Lnkt:7:2,StrLc);
   Str(TPmin:7:2,StrPmin);
   Str(Pzab:7:2,StrPzab);
   Str(TDopt:7:2,StrDopt);
   Str(TNb1:7:2,StrNb1);
   Str(B*100:7:2,StrNbT);
   For i:=0 to N+7 do
   St[i]:= '                                                                   ';
   St[3]:= '               р счет  ф(r)нт нир(r)в ния скв жины н(r)мер  '+StrNckb+'  ';
   St[4]:= '       ╔═══════════════════════════════════════════════════╤═════════"';
   St[5]:= '       ║ Эффективны(c) г з(r)вы(c) ф кт(r)р, м куб./м куб.         │ '+StrGef+' ║';
   St[6]:= '       ║ Оптим "ьны(c) р сх(r)д г з , м куб./м куб.            │ '+StrRopt+' ║';
   St[7]:= '       ║ Оптим "ьн я г"убин  спуск  "ифт , м               │ '+StrHc+' ║';
   St[8]:= '       ║ 'екущ я г"убин  спуск  "ифт , м                   │ '+StrLc+' ║';
   St[9]:= '       ║ Миним "ьн(r)е з б(r)(c)н(r)е д в"ение ф(r)нт нир(r)в ния, МП  │ '+StrPmin+' ║';
   St[10]:= '       ║ 'екущее з б(r)(c)н(r)е д в"ение, МП                     │ '+StrPzab+' ║';
   St[11]:= '       ║ Оптим "ьны(c) ди метр НК' при текущем режиме, мм    │ '+StrDopt+' ║';
   St[12]:= '       ║ 'екущ я (r)бв(r)дненн(r)сть, %                          │ '+StrNbT+' ║';
   St[13]:= '       ║ М ксим "ьн я (r)бв(r)дненн(r)сть, %                     │ '+StrNb1+' ║';
   St[14]:= '       ╚═══════════════════════════════════════════════════╧═════════╝';
   For k:=0 to Size.Y do
   begin
     MoveChar(B1,' ',C,100);
     i:=Delta.Y+k;
     If i<N+7 then
     MoveStr(B1,Copy(St[i],Delta.X+1,Size.X),c);
     WriteLine(0,k,100,1,B1);
   end;
   end;
  end;
end;

function TTVDemo.St(var Digit,Stepen:real):real;
begin
  St:=Exp(Stepen*Ln(Digit));
end;

procedure TTVDemo.G_ef;
var
  Bg,Rsm12 : Par;
  i : Integer;
  Bg1,Nb2,Lmax,hc1,wr1,wr2,wr3,wr4,wr5,wr6,wr7,wr8,
  DRsm,SigmaNg,SigmaBg,wr9,wr10,Rsm3,Wgpr,Wsm,A,Rsm2,Rn2: Real;
begin
  For i:=1 to N-1 do
  begin
    wr8:=-(1.58+5E-2*P[i]);
    wr9:=10;
    wr10:=St(wr9,wr8);
    SigmaNg:=wr10-72E-6*(T[i]-305);
    wr8:=-(1.19+1E-2*P[i]);
    SigmaBg:=St(wr9,wr8);
    Wgpr:=Vgs[i]*Qn/(Fnkt*86400);
    Wsm:=(Vgs[i]*Qn+Qn)/(Fnkt*86400);
    wr8:=SigmaNg/SigmaBg;
    wr9:=0.83;
    wr10:=St(wr8,wr9);
    wr5:=0.44;
    wr6:=Mef[i]/Mb;
    wr7:=St(wr6,wr5);
    Bg[i]:= Wgpr/(Wsm+0.23*wr10*wr7);
    Bg[N]:=Bg[N-1];
  end;
  A:=G0*Rng*0.001/(Pnas-0.1);
  Rn2:=(Rn[1]+Rn[N])/2;
  For i:=1 to N do
  Rsm12[i]:=Rn[i]*(1-Bg[i])*(1-B)+Rg[i]*Bg[i]+Rb*B;
  DRsm:=0;
  For i:=2 to N do
    DRsm:=DRsm+((H[i]-H[i-1])*Rsm12[i-1]);
  Rsm2:=DRsm/H[N];
  Rsm3:=(Rsm[1]+Rsm[N])/2;
  If  Pzab>=Pnas then
  begin
    Hc:=Lc-(Pzab-Pnas)*1000000/((Rsm1[N]+Rsm1[N-1])/2*9.8);
    Gef:=((G0-1000*Py*A/Rn2)/2)*(1-B);
    hc1:=(Pnas-Py)*1000000/(Rsm3*9.815);
    Lmax:=0.5*(hc1+Sqrt(Sqr(hc1)+326.03*Gef*Sqrt(Dnkt)*
          hc1*(Ln(Pnas/Py)/Ln(10))));
    Ropt:=0.001227*4.2*Hc*(Hc*Rsm3*9.81*1E-6-Pnas+Py)/(Sqrt(Dnkt)*(Pnas-Py)*
          (Ln(Pnas/Py)/Ln(10)));
    Pmin:=0.78*(Pnas+(Lc-Lmax)*Rsm3*9.815E-6);
    If Lmax>Lc then Lmax:=Lc;
    Nb1:=100/(1+(0.01227*Hc*Hc*9.81E-6*(Rb-Rn2))/
         (Sqrt(Dnkt)*(Pnas-Py)*(Ln(Pnas/Py)/Ln(10))*(G0-1E3*A*Py/Rn2)/2));
    wr1:=400*Sqrt(Rsm3*Hc/((Pnas-Py)*1E6));
    wr2:=Qn*Hc/(Rsm3*9.81*Hc-((Pnas-Py)*1E6));
    If wr2<0 then wr2:=0.01;
    wr3:=1/3;
    wr4:=St(wr2,wr3);
    Dopt:=wr1*wr4;
  end
  else
  begin
    Gef:=(G0-1000*(A/Rn2)*(Pzab+Py)/2)*(1-B);
    Ropt:=0.001227*3.6*Lc*(Lc*Rsm2*9.81*1E-6-Pzab+Py)/(Sqrt(Dnkt)*(Pzab-Py)*
    (Ln(Pzab/Py)/Ln(10)));
    Lmax:=Lc;Pmin:=15;
    Nb1:=100/(1+(0.01227*Lc*Lc*9.81E-6*(Rb-Rn[N]))/
    (Sqrt(Dnkt)*(Pzab-Py)*(Ln(Pzab/Py)/Ln(10))*(G0-1E3*A*Py/Rn2)));
    wr1:=400*Sqrt(Rsm2*Lc/((Pzab-Py)*1E6));
    wr2:=Qn*Lc/(Rsm2*9.81*Lc-((Pzab-Py)*1E6));
    wr3:=1/3;
    wr4:=St(wr2,wr3);
    Dopt:=wr1*wr4;
  end;
  If Bool then
  begin
    EnableCommands([cmDis1]);
    comand:=cmDis1;
    NewWindow(T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod,Gef,Ropt,Hc,Pmin,Dopt,Nb1);
    Bool1:=False;
  end;
end;


procedure TTVDemo.Compute;
var
    W,wrem,wr1,wr2,Wp,wr3,wr4,wr5,wr6,Pz,DP,Ty,Rgy,Rgo,Alfan,
  K1,C1,A1,A10,B10,MotTpl,Gpl,Lmpl,Rgrpl,Bnpl,Rnpl,Mgpl,
  Mngpl,G1,Mnpl,Alfab,Gb,AotT,DbotT,DbotG,DbotP,Rbpl,
  Bst,Wkr,Wkre,Wsm,Wsd,A2,B2,Msm                     :real;
    Ppr,Tpr,Za,Zy,Vo,Pnast,RotP,MotT,DotT,Rgv,Rgost,
  Vgo,Lm,Bn,Mnt,Mngaz,Vgr,Betab,Bb,Qn1,Qb1,Betab1,
  Re,Vsm,wr7,Re1,Z,Dtr                         :Par;
    i                                                     :Integer;
    Event                                                 :TEvent;
begin
  If B>=1 then
  begin
      MessageBox(#3'Нет смыс"  эксп"у(r)тир(r)в ть '#13+
                 #3'скв жину при (r)бв(r)дненн(r)сти 100%%.'#13+
                 #3'Изменяю (r)бв(r)дненн(r)сть д(r) 99.5%%',nil,
                  mfInformation + mfOkButton);
      B:=0.995;
  end;
  W:=(Tpl-273)/Lc;wr3:=2.67;
  wrem:=St(Dnkt,wr3);
  wr1:=Qn/(86400*20*wrem);wr4:=10;
  wr2:=St(wr4,wr1);
  Wp:=(0.0034+0.79*W)/wr2;
  Ty:=Tpl-Wp*Lc*Cos(Alfa*Pi/180);
  P[N]:=Pzab;P[N-1]:=Pnas;
  If P[N-1]>Pzab then P[N-1]:=Pzab;
  DP:=(P[N-1]-Py)/(N-2);
  For i:=1 to N-2 do
    P[i]:=P[N-1]-DP*(N-(i+1));
  For i:=1 to N do
    T[i]:=Ty+((Tpl-Ty)*(P[i]-Py))/(Pzab-Py);
  Rgo:=Mg/28.98;
  Rgy:=(Rgo-0.97*Ya)/(1-Ya);
  For i:=1 to N do
  begin
    Ppr[i]:=10*P[i]/(46.9-2.06*Sqr(Rgy));
    Tpr[i]:=T[i]/(97+172*Rgy);
  end;
  For i:=1 to N do
  begin
    Wr1:=14.7/(Sqrt(T[i]-273));
    Wr2:=3.71;
    Wr3:=(T[i]-273);
    Za[i]:=0.564E-10*St(Wr3,Wr2)*St(P[i],Wr1)+1;
    If (Ppr[i]>=0) and (Ppr[i]<=5) and (Tpr[i]>1.17) and (Tpr[i]<=2.0) then
    Zy[i]:=1-Ppr[i]*(0.18/(Tpr[i]-0.73)-0.135)+0.016*Wr4/Tpr[i];
    If (Ppr[i]>=0) and (Ppr[i]<=1.45) and (Tpr[i]>=1.0) and (Tpr[i]<=1.17) then
    Zy[i]:=1-0.23*Ppr[i]-(1.88-1.6*Tpr[i])*Sqr(Ppr[i]);
    If (Ppr[i]>1.45) and (Ppr[i]<=5) and (Tpr[i]>=1.0) and (Tpr[i]<=1.17) then
    Zy[i]:=0.13*Ppr[i]+(6.05*Tpr[i]-6.26)*Tpr[i]/Sqr(Ppr[i]);
    If (Ppr[i]>5) or (Ppr[i]<0) or (Tpr[i]>2) or (Tpr[i]<1.0) then
    begin
      MessageBox(#3'П(r) д нн(r)(c) мет(r)дике к(r)еффициент сверх-'#13+
                 #3'сжим ем(r)сти не (r)преде"яется. Измените'#13+
                 #3'Pз б.,Pу. и"и м(r)"еку"ярную м ссу г з .',nil,
                  mfInformation + mfOkButton);
      Halt(1);
    end;
    Z[i]:=Za[i]*Ya+Zy[i]*(1-Ya);
    Rg[i]:=Rg0*P[i]*273/(Z[i]*0.1*T[i]);
    Vo[i]:=G0*Z[i]*0.1*T[i]/(P[i]*273);
    Pnast[i]:=Pnas-(Tpl-T[i])/(9.157+701/(G0*(Ym-0.8*Ya)));
    DotT[i]:=0.001*Rng*Rgo*(4.5-0.003*(T[i]-293))-4.785;
    MotT[i]:=1+0.029*(T[i]-293)*(Rng*Rgo*0.001-0.7966);
    RotP[i]:=(1+(Ln(P[i])/Ln(10)))/(1+(Ln(Pnast[i])/Ln(10)))-1;
    Vgv[i]:=G0*RotP[i]*MotT[i]*(DotT[i]*(1+RotP[i])-1);
    If Vgv[i]<0 then Vgv[i]:=0;
    Vgo[i]:=G0*MotT[i]-Vgv[i];
    wr1:=0.001*Rng*G0-186;
    wr2:=1+0.0054*(T[i]-293);
    Rgv[i]:=wr2*(Rgo-0.0036*(1+RotP[i])*(105.7+wr1*RotP[i]));
    Rgost[i]:=G0*(wr2*MotT[i]*Rgo-Rgv[i]*Vgv[i]/G0)/Vgo[i];
    If Rng < 860 then Alfan:=0.001*(3.083-2.638*Rng*0.001);
    If Rng >= 860 then Alfan:=0.001*(2.513-1.975*Rng*0.001);
    Lm[i]:=0.001*(4.3-0.0035*Rng+1.0337*Rgost[i]/wr2+
    +5.581E-6*Rng*(1-1.61E-6*Rng*Vgo[i])*Vgo[i]);
    Bn[i]:=1+1.0733E-3*Rng*Vgo[i]*Lm[i]/MotT[i]+Alfan*(T[i]-293)-
    -6.5E-4*P[i];
    If Vgv[i]<=0 then Bn[i]:=Bn[i-1];
    Rn[i]:=Rng*(1+1.293E-3*Rgost[i]*Vgo[i]/(wr2*MotT[i]))/Bn[i];
    If Mng<10 then
    begin
      C1:=1000;
      A1:=0.00076;
    end;
    If (Mng>=10) and (Mng<=1000) then
    begin
      C1:=100;
      A1:=0.00144;
    end;
    If Mng>1000 then
    begin
      C1:=10;
      A1:=0.00253;
    end;
    K1:=1/(1+A1*(T[i]-293)*(Ln(C1*Mng)/Ln(10)));
    wrem:=C1*Mng;
    Mnt[i]:=1/C1*St(wrem,K1);
    Vgr[i]:=1.055E-3*(1+5*Alfan)*Vgo[i];
    wr5:=0.667;wr6:=0.85;
    B10:=1+0.0017*Vgo[i]-0.0228*St(Vgo[i],wr5);
    A10:=1+0.0129*Vgo[i]-0.0364*St(Vgo[i],wr6);
    Mngaz[i]:=A10*St(Mnt[i],B10);
  end;
  MotTpl:=1+0.029*(Tpl-293)*(Rng*Rgo*0.001-0.7966);
  Gpl:=G0*MotTpl;
  Rgrpl:=wr2*MotTpl*Rgo;
  Lmpl:=0.001*(4.3-0.0035*Rng+1.03*Rgrpl/wr2+
  +5.581E-6*Rng*(1-1.61E-6*Rng*Gpl)*Gpl);
  Bnpl:=1+1.0733E-3*Rng*Gpl*Lmpl/MotTpl+Alfan*(Tpl-293)-
  -6.5E-4*Ppl;
  Rnpl:=Rng*(1+1.293E-3*Rgrpl*Gpl/(wr2*MotTpl))/Bnpl;
  K1:=1/(1+A1*(Tpl-293)*Ln(C1*Mng));
  wrem:=C1*Mng;
  Mgpl:=1/C1*St(wrem,K1);
  G1:=1.055E-3*(1+5*Alfan)*G0*Rng;
  B10:=1+0.0017*G0-0.0228*St(G0,wr5);
  A10:=1+0.0129*G0-0.0364*St(G0,wr6);
  Mngpl:=A10*St(Mgpl,B10)*2;
  If Mngpl<=5 then  wr3:=0.0144*Mngpl;
  If (Mngpl>5) and (Mngpl<=10) then  wr3:=0.057+0.023*(Mngpl-5);
  If (Mngpl>10) and (Mngpl<=25) then  wr3:=0.0171+0.031*(Mngpl-10);
  If (Mngpl>25) and (Mngpl<=45) then  wr3:=0.643+0.045*(Mngpl-25);
  If (Mngpl>45) and (Mngpl<=75) then  wr3:=1.539+0.058*(Mngpl-45);
  If (Mngpl>75)  then  wr3:=3.286+0.1*(Mngpl-75);
  Mnpl:=Mngpl+wr3*(Ppl-Pnas);
  K1:=100*C/(1000+C);
  For i:=1 to N do
  begin
    wr1:=(T[i]-273);
    wr2:=0.2096;
    Alfab:=0.048/St(wr1,wr2);
    wr1:=10;wr2:=Alfab*K1;
    Gb:=1/St(wr1,wr2);
    wr1:=T[i]-273;wr2:=0.6746;
    AotT:=1.8E-4+0.18E-4*St(wr1,wr2);
    DbotT:=AotT*(T[i]-293);
    DbotG:=(1.8829+0.0102*(T[i]-273))*P[i]*Gb*0.0001;
    Betab[i]:=4.7E-4+(T[i]-293)*(3.125E-4*(T[i]-293)-0.025)*0.0001;
    DbotP:=-Betab[i]*P[i];
    Bb[i]:=1+DbotT+DbotP+DbotG;
  end;
  If (K1>0) and (K1<=12) then Rb:=1000+6.95*K1;
  If (K1>12) and (K1<=20) then Rb:=1000+6.08*K1;
  If (K1>20) then Rb:=1000+5.25*K1;
  Rbpl:=Rb/Bb[1];
  wr1:=10;wr2:=0.0065*(Tpl-273);
  Mb:=(1.4+3.8E-3*(Rb-1000))/St(wr1,wr2);
  Bst:=B/(B+(1-B)*Rb/Rng);
  Wkr:=0.487*Sqrt(9.815*Dnkt);
  wr2:=56;
  Fnkt:=3.1415*Sqr(Dnkt)/4;
  For i:=1 to N do
  begin
    Qn1[i]:=Qn*Bn[i]*(1-Bst)/86400;
    Qb1[i]:=Qn*Bb[i]*Bst/86400;
    Betab1[i]:=Bst/(Bst+(1-Bst)*Bn[i]);
    Wkre:=0.064*St(wr2,Betab1[i])*Sqrt(9.815*Dnkt);
    Wsm:=(Qn1[i]+Qb1[i])/Fnkt;
    Rsm[i]:=Rb*Betab1[i]+Rn[i]*(1-Betab1[i]);
    If (Wkr<Wsm) and (Wkre<Wsm) and (Betab1[i]<=0.5) then
    begin
      Wsd:=8*Wsm/Dnkt;
      wr6:=(0.48)*Betab1[i];
      A2:=(1+20*Sqr(Betab1[i]))/St(Wsd,wr6);
      If A2<=1 then B2:=Mngaz[i];
      If A2>1 then B2:=A2*Mngaz[i];
      Mef[i]:=B2*(1+2.9*Betab1[i])/(1-Betab1[i]);
    end
    else
    begin
      wr1:=3.2*(1-Betab1[i]);
      wr2:=10;
      Mef[i]:=Mb*St(wr2,wr1);
    end;
    If (Wkr>Wsm) and (Betab1[i]<=0.5) then Mef[i]:=Mngaz[i];
    If (Wkr>Wsm) and (Betab1[i]>0.5) then Mef[i]:=Mb;
  end;
  For i:=1 to N do
  begin
    FillChar(H,SizeOf(H),Chr(0));
    FillChar(H2,SizeOf(H),Chr(0));
    Vgs[i]:=Vgv[i]*Z[i]*0.1*T[i]*(1-Betab1[i])/(P[i]*293);
    Gsod[i]:=Vgs[i]*Qn/(Vgs[i]*Qn+Qn);
    Msm:=Rng+Rg0*G0*(1-Betab1[i])+Rb*Betab1[i]/(1-Betab1[i]);
    Vsm[i]:=Bn[i]+Vgv[i]*Z[i]*0.1*T[i]*(1-Betab1[i])/
    (P[i]*293)+Betab1[i]/(1-Betab1[i]);
    RSm1[i]:=Msm/Vsm[i];
    Vgv[i]:=Vgv[i]*(1-Betab1[i]);
    If  P[i]<Pnas then
      begin
      wr1:=(Qn1[i]+Qb1[i])/(Fnkt);
      wr3:=Vo[i]*(1-B)*Qn/(Fnkt*86400);
      wr2:=(wr1+wr3);
      Re[i]:=0.99E-5*Qn*(1-Betab1[i])*Msm/Dnkt;
      wr4:=19.66/Sqrt(Sqrt(1+Ln(Re[i])/Ln(10)))-17.713;
      wr5:=10;
      Wr7[i]:=St(wr5,wr4);
      DpDh[i]:=Rsm1[i]*9.8E-6*Cos(Alfa*Pi/180)+(wr7[i]*Sqr(Qn)*
      Sqr(1-Betab1[i])*(Msm))/(2.3E15*Rsm1[i]*Dnkt*Dnkt*Dnkt*Dnkt*Dnkt);
      Dtr[i]:=P[i]*((wr7[i]*Sqr(Qn)*Sqr(1-Betab1[i])*(Msm))/
              (2.3E15*Rsm1[i]*Dnkt*Dnkt*Dnkt*Dnkt*Dnkt));
    end
    Else
    begin
      wr4:=Qn*Bn[i]/(Pi*0.25*86400*Sqr(Dnkt));
      Re[i]:=wr4*Rsm[i]*Dnkt*1000/Mef[i];
      wr1:=0.067*Sqrt(Sqrt(158/Re[i]+2*1.4E-5/(Dnkt)));
      wr2:=0.2;
      wr5:=St(wr1,wr2);
      wr1:=(Qn1[i]+Qb1[i])/(Fnkt);
      DpDh[i]:=Rsm[i]*9.815E-6*Cos(Pi*Alfa/180)+wr5*
      Sqr(wr1)*Rsm[i]*1E-6/(2*(Dnkt));
      Dtr[i]:=wr5*Sqr(wr1)*Rsm[i]*1E-6/(2*(Dnkt));
    end;
  end;
  For i:=N downto 1  do
  begin
    If  P[i]<Pnas then
    begin
      Re1[i]:=0.99E-5*Qn*(1-Betab1[i])*Msm/(Dek-Dnkt);
      wr4:=19.66/Sqrt(Sqrt(1+Ln(Re1[i])/Ln(10)))-17.713;
      wr5:=10;
      Wr7[i]:=St(wr5,wr4);
      DpDhs[i]:=Rsm1[i]*9.8E-6*Cos(Alfa*Pi/180)+(wr7[i]*Sqr(Qn)*
      Sqr(1-Betab1[i])*(Msm))/(2.3E15*Rsm1[i]*
      (Dek*Dek-Dnkt*Dnkt)*(Dek-Dnkt));
    end
    Else
    begin
      wr4:=Qn*Bn[i]/(Pi*0.25*(Sqr(Dek)-Sqr(Dnkt)));
      Re1[i]:=wr4*Rsm[i]*(Dek-Dnkt)*1000/Mef[i];
      wr1:=0.067*Sqrt(Sqrt(158/Re[i]+2*1.4E-5/(Dnkt)));
      wr2:=0.2;
      wr5:=St(wr1,wr2);
      wr1:=(Qn1[i]+Qb1[i])/(Fnkt);
      DpDhs[i]:=Rsm[i]*9.815E-6*Cos(Pi*Alfa/180)+wr5*
      Sqr(wr1)*Rsm[i]*1E-6/(2*(Dek-Dnkt));
    end;
  end;
  For i:=2 to N-1  do
  begin
    H[i]:=H[i-1]+DP*((1/DpDh[i-1]+1/DpDh[i])/2);
  end;
  H[N]:=H[N-1]+(P[N]-P[N-1])*(1/DpDh[N-1]+1/DpDh[N])/2;
  H2[1]:=Lc;
  H2[2]:=H2[1]-(P[N]-P[N-1])*(1/DpDhs[N-1]+1/DpDhs[N])/2;
  For i:=3 to N do
  begin
    H2[i]:=H2[i-1]-DP*((1/DpDhs[N+2-i]+1/DpDhs[N-i+1])/2);
  end;
  EnableCommands([cmPrn,cmGr,cmGef]);
  If Bool then
  begin
    EnableCommands([cmDis]);
    comand:=cmDis;
    NewWindow(T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod,Gef,Ropt,Hc,Pmin,Dopt,Nb1);
    Bool:=False;
  end;
end;


procedure TTVDemo.Graphic;
type
  Par2 =  array [1..N] of Integer;
var
 i,Gd,Gm,Xm1,Ym1,X1,X2,Y1,Y2 : Integer;
 DLc,DPpl,Y3,X3  : Real;
 S10  : String[4];
 X4,Y4 : Par2;
begin
  Gd:=Ega;
  Gm:=EgaHi;
  InitGraph(gD,gM,'');
  If GraphResult <> grOk then
  begin
  MessageBox(#3'Ошибк  при регистр ции'#13+
             #3'гр фическ(r)г(r) др (c)вер ', nil, mfError + mfOkButton);
  end
  else
  begin
    Xm1:=GetMaxX;
    Ym1:=GetMaxY;
    SetLineStyle(SolidLn,0,ThickWidth);
    SetColor(magenta);
    SetFillStyle(SolidFill,White);
    Bar(0,0,Xm1,Ym1);
    SetFillStyle(SolidFill,blue);
    Bar(250,50,Xm1-2,Ym1-2);
    SetFillStyle(3,2);
    bar(2,50,199,Ym1-1);
    SetFillStyle(SolidFill,White);
    bar(59,40,141,Ym1);
    SetFillStyle(SolidFill,Green);
    bar(60,40,140,Ym1-1);
    SetFillStyle(SolidFill,Black);
    bar(60,150,140,Ym1-1);
    SetFillStyle(SolidFill,White);
    Bar(79,10,121,281);
    SetFillStyle(10,9);
    Bar(80,10,120,280);
    SetFillStyle(SolidFill,White);
    Bar(1,300,59,339);
    Bar(141,300,200,340);
    SetFillStyle(11,14);
    Bar(2,301,58,338);
    Bar(142,301,199,339);
    SetFillStyle(SolidFill,blue);
    Bar(61,339,139,348);
    SetFillStyle(SolidFill,Brown);
    Bar(61,281,139,339);
    SetFillStyle(10,9);
    Bar(119,10,160,30);
    Dlc:=Lc/(N-1);DPpl:=Ppl/(N-1);
    X1:=(Trunc(((Xm1-250)/Ppl)*DPpl));
    Y1:=Trunc(((Ym1-50)/Lc)*Dlc);
    SetLineStyle(SolidLn,0,NormWidth);
    SetColor(15);Y2:=0;X2:=0;
    SetTextJustify(0,0);
    While (Y2<Ym1) do
    begin
      Y3:=Y2/Y1;
      Str((Y3*DLc):4:0,S10);
      SetColor(15);
      Line(250,50+Y2,Xm1-2,50+Y2);
      SetColor(0);
      OutTextXY(210,Y2+50,S10);
      Y2:=Y2+Y1;
    end;
    SetTextJustify(2,2);
    While (X2<Xm1) do
    begin
      X3:=X2/X1;
      Str((X3*DPpl):4:0,S10);
      SetColor(15);
      Line(250+X2,50,250+X2,Ym1-2);
      SetColor(0);
      If X3 = 0 then S10:='     ';
      OutTextXY(250+X2,35,S10);
      X2:=X2+X1;
    end;
    OutTextXY(638,22,'P, МП ;');
    SetLineStyle(SolidLn,0,ThickWidth);
    SetColor(14);
    SetFillStyle(SolidFill,LightGreen);
    For i:=1 to N do
    begin
      X4[i]:=Trunc((X1/DPpl)*P[i])+250;
      Y4[i]:=Trunc((Y1/DLc)*H[i])+50;
    end;
    For i:=1 to N-1 do
    begin
      If P[i]<Pnas then
      begin
        Circle(X4[i],Y4[i],2);
        FloodFill(X4[i],Y4[i],14);
        Line(X4[i],Y4[i],X4[i+1],Y4[i+1]);
      end
      else
      begin
        SetColor(0);
        SetFillStyle(SolidFill,Black);
        Circle(X4[i],Y4[i],2);
        FloodFill(X4[i],Y4[i],0);
        Line(X4[i],Y4[i],X4[i+1],Y4[i+1]);
      end;
    end;
    Circle(X4[N],Y4[N],2);
    For i:=1 to N do
    begin
      X4[i]:=Trunc((X1/DPpl)*P[i])+250;
      Y4[N+1-i]:=Trunc((Y1/DLc)*H2[i])+50;
    end;
    For i:=1 to N-1 do
    begin
      If P[i]<Pnas then
      begin
        SetColor(14);
        SetFillStyle(SolidFill,LightGreen);
        Circle(X4[i],Y4[i],2);
        FloodFill(X4[i],Y4[i],14);
        Line(X4[i],Y4[i],X4[i+1],Y4[i+1]);
      end
      else
      begin
        SetColor(0);
        SetFillStyle(SolidFill,Black);
        Circle(X4[i],Y4[i],2);
        FloodFill(X4[i],Y4[i],0);
        Line(X4[i],Y4[i],X4[i+1],Y4[i+1]);
      end;
    end;
    Circle(X4[N],Y4[N],2);
    ReadLn;
    CloseGraph;
    Redraw;
    ShowMouse;
  end;
end; 

procedure TTVDemo.ReadWindow;
type
  Str8 = String[8];
var
  OrderWindow        : PReadWindow;
  Control            : word;
  DataRec            : array[0..20] of Str8;
  Code               : Integer;
  R                  : TRect;
  Field              : PInputLine;
begin
  Str(Qn:7:3,DataRec[0]);
  Str(B:7:4,DataRec[1]);
  Str(G0:7:2,DataRec[2]);
  Str(Lc:7:2,DataRec[3]);
  Str(Alfa:7:2,DataRec[4]);
  Str(Ppl:7:2,DataRec[5]);
  Str(Pnas:7:2,DataRec[6]);
  Str(Py:7:3,DataRec[7]);
  Str(Dek:7:4,DataRec[8]);
  Str(Dnkt:7:4,DataRec[9]);
  Str(Rng:7:2,DataRec[10]);
  Str(Rg0:7:4,DataRec[11]);
  Str(Ya:7:4,DataRec[12]);
  Str(Ym:7:4,DataRec[13]);
  Str(Tpl:7:2,DataRec[14]);
  Str(Mng:7:2,DataRec[15]);
  Str(Pzab:7:2,DataRec[16]);
  Str(Mg:7:2,DataRec[17]);
  Str(C:7:2,DataRec[18]);
  Str(Lnkt:7:2,DataRec[19]);
  Str(Nckb:7:0,DataRec[20]);
  R.Assign(0, 0, 70, 23);
  OrderWindow := New(PReadWindow, Init(R,'Д нные'));
  OrderWindow^.Options := Options or ofCentered;
  OrderWindow^.HelpCtx := $F000;
  OrderWindow^.HelpCtx := hcFKl;
  with OrderWindow^ do
  begin
    R.Assign(45, 1, 54, 2);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 1, 40, 2);
    Insert(New(PStaticText, Init(R, 'П" н(r)вы(c) (r)тб(r)р нефти, м куб./сут;')));
    R.Assign(45, 2, 54, 3);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 2, 40, 3);
    Insert(New(PStaticText, Init(R, 'Обв(r)днен(r)сть пр(r)дукции, д(r)"и ед.;')));
    R.Assign(45, 3, 54, 4);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 3, 40, 4);
    Insert(New(PStaticText, Init(R, 'Г з(r)вы(c) ф кт(r)р, м куб./т;')));
    R.Assign(45, 4, 54, 5);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 4, 40, 5);
    Insert(New(PStaticText, Init(R, 'Г"убин  скв жены, м;')));
    R.Assign(45, 5, 54, 6);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 5, 40, 6);
    Insert(New(PStaticText, Init(R, ''ред. ве". н к"(r)н  ств(r)"  скв, гр д;')));
    R.Assign(45, 6, 54, 7);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 6, 40, 7);
    Insert(New(PStaticText, Init(R, 'П" ст(r)в(r)е д в"ение, МП ;')));
    R.Assign(45, 7, 54, 8);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 7, 40, 8);
    Insert(New(PStaticText, Init(R, 'Д в"ение н сыщения, МП ;')));
    R.Assign(45, 8, 54, 9);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 8, 40, 9);
    Insert(New(PStaticText, Init(R, 'Д в"ение н  устье, МП ;')));
    R.Assign(45, 9, 54, 10);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 9, 40, 10);
    Insert(New(PStaticText, Init(R, 'Внутренни(c) ди метр ЭК, м;')));
    R.Assign(45, 10, 54, 11);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 10, 40, 11);
    Insert(New(PStaticText, Init(R, 'Внутренни(c) ди метр НК', м;')));
    R.Assign(45, 11, 54, 12);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 11, 40, 12);
    Insert(New(PStaticText, Init(R, 'П"(r)тн(r)сть дег зир. нефти, кг/м куб.;')));
    R.Assign(45, 12, 54, 13);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 12, 40, 13);
    Insert(New(PStaticText, Init(R, 'П"(r)тн(r)сть п(r)пут. г з  при с.у., кг/м;')));
    R.Assign(45, 13, 54, 14);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 13, 40, 14);
    Insert(New(PStaticText, Init(R, 'К(r)".  з(r)т  в с(r)ст ве г з , д(r)"и ед.;')));
    R.Assign(45, 14, 54, 15);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 14, 40, 15);
    Insert(New(PStaticText, Init(R, 'К(r)". мет н  в с(r)ст ве г з , д(r)"и ед.;')));
    R.Assign(45, 15, 54, 16);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 15, 40, 16);
    Insert(New(PStaticText, Init(R, 'П" ст(r)в я темпер тур , К;')));
    R.Assign(45, 16, 54, 17);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 16, 40, 17);
    Insert(New(PStaticText, Init(R, 'Вязк(r)сть нефти при с.у., мП *с;')));
    R.Assign(45, 17, 54, 18);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 17, 40, 18);
    Insert(New(PStaticText, Init(R, 'З б(r)(c)н(r)е д в"ение, МП ;')));
    R.Assign(45, 18, 54, 19);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 18, 40, 19);
    Insert(New(PStaticText, Init(R, 'М(r)"еку"ярн я м сс  г з  ')));
    R.Assign(45, 19, 54, 20);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 19, 40, 20);
    Insert(New(PStaticText, Init(R, 'К(r)". с(r)"е(c) в п". в(r)де, г/";')));
    R.Assign(45, 20, 54, 21);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 20, 40, 21);
    Insert(New(PStaticText, Init(R, 'Г"убин  спуск  НК', м;')));
    R.Assign(45, 21, 54, 22);
    Field := New(PInputLine, Init(R, 8));
    Insert(Field);
    R.Assign(2, 21, 40, 22);
    Insert(New(PStaticText, Init(R, 'Н(r)мер скв жины (т(r)"ьк(r) цифры);')));
    R.Assign(57, 14, 67, 16);
    Insert(New(PButton, Init(R, 'O~K~', cmOk, bfNormal)));
    R.Assign(57, 17, 67, 19);
    Insert(New(PButton, Init(R, 'Cancel', cmCancel, bfNormal)));
    SelectNext(False);
  end;
  OrderWindow^.SetData(DataRec);
  Control:=DeskTop^.ExecView(OrderWindow);
  If Control <> cmCancel then
  begin
    OrderWindow^.GetData(DataRec);
    Val(DataRec[0],Qn,Code);
    Val(DataRec[1],B,Code);
    Val(DataRec[2],G0,Code);
    Val(DataRec[3],Lc,Code);
    Val(DataRec[4],Alfa,Code);
    Val(DataRec[5],Ppl,Code);
    Val(DataRec[6],Pnas,Code);
    Val(DataRec[7],Py,Code);
    Val(DataRec[8],Dek,Code);
    Val(DataRec[9],Dnkt,Code);
    Val(DataRec[10],Rng,Code);
    Val(DataRec[11],Rg0,Code);
    Val(DataRec[12],Ya,Code);
    Val(DataRec[13],Ym,Code);
    Val(DataRec[14],Tpl,Code);
    Val(DataRec[15],Mng,Code);
    Val(DataRec[16],Pzab,Code);
    Val(DataRec[17],Mg,Code);
    Val(DataRec[18],C,Code);
    Val(DataRec[19],Lnkt,Code);
    Val(DataRec[20],Nckb,Code);
    StrNckb:=DataRec[20];
    EnableCommands([cmFWrite,cmSm]);
  end;
  Dispose(OrderWindow,Done);
end; 

procedure TTVDemo.NewWindow(AT,AP,AH,AMef,AVgv,AVgs,ARsm1,AH2,AGsod:Par;
                            AGef,ARopt,AHc,APmin,ADopt,ANb1:Real);
var
  R: TRect;
  TheWindow: PWindow;
begin
  R.Assign(0, 2, 80,21 );
  TheWindow := New(PWind, Init(R,'Резу"ьт ты', wnNoNumber,At,AP,
  AH,AMef,AVgv,AVgs,ARsm1,AH2,AGsod,AGef,ARopt,AHc,APmin,ADopt,ANb1));
  case comand of
    cmDis  :TheWindow^.HelpCtx := hcDis;
    cmDis1 :TheWindow^.HelpCtx := hcDis1;
  end;
  DeskTop^.Insert(TheWindow);
end;

constructor TTVDemo.Init;
var
  R: TRect;
  Event:TEvent;
  S: PathStr;
begin
  TApplication.Init;

  GetExtent(R);
  R.A.X := R.B.X - 9; R.B.Y := R.A.Y + 1;
  Clock := New(PClockView, Init(R));
  Insert(Clock);

  GetExtent(R);
  R.A.X := R.B.X - 9; R.A.Y := R.B.Y - 1;
  Heap := New(PHeapView, Init(R));
  Insert(Heap);
  Qn:=0;
  B:=0;
  G0:=0;
  Lc:=0;
  Alfa:=0;
  Ppl:=0;
  Pnas:=0;
  Py:=0;
  Dek:=0;
  Dnkt:=0;
  Rng:=0;
  Rg0:=0;
  Ya:=0;
  Ym:=0;
  Tpl:=0;
  Mng:=0;
  Pzab:=0;
  Mg:=0;
  C:=0;
  Lnkt:=0;
  Nckb:=0;
  Bool:=True;
  S := FSearch('Podbor.hlp','');
  if S <> '' then
   FName:=FExpand(S);
  Event.What := evCommand;
  Event.Command := cmHelp;
  TApplication.PutEvent(Event);
  PutEvent(Event);
  DisableCommands([cmFWrite,cmPrn,cmPrn1,cmGr,cmGef,cmSm,cmDis,cmDis1]);
end;


procedure TTVDemo.GetEvent(var Event: TEvent);
var
  W: PWindow;
  HelpFile: PHelpFile;
  HelpStrm: PDosStream;
  Poin: Pointer;
const
  HelpInUse: Boolean = False;
begin
  TApplication.GetEvent(Event);
  if (Event.What = evCommand) and (Event.Command = cmHelp) and
    not HelpInUse then
  begin
    Mark(Poin);
    HelpStrm := New(PDosStream, Init(FName, stOpenRead));
    HelpFile := New(PHelpFile, Init(HelpStrm));
    if HelpStrm^.Status <> stOk then
    begin
      MessageBox('Не м(r)гу н (c)ти ф (c)" Podbor.hlp.', nil, mfError + mfOkButton);
      Dispose(HelpFile, Done);
    end
    else
    begin
      HelpInUse := True;
      W := New(PHelpWindow,Init(Helpfile, GetHelpCtx));
      if ValidView(W) <> nil then
      begin
        ExecView(W);
        Dispose(W, Done);
      end;
      HelpInUse := False;
      ClearEvent(Event);
    end;
    Release(Poin);
  end;
end;


procedure TTVDemo.FileOpen;
var
  OD: PFileDialog;
  FileName: PathStr;
  StrName:String[13];
begin
  case comand of
    cmFload:StrName:='Вв(r)д из ф (c)" ';
    cmFWrite:StrName:='З пись в ф (c)"';
  end;
  OD := PFileDialog(ValidView(New(PFileDialog, Init('*.dat',StrName,
    'Имя', fdOpenButton, 100))));
  case comand of
    cmFload:OD^.HelpCtx := hcFLoad;
    cmFWrite:OD^.HelpCtx := hcFWrite;
  end;
  if OD <> nil then
  begin
    if Desktop^.ExecView(OD) <> cmCancel then
    begin
    case comand of
      cmFLoad: begin
                 OD^.GetFileName(FileName);
                 TTVDemo.LoadData(FileName);
               end;
      cmFWrite: begin
                  OD^.GetFileName(FileName);
                  If Pos(FileName,'.')=0 then FileName:=FileName+'dat';
                  TTVDemo.WriteData(FileName);
                end;
    end;
    end;
  end;
  Dispose(OD, Done);
end;

procedure TTVDemo.LoadData(var FileName:PathStr);
var
   f : file of real;
begin
  {$I-}
  Assign(F, FileName);
  Reset(F);
  if IOResult <> 0 then
  begin
    MessageBox(#3'Нем(r)гу н (c)ти ф (c)" '#13+
               #13#3+Filename+'.', nil, mfError
                + mfOkButton);
  end
  else
  begin
    read(f,Qn);
    read(f,B);
    read(f,G0);
    read(f,Lc);
    read(f,Alfa);
    read(f,Ppl);
    read(f,Pnas);
    read(f,Py);
    read(f,Dek);
    read(f,Dnkt);
    read(f,Rng);
    read(f,Rg0);
    read(f,Ya);
    read(f,Ym);
    read(f,Tpl);
    read(f,Mng);
    read(f,Pzab);
    read(f,Mg);
    read(f,C);
    read(f,Lnkt);
    read(f,Nckb);
    EnableCommands([cmFWrite,cmSm]);
    Str(Nckb:7:0,StrNckb);
  end;
  close(f);
  {$I+}
end;


procedure TTVDemo.WriteData(var FileName:PathStr);
var
   f : file of real;
begin
  {$I-}
  Assign(F, FileName);
  Rewrite(F);
  if IOResult <> 0 then
  begin
    MessageBox(#3'Нем(r)гу (r)ткрыть ф (c)" '#13+
               #13#3+Filename+'.', nil, mfError
                + mfOkButton);
  end
  else
  begin
    write(f,Qn);
    write(f,B);
    write(f,G0);
    write(f,Lc);
    write(f,Alfa);
    write(f,Ppl);
    write(f,Pnas);
    write(f,Py);
    write(f,Dek);
    write(f,Dnkt);
    write(f,Rng);
    write(f,Rg0);
    write(f,Ya);
    write(f,Ym);
    write(f,Tpl);
    write(f,Mng);
    write(f,Pzab);
    write(f,Mg);
    write(f,C);
    write(f,Lnkt);
    write(f,Nckb);
  end;
  close(f);
  {$I+}
end;       


procedure TTVDemo.FPrint;
var
  eT : Text;
  s1,s2,s9,s3,s4,s5,s6,s7,s8 : String[7];
  i:Integer;
begin
  {$I-}
  Assign(eT,'PRN');
  ReWrite(eT);
  writeln(et,'                                Резу"ьт ты                                   ');
  writeln(et,'   р счет  движения г з(r)жидк(r)стн(r)(c) смеси п(r) ств(r)"у скв жины н(r)мер '+StrNckb+'');
  writeln(et,'╔════╤═════════╤═════════╤═══════╤════════╤════════╤═══════╤═══════╤════════"');
  writeln(et,'║    │ Р счет  │ Р счет  │Д в"е- │'емпер -│Эф.вяз- │Объем  │Г з(r)с(r)-│ П"(r)тн. ║');
  writeln(et,'║ N  │   (r)т    │   (r)т    │ ние,  │  тур , │ к(r)сть, │выд.г. │держ н.│ смеси, ║');
  writeln(et,'║ п/п│ устья,м │ з б(r)я,м │  МП   │   К    │ мП /с  │с.у.,М3│д(r)"и ед│ кг/м3  ║');
  writeln(et,'╟────┼─────────┼─────────┼───────┼────────┼────────┼───────┼───────┼────────╢');
  for i:=1 to N do
  begin
    Str(i:2,s1);
    Str(H[i]:7:2,s2);
    Str(P[i]:6:2,s3);
    Str(T[i]:6:2,s4);
    Str(Mef[i]:7:2,s5);
    Str(Vgv[i]:6:2,s6);
    Str(Vgs[i]:6:2,s7);
    Str(Rsm1[i]:7:2,s8);
    Str(H2[N+1-i]:7:2,s9);
    writeln(et,'║ '+s1+' │ '+s2+' │ '+s9+' │'+s3+' │ '+
         +s4+' │'+s5+' │'+s6+' │'+s7+' │'+s8+' ║');
  end;
  writeln(et,'╚════╧═════════╧═════════╧═══════╧════════╧════════╧═══════╧═══════╧════════╝');
  {$I+}
  Close(eT);
end; 

procedure TTVDemo.FPrint1;
var
  eT : Text;
  StrPzab,StrGef,StrRopt,StrLc,StrNbT,StrHc,StrPmin,StrDopt,StrNb1:String[7];
begin
  {$I-}
  Assign(eT,'PRN');
  ReWrite(eT);
  Str(Gef:7:2,StrGef);
  Str(Ropt:7:2,StrRopt);
  Str(Hc:7:2,StrHc);
  Str(Lnkt:7:2,StrLc);
  Str(Pmin:7:2,StrPmin);
  Str(Pzab:7:2,StrPzab);
  Str(Dopt:7:2,StrDopt);
  Str(Nb1:7:2,StrNb1);
  Str(B*100:7:2,StrNbT);
  writeln(et,'                                  Резу"ьт ты                          ');
  writeln(et,'               р счет  ф(r)нт нир(r)в ния скв жины н(r)мер  '+StrNckb+'  ');
  writeln(et,'       ╔═══════════════════════════════════════════════════╤═════════"');
  writeln(et,'       ║ Эффективны(c) г з(r)вы(c) ф кт(r)р, м куб./м куб.         │ '+StrGef+' ║');
  writeln(et,'       ║ Оптим "ьны(c) р сх(r)д г з , м куб./м куб.            │ '+StrRopt+' ║');
  writeln(et,'       ║ Оптим "ьн я г"убин  спуск  "ифт , м               │ '+StrHc+' ║');
  writeln(et,'       ║ 'екущ я г"убин  спуск  "ифт , м                   │ '+StrLc+' ║');
  writeln(et,'       ║ Миним "ьн(r)е з б(r)(c)н(r)е д в"ение ф(r)нт нир(r)в ния, МП  │ '+StrPmin+' ║');
  writeln(et,'       ║ 'екущее з б(r)(c)н(r)е д в"ение, МП                     │ '+StrPzab+' ║');
  writeln(et,'       ║ Оптим "ьны(c) ди метр НК' при текущем режиме, мм    │ '+StrDopt+' ║');
  writeln(et,'       ║ 'екущ я (r)бв(r)дненн(r)сть, %                          │ '+StrNbT+' ║');
  writeln(et,'       ║ М ксим "ьн я (r)бв(r)дненн(r)сть, %                     │ '+StrNb1+' ║');
  writeln(et,'       ╚═══════════════════════════════════════════════════╧═════════╝');
  {$I+}
  Close(eT);
end; 

function TTVDemo.GetPalette: PPalette;
const
  CNewColor = CColor + CHelpColor;
  CNewBlackWhite = CBlackWhite + CHelpBlackWhite;
  CNewMonochrome = CMonochrome + CHelpMonochrome;
  Pg: array[apColor..apMonochrome] of string[Length(CNewColor)] =
    (CNewColor, CNewBlackWhite, CNewMonochrome);
begin
  GetPalette := @Pg[AppPalette];
end;


procedure TTVDemo.HandleEvent(var Event: TEvent);


procedure ChangeDir;
var
  D: PChDirDialog;
begin
  D := New(PChDirDialog, Init(cdNormal + cdHelpButton, 101));
  D^.HelpCtx := hcFChangeDir;
  if ValidView(D) <> nil then
  begin
    DeskTop^.ExecView(D);
    Dispose(D, Done);
  end;
end;

procedure Puzzle;
var
  P: PPuzzleWindow;
begin
  P := New(PPuzzleWindow, Init);
  P^.HelpCtx := hcPuzzle;
  Desktop^.Insert(ValidView(P));
end;

procedure Calendar;
var
  P: PCalendarWindow;
begin
  P := New(PCalendarWindow, Init);
  P^.HelpCtx := hcCalendar;
  Desktop^.Insert(ValidView(P));
end;

procedure About;
begin
  MessageBox( #3'Переведенцев В" димир Ник(r)" евич'#13+
              #3'ГР-90-01, "ГН'".'#13+
              #3'Все пр в  з щищены.',
              nil, mfInformation or mfOKButton);
end;

procedure AsciiTab;
var
  P: PAsciiChart;
begin
  P := New(PAsciiChart, Init);
  P^.HelpCtx := hcAsciiTable;
  Desktop^.Insert(ValidView(P));
end;

procedure Calculator;
var
  P: PCalculator;
begin
  P := New(PCalculator, Init);
  P^.HelpCtx := hcCalculator;
  if ValidView(P) <> nil then
    Desktop^.Insert(P);
end;

procedure Mouse;
var
  D: PDialog;
begin
  D := New(PMouseDialog, Init);
  D^.HelpCtx := hcOMMouseDBox;
  if ValidView(D) <> nil then
  begin
    D^.SetData(MouseReverse);
    if Desktop^.ExecView(D) <> cmCancel then
      D^.GetData(MouseReverse);
  end;
end;

procedure DosShell;
begin
  DoneSysError;
  DoneEvents;
  DoneVideo;
  DoneMemory;
  SetMemTop(HeapPtr);
  PrintStr('Введите Exit д"я в(r)звр т ...');
  SwapVectors;
  Exec(GetEnv('COMSPEC'), '');
  SwapVectors;
  SetMemTop(HeapEnd);
  InitMemory;
  InitVideo;
  InitEvents;
  InitSysError;
  Redraw;
end; 

begin
  TApplication.HandleEvent(Event);
  case Event.What of
    evCommand:
      begin
        case Event.Command of
          cmChangeDir: ChangeDir;
          cmAbout: About;
          cmPuzzle: Puzzle;
          cmCalendar: Calendar;
          cmAsciiTab: AsciiTab;
          cmCalculator: Calculator;
          cmMouse: Mouse;
          cmDosShell: DosShell;
          cmFLoad: begin
                     comand:=cmFLoad;
                     FileOpen;
                   end;
          cmFWrite: begin
                      comand:=cmFWrite;
                      FileOpen;
                    end;
          cmDis:  begin
                    comand:=cmDis;
                    NewWindow(T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod,
                             Gef,Ropt,Hc,Pmin,Dopt,Nb1);
                  end;
          cmPrn:  FPrint;
          cmDis1: begin
                    comand:=cmDis1;
                    NewWindow(T,P,H,Mef,Vgv,Vgs,Rsm1,H2,Gsod,
                             Gef,Ropt,Hc,Pmin,Dopt,Nb1);
                   end;
          cmPrn1:  FPrint1;
          cmGr :  Graphic;
          cmKl:   ReadWindow;
          cmSm:  Compute;
          cmGef: G_ef;
        else
          Exit;
        end;
        ClearEvent(Event);
      end;
  end;
end;

procedure TTVDemo.Idle;

begin
  TApplication.Idle;
  Clock^.Update;
  Heap^.Update;
end;


procedure TTVDemo.InitMenuBar;
var
  R: TRect;
begin
  GetExtent(R);
  R.B.Y := R.A.Y+1;
  MenuBar := New(PMenuBar, Init(R, NewMenu(
    NewSubMenu('~Ё~', hcSystem, NewMenu(
      NewItem('О с(r)зд те"е', '', kbNoKey, cmAbout, hcAbout,
      NewLine(
      NewItem('Игр ', '', kbNoKey, cmPuzzle, hcPuzzle,
      NewItem('К "енд рь', '', kbNoKey, cmCalendar, hcCalendar,
      NewItem('Ascii к(r)ды', '', kbNoKey, cmAsciiTab, hcAsciiTable,
      NewItem('К "ьку"ят(r)р', '', kbNoKey, cmCalculator, hcCalculator, nil))))))),
    NewSubMenu('Д нные', hcDan, NewMenu(
      NewItem('' к" ви туры...','',kbNoKey, cmKl, hcFKl,
      NewItem('Из ф (c)" ...','',kbNoKey, cmFLoad, hcFLoad,
      NewItem('В ф (c)"...','',kbNoKey, cmFWrite, hcFWrite,
      NewItem(''менить диррект(r)рию...', '', kbNoKey, cmChangeDir, hcFChangeDir,
      NewLine(
      NewItem('Временн(r) в д(r)с', '', kbNoKey, cmDosShell, hcFDosShell,
      NewItem('Вых(r)д', 'Alt-X', kbAltX, cmQuit, hcFExit, nil)))))))),
    NewSubMenu('Р счет', hcRas , NewMenu(
      NewItem('Движения смеси','', kbNoKey, cmSm, hcSm,
      NewLine(
      NewItem('"(r)нт нир(r)в ния','', kbNoKey, cmGef, hcGef,
      nil)))),
    NewSubMenu('Выв(r)д', hcV1, NewMenu(
      NewSubMenu('Н  дисп"е(c)', hcV, NewMenu(
        NewItem(''меси', '', kbNoKey, cmDis, hcDis,
        NewItem('"(r)нт нир(r)в ния', '', kbNoKey, cmDis1, hcDis1,
               nil))),
    NewSubMenu('Н  принтер', hcP, NewMenu(
        NewItem(''меси', '', kbNoKey, cmPrn, hcPrn,
        NewItem('"(r)нт нир(r)в ния', '', kbNoKey, cmPrn1, hcPrn1,
               nil))),
      NewLine(
      NewItem('Гр фик','' , kbNoKey, cmGr, hcGr,nil))))),
    NewSubMenu('Н стр(r)(c)к ', hcNoContext, NewMenu(
      NewItem('Мышь...', '', kbNoKey, cmMouse, hcOMouse, nil)),
    nil))))))));
end;

procedure TTVDemo.InitStatusLine;
var
  R: TRect;
begin
  GetExtent(R);
  R.A.Y := R.B.Y - 1;
  StatusLine := New(PStatusLine, Init(R,
    NewStatusDef(0, $FFFF,
      NewStatusKey('~F1~ П(r)м(r)щь', kbF1, cmHelp,
      NewStatusKey('~Alt-X~ Вых(r)д', kbAltX, cmQuit,
      NewStatusKey('~Esc~ З крыть', kbAltF3, cmClose,
      NewStatusKey('~F5~ М сшт б', kbF5, cmZoom,
      NewStatusKey('~F10~ Меню', kbF10, cmMenu,
      NewStatusKey('', kbAltc, cmMenu,
      NewStatusKey('', kbEsc, cmClose,
      NewStatusKey('', kbCtrlF5, cmResize, nil)))))))),
                nil)));
end;
var
  Demo: TTVDemo;
  procedure EgaVgaDriver; External;
begin
  If RegisterBGIDriver(@EgaVgaDriver) < 0 then
  begin
    Writeln('BGI ');
    Halt(1);
  end;
  Demo.Init;
  Demo.Run;
  Demo.Done;
end.
