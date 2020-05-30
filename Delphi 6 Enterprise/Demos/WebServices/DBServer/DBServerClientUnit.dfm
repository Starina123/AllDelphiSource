object ClientForm: TClientForm
  Left = 164
  Top = 58
  Width = 726
  Height = 376
  Caption = 'WebServices DB Client'
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
  TextHeight = 16
  object Label1: TLabel
    Left = 51
    Top = 25
    Width = 74
    Height = 20
    HelpType = htKeyword
    Caption = 'Input SQL'
    FocusControl = Edit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 136
    Top = 23
    Width = 316
    Height = 24
    TabOrder = 0
    Text = 'select * from EMPLOYEE'
    OnKeyPress = Edit1KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 17
    Top = 90
    Width = 696
    Height = 255
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button3: TButton
    Left = 473
    Top = 23
    Width = 92
    Height = 31
    Caption = '&Update'
    TabOrder = 2
    OnClick = Button3Click
  end
  object DBNavigator1: TDBNavigator
    Left = 136
    Top = 56
    Width = 315
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    TabOrder = 3
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterInsert = ClientDataSet1AfterInsert
    AfterEdit = ClientDataSet1AfterEdit
    AfterPost = ClientDataSet1AfterPost
    AfterDelete = ClientDataSet1AfterDelete
    Left = 528
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 616
    Top = 24
  end
end
