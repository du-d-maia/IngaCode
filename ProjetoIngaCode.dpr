program ProjetoIngaCode;

uses
  Vcl.Forms,
  Atv1 in 'Atv1.pas' {Atv1Form},
  IngaCode in 'IngaCode.pas' {Principal},
  Atv2 in 'Atv2.pas' {Atv2Form},
  Atv3 in 'Atv3.pas' {Atv3Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
