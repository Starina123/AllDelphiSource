{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSHTTP;

interface

uses
  System.Classes,
  System.Contnrs,
  Data.DBXCommon,
  Data.DbxDatasnap,
  Datasnap.DSHTTPCommon,
  Datasnap.DSServer,
  System.Generics.Collections,
{$IFNDEF POSIX}
  Web.WebFileDispatcher,
{$ENDIF}
  IPPeerAPI;


type

  TDSHTTPServiceComponent = class;

  TDSCustomCertFiles = class;

  TDSHTTPService = class(TDSHTTPServerTransport)
  private
    FComponentList: TComponentList;
    FCertFiles: TDSCustomCertFiles;
    FDefaultPort: Integer;
    FActive: Boolean;
    procedure RemoveComponent(const AComponent: TDSHTTPServiceComponent);
    procedure AddComponent(const AComponent: TDSHTTPServiceComponent);
    procedure SetCertFiles(const AValue: TDSCustomCertFiles);
  protected
    function CreateHttpServer: TDSHTTPServer; override;
    procedure InitializeHttpServer; override;
    procedure HTTPOtherContext(
      AContext: TDSHTTPContext;
      ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse;
      const ARequest: string; var AHandled: Boolean); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetHttpPort: Word; virtual;
    function GetServerSoftware: string; virtual;
    procedure SetIPImplementationID(const Value: string); override;

    function IsActive: boolean; virtual;
    procedure SetActive(Status: Boolean); virtual;
    procedure SetHttpPort(const Port: Word); virtual;
    ///<summary>
    ///  Called by the server when it is starting.
    ///</summary>
    procedure Start; override;
    ///<summary>
    ///  Called by the server when it is stoping.
    ///</summary>
    procedure Stop; override;
  published
    { Published declarations }
    ///  <summary> HTTP port </summary>
    property HttpPort: Word read GetHttpPort write SetHttpPort default _IPPORT_HTTP;
    ///  <summary> REST URL context like in http://my.site.com/datasnap/rest/...
    ///     In the example above rest denotes that the request is a REST request
    ///     and is processed by REST service
    ///  </summary>
    ///  <summary> True to start the service, false to stop it
    ///  </summary>
    property Active: boolean read IsActive write SetActive;
    ///  <summary> User trace code might go here
    ///  </summary>
    property Trace;
    ///  <summary> Server software, read only
    ///  </summary>
    property ServerSoftware: String read GetServerSoftware;
    ///  <summary> Datasnap Server. If set, takes precedence over hostname and port </summary>
    property Server;
    ///  <summary> Datasnap Server machine name. Only used when DSServer is not set </summary>
    property DSHostname;
    ///  <summary> Datasnap Server port number. Only used when DSServer is not set </summary>
    property DSPort;
    /// <summary> X.509 certificates and keys</summary>
    property CertFiles: TDSCustomCertFiles read FCertFiles write SetCertFiles;

    property IPImplementationID;
  end;

  TGetPEMFilePasskey = procedure(ASender: TObject; var APasskey: AnsiString) of object;

  /// <summary>Provides information about X.509 certificates and private keys</summary>
  /// <remarks>Associate with a TDSHTTPService component to enable server side SSL</remarks>
  TDSCustomCertFiles = class(TComponent)
  private
    FCertFile: string;
    FKeyFile: string;
    FRootCertFile: string;
    FGetPEMFilePasskey: TGetPEMFilePasskey;
    function GetCertFile: string;
    function GetKeyFile: string;
    function GetRootCertFile: string;
    procedure SetCertFile(const Value: string);
    procedure SetRootCertFile(const Value: string);
    procedure SetKeyFile(const Value: string);
    procedure SetOnGetPEMFilePasskey(const Value: TGetPEMFilePasskey);
    function GetOnGetPEMFilePasskey: TGetPEMFilePasskey;
  published
    /// <summary>Provides the HTTP server implementation object with  X.509 information</summary>
    /// <param name="AServer">HTTP server implementation object</param>
    procedure SetServerProperties(AServer: TObject); virtual;
  public
    /// <summary>File of the X.509 root certificate</summary>
    property RootCertFile: string read GetRootCertFile write SetRootCertFile;
    /// <summary>File of the X.509 certificate</summary>
    property CertFile: string read GetCertFile write SetCertFile;
    /// <summary>File of the X.509 private key</summary>
    property KeyFile: string read GetKeyFile write SetKeyFile;
    /// <summary>Event handler to provide the string used to encrypt the private key in KeyFile</summary>
    property OnGetPEMFilePasskey: TGetPEMFilePasskey read GetOnGetPEMFilePasskey write SetOnGetPEMFilePasskey;
  end;

  /// <summary>Provides information about X.509 certificates and private keys</summary>
  /// <remarks>Publishes properties for design time support</remarks>
  TDSCertFiles = class(TDSCustomCertFiles)
  published
    property RootCertFile;
    property CertFile;
    property KeyFile;
    property OnGetPEMFilePasskey;
  end;

  TDSHTTPServiceComponent = class(TComponent)
  private
    FService: TDSHTTPService;
    procedure SetService(const AValue: TDSHTTPService);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure DoCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
      AResponseInfo: TDSHTTPResponse; const ARequest: string; var AHandled: Boolean); virtual; abstract;
  public
  published
    property Service: TDSHTTPService read FService write SetService;
  end;

  TDispatchFileEvent = procedure (Sender: TObject; const AFileName: string; 
    AContext: TDSHTTPContext; Request: TDSHTTPRequest;
    Response: TDSHTTPResponse; var Handled: Boolean) of object;

                                                               
{$IFNDEF POSIX}
  TDSCustomHTTPServiceFileDispatcher = class(TDSHTTPServiceComponent)
  private
    FFileDispatcherProperties: TWebFileDispatcherProperties;
    FBeforeDispatch: TDispatchFileEvent;
    FAfterDispatch: TDispatchFileEvent;
    procedure SetWebFileExtensions(const Value: TWebFileExtensions);
    function GetWebFileExtensions: TWebFileExtensions;
    procedure SetWebDirectories(const Value: TWebDirectories);
    function GetWebDirectories: TWebDirectories;
    function GetRootDirectory: string;
    procedure SetRootDirectory(const Value: string);
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
      AResponseInfo: TDSHTTPResponse; const ARequest: string; var AHandled: Boolean); override;
  protected
    property BeforeDispatch: TDispatchFileEvent read FBeforeDispatch write FBeforeDispatch;
    property AfterDispatch: TDispatchFileEvent read FAfterDispatch write FAfterDispatch;
    property WebFileExtensions: TWebFileExtensions read GetWebFileExtensions write SetWebFileExtensions;
    property WebDirectories: TWebDirectories read GetWebDirectories write SetWebDirectories;
    property RootDirectory: string read GetRootDirectory write SetRootDirectory;
  end;

  TDSHTTPServiceFileDispatcher = class(TDSCustomHTTPServiceFileDispatcher)
  published
    property BeforeDispatch;
    property AfterDispatch;
    property WebFileExtensions;
    property WebDirectories;
    property RootDirectory;
  end;
{$ENDIF}

  TDSHTTPClass = class of TDSHTTP;

  ///  <summary> Provides HTTP client functionality
  ///  </summary>
  TDSHTTP = class(TComponent)
  private
    FPeer: IIPHTTP;
    FOnValidateCertificate: TValidateCertificate;
    FAuthentication: IIPAuthentication;
    FIPImplementationID: string;
    class var FProtocols: TDictionary<string, TDSHTTPClass>;
    function GetProtocol: string;
    function GetRequest: IIPHTTPRequest;
    function GetResponse: IIPHTTPResponse;
    function GetHTTPOptions: TIPHTTPOptionsPeer;
    procedure SetHTTPOptions(options: TIPHTTPOptionsPeer);
    function GetProxyParams: IIPProxyConnectionInfo;
    function GetResponseCode: Integer;
    function GetURL: IIPURI;
  public
    class constructor Create;
    class destructor Destroy;
    constructor Create; reintroduce; overload; virtual;
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(const AIPImplementationID: string); reintroduce; overload; virtual;
    constructor Create(AOwner: TComponent; const AIPImplementationID: string); reintroduce; overload; virtual;
    destructor Destroy; override;
    class function HasPeerCertificate: Boolean; virtual;
    class procedure RegisterProtocol(const AName: string; AClass: TDSHTTPClass);
    class procedure UnregisterProtocol(const AName: string);
    class function RegisteredProtocolList: TArray<string>; static;
    class function ProtocolClass(const AName: string): TDSHTTPClass; static;

    ///  <summary> Sends a DELETE command type request. It returns the response.
    ///  </summary>
    ///  <param name="AURL">URL where the delete command is sent</param>
    ///  <returns>Server response</returns>
    function Delete(AURL: string): string; overload;
    function Delete(AURL: string; AResponseStream: TStream): string; overload;
    procedure Merge(AURL: string; RequestStream: TStream);
    procedure Head(AURL: string);
    ///  <summary>PUT command with empty content</summary>
    function Put(AURL: string): string; overload;
    function Put(AURL: string; ASource: TStream): string; overload;
    procedure Put(AURL: string; ASource, AResponseContent: TStream); overload;
    function Post(AURL: string; ASource: TStream): string; overload;
    procedure Post(AURL: string; ASource, AResponseContent: TStream); overload;
    function Get(AURL: string): string; overload;
    function Get(AURL: string; AResponseContent: TStream): string; overload;
    procedure SetBasicAuthentication(const user: String; const password: String);
    procedure SetAuthentication(auth: IIPAuthentication);
    property OnValidatePeerCertificate: TValidateCertificate read FOnValidateCertificate write FOnValidateCertificate;
    procedure Disconnect;
    property Protocol: string read GetProtocol;
    property Request: IIPHTTPRequest read GetRequest;
    property Response: IIPHTTPResponse read GetResponse;
    property HTTPOptions: TIPHTTPOptionsPeer read GetHTTPOptions write SetHTTPOptions;
    property ProxyParams: IIPProxyConnectionInfo read GetProxyParams;
    property ResponseCode: Integer read GetResponseCode;
    property URL: IIPURI read GetURL;
    property Peer: IIPHTTP read FPeer;
    property IPImplementationID: string read FIPImplementationID;
  end;

  TDSHTTPS = class(TDSHTTP)
  private
    function IdValidateCertificate(Certificate: IIPX509; AOk: Boolean;
      ADepth, AError: Integer): Boolean;
  public
    constructor Create; overload; override;
    constructor Create(const AIPImplementationID: string); overload; override;
    class function HasPeerCertificate: Boolean; override;
  end;

  ///  <summary>Indy implementation of DataSnap HTTP Context
  ///  </summary>
  TDSHTTPContextIndy = class(TDSHTTPContext)
  private
    FContext: IIPContext;
  public
    constructor Create(AContext: IIPContext);
    function Connected: Boolean; override;
    ///  <summary>Indy Context.  Provided so that event handlers can get to Indy specific properties.
    ///  </summary>
    property Context: IIPContext read FContext;
  end;

  ///  <summary>A Indy implementation of DataSnap HTTP Request
  ///  </summary>
  TDSHTTPRequestIndy = class(TDSHTTPRequest)
  strict private
    FRequestInfo: IIPHTTPRequestInfo;
    FDocument: String;
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
    constructor Create(ARequestInfo: IIPHTTPRequestInfo);
    ///  <summary>Indy RequestInfo.  Provided so that event handlers can get to Indy specific properties.
    ///  </summary>
    property RequestInfo: IIPHTTPRequestInfo read FRequestInfo;
  end;

  ///  <summary>Indy implementation of  DataSnap HTTP Response
  ///  </summary>
  TDSHTTPResponseIndy = class(TDSHTTPResponse)
  strict private
    FResponseInfo: IIPHTTPResponseInfo;
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
    constructor Create(AResponseInfo: IIPHTTPResponseInfo);

    procedure SetHeaderAuthentication(const Value: String; const Realm: String); override;

    ///  <summary>Indy ResponseInfo.  Provided so that event handlers can get to Indy specific properties.
    ///  </summary>
    property ResponseInfo: IIPHTTPResponseInfo read FResponseInfo;
  end;

implementation

uses
  Data.DBXClientResStrs,
  Data.DBXCommonIndy,
  Datasnap.DSService,
  System.SysUtils,
  Datasnap.DSServerResStrs;

type

  TDSHTTPOtherContextEvent = procedure(
      AContext: TDSHTTPContext;
      ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse;
      const ARequest: string; var AHandled: Boolean) of object;

  TDSHTTPServerIndy = class(TDSHTTPServer)
  strict private
    FHTTPOtherContext: TDSHTTPOtherContextEvent;
  private
    FServer: IIPHTTPServer;
    FDefaultPort: Word;
    FServerSoftware: string;
    FIPImplementationID: string;
    function GetActive: Boolean;
    function GetDefaultPort: Word;
    procedure SetActive(const Value: Boolean);
    procedure SetDefaultPort(const Value: Word);
    procedure DoIndyCommand(AContext: IIPContext;
      ARequestInfo: IIPHTTPRequestInfo; AResponseInfo: IIPHTTPResponseInfo);
    function GetServerSoftware: string;
    procedure SetServerSoftware(const Value: string);
    property HTTPOtherContext: TDSHTTPOtherContextEvent read FHTTPOtherContext write FHTTPOtherContext;
  protected
    function Decode(Data: string): string; override;
    procedure DoCommandOtherContext(AContext: TDSHTTPContext;
      ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse;
      const ARequest: string); override;
    procedure InitializeServer; virtual;
  public
    constructor Create(const AIPImplementationID: string = '');
    destructor Destroy; override;
    property Server: IIPHTTPServer read FServer;
    property DefaultPort: Word read GetDefaultPort write SetDefaultPort;
    property Active: Boolean read GetActive write SetActive;
    property ServerSoftware: string read GetServerSoftware write SetServerSoftware;
  end;

  TDSHTTPSServerIndy = class(TDSHTTPServerIndy)
  private
    FCertFile: string;
    FKeyFile: string;
    FRootCertFile: string;
    FOnGetPEMFilePasskey: TGetPEMFilePasskey;
    procedure ServerOnConnect(AContext: IIPContext);
    function GetCertFile: string;
    function GetKeyFile: string;
    function GetRootCertFile: string;
    procedure SetCertFile(const Value: string);
    procedure SetKeyFile(const Value: string);
    procedure SetRootCertFile(const Value: string);
    function GetSSLOptions: IIPSSLOptions;
    procedure OnGetPassword(var APasskey: AnsiString);
  protected
    procedure DoGetPEMFilePasskey(ASender: TObject; var APasskey: AnsiString); virtual;
    procedure InitializeServer; override;
    property SSLOptions: IIPSSLOptions read GetSSLOptions;
  public
    destructor Destroy; override;
    property OnGetPEMFilePasskey: TGetPEMFilePasskey read FOnGetPEMFilePasskey write FOnGetPEMFilePasskey;
    property RootCertFile: string read GetRootCertFile write SetRootCertFile;
    property CertFile: string read GetCertFile write SetCertFile;
    property KeyFile: string read GetKeyFile write SetKeyFile;
  end;

{ TDSHTTPServerIndy }

constructor TDSHTTPServerIndy.Create(const AIPImplementationID: string = '');
begin
  inherited Create(AIPImplementationID);
  FIPImplementationID := AIPImplementationID;
  FServerSoftware := 'DatasnapHTTPService/2011';
end;

procedure TDSHTTPServerIndy.InitializeServer;
begin
  if FServer <> nil then
  begin
    FServer.UseNagle := False;
    FServer.KeepAlive := True;
    FServer.ServerSoftware := FServerSoftware;
    FServer.DefaultPort := FDefaultPort;

    FServer.OnCommandGet := Self.DoIndyCommand;
    FServer.OnCommandOther := Self.DoIndyCommand;
  end;
end;

function TDSHTTPServerIndy.Decode(Data: string): string;
begin
  Result := IPProcs(IPImplementationID).URLDecode(Data);
end;

destructor TDSHTTPServerIndy.Destroy;
begin
  inherited;
  if FServer <> nil then
  begin
    FServer.Active := False;
    FServer := nil;
  end;
end;

procedure TDSHTTPServerIndy.DoIndyCommand(AContext: IIPContext; ARequestInfo: IIPHTTPRequestInfo;
                                AResponseInfo: IIPHTTPResponseInfo);
var
  LRequestInfo: TDSHTTPRequest;
  LResponseInfo: TDSHTTPResponse;
  LContext: TDSHTTPContext;
begin
  LRequestInfo := TDSHTTPRequestIndy.Create(ARequestInfo);
  LResponseInfo := TDSHTTPResponseIndy.Create(AResponseInfo);
  LContext := TDSHTTPContextIndy.Create(AContext);
  try
    DoCommand(LContext, LRequestInfo, LResponseInfo);
  finally
    LRequestInfo.Free;
    LResponseInfo.Free;
    LContext.Free;
  end;
end;

procedure TDSHTTPServerIndy.DoCommandOtherContext(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
                                    AResponseInfo: TDSHTTPResponse; const ARequest: string);
var
  LHandled: Boolean;
begin
  LHandled := False;
  if Assigned(FHTTPOtherContext) then
  begin
    FHTTPOtherContext(AContext, ARequestInfo, AResponseInfo, ARequest, LHandled);
  end;
  if not LHandled then
    inherited;
end;

function TDSHTTPServerIndy.GetActive: Boolean;
begin
  if FServer <> nil then
    Result := FServer.Active
  else
    Result := False;
end;

function TDSHTTPServerIndy.GetDefaultPort: Word;
begin
  if FServer <> nil then
    Result := FServer.DefaultPort
  else
    Result := FDefaultPort;
end;

function TDSHTTPServerIndy.GetServerSoftware: string;
begin
  if FServer <> nil then
    Result := FServer.ServerSoftware
  else
    Result := FServerSoftware;
end;

procedure TDSHTTPServerIndy.SetActive(const Value: Boolean);
begin
  if Value and (FServer = nil) then
  begin
    FServer := PeerFactory.CreatePeer(FIPImplementationID, IIPHTTPServer, nil) as IIPHTTPServer;
    InitializeServer;
  end;
  if FServer <> nil then
    FServer.Active := Value;
end;

procedure TDSHTTPServerIndy.SetDefaultPort(const Value: Word);
begin
  if FServer <> nil then
    FServer.DefaultPort := Value
  else
    FDefaultPort := Value;
end;

procedure TDSHTTPServerIndy.SetServerSoftware(const Value: string);
begin
  if FServer <> nil then
    FServer.ServerSoftware := Value
  else
    FServerSoftware := Value;
end;

{TDSHTTP}

constructor TDSHTTP.Create;
begin
  Create(nil);
end;

constructor TDSHTTP.Create(const AIPImplementationID: string);
begin
  Create(nil, AIPImplementationID);
end;

function TDSHTTP.Delete(AURL: string): string;
var
  LStream: TMemoryStream;
begin
  LStream := TMemoryStream.Create;
  try
    FPeer.DoRequestDelete(AURL, nil, LStream, []);
    LStream.Position := 0;
    // This is here instead of a TStringStream for .net conversions?
    Result := IPProcs(IPImplementationID).ReadStringFromStream(LStream, -1);//, ContentTypeToEncoding(Response.ContentType));
  finally
    FreeAndNil(LStream);
  end;
end;

class constructor TDSHTTP.Create;
begin
  FProtocols := TDictionary<string, TDSHTTPClass>.Create;
end;

constructor TDSHTTP.Create(AOwner: TComponent);
begin
  Create(AOwner, '');
end;

constructor TDSHTTP.Create(AOwner: TComponent; const AIPImplementationID: string);
begin
  inherited Create(AOwner);
  FIPImplementationID := AIPImplementationID;
  FPeer := PeerFactory.CreatePeer(AIPImplementationID, IIPHTTP, nil) as IIPHTTP;
end;

function TDSHTTP.Delete(AURL: string; AResponseStream: TStream): string;
begin
  FPeer.DoRequestDelete(AURL, nil, AResponseStream, []);
end;

destructor TDSHTTP.Destroy;
begin
  FPeer := nil;
  inherited;
end;

class destructor TDSHTTP.Destroy;
begin
  FreeAndNil(FProtocols);
end;

procedure TDSHTTP.Disconnect;
begin
  FPeer.Disconnect;
end;

function TDSHTTP.Get(AURL: string; AResponseContent: TStream): string;
begin
  Result := FPeer.DoGet(AURL, AResponseContent);
end;

function TDSHTTP.Get(AURL: string): string;
begin
  Result := FPeer.DoGet(AURL);
end;

function TDSHTTP.GetHTTPOptions: TIPHTTPOptionsPeer;
begin
  Result := FPeer.HTTPOptions;
end;

function TDSHTTP.GetProtocol: string;
begin
  Result := FPeer.Protocol;
end;

function TDSHTTP.GetProxyParams: IIPProxyConnectionInfo;
begin
  Result := FPeer.ProxyParams;
end;

function TDSHTTP.GetRequest: IIPHTTPRequest;
begin
  Result := FPeer.Request;
end;

function TDSHTTP.GetResponse: IIPHTTPResponse;
begin
  Result := FPeer.Response;
end;

function TDSHTTP.GetResponseCode: Integer;
begin
  Result := FPeer.ResponseCode;
end;

function TDSHTTP.GetURL: IIPURI;
begin
  Result := FPeer.URL;
end;

class function TDSHTTP.HasPeerCertificate: Boolean;
begin
  Result := False;
end;

procedure TDSHTTP.Head(AURL: string);
begin
  FPeer.DoRequestHead(AURL, nil, nil, []);
end;

procedure TDSHTTP.Merge(AURL: string; RequestStream: TStream);
begin
  FPeer.DoRequestMethod('MERGE', AURL, RequestStream, nil, []);
end;

function TDSHTTP.Put(AURL: string): string;
var
  emptyStream: TMemoryStream;
begin
  emptyStream := TMemoryStream.Create;
  try
    Result := FPeer.DoPut(AURL, emptyStream);
  finally
    emptyStream.Free;
  end;
end;

class procedure TDSHTTP.RegisterProtocol(const AName: string;
  AClass: TDSHTTPClass);
begin
  FProtocols.Add(LowerCase(AName), AClass);
end;

procedure TDSHTTP.SetAuthentication(auth: IIPAuthentication);
begin
  FAuthentication := auth;
  FPeer.Request.Authentication := auth;
end;

procedure TDSHTTP.SetBasicAuthentication(const user, password: String);
begin
  FAuthentication := PeerFactory.CreatePeer(FIPImplementationID, IIPBasicAuthentication) as IIPBasicAuthentication;
  FAuthentication.Password := password;
  FAuthentication.Username := user;
  FPeer.Request.Authentication := FAuthentication;
end;

procedure TDSHTTP.SetHTTPOptions(options: TIPHTTPOptionsPeer);
begin
  FPeer.HTTPOptions := options;
end;

class procedure TDSHTTP.UnregisterProtocol(const AName: string);
begin
  if FProtocols <> nil then
    FProtocols.Remove(LowerCase(AName));
end;

class function TDSHTTP.RegisteredProtocolList: TArray<string>;
var
  List: TArray<string>;
  LName: string;
  I: Integer;
begin
  SetLength(List, FProtocols.Count);
  I := 0;
  for LName in FProtocols.Keys do
  begin
    List[I] := LName;
    Inc(I);
  end;
  Result := List;
end;

procedure TDSHTTP.Post(AURL: string; ASource, AResponseContent: TStream);
begin
  FPeer.DoPost(AURL, ASource, AResponseContent);
end;

function TDSHTTP.Post(AURL: string; ASource: TStream): string;
begin
  Result := FPeer.DoPost(AURL, ASource);
end;

class function TDSHTTP.ProtocolClass(const AName: string): TDSHTTPClass;
begin
  Result := FProtocols[LowerCase(AName)];
end;

procedure TDSHTTP.Put(AURL: string; ASource, AResponseContent: TStream);
begin
  FPeer.DoPut(AURL, ASource, AResponseContent);
end;

function TDSHTTP.Put(AURL: string; ASource: TStream): string;
begin
  Result := FPeer.DoPut(AURL, ASource);
end;

{ TDSHTTPS }

constructor TDSHTTPS.Create;
begin
  Create('');
end;

constructor TDSHTTPS.Create(const AIPImplementationID: string);
var
  LIOHandler: IIPSSLIOHandlerSocketOpenSSL;
begin
  inherited Create(AIPImplementationID);
  FPeer.Protocol := 'https';
  LIOHandler := PeerFactory.CreatePeer(AIPImplementationID, IIPSSLIOHandlerSocketOpenSSL, Self) as IIPSSLIOHandlerSocketOpenSSL; //TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  LIOHandler.OnVerifyPeer := IdValidateCertificate;
  LIOHandler.SSLOptions.VerifyMode := [TIPSSLVerifyModePeer.sslvrfClientOnce];
  FPeer.IOHandler := LIOHandler;
end;

class function TDSHTTPS.HasPeerCertificate: Boolean;
begin
  Result := True;
end;

function TDSHTTPS.IdValidateCertificate(Certificate: IIPX509; AOk: Boolean; ADepth, AError: Integer): Boolean;
var
  Cert: TX509Certificate;
begin
  Result := true;
  if Assigned(FOnValidateCertificate) then
  begin
    Cert := TX509CertificateIndy.Create(Certificate);
    try
      // prepare the TX509Ceritifcate and invoke user method
      FOnValidateCertificate(Self, Cert, ADepth, Result);
    finally
      Cert.Free;
    end;
  end;
end;

{ TDSHTTPService }

constructor TDSHTTPService.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDefaultPort := _IPPORT_HTTP;
  FComponentList := TComponentList.Create(False);  // Does not own objects
end;

procedure TDSHTTPService.RemoveComponent(const AComponent: TDSHTTPServiceComponent);
begin
  if (AComponent <> nil) and (FComponentList <> nil) then
    FComponentList.Remove(AComponent);
end;

procedure TDSHTTPService.AddComponent(const AComponent: TDSHTTPServiceComponent);
begin
  if FComponentList.IndexOf(AComponent) = -1 then
    FComponentList.Add(AComponent);
end;

function TDSHTTPService.CreateHttpServer: TDSHTTPServer;
var
  LHTTPServer: TDSHTTPServerIndy;
begin
  if Assigned(FCertFiles) then
    LHTTPServer := TDSHTTPSServerIndy.Create(IPImplementationID)
  else
    LHTTPServer := TDSHTTPServerIndy.Create(IPImplementationID);
  Result := LHTTPServer;
  LHTTPServer.HTTPOtherContext := HTTPOtherContext;
end;

procedure TDSHTTPService.HTTPOtherContext(
      AContext: TDSHTTPContext;
      ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse;
      const ARequest: string; var AHandled: Boolean);
var
  I: Integer;
  LComponent: TComponent;
begin
  for I := 0 to FComponentList.Count - 1 do
  begin
    LComponent := FComponentList[I];
    if LComponent is TDSHTTPServiceComponent then
    begin
      TDSHTTPServiceComponent(LComponent).DoCommand(AContext, ARequestInfo, AResponseInfo,
        ARequest, AHandled);
      if AHandled then
        break;
    end;
  end;
end;

destructor TDSHTTPService.Destroy;
begin
  TDSSessionManager.Instance.TerminateAllSessions(self);
  ServerCloseAllTunnelSessions;
  FreeAndNil(FComponentList);
  inherited;
end;

function TDSHTTPService.GetHttpPort: Word;
begin
  if Assigned(FHttpServer) then
    Result := TDSHTTPServerIndy(FHttpServer).DefaultPort
  else
    Result := FDefaultPort;
end;

procedure TDSHTTPService.SetHttpPort(const Port: Word);
begin
  FDefaultPort := Port;
  if Assigned(FHttpServer) then
    TDSHTTPServerIndy(FHttpServer).DefaultPort := Port;
end;

procedure TDSHTTPService.InitializeHttpServer;
begin
  inherited;
  if FCertFiles <> nil then
    FCertFiles.SetServerProperties(FHttpServer);
  TDSHTTPServerIndy(FHttpServer).DefaultPort := FDefaultPort;
  TDSHTTPServerIndy(FHttpServer).Active := FActive;
end;

function TDSHTTPService.IsActive: boolean;
begin
  if Assigned(FHttpServer) then
    Result := TDSHTTPServerIndy(FHttpServer).Active
  else
    Result := FActive;
end;

procedure TDSHTTPService.SetActive(Status: Boolean);
begin
  if not Status then
    ServerCloseAllTunnelSessions;
  FActive := Status;
  if Assigned(FHttpServer) then
    TDSHTTPServerIndy(FHttpServer).Active := Status
  else if not (csLoading in ComponentState) then
    // Create FHttpServer
    if FActive then
      RequiresServer;
end;

procedure TDSHTTPService.SetCertFiles(const AValue: TDSCustomCertFiles);
begin
  if (AValue <> FCertFiles) then
  begin
    if Assigned(FCertFiles) then
      RemoveFreeNotification(FCertFiles);
    FCertFiles := AValue;
    if Assigned(FCertFiles) then
      FreeNotification(FCertFiles);
  end;
end;

procedure TDSHTTPService.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FCertFiles) then
    FCertFiles := nil;
end;

function TDSHTTPService.GetServerSoftware: string;
begin
  if not (csLoading in ComponentState) then
    RequiresServer;
  if FHttpServer <> nil then
    Result := TDSHTTPServerIndy(FHttpServer).ServerSoftware
  else
    Result := '';
end;

procedure TDSHTTPService.SetIPImplementationID(const Value: string);
begin
  if IsActive then
    raise Exception.Create(sCannotChangeIPImplID);
  inherited SetIPImplementationID(Value);
end;

procedure TDSHTTPService.Stop;
begin
  TDSSessionManager.Instance.TerminateAllSessions(self);
  SetActive(False);
  inherited;
end;

procedure TDSHTTPService.Start;
begin
  inherited;
  RequiresServer;
  if Assigned(FHttpServer) then
  begin
    // Moved
    //TDSHTTPServerIndy(FHttpServer).Server.UseNagle := False;
    TDSHTTPServerIndy(FHttpServer).Active := True;
  end;
end;

{ TDSHTTPResponseIndy }

constructor TDSHTTPResponseIndy.Create(AResponseInfo: IIPHTTPResponseInfo);
begin
  FResponseInfo := AResponseInfo;
end;

procedure TDSHTTPResponseIndy.SetHeaderAuthentication(const Value: String; const Realm: String);
begin
  FResponseInfo.AuthRealm := Realm;
  FResponseInfo.WWWAuthenticate.Add('Basic')
end;

function TDSHTTPResponseIndy.GetCloseConnection: Boolean;
begin
  Result := FResponseInfo.CloseConnection;
end;

function TDSHTTPResponseIndy.GetContentLength: Int64;
begin
  Result := FResponseInfo.ContentLength;
end;

function TDSHTTPResponseIndy.GetContentStream: TStream;
begin
  Result := FResponseInfo.ContentStream;
end;

function TDSHTTPResponseIndy.GetContentText: string;
begin
  Result := FResponseInfo.ContentText;
end;

function TDSHTTPResponseIndy.GetContentType: string;
begin
  Result := FResponseInfo.ContentType;
end;

function TDSHTTPResponseIndy.GetFreeContentStream: Boolean;
begin
  Result := FResponseInfo.FreeContentStream;
end;

function TDSHTTPResponseIndy.GetPragma: string;
begin
  Result := FResponseInfo.Pragma;
end;

function TDSHTTPResponseIndy.GetResponseNo: Integer;
begin
  Result := FResponseInfo.ResponseNo;
end;

function TDSHTTPResponseIndy.GetResponseText: String;
begin
  Result := FResponseInfo.ResponseText;
end;

procedure TDSHTTPResponseIndy.SetCloseConnection(const Value: Boolean);
begin
  FResponseInfo.CloseConnection := Value;
end;

procedure TDSHTTPResponseIndy.SetContentLength(const Value: Int64);
begin
  FResponseInfo.ContentLength := Value;
end;

procedure TDSHTTPResponseIndy.SetContentStream(const Value: TStream);
begin
  FResponseInfo.ContentStream := Value;
end;

procedure TDSHTTPResponseIndy.SetContentText(const Value: string);
begin
  FResponseInfo.ContentText := Value;
end;

procedure TDSHTTPResponseIndy.SetContentType(const Value: string);
begin
  FResponseInfo.ContentType := Value;
end;

procedure TDSHTTPResponseIndy.SetFreeContentStream(const Value: Boolean);
begin
  FResponseInfo.FreeContentStream := Value;
end;

procedure TDSHTTPResponseIndy.SetPragma(const Value: string);
begin
  inherited;
  FResponseInfo.Pragma := Value;
end;

procedure TDSHTTPResponseIndy.SetResponseNo(const Value: Integer);
begin
  FResponseInfo.ResponseNo := Value;
end;

procedure TDSHTTPResponseIndy.SetResponseText(const Value: String);
begin
  FResponseInfo.ResponseText := Value;
end;

{ TDSHTTPRequestIndy }

constructor TDSHTTPRequestIndy.Create(ARequestInfo: IIPHTTPRequestInfo);
begin
  FRequestInfo := ARequestInfo;
end;

function TDSHTTPRequestIndy.GetAccept: string;
begin
  Result := FRequestInfo.Accept;
end;

function TDSHTTPRequestIndy.GetAuthPassword: string;
begin
  Result := FRequestInfo.AuthPassword;
end;

function TDSHTTPRequestIndy.GetAuthUserName: string;
begin
  Result := FRequestInfo.AuthUserName;
end;

function TDSHTTPRequestIndy.GetCommand: string;
begin
  Result := FRequestInfo.Command;
end;

function TDSHTTPRequestIndy.GetCommandType: TDSHTTPCommandType;
begin
  case FRequestInfo.CommandType of
    THTTPCommandTypePeer.hcUnknown:
      Result := TDSHTTPCommandType.hcUnknown;
    THTTPCommandTypePeer.hcGET:
      Result := TDSHTTPCommandType.hcGET;
    THTTPCommandTypePeer.hcPOST:
      Result := TDSHTTPCommandType.hcPOST;
    THTTPCommandTypePeer.hcDELETE:
      Result := TDSHTTPCommandType.hcDELETE;
    THTTPCommandTypePeer.hcPUT:
      Result := TDSHTTPCommandType.hcPUT;
    THTTPCommandTypePeer.hcTRACE,
    THTTPCommandTypePeer.hcHEAD,
    THTTPCommandTypePeer.hcOPTION:
      Result := TDSHTTPCommandType.hcOther;
  else
    //Result := TDSHTTPCommandType.hcUnknown;
    raise Exception.Create(sUnknownCommandType);
  end;
end;

function TDSHTTPRequestIndy.GetDocument: string;
var
  RawStr: RawByteString;
  Count, I: Integer;
  CharCode: SmallInt;
begin
  // RAID 272624: Indy doesn't properly decodes the encoded URLs; this will be fixed in
  // Indy 11 we are told. If so, this code can be replaced with
  //
  // Result := LRequestInfo.Document
  //
  if FDocument = EmptyStr then
  begin
    Count := Length(FRequestInfo.Document);
    SetLength(RawStr, Count);
    for I := 0 to Count - 1 do
    begin
      CharCode := Ord(FRequestInfo.Document[I+1]);
      if CharCode > 255 then
      begin
        FDocument := FRequestInfo.Document;
        exit(FDocument)
      end;
      RawStr[I+1] := AnsiChar(CharCode);
    end;
    FDocument := UTF8ToString(RawStr)
  end;
  exit(FDocument);
end;

function TDSHTTPRequestIndy.GetParams: TStrings;
begin
  Result := FRequestInfo.Params;
end;

function TDSHTTPRequestIndy.GetPostStream: TStream;
begin
  Result := FRequestInfo.PostStream;
end;

function TDSHTTPRequestIndy.GetPragma: string;
begin
  Result := FRequestInfo.Pragma;
end;

function TDSHTTPRequestIndy.GetRemoteIP: string;
begin
  Result := FRequestInfo.RemoteIP;
end;

function TDSHTTPRequestIndy.GetURI: string;
begin
  Result := FRequestInfo.URI;
end;

function TDSHTTPRequestIndy.GetUserAgent: string;
begin
  Result := FRequestInfo.UserAgent;
end;

function TDSHTTPRequestIndy.GetProtocolVersion: string;
begin
  Result := FRequestInfo.Version;
end;

{ TDSHTTPContextIndy }

function TDSHTTPContextIndy.Connected: Boolean;
begin
  Result := FContext.Connection.Connected;
end;

constructor TDSHTTPContextIndy.Create(AContext: IIPContext);
begin
  inherited Create;
  FContext := AContext;
end;

{ TDSHTTPServiceComponent }

procedure TDSHTTPServiceComponent.SetService(const AValue: TDSHTTPService);
begin
  if (AValue <> Service) then
  begin
    if Assigned(Service) then
      RemoveFreeNotification(Service);
    if Assigned(AValue) then
      FreeNotification(AValue);
  end;
  if FService <> nil then
    FService.RemoveComponent(self);
  if AValue <> nil then
    AValue.AddComponent(self);
  self.FService := AValue;
end;

procedure TDSHTTPServiceComponent.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FService) then
    FService := nil;
end;

                                                               
{$IFNDEF POSIX}
type
  TIndyDispatchFileRequest = class(TDispatchFileRequest)
  private
    FContext: TDSHTTPContextIndy;
    FRequestInfo:  TDSHTTPRequestIndy;
    FResponseInfo: TDSHTTPResponseIndy;
    FComponent: TDSCustomHTTPServiceFileDispatcher;
  protected
    function IsGetRequest: Boolean; override;
    function IsHeadRequest: Boolean; override;
    procedure SetErrorCode(AStatusCode: Integer); override;
    function GetIfModifiedSince: TDateTime; override;
    procedure SetContentStream(AStream: TStream); override;
    procedure SetContentLength(ALength: Integer); override;
    procedure SetContentType(const AValue: string); override;
    procedure SetLastModified(AValue: TDateTime); override;
    function GetExceptionClass: TClass; override;
    procedure DoBeforeDispatch(const AFileName: string; var AHandled: Boolean); override;
    procedure DoAfterDispatch(const AFileName: string; var AHandled: Boolean); override;
    function GetRequestPathInfo: string; override;
    function GetResponseSent: Boolean; override;
  public
    constructor Create(AComponent: TDSCustomHTTPServiceFileDispatcher; AContext: TDSHTTPContextIndy; ARequestInfo: TDSHTTPRequestIndy;
      AResponseInfo: TDSHTTPResponseIndy);
  end;

{ TIndyDispatchFileRequest }

constructor TIndyDispatchFileRequest.Create(AComponent: TDSCustomHTTPServiceFileDispatcher; AContext: TDSHTTPContextIndy; ARequestInfo: TDSHTTPRequestIndy;
  AResponseInfo: TDSHTTPResponseIndy);
begin
  inherited Create(AComponent.FFileDispatcherProperties);
  FComponent := AComponent;
  FContext := AContext;
  FRequestInfo := ARequestInfo;
  FResponseInfo := AResponseInfo;
end;

function TIndyDispatchFileRequest.IsGetRequest: Boolean;
begin
  Result := FRequestInfo.RequestInfo.CommandType = THTTPCommandTypePeer.hcGET;
end;

function TIndyDispatchFileRequest.IsHeadRequest: Boolean;
begin
  Result := FRequestInfo.RequestInfo.CommandType = THTTPCommandTypePeer.hcHEAD;
end;

procedure TIndyDispatchFileRequest.SetErrorCode(AStatusCode: Integer);
begin
 FResponseInfo.ResponseInfo.ResponseNo := AStatusCode;
end;

function TIndyDispatchFileRequest.GetIfModifiedSince: TDateTime;
begin
  Result := IPProcs(FRequestInfo.RequestInfo.GetIPImplementationID).GMTToLocalDateTime(FRequestInfo.RequestInfo.RawHeaders.Values['If-Modified-Since']);  {do not localize}
end;

procedure TIndyDispatchFileRequest.SetContentStream(AStream: TStream);
begin
  FResponseInfo.ResponseInfo.ContentStream := AStream;
end;

procedure TIndyDispatchFileRequest.SetContentLength(ALength: Integer);
begin
  FResponseInfo.ResponseInfo.ContentLength := ALength;
end;

procedure TIndyDispatchFileRequest.SetContentType(const AValue: string);
begin
  FResponseInfo.ResponseInfo.ContentType := AValue;
end;

procedure TIndyDispatchFileRequest.SetLastModified(AValue: TDateTime);
begin
  TDSHTTPRequestIndy(FRequestInfo).RequestInfo.LastModified := AValue;
end;

function TIndyDispatchFileRequest.GetExceptionClass: TClass;
begin
  Result := Exception;
end;

procedure TIndyDispatchFileRequest.DoBeforeDispatch(const AFileName: string; var AHandled: Boolean);
begin
  if Assigned(FComponent.FBeforeDispatch) then
    FComponent.FBeforeDispatch(FComponent, AFileName, FContext, FRequestInfo, FResponseInfo, AHandled)
end;

procedure TIndyDispatchFileRequest.DoAfterDispatch(const AFileName: string; var AHandled: Boolean);
begin
  if Assigned(FComponent.FAfterDispatch) then
    FComponent.FAfterDispatch(FComponent, AFileName, FContext, FRequestInfo, FResponseInfo, AHandled);
  if (not FResponseInfo.ResponseInfo.HeaderHasBeenWritten) and (FResponseInfo.ResponseInfo.ContentText = '') then
  begin
    // Force write of error message
    FResponseInfo.ResponseInfo.WriteHeader;
    FResponseInfo.ResponseInfo.WriteContent;
  end;
end;

{ TIndyDispatchFileRequest }

function TIndyDispatchFileRequest.GetRequestPathInfo: string;
begin
  Result := FRequestInfo.Document;
end;
 
function TIndyDispatchFileRequest.GetResponseSent: Boolean;
begin 
  Result := False;
end;

{ TDSCustomHTTPServiceFileDispatcher }

constructor TDSCustomHTTPServiceFileDispatcher.Create(AOwner: TComponent);
begin
  inherited;
  FFileDispatcherProperties := TWebFileDispatcherProperties.Create(Self);
end;

procedure TDSCustomHTTPServiceFileDispatcher.DoCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
  AResponseInfo: TDSHTTPResponse; const ARequest: string; var AHandled: Boolean);
var
  LDispatcher: TIndyDispatchFileRequest;
begin
  AHandled := False;
  if AContext is TDSHTTPContextIndy then
  begin
    LDispatcher := TIndyDispatchFileRequest.Create(Self,
      TDSHTTPContextIndy(AContext),  TDSHTTPRequestIndy(ARequestInfo),
      TDSHTTPResponseIndy(AResponseInfo));
    try
      AHandled := LDispatcher.DispatchFileRequest;
    finally
      LDispatcher.Free;
    end;
  end;
end;

function TDSCustomHTTPServiceFileDispatcher.GetWebDirectories: TWebDirectories;
begin
  Result := FFileDispatcherProperties.WebDirectories;
end;

function TDSCustomHTTPServiceFileDispatcher.GetRootDirectory: string;
begin
  Result := FFileDispatcherProperties.RootDirectory;
end;

function TDSCustomHTTPServiceFileDispatcher.GetWebFileExtensions: TWebFileExtensions;
begin
  Result := FFileDispatcherProperties.WebFileExtensions;
end;

procedure TDSCustomHTTPServiceFileDispatcher.SetWebDirectories(
  const Value: TWebDirectories);
begin
  FFileDispatcherProperties.WebDirectories := Value;
end;

procedure TDSCustomHTTPServiceFileDispatcher.SetRootDirectory(const Value: string);
begin
  FFileDispatcherProperties.RootDirectory := Value;
end;

procedure TDSCustomHTTPServiceFileDispatcher.SetWebFileExtensions(
  const Value: TWebFileExtensions);
begin
 FFileDispatcherProperties.WebFileExtensions := Value;
end;

{$ENDIF}

{ TDSCertFiles }

function TDSCustomCertFiles.GetCertFile: string;
begin
  Result := FCertFile;
end;

function TDSCustomCertFiles.GetKeyFile: string;
begin
  Result := FKeyFile;
end;

procedure TDSCustomCertFiles.SetOnGetPEMFilePasskey(
  const Value: TGetPEMFilePasskey);
begin
  FGetPEMFilePasskey := Value;
end;

function TDSCustomCertFiles.GetRootCertFile: string;
begin
  Result := FRootCertFile;
end;

procedure TDSCustomCertFiles.SetCertFile(const Value: string);
begin
  FCertFile := Value;
end;

procedure TDSCustomCertFiles.SetKeyFile(const Value: string);
begin
  FKeyFile := Value;
end;

function TDSCustomCertFiles.GetOnGetPEMFilePasskey: TGetPEMFilePasskey;
begin
  Result := FGetPEMFilePassKey;
end;

procedure TDSCustomCertFiles.SetRootCertFile(const Value: string);
begin
  FRootCertFile := Value;
end;

procedure TDSCustomCertFiles.SetServerProperties(AServer: TObject);
var
  LServer: TDSHTTPSServerIndy;
begin
  if AServer is TDSHTTPSServerIndy then
  begin
    LServer := TDSHTTPSServerIndy(AServer);
    LServer.CertFile := CertFile;
    LServer.KeyFile := KeyFile;
    LServer.RootCertFile := RootCertFile;
    LServer.OnGetPEMFilePasskey := OnGetPEMFilePasskey;
  end
  else
  begin
    raise TDSServiceException.Create(Format(SUnknownServerType, [AServer.ClassName]));
  end;
end;

{ TDSHTTPSServerIndy }

destructor TDSHTTPSServerIndy.Destroy;
begin
  inherited;
end;

(*
<< Client>>>
Create a VCL Application and drop a TIdTCPClient and a
TIdSSLIOHandlerSocketOpenSSL on the form. Set the TIdTCPClient's Host
to localhost, Port to 16000 and IOHandler to the SSL IOHandler.
Next, alter the SSL options so that Method is set to sslvSSLv3 and Mode
is set to sslmClient.
Next create OnCreate/OnDestroy event handlers for the form and in that
put Client.Connect/Client.Disconnect respectively.
Compile.
<< Server>>
Create a VCL Application and drop a TIdCMDTcpServer and a
TIdServerIOHandlerSSLOpenSSL on the form. Set the TIdCMDTCPServer's
Bindings to 127.0.0.1:16000 and IOHandler to the SSL IOHandler.
Next alter the SSL options so that Method is set to sslvSSLv3 and Mode
is set to sslmServer. Set CertFile to server.cert, KeyFile to
server.key and RootCertFile to ca.cert.
Next, create event handlers for the form OnCreate/OnDestroy to
Server.Active := True/Server.Active := False respectively.
Compile.
*)

function TDSHTTPSServerIndy.GetSSLOptions: IIPSSLOptions;
var
  Handler: IIPServerIOHandlerSSLOpenSSL;
begin
  if Server <> nil then
  begin
    if not Supports(Server.IOHandler, IIPServerIOHandlerSSLOpenSSL, Handler) then
      raise Exception.Create(sUnsupportedServerIOHandler);
    Result := Handler.SSLOptions;
  end;
end;

function TDSHTTPSServerIndy.GetCertFile: string;
begin
  if SSLOptions <> nil then
    Result := SSLOptions.CertFile
  else
    Result := FCertFile;
end;

function TDSHTTPSServerIndy.GetKeyFile: string;
begin
  if SSLOptions <> nil then
    Result := SSLOptions.KeyFile
  else
    Result := FKeyFile;
end;

function TDSHTTPSServerIndy.GetRootCertFile: string;
begin
  if SSLOptions <> nil then
    Result := SSLOptions.RootCertFile
  else
    Result := FRootCertFile;
end;

procedure TDSHTTPSServerIndy.InitializeServer;
var
  LIOHandler: IIPServerIOHandlerSSLOpenSSL;
begin
  inherited;
  if Server <> nil then
  begin
    LIOHandler := PeerFactory.CreatePeer(IPImplementationID, IIPServerIOHandlerSSLOpenSSL, Server.GetObject as TComponent) as IIPServerIOHandlerSSLOpenSSL; //TIdServerIOHandlerSSLOpenSSL.Create(Server);
    LIOHandler.SSLOptions.Method := TIPSSLVersionPeer.sslvTLSv1;
    LIOHandler.SSLOptions.Mode := TIPSSLModePeer.sslmServer;
    LIOHandler.SSLOptions.CertFile := FCertFile;
    LIOHandler.SSLOptions.RootCertFile := FRootCertFile;
    LIOHandler.SSLOptions.KeyFile := FKeyFile;

    LIOHandler.OnGetPassword := OnGetPassword;
    Server.IOHandler := LIOHandler;
    Assert(not Assigned(Server.OnConnect));
    Server.OnConnect := ServerOnConnect;
  end;
end;

procedure TDSHTTPSServerIndy.OnGetPassword(var APasskey: AnsiString);
begin
  DoGetPEMFilePasskey(Self, APasskey);
end;

procedure TDSHTTPSServerIndy.DoGetPEMFilePasskey(ASender : TObject; var APasskey: AnsiString);
begin
  if Assigned(FOnGetPEMFilePasskey) then
    FOnGetPEMFilePasskey(ASender, APasskey);
end;

procedure TDSHTTPSServerIndy.ServerOnConnect(AContext: IIPContext);
var
  Handler: IIPSSLIOHandlerSocketBase;
begin
  // Passthrough = False to enable SSL.  Indy supports SSL on a per connection basis.
  // For DataSnap, SSL is always enabled for an HTTPS connection
  if not Supports(AContext.Connection.IOHandler, IIPSSLIOHandlerSocketBase, Handler) then
    raise Exception.Create(sUnsupportedServerIOHandler);
  Handler.PassThrough := False;
end;

procedure TDSHTTPSServerIndy.SetCertFile(const Value: string);
begin
  if SSLOptions <> nil then
    SSLOptions.CertFile := Value
  else
    FCertFile := Value;
end;

procedure TDSHTTPSServerIndy.SetKeyFile(const Value: string);
begin
  if SSLOptions <> nil then
    SSLOptions.KeyFile := Value
  else
    FKeyFile := Value;
end;

procedure TDSHTTPSServerIndy.SetRootCertFile(const Value: string);
begin
  if SSLOptions <> nil then
    SSLOptions.RootCertFile := Value
  else
    FRootCertFile := Value;
end;

initialization
  TDSHTTP.RegisterProtocol('http', TDSHTTP);
  TDSHTTPS.RegisterProtocol('https', TDSHTTPS);
finalization
  TDSHTTP.UnregisterProtocol('http');
  TDSHTTPS.UnregisterProtocol('https');
end.
