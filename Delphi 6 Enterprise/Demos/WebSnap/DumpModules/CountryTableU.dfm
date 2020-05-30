object CountryTable: TCountryTable
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 791
  Top = 762
  Height = 150
  Width = 215
  object Country: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 80
    Top = 16
    object CountryName: TStringField
      FieldName = 'Name'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 24
    end
    object CountryCapital: TStringField
      FieldName = 'Capital'
      Size = 24
    end
    object CountryContinent: TStringField
      FieldName = 'Continent'
      Size = 24
    end
    object CountryArea: TFloatField
      FieldName = 'Area'
      DisplayFormat = '#,'
    end
    object CountryPopulation: TFloatField
      FieldName = 'Population'
      DisplayFormat = '#,'
    end
  end
  object Session1: TSession
    Left = 16
    Top = 16
  end
  object Adapter: TDataSetAdapter
    DataSet = Country
    Left = 152
    Top = 16
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 40
    Top = 72
    object AdapterForm1: TAdapterForm
      object AdapterErrorList1: TAdapterErrorList
        Adapter = Adapter
      end
      object AdapterGrid1: TAdapterGrid
        Adapter = Adapter
        object ColName: TAdapterDisplayColumn
          FieldName = 'Name'
        end
        object ColCapital: TAdapterDisplayColumn
          FieldName = 'Capital'
        end
        object ColContinent: TAdapterDisplayColumn
          FieldName = 'Continent'
        end
        object ColArea: TAdapterDisplayColumn
          FieldName = 'Area'
        end
        object ColPopulation: TAdapterDisplayColumn
          FieldName = 'Population'
        end
        object AdapterCommandColumn1: TAdapterCommandColumn
          Caption = '&nbsp'
          object NewRow: TAdapterActionButton
            ActionName = 'NewRow'
            Caption = 'New'
            PageName = 'CountryForm'
          end
          object EditRow: TAdapterActionButton
            ActionName = 'EditRow'
            Caption = 'Edit'
            PageName = 'CountryForm'
          end
          object DeleteRow: TAdapterActionButton
            ActionName = 'DeleteRow'
            Caption = 'Del'
          end
        end
      end
    end
  end
end
