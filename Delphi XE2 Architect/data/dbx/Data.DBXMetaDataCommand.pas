{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMetaDataCommand;

interface

uses
  Data.DBXCommon,
  Data.DBXCommonTable,
  Data.DBXMetaDataReader
;

type
  TDBXMetaDataCommand = class(TDBXCommand)
  public
    constructor Create(DBXContext: TDBXContext; MorphicCommand: TDBXCommand; Provider: TDBXMetaDataReader);
    destructor Destroy; override;
  protected
    procedure SetRowSetSize(const RowSetSize: Int64); override;
    procedure SetMaxBlobSize(const MaxBlobSize: Int64); override;
    function  GetRowsAffected: Int64; override;

    function  DerivedGetNextReader: TDBXReader; override;
    procedure DerivedOpen; override;
    procedure DerivedClose; override;
    procedure DerivedPrepare; override;
    function  DerivedExecuteQuery: TDBXReader; override;
    procedure DerivedExecuteUpdate; override;
  private
    function  CreateValueType(Name: WideString; DataType: Integer; Size: Integer): TDBXValueType;
    function  FetchDatabaseColumns: TDBXTable;
  private
    FQueryCommand: TDBXCommand;
    FReader: TDBXMetaDataReader;
  end;

implementation

uses
  Data.DBXPlatform,
  System.SysUtils
;

const
  ParameterQuote = '"';
  DatabaseCollectionName = 'Database';

  QuoteCharOrdinal = 0;
  ProcedureQuoteCharOrdinal = 1;
  MaxCommandsOrdinal = 2;
  SupportsTransactionsOrdinal = 3;
  SupportsNestedTransactionsOrdinal = 4;
  SupportsRowSetSizeOrdinal = 5;
  ProductVersionOrdinal = 6;
  ProductNameOrdinal = 7;
  QuotePrefixOrdinal = 8;
  QuoteSuffixOrdinal = 9;
  SupportsLowerCaseIdentifiersOrdinal = 10;
  SupportsUpperCaseIdentifiersOrdinal = 11;
  SupportsSPReturnCode = 12;
  SupportsParameterMetadata = 13;
  SupportsCatalogFunctions = 14;
  DatabaseColumnCount = 15;

type
  TDBXMetaDataDbxReader = class;
  TDatabaseCursor = class;
  TDBXMetaDataRow = class;

  TDBXMetaDataDbxReader = class(TDBXReader)
  public
    constructor Create(DBXContext: TDBXContext; Row: TDBXMetaDataRow; Cursor: TDBXTable);
    destructor Destroy; override;
  protected
    function  DerivedNext: Boolean; override;
    procedure DerivedClose; override;
    function  GetByteReader: TDBXByteReader; override;
  private
    FByteReader:  TDBXReaderByteReader;
    function MapToDBXType(ColumnType: Integer): Integer;
  private
    FCursor: TDBXTable;
  end;

  TDatabaseCursor = class(TDBXCustomMetaDataTable)
  private
    FDatabaseRow: TDBXSingleValueRow;
  public
    constructor Create(Columns: TDBXValueTypeArray; Provider: TDBXMetaDataReader; TypeNames: TDBXPlatformTypeNames);
    function  Next: Boolean; override;
    destructor Destroy; override;
  protected
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
  private
    FReader: TDBXMetaDataReader;
    FRow: Integer;
  end;

  TDBXMetaDataRow = class(TDBXRow)
  protected
    constructor Create(DBXContext: TDBXContext; Row: TDBXTableRow);
  protected
    procedure GetWideString(DbxValue: TDBXWideStringValue; var WideStringBuilder: TDBXWideStringBuilder; var IsNull: LongBool); override;
    procedure GetBoolean(DbxValue: TDBXBooleanValue; var Value: LongBool; var IsNull: LongBool); override;
    procedure GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte; var IsNull: LongBool); override;
    procedure GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt; var IsNull: LongBool); override;
    procedure GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word; var IsNull: LongBool); override;
    procedure GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt; var IsNull: LongBool); override;
    procedure GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32; var IsNull: LongBool); override;
    procedure GetInt64(DbxValue: TDBXInt64Value; var Value: Int64; var IsNull: LongBool); override;
  private
    FRow: TDBXTableRow;
  end;


constructor TDBXMetaDataCommand.Create(DBXContext: TDBXContext; MorphicCommand: TDBXCommand; Provider: TDBXMetaDataReader);
begin
  Inherited Create(DBXContext);
  FReader := Provider;
end;

destructor TDBXMetaDataCommand.Destroy;
begin
  FreeAndNil(FQueryCommand);
  inherited Destroy;
end;

procedure TDBXMetaDataCommand.SetRowSetSize(const RowSetSize: Int64);
begin
                 
end;

procedure TDBXMetaDataCommand.SetMaxBlobSize(const MaxBlobSize: Int64);
begin
                 
end;

function  TDBXMetaDataCommand.GetRowsAffected: Int64;
begin
                 
  Result := 0;
end;

function TDBXMetaDataCommand.DerivedGetNextReader: TDBXReader;
begin
  Result := nil;
end;

procedure TDBXMetaDataCommand.DerivedOpen;
begin

end;

function TDBXMetaDataCommand.CreateValueType(Name: WideString; DataType,
  Size: Integer): TDBXValueType;
begin
  Result            := TDBXValueType.Create;
  Result.Name       := Name;
  Result.DataType   := DataType;
  Result.Size       := Size;
end;

procedure TDBXMetaDataCommand.DerivedClose;
begin

end;

procedure TDBXMetaDataCommand.DerivedPrepare;
begin

end;

function TDBXMetaDataCommand.DerivedExecuteQuery: TDBXReader;
var
  Table: TDBXTable;
  Row: TDBXMetaDataRow;
begin
  Table := FReader.FetchCollection(Text);
  if Table = nil then
    Table := FetchDatabaseColumns
  else
    FQueryCommand := TDBXCommand(Table.Command);
  Row := TDBXMetaDataRow.Create(FDBXContext,Table);
  Result := TDBXMetaDataDbxReader.Create(FDBXContext,Row,Table);
end;

procedure TDBXMetaDataCommand.DerivedExecuteUpdate;
begin

end;

function TDBXMetaDataCommand.FetchDatabaseColumns: TDBXTable;
var
  Columns: TDBXValueTypeArray;
begin
  SetLength(Columns, DatabaseColumnCount);
  Columns[QuoteCharOrdinal]                    := CreateValueType(TDBXMetaDatabaseColumnNames.QuoteChar,                    TDBXDataTypes.WideStringType, 2);
  Columns[ProcedureQuoteCharOrdinal]           := CreateValueType(TDBXMetaDatabaseColumnNames.ProcedureQuoteChar,           TDBXDataTypes.WideStringType, 2);
  Columns[SupportsTransactionsOrdinal]         := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsTransactions,         TDBXDataTypes.BooleanType, 1);
  Columns[SupportsNestedTransactionsOrdinal]   := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsNestedTransactions,   TDBXDataTypes.BooleanType, 1);
  Columns[MaxCommandsOrdinal]                  := CreateValueType(TDBXMetaDatabaseColumnNames.MaxCommands,                  TDBXDataTypes.Int32Type,     4);
  Columns[SupportsRowSetSizeOrdinal]           := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsRowSetSize,           TDBXDataTypes.BooleanType, 1);
  // Sybase ASE/ASA, and Informix return values much larger than 20.
  //
  Columns[ProductVersionOrdinal]               := CreateValueType(TDBXMetaDatabaseColumnNames.ProductVersion,               TDBXDataTypes.WideStringType, 128);
  Columns[ProductNameOrdinal]                  := CreateValueType(TDBXMetaDatabaseColumnNames.ProductName,                  TDBXDataTypes.WideStringType, 128);
  Columns[QuotePrefixOrdinal]                  := CreateValueType(TDBXMetaDatabaseColumnNames.QuotePrefix,                  TDBXDataTypes.WideStringType, 2);
  Columns[QuoteSuffixOrdinal]                  := CreateValueType(TDBXMetaDatabaseColumnNames.QuoteSuffix,                  TDBXDataTypes.WideStringType, 2);
  Columns[SupportsLowerCaseIdentifiersOrdinal] := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsLowerCaseIdentifiers, TDBXDataTypes.BooleanType, 1);
  Columns[SupportsUpperCaseIdentifiersOrdinal] := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsUpperCaseIdentifiers, TDBXDataTypes.BooleanType, 1);
  Columns[SupportsSPReturnCode]                := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsSPReturnCode, TDBXDataTypes.BooleanType, 1);
  Columns[SupportsParameterMetadata]           := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsParameterMetadata, TDBXDataTypes.BooleanType, 1);
  Columns[SupportsCatalogFunctions]            := CreateValueType(TDBXMetaDatabaseColumnNames.SupportsCatalogFunctions, TDBXDataTypes.BooleanType, 1);
  Result := TDatabaseCursor.Create(Columns,FReader,FReader.Context);
end;

{ TDatabaseCursor }

constructor TDatabaseCursor.Create(Columns: TDBXValueTypeArray; Provider: TDBXMetaDataReader; TypeNames: TDBXPlatformTypeNames);
begin
  inherited Create(TypeNames, DatabaseCollectionName, Columns, nil);
  FReader := Provider;
  FDatabaseRow := TDBXSingleValueRow.Create;
  FDatabaseRow.Columns := CopyColumns();
end;

destructor TDatabaseCursor.Destroy;
begin
  FreeAndNil(FDatabaseRow);
  inherited;
end;



function TDatabaseCursor.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  Result := FDatabaseRow.Value[Ordinal];
end;

function TDatabaseCursor.Next: Boolean;
begin
  if FRow < 2 then
    Inc(FRow);
  Result := (FRow = 1);
  FDatabaseRow.Value[QuoteCharOrdinal].SetWideString(FReader.SqlIdentifierQuoteChar);
  FDatabaseRow.Value[ProcedureQuoteCharOrdinal].SetWideString(FReader.SqlProcedureQuoteChar);
  FDatabaseRow.Value[ProductVersionOrdinal].SetWideString(FReader.Version);
  FDatabaseRow.Value[ProductNameOrdinal].SetWideString(FReader.ProductName);
  FDatabaseRow.Value[QuotePrefixOrdinal].SetWideString(FReader.SqlIdentifierQuotePrefix);
  FDatabaseRow.Value[QuoteSuffixOrdinal].SetWideString(FReader.SqlIdentifierQuoteSuffix);

  FDatabaseRow.Value[SupportsTransactionsOrdinal].SetBoolean(FReader.TransactionsSupported);
  FDatabaseRow.Value[SupportsNestedTransactionsOrdinal].SetBoolean(FReader.NestedTransactionsSupported);
  FDatabaseRow.Value[SupportsRowSetSizeOrdinal].SetBoolean(FReader.SetRowSizeSupported);
  FDatabaseRow.Value[SupportsLowerCaseIdentifiersOrdinal].SetBoolean(FReader.LowerCaseIdentifiersSupported);
  FDatabaseRow.Value[SupportsUpperCaseIdentifiersOrdinal].SetBoolean(FReader.UpperCaseIdentifiersSupported);
  FDatabaseRow.Value[SupportsSPReturnCode].SetBoolean(FReader.SPReturnCodeSupported);
  FDatabaseRow.Value[SupportsParameterMetadata].SetBoolean(FReader.ParameterMetadataSupported);
  FDatabaseRow.Value[SupportsCatalogFunctions].SetBoolean(FReader.CatalogFunctionsSupported);
  if FReader.MultipleCommandsSupported then
    FDatabaseRow.Value[MaxCommandsOrdinal].SetInt32(0)
  else
    FDatabaseRow.Value[MaxCommandsOrdinal].SetInt32(1);

end;


{ TDBXMetaDataDbxReader }

constructor TDBXMetaDataDbxReader.Create(DBXContext: TDBXContext; Row: TDBXMetaDataRow; Cursor: TDBXTable);
var
  Ordinal: Integer;
  Column: TDBXValueType;
  ValueType: TDBXValueType;
  Values: TDBXValueArray;
begin
  Inherited Create(DBXContext, Row, nil);
  FCursor := Cursor;
  SetLength(Values, Length(Cursor.Columns));
  for Ordinal := Low(Values) to High(Values) do
  begin
    Column                   := Cursor.Columns[Ordinal];
    ValueType                := TDBXDriverHelp.CreateTDBXValueType(DBXContext,Row);
    ValueType.DataType       := MapToDBXType(Column.DataType);
    ValueType.SubType        := TDBXDataTypes.UnknownType;
    ValueType.Ordinal        := Ordinal;
    ValueType.Scale          := 0;
    ValueType.Size           := Column.Size;
    ValueType.Name           := Column.Name;
    if (ValueType.DataType = TDBXDataTypes.WideStringType) then
    begin
      if ValueType.Size = 0 then
        ValueType.Size        := 256;
      if ValueType.Precision = 0 then
        ValueType.Precision   := ValueType.Size;
      ValueType.Size := ValueType.Size + 2; // Allow space for the zero terminator.
    end;
    ValueType.ValueTypeFlags := TDBXValueTypeFlags.Nullable or TDBXValueTypeFlags.ReadOnly;
    Values[Ordinal] := TDBXValue.CreateValue(FDBXContext, ValueType, FDbxRow, true);
  end;
  SetValues(Values);
end;

destructor TDBXMetaDataDbxReader.Destroy;
begin
  FreeAndNil(FByteReader);
  FreeAndNil(FCursor);
  inherited Destroy;
end;

function TDBXMetaDataDbxReader.MapToDBXType(ColumnType: Integer): Integer;
begin
  Result := ColumnType;
end;

function  TDBXMetaDataDbxReader.DerivedNext: Boolean;
begin
  if FCursor = nil then
    Result := False
  else
  begin
    Result := FCursor.Next;
    if not Result then
    begin
      FCursor.Close;
      FreeAndNil(FCursor);
    end;
  end;
end;

function TDBXMetaDataDbxReader.GetByteReader: TDBXByteReader;
begin
  if FByteReader = nil then
    FByteReader := TDBXReaderByteReader.Create(FDbxContext, Self);
  Result := FByteReader;
end;

procedure TDBXMetaDataDbxReader.DerivedClose;
begin
  if FCursor <> nil then
  begin
    FCursor.Close;
    FreeAndNil(FCursor);
  end;
end;


{ TDBXMetaDataRow }

constructor TDBXMetaDataRow.Create(DBXContext: TDBXContext; Row: TDBXTableRow);
begin
  Inherited Create(DBXContext);
  FRow := Row;
end;

procedure TDBXMetaDataRow.GetWideString(DbxValue: TDBXWideStringValue; var WideStringBuilder: TDBXWideStringBuilder; var IsNull: LongBool);
var
  Ordinal, SourceSize: Integer;
  Source: String;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
  begin
    Source := FRow.Value[Ordinal].AsString;
    SourceSize := Length(Source);
    if SourceSize >= DbxValue.ValueType.Size then
      TDBXPlatform.ResizeWideStringBuilder(WideStringBuilder, SourceSize + 2);
    TDBXPlatform.CopyWideStringToBuilder(Source, SourceSize + 2, WideStringBuilder);
  end;
end;

procedure TDBXMetaDataRow.GetBoolean(DbxValue: TDBXBooleanValue; var Value: LongBool; var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].AsBoolean
  else
    Value := False;
end;

procedure TDBXMetaDataRow.GetInt16(DbxValue: TDBXInt16Value; var Value: SmallInt; var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].GetInt16
  else
    Value := 0;
end;

procedure TDBXMetaDataRow.GetInt32(DbxValue: TDBXInt32Value; var Value: TInt32; var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].AsInt32
  else
    Value := 0;
end;

procedure TDBXMetaDataRow.GetInt64(DbxValue: TDBXInt64Value; var Value: Int64; var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].GetInt64
  else
    Value := 0;
end;

procedure TDBXMetaDataRow.GetInt8(DbxValue: TDBXInt8Value; var Value: ShortInt;
  var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].GetInt8
  else
    Value := 0;
end;

procedure TDBXMetaDataRow.GetUInt16(DbxValue: TDBXUInt16Value; var Value: Word;
  var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].GetUInt16
  else
    Value := 0;
end;

procedure TDBXMetaDataRow.GetUInt8(DbxValue: TDBXUInt8Value; var Value: Byte;
  var IsNull: LongBool);
var
  Ordinal: Integer;
begin
  Ordinal := DbxValue.ValueType.Ordinal;
  IsNull := FRow.Value[Ordinal].IsNull;
  if not IsNull then
    Value := FRow.Value[Ordinal].GetUInt8
  else
    Value := 0;
end;

end.
