unit Atv3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.MPlayer;

type
  TAtv3Form = class(TForm)
    PanelAtv3: TPanel;
    LabelAtv3: TLabel;
    PanelPredio: TPanel;
    Bevel1: TBevel;
    Andar3: TBevel;
    Andar2: TBevel;
    Andar1: TBevel;
    Andar0: TBevel;
    Elevador: TScrollBar;
    PanelElevador: TPanel;
    BtnAndar3: TButton;
    BtnAndar2: TButton;
    BtnAndar1: TButton;
    BtnAndar0: TButton;
    BtnElev0: TButton;
    EdtAndar: TEdit;
    BtnElev1: TButton;
    BtnElev2: TButton;
    BtnElev3: TButton;
    Timer: TTimer;
    MediaPlayerDing: TMediaPlayer;
    procedure BtnAndar0DropDownClick(Sender: TObject);
    procedure BtnAndar3DropDownClick(Sender: TObject);
    procedure BtnAndar2DropDownClick(Sender: TObject);
    procedure BtnAndar1DropDownClick(Sender: TObject);
    procedure BtnElev0Click(Sender: TObject);
    procedure BtnElev1Click(Sender: TObject);
    procedure BtnElev2Click(Sender: TObject);
    procedure BtnElev3Click(Sender: TObject);
    procedure ElevadorChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Atv3Form: TAtv3Form;
  ThreadPainel: TThread;
  ListaEspera: TArray<integer>;
  procedure ControlaElevador(Chamou: integer);
  procedure ControlaPainel(Andar: integer);
  procedure InicializaElevador(Andar: integer; Chamou: integer);
  procedure InicializaPainel;
  procedure DesabilitaPainel(Habilita: Boolean);
  procedure DesabilitaAndares(Habilita: Boolean);

implementation

{$R *.dfm}

procedure TAtv3Form.BtnAndar0DropDownClick(Sender: TObject);   //Aciona procedure ControlaElevador com o valor do andar desejado ao clicar nos botões
begin
  ControlaElevador(100);
end;

procedure TAtv3Form.BtnAndar1DropDownClick(Sender: TObject);
begin
  ControlaElevador(55);
end;

procedure TAtv3Form.BtnAndar2DropDownClick(Sender: TObject);
begin
  ControlaElevador(27);
end;

procedure TAtv3Form.BtnAndar3DropDownClick(Sender: TObject);
begin
  ControlaElevador(0);
end;

procedure TAtv3Form.BtnElev0Click(Sender: TObject);
begin
  ControlaPainel(100);
end;

procedure TAtv3Form.BtnElev1Click(Sender: TObject);
begin
  ControlaPainel(55);
end;

procedure TAtv3Form.BtnElev2Click(Sender: TObject);
begin
  ControlaPainel(27);
end;

procedure TAtv3Form.BtnElev3Click(Sender: TObject);
begin
  ControlaPainel(0);
end;

procedure ControlaElevador(Chamou: Integer);                   //Procedure controladora do elevador
var Andar: integer;
begin
  DesabilitaPainel(False);                                     //Desabilita painel interno do elevador
  Andar := Atv3Form.Elevador.Position;                         //Andar recebe Posição do Elevador
  InicializaElevador(Andar, Chamou);                           //Inicializa o movimento do Elevador com o Andar atual e o Andar acionado
  DesabilitaPainel(True);                                      //Habilita o Painel interno
  Atv3Form.MediaPlayerDing.Open;
  Atv3Form.MediaPlayerDing.Play;                               //Som do elevador
  Atv3Form.Timer.Enabled := True;                              //Inicializa o timer para voltar o Elevador por andar 0
  Atv3Form.Timer.Interval := 15000;                            //15 segundos
end;

procedure InicializaElevador(Andar: integer; Chamou: integer); //Procedure para movimentar Elevador
var
  i: integer;
begin
  if Andar < Chamou then                                       //Descer - Posições do elevadores são decrescentes (maior valor = menor andar)
  begin
    for i := Andar to Chamou do                                //Realiza o movimento do elevador
    begin
      Atv3Form.Elevador.Position := i;
      sleep(50);
    end;
  end
  else if Andar > Chamou then                                 //Subir
  begin
    for i := Andar downto Chamou do
    begin
      Atv3Form.Elevador.Position := i;
      sleep(50);
    end;
  end
  else if Andar = Chamou then                                //Manter no mesmo andar
    sleep(50);

  if Atv3Form.Elevador.Position = 0 then                     //Atribui o texto para informar o andar atual no painel interno
    Atv3Form.EdtAndar.Text := 'Andar 3'
  else if Atv3Form.Elevador.Position = 27 then
    Atv3Form.EdtAndar.Text := 'Andar 2'
  else if Atv3Form.Elevador.Position = 55 then
    Atv3Form.EdtAndar.Text := 'Andar 1'
  else if Atv3Form.Elevador.Position = 100 then
    Atv3Form.EdtAndar.Text := 'Andar 0' ;
end;

procedure ControlaPainel(Andar: integer);                   //Procedure controladora do Painel Interno do elevador
begin
  SetLength(ListaEspera, Length(ListaEspera)+1);            //Adiciona os botões pressionados em um array
  ListaEspera[High(ListaEspera)] := Andar;
  ThreadPainel := TThread.CreateAnonymousThread(procedure   //Cria uma Thread para percorrer o array em tarefa paralela
  begin
    Sleep(5000);                                            //Prazo de 5 segundos para iniciar a Thread
    InicializaPainel;
  end);
  ThreadPainel.Start;
end;

procedure InicializaPainel;
var i: integer;
begin
  Atv3Form.EdtAndar.Text := 'Aguarde';                     //Muda o texto informado no painel Interno
  DesabilitaAndares(False);                                //Desabilita botões dos Andares
  for i := Low(ListaEspera) to High(ListaEspera) do        //Percorre o array com os andares selecionados
  begin
    ControlaElevador(ListaEspera[i]);                      //Aciona o controlador do Elevador para cada andar acionado
    Sleep(5000);                                           //Tempo de espera entre cada andar = 5 segundos
  end;
  SetLength(ListaEspera, 0);                               //Zera os valores do array do Painel Interno
  DesabilitaAndares(True);                                 //Habilita os botões dos Andares
end;

procedure DesabilitaPainel(Habilita: Boolean);             //Procedure para Habilitar/Desabilitar Painel Interno
begin
  Atv3Form.BtnElev0.Enabled := Habilita;
  Atv3Form.BtnElev1.Enabled := Habilita;
  Atv3Form.BtnElev2.Enabled := Habilita;
  Atv3Form.BtnElev3.Enabled := Habilita;
  Atv3Form.PanelElevador.Enabled := Habilita;
end;

procedure DesabilitaAndares(Habilita: Boolean);           //Procedure para Habilitar/Desabilitar botões dos andares
begin
  Atv3Form.BtnAndar0.Enabled := Habilita;
  Atv3Form.BtnAndar1.Enabled := Habilita;
  Atv3Form.BtnAndar2.Enabled := Habilita;
  Atv3Form.BtnAndar3.Enabled := Habilita;
  Atv3Form.PanelPredio.Enabled := Habilita;
end;

procedure TAtv3Form.ElevadorChange(Sender: TObject);     //Ao mudar a posição do elevador, reinicializa o Timer para voltar para Andar 0
begin
  Timer.Enabled := False;
  Timer.Interval := 15000;
  Timer.Enabled := True;
end;

procedure TAtv3Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Atv3Form.MediaPlayerDing.Destroy;
  Atv3Form.Timer.Destroy;
end;

procedure TAtv3Form.TimerTimer(Sender: TObject);         //Ao terminar o prazo do Timer, aciona o elevador para retornar ao Andar 0;
begin
  Atv3Form.MediaPlayerDing.Close;
  InicializaElevador(Atv3Form.Elevador.Position, 100);
  DesabilitaPainel(False);
  Timer.Enabled := False;
end;

end.
