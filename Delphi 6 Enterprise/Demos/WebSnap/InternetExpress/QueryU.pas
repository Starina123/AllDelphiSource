
unit QueryU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, WebAdapt, WebComp, MidItems, WebForm;

type
  TQuery = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    QueryFormAdapter: TAdapter;
    SubmitQuery: TAdapterAction;
    ContinentField: TAdapterField;
    ContinentNamesList: TStringsValuesList;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterCommandGroup1: TAdapterCommandGroup;
    FldContinentField: TAdapterDisplayField;
    CmdSubmitQuery: TAdapterActionButton;
    procedure SubmitQueryExecute(Sender: TObject; Params: TStrings);
    procedure ContinentFieldGetValue(Sender: TObject; var Value: Variant);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Query: TQuery;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function Query: TQuery;
begin
  Result := TQuery(WebContext.FindModuleClass(TQuery));
end;

procedure TQuery.SubmitQueryExecute(Sender: TObject; Params: TStrings);
begin
  DM.ContinentValue := ContinentField.ActionValue.Values[0];
end;

procedure TQuery.ContinentFieldGetValue(Sender: TObject;
  var Value: Variant);
begin
  Value := DM.ContinentValue;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TQuery, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
