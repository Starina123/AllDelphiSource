{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSServer;

{$WARN SYMBOL_DEPRECATED OFF}

interface

uses
  System.Classes,
  Datasnap.DataBkr,
  Data.DBXCommon,
  Data.DBXPlatform,
  Data.DBXJSON,
  Data.DBXJSONReflect,
  Datasnap.DSCommonServer,
  Datasnap.DSReflect,
  System.Generics.Collections;

const
  CALLBACK_TIMEOUT = 5000;

type
  TDSServerClass = class;
  TDSGetClassEvent = procedure (DSServerClass: TDSServerClass;
    var PersistentClass: TPersistentClass) of object;
  TDSCreateInstanceEvent = procedure (DSCreateInstanceEventObject: TDSCreateInstanceEventObject) of object;
  TDSDestroyInstanceEvent = procedure (DSDestroyInstanceEventObject: TDSDestroyInstanceEventObject) of object;
  TDSPrepareEvent = procedure (DSPrepareEventObject: TDSPrepareEventObject) of object;
  TDSConnectEvent = procedure (DSConnectEventObject: TDSConnectEventObject) of object;
  TDSErrorEvent = procedure (DSErrorEventObject: TDSErrorEventObject) of object;
  
  // NOTE: C++ does not currently allow tempates in closure parameters; so we'll HPPEMIT instead
  TDSSetupConverterEvent = procedure (RegisteredConverters: TObjectDictionary<String, TConverterEvent>) of object;  
  (*$EXTERNALSYM TDSSetupConverterEvent *)
  (*$HPPEMIT OPENNAMESPACE *)  
  (*$HPPEMIT 'typedef ::System::Generics::Collections::TObjectDictionary__2<System::UnicodeString,::Data::Dbxjsonreflect::TConverterEvent*>  TConverterEventDictionary;' *)
  (*$HPPEMIT 'typedef void __fastcall (__closure *TDSSetupConverterEvent)(TConverterEventDictionary* RegisteredConverters);' *)

  TDSSetupReverterEvent = procedure (RegisteredReverters: TObjectDictionary<String, TReverterEvent>) of object;
  (*$EXTERNALSYM TDSSetupReverterEvent *)
  (*$HPPEMIT 'typedef ::System::Generics::Collections::TObjectDictionary__2<System::UnicodeString,::Data::Dbxjsonreflect::TReverterEvent*>  TReverterEventDictionary;' *)
  (*$HPPEMIT 'typedef void __fastcall (__closure *TDSSetupReverterEvent)(TReverterEventDictionary* RegisteredReverters);' *)
  (*$HPPEMIT CLOSENAMESPACE *)

  TDSServerDriver = class;

  ///  <summary>
  ///  Item to be placed into the TDSCallbackTunnel buffer, representing a single message
  ///  to send to a specific client.
  ///  </summary>
  TDSCallbackTunnelBufferItem = class
  private
    FChannelName: String;
    FCallbackId: String;
    FMsg: TJSONValue;
    FIsBroadcast: Boolean;
    FInstanceOwner: Boolean;
    FResponse: TJSONValue;
    FArgType: Integer;
    FError: Boolean;
  public
    constructor Create(const ChannelName: String; const CallbackId: String; const IsBroadcast: Boolean;
                       const Msg: TJSONValue; const MsgType: Integer; const InstanceOwner: Boolean = False);
    destructor Destroy; override;
    property ChannelName: String read FChannelName;
    property CallbackId: String read FCallbackId;
    property IsBroadcast: Boolean read FIsBroadcast;
    property Msg: TJSONValue read FMsg write FMsg;
    ///  <summary>Meta-data: holds the message type (JSON, TObject)</summary>
    property ArgType: Integer read FArgType;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property Response: TJSONValue read FResponse write FResponse;
    property IsError: Boolean read FError write FError;
  end;

{ TDSCallbackTunnel }

  ///  <summary>Possible states for a heavyweight callback tunnel to be in</summary>
  ///  <remarks>ctsWaitingOnServer signifies the client is waiting for a message from the server,
  ///     while ctsWaitingForClient signifies the server is waiting for a reply from the client.
  /// </remarks>
  TDSCallbackTunnelState = (ctsWaitingOnServer, ctsWaitingForClient);

  ///  <summary>
  ///  Implements producer/consumer data between TDSServer and the channel
  ///  callback server method
  ///  </summary>
  TDSCallbackTunnel = class
  private
    FServerChannelName: String;
    FCallbacks: TObjectDictionary<String, TStrings>;
    FClientId: String;

    {Queue of items to be sent as a broadcast or notification. these items will be sent one at a time}
    FQueue: TThreadedQueue<TDSCallbackTunnelBufferItem>;
    FThinPop: TDSCallbackTunnelBufferItem;

    //Keep track of the Session which owns this tunnel
    FSecurityToken: String;

    //The tunnel's state
    FState: TDSCallbackTunnelState;

    //The name of the server this tunnel is linked to
    FServerName: String;

    //the length of time to wait before timing out when waiting in ctsWaitingForClient state.
    FTimeoutLength: Integer;

    //sets the tunnel's state, and optionally schedles or terminates the timeout scheduled event
    procedure SetState(State: TDSCallbackTunnelState);

    //returns the unique ID of the instance, for use with scheduling
    function GetId: NativeInt;

    procedure TerminateTimedOutTunnel;

    procedure GracefullyFreeTunnelItem(Item: TDSCallbackTunnelBufferItem);
  protected
    procedure Lock;
    procedure UnLock;

  public
    constructor Create(const ServerChannelName: String; const ClientId: String;
                       const SecurityToken: String; const QueueSize: Integer = 100); Overload; virtual;
    destructor Destroy; override;

    /// <summary> Returns true if the tunnel or any of its callbacks are 'listening' on the specified channel.
    /// </summary>
    /// <remarks> The tunnel (and therefore all callbacks) is listening on a channel if the 'ServerChannelName'
    ///    provided in the constructor is the same as the ChannelName being passed in here. Specific callbacks
    ///    are listening on a channel if the ChannelName is in their list of channels they care about.
    /// </remarks>
    function ListeningOn(const ChannelName: String): Boolean;

    /// <summary> Populates the given list of strings with names of all the channels the tunnel or any of
    ///   its callbacks are listening on.
    /// </summary>
    /// <remarks> Any channel name that would return True from a call to 'ListeningOn' will be added to
    ///    the list.
    /// </remarks>
    procedure AddListeningOnChannelNames(var ChannelNames: TList<String>; const AllowDuplicates: Boolean = False);

    /// <summary> Sends the message asynchroneously to the callback, returns false if it is timing out </summary>
    function BroadcastMessage(const Msg: TJSONValue; ChannelName: String = ''; const Timeout: Cardinal = CALLBACK_TIMEOUT;
                              const ArgType: Integer = TDBXCallback.ArgJson): Boolean; overload;
    ///  <summary> Sends the message asynchroneously to the callback, returns false
    ///    if it is timing out or there is no such callback
    ///  </summary>
    function BroadcastMessage(const CallbackId: String; const Msg: TJSONValue;
                              const Timeout: Cardinal = CALLBACK_TIMEOUT;
                              const ArgType: Integer = TDBXCallback.ArgJson): Boolean; overload;
    /// <summary> invokes channel callback and waits for response. Returns false on timeout </summary>
    function SendMessage(const Id: String; const Msg: TJSONValue; out RespMsg: TJSONValue;
                         const Timeout: Cardinal = 0; const ArgType: Integer = TDBXCallback.ArgJson): Boolean;
    ///  <summary> Returns true if the callback with the given id registered with the tunnel </summary>
    function HasId(const Id: String): boolean;
    procedure AddAllIds(container: TList<String>);
    ///  <summary> Registers a client callback</summary>
    function AddId(const Id: String; Channels: TStrings): boolean;
    ///  <summary> Unregister a client callback id</summary>
    ///  <remarks> Returns true if there are Ids left </remarks>
    function RemoveId(const Id: String): boolean;
    /// <summary> Returns the number of registered callbacks. </summary>
    function CallbackCount: Integer;

    property ServerChannelName: String read FServerChannelName;
    property ClientId: String read FClientId;
    property Queue: TThreadedQueue<TDSCallbackTunnelBufferItem> read FQueue;

    /// <summary> Temporary storage for the last item poped</summary>
    /// <remarks> Used by thin client implementation of channel, to remember
    ///  the last item poped from the queue, as the client disconnects and then
    ///  reconnects with the server to finish with its use of the item.
    /// </remarks>
    property ThinPop: TDSCallbackTunnelBufferItem read FThinPop write FThinPop;

    /// <summary> String used as a secret key to allow a client to work with the tunnel.
    ///    The framework which works with the tunnel should require a security token from
    ///    clients and make sure it matches the tunnel's token.
    /// </summary>
    property SecurityToken: String read FSecurityToken write FSecurityToken;

    ///  <summary>Manages the state of the tunnel.</summary>
    ///  <remarks>ctsWaitingOnServer signifies the client is waiting for a message from the server,
    ///     while ctsWaitingForClient signifies the server is waiting for a reply from the client.
    ///
    /// </remarks>
    property State: TDSCallbackTunnelState read FState write SetState;
  end;

  ///  <summary> User event type for notification of callback tunnel events, such as create and close.
  ///  </summary>
  TDSCallbackTunnelEventType = (TunnelCreate, TunnelClose, TunnelClosedByServer, CallbackAdded, CallbackRemoved);

  ///  <summary> Event Item passed in through the TDSCallbackTunnelEvent, for providing tunnel event info.
  ///  </summary>
  TDSCallbackTunnelEventItem = record
    ///<summary>The type of event occurring for a tunnel (channel.)</summary>
    EventType: TDSCallbackTunnelEventType;
    ///<summary>The tunnel (Channel) being acted on.</summary>
    Tunnel: TDSCallbackTunnel;
    ///<summary>The ID of the tunnel (Channel) being acted on.</summary>
    TunnelId: String;
    ///<summary>The ServerChannelName of the tunnel (Channel) being acted on.</summary>
    TunnelChannelName: String;
    ///<summary>The ID of the callback being added or removed.</summary>
    CallbackId: String;
    ///<summary>List of server channel names the specific callback (if CallbackAdded) is interested in. </summary>
    CallbackChannelNames: TStrings;
  end;

  ///  <summary> User event for notification of callback tunnel, such as create and close. </summary>
  TDSCallbackTunnelEvent = reference to procedure(Sender: TObject;
                                                  const EventItem: TDSCallbackTunnelEventItem);

  ///  <summary>Singleton that manages heavyweight callback instances.</summary>
  TDSCallbackTunnelManager = class
  protected
    class var FInstance: TDSCallbackTunnelManager;
    FListeners: TList<TDSCallbackTunnelEvent>;
  public
    constructor Create;
    destructor Destroy; override;

    ///  <summary> Add the given callback tunnel event to the list of events which gets
    ///     executed when a change occurs with a callback tunnel through this manager.
    ///  </summary>
    procedure AddTunnelEvent(Event: TDSCallbackTunnelEvent);
    ///  <summary> Remove the given callback tunnel event to the list of events which gets
    ///     executed when a change occurs with a callback tunnel through this manager.
    ///  </summary>
    ///  <returns> true if successfully removed, false otherwise. </returns>
    function RemoveTunnelEvent(Event: TDSCallbackTunnelEvent): boolean;

    ///  <summary> Returns the singleton instance of this class.</summary>
    class property Instance: TDSCallbackTunnelManager read FInstance;
  end;

    ///  <summary>Internal extension of TDSCallbackTunnelManager</summary>
    ///  <remarks>This subclass provides the hooks called internally, which
    ///     notify registered tunnel events. For internal use only. Manually calling
    ///     these methods will result in unexpected behavior.
    ///  </remarks>
  TDSCallbackTunnelManagerInternal = class(TDSCallbackTunnelManager)
  private
    ///  <summary> Internal function for notifying the registered events </summary>
    procedure NotifyEvents(EventItem: TDSCallbackTunnelEventItem);
  public
    ///  <summary> Creates a new tunnel, notifies listening events, and then returns the tunnel.
    ///  </summary>
    function CreateChannelTunnel(const ServerChannelName, ClientId, SecurityToken: String;
                                 const QueueSize: Integer): TDSCallbackTunnel;

    ///  <summary> Adds the callback information to the given tunnel, and notifies any listeners.
    ///  </summary>
    procedure AddCallbackToTunnel(const Tunnel: TDSCallbackTunnel;
                                  const CallbackId: String; ChannelNames: TStringList);

    ///  <summary> Removes the callback with the given ID from the given tunnel, and notifies any listeners.
    ///  </summary>
    ///  <remarks> Return true if additional callbacks remain in the tunnel, false otherwise. </remarks>
    function RemoveCallbackFromTunnel(const Tunnel: TDSCallbackTunnel; const CallbackId: String): Boolean;

    ///  <summary> Notifies any listeners that the tunnel is closing, and then destroys the tunnel instance.
    ///  </summary>
    procedure CloseChannelTunnel(tunnel: TDSCallbackTunnel);
  end;

{ TDSServer }

  ///<summary>
  ///  DataSnap server component that manages the creation and lifetime of
  ///  transports and server classes.
  ///</summary>
  TDSServer = class(TDSCustomServer)
  private
    FAutoStart:       Boolean;
    FConnectEvent:    TDSConnectEvent;
    FPrepareEvent:    TDSPrepareEvent;
    FDisconnectEvent: TDSConnectEvent;
    FErrorEvent:      TDSErrorEvent;
    FCallbacks:       TObjectList<TDSCallbackTunnel>;

    FSetupConverterEvent: TDSSetupConverterEvent;
    FSetupReverterEvent:  TDSSetupReverterEvent;
    FRegConverters: TObjectDictionary<String, TConverterEvent>;
    FRegReverters:  TObjectDictionary<String, TReverterEvent>;

    FChannelQueueSize: Integer;

    FChannelResponseTimeout: Integer;

    class var
      FServerList:    TDBXArrayList;
    class procedure AddServer(Server: TDSCustomServer); static;
    class procedure RemoveServer(Server: TDSCustomServer); static;

  protected
    procedure Loaded; override;
    procedure Connecting(const ConnectEventObject: TDSConnectEventObject); override;
    procedure Preparing(const PrepareEventObject: TDSPrepareEventObject); override;
    procedure Disconnecting(const ConnectEventObject: TDSConnectEventObject); override;
    procedure Error(const ErrorEventObject: TDSErrorEventObject); override;
    function  GetTraceInfoEvent: TDBXTraceEvent; virtual;
    procedure SetTraceInfoEvent(const TraceInfoEvent: TDBXTraceEvent); virtual;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    ///<summary>
    ///  Find the instance of the server by its component name.
    ///</summary>
    class function FindServer(Name: UnicodeString): TDSCustomServer; static;
    ///<summary>
    ///  Create an local, inprocess connection to this server with the connection
    ///  properties provided.
    ///</summary>
    function GetServerConnection(const Properties: TDBXProperties): TDBXConnection; overload; override;

    ///<summary>
    ///  Start the server.  This will call the Start method on all <c>TDSServerTransport</c>
    ///  component implementations and all <c>TDSServerClass</c> components that have set
    ///  their <c>Server</c> property to this instance.
    ///  This method is called automatically if/when the component is loaded if
    ///  the <c>AutoStart</c> property is set to true.
    ///
    ///</summary>
    procedure Start; override;
    ///<summary>
    ///  Stop the server.  This will call the Stop method on all <c>TDSServerTransport</c>
    ///  implementations and all <c>TDSServerClass</c> components that have set
    ///  their <c>Server</c> property to this instance.
    ///
    ///</summary>
    procedure Stop; override;

    ///  <summary>
    ///    Registers a channel callback with current instance and returns the communication tunnel
    ///  </summary>
    ///  <remarks>
    ///    It is expected that the callback is created per-need bases. When the first callback
    ///    registers with the client channel then and only then the callback tunnel is created. If
    ///    no client callback registers, no resources are allocated. Hence the need for CallbackId.
    ///
    ///    The function returns nil if there is already a channel created for the client id
    ///  </remarks>
    function CreateChannelTunnel(const ChannelName: String; const ClientId: String;
                                     const CallbackId: String; ChannelNames: TStringList;
                                     const SecurityToken: String): TDSCallbackTunnel;
    function RegisterChannelCallback(const ClientId: String; const CallbackId: String;
                                     ChannelNames: TStringList; const SecurityToken: String): boolean;
    function GetCallbackTunnel(const ClientManagerId: String): TDSCallbackTunnel;
    function CallbackTunnelOf(const ClientManagerId: String): TDSCallbackTunnel;


    ///  <summary>
    ///    Returns true if there is a tunnel for a given client id. False otherwise.
    ///  </summary>
    function HasChannelCallback(const ClientId: String): boolean;

    ///  <summary>
    ///    Unregisters the client channel based on channel name and client id
    ///  </summary>
    procedure UnregisterChannelCallback(const ClientId: String;
                                        const SecurityToken: String;
                                        Owner: Boolean = false); overload;
    ///  <summary>
    ///    Unregisters a client callback. No notification or broadcasts will be possible after that
    ///  </summary>
    procedure UnregisterChannelCallback(const ClientId: String;
                                        const CallbackId: String; const SecurityToken: String); overload;

    ///  <summary>
    ///    Unregisters a client callback. No notification or broadcasts will be possible after that
    ///  </summary>
    procedure UnregisterChannelCallback(Tunnel: TDSCallbackTunnel; DoBroadcast: Boolean = True); overload;

    ///  <summary> sends a message to all client callbacks </summary>
    function BroadcastMessage(const ChannelName: String; const Msg: TJSONValue;
                              const ArgType: Integer = TDBXCallback.ArgJson): boolean; overload;
    function BroadcastObject(const ChannelName: String; const Msg: TObject): boolean; overload;
    ///  <summary> sends a message to all client callbacks with a given registered callback id </summary>
    function BroadcastMessage(const ChannelName: String; const CallbackId: String;
                              const Msg: TJSONValue; const ArgType: Integer = TDBXCallback.ArgJson): boolean; overload;
    function BroadcastObject(const ChannelName: String; const CallbackId: String;
                              const Msg: TObject): boolean; overload;

    ///  <summary>deprecated. ChannelName is no longer required</summary>
    ///  <remarks> Call the version of NotifyCallback that doesn't take a ChannelName. </remarks>
    function NotifyCallback(const ChannelName: String;
                            const ClientId: String;
                            const CallbackId: String;
                            const Msg: TJSONValue; out Response: TJSONValue;
                            Timeout: Cardinal = INFINITE;
                            const ArgType: Integer = TDBXCallback.ArgJson): boolean; overload; deprecated;
    ///  <summary>deprecated. ChannelName is no longer required</summary>
    ///  <remarks> Call the version of NotifyObject that doesn't take a ChannelName. </remarks>
    function NotifyObject(const ChannelName: String;
                          const ClientId: String;
                          const CallbackId: String;
                          const Msg: TObject; out Response: TObject;
                          Timeout: Cardinal = INFINITE): boolean; overload; deprecated;

    ///  <summary>Synchroneous message delivery to a callback located in a client channel</summary>
    ///  <remarks> Returns false if the delivery fails </remarks>
    function NotifyCallback(const ClientId: String;
                            const CallbackId: String;
                            const Msg: TJSONValue; out Response: TJSONValue;
                            Timeout: Cardinal = INFINITE;
                            const ArgType: Integer = TDBXCallback.ArgJson): boolean; overload;
    function NotifyObject(const ClientId: String;
                            const CallbackId: String;
                            const Msg: TObject; out Response: TObject;
                            Timeout: Cardinal = INFINITE): boolean; overload;
    ///  <summary> Returns a list of all channel names</summary>
    function GetAllChannelNames: TList<String>;
    ///  <summary> Returns a list of all callbacks available on that channel</summary>
    function GetAllChannelCallbackId(const ChannelName: String): TList<String>;
    ///  <summary> Returns a list of all client channels registered with a given channel</summary>
    function GetAllChannelClientId(const ChannelName: String): TList<String>;
    ///  <summary> Returns the marshaler for TObject parameters</summary>
    function GetJSONMarshaler: TJSONMarshal;
    ///  <summary> Returns the un-marshaler for TObject parameters</summary>
    function GetJSONUnMarshaler: TJSONUnMarshal;
    ///  <summary> Marshal argument using local marshaler</summary>
    function MarshalData(Data: TObject): TJSONValue;
    ///  <summary> UnMarshal argument using local unmarshaler</summary>
    function UnMarshalJSON(Data: TJSONValue): TObject;
  published
    ///<summary>
    /// Use this event to receive notification that a server method is being
    ///  prepared for all <c>TDSServerClass</c> instances registered with
    ///  this server.  See <c>TDSServerClass.OnPrepare</c> for more information.
    ///</summary>
    property OnPrepare: TDSPrepareEvent read FPrepareEvent write FPrepareEvent;
    ///<summary>
    /// Use this event to receive notifcation when a connection is opened.
    ///  If an exception is raised, in this event handler, the connection
    ///  will be denied.
    ///</summary>
    property OnConnect: TDSConnectEvent read FConnectEvent write FConnectEvent;
    ///<summary>
    /// Use this event to receive notifcation when a connection is closed.
    ///</summary>
    property OnDisconnect: TDSConnectEvent read FDisconnectEvent write FDisconnectEvent;

    ///<summary>
    ///   Use this event to receive notifcation of execeptions that are raised
    ///  during the execution of a server method.
    ///</summary>
    property OnError: TDSErrorEvent read FErrorEvent write FErrorEvent;

    ///<summary>
    ///  When set to true, this causes the server to be automatically started when
    ///  the <c>TDSServer</c> component is loaded.
    ///</summary>
    property AutoStart: Boolean read FAutoStart write FAutoStart;
    ///<summary>
    ///  When set to true, this prevents clients from directly calling the built-in
    ///  server methods of <c>TDSAdmin</c> class.  Server methods from other
    ///  server classes can still call the <c>TDSAdmin</c> server methods.  This
    ///  allows an application to filter or limit which <c>TDSAdmin</c> methods
    ///  an client can call.
    ///</summary>
    property HideDSAdmin;
    ///<returns>
    ///  Event handler used for receiving trace events.
    ///</returns>
    property OnTrace: TDBXTraceEvent read GetTraceInfoEvent write SetTraceInfoEvent;
    ///<summary>
    ///  The number of messages which can be queued for sending to a specific client at once.
    ///  If the queue reaches this size, all attempts to send to that client will fail until
    ///  the size of the queue decreases (one or more messages get sent.)
    ///</summary>
    property ChannelQueueSize: Integer read FChannelQueueSize write FChannelQueueSize default 100;
    ///<summary>
    ///  The length in milliseconds to wait for a client's response to a heavyweight callback
    ///  message sent to them, before determining the client is lost or or disabled in some way,
    ///  and terminating the tunnel. Use a value of 0 to not automatically close a tunnel, unless
    ///  the session expires.
    ///</summary>
    property ChannelResponseTimeout: Integer read FChannelResponseTimeout write FChannelResponseTimeout default 30000;
  end;

  TDSServerDriver = class(TDBXDriver)
    private
      function  CreateServerCommand(DbxContext: TDBXContext; Connection: TDBXConnection; MorphicCommand: TDBXCommand): TDBXCommand;
    protected
      procedure Close; override;
      function  CreateConnection(ConnectionBuilder: TDBXConnectionBuilder): TDBXConnection; override;
    public
      constructor Create(DBXDriverDef: TDBXDriverDef); override;
      destructor Destroy; override;
      function GetDriverVersion: UnicodeString; override;
  end;

{ TDSServerClass }
  ///<summary>
  /// <c>TDSServerClass</c> is a component that can be used to specify a server side class
  /// with published methods that can be called from a remote client using
  ///  dynamic method invocation.
  ///  <para>
  ///  Server side classes that extend <c>TProviderDataModule</c> can also be specified
  ///  so that the providers they contain can be accessed by a client side
  ///  <c>TDSProviderConnection</c> client component.</para>
  ///  <para>
  ///  The parameter and return types of published server class methods supported
  ///  include most of the dbExpress value types that extend from <c>TDBXValue</c>,
  ///  scalar values, <c>TDBXReader</c> and <c>Tstream</c> objects.</para>
  ///  <para>
  ///  TDBXValue parameter types supported</para>
  ///  <para>
  ///  Currently this is the fastest way to pass a parameter because these are the
  ///  internal objects used to manage parameter lists.  When these parameter types
  ///  are specified, the internal <c>TDBXValue</c> is passed directly to the application.
  ///  Note however that since this is treated as a <c>TDBXParameterDirections.IN_OUT_PARAMETER</c>
  ///  parameter, an application may want to call TDBXWritableValue.SetNull before returning from a
  ///  method where the value can be large.  Otherwise the value will be sent back to
  ///  the remote client. </para>
  ///  <para>
  ///  Here is a list of <c>TDBXValue</c> types that can be used as parameters:</para>
  ///  <para></para>
  ///  <para>TDBXWideStringValue</para>
  ///  <para>TDBXAnsiStringValue</para>
  ///  <para>TDBXUInt8Value</para>
  ///  <para>TDBXInt8Value</para>
  ///  <para>TDBXUInt16Value</para>
  ///  <para>TDBXInt16Value</para>
  ///  <para>TDBXInt32Value</para>
  ///  <para>TDBXInt64Value</para>
  ///  <para>TDBXSingleValue</para>
  ///  <para>TDBXDoubleValue</para>
  ///  <para>TDBXBcdValue</para>
  ///  <para>TDBXTimeValue</para>
  ///  <para>TDBXDateValue</para>
  ///  <para>TDBXTimeStampValue</para>
  ///  <para>TDBXBooleanValue</para>
  ///  <para>TDBXReaderValue</para>
  ///  <para>TDBXStreamValue</para>
  ///  <para>
  ///  "var" and "out" scalar value types supported</para>
  ///  <para>
  ///  A server method "var" parameters are treated <c>TDBXParameterDirections.IN_OUT_PARAMETER</c>
  ///  by a database client driver.
  ///  A server method "out" parameters are treated <c>TDBXParameterDirections.OUT_PARAMETER</c>
  ///  by a database client driver.</para>
  ///  <para></para>
  ///  <para>boolean</para>
  ///  <para>SmallInt</para>
  ///  <para>Integer</para>
  ///  <para>Int64</para>
  ///  <para>Single</para>
  ///  <para>Double</para>
  ///  <para>AnsiString</para>
  ///  <para>String</para>
  ///  <para>TDBXTime</para>
  ///  <para>TDBXDate</para>
  ///  <para>TJSONValue and all descendents</para>
  ///  <para>
  ///  "in" and "return" scalar value types supported</para>
  ///  <para>
  ///  A server method "in" parameter is treated <c>TDBXParameterDirections.IN_PARAMETER</c>
  ///  by a database client driver.
  ///  A server method return parameter is treated <c>TDBXParameterDirections.RETURN_PARAMETER</c>
  ///  by a database client driver. The the return value is made available to the database
  ///  driver client as the last parameter in the command's parameter list.</para>
  ///  <para>
  ///  This list includes all of the scalar values that can be passed as "var"
  ///  and "out parameters plus the following additional data types</para>
  ///  <para>TStream</para>
  ///  <para>TDataSet</para>
  ///  <para>TParams</para>
  ///  <para>TDBXReader</para>
  ///  <para>TDBXConnection</para>
  ///  <para></para>
  ///  <remarks>
  ///  Currently TBcd and TSQLTimeStamp values can only be passed using
  ///  TDBXBcdValue and TDBXTimStampValue parameters.
  ///  <para>
  ///  Shared database connection.</para>
  ///  <para>
  ///  A server method can share access to a database connection with a client
  ///  connection.  A client connection can have only one association to a server
  ///  side database connection at a time.  This database connection sharing with
  ///  the client and server methods allows the client to execute sql statements
  ///  and sql stored procedures using the same database connection and transactional
  ///  context as the server methods that the client makes calls to.  A client
  ///  can share a database connection with a server method by calling a server method
  ///  that returns a TDBXConnection instance.  The actuall TDBXConnection instance
  ///  is not actually returned to the client.  Instead, the TDBXConnection instance
  ///  is used for all sql and sql stored procedure commands that are executed by
  ///  the client.  For convenience, this server
  ///  method can be specified using a by setting the <c>TDBXPropertyNames.ServerConnection</c>
  ///  connection property to the name of a server method that returns a TDBXConnection instance.</para>
  ///  </remarks>
  ///
  ///</summary>
  TDSServerClass = class(TDSCustomServerClass)
  private
    FGetClassEvent:         TDSGetClassEvent;
    FCreateInstanceEvent:   TDSCreateInstanceEvent;
    FDestroyInstanceEvent:  TDSDestroyInstanceEvent;
    FPrepareEvent:          TDSPrepareEvent;
  protected
    procedure SetServer(const AServer: TDSCustomServer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CreateInstance(const CreateInstanceEventObject: TDSCreateInstanceEventObject); override;
    procedure DestroyInstance(const DestroyInstanceEventObject: TDSDestroyInstanceEventObject); override;
    procedure Preparing(const PrepareEventObject: TDSPrepareEventObject); override;
    function GetDSClass: TDSClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary>
    ///  Called by the server when the server method is started.
    /// </summary>
    procedure Start; override;
    /// <summary>
    ///  Called by the server when the server method is stopped.
    /// </summary>
    procedure Stop; override;
  published
    /// <summary>
    ///  Use this event to specify the server class.  All public methods in
    ///  this class can be called by a client.  The class specified must inherit
    ///  from TPersistent and be compiled with <c>MethodInfo</c> on.  This event can specify a
    ///  class that extends TProviderDataModule to expose the providers
    ///  contained in the <c>TServerModule</c>.  <c>TServerModule</c> is
    ///  now compiled with <c>MethodInfo</c>.
    /// </summary>
    property OnGetClass: TDSGetClassEvent read FGetClassEvent write FGetClassEvent;
    /// <summary>
    ///  Use this event to override the default creation of server class instances.
    ///  This allows for custom initialization and custom object pooling if the
    ///  <c>LifeCycle</c> property is set to <c>TDSLifeCycle.Invocation</c>
    /// </summary>
    property OnCreateInstance: TDSCreateInstanceEvent read FCreateInstanceEvent write FCreateInstanceEvent;
    /// <summary>
    ///  Use this event to override the default destruction of server class instances.
    ///  This allows for custom initialization and custom object pooling if the
    ///  <c>LifeCycle</c> property is set to <c>TDSLifeCycle.Invocation</c>
    /// </summary>
    property OnDestroyInstance: TDSDestroyInstanceEvent read FDestroyInstanceEvent write FDestroyInstanceEvent;
    /// <summary>
    ///  Use this method do be notified when a server method is about to be
    ///  prepared.  This event can be used as a recording mechanism or to
    ///  prevent access to a server method.
    ///  All server methods are prepared before they are invoked.
    ///  If the implementation of this event handler throws an exception, the
    ///  server method will not be prepared or invoked.
    /// </summary>
    property OnPrepare: TDSPrepareEvent read FPrepareEvent write FPrepareEvent;
    /// <summary>
    ///  <c>TDSServer</c> component to register this server class with.
    /// </summary>
    property Server;
    /// <summary>
    ///  Specify the lifecycle for instances of the server class.  <c>TLifeCycle</c>
    ///  contains lifecyle options for this property.
    /// </summary>
    property LifeCycle;
  end;

//  IAppServerStandard = interface(IDispatch)
//    ['{1AEFCC20-7A24-11D2-98B0-C69BEB4B5B6D}']
//    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant;
//                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant; out ReturnResult: OleVariant): HResult; stdcall;
//    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
//                            Options: Integer; const CommandText: WideString;
//                            var Params: OleVariant; var OwnerData: OleVariant; out ReturnResult: OleVariant): HResult; stdcall;
//    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant; out ReturnResult: OleVariant): HResult; stdcall;
//    function  AS_GetProviderNames(ReturnResult: OleVariant): HResult; stdcall;
//    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant; ReturnResult: OleVariant): HResult; stdcall;
//    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
//                            var OwnerData: OleVariant; ReturnResult: OleVariant): HResult; stdcall;
//    function  AS_Execute(const ProviderName: WideString; const CommandText: WideString;
//                         var Params: OleVariant; var OwnerData: OleVariant): HResult; stdcall;
//  end;

{ TDSProviderDataModuleAdapter }

  TDSProviderDataModuleAdapter = class(TDSAdapterClass)
  private
    FProviderDataModule: TProviderDataModule;
  public
    constructor Create(AdapteeInstance: TObject); override;
    destructor Destroy; override;
    // IAppServerFastCall interface methods.
    //
    function  AS_ApplyUpdates(const ProviderName: WideString; DeltaStream: OleVariant;
      MaxErrors: Integer; out ErrorCount: Integer; OwnerDataStream: TDBXStreamValue): OleVariant;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer;
      out RecsOut: Integer; Options: Integer; const CommandText: WideString;
      ParamReader: TDBXStreamValue; OwnerDataStream: TDBXStreamValue): OleVariant;
    function  AS_DataRequest(const ProviderName: WideString;
      DataStream: OleVariant): OleVariant;
    function  AS_GetProviderNames: string;
    function  AS_GetParams(const ProviderName: WideString;
      OwnerDataStream: TDBXStreamValue): OleVariant;
    function  AS_RowRequest(const ProviderName: WideString; RowStream: OleVariant;
      RequestType: Integer; OwnerDataStream: TDBXStreamValue): OleVariant;
    procedure AS_Execute(const ProviderName, CommandText: WideString;
      ParamReader: TDBXStreamValue; OwnerDataStream: TDBXStreamValue);

      property ProviderDataModule: TProviderDataModule read FProviderDataModule write FProviderDataModule;
  end;

  TDSServerModuleBase = class(TProviderDataModule)
  public
    procedure BeforeDestruction; override;
    destructor Destroy; override;
  end;

  {$MethodInfo ON}
  TDSServerModule = class(TDSServerModuleBase)
  end;
  {$MethodInfo OFF}

procedure InternalRemoveCallbackTunnel(AServer: TDSServer; ATunnel: TDSCallbackTunnel);

implementation

uses
  Data.DBXClientResStrs,
  Datasnap.DSNames,
  Datasnap.DSService,
  Data.DSUtil,
  System.SyncObjs,
  System.SysUtils,
  System.Variants;

{ TDSServer }

function TDSServer.BroadcastMessage(const ChannelName: String;
                                    const Msg: TJSONValue;
                                    const ArgType: Integer): boolean;
var
  I, Count: Integer;
  CurrentPassed: Boolean;
  TunnelItem: TDSCallbackTunnel;
begin
  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    if Count > 0 then
    begin
      Result := true;
      for I := Count - 1 downto 0 do
      begin
        try
          TunnelItem := FCallbacks.Items[I];
          CurrentPassed := True;
          if TunnelItem.ListeningOn(ChannelName) then
            CurrentPassed := TunnelItem.BroadcastMessage(Msg.Clone as TJSONValue, ChannelName,
                                                         CALLBACK_TIMEOUT, ArgType);
        except
          CurrentPassed := False;
          FCallbacks.Delete(I);
        end;
        Result := CurrentPassed and Result;
      end;
    end
    else
      Result := false;
  finally
    // Caller must pass clone because callee will free
    Msg.Free;
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSServer.BroadcastMessage(const ChannelName, CallbackId: String;
                                    const Msg: TJSONValue;
                                    const ArgType: Integer): boolean;
var
  I, Count: Integer;
  TunnelItem: TDSCallbackTunnel;
begin
  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    if Count > 0 then
    begin
      Result := true;
      for I := Count - 1 downto 0 do
      begin
        TunnelItem := FCallbacks.Items[I];
        if TunnelItem.ListeningOn(ChannelName) then
          try
            Result := TunnelItem.BroadcastMessage(CallbackId, Msg.Clone as TJSONValue) and Result;
          except
            Result := False;
            FCallbacks.Delete(I);
          end;
      end;
    end
    else
      Result := false;
    // Caller must pass clone of Msg because callee will free
    Msg.Free;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSServer.BroadcastObject(const ChannelName: String;
  const Msg: TObject): boolean;
begin
  Result := BroadcastMessage(ChannelName, MarshalData(Msg), TDBXCallback.ArgObject);
  //Msg.Free; RAID 280473
end;

function TDSServer.BroadcastObject(const ChannelName, CallbackId: String;
  const Msg: TObject): boolean;
begin
  Result := BroadcastMessage(ChannelName, CallbackId, MarshalData(Msg), TDBXCallback.ArgObject);
  //Msg.Free; RAID 280473
end;

function TDSServer.CallbackTunnelOf(const ClientManagerId: String): TDSCallbackTunnel;
var
  I, Count: Integer;
begin
  Count := FCallbacks.Count;
  for I := 0 to Count - 1 do
    if AnsiCompareText(FCallbacks.Items[I].ClientId, ClientManagerId) = 0 then
      exit(FCallbacks.Items[I]);

  exit(nil);
end;

procedure TDSServer.Connecting(const ConnectEventObject: TDSConnectEventObject);
var
  LDSSession: TDSSession;
begin
  LDSSession := TDSSessionManager.GetThreadSession;
  if LDSSession <> nil then
    if not LDSSession.Authenticate(ConnectEventObject.ServerConnectionHandler.AuthenticateEventObject,
         ConnectEventObject.ConnectProperties) then
      raise TDBXError.Create(0, SAuthenticationFailed);

  if Assigned(FConnectEvent) then
    FConnectEvent(ConnectEventObject);
end;

constructor TDSServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Name := 'DSServer';
  ChannelQueueSize := 100;
  FChannelResponseTimeout := 30000;
  AddServer(Self);
  FAutoStart := true;
  FCallbacks := TObjectList<TDSCallbackTunnel>.Create(false);
  FRegConverters := TObjectDictionary<String, TConverterEvent>.Create([doOwnsValues]);
  FRegReverters := TObjectDictionary<String, TReverterEvent>.Create([doOwnsValues]);
  if Assigned(FSetupConverterEvent) then
    FSetupConverterEvent(FRegConverters);
  if Assigned(FSetupReverterEvent) then
    FSetupReverterEvent(FRegReverters);
end;

destructor TDSServer.Destroy;
begin
  try
    if Started then
      Stop;
  finally
    RemoveServer(Self);

    FreeAndNil(FRegConverters);
    FreeAndNil(FRegReverters);
    FreeAndNil(FCallbacks);

    inherited;
  end;
end;

procedure TDSServer.Disconnecting(const ConnectEventObject: TDSConnectEventObject);
begin
  if Assigned(FDisconnectEvent) then
    FDisconnectEvent(ConnectEventObject);
end;

procedure TDSServer.Error(const ErrorEventObject: TDSErrorEventObject);
begin
  if Assigned(FErrorEvent) then
    FErrorEvent(ErrorEventObject);
end;

function TDSServer.GetAllChannelCallbackId(
  const ChannelName: String): TList<String>;
var
  TunnelItem: TDSCallbackTunnel;
  I, Count: Integer;
begin
  Result := TList<String>.Create;

  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
    begin
      TunnelItem := FCallbacks.Items[I];
      if TunnelItem.ListeningOn(ChannelName) then
        FCallbacks.Items[I].AddAllIds(Result);
    end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSServer.GetCallbackTunnel(const ClientManagerId: String): TDSCallbackTunnel;
begin
  TMonitor.Enter(FCallbacks);
  try
    Result := CallbackTunnelOf(ClientManagerId);
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSServer.GetJSONMarshaler: TJSONMarshal;
begin
  // Get marshaller with registered converters
  Result := TJSONConverters.GetJSONMarshaler;
end;

function TDSServer.GetJSONUnMarshaler: TJSONUnMarshal;
begin
  // Get unmarshaller with registered reverters
  Result := TJSONConverters.GetJSONUnMarshaler;
end;

function TDSServer.GetAllChannelClientId(const ChannelName: String): TList<String>;
var
  TunnelItem: TDSCallbackTunnel;
  I, Count: Integer;
begin
  Result := TList<String>.Create;

  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
    begin
      TunnelItem := FCallbacks.Items[I];
      if TunnelItem.ListeningOn(ChannelName) then
        Result.Add(FCallbacks.Items[I].ClientId);
    end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSServer.GetAllChannelNames: TList<String>;
var
  LCallback: TDSCallbackTunnel;
begin
  Result := TList<String>.Create;
  try
    TMonitor.Enter(FCallbacks);
    try
      for LCallback in FCallbacks do
      begin
        //get all of the channel names of each callback of the tunnel and add them
        LCallback.AddListeningOnChannelNames(Result, False);
      end;
    finally
      TMonitor.Exit(FCallbacks);
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TDSServer.GetServerConnection(const Properties: TDBXProperties): TDBXConnection;
begin
  Properties[TDBXPropertyNames.DriverName] := Name;
  Result := TDBXConnectionFactory.GetConnectionFactory.GetConnection(Properties);
end;



function TDSServer.GetTraceInfoEvent: TDBXTraceEvent;
begin
  Result := FDBXContext.OnTrace;
end;

function TDSServer.HasChannelCallback(const ClientId: String): boolean;
var
  TunnelItem: TDSCallbackTunnel;
  I, Count: Integer;
begin
  Result := False;
  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
    begin
      TunnelItem := FCallbacks.Items[I];
      if TunnelItem.ListeningOn(ClientId) then
        exit(True);
    end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

procedure TDSServer.Loaded;
begin
  inherited;
  if FAutoStart then
  begin
    if not (csDesigning in ComponentState) then
    begin
      Start;
    end;
  end;
end;

function TDSServer.MarshalData(Data: TObject): TJSONValue;
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

function TDSServer.NotifyCallback(const ClientId, CallbackId: String;
  const Msg: TJSONValue; out Response: TJSONValue; Timeout: Cardinal; const ArgType: Integer): boolean;
var
  I, Count: Integer;
  CallbackTunnel: TDSCallbackTunnel;
begin
  TMonitor.Enter(FCallbacks);
  try
    CallbackTunnel := nil;
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
      if (AnsiCompareText(FCallbacks.Items[I].ClientId, ClientId) = 0) and
         (FCallbacks.Items[I].HasId(CallbackId)) then
      begin
        CallbackTunnel := FCallbacks.Items[I];
        break;
      end;
    if not Assigned(CallbackTunnel) then
      exit(false);
  finally
    TMonitor.Exit(FCallbacks);
  end;

  Result := CallbackTunnel.SendMessage(CallbackId, Msg, Response, Timeout, ArgType);
end;

function TDSServer.NotifyObject(const ChannelName, ClientId, CallbackId: String; const Msg: TObject;
  out Response: TObject; Timeout: Cardinal): boolean;
begin
  Result := NotifyObject(ClientId, CallbackId, Msg, Response, Timeout);
end;

function TDSServer.NotifyCallback(const ChannelName, ClientId, CallbackId: String; const Msg: TJSONValue;
  out Response: TJSONValue; Timeout: Cardinal; const ArgType: Integer): boolean;
begin
  Result := NotifyCallback(ClientId, CallbackId, Msg, Response, Timeout, ArgType);
end;

function TDSServer.NotifyObject(const ClientId, CallbackId: String;
  const Msg: TObject; out Response: TObject; Timeout: Cardinal): boolean;
var
  JSONMsg: TJSONValue;
  JSONResponse: TJSONValue;
begin
  JSONMsg := MarshalData(Msg);
  //Msg.Free; RAID 280473

  Result := NotifyCallback(ClientId, CallbackId, JSONMsg, JSONResponse,
                             Timeout, TDBXCallback.ArgObject);
  if Result then
  begin
    Response := UnMarshalJSON(JSONResponse);
    JSONResponse.Free
  end;
end;

procedure TDSServer.Preparing(const PrepareEventObject: TDSPrepareEventObject);
begin
  if Assigned(FPrepareEvent) then
    FPrepareEvent(PrepareEventObject);
end;

procedure TDSServer.SetTraceInfoEvent(const TraceInfoEvent: TDBXTraceEvent);
begin
  FDBXContext.OnTrace := TraceInfoEvent;
end;

procedure TDSServer.Start;
begin
  inherited;
  TDBXDriverRegistry.RegisterDriverClass(Name, TDSServerDriver);

end;

procedure TDSServer.Stop;
var
  J, Count: Integer;
  Tunnel: TDSCallbackTunnel;
begin
  if Started then
  begin
    // clear the callback repo
    TMonitor.Enter(FCallbacks);
    try
      Count := FCallbacks.Count;
      for J := 0 to Count - 1 do
      begin
        Tunnel := FCallbacks.Items[J];
        if Assigned(Tunnel.Queue) then
        begin
          TMonitor.Enter(Tunnel.Queue);
          try
            Tunnel.Queue.DoShutDown;
            TMonitor.Pulse(Tunnel.Queue);
          finally
            TMonitor.Exit(Tunnel.Queue);
          end;
        end;
      end;

      //the above pulsing will lead to each tunnel freeing itself,
      //so we don't need to free the objects when we clear them from the callback list
      FCallbacks.Clear;
    finally
      TMonitor.Exit(FCallbacks);
    end;

    inherited;
    TDBXDriverRegistry.UnregisterDriverClass(Name);
  end;
end;

procedure TDSServer.UnregisterChannelCallback(const ClientId: String; const SecurityToken: String;
                                              Owner: Boolean);
var
  I, Count: Integer;
  Tunnel: TDSCallbackTunnel;
begin
  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
      if AnsiCompareText(FCallbacks.Items[I].ClientId, ClientId) = 0 then
      begin
        Tunnel := FCallbacks.Items[I];

        //verify the security token matches the tunnel
        if (Tunnel.SecurityToken <> SecurityToken) then
        begin
          raise TDBXError.Create(0, SAuthSessionFail);
        end;

        FCallbacks.Delete(I);

        // Stop the tunnel (and the client channel) by broadcasting a nil message
        //This is internally handled as a special case that signals the tunnel should end gracefully
        Tunnel.BroadcastMessage(nil);

        // removes the callback, it is the DS method that will release the object
        if Owner then
          Tunnel.Free;

        break;
      end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

function TDSServer.UnMarshalJSON(Data: TJSONValue): TObject;
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

procedure TDSServer.UnregisterChannelCallback(Tunnel: TDSCallbackTunnel; DoBroadcast: Boolean);
begin
  TMonitor.Enter(FCallbacks);
  try
    if FCallbacks.Contains(Tunnel) then
    begin
      if DoBroadcast then
        Tunnel.BroadcastMessage(nil);

      FCallbacks.Remove(Tunnel);
    end;
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

procedure InternalRemoveCallbackTunnel(AServer: TDSServer; ATunnel: TDSCallbackTunnel);
var
  I, Count: Integer;
begin
  TMonitor.Enter(AServer.FCallbacks);
  try
    Count := AServer.FCallbacks.Count;
    for I := 0 to Count - 1 do
    begin
      if AServer.FCallbacks.Items[I] = ATunnel then
      begin
        AServer.FCallbacks.Delete(I);
        break;
      end;
    end;
  finally
    TMonitor.Exit(AServer.FCallbacks);
  end;
end;


procedure TDSServer.UnregisterChannelCallback(const ClientId: String; const CallbackId: String;
                                              const SecurityToken: String);
var
  I, Count: Integer;
  Tunnel: TDSCallbackTunnel;
begin
  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
      if AnsiCompareText(FCallbacks.Items[I].ClientId, ClientId) = 0 then
      begin
        Tunnel := FCallbacks.Items[I];

        //verify the SecurityToken is for the tunnel
        if (Tunnel.SecurityToken <> SecurityToken) then
        begin
          raise TDBXError.Create(0, SAuthSessionFail);
        end;

        if Tunnel.HasId(CallbackId) then
        begin
          if not TDSCallbackTunnelManagerInternal(TDSCallbackTunnelManager.Instance).RemoveCallbackFromTunnel(Tunnel, CallbackId) then
          begin
            // last id, channel is now empty so remove it
            // that will also end up the client DS thread
            Tunnel.BroadcastMessage(nil);
            // removes the callback, it is the DS method that will release the object
            FCallbacks.Delete(I);
            break;
          end
        end
      end
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

class procedure TDSServer.AddServer(Server: TDSCustomServer);
var
  List: TDBXArrayList;
begin
  List := TDSServer.FServerList;
  TMonitor.Enter(List);
  try
  begin
    List.Add(Server);
  end
  finally
    TMonitor.Exit(List);
  end

end;

function TDSServer.CreateChannelTunnel(const ChannelName: String; const ClientId: String;
                                       const CallbackId: String; ChannelNames: TStringList;
                                       const SecurityToken: String): TDSCallbackTunnel;
var
  I, Count: Integer;
begin
  Result := nil;
  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
      if AnsiCompareText(FCallbacks.Items[I].ClientId, ClientId) = 0 then
        exit(nil);

    {If 0 or a negative number is given, then assume they want a large queue size for messages}
    if ChannelQueueSize < 1 then
      ChannelQueueSize := High(Byte); {Setting the queue length ends up treating the itneger as a Byte}

    Result :=
      TDSCallbackTunnelManagerInternal(TDSCallbackTunnelManager.Instance).
          CreateChannelTunnel(ChannelName, ClientId, SecurityToken, ChannelQueueSize);

    Result.FTimeoutLength := FChannelResponseTimeout;
    Result.FServerName := Name;

    FCallbacks.Add(Result);
  finally
    TMonitor.Exit(FCallbacks);
    if Result <> nil then
      TDSCallbackTunnelManagerInternal(TDSCallbackTunnelManager.Instance).
          AddCallbackToTunnel(Result, CallbackId, ChannelNames);
  end;
end;

function TDSServer.RegisterChannelCallback(const ClientId: String; const CallbackId: String;
                                           ChannelNames: TStringList; const SecurityToken: String): boolean;
var
  I, Count: Integer;
  Tunnel: TDSCallbackTunnel;
begin
  Result := false;

  TMonitor.Enter(FCallbacks);
  try
    Count := FCallbacks.Count;
    for I := 0 to Count - 1 do
      if AnsiCompareText(FCallbacks.Items[I].ClientId, ClientId) = 0 then
      begin
        Tunnel := FCallbacks.Items[I];

        if not Tunnel.HasId(CallbackId) then
        begin
          //verify the SecurityToken is for the tunnel
          if (Tunnel.SecurityToken <> SecurityToken) then
          begin
            raise TDBXError.Create(0, SAuthSessionFail);
          end;

          TDSCallbackTunnelManagerInternal(TDSCallbackTunnelManager.Instance).
              AddCallbackToTunnel(Tunnel, CallbackId, ChannelNames);

          exit(true);
        end;
        exit(false);
      end;

    exit(false);
  finally
    TMonitor.Exit(FCallbacks);
  end;
end;

class procedure TDSServer.RemoveServer(Server: TDSCustomServer);
var
  List: TDBXArrayList;
begin
  List := TDSServer.FServerList;
  if List <> nil then
  begin
    TMonitor.Enter(List);
    try
    begin
      List.Remove(Server);
    end
    finally
      TMonitor.Exit(List);
    end;
  end;
end;

class function TDSServer.FindServer(Name: UnicodeString): TDSCustomServer;
var
  List: TDBXArrayList;
  Server: TDSCustomServer;
  Index: Integer;
begin
  Result := nil;
  try
    List := TDSServer.FServerList;
    TMonitor.Enter(List);
    try
    begin
      for Index := 0 to List.Count - 1 do
      begin
        Server := TDSCustomServer(List[Index]);
        if (Server.Name = Name) then
        begin
          Result := Server;
          exit;
        end;
      end;
    end
    finally
      TMonitor.Exit(List);
    end;
  except
  end;
end;


{ TDSServerClass }

constructor TDSServerClass.Create(AOwner: TComponent);
begin
  inherited;
  LifeCycle := TDSLifeCycle.Session;
end;

procedure TDSServerClass.CreateInstance(
  const CreateInstanceEventObject: TDSCreateInstanceEventObject);
var
  Instance: TObject;
begin
  if Assigned(FCreateInstanceEvent) then
  begin
    FCreateInstanceEvent(CreateInstanceEventObject);
    Instance := CreateInstanceEventObject.ServerClassInstance;
    if (Instance <> nil) and Instance.InheritsFrom(TProviderDataModule) then
      CreateInstanceEventObject.ServerClassInstance := TDSProviderDataModuleAdapter.Create(Instance);
  end;
end;

destructor TDSServerClass.Destroy;
begin

  inherited;
end;

procedure TDSServerClass.DestroyInstance(
  const DestroyInstanceEventObject: TDSDestroyInstanceEventObject);
var
  Adapter: TDSProviderDataModuleAdapter;
begin
  if Assigned(FDestroyInstanceEvent) then
  begin
    if DestroyInstanceEventObject.ServerClassInstance is TDSProviderDataModuleAdapter then
    begin
      Adapter := DestroyInstanceEventObject.ServerClassInstance as TDSProviderDataModuleAdapter;
      DestroyInstanceEventObject.ServerClassInstance := Adapter.FProviderDataModule;
      Adapter.FProviderDataModule := nil;
    end else
      Adapter := nil;
    try
      FDestroyInstanceEvent(DestroyInstanceEventObject);
    finally
      Adapter.Free;
      DestroyInstanceEventObject.ServerClassInstance := nil;
    end;
  end;
end;

function TDSServerClass.GetDSClass: TDSClass;
var
  PersistentClass: TPersistentClass;
  IsAdapted: Boolean;
begin
  Result := nil;
  if Assigned(FGetClassEvent) then
  begin
    PersistentClass := nil;
    FGetClassEvent(Self, PersistentClass);
    if PersistentClass <> nil then
    begin
      IsAdapted := PersistentClass.InheritsFrom(TProviderDataModule);
      Result := TDSClass.Create(PersistentClass, IsAdapted);
      if IsAdapted then
        Result := TDSClass.Create(TDSProviderDataModuleAdapter, Result)
    end;
  end;
  if Result = nil then
    raise TDBXError.Create(TDBXErrorCodes.InvalidArgument, SOnGetClassNotSet);
end;

procedure TDSServerClass.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = Server) then
    Server := nil;
end;

procedure TDSServerClass.Preparing(const PrepareEventObject: TDSPrepareEventObject);
begin
  if Assigned(FPrepareEvent) then
    FPrepareEvent(PrepareEventObject);
end;

procedure TDSServerClass.SetServer(const AServer: TDSCustomServer);
begin
  if (AServer <> Server) then
  begin
    if Assigned(Server) then
      RemoveFreeNotification(Server);
    if Assigned(AServer) then
      FreeNotification(AServer);
  end;
  inherited;
end;

procedure TDSServerClass.Start;
begin
                               
end;

procedure TDSServerClass.Stop;
begin
                               
end;

{ TDSProviderDataModuleAdapter }

constructor TDSProviderDataModuleAdapter.Create(AdapteeInstance: TObject);
begin
  inherited Create(AdapteeInstance);
  FProviderDataModule := AdapteeInstance as TProviderDataModule;
end;

destructor TDSProviderDataModuleAdapter.Destroy;
begin
  FreeAndNil(FProviderDataModule);
  inherited;
end;

function TDSProviderDataModuleAdapter.AS_ApplyUpdates(
  const ProviderName: WideString; DeltaStream: OleVariant; MaxErrors: Integer;
  out ErrorCount: Integer; OwnerDataStream: TDBXStreamValue): OleVariant;
var
  Delta: OleVariant;
  OwnerData: OleVariant;
begin
  // Setup input parameters
  OwnerData := OwnerDataStream.AsVariant;
  Delta := DeltaStream;
  Result := Unassigned;

  // Invoke the IAppServer method
  Result := FProviderDataModule.Providers[ProviderName].ApplyUpdates(
    Delta, MaxErrors, ErrorCount, OwnerData);

  // Assign output parameters
  OwnerDataStream.AsVariant := OwnerData;
end;

function TDSProviderDataModuleAdapter.AS_DataRequest(
  const ProviderName: WideString; DataStream: OleVariant): OleVariant;
begin
  // Invoke the IAppServer method
  Result := FProviderDataModule.Providers[ProviderName].DataRequest(DataStream);
end;

procedure TDSProviderDataModuleAdapter.AS_Execute(const ProviderName,
  CommandText: WideString; ParamReader: TDBXStreamValue; OwnerDataStream: TDBXStreamValue);
var
  Params: OleVariant;
  OwnerData: OleVariant;
begin
  // Setup input parameters
  Params := ParamReader.AsVariant;
  OwnerData := OwnerDataStream.AsVariant;

  // Invoke the IAppServer method
  FProviderDataModule.Providers[ProviderName].Execute(CommandText, Params, OwnerData);

  // Assign output parameters
  ParamReader.AsVariant := Params;
  OwnerDataStream.AsVariant := OwnerData;
end;

function TDSProviderDataModuleAdapter.AS_GetParams(const ProviderName: WideString;
  OwnerDataStream: TDBXStreamValue): OleVariant;
var
  Params: OleVariant;
  OwnerData: OleVariant;
begin
  // Setup input parameters
  OwnerData := OwnerDataStream.AsVariant;

  // Invoke the IAppServer method
  Params := FProviderDataModule.Providers[ProviderName].GetParams(OwnerData);

  // Assign output parameters
  Result := Params;
  OwnerDataStream.AsVariant := OwnerData;
end;

function TDSProviderDataModuleAdapter.AS_GetProviderNames: string;
var
  List: TStringList;
  Names: OleVariant;
begin
  // Invoke the IAppServer method
  Names := FProviderDataModule.ProviderNamesToVariant;

  // Convert the OleVariant list of names into a comma delimited string
  List := TStringList.Create;
  try
    List.StrictDelimiter := True;
    VarArrayToStrings(Names, List);
    Result := List.CommaText;
  finally
    List.Free;
  end;
end;

function TDSProviderDataModuleAdapter.AS_GetRecords(const ProviderName: WideString; Count: Integer;
      out RecsOut: Integer; Options: Integer; const CommandText: WideString;
      ParamReader: TDBXStreamValue; OwnerDataStream: TDBXStreamValue): OleVariant;
var
  Params: OleVariant;
  OwnerData: OleVariant;
begin
  // Setup input parameters
  Params := ParamReader.AsVariant;
  OwnerData := OwnerDataStream.AsVariant;
  Result := Null;

  // Invoke the IAppServer method
  Result := FProviderDataModule.Providers[ProviderName].GetRecords(
    Count, RecsOut, Options, CommandText, Params, OwnerData);

  // Assign output parameters
  ParamReader.AsVariant := Params;
  OwnerDataStream.AsVariant := OwnerData;
end;

function TDSProviderDataModuleAdapter.AS_RowRequest(
  const ProviderName: WideString; RowStream: OleVariant; RequestType: Integer;
  OwnerDataStream: TDBXStreamValue): OleVariant;
var
  Row: OleVariant;
  OwnerData: OleVariant;
begin
  // Setup input parameters
  Row := RowStream;
  OwnerData := OwnerDataStream.AsVariant;

  // Invoke the IAppServer method
  Result := FProviderDataModule.Providers[ProviderName]
  .RowRequest(Row, RequestType, OwnerData);

  // Assign output parameters
  OwnerDataStream.AsVariant := OwnerData;
end;

{ TDSServerDriver }

procedure TDSServerDriver.Close;
begin
  inherited;

end;

constructor TDSServerDriver.Create(DBXDriverDef: TDBXDriverDef);
begin
  inherited Create(DBXDriverDef);
  rpr;
  InitDriverProperties(TDBXProperties.Create);
  // '' makes this the default command factory.
  //
  AddCommandFactory('', CreateServerCommand);
end;

function TDSServerDriver.CreateConnection(
  ConnectionBuilder: TDBXConnectionBuilder): TDBXConnection;
begin
    Result := TDSServerConnection.Create(ConnectionBuilder);
end;

function TDSServerDriver.CreateServerCommand(DbxContext: TDBXContext;
  Connection: TDBXConnection; MorphicCommand: TDBXCommand): TDBXCommand;
var
  ServerConnection: TDSServerConnection;
begin
  ServerConnection := Connection as TDSServerConnection;
  Result := TDSServerCommand.Create(DbxContext, ServerConnection, TDSServerHelp.GetServerConnectionHandler(ServerConnection));
end;

destructor TDSServerDriver.Destroy;
begin

  inherited;
end;

function TDSServerDriver.GetDriverVersion: UnicodeString;
begin
  Result := '1.0'; {Do not resource}
end;

{ TDSServerModuleBase }

procedure TDSServerModuleBase.BeforeDestruction;
begin
  //TDataModule
  Destroying;
  RemoveFixupReferences(Self, '');
  if not OldCreateOrder then DoDestroy;
end;

destructor TDSServerModuleBase.Destroy;
begin
  //TDataModule
  if OldCreateOrder then DoDestroy;
  if Assigned(RemoveDataModule) then
    RemoveDataModule(Self);
  //TComponent
  Destroying;
  RemoveFreeNotifications;
  DestroyComponents;
  // TPersistent
  RemoveFixups(Self);
  //TProviderDataModule
  CleanProviders;
end;

{ TDSCallbackTunnel }

procedure TDSCallbackTunnel.AddAllIds(container: TList<String>);
var
  Id: String;
  keyEnumerator: TDictionary<String, TStrings>.TKeyEnumerator;
begin
  Lock;
  try
    keyEnumerator := FCallbacks.Keys.GetEnumerator;
    while keyEnumerator.MoveNext do
    begin
      Id := keyEnumerator.Current;
      if not container.Contains(Id) then
        Container.Add(Id);
    end;
    keyEnumerator.Free;
  finally
    Unlock
  end;
end;

function TDSCallbackTunnel.AddId(const Id: String; Channels: TStrings): boolean;
var
  LChannels: TStrings;
begin
  Lock;
  try
    if not FCallbacks.ContainsKey(Id) then
    begin
      //copy the Channels passed in, and memory manage only the copy
      LChannels := TStringList.Create;
      if Channels <> nil then
        LChannels.AddStrings(Channels);
      FCallbacks.Add(Id, LChannels);
      exit(true);
    end;
    exit(false);
  finally
    Unlock
  end;
end;

procedure TDSCallbackTunnel.AddListeningOnChannelNames(var ChannelNames: TList<String>;
                                                       const AllowDuplicates: Boolean);
var
  LCBChannelNames: TStrings;
  Count, I: Integer;
  Curr: String;
begin
  if ChannelNames = nil then
    ChannelNames := TList<String>.Create;

  if (ServerChannelName <> EmptyStr) and
     (AllowDuplicates or (not ChannelNames.Contains(ServerChannelName))) then
    ChannelNames.Add(ServerChannelName);

  Lock;
  try
    for LCBChannelNames in FCallbacks.Values do
    begin
      Count := LCBChannelNames.Count - 1;
      for I := 0 to Count do
      begin
        Curr := LCBChannelNames.Strings[I];
        if (Curr <> EmptyStr) and (AllowDuplicates or (not ChannelNames.Contains(Curr))) then
          ChannelNames.Add(Curr);
      end;
    end;
  finally
    Unlock;
  end;
end;

function TDSCallbackTunnel.BroadcastMessage(const Msg: TJSONValue; ChannelName: String;
                       const Timeout: Cardinal; const ArgType: Integer): Boolean;
var
  QueueMessage: TDSCallbackTunnelBufferItem;
  WaitResult: TWaitResult;

begin
  if ChannelName = '' then
    ChannelName := FServerChannelName;

  QueueMessage := TDSCallbackTunnelBufferItem.Create(ChannelName, '', True, Msg, ArgType);

  {Try adding item to queue, if full simply return false (send failed)}
  try
    WaitResult := Queue.PushItem(QueueMessage);
  except
    Msg.Free;
    FreeAndNil(QueueMessage);
    raise Exception.Create(SInvalidTunnel);
  end;

  if WaitResult <> TWaitResult.wrSignaled then
  begin
    Msg.Free;
    FreeAndNil(QueueMessage);
    exit(false);
  end;

  TMonitor.Pulse(Queue);
  exit(true);
end;

function TDSCallbackTunnel.BroadcastMessage(const CallbackId: String; const Msg: TJSONValue;
                     const Timeout: Cardinal; const ArgType: Integer): Boolean;
var
  QueueMessage: TDSCallbackTunnelBufferItem;
  WaitResult: TWaitResult;
begin
  {The callback doesn't exist, so just return false}
  if not HasId(CallbackId) then
  begin
    Msg.Free; //free the message, since ownership was given to this method
    exit(false);
  end;

  QueueMessage := TDSCallbackTunnelBufferItem.Create(EmptyStr, CallbackId, True, Msg, ArgType);

  {Try adding item to queue, if failed (queue full) just return false to signify that the send failed}
  try
    WaitResult := Queue.PushItem(QueueMessage);
  except
    Msg.Free;
    FreeAndNil(QueueMessage);
    raise Exception.Create(SInvalidTunnel);
  end;

  if WaitResult <> TWaitResult.wrSignaled then
  begin
    Msg.Free;
    FreeAndNil(QueueMessage);
    exit(false);
  end;

  TMonitor.Pulse(Queue);
  exit(true);
end;
function TDSCallbackTunnel.CallbackCount: Integer;
begin
  Result := FCallbacks.Count;
end;

constructor TDSCallbackTunnel.Create(const ServerChannelName, ClientId, SecurityToken: String; const QueueSize: Integer);
begin
  FServerChannelName := ServerChannelName;
  FQueue := TThreadedQueue<TDSCallbackTunnelBufferItem>.Create(QueueSize, 10, 10);
  FCallbacks := TObjectDictionary<String, TStrings>.Create([doOwnsValues]);
  FClientId := ClientId;
  FSecurityToken := SecurityToken;
  FState := ctsWaitingOnServer;
  FServerName := EmptyStr;
  FTimeoutLength := 0;
end;

procedure TDSCallbackTunnel.GracefullyFreeTunnelItem(Item: TDSCallbackTunnelBufferItem);
begin
  if Assigned(Item) then
  begin
    //set instance owner to true, so when it is freed, so is the message it holds
    Item.InstanceOwner := True;
    //if it was a broadcast, we ignore the result and free the item
    if Item.IsBroadcast then
    begin
      if (FThinPop = Item) then
        FThinPop := nil;
      FreeAndNil(Item);
    end
    //if it is a notify, the thread that put the item in the queue
    //is waiting for a response, and is the instance owner of the item
    else
      TMonitor.Pulse(Item);
  end;
end;

destructor TDSCallbackTunnel.Destroy;
var
  Item: TDSCallbackTunnelBufferItem;
begin
  //cancel a timeout event, if one exists
  TDBXScheduler.Instance.CancelEvent(GetId);
  TMonitor.Enter(self);
  try
    FreeAndNil(FCallbacks);

    GracefullyFreeTunnelItem(FThinPop);

    if (FQueue <> nil) then
      while (FQueue.QueueSize > 0) and (FQueue.PopItem(Item) = wrSignaled) do
        GracefullyFreeTunnelItem(Item);

    if (FQueue <> nil) and not FQueue.ShutDown then
      FQueue.DoShutDown;
    FreeAndNil(FQueue);
  finally
    TMonitor.Exit(self);
  end;

  FreeAndNil(FCallbacks);

  inherited;
end;

function TDSCallbackTunnel.GetId: NativeInt;
begin
  exit(IntPtr(Pointer(Self)));
end;

function TDSCallbackTunnel.HasId(const Id: String): boolean;
begin
  Lock;
  try
    exit(FCallbacks.ContainsKey(Id))
  finally
    Unlock
  end;
end;

function TDSCallbackTunnel.ListeningOn(const ChannelName: String): Boolean;
var
  LCBChannelNames: TStrings;
begin
  Result := False;
  if ChannelName <> EmptyStr then
  begin
    Result := ChannelName = FServerChannelName;

    if not Result then
    begin
      Lock;
      try
        for LCBChannelNames in FCallbacks.Values do
        begin
          if (LCBChannelNames <> nil) and (LCBChannelNames.IndexOf(ChannelName) > -1) then
            exit(True);
        end;
      finally
        Unlock;
      end;
    end;
  end;
end;

procedure TDSCallbackTunnel.Lock;
begin
  TMonitor.Enter(self);
end;

function TDSCallbackTunnel.RemoveId(const Id: String): boolean;
var
  LCBChannelNames: TStrings;
begin
  Lock;
  try
    if FCallbacks.TryGetValue(Id, LCBChannelNames) then
    begin
      FCallbacks.Remove(Id);
    end;

    exit(FCallbacks.Count > 0)
  finally
    Unlock
  end;
end;

function TDSCallbackTunnel.SendMessage(const Id: String; const Msg: TJSONValue;
  out RespMsg: TJSONValue; const Timeout: Cardinal; const ArgType: Integer): Boolean;
var
  QueueMessage: TDSCallbackTunnelBufferItem;
  WaitResult: TWaitResult;
begin
  QueueMessage := TDSCallbackTunnelBufferItem.Create(EmptyStr, Id, False, Msg, ArgType);

  TMonitor.Enter(QueueMessage);
  try
    {Try adding item to queue, if full simply return false (send failed)}
    WaitResult := Queue.PushItem(QueueMessage);
    if WaitResult <> TWaitResult.wrSignaled then
    begin
      FreeAndNil(QueueMessage);
      exit(false);
    end;

    // notify the consumer
    TMonitor.Pulse(Queue);
    // wait for result
    if TMonitor.Wait(QueueMessage, Timeout) then
    begin
      RespMsg := QueueMessage.Response;

      if (RespMsg = nil) or (QueueMessage.IsError) then
        exit(false);

      exit(true);
    end;

    exit(false);
  finally
    if QueueMessage <> nil then
    begin
      TMonitor.Exit(QueueMessage);
      TMonitor.Enter(QueueMessage);
      FreeAndNil(QueueMessage);
    end;
  end;
end;

procedure TDSCallbackTunnel.SetState(State: TDSCallbackTunnelState);
begin
  FState := State;
  if TDBXScheduler.Instance <> nil then
  begin
    TDBXScheduler.Instance.CancelEvent(GetId);
    if State = ctsWaitingForClient then
    begin
      if (FTimeoutLength > 0) and (FServerName <> EmptyStr) then
        TDBXScheduler.Instance.AddEvent(GetId, TerminateTimedOutTunnel, FTimeoutLength)
    end;
  end;
end;

procedure TDSCallbackTunnel.TerminateTimedOutTunnel;
var
  DSServer: TDSServer;
begin
  //if the server isn't waiting for the client anymore, then no need to kill the tunnel
  if FState <> ctsWaitingForClient then
    exit;

  //look for the server instance, to remove the tunnel from
  DSServer := TDSServer.FindServer(FServerName) as TDSServer;
  if (DSServer <> nil) then
  begin
    DSServer.UnregisterChannelCallback(Self, false);
    TDSCallbackTunnelManagerInternal(TDSCallbackTunnelManager.Instance).CloseChannelTunnel(Self);
  end;
end;

procedure TDSCallbackTunnel.UnLock;
begin
  TMonitor.Exit(self);
end;

{ TDSCallbackTunnelBufferItem }

constructor TDSCallbackTunnelBufferItem.Create(const ChannelName: String; const CallbackId: String; const IsBroadcast: Boolean;
  const Msg: TJSONValue; const MsgType: Integer; const InstanceOwner: Boolean);
begin
  FChannelName := ChannelName;
  FCallbackId := CallbackId;
  FIsBroadcast := IsBroadcast;
  FMsg := Msg;
  FInstanceOwner := InstanceOwner;
  FArgType := MsgType;
end;

destructor TDSCallbackTunnelBufferItem.Destroy;
begin
  if FInstanceOwner then
    FreeAndNil(FMsg)
  else
    FMsg := nil;

  inherited Destroy;
end;

{ TDSCallbackTunnelManager }

constructor TDSCallbackTunnelManager.Create;
begin
  FListeners := TList<TDSCallbackTunnelEvent>.Create;
end;

destructor TDSCallbackTunnelManager.Destroy;
begin
  FreeAndNil(FListeners);
  inherited;
end;

procedure TDSCallbackTunnelManager.AddTunnelEvent(Event: TDSCallbackTunnelEvent);
begin
  if not FListeners.Contains(Event) then
    FListeners.Add(Event);
end;

function TDSCallbackTunnelManager.RemoveTunnelEvent(Event: TDSCallbackTunnelEvent): boolean;
begin
  if Assigned(FListeners) then
  begin
    exit(FListeners.Remove(Event) > -1);
  end;
  Result := False;
end;

{ TDSCallbackTunnelManagerInternal }

procedure TDSCallbackTunnelManagerInternal.AddCallbackToTunnel(const Tunnel: TDSCallbackTunnel;
  const CallbackId: String; ChannelNames: TStringList);
var
  EventItem: TDSCallbackTunnelEventItem;
begin
  if Tunnel <> nil then
  begin
    if Tunnel.AddId(CallbackId, ChannelNames) then
    begin
      EventItem.EventType := TDSCallbackTunnelEventType.CallbackAdded;
      EventItem.Tunnel := Tunnel;
      EventItem.TunnelId := Tunnel.ClientId;
      EventItem.TunnelChannelName := Tunnel.ServerChannelName;
      EventItem.CallbackId := CallbackId;
      EventItem.CallbackChannelNames := ChannelNames;

      NotifyEvents(EventItem);
    end;
  end;
end;

function TDSCallbackTunnelManagerInternal.RemoveCallbackFromTunnel(const Tunnel: TDSCallbackTunnel;
  const CallbackId: String): Boolean;
var
  EventItem: TDSCallbackTunnelEventItem;
begin
  Result := Tunnel.CallbackCount > 0;
  if Result and Tunnel.HasId(CallbackId) then
  begin
    Result := Tunnel.RemoveId(CallbackId);

    EventItem.EventType := TDSCallbackTunnelEventType.CallbackRemoved;
    EventItem.Tunnel := Tunnel;
    EventItem.TunnelId := Tunnel.ClientId;
    EventItem.TunnelChannelName := Tunnel.ServerChannelName;
    EventItem.CallbackId := CallbackId;

    NotifyEvents(EventItem);
  end;
end;

function TDSCallbackTunnelManagerInternal.CreateChannelTunnel(const ServerChannelName, ClientId, SecurityToken: String;
                                                      const QueueSize: Integer): TDSCallbackTunnel;
var
  EventItem: TDSCallbackTunnelEventItem;
begin
  Result := TDSCallbackTunnel.Create(ServerChannelName, ClientId, SecurityToken, QueueSize);

  EventItem.EventType := TDSCallbackTunnelEventType.TunnelCreate;
  EventItem.Tunnel := Result;
  EventItem.TunnelId := Result.ClientId;
  EventItem.TunnelChannelName := Result.ServerChannelName;

  NotifyEvents(EventItem);
end;

procedure TDSCallbackTunnelManagerInternal.CloseChannelTunnel(tunnel: TDSCallbackTunnel);
var
  EventItem: TDSCallbackTunnelEventItem;
begin
  if tunnel <> nil then
  begin
    EventItem.EventType := TDSCallbackTunnelEventType.TunnelClose;
    EventItem.Tunnel := tunnel;
    EventItem.TunnelId := tunnel.ClientId;
    EventItem.TunnelChannelName := tunnel.ServerChannelName;

    NotifyEvents(EventItem);

    tunnel.Free;
  end;
end;

procedure TDSCallbackTunnelManagerInternal.NotifyEvents(EventItem: TDSCallbackTunnelEventItem);
var
  Event: TDSCallbackTunnelEvent;
begin
  if Assigned(FListeners) then
  begin
    for Event in FListeners do
    begin
      try
        Event(Self, EventItem);
      except
      end;
    end;
  end;
end;

initialization
  TDSServer.FServerList := TDBXArrayList.Create;
  TDSCallbackTunnelManager.FInstance := TDSCallbackTunnelManagerInternal.Create;

finalization
  TDSCallbackTunnelManager.FInstance.Free;
  FreeAndNil(TDSServer.FServerList);

end.
