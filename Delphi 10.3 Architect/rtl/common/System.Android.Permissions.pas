{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Android.Permissions;

interface

implementation

uses
  System.Generics.Collections,
  System.Messaging,
  System.Permissions,
  System.SysUtils,
  System.Types,
  System.UITypes,
  Androidapi.Helpers,
  Androidapi.JniBridge,
  Androidapi.Jni,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Support,
  Androidapi.JNI.Widget;

type
  TRequestPermissionsCallbackPair = record
    Proc: TRequestPermissionsResultProc;
    Event: TRequestPermissionsResultEvent;
    constructor Create(const AProc: TRequestPermissionsResultProc; const AEvent: TRequestPermissionsResultEvent);
  end;

  TDisplayRationaleCallbackPair = record
    Proc: TDisplayRationaleProc;
    Event: TDisplayRationaleEvent;
    constructor Create(const AProc: TDisplayRationaleProc; const AEvent: TDisplayRationaleEvent);
  end;

  TAndroidPermissionsService = class(TPermissionsService)
  private
    FPermissionsRequestsAndCallbacks: TDictionary<Integer, TRequestPermissionsCallbackPair>;
    procedure DoRequestPermissions(const APermissions: TArray<string>; const ARequestCode: Integer);
    procedure DoRequestPermissionsCallback(const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair; const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);
    procedure InternalRequestPermissions(const APermissions: TArray<string>;
      const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
      const ADisplayRationaleCallbackPair: TDisplayRationaleCallbackPair);
    /// <summary>RTL messaging system listener</summary>
    procedure HandlePermissionsRequest(const Sender: TObject; const AMessage: TMessage);
    /// <summary>Delphi representation of the Android onRequestPermissionsResult callback</summary>
    procedure OnPermissionsRequest(const ARequestCode: Integer; const APermissions: TJavaObjectArray<JString>;
      const AGrantResults: TJavaArray<Integer>);
    /// <summary>Helper routine to get a unique request code</summary>
    function NextAvailableRequestCode: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    function IsPermissionGranted(const APermission: string): Boolean; override;
    function IsEveryPermissionGranted(const APermissions: TArray<string>): Boolean; override;
    procedure RequestPermissions(const APermissions: TArray<string>;
      const AOnRequestPermissionsResult: TRequestPermissionsResultEvent; AOnDisplayRationale: TDisplayRationaleEvent = nil);
      overload; override;
    procedure RequestPermissions(const APermissions: TArray<string>;
      const AOnRequestPermissionsResult: TRequestPermissionsResultProc; AOnDisplayRationale: TDisplayRationaleProc = nil);
      overload; override;
  end;

{ TRequestPermissionsCallbackPair }

constructor TRequestPermissionsCallbackPair.Create(const AProc: TRequestPermissionsResultProc;
  const AEvent: TRequestPermissionsResultEvent);
begin
  Proc := AProc;
  Event := AEvent;
end;

{ TDisplayRationaleCallbackPair }

constructor TDisplayRationaleCallbackPair.Create(const AProc: TDisplayRationaleProc; const AEvent: TDisplayRationaleEvent);
begin
  Proc := AProc;
  Event := AEvent;
end;

{ TAndroidPermissionsService }

constructor TAndroidPermissionsService.Create;
begin
  inherited Create;
  FPermissionsRequestsAndCallbacks := TDictionary<Integer, TRequestPermissionsCallbackPair>.Create;
  TMessageManager.DefaultManager.SubscribeToMessage(TPermissionsRequestResultMessage,
    HandlePermissionsRequest);
end;

destructor TAndroidPermissionsService.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TPermissionsRequestResultMessage, HandlePermissionsRequest);
  FPermissionsRequestsAndCallbacks.Free;
  inherited Destroy;
end;

procedure TAndroidPermissionsService.DoRequestPermissions(const APermissions: TArray<string>;
  const ARequestCode: Integer);
var
  Permissions: TJavaObjectArray<JString>;
  I: Integer;
begin
  Permissions := TJavaObjectArray<JString>.Create(Length(APermissions));
  for I := Low(APermissions) to High(APermissions) do
    Permissions[I] := StringToJString(APermissions[I]);
  // Using helper class from Android Support Library, so no OS version-checking required
  TJActivityCompat.JavaClass.RequestPermissions(TAndroidHelper.Activity, Permissions, ARequestCode);
end;

function TAndroidPermissionsService.IsPermissionGranted(const APermission: string): Boolean;
begin
  // Using helper class from Android Support Library, so no OS version checking required
  Result := TJContextCompat.JavaClass.checkSelfPermission(TAndroidHelper.Context,
    StringToJString(APermission)) = TJPackageManager.JavaClass.PERMISSION_GRANTED
end;

function TAndroidPermissionsService.IsEveryPermissionGranted(const APermissions: TArray<string>): Boolean;
var
  Permission: string;
begin
  Result := True;
  for Permission in APermissions do
    if not IsPermissionGranted(Permission) then
      Exit(False)
end;

procedure TAndroidPermissionsService.DoRequestPermissionsCallback(
  const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
  const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
begin
  // Call whichever callback (method or anonymous procedure) was passed in
  if Assigned(ARequestPermissionsCallbackPair.Proc) then
    ARequestPermissionsCallbackPair.Proc(APermissions, AGrantResults)
  else if Assigned(ARequestPermissionsCallbackPair.Event) then
    ARequestPermissionsCallbackPair.Event(Self, APermissions, AGrantResults)
end;

procedure TAndroidPermissionsService.InternalRequestPermissions(const APermissions: TArray<string>;
  const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
  const ADisplayRationaleCallbackPair: TDisplayRationaleCallbackPair);
var
  RequestCode, I, NextRationaleRequirementIndex: Integer;
  RequestedPermissionsNotAllGranted, ShowRationale: Boolean;
  GrantResults: TArray<TPermissionStatus>;
  Permissions: TArray<string>;
  PostRationale: TProc;
begin
  // First, check which permissions are not currently granted
  SetLength(GrantResults, Length(APermissions));
  RequestedPermissionsNotAllGranted := False;
  for I := Low(GrantResults) to High(GrantResults) do
  begin
    if IsPermissionGranted(APermissions[I]) then
      GrantResults[I] := TPermissionStatus.Granted
    else
      GrantResults[I] := TPermissionStatus.Denied;
    if GrantResults[I] <> TPermissionStatus.Granted then
      RequestedPermissionsNotAllGranted := True;
  end;
  // If we have any then act accordingly
  if RequestedPermissionsNotAllGranted then
  begin
    RequestCode := NextAvailableRequestCode;
    FPermissionsRequestsAndCallbacks.Add(RequestCode, ARequestPermissionsCallbackPair);

    ShowRationale := False;

    // Permissions are not granted. Is there an explanation/rationale to show
    if Assigned(ADisplayRationaleCallbackPair.Proc) or Assigned(ADisplayRationaleCallbackPair.Event) then
    begin
      SetLength(Permissions, Length(APermissions));
      NextRationaleRequirementIndex := 0;
      // Iterate all the permissions and get any rationale strings that need displaying
      for I := Low(APermissions) to High(APermissions) do
      begin
        // References to the Activity won't work in a service where it's nil and will
        // throw an exception if read there, so we check the DelphiActivity symbol first
        if DelphiActivity <> nil then
        begin
          if TJActivityCompat.JavaClass.shouldShowRequestPermissionRationale(
               TAndroidHelper.Activity, StringToJString(APermissions[I])) then
          begin
            Permissions[NextRationaleRequirementIndex] := APermissions[I];
            ShowRationale := True;
            Inc(NextRationaleRequirementIndex);
          end;
        end;
      end;
      SetLength(Permissions, NextRationaleRequirementIndex);
    end;
    if ShowRationale then
    begin
      PostRationale := procedure
      begin
        DoRequestPermissions(APermissions, RequestCode)
      end;
      // Call whichever rationale display callback has been passed in.
      // This should show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
      // After the user sees the explanation, try again to request the permission.
      if Assigned(ADisplayRationaleCallbackPair.Proc) then
        ADisplayRationaleCallbackPair.Proc(Permissions, PostRationale)
      else if Assigned(ADisplayRationaleCallbackPair.Event) then
        ADisplayRationaleCallbackPair.Event(Self, Permissions, PostRationale)
    end
    else
      DoRequestPermissions(APermissions, RequestCode)
  end
  else // Permissions already granted
    DoRequestPermissionsCallback(ARequestPermissionsCallbackPair, APermissions, GrantResults);
end;

procedure TAndroidPermissionsService.RequestPermissions(const APermissions: TArray<string>;
  const AOnRequestPermissionsResult: TRequestPermissionsResultEvent; AOnDisplayRationale: TDisplayRationaleEvent);
begin
  InternalRequestPermissions(APermissions, TRequestPermissionsCallbackPair.Create(nil, AOnRequestPermissionsResult), TDisplayRationaleCallbackPair.Create(nil, AOnDisplayRationale));
end;

procedure TAndroidPermissionsService.RequestPermissions(const APermissions: TArray<string>;
  const AOnRequestPermissionsResult: TRequestPermissionsResultProc; AOnDisplayRationale: TDisplayRationaleProc);
begin
  InternalRequestPermissions(APermissions, TRequestPermissionsCallbackPair.Create(AOnRequestPermissionsResult, nil), TDisplayRationaleCallbackPair.Create(AOnDisplayRationale, nil));
end;

procedure TAndroidPermissionsService.HandlePermissionsRequest(const Sender: TObject; const AMessage: TMessage);
var
  MessageData: TPermissionsRequestResultData;
  RequestCode: Integer;
  Permissions: TJavaObjectArray<JString>;
  GrantResults: TJavaArray<Integer>;
begin
  if AMessage is TPermissionsRequestResultMessage then
  begin
    MessageData := TPermissionsRequestResultMessage(AMessage).Value;
    RequestCode := MessageData.RequestCode;
    Permissions := MessageData.Permissions;
    GrantResults := MessageData.GrantResults;
    OnPermissionsRequest(RequestCode, Permissions, GrantResults);
  end;
end;

function TAndroidPermissionsService.NextAvailableRequestCode: Integer;
const
  StartingRequestCode = 10000;
var
  CallbackPair: TRequestPermissionsCallbackPair;
begin
  Result := StartingRequestCode;
  // Loop until we encounter an unused request code
  while FPermissionsRequestsAndCallbacks.TryGetValue(Result, CallbackPair) do
    Inc(Result)
end;

procedure TAndroidPermissionsService.OnPermissionsRequest(const ARequestCode: Integer;
  const APermissions: TJavaObjectArray<JString>; const AGrantResults: TJavaArray<Integer>);
var
  CallbackPair: TRequestPermissionsCallbackPair;
  Permissions: TArray<string>;
  GrantResults: TArray<TPermissionStatus>;
  NumPermissions: Integer;
  I: Integer;
begin
  // Look up the request code in FPermissionsRequestsAndCallbacks CallbackPair to get the user callback to call
  if FPermissionsRequestsAndCallbacks.TryGetValue(ARequestCode, CallbackPair) then
  begin
    NumPermissions := APermissions.Length;
    // This callback appears to be called twice, once with empty arrays and then with populated arrays
    if (NumPermissions > 0) and (NumPermissions = AGrantResults.Length) then
    begin
      SetLength(Permissions, NumPermissions);
      SetLength(GrantResults, NumPermissions);
      for I := 0 to Pred(NumPermissions) do
      begin
        Permissions[I] := JStringToString(APermissions[I]);
        if AGrantResults[I] = TJPackageManager.JavaClass.PERMISSION_GRANTED then
          GrantResults[I] := TPermissionStatus.Granted
        else if TJActivityCompat.JavaClass.shouldShowRequestPermissionRationale(
                  TAndroidHelper.Activity, APermissions[I]) then
          GrantResults[I] := TPermissionStatus.Denied
        else
          GrantResults[I] := TPermissionStatus.PermanentlyDenied;
      end;
      try
        DoRequestPermissionsCallback(CallbackPair, Permissions, GrantResults);
      finally
        // Tidy up the resources logged against this request code
        FPermissionsRequestsAndCallbacks.Remove(ARequestCode);
      end;
    end;
  end;
end;

initialization
  PermissionsServiceClass := TAndroidPermissionsService
end.
