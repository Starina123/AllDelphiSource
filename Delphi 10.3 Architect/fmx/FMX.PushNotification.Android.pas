{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit FMX.PushNotification.Android;

interface

{$SCOPEDENUMS ON}

{$HPPEMIT LINKUNIT}

implementation

uses
  System.SysUtils, System.Classes, System.JSON, System.PushNotification, System.Messaging, Androidapi.JNI.Embarcadero,
  Androidapi.Helpers, Androidapi.JNIBridge, Androidapi.JNI.JavaTypes, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Os,
  FMX.Platform.Android;

const  
  SFireBaseInstanceIdIsNotAvailable = 'FirebaseInstanceId service is not available';
  
type

{$REGION 'Android api headers'}

  JTask = interface;
  JFirebaseApp = interface;
  JFirebaseInstanceId = interface;

  [JavaSignature('com/embarcadero/firebase/messaging/PushNotificationListener')]
  Jmessaging_PushNotificationListener = interface(IJavaInstance)
    ['{62F3E3DD-3DA9-4E88-81E6-FBAA8D909FB9}']
    procedure onNewTokenReceived(token: JString); cdecl;
    procedure onNotificationReceived(notification: JBundle); cdecl;
  end;

  Jmessaging_ProxyFirebaseMessagingServiceClass = interface(JObjectClass)
    ['{5D4B23EE-7D2D-4D21-BAED-38CC4795E00F}']
    {class} procedure setListener(listener: Jmessaging_PushNotificationListener); cdecl;
  end;

  [JavaSignature('com/embarcadero/firebase/messaging/ProxyFirebaseMessagingService')]
  Jmessaging_ProxyFirebaseMessagingService = interface(IJavaInstance)
    ['{CF35DA04-7A99-45CD-91FD-BB9A333043F3}']
    //procedure onMessageReceived(message: JRemoteMessage); cdecl;
    procedure onNewToken(token: JString); cdecl;
  end;
  TJmessaging_ProxyFirebaseMessagingService = class(TJavaGenericImport<Jmessaging_ProxyFirebaseMessagingServiceClass, Jmessaging_ProxyFirebaseMessagingService>) end;

  [JavaSignature('com/google/android/gms/tasks/OnCompleteListener')]
  JOnCompleteListener = interface(IJavaInstance)
    ['{FF916F32-193F-4C91-9EC5-577ACA24C3CD}']
    procedure onComplete(P1: JTask); cdecl;
  end;

  [JavaSignature('com/google/android/gms/tasks/Task')]
  JTask = interface(JObject)
    ['{E40A69F5-90F8-48C6-973C-8890073D2C97}']
    function addOnCompleteListener(P1: JOnCompleteListener): JTask; cdecl; overload;
    function getException: JException; cdecl;
    function getResult: JObject; cdecl; overload;
    function isSuccessful: Boolean; cdecl;
  end;

  JFirebaseAppClass = interface(JObjectClass)
    ['{7C824D35-7285-477A-8261-DEA5AE42CD34}']
    {class} function getInstance: JFirebaseApp; cdecl; overload;
  end;

  [JavaSignature('com/google/firebase/FirebaseApp')]
  JFirebaseApp = interface(JObject)
    ['{5A1CE1F7-0450-4D05-9967-F7D72AD972D6}']
    procedure delete; cdecl;
  end;
  TJFirebaseApp = class(TJavaGenericImport<JFirebaseAppClass, JFirebaseApp>) end;

  JFirebaseInstanceIdClass = interface(JObjectClass)
    ['{C2EE81F8-D1D8-4273-AAFE-BAF649C944E4}']
    {class} function getInstance(P1: JFirebaseApp): JFirebaseInstanceId; cdecl; overload;
  end;

  [JavaSignature('com/google/firebase/iid/FirebaseInstanceId')]
  JFirebaseInstanceId = interface(JObject)
    ['{FBF959C6-6293-48EB-914D-426FC130B847}']
    function getInstanceId: JTask; cdecl;
    procedure deleteInstanceId; cdecl;
  end;
  TJFirebaseInstanceId = class(TJavaGenericImport<JFirebaseInstanceIdClass, JFirebaseInstanceId>) end;

  JInstanceIdResultClass = interface(IJavaClass)
    ['{B91A2ACD-3C1A-4834-A19B-5EBC2D8D885B}']
  end;

  [JavaSignature('com/google/firebase/iid/InstanceIdResult')]
  JInstanceIdResult = interface(IJavaInstance)
    ['{D30630CB-840D-4484-83FF-1EFE74D3C17B}']
    function getToken: JString; cdecl;
  end;
  TJInstanceIdResult = class(TJavaGenericImport<JInstanceIdResultClass, JInstanceIdResult>) end;
{$ENDREGION}

{ Firebase implementation }

  TFcmPushServiceNotification = class(TPushServiceNotification)
  private
    FRawData: TJSONObject;
  protected
    function GetDataKey: string; override;
    function GetJson: TJSONObject; override;
    function GetDataObject: TJSONObject; override;
  public
    constructor Create(const ABundle: JBundle); overload;
  end;

  TTaskCompleteCallback = reference to procedure (task: JTask);

  TFcmPushService = class(TPushService)
  private type
    /// <summary>Listener for receiving result of requesting Firebase Token.</summary>
    TTokenTaskCompleteListener = class(TJavaLocal, JOnCompleteListener)
    private
      FCompleteCallback: TTaskCompleteCallback;
    public
      constructor Create(const ACompleteCallback: TTaskCompleteCallback);

      { JOnCompleteListener }
      procedure onComplete(task: JTask); cdecl;
    end;

    // <summary>Listeners for receiving new token and Push notification, when application is in foreground.</summary>
    TAndroidPushNotificationListener = class(TJavaLocal, JMessaging_PushNotificationListener)
    private
      [Weak] FService: TFcmPushService;
    public
      constructor Create(const AService: TFcmPushService);

      { JMessaging_PushNotificationListener }
      procedure onNotificationReceived(notification: JBundle); cdecl;
      procedure onNewTokenReceived(token: JString); cdecl;
    end;
  private
    FDeviceToken: string;
    FDeviceID: string;
    FStatus: TPushService.TStatus;
    FStartupError: string;
    FFirebaseApp: JFirebaseApp;
    FTokenTaskCompleteListener: TTokenTaskCompleteListener;
    FPushNotificationListener: TAndroidPushNotificationListener;
    procedure Register;
    procedure Unregister;
    procedure MessageReceivedListener(const Sender: TObject; const M: TMessage);
  protected
    constructor Create; reintroduce;
    function GetStatus: TPushService.TStatus; override;
    procedure StartService; override;
    procedure StopService; override;
    function GetDeviceToken: TPushService.TPropArray; override;
    function GetDeviceID: TPushService.TPropArray; override;
    function GetStartupNotifications: TArray<TPushServiceNotification>; override;
    function GetStartupError: string; override;
  public
    destructor Destroy; override;
  end;

procedure RegisterPushServices;
begin
  // TPushService registers itself in TPushService.AfterConstruction So we don't need to have a store referenece at it.
  // TPushServiceManager destroys all registered push services in TPushServiceManager.Destroy.
  TFcmPushService.Create;
end;

procedure UnregisterPushServices;
begin
end;
{ TFcmPushService }

procedure TFcmPushService.Register;
var
  FirebaseInstanceId: JFirebaseInstanceId;
begin
  // In fact, registration of the application in Firebase Cloud is carried out in
  // com.embrcadero.firebase.provider.FirebaseInitProvider. So in this place we just receive device token.
  FFirebaseApp := TJFirebaseApp.JavaClass.getInstance;
  FirebaseInstanceId := TJFirebaseInstanceId.JavaClass.getInstance(FFirebaseApp);
  if FirebaseInstanceId <> nil then
  begin
    FTokenTaskCompleteListener := TTokenTaskCompleteListener.Create(procedure (task: JTask)
    begin
      if task.isSuccessful then
      begin
        FDeviceToken := JStringToString(TJInstanceIdResult.Wrap(task.getResult).getToken);
        FStatus := TPushService.TStatus.Started;
        DoChange([TPushService.TChange.Status, TPushService.TChange.DeviceToken]);
      end
      else
      begin
        FStartupError := JStringToString(task.getException.getMessage);
        FStatus := TPushService.TStatus.StartupError;
        DoChange([TPushService.TChange.Status]);
      end;
    end);
    FirebaseInstanceId.getInstanceId.addOnCompleteListener(FTokenTaskCompleteListener);
  end
  else
  begin
    FStartupError := SFireBaseInstanceIdIsNotAvailable;
    FStatus := TPushService.TStatus.StartupError;
    DoChange([TPushService.TChange.Status]);
  end;
end;

procedure TFcmPushService.StartService;
begin
  if FDeviceToken.IsEmpty then
    Register;
end;

procedure TFcmPushService.StopService;
begin
  if not FDeviceToken.IsEmpty then
  begin
    Unregister;
    FDeviceToken := string.Empty;
    FStatus := TPushService.TStatus.Stopped;
    FStartupError := string.Empty;
    FStatus := TStatus.Stopped;
    DoChange([TChange.Status]);
  end;
end;

constructor TFcmPushService.Create;
begin
  inherited Create(TPushServiceManager.Instance, TPushService.TServiceNames.GCM);
  TMessageManager.DefaultManager.SubscribeToMessage(TMessageReceivedNotification, MessageReceivedListener);

  FPushNotificationListener := TAndroidPushNotificationListener.Create(Self);
  TJmessaging_ProxyFirebaseMessagingService.JavaClass.setListener(FPushNotificationListener);
end;

destructor TFcmPushService.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessageReceivedNotification, MessageReceivedListener);

  FreeAndNil(FTokenTaskCompleteListener);
  TJmessaging_ProxyFirebaseMessagingService.JavaClass.setListener(nil);
  FreeAndNil(FPushNotificationListener);
  inherited;
end;

function TFcmPushService.GetDeviceID: TPushService.TPropArray;
begin
  if FDeviceID.IsEmpty then
    FDeviceID := JStringToString(MainActivity.getDeviceID);
  Result := TPushService.TPropArray.Create(TPushService.TPropPair.Create(TPushService.TDeviceIDNames.DeviceID, FDeviceID));
end;

function TFcmPushService.GetDeviceToken: TPushService.TPropArray;
begin
  Result := TPushService.TPropArray.Create(TPushService.TPropPair.Create(
    TPushService.TDeviceTokenNames.DeviceToken, FDeviceToken));
end;

function TFcmPushService.GetStartupError: string;
begin
  Result := FStartupError;
end;

function TFcmPushService.GetStartupNotifications: TArray<TPushServiceNotification>;
var
  LBundle: JBundle;
begin
  LBundle := MainActivity.getStartupGCM;
  if LBundle <> nil then
    Result := TArray<TPushServiceNotification>.Create(TFcmPushServiceNotification.Create(LBundle))
  else
    Result := nil;
end;

function TFcmPushService.GetStatus: TPushService.TStatus;
begin
  Result := FStatus;
end;

procedure TFcmPushService.Unregister;
begin
  if FFirebaseApp <> nil then
  begin
    FDeviceToken := string.Empty;
    FFirebaseApp.delete;
    FFirebaseApp := nil;
  end;
end;

procedure TFcmPushService.MessageReceivedListener(const Sender: TObject; const M: TMessage);

  function IsIntentWithNotification(Intent: JIntent): Boolean;
  begin
    Result := (Intent <> nil) and (Intent.getAction <> nil) and
               Intent.getAction.equals(TJNotificationPublisher.JavaClass.ACTION_GCM_NOTIFICATION);
  end;

  procedure ProcessBundle(const ANotification: JBundle);
  var
    LNotificationObject: TFcmPushServiceNotification;
  begin
      LNotificationObject := TFcmPushServiceNotification.Create(ANotification);
      // Notifications come in on secondary thread
      TThread.Queue(nil,
      procedure
      begin
        // Handle notifications on firemonkey thread
        DoReceiveNotification(LNotificationObject);
      end);
    end;

  procedure ProcessIntent(const AIntent: JIntent);
  var
    LBundle: JBundle;
  begin
    if AIntent <> nil then
    begin
      LBundle := AIntent.getBundleExtra(StringToJString('fcm'));
      if LBundle = nil then
        LBundle := AIntent.getExtras();

      if LBundle <> nil then
        ProcessBundle(LBundle);
    end;
  end;

var
  InputIntent: JIntent;
begin
  if M is TMessageReceivedNotification then
  begin
    InputIntent := TMessageReceivedNotification(M).Value;
    if IsIntentWithNotification(InputIntent) then
      ProcessIntent(InputIntent);
  end;
end;

{ TFcmPushServiceNotification }

function TFcmPushServiceNotification.GetDataObject: TJSONObject;
var
  LValue: TJSONValue;
begin
  // The message /can/ be prefaced with "fcm", but this is not required
  Result := FRawData;  // take raw JSON as default
  if not GetDataKey.IsEmpty and (FRawData <> nil) then
  begin
    LValue := FRawData.Values[GetDataKey];
    if LValue <> nil then
      Result := LValue as TJSONObject;
  end;
end;

constructor TFcmPushServiceNotification.Create(const ABundle: JBundle);
var
  LJSONObject: TJSONObject;
  LIterator: JIterator;
  LValue: JString;
  LKey: JString;
begin
  LJSONObject := TJSONObject.Create;
  LIterator := ABundle.KeySet.iterator;
  while LIterator.hasNext do
  begin
    LKey := LIterator.next.toString;
    LValue := ABundle.&get(LKey).ToString;
    LJSONObject.AddPair(JStringToString(LKey), JStringToString(LValue));
  end;
  Assert(LJSONObject.Count = ABundle.keySet.size);
  FRawData := LJSONObject;
end;

function TFcmPushServiceNotification.GetDataKey: string;
begin
  Result := 'fcm'; // Do not localize
end;

function TFcmPushServiceNotification.GetJson: TJSONObject;
begin
  Result := FRawData;
end;

{ TFirebasePushService.TTokenTaskCompleteListener }

constructor TFcmPushService.TTokenTaskCompleteListener.Create(const ACompleteCallback: TTaskCompleteCallback);
begin
  inherited Create;
  FCompleteCallback := ACompleteCallback;
end;

procedure TFcmPushService.TTokenTaskCompleteListener.onComplete(task: JTask);
begin
  if Assigned(FCompleteCallback) then
    FCompleteCallback(task);
end;

{ TFirebasePushService.TAndroidPushNotificationListener }

constructor TFcmPushService.TAndroidPushNotificationListener.Create(const AService: TFcmPushService);
begin
  inherited Create;
  FService := AService;
end;

procedure TFcmPushService.TAndroidPushNotificationListener.onNewTokenReceived(token: JString);
begin
  FService.FDeviceToken := JStringToString(token);
end;

procedure TFcmPushService.TAndroidPushNotificationListener.onNotificationReceived(notification: JBundle);
var
  Intent: JIntent;
begin
  Intent := TJIntent.JavaClass.init(TJNotificationPublisher.JavaClass.ACTION_GCM_NOTIFICATION);
  Intent.putExtra(StringToJString('fcm'), notification);

  TMessageManager.DefaultManager.SendMessage(nil, TMessageReceivedNotification.Create(Intent));
end;

initialization
  TRegTypes.RegisterType('FMX.PushNotification.Android.JTask', TypeInfo(FMX.PushNotification.Android.JTask));
  TRegTypes.RegisterType('FMX.PushNotification.Android.JFirebaseApp', TypeInfo(FMX.PushNotification.Android.JFirebaseApp));
  TRegTypes.RegisterType('FMX.PushNotification.Android.JFirebaseInstanceId', TypeInfo(FMX.PushNotification.Android.JFirebaseInstanceId));
  TRegTypes.RegisterType('FMX.PushNotification.Android.JInstanceIdResult', TypeInfo(FMX.PushNotification.Android.JInstanceIdResult));
  RegisterPushServices;
finalization
  UnregisterPushServices;
end.
