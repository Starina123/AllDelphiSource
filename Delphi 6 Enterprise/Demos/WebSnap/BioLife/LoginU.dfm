object Login: TLogin
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 254
  Top = 107
  Height = 150
  Width = 215
  object AdapterPageProducer: TAdapterPageProducer
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      FormMethod = fmPost
      object AdapterErrorList1: TAdapterErrorList
        Adapter = LoginFormAdapter1
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = LoginFormAdapter1
      end
      object AdapterButtonGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object BtnLogin: TAdapterActionButton
          ActionName = 'Login'
          Caption = 'Login'
          PageName = 'Home'
          DisplayType = ctDefault
        end
      end
    end
  end
  object LoginFormAdapter1: TLoginFormAdapter
    PasswordRequired = False
    Left = 144
    Top = 24
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
end
