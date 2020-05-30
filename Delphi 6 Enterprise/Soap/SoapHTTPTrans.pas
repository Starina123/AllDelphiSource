
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{         SOAP Transports                               }
{                                                       }
{       Copyright (c) 2001 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit SoapHTTPTrans;

interface

uses
  SysUtils, Classes, WinSock, WinInet, WebNode, WSDLNode;
type

  THTTPReqResp = class(TComponent, IInterface, IWebNode)
  private
    FUserSetURL: Boolean;
    FRefCount: Integer;
    FOwnerIsComponent: Boolean;
    FConnected: Boolean;
    FURL: string;
    FAgent: string;
    FUserName: string;
    FPassword: string;
    FURLHost: string;
    FURLSite: string;
    FURLPort: Integer;
    FURLScheme: Integer;
    FProxy: string;
    FProxyByPass: string;
    FInetRoot: HINTERNET;
    FInetConnect: HINTERNET;
    FWSDLView: TWSDLView;
    FSoapAction: string;
    FUseUTF8InHeader: Boolean;
    procedure SetURL(const Value: string);
    procedure InitURL(const Value: string);
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    constructor Create(Owner: TComponent); override;
    class function NewInstance: TObject; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    procedure Check(Error: Boolean);
    procedure Connect(Value: Boolean);
    function Send(const S: WideString): Integer;
    procedure Receive(Context: Integer; Resp: TStream);
    procedure Execute(const DataMsg: WideString; Resp: TStream);
    property URL: string read FURL write SetURL;
    property SoapAction: string read FSoapAction write FSoapAction;
  published
    property WSDLView: TWSDLView read FWSDLView write FWSDLView;
    property Agent: string read FAgent write FAgent;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
    property Proxy: string read FProxy write FProxy;
    property ProxyByPass: string read FProxyByPass write FProxyByPass;
    property UseUTF8InHeader: Boolean read FUseUTF8InHeader write FUseUTF8InHeader;
  end;

implementation


{$IFDEF MSWINDOWS}
uses Windows, Variants, SoapConst, XMLDoc, XMLIntf,  WSDLIntf, InvokeRegistry;


constructor THTTPReqResp.Create(Owner: TComponent);
begin
  inherited;
  FInetRoot := nil;
  FInetConnect := nil;
  FUserSetURL := False;
  FAgent := 'Borland SOAP 1.1';
end;

destructor THTTPReqResp.Destroy;
begin
  inherited;
end;

class function THTTPReqResp.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  THTTPReqResp(Result).FRefCount := 1;
end;

procedure THTTPReqResp.AfterConstruction;
begin
  inherited;
  FOwnerIsComponent := Assigned(Owner) and (Owner is TComponent);
  InterlockedDecrement(FRefCount);
end;

{ IInterface }

function THTTPReqResp._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount)
end;

function THTTPReqResp._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  { If we are not being used as a TComponent, then use refcount to manage our
    lifetime as with TInterfacedObject. }
  if (Result = 0) and not FOwnerIsComponent then
    Destroy;
end;

procedure THTTPReqResp.Check(Error: Boolean);
var
  ErrCode: Integer;
  S: string;
begin
  ErrCode := GetLastError;
  if Error and (ErrCode <> 0) then
  begin
    SetLength(S, 256);
    FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_FROM_HMODULE, Pointer(GetModuleHandle('wininet.dll')),
      ErrCode, 0, PChar(S), Length(S), nil);
    SetLength(S, StrLen(PChar(S)));
    while (Length(S) > 0) and (S[Length(S)] in [#10, #13]) do
      SetLength(S, Length(S) - 1);
    raise Exception.Create(S);
  end;
end;


procedure THTTPReqResp.SetURL(const Value: string);
begin
  if Value <> '' then
    FUserSetURL := True
  else
    FUserSetURL := False;
  InitURL(Value);
end;

procedure THTTPReqResp.InitURL(const Value: string);
var
  URLComp: TURLComponents;
  P: PChar;
begin
  if Value <> '' then
  begin
    FillChar(URLComp, SizeOf(URLComp), 0);
    URLComp.dwStructSize := SizeOf(URLComp);
    URLComp.dwSchemeLength := 1;
    URLComp.dwHostNameLength := 1;
    URLComp.dwURLPathLength := 1;
    P := PChar(Value);
    InternetCrackUrl(P, 0, 0, URLComp);
    if not (URLComp.nScheme in [INTERNET_SCHEME_HTTP, INTERNET_SCHEME_HTTPS]) then
      raise Exception.Create(SInvalidURL);
    FURLScheme := URLComp.nScheme;
    FURLPort := URLComp.nPort;
    FURLHost := Copy(Value, URLComp.lpszHostName - P + 1, URLComp.dwHostNameLength);
    FURLSite := Copy(Value, URLComp.lpszUrlPath - P + 1, URLComp.dwUrlPathLength);
  end else
  begin
    FURLPort := 0;
    FURLHost := '';
    FURLSite := '';
    FURLScheme := 0;
  end;
  FURL := Value;
end;

procedure THTTPReqResp.Connect(Value: Boolean);
var
  AccessType: Integer;
begin
  if Value  then
  begin
    if Length(FProxy) > 0 then
      AccessType := INTERNET_OPEN_TYPE_PROXY else
      AccessType := INTERNET_OPEN_TYPE_PRECONFIG;
    FInetRoot := InternetOpen(PChar(FAgent), AccessType, PChar(FProxy), PChar(FProxyByPass), 0);
    if InternetAttemptConnect(0) <> ERROR_SUCCESS then SysUtils.Abort;
    Check(not Assigned(FInetRoot));
    try
      FInetConnect := InternetConnect(FInetRoot, PChar(FURLHost), FURLPort, PChar(FUserName),
        PChar(FPassword), INTERNET_SERVICE_HTTP, 0, Cardinal(Self));
      Check(not Assigned(FInetConnect));
    except
      InternetCloseHandle(FInetRoot);
    end;
  end else
  if not Value then
  begin
    if Assigned(FInetConnect) then
      InternetCloseHandle(FInetConnect);
    FInetConnect := nil;
    if Assigned(FInetRoot) then
      InternetCloseHandle(FInetRoot);
    FInetRoot := nil;
  end;
end;

const
  MaxStatusTest = 4096;

procedure  THTTPReqResp.Receive(Context: Integer; Resp: TStream);
var
  Size, Downloaded, Status, Len, Index: DWord;
  S: string;
begin
  Len := SizeOf(Status);
  Index := 0;
  if HttpQueryInfo(Pointer(Context), HTTP_QUERY_STATUS_CODE or HTTP_QUERY_FLAG_NUMBER,
    @Status, Len, Index) and (Status >= 300) then
  begin
    Index := 0;
    Size := MaxStatusTest;
    SetLength(S, Size);
    if HttpQueryInfo(Pointer(Context), HTTP_QUERY_STATUS_TEXT, @S[1], Size, Index) then
    begin
      SetLength(S, Size);
      raise Exception.CreateFmt('%s (%d)', [S, Status]);
    end;
  end;
  Len := 0;
  repeat
    Check(not InternetQueryDataAvailable(Pointer(Context), Size, 0, 0));
    if Size > 0 then
    begin
      SetLength(S, Size);
      Check(not InternetReadFile(Pointer(Context), @S[1], Size, Downloaded));
      Resp.Write(S[1], Size);
    end;
  until Size = 0;
end;

function THTTPReqResp.Send(const S: WideString): Integer;
var
  Request: HINTERNET;
  RetVal, Flags: DWord;
  P: Pointer;
  AcceptTypes: array of PChar;
  ActionHeader: string;
  WireData: string;
  ContentHeader: string;
const
  ContentHeaderUTF8 = 'Content-Type: text/xml charset="utf-8"';
  ContentHeaderNoUTF8 = 'Content-Type: text/xml';
begin
  if UseUTF8InHeader then
    ContentHeader := ContentHeaderUTF8
  else
    ContentHeader := ContentHeaderNoUTF8;
  if not FConnected then
  begin
    Connect(True);
    FConnected := True;
  end;
  SetLength(AcceptTypes, 3);
  AcceptTypes[0] := PChar('application/octet-stream');
  AcceptTypes[1] := PChar('text/xml');
  AcceptTypes[2] := nil;
  Flags := INTERNET_FLAG_KEEP_CONNECTION or INTERNET_FLAG_NO_CACHE_WRITE;
  if FURLScheme = INTERNET_SCHEME_HTTPS then
    Flags := Flags or INTERNET_FLAG_SECURE;
  Request := HttpOpenRequest(FInetConnect, 'POST', PChar(FURLSite), nil,
    nil, Pointer(AcceptTypes), Flags, Integer(Self));
  Check(not Assigned(Request));

  if FSoapAction = '' then
    ActionHeader := SHTTPSoapAction + ':'
  else
    ActionHeader := SHTTPSoapAction + ': ' + '"' + FSoapAction + '"';
  HttpAddRequestHeaders(Request, PChar(ActionHeader), Length(ActionHeader), HTTP_ADDREQ_FLAG_ADD);

  HttpAddRequestHeaders(Request, PChar(ContentHeader), Length(ContentHeader), HTTP_ADDREQ_FLAG_ADD);
  WireData := UTF8Encode(S);
  while True do
  begin
    Check(not HttpSendRequest(Request, nil, 0, @WireData[1], Length(WireData)));
    RetVal := InternetErrorDlg(GetDesktopWindow(), Request, GetLastError,
      FLAGS_ERROR_UI_FILTER_FOR_ERRORS or FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS or
      FLAGS_ERROR_UI_FLAGS_GENERATE_DATA, P);
    case RetVal of
      ERROR_SUCCESS: break;
      ERROR_CANCELLED: SysUtils.Abort;
      ERROR_INTERNET_FORCE_RETRY: {Retry the operation};
    end;
  end;
  Result := Integer(Request);
end;

{$ENDIF}

{$IFDEF LINUX}

uses WSDLIntf, SoapConst;


constructor THTTPReqResp.Create(Obj: THTTPReqResp);
begin
  inherited Create(Obj);
end;

procedure THTTPReqResp.Check(Error: Boolean);
begin
end;

procedure THTTPReqResp.SetURL(const Value: string);
begin
  FUserSetURL := True;
  FURL := Value;
end;

procedure THTTPReqResp.Connect(Value: Boolean);
begin
end;

function THTTPReqResp.Receive(Context: Integer): string;
begin
end;

function THTTPReqResp.Send(const S: string; Address: ISoapAddress): Integer;
begin
end;

{$ENDIF}


procedure THTTPReqResp.Execute(const DataMsg: WideString; Resp: TStream);
var
  Binding: string;
  Context: Integer;
  ExtName: WideString;
begin
  if not FUserSetURL and (WSDLVIew <> nil) then
  begin
    if not WSDLView.WSDL.Active then
      WSDLView.WSDL.Active := True;
    Binding := WSDLView.WSDL.GetBindingForServicePort(WSDLView.Service, WSDLView.Port);
    ExtName :=  InvRegistry.GetMethExternalName(WSDLView.IntfInfo, WSDLVIew.Operation);
    if ExtName = '' then
      ExtName := WSDLVIew.Operation;
    FSoapAction := WSDLView.WSDL.GetSoapOperationAttribute(Binding, ExtName, WSDLIntf.SSoapAction);
    FURL := WSDLView.WSDL.GetSoapAddressForServicePort(WSDLView.Service, WSDLView.Port);
    InitURL(FURL);
  end;
  Context := Send(DataMsg);
  Receive(Context, Resp);
end;

end.
