object EmailMessageModule: TEmailMessageModule
  OldCreateOrder = False
  PageProducer = PageProducer
  Left = 254
  Top = 107
  Height = 199
  Width = 144
  object PageProducer: TPageProducer
    ScriptEngine = 'JScript'
    Left = 48
    Top = 8
  end
  object EmailMessage: TAdapter
    Left = 48
    Top = 72
    object TAdapterActions
    end
    object TAdapterFields
      object StartMessage: TAdapterField
        OnGetValue = StartMessageGetValue
      end
      object MessageId: TAdapterField
        OnGetValue = MessageIdGetValue
      end
      object MessageFromName: TAdapterField
        OnGetValue = MessageFromNameGetValue
      end
      object MessageFromEmail: TAdapterField
        OnGetValue = MessageFromEmailGetValue
      end
      object MessageSubject: TAdapterField
        OnGetValue = MessageSubjectGetValue
      end
      object MessageDate: TAdapterField
        OnGetValue = MessageDateGetValue
      end
      object MessageBody: TAdapterField
        OnGetValue = MessageBodyGetValue
      end
    end
  end
end
