object Grid: TGrid
  OldCreateOrder = False
  PageProducer = XMLBuilder1
  Left = 254
  Top = 107
  Height = 150
  Width = 215
  object XMLBuilder1: TAdapterXMLBuilder
    TagName = 'XMLBuilder'
    XSLTemplate = DM.XSLTemplate1
    Left = 32
    Top = 16
    object XMLForm1: TXMLForm
      TagName = 'Form'
      FormMethod = fmPost
      object XMLAdapterErrors1: TXMLAdapterErrors
        TagName = 'Errors'
        Adapter = DM.DataSetAdapter1
      end
      object XMLGrid1: TXMLGrid
        Adapter = DM.DataSetAdapter1
        TagName = 'Grid'
        DataTagName = 'Data'
        LayoutTagName = 'Layout'
        RowTagName = 'Row'
        object FldItemSpeciesNo: TXMLAdapterColumnItem
          DisplayType = coltDefault
          Align = haDefault
          VAlign = haVDefault
          FieldName = 'SpeciesNo'
          Caption = 'Species No'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemCategory: TXMLAdapterColumnItem
          DisplayType = coltDefault
          Align = haDefault
          VAlign = haVDefault
          FieldName = 'Category'
          Caption = 'Category'
          DisplayWidth = 15
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemNotes: TXMLAdapterColumnItem
          DisplayType = coltDefault
          Align = haDefault
          VAlign = haVDefault
          FieldName = 'Notes'
          Caption = 'Notes'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemGraphic: TXMLAdapterColumnItem
          DisplayType = coltDefault
          Align = haDefault
          VAlign = haVDefault
          FieldName = 'Graphic'
          Caption = 'Graphic'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object XMLCommandColumn1: TXMLCommandColumn
          TagName = 'CommandColumn'
          Caption = ' '
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
          Align = haDefault
          VAlign = haVDefault
          object ActItemDeleteRow: TXMLAdapterActionItem
            ActionName = 'DeleteRow'
            HideOptions = [bhoHideOnNoExecuteAccess, bhoHideOnActionNotVisible]
            DisplayType = ctDefault
            Caption = 'Delete'
          end
          object ActItemEditRow: TXMLAdapterActionItem
            ActionName = 'EditRow'
            PageName = 'Details'
            DisplayType = ctDefault
            Caption = 'Details...'
          end
          object ActItemNewRow: TXMLAdapterActionItem
            ActionName = 'NewRow'
            PageName = 'Details'
            HideOptions = [bhoHideOnNoExecuteAccess, bhoHideOnActionNotVisible]
            DisplayType = ctDefault
            Caption = 'New...'
          end
        end
      end
    end
  end
end
