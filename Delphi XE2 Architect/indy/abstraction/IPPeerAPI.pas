{*******************************************************}
{                                                       }
{           Delphi Indy Abstraction Framework           }
{                                                       }
{ Copyright(c) 1995-2010 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

                                                                   

unit IPPeerAPI;

interface

uses
  SysUtils, RTTI, TypInfo, Classes, Generics.Collections, IPPeerResStrs;

const
  _IPPORT_HTTP    = 80;

type
  EIPPeerException = class(Exception);
  EIPAbstractError = class(EIPPeerException);
  EIPHTTPProtocolExceptionPeer = class(EIPPeerException)
  private
    FException: Exception;
    FErrorMsg: string;
    FErrorCode: Integer;
  public
    property ErrorMessage: string read FErrorMsg;
    property ErrorCode: Integer read FErrorCode;
    constructor Create(Ex: Exception; ErrorMsg, Msg: string; ErrorCode: Integer); overload;
  end;

  { Types }
  PX509Peer = Pointer;
  PRSAPeer = Pointer;
  PPByte = ^PByte;
  TIPTextEncodingPeer = SysUtils.TEncoding;
  TIPBytesPeer = TBytes;
  TIPPortPeer = Word;
  TIPC_INT = LongInt;
  TIPC_LONG = LongInt;
  TIPC_ULONG = LongWord;
  TIPHMACIntCtx = Pointer;
  TIPSSLULong = packed record
    case Byte of
      0: (B1, B2, B3, B4: Byte);
      1: (W1, W2: Word);
      2: (L1: Longint);
      3: (C1: LongWord);
  end;
  TIPHTTPOptionPeer = (hoInProcessAuth, hoKeepOrigProtocol, hoForceEncodeParams,
    hoNonSSLProxyUseConnectVerb, hoNoParseMetaHTTPEquiv, hoWaitForUnexpectedData);
  TIPHTTPOptionsPeer = set of TIPHTTPOptionPeer;
  TIPSSLVerifyModePeer = (sslvrfPeer, sslvrfFailIfNoPeerCert, sslvrfClientOnce);
  TIPSSLVerifyModeSetPeer = set of TIPSSLVerifyModePeer;

  { Server specific types }
  TIPSSLModePeer = (sslmUnassigned, sslmClient, sslmServer, sslmBoth);
  TIPSSLVersionPeer = (sslvSSLv2, sslvSSLv23, sslvSSLv3, sslvTLSv1);
  THTTPCommandTypePeer = (hcUnknown, hcHEAD, hcGET, hcPOST, hcDELETE, hcPUT, hcTRACE, hcOPTION);
  TSocket = NativeUInt;
  TIPStackSocketHandlePeer = TSocket;
  { end Server specific types }

  //Interfaces
  IIPPeerFactory = Interface
    ['{3FE74AEB-0FD1-495E-8527-D008EA2A06F4}']
  End;

  TIPPeerFactory = class(TInterfacedObject, IIPPeerFactory)
    type TPeerDictionary = TDictionary<TGUID, TClass>;
   strict private
    FImplDict: TDictionary<string, TPeerDictionary>;
  protected
    function ContainsPeer(const ImplementationID: string; const Key: TGUID): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function CreatePeer(const ImplementationID: string; const Key: TGUID): IInterface; overload;
    function CreatePeer(const ImplementationID: string; const Key: TGUID; AComponent: TComponent): IInterface; overload;
    function CreatePeer(const ImplementationID: string; const Key: TGUID; V1: Pointer; V2: Boolean): IInterface; overload;
    procedure RegisterPeer(const ImplementationID: string; const Key: TGUID; const ImplClass: TClass);
  end;

  IIPPeerProcs = Interface
    ['{DAE26801-CA52-43FD-9332-5CD951E3B756}']
    function RSA_PKCS1_PADDING: Integer;
    procedure _RSA_free(Ptr: PRSAPeer);
    function _RSA_generate_key(bits: TIPC_INT; e: TIPC_ULONG): PRSAPeer;
    function _i2d_RSAPublicKey(x:PRSAPeer; buf: PPByte): TIPC_INT;
    function _d2i_RSAPublicKey(pr: PRSAPeer; _in : PPByte; len : TIPC_INT): PRSAPeer;
    function _SSLLoad: Boolean;
    procedure _ERR_load_crypto_strings;
    procedure _OpenSSL_add_all_ciphers;
    function _RSA_size(key: PRSAPeer): TIPC_INT;
    function _RSA_private_decrypt(flen: TIPC_INT; from: PByte; _to: PByte; rsa: PRSAPeer; padding: TIPC_INT): TIPC_INT;
    function _RSA_public_encrypt(flen: TIPC_INT; from: PByte; _to: PByte; rsa: PRSAPeer; padding: TIPC_INT): TIPC_INT;
    function _ERR_error_string(e: TIPC_ULONG; buf: PAnsiChar): PAnsiChar;
    function _ERR_get_error: TIPC_ULONG;
    function _d2i_X509(pr: PX509Peer; _in: PPByte; len: TIPC_INT): PX509Peer;
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
  End;

  IIPObject = Interface
    ['{30FB4EF1-6942-47F9-8ECB-5E2454CE3ED7}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  IIPStack = Interface
    ['{02945AA3-4EF1-4B58-BA30-675AB8C69705}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    procedure SetKeepAliveValues(ASocket: TIPStackSocketHandlePeer;
      const AEnabled: Boolean; const ATimeMS, AInterval: Integer);
  End;

  IIPURI = Interface
    ['{E0125434-B354-482C-BD99-7E61623721FF}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function URLEncode(const ASrc: string; AByteEncoding: TIPTextEncodingPeer = nil): string;
  End;

  IIPBuffer = Interface
    ['{CF9F94FB-390C-486A-A89D-322C6F3162D9}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetSize: Integer;
    property Size: Integer read GetSize;
  End;

  IIPSSLOptions = Interface
    ['{D5E0819E-C612-46E5-971C-4D1A3412C430}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetVerifyMode: TIPSSLVerifyModeSetPeer;
    procedure SetVerifyMode(mode: TIPSSLVerifyModeSetPeer);
    property VerifyMode: TIPSSLVerifyModeSetPeer read GetVerifyMode write SetVerifyMode;
    function GetCertFile: string;
    procedure SetCertFile(ctfile: string);
    property CertFile: string read GetCertFile write SetCertFile;
    function GetKeyFile: string;
    procedure SetKeyFile(kfile: string);
    property KeyFile: string read GetKeyFile write SetKeyFile;
    function GetRootCertFile: string;
    procedure SetRootCertFile(rootfile: string);
    property RootCertFile: string read GetRootCertFile write SetRootCertFile;
    function GetMode: TIPSSLModePeer;
    procedure SetMode(mode: TIPSSLModePeer);
    property Mode: TIPSSLModePeer read GetMode write SetMode;
    function GetMethod: TIPSSLVersionPeer;
    procedure SetMethod(method: TIPSSLVersionPeer);
    property Method: TIPSSLVersionPeer read GetMethod write SetMethod;
  End;

  IIPSocketHandle = Interface;

  IIPIOHandler = Interface
    ['{ADB82592-F88C-4762-A266-EED3288E917D}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    procedure Close;
    function ReadByte: Byte;
    function GetInputBuffer: IIPBuffer;
    property InputBuffer: IIPBuffer read GetInputBuffer;
    procedure ReadBytes(var VBuffer: TIPBytesPeer; AByteCount: Integer; AAppend: Boolean = True);
    procedure Write(const ABuffer: TIPBytesPeer; const ALength: Integer = -1; const AOffset: Integer = 0);
    function CheckForDataOnSource(ATimeout: Integer = 0): Boolean;
    function Connected: Boolean;
  End;

  IIPIOHandlerSocket = Interface(IIPIOHandler)
    ['{9B355D35-E331-437E-B787-7BE90943DA0F}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetBinding: IIPSocketHandle;
    property Binding: IIPSocketHandle read GetBinding;
  End;

  IIPIOHandlerStack = Interface(IIPIOHandlerSocket)
    ['{3B32976F-4977-4759-8C68-F91A60E7F0BB}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  IIPSSLIOHandlerSocketBase = Interface(IIPIOHandlerStack)
    ['{2A97E6B9-6FBB-46DA-BB9C-1C31A0FD5644}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetPassThrough: Boolean;
    procedure SetPassThrough(pass: Boolean);
    property PassThrough: Boolean read GetPassThrough write SetPassThrough;
  End;

  IIPX509 = Interface;
  TVerifyPeerEventPeer  = function(Certificate: IIPX509; AOk: Boolean; ADepth, AError: Integer): Boolean of object;
  IIPSSLIOHandlerSocketOpenSSL = Interface(IIPSSLIOHandlerSocketBase)
    ['{19D164A0-81B6-4535-9889-F178486EFEFA}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetOnVerifyPeer: TVerifyPeerEventPeer;
    procedure SetOnVerifyPeer(OnVerify: TVerifyPeerEventPeer);
    property OnVerifyPeer: TVerifyPeerEventPeer read GetOnVerifyPeer write SetOnVerifyPeer;
    function GetSSLOptions: IIPSSLOptions;
    procedure SetSSLOptions(options: IIPSSLOptions);
    property SSLOptions: IIPSSLOptions read GetSSLOptions write SetSSLOptions;
  End;

  IIPHeaderList = Interface
    ['{A29972BC-E366-4755-A4E8-A32A4FCB60DC}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    procedure AddValue(const AName, AValue: string);
    function GetFoldLines: Boolean;
    procedure SetFoldLines(Val: Boolean);
    property FoldLines: Boolean read GetFoldLines write SetFoldLines;
    function GetValue(const Name: string): string;
    procedure SetValue(const Name: string; Val: string);
    function Add(const S: string): Integer;
    property Values[const Name: string]: string read GetValue write SetValue;
    procedure Clear;
    function IndexOfName(const AName: string): Integer;
    function GetCount: Integer;
    property Count: Integer read GetCount;
    function GetName(Index: Integer): string;
    property Names[Index: Integer]: string read GetName;
  End;

  IIPAuthentication = Interface
    ['{DFDC8E65-FB15-4BD8-8317-8F4AF78A30C8}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetUserName: string;
    procedure SetUsername(user: string);
    property Username: string read GetUserName write SetUserName;
    function GetPassword: string;
    procedure SetPassword(pass: string);
    property Password: string read GetPassword write SetPassword;
  End;

  IIPEntityHeaderInfo = Interface
    ['{98EE87B9-2E96-4AFD-B857-03C5F7011E59}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetContentType: string;
    procedure SetContentType(LContentType: string);
    property ContentType: string read GetContentType write SetContentType;
    function GetContentLanguage: string;
    procedure SetContentLanguage(LContentLanguage: string);
    property ContentLanguage: string read GetContentLanguage write SetContentLanguage;
    function GetContentEncoding: string;
    procedure SetContentEncoding(LContentEncoding: string);
    property ContentEncoding: string read GetContentEncoding write SetContentEncoding;
    function GetContentRangeEnd: Int64;
    procedure SetContentRangeEnd(LContentRangeEnd: Int64);
    property ContentRangeEnd: Int64 read GetContentRangeEnd write SetContentRangeEnd;
    function GetContentRangeStart: Int64;
    procedure SetContentRangeStart(LContentRangeStart: Int64);
    property ContentRangeStart: Int64 read GetContentRangeStart write SetContentRangeStart;
    function GetContentVersion: string;
    procedure SetContentVersion(LContentVersion: string);
    property ContentVersion: string read GetContentVersion write SetContentVersion;
    function GetContentLength: Int64;
    procedure SetContentLength(LContentLength: Int64);
    property ContentLength: Int64 read GetContentLength write SetContentLength;
    function GetCustomHeaders: IIPHeaderList;
    property CustomHeaders: IIPHeaderList read GetCustomHeaders;
    function GetRawHeaders: IIPHeaderList;
    property RawHeaders: IIPHeaderList read GetRawHeaders;
    function GetPragma: string;
    procedure SetPragma(Val: string);
    property Pragma: string read GetPragma write SetPragma;
    function GetConnection: string;
    procedure SetConnection(conn: string);
    property Connection: string read GetConnection write SetConnection;
    function GetCharSet: string;
    procedure SetCharSet(Val: string);
    property CharSet: string read GetCharSet write SetCharSet;
    function GetLastModified: TDateTime;
    procedure SetLastModified(dt: TDateTime);
    property LastModified: TDateTime read GetLastModified write SetLastModified;
    function GetDate: TDateTime;
    procedure SetDate(LDate: TDateTime);
    property Date: TDateTime read GetDate write SetDate;
    function GetETag: string;
    procedure SetETag(LETag: string);
    property ETag: string read GetETag write SetETag;
  End;

  IIPHTTPRequest = Interface(IIPEntityHeaderInfo)
    ['{39633B1B-96D4-4178-ABC2-11B2CE5496B0}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetAuthentication: IIPAuthentication;
    procedure SetAuthentication(auth: IIPAuthentication);
    property Authentication: IIPAuthentication read GetAuthentication write SetAuthentication;
    function GetAccept: string;
    procedure SetAccept(Val: string);
    property Accept: String read GetAccept write SetAccept;
  End;

  IIPHTTPResponse = Interface(IIPEntityHeaderInfo)
    ['{03EDCF40-C924-4932-A5C9-37A1E14FDFD8}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetResponseText: string;
    procedure SetResponseText(LResponseText: string);
    property ResponseText: string read GetResponseText write SetResponseText;
  End;

  IIPProxyConnectionInfo = Interface
    ['{C4DCD800-5288-468F-9496-8D1821E8458A}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetProxyPort: Integer;
    procedure SetProxyPort(Val: Integer);
    property ProxyPort: Integer read GetProxyPort write SetProxyPort;
    function GetProxyServer: string;
    procedure SetProxyServer(Val: string);
    property ProxyServer: string read GetProxyServer write SetProxyServer;
    function GetProxyUserName: string;
    procedure SetProxyUserName(user: string);
    property ProxyUserName: string read GetProxyUserName write SetProxyUserName;
    function GetProxyPassword: string;
    procedure SetProxyPassword(pass: string);
    property ProxyPassword: string read GetProxyPassword write SetProxyPassword;
    function GetBasicAuthentication: Boolean;
    procedure SetBasicAuthentication(Val: Boolean);
    property BasicAuthentication: Boolean read GetBasicAuthentication write SetBasicAuthentication;
  End;

  IIPTCPConnection = Interface
    ['{EB5DB0CE-3D5B-43F1-B214-95AE3E1548AD}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function Connected: Boolean;
    function GetIOHandler: IIPIOHandler;
    procedure SetIOHandler(Handler: IIPIOHandler);
    property IOHandler: IIPIOHandler read GetIOHandler write SetIOHandler;
    procedure Disconnect;
    function GetSocket: IIPIOHandlerSocket;
    property Socket: IIPIOHandlerSocket read GetSocket;
    function GetManagedIOHandler: Boolean;
    procedure SetManagedIOHandler(AManagedIOHandler: Boolean);
    property ManagedIOHandler: Boolean read GetManagedIOHandler write SetManagedIOHandler;
  End;

  IIPTCPClientCustom = Interface(IIPTCPConnection)
    ['{2C0539B1-2733-4E17-A71C-991D62C98B8E}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  IIPHTTP = Interface(IIPTCPClientCustom)
    ['{B8BD5BD8-C39D-4DF1-BB14-625FC86029DB}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetProtocol: string;
    procedure SetProtocol(Protocol: string);
    property Protocol: string read GetProtocol write SetProtocol;
    function GetResponseCode: Integer;
    property ResponseCode: Integer read GetResponseCode;
    function GetResponseText: string;
    property ResponseText: string read GetResponseText;
    function GetResponse: IIPHTTPResponse;
    property Response: IIPHTTPResponse read GetResponse;
    function GetRequest: IIPHTTPRequest;
    property Request: IIPHTTPRequest read GetRequest;
    procedure FreeIOHandler;
    function GetProxyParams: IIPProxyConnectionInfo;
    procedure SetProxyParams(const Value: IIPProxyConnectionInfo);
    property ProxyParams: IIPProxyConnectionInfo read GetProxyParams write SetProxyParams;
    function GetHTTPOptions: TIPHTTPOptionsPeer;
    procedure SetHTTPOptions(Options: TIPHTTPOptionsPeer);
    property HTTPOptions: TIPHTTPOptionsPeer read GetHTTPOptions write SetHTTPOptions;
    procedure DoRequestMethod(AMethod: string; URL: string; Source, ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
    procedure DoRequestDelete(URL: string; Source, ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
    procedure DoRequestHead(URL: string; Source, ResponseContent: TStream; AIgnoreReplies: array of SmallInt);
    function DoGet(AURL: string): string; overload;
    function DoGet(AURL: string; AResponseContent: TStream): string; overload;
    function DoPost(AURL: string; Source: TStream): string; overload;
    function DoPost(AURL: string; Source: TStrings): string; overload;
    procedure DoPost(AURL: string; ASource, AResponseContent: TStream); overload;
    function DoPut(AURL: string; Source: TStream): string; overload;
    procedure DoPut(AURL: string; ASource, AResponseContent: TStream); overload;
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    property UseNagle: Boolean read GetUseNagle write SetUseNagle;
    function GetConnectTimeout: Integer;
    procedure SetConnectTimeout(timeout: Integer);
    property ConnectTimeout: Integer read GetConnectTimeout write SetConnectTimeout;
    function GetReadTimeout: Integer;
    procedure SetReadTimeout(timeout: Integer);
    property ReadTimeout: Integer read GetReadTimeout write SetReadTimeout;
    function GetURL: IIPURI;
    property URL: IIPURI read GetURL;
  End;

  IIPTCPClient = Interface(IIPTCPClientCustom)
    ['{9BB0BE5C-9D9E-485E-803D-999645CE1B8F}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetBoundIP: string;
    procedure SetBoundIP(IP: string);
    property BoundIP: string read GetBoundIP write SetBoundIP;
    function GetHost: string;
    procedure SetHost(LHost: string);
    property Host: string read GetHost write SetHost;
    function GetPort: TIPPortPeer;
    procedure SetPort(LPort: TIPPortPeer);
    property Port: TIPPortPeer read GetPort write SetPort;
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    property UseNagle: Boolean read GetUseNagle write SetUseNagle;
    procedure Connect;
    function GetManagedIOHandler: Boolean;
    procedure SetManagedIOHandler(AManagedIOHandler: Boolean);
  End;

  IIPX509Name = Interface
    ['{F3DC885A-07C9-42F5-A07B-92E95BDAFEB0}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetHash: TIPSSLULong;
    property Hash: TIPSSLULong read GetHash;
    function GetOneLine: string;
    property OneLine: string read GetOneLine;
  End;

  IIPX509SigInfo = Interface
    ['{A93FF0DD-7E16-48E9-A0FC-6CF0AFDB19B3}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetSigTypeAsString: string;
    property SigTypeAsString: string read GetSigTypeAsString;
    function GetSignature: string;
    property Signature: string read GetSignature;
  End;

  IIPX509 = Interface
    ['{4B101B6D-9C18-4579-A381-0F238A01CC18}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetNotAfter: TDateTime;
    property notAfter: TDateTime read GetNotAfter;
    function GetNotBefore: TDateTime;
    property notBefore: TDateTime read GetNotBefore;
    function GetIssuer: IIPX509Name;
    property Issuer: IIPX509Name read GetIssuer;
    function GetSubject: IIPX509Name;
    property Subject: IIPX509Name read GetSubject;
    function GetSerialNumber: string;
    property SerialNumber: string read GetSerialNumber;
    function GetSigInfo: IIPX509SigInfo;
    property SigInfo: IIPX509SigInfo read GetSigInfo;
    function GetVersion: TIPC_LONG;
    property Version: TIPC_LONG read GetVersion;
  End;

  IIPBasicAuthentication = Interface(IIPAuthentication)
    ['{B44903AF-A307-47D5-AA2C-6C7967741C9D}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  IIPHashMessageDigest5 = Interface
    ['{DF4F2321-EAC7-4D69-A290-8E0303627C6B}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function HashBytesAsHex(const ASrc: TIPBytesPeer): String;
  End;

  { Server specific interfaces }
  IIPTask = Interface
    ['{86E02B92-FE6E-4270-AD67-3BA5EC0DC17D}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetData: TObject;
    procedure SetData(obj: TObject);
    property Data: TObject read GetData write SetData;
  End;

  IIPContext = Interface(IIPTask)
    ['{8606D1C2-A4A1-4A44-974C-873294194710}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetConnection: IIPTCPConnection;
    property Connection: IIPTCPConnection read GetConnection;
  End;

  IIPServerIOHandler = Interface
    ['{86AAE104-1DFD-42BF-9413-80924AD69E0D}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  IIPServerIOHandlerSSLBase = Interface(IIPServerIOHandler)
    ['{7096171F-E11C-42F1-9EA4-63B518707918}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  TPasswordEventPeer  = procedure(var Password: AnsiString) of object;
  IIPServerIOHandlerSSLOpenSSL = Interface(IIPServerIOHandlerSSLBase)
    ['{1DAC20E8-A925-409F-AD04-5E7F34DAA838}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetSSLOptions: IIPSSLOptions;
    property SSLOptions: IIPSSLOptions read GetSSLOptions;
    function GetOnGetPassword: TPasswordEventPeer;
    procedure SetOnGetPassword(event: TPasswordEventPeer);
    property OnGetPassword: TPasswordEventPeer read GetOnGetPassword write SetOnGetPassword;
  End;

  IIPRequestHeaderInfo = Interface(IIPEntityHeaderInfo)
    ['{669C7234-B3D3-4DF4-8A1F-4A5DA39AD3AF}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetAccept: string;
    procedure SetAccept(Val: string);
    property Accept: string read GetAccept write SetAccept;
    function GetUserAgent: string;
    procedure SetUserAgent(agent: string);
    property UserAgent: string read GetUserAgent write SetUserAgent;
  End;

  IIPHTTPSession = Interface
  ['{ECE3C261-E15E-4526-80FE-1E99D4B96106}']
    function GetSessionID: string;
    property SessionID: string read GetSessionID;
  End;

  IIPHTTPRequestInfo = Interface(IIPRequestHeaderInfo)
    ['{02280AAE-0D78-435D-B962-9A47E84F9D8A}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetSession: IIPHTTPSession;
    property Session: IIPHTTPSession read GetSession;
    function GetAuthPassword: string;
    property AuthPassword: string read GetAuthPassword;
    function GetAuthUsername: string;
    property AuthUsername: string read GetAuthUsername;
    function GetCommand: string;
    property Command: string read GetCommand;
    function GetCommandType: THTTPCommandTypePeer;
    property CommandType: THTTPCommandTypePeer read GetCommandType;
    function GetDocument: string;
    procedure SetDocument(doc: string);
    property Document: string read GetDocument write SetDocument;
    function GetParams: TStrings;
    property Params: TStrings read GetParams;
    function GetPostStream: TStream;
    procedure SetPostStream(ps: TStream);
    property PostStream: TStream read GetPostStream write SetPostStream;
    function GetRemoteIP: string;
    property RemoteIP: string read GetRemoteIP;
    function GetURI: string;
    property URI: string read GetURI;
    function GetVersion: string;
    property Version: string read GetVersion;
  End;

  IIPResponseHeaderInfo = Interface(IIPEntityHeaderInfo)
    ['{884397D2-D332-40BA-823E-1B100C0499D9}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetWWWAuthenticate: IIPHeaderList;
    procedure SetWWWAuthenticate(wwwAuth: IIPHeaderList);
    property WWWAuthenticate: IIPHeaderList read GetWWWAuthenticate write SetWWWAuthenticate;
  End;

  IIPHTTPResponseInfo = Interface(IIPResponseHeaderInfo)
    ['{BBBAA4A7-C28B-4128-B21C-B1437FB3A57F}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetAuthRealm: string;
    procedure SetAuthRealm(realm: string);
    property AuthRealm: string read GetAuthRealm write SetAuthRealm;
    function GetCloseConnection: Boolean;
    procedure SetCloseConnection(closeConn: Boolean);
    property CloseConnection: Boolean read GetCloseConnection write SetCloseConnection;
    function GetContentStream: TStream;
    procedure SetContentStream(content: TStream);
    property ContentStream: TStream read GetContentStream write SetContentStream;
    function GetContentText: string;
    procedure SetContentText(text: string);
    property ContentText: string read GetContentText write SetContentText;
    function GetFreeContentStream: Boolean;
    procedure SetFreeContentStream(Val: Boolean);
    property FreeContentStream: Boolean read GetFreeContentStream write SetFreeContentStream;
    function GetResponseNo: Integer;
    procedure SetResponseNo(Num: Integer);
    property ResponseNo: Integer read GetResponseNo write SetResponseNo;
    function GetResponseText: string;
    procedure SetResponseText(text: string);
    property ResponseText: string read GetResponseText write SetResponseText;
    function GetHeaderHasBeenWritten: Boolean;
    procedure SetHeaderHasBeenWritten(Val: Boolean);
    property HeaderHasBeenWritten: Boolean read GetHeaderHasBeenWritten write SetHeaderHasBeenWritten;
    procedure WriteHeader;
    procedure WriteContent;
  End;

  IIPSocketHandle = Interface
    ['{542114D6-53EA-4EBC-82CF-BA0C81024660}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetPort: TIPPortPeer;
    procedure SetPort(APort: TIPPortPeer);
    property Port: TIPPortPeer read GetPort write SetPort;
    function GetHandle: TIPStackSocketHandlePeer;
    property Handle: TIPStackSocketHandlePeer read GetHandle;
    function GetPeerIP: string;
    property PeerIP: string read GetPeerIP;
    function GetPeerPort: TIPPortPeer;
    property PeerPort: TIPPortPeer read GetPeerPort;
  End;

  IIPSocketHandles = Interface
    ['{E9ADA63C-3488-4E2F-9FBC-95B77D743EA0}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function Add: IIPSocketHandle;
  End;

  IIPScheduler = Interface
    ['{D8438597-7E6C-4391-AA46-7461A8D4DFCF}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  IIPSchedulerOfThread = Interface(IIPScheduler)
    ['{30111A7A-6DE1-4226-B89D-25BCE9B0C948}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetMaxThreads: Integer;
    procedure SetMaxThreads(AMaxThreads: Integer);
    property MaxThreads: Integer read GetMaxThreads write SetMaxThreads;
  End;

  IIPSchedulerOfThreadPool = Interface(IIPSchedulerOfThread)
    ['{B13D508C-4086-436C-8AD9-12B35357D459}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetPoolSize: Integer;
    procedure SetPoolSize(APoolSize: Integer);
    property PoolSize: Integer read GetPoolSize write SetPoolSize;
  End;

  TIPServerThreadEventPeer = procedure(AContext: IIPContext) of object;

  IIPTestServer = Interface
    ['{46682F3B-9FC8-4ED2-8D75-89849A685875}']
    function GetOpenPort: Integer;
    procedure TestOpenPort(const APort: Integer; const AOnExecute: TIPServerThreadEventPeer);
    procedure TestCertificateFiles
      (const APort: Integer; const ACertFileName, AKeyFileName, ARootCertFile: string;
      const AKeyFilePassword: AnsiString);
    procedure GetExtensionMimeType(const ADictionary: TDictionary<string,string>);
  End;

  IIPCustomTCPServer = Interface
    ['{2CF0128C-5F38-4F66-BC22-148C6AFF731C}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetActive: Boolean;
    procedure SetActive(Val: Boolean);
    property Active: Boolean read GetActive write SetActive;
    function GetDefaultPort: TIPPortPeer;
    procedure SetDefaultPort(port: TIPPortPeer);
    property DefaultPort: TIPPortPeer read GetDefaultPort write SetDefaultPort;
    function GetIOHandler: IIPServerIOHandler;
    procedure SetIOHandler(handler: IIPServerIOHandler);
    property IOHandler: IIPServerIOHandler read GetIOHandler write SetIOHandler;
    function GetOnConnect: TIPServerThreadEventPeer;
    procedure SetOnConnect(event: TIPServerThreadEventPeer);
    property OnConnect: TIPServerThreadEventPeer read GetOnConnect write SetOnConnect;
    function GetOnDisconnect: TIPServerThreadEventPeer;
    procedure SetOnDisconnect(event: TIPServerThreadEventPeer);
    property OnDisconnect: TIPServerThreadEventPeer read GetOnDisconnect write SetOnDisconnect;
    function GetOnExecute: TIPServerThreadEventPeer;
    procedure SetOnExecute(event: TIPServerThreadEventPeer);
    property OnExecute: TIPServerThreadEventPeer read GetOnExecute write SetOnExecute;
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    property UseNagle: Boolean read GetUseNagle write SetUseNagle;
    function GetBindings: IIPSocketHandles;
    procedure SetBindings(ABindings: IIPSocketHandles);
    property Bindings: IIPSocketHandles read GetBindings write SetBindings;
    function GetScheduler: IIPScheduler;
    procedure SetScheduler(AScheduler: IIPScheduler);
    property Scheduler: IIPScheduler read GetScheduler write SetScheduler;
  End;

  IIPTCPServer = Interface(IIPCustomTCPServer)
    ['{EA8DE2F9-9055-4073-8118-437283DC02D6}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
  End;

  TIPHTTPCommandEventPeer = procedure(AContext: IIPContext;
    ARequestInfo: IIPHTTPRequestInfo; AResponseInfo: IIPHTTPResponseInfo) of object;

  IIPHTTPServer = Interface(IIPCustomTCPServer)
    ['{D8568F50-B792-4516-8B0B-4E3EB8868194}']
    function GetObject: TObject;
    function GetIPImplementationID: string;
    function GetUseNagle: Boolean;
    procedure SetUseNagle(Use: Boolean);
    property UseNagle: Boolean read GetUseNagle write SetUseNagle;
    function GetKeepAlive: Boolean;
    procedure SetKeepAlive(keep: Boolean);
    property KeepAlive: Boolean read GetKeepAlive write SetKeepAlive;
    function GetServerSoftware: string;
    procedure SetServerSoftware(software: string);
    property ServerSoftware: string read GetServerSoftware write SetServerSoftware;
    function GetOnCommandGet: TIPHTTPCommandEventPeer;
    procedure SetOnCommandGet(commandGet: TIPHTTPCommandEventPeer);
    property OnCommandGet: TIPHTTPCommandEventPeer read GetOnCommandGet write SetOnCommandGet;
    function GetOnCommandOther: TIPHTTPCommandEventPeer;
    procedure SetOnCommandOther(commandOther: TIPHTTPCommandEventPeer);
    property OnCommandOther: TIPHTTPCommandEventPeer read GetOnCommandOther write SetOnCommandOther;
  End;
  { end of server specific interfaces }


function PeerFactory: TIPPeerFactory;
function IPProcs(const ImplementationID: string = ''): IIPPeerProcs;
function GStackPeers(const ImplementationID: string = ''): IIPStack;

var
  GStackPeer: IIPStack = nil; //deprecated

implementation

var
  FPeerFactory: IIPPeerFactory;

const
  sDefaultIndy = 'IndyPeerImpl';

function UpdateImplementationID(const ImplementationID: string): string;
begin
  if UpperCase(ImplementationID) = UpperCase(sDefaultIndy) then
    Result := ''
  else
    Result := ImplementationID;
end;

function GStackPeers(const ImplementationID: string = ''): IIPStack;
begin
  Result := nil;
  if PeerFactory.ContainsPeer(UpdateImplementationID(ImplementationID), IIPStack) then
    Supports(PeerFactory.CreatePeer(UpdateImplementationID(ImplementationID), IIPStack), IIPStack, Result);
  GStackPeer := Result; //should be removed when we can remove GStackPeer
end;

function IPProcs(const ImplementationID: string = ''): IIPPeerProcs;
begin
  if not PeerFactory.ContainsPeer(UpdateImplementationID(ImplementationID), IIPPeerProcs) then
    raise EIPAbstractError.Create(sIPProcsNotDefined);

  if not Supports(PeerFactory.CreatePeer(UpdateImplementationID(ImplementationID), IIPPeerProcs), IIPPeerProcs, Result) then
    raise EIPAbstractError.Create(sIPProcNotSupported);
end;

function PeerFactory: TIPPeerFactory;
begin
  if not Assigned(FPeerFactory) then
    FPeerFactory := TIPPeerFactory.Create;
  Result := TIPPeerFactory(FPeerFactory);
end;

{ TIPPeerFactory }

function TIPPeerFactory.ContainsPeer(const ImplementationID: string; const Key: TGUID): Boolean;
begin
  Result := False;
  if FImplDict.ContainsKey(ImplementationID) then
    Result := FImplDict.Items[ImplementationID].ContainsKey(Key);
end;

constructor TIPPeerFactory.Create;
begin
  FImplDict := TObjectDictionary<string,TPeerDictionary>.Create([doOwnsValues]);
end;

function TIPPeerFactory.CreatePeer(const ImplementationID: string; const Key: TGUID;
  V1: Pointer; V2: Boolean): IInterface;
var
  Clazz: TClass;
  RContext: TRttiContext;
  RType: TRttiType;
  Val: TValue;
  LId: string;
begin
  Result := nil;
  LId := UpdateImplementationID(ImplementationID);
  if not ContainsPeer(LId, Key) then
  begin
    if LId = '' then
      raise EIPAbstractError.Create(Format(sIPPeerNotRegisteredDefault, [GuidToString(Key)]))
    else
      raise EIPAbstractError.Create(Format(sIPPeerNotRegisteredID, [GuidToString(Key), LId]));
  end;
//  Clazz := FObjectDict.Items[Key];
  Clazz := FImplDict.Items[LId].Items[Key];
  if Assigned(Clazz) then
  begin
    RContext := TRttiContext.Create;
    RType := RContext.GetType(Clazz);
    Val := RType.GetMethod('Create').Invoke(RType.AsInstance.MetaclassType,
      [V1, V2]);
    if not Supports(Val.AsObject, IInterface, Result) then
      raise EIPAbstractError.Create(Format(sPeerCreationFailed, [GUIDToString(Key), LId]));
  end
  else
    raise EIPAbstractError.Create(Format(sPeerCreationFailed, [GUIDToString(Key), LId]));
end;

function TIPPeerFactory.CreatePeer(const ImplementationID: string; const Key: TGUID): IInterface;
var
  Clazz: TClass;
  RContext: TRttiContext;
  RType: TRttiType;
  Val: TValue;
  LId: string;
begin
  Result := nil;
  LId := UpdateImplementationID(ImplementationID);
  if not ContainsPeer(LId, Key) then
  begin
    if LId = '' then
      raise EIPAbstractError.Create(Format(sIPPeerNotRegisteredDefault, [GuidToString(Key)]))
    else
      raise EIPAbstractError.Create(Format(sIPPeerNotRegisteredID, [GuidToString(Key), LId]));
  end;
  Clazz := FImplDict.Items[LId].Items[Key];
  if Assigned(Clazz) then
  begin
    RContext := TRttiContext.Create;
    RType := RContext.GetType(Clazz);
    Val := RType.GetMethod('Create').Invoke(RType.AsInstance.MetaclassType,
      []);
    if not Supports(Val.AsObject, IInterface, Result) then
      raise EIPAbstractError.Create(Format(sPeerCreationFailed, [GuidToString(Key), LId]));
  end
  else
    raise EIPAbstractError.Create(Format(sPeerCreationFailed, [GUIDToString(Key), LId]));
end;

destructor TIPPeerFactory.Destroy;
begin
  FreeAndNil(FImplDict);
  inherited;
end;

function TIPPeerFactory.CreatePeer(const ImplementationID: string; const Key: TGUID;
  AComponent: TComponent): IInterface;
var
  Clazz: TClass;
  RContext: TRttiContext;
  RType: TRttiType;
  Val: TValue;
  LId: string;
begin
  Result := nil;
  LId := UpdateImplementationID(ImplementationID);
  if not ContainsPeer(LId, Key) then
  begin
    if LId = '' then
      raise EIPAbstractError.Create(Format(sIPPeerNotRegisteredDefault, [GuidToString(Key)]))
    else
      raise EIPAbstractError.Create(Format(sIPPeerNotRegisteredID, [GuidToString(Key), LId]));
  end;
  Clazz := FImplDict.Items[LId].Items[Key];
  if Assigned(Clazz) then
  begin
    RContext := TRttiContext.Create;
    RType := RContext.GetType(Clazz);
    Val := RType.GetMethod('Create').Invoke(RType.AsInstance.MetaclassType,
      [AComponent]);
    if not Supports(Val.AsObject, IInterface, Result) then
      raise EIPAbstractError.Create(Format(sPeerCreationFailed, [GuidToString(Key), LId]));
  end
  else
    raise EIPAbstractError.Create(Format(sPeerCreationFailed, [GUIDToString(Key), LId]));
end;

procedure TIPPeerFactory.RegisterPeer(const ImplementationID: string; const Key: TGUID;
  const ImplClass: TClass);
var
  LPeerDict: TPeerDictionary;
begin
  if UpperCase(ImplementationID) = UpperCase(sDefaultIndy) then
    raise EIPAbstractError.Create(Format(sPeerReservedID, [sDefaultIndy]));

  if FImplDict.ContainsKey(ImplementationID) then
    LPeerDict := FImplDict.Items[ImplementationID]
  else
  begin
    LPeerDict := TPeerDictionary.Create;
    FImplDict.Add(ImplementationID, LPeerDict);
  end;
  LPeerDict.Add(Key, ImplClass);
end;

{ EIdHTTPProtocolExceptionPeer }

constructor EIPHTTPProtocolExceptionPeer.Create(Ex: Exception; ErrorMsg,
  Msg: string; ErrorCode: Integer);
begin
  FException := Ex;
  FErrorMsg := ErrorMsg;
  Self.Message := Msg;
  FErrorCode := ErrorCode;
end;

end.
