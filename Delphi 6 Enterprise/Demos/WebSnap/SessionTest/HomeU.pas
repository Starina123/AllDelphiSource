
unit HomeU;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebAdapt, WebComp, WebSess, WebDisp;

type
  THome = class(TWebAppDataModule)
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    SessionsService1: TSessionsService;
    UpdateSessionValue: TAdapterAction;
    AdaptTitle: TAdapterApplicationTitleField;
    SessionValue: TAdapterField;
    TerminateSession: TAdapterAction;
    Log: TStringsValuesList;
    LogString: TValuesListValueField;
    ClearLog: TAdapterAction;
    RedirectFlag: TAdapterBooleanField;
    procedure SessionValueGetValue(Sender: TObject; var Value: Variant);
    procedure UpdateSessionValueExecute(Sender: TObject; Params: TStrings);
    procedure SessionsService1StartSession(ASender: TObject;
      ASession: TAbstractWebSession);
    procedure SessionsService1EndSession(ASender: TObject;
      ASession: TAbstractWebSession; AReason: TEndSessionReason);
    procedure TerminateSessionExecute(Sender: TObject; Params: TStrings);
    procedure ClearLogExecute(Sender: TObject; Params: TStrings);
    procedure LogPrepareStrings(Sender: TObject);

  private
    procedure LogMessage(ASession: TAbstractWebSession;
      const AMessage: string);
  public
  end;

  function Home: THome;

implementation

{$R *.dfm}

uses WebReq, WebCntxt, WebFact, Variants, AdaptReq;

function Home: THome;
begin
  Result := THome(WebContext.FindModuleClass(THome));
end;

procedure THome.SessionValueGetValue(Sender: TObject; var Value: Variant);
begin
  Value := WebContext.Session.Values['Foo'];
  if VarIsEmpty(Value) then
    Value := '';
end;

procedure THome.UpdateSessionValueExecute(Sender: TObject;
  Params: TStrings);
var
  V: Variant;
begin
  if SessionValue.ActionValue.Values[0] <> '' then
    V := SessionValue.ActionValue.Values[0];
  WebContext.Session.Values['Foo'] := V;
end;

procedure THome.SessionsService1StartSession(ASender: TObject;
  ASession: TAbstractWebSession);
begin
  ASession.Values['StartTime'] := TimeToStr(Now);
  LogMessage(ASession, Format('Session %s started', [ASession.SessionID]));
end;

const
  sEndSessionReasons: array[TEndSessionReason] of string = ('esTimeout', 'esTerminate');

procedure THome.LogMessage(ASession: TAbstractWebSession; const AMessage: string);
var
  V: Variant;
begin
  V := ASession.Values['Log'];
  if VarIsEmpty(V) then
    V := ''
  else
    V := V + #13#10;
  V := V + AMessage;
  ASession.Values['Log'] := V;
  Log.Strings.Text := V;
end;

procedure THome.SessionsService1EndSession(ASender: TObject;
  ASession: TAbstractWebSession; AReason: TEndSessionReason);
begin
  if AReason = esTerminate then
    // Copy log over to new session
    WebContext.Session.Values['Log'] := ASession.Values['Log'];
  LogMessage(WebContext.Session, Format('Session %s terminated reason: %s', [ASession.SessionID,
    sEndSessionReasons[AReason]]));
end;

procedure THome.TerminateSessionExecute(Sender: TObject; Params: TStrings);
begin
  WebContext.Session.Terminate;
  if (RedirectFlag.ActionValue <> nil) and
   (RedirectFlag.ActionValue.Values[0] = True) then
    TerminateSession.RedirectOptions := roRedirect
  else
    TerminateSession.RedirectOptions := [];
end;

procedure THome.ClearLogExecute(Sender: TObject; Params: TStrings);
begin
  Session.Values['Log'] := '';
  Log.Strings.Text := Session.Values['Log'];
end;

procedure THome.LogPrepareStrings(Sender: TObject);
var
  V: Variant;
begin
  V := WebContext.Session.Values['Log'];
  if VarIsEmpty(V) then
    Log.Strings.Text := ''
  else
    Log.Strings.Text := V;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppDataModuleFactory.Create(THome, caCache));

end.
