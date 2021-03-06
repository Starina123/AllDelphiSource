object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'WebActionItem1'
      PathInfo = '/show'
      Producer = DataSetTableProducer1
    end
    item
      Name = 'WebActionItem2'
      PathInfo = '/foo'
      OnAction = WebModule1WebActionItem2Action
    end>
  Left = 192
  Top = 130
  Height = 227
  Width = 320
  object SQLConnection1: TSQLConnection
    Connected = True
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'libsqlib.so'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=32'
      'CommitRetain=True'
      'Database=/usr/local/interbase/examples/employee.gdb'
      'DriverName=Interbase'
      'Password=masterkey'
      'RoleName=RoleName'
      'TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'libgds.so.0'
    Left = 80
    Top = 16
  end
  object Employees: TSQLTable
    Active = True
    SQLConnection = SQLConnection1
    MaxBlobSize = 32
    TableName = 'EMPLOYEE'
    Left = 248
    Top = 16
  end
  object DataSetTableProducer1: TDataSetTableProducer
    Columns = <
      item
        FieldName = 'EMP_NO'
      end
      item
        FieldName = 'FIRST_NAME'
      end
      item
        FieldName = 'LAST_NAME'
      end
      item
        FieldName = 'PHONE_EXT'
      end
      item
        FieldName = 'HIRE_DATE'
      end
      item
        FieldName = 'DEPT_NO'
      end
      item
        FieldName = 'JOB_CODE'
      end
      item
        FieldName = 'JOB_GRADE'
      end
      item
        FieldName = 'JOB_COUNTRY'
      end
      item
        FieldName = 'SALARY'
      end
      item
        FieldName = 'FULL_NAME'
      end>
    MaxRows = 100
    DataSet = Employees
    Left = 128
    Top = 120
  end
end
