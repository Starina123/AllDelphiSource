object UpPicPageModule: TUpPicPageModule
  OldCreateOrder = False
  OnActivate = WebPageModuleActivate
  PageProducer = PageProducer
  Left = 281
  Top = 122
  Height = 236
  Width = 288
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object UploadAdapter: TAdapter
    Left = 56
    Top = 112
    object TAdapterActions
      object Upload: TAdapterAction
        OnExecute = UploadExecute
      end
    end
    object TAdapterFields
      object UploadFile: TAdapterFileField
        OnUploadFiles = UploadFileUploadFiles
      end
    end
  end
  object UploadedFiles: TStringsValuesList
    Left = 136
    Top = 64
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
