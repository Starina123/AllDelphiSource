object formMain: TformMain
  Left = 160
  Top = 95
  Width = 686
  Height = 597
  Caption = 'TXMLTransformClient'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 573
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 13
      Width = 342
      Height = 20
      HelpType = htKeyword
      Caption = 'Example of using   TXMLTransformClient'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 85
      Width = 91
      Height = 16
      HelpType = htKeyword
      Caption = 'Source  Table :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 285
      Height = 13
      HelpType = htKeyword
      Caption = 'Publishes a database table as Xml. Accepts Xml for updates.'
    end
    object Memo2: TMemo
      Left = 16
      Top = 364
      Width = 353
      Height = 189
      Lines.Strings = (
        '')
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Button1: TButton
      Left = 20
      Top = 325
      Width = 78
      Height = 20
      Caption = 'Publish  Xml'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Memo3: TMemo
      Left = 376
      Top = 364
      Width = 282
      Height = 189
      Lines.Strings = (
        '<Countries>'
        '    <Country Continent="Europe">          '
        '          <NameOfCountry>Denmark</NameOfCountry>'
        '          <Capital>Copenhagen</Capital>'
        '          <Area>25000</Area>'
        '          <Population>5000000</Population>'
        '   </Country>'
        '</Countries>')
      ScrollBars = ssBoth
      TabOrder = 2
    end
    object Button2: TButton
      Left = 377
      Top = 325
      Width = 72
      Height = 20
      Caption = 'Insert Row'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 156
      Top = 325
      Width = 72
      Height = 20
      Caption = 'Save Xml'
      TabOrder = 4
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 247
      Top = 325
      Width = 114
      Height = 21
      TabOrder = 5
      Text = 'XMLClientDemo.xml'
    end
    object Button4: TButton
      Left = 481
      Top = 325
      Width = 72
      Height = 20
      Caption = 'Delete Row'
      TabOrder = 6
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 528
      Top = 60
      Width = 61
      Height = 20
      Caption = 'ReadMe'
      TabOrder = 7
      OnClick = Button5Click
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 111
      Width = 641
      Height = 189
      DataSource = DataSource1
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object XMLTransformClient1: TXMLTransformClient
    ProviderName = 'DataSetProvider1'
    TransformGetData.TransformationFile = 'Country_ToXml.xtr'
    Left = 160
    Top = 368
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 48
    Top = 368
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 96
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 8
    Top = 368
  end
end
