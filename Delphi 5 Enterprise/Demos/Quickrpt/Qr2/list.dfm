�
 TLISTFORM 0�  TPF0	TListFormListFormLeft�Top� Width�HeightKCaptionListForm
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style PixelsPerInch`Scaled
TextHeight 	TQuickRepQuickRepLeft Top Width�HeightMFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetCustomerDescription.Strings@This customer listing report shows the following basic features:- Setup of some common bands0  (title, column header, detail and page footer)- Connecting a dataset#- Use TQRLabel to print static text%- Use TQRDBText to print table fields You can also see how to6- Use TQRSysData to print current time and page number'- Use different fonts, sizes and colors- How to right align text- How to center text in a band 
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.OutputBinFirst
SnapToGrid	UnitsMMZoomP TQRBandDetailBand1LeftTopQWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbDetail 	TQRDBText	QRDBText1LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@      ��@      ��@      w�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldCompanyTransparentWordWrap	FontSize
  	TQRDBText	QRDBText2Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUU��@      ��@ �����ņ@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldContactTransparentWordWrap	FontSize
  	TQRDBText	QRDBText3LeftTTopWidthUHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUU��	@      ��@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldPhoneTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4Left�TopWidthWHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUUı	@      ��@      ޏ@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldFAXTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5LeftTop�Width-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ ������	@ ������� �      Ԕ@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetCustomer	DataFieldCustNoTransparentWordWrap	FontSize
   TQRBandColumnHeaderBand1LeftTop>WidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������Z�@�����*'�	@ BandTyperbColumnHeader TQRLabelQRLabel1LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionCompanyColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel2Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUU��@      ��@ �����ņ@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionContactColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel3LeftTTopWidthUHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUU��	@      ��@ XUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionPhoneColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel4Left�TopWidthWHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ XUUUUı	@      ��@      ޏ@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionFaxColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
  TQRLabelQRLabel5LeftTopWidth.HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeftFrame.DrawRightSize.Values XUUUU5�@ ������	@      ��@ �����"�@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchCaptionCust no.ColorclWhite
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
   TQRBandPageFooterBand1LeftTopaWidthQHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values������J�@�����*'�	@ BandTyperbPageFooter 
TQRSysData
QRSysData1LeftTopWidthAHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@      ��@      ��@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	DataqrsDateTextPrinted TransparentFontSize
  
TQRSysData
QRSysData2LeftTopWidth@HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesTUUUUU5�@TUUUUձ�	@      ��@��������@ 	AlignmenttaRightJustifyAlignToBand	AutoSize	DataqrsPageNumberTextPage TransparentFontSize
   TQRBand
TitleBand1LeftTopWidthQHeight Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@�����*'�	@ BandTyperbTitle TQRLabelQRLabel6Left� TopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@      ��@      Y�@ 	AlignmenttaCenterAlignToBand	AutoSize	AutoStretchCaptionCustomer ListingColorclWhite
Font.ColorclNavyFont.Height�	Font.NameArial
Font.StylefsBoldfsItalic 
ParentFontTransparentWordWrap	FontSize    TTableCustomerActive	DatabaseNameDBDEMOSIndexFieldNamesCompanyReadOnly		TableNameCUSTOMER.DBLeftTop   