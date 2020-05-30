object Home: THome
  OldCreateOrder = False
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 125
  Top = 140
  Height = 158
  Width = 233
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 32
    Top = 16
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 128
    Top = 16
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'Tutorials'
    Left = 32
    Top = 72
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    Left = 144
    Top = 72
  end
end
