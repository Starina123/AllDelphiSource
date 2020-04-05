{*******************************************************}
{                                                       }
{               Delphi DataSnap Framework               }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Datasnap.DSCommonTable;

interface

uses
  Data.DBXCommonTable;

type
  
  /// <summary> 
  ///  Collection of server classes.
  /// </summary>
  TDSClassEntity = class(TDBXTableEntity)
  public
    constructor Create(const Table: TDBXTable; const OwnTable: Boolean); overload;
    constructor Create(const OwnTable: Boolean); overload;
  protected
    function GetPackageName: UnicodeString;
    procedure SetPackageName(const PackageName: UnicodeString);
    function GetServerClassName: UnicodeString;
    procedure SetServerClassName(const ClassName: UnicodeString);
    function GetRoleName: UnicodeString;
    procedure SetRoleName(const RoleName: UnicodeString);
    function GetLifeCycle: UnicodeString;
    procedure SetLifeCycle(const LifeCycle: UnicodeString);
  private
    class function CreateClassTable: TDBXTable; static;
  public
    property PackageName: UnicodeString read GetPackageName write SetPackageName;
    property ServerClassName: UnicodeString read GetServerClassName write SetServerClassName;
    property RoleName: UnicodeString read GetRoleName write SetRoleName;
    property LifeCycle: UnicodeString read GetLifeCycle write SetLifeCycle;
  end;

  
  /// <summary> 
  ///  Collection containing information on available connections
  /// </summary>
  /// <remarks>
  /// </remarks>
  TDSConnectionEntity = class(TDBXTableEntity)
  public
    constructor Create(const Table: TDBXTable; const OwnTable: Boolean); overload;
    constructor Create(const OwnTable: Boolean); overload;
  protected
    function GetConnectionName: UnicodeString;
    procedure SetConnectionName(const ConnectionName: UnicodeString);
    function GetConnectionProperties: UnicodeString;
    procedure SetConnectionProperties(const ConnectionProperties: UnicodeString);
    function GetDriverName: UnicodeString;
    procedure SetDriverName(const DriverName: UnicodeString);
    function GetDriverProperties: UnicodeString;
    procedure SetDriverProperties(const DriverProperties: UnicodeString);
  private
    class function CreateClassTable: TDBXTable; static;
  public
    property ConnectionName: UnicodeString read GetConnectionName write SetConnectionName;
    property ConnectionProperties: UnicodeString read GetConnectionProperties write SetConnectionProperties;
    property DriverName: UnicodeString read GetDriverName write SetDriverName;
    property DriverProperties: UnicodeString read GetDriverProperties write SetDriverProperties;
  end;

  
  /// <summary> Collection containing information on methods.
  /// </summary>
  TDSMethodEntity = class(TDBXTableEntity)
  public
    constructor Create(const Table: TDBXTable; const OwnTable: Boolean); overload;
    constructor Create(const OwnTable: Boolean); overload;
  protected
    function GetMethodAlias: UnicodeString;
    procedure SetMethodAlias(const ClassName: UnicodeString);
    function GetServerClassName: UnicodeString;
    procedure SetServerClassName(const ClassName: UnicodeString);
    function GetServerMethodName: UnicodeString;
    procedure SetServerMethodName(const ClassName: UnicodeString);
    function GetRoleName: UnicodeString;
    procedure SetRoleName(const ClassName: UnicodeString);
  private
    class function CreateMethodTable: TDBXTable; static;
  public
    property MethodAlias: UnicodeString read GetMethodAlias write SetMethodAlias;
    property ServerClassName: UnicodeString read GetServerClassName write SetServerClassName;
    property ServerMethodName: UnicodeString read GetServerMethodName write SetServerMethodName;
    property RoleName: UnicodeString read GetRoleName write SetRoleName;
  end;

  
  /// <summary> 
  ///  Collection containing information on packages.
  /// </summary>
  TDSPackageEntity = class(TDBXTableEntity)
  public
    constructor Create(const Table: TDBXTable; const OwnTable: Boolean); overload;
    constructor Create(const OwnTable: Boolean); overload;
  protected
    function GetPackageName: UnicodeString;
    procedure SetPackageName(const PackageName: UnicodeString);
  private
    class function CreatePackageTable: TDBXTable; static;
  public
    property PackageName: UnicodeString read GetPackageName write SetPackageName;
  end;

  
  /// <summary>
  ///  This entity has the same fields as <see cref="TDBXProceduresColumns"/>
  ///  It is used to show Server methods in a table structure as the one
  ///  used by the dbExpress <see cref="TDBXMetaDataCommands.GetProcedures"/>
  ///  metadata command.<p>
  ///  When a <see cref="TDBXMetaDataCommands.GetProcedures"/> metadata command is
  ///  executed against a DataSnap server, the result will include all registered
  ///  server methods.</p>
  /// </summary>
  /// <remarks>  It will also include any existing stored procedures
  ///  from the database connection specified by the <see cref="TDBXPropertyNames.ServerConnection"/>
  ///  if the <see cref="TDBXPropertyNames.ServerConnection"/> property was set in the connection
  ///  properties used to connect to the DataSnap server.
  /// 
  /// </remarks>
  TDSProcedureEntity = class(TDBXTableEntity)
  public
    constructor Create(const Table: TDBXTable; const OwnTable: Boolean); overload;
    constructor Create(const OwnTable: Boolean); overload;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const CatalogName: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const SchemaName: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProcedureName(const ProcedureName: UnicodeString);
    function GetProcedureType: UnicodeString;
    procedure SetProcedureType(const ClassName: UnicodeString);
  private
    class function CreateProcedureTable: TDBXTable; static;
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property ProcedureName: UnicodeString read GetProcedureName write SetProcedureName;
    property ProcedureType: UnicodeString read GetProcedureType write SetProcedureType;
  end;

  
  /// <summary> 
  ///  Collection containing information on procedure parameters.
  /// </summary>
  TDSProcedureParametersEntity = class(TDBXTableEntity)
  public
    constructor Create(const Table: TDBXTable; const OwnTable: Boolean); overload;
    constructor Create(const OwnTable: Boolean); overload;
    function IsNullable: Boolean;
    function GetUnsigned: Boolean;
  protected
    function GetCatalogName: UnicodeString;
    procedure SetCatalogName(const CatalogName: UnicodeString);
    function GetSchemaName: UnicodeString;
    procedure SetSchemaName(const SchemaName: UnicodeString);
    function GetProcedureName: UnicodeString;
    procedure SetProceduredName(const ProcedureName: UnicodeString);
    function GetParameterName: UnicodeString;
    procedure SetParameterName(const ParameterName: UnicodeString);
    function GetParameterMode: UnicodeString;
    procedure SetParameterMode(const ParameterMode: UnicodeString);
    function GetTypeName: UnicodeString;
    procedure SetTypeName(const TypeName: UnicodeString);
    function GetPrecision: Integer;
    procedure SetPrecision(const Precision: Integer);
    function GetScale: Integer;
    procedure SetScale(const Scale: Integer);
    function GetOrdinal: Integer;
    procedure SetOrdinal(const Ordinal: Integer);
    procedure SetNullable(const Nullable: Boolean);
    function GetDBXDataType: Integer;
    procedure SetDBXDataType(const DataType: Integer);
    function IsFixedLength: Boolean;
    procedure SetFixedLength(const FixedLength: Boolean);
    function IsUnicode: Boolean;
    procedure SetUnicode(const IsUnicode: Boolean);
    function IsLong: Boolean;
    procedure SetLong(const IsLong: Boolean);
    procedure SetUnsigned(const IsUnsigned: Boolean);
  private
    class function CreateProcedureParmetersTable: TDBXTable; static;
  public
    property CatalogName: UnicodeString read GetCatalogName write SetCatalogName;
    property SchemaName: UnicodeString read GetSchemaName write SetSchemaName;
    property ProcedureName: UnicodeString read GetProcedureName;
    property ProceduredName: UnicodeString write SetProceduredName;
    property ParameterName: UnicodeString read GetParameterName write SetParameterName;
    property ParameterMode: UnicodeString read GetParameterMode write SetParameterMode;
    property TypeName: UnicodeString read GetTypeName write SetTypeName;
    property Precision: Integer read GetPrecision write SetPrecision;
    property Scale: Integer read GetScale write SetScale;
    property Ordinal: Integer read GetOrdinal write SetOrdinal;
    property Nullable: Boolean write SetNullable;
    property DBXDataType: Integer read GetDBXDataType write SetDBXDataType;
    property FixedLength: Boolean read IsFixedLength write SetFixedLength;
    property Unicode: Boolean read IsUnicode write SetUnicode;
    property Long: Boolean read IsLong write SetLong;
    property Unsigned: Boolean write SetUnsigned;
  end;

implementation

uses
  Data.DBXCommon,
  Data.DBXMetaDataNames,
  Data.DBXMetaDataReader,
  Data.DBXTableFactory,
  Datasnap.DSNames;

constructor TDSClassEntity.Create(const Table: TDBXTable; const OwnTable: Boolean);
begin
  inherited Create(Table, OwnTable);
end;

constructor TDSClassEntity.Create(const OwnTable: Boolean);
begin
  inherited Create(CreateClassTable, OwnTable);
end;

class function TDSClassEntity.CreateClassTable: TDBXTable;
var
  Table: TDBXTable;
  ReturnList: TDBXValueTypeArray;
  DeployName: TDBXValueType;
  ClassName: TDBXValueType;
  RoleName: TDBXValueType;
  LifeCycle: TDBXValueType;
begin
  Table := TDBXTableFactory.CreateDBXTable;
  Table.DBXTableName := 'ClassTable';
  DeployName := TDBXValueType.Create;
  DeployName.Name := TDSClassColumns.PackageName;
  DeployName.DisplayName := TDSClassColumns.PackageName;
  DeployName.DataType := TDBXDataTypes.WideStringType;
  DeployName.Size := 256;
  ClassName := TDBXValueType.Create;
  ClassName.Name := TDSClassColumns.ServerClassName;
  ClassName.DisplayName := TDSClassColumns.ServerClassName;
  ClassName.DataType := TDBXDataTypes.WideStringType;
  ClassName.Size := 256;
  RoleName := TDBXValueType.Create;
  RoleName.Name := TDSClassColumns.RoleName;
  RoleName.DisplayName := TDSClassColumns.RoleName;
  RoleName.DataType := TDBXDataTypes.WideStringType;
  RoleName.Size := 256;
  LifeCycle := TDBXValueType.Create;
  LifeCycle.Name := TDSClassColumns.LifeCycle;
  LifeCycle.DisplayName := TDSClassColumns.LifeCycle;
  LifeCycle.DataType := TDBXDataTypes.WideStringType;
  LifeCycle.Size := 256;
  SetLength(ReturnList,4);
  ReturnList[0] := DeployName;
  ReturnList[1] := ClassName;
  ReturnList[2] := RoleName;
  ReturnList[3] := LifeCycle;
  Table.Columns := ReturnList;
  Result := Table;
end;

function TDSClassEntity.GetPackageName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSClassColumns.PackageName)].AsString;
end;

procedure TDSClassEntity.SetPackageName(const PackageName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSClassColumns.PackageName)].AsString := PackageName;
end;

function TDSClassEntity.GetServerClassName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSClassColumns.ServerClassName)].AsString;
end;

procedure TDSClassEntity.SetServerClassName(const ClassName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSClassColumns.ServerClassName)].AsString := ClassName;
end;

function TDSClassEntity.GetRoleName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSClassColumns.RoleName)].AsString;
end;

procedure TDSClassEntity.SetRoleName(const RoleName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSClassColumns.RoleName)].AsString := RoleName;
end;

function TDSClassEntity.GetLifeCycle: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSClassColumns.LifeCycle)].AsString;
end;

procedure TDSClassEntity.SetLifeCycle(const LifeCycle: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSClassColumns.LifeCycle)].AsString := LifeCycle;
end;

constructor TDSConnectionEntity.Create(const Table: TDBXTable; const OwnTable: Boolean);
begin
  inherited Create(Table, OwnTable);
end;

constructor TDSConnectionEntity.Create(const OwnTable: Boolean);
begin
  inherited Create(CreateClassTable, OwnTable);
end;

class function TDSConnectionEntity.CreateClassTable: TDBXTable;
var
  Table: TDBXTable;
  ReturnList: TDBXValueTypeArray;
  ConnectionName: TDBXValueType;
  ConnectionProperties: TDBXValueType;
  DriverName: TDBXValueType;
  DriverProperties: TDBXValueType;
begin
  Table := TDBXTableFactory.CreateDBXTable;
  Table.DBXTableName := 'ConnectionTable';
  ConnectionName := TDBXValueType.Create;
  ConnectionName.Name := TDSConnectionColumns.ConnectionName;
  ConnectionName.DisplayName := TDSConnectionColumns.ConnectionName;
  ConnectionName.DataType := TDBXDataTypes.WideStringType;
  ConnectionName.Size := 128;
  ConnectionProperties := TDBXValueType.Create;
  ConnectionProperties.Name := TDSConnectionColumns.ConnectionProperties;
  ConnectionProperties.DisplayName := TDSConnectionColumns.ConnectionProperties;
  ConnectionProperties.DataType := TDBXDataTypes.WideStringType;
  ConnectionProperties.Size := 2048;
  DriverName := TDBXValueType.Create;
  DriverName.Name := TDSConnectionColumns.DriverName;
  DriverName.DisplayName := TDSConnectionColumns.DriverName;
  DriverName.DataType := TDBXDataTypes.WideStringType;
  DriverName.Size := 128;
  DriverProperties := TDBXValueType.Create;
  DriverProperties.Name := TDSConnectionColumns.DriverProperties;
  DriverProperties.DisplayName := TDSConnectionColumns.DriverProperties;
  DriverProperties.DataType := TDBXDataTypes.WideStringType;
  DriverProperties.Size := 2048;
  SetLength(ReturnList,4);
  ReturnList[0] := ConnectionName;
  ReturnList[1] := ConnectionProperties;
  ReturnList[2] := DriverName;
  ReturnList[3] := DriverProperties;
  Table.Columns := ReturnList;
  Result := Table;
end;

function TDSConnectionEntity.GetConnectionName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSConnectionColumns.ConnectionName)].AsString;
end;

procedure TDSConnectionEntity.SetConnectionName(const ConnectionName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSConnectionColumns.ConnectionName)].AsString := ConnectionName;
end;

function TDSConnectionEntity.GetConnectionProperties: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSConnectionColumns.ConnectionProperties)].AsString;
end;

procedure TDSConnectionEntity.SetConnectionProperties(const ConnectionProperties: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSConnectionColumns.ConnectionProperties)].AsString := ConnectionProperties;
end;

function TDSConnectionEntity.GetDriverName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSConnectionColumns.DriverName)].AsString;
end;

procedure TDSConnectionEntity.SetDriverName(const DriverName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSConnectionColumns.DriverName)].AsString := DriverName;
end;

function TDSConnectionEntity.GetDriverProperties: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSConnectionColumns.DriverProperties)].AsString;
end;

procedure TDSConnectionEntity.SetDriverProperties(const DriverProperties: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSConnectionColumns.DriverProperties)].AsString := DriverProperties;
end;

constructor TDSMethodEntity.Create(const Table: TDBXTable; const OwnTable: Boolean);
begin
  inherited Create(Table, OwnTable);
end;

constructor TDSMethodEntity.Create(const OwnTable: Boolean);
begin
  inherited Create(CreateMethodTable, OwnTable);
end;

class function TDSMethodEntity.CreateMethodTable: TDBXTable;
var
  Table: TDBXTable;
  MethodAlias: TDBXValueType;
  ClassName: TDBXValueType;
  MethodName: TDBXValueType;
  RoleName: TDBXValueType;
  TypeList: TDBXValueTypeArray;
begin
  Table := TDBXTableFactory.CreateDBXTable;
  Table.DBXTableName := 'MethodTable';
  MethodAlias := TDBXValueType.Create;
  MethodAlias.Name := TDSMethodColumns.MethodAlias;
  MethodAlias.DisplayName := TDSMethodColumns.MethodAlias;
  MethodAlias.DataType := TDBXDataTypes.WideStringType;
  MethodAlias.Size := 256;
  ClassName := TDBXValueType.Create;
  ClassName.Name := TDSMethodColumns.ServerClassName;
  ClassName.DisplayName := TDSMethodColumns.ServerClassName;
  ClassName.DataType := TDBXDataTypes.WideStringType;
  ClassName.Size := 256;
  MethodName := TDBXValueType.Create;
  MethodName.Name := TDSMethodColumns.ServerMethodName;
  MethodName.DisplayName := TDSMethodColumns.ServerMethodName;
  MethodName.DataType := TDBXDataTypes.WideStringType;
  MethodName.Size := 256;
  RoleName := TDBXValueType.Create;
  RoleName.Name := TDSMethodColumns.RoleName;
  RoleName.DisplayName := TDSMethodColumns.RoleName;
  RoleName.DataType := TDBXDataTypes.WideStringType;
  RoleName.Size := 256;
  SetLength(TypeList,4);
  TypeList[0] := MethodAlias;
  TypeList[1] := ClassName;
  TypeList[2] := MethodName;
  TypeList[3] := RoleName;
  Table.Columns := TypeList;
  Result := Table;
end;

function TDSMethodEntity.GetMethodAlias: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSMethodColumns.MethodAlias)].AsString;
end;

procedure TDSMethodEntity.SetMethodAlias(const ClassName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSMethodColumns.MethodAlias)].AsString := ClassName;
end;

function TDSMethodEntity.GetServerClassName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSMethodColumns.ServerClassName)].AsString;
end;

procedure TDSMethodEntity.SetServerClassName(const ClassName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSMethodColumns.ServerClassName)].AsString := ClassName;
end;

function TDSMethodEntity.GetServerMethodName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSMethodColumns.ServerMethodName)].AsString;
end;

procedure TDSMethodEntity.SetServerMethodName(const ClassName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSMethodColumns.ServerMethodName)].AsString := ClassName;
end;

function TDSMethodEntity.GetRoleName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSMethodColumns.RoleName)].AsString;
end;

procedure TDSMethodEntity.SetRoleName(const ClassName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSMethodColumns.RoleName)].AsString := ClassName;
end;

constructor TDSPackageEntity.Create(const Table: TDBXTable; const OwnTable: Boolean);
begin
  inherited Create(Table, OwnTable);
end;

constructor TDSPackageEntity.Create(const OwnTable: Boolean);
begin
  inherited Create(CreatePackageTable, OwnTable);
end;

class function TDSPackageEntity.CreatePackageTable: TDBXTable;
var
  Table: TDBXTable;
  PackageName: TDBXValueType;
  TypeList: TDBXValueTypeArray;
begin
  Table := TDBXTableFactory.CreateDBXTable;
  Table.DBXTableName := 'PackageTable';
  PackageName := TDBXValueType.Create;
  PackageName.Name := TDSPackageColumns.PackageName;
  PackageName.DisplayName := TDSPackageColumns.PackageName;
  PackageName.DataType := TDBXDataTypes.WideStringType;
  PackageName.Size := 256;
  SetLength(TypeList,1);
  TypeList[0] := PackageName;
  Table.Columns := TypeList;
  Result := Table;
end;

function TDSPackageEntity.GetPackageName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDSPackageColumns.PackageName)].AsString;
end;

procedure TDSPackageEntity.SetPackageName(const PackageName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDSPackageColumns.PackageName)].AsString := PackageName;
end;

constructor TDSProcedureEntity.Create(const Table: TDBXTable; const OwnTable: Boolean);
begin
  inherited Create(Table, OwnTable);
end;

constructor TDSProcedureEntity.Create(const OwnTable: Boolean);
begin
  inherited Create(CreateProcedureTable, OwnTable);
end;

class function TDSProcedureEntity.CreateProcedureTable: TDBXTable;
var
  Table: TDBXTable;
begin
  Table := TDBXTableFactory.CreateDBXTable;
  Table.DBXTableName := 'ProceduresTable';
  Table.Columns := TDBXMetaDataCollectionColumns.CreateProceduresColumns;
  Result := Table;
end;

function TDSProcedureEntity.GetCatalogName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProceduresColumns.CatalogName)].AsString;
end;

procedure TDSProcedureEntity.SetCatalogName(const CatalogName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProceduresColumns.CatalogName)].AsString := CatalogName;
end;

function TDSProcedureEntity.GetSchemaName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProceduresColumns.SchemaName)].AsString;
end;

procedure TDSProcedureEntity.SetSchemaName(const SchemaName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProceduresColumns.SchemaName)].AsString := SchemaName;
end;

function TDSProcedureEntity.GetProcedureName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProceduresColumns.ProcedureName)].AsString;
end;

procedure TDSProcedureEntity.SetProcedureName(const ProcedureName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProceduresColumns.ProcedureName)].AsString := ProcedureName;
end;

function TDSProcedureEntity.GetProcedureType: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProceduresColumns.ProcedureType)].AsString;
end;

procedure TDSProcedureEntity.SetProcedureType(const ClassName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProceduresColumns.ProcedureType)].AsString := ClassName;
end;

constructor TDSProcedureParametersEntity.Create(const Table: TDBXTable; const OwnTable: Boolean);
begin
  inherited Create(Table, OwnTable);
end;

constructor TDSProcedureParametersEntity.Create(const OwnTable: Boolean);
begin
  inherited Create(CreateProcedureParmetersTable, OwnTable);
end;

class function TDSProcedureParametersEntity.CreateProcedureParmetersTable: TDBXTable;
var
  Table: TDBXTable;
begin
  Table := TDBXTableFactory.CreateDBXTable;
  Table.DBXTableName := 'ProcedureParameters';
  Table.Columns := TDBXMetaDataCollectionColumns.CreateProcedureParametersColumns;
  Result := Table;
end;

function TDSProcedureParametersEntity.GetCatalogName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.CatalogName)].AsString;
end;

procedure TDSProcedureParametersEntity.SetCatalogName(const CatalogName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.CatalogName)].AsString := CatalogName;
end;

function TDSProcedureParametersEntity.GetSchemaName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.SchemaName)].AsString;
end;

procedure TDSProcedureParametersEntity.SetSchemaName(const SchemaName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.SchemaName)].AsString := SchemaName;
end;

function TDSProcedureParametersEntity.GetProcedureName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.ProcedureName)].AsString;
end;

procedure TDSProcedureParametersEntity.SetProceduredName(const ProcedureName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.ProcedureName)].AsString := ProcedureName;
end;

function TDSProcedureParametersEntity.GetParameterName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.ParameterName)].AsString;
end;

procedure TDSProcedureParametersEntity.SetParameterName(const ParameterName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.ParameterName)].AsString := ParameterName;
end;

function TDSProcedureParametersEntity.GetParameterMode: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.ParameterMode)].AsString;
end;

procedure TDSProcedureParametersEntity.SetParameterMode(const ParameterMode: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.ParameterMode)].AsString := ParameterMode;
end;

function TDSProcedureParametersEntity.GetTypeName: UnicodeString;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.TypeName)].AsString;
end;

procedure TDSProcedureParametersEntity.SetTypeName(const TypeName: UnicodeString);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.TypeName)].AsString := TypeName;
end;

function TDSProcedureParametersEntity.GetPrecision: Integer;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.Precision)].AsInt32;
end;

procedure TDSProcedureParametersEntity.SetPrecision(const Precision: Integer);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.Precision)].AsInt32 := Precision;
end;

function TDSProcedureParametersEntity.GetScale: Integer;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.Scale)].AsInt32;
end;

procedure TDSProcedureParametersEntity.SetScale(const Scale: Integer);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.Scale)].AsInt32 := Scale;
end;

function TDSProcedureParametersEntity.GetOrdinal: Integer;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.Ordinal)].AsInt32;
end;

procedure TDSProcedureParametersEntity.SetOrdinal(const Ordinal: Integer);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.Ordinal)].AsInt32 := Ordinal;
end;

function TDSProcedureParametersEntity.IsNullable: Boolean;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsNullable)].GetBoolean;
end;

procedure TDSProcedureParametersEntity.SetNullable(const Nullable: Boolean);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsNullable)].AsBoolean := Nullable;
end;

function TDSProcedureParametersEntity.GetDBXDataType: Integer;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.DbxDataType)].AsInt32;
end;

procedure TDSProcedureParametersEntity.SetDBXDataType(const DataType: Integer);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.DbxDataType)].AsInt32 := DataType;
end;

function TDSProcedureParametersEntity.IsFixedLength: Boolean;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsFixedLength)].GetBoolean;
end;

procedure TDSProcedureParametersEntity.SetFixedLength(const FixedLength: Boolean);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsFixedLength)].AsBoolean := FixedLength;
end;

function TDSProcedureParametersEntity.IsUnicode: Boolean;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsUnicode)].GetBoolean;
end;

procedure TDSProcedureParametersEntity.SetUnicode(const IsUnicode: Boolean);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsUnicode)].AsBoolean := IsUnicode;
end;

function TDSProcedureParametersEntity.IsLong: Boolean;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsLong)].GetBoolean;
end;

procedure TDSProcedureParametersEntity.SetLong(const IsLong: Boolean);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsLong)].AsBoolean := IsLong;
end;

function TDSProcedureParametersEntity.GetUnsigned: Boolean;
begin
  Result := Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsUnsigned)].GetBoolean;
end;

procedure TDSProcedureParametersEntity.SetUnsigned(const IsUnsigned: Boolean);
begin
  Table.Value[Table.GetOrdinal(TDBXProcedureParametersColumns.IsUnsigned)].AsBoolean := IsUnsigned;
end;

end.
