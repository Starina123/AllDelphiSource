�
 TWEBMODULE2 0t  TPF0TWebModule2
WebModule2OldCreateOrderOnCreateWebModule2CreateActionsDefault	NameWebActionItem1PathInfo/HomeProducerHome NameWebActionItem2PathInfo/CustomComponentGridProducerCustomComponentGrid NameWebActionItem3PathInfo/CustOrdersProducer
CustOrders NameWebActionItem4PathInfo/CountriesRadioGroupProducerCountriesRadioGroup NameWebActionItem5PathInfo/CountriesSelectOptionsProducerCountriesSelectOptions NameWebActionItem6PathInfo
/FieldAttrProducer	FieldAttr NameWebActionItem7PathInfo/ImgButtonsProducer
ImgButtons NameWebActionItem8PathInfo/ComponentsListProducerComponentsList NameWebActionItem9PathInfo	/ExamplesProducerExamples NameWebActionItem10PathInfo/SearchPage NameWebActionItem11PathInfo/SearchSelectOptionsPageProducerSearchSelectOptionsPage NameWebActionItem12PathInfo/SelectOptionsPageProducerSelectOptionsPage NameWebActionItem13PathInfo/QueryPasswordPageProducerQueryPasswordPage NameWebActionItem14PathInfo/DumpRequestProducerDumpRequest NameWebActionItem16PathInfo/ComponentsFilterOnActionWebModule2WebActionItem16Action NameWebActionItem15PathInfo/CustOrdersQueryProducerCustOrdersQuery NameWebActionItem17PathInfo/AboutJavaScriptProducerAboutJavaScript NameWebActionItem18PathInfo	/AboutXMLProducerAboutXML NameWebActionItem19PathInfo/PromptButtonPageProducerPromptButtonPage NameWebActionItem20PathInfo/ReconcileErrorProducerReconcileError NameWebActionItem21PathInfo/CustOrdersMasterDetailProducerCustOrdersMasterDetail NameWebActionItem22PathInfo/AboutComponentsProducerAboutComponents NameWebActionItem23PathInfo/RadioGroupPageProducerRadioGroupPage  BeforeDispatchWebModuleBeforeDispatchLeft��  TopHeight)Width, TInetXCenterProducerHomeHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameHome	TopicPagetopHomePageCategories Description.Strings-<P>Welcome to the InternetExpress Website</P>?<P>This purpose of this Website is to provide information aboutDInternetExpress.&nbsp; You will find descriptions as well as workingexamples.&nbsp; </P>;<P>This Website was developed with Delphi 5, of course.</P> TitleInternetExpress HomeCaptionHomeComponentsInfoComponentsInfoDSDescriptionFilehome.htm
PageLayoutplDescriptionLeftTop  
TXMLBrokerXMLBrokerAllCustomersParams ProviderNameAllCustomersRemoteServerDCOMConnection1WebDispatch.PathInfoXMLBrokerAllCustomersReconcileProducerReconcilePageLeft�Top  TDCOMConnectionDCOMConnection1
ServerGUID&{230732E5-2F8B-11D3-AAB4-00A024C11562}
ServerNamerdmINetXCenter.INetXCenterDataLeft Top  TInetXCenterProducerCustomComponentGridHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  EnableXMLIslandsLinkNameCustomComponentGrid	TopicPagetopNonePageCategories
catExample Description.Strings.This example displays a grid of all customers.ATSortTextColumn and TLinkColumn are demonstrated in this example.  Title+InternetExpress CustomComponentGrid ExampleCaptionCustomComponentGridComponentsInfoComponentsInfoDS
PageLayout
plStandardInstructions.Strings_Click the Sort buttons to toggle the sort order for a column.  Click on the Details.. . link to4open a window display the selected customers orders.<p></p> Left0Top�  	TDataForm	DataForm1 	TDataGrid	DataGrid1	XMLBrokerXMLBrokerAllCustomers TSortTextColumn
SortCustNoDisplayWidth
CaptionCustNo	FieldNameCustNoButtonCaptionSort  TSortTextColumnSortCompanyDisplayWidthCaptionCompany	FieldNameCompanyButtonCaptionSort  TSortTextColumnSortLastInvoiceDateDisplayWidthCaptionLastInvoiceDate	FieldNameLastInvoiceDateButtonCaptionSort  TLinkColumnLinkColumn1Text
Details...CaptionOrdersAction
CustOrdersKeyFieldNameCustNo  TStatusColumnStatusColumn1Caption*   TDataNavigatorDataNavigator1XMLComponent	DataGrid1 TFirstButtonFirstButton1XMLComponent	DataGrid1XMLUseParentCaption|<  TPriorPageButtonPriorPageButton1XMLComponent	DataGrid1XMLUseParentCaption<<  TPriorButtonPriorButton1XMLComponent	DataGrid1XMLUseParentCaption<  TNextButtonNextButton1XMLComponent	DataGrid1XMLUseParentCaption>  TNextPageButtonNextPageButton1XMLComponent	DataGrid1XMLUseParentCaption>>  TLastButtonLastButton1XMLComponent	DataGrid1XMLUseParentCaption>|  TUndoButtonUndoButton1XMLComponent	DataGrid1XMLUseParentCaptionUndo  TPostButtonPostButton1XMLComponent	DataGrid1XMLUseParentCaptionPost  TApplyUpdatesButtonApplyUpdatesButton1CaptionApply Updates	XMLBrokerXMLBrokerAllCustomersXMLUseParent  TShowXMLButtonShowXMLButton2CaptionShow XML	XMLBrokerXMLBrokerAllCustomersXMLUseParent	  TShowDeltaButtonShowDeltaButton2Caption
Show Delta	XMLBrokerXMLBrokerAllCustomersXMLUseParent	   TFieldGroupFieldGroup2	XMLBrokerXMLAllCustOrders TRowSetStatusRowSetStatus1     TInetXCenterProducer
CustOrdersHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  LinkNameCustOrders Example	TopicPagetopNonePageCategories Description.StringsDescription goes here Title"InternetExpress CustOrders ExampleCaptionCustOrders ExampleComponentsInfoComponentsInfoDS
PageLayout
plStandardLeftpTop�  	TDataForm	DataForm2 TFieldGroupFieldGroup1	XMLBrokerXMLBrokerCustOrders TLayoutGroupLayoutGroup1DisplayColumns 
TFieldTextOrderNoDisplayWidth
CaptionOrderNoCaptionAttributes.StyleRulecaption2	FieldNameOrderNoStylemargin-right: 10  
TFieldTextCustNo2DisplayWidth
CaptionCustNoCaptionAttributes.StyleRulecaption2	FieldNameCustNoStylemargin-right: 10  
TFieldText
ItemsTotalDisplayWidth
Caption
ItemsTotalCaptionAttributes.StyleRulecaption2	FieldName
ItemsTotalStylemargin-right: 10  
TFieldText
AmountPaidDisplayWidth
Caption
AmountPaidCaptionAttributes.StyleRulecaption2	FieldName
AmountPaidStylemargin-right: 10  TFieldStatusFieldStatus1Caption*CaptionAttributes.StyleRulecaption2Stylemargin-right: 10    TDataNavigatorDataNavigator2XMLComponentFieldGroup1Styletext-align: center TLayoutGroupLayoutGroup2DisplayColumns�Styletext-align: center TFirstButtonFirstButton2XMLComponentFieldGroup1XMLUseParentCaption|<  TPriorPageButtonPriorPageButton2XMLComponentFieldGroup1XMLUseParentCaption<<  TPriorButtonPriorButton2XMLComponentFieldGroup1XMLUseParentCaption<  TNextButtonNextButton2XMLComponentFieldGroup1XMLUseParentCaption>  TNextPageButtonNextPageButton2XMLComponentFieldGroup1XMLUseParentCaption>>  TLastButtonLastButton2XMLComponentFieldGroup1XMLUseParentCaption>|  TInsertButtonInsertButton1XMLComponentFieldGroup1XMLUseParentCaption +   TDeleteButtonDeleteButton1XMLComponentFieldGroup1XMLUseParentCaption -   TUndoButtonUndoButton2XMLComponentFieldGroup1XMLUseParentCaptionUndo  TPostButtonPostButton2XMLComponentFieldGroup1XMLUseParentCaptionPost   TLayoutGroupLayoutGroup4DisplayColumns�Styletext-align: center TApplyUpdatesButtonApplyUpdatesButton2Stylevertical-align: bottomCaptionApply Updates	XMLBrokerXMLBrokerCustOrdersXMLUseParent  TShowXMLButtonShowXMLButton1CaptionShow XML	XMLBrokerXMLBrokerCustOrdersXMLUseParent  TShowDeltaButtonShowDeltaButton1Caption
Show Delta	XMLBrokerXMLBrokerCustOrdersXMLUseParent    TFieldGroupFieldGroup3	XMLBrokerXMLBrokerCustOrdersStyletext-align: center TRowSetStatusRowSetStatus2     
TXMLBrokerXMLBrokerCustOrdersParamsDataType	ftIntegerNameCustNo	ParamType	ptUnknownValue1221  ProviderName
CustOrdersRemoteServerDCOMConnection1WebDispatch.PathInfoXMLBrokerCustOrdersOnRequestRecords!XMLBrokerCustOrdersRequestRecordsReconcileProducerReconcilePageLeft8Top�   TInetXCenterProducerCountriesRadioGroupHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  LinkNameCountriesRadioGroup	TopicPagetopNonePageCategories
catExample Description.Strings[This example uses a TFieldRadioGroup component to display then the country.continent field. Title+InternetExpress CountriesRadioGroup ExampleCaptionCountriesRadioGroupComponentsInfoComponentsInfoDS
PageLayout
plStandardLeft0Top5 	TDataForm	DataForm3 TFieldGroupFieldGroup4	XMLBrokerXMLBrokerAllCountries 
TFieldTextNameDisplayWidthCaptionNameCaptionAttributes.Stylefont-weight: bold	FieldNameName  
TFieldTextCapitalDisplayWidthCaptionCapitalCaptionAttributes.Stylefont-weight: bold	FieldNameCapital  
TFieldTextAreaDisplayWidth
CaptionAreaCaptionAttributes.Stylefont-weight: bold	FieldNameArea  
TFieldText
PopulationDisplayWidth
Caption
PopulationCaptionAttributes.Stylefont-weight: bold	FieldName
Population  TFieldRadioGroupContinentRadioGroupReadOnlyCaption	ContinentCaptionAttributes.Style&font-weight: bold; vertical-align: top	FieldName	ContinentDisplayWidthDisplayColumnsItems.StringsAfricaEurasiaNorth AmericaSouth America	Australia   TFieldStatusFieldStatus2Caption*   TDataNavigatorDataNavigator3XMLComponentFieldGroup4    
TXMLBrokerXMLBrokerAllCountriesParams ProviderNameAllCountriesRemoteServerDCOMConnection1WebDispatch.PathInfoXMLBrokerAllCountriesReconcileProducerReconcilePageLeftHTopH  TInetXCenterProducerCountriesSelectOptionsHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  LinkNameCountriesSelectOptions	TopicPagetopNonePageCategories
catExample Description.Strings^This example uses a TFieldSelectOptions component to display then the country.continent field.  Title.InternetExpress CountriesSelectOptions ExampleCaptionCountriesSelectOptionsComponentsInfoComponentsInfoDS
PageLayout
plStandardLeft0Topm 	TDataForm	DataForm4 TFieldGroupFieldGroup5	XMLBrokerXMLBrokerAllCountries 
TFieldText
FieldText1DisplayWidthCaptionNameCaptionAttributes.Stylefont-weight: bold	FieldNameName  
TFieldText
FieldText2DisplayWidthCaptionCapitalCaptionAttributes.Stylefont-weight: bold	FieldNameCapital  
TFieldText
FieldText3DisplayWidth
CaptionAreaCaptionAttributes.Stylefont-weight: bold	FieldNameArea  
TFieldText
FieldText4DisplayWidth
Caption
PopulationCaptionAttributes.Stylefont-weight: bold	FieldName
Population  TFieldStatusFieldStatus3Caption*  TFieldSelectOptionsFieldSelectOptionsDisplayRowsCaption	ContinentCaptionAttributes.Style&font-weight: bold; vertical-align: top	FieldName	ContinentItems.StringsAfrica	AustraliaEuroAsiaNorth AmericaSouth America    TDataNavigatorDataNavigator4XMLComponentFieldGroup5    TInetXCenterProducer	FieldAttrHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  OnBeforeGetContentFieldAttrBeforeGetContentLinkName	FieldAttr	TopicPagetopNonePageCategories
catExample Description.Strings<This example demonstrates the TFieldAttr custom component.   Title!InternetExpress FieldAttr ExampleCaption	FieldAttrComponentsInfoComponentsInfoDS
PageLayout
plStandardInstructions.StringsFSelect the submit button to reformat the ItemsTotal field.  Use -1 to =indicate default for the Decimals and FixedDecimals fields.  <p></p> Left� Top] TLayoutGroupLayoutGroup3DisplayColumns TTitleLayoutGroupTitleLayoutGroup1DisplayColumns�CaptionPositioncapAboveCaptionItemsTotal Column PropertiesCaptionAttributes.Styletext-align: center 
TQueryFormSubmitFieldAttrAction	FieldAttrMethodfmGet TQueryFieldGroupQueryFieldGroup3 
TQueryTextQueryMinValue	ParamNameMinValueDisplayWidth�CaptionMinValue  
TQueryTextQueryMaxValue	ParamNameMaxValueDisplayWidth�CaptionMaxValue  
TQueryTextQueryDecimals	ParamNameDecimalsDisplayWidthCaptionDecimalsText-1  
TQueryTextQueryFixedDecimals	ParamNameFixedDecimalsDisplayWidthCaptionFixedDecimalsText-1  
TQueryTextQueryCurrencySymbol	ParamNameCurrencySymbolDisplayWidthCaptionCurrencySymbol   TQueryButtonsQueryButtons1    	TDataForm	DataForm5 	TDataGrid	DataGrid2	XMLBrokerXMLBrokerCustOrders TTextColumnAttrTextColumnAttrDisplayWidthCaption
ItemsTotal	FieldName
ItemsTotalRequired   TDataNavigatorDataNavigator5XMLComponent	DataGrid2 TFirstButtonFirstButton3XMLComponent	DataGrid2XMLUseParentCaption|<  TPriorPageButtonPriorPageButton3XMLComponent	DataGrid2XMLUseParentCaption<<  TPriorButtonPriorButton3XMLComponent	DataGrid2XMLUseParentCaption<  TNextButtonNextButton3XMLComponent	DataGrid2XMLUseParentCaption>  TNextPageButtonNextPageButton3XMLComponent	DataGrid2XMLUseParentCaption>>  TLastButtonLastButton3XMLComponent	DataGrid2XMLUseParentCaption>|  TPostButtonPostButton3XMLComponent	DataGrid2XMLUseParentCaptionPost  TUndoButtonUndoButton3XMLComponent	DataGrid2XMLUseParentCaptionUndo      TInetXCenterProducer
ImgButtonsHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  LinkName
ImgButtons	TopicPagetopNonePageCategories
catExample Description.StringsJThis example demonstrates the TImgButtons custom data navigator component. Title"InternetExpress ImgButtons ExampleCaption
ImgButtonsComponentsInfoComponentsInfoDS
PageLayout
plStandardLeft� Top 	TDataForm	DataForm6 TFieldGroupFieldGroup6	XMLBrokerXMLBrokerAllCountries 
TFieldTextName3DisplayWidthCaptionName	FieldNameName  
TFieldTextCapital2DisplayWidthCaptionCapital	FieldNameCapital  
TFieldText	ContinentDisplayWidthCaption	Continent	FieldName	Continent  
TFieldTextArea2DisplayWidth
CaptionArea	FieldNameArea  
TFieldTextPopulation2DisplayWidth
Caption
Population	FieldName
Population  TFieldStatusFieldStatus4Caption*   TImgDataNavigatorImgDataNavigator1XMLComponentFieldGroup6 TImgFirstButtonImgFirstButton1XMLComponentFieldGroup6XMLUseParentAltFirstSrc	first.gifBorder  TImgPriorPageButtonImgPriorPageButton1XMLComponentFieldGroup6XMLUseParentAlt
Prior PageSrcpriorpage.gifBorder  TImgPriorButtonImgPriorButton1XMLComponentFieldGroup6XMLUseParentAltPriorSrc	prior.gifBorder  TImgNextButtonImgNextButton1XMLComponentFieldGroup6XMLUseParentAltNextSrcnext.gifBorder  TImgNextPageButtonImgNextPageButton1XMLComponentFieldGroup6XMLUseParentAlt	Next PageSrcnextpage.gifBorder  TImgLastButtonImgLastButton1XMLComponentFieldGroup6XMLUseParentAltLastSrclast.gifBorder  TImgInsertButtonImgInsertButton1XMLComponentFieldGroup6XMLUseParentAltInsertSrc
insert.gifBorder  TImgDeleteButtonImgDeleteButton1XMLComponentFieldGroup6XMLUseParentAltDeleteSrc
delete.gifBorder  TImgUndoButtonImgUndoButton1XMLComponentFieldGroup6XMLUseParentAltUndoSrcundo.gifBorder  TImgPostButtonImgPostButton1XMLComponentFieldGroup6XMLUseParentAltPostSrcpost.gifBorder  TImgApplyUpdatesButtonImgApplyUpdatesButton1AltApply Updates	XMLBrokerXMLBrokerAllCountriesXMLUseParentSrcapplyupdates.gifBorder     TInetXCenterProducerComponentsFilterHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> OnBeforeGetContent ComponentsFilterBeforeGetContentLinkNameFilter	TopicPagetopComponentsFilterPageCategories Title!InternetExpress Components FilterCaptionComponents FilterComponentsInfoComponentsInfoDS
PageLayout
plStandardLeft Top8 
TQueryForm
QueryForm2MethodfmGet TLayoutGroupLayoutGroup6DisplayColumns TQueryFieldGroupQueryFieldGroup8 TQueryRadioGroupQueryRadioGroupPackageFilter	ParamNamePackageReadOnlyCaptionComponent PackageCaptionAttributes.Stylebackground-color: silverCaptionPositioncapAboveDisplayWidth�DisplayColumnsValues.StringsAllStandardCustom Items.StringsAllStandardCustom Stylevertical-align: topTextAll   TQueryFieldGroupQueryFieldGroup9 TQueryRadioGroupQueryRadioGroupUsageFilter	ParamNameUsageReadOnlyCaptionComponent TypeCaptionAttributes.Stylebackground-color: silverCaptionPositioncapAboveDisplayWidth�DisplayColumnsValues.StringsAllXMLDataQueryProducer
DataAccess Items.StringsAllData Form ComponentsQuery Form ComponentsPage ProducersData Access Components TextAll    TLayoutGroupLayoutGroup5DisplayColumns�Styletext-align: center TQueryButtonsQueryButtons9 TSubmitQueryButtonSubmitQueryButton1CaptionApply FilterStylevertical-align: topXMLComponent
QueryForm2  TSubmitValueButtonCloseFilterCaptionCloseXMLComponent
QueryForm2ValueClose	ValueNameCloseFilter      TInetXCenterProducerExamplesHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML>  LinkNameExamples	TopicPagetopExamplesPageCategories TitleInternetExpress ExamplesCaptionExamplesComponentsInfoComponentsInfoDS
PageLayout
plStandardLeftPTop  TInetXCenterProducerSelectOptionsPageHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> OnBeforeGetContent!SelectOptionsPageBeforeGetContentLinkNameSelectOptionsPage	TopicPagetopNonePageCategories
catExample Description.StringsDThis example demonstrates the TQuerySelectOptions custom component. 3The submit button displays the HTTP request fields. Title)InternetExpress SelectOptionsPage ExampleCaptionSelectOptionsPage
PageLayout
plStandardLeft Tope 
TQueryFormSelectOptionsQueryFormActionDumpRequestMethodfmPost TQueryFieldGroupQueryFieldGroup2 TQuerySelectOptionsQuerySelectOptions	ParamNameValueDisplayRows�CaptionQuerySelectOptionsCaptionPositioncapAboveDataSetCustNamesDSValuesFieldCustNo
ItemsFieldCompany   TQueryButtonsQueryButtons2    TInetXCenterProducerSearchSelectOptionsPageHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> OnBeforeGetContent'SearchSelectOptionsPageBeforeGetContentLinkNameSearchSelectOptionsPage	TopicPagetopNonePageCategories
catExample Description.StringsIThis example demonstrates the TQuerySearchSelectOptions custom component.[To use this example, type a string in the input control to incrementally search the list of	options. 3The submit button displays the HTTP request fields. Title/InternetExpress SearchSelectOptionsPage ExampleCaptionSearchSelectOptionsPage
PageLayout
plStandardLeftITop 
TQueryFormSearchSelectOptionsQueryFormActionDumpRequestMethodfmGet TQueryFieldGroupQueryFieldGroup1 TQuerySearchSelectOptionsQuerySearchSelectOptionsDataSetCustNamesDSValuesFieldCustNo
ItemsFieldCompanyDisplayRowsCaptionPositioncapAboveCaptionQuerySearchSelectOptions   TQueryButtonsQueryButtons3    TInetXCenterProducerPromptButtonPageHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNamePromptButtonPage	TopicPagetopNonePageCategories
catExample Description.Strings>This example demonstrates the TPromptButton custom component. TChoose the Prompt... button, enter a value, and see the HTTP request received by theWeb Module. Title(InternetExpress PromptButtonPage ExampleCaptionPromptButtonPageComponentsInfoComponentsInfoDS
PageLayout
plStandardLeftxTopU 
TQueryForm
QueryForm3ActionDumpRequestMethodfmPost TQueryButtonsQueryButtons4 TPromptQueryButtonPromptQueryButton1Caption	Prompt...XMLComponent
QueryForm3XMLUseParentHiddenInputNamePromptResultLines.StringsEnter some text      TInetXCenterProducerQueryPasswordPageHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameQueryPasswordPage	TopicPagetopNonePageCategories
catExample Description.Strings?This example demonstrates the TQueryPassword custom component. 3The submit button displays the HTTP request fields. Title)InternetExpress QueryPasswordPage ExampleCaptionQueryPasswordPage
PageLayout
plStandardLeft� Top+ 
TQueryForm
QueryForm1ActionDumpRequestMethodfmGet TQueryFieldGroupQueryFieldGroup4 TQueryPasswordQueryPasswordDisplayWidth�CaptionQueryPassword   TQueryButtonsQueryButtons5    TInetXCenterProducerDumpRequestHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS>(<!-- dump request here --><#DUMPREQUEST></BODY></HTML> LinkNameDumpRequest	TopicPagetopNonePageCategories Description.StringsPThis page is displayed when a request is submitted by one of the query componentexamples.  Some interesting HTTP requestWfields are displayed.  Examine the QueryFields to see the name value repair returned inthe HTTP request packet.   TitleInternetExpress DumpRequestCaptionDumpRequest
PageLayout
plStandardLeft
Top�   TClientDataSetCustNamesDS
Aggregates Params ProviderName	CustNamesRemoteServerDCOMConnection1Left�TopH  TInetXCenterProducerComponentsListHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkName
Components	TopicPagetopComponentsPageCategories TitleInternetExpress ComponentsCaption
ComponentsComponentsInfoComponentsInfoDS
PageLayout
plStandardLeftpTopP  TInetXCenterProducerCustOrdersQueryHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameCustOrdersQuery	TopicPagetopNonePageCategories Description.StringsvThis example displays a lists of customer names.   The submit button takes the user to a form view of customer orders. Title'InternetExpress CustOrdersQuery ExampleCaptionCustOrdersQuery
PageLayout
plStandardLeft(Top�  
TQueryForm
QueryForm4Action
CustOrdersMethodfmPost TQueryFieldGroupQueryFieldGroup5 TQuerySelectOptionsQuerySelectOptions1DisplayRowsCaptionCustomer NameCaptionPositioncapAboveDataSetCustNamesDSValuesFieldCustNo
ItemsFieldCompany   TQueryButtonsQueryButtons6    TInetXCenterProducerAboutXMLHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkName	About XML	TopicPagetopXMLPageCategories TitleInternetExpress About XMLCaption	About XMLDescriptionFileaboutxml.htm
PageLayoutplDescriptionLeft� Top  TInetXCenterProducerAboutJavaScriptHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameAbout JavaScript	TopicPagetopJavaScriptPageCategories Title InternetExpress About JavaScriptCaptionAbout JavaScriptDescriptionFileaboutjavascript.htm
PageLayoutplDescriptionLeft� Top8  TInetXCenterProducerReconcileErrorHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameReconcileError	TopicPagetopNonePageCategories
catExample Description.StringsGThis example demonstrates TReconcilePageProducer by forcing a reconcileerror.   Title&InternetExpress ReconcileError ExampleCaptionReconcileError
PageLayout
plStandardInstructions.StringsNChoose the Submit button to insert "Argentina" into the countries table.  ThisRwill generate a key violation if the country table already contains "Argentina".   If no error is reported, repeat. LefthTop�  
TQueryForm
QueryForm5ActionXMLBrokerAllCountriesMethodfmPost TQueryFieldGroupQueryFieldGroup6 TQueryTextAreaQueryTextArea	ParamName	postdeltaCaption Delta Packet to Insert ArgentinaCaptionPositioncapAboveWrap	wrVirtualDisplayWidth2DisplayRows
Lines.Strings�  <DATAPACKET Version="2.0"><METADATA><FIELDS><FIELD attrname="Name" fieldtype="string" WIDTH="24"/><FIELD attrname="Capital" fieldtype="string" WIDTH="24"/><FIELD attrname="Continent" fieldtype="string" WIDTH="24"/><FIELD attrname="Area" fieldtype="r8"/><FIELD attrname="Population" fieldtype="r8"/></FIELDS><PARAMS LCID="2057" DATASET_DELTA="1"/></METADATA><ROWDATA><ROW RowState="4" Name="Argentina" Capital="Buenos Aires" Continent="South America" Area="2777815" Population="32300003"/></ROWDATA></DATAPACKET>   TQueryHiddenTextQueryHiddenText	ParamNameREDIRECTTextReconcileError   TQueryButtonsQueryButtons7 TSubmitQueryButtonSubmitQueryButton2CaptionSubmitXMLComponent
QueryForm5     TReconcilePageProducerReconcilePageHTMLDoc.Strings<HTML><HEAD></HEAD><BODY><#INCLUDES><#STYLES><#WARNINGS>M<p>One or more reconcile errors occured while applying a delta packet againstthe database. </p>D<p>To resolve errors choose a radio button, edit data if necessary, Qand then choose Post/Next.  Repeat for every error.  Reapply once all errors have&been processed.</p><FORM name="FORM1"><table><tr>+<td valign=top><H3>Error message:</H3></td>e<td valign=top><textarea name="ErrMessage" rows=2 cols=58 readonly onfocus='blur();'></textarea></td><td valign=top><H3>on</H3></td>U<td valign=top><input type=text name="ErrAction" size=12 readonly onfocus='blur();'/>
</td></tr></table><P><#RECONCILEGRID><P><FORM><H3> Reconcile Action : </H3>e<input type=radio name="action" value="Cancel" onclick='if(self.grid1!=null)grid1.cancel();'/> Cancelh<input type=radio name="action" value="Correct" onclick='if(self.grid1!=null)grid1.correct();'/> Correctb<input type=radio name="action" value="Merge" onclick='if(self.grid1!=null)grid1.merge();'/> Merge<P>I<input type=button value="<" onclick='if(self.grid1!=null)grid1.up();' />K<input type=button value=">" onclick='if(self.grid1!=null)grid1.down();' />R<input type=button value="Post/Next" onclick='if(self.grid1!=null)grid1.post();'/><P>{<input type=button value="Reapply Updates" onclick='if(self.grid1!=null)grid1.Reapply(Submitfrm1, Submitfrm1.postdelta);'/></FORM><#FORMS><#SCRIPT></BODY></HTML> 'ReconcileGrid.ConflictingColumn.CaptionConflicting Value,ReconcileGrid.ConflictingColumn.DisplayWidth%ReconcileGrid.FieldNameColumn.Caption
Field Name*ReconcileGrid.FieldNameColumn.DisplayWidth$ReconcileGrid.ModifiedColumn.CaptionSubmitted Value)ReconcileGrid.ModifiedColumn.DisplayWidth$ReconcileGrid.OriginalColumn.CaptionOriginal Value)ReconcileGrid.OriginalColumn.DisplayWidthLeft� Topu  TInetXCenterProducerCustOrdersMasterDetailHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameCustOrders MasterDetail	TopicPagetopNonePageCategories
catExample Description.StringsTThis page demonstrates a master detail form.  A form view shows customer informationNand a grid shows customer orders.   ShowXML and ShowDelta buttons are provided%in order to view the XML data packet. Title/InternetExpress CustOrders MasterDetail ExampleCaptionCustOrders MasterDetail
PageLayout
plStandardLeft� Top�  	TDataForm	DataForm7 TFieldGroupFieldGroup7	XMLBrokerXMLAllCustOrders TLayoutGroupLayoutGroup19DisplayColumns� 
TFieldTextCompanyDisplayWidthReadOnly	CaptionCompany	FieldNameCompany  
TFieldTextCustNoDisplayWidth
ReadOnly	CaptionCustNo	FieldNameCustNo  
TFieldTextLastInvoiceDateDisplayWidthCaptionLastInvoiceDate	FieldNameLastInvoiceDate  
TFieldTextCustNo3DisplayWidth
CaptionCustNo	FieldNameCustNo   TLayoutGroupLayoutGroup18DisplayColumns TLayoutGroupLayoutGroup16DisplayColumns� 
TFieldTextAddr1DisplayWidthCaptionAddr1	FieldNameAddr1  
TFieldTextAddr2DisplayWidthCaptionAddr2	FieldNameAddr2  
TFieldTextCityDisplayWidthCaptionCity	FieldNameCity  
TFieldTextStateDisplayWidthCaptionState	FieldNameState  
TFieldTextZipDisplayWidth
CaptionZip	FieldNameZip  
TFieldTextCountryDisplayWidthCaptionCountry	FieldNameCountry  TFieldStatusFieldStatus5Caption*   TLayoutGroupLayoutGroup17DisplayColumns�Stylevertical-align: top 
TFieldTextPhoneDisplayWidthCaptionPhone	FieldNamePhone  
TFieldTextFAXDisplayWidthCaptionFAX	FieldNameFAX  
TFieldTextContactDisplayWidthCaptionContact	FieldNameContact     TLayoutGroupLayoutGroup7DisplayColumns TDataNavigatorDataNavigator6XMLComponentFieldGroup7 TFirstButtonFirstButton4XMLComponentFieldGroup7Caption|<  TPriorButtonPriorButton4XMLComponentFieldGroup7Caption<  TNextButtonNextButton4XMLComponentFieldGroup7Caption>  TLastButtonLastButton4XMLComponentFieldGroup7Caption>|  TUndoButtonUndoButton4XMLComponentFieldGroup7CaptionUndo  TPostButtonPostButton4XMLComponentFieldGroup7CaptionPost   TFieldGroupFieldGroup10	XMLBrokerXMLAllCustOrders TRowSetStatusRowSetStatus3    TLayoutGroupLayoutGroup15DisplayColumns 	TDataGrid	DataGrid3	XMLBrokerXMLAllCustOrdersXMLDataSetFieldCustOrderTableDisplayRows TTextColumnOrderNo2DisplayWidth
ReadOnly	CaptionOrderNo	FieldNameOrderNo  TTextColumnAmountPaid2DisplayWidth
Caption
AmountPaid	FieldName
AmountPaid  TTextColumnSaleDateDisplayWidthReadOnly	CaptionSaleDate	FieldNameSaleDate  TTextColumnShipDateDisplayWidthReadOnly	CaptionShipDate	FieldNameShipDate  TTextColumnItemsTotal2DisplayWidth
ReadOnly	Caption
ItemsTotal	FieldName
ItemsTotal  TStatusColumnStatusColumn2Caption*   TDataNavigatorDataNavigator8XMLComponent	DataGrid3 TLayoutGroupLayoutGroup12DisplayColumns TPriorButtonPriorButton5XMLComponent	DataGrid3Caption ^   TNextButtonNextButton5XMLComponent	DataGrid3Caption v      TLayoutGroupLayoutGroup11DisplayColumns TDataNavigatorDataNavigator10XMLComponent	DataGrid3 TDeleteButtonDeleteButton4XMLComponent	DataGrid3CaptionDelete Order  TPostButtonPostButton6XMLComponent	DataGrid3CaptionPost   TFieldGroupFieldGroup9	XMLBrokerXMLAllCustOrdersXMLDataSetFieldCustOrderTable TRowSetStatusRowSetStatus4    TLayoutGroupLayoutGroup9DisplayColumns TDataNavigatorDataNavigator7XMLComponentFieldGroup7 TApplyUpdatesButtonApplyUpdatesButton3CaptionApply Updates	XMLBrokerXMLAllCustOrdersXMLUseParent	  TShowXMLButtonShowXMLButton3CaptionShow XML	XMLBrokerXMLAllCustOrdersXMLUseParent	  TShowDeltaButtonShowDeltaButton3Caption
Show Delta	XMLBrokerXMLAllCustOrdersXMLUseParent	      
TXMLBrokerXMLAllCustOrdersParams ProviderNameAllCustOrdersRemoteServerDCOMConnection1WebDispatch.PathInfoXMLAllCustOrdersReconcileProducerReconcilePageLeft�Top�   TInetXCenterProducerAboutComponentsHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> LinkNameAbout Components	TopicPagetopAboutComponentsPageCategories Title InternetExpress About ComponentsCaptionAbout ComponentsDescriptionFileaboutcomponents.htm
PageLayoutplDescriptionLeft Toph  TInetXCenterProducerRadioGroupPageHTMLDoc.Strings<HTML><HEAD><#TITLE></HEAD><BODY><#BODYELEMENTS></BODY></HTML> OnBeforeGetContentRadioGroupPageBeforeGetContentLinkNameRadioGroupPage	TopicPagetopNonePageCategories
catExample Description.Strings;This example demonstrates the TQueryRadioGroup  component. 3The submit button displays the HTTP request fields. Title)InternetExpress SelectOptionsPage ExampleCaptionRadioGroupPage
PageLayout
plStandardLeft�Top- 
TQueryFormQueryFormRadioGroupActionDumpRequestMethodfmPost TQueryFieldGroupQueryFieldGroup7 TQueryRadioGroupQueryRadioGroup	ParamNameValueReadOnlyCaptionQueryRadioGroupCaptionPositioncapAboveDisplayWidth�DisplayColumnsValues.Strings1234 Items.StringsOneTwoThreeFour Text1   TQueryButtonsQueryButtons8    TReadFileClientDataSetComponentsInfoDS
Aggregates FileNamecomponentsinfo.cds	FieldDefsName	ClassNameDataTypeftStringSize2 NameShortDescriptionDataTypeftMemo NameDescriptionDataTypeftMemo NameUsageDataTypeftStringSize NameExampleDataTypeftStringSize NamePackageDataTypeftStringSize NameTypeDataTypeftStringSize  	IndexDefsNameClassNameIndexFields	ClassName Name
UsageIndexFieldsUsage  	IndexNameClassNameIndexParams 	StoreDefs	Left� Top�    