�
 TGRPLISTFORM 0�  TPF0TGrpListFormGrpListFormLeft�Top� Width�HeightKCaptionGrpListForm
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style PixelsPerInch`Scaled
TextHeight 	TQuickRepQuickRepLeft Top Width�HeightMFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetCustomerDescription.Strings�This report builds on the Customer listing report and adds grouping of customers by first letter in company name. You can see how to:- Use QRGroup to group records-- Example of an expression: Copy(Company,1,1)$- Use TQRExpr to print an expression 
Font.ColorclBlackFont.Height�	Font.NameArial
Font.Style OptionsLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.OutputBinFirst
SnapToGrid	UnitsMMZoomP TQRBandDetailBand1LeftTopeWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@      w�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldCompanyTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU��@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldContactTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3Left3TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldPhoneTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4Left�TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUU�)�	@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldFAXTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5Left�TopWidth-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU+�	@      ��@      Ԕ@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldCustNoTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1LeftTop>WidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������Z�@�����*'�	@ BandTyperbColumnHeader TQRLabelQRLabel1LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionCompanyColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel2Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUUU��@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionContactColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel3Left3TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@��������@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionPhoneColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel4Left�TopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@UUUUU�)�	@      ��@��������@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionFaxColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel5Left�TopWidth.HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@     ���	@      ��@������"�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionCust no.ColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
   TQRBandPageFooterBand1LeftTopuWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������J�@�����*'�	@ BandTyperbPageFooter 
TQRSysData
QRSysData1LeftTopWidthAHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	DataqrsDateTextPrinted TransparentFontSize
  
TQRSysData
QRSysData2LeftTopWidth@HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@TUUUUձ�	@      ��@��������@ 	AlignmenttaRightJustifyAlignToBand	AutoSize	DataqrsPageNumberTextPage TransparentFontSize
   TQRBand
TitleBand1LeftTopWidthQHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbTitle TQRLabelQRLabel6Left� TopWidthHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������J�@      ��@TUUUUU��@ 	AlignmenttaCenterAlignToBand	AutoSize	AutoStretchCaptionGrouped Customer ListingColorclWhite
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBoldfsItalic 
ParentFontTransparentWordWrap	FontSize   TQRGroupQRGroup1LeftTopQWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������J�@�����*'�	@ 
Expressioncopy(company,1,1)MasterQuickRep TQRExprQRExpr1LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values������Z�@      ��@�������� @UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretch
Font.ColorclNavyFont.Height�	Font.NameArial
Font.Style ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
Expressioncopy(company,1,1)FontSize    TTableCustomerActive	DatabaseNameDBDEMOSIndexFieldNamesCompanyReadOnly		TableNameCUSTOMER.DBLeftTop   