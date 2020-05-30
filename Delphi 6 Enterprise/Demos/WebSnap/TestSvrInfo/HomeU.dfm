object Home: THome
  OldCreateOrder = False
  PageProducer = PageProducer
  AppServices = WebAppComponents
  Left = 254
  Top = 107
  Height = 298
  Width = 262
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object WebAppComponents: TWebAppComponents
    LocateFileService = LocateFileService1
    PageDispatcher = PageDispatcher
    AdapterDispatcher = AdapterDispatcher
    ApplicationAdapter = ApplicationAdapter
    Left = 48
    Top = 56
  end
  object AdapterDispatcher: TAdapterDispatcher
    Left = 48
    Top = 104
  end
  object PageDispatcher: TPageDispatcher
    Left = 48
    Top = 152
  end
  object ApplicationAdapter: TApplicationAdapter
    ApplicationTitle = 'TestSvr Info'
    Left = 48
    Top = 200
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object Adapter: TSvrInfoAdapter
    Left = 176
    Top = 40
    object TAdapterDefaultActions
      object ActionSortProgID: TSvrInfoSortByProgIDAction
      end
      object ActionSortFilePath: TSvrInfoSortByFilePathAction
      end
      object ActionCleanMarked: TSvrInfoCleanMarkedAction
      end
      object ActionCleanMissingFiles: TSvrInfoCleanMissingFilesAction
      end
    end
    object TAdapterDefaultFields
      object AdaptClsID: TSvrInfoClsIDField
      end
      object AdaptProgID: TSvrInfoProgIDField
      end
      object AdaptFileName: TSvrInfoFileNameField
      end
      object AdaptFilePath: TSvrInfoFilePathField
      end
      object AdaptURLPath: TSvrInfoURLPathField
      end
      object AdaptFileExists: TSvrInfoFileExistsField
      end
      object AdaptMarkClsID: TSvrInfoMarkClsIDField
      end
    end
  end
  object LocateFileService1: TLocateFileService
    OnFindStream = LocateFileService1FindStream
    Left = 168
    Top = 112
  end
end
