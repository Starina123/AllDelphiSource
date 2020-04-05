{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.RESTObjects;

interface

uses
  System.Classes, System.Generics.Collections, System.JSON,
  REST.Types, REST.Client;

const
  AUTH_CRYPTO_VALUE: word = 47011;

type
  TRESTAuthMethod = (amNONE, amSIMPLE, amBASIC, amOAUTH, amOAUTH2);
  TRESTAuthMethods = set of TRESTAuthMethod;

  TRESTRequestParams = class(TObject)
  private
    FMethod: TRESTRequestMethod;
    FURL: string;
    FResource: string;
    FContentType: string;

    FAuthMethod: TRESTAuthMethod;
    FAuthUsername: string;
    FAuthUsernameKey: string;
    FAuthPassword: string;
    FAuthPasswordKey: string;

    // oauth1 & oauth2
    FClientID: string;
    FClientSecret: string;
    FAuthCode: string;
    FAccessToken: string;
    FAccessTokenSecret: string;
    FRequestToken: string;
    FRequestTokenSecret: string;
    FRefreshToken: string;
    FOAuth1SignatureMethod: string;
    FOAuth2ResponseType: string;

    FEndpointAuth: string;
    FEndpointAccessToken: string;
    FEndpointRequestToken: string;
    FEndpointRedirect: string;

    FAuthScope: string;

    FCustomParams: TRESTRequestParameterList;
    FCustomBody: TMemoryStream;
  protected
    procedure SetResource(const AValue: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ResetToDefaults;

    procedure Assign(ASource: TRESTRequestParams);

    function AsJSONObject: TJSONObject;
    procedure FromJSONObject(const AJSONObject: TJSONObject);

    procedure SaveToFile(const AFilename: string);
    procedure LoadFromFile(const AFilename: string);

    function ToString: string; override;

    property URL: string read FURL write FURL;
    property Resource: string read FResource write SetResource;
    property Method: TRESTRequestMethod read FMethod write FMethod;
    property ContentType: string read FContentType write FContentType;

    property AuthMethod: TRESTAuthMethod read FAuthMethod write FAuthMethod;
    property AuthUsername: string read FAuthUsername write FAuthUsername;
    property AuthUsernameKey: string read FAuthUsernameKey
      write FAuthUsernameKey;
    property AuthPassword: string read FAuthPassword write FAuthPassword;
    property AuthPasswordKey: string read FAuthPasswordKey
      write FAuthPasswordKey;

    property ClientID: string read FClientID write FClientID;
    property ClientSecret: string read FClientSecret write FClientSecret;
    property AuthCode: string read FAuthCode write FAuthCode;
    property AccessToken: string read FAccessToken write FAccessToken;
    property AccessTokenSecret: string read FAccessTokenSecret
      write FAccessTokenSecret;
    property RequestToken: string read FRequestToken write FRequestToken;
    property RequestTokenSecret: string read FRequestTokenSecret
      write FRequestTokenSecret;
    property RefreshToken: string read FRefreshToken write FRefreshToken;
    property OAuth1SignatureMethod: string read FOAuth1SignatureMethod
      write FOAuth1SignatureMethod;
    property OAuth2ResponseType: string read FOAuth2ResponseType
      write FOAuth2ResponseType;

    property EndpointAuth: string read FEndpointAuth write FEndpointAuth;
    property EndpointAccessToken: string read FEndpointAccessToken
      write FEndpointAccessToken;
    property EndpointRequestToken: string read FEndpointRequestToken
      write FEndpointRequestToken;
    property EndpointRedirect: string read FEndpointRedirect
      write FEndpointRedirect;

    property AuthScope: string read FAuthScope write FAuthScope;

    property CustomBody: TMemoryStream read FCustomBody;
    property CustomParams: TRESTRequestParameterList read FCustomParams;
  end;

  TRESTRequestParamsList = TList<TRESTRequestParams>;
  TRESTRequestParamsObjectList = TObjectList<TRESTRequestParams>;

var
  DefaultRESTAuthMethod: TRESTAuthMethod = amNONE;

function RESTRequestMethodFromString(const ARequestMethod: string): TRESTRequestMethod;

function RESTAuthMethodToString(const AAuthMethod: TRESTAuthMethod): string;
function RESTAuthMethodFromString(const AAuthMethod: string): TRESTAuthMethod;

function SimpleEncryptStr(const S: String; Key: word): string;
function SimpleDecryptStr(const S: String; Key: word): string;

implementation

uses
  System.StrUtils, System.SysUtils,
  IdGlobal, IdCoderMIME,
  REST.Consts;

function RESTRequestMethodFromString(const ARequestMethod: string): TRESTRequestMethod;
begin
  if SameText(ARequestMethod, 'GET') then
    Result := TRESTRequestMethod.rmGET
  else if SameText(ARequestMethod, 'POST') then
    Result := TRESTRequestMethod.rmPOST
  else if SameText(ARequestMethod, 'PUT') then
    Result := TRESTRequestMethod.rmPUT
  else if SameText(ARequestMethod, 'DELETE') then
    Result := TRESTRequestMethod.rmDELETE
  else if SameText(ARequestMethod, 'PATCH') then
    Result := TRESTRequestMethod.rmPATCH
  else
    raise Exception.Create(sRESTUnsupportedRequestMethod);
end;

function RESTAuthMethodToString(const AAuthMethod: TRESTAuthMethod): string;
begin
  case AAuthMethod of
    amNONE:
      Result := 'NONE';
    amSIMPLE:
      Result := 'SIMPLE';
    amBASIC:
      Result := 'BASIC';
    amOAUTH:
      Result := 'OAUTH';
    amOAUTH2:
      Result := 'OAUTH2';
  else
    Result := '--unknown--';
  end;
end;

function RESTAuthMethodFromString(const AAuthMethod: string): TRESTAuthMethod;
begin
  if SameText(AAuthMethod, 'NONE') then
    Result := amNONE
  else if SameText(AAuthMethod, 'SIMPLE') then
    Result := amSIMPLE
  else if SameText(AAuthMethod, 'BASIC') then
    Result := amBASIC
  else if SameText(AAuthMethod, 'OAUTH') then
    Result := amOAUTH
  else if SameText(AAuthMethod, 'OAUTH2') then
    Result := amOAUTH2
  else
    raise Exception.Create(sRESTUnsupportedAuthMethod);
end;

const
  CKEY1 = 53761;
  CKEY2 = 32618;

function SimpleEncryptStr(const S: string; Key: word): string;
var
  i: Integer;
  RStr: RawByteString;
  RStrB: TBytes absolute RStr;
begin
  Result := '';
  RStr := UTF8Encode(S);
  for i := 0 to Length(RStr) - 1 do
  begin
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (RStrB[i] + Key) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr) - 1 do
    Result := Result + IntToHex(RStrB[i], 2);
end;

function SimpleDecryptStr(const S: String; Key: word): string;
var
  i, tmpKey: Integer;
  RStr: RawByteString;
  RStrB: TBytes absolute RStr;
  tmpStr: string;
begin
  tmpStr := UpperCase(S);
  SetLength(RStr, Length(tmpStr) div 2);
  i := 1;
  try
    while (i < Length(tmpStr)) do
    begin
      RStrB[i div 2] := StrToInt('$' + tmpStr[i] + tmpStr[i + 1]);
      Inc(i, 2);
    end;
  except
    Result := '';
    Exit;
  end;
  for i := 0 to Length(RStr) - 1 do
  begin
    tmpKey := RStrB[i];
    RStrB[i] := RStrB[i] xor (Key shr 8);
    Key := (tmpKey + Key) * CKEY1 + CKEY2;
  end;
  Result := UTF8ToString(RStr);
end;

{ TRESTRequestParams }

constructor TRESTRequestParams.Create;
begin
  inherited;

  FCustomParams := TRESTRequestParameterList.Create(nil);
  FCustomBody := TMemoryStream.Create;

  ResetToDefaults;
end;

destructor TRESTRequestParams.Destroy;
begin
  ResetToDefaults;

  FreeAndNIL(FCustomBody);
  FreeAndNIL(FCustomParams);

  inherited;
end;

procedure TRESTRequestParams.ResetToDefaults;
begin
  FURL := '';
  FResource := '';
  FMethod := DefaultRESTRequestMethod;

  FContentType := '';

  // do NOT reset the proxy-settings!

  FAuthMethod := DefaultRESTAuthMethod;
  FAuthUsername := '';
  FAuthUsernameKey := '';
  FAuthPassword := '';
  FAuthPasswordKey := '';

  FClientID := '';
  FClientSecret := '';
  FAuthCode := '';
  FAccessToken := '';
  FAccessTokenSecret := '';
  FRequestToken := '';
  FRequestTokenSecret := '';
  FRefreshToken := '';
  FOAuth1SignatureMethod := '';
  FOAuth2ResponseType := '';

  FEndpointAuth := '';
  FEndpointAccessToken := '';
  FEndpointRequestToken := '';
  FEndpointRedirect := '';

  FAuthScope := '';

  FCustomParams.Clear;
  FCustomBody.Clear;
end;

procedure TRESTRequestParams.Assign(ASource: TRESTRequestParams);
var
  LPosition: Int64;
begin
  Assert(Assigned(ASource));

  FMethod := ASource.Method;
  FURL := ASource.URL;
  FResource := ASource.Resource;
  FContentType := ASource.ContentType;

  FAuthMethod := ASource.AuthMethod;
  FAuthUsername := ASource.AuthUsername;
  FAuthUsernameKey := ASource.AuthUsernameKey;
  FAuthPassword := ASource.AuthPassword;
  FAuthPasswordKey := ASource.AuthPasswordKey;

  FClientID := ASource.ClientID;
  FClientSecret := ASource.ClientSecret;
  FAuthCode := ASource.AuthCode;
  FAccessToken := ASource.AccessToken;
  FAccessTokenSecret := ASource.AccessTokenSecret;
  FRequestToken := ASource.RequestToken;
  FRequestTokenSecret := ASource.RequestTokenSecret;
  FRefreshToken := ASource.RefreshToken;
  FOAuth1SignatureMethod := ASource.OAuth1SignatureMethod;
  FOAuth2ResponseType := ASource.OAuth2ResponseType;

  FEndpointAuth := ASource.EndpointAuth;
  FEndpointAccessToken := ASource.EndpointAccessToken;
  FEndpointRequestToken := ASource.EndpointRequestToken;
  FEndpointRedirect := ASource.EndpointRedirect;

  FAuthScope := ASource.AuthScope;

  FCustomParams.Assign(ASource.CustomParams);

  FCustomBody.Clear;
  // save stream-position
  LPosition := ASource.CustomBody.Position;
  try
    ASource.CustomBody.Position := 0;
    FCustomBody.CopyFrom(ASource.CustomBody, ASource.CustomBody.Size);
  finally
    ASource.CustomBody.Position := LPosition;
  end;
end;

function TRESTRequestParams.AsJSONObject: TJSONObject;
var
  LRoot: TJSONObject;
  LAuth: TJSONObject;
  LParams: TJSONArray;
  LParameter: TRESTRequestParameter;
  LObject: TJSONObject;
begin
  // write auth-info as an object ("dictionary")
  LAuth := TJSONObject.Create;
  LAuth
    .AddPair('method', RESTAuthMethodToString(FAuthMethod))
    .AddPair('username', FAuthUsername)
    .AddPair('passwordkey', FAuthUsernameKey)
    .AddPair('password', FAuthPassword)
    .AddPair('passwordkey', FAuthPasswordKey)
    .AddPair('clientid', FClientID)
    .AddPair('clientsecret', FClientSecret)
    .AddPair('authcode', FAuthCode)
    .AddPair('accesstoken', FAccessToken)
    .AddPair('accesstokensecret', FAccessTokenSecret)
    .AddPair('requesttoken', FRequestToken)
    .AddPair('requesttokensecret', FRequestTokenSecret)
    .AddPair('refreshtoken', FRefreshToken)
    .AddPair('signaturemethod', FOAuth1SignatureMethod)
    .AddPair('responsetype', FOAuth2ResponseType)
    .AddPair('endpointauth', FEndpointAuth)
    .AddPair('endpointaccesstoken', FEndpointAccessToken)
    .AddPair('endpointrequesttoken', FEndpointRequestToken)
    .AddPair('endpointredirect', FEndpointRedirect)
    .AddPair('authscope', FAuthScope);

  // write custom params as an array of objects
  LParams := TJSONArray.Create;
  for LParameter in FCustomParams do
  begin
    LObject := TJSONObject.Create;
    LObject
      .AddPair('name', LParameter.Name)
      .AddPair('value', LParameter.Value)
      .AddPair('kind', RESTRequestParameterKindToString(LParameter.Kind))
      .AddPair('encode', TJSONBool.Create(not (poDoNotEncode in LParameter.Options)));
    LParams.Add(LObject);
  end;

  // write custom body
  FCustomBody.Seek(0, soFromBeginning);

  // write all together
  LRoot := TJSONObject.Create;
  LRoot
    .AddPair('method', RESTRequestMethodToString(FMethod))
    .AddPair('url', FURL)
    .AddPair('resource', FResource)
    .AddPair('contenttype', FContentType)
    .AddPair('auth', LAuth)
    .AddPair('parameters', LParams)
    .AddPair('body', TIdEncoderMIME.EncodeStream(FCustomBody));

  Result := LRoot;
end;

procedure TRESTRequestParams.FromJSONObject(const AJSONObject: TJSONObject);
var
  LAuth: TJSONObject;
  LPair: TJSONPair;
  i: Integer;
  LParams: TJSONArray;
  LObject: TJSONObject;
  LParameter: TRESTRequestParameter;
  LBool: TJSONBool;

  function ExtractObject(const Ident: string; const Container: TJSONObject): TJSONObject; overload;
  var
    p: TJSONPair;
  begin
    p := Container.Get(Ident);
    if Assigned(p) and (p.JsonValue is TJSONObject) then
      Result := TJSONObject(p.JsonValue)
    else
      Result := nil;
  end;

  function ExtractObject(const Index: Integer; const Container: TJSONArray): TJSONObject; overload;
  var
    v: TJSONValue;
  begin
    v := Container.Items[Index];
    if Assigned(v) and (v is TJSONObject) then
      Result := TJSONObject(v)
    else
      Result := nil;
  end;

  function ExtractArray(const Ident: string; const Container: TJSONObject): TJSONArray;
  var
    p: TJSONPair;
  begin
    p := Container.Get(Ident);
    if Assigned(p) and (p.JsonValue is TJSONArray) then
      Result := TJSONArray(p.JsonValue)
    else
      Result := nil;
  end;

begin
  ResetToDefaults;

  LPair := AJSONObject.Get('method');
  if Assigned(LPair) then
    FMethod := RESTRequestMethodFromString(LPair.JsonValue.Value);

  LPair := AJSONObject.Get('url');
  if Assigned(LPair) then
    FURL := LPair.JsonValue.Value;

  LPair := AJSONObject.Get('resource');
  if Assigned(LPair) then
    FResource := LPair.JsonValue.Value;

  LPair := AJSONObject.Get('contenttype');
  if Assigned(LPair) then
    FContentType := LPair.JsonValue.Value;

  LAuth := ExtractObject('LAuth', AJSONObject);
  if Assigned(LAuth) then
  begin
    LPair := LAuth.Get('method');
    if Assigned(LPair) then
      FAuthMethod := RESTAuthMethodFromString(LPair.JsonValue.Value);
    LPair := LAuth.Get('username');
    if Assigned(LPair) then
      FAuthUsername := LPair.JsonValue.Value;
    LPair := LAuth.Get('usernamekey');
    if Assigned(LPair) then
      FAuthUsernameKey := LPair.JsonValue.Value;
    LPair := LAuth.Get('password');
    if Assigned(LPair) then
      FAuthPassword := LPair.JsonValue.Value;
    LPair := LAuth.Get('passwordkey');
    if Assigned(LPair) then
      FAuthPasswordKey := LPair.JsonValue.Value;
    LPair := LAuth.Get('clientid');
    if Assigned(LPair) then
      FClientID := LPair.JsonValue.Value;
    LPair := LAuth.Get('clientsecret');
    if Assigned(LPair) then
      FClientSecret := LPair.JsonValue.Value;
    LPair := LAuth.Get('authcode');
    if Assigned(LPair) then
      FAuthCode := LPair.JsonValue.Value;
    LPair := LAuth.Get('accesstoken');
    if Assigned(LPair) then
      FAccessToken := LPair.JsonValue.Value;
    LPair := LAuth.Get('accesstokensecret');
    if Assigned(LPair) then
      FAccessTokenSecret := LPair.JsonValue.Value;
    LPair := LAuth.Get('requesttoken');
    if Assigned(LPair) then
      FRequestToken := LPair.JsonValue.Value;
    LPair := LAuth.Get('requesttokensecret');
    if Assigned(LPair) then
      FRequestTokenSecret := LPair.JsonValue.Value;
    LPair := LAuth.Get('refreshtoken');
    if Assigned(LPair) then
      FRefreshToken := LPair.JsonValue.Value;
    LPair := LAuth.Get('signaturemethod');
    if Assigned(LPair) then
      FOAuth1SignatureMethod := LPair.JsonValue.Value;
    LPair := LAuth.Get('responsetype');
    if Assigned(LPair) then
      FOAuth2ResponseType := LPair.JsonValue.Value;
    LPair := LAuth.Get('endpointauth');
    if Assigned(LPair) then
      FEndpointAuth := LPair.JsonValue.Value;
    LPair := LAuth.Get('endpointaccesstoken');
    if Assigned(LPair) then
      FEndpointAccessToken := LPair.JsonValue.Value;
    LPair := LAuth.Get('endpointrequesttoken');
    if Assigned(LPair) then
      FEndpointRequestToken := LPair.JsonValue.Value;
    LPair := LAuth.Get('endpointredirect');
    if Assigned(LPair) then
      FEndpointRedirect := LPair.JsonValue.Value;
    LPair := LAuth.Get('authscope');
    if Assigned(LPair) then
      FAuthScope := LPair.JsonValue.Value;
  end;

  LParams := ExtractArray('parameters', AJSONObject);
  if Assigned(LParams) then
    for i := 0 to LParams.Count - 1 do
    begin
      LObject := ExtractObject(i, LParams);
      if Assigned(LObject) then
      begin
        LParameter := FCustomParams.AddItem;

        LPair := LObject.Get('name');
        if Assigned(LPair) then
          LParameter.Name := LPair.JsonValue.Value;
        LPair := LObject.Get('value');
        if Assigned(LPair) then
          LParameter.Value := LPair.JsonValue.Value;
        LPair := LObject.Get('kind');
        if Assigned(LPair) then
          LParameter.Kind := RESTRequestParameterKindFromString(LPair.JsonValue.Value);
        LPair := LObject.Get('encode');
        if Assigned(LPair) and LPair.JsonValue.TryGetValue<TJSONBool>(LBool) then
          if LBool.AsBoolean then
            LParameter.Options := LParameter.Options - [poDoNotEncode]
          else
            LParameter.Options := LParameter.Options + [poDoNotEncode];
      end;
    end;

  LPair := AJSONObject.Get('body');
  if Assigned(LPair) then
    TIdDecoderMIME.DecodeStream(LPair.JsonValue.Value, FCustomBody);
end;

procedure TRESTRequestParams.SaveToFile(const AFilename: string);
var
  LStream: TStringStream;
  LJSONObj: TJSONObject;
begin
  LJSONObj := AsJSONObject;
  try
    LStream := TStringStream.Create(LJSONObj.ToJSON);
    try
      LStream.SaveToFile(AFilename);
    finally
      LStream.Free;
    end;
  finally
    LJSONObj.Free;
  end;
end;

procedure TRESTRequestParams.LoadFromFile(const AFilename: string);
var
  LStream: TStringStream;
  LJSONObj: TJSONObject;
begin
  LStream := TStringStream.Create;
  try
    LStream.LoadFromFile(AFilename);
    LJSONObj := TJSONObject.ParseJSONValue(LStream.DataString, False, True) AS TJSONObject;
    try
      FromJSONObject(LJSONObj);
    finally
      LJSONObj.Free;
    end;
  finally
    LStream.Free;
  end;
end;

procedure TRESTRequestParams.SetResource(const AValue: string);
begin
  if AValue <> FResource then
  begin
    // FCustomParams.FromString(FResource, AValue);
    FCustomParams.CreateURLSegmentsFromString(AValue);

    FResource := AValue;
  end;
end;

function TRESTRequestParams.ToString: string;
var
  S: string;
begin
  Result := FURL;
  if FResource <> '' then
  begin
    // just a minimal fixing of the data for display
    while EndsText('/', Result) do
      Delete(Result, Length(Result), 1);
    S := FResource;
    while StartsText('/', S) do
      Delete(S, 1, 1);

    Result := Result + ' + --> ' + S;
  end;
end;

end.
