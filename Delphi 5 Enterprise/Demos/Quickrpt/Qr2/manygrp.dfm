�
 TMANYGRPFORM 0~'  TPF0TManyGrpFormManyGrpFormLeft5Top� WidthHeight�CaptionManyGrpForm
Font.ColorclWindowTextFont.Height�	Font.NameSystem
Font.Style PixelsPerInch`Scaled
TextHeight 	TQuickRepQuickRepLeftTopWidth0Height Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightDataSetRepQueryDescription.Strings|This report shows how to create a master/detail report from a TQuery component and use multiple TQRGroups in the same report 
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.Orientation
poPortraitPage.PaperSizeLetterPage.Values       �@      ��
@       �@      ��
@       �@       �@           PrintIfEmptyPrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.OutputBinFirst
SnapToGrid	UnitsMMZoomd TQRBandDetailBand1Left&TopaWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeft	Frame.DrawRight	AlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@UUUUUU��	@ BandTyperbDetail 	TQRDBText	QRDBText3Left&Top Width)HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values ������@ PUUUU�@           `UUUU��@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetRepQuery	DataFieldPartNoTransparentWordWrap	FontSize
  	TQRDBText	QRDBText4LeftVTop WidthBHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@��������@                ��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetRepQuery	DataFieldDescriptionTransparentWordWrap	FontSize
  	TQRDBText	QRDBText5LeftfTopWidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@UUUUUUU�@UUUUUU5�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetRepQuery	DataField	ListPriceMask#0.00TransparentWordWrap	FontSize
   TQRGroupQRGroup1Left&Top&Width�HeightFrame.ColorclBlackFrame.DrawTop	Frame.DrawBottomFrame.DrawLeft	Frame.DrawRight	AlignToBottomColorclSilverForceNewColumnForceNewPageSize.Values      @�@UUUUUU��	@ 
ExpressionCompany
FooterBandQRBand1MasterQuickRep 	TQRDBText	QRDBText1LeftTopWidth=HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUU�@UUUUUUU�@UUUUUUe�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteDataSetRepQuery	DataFieldCompany
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTransparent	WordWrap	FontSize
   TQRGroupQRGroup2Left&Top;Width�Height&Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeft	Frame.DrawRight	AlignToBottomColorclWhiteForceNewColumnForceNewPageSize.ValuesUUUUUU�@UUUUUU��	@ 
Expressionorderno
FooterBandQRBand2MasterQuickRep TQRExprQRExpr2LeftTopWidth� HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@������*�@UUUUUUU�@UUUUUU=�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
Expression'Orderno : '+str(orderno)FontSize
  TQRExprQRExpr3Left� TopWidthiHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@������J�@UUUUUUU�@      �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchColorclWhiteResetAfterPrintTransparentWordWrap	
Expression'Date : '+SaleDateFontSize
  TQRLabelQRLabel1Left~TopWidth-HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@UUUUUU��@VUUUUU��@       �@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaption
List priceColorclWhite
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel2Left.TopWidth HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@������j�@��������@UUUUUUU�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionPartnoColorclWhite
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  TQRLabelQRLabel3LeftVTopWidth7HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values      ��@��������@��������@UUUUUU��@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionDescriptionColorclWhite
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRBandQRBand1Left&Top� Width�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottom	Frame.DrawLeft	Frame.DrawRight	AlignToBottomColorclSilverForceNewColumnForceNewPageSize.Values       �@UUUUUU��	@ BandTyperbGroupFooter TQRExprQRExpr4LeftfTopWidthGHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@UUUUUUU�@������ڻ@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteMasterQuickRepResetAfterPrint	Transparent	WordWrap	
Expressionsum(listprice)Mask#0.00FontSize
  TQRLabelQRLabel5Left� TopWidthpHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUm�@UUUUUUU�@������*�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTotal this customerColorclWhiteTransparent	WordWrap	FontSize
   TQRBandQRBand2Left&TopuWidth�HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeft	Frame.DrawRight	AlignToBottomColor��� ForceNewColumnForceNewPageSize.Values��������@UUUUUU��	@ BandTyperbGroupFooter TQRExprQRExpr1LeftfTop WidthFHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUU��@          UUUUUU5�@ 	AlignmenttaRightJustifyAlignToBandAutoSizeAutoStretchColorclWhiteMasterQuickRepResetAfterPrint	Transparent	WordWrap	
Expressionsum(listprice)Mask#0.00FontSize
  TQRLabelQRLabel4LeftTopWidthWHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values�������@UUUUUUM�@UUUUUUU�@      0�@ 	AlignmenttaLeftJustifyAlignToBandAutoSize	AutoStretchCaptionTotal this orderColorclWhiteTransparent	WordWrap	FontSize
   TQRChildBand
ChildBand1Left&Top� Width�Height
Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values��������@UUUUUU��	@ 
ParentBandQRBand1   TQueryRepQueryActive	DatabaseNameDBDEMOSSQL.Strings4select * from customer a, orders b, items c, parts dwhere a.custno = b.custno  and b.orderno = c.orderno  and c.partno = d.partnoorder by a.company, orderno LeftTop
 TFloatFieldRepQueryCustNo	FieldNameCustNo  TStringFieldRepQueryCompany	FieldNameCompanySize  TStringFieldRepQueryAddr1	FieldNameAddr1Size  TStringFieldRepQueryAddr2	FieldNameAddr2Size  TStringFieldRepQueryCity	FieldNameCitySize  TStringFieldRepQueryState	FieldNameState  TStringFieldRepQueryZip	FieldNameZipSize
  TStringFieldRepQueryCountry	FieldNameCountry  TStringFieldRepQueryPhone	FieldNamePhoneSize  TStringFieldRepQueryFAX	FieldNameFAXSize  TFloatFieldRepQueryTaxRate	FieldNameTaxRate  TStringFieldRepQueryContact	FieldNameContact  TDateTimeFieldRepQueryLastInvoiceDate	FieldNameLastInvoiceDate  TFloatFieldRepQueryOrderNo	FieldNameOrderNo  TFloatFieldRepQueryCustNo_1	FieldNameCustNo_1  TDateTimeFieldRepQuerySaleDate	FieldNameSaleDate  TDateTimeFieldRepQueryShipDate	FieldNameShipDate  TIntegerFieldRepQueryEmpNo	FieldNameEmpNo  TStringFieldRepQueryShipToContact	FieldNameShipToContact  TStringFieldRepQueryShipToAddr1	FieldNameShipToAddr1Size  TStringFieldRepQueryShipToAddr2	FieldNameShipToAddr2Size  TStringFieldRepQueryShipToCity	FieldName
ShipToCitySize  TStringFieldRepQueryShipToState	FieldNameShipToState  TStringFieldRepQueryShipToZip	FieldName	ShipToZipSize
  TStringFieldRepQueryShipToCountry	FieldNameShipToCountry  TStringFieldRepQueryShipToPhone	FieldNameShipToPhoneSize  TStringFieldRepQueryShipVIA	FieldNameShipVIASize  TStringField
RepQueryPO	FieldNamePOSize  TStringFieldRepQueryTerms	FieldNameTermsSize  TStringFieldRepQueryPaymentMethod	FieldNamePaymentMethodSize  TCurrencyFieldRepQueryItemsTotal	FieldName
ItemsTotalCurrency	  TFloatFieldRepQueryTaxRate_1	FieldName	TaxRate_1  TCurrencyFieldRepQueryFreight	FieldNameFreightCurrency	  TCurrencyFieldRepQueryAmountPaid	FieldName
AmountPaidCurrency	  TFloatFieldRepQueryOrderNo_1	FieldName	OrderNo_1  TFloatFieldRepQueryItemNo	FieldNameItemNo  TFloatFieldRepQueryPartNo	FieldNamePartNo  TIntegerFieldRepQueryQty	FieldNameQty  TFloatFieldRepQueryDiscount	FieldNameDiscount  TFloatFieldRepQueryPartNo_1	FieldNamePartNo_1  TFloatFieldRepQueryVendorNo	FieldNameVendorNo  TStringFieldRepQueryDescription	FieldNameDescriptionSize  TFloatFieldRepQueryOnHand	FieldNameOnHand  TFloatFieldRepQueryOnOrder	FieldNameOnOrder  TCurrencyFieldRepQueryCost	FieldNameCostCurrency	  TCurrencyFieldRepQueryListPrice	FieldName	ListPriceCurrency	    