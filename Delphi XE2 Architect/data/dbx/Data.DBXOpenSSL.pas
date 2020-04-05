{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXOpenSSL;

interface

uses
  System.SysUtils,
  IPPeerAPI
;

const
  RSA_KEY_LENGTH = 1024;
  RSA_KEY_EXPONENT = 3;

type
  TKeyUsagePolicy = (kupUseGlobalKey, kupUseLocalKey);

  TRSACypher = class sealed
    strict private
      class var GLOBAL_RSA_KEY: PRSAPeer;
      class var OPEN_SSL_LOADED: boolean;
      class var OPEN_SSL_LOAD_STATUS: boolean;
      class var ERR_LOAD: String;
      class var KEY_MONITOR: TObject;
      class var FIPPeerProcs: IIPPeerProcs;
      class var FIPImplementationID: string;

      FLocalKey: PRSAPeer;
      FConfederatedKey: PRSAPeer;

      FKeyUsagePolicy: TKeyUsagePolicy;

    private
      class procedure Init;
      class procedure Clear;
      class function IPPeerProcs: IIPPeerProcs;
      class procedure GenerateRSAKey(keyLength: Integer; exponent: Integer;
                                     monitor: TObject; var Key: PRSAPeer);
      function GetPrivateKey: PRSAPeer;
      function GetSynchMonitor: TObject;
    protected
      class function SSLErrorMessage: String;
      class procedure ClearKey(var AKey: PRSAPeer);

    public
      ///  <summary>Allows user to specify non-default IP Implementation for SSL operation implementations</summary>
      ///  <remarks>If the SSL has already been loaded, this will raise an exception</remarks>
      ///  <param name="AIPImplementationID">name of IP implementation ID to use instead of default</param>
      procedure InitSSLIPImplementationID(const AIPImplementationID: string);

      ///  <summary>Lazy loading of Open SSL library</summary>
      ///  <returns>true if the SSL library was successfully loaded and all
      ///    cyphers are available. Returns false if an error occurs</returns>
      class function LoadSSL: boolean; overload;
      ///  <summary>Lazy loading of Open SSL library and creates the global RSA key</summary>
      ///  <remarks>If the key generation fails a TDBXError exception is thrown</remarks>
      ///  <param name="keyLength">key length, default RSA_KEY_LENGTH</param>
      ///  <param name="exponent">key exponent, needs to be a prime number, default RSA_KEY_EXPONENT</param>
      class function LoadSSLAndCreateKey(keyLength: Integer = RSA_KEY_LENGTH; exponent: int64 = RSA_KEY_EXPONENT): boolean; overload;
      ///  <summary>Returns the load error message</summary>
      ///  <returns>String: the error message</returns>
      class function ErrorLoad: String;
      ///  <summary>Generates the global RSA key pair</summary>
      ///  <remarks>If the key generation fails a TDBXError exception is thrown</remarks>
      ///  <param name="keyLength">key length, default RSA_KEY_LENGTH</param>
      ///  <param name="exponent">key exponent, needs to be a prime number, default RSA_KEY_EXPONENT</param>
      class procedure GenerateGlobalKey(keyLength: Integer = RSA_KEY_LENGTH; exponent: int64 = RSA_KEY_EXPONENT);

      constructor Create; overload;
      constructor Create(KeyUsagePolicy: TKeyUsagePolicy); overload;
      destructor Destroy; override;

      ///  <summary>Generates the global RSA key pair</summary>
      ///  <remarks>If the key generation fails a TDBXError exception is thrown</remarks>
      ///  <param name="keyLength">key length, default RSA_KEY_LENGTH</param>
      ///  <param name="exponent">key exponent, needs to be a prime number, default RSA_KEY_EXPONENT</param>
      procedure GenerateKey(keyLength: Integer = RSA_KEY_LENGTH; exponent: int64 = RSA_KEY_EXPONENT);
      ///  <summary>Returns the public key of the used key. If the policy is local
      ///    then the local key is used, otherwise the global key is used</summary>
      ///  <remarks>If the Open SSL library is not loaded it throws a TDBXError</remarks>
      ///  <returns>TBytes data with the public key</returns>
      function GetPublicKey: TBytes;
      ///  <summary>Sets the public key so encryption is possible</summary>
      ///  <remarks>The public key was obtained through a reciprocal call of GetPublicKey</remarks>
      ///  <param name="publicKey">TBytes with the confederated public key</param>
      procedure SetConfederatePublicKey(publicKey: TBytes);
      ///  <summary>Decrypts data using the private key</summary>
      ///  <remarks>Decryption is done with the key set according to the policy.
      ///    For reason of speed noo checks are made about the instance being properly setup</remarks>
      ///  <param name="data">Encrypted data to be decrypted</param>
      function PrivateDecrypt(data: TBytes): TBytes;
      ///  <summary>Encrypts the clear data using the public key</summary>
      ///  <remarks>The instance is expected to be properly setup (confederated key, policy).
      ///    The data size is expected to be less then the key size - 11.</remarks>
      ///  <param name="data">Data bytes to be encrypted</param>
      function PublicEncrypt(data: TBytes): TBytes;
  end;

implementation

uses Data.DBXCommon, Data.DBXOpenSSLRes, System.Math;

{ TRSACypher }

class procedure TRSACypher.Clear;
begin
  ClearKey(GLOBAL_RSA_KEY);
  KEY_MONITOR.Free;
end;

class procedure TRSACypher.ClearKey(var AKey: PRSAPeer);
begin
  if AKey <> nil then
    IPPeerProcs._RSA_free(AKey);
  AKey := nil;
end;

constructor TRSACypher.Create;
begin
  FKeyUsagePolicy := kupUseGlobalKey;
  FLocalKey := nil;
  FConfederatedKey := nil;
end;

constructor TRSACypher.Create(KeyUsagePolicy: TKeyUsagePolicy);
begin
  FKeyUsagePolicy := KeyUsagePolicy;
end;

destructor TRSACypher.Destroy;
begin
  ClearKey(FLocalKey);
  ClearKey(FConfederatedKey);

  inherited;
end;

class function TRSACypher.ErrorLoad: String;
begin
  Result := ERR_LOAD;
end;

class procedure TRSACypher.GenerateGlobalKey(keyLength: Integer; exponent: int64);
begin
  GenerateRSAKey(keyLength, exponent, KEY_MONITOR, GLOBAL_RSA_KEY);
end;

procedure TRSACypher.GenerateKey(keyLength: Integer; exponent: int64);
begin
  if FKeyUsagePolicy = kupUseGlobalKey then
    GenerateGlobalKey(keyLength, exponent)
  else
    GenerateRSAKey(keyLength, exponent, self, FLocalKey);
end;

class procedure TRSACypher.GenerateRSAKey(keyLength, exponent: Integer; monitor: TObject; var Key: PRSAPeer);
var
  err: String;
begin
  if OPEN_SSL_LOAD_STATUS then
  begin
    TMonitor.Enter(monitor);
    try
      ClearKey(Key);

      //make exponent valid. Must be an odd number
      if exponent < 3 then
        exponent := 3
      else if not Odd(exponent) then
      begin
        Inc(exponent);
      end;

      Key := IPPeerProcs._RSA_generate_key(keyLength, exponent);
      if Key = nil then
      begin
        err := SSLErrorMessage;
        if err = EmptyStr then
          err := SKeyCannotBeGenerated;
        raise TDBXError.Create(0, err);
      end;
    finally
      TMonitor.Exit(monitor);
    end;
  end
  else
    raise TDBXError.Create(0, SOpenSSLNotLoaded);
end;

function TRSACypher.GetPrivateKey: PRSAPeer;
begin
  if FKeyUsagePolicy = kupUseGlobalKey then
    Result := GLOBAL_RSA_KEY
  else
    Result := FLocalKey;
end;

function TRSACypher.GetPublicKey: TBytes;
var
  length: Integer;
  bufAddr: PAnsiChar;
  key: PRSAPeer;
  monitor: TObject;
begin
  if OPEN_SSL_LOADED then
  begin
    if FKeyUsagePolicy = kupUseGlobalKey then
    begin
      monitor := KEY_MONITOR;
      key := GLOBAL_RSA_KEY;
    end
    else
    begin
      monitor := self;
      key := FLocalKey;
    end;

    TMonitor.Enter(monitor);
    try
      length := IPPeerProcs._i2d_RSAPublicKey(key, nil);
      SetLength(Result, length);
      bufAddr := Addr(Result[0]);
      IPPeerProcs._i2d_RSAPublicKey(key, @bufAddr);
    finally
      TMonitor.Exit(monitor);
    end;
  end
  else
    raise TDBXError.Create(0, SOpenSSLNotLoaded);
end;

function TRSACypher.GetSynchMonitor: TObject;
begin
  if FKeyUsagePolicy = kupUseGlobalKey then
    Result := KEY_MONITOR
  else
    Result := self;
end;

class procedure TRSACypher.Init;
begin
  OPEN_SSL_LOADED := false;
  OPEN_SSL_LOAD_STATUS := false;
  GLOBAL_RSA_KEY := nil;
  FIPPeerProcs := nil;
  FIPImplementationID := '';
  KEY_MONITOR := TObject.Create;
end;

procedure TRSACypher.InitSSLIPImplementationID(
  const AIPImplementationID: string);
begin
  if FIPPeerProcs <> nil then
    raise TDBXError.Create(0, sSSLAlreadyLoaded);
  FIPImplementationID := AIPImplementationID;
end;

class function TRSACypher.IPPeerProcs: IIPPeerProcs;
begin
  if FIPPeerProcs = nil then
    FIPPeerProcs := IPProcs(FIPImplementationID);
  Result := FIPPeerProcs;
end;

class function TRSACypher.LoadSSLAndCreateKey(keyLength: Integer; exponent: int64): boolean;
begin
  if OPEN_SSL_LOADED then
    exit(OPEN_SSL_LOAD_STATUS)
  else if LoadSSL then
  begin
    GenerateGlobalKey(keyLength, exponent);
    exit(true);
  end;
  exit(false);
end;

class function TRSACypher.LoadSSL: boolean;
begin
  if OPEN_SSL_LOADED then
    exit(OPEN_SSL_LOAD_STATUS);
  // try to load it
  OPEN_SSL_LOADED := true;
  try
    if IPPeerProcs._SSLLoad() then
    begin
      IPPeerProcs._ERR_load_crypto_strings();
      IPPeerProcs._OpenSSL_add_all_ciphers();
      OPEN_SSL_LOAD_STATUS := true;
      exit(true);
    end
    else
    begin
      OPEN_SSL_LOAD_STATUS := false;
      ERR_LOAD := SOpenSSLLoadError;
      exit(false);
    end;
  except
    on ex: Exception do
    begin
      OPEN_SSL_LOAD_STATUS := false;
      ERR_LOAD := ex.Message;
      exit(false);
    end;
  end;
end;

function TRSACypher.PrivateDecrypt(data: TBytes): TBytes;
var
  keyLength: Integer;
  key: PRSAPeer;
  monitor: TObject;
  dataIdx, resultIdx: Integer;
  dataLength: Integer;
begin
  key := GetPrivateKey;
  monitor := GetSynchMonitor;
  keyLength := IPPeerProcs._RSA_size(key);
  dataIdx := 0;
  resultIdx := 0;

  while dataIdx < Length(data) do
  begin
    SetLength(Result, resultIdx + keyLength);
    keyLength := min(keyLength, Length(data) - dataIdx);

    TMonitor.Enter(monitor);
    try
      dataLength := IPPeerProcs._RSA_private_decrypt(keyLength, Pointer(IntPtr(Pointer(data)) + dataIdx),
                                     Pointer(IntPtr(Pointer(Result)) + resultIdx),
                                     key, IPPeerProcs.RSA_PKCS1_PADDING);
      if dataLength = -1 then
        raise TDBXError.Create(0, SSLErrorMessage);

      if dataLength <> keyLength then
        SetLength(Result, resultIdx + dataLength);

      Inc(resultIdx, dataLength);
      Inc(dataIdx, keyLength);
    finally
      TMonitor.Exit(monitor);
    end;
  end;
end;

function TRSACypher.PublicEncrypt(data: TBytes): TBytes;
var
  keyLength: Integer;
  maxLen: Integer;
  dataIdx, resultIdx: Integer;
begin
  keyLength := IPPeerProcs._RSA_size(FConfederatedKey);
  maxLen := keyLength - 11;
  dataIdx := 0;
  resultIdx := 0;

  while dataIdx < Length(data) do
  begin
    SetLength(Result, resultIdx + keyLength);
    maxLen := min(maxLen, Length(data) - dataIdx);

    TMonitor.Enter(self);
    try
      keyLength := IPPeerProcs._RSA_public_encrypt(maxLen, Pointer(IntPtr(Pointer(data)) + dataIdx),
                                     Pointer(IntPtr(Pointer(Result)) + resultIdx),
                                     FConfederatedKey, IPPeerProcs.RSA_PKCS1_PADDING);
      if keyLength = -1 then
        raise TDBXError.Create(0, SSLErrorMessage);
    finally
      TMonitor.Exit(self);
    end;

    Inc(dataIdx, maxLen);
    Inc(resultIdx, keyLength);
  end;
end;

procedure TRSACypher.SetConfederatePublicKey(publicKey: TBytes);
var
  bufAddr: PAnsiChar;
begin
  bufAddr := Addr(publicKey[0]);
  TMonitor.Enter(self);
  try
    ClearKey(FConfederatedKey);
    FConfederatedKey := IPPeerProcs._d2i_RSAPublicKey( nil, @bufAddr, Length(publicKey));
    if FConfederatedKey = nil then
      raise TDBXError.Create(0, SSLErrorMessage);
  finally
    TMonitor.Exit(self);
  end;
end;

class function TRSACypher.SSLErrorMessage: String;
var
  buff: array [0..1023] of char;
begin
  IPPeerProcs._ERR_error_string(IPPeerProcs._ERR_get_error(), @buff);

  Result := buff;
end;

initialization
  TRSACypher.Init;

finalization
  TRSACypher.Clear;

end.
