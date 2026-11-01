unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TForm2 = class(TForm)
    hst: TMaskEdit;
    hg: TMaskEdit;
    ht: TMaskEdit;
    hh: TMaskEdit;
    kk: TMaskEdit;
    nn: TMaskEdit;
    plotnost: TMaskEdit;
    lnasosa: TMaskEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    qskv: TStaticText;
    StaticText11: TStaticText;
    QZad: TMaskEdit;
    StaticText12: TStaticText;
    Button2: TButton;
    StaticText13: TStaticText;
    mupl: TMaskEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    StaticText14: TStaticText;
    Masa: TMaskEdit;
        procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit3, Unit1, Unit5;

{$R *.dfm}



procedure TForm2.Button2Click(Sender: TObject);
var
s:string;
cod:integer;
mu_pl,h_isk,n,delta_h_d,h,h_tr,ud_ves,h_st,h_g,h_t,k,plot_nost,Q_zad,l_nasosa:real;
begin
{инициализация начальных данных}
val(hst.Text,h_st,cod);
val(hg.Text,h_g,cod);
val(ht.Text,h_t,cod);
val(kk.Text,k,cod);
val(plotnost.Text,plot_nost,cod);
val(Qzad.Text,Q_zad,cod);
val(lnasosa.Text,l_nasosa,cod);
val(hh.Text,h,cod);
val(nn.Text,n,cod);
val(mupl.Text,mu_pl,cod);
h_t:=h_t*1000000/plot_nost;
ud_ves:=1/plot_nost ;

{Для 1 дюйма}
h_tr:= (0.0012*(Q_zad) + 0.13*Q_zad - 0.25)*(h-l_nasosa);
delta_h_d:=10*exp(1/n*ln(Q_zad*ud_ves/k));
h_isk:=h_st+h_g+h_t+h_tr+delta_h_d;

str(h_isk,s);
label1.caption:=s;
form3.show;
form2.Hide;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
halt;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
form5.showmodal;
end;

end.
