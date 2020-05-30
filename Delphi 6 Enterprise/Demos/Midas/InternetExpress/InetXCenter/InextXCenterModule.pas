{ InternetExpress sample WebModule

  This site provides examples and information that help
  browsers understand the makeup of InternetExpress.

  Each page component is a TINetXCenterProducer component.
  This producer component was developed specifically for
  this application.  The InetXCenterComponent.bpl package
  must be installed to display the web module designer.

  Information about InternetExpress components is stored
  in a local ClientDataSet generated file.   See
  ComponentsInfoDS.FileName.  This file is edited with the
  ComponentsInfoEditor sample application.

  You may see warning messages when viewing a Producer
  component in the Web Page property editor.  For example,
  'XMLBroker: XMLBrokerAllCustomers is not connected'.  This
  indicates that the XMLBrokerAllCustomers.Connected property
  is False.  This is not an indication of a problem.  In some
  cases the design time appearance of a page will be different
  when the component is connnected.  For example, if the page
  contains a TFieldSelectList component that is populated using
  data retrieved through the connection, the list will not be
  populated unless connected = True.

}

unit InextXCenterModule;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, MidItems, Db, DBClient,
  MConnect, XMLBrokr, CompProd, PagItems, MidProd, LinkFlds, SortFlds,
  RowSetStatus, ShowXML, FieldAttr, ImgButtons, INetXCenterProd, CustLayout,
  QueryComps, WebCombo, ReconcileProd, ReadFileClientDataSet, WebComp,
  HTTPProd;

type
  TWebModule2 = class(TWebModule)
    Home: TInetXCenterProducer;
    XMLBrokerAllCustomers: TXMLBroker;
    DCOMConnection1: TDCOMConnection;
    CustomComponentGrid: TInetXCenterProducer;
    DataForm1: TDataForm;
    DataNavigator1: TDataNavigator;
    DataGrid1: TDataGrid;
    StatusColumn1: TStatusColumn;
    LinkColumn1: TLinkColumn;
    FirstButton1: TFirstButton;
    PriorPageButton1: TPriorPageButton;
    PriorButton1: TPriorButton;
    NextButton1: TNextButton;
    NextPageButton1: TNextPageButton;
    LastButton1: TLastButton;
    UndoButton1: TUndoButton;
    PostButton1: TPostButton;
    ApplyUpdatesButton1: TApplyUpdatesButton;
    CustOrders: TInetXCenterProducer;
    DataForm2: TDataForm;
    FieldGroup1: TFieldGroup;
    XMLBrokerCustOrders: TXMLBroker;
    DataNavigator2: TDataNavigator;
    OrderNo: TFieldText;
    CustNo2: TFieldText;
    ItemsTotal: TFieldText;
    AmountPaid: TFieldText;
    FieldStatus1: TFieldStatus;
    SortCustNo: TSortTextColumn;
    SortCompany: TSortTextColumn;
    SortLastInvoiceDate: TSortTextColumn;
    FieldGroup2: TFieldGroup;
    RowSetStatus1: TRowSetStatus;
    FieldGroup3: TFieldGroup;
    RowSetStatus2: TRowSetStatus;
    LayoutGroup2: TLayoutGroup;
    FirstButton2: TFirstButton;
    PriorPageButton2: TPriorPageButton;
    PriorButton2: TPriorButton;
    NextButton2: TNextButton;
    NextPageButton2: TNextPageButton;
    LastButton2: TLastButton;
    InsertButton1: TInsertButton;
    DeleteButton1: TDeleteButton;
    UndoButton2: TUndoButton;
    PostButton2: TPostButton;
    ApplyUpdatesButton2: TApplyUpdatesButton;
    ShowXMLButton1: TShowXMLButton;
    LayoutGroup4: TLayoutGroup;
    LayoutGroup1: TLayoutGroup;
    ShowDeltaButton1: TShowDeltaButton;
    CountriesRadioGroup: TInetXCenterProducer;
    DataForm3: TDataForm;
    FieldGroup4: TFieldGroup;
    DataNavigator3: TDataNavigator;
    XMLBrokerAllCountries: TXMLBroker;
    Name: TFieldText;
    Capital: TFieldText;
    Area: TFieldText;
    Population: TFieldText;
    FieldStatus2: TFieldStatus;
    ContinentRadioGroup: TFieldRadioGroup;
    CountriesSelectOptions: TInetXCenterProducer;
    DataForm4: TDataForm;
    FieldGroup5: TFieldGroup;
    FieldText1: TFieldText;
    FieldText2: TFieldText;
    FieldText3: TFieldText;
    FieldText4: TFieldText;
    FieldStatus3: TFieldStatus;
    DataNavigator4: TDataNavigator;
    FieldSelectOptions: TFieldSelectOptions;
    FieldAttr: TInetXCenterProducer;
    DataForm5: TDataForm;
    DataNavigator5: TDataNavigator;
    DataGrid2: TDataGrid;
    SubmitFieldAttr: TQueryForm;
    FirstButton3: TFirstButton;
    PriorPageButton3: TPriorPageButton;
    PriorButton3: TPriorButton;
    NextButton3: TNextButton;
    NextPageButton3: TNextPageButton;
    LastButton3: TLastButton;
    QueryFieldGroup3: TQueryFieldGroup;
    QueryMinValue: TQueryText;
    QueryMaxValue: TQueryText;
    QueryDecimals: TQueryText;
    QueryFixedDecimals: TQueryText;
    PostButton3: TPostButton;
    UndoButton3: TUndoButton;
    QueryButtons1: TQueryButtons;
    QueryCurrencySymbol: TQueryText;
    ImgButtons: TInetXCenterProducer;
    DataForm6: TDataForm;
    FieldGroup6: TFieldGroup;
    Name3: TFieldText;
    Capital2: TFieldText;
    Continent: TFieldText;
    Area2: TFieldText;
    Population2: TFieldText;
    FieldStatus4: TFieldStatus;
    ImgDataNavigator1: TImgDataNavigator;
    ImgFirstButton1: TImgFirstButton;
    ImgPriorPageButton1: TImgPriorPageButton;
    ImgPriorButton1: TImgPriorButton;
    ImgNextButton1: TImgNextButton;
    ImgNextPageButton1: TImgNextPageButton;
    ImgLastButton1: TImgLastButton;
    ImgInsertButton1: TImgInsertButton;
    ImgDeleteButton1: TImgDeleteButton;
    ImgUndoButton1: TImgUndoButton;
    ImgPostButton1: TImgPostButton;
    ImgApplyUpdatesButton1: TImgApplyUpdatesButton;
    ComponentsFilter: TInetXCenterProducer;
    Examples: TInetXCenterProducer;
    LayoutGroup3: TLayoutGroup;
    TitleLayoutGroup1: TTitleLayoutGroup;
    SelectOptionsPage: TInetXCenterProducer;
    SelectOptionsQueryForm: TQueryForm;
    QueryFieldGroup2: TQueryFieldGroup;
    QuerySelectOptions: TQuerySelectOptions;
    QueryButtons2: TQueryButtons;
    SearchSelectOptionsPage: TInetXCenterProducer;
    SearchSelectOptionsQueryForm: TQueryForm;
    QueryFieldGroup1: TQueryFieldGroup;
    QuerySearchSelectOptions: TQuerySearchSelectOptions;
    QueryButtons3: TQueryButtons;
    PromptButtonPage: TInetXCenterProducer;
    QueryForm3: TQueryForm;
    QueryButtons4: TQueryButtons;
    PromptQueryButton1: TPromptQueryButton;
    QueryPasswordPage: TInetXCenterProducer;
    QueryForm1: TQueryForm;
    QueryFieldGroup4: TQueryFieldGroup;
    QueryPassword: TQueryPassword;
    QueryButtons5: TQueryButtons;
    DumpRequest: TInetXCenterProducer;
    CustNamesDS: TClientDataSet;
    QueryForm2: TQueryForm;
    QueryRadioGroupPackageFilter: TQueryRadioGroup;
    QueryRadioGroupUsageFilter: TQueryRadioGroup;
    SubmitQueryButton1: TSubmitQueryButton;
    QueryFieldGroup8: TQueryFieldGroup;
    QueryFieldGroup9: TQueryFieldGroup;
    QueryButtons9: TQueryButtons;
    LayoutGroup5: TLayoutGroup;
    LayoutGroup6: TLayoutGroup;
    ComponentsList: TInetXCenterProducer;
    CloseFilter: TSubmitValueButton;
    CustOrdersQuery: TInetXCenterProducer;
    QueryForm4: TQueryForm;
    QueryFieldGroup5: TQueryFieldGroup;
    QuerySelectOptions1: TQuerySelectOptions;
    QueryButtons6: TQueryButtons;
    TextColumnAttr: TTextColumnAttr;
    AboutXML: TInetXCenterProducer;
    AboutJavaScript: TInetXCenterProducer;
    ReconcileError: TInetXCenterProducer;
    QueryForm5: TQueryForm;
    QueryFieldGroup6: TQueryFieldGroup;
    QueryTextArea: TQueryTextArea;
    QueryButtons7: TQueryButtons;
    SubmitQueryButton2: TSubmitQueryButton;
    QueryHiddenText: TQueryHiddenText;
    ReconcilePage: TReconcilePageProducer;
    CustOrdersMasterDetail: TInetXCenterProducer;
    DataForm7: TDataForm;
    FieldGroup7: TFieldGroup;
    DataNavigator6: TDataNavigator;
    DataGrid3: TDataGrid;
    DataNavigator7: TDataNavigator;
    ApplyUpdatesButton3: TApplyUpdatesButton;
    ShowXMLButton3: TShowXMLButton;
    ShowDeltaButton3: TShowDeltaButton;
    LayoutGroup9: TLayoutGroup;
    DataNavigator8: TDataNavigator;
    LayoutGroup12: TLayoutGroup;
    LayoutGroup7: TLayoutGroup;
    LayoutGroup11: TLayoutGroup;
    DataNavigator10: TDataNavigator;
    DeleteButton4: TDeleteButton;
    PostButton6: TPostButton;
    FieldGroup9: TFieldGroup;
    RowSetStatus4: TRowSetStatus;
    LayoutGroup15: TLayoutGroup;
    CustNo: TFieldText;
    Company: TFieldText;
    LastInvoiceDate: TFieldText;
    XMLAllCustOrders: TXMLBroker;
    OrderNo2: TTextColumn;
    SaleDate: TTextColumn;
    ShipDate: TTextColumn;
    ItemsTotal2: TTextColumn;
    AmountPaid2: TTextColumn;
    StatusColumn2: TStatusColumn;
    Addr1: TFieldText;
    Addr2: TFieldText;
    City: TFieldText;
    State: TFieldText;
    Zip: TFieldText;
    Country: TFieldText;
    Phone: TFieldText;
    FAX: TFieldText;
    Contact: TFieldText;
    LayoutGroup16: TLayoutGroup;
    LayoutGroup17: TLayoutGroup;
    LayoutGroup18: TLayoutGroup;
    LayoutGroup19: TLayoutGroup;
    FirstButton4: TFirstButton;
    PriorButton4: TPriorButton;
    NextButton4: TNextButton;
    LastButton4: TLastButton;
    UndoButton4: TUndoButton;
    PostButton4: TPostButton;
    PriorButton5: TPriorButton;
    NextButton5: TNextButton;
    FieldGroup10: TFieldGroup;
    RowSetStatus3: TRowSetStatus;
    FieldStatus5: TFieldStatus;
    ShowXMLButton2: TShowXMLButton;
    ShowDeltaButton2: TShowDeltaButton;
    AboutComponents: TInetXCenterProducer;
    CustNo3: TFieldText;
    RadioGroupPage: TInetXCenterProducer;
    QueryFormRadioGroup: TQueryForm;
    QueryFieldGroup7: TQueryFieldGroup;
    QueryButtons8: TQueryButtons;
    QueryRadioGroup: TQueryRadioGroup;
    ComponentsInfoDS: TReadFileClientDataSet;
    procedure XMLBrokerCustOrdersRequestRecords(Sender: TObject;
      Request: TWebRequest; out RecCount: Integer;
      var OwnerData: OleVariant; var Records: String);
    procedure FieldAttrBeforeGetContent(Sender: TObject);
    procedure SearchSelectOptionsPageBeforeGetContent(Sender: TObject);
    procedure SelectOptionsPageBeforeGetContent(Sender: TObject);
    procedure WebModule2Create(Sender: TObject);
    procedure ComponentsFilterBeforeGetContent(Sender: TObject);
    procedure WebModuleBeforeDispatch(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule2WebActionItem16Action(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure RadioGroupPageBeforeGetContent(Sender: TObject);
  private
    function CloseButton(Button: TSubmitValueButton;
      Producer: TInetXCenterProducer): Boolean;
    { Private declarations }
  public
    { Public declarations }
    ComponentsInfoIntf: IComponentsInfo;
  end;

var
  WebModule2: TWebModule2;

implementation

uses WebReq;

{$R *.dfm}

procedure TWebModule2.XMLBrokerCustOrdersRequestRecords(Sender: TObject;
  Request: TWebRequest; out RecCount: Integer; var OwnerData: OleVariant;
  var Records: String);
begin
  // Assign Query to params
  if XMLBrokerCustOrders.Params.Count = 0 then
    XMLBrokerCustOrders.FetchParams;
  XMLBrokerCustOrders.Params.AssignStrings(Request.ContentFields);
  XMLBrokerCustOrders.Params.AssignStrings(Request.QueryFields);
end;

procedure TWebModule2.FieldAttrBeforeGetContent(Sender: TObject);

  function IntValue(Value: string): Integer;
  begin
    try
      Result := StrToInt(Value);
    except
      Result := -1;
    end;
  end;

  function BoolValue(Value: string): Boolean;
  begin
    try
      Result := IntValue(Value) > 0;
    except
      Result := False;
    end;
  end;

begin

  TextColumnAttr.MinValue := '';
  TextColumnAttr.MaxValue := '';
  TextColumnAttr.CurrencySymbol := '';
  TextColumnAttr.Decimals := -1;
  TextColumnAttr.FixedDecimals := -1;
  SubmitFieldAttr.AssignStrings(Request.QueryFields);
  TextColumnAttr.MinValue := QueryMinValue.Text;
  TextColumnAttr.MaxValue := QueryMaxValue.Text;
  TextColumnAttr.CurrencySymbol := QueryCurrencySymbol.Text;
  TextColumnAttr.Decimals := IntValue(QueryDecimals.Text);
  TextColumnAttr.FixedDecimals := IntValue(QueryFixedDecimals.Text);
end;

procedure TWebModule2.SelectOptionsPageBeforeGetContent(Sender: TObject);
begin
  // Initialize the values of all components on a query form from the URL
  SelectOptionsQueryForm.AssignStrings(Request.QueryFields);
end;

procedure TWebModule2.SearchSelectOptionsPageBeforeGetContent(
  Sender: TObject);
begin
  // Initialize the values of all components on a query form from the URL
  SearchSelectOptionsQueryForm.AssignStrings(Request.QueryFields);
end;

procedure TWebModule2.WebModule2Create(Sender: TObject);
begin
  ComponentsInfoIntf := TComponentsInfo.Create(ComponentsInfoDS);
end;

function TWebModule2.CloseButton(Button: TSubmitValueButton;
  Producer: TInetXCenterProducer): Boolean;
begin
  Result := False;
  if Request.QueryFields.Values[Button.ValueName] <> '' then
  begin
    Response.SendRedirect(Producer.HRef);
    // Response.Content := Producer.HRef;
    // Response.SendResponse;
    Result := True;
  end;
end;

procedure TWebModule2.ComponentsFilterBeforeGetContent(Sender: TObject);
var
  PackageFilter: string;
  UsageFilter: string;
  I: Integer;
begin
  //if CloseButton(CloseFilter, ComponentsList) then Exit;

  UsageFilter := Request.QueryFields.Values['Usage'];
  PackageFilter := Request.QueryFields.Values['Package'];
  if (UsageFilter <> '') and  (PackageFilter = '') then
    PackageFilter := QueryRadioGroupPackageFilter.Values[0]
  else if (PackageFilter <> '') and (UsageFilter = '') then
    UsageFilter := QueryRadioGroupUsageFilter.Values[0];
  with QueryRadioGroupUsageFilter do
  begin
    I := Values.IndexOf(UsageFilter);
    if I <> -1 then
      Text := Items[I]
    else
      Text := '';
  end;
  with QueryRadioGroupPackageFilter do
  begin
    I := Values.IndexOf(PackageFilter);
    if I <> -1 then
      Text := Items[I]
    else
      Text := '';
  end;

  ComponentsInfoIntf.SetFilter(PackageFilter, UsageFilter, 'All');
end;

procedure TWebModule2.WebModuleBeforeDispatch(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  ComponentsInfoIntf.ClearFilter;
  if WebRequestHandler.ClassNameIs('TCOMWebRequestHandler') then
  begin
    DCOMConnection1.Connected := False;
    XMLBrokerAllCountries.Connected := False;
  end;
end;

procedure TWebModule2.WebModule2WebActionItem16Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  if CloseButton(CloseFilter, ComponentsList) then Exit;
  Response.Content := ComponentsFilter.Content;
end;

procedure TWebModule2.RadioGroupPageBeforeGetContent(Sender: TObject);
begin
  // Initialize the values of all components on a query form from the URL
  // To test try a this URL:
  // .../inetxcentercgi.exe/RadioGroupPage?Value=Two
  QueryFormRadioGroup.AssignStrings(Request.QueryFields);
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule2;

end.
