object ChildRDM: TChildRDM
  OldCreateOrder = False
  Left = 142
  Top = 186
  Height = 173
  Width = 281
  object tblVendors: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'vendors.db'
    Left = 56
    Top = 44
  end
  object prvVendors: TDataSetProvider
    DataSet = tblVendors
    Constraints = True
    Left = 132
    Top = 44
  end
end
