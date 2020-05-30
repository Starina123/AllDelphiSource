object NewRow: TNewRow
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
      Custom = 'bgcolor=#CCFFFFFF border=1'
      object AdapterFieldGroup2: TAdapterFieldGroup
        Custom = 'cellpadding=2'
        Adapter = DM.OrdersAdapter
        object AdapterDisplayField1: TAdapterDisplayField
          Caption = 'OrderNo:'
          CaptionAttributes.Style = 'font-weight: bold'
          CaptionAttributes.Align = haRight
          DisplayWidth = 10
          FieldName = 'OrderNo'
        end
        object AdapterDisplayField2: TAdapterDisplayField
          Caption = 'CustNo:'
          CaptionAttributes.Style = 'font-weight: bold'
          CaptionAttributes.Align = haRight
          DisplayWidth = 10
          FieldName = 'CustNo'
        end
      end
      object LayoutGroup1: TLayoutGroup
        DisplayColumns = -1
        object AdapterErrorList1: TAdapterErrorList
          Adapter = DM.ItemsAdapter
        end
        object AdapterFieldGroup1: TAdapterFieldGroup
          Custom = 'cellpadding=2'
          Adapter = DM.ItemsAdapter
          AdapterMode = 'Insert'
          object FldPartNo: TAdapterDisplayField
            Caption = 'PartNo:'
            CaptionAttributes.Style = 'font-weight: bold'
            CaptionAttributes.Align = haRight
            DisplayWidth = 10
            FieldName = 'PartNo'
          end
          object FldQty: TAdapterDisplayField
            Caption = 'Qty:'
            CaptionAttributes.Style = 'font-weight: bold'
            CaptionAttributes.Align = haRight
            DisplayWidth = 10
            FieldName = 'Qty'
          end
          object FldDiscount: TAdapterDisplayField
            Caption = 'Discount:'
            CaptionAttributes.Style = 'font-weight: bold'
            CaptionAttributes.Align = haRight
            DisplayWidth = 10
            FieldName = 'Discount'
          end
        end
      end
      object AdapterCommandGroup1: TAdapterCommandGroup
        DisplayComponent = AdapterFieldGroup1
        object CmdCancel: TAdapterActionButton
          ActionName = 'Cancel'
          PageName = 'ItemsTable'
        end
        object CmdApply: TAdapterActionButton
          ActionName = 'Apply'
          PageName = 'ItemsTable'
        end
        object CmdRefreshRow: TAdapterActionButton
          ActionName = 'RefreshRow'
          Caption = 'Refresh'
        end
      end
    end
  end
end
