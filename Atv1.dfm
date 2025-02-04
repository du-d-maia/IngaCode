object Atv1Form: TAtv1Form
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Conversor de Algarismos Romanos'
  ClientHeight = 347
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PainelAtv1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 712
    Height = 341
    Align = alClient
    AutoSize = True
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    object LabelAtv1: TLabel
      Left = 1
      Top = 1
      Width = 710
      Height = 38
      Align = alTop
      Alignment = taCenter
      Anchors = [akLeft, akRight]
      Caption = 'Atividade 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 203
    end
    object LblAtv1: TLabel
      Left = 153
      Top = 91
      Width = 81
      Height = 15
      Caption = 'Insira um valor:'
    end
    object LblResposta: TLabel
      Left = 272
      Top = 125
      Width = 15
      Height = 32
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblResult: TLabel
      Left = 182
      Top = 139
      Width = 55
      Height = 15
      Caption = 'Resultado:'
    end
    object LblSwitch: TLabel
      Left = 450
      Top = 149
      Width = 81
      Height = 15
      Caption = 'Converter para:'
    end
    object EdtValor: TEdit
      Left = 272
      Top = 88
      Width = 161
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      TabOrder = 0
      OnChange = EdtValorChange
    end
    object BtnConvert: TButton
      Left = 456
      Top = 87
      Width = 75
      Height = 25
      Caption = 'Converter'
      TabOrder = 1
      OnClick = BtnConvertClick
    end
    object ChkDinamico: TCheckBox
      Left = 560
      Top = 91
      Width = 121
      Height = 17
      Caption = 'C'#225'lculo Din'#226'mico'
      TabOrder = 2
    end
    object PanelRegras: TPanel
      Left = 1
      Top = 187
      Width = 710
      Height = 153
      Align = alBottom
      ShowCaption = False
      TabOrder = 3
      object MemoRegras: TMemo
        Left = 1
        Top = 1
        Width = 708
        Height = 151
        Align = alClient
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        Lines.Strings = (
          'Regras dos Algarismos Romanos:'
          ''
          '-> I = 1 | V = 5 | X -10 | L = 50 | C = 100 |D = 500 | M = 1000;'
          
            '-> Quando o algarismo '#224' esquerda '#233' maior ou quando se repete, so' +
            'ma-se os valores;'
          
            '-> S'#243' podem repetir-se os algarismos I, X, C e M em at'#233' 3 vezes ' +
            'em sequ'#234'ncia;'
          
            '-> Os algarismos I, X e C podem tornar-se negativos em situa'#231#245'es' +
            ' expec'#237'ficas;'
          '-> O algarismo I s'#243' pode ficar '#224' esquerda para subtrair V ou X;'
          '-> O algarismo X s'#243' pode ficar '#224' esquerda para subtrair L ou C;'
          '-> O algarismo C s'#243' pode ficar '#224' esquerda para subtrair D ou M;')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object SwitchDecimalRomano: TToggleSwitch
      Left = 560
      Top = 149
      Width = 101
      Height = 20
      StateCaptions.CaptionOn = 'Romano'
      StateCaptions.CaptionOff = 'Decimal'
      TabOrder = 4
      OnClick = SwitchDecimalRomanoClick
    end
  end
end
