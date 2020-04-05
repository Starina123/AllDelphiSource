{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXTransport;

interface

uses
  System.Classes,
  Data.DBXCommon,
  Data.DBXEncryption,
  Data.DBXPlatform,
  System.SysUtils;

type
  TDBXChannelInfo = class;
  TTransportFilterCollection = class;

  TDbxChannel = class abstract
  public
    procedure Open; virtual; abstract;
    procedure Close; virtual; abstract;
    function Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; virtual; abstract;
    function Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; virtual; abstract;
    destructor Destroy; override;
  protected
    ///<summary>Specifies if there is an open connection or not.  By default, always
    ///  returns false.  Descendent classes should override and implement check for active connection.
    ///</summary>
    ///<returns>False if connection is active.</returns>
    function IsConnectionLost: Boolean; virtual;
    function GetChannelInfo: TDBXChannelInfo; virtual; abstract;
    function GetDBXProperties: TDBXProperties; virtual;
    procedure SetDBXProperties(const Properties: TDBXProperties); virtual;
  protected
    FChannelInfo: TDBXChannelInfo;
  private
    FDbxProperties: TDBXProperties;
  public
    property ChannelInfo: TDBXChannelInfo read GetChannelInfo;
    property DBXProperties: TDBXProperties read GetDBXProperties write SetDBXProperties;
    ///<summary>Flag which returns false if connected and true if not connected.</summary>
    ///<returns>False if connected, True if not connected</returns>
    property ConnectionLost: Boolean read IsConnectionLost;
  end;

  /// <summary> Holds information about a connected client, such as IP address and comunication protocol.
  /// </summary>
  TDBXClientInfo = record
    IpAddress: String;
    ClientPort: String;
    Protocol: String;
    AppName: String;
  end;

  TDBXChannelInfo = class
  public
    constructor Create(const AId: Integer);
  protected
    function GetInfo: UnicodeString; virtual;
  private
    FId: Integer;
    FClientInfo: TDBXClientInfo;
  public
    property Id: Integer read FId;
    property Info: UnicodeString read GetInfo;
    property ClientInfo: TDBXClientInfo read FClientInfo write FClientInfo;
  end;

  
  /// <summary> Factory of various implementations of TCommunicationLayer 
  /// 
  /// </summary>
  TDBXCommunicationLayerFactory = class
  public
    
    /// <summary> Returns the factory instance
    ///  
    /// </summary>
    /// <returns>factory instance</returns>
    class function Instance: TDBXCommunicationLayerFactory; static;
    class procedure RegisterLayer(const CommLayerId: UnicodeString; const CommLayerClass: TObjectClass); static;
    class procedure UnregisterLayer(const CommLayerId: UnicodeString); static;
    class function CommunicationLayer(const Id: UnicodeString): TDBXCommunicationLayer; static;
    class function RegisteredLayerList: TDBXStringArray; static;
    
    /// <summary> Default initializations
    /// </summary>
    constructor Create;
    destructor Destroy; override;
  private
    class var FSingleton: TDBXCommunicationLayerFactory;
    FRegisteredLayers: TDBXObjectStore;
  end;

  
  /// <summary> Channel for interfacing the in-process data processing.
  /// </summary>
  /// <remarks> 
  ///  Implements two-process producer and consumer paradigm where
  ///  data is exchanged in alternate steps
  /// 
  /// </remarks>
  TDBXLocalChannel = class(TDbxChannel)
  public
    constructor Create(const ServerName: UnicodeString);
    destructor Destroy; override;
    
    /// <summary> see com.borland.dbx.transport.DbxChannel#close()
    /// </summary>
    procedure Close; override;
    
    /// <summary> see com.borland.dbx.transport.DbxChannel#open()
    /// </summary>
    procedure Open; override;
    
    /// <summary> see com.borland.dbx.transport.DbxChannel#read(byte[], int, int)
    /// </summary>
    function Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    function WriteLocalData(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; virtual;
    
    /// <summary> see com.borland.dbx.transport.DbxChannel#write(byte[], int, int)
    /// </summary>
    function Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; override;
    function ReadLocalData(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer; virtual;
    function HasReadData: Boolean; virtual;
    function HasWriteData: Boolean; virtual;
  protected
    
    /// <summary> see com.borland.dbx.transport.DbxChannel#getChannelInfo()
    /// </summary>
    function GetChannelInfo: TDBXChannelInfo; override;
  private
    FReadBuffer: TBytes;
    FReadCount: Integer;
    FReadOffset: Integer;
    FHasReadData: Boolean;
    FWriteBuffer: TBytes;
    FWriteCount: Integer;
    FWriteOffset: Integer;
    FHasWriteData: Boolean;
  end;

  
  /// <summary> 
  ///  Transport channel related information for a socket based transport.
  /// </summary>
  TDBXSocketChannelInfo = class(TDBXChannelInfo)
  public
    constructor Create(const AId: NativeInt; const AInfo: UnicodeString);
  protected
    
    /// <summary> Provide general information on the channel.
    /// </summary>
    /// <returns>general information on the channel.</returns>
    function GetInfo: UnicodeString; override;
  private
    FInfo: UnicodeString;
  end;

  
  /// <summary> Collection of strings wrapping a Transport Filter public property collection
  /// </summary>
  TFilterProperties = class(TBaseFilterProperties)
  end;

  
  /// <summary> Parent class for transport filters that are invoke-able if present in the
  ///  transport chain of command filter list.
  /// </summary>
  /// <remarks> 
  /// 
  /// </remarks>
  TTransportFilter = class abstract(TBaseTransportFilter)
  public
    
    /// <summary> Utility method, encodes a byte stream into a hex string
    ///  
    /// </summary>
    /// <param name="data">byte array, never null</param>
    /// <param name="pos">valid byte array position </param>
    /// <param name="dataLength">valid length of byte array to be transformed into a string</param>
    /// <returns>String representation of the byte array</returns>
    class function Encode(const Data: TBytes; const Pos: Integer; const DataLength: Integer): UnicodeString; static;
    
    /// <summary> Decodes the encoded string into a byte array. The decoding only works if the byte array was originally encoded with encode(byte[],int,int)
    /// </summary>
    /// <remarks> The decoding only works if the byte array was originally encoded with encode(byte[],int,int)
    ///  
    /// </remarks>
    /// <param name="strData">encoded string</param>
    /// <returns>decoded string as byte array</returns>
    class function Decode(const StrData: UnicodeString): TBytes; static;
    
    /// <summary> Default ctr, empty here
    /// </summary>
    constructor Create; override;
    
    /// <summary> Returns the filter id, used by the filter factory to create an instance.
    /// </summary>
    /// <remarks> Filter id can be present multiple times in a transport filter chain. 
    ///  
    /// </remarks>
    /// <returns>String - filter id, never null</returns>
    function Id: UnicodeString; virtual; abstract;
    
    /// <summary> Returns the parameter value as a String. 
    /// </summary>
    /// <remarks> 
    ///  
    ///  It is the implementation responsibility to convert the parameter value from internal type to string and back. 
    ///  
    /// </remarks>
    /// <param name="paramName">String - filter parameter name</param>
    /// <returns>String - filter parameter value
    ///  see #getParameters()</returns>
    function GetParameterValue(const ParamName: UnicodeString): UnicodeString; virtual;
    
    /// <summary> Provides the parameter value as a string. It is called with the values
    /// </summary>
    /// <remarks> It is called with the values
    ///  the developer sets during design time or runtime.
    ///  
    /// </remarks>
    /// <param name="paramName">String - parameter name</param>
    /// <param name="paramValue">byte[] - parameter value</param>
    /// <returns>boolean - false if parameter value was not changed successfully
    ///  see #getUserParameters()
    ///  see #getParameterValue(String)</returns>
    function SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; virtual;
    
    /// <summary> Called by the communication layer with the partner parameter values. 
    /// </summary>
    /// <remarks> 
    ///  Such values may contain public keys, shared secrets, authentication tokens
    ///  that can be used to encrypt/decrypt the messages.
    ///  
    ///  The parameter names and values are obtained from getParameter* counter-part
    ///  methods. The implementation of this class should take care of the symmetry,
    ///  local parameter values are confederate at the other side and vice-versa.
    ///  
    /// </remarks>
    /// <param name="paramName">String - parameter name</param>
    /// <param name="paramValue">String - parameter value, as a string</param>
    /// <returns>true if the parameter and value are valid. On false, the protocol
    ///    should not continue the communication. </returns>
    function SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; virtual;
    
    /// <summary> Filters the "clear" input data bytes. If returns null, an error occurred.
    /// </summary>
    /// <remarks> If returns null, an error occurred.
    ///  Represents the inverse of processOutput.
    ///  
    /// </remarks>
    /// <param name="data">byte[] - input data, never null</param>
    /// <returns>byte[] - processed byte block, may be null</returns>
    function ProcessInput(const Data: TBytes): TBytes; virtual; abstract;
    
    /// <summary> Process the filtered data back into "clear" data bytes. 
    /// </summary>
    /// <remarks> 
    ///  
    ///  Null result signals an error. Represents the inverse of processInput: 
    ///         processOutput(processInput(data)) == data
    ///  
    /// </remarks>
    /// <param name="data">byte[] - filtered data, never null</param>
    /// <returns>byte[] - clear byte block, may be null on error
    ///  see #processInput(byte[])</returns>
    function ProcessOutput(const Data: TBytes): TBytes; virtual; abstract;
    
    /// <summary> Marks the beginning of the handshake process
    /// </summary>
    procedure StartHandshake; virtual;
    
    /// <summary> Marks the end of the handshake process, returns the filter status
    /// </summary>
    /// <returns>boolean - true if all parameters match and the filter will be able 
    ///  to process I/O data</returns>
    function HandshakeComplete: Boolean; virtual;
    function GetCollectionFilter(const FilterId: UnicodeString): TTransportFilter; virtual;
  protected
    
    /// <summary> Returns a list of available/query-able parameters. This list contains the user parameters together with other parameters that may be needed by the handshake protocol. 
    /// </summary>
    /// <remarks> This list contains the user parameters together with other parameters that may be needed by the handshake protocol. 
    ///  
    ///  The parameter's value will be passed to their counterparts during handshake protocol. The
    ///  parameters will be invoked in the provided order. If the same parameter is
    ///  present multiple times multiple calls will be made to get its value.
    ///  
    /// </remarks>
    /// <returns>String[] - list of parameters, can be null</returns>
    function GetParameters: TDBXStringArray; virtual;
    
    /// <summary> Returns a list of parameters that user can change. 
    /// </summary>
    /// <remarks> 
    ///  
    /// </remarks>
    /// <returns>String[] - list of parameters, can be null</returns>
    function GetUserParameters: TDBXStringArray; virtual;
    procedure SetServerInstance(const IsServerSide: Boolean); virtual;
    function IsPublicKeyCryptograph: Boolean; virtual;
    function IsServerInstance: Boolean; virtual;
    function IsClientInstance: Boolean; virtual;
    function GetFilterCollection: TTransportFilterCollection; virtual;
    procedure SetFilterCollection(const FilterCollection: TTransportFilterCollection); virtual;
    
    /// <summary> Returns true if we are in the middle of the handshake process
    /// </summary>
    /// <returns>boolean - true if the handshake process is active</returns>
    function IsHandshakeStarted: Boolean; virtual;
  private
    FServerInstance: Boolean;
    FFilterCollection: TTransportFilterCollection;
    FHandshakeStarted: Boolean;
  public
    
    /// <summary> Returns a list of available/query-able parameters. This list contains the user parameters together with other parameters that may be needed by the handshake protocol. 
    /// </summary>
    /// <remarks> This list contains the user parameters together with other parameters that may be needed by the handshake protocol. 
    ///  
    ///  The parameter's value will be passed to their counterparts during handshake protocol. The
    ///  parameters will be invoked in the provided order. If the same parameter is
    ///  present multiple times multiple calls will be made to get its value.
    ///  
    /// </remarks>
    /// <returns>String[] - list of parameters, can be null</returns>
    property Parameters: TDBXStringArray read GetParameters;
    
    /// <summary> Returns a list of parameters that user can change. 
    /// </summary>
    /// <remarks> 
    ///  
    /// </remarks>
    /// <returns>String[] - list of parameters, can be null</returns>
    property UserParameters: TDBXStringArray read GetUserParameters;
    property PublicKeyCryptograph: Boolean read IsPublicKeyCryptograph;
    property ServerInstance: Boolean read IsServerInstance write SetServerInstance;
    property ClientInstance: Boolean read IsClientInstance;
    property FilterCollection: TTransportFilterCollection read GetFilterCollection write SetFilterCollection;
    
    /// <summary> Returns true if we are in the middle of the handshake process
    /// </summary>
    /// <returns>boolean - true if the handshake process is active</returns>
    property HandshakeStarted: Boolean read IsHandshakeStarted;
  end;

  
  /// <summary> Out of the box transport encryption filter. Implements PC1 algorithm.
  /// </summary>
  /// <remarks> Implements PC1 algorithm.
  /// 
  /// </remarks>
  TTransportCypherFilter = class sealed(TTransportFilter)
  public
    
    /// <summary> see TransportFilter#getParameterValue(String)
    /// </summary>
    function GetParameterValue(const ParamName: UnicodeString): UnicodeString; override;
    
    /// <summary> Encrypts data in place. Original values will be lost.
    /// </summary>
    /// <remarks> Original values will be lost.
    ///  
    /// </remarks>
    /// <seealso cref="TTransportFilter.processInput(TBytes)"/>
    function ProcessInput(const Data: TBytes): TBytes; override;

    /// <summary> Decrypts data in place. Original values will be lost.
    /// </summary>
    /// <remarks> Original values will be lost.
    ///
    /// </remarks>
    /// <seealso cref="TTransportFilter.processOutput(TBytes)"/>
    function ProcessOutput(const Data: TBytes): TBytes; override;
    
    /// <summary> see TransportFilter#setParameterValue(String, String)
    /// </summary>
    function SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;
    function SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;

    /// <summary> see TransportFilter#id()
    /// </summary>

    function Id: UnicodeString; override;
  protected
    function GetClearKey: UnicodeString;
    
    /// <summary> see TransportFilter#getUserParameters()
    /// </summary>
    function GetUserParameters: TDBXStringArray; override;
    
    
    /// <seealso cref="TTransportFilter.getParameters()"/>
    function GetParameters: TDBXStringArray; override;
  private
    
    /// <summary> Initializes PC1 filter instance and returns it. Does so due to thread safety concerns
    /// </summary>
    /// <remarks> Does so due to thread safety concerns
    ///  
    /// </remarks>
    /// <returns>PC1Cypher instance</returns>
    function SetUp(const Key: UnicodeString): TPC1Cypher;
    
    /// <summary> Frees the cypher instance. Past this call the cypher should never be used again.
    /// </summary>
    /// <remarks> Past this call the cypher should never be used again.
    ///  
    /// </remarks>
    /// <param name="cypher">PC1Cypher instance, never null</param>
    procedure TearDown(const Cypher: TPC1Cypher);
  private
    FCypherKey: UnicodeString;
    FConfederateKey: UnicodeString;
  private
    property ClearKey: UnicodeString read GetClearKey;
  private
    const Key = 'Key';
    const Code = 'CODE';
    const Filterunit = 'FilterUnit';
  end;

  
  /// <summary> Collection of Transport Filters
  /// </summary>
  TTransportFilterCollection = class(TBaseTransportFilterCollection)
  public
    constructor Create;
    
    /// <summary> Creates a new filter instance and adds it to the current list, returns the position where it was added.
    /// </summary>
    /// <remarks> Returns -1 if the parameter is null or empty. The list allows duplicates.
    ///  
    /// </remarks>
    /// <param name="filterId">String - filter id, not null or empty</param>
    /// <returns>integer - zero based index of the newly added filter id</returns>
    function AddFilter(const FilterId: UnicodeString): Integer; overload; virtual;
    
    /// <summary> Adds an existing filter instance to the current list, returns the position where it was added.
    /// </summary>
    /// <remarks> Returns -1 if the parameter is null. The list allows duplicates.
    ///  
    /// </remarks>
    /// <param name="filter">TTransportFilter - filter, not null or empty</param>
    /// <returns>integer - zero based index of the newly added filter</returns>
    function AddFilter(const Filter: TTransportFilter): Integer; overload; virtual;
    
    /// <summary> Removes a filter id from the current list based on index. The entire list shifts "up" for all elements beyond argument.
    /// </summary>
    /// <remarks> The entire list shifts "up" for all elements beyond argument.
    ///  
    ///  Returns false if the operation failed (index out of bounds for example).
    ///  
    /// </remarks>
    /// <param name="index">integer - filter id position</param>
    /// <returns>boolean - true if the removal was successful</returns>
    function RemoveFilter(const Index: Integer): Boolean; virtual;
    
    /// <summary> Returns the transport filter instance from a zero-based given position.
    /// </summary>
    /// <remarks> 
    ///  Returns null is index is out of range.
    ///  
    /// </remarks>
    /// <param name="pos">filter index, zero based</param>
    /// <returns>transport filter index, null if the parameter is out of range</returns>
    function GetFilter(const Pos: Integer): TTransportFilter; overload; virtual;
    
    /// <summary> Returns the transport filter based on id. 
    /// </summary>
    /// <remarks> 
    ///  
    ///  It is not recommended to use this method when filters sharing the same id 
    ///  are present in the collection as only the first occurance will be returned.
    ///   
    /// </remarks>
    /// <param name="id">- String : the filter id</param>
    /// <returns>TransportFilter instance or null if not found</returns>
    function GetFilter(const Id: UnicodeString): TTransportFilter; overload; virtual;
    
    /// <summary> Marks the end of the handshake phase and returns true if all filters
    ///  are accepting the parameters.
    /// </summary>
    /// <remarks> 
    /// </remarks>
    /// <returns>boolean - true if the handshake was successful.</returns>
    function HandshakeComplete: Boolean; virtual;
    
    /// <summary> Start the handshake phase
    /// </summary>
    procedure StartHandshake; virtual;
    
    /// <summary> Filter list as JSON string
    /// </summary>
    /// <returns>JSON string representation of filter list</returns>
    function ToJSON: UnicodeString; virtual;
    /// <summary> Filter list from JSON string. </summary>
    /// <returns>TTransportFilterCollection representation of the JSON string</returns>
    class function FromJSON(const Json: UnicodeString): TTransportFilterCollection; static;
  protected
    
    /// <summary> Returns the list of filters, result can be empty but never null.
    /// </summary>
    /// <remarks> 
    /// </remarks>
    /// <returns>String[] - list of current filters</returns>
    function GetFilterIdList: TDBXStringArray; virtual;
  public
    
    /// <summary> Returns the list of filters, result can be empty but never null.
    /// </summary>
    /// <remarks> 
    /// </remarks>
    /// <returns>String[] - list of current filters</returns>
    property FilterIdList: TDBXStringArray read GetFilterIdList;
  end;

  
  /// <summary> Filter factory for transport filters.
  /// </summary>
  /// <remarks> 
  /// </remarks>
  TTransportFilterFactory = class
  public
    
    /// <summary> Returns the factory instance.
    /// </summary>
    /// <remarks> 
    ///  Lazy initialization.
    ///  
    /// </remarks>
    /// <returns>- filter factory instance</returns>
    class function Instance: TTransportFilterFactory; static;
    
    /// <summary> Creates a filter instance based on filter id.
    /// </summary>
    /// <remarks> 
    /// </remarks>
    /// <param name="filterId">filter id, not null</param>
    /// <returns>filter instance</returns>
    class function CreateFilter(const FilterId: UnicodeString): TTransportFilter; static;
    
    /// <summary> Registers a filter metaclass with the transport filter factory. 
    /// </summary>
    /// <remarks> 
    ///  
    ///  An filter instance can be obtained through createFilter.
    ///  
    /// </remarks>
    /// <param name="filterId">filter id</param>
    /// <param name="filterClass">filter metaclass
    ///  see TransportFilter#id()
    ///  see #createFilter(String)</param>
    class procedure RegisterFilter(const FilterId: UnicodeString; const FilterClass: TObjectClass); overload; static;
    
    /// <summary> Registers the filter class with the factory. 
    /// </summary>
    /// <remarks> 
    ///  
    ///  It uses the id function to obtain the registration key that is visible at the design time.
    ///  Throws runtime exception if the reflection fails
    ///  
    /// </remarks>
    /// <param name="filterClass">filter class type</param>
    class procedure RegisterFilter(const FilterClass: TObjectClass); overload; static;
    
    /// <summary> Unregisters a filter from the filter factory using the filter id.
    /// </summary>
    /// <remarks> 
    ///  No checks are made if the filter was previously defined.
    ///  
    /// </remarks>
    /// <param name="filterId">filter id
    ///  see #registerFilter(String, Class)</param>
    class procedure UnregisterFilter(const FilterId: UnicodeString); overload; static;
    
    /// <summary> Unregisters a filter type class from the factory.
    /// </summary>
    /// <remarks> 
    /// </remarks>
    /// <param name="filterClass">registered filter class type </param>
    class procedure UnregisterFilter(const FilterClass: TObjectClass); overload; static;
    
    /// <summary> Returns the registered filter's id list
    ///  
    /// </summary>
    /// <returns>filter's id list</returns>
    class function RegisteredFiltersId: TDBXStringArray; static;
    
    /// <summary> Default constructor
    /// </summary>
    constructor Create;
    destructor Destroy; override;
  private
    class var FSingleton: TTransportFilterFactory;
    FRegisteredFilters: TDBXObjectStore;
  end;


  /// <summary>
  /// </summary>
  TTransportFilterItem = class(TBaseTransportFilterItem)
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
  protected
    procedure SetFilterId(const FilterId: UnicodeString); virtual;
    function GetFilterId: UnicodeString; virtual;
    function GetFilter: TTransportFilter; virtual;
    procedure SetFilter(const Filter: TTransportFilter); virtual;
    procedure SetProperties(const Value: TFilterProperties); virtual;
    function GetProperties: TFilterProperties; virtual;
  private
    FFilterId: UnicodeString;
    FFilter: TTransportFilter;
    FFilterProperties: TFilterProperties;
    FFilterPropertiesChanged: Boolean;
    procedure UpdateFilterProperties;
    procedure UpdateFilter;
    procedure OnFilterPropertiesChange(Sender: TObject);
  public
    property Filter: TTransportFilter read GetFilter write SetFilter;
  published
    property FilterId: UnicodeString read GetFilterId write SetFilterId;
    property Properties: TFilterProperties read GetProperties write SetProperties;
  end;

  
  /// <summary> Utility class for data processing
  ///  
  /// </summary>
  TTransportFilterTools = class
  public
    
    /// <summary> Compose a query filter, recognizable by isFilterQuery method.
    /// </summary>
    /// <remarks> 
    ///  The processing is done "in place", i.e. the argument is changed and returned for convenience.
    ///  
    /// </remarks>
    /// <param name="buffer">header byte[] container, normally with a length of HEADER_LEN</param>
    /// <returns>the argument as query header, for convenience</returns>
    class function FilterQuery(const Buffer: TBytes): TBytes; static;
    
    /// <summary> Returns true if argument is a filter query
    ///  
    /// </summary>
    /// <param name="buffer">header byte[] container, with a length of HEADER_LEN</param>
    /// <returns>true if the header is a query header</returns>
    class function IsFilterQuery(const Buffer: TBytes): Boolean; static;
    
    /// <summary> Encodes header with "NO FILTER PRESENT" code.
    /// </summary>
    /// <remarks> 
    ///  Method changes the argument, returns it for convenience.
    ///  
    /// </remarks>
    /// <param name="buffer">byte[] header</param>
    /// <returns>changed argument</returns>
    class function NoFilter(const Buffer: TBytes): TBytes; static;
    
    /// <summary> Returns true if the argument header is "NO FILTER PRESENT"
    ///  
    /// </summary>
    /// <param name="buffer">byte[] header buffer</param>
    /// <returns>true if the header means no filter</returns>
    class function HasNoFilter(const Buffer: TBytes): Boolean; static;
    
    /// <summary> Returns true if the header prefixes a public key message
    /// </summary>
    /// <param name="buffer">- public key header</param>
    /// <returns>boolean - true if the header prefixes a public key, false otherwise</returns>
    class function HasPublicKey(const Buffer: TBytes): Boolean; static;
    
    /// <summary> Returns true if there is at least one public key cryptograph filter in
    ///  the filter list
    ///  
    /// </summary>
    /// <param name="filterList">- filter list</param>
    /// <returns>boolean</returns>
    class function HasPublicKeyCryptography(const FilterList: TTransportFilterCollection): Boolean; static;
    
    /// <summary> Serializes len argument into given byte container
    ///  
    /// </summary>
    /// <param name="data">- byte container</param>
    /// <param name="len">- integer</param>
    class procedure EncodeDataLength(const Data: TBytes; const Len: Integer); static;

    /// <summary> Serializes len argument into given byte container
    ///
    /// </summary>
    /// <param name="data">- byte container</param>
    /// <param name="len">- integer</param>
    class procedure EncodePublicKeyLength(const Data: TBytes; const Len: Integer); static;
    
    /// <summary> Returns the encoded integer argument
    ///  
    /// </summary>
    /// <param name="data">byte container</param>
    /// <returns>int - encoded integer</returns>
    class function DecodeDataLen(const Data: TBytes): Integer; static;
  public
    const HeaderLen = 5;
  private
    const HeaderFilter = 13;
    const HeaderQuery = 5;
    const HeaderNoFilter = 6;
    const HeaderPublicKey = 7;
  end;

implementation

uses
  Data.DBXJSON,
  Data.DBXCommonResStrs,
  Data.DBXClientResStrs
;

function TDbxChannel.IsConnectionLost: Boolean;
begin
  exit(False);
end;

function TDbxChannel.GetDBXProperties: TDBXProperties;
begin
  Result := FDbxProperties;
end;

procedure TDbxChannel.SetDBXProperties(const Properties: TDBXProperties);
begin
  self.FDbxProperties := Properties;
end;

destructor TDbxChannel.Destroy;
begin
  FreeAndNil(FChannelInfo);
  inherited Destroy;
end;

constructor TDBXChannelInfo.Create(const AId: Integer);
begin
  inherited Create;
  FId := AId;
end;

function TDBXChannelInfo.GetInfo: UnicodeString;
begin
  Result := ToString;
end;

class function TDBXCommunicationLayerFactory.Instance: TDBXCommunicationLayerFactory;
begin
  if FSingleton = nil then
    FSingleton := TDBXCommunicationLayerFactory.Create;
  Result := FSingleton;
end;

class procedure TDBXCommunicationLayerFactory.RegisterLayer(const CommLayerId: UnicodeString; const CommLayerClass: TObjectClass);
var
  Factory: TDBXCommunicationLayerFactory;
begin
  Factory := Instance;
  Factory.FRegisteredLayers[CommLayerId] := TObject(CommLayerClass);
end;

class procedure TDBXCommunicationLayerFactory.UnregisterLayer(const CommLayerId: UnicodeString);
begin
  Instance.FRegisteredLayers.Delete(Instance.FRegisteredLayers.IndexOf(CommLayerId));
  if Instance.FRegisteredLayers.Count = 0 then
    Instance.Free;
end;

class function TDBXCommunicationLayerFactory.CommunicationLayer(const Id: UnicodeString): TDBXCommunicationLayer;
var
  Clazz: TObjectClass;
begin
  Clazz := TObjectClass(Instance.FRegisteredLayers[Id]);
  if Clazz <> nil then
  begin
    try
      Exit(TDBXCommunicationLayer(Clazz.Create));
    except
      on E: Exception do
        ;
    end;
    Result := nil;
  end
  else 
    Result := nil;
end;

class function TDBXCommunicationLayerFactory.RegisteredLayerList: TDBXStringArray;
var
  List: TDBXStringArray;
  I: Integer;
  Keys: TDBXKeyEnumerator;
begin
  SetLength(List,Instance.FRegisteredLayers.Count);
  I := 0;
  Keys := Instance.FRegisteredLayers.Keys;
  while Keys.MoveNext do
    List[IncrAfter(I)] := UnicodeString(Keys.Current);
  Result := List;
end;

constructor TDBXCommunicationLayerFactory.Create;
begin
  inherited Create;
  FRegisteredLayers := TDBXObjectStore.Create;
end;

destructor TDBXCommunicationLayerFactory.Destroy;
begin
  FreeAndNil(FRegisteredLayers);
  FSingleton := nil;
  inherited Destroy;
end;

constructor TDBXLocalChannel.Create(const ServerName: UnicodeString);
begin
  inherited Create;
  FChannelInfo := TDBXSocketChannelInfo.Create(0, ServerName);
  FHasReadData := False;
  FHasWriteData := False;
end;

destructor TDBXLocalChannel.Destroy;
begin
  FReadBuffer := nil;
  FWriteBuffer := nil;
  inherited Destroy;
end;

procedure TDBXLocalChannel.Close;
begin
end;

function TDBXLocalChannel.GetChannelInfo: TDBXChannelInfo;
begin
  Result := FChannelInfo;
end;

procedure TDBXLocalChannel.Open;
begin
end;

function TDBXLocalChannel.Read(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
var
  Size: Integer;
begin
  if not FHasWriteData then
    raise TDBXError.Create(0, SNoReadDataAvailable);
  Size := Count;
  if Count > FWriteCount then
    Size := FWriteCount;
  TDBXPlatform.CopyByteArray(FWriteBuffer, FWriteOffset, Buffer, Offset, Size);
  FWriteCount := FWriteCount - Size;
  FWriteOffset := FWriteOffset + Size;
  if FWriteCount = 0 then
  begin
    FWriteBuffer := nil;
    FHasWriteData := False;
  end;
  Result := Size;
end;

function TDBXLocalChannel.WriteLocalData(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
begin
  if FHasWriteData then
    raise TDBXError.Create(0, SNoWriteDataAvailable);
  FWriteBuffer := Buffer;
  FHasWriteData := True;
  FWriteCount := Count;
  FWriteOffset := Offset;
  Result := Count;
end;

function TDBXLocalChannel.Write(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
begin
  if FHasReadData then
    raise TDBXError.Create(0, SNoWriteDataAvailable);
  SetLength(FReadBuffer,Count - Offset);
  TDBXPlatform.CopyByteArray(Buffer, Offset, FReadBuffer, 0, Count);
  FHasReadData := True;
  FReadCount := Count;
  FReadOffset := 0;
  Result := Count;
end;

function TDBXLocalChannel.ReadLocalData(const Buffer: TBytes; const Offset: Integer; const Count: Integer): Integer;
var
  Size: Integer;
begin
  if not FHasReadData then
    raise TDBXError.Create(0, SNoReadDataAvailable);
  Size := Count;
  if FReadCount < Count then
    Size := FReadCount;
  TDBXPlatform.CopyByteArray(FReadBuffer, FReadOffset, Buffer, Offset, Size);
  FReadCount := FReadCount - Size;
  FReadOffset := FReadOffset + Size;
  if FReadCount = 0 then
  begin
    FReadBuffer := nil;
    FHasReadData := False;
  end;
  Result := Size;
end;

function TDBXLocalChannel.HasReadData: Boolean;
begin
  Result := FHasReadData;
end;

function TDBXLocalChannel.HasWriteData: Boolean;
begin
  Result := FHasWriteData;
end;

constructor TDBXSocketChannelInfo.Create(const AId: NativeInt; const AInfo: UnicodeString);
begin
  inherited Create(AId);
  FInfo := AInfo;
end;

function TDBXSocketChannelInfo.GetInfo: UnicodeString;
begin
  Result := FInfo;
end;

class function TTransportFilter.Encode(const Data: TBytes; const Pos: Integer; const DataLength: Integer): UnicodeString;
var
  StrBuf: TDBXStringBuffer;
  Size: Integer;
  I: Integer;
  HexDig: Integer;
  EncStr: UnicodeString;
begin
  StrBuf := TDBXStringBuffer.Create;
  Size := DataLength;
  if DataLength < 0 then
    Size := Length(Data);
  for i := Pos to Size - 1 do
  begin
    HexDig := (Data[I] and 240) shr 4;
    StrBuf.Append(WideChar(TJSONString.Hex(HexDig)));
    HexDig := Data[I] and 15;
    StrBuf.Append(WideChar(TJSONString.Hex(HexDig)));
  end;
  EncStr := StrBuf.ToString;
  FreeAndNil(StrBuf);
  Result := EncStr;
end;

class function TTransportFilter.Decode(const StrData: UnicodeString): TBytes;
var
  Data: TBytes;
  Val: Integer;
  J: Integer;
  I: Integer;
begin
  SetLength(Data,Length(StrData) shr 1);
  J := 0;
  I := 0;
  while I < Length(StrData) do
  begin
    Val := TJSONObject.HexToDecimal(Ord(StrData[1+IncrAfter(I)])) shl 4;
    Val := Val or TJSONObject.HexToDecimal(Ord(StrData[1+IncrAfter(I)]));
    Data[IncrAfter(J)] := Byte(Val);
  end;
  Result := Data;
end;

constructor TTransportFilter.Create;
begin
  inherited Create;
  FHandshakeStarted := False;
end;

function TTransportFilter.GetParameters: TDBXStringArray;
begin
  Result := nil;
end;

function TTransportFilter.GetUserParameters: TDBXStringArray;
begin
  Result := nil;
end;

function TTransportFilter.GetParameterValue(const ParamName: UnicodeString): UnicodeString;
begin
  Result := '';
end;

function TTransportFilter.SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean;
begin
  Result := False;
end;

function TTransportFilter.SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean;
begin
  Result := False;
end;

procedure TTransportFilter.SetServerInstance(const IsServerSide: Boolean);
begin
  FServerInstance := IsServerSide;
end;

function TTransportFilter.IsPublicKeyCryptograph: Boolean;
begin
  Result := False;
end;

function TTransportFilter.IsServerInstance: Boolean;
begin
  Result := FServerInstance;
end;

function TTransportFilter.IsClientInstance: Boolean;
begin
  Result := not ServerInstance;
end;

function TTransportFilter.GetFilterCollection: TTransportFilterCollection;
begin
  Result := FFilterCollection;
end;

procedure TTransportFilter.SetFilterCollection(const FilterCollection: TTransportFilterCollection);
begin
  self.FFilterCollection := FilterCollection;
end;

procedure TTransportFilter.StartHandshake;
begin
  FHandshakeStarted := True;
end;

function TTransportFilter.IsHandshakeStarted: Boolean;
begin
  Result := FHandshakeStarted;
end;

function TTransportFilter.HandshakeComplete: Boolean;
begin
  FHandshakeStarted := False;
  Result := True;
end;

function TTransportFilter.GetCollectionFilter(const FilterId: UnicodeString): TTransportFilter;
begin
  if FFilterCollection <> nil then
    Exit(FFilterCollection.GetFilter(FilterId));
  Result := nil;
end;

function TTransportCypherFilter.GetParameterValue(const ParamName: UnicodeString): UnicodeString;
var
  Data: TBytes;
  Cypher: TPC1Cypher;
  I: Integer;
begin
  if (Key = ParamName) then
    Exit(ClearKey);
  if (Code = ParamName) then
  begin
    SetLength(Data,256);
    Cypher := SetUp(FCypherKey);
    for i := 0 to Length(Data) - 1 do
      Data[I] := Cypher.Cypher(Byte(I));
    TearDown(Cypher);
    Exit(TTransportFilter.Encode(Data, 0, Length(Data)));
  end;
  if (Filterunit = ParamName) then
    Exit('DbxSocketChannelNative');
  Result := NullString;
end;

function TTransportCypherFilter.GetClearKey: UnicodeString;
var
  Cypher: TPC1Cypher;
begin
  if StringIsNil(FCypherKey) then
  begin
    Cypher := SetUp(NullString);
    try
      FCypherKey := Cypher.EncryptionKey;
    finally
      TearDown(Cypher);
    end;
  end;

  Result := FCypherKey;
end;

function TTransportCypherFilter.GetUserParameters: TDBXStringArray;
var
  Params: TDBXStringArray;
begin
  SetLength(Params,1);
  Params[0] := Key;
  Result := Params;
end;

function TTransportCypherFilter.GetParameters: TDBXStringArray;
var
  Params: TDBXStringArray;
begin
  SetLength(Params,3);
  Params[0] := Key;
  Params[1] := Code;
  Params[2] := Filterunit;
  Result := Params;
end;

function TTransportCypherFilter.ProcessInput(const Data: TBytes): TBytes;
var
  Cypher: TPC1Cypher;
  I: Integer;
begin
  Cypher := SetUp(FCypherKey);
  for i := 0 to Length(Data) - 1 do
    Data[I] := Cypher.Cypher(Data[I]);
  TearDown(Cypher);
  Result := Data;
end;

function TTransportCypherFilter.ProcessOutput(const Data: TBytes): TBytes;
var
  Cypher: TPC1Cypher;
  I: Integer;
begin
  Cypher := SetUp(FConfederateKey);
  for i := 0 to Length(Data) - 1 do
    Data[I] := Cypher.Decypher(Data[I]);
  TearDown(Cypher);
  Result := Data;
end;

function TTransportCypherFilter.SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean;
begin
  if (Key = ParamName) then
    FCypherKey := ParamValue;
  Result := True;
end;

function TTransportCypherFilter.SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean;
var
  Data: TBytes;
  Cypher: TPC1Cypher;
  I: Integer;
begin
  if (Code = ParamName) then
  begin
    Data := Decode(ParamValue);
    Cypher := SetUp(FConfederateKey);
    for i := 0 to Length(Data) - 1 do
    begin
      if (Byte(I)) <> Cypher.Decypher(Data[I]) then
      begin
        TearDown(Cypher);
        Exit(False);
      end;
    end;
    TearDown(Cypher);
  end;
  if (Key = ParamName) then
    FConfederateKey := ParamValue;
  Result := True;
end;

function TTransportCypherFilter.SetUp(const Key: UnicodeString): TPC1Cypher;
begin
  if StringIsNil(Key) then
    Result := TPC1Cypher.Create
  else 
    Result := TPC1Cypher.Create(Key);
end;

procedure TTransportCypherFilter.TearDown(const Cypher: TPC1Cypher);
begin
  Cypher.Free;
end;

function TTransportCypherFilter.Id: UnicodeString;
begin
  Result := 'PC1';
end;

constructor TTransportFilterCollection.Create;
begin
  inherited Create(TTransportFilterItem);
end;

function TTransportFilterCollection.AddFilter(const FilterId: UnicodeString): Integer;
var
  FilterItem: TTransportFilterItem;
begin
  if (not StringIsNil(FilterId)) and (Length(FilterId) <> 0) then
  begin
    FilterItem := TTransportFilterItem(Add);
    try
      FilterItem.FilterId := FilterId;
      FilterItem.OnChangeNotify(self);
      NotifyChange;
      Exit(Count - 1);
    except
      on Ex: Exception do
        Delete(Count - 1);
    end;
  end;
  Result := -1;
end;

function TTransportFilterCollection.AddFilter(const Filter: TTransportFilter): Integer;
var
  FilterItem: TTransportFilterItem;
begin
  if Filter <> nil then
  begin
    FilterItem := TTransportFilterItem(Add);
    FilterItem.Filter := Filter;
    NotifyChange;
    Exit(Count - 1);
  end;
  Result := -1;
end;

function TTransportFilterCollection.RemoveFilter(const Index: Integer): Boolean;
begin
  if (Index >= 0) and (Index < Count) then
  begin
    Delete(Index);
    NotifyChange;
    Result := True;
  end
  else 
    Result := False;
end;

function TTransportFilterCollection.GetFilter(const Pos: Integer): TTransportFilter;
begin
  if (Pos >= 0) and (Pos < Count) then
    Exit((TTransportFilterItem(GetItem(Pos))).Filter);
  Result := nil;
end;

function TTransportFilterCollection.GetFilter(const Id: UnicodeString): TTransportFilter;
var
  I: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    if (GetFilter(I).Id = Id) then
      Exit(GetFilter(I));
  end;
  Result := nil;
end;

function TTransportFilterCollection.GetFilterIdList: TDBXStringArray;
var
  Data: TDBXStringArray;
  I: Integer;
begin
  SetLength(Data,Count);
  for i := 0 to Length(Data) - 1 do
    Data[I] := GetFilter(I).Id;
  Result := Data;
end;

function TTransportFilterCollection.HandshakeComplete: Boolean;
var
  Status: Boolean;
  I: Integer;
begin
  Status := True;
  for I := 0 to Count - 1 do
  begin
    if not GetFilter(I).HandshakeComplete then
      Status := False;
  end;
  Result := Status;
end;

procedure TTransportFilterCollection.StartHandshake;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    GetFilter(I).StartHandshake;
end;

function TTransportFilterCollection.ToJSON: UnicodeString;
var
  Root: TJSONObject;
  FilterProps: TJSONObject;
  Data: TBytes;
  Item: TTransportFilterItem;
  Props: TFilterProperties;
  I: Integer;
  J: Integer;
  Len: Integer;
begin
  Root := TJSONObject.Create;
  try
    for I := 0 to Count - 1 do
    begin
      FilterProps := TJSONObject.Create;
      Item := TTransportFilterItem(GetItem(I));
      Root.AddPair(Item.FilterId, FilterProps);
      Props := Item.Properties;
      if Props <> nil then
        for J := 0 to Props.Count - 1 do
          FilterProps.AddPair(Props.GetName(J), Props.GetValue(J));
    end;
    SetLength(Data,Root.EstimatedByteSize);
    Len := Root.ToBytes(Data, 0);
  finally
    Root.Free;
  end;
  Result := TDBXPlatform.StringOf(Data, Len);
end;

class function TTransportFilterCollection.FromJSON(const Json: UnicodeString): TTransportFilterCollection;
var
  Bytes: TBytes;
  FilterPos: Integer;
  FilterProps: TJSONObject;
  PropName: UnicodeString;
  PropValue: UnicodeString;
  Filters: TTransportFilterCollection;
  JsonCollection: TJSONObject;
  I: Integer;
  Props: TFilterProperties;
  J: Integer;
begin
  Filters := nil;
  Bytes := BytesOf(Json);
  JsonCollection := TJSONObject(TJSONObject.ParseJSONValue(Bytes, 0));
  if JsonCollection <> nil then
  begin
    Filters := TTransportFilterCollection.Create;
    for i := 0 to JsonCollection.Size - 1 do
    begin
      FilterPos := Filters.AddFilter(JsonCollection.Get(I).JsonString.Value);
      Props := TFilterProperties.Create;
      FilterProps := TJSONObject(JsonCollection.Get(I).JsonValue);
      for j := 0 to FilterProps.Size - 1 do
      begin
        PropName := FilterProps.Get(J).JsonString.Value;
        PropValue := (TJSONString(FilterProps.Get(J).JsonValue)).Value;
        Props.Add(PropName, PropValue);
      end;
      (TTransportFilterItem(Filters.GetItem(FilterPos))).Properties := Props;
      Props.Free;
    end;
    JsonCollection.Free;
  end;
  Result := Filters;
end;

class function TTransportFilterFactory.Instance: TTransportFilterFactory;
begin
  if FSingleton = nil then
    FSingleton := TTransportFilterFactory.Create;
  Result := FSingleton;
end;

class function TTransportFilterFactory.CreateFilter(const FilterId: UnicodeString): TTransportFilter;
var
  Clazz: TObjectClass;
begin
  if FSingleton = nil then
    Exit(nil);
  Clazz := TObjectClass(Instance.FRegisteredFilters[FilterId]);
  if Clazz <> nil then
  begin
    try
      Exit(TTransportFilter(Clazz.Create));
    except
      on E: Exception do
        ;
    end;
    Result := nil;
  end
  else 
    Result := nil;
end;

class procedure TTransportFilterFactory.RegisterFilter(const FilterId: UnicodeString; const FilterClass: TObjectClass);
var
  Factory: TTransportFilterFactory;
begin
  Factory := Instance;
  Factory.FRegisteredFilters[FilterId] := TObject(FilterClass);
end;

class procedure TTransportFilterFactory.RegisterFilter(const FilterClass: TObjectClass);
var
  Factory: TTransportFilterFactory;
begin
  Factory := Instance;
  Factory.FRegisteredFilters[TBaseTransportFactoryTools.InvokeStringFunction(FilterClass, 'id')] := TObject(FilterClass);
end;

class procedure TTransportFilterFactory.UnregisterFilter(const FilterId: UnicodeString);
var
  Idx: Integer;
begin
  Idx := Instance.FRegisteredFilters.IndexOf(FilterId);
  if Idx > -1 then
    Instance.FRegisteredFilters.Delete(Idx);
  if Instance.FRegisteredFilters.Count = 0 then
    Instance.Free;
end;

class procedure TTransportFilterFactory.UnregisterFilter(const FilterClass: TObjectClass);
var
  Idx: Integer;
begin
  Idx := Instance.FRegisteredFilters.IndexOf(TBaseTransportFactoryTools.InvokeStringFunction(FilterClass, 'id'));
  if Idx > -1 then
    Instance.FRegisteredFilters.Delete(Idx);
  if Instance.FRegisteredFilters.Count = 0 then
    Instance.Free;
end;

class function TTransportFilterFactory.RegisteredFiltersId: TDBXStringArray;
var
  I: Integer;
  Data: TDBXStringArray;
  Keys: TDBXKeyEnumerator;
begin
  SetLength(Data,Instance.FRegisteredFilters.Count);
  I := 0;
  Keys := Instance.FRegisteredFilters.Keys;
  while Keys.MoveNext do
    Data[IncrAfter(I)] := UnicodeString(Keys.Current);
  Result := Data;
end;

constructor TTransportFilterFactory.Create;
begin
  inherited Create;
  FRegisteredFilters := TDBXObjectStore.Create;
end;

destructor TTransportFilterFactory.Destroy;
begin
  FreeAndNil(FRegisteredFilters);
  FSingleton := nil;
  inherited Destroy;
end;

constructor TTransportFilterItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  OnChangeNotify(TBaseTransportFilterCollection(Collection));
  FFilterProperties := TFilterProperties.Create;
  FFilterProperties.OnChange := OnFilterPropertiesChange;
end;

procedure TTransportFilterItem.OnFilterPropertiesChange(Sender: TObject);
begin
  FFilterPropertiesChanged := True;
end;

destructor TTransportFilterItem.Destroy;
begin
  FreeAndNil(FFilterProperties);
  FreeAndNil(FFilter);
  inherited Destroy;
end;

procedure TTransportFilterItem.SetFilterId(const FilterId: UnicodeString);
begin
  if FilterId <> self.FFilterId then
  begin
    FreeAndNil(self.FFilter);
    self.FFilter := TTransportFilterFactory.CreateFilter(FilterId);
    if self.FFilter = nil then
      raise Exception.Create(SIllegalArgument);
    self.FFilterId := FilterId;
    UpdateFilterProperties;
    NotifyChange;
  end;
end;

function TTransportFilterItem.GetFilterId: UnicodeString;
begin
  Result := FFilterId;
end;

function TTransportFilterItem.GetFilter: TTransportFilter;
begin
  if FFilter <> nil then
    if FFilterPropertiesChanged then
      UpdateFilter;
  Result := FFilter;
end;

procedure TTransportFilterItem.SetFilter(const Filter: TTransportFilter);
begin
  FreeAndNil(self.FFilter);
  self.FFilter := Filter;
  self.FFilterId := Filter.Id;
  UpdateFilterProperties;
  NotifyChange;
end;

procedure TTransportFilterItem.SetProperties(const Value: TFilterProperties);
begin
  FFilterProperties.Assign(Value);
  NotifyChange;
end;

// Make collection item properties have value of filter properties
procedure TTransportFilterItem.UpdateFilterProperties;
var
  Params: TDBXStringArray;
  I: Integer;
  Value: UnicodeString;
begin
  FFilterProperties.Clear;
  if FFilter <> nil then
  begin
    Params := FFilter.UserParameters;
    for i := 0 to Length(Params) - 1 do
    begin
      Value := FFilter.GetParameterValue(Params[I]);
      FFilterProperties.Add(Params[I], Value);
    end;
  end;
  FFilterPropertiesChanged := False;
end;

// Make the filter properties have values of collection item properties
procedure TTransportFilterItem.UpdateFilter;
var
  I: Integer;
begin
  if FFilter <> nil then
    for i := 0 to FFilterProperties.Count - 1 do
      FFilter.SetParameterValue(FFilterProperties.GetName(I), FFilterProperties.GetValue(I));
  FFilterPropertiesChanged := False;
end;

function TTransportFilterItem.GetProperties: TFilterProperties;
begin
  Result := FFilterProperties;
end;

class function TTransportFilterTools.FilterQuery(const Buffer: TBytes): TBytes;
var
  I: Integer;
begin
  for i := 0 to Length(Buffer) - 1 do
    Buffer[I] := Byte(HeaderQuery);
  Result := Buffer;
end;

class function TTransportFilterTools.IsFilterQuery(const Buffer: TBytes): Boolean;
var
  I: Integer;
begin
  for i := 0 to Length(Buffer) - 1 do
  begin
    if Buffer[I] <> Byte(HeaderQuery) then
      Exit(False);
  end;
  Result := True;
end;

class function TTransportFilterTools.NoFilter(const Buffer: TBytes): TBytes;
begin
  Buffer[0] := Byte(HeaderNoFilter);
  Buffer[1] := Byte(0);
  Buffer[2] := Byte(0);
  Buffer[3] := Byte(0);
  Buffer[4] := Byte(0);
  Result := Buffer;
end;

class function TTransportFilterTools.HasNoFilter(const Buffer: TBytes): Boolean;
begin
  Result := (Buffer[0] = HeaderNoFilter) and (Buffer[1] = 0) and (Buffer[2] = 0) and (Buffer[3] = 0) and (Buffer[4] = 0);
end;

class function TTransportFilterTools.HasPublicKey(const Buffer: TBytes): Boolean;
begin
  Result := Buffer[0] = HeaderPublicKey;
end;

class function TTransportFilterTools.HasPublicKeyCryptography(const FilterList: TTransportFilterCollection): Boolean;
var
  Filter: TTransportFilter;
  I: Integer;
begin
  for i := 0 to FilterList.Count - 1 do
  begin
    Filter := FilterList.GetFilter(I);
    if Filter.PublicKeyCryptograph then
      Exit(True);
  end;
  Result := False;
end;

class procedure TTransportFilterTools.EncodeDataLength(const Data: TBytes; const Len: Integer);
begin
  Data[0] := Byte(HeaderFilter);
  Data[1] := Byte(((Len shr 24) and 255));
  Data[2] := Byte(((Len shr 16) and 255));
  Data[3] := Byte(((Len shr 8) and 255));
  Data[4] := Byte((Len and 255));
end;

class procedure TTransportFilterTools.EncodePublicKeyLength(const Data: TBytes; const Len: Integer);
begin
  Data[0] := Byte(HeaderPublicKey);
  Data[1] := Byte(((Len shr 24) and 255));
  Data[2] := Byte(((Len shr 16) and 255));
  Data[3] := Byte(((Len shr 8) and 255));
  Data[4] := Byte((Len and 255));
end;

class function TTransportFilterTools.DecodeDataLen(const Data: TBytes): Integer;
var
  Size: Integer;
begin
  if (Data[0] = HeaderFilter) or (Data[0] = HeaderPublicKey) then
  begin
    Size := Data[4] and 255;
    Size := Size or (Data[1] and 255) shl 24;
    Size := Size or (Data[2] and 255) shl 16;
    Size := Size or (Data[3] and 255) shl 8;
    Result := Size;
  end
  else 
    Result := -1;
end;

end.

