object Data: TData
  OldCreateOrder = False
  Left = 190
  Top = 107
  Height = 150
  Width = 215
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=True'
      'Database=d:\interbase6\examples\database\employee.gdb'
      'DriverName=Interbase'
      'LocaleCode=0X0409'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=ASCII'
      'SQLDialect=1'
      'Interbase TransIsolation=RepeatableRead'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'GDS32.DLL'
    Left = 32
    Top = 24
  end
  object SQLDataSet1: TSQLDataSet
    SQLConnection = SQLConnection1
    Params = <>
    Left = 112
    Top = 24
  end
end
