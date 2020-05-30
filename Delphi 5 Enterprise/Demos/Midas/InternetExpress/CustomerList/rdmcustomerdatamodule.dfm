object CustomerData: TCustomerData
  OldCreateOrder = False
  Left = 124
  Top = 155
  Height = 300
  Width = 463
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 32
    Top = 24
  end
  object SelectCustOrders: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'Select * from orders where CustNo = :CustNo')
    Left = 32
    Top = 80
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'CustNo'
        ParamType = ptUnknown
        Value = 1221
      end>
  end
  object OrderItems: TTable
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_2'
    IndexName = 'ByOrderNo'
    MasterFields = 'OrderNo'
    MasterSource = SelectCustOrderSrc
    TableName = 'items.db'
    Left = 112
    Top = 80
  end
  object SelectCustOrderSrc: TDataSource
    DataSet = SelectCustOrders
    Left = 32
    Top = 144
  end
  object CustOrders: TDataSetProvider
    DataSet = SelectCustOrders
    Constraints = True
    Left = 128
    Top = 144
  end
  object SelectCustNames: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'Select CustNo, Company from Customer order by Company')
    Left = 120
    Top = 16
  end
  object CustNames: TDataSetProvider
    DataSet = SelectCustNames
    Constraints = True
    Left = 192
    Top = 72
  end
end
