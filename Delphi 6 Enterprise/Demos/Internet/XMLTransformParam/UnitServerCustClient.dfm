object FormServerCustClient: TFormServerCustClient
  Left = 176
  Top = 180
  Width = 698
  Height = 614
  Caption = 'Example2'
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
    Width = 690
    Height = 587
    Align = alClient
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 13
      Width = 444
      Height = 20
      HelpType = htKeyword
      Caption = 'Example using   TXMLTransformClient, with Parameters'
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
      Width = 170
      Height = 16
      HelpType = htKeyword
      Caption = 'Source  Table : Customer.db'
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
      Width = 358
      Height = 13
      HelpType = htKeyword
      Caption = 
        'Publishes a database table as Xml using  parameters  from an Xml' +
        ' document'
    end
    object Memo2: TMemo
      Left = 16
      Top = 364
      Width = 342
      Height = 189
      Lines.Strings = (
        '')
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object ButtonPublishXml: TButton
      Left = 20
      Top = 325
      Width = 78
      Height = 20
      Caption = 'Publish Xml'
      TabOrder = 1
      OnClick = ButtonPublishXmlClick
    end
    object Memo3: TMemo
      Left = 377
      Top = 364
      Width = 288
      Height = 189
      Lines.Strings = (
        '<CustomerParams>'
        '    <MinimumCustomerNumber>2000</MinimumCustomerNumber>'
        '    <MaximumCustomerNumber>3000</MaximumCustomerNumber>'
        '</CustomerParams>')
      ScrollBars = ssBoth
      TabOrder = 2
    end
    object ButtonPublishParams: TButton
      Left = 145
      Top = 325
      Width = 152
      Height = 20
      Caption = 'Publish Xml Using Parameters'
      TabOrder = 3
      OnClick = ButtonPublishParamsClick
    end
    object ButtonSaveXml: TButton
      Left = 360
      Top = 325
      Width = 92
      Height = 20
      Caption = 'Save Xml Result'
      TabOrder = 4
      OnClick = ButtonSaveXmlClick
    end
    object EditSaveXml: TEdit
      Left = 495
      Top = 325
      Width = 98
      Height = 21
      TabOrder = 5
      Text = 'ServerCustResult.xml'
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 111
      Width = 593
      Height = 189
      DataSource = DataSource1
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -10
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object XMLTransformClient1: TXMLTransformClient
    RemoteServer = DCOMConnection1
    ProviderName = 'DataSetProvider1'
    TransformGetData.TransformationFile = 'Customer_ToXml.xtr'
    TransformSetParams.TransformationFile = 'CustParams.xtr'
    Left = 112
    Top = 424
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 40
    Top = 136
  end
  object XMLTransformClient2: TXMLTransformClient
    RemoteServer = DCOMConnection1
    ProviderName = 'DataSetProvider2'
    TransformGetData.TransformationFile = 'Customer_ToXml.xtr'
    Left = 112
    Top = 464
  end
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{CD0930FC-14E7-468B-BB7A-069B3B861B0F}'
    ServerName = 'ServerCust.Customer_MinMax'
    Left = 48
    Top = 384
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    RemoteServer = DCOMConnection1
    Left = 112
    Top = 384
  end
end
