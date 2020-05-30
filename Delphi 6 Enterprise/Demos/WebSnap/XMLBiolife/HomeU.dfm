object Home: THome
  OldCreateOrder = False
  PageProducer = AdapterXMLBuilder1
  AppServices = WebAppComponents
  Left = 254
  Top = 107
  Height = 440
  Width = 215
  object WebAppComponents: TWebAppComponents
    Sessions = SessionsService
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    EndUserAdapter = EndUserSessionAdapter
    UserListService = WebUserList
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'XML Biolife Example'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object EndUserSessionAdapter: TEndUserSessionAdapter
    LoginPage = 'LoginPage'
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
  object WebUserList: TWebUserList
    UserItems = <
      item
        UserName = 'Ellen'
        AccessRights = 'Modify'
      end
      item
        UserName = 'Will'
      end>
    Left = 48
    Top = 344
  end
  object AdapterXMLBuilder1: TAdapterXMLBuilder
    TagName = 'XMLBuilder'
    XSLTemplate = DM.XSLTemplate1
    Left = 48
    Top = 8
  end
end
