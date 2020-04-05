{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{     Implementation Notification Center for Android    }
{                                                       }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Android.Notification;

interface

{$SCOPEDENUMS ON}

uses
  System.Notification;

  /// <summary>Common ancestor used to instantiate platform implementation</summary>
  type TPlatformNotificationCenter = class(TBaseNotificationCenter)
  protected
    class function GetInstance: TBaseNotificationCenter; override;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, System.Classes, System.Messaging, System.TimeSpan,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.App,
  Androidapi.JNI.Support,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Media,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNIBridge,
  Androidapi.JNI.Net,
  Androidapi.Helpers;

type

  { TNotificationCenterAndroid }

  TAndroidPreferenceAdapter = class
  strict private
    FPreference: JSharedPreferences;
    function FindNotification(const AName: string; out AIndex: Integer; out AID: Integer): Boolean;
    function ExtractName(const AStr: string): string;
    function ExtractID(const AStr: string): Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SaveNotification(const ANotification: TNotification; const AID: Integer);
    procedure RemoveNotification(const AName: string);
    function IndexOf(const AName: string): Integer;
    function Find(const AName: string; out Index: Integer): Boolean;
    function GetID(const AName: string): Integer;
    function Contains(const AName: string): Boolean;
    function GetAllNotificationsNames: TStringList;
  end;

  TNotificationCenterAndroid = class(TPlatformNotificationCenter)
  private
    class var FNotificationCenterSingleton: TNotificationCenterAndroid;
  strict private
    FExternalStore: TAndroidPreferenceAdapter;
    FNotificationManager: JNotificationManager;
    function CreateNativeNotification(const ANotification: TNotification): JNotification;
    procedure SaveNotificationIntoIntent(var AIntent: JIntent; const ANotification: TNotification; const AID: Integer = -1);
    function LoadNotificationFromIntent(const AIntent: JIntent): TNotification;
    function CreateChannel(const AChannel: JNotificationChannel): TChannel; overload;
    function CreateChannel(const AChannel: TChannel): JNotificationChannel; overload;
    procedure CancelScheduledNotification(const AName: string);
    { Global FMX event }
    procedure DidFormsLoad;
    procedure DidReceiveNotification(const Sender: TObject; const M: TMessage);

    class function GetNotificationCenter: TNotificationCenterAndroid; static;
    class destructor Destroy;
  public
    constructor Create;
    destructor Destroy; override;

    procedure DoScheduleNotification(const ANotification: TNotification); override;
    procedure DoPresentNotification(const ANotification: TNotification); override;
    procedure DoCancelNotification(const AName: string); overload; override;
    procedure DoCancelNotification(const ANotification: TNotification); overload; override;
    procedure DoCancelAllNotifications; override;
    procedure DoCreateOrUpdateChannel(const AChannel: TChannel); override;
    procedure DoDeleteChannel(const AChannelId: string); override;
    procedure DoGetAllChannels(const AChannels: TChannels); override;

    { Not supported }
    procedure DoSetIconBadgeNumber(const ACount: Integer); override;
    function DoGetIconBadgeNumber: Integer; override;
    procedure DoResetIconBadgeNumber; override;

    procedure DoLoaded; override;

    class property NotificationCenter: TNotificationCenterAndroid read GetNotificationCenter;
  end;

  TGeneratorUniqueID = class
  const
    SettingsNotificationUniquiID = 'SETTINGS_NOTIFICATION_UNIQUE_ID';
  strict private
    class var FNextUniqueID: Int64;
    class var FPreference: JSharedPreferences;
  public
    class constructor Create;
    class function GenerateID: Integer;
  end;

function GetNotificationService: JNotificationManager;
var
  NotificationServiceNative: JObject;
begin
  NotificationServiceNative := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.NOTIFICATION_SERVICE);
  Result := TJNotificationManager.Wrap((NotificationServiceNative as ILocalObject).GetObjectID);
end;

{$REGION 'TNotificationCenterAndroid'}

function DateTimeLocalToUnixMSecGMT(const ADateTime: TDateTime): Int64;
begin
  Result := DateTimeToUnix(ADateTime) * MSecsPerSec - Round(TTimeZone.Local.UtcOffset.TotalMilliseconds);
end;

function TNotificationCenterAndroid.CreateNativeNotification(const ANotification: TNotification): JNotification;

  function GetDefaultNotificationSound: Jnet_Uri;
  begin
    Result := TJRingtoneManager.JavaClass.getDefaultUri(TJRingtoneManager.JavaClass.TYPE_NOTIFICATION);
  end;

  function GetDefaultIconID: Integer;
  begin
    Result := TAndroidHelper.GetResourceID('drawable/ic_notification');
    if Result = 0 then
      Result := TAndroidHelper.Context.getApplicationInfo.icon;
  end;

  function GetContentTitle: JCharSequence;
  begin
    if ANotification.Title.IsEmpty then
      Result := StrToJCharSequence(TAndroidHelper.ApplicationTitle)
    else
      Result := StrToJCharSequence(ANotification.Title);
  end;

  function GetContentText: JCharSequence;
  begin
    Result := StrToJCharSequence(ANotification.AlertBody);
  end;

  function GetContentIntent: JPendingIntent;
  var
    Intent: JIntent;
  begin
    Intent := TAndroidHelper.Context.getPackageManager().getLaunchIntentForPackage(TAndroidHelper.Context.getPackageName());
    Intent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_SINGLE_TOP or TJIntent.JavaClass.FLAG_ACTIVITY_CLEAR_TOP);
    SaveNotificationIntoIntent(Intent, ANotification);
    Result := TJPendingIntent.JavaClass.getActivity(TAndroidHelper.Context, TGeneratorUniqueID.GenerateID, Intent, TJPendingIntent.JavaClass.FLAG_UPDATE_CURRENT);
  end;

var
  Builder: JNotificationCompat_Builder;
  ChannelsManager: JChannelsManager;
  AccentColorResId: Integer;
  AccentColor: Integer;
begin
  Builder := TJNotificationCompat_Builder.JavaClass.init(TAndroidHelper.Context);
  Builder.setDefaults(TJNotification.JavaClass.DEFAULT_LIGHTS)
         .setSmallIcon(GetDefaultIconID)
         .setContentTitle(GetContentTitle)
         .setContentText(GetContentText)
         .setTicker(GetContentText)
         .setContentIntent(GetContentIntent)
         .setNumber(ANotification.Number)
         .setAutoCancel(True)
         .setWhen(TJDate.Create.getTime);
  if ANotification.EnableSound then
    if ANotification.SoundName.IsEmpty then
      Builder := Builder.setSound(GetDefaultNotificationSound)
    else
      Builder := Builder.setSound(StrToJURI(ANotification.SoundName));

  if TOSVersion.Check(5) then
  begin
    AccentColorResId := TAndroidHelper.GetResourceID('color/notification_accent_color');
    if AccentColorResId <> 0 then
    begin
      AccentColor := TJContextCompat.JavaClass.getColor(TAndroidHelper.Activity, AccentColorResId);
      Builder.setColor(AccentColor);
    end;
  end;

  if TOSVersion.Check(8, 0) then
  begin
    if ANotification.ChannelId.IsEmpty then
    begin
      ChannelsManager := TJChannelsManager.JavaClass.init(TAndroidHelper.Context);
      Builder.setChannelId(ChannelsManager.getDefaultChannelId);
    end
    else
      Builder.setChannelId(StringToJString(ANotification.ChannelId));
  end;

  // Action buttons won't appear on platforms prior to Android 4.1!!!
  // http://developer.android.com/reference/android/support/v4/app/NotificationCompat.Builder.html#addAction
  Result := Builder.Build;
end;

procedure TNotificationCenterAndroid.SaveNotificationIntoIntent(var AIntent: JIntent; const ANotification: TNotification;
  const AID: Integer);
var
  LaunchIntent: JIntent;
begin
  AIntent.setAction(TJNotificationInfo.JavaClass.ACTION_NOTIFICATION);
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_UNIQUE_ID, AID);
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_NAME, StringToJString(ANotification.Name));
  if ANotification.Title.IsEmpty then
    AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_TITLE, StringToJString(TAndroidHelper.ApplicationTitle))
  else
    AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_TITLE, StringToJString(ANotification.Title));
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_ALERT_BODY, StringToJString(ANotification.AlertBody));
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_ALERT_ACTION, StringToJString(ANotification.AlertAction));
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_NUMBER, ANotification.Number);
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_FIRE_DATE, ANotification.FireDate);
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_FIRE_GMT_DATE, DateTimeLocalToUnixMSecGMT(ANotification.FireDate));
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_REPEAT_INTERVAL, Integer(ANotification.RepeatInterval));
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_ENABLE_SOUND, ANotification.EnableSound);
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_SOUND_NAME, StringToJString(ANotification.SoundName));
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_HAS_ACTION, ANotification.HasAction);
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_CHANNEL_ID, StringToJString(ANotification.ChannelId));
  LaunchIntent := TAndroidHelper.Context.getPackageManager().getLaunchIntentForPackage(TAndroidHelper.Context.getPackageName());
  AIntent.putExtra(TJNotificationInfo.JavaClass.EXTRA_ACTIVITY_CLASS_NAME, LaunchIntent.getComponent().getClassName());
end;

function TNotificationCenterAndroid.LoadNotificationFromIntent(const AIntent: JIntent): TNotification;
begin
  Result := TNotification.Create;
  Result.Name := JStringToString(AIntent.getStringExtra(TJNotificationInfo.JavaClass.EXTRA_NAME));
  Result.Title := JStringToString(AIntent.getStringExtra(TJNotificationInfo.JavaClass.EXTRA_TITLE));
  Result.AlertBody := JStringToString(AIntent.getStringExtra(TJNotificationInfo.JavaClass.EXTRA_ALERT_BODY));
  Result.AlertAction := JStringToString(AIntent.getStringExtra(TJNotificationInfo.JavaClass.EXTRA_ALERT_ACTION));
  Result.Number := AIntent.getIntExtra(TJNotificationInfo.JavaClass.EXTRA_NUMBER, 0);
  Result.FireDate := AIntent.getDoubleExtra(TJNotificationInfo.JavaClass.EXTRA_FIRE_DATE, Now);
  Result.RepeatInterval := TRepeatInterval(AIntent.getIntExtra(TJNotificationInfo.JavaClass.EXTRA_REPEAT_INTERVAL, Integer(TRepeatInterval.None)));
  Result.EnableSound := AIntent.getBooleanExtra(TJNotificationInfo.JavaClass.EXTRA_ENABLE_SOUND, True);
  Result.SoundName := JStringToString(AIntent.getStringExtra(TJNotificationInfo.JavaClass.EXTRA_SOUND_NAME));
  Result.HasAction := AIntent.getBooleanExtra(TJNotificationInfo.JavaClass.EXTRA_HAS_ACTION, True);
  Result.ChannelId := JStringToString(AIntent.getStringExtra(TJNotificationInfo.JavaClass.EXTRA_CHANNEL_ID));
end;

class destructor TNotificationCenterAndroid.Destroy;
begin
  FNotificationCenterSingleton.Free;
end;

procedure TNotificationCenterAndroid.DidFormsLoad;

  function IsIntentWithNotification(const Intent: JIntent): Boolean;
  begin
    Result := (Intent <> nil) and (Intent.getAction <> nil) and
      Intent.getAction.equals(TJNotificationInfo.JavaClass.ACTION_NOTIFICATION);
  end;

var
  InputIntent: JIntent;
  Notification: TNotification;
begin
  if System.DelphiActivity <> nil then // This code will be executed if we have an activity
  begin
    InputIntent :=  TAndroidHelper.Activity.getIntent;
    if IsIntentWithNotification(InputIntent) then
    begin
      Notification := LoadNotificationFromIntent(InputIntent);
      try
        TMessageManager.DefaultManager.SendMessage(Self, TMessage<TNotification>.Create(Notification));
      finally
         Notification.DisposeOf;
      end;
    end;
  end;
end;

procedure TNotificationCenterAndroid.DidReceiveNotification(const Sender: TObject; const M: TMessage);

  function IsIntentWithNotification(Intent: JIntent): Boolean;
  begin
    Result := (Intent <> nil) and (Intent.getAction <> nil) and
      Intent.getAction.equals(TJNotificationInfo.JavaClass.ACTION_NOTIFICATION);
  end;

var
  InputIntent: JIntent;
  Notification: TNotification;
begin
  if M is TMessageReceivedNotification then
  begin
    InputIntent := (M as TMessageReceivedNotification).Value;
    if IsIntentWithNotification(InputIntent) then
    begin
      Notification := LoadNotificationFromIntent(InputIntent);
      try
        TMessageManager.DefaultManager.SendMessage(Self, TMessage<TNotification>.Create(Notification));
      finally
         Notification.DisposeOf;
      end;
    end;
  end;
end;

constructor TNotificationCenterAndroid.Create;
begin
  FExternalStore := TAndroidPreferenceAdapter.Create;
  FNotificationManager := GetNotificationService;
  { Subscription }
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageReceivedNotification, DidReceiveNotification);
end;

function TNotificationCenterAndroid.CreateChannel(const AChannel: TChannel): JNotificationChannel;

  function AsNativeImportance(const AImportance: TImportance): Integer;
  begin
    case AImportance of
      TImportance.Unspecified:
        Result := TJNotificationManager.JavaClass.IMPORTANCE_UNSPECIFIED;
      TImportance.None:
        Result := TJNotificationManager.JavaClass.IMPORTANCE_NONE;
      TImportance.Default:
        Result := TJNotificationManager.JavaClass.IMPORTANCE_DEFAULT;
      TImportance.Min:
        Result := TJNotificationManager.JavaClass.IMPORTANCE_MIN;
      TImportance.Low:
        Result := TJNotificationManager.JavaClass.IMPORTANCE_MIN;
      TImportance.High:
        Result := TJNotificationManager.JavaClass.IMPORTANCE_HIGH;
    else
      Result := TJNotificationManager.JavaClass.IMPORTANCE_UNSPECIFIED;
    end;
  end;

  function AsNativeLockscreenVisibility(const ALockscreenVisibility: TLockscreenVisibility): Integer;
  begin
    case ALockscreenVisibility of
      TLockscreenVisibility.Public:
        Result := TJNotification.JavaClass.VISIBILITY_PUBLIC;
      TLockscreenVisibility.Private:
        Result := TJNotification.JavaClass.VISIBILITY_PRIVATE;
      TLockscreenVisibility.Secret:
        Result := TJNotification.JavaClass.VISIBILITY_SECRET;
    else
      Result := TJNotification.JavaClass.VISIBILITY_PUBLIC;
    end;
  end;

begin
  Result := TJNotificationChannel.JavaClass.init(StringToJString(AChannel.Id), StrToJCharSequence(AChannel.Title),
                                                 AsNativeImportance(ACHannel.Importance));

  Result.setDescription(StringToJString(AChannel.Description));
  Result.setLockscreenVisibility(AsNativeLockscreenVisibility(AChannel.LockscreenVisibility));
  Result.setShowBadge(AChannel.ShouldShowBadge);
  Result.enableLights(AChannel.ShouldShowLights);
  Result.enableVibration(AChannel.ShouldVibrate);
end;

function TNotificationCenterAndroid.CreateChannel(const AChannel: JNotificationChannel): TChannel;

  function ExtractLockscreenVisibility(const ALockscreenVisibility: Integer): TLockscreenVisibility;
  begin
    if ALockscreenVisibility = TJNotification.JavaClass.VISIBILITY_PRIVATE then
      Result := TLockscreenVisibility.Private
    else if ALockscreenVisibility = TJNotification.JavaClass.VISIBILITY_PUBLIC then
      Result := TLockscreenVisibility.Public
    else if ALockscreenVisibility = TJNotification.JavaClass.VISIBILITY_SECRET then
      Result := TLockscreenVisibility.Secret
    else
      Result := TLockscreenVisibility.Public;
  end;

  function ExtractImportance(const AImportance: Integer): TImportance;
  begin
    if AImportance = TJNotificationManager.JavaClass.IMPORTANCE_DEFAULT then
      Result := TImportance.Default
    else if AImportance = TJNotificationManager.JavaClass.IMPORTANCE_HIGH then
      Result := TImportance.High
    else if AImportance = TJNotificationManager.JavaClass.IMPORTANCE_LOW then
      Result := TImportance.Low
    else if AImportance = TJNotificationManager.JavaClass.IMPORTANCE_MIN then
      Result := TImportance.Min
    else if AImportance = TJNotificationManager.JavaClass.IMPORTANCE_NONE then
      Result := TImportance.None
    else if AImportance = TJNotificationManager.JavaClass.IMPORTANCE_UNSPECIFIED then
      Result := TImportance.Unspecified
    else
      Result := TImportance.Unspecified;
  end;

begin
  Result := TChannel.Create;
  Result.Id := JStringToString(AChannel.getId);
  Result.Title := JCharSequenceToStr(AChannel.getName);
  Result.Description := JStringToString(AChannel.getDescription);
  Result.LockscreenVisibility := ExtractLockscreenVisibility(AChannel.getLockscreenVisibility);
  Result.Importance := ExtractImportance(AChannel.getImportance);
  Result.ShouldShowLights := AChannel.shouldShowLights;
  Result.ShouldVibrate := AChannel.shouldVibrate;
  Result.ShouldShowBadge := AChannel.canShowBadge;
end;

destructor TNotificationCenterAndroid.Destroy;
begin
  FExternalStore.DisposeOf;
  FNotificationManager := nil;
  { Unsibscribe }
  TMessageManager.DefaultManager.Unsubscribe(TMessageReceivedNotification, DidReceiveNotification);
  inherited;
end;

procedure TNotificationCenterAndroid.DoPresentNotification(const ANotification: TNotification);
var
  NativeNotification: JNotification;
begin
  NativeNotification := CreateNativeNotification(ANotification);
  if ANotification.Name.IsEmpty then
    FNotificationManager.notify(TGeneratorUniqueID.GenerateID, NativeNotification)
  else
    FNotificationManager.notify(StringToJString(ANotification.Name), 0, NativeNotification);
  NativeNotification := nil;
end;

procedure TNotificationCenterAndroid.DoScheduleNotification(const ANotification: TNotification);

  function CreateNotificationAlarmIntent(const AID: Integer): JPendingIntent;
  var
    Intent: JIntent;
    Alarm: JNotificationAlarm;
  begin
    Alarm := TJNotificationAlarm.Create;
    Intent := TJIntent.Create;
    Intent.setClass(TAndroidHelper.Context, Alarm.getClass);
    Intent.setAction(TJNotificationInfo.JavaClass.ACTION_NOTIFICATION);
    SaveNotificationIntoIntent(Intent, ANotification, AID);
    Result := TJPendingIntent.JavaClass.getBroadcast(TAndroidHelper.Context, AID, Intent,
      TJPendingIntent.JavaClass.FLAG_UPDATE_CURRENT);
  end;

var
  PendingIntent: JPendingIntent;
  ID: Integer;
begin
  if not ANotification.Name.IsEmpty and FExternalStore.Contains(ANotification.Name) then
    CancelNotification(ANotification.Name);

  ID := TGeneratorUniqueID.GenerateID;
  PendingIntent := CreateNotificationAlarmIntent(ID);
  FExternalStore.SaveNotification(ANotification, ID);

  TAndroidHelper.AlarmManager.&set(TJAlarmManager.JavaClass.RTC_WAKEUP, DateTimeLocalToUnixMSecGMT(ANotification.FireDate),
    PendingIntent);
end;

procedure TNotificationCenterAndroid.DoCancelAllNotifications;
var
  Notifications: TStringList;
  NotificationName: string;
begin
  // Cancel all Presented notification
  FNotificationManager.cancelAll;

  // Cancel all scheduled notifications
  Notifications := FExternalStore.GetAllNotificationsNames;
  try
    for NotificationName in Notifications do
    begin
      CancelScheduledNotification(NotificationName);
      FExternalStore.RemoveNotification(NotificationName);
    end;
  finally
    Notifications.Free;
  end;
end;

procedure TNotificationCenterAndroid.DoCancelNotification(const ANotification: TNotification);
begin
  DoCancelNotification(ANotification.Name);
end;

procedure TNotificationCenterAndroid.DoCreateOrUpdateChannel(const AChannel: TChannel);
var
  NativeChannel: JNotificationChannel;
begin
  if not TOSVersion.Check(8, 0) then
    Exit;

  NativeChannel := CreateChannel(AChannel);
  FNotificationManager.createNotificationChannel(NativeChannel);
end;

procedure TNotificationCenterAndroid.DoDeleteChannel(const AChannelId: string);
begin
  if not TOSVersion.Check(8, 0) then
    Exit;

  FNotificationManager.deleteNotificationChannel(StringToJString(AChannelId));
end;

procedure TNotificationCenterAndroid.CancelScheduledNotification(const AName: string);
var
  ID: Integer;
  Intent: JIntent;
  Alarm: JNotificationAlarm;
  PendingIntent: JPendingIntent;
begin
  if FExternalStore.Contains(AName) then
  begin
    ID := FExternalStore.GetID(AName);
    try
      Alarm := TJNotificationAlarm.Create;
      Intent := TJIntent.Create;
      Intent.setClass(TAndroidHelper.Context, Alarm.getClass);
      Intent.setAction(TJNotificationInfo.JavaClass.ACTION_NOTIFICATION);
      PendingIntent := TJPendingIntent.JavaClass.getBroadcast(TAndroidHelper.Context, ID, Intent,
        TJPendingIntent.JavaClass.FLAG_UPDATE_CURRENT);
      TAndroidHelper.AlarmManager.cancel(PendingIntent);
    finally
      FExternalStore.RemoveNotification(AName);
    end;
  end;
end;

procedure TNotificationCenterAndroid.DoCancelNotification(const AName: string);
begin
  FNotificationManager.cancel(StringToJString(AName), 0);
  CancelScheduledNotification(AName);
end;

procedure TNotificationCenterAndroid.DoSetIconBadgeNumber(const ACount: Integer);
begin
  // Android doesn't have Number icon on application Icon
end;

class function TNotificationCenterAndroid.GetNotificationCenter: TNotificationCenterAndroid;
begin
  if FNotificationCenterSingleton = nil then
    FNotificationCenterSingleton := TNotificationCenterAndroid.Create;
  Result := FNotificationCenterSingleton;
end;

procedure TNotificationCenterAndroid.DoGetAllChannels(const AChannels: TChannels);
var
  Channels: JList;
  I: Integer;
  NativeChannel: JNotificationChannel;
begin
  if not TOSVersion.Check(8, 0) then
    Exit;

  Channels := FNotificationManager.getNotificationChannels;
  for I := 0 to Channels.size - 1 do
  begin
    NativeChannel := TJNotificationChannel.Wrap(Channels.get(I));
    AChannels.Add(CreateChannel(NativeChannel));
  end;
end;

function TNotificationCenterAndroid.DoGetIconBadgeNumber: Integer;
begin
  // Android doesn't have Number icon on application Icon
  Result := 0;
end;

procedure TNotificationCenterAndroid.DoLoaded;
begin
  inherited;
  // DoLoaded is invoked before TForm.OnCreate. However, we have to process receiving of the Local Notification
  // strictly after the form is fully loaded, because we need to invoke TNotificationCenter.OnReceiveLocalNotification
  // after TForm.OnCreate.
  TThread.ForceQueue(nil, procedure begin
    DidFormsLoad;
  end);
end;

procedure TNotificationCenterAndroid.DoResetIconBadgeNumber;
begin
  // Android doesn't have Number icon on application Icon
end;

{$ENDREGION}

{ TGeneratorUniqueID }

class constructor TGeneratorUniqueID.Create;
begin
  FPreference := TAndroidHelper.Context.getSharedPreferences(TJNotificationAlarm.JavaClass.NOTIFICATION_CENTER, TJContext.JavaClass.MODE_PRIVATE);
  FNextUniqueID := FPreference.getInt(StringToJString(SettingsNotificationUniquiID), 0);
end;

class function TGeneratorUniqueID.GenerateID: Integer;
var
  PreferenceEditor: JSharedPreferences_Editor;
begin
  PreferenceEditor := FPreference.edit;
  try
    PreferenceEditor.putInt(StringToJString(SettingsNotificationUniquiID), FNextUniqueID);
  finally
    PreferenceEditor.commit;
  end;
  Result := FNextUniqueID;
  Inc(FNextUniqueID);
end;

{ TAndroidStorageAdapter }

function TAndroidPreferenceAdapter.FindNotification(const AName: string; out AIndex, AID: Integer): Boolean;
var
  Found: Boolean;
  Notifications: TStringList;
  NotificationPair: string;
  NotificationName: string;
  NotificationID: Integer;
  NotificationsStr: JString;
  I: Integer;
begin
  AIndex := -1;
  AID := -1;
  Notifications := TStringList.Create;
  try
    NotificationsStr := FPreference.getString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, nil);
    Notifications.Text := JStringToString(NotificationsStr);
    Found := False;
    I := 0;
    while (I < Notifications.Count) and not Found do
    begin
      NotificationPair := Notifications[I];
      NotificationName := ExtractName(NotificationPair);
      NotificationID := ExtractID(NotificationPair);
      if (NotificationID > -1) and (NotificationName = AName) then
      begin
        AIndex := I;
        Found := True;
      end;
      Inc(I);
    end;
    Result := Found;
  finally
    Notifications.DisposeOf;
  end;
end;

function TAndroidPreferenceAdapter.ExtractName(const AStr: string): string;
begin
  Result := AStr.Substring(0, AStr.LastIndexOf('='));
end;

function TAndroidPreferenceAdapter.ExtractID(const AStr: string): Integer;
var
  StrTmp: string;
begin
  StrTmp := AStr.Substring(AStr.LastIndexOf('=') + 1);
  if not TryStrToInt(StrTmp, Result) then
    Result := -1;
end;

constructor TAndroidPreferenceAdapter.Create;
begin
  FPreference := TAndroidHelper.Context.getSharedPreferences(TJNotificationAlarm.JavaClass.NOTIFICATION_CENTER, TJContext.JavaClass.MODE_PRIVATE);
end;

destructor TAndroidPreferenceAdapter.Destroy;
begin
  FPreference := nil;
  inherited;
end;

procedure TAndroidPreferenceAdapter.SaveNotification(const ANotification: TNotification; const AID: Integer);
var
  PreferenceEditor: JSharedPreferences_Editor;
  NotificationsList: TStringList;
  Index: Integer;
  Notifications: JString;
begin
  if not ANotification.Name.IsEmpty then
  begin
    Notifications := FPreference.getString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, nil);
    NotificationsList := TStringList.Create;
    try
      NotificationsList.Text := JStringToString(Notifications);
      if Find(ANotification.Name, Index) then
        NotificationsList.Delete(Index);
      NotificationsList.Add(ANotification.Name + '=' + AID.ToString);
      PreferenceEditor := FPreference.edit;
      try
        PreferenceEditor.putString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, StringToJString(NotificationsList.Text));
      finally
        PreferenceEditor.commit;
      end;
    finally
      NotificationsList.DisposeOf;
    end;
  end;
end;

procedure TAndroidPreferenceAdapter.RemoveNotification(const AName: string);
var
  NotificationsList: TStringList;
  Notifications: JString;
  I: Integer;
  Found: Boolean;
  PreferenceEditor: JSharedPreferences_Editor;
begin
  NotificationsList := TStringList.Create;
  try
    Notifications := FPreference.getString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, nil);
    NotificationsList.Text := JStringToString(Notifications);
    I := 0;
    Found := False;
    while not Found and (I < NotificationsList.Count) do
      if ExtractName(NotificationsList[I]) = AName then
        Found := True
      else
        Inc(I);

    if Found then
    begin
      PreferenceEditor := FPreference.edit;
      try
        NotificationsList.Delete(I);
        PreferenceEditor.putString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, StringToJString(NotificationsList.Text));
      finally
        PreferenceEditor.commit;
      end;
    end;
  finally
    NotificationsList.DisposeOf;
  end;
end;

function TAndroidPreferenceAdapter.IndexOf(const AName: string): Integer;
var
  ID: Integer;
begin
  FindNotification(AName, Result, ID);
end;

function TAndroidPreferenceAdapter.Find(const AName: string; out Index: Integer): Boolean;
var
  ID: Integer;
begin
  Result := FindNotification(AName, Index, ID);
end;

function TAndroidPreferenceAdapter.GetAllNotificationsNames: TStringList;
var
  Notifications: TStringList;
  NotificationsStr: JString;
  I: Integer;
begin
  Notifications := TStringList.Create;
  NotificationsStr := FPreference.getString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, nil);
  Notifications.Text := JStringToString(NotificationsStr);
  for I := 0 to Notifications.Count - 1 do
    Notifications[I] := ExtractName(Notifications[I]);

  Result := Notifications;
end;

function TAndroidPreferenceAdapter.GetID(const AName: string): Integer;
var
  NotificationsStr: JString;
  Notifications: TStringList;
  IDStr: string;
  Notification: string;
begin
  Notifications := TStringList.Create;
  try
    NotificationsStr := FPreference.getString(TJNotificationAlarm.JavaClass.SETTINGS_NOTIFICATION_IDS, nil);
    Notifications.Text := JStringToString(NotificationsStr);

    for Notification in Notifications do
    begin
      IDStr := Notification.Substring(Notification.IndexOf('=') + 1);
      if TryStrToInt(IDStr, Result) then
        Break
      else
        Result := -1;
    end;
  finally
    Notifications.DisposeOf;
  end;
end;

function TAndroidPreferenceAdapter.Contains(const AName: string): Boolean;
begin
  Result := IndexOf(AName) > -1;
end;

{ TPlatformNotificationCenter }

class function TPlatformNotificationCenter.GetInstance: TBaseNotificationCenter;
begin
  Result := TBaseNotificationCenter(TNotificationCenterAndroid.NotificationCenter)
end;

end.
