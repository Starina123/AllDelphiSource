�
 TADODBTEST 0P�  TPF0
TADODBTest	ADODBTestLeft� Top� HorzScrollBar.Increment4VertScrollBar.Increment-
AutoScrollCaption ADO DB Controls Test ApplicationClientHeight�ClientWidth�Color	clBtnFace
ParentFont	Menu	MainMenu1OldCreateOrder	PositionpoScreenCenterOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight TLabelLabel1LeftTop5WidthHeight  
TStatusBar	StatusBarLeft Top�Width�HeightPanelsTextMessageWidth, TextModifiedWidthP TextNullWidth2 TextRecNoWidth2  SimplePanel  TPageControlAreaSelectorLeftTopWidth�Height� 
ActivePage
SourcePageAnchorsakLeftakTopakRight Constraints.MinWidth�TabOrder 	TTabSheet
SourcePageCaptionSource TSpeedButtonEditConnStrLeft�TopWidthHeightCaption...Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickEditConnStrClick  TLabelLabel2LeftTop�WidthWHeightCaptionConnection String:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFont  	TGroupBox
TableNamesLeftTop&Width� HeightLCaption Master/Detail Tables TabOrder 	TComboBoxMasterTableNameLeftTopWidthtHeightDropDownCount
ItemHeightSorted	TabOrder TextCustomerOnClickMasterTableNameClick
OnDropDownMasterTableNameDropDown
OnKeyPressMasterTableNameKeyPress  	TComboBoxDetailTableNameLeftTop-WidthtHeightDropDownCount
ItemHeightSorted	TabOrderTextOrdersOnClickDetailTableNameClick
OnDropDownMasterTableNameDropDown
OnKeyPressMasterTableNameKeyPress   	TGroupBoxQueryStringsLeft� Top&Width� HeightKCaption Master/Detail Queries TabOrder TSpeedButton
PrevQuery1Left� Top'WidthHeightAction	PrevQueryFlat	
Glyph.Data
6  2  BM2      6   (               �   �  �          � �� �� �� �� �� �� �� �� �� �� �   � �                           � �   � �� �                     � �� �   � �� �� �               � �� �� �   � �� �� �� �         � �� �� �� �   � �� �� �� �� �   � �� �� �� �� �   � �� �� �� �� �� �� �� �� �� �� �   ParentShowHintShowHint	  TSpeedButton
NextQuery1Left� Top4WidthHeightAction	NextQueryFlat	
Glyph.Data
6  2  BM2      6   (               �   �  �          � �� �� �� �� �� �� �� �� �� �� �   � �� �� �� �� �   � �� �� �� �� �   � �� �� �� �         � �� �� �� �   � �� �� �               � �� �� �   � �� �                     � �� �   � �                           � �   � �� �� �� �� �� �� �� �� �� �� �   ParentShowHintShowHint	  TSpeedButtonEditCommandTextLeft� TopWidthHeightCaption...Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickEditCommandTextClick  TMemo	MasterSQLLeftTopWidth� HeightLines.StringsSelect * from Customer TabOrder OnChangeMasterSQLChange
OnKeyPressMasterSQLKeyPress  TMemo	DetailSQLLeftTop-Width� HeightLines.Strings$select * from orders where CustNo = :CustNo TabOrder
OnKeyPressMasterSQLKeyPress   	TComboBoxConnectionStringLeftTopWidth�HeightHintasdfasdfDropDownCount
ItemHeightParentShowHintShowHint	TabOrder OnClickConnectionStringClick
OnKeyPressConnectionStringKeyPress  	TGroupBoxProcedureNamesLeftiTop&Width}HeightKCaption Stored Procedure TabOrder 	TComboBoxMasterProcNameLeft	TopWidthlHeight
ItemHeightTabOrder OnClickMasterProcNameClick
OnDropDownProcNameDropDown
OnKeyPressMasterProcNameKeyPress  	TComboBoxDetailProcNameLeft	Top,WidthlHeight
ItemHeightTabOrderOnClickDetailProcNameClick
OnDropDownProcNameDropDown    	TTabSheet
FieldsPageCaptionFieldsOnShowFieldsPageShow TDBGridFieldSchemaGridLeft Top Width�HeightxAlignalClient
DataSourceFieldSchemaSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    	TTabSheet	ParamPageCaption
Parameters
ImageIndexOnShowParamPageShow TLabelParameterNameLabelLeft� TopWidthHeightCaptionName  TLabel
PTypeLabelLeft� Top(WidthHeightCaptionType  TLabelPValueLabelLeft� TopOWidthHeightCaptionValue  TLabel
PSizeLabelLeft� TopWidthHeightCaptionSize  TLabelPScaleLabelLeft� Top)WidthHeightCaptionScale  TLabelPPrecisionLabelLeft� TopOWidth+HeightCaption	Precision  TListBoxParameterListLeftTopWidth|HeightJ
ItemHeightTabOrder OnClickParameterListClick  TEditParameterNameLeft� TopWidtheHeightTabOrderOnChangeParameterDataChange  TEditParameterValueLeft� Top]WidtheHeightTabOrderOnChangeParameterDataChange  TEditParameterSizeLeft� TopWidthGHeightTabOrderOnChangeParameterDataChange  TEditParameterScaleLeft� Top7WidthGHeightTabOrderOnChangeParameterDataChange  TEditParameterPrecisionLeft� Top]WidthGHeightTabOrderOnChangeParameterDataChange  TRadioGroupParameterDirectionGroupLeftBTopWidth� Height9Caption Direction ColumnsItems.StringsInputOutputIn/OutReturn TabOrderOnClickParameterDataChange  	TGroupBoxParamAttributesLeftBTop?Width� Height4Caption Attributes TabOrder 	TCheckBoxPANullableCheckBoxLeftTopWidthHHeightCaptionNullableTabOrder OnClickParameterDataChange  	TCheckBoxPASignedCheckBoxLeftTopWidthBHeightCaptionSignedTabOrderOnClickParameterDataChange  	TCheckBoxPALongCheckBoxLeftWTopWidth4HeightCaptionLongTabOrderOnClickParameterDataChange   TButtonAddParameterButtonLeftTop^Width6HeightCaptionAddTabOrderOnClickAddParameterButtonClick  TButtonRefreshParametersButtonLeftBTop^Width6HeightCaptionRefreshTabOrder	OnClickRefreshParametersButtonClick  	TComboBoxParameterTypeLeft� Top7WidtheHeight
ItemHeightTabOrder
OnChangeParameterDataChange  TRadioButton	SQLParamsLeftTopWidth+HeightCaptionSQLChecked	TabOrderTabStop	OnClickParameterSourceClick  TRadioButton
ProcParamsLeft2TopWidthIHeightCaption
StoredProcTabOrderOnClickParameterSourceClick   	TTabSheet	IndexPageCaptionIndexesOnShowIndexPageShow TLabelLabel11Left
TopWidthAHeightCaptionIndex Names:  TLabelLabel14Left� TopWidthHeightCaptionFields:  TLabelLabel3Left� Top(Width7HeightCaptionDescFields:  TLabelLabel13Left� TopPWidthDHeightCaptionCaseInsFields:  TListBox	IndexListLeftTopWidth� Heightd
ItemHeightTabOrder OnClickIndexListClick  TEditIndexFieldsLeft� TopWidth� HeightReadOnly	TabOrder  TEdit
DescFieldsLeft� Top8Width� HeightReadOnly	TabOrder  TEditCaseInsFieldsLeft� Top`Width� HeightReadOnly	TabOrder  	TGroupBoxIndexOptionsLeftMTopWidth� HeightqCaption Index Options TabOrder 	TCheckBoxidxCaseInsensitiveLeftTopUWidthmHeightCaptionCase InsensitiveEnabledTabOrder   	TCheckBoxidxDescendingLeftTop@WidthVHeightCaption
DescendingEnabledTabOrder  	TCheckBox
idxPrimaryLeftTopWidthaHeightCaptionPrimaryEnabledTabOrder  	TCheckBox	idxUniqueLeftTop*WidthaHeightCaptionUniqueEnabledTabOrder    	TTabSheet
FilterPageCaptionFiltersOnShowFilterPageShow TLabelLabel10LeftTopWidthHeightCaptionFilter:  TEditFilterLeftTopWidth� HeightTabOrder OnExit
FilterExit
OnKeyPressFilterKeyPress  TButton	FindFirstLeft� Top2WidthKHeightCaptionF&ind FirstTabOrderOnClickFindFirstClick  TButtonFindNextLeft� TopTWidthKHeightCaption
Find &NextTabOrderOnClickFindNextClick  	TCheckBoxFilteredLeftTop.WidthaHeightCaptionFilteredTabOrderOnClickFilteredClick  TRadioGroupFilterGroupBoxLeft Top	WidthnHeightiCaption Filter Group Items.StringsPendingAffectedFetchedConflicting TabOrderOnClickFilterGroupBoxClick   	TTabSheet
LocatePageCaptionLocateOnShowLocatePageShow 	TGroupBoxLocateGroupBoxLeftTopWidthIHeightrCaption Locate TabOrder  TLabelLabel16Left
TopWidth$HeightCaption	Field(s):  TLabelLabel17LeftTop=WidthzHeightCaptionValues (comma delimited):  TButtonLocateButtonLeft� TopWidthKHeightCaption&LocateTabOrderOnClickLocateButtonClick  TEdit
LocateEditLeft
TopOWidth� HeightTabOrder  	TComboBoxLocateFieldLeft
Top Width� Height
ItemHeightSorted	TabOrder 
OnDropDownLocateFieldDropDown  	TCheckBoxlocPartialKeyLeft� TopJWidthaHeightCaptionPartial KeyTabOrder  	TCheckBox
LocateNullLeft� Top0WidthaHeightCaption
Null ValueTabOrderOnClickLocateNullClick    	TTabSheet	TabSheet1CaptionMiscTest TButton
TestButtonLeftTopWidthKHeightCaptionTestTabOrder OnClickTestButtonClick    TPanel	DataPanelLeftTop� Width�Height� AnchorsakLeftakTopakRightakBottom Constraints.MinHeightPConstraints.MinWidth�TabOrder TPanelNavigatorPanelLeftTopWidth�HeightAlignalTop
BevelOuterbvNoneTabOrder  TLabelReadOnlyLabelLeft�Top	Width<HeightCaption	Read OnlyFont.CharsetANSI_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontVisible  TDBNavigatorDBNavigator1LeftTopWidth� Height
DataSourceMasterDataSourceTabOrder   TRadioButton	ADOButtonLeftTopWidth*HeightCaptionADOChecked	TabOrderTabStop	OnClickADOButtonClick  TRadioButtonMidasButtonLeft8TopWidth6HeightCaptionMidasTabOrderOnClickMidasButtonClick   TPanelBlobCtrlPanelLeft;TopWidth� Height� AlignalRight
BevelOuterbvNoneBorderWidthTabOrderVisible 	TSplitter	Splitter1LeftTopkWidth� HeightCursorcrVSplitAlignalBottomVisible  TDBMemoDBMemo1LeftTopWidth� HeightiAlignalClient
DataSourceMasterDataSource	MaxLength 	PopupMenu
PopupMenu1TabOrder   TDBImageDBImage1LeftTopmWidth� HeightlAlignalBottom
DataSourceMasterDataSource	PopupMenu
PopupMenu1TabOrder   TPanel	GridPanelLeftTopWidth:Height� AlignalClient
BevelOuterbvNoneBorderWidthTabOrder 	TSplitterGridSplitterLeftTopkWidth6HeightCursorcrVSplitAlignalBottomVisible  TDBGrid
DetailGridLeftTopmWidth6HeightlAlignalBottom
DataSourceDetailDataSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style Visible
OnColEnterGridColEnterOnEnterGridSetFocusOnTitleClickGridTitleClick  TDBGrid
MasterGridLeftTopWidth6HeightiAlignalClient
DataSourceMasterDataSourceParentShowHintShowHint	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnColEnterGridColEnterOnColumnMovedMasterGridColumnMovedOnEnterGridSetFocusOnTitleClickGridTitleClick  
TScrollBoxDBEditScrollerLeftTopWidth/Height TabOrder    TListBoxEventsLeft Top2Width� Height}AnchorsakTopakRightakBottom 
ItemHeightTabOrder  TToolBarToolBar1Left Top Width�HeightBorderWidthCaptionToolBar1Flat	Images
ImageList1ParentShowHintShowHint	TabOrder TToolButtonOpenTableButtonLeft Top Action	OpenTable  TToolButtonOpenQueryButtonLeftTop Action	OpenQuery  TToolButtonToolButton1Left.Top ActionOpenProcedure  TToolButtonCloseActiveButtonLeftETop ActionCloseActiveDataSet  TToolButtonSep1Left\Top WidthCaptionSep1
ImageIndexStyletbsSeparator  TToolButtonLoadPacketButtonLeftjTop ActionLoadFromFile  TToolButtonSavePacketButtonLeft� Top Action
SaveToFile  TToolButtonSep2Left� Top WidthCaptionSep2
ImageIndexStyle
tbsDivider  TToolButtonClearFieldButtonLeft� Top Action
ClearField  TToolButtonSep3Left� Top WidthCaptionSep3
ImageIndexStyle
tbsDivider  TToolButtonBatchUpdateButtonLeft� Top ActionBatchUpdate  TToolButtonCancelBatchButtonLeft� Top ActionCancelBatch  TToolButtonSep4Left� Top WidthCaptionSep4
ImageIndexStyletbsSeparator  TToolButtonMidasApplyUpdatesButtonLeftTop ActionMidasApplyUpdates  TToolButtonMidasCancelButtonLeftTop ActionMidasCancelUpdates  TToolButtonToolButton3Left5Top WidthCaptionToolButton3
ImageIndex	StyletbsSeparator  TToolButtonClearEventsButtonLeftCTop ActionClearEventLog   TProgressBarProgressBarLeft Top�Width-HeightMin MaxdStepTabOrderVisible  TDataSourceMasterDataSourceOnStateChangeDataSourceStateChangeOnDataChangeDataSourceDataChangeOnUpdateDataDataSourceUpdateDataLeftTop  TOpenDialog
OpenDialog
DefaultExtdtgFilterKTableGram Files (*.dtg)|*.dtg|Delphi form (*.dfm)|*.dfm|All Files (*.*)|*.*TitleLoad Data FileLeft+TopA  TSaveDialog
SaveDialog
DefaultExtdtgFilterKTableGram Files (*.dtg)|*.dtg|Delphi form (*.dfm)|*.dfm|All Files (*.*)|*.*OptionsofOverwritePrompt TitleSave Data FileLeft+Topc  
TPopupMenu
PopupMenu1OnPopupPopupMenu1PopupLeftTopc 	TMenuItemAssignField1Caption&Assign FieldOnClickFieldSelect   TDataSourceDetailDataSourceOnStateChangeDataSourceStateChangeOnDataChangeDataSourceDataChangeOnUpdateDataDataSourceUpdateDataLeftTop�  	TMainMenu	MainMenu1Left	TopB 	TMenuItemFileMenuCaption&FileOnClickFileMenuClick 	TMenuItem
OpenTable1Action	OpenTable  	TMenuItem
OpenQuery1Action	OpenQuery  	TMenuItemOpenProcedure1ActionOpenProcedure  	TMenuItem
FileReopenCaptionReopen 	TMenuItemReopenHolderCaptionPlaceHolder   	TMenuItemExecuteQuery1ActionExecuteCommand  	TMenuItemCloseActiveDataset1ActionCloseActiveDataSet  	TMenuItemDisconnectDataSet1ActionDisconnectDataSet  	TMenuItemDisconnect1ActionCloseConnection  	TMenuItemN3Caption-  	TMenuItemLoadDatapacket1ActionLoadFromFile  	TMenuItemSaveDataPacket1Action
SaveToFile  	TMenuItemLoadBlobfromfile1ActionLoadBlobFromFile  	TMenuItemN1Caption-  	TMenuItemSaveformtofile1ActionStreamFormOut  	TMenuItemLoadFormfromFile1ActionStreamFormIn  	TMenuItemN2Caption-  	TMenuItemExit1ActionExitApplication   	TMenuItemEditMenuCaption&Edit 	TMenuItemBatchUpdates1ActionBatchUpdate  	TMenuItemCancelBatch1ActionCancelBatch  	TMenuItemN6Caption-  	TMenuItemApplyUpdatesMidas1ActionMidasApplyUpdates  	TMenuItemCancelUpdatesMidas1ActionMidasCancelUpdates  	TMenuItemN7Caption-  	TMenuItemClearField1Action
ClearField  	TMenuItemRefreshData1ActionRefreshData   	TMenuItemViewMenuCaption&View 	TMenuItemDisplayDetailTable1ActionDisplayDetails  	TMenuItemBlobfieldasImage1ActionBlobAsImage  	TMenuItemN5Caption-  	TMenuItemViewEvents1Action
ViewEvents  	TMenuItemClearEventLog1ActionClearEventLog   	TMenuItemSettingsMenuCaption	&Settings 	TMenuItemUseClientCursorItemActionUseClientCursor  	TMenuItemUseadCmdTableDirect1ActionUseTableDirect  	TMenuItemUseShapeProvider1ActionUseShapeProvider  	TMenuItemCursorTypeItemCaptionC&ursor Type 	TMenuItemCurTypeUnspecifiedCaption&Unspecified
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemCurTypeForwardOnlyCaption&Forward Only
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemCurTypeKeysetCaption&KeysetChecked	
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemDynamic1Caption&Dynamic
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemCurTypeStaticCaption&Static
GroupIndex	RadioItem	OnClickRadioItemClick   	TMenuItemLockTypeItemCaption
&Lock Type 	TMenuItemLckTypeUnspecifiedCaption&Unspecified
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemLckTypeReadOnlyCaption
&Read Only
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemLckTypePessimisticCaption&Pessimistic
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemLckTypeOptimisticCaption&OptimisticChecked	
GroupIndex	RadioItem	OnClickRadioItemClick  	TMenuItemLckTypeBatchOptimisticCaption&Batch Optimistic
GroupIndex	RadioItem	OnClickRadioItemClick   	TMenuItemMaxRecords1Action
MaxRecords  	TMenuItem
EnableBCD1Action	EnableBCD  	TMenuItemN4Caption-  	TMenuItemAsyncConnect1ActionAsyncConnect  	TMenuItemAsyncExecute1ActionAsyncExecute  	TMenuItemAsyncFetch1Action
AsyncFetch   	TMenuItemHelpMenuCaption&Help 	TMenuItemHelpAboutItemAction	HelpAboutCaption	&About...    TActionListActionList1Images
ImageList1LeftTop�  TActionBatchUpdateCategoryEditCaption&Apply Batch UpdatesHint)Apply pending batch updates to the server
ImageIndexShortCutB@	OnExecuteBatchUpdateExecuteOnUpdateEditActionsUpdate  TActionCancelBatchCategoryEditCaption&Cancel Batch UpdatesHintCancel pending batch updates
ImageIndex	OnExecuteCancelBatchExecute  TActionOpenProcedureCategoryFileCaptionOpen &ProcedureHintOpen stored procedure(s)
ImageIndexShortCutP@	OnExecuteOpenProcedureExecute  TAction	OpenTableCategoryFileCaptionOpen &TableHintOpen Table(s)
ImageIndex ShortCutT@	OnExecuteOpenTableExecute  TAction	OpenQueryCategoryFileCaptionOpen &QueryHintOpen Query(s)
ImageIndexShortCutQ@	OnExecuteOpenQueryExecute  TActionLoadFromFileCategoryFileCaptionLoad data from a file...HintLoad data from a file
ImageIndex
ShortCutL@	OnExecuteLoadFromFileExecute  TActionCloseActiveDataSetCategoryFileCaption&Close Active DatasetHintClose the active dataset
ImageIndex	OnExecuteCloseActiveDataSetExecuteOnUpdateFileActionsUpdate  TAction
SaveToFileCategoryFileCaption&Save data to a file...HintSave data to a file
ImageIndexShortCutS@	OnExecuteSaveToFileExecute  TActionExitApplicationCategoryFileCaptionE&xitHintExit the applicationShortCutX�  	OnExecuteExitApplicationExecute  TActionExecuteCommandCategoryFileCaption&Execute CommandHintExecute the current queryShortCutE@	OnExecuteExecSQLExecute  TActionStreamFormOutCategoryFileCaptionStream &Form Out...HintStream for to a form file	OnExecuteStreamFormOutClick  TActionStreamFormInCategoryFileCaptionStream Form &In...HintStream in form file	OnExecuteStreamFormInClick  TAction
ClearFieldCategoryEditCaption&Clear FieldHintSet the current field to Null
ImageIndexShortCutC`	OnExecuteClearFieldExecute  TAction
ViewEventsCategoryViewCaption&EventsHintDisplay event information	OnExecuteViewEventsExecute  TActionDisplayDetailsCategoryViewCaption&Display Detail TableChecked	Hint0Display detail or nested table in the lower grid	OnExecuteDisplayDetailsExecute  TActionRefreshDataCategoryEditCaptionRe&fresh Data	OnExecuteRefreshDataExecute  TActionClearEventLogCategoryViewCaption&Clear Event LogHintClear the event log
ImageIndex	OnExecuteClearEventLogExecuteOnUpdateClearEventLogUpdate  TAction	HelpAboutCaption	HelpAboutHintDisplay About Box	OnExecuteHelpAboutExecute  TAction	PrevQueryCategoryFileHint0Display the previous query from the history list	OnExecutePrevQueryExecuteOnUpdatePrevQueryUpdate  TAction	NextQueryCategoryFileHint@Display the next query from the history list, or insert new one.	OnExecuteNextQueryExecute  TActionUseClientCursorCategorySettingsCaptionUse &Client CursorChecked	HintUse client side cursor	OnExecuteBooleanActionExecute  TActionUseTableDirectCategorySettingsCaptionUse adCmd&TableDirectHint%Use the adCmdTableDirect command type	OnExecuteBooleanActionExecute  TActionUseShapeProviderCategorySettingsCaptionUse &Shape ProviderHintUse the Shape Provider	OnExecuteUseShapeProviderExecute  TActionCloseConnectionCategoryFileCaption&Close ConnectionHintClose the current connection	OnExecuteCloseConnectionExecute  TActionAsyncConnectCategorySettingsCaptionAsyncConnectHint"Make the connection asynchronously	OnExecuteBooleanActionExecute  TActionAsyncExecuteCategorySettingsCaptionAsyncExecuteHint"Execute the command asynchronously	OnExecuteBooleanActionExecute  TAction
AsyncFetchCategorySettingsCaption
AsyncFetchHintFetch records asynchronously	OnExecuteBooleanActionExecute  TAction
MaxRecordsCategorySettingsCaption&Max Records...Hint.Specify the max number of records in a dataset	OnExecuteMaxRecordsExecute  TActionMidasApplyUpdatesCategoryEditCaptionApply Updates (Midas)HintApply pending Midas updates
ImageIndexShortCutA@	OnExecuteMidasApplyUpdatesExecute  TActionMidasCancelUpdatesCategoryEditCaptionCancel Updates (Midas)HintCancel pending Midas updates
ImageIndex		OnExecuteMidasCancelUpdatesExecute  TAction	EnableBCDCategorySettingsCaption	EnableBCDChecked	Hint<Configure datasets to use BCD fields for numeric field types	OnExecuteBooleanActionExecute  TActionDisconnectDataSetCategoryFileCaption&Disconnect DataSetHint*Disconnect the dataset fromt he connection	OnExecuteDisconnectDataSetExecute  TActionBlobAsImageCategoryViewCaption&Blob field as ImageHint(View the current blob field in a DBImage	OnExecuteBlobAsImageExecuteOnUpdateBlobAsImageUpdate  TActionLoadBlobFromFileCategoryEditCaption&Load Blob from file...HintLoad blob data from a file	OnExecuteLoadBlobFromFileExecute   
TImageList
ImageList1Left+Top� Bitmap
&+  IL     �������������BM6       6   (   @   P          (                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ����!-                 (  �                                                                                           �2)7�2834/9�!5:� �/7%<�15:��&)2�9!806�*02!:�9%<�15:%   
*�6�3%&�94�6�3%&�9�&%3�*/8C �4�6!8
 �$� �	   ���%<�15:��&!<�2�722�"�2�:�2  *�1�4/7�&)2�9!806�*02!:�9�!!:�3/99�"�4��00:�7.�&)2�9!806�*02!:�9$)74� 08�<�:02!:�9 �4�0��$�0%<�15:% �� #:�7.�08)�1/9�9�!!:�3/99�)%:�4�3��00:�7.�08�2�7223$)74�)�2�4�< :�2�6!< 7�6�22/3 9�1/9�9�4.!�0�0�2�/7�� #:�7.�997##%:#4�!!:�3/99�)%:�4�3��00:�7.� �<�1�2�1�#4�1�2�$)74#%:#4 9�1/9�9�0�<�1(9/7�:36�/7%<�15:�!�7�2!7�1�4/7�:�2�!!:�3/99�)%:�4�3��00:�7.� �<�1%<�15:�#4�1�2�$)74�"�2�:�2 :�2�1�6�0.2�0�<�1(9/7�:36�/7%<�15:�!�7�2!7�1�4/7%<�15:% �4�3��00:�7.� �<�1�7.7�1�#4�1�2�$)74�&�5%44%�7.7�1�4/7�0�<�1(9/7�:36�/7%<�15:�!�7�2!7�1�4/7%<�15:% �� #:�7.�997�"�2/99#)6��00:�7.�4�1/7�2#:$)74"�9�7.7�1444%�7.7�1�4/7�'�"�2�:�2��4�1/7�2#:%<�15:% �� #:�7.�997�!/7�2#:�!!:�3/99�)%:                                                                 | |                         | |                               B B B B B B B B B B                          �=�=�^���=     | |                     | |                               �   B B B B B B B B B B                        �=�^���^�^       | |                 | |                                  ��  �=�=�=�=�=�=�=�= B B                      �=�^�^���^         | |������ | |                                    ��  �=�=�=�=�=�=�=�= B B B        �=          �=�^���^�^        �^ | |�=�=�=�= | |�^                                    ���        �=�=�=�= B B B                    �=�=�=�=�=�=        �   | |�� | |�c                                    �������                                  �=�^����^        c  � | | | |�=�c                                        ������� ��                            �=�=����=        �  ��= | |�=�=�c      ��0�0�2� &:%9#6                  ������� ��                              �=�=�=�=�=        �^  � | | | |��c      /7�2#:�7��!/7�2#:�7.�2�7�2/8%7      �=�=�=�=�=                                                     �   | |�=�= | |��^      �0�24'�;�2�722�'.(�9�"29/9�0�0                                                                     �^ | |���� | |�^      #9/6�"!:�)%:�2�7�2�1�7,6� &:%9                                                                | |             | |      �"!:�)%:�2�7�2�0�1%6� &:%9�0�1   ��                                                      | |  ��^�^�^�^�^� | |    
!%3/9�"�4�"!:�)%:�2�7�2%2):�    ��                          �=                           | |                     | |  %7� &:%9/8%7�0�0�2� &:%9/8%7!                               �=                           | |                         | |3:%9�7�"!:�)%:%9�72�0�0�2�2�9                                                                 |                             |�)#9/6�!3�2�)#9/6�"!:�)%:!3�2          �^  �������^     |                           | |                                                                          �  �    ��^     | |                       | |                                            BBBBBBBBBB            �^  �������^       | |                   | |    cBBBBBBBBBBB                �cccccccccB                                       | |               | |      �ccccccccccB                �c | |ccccccB            �^  ��^�^�^�^�^�^           | |           | |        �ccccccccccB                ����������                                             | |       | |          �c | |cccccccB                                                                                   | |   | |            �����������c                                                                                     | | |                                                                              �=�=�^���=                                 | | |                                                                              �=�^���^�^                               | |   | |                            ��=�����    ��=�����                �=�^�^���^                             | |       | |                          ��=�����    ��=�����                �=�^���^�^                           | |           | |            B          ��=�����    ��=�����          B    �=�=�=�=�=�=                         | |               | |      B              ��=�����    ��=�����                �=�^����^                       | |                   | |                    ��=�����    ��=�����                �=�=����=                     | |                       | |                                                                    �=�=�=�=�=                     |                           | |                                                                                                                                                                                                                                                                                                  ��������������                                      �  ����������^        BBB�=�=�=�=�=�=�=BB      �����= < < <�        �                                      �^  ����������^        �����������B      ����= |||< <�����                                      �  ����������^        �    ������  �B      ��� || |||< <�    �                                     �^  �BBB�    c        �      ����    �B      ���| |� |||<  ���                                �  �������� c        ��      ��    ��B      �  � ||�| ||  �  ��                                 c  �������� c        ���          ���B      ���� ||�|  � �  �=                                  �  ������ � c        ����      ����B      �    �� ||  ��� �                                    �^  �      �    c        ���          ���B      ������  �����  �=                                  �  ������ ���^        ��      ��    ��B      �        ��  ���   �=�=                                �^  ����������^        �      ����    �B      ��������  �  �^� �=                                                                    �    ������  �B                          �^���                                     �^  ��^�^�^�^�^cc��^        �����������B      �^            ����                                                                                                                          ���                                                                                                �=�=�=�=�=�=�=�=�=�=�=�=�=  �=�=                                                                                                                                     B B B B B B B B B B             B B B B B B B B B B                                                  �=�=�^���=            �   B B B B B B B B B B        �   B B B B B B B B B B                                                �=�^���^�^            �     B B B B B B B B B B      ��  �=�=�=�=�=�=�=�= B B                                              �=�^�^���^            �     B B B B B B B B B B B    ��  �=�=�=�=�=�=�=�= B B B                                            �=�^���^�^            �  �         B B B B B B B    ���        �=�=�=�= B B B                                            �=�=�=�=�=�=            �  �  ���                  �����                                                            �=�^����^            �  �^  ��������^        �����   ��                                                    �=�=����=            �  �  �     ��^        ������   �                                                      �=�=�=�=�=                �^  ��������^            �=�=�=�=�=                                                                                   �  �     ��^                                                                                                      �^  ��������^                                                                                                                                                                                                                                �^  ��^�^�^�^�^��^                                                                                                                                                                                                                                                                                                                                                          BM>       >   (   @   P         �                      ���                                                                                                                               ��?�  ����   ���   �����  � �׽  ��׽  -���� ǀ��� 9�������� �����  �?���  ����  �?���  ��?�  �����  �  ��� �   � �� � ��� � ��� ��ӓ �����' ����g������O?����>  s��6  s ��  C��'   ��3�  �<y�����~|�����������������������=��������������������)�����E���������������������P�����������������������   ���  ���  ���  ���    ���    ���    ���  ���  �����?�����?������������������?����������o�                        TADOConnection
ConnectionLoginPromptProviderBC:\Program Files\Common Files\System\OLE DB\Data Links\DBDemos.udlOnDisconnectConnectionDisconnectOnInfoMessageConnectionInfoMessageOnBeginTransCompleteConnectionBeginTransCompleteOnCommitTransCompleteConnectionCommitTransCompleteOnRollbackTransCompleteConnectionRollbackTransCompleteOnConnectCompleteConnectionConnectCompleteOnWillConnectConnectionWillConnectOnExecuteCompleteConnectionExecuteCompleteOnWillExecuteConnectionWillExecuteOnLoginConnectionLoginLeftTop�   	TADOTableMasterTable
Connection
Connection
BeforeOpenMasterTableBeforeOpen	AfterOpenMasterTableAfterOpenBeforeCloseMasterTableBeforeClose
AfterCloseDataSetAfterCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetErrorLeftTop�   	TADOTableDetailTable
Connection
Connection
BeforeOpenDetailTableBeforeOpen	AfterOpenDataSetAfterOpenBeforeCloseDataSetBeforeClose
AfterCloseDataSetAfterCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetErrorLeftTop  	TADOQueryMasterQuery
Connection
Connection
BeforeOpenMasterQueryBeforeOpen	AfterOpenMasterQueryAfterOpenBeforeCloseMasterQueryBeforeClose
AfterCloseDataSetAfterCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetError
Parameters Left.Top�   	TADOQueryDetailQuery
Connection
Connection
BeforeOpenDetailQueryBeforeOpen	AfterOpenDataSetAfterOpenBeforeCloseDataSetBeforeCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetError
DataSourceDetailQuerySource
Parameters Left-Top  TADOStoredProc
MasterProc
Connection
Connection
BeforeOpenMasterProcBeforeOpen	AfterOpenMasterProcAfterOpenBeforeCloseDataSetBeforeClose
AfterCloseDataSetAfterCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetError
Parameters Prepared	LeftOTop�   TADODataSet
ADODataSet
Connection
Connection
BeforeOpenDataSetBeforeOpen	AfterOpenDataSetAfterOpenBeforeCloseDataSetBeforeClose
AfterCloseDataSetAfterCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetError
Parameters LeftpTop�   TDataSourceDetailMasterSourceDataSetMasterTableLeftTop-  TDataSourceDetailQuerySourceDataSetMasterQueryLeft.Top-  TClientDataSetMasterClientData
Aggregates Params ProviderNameProviderOnReconcileErrorMasterClientDataReconcileErrorLeftTopP  TADOCommand
ADOCommand
Connection
ConnectionPrepared	
ParametersSize�Value   LeftpTop  TDataSetProviderProviderConstraints	Left.TopP  TADOStoredProc
DetailProc
Connection
Connection
BeforeOpenDetailProcBeforeOpen	AfterOpenDataSetAfterOpenBeforeCloseDataSetBeforeClose
AfterCloseDataSetAfterCloseBeforeInsertDataSetBeforeInsertAfterInsertDataSetAfterInsert
BeforeEditDataSetBeforeEdit	AfterEditDataSetAfterEdit
BeforePostDataSetBeforePost	AfterPostDataSetAfterPostBeforeCancelDataSetBeforeCancelAfterCancelDataSetAfterCancelBeforeDeleteDataSetBeforeDeleteAfterDeleteDataSetAfterDeleteBeforeScrollDataSetBeforeScrollAfterScrollDataSetAfterScrollOnDeleteErrorDataSetErrorOnEditErrorDataSetErrorOnNewRecordDataSetNewRecordOnPostErrorDataSetError
DataSourceDetailProcSource
Parameters Prepared	LeftPTop  TDataSourceDetailProcSourceDataSet
MasterProcLeftQTop-  TDataSourceFieldSchemaSourceDataSetFieldSchemaLeftrTopO  TADODataSetFieldSchema
Parameters LeftqTop. TWideStringFieldFieldSchemaCOLUMN_NAMEDisplayLabel	FieldNameDisplayWidth	FieldNameCOLUMN_NAMESize  
TWordFieldFieldSchemaDATA_TYPEDisplayLabelTypeDisplayWidth	FieldName	DATA_TYPE	OnGetTextFieldSchemaDATA_TYPEGetText  TIntegerField#FieldSchemaCHARACTER_MAXIMUM_LENGTHDisplayLabelSize	FieldNameCHARACTER_MAXIMUM_LENGTH  
TWordFieldFieldSchemaNUMERIC_PRECISIONDisplayLabel	Precision	FieldNameNUMERIC_PRECISION  TSmallintFieldFieldSchemaNUMERIC_SCALEDisplayLabelScale	FieldNameNUMERIC_SCALE   TClientDataSetDetailClientData
Aggregates Params LeftTop�   