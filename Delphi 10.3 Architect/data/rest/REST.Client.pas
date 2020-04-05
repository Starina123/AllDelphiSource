{*******************************************************}
{                                                       }
{             Delphi REST Client Framework              }
{                                                       }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
/// <summary>
/// REST.Client is a foundation for simplifying the creation of specific REST API Clients.
/// </summary>
unit REST.Client;

interface

uses
  System.SysUtils, System.JSON, System.Classes, System.Generics.Collections,
  System.Net.URLClient, System.Net.HttpClient, System.JSON.Writers, System.JSON.Readers,
  Data.Bind.ObjectScope, Data.Bind.Components,
  REST.HttpClient, REST.Types, REST.BindSource;

{$SCOPEDENUMS ON}

const
  RESTCLIENT_VERSION = '1.0';

type
  IRESTResponseJSON = interface;
  TRESTRequestParameter = class;
  TRESTRequestParameterList = class;

  TCustomRESTRequest = class;
  TCustomRESTResponse = class;
  TCustomRESTClient = class;
  TCustomAuthenticator = class;

  TSubRESTRequestBindSource = class;
  TSubRESTResponseBindSource = class;
  TSubRESTClientBindSource = class;

  IRESTResponseJSON = interface
    ['{71F5FA19-69CC-4384-AC0A-D6E30AD5CC95}']
    procedure AddJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure GetJSONResponse(out AJSONValue: TJSONValue; out AHasOwner: Boolean);
    function HasJSONResponse: Boolean;
    function HasResponseContent: Boolean;
  end;

  /// <summary>
  /// Parameter for REST requests
  /// </summary>
  TRESTRequestParameter = class(TCollectionItem)
  private
    FName: string;
    FValue: string;
    FStream: TStream;
    FStreamOwner: Boolean;
    FKind: TRESTRequestParameterKind;
    FContentType: TRESTContentType;
    FOptions: TRESTRequestParameterOptions;
    function KindIsStored: Boolean;
    procedure SetKind(const AValue: TRESTRequestParameterKind);
    procedure SetName(const AValue: string);
    procedure SetOptions(const AValue: TRESTRequestParameterOptions);
    procedure SetValue(const AValue: string);
    procedure SetContentType(const AValue: TRESTContentType);
    procedure ReleaseStream;
    procedure NotifyParameterChanged(AValueChanged: Boolean);
    function GetBytes: TBytes;
  public
    constructor Create(ACollection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(ASource: TPersistent); override;
    procedure SetStream(const AValue: TStream; AOwnership: TRESTObjectOwnership = ooCopy);
    function AddValue(const AValue: string): TRESTRequestParameter;

    /// <summary>
    /// Return a human-readable representation of this parameter
    /// </summary>
    /// <returns>String</returns>
    function ToString: string; override;
    function GetDisplayName: string; override;
    /// <summary>
    /// Stream value of the parameter
    /// </summary>
    property Stream: TStream read FStream;
    property StreamOwner: Boolean read FStreamOwner;
    property Bytes: TBytes read GetBytes;
  published
    /// <summary>
    /// Type of the parameter
    /// </summary>
    property Kind: TRESTRequestParameterKind read FKind write SetKind stored KindIsStored;
    /// <summary>
    /// Name of the parameter
    /// </summary>
    property Name: string read FName write SetName;
    /// <summary>
    /// Additional processing options
    /// </summary>
    property Options: TRESTRequestParameterOptions read FOptions write SetOptions default [];
    /// <summary>
    /// Value of the parameter
    /// </summary>
    property Value: string read FValue write SetValue;
    /// <summary>
    /// <para>
    /// If ContentType is set to a specific value, then this will be used as actual content-type for the
    /// corresponding PUT or POST request. UTF-8 encoding will be applied unless doNotEncode is specified in Options.
    /// </para>
    /// <para>
    /// If left empty, the content type will be chosen basically depending on the number of existing parameters,
    /// that go into the requests body.
    /// </para>
    /// <para>
    /// Single parameter will use application/x-www-form-urlencoded, multiple parameters multipart/mixed instead.
    /// </para>
    /// </summary>
    /// <remarks>
    /// This property is only relevant for PUT and POST request. GET/DELETE request do not have a content-type.
    /// </remarks>
    property ContentType: TRESTContentType read FContentType write SetContentType default TRESTContentType.ctNone;
  end;

  TRESTRequestParameterDict = TDictionary<string, TRESTRequestParameter>;
  TRESTRequestParameterArray = TArray<TRESTRequestParameter>;

  IRESTRequestParameterListOwnerNotify = interface
    ['{48713C06-9469-4648-BCF9-FF83C6A58F5D}']
    procedure ParameterListChanged;
    procedure ParameterValueChanged;
  end;

  /// <summary>
  /// Container for parameters that will be associated with a REST request.
  /// </summary>
  /// <seealso cref="TRESTRequestParameter" />
  TRESTRequestParameterList = class(TOwnedCollection)
  private type
    TEnumerator = class(TCollectionEnumerator)
    public
      function GetCurrent: TRESTRequestParameter; inline;
      property Current: TRESTRequestParameter read GetCurrent;
    end;

  protected
    function GetItem(AIndex: Integer): TRESTRequestParameter;
    procedure SetItem(AIndex: Integer; const AValue: TRESTRequestParameter);
    function GetAttrCount: Integer; override;
    function GetAttr(AIndex: Integer): string; override;
    function GetItemAttr(AIndex, AItemIndex: Integer): string; override;
    procedure Update(AItem: TCollectionItem); override;
  public
    constructor Create(const AOwner: TComponent);

    function GetEnumerator: TEnumerator;

    /// <summary>
    /// Shortcut to Add(AName, AValue, Cookie) overload
    /// </summary>
    /// <param name="AName">Name of the cookie to add</param>
    /// <param name="AValue">Value of the cookie to add</param>
    function AddCookie(const AName, AValue: string): TRESTRequestParameter;
    /// <summary>
    /// Shortcut to Add(name, value, HttpHeader) overload
    /// </summary>
    /// <param name="AName">Name of the header to add</param>
    /// <param name="AValue">Value of the header to add</param>
    function AddHeader(const AName, AValue: string): TRESTRequestParameter;
    /// <summary>
    /// Calls Add() for all public, published &readable properties of obj
    /// </summary>
    /// <param name="AObject">The object with properties to add as parameters</param>
    procedure AddObject(AObject: TObject); overload;

    /// <summary>
    /// Calls Add() for all public, readable properties specified in the white list
    /// </summary>
    /// <example>
    /// request.AddObject(product, "ProductId", "Price", ...);
    /// </example>
    /// <param name="AObject">The object with properties to add as parameters</param>
    /// <param name="WhiteList">The names of the properties to include</param>
    procedure AddObject(AObject: TObject; WhiteList: TStrings); overload;

    /// <summary>
    /// Adds an empty parameter to the collection.
    /// </summary>
    function AddItem: TRESTRequestParameter; overload;

    /// <summary>
    /// Adds a parameter to the collection. If a parameter of the same name already exists, then the previous parameter
    /// will be overwritten. There are five kinds of parameters:
    /// - GetOrPost: Either a QueryString value or encoded form value based on method
    /// - HttpHeader: Adds the name/value pair to the HTTP request's Headers collection
    /// - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId}
    /// - Cookie: Adds the name/value pair to the HTTP request's Cookies collection
    /// - RequestBody: Used by AddBody() (not recommended to use directly)
    /// </summary>
    /// <param name="AName">Name of the parameter</param>
    /// <param name="AValue">Value of the parameter</param>
    /// <param name="AKind">The kind of parameter to add</param>
    /// <param name="AOptions">Set of parameter options </param>
    function AddItem(const AName, AValue: string; AKind: TRESTRequestParameterKind;
      AOptions: TRESTRequestParameterOptions = []): TRESTRequestParameter;  overload;

    property Items[index: Integer]: TRESTRequestParameter read GetItem write SetItem; default;

    procedure Delete(const AParam: TRESTRequestParameter); overload;
    procedure Delete(const AName: string); overload;
    function IndexOf(const AParam: TRESTRequestParameter): Integer; overload;
    function IndexOf(const AName: string): Integer; overload;

    /// <summary>
    /// Adds a HTTP parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed. (QueryString for GET, DELETE, OPTIONS and HEAD; Encoded form for POST and PUT)
    /// </summary>
    /// <param name="AName">Name of the parameter</param>
    /// <param name="AValue">Value of the parameter</param>
    function AddItem(const AName, AValue: string): TRESTRequestParameter; overload;
    /// <summary>
    /// Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed.<br /><br />There are five kinds of parameters: - GetOrPost: Either a QueryString
    /// value or encoded form value based on method - HttpHeader: Adds the name/value pair to the HTTP request's
    /// Headers collection - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId} -
    /// Cookie: Adds the name/value pair to the HTTP request's Cookies collection - RequestBody: Used by AddBody()
    /// (not recommended to use directly)
    /// </summary>
    /// <param name="AName">
    /// Name of the parameter
    /// </param>
    /// <param name="AValue">
    /// Value of the parameter
    /// </param>
    /// <param name="AKind">
    /// The kind of parameter to add
    /// </param>
    /// <param name="AOptions">
    /// Options for processing the parameter
    /// </param>
    /// <param name="AContentType">
    /// Content type of the parameter, for body parameters. Set to TRESTContentType.ctNone if no specific content type is needed.
    /// </param>
    function AddItem(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions; AContentType: TRESTContentType): TRESTRequestParameter;
      overload;
    /// <summary>
    /// Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed.<br /><br />There are five kinds of parameters: - GetOrPost: Either a QueryString
    /// value or encoded form value based on method - HttpHeader: Adds the name/value pair to the HTTP request's
    /// Headers collection - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId} -
    /// Cookie: Adds the name/value pair to the HTTP request's Cookies collection - RequestBody: Used by AddBody()
    /// (not recommended to use directly)
    /// </summary>
    /// <param name="AName">
    /// Name of the parameter
    /// </param>
    /// <param name="AValue">
    /// Value of the parameter
    /// </param>
    /// <param name="AKind">
    /// The kind of parameter to add
    /// </param>
    /// <param name="AOptions">
    /// Options for processing the parameter
    /// </param>
    /// <param name="AContentType">
    /// Content type of the parameter, for body parameters. Set to TRESTContentType.ctNone if no specific content type is needed.
    /// </param>
    function AddItem(const AName: string; const AValue: TBytes; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions; AContentType: TRESTContentType): TRESTRequestParameter;
      overload;
    /// <summary>
    /// Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed.<br /><br />There are five kinds of parameters: - GetOrPost: Either a QueryString
    /// value or encoded form value based on method - HttpHeader: Adds the name/value pair to the HTTP request's
    /// Headers collection - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId} -
    /// Cookie: Adds the name/value pair to the HTTP request's Cookies collection - RequestBody: Used by AddBody()
    /// (not recommended to use directly)
    /// </summary>
    /// <param name="AName">
    /// Name of the parameter
    /// </param>
    /// <param name="AValue">
    /// Value of the parameter
    /// </param>
    /// <param name="AKind">
    /// The kind of parameter to add
    /// </param>
    /// <param name="AOptions">
    /// Options for processing the parameter
    /// </param>
    /// <param name="AContentType">
    /// Content type of the parameter, for body parameters. Set to TRESTContentType.ctNone if no specific content type is needed.
    /// </param>
    /// <param name="AOwnsStream">
    /// Defines how parameter owns the stream.
    /// </param>
    function AddItem(const AName: string; const AValue: TStream; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions; AContentType: TRESTContentType;
      AOwnsStream: TRESTObjectOwnership = ooCopy): TRESTRequestParameter;
      overload;
    /// <summary>
    /// Shortcut to Add(name, value, UrlSegment) overload
    /// </summary>
    /// <param name="AName">Name of the segment to add</param>
    /// <param name="AValue">Value of the segment to add</param>
    procedure AddUrlSegment(const AName, AValue: string);
    /// <summary>
    /// Locates a request parameter by its name. Returns nil if no matching parameter is found.
    /// </summary>
    /// <param name="AName">
    /// The parameter's name (Key)
    /// </param>
    function ParameterByName(const AName: string): TRESTRequestParameter;

    /// <summary>
    /// Locates a request parameter by its index.
    /// </summary>
    /// <param name="AIndex">
    /// The parameter's index
    /// </param>
    function ParameterByIndex(AIndex: Integer): TRESTRequestParameter;

    /// <summary>
    /// checks the existance of a parameter with the given name
    /// </summary>
    /// <param name="AName">Name of the Parameter</param>
    function ContainsParameter(const AName: string): Boolean;

    /// <summary>
    /// Creates URLSegement parameters from a full URL string.
    /// </summary>
    function CreateURLSegmentsFromString(const AUrlPath: string): Boolean;

    /// <summary>
    /// Creates GET parameters from a full URL string.
    /// </summary>
    procedure CreateGetParamsFromUrl(const AUrlPath: string);

    /// <summary>
    /// Adds ABodyContent as Body parameter to the request.
    /// </summary>
    /// <remarks>
    /// An already existing body parameter will NOT be replaced/deleted!
    /// </remarks>
    procedure AddBody(const ABodyContent: string; AContentType: TRESTContentType = ctNone); overload;
    /// <summary>
    /// Serializes obj to JSON and adds it to the request body.
    /// </summary>
    /// <remarks>
    /// An already existing body parameter will be replaced/deleted!
    /// </remarks>
    procedure AddBody<T: class, constructor>(const AObject: T;
      AOwnsObject: TRESTObjectOwnership = ooApp); overload;
    /// <summary>
    /// Encodes the string representation of a JSON Object and adds it to the request body.
    /// </summary>
    /// <remarks>
    /// An already existing body parameter will be replaced/deleted!
    /// </remarks>
    procedure AddBody(const AObject: TJsonObject;
      AOwnsObject: TRESTObjectOwnership = ooApp); overload;
    /// <summary>
    /// Adds ABodyContent as Body parameter to the request.
    /// </summary>
    /// <remarks>
    /// An already existing body parameter will be replaced/deleted!
    /// </remarks>
    procedure AddBody(const ABodyContent: TStream; AContentType: TRESTContentType = ctNone;
      AOwnsStream: TRESTObjectOwnership = ooCopy); overload;
  end;

  TExecuteMethod = procedure of object;

  /// <summary>
  /// Provides classes and support for asynchronous execution of REST client requests.
  /// </summary>
  TRESTExecutionThread = class(TThread)
  private
    FCompletionHandler: TCompletionHandler;
    FCompletionHandlerWithError: TCompletionHandlerWithError;
    FExecuteMethod: TExecuteMethod;
    FSynchronized: Boolean;
    FRequest: TCustomRESTRequest;
    FExceptObject: TObject;
  protected
    procedure HandleCompletion;
    procedure HandleCompletionWithError;
    procedure Execute; override;
  public
    constructor Create(AExecuteMethod: TExecuteMethod; ARequest: TCustomRESTRequest;
      ACompletionHandler: TCompletionHandler; ASynchronized: Boolean; AFreeThread: Boolean = True; ACompletionHandlerWithError: TCompletionHandlerWithError = nil);
  end;

  TCustomRESTRequestNotifyEvent = procedure(Sender: TCustomRESTRequest) of object;

  /// <summary>
  /// Container for data used to make requests
  /// </summary>
  TCustomRESTRequest = class(TBaseObjectBindSourceDelegate, IRESTRequestParameterListOwnerNotify)
  public type
    TNotify = class(TRESTComponentNotify)
    public
      procedure ParameterListChanged(Sender: TObject); virtual;
    end;

    TNotifyList = TRESTComponentNotifyList<TNotify>;

    /// <summary>
    /// Wrapper class around the body request parameter
    /// <summary>
    TBody = class
    private
      FParams: TRESTRequestParameterList;
      FJSONTextWriter: TJsonTextWriter;
      FJSONStream: TStream;
      procedure ClearWriter;
      function GetJSONWriter: TJsonTextWriter;
    public
      constructor Create;
      destructor Destroy; override;
      /// <summary>
      /// Adds ABodyContent as Body parameter to the request.
      /// </summary>
      /// <remarks>
      /// An already existing body parameter will NOT be replaced/deleted!
      /// </remarks>
      procedure Add(const ABodyContent: string; AContentType: TRESTContentType = ctNone); overload;
      /// <summary>
      /// Serializes obj to JSON and adds it to the request body.
      /// </summary>
      /// <param name="AObject">The object to serialize</param>
      /// <param name="AOwnsObject">Defines who will own the object.</param>
      /// <remarks>
      /// An already existing body parameter will be replaced/deleted!
      /// </remarks>
      procedure Add<T: class, constructor>(AObject: T; AOwnsObject: TRESTObjectOwnership = ooApp); overload;
      /// <summary>
      ///  Encodes the string representation of a JSON Object and adds it to the request body.
      /// </summary>
      /// <param name="AObject">The object to serialize</param>
      /// <param name="AOwnsObject">Defines who will own the object.</param>
      /// <remarks>
      /// An already existing body parameter will be replaced/deleted!
      /// </remarks>
      procedure Add(AObject: TJsonObject; AOwnsObject: TRESTObjectOwnership = ooApp); overload;
      /// <summary>
      /// Adds ABodyContent as Body parameter to the request.
      /// </summary>
      /// <remarks>
      /// An already existing body parameter will be replaced/deleted!
      /// </remarks>
      procedure Add(ABodyContent: TStream; AContentType: TRESTContentType = ctNone;
        AOwnsStream: TRESTObjectOwnership = ooCopy); overload;
      /// <summary>
      /// Removes all body parameters (TRESTRequestParameterKind.pkREQUESTBODY) from the TRESTRequestParameterList.
      ///  and clears the JSONWriter
      /// </summary>
      procedure ClearBody;
      property JSONWriter: TJsonTextWriter read GetJSONWriter;
    end;

  private
    FAccept: string;
    FAcceptCharset: string;
    FAcceptEncoding: string;
    FHandleRedirects: Boolean;
    FMethod: TRESTRequestMethod;
    FPosting: Boolean;
    FAutoCreateParams: Boolean;
    FParams: TRESTRequestParameterList;
    FTransientParams: TRESTRequestParameterList;
    FResource: string;
    FTimeout: Integer;
    FClient: TCustomRESTClient;
    FResponse: TCustomRESTResponse;
    FBindSource: TSubRESTRequestBindSource;
    FNotifyList: TNotifyList;
    FURLAlreadyEncoded : boolean;
    FBody: TBody;
    FRequestContentType : string;

    FOnAfterExecute: TCustomRESTRequestNotifyEvent;
    FExecutionPerformance: TExecutionPerformance;

    FOnHTTPProtocolError: TCustomRESTRequestNotifyEvent;
    FSynchronizedEvents: Boolean;
    FResourceSuffix: string;
    function AcceptIsStored: Boolean;
    function AcceptCharSetIsStored: Boolean;
    function MethodIsStored: Boolean;
    procedure SetAccept(const AValue: string);
    procedure SetAcceptCharset(const AValue: string);
    procedure SetHandleRedirects(const AValue: Boolean);
    procedure SetClient(const AValue: TCustomRESTClient);
    function GetParams: TRESTRequestParameterList;
    function GetExecutionPerformance: TExecutionPerformance;
    procedure SetParams(const AValue: TRESTRequestParameterList);
    procedure SetAutoCreateParams(const AValue: Boolean);
    procedure ProcessResponse(const AURL: string; AResponseStream: TMemoryStream; const AContent: string);
    function GetMethod: TRESTRequestMethod;
    function GetResource: string;
    function GetTimeout: Integer;
    procedure SetAcceptEncoding(const AValue: string);
    procedure SetMethod(const AValue: TRESTRequestMethod);
    procedure SetResource(const AValue: string);
    procedure SetTimeout(const AValue: Integer);
    function GetResponse: TCustomRESTResponse;
    procedure SetResponse(const AResponse: TCustomRESTResponse);
    procedure SetSynchronizedEvents(const AValue: Boolean);
    function GetFullResource: string;
    procedure SetResourceSuffix(const AValue: string);
    function IsQueryParam(const AParam: TRESTRequestParameter;
      AContentType: TRESTContentType): Boolean;
    function GetFullURL: string;
  protected
    procedure Loaded; override;
    function GetClient: TCustomRESTClient; virtual;
    function CreateBindSource: TBaseObjectBindSource; override;
    function CreateRequestBindSource: TSubRESTRequestBindSource; virtual;
    procedure ParameterListChanged; virtual;
    procedure ParameterValueChanged; virtual;
    procedure PropertyValueChanged; virtual;
    procedure DoResponseChanged;  virtual;
    procedure DoResponseChanging; virtual;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    /// <summary>
    /// OnAfterExecute dispatch method. Called internally.
    /// </summary>
    procedure DoAfterExecute; virtual;
    procedure DoBeforeExecute; virtual;

    /// <summary>
    /// OnHTTPProtocol dispatch method. Called internally.
    /// </summary>
    procedure DoHTTPProtocolError; virtual;

    procedure DoApplyCookieParams(const AParamList: TRESTRequestParameterArray; const CookieURL: string); virtual;
    procedure DoApplyHeaderParams(const AParamList: TRESTRequestParameterArray); virtual;
    procedure DoApplyURLSegments(const AParamList: TRESTRequestParameterArray; var AURL: string); virtual;

    /// <summary>
    /// Prepares the actual query string to have all parameters, values encoded properly
    /// </summary>
    /// <param name="AParamList">
    /// The list where query parameters are taken from
    /// </param>
    /// <param name="AContentType">
    /// The content type for the body.
    /// </param>
    /// <param name="AURL">
    /// Will be appended with all parameters
    /// </param>
    procedure DoPrepareQueryString(const AParamList: TRESTRequestParameterArray;
      AContentType: TRESTContentType; var AURL: string); virtual;

    /// <summary>
    /// Creates a stream that contains all relevant parameters in a stream that represents a either list of
    /// name-value pairs or a HTTP Multi-Part structure - depending on the requests content-type.
    /// </summary>
    /// <param name="AParamList">
    /// The list where request body parameters are taken from,
    /// </param>
    /// <param name="AContentType">
    /// The content type for the body.
    /// </param>
    /// <param name="ABodyStream">
    /// Will point to a newly created stream, containing the body.
    /// </param>
    /// <param name="ABodyStreamOwner">
    /// When True, then caller is responsible for ABodyStream destruction.
    /// When False, then REST library owns the ABodyStream stream.
    /// </param>
    procedure DoPrepareRequestBody(AParamList: TRESTRequestParameterArray;
      AContentType: TRESTContentType; var ABodyStream: TStream; var ABodyStreamOwner: Boolean); virtual;

    /// <summary>
    /// HandleEvent ensures that an event handler (like DoAfterExecute) is ran synchronized or not depending on
    /// SynchronizedEvents
    /// </summary>
    /// <seealso cref="TCustomRESTClient.SynchronizedEvents" />
    procedure HandleEvent(AEventHandler: TMethod);

    property NotifyList: TNotifyList read FNotifyList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    (*
      /// <summary>
      /// Used by the default deserializers to explicitly set which date format string to use when parsing dates.
      /// </summary>
      string DateFormat { get; set; }
    *)

    /// <summary>
    /// Based on the parameters the content-type is "x-www-form-urlencoded",  "multipart/formdata" (e.g. for
    /// file-transfer etc.) or a specific content-type as set by at least one of the parameters.
    /// </summary>
    function ContentType: TRESTContentType; overload;
    function ContentType(const AParamsArray: TRESTRequestParameterArray): TRESTContentType; overload;

    /// <summary>
    /// Adds a HTTP parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed. (QueryString for GET, DELETE, OPTIONS and HEAD; Encoded form for POST and PUT)
    /// </summary>
    /// <param name="AName">Name of the parameter</param>
    /// <param name="AValue">Value of the parameter</param>
    procedure AddParameter(const AName, AValue: string); overload;
    /// <summary>
    ///   Adds an Json formatted HTTP parameter to the request. If a parameter of the same name already exists, then
    ///   the previous parameter will be removed and freed. (QueryString for GET, DELETE, OPTIONS and HEAD; Encoded
    ///   form for POST and PUT)
    /// </summary>
    /// <param name="AName">
    ///   Name of the parameter
    /// </param>
    /// <param name="AJsonObject">
    ///   Value of the parameter, will be formatted as Json
    /// </param>
    /// <param name="AFreeJson">
    ///   If True, the Json Object in AJsonObject will be fred automatcially
    /// </param>
    procedure AddParameter(const AName: string; AJsonObject: TJSONObject; AFreeJson: boolean = True); overload;
    procedure AddParameter(const AName: string; AJsonObject: TJSONObject; AOwnsObject: TRESTObjectOwnership {= ooREST}); overload;
    /// <summary>
    ///   Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    ///   will be removed and freed. There are five kinds of parameters: - GetOrPost: Either a QueryString value or
    ///   encoded form value based on method - HttpHeader: Adds the name/value pair to the HTTP request's Headers
    ///   collection - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId} - Cookie: Adds
    ///   the name/value pair to the HTTP request's Cookies collection - RequestBody: Used by AddBody() (not
    ///   recommended to use directly)
    /// </summary>
    /// <param name="AName">
    ///   Name of the parameter
    /// </param>
    /// <param name="AValue">
    ///   Value of the parameter
    /// </param>
    /// <param name="AKind">
    ///   The kind of parameter to add
    /// </param>
    procedure AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind); overload;

    /// <summary>
    /// Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed.<br /><br />There are five kinds of parameters: - GetOrPost: Either a QueryString
    /// value or encoded form value based on method - HttpHeader: Adds the name/value pair to the HTTP request's
    /// Headers collection - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId} -
    /// Cookie: Adds the name/value pair to the HTTP request's Cookies collection - RequestBody: Used by AddBody()
    /// (not recommended to use directly)
    /// </summary>
    /// <param name="AName">
    /// Name of the parameter
    /// </param>
    /// <param name="AValue">
    /// Value of the parameter
    /// </param>
    /// <param name="AKind">
    /// The kind of parameter to add
    /// </param>
    /// <param name="AOptions">
    /// Options for processing the parameter
    /// </param>
    procedure AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions); overload;

    /// <summary>
    /// Add an authentication parameter
    /// </summary>
    procedure AddAuthParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions = []); overload;
    function CreateUnionParameterList: TRESTRequestParameterArray;

    /// <summary>
    /// Adds ABodyContent as Body parameter to the request.
    /// </summary>
    /// <remarks>
    /// An already existing body parameter will NOT be replaced/deleted!
    /// </remarks>
    procedure AddBody(const ABodyContent: string; AContentType: TRESTContentType = ctNone); overload;
    /// <summary>
    /// Serializes obj to JSON and adds it to the request body.
    /// </summary>
    /// <param name="AObject">The object to serialize</param>
    /// <remarks>
    /// An already existing body parameter will be replaced/deleted!
    /// </remarks>
    procedure AddBody<T: class, constructor>(AObject: T); overload;
    /// <summary>
    ///  Encodes the string representation of a JSON Object and adds it to the request body.
    /// </summary>
    /// <param name="AObject">The object to serialize</param>
    /// <param name="AOwnsObject">Defines who will own the object.</param>
    /// <remarks>
    /// An already existing body parameter will be replaced/deleted!
    /// </remarks>
    procedure AddBody(AObject: TJsonObject; AOwnsObject: TRESTObjectOwnership = ooApp); overload;
    /// <summary>
    /// Adds ABodyContent as Body parameter to the request.
    /// </summary>
    /// <remarks>
    /// An already existing body parameter will be replaced/deleted!
    /// </remarks>
    procedure AddBody(ABodyContent: TStream; AContentType: TRESTContentType = ctNone;
      AOwnsStream: TRESTObjectOwnership = ooCopy); overload;
    /// <summary>
    /// Removes all body parameters (TRESTRequestParameterKind.pkREQUESTBODY) from the request.
    /// </summary>
    procedure ClearBody;
    /// <summary>
    /// Adds file content to the request. If same AName parameter already exists, then the previous content
    /// will be replaced by new one.
    /// </summary>
    /// <param name="AName">Name of the parameter</param>
    /// <param name="AFileName">Path to the file</param>
    /// <param name="AContentType">Content type of the file, for HTTP body parameter.
    /// If AContentType=ctNone program automatically define the Content type of the file</param>
    procedure AddFile(const AName, AFileName: string; AContentType: TRESTContentType = TRESTContentType.ctNone); overload;
    /// <summary>
    /// Adds file content to the request. Only one file can be added.
    /// If this function is executed second time, then previous content will be replaced by new one.
    /// </summary>
    /// <param name="AFileName">Path to the file</param>
    /// <param name="AContentType">Content type of the file, for HTTP body parameter.
    /// If AContentType=ctNone program automatically define the Content type of the file</param>
    procedure AddFile(const AFileName: string; AContentType: TRESTContentType = TRESTContentType.ctNone);  overload;
    /// <summary>
    /// Sets all fields to their default value. No state information is kept. If Response
    /// is assigned, then Response.ResetToDefaults is called too.
    /// </summary>
    procedure ResetToDefaults;
    /// <summary>
    /// Exceutes an actual HTTP request
    /// </summary>
    /// <exception cref="ERESTException">
    /// Anything which is NOT an HTTP protocol exception.
    /// </exception>
    /// <remarks>
    /// Execute does NOT raise HTTP protocol exceptions, instead TCustomRESTClient.Response.StatusCode should be checked
    /// for desired values. In many cases a 2xx StatusCode signals "succes" - other status codes don't need to be
    /// errors though. It depends on the actual REST API.
    /// </remarks>
    procedure Execute;

    /// <summary>
    /// <para>
    /// Executes a request asynchronously, i.e. run it in its own thread. There is no automatic serialization op
    /// property access though, which means that while the execution thread runs, properties of all involved
    /// TCustomRESTClient and TCustomRESTRequest instances should not be touched from other threads (including the main thread)
    /// <br /><br />Using ExecuteAsync is strongly recommended on mobile platforms. iOS (and likely Android) will
    /// terminate an application if it considers the main thread to be unresponsive, which would be the case if
    /// there is a running request which takes more than a second or two to return.
    /// </para>
    /// <para>
    /// The idea behind this is that the UI runs in the main thread and mobile devices should respond to user
    /// interaction basically immediately. Sluggish behaviour (caused by blocking the main thread) is considered
    /// unacceptable on these small devices.
    /// </para>
    /// </summary>
    /// <param name="ACompletionHandler">
    /// An anonymous method that will be run after the execution completed
    /// </param>
    /// <param name="ASynchronized">
    /// Specifies if ACompletioHandler will be run in the main thread's (True) or execution thread's (False) context
    /// </param>
    /// <param name="AFreeThread">
    /// If True, then the execution thread will be freed after it completed
    /// </param>
    /// <param name="ACompletionHandlerWithError">
    /// An anonymous method that will be run if an exception is raised during execution
    /// </param>
    /// <returns>
    /// Returns a reference to the execution thread. Should only be used if AFreeThread=False, as other wise the
    /// reference may get invalid unexpectedly.
    /// </returns>
    function ExecuteAsync(ACompletionHandler: TCompletionHandler = nil; ASynchronized: Boolean = True;
      AFreeThread: Boolean = True; ACompletionHandlerWithError: TCompletionHandlerWithError = nil): TRESTExecutionThread;

    /// <summary>
    /// Builds the final URL that will be executed. this includes also the placeholders for url-segments
    /// as well as query-parameters
    /// </summary>
    function GetFullRequestURL(AIncludeParams: Boolean = True): string;

    /// <summary>
    /// Transient Params are typically create and re-created by
    /// Authenticators. They are not persistent and will not be visible at
    /// designtime.
    /// In case of a naming-conflict any transient param will override a
    /// normal parameter.
    /// </summary>
    property TransientParams: TRESTRequestParameterList read FTransientParams;

    /// <summary>
    /// Specifies if "url-segment" parameters should be created automatically from the baseurl/resource.
    /// No other parameter types are affected.
    /// </summary>
    /// <example>
    /// request.Resource = "Products/{ProductId}";
    /// This will create a parameter "ProductID" (with no value assigned).
    /// If a parameter of the same name already existed
    /// the old parameter will <i>not</i> be overwritten.
    /// </example>
    property AutoCreateParams: Boolean read FAutoCreateParams write SetAutoCreateParams default True;

    /// <summary>
    /// <para>
    /// Specifies the Content-Type that is accepted for the response.
    /// </para>
    /// <para>
    /// Defaults to : application/json,text/plain;q=0.9,text/html;q=0.8<br />We are after JSON, which is why it has
    /// the highest quality factor (default 1.0)
    /// </para>
    /// </summary>
    property Accept: string read FAccept write SetAccept stored AcceptIsStored;
    /// <summary>
    /// Specifies the charset that the response is expected to be encoded in. Defaults to UTF-8.
    /// </summary>
    property AcceptCharset: string read FAcceptCharset write SetAcceptCharset stored AcceptCharSetIsStored;
    /// <summary>
    /// Specifies the accepted encoding. Defaults to empty string, which means "identity encoding".
    /// </summary>
    /// <value>
    /// To allow for compressed responses set to "gzip, deflate"
    /// </value>
    property AcceptEncoding: string read FAcceptEncoding write SetAcceptEncoding;

    /// <summary>
    /// Specifies if the HTTP client should follow possible redirects (301, 303) for this request. Default =True
    /// </summary>
    /// <remarks>
    /// See http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
    /// </remarks>
    property HandleRedirects: Boolean read FHandleRedirects write SetHandleRedirects default True;

    property Client: TCustomRESTClient read GetClient write SetClient;

    /// <summary>
    /// Determines what HTTP method to use for this request. Supported methods: GET, POST, PUT, DELETE, HEAD, OPTIONS
    /// Default is GET
    /// </summary>
    property Method: TRESTRequestMethod read GetMethod write SetMethod stored MethodIsStored;
    /// <summary>
    /// Container of all HTTP parameters to be passed with the request.
    /// See AddParameter() for explanation of the types of parameters that can be passed
    /// </summary>
    property Params: TRESTRequestParameterList read GetParams write SetParams;
    /// <summary>
    /// This property is a wrapper around the "body" request parameter.
    /// </summary>
    property Body: TBody read FBody;
    /// <summary>
    /// The Resource path to make the request against.
    /// Tokens are substituted with UrlSegment parameters and match by name.
    /// Should not include the scheme or domain. Do not include leading slash.
    /// Combined with RestClient.BaseUrl to assemble final URL:
    /// {BaseUrl}/{Resource} (BaseUrl is scheme + domain, e.g. http://example.com)
    /// </summary>
    /// <example>
    /// // example for url token replacement
    /// request.Resource = "Products/{ProductId}";
    /// request.AddParameter("ProductId", 123, ParameterType.UrlSegment);
    /// </example>
    property Resource: string read GetResource write SetResource;
    property ResourceSuffix: string read FResourceSuffix write SetResourceSuffix;
    property FullResource: string read GetFullResource;

    /// <summary>
    /// After executing a Request, it will fill in all values from the HTTP answer to this TCustomRESTResponse
    /// instance. An instance can either be assigned explicitly (e.g. in the IDE) or can be left empty, in which case
    /// TCustomRESTRequest will create an instance on demand.
    /// </summary>
    property Response: TCustomRESTResponse read GetResponse write SetResponse;

    /// <summary>
    /// Timeout in milliseconds to be used for the request.
    /// </summary>
    property Timeout: Integer read GetTimeout write SetTimeout default 30000;

    /// <summary>
    /// OnAfterExecute gets fired after TRESTCRequest.Execute has finished and the Response has been processed. Any
    /// observers will get notified <i>before</i> OnAfterExecute fires.
    /// </summary>
    property OnAfterExecute: TCustomRESTRequestNotifyEvent read FOnAfterExecute write FOnAfterExecute;

    /// <summary>
    /// Provides detailed information about the performance of the execution of a request.
    /// </summary>
    property ExecutionPerformance: TExecutionPerformance read GetExecutionPerformance;
    /// <summary>
    /// Specifies if Events (such as OnAfterExecute) should run in the context of the main
    /// thread (True) or in the context of an arbitrary thread - which was created by the developer or by using
    /// ExecuteAsync.
    /// </summary>
    //  <seealso cref="TCustomRESTRequest.ExecuteAsync" />
    property SynchronizedEvents: Boolean read FSynchronizedEvents write SetSynchronizedEvents default True;

    /// <summary>
    /// <para>
    /// OnHTTPProtocolError gets fired when the server returns a status code other than 200 - OK
    /// </para>
    /// <para>
    /// Check AClient.Response.StatusCode for the actual status.
    /// </para>
    /// <para>
    /// This event will not get fired if a non HTTP-related exception occurs during execution. This includes, but
    /// is not limited to timeout and server not found related exceptions.
    /// </para>
    /// </summary>
    property OnHTTPProtocolError: TCustomRESTRequestNotifyEvent read FOnHTTPProtocolError write FOnHTTPProtocolError;
    property BindSource: TSubRESTRequestBindSource read FBindSource;
    /// <summary>
    /// In rare scenarios, there might be services that provide urls that contain
    /// encoded parameters. these urls must not be encoded again. set this flag to True
    /// to avoid double-encoding.
    /// </summary>
    property URLAlreadyEncoded: boolean read FURLAlreadyEncoded write FURLAlreadyEncoded;
  end;

  /// <summary>
  /// LiveBindings adapter for TCustomRESTRequest. Create bindable members
  /// </summary>
  TRESTRequestAdapter = class(TRESTComponentAdapter)
  public type
    TNotify = class(TCustomRESTRequest.TNotify)
    private
      FAdapter: TRESTRequestAdapter;
      constructor Create(const AAdapter: TRESTRequestAdapter);
    public
      procedure ParameterListChanged(Sender: TObject); override;
      procedure PropertyValueChanged(Sender: TObject); override;
    end;
  private
    FRequest: TCustomRESTRequest;
    FNotify: TNotify;
    procedure SetRequest(const ARequest: TCustomRESTRequest);
    procedure AddParameterFields;
    procedure ParameterListChanged;
    procedure AddPropertyFields;
  protected
    procedure CreatePropertyFields; virtual;
    procedure DoChangePosting; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetCanActivate: Boolean; override;
    procedure AddFields; override;
    function GetSource: TBaseLinkingBindSource; override;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    procedure GetMemberNames(AList: TStrings); override;
    property Request: TCustomRESTRequest read FRequest write SetRequest;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomRESTRequest.  Creates adapter.
  /// </summary>
  TCustomRESTRequestBindSource = class(TRESTComponentBindSource)
  private
    FAdapter: TRESTRequestAdapter;
    function GetRequest: TCustomRESTRequest;
    procedure SetRequest(const Value: TCustomRESTRequest);
  protected
    function CreateRequestAdapter: TRESTRequestAdapter; virtual;
    function CreateAdapter: TRESTComponentAdapter; override;
  public
    property Request: TCustomRESTRequest read GetRequest write SetRequest;
    property Adapter: TRESTRequestAdapter read FAdapter;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomRESTRequest.  Publishes subcomponent properties
  /// </summary>
  TSubRESTRequestBindSource = class(TCustomRESTRequestBindSource)
  published
    property AutoActivate;
    property AutoEdit;
    property AutoPost;
  end;

  TRESTRequest = class(TCustomRESTRequest)
  published
    property Accept;
    property AcceptCharset;
    property AcceptEncoding;
    property AutoCreateParams;
    property HandleRedirects;
    property Client;
    property Method;
    property Params;
    property Resource;
    property ResourceSuffix;
    property Response;
    property Timeout;
    property OnAfterExecute;
    property ExecutionPerformance;
    property SynchronizedEvents;
    property OnHTTPProtocolError;
    property BindSource;
  end;

  /// <summary>
  /// Base class for TCustomRESTResponse
  /// </summary>
  TCustomRESTResponse = class(TBaseObjectBindSourceDelegate, IRESTResponseJSON)
  public type
    TNotify = TRESTJSONComponentNotify;

    TNotifyList = TRESTComponentNotifyList<TNotify>;
    TUpdateOption = (PropertyValueChanged, JSONValueChanged);
    TUpdateOptions = set of TUpdateOption;

    TJSONValueError = (NoContent, NoJSON, InvalidRootElement);
    TJSONValueErrorEvent = procedure(Sender: TObject; AUpdateError: TJSONValueError; const AMessage: string) of object;
    EJSONValueError = class(ERESTException)
    private
      FError: TJSONValueError;
    public
      constructor Create(AError: TJSONValueError; const AMessage: string);
      property Error: TJSONValueError read FError;
    end;
  public type
    TStatus = record
    private
      [weak] FResponse: TCustomRESTResponse;
    public
      function Success: Boolean;
      function ClientError: Boolean;
      function SuccessOK_200: Boolean;
      function SucessCreated_201: Boolean;
      function ClientErrorBadRequest_400: Boolean;
      function ClientErrorUnauthorized_401: Boolean;
      function ClientErrorForbidden_403: Boolean;
      function ClientErrorNotFound_404: Boolean;
      function ClientErrorNotAcceptable_406: Boolean;
      function ClientErrorDuplicate_409: Boolean;
    end;

  private
    FStatus: TStatus;
    FUpdating: Integer;
    FUpdateOptions: TUpdateOptions;
    FContent: string;
    FContentEncoding: string;
    FContentType: string;
    FErrorMessage: string;
    FHeaders: TStrings;
    FRawBytes: TBytes;
    FFullRequestURI: string;
    FJSONValue: TJsonValue;
    FJSONStreamReader: TStreamReader;
    FJSONTextReader: TJsonTextReader;
    FJSONStream: TStream;
    FRootElement: string;
    FServer: string;
    FStatusCode: Integer;
    FStatusText: string;

    FBindSource: TSubRESTResponseBindSource;
    FNotifyList: TNotifyList;
    FJSONNotifyList: TList<TNotifyEvent>;

    function GetHeaders: TStrings;
    function GetJSONValue: TJsonValue;
    procedure SetRootElement(const AValue: string);
    function GetStatusCode: Integer;
    procedure SetStatusCode(const AValue: Integer);
    function GetStatusText: string;
    procedure SetStatusText(const AValue: string);
    function GetContentEncoding: string;
    function GetContent: string;
    function GetContentLength: cardinal;
    procedure SetContentEncoding(const AValue: string);
    function GetContentType: string;
    procedure SetContentType(const AValue: string);
    function GetErrorMessage: string;
    procedure SetErrorMessage(const AValue: string);
    function GetFullRequestURI: string;
    procedure SetFullRequestURI(const AValue: string);
    function GetServer: string;
    procedure SetServer(const AValue: string);
    function GetStatus: TStatus;
    function GetJSONText: string;
    function GetJSONReader: TJSONTextReader;
  protected
    procedure BeginUpdate;
    procedure EndUpdate;
    function IsUpdating: Boolean;
    function CreateBindSource: TBaseObjectBindSource; override;
    procedure PropertyValueChanged; virtual;
    procedure JSONValueChanged; virtual;
    procedure SetContent(const AContent: string);
    procedure SetRawBytes(const AStream: TStream);
    { IRESTResponseJSON }
    procedure AddJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure GetJSONResponse(out AJSONValue: TJSONValue; out AHasOwner: Boolean);
    function HasJSONResponse: Boolean;
    function HasResponseContent: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    /// <summary>
    /// Simple and rough attempt to extract simple parameters out of a response content. Will certainly not work for
    /// all scenarios, but might be convenient in some situations
    /// </summary>
    /// <remarks>
    /// Works on text/html and application/json conten-types.
    /// </remarks>
    /// <example>
    /// <para>
    /// text/html
    /// </para>
    /// <para>
    /// oauth_token=abc123&amp;oauth_token_secret=def456&amp;oauth_callback_confirmed=true
    /// </para>
    /// <para>
    /// application/json
    /// </para>
    /// <para>
    /// { "oauth_token" : "abc123", "oauth_token_secret" : "def456", "oauth_callback_confirmed" : true }
    /// </para>
    /// </example>
    function GetSimpleValue(const AName: string; var AValue: string): Boolean;

    /// <summary>
    /// Sets all fields to their default value. No state information, such as Content,
    /// StatusCode etc is kept.
    /// </summary>
    procedure ResetToDefaults;
    /// <summary>
    /// Encoding of the response content. Used for compression (e.g. deflate, gzip).
    /// The actual RAWBytes or Content string would already be decoded though.
    /// Thus this property is for reference purposes only.
    /// </summary>
    property ContentEncoding: string read GetContentEncoding write SetContentEncoding;
    /// <summary>
    /// Length in bytes of the response content
    /// </summary>
    property ContentLength: cardinal read GetContentLength;
    /// <summary>
    /// MIME content type of response
    /// </summary>
    property ContentType: string read GetContentType write SetContentType;
    (*
      /// <summary>
      /// Cookies returned by server with the response
      /// </summary>
      IList<RestResponseCookie> Cookies { get; }
    *)

    (*
      /// <summary>
      /// Headers returned by server with the response
      /// </summary>
      IList<Parameter> Headers { get; }
    *)

    (*
      /// <summary>
      /// Status of the request. Will return Error for transport errors.
      /// HTTP errors will still return ResponseStatus.Completed, check StatusCode instead
      /// </summary>
      ResponseStatus ResponseStatus { get; set; }
    *)

    /// <summary>
    /// HTTP protocol error that occured during request
    /// </summary>
    property ErrorMessage: string read GetErrorMessage write SetErrorMessage;
    /// <summary>
    /// HTTP response header-lines
    /// </summary>
    property Headers: TStrings read GetHeaders;

    /// <summary>
    /// <para>
    /// Response content string parsed as JSON value. Nil, if content does not successfully parse.
    /// </para>
    /// <para>
    /// If TCustomRESTRequest.RootValue has a value, then the content needs to represent a Json object (not an array that
    /// is), and the result will be the value of the pair with the name "RootElement". RootElement supports a "dot" syntax. Example:
    /// {response:{"name":"Smith", "phone":"1234", "orders":[{...}, {...}]}}
    /// In that case setting RootElement to "response" would return the whol customer object.
    /// Setting RootElement to "response.orders" would return the array of order objects.
    /// </para>
    /// </summary>
    /// <remarks>
    /// This method returns TJSONValue by intention. The developer has to know and decide if this would cast to
    /// TJSONObject or TJSONArray (or possibly other types), as this depends on the actual API call.
    /// The returned JSONValue is owned by the RESTResponse, which means that the developer must not free this.
    /// </remarks>
    /// <example>
    /// <para>
    /// {result : {customer:"John Doe", address:"Silicon Valley"}}
    /// </para>
    /// <para>
    /// With RootElement set to "result", JSONValue will return the inner customer object:
    /// </para>
    /// <para>
    /// {customer:"John Doe", address:"Silicon Valley"}
    /// </para>
    /// </example>
    /// <seealso cref="RootElement" />
    property JSONValue: TJsonValue read GetJSONValue;
    property JSONText: string read GetJSONText;
    property JSONReader: TJSONTextReader read GetJSONReader;
    (*
      /// <summary>
      /// Description of HTTP status returned
      /// </summary>
      string StatusDescription { get; set; }
    *)

    /// <summary>
    /// Response content as bytes array.
    /// </summary>
    /// <remarks>
    /// RAWBytes is already decoded using the charset as sent by the sever. They are in default Unicode encoding that
    /// is.
    /// </remarks>
    property RawBytes: TBytes read FRawBytes;
    /// <summary>
    /// The fully qualified request URI that lead to this response.
    /// </summary>
    property FullRequestURI: string read GetFullRequestURI write SetFullRequestURI;
    /// <summary>
    /// Server identifier, e.g. "Microsoft-IIS/7.0"
    /// </summary>
    property Server: string read GetServer write SetServer;
    /// <summary>
    /// HTTP response status code
    /// </summary>
    property StatusCode: Integer read GetStatusCode write SetStatusCode;
    /// <summary>
    /// HTTP response status text
    /// </summary>
    property StatusText: string read GetStatusText write SetStatusText;

    /// <summary>
    /// String representation of response content
    /// </summary>
    property Content: string read GetContent;

    /// <summary>
    /// Optional path into the JSON response content.  The path identifies a starting point for loading the JSONValue property.
    /// Sample RootElement paths: "foo", "foo.bar", "[0].foo", "foo.bar[0]".
    /// </summary>
     property RootElement: string read FRootElement write SetRootElement;

    property BindSource: TSubRESTResponseBindSource read FBindSource;
    property NotifyList: TNotifyList read FNotifyList;

    property Status: TStatus read GetStatus;
  end;

  /// <summary>
  /// LiveBindings adapter for TCustomRESTResponse. Create bindable members
  /// </summary>
  TRESTResponseAdapter = class(TRESTComponentAdapter)
  public type
    TNotify = class(TCustomRESTResponse.TNotify)
    private
      FAdapter: TRESTResponseAdapter;
      constructor Create(const AAdapter: TRESTResponseAdapter);
    public
      procedure PropertyValueChanged(Sender: TObject); override;
    end;
  private
    FResponse: TCustomRESTResponse;
    FNotify: TNotify;
    procedure SetResponse(const AResponse: TCustomRESTResponse);
    procedure AddPropertyFields;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetCanActivate: Boolean; override;
    procedure AddFields; override;
    function GetSource: TBaseLinkingBindSource; override;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    property Response: TCustomRESTResponse read FResponse write SetResponse;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomRESTResponse. Creates adapter
  /// </summary>
  TCustomRESTResponseBindSource = class(TRESTComponentBindSource)
  private
    FAdapter: TRESTResponseAdapter;
    function GetResponse: TCustomRESTResponse;
    procedure SetResponse(const Value: TCustomRESTResponse);
  protected
    function CreateAdapter: TRESTComponentAdapter; override;
  public
    property Response: TCustomRESTResponse read GetResponse write SetResponse;
    property Adapter: TRESTResponseAdapter read FAdapter;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomRESTRequest. Publishes subcomponent properties
  /// </summary>
  TSubRESTResponseBindSource = class(TCustomRESTResponseBindSource)
  published
    property AutoActivate;
    property AutoEdit;
    property AutoPost;
  end;

  TRESTResponse = class(TCustomRESTResponse)
  published
    property Content;
    property ContentLength;
    property ContentType;
    property ContentEncoding;
    property RootElement;
    property BindSource;
  end;

  /// <summary>
  /// Used for event handlers of TCustomRESTClient
  /// </summary>
  TCustomRESTClientNotifyEvent = procedure(Sender: TCustomRESTClient) of object;

  /// <summary>
  /// TCustomRESTClient is an easy to use class for accessing REST APIs. It is typically used by inheriting from it in a
  /// specific REST API class.
  /// </summary>
  /// <remarks>
  /// <para>
  /// TCustomRESTClient works with JSON only. XML as transport format is not supported that is.<br />HTTP and HTTPS urls
  /// are supported.
  /// </para>
  /// </remarks>
  /// <example>
  /// TTwitterchAPI = class(TCustomRESTClient)<br /> procedure Tweet(AMessage: string);<br />end;
  /// </example>
  TCustomRESTClient = class(TBaseObjectBindSourceDelegate, IRESTRequestParameterListOwnerNotify)
  public type
    TNotify = class(TRESTComponentNotify)
    public
      procedure ParameterListChanged(Sender: TObject); virtual;
    end;

    TNotifyList = TRESTComponentNotifyList<TNotify>;
  private
    FBindSource: TSubRESTClientBindSource;
    FNotifyList: TNotifyList;
    FOnHTTPProtocolError: TCustomRESTClientNotifyEvent;
    FAutoCreateParams: Boolean;
    FParams: TRESTRequestParameterList;
    FTransientParams: TRESTRequestParameterList;
    FAuthenticator: TCustomAuthenticator;
    FBaseURL: string;
    FFallbackCharsetEncoding: string;
    FSynchronizedEvents: Boolean;
    FRaiseExceptionOn500: Boolean;
    FHttpClient: TRESTHTTP;
    FPosting: Boolean;
    function FallbackCharsetEncodingIsStored: Boolean;
    function UserAgentIsStored: Boolean;
    procedure SetParams(const AValue: TRESTRequestParameterList);
    procedure SetAutoCreateParams(const AValue: Boolean);
    // Getters and Setters
    function GetProxyPassword: string;
    function GetProxyPort: Integer;
    function GetProxyServer: string;
    function GetProxyUsername: string;
    procedure SetBaseURL(const AValue: string);
    procedure SetProxyPassword(const AValue: string);
    procedure SetProxyPort(const AValue: Integer);
    procedure SetProxyServer(const AValue: string);
    procedure SetProxyUsername(const AValue: string);
    procedure SetUserAgent(const AValue: string);
    function GetParams: TRESTRequestParameterList;
    function GetFallbackCharsetEncoding: string;
    procedure SetFallbackCharsetEncoding(const AValue: string);
    function GetAuthenticator: TCustomAuthenticator;
    procedure SetAuthenticator(const AValue: TCustomAuthenticator);
    function GetBaseURL: string;
    function GetAccept: string;
    procedure SetAccept(const AValue: string);
    function GetUserAgent: string;
    function GetAllowCookies: Boolean;
    procedure SetAllowCookies(const AValue: Boolean);
    function GetHandleRedirects: Boolean;
    procedure SetHandleRedirects(const AValue: Boolean);
    function GetAcceptCharset: string;
    procedure SetAcceptCharset(const AValue: string);
    function GetAcceptEncoding: string;
    procedure SetAcceptEncoding(const AValue: string);
    function GetContentType: string;
    procedure SetContentType(const AValue: string);
    function GetHttpClient: TRESTHTTP;
    procedure SetSynchronizedEvents(const AValue: Boolean);
    function GetOnValidateCertificate: TValidateCertificateEvent;
    procedure SetOnValidateCertificate(const Value: TValidateCertificateEvent);
    function GetRedirectsWithGET: THTTPRedirectsWithGET;
    function GetSecureProtocols: THTTPSecureProtocols;
    function GetNeedClientCertificateEvent: TNeedClientCertificateEvent;
    function GetAuthEvent: TCredentialsStorage.TCredentialAuthevent;
    procedure SetRedirectsWithGET(const AValue: THTTPRedirectsWithGET);
    procedure SetSecureProtocols(const AValue: THTTPSecureProtocols);
    procedure SetNeedClientCertificateEvent(const AValue: TNeedClientCertificateEvent);
    procedure SetAuthEvent(const AValue: TCredentialsStorage.TCredentialAuthevent);
    property HTTPClient: TRESTHTTP read GetHttpClient;
  protected
    property NotifyList: TNotifyList read FNotifyList;
    procedure ParameterListChanged; virtual;
    procedure ParameterValueChanged; virtual;
    procedure PropertyValueChanged; virtual;
    function CreateBindSource: TBaseObjectBindSource; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    /// <summary>
    /// (Re-)creates the actual Http client and applies default values.
    /// </summary>
    procedure CreateHttpClient;
    /// <summary>
    /// OnHTTPProtocol dispatch method. Called internally.
    /// </summary>
    procedure DoHTTPProtocolError; virtual;

    /// <summary>
    /// HandleEvent ensures that an event handler is ran synchronized or not depending on
    /// SynchronizedEvents
    /// </summary>
    /// <seealso cref="TCustomRESTClient.SynchronizedEvents" />
    procedure HandleEvent(AEventHandler: TMethod); virtual;
  public
    /// <summary>
    /// Instantiates a client to the given REST API service.
    /// </summary>
    /// <param name="ABaseApiURL">
    /// This is the base URL for the REST API. E.g.: http://your.server.com/service/api/
    /// </param>
    constructor Create(const ABaseApiURL: string); reintroduce; overload;
    /// <summary>
    /// Instantiates a client to the given REST API service, with no BaseURL being set.
    /// </summary>
    constructor Create(AOwner: TComponent); overload; override;
    destructor Destroy; override;

    /// <summary>
    /// Adds a HTTP parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed. (QueryString for GET, DELETE, OPTIONS and HEAD; Encoded form for POST and PUT)
    /// </summary>
    /// <param name="AName">Name of the parameter</param>
    /// <param name="AValue">Value of the parameter</param>
    procedure AddParameter(const AName, AValue: string); overload;

    /// <summary>
    /// Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed. There are five kinds of parameters:
    /// - GetOrPost: Either a QueryString value or encoded form value based on method
    /// - HttpHeader: Adds the name/value pair to the HTTP request's Headers collection
    /// - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId}
    /// - Cookie: Adds the name/value pair to the HTTP request's Cookies collection
    /// - RequestBody: Used by AddBody() (not recommended to use directly)
    /// </summary>
    /// <param name="AName">Name of the parameter</param>
    /// <param name="AValue">Value of the parameter</param>
    /// <param name="AKind">The kind of parameter to add</param>
    procedure AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind); overload;

    /// <summary>
    /// Adds a parameter to the request. If a parameter of the same name already exists, then the previous parameter
    /// will be removed and freed.<br /><br />There are five kinds of parameters: - GetOrPost: Either a QueryString
    /// value or encoded form value based on method - HttpHeader: Adds the name/value pair to the HTTP request's
    /// Headers collection - UrlSegment: Inserted into URL if there is a matching url token e.g. {AccountId} -
    /// Cookie: Adds the name/value pair to the HTTP request's Cookies collection - RequestBody: Used by AddBody()
    /// (not recommended to use directly)
    /// </summary>
    /// <param name="AName">
    /// Name of the parameter
    /// </param>
    /// <param name="AValue">
    /// Value of the parameter
    /// </param>
    /// <param name="AKind">
    /// The kind of parameter to add
    /// </param>
    /// <param name="AOptions">
    /// Options for processing the parameter
    /// </param>
    procedure AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions); overload;

    /// <summary>
    /// Add an authentication parameter. Auth-params are always transient.
    /// </summary>
    procedure AddAuthParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
      const AOptions: TRESTRequestParameterOptions = []); overload;

    procedure SetCookie(const ACookie, AURL: string);
    procedure SetHTTPHeader(const AName, AValue: string);

    function GetEntity<T: class, constructor>(const AResource: string): T;
    /// <summary>
    /// Sends a GET request and tries to map the result to a List of instances
    /// of class &lt;T&gt;
    /// </summary>
    function GetEntityList<T: class, constructor>(const AResource: string): TObjectList<T>;
    /// <summary>
    /// Sends a GET request and tries to map the result to an Array of instances
    /// of class &lt;T&gt; This function calls GetEntityList internally.
    /// </summary>
    function GetEntityArray<T: class, constructor>(const AQuery: string): TArray<T>;
    /// <summary>
    /// Sends a POST request to "insert" an AEntity to the service resources
    /// </summary>
    function PostEntity<T: class, constructor>(const AResource: string; AEntity: T): TJSONObject;

    /// <summary>
    /// Resets the RESTClient to default values and clears all entries. The internal
    /// HTTPClient will also be recreated.
    /// </summary>
    procedure ResetToDefaults;

    procedure Disconnect;

    /// <summary>
    /// Transient Params are typically created and re-created by
    /// Authenticators. They are not persistent and will not be visible at
    /// designtime.
    /// In case of a naming-conflict any transient param will override a
    /// normal parameter.
    /// </summary>
    property TransientParams: TRESTRequestParameterList read FTransientParams;

    /// <summary>
    /// Controls the automatic creation of request-params of type "url-segment" only. no
    /// other param-types are afftected.
    /// </summary>
    property AutoCreateParams: Boolean read FAutoCreateParams write SetAutoCreateParams default True;

    /// <summary>
    /// Specifies a to be used Authenticator. If left empty, no specific authentication will be used.
    /// </summary>
    /// <example>
    /// <para>
    /// LClient := TCustomRESTClient.Create('http://www.example.com');<br />//This is a professional password on a closed
    /// course. Do not try this at home!<br />LBasicAuth := THTTPBasicAuthenticator.Create('JohnDoe', 'secret');
    /// </para>
    /// <para>
    /// // RestClient owns its Authenticator through an Interface reference, so technically you do not need to
    /// destroy<br /> // an Authenticator on its own.<br />LClient.Authenticator := LBasicAuth;
    /// </para>
    /// </example>
    // <seealso cref="TSimpleAuthenticator">
    // Simple Authentication
    // </seealso>
    // <seealso cref="THTTPBasicAuthenticator">
    // Basic Authentication
    // </seealso>
    // <seealso cref="TOAuth1Authenticator">
    // OAuth1 Authentication
    // </seealso>
    // <seealso cref="TOAuth2Authenticator">
    // OAuth2 Authentication
    // </seealso>
    property Authenticator: TCustomAuthenticator read GetAuthenticator write SetAuthenticator;

    property Accept: string read GetAccept write SetAccept;
    property AcceptCharset: string read GetAcceptCharset write SetAcceptCharset;
    property AcceptEncoding: string read GetAcceptEncoding write SetAcceptEncoding;
    property AllowCookies: Boolean read GetAllowCookies write SetAllowCookies default True;

    /// <summary>
    /// Base URL for all API calls. All request resources and parameters will be appended to this URL
    /// </summary>
    /// <remarks>
    /// Setting the BaseURL ensures, that a possibly trailing slash is removed.
    /// </remarks>
    /// <example>
    /// https://api.twitter.com/
    /// </example>
    property BaseURL: string read GetBaseURL write SetBaseURL;

    /// <summary>
    /// ContentType for a POST or PUT requests. This property will be used internally while TRESTClient.Execute.
    /// </summary>
    property ContentType: string read GetContentType write SetContentType;

    /// <summary>
    /// <para>
    /// Specifies a character encoding for strings, which will be used if the server does not specify one.
    /// </para>
    /// <para>
    /// RFC2616 technically specifies ISO-8859-1 as default character, but
    /// <see href="http://www.w3.org/TR/html4/charset.html" /> section 5.2.2 clearly says that this specification
    /// has proven useless.
    /// </para>
    /// <para>
    /// There are some (many?) servers/APIs that actually use UTF-8, but "forget" to specify that in their
    /// responses. As UTF-8 is a defacto-standard for Web/HTPP anyway, 'UTF-8' is used as default here.
    /// </para>
    /// <para>
    /// If FallbackCharsetEncoding is set to '' (empty string) or 'raw', then the current default encoding will be
    /// used - which usually won't make much sense.
    /// </para>
    /// </summary>
    /// <remarks>
    /// RAWBytes, will always return an undecoded array of bytes as sent by the server.
    /// </remarks>
    property FallbackCharsetEncoding: string read GetFallbackCharsetEncoding
      write SetFallbackCharsetEncoding stored FallbackCharsetEncodingIsStored;

    /// <summary>
    /// Container of all HTTP parameters to be passed with each request.
    /// See Params.Add() for explanation of the types of parameters that can be passed.
    /// Priority of Params is as follows - highest priority first:
    /// 1 : Transient Parameters
    /// 2 : Parameters supplied by the RESTRequest
    /// 3 : Parameters supplied by the RESTClient
    /// Example: if there are two parameters with the same name, one transient, the other
    /// </summary>
    property Params: TRESTRequestParameterList read GetParams write SetParams;

    property HandleRedirects: Boolean read GetHandleRedirects write SetHandleRedirects
      default True;
    property RedirectsWithGET: THTTPRedirectsWithGET read GetRedirectsWithGET
      write SetRedirectsWithGET default CHTTPDefRedirectsWithGET;

    property SecureProtocols: THTTPSecureProtocols read GetSecureProtocols
      write SetSecureProtocols default CHTTPDefSecureProtocols;

    /// <summary>
    /// Password for proxy authentication (optional)
    /// </summary>
    property ProxyPassword: string read GetProxyPassword write SetProxyPassword;
    /// <summary>
    /// Port for HTTP proxy server.
    /// </summary>
    /// <value>
    /// Will be ignored if 0
    /// </value>
    property ProxyPort: Integer read GetProxyPort write SetProxyPort default 0;
    /// <summary>
    /// Server name for proxy server. Specify a fully qualified domain name or IP address. Proxy settings will be
    /// ignored if left empty.
    /// </summary>
    property ProxyServer: string read GetProxyServer write SetProxyServer;
    /// <summary>
    /// User name for proxy authentication (optional).
    /// </summary>
    property ProxyUsername: string read GetProxyUsername write SetProxyUsername;

    /// <summary>
    /// Specifies if an Exception should be raised if a 500 Protocol exception occurs. Defaults to True;
    /// </summary>
    property RaiseExceptionOn500: Boolean read FRaiseExceptionOn500 write FRaiseExceptionOn500 default True;
    /// <summary>
    /// Specifies if Events (such as OnAfterExecute or OnHTTPProtocolError) should run in the context of the main
    /// thread (True) or in the context of an arbitrary thread - which was created by the developer or by using
    /// ExecuteAsync.
    /// </summary>
    // <seealso cref="TCustomRESTRequest.ExecuteAsync" />
    property SynchronizedEvents: Boolean read FSynchronizedEvents
      write SetSynchronizedEvents default True;
    /// <summary>
    /// Defaults to 'Embarcadero RESTClient/{version}'
    /// </summary>
    /// <remarks>
    /// See http://tools.ietf.org/html/rfc2616#section-14.43
    /// </remarks>
    property UserAgent: string read GetUserAgent write SetUserAgent stored UserAgentIsStored;
    /// <summary>
    /// <para>
    /// OnHTTPProtocolError gets fired when the server returns a status code other than 200 - OK
    /// </para>
    /// <para>
    /// Check AClient.Response.StatusCode for the actual status.
    /// </para>
    /// <para>
    /// This event will not get fired if a non HTTP-related exception occurs during execution. This includes, but
    /// is not limited to timeout and server not found related exceptions.
    /// </para>
    /// </summary>
    property OnHTTPProtocolError: TCustomRESTClientNotifyEvent
      read FOnHTTPProtocolError write FOnHTTPProtocolError;
    property BindSource: TSubRESTClientBindSource read FBindSource;

    /// <summary>Validate the certificate provided by a secure (HTTPS) server</summary>
    property OnValidateCertificate: TValidateCertificateEvent
      read GetOnValidateCertificate write SetOnValidateCertificate;
    property OnNeedClientCertificate: TNeedClientCertificateEvent
      read GetNeedClientCertificateEvent write SetNeedClientCertificateEvent;
    property OnAuthEvent: TCredentialsStorage.TCredentialAuthevent
      read GetAuthEvent write SetAuthEvent;
  end;

  /// <summary>
  /// LiveBindings adapter for TCustomRESTClient. Create bindable members
  /// </summary>
  TRESTClientAdapter = class(TRESTComponentAdapter)
  public type
    TNotify = class(TCustomRESTClient.TNotify)
    private
      FAdapter: TRESTClientAdapter;
      constructor Create(const AAdapter: TRESTClientAdapter);
    public
      procedure ParameterListChanged(Sender: TObject); override;
      procedure PropertyValueChanged(Sender: TObject); override;
    end;
  private
    FClient: TCustomRESTClient;
    FNotify: TNotify;
    procedure SetClient(const AClient: TCustomRESTClient);
    procedure AddParameterFields;
    procedure ParameterListChanged;
    procedure AddPropertyFields;
  protected
    procedure DoChangePosting; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetCanActivate: Boolean; override;
    procedure AddFields; override;
    function GetSource: TBaseLinkingBindSource; override;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    procedure GetMemberNames(AList: TStrings); override;
    property Client: TCustomRESTClient read FClient write SetClient;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomRESTResponse. Creates adapter
  /// </summary>
  TCustomRESTClientBindSource = class(TRESTComponentBindSource)
  private
    FAdapter: TRESTClientAdapter;
    function GetClient: TCustomRESTClient;
    procedure SetClient(const AValue: TCustomRESTClient);
  protected
    function CreateAdapter: TRESTComponentAdapter; override;
  public
    property Client: TCustomRESTClient read GetClient write SetClient;
    property Adapter: TRESTClientAdapter read FAdapter;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomRESTClient. Publishes subcomponent properties
  /// </summary>
  TSubRESTClientBindSource = class(TCustomRESTClientBindSource)
  published
    property AutoActivate;
    property AutoEdit;
    property AutoPost;
  end;

  TRESTClient = class(TCustomRESTClient)
  published
    property Authenticator;
    property Accept;
    property AcceptCharset;
    property AcceptEncoding;
    property AllowCookies;
    property AutoCreateParams;
    property BaseURL;
    property ContentType;
    property FallbackCharsetEncoding;
    property Params;
    property HandleRedirects;
    property RedirectsWithGET;
    property SecureProtocols;
    property ProxyPassword;
    property ProxyPort;
    property ProxyServer;
    property ProxyUsername;
    property RaiseExceptionOn500;
    property SynchronizedEvents;
    property UserAgent;
    property OnHTTPProtocolError;
    property BindSource;
    property OnValidateCertificate;
    property OnNeedClientCertificate;
    property OnAuthEvent;
  end;

  TAuthenticateEvent = procedure(ARequest: TCustomRESTRequest; var ADone: Boolean) of object;

  /// <summary>
  /// Base class for all authenticators authenticators are attached to the rest-clients
  /// </summary>
  TCustomAuthenticator = class(TBaseObjectBindSourceDelegate)
  protected type
    TNotify = TRESTComponentNotify;
    TNotifyList = TRESTComponentNotifyList<TNotify>;
  private
    FNotifyList: TNotifyList;
    FOnAuthenticate: TAuthenticateEvent;
  protected
    procedure PropertyValueChanged; virtual;

    property NotifyList: TNotifyList read FNotifyList;

    /// <summary>
    /// does the actual authentication by extending the request with parameters and data as needed
    /// </summary>
    procedure DoAuthenticate(ARequest: TCustomRESTRequest); virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Authenticate(ARequest: TCustomRESTRequest);
    procedure ResetToDefaults; virtual;
  published
    property OnAuthenticate: TAuthenticateEvent read FOnAuthenticate write FOnAuthenticate;
  end;

  /// <summary>
  /// LiveBindings adapter for TCustomAuthenticator.  Descendents add bindable members.
  /// </summary>
  TRESTAuthenticatorAdapter<T: TCustomAuthenticator> = class(TRESTComponentAdapter)
  private
    FAuthenticator: T;
    procedure SetAuthenticator(const AAuthenticator: T);
  protected type
    TNotify = TRESTComponentAdapter.TNotify;
  private
    FNotify: TNotify;
  protected
    function GetSource: TBaseLinkingBindSource; override;
    procedure DoAuthenticatorChanging; virtual;
    procedure DoAuthenticatorChanged; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetCanActivate: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Authenticator: T read FAuthenticator write SetAuthenticator;
  end;

  /// <summary>
  /// LiveBindings bindsource for TCustomAuthenticator.  Creates adapter.
  /// </summary>
  TRESTAuthenticatorBindSource<T: TCustomAuthenticator> = class(TRESTComponentBindSource)
  private
    FAdapter: TRESTAuthenticatorAdapter<T>;
    function GetAuthenticator: TCustomAuthenticator;
    procedure SetAuthenticator(const Value: TCustomAuthenticator);
  protected
    function CreateAdapter: TRESTComponentAdapter; override;
    function CreateAdapterT: TRESTAuthenticatorAdapter<T>; virtual;
  public
    property Authenticator: TCustomAuthenticator read GetAuthenticator write SetAuthenticator;
    property Adapter: TRESTAuthenticatorAdapter<T> read FAdapter;
  published
    property AutoActivate;
    property AutoEdit;
    property AutoPost;
  end;

  /// <summary>
  /// Download a file
  /// </summary>
  TDownloadURL = class
  private
    class procedure CheckForError(const AResponse: TCustomRESTResponse); static;
  public
    class procedure DownloadRawBytes(const AURL: string; const AStream: TStream); static;
  end;

implementation

uses
{$IFDEF MACOS}
  Macapi.CoreFoundation,
{$ENDIF}
  System.Math, System.Types, System.Rtti, System.StrUtils, System.TypInfo,
  System.NetEncoding, System.JSON.Types, System.Net.Mime,
  Data.Bind.Json, // JSON LiveBindings converters
  REST.Json, REST.Consts, REST.Utils;

const
  sRequestDefaultAccept = CONTENTTYPE_APPLICATION_JSON + ', ' +
    CONTENTTYPE_TEXT_PLAIN + '; q=0.9, ' + CONTENTTYPE_TEXT_HTML + ';q=0.8,';
  // UTF-8 is prefered, any other is good, but marked down
  sRequestDefaultAcceptCharset = 'utf-8, *;q=0.8';
  sDefaultFallbackCharSetEncoding = 'utf-8';
  sDefaultUserAgent = 'Embarcadero RESTClient/' + RESTCLIENT_VERSION;
  sBody = 'body';
  sFile = 'file';

function RESTFindDefaultRequest(AComp: TComponent): TCustomRESTRequest;
begin
  Result := TRESTFindDefaultComponent.FindDefaultT<TCustomRESTRequest>(AComp);
end;

function RESTFindDefaultResponse(AComp: TComponent): TCustomRESTResponse;
begin
  Result := TRESTFindDefaultComponent.FindDefaultT<TCustomRESTResponse>(AComp);
end;

function RESTFindDefaultClient(AComp: TComponent): TCustomRESTClient;
begin
  Result := TRESTFindDefaultComponent.FindDefaultT<TCustomRESTClient>(AComp);
end;

function RESTFindDefaultAuthenticator(AComp: TComponent): TCustomAuthenticator;
begin
  Result := TRESTFindDefaultComponent.FindDefaultT<TCustomAuthenticator>(AComp);
end;

/// <summary>
/// Iterates through all components of the same owner (typically a form)
/// and looks for TRESTRequests having no response assigned. if found,
/// the new component is just assigned as response.
/// </summary>
procedure AssignResponseToRESTRequests(AResponse: TCustomRESTResponse);
begin
  TRESTFindDefaultComponent.FindAllT<TCustomRESTRequest>(AResponse,
    procedure(AComp: TCustomRESTRequest)
    begin
      if AComp.Response = nil then
        AComp.Response := AResponse;
    end);
end;

/// <summary>
/// Iterates through all components of the same owner (typically a form)
/// and looks for TRESTRequests having no client assigned. if found, the
/// new component is just assigned as client.
/// </summary>
procedure AssignClientToRESTRequests(AClient: TCustomRESTClient);
begin
  TRESTFindDefaultComponent.FindAllT<TCustomRESTRequest>(AClient,
    procedure(AComp: TCustomRESTRequest)
    begin
      if AComp.Client = nil then
        AComp.Client := AClient;
    end);
end;

/// <summary>
/// Iterates through all components of the same owner (typically a form)
/// and looks for TRESTClients having no authenticator assigned. if found,
/// the new component is just assigned as authenticator.
/// </summary>
procedure AssignAuthenticatorToRESTClients(AAuthenticator: TCustomAuthenticator);
begin
  TRESTFindDefaultComponent.FindAllT<TCustomRESTClient>(AAuthenticator,
    procedure(AComp: TCustomRESTClient)
    begin
      if AComp.Authenticator = nil then
        AComp.Authenticator := AAuthenticator;
    end);
end;

{ TRESTRequestParameter }

procedure TRESTRequestParameter.Assign(ASource: TPersistent);
var
  LParam: TRESTRequestParameter;
begin
  if ASource is TRESTRequestParameter then
  begin
    LParam := TRESTRequestParameter(ASource);
    FName := LParam.Name;
    FValue := LParam.Value;
    FStream := LParam.Stream;
    FStreamOwner := False;
    FKind := LParam.Kind;
    FOptions := LParam.Options;
    FContentType := LParam.ContentType;
  end
  else
    inherited Assign(ASource);
end;

constructor TRESTRequestParameter.Create(ACollection: TCollection);
begin
  inherited Create(ACollection);
  FName := '';
  FValue := '';
  FKind := DefaulTRESTRequestParameterKind;
  FOptions := [];
  FContentType := DefaultRESTContentType;
end;

destructor TRESTRequestParameter.Destroy;
begin
  ReleaseStream;
  inherited Destroy;
end;

procedure TRESTRequestParameter.ReleaseStream;
begin
  if FStream <> nil then
  begin
    if StreamOwner then
      FStream.Free;
    FStream := nil;
  end;
end;

procedure TRESTRequestParameter.NotifyParameterChanged(AValueChanged: Boolean);
var
  LNotify: IRESTRequestParameterListOwnerNotify;
begin
  if (Collection is TRESTRequestParameterList) and (Collection.Owner <> nil) then
    if TRESTRequestParameterList(Collection).UpdateCount = 0 then
      if Supports(Collection.Owner, IRESTRequestParameterListOwnerNotify, LNotify) then
        if AValueChanged then
          LNotify.ParameterValueChanged
        else
          LNotify.ParameterListChanged;
end;

function TRESTRequestParameter.GetDisplayName: string;
begin
  Result := FName;
end;

function TRESTRequestParameter.KindIsStored: Boolean;
begin
  Result := Kind <> DefaulTRESTRequestParameterKind;
end;

procedure TRESTRequestParameter.SetContentType(const AValue: TRESTContentType);
begin
  if FContentType <> AValue then
  begin
    FContentType := AValue;
    Changed(False);
  end;
end;

procedure TRESTRequestParameter.SetKind(const AValue: TRESTRequestParameterKind);
begin
  if FKind <> AValue then
  begin
    FKind := AValue;
    Changed(False);
  end;
end;

procedure TRESTRequestParameter.SetName(const AValue: string);
begin
  if FName <> AValue then
  begin
    FName := AValue;
    Changed(False);
    NotifyParameterChanged(False);
  end;
end;

procedure TRESTRequestParameter.SetOptions(const AValue: TRESTRequestParameterOptions);
begin
  if FOptions <> AValue then
  begin
    FOptions := AValue;
    Changed(False);
  end;
end;

procedure TRESTRequestParameter.SetValue(const AValue: string);
begin
  if FValue <> AValue then
  begin
    FValue := AValue;
    Changed(False);
    NotifyParameterChanged(True);
  end;
end;

procedure TRESTRequestParameter.SetStream(const AValue: TStream;
  AOwnership: TRESTObjectOwnership);
begin
  if FStream <> AValue then
  begin
    ReleaseStream;
    if AOwnership = ooCopy then
    begin
      FStream := TMemoryStream.Create;
      try
        FStream.CopyFrom(AValue, 0);
      except
        FreeAndNil(FStream);
        raise;
      end;
    end
    else
      FStream := AValue;
    FStreamOwner := AOwnership in [ooCopy, ooREST];
    Changed(False);
    NotifyParameterChanged(True);
  end;
end;

function TRESTRequestParameter.GetBytes: TBytes;
begin
  if (Stream <> nil) and (Stream is TBytesStream) then
    Result := TBytesStream(Stream).Bytes
  else
    Result := nil;
end;

function TRESTRequestParameter.AddValue(const AValue: string): TRESTRequestParameter;
var
  LValue: string;
begin
  if Options * [poFlatArray, poPHPArray, poListArray] = [] then
    Options := Options + [poFlatArray];
  LValue := Value;
  if LValue <> '' then
    LValue := LValue + ';';
  LValue := LValue + AValue;
  Value := LValue;
  Result := Self;
end;

function TRESTRequestParameter.ToString: string;
var
  LEncode: string;
  LValue: string;
begin
  if poDoNotEncode in FOptions then
    LEncode := ''
  else
    LEncode := ' / E';
  if Stream <> nil then
    LValue := '(stream)'
  else
    LValue := FValue;
  Result := Format('[%s%s] %s=%s',
    [RESTRequestParameterKindToString(FKind), LEncode, FName, LValue])
end;

{ TRESTRequestParameterList }

constructor TRESTRequestParameterList.Create(const AOwner: TComponent);
begin
  inherited Create(AOwner, TRESTRequestParameter);
end;

procedure TRESTRequestParameterList.CreateGetParamsFromUrl(const AUrlPath: string);
var
  LParams: TStrings;
  i: Integer;
  LParam: TRESTRequestParameter;
  LName: string;
  LPHPArray: Boolean;
begin
  LParams := nil;
  BeginUpdate;
  try
    ExtractGetParams(AUrlPath, LParams);
    for i := 0 to LParams.Count - 1 do
    begin
      LName := LParams.Names[i];
      LPHPArray := LName.EndsWith('[]');
      if LPHPArray then
        LName := LName.Substring(0, LName.Length - 2);

      LParam := ParameterByName(LName);
      if LParam <> nil then
        LParam.AddValue(LParams.ValueFromIndex[i])
      else
      begin
        LParam := AddItem;
        LParam.Kind := TRESTRequestParameterKind.pkGETorPOST;
        LParam.Name := LName;
        LParam.Value := LParams.ValueFromIndex[i];
        if LPHPArray then
          LParam.Options := LParam.Options + [poPHPArray];
      end;
    end;
  finally
    EndUpdate;
    LParams.Free;
  end;
end;

procedure TRESTRequestParameterList.Delete(const AParam: TRESTRequestParameter);
var
  i: Integer;
begin
  i := IndexOf(AParam);
  if i <> -1 then
    Delete(i);
end;

procedure TRESTRequestParameterList.Delete(const AName: string);
begin
  Delete(ParameterByName(AName));
end;

function TRESTRequestParameterList.CreateURLSegmentsFromString(const AUrlPath: string): Boolean;
var
  LNewParams: TStringList;
  LName: string;
  LParam: TRESTRequestParameter;
  i: Integer;
begin
  Result := False;
  LNewParams := nil;
  BeginUpdate;
  try
    LNewParams := TStringList.Create;
    ExtractURLSegmentNames(AUrlPath, LNewParams);

    // first, delete unmatched parameters - parameters that
    // were defined here in the collection but are not
    // part of the new url-string any more
    for i := Count - 1 downto 0 do
    begin
      LParam := Items[i];
      // we only process autocreated params of type url-segment
      if (LParam.Kind = TRESTRequestParameterKind.pkURLSEGMENT) and
         (TRESTRequestParameterOption.poAutoCreated in LParam.Options) then
      begin
        if LNewParams.IndexOf(LParam.Name) < 0 then
        begin
          Delete(LParam);
          // return True to indicate changes made
          Result := True;
        end;
      end;
    end;

    // now add new parameters but without overriding existing
    // params in case of naming-conflicts
    for LName in LNewParams do
      if (LName <> '') and not ContainsParameter(LName) then
      begin
        LParam := AddItem;
        LParam.Name := LName;
        LParam.Kind := TRESTRequestParameterKind.pkURLSEGMENT;
        LParam.Options := LParam.Options + [TRESTRequestParameterOption.poAutoCreated];
        // return True to indicate changes made
        Result := True;
      end;
  finally
    EndUpdate;
    LNewParams.Free;
  end;
end;

function TRESTRequestParameterList.GetAttr(AIndex: Integer): string;
begin
  case AIndex of
    0:
      Result := sParameterName;
    1:
      Result := sParameterValue;
    2:
      Result := sParameterKind;
  else
    Result := ''; { do not localize }
  end;
end;

function TRESTRequestParameterList.GetAttrCount: Integer;
begin
  Result := 3;
end;

function TRESTRequestParameterList.GetEnumerator: TEnumerator;
begin
  Result := TEnumerator.Create(Self);
end;

function TRESTRequestParameterList.GetItem(AIndex: Integer): TRESTRequestParameter;
begin
  Result := TRESTRequestParameter(inherited Items[AIndex]);
end;

function TRESTRequestParameterList.GetItemAttr(AIndex, AItemIndex: Integer): string;
begin
  case AIndex of
    0:
      begin
        Result := Items[AItemIndex].Name;
        if Result = '' then
          Result := IntToStr(AItemIndex);
      end;
    1:
      Result := Items[AItemIndex].Value;
    2:
      Result := System.TypInfo.GetEnumName(TypeInfo(TRESTRequestParameterKind),
                                           Integer(Items[AItemIndex].Kind));
  else
    Result := '';
  end;
end;

function TRESTRequestParameterList.IndexOf(const AName: string): Integer;
var
  i: Integer;
  LName: string;
begin
  Result := -1;
  if AName = '' then
    Exit;

  LName := AName.ToLower;
  for i := 0 to Count - 1 do
    if Items[i].Name.ToLower = LName then
      Exit(i);
end;

function TRESTRequestParameterList.IndexOf(const AParam: TRESTRequestParameter): Integer;
var
  i: Integer;
begin
  Result := -1;
  if AParam = nil then
    Exit;

  for i := 0 to Count - 1 do
    if Items[i] = AParam then
      Exit(i);
end;

function TRESTRequestParameterList.AddCookie(const AName, AValue: string): TRESTRequestParameter;
begin
  Result := AddItem(AName, AValue, TRESTRequestParameterKind.pkCOOKIE);
end;

function TRESTRequestParameterList.AddHeader(const AName, AValue: string): TRESTRequestParameter;
begin
  Result := AddItem(AName, AValue, TRESTRequestParameterKind.pkHTTPHEADER);
end;

function TRESTRequestParameterList.AddItem: TRESTRequestParameter;
begin
  Result := Add as TRESTRequestParameter;
end;

procedure TRESTRequestParameterList.AddObject(AObject: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
begin
  LContext := TRttiContext.Create;
  LType := LContext.GetType(AObject.ClassType);
  for LProperty in LType.GetProperties do
    if LProperty.Visibility in [TMemberVisibility.mvPublic, TMemberVisibility.mvPublished] then
      AddItem(LProperty.Name, LProperty.GetValue(AObject).ToString);
end;

procedure TRESTRequestParameterList.AddObject(AObject: TObject; WhiteList: TStrings);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
begin
  LContext := TRttiContext.Create;
  LType := LContext.GetType(AObject.ClassType);
  for LProperty in LType.GetProperties do
    if LProperty.Visibility in [TMemberVisibility.mvPublic, TMemberVisibility.mvPublished] then
      if WhiteList.IndexOf(LProperty.Name) >= 0 then
        AddItem(LProperty.Name, LProperty.GetValue(AObject).ToString);
end;

function TRESTRequestParameterList.AddItem(const AName, AValue: string): TRESTRequestParameter;
begin
  Result := AddItem(AName, AValue, TRESTRequestParameterKind.pkGETorPOST);
end;

function TRESTRequestParameterList.AddItem(const AName, AValue: string; AKind: TRESTRequestParameterKind;
  AOptions: TRESTRequestParameterOptions): TRESTRequestParameter;
begin
  Result := AddItem(AName, AValue, AKind, AOptions, DefaultRESTContentType);
end;

function TRESTRequestParameterList.AddItem(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions; AContentType: TRESTContentType): TRESTRequestParameter;
var
  i: Integer;
begin
  BeginUpdate;
  try
    i := IndexOf(AName);
    if i = -1 then
      Result := AddItem
    else
      Result := Items[i];
    Result.Name := AName;
    Result.Value := AValue;
    Result.Kind := AKind;
    Result.Options := AOptions;
    Result.ContentType := AContentType;
  finally
    EndUpdate;
  end;
end;

function TRESTRequestParameterList.AddItem(const AName: string; const AValue: TBytes; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions; AContentType: TRESTContentType): TRESTRequestParameter;
var
  i: Integer;
begin
  BeginUpdate;
  try
    i := IndexOf(AName);
    if i = -1 then
      Result := AddItem
    else
      Result := Items[i];
    Result.Name := AName;
    Result.SetStream(TBytesStream.Create(AValue), ooREST);
    Result.Kind := AKind;
    Result.Options := AOptions;
    Result.ContentType := AContentType;
  finally
    EndUpdate;
  end;
end;

function TRESTRequestParameterList.AddItem(const AName: string; const AValue: TStream; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions; AContentType: TRESTContentType; AOwnsStream: TRESTObjectOwnership): TRESTRequestParameter;
var
  i: Integer;
begin
  BeginUpdate;
  try
    i := IndexOf(AName);
    if i = -1 then
      Result := AddItem
    else
      Result := Items[i];
    Result.Name := AName;
    Result.SetStream(AValue, AOwnsStream);
    Result.Kind := AKind;
    Result.Options := AOptions;
    Result.ContentType := AContentType;
  finally
    EndUpdate;
  end;
end;

procedure TRESTRequestParameterList.AddUrlSegment(const AName, AValue: string);
begin
  AddItem(AName, AValue, TRESTRequestParameterKind.pkURLSEGMENT);
end;

function TRESTRequestParameterList.ParameterByIndex(AIndex: Integer): TRESTRequestParameter;
begin
  Result := Items[AIndex];
end;

function TRESTRequestParameterList.ParameterByName(const AName: string): TRESTRequestParameter;
var
  i: Integer;
begin
  i := IndexOf(AName);
  if i <> -1 then
    Result := Items[i]
  else
    Result := nil;
end;

procedure TRESTRequestParameterList.SetItem(AIndex: Integer; const AValue: TRESTRequestParameter);
begin
  inherited SetItem(AIndex, TCollectionItem(AValue));
end;

procedure TRESTRequestParameterList.Update(AItem: TCollectionItem);
var
  LNotify: IRESTRequestParameterListOwnerNotify;
begin
  inherited;
  // Entire list changed
  if (Owner <> nil) and (AItem = nil) then
    if Supports(Owner, IRESTRequestParameterListOwnerNotify, LNotify) then
      LNotify.ParameterListChanged;
end;

function TRESTRequestParameterList.ContainsParameter(const AName: string): Boolean;
begin
  Result := IndexOf(AName) >= 0;
end;

{ TRESTRequestParameterList.TEnumerator }

function TRESTRequestParameterList.TEnumerator.GetCurrent: TRESTRequestParameter;
begin
  Result := TRESTRequestParameter(inherited GetCurrent);
end;

{ TRESTExecutionThread }

constructor TRESTExecutionThread.Create(AExecuteMethod: TExecuteMethod; ARequest: TCustomRESTRequest;
  ACompletionHandler: TCompletionHandler; ASynchronized: Boolean; AFreeThread: Boolean = True;
  ACompletionHandlerWithError: TCompletionHandlerWithError = nil);
begin
  inherited Create(False);
  FreeOnTerminate := AFreeThread;
  FCompletionHandler := ACompletionHandler;
  FExecuteMethod := AExecuteMethod;
  FSynchronized := ASynchronized;
  FRequest := ARequest;
  FCompletionHandlerWithError := ACompletionHandlerWithError;
end;

procedure TRESTExecutionThread.Execute;
begin
  try
    FExecuteMethod;
    if FSynchronized then
      Synchronize(HandleCompletion) // Just synchronize. No need to Queue
    else
      HandleCompletion;
  except
    if Assigned(FCompletionHandlerWithError) then
      try
        FExceptObject := AcquireExceptionObject;
        try
          if FSynchronized then
            Synchronize(HandleCompletionWithError)
          else
            HandleCompletionWithError;
        finally
          FExceptObject.Free;
        end;
      except
      end;
  end;
end;

procedure TRESTExecutionThread.HandleCompletion;
begin
  if Assigned(FCompletionHandler) then
    FCompletionHandler;
end;

procedure TRESTExecutionThread.HandleCompletionWithError;
begin
  if Assigned(FCompletionHandlerWithError) then
    FCompletionHandlerWithError(FExceptObject);
end;

procedure TRESTRequestParameterList.AddBody(const ABodyContent: string;
  AContentType: TRESTContentType);
var
  LGUID: TGUID;
  LGuidString: string;
  LBodyContent: string;
begin
  // A body does not have a specific name, but as names need to be unique, we are using a GUID here
  CreateGUID(LGUID);
  LGuidString := LGUID.ToString;
  LGuidString := LGuidString.Replace('{', '', [rfReplaceAll]);
  LGuidString := LGuidString.Replace('}', '', [rfReplaceAll]);
  LGuidString := LGuidString.Replace('-', '', [rfReplaceAll]);
  LGuidString := sBody + LGuidString;

  LBodyContent := ABodyContent;
  AddItem(LGUIDString, LBodyContent, TRESTRequestParameterKind.pkREQUESTBODY,
    [], AContentType);
end;

procedure TRESTRequestParameterList.AddBody(const AObject: TJsonObject;
  AOwnsObject: TRESTObjectOwnership);
var
  LBodyContent: string;
begin
  try
    LBodyContent := TJson.JsonEncode(AObject);
    AddItem(sBody, LBodyContent, TRESTRequestParameterKind.pkREQUESTBODY,
      [], TRESTContentType.ctAPPLICATION_JSON);
  finally
    if AOwnsObject = ooREST then
      AObject.Free;
  end;
end;

procedure TRESTRequestParameterList.AddBody(const ABodyContent: TStream;
  AContentType: TRESTContentType; AOwnsStream: TRESTObjectOwnership);
begin
  AddItem(sBody, ABodyContent, TRESTRequestParameterKind.pkREQUESTBODY,
    [poDoNotEncode], AContentType, AOwnsStream);
end;

procedure TRESTRequestParameterList.AddBody<T>(const AObject: T;
  AOwnsObject: TRESTObjectOwnership = ooApp);
var
  LJSONObject: TJSONObject;
begin
  LJSONObject := nil;
  try
    LJSONObject := TJson.ObjectToJsonObject(AObject);
    AddBody(LJSONObject);
  finally
    LJSONObject.Free;
    if AOwnsObject = ooREST then
      AObject.Free;
  end;
end;

{ TCustomRESTRequest }

constructor TCustomRESTRequest.Create(AOwner: TComponent);
begin
  // it is important to create the notify-list before
  // calling the inherited constructor
  FNotifyList := TNotifyList.Create;
  inherited Create(AOwner);

  // if we do get a client as owner, we just use
  // it. otherwise we look around and try to find
  // an existing client (maybe on the same form)
  if AOwner is TCustomRESTClient then
    Client := TCustomRESTClient(AOwner)
  else if RESTComponentIsDesigning(Self) then
    Client := RESTFindDefaultClient(Self);

  if AOwner is TCustomRESTResponse then
    Response := TCustomRESTResponse(AOwner)
  else if RESTComponentIsDesigning(Self) then
    Response := RESTFindDefaultResponse(Self);

  FAutoCreateParams := True;
  FParams := TRESTRequestParameterList.Create(Self);
  FTransientParams := TRESTRequestParameterList.Create(Self);
  FBody := TBody.Create;
  ResetToDefaults;
end;

function TCustomRESTRequest.CreateRequestBindSource: TSubRESTRequestBindSource;
begin
  Result := TSubRESTRequestBindSource.Create(Self);
end;

function TCustomRESTRequest.CreateBindSource: TBaseObjectBindSource;
begin
  FBindSource := CreateRequestBindSource;
  FBindSource.Name := 'BindSource'; { Do not localize }
  FBindSource.SetSubComponent(True);
  FBindSource.Request := Self;

  Result := FBindSource;
end;

destructor TCustomRESTRequest.Destroy;
begin
  FreeAndNil(FNotifyList);
  FreeAndNil(FParams);
  FreeAndNil(FTransientParams);
  FBody.Free;
  inherited Destroy;
end;

procedure TCustomRESTRequest.DoAfterExecute;
begin
  if Assigned(FOnAfterExecute) then
    FOnAfterExecute(Self);
end;

procedure TCustomRESTRequest.DoBeforeExecute;
begin
end;

procedure TCustomRESTRequest.DoApplyCookieParams(const AParamList: TRESTRequestParameterArray; const CookieURL: string);
var
  LParameter: TRESTRequestParameter;
  LName: string;
  LValue: string;
begin
  for LParameter in AParamList do
    if LParameter.Kind = TRESTRequestParameterKind.pkCOOKIE then
    begin
      if TRESTRequestParameterOption.poDoNotEncode in LParameter.Options then
      begin
        LName := LParameter.Name;
        LValue := LParameter.Value;
      end
      else
      begin
        LName := URIEncode(LParameter.Name);
        LValue := URIEncode(LParameter.Value);
      end;
      FClient.SetCookie(LName + '=' + LValue, CookieURL);
    end;
end;

procedure TCustomRESTRequest.DoApplyHeaderParams(const AParamList: TRESTRequestParameterArray);
var
  LParameter: TRESTRequestParameter;
  LValue: string;
  LName: string;
begin
  for LParameter in AParamList do
    if LParameter.Kind = TRESTRequestParameterKind.pkHTTPHEADER then
    begin
      if TRESTRequestParameterOption.poDoNotEncode in LParameter.Options then
      begin
        LName := LParameter.Name;
        LValue := LParameter.Value;
      end
      else
      begin
        LName := URIEncode(LParameter.Name);
        LValue := URIEncode(LParameter.Value);
      end;
      FClient.SetHTTPHeader(LName, LValue);
    end;
end;

procedure TCustomRESTRequest.DoApplyURLSegments(const AParamList: TRESTRequestParameterArray; var AURL: string);
var
  LParameter: TRESTRequestParameter;
  LReplace: string;
begin
  for LParameter in AParamList do
    if LParameter.Kind = TRESTRequestParameterKind.pkURLSEGMENT then
    begin
      LReplace := '{' + LParameter.Name + '}';
      // Trailing '/' needed to pass blank value
      if (LParameter.Value = '') and (AURL.Length > LReplace.Length) and
         SameText(AURL.Substring(AURL.Length - LReplace.Length), LReplace) then
        AURL := AURL + '/';
      AURL := StringReplace(AURL, LReplace, LParameter.Value, [rfReplaceAll, rfIgnoreCase]);
    end;
end;

procedure TCustomRESTRequest.DoHTTPProtocolError;
begin
  if Assigned(FOnHTTPProtocolError) then
    FOnHTTPProtocolError(Self);
end;

function TCustomRESTRequest.CreateUnionParameterList: TRESTRequestParameterArray;
var
  LList: TList<TRESTRequestParameter>;
  LParam: TRESTRequestParameter;

  procedure MergeParam(const AParam: TRESTRequestParameter; const AList: TList<TRESTRequestParameter>);
  var
    i: Integer;
  begin
    for i := 0 to AList.Count - 1 do
      if SameText(AParam.Name, AList[i].Name) then
      begin
        // an empty auto-created param will never override an other parameter
        if (poAutoCreated in AParam.Options) and (AParam.Value = '') then
          Exit;

        AList.Delete(i);
        AList.Insert(i, AParam);
        Exit;
      end;

    AList.Add(AParam);
  end;

begin
  // create the complete list of parameters for this request
  // please note that we do have four sources:
  // (1) a list of parameters belonging to the client
  // (2) a list of TRANSIENT parameters belonging to the client
  // (3) a list of parameters belonging to the request
  // (4) a list of TRANSIENT parameters belonging to the request
  //
  // --> in case of a conflict,
  // the request overrides the client with one exception:
  // params can be auto-created by the components while
  // parsing parts of the url or resource. these params
  // do not have a value by default. if the user created
  // a parameter manually and provided a value, then this
  // value is used and will not be overriden by the empty
  // auto-created param
  LList := TList<TRESTRequestParameter>.Create;
  try
    // first, the default params from the client
    if FClient <> nil then
      for LParam in FClient.Params do
        MergeParam(LParam, LList);

    // next, our own default params, overriding any existing params
    for LParam in Params do
      MergeParam(LParam, LList);

    // next, the transient params from the client, overriding any existing params
    if FClient <> nil then
      for LParam in FClient.TransientParams do
        MergeParam(LParam, LList);

    // now our own transient params, overriding any existing params
    for LParam in TransientParams do
      MergeParam(LParam, LList);

    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

procedure TCustomRESTRequest.DoPrepareRequestBody(AParamList: TRESTRequestParameterArray;
  AContentType: TRESTContentType; var ABodyStream: TStream; var ABodyStreamOwner: Boolean);
var
  LParam: TRESTRequestParameter;
  LParamString: string;
  LParamName: string;
  LParamValue: string;
  LMultipartFormData: TMultipartFormData;
  LBuffer: TBytes;
begin
  Assert(Client <> nil);

  ABodyStreamOwner := True;
  LMultipartFormData := nil;
  try

    // the goal is to embedd all relevant params into a stream
    case AContentType of
      TRESTContentType.ctAPPLICATION_X_WWW_FORM_URLENCODED:
        begin
          ABodyStream := TStringStream.Create;
        end;
      TRESTContentType.ctMULTIPART_FORM_DATA:
        begin
                                                                                               
          LMultipartFormData := TMultipartFormData.Create(False);
          FRequestContentType := LMultipartFormData.MimeTypeHeader;
          ABodyStream := LMultipartFormData.Stream;
        end;
    else
      begin
        ABodyStream := TStringStream.Create;
      end;
    end;

    for LParam in AParamList do
    begin
      if (LParam.Kind = TRESTRequestParameterKind.pkGETorPOST) and not IsQueryParam(LParam, AContentType) or
         (LParam.Kind in [TRESTRequestParameterKind.pkREQUESTBODY, TRESTRequestParameterKind.pkFile]) then
      begin
        if AContentType = TRESTContentType.ctMULTIPART_FORM_DATA then
        begin
          // Multipart
          // For multipart names of body parameters are written - in contrast to WWWForm  (see below)
          if LParam.Stream <> nil then
            LMultipartFormData.AddStream(LParam.Name, LParam.Stream, LParam.Value,
              ContentTypeToString(LParam.ContentType))
          else if LParam.Kind = TRESTRequestParameterKind.pkFile then
            LMultipartFormData.AddFile(LParam.Name, LParam.Value,
              ContentTypeToString(LParam.ContentType))
          else
            LMultipartFormData.AddField(LParam.Name, LParam.Value)
        end
        else if AContentType = TRESTContentType.ctAPPLICATION_X_WWW_FORM_URLENCODED then
        begin
          // WWWForm
          // http://www.w3.org/MarkUp/html-spec/html-spec_8.html#SEC8.2.1
          // Both Key and Value are escaped and URL encoded - by default
          if not (TRESTRequestParameterOption.poDoNotEncode in LParam.Options) then
          begin
            LParamName := URIEncode(LParam.Name);
            LParamValue := URIEncode(LParam.Value);
          end
          else
          begin
            LParamName := LParam.Name;
            LParamValue := LParam.Value;
          end;
          // If this is a body parameter, then we are interested in its value only.
          // In contrast to multipart its name is ignored that is (see above)
          if LParam.Kind = TRESTRequestParameterKind.pkREQUESTBODY then
            LParamString := LParamValue
          else
            LParamString := LParamName + '=' + LParamValue;

          // Parameters are separated using an Apmersand,
          // so if there is already something the stream, we need a separator first
          if ABodyStream.Position > 0 then
            TStringStream(ABodyStream).WriteString('&');
          TStringStream(ABodyStream).WriteString(LParamString);
        end

        else
          if LParam.Stream <> nil then
          begin
            FreeAndNil(ABodyStream);
            ABodyStream := LParam.Stream;
            ABodyStreamOwner := False;
          end
          else
          begin
            Assert(ABodyStream is TStringStream);
            if TRESTRequestParameterOption.poDoNotEncode in LParam.Options then
              TStringStream(ABodyStream).WriteString(LParam.FValue)
            else
            begin
              LBuffer := TEncoding.UTF8.GetBytes(LParam.Value);
              TStringStream(ABodyStream).WriteData(LBuffer, Length(LBuffer));
            end;
          end;
      end;
    end;
  finally
    LMultipartFormData.Free;
  end;
end;

function TCustomRESTRequest.ExecuteAsync(ACompletionHandler: TCompletionHandler = nil; ASynchronized: boolean = True;
  AFreeThread: boolean = True; ACompletionHandlerWithError: TCompletionHandlerWithError = nil): TRESTExecutionThread;
begin
  Result := TRESTExecutionThread.Create(Execute, Self, ACompletionHandler,
    ASynchronized, AFreeThread, ACompletionHandlerWithError);
end;

procedure TCustomRESTRequest.Execute;
var
  LParamsList: TRESTRequestParameterArray;
  LURL: string;
  LResponseStream: TMemoryStream;
  LContentType: TRESTContentType;
  LBodyStream: TStream;
  LBodyStreamOwner: Boolean;
  LContent: string;
  LCharSet: string;
  LParam: TRESTRequestParameter;
  LContentIsString: Boolean;
  LEncoding: TEncoding;
  LLowerContentType: string;
  LMimeKind: TMimeTypes.TKind;
  LExt: string;
begin
  FExecutionPerformance.Start;

  DoBeforeExecute;

  // If no client then raise an exception
  if FClient = nil then
    raise ERESTException.Create(sNoClientAttached);

  // If a response-object was attached to this response we will use it
  // If no response exists yet, then one is created on the fly and will be managed
  // otherwise we do create a new response-object and return a reference
  // to it.
  if FResponse = nil then
  begin
    FResponse := TCustomRESTResponse.Create(Self);
    DoResponseChanged;
  end;

  FResponse.BeginUpdate;
  try

    if FClient.Authenticator <> nil then
      FClient.Authenticator.Authenticate(Self);

    if FBody.FParams.Count > 0 then
      for LParam in FBody.FParams do
                                                                      
        if LParam.Stream <> nil then
          FParams.AddItem(LParam.FName, LParam.Stream, LParam.FKind,
            LParam.Options, LParam.ContentType, ooApp)
        else
          FParams.AddItem(LParam.FName, LParam.Value, LParam.FKind,
            LParam.Options, LParam.ContentType);

    if FBody.FJSONTextWriter <> nil then
      FBody.FJSONTextWriter.Close;

    if (FBody.FJSONStream <> nil) and (FBody.FJSONStream.Size > 0) then
      FParams.AddItem(sBody, FBody.FJSONStream, TRESTRequestParameterKind.pkREQUESTBODY,
        [], TRESTContentType.ctAPPLICATION_JSON);

    LParamsList := CreateUnionParameterList;
    LContentType := ContentType(LParamsList);
    FRequestContentType := ContentTypeToString(LContentType);

    // Build the full request URL
    LURL := GetFullURL;
    DoApplyURLSegments(LParamsList, LURL);
    // URL encoding BEFORE parameters are attached, which may bring their own encoding
    if not URLAlreadyEncoded then
      LURL := TURI.Create(LURL).Encode;
                                
    DoApplyCookieParams(LParamsList, LURL);
    FClient.HTTPClient.Request.CustomHeaders.Clear;
    DoApplyHeaderParams(LParamsList);
    DoPrepareQueryString(LParamsList, LContentType, LURL);

    // Set several default headers for handling content-types, encoding, acceptance etc.
    FClient.Accept := Accept;
    FClient.HandleRedirects := HandleRedirects;
    // We always allow cookies. Many API's just send session cookies.
    // Making that a configuration option is pointless
    FClient.AllowCookies := True;
    FClient.AcceptCharset := AcceptCharset;
    FClient.AcceptEncoding := AcceptEncoding;
    FClient.HTTPClient.ConnectTimeout := Timeout;
    FClient.HTTPClient.ReadTimeout := Timeout;

    LBodyStream := nil;
    LBodyStreamOwner := True;
    LResponseStream := nil;
    try
      if LContentType <> ctNone then
      begin
        // POST, PUT and PATCH requests typically include a body, so all relevant params
        // go into a body stream. The body stream has to consider the actual content-type
        // (wwwform vs. multipart).
        DoPrepareRequestBody(LParamsList, LContentType, LBodyStream, LBodyStreamOwner);
        FClient.ContentType := FRequestContentType;
      end;

      LResponseStream := TMemoryStream.Create;
      FExecutionPerformance.PreProcessingDone;
      try
        case Method of
          TRESTRequestMethod.rmGET:
            FClient.HTTPClient.Get(LURL, LBodyStream, LResponseStream);
          TRESTRequestMethod.rmPOST:
            FClient.HTTPClient.Post(LURL, LBodyStream, LResponseStream);
          TRESTRequestMethod.rmPUT:
            FClient.HTTPClient.Put(LURL, LBodyStream, LResponseStream);
          TRESTRequestMethod.rmDELETE:
            FClient.HTTPClient.Delete(LURL, LBodyStream, LResponseStream);
          TRESTRequestMethod.rmPATCH:
            FClient.HTTPClient.Patch(LURL, LBodyStream, LResponseStream);
        else
          raise EInvalidOperation.Create(sUnknownRequestMethod);
        end;
        FExecutionPerformance.ExecutionDone;

        LContentIsString := False;
        LEncoding := nil;
        try
          LLowerContentType := LowerCase(Client.HTTPClient.Response.ContentType);
          LCharSet := Client.HTTPClient.Response.CharSet;
          if LCharSet <> '' then
            LContentIsString := True
          else
          begin
            TMimeTypes.Default.GetTypeInfo(LLowerContentType, LExt, LMimeKind);
            // Skip if blank or 'raw'
            if (FClient.FallbackCharsetEncoding <> '') and
               not SameText(REST_NO_FALLBACK_CHARSET, FClient.FallbackCharsetEncoding) then
            begin
              // Skip some obvious binary types
              if LMimeKind <> TMimeTypes.TKind.Binary then
              begin
                LEncoding := TEncoding.GetEncoding(FClient.FallbackCharsetEncoding);
                LContentIsString := True;
              end;
            end
            else
            begin
              // Even if no fallback, handle some obvious string types
              if LMimeKind = TMimeTypes.TKind.Text then
                LContentIsString := True;
            end;
          end;
          if LContentIsString then
            LContent := FClient.HTTPClient.Response.ContentAsString(LEncoding);
        finally
          LEncoding.Free;
        end;

      except
        // any kind of server/protocol error
        on E: EHTTPProtocolException do
        begin
          FExecutionPerformance.ExecutionDone;
          // we keep measuring only for protocal errors, i.e. where
          // the server actually answered, not for other exceptions.
          LContent := E.ErrorMessage; // Full error description

          // Fill RESTResponse with actual response data - error handler might want to access it
          ProcessResponse(LURL, LResponseStream, LContent);

          if (E.ErrorCode >= 500) and Client.RaiseExceptionOn500 then
            Exception.RaiseOuterException(ERESTException.Create(E.Message));
          HandleEvent(DoHTTPProtocolError);
        end;
        // Unknown error, might even be on the client side. raise it!
        on E: Exception do
        begin
          // If Execute raises an Exception, then the developer should have look into the actual BaseException
          Exception.RaiseOuterException(ERESTException.CreateFmt(sRESTRequestFailed, [E.Message]));
        end;
      end;

      // Fill RESTResponse with actual response data
      ProcessResponse(LURL, LResponseStream, LContent);

      // Performance timers do not care about events or observers
      FExecutionPerformance.PostProcessingDone;

      // Eventhandlers AFTER Observers
      HandleEvent(DoAfterExecute);

    finally
      FClient.Disconnect;

      LResponseStream.Free;
      if LBodyStreamOwner then
        LBodyStream.Free;
    end;
  finally
    FResponse.EndUpdate;
  end;
end;

procedure TCustomRESTRequest.AddFile(const AName, AFileName: string; AContentType: TRESTContentType = TRESTContentType.ctNone);
begin
  FParams.AddItem(AName, AFileName, TRESTRequestParameterKind.pkFile, [], AContentType);
end;

procedure TCustomRESTRequest.AddFile(const AFileName: string; AContentType: TRESTContentType = TRESTContentType.ctNone);
begin
  AddFile(sFile, AFileName, AContentType);
end;

procedure TCustomRESTRequest.AddBody(const ABodyContent: string; AContentType: TRESTContentType = TRESTContentType.ctNone);
begin
  FParams.AddBody(ABodyContent, AContentType);
end;

procedure TCustomRESTRequest.AddBody<T>(AObject: T);
begin
  FParams.AddBody(AObject);
end;

function TCustomRESTRequest.AcceptIsStored: Boolean;
begin
  Result := Accept <> sRequestDefaultAccept;
end;

function TCustomRESTRequest.AcceptCharSetIsStored: Boolean;
begin
  Result := AcceptCharset <> sRequestDefaultAcceptCharset;
end;

procedure TCustomRESTRequest.AddAuthParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions);
begin
  AddParameter(AName, AValue, AKind, AOptions + [TRESTRequestParameterOption.poTransient]);
end;

procedure TCustomRESTRequest.AddBody(ABodyContent: TStream; AContentType: TRESTContentType = TRESTContentType.ctNone;
  AOwnsStream: TRESTObjectOwnership = TRESTObjectOwnership.ooCopy);
begin
  FParams.AddBody(ABodyContent, AContentType, AOwnsStream);
end;

procedure TCustomRESTRequest.AddBody(AObject: TJsonObject; AOwnsObject: TRESTObjectOwnership);
begin
  FParams.AddBody(AObject, AOwnsObject);
end;

procedure TCustomRESTRequest.AddParameter(const AName, AValue: string);
begin
  AddParameter(AName, AValue, TRESTRequestParameterKind.pkGETorPOST, []);
end;

procedure TCustomRESTRequest.AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind);
begin
  AddParameter(AName, AValue, AKind, []);
end;

procedure TCustomRESTRequest.AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions);
begin
  // decide where to put the parameter to
  if TRESTRequestParameterOption.poTransient in AOptions then
  begin
    if TransientParams.ParameterByName(AName) <> nil then
      TransientParams.Delete(AName);
    TransientParams.AddItem(AName, AValue, AKind, AOptions);
  end
  else
  begin
    if Params.ParameterByName(AName) <> nil then
      Params.Delete(AName);
    Params.AddItem(AName, AValue, AKind, AOptions);
  end;
end;

procedure TCustomRESTRequest.AddParameter(const AName: string; AJsonObject: TJSONObject; AFreeJson: Boolean = True);
begin
  try
    Params.AddItem(AName, AJsonObject.ToString, TRESTRequestParameterKind.pkGETorPOST,
      [], TRESTContentType.ctAPPLICATION_JSON);
  finally
    if AFreeJson then
      AJsonObject.Free;
  end;
end;

procedure TCustomRESTRequest.AddParameter(const AName: string;
  AJsonObject: TJSONObject; AOwnsObject: TRESTObjectOwnership {= ooREST});
begin
  AddParameter(AName, AJsonObject, AOwnsObject = ooREST);
end;

procedure TCustomRESTRequest.ClearBody;
var
  i: Integer;
begin
  for i := Params.Count - 1 downto 0 do
    if Params.Items[i].Kind = TRESTRequestParameterKind.pkREQUESTBODY then
      Params.Delete(i);
  FBody.ClearBody;
end;

function TCustomRESTRequest.IsQueryParam(const AParam: TRESTRequestParameter;
  AContentType: TRESTContentType): Boolean;
begin
  Result :=
    (AParam.Kind = TRESTRequestParameterKind.pkGETorPOST) and (
      (Method in [TRESTRequestMethod.rmGET, TRESTRequestMethod.rmDELETE]) or
      (Method in [TRESTRequestMethod.rmPOST, TRESTRequestMethod.rmPUT, TRESTRequestMethod.rmPATCH]) and
        (AContentType = TRESTContentType.ctNone)) or
    (AParam.Kind = TRESTRequestParameterKind.pkQUERY);
end;

function TCustomRESTRequest.ContentType(const AParamsArray: TRESTRequestParameterArray): TRESTContentType;
var
  LParam: TRESTRequestParameter;
  LNumBodyParams: Integer;
  LNumPostGetParams: Integer;
  LSpecificContentType: TRESTContentType;
begin
  LNumBodyParams := 0;
  LNumPostGetParams := 0;
  LSpecificContentType := ctNone;

  for LParam in AParamsArray do
  begin
    if (Method in [TRESTRequestMethod.rmGET, TRESTRequestMethod.rmDELETE]) and
       not (LParam.Kind in [TRESTRequestParameterKind.pkREQUESTBODY,
                            TRESTRequestParameterKind.pkFILE]) then
      Continue;

    if LParam.Kind = TRESTRequestParameterKind.pkFILE then
    begin
      LSpecificContentType := TRESTContentType.ctMULTIPART_FORM_DATA;
      Break;
    end;

    if LParam.ContentType <> ctNone then
      LSpecificContentType := LParam.ContentType;
    if LParam.Kind = TRESTRequestParameterKind.pkREQUESTBODY then
      Inc(LNumBodyParams)
    else if LParam.Kind = TRESTRequestParameterKind.pkGETorPOST then
      Inc(LNumPostGetParams);
  end;

  // If there is a specific ContentType set in at least one of the params, then we use that one
  if LSpecificContentType <> ctNone then
    Result := LSpecificContentType
    // "multipart" is neccessary if we have more than one
    // body-parameter or body-parameters as well as post/get-parameters
    // (wich should be quite unusual, but "multipart" is the only
    // way to go in that situation) - otherwise we just do simple
    // form-urlencoded to keep the request as small as possible
  else if LNumBodyParams > 1 then
    Result := TRESTContentType.ctMULTIPART_FORM_DATA
  else if (LNumBodyParams > 0) and (LNumPostGetParams > 0) then
    Result := TRESTContentType.ctMULTIPART_FORM_DATA
  else if not (Method in [TRESTRequestMethod.rmGET, TRESTRequestMethod.rmDELETE]) or
          (LNumBodyParams > 0) then
    Result := TRESTContentType.ctAPPLICATION_X_WWW_FORM_URLENCODED
  else
    Result := TRESTContentType.ctNone;
end;

function TCustomRESTRequest.ContentType: TRESTContentType;
begin
  Result := ContentType(CreateUnionParameterList);
end;

procedure TCustomRESTRequest.DoPrepareQueryString(const AParamList: TRESTRequestParameterArray;
  AContentType: TRESTContentType; var AURL: string);
var
  LParam: TRESTRequestParameter;
  LName: string;
  LValue: string;
  LConcat: string;

  function ExpandArray(const AValue, AListSep: string): string;
  var
    LValues: TArray<string>;
    LValue: string;
    i: Integer;
  begin
    LValues := AValue.Split([';'], TStringSplitOptions.None);
    for i := 0 to High(LValues) do
    begin
      if i > 0 then
        Result := Result + AListSep;
      LValue := LValues[i];
      if not (TRESTRequestParameterOption.poDoNotEncode in LParam.Options) then
        LValue := TNetEncoding.URL.EncodeForm(LValue);
      Result := Result + LValue;
    end;

  end;

begin
  // the goal is to embedd all relevant params into the url.
  for LParam in AParamList do
    if IsQueryParam(LParam, AContentType) then
    begin
      LName := URIEncode(LParam.Name);
      LValue := LParam.Value;

      if poFlatArray in LParam.Options then
        LValue := LName + '=' + ExpandArray(LValue, '&' + LName + '=')
      else if poPHPArray in LParam.Options then
        LValue := LName + '[]=' + ExpandArray(LValue, '&' + LName + '[]=')
      else if poListArray in LParam.Options then
        LValue := LName + '=' + ExpandArray(LValue, ',')
      else
      begin
        if not (TRESTRequestParameterOption.poDoNotEncode in LParam.Options) then
          LValue := TNetEncoding.URL.EncodeForm(LParam.Value);
        LValue := LName + '=' + LValue;
      end;

      if Pos('?', AURL) = 0 then
        LConcat := '?'
      else
        LConcat := '&';
      AURL := AURL + LConcat + LValue;
    end;
end;

function TCustomRESTRequest.GetClient: TCustomRESTClient;
begin
  Result := FClient;
end;

function TCustomRESTRequest.GetExecutionPerformance: TExecutionPerformance;
begin
  Result := FExecutionPerformance;
end;

function TCustomRESTRequest.GetFullURL: string;
var
  LFullRes: string;
begin
  if FClient <> nil then
    Result := FClient.BaseURL
  else
    Result := '';

  LFullRes := FullResource;
  if LFullRes > '' then
  begin
    if not Result.EndsWith('/') and not (
        LFullRes.StartsWith('/') or LFullRes.StartsWith('?') or LFullRes.StartsWith('#')) then
      Result := Result + '/';
    Result := Result + LFullRes;
  end;
end;

function TCustomRESTRequest.GetFullRequestURL(AIncludeParams: Boolean): string;
var
  AParamList: TRESTRequestParameterArray;
  LContentType: TRESTContentType;
begin
  Result := GetFullURL;
  AParamList := CreateUnionParameterList;
  DoApplyURLSegments(AParamList, Result);
  if AIncludeParams then
  begin
    LContentType := ContentType(AParamList);
    DoPrepareQueryString(AParamList, LContentType, Result);
  end;
end;

function TCustomRESTRequest.GetFullResource: string;
begin
  Result := Resource;
  if (Resource <> '') and (ResourceSuffix <> '') then
  begin
    if Resource.EndsWith('/') then
      Result := Resource.Substring(0, Resource.Length - 1)
    else
      Result := Resource;
    if ResourceSuffix.StartsWith('/') then
      Result := Resource + ResourceSuffix
    else
      Result := Resource + '/' + ResourceSuffix;
  end
  else if Resource <> '' then
    Result := Resource
  else if ResourceSuffix <> '' then
    Result := ResourceSuffix;
end;

procedure TCustomRESTRequest.ProcessResponse(const AURL: string; AResponseStream: TMemoryStream; const AContent: string);
var
  i: Integer;
  LResponse: TRESTHTTP.IResponse;
  LHeaders: TRESTHTTP.IHeaderList;
begin
  // transfer the received data from the http-request to the rest-response
  LResponse := FClient.HTTPClient.Response;
  LHeaders := LResponse.Headers;

  FResponse.ResetToDefaults;
  FResponse.FullRequestURI := AURL;
  FResponse.Server := LHeaders.Values['server'];
  FResponse.ContentType := LResponse.ContentType;
  FResponse.ContentEncoding := LResponse.ContentEncoding;
  FResponse.StatusCode := FClient.HTTPClient.ResponseCode;
  FResponse.StatusText := FClient.HTTPClient.ResponseText;
  for i := 0 to LHeaders.Count - 1 do
    FResponse.Headers.Add(LHeaders.Names[i] + '=' + LHeaders.Values[LHeaders.Names[i]]);
  Response.SetContent(AContent);
  Response.SetRawBytes(AResponseStream);
end;

function TCustomRESTRequest.GetMethod: TRESTRequestMethod;
begin
  Result := FMethod;
end;

function TCustomRESTRequest.GetParams: TRESTRequestParameterList;
begin
  Result := FParams;
end;

function TCustomRESTRequest.GetResource: string;
begin
  Result := FResource;
end;

function TCustomRESTRequest.GetResponse: TCustomRESTResponse;
begin
  Result := FResponse;
end;

function TCustomRESTRequest.GetTimeout: Integer;
begin
  Result := FTimeout;
end;

procedure TCustomRESTRequest.HandleEvent(AEventHandler: TMethod);
begin
  // Handle Synchronized if we are NOT already in the main thread
  // NEVER call synchronize on the MainThread - that might shift the island!
  if SynchronizedEvents and (System.MainThreadID <> TThread.CurrentThread.ThreadID) then
    TThread.Synchronize(TThread.CurrentThread, AEventHandler)
  else
    AEventHandler;
end;

procedure TCustomRESTRequest.Loaded;
begin
  inherited Loaded;
  if FullResource <> '' then
    if FAutoCreateParams then
      // Can't delete parameters when expressions are executing
      FParams.CreateURLSegmentsFromString(FullResource);
end;

function TCustomRESTRequest.MethodIsStored: Boolean;
begin
  Result := Method <> DefaultRESTRequestMethod;
end;

procedure TCustomRESTRequest.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if Operation = opRemove then
    if AComponent = FClient then
      FClient := nil
    else if AComponent = FResponse then
      FResponse := nil;
end;

procedure TCustomRESTRequest.ParameterListChanged;
begin
  if NotifyList <> nil then
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.ParameterListChanged(Self);
      end);
end;

procedure TCustomRESTRequest.ParameterValueChanged;
begin
  PropertyValueChanged;
end;

procedure TCustomRESTRequest.PropertyValueChanged;
begin
  if NotifyList <> nil then
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.PropertyValueChanged(Self);
      end);
end;

procedure TCustomRESTRequest.ResetToDefaults;
begin
  Method := DefaultRESTRequestMethod;
  Resource := '';
  ResourceSuffix := '';
  Timeout := 30000; // Some servers may be slow. Esp if they just recycled and need to start up on their first request
  Accept := sRequestDefaultAccept;
  AcceptCharset := sRequestDefaultAcceptCharset;
  HandleRedirects := True;
  FExecutionPerformance.Clear;
  FURLAlreadyEncoded := False;
  FParams.Clear;
  FTransientParams.Clear;
  FBody.ClearBody;
  if FClient <> nil then
    FClient.ContentType := '';
  if FResponse <> nil then
    FResponse.ResetToDefaults;
  // we intentionally do not reset "FAutoCreateParams"
end;

procedure TCustomRESTRequest.SetAccept(const AValue: string);
begin
  if FAccept <> AValue then
  begin
    FAccept := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetAcceptCharset(const AValue: string);
begin
  if FAcceptCharset <> AValue then
  begin
    FAcceptCharset := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetAcceptEncoding(const AValue: string);
begin
  if FAcceptEncoding <> AValue then
  begin
    FAcceptEncoding := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetAutoCreateParams(const AValue: Boolean);
begin
  if AValue <> FAutoCreateParams then
  begin
    FAutoCreateParams := AValue;
    PropertyValueChanged;

    // if this option gets activated, we can just
    // start to create some params from the resource
    if FAutoCreateParams then
      FParams.CreateURLSegmentsFromString(FullResource);
  end;
end;

procedure TCustomRESTRequest.SetClient(const AValue: TCustomRESTClient);
begin
  if AValue <> FClient then
  begin
    if FClient <> nil then
      FClient.RemoveFreeNotification(Self);

    FClient := AValue;

    if FClient <> nil then
      FClient.FreeNotification(Self);

    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetHandleRedirects(const AValue: Boolean);
begin
  if FHandleRedirects <> AValue then
  begin
    FHandleRedirects := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetMethod(const AValue: TRESTRequestMethod);
begin
  if FMethod <> AValue then
  begin
    FMethod := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetParams(const AValue: TRESTRequestParameterList);
begin
  FParams.Assign(AValue);
end;

procedure TCustomRESTRequest.SetResource(const AValue: string);
begin
  if AValue <> FResource then
  begin
    FResource := AValue;

    // resources should not begin with a slash
    // but they may end with an slash
    while StartsText('/', FResource) do
      System.Delete(FResource, 1, 1);

    if not (csLoading in ComponentState) then
    begin
      if FAutoCreateParams and not FPosting then
        // Can't delete parameters when expressions are executing
        FParams.CreateURLSegmentsFromString(FullResource);

      PropertyValueChanged;
    end;
  end;
end;

procedure TCustomRESTRequest.SetResourceSuffix(const AValue: string);
begin
  if AValue <> FResourceSuffix then
  begin
    FResourceSuffix := AValue;

    // resources should not begin with a slash
    // but they may end with an slash
    while StartsText('/', FResourceSuffix) do
      System.Delete(FResourceSuffix, 1, 1);

    if not (csLoading in ComponentState) then
    begin
      if FAutoCreateParams and not FPosting then
        // Can't delete parameters when expressions are executing
        FParams.CreateURLSegmentsFromString(FullResource);

      PropertyValueChanged;
    end;
  end;
end;

procedure TCustomRESTRequest.SetResponse(const AResponse: TCustomRESTResponse);
begin
  if AResponse <> FResponse then
  begin
    DoResponseChanging;
    if FResponse <> nil then
      FResponse.RemoveFreeNotification(Self);

    FResponse := AResponse;

    if FResponse <> nil then
      FResponse.FreeNotification(Self);
    DoResponseChanged;
  end;
end;

procedure TCustomRESTRequest.DoResponseChanging;
begin
  //
end;

procedure TCustomRESTRequest.DoResponseChanged;
begin
  //
end;

procedure TCustomRESTRequest.SetSynchronizedEvents(const AValue: Boolean);
begin
  if FSynchronizedEvents <> AValue then
  begin
    FSynchronizedEvents := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTRequest.SetTimeout(const AValue: Integer);
begin
  if AValue <> FTimeout then
  begin
    FTimeout := AValue;
    PropertyValueChanged;
  end;
end;

{ TRESTRequestAdapter }

procedure TRESTRequestAdapter.AddFields;
begin
  AddPropertyFields;
  AddParameterFields;
end;

procedure TRESTRequestAdapter.AddParameterFields;

  procedure ClearParameterFields;
  var
    i: Integer;
  begin
    for i := Fields.Count - 1 downto 0 do
      if (Fields[i] is TReadWriteField<string>) and (TReadWriteField<string>(Fields[i]).Persistent <> nil) then
        Fields.Delete(i);
  end;

  procedure MakeParameterFieldNames(const ADictionary: TDictionary<string, TRESTRequestParameter>);
  const
    sPrefix = 'Params.';
  var
    i: Integer;
    LParams: TRESTRequestParameterList;
    LParam: TRESTRequestParameter;
    LName: string;
    LIndex: Integer;
    LSuffix: string;
  begin
    Assert(ADictionary.Count = 0);
    LParams := FRequest.Params;
    for i := 0 to LParams.Count - 1 do
    begin
      LParam := LParams[i];
      if TRESTRequestParameterOption.poTransient in LParam.Options then
        // Skip authentication header, for example
        Continue;
      LName := LParam.Name;
      if LName = '' then
        LName := IntToStr(LParam.Index);
      LName := sPrefix + LName;
      LIndex := 1;
      LSuffix := '';
      while ADictionary.ContainsKey(LName + LSuffix) do
      begin
        LSuffix := IntToStr(LIndex);
        Inc(LIndex);
      end;
      ADictionary.Add(LName + LSuffix, LParam);
    end;
  end;

  procedure MakeParameterField(const AParam: TRESTRequestParameter; const AFieldName: string;
    const AGetMemberObject: IGetMemberObject);
  begin
    CreateReadWriteField<string>(AFieldName, AGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := AParam.Value;
      end,
      procedure(AValue: string)
      begin
        AParam.Value := AValue;
      end, AParam); // Parameter is member of field
  end;

var
  LDictionary: TDictionary<string, TRESTRequestParameter>;
  LPair: TPair<string, TRESTRequestParameter>;
  LGetMemberObject: IGetMemberObject;
begin
  CheckInactive;
  ClearParameterFields;
  if FRequest <> nil then
  begin
    LDictionary := TDictionary<string, TRESTRequestParameter>.Create;
    try
      MakeParameterFieldNames(LDictionary);
      LGetMemberObject := TBindSourceAdapterGetMemberObject.Create(Self);
      for LPair in LDictionary do
        MakeParameterField(LPair.Value, LPair.Key, LGetMemberObject);
    finally
      LDictionary.Free;
    end;
  end;
end;

procedure TRESTRequestAdapter.AddPropertyFields;
  procedure ClearPropertyFields;
  var
    i: Integer;
  begin
    for i := Fields.Count - 1 downto 0 do
      if not (Fields[i] is TReadWriteField<string>) or (TReadWriteField<string>(Fields[i]).Persistent = nil) then
        Fields.Delete(i);
  end;
begin
  CheckInactive;
  ClearPropertyFields;
  if FRequest <> nil then
    CreatePropertyFields;
end;

procedure TRESTRequestAdapter.CreatePropertyFields;
const
  sResource = 'Resource';
  sResourceSuffix = 'ResourceSuffix';
var
  LGetMemberObject: IGetMemberObject;
begin
  LGetMemberObject := TBindSourceAdapterGetMemberObject.Create(Self);
  CreateReadWriteField<string>(sResource, LGetMemberObject, TScopeMemberType.mtText,
    function: string
    begin
      Result := FRequest.Resource;
    end,
    procedure(AValue: string)
    begin
      FRequest.Resource := AValue;
    end);
  CreateReadWriteField<string>(sResourceSuffix, LGetMemberObject, TScopeMemberType.mtText,
    function: string
    begin
      Result := FRequest.ResourceSuffix;
    end,
    procedure(AValue: string)
    begin
      FRequest.ResourceSuffix := AValue;
    end);
end;

constructor TRESTRequestAdapter.Create(AComponent: TComponent);
begin
  inherited Create(AComponent);
  FNotify := TNotify.Create(Self);
end;

destructor TRESTRequestAdapter.Destroy;
begin
  inherited Destroy;
  if FRequest <> nil then
    if FRequest.NotifyList <> nil then
      FRequest.NotifyList.RemoveNotify(FNotify);
  FNotify.Free;
end;

function TRESTRequestAdapter.GetCanActivate: Boolean;
begin
  Result := FRequest <> nil;
end;

procedure TRESTRequestAdapter.GetMemberNames(AList: TStrings);
var
  LField: TBindSourceAdapterField;
begin
  for LField in Fields do
    if LField is TReadWriteField<string> then
      // Provide object so that LiveBindings designer can select in designer when member is clicked
      AList.AddObject(LField.MemberName, TReadWriteField<string>(LField).Persistent)
    else
      AList.Add(LField.MemberName);
end;

function TRESTRequestAdapter.GetSource: TBaseLinkingBindSource;
begin
  Result := FRequest;
end;

procedure TRESTRequestAdapter.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  // clean up component-references
  if Operation = opRemove then
    if AComponent = FRequest then
      Request := nil
end;

procedure TRESTRequestAdapter.DoChangePosting;
begin
  if FRequest <> nil then
    FRequest.FPosting := Posting;
end;

procedure TRESTRequestAdapter.ParameterListChanged;
begin
  if (FRequest <> nil) and not (csLoading in FRequest.ComponentState) then
    if Active and not Posting then
    begin
      // Force parameters to be recreated
      Active := False;
      Active := True;
    end;
end;

procedure TRESTRequestAdapter.SetRequest(const ARequest: TCustomRESTRequest);
var
  LActive: Boolean;
begin
  if FRequest <> ARequest then
  begin
    if FRequest <> nil then
    begin
      if FRequest.NotifyList <> nil then
        FRequest.NotifyList.RemoveNotify(FNotify);
      FRequest.RemoveFreeNotification(Self);
    end;
    LActive := Active;
    Active := False;
    // Assert(FRequest = nil);  // expect one-to-one request/adapter
    FRequest := ARequest;
    if FRequest <> nil then
    begin
      if FRequest.NotifyList <> nil then
        FRequest.NotifyList.AddNotify(FNotify);
      FRequest.FreeNotification(Self);
    end;
    if LActive and CanActivate then
      Active := True;
  end;
end;

{ TRESTRequestAdapter.TRequestNotify }

constructor TRESTRequestAdapter.TNotify.Create(const AAdapter: TRESTRequestAdapter);
begin
  FAdapter := AAdapter;
end;

procedure TRESTRequestAdapter.TNotify.ParameterListChanged(Sender: TObject);
begin
  if FAdapter <> nil then
    FAdapter.ParameterListChanged;
end;

procedure TRESTRequestAdapter.TNotify.PropertyValueChanged(Sender: TObject);
begin
  if FAdapter <> nil then
    FAdapter.RefreshFields;
end;

{ TCustomRESTRequest.TNotify }

procedure TCustomRESTRequest.TNotify.ParameterListChanged(Sender: TObject);
begin
  //
end;

{ TCustomRESTRequestBindSource }

function TCustomRESTRequestBindSource.CreateAdapter: TRESTComponentAdapter;
begin
  FAdapter := CreateRequestAdapter;
  Result := FAdapter;
end;

function TCustomRESTRequestBindSource.CreateRequestAdapter: TRESTRequestAdapter;
begin
  Result := TRESTRequestAdapter.Create(Self);
end;

function TCustomRESTRequestBindSource.GetRequest: TCustomRESTRequest;
begin
  Result := FAdapter.Request;
end;

procedure TCustomRESTRequestBindSource.SetRequest(const Value: TCustomRESTRequest);
begin
  FAdapter.Request := Value;
end;

{ TCustomRESTResponse }

constructor TCustomRESTResponse.Create(AOwner: TComponent);
begin
  FStatus.FResponse := Self;
  // it is important to create the notify-list before
  // calling the inherited constructor
  FNotifyList := TNotifyList.Create;
  FJSONNotifyList := TList<TNotifyEvent>.Create;
  inherited Create(AOwner);

  // if the owner is a form or a tdatamodule, we will iterate
  // through all components and see if there's a request without
  // a response. if there is, then we just assign ourself to it.
  if RESTComponentIsDesigning(Self) then
    AssignResponseToRESTRequests(Self);

  FHeaders := TStringList.Create;
  ResetToDefaults;
end;

function TCustomRESTResponse.CreateBindSource: TBaseObjectBindSource;
begin
  FBindSource := TSubRESTResponseBindSource.Create(Self);
  FBindSource.Name := 'BindSource'; { Do not localize }
  FBindSource.SetSubComponent(True);
  FBindSource.Response := Self;

  Result := FBindSource;
end;

destructor TCustomRESTResponse.Destroy;
begin
  FreeAndNil(FHeaders);
  FreeAndNil(FNotifyList);
  FreeAndNil(FJSONNotifyList);
  FreeAndNil(FJSONValue);
  FreeAndNil(FJSONTextReader);
  FreeAndNil(FJSONStreamReader);
  FreeAndNil(FJSONStream);
  inherited Destroy;
end;

function TCustomRESTResponse.GetContent: string;
begin
  Result := FContent;
end;

function TCustomRESTResponse.GetContentEncoding: string;
begin
  Result := FContentEncoding;
end;

function TCustomRESTResponse.GetContentLength: cardinal;
begin
  Result := Length(FRawBytes);
end;

function TCustomRESTResponse.GetContentType: string;
begin
  Result := FContentType;
end;

function TCustomRESTResponse.GetErrorMessage: string;
begin
  Result := FErrorMessage;
end;

function TCustomRESTResponse.GetFullRequestURI: string;
begin
  Result := FFullRequestURI;
end;

function TCustomRESTResponse.GetHeaders: TStrings;
begin
  Result := FHeaders;
end;

function TCustomRESTResponse.GetJSONValue: TJsonValue;
var
  LTemp: Boolean;
begin
  Result := nil;
  if Content <> '' then
    try
      GetJSONResponse(Result, LTemp);
    except
      // This method ignores exceptions
    end;
end;

function TCustomRESTResponse.HasJSONResponse: Boolean;
var
  LJSONValue: TJSONValue;
begin
  Result := FJSONValue <> nil;
  if not Result then
  begin
    LJSONValue := TJSONObject.ParseJSONValue(Content);
    try
      Result := LJSONValue <> nil;
    finally
      LJSONValue.Free;
    end;
  end;
end;

function TCustomRESTResponse.HasResponseContent: Boolean;
begin
  Result := ContentLength > 0;
end;

function TCustomRESTResponse.GetJSONReader: TJSONTextReader;
begin
  if FJSONTextReader = nil then
  begin
    FJSONStream := TBytesStream.Create(RawBytes);
                          
    FJSONStreamReader := TStreamReader.Create(FJSONStream);
    FJSONTextReader := TJsonTextReader.Create(FJSONStreamReader);
  end;
  Result := FJSONTextReader;
end;

procedure TCustomRESTResponse.GetJSONResponse(out AJSONValue: TJSONValue;
  out AHasOwner: Boolean);
var
  LJSONValue: TJsonValue;
  LPathValue: TJSONValue;
begin
  if FJSONValue = nil then
  begin
    if Content = '' then
      raise EJSONValueError.Create(TJSONValueError.NoContent, sResponseContentIsEmpty);
    LJSONValue := TJSONObject.ParseJSONValue(Content);
    try
      if LJSONValue = nil then
        raise EJSONValueError.Create(TJSONValueError.NoJSON, sResponseContentIsNotJSON);
      if (RootElement <> '') and (LJSONValue <> nil) then
        if LJSONValue.TryGetValue<TJSONValue>(RootElement, LPathValue) then
        begin
          LPathValue.Owned := False; // Need to decouple form parent, to avoid memleak
          LJsonValue.Free;
          LJsonValue := LPathValue;
        end
        else
          // Invalid path
          raise EJSONValueError.Create(TJSONValueError.InvalidRootElement, Format(sResponseInvalidRootElement, [RootElement]));
    except
      LJSONValue.Free;
      raise;
    end;
    FJSONValue := LJSONValue;
  end;
  AJSONValue := FJSONValue;
  AHasOwner := True;
end;

function TCustomRESTResponse.GetJSONText: string;
begin
  if JSONValue <> nil then
    Result := JSONValue.Format
  else
    Result := '';
end;

function TCustomRESTResponse.GetServer: string;
begin
  Result := FServer;
end;

function TCustomRESTResponse.GetSimpleValue(const AName: string; var AValue: string): Boolean;
var
  LJSONObj: TJSONObject;
  LJSONPair: TJSONPair;
begin
  Result := False;
  // plain text
  if SameText(ContentType, CONTENTTYPE_TEXT_HTML) or SameText(ContentType, CONTENTTYPE_TEXT_PLAIN) then
  begin
    if ContainsText(Content, AName + '=') then
    begin
      AValue := Copy(Content, Pos(AName + '=', Content) + Length(AName) + 1, Length(Content));
      if (Pos('&', AValue) > 0) then
        AValue := Copy(AValue, 1, Pos('&', AValue) - 1);
      Result := True;
    end;
  end
  // Json
  else if SameText(ContentType, CONTENTTYPE_APPLICATION_JSON) then
  begin
    LJSONObj := TJSONObject.ParseJSONValue(Content) as TJSONObject;
    if LJSONObj <> nil then
    begin
      LJSONPair := LJSONObj.Get(AName);
      if LJSONPair <> nil then
      begin
        AValue := LJSONPair.JSONValue.Value;
        Result := True;
      end;
      LJSONObj.Free; // <-- the jsonobject will also free the jsonpair!
    end;
  end;
end;

function TCustomRESTResponse.GetStatus: TStatus;
begin
  Result := FStatus;
end;

function TCustomRESTResponse.GetStatusCode: Integer;
begin
  Result := FStatusCode;
end;

function TCustomRESTResponse.GetStatusText: string;
begin
  Result := FStatusText;
end;

procedure TCustomRESTResponse.JSONValueChanged;
var
  LNotifyEvent: TNotifyEvent;
begin
  if IsUpdating then
    Include(FUpdateOptions, TUpdateOption.JSONValueChanged)
  else if (NotifyList <> nil) then
  begin
                                     
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.JSONValueChanged(Self);
      end);
    for LNotifyEvent in FJSONNotifyList do
      LNotifyEvent(Self);
  end;
end;

function TCustomRESTResponse.IsUpdating: Boolean;
begin
  Result := FUpdating > 0;
end;

procedure TCustomRESTResponse.AddJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  Assert(not FJSONNotifyList.Contains(ANotify));
  if not FJSONNotifyList.Contains(ANotify) then
    FJSONNotifyList.Add(ANotify);
end;

procedure TCustomRESTResponse.BeginUpdate;
begin
  if not IsUpdating then
    FUpdateOptions := [];

  Inc(FUpdating);
end;

procedure TCustomRESTResponse.EndUpdate;
begin
  if IsUpdating then
  begin
    Dec(FUpdating);
    if not IsUpdating then
    begin
      if TUpdateOption.PropertyValueChanged in FUpdateOptions then
        PropertyValueChanged;
      if TUpdateOption.JSONValueChanged in FUpdateOptions then
        JSONValueChanged;
      FUpdateOptions := [];
    end;
  end;
end;

procedure TCustomRESTResponse.PropertyValueChanged;
begin
  if IsUpdating then
    Include(FUpdateOptions, TUpdateOption.PropertyValueChanged)
  else if NotifyList <> nil then
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.PropertyValueChanged(Self);
      end);
end;

procedure TCustomRESTResponse.RemoveJSONChangedEvent(
  const ANotify: TNotifyEvent);
begin
  Assert(FJSONNotifyList.Contains(ANotify));
  FJSONNotifyList.Remove(ANotify);
end;

procedure TCustomRESTResponse.ResetToDefaults;
begin
  BeginUpdate;
  try
    SetLength(FRawBytes, 0);
    FContent := '';
    ContentEncoding := '';
    ContentType := '';
    ErrorMessage := '';
    FullRequestURI := '';
    Server := '';
    StatusCode := 0;
    StatusText := '';
    Headers.Clear;
    FreeAndNil(FJSONValue);
    // Content property changed
    PropertyValueChanged;
    FreeAndNil(FJSONTextReader);
    FreeAndNil(FJSONStreamReader);
    FreeAndNil(FJSONStream);
    JSONValueChanged;
  finally
    EndUpdate;
  end;
end;

procedure TCustomRESTResponse.SetContent(const AContent: string);
begin
  FContent := AContent;
  FJSONValue := nil;
  // Content property changed
  PropertyValueChanged;
  JSONValueChanged;
end;

procedure TCustomRESTResponse.SetContentEncoding(const AValue: string);
begin
  if AValue <> FContentEncoding then
  begin
    FContentEncoding := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetContentType(const AValue: string);
begin
  if AValue <> FContentType then
  begin
    FContentType := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetErrorMessage(const AValue: string);
begin
  if AValue <> FErrorMessage then
  begin
    FErrorMessage := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetFullRequestURI(const AValue: string);
begin
  if AValue <> FFullRequestURI then
  begin
    FFullRequestURI := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetRawBytes(const AStream: TStream);
begin
  SetLength(FRawBytes, AStream.Size);
  AStream.Position := 0;
  AStream.Read(FRawBytes, AStream.Size);
end;

procedure TCustomRESTResponse.SetRootElement(const AValue: string);
begin
  if FRootElement <> AValue then
  begin
    FRootElement := AValue;
    FreeAndNil(FJSONValue);

    PropertyValueChanged;
    JSONValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetServer(const AValue: string);
begin
  if AValue <> FServer then
  begin
    FServer := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetStatusCode(const AValue: Integer);
begin
  if AValue <> FStatusCode then
  begin
    FStatusCode := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTResponse.SetStatusText(const AValue: string);
begin
  if AValue <> FStatusText then
  begin
    FStatusText := AValue;
    PropertyValueChanged;
  end;
end;

{ TCustomRESTClient }

constructor TCustomRESTClient.Create(const ABaseApiURL: string);
begin
  // sometimes the order *IS* important.
  // first we do create the notifylist,
  // then we can call the inherited constructor.
  FNotifyList := TNotifyList.Create;
  inherited Create(nil);
  FHttpClient := nil;
  FParams := TRESTRequestParameterList.Create(Self);
  FTransientParams := TRESTRequestParameterList.Create(Self);
  ResetToDefaults;
  // This calls CreateHTTPClient internally
  BaseURL := ABaseApiURL;
end;

constructor TCustomRESTClient.Create(AOwner: TComponent);
begin
  // sometimes the order *IS* important.
  // first we do create the notifylist,
  // then we can call the inherited constructor.
  FNotifyList := TNotifyList.Create;
  inherited Create(AOwner);
  FHttpClient := nil;
  FParams := TRESTRequestParameterList.Create(Self);
  FTransientParams := TRESTRequestParameterList.Create(Self);
  ResetToDefaults;
  if AOwner is TCustomAuthenticator then
    Authenticator := AOwner as TCustomAuthenticator
  else if RESTComponentIsDesigning(Self) then
  begin
    Authenticator := RESTFindDefaultAuthenticator(Self);
    AssignClientToRESTRequests(Self);
  end;
end;

function TCustomRESTClient.CreateBindSource: TBaseObjectBindSource;
begin
  FBindSource := TSubRESTClientBindSource.Create(Self);
  FBindSource.Name := 'BindSource'; { Do not localize }
  FBindSource.SetSubComponent(True);
  FBindSource.Client := Self;

  Result := FBindSource;
end;

destructor TCustomRESTClient.Destroy;
begin
  FreeAndNil(FHttpClient);
  FreeAndNil(FParams);
  FreeAndNil(FTransientParams);
  FAuthenticator := nil;
  inherited Destroy;
  FreeAndNil(FNotifyList);
end;

procedure TCustomRESTClient.Disconnect;
begin
  // Do nothing
end;

procedure TCustomRESTClient.SetCookie(const ACookie, AURL: string);
begin
  HTTPClient.AddServerCookie(ACookie, AURL);
end;

procedure TCustomRESTClient.AddParameter(const AName, AValue: string);
begin
  AddParameter(AName, AValue, TRESTRequestParameterKind.pkGETorPOST, []);
end;

procedure TCustomRESTClient.AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind);
begin
  AddParameter(AName, AValue, AKind, []);
end;

procedure TCustomRESTClient.AddAuthParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions);
begin
  AddParameter(AName, AValue, AKind, AOptions + [TRESTRequestParameterOption.poTransient]);
end;

procedure TCustomRESTClient.AddParameter(const AName, AValue: string; const AKind: TRESTRequestParameterKind;
  const AOptions: TRESTRequestParameterOptions);
begin
  // decide where to put the parameter to
  if TRESTRequestParameterOption.poTransient in AOptions then
  begin
    if TransientParams.ParameterByName(AName) <> nil then
      TransientParams.Delete(AName);
    TransientParams.AddItem(AName, AValue, AKind, AOptions);
  end
  else
  begin
    if Params.ParameterByName(AName) <> nil then
      Params.Delete(AName);
    Params.AddItem(AName, AValue, AKind, AOptions);
  end;
end;

procedure TCustomRESTClient.CreateHttpClient;
begin
  FreeAndNil(FHttpClient);
  FHttpClient := TRESTHTTP.Create;
  // This is handled by default in THttpClient, but to be safe we do this here anyway
  FHttpClient.AllowCookies := True;
end;

procedure TCustomRESTClient.DoHTTPProtocolError;
begin
  if Assigned(FOnHTTPProtocolError) then
    FOnHTTPProtocolError(Self);
end;

function TCustomRESTClient.GetAccept: string;
begin
  Result := HTTPClient.Request.Accept;
end;

function TCustomRESTClient.GetAcceptCharset: string;
begin
  if HTTPClient.Request <> nil then
    Result := HTTPClient.Request.AcceptCharset
  else
    Result := '';
end;

function TCustomRESTClient.GetAcceptEncoding: string;
begin
  if HTTPClient.Request <> nil then
    Result := HTTPClient.Request.AcceptEncoding
  else
    Result := '';
end;

function TCustomRESTClient.GetAllowCookies: Boolean;
begin
  if HTTPClient.Request <> nil then
    Result := HTTPClient.AllowCookies
  else
    Result := False;
end;

function TCustomRESTClient.GetAuthenticator: TCustomAuthenticator;
begin
  Result := FAuthenticator;
end;

function TCustomRESTClient.GetBaseURL: string;
begin
  Result := FBaseURL;
end;

function TCustomRESTClient.GetContentType: string;
begin
  if HTTPClient <> nil then
    Result := HTTPClient.Request.ContentType
  else
    Result := '';
end;

function TCustomRESTClient.GetEntity<T>(const AResource: string): T;
var
  LRequest: TRESTRequest;
begin
  LRequest := TRESTRequest.Create(Self);
  try
    LRequest.Method := rmGET;
    LRequest.Resource := AResource;
    LRequest.Execute;
    Result := T(LRequest.Response.JSONValue);
  finally
    LRequest.Free;
  end;
end;

function TCustomRESTClient.GetEntityArray<T>(const AQuery: string): TArray<T>;
var
  LList: TObjectList<T>;
  i: Integer;
begin
  LList := GetEntityList<T>(AQuery);
  if LList = nil then
    Exit(nil);
  SetLength(Result, LList.Count);
  for i := 0 to LList.Count - 1 do
    Result[i] := LList[i];
end;

function TCustomRESTClient.GetEntityList<T>(const AResource: string): TObjectList<T>;
var
  LResponse: string;
  LJsonResponse: TJSONObject;
  LResponseArray: TJSONArray;
  i: Integer;
  LItem: T;
  LJSONObject: TJSONObject;
  LRequest: TRESTRequest;
begin
  Result := nil;
  LRequest := TRESTRequest.Create(Self);
  try
    LRequest.Method := rmGET;
    LRequest.Resource := AResource;
    LRequest.Execute;

    // Parse response as Json and try interpreting it as Array
    LResponseArray := LRequest.Response.JSONValue as TJSONArray;
    if LResponseArray <> nil then
    begin
      Result := TObjectList<T>.Create;
      // The array's items are supposed to be representations of class <T>
      for i := 0 to LResponseArray.Count - 1 do
      begin
        LJSONObject := LResponseArray.Items[i] as TJSONObject;
        LItem := TJson.JsonToObject<T>(LJSONObject);
        Result.Add(LItem);
      end;
    end
    else
      raise ERESTException.CreateFmt(sResponseDidNotReturnArray, [T.Classname]);

  finally
    LRequest.Free;
  end;
end;

function TCustomRESTClient.GetFallbackCharsetEncoding: string;
begin
  Result := FFallbackCharsetEncoding;
end;

function TCustomRESTClient.GetHandleRedirects: Boolean;
begin
  if HTTPClient <> nil then
    Result := HTTPClient.HandleRedirects
  else
    Result := False;
end;

function TCustomRESTClient.GetHttpClient: TRESTHTTP;
begin
  Result := FHttpClient;
end;

function TCustomRESTClient.GetOnValidateCertificate: TValidateCertificateEvent;
begin
  Result := FHttpClient.OnValidateCertificate;
end;

function TCustomRESTClient.GetParams: TRESTRequestParameterList;
begin
  Result := FParams;
end;

function TCustomRESTClient.GetProxyPassword: string;
begin
  Result := FHttpClient.ProxyParams.ProxyPassword;
end;

function TCustomRESTClient.GetProxyPort: Integer;
begin
  Result := FHttpClient.ProxyParams.ProxyPort;
end;

function TCustomRESTClient.GetProxyServer: string;
begin
  Result := FHttpClient.ProxyParams.ProxyServer;
end;

function TCustomRESTClient.GetProxyUsername: string;
begin
  Result := FHttpClient.ProxyParams.ProxyUsername;
end;

function TCustomRESTClient.GetUserAgent: string;
begin
  if HTTPClient.Request <> nil then
    Result := HTTPClient.Request.UserAgent
  else
    Result := '';
end;

procedure TCustomRESTClient.HandleEvent(AEventHandler: TMethod);
begin
  // Handle Synchronized if we are NOT already in the main thread
  // NEVER call synchronize on the MainThread - that might shift the island!
  if SynchronizedEvents and (System.MainThreadID <> TThread.CurrentThread.ThreadID) then
    TThread.Synchronize(TThread.CurrentThread, AEventHandler)
  else
    AEventHandler;
end;

function TCustomRESTClient.FallbackCharsetEncodingIsStored: Boolean;
begin
  Result := sDefaultFallbackCharSetEncoding <> FallbackCharsetEncoding;
end;

function TCustomRESTClient.PostEntity<T>(const AResource: string; AEntity: T): TJSONObject;
var
  LRequest: TRESTRequest;
begin
  LRequest := TRESTRequest.Create(Self);
  try
    LRequest.Method := rmPOST;
    LRequest.Resource := AResource;
    LRequest.AddBody(AEntity);
    LRequest.Execute;
    if LRequest.Response.JSONValue <> nil then
      Result := LRequest.Response.JSONValue as TJSONObject;
  finally
    LRequest.Free;
  end;
end;

procedure TCustomRESTClient.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;

  if Operation = opRemove then
    if AComponent = FAuthenticator then
      FAuthenticator := nil;
end;

procedure TCustomRESTClient.ParameterListChanged;
begin
  if NotifyList <> nil then
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.ParameterListChanged(Self);
      end);
end;

procedure TCustomRESTClient.ParameterValueChanged;
begin
  PropertyValueChanged;
end;

procedure TCustomRESTClient.PropertyValueChanged;
begin
  if NotifyList <> nil then
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.PropertyValueChanged(Self);
      end);
end;

procedure TCustomRESTClient.ResetToDefaults;
begin
  CreateHttpClient;
  BaseURL := '';
  ProxyServer := '';
  ProxyPort := 0;
  ProxyUsername := '';
  ProxyPassword := '';
  UserAgent := sDefaultUserAgent;
  FallbackCharsetEncoding := sDefaultFallbackCharSetEncoding;
  FSynchronizedEvents := True;
  FRaiseExceptionOn500 := True;
  FAutoCreateParams := True;
  FParams.Clear;
  FTransientParams.Clear;
end;

procedure TCustomRESTClient.SetAccept(const AValue: string);
begin
  if HTTPClient.Request.Accept <> AValue then
  begin
    HTTPClient.Request.Accept := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetAcceptCharset(const AValue: string);
begin
  if HTTPClient.Request <> nil then
    HTTPClient.Request.AcceptCharset := AValue;
end;

procedure TCustomRESTClient.SetAcceptEncoding(const AValue: string);
begin
  if HTTPClient <> nil then
    HTTPClient.Request.AcceptEncoding := AValue;
end;

procedure TCustomRESTClient.SetAllowCookies(const AValue: Boolean);
begin
  if HTTPClient <> nil then
    HTTPClient.AllowCookies := AValue;
end;

procedure TCustomRESTClient.SetAuthenticator(const AValue: TCustomAuthenticator);
begin
  if AValue <> FAuthenticator then
  begin
    if FAuthenticator <> nil then
      FAuthenticator.RemoveFreeNotification(Self);

    FAuthenticator := AValue;

    if FAuthenticator <> nil then
      FAuthenticator.FreeNotification(Self);

    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetAutoCreateParams(const AValue: Boolean);
begin
  if AValue <> FAutoCreateParams then
  begin
    FAutoCreateParams := AValue;
    PropertyValueChanged;

    // if this option gets activated, we can just
    // start to create some params from the resource
    if FAutoCreateParams then
      FParams.CreateURLSegmentsFromString(FBaseURL);
  end;
end;

procedure TCustomRESTClient.SetBaseURL(const AValue: string);
var
  LOldValue: string;
begin
  if (AValue <> FBaseURL) or (AValue = '') then
  begin
    LOldValue := FBaseURL;
    FBaseURL := TURI.FixupForREST(AValue);

    if FAutoCreateParams and not FPosting then
      // Can't delete parameters when expressions are executing
      FParams.CreateURLSegmentsFromString(FBaseURL);
    // This is handled by default in THttpClient, but to be safe we do this here anyway
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetContentType(const AValue: string);
begin
  if HTTPClient <> nil then
    HTTPClient.Request.ContentType := AValue;
end;

procedure TCustomRESTClient.SetFallbackCharsetEncoding(const AValue: string);
begin
  if AValue <> FFallbackCharsetEncoding then
  begin
    FFallbackCharsetEncoding := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetHandleRedirects(const AValue: Boolean);
begin
  if HTTPClient <> nil then
    HTTPClient.HandleRedirects := AValue;
end;

procedure TCustomRESTClient.SetHTTPHeader(const AName, AValue: string);
begin
  HTTPClient.Request.CustomHeaders.Values[AName] := AValue;
end;

procedure TCustomRESTClient.SetOnValidateCertificate(
  const Value: TValidateCertificateEvent);
begin
  FHttpClient.OnValidateCertificate := Value;
end;

procedure TCustomRESTClient.SetParams(const AValue: TRESTRequestParameterList);
begin
  FParams.Assign(AValue);
end;

procedure TCustomRESTClient.SetProxyPassword(const AValue: string);
begin
  if AValue <> FHttpClient.ProxyParams.ProxyPassword then
  begin
    FHttpClient.ProxyParams.ProxyPassword := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetProxyPort(const AValue: Integer);
begin
  if AValue <> FHttpClient.ProxyParams.ProxyPort then
  begin
    FHttpClient.ProxyParams.ProxyPort := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetProxyServer(const AValue: string);
begin
  if AValue <> FHttpClient.ProxyParams.ProxyServer then
  begin
    FHttpClient.ProxyParams.ProxyServer := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetProxyUsername(const AValue: string);
begin
  if AValue <> FHttpClient.ProxyParams.ProxyUsername then
  begin
    FHttpClient.ProxyParams.ProxyUsername := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetSynchronizedEvents(const AValue: Boolean);
begin
  if AValue <> FSynchronizedEvents then
  begin
    FSynchronizedEvents := AValue;
    PropertyValueChanged;
  end;
end;

procedure TCustomRESTClient.SetUserAgent(const AValue: string);
begin
  if HTTPClient.Request <> nil then
    if AValue <> HTTPClient.Request.UserAgent then
    begin
      HTTPClient.Request.UserAgent := AValue;
      PropertyValueChanged;
    end;
end;

function TCustomRESTClient.UserAgentIsStored: Boolean;
begin
  Result := UserAgent <> sDefaultUserAgent;
end;

function TCustomRESTClient.GetRedirectsWithGET: THTTPRedirectsWithGET;
begin
  Result := HTTPClient.RedirectsWithGET;
end;

function TCustomRESTClient.GetSecureProtocols: THTTPSecureProtocols;
begin
  Result := HTTPClient.SecureProtocols;
end;

function TCustomRESTClient.GetNeedClientCertificateEvent: TNeedClientCertificateEvent;
begin
  Result := HTTPClient.OnNeedClientCertificate;
end;

function TCustomRESTClient.GetAuthEvent: TCredentialsStorage.TCredentialAuthevent;
begin
  Result := HTTPClient.OnAuthEvent;
end;

procedure TCustomRESTClient.SetRedirectsWithGET(const AValue: THTTPRedirectsWithGET);
begin
  HTTPClient.RedirectsWithGET := AValue;
end;

procedure TCustomRESTClient.SetSecureProtocols(const AValue: THTTPSecureProtocols);
begin
  HTTPClient.SecureProtocols := AValue;
end;

procedure TCustomRESTClient.SetNeedClientCertificateEvent(const AValue: TNeedClientCertificateEvent);
begin
  HTTPClient.OnNeedClientCertificate := AValue;
end;

procedure TCustomRESTClient.SetAuthEvent(const AValue: TCredentialsStorage.TCredentialAuthevent);
begin
  HTTPClient.OnAuthEvent := AValue;
end;

{ TCustomAuthenticator }

procedure TCustomAuthenticator.Authenticate(ARequest: TCustomRESTRequest);
var
  LDone: Boolean;
begin
  LDone := False;
  if Assigned(FOnAuthenticate) then
    FOnAuthenticate(ARequest, LDone);

  if not LDone then
  begin
    Assert(Assigned(ARequest));
    DoAuthenticate(ARequest);
  end;
end;

constructor TCustomAuthenticator.Create(AOwner: TComponent);
begin
  // sometimes the order *IS* important.
  // first we do create the notifylist,
  // then we can call the inherited constructor.
  FNotifyList := TNotifyList.Create;
  inherited Create(AOwner);

  if RESTComponentIsDesigning(Self) then
    AssignAuthenticatorToRESTClients(Self);
end;

destructor TCustomAuthenticator.Destroy;
begin
  inherited Destroy;
  FreeAndNil(FNotifyList);
end;

procedure TCustomAuthenticator.PropertyValueChanged;
begin
  if NotifyList <> nil then
    NotifyList.Notify(
      procedure(ANotify: TNotify)
      begin
        ANotify.PropertyValueChanged(Self);
      end);
end;

procedure TCustomAuthenticator.ResetToDefaults;
begin
  // nothing here
  // Do NOT delete an assigned OnAuthenticate event!
end;

{ TRESTAuthenticatorAdapter }

procedure TRESTAuthenticatorAdapter<T>.SetAuthenticator(const AAuthenticator: T);
var
  LActive: Boolean;
begin
  if FAuthenticator <> AAuthenticator then
  begin
    DoAuthenticatorChanging;
    if FAuthenticator <> nil then
      FAuthenticator.RemoveFreeNotification(Self);
    LActive := Active;
    Active := False;
    FAuthenticator := AAuthenticator;
    DoAuthenticatorChanged;
    if FAuthenticator <> nil then
      FAuthenticator.FreeNotification(Self);
    if LActive and CanActivate then
      Active := True;
  end;
end;

procedure TRESTAuthenticatorAdapter<T>.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  // clean up component-references
  if Operation = opRemove then
    if AComponent = TComponent(FAuthenticator) then
      Authenticator := nil
end;

constructor TRESTAuthenticatorAdapter<T>.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FNotify := TNotify.Create(Self);
end;

destructor TRESTAuthenticatorAdapter<T>.Destroy;
begin
  FreeAndNil(FNotify);
  inherited Destroy;
end;

procedure TRESTAuthenticatorAdapter<T>.DoAuthenticatorChanged;
begin
  if Authenticator <> nil then
    if Authenticator.NotifyList <> nil then
      Authenticator.NotifyList.AddNotify(FNotify);
end;

procedure TRESTAuthenticatorAdapter<T>.DoAuthenticatorChanging;
begin
  if Authenticator <> nil then
    if Authenticator.NotifyList <> nil then
      Authenticator.NotifyList.RemoveNotify(FNotify);
end;

function TRESTAuthenticatorAdapter<T>.GetCanActivate: Boolean;
begin
  Result := FAuthenticator <> nil;
end;

function TRESTAuthenticatorAdapter<T>.GetSource: TBaseLinkingBindSource;
begin
  Result := FAuthenticator;
end;

{ TRESTAuthenticatorBindSource }

function TRESTAuthenticatorBindSource<T>.CreateAdapter: TRESTComponentAdapter;
begin
  FAdapter := CreateAdapterT;
  Result := FAdapter;
end;

function TRESTAuthenticatorBindSource<T>.CreateAdapterT: TRESTAuthenticatorAdapter<T>;
begin
  Result := TRESTAuthenticatorAdapter<T>.Create(Self);
end;

function TRESTAuthenticatorBindSource<T>.GetAuthenticator: TCustomAuthenticator;
begin
  Result := FAdapter.Authenticator;
end;

procedure TRESTAuthenticatorBindSource<T>.SetAuthenticator(const Value: TCustomAuthenticator);
begin
  FAdapter.Authenticator := T(Value);
end;

{ TCustomRESTResponseBindSource }

function TCustomRESTResponseBindSource.CreateAdapter: TRESTComponentAdapter;
begin
  FAdapter := TRESTResponseAdapter.Create(Self);
  Result := FAdapter;
end;

function TCustomRESTResponseBindSource.GetResponse: TCustomRESTResponse;
begin
  Result := FAdapter.Response;
end;

procedure TCustomRESTResponseBindSource.SetResponse(const Value: TCustomRESTResponse);
begin
  FAdapter.Response := Value;
end;

{ TRESTResponseAdapter }

procedure TRESTResponseAdapter.SetResponse(const AResponse: TCustomRESTResponse);
var
  LActive: Boolean;
begin
  if FResponse <> AResponse then
  begin
    if FResponse <> nil then
    begin
      if FResponse.NotifyList <> nil then
        FResponse.NotifyList.RemoveNotify(FNotify);
      FResponse.RemoveFreeNotification(Self);
    end;
    LActive := Active;
    Active := False;
    FResponse := AResponse;
    if FResponse <> nil then
    begin
      if FResponse.NotifyList <> nil then
        FResponse.NotifyList.AddNotify(FNotify);
      FResponse.FreeNotification(Self);
    end;
    if LActive and CanActivate then
      Active := True;
  end;
end;

procedure TRESTResponseAdapter.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  // clean up component-references
  if Operation = opRemove then
    if AComponent = FResponse then
      Response := nil
end;

constructor TRESTResponseAdapter.Create(AComponent: TComponent);
begin
  inherited Create(AComponent);
  FNotify := TNotify.Create(Self);
end;

destructor TRESTResponseAdapter.Destroy;
begin
  inherited Destroy;
  if FResponse <> nil then
    if FResponse.NotifyList <> nil then
      FResponse.NotifyList.RemoveNotify(FNotify);
  FNotify.Free;
end;

procedure TRESTResponseAdapter.AddFields;
begin
  AddPropertyFields;
end;

procedure TRESTResponseAdapter.AddPropertyFields;
const
  sContent = 'Content';
  sContentType = 'ContentType';
  sContentLength = 'ContentLength'; // Integer
  sContentEncoding = 'ContentEncoding';
  sErrorMessage = 'ErrorMessage';
  sFullRequestURI = 'FullRequestURI'; // read only
  sRootElement = 'RootElement';
  sServer = 'Server';
  sStatusCode = 'StatusCode'; // Integer
  sStatusText = 'StatusText';
  sHeaders = 'Headers';
  sJSONValue = 'JSONValue';
  sJSONText = 'JSONText';
var
  LGetMemberObject: IGetMemberObject;
begin
  CheckInactive;
  ClearFields;
  if FResponse <> nil then
  begin
    LGetMemberObject := TBindSourceAdapterGetMemberObject.Create(Self);
    CreateReadOnlyField<string>(sContent, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.Content;
      end);
    CreateReadOnlyField<string>(sContentType, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.ContentType;
      end);
    CreateReadOnlyField<Integer>(sContentLength, LGetMemberObject, TScopeMemberType.mtInteger,
      function: Integer
      begin
        Result := FResponse.ContentLength;
      end);
    CreateReadOnlyField<string>(sContentEncoding, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.ContentEncoding;
      end);
    CreateReadOnlyField<string>(sErrorMessage, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.ErrorMessage;
      end);
    CreateReadOnlyField<string>(sFullRequestURI, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.FullRequestURI;
      end);
    CreateReadWriteField<string>(sRootElement, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.RootElement;
      end,
      procedure(AValue: string)
      begin
        FResponse.RootElement := AValue;
      end);
    CreateReadOnlyField<string>(sServer, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.Server;
      end);
    CreateReadOnlyField<Integer>(sStatusCode, LGetMemberObject, TScopeMemberType.mtInteger,
      function: Integer
      begin
        Result := FResponse.StatusCode;
      end);
    CreateReadOnlyField<string>(sStatusText, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.StatusText;
      end);
    CreateReadOnlyField<TStrings>(sHeaders, LGetMemberObject, TScopeMemberType.mtMemo,
      function: TStrings
      begin
        Result := FResponse.Headers;
      end);
    CreateReadOnlyField<TJsonValue>(sJSONValue, LGetMemberObject, TScopeMemberType.mtObject,
      function: TJsonValue
      begin
        Result := FResponse.JSONValue;
      end);
    CreateReadOnlyField<string>(sJSONText, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FResponse.JSONText;
      end);
  end;
end;

function TRESTResponseAdapter.GetCanActivate: Boolean;
begin
  Result := FResponse <> nil;
end;

function TRESTResponseAdapter.GetSource: TBaseLinkingBindSource;
begin
  Result := FResponse;
end;

{ TRESTResponseAdapter.TNotify }

constructor TRESTResponseAdapter.TNotify.Create(const AAdapter: TRESTResponseAdapter);
begin
  FAdapter := AAdapter;
end;

procedure TRESTResponseAdapter.TNotify.PropertyValueChanged(Sender: TObject);
begin
  if FAdapter <> nil then
    FAdapter.RefreshFields;
end;

{ TRESTClientAdapter }

procedure TRESTClientAdapter.SetClient(const AClient: TCustomRESTClient);
var
  LActive: Boolean;
begin
  if FClient <> AClient then
  begin
    if FClient <> nil then
    begin
      if FClient.NotifyList <> nil then
        FClient.NotifyList.RemoveNotify(FNotify);
      FClient.RemoveFreeNotification(Self);
    end;
    LActive := Active;
    Active := False;
    FClient := AClient;
    if FClient <> nil then
    begin
      if FClient.NotifyList <> nil then
        FClient.NotifyList.AddNotify(FNotify);
      FClient.FreeNotification(Self);
    end;
    if LActive and CanActivate then
      Active := True;
  end;
end;

procedure TRESTClientAdapter.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  // clean up component-references
  if Operation = opRemove then
    if AComponent = FClient then
      Client := nil
end;

procedure TRESTClientAdapter.ParameterListChanged;
begin
  if (FClient <> nil) and not (csLoading in FClient.ComponentState) then
    if Active and not Posting then
    begin
      // Force parameters to be recreated
      Active := False;
      Active := True;
    end;
end;

constructor TRESTClientAdapter.Create(AComponent: TComponent);
begin
  inherited Create(AComponent);
  FNotify := TNotify.Create(Self);
end;

destructor TRESTClientAdapter.Destroy;
begin
  inherited Destroy;
  if FClient <> nil then
    if FClient.NotifyList <> nil then
      FClient.NotifyList.RemoveNotify(FNotify);
  FNotify.Free;
end;

procedure TRESTClientAdapter.DoChangePosting;
begin
  if FClient <> nil then
    FClient.FPosting := Posting;
end;

procedure TRESTClientAdapter.AddFields;
begin
  AddPropertyFields;
  AddParameterFields;
end;

procedure TRESTClientAdapter.AddParameterFields;

  procedure ClearParameterFields;
  var
    i: Integer;
  begin
    for i := Fields.Count - 1 downto 0 do
      if (Fields[i] is TReadWriteField<string>) and
         (TReadWriteField<string>(Fields[i]).Persistent <> nil) then
        Fields.Delete(i);
  end;

  procedure MakeParameterFieldNames(const ADictionary: TDictionary<string, TRESTRequestParameter>);
  const
    sPrefix = 'Params.';
  var
    i: Integer;
    LParams: TRESTRequestParameterList;
    LParam: TRESTRequestParameter;
    LName: string;
    LIndex: Integer;
    LSuffix: string;
  begin
    Assert(ADictionary.Count = 0);
    LParams := FClient.Params;
    for i := 0 to LParams.Count - 1 do
    begin
      LParam := LParams[i];
      if TRESTRequestParameterOption.poTransient in LParam.Options then
        // Skip authentication header, for example
        Continue;
      LName := LParam.Name;
      if LName = '' then
        LName := IntToStr(LParam.Index);
      LName := sPrefix + LName;
      LIndex := 1;
      LSuffix := '';
      while ADictionary.ContainsKey(LName + LSuffix) do
      begin
        LSuffix := IntToStr(LIndex);
        Inc(LIndex);
      end;
      ADictionary.Add(LName + LSuffix, LParam);
    end;
  end;

  procedure MakeParameterField(const AParam: TRESTRequestParameter; const AFieldName: string;
    const AGetMemberObject: IGetMemberObject);
  begin
    CreateReadWriteField<string>(AFieldName, AGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := AParam.Value;
      end,
      procedure(AValue: string)
      begin
        AParam.Value := AValue;
      end, AParam); // Parameter is member of field
  end;

var
  LDictionary: TDictionary<string, TRESTRequestParameter>;
  LPair: TPair<string, TRESTRequestParameter>;
  LGetMemberObject: IGetMemberObject;
begin
  CheckInactive;
  ClearParameterFields;
  if FClient <> nil then
  begin
    LDictionary := TDictionary<string, TRESTRequestParameter>.Create;
    try
      MakeParameterFieldNames(LDictionary);
      LGetMemberObject := TBindSourceAdapterGetMemberObject.Create(Self);
      for LPair in LDictionary do
        MakeParameterField(LPair.Value, LPair.Key, LGetMemberObject);
    finally
      LDictionary.Free;
    end;
  end;
end;

procedure TRESTClientAdapter.AddPropertyFields;
const
  sBaseURL = 'BaseURL';
var
  LGetMemberObject: IGetMemberObject;
begin
  CheckInactive;
  ClearFields;
  if FClient <> nil then
  begin
    LGetMemberObject := TBindSourceAdapterGetMemberObject.Create(Self);
    CreateReadWriteField<string>(sBaseURL, LGetMemberObject, TScopeMemberType.mtText,
      function: string
      begin
        Result := FClient.BaseURL;
      end,
      procedure(AValue: string)
      begin
        FClient.BaseURL := AValue;
      end);
  end;
end;

function TRESTClientAdapter.GetCanActivate: Boolean;
begin
  Result := FClient <> nil;
end;

procedure TRESTClientAdapter.GetMemberNames(AList: TStrings);
var
  LField: TBindSourceAdapterField;
begin
  for LField in Fields do
    if LField is TReadWriteField<string> then
      // Provide object so that LiveBindings designer can select in designer when member is clicked
      AList.AddObject(LField.MemberName, TReadWriteField<string>(LField).Persistent)
    else
      AList.Add(LField.MemberName);
end;

function TRESTClientAdapter.GetSource: TBaseLinkingBindSource;
begin
  Result := FClient;
end;

{ TCustomRESTClient.TNotify }

procedure TCustomRESTClient.TNotify.ParameterListChanged(Sender: TObject);
begin
  //
end;

{ TCustomRESTClientBindSource }

function TCustomRESTClientBindSource.CreateAdapter: TRESTComponentAdapter;
begin
  FAdapter := TRESTClientAdapter.Create(Self);
  Result := FAdapter;
end;

function TCustomRESTClientBindSource.GetClient: TCustomRESTClient;
begin
  Result := FAdapter.Client;
end;

procedure TCustomRESTClientBindSource.SetClient(const AValue: TCustomRESTClient);
begin
  FAdapter.Client := AValue;
end;

{ TRESTClientAdapter.TNotify }

constructor TRESTClientAdapter.TNotify.Create(const AAdapter: TRESTClientAdapter);
begin
  FAdapter := AAdapter;
end;

procedure TRESTClientAdapter.TNotify.ParameterListChanged(Sender: TObject);
begin
  if FAdapter <> nil then
    FAdapter.ParameterListChanged;
end;

procedure TRESTClientAdapter.TNotify.PropertyValueChanged(Sender: TObject);
begin
  if FAdapter <> nil then
    FAdapter.RefreshFields;
end;

{ TCustomRESTResponse.EJSONValueError }

constructor TCustomRESTResponse.EJSONValueError.Create(AError: TJSONValueError;
  const AMessage: string);
begin
  inherited Create(AMessage);
  FError := AError;
end;

{ TDownloadURL }

class procedure TDownloadURL.DownloadRawBytes(const AURL: string; const AStream: TStream);
var
  LRequest: TRESTRequest;
  LClient: TRESTClient;
  LPosition: Integer;
begin
  LClient := TRESTClient.Create(AUrl);
  try
    LRequest := TRESTRequest.Create(LClient);
    LClient.FallbackCharsetEncoding := REST_NO_FALLBACK_CHARSET;
    LRequest.SynchronizedEvents := False;
    LRequest.Execute;
    CheckForError(LRequest.Response);
    LPosition := AStream.Position;
    AStream.Write(LRequest.Response.RawBytes, 0, Length(LRequest.Response.RawBytes));
    AStream.Position := LPosition;
  finally
    LClient.Free;
  end;
end;

class procedure TDownloadURL.CheckForError(const AResponse: TCustomRESTResponse);
begin
  if AResponse.StatusCode >= 300 then
    raise ERequestError.Create(AResponse.StatusCode, AResponse.StatusText, AResponse.Content);
end;

{ TCustomRESTResponse.TStatus }

function TCustomRESTResponse.TStatus.ClientError: Boolean;
begin
  Result := (FResponse.StatusCode >= 400) and (FResponse.StatusCode < 500);
end;

function TCustomRESTResponse.TStatus.ClientErrorBadRequest_400: Boolean;
begin
  Result := FResponse.StatusCode = 400;
end;

function TCustomRESTResponse.TStatus.ClientErrorDuplicate_409: Boolean;
begin
  Result := FResponse.StatusCode = 409;
end;

function TCustomRESTResponse.TStatus.ClientErrorForbidden_403: Boolean;
begin
  Result := FResponse.StatusCode = 403;
end;

function TCustomRESTResponse.TStatus.ClientErrorNotAcceptable_406: Boolean;
begin
  Result := FResponse.StatusCode = 406;
end;

function TCustomRESTResponse.TStatus.ClientErrorNotFound_404: Boolean;
begin
  Result := FResponse.StatusCode = 404;
end;

function TCustomRESTResponse.TStatus.ClientErrorUnauthorized_401: Boolean;
begin
  Result := FResponse.StatusCode = 401;
end;

function TCustomRESTResponse.TStatus.Success: Boolean;
begin
  Result := (FResponse.StatusCode >= 200) and (FResponse.StatusCode < 300);
end;

function TCustomRESTResponse.TStatus.SuccessOK_200: Boolean;
begin
  Result := FResponse.StatusCode = 200;
end;

function TCustomRESTResponse.TStatus.SucessCreated_201: Boolean;
begin
  Result := FResponse.StatusCode = 201;
end;

{ TCustomRESTRequest.TBody }

procedure TCustomRESTRequest.TBody.Add(AObject: TJsonObject; AOwnsObject: TRESTObjectOwnership);
begin
  FParams.AddBody(AObject, AOwnsObject);
end;

procedure TCustomRESTRequest.TBody.Add(const ABodyContent: string;
  AContentType: TRESTContentType);
begin
  FParams.AddBody(ABodyContent, AContentType);
end;

procedure TCustomRESTRequest.TBody.Add(ABodyContent: TStream;
  AContentType: TRESTContentType; AOwnsStream: TRESTObjectOwnership);
begin
  FParams.AddBody(ABodyContent, AContentType, AOwnsStream);
end;

procedure TCustomRESTRequest.TBody.Add<T>(AObject: T; AOwnsObject: TRESTObjectOwnership);
begin
  FParams.AddBody(AObject, AOwnsObject);
end;

procedure TCustomRESTRequest.TBody.ClearWriter;
begin
  FreeAndNil(FJSONTextWriter);
  FreeAndNil(FJSONStream);
end;

procedure TCustomRESTRequest.TBody.ClearBody;
begin
  FParams.Clear;
  ClearWriter;
end;

constructor TCustomRESTRequest.TBody.Create;
begin
  inherited Create;
  FParams := TRESTRequestParameterList.Create(nil);
end;

destructor TCustomRESTRequest.TBody.Destroy;
begin
  FreeAndNil(FParams);
  FreeAndNil(FJSONTextWriter);
  FreeAndNil(FJSONStream);
  inherited Destroy;
end;

function TCustomRESTRequest.TBody.GetJSONWriter: TJsonTextWriter;
begin
  if FJSONTextWriter = nil then
  begin
    FJSONStream := TMemoryStream.Create;
    FJSONTextWriter := TJsonTextWriter.Create(FJSONStream);
  end;
  Result := FJSONTextWriter;
end;

end.
