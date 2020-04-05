{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSHTTPWebBroker;

interface

uses
  Web.AutoDisp,
  System.Classes,
  Datasnap.DSHTTPCommon,
  Web.HTTPApp,
  System.Masks,
  System.SysUtils;

type

  { Webbroker component that dispatches DataSnap requests }
  TDSHTTPWebDispatcher = class(TDSHTTPServerTransport, IWebDispatch)
  private
    FWebDispatch: TWebDispatch;
    procedure SetWebDispatch(const Value: TWebDispatch);
  protected
    function CreateHttpServer: TDSHTTPServer; override;
    function DispatchEnabled: Boolean;
    function DispatchMask: TMask;
    function DispatchMethodType: TMethodType;
    function DispatchRequest(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start; override;                           
    procedure Stop; override;                            
  published
    ///  <summary>Dispatch criteria.  Indicate the types of requests that will be processed by this dispatcher.
    ///  </summary>
    property WebDispatch: TWebDispatch read FWebDispatch write SetWebDispatch;
  end;

  TDSHTTPContextWebBroker = class(TDSHTTPContext)
  public
    function Connected: Boolean; override;
  end;

  TDSHTTPRequestWebBroker = class(TDSHTTPRequest)
  strict private
    FRequestInfo: TWebRequest;
    FPostStream: TMemoryStream;
    FParams: TStrings;
    FAuthUserName: AnsiString;
    FAuthPassword: AnsiString;
    FHaveAuth: Boolean;
    procedure UpdateAuthStrings;
  protected
    function GetCommand: string; override;
    function GetCommandType: TDSHTTPCommandType; override;
    function GetDocument: string; override;
    function GetParams: TStrings; override;
    function GetPostStream: TStream; override;
    function GetAuthUserName: string; override;
    function GetAuthPassword: string; override;
    function GetURI: string; override;
    function GetPragma: string; override;
    function GetAccept: string; override;
    function GetRemoteIP: string; override;
    function GetUserAgent: string; override;
    function GetProtocolVersion: string; override;
  public
    constructor Create(ARequestInfo: TWebRequest);
    destructor Destroy; override;
    ///  <summary>WebBroker Request.  Provided so that event handlers can get to WebBroker specific properties.
    ///  </summary>
    property WebRequest: TWebRequest read FRequestInfo;
  end;

  TDSHTTPResponseWebBroker = class(TDSHTTPResponse)
  strict private
    FResponseInfo: TWebResponse;
    FCloseConnection: Boolean;
  strict protected
    function GetContentStream: TStream; override;
    function GetResponseNo: Integer; override;
    function GetResponseText: String; override;
    procedure SetContentStream(const Value: TStream); override;
    procedure SetResponseNo(const Value: Integer); override;
    procedure SetResponseText(const Value: String); override;
    function GetContentText: string; override;
    procedure SetContentText(const Value: string); override;
    function GetContentLength: Int64; override;
    procedure SetContentLength(const Value: Int64); override;
    function GetCloseConnection: Boolean; override;
    procedure SetCloseConnection(const Value: Boolean); override;
    function GetPragma: string; override;
    procedure SetPragma(const Value: string); override;
    function GetContentType: string; override;
    procedure SetContentType(const Value: string); override;
    function GetFreeContentStream: Boolean; override;
    procedure SetFreeContentStream(const Value: Boolean); override;
  public
    constructor Create(AResponseInfo: TWebResponse);
    procedure SetHeaderAuthentication(const Value: String; const Realm: String); override;
    ///  <summary>WebBroker Response.  Provided so that event handlers can get to WebBroker specific properties.
    ///  </summary>
    property WebResponse: TWebResponse read FResponseInfo;
  end;

///  <summary>Get the Web Module currently processing a DataSnap HTTP request.
///  </summary>
function GetDataSnapWebModule: TWebModule;


implementation

uses
  Data.DBXClientResStrs;

type
  TDSHTTPServerWebBroker = class(TDSHTTPServer)
  protected
    function Decode(Data: string): string; override;

  public
    procedure DispatchDataSnap(ARequest: TWebRequest; AResponse: TWebResponse);
  end;

threadvar
  DataSnapWebModule:  TWebModule;

function GetDataSnapWebModule: TWebModule;
begin
  Result := DataSnapWebModule;
end;

{ TDSHTTPWebDispatcher }
constructor TDSHTTPWebDispatcher.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FWebDispatch := TWebDispatch.Create(Self);
  FWebDispatch.PathInfo := 'datasnap*';     { do not localize }
end;

function TDSHTTPWebDispatcher.CreateHttpServer: TDSHTTPServer;
begin
  Result := TDSHTTPServerWebBroker.Create;
end;

destructor TDSHTTPWebDispatcher.Destroy;
begin
  FWebDispatch.Free;
  inherited Destroy;
end;

procedure TDSHTTPWebDispatcher.Start;
begin
  // Do nothing
end;

procedure TDSHTTPWebDispatcher.Stop;
begin
  // Do nothing
end;

procedure TDSHTTPWebDispatcher.SetWebDispatch(const Value: TWebDispatch);
begin
 FWebDispatch.Assign(Value);
end;

function TDSHTTPWebDispatcher.DispatchEnabled: Boolean;
begin
  Result := True;
end;

function TDSHTTPWebDispatcher.DispatchMask: TMask;
begin
  Result := FWebDispatch.Mask;
end;

function TDSHTTPWebDispatcher.DispatchMethodType: TMethodType;
begin
  Result := FWebDispatch.MethodType;
end;

function TDSHTTPWebDispatcher.DispatchRequest(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse): Boolean;
begin
  try
    if Owner is TWebModule then
      DataSnapWebModule := TWebModule(Owner);
    try
      try
        RequiresServer;
        TDSHTTPServerWebBroker(Self.FHttpServer).DispatchDataSnap(Request, Response);
        Result := True;
      except
        on E: Exception do
        begin
          { Default to 500, like web services. }
          Response.StatusCode := 500;
          Result := True;
        end;
      end;
    except
      { Swallow any unexpected exception, it will bring down some web servers }
      Result := False;
    end;
  finally
    { Reset current DataSnapWebModule }
    DataSnapWebModule := nil;
  end;
end;

{ TDSHTTPServerWebBroker }

function TDSHTTPServerWebBroker.Decode(Data: string): string;
begin
  Result := Data;
end;

procedure TDSHTTPServerWebBroker.DispatchDataSnap(ARequest: TWebRequest;
  AResponse: TWebResponse);
var
  LRequestInfo: TDSHTTPRequest;
  LResponseInfo: TDSHTTPResponse;
  LContext: TDSHTTPContext;
begin
  LRequestInfo := TDSHTTPRequestWebBroker.Create(ARequest);
  LResponseInfo := TDSHTTPResponseWebBroker.Create(AResponse);
  LContext := TDSHTTPContextWebBroker.Create();
  try
    DoCommand(LContext, LRequestInfo, LResponseInfo);
  finally
    LRequestInfo.Free;
    LResponseInfo.Free;
    LContext.Free;
  end;
end;

{ TDSHTTPResponseWebBroker }

constructor TDSHTTPResponseWebBroker.Create(AResponseInfo: TWebResponse);
begin
  FResponseInfo := AResponseInfo;
end;

function TDSHTTPResponseWebBroker.GetCloseConnection: Boolean;
begin
  Result := FCloseConnection;
end;

function TDSHTTPResponseWebBroker.GetContentLength: Int64;
begin
  Result := FResponseInfo.ContentLength;
end;

function TDSHTTPResponseWebBroker.GetContentStream: TStream;
begin
  Result := FResponseInfo.ContentStream;
end;

function TDSHTTPResponseWebBroker.GetContentText: string;
begin
  Result := FResponseInfo.Content;
end;

function TDSHTTPResponseWebBroker.GetContentType: string;
begin
  Result := FResponseInfo.GetCustomHeader('Content-Type');
end;

function TDSHTTPResponseWebBroker.GetFreeContentStream: Boolean;
begin
  Result := FResponseInfo.FreeContentStream;
end;

function TDSHTTPResponseWebBroker.GetPragma: string;
begin
  Result := FResponseInfo.GetCustomHeader('Pragma');
end;

function TDSHTTPResponseWebBroker.GetResponseNo: Integer;
begin
  Result := FResponseInfo.StatusCode;
end;

function TDSHTTPResponseWebBroker.GetResponseText: String;
begin
  // Expect reason string to be 8 bit characters only
  Result := string(FResponseInfo.ReasonString);
end;

procedure TDSHTTPResponseWebBroker.SetCloseConnection(const Value: Boolean);
begin
  FCloseConnection := Value;
end;

procedure TDSHTTPResponseWebBroker.SetContentLength(const Value: Int64);
begin
  FResponseInfo.ContentLength := Value;
end;

procedure TDSHTTPResponseWebBroker.SetContentStream(const Value: TStream);
begin
  FResponseInfo.ContentStream := Value;
end;

procedure TDSHTTPResponseWebBroker.SetContentText(const Value: string);
begin
  FResponseInfo.Content := Value;
end;

procedure TDSHTTPResponseWebBroker.SetContentType(const Value: string);
begin
  FResponseInfo.SetCustomHeader('Content-Type', Value);
end;

procedure TDSHTTPResponseWebBroker.SetFreeContentStream(const Value: Boolean);
begin
  FResponseInfo.FreeContentStream := Value;
end;

procedure TDSHTTPResponseWebBroker.SetPragma(const Value: string);
begin
  FResponseInfo.SetCustomHeader('Pragma', Value);
end;

procedure TDSHTTPResponseWebBroker.SetHeaderAuthentication(const Value,
  Realm: String);
begin
  FResponseInfo.WWWAuthenticate := AnsiString(Value);
  FResponseInfo.Realm := AnsiString(Realm);
end;

procedure TDSHTTPResponseWebBroker.SetResponseNo(const Value: Integer);
begin
  FResponseInfo.StatusCode := Value;
end;

procedure TDSHTTPResponseWebBroker.SetResponseText(const Value: String);
begin
  // Expect reason phrase to 8 bit characters only.
  FResponseInfo.ReasonString := AnsiString(Value);
end;

constructor TDSHTTPRequestWebBroker.Create(ARequestInfo: TWebRequest);
begin
  FRequestInfo := ARequestInfo;
end;

destructor TDSHTTPRequestWebBroker.Destroy;
begin
  FPostStream.Free;
  FParams.Free;
  inherited;
end;

procedure Base64DecodeToStream(const S: AnsiString; AStream: TStream);
const
  cPaddingChar: AnsiChar = '=';
  LDecodeMap: array[AnsiChar] of Byte =
   (0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 62, 0, 0, 0, 63, 52, 53,
    54, 55, 56, 57, 58, 59, 60, 61, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 2, 3, 4,
    5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
    25, 0, 0, 0, 0, 0, 0, 26, 27, 28,
    29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
    39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
    49, 50, 51, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0);
var
  LLength: Integer;
  LPaddingCount: Integer;
  P, PLast: PAnsiChar;
  LBuffer: array[0..2] of Byte;
begin
  LLength := Length(S);
  LPaddingCount := 0;
  if LLength = 1 then
  begin
    if S[1] = cPaddingChar then
      LPaddingCount := 1
  end
  else if LLength > 1 then
  begin
    if S[LLength] = cPaddingChar then
      if S[LLength-1] = cPaddingChar then
        LPaddingCount := 2
      else
        LPaddingCount := 1;
  end;
  P := PAnsiChar(S);
  PLast := P + LLength - 1 - LPaddingCount;
  while P <= PLast do
  begin
    case PLast - P + 1 of
      2:
      begin
        LBuffer[0] := (LDecodeMap[P[0]] shl 2) or ((LDecodeMap[P[1]] shr 4) and 3);
        AStream.WriteBuffer(LBuffer[0], 1);
        break;        
      end;
      3:
      begin
        LBuffer[0] := (LDecodeMap[P[0]] shl 2) or ((LDecodeMap[P[1]] shr 4) and 3);
        LBuffer[1] := ((LDecodeMap[P[1]] and 15) shl 4) or ((LDecodeMap[P[2]] shr 2) and 15);
        AStream.WriteBuffer(LBuffer[0], 2);
        break;        
      end;
      else
      begin
        LBuffer[0] := (LDecodeMap[P[0]] shl 2) or ((LDecodeMap[P[1]] shr 4) and 3);
        LBuffer[1] := ((LDecodeMap[P[1]] and 15) shl 4) or ((LDecodeMap[P[2]] shr 2) and 15);
        LBuffer[2] := ((LDecodeMap[P[2]] and 3) shl 6) or (LDecodeMap[P[3]] and 63);
        AStream.WriteBuffer(LBuffer[0], 3);
        P := P + 4;
      end
    end
  end;
end;

function Base64DecodeToString(const S: AnsiString): AnsiString;
var
  LStream: TStream;
begin
  LStream := TMemoryStream.Create;
  try
    Base64DecodeToStream(S, LStream);
    LStream.Seek(0, TSeekOrigin.soBeginning);
    SetLength(Result, LStream.Size);
    LStream.Read(Result[1], LStream.Size);
  finally
    LStream.Free;
  end;
end;

procedure TDSHTTPRequestWebBroker.UpdateAuthStrings;
  function Trim(const S: AnsiString): AnsiString;
  var
    I, L: Integer;
  begin
    L := Length(S);
    I := 1;
    while (I <= L) and (S[I] <= ' ') do Inc(I);
    if I > L then Result := '' else
    begin
      while S[L] <= ' ' do Dec(L);
      Result := Copy(S, I, L - I + 1);
    end;
  end;
var
  LAuthorization: AnsiString;
  LDecodedAuthorization: AnsiString;
  LPos: NativeInt;
  P: PAnsiChar;
begin
  if not FHaveAuth then
  begin
    FHaveAuth := True;
    LAuthorization := (FRequestInfo.Authorization);
    if AnsiStrComp(PAnsiChar(Copy(LAuthorization, 1, 5)), 'Basic') = 0 then
    begin
      LDecodedAuthorization := Base64DecodeToString(Trim(Copy(LAuthorization, 6, MaxInt)));
      P := AnsiStrScan(PAnsiChar(LDecodedAuthorization), ':');
      if P <> nil then
      begin
        LPos := P - PAnsiChar(LDecodedAuthorization);
        FAuthUserName := Copy(LDecodedAuthorization, 1, LPos);
        FAuthPassword := Copy(LDecodedAuthorization, LPos+2, MaxInt);
      end;
    end;
  end;
end;

function TDSHTTPRequestWebBroker.GetAuthPassword: string;
begin
  UpdateAuthStrings;
  Result := string(FAuthPassword);
end;

function TDSHTTPRequestWebBroker.GetAuthUserName: string;
begin
  UpdateAuthStrings;
  Result := string(FAuthUserName);
end;

function TDSHTTPRequestWebBroker.GetCommand: string;
begin
  Result := string(FRequestInfo.Method);
end;

function TDSHTTPRequestWebBroker.GetCommandType: TDSHTTPCommandType;
begin
  if AnsiStrComp(PAnsiChar(FRequestInfo.Method), 'DELETE') = 0 then  { do not localize }
    // WebBroker doesn't have code for delete
    Result := TDSHTTPCommandType.hcDELETE
  else
    case FRequestInfo.MethodType of
      TMethodType.mtAny:
        Result := TDSHTTPCommandType.hcUnknown;
      TMethodType.mtHead:
        Result := TDSHTTPCommandType.hcOther;
      TMethodType.mtGet:
        Result := TDSHTTPCommandType.hcGET;
      TMethodType.mtPost:
        Result := TDSHTTPCommandType.hcPOST;
      TMethodType.mtPut:
        Result := TDSHTTPCommandType.hcPUT;
    else
      raise Exception.Create(sUnknownCommandType);
    end;
end;

function TDSHTTPRequestWebBroker.GetDocument: string;
begin
  Result := string(FRequestInfo.InternalPathInfo);
end;

function TDSHTTPRequestWebBroker.GetParams: TStrings;
begin
  if FParams = nil then
  begin
    FParams := TStringList.Create;
    FParams.AddStrings(FRequestInfo.QueryFields);
    if FRequestInfo.MethodType = mtPost then
      FParams.AddStrings(FRequestInfo.ContentFields);
  end;
  Result := FParams;
end;

function TDSHTTPRequestWebBroker.GetPostStream: TStream;
begin
  if FPostStream = nil then
  begin
    FPostStream := TMemoryStream.Create;
    if Length(FRequestInfo.RawContent) > 0 then
    begin
      FPostStream.Write(FRequestInfo.RawContent[1], Length(FRequestInfo.RawContent));
      FPostStream.Seek(0, TSeekOrigin.soBeginning);
    end;
  end;
  Result := FPostStream;
end;

function TDSHTTPRequestWebBroker.GetPragma: string;
begin
  Result := String(FRequestInfo.GetFieldByName('Pragma'));
end;

function TDSHTTPRequestWebBroker.GetRemoteIP: string;
begin
  Result := String(FRequestInfo.RemoteIP);
end;

function TDSHTTPRequestWebBroker.GetAccept: string;
begin
  Result := String(FRequestInfo.GetFieldByName('Accept'));
end;

function TDSHTTPRequestWebBroker.GetURI: string;
begin
  Result := String(FRequestInfo.RawPathInfo);
end;

function TDSHTTPRequestWebBroker.GetUserAgent: string;
begin
  Result := String(FRequestInfo.UserAgent);
end;

function TDSHTTPRequestWebBroker.GetProtocolVersion: string;
begin
  Result := String(FRequestInfo.ProtocolVersion);
end;

{ TDSHTTPContextWebBroker }

function TDSHTTPContextWebBroker.Connected: Boolean;
begin
  Result := True;
end;


end.
