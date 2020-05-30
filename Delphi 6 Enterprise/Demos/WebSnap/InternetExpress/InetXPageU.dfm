object Countries: TCountries
  OldCreateOrder = False
  PageProducer = InetXPageProducer
  Left = 254
  Top = 107
  Height = 150
  Width = 215
  object InetXPageProducer: TInetXPageProducer
    OnBeforeGetContent = InetXPageProducerBeforeGetContent
    HTMLDoc.Strings = (
      '<HTML>'
      '<HEAD>'
      '</HEAD>'
      '<BODY>'
      '<#INCLUDES><#STYLES><#WARNINGS><#FORMS><#SCRIPT>'
      '</BODY>'
      '</HTML>')
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
    object DataForm1: TDataForm
      object DataGrid1: TDataGrid
        XMLBroker = DM.XMLBrokerCountries
      end
      object DataNavigator1: TDataNavigator
        XMLComponent = DataGrid1
      end
    end
  end
  object DataSetInfo: TAdapter
    Left = 80
    Top = 64
    object TAdapterActions
    end
    object TAdapterFields
      object ContinentName: TAdapterField
        FieldName = 'ContinentName'
        OnGetValue = ContinentNameGetValue
        DisplayLabel = 'ContinentName'
        Required = False
        ReadOnly = False
      end
    end
  end
end
