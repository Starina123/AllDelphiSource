object OrderForm: TOrderForm
  OldCreateOrder = False
  PageProducer = AdapterPageProducer
  DefaultAction.Adapter = WebDataModule1.OrdersAdapter
  DefaultAction.ActionName = 'RefreshRow'
  Left = 254
  Top = 107
  Height = 150
  Width = 215
  object AdapterPageProducer: TAdapterPageProducer
    Styles.Strings = (
      '.labels {font-weight: bold }')
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
      Custom = 'border=1  bgcolor=#CFFCFFFFF'
      object LayoutGroup1: TLayoutGroup
        DisplayColumns = 2
        Custom = 'cellpadding=4 '
        object OrdersLayoutGroup: TLayoutGroup
          DisplayColumns = -1
          object OrderErrors: TAdapterErrorList
            Adapter = WebDataModule1.OrdersAdapter
          end
          object OrderFieldGroup: TAdapterFieldGroup
            Custom = 'cellpadding=4'
            Adapter = WebDataModule1.OrdersAdapter
            object FldOrderNo: TAdapterDisplayField
              Style = 'background-color: white'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'OrderNo'
              ViewMode = vmDisplay
            end
            object FldCustNo: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'CustNo'
              ViewMode = vmDisplay
            end
            object FldSaleDate: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 18
              FieldName = 'SaleDate'
              ViewMode = vmDisplay
            end
            object FldShipDate: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 18
              FieldName = 'ShipDate'
              ViewMode = vmDisplay
            end
            object FldEmpNo: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'EmpNo'
              ViewMode = vmDisplay
            end
            object FldShipToContact: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 20
              FieldName = 'ShipToContact'
            end
            object FldShipToAddr1: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 30
              FieldName = 'ShipToAddr1'
            end
            object FldShipToAddr2: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 30
              FieldName = 'ShipToAddr2'
            end
            object FldShipToCity: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 15
              FieldName = 'ShipToCity'
            end
            object FldShipToState: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 20
              FieldName = 'ShipToState'
            end
            object FldShipToZip: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'ShipToZip'
            end
            object FldShipToCountry: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 20
              FieldName = 'ShipToCountry'
            end
            object FldShipToPhone: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 15
              FieldName = 'ShipToPhone'
            end
            object FldShipVIA: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 7
              FieldName = 'ShipVIA'
            end
            object FldPO: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 15
              FieldName = 'PO'
              ViewMode = vmDisplay
            end
            object FldTerms: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 6
              FieldName = 'Terms'
              ViewMode = vmDisplay
            end
            object FldPaymentMethod: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 7
              FieldName = 'PaymentMethod'
              ViewMode = vmDisplay
            end
            object FldItemsTotal: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'ItemsTotal'
              ViewMode = vmDisplay
            end
            object FldTaxRate: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'TaxRate'
              ViewMode = vmDisplay
            end
            object FldFreight: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'Freight'
              ViewMode = vmDisplay
            end
            object FldAmountPaid: TAdapterDisplayField
              Style = 'background-color: white'
              Custom = 'bgcolor=blue'
              CaptionAttributes.StyleRule = 'labels'
              CaptionAttributes.Align = haRight
              DisplayWidth = 10
              FieldName = 'AmountPaid'
            end
          end
        end
        object ItemsLayoutGroup: TLayoutGroup
          DisplayColumns = 1
          Custom = 'valign=top'
          object ItemsErrors: TAdapterErrorList
            Adapter = WebDataModule1.ItemsAdapter
          end
          object ItemsGrid: TAdapterGrid
            TableAttributes.CellPadding = 4
            RowAttributes.BgColor = 'White'
            Adapter = WebDataModule1.ItemsAdapter
            object ColItemNo: TAdapterDisplayColumn
              FieldName = 'ItemNo'
            end
            object ColEditQty: TAdapterEditColumn
              DisplayWidth = 10
              FieldName = 'Qty'
            end
            object ColEditPartNo: TAdapterEditColumn
              DisplayWidth = 10
              FieldName = 'PartNo'
            end
            object ColEditDiscount: TAdapterEditColumn
              DisplayWidth = 10
              FieldName = 'Discount'
            end
          end
        end
        object OrderCommandGroup: TAdapterCommandGroup
          DisplayComponent = OrderFieldGroup
          Custom = ' width=100%'
          object CmdEditRow: TAdapterActionButton
            ActionName = 'EditRow'
            Caption = 'Edit'
            HideOptions = []
            Align = haCenter
          end
          object CmdBrowseRow: TAdapterActionButton
            ActionName = 'BrowseRow'
            Caption = 'Browse'
            HideOptions = []
            Align = haCenter
          end
          object CmdCancel: TAdapterActionButton
            ActionName = 'Cancel'
            HideOptions = []
            Align = haCenter
          end
          object CmdApply: TAdapterActionButton
            ActionName = 'Apply'
            HideOptions = []
            Align = haCenter
          end
          object CmdRefreshRow: TAdapterActionButton
            ActionName = 'RefreshRow'
            Caption = 'Refresh'
            HideOptions = []
            Align = haCenter
          end
        end
      end
    end
  end
end
