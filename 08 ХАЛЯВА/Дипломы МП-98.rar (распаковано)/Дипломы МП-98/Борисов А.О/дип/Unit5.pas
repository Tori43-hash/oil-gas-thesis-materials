unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Math, ExtCtrls;

type
  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    openDialog1: TSaveDialog;
    Label3: TLabel;
    StaticText3: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}
var
hst,Mr,ff,d,d1,d2,d21,h_ust,ro,alfa,h_nas,h,m:real;
x,y:real;
s:string;

procedure chertesh;
type
s_koord=string[6];
var
bol: boolean;
xx:integer;
f,f1:textfile;
procedure podg_fila;
  var i,xx:integer;
      s1:string;
  begin
  bol:=true;
  if form5.openDialog1.Execute then
    begin
    if form5.openDialog1.filename='C:\Мои документы\chert_nach.dxf' then
    begin
    form4.st1.caption:='Файл шаблона! Выберете другой файл.';
    form4.ShowModal;
    bol:=false;
    end;
    if bol then
    begin
    assignfile(f,form5.openDialog1.filename+'.dxf');
    assignfile(f1,'c:\Мои документы\chert_nach.dxf');
    Rewrite(F);
    reset(f1);
       while not Eof(F1) do
       begin
        Readln(F1, s);
        Writeln(F,s);
       end;
    closefile(f1);
    end;
    end
    else
    bol:=false;
  end;

    procedure kones_fila;
  var i:integer;
  begin
writeln(f,'ENDSEC');
writeln(f,'  0');
write(f,'EOF');
closefile(f);
  end;
  procedure osn_linia(xx,yy,xx1,yy1:real);
   begin
writeln(f,'LINE');
writeln(f,'  8');
writeln(f,'LAYER0VIEW0');
writeln(f,'  6');
writeln(f,'K5LT_BASIC');
writeln(f,'  62');
writeln(f,'     5');
writeln(f,'  10');
writeln(f,xx:3:4);
writeln(f,'  20');
writeln(f,yy:3:4);
writeln(f,'  30');
writeln(f,'0.0000');
writeln(f,'  11');
writeln(f,xx1:3:4);
writeln(f,'  21');
writeln(f,yy1:3:4);
writeln(f,'  31');
writeln(f,'0.0000');
writeln(f,'  0');
   end;

  procedure osevaya_linia(xx,yy,xx1,yy1:real);
   begin
writeln(f,'LINE');
writeln(f,'  8');
writeln(f,'LAYER0VIEW0');
writeln(f,'  6');
writeln(f,'K5LT_AXLED');
writeln(f,'  62');
writeln(f,'     7');
writeln(f,'  10');
writeln(f,xx:3:4);
writeln(f,'  20');
writeln(f,yy:3:4);
writeln(f,'  30');
writeln(f,'0.0000');
writeln(f,'  11');
writeln(f,xx1:3:4);
writeln(f,'  21');
writeln(f,yy1:3:4);
writeln(f,'  31');
writeln(f,'0.0000');
writeln(f,'  0');
   end;

begin
podg_fila;
if bol then
begin
y:=102;
x:=(92-87.6)/(2*tan(alfa*pi/180));
osn_linia(xx,y,xx+x,y+(92-87.6)/2);
osn_linia(xx+x,y+(92-87.6)/2,xx+x,y-50);
osn_linia(xx,y,xx,y-50);
osevaya_linia(xx-10,y-10,xx+x+10,y-10);
kones_fila;
end;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
form5.close;
end;

procedure TForm5.FormPaint(Sender: TObject);
begin
Mr:=28*h+70;
ff:=0.1;
d:=41.2*0.001;
D1:=96.45*0.001;
D2:=92*0.001;
d21:=87.6*0.001;
Q:=(pi*sqr(D1)-pi*sqr(d))*(H_ust-h_nas-hst)/4*ro*9.81+m*9.81;
 if (ff*Q*(D2+d21)/(4*Mr))>1 then
  begin
  alfa:=90;
  str(round(alfa),s); label2.caption:=s;
  str(round(Q),s);  label1.caption:=s;
  Button1.Enabled:=false;
  exit;
  end
 else alfa:=arcsin(ff*Q*(D2+d21)/(4*Mr));
 alfa:=alfa*180/pi;
str(round(alfa),s); label2.caption:=s;
str(round(Q),s);  label1.caption:=s;
 alfa:=alfa*pi/180;
x:=(92-88.6)/(2*tan(alfa*pi/180));
str(round(x),s);  label3.caption:=s;

end;

procedure TForm5.FormActivate(Sender: TObject);
var cod:integer;
begin
val(form2.plotnost.Text,ro,cod);
val(form2.masa.Text,m,cod);
val(form3.label1.caption,H,cod);
val(form2.hh.Text,H_ust,cod);
val(form2.lnasosa.text,h_nas,cod);
val(form2.hst.text,hst,cod);
h:=(h)/(9.81*ro)*0.000001;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
 chertesh;
end;

end.
