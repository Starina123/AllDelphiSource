
unit DumpModulesU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd;

type
  TDumpModules = class(TWebPageModule)
  PageProducer: TPageProducer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DumpModules: TDumpModules;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants;

function DumpModules: TDumpModules;
begin
  Result := TDumpModules(WebContext.FindModuleClass(TDumpModules));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TDumpModules, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.
