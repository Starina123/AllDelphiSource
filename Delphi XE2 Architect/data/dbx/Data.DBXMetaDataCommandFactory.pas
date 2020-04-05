{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXMetaDataCommandFactory;

interface

uses
  Data.DBXCommon,
  Data.DBXPlatform,
  Data.DBXSqlScanner,
  Data.DBXCommonTable,
  Data.DBXMetaDataReader
;

type
  TDBXMetaDataCommandFactory = class(TDBXCommandFactory)
  public
    class procedure RegisterMetaDataCommandFactory(const ObjectClass: TClass); static;
    class procedure UnRegisterMetaDataCommandFactory(const ObjectClass: TClass); static;
    function CreateCommand(DbxContext: TDBXContext; Connection: TDBXConnection;
      MorphicCommand: TDBXCommand): TDBXCommand; override;
    function CreateMetaDataReader: TDBXMetaDataReader; virtual; abstract;
    function GetProductName: UnicodeString; virtual;
  end;

  TDBXDataExpressProviderContext = class(TDBXProviderContext)
  protected
    FConnection: TDBXConnection;
    FScanner: TDBXSqlScanner;
    FParameterMarker: UnicodeString;
    FMarkerIncludedInParameterName: Boolean;
    FUseAnsiStrings: Boolean;
    FRemoveIsNull: Boolean;
  private
//  procedure BindParametersByName(Command: TDBXCommand; ParameterNames: TDBXStringArray; ParameterValues: TDBXStringArray);
    procedure BindParametersByOrdinal(Command: TDBXCommand; ParameterNames: TDBXStringArray; ParameterValues: TDBXStringArray);
    function FindParameterByName(const ParameterName: UnicodeString; ParameterNames: TDBXStringArray): Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function GetPlatformTypeName(const DataType: Integer;
      const IsUnsigned: Boolean): UnicodeString; override;
    function ExecuteQuery(const Sql: UnicodeString;
      const ParameterNames: TDBXStringArray;
      const ParameterValues: TDBXStringArray): TDBXTable; override;
    function CreateTableStorage(const CollectionName: UnicodeString;
      const Columns: TDBXValueTypeArray): TDBXTable; override;
    function CreateRowStorage(const CollectionName: UnicodeString;
      const Columns: TDBXValueTypeArray): TDBXTableRow; override;
    procedure StartTransaction; override;
    procedure StartSerializedTransaction; override;
    procedure Commit; override;
    procedure Rollback; override;
    function GetVendorProperty(const name: UnicodeString): UnicodeString; override;
  protected
    function GetSqlParameterMarker: UnicodeString;
    function GetMarkerIncludedInParameterName: Boolean;
  public
    property SqlParameterMarker: UnicodeString read FParameterMarker;
    property IsMarkerIncludedInParameterName: Boolean read FMarkerIncludedInParameterName;
    property Connection: TDBXConnection read FConnection write FConnection;
    property UseAnsiStrings: Boolean read FUseAnsiStrings write FUseAnsiStrings;
    property RemoveIsNull: Boolean read FRemoveIsNull write FRemoveIsNull;
  end;

const
  BlackfishSQLProduct = 'BlackfishSQL';          { Do not localize }

implementation

uses
  Data.DBXClassRegistry,
  System.SysUtils,
  Data.DBXReaderTableStorage,
  Data.DBXMetaDataCommand,
  Data.DBXCommonResStrs
;


function TDBXMetaDataCommandFactory.GetProductName: UnicodeString;
begin
  Result := '';
end;

class procedure TDBXMetaDataCommandFactory.RegisterMetaDataCommandFactory(const ObjectClass: TClass);
var
  ClassRegistry: TClassRegistry;
  ClassName: UnicodeString;
begin
  ClassRegistry := TClassRegistry.GetClassRegistry;
  ClassName := ObjectClass.ClassName;
  if not ClassRegistry.HasClass(ClassName) then
    ClassRegistry.RegisterClass(ClassName, ObjectClass, nil); { Do not resource }
end;

class procedure TDBXMetaDataCommandFactory.UnRegisterMetaDataCommandFactory(
  const ObjectClass: TClass);
var
  ClassName: UnicodeString;
begin
  ClassName := ObjectClass.ClassName;
  TClassRegistry.GetClassRegistry.UnRegisterClass(ClassName);
end;

function TDBXMetaDataCommandFactory.CreateCommand(DbxContext: TDBXContext;
  Connection: TDBXConnection; MorphicCommand: TDBXCommand): TDBXCommand;
var
  Reader: TDBXMetaDataReader;
  ProviderContext: TDBXDataExpressProviderContext;
  ProductName: UnicodeString;
begin
  ProductName := GetProductName;
  if (ProductName = '') or (ProductName = Connection.ProductName) then
  begin
    Reader := TDBXMetaDataReader(TDBXDriverHelp.GetMetaDataReader(Connection));
    if Reader = nil then
    begin
      Reader := CreateMetaDataReader;
      ProviderContext := TDBXDataExpressProviderContext.Create;
      ProviderContext.Connection := Connection;
      ProviderContext.UseAnsiStrings := TDBXProviderContext.UseAnsiString(Reader.ProductName);
      if Reader.ProductName <> BlackfishSQLProduct then
        ProviderContext.RemoveIsNull := True;
      Reader.Context := ProviderContext;
      Reader.Version := TDBXConnection(Connection).ProductVersion;
      TDBXDriverHelp.SetMetaDataReader(Connection, Reader);
    end;
    Result := TDBXMetaDataCommand.Create(DBXContext, MorphicCommand, Reader);
  end else
    Result := nil;
end;

constructor TDBXDataExpressProviderContext.Create;
begin
  inherited Create;
end;

destructor TDBXDataExpressProviderContext.Destroy;
begin
  FreeAndNil(FScanner);
  inherited Destroy;
end;

function TDBXDataExpressProviderContext.GetPlatformTypeName(const DataType: Integer; const IsUnsigned: Boolean): UnicodeString;
begin
  case DataType of
    TDBXDataTypes.Uint8Type:
      Result := 'Byte';
    TDBXDataTypes.Int8Type:
      Result := 'ShortInt';
    TDBXDataTypes.UInt16Type:
      Result := 'Word';
    TDBXDataTypes.Int16Type:
      Result := 'SmallInt';
    TDBXDataTypes.UInt32Type,
    TDBXDataTypes.Int32Type:
      Result := 'TInt32';
    TDBXDataTypes.UInt64Type,
    TDBXDataTypes.Int64Type:
      Result := 'Int64';
    TDBXDataTypes.BooleanType:
      Result := 'Boolean';
    TDBXDataTypes.DateType:
      Result := 'TDBXDate';
    TDBXDataTypes.TimeType:
      Result := 'TDBXTime';
    TDBXDataTypes.TimeStampType:
      Result := 'TSQLTimeStamp';
    TDBXDataTypes.IntervalType:
      Result := 'TSQLTimeStamp';
    TDBXDataTypes.TimeStampOffsetType:
      Result := 'TSQLTimeStampOffset';
    TDBXDataTypes.WideStringType:
      Result := 'String';
    TDBXDataTypes.AnsiStringType:
      Result := 'AnsiString';
    TDBXDataTypes.BcdType:
      Result := 'TBcd';
    TDBXDataTypes.SingleType:
      Result := 'Single';
    TDBXDataTypes.DoubleType:
      Result := 'Double';
    TDBXDataTypes.BlobType,
    TDBXDataTypes.BytesType,
    TDBXDataTypes.VarBytesType:
      Result := 'TBytes';
    TDBXDataTypes.ObjectType:
      Result := 'TObject';
    else
      raise Exception.Create(SUnknownDataType);
  end;
end;

function TDBXDataExpressProviderContext.GetSqlParameterMarker: UnicodeString;
begin
  Result := FParameterMarker;
end;

function TDBXDataExpressProviderContext.GetMarkerIncludedInParameterName: Boolean;
begin
  Result := FMarkerIncludedInParameterName;
end;

function TDBXDataExpressProviderContext.ExecuteQuery(const Sql: UnicodeString; const ParameterNames: TDBXStringArray; const ParameterValues: TDBXStringArray): TDBXTable;
var
  Reader: TDBXReader;
  Command: TDBXCommand;
begin
  Command := FConnection.CreateCommand;
  Command.Text := Sql;
  try
    if ParameterValues <> nil then
    begin
      BindParametersByOrdinal(Command, ParameterNames, ParameterValues);
    end;
    Reader := Command.ExecuteQuery;
    if Reader = nil then
      Result := nil
    else
    begin
      Result := TDBXStringTrimTable.CreateTrimTableIfNeeded(TDBXReaderTableStorage.Create(Command,Reader));
      // When the Result is freed, this Command will be freed.
      //
      Command := nil;
    end;
  finally
    FreeAndNil(Command);
  end;
end;

function TDBXDataExpressProviderContext.CreateTableStorage(const CollectionName: UnicodeString; const Columns: TDBXValueTypeArray): TDBXTable;
begin
  Result := nil;
end;

function TDBXDataExpressProviderContext.CreateRowStorage(const CollectionName: UnicodeString; const Columns: TDBXValueTypeArray): TDBXTableRow;
begin
  Result := nil;
end;

procedure TDBXDataExpressProviderContext.StartTransaction;
begin
end;

procedure TDBXDataExpressProviderContext.StartSerializedTransaction;
begin
end;

procedure TDBXDataExpressProviderContext.Commit;
begin
end;

procedure TDBXDataExpressProviderContext.Rollback;
begin
end;

function TDBXDataExpressProviderContext.GetVendorProperty(const name: UnicodeString): UnicodeString;
begin
  Result := FConnection.GetVendorProperty(name);
end;

{
procedure TDBXDataExpressProviderContext.BindParametersByName(Command: TDBXCommand; ParameterNames: TDBXStringArray; ParameterValues: TDBXStringArray);
var
  Parameters: TDBXParameterList;
  Parameter: TDBXParameter;
  Index: Integer;
begin
  Parameters := Command.Parameters;
  for Index := Low(ParameterValues) to High(ParameterValues) do
  begin
    Parameter := Command.CreateParameter;
    Parameter.DataType := TDBXDataTypes.WideStringType;
    Parameter.Name := ParameterNames[Index];
    if ParameterValues[Index] = NullString then
      Parameter.Value.SetNull
    else
      Parameter.Value.SetWideString(ParameterValues[Index]);
    Parameters.AddParameter(Parameter);
  end;
end;
}

procedure TDBXDataExpressProviderContext.BindParametersByOrdinal(Command: TDBXCommand; ParameterNames: TDBXStringArray; ParameterValues: TDBXStringArray);
const
  KeywordIS = 'IS';      { Do not localize }
  KeywordNULL = 'NULL';  { Do not localize }
  SqlTrueValue = '1=1';  { Do not localize }
  SqlFalseValue = '1=2'; { Do not localize }
  DummyValue = 'A';      { Do not localize }
  TokenIS = 1;
  TokenNULL = 2;
var
  Token: Integer;
  StartPos: Integer;
  EndPos: Integer;
  ParameterIndex: Integer;
  Parameters: TDBXParameterList;
  Parameter: TDBXParameter;
  Buffer: TDBXStringBuffer;
  Params: array of Integer;
  Count: Integer;
  Index: Integer;
  NullWasRemoved: Boolean;
begin
  Count := 0;
  StartPos := 1;
  Buffer := nil;
  if FScanner = nil then
  begin
    FScanner := TDBXSqlScanner.Create('','','');
    FScanner.RegisterId(KeywordIS, TokenIS);
    FScanner.RegisterId(KeywordNULL, TokenNULL);
  end;
  FScanner.Init(Command.Text);
  Token := FScanner.NextToken;
  while Token <> TDBXSqlScanner.TokenEos do
  begin
    if (Token <> TDBXSqlScanner.TokenSymbol) or (FScanner.Symbol <> ':') then
      Token := FScanner.NextToken
    else
    begin
      EndPos := FScanner.NextIndex;
      Token := FScanner.NextToken;
      if Token = TDBXSqlScanner.TokenId then
      begin
        if Buffer = nil then
        begin
          Buffer := TDBXStringBuffer.Create(Length(Command.Text));
          SetLength(Params,Length(ParameterNames)*3);
        end;
        Buffer.Append(Copy(Command.Text,StartPos,EndPos-StartPos));
        StartPos := FScanner.NextIndex+1;
        ParameterIndex := FindParameterByName(FScanner.Id, ParameterNames);

        NullWasRemoved := false;
        if RemoveIsNull then
        begin
          if (FScanner.LookAtNextToken = TokenIS) then
          begin
            FScanner.NextToken;
            if FScanner.LookAtNextToken = TokenNull then
            begin
              FScanner.NextToken;
              StartPos := FScanner.NextIndex+1;
              NullWasRemoved := true;
              if ParameterValues[ParameterIndex] = NullString then
                Buffer.Append(SqlTrueValue)
              else
                Buffer.Append(SqlFalseValue)
            end;
          end;
        end;

        if not NullWasRemoved then
        begin
          Buffer.Append('?');

          if Length(Params) <= Count then
            SetLength(Params, Count+2);
          Params[Count] := ParameterIndex;
          Inc(Count);
        end;
      end;
    end;
  end;
  if Buffer <> nil then
  begin
    Buffer.Append(Copy(Command.Text,StartPos,Length(Command.Text)-StartPos+1));
    Command.Text := Buffer.ToString;
    Parameters := Command.Parameters;
    Parameters.ClearParameters;
    for Index := 0 to Count - 1 do
    begin
      ParameterIndex := Params[Index];
      Parameter := Command.CreateParameter;

      if UseAnsiStrings then
        Parameter.DataType := TDBXDataTypes.AnsiStringType
      else
        Parameter.DataType := TDBXDataTypes.WideStringType;

      if RemoveIsNull and (ParameterValues[ParameterIndex] = NullString) then
        ParameterValues[ParameterIndex] := DummyValue;
      if (ParameterValues[ParameterIndex] = NullString) then
        Parameter.Value.SetNull
      else if UseAnsiStrings then
        Parameter.Value.SetAnsiString(AnsiString(ParameterValues[ParameterIndex]))
      else
        Parameter.Value.SetString(ParameterValues[ParameterIndex]);

      Parameters.AddParameter(Parameter);
    end;
    FreeAndNil(Buffer);
    Params := nil;
  end;
end;

function TDBXDataExpressProviderContext.FindParameterByName(const ParameterName: UnicodeString; ParameterNames: TDBXStringArray): Integer;
var
  Index: Integer;
  Found: Boolean;
begin
  Index := High(ParameterNames);
  Found := False;
  while not Found and (Index >= Low(ParameterNames)) do
  begin
    if ParameterNames[Index] = ParameterName then
      Found := True
    else
      Dec(Index);
  end;
  if not Found then
    raise Exception.Create('ParameterName not found: '+ParameterName);
  Result := Index;
end;

end.



