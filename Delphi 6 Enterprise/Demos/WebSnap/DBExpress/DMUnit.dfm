object DM: TDM
  OldCreateOrder = False
  Left = 260
  Top = 125
  Height = 253
  Width = 374
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=True'
      'Database=c:\interbase\examples\database\employee.gdb'
      'DriverName=Interbase'
      'Password=masterkey'
      'RoleName=RoleName'
      'TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 48
    Top = 24
  end
  object DataSetAdapter1: TDataSetAdapter
    DataSet = ClientDataSet1
    OnAfterExecuteAction = DataSetAdapter1AfterExecuteAction
    PageSize = 0
    Left = 40
    Top = 160
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object SQLTable1: TSQLTable
    SQLConnection = SQLConnection1
    MaxBlobSize = 32
    TableName = 'CUSTOMER'
    Left = 48
    Top = 80
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLTable1
    Constraints = True
    Left = 168
    Top = 32
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'DataSetProvider1'
    BeforeClose = ClientDataSet1BeforeClose
    OnReconcileError = ClientDataSet1ReconcileError
    Left = 160
    Top = 96
    object ClientDataSet1CUST_NO: TIntegerField
      FieldName = 'CUST_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSet1CUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      Required = True
      Size = 25
    end
    object ClientDataSet1CONTACT_FIRST: TStringField
      FieldName = 'CONTACT_FIRST'
      Size = 15
    end
    object ClientDataSet1CONTACT_LAST: TStringField
      FieldName = 'CONTACT_LAST'
    end
    object ClientDataSet1PHONE_NO: TStringField
      FieldName = 'PHONE_NO'
    end
    object ClientDataSet1ADDRESS_LINE1: TStringField
      FieldName = 'ADDRESS_LINE1'
      Size = 30
    end
    object ClientDataSet1ADDRESS_LINE2: TStringField
      FieldName = 'ADDRESS_LINE2'
      Size = 30
    end
    object ClientDataSet1CITY: TStringField
      FieldName = 'CITY'
      Size = 25
    end
    object ClientDataSet1STATE_PROVINCE: TStringField
      FieldName = 'STATE_PROVINCE'
      Size = 15
    end
    object ClientDataSet1COUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 15
    end
    object ClientDataSet1POSTAL_CODE: TStringField
      FieldName = 'POSTAL_CODE'
      Size = 12
    end
    object ClientDataSet1ON_HOLD: TStringField
      FieldName = 'ON_HOLD'
      Size = 1
    end
  end
end
