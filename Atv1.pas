unit Atv1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls;

type
  TAtv1Form = class(TForm)
    PainelAtv1: TPanel;
    LabelAtv1: TLabel;
    EdtValor: TEdit;
    LblAtv1: TLabel;
    BtnConvert: TButton;
    LblResposta: TLabel;
    ChkDinamico: TCheckBox;
    PanelRegras: TPanel;
    MemoRegras: TMemo;
    LblResult: TLabel;
    SwitchDecimalRomano: TToggleSwitch;
    LblSwitch: TLabel;
    procedure BtnConvertClick(Sender: TObject);
    procedure EdtValorChange(Sender: TObject);
    procedure SwitchDecimalRomanoClick(Sender: TObject);
  private
    { Private declarations }
    ContaRepetM, ContaRepetD, ContaRepetC, ContaRepetL, ContaRepetX, ContaRepetV, ContaRepetI: Integer;
  public
    { Public declarations }
  end;

var
  Atv1Form: TAtv1Form;
  function ConverterRomanoDecimal(StrValor : String): String;
  function ValidaSintaxeRomana(Valor: integer; Proximo: integer): Integer;
  function ConverterDecimalRomano(StrValor : String): String;
implementation

{$R *.dfm}

procedure TAtv1Form.BtnConvertClick(Sender: TObject);                //Clicar no botão Converter
begin
  if not (EdtValor.Text = EmptyStr) then                             //Valida se o campo informado pelo usuário está vazio
  begin
      if SwitchDecimalRomano.State = tssOff  then
      begin
        LblResposta.Caption := ConverterRomanoDecimal(EdtValor.Text) //Texto na tela recebe o resultado da conversão do texto para decimal
      end
      else if SwitchDecimalRomano.State = tssOn then
      begin
        LblResposta.Caption := ConverterDecimalRomano(EdtValor.Text) //Texto na tela recebe o resultado da conversão do texto para romano
      end;
  end;
end;


function ConverterRomanoDecimal(StrValor: String): String;
var
  ValorDecim, i: Integer;
  Valores: array of integer;
begin
  //Zera todos os valores e contadores
  ValorDecim  := 0;
  SetLength(Valores, StrValor.Length);
  Atv1Form.ContaRepetM := 0;
  Atv1Form.ContaRepetD := 0;
  Atv1Form.ContaRepetC := 0;
  Atv1Form.ContaRepetL := 0;
  Atv1Form.ContaRepetX := 0;
  Atv1Form.ContaRepetV := 0;
  Atv1Form.ContaRepetI := 0;


  //Verifica cada caractere da String do texto enviado pelo usuário
  for i := 1 to StrValor.Length do
  begin
    if StrValor[i] = 'M' then
    begin
      Valores[i-1] := 1000;          //Atribui o valor correspontente do caractere romano a um array;
    end

    else if StrValor[i] = 'D' then
    begin
      Valores[i-1] := 500;
    end

    else if StrValor[i] = 'C' then
    begin
      Valores[i-1] := 100;
    end

    else if StrValor[i] = 'L' then
    begin
      Valores[i-1] := 50;
    end

    else if StrValor[i] = 'X' then
    begin
      Valores[i-1] := 10;
    end

    else if StrValor[i] = 'V' then
    begin
      Valores[i-1] := 5;
    end

    else if StrValor[i] = 'I' then
    begin
      Valores[i-1] := 1;
    end

    else  //Aviso de erro se houver caracteres inválidos no texto
      raise Exception.Create('Caractere Inválido Informado: ' + StrValor[i]);


  end;

  for i := Low(Valores) to High(Valores) do                        //Percorre o Array com os valores
  begin
    if i+1 <= High(Valores) then                                   //Valida se exite um valor além do atual dentro do Array
      Valores[i] := ValidaSintaxeRomana(Valores[i], Valores[i+1]); //Compara o valor atual com o próximo valor dentro do Array

    ValorDecim := ValorDecim + Valores[i];                         //Atribui o valor atual do Array à soma do valor final em Decimal
  end;

  Result := ValorDecim.ToString;                                   //Retorna o valor total em Decimal
end;

function ValidaSintaxeRomana(Valor: integer; Proximo: integer): Integer;
begin
  if (Valor < Proximo) then                                                        //Compara os valores para verificar se haverá soma ou subtração
  begin
    if (Valor = 1) and (Proximo in [5, 10]) and (Atv1Form.ContaRepetI <= 1) then   //Valida as regras de subtração dos Algarismos Romanos
    begin
      Atv1Form.ContaRepetI := 5;
      Result := -1;
      Exit;
    end
    else if (Valor = 10) and (Proximo in [50, 100]) then
    begin
      Atv1Form.ContaRepetX := 5;
      Result := -10;
      Exit;
    end
    else if (Valor = 100) and ((Proximo = 500) or (Proximo = 1000)) then
    begin
      Atv1Form.ContaRepetC := 5;
      if Proximo = 1000 then
        Atv1Form.ContaRepetM := 4;
      if Proximo = 500 then
        Atv1Form.ContaRepetM := 4;
      Result := -100;
      Exit;
    end
    else //Mostra aviso se há erro de sintaxe
      raise Exception.Create('Sintaxe Inválida Informada!')
    end

  else if Valor = 1 then
  begin
    inc(Atv1Form.ContaRepetI);         //Incrementa a contagem dos algarismos
  end;
  if Proximo = 1 then                 //Sempre verificar o valor atual e o próximo
  begin
    inc(Atv1Form.ContaRepetI);        //Cumprir as regras de posicionamento dos algarismos
    Atv1Form.ContaRepetM := 4;        //Após o I apenas X e V podem surgir e apenas 1 vez;
    Atv1Form.ContaRepetD := 2;
    Atv1Form.ContaRepetC := 4;
    Atv1Form.ContaRepetL := 2;
    Atv1Form.ContaRepetX := 3;
  end;

  if Valor = 5 then                   //V apenas 1 vez;
    inc(Atv1Form.ContaRepetV);
  if Proximo = 5 then
    inc(Atv1Form.ContaRepetV);
  if (Valor = 5) and (Proximo = 5) then
    inc(Atv1Form.ContaRepetV);

  if Valor = 10 then                 //X até 3 vezes em sequência, se houver IX é permitido aparecer mais 1 vez
  begin
    inc(Atv1Form.ContaRepetX);
    Atv1Form.ContaRepetM := 5;
    Atv1Form.ContaRepetD := 2;
    if Proximo = 1 then
      dec(Atv1Form.ContaRepetI)
  end;
  if Proximo = 10 then
    inc(Atv1Form.ContaRepetX);

  if Valor = 50 then                            //L apenas 1 vez
  begin
    inc(Atv1Form.ContaRepetL);
    if Proximo = 10 then
      dec(Atv1Form.ContaRepetX);                //Corrige a contagem de X
  end;
  if Proximo = 50 then
    inc(Atv1Form.ContaRepetL);
  if (Valor = 50) and (Proximo = 50) then       //Caso L se repita força o erro na validação final
      inc(Atv1Form.ContaRepetL);

  if (Valor = 100) then                         //C até 3 vezes
  begin
    inc(Atv1Form.ContaRepetC);
    if Proximo = 10 then
      dec(Atv1Form.ContaRepetX);                //Corrige a contagem de X
  end;
  if Proximo = 100 then
    inc(Atv1Form.ContaRepetC);

  if Valor = 500 then                          //D apenas 1 vez
  begin
    inc(Atv1Form.ContaRepetD);
    if Proximo = 100 then
      dec(Atv1Form.ContaRepetC);              //Corrige a contagem de C
  end;
  if Proximo = 500 then
    inc(Atv1Form.ContaRepetD);
   if (Valor = 500) and (Proximo = 500) then  //Caso D se repita força o erro na validação final
    inc(Atv1Form.ContaRepetD);

  if (Valor = 1000) then                      //M até 3 vezes
  begin
    inc(Atv1Form.ContaRepetM);
    if Proximo = 100 then
      dec(Atv1Form.ContaRepetC);              //Corrige a contagem de C
  end;
  if Proximo = 1000 then
      inc(Atv1Form.ContaRepetM);

  if (Atv1Form.ContaRepetM > 5) or (Atv1Form.ContaRepetD > 2) or //Verifica a contagem dos algarismos
     (Atv1Form.ContaRepetC > 5) or (Atv1Form.ContaRepetL > 2) or
     (Atv1Form.ContaRepetX > 5) or (Atv1Form.ContaRepetV > 2) or
     (Atv1Form.ContaRepetI > 5) then
  begin
    raise Exception.Create('Quantidade de caracteres repetidos excedeu o limite!') ;
    Result := 0;
  end;

  Result := Valor;
end;

function ConverterDecimalRomano(StrValor : String): String;
const
  Romano: array[1..13] of string = ( 'I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M' );
  Decimal: array[1..13] of Integer = ( 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
var
  i, Valor: integer;
begin
  Result := '';
  Valor := StrValor.ToInteger;
  if Valor >= 4000 then
  begin
    raise Exception.Create('Valor informado excedeu o limite! (3999)') ;
    Exit;
  end;
  for i := 13 downto 1 do
  begin
    while (Valor >= Decimal[i]) do
    begin
      Valor := Valor - Decimal[i];
      Result := Result + Romano[i];
    end;
  end;
end;

procedure TAtv1Form.EdtValorChange(Sender: TObject);
begin
  if ChkDinamico.Checked and not (EdtValor.Text = EmptyStr) then  //Verifica se está em Conversão Dinâmica
  begin
    if SwitchDecimalRomano.State = tssOff  then
    begin
      LblResposta.Caption := ConverterRomanoDecimal(EdtValor.Text) //Texto na tela recebe o resultado da conversão do texto para decimal
    end
    else if SwitchDecimalRomano.State = tssOn then
    begin
      LblResposta.Caption := ConverterDecimalRomano(EdtValor.Text) //Texto na tela recebe o resultado da conversão do texto para romano
    end;
  end;
  if EdtValor.Text = EmptyStr then
    LblResposta.Caption := '0';
end;

procedure TAtv1Form.SwitchDecimalRomanoClick(Sender: TObject);
begin
  if SwitchDecimalRomano.State = tssOff  then
  begin
    EdtValor.MaxLength := 15;
    EdtValor.NumbersOnly := False;
  end
  else if SwitchDecimalRomano.State = tssOn then
  begin
    EdtValor.MaxLength := 4;
    EdtValor.NumbersOnly := True;
  end;
  EdtValor.Text := '';
end;

end.
