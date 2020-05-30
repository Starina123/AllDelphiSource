object Details: TDetails
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 271
  Top = 347
  Height = 243
  Width = 445
  object AdapterPageProducer: TAdapterPageProducer
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      FormMethod = fmPost
      object AdapterErrorList1: TAdapterErrorList
        Adapter = DM.DataSetAdapter1
      end
      object AdapterFieldGroup1: TAdapterFieldGroup
        Adapter = DM.DataSetAdapter1
        AdapterMode = 'Edit'
      end
      object AdapterButtonGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object BtnFirstRow: TAdapterActionButton
          ActionName = 'FirstRow'
          Caption = 'FirstRow'
          DisplayType = ctDefault
        end
        object BtnPrevRow: TAdapterActionButton
          ActionName = 'PrevRow'
          Caption = 'PrevRow'
          DisplayType = ctDefault
        end
        object BtnNextRow: TAdapterActionButton
          ActionName = 'NextRow'
          Caption = 'NextRow'
          DisplayType = ctDefault
        end
        object BtnLastRow: TAdapterActionButton
          ActionName = 'LastRow'
          Caption = 'LastRow'
          DisplayType = ctDefault
        end
        object BtnApply: TAdapterActionButton
          ActionName = 'Apply'
          Caption = 'Apply'
          DisplayType = ctDefault
        end
        object BtnRefreshRow: TAdapterActionButton
          ActionName = 'RefreshRow'
          Caption = 'RefreshRow'
          DisplayType = ctDefault
        end
      end
      object AdapterButtonGroup2: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object BtnDeleteRow: TAdapterActionButton
          ActionName = 'DeleteRow'
          Caption = 'DeleteRow'
          DisplayType = ctDefault
        end
      end
    end
  end
end
