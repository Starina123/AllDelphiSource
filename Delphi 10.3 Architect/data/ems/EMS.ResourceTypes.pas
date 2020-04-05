{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMS.ResourceTypes;
{$SCOPEDENUMS ON}

interface

uses
  System.Classes, System.Rtti, System.TypInfo, System.Generics.Collections, System.SysUtils,
  EMS.ResourceAPI, System.JSON.Writers, System.JSON.Builders, System.Net.Mime;

type
  TEMSResourceEndPoint = class;
  TEMSEndpointSegmentList = class;
  TEMSEndpointSegment = class;
  TAPIDocPathItem = class;
  TAPIDocParameter = class;
  TAPIDocResponse = class;
  TAPIDocPath = class;
  EndPointRequestSummaryAttribute = class;
  EndPointRequestParameterAttribute = class;
  EndPointResponseDetailsAttribute = class;
  TEMSResourceAttributes = class;

  /// <summary>
  ///  Attribute for EMS resource class
  /// </summary>
  TResourceCustomAttribute = class(TCustomAttribute);

  /// <summary>
  ///  Attribute for EMS endpoint method
  /// </summary>
  TEndpointCustomAttribute = class(TCustomAttribute)
  private
    FMethod: string;
  protected
    constructor Create(const AMethod: string); overload;
  public
    property Method: string read FMethod;
  end;

  TEMSCommonResource = class abstract(TEMSResource)
  private type
    TFindCallback = reference to procedure(const AEndPoint: TEMSResourceEndPoint; var ADone: Boolean);
    TLeafEndpoint = record
      EndpointName: string;
      Score: Integer;
    public
      constructor Create(const AEndpointName: string; AScore: Integer);
    end;
    TTreeNode = class
    private
      FMethod: TEndpointRequest.TMethod;
      FSegment: TEMSEndPointSegment;
      FChildNodes: TList<TTreeNode>;
      FLeafEndpoints: TList<TLeafEndpoint>;
      function GetChildNodes: TArray<TTreeNode>;
      function GetLeafEndpoints: TArray<TLeafEndpoint>;
    public
      constructor Create(AMethod: TEndpointRequest.TMethod;
        const ASegment: TEMSEndpointSegment);
      destructor Destroy; override;
      procedure AddChildNode(const ANode: TTreeNode);
      procedure AddTerminalEndpoint(const AEndpointName: string; AScore: Integer);
      property Method: TEndpointRequest.TMethod read FMethod;
      property Segment: TEMSEndPointSegment read FSegment;
      property ChildNodes: TArray<TTreeNode> read GetChildNodes;
      property LeafEndpoints: TArray<TLeafEndpoint> read GetLeafEndpoints;
    end;
    TNegotiator = class(TObject)
    public type
      TStatus = (Nothing, Failed, Duplicates, OK);
    private
      FContext: TEndpointContext;
      FBestEndpoints: TList<TEMSResourceEndPoint>;
      FBestWeight: Double;
      FChooseCount: Integer;
      function GetStatus: TStatus;
      function GetBestEndpoint: TEMSResourceEndPoint;
      function GetDuplicateNames: string;
    public
      constructor Create(AContext: TEndpointContext);
      destructor Destroy; override;
      procedure Reset;
      procedure Choose(AEndpoint: TEMSResourceEndPoint; AScore: Integer);
      property Status: TStatus read GetStatus;
      property BestEndpoint: TEMSResourceEndPoint read GetBestEndpoint;
      property BestWeight: Double read FBestWeight;
      property DuplicateNames: string read GetDuplicateNames;
    end;
  private
    FEndpoints: TList<TEMSResourceEndPoint>;
    FEndpointsDict: TDictionary<string, TEMSResourceEndPoint>;
    FBaseURL: string;
    FResourceName: string;
  private
    FBaseURLSegmentCount: Integer;
    FRootNode: TTreeNode;
    function EnumEndPoints(const ACallback: TFindCallback): Boolean;
    function FindEndPoint(const AName: string): TEMSResourceEndPoint;
    procedure BuildTree;
    procedure SearchTree(const AContext: TEndpointContext;
      ARequestSegmentIndex: Integer; const ATreeNode: TTreeNode;
      const ATerminalNodes: TList<TTreeNode>); overload;
    procedure SearchTree(const AContext: TEndpointContext;
      out ATerminalNodes: TArray<TTreeNode>); overload;
  protected
    procedure DoHandleRequest(const AContext: TEndpointContext); override;
    function DoCanHandleRequest(const AContext: TEndpointContext;
      out AEndpointName: string): Boolean; override;
    function GetName: string; override;
    function GetEndpointNames: TArray<string>; override;
  public
    constructor Create(const AResourceName: string);
    destructor Destroy; override;
    property BaseURLSegmentCount: Integer read FBaseURLSegmentCount;
    function IsBaseURL(const ABaseURL: string): Boolean; override;
  end;

  TEMSResourceEndPoint = class abstract
  private
    FRoot: TEMSCommonResource;
    function GetFullName: string;
  protected
    function GetName: string; virtual; abstract;
    procedure SetName(const AName: string); virtual; abstract;
    procedure DoAuthorizeRequest(const AContext: TEndpointContext); virtual;
    procedure DoHandleRequest(const AContext: TEndpointContext); virtual; abstract;
    /// <summary>Get the URL segment parameters declared for an endpoint</summary>
    function GetSegmentParameters: TEMSEndPointSegmentList; virtual; abstract;
    /// <summary>Get the method of an endpoint, such as GET or POST</summary>
    function GetMethod: TEndpointRequest.TMethod; virtual; abstract;
    function GetProduceList: TAcceptValueList; virtual; abstract;
    function GetConsumeList: TAcceptValueList; virtual; abstract;
  public
    constructor Create(const AOwner: TEMSCommonResource);
    destructor Destroy; override;
    property Name: string read GetName;
    property FullName: string read GetFullName;
    /// <summary>Get the URL segment parameters declared for an endpoint</summary>
    property SegmentParameters: TEMSEndPointSegmentList read GetSegmentParameters;
    /// <summary>Get the method of an endpoint, such as GET or POST</summary>
    property Method: TEndpointRequest.TMethod read GetMethod;
    property ProduceList: TAcceptValueList read GetProduceList;
    property ConsumeList: TAcceptValueList read GetConsumeList;
  end;

  TEMSEndPointSegmentList = class
  private
    FList: TList<TEMSEndPointSegment>;
    function GetCount: Integer;
    function GetItem(I: Integer): TEMSEndPointSegment;
  public
    constructor Create;
    destructor Destroy; override;
    function GetEnumerator: TEnumerator<TEMSEndPointSegment>;
    property Items[I: Integer]: TEMSEndPointSegment read GetItem;
    property Count: Integer read GetCount;
  end;

  TEMSEndPointSegment = class
  private
    [weak] FOwner: TEMSEndPointSegmentList;
  public
    constructor Create(const AOwner: TEMSEndPointSegmentList);
    destructor Destroy; override;
  end;

  TEMSEndPointSegmentParameter = class(TEMSEndPointSegment)
  private
    FName: string;
  public
    constructor Create(const AOwner: TEMSEndPointSegmentList; const AName: string);
    property Name: string read FName;
  end;

  TEMSResourceEndPointSuffix = class(TEMSResourceEndPoint)
  private type
    TSegmentParamCallback = TProc<TEMSEndPointSegmentParameter, string>;
  public type
    THandlerProc = reference to procedure(const Sender: TObject; const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  private
    FURLSuffix: string;
    FName: string;
    FMethod: TEndpointRequest.TMethod;
    FHandlerProc: THandlerProc;
    FSegmentParameters: TEMSEndPointSegmentList;
    FProduceList: TAcceptValueList;
    FConsumeList: TAcceptValueList;
    function ScanSegmentParameters(const AContext: TEndpointContext;
      const ACallback: TSegmentParamCallback): Boolean;
  protected
    function GetSegmentParameters: TEMSEndPointSegmentList; override;
    function GetMethod: TEndpointRequest.TMethod; override;
    function GetProduceList: TAcceptValueList; override;
    function GetConsumeList: TAcceptValueList; override;
    function GetName: string; override;
    procedure SetName(const AName: string); override;
    procedure DoAuthorizeRequest(const AContext: TEndpointContext); override;
    procedure DoHandleRequest(const AContext: TEndpointContext); override;
  public
    constructor Create(const AOwner: TEMSCommonResource; const AName, AURLSuffix: string;
      const AMethod: TEndpointRequest.TMethod; const AProduce, AConsume: string;
      const AHandlerProc: THandlerProc);
    destructor Destroy; override;
  end;

  TEMSEndPointSegmentSlash = class(TEMSEndPointSegment)
  end;

  /// <summary>Represents a URL segment that matches any combination of URL
  /// segments.</summary>
  TEMSEndPointSegmentWildCard = class(TEMSEndPointSegment)
  end;

  TEMSEndPointSegmentConstant = class(TEMSEndPointSegment)
  private
    FValue: string;
  public
    constructor Create(const AOwner: TEMSEndPointSegmentList; const AValue: string);
    property Value: string read FValue;
  end;

  TEMSEndPointSegmentService = class
  public
    class procedure ExtractSegments(const AString: string; const AList: TEMSEndPointSegmentList); static;
    class function CountSegments(const AString: string): Integer; static;
  end;

  TEMSBasicResource = class(TEMSCommonResource)
  end;

  ResourceSuffixAttribute = class(TEndpointCustomAttribute)
  private
    FSuffix: string;
  public
    constructor Create(const AMethod, ASuffix: string); overload;
    constructor Create(const ASuffix: string); overload;
    property Suffix: String read FSuffix;
  end;

  ResourceNameAttribute = class(TResourceCustomAttribute)
  private
    FName: string;
  public
    constructor Create(AName: string);
    property Name: String read FName;
  end;

  EndpointNameAttribute = class(TEndpointCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const AMethod, AName: string); overload;
    constructor Create(const AName: string); overload;
    property Name: String read FName;
  end;

  TResourceStringsTable = class
  private
    class var FResourcesTable : TDictionary<string, string>;
  public
    class constructor Create;
    class destructor Destroy;
    class procedure Add(const Akey, AResource: string); static;
    class function Get(const Akey: string): string; static;
  end;

  TAPIDoc = class
  public const
    cBlank = ' ';
    cEmptySchema = '{}';
    cStar = '*';
    cWildCard = 'wildcard';
  public type
    TAPIDocContactInfo = record
    private
      FName: string;
      FURL: string;
      FEmail: string;
    public
      constructor Create (const AName, AURL, AEmail: string);
      property Name: string read FName;
      property URL: string read FURL;
      property Email: string read FEmail;
    end;

    TAPIDocLicenseInfo = record
    private
      FName: string;
      FURL: string;
    public
      constructor Create (const AName, AURL: string);
      property Name: string read FName;
      property URL: string read FURL;
    end;

    TAPIDocInfo = record
    private
      FVersion: string;
      FTitle: string;
      FDescription: string;
      FTermsOfUse: string;
      FContact:TAPIDocContactInfo;
      FLicense: TAPIDocLicenseInfo;
    public
      constructor Create(const AVersion, ATitle, ADescription: string);
      property Version: string read FVersion;
      property Title: string read FTitle;
      property Description: string read FDescription;
      property TermsOfUse: string read FTermsOfUse write FTermsOfUse;
      property Contact: TAPIDocContactInfo read FContact write FContact;
      property License: TAPIDocLicenseInfo read FLicense write FLicense;
    end;
    /// <summary>
    /// Primitive data types in the Swagger Specification are based on the types supported by the JSON-Schema Draft 4.
    /// http://json-schema.org/latest/json-schema-core.html#anchor8
    /// An additional primitive data type "file" is used by the Parameter Object and the Response Object
    /// to set the parameter type or the response as being a file.
    /// </summary>
    TPrimitiveType = (spArray, spBoolean, spInteger, spNumber, spNull, spObject, spString, spFile);
    /// <summary>
    /// Primitives have an optional modifier property format.
    /// </summary>
    TPrimitiveFormat = (None, Int32, Int64, Float, Double, Byte, Date, DateTime, Password);
    /// <summary>
    /// The transfer protocol of the API. Values MUST be from the list: "http", "https", "ws", "wss".
    /// If the schemes is not included, the default scheme to be used is the one used to access the Swagger definition itself.
    /// </summary>
    TTransferProtocol = (Http, Https, Ws, Wss);

  private
    FSwaggerVersion: string;
    FInfo: TAPIDocInfo;
    FPaths: TList<TAPIDocPath>;
    FHost: string;
    FBasePath: string;
    FDefinitions: string;
    function GetPaths: TArray<TAPIDocPath>;
    procedure WriteJsonDefinitions(const ADefinitions: string; const AJSONWriter: TJSONWriter);
  public
    constructor Create(const AHost, ABasePath: string);
    destructor Destroy; override;
    function GetAPIDocYaml: string;
    procedure WriteAPIDocJson(const AWriter: TJsonTextWriter);
    function AddPath(const AAPIDocPath:TAPIDocPath): Boolean;
    procedure SortPaths;
//TO-DO
//securityDefinitions:
//definitions:
//    class function WriteAPIDoc: TStringList;
    property Paths: TArray<TAPIDocPath> read GetPaths;
    property Definitions: string read FDefinitions write FDefinitions;
    class function GetDataTypeAsString(AType: TAPIDoc.TPrimitiveFormat): string; overload;
    class function GetDataTypeAsString(AType: TAPIDoc.TPrimitiveType): string; overload;
    class function ReplaceStar(AItem: string; IsPath: Boolean = False): string;
  end;

  TAPIDocPath =  class
  private
    FPath: string;
    FResourceName: string;
    FPathItems: TObjectList<TAPIDocPathItem>;
    function GetPathItems: TArray<TAPIDocPathItem>;
    function GetPathInfo: TArray<string>;
    procedure WritePathInfo(const ABuilder: TJSONObjectBuilder);
    function GetPath: string;
  public
    constructor Create(const APath, AResourceName: string);
    destructor Destroy; override;
    function AddPathItem(const AAPIDocPathItem: TAPIDocPathItem): Boolean;
    property PathItems: TArray<TAPIDocPathItem> read GetPathItems;
    property Path: string read GetPath;
  end;

  TAPIDocPathItem = class
  const
    ApplicationId = 'X-Embarcadero-Application-Id';
    AppSecret = 'X-Embarcadero-App-Secret';
    MasterSecret = 'X-Embarcadero-Master-Secret';
  private
    FVerb: TEndpointRequest.TMethod;
    FTags: string;
    FSummary: string;
    FDescription: string;
    FOperationId: string;
    FProduces: string;
    FConsumes: string;
    FParameters: TArray<TAPIDocParameter>;
    FResponses: TArray<TAPIDocResponse>;
    function GetAuthoritationHeaderParams: TArray<string>;
    procedure WriteAuthoritationHeaderParams(const ABuilder: TJSONObjectBuilder);
  public
    constructor Create(AHTTPMethod: TEndpointRequest.TMethod; const AOperationID: string;
      const AAttribute: EndPointRequestSummaryAttribute; const AAPIDocResponses: TArray<TAPIDocResponse>;
      const AAPIDocParameters: TArray<TAPIDocParameter>);
    destructor Destroy; override;
    function GetMethodInfo: TArray<string>;
    procedure WriteMethodInfo(const ABuilder: TJSONObjectBuilder);
  end;

  TAPIDocParameter = class
  public type
    TParameterIn = (Path, Query, Header, Body, formData);
  private
    FName: string;
    FIn: TParameterIn;
    FDescription: string;
    FRequired: Boolean;
    FIsReference: Boolean;

    FType: TAPIDoc.TPrimitiveType;
    FItemType: TAPIDoc.TPrimitiveType;
    FFormat: TAPIDoc.TPrimitiveFormat;
    FSchema: string;
    FReference: string;
    function GetParamAsString: string;
    function GetName: string;
  public
    constructor Create(const AAttribute: EndPointRequestParameterAttribute);
    function GetParamInfo: TArray<string>;
    procedure WriteParamInfo(const ABuilder: TJSONObjectBuilder);
    property Name: string read GetName;
  end;

                                                                         
  TAPIDocParameterHelper = class helper for TAPIDocParameter
  public
    procedure Assign(ASource: TAPIDocParameter);
  end;

  TAPIDocResponse = class
    FCode: integer;
    FDescription: string;
    FSchema: string;
    FIsReference: Boolean;
    FReference: string;
    FType: TAPIDoc.TPrimitiveType;
    FFormat: TAPIDoc.TPrimitiveFormat;
    FExamples: string;
    FRef: string;
  public
    constructor Create(const AAttribute: EndPointResponseDetailsAttribute);
    function GetResponseInfo: TArray<string>;
    procedure WriteResponseInfo(const ABuilder: TJSONObjectBuilder);
  end;

                                                                         
  TAPIDocResponseHelper = class helper for TAPIDocResponse
  public
    procedure Assign(ASource: TAPIDocResponse);
  end;

  /// <summary>
  ///  Attribute for EMS resource class method
  ///  Description of a method
  /// </summary>
  EndPointRequestSummaryAttribute = class(TEndpointCustomAttribute)
  private
    FTags: string;
    FSummary: string;
    FDescription: string;
//    FOperationId: String;
    FProduces: string;
    FConsume: string;
  public
    /// <summary>
    ///  Attribute for EMS resource class method
    ///  Description of a method
    /// </summary>
    /// <param name="AMethod">
    ///  An endpoint publisher class method
    /// </param>
    /// <param name="ATags">
    ///  Define a Tag
    /// </param>
    /// <param name="ASummary">
    ///   A Method Title
    /// </param>
    /// <param name="ADescription">
    ///  A Method Description
    /// </param>
    /// <param name="AProduces">
    ///  A MIME type the APIs can produce. This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types.
    /// </param>
    /// <param name="AConsume">
    ///  A MIME type the APIs can consume. This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types
    /// </param>
    constructor Create(const AMethod, ATags, ASummary, ADescription, AProduces, AConsume: string); overload;
    constructor Create(const ATags, ASummary, ADescription, AProduces, AConsume: string); overload;
                                                                        
                                                                               
    property Tags: string read FTags;
    property Summary: string read FSummary;
    property Description: string read FDescription;
//    property OperationId: String read FOperationId;
    property Produces: string read FProduces;
    property Consume: string read FConsume;
  end;

  /// <summary>
  ///  Attribute for EMS resource class metod
  ///  Description of the parameters used in a request
  /// </summary>
  EndPointRequestParameterAttribute = class(TEndpointCustomAttribute)
  private
    FName: string;
    FIn: TAPIDocParameter.TParameterIn;
    FDescription: string;
    FRequired: Boolean;
    FJSONSchema: string;
    FReference: string;
    FType: TAPIDoc.TPrimitiveType;
    FItemType: TAPIDoc.TPrimitiveType;
    FFormat: TAPIDoc.TPrimitiveFormat;
  public
    /// <summary>
    ///  Attribute for EMS resource class metod
    ///  Description of the parameters used in a request
    ///  A unique parameter is defined by a combination of a name and location.
    ///  There are five possible parameter types. <c>'Path</c>', <c>'Query</c>', <c>'Header</c>', <c>'Body</c>', <c>'Form</c>'
    /// </summary>
    /// <param name="AMethod">
    ///  An endpoint publisher class method
    /// </param>
    /// <param name="AIn">
    ///  The location of the parameter: <c>'Path</c>', <c>'Query</c>', <c>'Header</c>', <c>'Body</c>', <c>'Form</c>'
    /// </param>
    /// <param name="AName">
    ///  The name of the parameter. Parameter names are case sensitive. if param inBody name MUST be <c>'body</c>'
    ///  If in is "path", the name field MUST correspond to the associated path segment from the path field in the Paths Object.
    ///  For all other cases, the name corresponds to the parameter name used based on the in property
    /// </param>
    /// <param name="ADescription">
    ///  A brief description of the parameter. This could contain examples of use. GFM syntax can be used for rich text representation.
    /// </param>
    /// <param name="ARequired">
    ///  Determines whether this parameter is mandatory. If the parameter is in "path", this property is required and its value MUST be true.
    ///  Otherwise, the property MAY be included and its default value is false.
    /// </param>
    /// <param name="AType">
    ///  The type of the parameter.
    ///  Other Value than Body: the value MUST be one of <c>'spArray'</c>, <c>'spBoolean'</c>, <c>'spInteger'</c>, <c>'spNumber'</c>, <c>'spNull'</c>, <c>'spObject'</c>, <c>'spString'</c>, <c>'spFile'</c>.
    ///  If type is "file", the consumes MUST be either "multipart/form-data" or " application/x-www-form-urlencoded" and the parameter MUST be in "formData".
    ///  In Body: JSONSchema or Reference required.
    /// </param>
    /// <param name="AFormat">
    ///  The extending format for the previously mentioned Type, <c>'None'</c>, <c>'Int32'</c>, <c>'Int64'</c>, <c>'Float'</c>, <c>'Double'</c>, <c>'Byte'</c>, <c>'Date'</c>, <c>'DateTime'</c>, <c>'Password'</c>.
    /// </param>
    /// <param name="AItemType">
    ///  Required if type is <c>"array"</c>. Describes the type of items in the array.
    /// </param>
    /// <param name="AJSONScheme">
    ///  The Schema of the Primitive sent to the server. A definition of the body request structure.
    ///  If Type is Array or Object a Schema can be defined
    ///  For example:
    ///   - in JSON format {"type": "object","additionalProperties": {"type": "string"}}
    ///   - in YAML format
    ///      type: object
    ///       additionalProperties:
    ///        type: string
    /// </param>
    /// <param name="AReference">
    ///  The Schema Definition of the Primitive sent to the server. A definition of the body request structure.
    ///  If Type is Array or Object a Schema Definitions can be defined
    ///  For example: '#/definitions/pet'
    /// </param>
    constructor Create(const AMethod: string; AIn: TAPIDocParameter.TParameterIn;
      const AName, ADescription: string; const ARequired: boolean;
      AType: TAPIDoc.TPrimitiveType; AFormat: TAPIDoc.TPrimitiveFormat;
      AItemType: TAPIDoc.TPrimitiveType; const AJSONScheme, AReference: string); overload;
    constructor Create(AIn: TAPIDocParameter.TParameterIn;
      const AName, ADescription: string; const ARequired: boolean;
      AType: TAPIDoc.TPrimitiveType; AFormat: TAPIDoc.TPrimitiveFormat;
      AItemType: TAPIDoc.TPrimitiveType; const AJSONScheme, AReference: string); overload;
    property Name: string read FName;
    property ParamIn: TAPIDocParameter.TParameterIn read FIn;
    property Description: string read FDescription;
    property Required: Boolean read FRequired;
    property ParamType: TAPIDoc.TPrimitiveType read FType;
    property ItemType: TAPIDoc.TPrimitiveType read FItemType;
    property ItemFormat: TAPIDoc.TPrimitiveFormat read FFormat;
    property JSONSchema: string read FJSONSchema;
    property Reference: string read FReference;
  end;

  /// <summary>
  ///  Attribute for EMS resource class methos
  ///  Description of the request responses
  /// </summary>
  EndPointResponseDetailsAttribute = class(TEndpointCustomAttribute)
  private
    FCode: Integer;
    FDescription: string;
    FSchema: string;
    FType: TAPIDoc.TPrimitiveType;
    FFormat: TAPIDoc.TPrimitiveFormat;
    FReference: string;
  public
    /// <summary>
    ///  Response Detail Attribute
    ///  Description of the request response
    /// </summary>
    /// <param name="AMethod">
    ///  An endpoint publisher class method
    /// </param>
    /// <param name="ACode">
    ///  The Response Code
    /// </param>
    /// <param name="ADescription">
    ///  Description of the response code
    /// </param>
    /// <param name="AType">
    ///  The Type of the Primitive returned.
    ///  Primitive data types in the Swagger Specification are based on the types supported by the JSON-Schema Draft 4.
    ///  http://json-schema.org/latest/json-schema-core.html#anchor8
    ///  An additional primitive data type "file" is used by the Parameter Object and the Response Object
    ///  to set the parameter type or the response as being a file.
    ///  For example: <c>'spArray'</c>, <c>'spBoolean'</c>, <c>'spInteger'</c>, <c>'spNumber'</c>, <c>'spNull'</c>, <c>'spObject'</c>, <c>'spString'</c>, <c>'spFile'</c>.
    /// </param>
    /// <param name="AFormat">
    ///  The Format of the Primitive returned
    ///  For example: <c>'None'</c>, <c>'Int32'</c>, <c>'Int64'</c>, <c>'Float'</c>, <c>'Double'</c>, <c>'Byte'</c>, <c>'Date'</c>, <c>'DateTime'</c>, <c>'Password'</c>.
    /// </param>
    /// <param name="ASchema">
    ///  The Schema of the Primitive returned. A definition of the response structure.
    ///  If Type is Array or Object a Schema can be defined
    ///  For example:
    ///   - in JSON format {"type": "object","additionalProperties": {"type": "string"}}
    ///   - in YAML format
    ///      type: object
    ///       additionalProperties:
    ///        type: string
    /// </param>
    /// <param name="AReference">
    ///  The Schema Definition of the Primitive returned. A definition of the response structure.
    ///  If Type is Array or Object a Schema Definitions can be defined
    ///  For example: '#/definitions/pet'
    /// </param>
    constructor Create(const AMethod: string; ACode: Integer; const ADescription: string; AType: TAPIDoc.TPrimitiveType; AFormat: TAPIDoc.TPrimitiveFormat; const ASchema, AReference: string); overload;
    constructor Create(ACode: Integer; const ADescription: string; AType: TAPIDoc.TPrimitiveType; AFormat: TAPIDoc.TPrimitiveFormat; const ASchema, AReference: string); overload;
    property Code: Integer read FCode;
    property Description: string read FDescription;
    property Schema: string read FSchema;
    property Reference: string read FReference;
    property PrimitiveType: TAPIDoc.TPrimitiveType read FType;
    property PrimitiveFormat: TAPIDoc.TPrimitiveFormat read FFormat;
  end;

  /// <summary>
  ///  Attribute for EMS resource class
  ///  Definition of Objects for the API YAML version
  /// </summary>
  EndPointObjectsYAMLDefinitionsAttribute = class(TResourceCustomAttribute)
  private
    FObjects: string;
  public
    constructor Create(const Objects: string);
    property Objects: string read FObjects;
  end;

  /// <summary>
  ///  Attribute for EMS resource class
  ///  Definition of Objects for the API JSON version
  /// </summary>
  EndPointObjectsJSONDefinitionsAttribute = class(TResourceCustomAttribute)
  private
    FObjects: string;
  public
    constructor Create(const Objects: string);
    property Objects: string read FObjects;
  end;

  /// <summary>
  ///  Attribute for EMS resource class
  ///  Specifies that endpoints and resources are skipped by validating Tenant during authorization.
  /// </summary>
  AllowAnonymousTenantAttribute = class(TEndpointCustomAttribute)
  public
    constructor Create(const AMethod: string); overload;
    constructor Create; overload;
  end;

  EndPointProduceAttribute = class(TEndpointCustomAttribute)
  private
    FTypes: string;
  public
    constructor Create(const AMethod: string; const ATypes: string); overload;
    constructor Create(const ATypes: string); overload;
    property Types: string read FTypes;
  end;

  EndPointConsumeAttribute = class(EndPointProduceAttribute);

  EndPointMethodAttribute = class(TEndpointCustomAttribute)
  private
    FHTTPMethod: TEndpointRequest.TMethod;
  public
    constructor Create(const AMethod: string; const AHTTPMethod: TEndpointRequest.TMethod); overload;
    constructor Create(const AHTTPMethod: TEndpointRequest.TMethod); overload;
    property HTTPMethod: TEndpointRequest.TMethod read FHTTPMethod;
  end;

  TTenantAuthorization = (Default, Full, SkipAll);

  TEMSTypeInfoResource = class(TEMSCommonResource)
  private type
    TConstructorKind = (Simple, Component);
    TResourceMethod = record
    public type
      TSignatureKind = (Unknown, Standard);
    private
      FRttiField: TRTTIField;
      FRttiMethod: TRTTIMethod;
      FHTTPMethod: TEndpointRequest.TMethod;
      FName: string;
      FURLSuffix: string;
      FRttiParameters: TArray<TRTTIParameter>;
      FRttiReturnType: TRTTIType;
      FSignatureKind: TSignatureKind;
      FPathItem: TAPIDocPathItem;
      FTenantAuthorization: TTenantAuthorization;
      FProduce: string;
      FConsume: string;
    public
      property Name: string read FName;
      property TenantAuthorization: TTenantAuthorization read FTenantAuthorization;
      constructor Create(const AName: string; const ARttiField: TRTTIField; const ARttiMethod: TRTTIMethod;  AHTTPMethod: TEndpointRequest.TMethod;
        const ABaseURLSuffix: string; const APathItem: TAPIDocPathItem = nil; ATenantAuthorization: TTenantAuthorization = TTenantAuthorization.Full;
        const AProduce: string = ''; const AConsume: string = '');
    end;
  private
    FRttiContext: TRttiContext; // Hold references
    FRttiConstructor: TRTTIMethod;
    FConstructorKind: TConstructorKind;
    FRttiType: TRTTIType;
    FMethodList: TList<TResourceMethod>;
    FAttributes: TEMSResourceAttributes;
    FAPIDocPaths: TObjectList<TAPIDocPath>;
    FYAMLDefinitions: string;
    FJSONDefinitions: string;
    FTenantAuthorization: TTenantAuthorization;
    procedure InternalScanResource(ARttiObj: TRttiNamedObject;
      out AResourceName: string; out ATenantAuthorization: TTenantAuthorization);
    procedure ScanResource(out AResourceName: string);
    procedure ScanConstructor;
    procedure InternalScanMethods(const ARTTIField: TRTTIField;
      const AFieldAttributes: TEMSResourceAttributes; const ARTTIMethods: TArray<TRTTIMethod>);
    procedure ScanMethods;
    procedure ScanFields;
    procedure ScanObjectsDefinitions(const AResourceName: string);
    function CreateInstance: TObject;
    procedure CreateEndPoints;
    function GetAPIDocPaths: TArray<TAPIDocPath>;
    function GetMethodTenantAuthorization(const AMethod: string): TTenantAuthorization;
  public
    constructor Create(const ATypeInfo: PTypeInfo); overload;
    constructor Create(const ATypeInfo: PTypeInfo; const AAttributes: TEMSResourceAttributes); overload;
    destructor Destroy; override;
    property YAMLDefinitions: string read FYAMLDefinitions;
    property JSONDefinitions: string read FJSONDefinitions;
    property APIDocPaths: TArray<TAPIDocPath> read GetAPIDocPaths;
    property TenantAuthorization: TTenantAuthorization read FTenantAuthorization;
    property MethodTenantAuthorization[const AMethod: string]: TTenantAuthorization read GetMethodTenantAuthorization;
  end;

  TEMSResourceAttributes = class
  private
    FResourceName: string;
    FEndpointName: TDictionary<string, string>;
    FResourceSuffix: TDictionary<string, string>;
    FResponseDetails: TObjectDictionary<string, TList<TAPIDocResponse>>;
    FRequestSummary: TObjectDictionary<string, EndPointRequestSummaryAttribute>;
    FRequestParameters: TObjectDictionary<string, TList<TAPIDocParameter>>;
    FYAMLDefinitions: TDictionary<string, string>;
    FJSONDefinitions: TDictionary<string, string>;
    FResourceTenantAuthorizations: TDictionary<string, TTenantAuthorization>;
    FEndPointTenantAuthorizations: TDictionary<string, TTenantAuthorization>;
    FEndPointProduce: TDictionary<string, string>;
    FEndPointConsume: TDictionary<string, string>;
    FEndPointHTTPMethod: TDictionary<string, TEndpointRequest.TMethod>;
    function GetEndPointName(const AMethod: string): string; overload;
    function GetResourceSuffix(const AMethod: string): string; overload;
    function GetResponseDetails(const AMethod: string): TArray<TAPIDocResponse>;
    function GetRequestSummary(const AMethod: string): EndPointRequestSummaryAttribute;
    function GetRequestParameters(const AMethod: string): TArray<TAPIDocParameter>;
    function GetYAMLDefinitions(const AResourceName: string): string;
    function GetJSONDefinitions(const AResourceName: string): string;
    procedure SetEndPointName(const AMethod, Value: string);
    procedure SetResourceSuffix(const AMethod, Value: string);
    procedure SetRequestSummary(const AMethod: string; ARequestSummaryAttribute: EndPointRequestSummaryAttribute);
    procedure SetYAMLDefinitions(const AResourceName, Value: string);
    procedure SetJSONDefinitions(const AResourceName, Value: string);
    function GetEndPointTenantAuthorization(const AMethod: string): TTenantAuthorization;
    function GetResourceTenantAuthorization(const AResourceName: string): TTenantAuthorization;
    procedure SetEndPointTenantAuthorization(const AMethod: string; const Value: TTenantAuthorization);
    procedure SetResourceTenantAuthorization(const AResourceName: string; const Value: TTenantAuthorization);
    function GetEndPointProduce(const AMethod: string): string;
    procedure SetEndPointProduce(const AMethod, AValue: string);
    function GetEndPointConsume(const AMethod: string): string;
    procedure SetEndPointConsume(const AMethod, AValue: string);
    function GetEndPointHTTPMethod(const AMethod: string): TEndpointRequest.TMethod;
    procedure SetEndPointHTTPMethod(const AMethod: string; const AValue: TEndpointRequest.TMethod);
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadFromRtti(AMember: TRttiMember);
    procedure Clear;
    procedure AddResponseDetail(const AMethod: string; const AResponseDetailAttribute: EndPointResponseDetailsAttribute);
    procedure AddRequestParameter(const AMethod: string; const ARequestParameterAttribute: EndPointRequestParameterAttribute);

    property ResourceName: string read FResourceName write FResourceName;
    property ResourceTenantAuthorization[const AResourceName: string]: TTenantAuthorization read GetResourceTenantAuthorization write SetResourceTenantAuthorization;
    property YAMLDefinitions[const AResourceName: string]: string read GetYAMLDefinitions write SetYAMLDefinitions;
    property JSONDefinitions[const AResourceName: string]: string read GetJSONDefinitions write SetJSONDefinitions;

    property EndPointName[const AMethod: string]: string read GetEndPointName write SetEndPointName;
    property ResourceSuffix[const AMethod: string]: string read GetResourceSuffix write SetResourceSuffix;
    property EndPointProduce[const AMethod: string]: string read GetEndPointProduce write SetEndPointProduce;
    property EndPointConsume[const AMethod: string]: string read GetEndPointConsume write SetEndPointConsume;
    property EndPointHTTPMethod[const AMethod: string]: TEndpointRequest.TMethod read GetEndPointHTTPMethod write SetEndPointHTTPMethod;
    property EndPointTenantAuthorization[const AMethod: string]: TTenantAuthorization read GetEndPointTenantAuthorization write SetEndPointTenantAuthorization;
    property ResponseDetails[const AMethod: string]: TArray<TAPIDocResponse> read GetResponseDetails;
    property RequestSummary[const AMethod: string]: EndPointRequestSummaryAttribute read GetRequestSummary write SetRequestSummary;
    property RequestParameters[const AMethod: string]: TArray<TAPIDocParameter> read GetRequestParameters;
  end;

procedure RegisterResource(const TypeInfo: PTypeInfo); overload;
procedure RegisterResource(const TypeInfo: PTypeInfo; const AAttributes: TEMSResourceAttributes); overload;

implementation

uses EMS.Services, EMS.Consts, System.JSON, System.JSON.Readers,
{$IFDEF MACOS}
  Macapi.CoreFoundation,
{$ENDIF}
  System.Generics.Defaults, System.Variants, System.NetConsts;

const
                                                                              
  TAPIDocPathItemTenantId = 'X-Embarcadero-Tenant-Id';
  TAPIDocPathItemTenantSecret = 'X-Embarcadero-Tenant-Secret';

                                    
                                                       
                                   
function LogResource(const AResource: TEMSResource; AJSON: TJSONObject): Boolean;
const
  CMethodNames: array[TEndpointRequest.TMethod] of string =
    ('Get', 'Put', 'Post', 'Delete', 'Patch', 'Other');
var
  LArray: TJSONArray;
  LEndpoint: TEMSResourceEndPoint;
  LObject: TJSONObject;
  LParam: TEMSEndPointSegment;
  LPath: string;
  LRes: TEMSTypeInfoResource;
  S: string;
begin
  Result := AResource is TEMSTypeInfoResource;
  if not Result then
    Exit;
  LRes := TEMSTypeInfoResource(AResource);
  AJSON.AddPair('name', LRes.Name);
  LArray := TJSONArray.Create;
  for LEndpoint in LRes.FEndpoints do
  begin
    LObject := TJSONObject.Create;
    LObject.AddPair('name', LEndpoint.Name);
    LObject.AddPair('method', CMethodNames[LEndpoint.Method]);
    LPath := LRes.FBaseURL;
    for LParam in LEndpoint.SegmentParameters do
    begin
      if not LPath.EndsWith('/') then
        LPath := LPath + '/';
      if LParam is TEMSEndPointSegmentConstant then
        LPath := LPath + TEMSEndPointSegmentConstant(LParam).Value
      else if LParam is TEMSEndPointSegmentParameter then
        LPath := LPath + '{' + TEMSEndPointSegmentParameter(LParam).Name + '}';
    end;
    LObject.AddPair('path', LPath);
                                                          
                                                      
    if (LEndpoint.ProduceList <> nil) and (LEndpoint.ProduceList.Count > 0) then
    begin
      S := '';
      S := LEndpoint.ProduceList.ToString;
      LObject.AddPair('produce', S);
    end;
    if (LEndpoint.ConsumeList <> nil) and (LEndpoint.ConsumeList.Count > 0) then
    begin
      S := '';
      S := LEndpoint.ConsumeList.ToString;
      LObject.AddPair('consume', S);
    end;
    LArray.Add(LObject);
  end;
  AJSON.AddPair('endpoints', LArray);
end;

procedure RegisterResource(const TypeInfo: PTypeInfo); overload;
var
  LResource: TEMSTypeInfoResource;
begin
  LResource := TEMSTypeInfoResource.Create(TypeInfo);
  try
    TEMSEndpointManager.Instance.RegisterResource(LResource)
  except
    LResource.Free;
    raise;
  end;
end;

procedure RegisterResource(const TypeInfo: PTypeInfo; const AAttributes: TEMSResourceAttributes); overload;
var
  LResource: TEMSTypeInfoResource;
begin
  LResource := TEMSTypeInfoResource.Create(TypeInfo, AAttributes);
  try
    TEMSEndpointManager.Instance.RegisterResource(LResource)
  except
    LResource.Free;
    raise;
  end;
end;

{ TEndpointCustomAttribute }

constructor TEndpointCustomAttribute.Create(const AMethod: string);
begin
  inherited Create;
  FMethod := AMethod;
end;

{ TEMSCommonResource }

constructor TEMSCommonResource.Create(const AResourceName: string);
begin
  FResourceName := AResourceName;
  FBaseURL := AResourceName.ToLower;
  FEndPoints := TObjectList<TEMSResourceEndPoint>.Create;
  FEndpointsDict := TDictionary<string, TEMSResourceEndPoint>.Create;
  FBaseURLSegmentCount := TEMSEndPointSegmentService.CountSegments(FBaseURL);
  FRootNode := TTreeNode.Create(TEndpointRequest.TMethod.Other, nil);
end;

destructor TEMSCommonResource.Destroy;
begin
  FRootNode.Free;
  FEndPoints.Free;
  FEndpointsDict.Free;
  inherited;
end;

function TEMSCommonResource.EnumEndPoints(const ACallback: TFindCallback): Boolean;
var
  LEndPoint: TEMSResourceEndPoint;
begin
  Result := False;
  for LEndpoint in FEndpoints do
  begin
    ACallback(LEndpoint, Result);
    if Result then
      Break;
  end;
end;

function TEMSCommonResource.FindEndPoint(const AName: string): TEMSResourceEndPoint;
begin
  Result := FEndpointsDict.Items[AName];
end;

function TEMSCommonResource.GetEndpointNames: TArray<string>;
var
  LList: TList<string>;
begin
  LList := TList<string>.Create;
  try
    EnumEndPoints(
      procedure(const AEndPoint: TEMSResourceEndPoint; var ADone: Boolean)
      begin
        LList.Add(AEndpoint.Name)
      end);
    Result := LList.ToArray;
  finally
    LList.Free;
  end;
end;

function TEMSCommonResource.GetName: string;
begin
  Result := FResourceName;
end;

function TEMSCommonResource.IsBaseURL(const ABaseURL: string): Boolean;
begin
  Result := SameText(ABaseURL, '/' + FBaseURL) or ABaseURL.ToLower.StartsWith('/' + FBaseURL + '/');
end;

{ TEMSResourceEndPoint }

procedure TEMSResourceEndPoint.DoAuthorizeRequest(const AContext: TEndpointContext);
begin
// Do nothing
end;

function TEMSResourceEndPoint.GetFullName: string;
begin
  if FRoot <> nil then
    Result := FRoot.Name + '.' + Name
end;

constructor TEMSResourceEndPoint.Create(const AOwner: TEMSCommonResource);
begin
  FRoot := AOwner;
  FRoot.FEndpoints.Add(Self);
end;

destructor TEMSResourceEndPoint.Destroy;
begin
  Assert((FRoot.FEndpoints = nil) or not FRoot.FEndpoints.Contains(Self));
  inherited;
end;

{ TEMSResourceEndPointSuffix }

procedure TEMSResourceEndPointSuffix.DoAuthorizeRequest(const AContext: TEndpointContext);

  procedure ValidateTenantAuthorization(TenantAuthorization: TTenantAuthorization);
  begin
    if (AContext.Tenant = nil) and (TenantAuthorization = TTenantAuthorization.Full) then
      EEMSHTTPError.RaiseUnauthorized(sInvalidTenant);
  end;

  function GetResultTenantAuthorization(ResourceTenantAuth, MethodTenantAuth: TTenantAuthorization): TTenantAuthorization;
  begin
    case ResourceTenantAuth of
      TTenantAuthorization.Default,
      TTenantAuthorization.Full:
        Result := MethodTenantAuth;
    else
      {TTenantAuthorization.SkipAll:}
      Result := TTenantAuthorization.SkipAll;
    end;
  end;

var
  LACL: TEMSEndpointAuthorization.TACL;
  LAuthorize: Boolean;
  LResourceInfo: TEMSTypeInfoResource;
begin
  if FRoot is TEMSTypeInfoResource then
  begin
    LResourceInfo := TEMSTypeInfoResource(FRoot);
    ValidateTenantAuthorization(GetResultTenantAuthorization(
      LResourceInfo.TenantAuthorization, LResourceInfo.MethodTenantAuthorization[Name]));
  end;
  LAuthorize := TEMSEndpointAuthorization.Instance.FindACL(FullName, LACL);
  if not LAuthorize then
    LAuthorize := TEMSEndpointAuthorization.Instance.FindACL(FRoot.Name, LACL);
  if LAuthorize then
    TEMSEndpointAuthorization.Instance.Authorize(AContext, LACL);
end;

constructor TEMSResourceEndPointSuffix.Create(const AOwner: TEMSCommonResource;
  const AName, AURLSuffix: string; const AMethod: TEndpointRequest.TMethod;
  const AProduce, AConsume: string; const AHandlerProc: THandlerProc);
begin
  inherited Create(AOwner);
  FSegmentParameters := TEMSEndPointSegmentList.Create;
  SetName(AName);
  FURLSuffix := AURLSuffix;
  FMethod := AMethod;
  if AProduce <> '' then
    FProduceList := TAcceptValueList.Create(AProduce);
  if AConsume <> '' then
    FConsumeList := TAcceptValueList.Create(AConsume);
  FHandlerProc := AHandlerProc;
  TEMSEndPointSegmentService.ExtractSegments(FURLSuffix, FSegmentParameters);
end;

destructor TEMSResourceEndPointSuffix.Destroy;
begin
  FSegmentParameters.Free;
  FProduceList.Free;
  FConsumeList.Free;
  inherited;
end;

function TEMSResourceEndPointSuffix.ScanSegmentParameters(
  const AContext: TEndpointContext; const ACallback: TSegmentParamCallback): Boolean;
var
  LRequestSegmentIndex: Integer;
  LSegmentParameter: TEMSEndPointSegment;
  LSegmentParameterIndex: Integer;
  LValue: string;
begin
  Result := True;
  LSegmentParameterIndex := 0;
  LRequestSegmentIndex := FRoot.BaseURLSegmentCount;

  while LRequestSegmentIndex < AContext.Request.Segments.Count do
  begin
    Assert(LSegmentParameterIndex < FSegmentParameters.Count);
    if LSegmentParameterIndex < FSegmentParameters.Count then
    begin
      LSegmentParameter := FSegmentParameters.Items[LSegmentParameterIndex];
      if LSegmentParameter is TEMSEndPointSegmentParameter then
      begin
        if Assigned(ACallback) then
          if TEMSEndPointSegmentParameter(LSegmentParameter).Name = '*' then
          begin
            LValue := '';
            while LRequestSegmentIndex < AContext.Request.Segments.Count do
            begin
              LValue := LValue + AContext.Request.Segments[LRequestSegmentIndex];
              Inc(LRequestSegmentIndex);
            end;
            ACallback(TEMSEndPointSegmentParameter(LSegmentParameter), LValue);
            Break;
          end
          else
            ACallback(TEMSEndPointSegmentParameter(LSegmentParameter),
              AContext.Request.Segments[LRequestSegmentIndex]);
      end
      else if LSegmentParameter is TEMSEndPointSegmentWildCard then
        Break;
    end;
    Inc(LRequestSegmentIndex);
    Inc(LSegmentParameterIndex);
  end;
end;

procedure TEMSResourceEndPointSuffix.DoHandleRequest(const AContext: TEndpointContext);
begin
  if Assigned(FHandlerProc) then
  begin
    if FSegmentParameters.Count > 0 then
      ScanSegmentParameters(AContext,
        procedure(ASegment: TEMSEndPointSegmentParameter; AValue: string)
        var
          LValue: string;
        begin
          if AValue.EndsWith('/') then
            LValue := AValue.SubString(0, AValue.Length - 1)
          else
            LValue := AValue;
          AContext.Request.Params.Add(ASegment.Name, LValue);
        end);

    if ConsumeList <> nil then
      AContext.Negotiation.ConsumeList.Intersect(ConsumeList);
    if ProduceList <> nil then
      AContext.Negotiation.ProduceList.Intersect(ProduceList);

    FHandlerProc(Self, AContext, AContext.Request, AContext.Response);
  end;
end;

function TEMSResourceEndPointSuffix.GetMethod: TEndpointRequest.TMethod;
begin
  Result := FMethod;
end;

function TEMSResourceEndPointSuffix.GetProduceList: TAcceptValueList;
begin
  Result := FProduceList;
end;

function TEMSResourceEndPointSuffix.GetConsumeList: TAcceptValueList;
begin
  Result := FConsumeList;
end;

function TEMSResourceEndPointSuffix.GetName: string;
begin
  Result := FName;
end;

procedure TEMSResourceEndPointSuffix.SetName(const AName: string);
begin
  if FName <> '' then
    FRoot.FEndpointsDict.Remove(FName);
  FName := AName;
  if FName <> '' then
    FRoot.FEndpointsDict.Add(FName, Self);
end;

function TEMSResourceEndPointSuffix.GetSegmentParameters: TEMSEndPointSegmentList;
begin
  Result := FSegmentParameters;
end;

{ TEMSEndPointSegmentList }

constructor TEMSEndPointSegmentList.Create;
begin
  FList := TObjectList<TEMSEndPointSegment>.Create;
end;

destructor TEMSEndPointSegmentList.Destroy;
begin
  FList.Free;
  inherited;
end;

function TEMSEndPointSegmentList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TEMSEndPointSegmentList.GetEnumerator: TEnumerator<TEMSEndPointSegment>;
begin
  Result := FList.GetEnumerator;
end;

function TEMSEndPointSegmentList.GetItem(I: Integer): TEMSEndPointSegment;
begin
  Result := FList[I];
end;

{ TEMSEndPointSegment }

constructor TEMSEndPointSegment.Create(const AOwner: TEMSEndPointSegmentList);
begin
  FOwner := AOwner;
  AOwner.FList.Add(Self);
end;

destructor TEMSEndPointSegment.Destroy;
begin
  Assert((FOwner.FList = nil) or not FOwner.FList.Contains(Self));
  inherited;
end;

{ TEMSEndPointSegmentParameter }

constructor TEMSEndPointSegmentParameter.Create(
  const AOwner: TEMSEndPointSegmentList; const AName: string);
begin
  inherited Create(AOwner);
  FName := AName;
end;

{ TEMSEndPointSegmentConstant }

constructor TEMSEndPointSegmentConstant.Create(
  const AOwner: TEMSEndPointSegmentList; const AValue: string);
begin
  inherited Create(AOwner);
  FValue := AValue;
end;

{ TEMSEndPointSegmentService }

class procedure TEMSEndPointSegmentService.ExtractSegments(
  const AString: string; const AList: TEMSEndPointSegmentList);
begin
  TEMSServices.GetService<IEMSEndPointSegmentsService>.ExtractSegments(AString, AList);
end;

class function TEMSEndPointSegmentService.CountSegments(
  const AString: string): Integer;
var
  LIntf: IInterface;
begin
  Result := 0;
  LIntf := EMSServices.GetService(IEMSEndPointSegmentsService);
  if LIntf <> nil then
    Result := IEMSEndPointSegmentsService(LIntf).CountSegments(AString);
end;

{ TEMSTypeInfoResource }

constructor TEMSTypeInfoResource.Create(const ATypeInfo: PTypeInfo);
var
  LResourceName: string;
begin
  FMethodList := TList<TResourceMethod>.Create;
  FAPIDocPaths := TObjectList<TAPIDocPath>.Create;
  FRttiType := FRttiContext.GetType(ATypeInfo);
  ScanResource(LResourceName);
  Assert(LResourceName <> '');
  if (FAttributes <> nil) and  ('' <> FAttributes.ResourceName) then
    LResourceName := FAttributes.ResourceName;
  inherited Create(LResourceName);
  ScanConstructor;
  ScanMethods;
  ScanFields;
  ScanObjectsDefinitions(LResourceName);
  CreateEndpoints;
  BuildTree;
end;

constructor TEMSTypeInfoResource.Create(const ATypeInfo: PTypeInfo;
  const AAttributes: TEMSResourceAttributes);
begin
  FAttributes := AAttributes;
  Create(ATypeInfo);
end;

destructor TEMSTypeInfoResource.Destroy;
begin
  FMethodList.Free;
  FAPIDocPaths.Free;
  FAttributes.Free;
  inherited;
end;

procedure TEMSTypeInfoResource.InternalScanResource(ARttiObj: TRttiNamedObject;
  out AResourceName: string; out ATenantAuthorization: TTenantAuthorization);
var
  LAttribute: TCustomAttribute;
begin
  Assert(ARttiObj <> nil);
  AResourceName := '';
  ATenantAuthorization := TTenantAuthorization.Full;
  for LAttribute in ARttiObj.GetAttributes do
  begin
    if LAttribute is ResourceNameAttribute then
      AResourceName := ResourceNameAttribute(LAttribute).Name
    else if LAttribute is AllowAnonymousTenantAttribute then
      ATenantAuthorization := TTenantAuthorization.SkipAll;
  end;

  if AResourceName = '' then
  begin
    AResourceName := ARttiObj.Name;
    if (ARttiObj is TRttiType) and
       AResourceName.StartsWith('T') and (AResourceName.Length > 1) then
      AResourceName := AResourceName.Substring(1);
  end;
  if FAttributes <> nil then
    ATenantAuthorization := FAttributes.ResourceTenantAuthorization[AResourceName];
end;

procedure TEMSTypeInfoResource.ScanResource(out AResourceName: string);
begin
  InternalScanResource(FRttiType, AResourceName, FTenantAuthorization);
end;

procedure TEMSTypeInfoResource.ScanConstructor;
var
  LRTTIMethod: TRTTIMethod;
  LRTTIParameters: TArray<TRTTIParameter>;
  LSimpleConstructor: TRTTIMethod;
  LComponentConstructor: TRTTIMethod;
begin
  Assert(FRttiType <> nil);
  LSimpleConstructor := nil;
  LComponentConstructor := nil;
  for LRttiMethod in FRttiType.GetMethods do
  begin
    if LRttiMethod.HasExtendedInfo and LRttiMethod.IsConstructor and SameText(LRttiMethod.Name, 'create') then
    begin
      LRttiParameters := LRttiMethod.GetParameters;
                                
      if Length(LRttiParameters) = 0 then
        LSimpleConstructor := LRttiMethod
      else if (Length(LRttiParameters) = 1) and (LRTTIParameters[0].ParamType.TypeKind = tkClass) and
        (LRttiParameters[0].ParamType.QualifiedName = 'System.Classes.TComponent') then
      begin
        LComponentConstructor := LRttiMethod;
        break;
      end;
    end;
  end;
  if LComponentConstructor <> nil then
  begin
    FRTTIConstructor := LComponentConstructor;
    FConstructorKind := TConstructorKind.Component;
  end
  else if LSimpleConstructor <> nil then
  begin
    FRTTIConstructor := LSimpleConstructor;
    FConstructorKind := TConstructorKind.Simple;
  end
  else
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
      Format(sConstructorNotFound, [FRTTIType.QualifiedName]));
end;

function TEMSTypeInfoResource.GetAPIDocPaths: TArray<TAPIDocPath>;
begin
  Result := FAPIDocPaths.ToArray;
end;

function TEMSTypeInfoResource.GetMethodTenantAuthorization(
  const AMethod: string): TTenantAuthorization;
var
  LMethod: TResourceMethod;
begin
  Result := TTenantAuthorization.Full;
  for LMethod in FMethodList do
    if SameText(LMethod.Name, AMethod) then
    begin
      Result := LMethod.TenantAuthorization;
      Break;
    end;

  if FAttributes <> nil then
    Result := FAttributes.EndPointTenantAuthorization[AMethod];
end;

procedure TEMSTypeInfoResource.InternalScanMethods(const ARTTIField: TRTTIField;
  const AFieldAttributes: TEMSResourceAttributes; const ARTTIMethods: TArray<TRTTIMethod>);
var
  LRTTIMethod: TRTTIMethod;
  LRTTIParameters: TArray<TRttiParameter>;
  LHTTPMethod: TEndpointRequest.TMethod;
  LResourceMethod: TResourceMethod;
  LParentURLSuffix: string;
  LBaseURLSuffix: string;
  LRTTIReturnType: TRttiType;
  LSignatureKind: TResourceMethod.TSignatureKind;
  LEndpointName: string;
  LMethodNames: TDictionary<string, TDispatchKind>;
  LEndpointNames: TDictionary<string, Integer>;
  LCount: Integer;
  LAPIDocMethod: TAPIDocPathItem;
  LResponses: TArray<TAPIDocResponse>;
  LParameters: TArray<TAPIDocParameter>;
  LEndPointRequestSummary: EndPointRequestSummaryAttribute;
  LTenantAuthorization: TTenantAuthorization;
  LMethodAttributes: TEMSResourceAttributes;
  LEndpointProduce: string;
  LEndpointConsume: string;
  LMeth: string;

  function GetSignatureKind(const AParameters: TArray<TRttiParameter>; const AReturnType: TRttiType): TResourceMethod.TSignatureKind;
  begin
    Result := TResourceMethod.TSignatureKind.Unknown;
    if (Length(AParameters) = 3) and (AReturnType = nil) then
    begin
      if SameText(AParameters[0].ParamType.QualifiedName, 'EMS.ResourceAPI.TEndpointContext') and
        SameText(AParameters[1].ParamType.QualifiedName, 'EMS.ResourceAPI.TEndpointRequest') and
        SameText(AParameters[2].ParamType.QualifiedName, 'EMS.ResourceAPI.TEndpointResponse') then
      begin
        Result := TResourceMethod.TSignatureKind.Standard;
      end;
    end;
  end;

  procedure ApplyAttributes(AAttributes: TEMSResourceAttributes;
    const AName: string; AParentAttrs: Boolean);
  var
    S: string;
    LReqSum: EndPointRequestSummaryAttribute;
    LResps: TArray<TAPIDocResponse>;
    LParams: TArray<TAPIDocParameter>;
    LAuth: TTenantAuthorization;
    LMeth: TEndpointRequest.TMethod;
  begin
    S := AAttributes.ResourceSuffix[AName];
    if S <> '' then
      if AParentAttrs then
        LParentURLSuffix := S
      else
        LBaseURLSuffix := S;
    S := AAttributes.EndPointName[AName];
    if S <> '' then
      LEndpointName := S;
    LReqSum := AAttributes.RequestSummary[AName];
    if LReqSum <> nil then
      LEndPointRequestSummary := LReqSum;
    LResps := AAttributes.ResponseDetails[AName];
    if Length(LResps) <> 0 then
      LResponses := LResps;
    LParams := AAttributes.RequestParameters[AName];
    if Length(LParams) <> 0 then
      LParameters := LParams;
    LAuth := AAttributes.EndPointTenantAuthorization[AName];
    if LAuth <> TTenantAuthorization.Default then
      LTenantAuthorization := LAuth;
    S := AAttributes.EndPointProduce[AName];
    if S <> '' then
      LEndpointProduce := S;
//    else if (LReqSum <> nil) and (LEndpointProduce = '') then
//      LEndpointProduce := LReqSum.Produces;
    S := AAttributes.EndPointConsume[AName];
    if S <> '' then
      LEndpointConsume := S;
//    else if (LReqSum <> nil) and (LEndpointConsume = '') then
//      LEndpointConsume := LReqSum.Consume;
    LMeth := AAttributes.EndPointHTTPMethod[AName];
    if LMeth <> TEndpointRequest.TMethod.Other then
      LHTTPMethod := LMeth;
  end;

begin
  LMethodNames := TDictionary<string, TDispatchKind>.Create;
  LEndpointNames := TDictionary<string, Integer>.Create;
  LMethodAttributes := TEMSResourceAttributes.Create;
  try
    for LRTTIMethod in ARTTIMethods do
    begin
      // Cpp doesn't support published methods, so support public and published.
      if (LRTTIMethod.Visibility in [TMemberVisibility.mvPublic, TMemberVisibility.mvPublished]) and
         LMethodNames.TryAdd(LRTTIMethod.ToString, LRTTIMethod.DispatchKind) then
      begin
        LRTTIParameters := LRTTIMethod.GetParameters;
        LRTTIReturnType := LRTTIMethod.ReturnType;
        LSignatureKind := GetSignatureKind(LRttiParameters, LRTTIReturnType);
        if LSignatureKind <> TResourceMethod.TSignatureKind.Unknown then
        begin
          LHTTPMethod := TEndpointRequest.TMethod.Other;
          LParentURLSuffix := '';
          LBaseURLSuffix := '';
          LEndpointName := '';
          LEndPointRequestSummary := nil;
          LResponses := nil;
          LParameters := nil;
          LTenantAuthorization := TTenantAuthorization.Full;
          LEndpointProduce := '';
          LEndpointConsume := '';

          LMethodAttributes.Clear;
          LMethodAttributes.LoadFromRtti(LRTTIMethod);

          ApplyAttributes(LMethodAttributes, '', False);
          if AFieldAttributes <> nil then
          begin
            ApplyAttributes(AFieldAttributes, '', True);
            ApplyAttributes(AFieldAttributes, LRTTIMethod.Name, False);
          end;
          if FAttributes <> nil then
            if AFieldAttributes <> nil then
            begin
              ApplyAttributes(FAttributes, AFieldAttributes.ResourceName, True);
              ApplyAttributes(FAttributes, AFieldAttributes.ResourceName + '.' + LRTTIMethod.Name, False);
            end
            else
              ApplyAttributes(FAttributes, LRTTIMethod.Name, False);

          if LHTTPMethod = TEndpointRequest.TMethod.Other then
          begin
            LMeth := LRTTIMethod.Name.ToLower;
            if LMeth.StartsWith('get') then
              LHTTPMethod := TEndpointRequest.TMethod.Get
            else if LMeth.StartsWith('put') then
              LHTTPMethod := TEndpointRequest.TMethod.Put
            else if LMeth.StartsWith('post') then
              LHTTPMethod := TEndpointRequest.TMethod.Post
            else if LMeth.StartsWith('delete') then
              LHTTPMethod := TEndpointRequest.TMethod.Delete
            else if LMeth.StartsWith('patch') then
              LHTTPMethod := TEndpointRequest.TMethod.Patch;
          end;

          if LHTTPMethod <> TEndpointRequest.TMethod.Other then
          begin
            if LEndpointName = '' then
            begin
              LEndpointName := LRTTIMethod.Name;
              if AFieldAttributes <> nil then
                LEndpointName := AFieldAttributes.ResourceName + '.' + LEndpointName;
            end;
            if LEndpointNames.TryGetValue(LEndpointName.ToLower, LCount) then
            begin
              // Make unique name
              LEndpointNames[LEndpointName.ToLower] := LCount + 1;
              LEndpointName := LEndpointName + IntToStr(LCount);
            end
            else
              LEndpointNames.Add(LEndpointName.ToLower, 1);

            LAPIDocMethod := TAPIDocPathItem.Create(LHTTPMethod, LEndpointName,
              LEndPointRequestSummary, LResponses, LParameters);
                                                                                    
                                                           
            if LAPIDocMethod.FProduces = '' then
              LAPIDocMethod.FProduces := LEndpointProduce;
            if LAPIDocMethod.FConsumes = '' then
              LAPIDocMethod.FConsumes := LEndpointConsume;

            if (LParentURLSuffix = '') and (AFieldAttributes <> nil) then
              LParentURLSuffix := AFieldAttributes.ResourceName;
            if LParentURLSuffix.StartsWith('./') then
              LParentURLSuffix := LParentURLSuffix.Substring(2);
            if LBaseURLSuffix = '' then
              LBaseURLSuffix := LParentURLSuffix
            else if LBaseURLSuffix.StartsWith('./') then
              if LParentURLSuffix.EndsWith('/') then
                LBaseURLSuffix := LParentURLSuffix + LBaseURLSuffix.Substring(2)
              else
                LBaseURLSuffix := LParentURLSuffix + LBaseURLSuffix.Substring(1);

            LResourceMethod := TResourceMethod.Create(LEndpointName, ARTTIField,
              LRTTIMethod, LHTTPMethod, LBaseURLSuffix, LAPIDocMethod, LTenantAuthorization,
              LEndpointProduce, LEndpointConsume);
            LResourceMethod.FRttiParameters := LRTTIParameters;
            LResourceMethod.FRttiReturnType := LRTTIReturnType;
            LResourceMethod.FSignatureKind := LSignatureKind;
            FMethodList.Add(LResourceMethod);
          end;
        end;
      end;
    end;
  finally
    LMethodAttributes.Free;
    LEndpointNames.Free;
    LMethodNames.Free;
  end;
end;

procedure TEMSTypeInfoResource.ScanMethods;
var
  LRTTIMethods: TArray<TRTTIMethod>;
begin
  Assert(FRttiType <> nil);
  LRTTIMethods := FRTTIType.GetMethods;
  InternalScanMethods(nil, nil, LRTTIMethods);
end;

procedure TEMSTypeInfoResource.ScanFields;
var
  LRTTIFields: TArray<TRttiField>;
  LRTTIField: TRttiField;
  LRTTIInterfaces: TArray<TRttiInterfaceType>;
  LRTTIInterface: TRttiInterfaceType;
  LRTTIMethods: TArray<TRTTIMethod>;
  LParentResourceName: string;
  LParentTenantAuthorization: TTenantAuthorization;
  LAttributes: TEMSResourceAttributes;
begin
  Assert(FRttiType <> nil);
  LRTTIFields := FRTTIType.GetFields;
  for LRTTIField in LRTTIFields do
    if (LRTTIField.Visibility in [TMemberVisibility.mvPublic, TMemberVisibility.mvPublished]) and
       (LRTTIField.FieldType is TRttiInstanceType) then begin
      LRTTIInterfaces := TRttiInstanceType(LRTTIField.FieldType).GetImplementedInterfaces;
      for LRTTIInterface in LRTTIInterfaces do
        if SameText(LRTTIInterface.QualifiedName, 'EMS.ResourceAPI.IEMSEndpointPublisher') then
        begin
          LAttributes := TEMSResourceAttributes.Create;
          try
            InternalScanResource(LRTTIField, LParentResourceName, LParentTenantAuthorization);
            LAttributes.ResourceName := LParentResourceName;
            LAttributes.ResourceTenantAuthorization[LAttributes.ResourceName] := LParentTenantAuthorization;

            LAttributes.LoadFromRtti(LRTTIField);

            LRTTIMethods := LRTTIField.FieldType.GetMethods;
            InternalScanMethods(LRTTIField, LAttributes, LRTTIMethods);
          finally
            LAttributes.Free;
          end;
          Break;
        end;
    end;
end;

procedure TEMSTypeInfoResource.ScanObjectsDefinitions(const AResourceName: string);
var
  LAttribute: TCustomAttribute;
begin
  Assert(FRttiType <> nil);
  for LAttribute in FRttiType.GetAttributes do
  begin
    if LAttribute is EndPointObjectsYAMLDefinitionsAttribute then
      FYAMLDefinitions := EndPointObjectsYAMLDefinitionsAttribute(LAttribute).Objects
    else if LAttribute is EndPointObjectsJSONDefinitionsAttribute then
      FJSONDefinitions := EndPointObjectsJSONDefinitionsAttribute(LAttribute).Objects;
  end;
  if FAttributes <> nil then
  begin
    FYAMLDefinitions := FAttributes.GetYAMLDefinitions(AResourceName);
    FJSONDefinitions := FAttributes.GetJSONDefinitions(AResourceName);
  end;
end;

function TEMSTypeInfoResource.CreateInstance: TObject;
var
  LMetaClass: TClass;
begin
  Result := nil;
  LMetaClass := FRttiType.AsInstance.MetaclassType;
  case FConstructorKind of
    TConstructorKind.Simple:
      Result := FRttiConstructor.Invoke(LMetaClass, []).AsObject;
    TConstructorKind.Component:
      Result := FRttiConstructor.Invoke(LMetaClass, [nil]).AsObject;
  else
    Assert(False);
  end;
end;

procedure TEMSTypeInfoResource.CreateEndPoints;

  procedure AddEndPoint(const AResourceMethod: TResourceMethod);
  var
    LResourceMethod: TResourceMethod;
    LResource: TEMSTypeInfoResource;
  begin
    LResourceMethod := AResourceMethod;
    LResource := Self;
    TEMSResourceEndPointSuffix.Create(Self, AResourceMethod.FName,
      AResourceMethod.FURLSuffix, AResourceMethod.FHTTPMethod,
      AResourceMethod.FProduce, AResourceMethod.FConsume,
      procedure(const Sender: TObject; const AContext: TEndpointContext;
        const ARequest: TEndpointRequest; const AResponse: TEndpointResponse)
      var
        LObject: TObject;
      begin
        LObject := LResource.CreateInstance;
        try
          if LResourceMethod.FRttiField <> nil then
            LResourceMethod.FRttiMethod.Invoke(LResourceMethod.FRttiField.GetValue(LObject),
              TArray<TValue>.Create(AContext, ARequest, AResponse))
          else
            LResourceMethod.FRttiMethod.Invoke(LObject,
              TArray<TValue>.Create(AContext, ARequest, AResponse));
        finally
          LObject.DisposeOf;
        end;
      end);
  end;

  procedure AddDocPath(const AResourceMethod: TResourceMethod; const ADocPaths: TDictionary<string, TAPIDocPath>);
  var
    LPath: string;
    LAPIDocPath: TAPIDocPath;
  begin
    LPath := '/' + FBaseURL;
    if AResourceMethod.FURLSuffix <> '' then
    begin
      if not AResourceMethod.FURLSuffix.StartsWith('/') then
        LPath := LPath + '/';
      LPath := LPath + AResourceMethod.FURLSuffix;
    end;
    if ADocPaths.TryGetValue(LPath, LAPIDocPath) then
      LAPIDocPath.AddPathItem(AResourceMethod.FPathItem)
    else
    begin
      LAPIDocPath := TAPIDocPath.Create(LPath, AResourceMethod.FName);
      LAPIDocPath.AddPathItem(AResourceMethod.FPathItem);
      ADocPaths.Add(LPath, LAPIDocPath);
    end;
  end;
var
  LResourceMethod: TResourceMethod;
  LDocPaths: TDictionary<string, TAPIDocPath>;
  LDocArray: TArray<TPair<string, TAPIDocPath>>;
  LDocPair: TPair<string, TAPIDocPath>;
begin
  LDocPaths := TDictionary<string, TAPIDocPath>.Create;
  try
    for LResourceMethod in FMethodList do
    begin
      AddEndPoint(LResourceMethod);
      AddDocPath(LResourceMethod, LDocPaths);
    end;
    LDocArray := LDocPaths.ToArray;
  finally
    LDocPaths.Free;
  end;

  for LDocPair in LDocArray do
  begin
    FAPIDocPaths.Add(LDocPair.Value);
  end;
end;

{ ResourceSuffixAttribute }

constructor ResourceSuffixAttribute.Create(const AMethod, ASuffix: string);
begin
  inherited Create(AMethod);
  FSuffix := ASuffix;
end;

constructor ResourceSuffixAttribute.Create(const ASuffix: string);
begin
  Create('', ASuffix);
end;

{ TEMSTypeInfoResource.TResourceMethod }

constructor TEMSTypeInfoResource.TResourceMethod.Create(const AName: string; const ARttiField: TRTTIField;
  const ARttiMethod: TRTTIMethod; AHTTPMethod: TEndpointRequest.TMethod; const ABaseURLSuffix: string;
  const APathItem: TAPIDocPathItem = nil; ATenantAuthorization: TTenantAuthorization = TTenantAuthorization.Full;
  const AProduce: string = ''; const AConsume: string = '');
begin
  FName := AName;
  FRttiField := ARttiField;
  FRttiMethod := ARttiMethod;
  FHTTPMethod := AHTTPMethod;
  FURLSuffix := ABaseURLSuffix;
  FPathItem := APathItem;
  FTenantAuthorization := ATenantAuthorization;
  FProduce := AProduce;
  FConsume := AConsume;
end;

{ ResourceNameAttribute }

constructor ResourceNameAttribute.Create(AName: string);
begin
  FName := AName;
end;

{ EndpointNameAttribute }

constructor EndpointNameAttribute.Create(const AMethod, AName: string);
begin
  inherited Create(AMethod);
  FName := AName;
end;

constructor EndpointNameAttribute.Create(const AName: string);
begin
  Create('', AName);
end;

{ TEMSResourceAttributes }

constructor TEMSResourceAttributes.Create;
begin
  inherited Create;
  FEndpointName := TDictionary<string, string>.Create(TIStringComparer.Ordinal);
  FResourceSuffix := TDictionary<string, string>.Create(TIStringComparer.Ordinal);
  FResponseDetails := TObjectDictionary<string, TList<TAPIDocResponse>>.Create([doOwnsValues], TIStringComparer.Ordinal);
  FRequestSummary := TObjectDictionary<string, EndPointRequestSummaryAttribute>.Create([doOwnsValues], TIStringComparer.Ordinal);
  FRequestParameters := TObjectDictionary<string, TList<TAPIDocParameter>>.Create([doOwnsValues], TIStringComparer.Ordinal);
  FYAMLDefinitions := TDictionary<string, string>.Create(TIStringComparer.Ordinal);
  FJSONDefinitions := TDictionary<string, string>.Create(TIStringComparer.Ordinal);
  FResourceTenantAuthorizations := TDictionary<string, TTenantAuthorization>.Create(TIStringComparer.Ordinal);
  FEndPointTenantAuthorizations := TDictionary<string, TTenantAuthorization>.Create(TIStringComparer.Ordinal);
  FEndPointProduce := TDictionary<string, string>.Create(TIStringComparer.Ordinal);
  FEndPointConsume := TDictionary<string, string>.Create(TIStringComparer.Ordinal);
  FEndPointHTTPMethod := TDictionary<string, TEndpointRequest.TMethod>.Create(TIStringComparer.Ordinal);
end;

destructor TEMSResourceAttributes.Destroy;
begin
  FEndpointName.Free;
  FResourceSuffix.Free;
  FResponseDetails.Free;
  FRequestSummary.Free;
  FRequestParameters.Free;
  FYAMLDefinitions.Free;
  FJSONDefinitions.Free;
  FResourceTenantAuthorizations.Free;
  FEndPointTenantAuthorizations.Free;
  FEndPointProduce.Free;
  FEndPointConsume.Free;
  FEndPointHTTPMethod.Free;
  inherited Destroy;
end;

procedure TEMSResourceAttributes.LoadFromRtti(AMember: TRttiMember);
var
  LRTTIAttributes: TArray<System.TCustomAttribute>;
  LRTTIAttribute: System.TCustomAttribute;
  LMethod: string;
begin
  LRTTIAttributes := AMember.GetAttributes;
  for LRTTIAttribute in LRTTIAttributes do
  begin
    if LRTTIAttribute is TEndpointCustomAttribute then
      LMethod := TEndpointCustomAttribute(LRTTIAttribute).Method
    else
      LMethod := '';
    if (LMethod <> '') and (AMember is TRttiMethod) and not SameText(AMember.Name, LMethod) then
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
        Format(sInvalidAttributeUsage, [AMember.Name]));

    if LRTTIAttribute is ResourceSuffixAttribute then
      ResourceSuffix[LMethod] := ResourceSuffixAttribute(LRTTIAttribute).Suffix
    else if LRTTIAttribute is EndpointNameAttribute then
      EndPointName[LMethod] := EndpointNameAttribute(LRTTIAttribute).Name
    else if LRTTIAttribute is EndPointResponseDetailsAttribute then
      AddResponseDetail(LMethod, EndPointResponseDetailsAttribute(LRTTIAttribute))
    else if LRTTIAttribute is EndPointRequestParameterAttribute then
      AddRequestParameter(LMethod, EndPointRequestParameterAttribute(LRTTIAttribute))
    else if LRTTIAttribute is EndPointRequestSummaryAttribute then
      RequestSummary[LMethod] := EndPointRequestSummaryAttribute(LRTTIAttribute)
    else if LRTTIAttribute is AllowAnonymousTenantAttribute then
      EndPointTenantAuthorization[LMethod] := TTenantAuthorization.SkipAll
    else if LRTTIAttribute is EndPointConsumeAttribute then
      EndPointConsume[LMethod] := EndPointConsumeAttribute(LRTTIAttribute).Types
    else if LRTTIAttribute is EndPointProduceAttribute then
      EndPointProduce[LMethod] := EndPointProduceAttribute(LRTTIAttribute).Types
    else if LRTTIAttribute is EndPointMethodAttribute then
      EndPointHTTPMethod[LMethod] := EndPointMethodAttribute(LRTTIAttribute).HTTPMethod;
  end;
end;

procedure TEMSResourceAttributes.Clear;
begin
  FResourceName := '';
  FEndpointName.Clear;
  FResourceSuffix.Clear;
  FResponseDetails.Clear;
  FRequestSummary.Clear;
  FRequestParameters.Clear;
  FYAMLDefinitions.Clear;
  FJSONDefinitions.Clear;
  FResourceTenantAuthorizations.Clear;
  FEndPointTenantAuthorizations.Clear;
  FEndPointProduce.Clear;
  FEndPointConsume.Clear;
  FEndPointHTTPMethod.Clear;
end;

function TEMSResourceAttributes.GetEndPointName(const AMethod: string): string;
begin
  FEndpointName.TryGetValue(AMethod, Result);
end;

function TEMSResourceAttributes.GetResourceSuffix(const AMethod: string): string;
begin
  FResourceSuffix.TryGetValue(AMethod, Result);
end;

procedure TEMSResourceAttributes.SetJSONDefinitions(const AResourceName, Value: string);
begin
  FJSONDefinitions.AddOrSetValue(AResourceName, Value);
end;

procedure TEMSResourceAttributes.SetYAMLDefinitions(const AResourceName, Value: string);
begin
  FYAMLDefinitions.AddOrSetValue(AResourceName, Value);
end;

procedure TEMSResourceAttributes.SetEndPointTenantAuthorization(
  const AMethod: string; const Value: TTenantAuthorization);
begin
  FEndPointTenantAuthorizations.AddOrSetValue(AMethod, Value);
end;

procedure TEMSResourceAttributes.SetEndPointName(const AMethod, Value: string);
begin
  FEndpointName.AddOrSetValue(AMethod, Value);
end;

procedure TEMSResourceAttributes.SetRequestSummary(const AMethod: string;
  ARequestSummaryAttribute: EndPointRequestSummaryAttribute);
var
  LRequestSummaryAttribute: EndPointRequestSummaryAttribute;
begin
  LRequestSummaryAttribute := EndPointRequestSummaryAttribute.Create(
    ARequestSummaryAttribute.Tags, ARequestSummaryAttribute.Summary,
    ARequestSummaryAttribute.Description, ARequestSummaryAttribute.Produces,
    ARequestSummaryAttribute.Consume);
  FRequestSummary.AddOrSetValue(AMethod, LRequestSummaryAttribute);
end;

procedure TEMSResourceAttributes.SetResourceTenantAuthorization(
  const AResourceName: string; const Value: TTenantAuthorization);
begin
  FResourceTenantAuthorizations.AddOrSetValue(AResourceName, Value);
end;

procedure TEMSResourceAttributes.SetResourceSuffix(const AMethod,
  Value: string);
begin
  FResourceSuffix.AddOrSetValue(AMethod, Value);
end;

procedure TEMSResourceAttributes.AddRequestParameter(const AMethod: string;
  const ARequestParameterAttribute: EndPointRequestParameterAttribute);
var
  LAPIDocParameter: TAPIDocParameter;
  LListParameter: TList<TAPIDocParameter>;
begin
  LAPIDocParameter := TAPIDocParameter.Create(ARequestParameterAttribute);
  if not FRequestParameters.TryGetValue(AMethod, LListParameter) then
  begin
    LListParameter := TObjectList<TAPIDocParameter>.Create;
    FRequestParameters.AddOrSetValue(AMethod, LListParameter);
  end;
  LListParameter.Add(LAPIDocParameter);
end;

procedure TEMSResourceAttributes.AddResponseDetail(const AMethod: string;
  const AResponseDetailAttribute: EndPointResponseDetailsAttribute);
var
  LAPIDocResponse: TAPIDocResponse;
  LListAPIDoc: TList<TAPIDocResponse>;
begin
  LAPIDocResponse := TAPIDocResponse.Create(AResponseDetailAttribute);
  if not FResponseDetails.TryGetValue(AMethod, LListAPIDoc) then
  begin
    LListAPIDoc := TObjectList<TAPIDocResponse>.Create;
    FResponseDetails.AddOrSetValue(AMethod, LListAPIDoc);
  end;
  LListAPIDoc.Add(LAPIDocResponse);
end;

function TEMSResourceAttributes.GetEndPointTenantAuthorization(
  const AMethod: string): TTenantAuthorization;
begin
  if not FEndPointTenantAuthorizations.TryGetValue(AMethod, Result) then
    Result := TTenantAuthorization.Default;
end;

function TEMSResourceAttributes.GetYAMLDefinitions(const AResourceName: string): string;
begin
  FYAMLDefinitions.TryGetValue(AResourceName, Result);
end;

function TEMSResourceAttributes.GetJSONDefinitions(const AResourceName: string): string;
begin
  FJSONDefinitions.TryGetValue(AResourceName, Result);
end;

function TEMSResourceAttributes.GetRequestParameters(const AMethod: string): TArray<TAPIDocParameter>;
var
  LAPIDocParameterList: TList<TAPIDocParameter>;
begin
  if FRequestParameters.TryGetValue(AMethod, LAPIDocParameterList) then
    Result := LAPIDocParameterList.ToArray;
end;

function TEMSResourceAttributes.GetRequestSummary(const AMethod: string): EndPointRequestSummaryAttribute;
begin
  FRequestSummary.TryGetValue(AMethod, Result);
end;

function TEMSResourceAttributes.GetResourceTenantAuthorization(
  const AResourceName: string): TTenantAuthorization;
begin
  if not FResourceTenantAuthorizations.TryGetValue(AResourceName, Result) then
    Result := TTenantAuthorization.Full;
end;

function TEMSResourceAttributes.GetResponseDetails(const AMethod: string): TArray<TAPIDocResponse>;
var
  LAPIDocResponseList: TList<TAPIDocResponse>;
begin
  if FResponseDetails.TryGetValue(AMethod, LAPIDocResponseList) then
    Result := LAPIDocResponseList.ToArray;
end;

function TEMSResourceAttributes.GetEndPointProduce(
  const AMethod: string): string;
begin
  FEndPointProduce.TryGetValue(AMethod, Result);
end;

procedure TEMSResourceAttributes.SetEndPointProduce(const AMethod,
  AValue: string);
begin
  FEndPointProduce.AddOrSetValue(AMethod, AValue);
end;

function TEMSResourceAttributes.GetEndPointConsume(
  const AMethod: string): string;
begin
  FEndPointConsume.TryGetValue(AMethod, Result);
end;

procedure TEMSResourceAttributes.SetEndPointConsume(const AMethod,
  AValue: string);
begin
  FEndPointConsume.AddOrSetValue(AMethod, AValue);
end;

function TEMSResourceAttributes.GetEndPointHTTPMethod(
  const AMethod: string): TEndpointRequest.TMethod;
begin
  if not FEndPointHTTPMethod.TryGetValue(AMethod, Result) then
    Result := TEndpointRequest.TMethod.Other;
end;

procedure TEMSResourceAttributes.SetEndPointHTTPMethod(const AMethod: string;
  const AValue: TEndpointRequest.TMethod);
begin
  FEndPointHTTPMethod.AddOrSetValue(AMethod, AValue);
end;

{ TEMSCommonResource }

procedure TEMSCommonResource.BuildTree;
begin
  EnumEndPoints(
    procedure(const AEndPoint: TEMSResourceEndPoint; var ADone: Boolean)
    var
      LEndPoint: TEMSResourceEndPoint;
      LSegment: TEMSEndPointSegment;
      LCurrentNode: TTreeNode;
      LNode: TTreeNode;
      LMatch: TTreeNode;
      LMatchingSegment: Boolean;
      LEndpointScore: Integer;
    begin
      LMatch := nil;
      LEndPoint := AEndpoint; // TEMSResourceEndPoint(AEndPoint);
      LCurrentNode := FRootNode;
      LEndpointScore := 0;
      for LSegment in LEndPoint.SegmentParameters do
      begin
        LMatch := nil;
        for LNode in LCurrentNode.ChildNodes do
        begin
          LMatchingSegment := (LEndpoint.Method = LNode.Method) and
            (LNode.Segment.ClassType = LSegment.ClassType);
          if LMatchingSegment then
            if LSegment is TEMSEndPointSegmentConstant then
            begin
              LMatchingSegment := SameText(TEMSEndPointSegmentConstant(LSegment).Value,
                TEMSEndPointSegmentConstant(LNode.Segment).Value);
            end;
          if LMatchingSegment then
          begin
            LMatch := LNode;
            break;
          end;
        end;

        if LMatch <> nil then
          LCurrentNode := LMatch
        else
        begin
          LMatch := TTreeNode.Create(LEndpoint.Method, LSegment);
          LCurrentNode.AddChildNode(LMatch);
          LCurrentNode := LMatch;
        end;

        if LSegment is TEMSEndPointSegmentConstant then
          Inc(LEndpointScore); // Score is used when duplicate paths

      end;
      if LMatch <> nil then
        LCurrentNode.AddTerminalEndpoint(LEndPoint.Name, LEndpointScore);
    end);
end;

procedure TEMSCommonResource.SearchTree(const AContext: TEndpointContext;
  ARequestSegmentIndex: Integer; const ATreeNode: TTreeNode;
  const ATerminalNodes: TList<TTreeNode>);
var
  LRequestSegment: string;
  LNode: TTreeNode;
  LMatch: Boolean;
  LWildcard: Boolean;
  LMethod: TEndpointRequest.TMethod;
begin
  Assert(ARequestSegmentIndex < AContext.Request.Segments.Count);
  LMethod := AContext.Request.Method;

  LRequestSegment := AContext.Request.Segments[ARequestSegmentIndex];
  for LNode in ATreeNode.ChildNodes do
  begin
    LWildcard := False;
    LMatch := LMethod = LNode.Method;
    if LMatch then
      if (LNode.Segment is TEMSEndPointSegmentParameter) and
           (TEMSEndPointSegmentParameter(LNode.Segment).Name <> '*') then
        LMatch := not ('/' = LRequestSegment)
      else if LNode.Segment is TEMSEndPointSegmentConstant then
        LMatch := SameText(TEMSEndPointSegmentConstant(LNode.Segment).Value, LRequestSegment)
      else if LNode.Segment is TEMSEndPointSegmentSlash then
        LMatch := '/' = LRequestSegment
      else if (LNode.Segment is TEMSEndPointSegmentWildcard) or
              (LNode.Segment is TEMSEndPointSegmentParameter) and
                (TEMSEndPointSegmentParameter(LNode.Segment).Name = '*') then
      begin
        LMatch := True;
        LWildcard := True;
      end
      else
      begin
        LMatch := False;
        Assert(False);
      end;
    if LMatch then
      if LWildcard or (ARequestSegmentIndex + 1 = AContext.Request.Segments.Count) then
        ATerminalNodes.Add(LNode)
      else if ARequestSegmentIndex + 1 < AContext.Request.Segments.Count then
        // Recursive
        SearchTree(AContext, ARequestSegmentIndex + 1, LNode, ATerminalNodes);
  end;
end;

procedure TEMSCommonResource.SearchTree(const AContext: TEndpointContext; out ATerminalNodes: TArray<TTreeNode>);
var
  LRequestSegmentIndex: Integer;
  LList: TList<TTreeNode>;
begin
  LRequestSegmentIndex := BaseURLSegmentCount;
  if LRequestSegmentIndex < AContext.Request.Segments.Count then
  begin
    LList := TList<TTreeNode>.Create;
    try
      SearchTree(AContext, LRequestSegmentIndex, FRootNode, LList);
      ATerminalNodes := LList.ToArray;
    finally
      LList.Free;
    end;
  end
  else
    ATerminalNodes := nil;
end;

function TEMSCommonResource.DoCanHandleRequest(
  const AContext: TEndpointContext; out AEndpointName: string): Boolean;
var
  LTerminalNodes: TArray<TTreeNode>;
  LNode: TTreeNode;
  LTerminalEndpoint: TLeafEndpoint;
  LNegogiator: TNegotiator;
begin
  Result := False;
  AEndpointName := '';
  LNegogiator := TNegotiator.Create(AContext);
  try
    if BaseURLSegmentCount = AContext.Request.Segments.Count then
      EnumEndPoints(
        procedure(const AEndPoint: TEMSResourceEndPoint; var ADone: Boolean)
        begin
          // No segments
                                                          
          if (AEndpoint.Method = AContext.Request.Method) and
             (AEndpoint.SegmentParameters.Count = 0) then
            LNegogiator.Choose(AEndpoint, 0);
        end)
    else
    begin
      SearchTree(AContext, LTerminalNodes);
      for LNode in LTerminalNodes do
        for LTerminalEndpoint in LNode.LeafEndpoints do
          LNegogiator.Choose(FindEndPoint(LTerminalEndpoint.EndpointName),
            LTerminalEndpoint.Score);
    end;
    case LNegogiator.Status of
      TNegotiator.TStatus.Nothing:
        ;
      TNegotiator.TStatus.Failed:
        if AContext.Request.Method = TEndpointRequest.TMethod.Get then
          EEMSHTTPError.RaiseNotAcceptable()
        else
          EEMSHTTPError.RaiseUnsupportedMedia();
      TNegotiator.TStatus.Duplicates:
        EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
          Format(sDuplicateEndpoints, [LNegogiator.DuplicateNames]));
      TNegotiator.TStatus.OK:
        begin
          Result := True;
          AEndpointName := LNegogiator.BestEndpoint.Name;
        end;
    end;
  finally
    LNegogiator.Free;
  end;
end;

procedure TEMSCommonResource.DoHandleRequest(
  const AContext: TEndpointContext);
var
  LEndpoint: TEMSResourceEndPoint;
begin
  LEndpoint := FindEndPoint(AContext.EndpointName);
  LEndpoint.DoAuthorizeRequest(AContext);
  LEndpoint.DoHandleRequest(AContext);
end;

{ TEMSResourceWSegments.TTreeNode }

procedure TEMSCommonResource.TTreeNode.AddChildNode(
  const ANode: TTreeNode);
begin
  FChildNodes.Add(ANode);
end;

procedure TEMSCommonResource.TTreeNode.AddTerminalEndpoint(
  const AEndpointName: string; AScore: Integer);
begin
  FLeafEndpoints.Add(TLeafEndpoint.Create(AEndpointName, AScore));
end;

constructor TEMSCommonResource.TTreeNode.Create(
  AMethod: TEndpointRequest.TMethod; const ASegment: TEMSEndpointSegment);
begin
  FChildNodes := TObjectList<TTreeNode>.Create;
  FLeafEndpoints := TList<TLeafEndpoint>.Create;
  FMethod := AMethod;
  FSegment := ASegment;
end;

destructor TEMSCommonResource.TTreeNode.Destroy;
begin
  FChildNodes.Free;
  FLeafEndpoints.Free;
  inherited;
end;

function TEMSCommonResource.TTreeNode.GetChildNodes: TArray<TTreeNode>;
begin
  Result := FChildNodes.ToArray;
end;

function TEMSCommonResource.TTreeNode.GetLeafEndpoints: TArray<TLeafEndpoint>;
begin
  Result := FLeafEndpoints.ToArray;
end;

{ TEMSCommonResource.TLeafEndpoint }

constructor TEMSCommonResource.TLeafEndpoint.Create(const AEndpointName: string;
  AScore: Integer);
begin
  EndpointName := AEndpointName;
  Score := AScore;
end;

{ TEMSCommonResource.TNegotiator }

constructor TEMSCommonResource.TNegotiator.Create(AContext: TEndpointContext);
begin
  inherited Create;
  FContext := AContext;
  FBestEndpoints := TList<TEMSResourceEndPoint>.Create;
end;

destructor TEMSCommonResource.TNegotiator.Destroy;
begin
  FBestEndpoints.Free;
  inherited Destroy;
end;

procedure TEMSCommonResource.TNegotiator.Reset;
begin
  FChooseCount := 0;
  FBestEndpoints.Clear;
  FBestWeight := 0;
end;

procedure TEMSCommonResource.TNegotiator.Choose(AEndpoint: TEMSResourceEndPoint; AScore: Integer);
var
  LWeight: Double;
begin
  Inc(FChooseCount);
  LWeight := 1;
  if ((FContext.Negotiation.ProduceList.Count = 0) or (AEndpoint.ProduceList = nil) or
      (AEndpoint.ProduceList.Negotiate(FContext.Negotiation.ProduceList, LWeight, nil) <> '')) and
     ((FContext.Negotiation.ConsumeList.Count = 0) or (AEndpoint.ConsumeList = nil) or
      (AEndpoint.ConsumeList.Negotiate(FContext.Negotiation.ConsumeList, LWeight, nil) <> '')) then
  begin
    LWeight := LWeight * (AScore + 1);
    case TAcceptValueList.CompareWeights(LWeight, FBestWeight) of
    0:
      FBestEndpoints.Add(AEndpoint);
    1:
      begin
        FBestEndpoints.Clear;
        FBestEndpoints.Add(AEndpoint);
        FBestWeight := LWeight;
      end;
    end;
  end;
end;

function TEMSCommonResource.TNegotiator.GetStatus: TStatus;
begin
  if FChooseCount = 0 then
    Result := TStatus.Nothing
  else if FBestEndpoints.Count = 0 then
    Result := TStatus.Failed
  else if FBestEndpoints.Count > 1 then
    Result := TStatus.Duplicates
  else
    Result := TStatus.OK;
end;

function TEMSCommonResource.TNegotiator.GetBestEndpoint: TEMSResourceEndPoint;
begin
  if FBestEndpoints.Count > 0 then
    Result := FBestEndpoints[0]
  else
    Result := nil;
end;

function TEMSCommonResource.TNegotiator.GetDuplicateNames: string;
var
  LBuilder: TStringBuilder;
  LItem: TEMSResourceEndPoint;
begin
  LBuilder := TStringBuilder.Create;
  try
    for LItem in FBestEndpoints do
    begin
      if LBuilder.Length > 0 then
        LBuilder.Append(', ');
      LBuilder.Append(LItem.Name);
    end;
    Result := LBuilder.ToString(True);
  finally
    LBuilder.Free;
  end;
end;

{ EndPointResponseDetailsAttribute }

constructor EndPointResponseDetailsAttribute.Create(const AMethod: string; ACode: Integer;
  const ADescription: string; AType: TAPIDoc.TPrimitiveType;
  AFormat: TAPIDoc.TPrimitiveFormat; const ASchema, AReference: string);
begin
  inherited Create(AMethod);
  FCode := ACode;
  FDescription := TResourceStringsTable.Get(ADescription);
  FSchema := ASchema;
  FType := AType;
  FFormat := AFormat;
  FReference := AReference;
end;

constructor EndPointResponseDetailsAttribute.Create(ACode: Integer;
  const ADescription: string; AType: TAPIDoc.TPrimitiveType;
  AFormat: TAPIDoc.TPrimitiveFormat; const ASchema, AReference: string);
begin
  Create('', ACode, ADescription, AType, AFormat, ASchema, AReference);
end;

{ EndPointRequestParameter }

constructor EndPointRequestParameterAttribute.Create(const AMethod: string;
  AIn: TAPIDocParameter.TParameterIn; const AName, ADescription: string; const ARequired: boolean;
  AType: TAPIDoc.TPrimitiveType; AFormat: TAPIDoc.TPrimitiveFormat; AItemType: TAPIDoc.TPrimitiveType;
  const AJSONScheme, AReference: string);
begin
  inherited Create(AMethod);
  FName := AName;
  FIn := AIn;
  FDescription := ADescription;
  FRequired := ARequired;
  FType := AType;
  FJSONSchema := AJSONScheme;
  FFormat := AFormat;
  FReference := AReference;
end;

constructor EndPointRequestParameterAttribute.Create(
  AIn: TAPIDocParameter.TParameterIn; const AName, ADescription: string; const ARequired: boolean;
  AType: TAPIDoc.TPrimitiveType; AFormat: TAPIDoc.TPrimitiveFormat; AItemType: TAPIDoc.TPrimitiveType;
  const AJSONScheme, AReference: string);
begin
  Create('', AIn, AName, ADescription, ARequired, AType, AFormat, AItemType, AJSONScheme, AReference);
end;

{ EndPointRequestSummary }

constructor EndPointRequestSummaryAttribute.Create(const AMethod, ATags, ASummary,
  ADescription, AProduces, AConsume: string);
begin
  inherited Create(AMethod);
  FTags := ATags;
  FSummary := TResourceStringsTable.Get(ASummary);
  FDescription := TResourceStringsTable.Get(ADescription);
  FProduces := AProduces;
  FConsume := AConsume;
end;

constructor EndPointRequestSummaryAttribute.Create(const ATags, ASummary,
  ADescription, AProduces, AConsume: string);
begin
  Create('', ATags, ASummary, ADescription, AProduces, AConsume);
end;

{ EndPointObjectsYAMLDefinitions }

constructor EndPointObjectsYAMLDefinitionsAttribute.Create(const Objects: string);
begin
  FObjects := Objects;
end;

{ EndPointObjectsJSONDefinitions }

constructor EndPointObjectsJSONDefinitionsAttribute.Create(const Objects: string);
begin
  FObjects := Objects;
end;

{ AllowAnonymousTenantAttribute }

constructor AllowAnonymousTenantAttribute.Create(const AMethod: string);
begin
  inherited Create(AMethod);
end;

constructor AllowAnonymousTenantAttribute.Create;
begin
  Create('');
end;

{ EndPointProduceAttribute }

constructor EndPointProduceAttribute.Create(const AMethod, ATypes: string);
begin
  inherited Create(AMethod);
  FTypes := ATypes;
end;

constructor EndPointProduceAttribute.Create(const ATypes: string);
begin
  Create('', ATypes);
end;

{ EndPointMethodAttribute }

constructor EndPointMethodAttribute.Create(const AMethod: string;
  const AHTTPMethod: TEndpointRequest.TMethod);
begin
  inherited Create(AMethod);
  FHTTPMethod := AHTTPMethod;
end;

constructor EndPointMethodAttribute.Create(
  const AHTTPMethod: TEndpointRequest.TMethod);
begin
  Create('', AHTTPMethod);
end;

{ TResourceStringsTable }

class constructor TResourceStringsTable.Create;
begin
  FResourcesTable := TDictionary<string, string>.Create;
end;

class destructor TResourceStringsTable.Destroy;
begin
  FResourcesTable.Free;
  inherited;
end;

class function TResourceStringsTable.Get(const Akey: string): string;
var
  LValue: string;
begin
  if FResourcesTable.TryGetValue(Akey, LValue) then
    Result := LValue
  else
    Result := Akey;
end;

class procedure TResourceStringsTable.Add(const Akey, AResource: string);
begin
  FResourcesTable.AddOrSetValue(AKey, AResource);
end;

{ TAPIDocResponse }

constructor TAPIDocResponse.Create(const AAttribute: EndPointResponseDetailsAttribute);
begin
  inherited Create;
  if AAttribute <> nil then
  begin
    FCode := AAttribute.Code;
    FDescription := TResourceStringsTable.Get(AAttribute.Description);
    FSchema := AAttribute.Schema;
    FReference := AAttribute.Reference;
    FIsReference := FReference <> '';
    FType := AAttribute.PrimitiveType;
    FFormat := AAttribute.PrimitiveFormat;
  end;
end;

function TAPIDocResponse.GetResponseInfo: TArray<string>;
var
  LStringList: TStringList;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '''' + FCode.ToString + ''':');
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + FDescription);
    if FIsReference then
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema:');
      if FType = TAPIDoc.TPrimitiveType.spArray then
      begin
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'type: ' + TAPIDoc.GetDataTypeAsString(FType));
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items:');
        LStringList.Add(StringOfChar(TAPIDoc.cBlank,10) + '$ref: ''' + FReference + '''');
      end
      else
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + '$ref: ''' + FReference + '''');
    end
    else
      if FSchema <> '' then
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema: ' + FSchema)
      else
        if FType <> TAPIDoc.TPrimitiveType.spNull  then
        begin
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema: ' + FSchema);
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'type: ' + TAPIDoc.GetDataTypeAsString(FType));
          if FFormat <> TAPIDoc.TPrimitiveFormat.None then
            LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'format: ' + TAPIDoc.GetDataTypeAsString(FFormat));
        end;

    Result := LStringList.ToStringArray;
  finally
    LStringList.Free;
  end;
end;

procedure TAPIDocResponse.WriteResponseInfo(const ABuilder: TJSONObjectBuilder);
begin
  ABuilder.ParentObject.BeginObject(FCode.ToString);
  ABuilder.ParentObject.Add('description', FDescription);

  if FIsReference then
  begin
    ABuilder.ParentObject.BeginObject('schema');
    if FType = TAPIDoc.TPrimitiveType.spArray then
    begin
      ABuilder.ParentObject.Add('type',TAPIDoc.GetDataTypeAsString(FType));
      ABuilder.ParentObject.BeginObject('items');
      ABuilder.ParentObject.Add('$ref', FReference);
      ABuilder.ParentObject.EndObject;
    end
    else
      ABuilder.ParentObject.Add('$ref', FReference);

    ABuilder.ParentObject.EndObject;
  end
  else
    if FSchema <> '' then
      ABuilder.ParentObject.Add('schema', FSchema)
    else
      if FType <> TAPIDoc.TPrimitiveType.spNull  then
      begin
        ABuilder.ParentObject.Add('schema', FSchema);
        ABuilder.ParentObject.Add('type', TAPIDoc.GetDataTypeAsString(FType));
        if FFormat <> TAPIDoc.TPrimitiveFormat.None then
          ABuilder.ParentObject.Add('format', TAPIDoc.GetDataTypeAsString(FFormat));
      end;

   ABuilder.ParentObject.EndObject;
end;

{ TAPIDocResponseHelper }

procedure TAPIDocResponseHelper.Assign(ASource: TAPIDocResponse);
begin
  FCode := ASource.FCode;
  FDescription := ASource.FDescription;
  FSchema := ASource.FSchema;
  FIsReference := ASource.FIsReference;
  FReference := ASource.FReference;
  FType := ASource.FType;
  FFormat := ASource.FFormat;
  FExamples := ASource.FExamples;
  FRef := ASource.FRef;
end;

{ TAPIDocParameter }

constructor TAPIDocParameter.Create(const AAttribute: EndPointRequestParameterAttribute);
var
  LJSONObject: TJSONObject;
begin
  inherited Create;
  if AAttribute <> nil then
  begin
    FIn := AAttribute.ParamIn;
    FName := AAttribute.Name;
    FDescription := TResourceStringsTable.Get(AAttribute.Description);
    FType := AAttribute.ParamType;
    FItemType := AAttribute.ItemType;
    FFormat := AAttribute.ItemFormat;
    FRequired := AAttribute.Required;
    LJSONObject := TJSONObject.ParseJSONValue(AAttribute.JSONSchema) as TJSONObject;
    if LJSONObject <> nil then
    begin
      FSchema := AAttribute.JSONSchema;
      LJSONObject.Free;
    end;
    FReference := AAttribute.Reference;
    FIsReference := FReference <> '';
  end;
end;

function TAPIDocParameter.GetName: string;
begin
  if FName = TAPIDoc.cStar then
    Result := TAPIDoc.ReplaceStar(FName)
  else
    Result := FName;
end;

function TAPIDocParameter.GetParamAsString: string;
begin
  if FIn = TParameterIn.formData then
    Result := 'formData'
  else
    Result := GetEnumName(TypeInfo(TParameterIn), integer(FIn)).ToLower;
end;

function TAPIDocParameter.GetParamInfo: TArray<string>;
var
  LStringList: TStringList;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- in: ' + GetParamAsString);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'name: ' + GetName);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + FDescription);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'required: ' + FRequired.ToString(TUseBoolStrs.True).ToLower);
    if FIn = TParameterIn.Body  then
    begin
      if FType = TAPIDoc.TPrimitiveType.spObject then
      begin
        if FIsReference then
        begin
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema:');
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + '$ref: ''' + FReference + '''');
        end
        else
          if FSchema <> '' then
            LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema: ' + FSchema)
          else
          begin
            LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema:');
            LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'type: object');
            LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'additionalProperties: true');
          end;
      end
      else if FType = TAPIDoc.TPrimitiveType.spArray then
      begin
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema:');
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'type: ' + TAPIDoc.GetDataTypeAsString(FType));
        if FIsReference then
        begin
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items:');
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 10) + '$ref: ''' + FReference + '''');
        end
        else if FSchema = '' then
        begin
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items:');
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 10) + 'type: ' + TAPIDoc.GetDataTypeAsString(FItemType));
        end
        else
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items: ' + FSchema);
      end
      else
      begin
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema:');
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'type: ' + TAPIDoc.GetDataTypeAsString(FType));
      end;
    end
    else
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'type: ' + TAPIDoc.GetDataTypeAsString(FType));
      if FType = TAPIDoc.TPrimitiveType.spArray then
      begin
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'schema:');
        if FIsReference then
        begin
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items:');
          LStringList.Add(StringOfChar(TAPIDoc.cBlank,10) + '$ref: ' + FReference)
        end
        else if FSchema = '' then
        begin
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items:');
          LStringList.Add(StringOfChar(TAPIDoc.cBlank,10) + 'type: ' + TAPIDoc.GetDataTypeAsString(FItemType));
        end
        else
          LStringList.Add(StringOfChar(TAPIDoc.cBlank, 8) + 'items: ' + FSchema);
      end
      else if FFormat <> TAPIDoc.TPrimitiveFormat.None then
        LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'format: ' + TAPIDoc.GetDataTypeAsString(FFormat));
    end;
    // if TAPIDoc.TPrimitiveType.spFile consumes MUST be either "multipart/form-data" or " application/x-www-form-urlencoded"
    //and the parameter MUST be in "formData".
    Result := LStringList.ToStringArray;
  finally
    LStringList.Free;
  end;
end;

procedure TAPIDocParameter.WriteParamInfo(const ABuilder: TJSONObjectBuilder);
begin
  ABuilder.ParentArray.BeginObject;
  ABuilder.ParentObject.Add('in', GetParamAsString);
  ABuilder.ParentObject.Add('name', GetName);
  ABuilder.ParentObject.Add('description', FDescription);
  ABuilder.ParentObject.Add('required', FRequired);

  if FIn = TParameterIn.Body  then
  begin
    if FType = TAPIDoc.TPrimitiveType.spObject then
    begin
      if FIsReference then
      begin
        ABuilder.ParentObject.BeginObject('schema');
        ABuilder.ParentObject.Add('$ref', FReference);
        ABuilder.ParentObject.EndObject;
      end
      else
        if FSchema <> '' then
          ABuilder.ParentObject.Add('schema', FSchema)
        else
        begin
          ABuilder.ParentObject.BeginObject('schema');
          ABuilder.ParentObject.EndObject;
        end;
    end
    else if FType = TAPIDoc.TPrimitiveType.spArray then
    begin
      ABuilder.ParentObject.BeginObject('schema');
      ABuilder.ParentObject.Add('type', TAPIDoc.GetDataTypeAsString(FType));
      if FIsReference then
      begin
        ABuilder.ParentObject.BeginObject('items');
        ABuilder.ParentObject.Add('$ref', FReference);
        ABuilder.ParentObject.EndObject;
      end
      else if FSchema = '' then
      begin
        ABuilder.ParentObject.BeginObject('items');
        ABuilder.ParentObject.Add('type', TAPIDoc.GetDataTypeAsString(FItemType));
        ABuilder.ParentObject.EndObject;
      end
      else
        ABuilder.ParentObject.Add('items', FSchema);
      ABuilder.ParentObject.EndObject
    end
    else
    begin
      ABuilder.ParentObject.BeginObject('schema');
      ABuilder.ParentObject.Add('type', TAPIDoc.GetDataTypeAsString(FType));
      ABuilder.ParentObject.EndObject;
    end;
  end
  else
  begin
    ABuilder.ParentObject.Add('type', TAPIDoc.GetDataTypeAsString(FType));
    if FType = TAPIDoc.TPrimitiveType.spArray then
    begin
      ABuilder.ParentObject.BeginObject('schema');
      if FIsReference then
      begin
        ABuilder.ParentObject.BeginObject('items');
        ABuilder.ParentObject.Add('$ref', FReference);
        ABuilder.ParentObject.EndObject;
      end
      else if FSchema = '' then
      begin
        ABuilder.ParentObject.BeginObject('items');
        ABuilder.ParentObject.Add('type', TAPIDoc.GetDataTypeAsString(FItemType));
        ABuilder.ParentObject.EndObject;
      end
      else
        ABuilder.ParentObject.Add('items', FSchema);
      ABuilder.ParentObject.EndObject
    end
    else if FFormat <> TAPIDoc.TPrimitiveFormat.None then
      ABuilder.ParentObject.Add('format', TAPIDoc.GetDataTypeAsString(FFormat));
  end;

  // if TAPIDoc.TPrimitiveType.spFile consumes MUST be either "multipart/form-data" or " application/x-www-form-urlencoded"
  //and the parameter MUST be in "formData".
  ABuilder.ParentObject.EndObject;
end;

{ TAPIDocParameterHelper }

procedure TAPIDocParameterHelper.Assign(ASource: TAPIDocParameter);
begin
  FName := ASource.FName;
  FIn := ASource.FIn;
  FDescription := ASource.FDescription;
  FRequired := ASource.FRequired;
  FIsReference := ASource.FIsReference;
  FType := ASource.FType;
  FItemType := ASource.FItemType;
  FFormat := ASource.FFormat;
  FSchema := ASource.FSchema;
  FReference := ASource.FReference;
end;

{ TAPIDocMethod }

constructor TAPIDocPathItem.Create(AHTTPMethod: TEndpointRequest.TMethod; const AOperationID: string;
  const AAttribute: EndPointRequestSummaryAttribute; const AAPIDocResponses: TArray<TAPIDocResponse>;
  const AAPIDocParameters: TArray<TAPIDocParameter>);
var
  LDefOkResp: EndPointResponseDetailsAttribute;
  LParam: TAPIDocParameter;
  i: Integer;
begin
  inherited Create;
  FVerb := AHTTPMethod;
  FOperationId := AOperationID;
  if AAttribute <> nil then
  begin
    FTags := AAttribute.Tags;
    FSummary := TResourceStringsTable.Get(AAttribute.Summary);
    FDescription := TResourceStringsTable.Get(AAttribute.Description);
    FProduces := AAttribute.Produces;
    FConsumes := AAttribute.Consume;
  end;
  if Length(AAPIDocResponses) = 0 then
  begin
    LDefOkResp := EndPointResponseDetailsAttribute.Create(200, 'Ok',
      TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '');
    try
      FResponses := [TAPIDocResponse.Create(LDefOkResp)];
    finally
      LDefOkResp.Free;
    end;
  end
  else
  begin
    SetLength(FResponses, Length(AAPIDocResponses));
    for i := 0 to Length(AAPIDocResponses) - 1 do
    begin
      FResponses[i] := TAPIDocResponse.Create(nil);
      FResponses[i].Assign(AAPIDocResponses[i]);
    end;
  end;
  SetLength(FParameters, Length(AAPIDocParameters));
  for i := 0 to Length(AAPIDocParameters) - 1 do
  begin
    FParameters[i] := TAPIDocParameter.Create(nil);
    FParameters[i].Assign(AAPIDocParameters[i]);
  end;
end;

destructor TAPIDocPathItem.Destroy;
var
  I: Integer;
begin
  for I := Low(FParameters) to High(FParameters) do
    if FParameters[I] <> nil then
      FParameters[I].Free;
  for I := Low(FResponses) to High(FResponses) do
    if FResponses[I] <> nil then
      FResponses[I].Free;
  inherited Destroy;
end;

function TAPIDocPathItem.GetAuthoritationHeaderParams: TArray<string>;
var
  LStringList: TStringList;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- in: header');
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + sAuthHeaderDesc);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'name: ' + TAPIDocPathItem.ApplicationId);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'type: string');

    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- in: header');
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + sAuthHeaderDesc);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'name: ' + TAPIDocPathItem.AppSecret);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'type: string');

    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- in: header');
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + sAuthHeaderDesc);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'name: ' + TAPIDocPathItem.MasterSecret);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'type: string');

    if TEMSEndpointEnvironment.Instance.MultiTenantMode then
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- in: header');
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + sAuthHeaderDesc);
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'name: ' + TAPIDocPathItemTenantId);
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'type: string');

      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- in: header');
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'description: ' + sAuthHeaderDesc);
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'name: ' + TAPIDocPathItemTenantSecret);
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 6) + 'type: string');
    end;

    Result := LStringList.ToStringArray;
  finally
    LStringList.Free;
  end;
end;

function TAPIDocPathItem.GetMethodInfo: TArray<string>;
var
  LAPIDocResponse: TAPIDocResponse;
  LAPIDocParameter: TAPIDocParameter;
  LStringList: TStringList;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add('  ' + GetEnumName(TypeInfo(TEndpointRequest.TMethod), integer(FVerb)).ToLower + ':');
    if FTags <> '' then
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'tags:');
      LStringList.Add('    - ' + FTags);
    end;
    if FSummary <> '' then
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'summary: ''' + FSummary + '''');
    if FDescription <> '' then
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'description: ' + FDescription );
    if FOperationId <> '' then
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'operationId: ' + FOperationId );
    if FProduces <> '' then
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'produces:');
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- ' + FProduces);
    end;
    if FConsumes <> '' then
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'consumes:');
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 4) + '- ' + FConsumes);
    end;
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'parameters:');
    LStringList.AddStrings(GetAuthoritationHeaderParams);
    if Length(FParameters) > 0 then
      for LAPIDocParameter in FParameters do
        LStringList.AddStrings(LAPIDocParameter.GetParamInfo);
    if Length(FResponses) > 0 then
    begin
      LStringList.Add(StringOfChar(TAPIDoc.cBlank, 3) + 'responses:');
      for LAPIDocResponse in FResponses do
        LStringList.AddStrings(LAPIDocResponse.GetResponseInfo);
    end
    else
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
        'No Responses defined for: ' +
        GetEnumName(TypeInfo(TEndpointRequest.TMethod), integer(FVerb)).ToLower + ' ' +  FSummary);
  //TO-DO
//    LStringList.Add(StringOfChar(cBlank, 3) + 'security:');
//    LStringList.Add(StringOfChar(cBlank, 4) + '- ' + ': []');
//    LStringList.Add(StringOfChar(cBlank, 4) + '- ' + ': []');
//    LStringList.Add(StringOfChar(cBlank, 4) + '- ' + ': []');
//securityDefinitions:
//  api_key:
//    type: apiKey
//    name: api_key
//    in: header

    Result := LStringList.ToStringArray;
  finally
    LStringList.Free;
  end;
end;

procedure TAPIDocPathItem.WriteAuthoritationHeaderParams(const ABuilder: TJSONObjectBuilder);
begin
  ABuilder.ParentArray.BeginObject;
  ABuilder.ParentObject.Add('in', 'header');
  ABuilder.ParentObject.Add('name', TAPIDocPathItem.ApplicationId);
  ABuilder.ParentObject.Add('type', 'string');
  ABuilder.ParentObject.EndObject;

  ABuilder.ParentArray.BeginObject;
  ABuilder.ParentObject.Add('in', 'header');
  ABuilder.ParentObject.Add('name', TAPIDocPathItem.AppSecret);
  ABuilder.ParentObject.Add('type', 'string');
  ABuilder.ParentObject.EndObject;

  ABuilder.ParentArray.BeginObject;
  ABuilder.ParentObject.Add('in', 'header');
  ABuilder.ParentObject.Add('name', TAPIDocPathItem.MasterSecret);
  ABuilder.ParentObject.Add('type', 'string');
  ABuilder.ParentObject.EndObject;

  if TEMSEndpointEnvironment.Instance.MultiTenantMode then
  begin
    ABuilder.ParentArray.BeginObject;
    ABuilder.ParentObject.Add('in', 'header');
    ABuilder.ParentObject.Add('name', TAPIDocPathItemTenantId);
    ABuilder.ParentObject.Add('type', 'string');
    ABuilder.ParentObject.EndObject;

    ABuilder.ParentArray.BeginObject;
    ABuilder.ParentObject.Add('in', 'header');
    ABuilder.ParentObject.Add('name', TAPIDocPathItemTenantSecret);
    ABuilder.ParentObject.Add('type', 'string');
    ABuilder.ParentObject.EndObject;
  end;
end;

procedure TAPIDocPathItem.WriteMethodInfo(const ABuilder: TJSONObjectBuilder);
var
  LAPIDocParameter: TAPIDocParameter;
  LAPIDocResponse: TAPIDocResponse;
begin
  ABuilder.ParentObject.BeginObject(GetEnumName(TypeInfo(TEndpointRequest.TMethod), Integer(FVerb)).ToLower);

  if FTags <> '' then
  begin
    ABuilder.ParentObject.BeginArray('tags');
    ABuilder.ParentArray.Add(FTags);
    ABuilder.ParentArray.EndArray;
  end;

  if FSummary <> '' then
    ABuilder.ParentObject.Add('summary', FSummary);
  if FDescription <> '' then
    ABuilder.ParentObject.Add('description', FDescription);
  if FOperationId <> '' then
    ABuilder.ParentObject.Add('operationId', FOperationId);

  if FProduces <> '' then
  begin
    ABuilder.ParentObject.BeginArray('produces');
    ABuilder.ParentArray.Add(FProduces);
    ABuilder.ParentArray.EndArray;
  end;

  if FConsumes <> '' then
  begin
    ABuilder.ParentObject.BeginArray('consumes');
    ABuilder.ParentArray.Add(FProduces);
    ABuilder.ParentArray.EndArray;
  end;

  ABuilder.ParentObject.BeginArray('parameters');
  WriteAuthoritationHeaderParams(ABuilder);
  if Length(FParameters) > 0 then
    for LAPIDocParameter in FParameters do
      LAPIDocParameter.WriteParamInfo(ABuilder);
  ABuilder.ParentArray.EndArray;

  if Length(FResponses) > 0 then
  begin
    ABuilder.ParentObject.BeginObject('responses');
    for LAPIDocResponse in FResponses do
      LAPIDocResponse.WriteResponseInfo(ABuilder);
    ABuilder.ParentObject.EndObject;
  end
  else
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
      'No Responses defined for: ' +
      GetEnumName(TypeInfo(TEndpointRequest.TMethod), integer(FVerb)).ToLower + ' ' +  FSummary);

//TO-DO
//securityDefinitions:
//  api_key:
//    type: apiKey
//    name: api_key
//    in: header

  ABuilder.ParentObject.EndObject;
end;

{ TAPIDocPath }

constructor TAPIDocPath.Create(const APath, AResourceName: string);
begin
  inherited Create;
  FPath := APath;
  FResourceName := AResourceName;
  FPathItems := TObjectList<TAPIDocPathItem>.Create;
end;

destructor TAPIDocPath.Destroy;
begin
  FPathItems.Free;
  inherited Destroy;
end;

function TAPIDocPath.AddPathItem(const AAPIDocPathItem: TAPIDocPathItem): Boolean;
begin
  Result := FPathItems.Add(AAPIDocPathItem) <> -1;
end;

function TAPIDocPath.GetPath: string;
begin
  if FPath.EndsWith(TAPIDoc.cStar) then
    Result := TAPIDoc.ReplaceStar(FPath, True)
  else
    Result := FPath;
end;

function TAPIDocPath.GetPathInfo: TArray<string>;
var
  LMethod: TAPIDocPathItem;
  LStringList: TStringList;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add(' ' + GetPath + ':');
    if FPathItems.Count > 0 then
      for LMethod in FPathItems do
        LStringList.AddStrings(LMethod.GetMethodInfo)
    else
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
        'No Verbs defined for ' + FPath);

    Result := LStringList.ToStringArray;
  finally
    LStringList.Free;
  end;
end;

function TAPIDocPath.GetPAthItems: TArray<TAPIDocPathItem>;
begin
  Result := FPathItems.ToArray;
end;

procedure TAPIDocPath.WritePathInfo(const ABuilder: TJSONObjectBuilder);
var
  LMethod: TAPIDocPathItem;
begin
  if FPathItems.Count > 0 then
  begin
    ABuilder.ParentObject.BeginObject(GetPath);
    for LMethod in FPathItems do
      LMethod.WriteMethodInfo(ABuilder);
    ABuilder.ParentObject.EndObject;
  end
  else
    EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
      'No Verbs defined for ' + FPath);
end;

{ TAPIDoc }

// Minimum structure
//
//---
//swagger: '2.0'
//info:
//  version: 0.0.0
//  title: Simple API
//paths:
//  /:
//    get:
//      responses:
//        200:
//          description: OK

constructor TAPIDoc.Create(const AHost, ABasePath: string);
begin
  inherited Create;
  FSwaggerVersion := sSwaggerVersion;
  FInfo := TAPIDocInfo.Create(sEMSMetaDataVersion, sEMSMetaDataTitle, sEMSMetaDataDescription);
  FHost := AHost;

  if not ABasePath.StartsWith('/') then
    FBasePath := '/' + ABasePath
  else
    FBasePath := ABasePath;

  FPaths := TList<TAPIDocPath>.Create;
end;

destructor TAPIDoc.Destroy;
begin
  // TAPIDoc.FPaths does not own TAPIDocPath's. They are owned by TEMSTypeInfoResource.
  FPaths.Free;
  inherited Destroy;
end;

function TAPIDoc.AddPath(const AAPIDocPath: TAPIDocPath): Boolean;
begin
  Result := FPaths.Add(AAPIDocPath) <> -1;
end;

procedure TAPIDoc.WriteAPIDocJson(const AWriter: TJsonTextWriter);
var
  LBuilderObject: TJSONObjectBuilder;
  I: integer;
begin
  LBuilderObject := TJSONObjectBuilder.Create(AWriter);
  try
    LBuilderObject.BeginObject;
    LBuilderObject.ParentObject.Add('swagger', FSwaggerVersion);

    LBuilderObject.ParentObject.BeginObject('info');
    LBuilderObject.ParentObject.Add('version', FInfo.Version);
    LBuilderObject.ParentObject.Add('title', FInfo.Title);
    LBuilderObject.ParentObject.Add('description', FInfo.Description);
    LBuilderObject.ParentObject.EndObject;

    LBuilderObject.ParentObject.Add('host', FHost);
    LBuilderObject.ParentObject.Add('basePath', FBasePath);

    LBuilderObject.ParentObject.BeginArray('schemes');
    LBuilderObject.ParentArray.Add('http');
    LBuilderObject.ParentArray.EndArray;

// TO-DO
//  //    termsOfService: http://helloreverb.com/terms/
//  //    contact:
//  //      name:
//  //      url:
//  //      email:
//  //    license:
//  //      name: Apache 2.0
//  //      url: http://www.domain.com/licenses/LICENSE-2.0.html

    if FPaths.Count > 0 then
    begin
      LBuilderObject.ParentObject.BeginObject('paths');
      for I := 0 to FPaths.Count - 1 do
        FPaths[I].WritePathInfo(LBuilderObject);
      LBuilderObject.ParentObject.EndObject;
    end
    else
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
        'No Paths defined');

    if FDefinitions <> '' then
    begin
      AWriter.WritePropertyName('definitions');
      WriteJsonDefinitions('{' + FDefinitions + '}', AWriter);
    end;

    LBuilderObject.ParentObject.EndObject;
  finally
    LBuilderObject.Free;
  end;
end;

procedure TAPIDoc.WriteJsonDefinitions(const ADefinitions: string; const AJSONWriter: TJSONWriter);
var
  LJSONReader: TJsonTextReader;
  LStringReader: TStringReader;
begin
  LStringReader := TStringReader.Create(ADefinitions);
  LJSONReader := TJsonTextReader.Create(LStringReader);
  try
    AJSONWriter.WriteToken(LJSONReader);
  finally
    LJSONReader.Free;
    LStringReader.Free;
  end;
end;

function TAPIDoc.GetAPIDocYaml: string;
var
  I: integer;
  LStringList: TStringList;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add('---');
    LStringList.Add('swagger: ' +  '''' + FSwaggerVersion + '''');
    LStringList.Add('info:');
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 1) + 'version: ' + FInfo.Version);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 1) + 'title: ' + FInfo.Title);
    LStringList.Add(StringOfChar(TAPIDoc.cBlank, 1) + 'description: ' +  '|' +  sLineBreak + StringOfChar(cBlank, 2) + FInfo.Description);
    LStringList.Add('host: ' + FHost);
    LStringList.Add('basePath: ' + FBasePath);
    LStringList.Add('schemes:' +  sLineBreak + StringOfChar(cBlank, 1) + '- http');
// TO-DO
//    LStringList.Add(StringOfChar(cBlank, 1) + 'termsOfService: ' );
//    LStringList.Add(StringOfChar(cBlank, 1) + 'contact: ' );
//    LStringList.Add(StringOfChar(cBlank, 2) + 'name: ' );
//    LStringList.Add(StringOfChar(cBlank, 2) + 'url: ' );
//    LStringList.Add(StringOfChar(cBlank, 2) + 'email: ' );
//    LStringList.Add(StringOfChar(cBlank, 1) + 'license: ' );
//    LStringList.Add(StringOfChar(cBlank, 2) + 'name: ' );
//    LStringList.Add(StringOfChar(cBlank, 2) + 'url: ' );
  //    termsOfService: http://helloreverb.com/terms/
  //    contact:
  //      name:
  //      url:
  //      email:
  //    license:
  //      name: Apache 2.0
  //      url: http://www.domain.com/licenses/LICENSE-2.0.html
    if FPaths.Count > 0 then
    begin
      LStringList.Add('paths:');
      for I := 0 to FPaths.Count - 1 do
        LStringList.AddStrings(FPaths[I].GetPathInfo);
    end
    else
      EEMSHTTPError.RaiseError(500, sResourceErrorMessage,
        'No Paths defined');

    if FDefinitions <> '' then
      LStringList.Add('definitions:' +  sLineBreak + FDefinitions);

    Result := LStringList.Text;
  finally
    LStringList.Free;
  end;
end;

class function TAPIDoc.GetDataTypeAsString(AType: TAPIDoc.TPrimitiveType): string;
begin
  Result := GetEnumName(TypeInfo(TAPIDoc.TPrimitiveType), integer(AType)).ToLower;
  Result := StringReplace(Result, 'sp', '',[]);
end;

function TAPIDoc.GetPaths: TArray<TAPIDocPath>;
begin
  Result := FPaths.ToArray;
end;

class function TAPIDoc.ReplaceStar(AItem: string; IsPath: Boolean): string;
begin
  if IsPath then
    Result := AItem.Replace(cStar, '{' + cWildCard + '}')
  else
    Result := AItem.Replace(cStar, cWildCard);
end;

procedure TAPIDoc.SortPaths;
begin
  FPaths.Sort(TComparer<TAPIDocPath>.Construct(
    function (const L, R: TAPIDocPath): Integer
    var
      LRes: Integer;
    begin
      LRes := CompareStr(L.Path, R.Path);
      if LRes = 0 then
        Result := 0
      else if Pos(L.Path, R.Path) > 0 then
        Result := -1
      else if Pos(R.Path, L.Path) > 0 then
        Result := 1
      else
        Result := LRes;
    end
  ));
end;

class function TAPIDoc.GetDataTypeAsString(AType: TAPIDoc.TPrimitiveFormat): string;
begin
  if AType = TAPIDoc.TPrimitiveFormat.DateTime then
    Result := 'date-time'
  else
    Result := GetEnumName(TypeInfo(TAPIDoc.TPrimitiveFormat), integer(AType)).ToLower;
end;

{ TAPIDoc.TAPIDocLicenseInfo }

constructor TAPIDoc.TAPIDocLicenseInfo.Create(const AName, AURL: string);
begin
  FName := AName;
  FURL := AURL;
end;

{ TAPIDoc.TAPIDocContactInfo }

constructor TAPIDoc.TAPIDocContactInfo.Create(const AName, AURL, AEmail: string);
begin
  FName := AName;
  FURL := AURL;
  FEmail := Email;
end;

{ TAPIDoc.TAPIDocInfo }

constructor TAPIDoc.TAPIDocInfo.Create(const AVersion, ATitle, ADescription: string);
begin
  FVersion := AVersion;
  FTitle := ATitle;
  FDescription := ADescription;
//  FTermsOfUse := ATermsOfUse;
//  FContact := AContact;
//  FLicense := ALicense
end;

initialization
  EMSLoggingResourceFunc := @LogResource;

finalization
  EMSLoggingResourceFunc := nil;

end.
