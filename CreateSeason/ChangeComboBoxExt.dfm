object ChangesComboBoxExt: TChangesComboBoxExt
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ChangeComboBoxExt'
  ClientHeight = 437
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 315
    Top = 30
    Width = 133
    Height = 16
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 324
    Top = 128
    Width = 124
    Height = 16
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MemoComboBox: TMemo
    Left = 32
    Top = 24
    Width = 137
    Height = 241
    TabOrder = 2
  end
  object BtnAdd: TButton
    Left = 486
    Top = 75
    Width = 125
    Height = 25
    Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1103
    Cancel = True
    Caption = #1055#1086#1077#1093#1072#1083#1080
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnAddClick
  end
  object EditAdd: TEdit
    Left = 486
    Top = 27
    Width = 125
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = EditAddKeyPress
  end
  object EditDelete: TEdit
    Left = 486
    Top = 125
    Width = 125
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = EditDeleteKeyPress
  end
  object BtnDelete: TButton
    Left = 490
    Top = 176
    Width = 121
    Height = 25
    Caption = #1055#1086#1077#1093#1072#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnDeleteClick
  end
  object BtnReset: TButton
    Left = 192
    Top = 224
    Width = 125
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnResetClick
  end
  object BtnApply: TButton
    Left = 486
    Top = 224
    Width = 125
    Height = 41
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1080#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    WordWrap = True
    OnClick = BtnApplyClick
  end
  object ButtonClear: TButton
    Left = 323
    Top = 224
    Width = 125
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonClearClick
  end
  object pnldown: TPanel
    Left = 0
    Top = 336
    Width = 635
    Height = 101
    Align = alBottom
    TabOrder = 8
    object lblPath: TLabel
      Left = 16
      Top = 13
      Width = 239
      Height = 16
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1095#1072#1083#1100#1085#1091#1102' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPath: TEdit
      Left = 16
      Top = 35
      Width = 601
      Height = 21
      TabOrder = 0
    end
    object btnCurrent: TButton
      Left = 16
      Top = 66
      Width = 125
      Height = 25
      Caption = #1054#1073#1079#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCurrentClick
    end
    object btnEnter: TButton
      Left = 260
      Top = 66
      Width = 125
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnEnterClick
    end
    object btnClose: TButton
      Left = 492
      Top = 66
      Width = 125
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
end
