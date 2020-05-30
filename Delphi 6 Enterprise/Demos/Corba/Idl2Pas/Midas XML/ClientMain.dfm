object Form1: TForm1
  Left = 203
  Top = 109
  Width = 511
  Height = 502
  Caption = 'Corba Database Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 15
    Width = 178
    Height = 13
    Caption = 'Enter a starting letter for the last name'
  end
  object Label2: TLabel
    Left = 17
    Top = 287
    Width = 68
    Height = 13
    Caption = 'The XML data'
  end
  object Button1: TButton
    Left = 13
    Top = 437
    Width = 111
    Height = 26
    Caption = 'Get Midas Data Pkt'
    TabOrder = 4
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 15
    Top = 60
    Width = 471
    Height = 224
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edtEmployeeName: TEdit
    Left = 17
    Top = 34
    Width = 55
    Height = 21
    TabOrder = 1
    Text = 'N'
  end
  object Button2: TButton
    Left = 147
    Top = 438
    Width = 111
    Height = 26
    Caption = 'Get XML Data'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 305
    Width = 471
    Height = 118
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object cdsEmployee: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 215
    Top = 15
  end
  object DataSource1: TDataSource
    DataSet = cdsEmployee
    Left = 255
    Top = 15
  end
end
