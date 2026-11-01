unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ValEdit, Mask, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    StaticText1: TStaticText;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    StaticText11: TStaticText;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit18: TMaskEdit;
    Bevel3: TBevel;
    SB1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StaticText2: TStaticText;
    MaskEdit13: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit19: TMaskEdit;
    Image1: TImage;
    Image2: TImage;
    MaskEdit22: TEdit;
    Label1: TLabel;
    SB2: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SB2Click(Sender: TObject);
    procedure SB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dan:array[1..2,1..5] of string;
  rez:array[1..2,1..5] of string;
  int_dan:array[1..2,1..5] of real;
  s:string;
  s1:string;
  s2:string[3];
  i,code:integer;
  Q,Q1,n,n1,Q_dop,Q_dop1,Q_dop2,h,mupl,koef:real;
  b:boolean;
  Form3: TForm3;

implementation

uses Unit1, Unit2, Unit5;



{$R *.dfm}
procedure ris;
begin
i:=0;
form3.Canvas.pen.color:=cllime;
q_dop:=19.348*exp(-3E-05*i*15.2*40/40);
q_dop:=q_dop/0.6*(1-(1-0.6)*10/mupl);

q_dop:=19.348*exp(-3E-05*(i*15.2*40/40));
q_dop1:=q_dop/0.6*n1/n*(1-(1-0.6)*10/mupl{*n/n1});

q_dop2:=19.348*exp(-3E-05*i*15.2*40/40);

if (q_dop>=q_dop1)and(Q_dop>=Q_dop2) then koef:=193/q_dop;
if (q_dop1>=q_dop)and(Q_dop1>=Q_dop2) then koef:=193/q_dop1;
if (q_dop2>=q_dop)and(Q_dop2>=Q_dop1) then koef:=193/q_dop2;

form3.Canvas.moveTo(88,464);
for i:=0 to 30 do
begin
q_dop:=19.348*exp(-3E-05*i*15.2*40/40);
q_dop:=q_dop/0.6*(1-(1-0.6)*10/mupl);
form3.Canvas.LineTo(round(88+i*15.2*40/40),round(464-koef*q_dop));
end;

str(round(n),s1);
str(round(mupl),s2);
form3.canvas.Brush.Color:=clwhite;
form3.Canvas.textout(round(88+i*15.2*40/40),round(464-koef*q_dop),'n='+s1+';ìþ='+s2);


form3.Canvas.moveTo(88,400);
for i:=0 to 30 do
begin
q_dop:=19.348*exp(-3E-05*(i*15.2*40/40));
q_dop:=q_dop/0.6*n1/n*(1-(1-0.6)*10/mupl{*n/n1});
form3.Canvas.LineTo(round(88+i*15.2*40/40),round(464-koef*q_dop));
end;
str(round(n1),s1);
str(round(mupl),s2);
form3.canvas.Brush.Color:=clwhite;
form3.Canvas.textout(round(88+i*15.2*40/40),round(464-koef*q_dop),'n='+s1+';ìþ='+s2);

form3.canvas.pen.Color:=clred;
q_dop:=19.348*exp(-3E-05*h)/0.6*n1/n*(1-(1-0.6)*10/mupl{*n/n1});;
form3.Canvas.moveto(round(88+h*15.2/40),round(464));
form3.Canvas.LineTo(round(88+h*15.2/40),round(464-koef*q_dop));
str(round(h),s);
form3.Canvas.textout(round(h*15.2/40)-20,round(464-koef*q_dop),
'Q='+form2.QZad.Text+'; H='+s);
form3.label1.caption:=s;
b:=true;

end;
procedure TForm3.FormActivate(Sender: TObject);
var i:integer;
begin
koef:=10;
b:=false;
dan[1,1]:=maskedit1.text;
dan[1,2]:=maskedit3.text;
dan[1,3]:=maskedit5.text;
dan[1,4]:=maskedit7.text;

dan[2,1]:=maskedit2.text;
dan[2,2]:=maskedit4.text;
dan[2,3]:=maskedit6.text;
dan[2,4]:=maskedit8.text;



end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form2.Show;form3.Hide;

end;

procedure TForm3.SpeedButton2Click(Sender: TObject);

begin
sb1.enabled:=true;
sb2.enabled:=true;
val(form2.label1.caption,h,code);
val(form2.mupl.text,mupl,code);
q_dop:=19.348*exp(-3E-05*h);
q_dop:=q_dop/0.6*(1-(1-0.6)*10/mupl);
n1:=n*Q1/q_dop;
for i:=1 to 5 do
begin
s:=dan[1,i];
val(s,int_dan[1,i],code);
q_dop:=int_dan[1,i]*n1/n*1/0.6*(1-(1-0.6)*10/mupl{*n/n1});
str(q_dop,s);
rez[1,i]:=s;
{y = 19,348e(-3E-05x)}
end;

ris;

str(round(n1),s);
maskedit22.text:=s;
maskedit12.text:=rez[1,1];
maskedit14.text:=rez[1,2];
maskedit16.text:=rez[1,3];
maskedit18.text:=rez[1,4];





end;

procedure TForm3.FormPaint(Sender: TObject);
begin
val(form2.Qzad.text,Q1,code);
val(maskedit11.text,n,code);
form3.canvas.Brush.Color:=clwhite;
form3.Canvas.pen.color:=cllime;
form3.Canvas.Rectangle(38,230,762,500);
form3.Canvas.pen.Width:=3;
form3.Canvas.moveTo(88,400);
for i:=0 to 30 do
begin
q_dop:=19.348*exp(-3E-05*i*15.2*40/40);
form3.Canvas.LineTo(round(88+i*15.2*40/40),round((464-koef*q_dop)));
end;
str(round(n),s1);
str(round(mupl),s2);
form3.canvas.Brush.Color:=clwhite;
form3.Canvas.textout(round(88+i*15.2*40/40),round(464-koef*q_dop),'n='+s1+';ìþ=10');

if b then  ris;
end;

procedure TForm3.SB2Click(Sender: TObject);
begin
form5.ShowModal;
end;

procedure TForm3.SB1Click(Sender: TObject);
begin
form1.Show;
form3.Hide;
end;

end.
