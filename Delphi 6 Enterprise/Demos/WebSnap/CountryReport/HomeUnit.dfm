object Home: THome
  OldCreateOrder = False
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 207
  Top = 107
  Height = 174
  Width = 241
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 24
    Top = 8
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    ApplicationAdapter = ApplicationAdapter1
    Left = 128
    Top = 16
  end
  object PageDispatcher: TPageDispatcher
    Left = 56
    Top = 64
  end
  object ApplicationAdapter1: TApplicationAdapter
    ApplicationTitle = 'Country Report'
    Left = 168
    Top = 80
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
