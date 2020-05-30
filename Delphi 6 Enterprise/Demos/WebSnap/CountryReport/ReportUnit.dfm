object Report: TReport
  OldCreateOrder = False
  PageProducer = PageProducer
  Left = 207
  Top = 107
  Height = 150
  Width = 215
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 24
    Top = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_2'
    TableName = 'country.db'
    Left = 80
    Top = 16
    object Table1Name: TStringField
      FieldName = 'Name'
      Size = 24
    end
    object Table1Capital: TStringField
      FieldName = 'Capital'
      Size = 24
    end
    object Table1Continent: TStringField
      FieldName = 'Continent'
      Size = 24
    end
    object Table1Area: TFloatField
      FieldName = 'Area'
      DisplayFormat = '#,'
    end
    object Table1Population: TFloatField
      FieldName = 'Population'
      DisplayFormat = '#,'
    end
  end
  object Adapter: TDataSetAdapter
    DataSet = Table1
    PageSize = 0
    Left = 16
    Top = 16
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 144
    Top = 16
  end
end
