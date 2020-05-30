object MainModule: TMainModule
  OldCreateOrder = False
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 606
  Top = 270
  Height = 389
  Width = 215
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object WebAppComponents: TWebAppComponents
    Sessions = SessionsService
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    EndUserAdapter = EndUserSessionAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object EndUserSessionAdapter: TEndUserSessionAdapter
    LoginPage = 'LoginModule'
    Left = 48
    Top = 152
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptDisplayName: TAdapterEndUserDisplayNameField
      end
      object AdaptLoggedIn: TAdapterEndUserLoggedInField
      end
    end
  end
  object PageDispatcher: TPageDispatcher
    Left = 48
    Top = 200
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 248
  end
  object SessionsService: TSessionsService
    Left = 48
    Top = 296
  end
end
