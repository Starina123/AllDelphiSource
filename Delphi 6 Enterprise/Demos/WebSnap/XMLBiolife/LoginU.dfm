object LoginPage: TLoginPage
  OldCreateOrder = False
  PageProducer = AdapterXMLBuilder
  Left = 254
  Top = 107
  Height = 195
  Width = 260
  object AdapterXMLBuilder: TAdapterXMLBuilder
    TagName = 'XMLBuilder'
    XSLTemplate = DM.XSLTemplate1
    PageHeadingOptions = [hoApplicationTitle, hoCurrentPage]
    Left = 48
    Top = 8
    object XMLForm1: TXMLForm
      TagName = 'Form'
      FormMethod = fmPost
      object XMLAdapterErrors1: TXMLAdapterErrors
        TagName = 'Errors'
        Adapter = LoginFormAdapter1
      end
      object XMLFieldGroup1: TXMLFieldGroup
        Adapter = LoginFormAdapter1
        TagName = 'FieldGroup'
        DataTagName = 'Data'
        LayoutTagName = 'Layout'
      end
      object XMLCommandGroup1: TXMLCommandGroup
        XMLComponent = XMLFieldGroup1
        TagName = 'CommandGroup'
        DataTagName = 'Data'
        LayoutTagName = 'Layout'
      end
    end
  end
  object LoginFormAdapter1: TLoginFormAdapter
    Left = 144
    Top = 48
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
