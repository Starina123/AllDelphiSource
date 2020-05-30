object Customer_MinMax: TCustomer_MinMax
  OldCreateOrder = False
  Left = 143
  Top = 144
  Height = 232
  Width = 335
  object Query1: TQuery
    DatabaseName = 'DBDEMOS'
    SQL.Strings = (
      'select * from customer '
      '  where CustNo > :CustNoMin and CustNo < :CustNoMax ;'
      ''
      ' ')
    Left = 48
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CustNoMin'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CustNoMax'
        ParamType = ptInput
      end>
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 120
    Top = 40
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 48
    Top = 112
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = Table1
    Constraints = True
    Left = 128
    Top = 120
  end
end
