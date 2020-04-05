{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.Helpers;

interface

uses
  System.Messaging, System.SysUtils, System.UITypes,
  Androidapi.JNIBridge, Androidapi.JNI.App, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes, Androidapi.JNI.Net, Androidapi.JNI.Util, Androidapi.JNI.Os;

function JObjectToID(const AObject: JObject): Pointer; inline; deprecated 'Use TAndroidHelper.JObjectToID';

{ TBytes conversions }

/// <summary>Copy a TBytes into a new TJavaArray&ltByte&gt</summary>
function TBytesToTJavaArray(const ABytes: TBytes): TJavaArray<Byte>; inline;
/// <summary>Copy a TJavaArray&ltByte&gt into a new TBytes</summary>
function TJavaArrayToTBytes(const AJArray: TJavaArray<Byte>): TBytes; inline;

{ Integer conversions }

function Int64ToJLong(const AValue: Int64): JLong;

{ String conversions }

/// <summary>Convert a JString into a string</summary>
function JStringToString(const JStr: JString): string; inline;
/// <summary>Convert a string into a JString</summary>
function StringToJString(const Str: string): JString; inline;

/// <summary>Convert a string into a JCharSequence</summary>
function StrToJCharSequence(const ASource: string): JCharSequence; inline;
/// <summary>Convert a JCharSequence into a string</summary>
function JCharSequenceToStr(const ASource: JCharSequence): string; inline;

/// <summary>Convert a string into a Jnet_Uri</summary>
function StrToJURI(const ASource: string): Jnet_Uri; inline;
/// <summary>Convert a Jnet_Uri into a string</summary>
function JURIToStr(const ASource: Jnet_Uri): string; inline;

/// <summary>Convert a JFile into a Jnet_Uri</summary>
/// <remarks>On Android 7.0 (Nougat) or later this requires the use of a file provider,
/// which will be available if the Secure File Sharing entitlement has been enabled</remarks>
function JFileToJURI(const AFile: JFile): Jnet_Uri; inline;

{ Shared instances }
/// <summary>Returns Java Application Context</summary>
function SharedActivityContext: JContext; inline; deprecated 'Use TAndroidHelper.Context';
/// <summary>Returns Java Application Activity</summary>
function SharedActivity: JActivity; inline; deprecated 'Use TAndroidHelper.Activity';
/// <summary>Returns Java Application Info</summary>
function SharedApplicationInfo: JApplicationInfo; inline; deprecated 'Use TAndroidHelper.Context.getApplicationInfo';
/// <summary>Returns Java Application AlarmManager</summary>
function SharedAlarmManager: JAlarmManager; inline; deprecated 'Use TAndroidHelper.AlarmManager';
/// <summary>Returns Java Application PrivatePreferences</summary>
function SharedPrivatePreferences: JSharedPreferences; inline; deprecated 'Use TAndroidHelper.PrivatePreferences';
/// <summary>Returns Java Application Title</summary>
function GetApplicationTitle: string; inline; deprecated 'Use TAndroidHelper.ApplicationTitle';
/// <summary>Returns Java Package Path</summary>
function GetPackagePath: string; inline; deprecated 'Use TAndroidHelper.PackagePath';

{ Check Available services }
/// <summary>Returns true if a given feature exists as a System Service</summary>
function HasSystemService(const AFeatureName: JString): Boolean; inline; deprecated 'Use TAndroidHelper.HasSystemService';

{ Working with Resources }
/// <summary>Returns the ID of a given resource name</summary>
function GetResourceID(const ResourceName: string): Integer; inline; deprecated 'Use TAndroidHelper.GetResourceID';
/// <summary>Returns the name of a given resource ID</summary>
function GetResourceString(const ResourceID: Integer): string; inline; deprecated 'Use TAndroidHelper.GetResourceString';

{ Display }
/// <summary>Returns the Display</summary>
function GetJDisplay: JDisplay; inline; deprecated 'Use TAndroidHelper.Display';
/// <summary>Returns the Display Metrics. The size is adjusted based on the current rotation of the display.</summary>
function GetJDisplayMetrics: JDisplayMetrics; inline; deprecated 'Use TAndroidHelper.DisplayMetrics';

type
  TAndroidHelper = class
  private
    class var FJContext: JContext;
    class var FJActivity: JActivity;
    class var FJAlarmManager: JAlarmManager;
    class var FJDisplay: JDisplay;
    class var FJContentResolver: JContentResolver;
    class var FMainHandler: JHandler;

    class constructor Create;
    class function GetPrivatePreferences: JSharedPreferences; static; inline;
    class function GetJActivity: JActivity; static; inline;
    class function GetPackagePath: string; static; inline;
    class function GetApplicationTitle: string; static; inline;
    class function GetMainHandler: JHandler; static; inline;

  public
    { Check Available services }
    class function HasSystemService(const AFeatureName: JString): Boolean; static; inline;

    { Working with Resources }
    /// <summary>Returns the ID of a given resource name</summary>
    class function GetResourceID(const AResourceName: string): Integer; overload; static; inline;
    /// <summary>Returns the ID of a given resource name</summary>
    class function GetResourceID(const AResourceName: string; const AResourceType: string): Integer; overload; static; inline;
    /// <summary>Returns the name of a given resource ID</summary>
    class function GetResourceString(AResourceID: Integer): string; static; inline;

    { Instances }
    /// <summary>Returns Java Application Context</summary>
    class property Context: JContext read FJContext;
    /// <summary>Returns Java Content Resolver object of Context</summary>
    class property ContentResolver: JContentResolver read FJContentResolver;
    /// <summary>Returns Java Application Activity</summary>
    /// <remarks>An exception will be launched if there is no activity, for example a Service</remarks>
    class property Activity: JActivity read GetJActivity;
    /// <summary>Returns Java Application Title</summary>
    class property ApplicationTitle: string read GetApplicationTitle;
    /// <summary>Returns Java Application AlarmManager</summary>
    class property AlarmManager: JAlarmManager read FJAlarmManager;
    /// <summary>Returns Java Application PrivatePreferences</summary>
    class property PrivatePreferences: JSharedPreferences read GetPrivatePreferences;
    /// <summary>Returns Java Package Path</summary>
    class property PackagePath: string read GetPackagePath;
    /// <summary>Returns main thread Handler</summary>
    class property MainHandler: JHandler read GetMainHandler;

    { Display }
    /// <summary>Returns the Display</summary>
    class property Display: JDisplay read FJDisplay;
    /// <summary>Returns the Display Metrics. The size is adjusted based on the current rotation of the display.</summary>
    class function DisplayMetrics: JDisplayMetrics; static; inline;

    { JObject conversions }
    /// <summary>Returns pointer on native Java object</summary>
    class function JObjectToID(const AObject: JObject): Pointer; inline;

    { TBytes conversions }
    /// <summary>Copy a TBytes into a new TJavaArray&ltByte&gt</summary>
    class function TBytesToTJavaArray(const ABytes: TBytes): TJavaArray<Byte>; static; inline;
    /// <summary>Copy a TJavaArray&ltByte&gt into a new TBytes</summary>
    class function TJavaArrayToTBytes(const AJArray: TJavaArray<Byte>): TBytes; static; inline;

    { String conversions }
    /// <summary>Convert a JString into a string</summary>
    class function JStringToString(const JStr: JString): string; static; inline;
    /// <summary>Convert a string into a JString</summary>
    class function StringToJString(const Str: string): JString; static;

    /// <summary>Convert a string into a JCharSequence</summary>
    class function StrToJCharSequence(const ASource: string): JCharSequence; static; inline;
    /// <summary>Convert a JCharSequence into a string</summary>
    class function JCharSequenceToStr(const ASource: JCharSequence): string; static; inline;

    /// <summary>Convert a string into a Jnet_Uri</summary>
    class function StrToJURI(const ASource: string): Jnet_Uri; static; inline;
    /// <summary>Convert a Jnet_Uri into a string</summary>
    class function JURIToStr(const ASource: Jnet_Uri): string; static; inline;

    { Files }
    /// <summary>Convert a JFile into a Jnet_Uri</summary>
    /// <remarks>On Android 7.0 (Nougat) or later this requires the use of a file provider,
    /// which will be available if the Secure File Sharing entitlement has been enabled</remarks>
    class function JFileToJURI(const AFile: JFile): Jnet_Uri; static; inline;

    { Colors }
    /// <summary>Converts TAlphaColor to android color</summary>
    class function AlphaColorToJColor(const AColor: TAlphaColor): Integer; static; inline;
  end;

type
  TMessageResultNotification = class(TMessage<JIntent>)
  public
    RequestCode: Integer;
    ResultCode: Integer;
  end;

  TPermissionsRequestResultData = record
  public
    RequestCode: Integer;
    Permissions: TJavaObjectArray<JString>;
    GrantResults: TJavaArray<Integer>;
  end;
  TPermissionsRequestResultMessage = class(TMessage<TPermissionsRequestResultData>);

implementation

uses
  System.Classes, Androidapi.Jni, Androidapi.NativeActivity, Androidapi.JNI.Support;

function JObjectToID(const AObject: JObject): Pointer; inline;
begin
  Result := TJNIResolver.JavaInstanceToID(AObject);
end;

{ TBytes conversions }

function TJavaArrayToTBytes(const AJArray: TJavaArray<Byte>): TBytes;
begin
  Result := TAndroidHelper.TJavaArrayToTBytes(AJArray);
end;

function TBytesToTJavaArray(const ABytes: TBytes): TJavaArray<Byte>;
begin
  Result := TAndroidHelper.TBytesToTJavaArray(ABytes);
end;

{ Integer conversions }

function Int64ToJLong(const AValue: Int64): JLong;
begin
  Result := TJLong.JavaClass.init(AValue);
end;

{ String conversions }

function JStringToString(const JStr: JString): string;
begin
  Result := TAndroidHelper.JStringToString(JStr);
end;

function StringToJString(const Str: string): JString;
begin
  Result := TAndroidHelper.StringToJString(Str);
end;


function StrToJCharSequence(const ASource: string): JCharSequence;
begin
  Result := TAndroidHelper.StrToJCharSequence(ASource);
end;

function JCharSequenceToStr(const ASource: JCharSequence): string;
begin
  Result := TAndroidHelper.JCharSequenceToStr(ASource);
end;

function StrToJURI(const ASource: string): Jnet_Uri;
begin
  Result := TAndroidHelper.StrToJURI(ASource);
end;

function JURIToStr(const ASource: Jnet_Uri): string;
begin
  Result := TAndroidHelper.JURIToStr(ASource);
end;

function JFileToJURI(const AFile: JFile): Jnet_Uri; inline;
begin
  Result := TAndroidHelper.JFileToJURI(AFile);
end;

function SharedActivityContext: JContext;
begin
  Result := TAndroidHelper.Context;
end;

function SharedActivity: JActivity;
begin
  Result := TAndroidHelper.Activity;
end;

function SharedApplicationInfo: JApplicationInfo;
begin
  Result := TAndroidHelper.Context.getApplicationInfo;
end;

function SharedAlarmManager: JAlarmManager;
begin
  Result := TAndroidHelper.AlarmManager;
end;

function SharedPrivatePreferences: JSharedPreferences;
begin
  Result := TAndroidHelper.PrivatePreferences;
end;

function GetApplicationTitle: string;
begin
  Result := TAndroidHelper.ApplicationTitle;
end;

function GetPackagePath: string;
begin
  Result := TAndroidHelper.PackagePath;
end;

function HasSystemService(const AFeatureName: JString): Boolean;
begin
  Result := TAndroidHelper.HasSystemService(AFeatureName);
end;

function GetResourceID(const ResourceName: string): Integer;
begin
  Result := TAndroidHelper.GetResourceID(ResourceName);
end;

function GetResourceString(const ResourceID: Integer): string;
begin
  Result := TAndroidHelper.GetResourceString(ResourceID);
end;

function GetJDisplay: JDisplay;
begin
  Result := TAndroidHelper.Display;
end;

function GetJDisplayMetrics: JDisplayMetrics;
begin
  Result := TAndroidHelper.DisplayMetrics;
end;

{ TAndroidHelper }

class function TAndroidHelper.AlphaColorToJColor(const AColor: TAlphaColor): Integer;
begin
  Result := TJColor.JavaClass.argb(TAlphaColorRec(AColor).A, TAlphaColorRec(AColor).R,
    TAlphaColorRec(AColor).G, TAlphaColorRec(AColor).B);
end;

class constructor TAndroidHelper.Create;
var
  WinManager: JWindowManager;
begin
  FJContext := TJContext.Wrap(System.JavaContext);
  if System.DelphiActivity <> nil then
  begin
    FJActivity := TJNativeActivity.Wrap(System.JavaContext);
    WinManager := FJActivity.getWindowManager;
    if WinManager <> nil then
      FJDisplay := WinManager.getDefaultDisplay;
  end;
  FJAlarmManager := TJAlarmManager.Wrap(FJContext.getSystemService(TJContext.JavaClass.ALARM_SERVICE));
  FJContentResolver := FJContext.getContentResolver;
end;

class function TAndroidHelper.DisplayMetrics: JDisplayMetrics;
begin
  if Display <> nil then
  begin
    Result := TJDisplayMetrics.Create;
    Display.getMetrics(Result);
  end
  else
    Result := nil;
end;

class function TAndroidHelper.GetApplicationTitle: string;
begin
  Result := JCharSequenceToStr(FJContext.getPackageManager.getApplicationLabel(FJContext.getApplicationInfo));
end;

class function TAndroidHelper.GetJActivity: JActivity;
begin
  if System.DelphiActivity = nil then
                                                                                                                                        
    raise Exception.Create('Activity not found, maybe you are in a service.')
  else
    Result := FJActivity;
end;

class function TAndroidHelper.GetMainHandler: JHandler;
begin
  if FMainHandler = nil then
    FMainHandler := TJHandler.JavaClass.init(TJLooper.JavaClass.getMainLooper);
  Result := FMainHandler;
end;

class function TAndroidHelper.GetPackagePath: string;
begin
  Result := JStringToString(FJContext.getApplicationInfo.nativeLibraryDir);
end;

class function TAndroidHelper.GetPrivatePreferences: JSharedPreferences;
begin
  Result := Activity.getPreferences(TJActivity.JavaClass.MODE_PRIVATE);
end;

class function TAndroidHelper.GetResourceID(const AResourceName: string): Integer;
begin
  Result := Activity.getResources.getIdentifier(StringToJString(AResourceName), nil, Activity.getPackageName);
end;

class function TAndroidHelper.GetResourceID(const AResourceName, AResourceType: string): Integer;
begin
  Result := Activity.getResources.getIdentifier(StringToJString(AResourceName), StringToJString(AResourceType), Activity.getPackageName);
end;

class function TAndroidHelper.GetResourceString(AResourceID: Integer): string;
begin
  Result := JStringToString(Activity.getResources.getString(AResourceID));
end;

class function TAndroidHelper.HasSystemService(const AFeatureName: JString): Boolean;
begin
  Result := Context.getPackageManager.hasSystemFeature(AFeatureName);
end;

class function TAndroidHelper.JCharSequenceToStr(const ASource: JCharSequence): string;
begin
  if ASource = nil then
    Result := ''
  else
    Result := JStringToString(ASource.toString);
end;

class function TAndroidHelper.JFileToJURI(const AFile: JFile): Jnet_Uri;
var
  LAuthority: JString;
begin
  // If running on Android Nougat (7.0) or later, use a file provider to turn the file into a URI.
  // This relies on enabling the Secure File Sharing entitlement in order to get the file provider.
  if TOSVersion.Check(7) then
  begin
    LAuthority := Context.getApplicationContext.getPackageName.concat(StringToJString('.fileprovider'));
    Result := TJFileProvider.JavaClass.getUriForFile(Context, LAuthority, AFile);
  end
  else
    Result := TJnet_uri.JavaClass.fromFile(AFile);
end;

class function TAndroidHelper.JObjectToID(const AObject: JObject): Pointer;
begin
  Result := TJNIResolver.JavaInstanceToID(AObject);
end;

class function TAndroidHelper.JStringToString(const JStr: JString): string;
begin
  if JStr = nil then
    Result := ''
  else
    Result := JNIStringToString(TJNIResolver.GetJNIEnv, JNIString((JStr as ILocalObject).GetObjectID));
end;

class function TAndroidHelper.JURIToStr(const ASource: Jnet_Uri): string;
begin
  if ASource = nil then
    Result := ''
  else
    Result := JStringToString(ASource.toString);
end;

class function TAndroidHelper.StringToJString(const Str: string): JString;
var
  LocalRef: JNIObject;
  PEnv: PJNIEnv;
begin
  PEnv := TJNIResolver.GetJNIEnv;
  LocalRef := StringToJNIString(PEnv, Str);
  Result := TJString.Wrap(LocalRef);
  PEnv^.DeleteLocalRef(PEnv, LocalRef);
end;

class function TAndroidHelper.StrToJCharSequence(const ASource: string): JCharSequence;
begin
  Result := TJCharSequence.Wrap(StringToJString(ASource));
end;

class function TAndroidHelper.StrToJURI(const ASource: string): Jnet_Uri;
begin
  Result := TJnet_Uri.JavaClass.parse(StringToJString(ASource));
end;

class function TAndroidHelper.TBytesToTJavaArray(const ABytes: TBytes): TJavaArray<Byte>;
var
  LLength: Integer;
begin
  LLength := Length(ABytes);
  Result := TJavaArray<System.Byte>.Create(LLength);
  if LLength > 0 then
    Move(ABytes[0], PByte(Result.Data)^, LLength);
end;

class function TAndroidHelper.TJavaArrayToTBytes(const AJArray: TJavaArray<Byte>): TBytes;
var
  LLength: Integer;
begin
  if AJArray <> nil then
  begin
    LLength := AJArray.Length;
    SetLength(Result, LLength);
    if LLength > 0 then
      Move(PByte(AJArray.Data)^, Result[0], LLength);
  end
  else
    Result := nil;
end;

end.

