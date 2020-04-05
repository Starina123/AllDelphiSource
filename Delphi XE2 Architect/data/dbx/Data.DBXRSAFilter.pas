{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXRSAFilter;

interface

uses Data.DBXTransport, System.SysUtils, Data.DBXPlatform, Data.DBXOpenSSL;

const
  USE_GLOBAL = 'UseGlobalKey';
  PUBLIC_KEY = 'PublicKey';
  KEY_LENGTH = 'KeyLength';
  KEY_EXPONENT = 'KeyExponent';

type
  TRSAFilter = class(TTransportFilter)
  private
    FUseGlobalKey: boolean;
    FRSACypher: TRSACypher;
    FKeyLength: Integer;
    FKeyExponent: Int64;
  private
    procedure InitRSA;
  protected
    function GetParameters: TDBXStringArray; override;
    function GetUserParameters: TDBXStringArray; override;
  public
    constructor Create; override;
    destructor Destroy; override;
    function ProcessInput(const Data: TBytes): TBytes; override;
    function ProcessOutput(const Data: TBytes): TBytes; override;
    function Id: UnicodeString; override;
    function SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;
    function GetParameterValue(const ParamName: UnicodeString): UnicodeString; override;
    function SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;
    function IsPublicKeyCryptograph: boolean; override;
  end;

implementation

uses Data.DBXCommon;

{ TRSAFilter }

constructor TRSAFilter.Create;
begin
  inherited;
  FUseGlobalKey := true;
  FKeyLength := RSA_KEY_LENGTH;
  FKeyExponent := RSA_KEY_EXPONENT;
end;

destructor TRSAFilter.Destroy;
begin
  FreeAndNil(FRSACypher);
  inherited;
end;

function TRSAFilter.GetParameters: TDBXStringArray;
begin
  SetLength(Result, 1);
  Result[0] := PUBLIC_KEY;
end;

function TRSAFilter.GetParameterValue(
  const ParamName: UnicodeString): UnicodeString;
begin
  if AnsiCompareStr(ParamName, USE_GLOBAL) = 0  then
  begin
    if FUseGlobalKey then
      exit('true')
    else
      exit('false');
  end;
  if AnsiCompareStr(ParamName, PUBLIC_KEY) = 0  then
  begin
    InitRSA;
    exit(Encode(FRSACypher.GetPublicKey, 0, -1));
  end;
  if AnsiCompareStr(ParamName, KEY_LENGTH) = 0  then
  begin
    exit(IntToStr(FKeyLength));
  end;
  if AnsiCompareStr(ParamName, KEY_EXPONENT) = 0  then
  begin
    exit(IntToStr(FKeyExponent));
  end;
  Result := EmptyStr;
end;

function TRSAFilter.GetUserParameters: TDBXStringArray;
begin
  SetLength(Result, 3);
  Result[0] := USE_GLOBAL;
  Result[1] := KEY_LENGTH;
  Result[2] := KEY_EXPONENT;
end;

function TRSAFilter.Id: UnicodeString;
begin
  Result := 'RSA';
end;

procedure TRSAFilter.InitRSA;
begin
  if FRSACypher = nil then
  begin
    if not TRSACypher.LoadSSLAndCreateKey(FKeyLength, FKeyExponent) then
      raise TDBXError.Create(0, TRSACypher.ErrorLoad);
    if FUseGlobalKey then
      FRSACypher := TRSACypher.Create
    else
    begin
      FRSACypher := TRSACypher.Create(kupUseLocalKey);
      FRSACypher.GenerateKey(FKeyLength, FKeyExponent);
    end;
  end;
end;

function TRSAFilter.IsPublicKeyCryptograph: boolean;
begin
  Result := true;
end;

function TRSAFilter.ProcessInput(const Data: TBytes): TBytes;
begin
  InitRSA;
  Result := FRSACypher.PublicEncrypt(Data)
end;

function TRSAFilter.ProcessOutput(const Data: TBytes): TBytes;
begin
  InitRSA;
  Result := FRSACypher.PrivateDecrypt(Data)
end;

function TRSAFilter.SetConfederateParameter(const ParamName,
  ParamValue: UnicodeString): Boolean;
begin
  if AnsiCompareStr(ParamName, PUBLIC_KEY) = 0  then
  begin
    InitRSA;
    FRSACypher.SetConfederatePublicKey(Decode(ParamValue));
    exit(true);
  end;
  Result := false;
end;

function TRSAFilter.SetParameterValue(const ParamName,
  ParamValue: UnicodeString): Boolean;
begin
  if AnsiCompareStr(ParamName, USE_GLOBAL) = 0  then
  begin
    FUseGlobalKey := AnsiCompareText(ParamValue, 'true') = 0;
    exit(true);
  end;
  if AnsiCompareStr(ParamName, KEY_LENGTH) = 0  then
  begin
    FKeyLength := StrToInt(ParamValue);
    exit(true);
  end;
  if AnsiCompareStr(ParamName, KEY_EXPONENT) = 0  then
  begin
    FKeyExponent := StrToInt64(ParamValue);
    exit(true);
  end;
  exit(false);
end;

end.
