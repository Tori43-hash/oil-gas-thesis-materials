object Form1: TForm1
  Left = -4
  Top = -4
  Width = 808
  Height = 572
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1088#1077#1076#1091#1082#1090#1086#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 393
    Height = 225
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 8
    Top = 256
    Width = 393
    Height = 273
    Style = bsRaised
  end
  object SB1: TSpeedButton
    Left = 424
    Top = 8
    Width = 361
    Height = 33
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1101#1089#1082#1080#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    OnClick = SB1Click
  end
  object Bevel3: TBevel
    Left = 424
    Top = 88
    Width = 361
    Height = 153
    Style = bsRaised
  end
  object SB2: TSpeedButton
    Left = 424
    Top = 496
    Width = 361
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083' [*.dfx]'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    OnClick = SB2Click
  end
  object Label1: TLabel
    Left = 488
    Top = 96
    Width = 239
    Height = 25
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1096#1077#1089#1090#1077#1088#1085#1080
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Bevel4: TBevel
    Left = 424
    Top = 264
    Width = 361
    Height = 153
    Style = bsRaised
  end
  object Label2: TLabel
    Left = 488
    Top = 272
    Width = 208
    Height = 25
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1086#1083#1077#1089#1072
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object t_N_dv: TMaskEdit
    Left = 256
    Top = 32
    Width = 122
    Height = 39
    AutoSize = False
    EditMask = '!9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 0
    Text = '5000'
  end
  object t_nn_dv: TMaskEdit
    Left = 256
    Top = 80
    Width = 123
    Height = 39
    AutoSize = False
    EditMask = '!9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 1
    Text = '1440'
  end
  object t_h1: TMaskEdit
    Left = 256
    Top = 127
    Width = 123
    Height = 39
    AutoSize = False
    EditMask = '!999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
    Text = '285'
  end
  object t_h2: TMaskEdit
    Left = 256
    Top = 175
    Width = 123
    Height = 39
    AutoSize = False
    EditMask = '!999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 3
    Text = '248'
  end
  object qskv: TStaticText
    Left = 16
    Top = 31
    Width = 233
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1052#1086#1097#1085#1086#1089#1090#1100' '#1076#1074#1080#1075#1072#1090#1077#1083#1103#1073' ,'#1042#1090
    TabOrder = 4
  end
  object StaticText1: TStaticText
    Left = 16
    Top = 79
    Width = 233
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '   '#1063#1072#1089#1090#1086#1090#1072' '#1074#1088#1072#1097#1077#1085#1080#1103' '#1076#1074#1080#1075#1072#1090#1077#1083#1103', '#1086#1073'/'#1084#1080#1085
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 16
    Top = 127
    Width = 233
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1058#1074#1077#1088#1076#1086#1089#1090#1100' '#1096#1077#1089#1090#1077#1088#1085#1080', '#1053#1042
    TabOrder = 6
  end
  object StaticText3: TStaticText
    Left = 16
    Top = 175
    Width = 233
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1058#1074#1077#1088#1076#1086#1089#1090#1100' '#1082#1086#1083#1077#1089#1072', '#1053#1042
    TabOrder = 7
  end
  object VLE1: TValueListEditor
    Tag = 4
    Left = 448
    Top = 128
    Width = 306
    Height = 97
    ScrollBars = ssNone
    TabOrder = 8
    TitleCaptions.Strings = (
      #1055#1072#1088#1072#1084#1077#1090#1088
      #1047#1085#1072#1095#1077#1085#1080#1077)
  end
  object VLE2: TValueListEditor
    Tag = 4
    Left = 448
    Top = 304
    Width = 306
    Height = 97
    ScrollBars = ssNone
    TabOrder = 9
    TitleCaptions.Strings = (
      #1055#1072#1088#1072#1084#1077#1090#1088
      #1047#1085#1072#1095#1077#1085#1080#1077)
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.dxf|*.dxf'
    Left = 224
    Top = 216
  end
end
