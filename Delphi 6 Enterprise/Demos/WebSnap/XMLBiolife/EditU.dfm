object Details: TDetails
  OldCreateOrder = False
  PageProducer = XMLBuilder1
  Left = 85
  Top = 156
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
      object XMLFieldGroup1: TXMLFieldGroup
        Adapter = DM.DataSetAdapter1
        TagName = 'FieldGroup'
        DataTagName = 'Data'
        LayoutTagName = 'Layout'
        AdapterMode = 'Edit'
        object FldItemSpeciesNo: TXMLAdapterFieldItem
          FieldName = 'SpeciesNo'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Species No'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemCategory: TXMLAdapterFieldItem
          FieldName = 'Category'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Category'
          DisplayWidth = 15
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemCommon_Name: TXMLAdapterFieldItem
          FieldName = 'Common_Name'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Common_Name'
          DisplayWidth = 30
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemSpeciesName: TXMLAdapterFieldItem
          FieldName = 'SpeciesName'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Species Name'
          DisplayWidth = 40
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemLengthcm: TXMLAdapterFieldItem
          FieldName = 'Lengthcm'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Length (cm)'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemLength_In: TXMLAdapterFieldItem
          FieldName = 'Length_In'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Length_In'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemNotes: TXMLAdapterFieldItem
          FieldName = 'Notes'
          ViewMode = vmToggleOnAccess
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrVirtual
          DisplayRows = 6
          DisplayColumns = 60
          Caption = 'Notes'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object FldItemGraphic: TXMLAdapterFieldItem
          FieldName = 'Graphic'
          ViewMode = vmDefault
          DisplayType = dftDefault
          InputType = iftDefault
          HideOptions = [hoHideOnNoInputAccess, hoHideOnFieldNotVisible]
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Graphic'
          DisplayWidth = 10
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
        object XMLAdapterFieldItem: TXMLAdapterFieldItem
          FieldName = 'Graphic'
          ViewMode = vmDisplay
          DisplayType = dftDefault
          InputType = iftDefault
          Align = haDefault
          VAlign = haVDefault
          TextAreaWrap = wrOff
          DisplayColumns = -1
          Caption = 'Graphic'
          DisplayWidth = 0
          CaptionAlign = haDefault
          CaptionVAlign = haVDefault
        end
      end
      object XMLCommandGroup1: TXMLCommandGroup
        XMLComponent = XMLFieldGroup1
        TagName = 'CommandGroup'
        DataTagName = 'Data'
        LayoutTagName = 'Layout'
        object ActItemFirstRow: TXMLAdapterActionItem
          ActionName = 'FirstRow'
          DisplayType = ctDefault
          Caption = 'FirstRow'
        end
        object ActItemPrevRow: TXMLAdapterActionItem
          ActionName = 'PrevRow'
          DisplayType = ctDefault
          Caption = 'PrevRow'
        end
        object ActItemNextRow: TXMLAdapterActionItem
          ActionName = 'NextRow'
          DisplayType = ctDefault
          Caption = 'NextRow'
        end
        object ActItemLastRow: TXMLAdapterActionItem
          ActionName = 'LastRow'
          DisplayType = ctDefault
          Caption = 'LastRow'
        end
        object ActItemCancel: TXMLAdapterActionItem
          ActionName = 'Cancel'
          PageName = 'Grid'
          HideOptions = [bhoHideOnActionNotVisible, bhoHideOnDisabledAction]
          DisplayType = ctDefault
          Caption = 'Cancel'
        end
        object ActItemApply: TXMLAdapterActionItem
          ActionName = 'Apply'
          HideOptions = [bhoHideOnNoExecuteAccess, bhoHideOnActionNotVisible, bhoHideOnDisabledAction]
          DisplayType = ctDefault
          Caption = 'Apply'
        end
        object ActItemRefreshRow: TXMLAdapterActionItem
          ActionName = 'RefreshRow'
          HideOptions = [bhoHideOnActionNotVisible, bhoHideOnDisabledAction]
          DisplayType = ctDefault
          DisplayColumns = 2
          Caption = 'RefreshRow'
        end
      end
    end
  end
end
