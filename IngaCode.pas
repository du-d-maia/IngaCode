unit IngaCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TPrincipal = class(TForm)
    PainelPrincipal: TPanel;
    LabelPrincipal: TLabel;
    BtnAtv1: TButton;
    BtnAtv2: TButton;
    BtnAtv3: TButton;
    procedure BtnAtv1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAtv2Click(Sender: TObject);
    procedure BtnAtv3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

uses Atv1, Atv2, Atv3;

procedure TPrincipal.BtnAtv1Click(Sender: TObject); //Abrir Atividade 1
begin
  Application.CreateForm(TAtv1Form, Atv1Form);
  Atv1Form.ShowModal;
end;

procedure TPrincipal.BtnAtv2Click(Sender: TObject); //Abrir Atividade 2
begin
    Application.CreateForm(TAtv2Form, Atv2Form);
    Atv2Form.ShowModal;
end;

procedure TPrincipal.BtnAtv3Click(Sender: TObject); //Abrir Atividade 3
begin
    Application.CreateForm(TAtv3Form, Atv3Form);
    Atv3Form.ShowModal;
end;

procedure TPrincipal.FormShow(Sender: TObject);    //Ajustar o PainelPrincipal
begin
  PainelPrincipal.Align := alClient;
end;

end.
