�
 TFRMEXECPROC 0�  TPF0TFrmExecProcFrmExecProcLeft� TopiWidth�Height<HintYExplore the ShipOrderProc in the DmEmployee data model to see what shipping an order doesActiveControlPanel1CaptionSales Review
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterShowHint	OnHideFormHideOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top Width�Height)AlignalTopTabOrder  TSpeedButtonBtnShipOrderLeftTopWidth@HeightHintMark current order as shippedCaption&Ship OrderEnabledOnClickBtnShipOrderClick  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceDmEmployee.SalesSourceCtl3DParentCtl3DTabOrder   TBitBtnBitBtn1LeftgTopWidth<HeightHintExit and close this formCaptionE&xitTabOrderKindbkCloseStylebsNew   TPanelPanel2Left Top)Width�Height� AlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGridDBGrid1LeftTopWidth�Height� Hint&Select an open order to ship the orderAlignalClientBorderStylebsNone
DataSourceDmEmployee.SalesSourceTabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanelPanel3Left Top� Width�HeightnHint/Customers are linked to sales in the data modelAlignalBottom
BevelInner	bvLoweredBorderWidthCaptionPanel3TabOrder 
TScrollBox	ScrollBoxLeftTopWidth�HeightbHorzScrollBar.MarginVertScrollBar.MarginAlignalClientBorderStylebsNoneTabOrder  TLabelLabel1Left� TopWidth@Height	AlignmenttaRightJustifyCaptionCustomer No:FocusControlEditCUST_NO  TLabelLabel2LeftTopWidth/Height	AlignmenttaRightJustifyCaptionCompany:FocusControlEditCUSTOMER  TLabelLabel3LeftTopWidth(Height	AlignmenttaRightJustifyCaptionContact:FocusControlEditCONTACT_FIRST  TLabelLabel6LeftTop2Width)Height	AlignmenttaRightJustifyCaptionAddress:FocusControlEditADDRESS_LINE  TLabelLabel4Left� TopWidth"Height	AlignmenttaRightJustifyCaptionPhone:  TDBEditEditCUST_NOLeftTopWidth1Height	DataFieldCUST_NO
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder   TDBEditEditCUSTOMERLeft3TopWidth}Height	DataFieldCUSTOMER
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditCONTACT_FIRSTLeft3TopWidthKHeight	DataFieldCONTACT_FIRST
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditCONTACT_LASTLeft� TopWidthdHeight	DataFieldCONTACT_LAST
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditPHONE_NOLeftTopWidthxHeight	DataFieldPHONE_NO
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditADDRESS_LINELeft3Top0Width� Height	DataFieldADDRESS_LINE1
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditADDRESS_LINE2Left� Top0Width� Height	DataFieldADDRESS_LINE2
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditCITYLeft3TopFWidth}Height	DataFieldCITY
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditSTATE_PROVINCELeft� TopFWidthKHeight	DataFieldSTATE_PROVINCE
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder  TDBEditEditCOUNTRYLeftTopFWidthKHeight	DataFieldCOUNTRY
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder	  TDBEditEditPOSTAL_CODELeftPTopFWidth<Height	DataFieldPOSTAL_CODE
DataSourceDmEmployee.CustomerSource	MaxLength TabOrder
  TDBCheckBoxDBCheckBox1LeftMTopWidthCHeightCaptionOn Hold	DataFieldON_HOLD
DataSourceDmEmployee.CustomerSource
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderValueChecked
True;*;YesValueUncheckedFalse; ;;NIL;No    TDataSourceSalesSourceDataSetDmEmployee.SalesTableEnabledOnDataChangeSalesSourceDataChangeLeft� TopP   