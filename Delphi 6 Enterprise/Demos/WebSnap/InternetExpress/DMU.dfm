object DM: TDM
  OldCreateOrder = False
  OnActivate = WebDataModuleActivate
  Left = 522
  Top = 152
  Height = 264
  Width = 313
  object XMLBrokerCountries: TXMLBroker
    Params = <>
    ProviderName = 'CountriesProvider'
    WebDispatch.PathInfo = 'XMLBrokerCountries'
    Left = 32
    Top = 32
  end
  object Countries: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_1'
    TableName = 'country.db'
    Left = 216
    Top = 24
  end
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 152
    Top = 32
  end
  object CountriesProvider: TDataSetProvider
    DataSet = Countries
    Constraints = True
    Left = 216
    Top = 96
  end
  object CountriesInContinent: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select * from country where continent = :continent')
    Left = 120
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'continent'
        ParamType = ptUnknown
        Value = 'North America'
      end>
  end
  object CountriesInContinentProvider: TDataSetProvider
    DataSet = CountriesInContinent
    Constraints = True
    Left = 144
    Top = 168
  end
  object XMLBrokerCountriesInContinent: TXMLBroker
    Params = <
      item
        DataType = ftString
        Name = 'continent'
        ParamType = ptUnknown
        Value = 'North America'
      end>
    ProviderName = 'CountriesInContinentProvider'
    WebDispatch.PathInfo = 'XMLBrokerCountriesInContinent'
    Left = 32
    Top = 104
  end
end
