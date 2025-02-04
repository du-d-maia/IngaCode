unit Atv2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Clipbrd,
  Vcl.Samples.Spin;

type
  TAtv2Form = class(TForm)
    PainelAtv2: TPanel;
    LabelAtv2: TLabel;
    LblAtv1: TLabel;
    EdtSenha: TEdit;
    BtnGerar: TButton;
    ChkMaiuscula: TCheckBox;
    QntChar: TSpinEdit;
    LblCaracteres: TLabel;
    ChkMinuscula: TCheckBox;
    ChkNumero: TCheckBox;
    ChkSimbolos: TCheckBox;
    BtnCopiar: TButton;
    procedure BtnGerarClick(Sender: TObject);
    procedure BtnCopiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Atv2Form: TAtv2Form;
  function GerarSenha(Qtd: integer; TemMai: Boolean; TemMin: Boolean; TemNum: Boolean; TemSim: Boolean): String;

implementation

{$R *.dfm}

procedure TAtv2Form.BtnCopiarClick(Sender: TObject);
begin
  if not (EdtSenha.Text = EmptyStr) then
    Clipboard.AsText := EdtSenha.Text;
end;

procedure TAtv2Form.BtnGerarClick(Sender: TObject);
begin
   EdtSenha.Text := GerarSenha(QntChar.Value, ChkMaiuscula.Checked, ChkMinuscula.Checked, ChkNumero.Checked, ChkSimbolos.Checked);
end;

function GerarSenha(Qtd: integer; TemMai: Boolean; TemMin: Boolean; TemNum: Boolean; TemSim: Boolean): String;
var
  Variaveis, Senha: String;
  i: integer;
begin
  Variaveis := '';
  Senha := '';
  if TemMai then
    Variaveis := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  if TemMin then
    Variaveis := Variaveis + 'abcdefghijklmnopqrstuvwxyz';
  if TemNum then
    Variaveis := Variaveis + '0123456789';
  if TemSim then
    Variaveis := Variaveis + '"!@#$%¨&*()-_=+[{´`]}~^/?;:.>,<\|';

  if Variaveis = EmptyStr then
  begin
    Result := '';
    Exit;
  end;

  for i := 1 to Qtd do
  begin
    Randomize;
    Senha := Senha + Variaveis[Random(Length(Variaveis))+1];
  end;

  Result := Senha;

end;

end.
