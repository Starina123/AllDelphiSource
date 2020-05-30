object CountryForm: TCountryForm
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 382
  Top = 107
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
      object AdapterErrorList1: TAdapterErrorList
        Adapter = CountryTable.Adapter
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = CountryTable.Adapter
      end
      object AdapterButtonGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object BtnApply: TAdapterActionButton
          ActionName = 'Apply'
          PageName = 'CountryTable'
          HideOptions = []
          ImageProducer = ImageButtonProducer1
        end
        object BtnRefreshRow: TAdapterActionButton
          ActionName = 'RefreshRow'
          Caption = 'Refresh'
          HideOptions = []
          ImageProducer = ImageButtonProducer1
        end
        object BtnCancel: TAdapterActionButton
          ActionName = 'Cancel'
          PageName = 'CountryTable'
          HideOptions = []
          ImageProducer = ImageButtonProducer1
        end
      end
    end
  end
  object ImageButtonProducer1: TImageButtonProducer
    Width = 0
    Height = 30
    CacheDir = '..\images'
    VirtualDir = '../images'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 112
    Top = 64
  end
end
