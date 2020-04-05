{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMetaDataProvider;

interface

uses
  Data.DBXCommonTable,
  Data.DBXMetaDataReader,
  Data.DBXMetaDataWriter,
  Data.DBXTypedTableStorage;

type
  TDBXMetaDataColumn = class;
  TDBXMetaDataTable = class;
  TDBXSqlExecution = class;
  TDBXMetaDataColumnArray = array of TDBXMetaDataColumn;

  TDBXMetaDataColumn = class
  public
    constructor Create; overload;
    constructor Create(const Column: TDBXMetaDataColumn); overload;
    procedure CopyColumnToTableStorage(const Columns: TDBXColumnsTableStorage);
  private
    FColumnName: UnicodeString;
    FDefaultValue: UnicodeString;
    FDataType: Integer;
    FPrecision: Integer;
    FScale: Integer;
    FMaxInline: Integer;
    FUnsigned: Boolean;
    FAutoIncrement: Boolean;
    FNullable: Boolean;
    FFixedLength: Boolean;
    FUnicodeString: Boolean;
    FBlob: Boolean;
  public
    property AutoIncrement: Boolean read FAutoIncrement write FAutoIncrement;
    property ColumnName: UnicodeString read FColumnName write FColumnName;
    property DefaultValue: UnicodeString read FDefaultValue write FDefaultValue;
    property FixedLength: Boolean read FFixedLength write FFixedLength;
    property MaxInline: Integer read FMaxInline write FMaxInline;
    property Nullable: Boolean read FNullable write FNullable;
    property Long: Boolean read FBlob write FBlob;
    property Precision: Integer read FPrecision write FPrecision;
    property Scale: Integer read FScale write FScale;
    property DataType: Integer read FDataType write FDataType;
    property UnicodeString: Boolean read FUnicodeString;
    property UnicodeChar: Boolean write FUnicodeString;
    property Unsigned: Boolean read FUnsigned write FUnsigned;
  end;

  TDBXInt8Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXInt64Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXInt32Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXInt16Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXDoubleColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXDecimalColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString; const InPrecision: Integer; const InScale: Integer);
  end;

  TDBXDateColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXBooleanColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXBinaryLongColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString);
  end;

  TDBXBinaryColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString; const InPrecision: Integer);
  end;

  TDBXAnsiVarCharColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString; const InPrecision: Integer);
  end;

  TDBXAnsiLongColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString);
  end;

  TDBXAnsiCharColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString; const InPrecision: Integer);
  end;

  TDBXMetaDataForeignKey = class
  public
    constructor Create; overload;
    destructor Destroy; override;
    constructor Create(const InForeignTableName: UnicodeString; const InPrimaryTableName: UnicodeString; const InForeignKeyName: UnicodeString; References: array of UnicodeString); overload;
    procedure AddReference(const ColumnName: UnicodeString; const ColumnNameInPrimaryTable: UnicodeString);
  protected
    function GetForeignKeyColumnsStorage: TDBXForeignKeyColumnsTableStorage;
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const CatalogName: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const SchemaName: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const TableName: UnicodeString);
    function GetForeignKeyName: UnicodeString;
    procedure SetForeignKeyName(const ForeignKeyName: UnicodeString);
  private
    FForeignkey: TDBXForeignKeysTableStorage;
    FColumns: TDBXForeignKeyColumnsTableStorage;
    FPrimaryCatalogName: UnicodeString;
    FPrimarySchemaName: UnicodeString;
    FPrimaryTableName: UnicodeString;
    FColumnCount: Integer;
  public
    property ForeignKeysStorage: TDBXForeignKeysTableStorage read FForeignkey;
    property ForeignKeyColumnsStorage: TDBXForeignKeyColumnsTableStorage read GetForeignKeyColumnsStorage;
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property ForeignKeyName: UnicodeString read GetForeignKeyName write SetForeignKeyName;
    property PrimaryCatalogName: UnicodeString read FPrimaryCatalogName write FPrimaryCatalogName;
    property PrimarySchemaName: UnicodeString read FPrimarySchemaName write FPrimarySchemaName;
    property PrimaryTableName: UnicodeString read FPrimaryTableName write FPrimaryTableName;
  end;

  TDBXMetaDataIndex = class
  public
    constructor Create; overload;
    destructor Destroy; override;
    constructor Create(const InTableName: UnicodeString; const InIndexName: UnicodeString; Columns: array of UnicodeString); overload;
    procedure AddColumn(const ColumnName: UnicodeString); overload;
    procedure AddColumn(const ColumnName: UnicodeString; const Ascending: Boolean); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const CatalogName: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const SchemaName: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const TableName: UnicodeString);
    function GetIndexName: UnicodeString;
    procedure SetIndexName(const IndexName: UnicodeString);
    function IsUnique: Boolean;
    procedure SetUnique(const Unique: Boolean);
  private
    FIndexes: TDBXIndexesTableStorage;
    FColumns: TDBXIndexColumnsTableStorage;
    FColumnCount: Integer;
  public
    property IndexesStorage: TDBXIndexesTableStorage read FIndexes;
    property IndexColumnsStorage: TDBXIndexColumnsTableStorage read FColumns;
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
    property IndexName: UnicodeString read GetIndexName write SetIndexName;
    property Unique: Boolean read IsUnique write SetUnique;
  end;

  TDBXMetaDataProvider = class
  public
    constructor Create;
    destructor Destroy; override;
    function CheckColumnSupported(const Column: TDBXMetaDataColumn): Boolean;
    procedure Execute(const Sql: UnicodeString);
    procedure CreateTable(const Table: TDBXMetaDataTable);
    function DropTable(const SchemaName: UnicodeString; const TableName: UnicodeString): Boolean; overload;
    function DropTable(const TableName: UnicodeString): Boolean; overload;
    procedure CreatePrimaryKey(const Index: TDBXMetaDataIndex);
    procedure CreateUniqueIndex(const Index: TDBXMetaDataIndex);
    procedure CreateIndex(const Index: TDBXMetaDataIndex);
    function DropIndex(const TableName: UnicodeString; const IndexName: UnicodeString): Boolean; overload;
    function DropIndex(const SchemaName: UnicodeString; const TableName: UnicodeString; const IndexName: UnicodeString): Boolean; overload;
    procedure CreateForeignKey(const Foreignkey: TDBXMetaDataForeignKey);
    function DropForeignKey(const TableName: UnicodeString; const ForeignKey: UnicodeString): Boolean; overload;
    function DropForeignKey(const SchemaName: UnicodeString; const TableName: UnicodeString; const ForeignKey: UnicodeString): Boolean; overload;
    function QuoteIdentifierIfNeeded(const Identifier: UnicodeString): UnicodeString;
    function GetCollection(const MetaDataCommand: UnicodeString): TDBXTable;
    procedure ToMemoryStorage(const Table: TDBXDelegateTable);
    function MakeCreateTableSql(const Table: TDBXTablesTableStorage; const Columns: TDBXColumnsTableStorage): UnicodeString;
    function MakeAlterTableSql(const Table: TDBXTablesTableStorage; const Columns: TDBXColumnsTableStorage): UnicodeString; overload;
    function MakeDropTableSql(const Table: TDBXTablesTableStorage): UnicodeString;
    function MakeCreateIndexSql(const Indexes: TDBXIndexesTableStorage; const Columns: TDBXIndexColumnsTableStorage): UnicodeString;
    function MakeDropIndexSql(const Indexes: TDBXIndexesTableStorage): UnicodeString;
    function MakeCreateForeignKeySql(const ForeignKeys: TDBXForeignKeysTableStorage; const Columns: TDBXForeignKeyColumnsTableStorage): UnicodeString;
    function MakeDropForeignKeySql(const ForeignKey: TDBXForeignKeysTableStorage): UnicodeString;
    function MakeAlterTableSql(const Indexes: TDBXIndexesTableStorage; const Columns: TDBXIndexColumnsTableStorage): UnicodeString; overload;
    function IsCatalogsSupported: Boolean;
    function IsSchemasSupported: Boolean;
    function IsMultipleStatementsSupported: Boolean;
    function IsDescendingIndexSupported: Boolean;
    function IsDescendingIndexColumnsSupported: Boolean;
    function IsMixedDDLAndDMLSupported: Boolean;
    function IsDDLTransactionsSupported: Boolean;
  protected
    procedure SetWriter(const Writer: TDBXMetaDataWriter); virtual;
    function GetWriter: TDBXMetaDataWriter; virtual;
    function GetVendor: UnicodeString;
    function GetDatabaseProduct: UnicodeString;
    function GetDatabaseVersion: UnicodeString;
    function GetIdentifierQuotePrefix: UnicodeString;
    function GetIdentifierQuoteSuffix: UnicodeString;
  private
    FWriter: TDBXMetaDataWriter;
    FExecuter: TDBXSqlExecution;
  public
    property Vendor: UnicodeString read GetVendor;
    property DatabaseProduct: UnicodeString read GetDatabaseProduct;
    property DatabaseVersion: UnicodeString read GetDatabaseVersion;
    property IdentifierQuotePrefix: UnicodeString read GetIdentifierQuotePrefix;
    property IdentifierQuoteSuffix: UnicodeString read GetIdentifierQuoteSuffix;
  protected
    property Writer: TDBXMetaDataWriter read GetWriter write SetWriter;
  end;

  TDBXMetaDataTable = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddColumn(const Column: TDBXMetaDataColumn);
    function GetColumn(const Ordinal: Integer): TDBXMetaDataColumn;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const CatalogName: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const SchemaName: UnicodeString);
    function GetTableName: UnicodeString;
    procedure SetTableName(const TableName: UnicodeString);
  private
    FTable: TDBXTablesTableStorage;
    FColumns: TDBXColumnsTableStorage;
    FColumnCount: Integer;
    FMetaDataColumns: TDBXMetaDataColumnArray;
  public
    property TableStorage: TDBXTablesTableStorage read FTable;
    property ColumnsStorage: TDBXColumnsTableStorage read FColumns;
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property TableName: UnicodeString read GetTableName write SetTableName;
  end;

  TDBXObjectColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXProductNames = class
  public
    const DatasnapProduct = 'Datasnap';
    const Db2_Product = 'Db2';
    const FirebirdProduct = 'Firebird';
    const InformixProduct = 'Informix Dynamic Server';
    const InterbaseProduct = 'InterBase';
    const MsSqlProduct = 'Microsoft SQL Server';
    const MySqlProduct = 'MySQL';
    const OracleProduct = 'Oracle';
    const SybaseAsaProduct = 'Adaptive Server Anywhere';
    const SybaseAseProduct = 'Sybase SQL Server';
  end;

  TDBXSingleColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXSqlExecution = class
  public
    constructor Create(const Writer: TDBXMetaDataWriter);
    procedure Execute(const Sql: UnicodeString); virtual;
  private
    FContext: TDBXProviderContext;
  end;

  TDBXTimeColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXTimestampColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXUInt16Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXUInt32Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXUInt64Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXUInt8Column = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString);
  end;

  TDBXUnicodeCharColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString; const InPrecision: Integer);
  end;

  TDBXUnicodeLongColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString);
  end;

  TDBXUnicodeVarCharColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString; const InPrecision: Integer);
  end;

  TDBXVarBinaryColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const InName: UnicodeString; const InPrecision: Integer);
  end;

  TDBXWideVarCharColumn = class(TDBXMetaDataColumn)
  public
    constructor Create(const Name: UnicodeString; const InPrecision: Integer);
  end;

implementation

uses
  Data.DBXCommon,
  Data.DBXPlatform,
  Data.DBXMetaDataNames,
  Data.DBXTableFactory,
  System.SysUtils;

constructor TDBXMetaDataColumn.Create;
begin
  inherited Create;
  FNullable := True;
end;

constructor TDBXMetaDataColumn.Create(const Column: TDBXMetaDataColumn);
begin
  inherited Create;
  self.FColumnName := Column.FColumnName;
  self.FDefaultValue := Column.FDefaultValue;
  self.FDataType := Column.FDataType;
  self.FPrecision := Column.FPrecision;
  self.FScale := Column.FScale;
  self.FMaxInline := Column.FMaxInline;
  self.FUnsigned := Column.FUnsigned;
  self.FAutoIncrement := Column.FAutoIncrement;
  self.FNullable := Column.FNullable;
  self.FFixedLength := Column.FFixedLength;
  self.FUnicodeString := Column.FUnicodeString;
  self.FBlob := Column.FBlob;
end;

procedure TDBXMetaDataColumn.CopyColumnToTableStorage(const Columns: TDBXColumnsTableStorage);
begin
  Columns.ColumnName := FColumnName;
  Columns.Precision := FPrecision;
  Columns.Scale := FScale;
  Columns.DefaultValue := FDefaultValue;
  Columns.Long := FBlob;
  Columns.Nullable := FNullable;
  Columns.AutoIncrement := FAutoIncrement;
  Columns.MaxInline := FMaxInline;
  Columns.DbxDataType := FDataType;
  Columns.FixedLength := FFixedLength;
  Columns.Unicode := FUnicodeString;
  Columns.Unsigned := FUnsigned;
end;

constructor TDBXInt8Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.Int8Type;
  ColumnName := InName;
end;

constructor TDBXInt64Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.Int64Type;
  ColumnName := InName;
end;

constructor TDBXInt32Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.Int32Type;
  ColumnName := InName;
end;

constructor TDBXInt16Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.Int16Type;
  ColumnName := InName;
end;

constructor TDBXDoubleColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.DoubleType;
  ColumnName := InName;
end;

constructor TDBXDecimalColumn.Create(const InName: UnicodeString; const InPrecision: Integer; const InScale: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.BcdType;
  ColumnName := InName;
  Precision := InPrecision;
  Scale := InScale;
end;

constructor TDBXDateColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.DateType;
  ColumnName := InName;
end;

constructor TDBXBooleanColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.BooleanType;
  ColumnName := InName;
end;

constructor TDBXBinaryLongColumn.Create(const Name: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.BlobType;
  Long := True;
  ColumnName := Name;
  Precision := 80000;
end;

constructor TDBXBinaryColumn.Create(const InName: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.BytesType;
  FixedLength := True;
  ColumnName := InName;
  Precision := InPrecision;
  FixedLength := True;
end;

constructor TDBXAnsiVarCharColumn.Create(const Name: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.AnsiStringType;
  Long := False;
  FixedLength := False;
  ColumnName := Name;
  Precision := InPrecision;
end;

constructor TDBXAnsiLongColumn.Create(const Name: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.AnsiStringType;
  Long := True;
  ColumnName := Name;
  Precision := 80000;
end;

constructor TDBXAnsiCharColumn.Create(const Name: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.AnsiStringType;
  Long := False;
  FixedLength := True;
  ColumnName := Name;
  Precision := InPrecision;
end;

constructor TDBXMetaDataForeignKey.Create;
begin
  inherited Create;
  FForeignkey := TDBXForeignKeysTableStorage.Create;
  FColumns := TDBXForeignKeyColumnsTableStorage.Create;
  FForeignkey.Insert;
  FForeignkey.Post;
end;

destructor TDBXMetaDataForeignKey.Destroy;
begin
  FreeAndNil(FForeignkey);
  FreeAndNil(FColumns);
  inherited Destroy;
end;

constructor TDBXMetaDataForeignKey.Create(const InForeignTableName: UnicodeString; const InPrimaryTableName: UnicodeString; const InForeignKeyName: UnicodeString; References: array of UnicodeString);
var
  Index: Integer;
begin
  Create;
  TableName := InForeignTableName;
  PrimaryTableName := InPrimaryTableName;
  ForeignKeyName := InForeignKeyName;
  Index := 0;
  while Index < Length(References) do
  begin
    AddReference(References[Index], References[Index + 1]);
    Index := Index + 2;
  end;
end;

function TDBXMetaDataForeignKey.GetForeignKeyColumnsStorage: TDBXForeignKeyColumnsTableStorage;
begin
  FColumns.First;
  while FColumns.InBounds do
  begin
    FColumns.PrimaryCatalogName := FPrimaryCatalogName;
    FColumns.PrimarySchemaName := FPrimarySchemaName;
    FColumns.PrimaryTableName := FPrimaryTableName;
    FColumns.Next;
  end;
  Result := FColumns;
end;

function TDBXMetaDataForeignKey.GetCatalogName: UnicodeString;
begin
  Result := FForeignkey.CatalogName;
end;

procedure TDBXMetaDataForeignKey.SetCatalogName(const CatalogName: UnicodeString);
begin
  FForeignkey.CatalogName := CatalogName;
end;

function TDBXMetaDataForeignKey.GetSchemaName: UnicodeString;
begin
  Result := FForeignkey.SchemaName;
end;

procedure TDBXMetaDataForeignKey.SetSchemaName(const SchemaName: UnicodeString);
begin
  FForeignkey.SchemaName := SchemaName;
end;

function TDBXMetaDataForeignKey.GetTableName: UnicodeString;
begin
  Result := FForeignkey.TableName;
end;

procedure TDBXMetaDataForeignKey.SetTableName(const TableName: UnicodeString);
begin
  FForeignkey.TableName := TableName;
end;

function TDBXMetaDataForeignKey.GetForeignKeyName: UnicodeString;
begin
  Result := FForeignkey.ForeignKeyName;
end;

procedure TDBXMetaDataForeignKey.SetForeignKeyName(const ForeignKeyName: UnicodeString);
begin
  FForeignkey.ForeignKeyName := ForeignKeyName;
end;

procedure TDBXMetaDataForeignKey.AddReference(const ColumnName: UnicodeString; const ColumnNameInPrimaryTable: UnicodeString);
begin
  IncrAfter(FColumnCount);
  FColumns.Insert;
  FColumns.ColumnOrdinal := FColumnCount;
  FColumns.ColumnName := ColumnName;
  FColumns.PrimaryColumnName := ColumnNameInPrimaryTable;
  FColumns.Post;
end;

constructor TDBXMetaDataIndex.Create;
begin
  inherited Create;
  FIndexes := TDBXIndexesTableStorage.Create;
  FColumns := TDBXIndexColumnsTableStorage.Create;
  FIndexes.Insert;
  FIndexes.Post;
end;

destructor TDBXMetaDataIndex.Destroy;
begin
  FreeAndNil(FIndexes);
  FreeAndNil(FColumns);
  inherited Destroy;
end;

constructor TDBXMetaDataIndex.Create(const InTableName: UnicodeString; const InIndexName: UnicodeString; Columns: array of UnicodeString);
var
  Index: Integer;
begin
  Create;
  TableName := InTableName;
  IndexName := InIndexName;
  for Index := 0 to Length(Columns) - 1 do
    AddColumn(Columns[Index]);
end;

function TDBXMetaDataIndex.GetCatalogName: UnicodeString;
begin
  Result := FIndexes.CatalogName;
end;

procedure TDBXMetaDataIndex.SetCatalogName(const CatalogName: UnicodeString);
begin
  FIndexes.CatalogName := CatalogName;
end;

function TDBXMetaDataIndex.GetSchemaName: UnicodeString;
begin
  Result := FIndexes.SchemaName;
end;

procedure TDBXMetaDataIndex.SetSchemaName(const SchemaName: UnicodeString);
begin
  FIndexes.SchemaName := SchemaName;
end;

function TDBXMetaDataIndex.GetTableName: UnicodeString;
begin
  Result := FIndexes.TableName;
end;

procedure TDBXMetaDataIndex.SetTableName(const TableName: UnicodeString);
begin
  FIndexes.TableName := TableName;
end;

function TDBXMetaDataIndex.GetIndexName: UnicodeString;
begin
  Result := FIndexes.IndexName;
end;

procedure TDBXMetaDataIndex.SetIndexName(const IndexName: UnicodeString);
begin
  FIndexes.IndexName := IndexName;
end;

function TDBXMetaDataIndex.IsUnique: Boolean;
begin
  Result := FIndexes.Unique;
end;

procedure TDBXMetaDataIndex.SetUnique(const Unique: Boolean);
begin
  FIndexes.Unique := Unique;
end;

procedure TDBXMetaDataIndex.AddColumn(const ColumnName: UnicodeString);
begin
  AddColumn(ColumnName, True);
end;

procedure TDBXMetaDataIndex.AddColumn(const ColumnName: UnicodeString; const Ascending: Boolean);
begin
  IncrAfter(FColumnCount);
  FColumns.Insert;
  FColumns.ColumnOrdinal := FColumnCount;
  FColumns.ColumnName := ColumnName;
  FColumns.Ascending := Ascending;
  FColumns.Post;
end;

constructor TDBXMetaDataProvider.Create;
begin
  inherited Create;
end;

destructor TDBXMetaDataProvider.Destroy;
begin
  FreeAndNil(FExecuter);
  FreeAndNil(FWriter);
  inherited Destroy;
end;

procedure TDBXMetaDataProvider.SetWriter(const Writer: TDBXMetaDataWriter);
begin
  self.FWriter := Writer;
  self.FExecuter := TDBXSqlExecution.Create(Writer);
end;

function TDBXMetaDataProvider.GetWriter: TDBXMetaDataWriter;
begin
  Result := self.FWriter;
end;

function TDBXMetaDataProvider.GetVendor: UnicodeString;
begin
  Result := FWriter.MetaDataReader.ProductName;
end;

function TDBXMetaDataProvider.CheckColumnSupported(const Column: TDBXMetaDataColumn): Boolean;
var
  Storage: TDBXColumnsTableStorage;
  Supported: Boolean;
begin
  Storage := TDBXColumnsTableStorage.Create;
  try
    Storage.Insert;
    Column.CopyColumnToTableStorage(Storage);
    Storage.Post;
    Supported := FWriter.CheckColumnSupported(Storage);
  finally
    FreeAndNil(Storage);
  end;
  Result := Supported;
end;

procedure TDBXMetaDataProvider.Execute(const Sql: UnicodeString);
begin
  FExecuter.Execute(Sql);
end;

procedure TDBXMetaDataProvider.CreateTable(const Table: TDBXMetaDataTable);
var
  Sql: UnicodeString;
begin
  Sql := MakeCreateTableSql(Table.TableStorage, Table.ColumnsStorage);
  FExecuter.Execute(Sql);
end;

function TDBXMetaDataProvider.DropTable(const SchemaName: UnicodeString; const TableName: UnicodeString): Boolean;
var
  Storage: TDBXTable;
  Builder: TDBXStringBuffer;
  Success: Boolean;
  Tables: TDBXTablesTableStorage;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    Success := False;
    Builder.Append('GetTables ');
    if not StringIsNil(SchemaName) then
    begin
      FWriter.MakeSqlIdentifier(Builder, SchemaName);
      Builder.Append('.');
    end;
    FWriter.MakeSqlIdentifier(Builder, TableName);
    Storage := GetCollection(Builder.ToString);
    try
      Tables := TDBXTablesTableStorage(Storage);
      ToMemoryStorage(Tables);
      if Tables.First and not Tables.Next then
      begin
        if Tables.First then
        begin
          Sql := MakeDropTableSql(Tables);
          Execute(Sql);
          Success := True;
        end;
      end;
      Result := Success;
    finally
      Storage.Free;
    end;
  finally
    Builder.Free;
  end;
end;

function TDBXMetaDataProvider.DropTable(const TableName: UnicodeString): Boolean;
begin
  Result := DropTable(NullString, TableName);
end;

procedure TDBXMetaDataProvider.CreatePrimaryKey(const Index: TDBXMetaDataIndex);
var
  Indexes: TDBXIndexesTableStorage;
begin
  Index.Unique := True;
  Indexes := Index.IndexesStorage;
  Indexes.Primary := True;
  CreateIndex(Index);
end;

procedure TDBXMetaDataProvider.CreateUniqueIndex(const Index: TDBXMetaDataIndex);
begin
  Index.Unique := True;
  CreateIndex(Index);
end;

procedure TDBXMetaDataProvider.CreateIndex(const Index: TDBXMetaDataIndex);
var
  Sql: UnicodeString;
begin
  Sql := MakeCreateIndexSql(Index.IndexesStorage, Index.IndexColumnsStorage);
  FExecuter.Execute(Sql);
end;

function TDBXMetaDataProvider.DropIndex(const TableName: UnicodeString; const IndexName: UnicodeString): Boolean;
begin
  Result := DropIndex(NullString, TableName, IndexName);
end;

function TDBXMetaDataProvider.DropIndex(const SchemaName: UnicodeString; const TableName: UnicodeString; const IndexName: UnicodeString): Boolean;
var
  Storage: TDBXTable;
  Builder: TDBXStringBuffer;
  Success: Boolean;
  Indexes: TDBXIndexesTableStorage;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    Success := False;
    Builder.Append('GetIndexes ');
    if not StringIsNil(SchemaName) then
    begin
      FWriter.MakeSqlIdentifier(Builder, SchemaName);
      Builder.Append('.');
    end;
    FWriter.MakeSqlIdentifier(Builder, TableName);
    Storage := GetCollection(Builder.ToString);
    try
      Indexes := TDBXIndexesTableStorage(Storage);
      ToMemoryStorage(Indexes);
      Indexes.First;
      while Indexes.InBounds do
      begin
        if (not StringIsNil(IndexName)) and (IndexName = Indexes.IndexName) then
        begin
          Sql := MakeDropIndexSql(Indexes);
          Execute(Sql);
          Success := True;
        end;
        Indexes.Next;
      end;
      Result := Success;
    finally
      Storage.Free;
    end;
  finally
    Builder.Free;
  end;
end;

procedure TDBXMetaDataProvider.CreateForeignKey(const Foreignkey: TDBXMetaDataForeignKey);
var
  Sql: UnicodeString;
begin
  Sql := MakeCreateForeignKeySql(Foreignkey.ForeignKeysStorage, Foreignkey.ForeignKeyColumnsStorage);
  FExecuter.Execute(Sql);
end;

function TDBXMetaDataProvider.DropForeignKey(const TableName: UnicodeString; const ForeignKey: UnicodeString): Boolean;
begin
  Result := DropForeignKey(NullString, TableName, ForeignKey);
end;

function TDBXMetaDataProvider.DropForeignKey(const SchemaName: UnicodeString; const TableName: UnicodeString; const ForeignKey: UnicodeString): Boolean;
var
  Storage: TDBXTable;
  Builder: TDBXStringBuffer;
  Success: Boolean;
  ForeignKeys: TDBXForeignKeysTableStorage;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    Success := False;
    Builder.Append('GetForeignKeys ');
    if not StringIsNil(SchemaName) then
    begin
      FWriter.MakeSqlIdentifier(Builder, SchemaName);
      Builder.Append('.');
    end;
    FWriter.MakeSqlIdentifier(Builder, TableName);
    Storage := GetCollection(Builder.ToString);
    try
      ForeignKeys := TDBXForeignKeysTableStorage(Storage);
      ToMemoryStorage(ForeignKeys);
      if (not StringIsNil(ForeignKey)) or (ForeignKeys.First and not ForeignKeys.Next) then
      begin
        ForeignKeys.First;
        while ForeignKeys.InBounds do
        begin
          if (StringIsNil(ForeignKey)) or (ForeignKey = ForeignKeys.ForeignKeyName) then
          begin
            Sql := MakeDropForeignKeySql(ForeignKeys);
            Execute(Sql);
            Success := True;
          end;
          ForeignKeys.Next;
        end;
      end;
      Result := Success;
    finally
      Storage.Free;
    end;
  finally
    Builder.Free;
  end;
end;

function TDBXMetaDataProvider.QuoteIdentifierIfNeeded(const Identifier: UnicodeString): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Id: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlIdentifier(Builder, Identifier);
    Id := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Id;
end;

function TDBXMetaDataProvider.GetCollection(const MetaDataCommand: UnicodeString): TDBXTable;
var
  Table: TDBXTable;
  Name: UnicodeString;
begin
  Table := FWriter.MetaDataReader.FetchCollection(MetaDataCommand);
  if Table = nil then
    Exit(nil);
  Name := Table.DBXTableName;
  if (Name = TDBXMetaDataCollectionName.DataTypes) then
    Exit(TDBXDataTypesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Catalogs) then
    Exit(TDBXCatalogsTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Schemas) then
    Exit(TDBXSchemasTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Tables) then
    Exit(TDBXTablesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Views) then
    Exit(TDBXViewsTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Synonyms) then
    Exit(TDBXSynonymsTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Columns) then
    Exit(TDBXColumnsTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Indexes) then
    Exit(TDBXIndexesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.IndexColumns) then
    Exit(TDBXIndexColumnsTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.ForeignKeys) then
    Exit(TDBXForeignKeysTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.ForeignKeyColumns) then
    Exit(TDBXForeignKeyColumnsTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Procedures) then
    Exit(TDBXProceduresTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.ProcedureSources) then
    Exit(TDBXProcedureSourcesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.ProcedureParameters) then
    Exit(TDBXProcedureParametersTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Packages) then
    Exit(TDBXPackagesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.PackageSources) then
    Exit(TDBXPackageSourcesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Users) then
    Exit(TDBXUsersTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.Roles) then
    Exit(TDBXRolesTableStorage.Create(Table));
  if (Name = TDBXMetaDataCollectionName.ReservedWords) then
    Exit(TDBXReservedWordsTableStorage.Create(Table));
  Result := nil;
end;

procedure TDBXMetaDataProvider.ToMemoryStorage(const Table: TDBXDelegateTable);
var
  Storage: TDBXTable;
begin
  if Table.Storage = nil then
  begin
    Storage := TDBXTableFactory.CreateDBXTable;
    Storage.DBXTableName := Table.DBXTableName;
    Storage.Columns := Table.CopyColumns;
    Storage.CopyFrom(Table);
    Storage.AcceptChanges;
    Storage := Table.ReplaceStorage(Storage);
    Storage.Close;
    FreeAndNil(Storage);
  end;
end;

function TDBXMetaDataProvider.MakeCreateTableSql(const Table: TDBXTablesTableStorage; const Columns: TDBXColumnsTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlCreate(Builder, Table, Columns);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeAlterTableSql(const Table: TDBXTablesTableStorage; const Columns: TDBXColumnsTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlAlter(Builder, Table, Columns);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeDropTableSql(const Table: TDBXTablesTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlDrop(Builder, Table);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeCreateIndexSql(const Indexes: TDBXIndexesTableStorage; const Columns: TDBXIndexColumnsTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlCreate(Builder, Indexes, Columns);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeDropIndexSql(const Indexes: TDBXIndexesTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlDrop(Builder, Indexes);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeCreateForeignKeySql(const ForeignKeys: TDBXForeignKeysTableStorage; const Columns: TDBXForeignKeyColumnsTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlCreate(Builder, ForeignKeys, Columns);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeDropForeignKeySql(const ForeignKey: TDBXForeignKeysTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlDrop(Builder, ForeignKey);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.MakeAlterTableSql(const Indexes: TDBXIndexesTableStorage; const Columns: TDBXIndexColumnsTableStorage): UnicodeString;
var
  Builder: TDBXStringBuffer;
  Sql: UnicodeString;
begin
  Builder := TDBXStringBuffer.Create;
  try
    FWriter.MakeSqlAlter(Builder, Indexes, Columns);
    Sql := Builder.ToString;
  finally
    FreeAndNil(Builder);
  end;
  Result := Sql;
end;

function TDBXMetaDataProvider.GetDatabaseProduct: UnicodeString;
begin
  Result := FWriter.MetaDataReader.ProductName;
end;

function TDBXMetaDataProvider.GetDatabaseVersion: UnicodeString;
begin
  Result := FWriter.MetaDataReader.Version;
end;

function TDBXMetaDataProvider.GetIdentifierQuotePrefix: UnicodeString;
begin
  Result := FWriter.MetaDataReader.SqlIdentifierQuotePrefix;
end;

function TDBXMetaDataProvider.GetIdentifierQuoteSuffix: UnicodeString;
begin
  Result := FWriter.MetaDataReader.SqlIdentifierQuoteSuffix;
end;

function TDBXMetaDataProvider.IsCatalogsSupported: Boolean;
begin
  Result := FWriter.CatalogsSupported;
end;

function TDBXMetaDataProvider.IsSchemasSupported: Boolean;
begin
  Result := FWriter.SchemasSupported;
end;

function TDBXMetaDataProvider.IsMultipleStatementsSupported: Boolean;
begin
  Result := FWriter.MultipleStatementsSupported;
end;

function TDBXMetaDataProvider.IsDescendingIndexSupported: Boolean;
begin
  Result := FWriter.MetaDataReader.DescendingIndexSupported;
end;

function TDBXMetaDataProvider.IsDescendingIndexColumnsSupported: Boolean;
begin
  Result := FWriter.MetaDataReader.DescendingIndexColumnsSupported;
end;

function TDBXMetaDataProvider.IsMixedDDLAndDMLSupported: Boolean;
begin
  Result := FWriter.Mixed_DDL_DML_Supported;
end;

function TDBXMetaDataProvider.IsDDLTransactionsSupported: Boolean;
begin
  Result := FWriter.DDLTransactionsSupported;
end;

constructor TDBXMetaDataTable.Create;
begin
  inherited Create;
  FTable := TDBXTablesTableStorage.Create;
  FColumns := TDBXColumnsTableStorage.Create;
  FTable.Insert;
  FTable.Post;
end;

destructor TDBXMetaDataTable.Destroy;
var
  Index: Integer;
begin
  if FMetaDataColumns <> nil then
    for Index := 0 to Length(FMetaDataColumns) - 1 do
      FreeAndNil(FMetaDataColumns[Index]);
  FMetaDataColumns := nil;
  FreeAndNil(FTable);
  FreeAndNil(FColumns);
  inherited Destroy;
end;

function TDBXMetaDataTable.GetCatalogName: UnicodeString;
begin
  Result := FTable.CatalogName;
end;

procedure TDBXMetaDataTable.SetCatalogName(const CatalogName: UnicodeString);
begin
  FTable.CatalogName := CatalogName;
end;

function TDBXMetaDataTable.GetSchemaName: UnicodeString;
begin
  Result := FTable.SchemaName;
end;

procedure TDBXMetaDataTable.SetSchemaName(const SchemaName: UnicodeString);
begin
  FTable.SchemaName := SchemaName;
end;

function TDBXMetaDataTable.GetTableName: UnicodeString;
begin
  Result := FTable.TableName;
end;

procedure TDBXMetaDataTable.SetTableName(const TableName: UnicodeString);
begin
  FTable.TableName := TableName;
end;

procedure TDBXMetaDataTable.AddColumn(const Column: TDBXMetaDataColumn);
var
  Temp: TDBXMetaDataColumnArray;
  Index: Integer;
begin
  FColumns.Insert;
  Inc(FColumnCount);
  FColumns.ColumnOrdinal := FColumnCount;
  Column.CopyColumnToTableStorage(FColumns);
  FColumns.Post;
  if FColumns = nil then
    SetLength(FMetaDataColumns,1)
  else 
  begin
    SetLength(Temp,Length(FMetaDataColumns) + 1);
    for Index := 0 to Length(FMetaDataColumns) - 1 do
      Temp[Index] := FMetaDataColumns[Index];
    FMetaDataColumns := Temp;
  end;
  FMetaDataColumns[Length(FMetaDataColumns) - 1] := Column;
end;

function TDBXMetaDataTable.GetColumn(const Ordinal: Integer): TDBXMetaDataColumn;
begin
  if FMetaDataColumns = nil then
    Exit(nil);
  Result := FMetaDataColumns[Ordinal];
end;

constructor TDBXObjectColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.ObjectType;
  ColumnName := InName;
end;

constructor TDBXSingleColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.SingleType;
  ColumnName := InName;
end;

constructor TDBXSqlExecution.Create(const Writer: TDBXMetaDataWriter);
begin
  inherited Create;
  self.FContext := Writer.Context;
end;

procedure TDBXSqlExecution.Execute(const Sql: UnicodeString);
var
  Statement: UnicodeString;
  Start: Integer;
  Index: Integer;
  Storage: TDBXTable;
begin
  Statement := NullString;
  Start := 0;
  Index := StringIndexOf(Sql,';');
  while Index >= 0 do
  begin
    Statement := Copy(Sql,Start+1,Index-(Start));
    Statement := Trim(Statement);
    if Length(Statement) > 0 then
    begin
      Storage := FContext.ExecuteQuery(Statement, nil, nil);
      FreeAndNil(Storage);
    end;
    Start := Index + 1;
    Index := StringIndexOf(Sql,';',Start);
  end;
  Statement := Copy(Sql,Start+1,Length(Sql)-(Start));
  Statement := Trim(Statement);
  if Length(Statement) > 0 then
    FContext.ExecuteQuery(Statement, nil, nil);
end;

constructor TDBXTimeColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.TimeType;
  ColumnName := InName;
end;

constructor TDBXTimestampColumn.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.TimeStampType;
  ColumnName := InName;
end;

constructor TDBXUInt16Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.UInt16Type;
  ColumnName := InName;
  Unsigned := True;
end;

constructor TDBXUInt32Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.UInt32Type;
  ColumnName := InName;
  Unsigned := True;
end;

constructor TDBXUInt64Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.UInt64Type;
  ColumnName := InName;
  Unsigned := True;
end;

constructor TDBXUInt8Column.Create(const InName: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.UInt8Type;
  ColumnName := InName;
  Unsigned := True;
end;

constructor TDBXUnicodeCharColumn.Create(const Name: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.WideStringType;
  Long := False;
  FixedLength := True;
  ColumnName := Name;
  UnicodeChar := True;
  Precision := InPrecision;
end;

constructor TDBXUnicodeLongColumn.Create(const Name: UnicodeString);
begin
  inherited Create;
  DataType := TDBXDataTypes.WideStringType;
  Long := True;
  UnicodeChar := True;
  ColumnName := Name;
  Precision := 80000;
end;

constructor TDBXUnicodeVarCharColumn.Create(const InName: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.WideStringType;
  Long := False;
  FixedLength := False;
  ColumnName := InName;
  UnicodeChar := True;
  Precision := InPrecision;
end;

constructor TDBXVarBinaryColumn.Create(const InName: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.VarBytesType;
  ColumnName := InName;
  Precision := InPrecision;
end;

constructor TDBXWideVarCharColumn.Create(const Name: UnicodeString; const InPrecision: Integer);
begin
  inherited Create;
  DataType := TDBXDataTypes.WideStringType;
  Long := False;
  FixedLength := False;
  ColumnName := Name;
  Precision := InPrecision;
end;

end.
