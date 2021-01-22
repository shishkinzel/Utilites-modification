object FResource: TFResource
  Left = 0
  Top = 0
  Caption = #1056#1077#1089#1091#1088#1089#1099
  ClientHeight = 662
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splBottom: TSplitter
    Left = 0
    Top = 549
    Width = 984
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 478
    ExplicitWidth = 982
  end
  object splTop: TSplitter
    Left = 0
    Top = 65
    Width = 984
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -8
    ExplicitTop = 89
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 65
    Align = alTop
    TabOrder = 0
    object dbnvgrTop: TDBNavigator
      Left = 1
      Top = 39
      Width = 982
      Height = 25
      DataSource = dsTable
      Align = alBottom
      TabOrder = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 552
    Width = 984
    Height = 110
    Align = alBottom
    TabOrder = 1
    object lblBottom: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 16
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtBottom: TEdit
      Left = 72
      Top = 16
      Width = 145
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlMiddle: TPanel
    Left = 0
    Top = 68
    Width = 984
    Height = 481
    Align = alClient
    TabOrder = 2
    object dbgrdResource: TDBGrid
      Left = 1
      Top = 1
      Width = 982
      Height = 479
      Align = alClient
      DataSource = dsTable
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Resource'
          Title.Alignment = taCenter
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WWW'
          Title.Alignment = taCenter
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Login'
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Passoword'
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Comment'
          Title.Alignment = taCenter
          Width = 265
          Visible = True
        end>
    end
  end
  object dsTable: TDataSource
    DataSet = fdmtblTop
    Left = 48
  end
  object fdmtblTop: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Date'
        DataType = ftDate
      end
      item
        Name = 'Resource'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'WWW'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'Login'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Passoword'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Comment'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 8
    object fdmtblTopID: TFDAutoIncField
      Alignment = taCenter
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'ID'
      KeyFields = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere]
      AutoIncrementSeed = 1
      AutoIncrementStep = 1
      IdentityInsert = True
    end
    object fdmtblTopDate: TDateField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'Date'
      KeyFields = 'Date'
    end
    object fdmtblTopResource: TStringField
      Alignment = taCenter
      DisplayLabel = #1056#1077#1089#1091#1088#1089
      DisplayWidth = 20
      FieldName = 'Resource'
      KeyFields = 'Resource'
      Size = 45
    end
    object fdmtblTopWWW: TStringField
      Alignment = taCenter
      DisplayLabel = #1040#1076#1088#1077#1089' '#1089#1072#1081#1090#1072
      DisplayWidth = 25
      FieldName = 'WWW'
      KeyFields = 'WWW'
      Size = 45
    end
    object fdmtblTopLogin: TStringField
      Alignment = taCenter
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'Login'
      KeyFields = 'Login'
      Size = 30
    end
    object fdmtblTopPassoword: TStringField
      Alignment = taCenter
      DisplayLabel = #1055#1072#1088#1086#1083#1100
      FieldName = 'Passoword'
      KeyFields = 'Passoword'
      Size = 30
    end
    object fdmtblTopComment: TStringField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'Comment'
      KeyFields = 'Comment'
    end
  end
end
