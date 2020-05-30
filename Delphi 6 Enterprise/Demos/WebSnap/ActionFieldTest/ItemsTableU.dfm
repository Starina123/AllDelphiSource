object ItemsTable: TItemsTable
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  Left = 254
  Top = 107
  Height = 150
  Width = 215
  object AdapterPageProducer: TAdapterPageProducer
    HTMLDoc.Strings = (
      '<html>'
      '<head>'
      '</head>'
      '<body>'
      '<#STYLES><#WARNINGS><#SERVERSCRIPT>'
      '</body>'
      '</html>')
    Left = 48
    Top = 8
    object AdapterForm1: TAdapterForm
      Custom = 'bgcolor=#CCFFFFF border=1'
      object AdapterFieldGroup1: TAdapterFieldGroup
        Custom = 'cellpadding=2'
        Adapter = DM.OrdersAdapter
        object FldOrderNo: TAdapterDisplayField
          Caption = 'OrderNo:'
          CaptionAttributes.Style = 'font-weight: bold'
          CaptionAttributes.Align = haRight
          DisplayWidth = 10
          FieldName = 'OrderNo'
        end
        object FldCustNo: TAdapterDisplayField
          Caption = 'CustNo:'
          CaptionAttributes.Style = 'font-weight: bold'
          CaptionAttributes.Align = haRight
          DisplayWidth = 10
          FieldName = 'CustNo'
        end
      end
      object LayoutGroup2: TLayoutGroup
        DisplayColumns = 2
        object AdapterCommandGroup1: TAdapterCommandGroup
          DisplayComponent = AdapterFieldGroup1
          Custom = 'align=center'
          object CmdFirstRow: TAdapterActionButton
            ActionName = 'FirstRow'
            Caption = 'First'
          end
          object CmdPrevRow: TAdapterActionButton
            ActionName = 'PrevRow'
            Caption = 'Prev'
          end
          object CmdNextRow: TAdapterActionButton
            ActionName = 'NextRow'
            Caption = 'Next'
          end
          object CmdLastRow: TAdapterActionButton
            ActionName = 'LastRow'
            Caption = 'Last'
          end
          object CmdRefreshRow2: TAdapterActionButton
            ActionName = 'RefreshRow'
            Caption = 'Refresh'
          end
          object CmdApply2: TAdapterActionButton
            ActionName = 'Apply'
            HideOptions = []
          end
        end
        object AdapterCommandGroup2: TAdapterCommandGroup
          DisplayComponent = AdapterGrid1
          object CmdNewRow: TAdapterActionButton
            ActionName = 'NewRow'
            Caption = 'New...'
            PageName = 'NewRow'
          end
        end
      end
      object LayoutGroup1: TLayoutGroup
        DisplayColumns = -1
        object AdapterErrorList1: TAdapterErrorList
          Adapter = DM.ItemsAdapter
        end
        object AdapterGrid1: TAdapterGrid
          TableAttributes.Border = 0
          Adapter = DM.ItemsAdapter
          AdapterMode = 'Edit'
          object ColItemNo: TAdapterDisplayColumn
            FieldName = 'ItemNo'
            Align = haCenter
          end
          object ColPartNo: TAdapterDisplayColumn
            FieldName = 'PartNo'
            Align = haCenter
          end
          object ColDiscount: TAdapterDisplayColumn
            FieldName = 'Discount'
            Align = haCenter
          end
          object ColEdit: TAdapterEditColumn
            Style = 'text-align: right'
            Custom = 'align=right'
            DisplayWidth = 10
            FieldName = 'Qty'
          end
          object AdapterCommandColumn1: TAdapterCommandColumn
            Caption = 'Delete'
            Align = haCenter
            object AdapterDisplayActionField1: TAdapterDisplayActionField
              Caption = ' '
              FieldName = 'DataSetAdapterDeleteRowField'
              Align = haCenter
            end
          end
        end
      end
    end
  end
end
