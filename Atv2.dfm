object Atv2Form: TAtv2Form
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Gerador de Senha'
  ClientHeight = 281
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PainelAtv2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 542
    Height = 275
    Align = alClient
    AutoSize = True
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = -2
    ExplicitTop = -2
    object LabelAtv2: TLabel
      Left = 1
      Top = 1
      Width = 540
      Height = 48
      Align = alTop
      Alignment = taCenter
      Anchors = [akLeft, akRight]
      Caption = 'Atividade 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object LblAtv1: TLabel
      Left = 34
      Top = 72
      Width = 245
      Height = 20
      Caption = 'Selecione as caracter'#237'sticas da senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LblCaracteres: TLabel
      Left = 60
      Top = 114
      Width = 154
      Height = 17
      Caption = 'Quantidade de caracteres:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EdtSenha: TEdit
      Left = 192
      Top = 208
      Width = 169
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object BtnGerar: TButton
      Left = 87
      Top = 207
      Width = 75
      Height = 25
      Caption = 'Gerar Senha'
      TabOrder = 1
      OnClick = BtnGerarClick
    end
    object ChkMaiuscula: TCheckBox
      Left = 329
      Top = 75
      Width = 147
      Height = 17
      Caption = 'Incluir letra mai'#250'scula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object QntChar: TSpinEdit
      Left = 238
      Top = 113
      Width = 41
      Height = 24
      MaxLength = 30
      MaxValue = 30
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object ChkMinuscula: TCheckBox
      Left = 329
      Top = 98
      Width = 147
      Height = 17
      Caption = 'Incluir letra min'#250'scula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object ChkNumero: TCheckBox
      Left = 329
      Top = 121
      Width = 147
      Height = 17
      Caption = 'Incluir n'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object ChkSimbolos: TCheckBox
      Left = 329
      Top = 144
      Width = 147
      Height = 17
      Caption = 'Incluir s'#237'mbolos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object BtnCopiar: TButton
      Left = 393
      Top = 207
      Width = 75
      Height = 25
      Caption = 'Copiar Senha'
      TabOrder = 7
      OnClick = BtnCopiarClick
    end
  end
end
