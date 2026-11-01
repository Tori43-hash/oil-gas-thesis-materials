object Form2: TForm2
  Left = 0
  Top = -4
  Width = 808
  Height = 572
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1072#1089#1095#1077#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Bevel1: TBevel
    Left = 400
    Top = 2
    Width = 389
    Height = 527
    Style = bsRaised
  end
  object Bevel2: TBevel
    Left = 10
    Top = 3
    Width = 389
    Height = 526
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 440
    Top = 384
    Width = 41
    Height = 16
    Caption = 'Label1'
    Visible = False
  end
  object hst: TMaskEdit
    Left = 256
    Top = 184
    Width = 112
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 0
    Text = '600.00'
  end
  object hg: TMaskEdit
    Left = 256
    Top = 232
    Width = 112
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 1
    Text = '005.00'
  end
  object ht: TMaskEdit
    Left = 256
    Top = 296
    Width = 112
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 2
    Text = '000.10'
  end
  object hh: TMaskEdit
    Left = 648
    Top = 88
    Width = 124
    Height = 39
    AutoSize = False
    EditMask = '!9999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 3
    Text = '1000.00'
  end
  object kk: TMaskEdit
    Left = 256
    Top = 88
    Width = 112
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 4
    Text = '001.00'
  end
  object nn: TMaskEdit
    Left = 256
    Top = 136
    Width = 112
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 5
    Text = '001.00'
  end
  object plotnost: TMaskEdit
    Left = 256
    Top = 40
    Width = 112
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 6
    Text = '900.00'
  end
  object lnasosa: TMaskEdit
    Left = 648
    Top = 40
    Width = 124
    Height = 39
    AutoSize = False
    EditMask = '!9999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 7
    ParentFont = False
    TabOrder = 7
    Text = '0003.00'
  end
  object StaticText1: TStaticText
    Left = 416
    Top = 40
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '   '#1044#1083#1080#1085#1072' '#1085#1072#1089#1086#1089#1072', '#1084
    TabOrder = 8
  end
  object StaticText2: TStaticText
    Left = 24
    Top = 184
    Width = 225
    Height = 41
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1057#1090#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1091#1088#1086#1074#1077#1085#1100', '#1084
    TabOrder = 9
  end
  object StaticText3: TStaticText
    Left = 24
    Top = 232
    Width = 225
    Height = 55
    AutoSize = False
    BevelKind = bkTile
    Caption = 
      '  '#1056#1072#1079#1085#1086#1089#1090#1100' '#1086#1090#1084#1077#1090#1086#1082' '#1089#1088#1077#1076#1085#1077#1075#1086' '#1091#1088#1086#1074#1085#1103' '#1078#1080#1076#1082#1086#1089#1090#1080' '#1074' '#1090#1088#1072#1087#1077' '#1086#1090' '#1091#1089#1090#1100#1103' '#1089#1082#1074 +
      #1072#1078#1080#1085#1099', '#1084
    TabOrder = 10
  end
  object StaticText4: TStaticText
    Left = 24
    Top = 296
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1044#1072#1074#1083#1077#1085#1080#1077' '#1074' '#1090#1088#1072#1087#1077', M'#1055#1072
    TabOrder = 11
  end
  object StaticText5: TStaticText
    Left = 416
    Top = 88
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1043#1083#1091#1073#1080#1085#1072' '#1089#1087#1091#1089#1082#1072' '#1085#1072#1089#1086#1089#1072' '
    TabOrder = 12
  end
  object StaticText6: TStaticText
    Left = 24
    Top = 88
    Width = 225
    Height = 41
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1088#1086#1076#1091#1082#1090#1080#1074#1085#1086#1089#1090#1080
    TabOrder = 13
  end
  object StaticText7: TStaticText
    Left = 24
    Top = 136
    Width = 225
    Height = 41
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1074' '#1087#1088#1080#1079#1072#1073#1086#1081#1085#1086#1081' '#1079#1086#1085#1077
    TabOrder = 14
  end
  object StaticText8: TStaticText
    Left = 24
    Top = 40
    Width = 225
    Height = 41
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1089#1082#1074#1072#1078#1080#1085#1085#1086#1081' '#1078#1080#1076#1082#1086#1089#1090#1080
    TabOrder = 15
  end
  object StaticText9: TStaticText
    Left = 24
    Top = 8
    Width = 361
    Height = 20
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1082#1074#1072#1078#1080#1085#1099
    Color = clLime
    ParentColor = False
    TabOrder = 16
  end
  object StaticText10: TStaticText
    Left = 417
    Top = 8
    Width = 360
    Height = 20
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1072#1089#1086#1089#1072
    Color = clLime
    ParentColor = False
    TabOrder = 17
  end
  object qskv: TStaticText
    Left = 24
    Top = 352
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1058#1088#1077#1073#1091#1077#1084#1072#1103' '#1087#1086#1076#1072#1095#1072', '#1084'     /'#1089#1091#1090
    TabOrder = 18
  end
  object StaticText11: TStaticText
    Left = 177
    Top = 353
    Width = 9
    Height = 15
    AutoSize = False
    Caption = '3'
    TabOrder = 19
  end
  object QZad: TMaskEdit
    Left = 256
    Top = 352
    Width = 111
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 20
    Text = '005.00'
  end
  object StaticText12: TStaticText
    Left = 408
    Top = 392
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1061#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072' '#1085#1072#1089#1086#1089#1072' '
    TabOrder = 21
  end
  object Button2: TButton
    Left = 656
    Top = 391
    Width = 129
    Height = 41
    Caption = #1042#1074#1086#1076
    TabOrder = 22
    OnClick = Button2Click
  end
  object StaticText13: TStaticText
    Left = 24
    Top = 400
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1042#1103#1079#1082#1086#1089#1090#1100' '#1087#1083#1072#1089#1090#1086#1074#1086#1081' '#1078#1080#1076#1082#1086#1089#1090#1080', '#1089
    TabOrder = 23
  end
  object mupl: TMaskEdit
    Left = 256
    Top = 400
    Width = 111
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 24
    Text = '010.00'
  end
  object StaticText14: TStaticText
    Left = 416
    Top = 136
    Width = 225
    Height = 39
    AutoSize = False
    BevelKind = bkTile
    Caption = '  '#1052#1072#1089#1089#1072' '#1085#1072#1089#1086#1089#1072', '#1082#1075'. '
    TabOrder = 25
  end
  object Masa: TMaskEdit
    Left = 648
    Top = 136
    Width = 121
    Height = 39
    AutoSize = False
    EditMask = '!999\.99;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 26
    Text = '060.00'
  end
end
