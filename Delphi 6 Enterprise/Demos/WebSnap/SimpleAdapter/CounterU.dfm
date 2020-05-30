object Counter: TCounter
  OldCreateOrder = False
  OnActivate = PageProducerModuleActivate
  PageProducer = PageProducer
  Left = 232
  Top = 141
  Height = 150
  Width = 215
  object Adapter: TAdapter
    Left = 80
    Top = 24
    object TAdapterActions
      object Increment: TAdapterAction
        ActionName = 'Increment'
        OnExecute = IncrementExecute
        OnGetParams = GetParams
        DisplayLabel = 'Increment'
        RedirectOptions = []
      end
      object Dec: TAdapterAction
        ActionName = 'Dec'
        OnExecute = DecExecute
        OnGetParams = GetParams
        DisplayLabel = 'Dec'
        RedirectOptions = []
      end
      object Add: TAdapterAction
        ActionName = 'Add'
        OnExecute = Arg1Execute
        OnGetParams = GetParams
        DisplayLabel = 'Add'
        RedirectOptions = []
      end
      object Subtract: TAdapterAction
        ActionName = 'Subtract'
        OnExecute = Arg1Execute
        OnGetParams = GetParams
        DisplayLabel = 'Subtract'
        RedirectOptions = []
      end
    end
    object TAdapterFields
      object Count: TAdapterField
        FieldName = 'Count'
        OnGetValue = CountGetValue
        DisplayLabel = 'Count'
        Required = False
        ReadOnly = False
      end
      object Arg1: TAdapterField
        FieldName = 'Arg1'
        OnGetValue = Arg1GetValue
        DisplayLabel = 'Arg1'
        Required = False
        ReadOnly = False
      end
    end
  end
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 128
    Top = 64
  end
end
