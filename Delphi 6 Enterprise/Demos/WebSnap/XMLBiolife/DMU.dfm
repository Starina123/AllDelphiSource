object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 208
  Width = 338
  object XSLTemplate1: TXSLTemplate
    Active = False
    FileName = 'template.xsl'
    ParseOptions = []
    Left = 192
    Top = 104
    DOMVendorDesc = 'MSXML'
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    SessionName = 'Session1_1'
    TableName = 'biolife.db'
    Left = 24
    Top = 16
    object Table1SpeciesNo: TFloatField
      FieldName = 'Species No'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Table1Category: TStringField
      FieldName = 'Category'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 15
    end
    object Table1Common_Name: TStringField
      FieldName = 'Common_Name'
      Size = 30
    end
    object Table1SpeciesName: TStringField
      FieldName = 'Species Name'
      Size = 40
    end
    object Table1Lengthcm: TFloatField
      FieldName = 'Length (cm)'
    end
    object Table1Length_In: TFloatField
      FieldName = 'Length_In'
    end
    object Table1Notes: TMemoField
      FieldName = 'Notes'
      BlobType = ftMemo
      Size = 50
    end
    object Table1Graphic: TGraphicField
      FieldName = 'Graphic'
      BlobType = ftGraphic
    end
  end
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 120
    Top = 24
  end
  object DataSetAdapter1: TDataSetAdapter
    DataSet = Table1
    Left = 72
    Top = 64
    object TAdapterDefaultActions
      object ActionDeleteRow: TDataSetAdapterDeleteRowAction
        ExecuteAccess = 'Modify'
      end
      object ActionFirstRow: TDataSetAdapterFirstRowAction
      end
      object ActionPrevRow: TDataSetAdapterPrevRowAction
      end
      object ActionNextRow: TDataSetAdapterNextRowAction
      end
      object ActionLastRow: TDataSetAdapterLastRowAction
      end
      object ActionEditRow: TDataSetAdapterEditRowAction
      end
      object ActionNewRow: TDataSetAdapterNewRowAction
        ExecuteAccess = 'Modify'
      end
      object ActionCancel: TDataSetAdapterCancelRowAction
      end
      object ActionApply: TDataSetAdapterApplyRowAction
        ExecuteAccess = 'Modify'
      end
      object ActionRefreshRow: TDataSetAdapterRefreshRowAction
      end
    end
    object TAdapterDefaultFields
      object AdaptSpeciesNo: TDataSetAdapterField
        DataSetField = 'Species No'
        ModifyAccess = 'Modify'
      end
      object AdaptCategory: TDataSetAdapterField
        DataSetField = 'Category'
        ModifyAccess = 'Modify'
      end
      object AdaptCommon_Name: TDataSetAdapterField
        DataSetField = 'Common_Name'
        ModifyAccess = 'Modify'
      end
      object AdaptSpeciesName: TDataSetAdapterField
        DataSetField = 'Species Name'
        ModifyAccess = 'Modify'
      end
      object AdaptLengthcm: TDataSetAdapterField
        DataSetField = 'Length (cm)'
        ModifyAccess = 'Modify'
      end
      object AdaptLength_In: TDataSetAdapterField
        DataSetField = 'Length_In'
        ModifyAccess = 'Modify'
      end
      object AdaptNotes: TDataSetAdapterMemoField
        DataSetField = 'Notes'
        ModifyAccess = 'Modify'
      end
      object AdaptGraphic: TDataSetAdapterImageField
        DataSetField = 'Graphic'
        ModifyAccess = 'Modify'
        FieldModes = [amInsert, amEdit, amBrowse]
      end
    end
  end
end
