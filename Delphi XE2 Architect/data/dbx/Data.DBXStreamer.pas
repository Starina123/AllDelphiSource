{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXStreamer;

interface

uses
  Data.DBXCommon,
  Data.DBXCommonTable,
  Data.DBXStream;

type
  TDBXJSonReader = class(TDBXReader)
  public
    constructor Create(const DbxContext: TDBXContext; const ADbxRow: TDBXRow; const ARowHandle: Integer; const ACommandHandle: Integer; const ADbxValues: TDBXWritableValueArray; const ADbxReader: TDBXJSonStreamReader; const ADbxWriter: TDBXJSonStreamWriter; const ADbxRowBuffer: TDBXRowBuffer; const Updateable: Boolean);
    destructor Destroy; override;
    function ReadFirstData: Boolean;
    procedure DerivedClose; override;
    function DerivedNext: Boolean; override;
  protected
    function GetRowHandle: Integer; override;
    function GetByteReader: TDBXByteReader; override;
    function IsUpdateable: Boolean; override;
  private
    function ReadData: Boolean;
  private
    FPosition: Int64;
    FCommandHandle: Integer;
    FRowHandle: Integer;
    FDbxReader: TDBXJSonStreamReader;
    FDbxWriter: TDBXJSonStreamWriter;
    FDbxRowBuffer: TDBXRowBuffer;
    FUpdateable: Boolean;
    FReadLastBuffer: Boolean;
    FByteReader: TDBXByteReader;
    FInitialized: Boolean;
  end;

implementation
uses
  Data.DBXClient,
  Data.DBXPlatform,
  System.SysUtils;

constructor TDBXJSonReader.Create(const DbxContext: TDBXContext; const ADbxRow: TDBXRow; const ARowHandle: Integer; const ACommandHandle: Integer; const ADbxValues: TDBXWritableValueArray; const ADbxReader: TDBXJSonStreamReader; const ADbxWriter: TDBXJSonStreamWriter; const ADbxRowBuffer: TDBXRowBuffer; const Updateable: Boolean);
begin
  inherited Create(DbxContext, ADbxRow, nil);
  FRowHandle := ARowHandle;
  FCommandHandle := ACommandHandle;
  FDbxReader := ADbxReader;
  FDbxWriter := ADbxWriter;
  FDbxRowBuffer := ADbxRowBuffer;
  SetValues(ADbxValues);
  FPosition := -1;
  FDbxRowBuffer.ColumnCount := ColumnCount;
end;

destructor TDBXJSonReader.Destroy;
begin
  FreeAndNil(FDbxRowBuffer);
  FreeAndNil(FByteReader);
  inherited Destroy;
end;

function TDBXJSonReader.ReadFirstData: Boolean;
begin
  if not FInitialized then
  begin
    FInitialized := True;
    Exit(ReadData);
  end;
  Result := False;
end;

function TDBXJSonReader.GetRowHandle: Integer;
begin
  Result := FRowHandle;
end;

function TDBXJSonReader.GetByteReader: TDBXByteReader;
begin
  if FByteReader = nil then
    FByteReader := TDBXJSonByteReader.Create(DBXContext, RowHandle, self, FDbxReader, FDbxWriter, FDbxRowBuffer);
  Result := FByteReader;
end;

procedure TDBXJSonReader.DerivedClose;
begin
  if (FDbxWriter <> nil) and (FRowHandle >= 0) then
    FDbxWriter.WriteReaderCloseObject(FRowHandle, FCommandHandle);
  FreeAndNil(FByteReader);
end;

function TDBXJSonReader.DerivedNext: Boolean;
begin
  if FPosition < 0 then
  begin
    FPosition := 0;
    Result := (FDbxRowBuffer.ReadSize > 0);
  end
  else if FDbxRowBuffer.NextRow then
  begin
    FPosition := FPosition + 1;
    Result := True;
  end
  else 
  begin
    if FReadLastBuffer then
      Result := False
    else 
    begin
      if FDbxRowBuffer.Client then
        FDbxWriter.WriteClientNextObject(FRowHandle, FPosition + 1, FCommandHandle)
      else 
        FDbxWriter.WriteServerNextObject(FRowHandle, FPosition + 1, FCommandHandle);
      FDbxWriter.Flush;
      if ReadData then
      begin
        FPosition := FPosition + 1;
        Exit(True);
      end;
      Result := False;
    end;
  end;
end;

function TDBXJSonReader.IsUpdateable: Boolean;
begin
  Result := FUpdateable;
end;

function TDBXJSonReader.ReadData: Boolean;
var
  DataSize: Integer;
  ResultCode: Integer;
  HasData: Boolean;
  Buffer: TBytes;
begin
  HasData := False;
  FDbxReader.Next(TDBXTokens.ObjectStartToken);
  FDbxReader.Next(TDBXTokens.StringStartToken);
  ResultCode := FDbxReader.ReadStringCode;
  if ResultCode = TDBXStringCodes.Data then
  begin
    FDbxReader.Next(TDBXTokens.NameSeparatorToken);
    FDbxReader.Next(TDBXTokens.ArrayStartToken);
    DataSize := FDbxReader.ReadInt;
    if DataSize > 0 then
      FReadLastBuffer := False
    else 
    begin
      FReadLastBuffer := True;
      DataSize := -DataSize;
    end;
    if DataSize <> 0 then
    begin
      Buffer := FDbxRowBuffer.Buffer;
      if Length(Buffer) < DataSize then
      begin
        FDbxRowBuffer.Growbuf(DataSize - Length(Buffer));
        Buffer := FDbxRowBuffer.Buffer;
      end;
      FDbxReader.Next(TDBXTokens.ValueSeparatorToken);
      FDbxReader.ReadDataBytes(FDbxRowBuffer.Buffer, 0, DataSize);
      HasData := True;
    end;
    FDbxRowBuffer.ReadSize := DataSize;
  end
  else if ResultCode = TDBXStringCodes.Error then
    FDbxReader.ReadErrorBody;
  FDbxReader.SkipToEndOfObject;
  Result := HasData;
end;

end.
