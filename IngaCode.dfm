object Principal: TPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Principal'
  ClientHeight = 773
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object PainelPrincipal: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1062
    Height = 767
    Align = alClient
    AutoSize = True
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      1062
      767)
    object LabelPrincipal: TLabel
      Left = 1
      Top = 1
      Width = 1060
      Height = 208
      Align = alTop
      Alignment = taCenter
      Anchors = [akLeft, akRight]
      AutoSize = False
      Caption = 'Atividades Desafio T'#233'cnico Ing'#225'Code'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object BtnAtv1: TButton
      Left = 120
      Top = 323
      Width = 233
      Height = 120
      Anchors = []
      Caption = 'Conversor de Romanos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BtnAtv1Click
    end
    object BtnAtv2: TButton
      Left = 416
      Top = 323
      Width = 257
      Height = 120
      Anchors = []
      Caption = 'Gerador de Senhas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAtv2Click
    end
    object BtnAtv3: TButton
      Left = 736
      Top = 323
      Width = 233
      Height = 120
      Anchors = []
      Caption = 'Simulador de Elevador'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtnAtv3Click
    end
  end
end
