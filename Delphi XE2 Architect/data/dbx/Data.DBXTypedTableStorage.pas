{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXTypedTableStorage;

interface

uses
  Data.DBXCommonTable;

type
  TDBXCatalogsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
  end;

  TDBXColumnConstraintsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetConstraintName: UnicodeString;
    procedure SetConstraintName(const Value: UnicodeString);
    function GetColumnName: UnicodeString;
    procedure SetColumnName(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property ConstraintName: UnicodeString read GetConstraintName write SetConstraintName;
    property ColumnName: UnicodeString read GetColumnName write SetColumnName;
  end;

  TDBXColumnsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetColumnName: UnicodeString;
    procedure SetColumnName(const Value: UnicodeString);
    function GetTypeName: UnicodeString;
    procedure SetTypeName(const Value: UnicodeString);
    function GetPrecision: Integer;
    procedure SetPrecision(const Value: Integer);
    function GetScale: Integer;
    procedure SetScale(const Value: Integer);
    function GetColumnOrdinal: Integer;
    procedure SetColumnOrdinal(const Value: Integer);
    function GetDefaultValue: UnicodeString;
    procedure SetDefaultValue(const Value: UnicodeString);
    function IsNullable: Boolean;
    procedure SetNullable(const Value: Boolean);
    function IsAutoIncrement: Boolean;
    procedure SetAutoIncrement(const Value: Boolean);
    function GetMaxInline: Integer;
    procedure SetMaxInline(const Value: Integer);
    function GetDbxDataType: Integer;
    procedure SetDbxDataType(const Value: Integer);
    function IsFixedLength: Boolean;
    procedure SetFixedLength(const Value: Boolean);
    function IsUnicode: Boolean;
    procedure SetUnicode(const Value: Boolean);
    function IsLong: Boolean;
    procedure SetLong(const Value: Boolean);
    function IsUnsigned: Boolean;
    procedure SetUnsigned(const Value: Boolean);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property ColumnName: UnicodeString read GetColumnName write SetColumnName;
    property TypeName: UnicodeString read GetTypeName write SetTypeName;
    property Precision: Integer read GetPrecision write SetPrecision;
    property Scale: Integer read GetScale write SetScale;
    property ColumnOrdinal: Integer read GetColumnOrdinal write SetColumnOrdinal;
    property DefaultValue: UnicodeString read GetDefaultValue write SetDefaultValue;
    property Nullable: Boolean read IsNullable write SetNullable;
    property AutoIncrement: Boolean read IsAutoIncrement write SetAutoIncrement;
    property MaxInline: Integer read GetMaxInline write SetMaxInline;
    property DbxDataType: Integer read GetDbxDataType write SetDbxDataType;
    property FixedLength: Boolean read IsFixedLength write SetFixedLength;
    property Unicode: Boolean read IsUnicode write SetUnicode;
    property Long: Boolean read IsLong write SetLong;
    property Unsigned: Boolean read IsUnsigned write SetUnsigned;
  end;

  TDBXDataTypesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetTypeName: UnicodeString;
    procedure SetTypeName(const Value: UnicodeString);
    function GetDbxDataType: Integer;
    procedure SetDbxDataType(const Value: Integer);
    function GetColumnSize: Int64;
    procedure SetColumnSize(const Value: Int64);
    function GetCreateFormat: UnicodeString;
    procedure SetCreateFormat(const Value: UnicodeString);
    function GetCreateParameters: UnicodeString;
    procedure SetCreateParameters(const Value: UnicodeString);
    function GetDataType: UnicodeString;
    procedure SetDataType(const Value: UnicodeString);
    function IsAutoIncrementable: Boolean;
    procedure SetAutoIncrementable(const Value: Boolean);
    function IsBestMatch: Boolean;
    procedure SetBestMatch(const Value: Boolean);
    function IsCaseSensitive: Boolean;
    procedure SetCaseSensitive(const Value: Boolean);
    function IsFixedLength: Boolean;
    procedure SetFixedLength(const Value: Boolean);
    function IsFixedPrecisionScale: Boolean;
    procedure SetFixedPrecisionScale(const Value: Boolean);
    function IsLong: Boolean;
    procedure SetLong(const Value: Boolean);
    function IsNullable: Boolean;
    procedure SetNullable(const Value: Boolean);
    function IsSearchable: Boolean;
    procedure SetSearchable(const Value: Boolean);
    function IsSearchableWithLike: Boolean;
    procedure SetSearchableWithLike(const Value: Boolean);
    function IsUnsigned: Boolean;
    procedure SetUnsigned(const Value: Boolean);
    function GetMaximumScale: SmallInt;
    procedure SetMaximumScale(const Value: SmallInt);
    function GetMinimumScale: SmallInt;
    procedure SetMinimumScale(const Value: SmallInt);
    function IsConcurrencyType: Boolean;
    procedure SetConcurrencyType(const Value: Boolean);
    function GetMaximumVersion: UnicodeString;
    procedure SetMaximumVersion(const Value: UnicodeString);
    function GetMinimumVersion: UnicodeString;
    procedure SetMinimumVersion(const Value: UnicodeString);
    function IsLiteralSupported: Boolean;
    procedure SetLiteralSupported(const Value: Boolean);
    function GetLiteralPrefix: UnicodeString;
    procedure SetLiteralPrefix(const Value: UnicodeString);
    function GetLiteralSuffix: UnicodeString;
    procedure SetLiteralSuffix(const Value: UnicodeString);
    function IsUnicode: Boolean;
    procedure SetUnicode(const Value: Boolean);
    function GetProviderDbType: Integer;
    procedure SetProviderDbType(const Value: Integer);
  public
    property TypeName: UnicodeString read GetTypeName write SetTypeName;
    property DbxDataType: Integer read GetDbxDataType write SetDbxDataType;
    property ColumnSize: Int64 read GetColumnSize write SetColumnSize;
    property CreateFormat: UnicodeString read GetCreateFormat write SetCreateFormat;
    property CreateParameters: UnicodeString read GetCreateParameters write SetCreateParameters;
    property DataType: UnicodeString read GetDataType write SetDataType;
    property AutoIncrementable: Boolean read IsAutoIncrementable write SetAutoIncrementable;
    property BestMatch: Boolean read IsBestMatch write SetBestMatch;
    property CaseSensitive: Boolean read IsCaseSensitive write SetCaseSensitive;
    property FixedLength: Boolean read IsFixedLength write SetFixedLength;
    property FixedPrecisionScale: Boolean read IsFixedPrecisionScale write SetFixedPrecisionScale;
    property Long: Boolean read IsLong write SetLong;
    property Nullable: Boolean read IsNullable write SetNullable;
    property Searchable: Boolean read IsSearchable write SetSearchable;
    property SearchableWithLike: Boolean read IsSearchableWithLike write SetSearchableWithLike;
    property Unsigned: Boolean read IsUnsigned write SetUnsigned;
    property MaximumScale: SmallInt read GetMaximumScale write SetMaximumScale;
    property MinimumScale: SmallInt read GetMinimumScale write SetMinimumScale;
    property ConcurrencyType: Boolean read IsConcurrencyType write SetConcurrencyType;
    property MaximumVersion: UnicodeString read GetMaximumVersion write SetMaximumVersion;
    property MinimumVersion: UnicodeString read GetMinimumVersion write SetMinimumVersion;
    property LiteralSupported: Boolean read IsLiteralSupported write SetLiteralSupported;
    property LiteralPrefix: UnicodeString read GetLiteralPrefix write SetLiteralPrefix;
    property LiteralSuffix: UnicodeString read GetLiteralSuffix write SetLiteralSuffix;
    property Unicode: Boolean read IsUnicode write SetUnicode;
    property ProviderDbType: Integer read GetProviderDbType write SetProviderDbType;
  end;

  TDBXForeignKeyColumnsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetForeignKeyName: UnicodeString;
    procedure SetForeignKeyName(const Value: UnicodeString);
    function GetColumnName: UnicodeString;
    procedure SetColumnName(const Value: UnicodeString);
    function GetPrimaryCatalogName: UnicodeString;
    procedure SetPrimaryCatalogName(const Value: UnicodeString);
    function GetPrimarySchemaName: UnicodeString;
    procedure SetPrimarySchemaName(const Value: UnicodeString);
    function GetPrimaryTableName: UnicodeString;
    procedure SetPrimaryTableName(const Value: UnicodeString);
    function GetPrimaryKeyName: UnicodeString;
    procedure SetPrimaryKeyName(const Value: UnicodeString);
    function GetPrimaryColumnName: UnicodeString;
    procedure SetPrimaryColumnName(const Value: UnicodeString);
    function GetColumnOrdinal: Integer;
    procedure SetColumnOrdinal(const Value: Integer);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property ForeignKeyName: UnicodeString read GetForeignKeyName write SetForeignKeyName;
    property ColumnName: UnicodeString read GetColumnName write SetColumnName;
    property PrimaryCatalogName: UnicodeString read GetPrimaryCatalogName write SetPrimaryCatalogName;
    property PrimarySchemaName: UnicodeString read GetPrimarySchemaName write SetPrimarySchemaName;
    property PrimaryTableName: UnicodeString read GetPrimaryTableName write SetPrimaryTableName;
    property PrimaryKeyName: UnicodeString read GetPrimaryKeyName write SetPrimaryKeyName;
    property PrimaryColumnName: UnicodeString read GetPrimaryColumnName write SetPrimaryColumnName;
    property ColumnOrdinal: Integer read GetColumnOrdinal write SetColumnOrdinal;
  end;

  TDBXForeignKeysTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetForeignKeyName: UnicodeString;
    procedure SetForeignKeyName(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property ForeignKeyName: UnicodeString read GetForeignKeyName write SetForeignKeyName;
  end;

  TDBXIndexColumnsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetIndexName: UnicodeString;
    procedure SetIndexName(const Value: UnicodeString);
    function GetColumnName: UnicodeString;
    procedure SetColumnName(const Value: UnicodeString);
    function GetColumnOrdinal: Integer;
    procedure SetColumnOrdinal(const Value: Integer);
    function IsAscending: Boolean;
    procedure SetAscending(const Value: Boolean);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property IndexName: UnicodeString read GetIndexName write SetIndexName;
    property ColumnName: UnicodeString read GetColumnName write SetColumnName;
    property ColumnOrdinal: Integer read GetColumnOrdinal write SetColumnOrdinal;
    property Ascending: Boolean read IsAscending write SetAscending;
  end;

  TDBXIndexesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetIndexName: UnicodeString;
    procedure SetIndexName(const Value: UnicodeString);
    function GetConstraintName: UnicodeString;
    procedure SetConstraintName(const Value: UnicodeString);
    function IsPrimary: Boolean;
    procedure SetPrimary(const Value: Boolean);
    function IsUnique: Boolean;
    procedure SetUnique(const Value: Boolean);
    function IsAscending: Boolean;
    procedure SetAscending(const Value: Boolean);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property IndexName: UnicodeString read GetIndexName write SetIndexName;
    property ConstraintName: UnicodeString read GetConstraintName write SetConstraintName;
    property Primary: Boolean read IsPrimary write SetPrimary;
    property Unique: Boolean read IsUnique write SetUnique;
    property Ascending: Boolean read IsAscending write SetAscending;
  end;

  TDBXPackageProcedureParametersTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetPackageName: UnicodeString;
    procedure SetPackageName(const Value: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProcedureName(const Value: UnicodeString);
    function GetParameterName: UnicodeString;
    procedure SetParameterName(const Value: UnicodeString);
    function GetParameterMode: UnicodeString;
    procedure SetParameterMode(const Value: UnicodeString);
    function GetTypeName: UnicodeString;
    procedure SetTypeName(const Value: UnicodeString);
    function GetPrecision: Integer;
    procedure SetPrecision(const Value: Integer);
    function GetScale: Integer;
    procedure SetScale(const Value: Integer);
    function GetColumnOrdinal: Integer;
    procedure SetColumnOrdinal(const Value: Integer);
    function IsNullable: Boolean;
    procedure SetNullable(const Value: Boolean);
    function GetDbxDataType: Integer;
    procedure SetDbxDataType(const Value: Integer);
    function IsFixedLength: Boolean;
    procedure SetFixedLength(const Value: Boolean);
    function IsUnicode: Boolean;
    procedure SetUnicode(const Value: Boolean);
    function IsLong: Boolean;
    procedure SetLong(const Value: Boolean);
    function IsUnsigned: Boolean;
    procedure SetUnsigned(const Value: Boolean);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property PackageName: UnicodeString read GetPackageName write SetPackageName;
    property ProcedureName: UnicodeString read GetProcedureName write SetProcedureName;
    property ParameterName: UnicodeString read GetParameterName write SetParameterName;
    property ParameterMode: UnicodeString read GetParameterMode write SetParameterMode;
    property TypeName: UnicodeString read GetTypeName write SetTypeName;
    property Precision: Integer read GetPrecision write SetPrecision;
    property Scale: Integer read GetScale write SetScale;
    property ColumnOrdinal: Integer read GetColumnOrdinal write SetColumnOrdinal;
    property Nullable: Boolean read IsNullable write SetNullable;
    property DbxDataType: Integer read GetDbxDataType write SetDbxDataType;
    property FixedLength: Boolean read IsFixedLength write SetFixedLength;
    property Unicode: Boolean read IsUnicode write SetUnicode;
    property Long: Boolean read IsLong write SetLong;
    property Unsigned: Boolean read IsUnsigned write SetUnsigned;
  end;

  TDBXPackageProceduresTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetPackageName: UnicodeString;
    procedure SetPackageName(const Value: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProcedureName(const Value: UnicodeString);
    function GetProcedureType: UnicodeString;
    procedure SetProcedureType(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property PackageName: UnicodeString read GetPackageName write SetPackageName;
    property ProcedureName: UnicodeString read GetProcedureName write SetProcedureName;
    property ProcedureType: UnicodeString read GetProcedureType write SetProcedureType;
  end;

  TDBXPackageSourcesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetPackageName: UnicodeString;
    procedure SetPackageName(const Value: UnicodeString);
    function GetDefinition: UnicodeString;
    procedure SetDefinition(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property PackageName: UnicodeString read GetPackageName write SetPackageName;
    property Definition: UnicodeString read GetDefinition write SetDefinition;
  end;

  TDBXPackagesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetPackageName: UnicodeString;
    procedure SetPackageName(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property PackageName: UnicodeString read GetPackageName write SetPackageName;
  end;

  TDBXProcedureParametersTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProcedureName(const Value: UnicodeString);
    function GetParameterName: UnicodeString;
    procedure SetParameterName(const Value: UnicodeString);
    function GetParameterMode: UnicodeString;
    procedure SetParameterMode(const Value: UnicodeString);
    function GetTypeName: UnicodeString;
    procedure SetTypeName(const Value: UnicodeString);
    function GetPrecision: Integer;
    procedure SetPrecision(const Value: Integer);
    function GetScale: Integer;
    procedure SetScale(const Value: Integer);
    function GetColumnOrdinal: Integer;
    procedure SetColumnOrdinal(const Value: Integer);
    function IsNullable: Boolean;
    procedure SetNullable(const Value: Boolean);
    function GetDbxDataType: Integer;
    procedure SetDbxDataType(const Value: Integer);
    function IsFixedLength: Boolean;
    procedure SetFixedLength(const Value: Boolean);
    function IsUnicode: Boolean;
    procedure SetUnicode(const Value: Boolean);
    function IsLong: Boolean;
    procedure SetLong(const Value: Boolean);
    function IsUnsigned: Boolean;
    procedure SetUnsigned(const Value: Boolean);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property ProcedureName: UnicodeString read GetProcedureName write SetProcedureName;
    property ParameterName: UnicodeString read GetParameterName write SetParameterName;
    property ParameterMode: UnicodeString read GetParameterMode write SetParameterMode;
    property TypeName: UnicodeString read GetTypeName write SetTypeName;
    property Precision: Integer read GetPrecision write SetPrecision;
    property Scale: Integer read GetScale write SetScale;
    property ColumnOrdinal: Integer read GetColumnOrdinal write SetColumnOrdinal;
    property Nullable: Boolean read IsNullable write SetNullable;
    property DbxDataType: Integer read GetDbxDataType write SetDbxDataType;
    property FixedLength: Boolean read IsFixedLength write SetFixedLength;
    property Unicode: Boolean read IsUnicode write SetUnicode;
    property Long: Boolean read IsLong write SetLong;
    property Unsigned: Boolean read IsUnsigned write SetUnsigned;
  end;

  TDBXProcedureSourcesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProcedureName(const Value: UnicodeString);
    function GetProcedureType: UnicodeString;
    procedure SetProcedureType(const Value: UnicodeString);
    function GetDefinition: UnicodeString;
    procedure SetDefinition(const Value: UnicodeString);
    function GetExternalDefinition: UnicodeString;
    procedure SetExternalDefinition(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property ProcedureName: UnicodeString read GetProcedureName write SetProcedureName;
    property ProcedureType: UnicodeString read GetProcedureType write SetProcedureType;
    property Definition: UnicodeString read GetDefinition write SetDefinition;
    property ExternalDefinition: UnicodeString read GetExternalDefinition write SetExternalDefinition;
  end;

  TDBXProceduresTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProcedureName(const Value: UnicodeString);
    function GetProcedureType: UnicodeString;
    procedure SetProcedureType(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property ProcedureName: UnicodeString read GetProcedureName write SetProcedureName;
    property ProcedureType: UnicodeString read GetProcedureType write SetProcedureType;
  end;

  TDBXReservedWordsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetReservedWord: UnicodeString;
    procedure SetReservedWord(const Value: UnicodeString);
  public
    property ReservedWord: UnicodeString read GetReservedWord write SetReservedWord;
  end;

  TDBXRolesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetRoleName: UnicodeString;
    procedure SetRoleName(const Value: UnicodeString);
  public
    property RoleName: UnicodeString read GetRoleName write SetRoleName;
  end;

  TDBXSchemasTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
  end;

  TDBXSynonymsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetSynonymName: UnicodeString;
    procedure SetSynonymName(const Value: UnicodeString);
    function GetTableCatalogName: UnicodeString;
    procedure SetTableCatalogName(const Value: UnicodeString);
    function GetTableSchemaName: UnicodeString;
    procedure SetTableSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property SynonymName: UnicodeString read GetSynonymName write SetSynonymName;
    property TableCatalogName: UnicodeString read GetTableCatalogName write SetTableCatalogName;
    property TableSchemaName: UnicodeString read GetTableSchemaName write SetTableSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
  end;

  TDBXTablesTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const Value: UnicodeString);
    function GetTableType: UnicodeString;
    procedure SetTableType(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property TableType: UnicodeString read GetTableType write SetTableType;
  end;

  TDBXUsersTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetUserName: UnicodeString;
    procedure SetUserName(const Value: UnicodeString);
  public
    property UserName: UnicodeString read GetUserName write SetUserName;
  end;

  TDBXViewsTableStorage = class(TDBXDelegateTable)
  public
    constructor Create; overload;
    constructor Create(const TableStore: TDBXTable); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const Value: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const Value: UnicodeString);
    function GetViewName: UnicodeString;
    procedure SetViewName(const Value: UnicodeString);
    function GetDefinition: UnicodeString;
    procedure SetDefinition(const Value: UnicodeString);
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property ViewName: UnicodeString read GetViewName write SetViewName;
    property Definition: UnicodeString read GetDefinition write SetDefinition;
  end;

implementation

uses
  Data.DBXMetaDataNames,
  Data.DBXMetaDataReader,
  Data.DBXTableFactory;

constructor TDBXCatalogsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Catalogs;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateCatalogsColumns;
end;

constructor TDBXCatalogsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXCatalogsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXCatalogsIndex.CatalogName].AsString;
end;

procedure TDBXCatalogsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXCatalogsIndex.CatalogName].AsString := Value;
end;

constructor TDBXColumnConstraintsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.ColumnConstraints;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateColumnConstraintsColumns;
end;

constructor TDBXColumnConstraintsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXColumnConstraintsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnConstraintsIndex.CatalogName].AsString;
end;

procedure TDBXColumnConstraintsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnConstraintsIndex.CatalogName].AsString := Value;
end;

function TDBXColumnConstraintsTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnConstraintsIndex.SchemaName].AsString;
end;

procedure TDBXColumnConstraintsTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnConstraintsIndex.SchemaName].AsString := Value;
end;

function TDBXColumnConstraintsTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnConstraintsIndex.TableName].AsString;
end;

procedure TDBXColumnConstraintsTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnConstraintsIndex.TableName].AsString := Value;
end;

function TDBXColumnConstraintsTableStorage.GetConstraintName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnConstraintsIndex.ConstraintName].AsString;
end;

procedure TDBXColumnConstraintsTableStorage.SetConstraintName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnConstraintsIndex.ConstraintName].AsString := Value;
end;

function TDBXColumnConstraintsTableStorage.GetColumnName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnConstraintsIndex.ColumnName].AsString;
end;

procedure TDBXColumnConstraintsTableStorage.SetColumnName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnConstraintsIndex.ColumnName].AsString := Value;
end;

constructor TDBXColumnsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Columns;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateColumnsColumns;
end;

constructor TDBXColumnsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXColumnsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnsIndex.CatalogName].AsString;
end;

procedure TDBXColumnsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnsIndex.CatalogName].AsString := Value;
end;

function TDBXColumnsTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnsIndex.SchemaName].AsString;
end;

procedure TDBXColumnsTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnsIndex.SchemaName].AsString := Value;
end;

function TDBXColumnsTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnsIndex.TableName].AsString;
end;

procedure TDBXColumnsTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnsIndex.TableName].AsString := Value;
end;

function TDBXColumnsTableStorage.GetColumnName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnsIndex.ColumnName].AsString;
end;

procedure TDBXColumnsTableStorage.SetColumnName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnsIndex.ColumnName].AsString := Value;
end;

function TDBXColumnsTableStorage.GetTypeName: UnicodeString;
begin
  Result := Self.Value[TDBXColumnsIndex.TypeName].AsString;
end;

procedure TDBXColumnsTableStorage.SetTypeName(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnsIndex.TypeName].AsString := Value;
end;

function TDBXColumnsTableStorage.GetPrecision: Integer;
begin
  Result := Self.Value[TDBXColumnsIndex.Precision].AsInt32;
end;

procedure TDBXColumnsTableStorage.SetPrecision(const Value: Integer);
begin
  Self.Value[TDBXColumnsIndex.Precision].AsInt32 := Value;
end;

function TDBXColumnsTableStorage.GetScale: Integer;
begin
  Result := Self.Value[TDBXColumnsIndex.Scale].AsInt32;
end;

procedure TDBXColumnsTableStorage.SetScale(const Value: Integer);
begin
  Self.Value[TDBXColumnsIndex.Scale].AsInt32 := Value;
end;

function TDBXColumnsTableStorage.GetColumnOrdinal: Integer;
begin
  Result := Self.Value[TDBXColumnsIndex.Ordinal].AsInt32;
end;

procedure TDBXColumnsTableStorage.SetColumnOrdinal(const Value: Integer);
begin
  Self.Value[TDBXColumnsIndex.Ordinal].AsInt32 := Value;
end;

function TDBXColumnsTableStorage.GetDefaultValue: UnicodeString;
begin
  Result := Self.Value[TDBXColumnsIndex.DefaultValue].AsString;
end;

procedure TDBXColumnsTableStorage.SetDefaultValue(const Value: UnicodeString);
begin
  Self.Value[TDBXColumnsIndex.DefaultValue].AsString := Value;
end;

function TDBXColumnsTableStorage.IsNullable: Boolean;
begin
  Result := Self.Value[TDBXColumnsIndex.IsNullable].AsBoolean;
end;

procedure TDBXColumnsTableStorage.SetNullable(const Value: Boolean);
begin
  Self.Value[TDBXColumnsIndex.IsNullable].AsBoolean := Value;
end;

function TDBXColumnsTableStorage.IsAutoIncrement: Boolean;
begin
  Result := Self.Value[TDBXColumnsIndex.IsAutoIncrement].AsBoolean;
end;

procedure TDBXColumnsTableStorage.SetAutoIncrement(const Value: Boolean);
begin
  Self.Value[TDBXColumnsIndex.IsAutoIncrement].AsBoolean := Value;
end;

function TDBXColumnsTableStorage.GetMaxInline: Integer;
begin
  Result := Self.Value[TDBXColumnsIndex.MaxInline].AsInt32;
end;

procedure TDBXColumnsTableStorage.SetMaxInline(const Value: Integer);
begin
  Self.Value[TDBXColumnsIndex.MaxInline].AsInt32 := Value;
end;

function TDBXColumnsTableStorage.GetDbxDataType: Integer;
begin
  Result := Self.Value[TDBXColumnsIndex.DbxDataType].AsInt32;
end;

procedure TDBXColumnsTableStorage.SetDbxDataType(const Value: Integer);
begin
  Self.Value[TDBXColumnsIndex.DbxDataType].AsInt32 := Value;
end;

function TDBXColumnsTableStorage.IsFixedLength: Boolean;
begin
  Result := Self.Value[TDBXColumnsIndex.IsFixedLength].AsBoolean;
end;

procedure TDBXColumnsTableStorage.SetFixedLength(const Value: Boolean);
begin
  Self.Value[TDBXColumnsIndex.IsFixedLength].AsBoolean := Value;
end;

function TDBXColumnsTableStorage.IsUnicode: Boolean;
begin
  Result := Self.Value[TDBXColumnsIndex.IsUnicode].AsBoolean;
end;

procedure TDBXColumnsTableStorage.SetUnicode(const Value: Boolean);
begin
  Self.Value[TDBXColumnsIndex.IsUnicode].AsBoolean := Value;
end;

function TDBXColumnsTableStorage.IsLong: Boolean;
begin
  Result := Self.Value[TDBXColumnsIndex.IsLong].AsBoolean;
end;

procedure TDBXColumnsTableStorage.SetLong(const Value: Boolean);
begin
  Self.Value[TDBXColumnsIndex.IsLong].AsBoolean := Value;
end;

function TDBXColumnsTableStorage.IsUnsigned: Boolean;
begin
  Result := Self.Value[TDBXColumnsIndex.IsUnsigned].AsBoolean;
end;

procedure TDBXColumnsTableStorage.SetUnsigned(const Value: Boolean);
begin
  Self.Value[TDBXColumnsIndex.IsUnsigned].AsBoolean := Value;
end;

constructor TDBXDataTypesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.DataTypes;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateDataTypesColumns;
end;

constructor TDBXDataTypesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXDataTypesTableStorage.GetTypeName: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.TypeName].AsString;
end;

procedure TDBXDataTypesTableStorage.SetTypeName(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.TypeName].AsString := Value;
end;

function TDBXDataTypesTableStorage.GetDbxDataType: Integer;
begin
  Result := Self.Value[TDBXDataTypesIndex.DbxDataType].AsInt32;
end;

procedure TDBXDataTypesTableStorage.SetDbxDataType(const Value: Integer);
begin
  Self.Value[TDBXDataTypesIndex.DbxDataType].AsInt32 := Value;
end;

function TDBXDataTypesTableStorage.GetColumnSize: Int64;
begin
  Result := Self.Value[TDBXDataTypesIndex.ColumnSize].GetInt64;
end;

procedure TDBXDataTypesTableStorage.SetColumnSize(const Value: Int64);
begin
  Self.Value[TDBXDataTypesIndex.ColumnSize].SetInt64(Value);
end;

function TDBXDataTypesTableStorage.GetCreateFormat: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.CreateFormat].AsString;
end;

procedure TDBXDataTypesTableStorage.SetCreateFormat(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.CreateFormat].AsString := Value;
end;

function TDBXDataTypesTableStorage.GetCreateParameters: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.CreateParameters].AsString;
end;

procedure TDBXDataTypesTableStorage.SetCreateParameters(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.CreateParameters].AsString := Value;
end;

function TDBXDataTypesTableStorage.GetDataType: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.DataType].AsString;
end;

procedure TDBXDataTypesTableStorage.SetDataType(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.DataType].AsString := Value;
end;

function TDBXDataTypesTableStorage.IsAutoIncrementable: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsAutoIncrementable].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetAutoIncrementable(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsAutoIncrementable].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsBestMatch: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsBestMatch].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetBestMatch(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsBestMatch].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsCaseSensitive: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsCaseSensitive].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetCaseSensitive(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsCaseSensitive].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsFixedLength: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsFixedLength].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetFixedLength(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsFixedLength].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsFixedPrecisionScale: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsFixedPrecisionScale].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetFixedPrecisionScale(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsFixedPrecisionScale].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsLong: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsLong].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetLong(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsLong].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsNullable: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsNullable].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetNullable(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsNullable].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsSearchable: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsSearchable].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetSearchable(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsSearchable].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsSearchableWithLike: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsSearchableWithLike].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetSearchableWithLike(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsSearchableWithLike].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.IsUnsigned: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsUnsigned].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetUnsigned(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsUnsigned].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.GetMaximumScale: SmallInt;
begin
  Result := Self.Value[TDBXDataTypesIndex.MaximumScale].GetInt16;
end;

procedure TDBXDataTypesTableStorage.SetMaximumScale(const Value: SmallInt);
begin
  Self.Value[TDBXDataTypesIndex.MaximumScale].SetInt16(Value);
end;

function TDBXDataTypesTableStorage.GetMinimumScale: SmallInt;
begin
  Result := Self.Value[TDBXDataTypesIndex.MinimumScale].GetInt16;
end;

procedure TDBXDataTypesTableStorage.SetMinimumScale(const Value: SmallInt);
begin
  Self.Value[TDBXDataTypesIndex.MinimumScale].SetInt16(Value);
end;

function TDBXDataTypesTableStorage.IsConcurrencyType: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsConcurrencyType].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetConcurrencyType(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsConcurrencyType].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.GetMaximumVersion: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.MaximumVersion].AsString;
end;

procedure TDBXDataTypesTableStorage.SetMaximumVersion(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.MaximumVersion].AsString := Value;
end;

function TDBXDataTypesTableStorage.GetMinimumVersion: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.MinimumVersion].AsString;
end;

procedure TDBXDataTypesTableStorage.SetMinimumVersion(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.MinimumVersion].AsString := Value;
end;

function TDBXDataTypesTableStorage.IsLiteralSupported: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsLiteralSupported].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetLiteralSupported(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsLiteralSupported].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.GetLiteralPrefix: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.LiteralPrefix].AsString;
end;

procedure TDBXDataTypesTableStorage.SetLiteralPrefix(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.LiteralPrefix].AsString := Value;
end;

function TDBXDataTypesTableStorage.GetLiteralSuffix: UnicodeString;
begin
  Result := Self.Value[TDBXDataTypesIndex.LiteralSuffix].AsString;
end;

procedure TDBXDataTypesTableStorage.SetLiteralSuffix(const Value: UnicodeString);
begin
  Self.Value[TDBXDataTypesIndex.LiteralSuffix].AsString := Value;
end;

function TDBXDataTypesTableStorage.IsUnicode: Boolean;
begin
  Result := Self.Value[TDBXDataTypesIndex.IsUnicode].AsBoolean;
end;

procedure TDBXDataTypesTableStorage.SetUnicode(const Value: Boolean);
begin
  Self.Value[TDBXDataTypesIndex.IsUnicode].AsBoolean := Value;
end;

function TDBXDataTypesTableStorage.GetProviderDbType: Integer;
begin
  Result := Self.Value[TDBXDataTypesIndex.ProviderDbType].AsInt32;
end;

procedure TDBXDataTypesTableStorage.SetProviderDbType(const Value: Integer);
begin
  Self.Value[TDBXDataTypesIndex.ProviderDbType].AsInt32 := Value;
end;

constructor TDBXForeignKeyColumnsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.ForeignKeyColumns;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateForeignKeyColumnsColumns;
end;

constructor TDBXForeignKeyColumnsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXForeignKeyColumnsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.CatalogName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.CatalogName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.SchemaName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.SchemaName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.TableName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.TableName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetForeignKeyName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.ForeignKeyName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetForeignKeyName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.ForeignKeyName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetColumnName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.ColumnName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetColumnName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.ColumnName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetPrimaryCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.PrimaryCatalogName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetPrimaryCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.PrimaryCatalogName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetPrimarySchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.PrimarySchemaName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetPrimarySchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.PrimarySchemaName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetPrimaryTableName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.PrimaryTableName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetPrimaryTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.PrimaryTableName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetPrimaryKeyName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.PrimaryKeyName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetPrimaryKeyName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.PrimaryKeyName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetPrimaryColumnName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.PrimaryColumnName].AsString;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetPrimaryColumnName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.PrimaryColumnName].AsString := Value;
end;

function TDBXForeignKeyColumnsTableStorage.GetColumnOrdinal: Integer;
begin
  Result := Self.Value[TDBXForeignKeyColumnsIndex.Ordinal].AsInt32;
end;

procedure TDBXForeignKeyColumnsTableStorage.SetColumnOrdinal(const Value: Integer);
begin
  Self.Value[TDBXForeignKeyColumnsIndex.Ordinal].AsInt32 := Value;
end;

constructor TDBXForeignKeysTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.ForeignKeys;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateForeignKeysColumns;
end;

constructor TDBXForeignKeysTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXForeignKeysTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeysIndex.CatalogName].AsString;
end;

procedure TDBXForeignKeysTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeysIndex.CatalogName].AsString := Value;
end;

function TDBXForeignKeysTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeysIndex.SchemaName].AsString;
end;

procedure TDBXForeignKeysTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeysIndex.SchemaName].AsString := Value;
end;

function TDBXForeignKeysTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeysIndex.TableName].AsString;
end;

procedure TDBXForeignKeysTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeysIndex.TableName].AsString := Value;
end;

function TDBXForeignKeysTableStorage.GetForeignKeyName: UnicodeString;
begin
  Result := Self.Value[TDBXForeignKeysIndex.ForeignKeyName].AsString;
end;

procedure TDBXForeignKeysTableStorage.SetForeignKeyName(const Value: UnicodeString);
begin
  Self.Value[TDBXForeignKeysIndex.ForeignKeyName].AsString := Value;
end;

constructor TDBXIndexColumnsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.IndexColumns;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateIndexColumnsColumns;
end;

constructor TDBXIndexColumnsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXIndexColumnsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.CatalogName].AsString;
end;

procedure TDBXIndexColumnsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexColumnsIndex.CatalogName].AsString := Value;
end;

function TDBXIndexColumnsTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.SchemaName].AsString;
end;

procedure TDBXIndexColumnsTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexColumnsIndex.SchemaName].AsString := Value;
end;

function TDBXIndexColumnsTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.TableName].AsString;
end;

procedure TDBXIndexColumnsTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexColumnsIndex.TableName].AsString := Value;
end;

function TDBXIndexColumnsTableStorage.GetIndexName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.IndexName].AsString;
end;

procedure TDBXIndexColumnsTableStorage.SetIndexName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexColumnsIndex.IndexName].AsString := Value;
end;

function TDBXIndexColumnsTableStorage.GetColumnName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.ColumnName].AsString;
end;

procedure TDBXIndexColumnsTableStorage.SetColumnName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexColumnsIndex.ColumnName].AsString := Value;
end;

function TDBXIndexColumnsTableStorage.GetColumnOrdinal: Integer;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.Ordinal].AsInt32;
end;

procedure TDBXIndexColumnsTableStorage.SetColumnOrdinal(const Value: Integer);
begin
  Self.Value[TDBXIndexColumnsIndex.Ordinal].AsInt32 := Value;
end;

function TDBXIndexColumnsTableStorage.IsAscending: Boolean;
begin
  Result := Self.Value[TDBXIndexColumnsIndex.IsAscending].AsBoolean;
end;

procedure TDBXIndexColumnsTableStorage.SetAscending(const Value: Boolean);
begin
  Self.Value[TDBXIndexColumnsIndex.IsAscending].AsBoolean := Value;
end;

constructor TDBXIndexesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Indexes;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateIndexesColumns;
end;

constructor TDBXIndexesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXIndexesTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexesIndex.CatalogName].AsString;
end;

procedure TDBXIndexesTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexesIndex.CatalogName].AsString := Value;
end;

function TDBXIndexesTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexesIndex.SchemaName].AsString;
end;

procedure TDBXIndexesTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexesIndex.SchemaName].AsString := Value;
end;

function TDBXIndexesTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexesIndex.TableName].AsString;
end;

procedure TDBXIndexesTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexesIndex.TableName].AsString := Value;
end;

function TDBXIndexesTableStorage.GetIndexName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexesIndex.IndexName].AsString;
end;

procedure TDBXIndexesTableStorage.SetIndexName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexesIndex.IndexName].AsString := Value;
end;

function TDBXIndexesTableStorage.GetConstraintName: UnicodeString;
begin
  Result := Self.Value[TDBXIndexesIndex.ConstraintName].AsString;
end;

procedure TDBXIndexesTableStorage.SetConstraintName(const Value: UnicodeString);
begin
  Self.Value[TDBXIndexesIndex.ConstraintName].AsString := Value;
end;

function TDBXIndexesTableStorage.IsPrimary: Boolean;
begin
  Result := Self.Value[TDBXIndexesIndex.IsPrimary].AsBoolean;
end;

procedure TDBXIndexesTableStorage.SetPrimary(const Value: Boolean);
begin
  Self.Value[TDBXIndexesIndex.IsPrimary].AsBoolean := Value;
end;

function TDBXIndexesTableStorage.IsUnique: Boolean;
begin
  Result := Self.Value[TDBXIndexesIndex.IsUnique].AsBoolean;
end;

procedure TDBXIndexesTableStorage.SetUnique(const Value: Boolean);
begin
  Self.Value[TDBXIndexesIndex.IsUnique].AsBoolean := Value;
end;

function TDBXIndexesTableStorage.IsAscending: Boolean;
begin
  Result := Self.Value[TDBXIndexesIndex.IsAscending].AsBoolean;
end;

procedure TDBXIndexesTableStorage.SetAscending(const Value: Boolean);
begin
  Self.Value[TDBXIndexesIndex.IsAscending].AsBoolean := Value;
end;

constructor TDBXPackageProcedureParametersTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.PackageProcedureParameters;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreatePackageProcedureParametersColumns;
end;

constructor TDBXPackageProcedureParametersTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXPackageProcedureParametersTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.CatalogName].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.CatalogName].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.SchemaName].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.SchemaName].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetPackageName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.PackageName].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetPackageName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.PackageName].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetProcedureName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.ProcedureName].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetProcedureName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.ProcedureName].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetParameterName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.ParameterName].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetParameterName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.ParameterName].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetParameterMode: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.ParameterMode].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetParameterMode(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.ParameterMode].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetTypeName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.TypeName].AsString;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetTypeName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.TypeName].AsString := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetPrecision: Integer;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.Precision].AsInt32;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetPrecision(const Value: Integer);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.Precision].AsInt32 := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetScale: Integer;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.Scale].AsInt32;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetScale(const Value: Integer);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.Scale].AsInt32 := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetColumnOrdinal: Integer;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.Ordinal].AsInt32;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetColumnOrdinal(const Value: Integer);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.Ordinal].AsInt32 := Value;
end;

function TDBXPackageProcedureParametersTableStorage.IsNullable: Boolean;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.IsNullable].AsBoolean;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetNullable(const Value: Boolean);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.IsNullable].AsBoolean := Value;
end;

function TDBXPackageProcedureParametersTableStorage.GetDbxDataType: Integer;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.DbxDataType].AsInt32;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetDbxDataType(const Value: Integer);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.DbxDataType].AsInt32 := Value;
end;

function TDBXPackageProcedureParametersTableStorage.IsFixedLength: Boolean;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.IsFixedLength].AsBoolean;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetFixedLength(const Value: Boolean);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.IsFixedLength].AsBoolean := Value;
end;

function TDBXPackageProcedureParametersTableStorage.IsUnicode: Boolean;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.IsUnicode].AsBoolean;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetUnicode(const Value: Boolean);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.IsUnicode].AsBoolean := Value;
end;

function TDBXPackageProcedureParametersTableStorage.IsLong: Boolean;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.IsLong].AsBoolean;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetLong(const Value: Boolean);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.IsLong].AsBoolean := Value;
end;

function TDBXPackageProcedureParametersTableStorage.IsUnsigned: Boolean;
begin
  Result := Self.Value[TDBXPackageProcedureParametersIndex.IsUnsigned].AsBoolean;
end;

procedure TDBXPackageProcedureParametersTableStorage.SetUnsigned(const Value: Boolean);
begin
  Self.Value[TDBXPackageProcedureParametersIndex.IsUnsigned].AsBoolean := Value;
end;

constructor TDBXPackageProceduresTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.PackageProcedures;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreatePackageProceduresColumns;
end;

constructor TDBXPackageProceduresTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXPackageProceduresTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProceduresIndex.CatalogName].AsString;
end;

procedure TDBXPackageProceduresTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProceduresIndex.CatalogName].AsString := Value;
end;

function TDBXPackageProceduresTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProceduresIndex.SchemaName].AsString;
end;

procedure TDBXPackageProceduresTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProceduresIndex.SchemaName].AsString := Value;
end;

function TDBXPackageProceduresTableStorage.GetPackageName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProceduresIndex.PackageName].AsString;
end;

procedure TDBXPackageProceduresTableStorage.SetPackageName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProceduresIndex.PackageName].AsString := Value;
end;

function TDBXPackageProceduresTableStorage.GetProcedureName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProceduresIndex.ProcedureName].AsString;
end;

procedure TDBXPackageProceduresTableStorage.SetProcedureName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProceduresIndex.ProcedureName].AsString := Value;
end;

function TDBXPackageProceduresTableStorage.GetProcedureType: UnicodeString;
begin
  Result := Self.Value[TDBXPackageProceduresIndex.ProcedureType].AsString;
end;

procedure TDBXPackageProceduresTableStorage.SetProcedureType(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageProceduresIndex.ProcedureType].AsString := Value;
end;

constructor TDBXPackageSourcesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.PackageSources;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreatePackageSourcesColumns;
end;

constructor TDBXPackageSourcesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXPackageSourcesTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageSourcesIndex.CatalogName].AsString;
end;

procedure TDBXPackageSourcesTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageSourcesIndex.CatalogName].AsString := Value;
end;

function TDBXPackageSourcesTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageSourcesIndex.SchemaName].AsString;
end;

procedure TDBXPackageSourcesTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageSourcesIndex.SchemaName].AsString := Value;
end;

function TDBXPackageSourcesTableStorage.GetPackageName: UnicodeString;
begin
  Result := Self.Value[TDBXPackageSourcesIndex.PackageName].AsString;
end;

procedure TDBXPackageSourcesTableStorage.SetPackageName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageSourcesIndex.PackageName].AsString := Value;
end;

function TDBXPackageSourcesTableStorage.GetDefinition: UnicodeString;
begin
  Result := Self.Value[TDBXPackageSourcesIndex.Definition].AsString;
end;

procedure TDBXPackageSourcesTableStorage.SetDefinition(const Value: UnicodeString);
begin
  Self.Value[TDBXPackageSourcesIndex.Definition].AsString := Value;
end;

constructor TDBXPackagesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Packages;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreatePackagesColumns;
end;

constructor TDBXPackagesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXPackagesTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXPackagesIndex.CatalogName].AsString;
end;

procedure TDBXPackagesTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackagesIndex.CatalogName].AsString := Value;
end;

function TDBXPackagesTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXPackagesIndex.SchemaName].AsString;
end;

procedure TDBXPackagesTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackagesIndex.SchemaName].AsString := Value;
end;

function TDBXPackagesTableStorage.GetPackageName: UnicodeString;
begin
  Result := Self.Value[TDBXPackagesIndex.PackageName].AsString;
end;

procedure TDBXPackagesTableStorage.SetPackageName(const Value: UnicodeString);
begin
  Self.Value[TDBXPackagesIndex.PackageName].AsString := Value;
end;

constructor TDBXProcedureParametersTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.ProcedureParameters;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateProcedureParametersColumns;
end;

constructor TDBXProcedureParametersTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXProcedureParametersTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.CatalogName].AsString;
end;

procedure TDBXProcedureParametersTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureParametersIndex.CatalogName].AsString := Value;
end;

function TDBXProcedureParametersTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.SchemaName].AsString;
end;

procedure TDBXProcedureParametersTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureParametersIndex.SchemaName].AsString := Value;
end;

function TDBXProcedureParametersTableStorage.GetProcedureName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.ProcedureName].AsString;
end;

procedure TDBXProcedureParametersTableStorage.SetProcedureName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureParametersIndex.ProcedureName].AsString := Value;
end;

function TDBXProcedureParametersTableStorage.GetParameterName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.ParameterName].AsString;
end;

procedure TDBXProcedureParametersTableStorage.SetParameterName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureParametersIndex.ParameterName].AsString := Value;
end;

function TDBXProcedureParametersTableStorage.GetParameterMode: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.ParameterMode].AsString;
end;

procedure TDBXProcedureParametersTableStorage.SetParameterMode(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureParametersIndex.ParameterMode].AsString := Value;
end;

function TDBXProcedureParametersTableStorage.GetTypeName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.TypeName].AsString;
end;

procedure TDBXProcedureParametersTableStorage.SetTypeName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureParametersIndex.TypeName].AsString := Value;
end;

function TDBXProcedureParametersTableStorage.GetPrecision: Integer;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.Precision].AsInt32;
end;

procedure TDBXProcedureParametersTableStorage.SetPrecision(const Value: Integer);
begin
  Self.Value[TDBXProcedureParametersIndex.Precision].AsInt32 := Value;
end;

function TDBXProcedureParametersTableStorage.GetScale: Integer;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.Scale].AsInt32;
end;

procedure TDBXProcedureParametersTableStorage.SetScale(const Value: Integer);
begin
  Self.Value[TDBXProcedureParametersIndex.Scale].AsInt32 := Value;
end;

function TDBXProcedureParametersTableStorage.GetColumnOrdinal: Integer;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.Ordinal].AsInt32;
end;

procedure TDBXProcedureParametersTableStorage.SetColumnOrdinal(const Value: Integer);
begin
  Self.Value[TDBXProcedureParametersIndex.Ordinal].AsInt32 := Value;
end;

function TDBXProcedureParametersTableStorage.IsNullable: Boolean;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.IsNullable].AsBoolean;
end;

procedure TDBXProcedureParametersTableStorage.SetNullable(const Value: Boolean);
begin
  Self.Value[TDBXProcedureParametersIndex.IsNullable].AsBoolean := Value;
end;

function TDBXProcedureParametersTableStorage.GetDbxDataType: Integer;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.DbxDataType].AsInt32;
end;

procedure TDBXProcedureParametersTableStorage.SetDbxDataType(const Value: Integer);
begin
  Self.Value[TDBXProcedureParametersIndex.DbxDataType].AsInt32 := Value;
end;

function TDBXProcedureParametersTableStorage.IsFixedLength: Boolean;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.IsFixedLength].AsBoolean;
end;

procedure TDBXProcedureParametersTableStorage.SetFixedLength(const Value: Boolean);
begin
  Self.Value[TDBXProcedureParametersIndex.IsFixedLength].AsBoolean := Value;
end;

function TDBXProcedureParametersTableStorage.IsUnicode: Boolean;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.IsUnicode].AsBoolean;
end;

procedure TDBXProcedureParametersTableStorage.SetUnicode(const Value: Boolean);
begin
  Self.Value[TDBXProcedureParametersIndex.IsUnicode].AsBoolean := Value;
end;

function TDBXProcedureParametersTableStorage.IsLong: Boolean;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.IsLong].AsBoolean;
end;

procedure TDBXProcedureParametersTableStorage.SetLong(const Value: Boolean);
begin
  Self.Value[TDBXProcedureParametersIndex.IsLong].AsBoolean := Value;
end;

function TDBXProcedureParametersTableStorage.IsUnsigned: Boolean;
begin
  Result := Self.Value[TDBXProcedureParametersIndex.IsUnsigned].AsBoolean;
end;

procedure TDBXProcedureParametersTableStorage.SetUnsigned(const Value: Boolean);
begin
  Self.Value[TDBXProcedureParametersIndex.IsUnsigned].AsBoolean := Value;
end;

constructor TDBXProcedureSourcesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.ProcedureSources;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateProcedureSourcesColumns;
end;

constructor TDBXProcedureSourcesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXProcedureSourcesTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureSourcesIndex.CatalogName].AsString;
end;

procedure TDBXProcedureSourcesTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureSourcesIndex.CatalogName].AsString := Value;
end;

function TDBXProcedureSourcesTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureSourcesIndex.SchemaName].AsString;
end;

procedure TDBXProcedureSourcesTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureSourcesIndex.SchemaName].AsString := Value;
end;

function TDBXProcedureSourcesTableStorage.GetProcedureName: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureSourcesIndex.ProcedureName].AsString;
end;

procedure TDBXProcedureSourcesTableStorage.SetProcedureName(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureSourcesIndex.ProcedureName].AsString := Value;
end;

function TDBXProcedureSourcesTableStorage.GetProcedureType: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureSourcesIndex.ProcedureType].AsString;
end;

procedure TDBXProcedureSourcesTableStorage.SetProcedureType(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureSourcesIndex.ProcedureType].AsString := Value;
end;

function TDBXProcedureSourcesTableStorage.GetDefinition: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureSourcesIndex.Definition].AsString;
end;

procedure TDBXProcedureSourcesTableStorage.SetDefinition(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureSourcesIndex.Definition].AsString := Value;
end;

function TDBXProcedureSourcesTableStorage.GetExternalDefinition: UnicodeString;
begin
  Result := Self.Value[TDBXProcedureSourcesIndex.ExternalDefinition].AsString;
end;

procedure TDBXProcedureSourcesTableStorage.SetExternalDefinition(const Value: UnicodeString);
begin
  Self.Value[TDBXProcedureSourcesIndex.ExternalDefinition].AsString := Value;
end;

constructor TDBXProceduresTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Procedures;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateProceduresColumns;
end;

constructor TDBXProceduresTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXProceduresTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXProceduresIndex.CatalogName].AsString;
end;

procedure TDBXProceduresTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXProceduresIndex.CatalogName].AsString := Value;
end;

function TDBXProceduresTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXProceduresIndex.SchemaName].AsString;
end;

procedure TDBXProceduresTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXProceduresIndex.SchemaName].AsString := Value;
end;

function TDBXProceduresTableStorage.GetProcedureName: UnicodeString;
begin
  Result := Self.Value[TDBXProceduresIndex.ProcedureName].AsString;
end;

procedure TDBXProceduresTableStorage.SetProcedureName(const Value: UnicodeString);
begin
  Self.Value[TDBXProceduresIndex.ProcedureName].AsString := Value;
end;

function TDBXProceduresTableStorage.GetProcedureType: UnicodeString;
begin
  Result := Self.Value[TDBXProceduresIndex.ProcedureType].AsString;
end;

procedure TDBXProceduresTableStorage.SetProcedureType(const Value: UnicodeString);
begin
  Self.Value[TDBXProceduresIndex.ProcedureType].AsString := Value;
end;

constructor TDBXReservedWordsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.ReservedWords;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateReservedWordsColumns;
end;

constructor TDBXReservedWordsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXReservedWordsTableStorage.GetReservedWord: UnicodeString;
begin
  Result := Self.Value[TDBXReservedWordsIndex.ReservedWord].AsString;
end;

procedure TDBXReservedWordsTableStorage.SetReservedWord(const Value: UnicodeString);
begin
  Self.Value[TDBXReservedWordsIndex.ReservedWord].AsString := Value;
end;

constructor TDBXRolesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Roles;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateRolesColumns;
end;

constructor TDBXRolesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXRolesTableStorage.GetRoleName: UnicodeString;
begin
  Result := Self.Value[TDBXRolesIndex.RoleName].AsString;
end;

procedure TDBXRolesTableStorage.SetRoleName(const Value: UnicodeString);
begin
  Self.Value[TDBXRolesIndex.RoleName].AsString := Value;
end;

constructor TDBXSchemasTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Schemas;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateSchemasColumns;
end;

constructor TDBXSchemasTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXSchemasTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXSchemasIndex.CatalogName].AsString;
end;

procedure TDBXSchemasTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXSchemasIndex.CatalogName].AsString := Value;
end;

function TDBXSchemasTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXSchemasIndex.SchemaName].AsString;
end;

procedure TDBXSchemasTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXSchemasIndex.SchemaName].AsString := Value;
end;

constructor TDBXSynonymsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Synonyms;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateSynonymsColumns;
end;

constructor TDBXSynonymsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXSynonymsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXSynonymsIndex.CatalogName].AsString;
end;

procedure TDBXSynonymsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXSynonymsIndex.CatalogName].AsString := Value;
end;

function TDBXSynonymsTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXSynonymsIndex.SchemaName].AsString;
end;

procedure TDBXSynonymsTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXSynonymsIndex.SchemaName].AsString := Value;
end;

function TDBXSynonymsTableStorage.GetSynonymName: UnicodeString;
begin
  Result := Self.Value[TDBXSynonymsIndex.SynonymName].AsString;
end;

procedure TDBXSynonymsTableStorage.SetSynonymName(const Value: UnicodeString);
begin
  Self.Value[TDBXSynonymsIndex.SynonymName].AsString := Value;
end;

function TDBXSynonymsTableStorage.GetTableCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXSynonymsIndex.TableCatalogName].AsString;
end;

procedure TDBXSynonymsTableStorage.SetTableCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXSynonymsIndex.TableCatalogName].AsString := Value;
end;

function TDBXSynonymsTableStorage.GetTableSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXSynonymsIndex.TableSchemaName].AsString;
end;

procedure TDBXSynonymsTableStorage.SetTableSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXSynonymsIndex.TableSchemaName].AsString := Value;
end;

function TDBXSynonymsTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXSynonymsIndex.TableName].AsString;
end;

procedure TDBXSynonymsTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXSynonymsIndex.TableName].AsString := Value;
end;

constructor TDBXTablesTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Tables;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateTablesColumns;
end;

constructor TDBXTablesTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXTablesTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXTablesIndex.CatalogName].AsString;
end;

procedure TDBXTablesTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXTablesIndex.CatalogName].AsString := Value;
end;

function TDBXTablesTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXTablesIndex.SchemaName].AsString;
end;

procedure TDBXTablesTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXTablesIndex.SchemaName].AsString := Value;
end;

function TDBXTablesTableStorage.GetTableName: UnicodeString;
begin
  Result := Self.Value[TDBXTablesIndex.TableName].AsString;
end;

procedure TDBXTablesTableStorage.SetTableName(const Value: UnicodeString);
begin
  Self.Value[TDBXTablesIndex.TableName].AsString := Value;
end;

function TDBXTablesTableStorage.GetTableType: UnicodeString;
begin
  Result := Self.Value[TDBXTablesIndex.TableType].AsString;
end;

procedure TDBXTablesTableStorage.SetTableType(const Value: UnicodeString);
begin
  Self.Value[TDBXTablesIndex.TableType].AsString := Value;
end;

constructor TDBXUsersTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Users;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateUsersColumns;
end;

constructor TDBXUsersTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXUsersTableStorage.GetUserName: UnicodeString;
begin
  Result := Self.Value[TDBXUsersIndex.UserName].AsString;
end;

procedure TDBXUsersTableStorage.SetUserName(const Value: UnicodeString);
begin
  Self.Value[TDBXUsersIndex.UserName].AsString := Value;
end;

constructor TDBXViewsTableStorage.Create;
var
  TableStore: TDBXTable;
begin
  inherited Create;
  TableStore := TDBXTableFactory.CreateDBXTable;
  TableStore.DBXTableName := TDBXMetaDataCollectionName.Views;
  Table := TableStore;
  Columns := TDBXMetaDataCollectionColumns.CreateViewsColumns;
end;

constructor TDBXViewsTableStorage.Create(const TableStore: TDBXTable);
begin
  inherited Create;
  Table := TableStore;
end;

function TDBXViewsTableStorage.GetCatalogName: UnicodeString;
begin
  Result := Self.Value[TDBXViewsIndex.CatalogName].AsString;
end;

procedure TDBXViewsTableStorage.SetCatalogName(const Value: UnicodeString);
begin
  Self.Value[TDBXViewsIndex.CatalogName].AsString := Value;
end;

function TDBXViewsTableStorage.GetSchemaName: UnicodeString;
begin
  Result := Self.Value[TDBXViewsIndex.SchemaName].AsString;
end;

procedure TDBXViewsTableStorage.SetSchemaName(const Value: UnicodeString);
begin
  Self.Value[TDBXViewsIndex.SchemaName].AsString := Value;
end;

function TDBXViewsTableStorage.GetViewName: UnicodeString;
begin
  Result := Self.Value[TDBXViewsIndex.ViewName].AsString;
end;

procedure TDBXViewsTableStorage.SetViewName(const Value: UnicodeString);
begin
  Self.Value[TDBXViewsIndex.ViewName].AsString := Value;
end;

function TDBXViewsTableStorage.GetDefinition: UnicodeString;
begin
  Result := Self.Value[TDBXViewsIndex.Definition].AsString;
end;

procedure TDBXViewsTableStorage.SetDefinition(const Value: UnicodeString);
begin
  Self.Value[TDBXViewsIndex.Definition].AsString := Value;
end;

end.
