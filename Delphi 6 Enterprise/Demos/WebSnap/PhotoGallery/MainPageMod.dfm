object MainPageModule: TMainPageModule
  OldCreateOrder = False
  OnCreate = WebAppPageModuleCreate
  OnActivate = WebAppPageModuleActivate
  OnDeactivate = WebAppPageModuleDeactivate
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 268
  Top = 102
  Height = 404
  Width = 249
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
    UserListService = PersistWebUserList
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'Online Photo Gallary'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object EndUserSessionAdapter: TEndUserSessionAdapter
    LoginPage = 'LoginPageModule'
    Left = 48
    Top = 152
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
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
  object PersistWebUserList: TWebUserList
    UserItems = <
      item
        UserName = 'root'
        Password = 'root'
        AccessRights = 'Administrator'
      end>
    Left = 152
    Top = 112
  end
  object RightsAdapter: TAdapter
    Left = 152
    Top = 256
    object TAdapterActions
    end
    object TAdapterFields
      object Rights: TAdapterField
        OnGetValue = RightsGetValue
      end
    end
  end
end
