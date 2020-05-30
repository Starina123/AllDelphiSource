object DM: TDM
  OldCreateOrder = False
  Left = 35
  Top = 810
  Height = 296
  Width = 387
  object ItemsTable: TTable
    BeforePost = ItemsTableBeforePost
    OnNewRecord = ItemsTableNewRecord
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_3'
    IndexName = 'ByOrderNo'
    MasterFields = 'OrderNo'
    MasterSource = OrdersSource
    TableName = 'items.db'
    Left = 48
    Top = 88
    object ItemsTableOrderNo: TFloatField
      FieldName = 'OrderNo'
      DisplayFormat = #39'#'#39'0000'
    end
    object ItemsTableItemNo: TFloatField
      FieldName = 'ItemNo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ItemsTablePartNo: TFloatField
      Alignment = taLeftJustify
      FieldName = 'PartNo'
      DisplayFormat = 'PN-00000'
    end
    object ItemsTableQty: TIntegerField
      FieldName = 'Qty'
    end
    object ItemsTableDiscount: TFloatField
      FieldName = 'Discount'
      DisplayFormat = '#0%'
      MaxValue = 100
    end
  end
  object OrdersQuery: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'select * from orders')
    Left = 96
    Top = 16
  end
  object OrdersSource: TDataSource
    DataSet = OrdersQuery
    Left = 176
    Top = 40
  end
  object OrdersAdapter: TDataSetAdapter
    DataSet = OrdersQuery
    Left = 168
    Top = 104
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptOrderNo: TDataSetAdapterField
        DataSetField = 'OrderNo'
        FieldFlags = [ffInKey, ffInOrigValues]
      end
      object AdaptCustNo: TDataSetAdapterField
        DataSetField = 'CustNo'
      end
    end
  end
  object ItemsAdapter: TDataSetAdapter
    DataSet = ItemsTable
    MasterAdapter = OrdersAdapter
    Left = 96
    Top = 152
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
      object AdaptOrderNo2: TDataSetAdapterField
        DataSetField = 'OrderNo'
      end
      object AdaptItemNo: TDataSetAdapterField
        DataSetField = 'ItemNo'
      end
      object AdaptPartNo: TDataSetAdapterField
        DataSetField = 'PartNo'
        ValuesList = PartNoValuesList
      end
      object AdaptQty: TDataSetAdapterField
        DataSetField = 'Qty'
      end
      object AdaptDiscount: TDataSetAdapterField
        DataSetField = 'Discount'
      end
      object DataSetAdapterDeleteRowField: TDataSetAdapterDeleteRowField
      end
    end
  end
  object PartNoQuery: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'select PartNo from parts order by PartNo')
    Left = 208
    Top = 184
  end
  object PartNoValuesList: TDataSetValuesList
    ValueField = 'PartNo'
    DataSet = PartNoQuery
    Left = 264
    Top = 88
    object TAdapterDefaultActions
    end
    object TAdapterDefaultFields
    end
  end
  object Session1: TSession
    AutoSessionName = True
    Left = 32
    Top = 24
  end
  object NextItemNo: TQuery
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_4'
    SQL.Strings = (
      'select Max(ItemNo) from Items where OrderNo = :OrderNo')
    Left = 264
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OrderNo'
        ParamType = ptUnknown
        Value = '1221'
      end>
  end
end
