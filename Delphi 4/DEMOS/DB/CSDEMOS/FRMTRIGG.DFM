�
 TFRMTRIGGERDEMO 05  TPF0TFrmTriggerDemoFrmTriggerDemoLeft� TopKWidth�HeightVHint4Explore the EmployeeTable to see the trigger sourcesActiveControlPanel1CaptionSalary Change Auditing
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterShowHint	OnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthHeight)AlignalTopTabOrder  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceDmEmployee.EmployeeSourceVisibleButtonsnbFirstnbPriornbNextnbLastnbEditnbPostnbCancel	nbRefresh Ctl3DParentCtl3DTabOrder   TBitBtnBitBtn1Left;TopWidth<HeightHintExit and close this formCaptionE&xitTabOrderKindbkCloseStylebsNew   TPanelPanel2Left Top)WidthHeight� AlignalTop
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGridDBGrid1LeftTopWidthsHeight}Hint%Changing a salary initiates a triggerAlignalClientBorderStylebsNoneColumns	FieldName	FULL_NAMEReadOnly	Width| 	FieldNameSALARY 	FieldName	JOB_GRADEReadOnly	  
DataSourceDmEmployee.EmployeeSourceTabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanelPanel3Left Top� WidthHeight� AlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel3TabOrder TDBGridDBGrid2LeftTopWidthsHeight� Hint:Salary history is maintained by a trigger on salary changeAlignalClientBorderStylebsNoneColumns	FieldNameEMPLOYEEWidth{ 	FieldNameCHANGE_DATE 	FieldName
OLD_SALARY 	FieldName
NEW_SALARY 	FieldNamePERCENT_CHANGE 	FieldName
UPDATER_ID  
DataSourceDmEmployee.SalaryHistorySourceReadOnly	TabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style     