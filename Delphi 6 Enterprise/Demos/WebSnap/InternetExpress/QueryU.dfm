object Query: TQuery
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 402
  Top = 162
  Height = 150
  Width = 215
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      FormMethod = fmGet
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = QueryFormAdapter
        object FldContinentField: TAdapterDisplayField
          Caption = 'Continent: '
          FieldName = 'ContinentField'
        end
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object CmdSubmitQuery: TAdapterActionButton
          ActionName = 'SubmitQuery'
          Caption = 'Submit'
          PageName = 'QueryResult'
        end
      end
    end
  end
  object QueryFormAdapter: TAdapter
    Left = 136
    Top = 32
    object TAdapterActions
      object SubmitQuery: TAdapterAction
        OnExecute = SubmitQueryExecute
      end
    end
    object TAdapterFields
      object ContinentField: TAdapterField
        OnGetValue = ContinentFieldGetValue
        ValuesList = ContinentNamesList
      end
    end
  end
  object ContinentNamesList: TStringsValuesList
    Strings.Strings = (
      ''
      'North America'
      'South America'
      'Africa'
      'Europe'
      'Asia'
      'Eurasia')
    Left = 48
    Top = 64
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
