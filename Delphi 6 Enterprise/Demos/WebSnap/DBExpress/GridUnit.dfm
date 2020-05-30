object Grid: TGrid
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
      object AdapterGrid1: TAdapterGrid
        Adapter = DM.DataSetAdapter1
        object AdapterCommandColumn1: TAdapterCommandColumn
          Caption = ' '
          object CmdEditRow: TAdapterActionButton
            ActionName = 'EditRow'
            PageName = 'Details'
          end
        end
        object ColCUST_NO: TAdapterDisplayColumn
          FieldName = 'CUST_NO'
        end
        object ColCUSTOMER: TAdapterDisplayColumn
          FieldName = 'CUSTOMER'
        end
        object ColCONTACT_FIRST: TAdapterDisplayColumn
          FieldName = 'CONTACT_FIRST'
        end
        object ColCONTACT_LAST: TAdapterDisplayColumn
          FieldName = 'CONTACT_LAST'
        end
        object ColPHONE_NO: TAdapterDisplayColumn
          FieldName = 'PHONE_NO'
        end
        object ColADDRESS_LINE1: TAdapterDisplayColumn
          FieldName = 'ADDRESS_LINE1'
        end
        object ColADDRESS_LINE2: TAdapterDisplayColumn
          FieldName = 'ADDRESS_LINE2'
        end
        object ColCITY: TAdapterDisplayColumn
          FieldName = 'CITY'
        end
        object ColSTATE_PROVINCE: TAdapterDisplayColumn
          FieldName = 'STATE_PROVINCE'
        end
        object ColCOUNTRY: TAdapterDisplayColumn
          FieldName = 'COUNTRY'
        end
        object ColPOSTAL_CODE: TAdapterDisplayColumn
          FieldName = 'POSTAL_CODE'
        end
        object ColON_HOLD: TAdapterDisplayColumn
          FieldName = 'ON_HOLD'
        end
      end
    end
  end
end
