
unit NewRowU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, MidItems, WebForm, WebComp;

type
  TNewRow = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterErrorList1: TAdapterErrorList;
    AdapterCommandGroup1: TAdapterCommandGroup;
    FldPartNo: TAdapterDisplayField;
    FldQty: TAdapterDisplayField;
    FldDiscount: TAdapterDisplayField;
    CmdCancel: TAdapterActionButton;
    CmdApply: TAdapterActionButton;
    CmdRefreshRow: TAdapterActionButton;
    AdapterFieldGroup2: TAdapterFieldGroup;
    AdapterDisplayField1: TAdapterDisplayField;
    AdapterDisplayField2: TAdapterDisplayField;
    LayoutGroup1: TLayoutGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function NewRow: TNewRow;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function NewRow: TNewRow;
begin
  Result := TNewRow(WebContext.FindModuleClass(TNewRow));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TNewRow, TWebPageInfo.Create([{wpPublished , wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
