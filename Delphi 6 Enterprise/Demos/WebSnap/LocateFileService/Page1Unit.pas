
unit Page1Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebDisp, WebAdapt, WebComp;

type
  TPage1 = class(TWebAppPageModule)
  PageProducer: TPageProducer;
  WebAppComponents: TWebAppComponents;
  ApplicationAdapter: TApplicationAdapter;
  PageDispatcher: TPageDispatcher;
  AdapterDispatcher: TAdapterDispatcher;
    LocateFileService1: TLocateFileService;
    procedure LocateFileService1FindStream(ASender: TObject;
      AComponent: TComponent; const AFileName: String;
      var AFoundStream: TStream; var AOwned, AHandled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Page1: TPage1;

implementation

{$R *.dfm}  {*.html}


uses WebReq, WebCntxt, WebFact, Variants, TemplateResItems;

var
  TemplateResources: TTemplateResources;

function Page1: TPage1;
begin
  Result := TPage1(WebContext.FindModuleClass(TPage1));
end;

procedure TPage1.LocateFileService1FindStream(ASender: TObject;
  AComponent: TComponent; const AFileName: String;
  var AFoundStream: TStream; var AOwned, AHandled: Boolean);
begin
  AHandled := TemplateFileStreamFromResource(TemplateResources, AFileName, AFoundStream, AOwned);
end;

initialization
  TemplateResources := TTemplateResources.Create(HInstance);
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(TPage1, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));
finalization
  TemplateResources.Free;

end.
