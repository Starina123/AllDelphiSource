{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2016-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.JSON.Serializers;

interface

uses System.SysUtils, System.TypInfo, System.Rtti, System.Classes, System.Generics.Collections,
  System.JSON.Types, System.JSON.Writers, System.JSON.Readers;

{$SCOPEDENUMS ON}

type
  EJsonSerializationException = class(Exception) end;
  TJsonMemberSerialization = (Fields, &Public, &In);
  TJsonObjectHandling = (Auto, Reuse, Replace);
  TJsonObjectOwnership = (Auto, Owned, NotOwned);

  // --------------------------------------------------------------------- //
  // Custom Attributes
  // --------------------------------------------------------------------- //

  // attributes allowed on types, fields and properties
  JsonConverterAttribute = class(TCustomAttribute)
  private
    FValue: TClass;
  public
    constructor Create(const AValue: TClass);
    property Value: TClass read FValue;
  end;

  JsonIgnoreAttribute = class(TCustomAttribute) end;

  // attributes ONLY allowed on fields and properties
  JsonNameAttribute = class(TCustomAttribute)
  private
    FValue: string;
  public
    constructor Create(const AValue: string);
    property Value: string read FValue;
  end;

  JsonInAttribute = class(TCustomAttribute) end;

  JsonObjectHandlingAttribute = class(TCustomAttribute)
  private
    FValue: TJsonObjectHandling;
  public
    constructor Create(const AValue: TJsonObjectHandling);
    property Value: TJsonObjectHandling read FValue;
  end;

  JsonObjectOwnership = class(TCustomAttribute)
  private
    FValue: TJsonObjectOwnership;
  public
    constructor Create(const AValue: TJsonObjectOwnership);
    property Value: TJsonObjectOwnership read FValue;
  end;

  // attributes ONLY allowed on types
  JsonSerializeAttribute = class(TCustomAttribute)
  private
    FValue: TJsonMemberSerialization;
  public
    constructor Create(AValue: TJsonMemberSerialization);
    property Value: TJsonMemberSerialization read FValue;
  end;

  // --------------------------------------------------------------------- //
  // Converter
  // --------------------------------------------------------------------- //

  TJsonSerializer = class;

  TJsonConverter = class
  public
    function CanConvert(ATypeInf: PTypeInfo): Boolean; virtual; abstract;
    function CanRead: Boolean; virtual;
    function CanWrite: Boolean; virtual;
    function ReadJson(const AReader: TJsonReader; ATypeInf: PTypeInfo; const AExistingValue: TValue;
      const ASerializer: TJsonSerializer): TValue; virtual; abstract;
    procedure WriteJson(const AWriter: TJsonWriter; const AValue: TValue;
      const ASerializer: TJsonSerializer); virtual; abstract;
  end;

  // --------------------------------------------------------------------- //
  // Instance Creator
  // --------------------------------------------------------------------- //

  IJsonCreator = interface
    function Invoke(const Params: array of TValue): TValue;
  end;

  TJsonObjectCreator = class(TInterfacedObject, IJsonCreator)
  private
    FMetaClass: TClass;
    FConstructor: TRttiMethod;
  public
    constructor Create(const AMetaClass: TClass; const AConstructor: TRttiMethod);
    function Invoke(const Params: array of TValue): TValue;
  end;

  TJsonRecordCreator = class(TInterfacedObject, IJsonCreator)
  private
    FTypeInf: PTypeInfo;
    FParametrizedConstructor: TRttiMethod;
  public
    constructor Create(ATypeInf: PTypeInfo; const AParametrizedConstructor: TRttiMethod = nil);
    function Invoke(const Params: array of TValue): TValue;
  end;

  // --------------------------------------------------------------------- //
  // Attribute Providers
  // --------------------------------------------------------------------- //

  IJsonAttributeProvider = interface
    function GetAttribute(const AAttributeClass: TClass; AInherit: Boolean = False): TCustomAttribute;
  end;

  TAttrKey = TPair<TRttiObject, TClass>;

  TJsonInlineAttributes = class
  private
    class var FCachedObjects: TDictionary<TRttiObject, Boolean>;
    class var FAttributes: TDictionary<TAttrKey, TCustomAttribute>;
    class procedure LoadAttributes(const ARttiObject: TRttiObject); static;
  public
    class constructor Create;
    class destructor Destroy;
    class function GetAttribute(const ARttiObject: TRttiObject; const AAttributeClass: TClass; AInherit: Boolean = False): TCustomAttribute; static;
  end;

  TJsonDynamicAttributes = class
  private
    FAttributes: TObjectDictionary<TAttrKey, TCustomAttribute>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure AddAttribute(const ARttiObject: TRttiObject; const AAttribute: TCustomAttribute);
    function GetAttribute(const ARttiObject: TRttiObject; const AAttributeClass: TClass; AInherit: Boolean = False): TCustomAttribute;
  end;

  TJsonInlineAttributeProvider = class(TInterfacedObject, IJsonAttributeProvider)
  private
    FRttiObject: TRttiObject;
  public
    constructor Create(const ARttiObject: TRttiObject);
    function GetAttribute(const AAttributeClass: TClass; AInherit: Boolean): TCustomAttribute;
  end;

  TJsonDynamicAttributeProvider = class(TInterfacedObject, IJsonAttributeProvider)
  private
    FRttiObject: TRttiObject;
    FDynamicAttributes: TJsonDynamicAttributes;
  public
    constructor Create(const ARttiObject: TRttiObject; const ADynamicAttributes: TJsonDynamicAttributes);
    function GetAttribute(const AttrClass: TClass; AInherit: Boolean = False): TCustomAttribute;
  end;

  // --------------------------------------------------------------------- //
  // Value Providers
  // --------------------------------------------------------------------- //

  IJsonValueProvider = interface
    function GetValue(const AInstance: TValue): TValue;
    procedure SetValue(const AInstance: TValue; const Value: TValue);
  end;

  TJsonValueProvider = class(TInterfacedObject, IJsonValueProvider)
  private
    function InternalGetValue(const AInstance: Pointer): TValue; virtual; abstract;
    procedure InternalSetValue(const AInstance: Pointer; const AValue: TValue); virtual; abstract;
  public
    function GetValue(const AInstance: TValue): TValue;
    procedure SetValue(const AInstance: TValue; const AValue: TValue);
  end;

  TJsonFieldValueProvider = class(TJsonValueProvider)
  private
    FRttiField: TRttiField;
    function InternalGetValue(const AInstance: Pointer): TValue; override;
    procedure InternalSetValue(const AInstance: Pointer; const AValue: TValue); override;
  public
    constructor Create(const ARttiField: TRttiField);
  end;

  TJsonPropertyValueProvider = class(TJsonValueProvider)
  private
    FRttiProperty: TRttiProperty;
    function InternalGetValue(const AInstance: Pointer): TValue; override;
    procedure InternalSetValue(const AInstance: Pointer; const AValue: TValue); override;
  public
    constructor Create(const ARttiProperty: TRttiProperty);
  end;

  // --------------------------------------------------------------------- //
  // Contracts
  // --------------------------------------------------------------------- //

  TJsonContractType = (&Object, &Class, &Array, Primitive, Converter);

  TJsonContract = class abstract
  private
    FConverter: TJsonConverter;
    FTypeInf: PTypeInfo;
    FIgnored: Boolean;
    FIsReference: Boolean;
    FContractType: TJsonContractType;
    FAttributeProvider: IJsonAttributeProvider;
    FSealed: Boolean;
  public
    constructor Create(ATypeInf: PTypeInfo);
    property Converter: TJsonConverter read FConverter write FConverter;
    property ContractType: TJsonContractType read FContractType;
    property Ignored: Boolean read FIgnored write FIgnored;
    property IsReference: Boolean read FIsReference write FIsReference;
    property TypeInf: PTypeInfo read FTypeInf;
    property AttributeProvider: IJsonAttributeProvider read FAttributeProvider write FAttributeProvider;
    property &Sealed: Boolean read FSealed write FSealed;
  end;

  TJsonPrimitiveKind = (&Int8, &UInt8, &Int16, &UInt16, &Int32, &UInt32, &Int64, &UInt64, &Single, &Double, &Extended,
    &Comp, &Currency, &String, &Char, &Boolean, &Enumeration, &Set, &DateTime);

  TJsonPrimitiveContract = class(TJsonContract)
  private
    FKind: TJsonPrimitiveKind;
  public
    constructor Create(ATypeInf: PTypeInfo; AKind: TJsonPrimitiveKind);
    property Kind: TJsonPrimitiveKind read FKind;
  end;

  TJsonProperty = class;

  TJsonObjectContract = class(TJsonContract)
  private
    FProperties: TObjectList<TJsonProperty>;
    FMemberSerialization: TJsonMemberSerialization;
    FDefaultCreator: IJsonCreator;
    //FOverridedCreator: IJsonCreator;
  public
    constructor Create(ATypeInf: PTypeInfo);
    destructor Destroy; override;
    function GetClosestMatchProperty(const AName: string): TJsonProperty;
    property Properties: TObjectList<TJsonProperty> read FProperties;
    property MemberSerialization: TJsonMemberSerialization read FMemberSerialization write FMemberSerialization;
    property DefaultCreator: IJsonCreator read FDefaultCreator write FDefaultCreator;
    //property OverridedCreator: IJsonCreator read FOverridedCreator write FOverridedCreator;
  end;

  TJsonArrayContract = class(TJsonContract)
  private
    FItemContract: TJsonContract;
    function GetArrayType: PTypeInfo;
  public
    constructor Create(ATypeInf: PTypeInfo);
    property ArrayType: PTypeInfo read GetArrayType;
    property ItemContract: TJsonContract read FItemContract write FItemContract;
  end;

  TJsonClassContract = class(TJsonContract)
  public
    constructor Create(ATypeInf: PTypeInfo);
    function ResolveClassByName(const Name: string): TClass;
  end;

  TJsonConverterContract = class(TJsonContract)
  public
    constructor Create(ATypeInf: PTypeInfo);
  end;

  // --------------------------------------------------------------------- //
  // Object Contract Properties
  // --------------------------------------------------------------------- //

  TJsonProperty = class
  private
    FContract: TJsonContract;
    FConverter: TJsonConverter;
    FIgnored: Boolean;
    FName: string;
    FParentType: PTypeInfo;
    FReadable: Boolean;
    FTypeInf: PTypeInfo;
    FWritable: Boolean;
    FValueProvider: IJsonValueProvider;
    FAttributeProvider: IJsonAttributeProvider;
    FObjectHandling: TJsonObjectHandling;
    FObjectOwnership: TJsonObjectOwnership;
    FUnderlyingName: string;
  public
    property TypeInf: PTypeInfo read FTypeInf write FTypeInf;
    property Contract: TJsonContract read FContract write FContract;
    property Converter: TJsonConverter read FConverter write FConverter;
    property Ignored: Boolean read FIgnored write FIgnored;
    property Name: string read FName write FName;
    property ParentType: PTypeInfo read FParentType write FParentType;
    property Readable: Boolean read FReadable write FReadable;
    property Writable: Boolean read FWritable write FWritable;
    property ValueProvider: IJsonValueProvider read FValueProvider write FValueProvider;
    property AttributeProvider: IJsonAttributeProvider read FAttributeProvider write FAttributeProvider;
    property ObjectHandling: TJsonObjectHandling read FObjectHandling write FObjectHandling;
    property ObjectOwnership: TJsonObjectOwnership read FObjectOwnership write FObjectOwnership;
    property UnderlyingName: string read FUnderlyingName write FUnderlyingName;
  end;

  // --------------------------------------------------------------------- //
  // Contract resolvers
  // --------------------------------------------------------------------- //

  IJsonContractResolver = interface
    function ResolveContract(ATypeInf: PTypeInfo): TJsonContract;
  end;

  TJsonDefaultContractResolver = class(TInterfacedObject, IJsonContractResolver)
  protected
    FDefaultMemberSerialization: TJsonMemberSerialization;
    FCachedAttributeConverters: TDictionary<TClass, TJsonConverter>;
    FCachedContracts: TObjectDictionary<PTypeInfo, TJsonContract>;
    function CreateArrayContract(ATypeInf: PTypeInfo): TJsonArrayContract; virtual;
    function CreateClassContract(ATypeInf: PTypeInfo): TJsonClassContract; virtual;
    function CreateContract(ATypeInf: PTypeInfo): TJsonContract; virtual;
    function CreateConverterContract(ATypeInf: PTypeInfo): TJsonConverterContract; virtual;
    function CreateObjectContract(ATypeInf: PTypeInfo): TJsonObjectContract; virtual;
    function CreatePrimitiveContract(ATypeInf: PTypeInfo): TJsonPrimitiveContract; virtual;
    function CreateProperty(const ARttiMember: TRttiMember; AMemberSerialization: TJsonMemberSerialization): TJsonProperty; virtual;
    procedure CreateProperties(ATypeInf: PTypeInfo; AMemberSerialization: TJsonMemberSerialization; const AOutProperties: TObjectList<TJsonProperty>); virtual;
    procedure GetSerializableMembers(ATypeInf: PTypeInfo; const AMembers: TList<TRttiMember>); virtual;
    function ShouldIncludeMember(const AMember: TRttiMember; AMemberSerialization: TJsonMemberSerialization): Boolean; virtual;
    function GetConverterFromAttribute(const AConverterAttribute: JsonConverterAttribute): TJsonConverter;
    procedure InitializeContract(const AJsonContract: TJsonContract; const ARttiType: TRttiType); virtual;
    procedure SetPropertySettingsFromAttributes(const AProperty: TJsonProperty; const ARttiMember: TRttiMember;
      AMemberSerialization: TJsonMemberSerialization); virtual;
    function CreateValueProvider(const ARttiMember: TRttiMember): IJsonValueProvider; virtual;
    function CreateAttributeProvider(const ARttiObject: TRttiObject): IJsonAttributeProvider; virtual;
    function ResolvePropertyName(const AName: string): string; virtual;
  public
    constructor Create(ADefaultMemberSerialization: TJsonMemberSerialization = TJsonMemberSerialization.Fields);
    destructor Destroy; override;
    procedure ClearCache; virtual;
    function ResolveContract(ATypeInf: PTypeInfo): TJsonContract;
  end;

  TJsonDynamicContractResolver = class(TJsonDefaultContractResolver)
  private
    FDynamicAttributes: TJsonDynamicAttributes;
    function GetRttiType(ATypeInf: PTypeInfo): TRttiType;
    function GetRttiField(const ARttiType: TRttiType; AFieldName: string): TRttiMember;
    function GetRttiProperty(const ARttiType: TRttiType; APropertyName: string): TRttiMember;
  protected
    function CreateAttributeProvider(const ARttiObject: TRttiObject): IJsonAttributeProvider; override;
  public
    constructor Create(ADefaultMemberSerialization: TJsonMemberSerialization = TJsonMemberSerialization.Fields);
    procedure ClearAttributes;
    procedure SetFieldConverter(ATypeInf: PTypeInfo; FieldName: string; const AConverterClass: TClass);
    procedure SetFieldName(ATypeInf: PTypeInfo; AFieldName: string; ResolvedName: string);
    procedure SetFieldsIgnored(ATypeInf: PTypeInfo; AFieldNames: array of string);
    procedure SetFieldsIn(ATypeInf: PTypeInfo; AFieldNames: array of string);
    procedure SetPropertiesIgnored(ATypeInf: PTypeInfo; APropertyNames: array of string);
    procedure SetPropertiesIn(ATypeInf: PTypeInfo; APropertyNames: array of string);
    procedure SetPropertyConverter(ATypeInf: PTypeInfo; APropertyName: string; const AConverterClass: TClass);
    procedure SetPropertyName(ATypeInf: PTypeInfo; APropertyName: string; AResolvedName: string);
    procedure SetTypeConverter(ATypeInf: PTypeInfo; const AConverterClass: TClass);
    procedure SetTypeMemberSerialization(ATypeInf: PTypeInfo; AMemberSerialization: TJsonMemberSerialization);
    procedure SetTypeIgnored(ATypeInf: PTypeInfo);
  end;

  // --------------------------------------------------------------------- //
  // Type/Name resolvers
  // --------------------------------------------------------------------- //

  IJsonTypeResolver = interface
    function ResolveType(const ATypeName: string): PTypeInfo;
    function ResolveName(const ATypeInf: PTypeInfo): string;
  end;

  TJsonDefaultTypeResolver = class(TInterfacedObject, IJsonTypeResolver)
  public
    function ResolveType(const ATypeName: string): PTypeInfo; virtual;
    function ResolveName(const ATypeInf: PTypeInfo): string; virtual;
  end;

//  // --------------------------------------------------------------------- //
//  // Reference resolvers
//  // --------------------------------------------------------------------- //
//
//  IJsonReferenceResolver = interface
//    procedure AddReferenced(const AContext: TObject; const AReference: string; const AValue: Pointer);
//    function IsReferenced(const AContext: TObject; AValue: Pointer): Boolean;
//    function GetReference(const AContext: TObject; AValue: Pointer): string;
//    function ResolveReference(const AContext: TObject; const AReference: string): Pointer;
//  end;
//
//  TJsonDefaultReferenceResolver = class(TInterfacedObject, IJsonReferenceResolver)
//  private
//    FReferenceCount: Integer;
//    function GetNameRefDict(const AContext: TObject): TDictionary<string, Pointer>;
//    function GetRefNameDict(const AContext: TObject): TDictionary<Pointer, string>;
//  public
//    procedure AddReferenced(const AContext: TObject; const AReference: string; const AValue: Pointer);
//    function IsReferenced(const AContext: TObject; AValue: Pointer): Boolean;
//    function GetReference(const AContext: TObject; AValue: Pointer): string;
//    function ResolveReference(const AContext: TObject; const AReference: string): Pointer;
//  end;

  // --------------------------------------------------------------------- //
  // Serializer
  // --------------------------------------------------------------------- //

  TJsonSerializer = class
  private
    FContractResolver: IJsonContractResolver;
    FConverters: TList<TJsonConverter>;
    FDateFormatHandling: TJsonDateFormatHandling;
    FDateParseHandling: TJsonDateParseHandling;
    FDateTimeZoneHandling: TJsonDateTimeZoneHandling;
    FFloatFormatHandling: TJsonFloatFormatHandling;
    FFormatting: TJsonFormatting;
    FMaxDepth: Integer;
    FObjectHandling: TJsonObjectHandling;
    FObjectOwnership: TJsonObjectOwnership;
//    FReferenceResolver: IJsonReferenceResolver;
    FStringEscapeHandling: TJsonStringEscapeHandling;
    FTypeResolver: IJsonTypeResolver;
  protected
    function GetContractResolver: IJsonContractResolver; virtual;
    function GetConverters: TList<TJsonConverter>; virtual;
    function GetDateFormatHandling: TJsonDateFormatHandling; virtual;
    function GetDateParseHandling: TJsonDateParseHandling; virtual;
    function GetDateTimeZoneHandling: TJsonDateTimeZoneHandling; virtual;
    function GetFloatFormatHandling: TJsonFloatFormatHandling; virtual;
    function GetFormatting: TJsonFormatting; virtual;
    function GetMaxDepth: Integer; virtual;
//    function GetReferenceResolver: IJsonReferenceResolver; virtual;
    function GetObjectHandling: TJsonObjectHandling; virtual;
    function GetObjectOwnership: TJsonObjectOwnership; virtual;
    function GetStringEscapeHandling: TJsonStringEscapeHandling; virtual;
    function GetTypeResolver: IJsonTypeResolver; virtual;
    procedure SetContractResolver(const AValue: IJsonContractResolver); virtual;
    procedure SetDateFormatHandling(AValue: TJsonDateFormatHandling); virtual;
    procedure SetDateParseHandling(AValue: TJsonDateParseHandling); virtual;
    procedure SetDateTimeZoneHandling(AValue: TJsonDateTimeZoneHandling); virtual;
    procedure SetFloatFormatHandling(AValue: TJsonFloatFormatHandling); virtual;
    procedure SetFormatting(AValue: TJsonFormatting); virtual;
    procedure SetMaxDepth(AValue: Integer); virtual;
    procedure SetObjectHandling(const AValue: TJsonObjectHandling); virtual;
    procedure SetObjectOwnership(const AValue: TJsonObjectOwnership); virtual;
//    procedure SetReferenceResolver(const AValue: IJsonReferenceResolver); virtual;
    procedure SetStringEscapeHandling(AValue: TJsonStringEscapeHandling); virtual;
    procedure SetTypeResolver(const AValue: IJsonTypeResolver); virtual;

    procedure InternalSerialize(const AWriter: TJsonWriter; const AValue: TValue); virtual;
    function InternalDeserialize(const AReader: TJsonReader; ATypeInf: PTypeInfo): TValue; virtual;
    procedure InternalPopulate(const Reader: TJsonReader; var AValue: TValue); virtual;
  public
    constructor Create;
    destructor Destroy; override;
    function Serialize<T>(const AValue: T): string; overload;
    procedure Serialize<T>(const AWriter: TTextWriter; const AValue: T); overload;
    procedure Serialize<T>(const AWriter: TJsonWriter; const AValue: T); overload;
    function Deserialize<T>(const AJson: string): T; overload;
    function Deserialize<T>(const AReader: TTextReader): T; overload;
    function Deserialize<T>(const AReader: TJsonReader): T; overload;
    procedure Populate<T>(const AJson: string; var AValue: T); overload;
    procedure Populate<T>(const AReader: TTextReader; var AValue: T); overload;
    procedure Populate<T>(const AReader: TJsonReader; var AValue: T); overload;
    procedure Populate(const AReader: TJsonReader; var AValue: TValue); overload;
    class function MatchConverter(const AConverters:  TList<TJsonConverter>; ATypeInf: PTypeInfo): TJsonConverter; static;
    property ContractResolver: IJsonContractResolver read GetContractResolver write SetContractResolver;
    property Converters:  TList<TJsonConverter> read GetConverters;
    property DateFormatHandling: TJsonDateFormatHandling read GetDateFormatHandling write SetDateFormatHandling;
    property DateParseHandling: TJsonDateParseHandling read GetDateParseHandling write SetDateParseHandling;
    property DateTimeZoneHandling: TJsonDateTimeZoneHandling read GetDateTimeZoneHandling write SetDateTimeZoneHandling;
    property FloatFormatHandling: TJsonFloatFormatHandling read GetFloatFormatHandling write SetFloatFormatHandling;
    property Formatting: TJsonFormatting read GetFormatting write SetFormatting;
    property MaxDepth: Integer read GetMaxDepth write SetMaxDepth;
    property ObjectHandling: TJsonObjectHandling read GetObjectHandling write SetObjectHandling;
    property ObjectOwnership: TJsonObjectOwnership read GetObjectOwnership write SetObjectOwnership;
//    property ReferenceResolver: IJsonReferenceResolver read GetReferenceResolver write SetReferenceResolver;
    property StringEscapeHandling: TJsonStringEscapeHandling read GetStringEscapeHandling write SetStringEscapeHandling;
    property TypeResolver: IJsonTypeResolver read GetTypeResolver write SetTypeResolver;
  end;

                                                                  
  TJsonSerializerHelper = class helper for TJsonSerializer
  public
    procedure Serialize(const AWriter: TJsonWriter; const AValue: TValue); overload;
  end;

implementation

uses
  System.JSONConsts, System.JSON.Converters;

var
  Ctx: TRttiContext;
                                                                               
  ListHelperConverter: TJsonConverter;

{ Helpers }

function GetName(Value: TJsonToken): string; overload;
begin
  Result := GetEnumName(TypeInfo(TJsonToken), Integer(Value));
end;

function GetName(Value: TJsonPrimitiveKind): string; overload;
begin
  Result := GetEnumName(TypeInfo(TJsonPrimitiveKind), Integer(Value));
end;

type
  TJsonSerializerProxy = class;
  TJsonSerializerBase = class
  private
    [Weak] FSerializer: TJsonSerializer;
    FRefNameDict: TDictionary<Pointer, string>;
    FNameRefDict: TDictionary<string, Pointer>;
    function ResolveContract(ATypeInf: PTypeInfo): TJsonContract; inline;
    function ResolveConverter(const AContract: TJsonContract): TJsonConverter; overload;
    constructor Create(const ASerializer: TJsonSerializer);
    destructor Destroy; override;
  end;

  TJsonSerializerWriter = class(TJsonSerializerBase)
  private
    FProxySerializer: TJsonSerializerProxy;
    function GetInternalSerializer: TJsonSerializerProxy;
    procedure WriteArray(const AWriter: TJsonWriter; const AValue: TValue; const AContract: TJsonArrayContract);
    procedure WriteClass(const AWriter: TJsonWriter; const AValue: TValue; const AContract: TJsonClassContract);
    procedure WriteObject(const AWriter: TJsonWriter; const Value: TValue; const AContract: TJsonObjectContract);
    procedure WriteProperty(const AWriter: TJsonWriter; const AContainer: TValue; const AProperty: TJsonProperty;
      const AObjectContract: TJsonObjectContract);
    procedure WritePrimitive(const AWriter: TJsonWriter; const AValue: TValue; const AContract: TJsonPrimitiveContract);
    procedure WriteValue(const AWriter: TJsonWriter; const AValue: TValue; const AContract: TJsonContract); overload;
  public
    destructor Destroy; override;
    procedure Serialize(const AWriter: TJsonWriter; const AValue: TValue);
  end;

  TJsonSerializerReader = class(TJsonSerializerBase)
  private
    FProxySerializer: TJsonSerializerProxy;
    function GetInternalSerializer: TJsonSerializerProxy;
    function CreateValue(const AReader: TJsonReader; out AValue: TValue; const Contract: TJsonContract;
      const AConverter: TJsonConverter; const ExistingValue: TValue): Boolean; overload;
    function TypeToRead(const AContract: TJsonContract): TJsonReader.TReadType;
    function CreateArray(const AReader: TJsonReader; out AValue: TValue; const AContract: TJsonContract): Boolean;
    function ReadForType(const AReader: TJsonReader; const AContract: TJsonContract; AHasConverter: Boolean): Boolean;
    function ReadNullValue(const AReader: TJsonReader; out AValue: TValue; const AContract: TJsonContract): Boolean;
    function CreateObject(const AReader: TJsonReader; out AValue: TValue; const AContract: TJsonContract;
      const ExistingValue: TValue): Boolean;
    function CreatePrimitive(const AReader: TJsonReader; out AValue: TValue; const AContract: TJsonContract): Boolean;
    procedure InternalDeserialize(const AReader: TJsonReader; var AValue : TValue; const AContract: TJsonContract); overload;
    procedure PopulateArray(const AReader: TJsonReader; var AArray: TArray<TValue>; const AContract: TJsonArrayContract); overload;
    procedure PopulateObject(const AReader: TJsonReader; const AValue: TValue; const AContract: TJsonObjectContract); overload;
    function SetPropertyValue(const AProperty: TJsonProperty; const AConverter: TJsonConverter; const AContract: TJsonContract;
      const AReader: TJsonReader; const ATarget: TValue): Boolean;
  public
    destructor Destroy; override;
    function Deserialize(const AReader: TJsonReader; ATypeInf: PTypeInfo): TValue;
    procedure Populate(const AReader: TJsonReader; var AValue: TValue);
  end;

  // This class is used internally by the TJsonSerializer to wrap and pass itself to the converters as parameter,
  // this will allow calling the TJsonSerializerWriter/TJsonSerializerReader Serialize/Deserialize/Populate internal methods from
  // the converter without passing through the public ones
  TJsonSerializerProxy = class(TJsonSerializer)
  private
    FSerializer: TJsonSerializer;
    FSerializerWriter: TJsonSerializerWriter;
    FSerializerReader: TJsonSerializerReader;
  protected
    function GetContractResolver: IJsonContractResolver; override;
    function GetConverters: TList<TJsonConverter>; override;
    function GetDateFormatHandling: TJsonDateFormatHandling; override;
    function GetDateParseHandling: TJsonDateParseHandling; override;
    function GetDateTimeZoneHandling: TJsonDateTimeZoneHandling; override;
    function GetFloatFormatHandling: TJsonFloatFormatHandling; override;
    function GetFormatting: TJsonFormatting; override;
    function GetMaxDepth: Integer; override;
    function GetObjectHandling: TJsonObjectHandling; override;
    function GetObjectOwnership: TJsonObjectOwnership; override;
//    function GetReferenceResolver: IJsonReferenceResolver; override;
    function GetStringEscapeHandling: TJsonStringEscapeHandling; override;
    function GetTypeResolver: IJsonTypeResolver; override;
    procedure SetContractResolver(const AValue: IJsonContractResolver); override;
    procedure SetDateFormatHandling(AValue: TJsonDateFormatHandling); override;
    procedure SetDateParseHandling(AValue: TJsonDateParseHandling); override;
    procedure SetDateTimeZoneHandling(AValue: TJsonDateTimeZoneHandling); override;
    procedure SetFloatFormatHandling(AValue: TJsonFloatFormatHandling); override;
    procedure SetFormatting(AValue: TJsonFormatting); override;
    procedure SetMaxDepth(AValue: Integer); override;
    procedure SetObjectHandling(const AValue: TJsonObjectHandling); override;
    procedure SetObjectOwnership(const AValue: TJsonObjectOwnership); override;
//    procedure SetReferenceResolver(const AValue: IJsonReferenceResolver); override;
    procedure SetStringEscapeHandling(AValue: TJsonStringEscapeHandling); override;
    procedure SetTypeResolver(const AValue: IJsonTypeResolver); override;

    function InternalDeserialize(const AReader: TJsonReader; ATypeInf: PTypeInfo): TValue; override;
    procedure InternalPopulate(const AReader: TJsonReader; var AValue: TValue); override;
    procedure InternalSerialize(const AWriter: TJsonWriter; const AValue: TValue); override;
  public
    constructor Create(const ASerializerWriter: TJsonSerializerWriter); overload;
    constructor Create(const ASerializerReader: TJsonSerializerReader); overload;
  end;

{ TContractResolver }

procedure TJsonDefaultContractResolver.ClearCache;
begin
  FCachedContracts.Clear;
end;

constructor TJsonDefaultContractResolver.Create(ADefaultMemberSerialization: TJsonMemberSerialization = TJsonMemberSerialization.Fields);
begin
  inherited Create;
  FDefaultMemberSerialization := ADefaultMemberSerialization;
  FCachedAttributeConverters := TObjectDictionary<TClass, TJsonConverter>.Create([doOwnsValues]);
  FCachedContracts := TObjectDictionary<PTypeInfo, TJsonContract>.Create([doOwnsValues]);
end;

function TJsonDefaultContractResolver.CreateArrayContract(ATypeInf: PTypeInfo): TJsonArrayContract;
begin
  Result := TJsonArrayContract.Create(ATypeInf);
  InitializeContract(Result, Ctx.GetType(ATypeInf));
end;

function TJsonDefaultContractResolver.CreateAttributeProvider(const ARttiObject: TRttiObject): IJsonAttributeProvider;
begin
  Result := TJsonInlineAttributeProvider.Create(ARttiObject);
end;

function TJsonDefaultContractResolver.CreateClassContract(ATypeInf: PTypeInfo): TJsonClassContract;
begin
  Result := TJsonClassContract.Create(ATypeInf);
  InitializeContract(Result, Ctx.GetType(ATypeInf));
end;

function TJsonDefaultContractResolver.CreateContract(ATypeInf: PTypeInfo): TJsonContract;
begin
  if ATypeInf <> nil then
  begin
    Result := nil;
    case ATypeInf^.Kind of
      tkInteger, tkWChar, tkChar, tkEnumeration, tkFloat, tkUString, tkWString, tkLString, tkString, tkSet, tkInt64:
        Result := CreatePrimitiveContract(ATypeInf);
      tkDynArray, tkArray:
        Result := CreateArrayContract(ATypeInf);
      tkClass, tkInterface, tkRecord, tkMRecord:
        Result := CreateObjectContract(ATypeInf);
      tkClassRef:
        Result := CreateClassContract(ATypeInf);
      tkProcedure, tkMethod, tkPointer, tkVariant, tkUnknown:
        Result := CreateConverterContract(ATypeInf);
    end;
  end
  else
    Result := nil;
end;

function TJsonDefaultContractResolver.CreateObjectContract(ATypeInf: PTypeInfo): TJsonObjectContract;
var
  LRttiType: TRttiType;
  LMethod: TRttiMethod;
  LJsonSerialization: TCustomAttribute;
begin
  Result := TJsonObjectContract.Create(ATypeInf);

  // set the constructor
  LRttiType := Ctx.GetType(ATypeInf);
  case ATypeInf^.Kind of
    tkClass:
    begin
      for LMethod in LRttiType.GetMethods do
      begin
        if LMethod.HasExtendedInfo and LMethod.IsConstructor then
        begin
          if Length(LMethod.GetParameters) = 0 then
          begin
            Result.DefaultCreator := TJsonObjectCreator.Create(LRttiType.AsInstance.MetaclassType, LMethod);
            Break;
          end;
        end;
      end;
    end;
    tkRecord, tkMRecord:
    begin
      Result.DefaultCreator := TJsonRecordCreator.Create(ATypeInf);
      if ATypeInf = TypeInfo(System.Generics.Collections.TListHelper) then
        Result.Converter := ListHelperConverter;
    end;
  end;
  InitializeContract(Result, LRttiType);

  // search for the MemberSerialization
  Result.MemberSerialization := FDefaultMemberSerialization;
  LJsonSerialization := Result.AttributeProvider.GetAttribute(JsonSerializeAttribute, True);
  if LJsonSerialization <> nil then
    Result.MemberSerialization := JsonSerializeAttribute(LJsonSerialization).Value;

  CreateProperties(Result.TypeInf, Result.MemberSerialization, Result.Properties);
end;

function TJsonDefaultContractResolver.CreatePrimitiveContract(ATypeInf: PTypeInfo): TJsonPrimitiveContract;
var
  TypeData: TTypeData;
begin
  Result := nil;
  case ATypeInf^.Kind of
    tkInteger:
    begin
      case GetTypeData(ATypeInf)^.OrdType of
        otSByte: Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Int8);
        otSWord: Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Int16);
        otSLong: Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Int32);
        otUByte: Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.UInt8);
        otUWord: Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.UInt16);
        otULong: Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.UInt32);
      end;
    end;
    tkWChar, tkChar:
      Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Char);
    tkEnumeration:
    begin
      if TypeInfo(Boolean) = ATypeInf  then
        Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Boolean)
      else
        Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Enumeration);
    end;
    tkFloat:
    begin
      if (TypeInfo(TDateTime) = ATypeInf) or
         (TypeInfo(TDate) = ATypeInf) or
         (TypeInfo(TTime) = ATypeInf) then
        Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.DateTime)
      else
      begin
        TypeData := GetTypeData(ATypeInf)^;
        case TypeData.FloatType of
          ftSingle:
            Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Single);
          ftDouble:
            Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Double);
          ftExtended:
            Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Extended);
          ftComp:
            Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Comp);
          ftCurr:
            Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Currency);
        end;
      end;
    end;
    tkUString, tkWString, tkLString, tkString:
      Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.String);
    tkSet:
      Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Set);
    tkInt64:
    begin
      TypeData := GetTypeData(ATypeInf)^;
      if TypeData.MinInt64Value > TypeData.MaxInt64Value then
        Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.UInt64)
      else
        Result := TJsonPrimitiveContract.Create(ATypeInf, TJsonPrimitiveKind.Int64);
    end
    else
      raise EJsonException.Create(SUnexpectedTypePrimitiveContract);
  end;
  InitializeContract(Result, Ctx.GetType(ATypeInf));
end;

function TJsonDefaultContractResolver.CreateConverterContract(ATypeInf: PTypeInfo): TJsonConverterContract;
begin
  Result := TJsonConverterContract.Create(ATypeInf);
  InitializeContract(Result, Ctx.GetType(ATypeInf));
end;

destructor TJsonDefaultContractResolver.Destroy;
begin
  FCachedContracts.Free;
  FCachedAttributeConverters.Free;
  inherited Destroy;
end;

procedure TJsonDefaultContractResolver.InitializeContract(const AJsonContract: TJsonContract; const ARttiType: TRttiType);
var
  LConverterAttr, LIgnoredAttr: TCustomAttribute;
begin
  AJsonContract.Sealed := not (AJsonContract.TypeInf^.Kind in [tkClass, tkInterface]);

  AJsonContract.AttributeProvider := CreateAttributeProvider(ARttiType);

  LIgnoredAttr := AJsonContract.AttributeProvider.GetAttribute(JsonIgnoreAttribute, True);
  LConverterAttr := AJsonContract.AttributeProvider.GetAttribute(JsonConverterAttribute, True);

  AJsonContract.Ignored :=  LIgnoredAttr <> nil;
  if LConverterAttr <> nil then
    AJsonContract.Converter := GetConverterFromAttribute(JsonConverterAttribute(LConverterAttr));
end;

procedure TJsonDefaultContractResolver.SetPropertySettingsFromAttributes(const AProperty: TJsonProperty;
  const ARttiMember: TRttiMember; AMemberSerialization: TJsonMemberSerialization);
var
  LObjectHandlingAttr, LIgnoredAttr, LConverterAttr, LNameAttr: TCustomAttribute;
begin
  LObjectHandlingAttr := AProperty.AttributeProvider.GetAttribute(JsonObjectHandlingAttribute);
  LIgnoredAttr := AProperty.AttributeProvider.GetAttribute(JsonIgnoreAttribute);
  LConverterAttr := AProperty.AttributeProvider.GetAttribute(JsonConverterAttribute);
  LNameAttr := AProperty.AttributeProvider.GetAttribute(JsonNameAttribute);

  if LObjectHandlingAttr <> nil then
    AProperty.ObjectHandling := JsonObjectHandlingAttribute(LObjectHandlingAttr).Value;

  if LIgnoredAttr <> nil then
    AProperty.Ignored := True;

  if LConverterAttr <> nil then
    AProperty.Converter := GetConverterFromAttribute(JsonConverterAttribute(LConverterAttr));

  if LNameAttr <> nil then
    AProperty.Name := JsonNameAttribute(LNameAttr).Value
  else
    AProperty.Name := ResolvePropertyName(ARttiMember.Name);

  // When "JsonObjectHandlingAttribute.In" is enabled search for JsonIn attribute to know if should be included (if it was not ignored previously)
  if (AMemberSerialization = TJsonMemberSerialization.In) then
    AProperty.Ignored := AProperty.Ignored or (not (AProperty.AttributeProvider.GetAttribute(JsonInAttribute) <> nil));
end;

function TJsonDefaultContractResolver.ShouldIncludeMember(const AMember: TRttiMember;
  AMemberSerialization: TJsonMemberSerialization): Boolean;
begin
  case AMemberSerialization of
    TJsonMemberSerialization.Fields:
      Result := AMember is TRttiField;
    TJsonMemberSerialization.Public:
      Result := AMember.Visibility in [mvPublic, mvPublished]
    else
      // By now is included because 'TJsonMemberSerialization.In' is evaluated when this member is encapsulated in a JsonProperty
      // if it doesn't have the JsonIn attribute it will marked as ignored
      Result := True;
  end;
end;

function TJsonDefaultContractResolver.GetConverterFromAttribute(const AConverterAttribute: JsonConverterAttribute): TJsonConverter;
var
  LConverterClass: TClass;
begin
  LConverterClass := JsonConverterAttribute(AConverterAttribute).Value;
  if not FCachedAttributeConverters.TryGetValue(LConverterClass, Result) then
  begin
    Result := TJsonConverter(LConverterClass.Create);
    FCachedAttributeConverters.Add(LConverterClass, Result);
  end;
end;

procedure TJsonDefaultContractResolver.GetSerializableMembers(ATypeInf: PTypeInfo; const AMembers: TList<TRttiMember>);
var
  LType: TRttiType;
  LField: TRttiField;
  LProp: TRttiProperty;
begin
  LType := Ctx.GetType(ATypeInf);
  for LField in LType.GetFields do
    AMembers.Add(LField);
  for LProp in LType.GetProperties do
    AMembers.Add(LProp);
end;

function TJsonDefaultContractResolver.CreateProperty(const ARttiMember: TRttiMember;
  AMemberSerialization: TJsonMemberSerialization): TJsonProperty;
var
  LRttiField: TRttiField;
  LRttiProperty: TRttiProperty;
begin
  Result := nil;
  if ARttiMember is TRttiField then
  begin
    LRttiField := TRttiField(ARttiMember);
{$IFDEF AUTOREFCOUNT}
    if LRttiField.Name = 'FRefCount' then
      Exit(nil);
{$ENDIF}
    Result := TJsonProperty.Create;
    Result.Readable := True;
    Result.FWritable := True;
    if LRttiField.FieldType = nil then
      Result.TypeInf := nil
    else
      Result.TypeInf := LRttiField.FieldType.Handle;
    Result.ParentType := LRttiField.Parent.Handle;
  end
  else if ARttiMember is TRttiProperty then
  begin
    LRttiProperty := TRttiProperty(ARttiMember);
    Result := TJsonProperty.Create;
    Result.Readable := LRttiProperty.IsReadable;
    Result.FWritable := LRttiProperty.IsWritable;
    if LRttiProperty.PropertyType = nil then
      Result.TypeInf := nil
    else
      Result.TypeInf := LRttiProperty.PropertyType.Handle;
  end;
  if Result <> nil then
  begin
    Result.ParentType := ARttiMember.Parent.Handle;
    Result.Name := ARttiMember.Name;
    Result.UnderlyingName := ARttiMember.Name;
    Result.ValueProvider := CreateValueProvider(ARttiMember);
    Result.AttributeProvider := CreateAttributeProvider(ARttiMember);
    SetPropertySettingsFromAttributes(Result, ARttiMember, AMemberSerialization);
  end;
end;

function TJsonDefaultContractResolver.CreateValueProvider(const ARttiMember: TRttiMember): IJsonValueProvider;
begin
  if ARttiMember is TRttiField then
    Result := TJsonFieldValueProvider.Create(TRttiField(ARttiMember))
  else if ARttiMember is TRttiProperty then
    Result := TJsonPropertyValueProvider.Create(TRttiProperty(ARttiMember))
  else
    Result := nil;
end;

procedure TJsonDefaultContractResolver.CreateProperties(ATypeInf: PTypeInfo; AMemberSerialization: TJsonMemberSerialization;
  const AOutProperties: TObjectList<TJsonProperty>);

  function WasPropertyOverriden(ARttiMember: TRttiMember; AUsedProps: TDictionary<string, TRttiProperty>): Boolean;
  var
    LRttiInstProp: TRttiInstanceProperty;
    LHash: string;
  begin
    // Exclude overridden properties
    if ARttiMember is TRttiInstanceProperty then
    begin
      LRttiInstProp := TRttiInstanceProperty(ARttiMember);
      LHash := LRttiInstProp.Name + '.' +
        IntToHex(NativeUInt(LRttiInstProp.PropInfo.GetProc)) + '.' +
        IntToHex(NativeUInt(LRttiInstProp.PropInfo.SetProc));
      Result := AUsedProps.ContainsKey(LHash);
      if not Result then
        AUsedProps.Add(LHash, LRttiInstProp);
    end
    else
      Result := False;
  end;

var
  LRttiMember: TRttiMember;
  LProperty: TJsonProperty;
  LRttiMembers: TList<TRttiMember>;
  LUsedProps: TDictionary<string, TRttiProperty>;
begin
  LRttiMembers := TList<TRttiMember>.Create;
  LUsedProps := TDictionary<string, TRttiProperty>.Create;
  try
    GetSerializableMembers(ATypeInf, LRttiMembers);
    for LRttiMember in LRttiMembers do
    begin
      // Exclude overridden properties
      if not WasPropertyOverriden(LRttiMember, LUsedProps) and
         ShouldIncludeMember(LRttiMember, AMemberSerialization) then
      begin
        LProperty := CreateProperty(LRttiMember, AMemberSerialization);
        if LProperty <> nil then
          AOutProperties.Add(LProperty);
      end;
    end;
  finally
    LRttiMembers.Free;
    LUsedProps.Free;
  end;
end;

function TJsonDefaultContractResolver.ResolveContract(ATypeInf: PTypeInfo): TJsonContract;
begin
  if not FCachedContracts.TryGetValue(ATypeInf, Result) then
  begin
    Result := CreateContract(ATypeInf);
    FCachedContracts.Add(ATypeInf, Result);
  end;
end;

function TJsonDefaultContractResolver.ResolvePropertyName(const AName: string): string;
begin
  Result := AName;
end;

{ TJsonSerializer }

constructor TJsonSerializer.Create;
begin
  inherited Create;
  FFormatting := TJsonFormatting.None;
  FDateFormatHandling := TJsonDateFormatHandling.Iso;
  FDateParseHandling := TJsonDateParseHandling.None;
  FStringEscapeHandling := TJsonStringEscapeHandling.Default;
  FFloatFormatHandling := TJsonFloatFormatHandling.String;
  FMaxDepth := -1;
  FConverters :=  TList<TJsonConverter>.Create;
  FContractResolver := TJsonDefaultContractResolver.Create;
  FTypeResolver := TJsonDefaultTypeResolver.Create;
//  FReferenceResolver := TJsonDefaultReferenceResolver.Create;
end;

function TJsonSerializer.Deserialize<T>(const AReader: TTextReader): T;
var
  LJsonReader: TJsonTextReader;
begin
  LJsonReader := TJsonTextReader.Create(AReader);
  LJsonReader.DateTimeZoneHandling := DateTimeZoneHandling;
  LJsonReader.DateParseHandling := DateParseHandling;
  LJsonReader.MaxDepth := MaxDepth;
  try
    Result := Deserialize<T>(LJsonReader);
  finally
    LJsonReader.Free;
  end;
end;

function TJsonSerializer.Deserialize<T>(const AReader: TJsonReader): T;
begin
  Result := InternalDeserialize(AReader, TypeInfo(T)).AsType<T>;
end;

destructor TJsonSerializer.Destroy;
begin
  FConverters.Free;
  inherited;
end;

function TJsonSerializer.Deserialize<T>(const AJson: string): T;
var
  LStringReader: TStringReader;
begin
  LStringReader := TStringReader.Create(AJson);
  try
    Result := Deserialize<T>(LStringReader);
  finally
    LStringReader.Free;
  end;
end;

function TJsonSerializer.GetContractResolver: IJsonContractResolver;
begin
  Result := FContractResolver;
end;

function TJsonSerializer.GetConverters: TList<TJsonConverter>;
begin
  Result := FConverters;
end;

function TJsonSerializer.GetDateFormatHandling: TJsonDateFormatHandling;
begin
  Result := FDateFormatHandling;
end;

function TJsonSerializer.GetDateParseHandling: TJsonDateParseHandling;
begin
  Result := FDateParseHandling;
end;

function TJsonSerializer.GetDateTimeZoneHandling: TJsonDateTimeZoneHandling;
begin
  Result := FDateTimeZoneHandling;
end;

function TJsonSerializer.GetFloatFormatHandling: TJsonFloatFormatHandling;
begin
  Result := FFloatFormatHandling;
end;

function TJsonSerializer.GetFormatting: TJsonFormatting;
begin
  Result := FFormatting;
end;

function TJsonSerializer.GetMaxDepth: Integer;
begin
  Result := FMaxDepth;
end;

function TJsonSerializer.GetObjectHandling: TJsonObjectHandling;
begin
  Result := FObjectHandling;
end;

function TJsonSerializer.GetObjectOwnership: TJsonObjectOwnership;
begin
  Result := FObjectOwnership;
end;

//function TJsonSerializer.GetReferenceResolver: IJsonReferenceResolver;
//begin
//  Result := FReferenceResolver;
//end;

function TJsonSerializer.GetStringEscapeHandling: TJsonStringEscapeHandling;
begin
  Result := FStringEscapeHandling;
end;

function TJsonSerializer.GetTypeResolver: IJsonTypeResolver;
begin
  Result := FTypeResolver;
end;

function TJsonSerializer.InternalDeserialize(const AReader: TJsonReader; ATypeInf: PTypeInfo): TValue;
var
  LSerializerReader: TJsonSerializerReader;
begin
  LSerializerReader := TJsonSerializerReader.Create(Self);
  try
    Result := LSerializerReader.DeSerialize(AReader, ATypeInf);
  finally
    LSerializerReader.Free;
  end;
end;

procedure TJsonSerializer.InternalPopulate(const Reader: TJsonReader; var AValue: TValue);
var
  LSerializerReader: TJsonSerializerReader;
begin
  LSerializerReader := TJsonSerializerReader.Create(Self);
  try
    LSerializerReader.Populate(Reader, AValue);
  finally
    LSerializerReader.Free;
  end;
end;

procedure TJsonSerializer.InternalSerialize(const AWriter: TJsonWriter; const AValue: TValue);
var
  LSerializerWriter: TJsonSerializerWriter;
begin
  LSerializerWriter := TJsonSerializerWriter.Create(Self);
  try
    LSerializerWriter.Serialize(AWriter, AValue);
  finally
    LSerializerWriter.Free;
  end;
end;


class function TJsonSerializer.MatchConverter(const AConverters: TList<TJsonConverter>;
  ATypeInf: PTypeInfo): TJsonConverter;
var
  I: Integer;
begin
  if ATypeInf <> nil then
    for I := AConverters.Count - 1 downto 0 do
      if AConverters[I].CanConvert(ATypeInf) then
        Exit(AConverters[I]);

  Result := nil;
end;

procedure TJsonSerializer.Populate<T>(const AReader: TTextReader; var AValue: T);
var
  LJsonReader: TJsonTextReader;
begin
  LJsonReader := TJsonTextReader.Create(AReader);
  LJsonReader.DateTimeZoneHandling := DateTimeZoneHandling;
  LJsonReader.DateParseHandling := DateParseHandling;
  LJsonReader.MaxDepth := MaxDepth;
  try
    Populate(LJsonReader, AValue);
  finally
    LJsonReader.Free;
  end;
end;

procedure TJsonSerializer.Populate(const AReader: TJsonReader; var AValue: TValue);
begin
  InternalPopulate(AReader, AValue);
end;

procedure TJsonSerializer.Populate<T>(const AReader: TJsonReader; var AValue: T);
var
  LValue: TValue;
begin
  LValue := TValue.From<T>(AValue);
  InternalPopulate(AReader, LValue);
  AValue := LValue.AsType<T>;
end;

procedure TJsonSerializer.Serialize<T>(const AWriter: TTextWriter; const AValue: T);
var
  JsonWriter: TJsonTextWriter;
begin
  JsonWriter := TJsonTextWriter.Create(AWriter);
  JsonWriter.FloatFormatHandling := FloatFormatHandling;
  JsonWriter.DateFormatHandling := DateFormatHandling;
  JsonWriter.DateTimeZoneHandling := DateTimeZoneHandling;
  JsonWriter.StringEscapeHandling := StringEscapeHandling;
  JsonWriter.Formatting := Formatting;
  try
    Serialize<T>(JsonWriter, AValue);
  finally
    JsonWriter.Free;
  end;
end;

procedure TJsonSerializer.Serialize<T>(const AWriter: TJsonWriter; const AValue: T);
begin
  InternalSerialize(AWriter, TValue.From<T>(AValue));
end;

procedure TJsonSerializerHelper.Serialize(const AWriter: TJsonWriter; const AValue: TValue);
begin
  InternalSerialize(AWriter, AValue);
end;

procedure TJsonSerializer.SetContractResolver(const AValue: IJsonContractResolver);
begin
  FContractResolver := AValue;
end;

procedure TJsonSerializer.SetDateFormatHandling(AValue: TJsonDateFormatHandling);
begin
  FDateFormatHandling := AValue;
end;

procedure TJsonSerializer.SetDateParseHandling(AValue: TJsonDateParseHandling);
begin
  FDateParseHandling := AValue;
end;

procedure TJsonSerializer.SetDateTimeZoneHandling(AValue: TJsonDateTimeZoneHandling);
begin
  FDateTimeZoneHandling := AValue;
end;

procedure TJsonSerializer.SetFloatFormatHandling(AValue: TJsonFloatFormatHandling);
begin
  FFloatFormatHandling := AValue;
end;

procedure TJsonSerializer.SetFormatting(AValue: TJsonFormatting);
begin
  FFormatting := AValue;
end;

procedure TJsonSerializer.SetMaxDepth(AValue: Integer);
begin
  FMaxDepth := AValue;
end;

procedure TJsonSerializer.SetObjectHandling(const AValue: TJsonObjectHandling);
begin
  FObjectHandling := AValue;
end;

procedure TJsonSerializer.SetObjectOwnership(const AValue: TJsonObjectOwnership);
begin
  FObjectOwnership := AValue;
end;

procedure TJsonSerializer.SetStringEscapeHandling(AValue: TJsonStringEscapeHandling);
begin
  FStringEscapeHandling := AValue;
end;

procedure TJsonSerializer.SetTypeResolver(const AValue: IJsonTypeResolver);
begin
  FTypeResolver := AValue;
end;

constructor TJsonSerializerBase.Create(const ASerializer: TJsonSerializer);
begin
  inherited Create;
  FSerializer := ASerializer;
  FRefNameDict := TDictionary<Pointer, string>.Create;
  FNameRefDict := TDictionary<string, Pointer>.Create;
end;

destructor TJsonSerializerBase.Destroy;
begin
  FRefNameDict.Free;
  FNameRefDict.Free;
  inherited;
end;

function TJsonSerializerBase.ResolveContract(ATypeInf: PTypeInfo): TJsonContract;
begin
  Result := FSerializer.ContractResolver.ResolveContract(ATypeInf);
end;

function TJsonSerializerBase.ResolveConverter(const AContract: TJsonContract): TJsonConverter;
begin
  if AContract.Converter = nil then
    Result := TJsonSerializer.MatchConverter(FSerializer.Converters, AContract.TypeInf)
  else
    Result := AContract.Converter;
end;

{ TJsonSerializerWriter }

destructor TJsonSerializerWriter.Destroy;
begin
  if FProxySerializer <> nil then
    FProxySerializer.Free;
  inherited;
end;

function TJsonSerializerWriter.GetInternalSerializer: TJsonSerializerProxy;
begin
  if FProxySerializer = nil then
    FProxySerializer := TJsonSerializerProxy.Create(Self);
  Result := FProxySerializer;
end;

procedure TJsonSerializerWriter.Serialize(const AWriter: TJsonWriter; const AValue: TValue);
begin
  WriteValue(AWriter, AValue, ResolveContract(AValue.TypeInfo));
end;

procedure TJsonSerializerWriter.WriteArray(const AWriter: TJsonWriter; const AValue: TValue;
  const AContract: TJsonArrayContract);
var
  I: Integer;
  LValue: TValue;
begin
  AWriter.WriteStartArray;
  for I := 0 to AValue.GetArrayLength - 1 do
  begin
    LValue := AValue.GetArrayElement(I);
    WriteValue(AWriter, LValue, ResolveContract(LValue.TypeInfo));
  end;
  AWriter.WriteEndArray;
end;

procedure TJsonSerializerWriter.WriteProperty(const AWriter: TJsonWriter; const AContainer: TValue; const AProperty: TJsonProperty;
  const AObjectContract: TJsonObjectContract);
var
  LMemberContract: TJsonContract;
  LPropertyValue: TValue;
  LGottenValue: Boolean;
  LConverter: TJsonConverter;
begin
  if AProperty.Ignored or not AProperty.Readable then Exit;

  // if there is some converter for the property
  LConverter := AProperty.Converter;
  if (LConverter <> nil) then
  begin
    AWriter.WritePropertyName(AProperty.Name);
    LConverter.WriteJson(AWriter, AProperty.ValueProvider.GetValue(AContainer), GetInternalSerializer);
    Exit;
  end;

  // get the property contract
  if AProperty.Contract = nil then
    AProperty.Contract := ResolveContract(AProperty.TypeInf);
  LMemberContract := AProperty.Contract;
  if (LMemberContract = nil) then Exit;

  // When the property has an Object/interface type (aka. not sealed) its value may can have a different type
  LGottenValue := False;
  if not LMemberContract.Sealed then
  begin
    LPropertyValue := AProperty.ValueProvider.GetValue(AContainer);
    LGottenValue := True;
    if (not LPropertyValue.IsEmpty) and (LPropertyValue.TypeInfo <> LMemberContract.TypeInf) then
    begin
      LMemberContract := ResolveContract(LPropertyValue.TypeInfo);
      if (LMemberContract = nil) or LMemberContract.Ignored  then Exit;                                       
    end
  end;

  if LMemberContract.Ignored then Exit;

  // Converter Contract can only be serialized with a converter
  if LMemberContract.ContractType = TJsonContractType.Converter then
  begin
    LConverter := ResolveConverter(LMemberContract);
    if (LConverter <> nil) and (LConverter.CanWrite) then
    begin
      if not LGottenValue then
        LPropertyValue := AProperty.ValueProvider.GetValue(AContainer);
      AWriter.WritePropertyName(AProperty.Name);
      LConverter.WriteJson(AWriter, LPropertyValue, GetInternalSerializer)
    end;
  end
  else
  begin
    if not LGottenValue then
      LPropertyValue := AProperty.ValueProvider.GetValue(AContainer);
    AWriter.WritePropertyName(AProperty.Name);
    WriteValue(AWriter, LPropertyValue, LMemberContract)
  end;
end;

procedure TJsonSerializerWriter.WriteClass(const AWriter: TJsonWriter; const AValue: TValue;
  const AContract: TJsonClassContract);
begin
  if AValue.AsClass = nil then
    AWriter.WriteNull
  else
    AWriter.WriteValue(AValue.AsClass.QualifiedClassName);
end;

procedure TJsonSerializerWriter.WriteObject(const AWriter: TJsonWriter; const Value: TValue;
  const AContract: TJsonObjectContract);
var
  LProperty: TJsonProperty;
begin
  AWriter.WriteStartObject;
  for LProperty in AContract.Properties do
    WriteProperty(AWriter, Value, LProperty, AContract);
  AWriter.WriteEndObject;
end;

procedure TJsonSerializerWriter.WritePrimitive(const AWriter: TJsonWriter; const AValue: TValue;
  const AContract: TJsonPrimitiveContract);
var
  LDateTime: TDateTime;
begin
  case AContract.Kind of
    TJsonPrimitiveKind.Int8,
    TJsonPrimitiveKind.UInt8,
    TJsonPrimitiveKind.Int16,
    TJsonPrimitiveKind.UInt16,
    TJsonPrimitiveKind.Int32:
      AWriter.WriteValue(AValue.AsInteger);
    TJsonPrimitiveKind.UInt32:
      AWriter.WriteValue(UInt32(AValue.AsUInt64));
    TJsonPrimitiveKind.Int64,
    TJsonPrimitiveKind.Comp:
      AWriter.WriteValue(AValue.AsInt64);
    TJsonPrimitiveKind.UInt64:
      AWriter.WriteValue(AValue.AsUInt64);
    TJsonPrimitiveKind.Single,
    TJsonPrimitiveKind.Double,
    TJsonPrimitiveKind.Extended:
      AWriter.WriteValue(AValue.AsExtended);
    TJsonPrimitiveKind.Currency:
      AWriter.WriteValue(AValue.AsCurrency);
    TJsonPrimitiveKind.String:
      AWriter.WriteValue(AValue.AsString);
    TJsonPrimitiveKind.Char:
      AWriter.WriteValue(AValue.AsString);
    TJsonPrimitiveKind.Boolean:
      AWriter.WriteValue(AValue.AsBoolean);
    TJsonPrimitiveKind.Enumeration:
      AWriter.WriteValue(TValueData(AValue).FAsSLong);
    TJsonPrimitiveKind.Set:
    begin
      case GetTypeData(AContract.TypeInf)^.OrdType of
        otSByte: AWriter.WriteValue(Int8(AValue.GetReferenceToRawData^));
        otSWord: AWriter.WriteValue(Int16(AValue.GetReferenceToRawData^));
        otSLong: AWriter.WriteValue(Int32(AValue.GetReferenceToRawData^));
        otUByte: AWriter.WriteValue(UInt8(AValue.GetReferenceToRawData^));
        otUWord: AWriter.WriteValue(UInt16(AValue.GetReferenceToRawData^));
        otULong: AWriter.WriteValue(UInt32(AValue.GetReferenceToRawData^));
      end;
    end;
    TJsonPrimitiveKind.DateTime:
    begin
      LDateTime := AValue.AsExtended;
      AWriter.WriteValue(LDateTime);
    end;
  end;
end;

procedure TJsonSerializerWriter.WriteValue(const AWriter: TJsonWriter; const AValue: TValue;
  const AContract: TJsonContract);
var
  LConverter: TJsonConverter;
begin
  LConverter := ResolveConverter(AContract);
  if (LConverter <> nil) and (LConverter.CanWrite)  then
    LConverter.WriteJson(AWriter, AValue, GetInternalSerializer)
  else
  begin
    if AValue.IsEmpty and not AValue.IsArray then
      AWriter.WriteNull
    else
      case AContract.ContractType of
        TJsonContractType.Primitive:
          WritePrimitive(AWriter, AValue, TJsonPrimitiveContract(AContract));
        TJsonContractType.Object:
          WriteObject(AWriter, AValue, TJsonObjectContract(AContract));
        TJsonContractType.Array:
          WriteArray(AWriter, AValue, TJsonArrayContract(AContract));
        TJsonContractType.Class:
          WriteClass(AWriter, AValue, TJsonClassContract(AContract));
        TJsonContractType.Converter:
          // skip, ConverterContract only is adressed with converters
           AWriter.WriteNull;
    end;
  end;
end;

procedure TJsonSerializer.Populate<T>(const AJson: string; var AValue: T);
var
  StringReader: TStringReader;
begin
  StringReader := TStringReader.Create(AJson);
  try
    Populate<T>(StringReader, AValue);
  finally
    StringReader.Free;
  end;
end;

function TJsonSerializer.Serialize<T>(const AValue: T): string;
var
  StringBuilder: TStringBuilder;
  StringWriter: TStringWriter;
begin
  StringBuilder := TStringBuilder.Create(256);
  StringWriter := TStringWriter.Create(StringBuilder);
  try
    Serialize<T>(StringWriter, AValue);
    Result := StringBuilder.ToString(True);
  finally
    StringWriter.Free;
    StringBuilder.Free;
  end;
end;

{ TJsonConverter }

function TJsonConverter.CanRead: Boolean;
begin
  Result := True;
end;

function TJsonConverter.CanWrite: Boolean;
begin
  Result := True;
end;

{ TJsonContract }

constructor TJsonContract.Create(ATypeInf: PTypeInfo);
begin
  FTypeInf := ATypeInf;
end;

{ TJsonPrimitiveContract }

constructor TJsonPrimitiveContract.Create(ATypeInf: PTypeInfo; AKind: TJsonPrimitiveKind);
begin
  inherited Create(ATypeInf);
  FContractType := TJsonContractType.Primitive;
  FKind := AKind;
end;

{ TJsonSerializerReader }

function TJsonSerializerReader.CreateObject(const AReader: TJsonReader; out AValue: TValue;
  const AContract: TJsonContract; const ExistingValue: TValue): Boolean;
var
  LObjectContract: TJsonObjectContract;
begin
  Result := True;
  case AContract.ContractType of
    TJsonContractType.Object:
    begin
      // Object
      LObjectContract := TJsonObjectContract(AContract);

      if ExistingValue.IsEmpty then
      begin
        if LObjectContract.DefaultCreator = nil then
          raise EJsonSerializationException.Create(Format(SErrorTypeNotInstantiable, [AContract.TypeInf^.Name]));

        AValue := LObjectContract.DefaultCreator.Invoke([]);
      end
      else
        AValue := ExistingValue;
      PopulateObject(AReader, AValue, LObjectContract)
    end;
    else
      raise EJsonSerializationException.Create(SUnexpectedTokenReadObject);
  end
end;

function TJsonSerializerReader.CreatePrimitive(const AReader: TJsonReader; out AValue: TValue;
  const AContract: TJsonContract): Boolean;
var
  LPrimitiveContract: TJsonPrimitiveContract;
  LTypeInfo: PTypeInfo;
begin
  Result := True;
  case AContract.ContractType of
  TJsonContractType.Class:
    begin
      if AReader.Value.IsEmpty then
        AValue := TValue.From<TClass>(nil)
      else
      begin
        LTypeInfo := FSerializer.TypeResolver.ResolveType(AReader.Value.AsString);
        if LTypeInfo = nil then
          raise EJsonSerializationException.Create(Format('Cannot find the type %s', [AReader.Value.AsString]));
        if LTypeInfo^.Kind <> tkClassRef then
          raise EJsonSerializationException.Create(Format('Type %s is not Class type', [AReader.Value.AsString]));
        AValue := LTypeInfo^.TypeData^.ClassType;
      end;
    end;
    TJsonContractType.Primitive:
    begin
      LPrimitiveContract := TJsonPrimitiveContract(AContract);
      case LPrimitiveContract.Kind of
        TJsonPrimitiveKind.Int8,
        TJsonPrimitiveKind.UInt8,
        TJsonPrimitiveKind.Int16,
        TJsonPrimitiveKind.UInt16,
        TJsonPrimitiveKind.Int32:
          AValue := AReader.Value.AsInteger;
        TJsonPrimitiveKind.Int64,
        TJsonPrimitiveKind.Comp:
          AValue := AReader.Value.AsInt64;
        TJsonPrimitiveKind.UInt32,
        TJsonPrimitiveKind.UInt64:
          AValue := AReader.Value.AsUInt64;
        TJsonPrimitiveKind.Single,
        TJsonPrimitiveKind.Double,
        TJsonPrimitiveKind.Extended:
          AValue := AReader.Value.AsExtended;
        TJsonPrimitiveKind.Currency:
          AValue := AReader.Value.AsCurrency;
        TJsonPrimitiveKind.String,
        TJsonPrimitiveKind.Char:
          AValue := AReader.Value.AsString;
        TJsonPrimitiveKind.Enumeration,
        TJsonPrimitiveKind.Set:
          TValue.Make(AReader.Value.GetReferenceToRawData, AContract.TypeInf, AValue);
        TJsonPrimitiveKind.DateTime:
          AValue := AReader.Value.AsExtended;
        TJsonPrimitiveKind.Boolean:
          AValue := AReader.Value.AsBoolean;
        else
          raise EArgumentException.Create(Format(SUnexpectedEnumerationValue, [GetName(LPrimitiveContract.Kind)]));
      end;
    end;
    TJsonContractType.Converter:
    begin
      // skip, reference procedures can be only resolved with converters
    end
    else
      raise Exception.Create('');
  end;
end;

function TJsonSerializerReader.CreateValue(const AReader: TJsonReader; out AValue: TValue; const Contract: TJsonContract;
  const AConverter: TJsonConverter; const ExistingValue: TValue): Boolean;
begin
  // skip this kind of contract, only can be deserialized with a converter
  if Contract.ContractType = TJsonContractType.Converter then
    Exit(False);

  repeat
    case AReader.TokenType of
      TJsonToken.StartObject:
        Exit(CreateObject(AReader, AValue, Contract, ExistingValue));
      TJsonToken.StartArray:
        Exit(CreateArray(AReader, AValue, Contract));
      TJsonToken.Integer,
      TJsonToken.Float,
      TJsonToken.String,
      TJsonToken.Date,
      TJsonToken.Bytes,
      TJsonToken.Boolean,
      TJsonToken.StartConstructor:
        Exit(CreatePrimitive(AReader, AValue, Contract));
      TJsonToken.Null,
      TJsonToken.Undefined:
        Exit(ReadNullValue(AReader, AValue, Contract));
      TJsonToken.Comment:
        // ignore
      ;
  //      TJsonToken.Comment,
  //      TJsonToken.Raw,

  //      TJsonToken.PropertyName,
  //      TJsonToken.EndObject,
  //      TJsonToken.EndArray,
  //      TJsonToken.EndConstructor,
      else
        raise EJsonSerializationException.Create(Format(SUnexpectedToken, [GetName(AReader.TokenType)]));
    end;
  until not AReader.Read;
  raise EJsonSerializationException.Create(SUnexpectedEndDeserializeObject);
end;

procedure TJsonSerializerReader.InternalDeserialize(const AReader: TJsonReader; var AValue : TValue;
  const AContract: TJsonContract);
var
  LConverter: TJsonConverter;
begin
  LConverter := ResolveConverter(AContract);
  if not ReadForType(AReader, AContract, LConverter <> nil) then
    raise EJsonSerializationException.Create(SUnexpectedEndDeserializeValue);
  if (LConverter <> nil) and (LConverter.CanRead) then
    AValue := LConverter.ReadJson(AReader, AContract.TypeInf, TValue.Empty, GetInternalSerializer)
  else
    if not CreateValue(AReader, AValue, AContract, LConverter, TValue.Empty) then
      raise Exception.Create('');                                 
end;

function TJsonSerializerReader.Deserialize(const AReader: TJsonReader; ATypeInf: PTypeInfo): TValue;
begin
  InternalDeserialize(AReader, Result, FSerializer.ContractResolver.ResolveContract(ATypeInf));
end;

destructor TJsonSerializerReader.Destroy;
begin
  if FProxySerializer <> nil then
    FProxySerializer.Free;
  inherited;
end;

function TJsonSerializerReader.GetInternalSerializer: TJsonSerializerProxy;
begin
  if FProxySerializer = nil then
    FProxySerializer := TJsonSerializerProxy.Create(Self);
  Result := FProxySerializer;
end;

function TJsonSerializerReader.TypeToRead(const AContract: TJsonContract): TJsonReader.TReadType;
begin
  if AContract is TJsonPrimitiveContract then
  begin
    case TJsonPrimitiveContract(AContract).Kind of
      TJsonPrimitiveKind.Int8,
      TJsonPrimitiveKind.UInt8,
      TJsonPrimitiveKind.Int16,
      TJsonPrimitiveKind.UInt16,
      TJsonPrimitiveKind.Int32,
      TJsonPrimitiveKind.UInt32,
      TJsonPrimitiveKind.Set,
      TJsonPrimitiveKind.Enumeration:
        Result := TJsonReader.TReadType.ReadAsInteger;
//      TJsonPrimitiveKind.Int64,
//      TJsonPrimitiveKind.UInt64:
//        Result := TJsonReader.TReadType.ReadAsInt64;
      TJsonPrimitiveKind.Single,
      TJsonPrimitiveKind.Double,
      TJsonPrimitiveKind.Extended:
        Result := TJsonReader.TReadType.ReadAsDouble;
      TJsonPrimitiveKind.DateTime:
        Result := TJsonReader.TReadType.ReadAsDateTime;
      TJsonPrimitiveKind.String,
      TJsonPrimitiveKind.Char:
        Result := TJsonReader.TReadType.ReadAsString;
      else
        Result := TJsonReader.TReadType.Read;
    end;
  end
  else
    Result := TJsonReader.TReadType.Read;
end;

procedure TJsonSerializerReader.Populate(const AReader: TJsonReader; var AValue: TValue);
var
  LContract: TJsonContract;
begin
  LContract := ResolveContract(AValue.TypeInfo);
  if AReader.TokenType = TJsonToken.None then
    AReader.Read;
  case AReader.TokenType of
  TJsonToken.StartObject:
    if (LContract is TJsonObjectContract)  then
      PopulateObject(AReader, AValue, TJsonObjectContract(LContract))
    else
      raise EJsonSerializationException.Create(SUnexpectedTokenPopulateObject);
  TJsonToken.StartArray:
    if (LContract is TJsonArrayContract)  then
      CreateArray(AReader, AValue, TJsonArrayContract(LContract))
    else
      raise EJsonSerializationException.Create(SUnexpectedTokenPopulateArray);
  else
    raise ENotImplemented.Create('Implement population for rest of the types');                   
end;
end;

procedure TJsonSerializerReader.PopulateArray(const AReader: TJsonReader; var AArray: TArray<TValue>;
  const AContract: TJsonArrayContract);
var
  Finished: Boolean;
  Index: Integer;
  ArrayItem: TValue;
  LConverter: TJsonConverter;
  LItemCreated: Boolean;
begin
  Finished := False;
  Index := 0;
  if AContract.ItemContract = nil then
    AContract.ItemContract := FSerializer.ContractResolver.ResolveContract(AContract.ArrayType);
  LConverter := ResolveConverter(AContract.ItemContract);
  while (not Finished) and ReadForType(AReader, AContract.ItemContract, LConverter <> nil) do
  begin
    case AReader.TokenType of
      TJsonToken.EndArray:
        Finished := True;
      TJsonToken.Comment:
        // ignore
      ;
      else
      begin
        if (LConverter <> nil) and LConverter.CanRead then
        begin
          ArrayItem := LConverter.ReadJson(AReader, AContract.ItemContract.TypeInf, TValue.Empty, GetInternalSerializer);
          LItemCreated := True;
        end
        else
          LItemCreated := CreateValue(AReader, ArrayItem, AContract.ItemContract, LConverter, nil);
        if LItemCreated then
        begin
          SetLength(AArray, Index + 1);
          AArray[Index] := ArrayItem;
          Inc(Index);
        end;
      end;
    end;
  end;
  if not Finished then
    raise EJsonSerializationException.Create(SUnexpectedEndDeserializeArray);
end;

procedure TJsonSerializerReader.PopulateObject(const AReader: TJsonReader; const AValue: TValue;
  const AContract: TJsonObjectContract);
var
  LFinished: Boolean;
  LProperty: TJsonProperty;
  LMemberContract: TJsonContract;
  LConverter: TJsonConverter;
begin
  LFinished := False;
  while (not LFinished) and AReader.Read do
  begin
    case AReader.TokenType of
      TJsonToken.PropertyName:
      begin
        LProperty := AContract.GetClosestMatchProperty(AReader.Value.AsString);
        if (LProperty = nil) then
        begin
          if not AReader.Read then
            Break
          else
            AReader.Skip
        end
        else
        begin
          if (LProperty.Ignored) then
          begin
            AReader.Skip;
            Continue;
          end;

          // Get the next contract
          if LProperty.Contract = nil then
            LProperty.Contract := ResolveContract(LProperty.TypeInf);

          LMemberContract := LProperty.Contract;
          if (LMemberContract <> nil) then
          begin
            // Get the converter
            if LProperty.Converter <> nil then
              LConverter := LProperty.Converter
            else
              LConverter := ResolveConverter(LMemberContract);

            // try read
            if not ReadForType(AReader, LMemberContract, LConverter <> nil) then
              Break;

            if not SetPropertyValue(LProperty, LConverter, LMemberContract, AReader, AValue) then
             AReader.Skip;
          end
          else
            AReader.Skip;
        end;
      end;
      TJsonToken.EndObject:
        LFinished := True;
      TJsonToken.Comment:
        //ignore
      ;
      else
        raise EJsonSerializationException.Create(Format(SUnexpectedTokenDeserializeObject, [GetName(AReader.TokenType)]));
      end;
  end;

  if not LFinished then
    raise EJsonSerializationException.Create(SUnexpectedEndDeserializeObject)
end;

function TJsonSerializerReader.CreateArray(const AReader: TJsonReader; out AValue: TValue;
  const AContract: TJsonContract): Boolean;
var
  LArray: TArray<TValue>;
begin
  case AContract.ContractType of
    TJsonContractType.Array:
    begin
      Result := True;
      SetLength(LArray, 0);
      PopulateArray(AReader, LArray, TJsonArrayContract(AContract));
      AValue := TValue.FromArray(AContract.TypeInf, LArray);
    end
    else
      raise EJsonSerializationException.Create(SUnexpectedTokenReadArray);
  end;
end;

function TJsonSerializerReader.ReadForType(const AReader: TJsonReader; const AContract: TJsonContract; AHasConverter: Boolean): Boolean;
begin
  if AHasConverter then
    Exit(AReader.Read);

  case TypeToRead(AContract) of
    TJsonReader.TReadType.Read:
      repeat
        if not AReader.Read then
          Exit(False);
      until (AReader.TokenType <> TJsonToken.Comment) ;
    TJsonReader.TReadType.ReadAsInteger:
      AReader.ReadAsInteger;
    TJsonReader.TReadType.ReadAsBytes:
      AReader.ReadAsBytes;
    TJsonReader.TReadType.ReadAsString:
      AReader.ReadAsString;
    TJsonReader.TReadType.ReadAsDouble:
      AReader.ReadAsDouble;
    TJsonReader.TReadType.ReadAsDateTime:
      AReader.ReadAsDateTime;
  end;
  Result := True;
end;

function TJsonSerializerReader.ReadNullValue(const AReader: TJsonReader; out AValue: TValue;
  const AContract: TJsonContract): Boolean;
begin
   Exit(False);
                                                                      
//  if Contract is TJsonReferenceContract then
//    Value := TValue.Empty
//  else if Contract is TJsonPrimitiveContract then
//    case TJsonPrimitiveContract(Contract).Kind of
//      TJsonPrimitiveKind.Int8,
//      TJsonPrimitiveKind.UInt8,
//      TJsonPrimitiveKind.Int16,
//      TJsonPrimitiveKind.UInt16,
//      TJsonPrimitiveKind.Int32,
//      TJsonPrimitiveKind.UInt32,
//      TJsonPrimitiveKind.Int64,
//      TJsonPrimitiveKind.UInt64,
//      TJsonPrimitiveKind.Single,
//      TJsonPrimitiveKind.Double:
//      TJsonPrimitiveKind.Extended:
//        Value := 0;
//      TJsonPrimitiveKind.String,
//      TJsonPrimitiveKind.Char:
//        Value := '';
//      TJsonPrimitiveKind.Set,
//      TJsonPrimitiveKind.Enumeration:
//        Exit(False);
//      TJsonPrimitiveKind.DateTime:
//        Exit(False);
//      TJsonPrimitiveKind.Boolean:
//        Exit(False);
//    end
//
//  else if Contract is TJsonArrayContract then
//    Value := TValue.Empty
//  else if Contract is TJsonRecordContract then
//    Exit(False)
//  else if Contract is TJsonClassContract then
//    Value := TValue.Empty
//  else if Contract is TJsonObjectContract then
//    Value := TValue.Empty
end;

function TJsonSerializerReader.SetPropertyValue(const AProperty: TJsonProperty; const AConverter: TJsonConverter;
  const AContract: TJsonContract; const AReader: TJsonReader; const ATarget: TValue): Boolean;
var
  LConverter: TJsonConverter;
  LObjectHandling: TJsonObjectHandling;
  LExistingValue, LNewValue: TValue;
  LUseExistingValue, LGottenValue: Boolean;
{$IFNDEF AUTOREFCOUNT}
  LFreeExistingValue: Boolean;
  LObjectOwnership: TJsonObjectOwnership;
{$ENDIF}
  LContract: TJsonContract;
begin
  LExistingValue := TValue.Empty;
{$IFNDEF AUTOREFCOUNT}
  LFreeExistingValue := False;
{$ENDIF}
  LUseExistingValue := False;
  LGottenValue := False;
  if AContract.TypeInf^.Kind in [tkRecord, tkMRecord, tkClass, tkInterface] then
  begin
    // A record in a non-writable property can't do anything with it
    if (AContract.TypeInf^.Kind in [tkRecord, tkMRecord]) and not AProperty.Writable then Exit(False);

    // Evaluate the object handling
    LObjectHandling := AProperty.ObjectHandling;
    if LObjectHandling = TJsonObjectHandling.Auto then
      LObjectHandling := FSerializer.ObjectHandling;
{$IFNDEF AUTOREFCOUNT}
    LObjectOwnership := AProperty.ObjectOwnership;
    if LObjectOwnership = TJsonObjectOwnership.Auto then
      LObjectOwnership := FSerializer.ObjectOwnership;
{$ENDIF}
    if AProperty.Readable then
    begin
      if LObjectHandling in [TJsonObjectHandling.Auto, TJsonObjectHandling.Reuse] then
      begin
        LExistingValue := AProperty.ValueProvider.GetValue(ATarget);
        LGottenValue := True;
        LUseExistingValue := True;
      end
{$IFNDEF AUTOREFCOUNT}
      else if (LObjectHandling = TJsonObjectHandling.Replace)
        and (AContract.TypeInf^.Kind = tkClass)
        and (LObjectOwnership in [TJsonObjectOwnership.Auto, TJsonObjectOwnership.Owned]) then
      begin
        LExistingValue := AProperty.ValueProvider.GetValue(ATarget);
        LGottenValue := True;
        LFreeExistingValue := True;
      end
{$ENDIF}
    end
  end
  else if AContract.Ignored or not AProperty.Writable then
    Exit(False);

  if not AProperty.Writable and not LUseExistingValue then
    Exit(False);

  // an existing object may can have a different type than the Field/Property one
  if not AContract.Sealed and LUseExistingValue and (LExistingValue.TypeInfo <> AContract.TypeInf) then
  begin
    LContract := ResolveContract(LExistingValue.TypeInfo);
    if LContract.Ignored then
      Exit(False);
    LConverter := ResolveConverter(LContract);
  end
  else
  begin
    LContract := AContract;
    LConverter := AConverter;
  end;

  if (LConverter <> nil) and (LConverter.CanRead) then
  begin
    // When a converter is set on type/property it should receive the ExistinValue, so get it (if it was not gotten)
    if (not LGottenValue) and AProperty.Readable then
      LExistingValue := AProperty.ValueProvider.GetValue(ATarget);
    LNewValue := LConverter.ReadJson(AReader, LContract.TypeInf, LExistingValue, GetInternalSerializer);
    Result := True;
  end
  else
  if LUseExistingValue then
    Result := CreateValue(AReader, LNewValue, LContract, LConverter, LExistingValue)
  else
    Result := CreateValue(AReader, LNewValue, LContract, LConverter, TValue.Empty);

  if Result and AProperty.Writable then
    AProperty.ValueProvider.SetValue(ATarget, LNewValue);

{$IFNDEF AUTOREFCOUNT}
  if LFreeExistingValue and (not LExistingValue.IsEmpty) and (LExistingValue.GetReferenceToRawData <> LNewValue.GetReferenceToRawData) then
    LExistingValue.AsObject.Free;
{$ENDIF}
end;

{ TJsonObjectContract }

constructor TJsonObjectContract.Create(ATypeInf: PTypeInfo);
begin
  inherited Create(ATypeInf);
  FContractType := TJsonContractType.Object;
  FProperties := TObjectList<TJsonProperty>.Create;
end;

destructor TJsonObjectContract.Destroy;
begin
  FProperties.Free;
  inherited;
end;


function TJsonObjectContract.GetClosestMatchProperty(const AName: string): TJsonProperty;
var
  I: Integer;
begin
  for I := 0 to FProperties.Count - 1 do
    if SameText(FProperties[I].Name, AName) then
      Exit(FProperties[I]);
  Result := nil;
end;

{ TJsonClassContract }

constructor TJsonClassContract.Create(ATypeInf: PTypeInfo);
begin
  inherited Create(ATypeInf);
  FContractType := TJsonContractType.Class;
end;

function TJsonClassContract.ResolveClassByName(const Name: string): TClass;
var
  RttiType: TRttiType;
begin
  RttiType := Ctx.FindType(Name);
  if RttiType <> nil then
    Result := (RttiType as TRttiInstanceType).MetaClassType
  else
    Result := nil;
end;

{ TJsonArrayContract }

constructor TJsonArrayContract.Create(ATypeInf: PTypeInfo);
begin
  inherited Create(ATypeInf);
  FContractType := TJsonContractType.Array;
end;

function TJsonArrayContract.GetArrayType: PTypeInfo;
var
  RttiType: TRttiType;
begin
  RttiType := Ctx.GetType(FTypeInf);
  if rttiType is TRttiArrayType then
    Result := TRttiArrayType(RttiType).ElementType.Handle
  else
    Result := TRttiDynamicArrayType(RttiType).ElementType.Handle;
end;

{ JsonConverterAttribute }

constructor JsonConverterAttribute.Create(const AValue: TClass);
begin
  FValue := AValue;
end;

{ TJsonReferenceContract }

constructor TJsonConverterContract.Create(ATypeInf: PTypeInfo);
begin
  inherited;
  FContractType := TJsonContractType.Converter;
end;

{ JsonNameAttribute }

constructor JsonNameAttribute.Create(const AValue: string);
begin
  FValue := AValue;
end;

{ TJsonSerializerProxy }

constructor TJsonSerializerProxy.Create(const ASerializerWriter: TJsonSerializerWriter);
begin
  FSerializerWriter := ASerializerWriter;
  FSerializer := ASerializerWriter.FSerializer;
end;

constructor TJsonSerializerProxy.Create(const ASerializerReader: TJsonSerializerReader);
begin
  FSerializerReader := ASerializerReader;
  FSerializer := ASerializerReader.FSerializer;
end;

function TJsonSerializerProxy.GetContractResolver: IJsonContractResolver;
begin
  Result := FSerializer.ContractResolver;
end;

function TJsonSerializerProxy.GetConverters: TList<TJsonConverter>;
begin
  Result := FSerializer.Converters;
end;

function TJsonSerializerProxy.GetDateFormatHandling: TJsonDateFormatHandling;
begin
  Result := FSerializer.DateFormatHandling;
end;

function TJsonSerializerProxy.GetDateParseHandling: TJsonDateParseHandling;
begin
  Result := FSerializer.DateParseHandling;
end;

function TJsonSerializerProxy.GetDateTimeZoneHandling: TJsonDateTimeZoneHandling;
begin
  Result := FSerializer.DateTimeZoneHandling;
end;

function TJsonSerializerProxy.GetFloatFormatHandling: TJsonFloatFormatHandling;
begin
  Result := FSerializer.FloatFormatHandling;
end;

function TJsonSerializerProxy.GetFormatting: TJsonFormatting;
begin
  Result := FSerializer.Formatting;
end;

function TJsonSerializerProxy.GetMaxDepth: Integer;
begin
  Result := FSerializer.MaxDepth;
end;

function TJsonSerializerProxy.GetObjectHandling: TJsonObjectHandling;
begin
  Result := FSerializer.ObjectHandling;
end;

function TJsonSerializerProxy.GetObjectOwnership: TJsonObjectOwnership;
begin
  Result := FSerializer.ObjectOwnership;
end;

//function TJsonSerializerProxy.GetReferenceResolver: IJsonReferenceResolver;
//begin
//  Result := FSerializer.ReferenceResolver;
//end;

function TJsonSerializerProxy.GetStringEscapeHandling: TJsonStringEscapeHandling;
begin
  Result := FSerializer.StringEscapeHandling;
end;

function TJsonSerializerProxy.GetTypeResolver: IJsonTypeResolver;
begin
  Result := FSerializer.TypeResolver;
end;

function TJsonSerializerProxy.InternalDeserialize(const AReader: TJsonReader; ATypeInf: PTypeInfo): TValue;
begin
  if FSerializerReader <> nil then
    Result := FSerializerReader.Deserialize(AReader, ATypeInf)
  else
    Result := FSerializer.InternalDeserialize(AReader, ATypeInf);
end;

procedure TJsonSerializerProxy.InternalPopulate(const AReader: TJsonReader; var AValue: TValue);
begin
  if FSerializerReader <> nil then
    FSerializerReader.Populate(AReader, AValue)
  else
    FSerializer.InternalPopulate(AReader, AValue);
end;

procedure TJsonSerializerProxy.InternalSerialize(const AWriter: TJsonWriter; const AValue: TValue);
begin
  if FSerializerWriter <> nil then
    FSerializerWriter.Serialize(AWriter, AValue)
  else
    FSerializer.InternalSerialize(AWriter, AValue);
end;

procedure TJsonSerializerProxy.SetContractResolver(const AValue: IJsonContractResolver);
begin
  FSerializer.ContractResolver := AValue;
end;

procedure TJsonSerializerProxy.SetDateFormatHandling(AValue: TJsonDateFormatHandling);
begin
  FSerializer.DateFormatHandling := AValue;
end;

procedure TJsonSerializerProxy.SetDateParseHandling(AValue: TJsonDateParseHandling);
begin
  FSerializer.DateParseHandling := AValue;
end;

procedure TJsonSerializerProxy.SetDateTimeZoneHandling(AValue: TJsonDateTimeZoneHandling);
begin
  FSerializer.DateTimeZoneHandling := AValue;
end;

procedure TJsonSerializerProxy.SetFloatFormatHandling(AValue: TJsonFloatFormatHandling);
begin
  FSerializer.FloatFormatHandling := AValue;
end;

procedure TJsonSerializerProxy.SetFormatting(AValue: TJsonFormatting);
begin
  FSerializer.Formatting := AValue;
end;

procedure TJsonSerializerProxy.SetMaxDepth(AValue: Integer);
begin
  FSerializer.MaxDepth := AValue;
end;

procedure TJsonSerializerProxy.SetObjectHandling(const AValue: TJsonObjectHandling);
begin
  FSerializer.ObjectHandling := AValue;
end;

procedure TJsonSerializerProxy.SetObjectOwnership(const AValue: TJsonObjectOwnership);
begin
  FSerializer.ObjectOwnership := AValue;
end;

//procedure TJsonSerializerProxy.SetReferenceResolver(const AValue: IJsonReferenceResolver);
//begin
//  FSerializer.ReferenceResolver := AValue;
//end;

procedure TJsonSerializerProxy.SetStringEscapeHandling(AValue: TJsonStringEscapeHandling);
begin
  FSerializer.StringEscapeHandling := AValue;
end;

procedure TJsonSerializerProxy.SetTypeResolver(const AValue: IJsonTypeResolver);
begin
  FSerializer.TypeResolver := AValue;
end;

{ JsonDefaultTypeResolver }

function TJsonDefaultTypeResolver.ResolveName(const ATypeInf: PTypeInfo): string;
begin
  Result := Ctx.GetType(ATypeInf).QualifiedClassName;
end;

function TJsonDefaultTypeResolver.ResolveType(const ATypeName: string): PTypeInfo;
var
  RttiType: TRttiType;
begin
  RttiType := Ctx.FindType(ATypeName);
  if RttiType <> nil then
    Result := (RttiType as TRttiInstanceType).Handle
  else
    Result := nil;
end;

//{ TJsonDefaultReferenceResolver }
//
//procedure TJsonDefaultReferenceResolver.AddReferenced(const AContext: TObject; const AReference: string;
//  const AValue: Pointer);
//begin
//  GetRefNameDict(AContext).AddOrSetValue(AValue, AReference);
//  GetNameRefDict(AContext).AddOrSetValue(AReference, AValue);
//end;
//
//function TJsonDefaultReferenceResolver.GetNameRefDict(const AContext: TObject): TDictionary<string, Pointer>;
//begin
//  if AContext is TJsonSerializerBase then
//    Result := TJsonSerializerBase(AContext).FNameRefDict
//  else
//    raise EJsonException.Create(SDefaultReferenceResolverInternally);
//end;
//
//function TJsonDefaultReferenceResolver.GetReference(const AContext: TObject; AValue: Pointer): string;
//var
//  RefNameDict: TDictionary<Pointer, string>;
//begin
//  RefNameDict := GetRefNameDict(AContext);
//  if not RefNameDict.TryGetValue(AValue, Result) then
//  begin
//    Inc(FReferenceCount);
//    Result := FReferenceCount.ToString;
//    RefNameDict.Add(AValue, Result);
//  end;
//end;
//
//function TJsonDefaultReferenceResolver.GetRefNameDict(const AContext: TObject): TDictionary<Pointer, string>;
//begin
//  if AContext is TJsonSerializerBase then
//    Result := TJsonSerializerBase(AContext).FRefNameDict
//  else
//    raise EJsonException.Create(SDefaultReferenceResolverInternally);
//end;
//
//function TJsonDefaultReferenceResolver.IsReferenced(const AContext: TObject; AValue: Pointer): Boolean;
//begin
//  Result := GetRefNameDict(AContext).ContainsKey(AValue)
//end;
//
//function TJsonDefaultReferenceResolver.ResolveReference(const AContext: TObject; const AReference: string): Pointer;
//begin
//  GetNameRefDict(AContext).TryGetValue(AReference, Result)
//end;

{ TJsonValueProvider }

function TJsonValueProvider.GetValue(const AInstance: TValue): TValue;
begin
  case AInstance.TypeInfo^.Kind of
    tkRecord, 
    tkMRecord: Result := InternalGetValue(AInstance.GetReferenceToRawData);
    tkClass: Result := InternalGetValue(Pointer(AInstance.GetReferenceToRawData^))
  end;
end;

procedure TJsonValueProvider.SetValue(const AInstance, AValue: TValue);
begin
  case AInstance.TypeInfo^.Kind of
    tkRecord,
    tkMRecord: InternalSetValue(Pointer(AInstance.GetReferenceToRawData), AValue);
    tkClass: InternalSetValue(Pointer(AInstance.GetReferenceToRawData^), AValue);
  end;
end;

{ TJsonFieldValueProvider }

constructor TJsonFieldValueProvider.Create(const ARttiField: TRttiField);
begin
  FRttiField := ARttiField;
end;

function TJsonFieldValueProvider.InternalGetValue(const AInstance: Pointer): TValue;
begin
  Result := FRttiField.GetValue(AInstance);
end;

procedure TJsonFieldValueProvider.InternalSetValue(const AInstance: Pointer; const AValue: TValue);
begin
  FRttiField.SetValue(AInstance, AValue);
end;

{ TJsonPropertyValueProvider }

constructor TJsonPropertyValueProvider.Create(const ARttiProperty: TRttiProperty);
begin
  FRttiProperty := ARttiProperty;
end;

function TJsonPropertyValueProvider.InternalGetValue(const AInstance: Pointer): TValue;
begin
  Result := FRttiProperty.GetValue(AInstance);
end;

procedure TJsonPropertyValueProvider.InternalSetValue(const AInstance: Pointer; const AValue: TValue);
begin
  FRttiProperty.SetValue(AInstance, AValue);
end;

{ JsonSerializeAttribute }

constructor JsonSerializeAttribute.Create(AValue: TJsonMemberSerialization);
begin
  FValue := AValue;
end;

{ TJsonObjectCreator }

constructor TJsonObjectCreator.Create(const AMetaClass: TClass; const AConstructor: TRttiMethod);
begin
  FMetaClass := AMetaClass;
  FConstructor := AConstructor;
end;

function TJsonObjectCreator.Invoke(const Params: array of TValue): TValue;
begin
  Result := FConstructor.Invoke(FMetaClass, Params);
end;

{ TJsonRecordCreator }

constructor TJsonRecordCreator.Create(ATypeInf: PTypeInfo; const AParametrizedConstructor: TRttiMethod);
begin
  FTypeInf := ATypeInf;
  FParametrizedConstructor := AParametrizedConstructor;
end;

function TJsonRecordCreator.Invoke(const Params: array of TValue): TValue;
begin
  TValue.Make(nil, Ctx.GetType(FTypeInf).Handle, Result);
  if Length(Params) > 0 then
    FParametrizedConstructor.Invoke(TValue.From<Pointer>(Result.GetReferenceToRawData), Params);
end;

{ TJsonInlineAttributes }

class constructor TJsonInlineAttributes.Create;
begin
  FCachedObjects := TDictionary<TRttiObject, Boolean>.Create;
  FAttributes := TDictionary<TAttrKey, TCustomAttribute>.Create;
end;

class destructor TJsonInlineAttributes.Destroy;
begin
  FCachedObjects.Free;
  FAttributes.Free;
end;

class function TJsonInlineAttributes.GetAttribute(const ARttiObject: TRttiObject; const AAttributeClass: TClass; AInherit: Boolean): TCustomAttribute;
begin
  if ARttiObject = nil then
    Result := nil
  else
  begin
    LoadAttributes(ARttiObject);
    FAttributes.TryGetValue(TAttrKey.Create(ARttiObject, AAttributeClass), Result);
    if AInherit and (Result = nil) and (ARttiObject is TRttiInstanceType)  then
      Result := GetAttribute(TRttiInstanceType(ARttiObject).BaseType, AAttributeClass, AInherit);
  end;
end;

class procedure TJsonInlineAttributes.LoadAttributes(const ARttiObject: TRttiObject);
var
  Attr: TCustomAttribute;
begin
  if FCachedObjects.ContainsKey(ARttiObject) then
    Exit
  else
    FCachedObjects.Add(ARttiObject, True);
  for Attr in ARttiObject.GetAttributes do
    FAttributes.AddOrSetValue(TAttrKey.Create(ARttiObject, Attr.ClassType), Attr);
end;

{ TJsonDynamicAttributes }

procedure TJsonDynamicAttributes.AddAttribute(const ARttiObject: TRttiObject; const AAttribute: TCustomAttribute);
begin
  FAttributes.AddOrSetValue(TAttrKey.Create(ARttiObject, AAttribute.ClassType), AAttribute);
end;

procedure TJsonDynamicAttributes.Clear;
begin
  FAttributes.Clear;
end;

constructor TJsonDynamicAttributes.Create;
begin
  inherited Create;
  FAttributes := TObjectDictionary<TAttrKey, TCustomAttribute>.Create;
end;

destructor TJsonDynamicAttributes.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

function TJsonDynamicAttributes.GetAttribute(const ARttiObject: TRttiObject; const AAttributeClass: TClass;
  AInherit: Boolean): TCustomAttribute;
begin
  if ARttiObject = nil then
    Result := nil
  else
  begin
    FAttributes.TryGetValue(TAttrKey.Create(ARttiObject, AAttributeClass), Result);
    // search for inline attribute
    if Result = nil then
      Result := TJsonInlineAttributes.GetAttribute(ARttiObject, AAttributeClass, False);
    // if not found, go to parent object if requested
    if AInherit and (Result = nil) and (ARttiObject is TRttiInstanceType)  then
      Result := GetAttribute(TRttiInstanceType(ARttiObject).BaseType, AAttributeClass, AInherit);
  end;
end;

{ TJsonInlineAttributeProvider }

constructor TJsonInlineAttributeProvider.Create(const ARttiObject: TRttiObject);
begin
  FRttiObject := ARttiObject;
end;

function TJsonInlineAttributeProvider.GetAttribute(const AAttributeClass: TClass; AInherit: Boolean): TCustomAttribute;
begin
  Result := TJsonInlineAttributes.GetAttribute(FRttiObject, AAttributeClass, AInherit);
end;

{ TJsonDynamicAttributeProvider }

constructor TJsonDynamicAttributeProvider.Create(const ARttiObject: TRttiObject;
  const ADynamicAttributes: TJsonDynamicAttributes);
begin
  FRttiObject := ARttiObject;
  FDynamicAttributes := ADynamicAttributes;
end;

function TJsonDynamicAttributeProvider.GetAttribute(const AttrClass: TClass; AInherit: Boolean): TCustomAttribute;
begin
  Result := FDynamicAttributes.GetAttribute(FRttiObject, AttrClass, AInherit);
end;

{ TJsonDynamicContractResolver }

procedure TJsonDynamicContractResolver.ClearAttributes;
begin
  FDynamicAttributes.Clear;
end;

constructor TJsonDynamicContractResolver.Create(ADefaultMemberSerialization: TJsonMemberSerialization);
begin
  inherited Create(ADefaultMemberSerialization);
  FDynamicAttributes := TJsonDynamicAttributes.Create;
end;

function TJsonDynamicContractResolver.CreateAttributeProvider(const ARttiObject: TRttiObject): IJsonAttributeProvider;
begin
  Result := TJsonDynamicAttributeProvider.Create(ARttiObject, FDynamicAttributes);
end;

function TJsonDynamicContractResolver.GetRttiField(const ARttiType: TRttiType; AFieldName: string): TRttiMember;
begin
  Result := ARttiType.GetField(AFieldName);
  if Result = nil then
    raise EJsonException.Create(Format(SCannotFindFieldForType, [ARttiType.Name, AFieldName]));
end;

function TJsonDynamicContractResolver.GetRttiProperty(const ARttiType: TRttiType; APropertyName: string): TRttiMember;
begin
  Result := ARttiType.GetProperty(APropertyName);
  if Result = nil then
    raise EJsonException.Create(Format(SCannotFindPropertyForType, [ARttiType.Name, APropertyName]))
end;

function TJsonDynamicContractResolver.GetRttiType(ATypeInf: PTypeInfo): TRttiType;
begin
  Result := Ctx.GetType(ATypeInf);
  if Result = nil then
    raise EJsonException.Create(Format(SCannotFindType, [ATypeInf^.Name]));
end;

procedure TJsonDynamicContractResolver.SetFieldsIgnored(ATypeInf: PTypeInfo; AFieldNames: array of string);
var
  FieldName: string;
  RttiType: TRttiType;
begin
  RttiType := GetRttiType(ATypeInf);
  for FieldName in AFieldNames do
    FDynamicAttributes.AddAttribute(GetRttiField(RttiType, FieldName), JsonIgnoreAttribute.Create);
end;

procedure TJsonDynamicContractResolver.SetPropertiesIgnored(ATypeInf: PTypeInfo; APropertyNames: array of string);
var
  PropertyName: string;
  RttiType: TRttiType;
begin
  RttiType := GetRttiType(ATypeInf);
  for PropertyName in APropertyNames do
    FDynamicAttributes.AddAttribute(GetRttiProperty(RttiType, PropertyName), JsonIgnoreAttribute.Create);
end;

procedure TJsonDynamicContractResolver.SetTypeIgnored(ATypeInf: PTypeInfo);
begin
  FDynamicAttributes.AddAttribute(GetRttiType(ATypeInf), JsonIgnoreAttribute.Create);
end;

procedure TJsonDynamicContractResolver.SetFieldsIn(ATypeInf: PTypeInfo; AFieldNames: array of string);
var
  FieldName: string;
  RttiType: TRttiType;
begin
  RttiType := GetRttiType(ATypeInf);
  for FieldName in AFieldNames do
    FDynamicAttributes.AddAttribute(GetRttiField(RttiType, FieldName), JsonInAttribute.Create);
end;

procedure TJsonDynamicContractResolver.SetPropertiesIn(ATypeInf: PTypeInfo; APropertyNames: array of string);
var
  PropertyName: string;
  RttiType: TRttiType;
begin
  RttiType := GetRttiType(ATypeInf);
  for PropertyName in APropertyNames do
    FDynamicAttributes.AddAttribute(GetRttiProperty(RttiType, PropertyName), JsonInAttribute.Create);
end;

procedure TJsonDynamicContractResolver.SetTypeMemberSerialization(ATypeInf: PTypeInfo;
  AMemberSerialization: TJsonMemberSerialization);
begin
  FDynamicAttributes.AddAttribute(GetRttiType(ATypeInf), JsonSerializeAttribute.Create(AMemberSerialization));
end;

procedure TJsonDynamicContractResolver.SetFieldConverter(ATypeInf: PTypeInfo; FieldName: string;
  const AConverterClass: TClass);
begin
  FDynamicAttributes.AddAttribute(GetRttiField(GetRttiType(ATypeInf), FieldName), JsonConverterAttribute.Create(AConverterClass));
end;

procedure TJsonDynamicContractResolver.SetFieldName(ATypeInf: PTypeInfo; AFieldName, ResolvedName: string);
begin
  FDynamicAttributes.AddAttribute(GetRttiField(GetRttiType(ATypeInf), AFieldName), JsonNameAttribute.Create(ResolvedName));
end;

procedure TJsonDynamicContractResolver.SetPropertyConverter(ATypeInf: PTypeInfo; APropertyName: string;
  const AConverterClass: TClass);
begin
  FDynamicAttributes.AddAttribute(GetRttiProperty(GetRttiType(ATypeInf), APropertyName), JsonConverterAttribute.Create(AConverterClass));
end;

procedure TJsonDynamicContractResolver.SetPropertyName(ATypeInf: PTypeInfo; APropertyName, AResolvedName: string);
begin
  FDynamicAttributes.AddAttribute(GetRttiProperty(GetRttiType(ATypeInf), APropertyName), JsonNameAttribute.Create(AResolvedName));
end;

procedure TJsonDynamicContractResolver.SetTypeConverter(ATypeInf: PTypeInfo; const AConverterClass: TClass);
begin
  FDynamicAttributes.AddAttribute(GetRttiType(ATypeInf), JsonConverterAttribute.Create(AConverterClass));
end;

{ JsonObjectHandlingAttribute }

constructor JsonObjectHandlingAttribute.Create(const AValue: TJsonObjectHandling);
begin
  FValue := AValue;
end;

{ JsonObjectOwnership }

constructor JsonObjectOwnership.Create(const AValue: TJsonObjectOwnership);
begin
  FValue := AValue;
end;

initialization
  Ctx := TRttiContext.Create;
  ListHelperConverter := TJsonListHelperConverter.Create;

finalization
  ListHelperConverter.Free;

end.
