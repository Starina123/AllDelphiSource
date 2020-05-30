object Home: THome
  OldCreateOrder = False
  PageProducer = PageProducer1
  AppServices = WebAppComponents
  Left = 254
  Top = 107
  Height = 296
  Width = 215
  object WebAppComponents: TWebAppComponents
    DispatchActions = WebDispatcher1
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'InternetExpress Test'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    OnPageNotFound = PageDispatcherPageNotFound
    Left = 48
    Top = 152
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 200
  end
  object PageProducer1: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  inline WebDispatcher1: TWebDispatcher
    OldCreateOrder = False
    Actions = <>
    Left = 128
    Top = 64
    Height = 0
    Width = 0
  end
end
