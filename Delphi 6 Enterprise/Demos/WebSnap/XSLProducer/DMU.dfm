object WebDataModule1: TWebDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 150
  Width = 215
  object XMLBroker1: TXMLBroker
    Params = <>
    ProviderName = 'DataSetProvider1'
    WebDispatch.PathInfo = 'XMLBroker1'
    Left = 24
    Top = 72
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 104
    Top = 64
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 24
    Top = 16
  end
  object Session1: TSession
    Left = 112
    Top = 16
  end
end
