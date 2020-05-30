object LoginModule: TLoginModule
  OldCreateOrder = False
  PageProducer = AdapterPageProducer1
  Left = 376
  Top = 126
  Height = 181
  Width = 167
  object LoginFormAdapter1: TLoginFormAdapter
    OnLogin = LoginFormAdapter1Login
    Left = 40
    Top = 16
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptUserName: TAdapterUserNameField
        FieldName = 'UserName'
      end
      object AdaptPassword: TAdapterPasswordField
        FieldName = 'Password'
      end
      object AdaptNextPage: TAdapterNextPageField
        FieldName = 'NextPage'
      end
    end
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
    Left = 80
    Top = 72
    object AdapterForm1: TAdapterForm
      object AdapterErrorList1: TAdapterErrorList
        Adapter = LoginFormAdapter1
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = LoginFormAdapter1
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
      end
    end
  end
end
