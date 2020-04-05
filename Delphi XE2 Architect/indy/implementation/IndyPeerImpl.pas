{*******************************************************}
{                                                       }
{              Delphi Indy Implementation               }
{                                                       }
{ Copyright(c) 1995-2010 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "IndyPeerImpl"'}    {Do not Localize}
{$IFDEF MACOS}
  (*$HPPEMIT '#if defined(__APPLE__) && !defined(_NO_PRAGMA_LINK_INDY)' *)
  (*$HPPEMIT ' #ifndef USEPACKAGES' *)
  (*$HPPEMIT '  #pragma link "IndyCore.a"' *)
  (*$HPPEMIT '  #pragma link "IndyProtocols.a"' *)
  (*$HPPEMIT '  #pragma link "IndySystem.a"' *)
  (*$HPPEMIT ' #else' *)
  (*$HPPEMIT '  #pragma link "IndyCore.bpi"' *)
  (*$HPPEMIT '  #pragma link "IndyProtocols.bpi"' *)
  (*$HPPEMIT '  #pragma link "IndySystem.bpi"' *)
  (*$HPPEMIT ' #endif' *)
  (*$HPPEMIT '#endif' *)
{$ELSE} //Win32, Win64
  (*$HPPEMIT '#if !defined(_NO_PRAGMA_LINK_INDY)' *)
  (*$HPPEMIT ' #ifndef USEPACKAGES' *)
  (*$HPPEMIT '  #pragma link "IndyCore.lib"' *)
  (*$HPPEMIT '  #pragma link "IndyProtocols.lib"' *)
  (*$HPPEMIT '  #pragma link "IndySystem.lib"' *)
  (*$HPPEMIT ' #else' *) //static
  (*$HPPEMIT '  #pragma link "IndyCore.bpi"' *)
  (*$HPPEMIT '  #pragma link "IndyProtocols.bpi"' *)
  (*$HPPEMIT '  #pragma link "IndySystem.bpi"' *)
  (*$HPPEMIT ' #endif' *)
  (*$HPPEMIT '#endif' *) 
{$ENDIF}

unit IndyPeerImpl;

interface

uses
  Classes, RTTI, Generics.Collections, SysUtils, IdHeaderList,
  IdHTTP, IdHTTPServer, IdCustomHTTPServer, IdAuthentication, IdURI, IdFIPS,
  IdSSLOpenSSL, IdSSLOpenSSLHeaders, IdGlobal, IdGlobalProtocols, IdIOHandler,
  IdHTTPHeaderInfo, IdTCPClient, IdBuffer, IdTCPConnection, IdIOHandlerSocket,
  IdSocketHandle, IdStack,

  //server specific units
  IdServerIOHandler, IdContext, IdSchedulerOfThreadPool, IdScheduler, IdTCPServer,
  //end of server specific units

  IPPeerAPI; //put last because we have some type names identical to indy ones in here

type
  TIdClassIP = class(TInterfacedObject)
  private
    FIsFreed: Boolean;
    procedure SetDestroyed;
    function NeedToFree: Boolean;
  public
    procedure AfterConstruction; override;
  end;

  TIdProc = class(TInterfacedObject, IIPPeerProcs)
  public
    function RSA_PKCS1_PADDING: Integer;
    procedure _RSA_free(Ptr: PRSAPeer);
    function _RSA_generate_key(bits: TIPC_INT; e: TIPC_ULONG): PRSAPeer;
    function _i2d_RSAPublicKey(x: PRSAPeer; buf: PPByte): TIPC_INT;
    function _d2i_RSAPublicKey(pr: PRSAPeer; _in : PPByte; len : TIPC_INT): PRSAPeer;
    function _SSLLoad: Boolean;
    procedure _ERR_load_crypto_strings;
    procedure _OpenSSL_add_all_ciphers;
    function _RSA_size(key: PRSAPeer): TIPC_INT;
    function _RSA_private_decrypt(flen: TIPC_INT; from: PByte; _to: PByte; rsa: PRSAPeer; padding: TIPC_INT): TIPC_INT;
    function _RSA_public_encrypt(flen: TIPC_INT; from: PByte; _to: PByte; rsa: PRSAPeer; padding: TIPC_INT): TIPC_INT;
    function _ERR_error_string(e: TIPC_ULONG; buf: PAnsiChar): PAnsiChar;
    function _ERR_get_error: TIPC_ULONG;
    function _d2i_X509(pr: PX509Peer; _in : PPByte; len : TIPC_INT): PX509Peer;
    function URLEncode(const ASrc: string): string;
    function URLDecode(ASrc: string; AByteEncoding: TIPTextEncodingPeer = nil): string;
    function ReadStringAsCharset(AStream: TStream; const ACharset: string): string;
    function ParamsEncode(const ASrc: string; AByteEncoding: TIPTextEncodingPeer = nil): string;
    function ReadStringFromStream(AStream: TStream; ASize: Integer = -1; AByteEncoding: TIPTextEncodingPeer = nil): string;
    function GMTToLocalDateTime(S: string): TDateTime;
    function IsHMACSHA256Avail: Boolean;
    function GetHMACSHA256HashInst(const AKey: TIPBytesPeer): TIPHMACIntCtx;
    procedure UpdateHMACInst(ACtx: TIPHMACIntCtx; const AIn: TIPBytesPeer);
    function FinalHMACInst(ACtx: TIPHMACIntCtx): TIPBytesPeer;
    function IsHMACSHA1Avail: Boolean;
    function GetHMACSHA1HashInst(const AKey: TIPBytesPeer): TIPHMACIntCtx;
  end;

  TIdServerIOHandlerPeer = class(TInterfacedObject, IIPServerIOHandler)
  private
    FHandler: TIdServerIOHandler;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Handler: TIdServerIOHandler);
  end;

  TIdTCPClientIP = class(TIdTCPClient)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;
  TIdTCPClientPeer = class(TIdClassIP, IIPTCPClient)
  private
    FTCPClient: TIdTCPClientIP;
    FIOHandler: IIPIOHandler;
  protected
    function Connected: Boolean;
    function GetSocket: IIPIOHandlerSocket;
    procedure SetIOHandler(Handler: IIPIOHandler);
    function GetIOHandler: IIPIOHandler;
    function GetBoundIP: string;
    procedure SetBoundIP(IP: string);
    function GetHost: string;
    procedure SetHost(LHost: string);
    function GetPort: TIPPortPeer;
    procedure SetPort(LPort: TIPPortPeer);
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    procedure Connect;
    procedure Disconnect;
    function GetManagedIOHandler: Boolean;
    procedure SetManagedIOHandler(AManagedIOHandler: Boolean);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

  TIdIOHandlerPeer = class(TInterfacedObject, IIPIOHandler)
  private
    FHandler: TIdIOHandler;
  protected
    procedure Close;
    function ReadByte: Byte;
    function GetInputBuffer: IIPBuffer;
    procedure ReadBytes(var VBuffer: TIPBytesPeer; AByteCount: Integer; AAppend: Boolean = True);
    procedure Write(const ABuffer: TIPBytesPeer; const ALength: Integer = -1; const AOffset: Integer = 0);
    function CheckForDataOnSource(ATimeout: Integer = 0): Boolean;
    function Connected: Boolean;
//    property GetOnStatus: TIPStatusEvent read 
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Handler: TIdIOHandler);
  end;

function IPImpId: string;

implementation

uses
  IdStackConsts;

type
  TIPTestServerPeer = class(TInterfacedObject, IIPTestServer)
  private type
    // Provide access to protected members
    TMimeTable = class(TIdMimeTable)
    end;
    TOnGetPassword = class
      FPassword: AnsiString;
      procedure OnGetPassword(var APassword: AnsiString);
      constructor Create(const APassword: AnsiString);
    end;
  protected
    function GetOpenPort: Integer;
    procedure TestOpenPort(const APort: Integer; const AOnExecute: TIPServerThreadEventPeer);
    procedure TestCertificateFiles
      (const APort: Integer; const ACertFileName, AKeyFileName, ARootCertFile: string;
      const AKeyFilePassword: AnsiString);
    procedure GetExtensionMimeType(const ADictionary: TDictionary<string,string>);
  End;

  TIdTCPClientPeerIP = class(TIdClassIP, IIPTCPClient, IIPObject)
  private
    FTCPClient: TIdTCPClientIP;
    FIOHandler: IIPIOHandler;
    FSocket: IIPIOHandlerSocket;
  protected
    function Connected: Boolean;
    function GetSocket: IIPIOHandlerSocket;
    procedure SetIOHandler(Handler: IIPIOHandler);
    function GetIOHandler: IIPIOHandler;
    function GetBoundIP: string;
    procedure SetBoundIP(IP: string);
    function GetHost: string;
    procedure SetHost(LHost: string);
    function GetPort: TIPPortPeer;
    procedure SetPort(LPort: TIPPortPeer);
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    procedure Connect;
    procedure Disconnect;
    function GetManagedIOHandler: Boolean;
    procedure SetManagedIOHandler(AManagedIOHandler: Boolean);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

  TIdStackPeer = class(TInterfacedObject, IIPStack, IIPObject)
  protected
    procedure SetKeepAliveValues(ASocket: TIPStackSocketHandlePeer;
      const AEnabled: Boolean; const ATimeMS, AInterval: Integer);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
  end;

  TIdTCPConnectionPeer = class(TInterfacedObject, IIPTCPConnection, IIPObject)
  private
    FConnection: TIdTCPConnection;
    FIOHandler: IIPIOHandler;
    FSocket: IIPIOHandlerSocket;
  protected
    function Connected: Boolean;
    function GetIOHandler: IIPIOHandler;
    procedure SetIOHandler(Handler: IIPIOHandler);
    procedure Disconnect;
    function GetSocket: IIPIOHandlerSocket;
    function GetManagedIOHandler: Boolean;
    procedure SetManagedIOHandler(AManagedIOHandler: Boolean);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Connection: TIdTCPConnection);
    destructor Destroy; override;
  end;

  TIdURIPeer = class(TInterfacedObject, IIPURI, IIPObject)
  private
    FURI: TIdURI;
  protected
    function URLEncode(const ASrc: string; AByteEncoding: TIPTextEncodingPeer = nil): string;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(URI: TIdURI);
  end;

  TIdAuthenticationPeer = class(TInterfacedObject, IIPAuthentication, IIPObject)
  private
    FAuth: TIdAuthentication;
  protected
    function GetUserName: string;
    procedure SetUsername(user: string);
    function GetPassword: string;
    procedure SetPassword(pass: string);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Auth: TIdAuthentication);
  end;

  TIdSSLOptionsPeer = class(TInterfacedObject, IIPSSLOptions, IIPObject)
  private
    FOptions: TIdSSLOptions;
  protected
    function GetVerifyMode: TIPSSLVerifyModeSetPeer;
    procedure SetVerifyMode(mode: TIPSSLVerifyModeSetPeer);
    function GetCertFile: string;
    procedure SetCertFile(ctfile: string);
    function GetKeyFile: string;
    procedure SetKeyFile(kfile: string);
    function GetRootCertFile: string;
    procedure SetRootCertFile(rootfile: string);
    function GetMode: TIPSSLModePeer;
    procedure SetMode(mode: TIPSSLModePeer);
    function GetMethod: TIPSSLVersionPeer;
    procedure SetMethod(method: TIPSSLVersionPeer);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Options: TIdSSLOptions);
  end;

  TIdX509NamePeer = class(TInterfacedObject, IIPX509Name, IIPObject)
  private
    FName: TIdX509Name;
  protected
    function GetHash: TIPSSLULong;
    function GetOneLine: string;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Name: TIdX509Name);
  end;

  TIdX509SigInfoPeer = class(TInterfacedObject, IIPX509SigInfo, IIPObject)
  private
    FSigInfo: TIdX509SigInfo;
  protected
    function GetSigTypeAsString: string;
    function GetSignature: string;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(SigInfo: TIdX509SigInfo);
  end;

  TIdBufferPeer = class(TInterfacedObject, IIPBuffer, IIPObject)
  private
    FBuffer: TIdBuffer;
  protected
    function GetSize: Integer;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Buffer: TIdBuffer);
  end;

  TIdSocketHandlePeer = class(TInterfacedObject, IIPSocketHandle, IIPObject)
  private
    FHandle: TIdSocketHandle;
  protected
    function GetPort: TIPPortPeer;
    procedure SetPort(APort: TIPPortPeer);
    function GetHandle: TIPStackSocketHandlePeer;
    function GetPeerIP: string;
    function GetPeerPort: TIPPortPeer;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Handle: TIdSocketHandle);
  end;

  TIdSocketHandlesPeer = class(TInterfacedObject, IIPSocketHandles, IIPObject)
  private
    FHandles: TIdSocketHandles;
  protected
    function Add: IIPSocketHandle;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Handles: TIdSocketHandles);
  end;

  TIdIOHandlerPeerIP = class(TInterfacedObject, IIPIOHandler, IIPObject)
  private
    FHandler: TIdIOHandler;
    FBuffer: IIPBuffer;
  protected
    procedure Close;
    function ReadByte: Byte;
    function GetInputBuffer: IIPBuffer;
    procedure ReadBytes(var VBuffer: TIPBytesPeer; AByteCount: Integer; AAppend: Boolean = True);
    procedure Write(const ABuffer: TIPBytesPeer; const ALength: Integer = -1; const AOffset: Integer = 0);
    function CheckForDataOnSource(ATimeout: Integer = 0): Boolean;
    function Connected: Boolean;
//    property GetOnStatus: TIPStatusEvent read
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Handler: TIdIOHandler);
  end;

  TIdIOHandlerSocketPeer = class(TIdIOHandlerPeerIP, IIPIOHandlerSocket, IIPObject)
  private
    FHandler: TIdIOHandlerSocket;
    FBinding: IIPSocketHandle;
  protected
    function GetBinding: IIPSocketHandle;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Handler: TIdIOHandlerSocket);
  end;

  TIdSSLIOHandlerSocketOpenSSLIP = class(TIdSSLIOHandlerSocketOpenSSL)
  private
    FSetDestroyedProc: TProc;
  protected
    destructor Destroy; override;
  end;
  TIdSSLIOHandlerSocketOpenSSLPeer = class(TIdIOHandlerSocketPeer, IIPSSLIOHandlerSocketOpenSSL, IIPSSLIOHandlerSocketBase, IIPObject)
  { TIdClassIP }
  private
    FIsFreed: Boolean;
    procedure SetDestroyed;
    function NeedToFree: Boolean;
  public
    procedure AfterConstruction; override;
  { TIdClassIP End }
  private
    FHandler: TIdSSLIOHandlerSocketOpenSSL;
    FSSLOptions: IIPSSLOptions;
    FOnVerifyPeer: TVerifyPeerEventPeer;
    FIdX509Peer: IIPX509;
    function LOnVerifyPeerEvent(Certificate: TIdX509; AOk: Boolean; ADepth, AError: Integer): Boolean;
  protected
    function GetOnVerifyPeer: TVerifyPeerEventPeer;
    procedure SetOnVerifyPeer(OnVerify: TVerifyPeerEventPeer);
    function GetSSLOptions: IIPSSLOptions;
    procedure SetSSLOptions(options: IIPSSLOptions);
    function GetPassThrough: Boolean;
    procedure SetPassThrough(pass: Boolean);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent); overload;
    constructor Create(AIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL); overload;
    destructor Destroy; override;
  end;

  TIdHeaderListPeer = class(TInterfacedObject, IIPHeaderList, IIPObject)
  private
    FList: TIdHeaderList;
  protected
    function GetFoldLines: Boolean;
    procedure SetFoldLines(Val: Boolean);
    function GetValue(const Name: string): string;
    procedure SetValue(const Name: string; Val: string);
    function Add(const S: string): Integer;
    function IndexOfName(const AName: string): Integer;
    function GetCount: Integer;
    function GetName(Index: Integer): string;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    procedure Clear;
    procedure AddValue(const AName, AValue: string);
    constructor Create(HeaderList: TIdHeaderList);
  end;

  TIdEntityHeaderInfoPeer = class(TInterfacedObject, IIPEntityHeaderInfo, IIPObject)
  private
    FInfo: TIdEntityHeaderInfo;
    FRawHeaders, FCustomHeaders: IIPHeaderList;
  protected
    function GetContentType: string;
    procedure SetContentType(LContentType: string);
    function GetContentLanguage: string;
    procedure SetContentLanguage(LContentLanguage: string);
    function GetContentEncoding: string;
    procedure SetContentEncoding(LContentEncoding: string);
    function GetContentRangeEnd: Int64;
    procedure SetContentRangeEnd(LContentRangeEnd: Int64);
    function GetContentRangeStart: Int64;
    procedure SetContentRangeStart(LContentRangeStart: Int64);
    function GetContentVersion: string;
    procedure SetContentVersion(LContentVersion: string);
    function GetContentLength: Int64;
    procedure SetContentLength(LContentLength: Int64);
    function GetCustomHeaders: IIPHeaderList;
    function GetConnection: string;
    procedure SetConnection(conn: string);
    function GetPragma: string;
    procedure SetPragma(Val: string);
    function GetRawHeaders: IIPHeaderList;
    function GetCharSet: string;
    procedure SetCharSet(Val: string);
    function GetLastModified: TDateTime;
    procedure SetLastModified(dt: TDateTime);
    function GetDate: TDateTime;
    procedure SetDate(LDate: TDateTime);
    function GetETag: string;
    procedure SetETag(LETag: string);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Info: TIdEntityHeaderInfo);
  end;

  TIdHTTPSessionPeer = class(TInterfacedObject, IIPHTTPSession, IIPObject)
  private
    FSession: TIdHTTPSession;
  protected
    function GetSessionID: string;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(ASession: TIdHTTPSession);
  end;

  TIdHTTPRequestPeer = class(TIdEntityHeaderInfoPeer, IIPHTTPRequest, IIPObject)
  private
    FRequest: TIdHTTPRequest;
    FAuthentication: IIPAuthentication;
  protected
    function GetAuthentication: IIPAuthentication;
    procedure SetAuthentication(auth: IIPAuthentication);
    function GetAccept: string;
    procedure SetAccept(Val: string);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(IndyHTTPRequest: TIdHTTPRequest);
    destructor Destroy; override;
  end;

  TIdHTTPResponsePeer = class(TIdEntityHeaderInfoPeer, IIPHTTPResponse, IIPObject)
  private
    FResponse: TIdHTTPResponse;
  protected
    function GetResponseText: string;
    procedure SetResponseText(LResponseText: string);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(IndyHTTPResponse: TIdHTTPResponse);
  end;

  TIdProxyConnectionInfoPeer = class(TInterfacedObject, IIPProxyConnectionInfo, IIPObject)
  private
    FProxyInfo: TIdProxyConnectionInfo;
  protected
    function GetProxyServer: string;
    procedure SetProxyServer(Val: string);
    function GetProxyPort: Integer;
    procedure SetProxyPort(Val: Integer);
    function GetProxyUserName: string;
    procedure SetProxyUserName(user: string);
    function GetProxyPassword: string;
    procedure SetProxyPassword(pass: string);
    function GetBasicAuthentication: Boolean;
    procedure SetBasicAuthentication(Val: Boolean);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(ProxyInfo: TIdProxyConnectionInfo);
  end;

  TIdHTTPIP = class(TIdHTTP)
  private
    FSetDestroyedProc: TProc;
    FProtocol: string;
  protected
    ///  <summary> Initializes the component, setting several HTTP related properties. </summary>
    procedure InitComponent; override;
    destructor Destroy; override;
  end;

  TIdHTTPPeer = class(TIdClassIP, IIPHTTP, IIPObject)
  private
    FHTTP: TIdHTTPIP;
    FIOHandler: IIPIOHandler;
    FRequest: IIPHTTPRequest;
    FResponse: IIPHTTPResponse;
    FProxyConnInfo: IIPProxyConnectionInfo;
    FSocket: IIPIOHandlerSocket;
    FURL: IIPURI;
  protected
    function Connected: Boolean;
    procedure Disconnect;
    procedure SetProtocol(Protocol: string);
    function GetProtocol: string;
    function GetResponseCode: Integer;
    function GetResponseText: string;
    function GetResponse: IIPHttpResponse;
    function GetRequest: IIPHTTPRequest;
    function GetIOHandler: IIPIOHandler;
    procedure SetIOHandler(Handler: IIPIOHandler);
    function GetProxyParams: IIPProxyConnectionInfo;
    procedure SetProxyParams(const Value: IIPProxyConnectionInfo);
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    function GetHTTPOptions: TIPHTTPOptionsPeer;
    procedure SetHTTPOptions(Options: TIPHTTPOptionsPeer);
    procedure DoRequestMethod(AMethod: string; URL: string; Source, ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
    procedure DoRequestHead(URL: string; Source, ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
    procedure DoRequestDelete(URL: string; Source, ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
    function DoGet(AURL: string): string; overload;
    function DoGet(AURL: string; AResponseContent: TStream): string; overload;
    function DoPost(AURL: string; Source: TStream): string; overload;
    function DoPost(AURL: string; Source: TStrings): string; overload;
    procedure DoPost(AURL: string; ASource, AResponseContent: TStream); overload;
    function DoPut(AURL: string; Source: TStream): string; overload;
    procedure DoPut(AURL: string; ASource, AResponseContent: TStream); overload;
    function GetConnectTimeout: Integer;
    procedure SetConnectTimeout(timeout: Integer);
    function GetReadTimeout: Integer;
    procedure SetReadTimeout(timeout: Integer);
    function GetURL: IIPURI;
    function GetSocket: IIPIOHandlerSocket;
    function GetManagedIOHandler: Boolean;
    procedure SetManagedIOHandler(AManagedIOHandler: Boolean);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure FreeIOHandler;
  end;

  TIdX509IP = class(TIdX509)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;
  TIdX509Peer = class(TIdClassIP, IIPX509, IIPObject)
  private
    FObj: TIdX509IP;
    FIssuer: IIPX509Name;
    FSigInfo: IIPX509SigInfo;
    FSubject: IIPX509Name;
  protected
    function GetNotAfter: TDateTime;
    function GetNotBefore: TDateTime;
    function GetIssuer: IIPX509Name;
    function GetSubject: IIPX509Name;
    function GetSerialNumber: string;
    function GetSigInfo: IIPX509SigInfo;
    function GetVersion: TIPC_LONG;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(aX509: PX509Peer; aCanFreeX509: Boolean = True);
    destructor Destroy; override;
  end;

  TIdBasicAuthenticationIP = class(TIdBasicAuthentication)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;
  TIdBasicAuthenticationPeer = class(TIdClassIP, IIPBasicAuthentication, IIPObject)
  private
    FObj: TIdBasicAuthenticationIP;
  protected
    function GetUserName: string;
    procedure SetUsername(user: string);
    function GetPassword: string;
    procedure SetPassword(pass: string);
  public
    constructor Create;
    destructor Destroy; override;
    function GetObject: TObject;
    function GetIPImplementationID: string;
  end;

  { server specific peers }

  TIdHTTPRequestInfoPeer = class(TIdEntityHeaderInfoPeer, IIPHTTPRequestInfo, IIPObject)
  private
    FInfo: TIdHTTPRequestInfo;
    FSession: IIPHTTPSession;
  protected
    function GetSession: IIPHTTPSession;
    function GetAccept: string;
    procedure SetAccept(Val: string);
    function GetUserAgent: string;
    procedure SetUserAgent(agent: string);
    function GetAuthPassword: string;
    function GetAuthUsername: string;
    function GetCommand: string;
    function GetCommandType: THTTPCommandTypePeer;
    function GetDocument: string;
    procedure SetDocument(doc: string);
    function GetParams: TStrings;
    function GetPostStream: TStream;
    procedure SetPostStream(ps: TStream);
    function GetRemoteIP: string;
    function GetURI: string;
    function GetVersion: string;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Info: TIdHTTPRequestInfo);
  end;

  TIdHTTPResponseInfoPeer = class(TIdEntityHeaderInfoPeer, IIPHTTPResponseInfo, IIPObject)
  private
    FInfo: TIdHTTPResponseInfo;
    FWWWAuth: IIPHeaderList;
  protected
    function GetWWWAuthenticate: IIPHeaderList;
    procedure SetWWWAuthenticate(wwwAuth: IIPHeaderList);
    function GetAuthRealm: string;
    procedure SetAuthRealm(realm: string);
    function GetCloseConnection: Boolean;
    procedure SetCloseConnection(closeConn: Boolean);
    function GetContentStream: TStream;
    procedure SetContentStream(content: TStream);
    function GetContentText: string;
    procedure SetContentText(text: string);
    function GetFreeContentStream: Boolean;
    procedure SetFreeContentStream(Val: Boolean);
    function GetResponseNo: Integer;
    procedure SetResponseNo(Num: Integer);
    function GetResponseText: string;
    procedure SetResponseText(text: string);
    function GetHeaderHasBeenWritten: Boolean;
    procedure SetHeaderHasBeenWritten(Val: Boolean);
    procedure WriteHeader;
    procedure WriteContent;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Info: TIdHTTPResponseInfo);
    destructor Destroy; override;
  end;

  TIdContextPeer = class(TInterfacedObject, IIPContext, IIPObject)
  private
    FContext: TIdContext;
    FConnection: IIPTCPConnection;
  protected
    function GetConnection: IIPTCPConnection;
    function GetData: TObject;
    procedure SetData(obj: TObject);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Context: TIdContext);
    destructor Destroy; override;
  end;

  TIdSchedulerPeer = class(TInterfacedObject, IIPScheduler, IIPObject)
  private
    FScheduler: TIdScheduler;
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(Scheduler: TIdScheduler);
  end;

  TIdServerIOHandlerSSLOpenSSLIP = class(TIdServerIOHandlerSSLOpenSSL)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;
  TIdServerIOHandlerSSLOpenSSLPeer = class(TIdClassIP, IIPServerIOHandlerSSLOpenSSL, IIPServerIOHandlerSSLBase, IIPServerIOHandler, IIPObject)
  private
    FServerIOHandlerSSL: TIdServerIOHandlerSSLOpenSSL;
    FOnGetPassEvent: TPasswordEventPeer;
    FSSLOptions: IIPSSLOptions;
    procedure LOnGetPassEvent(var Password: AnsiString);
  protected
    function GetSSLOptions: IIPSSLOptions;
    function GetOnGetPassword: TPasswordEventPeer;
    procedure SetOnGetPassword(event: TPasswordEventPeer);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent); overload;
    constructor Create(AIdServerIOHandlerSSLOpenSSL: TIdServerIOHandlerSSLOpenSSL); overload;
    destructor Destroy; override;
  end;

  TIdTCPServerIP = class(TIdTCPServer)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;
  TIdTCPServerPeer = class(TIdClassIP, IIPTCPServer, IIPObject)
  private
    FTCPServer: TIdTCPServerIP;
    FScheduler: IIPScheduler;
    FSocketHandles: IIPSocketHandles;
    FServerIOHandler: IIPServerIOHandler;
    FContexts: TDictionary<TIdContext, IIPContext>;
    FOnConnectEvent: TIPServerThreadEventPeer;
    FOnDisconnectEvent: TIPServerThreadEventPeer;
    FOnExecuteEvent: TIPServerThreadEventPeer;
    procedure LOnConnectEvent(AContext: TIdContext);
    procedure LOnDisconnectEvent(AContext: TIdContext);
    procedure LOnExecuteEvent(AContext: TIdContext);
  protected
    function GetActive: Boolean;
    procedure SetActive(Val: Boolean);
    function GetDefaultPort: TIPPortPeer;
    procedure SetDefaultPort(port: TIPPortPeer);
    function GetIOHandler: IIPServerIOHandler;
    procedure SetIOHandler(handler: IIPServerIOHandler);
    function GetOnConnect: TIPServerThreadEventPeer;
    procedure SetOnConnect(event: TIPServerThreadEventPeer);
    function GetOnDisconnect: TIPServerThreadEventPeer;
    procedure SetOnDisconnect(event: TIPServerThreadEventPeer);
    function GetOnExecute: TIPServerThreadEventPeer;
    procedure SetOnExecute(event: TIPServerThreadEventPeer);
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    function GetBindings: IIPSocketHandles;
    procedure SetBindings(ABindings: IIPSocketHandles);
    function GetScheduler: IIPScheduler;
    procedure SetScheduler(AScheduler: IIPScheduler);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

  //so that we can use OnExecute
  TIdHTTPServerIP = class(TIdHTTPServer)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;

  TIdHTTPServerPeer = class(TIdClassIP, IIPHTTPServer, IIPObject)
  private
    FHTTPServer: TIdHTTPServerIP;
    FContexts: TDictionary<TIdContext, IIPContext>;
    FSocketHandles: IIPSocketHandles;
    FServerIOHandler: IIPServerIOHandler;
    FScheduler: IIPScheduler;
    FOnConnectEvent: TIPServerThreadEventPeer;
    FOnCommandGet: TIPHTTPCommandEventPeer;
    FOnCommandOther: TIPHTTPCommandEventPeer;
    FOnDisconnectEvent: TIPServerThreadEventPeer;
    FOnExecuteEvent: TIPServerThreadEventPeer;
    procedure LOnConnectEvent(AContext: TIdContext);
    procedure LOnDisconnectEvent(AContext: TIdContext);
    procedure LOnExecuteEvent(AContext: TIdContext);
    procedure LOnCommandGetEvent(AContext: TIdContext;
    ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure LOnCommandOtherEvent(AContext: TIdContext;
    ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  protected
    function GetActive: Boolean;
    procedure SetActive(Val: Boolean);
    function GetDefaultPort: TIPPortPeer;
    procedure SetDefaultPort(port: TIPPortPeer);
    function GetIOHandler: IIPServerIOHandler;
    procedure SetIOHandler(handler: IIPServerIOHandler);
    function GetOnConnect: TIPServerThreadEventPeer;
    procedure SetOnConnect(event: TIPServerThreadEventPeer);
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    function GetKeepAlive: Boolean;
    procedure SetKeepAlive(keep: Boolean);
    function GetServerSoftware: string;
    procedure SetServerSoftware(software: string);
    function GetOnCommandGet: TIPHTTPCommandEventPeer;
    procedure SetOnCommandGet(commandGet: TIPHTTPCommandEventPeer);
    function GetOnCommandOther: TIPHTTPCommandEventPeer;
    procedure SetOnCommandOther(commandOther: TIPHTTPCommandEventPeer);
    function GetOnDisconnect: TIPServerThreadEventPeer;
    procedure SetOnDisconnect(event: TIPServerThreadEventPeer);
    function GetOnExecute: TIPServerThreadEventPeer;
    procedure SetOnExecute(event: TIPServerThreadEventPeer);
    function GetBindings: IIPSocketHandles;
    procedure SetBindings(ABindings: IIPSocketHandles);
    function GetScheduler: IIPScheduler;
    procedure SetScheduler(AScheduler: IIPScheduler);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

  TIdSchedulerOfThreadPoolIP = class(TIdSchedulerOfThreadPool)
  private
    FSetDestroyedProc: TProc;
  public
    destructor Destroy; override;
  end;
  TIdSchedulerOfThreadPoolPeer = class(TIdClassIP, IIPSchedulerOfThreadPool, IIPObject)
  private
    FSchedulerOfThreadPool: TIdSchedulerOfThreadPoolIP;
  protected
    function GetPoolSize: Integer;
    procedure SetPoolSize(APoolSize: Integer);
    function GetMaxThreads: Integer;
    procedure SetMaxThreads(AMaxThreads: Integer);
  public
    function GetObject: TObject;
    function GetIPImplementationID: string;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  end;

  { end of server specific peers }

{ TIdHTTPIP }

destructor TIdHTTPIP.Destroy;
begin
  //Let Peer know that object is destroyed
  FSetDestroyedProc();
  inherited;
end;

procedure TIdHTTPIP.InitComponent;
begin
  inherited;
  FProtocol := 'http';

  HandleRedirects := True;
end;

{ TIdHTTPPeer }

procedure TIdHTTPPeer.DoRequestMethod(AMethod, URL: string; Source,
  ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
begin
  try
    FHTTP.DoRequest(AMethod, URL, Source, ResponseContent, AIgnoreReplies);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

procedure TIdHTTPPeer.DoRequestDelete(URL: string; Source,
  ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
begin
  try
    FHTTP.DoRequest(Id_HTTPMethodDelete, URL, Source, ResponseContent, AIgnoreReplies);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

procedure TIdHTTPPeer.DoRequestHead(URL: string; Source,
  ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
begin
  try
    FHTTP.DoRequest(Id_HTTPMethodHead, URL, Source, ResponseContent, AIgnoreReplies);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

procedure TIdHTTPPeer.FreeIOHandler;
begin
  if Assigned(FHTTP.FIOHandler) then
    FreeAndNil(FHTTP.FIOHandler);
  FIOHandler := nil;
end;

function TIdHTTPPeer.DoGet(AURL: string): string;
begin
  try
    Result := FHTTP.Get(AURL);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

function TIdHTTPPeer.Connected: Boolean;
begin
  Result := FHTTP.Connected
end;

constructor TIdHTTPPeer.Create(AOwner: TComponent);
begin
  FIOHandler := nil;
  FRequest := nil;
  FResponse := nil;
  FProxyConnInfo := nil;
  FSocket := nil;
  FURL := nil;
  FHTTP := TIdHTTPIP.Create(AOwner);
  FHTTP.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdHTTPPeer.Destroy;
begin
  //Clear interface references (TODO: check order of nil'ing)
  FIOHandler := nil;
  FProxyConnInfo := nil;

  if NeedToFree then
    FHTTP.Free;
  inherited;
end;

procedure TIdHTTPPeer.Disconnect;
begin
  FHTTP.Disconnect;
end;

function TIdHTTPPeer.DoGet(AURL: string; AResponseContent: TStream): string;
begin
  try
    FHTTP.Get(AURL, AResponseContent);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

function TIdHTTPPeer.DoPost(AURL: string; Source: TStream): string;
begin
  try
    Result := FHTTP.Post(AURL, Source)
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

function TIdHTTPPeer.DoPost(AURL: string; Source: TStrings): string;
begin
  try
    Result := FHTTP.Post(AURL, Source)
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

procedure TIdHTTPPeer.DoPost(AURL: string; ASource, AResponseContent: TStream);
begin
  try
    FHTTP.Post(AURL, ASource, AResponseContent)
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

procedure TIdHTTPPeer.DoPut(AURL: string; ASource, AResponseContent: TStream);
begin
  try
    FHTTP.Put(AURL, ASource, AResponseContent);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

function TIdHTTPPeer.DoPut(AURL: string; Source: TStream): string;
begin
  try
    Result := FHTTP.Put(AURL, Source);
  except
    on E: EIdHTTPProtocolException do
      raise EIPHTTPProtocolExceptionPeer.Create(E, E.ErrorMessage, E.Message, E.ErrorCode)
  end;
end;

function TIdHTTPPeer.GetConnectTimeout: Integer;
begin
  Result := FHTTP.ConnectTimeout;
end;

function TIdHTTPPeer.GetHTTPOptions: TIPHTTPOptionsPeer;
begin
  if TIdHTTPOption.hoInProcessAuth in FHTTP.HTTPOptions then
    Result := Result + [TIPHTTPOptionPeer.hoInProcessAuth];
  if TIdHTTPOption.hoKeepOrigProtocol in FHTTP.HTTPOptions then
    Result := Result + [TIPHTTPOptionPeer.hoKeepOrigProtocol];
  if TIdHTTPOption.hoForceEncodeParams in FHTTP.HTTPOptions then
    Result := Result + [TIPHTTPOptionPeer.hoForceEncodeParams];
  if TIdHTTPOption.hoNonSSLProxyUseConnectVerb in FHTTP.HTTPOptions then
    Result := Result + [TIPHTTPOptionPeer.hoNonSSLProxyUseConnectVerb];
  if TIdHTTPOption.hoNoParseMetaHTTPEquiv in FHTTP.HTTPOptions then
    Result := Result + [TIPHTTPOptionPeer.hoNoParseMetaHTTPEquiv];
  if TIdHTTPOption.hoWaitForUnexpectedData in FHTTP.HTTPOptions then
    Result := Result + [TIPHTTPOptionPeer.hoWaitForUnexpectedData];
end;

function TIdHTTPPeer.GetIOHandler: IIPIOHandler;
begin
  if FHTTP.IOHandler = nil then
    Result := nil
  else if Assigned(FIOHandler) and (FIOHandler.GetObject = FHTTP.IOHandler) then
   Result := FIOHandler
  else
  begin
    if FHTTP.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
      Result := TIdSSLIOHandlerSocketOpenSSLPeer.Create(FHTTP.IOHandler as TIdSSLIOHandlerSocketOpenSSL)
    else if FHTTP.IOHandler is TIdIOHandlerSocket then
      Result := TIdIOHandlerSocketPeer.Create(FHTTP.IOHandler as TIdIOHandlerSocket)
    else
      Result := TIdIOHandlerPeerIP.Create(FHTTP.IOHandler);
    FIOHandler := Result;
  end;
end;

function TIdHTTPPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPPeer.GetObject: TObject;
begin
  Result := FHTTP;
end;

function TIdHTTPPeer.GetProtocol: string;
begin
  Result := FHTTP.FProtocol;
end;

function TIdHTTPPeer.GetProxyParams: IIPProxyConnectionInfo;
begin
  if FHTTP.ProxyParams = nil then
    Result := nil
  else if Assigned(FProxyConnInfo) and (FProxyConnInfo.GetObject = FHTTP.ProxyParams) then
    Result := FProxyConnInfo
  else
  begin
    Result := TIdProxyConnectionInfoPeer.Create(FHTTP.ProxyParams);
    FProxyConnInfo := Result;
  end;
end;

procedure TIdHTTPPeer.SetConnectTimeout(timeout: Integer);
begin
  FHTTP.ConnectTimeout := timeout;
end;

procedure TIdHTTPPeer.SetHTTPOptions(Options: TIPHTTPOptionsPeer);
begin
  if TIPHTTPOptionPeer.hoInProcessAuth in Options then
    FHTTP.HTTPOptions := FHTTP.HTTPOptions + [TIdHTTPOption.hoInProcessAuth];
  if TIPHTTPOptionPeer.hoKeepOrigProtocol in Options then
    FHTTP.HTTPOptions := FHTTP.HTTPOptions + [TIdHTTPOption.hoKeepOrigProtocol];
  if TIPHTTPOptionPeer.hoForceEncodeParams in Options then
    FHTTP.HTTPOptions := FHTTP.HTTPOptions + [TIdHTTPOption.hoForceEncodeParams];
  if TIPHTTPOptionPeer.hoNonSSLProxyUseConnectVerb in Options then
    FHTTP.HTTPOptions := FHTTP.HTTPOptions + [TIdHTTPOption.hoNonSSLProxyUseConnectVerb];
  if TIPHTTPOptionPeer.hoNoParseMetaHTTPEquiv in Options then
    FHTTP.HTTPOptions := FHTTP.HTTPOptions + [TIdHTTPOption.hoNoParseMetaHTTPEquiv];
  if TIPHTTPOptionPeer.hoWaitForUnexpectedData in Options then
    FHTTP.HTTPOptions := FHTTP.HTTPOptions + [TIdHTTPOption.hoWaitForUnexpectedData];
end;

procedure TIdHTTPPeer.SetIOHandler(Handler: IIPIOHandler);
begin
  FHTTP.IOHandler := Handler.GetObject as TIdIOHandler;
  FIOHandler := Handler;
end;

procedure TIdHTTPPeer.SetProtocol(Protocol: string);
begin
  FHTTP.FProtocol := Protocol;
end;

procedure TIdHTTPPeer.SetProxyParams(const Value: IIPProxyConnectionInfo);
begin
  FHTTP.ProxyParams := Value.GetObject as TIdProxyConnectionInfo;
  FProxyConnInfo := Value;
end;

procedure TIdHTTPPeer.SetReadTimeout(timeout: Integer);
begin
  FHTTP.ReadTimeout := timeout;
end;

procedure TIdHTTPPeer.SetUseNagle(Use: Boolean);
begin
  FHTTP.UseNagle := Use;
end;

procedure TIdHTTPPeer.SetManagedIOHandler(AManagedIOHandler: Boolean);
begin
  FHTTP.ManagedIOHandler := AManagedIOHandler;
end;

function TIdHTTPPeer.GetReadTimeout: Integer;
begin
  Result := FHTTP.ReadTimeout;
end;

function TIdHTTPPeer.GetRequest: IIPHTTPRequest;
begin
  if FHTTP.Request = nil then
    Result := nil
  else if Assigned(FRequest) and (FRequest.GetObject = FHTTP.Request) then
    Result := FRequest
  else
  begin
    Result := TIdHTTPRequestPeer.Create(FHTTP.Request);
    FRequest := Result;
  end;
end;

function TIdHTTPPeer.GetResponse: IIPHttpResponse;
begin
  if FHTTP.Response = nil then
    Result := nil
  else if Assigned(FResponse) and (FResponse.GetObject = FHTTP.Response) then
    Result := FResponse
  else
  begin
    Result := TIdHTTPResponsePeer.Create(FHTTP.Response);
    FResponse := Result;
  end;
end;

function TIdHTTPPeer.GetResponseCode: Integer;
begin
  Result := FHTTP.ResponseCode;
end;

function TIdHTTPPeer.GetResponseText: string;
begin
  Result := FHTTP.ResponseText;
end;

function TIdHTTPPeer.GetSocket: IIPIOHandlerSocket;
begin
  if FHTTP.Socket = nil then
    Result := nil
  else if Assigned(FSocket) and (FSocket.GetObject = FHTTP.Socket) then
    Result := FSocket
  else
  begin
    Result := TIdIOHandlerSocketPeer.Create(FHTTP.Socket);
    FSocket := Result;
  end;
end;

function TIdHTTPPeer.GetManagedIOHandler: Boolean;
begin
  Result := FHTTP.ManagedIOHandler;
end;

function TIdHTTPPeer.GetURL: IIPURI;
begin
  if FHTTP.URL = nil then
    Result := nil
  else if Assigned(FURL) and (FURL.GetObject = FHTTP.URL) then
    Result := FURL
  else
  begin
    Result := TIdURIPeer.Create(FHTTP.URL);
    FURL := Result;
  end;
end;

function TIdHTTPPeer.GetUseNagle: Boolean;
begin
  Result := FHTTP.UseNagle;
end;

//procedure TIdHTTPPeer.InitIOHandler;
//begin
//  IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
//end;

{ TIdHTTPResponsePeer }

constructor TIdHTTPResponsePeer.Create(IndyHTTPResponse: TIdHTTPResponse);
begin
  inherited Create(IndyHTTPResponse);
  FResponse := IndyHTTPResponse;
end;

function TIdHTTPResponsePeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPResponsePeer.GetObject: TObject;
begin
  Result := FResponse;
end;

function TIdHTTPResponsePeer.GetResponseText: string;
begin
  Result := FResponse.ResponseText;
end;

procedure TIdHTTPResponsePeer.SetResponseText(LResponseText: string);
begin
  FResponse.ResponseText := LResponseText;
end;

{ TIdHeaderList }

function TIdHeaderListPeer.Add(const S: string): Integer;
begin
  Result := FList.Add(S);
end;

procedure TIdHeaderListPeer.AddValue(const AName, AValue: string);
begin
  FList.AddValue(AName, AValue);
end;

procedure TIdHeaderListPeer.Clear;
begin
  FList.Clear;
end;

constructor TIdHeaderListPeer.Create(HeaderList: TIdHeaderList);
begin
  FList := HeaderList;
end;

function TIdHeaderListPeer.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TIdHeaderListPeer.GetFoldLines: Boolean;
begin
  Result := FList.FoldLines;
end;

function TIdHeaderListPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHeaderListPeer.GetName(Index: Integer): string;
begin
  Result := FList.Names[Index];
end;

function TIdHeaderListPeer.GetObject: TObject;
begin
  Result := FList;
end;

function TIdHeaderListPeer.GetValue(const Name: string): string;
begin
  Result := FList.Values[Name];
end;

function TIdHeaderListPeer.IndexOfName(const AName: string): Integer;
begin
  Result := FList.IndexOfName(AName);
end;

procedure TIdHeaderListPeer.SetFoldLines(Val: Boolean);
begin
  FList.FoldLines := Val;
end;

procedure TIdHeaderListPeer.SetValue(const Name: string; Val: string);
begin
  FList.Values[Name] := Val;
end;

{ TIdHTTPRequestPeer }

constructor TIdHTTPRequestPeer.Create(IndyHTTPRequest: TIdHTTPRequest);
begin
  inherited Create(IndyHTTPRequest);
  FAuthentication := nil;
  FRequest := IndyHTTPRequest;
end;

destructor TIdHTTPRequestPeer.Destroy;
begin
  FAuthentication := nil;
  inherited;
end;

function TIdHTTPRequestPeer.GetAccept: string;
begin
  Result := FRequest.Accept;
end;

function TIdHTTPRequestPeer.GetAuthentication: IIPAuthentication;
begin
  if FRequest.Authentication = nil then
    Result := nil
  else if Assigned(FAuthentication) and (FAuthentication.GetObject = FRequest.Authentication) then
    Result := FAuthentication
  else
  begin
    Result := TIdAuthenticationPeer.Create(FRequest.Authentication);
    FAuthentication := Result;
  end;
end;

function TIdHTTPRequestPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPRequestPeer.GetObject: TObject;
begin
  Result := FRequest;
end;

procedure TIdHTTPRequestPeer.SetAccept(Val: string);
begin
  FRequest.Accept := Val;
end;

procedure TIdHTTPRequestPeer.SetAuthentication(auth: IIPAuthentication);
begin
  FRequest.Authentication := auth.GetObject as TIdAuthentication;
  FAuthentication := auth;
end;

{ TIdEntityHeaderInfoPeer }

function TIdEntityHeaderInfoPeer.GetRawHeaders: IIPHeaderList;
begin
  if FInfo.RawHeaders = nil then
    Result := nil
  else if Assigned(FRawHeaders) and (FRawHeaders.GetObject = FInfo.RawHeaders) then
    Result := FRawHeaders
  else
  begin
    Result := TIdHeaderListPeer.Create(FInfo.RawHeaders);
    FRawHeaders := Result;
  end;
end;

function TIdEntityHeaderInfoPeer.GetCustomHeaders: IIPHeaderList;
begin
  if FInfo.CustomHeaders = nil then
    Result := nil
  else if Assigned(FCustomHeaders) and (FCustomHeaders.GetObject = FInfo.CustomHeaders) then
    Result := FCustomHeaders
  else
  begin
    Result := TIdHeaderListPeer.Create(FInfo.CustomHeaders);
    FCustomHeaders := Result;
  end;
end;

function TIdEntityHeaderInfoPeer.GetDate: TDateTime;
begin
  Result := FInfo.Date;
end;

function TIdEntityHeaderInfoPeer.GetETag: string;
begin
  Result := FInfo.ETag;
end;

function TIdEntityHeaderInfoPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdEntityHeaderInfoPeer.GetLastModified: TDateTime;
begin
  Result := FInfo.LastModified;
end;

function TIdEntityHeaderInfoPeer.GetObject: TObject;
begin
  Result := FInfo;
end;

constructor TIdEntityHeaderInfoPeer.Create(Info: TIdEntityHeaderInfo);
begin
  FRawHeaders := nil;
  FCustomHeaders := nil;
  FInfo := Info;
end;

function TIdEntityHeaderInfoPeer.GetCharSet: string;
begin
  Result := FInfo.CharSet;
end;

function TIdEntityHeaderInfoPeer.GetConnection: string;
begin
  Result := FInfo.Connection;
end;

function TIdEntityHeaderInfoPeer.GetContentEncoding: string;
begin
  Result := FInfo.ContentEncoding;
end;

function TIdEntityHeaderInfoPeer.GetContentLanguage: string;
begin
  Result := FInfo.ContentLanguage;
end;

function TIdEntityHeaderInfoPeer.GetContentLength: Int64;
begin
  Result := FInfo.ContentLength;
end;

function TIdEntityHeaderInfoPeer.GetContentRangeEnd: Int64;
begin
  Result := FInfo.ContentRangeEnd;
end;

function TIdEntityHeaderInfoPeer.GetContentRangeStart: Int64;
begin
  Result := FInfo.ContentRangeStart;
end;

function TIdEntityHeaderInfoPeer.GetContentType: string;
begin
  Result := FInfo.ContentType;
end;

function TIdEntityHeaderInfoPeer.GetContentVersion: string;
begin
  Result := FInfo.ContentVersion;
end;

function TIdEntityHeaderInfoPeer.GetPragma: string;
begin
  Result := FInfo.Pragma;
end;

procedure TIdEntityHeaderInfoPeer.SetCharSet(Val: string);
begin
  FInfo.CharSet := Val;
end;

procedure TIdEntityHeaderInfoPeer.SetConnection(conn: string);
begin
  FInfo.Connection := conn;
end;

procedure TIdEntityHeaderInfoPeer.SetContentEncoding(LContentEncoding: string);
begin
  FInfo.ContentEncoding := LContentEncoding;
end;

procedure TIdEntityHeaderInfoPeer.SetContentLanguage(LContentLanguage: string);
begin
  FInfo.ContentLanguage := LContentLanguage;
end;

procedure TIdEntityHeaderInfoPeer.SetContentLength(LContentLength: Int64);
begin
  FInfo.ContentLength := LContentLength;
end;

procedure TIdEntityHeaderInfoPeer.SetContentRangeEnd(LContentRangeEnd: Int64);
begin
  FInfo.ContentRangeEnd := LContentRangeEnd;
end;

procedure TIdEntityHeaderInfoPeer.SetContentRangeStart(
  LContentRangeStart: Int64);
begin
  FInfo.ContentRangeStart := LContentRangeStart;
end;

procedure TIdEntityHeaderInfoPeer.SetContentType(LContentType: string);
begin
  FInfo.ContentType := LContentType;
end;

procedure TIdEntityHeaderInfoPeer.SetContentVersion(LContentVersion: string);
begin
  FInfo.ContentVersion := LContentVersion;
end;

procedure TIdEntityHeaderInfoPeer.SetDate(LDate: TDateTime);
begin
  FInfo.Date := LDate;
end;

procedure TIdEntityHeaderInfoPeer.SetETag(LETag: string);
begin
  FInfo.ETag := LETag;
end;

procedure TIdEntityHeaderInfoPeer.SetLastModified(dt: TDateTime);
begin
  FInfo.LastModified := dt;
end;

procedure TIdEntityHeaderInfoPeer.SetPragma(Val: string);
begin
  FInfo.Pragma := Val;
end;

{ TIdProxyConnectionInfoPeer }

constructor TIdProxyConnectionInfoPeer.Create(
  ProxyInfo: TIdProxyConnectionInfo);
begin
  FProxyInfo := ProxyInfo;
end;

function TIdProxyConnectionInfoPeer.GetBasicAuthentication: Boolean;
begin
  Result := FProxyInfo.BasicAuthentication;
end;

function TIdProxyConnectionInfoPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdProxyConnectionInfoPeer.GetObject: TObject;
begin
  Result := FProxyInfo;
end;

function TIdProxyConnectionInfoPeer.GetProxyPassword: string;
begin
  Result := FProxyInfo.ProxyPassword;
end;

function TIdProxyConnectionInfoPeer.GetProxyPort: Integer;
begin
  Result := FProxyInfo.ProxyPort;
end;

function TIdProxyConnectionInfoPeer.GetProxyServer: string;
begin
  Result := FProxyInfo.ProxyServer;
end;

function TIdProxyConnectionInfoPeer.GetProxyUserName: string;
begin
  Result := FProxyInfo.ProxyUsername;
end;

procedure TIdProxyConnectionInfoPeer.SetBasicAuthentication(Val: Boolean);
begin
  FProxyInfo.BasicAuthentication := Val;
end;

procedure TIdProxyConnectionInfoPeer.SetProxyPassword(pass: string);
begin
  FProxyInfo.ProxyPassword := pass;
end;

procedure TIdProxyConnectionInfoPeer.SetProxyPort(Val: Integer);
begin
  FProxyInfo.ProxyPort := Val;
end;

procedure TIdProxyConnectionInfoPeer.SetProxyServer(Val: string);
begin
  FProxyInfo.ProxyServer := Val;
end;

procedure TIdProxyConnectionInfoPeer.SetProxyUserName(user: string);
begin
  FProxyInfo.ProxyUsername := user;
end;

{ TIdSSLIOHandlerSocketOpenSSLPeer }

procedure TIdSSLIOHandlerSocketOpenSSLPeer.AfterConstruction;
begin
  inherited;
  FIsFreed := False;
end;

constructor TIdSSLIOHandlerSocketOpenSSLPeer.Create(AOwner: TComponent);
begin
  FSSLOptions := nil;
  FOnVerifyPeer := nil;
  FIdX509Peer := nil;
  FHandler := TIdSSLIOHandlerSocketOpenSSLIP.Create(AOwner);
  TIdSSLIOHandlerSocketOpenSSLIP(FHandler).FSetDestroyedProc := SetDestroyed;
  inherited Create(FHandler);
end;

constructor TIdSSLIOHandlerSocketOpenSSLPeer.Create(
  AIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL);
begin
  FSSLOptions := nil;
  FOnVerifyPeer := nil;
  FIdX509Peer := nil;
  FHandler := AIdSSLIOHandlerSocketOpenSSL;
  inherited Create(FHandler);
end;

destructor TIdSSLIOHandlerSocketOpenSSLPeer.Destroy;
begin
  //Clear interface references (TODO: check order of nil'ing)
  FSSLOptions := nil;

  if NeedToFree and Assigned(FHandler) and (FHandler is TIdSSLIOHandlerSocketOpenSSLIP) then
    FHandler.Free;
  inherited;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.GetObject: TObject;
begin
  Result := FHandler;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.GetOnVerifyPeer: TVerifyPeerEventPeer;
begin
  if Assigned(FHandler.OnVerifyPeer) then
    Result := FOnVerifyPeer
  else
    Result := nil;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.GetPassThrough: Boolean;
begin
  Result := FHandler.PassThrough;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.GetSSLOptions: IIPSSLOptions;
begin
  if FHandler.SSLOptions = nil then
    Result := nil
  else if Assigned(FSSLOptions) and (FSSLOptions.GetObject = FHandler.SSLOptions) then
    Result := FSSLOptions
  else
  begin
    Result := TIdSSLOptionsPeer.Create(FHandler.SSLOptions);
    FSSLOptions := Result;
  end;
end;

procedure TIdSSLIOHandlerSocketOpenSSLPeer.SetDestroyed;
begin
  FIsFreed := True;
end;

procedure TIdSSLIOHandlerSocketOpenSSLPeer.SetOnVerifyPeer(
  OnVerify: TVerifyPeerEventPeer);
begin
  FOnVerifyPeer := OnVerify;
  FHandler.OnVerifyPeer := LOnVerifyPeerEvent;
end;

procedure TIdSSLIOHandlerSocketOpenSSLPeer.SetPassThrough(pass: Boolean);
begin
  FHandler.PassThrough := pass;
end;

procedure TIdSSLIOHandlerSocketOpenSSLPeer.SetSSLOptions(
  options: IIPSSLOptions);
begin
  FHandler.SSLOptions := options.GetObject as TIdSSLOptions;
  FSSLOptions := options;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.LOnVerifyPeerEvent(Certificate: TIdX509;
  AOk: Boolean; ADepth, AError: Integer): Boolean;
begin
  Result := False;
  if Assigned(FOnVerifyPeer) then
  begin
    FIdX509Peer := TIdX509Peer.Create(Certificate);
    Result := FOnVerifyPeer(FIdX509Peer, AOk, ADepth, AError);
  end;
end;

function TIdSSLIOHandlerSocketOpenSSLPeer.NeedToFree: Boolean;
begin
  Result := not FIsFreed;
end;

{ TIdIOHandlerPeer }

function TIdIOHandlerPeer.CheckForDataOnSource(ATimeout: Integer): Boolean;
begin
  Result := FHandler.CheckForDataOnSource(ATimeout);
end;

procedure TIdIOHandlerPeer.Close;
begin
  FHandler.Close;
end;

function TIdIOHandlerPeer.Connected: Boolean;
begin
  Result := FHandler.Connected;
end;

constructor TIdIOHandlerPeer.Create(Handler: TIdIOHandler);
begin
  FHandler := Handler;
end;

function TIdIOHandlerPeer.GetInputBuffer: IIPBuffer;
begin
  if FHandler.InputBuffer = nil then
    Result := nil
  else
    Result := TIdBufferPeer.Create(FHandler.InputBuffer);
end;

function TIdIOHandlerPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdIOHandlerPeer.GetObject: TObject;
begin
  Result := FHandler;
end;

function TIdIOHandlerPeer.ReadByte: Byte;
begin
  Result := FHandler.ReadByte;
end;

procedure TIdIOHandlerPeer.ReadBytes(var VBuffer: TIPBytesPeer; AByteCount: Integer;
  AAppend: Boolean);
begin
  FHandler.ReadBytes(VBuffer, AByteCount, AAppend);
end;

procedure TIdIOHandlerPeer.Write(const ABuffer: TIPBytesPeer; const ALength,
  AOffset: Integer);
begin
  FHandler.Write(ABuffer, ALength, AOffset);
end;

{ TIdIOHandlerPeerIP }

function TIdIOHandlerPeerIP.CheckForDataOnSource(ATimeout: Integer): Boolean;
begin
  Result := FHandler.CheckForDataOnSource(ATimeout);
end;

procedure TIdIOHandlerPeerIP.Close;
begin
  FHandler.Close;
end;

function TIdIOHandlerPeerIP.Connected: Boolean;
begin
  Result := FHandler.Connected;
end;

constructor TIdIOHandlerPeerIP.Create(Handler: TIdIOHandler);
begin
  FBuffer := nil;
  FHandler := Handler;
end;

function TIdIOHandlerPeerIP.GetInputBuffer: IIPBuffer;
begin
  if FHandler.InputBuffer = nil then
    Result := nil
  else if Assigned(FBuffer) and (FBuffer.GetObject = FHandler.InputBuffer) then
    Result := FBuffer
  else
  begin
    Result := TIdBufferPeer.Create(FHandler.InputBuffer);
    FBuffer := Result;
  end;
end;

function TIdIOHandlerPeerIP.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdIOHandlerPeerIP.GetObject: TObject;
begin
  Result := FHandler;
end;

function TIdIOHandlerPeerIP.ReadByte: Byte;
begin
  Result := FHandler.ReadByte;
end;

procedure TIdIOHandlerPeerIP.ReadBytes(var VBuffer: TIPBytesPeer; AByteCount: Integer;
  AAppend: Boolean);
begin
  FHandler.ReadBytes(VBuffer, AByteCount, AAppend);
end;

procedure TIdIOHandlerPeerIP.Write(const ABuffer: TIPBytesPeer; const ALength,
  AOffset: Integer);
begin
  FHandler.Write(ABuffer, ALength, AOffset);
end;

{ TIdTCPClientIP }

destructor TIdTCPClientIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdTCPClientPeer }

constructor TIdTCPClientPeer.Create(AOwner: TComponent);
begin
  FIOHandler := nil;
  FTCPClient := TIdTCPClientIP.Create(AOwner);
  FTCPClient.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdTCPClientPeer.Destroy;
begin
  FIOHandler := nil;

  if NeedToFree then
    FTCPClient.Free;
  inherited;
end;

procedure TIdTCPClientPeer.Connect;
begin
  FTCPClient.Connect;
end;

procedure TIdTCPClientPeer.Disconnect;
begin
  FTCPClient.Disconnect;
end;

function TIdTCPClientPeer.Connected: Boolean;
begin
  Result := FTCPClient.Connected;
end;

function TIdTCPClientPeer.GetManagedIOHandler: Boolean;
begin
  Result := FTCPClient.ManagedIOHandler;
end;

function TIdTCPClientPeer.GetBoundIP: string;
begin
  Result := FTCPClient.BoundIP;
end;

function TIdTCPClientPeer.GetHost: string;
begin
  Result := FTCPClient.Host;
end;

function TIdTCPClientPeer.GetSocket: IIPIOHandlerSocket;
begin
  if FTCPClient.Socket = nil then
    Result := nil
  else
    Result := TIdIOHandlerSocketPeer.Create(FTCPClient.Socket);
end;

function TIdTCPClientPeer.GetIOHandler: IIPIOHandler;
begin
  if FTCPClient.IOHandler = nil then
    Result := nil
  else if Assigned(FIOHandler) and (FIOHandler.GetObject = FTCPClient.IOHandler) then
    Result := FIOHandler
  else
  begin
    if FTCPClient.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
      Result := TIdSSLIOHandlerSocketOpenSSLPeer.Create(FTCPClient.IOHandler as TIdSSLIOHandlerSocketOpenSSL)
    else if FTCPClient.IOHandler is TIdIOHandlerSocket then
      Result := TIdIOHandlerSocketPeer.Create(FTCPClient.IOHandler as TIdIOHandlerSocket)
    else
      Result := TIdIOHandlerPeerIP.Create(FTCPClient.IOHandler);
    FIOHandler := Result;
  end;
end;

function TIdTCPClientPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdTCPClientPeer.GetObject: TObject;
begin
  Result := FTCPClient;
end;

function TIdTCPClientPeer.GetPort: TIPPortPeer;
begin
  assert(Sizeof(Result) = sizeOf(FTCPClient.Port), 'Size mismatch');
  Result := FTCPClient.Port;
end;

function TIdTCPClientPeer.GetUseNagle: Boolean;
begin
  Result := FTCPClient.UseNagle;
end;

procedure TIdTCPClientPeer.SetManagedIOHandler(AManagedIOHandler: Boolean);
begin
  FTCPClient.ManagedIOHandler := AManagedIOHandler;
end;

procedure TIdTCPClientPeer.SetBoundIP(IP: string);
begin
  FTCPClient.BoundIP := IP;
end;

procedure TIdTCPClientPeer.SetHost(LHost: string);
begin
  FTCPClient.Host := LHost;
end;

procedure TIdTCPClientPeer.SetIOHandler(Handler: IIPIOHandler);
begin
  FTCPClient.IOHandler := Handler.GetObject as TIdIOHandler;
  FIOHandler := Handler;
end;

procedure TIdTCPClientPeer.SetPort(LPort: TIPPortPeer);
begin
  assert(SizeOf(LPort) = SizeOf(FTCPClient.Port), 'Size mismatch');
  FTCPClient.Port := LPort;
end;

procedure TIdTCPClientPeer.SetUseNagle(Use: Boolean);
begin
  FTCPClient.UseNagle := Use;
end;

{ TIdTCPClientPeerIP }

constructor TIdTCPClientPeerIP.Create(AOwner: TComponent);
begin
  FIOHandler := nil;
  FTCPClient := TIdTCPClientIP.Create(AOwner);
  FTCPClient.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdTCPClientPeerIP.Destroy;
begin
  FIOHandler := nil;

  if NeedToFree then
    FTCPClient.Free;
  inherited;
end;

procedure TIdTCPClientPeerIP.Connect;
begin
  FTCPClient.Connect;
end;

procedure TIdTCPClientPeerIP.Disconnect;
begin
  FTCPClient.Disconnect;
end;

function TIdTCPClientPeerIP.Connected: Boolean;
begin
  Result := FTCPClient.Connected;
end;

function TIdTCPClientPeerIP.GetManagedIOHandler: Boolean;
begin
  Result := FTCPClient.ManagedIOHandler;
end;

function TIdTCPClientPeerIP.GetBoundIP: string;
begin
  Result := FTCPClient.BoundIP;
end;

function TIdTCPClientPeerIP.GetHost: string;
begin
  Result := FTCPClient.Host;
end;

function TIdTCPClientPeerIP.GetSocket: IIPIOHandlerSocket;
begin
  if FTCPClient.Socket = nil then
    Result := nil
  else if Assigned(FSocket) and (FSocket.GetObject = FTCPClient.Socket) then
    Result := FSocket
  else
  begin
    Result := TIdIOHandlerSocketPeer.Create(FTCPClient.Socket);
    FSocket := Result;
  end;
end;

function TIdTCPClientPeerIP.GetIOHandler: IIPIOHandler;
begin
  if FTCPClient.IOHandler = nil then
    Result := nil
  else if Assigned(FIOHandler) and (FIOHandler.GetObject = FTCPClient.IOHandler) then
    Result := FIOHandler
  else
  begin
    if FTCPClient.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
      Result := TIdSSLIOHandlerSocketOpenSSLPeer.Create(FTCPClient.IOHandler as TIdSSLIOHandlerSocketOpenSSL)
    else if FTCPClient.IOHandler is TIdIOHandlerSocket then
      Result := TIdIOHandlerSocketPeer.Create(FTCPClient.IOHandler as TIdIOHandlerSocket)
    else
      Result := TIdIOHandlerPeerIP.Create(FTCPClient.IOHandler);
    FIOHandler := Result;
  end;
end;

function TIdTCPClientPeerIP.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdTCPClientPeerIP.GetObject: TObject;
begin
  Result := FTCPClient;
end;

function TIdTCPClientPeerIP.GetPort: TIPPortPeer;
begin
  assert(Sizeof(Result) = sizeOf(FTCPClient.Port), 'Size mismatch');
  Result := FTCPClient.Port;
end;

function TIdTCPClientPeerIP.GetUseNagle: Boolean;
begin
  Result := FTCPClient.UseNagle;
end;

procedure TIdTCPClientPeerIP.SetManagedIOHandler(AManagedIOHandler: Boolean);
begin
  FTCPClient.ManagedIOHandler := AManagedIOHandler;
end;

procedure TIdTCPClientPeerIP.SetBoundIP(IP: string);
begin
  FTCPClient.BoundIP := IP;
end;

procedure TIdTCPClientPeerIP.SetHost(LHost: string);
begin
  FTCPClient.Host := LHost;
end;

procedure TIdTCPClientPeerIP.SetIOHandler(Handler: IIPIOHandler);
begin
  FTCPClient.IOHandler := Handler.GetObject as TIdIOHandler;
  FIOHandler := Handler;
end;

procedure TIdTCPClientPeerIP.SetPort(LPort: TIPPortPeer);
begin
  assert(SizeOf(LPort) = SizeOf(FTCPClient.Port), 'Size mismatch');
  FTCPClient.Port := LPort;
end;

procedure TIdTCPClientPeerIP.SetUseNagle(Use: Boolean);
begin
  FTCPClient.UseNagle := Use;
end;

{ TIdBufferPeer }

constructor TIdBufferPeer.Create(Buffer: TIdBuffer);
begin
  FBuffer := Buffer;
end;

function TIdBufferPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdBufferPeer.GetObject: TObject;
begin
  Result := FBuffer;
end;

function TIdBufferPeer.GetSize: Integer;
begin
  Result := FBuffer.Size;
end;

{ TIdX509IP }

destructor TIdX509IP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdX509Peer }

constructor TIdX509Peer.Create(aX509: PX509Peer; aCanFreeX509: Boolean);
begin
  FIssuer := nil;
  FSigInfo := nil;
  FSubject := nil;
  FObj := TIdX509IP.Create(aX509, aCanFreeX509);
  FObj.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdX509Peer.Destroy;
begin
  if NeedToFree then
    FObj.Free;
  inherited;
end;

function TIdX509Peer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdX509Peer.GetIssuer: IIPX509Name;
begin
  if FObj.Issuer = nil then
    Result := nil
  else if Assigned(FIssuer) and (FIssuer.GetObject = FObj.Issuer) then
    Result := FIssuer
  else
  begin
    Result := TIdX509NamePeer.Create(FObj.Issuer);
    FIssuer := Result;
  end;
end;

function TIdX509Peer.GetNotAfter: TDateTime;
begin
  Result := FObj.notAfter;
end;

function TIdX509Peer.GetNotBefore: TDateTime;
begin
  Result := FObj.notBefore;
end;

function TIdX509Peer.GetObject: TObject;
begin
  Result := FObj;
end;

function TIdX509Peer.GetSerialNumber: string;
begin
  Result := FObj.SerialNumber;
end;

function TIdX509Peer.GetSigInfo: IIPX509SigInfo;
begin
  if FObj.SigInfo = nil then
    Result := nil
  else if Assigned(FSigInfo) and (FSigInfo.GetObject = FObj.SigInfo) then
    Result := FSigInfo
  else
  begin
    Result := TIdX509SigInfoPeer.Create(FObj.SigInfo);
    FSigInfo := Result;
  end;
end;

function TIdX509Peer.GetSubject: IIPX509Name;
begin
  if FObj.Subject = nil then
    Result := nil
  else if Assigned(FSubject) and (FSubject.GetObject = FObj.Subject) then
    Result := FSubject
  else
  begin
    Result := TIdX509NamePeer.Create(FObj.Subject);
    FSubject := Result;
  end;
end;

function TIdX509Peer.GetVersion: TIPC_LONG;
begin
  Result := FObj.Version;
end;

{ TIdX509NamePeer }

constructor TIdX509NamePeer.Create(Name: TIdX509Name);
begin
  FName := Name;
end;

function TIdX509NamePeer.GetHash: TIPSSLULong;
begin
  with FName.Hash do
  begin
    Result.B1 := B1;
    Result.B2 := B2;
    Result.B3 := B3;
    Result.B4 := B4;
    Result.W1 := W1;
    Result.W2 := W2;
    Result.L1 := L1;
    Result.C1 := C1;
  end;
end;

function TIdX509NamePeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdX509NamePeer.GetObject: TObject;
begin
  Result := FName;
end;

function TIdX509NamePeer.GetOneLine: string;
begin
  Result := FName.OneLine;
end;

{ TIdX509SigInfoPeer }

constructor TIdX509SigInfoPeer.Create(SigInfo: TIdX509SigInfo);
begin
  FSigInfo := SigInfo;
end;

function TIdX509SigInfoPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdX509SigInfoPeer.GetObject: TObject;
begin
  Result := FSigInfo;
end;

function TIdX509SigInfoPeer.GetSignature: string;
begin
  Result := FSigInfo.Signature;
end;

function TIdX509SigInfoPeer.GetSigTypeAsString: string;
begin
  Result := FSigInfo.SigTypeAsString;
end;

{ TIdProc }

function TIdProc._d2i_RSAPublicKey(pr: PRSAPeer; _in: PPByte;
  len: TIPC_INT): PRSAPeer;
begin
  Result := d2i_RSAPublicKey(pr, IdSSLOpenSSLHeaders.PPByte(_in), len);
end;

function TIdProc._d2i_X509(pr: PX509Peer; _in: PPByte;
  len: TIPC_INT): PX509Peer;
begin
  Result := d2i_X509(pr, IdSSLOpenSSLHeaders.PPByte(_in), len);
end;

function TIdProc._ERR_error_string(e: TIPC_ULONG;
  buf: PAnsiChar): PAnsiChar;
begin
  Result := ERR_error_string(e, buf);
end;

function TIdProc._ERR_get_error: TIPC_ULONG;
begin
  Result := ERR_get_error;
end;

procedure TIdProc._ERR_load_crypto_strings;
begin
  ERR_load_crypto_strings;
end;

function TIdProc._i2d_RSAPublicKey(x: PRSAPeer; buf: PPByte): TIPC_INT;
begin
  Result := i2d_RSAPublicKey(x, IdSSLOpenSSLHeaders.PPByte(buf));
end;

procedure TIdProc._OpenSSL_add_all_ciphers;
begin
  OpenSSL_add_all_ciphers;
end;

procedure TIdProc._RSA_free(Ptr: PRSAPeer);
begin
  RSA_free(Ptr);
end;

function TIdProc._RSA_generate_key(bits: TIPC_INT;
  e: TIPC_ULONG): PRSAPeer;
begin
  Result := RSA_generate_key(bits, e, nil, nil);
end;

function TIdProc._RSA_private_decrypt(flen: TIPC_INT;
  from, _to: PByte; rsa: PRSAPeer; padding: TIPC_INT): TIPC_INT;
begin
  Result := RSA_private_decrypt(flen, from, _to, rsa, padding);
end;

function TIdProc._RSA_public_encrypt(flen: TIPC_INT;
  from, _to: PByte; rsa: PRSAPeer; padding: TIPC_INT): TIPC_INT;
begin
  Result := RSA_public_encrypt(flen, from, _to, rsa, padding);
end;

function TIdProc._RSA_size(key: PRSAPeer): TIPC_INT;
begin
  Result := RSA_size(key);
end;

function TIdProc._SSLLoad: Boolean;
begin
  Result := Load;
end;

{ TIdURIProc }

function TIdProc.FinalHMACInst(ACtx: TIPHMACIntCtx): TIPBytesPeer;
begin
  Result := IdFips.FinalHMACInst(ACtx);
end;

function TIdProc.GetHMACSHA1HashInst(const AKey: TIPBytesPeer): TIPHMACIntCtx;
begin
  Result := IdFIPS.GetHMACSHA1HashInst(AKey);
end;

function TIdProc.GetHMACSHA256HashInst(const AKey: TIPBytesPeer): TIPHMACIntCtx;
begin
  Result := IdFIPS.GetHMACSHA256HashInst(AKey);
end;

function TIdProc.GMTToLocalDateTime(S: string): TDateTime;
begin
  Result := IdGlobalProtocols.GMTToLocalDateTime(S)
end;

function TIdProc.IsHMACSHA1Avail: Boolean;
begin
  Result := IdFips.IsHMACSHA1Avail;
end;

function TIdProc.IsHMACSHA256Avail: Boolean;
begin
  Result := IdFIPS.IsHMACSHA256Avail;
end;

function TIdProc.ParamsEncode(const ASrc: string;
  AByteEncoding: TIPTextEncodingPeer): string;
begin
  Result := TIdUri.ParamsEncode(ASrc, AByteEncoding);
end;

function TIdProc.ReadStringAsCharset(AStream: TStream;
  const ACharset: string): string;
begin
  Result := IdGlobalProtocols.ReadStringAsCharset(AStream, ACharset);
end;

function TIdProc.ReadStringFromStream(AStream: TStream; ASize: Integer;
  AByteEncoding: TIdTextEncoding): string;
begin
  Result := IdGlobal.ReadStringFromStream(AStream, ASize, AByteEncoding);
end;

function TIdProc.RSA_PKCS1_PADDING: Integer;
begin
  Result := IdSSLOpenSSLHeaders.RSA_PKCS1_PADDING;
end;

procedure TIdProc.UpdateHMACInst(ACtx: TIPHMACIntCtx; const AIn: TIPBytesPeer);
begin
  IdFIPS.UpdateHMACInst(ACtx, AIn);
end;

function TIdProc.URLDecode(ASrc: string;
  AByteEncoding: TIPTextEncodingPeer): string;
begin
  Result := TIdURI.URLDecode(ASrc, AByteEncoding)
end;

function TIdProc.URLEncode(const ASrc: string): string;
begin
  Result := TIdURI.URLEncode(ASrc);
end;

{ TIdBasicAuthenticationIP }

destructor TIdBasicAuthenticationIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdBasicAuthenticationPeer }

constructor TIdBasicAuthenticationPeer.Create;
begin
  FObj := TIdBasicAuthenticationIP.Create;
  FObj.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdBasicAuthenticationPeer.Destroy;
begin
  if NeedToFree then
    FObj.Free;
  inherited;
end;

function TIdBasicAuthenticationPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdBasicAuthenticationPeer.GetObject: TObject;
begin
  Result := FObj;
end;

function TIdBasicAuthenticationPeer.GetPassword: string;
begin
  Result := FObj.Password;
end;

function TIdBasicAuthenticationPeer.GetUserName: string;
begin
  Result := FObj.Username;
end;

procedure TIdBasicAuthenticationPeer.SetPassword(pass: string);
begin
  FObj.Password := pass;
end;

procedure TIdBasicAuthenticationPeer.SetUsername(user: string);
begin
  FObj.Username := user;
end;

{ TIdHTTPSPeer }

//procedure TIdHTTPSPeer.InitComponent;
//begin
//  inherited;
//  FProtocol := 'https';
//end;

{ TIdSSLOptionsPeer }

constructor TIdSSLOptionsPeer.Create(Options: TIdSSLOptions);
begin
  FOptions := Options;
end;

function TIdSSLOptionsPeer.GetCertFile: string;
begin
  Result := FOptions.CertFile;
end;

function TIdSSLOptionsPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdSSLOptionsPeer.GetKeyFile: string;
begin
  Result := FOptions.KeyFile;
end;

function TIdSSLOptionsPeer.GetMethod: TIPSSLVersionPeer;
begin
  case FOptions.Method of
    TIdSSLVersion.sslvSSLv2: Result := TIPSSLVersionPeer.sslvSSLv2;
    TIdSSLVersion.sslvSSLv23: Result := TIPSSLVersionPeer.sslvSSLv23;
    TIdSSLVersion.sslvSSLv3: Result := TIPSSLVersionPeer.sslvSSLv3;
    TIdSSLVersion.sslvTLSv1: Result := TIPSSLVersionPeer.sslvTLSv1;
  else raise Exception.Create('Unexpected method version found');
  end;
end;

function TIdSSLOptionsPeer.GetMode: TIPSSLModePeer;
begin
  case FOptions.Mode of
    TIdSSLMode.sslmUnassigned: Result := TIPSSLModePeer.sslmUnassigned;
    TIdSSLMode.sslmClient: Result := TIPSSLModePeer.sslmClient;
    TIdSSLMode.sslmServer: Result := TIPSSLModePeer.sslmServer;
    TIdSSLMode.sslmBoth: Result := TIPSSLModePeer.sslmBoth;
  else raise Exception.Create('Unexpected mode found');
  end;
end;

function TIdSSLOptionsPeer.GetObject: TObject;
begin
  Result := FOptions;
end;

function TIdSSLOptionsPeer.GetRootCertFile: string;
begin
  Result := FOptions.RootCertFile;
end;

function TIdSSLOptionsPeer.GetVerifyMode: TIPSSLVerifyModeSetPeer;
begin
  if TIdSSLVerifyMode.sslvrfPeer in FOptions.VerifyMode then
    Result := Result + [TIPSSLVerifyModePeer.sslvrfPeer];
  if TIdSSLVerifyMode.sslvrfFailIfNoPeerCert in FOptions.VerifyMode then
    Result := Result + [TIPSSLVerifyModePeer.sslvrfFailIfNoPeerCert];
  if TIdSSLVerifyMode.sslvrfClientOnce in FOptions.VerifyMode then
    Result := Result + [TIPSSLVerifyModePeer.sslvrfClientOnce];
end;

procedure TIdSSLOptionsPeer.SetCertFile(ctfile: string);
begin
  FOptions.CertFile := ctfile;
end;

procedure TIdSSLOptionsPeer.SetKeyFile(kfile: string);
begin
  FOptions.KeyFile := kfile;
end;

procedure TIdSSLOptionsPeer.SetMethod(method: TIPSSLVersionPeer);
begin
  case method of
    sslvSSLv2: FOptions.Method := TIdSSLVersion.sslvSSLv2;
    sslvSSLv23: FOptions.Method := TIdSSLVersion.sslvSSLv23;
    sslvSSLv3: FOptions.Method := TIdSSLVersion.sslvSSLv3;
    sslvTLSv1: FOptions.Method := TIdSSLVersion.sslvTLSv1;
  end;
end;

procedure TIdSSLOptionsPeer.SetMode(mode: TIPSSLModePeer);
begin
  case mode of
    sslmUnassigned: FOptions.Mode := TIdSSLMode.sslmUnassigned;
    sslmClient: FOptions.Mode := TIdSSLMode.sslmClient;
    sslmServer: FOptions.Mode := TIdSSLMode.sslmServer;
    sslmBoth: FOptions.Mode := TIdSSLMode.sslmBoth;
  end;
end;

procedure TIdSSLOptionsPeer.SetRootCertFile(rootfile: string);
begin
  FOptions.RootCertFile := rootfile;
end;

procedure TIdSSLOptionsPeer.SetVerifyMode(mode: TIPSSLVerifyModeSetPeer);
begin
  if TIPSSLVerifyModePeer.sslvrfPeer in mode then
    FOptions.VerifyMode := FOptions.VerifyMode + [TIdSSLVerifyMode.sslvrfPeer];
  if TIPSSLVerifyModePeer.sslvrfFailIfNoPeerCert in mode then
    FOptions.VerifyMode := FOptions.VerifyMode + [TIdSSLVerifyMode.sslvrfFailIfNoPeerCert];
  if TIPSSLVerifyModePeer.sslvrfClientOnce in mode then
    FOptions.VerifyMode := FOptions.VerifyMode + [TIdSSLVerifyMode.sslvrfClientOnce];
end;

{ TIdAuthenticationPeer }

constructor TIdAuthenticationPeer.Create(Auth: TIdAuthentication);
begin
  FAuth := Auth;
end;

function TIdAuthenticationPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdAuthenticationPeer.GetObject: TObject;
begin
  Result := FAuth;
end;

function TIdAuthenticationPeer.GetPassword: string;
begin
  Result := FAuth.Password;
end;

function TIdAuthenticationPeer.GetUserName: string;
begin
  Result := FAuth.Username;
end;

procedure TIdAuthenticationPeer.SetPassword(pass: string);
begin
  FAuth.Password := pass;
end;

procedure TIdAuthenticationPeer.SetUsername(user: string);
begin
  FAuth.Username := user;
end;

{ TIdURIPeer }

constructor TIdURIPeer.Create(URI: TIdURI);
begin
  FURI := URI;
end;

function TIdURIPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdURIPeer.GetObject: TObject;
begin
  Result := FURI;
end;

function TIdURIPeer.URLEncode(const ASrc: string;
  AByteEncoding: TIPTextEncodingPeer): string;
begin
  Result := FURI.URLEncode(ASrc, AByteEncoding);
end;

{ TIdServerIOHandlerSSLOpenSSLIP }

destructor TIdServerIOHandlerSSLOpenSSLIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdServerIOHandlerSSLOpenSSLPeer }

constructor TIdServerIOHandlerSSLOpenSSLPeer.Create(AOwner: TComponent);
begin
  FOnGetPassEvent := nil;
  FSSLOptions := nil;
  FServerIOHandlerSSL := TIdServerIOHandlerSSLOpenSSLIP.Create(AOwner);
  TIdServerIOHandlerSSLOpenSSLIP(FServerIOHandlerSSL).FSetDestroyedProc := SetDestroyed;
end;

constructor TIdServerIOHandlerSSLOpenSSLPeer.Create(
  AIdServerIOHandlerSSLOpenSSL: TIdServerIOHandlerSSLOpenSSL);
begin
  FOnGetPassEvent := nil;
  FSSLOptions := nil;
  FServerIOHandlerSSL := AIdServerIOHandlerSSLOpenSSL;
end;

destructor TIdServerIOHandlerSSLOpenSSLPeer.Destroy;
begin
  if NeedToFree and Assigned(FServerIOHandlerSSL) and (FServerIOHandlerSSL is TIdServerIOHandlerSSLOpenSSLIP) then
    FServerIOHandlerSSL.Free;
  inherited;
end;

function TIdServerIOHandlerSSLOpenSSLPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdServerIOHandlerSSLOpenSSLPeer.GetObject: TObject;
begin
  Result := FServerIOHandlerSSL;
end;

function TIdServerIOHandlerSSLOpenSSLPeer.GetOnGetPassword: TPasswordEventPeer;
begin
  if Assigned(FServerIOHandlerSSL.OnGetPassword) then
    Result := FOnGetPassEvent
  else
    Result := nil;
end;

function TIdServerIOHandlerSSLOpenSSLPeer.GetSSLOptions: IIPSSLOptions;
begin
  if FServerIOHandlerSSL.SSLOptions = nil then
    Result := nil
  else if Assigned(FSSLOptions) and (FSSLOptions.GetObject = FServerIOHandlerSSL.SSLOptions) then
    Result := FSSLOptions
  else
  begin
    Result := TIdSSLOptionsPeer.Create(FServerIOHandlerSSL.SSLOptions);
    FSSLOptions := Result;
  end;
end;

procedure TIdServerIOHandlerSSLOpenSSLPeer.SetOnGetPassword(
  event: TPasswordEventPeer);
begin
  FOnGetPassEvent := event;
  FServerIOHandlerSSL.OnGetPassword := LOnGetPassEvent;
end;

procedure TIdServerIOHandlerSSLOpenSSLPeer.LOnGetPassEvent(
  var Password: AnsiString);
begin
  if Assigned(FOnGetPassEvent) then
    FOnGetPassEvent(Password);
end;

{ TIdHTTPServerIP }

destructor TIdHTTPServerIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdHTTPServerPeer }

constructor TIdHTTPServerPeer.Create(AOwner: TComponent);
begin
  FContexts := TDictionary<TIdContext,IIPContext>.Create;
  FSocketHandles := nil;
  FServerIOHandler := nil;
  FScheduler := nil;
  FOnConnectEvent := nil;
  FOnCommandGet := nil;
  FOnCommandOther := nil;
  FOnDisconnectEvent := nil;
  FOnExecuteEvent := nil;
  FHTTPServer := TIdHTTPServerIP.Create(AOwner);
  FHTTPServer.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdHTTPServerPeer.Destroy;
begin
  //Clear interface references (TODO: check order of nil'ing)
  FScheduler := nil;
  FSocketHandles := nil;
  FServerIOHandler := nil;
  FreeAndNil(FContexts);

  if NeedToFree then
    FHTTPServer.Free;
  inherited;
end;

function TIdHTTPServerPeer.GetActive: Boolean;
begin
  Result := FHTTPServer.Active;
end;

function TIdHTTPServerPeer.GetBindings: IIPSocketHandles;
begin
  if FHTTPServer.Bindings = nil then
    Result := nil
  else if Assigned(FSocketHandles) and (FSocketHandles.GetObject = FHTTPServer.Bindings) then
    Result := FSocketHandles
  else
  begin
    Result := TIdSocketHandlesPeer.Create(FHTTPServer.Bindings);
    FSocketHandles := Result;
  end;
end;

function TIdHTTPServerPeer.GetDefaultPort: TIPPortPeer;
begin
  Result := FHTTPServer.DefaultPort;
end;

function TIdHTTPServerPeer.GetIOHandler: IIPServerIOHandler;
begin
  if FHTTPServer.IOHandler = nil then
    Result := nil
  else if Assigned(FServerIOHandler) and (FServerIOHandler.GetObject = FHTTPServer.IOHandler) then
    Result := FServerIOHandler
  else
  begin
    if FHTTPServer.IOHandler is TIdServerIOHandlerSSLOpenSSL then
      Result := TIdServerIOHandlerSSLOpenSSLPeer.Create(FHTTPServer.IOHandler as TIdServerIOHandlerSSLOpenSSL)
    else
      Result := TIdServerIOHandlerPeer.Create(FHTTPServer.IOHandler);
    FServerIOHandler := Result;
  end;
end;

function TIdHTTPServerPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPServerPeer.GetKeepAlive: Boolean;
begin
  Result := FHTTPServer.KeepAlive;
end;

function TIdHTTPServerPeer.GetObject: TObject;
begin
  Result := FHTTPServer;
end;

function TIdHTTPServerPeer.GetOnCommandGet: TIPHTTPCommandEventPeer;
begin
  if Assigned(FHTTPServer.OnCommandGet) then
    Result := FOnCommandGet
  else
    Result := nil;
end;

function TIdHTTPServerPeer.GetOnCommandOther: TIPHTTPCommandEventPeer;
begin
  if Assigned(FHTTPServer.OnCommandOther) then
    Result := FOnCommandOther
  else
    Result := nil;
end;

function TIdHTTPServerPeer.GetOnConnect: TIPServerThreadEventPeer;
begin
  if Assigned(FHTTPServer.OnConnect) then
    Result := FOnConnectEvent
  else
    Result := nil;
end;

function TIdHTTPServerPeer.GetOnDisconnect: TIPServerThreadEventPeer;
begin
  if Assigned(FHTTPServer.OnDisconnect) then
    Result := FOnDisconnectEvent
  else
    Result := nil;
end;

function TIdHTTPServerPeer.GetOnExecute: TIPServerThreadEventPeer;
begin
  if Assigned(FHTTPServer.OnExecute) then
    Result := FOnExecuteEvent
  else
    Result := nil;
end;

function TIdHTTPServerPeer.GetScheduler: IIPScheduler;
begin
  if FHTTPServer.Scheduler = nil then
    Result := nil
  else if Assigned(FScheduler) and (FScheduler.GetObject = FHTTPServer.Scheduler) then
    Result := FScheduler
  else
  begin
    Result := TIdSchedulerPeer.Create(FHTTPServer.Scheduler);
    FScheduler := Result;
  end;
end;

function TIdHTTPServerPeer.GetServerSoftware: string;
begin
  Result := FHTTPServer.ServerSoftware;
end;

function TIdHTTPServerPeer.GetUseNagle: Boolean;
begin
  Result := FHTTPServer.UseNagle;
end;

procedure TIdHTTPServerPeer.LOnCommandGetEvent(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LContext: IIPContext;
  LRequestInfo: IIPHTTPRequestInfo;
  LResponseInfo: IIPHTTPResponseInfo;
begin
  if Assigned(FOnCommandGet) then
  begin
    LContext := TIdContextPeer.Create(AContext);;
    LRequestInfo := TIdHTTPRequestInfoPeer.Create(ARequestInfo);
    LResponseInfo := TIdHTTPResponseInfoPeer.Create(AResponseInfo);
    FOnCommandGet(LContext, LRequestInfo, LResponseInfo);
  end;
end;

procedure TIdHTTPServerPeer.LOnCommandOtherEvent(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LContext: IIPContext;
  LRequestInfo: IIPHTTPRequestInfo;
  LResponseInfo: IIPHTTPResponseInfo;
begin
  if Assigned(FOnCommandOther) then
  begin
    LContext := TIdContextPeer.Create(AContext);;
    LRequestInfo := TIdHTTPRequestInfoPeer.Create(ARequestInfo);
    LResponseInfo := TIdHTTPResponseInfoPeer.Create(AResponseInfo);
    FOnCommandOther(LContext, LRequestInfo, LResponseInfo);
  end;
end;

procedure TIdHTTPServerPeer.LOnConnectEvent(AContext: TIdContext);
var
  LContext: IIPContext;
begin
  TMonitor.Enter(FContexts);
  try
    if FContexts.ContainsKey(AContext) then
      LContext := FContexts.Items[AContext]
    else
    begin
      LContext := TIdContextPeer.Create(AContext);
      FContexts.Add(AContext, LContext);
    end;
  finally
    TMonitor.Exit(FContexts);
  end;
  if Assigned(FOnConnectEvent) then
  begin
    FOnConnectEvent(LContext);
  end;
end;

procedure TIdHTTPServerPeer.LOnDisconnectEvent(AContext: TIdContext);
var
  LContext: IIPContext;
begin
  TMonitor.Enter(FContexts);
  try
    LContext := FContexts.Items[AContext];
    FContexts.Remove(AContext);
  finally
    TMonitor.Exit(FContexts);
  end;
  if Assigned(FOnDisconnectEvent) then
  begin
    FOnDisconnectEvent(LContext);
  end;
end;

procedure TIdHTTPServerPeer.LOnExecuteEvent(AContext: TIdContext);
var
  LContext: IIPContext;
begin
  if Assigned(FOnExecuteEvent) then
  begin
    TMonitor.Enter(FContexts);
    try
      LContext := FContexts.Items[AContext];
    finally
      TMonitor.Exit(FContexts);
    end;
    FOnExecuteEvent(LContext);
  end;
end;

procedure TIdHTTPServerPeer.SetActive(Val: Boolean);
begin
  FHTTPServer.Active := Val;
end;

procedure TIdHTTPServerPeer.SetBindings(ABindings: IIPSocketHandles);
begin
  FHTTPServer.Bindings := ABindings.GetObject as TIdSocketHandles;
  FSocketHandles := ABindings;
end;

procedure TIdHTTPServerPeer.SetDefaultPort(port: TIPPortPeer);
begin
  FHTTPServer.DefaultPort := port;
end;

procedure TIdHTTPServerPeer.SetIOHandler(handler: IIPServerIOHandler);
begin
  FHTTPServer.IOHandler := handler.GetObject as TIdServerIOHandler;
  FServerIOHandler := handler;
end;

procedure TIdHTTPServerPeer.SetKeepAlive(keep: Boolean);
begin
  FHTTPServer.KeepAlive := keep;
end;

procedure TIdHTTPServerPeer.SetOnCommandGet(
  commandGet: TIPHTTPCommandEventPeer);
begin
  FHTTPServer.OnCommandGet := LOnCommandGetEvent;
  FOnCommandGet := commandGet;
end;

procedure TIdHTTPServerPeer.SetOnCommandOther(
  commandOther: TIPHTTPCommandEventPeer);
begin
  FHTTPServer.OnCommandOther := LOnCommandOtherEvent;
  FOnCommandOther := commandOther;
end;

procedure TIdHTTPServerPeer.SetOnConnect(event: TIPServerThreadEventPeer);
begin
  FHTTPServer.OnConnect := LOnConnectEvent;
  FOnConnectEvent := event;
end;

procedure TIdHTTPServerPeer.SetOnDisconnect(event: TIPServerThreadEventPeer);
begin
  FHTTPServer.OnDisconnect := LOnDisconnectEvent;
  FOnDisconnectEvent := event;
end;

procedure TIdHTTPServerPeer.SetOnExecute(event: TIPServerThreadEventPeer);
begin
  FHTTPServer.OnExecute := LOnExecuteEvent;
  FOnExecuteEvent := event;
end;

procedure TIdHTTPServerPeer.SetScheduler(AScheduler: IIPScheduler);
begin
  FHTTPServer.Scheduler := AScheduler.GetObject as TIdScheduler;
  FScheduler := AScheduler;
end;

procedure TIdHTTPServerPeer.SetServerSoftware(software: string);
begin
  FHTTPServer.ServerSoftware := software;
end;

procedure TIdHTTPServerPeer.SetUseNagle(Use: Boolean);
begin
  FHTTPServer.UseNagle := Use;
end;

{ TIdServerIOHandlerPeer }

constructor TIdServerIOHandlerPeer.Create(Handler: TIdServerIOHandler);
begin
  FHandler := Handler;
end;

function TIdServerIOHandlerPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdServerIOHandlerPeer.GetObject: TObject;
begin
  Result := FHandler;
end;

{ TIdContextPeer }

constructor TIdContextPeer.Create(Context: TIdContext);
begin
  FConnection := nil;
  FContext := Context;
end;

destructor TIdContextPeer.Destroy;
begin
  inherited;
end;

function TIdContextPeer.GetConnection: IIPTCPConnection;
begin
  if FContext.Connection = nil then
    Result := nil
  else if Assigned(FConnection) and (FConnection.GetObject = FContext.Connection) then
    Result := FConnection
  else
  begin
    Result := TIdTCPConnectionPeer.Create(FContext.Connection);
    FConnection := Result;
  end;
end;

function TIdContextPeer.GetData: TObject;
begin
  Result := FContext.Data;
end;

function TIdContextPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdContextPeer.GetObject: TObject;
begin
  Result := FContext;
end;

procedure TIdContextPeer.SetData(obj: TObject);
begin
  FContext.Data := obj;
end;

{ TIdTCPConnectionPeer }

function TIdTCPConnectionPeer.Connected: Boolean;
begin
  Result := FConnection.Connected;
end;

constructor TIdTCPConnectionPeer.Create(Connection: TIdTCPConnection);
begin
  FIOHandler := nil;
  FSocket := nil;
  FConnection := Connection;
end;

destructor TIdTCPConnectionPeer.Destroy;
begin
  FIOHandler := nil;
  inherited;
end;

procedure TIdTCPConnectionPeer.Disconnect;
begin
  FConnection.Disconnect;
end;

function TIdTCPConnectionPeer.GetIOHandler: IIPIOHandler;
begin
  if FConnection.IOHandler = nil then
    Result := nil
  else if Assigned(FIOHandler) and (FIOHandler.GetObject = FConnection.IOHandler) then
    Result := FIOHandler
  else
  begin
    if FConnection.IOHandler is TIdSSLIOHandlerSocketOpenSSL then
      Result := TIdSSLIOHandlerSocketOpenSSLPeer.Create(FConnection.IOHandler as TIdSSLIOHandlerSocketOpenSSL)
    else if FConnection.IOHandler is TIdIOHandlerSocket then
      Result := TIdIOHandlerSocketPeer.Create(FConnection.IOHandler as TIdIOHandlerSocket)
    else
      Result := TIdIOHandlerPeerIP.Create(FConnection.IOHandler);
    FIOHandler := Result;
  end;
end;

function TIdTCPConnectionPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdTCPConnectionPeer.GetObject: TObject;
begin
  Result := FConnection;
end;

function TIdTCPConnectionPeer.GetSocket: IIPIOHandlerSocket;
begin
  if FConnection.Socket = nil then
    Result := nil
  else if Assigned(FSocket) and (FSocket.GetObject = FConnection.Socket) then
    Result := FSocket
  else
  begin
    Result := TIdIOHandlerSocketPeer.Create(FConnection.Socket);
    FSocket := Result;
  end;
end;

function TIdTCPConnectionPeer.GetManagedIOHandler: Boolean;
begin
  Result := FConnection.ManagedIOHandler;
end;

procedure TIdTCPConnectionPeer.SetManagedIOHandler(AManagedIOHandler: Boolean);
begin
  FConnection.ManagedIOHandler := AManagedIOHandler;
end;

procedure TIdTCPConnectionPeer.SetIOHandler(Handler: IIPIOHandler);
begin
  FConnection.IOHandler := Handler.GetObject as TIdIOHandler;
  FIOHandler := Handler;
end;

{ TIdHTTPRequestInfoPeer }

constructor TIdHTTPRequestInfoPeer.Create(Info: TIdHTTPRequestInfo);
begin
  inherited Create(Info);
  FSession := nil;
  FInfo := Info;
end;

function TIdHTTPRequestInfoPeer.GetAccept: string;
begin
  Result := FInfo.Accept;
end;

function TIdHTTPRequestInfoPeer.GetAuthPassword: string;
begin
  Result := FInfo.AuthPassword;
end;

function TIdHTTPRequestInfoPeer.GetAuthUsername: string;
begin
  Result := FInfo.AuthUsername;
end;

function TIdHTTPRequestInfoPeer.GetCommand: string;
begin
  Result := FInfo.Command;
end;

function TIdHTTPRequestInfoPeer.GetCommandType: THTTPCommandTypePeer;
begin
  case FInfo.CommandType of
    THTTPCommandType.hcUnknown: Result := THTTPCommandTypePeer.hcUnknown;
    THTTPCommandType.hcHEAD: Result := THTTPCommandTypePeer.hcHEAD;
    THTTPCommandType.hcGET: Result := THTTPCommandTypePeer.hcGET;
    THTTPCommandType.hcPOST: Result := THTTPCommandTypePeer.hcPOST;
    THTTPCommandType.hcDELETE: Result := THTTPCommandTypePeer.hcDELETE;
    THTTPCommandType.hcPUT: Result := THTTPCommandTypePeer.hcPUT;
    THTTPCommandType.hcTRACE: Result := THTTPCommandTypePeer.hcTRACE;
    THTTPCommandType.hcOPTION: Result := THTTPCommandTypePeer.hcOPTION;
  else raise Exception.Create('Unexpected HTTP command type');
  end;
end;

function TIdHTTPRequestInfoPeer.GetDocument: string;
begin
  Result := FInfo.Document;
end;

function TIdHTTPRequestInfoPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPRequestInfoPeer.GetObject: TObject;
begin
  Result := FInfo;
end;

function TIdHTTPRequestInfoPeer.GetParams: TStrings;
begin
  Result := FInfo.Params;
end;

function TIdHTTPRequestInfoPeer.GetPostStream: TStream;
begin
  Result := FInfo.PostStream;
end;

function TIdHTTPRequestInfoPeer.GetRemoteIP: string;
begin
  Result := FInfo.RemoteIP;
end;

function TIdHTTPRequestInfoPeer.GetSession: IIPHTTPSession;
var
  LObj: IIPObject;
begin
  if Assigned(FSession) then
    Supports(FSession, IIPObject, LObj)
  else
    LObj := nil;
  if FInfo.Session = nil then
    Result := nil
  else if Assigned(FSession) and Assigned(LObj) and (LObj.GetObject = FInfo.Session) then
    Result := FSession
  else
  begin
    Result := TIdHTTPSessionPeer.Create(FInfo.Session);
    FSession := Result;
  end;
end;

function TIdHTTPRequestInfoPeer.GetURI: string;
begin
  Result := FInfo.URI;
end;

function TIdHTTPRequestInfoPeer.GetUserAgent: string;
begin
  Result := FInfo.UserAgent;
end;

function TIdHTTPRequestInfoPeer.GetVersion: string;
begin
  Result := FInfo.Version;
end;

procedure TIdHTTPRequestInfoPeer.SetAccept(Val: string);
begin
  FInfo.Accept := Val;
end;

procedure TIdHTTPRequestInfoPeer.SetDocument(doc: string);
begin
  FInfo.Document := doc;
end;

procedure TIdHTTPRequestInfoPeer.SetPostStream(ps: TStream);
begin
  FInfo.PostStream := ps;
end;

procedure TIdHTTPRequestInfoPeer.SetUserAgent(agent: string);
begin
  FInfo.UserAgent := agent;
end;

{ TIdHTTPResponseInfoPeer }

constructor TIdHTTPResponseInfoPeer.Create(Info: TIdHTTPResponseInfo);
begin
  inherited Create(Info);
  FWWWAuth := nil;
  FInfo := Info;
end;

destructor TIdHTTPResponseInfoPeer.Destroy;
begin
  FWWWAuth := nil;
  inherited;
end;

function TIdHTTPResponseInfoPeer.GetAuthRealm: string;
begin
  Result := FInfo.AuthRealm;
end;

function TIdHTTPResponseInfoPeer.GetCloseConnection: Boolean;
begin
  Result := FInfo.CloseConnection;
end;

function TIdHTTPResponseInfoPeer.GetContentStream: TStream;
begin
  Result := FInfo.ContentStream;
end;

function TIdHTTPResponseInfoPeer.GetContentText: string;
begin
  Result := FInfo.ContentText;
end;

function TIdHTTPResponseInfoPeer.GetFreeContentStream: Boolean;
begin
  Result := FInfo.FreeContentStream;
end;

function TIdHTTPResponseInfoPeer.GetHeaderHasBeenWritten: Boolean;
begin
  Result := FInfo.HeaderHasBeenWritten;
end;

function TIdHTTPResponseInfoPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPResponseInfoPeer.GetObject: TObject;
begin
  Result := FInfo;
end;

function TIdHTTPResponseInfoPeer.GetResponseNo: Integer;
begin
  Result := FInfo.ResponseNo;
end;

function TIdHTTPResponseInfoPeer.GetResponseText: string;
begin
  Result := FInfo.ResponseText;
end;

function TIdHTTPResponseInfoPeer.GetWWWAuthenticate: IIPHeaderList;
begin
  if FInfo.WWWAuthenticate = nil then
    Result := nil
  else if Assigned(FWWWAuth) and (FWWWAuth.GetObject = FInfo.WWWAuthenticate) then
    Result := FWWWAuth
  else
  begin
    Result := TIdHeaderListPeer.Create(FInfo.WWWAuthenticate);
    FWWWAuth := Result;
  end;
end;

procedure TIdHTTPResponseInfoPeer.SetAuthRealm(realm: string);
begin
  FInfo.AuthRealm := realm;
end;

procedure TIdHTTPResponseInfoPeer.SetCloseConnection(closeConn: Boolean);
begin
  FInfo.CloseConnection := closeConn;
end;

procedure TIdHTTPResponseInfoPeer.SetContentStream(content: TStream);
begin
  FInfo.ContentStream := content;
end;

procedure TIdHTTPResponseInfoPeer.SetContentText(text: string);
begin
  FInfo.ContentText := text;
end;

procedure TIdHTTPResponseInfoPeer.SetFreeContentStream(Val: Boolean);
begin
  FInfo.FreeContentStream := Val;
end;

procedure TIdHTTPResponseInfoPeer.SetHeaderHasBeenWritten(Val: Boolean);
begin
  FInfo.HeaderHasBeenWritten := Val;
end;

procedure TIdHTTPResponseInfoPeer.SetResponseNo(Num: Integer);
begin
  FInfo.ResponseNo := Num;
end;

procedure TIdHTTPResponseInfoPeer.SetResponseText(text: string);
begin
  FInfo.ResponseText := text;
end;

procedure TIdHTTPResponseInfoPeer.SetWWWAuthenticate(wwwAuth: IIPHeaderList);
begin
  FInfo.WWWAuthenticate := wwwAuth.GetObject as TIdHeaderList;
  FWWWAuth := wwwAuth;
end;

procedure TIdHTTPResponseInfoPeer.WriteContent;
begin
  FInfo.WriteContent;
end;

procedure TIdHTTPResponseInfoPeer.WriteHeader;
begin
  FInfo.WriteHeader;
end;

{ TIdStackPeer }

function TIdStackPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdStackPeer.GetObject: TObject;
begin
  Result := GStack;
end;

procedure TIdStackPeer.SetKeepAliveValues(ASocket: TIPStackSocketHandlePeer;
  const AEnabled: Boolean; const ATimeMS, AInterval: Integer);
begin
  if IdStack.GStack <> nil then
    IdStack.GStack.SetKeepAliveValues(ASocket, AEnabled, ATimeMS, AInterval);
end;

{ TIdIOHandlerSocketPeer }

constructor TIdIOHandlerSocketPeer.Create(Handler: TIdIOHandlerSocket);
begin
  inherited Create(Handler);
  FBinding := nil;
  FHandler := Handler;
end;

function TIdIOHandlerSocketPeer.GetBinding: IIPSocketHandle;
begin
  if FHandler.Binding = nil then
    Result := nil
  else if Assigned(FBinding) and (FBinding.GetObject = FHandler.Binding) then
    Result := FBinding
  else
  begin
    Result := TIdSocketHandlePeer.Create(FHandler.Binding);
    FBinding := Result;
  end;
end;

function TIdIOHandlerSocketPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdIOHandlerSocketPeer.GetObject: TObject;
begin
  Result := FHandler;
end;

{ TIdSocketHandlePeer }

constructor TIdSocketHandlePeer.Create(Handle: TIdSocketHandle);
begin
  FHandle := Handle;
end;

function TIdSocketHandlePeer.GetHandle: TIPStackSocketHandlePeer;
begin
  Result := FHandle.Handle;
end;

function TIdSocketHandlePeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdSocketHandlePeer.GetObject: TObject;
begin
  Result := FHandle;
end;

function TIdSocketHandlePeer.GetPeerIP: string;
begin
  Result := FHandle.PeerIP;
end;

function TIdSocketHandlePeer.GetPeerPort: TIPPortPeer;
begin
  Result := FHandle.PeerPort;
end;

function TIdSocketHandlePeer.GetPort: TIPPortPeer;
begin
  Result := FHandle.Port;
end;

procedure TIdSocketHandlePeer.SetPort(APort: TIPPortPeer);
begin
  FHandle.Port := APort;
end;

{ TIdSocketHandlesPeer }

function TIdSocketHandlesPeer.Add: IIPSocketHandle;
begin
  Result := TIdSocketHandlePeer.Create(FHandles.Add);
end;

constructor TIdSocketHandlesPeer.Create(Handles: TIdSocketHandles);
begin
  FHandles := Handles;
end;

function TIdSocketHandlesPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdSocketHandlesPeer.GetObject: TObject;
begin
  Result := FHandles;
end;

{ TIdSchedulerOfThreadPoolIP }

destructor TIdSchedulerOfThreadPoolIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdSchedulerOfThreadPoolPeer }

constructor TIdSchedulerOfThreadPoolPeer.Create(AOwner: TComponent);
begin
  FSchedulerOfThreadPool := TIdSchedulerOfThreadPoolIP.Create(AOwner);
  FSchedulerOfThreadPool.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdSchedulerOfThreadPoolPeer.Destroy;
begin
  if NeedToFree then
    FSchedulerOfThreadPool.Free;
  inherited;
end;

function TIdSchedulerOfThreadPoolPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdSchedulerOfThreadPoolPeer.GetMaxThreads: Integer;
begin
  Result := FSchedulerOfThreadPool.MaxThreads;
end;

function TIdSchedulerOfThreadPoolPeer.GetObject: TObject;
begin
  Result := FSchedulerOfThreadPool;
end;

function TIdSchedulerOfThreadPoolPeer.GetPoolSize: Integer;
begin
  Result := FSchedulerOfThreadPool.PoolSize;
end;

procedure TIdSchedulerOfThreadPoolPeer.SetMaxThreads(AMaxThreads: Integer);
begin
  FSchedulerOfThreadPool.MaxThreads := AMaxThreads;
end;

procedure TIdSchedulerOfThreadPoolPeer.SetPoolSize(APoolSize: Integer);
begin
  FSchedulerOfThreadPool.PoolSize := APoolSize;
end;

{ TIdSchedulerPeer }

constructor TIdSchedulerPeer.Create(Scheduler: TIdScheduler);
begin
  FScheduler := Scheduler;
end;

function TIdSchedulerPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdSchedulerPeer.GetObject: TObject;
begin
  Result := FScheduler;
end;

{ TIdTCPServerIP }

destructor TIdTCPServerIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdTCPServerPeer }

procedure TIdTCPServerPeer.LOnConnectEvent(AContext: TIdContext);
var
  LContext: IIPContext;
begin
  TMonitor.Enter(FContexts);
  try
    if FContexts.ContainsKey(AContext) then
      LContext := FContexts.Items[AContext]
    else
    begin
      LContext := TIdContextPeer.Create(AContext);
      FContexts.Add(AContext, LContext);
    end;
  finally
    TMonitor.Exit(FContexts);
  end;

  if Assigned(FOnConnectEvent) then
  begin
    FOnConnectEvent(LContext);
  end;
end;

procedure TIdTCPServerPeer.LOnDisconnectEvent(AContext: TIdContext);
var
  LContext: IIPContext;
begin
  TMonitor.Enter(FContexts);
  try
    LContext := FContexts.Items[AContext];
    FContexts.Remove(AContext);
  finally
    TMonitor.Exit(FContexts);
  end;

  if Assigned(FOnDisconnectEvent) then
  begin
    FOnDisconnectEvent(LContext);
  end;
end;

procedure TIdTCPServerPeer.LOnExecuteEvent(AContext: TIdContext);
var
  LContext: IIPContext;
begin
  if Assigned(FOnExecuteEvent) then
  begin
    TMonitor.Enter(FContexts);
    try
      LContext := FContexts.Items[AContext];
    finally
      TMonitor.Exit(FContexts);
    end;
    FOnExecuteEvent(LContext);
  end;
end;

constructor TIdTCPServerPeer.Create(AOwner: TComponent);
begin
  FScheduler := nil;
  FSocketHandles := nil;
  FServerIOHandler := nil;
  FContexts := TDictionary<TIdContext,IIPContext>.Create;
  FOnConnectEvent := nil;
  FOnDisconnectEvent := nil;
  FOnExecuteEvent := nil;
  FTCPServer := TIdTCPServerIP.Create(AOwner);
  FTCPServer.FSetDestroyedProc := SetDestroyed;
end;

destructor TIdTCPServerPeer.Destroy;
begin
  //Clear interface references (TODO: check order of nil'ing)
  FScheduler := nil;
  FSocketHandles := nil;
  FServerIOHandler := nil;
  FreeAndNil(FContexts);

  if NeedToFree then
    FTCPServer.Free;
  inherited;
end;

function TIdTCPServerPeer.GetActive: Boolean;
begin
  Result := FTCPServer.Active;
end;

function TIdTCPServerPeer.GetBindings: IIPSocketHandles;
begin
  if FTCPServer.Bindings = nil then
    Result := nil
  else if Assigned(FSocketHandles) and (FSocketHandles.GetObject = FTCPServer.Bindings) then
    Result := FSocketHandles
  else
  begin
    Result := TIdSocketHandlesPeer.Create(FTCPServer.Bindings);
    FSocketHandles := Result;
  end;
end;

function TIdTCPServerPeer.GetDefaultPort: TIPPortPeer;
begin
  Result := FTCPServer.DefaultPort;
end;

function TIdTCPServerPeer.GetIOHandler: IIPServerIOHandler;
begin
  if FTCPServer.IOHandler = nil then
    Result := nil
  else if Assigned(FServerIOHandler) and (FServerIOHandler.GetObject = FTCPServer.IOHandler) then
    Result := FServerIOHandler
  else
  begin
    if FTCPServer.IOHandler is TIdServerIOHandlerSSLOpenSSL then
      Result := TIdServerIOHandlerSSLOpenSSLPeer.Create(FTCPServer.IOHandler as TIdServerIOHandlerSSLOpenSSL)
    else
      Result := TIdServerIOHandlerPeer.Create(FTCPServer.IOHandler);
    FServerIOHandler := Result;
  end;
end;

function TIdTCPServerPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdTCPServerPeer.GetObject: TObject;
begin
  Result := FTCPServer;
end;

function TIdTCPServerPeer.GetOnConnect: TIPServerThreadEventPeer;
begin
  if Assigned(FTCPServer.OnConnect) then
    Result := FOnConnectEvent
  else
    Result := nil;
end;

function TIdTCPServerPeer.GetOnDisconnect: TIPServerThreadEventPeer;
begin
  if Assigned(FTCPServer.OnDisconnect) then
    Result := FOnDisconnectEvent
  else
    Result := nil;
end;

function TIdTCPServerPeer.GetOnExecute: TIPServerThreadEventPeer;
begin
  if Assigned(FTCPServer.OnExecute) then
    Result := FOnExecuteEvent
  else
    Result := nil;
end;

function TIdTCPServerPeer.GetScheduler: IIPScheduler;
begin
  if FTCPServer.Scheduler = nil then
    Result := nil
  else if Assigned(FScheduler) and (FScheduler.GetObject = FTCPServer.Scheduler) then
    Result := FScheduler
  else
  begin
    Result := TIdSchedulerPeer.Create(FTCPServer.Scheduler);
    FScheduler := Result;
  end;
end;

function TIdTCPServerPeer.GetUseNagle: Boolean;
begin
  Result := FTCPServer.UseNagle;
end;

procedure TIdTCPServerPeer.SetActive(Val: Boolean);
begin
  FTCPServer.Active := Val;
end;

procedure TIdTCPServerPeer.SetBindings(ABindings: IIPSocketHandles);
begin
  FTCPServer.Bindings := ABindings.GetObject as TIdSocketHandles;
  FSocketHandles := ABindings;
end;

procedure TIdTCPServerPeer.SetDefaultPort(port: TIPPortPeer);
begin
  FTCPServer.DefaultPort := port;
end;

procedure TIdTCPServerPeer.SetIOHandler(handler: IIPServerIOHandler);
begin
  FTCPServer.IOHandler := handler.GetObject as TIdServerIOHandler;
  FServerIOHandler := handler;
end;

procedure TIdTCPServerPeer.SetOnConnect(event: TIPServerThreadEventPeer);
begin
  FTCPServer.OnConnect := LOnConnectEvent;
  FOnConnectEvent := event;
end;

procedure TIdTCPServerPeer.SetOnDisconnect(event: TIPServerThreadEventPeer);
begin
  FTCPServer.OnDisconnect := LOnDisconnectEvent;
  FOnDisconnectEvent := event;
end;

procedure TIdTCPServerPeer.SetOnExecute(event: TIPServerThreadEventPeer);
begin
  FTCPServer.OnExecute := LOnExecuteEvent;
  FOnExecuteEvent := event;
end;

procedure TIdTCPServerPeer.SetScheduler(AScheduler: IIPScheduler);
begin
  FTCPServer.Scheduler := AScheduler.GetObject as TIdScheduler;
  FScheduler := AScheduler;
end;

procedure TIdTCPServerPeer.SetUseNagle(Use: Boolean);
begin
  FTCPServer.UseNagle := Use;
end;

function IPImpId: string;
begin
  Result := '';
end;

{ TIdClassIP }

procedure TIdClassIP.AfterConstruction;
begin
  inherited;
  FIsFreed := False;
end;

function TIdClassIP.NeedToFree: Boolean;
begin
  Result := not FIsFreed;
end;

procedure TIdClassIP.SetDestroyed;
begin
  FIsFreed := True;
end;

{ TIdSSLIOHandlerSocketOpenSSLIP }

destructor TIdSSLIOHandlerSocketOpenSSLIP.Destroy;
begin
  //Let Peer know that object is destroyed
  if Assigned(FSetDestroyedProc) then
    FSetDestroyedProc();
  inherited;
end;

{ TIdHTTPSessionPeer }

constructor TIdHTTPSessionPeer.Create(ASession: TIdHTTPSession);
begin
  FSession := ASession;
end;

function TIdHTTPSessionPeer.GetIPImplementationID: string;
begin
  Result := IPImpId;
end;

function TIdHTTPSessionPeer.GetObject: TObject;
begin
  Result := FSession;
end;

function TIdHTTPSessionPeer.GetSessionID: string;
begin
  Result := FSession.SessionID;
end;

{ TIPTestServerPeer }

constructor TIPTestServerPeer.TOnGetPassword.Create(const APassword: AnsiString);
begin
  FPassword := APassword;
end;

procedure TIPTestServerPeer.TOnGetPassword.OnGetPassword(var APassword: AnsiString);
begin
  APassword := FPassword;
end;

procedure TIPTestServerPeer.GetExtensionMimeType(
  const ADictionary: TDictionary<string, string>);
var
  LMimeTable: TMimeTable;
  I: Integer;
  LContentType, LExtension: string;
begin
  if ADictionary <> nil then
  begin
    LMimeTable := TMimeTable.Create(False);
    try
      LMimeTable.LoadTypesFromOS := False;
      LMimeTable.BuildCache;
      Assert(LMimeTable.FMIMEList.Count = LMimeTable.FFileExt.Count);
      for I := 0 to LMimeTable.FFileExt.Count - 1 do
      begin
        LExtension := LowerCase(Copy(LMimeTable.FFileExt[I], 2));
        LContentType := LowerCase(LMimeTable.FMIMEList[I]);
        if ADictionary.ContainsKey(LExtension) then
        begin
          // Ignore Duplicates
        end
        else
          ADictionary.Add(LExtension, LContentType);
      end;
    finally
      LMimeTable.Free;
    end;
  end;
end;

function TIPTestServerPeer.GetOpenPort: Integer;
var
  ServerSocket: TIdSocketHandle;
begin
  Result := 0;

  ServerSocket := TIdSocketHandle.Create(nil);
  ServerSocket.IP := '0.0.0.0';  { Id_INADDR_ANY }
  ServerSocket.Port := 0;
  try
    TIdStack.IncUsage;
    try
      ServerSocket.AllocateSocket;
      try
{$IFDEF POSIX}
        ServerSocket.SetSockOpt(Id_SOL_SOCKET, Id_SO_REUSEADDR, Id_SO_True);
{$ENDIF}
        ServerSocket.Bind;
        Result := ServerSocket.Port;
      finally
        ServerSocket.CloseSocket;
      end;
    finally
      TIdStack.DecUsage;
    end;
  except
  end;
end;

procedure TIPTestServerPeer.TestCertificateFiles(const APort: Integer;
  const ACertFileName, AKeyFileName, ARootCertFile: string;
  const AKeyFilePassword: AnsiString);
var
  IdHTTPServer1: TIdHTTPServer;
  IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
  IdHTTP1: TIdHTTP;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
  LOnGetPassword: TOnGetPassword;
  LStrings: TStrings;
begin
  IdHTTPServer1 :=nil;
  IdServerIOHandlerSSLOpenSSL1 :=nil;
  IdHTTP1 := nil;
  IdSSLIOHandlerSocketOpenSSL1 := nil;
  LOnGetPassword := nil;
  LStrings := nil;
  try
    IdHTTPServer1 := TIdHTTPServer.Create(nil);
    IdServerIOHandlerSSLOpenSSL1 := TIdServerIOHandlerSSLOpenSSL.Create(nil);
    IdHTTP1 := TIdHTTP.Create(nil);
    IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    LOnGetPassword := TOnGetPassword.Create(AKeyFilePassword);
    LStrings := TStringList.Create;

    IdHTTPServer1.IOHandler := IdServerIOHandlerSSLOpenSSL1;
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.CertFile := ACertFileName;
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.RootCertFile := ARootCertFile;
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.KeyFile := AKeyFileName;
    IdServerIOHandlerSSLOpenSSL1.OnGetPassword := LOnGetPassword.OnGetPassword;
    IdHTTPServer1.DefaultPort := APort;
    IdHTTPServer1.Active := True;

    IdHTTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdHTTP1.IOHandler.Port := APort;
    IdHTTP1.Post(Format('https://localhost:%d/abc', [APort]), LStrings)    // Do not localize
  finally
    IdHTTPServer1.Free;
    IdServerIOHandlerSSLOpenSSL1.Free;
    IdHTTP1.Free;
    IdSSLIOHandlerSocketOpenSSL1.Free;
    LStrings.Free;
    LOnGetPassword.Free;
  end;
end;

procedure TIPTestServerPeer.TestOpenPort(const APort: Integer; const AOnExecute: TIPServerThreadEventPeer);
var
  LPeer: IIPTCPServer;
  LServer: TIdTCPServer;
begin
  LPeer := TIdTCPServerPeer.Create(nil);
  LPeer.SetOnExecute(AOnExecute);
  LServer := LPeer.GetObject as TIdTCPServer;
  LServer.Bindings.DefaultPort := APort;
  LServer.Active := True;
  LServer.StartListening;
end;

initialization
  PeerFactory.RegisterPeer(IPImpId, IIPPeerProcs, TIdProc);
  PeerFactory.RegisterPeer(IPImpId, IIPStack, TIdStackPeer);

  PeerFactory.RegisterPeer(IPImpId, IIPHTTP, TIdHTTPPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPSSLIOHandlerSocketOpenSSL, TIdSSLIOHandlerSocketOpenSSLPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPTCPClient, TIdTCPClientPeerIP);
  PeerFactory.RegisterPeer(IPImpId, IIPBasicAuthentication, TIdBasicAuthenticationPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPX509, TIdX509Peer);

  //server specific peers
  PeerFactory.RegisterPeer(IPImpId, IIPServerIOHandlerSSLOpenSSL, TIdServerIOHandlerSSLOpenSSLPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPHTTPServer, TIdHTTPServerPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPSchedulerOfThreadPool, TIdSchedulerOfThreadPoolPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPTCPServer, TIdTCPServerPeer);
  PeerFactory.RegisterPeer(IPImpId, IIPTestServer, TIPTestServerPeer);

end.
