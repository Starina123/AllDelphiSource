unit HomeU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, WebModu,
  WebAdapt, WebComp, WebDisp, SvrInfoAdapter;

type
  THome = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    AdapterDispatcher: TAdapterDispatcher;
    PageDispatcher: TPageDispatcher;
    ApplicationAdapter: TApplicationAdapter;
    Adapter: TSvrInfoAdapter;
    AdaptClsID: TSvrInfoClsIDField;
    AdaptProgID: TSvrInfoProgIDField;
    AdaptFileName: TSvrInfoFileNameField;
    AdaptFilePath: TSvrInfoFilePathField;
    AdaptURLPath: TSvrInfoURLPathField;
    AdaptFileExists: TSvrInfoFileExistsField;
    ActionSortProgID: TSvrInfoSortByProgIDAction;
    ActionSortFilePath: TSvrInfoSortByFilePathAction;
    ActionCleanMarked: TSvrInfoCleanMarkedAction;
    AdaptMarkClsID: TSvrInfoMarkClsIDField;
    ActionCleanMissingFiles: TSvrInfoCleanMissingFilesAction;
    LocateFileService1: TLocateFileService;
    procedure LocateFileService1FindStream(ASender: TObject;
      AComponent: TComponent; const AFileName: String;
      var AFoundStream: TStream; var AOwned, AHandled: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function Home: THome;

implementation

{$R *.dfm} {*.HTML}

uses WebReq, WebCntxt, WebFact, Variants, SiteComp, TemplateResItems;

var
  TemplateResources: TTemplateResources;

function Home: THome;
begin
  Result := THome(WebContext.FindModuleClass(THome));
end;

procedure THome.LocateFileService1FindStream(ASender: TObject;
  AComponent: TComponent; const AFileName: String;
  var AFoundStream: TStream; var AOwned, AHandled: Boolean);
begin
  AHandled := TemplateFileStreamFromResource(TemplateResources, AFileName, AFoundStream, AOwned);
end;

initialization
  TemplateResources := TTemplateResources.Create(HInstance);
  WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(THome, TWebPageInfo.Create, caCache));
finalization
  TemplateResources.Free;

end.
