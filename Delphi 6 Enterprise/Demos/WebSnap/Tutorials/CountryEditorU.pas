unit CountryEditorU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu;

type
  TCountryEditor = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CountryEditor: TCountryEditor;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function CountryEditor: TCountryEditor;
begin
  Result := TCountryEditor(WebContext.FindModuleClass(TCountryEditor));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TCountryEditor, TWebPageInfo.Create([wpPublished], '.html', '', 'Build CountryEditor'), crOnDemand, caCache));
end.
