
unit GridUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  MidItems, WebForm, CompProd, PagItems, SiteProd, WebComp;

type
  TGrid = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterGrid1: TAdapterGrid;
    ColCUST_NO: TAdapterDisplayColumn;
    ColCUSTOMER: TAdapterDisplayColumn;
    ColCONTACT_FIRST: TAdapterDisplayColumn;
    ColCONTACT_LAST: TAdapterDisplayColumn;
    ColPHONE_NO: TAdapterDisplayColumn;
    ColADDRESS_LINE1: TAdapterDisplayColumn;
    ColADDRESS_LINE2: TAdapterDisplayColumn;
    ColCITY: TAdapterDisplayColumn;
    ColSTATE_PROVINCE: TAdapterDisplayColumn;
    ColCOUNTRY: TAdapterDisplayColumn;
    ColPOSTAL_CODE: TAdapterDisplayColumn;
    ColON_HOLD: TAdapterDisplayColumn;
    AdapterCommandColumn1: TAdapterCommandColumn;
    CmdEditRow: TAdapterActionButton;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Grid: TGrid;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMUnit;

function Grid: TGrid;
begin
  Result := TGrid(WebContext.FindModuleClass(TGrid));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TGrid, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
