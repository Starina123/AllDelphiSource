
unit OrderGridU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebForm, WebComp, MidItems, CompProd, PagItems, SiteProd;

type
  TOrdersGrid = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterErrorList1: TAdapterErrorList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function OrdersGrid: TOrdersGrid;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function OrdersGrid: TOrdersGrid;
begin
  Result := TOrdersGrid(WebContext.FindModuleClass(TOrdersGrid));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TOrdersGrid, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
