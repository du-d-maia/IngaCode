object Atv3Form: TAtv3Form
  Left = 0
  Top = 0
  Anchors = [akRight]
  BorderStyle = bsDialog
  Caption = 'Simulador de Elevador'
  ClientHeight = 759
  ClientWidth = 865
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object PanelAtv3: TPanel
    Left = 0
    Top = 0
    Width = 865
    Height = 759
    Align = alClient
    Caption = 'PanelAtv3'
    ShowCaption = False
    TabOrder = 0
    object LabelAtv3: TLabel
      Left = 1
      Top = 1
      Width = 863
      Height = 88
      Align = alTop
      Alignment = taCenter
      Anchors = [akLeft, akRight]
      AutoSize = False
      Caption = 'Atividade 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object PanelPredio: TPanel
      Left = 1
      Top = 103
      Width = 465
      Height = 654
      Caption = 'Panel'
      ShowCaption = False
      TabOrder = 0
      object Bevel1: TBevel
        Left = 16
        Top = 16
        Width = 177
        Height = 625
      end
      object Andar3: TBevel
        Left = 208
        Top = 16
        Width = 193
        Height = 137
      end
      object Andar2: TBevel
        Left = 208
        Top = 175
        Width = 193
        Height = 137
      end
      object Andar1: TBevel
        Left = 208
        Top = 334
        Width = 193
        Height = 137
      end
      object Andar0: TBevel
        Left = 208
        Top = 494
        Width = 193
        Height = 137
      end
      object Elevador: TScrollBar
        Left = 16
        Top = 16
        Width = 169
        Height = 625
        Kind = sbVertical
        PageSize = 19
        Position = 100
        TabOrder = 0
        StyleElements = []
        OnChange = ElevadorChange
      end
      object BtnAndar3: TButton
        Left = 224
        Top = 56
        Width = 15
        Height = 49
        ImageAlignment = iaCenter
        Style = bsSplitButton
        TabOrder = 1
        StyleName = 'Windows'
        OnDropDownClick = BtnAndar3DropDownClick
      end
      object BtnAndar2: TButton
        Left = 224
        Top = 216
        Width = 15
        Height = 49
        ImageAlignment = iaCenter
        Style = bsSplitButton
        TabOrder = 2
        StyleName = 'Windows'
        OnDropDownClick = BtnAndar2DropDownClick
      end
      object BtnAndar1: TButton
        Left = 224
        Top = 376
        Width = 15
        Height = 49
        ImageAlignment = iaCenter
        Style = bsSplitButton
        TabOrder = 3
        StyleName = 'Windows'
        OnDropDownClick = BtnAndar1DropDownClick
      end
      object BtnAndar0: TButton
        Left = 224
        Top = 536
        Width = 15
        Height = 49
        ImageAlignment = iaCenter
        Style = bsSplitButton
        TabOrder = 4
        StyleName = 'Windows'
        OnDropDownClick = BtnAndar0DropDownClick
      end
    end
    object PanelElevador: TPanel
      Left = 472
      Top = 103
      Width = 385
      Height = 654
      Caption = 'Panel'
      Enabled = False
      Locked = True
      ShowCaption = False
      TabOrder = 1
      object BtnElev0: TButton
        Left = 48
        Top = 312
        Width = 145
        Height = 63
        Caption = '0'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Yu Gothic'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtnElev0Click
      end
      object EdtAndar: TEdit
        Left = 48
        Top = 107
        Width = 305
        Height = 40
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object BtnElev1: TButton
        Left = 208
        Top = 312
        Width = 145
        Height = 63
        Caption = '1'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Yu Gothic'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BtnElev1Click
      end
      object BtnElev2: TButton
        Left = 48
        Top = 235
        Width = 145
        Height = 63
        Caption = '2'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Yu Gothic'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnElev2Click
      end
      object BtnElev3: TButton
        Left = 208
        Top = 235
        Width = 145
        Height = 63
        Caption = '3'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Yu Gothic'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BtnElev3Click
      end
    end
    object MediaPlayerDing: TMediaPlayer
      Left = 736
      Top = 28
      Width = 57
      Height = 30
      Enabled = False
      EnabledButtons = []
      VisibleButtons = [btPlay, btStop]
      AutoOpen = True
      AutoRewind = False
      DoubleBuffered = True
      FileName = 'D:\Delphi\Projects\IngaCode\IngaCodeTeste\ding.mp3'
      Visible = False
      ParentDoubleBuffered = False
      TabOrder = 2
      TabStop = False
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimerTimer
    Left = 824
    Top = 16
  end
end
