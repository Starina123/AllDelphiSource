{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Data.DbxCompressionFilter"'}    {Do not Localize}
unit Data.DbxCompressionFilter;

interface

uses
  Data.DBXTransport,
  System.SysUtils,
  Data.DBXPlatform
;

type
  TTransportCompressionFilter = class(TTransportFilter)
  private
    FMinThreshold: Integer;
  protected
    function GetParameters: TDBXStringArray; override;
    function GetUserParameters: TDBXStringArray; override;
  public
    constructor Create; override;

    function ProcessInput(const Data: TBytes): TBytes; override;
    function ProcessOutput(const Data: TBytes): TBytes; override;
    function Id: UnicodeString; override;
    function SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;
    function GetParameterValue(const ParamName: UnicodeString): UnicodeString; override;
    function SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;

    property MinThreshold: Integer read FMinThreshold write FMinThreshold;
  end;

implementation

uses
  System.Classes,
  System.ZLib
;

{ TTransportCompressionFilter }

const
  cFilterUnit = 'FilterUnit';
  cCompressionKickIn = 'CompressMoreThan';
  cUnitName = 'DbxCompressionFilter';
  cCompressedData = 1;
  cNoCompression = 2;
  cThreshold = 1024;

constructor TTransportCompressionFilter.Create;
begin
  inherited;
  FMinThreshold := cThreshold;
end;

function TTransportCompressionFilter.GetParameters: TDBXStringArray;
begin
  SetLength(Result, 2);
  Result[0] := cFilterUnit;
  Result[1] := cCompressionKickIn;
end;

function TTransportCompressionFilter.GetParameterValue(
  const ParamName: UnicodeString): UnicodeString;
begin
  if SameText(ParamName, cFilterUnit) then
    Result := cUnitName
  else if SameText(ParamName, cCompressionKickIn) then
    Result := IntToStr(FMinThreshold)
  else
    Result := EmptyStr;
end;

function TTransportCompressionFilter.GetUserParameters: TDBXStringArray;
begin
  SetLength(Result, 1);
  Result[0] := cCompressionKickIn;
end;

function TTransportCompressionFilter.Id: UnicodeString;
begin
  Result := 'ZLibCompression'
end;

function TTransportCompressionFilter.ProcessOutput(const Data: TBytes): TBytes;
var
  InStream: TBytesStream;
  ZStream: TDecompressionStream;
  Len: Int64;
  Buff: TBytes;
begin
  Len := Length(Data)-1;
  if Data[0] = cCompressedData then
  begin
    SetLength(Buff, Len);
    Move(Data[1], Buff[0], Len);
    InStream := TBytesStream.Create(Buff);
    try
      InStream.Position := 0;
      ZStream := TDecompressionStream.Create(InStream);
      try
        Len := ZStream.Size;
        SetLength(Result, Len);
        ZStream.ReadBuffer(Result[0], Len);
      finally
        ZStream.Free;
      end;
    finally
      InStream.Free;
    end;
  end else begin
    SetLength(Result, Len);
    Move(Data[1], Result[0], Len);
  end;
end;

function TTransportCompressionFilter.ProcessInput(const Data: TBytes): TBytes;
var
  OutStream: TMemoryStream;
  ZStream: TCompressionStream;
  Len: Int64;
begin
  if Length(Data) > MinThreshold then
  begin
    OutStream := TMemoryStream.Create;
    try
      ZStream := TCompressionStream.Create(clFastest, OutStream);
      try
        ZStream.WriteBuffer(Data[0], Length(Data));
      finally
        ZStream.Free;
      end;
      Len := OutStream.Size;
      SetLength(Result, Len+1);
      OutStream.Position := 0;
      OutStream.ReadBuffer(Result[1], Len);
      Result[0] := cCompressedData;
    finally
      OutStream.Free;
    end;
  end else begin
    SetLength(Result, Length(Data)+1);
    Move(Data[0], Result[1], Length(Data));
    Result[0] := cNoCompression;
  end;
end;

function TTransportCompressionFilter.SetConfederateParameter(const ParamName,
  ParamValue: UnicodeString): Boolean;
begin
  Result := SetParameterValue(ParamName, ParamValue);
end;

function TTransportCompressionFilter.SetParameterValue(const ParamName,
  ParamValue: UnicodeString): Boolean;
begin
  if SameText(ParamName, cCompressionKickIn) then
  begin
    FMinThreshold := StrToInt(ParamValue);
    Result := true;
  end else
    Result := SameText(ParamName, cFilterUnit) and SameText(ParamValue, cUnitName);
end;

initialization
  TTransportFilterFactory.RegisterFilter(TTransportCompressionFilter);

finalization
  TTransportFilterFactory.UnregisterFilter(TTransportCompressionFilter);

end.
