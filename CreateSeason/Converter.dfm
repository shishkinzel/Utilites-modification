object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Converter to KODI'
  ClientHeight = 641
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    535
    641)
  PixelsPerInch = 96
  TextHeight = 13
  object LbNumEpisod: TLabel
    Left = 8
    Top = 48
    Width = 322
    Height = 18
    Caption = #1042#1085#1080#1084#1072#1085#1080#1077' !!! '#1050#1086#1085#1074#1077#1088#1090#1072#1094#1080#1103' '#1073#1091#1076#1077#1090' '#1089' '#1101#1087#1080#1079#1086#1076#1072' '#8470' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LbNumEp: TLabel
    Left = 336
    Top = 48
    Width = 5
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object ListBoxWind: TListBox
    Left = 8
    Top = 72
    Width = 379
    Height = 513
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 19
    ParentFont = False
    TabOrder = 0
  end
  object BtnSelectCase: TButton
    Left = 422
    Top = 167
    Width = 91
    Height = 25
    Hint = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1082#1086#1085#1074#1077#1088#1090#1072#1094#1080#1080' '#1092#1072#1081#1083#1086#1074
    Anchors = [akTop, akRight]
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1087#1072#1087#1082#1091
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
    OnClick = BtnSelectCaseClick
  end
  object BtnConverter: TButton
    Left = 418
    Top = 392
    Width = 95
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1085#1074#1077#1088#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 2
    Visible = False
    OnClick = BtnConverterClick
  end
  object PanelSorted: TPanel
    AlignWithMargins = True
    Left = 410
    Top = 215
    Width = 117
    Height = 57
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 3
    Visible = False
    DesignSize = (
      113
      53)
    object Label3: TLabel
      Left = 2
      Top = 2
      Width = 109
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 76
    end
    object BtnNo: TButton
      AlignWithMargins = True
      Left = 66
      Top = 20
      Width = 35
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1053#1077#1090
      TabOrder = 0
      OnClick = BtnNoClick
    end
    object BtnYes: TButton
      AlignWithMargins = True
      Left = 10
      Top = 20
      Width = 35
      Height = 23
      Caption = #1044#1072
      TabOrder = 1
      OnClick = BtnYesClick
    end
  end
  object PanelSeson: TPanel
    Left = 410
    Top = 288
    Width = 117
    Height = 81
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 4
    Visible = False
    DesignSize = (
      113
      77)
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 109
      Height = 41
      Align = alTop
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1089#1077#1079#1086#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ExplicitLeft = -5
      ExplicitTop = 1
      ExplicitWidth = 114
    end
    object EditSeson: TEdit
      Left = 33
      Top = 38
      Width = 49
      Height = 27
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EditSesonKeyPress
    end
  end
  object PanelExt: TPanel
    Left = 402
    Top = 48
    Width = 121
    Height = 110
    Anchors = [akTop, akRight]
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 5
    DesignSize = (
      117
      106)
    object Label1: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 107
      Height = 33
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077' '#1092#1072#1081#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      WordWrap = True
      ExplicitLeft = 0
      ExplicitWidth = 114
    end
    object ComboBoxExt: TComboBox
      Left = 20
      Top = 44
      Width = 76
      Height = 21
      Hint = #1042#1099#1073#1077#1088#1077#1090#1077' '#1090#1080#1087' '#1074#1080#1076#1077#1086#1092#1072#1081#1083#1072
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = #1042#1099#1073#1077#1088#1080
    end
    object BtnStart: TButton
      Left = 20
      Top = 71
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1077#1093#1072#1083#1080
      TabOrder = 1
      OnClick = BtnStartClick
    end
  end
  object PanelInformation: TPanel
    Left = 8
    Top = 8
    Width = 388
    Height = 34
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 6
    DesignSize = (
      384
      30)
    object BtnInformation: TButton
      Left = 12
      Top = 2
      Width = 70
      Height = 25
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Caption = #1057#1087#1088#1072#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnInformationClick
    end
    object BtnHelp: TButton
      Left = 92
      Top = 2
      Width = 70
      Height = 25
      Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Caption = #1055#1086#1084#1086#1097#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnHelpClick
    end
    object BtnAddExt: TButton
      Left = 174
      Top = 2
      Width = 75
      Height = 25
      Hint = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1072#1103' '#1085#1072#1095#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Anchors = [akTop, akRight]
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnAddExtClick
    end
    object BtnSer: TButton
      Left = 291
      Top = 2
      Width = 75
      Height = 25
      Hint = #1057' '#1082#1072#1082#1086#1081' '#1089#1077#1088#1080#1080' '#1085#1072#1095#1072#1090#1100' '#1082#1086#1085#1074#1077#1088#1090#1072#1094#1080#1102
      Anchors = [akTop, akRight]
      Caption = #1057#1077#1088#1080#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnSerClick
    end
  end
  object PanelControl: TPanel
    Left = 8
    Top = 596
    Width = 340
    Height = 37
    Anchors = [akLeft, akBottom]
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 7
    DesignSize = (
      336
      33)
    object BtnQuit: TButton
      Left = 240
      Top = 2
      Width = 75
      Height = 25
      Hint = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
      Anchors = [akLeft, akBottom]
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnQuitClick
    end
    object BtnReset: TButton
      Left = 20
      Top = 2
      Width = 75
      Height = 25
      Hint = #1057#1073#1088#1086#1089#1080#1090#1100' '#1074#1089#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      Anchors = [akLeft, akBottom]
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BtnResetClick
    end
    object BtnCancel: TButton
      Left = 130
      Top = 2
      Width = 75
      Height = 25
      Hint = #1042#1074#1077#1089#1090#1080' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077' '#1079#1072#1085#1086#1074#1086
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BtnCancelClick
    end
  end
  object PanelSettingCustom: TPanel
    Left = 402
    Top = 439
    Width = 119
    Height = 82
    Anchors = [akRight, akBottom]
    TabOrder = 8
    object Label4: TLabel
      Left = -2
      Top = 8
      Width = 123
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object ChBoxSetCustom: TCheckBox
      Left = 14
      Top = 47
      Width = 97
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = #1042#1082#1083#1102#1095#1077#1085#1099
      Ctl3D = True
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
  end
  object PanelDefault: TPanel
    Left = 402
    Top = 540
    Width = 119
    Height = 90
    Anchors = [akRight, akBottom]
    TabOrder = 9
    object Label5: TLabel
      Left = 24
      Top = 4
      Width = 68
      Height = 48
      Alignment = taCenter
      Caption = #1057#1073#1088#1086#1089' '#1082' '#1079#1072#1074#1086#1076#1089#1082#1080#1084' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object BitBtnResetDefault: TBitBtn
      Left = 43
      Top = 58
      Width = 35
      Height = 25
      Align = alCustom
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000CFD3D802E1EBF405D9E5F108DAE6F208E1EC
        F505C3C8CD010000000000000000000000000000000000000000000000000000
        000000000000272B2F017A8E9F1787ACC6827DA9C5CE76A3BDF277A4BEED7AA6
        C1C380A6C370657B900B00000000000000000000000000000000000000000000
        0000363D42017C9AB04D79B1CEEB74AFCBFD5E8FA7FE548196FE528095FE5583
        99FE5C8EA5FD6896B1DB6989A2311E252C010000000000000000000000000000
        00007692A74572AAC9F85990ADFE487690FE426C84FF3F667DFF3D6378FF3E64
        78FF426D81FE48788EFE608FA8EA618098250000000000000000000000005565
        740A6492AFE15289A8FE41708DFE3F6F8BFF5797B5FF44748EFF3C657CFF416D
        83FF41758CFF3E7690FE3E6F85FE6390A8BC4051610100000000000000006482
        985F5085A5FD407190FE3B6A87FF427A98FF7ECFEBFF8FDDF5FF61A4BFFF4175
        91FF3F7793FF3B728DFF3B6A81FE538DA5FB5E7D95320000000014191E01577C
        95A1467695FE3A6886FF3A6782FF3E6C86FF645963FF728393FF76C5E1FF53A7
        CFFF356C8BFF34657FFF3C6A80FE4B8BA3FD6089A27500000000141A20015078
        91BB427190FE396581FF3C6880FF3D667DFF2F2B30FF3D363CFF413E47FF2C52
        67FF1F455DFF305C76FF407087FF45859FFD57839D900E1316010F1418014E73
        8BB1406E8EFE3B667FFF457089FF3C6680FF2F2C31FF302D33FF2C2B31FF2222
        28FF223745FF38647DFF42768FFF3C7B97FD50778F830C10140106070A014763
        767F437190FD416C86FE487692FF38617EFF36333AFF39373EFF373D47FF3756
        6CFF3B667FFF427089FF407794FE3E7995FD4561755100000000000000003441
        4E2746708AF846728CFE417191FF376383FF383D46FF3E5365FF3D6680FF416C
        85FF47738CFF487793FE3E7394FE46758CE53545530A0000000000000000161B
        20013957688F4A7790FD4A789CFE5283A6FF588AABFF6397B5FF659AB8FF6297
        B5FF5C91B1FE5995B9FE5088A7FC3F5F735F171C210100000000000000000000
        00001B273006325365AC5D8DA6FDCAE7F4FED9F0FBFEDAF2FCFFD9F1FCFED9F1
        FBFEC0E5F5FE6AA3C2FC35596C8222313B010000000000000000000000000000
        000000000000132028032642516D54798CE2A2C2D2FCC6E1EDFDCCE5F0FDADCB
        D9FB628A9ED22B4C5D4E16252E01000000000000000000000000000000000000
        00000000000000000000050B0E01101F2605162730381A303C5B1B323E57182B
        342C13232B010000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 0
      OnClick = BitBtnResetDefaultClick
    end
  end
  object EditSer: TEdit
    Left = 402
    Top = 8
    Width = 55
    Height = 30
    Hint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1089#1077#1088#1080#1080' '#1089' '#1082#1086#1090#1086#1088#1086#1081' '#1085#1072#1095#1072#1090#1100' '#1082#1086#1085#1074#1077#1088#1090#1072#1094#1080#1102
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Visible = False
    OnKeyPress = EditSerKeyPress
  end
end
