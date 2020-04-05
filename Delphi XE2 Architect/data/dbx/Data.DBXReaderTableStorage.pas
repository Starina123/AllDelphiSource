{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXReaderTableStorage;

interface

uses
  Data.DBXCommon,
  Data.DBXCommonTable,
  Data.FMTBcd
;

type
  TDBXReaderTableStorage = class(TDBXRowTable)
  private
    FLastNext: Boolean;
    FCommand: TDBXCommand;
    FReader: TDBXReader;
    FColumns: TDBXValueTypeArray;
    FNextCalled: Boolean;
//    function ToColumnType(DataType: Integer): Integer;
  public
    constructor Create(Command: TDBXCommand; Reader: TDBXReader);
    destructor Destroy; override;
    function GetOrdinal(const ColumnName: UnicodeString): Integer; override;
    function First: Boolean; override;
    function Next: Boolean; override;
    function InBounds: Boolean; override;
    procedure Close; override;
  protected
    function GetWritableValue(const Ordinal: Integer): TDBXWritableValue; override;
    function GetColumns: TDBXValueTypeArray; override;
    function GetStorage: TObject; override;
    function GetCommand: TObject; override;
  end;


  TBcdObject = class
  public
    constructor Create(Bcd: TBcd);
  private
    FBcd: TBcd;
  public
    property BcdValue: TBcd read FBcd;
  end;

implementation

uses
  Data.DBXPlatform,
  System.SysUtils,
  Data.DBXCommonResStrs
;

constructor TDBXReaderTableStorage.Create(Command: TDBXCommand; Reader: TDBXReader);
begin
  Inherited Create(nil, nil);
  FCommand := Command;
  FReader := Reader;
end;

destructor TDBXReaderTableStorage.Destroy;
begin
  Close;
  FreeObjectArray(TDBXFreeArray(FColumns));
  inherited Destroy;
end;

function TDBXReaderTableStorage.GetCommand: TObject;
begin
  Result := FCommand;
  FCommand := nil;
end;

function TDBXReaderTableStorage.GetOrdinal(
  const ColumnName: UnicodeString): Integer;
begin
  Result := FReader.GetOrdinal(ColumnName);
end;

function TDBXReaderTableStorage.First: Boolean;
begin
  if FNextCalled then
    raise Exception.Create(SUnsupportedOperation);
  Result := True;
end;

function TDBXReaderTableStorage.Next: Boolean;
begin
  FNextCalled := True;
  Result := FReader.Next;
  FLastNext := Result;
end;

function TDBXReaderTableStorage.InBounds: Boolean;
begin
  if not FNextCalled then
    Next;
  Result := FLastNext;
end;

procedure TDBXReaderTableStorage.Close;
begin
  FreeAndNil(FReader);
  FreeAndNil(FCommand);
end;

function TDBXReaderTableStorage.GetColumns: TDBXValueTypeArray;
var
  Ordinal: Integer;
  ValueType: TDBXValueType;
begin
  if FColumns = nil then
  begin
    SetLength(FColumns, FReader.ColumnCount);
    for Ordinal := Low(FColumns) to High(FColumns) do
    begin
      ValueType := FReader.ValueType[Ordinal];
      FColumns[Ordinal] := TDBXValueType.Create;
      FColumns[Ordinal].Name      := ValueType.Name;
      FColumns[Ordinal].DisplayName   := ValueType.DisplayName;
      FColumns[Ordinal].DataType  := ValueType.DataType;
      FColumns[Ordinal].SubType  := ValueType.SubType;
      FColumns[Ordinal].Size      := ValueType.Size;
      FColumns[Ordinal].Precision := ValueType.Precision;
    end;
  end;
  Result := FColumns;
end;

//function TDBXReaderTableStorage.ToColumnType(DataType: Integer): Integer;
//begin
//  case DataType of
//    TDBXDataTypes.AnsiStringType,
//    TDBXDataTypes.WideStringType:
//      Result := TDBXColumnType.Varchar;
//    TDBXDataTypes.BooleanType:
//      Result := TDBXColumnType.Boolean;
//    TDBXDataTypes.Int16Type:
//      Result := TDBXColumnType.Short;
//    TDBXDataTypes.Int32Type:
//      Result := TDBXColumnType.Int;
//    TDBXDataTypes.Int64Type:
//      Result := TDBXColumnType.Long;
//    TDBXDataTypes.BcdType:
//      Result := TDBXColumnType.Decimal;
//    else
//      Result := TDBXColumnType.Notype;
//  end;
//end;

function TDBXReaderTableStorage.GetStorage: TObject;
begin
  Result := FReader;
end;


function TDBXReaderTableStorage.GetWritableValue(const Ordinal: Integer): TDBXWritableValue;
begin
  Result := TDBXWritableValue(FReader.Value[Ordinal]);
end;

constructor TBcdObject.Create(Bcd: TBcd);
begin
  inherited Create;
  FBcd := Bcd;
end;



end.

