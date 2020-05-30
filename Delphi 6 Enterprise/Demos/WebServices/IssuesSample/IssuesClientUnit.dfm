object ClientForm: TClientForm
  Left = 253
  Top = 98
  Width = 344
  Height = 376
  Caption = 'Client Issues by Owner'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 37
    Width = 49
    Height = 13
    HelpType = htKeyword
    Caption = 'For &Owner'
    FocusControl = Edit1
  end
  object Edit1: TEdit
    Left = 104
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Brian Jones'
    OnKeyPress = Edit1KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 313
    Height = 145
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ISSUE_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Owner'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Opened'
        Visible = True
      end>
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 216
    Width = 313
    Height = 129
    DataField = 'Issue'
    DataSource = DataSource1
    TabOrder = 2
  end
  object Button3: TButton
    Left = 248
    Top = 32
    Width = 75
    Height = 25
    Caption = '&Update'
    TabOrder = 3
    OnClick = Button3Click
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'ISSUE_ID'
        Fields = 'ISSUE_ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexName = 'ISSUE_ID'
    Params = <>
    StoreDefs = True
    AfterInsert = ClientDataSet1AfterInsert
    AfterEdit = ClientDataSet1AfterEdit
    AfterPost = ClientDataSet1AfterPost
    AfterDelete = ClientDataSet1AfterDelete
    Left = 24
    Top = 8
    object ClientDataSet1ISSUE_ID: TIntegerField
      FieldName = 'ISSUE_ID'
      Required = True
    end
    object ClientDataSet1Owner: TStringField
      FieldName = 'Owner'
      Required = True
      Size = 25
    end
    object ClientDataSet1Date_Opened: TDateField
      FieldName = 'Date_Opened'
      Required = True
    end
    object ClientDataSet1Issue: TMemoField
      FieldName = 'Issue'
      BlobType = ftMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 56
    Top = 8
  end
end
