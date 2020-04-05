{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSClientRest;

interface

uses
  System.Classes,
  System.Contnrs,
  Data.DB,
  Data.DBXCommon,
  Data.DBXJSON,
  Data.DBXJSONReflect,
  Datasnap.DSCommonProxy,
  Datasnap.DSHTTP,
  System.Generics.Collections,
  System.SysUtils;

type
  ///<summary>
  ///  Provides information about a server method parameter type or return type needed by
  ///  TDSRestCommand
  ///</summary>
  TDSRestParameterMetaData = record
  ///<summary>
  ///  Name of the parameter or blank if a return type.
  ///</summary>
    Name: string;
  ///<summary>
  ///  Direction of the parameter or return type.  See TDBXParameterDirections.
  ///</summary>
    Direction: Integer;
  ///<summary>
  ///  Parameter type or return type.  See TDBXDataTypes.
  ///</summary>
    DBXType: Integer;
  ///<summary>
  ///  Parameter or return type name.
  ///</summary>
    TypeName: string;
  end;

  ///<summary>
  ///  Stores login information on behalf of TDSCustomRestConnection and TDSRestLoginEvent
  ///</summary>
  TDSRestLoginProperties = class(TPersistent)
  protected
  ///<summary>
  ///  Copies login information to another instance
  ///</summary>
    procedure AssignTo(Dest: TPersistent); override;
  public
  ///<summary>
  ///  Username or blank.
  ///</summary>
    UserName: string;
  ///<summary>
  ///  Password or blank.
  ///</summary>
    Password: string;
  ///<summary>
  ///  Indicates whether the user should be prompted for the username and password when connecting
  ///</summary>
    LoginPrompt: Boolean;
  end;

  TDSRestCommand = class;
  ///<summary>
  ///  Declares the event procedure that can provide the username and password when connecting
  ///</summary>
  TDSRestLoginEvent = procedure(Sender: TObject; LoginProperties: TDSRestLoginProperties; var Cancel: Boolean) of object;

  ///<summary>
  ///  Possible values for the TDSTextConnectionOptions
  ///</summary>
  TDSTestConnectionOption = (toNoLoginPrompt);
  ///<summary>
  ///  Options to control the behavior of the TDSCustomRestConnection.TestConnection method
  ///</summary>
  TDSTestConnectionOptions = set of TDSTestConnectionOption;

  ///<summary>
  ///  RestConnection component with no published properties.
  ///</summary>
  TDSCustomRestConnection = class(TComponent)
  strict private
    FProtocol: string;
    FHost: string;
    FPort: Integer;
    FUrlPath: string;
    FUserName: string;
    FPassword: string;
    FUniqueID: string;
    FContext: string;
    FLoginProperties: TDSRestLoginProperties;
    FHTTP: TDSHTTP;
    FSessionID: string;
    FProxyHost: string;
    FProxyPort: Integer;
    FProxyUsername: string;
    FProxyPassword: string;
    FIPImplementationID: string;
    FConnectionKeepAlive: string;
  private
    FLoginPrompt: Boolean;
    FOnLogin: TDSRestLoginEvent;
    FOnValidateCertificate: TValidateCertificate;
    FBeforeExecute: TNotifyEvent;
    FAfterExecute: TNotifyEvent;
    FPreserveSessionID: Boolean;
    procedure ReadUniqueId(Reader: TReader);
    procedure WriteUniqueId(Writer: TWriter);
    function GetPassword: string;
    function GetUserName: string;
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetLoginPrompt(const Value: Boolean);
    function GetLoginPrompt: Boolean;
    procedure LoginDialogTestConnection;
    procedure SetContext(const Value: string);
    function GetHTTP: TDSHTTP;
    function GetOnValidatePeerCertificate: TValidateCertificate;
    procedure SetOnValidatePeerCertificate(const Value: TValidateCertificate);
    procedure SetProtocol(const Value: string);
  protected
    function Login: Boolean; virtual;
    procedure BeforeExecute; virtual;
    procedure AfterExecute; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure AssignTo(Dest: TPersistent); override;
    procedure SessionExpired; virtual;
    procedure SetConnection(const KeepAlive: String); virtual;
    function GetConnection: String; virtual;
    function GetProxyHost: String; virtual;
    procedure SetProxyHost(const Value: String); virtual;
    function GetProxyPort: Integer; virtual;
    procedure SetProxyPort(const Value: Integer);
    function GetProxyUsername: String; virtual;
    procedure SetProxyUsername(const Value: String); virtual;
    function GetProxyPassword: String; virtual;
    procedure SetProxyPassword(const Value: String); virtual;
    function GetIPImplementationID: string; virtual;
    procedure SetIPImplementationID(const Value: string); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure TestConnection(AOptions: TDSTestConnectionOptions = []);
    function CreateCommand: TDSRestCommand;
    function DefaultProtocol: string;
    procedure Reset;
    property Protocol: string read FProtocol write SetProtocol;
    property Host: string read FHost write FHost;
    property Port: Integer read FPort write FPort;
    property UrlPath: string read FUrlPath write FUrlPath;
    property Context: string read FContext write SetContext;
    property UserName: string read GetUserName write SetUserName;
    property Password: string read GetPassword write SetPassword;
    property UniqueID: string read FUniqueID write FUniqueID;
    property LoginPrompt: Boolean read GetLoginPrompt write SetLoginPrompt default True;
    property OnLogin: TDSRestLoginEvent read FOnLogin write FOnLogin;
    property SessionID: string read FSessionID write FSessionID;
    property LoginProperties: TDSRestLoginProperties read FLoginProperties;
    property PreserveSessionID: Boolean read FPreserveSessionID write FPreserveSessionID default True;
    property OnValidatePeerCertificate: TValidateCertificate read GetOnValidatePeerCertificate write SetOnValidatePeerCertificate;
    property OnBeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property OnAfterExecute: TNotifyEvent read FAfterExecute write FAfterExecute;
    property HTTP: TDSHTTP read GetHTTP;
    property Connection: String read GetConnection write SetConnection;
    property ProxyHost: String read GetProxyHost write SetProxyHost;
    property ProxyPort: Integer read GetProxyPort write SetProxyPort default 8888;
    property ProxyUsername: String read GetProxyUsername write SetProxyUsername;
    property ProxyPassword: String read GetProxyPassword write SetProxyPassword;
    property IPImplementationID: string read GetIPImplementationID write SetIPImplementationID;
  end;

  ///<summary>
  ///  RestConnection component with with published properties.
  ///</summary>
  TDSRestConnection = class(TDSCustomRestConnection)
  published
    property Protocol;
    property Host;
    property Port;
    property UrlPath;
    property Context;
    property UserName;
    property Password;
    property LoginPrompt;
    property PreserveSessionID;
    property Connection;
    property ProxyHost;
    property ProxyPort;
    property ProxyUsername;
    property ProxyPassword;
    property OnLogin;
    property OnValidatePeerCertificate;
    property OnBeforeExecute;
    property OnAfterExecute;
    property IPImplementationID;
  end;

  TDSRestParameterMetaDataArray = array of TDSRestParameterMetaData;

  TDSRestCommand = class
  strict private
    FDBXContext: TDBXContext;
    FConnection: TDSCustomRestConnection;
    FText: string;
    FParameters: TDBXParameterList;
    FRequestType: string;
    FFreeOnExecuteList: TObjectList;
    function CreateParameters(AMetaData: array of TDSRestParameterMetaData): TDBXParameterList;
  private
    procedure AfterExecute;
    procedure BeforeExecute;
    function BuildParameterMetaDataArray: TArray<TDSRestParameterMetaData>; overload;
    function BuildParameterMetaDataArray(AProxyMetaData: TDSProxyMetadata): TArray<TDSRestParameterMetaData>; overload;
    function DetermineRequestType(
      AMetaData: array of TDSRestParameterMetaData): string;
  public
    constructor Create(AConnection: TDSCustomRestConnection);
    destructor Destroy; override;
    procedure Prepare(AMetaData: array of TDSRestParameterMetaData); overload;
    procedure Prepare(AProxyMetaData: TDSProxyMetadata); overload;
    procedure Prepare; overload;
    procedure Execute(const ARequestFilter: string = '');
    procedure ExecuteCache(const ARequestFilter: string = '');
    property Text: string read FText write FText;
    property Parameters: TDBXParameterList read FParameters;
    property RequestType: string read FRequestType write FRequestType;
    property Connection: TDSCustomRestConnection read FConnection;
    function GetJSONMarshaler: TJSONMarshal;
    function GetJSONUnMarshaler: TJSONUnMarshal;
    procedure FreeOnExecute(Value: TObject);
  end;

  TDSRestResponseStreamProc = reference to procedure(AStream: TStream; const AResponseCharSet: string; var AOwnsStream: Boolean);
  TDSRestCacheCommand = class
  strict private
    FParameterPath: string;
    FConnection: TDSCustomRestConnection;
    procedure Execute(const ARequestType, ACachePath: string; AResponseStreamProc: TDSRestResponseStreamProc; const ARequestFilter: string = '');
    function GetCommandPath: string;
  public
    constructor Create(AConnection: TDSCustomRestConnection);
    destructor Destroy; override;
    procedure GetParameter(AResponseStreamProc: TDSRestResponseStreamProc; const ARequestFilter: string = ''); overload;
    procedure GetParameter(out AJSONValue: TJSONValue; const ARequestFilter: string = ''); overload;
    procedure GetParameter(out AStream: TStream;  AOwnsObject: Boolean; const ARequestFilter: string = ''); overload;
    procedure GetCommand(AResponseStreamProc: TDSRestResponseStreamProc); overload;
    ///<summary>
    ///  Retrieve JSONObject that represents a cached command
    ///</summary>
    function GetCommand(AOwnsObject: Boolean = True): TJSONObject; overload;
    procedure DeleteCommand;
    property Connection: TDSCustomRestConnection read FConnection;
    property ParameterPath: string read FParameterPath write FParameterPath;
    property CommandPath: string read GetCommandPath;
  end;

  IDSRestCachedCommand = interface
  ['{16B2E1F2-436B-45D8-A17D-5B1617F65BD6}']
    function GetCommand(AConnection: TDSRestConnection; AOwnsObject: Boolean = True): TJSONObject;
    procedure DeleteCommand(AConnection: TDSRestConnection);
  end;

  IDSRestCachedItem = interface
    ['{CCCDC036-04F0-4CF6-A74F-D2759F1E635A}']
    function GetItemPath: string;
    property ItemPath: string read GetItemPath;
  end;

  IDSRestCachedJSONObject = interface(IDSRestCachedItem)
    ['{3C45664B-BAAB-42AA-8FD9-9D3AB0198455}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONObject;
  end;

  IDSRestCachedJSONArray = interface(IDSRestCachedItem)
    ['{38E0EFCC-A1B6-4E11-BD9D-F640B7822D44}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONArray;
  end;

  IDSRestCachedJSONValue = interface(IDSRestCachedItem)
    ['{12458118-91A1-4A67-87AB-947CB8970D7B}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONValue;
  end;

  IDSRestCachedDBXReader = interface(IDSRestCachedItem)
    ['{567DBA1E-2CAE-4C15-824B-0B678FBBD5B1}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TDBXReader;
  end;

  IDSRestCachedDataSet = interface(IDSRestCachedItem)
    ['{54D0BA3F-9159-4DD5-802A-0097BA842D91}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TDataSet;
  end;

  IDSRestCachedParams = interface(IDSRestCachedItem)
    ['{FD14E67B-D225-4FED-8B45-451B6627962C}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TParams;
  end;

  IDSRestCachedStream = interface(IDSRestCachedItem)
    ['{0E09C8A7-11A5-4CD5-B175-A35C9B0BEDF5}']
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TStream;
  end;

  IDSRestCachedObject<T: class> = interface
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): T;
  end;

  TGetJSONValueCallback = reference to function(AValue: TJSONValue): Boolean;

  TDSRestCachedItem = class(TInterfacedObject, IDSRestCachedItem, IDSRestCachedCommand)
  strict private
    FItemPath: string;
    FOwnedObjects: TList;
  protected
    function GetItemPath: string;
    function GetJSONValue(AConnection: TDSRestConnection;
      AOwnsObject: Boolean; const ARequestFilter: string): TJSONValue;
    function GetJSONValueCallback(AConnection: TDSRestConnection; ACallBack: TGetJSONValueCallback; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONValue;
    function UnmarshalValue<T: class>(AConnection: TDSRestConnection;
     AOwnsObject: Boolean; const ARequestFilter: string): T;
    property OwnedObjects: TList read FOwnedObjects;
  public
    constructor Create(const AItemPath: string);
    destructor Destroy; override;
    procedure DeleteCommand(AConnection: TDSRestConnection);
    function GetCommand(AConnection: TDSRestConnection; AOwnsObject: Boolean = True): TJSONObject;
    property ItemPath: string read GetItemPath;
  end;

  TDSRestCachedJSONObject = class(TDSRestCachedItem, IDSRestCachedJSONObject, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONObject;
  end;

  TDSRestCachedJSONArray = class(TDSRestCachedItem, IDSRestCachedJSONArray, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONArray;
  end;

  TDSRestCachedJSONValue = class(TDSRestCachedItem, IDSRestCachedJSONValue, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TJSONValue;
  end;

  TDSRestCachedStream = class(TDSRestCachedItem, IDSRestCachedStream, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TStream;
  end;

  TDSRestCachedDataSet = class(TDSRestCachedItem, IDSRestCachedDataSet, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TDataSet;
  end;

  TDSRestCachedParams = class(TDSRestCachedItem, IDSRestCachedParams, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TParams;
  end;

  TDSRestCachedDBXReader = class(TDSRestCachedItem, IDSRestCachedDBXReader, IDSRestCachedCommand)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): TDBXReader;
  end;

  TDSRestCachedObject<T: class> = class(TDSRestCachedItem)
  public
    function GetValue(AConnection: TDSRestConnection; AOwnsObject: Boolean = True; const ARequestFilter: string = ''): T;
  end;

  TDSRestClientCallback = class;
  TDSRestClientChannel = class;
  TDSRestCallbackLoop = class;

  ///  <summary> User event type for notification of callback channel events, such as create and close.
  ///  </summary>
  TDSRESTChannelEventType =
      (rChannelCreate, rChannelClose, rChannelClosedByServer, rCallbackAdded, rCallbackRemoved);

  ///  <summary> Event Item passed in through the TDSRESRChannelEvent, for providing tunnel event info.
  ///  </summary>
  TDSRESTChannelEventItem = record
    ///<summary>The type of event occurring for a tunnel (channel.)</summary>
    EventType: TDSRESTChannelEventType;
    ///<summary>The channel being acted on.</summary>
    ClientChannel: TDSRestClientChannel;
    ///<summary>The ID of the channel being acted on.</summary>
    ClientChannelId: String;
    ///<summary>The ServerChannelName of the tunnel (Channel) being acted on.</summary>
    ClientChannelName: String;
    ///<summary>The ID of the callback being added or removed.</summary>
    CallbackId: String;
    ///<summary>The callback being added or removed, or nil if the channel is being closed.</summary>
    Callback: TDSRestClientCallback;
  end;

  ///  <summary> User event for notification of callback tunnel, such as create and close.</summary>
  TDSRESRChannelEvent = procedure(const EventItem: TDSRESTChannelEventItem) of object;

  TDSRestClientChannel = class
  private
    FConnection: TDSCustomRestConnection;
    FCallbackLoop: TDSRestCallbackLoop;
    FOnDisconnect: TNotifyEvent;
    FChannelEvent: TDSRESRChannelEvent;
    FStopped: Boolean;
    FCallbacks: TList<TDSRestClientCallback>;

    procedure EnumerateCallbacks(AMethod: TFunc<TDSRestClientCallback, Boolean>); overload;
    procedure EnumerateCallbacks(AMethod: TProc<TDSRestClientCallback>); overload;
    procedure UnregisterAllCallbacks;

    procedure NotifyEvent(EventType: TDSRESTChannelEventType; Callback: TDSRestClientCallback);
  strict private
    FChannelId: string;
    FServerChannelName: string;
    function GetConnected: Boolean;
    function GetSessionId: String;
  public
    constructor Create(const AChannelId, AServerChannelName: string; AConnection: TDSCustomRestConnection);
    destructor Destroy; override;
    procedure RegisterCallback(AClientCallback: TDSRestClientCallback);
    procedure Connect(AFirstCallback: TDSRestClientCallback);
    procedure UnregisterCallback(AClientCallback: TDSRestClientCallback);
    function Broadcast(AMessage: TJSONValue; AChannelName: String = ''): Boolean;
    procedure Disconnect;
    function Notify(const AClientId, ACallbackId: string; AMessage: TJSONValue): Boolean;
    property Connected: Boolean read GetConnected;
    property OnDisconnect: TNotifyEvent read FOnDisconnect write FOnDisconnect;
    property ServerChannelName: string read FServerChannelName;
    property ChannelId: string read FChannelId;
    property SessionId: String read GetSessionId;
    /// <summary>Returns the list of callbacks held by this client channel.</summary>
    property Callbacks: TList<TDSRestClientCallback> read FCallbacks;
    /// <summary>Event that gets notified when changes are made to the callbacks held by this
    ///           channel or to the channel itself.
    /// </summary>
    property OnChannelStateChange: TDSRESRChannelEvent read FChannelEvent write FChannelEvent;
  end;

  TDSRestCallbackLoop = class
  strict private
    FClientChannel: TDSRestClientChannel;
    FConnection: TDSCustomRestConnection;
    FThread: TThread;
    FStopping: Boolean;
    procedure OnThreadTerminateDirect;
    function GetStopped: Boolean;
    function GetSessionId: String;
  public
    constructor Create(AClientChannel: TDSRestClientChannel; AConnection: TDSCustomRestConnection);
    destructor Destroy; override;
    procedure Callback(responseValue: TJSONValue; var AStatus: Boolean; var AStop: Boolean);
    procedure Start(AFirstCallback: TDSRestClientCallback);
    procedure Stop;
    property Stopped: Boolean read GetStopped;
    property ClientChannel: TDSRestClientChannel read FClientChannel;
    property SessionId: String read GetSessionId;
  end;

  TDSRestClientCallbackFunction = TFunc<TJSONValue, string, Boolean>;

  TDSRestClientCallback = class
  strict private
    FCallbackId: string;
    FChannelNames: TStrings;
    FClientCallbackFunction: TDSRestClientCallbackFunction;
    FClientChannel: TDSRestClientChannel;
  public
    constructor Create(AClientChannel: TDSRestClientChannel; const ACallbackId: string;
      AClientCallbackFunction: TDSRestClientCallbackFunction; AChannelNames: TStrings = nil);
    destructor Destroy; override;

    property CallbackId: string read FCallbackId;
    property ClientCallbackFunction: TDSRestClientCallbackFunction read FClientCallbackFunction;
    property ChannelNames: TStrings read FChannelNames;
  end;

  TTestConnectionMethod = procedure of object;

  TDSRestException = class(Exception);

  TDSRestProtocolException = class(TDSRestException)
  private
    FStatus: Integer;
    FResponseText: string;
  public
    constructor Create(AStatus: Integer; const AMessage, AResponseText: string);
    property Status: Integer read FStatus;
    property ResponseText: string read FResponseText;
  end;

var
  DSRestLoginDialogProc: function (ASender: TObject; var LoginProperties: TDSRestLoginProperties;
    ATestConnectionMethod: TTestConnectionMethod): Boolean;

implementation

uses
  Data.DBXCommonTable,
  Data.DBXDBReaders,
  Data.DBXJSONCommon,
  Data.DBXMemoryRow,
  Data.DBXPlatform,
  Datasnap.DSClientResStrs,
  Datasnap.DSProxyRest,
  IPPeerAPI,
  Data.SqlExpr,
  System.StrUtils;

const
  sDSSessionEquals = 'dssession=';
type
  TDSRestRequestResponse = class
  strict private
    FFreeStreamValue: Boolean;
    FStringValue: string;
    FStreamValue: TStream;
    FHaveString: Boolean;
    FSessionID: string;
    FSessionExpired: Boolean;
    FResponseCharSet: string;
  private
    FIPImplementationID: string;
    function GetStringValue: string;
  public
    function GetStream(AObjectOwner: Boolean = True): TStream;
    property StringValue: string read GetStringValue;
    property SessionExpired: Boolean read FSessionExpired;
    property SessionID: string read FSessionID;
    constructor Create(const AStream: TStream; const AResponseCharSet, ASessionID: string;
    ASessionExpired: Boolean);
    destructor Destroy; override;
    property ResponseCharSet: string read FResponseCharSet;
  end;

  TDSRestRequest = class
  strict private
    FHeaders: TDictionary<string, string>;
    FResponseStream: TStream;
    FResponseCharSet: string;
    FResponseSessionID: string;
    FResponseSessionExpired: Boolean;
    FStatus: Integer;
    FRequestType: string;
    FUrl: string;
    FPassword: string;
    FUsername: string;
    FHTTP: TDSHTTP;
    FRequestPragma: string;
    FFreeResponseStream: Boolean;
    procedure SendDeleteRequest(var response: string;
      out responseCode: Integer; out errorMessage: string);
    procedure SendGetRequest(var response: string; out responseCode: Integer; out errorMessage: string);
    procedure SendPostRequest(datastream: TStream; var response: string;
      out responseCode: Integer; out errorMessage: string);
    procedure SendPutRequest(datastream: TStream; var response: string;
      out responseCode: Integer; out errorMessage: string);
    function GetResponseStream(AOwnsObject: Boolean): TStream;
  private
    FAccept: string;
    function GetHTTP: TDSHTTP;
    procedure DoRequest(var response: string; out responseCode: Integer; out errorMessage: string;
      ACallback: TProc<TDSHTTP>);
  public
    constructor Create(AHTTP: TDSHTTP);
    destructor Destroy; override;
    procedure open(const requestType, url, userName, password: string);
    procedure setRequestHeader(const AName, AValue: string);
    procedure setRequestPragma(const AValue: string);
    function send(const paramToSend: string): TDSRestRequestResponse; overload;
    property Status: Integer read FStatus;
    property SessionExpired: Boolean read FResponseSessionExpired;
    property Accept: string read FAccept write FAccept;
  end;

constructor TDSRestCommand.Create(AConnection: TDSCustomRestConnection);
begin
  FConnection := AConnection;
end;

destructor TDSRestCommand.Destroy;
begin
  FParameters.Free;
  FDBXContext.Free;
  FFreeOnExecuteList.Free;
  inherited;
end;

// Use "GET" unless parameters types require "POST".  Use "POST" because request content,
// rather than URL, must be used to pass complex input parameters.
function TDSRestCommand.DetermineRequestType(AMetaData: array of TDSRestParameterMetaData): string;
  function IsKnownJSONTypeName(const Name: UnicodeString): Boolean;
  begin
    if not StringIsNil(Name) then
    begin
      if CompareText(Copy(Name,0+1,5-(0)), 'TJSON') = 0 then
        Exit(True);
    end;
    Result := False;
  end;
var
  Item: TDSRestParameterMetaData;
  LRequiresRequestContent: Boolean;
  LTypeName: string;
begin
  LRequiresRequestContent := False;
  for Item in AMetaData do
  begin
    case Item.Direction of
      TDBXParameterDirections.InParameter,
      TDBXParameterDirections.InOutParameter:
      begin
        case Item.DBXType of
          TDBXDataTypes.TableType, TDBXDataTypes.BinaryBlobType:
            LRequiresRequestContent := True;
          TDBXDataTypes.JsonValueType:
          begin
            LTypeName := Item.TypeName;
            if not IsKnownJSONTypeName(LTypeName) then
              LRequiresRequestContent := True
            else if SameText(LTypeName, 'TJSONValue') or SameText(LTypeName, 'TJSONObject') or SameText(LTypeName, 'TJSONArray') then  // Do not localize
              LRequiresRequestContent := True;
          end;
        end;
        if LRequiresRequestContent then
          break;
      end;
    end;
  end;
  if LRequiresRequestContent then
    Result := 'POST' // Do not localize
  else
    Result := 'GET';  // Do not localize
end;

procedure TDSRestCommand.Prepare(AMetaData: array of TDSRestParameterMetaData);
begin
  FreeAndNil(FParameters);
  FParameters := CreateParameters(AMetaData);
  // Set HTTP verb if not specified
  if Self.FRequestType = '' then
    Self.FRequestType := DetermineRequestType(AMetaData);
 end;

procedure TDSRestCommand.Prepare(AProxyMetaData: TDSProxyMetadata);
var
  DSRestParameterMetaDataArray: TArray<TDSRestParameterMetaData>;
begin
  DSRestParameterMetaDataArray := BuildParameterMetaDataArray(AProxyMetaData);
  Self.Prepare(DSRestParameterMetaDataArray);
end;

procedure TDSRestCommand.Prepare;
var
  DSRestParameterMetaDataArray: TArray<TDSRestParameterMetaData>;
begin
  DSRestParameterMetaDataArray := BuildParameterMetaDataArray;
  Self.Prepare(DSRestParameterMetaDataArray);
end;

function TDSRestCommand.BuildParameterMetaDataArray(AProxyMetaData: TDSProxyMetadata): TArray<TDSRestParameterMetaData>;
var
  MethodStr: string;
  Index: Integer;
  DSRestParameterMetaDataArray: TArray<TDSRestParameterMetaData>;
  ParamCount: Integer;
  DSProxyClass: TDSProxyClass;
  DSProxyMethod: TDSProxyMethod;
  DSProxyParameter: TDSProxyParameter;
  LClassName: string;
  LMethodName: string;
begin
  MethodStr := ReplaceStr(Self.Text, '"', '');
  Index := Pos('.', MethodStr);
  if Index < 0 then
    raise TDSRestException.CreateFmt(sInvalidServerMethodName, [Self.Text]);

  LClassName := AnsiLeftStr(MethodStr, Index-1);
  LMethodName := AnsiRightStr(MethodStr, Length(MethodStr)-Index);
  if MethodStr = Self.Text then // Not quoted
  begin
    //adjust method name for REST request storage methods
    if Self.RequestType = 'PUT' then            // Do not localize
      LMethodName := 'Accept' + LMethodName     // Do not localize
    else if Self.RequestType = 'POST' then      // Do not localize
      LMethodName := 'Update' + LMethodName     // Do not localize
    else if Self.RequestType = 'DELETE' then    // Do not localize
      LMethodName := 'Cancel' + LMethodName;    // Do not localize
  end;

  DSProxyClass := AProxyMetaData.Classes;
  while DSProxyClass <> nil do
  begin
    if SameText(DSProxyClass.ProxyClassName, LClassName) then
    begin
      DSProxyMethod := DSProxyClass.FirstMethod;
      while DSProxyMethod <> nil do
      begin
        if SameText(DSProxyMethod.ProxyMethodName, LMethodName) then
        begin
          DSProxyParameter := DSProxyMethod.Parameters;
          ParamCount := 0;
          while DSProxyParameter <> nil do
          begin
            Inc(ParamCount);
            SetLength(DSRestParameterMetaDataArray, ParamCount);
            DSRestParameterMetaDataArray[ParamCount-1].Name := DSProxyParameter.ParameterName;
            DSRestParameterMetaDataArray[ParamCount-1].Direction := DSProxyParameter.ParameterDirection;
            DSRestParameterMetaDataArray[ParamCount-1].DBXType := DSProxyParameter.DataType;
            DSRestParameterMetaDataArray[ParamCount-1].TypeName := DSProxyParameter.TypeName;
            DSProxyParameter := DSProxyParameter.Next;
          end;
          Exit(DSRestParameterMetaDataArray);
        end;
        DSProxyMethod := DSProxyMethod.Next;
      end;
    end;
    DSProxyClass := DSProxyClass.Next;
  end;
end;

function TDSRestCommand.BuildParameterMetaDataArray: TArray<TDSRestParameterMetaData>;
var
  SessionID: string;
  DSProxyMetaDataLoaderIntf: IDSProxyMetaDataLoader;
  DSProxyMetadata: TDSProxyMetadata;
begin
  //preserve original session
  SessionID := Connection.SessionID;
  try
    DSProxyMetaDataLoaderIntf := TDSRestProxyMetaDataLoader.Create(Connection);
    if DSProxyMetaDataLoaderIntf = nil then
      raise TDSRestException.Create(SUnableToRetrieveServerMethodParameters);
    DSProxyMetaData := TDSProxyMetaData.Create;
    try
      DSProxyMetaDataLoaderIntf.Load(DSProxyMetaData);
      Result := BuildParameterMetaDataArray(DSProxyMetaData);
    finally
      DSProxyMetaData.Free;
    end;
  finally
    //restore session
    Self.Connection.SessionID := SessionID;
  end;
end;


function TDSRestCommand.CreateParameters(AMetaData: array of TDSRestParameterMetaData): TDBXParameterList;
var
  LParameter: TDBXParameter;
  LValueTypes: TDBXValueTypeArray;
  LMemoryRow: TDBXRow;
  LValueType: TDBXValueType;
  LMetaData: TDSRestParameterMetaData;
  I: Integer;
  LParameterList: TDBXParameterList;
begin
  if FDBXContext = nil then
    FDBXContext := TDBXContext.Create;
  SetLength(LValueTypes, Length(AMetaData));
  for I := 0 to Length(AMetaData) - 1 do
  begin
    LMetaData := AMetaData[I];
    LParameter := TDBXParameter.Create(FDBXContext);
    LParameter.DataType := LMetaData.DBXType;
    LParameter.ParameterDirection :=  LMetaData.Direction;
    LParameter.Name :=  LMetaData.Name;
    LParameter.Ordinal := I;
    LParameter.ConnectionHandler := Self;
    LParameter.TypeName := LMetaData.TypeName;
    LValueTypes[I] := LParameter;
  end;

  LMemoryRow := TDBXMemoryRow.Create(FDBXContext, LValueTypes);
  LParameterList := TDBXParameterList.Create(nil, LMemoryRow);
  for LValueType in LValueTypes do
    LParameterList.AddParameter(TDBXParameter(LValueType));
  Result := LParameterList;
end;

procedure ExecuteCommand(ACommand: TDSRestCommand; const ARequestFilter: string; const AAccept: string = ''); forward;
procedure ExecuteCacheCommand(ACommand: TDSRestCacheCommand; const ARequestType: string; const ACachePath: string; AResponseStreamProc: TDSRestResponseStreamProc; const ARequestFilter: string ); forward;

procedure TDSRestCommand.Execute(const ARequestFilter: string);
begin
  BeforeExecute;
  try
    if Connection.LoginProperties.LoginPrompt then
      if not Connection.Login then
        System.SysUtils.Abort;
    ExecuteCommand(Self, ARequestFilter);
  finally
    AfterExecute;
  end;
end;

procedure TDSRestCommand.BeforeExecute;
begin
  FreeAndNil(FFreeOnExecuteList);
  Connection.BeforeExecute;
end;

procedure TDSRestCommand.AfterExecute;
begin
  Connection.AfterExecute;
end;

procedure TDSRestCommand.ExecuteCache(const ARequestFilter: string);
begin
  Connection.BeforeExecute;
  try
    if Connection.LoginProperties.LoginPrompt then
      if not Connection.Login then
        System.SysUtils.Abort;
    ExecuteCommand(Self, ARequestFilter, 'application/rest');
  finally
    Connection.AfterExecute;
  end;
end;

function TDSRestCommand.GetJSONMarshaler: TJSONMarshal;
begin
  Result := TJSONConverters.GetJSONMarshaler;
end;

function TDSRestCommand.GetJSONUnMarshaler: TJSONUnMarshal;
begin
  Result := TJSONConverters.GetJSONUnmarshaler;
end;

procedure TDSRestCommand.FreeOnExecute(Value: TObject);
begin
  if FFreeOnExecuteList = nil then
  begin
    FFreeOnExecuteList := TObjectList.Create;
    FFreeOnExecuteList.OwnsObjects := true;
  end;
  if FFreeOnExecuteList.IndexOf(Value) < 0 then
    FFreeOnExecuteList.Add(Value);
end;

{ TDSRestCacheCommand }

constructor TDSRestCacheCommand.Create(AConnection: TDSCustomRestConnection);
begin
  FConnection := AConnection;
end;

procedure TDSRestCacheCommand.DeleteCommand;
begin
  // Note that the server doesn't support deleting a item associated with a command.  So this
  // will generate an HTTP error.  Only the entire cache item can be deleted.
  if CommandPath = '' then
    raise TDSRestException.Create(sMissingCommandPath);
  Execute('DELETE', CommandPath, nil);
end;

destructor TDSRestCacheCommand.Destroy;
begin

  inherited;
end;

procedure TDSRestCacheCommand.Execute(const ARequestType, ACachePath: string; AResponseStreamProc: TDSRestResponseStreamProc; const ARequestFilter: string );
begin
  ExecuteCacheCommand(Self, ARequestType, ACachePath, AResponseStreamProc, ARequestFilter);
end;

procedure TDSRestCacheCommand.GetCommand(AResponseStreamProc: TDSRestResponseStreamProc);
begin
  if CommandPath = '' then
    raise TDSRestException.Create(sMissingCommandPath);
  Execute('GET', CommandPath, AResponseStreamProc);
end;

function TDSRestCacheCommand.GetCommand(AOwnsObject: Boolean = True): TJSONObject;
var
  LJSONValue: TJSONValue;
  LPair: TJSONPair;
  LResult: TJSONObject;
begin
  LResult := nil;
  GetCommand(
    procedure(AStream: TStream; const AResponseCharSet: string; var AOwnsStream: Boolean)
    var
      LString: string;
    begin
      if AStream <> nil then
      begin
        AStream.Position := 0;
        LString := IPProcs(Connection.IPImplementationID).ReadStringAsCharset(AStream, AResponseCharSet);
        AOwnsStream := True; // Don't keep stream
        LJSONValue := TJSONObject.ParseJSONValue(BytesOf(LString), 0);
        try
          if LJSONValue is TJSONObject then
          begin
            LPair := TJSONObject(LJSONValue).Get('result');
            if (LPair <> nil) and (LPair.JSONValue is TJSONObject) then
            begin
              LResult := TJSONObject(LPair.JSONValue); // TJSONArray(LPair.JSONValue);
              if LResult <> nil then
                LResult.Owned := False;
            end
          end;
        finally
          LJSONValue.Free;
        end;
      end;
     end
  );
  Result := LResult;
end;

function TDSRestCacheCommand.GetCommandPath: string;
var
  LLast: Integer;
begin
  LLast := System.SysUtils.LastDelimiter('/', FParameterPath);
  if LLast > 0 then
    Result := Copy(FParameterPath, 1, LLast-1)
  else
    Result := '';
end;

procedure TDSRestCacheCommand.GetParameter(out AJSONValue: TJSONValue;
  const ARequestFilter: string);
var
  LJSONValue: TJSONValue;
  LResult: TJSONValue;
  LPair: TJSONPair;
begin
  LResult := nil;
  GetParameter(
    procedure(AStream: TStream; const AResponseCharSet: string; var AOwnsStream: Boolean)
    var
      LString: string;
    begin
      if AStream <> nil then
      begin
        AStream.Position := 0;
        LString := IPProcs(Connection.IPImplementationID).ReadStringAsCharset(AStream, AResponseCharSet);
        AOwnsStream := True; // Don't keep stream
        LJSONValue := TJSONObject.ParseJSONValue(BytesOf(LString), 0);
        try
          if LJSONValue is TJSONObject then
          begin
            LPair := TJSONObject(LJSONValue).Get('result');
            if (LPair <> nil) then //and (LPair.JSONValue is TJSONArray) then
            begin
              LResult := LPair.JSONValue; // TJSONArray(LPair.JSONValue);
              if LResult <> nil then
                LResult.Owned := False;
            end
          end;
        finally
          LJSONValue.Free;
        end;
      end;
    end, ARequestFilter);
  AJSONValue := LResult;
end;

procedure TDSRestCacheCommand.GetParameter(out AStream: TStream; AOwnsObject: Boolean; const ARequestFilter: string = '');
var
  LJSONValue: TJSONValue;
  LResult: TStream;
  LPair: TJSONPair;
  LString: string;
  LJSONArray: TJSONArray;
begin
  LResult := nil;
  GetParameter(
    procedure(AStream: TStream; const AResponseCharSet: string; var AOwnsStream: Boolean)
    begin
      AStream.Position := 0;
      // ResponseCharSet should identify as binary stream
      LString := IPProcs(Connection.IPImplementationID).ReadStringAsCharset(AStream, AResponseCharSet);
      LJSONValue := TJSONObject.ParseJSONValue(BytesOf(LString), 0);
      try
        if LJSONValue is TJSONObject then
        begin
          LPair := TJSONObject(LJSONValue).Get('result');
          if (LPair <> nil) and(LPair.JSONValue is TJSONArray) then
          begin
            LJSONArray := TJSONArray(LPair.JSONValue);
            LResult := TDBXJSONTools.JSONToStream(LJSONArray);
          end
        end
        else if LJSONValue = nil then
        begin
          // Assume binary
          AStream.Position := 0;
          LResult := AStream;
          if AOwnsObject then
            AOwnsStream := AOwnsObject;
        end;
      finally
        LJSONValue.Free;
      end;
    end,
    ARequestFilter);
  AStream := LResult;
end;

procedure TDSRestCacheCommand.GetParameter(AResponseStreamProc: TDSRestResponseStreamProc;
  const ARequestFilter: string);
begin
  if FParameterPath = '' then
    raise TDSRestException.Create(sMissingParameterPath);
  Execute('GET', FParameterPath, AResponseStreamProc, ARequestFilter);
end;

function EncodeCharSet(const AStr: string; ACharSet: TSysCharSet): string;
var
  Sp, Rp: PChar;
begin
  SetLength(Result, Length(AStr) * 3);
  Sp := PChar(AStr);
  Rp := PChar(Result);
  while Sp^ <> #0 do
  begin
    if not System.SysUtils.CharInSet(Sp^, ACharSet) then
      Rp^ := Sp^
    else
    begin
      FormatBuf(Rp, 3, '%%%.2x', 6, [Ord(Sp^)]);
      Inc(Rp,2);
    end;
    Inc(Rp);
    Inc(Sp);
  end;
  SetLength(Result, (Rp - PChar(Result)));
end;

function EncodeURIComponent(const AStr: string; const AIPImplementationID: string = ''): string; overload;
const
  EncodeURIComponentCharSet = ['@', '$', '&', '=', ':', '/', ',', ';', '?', '+'];
begin
  Result := EncodeCharSet(IPProcs(AIPImplementationID).ParamsEncode(AStr), EncodeURIComponentCharSet);
end;

function encodeURIComponent(const AValue: TDBXParameter; const AIPImplementationID: string = ''): string; overload;
var
  LStringValue: string;
begin
  case AValue.DataType of
    TDBXDataTypes.DoubleType,
    TDBXDataTypes.SingleType,
    TDBXDataTypes.CurrencyType,
    TDBXDataTypes.BcdType:
      // Use consistent decimal separator
      LStringValue := TDBXPlatform.JsonFloat(AValue.Value.AsDouble);
  else
    if AValue.Value.IsNull then
      LStringValue := 'null'
    else
      LStringValue := AValue.Value.AsString;
  end;
  Result := encodeURIComponent(LStringValue, AIPImplementationID);
end;

function IsUrlParameter(const AValue: TDBXParameter): Boolean;
var
  LTypeName: string;
begin
  LTypeName := AValue.TypeName;
  if AValue.DataType = TDBXDataTypes.TableType then
    Exit(False);
  if AValue.DataType = TDBXDataTypes.BinaryBlobType then
    Exit(False);
  if AValue.DataType = TDBXDataTypes.JSONValueType then
    if not SameText(Copy(LTypeName,0+1,5-(0)), 'TJSON') then
      Exit(False)
    else if SameText(LTypeName, 'TJSONValue') or SameText(LTypeName, 'TJSONObject') or SameText(LTypeName, 'TJSONArray') then
      Exit(False);
  Result := True;
end;

procedure ExecuteRequest(AHTTP: TDSHTTP; const AURL, LRequestType, LUserName, LPassword: string; LParameters: TDBXParameterList; const ARequestFilter, AAccept: string;
   var ASessionID: string; LSessionExpired: TProc; LSetSessionID: TProc<string>); forward;


procedure ExecuteCommand(ACommand: TDSRestCommand; const ARequestFilter, AAccept: string); overload;
var
  LPathPrefix: string;
  LPort: Integer;
  LHost: string;
  LPortString: string;
  LUrl: string;
  LMethodName: string;
  LContext: string;
  LProtocol: string;
  LSessionID: string;
  LIPImplementationID: string;
begin
  LIPImplementationID := ACommand.Connection.IPImplementationID;
  LPathPrefix := ACommand.Connection.UrlPath;
  LPort := ACommand.Connection.Port;
  LHost := ACommand.Connection.Host;
  LMethodName := ACommand.Text;
  LProtocol := ACommand.Connection.HTTP.Protocol;
  if LProtocol = '' then
    LProtocol := 'http';

  if LHost = '' then
    LHost := 'localhost';
  if LPathPrefix <> '' then
    LPathPrefix := '/' + LPathPrefix;
  if LPort > 0 then
    LPortString := ':' + IntToStr(LPort);
  LMethodName := StringReplace(LMethodName, '.', '/', []);
  LMethodName := StringReplace(LMethodName, '"', '%22', [rfReplaceAll]); // Encode quotes
  LContext := ACommand.Connection.Context;
  if LContext = '' then
    LContext := 'datasnap/';
  LUrl := LProtocol + '://' +
    encodeURIComponent(LHost, LIPImplementationID) + LPortString + LpathPrefix + '/' + LContext + 'rest/' + LMethodName  + '/';
  LSessionID := ACommand.Connection.SessionID;
  ExecuteRequest(ACommand.Connection.HTTP, LURL, ACommand.RequestType, ACommand.Connection.LoginProperties.UserName, ACommand.Connection.LoginProperties.Password, ACommand.Parameters, ARequestFilter, AAccept,
    LSessionID,
    procedure
    begin
      ACommand.Connection.SessionExpired;
    end,
    procedure(ASessionID: string)
    begin
      if ASessionID <> '' then
        ACommand.Connection.SessionID := ASessionID;
    end);
end;

procedure ExecuteRequest(AHTTP: TDSHTTP; const AURL, LRequestType, LUserName, LPassword: string; LParameters: TDBXParameterList;
  const ARequestFilter, AAccept: string; var ASessionID: string;
  LSessionExpired: TProc; LSetSessionID: TProc<string>); overload;

  function ParameterToJSon(AParameter: TDBXParameter; out ACanFree: Boolean): TJSONValue;
  begin
    ACanFree := True;
    if AParameter.Value = nil then
      Result := nil
    else if AParameter.Value.IsNull then
      Result := TJSONNull.Create
    else
      case AParameter.DataType of
        TDBXDataTypes.JsonValueType:
        begin
          Result := AParameter.Value.GetJSONValue;
          ACanFree := False;
        end;
        TDBXDataTypes.TableType:
          Result := TDBXJSONTools.TableToJSON(AParameter.Value.GetDBXReader, High(Integer), False);
        TDBXDataTypes.BlobType,
        TDBXDataTypes.BinaryBlobType:
          Result := TDBXJSONTools.StreamToJSON(AParameter.Value.GetStream, 0, High(Integer));
      else
        Result := TDBXJSONTools.DBXToJSON(AParameter.Value,
                               AParameter.DataType, True (* Local connection *));
      end;
  end;

var
  LUrl: string;
  LParametersToSend: TList<TDBXParameter>;
  LParametersToSendInContent: TList<TDBXParameter>;
  LParameter: TDBXParameter;
  LWritingUrl: Boolean;
  LOrdinal: Integer;
  LRequest: TDSRestRequest;
  LStringToSend: string;
  LJSONToSend: TJSONValue;
  LResponseText: TDSRestRequestResponse;
  LResponseJSON: TJSONValue;
  LJSONParameterValuePair: TJSONPair;
  LJSONParameterValue: TJSONValue;
  LJSONResultArray: TJSONArray;
  LJSONResultArrayIndex: Integer;
  LJSONArray: TJSONArray;
  LJSONObject: TJSONObject;
  LCanFree: Boolean;
  LValueToFree: TJSONValue;
begin
  LURL := AURL;
  LParametersToSend := TList<TDBXParameter>.Create;
  LParametersToSendInContent := nil;
  try
  if LParameters <> nil then
    for LOrdinal := 0 to  LParameters.Count - 1 do
    begin
      LParameter := LParameters[LOrdinal];
      if (LParameter.ParameterDirection = TDBXParameterDirections.InParameter) or
         (LParameter.ParameterDirection = TDBXParameterDirections.InOutParameter) then
        LParametersToSend.Add(LParameter);
    end;
  if (LRequestType = 'GET') or (LRequestType = '') or (LRequestType = 'DELETE') then
  begin
    for LParameter in LParametersToSend do
      LUrl := LUrl + encodeURIComponent(LParameter, AHTTP.IPImplementationID) + '/';
  end
  else
  begin
    LParametersToSendInContent := TList<TDBXParameter>.Create;
    LWritingUrl := True;
    for LParameter in LParametersToSend do
    begin
      if LWritingUrl then
        if IsUrlParameter(LParameter) then
          LUrl := LUrl + encodeURIComponent(LParameter, AHTTP.IPImplementationID) + '/'
        else
        begin
          LParametersToSendInContent.Add(LParameter);
          LWritingUrl := False
        end
      else
        LParametersToSendInContent.Add(LParameter);
    end;
  end;
  if ARequestFilter <> '' then
  begin
    if not System.StrUtils.EndsText('/', LUrl) then
      LUrl := LUrl + '/';
    if ARequestFilter[1] = '?' then
      LUrl := LUrl + ARequestFilter
    else
      LUrl := LUrl + '?' + ARequestFilter;
  end;

  LRequest := TDSRestRequest.Create(AHTTP);
  try

  LRequest.open(LRequestType, LUrl, LUserName, LPassword);

  if (LParametersToSendInContent <> nil) and (LParametersToSendInContent.Count > 0) then
    begin
      LValueToFree := nil;
      try
        if LParametersToSendInContent.Count = 1 then
        begin
          LJSONToSend := ParameterToJSon(LParametersToSendInContent[0], LCanFree);
          if LCanFree then
            LValueToFree := LJSONToSend;
        end
        else
        begin
          LJSONArray := TJSONArray.Create;
          for LParameter in  LParametersToSendInContent do
          begin
            LJSONToSend := ParameterToJSon(LParameter, LCanFree);
            LJSONArray.AddElement(LJSONToSend);
            if not LCanFree then
              LJSONToSend.Owned := False;
          end;
          LJSONObject := TJSONObject.Create;
          LJSONObject.AddPair('_parameters', LJSONArray);
          LJSONToSend := LJSONObject;
          LValueToFree := LJSONObject;
        end;
        LStringToSend := LJSONToSend.ToString;
      finally
        LValueToFree.Free;
      end;
    end;
  if AAccept <> '' then
    Lrequest.Accept := AAccept
  else
    Lrequest.Accept := 'application/JSON'; // Do not localize
  Lrequest.SetRequestHeader('Content-Type', 'text/plain;charset=UTF-8');  // Do not localize
  Lrequest.SetRequestHeader('If-Modified-Since', 'Mon, 1 Oct 1990 05:00:00 GMT');  // Do not localize
  if ASessionId <> '' then
    Lrequest.SetRequestPragma(sDSSessionEquals + ASessionId);

  LResponseText := LRequest.send(LStringToSend);
  try
  if LResponseText.SessionExpired then
    LSessionExpired
  else
    LSetSessionID(LResponseText.SessionID);

  LResponseJSON := TJSONObject.ParseJSONValue(BytesOf(LResponseText.StringValue), 0);
  try
    if LResponseJSON <> nil then
    begin
      LJSONParameterValuePair := TJSONObject(LResponseJSON).Get('result');
      if LJSONParameterValuePair.JSONValue is TJSONArray then
        LJSONResultArray := TJSONArray(LJSONParameterValuePair.JSONValue)
      else
        LJSONResultArray := nil;
      if LJSONResultArray <> nil then
      begin
        LJSONResultArrayIndex := 0;
        if LParameters <> nil then
          for LOrdinal := 0 to  LParameters.Count - 1 do
          begin
            LParameter := LParameters[LOrdinal];
            LJSONParameterValue := nil;
            if (LParameter.ParameterDirection = TDBXParameterDirections.ReturnParameter) or
               (LParameter.ParameterDirection = TDBXParameterDirections.InOutParameter) or
               (LParameter.ParameterDirection = TDBXParameterDirections.OutParameter) then
              if LJSONResultArray.Size = 1 then
                LJSONParameterValue := LJSONResultArray.Get(0)
              else
              begin
                LJSONParameterValue := LJSONResultArray.Get(LJSONResultArrayIndex);
                Inc(LJSONResultArrayIndex);
              end;
            if LJSONParameterValue <> nil then
            begin
               // Must clone some types
               case LParameter.DataType of
                 TDBXDataTypes.TableType:
                 begin
                   TDBXJSONTools.JSONToDBX(TJSONValue(LJSONParameterValue.Clone), LParameter.Value,
                                    LParameter.DataType, True (* Local connection *), True (* Owns Clone *));

                 end;
                 TDBXDataTypes.JSONValueType:
                 begin
                   TDBXJSONTools.JSONToDBX(TJSONValue(LJSONParameterValue.Clone), LParameter.Value,
                                    LParameter.DataType, True (* Local connection *), True (* Owns Clone *));

                 end
               else
                 TDBXJSONTools.JSONToDBX(LJSONParameterValue, LParameter.Value,
                                    LParameter.DataType, True (* Local connection *));
               end;
            end;
          end;
      end;
    end
    else
    begin
      // Stream result
      if LParameters <> nil then
        for LOrdinal := 0 to  LParameters.Count - 1 do
        begin
          LParameter := LParameters[LOrdinal];
          if (LParameter.ParameterDirection = TDBXParameterDirections.ReturnParameter) or
             (LParameter.ParameterDirection = TDBXParameterDirections.InOutParameter) or
             (LParameter.ParameterDirection = TDBXParameterDirections.OutParameter) then
             if LParameter.DataType = TDBXDataTypes.BinaryBlobType then
             begin
               LParameter.Value.SetStream(LResponseText.GetStream(False), True);
               break;
             end;
        end;
    end;
  finally
    LResponseJSON.Free;
  end;
  finally
    LResponseText.Free;
  end;
  finally
    LRequest.Free;
  end;
  finally
    LParametersToSend.Free;
    LParametersToSendInContent.Free;
  end;
end;

procedure ExecuteCacheRequest(AHTTP: TDSHTTP; const LRequestType: string; const AURL, LUserName, LPassword: string;
  const ARequestFilter: string; const ACachePath: string; var ASessionID: string;
  LSessionExpired: TProc; LSetSessionID: TProc<string>; AResponseStreamProc: TDSRestResponseStreamProc ); forward;

procedure ExecuteCacheCommand(ACommand: TDSRestCacheCommand; const ARequestType: string; const ACachePath: string; AResponseStreamProc: TDSRestResponseStreamProc; const ARequestFilter: string );
var
  LPathPrefix: string;
  LPort: Integer;
  LHost: string;
  LPortString: string;
  LUrl: string;
//  LMethodName: string;
  LContext: string;
  LProtocol: string;
  LSessionID: string;
  //LParameterPath: string;
  LIPImplementationID: string;
begin
  LIPImplementationID := ACommand.Connection.IPImplementationID;
  LPathPrefix := ACommand.Connection.UrlPath;
  LPort := ACommand.Connection.Port;
  LHost := ACommand.Connection.Host;
//  LMethodName := ACommand.Text;
  LProtocol := ACommand.Connection.HTTP.Protocol;
//  LParameterPath := ACommand.ParameterPath;
  if LProtocol = '' then
    LProtocol := 'http';

  if LHost = '' then
    LHost := 'localhost';
  if LPathPrefix <> '' then
    LPathPrefix := '/' + LPathPrefix;
  if LPort > 0 then
    LPortString := ':' + IntToStr(LPort);
//  LMethodName := StringReplace(LMethodName, '.', '/', []);
  LContext := ACommand.Connection.Context;
  if LContext = '' then
    LContext := 'datasnap/';
  LUrl := LProtocol + '://' +
    encodeURIComponent(LHost, LIPImplementationID) + LPortString + LpathPrefix + '/' + LContext + 'cache'  + '/';
  LSessionID := ACommand.Connection.SessionID;
  ExecuteCacheRequest(ACommand.Connection.HTTP, ARequestType, LURL, ACommand.Connection.LoginProperties.UserName, ACommand.Connection.LoginProperties.Password, ARequestFilter, ACachePath,
    LSessionID,
    procedure
    begin
      ACommand.Connection.SessionExpired;
    end,
    procedure(ASessionID: string)
    begin
      if ASessionID <> '' then
        ACommand.Connection.SessionID := ASessionID;
    end,
    AResponseStreamProc);
end;

procedure ExecuteCacheRequest(AHTTP: TDSHTTP; const LRequestType: string;  const AURL, LUserName, LPassword: string;
  const ARequestFilter: string; const ACachePath: string; var ASessionID: string;
  LSessionExpired: TProc; LSetSessionID: TProc<string>; AResponseStreamProc: TDSRestResponseStreamProc );
var
  LUrl: string;
  LRequest: TDSRestRequest;
  LResponseText: TDSRestRequestResponse;
  LObjectOwner: Boolean;
begin
  LURL := AURL;
  LURL := LURL + ACachePath;
  if ARequestFilter <> '' then
  begin
    if not System.StrUtils.EndsText('/', LUrl) then
      LUrl := LUrl + '/';
    if ARequestFilter[1] = '?' then
      LUrl := LUrl + ARequestFilter
    else
      LUrl := LUrl + '?' + ARequestFilter;
  end;

  LRequest := TDSRestRequest.Create(AHTTP);
  try
    LRequest.open(LRequestType, LUrl, LUserName, LPassword);

    Lrequest.Accept := 'application/JSON'; // Do not localize
    Lrequest.SetRequestHeader('Content-Type', 'text/plain;charset=UTF-8');  // Do not localize
    Lrequest.SetRequestHeader('If-Modified-Since', 'Mon, 1 Oct 1990 05:00:00 GMT');  // Do not localize
    if ASessionId <> '' then
      Lrequest.SetRequestPragma(sDSSessionEquals + ASessionId);

    LResponseText := LRequest.send('');
    try
    if LResponseText.SessionExpired then
      LSessionExpired
    else
      LSetSessionID(LResponseText.SessionID);

    if Assigned(AResponseStreamProc) then
    begin
      LObjectOwner := False;
      AResponseStreamProc(LResponseText.GetStream, LResponseText.ResponseCharSet, LObjectOwner);
      if not LObjectOwner then
        LResponseText.GetStream(False);
    end;
    finally
      LResponseText.Free;
    end;
  finally
    LRequest.Free;
  end;
end;


{ TDSCustomRestConnection }

procedure TDSCustomRestConnection.AfterExecute;
begin
  if Assigned(OnAfterExecute) then
    OnAfterExecute(Self);
end;

procedure TDSCustomRestConnection.AssignTo(Dest: TPersistent);
begin
  if Dest is TDSCustomRestConnection then
  begin
    TDSCustomRestConnection(Dest).Host := Host;
    TDSCustomRestConnection(Dest).Port := Port;
    TDSCustomRestConnection(Dest).UrlPath := UrlPath;
    TDSCustomRestConnection(Dest).UserName := UserName;
    TDSCustomRestConnection(Dest).Password := Password;
    TDSCustomRestConnection(Dest).Context := Context;
    TDSCustomRestConnection(Dest).SessionID := SessionID;
    TDSCustomRestConnection(Dest).PreserveSessionID := PreserveSessionID;
    TDSCustomRestConnection(Dest).OnLogin := OnLogin;
    TDSCustomRestConnection(Dest).OnValidatePeerCertificate := OnValidatePeerCertificate;
  end
  else
    inherited;
end;

procedure TDSCustomRestConnection.BeforeExecute;
begin
  if not PreserveSessionID then
    SessionID := '';
  if Assigned(OnBeforeExecute) then
    OnBeforeExecute(Self);
end;

constructor TDSCustomRestConnection.Create(AOwner: TComponent);
begin
  inherited;
  FProxyPort := 8888;
  FLoginProperties := TDSRestLoginProperties.Create;
  FPreserveSessionID := True;
  LoginPrompt := True;
  FIPImplementationID := '';
  FConnectionKeepAlive := 'Keep-Alive';
end;

function TDSCustomRestConnection.CreateCommand: TDSRestCommand;
begin
  Result := TDSRestCommand.Create(Self);
end;

procedure TDSCustomRestConnection.DefineProperties(Filer: TFiler);

  function DesignerDataStored: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := TDSCustomRestConnection(Filer.Ancestor).UniqueId <> UniqueId else
      Result := UniqueId <> '';
  end;

begin
  inherited;
  Filer.DefineProperty('UniqueId', ReadUniqueId, WriteUniqueId,
    DesignerDataStored);
end;

destructor TDSCustomRestConnection.Destroy;
begin
  FLoginProperties.Free;
  FHTTP.Free;
  inherited;
end;

function TDSCustomRestConnection.GetConnection: String;
begin
  if Assigned(FHTTP) then
    Result := HTTP.Request.Connection
  else
    Result := FConnectionKeepAlive;
end;

function TDSCustomRestConnection.GetHTTP: TDSHTTP;
var
  LProtocol: string;
begin
  if FHTTP = nil then
  begin
    LProtocol := DefaultProtocol;
    FHTTP := TDSHTTP.ProtocolClass(LProtocol).Create(nil, FIPImplementationID); // call virtual constructor
    FHTTP.OnValidatePeerCertificate := FOnValidateCertificate;
    FHTTP.Request.Connection := FConnectionKeepAlive;
    FHTTP.HTTPOptions := [hoKeepOrigProtocol];
    FHTTP.ProxyParams.ProxyServer := FProxyHost;
    FHTTP.ProxyParams.ProxyPort := FProxyPort;
    FHTTP.ProxyParams.ProxyUsername := FProxyUsername;
    FHTTP.ProxyParams.ProxyPassword := FProxyPassword;
    FHTTP.ProxyParams.BasicAuthentication := FProxyUsername <> EmptyStr;
  end;
  Result := FHTTP;
end;

function TDSCustomRestConnection.GetLoginPrompt: Boolean;
begin
  if not (csDesigning in ComponentState) then
    Result := FLoginProperties.LoginPrompt
  else
    Result := FLoginPrompt;
end;

function TDSCustomRestConnection.GetPassword: string;
begin
  if not (csDesigning in ComponentState) then
    Result := FLoginProperties.Password
  else
    Result := FPassword;
end;

function TDSCustomRestConnection.GetProxyHost: String;
begin
  if Assigned(FHTTP) then
    Result := HTTP.ProxyParams.ProxyServer
  else
    Result := FProxyHost;
end;

function TDSCustomRestConnection.GetProxyPassword: String;
begin
  if Assigned(FHTTP) then
    Result := HTTP.ProxyParams.ProxyPassword
  else
    Result := FProxyPassword;
end;

function TDSCustomRestConnection.GetIPImplementationID: string;
begin
  if Assigned(FHTTP) then
    Result := HTTP.IPImplementationID
  else
    Result := FIPImplementationID;
end;

function TDSCustomRestConnection.GetProxyPort: Integer;
begin
  if Assigned(FHTTP) then
    Result := HTTP.ProxyParams.ProxyPort
  else
    Result := FProxyPort;
end;

function TDSCustomRestConnection.GetProxyUsername: String;
begin
  if Assigned(FHTTP) then
    Result := HTTP.ProxyParams.ProxyUsername
  else
    Result := FProxyUsername;
end;

function TDSCustomRestConnection.DefaultProtocol: string;
begin
  if FProtocol = '' then
    Result := 'http'
  else
    Result := FProtocol;
end;

function TDSCustomRestConnection.GetUserName: string;
begin
  if not (csDesigning in ComponentState) then
    Result := FLoginProperties.Username
  else
    Result := FUserName;
end;

function TDSCustomRestConnection.GetOnValidatePeerCertificate: TValidateCertificate;
begin
  if FHTTP <> nil then
    Result := FHTTP.OnValidatePeerCertificate
  else
    Result := FOnValidateCertificate;
end;

procedure TDSCustomRestConnection.ReadUniqueId(Reader: TReader);
begin
  FUniqueID := Reader.ReadString;
end;

procedure TDSCustomRestConnection.SessionExpired;
begin
  FSessionID := '';
end;

procedure TDSCustomRestConnection.SetConnection(const KeepAlive: String);
begin
  FConnectionKeepAlive := KeepAlive;
  if Assigned(FHTTP) then
    HTTP.Request.Connection := KeepAlive;
end;

procedure TDSCustomRestConnection.SetContext(const Value: string);
begin
  if (Value <> EmptyStr) and
     (Value[Length(Value)] <> '/') then
      FContext := FContext + '/'
  else
    FContext := Value;
end;

procedure TDSCustomRestConnection.SetLoginPrompt(const Value: Boolean);
begin
  FLoginPrompt := Value;
  FLoginProperties.LoginPrompt := Value;
end;

procedure TDSCustomRestConnection.SetPassword(const Value: string);
begin
  FPassword := Value;
  FLoginProperties.Password := Value;
end;

procedure TDSCustomRestConnection.SetProtocol(const Value: string);
begin
  if FProtocol <> Value then
    Reset;
  FProtocol := Value;
end;

procedure TDSCustomRestConnection.SetProxyHost(const Value: String);
begin
  FProxyHost := Value;
  if Assigned(FHTTP) then
    HTTP.ProxyParams.ProxyServer := Value
end;

procedure TDSCustomRestConnection.SetProxyPassword(const Value: String);
begin
  FProxyPassword := Value;
  if Assigned(FHTTP) then
    HTTP.ProxyParams.ProxyPassword := Value
end;

procedure TDSCustomRestConnection.SetIPImplementationID(const Value: string);
begin
  if FIPImplementationID <> Value then
  begin
    if Assigned(FHTTP) then
      raise TDSRestException.Create(sCannotChangeIPImplID);
    FIPImplementationID := Value;
  end;
end;

procedure TDSCustomRestConnection.SetProxyPort(const Value: Integer);
begin
  FProxyPort := Value;
  if Assigned(FHTTP) then
    HTTP.ProxyParams.ProxyPort := Value;
end;

procedure TDSCustomRestConnection.SetProxyUsername(const Value: String);
begin
  FProxyUsername := Value;
  if Assigned(FHTTP) then
  begin
    HTTP.ProxyParams.ProxyUsername := Value;
    HTTP.ProxyParams.BasicAuthentication := Value <> EmptyStr;
  end;
end;

procedure TDSCustomRestConnection.Reset;
begin
  FreeAndNil(FHTTP);
end;

procedure TDSCustomRestConnection.SetUserName(const Value: string);
begin
  if FUserName <> Value then
  begin
    SessionID := '';
    FUserName := Value;
    FLoginProperties.UserName := Value;
  end;
end;

procedure TDSCustomRestConnection.SetOnValidatePeerCertificate(
  const Value: TValidateCertificate);
begin
  FOnValidateCertificate := Value;
  if FHTTP <> nil then
    FHTTP.OnValidatePeerCertificate := Value;
end;

procedure TDSCustomRestConnection.TestConnection(
  AOptions: TDSTestConnectionOptions);
var
  LSaveLoginPrompt: Boolean;
  LClient: TDSAdminRestClient;
  LPlatformName: string;
begin
  LSaveLoginPrompt := LoginProperties.LoginPrompt;
  if toNoLoginPrompt in AOptions then
    LoginProperties.LoginPrompt := False;
  try
    LClient := TDSAdminRestClient.Create(Self);
    try
      LPlatformName := LClient.GetPlatformName;
      if LPlatformName = '' then
        raise TDSRestException.Create(sUnexpectedResult);
    finally
      LClient.Free;
    end;
  finally
    if toNoLoginPrompt in AOptions then
      LoginProperties.LoginPrompt := LSaveLoginPrompt;
    try
      Self.HTTP.Disconnect;
    except
    end;
  end;
end;

procedure TDSCustomRestConnection.WriteUniqueId(Writer: TWriter);
begin
  Writer.WriteString(FUniqueID);
end;

function TDSCustomRestConnection.Login: Boolean;
var
  LCancel: Boolean;

  function Login: Boolean;
  begin
    Result := (not (csDesigning in ComponentState)) and Assigned(FOnLogin);
    if Result then FOnLogin(Self, FLoginProperties, LCancel);
  end;

begin
  LCancel := False;
  if not Login then
  begin
    if Assigned(DSRestLoginDialogProc) then
    begin
      if not DSRestLoginDialogProc(Self, FLoginProperties, LoginDialogTestConnection) then
        LCancel := True;
    end;
  end;
  Result := not LCancel;
end;


procedure TDSCustomRestConnection.LoginDialogTestConnection;
begin
  TestConnection([toNoLoginPrompt]);
end;

{ TDSRestRequest }

procedure TDSRestRequest.open(const requestType, url, userName, password: string);
begin
  FHeaders := TDictionary<string, string>.Create;
  FRequestType := UpperCase(requestType);
  FUrl := url;
  FUserName := userName;
  FPassword := password;
end;

destructor TDSRestRequest.Destroy;
begin
  inherited;
  FHeaders.Free;
  if FFreeResponseStream then
    FResponseStream.Free;
end;

function TDSRestRequest.send(const paramToSend: string): TDSRestRequestResponse;
var
  LStream: TStream;
  LResponseText: string;
  LJSONValue: TJSONValue;
  LErrorMessage: string;
begin
  Result := nil;
  LStream := nil;
  try
    if FResponseStream = nil then
      FResponseStream := TMemoryStream.Create;
    if (FRequestType = 'GET') or (FRequestType = '') then
      SendGetRequest(LResponseText, FStatus, LErrorMessage)
    else if FRequestType = 'PUT' then
    begin
      LStream := TStringStream.Create(paramToSend, TEncoding.UTF8);
      SendPutRequest(LStream, LResponseText, FStatus, LErrorMessage);
    end
    else if FRequestType = 'POST' then
    begin
      LStream := TStringStream.Create(paramToSend, TEncoding.UTF8);
      SendPostRequest(LStream, LResponseText, FStatus, LErrorMessage);
    end
    else if FRequestType = 'DELETE' then
      SendDeleteRequest(LResponseText, FStatus, LErrorMessage)
    else
      raise TDSRestException.CreateFmt(SUnexpectedRequestType, [FRequestType]);
    //handle session timeouts (status = 403) and other session and authorization related errors
    if FStatus = 403 then
    begin
      Result := TDSRestRequestResponse.Create(GetResponseStream(False), FResponseCharSet, '', False);
      try
        Result.FIPImplementationID := FHTTP.IPImplementationID;
        LJSONValue := TJSONObject.ParseJSONValue(BytesOf(Result.StringValue), 0);
        if (LJSONValue <> nil) and (LJSONValue is TJSONObject) and
          (TJSONObject(LJSONValue).Get('SessionExpired') <> nil) then
          FResponseSessionExpired := True;
      finally
        FreeAndNil(Result);
      end;
    end;
    if (FStatus <> 200) and (FStatus <> 201) and (FStatus <> 202) then
      raise TDSRestProtocolException.Create(FStatus, LResponseText, LErrorMessage);
    Result := TDSRestRequestResponse.Create(GetResponseStream(False), FResponseCharSet, FResponseSessionID,
      FResponseSessionExpired);
    Result.FIPImplementationID := FHTTP.IPImplementationID;
  finally
    LStream.Free;
  end;
end;

procedure TDSRestRequest.setRequestHeader(const AName, AValue: string);
begin
  if not FHeaders.ContainsKey(AName) then
    FHeaders.Add(AName, AValue)
  else
    FHeaders[AName] := AValue;
end;

procedure TDSRestRequest.setRequestPragma(const AValue: string);
begin
  FRequestPragma := AValue;
end;

constructor TDSRestRequest.Create(AHTTP: TDSHTTP);
begin
  FFreeResponseStream := True;
  FHTTP := AHTTP;
end;

function TDSRestRequest.GetHTTP: TDSHTTP;
var
  P: TPair<string, string>;
begin
  Result := FHTTP;
  Result.Request.Accept := Accept;
  if Result.Request.Authentication <> nil then
  begin
    Result.Request.Authentication.Username := FUserName;
    Result.Request.Authentication.Password := FPassword;
  end
  else
    Result.SetBasicAuthentication(FUserName, FPassword);
  FResponseStream.Size := 0;
  Result.Request.CustomHeaders.Clear;
  for P in FHeaders do
    Result.Request.CustomHeaders.AddValue(P.Key, P.Value);
  Result.Request.Pragma := FRequestPragma;
end;

function TDSRestRequest.GetResponseStream(AOwnsObject: Boolean): TStream;
begin
  Result := FResponseStream;
  if (Result <> nil) and (not AOwnsObject) then
    FFreeResponseStream := False;
end;

procedure TDSRestRequest.DoRequest(var response: string; out responseCode: Integer; out errorMessage: string;
  ACallback: TProc<TDSHTTP>);
var
  Http: TDSHTTP;
  LPragma: string;
  LPos: Integer;
begin
  errorMessage := '';
  Http := GetHTTP;
  try
    ACallback(Http);
    FResponseCharSet := Http.Response.Charset;
    responseCode := http.ResponseCode;
    //FResponseSessionID := Http.Response.CustomHeaders.Values['dssession'];
    LPragma := Http.Response.Pragma;
    LPos := Pos(sDSSessionEquals, LPragma);
    if LPos > 0 then
    begin
      LPragma := Copy(LPragma, LPos+Length(sDSSessionEquals), MaxInt);
      LPos := Pos(',', LPragma);
      if LPos > 0 then
        Delete(LPragma, LPos, MaxInt);
      FResponseSessionID := LPragma;
    end
    else
      FResponseSessionID := '';
  except
    on PE: EIPHTTPProtocolExceptionPeer do
    begin
      responseCode := PE.ErrorCode;
      errorMessage := PE.ErrorMessage;
      response := PE.Message;
    end;
    on E: Exception do
      raise;
  end;
end;

procedure TDSRestRequest.SendGetRequest(var response: string; out responseCode: Integer; out errorMessage: string);
begin
  DoRequest(response, responseCode, errorMessage,
    procedure(Http: TDSHTTP)
    begin
      Http.Get(FURL, FResponseStream);
    end
    );
end;

procedure TDSRestRequest.SendPutRequest(datastream: TStream; var response: string; out responseCode: Integer; out errorMessage: string);
begin
  DoRequest(response, responseCode, errorMessage,
    procedure(Http: TDSHTTP)
    begin
      Http.Put(FURL, dataStream, FResponseStream);
    end
    );
end;

procedure TDSRestRequest.SendPostRequest(datastream: TStream; var response: string; out responseCode: Integer; out errorMessage: string);
begin
  DoRequest(response, responseCode, errorMessage,
    procedure(Http: TDSHTTP)
    begin
      http.Post(FURL, dataStream, FResponseStream);
    end
    );
end;

procedure TDSRestRequest.SendDeleteRequest(var response: string; out responseCode: Integer; out errorMessage: string);
begin
  DoRequest(response, responseCode, errorMessage,
    procedure(Http: TDSHTTP)
    begin
      http.Delete(FURL, FResponseStream);
    end
    );
end;

{ TDSRestRequestResponse }

constructor TDSRestRequestResponse.Create(const AStream: TStream;
  const AResponseCharSet, ASessionID: string; ASessionExpired: Boolean);
begin
  FFreeStreamValue := True;
  AStream.Position := 0;
  FStreamValue := AStream;
  FResponseCharSet := AResponseCharSet;
  FSessionID := ASessionID;
  FSessionExpired := ASessionExpired;
end;

function TDSRestRequestResponse.GetStringValue: string;
begin
  if not FHaveString then
  begin
    FHaveString := True;
    FStreamValue.Position := 0;
    FStringValue := IPProcs(FIPImplementationID).ReadStringAsCharset(FStreamValue, FResponseCharset);
  end;
  Result := FStringValue;
end;

destructor TDSRestRequestResponse.Destroy;
begin
  if FFreeStreamValue then
    FreeAndNil(FStreamValue);
  inherited;
end;

function TDSRestRequestResponse.GetStream(AObjectOwner: Boolean): TStream;
begin
  Result := FStreamValue;
  if not AObjectOwner then
    FFreeStreamValue := False;
end;

{ TDSRestLoginProperties }

procedure TDSRestLoginProperties.AssignTo(Dest: TPersistent);
begin
  if Dest is TDSRestLoginProperties then
  begin
    TDSRestLoginProperties(Dest).UserName := UserName;
    TDSRestLoginProperties(Dest).Password := Password;
    TDSRestLoginProperties(Dest).LoginPrompt := LoginPrompt;
  end
  else
    inherited;
end;

(*
 * Class for registering a callback which will update callbacks on the client when invoked from
 * the server. A channel on the server is a manager for a specific object on the source which can
 * send out notifications. Registering a client callback hooks that callback in to be notified
 * of changes by the server.
 * @param AChannelId the unique identifier for this client channel (callback)
 * @param AServerChannelName the unique name of the server channel
 * @param AConnection TDSRestConnection
 *)
constructor TDSRestClientChannel.Create(const AChannelId, AServerChannelName: string; AConnection: TDSCustomRestConnection);
begin
  FConnection := AConnection;
  FCallbacks := TObjectList<TDSRestClientCallback>.Create(True (* Owns *));
  FServerChannelName := AServerChannelName;
  FCallbackLoop := nil;
  FChannelId := AChannelId;
  FChannelEvent := nil;
end;

(*
 * Registers a client callback with the server.
 * @param AClientCallback an instance of TClientCallback
 *)
procedure TDSRestClientChannel.RegisterCallback(AClientCallback: TDSRestClientCallback);
var
  LClient: TDSAdminRestClient;
begin
  if not Connected then
  begin
    Connect(AClientCallback);
    Exit;
  end;

  TMonitor.Enter(FCallbacks);
  try
    if (FCallbackLoop <> nil) then 
    begin
      if not FCallbacks.Contains(AClientCallback) then
        FCallbacks.Add(AClientCallback);
      LClient :=  TDSAdminRestClient.Create(FConnection, False);
      try
        if LClient.RegisterClientCallbackServer(FchannelId, AClientCallback.callbackId,
                                                AClientCallback.ChannelNames.CommaText) then
          NotifyEvent(rCallbackAdded, AClientCallback);
      finally
       LClient.Free;
      end;
    end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

(*
 * Unregisters a client callback from the server.
 * @param AClientCallback the callback to unregister
 *)
procedure TDSRestClientChannel.UnregisterCallback(AClientCallback: TDSRestClientCallback);
var
  LClient: TDSAdminRestClient;
  LCallbackId: string;
begin
  TMonitor.Enter(FCallbacks);
  try
    LCallbackId := AClientCallback.CallbackId;
    NotifyEvent(rCallbackRemoved, AClientCallback);

    // Frees AClientCallback
    FCallbacks.Remove(AClientCallback);
    LClient :=  TDSAdminRestClient.Create(FConnection, False);
    try
      LClient.UnregisterClientCallback(FchannelId, LCallbackId);
    finally
      LClient.Free;
    end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

(*
 * Connects the client channel, registering a callback, as the channel can only
 * be open if at least one callback is registered.
 * @param AFirstCallback an instance of TClientCallback
 *)
procedure TDSRestClientChannel.Connect(AFirstCallback: TDSRestClientCallback);
begin
  TMonitor.Enter(FCallbacks);
  try
    if (FCallbackLoop <> nil) then
    begin
      FCallbackLoop.Stop;
      FreeAndNil(FCallbackLoop);
    end;
    FCallbacks.Clear;
    FCallbacks.Add(AFirstCallback);
    FCallbackLoop := TDSRestCallbackLoop.Create(Self, FConnection);
    FCallbackLoop.Start(AFirstCallback);

    NotifyEvent(rChannelCreate, AFirstCallback);
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

(*
 * Unregisters all callbacks and disconnect the channel.
 *)
procedure TDSRestClientChannel.Disconnect;
begin
  try
    if (FCallbackLoop <> nil) and (not FCallbackLoop.Stopped) then
    begin
      FCallbackLoop.Stop;
    end;
  finally
    if FCallbacks <> nil then
      FCallbacks.Clear;
  end;
end;

procedure TDSRestClientChannel.UnregisterAllCallbacks;
begin
  TMonitor.Enter(FCallbacks);
  try
   while FCallbacks.Count > 0 do
     UnregisterCallback(FCallbacks[0]);
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

procedure TDSRestClientChannel.EnumerateCallbacks(AMethod: TFunc<TDSRestClientCallback, Boolean>);
var
  LCallback: TDSRestClientCallback;
begin
  TMonitor.Enter(FCallbacks);
  try
   for LCallback in FCallbacks do
     if not AMethod(LCallback) then
       break;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

procedure TDSRestClientChannel.EnumerateCallbacks(AMethod: TProc<TDSRestClientCallback>);
var
  LCallback: TDSRestClientCallback;
begin
  TMonitor.Enter(FCallbacks);
  try
   for LCallback in FCallbacks do
     AMethod(LCallback);
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSRestClientChannel.GetConnected: Boolean;
begin
  Result := (FCallbackLoop <> nil) and (not FCallbackLoop.Stopped)
end;

function TDSRestClientChannel.GetSessionId: String;
begin
  if FCallbackLoop <> nil then
    Result := FCallbackLoop.SessionId
  else if FConnection <> nil then
    Result := FConnection.SessionID;
end;

destructor TDSRestClientChannel.Destroy;
begin
  if (FCallbackLoop <> nil) and (not FCallbackLoop.Stopped) then
    Disconnect; // Blocks until thread is terminated
  FreeAndNil(FCallbacks);
  FreeAndNil(FCallbackLoop);
  inherited;
end;

(*
 * Broadcasts a message to all registered callbacks of the server channel
 * this ClientChannel is registered with.
 * @param AMessage the message to broadcast
 * @param AChannelName the channel to broadcast to, or empty string to use ServerChannelName
 * @return true if the message was sent successfully to the server (but not neccessarally all callbacks,)
 *         false otherwise
 *)
function TDSRestClientChannel.Broadcast(AMessage: TJSONValue; AChannelName: String): Boolean;
var
  LClient: TDSAdminRestClient;
begin
  if AChannelName = EmptyStr then
    AChannelName := FServerChannelName;

  if (AMessage <> nil) and (AChannelName <> EmptyStr) then
  begin
    LClient := TDSAdminRestClient.Create(FConnection, False);
    try
      Result := LClient.BroadcastToChannel(AChannelName, AMessage)
    finally
      LClient.Free;
    end;
  end
  else
    Result := False;
end;

(*
 * Sends a notification message to a single callback of a specific ClientChannel.
 * Note that if you try to notify a callback of this ClientChannel no trip to the
 * server will be made to perform this.
 * @param AClientId the unique ID of ClientChannel the callback to notify is in
 * @param ACallbackId the unique ID of the callback to notify
 * @param AMessage the message to notify the callback with
 * @return true if notification was successful,
 *         false otherwise
 *)
function TDSRestClientChannel.Notify(const AClientId, ACallbackId: string; AMessage: TJSONValue): Boolean;
var
  LResponse: TJSONValue;
  LClient: TDSAdminRestClient;
  LCurCallback: TDSRestClientCallback;
begin
  if (AClientId = '') or (ACallbackId = '') or (AMessage = nil) then
    Exit(false);

  if AClientId = FChannelId then
  begin
    TMonitor.Enter(FCallbacks);
    try
      for LCurCallback in FCallbacks do
      begin
        if LCurCallback.CallbackId = ACallbackId then
        begin
          Exit(LCurCallback.ClientCallbackFunction(AMessage, ''));
        end;
      end;
    finally
      TMonitor.Exit(FCallbacks);
    end;
    Exit(False);
  end;
  LClient := TDSAdminRestClient.Create(FConnection, False);
  try
    Result := LClient.NotifyCallback(AClientId, ACallbackId, AMessage, LResponse);
  finally
    LClient.Free;
  end;
end;

procedure TDSRestClientChannel.NotifyEvent(EventType: TDSRESTChannelEventType;
                                           Callback: TDSRestClientCallback);
var
  Event: TDSRESTChannelEventItem;
begin
  //If the channel is stopped then only the channel create event should be sent
  if FStopped and (EventType <> rChannelCreate) then
    Exit;

  //if the current event is a stop event, then mark the channel as stopped
  FStopped := (EventType = rChannelClose) or (EventType = rChannelClosedByServer);
  
  if Assigned(FChannelEvent) then
  begin
    Event.EventType := EventType;
    Event.ClientChannelId := FChannelId;
    Event.ClientChannelName := FServerChannelName;
    Event.ClientChannel := Self;
    Event.Callback := Callback;
    if Callback <> nil then
      Event.CallbackId := Callback.CallbackId;

    try
      FChannelEvent(Event);
    except
    end;
  end;
end;

constructor TDSRestCallbackLoop.Create(AClientChannel: TDSRestClientChannel;
                                       AConnection: TDSCustomRestConnection);
begin
  // Clone connection to use on a separate thread
  FConnection := TDSCustomRestConnection(TComponentClass(AConnection.ClassType).Create(nil));
  FConnection.Assign(AConnection);
  if not FConnection.PreserveSessionID then
    FConnection.SessionID := '';
  FClientChannel := AClientChannel;
end;

destructor TDSRestCallbackLoop.Destroy;
begin
  FreeAndNil(FThread);
  FreeAndNil(FConnection);
  inherited;
end;

function TDSRestCallbackLoop.GetSessionId: String;
begin
  if FConnection <> nil then
    Result := FConnection.SessionID;
end;

function TDSRestCallbackLoop.GetStopped: Boolean;
begin
  Result := (FThread = nil) or (FThread.Finished);
end;

(*
 * The callback which will handle a value passed in from the server
 *)
procedure TDSRestCallbackLoop.Callback(responseValue: TJSONValue; var AStatus: Boolean; var AStop: Boolean);
var
  LParamArray: TJSONArray;
  LParamValue: TJSONValue;
  LDataType: string;
  LResponseObject: TJSONObject;
  LCallbackKey: string;
  LStatus: PBoolean;
  LBroadcastChannel: String;
  LDoForAll: Boolean;
begin
  AStop := False;
  AStatus := True;
  if (not Self.Stopped) and (responseValue <> nil) then
  begin
    //code which resolves the true response object
    if (responseValue is TJSONObject) and (TJSONObject(responseValue).Get('result') <> nil) then
       responseValue := TJSONObject(responseValue).Get('result').JSONValue;
    if responseValue is TJSONArray then
      responseValue := TJSONArray(responseValue).Get(0);
    LResponseObject := TJSONObject(responseValue);
    //session expired, so notify local callbacks and then stop the loop
    if LResponseObject.Get('SessionExpired') <> nil then
    begin
      clientChannel.EnumerateCallbacks(
        procedure(ACallback: TDSRestClientCallback)
        begin
          ACallback.ClientCallbackFunction(LResponseObject,'');
        end);
      AStop := True;
      clientChannel.NotifyEvent(rChannelClosedByServer, nil);
    end
    //broadcast to all of the callbacks
    else if (LResponseObject.Get('broadcast') <> nil) then
    begin
      LParamArray := TJSONArray(LResponseObject.Get('broadcast').JSONValue);
      LParamValue := TJSONArray(LParamArray.Get(0));

      if LResponseObject.Get('channel') <> nil then
        LBroadcastChannel := LResponseObject.Get('channel').JsonValue.Value
      else
        LBroadcastChannel := FClientChannel.ServerChannelName;

      //used to determine if the paramValue is (on the server) a JSONValue or a TObject
      LDataType := LParamArray.Get(1).Value;

      LDoForAll := LBroadcastChannel = FClientChannel.ServerChannelName;

      clientChannel.EnumerateCallbacks(
        procedure(ACallback: TDSRestClientCallback)
        begin
          if LDoForAll or (ACallback.ChannelNames.IndexOf(LBroadcastChannel) > -1) then
            ACallback.ClientCallbackFunction(LParamValue, LDataType);
        end);
      AStatus := True;
    end
    //Invoke the specified callback
    else if LResponseObject.Get('invoke') <> nil then
    begin
      LParamArray := TJSONArray(LResponseObject.Get('invoke').JSONValue);
      LCallbackKey := LParamArray.Get(0).Value;
      LParamValue := TJSONArray(LParamArray.Get(1));

      //used to determine if the paramValue is (on the server) a JSONValue or a TObject
      LDataType := LParamArray.Get(2).Value;

      LStatus := @AStatus;
      clientChannel.EnumerateCallbacks(
        function(ACallback: TDSRestClientCallback): Boolean
        begin
          if ACallback.callbackId = LCallbackKey then
          begin
            LStatus^ := ACallback.ClientCallbackFunction(LParamValue, LDataType);
            Result := False; // Stop enumeration
          end
          else
            Result := True; // continue enumeration
        end);
    end
    //if an error has occured notify the callbacks and stop the loop
    else if LResponseObject.Get('error') <> nil then
    begin
      clientChannel.EnumerateCallbacks(
        procedure(ACallback: TDSRestClientCallback)
        begin
          ACallback.ClientCallbackFunction(LResponseObject, 'error');
        end);
      AStop := True;
      clientChannel.NotifyEvent(rChannelClosedByServer, nil);
    end
    //If the result key is 'close' or 'closeChannel' then no response should be sent, which means
    //the recursion of this loop will end. Otherwise, send a response to the server with
    //a value of false so the loop will continue and the server will know the invocation failed
    else if (LResponseObject.Get('closeChannel') = nil) and (LResponseObject.Get('close') = nil) then
    begin
      AStatus := False;
    end
    else
    begin
      AStop := True;
      clientChannel.NotifyEvent(rChannelClose, nil);
    end
  end
  else
  begin
    if Self.Stopped then
      clientChannel.NotifyEvent(rChannelClosedByServer, nil);
    AStop := True;
  end;
end;


type
  TCallbackLoopWorker = procedure(AResponseValue: TJSONValue; var AStatus: Boolean; var AStop: Boolean) of object;
  TCallbackLoopThread = class(TThread)
  private
    FConnection: TDSCustomRestConnection;
    FChannelName: string;
    FClientManagerId: string;
    FCallbackId: string;
    FCallbackChannelNames: String;
    FWorker: TCallbackLoopWorker;
    FOnTerminateDirect: TProc;
    constructor Create(AWorker: TCallbackLoopWorker;
      AConnection: TDSCustomRestConnection; AChannelName, AClientManagerId, ACallbackId,
      ACallbackChannelNames: string);
  protected
    procedure Execute; override;
  end;

constructor TCallbackLoopThread.Create(AWorker: TCallbackLoopWorker;
  AConnection: TDSCustomRestConnection; AChannelName, AClientManagerId,
  ACallbackId, ACallbackChannelNames: string);
begin
  FWorker := AWorker;
  FConnection := AConnection;
  FChannelName := AChannelName;
  FClientManagerId := AClientManagerId;
  FCallbackId := ACallbackId;
  FCallbackChannelNames := ACallbackChannelNames;
  inherited Create(True);
end;

procedure TCallbackLoopThread.Execute;
var
  LClient: TDSAdminRestClient;
  LJSONValue: TJSONValue;
  LStatus: Boolean;
  LStopped: Boolean;
  LStatusValue: TJSONValue;
  LTrue: TJSONTrue;
  LFalse: TJSONFalse;
begin
  LTrue := TJSONTrue.Create;
  LFalse := TJSONFalse.Create;
  LClient :=  TDSAdminRestClient.Create(FConnection, False);
  try
    // Block until the server responds
    LJSONValue := LClient.ConsumeClientChannel(FChannelName, FClientManagerId, FCallbackId,
                                               FCallbackChannelNames, nil);
    try
      FWorker(LJSONValue, LStatus, LStopped);
    finally
      LJSONValue.Free;
    end;
    while not LStopped do
    begin
      if LStatus then
        LStatusValue := TJSONTrue.Create
      else
        LStatusValue := TJSONFalse.Create;
      try
        // Must pass '' when using an existing channel
        // Block until the server responds
        LJSONValue := LClient.ConsumeClientChannel(FChannelName, FClientManagerId, EmptyStr, EmptyStr, LStatusValue);
        try
          FWorker(LJSONValue, LStatus, LStopped);
        finally
          LJSONValue.Free;
        end;
      finally
        LStatusValue.Free;
      end;
    end;
  finally
    LClient.Free;
    LTrue.Free;
    LFalse.Free;
    if Assigned(FOnTerminateDirect) then
      FOnTerminateDirect;
  end;
end;

(*
 * Starts the loop, registering the client callback on the server and the initial client callback specified
 * @param firstCallback the first callback to register, as you can't register a client with the server without specifying the first callback
 *)
procedure TDSRestCallbackLoop.Start(AFirstCallback: TDSRestClientCallback);
begin
  if Stopped and (FClientChannel <> nil) then
  begin
    FreeAndNil(FThread);
    FThread := TCallbackLoopThread.Create(Self.Callback,
      FConnection, FClientChannel.ServerChannelName, FClientChannel.ChannelId,
      AFirstCallback.CallbackId, AFirstCallback.ChannelNames.CommaText);
    TCallbackLoopThread(FThread).FOnTerminateDirect := OnThreadTerminateDirect;
    FThread.FreeOnTerminate := False;
    FThread.Start;
  end;
end;

procedure TDSRestCallbackLoop.OnThreadTerminateDirect;
begin
  FClientChannel.NotifyEvent(rChannelClosedByServer, nil);
  if Assigned(FClientChannel.FOnDisconnect) then
    FClientChannel.FOnDisconnect(FClientChannel);
end;

(*
 * Tells the thread to terminate. The thread will still be hung waiting for a response from the server, but
 * once it gets that it will disregard the server command and not send another http request. This also
 * sends a command to the server, telling it that the client wishes to be unregistered.
 *)
procedure TDSRestCallbackLoop.Stop;
var
  LClient: TDSAdminRestClient;
  LConnection: TDSCustomRestConnection;
begin
  //insure stop is not called while another thread is already invoking stop.
  if not FStopping then
  begin
    FStopping := True;
    try
      if (not Stopped) and (FClientChannel <> nil) then
      begin
        // Must use another connection because FConnection is currently
        // waiting for a response
        LConnection := TDSCustomRestConnection(TComponentClass(FConnection.ClassType).Create(nil));
        try
          LConnection.Assign(FConnection);
          if not LConnection.PreserveSessionID then
            LConnection.SessionId := '';
          LClient :=  TDSAdminRestClient.Create(LConnection, False);
          try
            LClient.CloseClientChannel(FClientChannel.ChannelId);
            FClientChannel.FCallbacks.Clear;
          finally
            LClient.Free;
          end;
        finally
          LConnection.Free;
        end;
      end;
      try
        // Block until thread is terminated
        if (FThread <> nil) and (not FThread.Finished) then
          FThread.WaitFor;
      except
      end;
    finally
      FStopping := False;
    end;
  end;
end;

(*
 * AClientChannel is an instance of the ClientChannel class which is intended to contain the callback. It isn't
 * guaranteed this containment will actually exist. To do so, you will need to call either the
 * "connect" or "registerCallback" function of the ClientChannel instance with this callback
 * as a parameter to create the containment relationship.
 * ACallbackId is the unique ID of this callback. This only needs to be unique on this particular client,
 * in this instance of ClientChannel and not across all instances of ClientChannel or all clients.
 * AClientCallbackFunction is the function to call for updating the callback and returning a JSON Value response back to the server.
 * @param value a JSON Value instance containing the formatted JSON properties required for updating the callback
 * @return a JSON value response to deliver to the server. This response will reflect the current
 *         state of the callback after the update.
 *)

constructor TDSRestClientCallback.Create(AClientChannel: TDSRestClientChannel; const ACallbackId: string;
      AClientCallbackFunction: TDSRestClientCallbackFunction; AChannelNames: TStrings);
begin
  FClientChannel := AClientChannel;
  FCallbackId := ACallbackId;
  FClientCallbackFunction := AClientCallbackFunction;

  FChannelNames := AChannelNames;
  if AChannelNames = nil then
    FChannelNames := TStringList.Create;
end;

// The above code is based on the javascript within CallbackFramework.js

{ TDSRestCachedItem }

constructor TDSRestCachedItem.Create(const AItemPath: string);
begin
  FItemPath := AItemPath;
  FOwnedObjects := TObjectList.Create(True);
end;

procedure TDSRestCachedItem.DeleteCommand(AConnection: TDSRestConnection);
var
  LCommand: TDSRestCacheCommand;
begin
  LCommand := TDSRestCacheCommand.Create(AConnection);
  try
    LCommand.ParameterPath := ItemPath;
    LCommand.DeleteCommand;
  finally
    LCommand.Free;
  end;
end;

destructor TDSRestCachedItem.Destroy;
begin
  FOwnedObjects.Free;
  inherited;
end;

function TDSRestCachedItem.GetCommand(AConnection: TDSRestConnection; AOwnsObject: Boolean = True): TJSONObject;
var
  LCommand: TDSRestCacheCommand;
begin
  LCommand := TDSRestCacheCommand.Create(AConnection);
  try
    LCommand.ParameterPath := ItemPath;
    Result := LCommand.GetCommand(False);
    if AOwnsObject then
      FOwnedObjects.Add(Result);
  finally
    LCommand.Free;
  end;
end;

function TDSRestCachedItem.GetItemPath: string;
begin
  Result := FItempath;
end;

function TDSRestCachedItem.GetJSONValueCallback(AConnection: TDSRestConnection; ACallback: TGetJSONValueCallback; AOwnsObject: Boolean; const ARequestFilter: string): TJSONValue;
var
  LCommand: TDSRestCacheCommand;
  LAccept: Boolean;
begin
  LAccept := False;
  Result := nil;
  LCommand := TDSRestCacheCommand.Create(AConnection);
  try
    LCommand.ParameterPath := ItemPath;
    LCommand.GetParameter(Result, ARequestFilter);
    try
      if Assigned(ACallback) then
        LAccept := ACallback(Result)
      else
        LAccept := True;
      if LAccept and AOwnsObject then
        OwnedObjects.Add(Result);
    finally
      if not LAccept then
        FreeAndNil(Result);
    end;
  finally
    LCommand.Free;
  end;
end;

function TDSRestCachedItem.UnmarshalValue<T>(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): T;
var
  AJSONValue: TJSONValue;
  AUnmarshal: TJSONUnMarshal;
begin
  Result := nil;
  AJSONValue := GetJSONValue(AConnection, True, ARequestFilter);
  if AJSONValue <> nil then
  begin
    AUnmarshal := TJSONConverters.GetJSONUnmarshaler;
    try
      Result := T(AUnmarshal.UnMarshal(AJSONValue));
      if (Result <> nil) and AOwnsObject then
        OwnedObjects.Add(TObject(Result));
    finally
      FreeAndNil(AUnmarshal)
    end
  end
end;

function TDSRestCachedItem.GetJSONValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TJSONValue;
begin
  Result :=
   (GetJSONValueCallback(AConnection,
    nil (* Callback *), AOwnsObject, ARequestFilter));
end;

{ TDSRestCachedJSONObject }

function TDSRestCachedJSONObject.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TJSONObject;
begin
  Result := TJSONObject
   (GetJSONValueCallback(AConnection,
    function(AValue: TJSONValue): Boolean
    begin
      Result := AValue is TJSONObject;
    end, AOwnsObject, ARequestFilter));
end;

{ TDSRestCachedJSONArray }

function TDSRestCachedJSONArray.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TJSONArray;
begin
  Result := TJSONArray
   (GetJSONValueCallback(AConnection,
    function(AValue: TJSONValue): Boolean
    begin
      Result := AValue is TJSONArray;
    end, AOwnsObject, ARequestFilter));
end;

{ TDSRestCachedJSONValue }

function TDSRestCachedJSONValue.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TJSONValue;
begin
  Result :=
   (GetJSONValueCallback(AConnection,
    function(AValue: TJSONValue): Boolean
    begin
      Result := AValue is TJSONValue;
    end, AOwnsObject, ARequestFilter));
end;

{ TDSRestCachedStream }

function TDSRestCachedStream.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TStream;
var
  LCommand: TDSRestCacheCommand;
begin
  Result := nil;
  LCommand := TDSRestCacheCommand.Create(AConnection);
  try
    LCommand.ParameterPath := ItemPath;
    LCommand.GetParameter(Result, False (* We own stream now *), ARequestFilter);
    if AOwnsObject and (Result <> nil) then
      OwnedObjects.Add(Result);
  finally
    LCommand.Free;
  end;
end;

{ TDSRestCachedDataSet }

function TDSRestCachedDataSet.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TDataSet;
var
  LReader: TDBXReader;
  LJSONTable: TJSONObject;
begin
  Result := nil;
  LJSONTable := TJSONObject
   (GetJSONValueCallback(AConnection,
    function(AValue: TJSONValue): Boolean
    begin
      Result := AValue is TJSONObject;
    end, False, ARequestFilter));
  try
    if LJSONTable <> nil then
    begin
      LReader := TDBXJSONTableReader.Create(nil, LJSONTable, True);
      LJSONTable := nil;
      try
        if LReader <> nil then
        begin
          Result := TCustomSQLDataSet.Create(nil, LReader, True);
          LReader := nil;
          Result.Open;
          if AOwnsObject then
            OwnedObjects.Add(Result);
        end;
      finally
        LReader.Free;
      end;
    end;
  finally
    LJSONTable.Free;
  end;
end;

{ TDSRestCachedParams }

function TDSRestCachedParams.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TParams;
var
  LReader: TDBXReader;
  LJSONTable: TJSONObject;
begin
  Result := nil;
  LJSONTable := TJSONObject
   (GetJSONValueCallback(AConnection,
    function(AValue: TJSONValue): Boolean
    begin
      Result := AValue is TJSONObject;
    end, False (* Take ownership of JSONObject *), ARequestFilter));
  try
    if LJSONTable <> nil then
    begin
      LReader := TDBXJSONTableReader.Create(nil, LJSONTable, True);
      LJSONTable := nil;
      try
        Result := TDBXParamsReader.ToParams(nil, LReader, True);
        LReader := nil;
        if AOwnsObject then
          OwnedObjects.Add(Result);
      finally
        LReader.Free;
      end;
    end;
  finally
    LJSONTable.Free;
  end;
end;

{ TDSRestCachedDBXReader }

function TDSRestCachedDBXReader.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): TDBXReader;
var
  LJSONTable: TJSONObject;
begin
  LJSONTable := TJSONObject
   (GetJSONValueCallback(AConnection,
    function(AValue: TJSONValue): Boolean
    begin
      Result := AValue is TJSONObject;
    end, False, ARequestFilter));
  if LJSONTable <> nil then
  begin
    Result := TDBXJSONTableReader.Create(nil, LJSONTable, True);
    if (Result <> nil) and AOwnsObject then
      OwnedObjects.Add(Result);
  end
  else
    Result := nil;
end;

{ TDSRestCachedObject<T> }

function TDSRestCachedObject<T>.GetValue(AConnection: TDSRestConnection;
  AOwnsObject: Boolean; const ARequestFilter: string): T;
begin
  Result := UnmarshalValue<T>(AConnection, AOwnsObject, ARequestFilter);
end;

{ TDSRestProtocolException }

constructor TDSRestProtocolException.Create(AStatus: Integer; const AMessage,
  AResponseText: string);
begin
  inherited Create(AMessage);
  FStatus := AStatus;
  FResponseText := AResponseText;
end;

destructor TDSRestClientCallback.Destroy;
begin
  try
    FreeAndNil(FChannelNames);
  except
  end;
  inherited;
end;

end.
