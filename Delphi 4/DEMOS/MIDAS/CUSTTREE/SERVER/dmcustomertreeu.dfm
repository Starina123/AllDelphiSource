�
 TDMCUSTOMERTREE 0�  TPF0TDMCustomerTreeDMCustomerTreeOldCreateOrder	OnCreateDMCustomerTreeCreateLeftmTop`Height�Width TQueryCustomerQuery
ObjectView	DatabaseNameDBDEMOSSessionName
Session1_2SQL.Strings-Select * from customer where CustNo = :CustNo Left(TopP	ParamDataDataType	ftIntegerNameCustNo	ParamTypeptInputValue�   TFloatFieldCustomerQueryCustNo	FieldNameCustNoOrigin"customer.DB".CustNo  TStringFieldCustomerQueryCompany	FieldNameCompanyOrigin"customer.DB".CompanyRequired	Size  TStringFieldCustomerQueryAddr1	FieldNameAddr1Origin"customer.DB".Addr1Size  TStringFieldCustomerQueryAddr2	FieldNameAddr2Origin"customer.DB".Addr2Size  TStringFieldCustomerQueryCity	FieldNameCityOrigin"customer.DB".CitySize  TStringFieldCustomerQueryState	FieldNameStateOrigin"customer.DB".State  TStringFieldCustomerQueryZip	FieldNameZipOrigin"customer.DB".ZipSize
  TStringFieldCustomerQueryCountry	FieldNameCountryOrigin"customer.DB".Country  TStringFieldCustomerQueryPhone	FieldNamePhoneOrigin"customer.DB".PhoneSize  TStringFieldCustomerQueryFAX	FieldNameFAXOrigin"customer.DB".FAXSize  TFloatFieldCustomerQueryTaxRate	FieldNameTaxRateOrigin"customer.DB".TaxRate  TStringFieldCustomerQueryContact	FieldNameContactOrigin"customer.DB".Contact  TDateTimeFieldCustomerQueryLastInvoiceDate	FieldNameLastInvoiceDateOrigin"customer.DB".LastInvoiceDate   TTableCustomerOrdersTable
ObjectView	DatabaseNameDatabaseSessionName
Session1_2	FieldDefsNameOrderNoDataTypeftFloat NameCustNo
Attributes
faRequired DataTypeftFloat NameSaleDateDataType
ftDateTime NameShipDateDataType
ftDateTime NameEmpNo
Attributes
faRequired DataType	ftInteger NameShipToContactDataTypeftStringSize NameShipToAddr1DataTypeftStringSize NameShipToAddr2DataTypeftStringSize Name
ShipToCityDataTypeftStringSize NameShipToStateDataTypeftStringSize Name	ShipToZipDataTypeftStringSize
 NameShipToCountryDataTypeftStringSize NameShipToPhoneDataTypeftStringSize NameShipVIADataTypeftStringSize NamePODataTypeftStringSize NameTermsDataTypeftStringSize NamePaymentMethodDataTypeftStringSize Name
ItemsTotalDataType
ftCurrency NameTaxRateDataTypeftFloat NameFreightDataType
ftCurrency Name
AmountPaidDataType
ftCurrency  	IndexDefsNameCustomerOrdersTableIndex1FieldsOrderNoOptions	ixPrimaryixUnique  NameCustNoFieldsCustNo  	IndexNameCustNoMasterFieldsCustNoMasterSourceCustomerQuerySource	StoreDefs		TableName	orders.dbLeft� TopP  TDataSourceCustomerQuerySourceDataSetCustomerQueryLeft(Top�   	TProviderCustomerTreeProviderDataSetCustomerQueryConstraintsOptionspoIncFieldPropspoCascadeDeletes 
UpdateModeupWhereKeyOnlyOnUpdateDataCustomerTreeProviderUpdateDataBeforeUpdateRecord&CustomerTreeProviderBeforeUpdateRecordLeft(Top�   TTableCustomerOrderItemsTable
ObjectView	DatabaseNameDatabaseSessionName
Session1_2	FieldDefsNameOrderNoDataTypeftFloat NameItemNoDataTypeftFloat NamePartNoDataTypeftFloat NameQtyDataType	ftInteger NameDiscountDataTypeftFloat  	IndexDefsNameCustomerOrderItemsTableIndex1FieldsOrderNo;ItemNoOptions	ixPrimaryixUnique  Name	ByOrderNoFieldsOrderNoOptionsixCaseInsensitive  NamePartNoFieldsPartNo  	IndexName	ByOrderNoMasterFieldsOrderNoMasterSourceCustomerOrdersSource	StoreDefs		TableNameitems.dbLeftTopP TFloatFieldCustomerOrderItemsTableOrderNo	FieldNameOrderNo  TFloatFieldCustomerOrderItemsTableItemNo	FieldNameItemNo  TFloatFieldCustomerOrderItemsTablePartNo	FieldNamePartNo  TIntegerFieldCustomerOrderItemsTableQty	FieldNameQty  TFloatFieldCustomerOrderItemsTableDiscount	FieldNameDiscount   TDataSourceCustomerOrdersSourceDataSetCustomerOrdersTableLeft� Top�   TTableNextOrderTableDatabaseNameDatabaseSessionName
Session1_2	TableName
nextord.dbLeft TopR  TTableNextCustomerTableDatabaseNameDatabaseSessionName
Session1_2	TableNamenextcust.dbLeft� TopP  TTableNextItemTableDatabaseNameDatabaseSessionName
Session1_2	TableNamenextitem.dbLeftxTopP  TQueryCustomerListQueryDatabaseNameDatabaseSessionName
Session1_2RequestLive	SQL.Strings$Select CustNo, Company from Customer Left�Top	ParamData  TFloatFieldCustomerListQueryCustNo	FieldNameCustNoOrigin"Customer.DB".CustNo  TStringFieldCustomerListQueryCompany	FieldNameCompanyOrigin"Customer.DB".CompanySize   TDataSetProviderCustomerListProviderDataSetCustomerListQueryConstraintsLeft�TopH  TTableEmployeesTableDatabaseNameDatabaseSessionName
Session1_2	TableNameEmployeeLeft� Top   	TProviderPartsProviderDataSet
PartsQueryConstraintsOptions
poReadOnly Left�Top�   TQuery
PartsQueryDatabaseNameDatabaseSessionName
Session1_2SQL.StringsSelect * from parts Left�Topp	ParamData   TSessionSession1Active	AutoSessionName	Left`Top  	TDatabase	Database1	AliasNameDBDEMOSDatabaseNameDatabaseSessionName
Session1_2Left(Top   