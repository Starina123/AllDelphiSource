object Home: THome
  OldCreateOrder = False
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 252
  Top = 132
  Height = 356
  Width = 373
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object WebAppComponents: TWebAppComponents
    PageDispatcher = PageDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'ScriptObject Test'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object PageDispatcher: TPageDispatcher
    Left = 48
    Top = 152
  end
  object ExtendedAdapter1: TExtendedAdapter
    SampleValue = 'aaaaaaaaaa'
    Left = 200
    Top = 104
    object TAdapterActions
    end
    object TAdapterFields
    end
  end
  object ExtendedDataSetAdapter1: TExtendedDataSetAdapter
    SampleValue = 'bbbbbbbbbbbbbbb'
    Left = 200
    Top = 168
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object SimpleScriptObject1: TSimpleScriptObject
    SampleValue = 'asdfasdf'
    Left = 200
    Top = 32
  end
end
