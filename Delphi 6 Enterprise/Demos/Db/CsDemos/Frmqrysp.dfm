�
 TFRMQUERYPROC 0�  TPF0TFrmQueryProcFrmQueryProcLeft� TopEWidth}HeightoHintRExplore the Get_Emp_Proj procedure in the IBLOCAL alias to see the query procedureActiveControlPanel1CaptionEmployee Project Assignments
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style PositionpoScreenCenterShowHint	OnHideFormHideOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthuHeight)AlignalTopTabOrder  TDBNavigatorDBNavigatorLeftTopWidth� Height
DataSourceDmEmployee.EmployeeSourceCtl3DParentCtl3DTabOrder   TBitBtnBitBtn1Left1TopWidth<HeightHintExit and close this formCaptionE&xitTabOrderKindbkCloseStylebsNew   TPanelPanel2Left Top)WidthuHeight� AlignalTop
BevelInner	bvLoweredBorderWidthCaptionPanel2TabOrder TDBGridDBGrid1LeftTopWidthiHeight}Hint1Select an employee to execute the query procedureAlignalClientBorderStylebsNone
DataSourceEmployeeSourceTabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    TPanelPanel3Left Top� WidthuHeight� AlignalClient
BevelInner	bvLoweredBorderWidthTabOrder TDBGridDBGrid2LeftTopWidthiHeight� Hint?Use SQL Monitor to see the Get_Emp_Proj query procedure executeAlignalClientBorderStylebsNone
DataSourceEmployeeProjectsSourceTabOrder TitleFont.ColorclBlackTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style    
TStatusBar
StatusBar1Left TopDWidthuHeightPanels SimplePanel	  TQueryEmployeeProjectsQueryDatabaseNameEmployeeDemoDBParams.Data
     EMP_NO    SQL.Strings%Select * from Get_Emp_Proj( :EMP_NO ) Left� Top�   TDataSourceEmployeeProjectsSourceDataSetEmployeeProjectsQueryLeft� Top�   TDataSourceEmployeeSourceDataSetDmEmployee.EmployeeTableEnabledOnDataChangeEmployeeDataChangeLeft� TopH   