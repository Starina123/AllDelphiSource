unit CountryFormU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu, SiteProd,
  MidItems, WebForm, WebComp, CompProd, PagItems, ImgBtnProducer;

type
  TCountryForm = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterButtonGroup1: TAdapterCommandGroup;
    BtnCancel: TAdapterActionButton;
    BtnApply: TAdapterActionButton;
    BtnRefreshRow: TAdapterActionButton;
    AdapterErrorList1: TAdapterErrorList;
    ImageButtonProducer1: TImageButtonProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CountryForm: TCountryForm;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact, CountryTableU;

function CountryForm: TCountryForm;
begin
  Result := TCountryForm(WebContext.FindModuleClass(TCountryForm));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCountryForm, TWebPageInfo.Create([{wpPublished , wpLoginRequired}], '.html', '', 'Edit Country'), crOnDemand, caCache));

end.
