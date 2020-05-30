
unit OrderFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, WebComp, WebForm, MidItems;

type
  TOrderForm = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    OrderFieldGroup: TAdapterFieldGroup;
    OrderCommandGroup: TAdapterCommandGroup;
    OrderErrors: TAdapterErrorList;
    ItemsGrid: TAdapterGrid;
    ItemsErrors: TAdapterErrorList;
    ColItemNo: TAdapterDisplayColumn;
    ColEditQty: TAdapterEditColumn;
    CmdEditRow: TAdapterActionButton;
    CmdBrowseRow: TAdapterActionButton;
    CmdCancel: TAdapterActionButton;
    CmdApply: TAdapterActionButton;
    CmdRefreshRow: TAdapterActionButton;
    ColEditPartNo: TAdapterEditColumn;
    ColEditDiscount: TAdapterEditColumn;
    FldOrderNo: TAdapterDisplayField;
    FldCustNo: TAdapterDisplayField;
    FldSaleDate: TAdapterDisplayField;
    FldShipDate: TAdapterDisplayField;
    FldEmpNo: TAdapterDisplayField;
    FldShipToContact: TAdapterDisplayField;
    FldShipToAddr1: TAdapterDisplayField;
    FldShipToAddr2: TAdapterDisplayField;
    FldShipToCity: TAdapterDisplayField;
    FldShipToState: TAdapterDisplayField;
    FldShipToZip: TAdapterDisplayField;
    FldShipToCountry: TAdapterDisplayField;
    FldShipToPhone: TAdapterDisplayField;
    FldShipVIA: TAdapterDisplayField;
    FldPO: TAdapterDisplayField;
    FldTerms: TAdapterDisplayField;
    FldPaymentMethod: TAdapterDisplayField;
    FldItemsTotal: TAdapterDisplayField;
    FldTaxRate: TAdapterDisplayField;
    FldFreight: TAdapterDisplayField;
    FldAmountPaid: TAdapterDisplayField;
    LayoutGroup1: TLayoutGroup;
    OrdersLayoutGroup: TLayoutGroup;
    ItemsLayoutGroup: TLayoutGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function OrderForm: TOrderForm;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DMU;

function OrderForm: TOrderForm;
begin
  Result := TOrderForm(WebContext.FindModuleClass(TOrderForm));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TOrderForm, TWebPageInfo.Create([{wpPublished , wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
