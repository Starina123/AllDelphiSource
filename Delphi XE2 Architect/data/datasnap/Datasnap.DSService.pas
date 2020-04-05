{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSService;

interface

uses
  System.Classes,
  Data.DBXCommon,
  Data.DbxDatasnap,
  Data.DBXJSON,
  Data.DBXMessageHandlerCommon,
{$IFDEF CLR}
  DBXSocketChannelManaged,
{$ELSE}
  Data.DbxSocketChannelNative,
{$ENDIF}
  Data.DBXTransport,
  Datasnap.DSAuth,
  Datasnap.DSCommonServer,
  Datasnap.DSTransport,
  System.Generics.Collections,
  System.SyncObjs,
  System.SysUtils;

const
    REQUEST_DELIMITER = '/';
    REQUEST_PARAM_DELIMITER = '?';
    REST_CONTEXT = 'rest';
    JSON_CONTEXT = 'json';
    CACHE_CONTEXT = 'cache';

type

  ///  <summary>Filter parameter range type</summary>
  ///  <remarks>It is expected that server methods have up to 64 parameters (and an eventual return).
  ///    Each parameter can subject to a filter operation.
  ///  </remarks>
  TParamRange = set of 0..64;

  ///  <summary> Converts any type to JSON based on filter parameters </summary>
  ///  <remarks> Any request filter needs to register with the RequestFilter factory
  ///    in order to be used within requests. The filter is configurable in the request
  ///    based on parameter values
  ///  </remarks>
  TDSRequestFilter<T> = class
    strict private
      FName: String;
      FRange: TParamRange;
      FOnResult: boolean;
      FTypeName: String;

    protected
      constructor Create(const TypeName: String); virtual;

    public
      destructor Destroy; override;

      ///  <summary>Changes the parameter value</summary>
      ///  <param name="ParamName">Filter parameter</param>
      ///  <param name="ParamValue">Parameter value, as string</param>
      ///  <return>true if the parameter exists and the value is valid</return>
      function SetParameterValue(ParamName: String; ParamValue: String): boolean; virtual;
      ///  <summary>Returns true if the filter accepts the given parameter</summary>
      ///  <param name="ParamName">parameter name</param>
      ///  <return>true if the parameter exists</return>
      function HasParameter(const ParamName: String): boolean; virtual;
      ///  <summary>Returns true if the value can be converted to JSON</summary>
      ///  <param name="Value">value to be converted</param>
      ///  <return>true if the value can be converted</return>
      function CanConvert(Value: T): boolean; virtual; abstract;
      ///  <summary>Returns the JSON value</summary>
      ///  <param name="Value">value to be converted</param>
      ///  <param name="IsLocal">true for an in-process value (controls the life-cycle)</param>
      ///  <return>JSON value</return>
      function ToJSON(Value: T; IsLocal: boolean): TJSONValue; virtual; abstract;

    public
      property Name: string read FName write FName;
      property TypeName: string read FTypeName;
      property Range: TParamRange read FRange write FRange;
      property OnResult: boolean read FOnResult write FOnResult;
  end;

  ///  <summary>Specilized filter for DBX values</summary>
  TDBXRequestFilter = class(TDSRequestFilter<TDBXValue>)
    public
      ///  <summary>Clone current instance</summary>
      ///  <return>TDBXRequestFilter</return>
      function Clone: TDBXRequestFilter; virtual; abstract;
  end;

  ///  <summary>Returns parts of the DBX values, based on offset and count</summary>
  TDBXCropRequestFilter = class(TDBXRequestFilter)
    strict private
      FOff, FCount: Integer;

    protected
      constructor Create(const TypeName: String; Off, Count: Integer); reintroduce; overload;

      property Off: Integer read FOff;
      property Count: Integer read FCount;

    public
      constructor Create(const TypeName: String); overload; override;

      destructor Destroy; override;

      function SetParameterValue(ParamName: String; ParamValue: String): boolean; override;
      function HasParameter(const ParamName: String): boolean; override;
  end;

  ///  <summary>Specialized request filter for String and Stream types</summary>
  TDBXSubStringRequestFilter = class(TDBXCropRequestFilter)
    public
      function CanConvert(Value: TDBXValue): boolean; override;
      function ToJSON(Value: TDBXValue; IsLocal: boolean = false): TJSONValue; override;

      function Clone: TDBXRequestFilter; override;
  end;

  ///  <summary>Specialized crop filter to DBX Reader</summary>
  TDBXReaderRequestFilter = class(TDBXCropRequestFilter)
    public
      function CanConvert(Value: TDBXValue): boolean; override;
      function ToJSON(Value: TDBXValue; IsLocal: boolean = false): TJSONValue; override;

      function Clone: TDBXRequestFilter; override;
  end;

  ///  <summary>Handles the available DBX request filters</summary>
  TDBXRequestFilterFactory = class
    strict private
      class var FInstance: TDBXRequestFilterFactory;
    private
      FRepo: TObjectDictionary<String, TDBXRequestFilter>;

      class procedure SetUp;
      class procedure CleanUp;
    public
      constructor Create;
      destructor Destroy; override;

      procedure RegisterRequestFilter(Converter: TDBXRequestFilter);
      function RequestFilter(Name: String): TDBXRequestFilter;
      procedure GetAllWithField(FieldName: String; List: TObjectList<TDBXRequestFilter>);

      class property Instance: TDBXRequestFilterFactory read FInstance;
  end;

  ///  <summary> DSService exceptions </summary>
  TDSServiceException = class(Exception)
  end;

  TDBXRequestFilterDictionary =  TObjectDictionary<String, TDBXRequestFilter>;

  ///  <summary> Class for managing Request Filteres
  ///  </summary>
  TDSRequestFilterManager = class
  protected
    FRequestFilterStore: TDBXRequestFilterDictionary;
    FStreamAsJSON: Boolean;

    ///  <summary> Processes request parameters name from: DCType1-10.Field or DCType.Field or DCType1,3.Field
    ///  </summary>
    class procedure ParseParamName(const PName: string; out DCName: string; out DCType: string; out FieldName: string;
                                   out Range: TParamRange; out OnResult: boolean);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    ///  <summary> Builds the appropriate data converters out of query parameters</summary>
    function ProcessQueryParameter(const ParamName: string; const ParamValue: String): boolean;

    procedure FiltersForCriteria(const TypeName: string; const Range: TParamRange;
                                 const OnResult: boolean; out List: TObjectList<TDBXRequestFilter>); overload;
    procedure FiltersForCriteria(const Range: TParamRange; const OnResult: boolean;
                                 out List: TObjectList<TDBXRequestFilter>); overload;


    ///  <summary> Checks if two converters overlap ranges in FDataConverterStore </summary>
    function CheckConvertersForConsistency: boolean;
  end;

  ///  <summary> API class for all DS specific stateless services. A request
  ///    comes in usually as a HTTP request and the response consists of an JSON object.
  ///    Various protocols such as REST implements the methods of this class.
  ///  </summary>
  TDSService = class(TDSRequestFilterManager)
  private
    FDBXProperties: TDBXDatasnapProperties;
    FLocalConnection: boolean;
    function GetInputParameterInstance(JsonParam: TJSONValue; Parameter: TDBXParameter;
                                       var InstanceOwner: Boolean): TJSONValue;
  protected
    ///  <summary> Dispatches the JSON request to appropriate processing method. It
    ///    accepts an array of JSON objects that will be dispatched to the processing
    ///    mrthod. The response is a JSON array with the execution results.
    ///  </summary>
    ///  <remarks>
    ///     Example of JSON request: [{"execute":{"MethodClass.MethodName":[inputParameter,...]}},...]
    ///
    ///      Where output or return parameters are defined, they are picked up into a JSON response:
    ///          [{"result":[parameterValue,parameterValue...]},...]
    ///
    ///      If the server throws an exception, then the JSON response is:
    ///          [{"error":"error message"},...]
    ///  </remarks>
    ///  <param name="Request">JSON request in the protocol format, never nil</param>
    ///  <param name="ResponseHandler"> Handler responsible for managing the result
    ///  </param>
    procedure ProcessRequest(const Request:TJSONArray; ResponseHandler: TRequestCommandHandler); virtual;

    ///  <summary> Executes the JSON request and generates the JSON response
    ///  </summary>
    ///  <remarks> Input parameters are consumed from left to right (position based).
    ///    The values are bound to the IN or IN/OUT method actual parameters orderly
    ///    from left to right, skipping the OUT or RETURN parameters.
    ///    If not enough input parameters are supplied, the outstanding actual parameters
    ///    are bound to nil.
    ///  </remarks>
    /// <param name="Request">JSON request in the protocol format, never nil</param>
    /// <param name="ResponseHandler">Handles the result of command execution</param>
    procedure Execute(const Request: TJSONObject; ResponseHandler: TRequestCommandHandler);

  public
    constructor Create(DSServerName, DSHostname: String; DSPort: Integer;
                       AuthUser: String = ''; AuthPassword: String = ''); reintroduce; overload; Virtual;
    constructor Create(DSServerName, DSHostname: String; DSPort: Integer;
                       AuthUser: String = ''; AuthPassword: String = ''; AIPImplementationID: string = '');  reintroduce; overload; Virtual;
    destructor Destroy; override;

    ///  <summary> processes GET request
    ///  </summary>
    ///  <remarks> The response contains either success or an error message in an JSON object.
    ///  </remarks>
    ///  <param name="Request">contains the original request, never nil or empty</param>
    ///  <param name="Params">request parameters</param>
    ///  <param name="Content">contains the request content, usually the serialized JSON object to be updated.</param>
    ///  <param name="ResponseHandler">Handles the command populated with the result</param>
    procedure ProcessGETRequest(const Request: String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); virtual; abstract;

    ///  <summary> processes PUT request
    ///  </summary>
    ///  <remarks> The response contains either success or an error message in an JSON object.
    ///  </remarks>
    ///  <param name="Request">contains the original request, never nil or empty</param>
    ///  <param name="Params">request parameters</param>
    ///  <param name="Content">contains the request content, usually the serialized JSON object to be updated.</param>
    ///  <param name="ResponseHandler">Handles the command populated with the result</param>
    procedure ProcessPUTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); virtual; abstract;

    ///  <summary> processes POST request
    ///  </summary>
    ///  <remarks> The response contains either success or an error message in an JSON object.
    ///  </remarks>
    ///  <param name="Request">contains the original request, never nil or empty</param>
    ///  <param name="Params">request parameters</param>
    ///  <param name="Content">contains the request content, usually the serialized JSON object to be updated.</param>
    ///  <param name="ResponseHandler">Handles the command populated with the result</param>
    procedure ProcessPOSTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); virtual; abstract;

    ///  <summary> processes DELETE request
    ///  </summary>
    ///  <remarks> The response contains either success or an error message in an JSON object.
    ///  </remarks>
    ///  <param name="Request">contains the original request, never nil or empty</param>
    ///  <param name="Params">request parameters</param>
    ///  <param name="Content">contains the request content, usually the serialized JSON object to be updated.</param>
    ///  <param name="ResponseHandler">Handles the command populated with the result</param>
    procedure ProcessDELETERequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); virtual; abstract;

    property LocalConnection: boolean read FLocalConnection;

    ///  <summary> Set with query parameter 'json' allowing the user to returna  stream as a
    ///    JSON array of bytes instead of a content stream.
    ///  </summary>
    property StreamAsJSON: Boolean read FStreamAsJSON write FStreamAsJSON;
  end;

  ///  <summary> REST service implementation. Request methods are mapped to
  ///    CRUD as described below.
  ///  </summary>
  /// <remarks>
  ///   REST protocol:
  ///     GET: /MethodClass/MethodName/inputParameter[/inputParameter]*
  ///          JSON request: {"execute":{"MethodClass.MethodName":[inputParameter[,inputParameter]*]}}
  ///     PUT: /MethodClass/MethodName/inputParameter[/inputparameter]* and [content]
  ///          JSON request: {"execute":{"MethodClass.acceptMethodName":[inputParameter[,inputParameter]*[,JSONValue]}}
  ///     POST: /MethodClass/MethodName/inputParameter[/inputparameter]* and [content]
  ///          JSON request: {"execute":{"MethodClass.updateMethodName":[inputParameter[,inputParameter]*[,JSONValue]}}
  ///     DELETE: /MethodClass/MethodName/inputParameter[/inputParameter]*
  ///          JSON request: {"execute":{"MethodClass.cancelMethodName":[inputParameter[,inputParameter]*]}}
  ///
  ///    Example: Manage a database connection
  ///      PUT message http://mySite.com/datasnap/rest/Test/Connection/MSSQL1 results in the JSON request
  ///          {"execute":{"Test.acceptConnection":["MSSQL1"]}}
  ///      POST message http://mySite.com/datasnap/rest/Test/Connection/MSSQL2 results in the JSON request
  ///          {"execute":{"Test.updateConnection":["MSSQL2"]}}
  ///      GET message http://mySite.com/datasnap/rest/Test/Connection results in the JSON request
  ///          {"execute":{"Test.Connection":[]}}
  ///      DELETE message http://mySite.com/datasnap/rest/Test/Connection results in the JSON request
  ///          {"execute":{"Test.cancelConnection":[]}}
  ///
  ///      In the acceptConnection the user can implement the code required to open a connection denoted
  ///      MSSQL1, in updateConnection to close the existing connection (if any) and open a new one,
  ///      in Connection the code returns the name of the current open connection and in cancelConnection
  ///      the code closes the existing connection if any.
  ///
  ///      Where output or return parameters are defined, they are picked up into a JSON response:
  ///          {"result":[parameterValue[,parameterValue]*]}
  ///
  ///      If the server throws an exception, then the JSON response is:
  ///          {"error":"error message"}
  ///
  /// </remarks>
  TDSRESTService = class(TDSService)
  private
    ///  <summary> Utility mnethod that parses a generic request /class/method[/param]* and returns the values in the output parameters
    ///  </summary>
    ///  <param name="Request">Request string in the format above, never null of empty</param>
    ///  <param name="ClassName">Output parameter with the class name</param>
    ///  <param name="MethodName">Output parameter with the method name</param>
    ///  <param name="ParamValues">parameter list with parameter values</param>
    procedure ParseRequest(const Request: String; var ClassName: String; var MethodName:
                                           String; var ParamValues: TStringList);
    ///  <summary> Utility mnethod that creates a JSON array out a parameter list
    ///  </summary>
    ///  <param name="Params">parameter list, never nil but may be empty</param>
    ///  <param name="ParamArray">JSON array, containing values from the parameter list</param>
    procedure BuildParamArray(const Params: TStringList; var ParamArray: TJSONArray);
    /// <summary> processes REST request
    /// </summary>
    /// <remarks> The response contains either success or an error message
    /// </remarks>
    /// <param name="RequestType">The request type, one of GET, POST, PUT and DELETE</param>
    /// <param name="RestRequest">contains the REST request, never nil or empty</param>
    /// <param name="Content">contains the HTTP content, usually the object to be updated</param>
    /// <param name="ResponseHandler"> Handler responsible for managing the result </param>
    procedure ProcessREST(const RequestType: String; const RestRequest: String;
                                const Content: TBytes; ResponseHandler: TRequestCommandHandler);

    procedure SetMethodNameWithPrefix(const RequestType, ClassName, MethodName: String; out DSMethodName: String);
  public
    constructor Create( dsServerName, dsHostname: String; dsPort: Integer; AuthUser: String = '';
                        AuthPassword: String = '' ); override;
    constructor CreateImpl( dsServerName, dsHostname: String; dsPort: Integer; AuthUser: String = '';
                        AuthPassword: String = ''; AIPImplementationID: string = '');
    destructor Destroy; override;

    procedure ProcessGETRequest(const Request:String; Params: TStrings;
                                Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;

    procedure ProcessPUTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;
    procedure ProcessPOSTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;
    procedure ProcessDELETERequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;
  end;

  ///  <summary> Service for JSON HTTP request. They are post requests with
  ///    JSON content {["execute":{"MethodClass.MethodName":[inputParameter[,inputParameter]*]}]+}.
  ///    If the JSON content cannot be parsed from the content an exception is thrown.
  ///
  ///    For each method a pair "result":[parameterValue[,parameterValue]*] is generated,
  ///    where the parameter values are the method output and return parameters.
  ///    If the method throws an exception, then corresponding JSON pair is {"error":"error message"}
  ///
  ///    The JSON response is:
  ///          {"result":[parameterValue[,parameterValue]*][,"result":[...]]*}
  ///
  ///  </summary>
  TDSJSONService = class(TDSService)
  protected
    procedure ProcessJSONCommand(Content: TBytes; ResponseHandler: TRequestCommandHandler);

  public
    constructor Create( dsServerName, dsHostname: String; dsPort: Integer; AuthUser: String = '';
                        AuthPassword: String = '' ); override;
    constructor CreateImpl( dsServerName, dsHostname: String; dsPort: Integer; AuthUser: String = '';
                        AuthPassword: String = ''; AIPImplementationID: string = '');
    destructor Destroy; override;

    procedure ProcessGETRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;

    procedure ProcessPUTRequest(const Request:String; Params: TStrings;
                                Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;
    procedure ProcessPOSTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;
    procedure ProcessDELETERequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler); override;
  end;

  TDSSessionCacheKeys = TList<Integer>;

  ///  <summary> Cache for holding commands with complex parameter types (Table, Stream, Object)
  ///     which are being stored for later reuse.
  ///  </summary>
  TDSSessionCache = class
  private
    FItems : TDictionary<Integer, TResultCommandHandler>;
  public
    constructor Create;
    destructor Destroy(); Override;

    ///  <summary> Trys to add the given item to the list of items managed by the cache. If successful
    ///     this will return the unique ID for the item in the cache. If not successful, -1 will be returned.
    ///  </summary>
    function AddItem(Item: TResultCommandHandler): Integer;
    ///  <summary> Removes the given item from the list of managed items if found.
    ///  </summary>
    ///  <remarks> Does not claim ownership of the item. </remarks>
    procedure RemoveItem(Item: TResultCommandHandler); Overload;
    ///  <summary> Removes the item with the given ID from the list of managed items if found.
    ///  </summary>
    ///  <remarks> If InstanceOwner is set to false, the item will be returned if found, or nil if not found.
    ///     If InstanceOwner is true, nil will always be returned.
    ///  </remarks>
    function RemoveItem(ID: Integer; InstanceOwner: Boolean = True): TResultCommandHandler; Overload;
    ///  <summary> Returns the item with the given ID, or nil if not found.
    ///  </summary>
    function GetItem(ID: Integer): TResultCommandHandler;
    ///  <summary> Returns the ID for the item, or -1 if not found
    ///  </summary>
    function GetItemID(Item: TResultCommandHandler): Integer;
    ///  <summary> Returns a list of IDs currently helf by the cache </summary>
    function GetItemIDs: TDSSessionCacheKeys;
    ///  <summary> Clears all of the items stred in this cache,
    ///     freeing them if InstanceOwner is True. (defaults to true)
    ///  </summary>
    procedure ClearAllItems(InstanceOwner: Boolean = True);
  end;

  ///  <summary> Session status
  ///  </summary>
  TDSSessionStatus = (Active, Closed, Idle, Terminated, Connected, Expired);

  TDSSession = class
  private
    FStartDateTime: TDateTime;   /// creation timestamp
    FDuration: Integer;          /// in miliseconds, 0 for infinite (default)
    FStatus: TDSSessionStatus;   /// default idle
    FLastActivity: Cardinal;     /// timestamp of the last activity on this session
    FUserName: String;           /// user name that was authenticated with this session
    FSessionName: String;        /// session name, may be internally generated, exposed to 3rd party
    FMetaData: TDictionary<String,String>; /// map of metadata stored in the session
    FMetaObjects: TDictionary<String,TObject>; /// map of objects stored in the session
    FUserRoles: TStrings;        /// user roles defined through authentication
    FCache: TDSSessionCache;
    FLastResultStream: TObject;  /// Allow any object which owns a stream, or the stream itself, to be stored here
    FCreator: TObject;           /// Creator of the session object reference

  private
    procedure SetSessionName(const sessionId: String);
    procedure SetUserName(const userName: String);

  protected
    ///  <return> session internal id </return>
    function GetId: NativeInt;

    ///  <summary> terminates the current session, normally triggered by a scheduler </summary>
    procedure TerminateSession; virtual;
    ///  <summary> Terminates the session only if LifeDuration is less than than the
    ///     difference between the last active time and now.</summary>
    procedure TerminateInactiveSession; virtual;
    ///  <summary>returns true if session did not have any activity for number of seconds specified</summary>
    function IsIdle(Seconds: Cardinal): Boolean;
    function IsIdleMS(Milliseconds: Cardinal): Boolean;
    ///  <summary> Returns the session status </summary>
    ///  <remarks> Sets the session to expired if it was not already terminated, and it has been idle for Duration.
    ///  </remarks>
    function GetSessionStatus: TDSSessionStatus; virtual;
    procedure GetAuthRoleInternal(ServerMethod: TDSServerMethod; AuthManager : TDSCustomAuthenticationManager;
      out AuthorizedRoles, DeniedRoles: TStrings);
  public
    ///  <summary>Creates an anonymous session</summary>
    constructor Create; overload; virtual;
    constructor Create(const SessionName: string); overload; virtual;
    constructor Create(const SessionName: string; const AUser: String); overload; virtual;
    destructor Destroy; override;

    ///  <summary> Marks session be active </summary>
    procedure MarkActivity;
    ///  <summary> Schedules an event in elapsed time
    ///  </summary>
    ///  <param name="event">Event to be run after the time elapses</param>
    ///  <param name="elapsedTime">Elapsed time in miliseconds</param>
    procedure ScheduleUserEvent(Event: TDBXScheduleEvent; ElapsedTime: Integer);
    ///  <summary> Schedule a session termination event at FCreateDateTime + FDuration
    ///  </summary>
    procedure ScheduleTerminationEvent;
    ///  <summary> Similar to ScheduleTerminationEvent, but will be called continually each time the event
    ///     is executed until the session has been idle for longer than LifeDuration.
    ///  </summary>
    procedure ScheduleInactiveTerminationEvent;
    ///  <summary> Cancel the last shceduled event </summary>
    procedure CancelScheduledEvent;
    ///  <summary> Authenticate a connection from the given properties and any data stored in the Session. </summary>
    ///  <remarks> Subclasses of TDSSession should override this, to be useful, but also call into this base
    ///     implementation (ignoring the return value of this base implementation.)
    ///  </remarks>
    function Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean; overload; virtual;
    ///  <summary> Checks that the user of the current session has authorization for the given method. </summary>
    function Authorize(EventObject: TDSAuthorizeEventObject): boolean; overload; virtual;
    ///  <summary> Returns true if the given method requires authorization, false otherwise. </summary>
    ///  <remarks> For example 'DSMetadata.GetDatabase' is called when a SQLConnection to the server
    ///    is established, so checking for authorization would be redundant (and possibly falsly fail)
    ///    as the connection is already authenticated.
    ///  </remarks>
    function RequiresAuthorization(MethodInfo: TDSMethodInfo): Boolean; virtual;
    ///  <summary> Get authorized and denied roles associated with server method </summary>
    procedure GetAuthRoles(ServerMethod: TDSServerMethod; out AuthorizedRoles,
      DeniedRoles: TStrings);  virtual;

    ///  <summary> Convenience function which returns true if status is Active, Connected or Idle
    ///  </summary>
    function IsValid: boolean; virtual;

    ///  <summary>
    ///    Generates a unique session id
    ///  </summary>
    ///  <remarks>
    ///    No assumptions should be made about the id structure or content other
    ///    than unicity on the current process
    ///  </remarks>
    ///  <return>session id as a string</return>
    class function GenerateSessionId: string; static;
    ///  <summary>
    ///    To be called when session ends. The communication channel is closed.
    ///  </summary>
    procedure Close; virtual;
    ///  <summary> Terminates the session </summary>
    ///  <remarks> It is exceptionally used when a session needs to be terminated
    ///    due to the overall process state. All memory is released as session ends
    ///    normally. Calling terminate may induce abnormal termination of
    ///    dependent mid-tier apps</remarks>
    procedure Terminate; virtual;

    /// <summary> Returns true if the session holds data for the given key. </summary>
    function HasData(Key: String): Boolean;
    ///  <summary> Retrieve a value string stored in this session for the given key </summary>
    function GetData(Key: String): String;
    ///  <summary> Store a value string in this session with the given key </summary>
    procedure PutData(Key, Value: String);
    ///  <summary> Remove a value string from this session matching the given key </summary>
    procedure RemoveData(Key: String);

    /// <summary> Returns true if the session holds an Object for the given key. </summary>
    function HasObject(Key: String): Boolean;
    ///  <summary> Retrieve a value Object stored in this session for the given key </summary>
    function GetObject(Key: String): TObject;
    ///  <summary> Store an Object in this session with the given key </summary>
    ///  <remarks> Returns false is the object couldn't be inserted. (Invalid/in-use key) </remarks>
    function PutObject(Key: String; Value: TObject): Boolean;
    ///  <summary> Remove an Object from this session matching the given key </summary>
    function RemoveObject(Key: String; InstanceOwner: Boolean = True): TObject;

    ///  <summary> Returns the miliseconds since last activity </summary>
    function ElapsedSinceLastActvity: Cardinal;
    ///  <summary> Returns the miliseconds remaining before the session expires </summary>
    function ExpiresIn: Cardinal;

    ///  <summary> session duration in miliseconds </summary>
    property LifeDuration: Integer read FDuration write FDuration;
    ///  <summary> session id </summary>
    property Id: NativeInt read GetId;
    ///  <summary> Session status </summary>
    property Status: TDSSessionStatus read GetSessionStatus;
    ///  <summary> For scheduled managed sessions, has the scheduled time</summary>
    property StartDateTime: TDateTime read FStartDateTime;
    ///  <summary>Session's user name, empty for anonymous</summary>
    property UserName: string read FUserName;
    ///  <summary>Session name, immutable</summary>
    property SessionName: string read FSessionName;
    ///  <summary>User roles set through authentication</summary>
    property UserRoles: TStrings read FUserRoles;
    ///  <summary>Cache for storing and retrieving previously executed commands and their results.</summary>
    ///  <remarks>Optionally used in conjunction with REST when a command execution results
    ///     in multiple complex typed result objects. (Streams, Tables, Objects.)
    ///  </remarks>
    property ParameterCache: TDSSessionCache read FCache;
    ///  <summary> Holds a reference to the last result stream sent to a client. </summary>
    ///  <remarks> Used for REST, when sending a result stream back to the client, as there is no
    ///     easy way to tie in with the response sent to the client to know whent he stream is no longer needed.
    ///     The object stored here is a TObject instead of a stream to handle the case where there is an object
    ///     wrapping the stream which needs to be freed with the stream.
    ///  </remarks>
    property LastResultStream: TObject read FLastResultStream write FLastResultStream;
    ///  <summary>Exposes the creator object. It can be the server transport, http service, etc</summary>
    ///  <remarks>It is used usually to distinguish between sessions in a Close event, or to extract more
    ///    metadata about the session context
    ///  </remarks>
    property ObjectCreator: TObject read FCreator write FCreator;
  end;

  TDSAuthSession = class(TDSSession)
  private
  protected
    FAuthManager : TDSCustomAuthenticationManager;
  public
    procedure GetAuthRoles(ServerMethod: TDSServerMethod; out AuthorizedRoles,
      DeniedRoles: TStrings); override;
    function Authorize(EventObject: TDSAuthorizeEventObject): boolean; override;
    ///  <summary> The Authentication manager held by this session. Used for
    ///    user (role) Authorization.
    ///  </summary>
    property AuthManager: TDSCustomAuthenticationManager read FAuthManager;
  end;


  ///  <summary> Session class for REST communication protocol.
  ///    It holds an instance of an authentication manager.
  ///  </summary>
  TDSRESTSession = class(TDSAuthSession)
  public
    ///  <summary> Creates an instance of a REST Session, passing in the
    ///    authentication manager to hold a reference to.
    ///  </summary>
    constructor Create(AAuthManager: TDSCustomAuthenticationManager); virtual;
    ///  <summary> Extension of Authenticate to wrap the TCP authentication manager call
    ///  </summary>
    function Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean; override;
  end;

  ///  <summary> Session class for HTTP communication protocol. It acts like a
  ///    proxy for the socket channel with the DS. It offers Open and Close
  ///    methods to handle the session life-cycle
  ///  </summary>
  TDSTunnelSession = class(TDSAuthSession)
  private
    ///  <summary>
    ///    User pointer
    ///  </summary>
    FUserPointer: Pointer;
    ///  <summary>
    ///    User flag
    ///  </summary>
    FUserFlag: Integer;
  protected
    procedure TerminateSession; override;

  public
    constructor Create;  reintroduce;
    destructor Destroy; override;

    ///  <summary>
    ///     To be called when the session starts. The communication channel is
    ///     being setup at thie moment.
    ///  </summary>
    procedure Open; virtual; abstract;
    ///  <summary>
    ///    Reopens the socket channel toward a different location. All required parameters
    ///    are expected to be present in the argument
    ///  </summary>
    ///  <param name="DBXDatasnapProperties">connection properties</param>
    procedure Reopen(DBXDatasnapProperties: TDBXDatasnapProperties); virtual;


    ///  <summary> Reads bytes from communication layer. </summary>
    ///  <remarks>If none are avaiable yet the call may be blocking. </remarks>
    ///  <param name="Buffer">Byte array buffer with capacity to store data</param>
    ///  <param name="Offset">Byte array index from where the read bytes are stored</param>
    ///  <param name="Count">Expected number of bytes to be read. It is assumed there
    ///    is enough capacity in the buffer area for them</param>
    ///  <return>Actual number of bytes being read, -1 on error</return>
    function Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; virtual; abstract;
    ///  <summary> Sends bytes into the communication layer. </summary>
    ///  <remarks> The operation may be blocking until data is consumed by the mid-tier. </remarks>
    ///  <param name="Buffer">Byte array buffer with data to be written</param>
    ///  <param name="Offset">Index from the bytes are written</param>
    ///  <param name="Count">Number of bytes to be written. It is expected that
    ///     the buffer has enough capacity to match the parameter</param>
    ///  <return>Actual number of bytes being written</return>
    function Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; virtual; abstract;

    property UserPointer: Pointer read FUserPointer write FUserPointer;
    property UserFlag: Integer read FUserFlag write FUserFlag;
  end;

  ///  <summary> Manages the http session for a remote DS instance </summary>
  TDSRemoteSession = class(TDSTunnelSession)
  private
    ///  <summary>
    ///    Communication channel with the actual resources
    ///  </summary>
    FSocketChannel: TDBXSocketChannel;
  public
    constructor Create(DBXDatasnapProperties: TDBXDatasnapProperties);
    destructor Destroy; override;

    procedure Open; override;
    procedure Reopen(DBXDatasnapProperties: TDBXDatasnapProperties); override;
    procedure Close; override;
    procedure Terminate; override;

    function Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    function Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    ///  <summary> Extension of Authenticate to wrap the TCP authentication manager call
    ///  </summary>
    function Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean; override;

    property SocketChannel: TDBXSocketChannel read FSocketChannel write FSocketChannel;
  end;

  ///  <summary> User event for notification of session events, such as create and terminate.
  ///  </summary>
  TDSSessionEventType = (SessionCreate, SessionClose);

  ///  <summary> User event for notification of session events, such as create and terminate.
  ///  </summary>
  ///  <remarks> Event type is used to specify what action has been done to the session,
  ///     The session itself, if type is SessionClose for example, could be in a partially invalid state.
  ///  </remarks>
  TDSSessionEvent = reference to procedure(Sender: TObject;
                              const EventType: TDSSessionEventType;
                              const Session: TDSSession);

  TDSSessionVisitor = reference to procedure(const Session: TDSSession);

  ///  <summary>Singleton that will manage the session objects</summary>
  TDSSessionManager = class
  type
    TFactoryMethod = reference to function: TDSSession;

  strict private
    FSessionContainer: TDictionary<String, TDSSession>;
    FListeners: TList<TDSSessionEvent>;

  private
    class var FInstance: TDSSessionManager;

    ///  <summary> Returns the session object based on its id
    ///  </summary>
    ///  <param name="SessionId">session identifier</param>
    ///  <return>a session object, nil if not found</return>
    function GetSession(SessionId: string): TDSSession;
    ///  <summary> Returns the tunnel session object based on its id
    ///  </summary>
    ///  <param name="SessionId">session identifier</param>
    ///  <return>tunnel session object, nil if not found or is not a tunnel session</return>
    function GetTunnelSession(SessionId: string): TDSTunnelSession;

    function GetUniqueSessionId: string;

    procedure TerminateSession(session: TDSSession); overload;
    procedure CloseSession(session: TDSSession); overload;

    ///  <summary> Internal function for notifying the registered events
    ///  </summary>
    procedure NotifyEvents(session: TDSSession; EventType: TDSSessionEventType);
    procedure TerminateAllSessions(const ACreator: TObject;
      AAllSessions: Boolean); overload;

  public
    constructor Create;
    destructor Destroy; override;

    function CreateSession<T: TDSSession>(factory: TFactoryMethod; userName: String): T; overload;
    function CreateSession<T: TDSSession>(factory: TFactoryMethod; DoNotify: Boolean = True): T; overload;

    ///  <summary> Add the given session event to the list of events which gets
    ///     executed when a change occurrs with a session through this manager.
    ///  </summary>
    procedure AddSessionEvent(Event: TDSSessionEvent);
    ///  <summary> Remove the given session event to the list of events which gets
    ///     executed when a change occurrs with a session through this manager.
    ///  </summary>
    ///  <returns> true if successfully removed, false otherwise. </returns>
    function RemoveSessionEvent(Event: TDSSessionEvent): boolean;

    ///  <summary>Closes the session identified by argument
    ///  </summary>
    ///  <remarks> The session object is freed, no further access to it is expected
    ///  </remarks>
    ///  <param name="SessionId">session identifier</param>
    procedure CloseSession(SessionId: string); overload;
    ///  <summary> Terminates all registered sessions for a given owner. Usually when the owner is taken
    ///    offline or being closed.
    ///  </summary>
    procedure TerminateAllSessions(const ACreator: TObject); overload;
    ///  <summary> Terminates all registered sessions. Usually when the the server is stopped.
    ///  </summary>
    procedure TerminateAllSessions; overload;
    ///  <summary> Iterates over all sessions and invokes the TDSSessionVisitor for each.
    ///  </summary>
    procedure ForEachSession(AVisitor: TDSSessionVisitor);
    ///  <summary> Removes the session from session container and invokes session's Teminate method
    ///  </summary>
    ///  <remarks> Further session access will not be possible
    ///  </remarks>
    ///  <param name="SessionId">session unique name</param>
    procedure TerminateSession(const sessionId: String); overload;
    ///  <summary> Returns number of open sessions
    ///  </summary>
    ///  <returns>number of open session</returns>
    function GetSessionCount: Integer;
    ///  <summary>Removes the session from session container
    ///  </summary>
    ///  <param name="SessionId">session identifier</param>
    function RemoveSession(SessionId: string): TDSSession;
    ///  <summary> Adds all open session keys to parameter container
    ///  </summary>
    ///  <param name="Container">string list</param>
    procedure GetOpenSessionKeys(Container: TStrings); overload;
    procedure GetOpenSessionKeys(Container: TStrings; ACreator: TObject); overload;

    ///  <summary> Returns the Session for the current thread.
    ///  </summary>
    class function GetThreadSession: TDSSession;
    ///  <summary> Sets the given session as the session for the thread calling this function.
    ///  </summary>
    class procedure SetAsThreadSession(Session: TDSSession);
    ///  <summary> Removes any session set to be the session for the current thread
    ///  </summary>
    class procedure ClearThreadSession;

    property Session[id: String]: TDSSession read GetSession;
    property TunnelSession[id: String]: TDSTunnelSession read GetTunnelSession;

    class property Instance: TDSSessionManager read FInstance;
  end;

  ///  <summary> Synchronizes the local channel </summary>
  TDSSynchronizedLocalChannel = class(TDBXLocalChannel)
  private
    FReadSemaphore: TSemaphore;
    FLocalReadSemaphore: TSemaphore;
    FWriteSemaphore: TSemaphore;
    FLocalWriteSemaphore: TSemaphore;
    FTerminated: boolean;

  public
    constructor Create(const ServerName: String);
    destructor Destroy; override;

    function Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    function WriteLocalData(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;

    function Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    function ReadLocalData(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;

    procedure Terminate;
  end;

  ///  <summary> Consumes remote byte stream produced by a remote source. The
  ///   remote is proxied by a local session instance passed in the contructor.
  ///  </summary>
  TDSLocalServer = class(TThread)
  private
    FErrorMsg: String;
    FLocalChannel: TDBXLocalChannel;
    FDBXProtocolHandler: TDBXProtocolHandler;
    FSession: TDSSession;

  protected
    procedure Execute; override;
    ///  <summary> Processes the byte stream as it comes along
    ///  </summary>
    ///  <remarks> The tunnel session is synchronizing the read/write semaphores
    ///  </remarks>
    procedure ConsumeByteStream;

  public
    constructor Create(ALocalChannel: TDBXLocalChannel; AProtocolHandlerFactory: TDSJSONProtocolHandlerFactory;
                           AFilters: TTransportFilterCollection; Session: TDSSession);
    destructor Destroy; override;

    ///  <summary> Returns true if the local server protocol failed at some point</summary>
    ///  <remarks>Error management is passive due to multi-threaded environment. It
    ///    is the responsability of the user thread to use this flag appropriately.
    ///    The error message can be acquired using ErrorMsg property.
    ///  </remarks>
    ///  <returns>true if the communication protocol exprienced an error</returns>
    function HasError: Boolean;
    ///  <summary>Error message when HasError function returns true</summary>
    property ErrorMsg: String read FErrorMsg;
  end;



  ///  <summary> Manages the http session for a local DS instance </summary>
  TDSLocalSession = class(TDSTunnelSession)
  private
    FFilters: TTransportFilterCollection;
    FProtocolHandlerFactory: TDSJSONProtocolHandlerFactory;
    FLocalChannel: TDSSynchronizedLocalChannel;
    FDSLocalServer: TDSLocalServer;

  public
    constructor Create(AFilters: TTransportFilterCollection; AProtocolHandlerFactory: TDSJSONProtocolHandlerFactory);
    destructor Destroy; override;

    procedure Open; override;
    procedure Close; override;
    procedure Terminate; override;

    ///  <summary> Extension of Authenticate to wrap the TCP authentication manager call
    ///  </summary>
    function Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean; override;
    function Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    function Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
  end;

  TTunnelSessionEvent = procedure(Sender: TObject; Session: TDSTunnelSession; Content: TBytes;
                                          var Count: Integer) of object;

  ///  <summary> Implements the HTTP tunneling logic. The tunnel accepts POST and
  ///    GET requests from HTTP channels and un-wraps or wraps the byte content from/for them.
  ///    POST is assimilated with a write operation, GET is assimilated with a READ.
  ///    The actual byte flow is handled by session's channel toward and from the
  ///    intranet resource.
  ///  </summary>
  ///  <remarks>
  ///    Class handles the session id generation, session management, session life cycle
  ///  </remarks>
  TDSTunnelService = class
  strict private
    FFilters: TTransportFilterCollection;
    FProtocolHandlerFactory: TDSJSONProtocolHandlerFactory;
    FDSHostname: String;
    FDSPort: Integer;
    FHasLocalServer: Boolean;

  private
    FDBXProperties: TDBXDatasnapProperties;
    FOnOpenSession: TTunnelSessionEvent;
    FOnErrorOpenSession: TTunnelSessionEvent;
    FOnCloseSession: TTunnelSessionEvent;
    FOnWriteSession: TTunnelSessionEvent;
    FOnReadSession: TTunnelSessionEvent;
    FOnErrorWriteSession: TTunnelSessionEvent;
    FOnErrorReadSession: TTunnelSessionEvent;
    FDSAuthenticationManager: TDSCustomAuthenticationManager;

  protected
    ///  <summary> True if the current session id signals the session closure
    ///  </summary>
    ///  <return>true if current session should be closed</return>
    class function CanCloseSession(var id: string): boolean;
    ///  <summary> Creates a tunnel session based on the tunnel creation parameters
    ///  </summary>
    ///  <param name="Session">output tunnel session object</param>
    ///  <param name="RemoteIP">The connecting client's IP address</param>
    procedure CreateSession(out Session: TDSTunnelSession; RemoteIP: String = ''); overload;
    ///  <summary> Creates a tunnel session based on the tunnel creation parameters
    ///  </summary>
    ///  <param name="Session">output tunnel session object</param>
    ///  <param name="ClientInfo">Info about the connecting client</param>
    procedure CreateSession(out Session: TDSTunnelSession; ClientInfo: TDBXClientInfo); overload;
    function GetSession(const SessionId: String): TDSTunnelSession;
    ///  <summary>Default implementation of the OpenSession event</summary>
    ///  <remarks>Event is triggered each time a session is opened successfully.
    ///     Default implementation delegates to OnOpenSession property if set</remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultOpenSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);
    ///  <summary>Default implementation of the ErrorOpenSession event</summary>
    ///  <remarks>Event is triggered when a session cannot be opened. Default implementation
    ///    delegates to OnOpenSessionError property if set, otherwise re-throws the
    ///    exception.</remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultErrorOpenSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);
    ///  <summary>Default implementation of the CloseSession event</summary>
    ///  <remarks>Event is triggered each time a session is closed successfully.
    ///     Default implementation delegates to OnCloseSession property if set</remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultCloseSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);
    ///  <summary>Default implementation of the WriteSession event</summary>
    ///  <remarks>Event is triggered each time a session performs a write operation successfully.
    ///     Default implementation delegates to OnWriteSession property if set</remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultWriteSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);
    ///  <summary>Default implementation of the ReadSession event</summary>
    ///  <remarks>Event is triggered each time a session performs a read operation successfully.
    ///     Default implementation delegates to OnReadSession property if set</remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultReadSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);
    ///  <summary>Default implementation of the ErrorWriteSession event</summary>
    ///  <remarks>Event is triggered each time a session fails to write data.
    ///     Default implementation delegates to OnErrorWriteSession property if set, otherwise it
    ///     rethrows the exception.
    ///  </remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultErrorWriteSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);
    ///  <summary>Default implementation of the ErrorReadSession event</summary>
    ///  <remarks>Event is triggered each time a session fails to write data.
    ///     Default implementation delegates to OnErrorReadSession property if set, otherwise it
    ///     rethrows the exception.
    ///  </remarks>
    ///  <param name="Sender">Event sender</param>
    ///  <param name="Session">Tunnel session instance that manages current comunication</param>
    ///  <param name="Content">Bytes content</param>
    ///  <param name="Count">Byte content size (in bytes)</param>
    procedure DefaultErrorReadSessionEvent(Sender: TObject; Session: TDSTunnelSession;
                                            Content: TBytes; var Count: Integer);

    procedure SetDSHostname(AHostname: String);
    procedure SetDSPort(APort: Integer);

  public
    ///  <summary> Constructor with hostname and port to write and read the byte stream
    ///  </summary>
    ///  <param name="DSHostname">datasnap server machine</param>
    ///  <param name="DSPort">datasnap server port it listens to</param>
    ///  <param name="AFilters">the filters collection</param>
    ///  <param name="AProtocolHandlerFactory">the protocol handler factory</param>
    constructor Create(DSHostname: String; DSPort: Integer; AFilters: TTransportFilterCollection;
                           AProtocolHandlerFactory: TDSJSONProtocolHandlerFactory); virtual;
    destructor Destroy; override;

    ///  <summary>Pass through of user credentials</summary>
    ///  <param name="userName">user name</param>
    ///  <param name="userPass">user password</param>
    procedure AddUserCredentials(const userName: String; const userPass: String);
    ///  <summary> Terminates all registered sessions. Usually when the server is taken
    ///    offline or being closed.
    ///  </summary>
    procedure TerminateAllSessions;
    ///  <summary> Terminates session with session id among the input parameters
    ///  </summary>
    ///  <remarks> Further session access will not be possible
    ///  </remarks>
    ///  <param name="Params">Parameter collection</param>
    class procedure TerminateSession(const Params: TStrings); overload;
    ///  <summary> Returns number of open sessions
    ///  </summary>
    ///  <returns>number of open session</returns>
    function GetSessionCount: Integer;
    ///  <summary>Closes the session identified by argument
    ///  </summary>
    ///  <remarks> The session object is freed, no further access to it is expected
    ///  </remarks>
    ///  <param name="SessionId">session identifier</param>
    procedure CloseSession(SessionId: string); overload;
    ///  <summary> Adds all open session keys to parameter container
    ///  </summary>
    ///  <param name="Container">string list</param>
    procedure GetOpenSessionKeys(Container: TStrings);

    ///  <summary>
    ///    Initializes the session pointed to by the specified parameter value for 'dss'
    ///    If the value of the 'dss' parameter is 0, then a new session will be created and the
    ///    value for dss in the given params will be replaced.
    ///  </summary>
    function InitializeSession(Params: TStrings; RemoteIP: String = ''): TDSTunnelSession; overload;
    function InitializeSession(Params: TStrings; ClientInfo: TDBXClientInfo): TDSTunnelSession; overload;

    ///  <summary>
    ///    Handles the POST requests. They are assimilated to write operations.
    ///    The response consists in the session id and the actual amount of bytes
    ///    successfully delivered to the destination.
    ///  </summary>
    ///  <param name="Params">HTTP parameters (name=value) that provide the session id
    ///    (dss) and eventually the content size (c). The content is expected to be available
    ///    in the byte stream. A session id zero (0) is equivalent to a new session.
    ///    The code will generate a new session id that will be returned as content
    ///    in the JSON object.
    ///  </param>
    ///  <param name="Content">Byte content to be forwarded to the session's communication channel</param>
    ///  <param name="JsonResponse">Output parameters with the session id and actual data write size.
    ///  <param name="CloseConnection">true if server has to signal client to close the connection</param>
    ///    Upon success the response is: {"response":[[sessionId],[count]]
    ///  </param>
    procedure ProcessPOST(Params: TStrings; Content: TBytes; out JsonResponse: TJSONValue; out CloseConnection: boolean);
    ///  <summary>
    ///    Handles the GET requests. They are assimilated to the read operations. The
    ///    response is returned as a byte stream.
    ///  </summary>
    ///  <param name="Params">Request parameters with session id (dss) and expected byte
    ///    count to be read (c).
    ///  </param>
    ///  <param name="Len">Actual number of bytes read</param>
    ///  <param name="CloseConnection">true if server has to signal client to close the connection</param>
    ///  <return>byte stream</return>
    function ProcessGET(Params: TStrings; var Len: Integer; out CloseConnection: boolean): TStream;
    ///  <summary> Returns true if the request parameters provide user name and paasword
    ///  </summary>
    ///  <returns>true if the request needs authentication</returns>
    function NeedsAuthentication(Params: TStrings): Boolean;
    ///  <summary>Remote host name where the DataSnap Server will process the requests
    ///  </summary>
    property DSHostname: String read FDSHostname write SetDSHostname;
    ///  <summary>Remote DataSnap port that processes the requests</summary>
    property DSPort: Integer read FDSPort write SetDSPort;
    ///  <summary>True if the DataSnap process is in process.</summary>
    ///  <remarks>In process servers have precedence over the remote ones. Hence, if
    ///    property is true DSHostname and DSPort will be ignored.
    ///  </remarks>
    property HasLocalServer: Boolean read FHasLocalServer write FHasLocalServer;
    ///  <summary>Communication filters such as compression or encryption</summary>
    property Filters: TTransportFilterCollection read FFilters write FFilters;
    ///  <summary>Factory that will provide the protocol handler</summary>
    property ProtocolHandlerFactory: TDSJSONProtocolHandlerFactory read FProtocolHandlerFactory
                                                write FProtocolHandlerFactory;
    ///  <summary>
    ///    Event invoked after the tunnel session was open
    ///  </summary>
    property OnOpenSession: TTunnelSessionEvent read FOnOpenSession write FOnOpenSession;
    ///  <summary>
    ///    Event invoked if a session cannot open
    ///  </summary>
    property OnErrorOpenSession: TTunnelSessionEvent read FOnErrorOpenSession write FOnErrorOpenSession;
    ///  <summary> Event invoked before the session is closed
    ///  </summary>
    property OnCloseSession: TTunnelSessionEvent read FOnCloseSession write FOnCloseSession;
    ///  <summary> Event invoked after the data has been written into the tunnel channel
    ///  </summary>
    property OnWriteSession: TTunnelSessionEvent read FOnWriteSession write FOnWriteSession;
    ///  <summary> Event invoked after the data has been read from the tunnel channel
    ///  </summary>
    property OnReadSession: TTunnelSessionEvent read FOnReadSession write FOnReadSession;
    ///  <summary> Event invoked if channel write failed because of connection error
    ///  </summary>
    property OnErrorWriteSession: TTunnelSessionEvent read FOnErrorWriteSession write FOnErrorWriteSession;
    ///  <summary> Event invoked if channel read failed because of connection error or timeout
    ///  </summary>
    property OnErrorReadSession: TTunnelSessionEvent read FOnErrorReadSession write FOnErrorReadSession;
    ///  <summary> Returns number of open sessions
    ///  </summary>
    property SessionCount: Integer read GetSessionCount;
    ///  <summary> The Authentication manager for use with this tunnel service
    ///  </summary>
    property DSAuthenticationManager: TDSCustomAuthenticationManager read FDSAuthenticationManager
                             write FDSAuthenticationManager;

  end;

  ///  <summary> Session class for TCP communication protocol.
  ///    It holds an instance of an authentication manager.
  ///  </summary>
  TDSTCPSession = class(TDSAuthSession)
  public
    ///  <summary> Creates an instance of a TCP Session, passing in the
    ///    authentication manager to hold a reference to.
    ///  </summary>
    constructor Create(AAuthManager: TDSCustomAuthenticationManager); overload; virtual;
    constructor Create(AAuthManager: TObject); overload; virtual;
    ///  <summary> Extension of Authenticate to wrap the TCP authentication manager call
    ///  </summary>
    function Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean; override;
  end;

implementation

uses
{$IFNDEF POSIX}
  Winapi.ActiveX,
  System.Win.ComObj,
  Winapi.Windows,
{$ELSE}
  Macapi.CoreServices,
{$ENDIF}
  Data.DBXClientResStrs,
  Data.DBXJSONCommon,
  Data.DBXPlatform,
  Data.DBXTransportFilter,
  IPPeerAPI,
  System.StrUtils;

const
  CMD_EXECUTE = 'execute';
  CMD_ERROR   = 'error';
  QP_DSS      = 'dss';
  QP_COUNT    = 'c';
  DRIVER_NAME = 'Datasnap';
  NULL        = 'null';
  PARAMETERS_PAIR  = '_parameters';

ThreadVar
  VDSSession: TDSSession; {Session for the current thread}

type
    TAnonymousBlock = reference to procedure;

procedure Synchronized(monitor: TObject; proc: TAnonymousBlock);
begin
  TMonitor.Enter(monitor);
  try
    proc;
  finally
    TMonitor.Exit(monitor);
  end;
end;

{TDSTunnelSession}

constructor TDSTunnelSession.Create;
begin
  inherited;
  FUserFlag := 0;
  FUserPointer := nil;
end;

destructor TDSTunnelSession.Destroy;
begin
  inherited;
end;

procedure TDSTunnelSession.Reopen(DBXDatasnapProperties: TDBXDatasnapProperties);
begin
    // do nothing
end;

procedure TDSTunnelSession.TerminateSession;
begin
  inherited;

end;

{TDSRemoteSession}

constructor TDSRemoteSession.Create(DBXDatasnapProperties: TDBXDatasnapProperties);
begin
  inherited Create;

  FSocketChannel := TDBXSocketChannel.Create;
  FSocketChannel.DBXProperties := DBXDatasnapProperties;
end;

destructor TDSRemoteSession.Destroy;
begin
  FreeAndNil(FSocketChannel);
  inherited;
end;

procedure TDSRemoteSession.Open;
begin
  FSocketChannel.Open;
  FStatus := Connected;
end;

  procedure TDSRemoteSession.Reopen(DBXDatasnapProperties: TDBXDatasnapProperties);
  begin
    try
      Close;
    finally
      FreeAndNil(FSocketChannel);
    end;

    FSocketChannel := TDBXSocketChannel.Create;
    FSocketChannel.DBXProperties := DBXDatasnapProperties;

    Open;
  end;

function TDSRemoteSession.Authenticate(
  const AuthenticateEventObject: TDSAuthenticateEventObject;
  connectionProps: TDBXProperties): boolean;
begin
  Inherited;

  {Authentication will be done elsewhere for HTTP}
  exit(True);
end;

procedure TDSRemoteSession.Close;
  begin
    Inherited;
    FSocketChannel.Close;
  end;

  procedure TDSRemoteSession.Terminate;
  begin
    Inherited;
    FSocketChannel.Terminate;
  end;

  function TDSRemoteSession.Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
  begin
    Result := FSocketChannel.Read(Buffer, Offset, Count);
  end;

  function TDSRemoteSession.Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
  begin
    Result := FSocketChannel.Write(Buffer, Offset, Count);
  end;

{TDSSynchronizedLocalChannel}

  constructor TDSSynchronizedLocalChannel.Create(const ServerName: string);
  begin
    inherited Create(ServerName);

    FReadSemaphore := TSemaphore.Create(nil, 0, MaxInt, '');
    FLocalReadSemaphore := TSemaphore.Create(nil, 1, MaxInt, '');
    FWriteSemaphore := TSemaphore.Create(nil, 0, MaxInt, '');
    FLocalWriteSemaphore := TSemaphore.Create(nil, 1, MaxInt, '');
    FTerminated := false;
  end;

  destructor TDSSynchronizedLocalChannel.Destroy;
  begin
    FreeAndNil(FReadSemaphore);
    FreeAndNil(FWriteSemaphore);
    FreeAndNil(FLocalReadSemaphore);
    FreeAndNil(FLocalWriteSemaphore);
    inherited;
  end;

  procedure TDSSynchronizedLocalChannel.Terminate;
  begin
    FTerminated := true;

    FLocalWriteSemaphore.Release;
    FLocalReadSemaphore.Release;
    FWriteSemaphore.Release;
    FReadSemaphore.Release;
  end;

  function TDSSynchronizedLocalChannel.Read(const Buffer: TBytes; const Offset: Integer;
                                               const Count: Integer): Integer;
  var
    status: TWaitResult;
  begin
    status := FReadSemaphore.WaitFor(INFINITE);
    if status = wrError then
      Raise TDBXError.Create(0, Format(SWaitFailure, ['Read']));
    if status = wrTimeout then
      Raise TDBXError.Create(0, Format(SWaitTimeout, ['Read']));
    if FTerminated then
      Raise TDBXError.Create(0, SWaitTerminated);

    Result := inherited Read(Buffer, Offset, Count);

    // if all written data was consumed allow subsequent write local data
    if not HasWriteData then
      FLocalWriteSemaphore.Release
    else
      FReadSemaphore.Release;
  end;

  function TDSSynchronizedLocalChannel.WriteLocalData(const Buffer: TBytes; const Offset: Integer;
                                                const Count: Integer): Integer;
  var
    status: TWaitResult;
  begin
    if FTerminated then
      Raise TDBXError.Create(0, SWaitTerminated);
    status := FLocalWriteSemaphore.WaitFor(INFINITE);
    if status = wrError then
      Raise TDBXError.Create(0, Format(SWaitFailure, ['WriteLocalData']));
    if status = wrTimeout then
      Raise TDBXError.Create(0, Format(SWaitTimeout, ['WriteLocalData']));
    if FTerminated then
      Raise TDBXError.Create(0, SWaitTerminated);

    Result := inherited WriteLocalData(Buffer, Offset, Count);
    FReadSemaphore.Release;
  end;

  function TDSSynchronizedLocalChannel.Write(const Buffer: TBytes; const Offset: Integer;
                                                const Count: Integer): Integer;
  var
    status: TWaitResult;
  begin
    status := FLocalReadSemaphore.WaitFor(INFINITE);
    if status = wrError then
      Raise TDBXError.Create(0, Format(SWaitFailure, ['Write']));
    if status = wrTimeout then
      Raise TDBXError.Create(0, Format(SWaitTimeout, ['Write']));
    if FTerminated then
      Raise TDBXError.Create(0, SWaitTerminated);

    Result := inherited Write(Buffer, Offset, Count);
    FWriteSemaphore.Release;
  end;

  function TDSSynchronizedLocalChannel.ReadLocalData(const Buffer: TBytes; const Offset: Integer;
                                                const Count: Integer): Integer;
  var
    status: TWaitResult;
  begin
    if FTerminated then
      Raise TDBXError.Create(0, SWaitTerminated);
    status := FWriteSemaphore.WaitFor(INFINITE);
    if status = wrError then
      Raise TDBXError.Create(0, Format(SWaitFailure, ['ReadLocalData']));
    if status = wrTimeout then
      Raise TDBXError.Create(0, Format(SWaitTimeout, ['ReadLocalData']));
    if FTerminated then
      Raise TDBXError.Create(0, SWaitTerminated);

    Result := inherited ReadLocalData(Buffer, Offset, Count);

    if not HasReadData then
      FLocalReadSemaphore.Release
    else
      FWriteSemaphore.Release;
  end;

{TDSLocalSession}

  constructor TDSLocalSession.Create(AFilters: TTransportFilterCollection; AProtocolHandlerFactory: TDSJSONProtocolHandlerFactory);
  begin
    inherited Create;

    FFilters := AFilters;
    FProtocolHandlerFactory := AProtocolHandlerFactory;
  end;

  destructor TDSLocalSession.Destroy;
  begin
    FFilters := nil; // no ownership
    FProtocolHandlerFactory := nil; // no ownership

    if not FDSLocalServer.Terminated then
      FDSLocalServer.Terminate;
    FreeAndNil(FDSLocalServer);

    inherited
  end;

  procedure TDSLocalSession.Open;
  var
    RemoteIP: String;
    ClientInfo: TDBXClientInfo;
  begin
    RemoteIP := GetData('RemoteIP');
    if RemoteIP = EmptyStr then
      RemoteIP := 'local';
    FLocalChannel := TDSSynchronizedLocalChannel.Create(RemoteIP);

    with ClientInfo do
    begin
      IpAddress := RemoteIP;
      Protocol := GetData('CommunicationProtocol');
      AppName := GetData('RemoteAppName');
    end;

    FLocalChannel.ChannelInfo.ClientInfo := ClientInfo;

    // start DS local
    FDSLocalServer := TDSLocalServer.Create(FLocalChannel, FProtocolHandlerFactory, FFilters, Self);
    FStatus := Connected;
  end;

function TDSLocalSession.Authenticate(
  const AuthenticateEventObject: TDSAuthenticateEventObject;
  connectionProps: TDBXProperties): boolean;
begin
  Inherited;

  if FAuthManager <> nil then
    exit(FAuthManager.Authenticate(AuthenticateEventObject, connectionProps));

  exit(True);
end;

procedure TDSLocalSession.Close;
  begin
    // stop the DS local
    FStatus := Closed;

    FLocalChannel.Terminate;

    FDSLocalServer.Terminate;

    if not FDSLocalServer.Finished then
      FDSLocalServer.WaitFor;
  end;

  procedure TDSLocalSession.Terminate;
  begin
    Close;
  end;

  function TDSLocalSession.Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
  begin
    Result := FLocalChannel.ReadLocalData(Buffer, Offset, Count);
    if (FStatus = Connected) and FDSLocalServer.HasError then
      Raise TDBXError.Create(0, FDSLocalServer.ErrorMsg);
  end;

  function TDSLocalSession.Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
  begin
    Result := FLocalChannel.WriteLocalData(Buffer, Offset, Count);
    if (FStatus = Connected) and FDSLocalServer.HasError then
      Raise TDBXError.Create(0, FDSLocalServer.ErrorMsg);
  end;

{TDSLocalServer}

  constructor TDSLocalServer.Create(ALocalChannel: TDBXLocalChannel; AProtocolHandlerFactory: TDSJSONProtocolHandlerFactory;
                           AFilters: TTransportFilterCollection; Session: TDSSession);
  var
    FilterChannel: TDBXFilterSocketChannel;
  begin
    inherited Create(false);

    FSession := Session;

    FLocalChannel := ALocalChannel;

    FilterChannel := TDBXFilterSocketChannel.Create(AFilters);
    FilterChannel.Channel := FLocalChannel;

    FDBXProtocolHandler := AProtocolHandlerFactory.CreateProtocolHandler(FilterChannel);
  end;

  destructor TDSLocalServer.Destroy;
  begin
    FreeAndNil( FDBXProtocolHandler );
    FLocalChannel := nil; // soft reference
  end;

  procedure TDSLocalServer.ConsumeByteStream;
  begin
    try
      FDBXProtocolHandler.HandleProtocol;
    except
      on ex: Exception do
        if not Terminated then
        begin
          FErrorMsg := ex.Message;
          Terminate;
        end;
    end;
  end;

  procedure TDSLocalServer.Execute;
  begin
{$IFNDEF POSIX}
  if CoInitFlags = -1 then
    CoInitializeEx(nil, COINIT_MULTITHREADED)
  else
    CoInitializeEx(nil, CoInitFlags);
{$ENDIF}
    try
      if FSession <> nil then
        TDSSessionManager.SetAsThreadSession(FSession);
      ConsumeByteStream;
    finally
{$IFNDEF POSIX}
    CoUninitialize;
{$ENDIF}
    end
  end;

  function TDSLocalServer.HasError: Boolean;
  begin
    Result := FErrorMsg <> EmptyStr;
  end;

{TDSTunnelService}

  constructor TDSTunnelService.Create(DSHostname: String; DSPort: Integer; AFilters: TTransportFilterCollection;
                           AProtocolHandlerFactory: TDSJSONProtocolHandlerFactory );
  begin
    FDSHostname := DSHostname;
    FDSPort := DSPort;
    FFilters := AFilters;
    FProtocolHandlerFactory := AProtocolHandlerFactory;

    FDBXProperties := TDBXDatasnapProperties.Create(nil);
    FDBXProperties.Values[ TDBXPropertyNames.DriverName ] := DRIVER_NAME;
    FDBXProperties.Values[ TDBXPropertyNames.HostName ] := FDSHostname;
    FDBXProperties.Values[ TDBXPropertyNames.Port ] := IntToStr( FDSPort );
  end;

  destructor TDSTunnelService.Destroy;
  begin
    FreeAndNil(FDBXProperties);

    FFilters := nil; // no ownership
    FProtocolHandlerFactory := nil; // no ownership

    inherited;
  end;

  procedure TDSTunnelService.AddUserCredentials(const userName, userPass: String);
begin
  FDBXProperties.DSAuthUser := userName;
  FDBXProperties.DSAuthPassword := userPass;
end;

class function TDSTunnelService.CanCloseSession(var id: string): boolean;
  begin
    Result := StringStartsWith(id, '-');
    if Result then
      Delete(id, 1, 1);
  end;

  procedure TDSTunnelService.CreateSession(out Session: TDSTunnelSession; RemoteIP: String);
  var
    ClientInfo: TDBXClientInfo;
  begin
    ClientInfo.IpAddress := RemoteIP;
    CreateSession(Session, ClientInfo);
  end;

  procedure TDSTunnelService.CreateSession(out Session: TDSTunnelSession; ClientInfo: TDBXClientInfo);
  var
    Len: Integer;
  begin
    Session := TDSSessionManager.Instance.CreateSession<TDSTunnelSession>(function: TDSSession begin
      if HasLocalServer then
        Result := TDSLocalSession.Create(FFilters, FProtocolHandlerFactory)
      else
      begin
        Result := TDSRemoteSession.Create(FDBXProperties);
      end;
      Result.ObjectCreator := self;

      if ClientInfo.IpAddress <> EmptyStr then
        Result.PutData('RemoteIP', ClientInfo.IpAddress);
      if ClientInfo.Protocol <> EmptyStr then
        Result.PutData('CommunicationProtocol', ClientInfo.Protocol);
      if ClientInfo.AppName <> EmptyStr then
        Result.PutData('RemoteAppName', ClientInfo.AppName);
      Result.PutData('ProtocolSubType', 'tunnel');

    end, FDBXProperties.UserName);

    try
      Session.FAuthManager := FDSAuthenticationManager;
      Session.Open;
    except
      on ex: Exception do
        try
          DefaultErrorOpenSessionEvent(ex, Session, nil, Len);
        except
          TDSSessionManager.Instance.RemoveSession(Session.SessionName);
          FreeAndNil(Session);
          raise;
        end;
    end;

    DefaultOpenSessionEvent(self, Session, nil, Len);
  end;

  procedure TDSTunnelService.CloseSession(SessionId: string);
  var
    Session: TDSSession;
    Len: Integer;
  begin
    Session := TDSSessionManager.Instance.Session[SessionId];
    if (Session <> nil) and (Session is TDSTunnelSession) then
    begin
      try
        DefaultCloseSessionEvent(self, TDSTunnelSession(Session), nil, Len);
      finally
        TDSSessionManager.Instance.CloseSession(SessionId);
      end
    end
  end;

  procedure TDSTunnelService.TerminateAllSessions;
  var
    I: Integer;
    openSessions: TStringList;
  begin
    openSessions := TStringList.Create;
    try
      TDSSessionManager.Instance.GetOpenSessionKeys(openSessions, self);
      for I := 0 to openSessions.Count - 1 do
        TDSSessionManager.Instance.TerminateSession(openSessions[I]);
    finally
      openSessions.Free;
    end;
  end;

  class procedure TDSTunnelService.TerminateSession(const Params: TStrings);
  var
    SessionId: string;
  begin
    SessionId := Params.Values[QP_DSS];
    if (SessionId <> '') and (SessionId <> '0') then
      TDSSessionManager.Instance.TerminateSession(SessionId);
  end;

function TDSTunnelService.GetSession(const SessionId: String): TDSTunnelSession;
begin
  Result :=  TDSSessionManager.Instance.TunnelSession[SessionId];
end;

function TDSTunnelService.GetSessionCount: Integer;
  var
    openSessions: TStringList;
  begin
    openSessions := TStringList.Create;
    try
      TDSSessionManager.Instance.GetOpenSessionKeys(openSessions, self);
      Result := openSessions.Count;
    finally
      openSessions.Free;
    end;
  end;

function TDSTunnelService.InitializeSession(Params: TStrings; RemoteIP: String): TDSTunnelSession;
var
  ClientInfo: TDBXClientInfo;
begin
  ClientInfo.IpAddress := RemoteIp;
  Result := InitializeSession(Params, ClientInfo);
end;

function TDSTunnelService.InitializeSession(Params: TStrings; ClientInfo: TDBXClientInfo): TDSTunnelSession;
var
  Session: TDSTunnelSession;
  PSessionId: String;
begin
  Session := nil;

  PSessionId := Params.Values[QP_DSS];
  if PSessionId = '0' then
  begin
    // first time - implicit session creation
    CreateSession(Session, ClientInfo);
    PSessionId := Session.SessionName;
    // save the session id for error processing
    Params.Values[QP_DSS] := PSessionId;
  end
  else
    // get the session object
    Session := GetSession(PSessionId);

  if Session <> nil then
    //associate session and thread
    TDSSessionManager.SetAsThreadSession(Session);

  Result := Session;
end;

function TDSTunnelService.NeedsAuthentication(Params: TStrings): Boolean;
var
  PSessionId: String;
begin
  PSessionId := Params.Values[QP_DSS];
  Result := PSessionId = '0';
end;

procedure TDSTunnelService.GetOpenSessionKeys(Container: TStrings);
begin
    TDSSessionManager.Instance.GetOpenSessionKeys(Container, self);
end;

procedure TDSTunnelService.ProcessPOST(Params: TStrings; Content: TBytes; out JsonResponse: TJSONValue;
                                                 out CloseConnection: boolean);
var
    Session: TDSTunnelSession;
    PSessionId: String;
    PLen: String;
    Len: Integer;
    JsonParams: TJSONArray;
begin
    // get the session id
    PSessionId := Params.Values[QP_DSS];
    if PSessionId <> '' then
    begin
      // close session request?
      if CanCloseSession(PSessionId) then
      begin
        CloseConnection := true;
        CloseSession(PSessionId);
      end
      else
      begin
        CloseConnection := false;

        //creates or looks-up session for given session ID.
        //content of Params will be replaced for 'dss' if session is created
        Session := InitializeSession(Params);

        if Session <> nil then
        begin
          //associate session and thread
          TDSSessionManager.SetAsThreadSession(Session);

          // number of bytes to be written
          PLen := Params.Values[QP_COUNT];
          if PLen = '' then
            Len := Length(Content)
          else
            Len := StrToInt(PLen);

          try
            // write Len bytes
            Len := Session.Write(Content, 0, Len);
          except
            on ex: Exception do
              DefaultErrorWriteSessionEvent(ex, Session, Content, Len);
          end;

          JsonResponse := TJSONObject.Create;
          JsonParams := TJSONArray.Create;
          TJSONObject(JsonResponse).AddPair(
                            TJSONPair.Create(TJSONString.Create('response'),
                                             JsonParams));
          JsonParams.AddElement(TJSONString.Create(PSessionId));
          JsonParams.AddElement(TJSONNumber.Create(Len));

          //dis-associate the session from the thread
          TDSSessionManager.ClearThreadSession;

          DefaultWriteSessionEvent(self, Session, Content, Len);
        end
        else
          raise TDSServiceException.Create(SNoSessionFound);
      end;
    end
    else
      raise TDSServiceException.Create(Format(SNoSessionInRequest, [QP_DSS]));
end;

  function TDSTunnelService.ProcessGET(Params: TStrings; var Len: Integer; out CloseConnection: boolean): TStream;
  var
    Session: TDSTunnelSession;
    PSessionId: String;
    PLen: String;
    Buff: TBytes;
    Count: Integer;
  begin
    Result := nil;
    // get the session id
    PSessionId := Params.Values[QP_DSS];
    if PSessionId <> '' then
    begin
      // close session request?
      if CanCloseSession(PSessionId) then
      begin
        CloseSession(PSessionId);
        CloseConnection := true;
      end
      else
      begin
        CloseConnection := false;

        //creates or looks-up session for given session ID.
        //content of Params will be replaced for 'dss' if session is created
        Session := InitializeSession(Params);

        if Session <> nil then
        begin
          //associate session and thread
          TDSSessionManager.SetAsThreadSession(Session);

          // number of bytes to be read
          PLen := Params.Values[QP_COUNT];
          if PLen = '' then
            raise TDSServiceException.Create(Format(SNoCountParam, [QP_COUNT]))
          else
            Count := StrToInt(PLen);
          SetLength(Buff, Count);
          Len := Count;
          try
            // read Len bytes
            Len := Session.Read(Buff, 0, Count);
          except
            on ex: Exception do
              DefaultErrorReadSessionEvent(ex, Session, Buff, Len);
          end;

          //dis-associate the session from the thread
          TDSSessionManager.ClearThreadSession;

          DefaultReadSessionEvent(self, Session, Buff, Len);

          if Len < Count then
            SetLength(Buff, Len);
          // write then into the stream
          Result := TBytesStream.Create(Buff);
        end
        else
          raise TDSServiceException.Create(SNoSessionFound);
      end;
    end
    else
      raise TDSServiceException.Create(Format(SNoSessionInRequest, [QP_DSS]));
  end;

  procedure TDSTunnelService.DefaultOpenSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnOpenSession) then
      FOnOpenSession(Sender, Session, Content, Count);
  end;

  procedure TDSTunnelService.DefaultErrorOpenSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnErrorOpenSession) then
      FOnErrorOpenSession(Sender, Session, Content, Count)
    else if Sender is Exception then
      raise TDSServiceException.Create(Exception(Sender).Message)
    else
      raise TDSServiceException.Create(SCommunicationErr);
  end;

  procedure TDSTunnelService.DefaultCloseSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnCloseSession) then
      FOnCloseSession(Sender, Session, Content, Count)
  end;

  procedure TDSTunnelService.DefaultWriteSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnWriteSession) then
      FOnWriteSession(Sender, Session, Content, Count)
  end;

  procedure TDSTunnelService.DefaultReadSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnReadSession) then
      FOnReadSession(Sender, Session, Content, Count)
  end;

  procedure TDSTunnelService.DefaultErrorWriteSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnErrorWriteSession) then
      FOnErrorWriteSession(Sender, Session, Content, Count)
    else if Sender is Exception then
      raise TDSServiceException.Create(Exception(Sender).Message)
    else
      raise TDSServiceException.Create(SCommunicationErr);
  end;

  procedure TDSTunnelService.DefaultErrorReadSessionEvent(Sender: TObject; Session: TDSTunnelSession; Content: TBytes; var Count: Integer);
  begin
    if Assigned(FOnErrorReadSession) then
      FOnErrorReadSession(Sender, Session, Content, Count)
    else if Sender is Exception then
      raise TDSServiceException.Create(Exception(Sender).Message)
    else
      raise TDSServiceException.Create(SCommunicationErr);
  end;

  procedure TDSTunnelService.SetDSHostname(AHostname: string);
  begin
    FDSHostname := AHostname;
    FDBXProperties.Values[ TDBXPropertyNames.HostName ] := FDSHostname;
  end;

  procedure TDSTunnelService.SetDSPort(APort: Integer);
  begin
    FDSPort := APort;
    FDBXProperties.Values[ TDBXPropertyNames.Port ] := IntToStr( FDSPort );
  end;

{TDSService}

constructor TDSService.Create(dsServerName, dsHostname: String; dsPort: Integer; AuthUser, AuthPassword: String);
begin
  Create(dsServerName, dsHostname, dsPort, AuthUser, AuthPassword, '');
end;

constructor TDSService.Create(dsServerName, dsHostname: String; dsPort: Integer; AuthUser, AuthPassword, AIPImplementationID: String);
  begin
    inherited Create;
    FDBXProperties := TDBXDatasnapProperties.Create(nil);
    if DSServerName = EmptyStr then
    begin
      FDBXProperties.Values[ TDBXPropertyNames.DriverName ] := DRIVER_NAME;
      FDBXProperties.Values[ TDBXPropertyNames.HostName ] := dsHostname;
      FDBXProperties.Values[ TDBXPropertyNames.Port ] := IntToStr( dsPort );
      FLocalConnection := false;
    end
    else
    begin
      FDBXProperties.Values[ TDBXPropertyNames.DriverName ] := DSServerName;
      FLocalConnection := true;
    end;
    FDBXProperties.DSAuthUser := AuthUser;
    FDBXProperties.DSAuthPassword := AuthPassword;
    FDBXProperties.Values[ TDBXPropertyNames.IPImplementationID ] := AIPImplementationID;

    StreamAsJSON := False;
  end;

  destructor TDSService.Destroy;
  begin
    FDBXProperties.Free;
    inherited;
  end;

  procedure TDSService.ProcessRequest(const Request: TJSONArray; ResponseHandler: TRequestCommandHandler);
  var
    JsonCmd: TJSONString;
    I: Integer;
  begin
    for I := 0 to Request.Size - 1 do
    begin
      JsonCmd := TJSONObject(Request.Get(I)).Get(0).JsonString;
      if JsonCmd.Value = CMD_EXECUTE then
      begin
        try
          Execute(TJSONObject(TJSONObject(request.Get(I)).Get(0).JsonValue), ResponseHandler);
        except
          on ex: Exception do
            ResponseHandler.AddCommandError(ex.Message);
        end;
      end
      else
      begin
        ResponseHandler.AddCommandError(Format(SInvalidInternalCmd, [JsonCmd.Value]));
      end;
    end;
  end;

  function TDSService.GetInputParameterInstance(JsonParam: TJSONValue; Parameter: TDBXParameter;
                                                var InstanceOwner: Boolean): TJSONValue;
  var
    ParameterType: Integer;
    ParamDirection: TDBXParameterDirection;
  begin
    //unless cloned, result will be the same as the value passed in
    Result := JsonParam;

    InstanceOwner := False;

    ParameterType := Parameter.DataType;
    ParamDirection := Parameter.ParameterDirection;

    //potentially clone the JsonParam, depending on if its value will be
    //returned in the response (var param) and if it is a complex type that
    //isn't cloned by JSONToDBX
    if (ParamDirection = TDBXParameterDirections.InOutParameter) then
    begin
      if JsonParam is TJSONObject then
      begin
        if (ParameterType = TDBXDataTypes.JsonValueType) then
        begin
          if Parameter.Value.ValueType.SubType <> TDBXDataTypes.UserSubType then
            InstanceOwner := True;
        end
        else if (ParameterType = TDBXDataTypes.TableType) then
          InstanceOwner := True;
      end
      else if JsonParam is TJSONArray then
        InstanceOwner := True;

      if InstanceOwner then
        Result := TJSONValue(JsonParam.Clone);
    end;
  end;

  procedure TDSService.Execute(const Request: TJSONObject; ResponseHandler: TRequestCommandHandler);
  var
      DBXConnection: TDBXConnection;
      DBXCommand: TDBXCommand;
      JsonParams: TJSONArray;
      JsonParam: TJSONValue;
      I, J: Integer;
      Command: String;
      ParamDirection: TDBXParameterDirection;
      OwnParams: boolean;
      DidClone: boolean;
  begin
    DBXCommand := nil;
    OwnParams := false;
    JsonParams := nil;

    DBXConnection := TDBXConnectionFactory.GetConnectionFactory.GetConnection(FDBXProperties);

    try
      DBXCommand := DBXConnection.CreateCommand;
      DBXCommand.CommandType := TDBXCommandTypes.DSServerMethod;

      Command := Request.Get(0).JsonString.Value;
      DBXCommand.Text := Command;
      DBXCommand.Prepare;

      JsonParams := TJSONArray(Request.Get(0).JsonValue);

      if JsonParams.Size > DBXCommand.Parameters.Count then
      begin
        // too many parameters
        Raise TDSServiceException.Create(Format(STooManyParameters, [Command, DBXCommand.Parameters.Count,
                                                              JsonParams.Size]));
      end;

      // populate input parameters - skip the output ones
      J := 0;
      for I := 0 to DBXCommand.Parameters.Count - 1 do
      begin
        DidClone := False;

        ParamDirection := DBXCommand.Parameters[I].ParameterDirection;
        if (ParamDirection = TDBXParameterDirections.InOutParameter) or
           (ParamDirection = TDBXParameterDirections.InParameter) then
        begin
          // if less input arguments are provided the rest are assumed to be nil
          if J >= jsonParams.Size then
            JsonParam := nil
          else
          begin
            JsonParam := JsonParams.Get(J);

            //in some cases, we will want to use a cloned instance of JsonParam, this helper
            //class assists with that... returning either the same instance or a cloned instance.
            JsonParam := GetInputParameterInstance(JsonParam, DBXCommand.Parameters[I], DidClone);
            Inc(J);
          end;

          
          try
            //Only set instanceOnwer to true if the instance has just been cloned
            TDBXJSONTools.JSONToDBX( JsonParam, DBXCommand.Parameters[I].Value, DBXCommand.Parameters[I].DataType, LocalConnection, DidClone );
          except
            //if an exception happened while trying to set the value,
            //we assume the value wasn't set. So, if the parameter passed in was cloned,
            //we need to free it here to prevent a memory leak
            if DidClone then
              FreeAndNil(JsonParam);
            Raise;
          end;
        end;
      end;

      if J < jsonParams.Size then
      begin
        // reject execution if not all input parameters were used
        Raise TDSServiceException.Create(Format(STooManyInputParams, [Command, J, jsonParams.Size]));
      end;

      DBXCommand.ExecuteUpdate;

      ResponseHandler.AddCommand(DBXCommand, DBXConnection);
      DBXCommand := nil;
      DBXConnection := nil;
    finally
      if OwnParams then
        JsonParams.Free;

      if DBXCommand <> nil then
        DBXCommand.Close;

      if DBXConnection <> nil then
        DBXConnection.Close;

      DBXCommand.Free;
      if LocalConnection and (DBXConnection <> nil) then
        TDSServerConnection(DBXConnection).ServerConnectionHandler.Free
      else
        DBXConnection.Free;
    end;

  end;

{TDSRESTService}

  constructor TDSRESTService.Create(DSServerName, DSHostname: String; DSPort: Integer; AuthUser, AuthPassword: String );
  begin
    CreateImpl(DSServerName, DSHostname, DSPort, AuthUser, AuthPassword, '');
  end;

  constructor TDSRESTService.CreateImpl(DSServerName, DSHostname: String; DSPort: Integer; AuthUser, AuthPassword, AIPImplementationID: String );
  begin
    inherited Create(DSServerName, DSHostname, DSPort, AuthUser, AuthPassword, AIPImplementationID);
  end;

  destructor TDSRESTService.Destroy;
  begin
    inherited;
  end;

  procedure TDSRESTService.BuildParamArray(const Params: TStringList; var ParamArray: TJSONArray);
  var
    I: Integer;
    S: String;
    LValue: Double;
  begin
    ParamArray := TJSONArray.Create;
    for I := 0 to Params.Count - 1 do
    begin
      S := Params[I];
      if (AnsiIndexText(S,TrueBoolStrs) > -1) then
         ParamArray.AddElement(TJSONTrue.Create)
      else if AnsiIndexText(S,FalseBoolStrs) > -1 then
         ParamArray.AddElement(TJSONFalse.Create)
      else if AnsiCompareStr(S,NULL) = 0 then
         ParamArray.AddElement(TJSONNull.Create)
      else
         if TDBXPlatform.TryJsonToFloat(S, LValue) then
           ParamArray.AddElement(TJSONNumber.Create(S))
         else
           ParamArray.AddElement(TJSONString.Create(S));
    end;
  end;

  procedure TDSRESTService.ParseRequest(const Request: string; var ClassName: string;
                           var MethodName: string; var ParamValues: TStringList);
  var
      SlashLeft, SlashRight: Integer;
      ParamValue: String;
      LIPImplementationID: string;
  begin
    // extract the class name
    SlashLeft := Pos(REQUEST_DELIMITER, Request);
    if SlashLeft = 0 then
    begin
      // no delimiter for class name
      Raise TDSServiceException.Create(SInvalidRequestFormat);
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
      if SlashRight < 1 then
      begin
        // no delimiter after class name
        Raise TDSServiceException.Create(SInvalidRequestFormat);
      end;
    end;
    if SlashRight = SlashLeft + 1 then
    begin
      // empty class name
      Raise TDSServiceException.Create(SInvalidRequestFormat);
    end;

    LIPImplementationID := FDBXProperties.Values[TDBXPropertyNames.IPImplementationID];
    ClassName :=  IPProcs(LIPImplementationID).URLDecode(Copy(Request, Slashleft+1, SlashRight-SlashLeft-1));

    // search for method name
    SlashLeft := SlashRight;
    SlashRight := PosEx(REQUEST_DELIMITER, Request, SlashLeft+1);
    if SlashRight < 1 then
    begin
      SlashRight := Length(Request)+1;
    end;

    MethodName := IPProcs(LIPImplementationID).URLDecode(Copy( Request, Slashleft+1, SlashRight-slashLeft-1));

    SlashLeft := SlashRight;
    ParamValues := TStringList.Create;
    while slashLeft < Length(Request) do
    begin
      SlashRight := PosEx(REQUEST_DELIMITER, Request, SlashLeft + 1);
      if SlashRight < 1 then
      begin
        SlashRight := Length(Request)+1;
      end;
      if (SlashRight = SlashLeft + 1) and (SlashRight <= Length(Request)) then
        ParamValues.Add(EmptyStr)
      else
      begin
        ParamValue := IPProcs(LIPImplementationID).URLDecode(Copy(Request, Slashleft+1, SlashRight-SlashLeft-1));
        ParamValues.Add(ParamValue);
      end;
      SlashLeft := SlashRight;
    end;
  end;

  procedure TDSRESTService.ProcessREST(const RequestType: String;
                                       const RestRequest: string;
                                       const Content: TBytes;
                                       ResponseHandler: TRequestCommandHandler);
  var
      ClassName, MethodName, DSMethodName: String;
      Params: TStringList;
      ExecuteCmd: TJSONArray;
      MethodObj: TJSONObject;
      ParamArray: TJSONArray;
      Body: TJSONValue;
      BodyArray: TJSONArray;
      I: Integer;
  begin
    ExecuteCmd := nil;
    try
      try
        // get class, method name, parameters
        ParseRequest(RestRequest, ClassName, MethodName, Params );
        // get the JSON parameter array
        BuildParamArray(Params, ParamArray);
        // get the content
        if (Content <> nil) and (Length(Content) > 0) then
        begin
          Body := TJSONObject.ParseJSONValue(Content, 0);
          if Body = nil then
          begin
            ParamArray.Free;
            Raise TDSServiceException.Create(SNoJSONValue);
          end;
          if (Body is TJSONObject) and (TJSONObject(Body).Size = 1) and
            (TJSONObject(Body).Get(0).JSonString.Value = PARAMETERS_PAIR) and
            (TJSONObject(Body).Get(0).JsonValue is TJSONArray) then
          begin
            BodyArray := TJSONArray(TJSONObject(Body).Get(0).JsonValue);
            for I := 0 to BodyArray.Size - 1 do
              ParamArray.AddElement(TJSONValue(BodyArray.Get(I).Clone));
            Body.Free;
          end
          else
            ParamArray.AddElement( Body );
        end;
        // build the execute command
        MethodObj := TJSONObject.Create;
        SetMethodNameWithPrefix(RequestType, ClassName, MethodName, DSMethodName);
        MethodObj.AddPair(
               TJSONPair.Create(
                         TJSONString.Create( DSMethodName ),
                         ParamArray ) );

        ExecuteCmd := TJSONArray.Create(TJSONObject.Create(
                                   TJSONPair.Create(
                                              TJSONString.Create(CMD_EXECUTE),
                                                                 MethodObj)));
        // execute JSON request
        ProcessRequest( ExecuteCmd, ResponseHandler );
      except
        on ex: Exception do
        begin
          ResponseHandler.AddCommandError(ex.Message);
        end;
      end;
    finally
      Params.Free;
      ExecuteCmd.Free;
    end;
  end;

procedure TDSRESTService.SetMethodNameWithPrefix(const RequestType, ClassName, MethodName: String;
                                                 out DSMethodName: String);
var
  Prefix: String;
begin
  //prefix method name if it isn't quoted
  if (MethodName[1] <> '"') and (MethodName[1] <> '''') and
     //and if the class isn't one which specifically doesn't support method name prefixing
     (ClassName <> 'DSAdmin') and (ClassName <> 'DSMetadata') then
  begin
    if RequestType = 'PUT' then
      Prefix := 'accept'
    else if RequestType = 'POST' then
      Prefix := 'update'
    else if RequestType = 'DELETE' then
      Prefix := 'cancel';
  end;

  DSMethodName := Format('%s.%s%s', [ClassName, Prefix, MethodName]);
end;

  procedure TDSRESTService.ProcessGETRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler);
  begin
    ProcessREST('GET', Request, nil, ResponseHandler);
  end;

  procedure TDSRESTService.ProcessPOSTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler);
  begin
    if (Content <> nil) and (Length(Content) > 1) and
       not (Content[0] in [91,123]) and (Params <> nil) and (Params.Count = 1) and (Params.names[0] <> EmptyStr) then
      ProcessREST('POST', Request, BytesOf(Params.Values[Params.names[0]]), ResponseHandler)
    else
      ProcessREST('POST', Request, Content, ResponseHandler);
  end;

  procedure TDSRESTService.ProcessPUTRequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler);
  begin
    ProcessREST('PUT', Request, Content, ResponseHandler);
  end;

  procedure TDSRESTService.ProcessDELETERequest(const Request:String; Params: TStrings; Content: TBytes;
                                ResponseHandler: TRequestCommandHandler);
  begin
    ProcessREST('DELETE', Request, nil, ResponseHandler);
  end;

  {TDSJSONService}

  constructor TDSJSONService.Create(dsServerName, dsHostname: string; dsPort: Integer; AuthUser, AuthPassword: String);
  begin
    CreateImpl(dsServerName, dsHostname, dsPort, AuthUser, AuthPassword, '');
  end;
  
  constructor TDSJSONService.CreateImpl(dsServerName, dsHostname: string; dsPort: Integer; AuthUser, AuthPassword, AIPImplementationID: String);
  begin
    inherited Create(dsServerName, dsHostname, dsPort, AuthUser, AuthPassword, AIPImplementationID);
  end;

  destructor TDSJSONService.Destroy;
  begin
    inherited;
  end;

  procedure TDSJSONService.ProcessJSONCommand(Content: TBytes; ResponseHandler: TRequestCommandHandler);
  var
    Cmd: TJSONValue;
  begin
    Cmd := TJSONObject.ParseJSONValue(Content, 0);
    if Cmd = nil then
        Raise TDSServiceException.Create(SNoJSONValue);

    try
      if Cmd is TJSONArray then
        ProcessRequest(TJSONArray(Cmd), ResponseHandler)
      else
        raise TDSServiceException.Create(Format(SJSONArrayExpected, [Cmd.ClassName]));
    finally
      Cmd.Free;
    end;
  end;

  procedure TDSJSONService.ProcessPOSTRequest(const Request: string; Params: TStrings; Content: TBytes; ResponseHandler: TRequestCommandHandler);
  begin
    if (Content <> nil) and (Length(Content) > 0) then
      ProcessJSONCommand(Content, ResponseHandler)
    else
      raise TDSServiceException.Create(Format(SNoJSONCmdContent, ['POST']));
  end;

  procedure TDSJSONService.ProcessGETRequest(const Request: string; Params: TStrings; Content: TBytes; ResponseHandler: TRequestCommandHandler);
  begin
    raise TDSServiceException.Create(Format(SPOSTExpected, ['GET']));
  end;

  procedure TDSJSONService.ProcessPUTRequest(const Request: string; Params: TStrings; Content: TBytes; ResponseHandler: TRequestCommandHandler);
  begin
    raise TDSServiceException.Create(Format(SPOSTExpected, ['PUT']));
  end;

  procedure TDSJSONService.ProcessDELETERequest(const Request: string; Params: TStrings; Content: TBytes; ResponseHandler: TRequestCommandHandler);
  begin
    raise TDSServiceException.Create(Format(SPOSTExpected, ['DELETE']));
  end;

  { TDSSession }

function TDSSession.Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean;
begin
  {If FUserName has not yet been assigned then try to populate it from the connection properties.
   Note that the usefulness of this attempt will depend on the extended implementation of this session.}
  if FUserName = '' then
    FUserName := connectionProps.Values[TDBXPropertyNames.DSAuthenticationUser];

  Result := True;
end;

function TDSSession.Authorize(EventObject: TDSAuthorizeEventObject): boolean;
begin
  Result := True;
end;

procedure TDSSession.CancelScheduledEvent;
begin
  if TDBXScheduler.Instance <> nil then
    TDBXScheduler.Instance.CancelEvent(Id);
end;

constructor TDSSession.Create(const SessionName: string);
begin
  FSessionName := SessionName;
  Create;
end;

constructor TDSSession.Create(const SessionName: string; const AUser: String);
begin
  FUserName := AUser;
  Create(SessionName);
end;

constructor TDSSession.Create;
begin
  FDuration := 0;
  FStatus := Idle;
  FStartDateTime := Now;
  FMetaData := TDictionary<String,String>.Create;
  FMetaObjects := TDictionary<String,TObject>.Create;
  FUserRoles := TStringList.Create;
  FCache := TDSSessionCache.Create;
  MarkActivity;
end;

destructor TDSSession.Destroy;
var
  ObjEnumerator: TDictionary<String, TObject>.TValueEnumerator;
begin
  if TDSSessionManager.GetThreadSession = Self then
     TDSSessionManager.ClearThreadSession;

  ObjEnumerator := FMetaObjects.Values.GetEnumerator;

  try
    while ObjEnumerator.MoveNext do
      try
        ObjEnumerator.Current.Free;
      except
      end;
  finally
    ObjEnumerator.Free
  end;

  FreeAndNil(FMetaObjects);
  FreeAndNil(FMetaData);
  FreeAndNil(FUserRoles);
  FreeAndNil(FCache);

  if LastResultStream <> nil then
    try
      FreeAndNil(FLastResultStream);
    except
    end;

  inherited;
end;

function TDSSession.ElapsedSinceLastActvity: Cardinal;
begin
{$IFNDEF POSIX}
  exit( GetTickCount - FLastActivity );
{$ELSE}
  exit( AbsoluteToNanoseconds(UpTime) div 1000000 - FLastActivity );
{$ENDIF}
end;

function TDSSession.ExpiresIn: Cardinal;
var
  Elapsed: Integer;
begin
  Elapsed := Integer(ElapsedSinceLastActvity);
  if (Elapsed >= LifeDuration) then
    Exit(0);

  Result := LifeDuration - Elapsed;
end;

class function TDSSession.GenerateSessionId: string;
var
  P1, P2, P3: Integer;
begin
  P1 := Random(1000000);
  P2 := Random(1000000);
  P3 := Random(1000000);
  Result := Format('%d.%d.%d', [P1, P2, P3]);
end;

function TDSSession.HasData(Key: String): Boolean;
begin
  Result := FMetaData.ContainsKey(AnsiLowerCase(Key));
end;

function TDSSession.HasObject(Key: String): Boolean;
begin
  Result := FMetaObjects.ContainsKey(AnsiLowerCase(Key));
end;

function TDSSession.GetObject(Key: String): TObject;
begin
  if (FMetaObjects.TryGetValue(AnsiLowerCase(Key), Result)) then
    Exit;

  Result := nil;
end;

function TDSSession.PutObject(Key: String; Value: TObject): Boolean;
begin
  Result := True;
  if not HasObject(Key) then
    FMetaObjects.Add(AnsiLowerCase(Key), Value)
  else
    Exit(False);
end;

function TDSSession.RemoveObject(Key: String; InstanceOwner: Boolean): TObject;
var
  Val: TObject;
begin
  Result := nil;

  if HasObject(Key) then
  begin
    Val := GetObject(Key);
    FMetaObjects.Remove(AnsiLowerCase(Key));

    if InstanceOwner then
      FreeAndNil(Val)
    else
      Result := Val;
  end;
end;

procedure TDSSession.GetAuthRoleInternal(ServerMethod: TDSServerMethod;
  AuthManager: TDSCustomAuthenticationManager; out AuthorizedRoles, DeniedRoles: TStrings);
var
  RoleAuth: TRoleAuth;
  MethodInfo: TDSMethodInfo;
  FreeAuthRole: Boolean;
begin
  AuthorizedRoles := nil;
  DeniedRoles := nil;

  FreeAuthRole := true;
  RoleAuth := nil;
  if (ServerMethod <> nil) and (ServerMethod.MethodInfo <> nil) then
  begin
    MethodInfo := ServerMethod.MethodInfo;
    //Try to find a design time auth role
    if (AuthManager <> nil) and (MethodInfo.DSClassInfo <> nil) then
    begin
      //only compute the design time Role Auth once
      if (MethodInfo.AuthRole = nil) or
         (not TRoleAuth(MethodInfo.AuthRole).IsDesignTime) then
      begin
        RoleAuth := TRoleAuth(AuthManager.GetAuthRole(MethodInfo.DSClassInfo.DSClassName, MethodInfo.DSMethodName));

        if (RoleAuth = nil) and (MethodInfo.AuthRole = nil) then
          // Create an empty roleauth if there isn't one from RTTI or authentication manager
          RoleAuth := TRoleAuth.Create(nil, nil, True);
      end;
    end;

    //if no design-time role found, use the one populated through RTI, if one exists
    if RoleAuth = nil then
    begin
      RoleAuth := TRoleAuth(MethodInfo.AuthRole);
      FreeAuthRole := false;
    end;
  end;

  //copy the string lists being sent back, so users can't modify them,
  //and so the TRoleAuth itself can be freed, unless it was a code attribute.
  if RoleAuth <> nil then
  begin
    if RoleAuth.AuthorizedRoles <> nil then
    begin
      AuthorizedRoles := TStringList.Create;
      AuthorizedRoles.AddStrings(RoleAuth.AuthorizedRoles);
    end;
    if RoleAuth.DeniedRoles <> nil then
    begin
      DeniedRoles := TStringList.Create;
      DeniedRoles.AddStrings(RoleAuth.DeniedRoles);
    end;
  end;

  if FreeAuthRole then
    FreeAndNil(Roleauth);
end;

procedure TDSSession.GetAuthRoles(ServerMethod: TDSServerMethod;
  out AuthorizedRoles, DeniedRoles: TStrings);
begin
  AuthorizedRoles := nil;
  DeniedRoles := nil;
end;

function TDSSession.GetData(Key: String): String;
var
  Value: String;
begin
  if (FMetaData.TryGetValue(AnsiLowerCase(Key), Value)) then
    exit(Value);

  Result := '';
end;

function TDSSession.GetId: NativeInt;
begin
  exit(IntPtr(Pointer(Self)));
end;

function TDSSession.GetSessionStatus: TDSSessionStatus;
begin
  if ((FStatus = TDSSessionStatus.Active) or
         (FStatus = TDSSessionStatus.Idle) or
         (FStatus = TDSSessionStatus.Connected))
       and (FDuration > 0) and IsIdleMS(FDuration) then
  begin
    FStatus := TDSSessionStatus.Expired;
  end;
  Result := FStatus;
end;

procedure TDSSession.Close;
begin
  FStatus := Closed;
end;

procedure TDSSession.Terminate;
begin
  FStatus := Closed;
end;

function TDSSession.IsValid: boolean;
begin
  Result := (Status = TDSSessionStatus.Active) or
            (Status = TDSSessionStatus.Idle) or
            (Status = TDSSessionStatus.Connected);
end;

function TDSSession.IsIdle(Seconds: Cardinal): Boolean;
begin
  Result := IsIdleMS(Seconds * 1000);
end;

function TDSSession.IsIdleMS(Milliseconds: Cardinal): Boolean;
begin
  Result := ElapsedSinceLastActvity > Milliseconds;
end;

procedure TDSSession.MarkActivity;
begin
  FStatus := Active;
{$IFNDEF POSIX}
  FLastActivity := GetTickCount;
{$ELSE}
  FLastActivity := AbsoluteToNanoseconds(UpTime) div 1000000;
{$ENDIF}
end;


procedure TDSSession.PutData(Key, Value: String);
var
  LowerKey: String;
begin
  LowerKey := AnsiLowerCase(Key);
  FMetaData.Remove(LowerKey);
  FMetaData.Add(LowerKey, Value);
end;

procedure TDSSession.RemoveData(Key: String);
begin
  FMetaData.Remove(AnsiLowerCase(Key));
end;

function TDSSession.RequiresAuthorization(MethodInfo: TDSMethodInfo): Boolean;
begin
  Result := (MethodInfo <> nil) and
            (MethodInfo.MethodAlias <> 'DSMetadata.GetDatabase') and
             //GetPlatformName is often used to validate a connection, we will allow this call by anyone
            (MethodInfo.MethodAlias <> 'DSAdmin.GetPlatformName');
end;

procedure TDSSession.TerminateInactiveSession;
begin
  if (FDuration > 0) and (IsIdleMS(FDuration)) then
  begin
    try
      TerminateSession;
      TDSSessionManager.Instance.TerminateSession(SessionName);
    except
    end;
  end
  else
    ScheduleInactiveTerminationEvent;
end;


procedure TDSSession.ScheduleInactiveTerminationEvent;
begin
  if FDuration > 0 then
    ScheduleUserEvent(TerminateInactiveSession, FDuration);
end;

procedure TDSSession.ScheduleTerminationEvent;
begin
  if FDuration > 0 then
    ScheduleUserEvent(TerminateSession, FDuration);
end;

procedure TDSSession.ScheduleUserEvent(Event: TDBXScheduleEvent; ElapsedTime: Integer);
begin
  if TDBXScheduler.Instance <> nil then
    TDBXScheduler.Instance.AddEvent(Id, Event, ElapsedTime);
end;

procedure TDSSession.SetSessionName(const sessionId: String);
begin
  FSessionName := sessionId;
end;

procedure TDSSession.SetUserName(const userName: String);
begin
  FUserName := userName;
end;

procedure TDSSession.TerminateSession;
begin
  FStatus := Terminated;
end;

{ TDSRequestFilter<T> }

constructor TDSRequestFilter<T>.Create(const TypeName: String);
begin
  FTypeName := TypeName;
end;

destructor TDSRequestFilter<T>.Destroy;
begin

  inherited;
end;

function TDSRequestFilter<T>.HasParameter(const ParamName: String): boolean;
begin
  exit(false);
end;

function TDSRequestFilter<T>.SetParameterValue(ParamName,
  ParamValue: String): boolean;
begin
  Result := false;
end;

{ TDBXRequestFilterFactory }

class procedure TDBXRequestFilterFactory.CleanUp;
begin
  FreeAndNil( FInstance );
end;

constructor TDBXRequestFilterFactory.Create;
begin
  FRepo := TDBXRequestFilterDictionary.Create([doOwnsValues]);
end;

function TDBXRequestFilterFactory.RequestFilter(
  Name: String): TDBXRequestFilter;
begin
  if FRepo.ContainsKey(Name) then
    FRepo.TryGetValue(Name, Result)
  else
    Result := nil
end;

destructor TDBXRequestFilterFactory.Destroy;
begin
  FreeAndNil( FRepo );
  inherited;
end;

procedure TDBXRequestFilterFactory.GetAllWithField(FieldName: String;
  List: TObjectList<TDBXRequestFilter>);
var
  Itr: TDBXRequestFilterDictionary.TValueEnumerator;
  DC: TDBXRequestFilter;
begin
  Itr := FRepo.Values.GetEnumerator;
  try
    while Itr.MoveNext do
    begin
      DC := Itr.Current;
      if DC.HasParameter(FieldName) then
        List.Add(DC);
    end;
  finally
    Itr.Free;
  end;
end;

procedure TDBXRequestFilterFactory.RegisterRequestFilter(
  Converter: TDBXRequestFilter);
begin
  FRepo.Add(Converter.TypeName, Converter);
end;

class procedure TDBXRequestFilterFactory.SetUp;
begin
  FInstance := TDBXRequestFilterFactory.Create;
end;

{ TDBXCropDataConverter }

constructor TDBXCropRequestFilter.Create(const TypeName: String);
begin
  inherited Create(TypeName);
  FOff := 0;
  FCount := MaxInt;
end;

constructor TDBXCropRequestFilter.Create(const TypeName: String; Off,
  Count: Integer);
begin
  inherited Create(TypeName);
  FOff := Off;
  FCount := Count;
end;

destructor TDBXCropRequestFilter.Destroy;
begin
  inherited;
end;

function TDBXCropRequestFilter.HasParameter(
  const ParamName: String): boolean;
begin
  if (AnsiCompareText(ParamName, 'o') = 0) or (AnsiCompareText(ParamName, 'c') = 0)
     or (AnsiCompareText(ParamName, 'r') = 0) then
    exit(true);
  Result := inherited;
end;

function TDBXCropRequestFilter.SetParameterValue(ParamName,
  ParamValue: String): boolean;
var
  RangeSep : Integer;
begin
  if AnsiCompareText(ParamName, 'o') = 0 then
    FOff := StrToInt(ParamValue)
  else if AnsiCompareText(ParamName, 'c') = 0 then
    FCount := StrToInt(ParamValue)
  {If the 'r' field is used then the user is providing a pair of integers, separated by a comma.
   Before the comma is the offset for the substring, and the number after the comma is the count
   of how many character after the offset to include in the substring (the length.)}
  else if AnsiCompareText(ParamName, 'r') = 0 then
  begin
    RangeSep := Pos(',', ParamValue);
    if ( RangeSep > 1 ) and ( RangeSep < Length( ParamValue ) ) then
    begin
      FOff := StrToInt(Copy(ParamValue, 1, RangeSep - 1));
      FCount := StrToInt(Copy(ParamValue, RangeSep + 1, Length(ParamValue) - RangeSep));
    end
    else
      exit(false);
  end
  else
    exit(false);
  exit(true);
end;

{ TDBXSubStringDataConverter }

function TDBXSubStringRequestFilter.Clone: TDBXRequestFilter;
begin
  Result := TDBXSubStringRequestFilter.Create(TypeName, Off, Count);
end;

function TDBXSubStringRequestFilter.CanConvert(Value: TDBXValue): boolean;
begin
  case Value.ValueType.DataType of
    {Implementation for Strings}
    TDBXDataTypes.AnsiStringType, TDBXDataTypes.WideStringType,
    {Implementation for Streams}
    TDBXDataTypes.BlobType, TDBXDataTypes.BinaryBlobType:
      exit(true);
    else
      exit(false);
  end;
end;

function TDBXSubStringRequestFilter.ToJSON(Value: TDBXValue; IsLocal: boolean): TJSONValue;
begin
  case Value.ValueType.DataType of
    TDBXDataTypes.BlobType, TDBXDataTypes.BinaryBlobType:
      Result := TDBXJSONTools.streamToJSON(Value.GetStream(False), Off, Count);
    else
      Result := TJSONString.Create(Copy(Value.AsString, Off + 1, Count));
  end;
end;

{ TDBXReaderDataConverter }

function TDBXReaderRequestFilter.CanConvert(Value: TDBXValue): boolean;
begin
  Result := Value.ValueType.DataType = TDBXDataTypes.TableType;
end;

function TDBXReaderRequestFilter.Clone: TDBXRequestFilter;
begin
  Result := TDBXReaderRequestFilter.Create(TypeName, Off, Count);
end;

function TDBXReaderRequestFilter.ToJSON(Value: TDBXValue; IsLocal: boolean): TJSONValue;
var
  DBXReader: TDBXReader;
  RowCount: Integer;
begin
  DBXReader := Value.GetDBXReader;
  RowCount := Off;
  while RowCount > 0 do
  begin
    DBXReader.Next;
    Dec(RowCount);
  end;
  Result := TDBXJSONTools.TableToJSON(DBXReader, Count, IsLocal);
end;

{ TDSSessionManager }

procedure TDSSessionManager.CloseSession(session: TDSSession);
begin
  try
    if Assigned(session) then
    begin
      // Session should have been removed from the list by now
      Assert(GetSession(session.SessionName) = nil);
      if TDBXScheduler.Instance <> nil then
        TDBXScheduler.Instance.CancelEvent(session.Id);

      NotifyEvents(session, SessionClose);

      session.Close;
    end
  finally
    session.Free;
  end;
end;

procedure TDSSessionManager.AddSessionEvent(Event: TDSSessionEvent);
begin
  if not Assigned(FListeners) then
    FListeners := TList<TDSSessionEvent>.Create;

  System.TMonitor.Enter(FListeners);
  try
    if not FListeners.Contains(Event) then
      FListeners.Add(Event);
  finally
    System.TMonitor.Exit(FListeners);
  end;
end;

function TDSSessionManager.RemoveSessionEvent(Event: TDSSessionEvent): boolean;
begin
  if Assigned(FListeners) then
  begin
    System.TMonitor.Enter(FListeners);
    try
      exit(FListeners.Remove(Event) > -1);
    finally
      System.TMonitor.Exit(FListeners);
    end;
  end;
  Result := False;
end;

class procedure TDSSessionManager.SetAsThreadSession(Session: TDSSession);
begin
  VDSSession := Session;
end;

class procedure TDSSessionManager.ClearThreadSession;
begin
  VDSSession := nil;
end;

procedure TDSSessionManager.CloseSession(SessionId: string);
var
 session: TDSSession;
begin
  session := RemoveSession(SessionId);
  if Assigned(session) then
    CloseSession(session);
end;

constructor TDSSessionManager.Create;
begin
  FSessionContainer := TDictionary<String, TDSSession>.Create;
end;

function TDSSessionManager.CreateSession<T>(factory: TFactoryMethod; userName: String): T;
begin
  Result := CreateSession<T>(factory, False);
  Result.SetUserName(userName);

  NotifyEvents(Result, SessionCreate);
end;

function TDSSessionManager.CreateSession<T>(factory: TFactoryMethod; DoNotify: Boolean): T;
var
  sessionId: String;
begin
  TMonitor.Enter(self);
  try
    sessionId := GetUniqueSessionId;
    Result := T(factory);
    Result.SetSessionName(sessionId);
    FSessionContainer.Add(sessionId, Result);
  finally
    TMonitor.Exit(self);
  end;

  if DoNotify then
    NotifyEvents(Result, SessionCreate);
end;

destructor TDSSessionManager.Destroy;
var
  keys: TStrings;
  key: String;
begin
  keys := TStringList.Create;

  try
    GetOpenSessionKeys(keys);

    for key in keys do
    begin
      TerminateSession(key);
    end;
  finally
    FInstance := nil;
    FreeAndNil(FListeners);
    FreeAndNil(FSessionContainer);
    FreeAndNil(keys);

    inherited;
  end;
end;

procedure TDSSessionManager.GetOpenSessionKeys(Container: TStrings);
begin
  Synchronized(self, procedure
  var
      keyEnumerator: TDictionary<String, TDSSession>.TKeyEnumerator;
  begin
      keyEnumerator := FSessionContainer.Keys.GetEnumerator;
      while keyEnumerator.MoveNext do
        Container.Add(keyEnumerator.Current);
      keyEnumerator.Free
  end);
end;

procedure TDSSessionManager.GetOpenSessionKeys(Container: TStrings; ACreator: TObject);
begin
  Synchronized(self, procedure
  var
      valueEnumerator: TDictionary<String, TDSSession>.TValueEnumerator;
  begin
      valueEnumerator := FSessionContainer.Values.GetEnumerator;
      while valueEnumerator.MoveNext do
        if valueEnumerator.Current.ObjectCreator = ACreator then
          Container.Add(valueEnumerator.Current.SessionName);
      valueEnumerator.Free
  end);
end;

function TDSSessionManager.GetSession(SessionId: string): TDSSession;
begin
  TMonitor.Enter(self);
  try
    FSessionContainer.TryGetValue(SessionId, Result);
  finally
    TMonitor.Exit(self);
  end;
end;

function TDSSessionManager.GetSessionCount: Integer;
var
  Count: Integer;
begin
  Synchronized(Self, procedure begin
    Count := FSessionContainer.Count;
  end);
  Result := Count;
end;

class function TDSSessionManager.GetThreadSession: TDSSession;
begin
  Result := VDSSession;
end;

function TDSSessionManager.GetTunnelSession(
  SessionId: string): TDSTunnelSession;
var
  session: TDSSession;
begin
  session := GetSession(SessionId);
  if (session <> nil) and (session is TDSTunnelSession) then
    Result := TDSTunnelSession(session)
  else
    Result := nil;
end;

function TDSSessionManager.GetUniqueSessionId: string;
begin
  // assumes the container is thread secure
  repeat
    Result := TDSSession.GenerateSessionId
  until not FSessionContainer.ContainsKey(Result);
end;

procedure TDSSessionManager.NotifyEvents(session: TDSSession; EventType: TDSSessionEventType);
var
  Event: TDSSessionEvent;
  I, Count: Integer;
  LListeners: TList<TDSSessionEvent>;
begin
  if Assigned(FListeners) then
  begin
    System.TMonitor.Enter(Self);
    try
      LListeners := TList<TDSSessionEvent>.Create;

      //copy the events into a new list, so the FListeners
      //doesn't need to remain locked while calling each event.
      //this prevents deadlocks if events try to remove themselves, for example
      System.TMonitor.Enter(FListeners);
      try
        Count := FListeners.Count - 1;
        for I := 0 to Count do
          LListeners.Add(FListeners.Items[I]);
      finally
        System.TMonitor.Exit(FListeners);
      end;

      try
        Count := LListeners.Count - 1;
        for I := Count downto 0 do
        begin
          Event := LListeners.Items[I];
          try
            if FListeners.Contains(Event) then
              Event(Self, EventType, session);
          except
          end;
        end;
      finally
        FreeAndNil(LListeners);
      end;
    finally
      System.TMonitor.Exit(Self);
    end;
  end;
end;

function TDSSessionManager.RemoveSession(SessionId: string): TDSSession;
var
  session: TDSSession;
begin
  session := nil;
  Synchronized(self, procedure begin
    FSessionContainer.TryGetValue(SessionId, session);
    if session <> nil then
      FSessionContainer.Remove(SessionId);
  end);
  Result := session;
end;

procedure TDSSessionManager.TerminateAllSessions(const ACreator: TObject; AAllSessions: Boolean);
var
  LList: TList<TDSSession>;
  LSession: TDSSession;
begin
  LList := TList<TDSSession>.Create;
  try
    ForEachSession(procedure(const Session: TDSSession) begin
      if AAllSessions or (Session.ObjectCreator = ACreator) then
        LList.Add(RemoveSession(Session.SessionName));
    end);
    for LSession in LList do
      TerminateSession(LSession);
  finally
    LList.Free;
  end;
end;

procedure TDSSessionManager.TerminateAllSessions(const ACreator: TObject);
begin
  TerminateAllSessions(ACreator, False);
end;

procedure TDSSessionManager.TerminateAllSessions;
begin
  TerminateAllSessions(nil, True);
end;

procedure TDSSessionManager.ForEachSession(AVisitor: TDSSessionVisitor);
begin
  Synchronized(self, procedure
  var
    valEnumerator: TDictionary<String, TDSSession>.TValueEnumerator;
  begin
    valEnumerator := FSessionContainer.Values.GetEnumerator;
    try
      while valEnumerator.MoveNext do
        AVisitor(valEnumerator.Current);
    finally
      valEnumerator.Free
    end;
  end);
end;

procedure TDSSessionManager.TerminateSession(session: TDSSession);
begin
  try
    if Assigned(session) then
    begin
      // Session should have been removed from the list by now
      Assert(GetSession(session.SessionName) = nil);
      if TDBXScheduler.Instance <> nil then
        TDBXScheduler.Instance.CancelEvent(session.Id);
      session.Terminate;
      NotifyEvents(session, SessionClose);
    end;
  finally
    session.Free;
  end;
end;

procedure TDSSessionManager.TerminateSession(const sessionId: String);
var
  session: TDSSession;
begin
  session := RemoveSession(sessionId);
  if Assigned(session) then
    TerminateSession(session);
end;

{ TDSAuthSession }

procedure TDSAuthSession.GetAuthRoles(ServerMethod: TDSServerMethod;
   out AuthorizedRoles, DeniedRoles: TStrings);
begin
  AuthorizedRoles := nil;
  DeniedRoles := nil;
  if (ServerMethod <> nil) and (ServerMethod.MethodInfo <> nil) then
    if (FAuthManager <> nil) then
      GetAuthRoleInternal(ServerMethod, FAuthManager, AuthorizedRoles, DeniedRoles);
end;

function TDSAuthSession.Authorize(EventObject: TDSAuthorizeEventObject): boolean;
begin
  if (FAuthManager <> nil) then
  begin
    exit(FAuthManager.Authorize(EventObject))
  end;

  exit(True); //return true if no authentication manager is set
end;

{ TDSRESTSession }

function TDSRESTSession.Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean;
begin
  Inherited;

  exit(True); //currently, authentication will be done elsewhere for REST
end;

constructor TDSRESTSession.Create(AAuthManager: TDSCustomAuthenticationManager);
begin
  FAuthManager := AAuthManager;
  Inherited Create;
end;

{ TDSSessionCache }

function TDSSessionCache.AddItem(Item: TResultCommandHandler): Integer;
var
  LargestId: Integer;
  Id: Integer;
begin
  if (Item = nil) then
    exit(-1);

  TMonitor.Enter(FItems);
  try
    LargestId := -1;
    for Id in FItems.Keys do
    begin
      if FItems.Items[Id] = Item then
        exit(Id);

      if (Id > LargestId) then
        LargestId := Id;
    end;

    Id := LargestId + 1;

    FItems.Add(Id, Item);

    Result := Id;
  finally
    TMonitor.Exit(FItems);
  end;
end;

procedure TDSSessionCache.ClearAllItems(InstanceOwner: Boolean);
var
  Item: TResultCommandHandler;
begin
  if Assigned(FItems) then
  begin
    TMonitor.Enter(FItems);
    try
      if InstanceOwner then
      begin
        for Item in FItems.Values do
          try
            Item.Free;
          except
          end;
      end;
      FItems.Clear;
    finally
      TMonitor.Exit(FItems);
    end;
  end;
end;

constructor TDSSessionCache.Create;
begin
  FItems := TDictionary<Integer, TResultCommandHandler>.Create;
end;

destructor TDSSessionCache.Destroy;
begin
  ClearAllItems(True);
  FreeAndNil(FItems);
  inherited;
end;

function TDSSessionCache.GetItem(ID: Integer): TResultCommandHandler;
var
  Item: TResultCommandHandler;
begin
  Result := nil;
  if FItems.TryGetValue(ID, Item) then
  begin
    Result := Item;
  end;
end;

function TDSSessionCache.GetItemID(Item: TResultCommandHandler): Integer;
var
  Id: Integer;
begin
  Result := -1;
  if (Item <> nil) and Assigned(FItems) then
  begin
    TMonitor.Enter(FItems);
    try
      for Id in FItems.Keys do
      begin
        if FItems.Items[Id] = Item then
          exit(Id);
      end;
    finally
      TMonitor.Exit(FItems);
    end;
  end;
end;

function TDSSessionCache.GetItemIDs: TDSSessionCacheKeys;
var
  Key: Integer;
begin
  Result := TDSSessionCacheKeys.Create;

  TMonitor.Enter(FItems);
  try
    for Key in FItems.Keys do
      Result.Add(Key);
  finally
    TMonitor.Exit(FItems);
    Result.Sort;
  end;
end;

procedure TDSSessionCache.RemoveItem(Item: TResultCommandHandler);
var
  Val: TResultCommandHandler;
  I: Integer;
  IndexToRemove: Integer;
begin
  if (Item = nil) or not Assigned(FItems) then
    Exit;

  IndexToRemove := -1;

  TMonitor.Enter(FItems);
  try
    for I in FItems.Keys do
    begin
      Val := FItems.Items[I];
      if Val = Item then
      begin
        IndexToRemove := I;
      end;
    end;

    if (IndexToRemove > -1) then
      RemoveItem(IndexToRemove, False);
  finally
    TMonitor.Exit(FItems);
  end;
end;

function TDSSessionCache.RemoveItem(ID: Integer; InstanceOwner: Boolean): TResultCommandHandler;
var
  Item: TResultCommandHandler;
begin
  Result := nil;

  TMonitor.Enter(FItems);
  try
    if FItems.TryGetValue(ID, Item) then
    begin
      FItems.Remove(ID);

      if InstanceOwner then
        Item.Free
      else
        Result := Item;
    end;
  finally
    TMonitor.Exit(FItems);
  end;
end;

{ TDSRequestFilterManager }

procedure TDSRequestFilterManager.FiltersForCriteria(const TypeName: string; const Range: TParamRange;
                                                     const OnResult: boolean; out List: TObjectList<TDBXRequestFilter>);
var
  itr: TObjectDictionary<String, TDBXRequestFilter>.TValueEnumerator;
begin
  itr := FRequestFilterStore.Values.GetEnumerator;
  try
    while itr.MoveNext do
      if (itr.Current.TypeName = TypeName) and
          (((itr.Current.Range * Range) <> []) or (itr.Current.OnResult = OnResult)) then
        List.Add(itr.Current); // add it
  finally
    itr.Free;
  end;
end;

function TDSRequestFilterManager.CheckConvertersForConsistency: boolean;
var
  itr: TObjectDictionary<String, TDBXRequestFilter>.TValueEnumerator;
  Range: TParamRange;
  OnResult: boolean;
begin
  Range := [];
  OnResult := false;
  itr := FRequestFilterStore.Values.GetEnumerator;
  try
    while itr.MoveNext do
    begin
      if ((itr.Current.Range * Range) <> []) or (OnResult and (itr.Current.OnResult = OnResult)) then
        exit(false);
      Range := Range + itr.Current.Range;
      OnResult := OnResult or itr.Current.OnResult;
    end;
    Result := true;
  finally
    itr.Free;
  end;
end;

constructor TDSRequestFilterManager.Create;
begin
  FRequestFilterStore := TDBXRequestFilterDictionary.Create([doOwnsValues]);
end;

destructor TDSRequestFilterManager.Destroy;
begin
  FRequestFilterStore.Free;
  inherited;
end;

procedure TDSRequestFilterManager.FiltersForCriteria(const Range: TParamRange; const OnResult: boolean;
                                                     out List: TObjectList<TDBXRequestFilter>);
var
  itr: TObjectDictionary<String, TDBXRequestFilter>.TValueEnumerator;
begin
  itr := FRequestFilterStore.Values.GetEnumerator;
  try
    while itr.MoveNext do
      if ((itr.Current.Range * Range) <> []) or (OnResult and itr.Current.OnResult) then
        List.Add(itr.Current); // add it
  finally
    itr.Free;
  end;
end;

class procedure TDSRequestFilterManager.ParseParamName(const PName: string; out DCName, DCType, FieldName: string;
                                                       out Range: TParamRange; out OnResult: boolean);
var
  TokenIndex: Integer;
  RangeIndex: Integer;
  LowIdx: Integer;
  RangeStarted: boolean;

  procedure FillRange(Low: Integer; Hi: Integer; var Range: TParamRange);
  begin
    while Low <= Hi do
    begin
      Range := Range + [Low];
      Inc(Low);
    end;
  end;
  procedure AddRange;
  begin
    if TokenIndex < RangeIndex then
    begin
      if not RangeStarted then
        Range := Range + [ StrToInt(Copy(DCName, TokenIndex, RangeIndex - TokenIndex)) ]
      else
      begin
        FillRange(LowIdx, StrToInt(Copy(DCName, TokenIndex, RangeIndex - TokenIndex)), Range);
        RangeStarted := false;
      end;
      TokenIndex := RangeIndex + 1;
      LowIdx := 0;
    end
    else
      raise Exception.Create(Format(SBadParamName, [PName]));
  end;
begin
  // look for dot and extract the DC name
  TokenIndex := Pos('.', PName);
  if TokenIndex = 0 then
    DCName := EmptyStr
  else
    DCName := Copy(PName, 1, TokenIndex - 1);

  // field name follows the .
  FieldName := Copy(PName, TokenIndex + 1, Length(PName) - TokenIndex);

  // look for range
  if DCName <> EmptyStr then
  begin
    RangeIndex := 1;
    while (RangeIndex <= Length(DCName)) and not CharInSet(DCName[RangeIndex], ['0'..'9','-',',']) do
      Inc(RangeIndex);
    DCType := Copy(DCName, 1, RangeIndex- 1);

    // check for range
    Range := [];
    if RangeIndex <= Length(DCName) then
    begin
      OnResult := false;
      TokenIndex := RangeIndex;
      RangeStarted := false;
      while RangeIndex <= Length(DCName) do
      begin
        if DCName[RangeIndex] = ',' then
        begin
          // consume <nb>, pattern
          AddRange;
        end
        else if DCName[RangeIndex] = '-' then
        begin
          // consume <nb>-<nb> pattern
          if TokenIndex < RangeIndex then
            LowIdx := StrToInt(Copy(DCName, TokenIndex, RangeIndex - TokenIndex))
          else
            LowIdx := 0;
          TokenIndex := RangeIndex + 1;
          RangeStarted := true;
        end;
        Inc(RangeIndex);
      end;
      AddRange;
    end
    else
      OnResult := true
  end
  else
    OnResult := true;
end;

function TDSRequestFilterManager.ProcessQueryParameter(const ParamName, ParamValue: String): boolean;
var
  DCName, DCType, FieldName: string;
  Range: TParamRange;
  OnResult: boolean;
  DBXConverter: TDBXRequestFilter;
  DBXConverterList, CurrentList: TObjectList<TDBXRequestFilter>;
  I, J: Integer;

  function SetupDCParam: boolean;
  begin
    DBXConverter.Range := Range;
    DBXConverter.OnResult := OnResult;
    Result := DBXConverter.SetParameterValue(FieldName, ParamValue);
  end;


begin
  if ParamName = EmptyStr then
    exit(true); // skip empty parameters

  {handle the json parameter, which is a flag saying if streams should be passed back as json arrays}
  if 'json' = AnsiLowerCase(ParamName) then
  begin
    FStreamAsJSON := StrToBool(ParamValue);
    exit(true);
  end;

  // get the DC name
  ParseParamName(ParamName, DCName, DCType, FieldName, Range, OnResult);
  if DCType = EmptyStr then
  begin
    // iterate through all DC and pick the ones with given parameter
    DBXConverterList := TObjectList<TDBXRequestFilter>.Create(false);
    try
      TDBXRequestFilterFactory.Instance.GetAllWithField(FieldName, DBXConverterList);
      Result := True;
      for I := 0 to DBXConverterList.Count - 1 do
      begin
        DBXConverter := DBXConverterList.Items[I];
        // join with the existing converters
        CurrentList := TObjectList<TDBXRequestFilter>.Create;
        try
          FiltersForCriteria(DBXConverter.TypeName, Range, OnResult, CurrentList);
          if CurrentList.Count > 0 then
          begin
            for J := 0 to CurrentList.Count - 1 do
            begin
              DBXConverter := CurrentList.Items[J];
              if not DBXConverter.SetParameterValue(FieldName, ParamValue) then
                Result := false;
            end;
          end
          else
          begin
            // add new one
            DBXConverter := DBXConverter.Clone;
            DBXConverter.Name := DBXConverter.TypeName;
            if SetupDCParam then
              FRequestFilterStore.Add(DBXConverter.TypeName, DBXConverter)
            else
              Result := false
          end;
        finally
          CurrentList.Free;
        end;
      end;
    finally
      DBXConverterList.Free;
    end;
  end
  else
  begin
    if FRequestFilterStore.ContainsKey(DCName) then
      FRequestFilterStore.TryGetValue(DCName, DBXConverter)
    else
    begin
      DBXConverter := TDBXRequestFilterFactory.Instance.RequestFilter(DCType);
      if (DBXConverter = nil) or not DBXConverter.HasParameter(FieldName) then
        exit(True); //the query parameter wasn't a request filter. return true

      DBXConverter := DBXConverter.Clone;
      DBXConverter.Name := DCName;
      FRequestFilterStore.Add(DCName, DBXConverter);
    end;

    Result := SetupDCParam;
  end;
end;

{ TDSTCPSession }

function TDSTCPSession.Authenticate(const AuthenticateEventObject: TDSAuthenticateEventObject; connectionProps: TDBXProperties): boolean;
begin
  Inherited;

  if FAuthManager <> nil then
    exit(FAuthManager.Authenticate(AuthenticateEventObject, connectionProps));

  exit(True);
end;

constructor TDSTCPSession.Create(AAuthManager: TObject);
begin
  Create(TDSCustomAuthenticationManager(AAuthManager));
end;

constructor TDSTCPSession.Create(AAuthManager: TDSCustomAuthenticationManager);
begin
  FAuthManager := AAuthManager;
  Inherited Create;
end;

initialization
    Randomize;

    TDBXRequestFilterFactory.SetUp;
    TDBXRequestFilterFactory.Instance.RegisterRequestFilter(TDBXSubStringRequestFilter.Create('ss'));
    TDBXRequestFilterFactory.Instance.RegisterRequestFilter(TDBXReaderRequestFilter.Create('t'));

    TDSSessionManager.FInstance := TDSSessionManager.Create;

finalization
    TDBXRequestFilterFactory.CleanUp;

    TDSSessionManager.FInstance.Free;
end.



