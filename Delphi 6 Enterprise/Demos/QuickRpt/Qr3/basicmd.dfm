�
 TFRMBASICMD 0�  TPF0TfrmBasicMD
frmBasicMDLeft� TopkWidth�Height�Caption
frmBasicMDColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderScaledPixelsPerInch`
TextHeight 	TQuickRep	QuickRep1LeftTop Width0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSet
tbCustomerDescription.Strings(Basic Master/Detail report with grouping Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinAutoPrintIfEmpty	
SnapToGrid	UnitsInchesZoomd TQRBandDetailBand1Left0TopGWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values�������@�������	@ BandTyperbDetail 	TQRDBText	QRDBText1Left Top Width8HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@                    ������*�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet
tbCustomer	DataFieldCompanyTransparentWordWrap	FontSize
   TQRSubDetailQRSubDetail1Left0TopjWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@�������	@ Master	QuickRep1DataSet	qryOrders
FooterBandQRBand1PrintBeforePrintIfEmpty	 	TQRDBText	QRDBText2Left� Top Width1HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUu�@          UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet	qryOrders	DataFieldOrderNoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4Left�Top Width=HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@������R�@          UUUUUUe�@ 	AlignmenttaRightJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet	qryOrders	DataField
ItemsTotalTransparentWordWrap	FontSize
   TQRGroupQRGroup1Left0TopXWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values      ��@�������	@ 
ExpressionqryOrders.TermsMasterQRSubDetail1ReprintOnNewPage 	TQRDBText	QRDBText3Left� Top Width%HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU�@          ��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSet	qryOrders	DataFieldTermsTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1Left0Top0Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBoldfsUnderline ForceNewColumnForceNewPage
ParentFontSize.Values������j�@�������	@ BandTyperbColumnHeader TQRLabelQRLabel1Left Top Width=HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@                    UUUUUUe�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCompanyColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel2Left� Top Width(HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU�@          ��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTermsColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel3Left� Top Width[HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUu�@          TUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionOrder NumberColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel4LeftxTop WidthGHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@TUUUUU��@          ������ڻ@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionItems TotalColorclWhiteTransparentWordWrap	FontSize
  TQRLabelQRLabel5Left�Top WidthaHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@      ��	@          ������R�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionCustomer TotalColorclWhiteTransparentWordWrap	FontSize
   TQRBandQRBand1Left0Top|Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values     @�@�������	@ BandTyperbGroupFooter TQRExprQRExpr1Left�Top Width� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��	@                X�@ 	AlignmenttaRightJustifyAlignToBandAutoSize	AutoStretchColorclWhiteMasterQRSubDetail1ResetAfterPrint	TransparentWordWrap	
ExpressionSUM(qryOrders.ItemsTotal)Mask$,###.00FontSize
    TDataSource
dsCustomerDataSet
tbCustomerLeft  TTable
tbCustomerActive	DatabaseNameDBDEMOSIndexFieldNamesCompany	TableNameCUSTOMER.DBLeftTop   TQuery	qryOrdersActive	DatabaseNameDBDEMOS
DataSource
dsCustomerSQL.Stringsselect * from orders WHERE (CustNo = :CustNo)order by custno, Terms LeftTop8	ParamDataDataTypeftFloatNameCustNo	ParamType	ptUnknown     