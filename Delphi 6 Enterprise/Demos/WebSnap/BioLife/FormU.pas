
unit FormU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  CompProd, PagItems, SiteProd, MidItems, WebForm, WebComp;

type
  TDetails = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    FldSpeciesNo: TAdapterDisplayField;
    FldCategory: TAdapterDisplayField;
    FldCommon_Name: TAdapterDisplayField;
    FldSpeciesName: TAdapterDisplayField;
    FldLengthcm: TAdapterDisplayField;
    FldLength_In: TAdapterDisplayField;
    FldNotes: TAdapterDisplayField;
    FldGraphic: TAdapterDisplayField;
    AdapterDisplayField: TAdapterDisplayField;
    AdapterButtonGroup1: TAdapterCommandGroup;
    BtnFirstRow: TAdapterActionButton;
    BtnPrevRow: TAdapterActionButton;
    BtnNextRow: TAdapterActionButton;
    BtnLastRow: TAdapterActionButton;
    BtnApply: TAdapterActionButton;
    BtnRefreshRow: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Details: TDetails;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, DataU;

function Details: TDetails;
begin
  Result := TDetails(WebContext.FindModuleClass(TDetails));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TDetails, TWebPageInfo.Create([wpPublished, wpLoginRequired], '.html'), crOnDemand, caCache));

end.
