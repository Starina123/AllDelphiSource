�
 TFORM1 0�  TPF0TForm1Form1Left�Top� Width�Height�CaptionForm1Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TLabelLabel1Left� TopWidth2HeightCaption
OrderTotal  TLabelLabel2Left`Top8WidthnHeightCaptionOrderTotal Per ShipVIA  TDBGridDBGrid1LeftTopXWidth�Height� 
DataSourceOrderDSDataSourceTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style   TDBEditDBEdit1LeftTop Width� Height	DataFieldCompany
DataSourceCustOrdersDataSourceTabOrder  TDBNavigatorDBNavigator1LeftTop Width� Height
DataSourceCustOrdersDataSourceTabOrder  TButtonButton1LeftTop WidthKHeightCaption&OpenTabOrderOnClickButton1Click  TDBEditDBEdit2Left8TopWidthyHeight	DataFieldTotalPerCustomer
DataSourceOrderDSDataSourceTabOrder  TDBNavigatorDBNavigator2LeftTop@Width� Height
DataSourceOrderDSDataSourceTabOrder  TDBEditDBEdit3Left8Top8WidthyHeight	DataFieldOrderTotalPerShipMethod
DataSourceOrderDSDataSourceTabOrder  TButtonButton2LeftTop@WidthqHeightCaption&GroupByShipVIATabOrderOnClickButton2Click  TDBEditDBTextShipMethodLeft� Top8WidthYHeight
DataSourceOrderDSDataSourceTabOrder  TDataSourceCustDataSourceDataSet	CustQueryLeft� Top�   TQuery	CustQueryDatabaseNameDBDEMOSSQL.Stringsselect * from customerwhere CustNo < 1500 Left� Top� 	ParamData  TFloatFieldCustQueryCustNo	FieldNameCustNoOrigin"customer.DB".CustNo  TStringFieldCustQueryCompany	FieldNameCompanyOrigin"customer.DB".CompanySize  TStringFieldCustQueryAddr1	FieldNameAddr1Origin"customer.DB".Addr1Size  TStringFieldCustQueryAddr2	FieldNameAddr2Origin"customer.DB".Addr2Size  TStringFieldCustQueryCity	FieldNameCityOrigin"customer.DB".CitySize  TStringFieldCustQueryState	FieldNameStateOrigin"customer.DB".State  TStringFieldCustQueryZip	FieldNameZipOrigin"customer.DB".ZipSize
  TStringFieldCustQueryCountry	FieldNameCountryOrigin"customer.DB".Country  TStringFieldCustQueryPhone	FieldNamePhoneOrigin"customer.DB".PhoneSize  TStringFieldCustQueryFAX	FieldNameFAXOrigin"customer.DB".FAXSize  TFloatFieldCustQueryTaxRate	FieldNameTaxRateOrigin"customer.DB".TaxRate  TStringFieldCustQueryContact	FieldNameContactOrigin"customer.DB".Contact  TDateTimeFieldCustQueryLastInvoiceDate	FieldNameLastInvoiceDateOrigin"customer.DB".LastInvoiceDate   TQuery
OrderQueryActive	DatabaseNameDBDEMOS
DataSourceCustDataSourceSQL.Stringsselect * from orderswhere CustNo = :CustNo Left� Top� 	ParamDataDataTypeftFloatNameCustNo	ParamType	ptUnknown    	TProvider	Provider1DataSet	CustQueryConstraintsLeft� Top�   TClientDataSet
CustOrders
Aggregates Params ProviderName	Provider1LeftTop�  TFloatFieldCustOrdersCustNo	FieldNameCustNo  TStringFieldCustOrdersCompany	FieldNameCompanySize  TStringFieldCustOrdersAddr1	FieldNameAddr1Size  TStringFieldCustOrdersAddr2	FieldNameAddr2Size  TStringFieldCustOrdersCity	FieldNameCitySize  TStringFieldCustOrdersState	FieldNameState  TStringFieldCustOrdersZip	FieldNameZipSize
  TStringFieldCustOrdersCountry	FieldNameCountry  TStringFieldCustOrdersPhone	FieldNamePhoneSize  TStringFieldCustOrdersFAX	FieldNameFAXSize  TFloatFieldCustOrdersTaxRate	FieldNameTaxRate  TStringFieldCustOrdersContact	FieldNameContact  TDateTimeFieldCustOrdersLastInvoiceDate	FieldNameLastInvoiceDate  TDataSetFieldCustOrdersOrderQuery	FieldName
OrderQueryIncludeObjectField   TDataSourceCustOrdersDataSourceDataSet
CustOrdersLeftXTop�   TDataSourceOrderDSDataSourceDataSetOrderDSLeftxTop�   TClientDataSetOrderDS
Aggregates AggregatesActive	DataSetFieldCustOrdersOrderQuery	FieldDefsNameOrderNoDataTypeftFloat NameCustNoDataTypeftFloat NameSaleDateDataType
ftDateTime NameShipDateDataType
ftDateTime NameEmpNoDataType	ftInteger NameShipToContactDataTypeftStringSize NameShipToAddr1DataTypeftStringSize NameShipToAddr2DataTypeftStringSize Name
ShipToCityDataTypeftStringSize NameShipToStateDataTypeftStringSize Name	ShipToZipDataTypeftStringSize
 NameShipToCountryDataTypeftStringSize NameShipToPhoneDataTypeftStringSize NameShipVIADataTypeftStringSize NamePODataTypeftStringSize NameTermsDataTypeftStringSize NamePaymentMethodDataTypeftStringSize Name
ItemsTotalDataType
ftCurrency NameTaxRateDataTypeftFloat NameFreightDataType
ftCurrency Name
AmountPaidDataType
ftCurrency  	IndexDefsNameShipVIAFieldsShipVIA  Params 	StoreDefs	Left8Top�  TAggregateFieldOrderDSTotalPerCustomer	FieldNameTotalPerCustomerActive	
Expressionsum( ItemsTotal )  TAggregateFieldOrderDSOrderTotalPerShipMethod	FieldNameOrderTotalPerShipMethodActive	
Expressionsum( ItemsTotal )GroupingLevel	IndexNameShipVIA    