object AddUserPageModule: TAddUserPageModule
  OldCreateOrder = False
  OnCreate = WebPageModuleCreate
  OnActivate = WebPageModuleActivate
  PageProducer = PageProducer1
  Left = 535
  Top = 167
  Height = 284
  Width = 146
  object Adapter: TAdapter
    Left = 40
    Top = 56
    object TAdapterActions
      object AddUser: TAdapterAction
        OnExecute = AddUserExecute
        DisplayLabel = 'Add User'
      end
      object UpdateUser: TAdapterAction
        OnExecute = UpdateUserExecute
        DisplayLabel = 'Update User'
      end
      object DeleteUser: TAdapterAction
        OnExecute = DeleteUserExecute
        DisplayLabel = 'Delete User'
      end
    end
    object TAdapterFields
      object Name: TAdapterField
        OnGetValue = NameGetValue
      end
      object Password: TAdapterField
      end
      object PasswordVerify: TAdapterField
        DisplayLabel = 'Verify Password'
      end
      object Messages: TAdapterField
        OnGetValue = MessagesGetValue
      end
      object AccessRights: TAdapterField
        DisplayLabel = 'Access Rights'
      end
    end
  end
  object trvlsAccessRights: TStringsValuesList
    Strings.Strings = (
      'User'
      'Administrator')
    Left = 40
    Top = 168
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object UserListAdapter: TAdapter
    OnIterateRecords = UserListAdapterIterateRecords
    Left = 40
    Top = 112
    object TAdapterActions
    end
    object TAdapterFields
      object UserName: TAdapterField
        OnGetValue = UserNameGetValue
      end
      object UserRights: TAdapterField
        OnGetValue = UserRightsGetValue
      end
    end
  end
  object PageProducer1: TPageProducer
    ScriptEngine = 'JScript'
    Left = 40
    Top = 8
  end
end
