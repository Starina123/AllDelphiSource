{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{      Notification Center implementation for iOS       }
{                                                       }
{ Copyright(c) 2013-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.iOS.Notification;

interface

{$SCOPEDENUMS ON}

uses
  System.Notification;

type
  /// <summary>Common ancestor used to instantiate platform implementation</summary>
  TPlatformNotificationCenter = class(TBaseNotificationCenter)
  protected
    class function GetInstance: TBaseNotificationCenter; override;
  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.Messaging,
  System.DateUtils,
  System.SysConst,
  Macapi.ObjectiveC,
  Macapi.Helpers,
  iOSapi.Foundation,
  iOSapi.CocoaTypes,
  iOSapi.UIKit;

{ iOSApi.UserNotification }

const
  UNAuthorizationOptionBadge = 1;
  UNAuthorizationOptionSound = 2;
  UNAuthorizationOptionAlert = 4;

type
  UNNotification = interface;
  UNNotificationAction = interface;
  UNNotificationCategory = interface;
  UNNotificationContent = interface;
  UNMutableNotificationContent = interface;
  UNNotificationRequest = interface;
  UNNotificationResponse = interface;
  UNNotificationSettings = interface;
  UNNotificationSound = interface;
  UNNotificationTrigger = interface;
  UNPushNotificationTrigger = interface;
  UNTimeIntervalNotificationTrigger = interface;
  UNCalendarNotificationTrigger = interface;
  UNUserNotificationCenter = interface;

  PNSError = ^NSError; // Added manually
  UNErrorCode = NSInteger;
  UNNotificationActionOptions = NSInteger;
  UNNotificationCategoryOptions = NSInteger;
  UNAuthorizationStatus = NSInteger;
  UNShowPreviewsSetting = NSInteger;
  UNNotificationSetting = NSInteger;
  UNAlertStyle = NSInteger;
  UNNotificationSoundName = NSString;
  UNAuthorizationOptions = NSInteger;
  UNNotificationPresentationOptions = NSInteger;
  TUNUserNotificationCenterBlockMethod1 = procedure(granted: Boolean; error: NSError) of object;
  TUNUserNotificationCenterBlockMethod2 = procedure(categories: NSSet) of object;
  TUNUserNotificationCenterBlockMethod3 = procedure(settings: UNNotificationSettings) of object;
  TUNUserNotificationCenterBlockMethod4 = procedure(error: NSError) of object;
  TUNUserNotificationCenterBlockMethod5 = procedure(requests: NSArray) of object;
  TUNUserNotificationCenterBlockMethod6 = procedure(notifications: NSArray) of object;

  UNNotificationClass = interface(NSObjectClass)
    ['{6D4428D5-18A3-4913-AD3D-99398B6A89CB}']
  end;
  UNNotification = interface(NSObject)
    ['{AFEE6151-57D2-4811-B5E8-3CDF1DDFBE57}']
    function date: NSDate; cdecl;
    function request: UNNotificationRequest; cdecl;
  end;
  TUNNotification = class(TOCGenericImport<UNNotificationClass, UNNotification>) end;

  UNNotificationActionClass = interface(NSObjectClass)
    ['{3A506339-56AB-4579-A1B2-F08E7A2D6C9A}']
    [MethodName('actionWithIdentifier:title:options:')]
    {class} function actionWithIdentifier(identifier: NSString; title: NSString; options: UNNotificationActionOptions): UNNotificationAction; cdecl;
  end;
  UNNotificationAction = interface(NSObject)
    ['{5B3E600A-3DB8-4257-9397-A2590D0B134D}']
    function identifier: NSString; cdecl;
    function options: UNNotificationActionOptions; cdecl;
    function title: NSString; cdecl;
  end;
  TUNNotificationAction = class(TOCGenericImport<UNNotificationActionClass, UNNotificationAction>) end;

  UNNotificationCategoryClass = interface(NSObjectClass)
    ['{34B7ADD9-3404-436E-82C5-47E368E6DC17}']
    [MethodName('categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:')]
    {class} function categoryWithIdentifier(identifier: NSString; actions: NSArray; intentIdentifiers: NSArray; hiddenPreviewsBodyPlaceholder: NSString; categorySummaryFormat: NSString; options: UNNotificationCategoryOptions): UNNotificationCategory; cdecl; overload;
    [MethodName('categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:options:')]
    {class} function categoryWithIdentifier(identifier: NSString; actions: NSArray; intentIdentifiers: NSArray; hiddenPreviewsBodyPlaceholder: NSString; options: UNNotificationCategoryOptions): UNNotificationCategory; cdecl; overload;
    [MethodName('categoryWithIdentifier:actions:intentIdentifiers:options:')]
    {class} function categoryWithIdentifier(identifier: NSString; actions: NSArray; intentIdentifiers: NSArray; options: UNNotificationCategoryOptions): UNNotificationCategory; cdecl; overload;
  end;
  UNNotificationCategory = interface(NSObject)
    ['{26B3E2D1-4E43-42CF-8AB3-344E2455D75F}']
    function actions: NSArray; cdecl;
    function categorySummaryFormat: NSString; cdecl;
    function hiddenPreviewsBodyPlaceholder: NSString; cdecl;
    function identifier: NSString; cdecl;
    function intentIdentifiers: NSArray; cdecl;
    function options: UNNotificationCategoryOptions; cdecl;
  end;
  TUNNotificationCategory = class(TOCGenericImport<UNNotificationCategoryClass, UNNotificationCategory>) end;

  UNNotificationContentClass = interface(NSObjectClass)
    ['{51114586-06DF-4F81-89EE-A596F73F170A}']
  end;
  UNNotificationContent = interface(NSObject)
    ['{BDF46729-F7A4-4780-8699-424E5A342426}']
    function attachments: NSArray; cdecl;
    function badge: NSNumber; cdecl;
    function body: NSString; cdecl;
    function categoryIdentifier: NSString; cdecl;
    function launchImageName: NSString; cdecl;
    function sound: UNNotificationSound; cdecl;
    function subtitle: NSString; cdecl;
    function summaryArgument: NSString; cdecl;
    function summaryArgumentCount: NSUInteger; cdecl;
    function threadIdentifier: NSString; cdecl;
    function title: NSString; cdecl;
    function userInfo: NSDictionary; cdecl;
  end;
  TUNNotificationContent = class(TOCGenericImport<UNNotificationContentClass, UNNotificationContent>) end;

  UNMutableNotificationContentClass = interface(UNNotificationContentClass)
    ['{D9F80BFC-AE7B-4186-9FC7-63FF96694C99}']
  end;
  UNMutableNotificationContent = interface(UNNotificationContent)
    ['{C97A9AB7-D2BE-479C-A737-B12B05B35496}']
    function attachments: NSArray; cdecl;
    function badge: NSNumber; cdecl;
    function body: NSString; cdecl;
    function categoryIdentifier: NSString; cdecl;
    function launchImageName: NSString; cdecl;
    procedure setAttachments(attachments: NSArray); cdecl;
    procedure setBadge(badge: NSNumber); cdecl;
    procedure setBody(body: NSString); cdecl;
    procedure setCategoryIdentifier(categoryIdentifier: NSString); cdecl;
    procedure setLaunchImageName(launchImageName: NSString); cdecl;
    procedure setSound(sound: UNNotificationSound); cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    procedure setSummaryArgument(summaryArgument: NSString); cdecl;
    procedure setSummaryArgumentCount(summaryArgumentCount: NSUInteger); cdecl;
    procedure setThreadIdentifier(threadIdentifier: NSString); cdecl;
    procedure setTitle(title: NSString); cdecl;
    procedure setUserInfo(userInfo: NSDictionary); cdecl;
    function sound: UNNotificationSound; cdecl;
    function subtitle: NSString; cdecl;
    function summaryArgument: NSString; cdecl;
    function summaryArgumentCount: NSUInteger; cdecl;
    function threadIdentifier: NSString; cdecl;
    function title: NSString; cdecl;
    function userInfo: NSDictionary; cdecl;
  end;
  TUNMutableNotificationContent = class(TOCGenericImport<UNMutableNotificationContentClass, UNMutableNotificationContent>) end;

  UNNotificationRequestClass = interface(NSObjectClass)
    ['{85DD088D-EECD-4F62-B4D4-A77297CB8C68}']
    [MethodName('requestWithIdentifier:content:trigger:')]
    {class} function requestWithIdentifier(identifier: NSString; content: UNNotificationContent; trigger: UNNotificationTrigger): UNNotificationRequest; cdecl;
  end;
  UNNotificationRequest = interface(NSObject)
    ['{77D79B65-2B67-4255-B40E-7E98F2C91D8C}']
    function content: UNNotificationContent; cdecl;
    function identifier: NSString; cdecl;
    function trigger: UNNotificationTrigger; cdecl;
  end;
  TUNNotificationRequest = class(TOCGenericImport<UNNotificationRequestClass, UNNotificationRequest>) end;

  UNNotificationResponseClass = interface(NSObjectClass)
    ['{822F3160-ED9B-401A-B770-ED0E745C67A9}']
  end;
  UNNotificationResponse = interface(NSObject)
    ['{12B346C3-E55B-4A93-81D3-01699EBAEA43}']
    function actionIdentifier: NSString; cdecl;
    function notification: UNNotification; cdecl;
  end;
  TUNNotificationResponse = class(TOCGenericImport<UNNotificationResponseClass, UNNotificationResponse>) end;

  UNNotificationSettingsClass = interface(NSObjectClass)
    ['{F6CC36AB-6F7D-4F0D-AA01-F604086FD698}']
  end;
  UNNotificationSettings = interface(NSObject)
    ['{98352662-F2B4-443A-83C3-F839AD9FFADC}']
    function alertSetting: UNNotificationSetting; cdecl;
    function alertStyle: UNAlertStyle; cdecl;
    function authorizationStatus: UNAuthorizationStatus; cdecl;
    function badgeSetting: UNNotificationSetting; cdecl;
    function carPlaySetting: UNNotificationSetting; cdecl;
    function criticalAlertSetting: UNNotificationSetting; cdecl;
    function lockScreenSetting: UNNotificationSetting; cdecl;
    function notificationCenterSetting: UNNotificationSetting; cdecl;
    function providesAppNotificationSettings: Boolean; cdecl;
    function showPreviewsSetting: UNShowPreviewsSetting; cdecl;
    function soundSetting: UNNotificationSetting; cdecl;
  end;
  TUNNotificationSettings = class(TOCGenericImport<UNNotificationSettingsClass, UNNotificationSettings>) end;

  UNNotificationSoundClass = interface(NSObjectClass)
    ['{DE409993-FA94-4455-B5E1-E19B9999BD00}']
    [MethodName('criticalSoundNamed:withAudioVolume:')]
    {class} function criticalSoundNamed(name: UNNotificationSoundName; volume: Single): UNNotificationSound; cdecl; overload;
    {class} function criticalSoundNamed(name: UNNotificationSoundName): UNNotificationSound; cdecl; overload;
    {class} function defaultCriticalSound: UNNotificationSound; cdecl;
    {class} function defaultCriticalSoundWithAudioVolume(volume: Single): UNNotificationSound; cdecl;
    {class} function defaultSound: UNNotificationSound; cdecl;
    {class} function soundNamed(name: UNNotificationSoundName): UNNotificationSound; cdecl;
  end;
  UNNotificationSound = interface(NSObject)
    ['{8C29C92A-EE23-423F-8F97-38735D4E2544}']
  end;
  TUNNotificationSound = class(TOCGenericImport<UNNotificationSoundClass, UNNotificationSound>) end;

  UNNotificationTriggerClass = interface(NSObjectClass)
    ['{209BB768-F422-478F-AC5F-F2EB4856F30C}']
  end;
  UNNotificationTrigger = interface(NSObject)
    ['{274B049C-A4B1-4BB2-BD89-57DB452C626A}']
    function repeats: Boolean; cdecl;
  end;
  TUNNotificationTrigger = class(TOCGenericImport<UNNotificationTriggerClass, UNNotificationTrigger>) end;

  UNPushNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{73252166-B928-4E81-A6DE-C0F7E22B93FF}']
  end;
  UNPushNotificationTrigger = interface(UNNotificationTrigger)
    ['{D5E464F5-4FEC-4A26-BE0B-1643B92408BA}']
  end;
  TUNPushNotificationTrigger = class(TOCGenericImport<UNPushNotificationTriggerClass, UNPushNotificationTrigger>) end;

  UNTimeIntervalNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{65B02DB4-95F6-436E-9DE1-DDE82B8B4E9B}']
    [MethodName('triggerWithTimeInterval:repeats:')]
    {class} function triggerWithTimeInterval(timeInterval: NSTimeInterval; repeats: Boolean): UNTimeIntervalNotificationTrigger; cdecl;
  end;
  UNTimeIntervalNotificationTrigger = interface(UNNotificationTrigger)
    ['{52D4250D-9E69-468B-B73C-840099D60361}']
    function nextTriggerDate: NSDate; cdecl;
    function timeInterval: NSTimeInterval; cdecl;
  end;
  TUNTimeIntervalNotificationTrigger = class(TOCGenericImport<UNTimeIntervalNotificationTriggerClass, UNTimeIntervalNotificationTrigger>) end;

  UNCalendarNotificationTriggerClass = interface(UNNotificationTriggerClass)
    ['{0D70BDA0-5C5C-412D-98A2-80CBBC21AABB}']
    [MethodName('triggerWithDateMatchingComponents:repeats:')]
    {class} function triggerWithDateMatchingComponents(dateComponents: NSDateComponents; repeats: Boolean): UNCalendarNotificationTrigger; cdecl;
  end;
  UNCalendarNotificationTrigger = interface(UNNotificationTrigger)
    ['{59EDD126-D15F-40D9-B632-A249AE77E127}']
    function dateComponents: NSDateComponents; cdecl;
    function nextTriggerDate: NSDate; cdecl;
  end;
  TUNCalendarNotificationTrigger = class(TOCGenericImport<UNCalendarNotificationTriggerClass, UNCalendarNotificationTrigger>) end;

  UNUserNotificationCenterClass = interface(NSObjectClass)
    ['{499732CA-F14F-4A91-82F9-903E1B0C125C}']
    {class} function currentNotificationCenter: UNUserNotificationCenter; cdecl;
  end;
  UNUserNotificationCenter = interface(NSObject)
    ['{23C1DA35-7D1A-483F-ACE5-872CA4068EFF}']
    [MethodName('addNotificationRequest:withCompletionHandler:')]
    procedure addNotificationRequest(request: UNNotificationRequest; completionHandler: TUNUserNotificationCenterBlockMethod4); cdecl;
    procedure getDeliveredNotificationsWithCompletionHandler(completionHandler: TUNUserNotificationCenterBlockMethod6); cdecl;
    procedure getNotificationCategoriesWithCompletionHandler(completionHandler: TUNUserNotificationCenterBlockMethod2); cdecl;
    procedure getNotificationSettingsWithCompletionHandler(completionHandler: TUNUserNotificationCenterBlockMethod3); cdecl;
    procedure getPendingNotificationRequestsWithCompletionHandler(completionHandler: TUNUserNotificationCenterBlockMethod5); cdecl;
    procedure removeAllDeliveredNotifications; cdecl;
    procedure removeAllPendingNotificationRequests; cdecl;
    procedure removeDeliveredNotificationsWithIdentifiers(identifiers: NSArray); cdecl;
    procedure removePendingNotificationRequestsWithIdentifiers(identifiers: NSArray); cdecl;
    [MethodName('requestAuthorizationWithOptions:completionHandler:')]
    procedure requestAuthorizationWithOptions(options: UNAuthorizationOptions; completionHandler: TUNUserNotificationCenterBlockMethod1); cdecl;
    procedure setNotificationCategories(categories: NSSet); cdecl;
    function supportsContentExtensions: Boolean; cdecl;
  end;
  TUNUserNotificationCenter = class(TOCGenericImport<UNUserNotificationCenterClass, UNUserNotificationCenter>) end;

  TNotificationCenterIOS = class abstract(TPlatformNotificationCenter)
  private
    FDelayedNotifications: TObjectList<TNotification>;
    FIsApplicationLoaded: Boolean;
    { Global External event }
    procedure ReceiveLocalNotification(const Sender: TObject; const M: TMessage);
    { Delayed notifications }
    procedure NotifyDelayedNotifications;
    procedure ClearDelayedNotifications;
    procedure DidFormsLoad;
  protected
    procedure DoLoaded; override;
    { Channels }
    procedure DoCreateOrUpdateChannel(const AChannel: TChannel); override;
    procedure DoDeleteChannel(const AChannelId: string); override;
    procedure DoGetAllChannels(const AChannels: TChannels); override;
    { Application Icon Badge Number }
    procedure DoSetIconBadgeNumber(const ACount: Integer); override;
    function DoGetIconBadgeNumber: Integer; override;
    procedure DoResetIconBadgeNumber; override;

    function ConvertNativeToDelphiNotification(const ANotification: Pointer): TNotification; virtual; abstract;
  public
    constructor Create;
    destructor Destroy; override;

    function SharedApplication: UIApplication; inline;
  end;

{ TNotificationCenterCocoa4 }

  TNotificationCenterCocoa4 = class(TNotificationCenterIOS)
  private
    class var FInstance: TNotificationCenterCocoa4;
    class function GetDefaultInstance: TNotificationCenterCocoa4; static;
    class destructor Destroy;

    { Creation and manipulation with notifications }
    function CreateNativeNotification(const ANotification: TNotification): UILocalNotification;
    function FindNativeNotification(const AID: string; var ANotification: UILocalNotification): Boolean;
  protected
    procedure DoScheduleNotification(const ANotification: TNotification); override;
    procedure DoPresentNotification(const ANotification: TNotification); override;
    procedure DoCancelNotification(const AName: string); overload; override;
    procedure DoCancelNotification(const ANotification: TNotification); overload; override;
    procedure DoCancelAllNotifications; override;

    function ConvertNativeToDelphiNotification(const ANotification: Pointer): TNotification; override;
  public
    class property Instance: TNotificationCenterCocoa4 read GetDefaultInstance;
  end;

  TNotificationCenterCocoa10 = class(TNotificationCenterIOS)
  private type
    TPermissionState = (Unknown, Granted, Denied);
  private
    class var FInstance: TNotificationCenterCocoa10;
    class function GetDefaultInstance: TNotificationCenterCocoa10; static;
    class destructor Destroy;
  private
    FPermissionsState: TPermissionState;

    { Creation and manipulation with notifications }
    function CreateNotificationRequest(const ANotification: TNotification; const AIsScheduled: Boolean): UNNotificationRequest;
    function RepeatIntervalToNSDateComponents(const ADate: TDate; const ARepeatInterval: TRepeatInterval): NSDateComponents;
    function GetNotificationSound(const ANotification: TNotification): UNNotificationSound;
    function GetNotificationTrigger(const ANotification: TNotification): UNNotificationTrigger;

    { Handler }
    procedure RequestAuthorizationHandler(granted: Boolean; error: NSError);
    procedure AddNotificationRequestHandler(error: NSError);
  protected
    procedure RequestPermission;

    procedure DoScheduleNotification(const ANotification: TNotification); override;
    procedure DoPresentNotification(const ANotification: TNotification); override;
    procedure DoCancelNotification(const AName: string); overload; override;
    procedure DoCancelNotification(const ANotification: TNotification); overload; override;
    procedure DoCancelAllNotifications; override;
    function ConvertNativeToDelphiNotification(const ANotification: Pointer): TNotification; override;
  public
    constructor Create;

    procedure CheckPermissions;
    class property Instance: TNotificationCenterCocoa10 read GetDefaultInstance;
  end;

function RepeatIntervalToNSCalendarUnit(const AInterval: TRepeatInterval): NSCalendarUnit;
begin
  case AInterval of
    TRepeatInterval.None:
      Result := 0;
    TRepeatInterval.Second:
      Result := NSSecondCalendarUnit;
    TRepeatInterval.Minute:
      Result := NSMinuteCalendarUnit;
    TRepeatInterval.Hour:
      Result := NSHourCalendarUnit;
    TRepeatInterval.Day:
      Result := NSDayCalendarUnit;
    TRepeatInterval.Weekday:
      Result := NSWeekdayCalendarUnit;
    TRepeatInterval.Week:
      Result := NSWeekCalendarUnit;
    TRepeatInterval.Month:
      Result := NSMonthCalendarUnit;
    TRepeatInterval.Quarter:
      Result := NSQuarterCalendarUnit;
    TRepeatInterval.Year:
      Result := NSYearCalendarUnit;
    TRepeatInterval.Era:
      Result := NSEraCalendarUnit;
  else
    Result := 0;
  end;
end;

function NSCalendarUnitToRepeatInterval(const AInterval: NSCalendarUnit): TRepeatInterval;
begin
  case AInterval of
    NSEraCalendarUnit:
      Result := TRepeatInterval.Era;
    NSYearCalendarUnit:
      Result := TRepeatInterval.Year;
    NSQuarterCalendarUnit:
      Result := TRepeatInterval.Quarter;
    NSMonthCalendarUnit:
      Result := TRepeatInterval.Month;
    NSWeekCalendarUnit:
      Result := TRepeatInterval.Week;
    NSWeekdayCalendarUnit:
      Result := TRepeatInterval.Weekday;
    NSDayCalendarUnit:
      Result := TRepeatInterval.Day;
    NSHourCalendarUnit:
      Result := TRepeatInterval.Hour;
    NSMinuteCalendarUnit:
      Result := TRepeatInterval.Minute;
    NSSecondCalendarUnit:
      Result := TRepeatInterval.Second;
  else
    Result := TRepeatInterval.None;
  end;
end;

{$REGION 'TNotificationCenterCocoa4'}

procedure TNotificationCenterCocoa4.DoCancelAllNotifications;
begin
  SharedApplication.cancelAllLocalNotifications;
end;

function TNotificationCenterCocoa4.FindNativeNotification(const AID: string; var ANotification: UILocalNotification): Boolean;

  function FindInScheduledNotifications: UILocalNotification;
  var
    Notifications: NSArray;
    NativeNotification: UILocalNotification;
    Found: Boolean;
    I: NSUInteger;
    UserInfo: NSDictionary;
  begin
    Notifications := SharedApplication.scheduledLocalNotifications;
    Found := False;
    if Notifications <> nil then
    begin
      I := 0;
      while (I < Notifications.count) and not Found do
      begin
        NativeNotification := TUILocalNotification.Wrap(Notifications.objectAtIndex(I));
        UserInfo := NativeNotification.userInfo;
        if (UserInfo <> nil) and (UTF8ToString(TNSString.Wrap(UserInfo.valueForKey(StrToNSStr('id'))).UTF8String) = AID) then
          Found := True
        else
          Inc(I);
      end;
    end;
    if Found then
      Result := NativeNotification
    else
      Result := nil;
  end;

begin
  // We are searching notification in two list:
  //   1. Notifications, which have not displayed in Notification Center
  //   2. Notifications, which already displayed
  ANotification := FindInScheduledNotifications;
  Result := ANotification <> nil;
end;

procedure TNotificationCenterCocoa4.DoCancelNotification(const AName: string);
var
  NativeNotification: UILocalNotification;
begin
  if not AName.IsEmpty and FindNativeNotification(AName, NativeNotification) then
    SharedApplication.cancelLocalNotification(NativeNotification);
end;

procedure TNotificationCenterCocoa4.DoCancelNotification(const ANotification: TNotification);
begin
  if ANotification <> nil then
    DoCancelNotification(ANotification.Name);
end;

function TNotificationCenterCocoa4.CreateNativeNotification(const ANotification: TNotification): UILocalNotification;
var
  NativeNotification: UILocalNotification;
  UserInfo: NSDictionary;
  GMTDateTime: TDateTime;
begin
  NativeNotification := TUILocalNotification.Create;
  if not ANotification.Name.IsEmpty then
  begin
    // Set unique identificator
    UserInfo := TNSDictionary.Wrap(TNSDictionary.OCClass.dictionaryWithObject(
      (StrToNSStr(ANotification.Name) as ILocalObject).GetObjectID, (StrToNSStr('id') as ILocalObject).GetObjectID));
    NativeNotification.setUserInfo(UserInfo);
  end;
  // Get GMT time and set notification fired date
  GMTDateTime := GetGMTDateTime(ANotification.FireDate);
  NativeNotification.setTimeZone(TNSTimeZone.Wrap(TNSTimeZone.OCClass.defaultTimeZone));
  NativeNotification.setFireDate(DateTimeToNSDate(GMTDateTime));
  NativeNotification.setApplicationIconBadgeNumber(ANotification.Number);
  NativeNotification.setAlertBody(StrToNSStr(ANotification.AlertBody));
  NativeNotification.setAlertAction(StrToNSStr(ANotification.AlertAction));
  NativeNotification.setHasAction(ANotification.HasAction);
  NativeNotification.setRepeatInterval(RepeatIntervalToNSCalendarUnit(ANotification.RepeatInterval));
  if ANotification.EnableSound then
    if ANotification.SoundName.IsEmpty then
      NativeNotification.setSoundName(UILocalNotificationDefaultSoundName)
    else
      NativeNotification.setSoundName(StrToNSStr(ANotification.SoundName))
  else
    NativeNotification.setSoundName(nil);
  Result := NativeNotification;
end;

class destructor TNotificationCenterCocoa4.Destroy;
begin
  FInstance.Free;
end;

function TNotificationCenterCocoa4.ConvertNativeToDelphiNotification(const ANotification: Pointer): TNotification;
var
  UserInfo: NSDictionary;
  NotificationTmp: TNotification;
  LocalNotification: UILocalNotification;
begin
  NotificationTmp := nil;
  if ANotification <> nil then
  begin
    LocalNotification := TUILocalNotification.Wrap(ANotification);
    NotificationTmp := TNotification.Create;
    UserInfo := LocalNotification.userInfo;
    if UserInfo <> nil then
      NotificationTmp.Name := UTF8ToString(TNSString.Wrap(UserInfo.valueForKey(StrToNSStr('id'))).UTF8String);
    if LocalNotification.AlertBody <> nil then
      NotificationTmp.AlertBody := UTF8ToString(LocalNotification.AlertBody.UTF8String);
    if LocalNotification.AlertAction <> nil then
      NotificationTmp.AlertAction := UTF8ToString(LocalNotification.AlertAction.UTF8String);;
    NotificationTmp.Number := LocalNotification.ApplicationIconBadgeNumber;
    NotificationTmp.FireDate := NSDateToDateTime(LocalNotification.FireDate);
    NotificationTmp.EnableSound := LocalNotification.SoundName <> nil;
    if (LocalNotification.soundName = nil) or (LocalNotification.soundName.compare(UILocalNotificationDefaultSoundName) = NSOrderedSame) then
      NotificationTmp.SoundName := ''
    else
      NotificationTmp.SoundName := NSStrToStr(LocalNotification.soundName);
    NotificationTmp.HasAction := LocalNotification.HasAction;
    NotificationTmp.RepeatInterval := NSCalendarUnitToRepeatInterval(LocalNotification.repeatInterval);
  end;
  Result := NotificationTmp;
end;

procedure TNotificationCenterCocoa4.DoPresentNotification(const ANotification: TNotification);
var
  NativeNotification: UILocalNotification;
begin
  DoCancelNotification(ANotification);
  NativeNotification := CreateNativeNotification(ANotification);
  SharedApplication.presentLocalNotificationNow(NativeNotification);
end;

procedure TNotificationCenterCocoa4.DoScheduleNotification(const ANotification: TNotification);
var
  NativeNotification: UILocalNotification;
begin
  CancelNotification(ANotification.Name);
  NativeNotification := CreateNativeNotification(ANotification);
  SharedApplication.scheduleLocalNotification(NativeNotification);
end;

class function TNotificationCenterCocoa4.GetDefaultInstance: TNotificationCenterCocoa4;
begin
  if FInstance = nil then
    FInstance := TNotificationCenterCocoa4.Create;
  Result := FInstance;
end;

{$ENDREGION}

{ TPlatformNotificationCenter }

class function TPlatformNotificationCenter.GetInstance: TBaseNotificationCenter;
begin
  if TOsVersion.Check(10) then
    Result := TBaseNotificationCenter(TNotificationCenterCocoa10.Instance)
  else
    Result := TBaseNotificationCenter(TNotificationCenterCocoa4.Instance)
end;

{ TNotificationCenterCocoa10 }

procedure TNotificationCenterCocoa10.AddNotificationRequestHandler(error: NSError);
begin
  if error <> nil then
    NSLog(NSObjectToID(error.localizedDescription));
end;

procedure TNotificationCenterCocoa10.CheckPermissions;
begin
  case FPermissionsState of
    TPermissionState.Unknown:
      NSLog(NSObjectToId(StrToNSStr('User didn''t response on permission request.')));
    TPermissionState.Denied:
      NSLog(NSObjectToId(StrToNSStr('User rejected access to using notifications. Cannot process operation.')));
  end;
end;

function TNotificationCenterCocoa10.ConvertNativeToDelphiNotification(const ANotification: Pointer): TNotification;
var
  Response: UNNotificationResponse;
  Request: UNNotificationRequest;
  NativeNotification: UNNotification;
begin
  Response := TUNNotificationResponse.Wrap(ANotification);
  NativeNotification := Response.notification;
  Request := NativeNotification.request;

  Result := TNotification.Create;
  Result.Name := NSStrToStr(Request.identifier);
  Result.Title := NSStrToStr(Request.content.title);
  Result.AlertBody := NSStrToStr(Request.content.body);
  Result.Number := Request.content.badge.intValue;
  Result.EnableSound := Request.content.sound <> nil;
  Result.FireDate := NSDateToDateTime(NativeNotification.date);
  Result.RepeatInterval := TRepeatInterval.None;
end;

constructor TNotificationCenterCocoa10.Create;
begin
  inherited;
  FPermissionsState := TPermissionState.Unknown;
  RequestPermission;
end;

function TNotificationCenterCocoa10.CreateNotificationRequest(const ANotification: TNotification; const AIsScheduled: Boolean): UNNotificationRequest;
var
  NotificationContent: UNMutableNotificationContent;
  Trigger: UNNotificationTrigger;
  Id: string;
begin
  NotificationContent := TUNMutableNotificationContent.Create;
  NotificationContent.setTitle(StrToNSStr(ANotification.Title));
  NotificationContent.setBody(StrToNSStr(ANotification.AlertBody));
  NotificationContent.setBadge(TNSNumber.Wrap(TNSNumber.OCClass.numberWithInt(ANotification.Number)));
  NotificationContent.setSound(GetNotificationSound(ANotification));

  if AIsScheduled then
    Trigger := GetNotificationTrigger(ANotification)
  else
    Trigger := nil;

  if ANotification.Name.IsEmpty then
    Id := DateTimeToStr(Now)
  else
    Id := ANotification.Name;
  Result := TUNNotificationRequest.OCClass.requestWithIdentifier(StrToNSStr(Id), NotificationContent, Trigger);
end;

class destructor TNotificationCenterCocoa10.Destroy;
begin
  FreeAndNil(FInstance);
end;

procedure TNotificationCenterCocoa10.DoCancelAllNotifications;
begin
  CheckPermissions;

  TUNUserNotificationCenter.OCClass.currentNotificationCenter.removeAllDeliveredNotifications;
  TUNUserNotificationCenter.OCClass.currentNotificationCenter.removeAllPendingNotificationRequests;
end;

procedure TNotificationCenterCocoa10.DoCancelNotification(const ANotification: TNotification);
begin
  if ANotification <> nil then
    DoCancelNotification(ANotification.Name);
end;

procedure TNotificationCenterCocoa10.DoCancelNotification(const AName: string);
var
  NotificationIds: NSMutableArray;
begin
  CheckPermissions;

  NotificationIds := TNSMutableArray.Wrap(TNSMutableArray.OCClass.arrayWithObject(StringToId(AName)));
  TUNUserNotificationCenter.OCClass.currentNotificationCenter.removeDeliveredNotificationsWithIdentifiers(NotificationIds);
  TUNUserNotificationCenter.OCClass.currentNotificationCenter.removePendingNotificationRequestsWithIdentifiers(NotificationIds);
end;

procedure TNotificationCenterCocoa10.DoPresentNotification(const ANotification: TNotification);
var
  NotificationRequest: UNNotificationRequest;
begin
  CheckPermissions;

  NotificationRequest := CreateNotificationRequest(ANotification, False);
  TUNUserNotificationCenter.OCClass.currentNotificationCenter.addNotificationRequest(NotificationRequest, AddNotificationRequestHandler);
end;

procedure TNotificationCenterCocoa10.RequestPermission;
begin
  TUNUserNotificationCenter.OCClass.currentNotificationCenter.requestAuthorizationWithOptions(
    UNAuthorizationOptionBadge or UNAuthorizationOptionSound or UNAuthorizationOptionAlert, RequestAuthorizationHandler);
end;

procedure TNotificationCenterCocoa10.DoScheduleNotification(const ANotification: TNotification);
var
  NotificationRequest: UNNotificationRequest;
begin
  CheckPermissions;

  DoCancelNotification(ANotification);
  NotificationRequest := CreateNotificationRequest(ANotification, True);
  TUNUserNotificationCenter.OCClass.currentNotificationCenter.addNotificationRequest(NotificationRequest, AddNotificationRequestHandler);
end;

class function TNotificationCenterCocoa10.GetDefaultInstance: TNotificationCenterCocoa10;
begin
  if FInstance = nil then
    FInstance := TNotificationCenterCocoa10.Create;
  Result := FInstance;
end;

function TNotificationCenterCocoa10.GetNotificationSound(const ANotification: TNotification): UNNotificationSound;
begin
  if not ANotification.EnableSound then
    Exit(nil);

  if ANotification.SoundName.IsEmpty then
    Result := TUNNotificationSound.OCClass.defaultSound
  else
    Result := TUNNotificationSound.OCClass.soundNamed(StrToNSStr(ANotification.SoundName))
end;

function TNotificationCenterCocoa10.GetNotificationTrigger(const ANotification: TNotification): UNNotificationTrigger;
var
  DateComponents: NSDateComponents;
begin
  DateComponents := RepeatIntervalToNSDateComponents(ANotification.FireDate, ANotification.RepeatInterval);
  DateComponents.setTimeZone(TNSTimeZone.Wrap(TNSTimeZone.OCClass.defaultTimeZone));
  Result := TUNCalendarNotificationTrigger.OCClass.triggerWithDateMatchingComponents(DateComponents, ANotification.RepeatInterval <> TRepeatInterval.None);
end;

function TNotificationCenterCocoa10.RepeatIntervalToNSDateComponents(const ADate: TDate;
  const ARepeatInterval: TRepeatInterval): NSDateComponents;
begin
  Result := TNSDateComponents.Create;
  case ARepeatInterval of
    TRepeatInterval.None:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
      Result.setMinute(MinuteOf(ADate));
      Result.setHour(HourOf(ADate));
      Result.setDay(DayOf(ADate));
      Result.setMonth(MonthOf(ADate));
      Result.setYear(YearOf(ADate));
    end;
    TRepeatInterval.Second:
      Result.setNanosecond(MilliSecondOf(ADate));
    TRepeatInterval.Minute:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
    end;
    TRepeatInterval.Hour:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
      Result.setMinute(MinuteOf(ADate));
    end;
    TRepeatInterval.Day:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
      Result.setMinute(MinuteOf(ADate));
      Result.setHour(HourOf(ADate));
    end;
    TRepeatInterval.Week:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
      Result.setMinute(MinuteOf(ADate));
      Result.setHour(HourOf(ADate));
      Result.setWeekday(DayOfTheWeek(ADate));
    end;
    TRepeatInterval.Month:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
      Result.setMinute(MinuteOf(ADate));
      Result.setHour(HourOf(ADate));
      Result.setDay(DayOf(ADate));
    end;
    TRepeatInterval.Year:
    begin
      Result.setNanosecond(MilliSecondOf(ADate));
      Result.setSecond(SecondOf(ADate));
      Result.setMinute(MinuteOf(ADate));
      Result.setHour(HourOf(ADate));
      Result.setDay(DayOf(ADate));
      Result.setMonth(MonthOf(ADate));
    end;
    TRepeatInterval.Weekday:
      raise Exception.Create('Feature is not supported: (TRepeatInterval.Weekday)');
    TRepeatInterval.Era:
      raise Exception.Create('Feature is not supported: (TRepeatInterval.Era)');
    TRepeatInterval.Quarter:
      raise Exception.Create('Feature is not supported: (TRepeatInterval.Quarter)');
  end;
end;

procedure TNotificationCenterCocoa10.RequestAuthorizationHandler(granted: Boolean; error: NSError);
begin
  if granted then
    FPermissionsState := TPermissionState.Granted
  else
    FPermissionsState := TPermissionState.Denied;
end;

{ TNotificationCenterIOS }

procedure TNotificationCenterIOS.ClearDelayedNotifications;
begin
  FDelayedNotifications.Clear;
end;

constructor TNotificationCenterIOS.Create;
begin
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageReceivedNotification, ReceiveLocalNotification);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessage<Pointer>, ReceiveLocalNotification); // UNNotificationResponse

  FDelayedNotifications := TObjectList<TNotification>.Create;
  FIsApplicationLoaded := False;
end;

destructor TNotificationCenterIOS.Destroy;
begin
  { Unsibscribe }
  TMessageManager.DefaultManager.Unsubscribe(TMessage<UNNotificationResponse>, ReceiveLocalNotification);
  TMessageManager.DefaultManager.Unsubscribe(TMessageReceivedNotification, ReceiveLocalNotification);
  { Destroying }
  ClearDelayedNotifications;
  FDelayedNotifications.Free;
  inherited;
end;

procedure TNotificationCenterIOS.DidFormsLoad;
begin
  FIsApplicationLoaded := True;
  NotifyDelayedNotifications;
end;

procedure TNotificationCenterIOS.DoCreateOrUpdateChannel(const AChannel: TChannel);
begin
  // Relevant only for Android
end;

procedure TNotificationCenterIOS.DoDeleteChannel(const AChannelId: string);
begin
  // Relevant only for Android
end;

procedure TNotificationCenterIOS.DoGetAllChannels(const AChannels: TChannels);
begin
  // Relevant only for Android
end;

function TNotificationCenterIOS.DoGetIconBadgeNumber: Integer;
begin
  Result := SharedApplication.ApplicationIconBadgeNumber;
end;

procedure TNotificationCenterIOS.DoLoaded;
begin
  inherited;
  // DoLoaded is invoked before TForm.OnCreate. However, we have to process receiving of the Local Notification
  // strictly after the form is fully loaded, because we need to invoke TNotificationCenter.OnReceiveLocalNotification
  // after TForm.OnCreate.
  TThread.ForceQueue(nil, procedure begin
    DidFormsLoad;
  end);
end;

procedure TNotificationCenterIOS.DoResetIconBadgeNumber;
begin
  SharedApplication.setApplicationIconBadgeNumber(0);
end;

procedure TNotificationCenterIOS.DoSetIconBadgeNumber(const ACount: Integer);
begin
  SharedApplication.setApplicationIconBadgeNumber(ACount);
end;

procedure TNotificationCenterIOS.ReceiveLocalNotification(const Sender: TObject; const M: TMessage);

  procedure SendNotification(const Notification: TNotification);
  begin
    TMessageManager.DefaultManager.SendMessage(Self, TMessage<TNotification>.Create(Notification));
    // Sending Delayed notifications
    if FDelayedNotifications.Count > 0 then
      NotifyDelayedNotifications;
  end;

var
  NativeNotification: Pointer;
  Notification: TNotification;
begin
  if M is TMessageReceivedNotification then
    NativeNotification := NSObjectToID((M as TMessageReceivedNotification).Value)
  else
    NativeNotification := (M as TMessage<Pointer>).Value; // Pointer = id of UNNotificationResponse

  // iOS doesn't provide list of presented notification. So we need to store it
  // in our list for cancelling in future with using ID
  Notification := ConvertNativeToDelphiNotification(NativeNotification);
  try
    if not FIsApplicationLoaded then
      FDelayedNotifications.Add(Notification)
    else
      SendNotification(Notification);
  finally
    Notification.Free;
  end;
end;

procedure TNotificationCenterIOS.NotifyDelayedNotifications;
var
  Notification: TNotification;
begin
  for Notification in FDelayedNotifications do
    TMessageManager.DefaultManager.SendMessage(Self, TMessage<TNotification>.Create(Notification));
  ClearDelayedNotifications;
end;

function TNotificationCenterIOS.SharedApplication: UIApplication;
var
  App: Pointer;
begin
  Result := nil;
  App := TUIApplication.OCClass.sharedApplication;
  if App <> nil then
    Result := TUIApplication.Wrap(App);
end;

end.
