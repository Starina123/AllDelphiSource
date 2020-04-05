{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMetaDataReader;

interface

uses
  Data.DBXCommon,
  Data.DBXCommonTable,
  Data.DBXPlatform,
  Data.DBXSqlScanner;

type
  TDBXDataTypeDescription = class;
  TDBXIndexColumnValue = class;
  TDBXBaseMetaDataReader = class;
  TDBXPlatformTypeNames = class;
  TDBXProviderContext = class;
  TDBXDataTypeDescriptionArray = array of TDBXDataTypeDescription;

  TDBXColumnsTableCursor = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const Reader: TDBXBaseMetaDataReader; const CheckBase: Boolean; const Cursor: TDBXTable); overload;
    destructor Destroy; override;
    function Next: Boolean; override;
  protected
    FOrdinalOffset: Integer;
    FOrdinalTypeName: Integer;
    FReader: TDBXBaseMetaDataReader;
    FDataTypeHash: TDBXObjectStore;
    FDataType: TDBXDataTypeDescription;
    FCheckBase: Boolean;
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
  private
    FDataTypesRow: TDBXSingleValueRow;
  end;

  TDBXCustomMetaDataTable = class(TDBXRowTable)
  public
    constructor Create(const TypeNames: TDBXPlatformTypeNames; const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray; const Cursor: TDBXTable);
    destructor Destroy; override;
    function First: Boolean; override;
    function Next: Boolean; override;
    function InBounds: Boolean; override;
    procedure Close; override;
    function GetOrdinal(const ColumnName: UnicodeString): Integer; override;
  protected
    function GetCommand: TObject; override;
    function FindStringSize(const Ordinal: Integer; const SourceColumns: TDBXValueTypeArray): Integer; overload; virtual;
    function FindStringSize(const Column: TDBXValueType): Integer; overload; virtual;
    function GetDBXTableName: UnicodeString; override;
    function GetColumns: TDBXValueTypeArray; override;
    procedure CheckColumn(const Ordinal: Integer); virtual;
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
    function GetInt32(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: Integer): Integer; virtual;
    function GetInt64(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: Int64): Int64; virtual;
    function GetAsString(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: UnicodeString): UnicodeString; virtual;
    function GetBoolean(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: Boolean): Boolean; virtual;
  private
    procedure AdjustColumnSize;
  protected
    FTypeNames: TDBXPlatformTypeNames;
    FMetaDataCollectionName: UnicodeString;
    FCursor: TDBXTable;
    FColumns: TDBXValueTypeArray;
  private
    FColumnsSizeAdjusted: Boolean;
    FIndexColumnValue: TDBXIndexColumnValue;
    FHasIndexColumn: Boolean;
  end;

  TDBXDataTypeCursor = class(TDBXRowTable)
  public
    constructor Create(const Reader: TDBXBaseMetaDataReader; const Columns: TDBXValueTypeArray; const Types: TDBXArrayList);
    destructor Destroy; override;
    function GetOrdinal(const Name: UnicodeString): Integer; override;
    procedure Close; override;
    function First: Boolean; override;
    function InBounds: Boolean; override;
    function Next: Boolean; override;
  protected
    function GetDBXTableName: UnicodeString; override;
    function GetColumns: TDBXValueTypeArray; override;
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
  protected
    FReader: TDBXBaseMetaDataReader;
    FTypes: TDBXArrayList;
    FCurrent: TDBXDataTypeDescription;
    FRowIndex: Integer;
  private
    FTypeRow: TDBXSingleValueRow;
  end;

  TDBXDataTypeDescription = class
  public
    constructor Create(const TypeName: UnicodeString; const DataType: Integer; const ColumnSize: Int64; const CreateFormat: UnicodeString; const CreateParams: UnicodeString; const MaxScale: Integer; const MinScale: Integer; const LiteralPrefix: UnicodeString; const LiteralSuffix: UnicodeString; const MaxVersion: UnicodeString; const MinVersion: UnicodeString; const Flags: Integer); overload;
    constructor Create(const Original: TDBXDataTypeDescription); overload;
    function GetDataType(const TypeNames: TDBXPlatformTypeNames): UnicodeString;
  protected
    function IsAutoIncrementable: Boolean;
    function IsBestMatch: Boolean;
    function IsCaseSensitive: Boolean;
    function IsFixedLength: Boolean;
    function IsFixedPrecisionScale: Boolean;
    function IsLong: Boolean;
    function IsNullable: Boolean;
    function IsSearchable: Boolean;
    function IsSearchableWithLike: Boolean;
    function IsUnsigned: Boolean;
    function IsUnicode: Boolean;
    function IsUnicodeOptionSupported: Boolean;
    procedure SetUnicodeOptionSupported(const Supported: Boolean);
    function IsUnsignedOptionSupported: Boolean;
    function IsStringOptionSupported: Boolean;
    function IsLongOptionSupported: Boolean;
    function GetMaximumScale: SmallInt;
    function GetMinimumScale: SmallInt;
    function IsConcurrencyType: Boolean;
    function IsLiteralSupported: Boolean;
  private
    function IsFlagSet(const Flag: Integer): Boolean;
    procedure SetFlag(const &On: Boolean; const Flag: Integer);
  private
    FTypeName: UnicodeString;
    FDataType: Integer;
    FColumnSize: Int64;
    FFlags: Integer;
    FMaxVersion: UnicodeString;
    FMinVersion: UnicodeString;
    FCreateFormat: UnicodeString;
    FCreateParams: UnicodeString;
    FLiteralPrefix: UnicodeString;
    FLiteralSuffix: UnicodeString;
    FMaxScale: Integer;
    FMinScale: Integer;
  public
    property TypeName: UnicodeString read FTypeName;
    property DbxDataType: Integer read FDataType;
    property ColumnSize: Int64 read FColumnSize;
    property CreateFormat: UnicodeString read FCreateFormat;
    property CreateParameters: UnicodeString read FCreateParams;
    property AutoIncrementable: Boolean read IsAutoIncrementable;
    property BestMatch: Boolean read IsBestMatch;
    property CaseSensitive: Boolean read IsCaseSensitive;
    property FixedLength: Boolean read IsFixedLength;
    property FixedPrecisionScale: Boolean read IsFixedPrecisionScale;
    property Long: Boolean read IsLong;
    property Nullable: Boolean read IsNullable;
    property Searchable: Boolean read IsSearchable;
    property SearchableWithLike: Boolean read IsSearchableWithLike;
    property Unsigned: Boolean read IsUnsigned;
    property Unicode: Boolean read IsUnicode;
    property UnicodeOptionSupported: Boolean read IsUnicodeOptionSupported write SetUnicodeOptionSupported;
    property UnsignedOptionSupported: Boolean read IsUnsignedOptionSupported;
    property StringOptionSupported: Boolean read IsStringOptionSupported;
    property LongOptionSupported: Boolean read IsLongOptionSupported;
    property MaximumScale: SmallInt read GetMaximumScale;
    property MinimumScale: SmallInt read GetMinimumScale;
    property ConcurrencyType: Boolean read IsConcurrencyType;
    property MaximumVersion: UnicodeString read FMaxVersion;
    property MinimumVersion: UnicodeString read FMinVersion;
    property LiteralSupported: Boolean read IsLiteralSupported;
    property LiteralPrefix: UnicodeString read FLiteralPrefix;
    property LiteralSuffix: UnicodeString read FLiteralSuffix;
  end;

  TDBXEmptyTableCursor = class(TDBXTable)
  public
    constructor Create(const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray);
    destructor Destroy; override;
    function GetOrdinal(const ColumnName: UnicodeString): Integer; override;
    function First: Boolean; override;
    function InBounds: Boolean; override;
    function Next: Boolean; override;
    procedure Close; override;
  protected
    function IsUpdateable: Boolean; override;
    function GetDBXTableName: UnicodeString; override;
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
    function GetColumns: TDBXValueTypeArray; override;
  public
    FColumns: TDBXValueTypeArray;
  private
    FMetaDataCollectionName: UnicodeString;
  end;

  TDBXFilterProps = class(TDBXProperties)
  private
    
    /// <summary> 
    /// </summary>
    const FSerialVersionUID = -2989215426292773724;
  end;

  TDBXIndexColumnValue = class(TDBXInt32Value)
  public
    constructor Create(const Value: TDBXWritableValue);
    function GetInt32: Integer; override;
    function IsNull: Boolean; override;
    procedure SetInt32(const Value: Integer); override;
  private
    FValue: TDBXWritableValue;
  end;

  TDBXMetaDataCollectionColumns = class
  public
    class function CreateDataTypesColumns: TDBXValueTypeArray; static;
    class function CreateCatalogsColumns: TDBXValueTypeArray; static;
    class function CreateSchemasColumns: TDBXValueTypeArray; static;
    class function CreateTablesColumns: TDBXValueTypeArray; static;
    class function CreateViewsColumns: TDBXValueTypeArray; static;
    class function CreateSynonymsColumns: TDBXValueTypeArray; static;
    class function CreateColumnsColumns: TDBXValueTypeArray; static;
    class function CreateColumnConstraintsColumns: TDBXValueTypeArray; static;
    class function CreateIndexesColumns: TDBXValueTypeArray; static;
    class function CreateIndexColumnsColumns: TDBXValueTypeArray; static;
    class function CreateForeignKeysColumns: TDBXValueTypeArray; static;
    class function CreateForeignKeyColumnsColumns: TDBXValueTypeArray; static;
    class function CreateProceduresColumns: TDBXValueTypeArray; static;
    class function CreateProcedureSourcesColumns: TDBXValueTypeArray; static;
    class function CreateProcedureParametersColumns: TDBXValueTypeArray; static;
    class function CreatePackagesColumns: TDBXValueTypeArray; static;
    class function CreatePackageProceduresColumns: TDBXValueTypeArray; static;
    class function CreatePackageProcedureParametersColumns: TDBXValueTypeArray; static;
    class function CreatePackageSourcesColumns: TDBXValueTypeArray; static;
    class function CreateUsersColumns: TDBXValueTypeArray; static;
    class function CreateRolesColumns: TDBXValueTypeArray; static;
    class function CreateReservedWordsColumns: TDBXValueTypeArray; static;
    class function CreateValueType(const ColumnName: UnicodeString; const ColumnCaption: UnicodeString; const ColumnType: Integer): TDBXValueType; overload; static;
    class function CreateValueType(const ColumnName: UnicodeString; const ColumnCaption: UnicodeString; const ColumnType: Integer; const Hidden: Boolean): TDBXValueType; overload; static;
    class function DefaultDataSize(const ColumnType: Integer): Integer; static;
  private
    const DefaultAnsiDataSize = 128;
    const DefaultWideDataSize = 256;
  end;

  TDBXMetaDataCommandParseResult = class
  public
    constructor Create(const CommandToken: Integer; const Parameters: TDBXStringArray);
  private
    FCommandToken: Integer;
    FParameters: TDBXStringArray;
  public
    property CommandToken: Integer read FCommandToken;
    property Parameters: TDBXStringArray read FParameters;
  end;

  TDBXMetaDataReader = class abstract
  public
    function FetchCollection(const MetaDataCommand: UnicodeString): TDBXTable; virtual; abstract;
    function FetchCollectionWithStorage(const MetaDataCommand: UnicodeString): TDBXTable; virtual; abstract;
  protected
    procedure SetContext(const Context: TDBXProviderContext); virtual; abstract;
    function GetContext: TDBXProviderContext; virtual; abstract;
    function GetProductName: UnicodeString; virtual; abstract;
    function GetVersion: UnicodeString; virtual; abstract;
    procedure SetVersion(const Version: UnicodeString); virtual; abstract;
    function GetSqlIdentifierQuotePrefix: UnicodeString; virtual; abstract;
    function GetSqlIdentifierQuoteSuffix: UnicodeString; virtual; abstract;
    function IsLowerCaseIdentifiersSupported: Boolean; virtual; abstract;
    function IsUpperCaseIdentifiersSupported: Boolean; virtual; abstract;
    function IsQuotedIdentifiersSupported: Boolean; virtual; abstract;
    function IsDescendingIndexSupported: Boolean; virtual; abstract;
    function IsDescendingIndexColumnsSupported: Boolean; virtual; abstract;
    function GetSqlIdentifierQuoteChar: UnicodeString; virtual; abstract;
    function GetSqlProcedureQuoteChar: UnicodeString; virtual; abstract;
    function IsMultipleCommandsSupported: Boolean; virtual; abstract;
    function IsTransactionsSupported: Boolean; virtual; abstract;
    function IsNestedTransactionsSupported: Boolean; virtual; abstract;
    function IsSetRowSizeSupported: Boolean; virtual; abstract;
    
    /// <summary> Returns true of the vendor supports return code value in stored procedures.
    /// </summary>
    /// <remarks> 
    ///  Default is false.
    ///  
    /// </remarks>
    /// <returns>true if the return code is supported by vendor</returns>
    function IsSPReturnCodeSupported: Boolean; virtual; abstract;
    function IsParameterMetadataSupported: Boolean; virtual; abstract;
    function AreCatalogFunctionsSupported: Boolean; virtual; abstract;
  public
    property Context: TDBXProviderContext read GetContext write SetContext;
    property ProductName: UnicodeString read GetProductName;
    property Version: UnicodeString read GetVersion write SetVersion;
    property SqlIdentifierQuotePrefix: UnicodeString read GetSqlIdentifierQuotePrefix;
    property SqlIdentifierQuoteSuffix: UnicodeString read GetSqlIdentifierQuoteSuffix;
    property LowerCaseIdentifiersSupported: Boolean read IsLowerCaseIdentifiersSupported;
    property UpperCaseIdentifiersSupported: Boolean read IsUpperCaseIdentifiersSupported;
    property QuotedIdentifiersSupported: Boolean read IsQuotedIdentifiersSupported;
    property DescendingIndexSupported: Boolean read IsDescendingIndexSupported;
    property DescendingIndexColumnsSupported: Boolean read IsDescendingIndexColumnsSupported;
    property SqlIdentifierQuoteChar: UnicodeString read GetSqlIdentifierQuoteChar;
    property SqlProcedureQuoteChar: UnicodeString read GetSqlProcedureQuoteChar;
    property MultipleCommandsSupported: Boolean read IsMultipleCommandsSupported;
    property TransactionsSupported: Boolean read IsTransactionsSupported;
    property NestedTransactionsSupported: Boolean read IsNestedTransactionsSupported;
    property SetRowSizeSupported: Boolean read IsSetRowSizeSupported;
    
    /// <summary> Returns true of the vendor supports return code value in stored procedures.
    /// </summary>
    /// <remarks> 
    ///  Default is false.
    ///  
    /// </remarks>
    /// <returns>true if the return code is supported by vendor</returns>
    property SPReturnCodeSupported: Boolean read IsSPReturnCodeSupported;
    property ParameterMetadataSupported: Boolean read IsParameterMetadataSupported;
    property CatalogFunctionsSupported: Boolean read AreCatalogFunctionsSupported;
  end;

  TDBXBaseMetaDataReader = class(TDBXMetaDataReader)
  public
    destructor Destroy; override;
    function CompareVersion(const OtherVersion: UnicodeString): Integer; virtual;
    function FetchCollection(const MetaDataCommand: UnicodeString): TDBXTable; override;
    function MakeStorage(const Cursor: TDBXTable): TDBXTable; virtual;
    function FetchCollectionWithStorage(const MetaDataCommand: UnicodeString): TDBXTable; override;
    function FetchDataTypes: TDBXTable; virtual;
    function FetchCatalogs: TDBXTable; virtual;
    function FetchSchemas(const Catalog: UnicodeString): TDBXTable; virtual;
    function FetchTables(const Catalog: UnicodeString; const Schema: UnicodeString; const TableName: UnicodeString; const TableType: UnicodeString): TDBXTable; virtual;
    function FetchViews(const Catalog: UnicodeString; const Schema: UnicodeString; const View: UnicodeString): TDBXTable; virtual;
    function FetchColumns(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable; virtual;
    function FetchColumnConstraints(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable; virtual;
    function FetchIndexes(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable; virtual;
    function FetchIndexColumns(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString; const Index: UnicodeString): TDBXTable; virtual;
    function FetchForeignKeys(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable; virtual;
    function FetchForeignKeyColumns(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString; const ForeignKeyName: UnicodeString; const PrimaryCatalog: UnicodeString; const PrimarySchema: UnicodeString; const PrimaryTable: UnicodeString; const PrimaryKeyName: UnicodeString): TDBXTable; virtual;
    function FetchSynonyms(const Catalog: UnicodeString; const Schema: UnicodeString; const Synonym: UnicodeString): TDBXTable; virtual;
    function FetchProcedures(const Catalog: UnicodeString; const Schema: UnicodeString; const ProcedureName: UnicodeString; const ProcedureType: UnicodeString): TDBXTable; virtual;
    function FetchProcedureSources(const Catalog: UnicodeString; const Schema: UnicodeString; const &Procedure: UnicodeString): TDBXTable; virtual;
    function FetchProcedureParameters(const Catalog: UnicodeString; const Schema: UnicodeString; const &Procedure: UnicodeString; const Parameter: UnicodeString): TDBXTable; virtual;
    function FetchPackages(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString): TDBXTable; virtual;
    function FetchPackageProcedures(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString; const ProcedureName: UnicodeString; const ProcedureType: UnicodeString): TDBXTable; virtual;
    function FetchPackageProcedureParameters(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString; const ProcedureName: UnicodeString; const ParameterName: UnicodeString): TDBXTable; virtual;
    function FetchPackageSources(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString): TDBXTable; virtual;
    function FetchUsers: TDBXTable; virtual;
    function FetchRoles: TDBXTable; virtual;
    function FetchReservedWords: TDBXTable; virtual;
  protected
    procedure SetContext(const Context: TDBXProviderContext); override;
    function GetContext: TDBXProviderContext; override;
    function GetProductName: UnicodeString; override;
    function GetVersion: UnicodeString; override;
    procedure SetVersion(const Version: UnicodeString); override;
    function GetSqlDefaultParameterMarker: UnicodeString; virtual;
    function GetSqlIdentifierQuotePrefix: UnicodeString; override;
    function GetSqlIdentifierQuoteSuffix: UnicodeString; override;
    function IsQuotedIdentifiersSupported: Boolean; override;
    function IsLowerCaseIdentifiersSupported: Boolean; override;
    function IsUpperCaseIdentifiersSupported: Boolean; override;
    function IsDescendingIndexSupported: Boolean; override;
    function IsDescendingIndexColumnsSupported: Boolean; override;
    
    /// <summary> Returns true of the vendor supports return code value in stored procedures.
    /// </summary>
    /// <remarks> 
    ///  Default is false.
    ///  
    /// </remarks>
    /// <returns>true if the return code is supported by vendor</returns>
    function IsSPReturnCodeSupported: Boolean; override;
    function IsParameterMetadataSupported: Boolean; override;
    function AreCatalogFunctionsSupported: Boolean; override;
    function GetSqlIdentifierQuoteChar: UnicodeString; override;
    function GetSqlProcedureQuoteChar: UnicodeString; override;
    function IsMultipleCommandsSupported: Boolean; override;
    function IsTransactionsSupported: Boolean; override;
    function IsNestedTransactionsSupported: Boolean; override;
    function IsSetRowSizeSupported: Boolean; override;
    function GetTableType: UnicodeString; virtual;
    function GetViewType: UnicodeString; virtual;
    function GetSystemTableType: UnicodeString; virtual;
    function GetSystemViewType: UnicodeString; virtual;
    function GetSynonymType: UnicodeString; virtual;
    function MakeTableTypeString(const InTableTypeCode: Integer; const Flags: Integer): UnicodeString;
    function GetDataTypeHash: TDBXObjectStore;
    function GetDataTypes: TDBXArrayList;
    procedure PopulateDataTypes(const Hash: TDBXObjectStore; const Types: TDBXArrayList; const Descr: TDBXDataTypeDescriptionArray); virtual;
    function GetDataTypeDescriptions: TDBXDataTypeDescriptionArray; virtual;
    function GetReservedWords: TDBXStringArray; virtual;
    function GetSqlForDataTypes: UnicodeString; virtual;
    function GetSqlForCatalogs: UnicodeString; virtual;
    function GetSqlForSchemas: UnicodeString; virtual;
    function GetSqlForTables: UnicodeString; virtual;
    function GetSqlForViews: UnicodeString; virtual;
    function GetSqlForColumns: UnicodeString; virtual;
    function GetSqlForColumnConstraints: UnicodeString; virtual;
    function GetSqlForIndexes: UnicodeString; virtual;
    function GetSqlForIndexColumns: UnicodeString; virtual;
    function GetSqlForForeignKeys: UnicodeString; virtual;
    function GetSqlForForeignKeyColumns: UnicodeString; virtual;
    function GetSqlForSynonyms: UnicodeString; virtual;
    function GetSqlForProcedures: UnicodeString; virtual;
    function GetSqlForProcedureSources: UnicodeString; virtual;
    function GetSqlForProcedureParameters: UnicodeString; virtual;
    function GetSqlForPackages: UnicodeString; virtual;
    function GetSqlForPackageProcedures: UnicodeString; virtual;
    function GetSqlForPackageProcedureParameters: UnicodeString; virtual;
    function GetSqlForPackageSources: UnicodeString; virtual;
    function GetSqlForUsers: UnicodeString; virtual;
    function GetSqlForRoles: UnicodeString; virtual;
    function GetSqlForReservedWords: UnicodeString; virtual;
  private
    function CountDigits(const Version: UnicodeString; const FromIndex: Integer): Integer;
    procedure AppendVersionSection(const Buffer: TDBXStringBuffer; const Version: UnicodeString; const InStart: Integer; const EndIndex: Integer; const ExpectedLength: Integer; const AddDot: Boolean);
    function MakeStandardVersionFormat(const Version: UnicodeString): UnicodeString;
    function FindSourceLineColumn(const Cursor: TDBXTable; const ExpectedColumns: Integer): Integer;
    procedure InitScanner;
    function ParseMetaDataCommand(const MetaDataCommand: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseId: UnicodeString;
    procedure ParseSqlObjectName(const Parameters: TDBXStringArray; const MaxIds: Integer);
    function ParseParameter(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseGetObjectName(const CommandToken: Integer; const MaxIds: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseGetTables(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseForeignKeyColumns(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseIndexColumns(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseProcedures(const CommandToken: Integer; const MaxIds: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseProcedureParameters(const CommandToken: Integer; const MaxIds: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
    function ParseDone(const CommandToken: Integer; const Command: UnicodeString; const Parameters: TDBXStringArray): TDBXMetaDataCommandParseResult;
  private
    FContext: TDBXProviderContext;
    FDataTypeHash: TDBXObjectStore;
    FScanner: TDBXSqlScanner;
    FVersion: UnicodeString;
    FTypes: TDBXArrayList;
  public
    property SqlDefaultParameterMarker: UnicodeString read GetSqlDefaultParameterMarker;
    property TableType: UnicodeString read GetTableType;
    property ViewType: UnicodeString read GetViewType;
    property SystemTableType: UnicodeString read GetSystemTableType;
    property SystemViewType: UnicodeString read GetSystemViewType;
    property SynonymType: UnicodeString read GetSynonymType;
    property DataTypeHash: TDBXObjectStore read GetDataTypeHash;
    property DataTypes: TDBXArrayList read GetDataTypes;
  protected
    property DataTypeDescriptions: TDBXDataTypeDescriptionArray read GetDataTypeDescriptions;
    property ReservedWords: TDBXStringArray read GetReservedWords;
    property SqlForDataTypes: UnicodeString read GetSqlForDataTypes;
    property SqlForCatalogs: UnicodeString read GetSqlForCatalogs;
    property SqlForSchemas: UnicodeString read GetSqlForSchemas;
    property SqlForTables: UnicodeString read GetSqlForTables;
    property SqlForViews: UnicodeString read GetSqlForViews;
    property SqlForColumns: UnicodeString read GetSqlForColumns;
    property SqlForColumnConstraints: UnicodeString read GetSqlForColumnConstraints;
    property SqlForIndexes: UnicodeString read GetSqlForIndexes;
    property SqlForIndexColumns: UnicodeString read GetSqlForIndexColumns;
    property SqlForForeignKeys: UnicodeString read GetSqlForForeignKeys;
    property SqlForForeignKeyColumns: UnicodeString read GetSqlForForeignKeyColumns;
    property SqlForSynonyms: UnicodeString read GetSqlForSynonyms;
    property SqlForProcedures: UnicodeString read GetSqlForProcedures;
    property SqlForProcedureSources: UnicodeString read GetSqlForProcedureSources;
    property SqlForProcedureParameters: UnicodeString read GetSqlForProcedureParameters;
    property SqlForPackages: UnicodeString read GetSqlForPackages;
    property SqlForPackageProcedures: UnicodeString read GetSqlForPackageProcedures;
    property SqlForPackageProcedureParameters: UnicodeString read GetSqlForPackageProcedureParameters;
    property SqlForPackageSources: UnicodeString read GetSqlForPackageSources;
    property SqlForUsers: UnicodeString read GetSqlForUsers;
    property SqlForRoles: UnicodeString read GetSqlForRoles;
    property SqlForReservedWords: UnicodeString read GetSqlForReservedWords;
  private
    const SourceLineNumber = 'SOURCE_LINE_NUMBER';
    const Colon = ':';
    const Dot = '.';
    const DoubleQuote = '"';
    const TokenDatabase = 500;
    const TokenTable = 501;
    const TokenView = 502;
    const TokenSystemTable = 503;
    const TokenSystemView = 504;
    const TokenSynonym = 505;
    const TokenProcedureType = 506;
    const TokenFunctionType = 507;
    const TokenPrimaryKey = 508;
    const TokenForeignKey = 509;
  end;

  TDBXParameterName = class
  public
    const DefaultMarker = ':';
    const CatalogName = 'CATALOG_NAME';
    const SchemaName = 'SCHEMA_NAME';
    const TableName = 'TABLE_NAME';
    const NewSchemaName = 'NEW_SCHEMA_NAME';
    const NewTableName = 'NEW_TABLE_NAME';
    const Tables = 'TABLES';
    const Views = 'VIEWS';
    const SystemTables = 'SYSTEM_TABLES';
    const SystemViews = 'SYSTEM_VIEWS';
    const Synonyms = 'SYNONYMS';
    const ViewName = 'VIEW_NAME';
    const IndexName = 'INDEX_NAME';
    const ForeignKeyName = 'FOREIGN_KEY_NAME';
    const PrimaryCatalogName = 'PRIMARY_CATALOG_NAME';
    const PrimarySchemaName = 'PRIMARY_SCHEMA_NAME';
    const PrimaryTableName = 'PRIMARY_TABLE_NAME';
    const PrimaryKeyName = 'PRIMARY_KEY_NAME';
    const SynonymName = 'SYNONYM_NAME';
    const ProcedureType = 'PROCEDURE_TYPE';
    const ProcedureName = 'PROCEDURE_NAME';
    const PackageName = 'PACKAGE_NAME';
    const ParameterName = 'PARAMETER_NAME';
  end;

  TDBXPlatformTypeNames = class abstract
  public
    function GetPlatformTypeName(const DataType: Integer; const IsUnsigned: Boolean): UnicodeString; virtual; abstract;
  end;

  TDBXProcedureType = class
  public
    const ProcedureType = 'PROCEDURE';
    const FunctionType = 'FUNCTION';
  end;

  TDBXProviderContext = class abstract(TDBXPlatformTypeNames)
  public
    function ExecuteQuery(const Sql: UnicodeString; const ParameterNames: TDBXStringArray; const ParameterValues: TDBXStringArray): TDBXTable; virtual; abstract;
    function CreateTableStorage(const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray): TDBXTable; virtual; abstract;
    function CreateRowStorage(const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray): TDBXTableRow; virtual; abstract;
    procedure StartSerializedTransaction; virtual; abstract;
    procedure StartTransaction; virtual; abstract;
    procedure Commit; virtual; abstract;
    procedure Rollback; virtual; abstract;
    function GetVendorProperty(const Name: UnicodeString): UnicodeString; virtual; abstract;
    class function UseAnsiString(const ProductName: UnicodeString): Boolean; static;
  end;

  TDBXReservedWordsCursor = class(TDBXTable)
  public
    constructor Create(const TypeNames: TDBXPlatformTypeNames; const Columns: TDBXValueTypeArray; const Keywords: TDBXStringArray);
    function GetOrdinal(const Name: UnicodeString): Integer; override;
    destructor Destroy; override;
    function First: Boolean; override;
    function Next: Boolean; override;
    function InBounds: Boolean; override;
    procedure Close; override;
  protected
    function GetDBXTableName: UnicodeString; override;
    function GetColumns: TDBXValueTypeArray; override;
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
  protected
    FTypeNames: TDBXPlatformTypeNames;
    FKeywords: TDBXStringArray;
    FRowIndex: Integer;
  private
    FReservedRow: TDBXSingleValueRow;
  end;

  TDBXSourceTableCursor = class(TDBXCustomMetaDataTable)
  public
    constructor Create(const Context: TDBXProviderContext; const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray; const Cursor: TDBXTable; const OrdinalDefinition: Integer; const OrdinalLineNumber: Integer);
    destructor Destroy; override;
    function Next: Boolean; override;
  protected
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
  private
    FRowStorage: TDBXSingleValueRow;
    FBuffer: TDBXStringBuffer;
    FOrdinalLineNumber: Integer;
    FOrdinalDefinition: Integer;
    FBeforeEnd: Boolean;
    FBeforeFirst: Boolean;
  end;

  TDBXTableType = class
  public
    const Table = 'TABLE';
    const View = 'VIEW';
    const Synonym = 'SYNONYM';
    const SystemTable = 'SYSTEM TABLE';
    const SystemView = 'SYSTEM VIEW';
  end;

  TDBXTableTypeFlag = class
  public
    const Table = 1;
    const View = 2;
    const SystemTable = 4;
    const SystemView = 8;
    const Synonym = 16;
    const All = 31;
  end;

  TDBXTableTypeParser = class
  public
    class function ParseTableTypes(const TableTypes: UnicodeString): Integer; static;
  end;

  TDBXTypeFlag = class
  public
    const AutoIncrementable = 1;
    const BestMatch = 2;
    const FixedLength = 4;
    const CaseSensitive = 8;
    const FixedPrecisionScale = 16;
    const Long = 32;
    const Nullable = 64;
    const Searchable = 128;
    const SearchableWithLike = 256;
    const Unsigned = 512;
    const ConcurrencyType = 1024;
    const LiteralSupported = 2048;
    const Unicode = 4096;
    const UnicodeOption = 8192;
    const UnsignedOption = 16384;
    const StringOption = 32768;
    const LongOption = 65536;
  end;

  TDBXVersion = class
  public
    const FMySQL4_1 = '04.01.0000';
    const FMySQL5 = '05.00.0000';
    const FMySQL5_0_6 = '05.00.0006';
    const FVersion10 = '10.00.0000';
  end;

implementation

uses
  Data.DBXMetaDataError,
  Data.DBXMetaDataNames,
  Data.DBXMetaDataProvider,
  System.Math,
  System.SysUtils,
  Data.DBXCommonResStrs;

constructor TDBXColumnsTableCursor.Create;
begin
  inherited Create;
end;

constructor TDBXColumnsTableCursor.Create(const Reader: TDBXBaseMetaDataReader; const CheckBase: Boolean; const Cursor: TDBXTable);
var
  DataTypeColumns: TDBXValueTypeArray;
  Ordinal: Integer;
begin
  inherited Create;
  Table := Cursor;
  FDataTypeHash := Reader.DataTypeHash;
  FReader := Reader;
  FCheckBase := CheckBase;
  FOrdinalOffset := 0;
  FOrdinalTypeName := TDBXColumnsIndex.TypeName;
  if (DBXTableName = TDBXMetaDataCollectionName.ProcedureParameters) then
  begin
    FOrdinalOffset := TDBXColumnsIndex.DbxDataType - TDBXProcedureParametersIndex.DbxDataType;
    FOrdinalTypeName := TDBXProcedureParametersIndex.TypeName;
  end
  else if (DBXTableName = TDBXMetaDataCollectionName.PackageProcedureParameters) then
  begin
    FOrdinalOffset := TDBXColumnsIndex.DbxDataType - TDBXPackageProcedureParametersIndex.DbxDataType;
    FOrdinalTypeName := TDBXPackageProcedureParametersIndex.TypeName;
  end;
  SetLength(DataTypeColumns,TDBXColumnsIndex.Last - TDBXColumnsIndex.DbxDataType + 1);
  for Ordinal := 0 to Length(DataTypeColumns) - 1 do
    DataTypeColumns[Ordinal] := TDBXValueType(Cursor.Columns[Ordinal + TDBXColumnsIndex.DbxDataType - FOrdinalOffset].Clone());
  FDataTypesRow := TDBXSingleValueRow.Create;
  FDataTypesRow.Columns := DataTypeColumns;
end;

destructor TDBXColumnsTableCursor.Destroy;
begin
  FreeAndNil(FDataTypesRow);
  inherited Destroy;
end;

function TDBXColumnsTableCursor.Next: Boolean;
var
  ReturnValue: Boolean;
begin
  ReturnValue := inherited Next;
  if ReturnValue then
  begin
    FDataType := TDBXDataTypeDescription(FDataTypeHash[inherited GetWritableValue(FOrdinalTypeName).AsString]);
    if FDataType = nil then
    begin
      FDataTypesRow.Value[0].AsInt32 := TDBXDataTypes.UnknownType;
      FDataTypesRow.Value[TDBXColumnsIndex.IsFixedLength - TDBXColumnsIndex.DbxDataType].AsBoolean := False;
      FDataTypesRow.Value[TDBXColumnsIndex.IsUnicode - TDBXColumnsIndex.DbxDataType].AsBoolean := False;
      FDataTypesRow.Value[TDBXColumnsIndex.IsLong - TDBXColumnsIndex.DbxDataType].AsBoolean := False;
      FDataTypesRow.Value[TDBXColumnsIndex.IsUnsigned - TDBXColumnsIndex.DbxDataType].AsBoolean := False;
    end
    else 
    begin
      FDataTypesRow.Value[0].AsInt32 := FDataType.DbxDataType;
      FDataTypesRow.Value[TDBXColumnsIndex.IsFixedLength - TDBXColumnsIndex.DbxDataType].AsBoolean := FDataType.FixedLength;
      FDataTypesRow.Value[TDBXColumnsIndex.IsUnicode - TDBXColumnsIndex.DbxDataType].AsBoolean := FDataType.Unicode;
      FDataTypesRow.Value[TDBXColumnsIndex.IsLong - TDBXColumnsIndex.DbxDataType].AsBoolean := FDataType.Long;
      FDataTypesRow.Value[TDBXColumnsIndex.IsUnsigned - TDBXColumnsIndex.DbxDataType].AsBoolean := FDataType.Unsigned;
    end;
  end;
  Result := ReturnValue;
end;

function TDBXColumnsTableCursor.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  if Ordinal + FOrdinalOffset >= TDBXColumnsIndex.DbxDataType then
    Result := FDataTypesRow.Value[Ordinal - (TDBXColumnsIndex.DbxDataType - FOrdinalOffset)]
  else 
    Result := inherited GetWritableValue(Ordinal);
end;

constructor TDBXCustomMetaDataTable.Create(const TypeNames: TDBXPlatformTypeNames; const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray; const Cursor: TDBXTable);
begin
  inherited Create(nil, nil);
  FTypeNames := TypeNames;
  FMetaDataCollectionName := MetaDataCollectionName;
  FCursor := Cursor;
  FColumns := Columns;
  if (MetaDataCollectionName = TDBXMetaDataCollectionName.Columns) then
    FHasIndexColumn := True;
end;

destructor TDBXCustomMetaDataTable.Destroy;
begin
  FreeAndNil(FCursor);
  FreeObjectArray(TDBXFreeArray(FColumns));
  FreeAndNil(FIndexColumnValue);
  inherited Destroy;
end;

function TDBXCustomMetaDataTable.GetCommand: TObject;
begin
  if FCursor = nil then
    Result := nil
  else 
    Result := FCursor.Command;
end;

function TDBXCustomMetaDataTable.FindStringSize(const Ordinal: Integer; const SourceColumns: TDBXValueTypeArray): Integer;
begin
  Result := FindStringSize(SourceColumns[Ordinal]);
end;

function TDBXCustomMetaDataTable.FindStringSize(const Column: TDBXValueType): Integer;
begin
  case Column.DataType of
    TDBXDataTypes.WideStringType:
      Result := Column.Size;
    TDBXDataTypes.AnsiStringType:
      Result := 2 * Column.Size;
    TDBXDataTypes.Int8Type:
      Result := 4;
    TDBXDataTypes.Int16Type:
      Result := 6;
    TDBXDataTypes.Int32Type:
      Result := 11;
    TDBXDataTypes.Int64Type:
      Result := 20;
    TDBXDataTypes.BooleanType:
      Result := 5;
    else
      Result := 0;
  end;
end;

procedure TDBXCustomMetaDataTable.AdjustColumnSize;
var
  StringSize: Integer;
  ValueTypes: TDBXValueTypeArray;
  Ordinal: Integer;
begin
  if FCursor <> nil then
  begin
    ValueTypes := FCursor.Columns;
    for Ordinal := 0 to Length(FColumns) - 1 do
      case FColumns[Ordinal].DataType of
        TDBXDataTypes.WideStringType:
          begin
            if ValueTypes = nil then
              StringSize := FindStringSize(FCursor.Value[Ordinal].ValueType)
            else
              if not (Ordinal >= Length(ValueTypes)) then
                StringSize := FindStringSize(Ordinal, ValueTypes)
              else
                StringSize := FColumns[Ordinal].Size;
            if StringSize > 0 then
              FColumns[Ordinal].Size := StringSize;
          end;
        TDBXDataTypes.Int8Type:
          FColumns[Ordinal].Size := 1;
        TDBXDataTypes.Int16Type:
          FColumns[Ordinal].Size := 2;
        TDBXDataTypes.Int32Type:
          FColumns[Ordinal].Size := 4;
        TDBXDataTypes.Int64Type:
          FColumns[Ordinal].Size := 8;
        TDBXDataTypes.BooleanType:
          FColumns[Ordinal].Size := 2;
      end;
  end;
end;

function TDBXCustomMetaDataTable.GetDBXTableName: UnicodeString;
begin
  Result := FMetaDataCollectionName;
end;

function TDBXCustomMetaDataTable.First: Boolean;
begin
  Result := FCursor.First;
end;

function TDBXCustomMetaDataTable.Next: Boolean;
begin
  Result := FCursor.Next;
end;

function TDBXCustomMetaDataTable.InBounds: Boolean;
begin
  Result := FCursor.InBounds;
end;

procedure TDBXCustomMetaDataTable.Close;
begin
  if FCursor <> nil then
  begin
    FCursor.Close;
    FreeAndNil(FCursor);
  end;
end;

function TDBXCustomMetaDataTable.GetColumns: TDBXValueTypeArray;
begin
  if not FColumnsSizeAdjusted then
  begin
    AdjustColumnSize;
    FColumnsSizeAdjusted := True;
  end;
  Result := FColumns;
end;

procedure TDBXCustomMetaDataTable.CheckColumn(const Ordinal: Integer);
begin
  if (Ordinal < 0) or (Ordinal > Length(FColumns)) then
    raise TDBXMetaDataError.Create(SOrdinalOutOfRange);
end;

function TDBXCustomMetaDataTable.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  CheckColumn(Ordinal);
  if FHasIndexColumn and (Ordinal = TDBXColumnsIndex.Precision) then
  begin
    if FIndexColumnValue = nil then
      FIndexColumnValue := TDBXIndexColumnValue.Create(FCursor.Value[TDBXColumnsIndex.Precision]);
    try
      FIndexColumnValue.SetValue(FCursor.Value[Ordinal]);
    except
      on Ex: Exception do
        FIndexColumnValue.AsInt32 := High(Integer);
    end;
    Exit(FIndexColumnValue);
  end;
  Result := FCursor.Value[Ordinal];
end;

function TDBXCustomMetaDataTable.GetOrdinal(const ColumnName: UnicodeString): Integer;
begin
  Result := FCursor.GetOrdinal(ColumnName);
end;

function TDBXCustomMetaDataTable.GetInt32(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: Integer): Integer;
var
  Value: TDBXWritableValue;
begin
  Value := Cursor.Value[Ordinal];
  if Value.IsNull then
    Exit(DefaultValue);
  Result := Value.AsInt32;
end;

function TDBXCustomMetaDataTable.GetInt64(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: Int64): Int64;
var
  Value: TDBXWritableValue;
begin
  Value := Cursor.Value[Ordinal];
  if Value.IsNull then
    Exit(DefaultValue);
  Result := Value.AsInt64;
end;

function TDBXCustomMetaDataTable.GetAsString(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: UnicodeString): UnicodeString;
var
  Value: TDBXWritableValue;
begin
  Value := Cursor.Value[Ordinal];
  if Value.IsNull then
    Exit(DefaultValue);
  Result := Value.AsString;
end;

function TDBXCustomMetaDataTable.GetBoolean(const Cursor: TDBXTable; const Ordinal: Integer; const DefaultValue: Boolean): Boolean;
var
  Value: TDBXWritableValue;
begin
  Value := Cursor.Value[Ordinal];
  if Value.IsNull then
    Exit(DefaultValue);
  Result := Value.GetBoolean;
end;

constructor TDBXDataTypeCursor.Create(const Reader: TDBXBaseMetaDataReader; const Columns: TDBXValueTypeArray; const Types: TDBXArrayList);
begin
  inherited Create(nil, nil);
  FReader := Reader;
  FTypes := Types;
  FTypeRow := TDBXSingleValueRow.Create;
  FTypeRow.Columns := Columns;
  FRowIndex := -1;
end;

destructor TDBXDataTypeCursor.Destroy;
begin
  FreeAndNil(FTypeRow);
  inherited Destroy;
end;

function TDBXDataTypeCursor.GetOrdinal(const Name: UnicodeString): Integer;
begin
  Result := FTypeRow.GetOrdinal(Name);
end;

function TDBXDataTypeCursor.GetDBXTableName: UnicodeString;
begin
  Result := TDBXMetaDataCollectionName.DataTypes;
end;

function TDBXDataTypeCursor.GetColumns: TDBXValueTypeArray;
begin
  Result := FTypeRow.Columns;
end;

procedure TDBXDataTypeCursor.Close;
begin
end;

function TDBXDataTypeCursor.First: Boolean;
begin
  FRowIndex := 0;
  Result := FRowIndex < FTypes.Count;
end;

function TDBXDataTypeCursor.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  if FRowIndex < 0 then
    raise TDBXMetaDataError.Create(SMustCallNextFirst);
  if FRowIndex >= FTypes.Count then
    raise TDBXMetaDataError.Create(SPastEndOfCursor);
  Result := FTypeRow.Value[Ordinal];
end;

function TDBXDataTypeCursor.InBounds: Boolean;
begin
  Result := FRowIndex < FTypes.Count;
end;

function TDBXDataTypeCursor.Next: Boolean;
begin
  IncrAfter(FRowIndex);
  if FRowIndex >= FTypes.Count then
    Exit(False);
  FCurrent := TDBXDataTypeDescription(FTypes[FRowIndex]);
  FTypeRow.Value[TDBXDataTypesIndex.TypeName].AsString := FCurrent.TypeName;
  FTypeRow.Value[TDBXDataTypesIndex.CreateFormat].AsString := FCurrent.CreateFormat;
  FTypeRow.Value[TDBXDataTypesIndex.CreateParameters].AsString := FCurrent.CreateParameters;
  FTypeRow.Value[TDBXDataTypesIndex.DataType].AsString := FCurrent.GetDataType(FReader.Context);
  FTypeRow.Value[TDBXDataTypesIndex.MaximumVersion].AsString := FCurrent.MaximumVersion;
  FTypeRow.Value[TDBXDataTypesIndex.MinimumVersion].AsString := FCurrent.MinimumVersion;
  FTypeRow.Value[TDBXDataTypesIndex.LiteralPrefix].AsString := FCurrent.LiteralPrefix;
  FTypeRow.Value[TDBXDataTypesIndex.LiteralSuffix].AsString := FCurrent.LiteralSuffix;
  FTypeRow.Value[TDBXDataTypesIndex.MaximumScale].SetInt16(FCurrent.MaximumScale);
  FTypeRow.Value[TDBXDataTypesIndex.MinimumScale].SetInt16(FCurrent.MinimumScale);
  FTypeRow.Value[TDBXDataTypesIndex.DbxDataType].AsInt32 := FCurrent.DbxDataType;
  FTypeRow.Value[TDBXDataTypesIndex.ProviderDbType].AsInt32 := FCurrent.DbxDataType;
  FTypeRow.Value[TDBXDataTypesIndex.ColumnSize].SetInt64(FCurrent.ColumnSize);
  FTypeRow.Value[TDBXDataTypesIndex.IsAutoIncrementable].AsBoolean := FCurrent.AutoIncrementable;
  FTypeRow.Value[TDBXDataTypesIndex.IsBestMatch].AsBoolean := FCurrent.BestMatch;
  FTypeRow.Value[TDBXDataTypesIndex.IsCaseSensitive].AsBoolean := FCurrent.CaseSensitive;
  FTypeRow.Value[TDBXDataTypesIndex.IsFixedLength].AsBoolean := FCurrent.FixedLength;
  FTypeRow.Value[TDBXDataTypesIndex.IsFixedPrecisionScale].AsBoolean := FCurrent.FixedPrecisionScale;
  FTypeRow.Value[TDBXDataTypesIndex.IsLong].AsBoolean := FCurrent.Long;
  FTypeRow.Value[TDBXDataTypesIndex.IsNullable].AsBoolean := FCurrent.Nullable;
  FTypeRow.Value[TDBXDataTypesIndex.IsSearchable].AsBoolean := FCurrent.Searchable;
  FTypeRow.Value[TDBXDataTypesIndex.IsSearchableWithLike].AsBoolean := FCurrent.SearchableWithLike;
  FTypeRow.Value[TDBXDataTypesIndex.IsUnsigned].AsBoolean := FCurrent.Unsigned;
  FTypeRow.Value[TDBXDataTypesIndex.IsConcurrencyType].AsBoolean := FCurrent.ConcurrencyType;
  FTypeRow.Value[TDBXDataTypesIndex.IsLiteralSupported].AsBoolean := FCurrent.LiteralSupported;
  FTypeRow.Value[TDBXDataTypesIndex.IsUnicode].AsBoolean := FCurrent.Unicode;
  Result := True;
end;

constructor TDBXDataTypeDescription.Create(const TypeName: UnicodeString; const DataType: Integer; const ColumnSize: Int64; const CreateFormat: UnicodeString; const CreateParams: UnicodeString; const MaxScale: Integer; const MinScale: Integer; const LiteralPrefix: UnicodeString; const LiteralSuffix: UnicodeString; const MaxVersion: UnicodeString; const MinVersion: UnicodeString; const Flags: Integer);
begin
  inherited Create;
  FTypeName := TypeName;
  FDataType := DataType;
  FColumnSize := ColumnSize;
  FMaxVersion := MaxVersion;
  FMinVersion := MinVersion;
  FFlags := Flags;
  FCreateFormat := CreateFormat;
  FCreateParams := CreateParams;
  FLiteralPrefix := LiteralPrefix;
  FLiteralSuffix := LiteralSuffix;
  FMaxScale := MaxScale;
  FMinScale := MinScale;
end;

constructor TDBXDataTypeDescription.Create(const Original: TDBXDataTypeDescription);
begin
  inherited Create;
  FTypeName := Original.FTypeName;
  FDataType := Original.FDataType;
  FColumnSize := Original.FColumnSize;
  FMaxVersion := Original.FMaxVersion;
  FMinVersion := Original.FMinVersion;
  FFlags := Original.FFlags;
  FCreateFormat := Original.FCreateFormat;
  FCreateParams := Original.FCreateParams;
  FLiteralPrefix := Original.FLiteralPrefix;
  FLiteralSuffix := Original.FLiteralSuffix;
  FMaxScale := Original.FMaxScale;
  FMinScale := Original.FMinScale;
end;

function TDBXDataTypeDescription.GetDataType(const TypeNames: TDBXPlatformTypeNames): UnicodeString;
begin
  Result := TypeNames.GetPlatformTypeName(FDataType, Unsigned);
end;

function TDBXDataTypeDescription.IsFlagSet(const Flag: Integer): Boolean;
begin
  Result := (FFlags and Flag) = Flag;
end;

procedure TDBXDataTypeDescription.SetFlag(const &On: Boolean; const Flag: Integer);
begin
  if &On then
    FFlags := FFlags or Flag
  else 
    FFlags := FFlags and not Flag;
end;

function TDBXDataTypeDescription.IsAutoIncrementable: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.AutoIncrementable);
end;

function TDBXDataTypeDescription.IsBestMatch: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.BestMatch);
end;

function TDBXDataTypeDescription.IsCaseSensitive: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.CaseSensitive);
end;

function TDBXDataTypeDescription.IsFixedLength: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.FixedLength);
end;

function TDBXDataTypeDescription.IsFixedPrecisionScale: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.FixedPrecisionScale);
end;

function TDBXDataTypeDescription.IsLong: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.Long);
end;

function TDBXDataTypeDescription.IsNullable: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.Nullable);
end;

function TDBXDataTypeDescription.IsSearchable: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.Searchable);
end;

function TDBXDataTypeDescription.IsSearchableWithLike: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.SearchableWithLike);
end;

function TDBXDataTypeDescription.IsUnsigned: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.Unsigned);
end;

function TDBXDataTypeDescription.IsUnicode: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.Unicode);
end;

function TDBXDataTypeDescription.IsUnicodeOptionSupported: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.UnicodeOption);
end;

procedure TDBXDataTypeDescription.SetUnicodeOptionSupported(const Supported: Boolean);
begin
  SetFlag(Supported, TDBXTypeFlag.UnicodeOption);
end;

function TDBXDataTypeDescription.IsUnsignedOptionSupported: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.UnsignedOption);
end;

function TDBXDataTypeDescription.IsStringOptionSupported: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.StringOption);
end;

function TDBXDataTypeDescription.IsLongOptionSupported: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.LongOption);
end;

function TDBXDataTypeDescription.GetMaximumScale: SmallInt;
begin
  Result := SmallInt(FMaxScale);
end;

function TDBXDataTypeDescription.GetMinimumScale: SmallInt;
begin
  Result := SmallInt(FMinScale);
end;

function TDBXDataTypeDescription.IsConcurrencyType: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.ConcurrencyType);
end;

function TDBXDataTypeDescription.IsLiteralSupported: Boolean;
begin
  Result := IsFlagSet(TDBXTypeFlag.LiteralSupported);
end;

constructor TDBXEmptyTableCursor.Create(const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray);
begin
  inherited Create(nil);
  FColumns := Columns;
  FMetaDataCollectionName := MetaDataCollectionName;
end;

function TDBXEmptyTableCursor.IsUpdateable: Boolean;
begin
  Result := False;
end;

destructor TDBXEmptyTableCursor.Destroy;
begin
  FreeObjectArray(TDBXFreeArray(FColumns));
  inherited Destroy;
end;

function TDBXEmptyTableCursor.GetDBXTableName: UnicodeString;
begin
  Result := FMetaDataCollectionName;
end;

function TDBXEmptyTableCursor.GetOrdinal(const ColumnName: UnicodeString): Integer;
begin
  raise Exception.Create(SUnsupportedOperation);
end;

function TDBXEmptyTableCursor.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  Result := nil;
end;

function TDBXEmptyTableCursor.GetColumns: TDBXValueTypeArray;
begin
  Result := FColumns;
end;

function TDBXEmptyTableCursor.First: Boolean;
begin
  Result := False;
end;

function TDBXEmptyTableCursor.InBounds: Boolean;
begin
  Result := False;
end;

function TDBXEmptyTableCursor.Next: Boolean;
begin
  Result := False;
end;

procedure TDBXEmptyTableCursor.Close;
begin
end;

constructor TDBXIndexColumnValue.Create(const Value: TDBXWritableValue);
begin
  inherited Create(TDBXValueType(Value.ValueType.Clone()));
  FValue := Value;
end;

function TDBXIndexColumnValue.GetInt32: Integer;
begin
  try
    Result := FValue.AsInt32;
  except
    on Ex: Exception do
      Result := High(Integer);
  end;
end;

function TDBXIndexColumnValue.IsNull: Boolean;
begin
  Result := FValue.IsNull;
end;

procedure TDBXIndexColumnValue.SetInt32(const Value: Integer);
begin
  FValue.AsInt32 := Value;
end;

class function TDBXMetaDataCollectionColumns.CreateValueType(const ColumnName: UnicodeString; const ColumnCaption: UnicodeString; const ColumnType: Integer): TDBXValueType;
var
  ValueType: TDBXValueType;
begin
  ValueType := TDBXValueType.Create;
  ValueType.Name := ColumnName;
  ValueType.DisplayName := ColumnCaption;
  ValueType.DataType := ColumnType;
  ValueType.Size := DefaultDataSize(ColumnType);
  ValueType.Nullable := True;
  Result := ValueType;
end;

class function TDBXMetaDataCollectionColumns.CreateValueType(const ColumnName: UnicodeString; const ColumnCaption: UnicodeString; const ColumnType: Integer; const Hidden: Boolean): TDBXValueType;
var
  ValueType: TDBXValueType;
begin
  ValueType := TDBXValueType.Create;
  ValueType.Name := ColumnName;
  ValueType.DisplayName := ColumnCaption;
  ValueType.DataType := ColumnType;
  ValueType.Size := DefaultDataSize(ColumnType);
  ValueType.Hidden := Hidden;
  Result := ValueType;
end;

class function TDBXMetaDataCollectionColumns.DefaultDataSize(const ColumnType: Integer): Integer;
begin
  case ColumnType of
    TDBXDataTypes.BooleanType,
    TDBXDataTypes.Int8Type:
      Result := 1;
    TDBXDataTypes.Int16Type:
      Result := 2;
    TDBXDataTypes.Int32Type:
      Result := 4;
    TDBXDataTypes.Int64Type:
      Result := 8;
    TDBXDataTypes.WideStringType:
      Result := DefaultWideDataSize;
    TDBXDataTypes.AnsiStringType:
      Result := DefaultAnsiDataSize;
    else
      Result := 0;
  end;
end;

class function TDBXMetaDataCollectionColumns.CreateDataTypesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,26);
  Columns[0] := CreateValueType(TDBXDataTypesColumns.TypeName, STypeName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXDataTypesColumns.DbxDataType, SDbxDataType, TDBXDataTypes.Int32Type);
  Columns[2] := CreateValueType(TDBXDataTypesColumns.ColumnSize, SColumnSize, TDBXDataTypes.Int64Type);
  Columns[3] := CreateValueType(TDBXDataTypesColumns.CreateFormat, SCreateFormat, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXDataTypesColumns.CreateParameters, SCreateParameters, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXDataTypesColumns.DataType, SDataType, TDBXDataTypes.WideStringType);
  Columns[6] := CreateValueType(TDBXDataTypesColumns.IsAutoIncrementable, SIsAutoIncrementable, TDBXDataTypes.BooleanType);
  Columns[7] := CreateValueType(TDBXDataTypesColumns.IsBestMatch, SIsBestMatch, TDBXDataTypes.BooleanType);
  Columns[8] := CreateValueType(TDBXDataTypesColumns.IsCaseSensitive, SIsCaseSensitive, TDBXDataTypes.BooleanType);
  Columns[9] := CreateValueType(TDBXDataTypesColumns.IsFixedLength, SIsFixedLength, TDBXDataTypes.BooleanType);
  Columns[10] := CreateValueType(TDBXDataTypesColumns.IsFixedPrecisionScale, SIsFixedPrecisionScale, TDBXDataTypes.BooleanType);
  Columns[11] := CreateValueType(TDBXDataTypesColumns.IsLong, SIsLong, TDBXDataTypes.BooleanType);
  Columns[12] := CreateValueType(TDBXDataTypesColumns.IsNullable, SIsNullable, TDBXDataTypes.BooleanType);
  Columns[13] := CreateValueType(TDBXDataTypesColumns.IsSearchable, SIsSearchable, TDBXDataTypes.BooleanType);
  Columns[14] := CreateValueType(TDBXDataTypesColumns.IsSearchableWithLike, SIsSearchableWithLike, TDBXDataTypes.BooleanType);
  Columns[15] := CreateValueType(TDBXDataTypesColumns.IsUnsigned, SIsUnsigned, TDBXDataTypes.BooleanType);
  Columns[16] := CreateValueType(TDBXDataTypesColumns.MaximumScale, SMaximumScale, TDBXDataTypes.Int16Type);
  Columns[17] := CreateValueType(TDBXDataTypesColumns.MinimumScale, SMinimumScale, TDBXDataTypes.Int16Type);
  Columns[18] := CreateValueType(TDBXDataTypesColumns.IsConcurrencyType, SIsConcurrencyType, TDBXDataTypes.BooleanType);
  Columns[19] := CreateValueType(TDBXDataTypesColumns.MaximumVersion, SMaximumVersion, TDBXDataTypes.WideStringType);
  Columns[20] := CreateValueType(TDBXDataTypesColumns.MinimumVersion, SMinimumVersion, TDBXDataTypes.WideStringType);
  Columns[21] := CreateValueType(TDBXDataTypesColumns.IsLiteralSupported, SIsLiteralSupported, TDBXDataTypes.BooleanType);
  Columns[22] := CreateValueType(TDBXDataTypesColumns.LiteralPrefix, SLiteralPrefix, TDBXDataTypes.WideStringType);
  Columns[23] := CreateValueType(TDBXDataTypesColumns.LiteralSuffix, SLiteralSuffix, TDBXDataTypes.WideStringType);
  Columns[24] := CreateValueType(TDBXDataTypesColumns.IsUnicode, SIsUnicode, TDBXDataTypes.BooleanType);
  Columns[25] := CreateValueType(TDBXDataTypesColumns.ProviderDbType, SProviderDbType, TDBXDataTypes.Int32Type, True);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateCatalogsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,1);
  Columns[0] := CreateValueType(TDBXCatalogsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateSchemasColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,2);
  Columns[0] := CreateValueType(TDBXSchemasColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXSchemasColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateTablesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,4);
  Columns[0] := CreateValueType(TDBXTablesColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXTablesColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXTablesColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXTablesColumns.TableType, STableType, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateViewsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,4);
  Columns[0] := CreateValueType(TDBXViewsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXViewsColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXViewsColumns.ViewName, SViewName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXViewsColumns.Definition, SDefinition, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateSynonymsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,6);
  Columns[0] := CreateValueType(TDBXSynonymsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXSynonymsColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXSynonymsColumns.SynonymName, SSynonymName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXSynonymsColumns.TableCatalogName, STableCatalogName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXSynonymsColumns.TableSchemaName, STableSchemaName, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXSynonymsColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateColumnsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,17);
  Columns[0] := CreateValueType(TDBXColumnsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXColumnsColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXColumnsColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXColumnsColumns.ColumnName, SColumnName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXColumnsColumns.TypeName, STypeName, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXColumnsColumns.Precision, SPrecision, TDBXDataTypes.Int32Type);
  Columns[6] := CreateValueType(TDBXColumnsColumns.Scale, SScale, TDBXDataTypes.Int32Type);
  Columns[7] := CreateValueType(TDBXColumnsColumns.Ordinal, SOrdinal, TDBXDataTypes.Int32Type);
  Columns[8] := CreateValueType(TDBXColumnsColumns.DefaultValue, SDefaultValue, TDBXDataTypes.WideStringType);
  Columns[9] := CreateValueType(TDBXColumnsColumns.IsNullable, SIsNullable, TDBXDataTypes.BooleanType);
  Columns[10] := CreateValueType(TDBXColumnsColumns.IsAutoIncrement, SIsAutoIncrement, TDBXDataTypes.BooleanType);
  Columns[11] := CreateValueType(TDBXColumnsColumns.MaxInline, SMaxInline, TDBXDataTypes.Int32Type, True);
  Columns[12] := CreateValueType(TDBXColumnsColumns.DbxDataType, SDbxDataType, TDBXDataTypes.Int32Type, True);
  Columns[13] := CreateValueType(TDBXColumnsColumns.IsFixedLength, SIsFixedLength, TDBXDataTypes.BooleanType, True);
  Columns[14] := CreateValueType(TDBXColumnsColumns.IsUnicode, SIsUnicode, TDBXDataTypes.BooleanType, True);
  Columns[15] := CreateValueType(TDBXColumnsColumns.IsLong, SIsLong, TDBXDataTypes.BooleanType, True);
  Columns[16] := CreateValueType(TDBXColumnsColumns.IsUnsigned, SIsUnsigned, TDBXDataTypes.BooleanType, True);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateColumnConstraintsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,5);
  Columns[0] := CreateValueType(TDBXColumnConstraintsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXColumnConstraintsColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXColumnConstraintsColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXColumnConstraintsColumns.ConstraintName, SConstraintName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXColumnConstraintsColumns.ColumnName, SColumnName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateIndexesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,8);
  Columns[0] := CreateValueType(TDBXIndexesColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXIndexesColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXIndexesColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXIndexesColumns.IndexName, SIndexName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXIndexesColumns.ConstraintName, SConstraintName, TDBXDataTypes.WideStringType, True);
  Columns[5] := CreateValueType(TDBXIndexesColumns.IsPrimary, SIsPrimary, TDBXDataTypes.BooleanType);
  Columns[6] := CreateValueType(TDBXIndexesColumns.IsUnique, SIsUnique, TDBXDataTypes.BooleanType);
  Columns[7] := CreateValueType(TDBXIndexesColumns.IsAscending, SIsAscending, TDBXDataTypes.BooleanType, True);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateIndexColumnsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,7);
  Columns[0] := CreateValueType(TDBXIndexColumnsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXIndexColumnsColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXIndexColumnsColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXIndexColumnsColumns.IndexName, SIndexName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXIndexColumnsColumns.ColumnName, SColumnName, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXIndexColumnsColumns.Ordinal, SOrdinal, TDBXDataTypes.Int32Type);
  Columns[6] := CreateValueType(TDBXIndexColumnsColumns.IsAscending, SIsAscending, TDBXDataTypes.BooleanType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateForeignKeysColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,4);
  Columns[0] := CreateValueType(TDBXForeignKeysColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXForeignKeysColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXForeignKeysColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXForeignKeysColumns.ForeignKeyName, SForeignKeyName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateForeignKeyColumnsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,11);
  Columns[0] := CreateValueType(TDBXForeignKeyColumnsColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXForeignKeyColumnsColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXForeignKeyColumnsColumns.TableName, STableName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXForeignKeyColumnsColumns.ForeignKeyName, SForeignKeyName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXForeignKeyColumnsColumns.ColumnName, SColumnName, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXForeignKeyColumnsColumns.PrimaryCatalogName, SPrimaryCatalogName, TDBXDataTypes.WideStringType);
  Columns[6] := CreateValueType(TDBXForeignKeyColumnsColumns.PrimarySchemaName, SPrimarySchemaName, TDBXDataTypes.WideStringType);
  Columns[7] := CreateValueType(TDBXForeignKeyColumnsColumns.PrimaryTableName, SPrimaryTableName, TDBXDataTypes.WideStringType);
  Columns[8] := CreateValueType(TDBXForeignKeyColumnsColumns.PrimaryKeyName, SPrimaryKeyName, TDBXDataTypes.WideStringType);
  Columns[9] := CreateValueType(TDBXForeignKeyColumnsColumns.PrimaryColumnName, SPrimaryColumnName, TDBXDataTypes.WideStringType);
  Columns[10] := CreateValueType(TDBXForeignKeyColumnsColumns.Ordinal, SOrdinal, TDBXDataTypes.Int32Type);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateProceduresColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,4);
  Columns[0] := CreateValueType(TDBXProceduresColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXProceduresColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXProceduresColumns.ProcedureName, SProcedureName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXProceduresColumns.ProcedureType, SProcedureType, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateProcedureSourcesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,6);
  Columns[0] := CreateValueType(TDBXProcedureSourcesColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXProcedureSourcesColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXProcedureSourcesColumns.ProcedureName, SProcedureName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXProcedureSourcesColumns.ProcedureType, SProcedureType, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXProcedureSourcesColumns.Definition, SDefinition, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXProcedureSourcesColumns.ExternalDefinition, SExternalDefinition, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateProcedureParametersColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,15);
  Columns[0] := CreateValueType(TDBXProcedureParametersColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXProcedureParametersColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXProcedureParametersColumns.ProcedureName, SProcedureName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXProcedureParametersColumns.ParameterName, SParameterName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXProcedureParametersColumns.ParameterMode, SParameterMode, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXProcedureParametersColumns.TypeName, STypeName, TDBXDataTypes.WideStringType);
  Columns[6] := CreateValueType(TDBXProcedureParametersColumns.Precision, SPrecision, TDBXDataTypes.Int32Type);
  Columns[7] := CreateValueType(TDBXProcedureParametersColumns.Scale, SScale, TDBXDataTypes.Int32Type);
  Columns[8] := CreateValueType(TDBXProcedureParametersColumns.Ordinal, SOrdinal, TDBXDataTypes.Int32Type);
  Columns[9] := CreateValueType(TDBXProcedureParametersColumns.IsNullable, SIsNullable, TDBXDataTypes.BooleanType);
  Columns[10] := CreateValueType(TDBXProcedureParametersColumns.DbxDataType, SDbxDataType, TDBXDataTypes.Int32Type, True);
  Columns[11] := CreateValueType(TDBXProcedureParametersColumns.IsFixedLength, SIsFixedLength, TDBXDataTypes.BooleanType, True);
  Columns[12] := CreateValueType(TDBXProcedureParametersColumns.IsUnicode, SIsUnicode, TDBXDataTypes.BooleanType, True);
  Columns[13] := CreateValueType(TDBXProcedureParametersColumns.IsLong, SIsLong, TDBXDataTypes.BooleanType, True);
  Columns[14] := CreateValueType(TDBXProcedureParametersColumns.IsUnsigned, SIsUnsigned, TDBXDataTypes.BooleanType, True);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreatePackagesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,3);
  Columns[0] := CreateValueType(TDBXPackagesColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXPackagesColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXPackagesColumns.PackageName, SPackageName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreatePackageProceduresColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,5);
  Columns[0] := CreateValueType(TDBXPackageProceduresColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXPackageProceduresColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXPackageProceduresColumns.PackageName, SPackageName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXPackageProceduresColumns.ProcedureName, SProcedureName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXPackageProceduresColumns.ProcedureType, SProcedureType, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreatePackageProcedureParametersColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,16);
  Columns[0] := CreateValueType(TDBXPackageProcedureParametersColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXPackageProcedureParametersColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXPackageProcedureParametersColumns.PackageName, SPackageName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXPackageProcedureParametersColumns.ProcedureName, SProcedureName, TDBXDataTypes.WideStringType);
  Columns[4] := CreateValueType(TDBXPackageProcedureParametersColumns.ParameterName, SParameterName, TDBXDataTypes.WideStringType);
  Columns[5] := CreateValueType(TDBXPackageProcedureParametersColumns.ParameterMode, SParameterMode, TDBXDataTypes.WideStringType);
  Columns[6] := CreateValueType(TDBXPackageProcedureParametersColumns.TypeName, STypeName, TDBXDataTypes.WideStringType);
  Columns[7] := CreateValueType(TDBXPackageProcedureParametersColumns.Precision, SPrecision, TDBXDataTypes.Int32Type);
  Columns[8] := CreateValueType(TDBXPackageProcedureParametersColumns.Scale, SScale, TDBXDataTypes.Int32Type);
  Columns[9] := CreateValueType(TDBXPackageProcedureParametersColumns.Ordinal, SOrdinal, TDBXDataTypes.Int32Type);
  Columns[10] := CreateValueType(TDBXPackageProcedureParametersColumns.IsNullable, SIsNullable, TDBXDataTypes.BooleanType);
  Columns[11] := CreateValueType(TDBXPackageProcedureParametersColumns.DbxDataType, SDbxDataType, TDBXDataTypes.Int32Type, True);
  Columns[12] := CreateValueType(TDBXPackageProcedureParametersColumns.IsFixedLength, SIsFixedLength, TDBXDataTypes.BooleanType, True);
  Columns[13] := CreateValueType(TDBXPackageProcedureParametersColumns.IsUnicode, SIsUnicode, TDBXDataTypes.BooleanType, True);
  Columns[14] := CreateValueType(TDBXPackageProcedureParametersColumns.IsLong, SIsLong, TDBXDataTypes.BooleanType, True);
  Columns[15] := CreateValueType(TDBXPackageProcedureParametersColumns.IsUnsigned, SIsUnsigned, TDBXDataTypes.BooleanType, True);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreatePackageSourcesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,4);
  Columns[0] := CreateValueType(TDBXPackageSourcesColumns.CatalogName, SCatalogName, TDBXDataTypes.WideStringType);
  Columns[1] := CreateValueType(TDBXPackageSourcesColumns.SchemaName, SSchemaName, TDBXDataTypes.WideStringType);
  Columns[2] := CreateValueType(TDBXPackageSourcesColumns.PackageName, SPackageName, TDBXDataTypes.WideStringType);
  Columns[3] := CreateValueType(TDBXPackageSourcesColumns.Definition, SDefinition, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateUsersColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,1);
  Columns[0] := CreateValueType(TDBXUsersColumns.UserName, SUserName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateRolesColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,1);
  Columns[0] := CreateValueType(TDBXRolesColumns.RoleName, SRoleName, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

class function TDBXMetaDataCollectionColumns.CreateReservedWordsColumns: TDBXValueTypeArray;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns,1);
  Columns[0] := CreateValueType(TDBXReservedWordsColumns.ReservedWord, SReservedWord, TDBXDataTypes.WideStringType);
  Result := Columns;
end;

constructor TDBXMetaDataCommandParseResult.Create(const CommandToken: Integer; const Parameters: TDBXStringArray);
begin
  inherited Create;
  FCommandToken := CommandToken;
  FParameters := Parameters;
end;

destructor TDBXBaseMetaDataReader.Destroy;
begin
  FreeAndNil(FContext);
  FreeAndNil(FScanner);
  FreeAndNil(FDataTypeHash);
  FreeAndNil(FTypes);
  inherited Destroy;
end;

procedure TDBXBaseMetaDataReader.SetContext(const Context: TDBXProviderContext);
begin
  FContext := Context;
end;

function TDBXBaseMetaDataReader.GetContext: TDBXProviderContext;
begin
  Result := FContext;
end;

function TDBXBaseMetaDataReader.GetProductName: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetVersion: UnicodeString;
begin
  Result := FVersion;
end;

procedure TDBXBaseMetaDataReader.SetVersion(const Version: UnicodeString);
begin
  FVersion := MakeStandardVersionFormat(Version);
end;

function TDBXBaseMetaDataReader.CountDigits(const Version: UnicodeString; const FromIndex: Integer): Integer;
var
  Index: Integer;
  IsDigit: Boolean;
  Ch: WideChar;
begin
  Index := FromIndex;
  IsDigit := True;
  while IsDigit and (Index < Length(Version)) do
  begin
    Ch := Version[1+Index];
    IsDigit := ((Ch >= '0') and (Ch <= '9'));
    IncrAfter(Index);
  end;
  if not IsDigit then
    DecrAfter(Index);
  Result := Index - FromIndex;
end;

procedure TDBXBaseMetaDataReader.AppendVersionSection(const Buffer: TDBXStringBuffer; const Version: UnicodeString; const InStart: Integer; const EndIndex: Integer; const ExpectedLength: Integer; const AddDot: Boolean);
var
  Index: Integer;
  MaxLength: Integer;
  Start: Integer;
begin
  MaxLength := Min(Length(Version),EndIndex);
  Start := InStart;
  while (Start < MaxLength) and (Version[1+Start] = '0') do
    IncrAfter(Start);
  if EndIndex - Start > ExpectedLength then
    for index := 0 to ExpectedLength - 1 do
      Buffer.Append('9')
  else 
  begin
    for index := EndIndex - Start to ExpectedLength - 1 do
      Buffer.Append('0');
    for index := Start to EndIndex - 1 do
      Buffer.Append(Version[1+Index]);
  end;
  if AddDot then
    Buffer.Append(Dot);
end;

function TDBXBaseMetaDataReader.MakeStandardVersionFormat(const Version: UnicodeString): UnicodeString;
var
  I1: Integer;
  I2: Integer;
  I3: Integer;
  Buffer: TDBXStringBuffer;
  Index: Integer;
  Standard: UnicodeString;
begin
  I1 := StringIndexOf(Version,Dot);
  I2 := StringIndexOf(Version,Dot,I1 + 1);
  I3 := I2 + 1 + CountDigits(Version, I2 + 1);
  if (I1 > 0) and (I2 > I1) and (I3 > I2) and ((I1 <> 2) or (I2 - I1 <> 3) or (I3 - I2 <> 4)) then
  begin
    Buffer := TDBXStringBuffer.Create;
    AppendVersionSection(Buffer, Version, 0, I1, 2, True);
    AppendVersionSection(Buffer, Version, I1 + 1, I2, 2, True);
    AppendVersionSection(Buffer, Version, I2 + 1, I3, 4, False);
    for Index := I3 to Length(Version) - 1 do
      Buffer.Append(Version[1+Index]);
    Standard := Buffer.ToString;
    FreeAndNil(Buffer);
    Result := Standard;
  end
  else 
    Result := Version;
end;

function TDBXBaseMetaDataReader.GetSqlDefaultParameterMarker: UnicodeString;
begin
  Result := Colon;
end;

function TDBXBaseMetaDataReader.CompareVersion(const OtherVersion: UnicodeString): Integer;
begin
  if (not StringIsNil(FVersion)) and (not StringIsNil(OtherVersion)) then
    Result := CompareStr(FVersion,OtherVersion)
  else 
    Result := 0;
end;

function TDBXBaseMetaDataReader.GetSqlIdentifierQuotePrefix: UnicodeString;
begin
  Result := DoubleQuote;
end;

function TDBXBaseMetaDataReader.GetSqlIdentifierQuoteSuffix: UnicodeString;
begin
  Result := DoubleQuote;
end;

function TDBXBaseMetaDataReader.IsQuotedIdentifiersSupported: Boolean;
begin
  Result := (Length(SqlIdentifierQuoteChar) > 0) or ((Length(SqlIdentifierQuotePrefix) > 0) and (Length(SqlIdentifierQuoteSuffix) > 0));
end;

function TDBXBaseMetaDataReader.IsLowerCaseIdentifiersSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.IsUpperCaseIdentifiersSupported: Boolean;
begin
  Result := True;
end;

function TDBXBaseMetaDataReader.IsDescendingIndexSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.IsDescendingIndexColumnsSupported: Boolean;
begin
  Result := True;
end;

function TDBXBaseMetaDataReader.IsSPReturnCodeSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.IsParameterMetadataSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.AreCatalogFunctionsSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.GetSqlIdentifierQuoteChar: UnicodeString;
begin
  Result := DoubleQuote;
end;

function TDBXBaseMetaDataReader.GetSqlProcedureQuoteChar: UnicodeString;
begin
  Result := SqlIdentifierQuoteChar;
end;

function TDBXBaseMetaDataReader.IsMultipleCommandsSupported: Boolean;
begin
  Result := True;
end;

function TDBXBaseMetaDataReader.IsTransactionsSupported: Boolean;
begin
  Result := True;
end;

function TDBXBaseMetaDataReader.IsNestedTransactionsSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.IsSetRowSizeSupported: Boolean;
begin
  Result := False;
end;

function TDBXBaseMetaDataReader.GetTableType: UnicodeString;
begin
  Result := TDBXTableType.Table;
end;

function TDBXBaseMetaDataReader.GetViewType: UnicodeString;
begin
  Result := TDBXTableType.View;
end;

function TDBXBaseMetaDataReader.GetSystemTableType: UnicodeString;
begin
  Result := TDBXTableType.SystemTable;
end;

function TDBXBaseMetaDataReader.GetSystemViewType: UnicodeString;
begin
  Result := TDBXTableType.SystemView;
end;

function TDBXBaseMetaDataReader.GetSynonymType: UnicodeString;
begin
  Result := TDBXTableType.Synonym;
end;

function TDBXBaseMetaDataReader.MakeTableTypeString(const InTableTypeCode: Integer; const Flags: Integer): UnicodeString;
var
  TableTypeCode: Integer;
begin
  TableTypeCode := InTableTypeCode;
  if ((TableTypeCode and Flags) = 0) and (Flags <> 0) then
    TableTypeCode := 0;
  case TableTypeCode of
    TDBXTableTypeFlag.Table:
      Result := TableType;
    TDBXTableTypeFlag.View:
      Result := ViewType;
    TDBXTableTypeFlag.SystemTable:
      Result := SystemTableType;
    TDBXTableTypeFlag.SystemView:
      Result := SystemViewType;
    TDBXTableTypeFlag.Synonym:
      Result := SynonymType;
    else
      Result := '0';
  end;
end;

function TDBXBaseMetaDataReader.FindSourceLineColumn(const Cursor: TDBXTable; const ExpectedColumns: Integer): Integer;
var
  Columns: TDBXValueTypeArray;
  Ordinal: Integer;
begin
  Columns := Cursor.Columns;
  for Ordinal := ExpectedColumns to Length(Columns) - 1 do
  begin
    if (WideUpperCase(Columns[Ordinal].Name) = SourceLineNumber) then
      Exit(Ordinal);
  end;
  Result := -1;
end;

procedure TDBXBaseMetaDataReader.InitScanner;
var
  QuoteChar: UnicodeString;
  QuotePrefix: UnicodeString;
  QuoteSuffix: UnicodeString;
  Scan: TDBXSqlScanner;
begin
  if FScanner = nil then
  begin
    QuoteChar := SqlIdentifierQuoteChar;
    QuotePrefix := SqlIdentifierQuotePrefix;
    QuoteSuffix := SqlIdentifierQuoteSuffix;
    if (QuoteChar = '') then
      QuoteChar := DoubleQuote;
    if (QuotePrefix = '') then
      QuotePrefix := DoubleQuote;
    if (QuoteSuffix = '') then
      QuoteSuffix := DoubleQuote;
    Scan := TDBXSqlScanner.Create(QuoteChar, QuotePrefix, QuoteSuffix);
    Scan.RegisterId(TDBXMetaDataCommands.GetDatabase, TokenDatabase);
    Scan.RegisterId(TDBXMetaDataCommands.GetDatatypes, TDBXMetaDataCollectionIndex.DataTypes);
    Scan.RegisterId(TDBXMetaDataCommands.GetCatalogs, TDBXMetaDataCollectionIndex.Catalogs);
    Scan.RegisterId(TDBXMetaDataCommands.GetSchemas, TDBXMetaDataCollectionIndex.Schemas);
    Scan.RegisterId(TDBXMetaDataCommands.GetTables, TDBXMetaDataCollectionIndex.Tables);
    Scan.RegisterId(TDBXMetaDataCommands.GetViews, TDBXMetaDataCollectionIndex.Views);
    Scan.RegisterId(TDBXMetaDataCommands.GetSynonyms, TDBXMetaDataCollectionIndex.Synonyms);
    Scan.RegisterId(TDBXMetaDataCommands.GetColumns, TDBXMetaDataCollectionIndex.Columns);
    Scan.RegisterId(TDBXMetaDataCommands.GetIndexes, TDBXMetaDataCollectionIndex.Indexes);
    Scan.RegisterId(TDBXMetaDataCommands.GetIndexColumns, TDBXMetaDataCollectionIndex.IndexColumns);
    Scan.RegisterId(TDBXMetaDataCommands.GetForeignKeys, TDBXMetaDataCollectionIndex.ForeignKeys);
    Scan.RegisterId(TDBXMetaDataCommands.GetForeignKeyColumns, TDBXMetaDataCollectionIndex.ForeignKeyColumns);
    Scan.RegisterId(TDBXMetaDataCommands.GetProcedures, TDBXMetaDataCollectionIndex.Procedures);
    Scan.RegisterId(TDBXMetaDataCommands.GetProcedureSources, TDBXMetaDataCollectionIndex.ProcedureSources);
    Scan.RegisterId(TDBXMetaDataCommands.GetProcedureParameters, TDBXMetaDataCollectionIndex.ProcedureParameters);
    Scan.RegisterId(TDBXMetaDataCommands.GetPackages, TDBXMetaDataCollectionIndex.Packages);
    Scan.RegisterId(TDBXMetaDataCommands.GetPackageProcedures, TDBXMetaDataCollectionIndex.PackageProcedures);
    Scan.RegisterId(TDBXMetaDataCommands.GetPackageProcedureParameters, TDBXMetaDataCollectionIndex.PackageProcedureParameters);
    Scan.RegisterId(TDBXMetaDataCommands.GetPackageSources, TDBXMetaDataCollectionIndex.PackageSources);
    Scan.RegisterId(TDBXMetaDataCommands.GetUsers, TDBXMetaDataCollectionIndex.Users);
    Scan.RegisterId(TDBXMetaDataCommands.GetRoles, TDBXMetaDataCollectionIndex.Roles);
    Scan.RegisterId(TDBXMetaDataCommands.GetReservedWords, TDBXMetaDataCollectionIndex.ReservedWords);
    Scan.RegisterId(TDBXMetaDataTableTypes.Table, TokenTable);
    Scan.RegisterId(TDBXMetaDataTableTypes.View, TokenView);
    Scan.RegisterId(TDBXMetaDataTableTypes.SystemTable, TokenSystemTable);
    Scan.RegisterId(TDBXMetaDataTableTypes.SystemView, TokenSystemView);
    Scan.RegisterId(TDBXMetaDataTableTypes.Synonym, TokenSynonym);
    Scan.RegisterId(TDBXProcedureType.ProcedureType, TokenProcedureType);
    Scan.RegisterId(TDBXProcedureType.FunctionType, TokenFunctionType);
    Scan.RegisterId(TDBXMetaDataKeyword.PrimaryKey, TokenPrimaryKey);
    Scan.RegisterId(TDBXMetaDataKeyword.ForeignKey, TokenForeignKey);
    FScanner := Scan;
  end;
end;

function TDBXBaseMetaDataReader.GetDataTypeHash: TDBXObjectStore;
var
  Hash: TDBXObjectStore;
  Descr: TDBXDataTypeDescriptionArray;
  AddedTypes: TDBXArrayList;
begin
  if FDataTypeHash = nil then
  begin
    Hash := TDBXObjectStore.Create;
    Descr := DataTypeDescriptions;
    AddedTypes := TDBXArrayList.Create;
    PopulateDataTypes(Hash, AddedTypes, Descr);
    FreeObjectArray(TDBXFreeArray(Descr));
    FDataTypeHash := Hash;
    FTypes := AddedTypes;
  end;
  Result := FDataTypeHash;
end;

function TDBXBaseMetaDataReader.GetDataTypes: TDBXArrayList;
begin
  DataTypeHash;
  Result := FTypes;
end;

procedure TDBXBaseMetaDataReader.PopulateDataTypes(const Hash: TDBXObjectStore; const Types: TDBXArrayList; const Descr: TDBXDataTypeDescriptionArray);
var
  Index: Integer;
  DataType: TDBXDataTypeDescription;
  TypeName: UnicodeString;
  MinimumVersion: UnicodeString;
  MaximumVersion: UnicodeString;
begin
  for index := 0 to Length(Descr) - 1 do
  begin
    DataType := Descr[Index];
    if DataType <> nil then
    begin
      TypeName := DataType.TypeName;
      MinimumVersion := DataType.MinimumVersion;
      MaximumVersion := DataType.MaximumVersion;
      if (not Hash.ContainsKey(TypeName) and ((StringIsNil(MinimumVersion)) or (CompareVersion(MinimumVersion) >= 0)) and ((StringIsNil(MaximumVersion)) or (CompareVersion(MaximumVersion) <= 0))) then
      begin
        Hash[TypeName] := DataType;
        Types.Add(DataType);
        Descr[Index] := nil;
      end;
    end;
  end;
end;

function TDBXBaseMetaDataReader.ParseMetaDataCommand(const MetaDataCommand: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Token: Integer;
begin
  InitScanner;
  FScanner.Init(MetaDataCommand);
  Token := FScanner.NextToken;
  case Token of
    TokenDatabase:
      Result := ParseDone(Token, TDBXMetaDataCommands.GetDatabase, nil);
    TDBXMetaDataCollectionIndex.DataTypes:
      Result := ParseDone(Token, TDBXMetaDataCommands.GetDatatypes, nil);
    TDBXMetaDataCollectionIndex.Catalogs:
      Result := ParseDone(Token, TDBXMetaDataCommands.GetCatalogs, nil);
    TDBXMetaDataCollectionIndex.Schemas:
      Result := ParseParameter(Token, TDBXMetaDataCommands.GetSchemas);
    TDBXMetaDataCollectionIndex.Tables:
      Result := ParseGetTables(Token, TDBXMetaDataCommands.GetTables);
    TDBXMetaDataCollectionIndex.Views:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetViews);
    TDBXMetaDataCollectionIndex.Synonyms:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetSynonyms);
    TDBXMetaDataCollectionIndex.Columns:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetColumns);
    TDBXMetaDataCollectionIndex.Indexes:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetIndexes);
    TDBXMetaDataCollectionIndex.IndexColumns:
      Result := ParseIndexColumns(Token, TDBXMetaDataCommands.GetIndexColumns);
    TDBXMetaDataCollectionIndex.ForeignKeys:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetForeignKeys);
    TDBXMetaDataCollectionIndex.ForeignKeyColumns:
      Result := ParseForeignKeyColumns(Token, TDBXMetaDataCommands.GetForeignKeyColumns);
    TDBXMetaDataCollectionIndex.Procedures:
      Result := ParseProcedures(Token, 3, TDBXMetaDataCommands.GetProcedures);
    TDBXMetaDataCollectionIndex.ProcedureSources:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetProcedureSources);
    TDBXMetaDataCollectionIndex.ProcedureParameters:
      Result := ParseProcedureParameters(Token, 3, TDBXMetaDataCommands.GetProcedureParameters);
    TDBXMetaDataCollectionIndex.Packages:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetPackages);
    TDBXMetaDataCollectionIndex.PackageProcedures:
      Result := ParseProcedures(Token, 4, TDBXMetaDataCommands.GetPackageProcedures);
    TDBXMetaDataCollectionIndex.PackageProcedureParameters:
      Result := ParseProcedureParameters(Token, 4, TDBXMetaDataCommands.GetPackageProcedureParameters);
    TDBXMetaDataCollectionIndex.PackageSources:
      Result := ParseGetObjectName(Token, 3, TDBXMetaDataCommands.GetPackageSources);
    TDBXMetaDataCollectionIndex.Users:
      Result := ParseDone(Token, TDBXMetaDataCommands.GetUsers, nil);
    TDBXMetaDataCollectionIndex.Roles:
      Result := ParseDone(Token, TDBXMetaDataCommands.GetRoles, nil);
    TDBXMetaDataCollectionIndex.ReservedWords:
      Result := ParseDone(Token, TDBXMetaDataCommands.GetReservedWords, nil);
    else
      raise TDBXMetaDataError.Create(SMetaDataCommandExpected);
  end;
end;

function TDBXBaseMetaDataReader.ParseId: UnicodeString;
var
  Token: Integer;
begin
  Token := FScanner.LookAtNextToken;
  case Token of
    TDBXSqlScanner.TokenId:
      begin
        FScanner.NextToken;
        Exit(FScanner.Id);
      end;
    TDBXSqlScanner.TokenSymbol:
      if FScanner.Symbol = '%' then
        FScanner.NextToken;
    else
      if Token > TDBXSqlScanner.TokenEos then
      begin
        FScanner.NextToken;
        Exit(FScanner.Id);
      end;
  end;
  Result := NullString;
end;

procedure TDBXBaseMetaDataReader.ParseSqlObjectName(const Parameters: TDBXStringArray; const MaxIds: Integer);
var
  Parameter: Integer;
  Token: Integer;
  Index: Integer;
begin
  Parameters[MaxIds - 1] := ParseId;
  Parameter := 1;
  Token := FScanner.LookAtNextToken;
  while (Parameter < MaxIds) and (Token = TDBXSqlScanner.TokenPeriod) do
  begin
    FScanner.NextToken;
    for index := 0 to Parameter - 1 do
      Parameters[MaxIds - Parameter + Index - 1] := Parameters[MaxIds - Parameter + Index];
    Parameters[MaxIds - 1] := ParseId;
    IncrAfter(Parameter);
    Token := FScanner.LookAtNextToken;
  end;
end;

function TDBXBaseMetaDataReader.ParseParameter(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
begin
  SetLength(Parameters,1);
  Parameters[0] := ParseId;
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseGetObjectName(const CommandToken: Integer; const MaxIds: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
begin
  SetLength(Parameters,MaxIds);
  ParseSqlObjectName(Parameters, MaxIds);
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseGetTables(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
  Types: TDBXStringBuffer;
  TableType: UnicodeString;
  Token: Integer;
begin
  SetLength(Parameters,4);
  ParseSqlObjectName(Parameters, 3);
  Types := nil;
  TableType := TDBXTableType.Table;
  while not StringIsNil(TableType) do
  begin
    Token := FScanner.LookAtNextToken;
    case Token of
      TokenTable:
        TableType := TDBXTableType.Table;
      TokenView:
        TableType := TDBXTableType.View;
      TokenSystemTable:
        TableType := TDBXTableType.SystemTable;
      TokenSystemView:
        TableType := TDBXTableType.SystemView;
      TokenSynonym:
        TableType := TDBXTableType.Synonym;
      else
        TableType := NullString;
    end;
    if not StringIsNil(TableType) then
    begin
      FScanner.NextToken;
      if Types = nil then
        Types := TDBXStringBuffer.Create
      else 
        Types.Append(',');
      Types.Append(TableType);
      Token := FScanner.LookAtNextToken;
      if (Token = TDBXSqlScanner.TokenSemicolon) or (Token = TDBXSqlScanner.TokenComma) then
        FScanner.NextToken;
    end;
  end;
  if Types <> nil then
    Parameters[3] := Types.ToString;
  FreeAndNil(Types);
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseForeignKeyColumns(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
  KeySpecificationFound: Boolean;
  UsePrimaryKey: Boolean;
  Token: Integer;
  Index: Integer;
begin
  SetLength(Parameters,8);
  ParseSqlObjectName(Parameters, 3);
  KeySpecificationFound := True;
  UsePrimaryKey := False;
  Token := FScanner.LookAtNextToken;
  if (Token <> TokenPrimaryKey) and (Token <> TokenForeignKey) then
  begin
    if Token = TDBXSqlScanner.TokenPeriod then
      FScanner.NextToken;
    Parameters[3] := ParseId;
    Token := FScanner.LookAtNextToken;
  end;
  case Token of
    TokenPrimaryKey:
      UsePrimaryKey := True;
    TokenForeignKey:
      UsePrimaryKey := False;
    else
      KeySpecificationFound := False;
  end;
  if KeySpecificationFound then
    FScanner.NextToken;
  if UsePrimaryKey then
    for index := 0 to 3 do
    begin
      Parameters[Index + 4] := Parameters[4];
      Parameters[Index] := NullString;
    end;
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseIndexColumns(const CommandToken: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
  Token: Integer;
begin
  SetLength(Parameters,4);
  ParseSqlObjectName(Parameters, 3);
  Token := FScanner.LookAtNextToken;
  if Token = TDBXSqlScanner.TokenPeriod then
    FScanner.NextToken;
  Parameters[3] := ParseId;
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseProcedures(const CommandToken: Integer; const MaxIds: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
  ProcType: UnicodeString;
  Token: Integer;
begin
  SetLength(Parameters,MaxIds + 1);
  ParseSqlObjectName(Parameters, MaxIds);
  ProcType := NullString;
  Token := FScanner.LookAtNextToken;
  if (Token = TDBXSqlScanner.TokenSemicolon) or (Token = TDBXSqlScanner.TokenComma) then
  begin
    FScanner.NextToken;
    Token := FScanner.LookAtNextToken;
  end;
  case Token of
    TokenProcedureType:
      ProcType := TDBXProcedureType.ProcedureType;
    TokenFunctionType:
      ProcType := TDBXProcedureType.FunctionType;
  end;
  if not StringIsNil(ProcType) then
  begin
    FScanner.NextToken;
    Parameters[MaxIds] := ProcType;
  end;
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseProcedureParameters(const CommandToken: Integer; const MaxIds: Integer; const Command: UnicodeString): TDBXMetaDataCommandParseResult;
var
  Parameters: TDBXStringArray;
  Token: Integer;
begin
  SetLength(Parameters,MaxIds + 1);
  ParseSqlObjectName(Parameters, MaxIds);
  Token := FScanner.LookAtNextToken;
  if Token = TDBXSqlScanner.TokenPeriod then
  begin
    FScanner.NextToken;
    Parameters[MaxIds] := ParseId;
  end;
  Result := ParseDone(CommandToken, Command, Parameters);
end;

function TDBXBaseMetaDataReader.ParseDone(const CommandToken: Integer; const Command: UnicodeString; const Parameters: TDBXStringArray): TDBXMetaDataCommandParseResult;
var
  Token: Integer;
  Culprint: UnicodeString;
begin
  Token := FScanner.NextToken;
  while Token = TDBXSqlScanner.TokenSemicolon do
    Token := FScanner.NextToken;
  if Token <> TDBXSqlScanner.TokenEos then
  begin
    if Token = TDBXSqlScanner.TokenError then
      raise TDBXMetaDataError.Create(Format(SUnclosedQuotes, [FScanner.SqlQuery]));
    Culprint := NullString;
    if (Token < TDBXSqlScanner.TokenEos) and (Token <> TDBXSqlScanner.TokenId) and (Token <> TDBXSqlScanner.TokenNumber) then
      Culprint := FScanner.Symbol
    else 
      Culprint := FScanner.Id;
    raise TDBXMetaDataError.Create(Format(SUnexpectedSymbol, [Culprint,Command,FScanner.SqlQuery]));
  end;
  Result := TDBXMetaDataCommandParseResult.Create(CommandToken, Parameters);
end;

function TDBXBaseMetaDataReader.FetchCollection(const MetaDataCommand: UnicodeString): TDBXTable;
var
  Command: TDBXMetaDataCommandParseResult;
  CommandToken: Integer;
  Parameters: TDBXStringArray;
begin
  Command := ParseMetaDataCommand(MetaDataCommand);
  CommandToken := Command.CommandToken;
  Parameters := Command.Parameters;
  FreeAndNil(Command);
  case CommandToken of
    TokenDatabase:
      Result := nil;
    TDBXMetaDataCollectionIndex.DataTypes:
      Result := FetchDataTypes;
    TDBXMetaDataCollectionIndex.Catalogs:
      Result := FetchCatalogs;
    TDBXMetaDataCollectionIndex.Schemas:
      Result := FetchSchemas(Parameters[0]);
    TDBXMetaDataCollectionIndex.Tables:
      Result := FetchTables(Parameters[0], Parameters[1], Parameters[2], Parameters[3]);
    TDBXMetaDataCollectionIndex.Views:
      Result := FetchViews(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.Synonyms:
      Result := FetchSynonyms(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.Columns:
      Result := FetchColumns(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.Indexes:
      Result := FetchIndexes(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.IndexColumns:
      Result := FetchIndexColumns(Parameters[0], Parameters[1], Parameters[2], Parameters[3]);
    TDBXMetaDataCollectionIndex.ForeignKeys:
      Result := FetchForeignKeys(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.ForeignKeyColumns:
      Result := FetchForeignKeyColumns(Parameters[0], Parameters[1], Parameters[2], Parameters[3], Parameters[4], Parameters[5], Parameters[6], Parameters[7]);
    TDBXMetaDataCollectionIndex.Procedures:
      Result := FetchProcedures(Parameters[0], Parameters[1], Parameters[2], Parameters[3]);
    TDBXMetaDataCollectionIndex.ProcedureSources:
      Result := FetchProcedureSources(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.ProcedureParameters:
      Result := FetchProcedureParameters(Parameters[0], Parameters[1], Parameters[2], Parameters[3]);
    TDBXMetaDataCollectionIndex.Packages:
      Result := FetchPackages(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.PackageProcedures:
      Result := FetchPackageProcedures(Parameters[0], Parameters[1], Parameters[2], Parameters[3], Parameters[4]);
    TDBXMetaDataCollectionIndex.PackageProcedureParameters:
      Result := FetchPackageProcedureParameters(Parameters[0], Parameters[1], Parameters[2], Parameters[3], Parameters[4]);
    TDBXMetaDataCollectionIndex.PackageSources:
      Result := FetchPackageSources(Parameters[0], Parameters[1], Parameters[2]);
    TDBXMetaDataCollectionIndex.Users:
      Result := FetchUsers;
    TDBXMetaDataCollectionIndex.Roles:
      Result := FetchRoles;
    TDBXMetaDataCollectionIndex.ReservedWords:
      Result := FetchReservedWords;
    else
      Result := nil;
  end;
end;

function TDBXBaseMetaDataReader.MakeStorage(const Cursor: TDBXTable): TDBXTable;
var
  Storage: TDBXTable;
begin
  Storage := FContext.CreateTableStorage(Cursor.DBXTableName, Cursor.CopyColumns);
  Storage.CopyFrom(Cursor);
  Cursor.Close;
  Cursor.Free;
  Storage.AcceptChanges;
  Result := Storage;
end;

function TDBXBaseMetaDataReader.FetchCollectionWithStorage(const MetaDataCommand: UnicodeString): TDBXTable;
begin
  Result := MakeStorage(FetchCollection(MetaDataCommand));
end;

function TDBXBaseMetaDataReader.FetchDataTypes: TDBXTable;
var
  Columns: TDBXValueTypeArray;
begin
  Columns := TDBXMetaDataCollectionColumns.CreateDataTypesColumns;
  Result := TDBXDataTypeCursor.Create(self, Columns, DataTypes);
end;

function TDBXBaseMetaDataReader.FetchCatalogs: TDBXTable;
var
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  Cursor := FContext.ExecuteQuery(SqlForCatalogs, nil, nil);
  Columns := TDBXMetaDataCollectionColumns.CreateCatalogsColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Catalogs, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchSchemas(const Catalog: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,1);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  SetLength(ParameterValues,1);
  ParameterValues[0] := Catalog;
  Cursor := FContext.ExecuteQuery(SqlForSchemas, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateSchemasColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Schemas, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchTables(const Catalog: UnicodeString; const Schema: UnicodeString; const TableName: UnicodeString; const TableType: UnicodeString): TDBXTable;
var
  TypeMask: Integer;
  Tables: UnicodeString;
  Views: UnicodeString;
  SystemTables: UnicodeString;
  SystemViews: UnicodeString;
  Synonyms: UnicodeString;
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  TypeMask := TDBXTableTypeParser.ParseTableTypes(TableType);
  Tables := MakeTableTypeString(TDBXTableTypeFlag.Table, TypeMask);
  Views := MakeTableTypeString(TDBXTableTypeFlag.View, TypeMask);
  SystemTables := MakeTableTypeString(TDBXTableTypeFlag.SystemTable, TypeMask);
  SystemViews := MakeTableTypeString(TDBXTableTypeFlag.SystemView, TypeMask);
  Synonyms := MakeTableTypeString(TDBXTableTypeFlag.Synonym, TypeMask);
  SetLength(ParameterNames,8);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  ParameterNames[3] := TDBXParameterName.Tables;
  ParameterNames[4] := TDBXParameterName.Views;
  ParameterNames[5] := TDBXParameterName.SystemTables;
  ParameterNames[6] := TDBXParameterName.SystemViews;
  ParameterNames[7] := TDBXParameterName.Synonyms;
  SetLength(ParameterValues,8);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := TableName;
  ParameterValues[3] := Tables;
  ParameterValues[4] := Views;
  ParameterValues[5] := SystemTables;
  ParameterValues[6] := SystemViews;
  ParameterValues[7] := Synonyms;
  Cursor := FContext.ExecuteQuery(SqlForTables, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateTablesColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Tables, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchViews(const Catalog: UnicodeString; const Schema: UnicodeString; const View: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
  OrdinalLineNumber: Integer;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.ViewName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := View;
  Cursor := FContext.ExecuteQuery(SqlForViews, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateViewsColumns;
  OrdinalLineNumber := FindSourceLineColumn(Cursor, Length(Columns));
  if OrdinalLineNumber > 0 then
    Result := TDBXSourceTableCursor.Create(FContext, TDBXMetaDataCollectionName.Views, Columns, Cursor, TDBXViewsIndex.Definition, OrdinalLineNumber)
  else 
    Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Views, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchColumns(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  DataTypeHash;
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Table;
  Cursor := FContext.ExecuteQuery(SqlForColumns, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateColumnsColumns;
  Cursor := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Columns, Columns, Cursor);
  Result := TDBXColumnsTableCursor.Create(self, False, Cursor);
end;

function TDBXBaseMetaDataReader.FetchColumnConstraints(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Table;
  Cursor := FContext.ExecuteQuery(SqlForColumnConstraints, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateColumnConstraintsColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.ColumnConstraints, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchIndexes(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Table;
  Cursor := FContext.ExecuteQuery(SqlForIndexes, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateIndexesColumns;
  Columns[TDBXIndexesIndex.IsAscending].Hidden := DescendingIndexSupported;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Indexes, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchIndexColumns(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString; const Index: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,4);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  ParameterNames[3] := TDBXParameterName.IndexName;
  SetLength(ParameterValues,4);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Table;
  ParameterValues[3] := Index;
  Cursor := FContext.ExecuteQuery(SqlForIndexColumns, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateIndexColumnsColumns;
  Columns[TDBXIndexColumnsIndex.IsAscending].Hidden := DescendingIndexColumnsSupported;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.IndexColumns, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchForeignKeys(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Table;
  Cursor := FContext.ExecuteQuery(SqlForForeignKeys, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateForeignKeysColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.ForeignKeys, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchForeignKeyColumns(const Catalog: UnicodeString; const Schema: UnicodeString; const Table: UnicodeString; const ForeignKeyName: UnicodeString; const PrimaryCatalog: UnicodeString; const PrimarySchema: UnicodeString; const PrimaryTable: UnicodeString; const PrimaryKeyName: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,8);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.TableName;
  ParameterNames[3] := TDBXParameterName.ForeignKeyName;
  ParameterNames[4] := TDBXParameterName.PrimaryCatalogName;
  ParameterNames[5] := TDBXParameterName.PrimarySchemaName;
  ParameterNames[6] := TDBXParameterName.PrimaryTableName;
  ParameterNames[7] := TDBXParameterName.PrimaryKeyName;
  SetLength(ParameterValues,8);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Table;
  ParameterValues[3] := ForeignKeyName;
  ParameterValues[4] := PrimaryCatalog;
  ParameterValues[5] := PrimarySchema;
  ParameterValues[6] := PrimaryTable;
  ParameterValues[7] := PrimaryKeyName;
  Cursor := FContext.ExecuteQuery(SqlForForeignKeyColumns, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateForeignKeyColumnsColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.ForeignKeyColumns, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchSynonyms(const Catalog: UnicodeString; const Schema: UnicodeString; const Synonym: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.SynonymName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := Synonym;
  Cursor := FContext.ExecuteQuery(SqlForSynonyms, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateSynonymsColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Synonyms, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchProcedures(const Catalog: UnicodeString; const Schema: UnicodeString; const ProcedureName: UnicodeString; const ProcedureType: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,4);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.ProcedureName;
  ParameterNames[3] := TDBXParameterName.ProcedureType;
  SetLength(ParameterValues,4);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := ProcedureName;
  ParameterValues[3] := ProcedureType;
  Cursor := FContext.ExecuteQuery(SqlForProcedures, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateProceduresColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Procedures, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchProcedureSources(const Catalog: UnicodeString; const Schema: UnicodeString; const &Procedure: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
  OrdinalLineNumber: Integer;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.ProcedureName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := &Procedure;
  Cursor := FContext.ExecuteQuery(SqlForProcedureSources, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateProcedureSourcesColumns;
  OrdinalLineNumber := FindSourceLineColumn(Cursor, Length(Columns));
  if OrdinalLineNumber > 0 then
    Result := TDBXSourceTableCursor.Create(FContext, TDBXMetaDataCollectionName.ProcedureSources, Columns, Cursor, TDBXProcedureSourcesIndex.Definition, OrdinalLineNumber)
  else 
    Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.ProcedureSources, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchProcedureParameters(const Catalog: UnicodeString; const Schema: UnicodeString; const &Procedure: UnicodeString; const Parameter: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  DataTypeHash;
  SetLength(ParameterNames,4);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.ProcedureName;
  ParameterNames[3] := TDBXParameterName.ParameterName;
  SetLength(ParameterValues,4);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := &Procedure;
  ParameterValues[3] := Parameter;
  Cursor := FContext.ExecuteQuery(SqlForProcedureParameters, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreateProcedureParametersColumns;
  Cursor := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.ProcedureParameters, Columns, Cursor);
  Result := TDBXColumnsTableCursor.Create(self, False, Cursor);
end;

function TDBXBaseMetaDataReader.FetchPackages(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.PackageName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := PackageName;
  Cursor := FContext.ExecuteQuery(SqlForPackages, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreatePackagesColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Packages, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchPackageProcedures(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString; const ProcedureName: UnicodeString; const ProcedureType: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,5);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.PackageName;
  ParameterNames[3] := TDBXParameterName.ProcedureName;
  ParameterNames[4] := TDBXParameterName.ProcedureType;
  SetLength(ParameterValues,5);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := PackageName;
  ParameterValues[3] := ProcedureName;
  ParameterValues[4] := ProcedureType;
  Cursor := FContext.ExecuteQuery(SqlForPackageProcedures, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreatePackageProceduresColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.PackageProcedures, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchPackageProcedureParameters(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString; const ProcedureName: UnicodeString; const ParameterName: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  DataTypeHash;
  SetLength(ParameterNames,5);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.PackageName;
  ParameterNames[3] := TDBXParameterName.ProcedureName;
  ParameterNames[4] := TDBXParameterName.ParameterName;
  SetLength(ParameterValues,5);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := PackageName;
  ParameterValues[3] := ProcedureName;
  ParameterValues[4] := ParameterName;
  Cursor := FContext.ExecuteQuery(SqlForPackageProcedureParameters, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreatePackageProcedureParametersColumns;
  Cursor := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.PackageProcedureParameters, Columns, Cursor);
  Result := TDBXColumnsTableCursor.Create(self, False, Cursor);
end;

function TDBXBaseMetaDataReader.FetchPackageSources(const Catalog: UnicodeString; const Schema: UnicodeString; const PackageName: UnicodeString): TDBXTable;
var
  ParameterNames: TDBXStringArray;
  ParameterValues: TDBXStringArray;
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  SetLength(ParameterNames,3);
  ParameterNames[0] := TDBXParameterName.CatalogName;
  ParameterNames[1] := TDBXParameterName.SchemaName;
  ParameterNames[2] := TDBXParameterName.PackageName;
  SetLength(ParameterValues,3);
  ParameterValues[0] := Catalog;
  ParameterValues[1] := Schema;
  ParameterValues[2] := PackageName;
  Cursor := FContext.ExecuteQuery(SqlForPackageSources, ParameterNames, ParameterValues);
  Columns := TDBXMetaDataCollectionColumns.CreatePackageSourcesColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.PackageSources, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchUsers: TDBXTable;
var
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  Cursor := FContext.ExecuteQuery(SqlForUsers, nil, nil);
  Columns := TDBXMetaDataCollectionColumns.CreateUsersColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Users, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchRoles: TDBXTable;
var
  Cursor: TDBXTable;
  Columns: TDBXValueTypeArray;
begin
  Cursor := FContext.ExecuteQuery(SqlForRoles, nil, nil);
  Columns := TDBXMetaDataCollectionColumns.CreateRolesColumns;
  Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.Roles, Columns, Cursor);
end;

function TDBXBaseMetaDataReader.FetchReservedWords: TDBXTable;
var
  ReservedSqlWords: TDBXStringArray;
  Columns: TDBXValueTypeArray;
  Cursor: TDBXTable;
begin
  ReservedSqlWords := ReservedWords;
  Columns := TDBXMetaDataCollectionColumns.CreateReservedWordsColumns;
  if ReservedSqlWords = nil then
  begin
    Cursor := FContext.ExecuteQuery(SqlForReservedWords, nil, nil);
    Result := TDBXCustomMetaDataTable.Create(FContext, TDBXMetaDataCollectionName.ReservedWords, Columns, Cursor);
  end
  else 
    Result := TDBXReservedWordsCursor.Create(FContext, Columns, ReservedSqlWords);
end;

function TDBXBaseMetaDataReader.GetDataTypeDescriptions: TDBXDataTypeDescriptionArray;
begin
  Result := nil;
end;

function TDBXBaseMetaDataReader.GetReservedWords: TDBXStringArray;
begin
  Result := nil;
end;

function TDBXBaseMetaDataReader.GetSqlForDataTypes: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForCatalogs: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForSchemas: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForTables: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForViews: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForColumns: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForColumnConstraints: UnicodeString;
begin
  Result := NullString;
end;

function TDBXBaseMetaDataReader.GetSqlForIndexes: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForIndexColumns: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForForeignKeys: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForForeignKeyColumns: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForSynonyms: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForProcedures: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForProcedureSources: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForProcedureParameters: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForPackages: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForPackageProcedures: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForPackageProcedureParameters: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForPackageSources: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForUsers: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForRoles: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

function TDBXBaseMetaDataReader.GetSqlForReservedWords: UnicodeString;
begin
  raise TDBXMetaDataError.Create(SMissingImplementation);
end;

class function TDBXProviderContext.UseAnsiString(const ProductName: UnicodeString): Boolean;
begin
  if (ProductName = TDBXProductNames.Db2_Product) or (ProductName = TDBXProductNames.InformixProduct) or
     (ProductName = TDBXProductNames.SybaseAseProduct) then
    Result := True
  else
    Result := False;
end;

constructor TDBXReservedWordsCursor.Create(const TypeNames: TDBXPlatformTypeNames; const Columns: TDBXValueTypeArray; const Keywords: TDBXStringArray);
begin
  inherited Create(nil);
  FTypeNames := TypeNames;
  FKeywords := Keywords;
  FReservedRow := TDBXSingleValueRow.Create;
  FReservedRow.Columns := Columns;
  FRowIndex := -1;
end;

function TDBXReservedWordsCursor.GetOrdinal(const Name: UnicodeString): Integer;
begin
  Result := FReservedRow.GetOrdinal(Name);
end;

destructor TDBXReservedWordsCursor.Destroy;
begin
  FreeAndNil(FReservedRow);
  FKeywords := nil;
  inherited Destroy;
end;

function TDBXReservedWordsCursor.GetDBXTableName: UnicodeString;
begin
  Result := TDBXMetaDataCollectionName.ReservedWords;
end;

function TDBXReservedWordsCursor.GetColumns: TDBXValueTypeArray;
begin
  Result := FReservedRow.Columns;
end;

function TDBXReservedWordsCursor.First: Boolean;
begin
  FRowIndex := 0;
  Result := FRowIndex < Length(FKeywords);
end;

function TDBXReservedWordsCursor.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  if FRowIndex < 0 then
    raise TDBXMetaDataError.Create(SMustCallNextFirst);
  if FRowIndex >= Length(FKeywords) then
    raise TDBXMetaDataError.Create(SPastEndOfCursor);
  Result := FReservedRow.Value[Ordinal];
end;

function TDBXReservedWordsCursor.Next: Boolean;
begin
  IncrAfter(FRowIndex);
  if FRowIndex < Length(FKeywords) then
  begin
    FReservedRow.Value[TDBXReservedWordsIndex.ReservedWord].AsString := FKeywords[FRowIndex];
    Exit(True);
  end;
  Result := False;
end;

function TDBXReservedWordsCursor.InBounds: Boolean;
begin
  Result := (FRowIndex < Length(FKeywords));
end;

procedure TDBXReservedWordsCursor.Close;
begin
end;

constructor TDBXSourceTableCursor.Create(const Context: TDBXProviderContext; const MetaDataCollectionName: UnicodeString; const Columns: TDBXValueTypeArray; const Cursor: TDBXTable; const OrdinalDefinition: Integer; const OrdinalLineNumber: Integer);
begin
  inherited Create(Context, MetaDataCollectionName, Columns, Cursor);
  FOrdinalLineNumber := OrdinalLineNumber;
  FOrdinalDefinition := OrdinalDefinition;
  FRowStorage := TDBXSingleValueRow.Create;
  FRowStorage.Columns := CopyColumns;
  FBuffer := TDBXStringBuffer.Create;
  FBeforeFirst := True;
end;

destructor TDBXSourceTableCursor.Destroy;
begin
  FreeAndNil(FRowStorage);
  FreeAndNil(FBuffer);
  inherited Destroy;
end;

function TDBXSourceTableCursor.Next: Boolean;
var
  LineNumber: Integer;
  PrevLineNumber: Integer;
  Ordinal: Integer;
begin
  if FBeforeFirst then
  begin
    FBeforeEnd := FCursor.Next;
    FBeforeFirst := False;
  end;
  if not FBeforeEnd then
    Exit(False);
  LineNumber := FCursor.Value[FOrdinalLineNumber].AsInt32;
  PrevLineNumber := LineNumber - 1;
  for Ordinal := 0 to Length(FColumns) - 1 do
    FRowStorage.Value[Ordinal].SetValue(Value[Ordinal]);
  FBuffer.Length := 0;
  while FBeforeEnd and (LineNumber > PrevLineNumber) do
  begin
    FBuffer.Append(FCursor.Value[FOrdinalDefinition].AsString);
    FBeforeEnd := FCursor.Next;
    if FBeforeEnd then
    begin
      PrevLineNumber := LineNumber;
      LineNumber := FCursor.Value[FOrdinalLineNumber].AsInt32;
    end;
  end;
  FRowStorage.Value[FOrdinalDefinition].AsString := FBuffer.ToString;
  Result := True;
end;

function TDBXSourceTableCursor.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  Result := FRowStorage.Value[Ordinal];
end;

class function TDBXTableTypeParser.ParseTableTypes(const TableTypes: UnicodeString): Integer;
var
  Flags: Integer;
  Tokenizer: TDBXTokenizer;
  TableType: UnicodeString;
begin
  Flags := 0;
  if not StringIsNil(TableTypes) then
  begin
    Tokenizer := TDBXTokenizer.Create(TableTypes, ',');
    while Tokenizer.HasMoreTokens do
    begin
      TableType := Trim(Tokenizer.NextToken);
      if (TableType = TDBXTableType.Table) then
        Flags := Flags or TDBXTableTypeFlag.Table
      else if (TableType = TDBXTableType.SystemTable) then
        Flags := Flags or TDBXTableTypeFlag.SystemTable
      else if (TableType = TDBXTableType.View) then
        Flags := Flags or TDBXTableTypeFlag.View
      else if (TableType = TDBXTableType.Synonym) then
        Flags := Flags or TDBXTableTypeFlag.Synonym
      else if Length(TableType) > 0 then
        raise TDBXMetaDataError.Create(SUnknownTableType + TableType);
    end;
    FreeAndNil(Tokenizer);
  end;
  if Flags = 0 then
    Flags := TDBXTableTypeFlag.All;
  Result := Flags;
end;

end.
