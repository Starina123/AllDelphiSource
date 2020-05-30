
unit GridU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  MidItems, WebForm, CompProd, PagItems, SiteProd, WebComp;

type
  TGrid = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterGrid1: TAdapterGrid;
    ColSpeciesNo: TAdapterDisplayColumn;
    ColCategory: TAdapterDisplayColumn;
    ColCommon_Name: TAdapterDisplayColumn;
    ColSpeciesName: TAdapterDisplayColumn;
    ColGraphic: TAdapterDisplayColumn;
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

uses WebReq, WebCntxt, WebFact, Variants, DataU;

function Grid: TGrid;
begin
  Result := TGrid(WebContext.FindModuleClass(TGrid));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TGrid, TWebPageInfo.Create([wpPublished, wpLoginRequired], '.html'), crOnDemand, caCache));

end.
