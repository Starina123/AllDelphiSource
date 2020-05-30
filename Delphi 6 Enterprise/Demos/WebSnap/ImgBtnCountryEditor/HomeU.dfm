object Home: THome
  OldCreateOrder = False
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 207
  Top = 107
  Height = 209
  Width = 262
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 24
    Top = 8
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 128
    Top = 16
  end
  object PageDispatcher: TPageDispatcher
    Left = 56
    Top = 64
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'Image Buttons Test'
    Left = 168
    Top = 72
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 40
    Top = 120
  end
end
