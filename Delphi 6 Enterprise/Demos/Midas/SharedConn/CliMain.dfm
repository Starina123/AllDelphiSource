object Form2: TForm2
  Left = 193
  Top = 109
  Width = 508
  Height = 387
  Caption = 'SharedConnection Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblSessionName: TLabel
    Left = 280
    Top = 296
    Width = 3
    Height = 13
    HelpType = htKeyword
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 80
    Width = 465
    Height = 165
    DataSource = dsVendor
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 60
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Open CDS'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 288
    Width = 121
    Height = 25
    Caption = 'Get Child SessionName'
    TabOrder = 2
    OnClick = Button2Click
  end
  object dsVendor: TDataSource
    DataSet = cdsVendor
    Left = 16
    Top = 12
  end
  object cdsVendor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvVendors'
    RemoteServer = SharedConnection1
    Left = 44
    Top = 16
  end
  object DCOMConnection1: TDCOMConnection
    ServerGUID = '{43E4A51A-95EA-11D3-8DEA-006097319291}'
    ServerName = 'ShareServer.MainRDM'
    Left = 80
    Top = 16
  end
  object SharedConnection1: TSharedConnection
    ParentConnection = DCOMConnection1
    ChildName = 'ChildDM'
    Left = 84
    Top = 52
  end
end
