unit ConfigDelphiU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu;

type
  TConfigureDelphi = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ConfigureDelphi: TConfigureDelphi;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function ConfigureDelphi: TConfigureDelphi;
begin
  Result := TConfigureDelphi(WebContext.FindModuleClass(TConfigureDelphi));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TConfigureDelphi,
      TWebPageInfo.Create([wpPublished], '.html', '', 'Configure Delphi'), crOnDemand, caCache));

end.
