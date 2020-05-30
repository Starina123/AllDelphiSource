object ViewMailModule: TViewMailModule
  OldCreateOrder = False
  OnDeactivate = WebPageModuleDeactivate
  PageProducer = PageProducer
  Left = 572
  Top = 161
  Height = 150
  Width = 215
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object popEmail: TIdPOP3
    Host = 'mail.cruzio.com'
    Left = 104
    Top = 24
  end
  object EmailAdapter: TAdapter
    OnIterateRecords = EmailAdapterIterateRecords
    Left = 32
    Top = 72
    object TAdapterActions
      object GetEmail: TAdapterAction
        OnExecute = GetEmailExecute
        OnGetParams = GetEmailGetParams
      end
    end
    object TAdapterFields
      object MessageId: TAdapterField
        OnGetValue = MessageIdGetValue
      end
      object MessageSubject: TAdapterField
        OnGetValue = MessageSubjectGetValue
      end
      object MessageFromName: TAdapterField
        OnGetValue = MessageFromNameGetValue
      end
      object MessageDate: TAdapterField
        OnGetValue = MessageDateGetValue
      end
      object MessageFromEmail: TAdapterField
        OnGetValue = MessageFromEmailGetValue
      end
      object MessageSize: TAdapterField
        OnGetValue = MessageSizeGetValue
      end
      object MessageCount: TAdapterField
        OnGetValue = MessageCountGetValue
      end
    end
  end
  object msgEmail: TIdMessage
    BccList = <>
    CCList = <>
    Recipients = <>
    ReplyTo = <>
    Left = 144
    Top = 56
  end
end
