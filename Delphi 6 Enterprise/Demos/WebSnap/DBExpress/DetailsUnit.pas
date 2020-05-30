
unit DetailsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  MidItems, WebForm, WebComp, WebAdapt, DB, Provider, DBClient,
  CompProd, PagItems, SiteProd, SqlExpr;

type
  TDetails = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterErrorList1: TAdapterErrorList;
    AdapterButtonGroup1: TAdapterCommandGroup;
    BtnFirstRow: TAdapterActionButton;
    BtnPrevRow: TAdapterActionButton;
    BtnNextRow: TAdapterActionButton;
    BtnLastRow: TAdapterActionButton;
    BtnApply: TAdapterActionButton;
    BtnRefreshRow: TAdapterActionButton;
    AdapterButtonGroup2: TAdapterCommandGroup;
    BtnDeleteRow: TAdapterActionButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Details: TDetails;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMUnit;

function Details: TDetails;
begin
  Result := TDetails(WebContext.FindModuleClass(TDetails));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TDetails, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
