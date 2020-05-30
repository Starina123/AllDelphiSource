unit TroubleShootingU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu;

type
  TTroubleShooting = class(TWebPageModule)
    PageProducer: TPageProducer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function TroubleShooting: TTroubleShooting;

implementation

{$R *.dfm} {*.html}

uses WebReq, WebCntxt, WebFact;

function TroubleShooting: TTroubleShooting;
begin
  Result := TTroubleShooting(WebContext.FindModuleClass(TTroubleShooting));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TTroubleShooting, TWebPageInfo.Create([wpPublished], '.html', '', 'Trouble Shooting'), crOnDemand, caCache));

end.
