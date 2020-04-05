{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2015-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit EMSHosting.RequestHandler;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections,
  EMSHosting.RequestTypes, EMS.ResourceAPI, EMSHosting.Endpoints;

type
  TEMSHostRequestProps = record
  public type
    THeaderNames = record
    public const
      ApiVersion = 'X-Embarcadero-Api-Version';
      ApplicationId = 'X-Embarcadero-Application-Id';
      SessionToken = 'X-Embarcadero-Session-Token';
      MasterSecret = 'X-Embarcadero-Master-Secret';
      AppSecret = 'X-Embarcadero-App-Secret';
      TenantId = 'X-Embarcadero-Tenant-Id';
      TenantSecret = 'X-Embarcadero-Tenant-Secret';
   end;
  private
    FApplicationId: string;
    FApiVersion: string;
    FApiMajorVersion: string;
    FApiMinorVersion: string;
    FSessionToken: string;
    FResourceURL: string;
    FAppSecret: string;
    FMasterSecret: string;
    FTenantId: string;
    FTenantSecret: string;
  public
    property ApiVersion: string read FApiVersion;
    property ApiMajorVersion: string read FApiMajorVersion;
    property ApiMinorVersion: string read FApiMinorVersion;
    property ApplicationID: string read FApplicationID;
    property ResourceURL: string read FResourceURL;
    property SessionToken: string read FSessionToken;
    property AppSecret: string read FAppSecret;
    property MasterSecret: string read FMasterSecret;
    property TenantId: string read FTenantId;
    property TenantSecret: string read FTenantSecret;
  end;

  TEMSHostRequestHandler = class abstract
  private
    function GetRequestProps(
      const Request: IEMSHostRequest): TEMSHostRequestProps;
    function GetGroups(const AContext: IEMSHostContext; const AUserID, ATenantId: string;
      var AGroups: TEndpointContext.TGroups): TEndpointContext.TGroups;
    function GetUserID(const AContext: IEMSHostContext; const ASessionToken, ATenantId: string;
      var AUserID: string): string;
    function GetUserName(const AContext: IEMSHostContext; const AUserID, ATenantId: string; var AUserName: string): string;
  protected
    function UserIDOfSession(const AContext: IEMSHostContext; const ASessionToken, ATenantId: string;
      out AUserID: string): Boolean; virtual; abstract;
    function UserNameOfID(const AContext: IEMSHostContext; const AUserID, ATenantId: string;
      out AUserName: string): Boolean; virtual; abstract;
    function GetGroupsByUser(const AContext: IEMSHostContext; const AUserID, ATenantId: string): TArray<string>; virtual;
    procedure CheckForbiddenRequest(const AResourceName, AOriginalResourceName: string); virtual; abstract;
    procedure AuthenticateRequest(const AResources: TArray<TEMSResource>; const AResourceRequest: TEMSHostRequestProps;
      var AAuthenticated: TEndpointContext.TAuthenticated); virtual; abstract;
    procedure LogEndpoint(const AResource, AEndpointName, AMethod, AUserID,
      ACustom, ATenantId: string); virtual; abstract;
    procedure RedirectResource(const AContext: TEndpointContext; var AResource: TEMSResource; var AEndpointName: string); virtual; abstract;
    function ResourcesPath: string; virtual;
    //Tenants
    function IsUserBelongsToTenant(const AUserId, ATenantId: string): Boolean; virtual; abstract;
    function GetTenantNameByTenantId(const ATenantId: string; const AContext: IEMSHostContext = nil): string; virtual; abstract;
    function GetDefaultTenantId: string; virtual; abstract;
  public
    { Public declarations }
    procedure HandleRequest(const Context: IEMSHostContext; const Request: IEMSHostRequest;
      const Response: IEMSHostResponse; var Handled: Boolean);
    procedure HandleException(const E: Exception;
      const Response: IEMSHostResponse;
      var Handled: Boolean);
  end;


implementation

uses System.JSON, EMSHosting.Utility, EMSHosting.Helpers, EMSHosting.ResourceManager,
  EMSHosting.Consts, System.Character, System.NetEncoding;

type
  TUser = class(TEndpointContextImpl.TUser)
  private type
    TGroups = TEndpointContext.TGroups;
  private
    FContext: IEMSHostContext;
    FRequestHandler: TEMSHostRequestHandler;
    [weak] FEndpointContext: TEndpointContextImpl;
    FUserID: string;
    FUserName: string;
    FSessionToken: string;
    FGroups: TGroups;
  protected
                    
    function GetUserName: string; override;
    function GetUserID: string;  override;
    function GetSessionToken: string; override;
    function GetGroups: TEndpointContext.TGroups; override;
  public
    constructor Create(const AContext: IEMSHostContext; const ARequestHandler: TEMSHostRequestHandler;
      const AEndpointContext: TEndpointContextImpl; const AUserID, ASessionToken: string);
  end;

  TEdgemodule = class(TEndpointContextImpl.TEdgemodule)
  private
    FContext: IEMSEdgeHostContext;
  protected
    function GetModuleName: string; override;
    function GetModuleVersion: string; override;
  public
    constructor Create(const AContext: IEMSEdgeHostContext);
  end;

  TGroups = class(TEndpointContextImpl.TGroups)
  private
    FContext: IEMSHostContext;
    FRequestHandler: TEMSHostRequestHandler;
    FUserID: string;
    FTenantId: string;
    FGroups: TList<string>;
    procedure CheckGroups;
  protected
    function GetCount: Integer; override;
  public
    constructor Create(const AContext: IEMSHostContext; const ARequestHandler: TEMSHostRequestHandler;
      const AUserID, ATenantId: string);
    destructor Destroy; override;
    function Contains(const AGroup: string): Boolean; override;
  end;

  TTenant = class(TEndpointContextImpl.TTenant)
  private
    FContext: IEMSHostContext;
    FRequestHandler: TEMSHostRequestHandler;
    FTenantId: string;
  protected
    function GetTenantId: string; override;
    function GetTenantName: string; override;
  public
    constructor Create(const AContext: IEMSHostContext; const ARequestHandler: TEMSHostRequestHandler;
      const ATenantId: string);
  end;

{ TUser }

constructor TUser.Create(const AContext: IEMSHostContext;
  const ARequestHandler: TEMSHostRequestHandler;
  const AEndpointContext: TEndpointContextImpl; const AUserID, ASessionToken: string);
begin
  inherited Create;
  FContext := AContext;
  FRequestHandler := ARequestHandler;
  FEndpointContext := AEndpointContext;
  FUserID := AUserID;
  FSessionToken := ASessionToken;
end;

function TUser.GetUserName: string;
begin
  Result := FRequestHandler.GetUserName(FContext, FUserID, FEndpointContext.Tenant.Id, FUserName);
end;

function TUser.GetUserID: string;
begin
  Result := FUserID;
end;

function TUser.GetSessionToken: string;
begin
  Result := FSessionToken;
end;

function TUser.GetGroups: TEndpointContext.TGroups;
begin
  Result := FRequestHandler.GetGroups(FContext, FUserID, FEndpointContext.Tenant.Id, FGroups);
end;

{ TEdgemodule }

constructor TEdgemodule.Create(const AContext: IEMSEdgeHostContext);
begin
  inherited Create;
  FContext := AContext;
end;

function TEdgemodule.GetModuleName: string;
begin
  Result := FContext.ModuleName;
end;

function TEdgemodule.GetModuleVersion: string;
begin
  Result := FContext.ModuleVersion;
end;

{ TGroups }

constructor TGroups.Create(const AContext: IEMSHostContext; const ARequestHandler: TEMSHostRequestHandler;
  const AUserID, ATenantId: string);
begin
  inherited Create;
  FContext := AContext;
  FRequestHandler := ARequestHandler;
  FUserID := AUserID;
  FTenantId := ATenantId;
end;

destructor TGroups.Destroy;
begin
  FGroups.Free;
  inherited Destroy;
end;

procedure TGroups.CheckGroups;
begin
  if FGroups = nil then
  begin
    FGroups := TList<string>.Create;
    FGroups.AddRange(FRequestHandler.GetGroupsByUser(FContext, FUserID, FTenantId));
  end;
end;

function TGroups.Contains(const AGroup: string): Boolean;
begin
  CheckGroups;
  Result := FGroups.Contains(AGroup);
end;

function TGroups.GetCount: Integer;
begin
  CheckGroups;
  Result := FGroups.Count;
end;

{ TTenant }

constructor TTenant.Create(const AContext: IEMSHostContext;
  const ARequestHandler: TEMSHostRequestHandler; const ATenantId: string);
begin
  inherited Create;
  FContext := AContext;
  FRequestHandler := ARequestHandler;
  FTenantId := ATenantId;
end;

function TTenant.GetTenantId: string;
begin
  Result := FTenantId;
end;

function TTenant.GetTenantName: string;
begin
  Result := FRequestHandler.GetTenantNameByTenantId(FTenantId, FContext);
end;

{ TEMSHostRequestHandler }

function TEMSHostRequestHandler.GetRequestProps(const Request: IEMSHostRequest): TEMSHostRequestProps;

  function GetField(const AName: string; const ADefault: string = ''): string;
  begin
    Result := Request.Headers[AName];
    if Result = '' then
      Result := ADefault;
  end;

  function RemoveGuidBrackets(const AValue: string): string;
  begin
    Result := AValue;
    if not Result.IsEmpty and (Result.Length > 32) and Result.StartsWith('{') and Result.EndsWith('}') then
      Result := Result.Substring(1, Result.Length - 2);
  end;

var
  LPathInfo: string;
  LStrings: TStrings;
  I: Integer;
begin
  LPathInfo := String(Request.PathInfo);                                 
  LStrings := ParseURLPath(LPathInfo);
  try
    if LStrings.Count > 0 then
    begin
      if LStrings[0] = '/' then
        if LStrings.Count > 1 then
          Result.FResourceURL := '/' + LStrings[1]
        else
          Result.FResourceURL := LStrings[0]
      else
        Result.FResourceURL := LStrings[0];
    end;
    Result.FApplicationId := GetField(TEMSHostRequestProps.THeaderNames.ApplicationId);

    Result.FApiVersion := GetField(TEMSHostRequestProps.THeaderNames.ApiVersion);
    I := Result.FApiVersion.IndexOf('.');
    if I > 0 then
    begin
      Result.FApiMinorVersion := Result.FApiVersion.Substring(I+1);
      Result.FApiMajorVersion := Result.FApiVersion.Substring(0, I);
    end
    else
      Result.FApiMajorVersion := Result.FApiVersion;

    Result.FMasterSecret := GetField(TEMSHostRequestProps.THeaderNames.MasterSecret);

    Result.FAppSecret := GetField(TEMSHostRequestProps.THeaderNames.AppSecret);

    Result.FSessionToken := GetField(TEMSHostRequestProps.THeaderNames.SessionToken);

    Result.FTenantId := RemoveGuidBrackets(TNetEncoding.URL.Decode(GetField(TEMSHostRequestProps.THeaderNames.TenantId), []));
    Result.FTenantSecret := TNetEncoding.URL.Decode(GetField(TEMSHostRequestProps.THeaderNames.TenantSecret), []);

    if Result.FResourceURL = '' then
      Result.FResourceURL := '/';
  finally
    LStrings.Free;
  end;
end;

function TEMSHostRequestHandler.GetUserID(const AContext: IEMSHostContext; const ASessionToken, ATenantId: string; var AUserID: string): string;
begin
  Result := AUserID;
  if Result = '' then
  begin
    if not Self.UserIDOfSession(AContext, ASessionToken, ATenantId, Result) then
      EEMSHTTPError.RaiseUnauthorized; // No user
  end;
  AUserID := Result;
end;

function TEMSHostRequestHandler.GetGroups(const AContext: IEMSHostContext; const AUserID, ATenantId: string; var AGroups: TEndpointContext.TGroups): TEndpointContext.TGroups;
begin
  Result := AGroups;
  if Result = nil then
    Result := TGroups.Create(AContext, Self, AUserID, ATenantId);
  AGroups := Result;
end;

function TEMSHostRequestHandler.GetUserName(const AContext: IEMSHostContext; const AUserID, ATenantId: string; var AUserName: string): string;
begin
  Result := AUserName;
  if Result = '' then
  begin
    if not Self.UserNameOfID(AContext, AUserID, ATenantId, Result) then
      EEMSHTTPError.RaiseNotFound;
  end;
  AUserName := Result;
end;

function TEMSHostRequestHandler.GetGroupsByUser(const AContext: IEMSHostContext; const AUserID, ATenantId: string): TArray<string>;
begin
  Result := nil;
end;

type
  TEMSHostRequestWrapper = class(TInterfacedObject, IEMSHostRequest)
  private
    FPathInfo: string;
    FOriginalRequest: IEMSHostRequest;
    function GetContentType: string;
    function GetMethodType: TEMSHostMethodType;
    function GetPathInfo: string;
    function GetQueryFields: TStringKeyValues;
    function GetRawContent: TBytes;
    function GetMethod: string;
    function GetContentLength: Integer;
    function GetHeader(const AName: string): string;
    function GetBasePath: string;
    function GetServerHost: string;
  public
    constructor Create(const AOriginalRequest: IEMSHostRequest; const APathInfo: string);
  end;

constructor TEMSHostRequestWrapper.Create(const AOriginalRequest: IEMSHostRequest; const APathInfo: string);
begin
  FPathInfo := APathInfo;
  FOriginalRequest := AOriginalRequest;
end;

function TEMSHostRequestWrapper.GetBasePath: string;
begin
  Result := FOriginalRequest.GetBasePath;
end;

function TEMSHostRequestWrapper.GetContentLength: Integer;
begin
  Result := FOriginalRequest.GetContentLength;
end;

function TEMSHostRequestWrapper.GetContentType: string;
begin
  Result := FOriginalRequest.GetContentType;
end;

function TEMSHostRequestWrapper.GetHeader(const AName: string): string;
begin
  Result := FOriginalRequest.GetHeader(AName);
end;

function TEMSHostRequestWrapper.GetMethod: string;
begin
  Result := FOriginalRequest.GetMethod;
end;

function TEMSHostRequestWrapper.GetMethodType: TEMSHostMethodType;
begin
  Result := FOriginalRequest.GetMethodType;
end;

function TEMSHostRequestWrapper.GetPathInfo: string;
begin
  Result := FPathInfo; // FOriginalRequest.GetPathInfo;
end;

function TEMSHostRequestWrapper.GetQueryFields: TStringKeyValues;
begin
  Result := FOriginalRequest.GetQueryFields;
end;

function TEMSHostRequestWrapper.GetRawContent: TBytes;
begin
  Result := FOriginalRequest.GetRawContent;
end;

function TEMSHostRequestWrapper.GetServerHost: string;
begin
  Result := FOriginalRequest.GetServerHost;
end;

procedure TEMSHostRequestHandler.HandleRequest(const Context: IEMSHostContext;
  const Request: IEMSHostRequest; const Response: IEMSHostResponse; var Handled: Boolean);
var
  LResources: TArray<TEMSResource>;

  function IsVersionResource: Boolean;
  begin
    Result := (Length(LResources) = 1) and
      SameText(LResources[0].Name, 'version');
  end;

type
  TUserGroups = TUser.TGroups;                                                
var
  LPathInfo: string;
  LResource: TEMSResource;
  R: TEMSResource;
  LContext: TEndpointContextImpl;
  LRequest: TEndpointRequest;
  LResponse: TEndpointResponseImpl;
  LAuthenticated: TEndpointContext.TAuthenticated;
  LEndpointName: string;
  LCustom: string;
  LResourceRequest: TEMSHostRequestProps;
  LUserID: string;
  LOriginalResourceName: string;
  LOriginalEndpointName: string;
  LHostRequest: IEMSHostRequest;
  LTemp: string;
  LIsResourceRequest: Boolean;
begin
  LAuthenticated := [];
  LRequest := nil;
  LResponse := nil;
  LIsResourceRequest := True;
  try
    LPathInfo := String(Request.PathInfo);                                 
    if (LPathInfo.Length > 0) and (Self.ResourcesPath <> '') then
    begin
      LTemp := Self.ResourcesPath;
      if (LTemp.Chars[0] <> '/') and (LPathInfo.Chars[0] = '/') then
        LTemp := '/' + LTemp;
      LTemp.TrimRight(['/']);
      if LPathInfo.StartsWith(LTemp, True)  then
        LPathInfo := LPathInfo.Substring(LTemp.Length)
      else
        LIsResourceRequest := False;
    end;
    LHostRequest := TEMSHostRequestWrapper.Create(Request, LPathInfo);
    LResourceRequest := GetRequestProps(LHostRequest);

    if LIsResourceRequest then
    begin
      LResources := TEMSEndpointManagerImpl.Instance.FindByBaseURL(LResourceRequest.ResourceURL);
      Self.AuthenticateRequest(LResources, LResourceRequest, LAuthenticated);
    end
    else
      LResources := nil;

    if LResources = nil then
    begin
      if LResourceRequest.ResourceURL = '/'  then
      begin
        // Blank page
        Response.StatusCode := 200;
        Exit; // EXIT
      end
      else if SameText(LResourceRequest.ResourceURL, '/favicon.ico')  then
      begin
        // Silent failure
        Response.StatusCode := EEMSHTTPError.TCodes.NotFound;
        Exit; // EXIT
      end;
      EEMSHTTPError.RaiseNotFound(Format(sResourceNotFound, [LPathInfo]));
    end;

    LRequest := TEndpointRequestImpl.Create(LHostRequest);
    LContext := TEndpointContextImpl.Create;
    LContext.OnGetAuthenticated :=
      function: TEndpointContext.TAuthenticated
      begin
        Result := LAuthenticated;
        if LContext.User <> nil then
          Include(Result, TEndpointContext.TAuthenticate.User);
      end;
    LContext.OnGetEndpointName :=
      function: string
      begin
        Result := LEndpointName;
      end;
    LContext.OnGetRequest :=
      function: TEndpointRequest
      begin
        Result := LRequest;
      end;
    LContext.OnGetResponse :=
      function: TEndpointResponse
      begin
        Result := LResponse;
      end;
    LContext.OnCreateUser :=
      procedure(const AContext: TEndpointContextImpl; out AUser: TEndpointContextImpl.TUser)
      var
        LUserId: string;
      begin
        AUser := nil;
        if (LResourceRequest.SessionToken <> '') and (AContext.Tenant <> nil) then
        begin
          GetUserID(Context, LResourceRequest.SessionToken, LContext.Tenant.Id, LUserID);
          if IsUserBelongsToTenant(LUserId, AContext.Tenant.Id) then
            AUser := TUser.Create(Context, Self, LContext, LUserID, LResourceRequest.SessionToken);
        end;
      end;
    LContext.OnCreateEdgemodule :=
      procedure(const AContext: TEndpointContextImpl; out AEdgemodule: TEndpointContextImpl.TEdgemodule)
      var
        LIntf: IEMSEdgeHostContext;
      begin
        AEdgemodule := nil;
        if Supports(Context, IEMSEdgeHostContext, LIntf) then
          AEdgemodule := TEdgemodule.Create(LIntf);
      end;
    LContext.OnGetTenant :=
      function: TEndpointContextImpl.TTenant
      begin
        Result := nil;
        if LResourceRequest.TenantId = '' then
          LResourceRequest.FTenantId := Self.GetDefaultTenantId;
        if LResourceRequest.TenantId <> '' then
          Result := TTenant.Create(Context, Self, LResourceRequest.TenantId);
      end;
    LResource := nil;
    for R in LResources do
      if R.CanHandleRequest(LContext, LEndpointName) then
      begin
        if LResource = nil then
          LResource := R
        else
          EEMSHTTPError.RaiseError(500, sResourceErrorMessage, Format(sResourceMultipleEndpoints, [LEndpointName]));
      end;
    if LResource <> nil then
    begin
      LOriginalResourceName := LResource.Name;
      LOriginalEndpointName := LEndpointName;
      RedirectResource(LContext, LResource, LEndpointName);
    end;
    if LResource <> nil then
    begin
      CheckForbiddenRequest(LResource.Name, LOriginalResourceName);
      if LContext.User <> nil then
        LUserID := LContext.User.UserID
      else
        LUserID := '';
      if TLogHelpers.LoggingEnabled then
        TLogHelpers.LogRequest(LResource.Name, LEndpointName, LRequest.MethodString, LUserID);
      LResponse := TEndpointResponseImpl.Create(Response);
      Handled := True;
      LResource.HandleRequest(LContext);
      LResponse.Write;
      case LContext.EndpointDataType of
        // In the case of AddUser/DeleteUser, the userid being added or deleted should be passed to ACustom
        TEndpointContextImpl.TEndpointDataType.AddUser,
        TEndpointContextImpl.TEndpointDataType.DeletedUser:
          LCustom := LContext.EndpointDataValue;
      end;
      case LContext.EndpointDataType of
        // In the case of AddUser/Login, log the userid
        TEndpointContextImpl.TEndpointDataType.AddUser,
        TEndpointContextImpl.TEndpointDataType.LoginUser:
          if LUserID = '' then
            LUserID := LContext.EndpointDataValue;
      end;
      // Analytics log
      Self.LogEndpoint(LResource.Name, LEndpointName, LRequest.MethodString, LUserID, LCustom, LResourceRequest.TenantId);
    end
    else
      EEMSHTTPError.RaiseNotFound('', Format(sResourceNotFound, [LPathInfo]));
  finally
    LRequest.Free;
    LResponse.Free;
    LContext.Free;
  end;
end;

function TEMSHostRequestHandler.ResourcesPath: string;
begin
  Result := '';
end;

procedure TEMSHostRequestHandler.HandleException(const E: Exception;
  const Response: IEMSHostResponse;
  var Handled: Boolean);
var
  LHTTPError: EEMSHTTPError;
  LJSONObject: TJSONObject;
  LBody: TEndpointResponseBodyImpl;
  LError: string;
  LDescription: string;
begin
  Handled := True;
  if E is EEMSHTTPError then
  begin
    LHTTPError := EEMSHTTPError(E);
    Response.StatusCode := LHTTPError.Code;
    if LHTTPError.Error <> '' then
      LError := LHTTPError.Error;
    if LHTTPError.Description <> '' then
      LDescription := LHTTPError.Description;
  end
  else
  begin
    Response.StatusCode := 500;
    LDescription := E.Message;
  end;
  // Write JSONObject with error description
  LJSONObject := TErrorHelpers.CreateJSONError(string(Response.ReasonString), LError, LDescription);
  try
    if TLogHelpers.LoggingEnabled then
      TLogHelpers.LogHTTPError(REsponse.StatusCode, String(Response.ReasonString),
        LError, LDescription);
    LBody := TEndpointResponseBodyImpl.Create(Response);
    try
      // Write to response
      LBody.SetValue(LJSONObject, False);
    finally
      LBody.Free;
    end;
  finally
    LJSONObject.Free;
  end;
end;

end.
