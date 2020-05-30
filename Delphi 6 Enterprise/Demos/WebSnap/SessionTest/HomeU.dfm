object Home: THome
  OldCreateOrder = False
  AppServices = WebAppComponents
  Left = 249
  Top = 143
  Height = 296
  Width = 215
  object WebAppComponents: TWebAppComponents
    Sessions = SessionsService1
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'Session Test'
    Left = 48
    Top = 104
    object TAdapterDefaultActions
      object UpdateSessionValue: TAdapterAction
        OnExecute = UpdateSessionValueExecute
      end
      object TerminateSession: TAdapterAction
        OnExecute = TerminateSessionExecute
      end
    end
    object TAdapterDefaultFields
      object AdaptTitle: TAdapterApplicationTitleField
      end
      object SessionValue: TAdapterField
        OnGetValue = SessionValueGetValue
      end
      object RedirectFlag: TAdapterBooleanField
      end
    end
  end
  object PageDispatcher: TPageDispatcher
    DefaultPage = 'SessionInfo'
    Left = 48
    Top = 152
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 200
  end
  object SessionsService1: TSessionsService
    OnStartSession = SessionsService1StartSession
    OnEndSession = SessionsService1EndSession
    DefaultTimeout = 1
    MaxSessions = 1
    Left = 144
    Top = 56
  end
  object Log: TStringsValuesList
    OnPrepareStrings = LogPrepareStrings
    Left = 136
    Top = 128
    object TAdapterDefaultActions
      object ClearLog: TAdapterAction
        OnExecute = ClearLogExecute
      end
    end
    object TAdapterDefaultFields
      object LogString: TValuesListValueField
      end
    end
  end
end
