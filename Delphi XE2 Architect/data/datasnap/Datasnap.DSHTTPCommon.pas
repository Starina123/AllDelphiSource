{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSHTTPCommon;

interface

uses
  System.Classes,
  Data.DBXCommon,
  Data.DbxDatasnap,
  Data.DBXJSON,
  Data.DBXJSONReflect,
  Data.DBXPlatform,
  Data.DBXTransport,
  Datasnap.DSAuth,
  Datasnap.DSCommonServer,
  Datasnap.DSServer,
  Datasnap.DSService,
  Datasnap.DSTransport,
  System.Generics.Collections,
  System.SysUtils;

type

  ///  <summary> HTTP command types processed by DataSnap
  ///  </summary>
  TDSHTTPCommandType = (hcUnknown, hcGET, hcPOST, hcDELETE, hcPUT, hcOther);

  ///  <summary>Abstract DataSnap HTTP Context
  ///  </summary>
  TDSHTTPContext = class
  public
    function Connected: Boolean; virtual; abstract;
  end;

  ///  <summary>Abstract DataSnap HTTP Request
  ///  </summary>
  TDSHTTPRequest = class
  protected
    function GetCommand: string; virtual; abstract;
    function GetCommandType: TDSHTTPCommandType; virtual; abstract;
    function GetDocument: string; virtual; abstract;
    function GetParams: TStrings; virtual; abstract;
    function GetPostStream: TStream; virtual; abstract;
    function GetAuthUserName: string; virtual; abstract;
    function GetAuthPassword: string; virtual; abstract;
    function GetURI: string; virtual; abstract;
    function GetPragma: string; virtual; abstract;
    function GetAccept: string; virtual; abstract;
    function GetRemoteIP: string; virtual; abstract;
    function GetUserAgent: string; virtual; abstract;
    function GetProtocolVersion: string; virtual; abstract;
  public
    property CommandType: TDSHTTPCommandType read GetCommandType;
    property Document: string read GetDocument; // writable for isapi compatibility. Use with care
    property Params: TStrings read GetParams;
    property PostStream: TStream read GetPostStream;
    property AuthUserName: string read GetAuthUserName;
    property AuthPassword: string read GetAuthPassword;
    property Command: string read GetCommand;
    property URI: string read GetURI;
    property Pragma: string read GetPragma;
    property Accept: string read GetAccept;
    property RemoteIP: string read GetRemoteIP;
    property UserAgent: string read GetUserAgent;
    property ProtocolVersion: string read GetProtocolVersion;
  end;

  ///  <summary>Abstract DataSnap HTTP Response
  ///  </summary>
  TDSHTTPResponse = class
  protected
    function GetContentStream: TStream; virtual; abstract;
    function GetResponseNo: Integer; virtual; abstract;
    function GetResponseText: String; virtual; abstract;
    procedure SetContentStream(const Value: TStream); virtual; abstract;
    procedure SetResponseNo(const Value: Integer); virtual; abstract;
    procedure SetResponseText(const Value: String); virtual; abstract;
    function GetContentText: string; virtual; abstract;
    procedure SetContentText(const Value: string); virtual; abstract;
    function GetContentLength: Int64; virtual; abstract;
    procedure SetContentLength(const Value: Int64); virtual; abstract;
    function GetCloseConnection: Boolean; virtual; abstract;
    procedure SetCloseConnection(const Value: Boolean); virtual; abstract;
    function GetPragma: string; virtual; abstract;
    procedure SetPragma(const Value: string); virtual; abstract;
    function GetContentType: string; virtual; abstract;
    procedure SetContentType(const Value: string); virtual; abstract;
    function GetFreeContentStream: Boolean; virtual; abstract;
    procedure SetFreeContentStream(const Value: Boolean); virtual; abstract;
  public
    procedure SetHeaderAuthentication(const Value: String; const Realm: String); virtual; abstract;

    property FreeContentStream: Boolean read GetFreeContentStream write SetFreeContentStream;

    property ResponseNo: Integer read GetResponseNo write SetResponseNo;
    property ResponseText: String read GetResponseText write SetResponseText;
    property ContentType: String read GetContentType write SetContentType;
    property ContentStream: TStream read GetContentStream write SetContentStream;
    property ContentText: string read GetContentText write SetContentText;
    property ContentLength: Int64 read GetContentLength write SetContentLength;
    property CloseConnection: Boolean read GetCloseConnection write SetCloseConnection;
    property Pragma: string read GetPragma write SetPragma;
  end;


  ///  <summary> User event for logging http requests
  ///  </summary>
  TDSHTTPServiceTraceEvent = procedure(Sender: TObject; AContext: TDSHTTPContext;
                                    ARequest: TDSHTTPRequest;
                                    AResponse: TDSHTTPResponse) of object;

  ///  <summary> User event for capturing and optionally modifying REST results before they are returned.
  ///  </summary>
  ///  <remarks>The JSON value passed in is not wrapped in a 'result' object. If Handled is set to false,
  ///           then the caller will wrap the value of ResultVal like this: {'result':ResultVal}.
  ///           Note also that the value passed in may (and probably will) be a JSON Array, containing
  ///           one or more return values, depending on the method having been invoked.
  ///           If you change the value held by ResultVal, the new value will be returned.
  ///  </remarks>
  ///  <param name="Sender">The instance invoking the event.</param>
  ///  <param name="ResultVal">The JSON value being returned</param>
  ///  <param name="Command">The command being executed</param>
  ///  <param name="Handled">Set to true if the event handled the formatting of the result.</param>
  TDSRESTResultEvent = procedure(Sender: TObject; var ResultVal: TJSONValue;
                                 const Command: TDBXCommand;
                                 var Handled: Boolean) of object;

  ///  <summary> Serves a response to a datasnap/cache request, for supported request types: GET and DELETE
  ///  </summary>
  TDSHTTPCacheContextService = class(TDSRequestFilterManager)
  private
    FSession: TDSSession;
    FLocalConnection: Boolean;

    ///  <summary> Parses the request for the desired Cache item ID, command index and parameter index.
    ///     Any of these can be -1 instead of an actual value, as long as the ones after it are also -1.
    ///  </summary>
    function ParseRequst(Request: String; out CacheId, CommandIndex, ParameterIndex: Integer): Boolean;
    procedure InvalidRequest(Response: TDSHTTPResponse; Request: String);
    ///  <summary> Returns the Cache Item IDs as held by the cache </summary>
    procedure GetCacheContents(out Value: TJSONValue);
    ///  <summary> Returns the number of commands held by the item. (Usually 1)
    /// </summary>
    procedure GetCacheItemContents(const CacheId: Integer; out Value: TJSONValue);
    ///  <summary> Returns the number of parameters held by the command
    /// </summary>
    procedure GetCommandContents(const CacheId: Integer; const CommandIndex: Integer; out Value: TJSONValue);
    ///  <summary> Returns the parameter value as either JSON or TStream, depending on the request
    /// </summary>
    procedure GetParameterValue(const RequestInfo: TDSHTTPRequest; const CacheId: Integer;
                                const CommandIndex: Integer; const ParameterIndex: Integer;
                                out Response: TJSONValue; out ResponseStream: TStream; out IsError: Boolean);
    ///  <summary> Returns the parameter index for the given command. </summary>
    function GetOriginalParamIndex(const Command: TDBXCommand; const Parameter: TDBXParameter): Integer;
    ///  <summary> Returns true if Streams should be returned as JSON, false to return them as content stream
    /// </summary>
    function StreamsAsJSON(const RequestInfo: TDSHTTPRequest): Boolean;

    function ByteContent(JsonValue: TJSONValue): TBytes;
  public
    constructor Create(Session: TDSSession; LocalConnection: Boolean); reintroduce; Virtual;

    ///  <summary> Uses the given Request string to deterine which part of the cache the client is interested in,
    ///     and populates the result accordingly.
    ///  </summary>
    procedure ProcessGETRequest(const RequestInfo: TDSHTTPRequest; Response: TDSHTTPResponse; Request: String);
    ///  <summary> Uses the given Request string to deterine which part of the cache the client wants to delete,
    ///     and populates the result accordingly after performing the deletion.
    ///  </summary>
    procedure ProcessDELETERequest(const RequestInfo: TDSHTTPRequest; Response: TDSHTTPResponse; Request: String);
  end;

  /// <summary> Wrapper for an execution response which can manage a Command populated with results,
  ///    or an error message, but not both.
  /// </summary>
  TDSExecutionResponse = class
  protected
    FCommand: TDBXCommand;
    FDBXConnection: TDBXConnection;
    FErrorMessage: String;
    FLocalConnection: Boolean;
  public
    constructor Create(Command: TDBXCommand; DBXConnection: TDBXConnection; LocalConnection: Boolean); Overload; Virtual;
    constructor Create(ErrorMessage: String); Overload; Virtual;
    destructor Destroy(); Override;

    property Command: TDBXCommand read FCommand;
    property ErrorMessage: String read FErrorMessage;
  end;

  /// <summary> Abstract class for common functionality of Response Handlers,
  ///    which uses the result of a TDBXCommand to populate a TDSHTTPResponse object appropriately.
  /// </summary>
  TDSServiceResponseHandler = class abstract(TRequestCommandHandler)
  protected
    FCommandType: TDSHTTPCommandType;
    FCommandList: TList<TDSExecutionResponse>;
    FLocalConnection: Boolean;
    FForceResultArray: Boolean;

    function ByteContent(JsonValue: TJSONValue): TBytes; Virtual;
    /// <summary> Returns the number of output parameters/errors combined in all of the managed commands.
    /// </summary>
    function GetResultCount: Integer; Virtual;
    /// <summary> Populates errors into the response, if any. Returning true if errors were populated.
    /// </summary>
    function GetOKStatus: Integer; Virtual;
  public
    constructor Create(CommandType: TDSHTTPCommandType; LocalConnection: Boolean); Overload; Virtual;
    destructor Destroy; override;

    /// <summary> Adds an error message to the handler.
    /// </summary>
    procedure AddCommandError(ErrorMessage: String); Override;
    /// <summary> Adds a TDBXCommand for this handler to use when populating the response.
    /// </summary>
    /// <remarks> Multiple commands will exist if a batch execution was done instead fo a single invocation.
    ///    This assumes ownership of the commands.
    /// </remarks>
    procedure AddCommand(Command: TDBXCommand; DBXConnection: TDBXConnection); Override;
    /// <summary> Clears the stored commands/errors
    /// </summary>
    procedure ClearCommands(); Override;
    /// <summary> Populates either Response or ResponseStream
    /// </summary>
    procedure GetResponse(out Response: TJSONValue; out ResponseStream: TStream; out ContainsErrors: boolean); Virtual; Abstract;
    /// <summary> Populate the given response using the previously specified command and any
    ///    appropriate invocation metadata passed in.
    /// </summary>
    procedure PopulateResponse(AResponseInfo: TDSHTTPResponse;
                               InvokeMetadata: TDSInvocationMetadata); Virtual; Abstract;
    /// <summary> Handles the closing, or transitioning of the response handler.
    /// </summary>
    /// <remarks> Calling this releases the holder of responsibility to manage the memory of this instance
    ///    any further. However, there is no guarantee that the instance will be destroyed when this is called.
    /// </remarks>
    procedure Close(); Virtual; Abstract;
    /// <summary> True to pass the result object back in an array even if there was only one command executed,
    ///    false to only pass back the result objects in an array if there was more than one command executed.
    ///    Defaults to false.
    /// </summary>
    property ForceResultArray: Boolean read FForceResultArray write FForceResultArray;
  end;

  ///  <summary> Information mapping to a specific Tunnel, which is to be associated with a session.
  ///  </summary>
  TDSSessionTunnelInfo = record
    ///  <summary> The Channel Name associated with the tunnel. </summary>
    ChannelName: String;
    ///  <summary> The ID of the tunnel, as specified by the client. </summary>
    ClientChannelId: String;
    ///  <summary> Security token associated with the tunnel, for authorised modification. </summary>
    SecurityToken: String;
    ///  <summary> The User associated with the tunnel. </summary>
    AuthUser: String;
    ///  <summary> The password of the user associated with the tunnel. </summary>
    AuthPassword: String;
  end;

  ///  <summary> Datasnap specific HTTP server. Provides DS specific
  ///    implementations for different command types
  ///  </summary>
  TDSHTTPServer = class
  strict private
    ///  <summary> Name of a DSServer in the current process </summary>
    FDSServerName: string;
    ///  <summary> DS host name. Only used if DSServerName is not specified </summary>
    FDSHostname: String;
    ///  <summary> DS host port number. Only used if DSServerName is not specified </summary>
    FDSPort: Integer;
    ///  <summary> Filter reference </summary>
    FFilters: TTransportFilterCollection;
    ///  <summary>true if the user credentials are passed through remote DS instance</summary>
    FCredentialsPassThrough: boolean;
    ///  <summary>DS user credentials, they work in tandem with the pass through</summary>
    FDSAuthUser: String;
    FDSAuthPassword: String;

    /// <summary> Time in miliseconds a session will remain valid. </summary>
    /// <remarks> After this time passes, the session is marked as expired and eventually removed.
    ///     If 0 is specified, the session never expires.
    /// </remarks>
    FSessionTimeout: Integer;
    FSessionEvent: TDSSessionEvent;

    FProtocolHandlerFactory:   TDSJSONProtocolHandlerFactory;

    FDSHTTPAuthenticationManager: TDSCustomAuthenticationManager;

    FIPImplementationID: string;
  private
    FRESTContext: String;
    FDSContext: String;
    FCacheContext: String;
    FTunnelService: TDSTunnelService;

    FTrace: TDSHTTPServiceTraceEvent;

    FResultEvent: TDSRESTResultEvent;

    function GetRestContext: String;
    function GetDsContext: String;
    function GetCacheContext: String;

    procedure SetRestContext(const ctx: String);
    procedure SetDsContext(const ctx: String);
    procedure SetCacheContext(const ctx: String);

    ///  <summary> Tries to consume the prefix out of the context. Returns what
    ///    is left of it, nil if the prefix is not found.
    ///  <param name="prefix">prefix string, not null or empty</param>
    ///  <param name="context">current context, never null or empty</param>
    ///  <param name="unused">unused part of the context</param>
    ///  <return>true if the context has the prefix</return>
    ///  </summary>
    function Consume(const Prefix: String; const Context: String; out Unused: String): boolean;

    function ByteContent(DataStream: TStream): TBytes; overload;
    function ByteContent(JsonValue: TJSONValue): TBytes; overload;

    property RESTContext: String read GetRestContext write SetRESTContext;
    property DSContext: String read GetDSContext write SetDSContext;
    property CacheContext: String read GetCacheContext write SetCacheContext;

    procedure SetDSHostname(AHostname: String);
    procedure SetDSPort(APort: Integer);
    procedure SetDSServerName(AName: String);
    procedure SetFilters(AFilterCollection: TTransportFilterCollection);
    procedure SetAuthenticationManager(AuthenticationManager: TDSCustomAuthenticationManager);

    function GetTunnelService: TDSTunnelService;
    procedure CloseAllTunnelSessions;

    /// <summary> Checks the request for a Session ID and returns it if one is found. </summary>
    /// <remarks> Checks the Pragama header and optionally the query parameter of the url.
    ///    If checking both places, the URL parameter takes priority if both locations have values specified.
    /// </remarks>
    /// <returns> The found session ID or empty string if none found. </returns>
    function GetRequestSessionId(const ARequestInfo: TDSHTTPRequest; const CheckURLParams: boolean = True): String;
    /// <summary> Loads the session with the given session ID and sets it into the thread. </summary>
    /// <remarks> Pass in an empty string to create a new session </remarks>
    /// <returns> True if successful, false if passed an expired or invalid session ID </returns>
    function LoadSession(const SessionId: String; const UserName: String; out IsNewSession: boolean): boolean;

    function IsClosingSession(Request: String): boolean;
    function IsOpeningClientChannel(Request: String): boolean;
    function IsClosingClientChannel(Request: String): boolean;
    function GetClientChannelInfo(Request: String; out ChannelName, ClientChannelId, SecurityToken: String): boolean;
    procedure UpdateSessionTunnelHook(Request: String; Session: TDSSession; RequestInfo: TDSHTTPRequest);
    procedure CloseSessionTunnels(Session: TDSSession);
    procedure CloseRESTSession(Session: TDSSession; ResponseInfo: TDSHTTPResponse);

    function CreateRESTService(const AuthUserName, AuthPassword: String): TDSRESTService;

  strict protected
    procedure DoDSRESTCommand(ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse; Request: String);
    procedure DoDSCacheCommand(ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse; Request: String;
                               LocalConnection: Boolean);
    procedure DoJSONCommand(ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse; Request: String);
    procedure DoTunnelCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest; AResponseInfo: TDSHTTPResponse);
    procedure DoCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
                                    AResponseInfo: TDSHTTPResponse);
	procedure DoCommandOtherContext(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
                                    AResponseInfo: TDSHTTPResponse; const ARequest: string); virtual;
  protected
    function Decode(Data: string): string; virtual; abstract;

  public
    constructor Create; overload;
    constructor Create(const AIPImplementationID: string); overload;
    destructor Destroy; override;

    procedure CreateProtocolHandlerFactory(ATransport: TDSServerTransport);
    procedure ClearProtocolHandlerFactory;

    property TunnelService: TDSTunnelService read GetTunnelService;
    property DSHostname: String read FDSHostname write SetDSHostname;
    property DSPort: Integer read FDSPort write SetDSPort;
    property DSServerName: String read FDSServerName write SetDSServerName;
    property Filters: TTransportFilterCollection read FFilters write SetFilters;
    property DSAuthenticationManager: TDSCustomAuthenticationManager read FDSHTTPAuthenticationManager
                                            write SetAuthenticationManager;
    property CredentialsPassThrough: boolean read FCredentialsPassThrough write FCredentialsPassThrough;
    property SessionTimeout: Integer read FSessionTimeout write FSessiontimeout;
    property DSAuthUser: String read FDSAuthUSer write FDSAuthUser;
    property DSAuthPassword: String read FDSAuthPassword write FDSAuthPassword;

    property IPImplementationID: string read FIPImplementationID;

    /// <summary>Event to call when a REST call is having its result built, to be returned.</summary>
    property ResultEvent: TDSRESTResultEvent read FResultEvent write FResultEvent;
  end;

  ///  <summary> Datasnap Server HTTP service provider class.
  ///    Provides lightweight http services for Datasnap technology. Implements
  ///    internet protocols such as REST.
  ///  </summary>
  TDSHTTPServerTransport = class(TDSServerTransport)
  strict protected
    FHttpServer: TDSHTTPServer;
  strict private
    { Private declarations }
    FCredentialsPassthrough: Boolean;
    FSessionTimeout: Integer;
    FDSAuthPassword: string;
    FDSAuthUser: string;
    FDSContext: string;
    FDSCacheContext: string;
    FDSRestContext: string;
    FDSPort: Integer;
    FDSHostName: string;
    FAuthenticationManager: TDSCustomAuthenticationManager;
    FTrace: TDSHTTPServiceTraceEvent;
    FResultEvent: TDSRESTResultEvent;
  private
    function GetHttpServer: TDSHTTPServer;
    procedure UpdateDSServerName;

  protected
    procedure Loaded; override;
    procedure RequiresServer;
    function CreateHttpServer: TDSHTTPServer; virtual; abstract;
    procedure InitializeHttpServer; virtual;
    { Protected declarations }
    procedure SetRESTContext(const Ctx: String );
    procedure SetDSContext(const Ctx: String);
    procedure SetCacheContext(const Ctx: String);
    procedure SetTraceEvent(Event: TDSHTTPServiceTraceEvent );
    procedure SetDSHostname(Host: String );
    procedure SetDSPort(Port: Integer);
    procedure SetServer(const AServer: TDSCustomServer); override;
    procedure SetAuthenticationManager(const AuthenticationManager: TDSCustomAuthenticationManager);
    procedure SetResultEvent(const RestEvent: TDSRESTResultEvent);

    function GetRESTContext: String;
    function GetDSContext: String;
    function GetCacheContext: String;
    function GetTraceEvent: TDSHTTPServiceTraceEvent;
    function GetDSHostname: String;
    function GetDSPort: Integer;
    function GetAuthenticationManager: TDSCustomAuthenticationManager;
    function GetResultEvent: TDSRESTResultEvent;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure SetFilters(const Value: TTransportFilterCollection); override;
    procedure ServerCloseAllTunnelSessions;
    procedure SetCredentialsPassThrough(const AFlag: boolean); virtual;
    procedure SetDSAuthUser(const UserName: String); virtual;
    procedure SetDSAuthPassword(const UserPassword: String); virtual;
    function GetCredentialsPassThrough: boolean;
    function GetDSAuthUser: String; virtual;
    function GetDSAuthPassword: String; virtual;
    function GetSessionTimeout: Integer; virtual;
    procedure SetSessionTimeout(const Milliseconds: Integer); virtual;
    function GetIPImplementationID: string; override;
  published

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property HttpServer: TDSHTTPServer read GetHttpServer;

  published
    { Published declarations }
    property DSContext: String read GetDSContext write SetDSContext;
    ///  <summary> REST URL context like in http://my.site.com/datasnap/rest/...
    ///     In the example above rest denotes that the request is a REST request
    ///     and is processed by REST service
    ///  </summary>
    property RESTContext: String read GetRESTContext write SetRESTContext;
    ///  <summary> Cache URL context, like in http://my.site.com/datasnap/cache/...
    ///  </summary>
    property CacheContext: String read GetCacheContext write SetCacheContext;
    ///  <summary> User trace code might go here
    ///  </summary>
    property Trace: TDSHTTPServiceTraceEvent read GetTraceEvent write SetTraceEvent;
    /// <summary>Event to call when a REST call is having its result built.</summary>
    /// <remarks>The result can be modified by this event, changing its format or content.</remarks>
    property FormatResult: TDSRESTResultEvent read GetResultEvent write SetResultEvent;

    ///  <summary> Server software, read only
    ///  </summary>
    //property ServerSoftware: String read GetServerSoftware;
    ///  <summary> Datasnap Server. If set, takes precedence over hostname and port </summary>
    property Server;
    ///  <summary> Datasnap Server machine name. Only used when DSServer is not set </summary>
    property DSHostname: String read GetDSHostname write SetDSHostname;
    ///  <summary> Datasnap Server port number. Only used when DSServer is not set </summary>
    property DSPort: Integer read GetDSPort write SetDSPort;
    ///  <summary> Datasnap communication filters for in-process instance</summary>
    property Filters;
    property AuthenticationManager: TDSCustomAuthenticationManager read GetAuthenticationManager
                                               write SetAuthenticationManager;
    ///  <summary> true if the user credentials are authenticated at the endpoint </summary>
    property CredentialsPassThrough: boolean read GetCredentialsPassThrough write SetCredentialsPassThrough;

    property DSAuthUser: String read GetDSAuthUser write SetDSAuthUser;
    property DSAuthPassword: String read GetDSAuthPassword write SetDSAuthPassword;

    ///  <summary> Time in miliseconds a session will remain valid. </summary>
    ///  <remarks> After this time passes, the session is marked as expired and eventually removed.
    ///     If 0 is specified, the session never expires.
    /// </remarks>
    property SessionTimeout: Integer read GetSessionTimeout write SetSessionTimeout;
  end;

  TDSCallbackChannelEvent = procedure(Sender: TObject) of object;

  ///  <summary> A callback and TStringList pairing, where the callback is one of the client's
  ///    channel callbacks, and the 'Channels' member is a list of channel names, aside from
  ///    the ChannelName if the TDSClientCallbackChannelManager, that the callback listens on.
  ///  </summary>
  TDSCallbackItem = class
  private
    FServerChannelName: String;
    FCallback: TDBXCallback;
    FChannels: TStrings;
  public
    constructor Create(ServerChannelName: String; Callback: TDBXCallback; Channels: TStrings = nil); overload;
    constructor Create(ServerChannelName: String; Callback: TDBXCallback; Channels: String = ''); overload;
    destructor Destroy; override;

    ///  <summary>Returns true if this callback is 'listening' to the given Channel name.
    ///    Specifically, if the channel name is the server channel name, or in the Channels list.
    ///  </summary>
    function ListeningOn(ChannelName: String): Boolean;

    ///  <summary>Name of the channel the manager this item is in listens on.</summary>
    property ServerChannelName: String read FServerChannelName;
    ///  <summary>The callback wrapped by this item.</summary>
    property Callback: TDBXCallback read FCallback;
    ///  <summary>A list of channel names this specific callback is interested in, or nil</summary>
    property Channels: TStrings read FChannels;
  end;

  TDSClientCallbackChannelManager = class;

  ///  <summary> Event Item passed in through the TDSClientChannelManagerEvent,
  ///            for providing tunnel event info.
  ///  </summary>
  TDSClientChannelEventItem = record
    ///<summary>The type of event occurring for a tunnel (channel.)</summary>
    EventType: TDSCallbackTunnelEventType;
    ///<summary>The ID of the tunnel (Channel) being acted on.</summary>
    TunnelId: String;
    ///<summary>The tunnel (Channel) being acted on.</summary>
    Tunnel: TDSClientCallbackChannelManager;
    ///<summary>The ServerChannelName of the tunnel (Channel) being acted on.</summary>
    TunnelChannelName: String;
    /// <summary>The ID of the callback being added or removed. Empty string if tunnel is beign closed.
    /// </summary>
    CallbackId: String;
    /// <summary>The callback item which wraps the callback this event is for. nil if tunnel is being closed.
    /// </summary>
    CallbackItem: TDSCallbackItem;
  end;

  ///  <summary> User event for notification of channel events, such as create and close. </summary>
  TDSClientChannelManagerEvent =
                procedure(Sender: TObject; const EventItem: TDSClientChannelEventItem) of object;

  ///  <summary> Used to specify if a tunnel has failed or not. </summary>
  TDSChannelThreadState = (ctsStopped, ctsStarted, ctsFailed);

  ///  <summary> Client callback manager handles the client callbacks that are registered
  ///    with a specific DS Server instance (DSHostname, DSPort, Communication protocol).
  ///
  ///    ChannelName property value will determine the server channel the callbacks will
  ///    be registered to. DS Server can handle multiple callback channels based on a name.
  ///    Callbacks can respond to messages posted to a channel asynchronously.
  ///
  ///    Manager Id is an unique identifier within a channel that will make possible
  ///    peer-to-peer callbacks.
  ///  </summary>
  TDSClientCallbackChannelManager = class(TComponent)
    strict private
      FSecurityToken: String;
      FDSHostname: String;
      FDSPort: String;
      FDSPath: String;
      FCommunicationProtocol: String;
      FChannelName: String;
      FManagerId: String;
      FConnectionTimeout: String;
      FCommunicationTimeout: String;
      FStopped: Boolean;
      FUserName: String;
      FPassword: String;
      FProxyHost: String;
      FProxyPort: Integer;
      FProxyUsername: String;
      FProxyPassword: String;
      FIPImplementationID: String;

      //Unique ID of the callback as the Key, and the callback item wrapping the callback as the value
      FLocalCallbackRepo: TObjectDictionary<String, TDSCallbackItem>;

    private
      FChannelManagerEvent: TDSClientChannelManagerEvent;

      procedure NotifyChange(EventType: TDSCallbackTunnelEventType; const CallbackId: String;
                             Item: TDSCallbackItem);
    protected
      type

      TDSChannelInvokeEvent = procedure (const Id: String; Data: TJSONValue; out Response: TJSONValue) of object;
      TDSChannelBroadcastEvent = procedure (Data: TJSONValue; ChannelName: String) of object;

      TParamSetup = reference to procedure (Params: TDBXParameterList);
      TDSWorker = reference to procedure;

      TDSChannelCallback = class(TDBXCallback)
        private
          FInvokeEvent: TDSChannelInvokeEvent;
          FInvokeObjectEvent: TDSChannelInvokeEvent;
          FBroadcastEvent: TDSChannelBroadcastEvent;
          FBroadcastObjectEvent: TDSChannelBroadcastEvent;

        public
          constructor Create(const InvokeEvent: TDSChannelInvokeEvent;
                             const InvokeObjectEvent: TDSChannelInvokeEvent;
                             const BroadcastEvent: TDSChannelBroadcastEvent;
                             const BroadcastObjectEvent: TDSChannelBroadcastEvent); overload;
          destructor Destroy; override;

          function Execute(const Arg: TJSONValue): TJSONValue; override;
      end;

      TDSChannelThread = class(TThread)
      private
        FWorker: TDSWorker;
        FManager: TDSClientCallbackChannelManager;
      protected
        procedure Execute; override;
      public
        constructor Create(Worker: TDSWorker; Manager: TDSClientCallbackChannelManager = nil);
        destructor Destroy; override;
      end;

      /// <summary>
      ///   Thread for execution of a Callback. This is done in its own thread so that if
      ///   the callback takes too long to return then the thread can be abandoned
      ///   and the client/server won't hang.
      /// </summary>
      TDSExecuteThread = class(TThread)
      protected
        FCallback: TDBXCallback;
        FData: TJSONValue;
        FResponse: TJSONValue;
        procedure Execute; override;
      public
        constructor Create(Callback: TDBXCallback; Data: TJSONValue);
        destructor Destroy; override;
        property Response: TJSONValue read FResponse;
      end;

    strict private
      FChannelCallback: TDSChannelCallback;
      FOnServerConnectionError: TDSCallbackChannelEvent;
      FOnServerConnectionTerminate: TDSCallbackChannelEvent;
      FRegConverters: TObjectDictionary<String, TConverterEvent>;
      FRegReverters: TObjectDictionary<String, TReverterEvent>;


    protected
      ///  <summary> The current state of the tunnel thread </summary>
      FState: TDSChannelThreadState;

      ///  <summary> If State is failed, this may hold a meaningful error message. </summary>
      FStateError: String;

      ///  <summary> Creates the DBX DataSnap properties map from local fields
      ///  </summary>
      function DBXConnectionProperties(NoTimeout: boolean = false): TDBXDatasnapProperties;
      ///  <summary> Generic method for remote invocation
      ///  </summary>
      procedure ExecuteRemote(const AClassName, AMethodName: String; ParamSetup: TParamSetup;
                              ParamCheckup: TParamSetup; NoTimeout: boolean = false);

      procedure Broadcast(Data: TJSONValue; ChannelName: String);
      procedure BroadcastObject(Data: TJSONValue; ChannelName: String);
      procedure Invoke(const Id: String; Data: TJSONValue; out Response: TJSONValue);
      procedure InvokeObject(const Id: String; Data: TJSONValue; out Response: TJSONValue);
      function GetIPImplementationID: string; virtual;
      procedure SetIPImplementationID(const AIPImplementationID: string); virtual;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      ///  <summary>Returns a list of all callback Ids registered with this manager.</summary>
      function GetCallbackIds: TArray<String>;

      ///  <summary>Returns the item (and true) if one with the given Id exists. nil (and false) otherwise.
      ///  </summary>
      function GetCallbackItem(const CallbackId: String; out Item: TDSCallbackItem): boolean;

      ///  <summary> Registers a callback with the channel manager. The callback id
      ///   uniquely identifies it and it is used for peer-to-peer message exchange.
      ///
      ///   It returns false if the registration failed (there is already a callback with
      ///    the same id, invalid arguments, connection with DS Server failed, etc)
      ///  </summary>
      function RegisterCallback(const CallbackId: String;
                                const Callback: TDBXCallback): boolean; overload;
      function RegisterCallback(const CallbackId, ChannelNames: String;
                                const Callback: TDBXCallback): boolean; overload;
      ///  <summary> Registers a callback with the channel manager. The callback's name
      ///   uniquely identifies it and it is used for peer-to-peer message exchange.
      ///
      ///   It returns false if the registration failed (there is already a callback with
      ///    the same name, invalid arguments, connection with DS Server failed, etc)
      ///  </summary>
      function RegisterCallback(const ChannelNames: String; const Callback: TDBXNamedCallback): boolean; overload;
      function RegisterCallback(const Callback: TDBXNamedCallback): boolean; overload;
      ///  <summary> Unregisters a callback from the channel manager given the callback's unique Id (name)
      ///  </summary>
      function UnregisterCallback(const CallbackId: String): boolean;
      ///  <summary> Closes the client channel, which will internally unregister all callbacks.
      ///  </summary>
      function CloseClientChannel(): Boolean;
      ///  <summary> Broadcasts a message to all callbacks of the channel this is registered with.
      ///  </summary>
      ///  <remarks>
      ///    Function takes ownership of the argument
      ///  </remarks>
      function BroadcastToChannel(const Msg: TJSONValue; ChannelName: String = ''): boolean;
      ///  <summary> Broadcasts a message to all callbacks of the channel this is registered with.
      ///  </summary>
      ///  <remarks>
      ///    Function takes ownership of the argument
      ///  </remarks>
      function BroadcastObjectToChannel(const Msg: TObject; ChannelName: String = ''): boolean;
      /// <summary> Notifies a client callback with the specified message </summary>
      ///  <remarks>
      ///    Function takes ownership of the input message argument
      ///  </remarks>
      function NotifyCallback(const CallbackId, ManagerId: String;
                              const Msg: TJSONValue; out Response: TJSONValue): boolean;
      /// <summary> Notifies a client callback with the specified message </summary>
      ///  <remarks>
      ///    Function takes ownership of the input message argument
      ///  </remarks>
      function NotifyObjectCallback(const CallbackId, ManagerId: String;
                              const Msg: TObject; out Response: TObject): boolean;

      function GetJSONMarshaler: TJSONMarshal;
      function GetJSONUnMarshaler: TJSONUnMarshal;

      procedure AddConverter(event: TConverterEvent);
      procedure AddReverter(event: TReverterEvent);

      ///  <summary> Marshal argument using local marshaler</summary>
      function MarshalData(Data: TObject): TJSONValue;
      ///  <summary> UnMarshal argument using local unmarshaler</summary>
      function UnMarshalJSON(Data: TJSONValue): TObject;

      ///  <summary> Makes a copy of this manager, without any of its registered callbacks.</summary>
      function Copy: TDSClientCallbackChannelManager;

      ///  <summary> The current state of the tunnel thread. </summary>
      property State: TDSChannelThreadState read FState;

      ///  <summary> If State is failed, this may hold a meaningful error message. </summary>
      property StateError: String read FStateError;
    published
      property DSHostname: String read FDSHostname write FDSHostname;
      property DSPort: String read FDSPort write FDSPort;
      property DSPath: String read FDSPath write FDSPath;
      property CommunicationProtocol: String read FCommunicationProtocol write FCommunicationProtocol;
      property ChannelName: String read FChannelName write FChannelName;
      property ManagerId: String read FManagerId write FManagerId;
      property OnServerConnectionError: TDSCallbackChannelEvent read FOnServerConnectionError
                write FOnServerConnectionError;
      property OnServerConnectionTerminate: TDSCallbackChannelEvent read FOnServerConnectionTerminate
                write FOnServerConnectionTerminate;
      ///  <summary>miliseconds expected for the connection to be established</summary>
      property ConnectionTimeout: String read FConnectionTimeout write FConnectionTimeout;
      property CommunicationTimeout: String read FCommunicationTimeout write FCommunicationTimeout;
      ///  <summary>User name to authenticate with.</summary>
      property UserName: String read FUserName write FUserName;
      ///  <summary>Password to authenticate with.</summary>
      property Password: String read FPassword write FPassword;
      /// <summary>The host to proxy requests through, or empty string to not use a proxy.</summary>
      property ProxyHost: String read FProxyHost write FProxyHost;
      /// <summary>The port on the proxy host to proxy requests through. Ignored if DSProxyHost isn't set.
      /// </summary>
      property ProxyPort: Integer read FProxyPort write FProxyPort default 8888;
      /// <summary>The user name for authentication with the specified proxy.</summary>
      property ProxyUsername: String read FProxyUsername write FProxyUsername;
      /// <summary>The password for authentication with the specified proxy.</summary>
      property ProxyPassword: String read FProxyPassword write FProxyPassword;

      property IPImplementationID: string read GetIPImplementationID write SetIPImplementationID;

      /// <summary>Event to be notified when the channel is opened or closed and when callbacks are added and removed.
      /// </summary>
      property OnChannelStateChange: TDSClientChannelManagerEvent read FChannelManagerEvent write FChannelManagerEvent;
  end;

  /// <summary> Base class for handlers which will translate the DBXCommand into Json in some fashion
  /// </summary>
  TDSJsonResponseHandler = class abstract(TDSServiceResponseHandler)
  protected
    FDSService: TDSService;
    FServiceInstanceOwner: Boolean;
    FAllowStream: boolean;
    FResultEvent: TDSRESTResultEvent;

    procedure GetCommandResponse(Command: TDBXCommand; out Response: TJSONValue; out ResponseStream: TStream);
    /// <summary> Allows subclasses to handle each parameter as they see fit, or return False and allow
    ///    the base class to transform the parameter into a JSON representation.
    /// </summary>
    function HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                             out Response: TJSONValue; var ResponseStream: TStream): Boolean; Virtual; Abstract;

    procedure PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                              ResponseStream: TStream); Virtual; Abstract;
    procedure ProcessResultObject(var ResultObj: TJSONObject; Command: TDBXCommand); Virtual;
  public
    constructor Create(CommandType: TDSHTTPCommandType; DSService: TDSService;
                       ServiceInstanceOwner: Boolean = True); Overload; Virtual;
    destructor Destroy; override;

    procedure GetResponse(out Response: TJSONValue; out ResponseStream: TStream;
                          out ContainsErrors: boolean); Override;
    procedure PopulateResponse(ResponseInfo: TDSHTTPResponse;
                               InvokeMetadata: TDSInvocationMetadata); Override;

    /// <summary>Event to call when a REST call is having its result built, to be returned.</summary>
    property ResultEvent: TDSRESTResultEvent read FResultEvent write FResultEvent;
  end;

  /// <summary> Default implementation of a Response Handler, which returns JSON for all data types,
  ///    except for the case where the user specifies they want TStream to be returned in the response
  ///    stream when the TStream is the only output/response parameter of the method being invoked.
  /// </summary>
  TDSDefaultResponseHandler = class(TDSJsonResponseHandler)
  private
    FStoreHandler: Boolean;
  protected
    function HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                             out Response: TJSONValue; var ResponseStream: TStream): Boolean; Override;
    procedure PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                              ResponseStream: TStream); Override;
  public
    constructor Create(AllowBinaryStream: boolean; DSService: TDSService; CommandType: TDSHTTPCommandType;
                       ServiceInstanceOwner: Boolean = True);
    destructor Destroy; override;

    procedure Close(); override;
  end;

  /// <summary> Used internally for implementations of TResultCommandHandler
  /// </summary>
  TDSCommandComplexParams = class
  private
    FCommand: TDBXCommand;
    FParameters: TList<TDBXParameter>;
  public
    constructor Create(Command: TDBXCommand); Virtual;
    destructor Destroy; override;

    function GetParameterCount: Integer;
    function GetParameter(Index: Integer): TDBXParameter;
    function AddParameter(Parameter: TDBXParameter): Integer;

    property Command: TDBXCommand read FCommand;
  end;

  /// <summary> Wraps an instance of TRequestCommandHandler which wants to make itself cacheable.
  /// </summary>
  TDSCacheResultCommandHandler = class(TResultCommandHandler)
  protected
    FCommandWrapper: TRequestCommandHandler;
    FCacheCommands: TList<TDSCommandComplexParams>;
  public
    constructor Create(CommandWrapper: TRequestCommandHandler); Virtual;
    destructor Destroy; override;

    function GetCommandCount: Integer; Override;
    function GetParameterCount(Index: Integer): Integer; Override;
    function GetCommand(Index: Integer): TDBXCommand; Override;
    function GetCommandParameter(CommandIndex: Integer; ParameterIndex: Integer): TDBXParameter; Overload; Override;
    function GetCommandParameter(Command: TDBXCommand; Index: Integer): TDBXParameter; Overload; Override;

    property CacheCommands: TList<TDSCommandComplexParams> read FCacheCommands write FCacheCommands;
  end;

  /// <summary> Request Handler when you don't care about getting any response from an execution.
  /// </summary>
  TDSNullResponseHandler = class(TDSJsonResponseHandler)
  protected
    function HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                             out Response: TJSONValue; var ResponseStream: TStream): Boolean; Override;
    procedure PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                              ResponseStream: TStream); Override;
  public
    constructor Create(DSService: TDSService; CommandType: TDSHTTPCommandType; ServiceInstanceOwner: Boolean = True);
    procedure Close(); override;
  end;

  /// <summary> Implementation of response handler for the case when complex datatypes are stored on
  ///    the server in a cache, and a URL to the object in the cache is passed back to the user instead
  ///    of the value of the cached object.
  /// </summary>
  TDSCacheResponseHandler = class(TDSJsonResponseHandler)
  protected
    FResultHandler: TDSCacheResultCommandHandler;
    FCacheId: Integer;
    function GetCacheObject: TDSCacheResultCommandHandler;
    function HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                             out Response: TJSONValue; var ResponseStream: TStream): Boolean; Override;
    procedure PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                              ResponseStream: TStream); Override;
    function GetComplexParams(Command: TDBXCommand; out Index: Integer;
                              AddIfNotFound: Boolean = True): TDSCommandComplexParams;
    procedure ProcessResultObject(var ResultObj: TJSONObject; Command: TDBXCommand); Override;
  public
    constructor Create(DSService: TDSService; CommandType: TDSHTTPCommandType; ServiceInstanceOwner: Boolean = True);
    destructor Destroy; override;

    procedure Close(); override;
  end;

  /// <summary> Factory for creating an appropriate instance of TDSServiceResponseHandler
  /// </summary>
  TDSResponseHandlerFactory = class
  public
    /// <summary> Returns a new instance of the appropriate TDSServiceResponseHandler implementation,
    ///     based on the provided information.
    /// </summary>
    class function CreateResponseHandler(DSService: TDSService;
                                         RequestInfo: TDSHTTPRequest;
                                         CommandType: TDSHTTPCommandType = hcUnknown;
                                         HTTPServer: TDSHTTPServer = nil): TDSServiceResponseHandler;
  end;

implementation

uses
{$IFNDEF POSIX}
  Winapi.ActiveX,
  System.Win.ComObj,
{$ENDIF}
  Data.DBXClientResStrs,
  Data.DBXJSONCommon,
  System.StrUtils;

const
  DATASNAP_CONTEXT = 'datasnap';
  CMD_ERROR = 'error';
  TUNNEL_CONTEXT = 'tunnel';
  TUNNEL_INFO_LIST = 'tunnelinfolist';
  CHANNEL_NAME = 'ChannelName';
  CLIENT_CHANNEL_ID = 'ClientChannelId';
  SECURITY_TOKEN = 'SecurityToken';
  AUTH_USER = 'AuthUserName';
  AUTH_PASSWORD = 'AuthPassword';

//temporary replacement for the TDSHTTPServer.LoadSession helper function, to avoid
//interface breaking changes in XE2 update builds.
function LoadSessionUpdate(const SessionId: String; const UserName: String;
                           const SessionTimeout: Integer; const TunnelService: TDSTunnelService;
                           const AuthManager: TDSCustomAuthenticationManager;
                           const ARequestInfo: TDSHTTPRequest;
                           out IsNewSession: boolean): boolean;
var
  Session: TDSSession;
begin
  TDSSessionManager.ClearThreadSession;

  //if session id wasn't specified then create a new session
  if SessionID = '' then
  begin
    IsNewSession := True;

    Session := TDSSessionManager.Instance.CreateSession<TDSRESTSession>(function: TDSSession begin
        Result := TDSRESTSession.Create(AuthManager);
        Result.ObjectCreator := TunnelService;

        //populate session data while creating, so session event tires with data already populated
        if ARequestInfo <> nil then
        begin
          if ARequestInfo.RemoteIP <> EmptyStr then
            Result.PutData('RemoteIP', ARequestInfo.RemoteIP);
          Result.PutData('RemoteAppName', ARequestInfo.UserAgent);
          Result.PutData('CommunicationProtocol', ARequestInfo.ProtocolVersion);
          Result.PutData('ProtocolSubType', 'rest');
        end;
    end, UserName);

     //must have activity at least once every X minutes to be valid
    if SessionTimeout > 0 then
    begin
      Session.LifeDuration := SessionTimeout;
      Session.ScheduleInactiveTerminationEvent;
    end;
  end
  else
  begin
    IsNewSession := False;

    //check if the Session ID is valid by trying to get it's matching session from the manager
    Session := TDSSessionManager.Instance.Session[SessionID];

    //if the session ID wasn't valid, return false showing session retrieval failed
    if (Session = nil) or (not Session.IsValid) then
    begin
      exit(False);
    end
    else
      Session.MarkActivity; //session is being used again, so mark as active
  end;

  if Session <> nil then
    TDSSessionManager.SetAsThreadSession(Session);

  exit(True);
end;

{TDSHTTPServer}

constructor TDSHTTPServer.Create;
begin
  Create('');
end;

constructor TDSHTTPServer.Create(const AIPImplementationID: string);
begin
  inherited Create;

  FIPImplementationID := AIPImplementationID;

//  Default values defined elsewhere
//  FRESTContext := REST_CONTEXT;
//  FCacheContext := CACHE_CONTEXT;
//  FDSContext := DATASNAP_CONTEXT;
//  FDSHostname := 'localhost';
//  FDSPort := 211;
//  FCredentialsPassThrough := false;
//  FSessionTimeout := 1200000;
//  FDSAuthUser := EmptyStr;
//  FDSAuthPassword := EmptyStr;

  FResultEvent := nil;
  FProtocolHandlerFactory := nil;
  FTunnelService := TDSTunnelService.Create(FDSHostname, FDSPort, FFilters, FProtocolHandlerFactory);

  //Listen for a session closing event and close the session's tunnel, if one exists
  FSessionEvent :=
    procedure(Sender: TObject; const EventType: TDSSessionEventType; const Session: TDSSession)
    begin
      case EventType of
        SessionClose:
          CloseSessionTunnels(Session);
      end;
    end;
  TDSSessionManager.Instance.AddSessionEvent(FSessionEvent);
end;

destructor TDSHTTPServer.Destroy;
begin
  if Assigned(FSessionEvent) then
    TDSSessionManager.Instance.RemoveSessionEvent(FSessionEvent);
  FreeAndNil(FTunnelService);
  FreeAndNil(FProtocolHandlerFactory);

  inherited;
end;

procedure TDSHTTPServer.CreateProtocolHandlerFactory(ATransport: TDSServerTransport);
begin
  FreeAndNil(FProtocolHandlerFactory);
  FProtocolHandlerFactory := TDSJSONProtocolHandlerFactory.Create(ATransport);
  TunnelService.ProtocolHandlerFactory := FProtocolHandlerFactory;
end;

procedure TDSHTTPServer.ClearProtocolHandlerFactory;
begin
  FreeAndNil(FProtocolHandlerFactory);
  TunnelService.ProtocolHandlerFactory := nil;
end;

function TDSHTTPServer.GetTunnelService: TDSTunnelService;
begin
  if FTunnelService = nil then
    FTunnelService := TDSTunnelService.Create(FDSHostname, FDSPort, FFilters, FProtocolHandlerFactory);
  Result := FTunnelService;
end;

procedure TDSHTTPServer.CloseAllTunnelSessions;
begin
  if FTunnelService <> nil then
    FTunnelService.TerminateAllSessions;
end;

procedure TDSHTTPServer.CloseRESTSession(Session: TDSSession; ResponseInfo: TDSHTTPResponse);
begin
  Assert(ResponseInfo <> nil);

  if (Session <> nil) then
  begin
    try
      TDSSessionManager.Instance.CloseSession(Session.SessionName);
      ResponseInfo.ResponseNo := 200;
      ResponseInfo.ResponseText := '{"result":[true]}';
    except
    end;
  end
  else
  begin
    ResponseInfo.ResponseNo := 400;
    ResponseInfo.ResponseText := SSessionExpiredMsg;
  end;
end;

function TDSHTTPServer.GetCacheContext: String;
begin
  Result := FCacheContext + '/';
end;

function TDSHTTPServer.IsClosingSession(Request: String): boolean;
begin
  Result := AnsiStartsText('/CloseSession/', Request);
end;

function TDSHTTPServer.IsClosingClientChannel(Request: String): boolean;
begin
  Result := AnsiStartsText('/DSAdmin/CloseClientChannel/', Request) or
            AnsiStartsText('/DSAdmin/%22CloseClientChannel%22/', Request);
end;

function TDSHTTPServer.IsOpeningClientChannel(Request: String): boolean;
begin
  Result := AnsiStartsText('/DSAdmin/ConsumeClientChannel/', Request) or
            AnsiStartsText('/DSAdmin/%22ConsumeClientChannel%22/', Request);
end;

function TDSHTTPServer.GetClientChannelInfo(Request: String;
                                            out ChannelName, ClientChannelId, SecurityToken: String): boolean;
var
  OpeningClientChannel: Boolean;
  Tokens: TStringList;
begin
  Result := False;

  OpeningClientChannel := IsOpeningClientChannel(Request);

  if OpeningClientChannel or IsClosingClientChannel(Request) then
  begin
    Tokens := TStringList.Create;
    Tokens.Delimiter := '/';
    Tokens.DelimitedText := Request;

    try
      if (OpeningClientChannel and (Tokens.Count > 7)) or (Tokens.Count > 5) then
      begin
        ChannelName := Tokens[3];
        ClientChannelId := Tokens[4];
        if OpeningClientChannel then
          SecurityToken := Tokens[7]
        else
          SecurityToken := Tokens[5];

        Result := ClientChannelId <> EmptyStr;
      end;
    finally
      FreeAndNil(Tokens);
    end;
  end;
end;

function TDSHTTPServer.GetDsContext: String;
begin
  Result := FDSContext + '/';
end;

function TDSHTTPServer.GetRestContext: String;
begin
  Result := FRESTContext + '/';
end;

procedure TDSHTTPServer.SetAuthenticationManager(
  AuthenticationManager: TDSCustomAuthenticationManager);
begin
  FDSHTTPAuthenticationManager := AuthenticationManager;
  if FTunnelService <> nil then
    FTunnelService.DSAuthenticationManager := AuthenticationManager;
end;

procedure TDSHTTPServer.SetCacheContext(const ctx: String);
begin
  if (ctx <> EmptyStr) and
     (ctx[Length(ctx)] = '/') then
      FCacheContext := Copy(ctx, 1, Length(ctx)-1)
  else
    FCacheContext := ctx;
end;

procedure TDSHTTPServer.SetDsContext(const ctx: String);
begin
  if (ctx <> EmptyStr) and
     (ctx[Length(ctx)] = '/') then
      FDSContext := Copy(ctx, 1, Length(ctx)-1)
  else
    FDSContext := ctx;
end;

procedure TDSHTTPServer.SetDSHostname(AHostname: string);
begin
  FDSHostname := AHostname;
  TunnelService.DSHostname := AHostname;
end;

procedure TDSHTTPServer.SetDSPort(APort: Integer);
begin
  FDSPort := Aport;
  TunnelService.DSPort := APort;
end;

procedure TDSHTTPServer.SetDSServerName(AName: string);
begin
  FDSServerName := AName;
  TunnelService.HasLocalServer := AName <> EmptyStr;
end;

procedure TDSHTTPServer.SetFilters(AFilterCollection: TTransportFilterCollection);
begin
  FFilters := AFilterCollection;
  TunnelService.Filters := AFilterCollection;
end;

procedure TDSHTTPServer.SetRestContext(const ctx: String);
begin
  if (ctx <> EmptyStr) and
     (ctx[Length(ctx)] = '/') then
      FRESTContext := Copy(ctx, 1, Length(ctx)-1)
  else
    FRESTContext := ctx;
end;

procedure TDSHTTPServer.CloseSessionTunnels(Session: TDSSession);
var
  RESTService: TDSRESTService;
  CloseTunnelRequest: String;
  RespHandler: TDSServiceResponseHandler;
  Obj: TObject;
  InfoList: TList<TDSSessionTunnelInfo>;
  Info: TDSSessionTunnelInfo;
  I: Integer;
begin
  InfoList := nil;

  if Session.HasObject(TUNNEL_INFO_LIST) then
  begin
    Obj := Session.GetObject(TUNNEL_INFO_LIST);
    if Obj Is TList<TDSSessionTunnelInfo> then
      InfoList := TList<TDSSessionTunnelInfo>(Obj);
  end;

  if (Session <> nil) and (InfoList <> nil) then
  begin
    for I := 0 to (InfoList.Count - 1) do
    begin
      Info := InfoList.Items[I];

      CloseTunnelRequest :=
        Format('/DSAdmin/CloseClientChannel/%s/%s/', [Info.ClientChannelId, Info.SecurityToken]);

      RESTService := CreateRESTService(Info.AuthUser, Info.AuthPassword);
      RespHandler := TDSResponseHandlerFactory.CreateResponseHandler(RESTService, nil, hcGET);

      try
        try
          RESTService.ProcessGETRequest(CloseTunnelRequest, nil, nil, RespHandler);
        except
        end;
      finally
        FreeAndNil(RespHandler);
      end;
    end;
  end;
end;

procedure TDSHTTPServer.UpdateSessionTunnelHook(Request: String; Session: TDSSession; RequestInfo: TDSHTTPRequest);
var
  SessionChannelName: String;
  SessionClientChannelId: String;
  SessionSecurityToken: String;
  Obj: TObject;
  Info: TDSSessionTunnelInfo;
  InfoList: TList<TDSSessionTunnelInfo>;
  I: Integer;
begin
  Assert(Session <> nil);
  Assert(RequestInfo <> nil);

  if IsOpeningClientChannel(Request) then
  begin
    if GetClientChannelInfo(Request, SessionChannelName, SessionClientChannelId, SessionSecurityToken) then
    begin
      Info.ChannelName := SessionChannelName;
      Info.ClientChannelId := SessionClientChannelId;
      Info.SecurityToken := SessionSecurityToken;
      Info.AuthUser := RequestInfo.AuthUserName;
      Info.AuthPassword := RequestInfo.AuthPassword;

      if not Session.HasObject(TUNNEL_INFO_LIST) then
        Session.PutObject(TUNNEL_INFO_LIST, TList<TDSSessionTunnelInfo>.Create);

      Obj := Session.GetObject(TUNNEL_INFO_LIST) ;

      if (Obj Is TList<TDSSessionTunnelInfo>) then
        TList<TDSSessionTunnelInfo>(Obj).Add(Info);
    end;
  end
  else if IsClosingClientChannel(Request) then
  begin
    if GetClientChannelInfo(Request, SessionChannelName, SessionClientChannelId, SessionSecurityToken) then
    begin
      Obj := Session.GetObject(TUNNEL_INFO_LIST); //SessionClientChannelId
      if Obj Is TList<TDSSessionTunnelInfo> then
      begin
        InfoList := TList<TDSSessionTunnelInfo>(Obj);
        for I := 0 to (InfoList.Count - 1) do
        begin
          Info := InfoList.Items[I];
          if (SessionClientChannelId = Info.ClientChannelId) and (SessionSecurityToken = Info.SecurityToken) then
          begin
            InfoList.Delete(I);
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

function TDSHTTPServer.ByteContent(DataStream: TStream): TBytes;
var
  Buffer: TBytes;
begin
  if not Assigned(DataStream) then
    exit(nil);

  SetLength(Buffer, DataStream.Size);
  // the content may have been read
  DataStream.Position := 0;
  if DataStream.Size > 0 then
    DataStream.Read(Buffer[0], DataStream.Size);

  Result := Buffer;
end;

function TDSHTTPServer.ByteContent(JsonValue: TJSONValue): TBytes;
var
  Buffer: TBytes;
begin
  SetLength(Buffer, JsonValue.EstimatedByteSize);
  SetLength(Buffer, JsonValue.ToBytes(Buffer, 0));

  Result := Buffer;
end;


function TDSHTTPServer.GetRequestSessionId(const ARequestInfo: TDSHTTPRequest;
                                           const CheckURLParams: boolean): String;
var
  SessionID: String;
  PragmaStr: String;
  PragmaList: TStringList;
begin
  //empty string will be returned for session ID unless found in Pragma header
  SessionID := '';

  if CheckURLParams then
  begin
    SessionID := ARequestInfo.Params.Values['SESSIONID'];
    if SessionID = '' then
      SessionID := ARequestInfo.Params.Values['sid'];
  end;

  //if no session ID is given in the URL, then try to load it from the Pragma header field
  if SessionID = '' then
  begin
    PragmaStr := ARequestInfo.Pragma;
    if PragmaStr <> '' then
    begin
      PragmaList := TStringList.Create;
      PragmaList.CommaText := PragmaStr;

      //Pragma is a comma-separaged list of keys with optional value pairings.
      //session id is stored as a key/value pair with "dssession" as the key
      SessionID := PragmaList.Values['dssession'];

      FreeAndNil(PragmaList);
    end;
  end;

  Result := SessionID;
end;

function TDSHTTPServer.LoadSession(const SessionId: String; const UserName: String;
                                   out IsNewSession: boolean): boolean;
var
  Session: TDSSession;
begin
  TDSSessionManager.ClearThreadSession;

  //if session id wasn't specified then create a new session
  if SessionID = '' then
  begin
    IsNewSession := True;

    Session := TDSSessionManager.Instance.CreateSession<TDSRESTSession>(function: TDSSession begin
        Result := TDSRESTSession.Create(FDSHTTPAuthenticationManager);
        Result.ObjectCreator := FTunnelService;
    end, UserName);

     //must have activity at least once every X minutes to be valid
    if FSessionTimeout > 0 then
    begin
      Session.LifeDuration := FSessionTimeout;
      Session.ScheduleInactiveTerminationEvent;
    end;
  end
  else
  begin
    IsNewSession := False;

    //check if the Session ID is valid by trying to get it's matching session from the manager
    Session := TDSSessionManager.Instance.Session[SessionID];

    //if the session ID wasn't valid, return false showing session retrieval failed
    if (Session = nil) or (not Session.IsValid) then
    begin
      exit(False);
    end
    else
      Session.MarkActivity; //session is being used again, so mark as active
  end;

  if Session <> nil then
    TDSSessionManager.SetAsThreadSession(Session);

  exit(True);
end;

procedure TDSHTTPServer.DoDSCacheCommand(ARequestInfo: TDSHTTPRequest;
                                         AResponseInfo: TDSHTTPResponse;
                                         Request: String;
                                         LocalConnection: Boolean);
var
  CmdType: TDSHTTPCommandType;
  SessionID: String;
  Session: TDSSession;
  IsNewSession: Boolean;
  SessionFailure: Boolean;
  CacheService: TDSHTTPCacheContextService;
  Len: Integer;
  ParamName: String;
begin
  CacheService := nil;
  CmdType := ARequestInfo.CommandType;

  //if no session ID is given in the URL, then try to load it from the Pragma header field
  SessionID := GetRequestSessionId(aRequestInfo, True);

  //Try to load the session with the given session ID into the current thread
  SessionFailure :=
     not LoadSessionUpdate(SessionID, ARequestInfo.AuthUserName, FSessionTimeout,
                           FTunnelService, FDSHTTPAuthenticationManager, ARequestInfo,
                           IsNewSession);
  Session := TDSSessionManager.GetThreadSession;

  //free any stream which was stored from a previous execution
  if Session <> nil then
  begin
    Session.LastResultStream.Free;
    Session.LastResultStream := nil;
  end;

  try
    if (Session = nil) or SessionFailure then
    begin
      AResponseInfo.ResponseNo := 403; //Forbidden
      AResponseInfo.ResponseText := SSessionExpiredTitle;
      AResponseInfo.ContentText := '{"SessionExpired":"' + SSessionExpiredMsg + '"}';
    end
    else
    begin
      CacheService := TDSHTTPCacheContextService.Create(Session, LocalConnection);

      Len := 0;
      while (Len < ARequestInfo.Params.Count) do
      begin
        try
          ParamName := ARequestInfo.Params.Names[Len];
          CacheService.ProcessQueryParameter(ParamName, ARequestInfo.Params.Values[ParamName]);
        finally
          Inc(Len);
        end;
      end;

      // dispatch to the appropriate service
      case CmdType of
        hcGET: CacheService.ProcessGETRequest(ARequestInfo, AResponseInfo, Request);
        hcDELETE: CacheService.ProcessDELETERequest(ARequestInfo, AResponseInfo, Request);
        else
        begin
          AResponseInfo.ResponseNo := 501;
          AResponseInfo.ContentText := Format(SCommandNotSupported, [ARequestInfo.Command]);
        end;
      end;
    end;
  finally
    CacheService.Free;
    AResponseInfo.CloseConnection := true;
    TDSSessionManager.ClearThreadSession;
  end;
end;

function TDSHTTPServer.CreateRESTService(const AuthUserName, AuthPassword: String): TDSRESTService;
begin
  if FCredentialsPassthrough then
    Result := TDSRESTService.Create(FDSServerName, FDSHostname, FDSPort, AuthUserName, AuthPassword, IPImplementationID)
  else
    Result := TDSRESTService.Create(FDSServerName, FDSHostname, FDSPort, FDSAuthUser, FDSAuthPassword, IPImplementationID);
end;

procedure TDSHTTPServer.DoDSRESTCommand(ARequestInfo: TDSHTTPRequest;
                                        AResponseInfo: TDSHTTPResponse;
                                        Request: String);
var
  CmdType: TDSHTTPCommandType;
  ResponseOk: Integer;
  RESTService: TDSRESTService;
  Len: Integer;
  ParamName: String;
  SessionID: String;
  Session: TDSSession;
  IsNewSession: Boolean;
  SessionFailure: Boolean;
  RespHandler: TDSServiceResponseHandler;
  OwnService: Boolean;
begin
  OwnService := True;
  RespHandler := nil;

  CmdType := ARequestInfo.CommandType;
  ResponseOk := 200;

  RESTService := CreateRESTService(ARequestInfo.AuthUserName, ARequestInfo.AuthPassword);

  // process query parameters
  Len := 0;
  while (Len < ARequestInfo.Params.Count) and (ResponseOk < 300) do
  begin
    ParamName := ARequestInfo.Params.Names[Len];
    //check for session ID parameter in the URL
    if (Uppercase(ParamName) = 'SESSIONID') or (Uppercase(ParamName) = 'SID') then
    begin
      SessionID := ARequestInfo.Params.Values[ParamName]
    end
    else if not RESTService.ProcessQueryParameter(ParamName, ARequestInfo.Params.ValueFromIndex[Len]) then
    begin
      ResponseOK := 409;
      AResponseInfo.ResponseText := Format(SCannotProcessParam, [ARequestInfo.Params.Names[Len],
                                           ARequestInfo.Params.Values[ARequestInfo.Params.Names[Len]]]);
    end;
    Inc(Len);
  end;
  if (ResponseOK < 300) and not RESTService.CheckConvertersForConsistency then
  begin
    // 409 - Indicates that the request could not be processed because of conflict in the request
    AResponseInfo.ResponseNo := 409;
    AResponseInfo.ResponseText := SConflictQueryParam;
  end;

  //if no session ID is given in the URL, then try to load it from the Pragma header field
  if SessionID = EmptyStr then
  begin
    SessionID := GetRequestSessionId(aRequestInfo, False);
  end;

  //Try to load the session with the given session ID into the current thread
  SessionFailure :=
     not LoadSessionUpdate(SessionID, ARequestInfo.AuthUserName, FSessionTimeout,
                           FTunnelService, FDSHTTPAuthenticationManager, ARequestInfo,
                           IsNewSession);
  Session := TDSSessionManager.GetThreadSession;

  //free any stream which was stored from a previous execution
  if Session <> nil then
  begin
    Session.LastResultStream.Free;
    Session.LastResultStream := nil;

    if not SessionFailure then
      UpdateSessionTunnelHook(Request, Session, ARequestInfo);
  end;

  if not SessionFailure and IsClosingSession(Request) then
  begin
    try
      CloseRESTSession(Session, AResponseInfo);
    finally
      FreeAndNil(RESTService);
      TDSSessionManager.ClearThreadSession;
    end;
    exit;
  end;

  try
    if SessionFailure then
    begin
      AResponseInfo.ResponseNo := 403; //Forbidden
      AResponseInfo.ResponseText := SSessionExpiredTitle;
      AResponseInfo.ContentText := '{"SessionExpired":"' + SSessionExpiredMsg + '"}';
    end
    else if ResponseOK >= 300 then
    begin
      // pre-parsing failed and the decision is in ResponseOK, response text already set
      AResponseInfo.ResponseNo := ResponseOK;
    end
    //don't need to authenticate if returning to a previously authenticated session
    else if (FDSHTTPAuthenticationManager <> nil) and IsNewSession and not FDSHTTPAuthenticationManager.Authenticate(
                    DATASNAP_CONTEXT, RESTContext, ARequestInfo.AuthUserName, ARequestInfo.AuthPassword,
                      ARequestInfo, AResponseInfo) then
      if ARequestInfo.AuthUserName <> EmptyStr then
        AResponseInfo.ResponseNo := 403
      else
      begin
        AResponseInfo.SetHeaderAuthentication('Basic', 'REST');
        AResponseInfo.ResponseNo := 401
      end
    else
    begin
      if Session <> nil then
      begin
        AResponseInfo.Pragma := 'dssession=' + Session.SessionName;
        AResponseInfo.Pragma := AResponseInfo.Pragma + ',dssessionexpires=' + IntToStr(Session.ExpiresIn);
      end;

      OwnService := False;
      //create the response handler for populating the response info
      RespHandler := TDSResponseHandlerFactory.CreateResponseHandler(RESTService, ARequestInfo, hcUnknown, Self);

      if RespHandler = nil then
      begin
        AResponseInfo.ResponseNo := 406; //Not Acceptable
      end
      else
      begin
        //add the query parameters to invocation metadata
        if ARequestInfo.Params.Count > 0 then
          GetInvocationMetadata().QueryParams.AddStrings(ARequestInfo.Params);

        // dispatch to the appropriate service
        case CmdType of
        hcGET:
          RESTService.ProcessGETRequest(Request, nil, nil, RespHandler);
          hcPOST:
            RESTService.ProcessPOSTRequest(Request, ARequestInfo.Params, byteContent( ARequestInfo.PostStream ),
                                        RespHandler);
          hcPUT:
          begin
            RESTService.ProcessPUTRequest(Request, ARequestInfo.Params, byteContent( ARequestInfo.PostStream ),
                                        RespHandler);
          end;
          hcDELETE:
            RESTService.ProcessDELETERequest(Request, nil, nil, RespHandler);
          else
          begin
            GetInvocationMetadata().ResponseCode := 501;
            GetInvocationMetadata().ResponseContent := Format(SCommandNotSupported, [ARequestInfo.Command]);
          end;
        end;

        //populate the Response Info from the execution result
        RespHandler.PopulateResponse(AResponseInfo, GetInvocationMetadata());
      end;
    end;
  finally
    if RespHandler = nil then
      FreeAndNil(RESTService);

    if RespHandler <> nil then
      RespHandler.Close;

    if OwnService then
      FreeAndNil(RESTService);

    if (GetInvocationMetadata(False) <> nil) and
         GetInvocationMetadata.CloseSession and
        (TDSSessionManager.GetThreadSession <> nil) then
      TDSSessionManager.Instance.CloseSession(TDSSessionManager.GetThreadSession.SessionName);

    TDSSessionManager.ClearThreadSession;
  end;
end;

procedure TDSHTTPServer.DoJSONCommand(ARequestInfo: TDSHTTPRequest;
                                      AResponseInfo: TDSHTTPResponse;
                                      Request: String);
var
  CmdType: TDSHTTPCommandType;
  JSONService: TDSJSONService;
  RespHandler: TDSServiceResponseHandler;
  SessionID: String;
  SessionFailure: Boolean;
  IsNewSession: Boolean;
begin
  if FCredentialsPassThrough then
    JSONService := TDSJSONService.Create(FDSServerName, FDSHostname, FDSPort, ARequestInfo.AuthUserName, ARequestInfo.AuthPassword, IPImplementationID)
  else
    JSONService := TDSJSONService.Create(FDSServerName, FDSHostname, FDSPort, FDSAuthUser, FDSAuthPassword, IPImplementationID);

  SessionID := GetRequestSessionId(aRequestInfo, True);
  SessionFailure :=
     not LoadSessionUpdate(SessionID, ARequestInfo.AuthUserName, FSessionTimeout,
                           FTunnelService, FDSHTTPAuthenticationManager, ARequestInfo,
                           IsNewSession);

  //create the response handler for populating the response info
  RespHandler := TDSResponseHandlerFactory.CreateResponseHandler(JSONService, ARequestInfo, hcUnknown, Self);

  CmdType := ARequestInfo.CommandType;
  try
    if SessionFailure then
    begin
      AResponseInfo.ResponseNo := 403; //Forbidden
      AResponseInfo.ResponseText := SSessionExpiredTitle;
      AResponseInfo.ContentText := '{"SessionExpired":"' + SSessionExpiredMsg + '"}';
    end
    else if RespHandler = nil then
    begin
      AResponseInfo.ResponseNo := 406; //Not Acceptable
    end
    else
      begin
      try
        //Even if only executing a single command, the result will be an array of result objects.
        RespHandler.ForceResultArray := True;

        case CmdType of
        hcGET:
          JSONService.ProcessGETRequest(Request, nil, ByteContent(ARequestInfo.PostStream),
                                        RespHandler);
          hcPOST:
            JSONService.ProcessPOSTRequest(Request, nil, ByteContent(ARequestInfo.PostStream),
                                        RespHandler);
          hcPUT:
            JSONService.ProcessPUTRequest(Request, nil, ByteContent(ARequestInfo.PostStream),
                                        RespHandler);
          hcDElETE:
            JSONService.ProcessDELETERequest(Request, nil, ByteContent(ARequestInfo.PostStream),
                                        RespHandler);
          else
          begin
            GetInvocationMetadata().ResponseCode := 501;
            GetInvocationMetadata().ResponseContent := Format(SCommandNotSupported, [ARequestInfo.Command]);
          end;
        end;

        //populate the Response Info from the execution result
        RespHandler.PopulateResponse(AResponseInfo, GetInvocationMetadata());
      except on Ex: Exception do
      begin
        AResponseInfo.ResponseNo := 500;
        AResponseInfo.ResponseText := Ex.Message;
      end;
    end;
  end;
  finally
    if RespHandler = nil then
      FreeAndNil(JSONService);

    if RespHandler <> nil then
      RespHandler.Close;
  end;
end;

procedure TDSHTTPServer.DoTunnelCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
                                        AResponseInfo: TDSHTTPResponse);
var
  CmdType: TDSHTTPCommandType;
  JsonResponse: TJSONValue;
  Len: Integer;
  NeedsAuthentication: Boolean;
  CloseConnection: boolean;
  ClientInfo: TDBXClientInfo;
begin
  JsonResponse := nil;
  CmdType := ARequestInfo.CommandType;

  // Note that CredentialsPassthrough, DSAuthUser and DSAuthPassword properties
  // do not apply when tunneling using a DBX connection (which is what is happening in this method).
  // Instead, the DBX connection string credentials from the client are passed though the
  // tunnel without modification.
  // The CredentialsPassthrough, DSAuthUser and DSAuthPassword properties
  // do apply when tunneling using a REST connection. See TDSHTTPServer.DoJSONCommand.

  // Optionally, the client may send user/password in HTTP headers in addition to the
  // credentials in the DBX connection string.  If the tunnel is between processea, this gives
  // the HTTP end of the tunnel a chance to authenticate before the TCP/IP end.
  // HTTP authentication is ignored when tunneling in-process because authentication will take place
  // when the DBX connection string is received from the client.
  NeedsAuthentication := (not FTunnelService.HasLocalServer) and FTunnelService.NeedsAuthentication(ARequestInfo.Params);

  ClientInfo.IpAddress := ARequestInfo.RemoteIP;
  ClientInfo.Protocol := ARequestInfo.ProtocolVersion;
  ClientInfo.AppName := ARequestInfo.UserAgent;

  //initialize the session so that it will be available when authenticating.
  FTunnelService.InitializeSession(ARequestInfo.Params, ClientInfo);

  try
    try
      if (FDSHTTPAuthenticationManager <> nil) and NeedsAuthentication and
          not FDSHTTPAuthenticationManager.Authenticate(DATASNAP_CONTEXT, TUNNEL_CONTEXT,
              ARequestInfo.AuthUserName, ARequestInfo.AuthPassword, ARequestInfo, AResponseInfo) then
        AResponseInfo.ResponseNo := 401
      else
      begin
        case CmdType of
          hcGET:
          begin
            Len := 0;
            AResponseInfo.ContentStream := FTunnelService.ProcessGET(ARequestInfo.Params, Len, CloseConnection);
            AResponseInfo.ContentLength := Len;
            AResponseInfo.CloseConnection := CloseConnection;
            if Len = 0 then
            begin
              // no data are available from DS - server error
              AResponseInfo.ResponseNo := 500;
              AResponseInfo.ResponseText := SNoServerData;
              AResponseInfo.CloseConnection := true;
            end;
          end;
          hcPUT, hcPOST:
          begin
            FTunnelService.ProcessPOST(ARequestInfo.Params, ByteContent(ARequestInfo.PostStream),
                                       JsonResponse, CloseConnection);
            AResponseInfo.CloseConnection := CloseConnection;
          end;
          hcDELETE:
          begin
            AResponseInfo.ResponseNo := 501;
            AResponseInfo.ResponseText := Format(SProtocolCommandNotSupported, [ARequestInfo.Command]);
            AResponseInfo.CloseConnection := true;
          end
          else
          begin
            AResponseInfo.ResponseNo := 501;
            AResponseInfo.ResponseText := Format(SProtocolCommandNotSupported, [ARequestInfo.Command]);
            AResponseInfo.CloseConnection := true;
          end;
        end;

        if JsonResponse <> nil then
        begin
          AResponseInfo.ResponseNo := 200;
          AResponseInfo.ContentText := StringOf(ByteContent(JsonResponse));
        end;
      end;
    except on Ex: Exception do
    begin
      AResponseInfo.ResponseNo := 500;
      AResponseInfo.ResponseText := Ex.message;
      AResponseInfo.CloseConnection := true;
    end;
  end;
  finally
    JsonResponse.Free;
    // if client dropped the connection session can be terminated.
    try
      if not AContext.Connected then
        TDSTunnelService.TerminateSession(ARequestInfo.Params);
    except on Exception do
      TDSTunnelService.TerminateSession(ARequestInfo.Params);
    end;
  end;
end;

procedure TDSHTTPServer.DoCommand(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
                                  AResponseInfo: TDSHTTPResponse);
var
  Request: String;
  NextRequest: String;
  RestCtxt: String;
begin
{$IFNDEF POSIX}
  if CoInitFlags = -1 then
    CoInitializeEx(nil, COINIT_MULTITHREADED)
  else
    CoInitializeEx(nil, CoInitFlags);
{$ENDIF}
  try
    // check for context, if not found send the appropriate error message
    Request := ARequestInfo.URI;
    if Consume(FDSContext, Request, NextRequest) then
    begin
      Request := NextRequest;
      if Consume(JSON_CONTEXT, Request, NextRequest) then
      begin
        //json (batch execution)
        DoJSONCommand(ARequestInfo, AResponseInfo, NextRequest);
      end
      else if Consume(TUNNEL_CONTEXT, Request, NextRequest) then
      begin
        //tunnel
        DoTunnelCommand(AContext, ARequestInfo, AResponseInfo);
      end
      else if Consume(FRESTContext, Request, NextRequest) then
      begin
        // datasnap/rest
        DoDSRESTCommand(ARequestInfo, AResponseInfo, NextRequest);
      end
      else if Consume(FCacheContext, Request, NextRequest) then
      begin
        // datasnap/cache
        DoDSCacheCommand(ARequestInfo, AResponseInfo, NextRequest, FDSServerName <> EmptyStr);
      end
      else
      begin
        RestCtxt := Trim(FRESTContext);
        if RestCtxt = EmptyStr then
          RestCtxt := SProtocolRestEmpty;

        AResponseInfo.ResponseNo := 501; {rest or other service not found in URI}
        AResponseInfo.ContentText := Format(SProtocolNotSupported, [Request, RestCtxt]);
        AResponseInfo.CloseConnection := true;
      end;
    end
    else
    begin
      DoCommandOtherContext(AContext, ARequestInfo, AResponseInfo, Request);
    end;
    if Assigned(Self.FTrace ) then
    begin
      FTrace(Self, AContext, ARequestInfo, AResponseInfo);
    end;
  finally
    ClearInvocationMetadata();
{$IFNDEF POSIX}
    CoUnInitialize;
{$ENDIF}
  end;
end;

procedure TDSHTTPServer.DoCommandOtherContext(AContext: TDSHTTPContext; ARequestInfo: TDSHTTPRequest;
                                    AResponseInfo: TDSHTTPResponse; const ARequest: string);
begin
  AResponseInfo.ResponseNo := 404; {datasnap not found}
  AResponseInfo.ResponseText := Format(SInvalidDatasnapServerContext, [ARequest]);
  AResponseInfo.CloseConnection := true;
end;

function TDSHTTPServer.Consume(const Prefix: string; const Context: string; out Unused: String): boolean;
var
  SlashDel, StartIdx: Integer;
  Ctx: String;
begin
  // empty prefix is accepted
  if Prefix = '' then
  begin
    Unused := Context;
    exit(true);
  end;

  // find first and the second REQUEST_DELIMITER indexes
  StartIdx := 1;
  SlashDel := Pos(REQUEST_DELIMITER, Context);
  if SlashDel = 1 then
  begin
    StartIdx := 2;
    SlashDel := PosEx(REQUEST_DELIMITER, Context, StartIdx + 1);
  end;

  if SlashDel = 0 then
    SlashDel := PosEx(REQUEST_PARAM_DELIMITER, Context, StartIdx + 1);

  if SlashDel = 0 then
    SlashDel := Length(Context) + 1;
  Ctx := Decode(Copy(Context, StartIdx, SlashDel-StartIdx));

  if AnsiCompareText(Prefix, Ctx) = 0 then
  begin
    Unused := Copy(Context, SlashDel, Length(Context)-SlashDel+1);
    Result := true;
  end
  else
    Result := false;  // prefix not found
end;

{TDSHTTPServerTransport}

constructor TDSHTTPServerTransport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDSRESTContext := REST_CONTEXT;
  FDSCacheContext := CACHE_CONTEXT;
  FDSContext := DATASNAP_CONTEXT;
  FDSHostname := 'localhost';
  FDSPort := 211;
  FCredentialsPassThrough := false;
  FSessionTimeout := 1200000;
  FDSAuthUser := EmptyStr;
  FDSAuthPassword := EmptyStr;
  FResultEvent := nil;
end;

destructor TDSHTTPServerTransport.Destroy;
begin
  Server := nil;
  FreeAndNil(FHttpServer);
  //FreeAndNil(FDSHTTPAuthenticationManager);
  inherited;
end;

function TDSHTTPServerTransport.GetResultEvent: TDSRESTResultEvent;
begin
  if FHttpServer <> nil then
    Result := FHTTPServer.ResultEvent
  else
    Result := FResultEvent;
end;

procedure TDSHTTPServerTransport.SetResultEvent(const RestEvent: TDSRESTResultEvent);
begin
  FResultEvent := RestEvent;
  if FHttpServer <> nil then
    FHTTPServer.ResultEvent := RestEvent;
end;

function TDSHTTPServerTransport.GetRESTContext;
begin
  if FHttpServer <> nil then
    Result := FHTTPServer.RESTContext
  else
    Result := FDSRestContext + '/';
end;

procedure TDSHTTPServerTransport.SetRESTContext(const Ctx: string);
begin
  if (Ctx <> EmptyStr) and
     (Ctx[Length(Ctx)] = '/') then
      FDSRestContext := Copy(Ctx, 1, Length(Ctx)-1)
  else
    FDSRestContext := Ctx;
  if FHttpServer <> nil then
    FHTTPServer.RESTContext := Ctx;
end;

procedure TDSHTTPServerTransport.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) then
    if (AComponent = Server) then
      Server := nil
    else if (Assigned(FHttpServer)) and (AComponent = FHttpServer.DSAuthenticationManager) then
      FHttpServer.DSAuthenticationManager := nil;
    if AComponent = FAuthenticationManager  then
      FAuthenticationManager := nil;
end;

procedure TDSHTTPServerTransport.SetTraceEvent(Event: TDSHTTPServiceTraceEvent);
begin
  FTrace := Event;
  if FHttpServer <> nil then
    FHttpServer.FTrace := Event;
end;

function TDSHTTPServerTransport.GetTraceEvent;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.FTrace
  else
    Result := FTrace;
end;

procedure TDSHTTPServerTransport.InitializeHttpServer;
begin
  FHttpServer.Filters := Filters;
  FHTTPServer.CredentialsPassThrough := FCredentialsPassthrough;
  FHTTPServer.DSAuthUser := FDSAuthUser;
  FHTTPServer.DSAuthPassword := FDSAuthPassword;
  FHTTPServer.SessionTimeout := FSessionTimeout;
  FHTTPServer.DSPort := FDSPort;
  FHTTPServer.DSHostname := FDSHostname;
  FHTTPServer.DSContext := FDSContext;
  FHTTPServer.CacheContext := FDSCacheContext;
  FHTTPServer.RESTContext := FDSRestContext;
  FHTTPServer.ResultEvent := FResultEvent;
  FHTTPServer.DSAuthenticationManager := FAuthenticationManager;
  FHTTPServer.FTrace := FTrace;
  UpdateDSServerName;
end;

procedure TDSHTTPServerTransport.Loaded;
begin
  inherited;
  // Initialize server after properties have been loaded
  RequiresServer;
end;

procedure TDSHTTPServerTransport.SetAuthenticationManager(
  const AuthenticationManager: TDSCustomAuthenticationManager);
begin
  FAuthenticationManager := AuthenticationManager;
  if FHttpServer <> nil then
    FHttpServer.DSAuthenticationManager := AuthenticationManager;
end;

procedure TDSHTTPServerTransport.SetCacheContext(const Ctx: String);
begin
  if (Ctx <> EmptyStr) and
     (Ctx[Length(Ctx)] = '/') then
      FDSCacheContext := Copy(Ctx, 1, Length(Ctx)-1)
  else
    FDSCacheContext := Ctx;
  if FHttpServer <> nil then
    FHttpServer.CacheContext := Ctx;
end;

procedure TDSHTTPServerTransport.SetDSContext(const Ctx: String);
begin
  if (Ctx <> EmptyStr) and
     (Ctx[Length(Ctx)] = '/') then
      FDSContext := Copy(Ctx, 1, Length(Ctx)-1)
  else
    FDSContext := Ctx;
  if FHttpServer <> nil then
    FHttpServer.DSContext := Ctx;
end;

procedure TDSHTTPServerTransport.SetDSHostname(Host: String);
begin
  FDSHostname := Host;
  if FHttpServer <> nil then
    FHttpServer.DSHostname := Host;
end;

function TDSHTTPServerTransport.GetAuthenticationManager: TDSCustomAuthenticationManager;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.DSAuthenticationManager
  else
    Result := FAuthenticationManager;
end;

function TDSHTTPServerTransport.GetCacheContext: String;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.CacheContext
  else
    Result := FDSCacheContext + '/';
end;

function TDSHTTPServerTransport.GetDSContext: String;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.DSContext
  else
    Result := FDSContext + '/';
end;

function TDSHTTPServerTransport.GetDSHostname: String;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.DSHostname
  else
    Result := FDSHostname;
end;

procedure TDSHTTPServerTransport.SetDSPort(Port: Integer);
begin
  FDSPort := Port;
  if FHttpServer <> nil then
    FHttpServer.DSPort := Port;
end;

procedure TDSHTTPServerTransport.SetServer(const AServer: TDSCustomServer);
begin
  if AServer <> Server then
  begin
    if Server <> nil then
      Server.RemoveFreeNotification(Self);
    if AServer <> nil then
      AServer.FreeNotification(Self);

    inherited SetServer(AServer);

    if FHttpServer <> nil then
      UpdateDSServerName;
  end;
end;

procedure TDSHTTPServerTransport.UpdateDSServerName;
begin
  if Server <> nil then
  begin
    FHttpServer.DSServerName := Server.Name;
    FHttpServer.CreateProtocolHandlerFactory(self)
  end
  else
  begin
    FHttpServer.DSServerName := EmptyStr;
    FHttpServer.ClearProtocolHandlerFactory
  end;
end;

function TDSHTTPServerTransport.GetDSPort: Integer;
begin
  if Assigned(FHttpServer) then
    Result := FHttpServer.DSPort
  else
    Result := FDSPort;
end;

procedure TDSHTTPServerTransport.RequiresServer;
begin
  if FHttpServer = nil then
  begin
    FHTTPServer := CreateHttpServer;
    InitializeHttpServer;
  end;
end;

function TDSHTTPServerTransport.GetHttpServer: TDSHTTPServer;
begin
  RequiresServer;
  // Should not create during loading process because properties of transport may determine type of http server
  Assert(not (csLoading in ComponentState));
  Result := FHTTPServer;
end;

procedure TDSHTTPServerTransport.SetFilters(const Value: TTransportFilterCollection);
begin
  inherited SetFilters(Value);
  if FHttpServer <> nil then
    FHttpServer.Filters := GetFilters;
end;

procedure TDSHTTPServerTransport.ServerCloseAllTunnelSessions;
begin
  // Call private method of FHttpServer
  if FHttpServer <> nil then
    FHttpServer.CloseAllTunnelSessions;
end;

function TDSHTTPServerTransport.GetCredentialsPassThrough: boolean;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.CredentialsPassThrough
  else
    Result := FCredentialsPassThrough;
end;

function TDSHTTPServerTransport.GetDSAuthPassword: String;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.DSAuthPassword
  else
    Result := FDSAuthPassword;
end;

function TDSHTTPServerTransport.GetDSAuthUser: String;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.DSAuthUser
  else
    Result := FDSAuthUser;
end;

procedure TDSHTTPServerTransport.SetCredentialsPassThrough(const AFlag: boolean);
begin
  FCredentialsPassThrough := AFlag;
  if FHttpServer <> nil then
    FHttpServer.CredentialsPassThrough := AFlag
end;

procedure TDSHTTPServerTransport.SetDSAuthPassword(const UserPassword: String);
begin
  FDSAuthPassword := UserPassword;
  if FHttpServer <> nil then
    FHttpServer.DSAuthPassword := UserPassword
end;

procedure TDSHTTPServerTransport.SetDSAuthUser(const UserName: String);
begin
  FDSAuthUser := UserName;
  if FHttpServer <> nil then
    FHttpServer.DSAuthUser := UserName
end;

procedure TDSHTTPServerTransport.SetSessionTimeout(const Milliseconds: Integer);
begin
  FSessionTimeout := Milliseconds;
  if FHttpServer <> nil then
    FHttpServer.SessionTimeout := Milliseconds;
end;

function TDSHTTPServerTransport.GetSessionTimeout: Integer;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.SessionTimeout
  else
    Result := FSessionTimeout
end;

function TDSHTTPServerTransport.GetIPImplementationID: string;
begin
  if FHttpServer <> nil then
    Result := FHttpServer.IPImplementationID
  else
    Result := inherited;
end;

{ TDSClientCallbackChannelManager }

procedure TDSClientCallbackChannelManager.Broadcast(Data: TJSONValue; ChannelName: String);
var
  ValEnum: TEnumerator<TDSCallbackItem>;
  DoForAll: Boolean;
begin
  TMonitor.Enter(FLocalCallbackRepo);
  try
    // get the values enumerator
    ValEnum := FLocalCallbackRepo.Values.GetEnumerator;
    try
      DoForAll := (ChannelName = '') or (FChannelName = ChannelName);

      // invoke execute of each callback
      while ValEnum.MoveNext do
        if DoForAll or ValEnum.Current.ListeningOn(ChannelName) then
          ValEnum.Current.Callback.Execute(Data).Free;
    finally
      ValEnum.Free;
    end;
  finally
    TMonitor.Exit(FLocalCallbackRepo);
  end;
end;

procedure TDSClientCallbackChannelManager.BroadcastObject(Data: TJSONValue; ChannelName: String);
var
  ValEnum: TEnumerator<TDSCallbackItem>;
  DataObj: TObject;
  DoForAll: Boolean;
begin
  DataObj := UnMarshalJSON(Data);
  try
    TMonitor.Enter(FLocalCallbackRepo);
    try
      // get the values enumerator
      ValEnum := FLocalCallbackRepo.Values.GetEnumerator;
      try
        DoForAll := (ChannelName = '') or (FChannelName = ChannelName);

        // invoke execute of each callback
        while ValEnum.MoveNext do
          if DoForAll or ValEnum.Current.ListeningOn(ChannelName) then
            ValEnum.Current.Callback.Execute(DataObj).Free;
      finally
        ValEnum.Free;
      end;
    finally
      TMonitor.Exit(FLocalCallbackRepo);
    end
  finally
    DataObj.Free
  end
end;

function TDSClientCallbackChannelManager.CloseClientChannel: Boolean;
var
  Status : Boolean;
begin
  try
    //if the manager has been started, then we need to close it
    if State = ctsStarted then
    begin
      ExecuteRemote('DSAdmin', 'CloseClientChannel',
        procedure (Params: TDBXParameterList) begin
          Params[0].Value.AsString := FManagerId;
          Params[1].Value.AsString := FSecurityToken;
        end,
        procedure (Params: TDBXParameterList) begin
          Status := Params[2].Value.AsBoolean;
        end);
    end;
    Result := Status;
    //If the close command is successful, clear all local callback references
    if Status then
    begin
      FLocalCallbackRepo.Clear;
      FState := ctsStopped;
      FStateError := EmptyStr;
      NotifyChange(TunnelClose, EmptyStr, nil);
    end;
  except
    Result := false;
  end;
end;

function TDSClientCallbackChannelManager.Copy: TDSClientCallbackChannelManager;
begin
  Result := TDSClientCallbackChannelManager.Create(nil);
  Result.FDSHostname := FDSHostname;
  Result.FDSPort := FDSPort;
  Result.FDSPath := FDSPath;
  Result.FCommunicationProtocol := FCommunicationProtocol;
  Result.FChannelName := FChannelName;
  Result.FConnectionTimeout := FConnectionTimeout;
  Result.FCommunicationTimeout := FCommunicationTimeout;
  Result.FUserName := FUserName;
  Result.FPassword := FPassword;
  Result.FProxyHost := FProxyHost;
  Result.FProxyPort := FProxyPort;
  Result.FProxyUsername := FProxyUsername;
  Result.FProxyPassword := FProxyPassword;

  Result.OnServerConnectionTerminate := OnServerConnectionTerminate;
  Result.OnServerConnectionError := OnServerConnectionError;
  Result.OnChannelStateChange := OnChannelStateChange;
end;

constructor TDSClientCallbackChannelManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FIPImplementationID := '';
  FManagerId := TDSTunnelSession.GenerateSessionId;
  FLocalCallbackRepo := TObjectDictionary<String, TDSCallbackItem>.Create([doOwnsValues]);
  FChannelCallback := TDSChannelCallback.Create(Invoke, InvokeObject, Broadcast, BroadcastObject);
  FChannelCallback.AddRef; // take ownership
  FRegConverters := TObjectDictionary<String, TConverterEvent>.Create([doOwnsValues]);
  FRegReverters := TObjectDictionary<String, TReverterEvent>.Create([doOwnsValues]);
  FSecurityToken := IntToStr(Random(100000)) + '.' + IntToStr(Random(100000));
  FChannelManagerEvent := nil;
  FState := ctsStopped;
  FStateError := EmptyStr;

  FProxyPort := 8888;
end;

function TDSClientCallbackChannelManager.DBXConnectionProperties(NoTimeout: boolean): TDBXDatasnapProperties;
begin
  Result := TDBXDatasnapProperties.Create(nil);
  Result.Values[TDBXPropertyNames.DriverName] := 'Datasnap';
  Result.Values[TDBXPropertyNames.HostName] := FDSHostname;
  Result.Values[TDBXPropertyNames.CommunicationProtocol] := FCommunicationProtocol;
  Result.Values[TDBXPropertyNames.Port] := FDSPort;
  Result.Values[TDBXPropertyNames.URLPath] := FDSPath;
  Result.Values[TDBXPropertyNames.DSAuthenticationUser] := FUserName;
  Result.Values[TDBXPropertyNames.DSAuthenticationPassword] := FPassword;
  Result.Values[TDBXPropertyNames.DSProxyHost] := FProxyHost;
  Result.Values[TDBXPropertyNames.DSProxyPort] := IntToStr(FProxyPort);
  Result.Values[TDBXPropertyNames.DSProxyUsername] := FProxyUsername;
  Result.Values[TDBXPropertyNames.DSProxyPassword] := FProxyPassword;
  if not NoTimeout then
  begin
    Result.Values[TDBXPropertyNames.ConnectTimeout] := FConnectionTimeout;
    Result.Values[TDBXPropertyNames.CommunicationTimeout] := FCommunicationTimeout
  end
end;

destructor TDSClientCallbackChannelManager.Destroy;
begin
  try
    // unregister all outstanding callbacks
    CloseClientChannel();
  except
    // igonore I/O errors at this point
  end;

  // free the repo
  FreeAndNil( FLocalCallbackRepo );

  // release the callback
  FChannelCallback.Release;

  FreeAndNil(FRegConverters);
  FreeAndNil(FRegReverters);

  inherited;
end;

procedure TDSClientCallbackChannelManager.ExecuteRemote(const AClassName,
  AMethodName: String; ParamSetup, ParamCheckup: TParamSetup; NoTimeout: boolean);
var
  DBXConnection: TDBXConnection;
  DBXProperties: TDBXDatasnapProperties;
  DBXCommand: TDBXCommand;
begin
  DBXProperties := DBXConnectionProperties(NoTimeout);
  try
    DBXConnection := TDBXConnectionFactory.GetConnectionFactory.GetConnection(DBXProperties);
    try
      DBXCommand := DBXConnection.CreateCommand;
      try
        DBXCommand.CommandType := TDBXCommandTypes.DSServerMethod;
        DBXCommand.Text := Format('%s.%s', [AClassName, AMethodName]);
        DBXCommand.Prepare;

        ParamSetup(DBXCommand.Parameters);

        DBXCommand.ExecuteUpdate;
        ParamCheckup(DBXCommand.Parameters);
      finally
        try
          DBXCommand.Close;
        except
          // ignore closing exceptions
        end;
        DBXCommand.Free;
      end;
    finally
      try
        DBXConnection.Close;
      except
        // ignore it
      end;
      DBXConnection.Free;
    end;
  finally
    DBXProperties.Free;
  end;
end;

procedure TDSClientCallbackChannelManager.Invoke(const Id: String;
  Data: TJSONValue; out Response: TJSONValue);
var
  Item: TDSCallbackItem;
  Callback: TDBXCallback;
  ExecThread: TDSExecuteThread;
begin
  TMonitor.Enter(FLocalCallbackRepo);
  try
    if FLocalCallbackRepo.TryGetValue(Id, Item) then
    begin
      Callback := Item.Callback;
      try
        TMonitor.Enter(Callback);
        ExecThread := TDSExecuteThread.Create(Callback, Data);

        if not TMonitor.Wait(Callback, 5000) then
          ExecThread.Terminate;

        Response := ExecThread.Response;
      finally
        TMonitor.Exit(Callback);
        FreeAndNil(ExecThread);
      end;
    end
    else
      raise TDSServiceException.Create(Format(SNoRegisteredCallbackForId, [Id]));
  finally
    TMonitor.Exit(FLocalCallbackRepo);
  end;
end;

procedure TDSClientCallbackChannelManager.InvokeObject(const Id: String;
  Data: TJSONValue; out Response: TJSONValue);
var
  Item: TDSCallbackItem;
  Callback: TDBXCallback;
  ResponseObj: TObject;
  DataObj: TObject;
begin
  DataObj := UnMarshalJSON(Data);
  try
    TMonitor.Enter(FLocalCallbackRepo);
    try
      if FLocalCallbackRepo.TryGetValue(Id, Item) then
      begin
        Callback := Item.Callback;
        ResponseObj := Callback.Execute(DataObj);
        try
          Response := MarshalData(ResponseObj)
        finally
          ResponseObj.Free
        end
      end
      else
        raise TDSServiceException.Create(Format(SNoRegisteredCallbackForId, [Id]));
    finally
      TMonitor.Exit(FLocalCallbackRepo);
    end;
  finally
    DataObj.Free;
  end
end;

function TDSClientCallbackChannelManager.RegisterCallback(const ChannelNames: String;
                                                          const Callback: TDBXNamedCallback): boolean;
begin
  Result := RegisterCallback(Callback.Name, ChannelNames, Callback);
end;

function TDSClientCallbackChannelManager.RegisterCallback(const CallbackId: String;
                                                          const Callback: TDBXCallback): boolean;
begin
  Result := RegisterCallback(CallbackId, '', Callback);
end;

function TDSClientCallbackChannelManager.RegisterCallback(
  const CallbackId, ChannelNames: String; const Callback: TDBXCallback): boolean;
var
  Status: boolean;
  Item, LItem: TDSCallbackItem;
begin
  TMonitor.Enter(FLocalCallbackRepo);
  try
    if not FLocalCallbackRepo.ContainsKey(CallbackId) then
    begin
      Item := TDSCallbackItem.Create(FChannelName, Callback, ChannelNames);
      FLocalCallbackRepo.Add(CallbackId, Item);

      if FLocalCallbackRepo.Count = 1 then
      begin
        FState := ctsStarted;
        FStateError := EmptyStr;

        // start a thread if this is the first registered callback (check if there an active one)
        TDSChannelThread.Create(
          procedure
          begin
            try
              ExecuteRemote('DSAdmin', 'ConnectClientChannel',
                procedure (Params: TDBXParameterList)
                begin
                  Params[0].Value.AsString := FChannelName;
                  Params[1].Value.AsString := FManagerId;
                  Params[2].Value.AsString := CallbackId;
                  Params[3].Value.AsString := ChannelNames;
                  Params[4].Value.AsString := FSecurityToken;
                  Params[5].Value.SetCallbackValue(FChannelCallback);
                end,
                procedure (Params: TDBXParameterList)
                begin
                end,
                true);
            except
              on E: Exception do
              begin
                //remove callback, because it wasn't added successfully
                FLocalCallbackRepo.Remove(CallbackId);
                FState := ctsFailed;
                FStateError := E.Message;

                //don't pass item because we want it out of the callback repo list before sending the notification
                //this is because if the person receiving the notification tries to re-create the tunnel,
                //we need to be sure the tunnel repo is empty
                NotifyChange(TunnelClosedByServer, CallbackId, nil);
              end;
            end;
          end,
          Self);
        Status := true;

        if FLocalCallbackRepo.TryGetValue(CallbackId, LItem) then
          NotifyChange(TunnelCreate, CallbackId, LItem);
      end
      else
      begin
        Status := False;
        ExecuteRemote('DSAdmin', 'RegisterClientCallback',
          procedure (Params: TDBXParameterList) begin
            Params[0].Value.AsString := FManagerId;
            Params[1].Value.AsString := CallbackId;
            Params[2].Value.AsString := ChannelNames;
            Params[3].Value.AsString := FSecurityToken;
            Params[4].Value.SetCallbackValue(FChannelCallback);
          end,
          procedure (Params: TDBXParameterList) begin
            Status := Params[5].Value.AsBoolean;
          end);

          if Status then
            NotifyChange(CallbackAdded, CallbackId, Item);
      end;

      //remove callback, because it wasn't added successfully
      if not Status then
        FLocalCallbackRepo.Remove(CallbackId);
      Result := Status;
    end
    else
      Result := false;
  finally
    TMonitor.Exit(FLocalCallbackRepo);
  end;
end;

function TDSClientCallbackChannelManager.UnregisterCallback(const CallbackId: String): boolean;
var
  Status: boolean;
  Item: TDSCallbackItem;
begin
  TMonitor.Enter(FLocalCallbackRepo);
  try
    if FLocalCallbackRepo.ContainsKey(CallbackId) then
    begin
      ExecuteRemote('DSAdmin', 'UnregisterClientCallback',
        procedure (Params: TDBXParameterList) begin
          Params[0].Value.AsString := FManagerId;
          Params[1].Value.AsString := CallbackId;
          Params[2].Value.AsString := FSecurityToken;
        end,
        procedure (Params: TDBXParameterList) begin
          Status := Params[3].Value.AsBoolean;
        end);
      if Status then
      begin
        FLocalCallbackRepo.TryGetValue(CallbackId, Item);

        //notify of removal before it happens, so client has access to the Item.
        NotifyChange(CallbackRemoved, CallbackId, Item);

        FLocalCallbackRepo.Remove(CallbackId);

        // close the channel if no other callbacks are registered
        if FLocalCallbackRepo.Count = 0 then
        begin
          ExecuteRemote('DSAdmin', 'CloseClientChannel',
            procedure (Params: TDBXParameterList) begin
              Params[0].Value.AsString := FManagerId;
              Params[1].Value.AsString := FSecurityToken;
            end,
            procedure (Params: TDBXParameterList) begin
              Status := Params[2].Value.AsBoolean;
            end);

          if Status then
          begin
            FState := ctsStopped;
            FStateError := EmptyStr;
            NotifyChange(TunnelClose, CallbackId, nil);
          end;
        end;
      end;
      Result := Status;
    end
    else
      Result := false
  finally
    TMonitor.Exit(FLocalCallbackRepo);
  end;
end;

function TDSClientCallbackChannelManager.BroadcastToChannel(const Msg: TJSONValue;
                                                            ChannelName: String): boolean;
var
  Status: boolean;
begin
  if ChannelName = EmptyStr then
    ChannelName := FChannelName;

  Status := false;
  ExecuteRemote('DSAdmin', 'BroadcastToChannel',
    procedure (Params: TDBXParameterList) begin
      Params[0].Value.AsString := ChannelName;
      Params[1].Value.SetJSONValue(Msg, True);
    end,
    procedure (Params: TDBXParameterList) begin
      Status := Params[2].Value.AsBoolean;
    end);
  Result := Status;
end;

function TDSClientCallbackChannelManager.BroadcastObjectToChannel(const Msg: TObject; ChannelName: String): boolean;
var
  Status: boolean;
begin
  if ChannelName = EmptyStr then
    ChannelName := FChannelName;

  Status := false;
  ExecuteRemote('DSAdmin', 'BroadcastObjectToChannel',
    procedure (Params: TDBXParameterList) begin
      Params[0].Value.AsString := ChannelName;
      Params[1].Value.SetJSONValue(MarshalData(Msg), True);
      Msg.Free
    end,
    procedure (Params: TDBXParameterList) begin
      Status := Params[2].Value.AsBoolean;
    end);
  Result := Status;
end;

function TDSClientCallbackChannelManager.NotifyCallback(const CallbackId, ManagerId: String; const Msg: TJSONValue;
                                                        out Response: TJSONValue): boolean;
var
  Status: boolean;
  Resp: TJSONValue;
begin
  Status := false;
  ExecuteRemote('DSAdmin', 'NotifyCallback',
    procedure (Params: TDBXParameterList) begin
      Params[0].Value.AsString := ManagerId;
      Params[1].Value.AsString := CallbackId;
      Params[2].Value.SetJSONValue(Msg, True);
    end,
    procedure (Params: TDBXParameterList) begin
      Resp := Params[3].Value.GetJSONValue;
      Status := Params[4].Value.AsBoolean;
    end);
  Response := Resp;
  Result := Status;
end;

procedure TDSClientCallbackChannelManager.NotifyChange(EventType: TDSCallbackTunnelEventType;
                                                       const CallbackId: String;
                                                       Item: TDSCallbackItem);
var
  Event: TDSClientChannelEventItem;
begin
  //If the tunnel is stopped and the event isn't a tunnel create, then ignore it.
  if FStopped and (EventType <> TunnelCreate) then
    Exit;

  //if the current event is a stop event, then mark the channel as stopped
  FStopped := (EventType = TunnelClose) or (EventType = TunnelClosedByServer);

  if Assigned(FChannelManagerEvent) then
  begin
    Event.EventType := EventType;
    Event.TunnelId := FManagerId;
    Event.Tunnel := Self;
    Event.TunnelChannelName := FChannelName;
    Event.CallbackId := CallbackId;
    Event.CallbackItem := Item;

    try
      FChannelManagerEvent(Self, Event);
    except
    end;
  end;
end;

function TDSClientCallbackChannelManager.NotifyObjectCallback(const CallbackId, ManagerId: String; const Msg: TObject;
                                                        out Response: TObject): boolean;
var
  Status: boolean;
  Resp: TJSONValue;
begin
  Status := false;
  try
    ExecuteRemote('DSAdmin', 'NotifyObject',
      procedure (Params: TDBXParameterList) begin
        Params[0].Value.AsString := ManagerId;
        Params[1].Value.AsString := CallbackId;
        Params[2].Value.SetJSONValue(MarshalData(Msg), True);
        Msg.Free;
      end,
      procedure (Params: TDBXParameterList) begin
        Resp := Params[3].Value.GetJSONValue;
        Status := Params[4].Value.AsBoolean;
      end);
    Response := UnMarshalJSON(Resp);
  finally
    Resp.Free
  end;
  Result := Status;
end;

function TDSClientCallbackChannelManager.GetCallbackIds: TArray<String>;
begin
  if FLocalCallbackRepo <> nil then
    Result := FLocalCallbackRepo.Keys.ToArray
  else
    Result := nil;
end;

function TDSClientCallbackChannelManager.GetCallbackItem(const CallbackId: String;
                                                         out Item: TDSCallbackItem): boolean;
begin
  Result := False;
  Item := nil;

  if (FLocalCallbackRepo <> nil) and FLocalCallbackRepo.TryGetValue(CallbackId, Item) then
    Exit(True);
end;

function TDSClientCallbackChannelManager.GetIPImplementationID: string;
begin
  Result := FIPImplementationID;
end;

function TDSClientCallbackChannelManager.GetJSONMarshaler: TJSONMarshal;
begin
  // Get marshaller with registered converters
  Result := TJSONConverters.GetJSONMarshaler;
end;

function TDSClientCallbackChannelManager.GetJSONUnMarshaler: TJSONUnMarshal;
begin
  // Get unmarshaller with registered reverters
  Result := TJSONConverters.GetJSONUnMarshaler;
end;

procedure TDSClientCallbackChannelManager.AddConverter(event: TConverterEvent);
begin
  FRegConverters.Add(TJSONMarshal.ComposeKey(event.FieldClassType, event.FieldName), event);
end;

procedure TDSClientCallbackChannelManager.AddReverter(event: TReverterEvent);
begin
  FRegReverters.Add(TJSONMarshal.ComposeKey(event.FieldClassType, event.FieldName), event);
end;

function TDSClientCallbackChannelManager.MarshalData(Data: TObject): TJSONValue;
var
  marshal: TJSONMarshal;
begin
  marshal := GetJSONMarshaler;
  try
    Result := marshal.Marshal(Data);
  finally
    marshal.Free;
  end;
end;

function TDSClientCallbackChannelManager.UnMarshalJSON(Data: TJSONValue): TObject;
var
  unmarshal: TJSONUnMarshal;
begin
  unmarshal := GetJSONUnMarshaler;
  try
    Result := unmarshal.UnMarshal(Data);
  finally
    unmarshal.Free;
  end;
end;


function TDSClientCallbackChannelManager.RegisterCallback(const Callback: TDBXNamedCallback): boolean;
begin
  Result := RegisterCallback('', Callback);
end;

procedure TDSClientCallbackChannelManager.SetIPImplementationID(
  const AIPImplementationID: string);
begin
  FIPImplementationID := AIPImplementationID;
end;

{ TDSClientCallbackChannelManager.TDSChannelCallback }

constructor TDSClientCallbackChannelManager.TDSChannelCallback.Create(
  const InvokeEvent: TDSChannelInvokeEvent;
  const InvokeObjectEvent: TDSChannelInvokeEvent;
  const BroadcastEvent: TDSChannelBroadcastEvent;
  const BroadcastObjectEvent: TDSChannelBroadcastEvent);
begin
  FInvokeEvent := InvokeEvent;
  FInvokeObjectEvent := InvokeObjectEvent;
  FBroadcastEvent := BroadcastEvent;
  FBroadcastObjectEvent := BroadcastObjectEvent;
end;

destructor TDSClientCallbackChannelManager.TDSChannelCallback.Destroy;
begin

  inherited;
end;

function TDSClientCallbackChannelManager.TDSChannelCallback.Execute(
  const Arg: TJSONValue): TJSONValue;
var
  Data: TJSONObject;
  Cmd: TJSONPair;
  ChannelPair: TJSONPair;
  ArgType: Integer;
  ChannelName: String;
begin
  if not (Arg is TJSONObject) then
    raise TDSServiceException.Create(SJSONValueNotObject);

  Data := TJSONObject(Arg);

  Cmd := Data.Get('invoke');
  if Cmd = nil then
    Cmd := Data.Get('broadcast');
  ChannelPair := Data.Get('channel');

  if (Cmd <> nil) and (AnsiCompareText('invoke', Cmd.JsonString.Value) = 0) then
  begin
    ArgType := ((Cmd.JsonValue as TJSONArray).Get(2) as TJSONNumber).AsInt;
    if ArgType = TDBXCallback.ArgObject then
      FInvokeObjectEvent((Cmd.JsonValue as TJSONArray).Get(0).Value, (Cmd.JsonValue as TJSONArray).Get(1),
                 Result)
    else
      FInvokeEvent((Cmd.JsonValue as TJSONArray).Get(0).Value, (Cmd.JsonValue as TJSONArray).Get(1),
                 Result);
  end
  else if (Cmd <> nil) and (AnsiCompareText('broadcast', Cmd.JsonString.Value) = 0) then
  begin
    //get the value of 'channel' if there is one, and pass it into the broadcast event
    if ChannelPair <> nil then
      ChannelName := ChannelPair.JsonValue.Value;

    ArgType := ((Cmd.JsonValue as TJSONArray).Get(1) as TJSONNumber).AsInt;
    if ArgType = TDBXCallback.ArgObject then
      FBroadcastObjectEvent((Cmd.JsonValue as TJSONArray).Get(0), ChannelName)
    else
      FBroadcastEvent((Cmd.JsonValue as TJSONArray).Get(0), ChannelName);
    Result := TJSONTrue.Create;
  end
  else
    raise TDSServiceException.Create(Format(SCommandNotImplemented, [Cmd.JsonString]));
end;

{ TDSClientCallbackChannelManager.TDSChannelThread }

constructor TDSClientCallbackChannelManager.TDSChannelThread.Create(
  Worker: TDSWorker; Manager: TDSClientCallbackChannelManager);
begin
  FWorker := Worker;
  FManager := Manager;
  FreeOnTerminate := true;
  inherited Create(false);
end;

destructor TDSClientCallbackChannelManager.TDSChannelThread.Destroy;
begin
  try
    if FManager <> nil then
      FManager.NotifyChange(TunnelClosedByServer, EmptyStr, nil);
  finally
    inherited;
  end;
end;

procedure TDSClientCallbackChannelManager.TDSChannelThread.Execute;
begin
  try
    FWorker
  finally
  end;
end;

{ TDSDefaultResponseHandler }

procedure TDSDefaultResponseHandler.Close;
var
  Session: TDSSession;
begin
  //cache the Handler, so the stream isn't killed before the response is sent
  if FStoreHandler then
  begin
    Session := TDSSessionManager.Instance.GetThreadSession;
    if Session = nil then
      Raise TDSServiceException.Create(SNoSessionFound);

    if Session.LastResultStream <> nil then
    begin
      Session.LastResultStream.Free;
      Session.LastResultStream := nil;
    end;

    Session.LastResultStream := Self;
  end
  else
    Free;
end;

constructor TDSDefaultResponseHandler.Create(AllowBinaryStream: boolean; DSService: TDSService;
                                             CommandType: TDSHTTPCommandType; ServiceInstanceOwner: Boolean);
begin
  inherited Create(CommandType, DSService, ServiceInstanceOwner);

  FStoreHandler := False;
  FDSService := DSService;
end;

destructor TDSDefaultResponseHandler.Destroy;
begin
  ClearCommands();
  inherited;
end;

function TDSDefaultResponseHandler.HandleParameter(const Command: TDBXCommand;
  const Parameter: TDBXParameter; out Response: TJSONValue; var ResponseStream: TStream): Boolean;
begin
  {If there is only one output/return parameter and it is a Stream, return it as a stream}
  if (not FDSService.StreamAsJSON) and FAllowStream and
       (Parameter.DataType = TDBXDataTypes.BinaryBlobType) then
  begin
    //if FAllowStream is true there should be no case where we are
    //setting a value for stream when it already has a value
    Assert(ResponseStream = nil);

    ResponseStream := Parameter.Value.GetStream(True);
    if ResponseStream <> nil then
    begin
      //set this object to store itself in the Session, to be freed later,
      //after the stream it holds is no longer required by the REST response sent to the client.
      FStoreHandler := True;
    end
    else
      Response := TJSONNull.Create;
    exit(True);
  end;
  Result := False;
end;

procedure TDSDefaultResponseHandler.PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                                                    ResponseStream: TStream);
begin
  if (ResponseStream = nil) and Assigned(Response) then
    ResponseInfo.ContentText := StringOf(ByteContent(Response))
  else if (ResponseStream <> nil) then
  begin
    ResponseInfo.ContentStream := ResponseStream;
    ResponseInfo.FreeContentStream := False;
  end;
end;

{ TDSResponseHandlerFactory }

class function TDSResponseHandlerFactory.CreateResponseHandler(DSService: TDSService;
            RequestInfo: TDSHTTPRequest; CommandType: TDSHTTPCommandType;
            HTTPServer: TDSHTTPServer): TDSServiceResponseHandler;
var
  Accept: String;
begin
  if RequestInfo <> nil then
    Accept := RequestInfo.Accept;

  if (CommandType = hcUnknown) and (RequestInfo <> nil) then
    CommandType := RequestInfo.CommandType;

  if RequestInfo = nil then
    Result := TDSNullResponseHandler.Create(DSService, CommandType)
  else if (AnsiContainsStr(Accept, 'application/rest')) then
    Result := TDSCacheResponseHandler.Create(DSService, CommandType)
  else
  begin
    Result := TDSDefaultResponseHandler.Create(not DSService.StreamAsJSON, DSService, CommandType);
    if Assigned(HTTPServer) and Assigned(HTTPServer.ResultEvent) then
      TDSDefaultResponseHandler(Result).ResultEvent := HTTPServer.ResultEvent;
  end;
end;

{ TDSServiceResponseHandler }

constructor TDSServiceResponseHandler.Create(CommandType: TDSHTTPCommandType; LocalConnection: Boolean);
begin
  FCommandType := CommandType;
  FCommandList := TList<TDSExecutionResponse>.Create;
  FLocalConnection := LocalConnection;
  ForceResultArray := False;
end;

destructor TDSServiceResponseHandler.Destroy;
begin
  try
    ClearCommands();
    try
      FreeAndNil(FCommandList);
    except
    end;
  finally
    inherited;
  end;
end;

function TDSServiceResponseHandler.GetOKStatus: Integer;
begin
  case FCommandType of
    hcGET, hcDELETE, hcPOST: Result := 200;
    hcPUT: Result := 201;
    else
      Result := 501;
  end;
end;

function TDSServiceResponseHandler.GetResultCount: Integer;
var
  CommandWrapper: TDSExecutionResponse;
  Command: TDBXCommand;
  Count: Integer;
  ParamDirection: TDBXParameterDirection;
  I: Integer;
begin
  Count := 0;
  TMonitor.Enter(FCommandList);
  try
    for CommandWrapper in FCommandList do
    begin
      if CommandWrapper.Command = nil then
        Inc(Count)
      else
      begin
        Command := CommandWrapper.Command;
        for I := 0 to Command.Parameters.Count - 1 do
        begin
          // select the output and return parameters for the response
          ParamDirection := Command.Parameters[I].ParameterDirection;
          if (ParamDirection = TDBXParameterDirections.OutParameter) or
             (ParamDirection = TDBXParameterDirections.InOutParameter) or
             (ParamDirection = TDBXParameterDirections.ReturnParameter) then
          begin
            Inc(Count);
          end;
        end;
      end;
    end;
  finally
    TMonitor.Exit(FCommandList);
    Result := Count;
  end;
end;

procedure TDSServiceResponseHandler.AddCommand(Command: TDBXCommand; DBXConnection: TDBXConnection);
begin
  if (Command <> nil) and (DBXConnection <> nil) then
  begin
    TMonitor.Enter(FCommandList);
    try
      FCommandList.Add(TDSExecutionResponse.Create(Command, DBXConnection, FLocalConnection));
    finally
      TMonitor.Exit(FCommandList);
    end;
  end;
end;

procedure TDSServiceResponseHandler.ClearCommands;
var
  Command: TDSExecutionResponse;
begin
  TMonitor.Enter(FCommandList);
  try
    for Command in FCommandList do
    begin
      Command.Free;
    end;
    FCommandList.Clear;
  finally
    TMonitor.Exit(FCommandList);
  end;
end;

procedure TDSServiceResponseHandler.AddCommandError(ErrorMessage: String);
begin
 if (ErrorMessage <> '') then
 begin
   TMonitor.Enter(FCommandList);
   try
     FCommandList.Add(TDSExecutionResponse.create(ErrorMessage));
   finally
     TMonitor.Exit(FCommandList);
   end;
 end;
end;

function TDSServiceResponseHandler.ByteContent(JsonValue: TJSONValue): TBytes;
var
  Buffer: TBytes;
begin
  if Assigned(JsonValue) then
  begin
    SetLength(Buffer, JsonValue.EstimatedByteSize);
    SetLength(Buffer, JsonValue.ToBytes(Buffer, 0));
  end;
  Result := Buffer;
end;

{ TDSExecutionResponse }

constructor TDSExecutionResponse.Create(Command: TDBXCommand; DBXConnection: TDBXConnection;
                                        LocalConnection: boolean);
begin
  FCommand := Command;
  FDBXConnection := DBXConnection;
  FLocalConnection := LocalConnection;
  FErrorMessage := '';
end;

constructor TDSExecutionResponse.Create(ErrorMessage: String);
begin
  FCommand := nil;
  FDBXConnection := nil;
  FErrorMessage := ErrorMessage;
end;

destructor TDSExecutionResponse.Destroy;
begin
  if FCommand <> nil then
    FCommand.Close;

  if FDBXConnection <> nil then
    FDBXConnection.Close;

  FCommand.Free;

  if FLocalConnection and (FDBXConnection <> nil) then
    TDSServerConnection(FDBXConnection).ServerConnectionHandler.Free
  else
    FDBXConnection.Free;

  inherited;
end;

{ TDSCacheResponseHandler }

constructor TDSCacheResponseHandler.Create(DSService: TDSService; CommandType: TDSHTTPCommandType;
                                           ServiceInstanceOwner: Boolean);
begin
  Inherited Create(CommandType, DSService, ServiceInstanceOwner);
  FCacheId := -1;
end;

destructor TDSCacheResponseHandler.Destroy;
begin
  inherited;
end;

function TDSCacheResponseHandler.GetCacheObject: TDSCacheResultCommandHandler;
begin
  if (FResultHandler = nil) then
    FResultHandler := TDSCacheResultCommandHandler.Create(Self);

  Result := FResultHandler;
end;

function TDSCacheResponseHandler.GetComplexParams(Command: TDBXCommand; out Index: Integer;
                                                  AddIfNotFound: Boolean): TDSCommandComplexParams;
var
  CP: TDSCommandComplexParams;
  I: Integer;
begin
  Result := nil;
  Index := -1;

  for I := 0 to GetCacheObject.CacheCommands.Count - 1 do
  begin
    CP := GetCacheObject.CacheCommands[I];
    if CP.Command = Command then
    begin
      Index := I;
      Exit(CP);
    end;
  end;

  if AddIfNotFound then
  begin
    Index := GetCacheObject.CacheCommands.Count;
    CP := TDSCommandComplexParams.Create(Command);
    GetCacheObject.CacheCommands.Add(CP);
    Result := CP;
  end;
end;

procedure TDSCacheResponseHandler.Close;
begin
  //If FCacheId is not specified then this object isn't stored in the Session Cache, so should be freed here.
  if FCacheId = -1 then
    Free;
end;

function TDSCacheResponseHandler.HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                                                 out Response: TJSONValue; var ResponseStream: TStream): Boolean;
var
  CP: TDSCommandComplexParams;
  DataType: Integer;
  CommandIndex: Integer;
  ParameterIndex: Integer;
  Session: TDSSession;
  Cache: TDSSessionCache;
  UrlString: UnicodeString;
begin
  Result := False;

  Session := TDSSessionManager.GetThreadSession;

  if (Session <> nil) and (Parameter <> nil) then
  begin
    DataType := Parameter.DataType;
    if ((DataType = TDBXDataTypes.TableType) or
        (DataType = TDBXDataTypes.ObjectType) or
        ((DataType = TDBXDataTypes.JsonValueType) and
          (SameText(Parameter.TypeName, 'TJSONArray') or SameText(Parameter.TypeName, 'TJSONValue') or (SameText(Parameter.TypeName, 'TJSONObject') or
          (not SameText(Copy(Parameter.TypeName,0+1,5-(0)), 'TJSON'))))) or
        (DataType = TDBXDataTypes.BlobType) or
        (DataType = TDBXDataTypes.BinaryBlobType)) then
    begin
      CP := GetComplexParams(Command, CommandIndex);

      if (CP <> nil) then
      begin
        ParameterIndex := CP.AddParameter(Parameter);
        Cache := Session.ParameterCache;

        if (Cache <> nil) and (ParameterIndex > -1) then
        begin
          if FCacheId = -1 then
            FCacheId := Cache.AddItem(GetCacheObject());

          if FCacheId > -1 then
          begin
            Result := True;
            UrlString := (IntToStr(FCacheId) + '/' + IntToStr(CommandIndex) + '/' + IntToStr(ParameterIndex));
            Response := TJSONString.Create(UrlString);
          end;
        end;
      end;
    end;
  end;
end;

procedure TDSCacheResponseHandler.PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                                                  ResponseStream: TStream);
begin
  //ResponseStream should NEVER be assigned in this case,
  //as any streams should instead be stored in the session cache
  Assert(ResponseStream = nil);
  if Response <> nil then
  begin
    ResponseInfo.ContentText := StringOf(ByteContent(Response));
    ResponseInfo.ContentType := 'application/rest';
  end;
end;

procedure TDSCacheResponseHandler.ProcessResultObject(var ResultObj: TJSONObject; Command: TDBXCommand);
var
  CommandIndex: Integer;
begin
  if (ResultObj <> nil) and (FResultHandler <> nil) and
     (FResultHandler.CacheCommands.Count > 0) and (FCacheId > -1) then
  begin
    GetComplexParams(Command, CommandIndex, False);

    //Add to the result object two key/value pairs: cacheId and cmdIndex.
    //These can later be used to construct URLs into different levels of the Session Parameter cache
    if (CommandIndex > -1) then
    begin
      ResultObj.AddPair(TJSONPair.Create('cacheId', TJSONNumber.Create(FCacheId)));
      ResultObj.AddPair(TJSONPair.Create('cmdIndex', TJSONNumber.Create(CommandIndex)));
    end;
  end;
end;

{ TDSJsonResponseHandler }

constructor TDSJsonResponseHandler.Create(CommandType: TDSHTTPCommandType; DSService: TDSService;
                                          ServiceInstanceOwner: Boolean);
begin
  if not Assigned(DSService) then
    Raise TDSServiceException.Create(SRESTServiceMissing);

  inherited Create(CommandType, DSService.LocalConnection);
  FDSService := DSService;
  FServiceInstanceOwner := ServiceInstanceOwner;
end;

destructor TDSJsonResponseHandler.Destroy;
begin
  if FServiceInstanceOwner then
    FreeAndNil(FDSService);
  inherited;
end;

procedure TDSJsonResponseHandler.GetCommandResponse(Command: TDBXCommand; out Response: TJSONValue;
                                                    out ResponseStream: TStream);
var
  JsonParams: TJSONArray;
  JsonParam: TJSONValue;
  I: Integer;
  ParamDirection: TDBXParameterDirection;
  OwnParams: boolean;
  ConvList: TObjectList<TDBXRequestFilter>;
  ResponseObj: TJSONObject;
  Handled: boolean;
begin
  JsonParams := nil;
  OwnParams := false;
  ConvList := nil;
  ResponseStream := nil;
  Handled := False;

  try
    // collect the output/return parameters
    JsonParams := TJSONArray.Create;
    OwnParams := true;

    ConvList := TObjectList<TDBXRequestFilter>.Create(false);

    for I := 0 to Command.Parameters.Count - 1 do
    begin
      // select the output and return parameters for the response
      ParamDirection := Command.Parameters[I].ParameterDirection;
      if (ParamDirection = TDBXParameterDirections.OutParameter) or
         (ParamDirection = TDBXParameterDirections.InOutParameter) or
         (ParamDirection = TDBXParameterDirections.ReturnParameter) then
      begin
        JsonParam := nil;
        ConvList.Clear;

        {If a subclass doesn't handle the parameter themselves, then manage the parameter by either
         applying a filter on the result, or passing back the pure JSON representation}
        if not HandleParameter(Command, Command.Parameters[I], JsonParam, ResponseStream) then
        begin
          FDSService.FiltersForCriteria([I], I = Command.Parameters.Count - 1, ConvList);
          if ConvList.Count = 1 then
          begin
            if not ConvList.Items[0].CanConvert(Command.Parameters[I].Value) then
              Raise TDSServiceException.Create(Format(SCannotConvertParam, [I, ConvList.Items[0].Name]));
            JsonParam := ConvList.Items[0].ToJSON(Command.Parameters[I].Value, FDSService.LocalConnection);
          end
          else
          begin
            JsonParam := TDBXJSONTools.DBXToJSON(Command.Parameters[I].Value,
                              Command.Parameters[I].DataType, FDSService.LocalConnection);
          end;
        end;

        if JsonParam <> nil then
          JsonParams.AddElement(JsonParam);
      end;
    end;

    //Store the result array as a JSON Value, to make it more generic for the event and result object
    JsonParam := JsonParams;

    if Assigned(FResultEvent) then
      FResultEvent(Self, JsonParam, Command, Handled);

    if not Handled then
    begin
      ResponseObj := TJSONObject.Create(TJSONPair.Create(TJSONString.Create('result'), JsonParam));
      //allow subclasses to add to the result object if they wish
      ProcessResultObject(ResponseObj, Command);
      Response := ResponseObj;
    end
    else
      Response := JsonParam;

    OwnParams := false;
  finally
    FreeAndNil(ConvList);
    if OwnParams then
      JsonParams.Free;
  end;
end;

procedure TDSJsonResponseHandler.GetResponse(out Response: TJSONValue; out ResponseStream: TStream; out ContainsErrors: Boolean);
var
  CommandWrapper: TDSExecutionResponse;
  Command: TDBXCommand;
  SubResponse: TJSONValue;
  ResultArr: TJSONArray;
  ErrObj: TJSONObject;
begin
  ContainsErrors := false;
  ResponseStream := nil;
  ResultArr := nil;

  if ForceResultArray or (FCommandList.Count > 1) then
  begin
    ResultArr := TJSONArray.Create;
  end;

  try
    for CommandWrapper in FCommandList do
    begin
      //handle error message
      if CommandWrapper.Command = nil then
      begin
        ContainsErrors := True;
        ErrObj := TJSONObject.Create;
        ErrObj.AddPair(TJSONPair.Create(CMD_ERROR, CommandWrapper.ErrorMessage));

        if ResultArr <> nil then
        begin
          ResultArr.AddElement(ErrObj);
        end
        else
        begin
          Response := ErrObj;
          //there is only one command if ResultArr is nil but break here anyway just to be clear
          break;
        end;
      end
      //handle DBXCommand with results populated
      else
      begin
        SubResponse := nil;

        Command := CommandWrapper.Command;
        try
          GetCommandResponse(Command, SubResponse, ResponseStream);
        except on E: Exception do
          begin
            ContainsErrors := True;
            SubResponse := TJSONString.Create(E.Message);
          end;
        end;


        if ResponseStream <> nil then
        begin
          //ignore the content returned and free it, because the response content will be a stream
          FreeAndNil(SubResponse);
        end
        else
        begin
          if ResultArr <> nil then
          begin
            if SubResponse <> nil then
              ResultArr.AddElement(SubResponse);
          end
          else
          begin
            Response := SubResponse;
            //there is only one command if ResultArr is nil but break here anyway just to be clear
            break;
          end;
        end;
      end;
    end;
  finally
    if (ResponseStream = nil) and (ResultArr <> nil)  then
    begin
      Response := ResultArr;
    end
    else
    begin
      ResultArr.Free;
    end;
  end;

end;

procedure TDSJsonResponseHandler.PopulateResponse(ResponseInfo: TDSHTTPResponse;
                                                  InvokeMetadata: TDSInvocationMetadata);
var
  JsonResponse: TJSONValue;
  ResponseStream: TStream;
  ContainsErrors: Boolean;
begin
  JsonResponse := nil;
  ContainsErrors := False;

  FAllowStream := (GetResultCount = 1);

  if (not Assigned(FCommandList)) or (FCommandList.Count = 0) then
    Raise TDSServiceException.Create(SCommandUnassigned);

  try
    //only parse the Command for output if no content is specified in the invocation metadata
    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseContent <> '') then
    begin
      if (InvokeMetadata.ResponseContent = ' ') then
        InvokeMetadata.ResponseContent := '';

      ResponseInfo.ContentText := InvokeMetadata.ResponseContent;
      ResponseInfo.ContentLength := Length(ResponseInfo.ContentText);
    end
    else
    begin
      GetResponse(JsonResponse, ResponseStream, ContainsErrors);
      PopulateContent(ResponseInfo, JsonResponse, ResponseStream);
    end;

    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseCode <> 0) then
      ResponseInfo.ResponseNo := InvokeMetadata.ResponseCode
    else if ContainsErrors then
      ResponseInfo.ResponseNo := 500
    else
      ResponseInfo.ResponseNo := GetOKStatus;

    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseMessage <> '') then
      ResponseInfo.ResponseText := InvokeMetadata.ResponseMessage;

    if (InvokeMetadata <> nil) and (InvokeMetadata.ResponseContentType <> '') then
      ResponseInfo.ContentType := InvokeMetadata.ResponseContentType;
  finally
    FreeAndNil(JsonResponse);
  end;
end;

procedure TDSJsonResponseHandler.ProcessResultObject(var ResultObj: TJSONObject; Command: TDBXCommand);
begin
  //default implementation does nothing
end;

{ TDSCommandComplexParams }

constructor TDSCommandComplexParams.Create(Command: TDBXCommand);
begin
  if Command = nil then
    Raise TDSServiceException.Create(SCommandUnassigned);
  FCommand := Command;
  FParameters := TList<TDBXParameter>.Create;
end;

destructor TDSCommandComplexParams.Destroy;
begin
  //Parameters in the list are managed by externally
  FParameters.Clear;
  FreeAndNil(FParameters);

  inherited;
end;

function TDSCommandComplexParams.AddParameter(Parameter: TDBXParameter): Integer;
begin
  Result := FParameters.Count;
  FParameters.Add(Parameter);
end;

function TDSCommandComplexParams.GetParameter(Index: Integer): TDBXParameter;
begin
  if (Index > -1) and (Index < FParameters.Count) then
  begin
    Result := FParameters[Index];
  end
  else
    Exit(nil);
end;

function TDSCommandComplexParams.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

{ TDSCacheResultCommandHandler }

constructor TDSCacheResultCommandHandler.Create(CommandWrapper: TRequestCommandHandler);
begin
  Assert(CommandWrapper <> nil);
  FCommandWrapper := CommandWrapper;
  FCacheCommands := TList<TDSCommandComplexParams>.Create;
end;

destructor TDSCacheResultCommandHandler.Destroy;
var
  CP: TDSCommandComplexParams;
begin
  for CP in FCacheCommands do
    CP.Free;

  FCacheCommands.Clear;
  FreeAndNil(FCacheCommands);

  FreeAndNil(FCommandWrapper);
  inherited;
end;

function TDSCacheResultCommandHandler.GetCommand(Index: Integer): TDBXCommand;
begin
  if (Index > -1) and (Index < GetCommandCount) then
    Exit(FCacheCommands[Index].Command)
  else
    Exit(nil);
end;

function TDSCacheResultCommandHandler.GetCommandCount: Integer;
begin
  Result := FCacheCommands.Count;
end;

function TDSCacheResultCommandHandler.GetCommandParameter(Command: TDBXCommand; Index: Integer): TDBXParameter;
var
  Ccp: TDSCommandComplexParams;
begin
  Result := nil;
  if (Command <> nil) and (Index > -1) then
  begin
    //Search for the ComplexParams item wrapping the given Command
    for Ccp in FCacheCommands do
    begin
      //Command cound, break the loop, regardless of if parameter is found or not
      if Ccp.Command = Command then
      begin
        if Index < Ccp.GetParameterCount then
        begin
          Exit(Ccp.GetParameter(Index));
        end;
        Break;
      end;
    end;
  end;
end;

function TDSCacheResultCommandHandler.GetCommandParameter(CommandIndex, ParameterIndex: Integer): TDBXParameter;
var
  PList: TDSCommandComplexParams;
begin
  if (CommandIndex > -1) and (CommandIndex < GetCommandCount) then
  begin
    PList := FCacheCommands[CommandIndex];
    Exit(PList.GetParameter(ParameterIndex));
  end;

  Exit(nil);
end;

function TDSCacheResultCommandHandler.GetParameterCount(Index: Integer): Integer;
begin
  if GetCommand(Index) <> nil then
  begin
    Exit(FCacheCommands[Index].GetParameterCount);
  end;
  Exit(0);
end;

{ TDSHTTPCacheContextService }

constructor TDSHTTPCacheContextService.Create(Session: TDSSession; LocalConnection: Boolean);
begin
  Assert(Session <> nil);

  inherited Create;

  FSession := Session;
  FLocalConnection := LocalConnection;
end;

function TDSHTTPCacheContextService.ParseRequst(Request: String; out CacheId, CommandIndex,
                                                ParameterIndex: Integer): Boolean;
var
  SlashLeft, SlashRight, SlashAux: Integer;
begin
  CacheId := -1;
  CommandIndex := -1;
  ParameterIndex := -1;
  Result := True;

  SlashLeft := Pos(REQUEST_DELIMITER, Request);
  if SlashLeft = 0 then
  begin
    //the user is interested in the cache as a whole, and not any specific object
    Exit(True);
  end;

  if SlashLeft > 1 then
  begin
    // first / is missing
    SlashRight := SlashLeft;
    SlashLeft := 1;
  end
  else
  begin
    SlashRight := PosEx(REQUEST_DELIMITER, Request, SlashLeft+1);
  end;

  SlashAux := SlashRight;

  if SlashAux < 1 then
    SlashAux := Length(Request) + 1;

  if SlashAux > (SlashLeft + 1) then
  begin
    try
      CacheId := StrToInt(Copy(Request, Slashleft+1, SlashAux-SlashLeft-1));
    except
      Exit(False);
    end;

    if SlashRight = SlashAux then
    begin
      SlashAux := PosEx(REQUEST_DELIMITER, Request, SlashRight+1);
      SlashLeft := SlashRight;
      SlashRight := SlashAux;

      if SlashAux < SlashLeft then
        SlashAux := Length(Request) + 1;

      if SlashAux > (SlashLeft + 1) then
      begin
        try
          CommandIndex := StrToInt(Copy(Request, Slashleft+1, SlashAux-SlashLeft-1));
        except
          Exit(False);
        end;

        if SlashRight = SlashAux then
        begin
          SlashAux := PosEx(REQUEST_DELIMITER, Request, SlashRight+1);
          SlashLeft := SlashRight;

          if SlashAux < SlashLeft then
            SlashAux := Length(Request) + 1;

          if SlashAux > (SlashLeft + 1) then
          begin
            try
              ParameterIndex := StrToInt(Copy(Request, Slashleft+1, SlashAux-SlashLeft-1));
            except
              Exit(False);
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TDSHTTPCacheContextService.GetCacheContents(out Value: TJSONValue);
var
  Ids: TList<Integer>;
  Key: Integer;
  Aux: TJSONValue;
begin
  Value := TJSONObject.Create;

  Ids := FSession.ParameterCache.GetItemIDs;
  for Key in Ids do
  begin
    GetCacheItemContents(Key, Aux);
    TJSONObject(Value).AddPair(TJSONPair.Create(IntToStr(Key), Aux));
  end;

  FreeAndNil(Ids);
end;

procedure TDSHTTPCacheContextService.GetCacheItemContents(const CacheId: Integer; out Value: TJSONValue);
var
  Item: TResultCommandHandler;
  CmdArray: TJSONArray;
  Aux: TJSONValue;
  I: Integer;
begin
  Item := FSession.ParameterCache.GetItem(CacheId);

  if Item = nil then
  begin
    Value := TJSONNull.Create;
    Exit;
  end;

  CmdArray := TJSONArray.Create;

  for I := 0 to Item.GetCommandCount - 1 do
  begin
    Aux := nil;
    GetCommandContents(CacheId, I, Aux);
    if Aux <> nil then
      CmdArray.Add(TJSONObject(Aux));
  end;

  Value := TJSONObject.Create;
  TJSONObject(Value).AddPair(TJSONPair.Create('commands', CmdArray));
end;

procedure TDSHTTPCacheContextService.GetCommandContents(const CacheId: Integer; const CommandIndex: Integer;
                                                        out Value: TJSONValue);
var
  Item: TResultCommandHandler;
  Param: TDBXParameter;
  TypeNames: TJSONArray;
  Count: Integer;
  I: Integer;
begin
  Item := FSession.ParameterCache.GetItem(CacheId);

  if Item = nil then
  begin
    Value := TJSONNull.Create;
    Exit;
  end;

  Count := Item.GetParameterCount(CommandIndex);

  Value := TJSONObject.Create;
  TypeNames := TJSONArray.Create;

  for I := 0 to Count - 1 do
  begin
    Param := Item.GetCommandParameter(CommandIndex, I);
    TypeNames.Add(Param.Name);
  end;

  TJSONObject(Value).AddPair(TJSONPair.Create('parameters', TypeNames));
end;

function TDSHTTPCacheContextService.GetOriginalParamIndex(const Command: TDBXCommand;
                                                          const Parameter: TDBXParameter): Integer;
var
  I: Integer;
begin
  Result := -1;

  if (Command <> nil) and (Parameter <> nil) then
  begin
    for I := 0 to Command.Parameters.Count - 1 do
    begin
      if Command.Parameters[I] = Parameter then
        Exit(I);
    end;
  end;
end;

procedure TDSHTTPCacheContextService.InvalidRequest(Response: TDSHTTPResponse; Request: String);
begin
  if Response <> nil then
  begin
    Response.ResponseNo := 400; //Bad Request
    Response.ResponseText := Format(SInvalidRequest, [Request]);
    Response.CloseConnection := true;
  end;
end;

procedure TDSHTTPCacheContextService.ProcessDELETERequest(const RequestInfo: TDSHTTPRequest;
                                                          Response: TDSHTTPResponse; Request: String);
var
  CacheId, CommandIndex, ParameterIndex: Integer;
begin
  //DELETE only allowed on cache as a whole, or on a whole cache item, not individual Commands or Parameters.
  if not ParseRequst(Request, CacheId, CommandIndex, ParameterIndex) or
     (CommandIndex <> -1) or (ParameterIndex <> -1) then
  begin
    InvalidRequest(Response, Request);
    Exit;
  end;

  if (CacheId = -1) then
    FSession.ParameterCache.ClearAllItems
  else
    FSession.ParameterCache.RemoveItem(CacheId);
end;

function TDSHTTPCacheContextService.StreamsAsJSON(const RequestInfo: TDSHTTPRequest): Boolean;
var
  StreamAsJson: Boolean;
  UrlParamValue: String;
begin
  StreamAsJson := False;

  UrlParamValue := RequestInfo.Params.Values['json'];

  if UrlParamValue <> '' then
  begin
    try
      StreamAsJSON := StrToBool(UrlParamValue);
    except
    end;
  end
  else
  begin
    StreamAsJSON := AnsiContainsStr(RequestInfo.Accept, 'application/json');
  end;

  Result := StreamAsJSON;
end;

procedure TDSHTTPCacheContextService.GetParameterValue(const RequestInfo: TDSHTTPRequest; const CacheId,
  CommandIndex, ParameterIndex: Integer; out Response: TJSONValue; out ResponseStream: TStream; out IsError: Boolean);
var
  Item: TResultCommandHandler;
  Command: TDBXCommand;
  Parameter: TDBXParameter;
  ConvList: TObjectList<TDBXRequestFilter>;
  OriginalIndex: Integer;
begin
  Item := FSession.ParameterCache.GetItem(CacheId);
  IsError := False;

  if Item = nil then
  begin
    Response := TJSONString.Create(Format(SNoCachItem, [CacheId]));
    IsError := True;
    Exit;
  end;

  Parameter := Item.GetCommandParameter(CommandIndex, ParameterIndex);

  if Parameter = nil then
  begin
    Response := TJSONString.Create(Format(SNoCacheParameter, [CommandIndex, ParameterIndex]));
    IsError := True;
    Exit;
  end;

  if not StreamsAsJSON(RequestInfo) and (Parameter.DataType = TDBXDataTypes.BinaryBlobType) then
  begin
    ResponseStream := Parameter.Value.GetStream(True);
    if ResponseStream = nil then
      Response := TJSONNull.Create;
  end
  else
  begin
    ConvList := TObjectList<TDBXRequestFilter>.Create(false);

    Command := Item.GetCommand(CommandIndex);
    OriginalIndex := GetOriginalParamIndex(Command, Parameter);

    try
      Response := nil;

      //use a request filter on the returned data, if one was specified
      if OriginalIndex > -1 then
      begin
        FiltersForCriteria([OriginalIndex+1], OriginalIndex = Command.Parameters.Count - 1, ConvList);
        if ConvList.Count = 1 then
        begin
          if not ConvList.Items[0].CanConvert(Command.Parameters[OriginalIndex].Value) then
            Raise TDSServiceException.Create(Format(SCannotConvertParam, [OriginalIndex, ConvList.Items[0].Name]));
          Response := ConvList.Items[0].ToJSON(Command.Parameters[OriginalIndex].Value, FLocalConnection)
        end;
      end;

      if Response = nil then
        Response := TDBXJSONTools.DBXToJSON(Parameter.Value, Parameter.DataType, FLocalConnection);
    finally
      FreeAndNil(ConvList);
    end;
  end;
end;

function TDSHTTPCacheContextService.ByteContent(JsonValue: TJSONValue): TBytes;
var
  Buffer: TBytes;
begin
  SetLength(Buffer, JsonValue.EstimatedByteSize);
  SetLength(Buffer, JsonValue.ToBytes(Buffer, 0));

  Result := Buffer;
end;

procedure TDSHTTPCacheContextService.ProcessGETRequest(const RequestInfo: TDSHTTPRequest;
                                                       Response: TDSHTTPResponse; Request: String);
var
  CacheId, CommandIndex, ParameterIndex: Integer;
  ResultObj: TJSONObject;
  SubResult: TJSONValue;
  ResultStream: TStream;
  IsError: Boolean;
  ResultStr: String;
begin
  ResultObj := nil;
  SubResult := nil;
  ResultStream := nil;
  IsError := False;

  if not ParseRequst(Request, CacheId, CommandIndex, ParameterIndex) then
  begin
    InvalidRequest(Response, Request);
    Exit;
  end;

  //datasnap/cache
  if (CacheId = -1) then
  begin
    GetCacheContents(SubResult);
  end
  //datasnap/cache/CacheId
  else if (CommandIndex = -1) then
  begin
    GetCacheItemContents(CacheId, SubResult);
  end
  //datasnap/cache/CacheId/CommandIndex
  else if (ParameterIndex = -1) then
  begin
    GetCommandContents(CacheId, CommandIndex, SubResult);
  end
  //datasnap/cache/CacheId/CommandIndex/ParameterIndex
  else
  begin
    GetParameterValue(RequestInfo, CacheId, CommandIndex, ParameterIndex, SubResult, ResultStream, IsError);
  end;

  try
    if Assigned(ResultStream) then
    begin
      Response.ContentStream := ResultStream;
      Response.FreeContentStream := False;
    end
    else if Assigned(SubResult) then
    begin
      if IsError then
        ResultStr := 'error'
      else
        ResultStr := 'result';

      ResultObj := TJSONObject.Create;
        ResultObj.AddPair(TJSONPair.Create(ResultStr, SubResult));
      Response.ContentText := StringOf(ByteContent(ResultObj))
    end;
  finally
    //Only free SubResult if it hasn't been added to ResultObj
    if ResultObj <> nil then
      ResultObj.Free
    else if Assigned(SubResult) then
      SubResult.Free;
  end;
end;

{ TDSClientCallbackChannelManager.TDSExecuteThread }

constructor TDSClientCallbackChannelManager.TDSExecuteThread.Create(Callback: TDBXCallback; Data: TJSONValue);
begin
  FreeOnTerminate := False;
  FCallback := Callback;
  FData := Data;
  FResponse := nil;
  inherited Create;
end;

destructor TDSClientCallbackChannelManager.TDSExecuteThread.Destroy;
begin

  inherited;
end;

procedure TDSClientCallbackChannelManager.TDSExecuteThread.Execute;
begin
  inherited;
  TMonitor.Enter(FCallback);
  TMonitor.Exit(FCallback);
  try
    FResponse := FCallback.Execute(FData);
  finally
    if not Terminated then
      TMonitor.Pulse(FCallback);
  end;
end;

{ TDSNullResponseHandler }

procedure TDSNullResponseHandler.Close;
begin
 //do nothing
end;

constructor TDSNullResponseHandler.Create(DSService: TDSService; CommandType: TDSHTTPCommandType;
                                          ServiceInstanceOwner: Boolean);
begin
  Inherited Create(CommandType, DSService, ServiceInstanceOwner);
end;

function TDSNullResponseHandler.HandleParameter(const Command: TDBXCommand; const Parameter: TDBXParameter;
                                                out Response: TJSONValue; var ResponseStream: TStream): Boolean;
begin
  Result := False;
end;

procedure TDSNullResponseHandler.PopulateContent(ResponseInfo: TDSHTTPResponse; Response: TJSONValue;
                                                 ResponseStream: TStream);
begin
  //do nothing
end;

{ TDSCallbackItem }

constructor TDSCallbackItem.Create(ServerChannelName: String; Callback: TDBXCallback; Channels: TStrings);
begin
  FServerChannelName := ServerChannelName;
  FCallback := Callback;
  FChannels := Channels;
end;

constructor TDSCallbackItem.Create(ServerChannelName: String; Callback: TDBXCallback; Channels: String);
begin
  FServerChannelName := ServerChannelName;
  FCallback := Callback;
  FChannels := nil;

  if Channels <> EmptyStr then
  begin
    FChannels := TStringList.Create;
    FChannels.CommaText := Channels;
  end;
end;

destructor TDSCallbackItem.Destroy;
begin
  FreeAndNil(FCallback);
  FreeAndNil(FChannels);
  inherited;
end;

function TDSCallbackItem.ListeningOn(ChannelName: String): Boolean;
begin
  Result := (ChannelName = FServerChannelName) or
            ((FChannels <> nil) and (ChannelName <> '') and (FChannels.IndexOf(ChannelName) > -1));
end;

end.
