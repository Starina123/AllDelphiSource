object WebPageLookModule: TWebPageLookModule
  OldCreateOrder = False
  OnCreate = WebPageModuleCreate
  OnDestroy = WebPageModuleDestroy
  OnActivate = WebPageModuleActivate
  OnDeactivate = WebPageModuleDeactivate
  PageProducer = PageProducer1
  Left = 237
  Top = 413
  Height = 195
  Width = 281
  object PicturesIterator: TPagedAdapter
    OnGetRecordIndex = PicturesIteratorGetRecordIndex
    OnGetRecordCount = PicturesIteratorGetRecordCount
    OnGetEOF = PicturesIteratorGetEOF
    OnGetFirstRecord = PicturesIteratorGetFirstRecord
    OnGetNextRecord = PicturesIteratorGetNextRecord
    PageSize = 4
    Left = 40
    Top = 80
    object TAdapterDefaultActions
      object NewPicturePage: TAdapterAction
        OnExecute = NewPicturePageExecute
      end
      object DeletePicture: TAdapterAction
        OnExecute = DeletePictureExecute
        OnGetParams = DeletePictureGetParams
      end
      object ActionGotoPage: TAdapterGotoPageAction
      end
    end
    object TAdapterDefaultFields
      object ThumbWidth: TAdapterField
        OnGetValue = ThumbWidthGetValue
      end
      object ThumbHeight: TAdapterField
        OnGetValue = ThumbHeightGetValue
      end
      object PictureImage: TAdapterImageField
        OnGetParams = PictureImageGetParams
        OnGetImage = PictureImageGetImage
        OnGetImageName = PictureImageGetImageName
      end
      object PictureThumbImage: TAdapterImageField
        OnGetParams = PictureImageGetParams
        OnGetImage = PictureThumbImageGetImage
      end
      object PicsPerRow: TAdapterField
        OnGetValue = PicsPerRowGetValue
      end
    end
  end
  object PageProducer1: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 16
  end
  object AdapterPageProducer1: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 184
    Top = 24
    object AdapterForm1: TAdapterForm
      object AdapterGrid1: TAdapterGrid
        Adapter = PicturesIterator
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterGrid1
      end
    end
  end
  object DisplayOptions: TAdapter
    Left = 136
    Top = 88
    object TAdapterActions
      object SubmitOptions: TAdapterAction
        OnExecute = SubmitOptionsExecute
      end
    end
    object TAdapterFields
      object MaxPicsPerPage: TAdapterField
        OnGetValue = MaxPicsPerPageGetValue
      end
      object PreferredThumbWidth: TAdapterField
        OnGetValue = PreferredThumbWidthGetValue
      end
      object MaxPicsPerRow: TAdapterField
        OnGetValue = MaxPicsPerRowGetValue
      end
    end
  end
end
