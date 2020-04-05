{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Embarcadero;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.AdMob,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Hardware,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Location,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.PlayServices,
  Androidapi.JNI.Util,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JFMXNativeActivity = interface;//com.embarcadero.firemonkey.FMXNativeActivity
  JOnActivityInsetsChangedListener = interface;//com.embarcadero.firemonkey.OnActivityInsetsChangedListener
  JOnActivityListener = interface;//com.embarcadero.firemonkey.OnActivityListener
  JSystemServicesHelper = interface;//com.embarcadero.firemonkey.SystemServicesHelper
  JViewStack = interface;//com.embarcadero.firemonkey.ViewStack
  JAddressBookObserver = interface;//com.embarcadero.firemonkey.addressbook.AddressBookObserver
  JOnAddressBookChangesListener = interface;//com.embarcadero.firemonkey.addressbook.OnAddressBookChangesListener
  JAdListenerAdapter = interface;//com.embarcadero.firemonkey.advertising.AdListenerAdapter
  JIAdListener = interface;//com.embarcadero.firemonkey.advertising.IAdListener
  JFMXBroadcastReceiver = interface;//com.embarcadero.firemonkey.broadcast.FMXBroadcastReceiver
  JFMXBroadcastReceiverListener = interface;//com.embarcadero.firemonkey.broadcast.FMXBroadcastReceiverListener
  JCamPreview = interface;//com.embarcadero.firemonkey.camerapreview.CamPreview
  JDebuggerUtils = interface;//com.embarcadero.firemonkey.debugger.DebuggerUtils
  JDeviceArchitectureChecker = interface;//com.embarcadero.firemonkey.device.DeviceArchitectureChecker
  JFMXDialogFactory = interface;//com.embarcadero.firemonkey.dialogs.FMXDialogFactory
  JFMXDialogHelpers = interface;//com.embarcadero.firemonkey.dialogs.FMXDialogHelpers
  JFMXDialogListener = interface;//com.embarcadero.firemonkey.dialogs.FMXDialogListener
  JFMXStandardDialog = interface;//com.embarcadero.firemonkey.dialogs.FMXStandardDialog
  JFMXDefaultStandardDialog = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultStandardDialog
  JFMXDefaultAlertDialog = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultAlertDialog
  JFMXDefaultDialogFactory = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultDialogFactory
  JFMXDefaultDialogFragment = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultDialogFragment
  JFMXDefaultInputQueryDialog = interface;//com.embarcadero.firemonkey.dialogs.defaults.FMXDefaultInputQueryDialog
  JFMXGingerbreadStandardDialog = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadStandardDialog
  JFMXGingerbreadAlertDialog = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadAlertDialog
  JFMXGingerbreadDialogFactory = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadDialogFactory
  JFMXGingerbreadInputQueryDialog = interface;//com.embarcadero.firemonkey.dialogs.gingerbread.FMXGingerbreadInputQueryDialog
  JFormView = interface;//com.embarcadero.firemonkey.form.FormView
  JFormViewListener = interface;//com.embarcadero.firemonkey.form.FormViewListener
  JFullScreenManager = interface;//com.embarcadero.firemonkey.fullscreen.FullScreenManager
  JOnFullScreenStateChangedListener = interface;//com.embarcadero.firemonkey.fullscreen.OnFullScreenStateChangedListener
  JJavaGeocoder = interface;//com.embarcadero.firemonkey.geocoder.JavaGeocoder
  JOnKeyboardStateChangedListener = interface;//com.embarcadero.firemonkey.keyboard.OnKeyboardStateChangedListener
  JVirtualKeyboard = interface;//com.embarcadero.firemonkey.keyboard.VirtualKeyboard
  JVirtualKeyboardFrameObserver = interface;//com.embarcadero.firemonkey.keyboard.VirtualKeyboardFrameObserver
  JCameraChangeListener = interface;//com.embarcadero.firemonkey.maps.CameraChangeListener
  JCameraChangeListener_Callback = interface;//com.embarcadero.firemonkey.maps.CameraChangeListener$Callback
  JMapViewWithGestures = interface;//com.embarcadero.firemonkey.maps.MapViewWithGestures
  JFMXMediaLibrary = interface;//com.embarcadero.firemonkey.medialibrary.FMXMediaLibrary
  JFMXMediaLibraryListener = interface;//com.embarcadero.firemonkey.medialibrary.FMXMediaLibraryListener
  JMediaImage = interface;//com.embarcadero.firemonkey.medialibrary.MediaImage
  JMediaImage_ImageStorePlace = interface;//com.embarcadero.firemonkey.medialibrary.MediaImage$ImageStorePlace
  JSize = interface;//com.embarcadero.firemonkey.medialibrary.Size
  JUtils = interface;//com.embarcadero.firemonkey.medialibrary.Utils
  JNativeControlHost = interface;//com.embarcadero.firemonkey.nativelayout.NativeControlHost
  JNativeLayout = interface;//com.embarcadero.firemonkey.nativelayout.NativeLayout
  JBasePicker = interface;//com.embarcadero.firemonkey.pickers.BasePicker
  JBaseDateTimePicker = interface;//com.embarcadero.firemonkey.pickers.BaseDateTimePicker
  JBaseListPicker = interface;//com.embarcadero.firemonkey.pickers.BaseListPicker
  JBasePickersFactory = interface;//com.embarcadero.firemonkey.pickers.BasePickersFactory
  JGeneratorPickerID = interface;//com.embarcadero.firemonkey.pickers.GeneratorPickerID
  JOnDateTimeChangedListener = interface;//com.embarcadero.firemonkey.pickers.OnDateTimeChangedListener
  JOnItemChangedListener = interface;//com.embarcadero.firemonkey.pickers.OnItemChangedListener
  Jdefaults_DatePickerFragment = interface;//com.embarcadero.firemonkey.pickers.defaults.DatePickerFragment
  JDefaultDatePicker = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultDatePicker
  JDefaultListPicker = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultListPicker
  JDefaultPickersFactory = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultPickersFactory
  JDefaultTimePicker = interface;//com.embarcadero.firemonkey.pickers.defaults.DefaultTimePicker
  Jdefaults_ListPickerFragment = interface;//com.embarcadero.firemonkey.pickers.defaults.ListPickerFragment
  Jdefaults_TimePickerFragment = interface;//com.embarcadero.firemonkey.pickers.defaults.TimePickerFragment
  JGingerbreadDatePicker = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadDatePicker
  JGingerbreadListPicker = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadListPicker
  JGingerbreadPickersFactory = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadPickersFactory
  JGingerbreadTimePicker = interface;//com.embarcadero.firemonkey.pickers.gingerbread.GingerbreadTimePicker
  JIAPSecurity = interface;//com.embarcadero.firemonkey.purchasing.IAPSecurity
  JCharCase = interface;//com.embarcadero.firemonkey.text.CharCase
  JFMXEditText = interface;//com.embarcadero.firemonkey.text.FMXEditText
  JFMXTextListener = interface;//com.embarcadero.firemonkey.text.FMXTextListener
  JReturnKeyType = interface;//com.embarcadero.firemonkey.text.ReturnKeyType
  JVirtualKeyboardType = interface;//com.embarcadero.firemonkey.text.VirtualKeyboardType
  JAllLower = interface;//com.embarcadero.firemonkey.text.filters.AllLower
  JFilterChar = interface;//com.embarcadero.firemonkey.text.filters.FilterChar
  JDelegatedActionModeCallback = interface;//com.embarcadero.firemonkey.text.menu.DelegatedActionModeCallback
  JDelegatedActionModeCallback2 = interface;//com.embarcadero.firemonkey.text.menu.DelegatedActionModeCallback2
  JOnTextContextMenuListener = interface;//com.embarcadero.firemonkey.text.menu.OnTextContextMenuListener
  JOnWebViewListener = interface;//com.embarcadero.firemonkey.webbrowser.OnWebViewListener
  JWebBrowser = interface;//com.embarcadero.firemonkey.webbrowser.WebBrowser
  JWebClient = interface;//com.embarcadero.firemonkey.webbrowser.WebClient
  //JProxyInterface = interface;//com.embarcadero.rtl.ProxyInterface
  JProxyService = interface;//com.embarcadero.rtl.ProxyService
  JRTLHandler = interface;//com.embarcadero.rtl.RTLHandler
  JRTLHandler_Listener = interface;//com.embarcadero.rtl.RTLHandler$Listener
  JRTLHandler_RTLSuperHandler = interface;//com.embarcadero.rtl.RTLHandler$RTLSuperHandler
  JChannelsManager = interface;//com.embarcadero.rtl.notifications.ChannelsManager
  JNotificationAlarm = interface;//com.embarcadero.rtl.notifications.NotificationAlarm
  JNotificationInfo = interface;//com.embarcadero.rtl.notifications.NotificationInfo
  JNotificationPublisher = interface;//com.embarcadero.rtl.notifications.NotificationPublisher
  JRepeatInterval = interface;//com.embarcadero.rtl.notifications.RepeatInterval

// ===== Interface declarations =====

  JFMXNativeActivityClass = interface(JNativeActivityClass)
    ['{829C77FB-08F1-4D19-9782-3C58EEC12599}']
    {class} function init: JFMXNativeActivity; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/FMXNativeActivity')]
  JFMXNativeActivity = interface(JNativeActivity)
    ['{2FA559EC-D1D7-46AA-9C52-FEFC6B3E2DE3}']
    procedure OnMediaLibraryAccept(requestCode: Integer); cdecl;
    procedure OnMediaLibraryCancel(requestCode: Integer); cdecl;
    function addView(view: JView; params: JViewGroup_LayoutParams): Integer; cdecl;
    function dispatchKeyEvent(event: JKeyEvent): Boolean; cdecl;
    procedure embSetOrientation(orientationMask: Integer); cdecl;
    function getDeviceID: JString; cdecl;
    function getEditText: JFMXEditText; cdecl;
    function getFMXMediaLibrary: JFMXMediaLibrary; cdecl;
    function getFullScreenManager: JFullScreenManager; cdecl;
    function getLastEvent: JKeyEvent; cdecl;
    function getNextPickerDialogId: Integer; cdecl;
    function getOnActivityInsetsChangedListener: JOnActivityInsetsChangedListener; cdecl;
    function getRawDisplaySize: JPoint; cdecl;
    function getStartupGCM: JBundle; cdecl;
    function getViewGroup: JViewGroup; cdecl;
    function getViewStack: JViewStack; cdecl;
    function getVirtualKeyboard: JVirtualKeyboard; cdecl;
    function getWindowInsets: JRect; cdecl;
    function isWindowInsetsDefined: Boolean; cdecl;
    procedure onPause; cdecl;
    procedure onRequestPermissionsResult(requestCode: Integer; permissions: TJavaObjectArray<JString>; grantResults: TJavaArray<Integer>); cdecl;
    procedure onResume; cdecl;
    procedure onWindowFocusChanged(hasFocus: Boolean); cdecl;
    procedure receiveGCM(bundle: JBundle); cdecl;
    procedure registerIntentAction(action: JString); cdecl;
    procedure removeView(view: JView); cdecl;
    procedure removeViewAt(index: Integer); cdecl;
    procedure setListener(listener: JOnActivityListener); cdecl;
    procedure setOnActivityInsetsChangedListener(onActivityInsetsChangedListener: JOnActivityInsetsChangedListener); cdecl;
    procedure showDialog(id: Integer; dialog: JDialog); cdecl;
    procedure startJobIntentService(serviceName: JString; jobId: Integer; workIntent: JIntent); cdecl;
  end;
  TJFMXNativeActivity = class(TJavaGenericImport<JFMXNativeActivityClass, JFMXNativeActivity>) end;

  JOnActivityInsetsChangedListenerClass = interface(IJavaClass)
    ['{3834D8B1-477A-4A0F-927C-1A5F3555376A}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/OnActivityInsetsChangedListener')]
  JOnActivityInsetsChangedListener = interface(IJavaInstance)
    ['{EAEEA616-D505-45EB-90B2-88350F18DF07}']
    procedure insetsChanged(newInsets: JRect); cdecl;
  end;
  TJOnActivityInsetsChangedListener = class(TJavaGenericImport<JOnActivityInsetsChangedListenerClass, JOnActivityInsetsChangedListener>) end;

  JOnActivityListenerClass = interface(IJavaClass)
    ['{168F8C7B-7FE9-4A08-87AD-51CCC3C56E43}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/OnActivityListener')]
  JOnActivityListener = interface(IJavaInstance)
    ['{D0E0FCFB-0400-4522-B51E-220FC79F92BB}']
    procedure onCancelReceiveImage(requestCode: Integer); cdecl;
    procedure onReceiveImagePath(requestCode: Integer; fileName: JString); cdecl;
    procedure onReceiveNotification(intent: JIntent); cdecl;
    procedure onReceiveResult(requestCode: Integer; resultCode: Integer; intent: JIntent); cdecl;
    procedure onRequestPermissionsResult(requestCode: Integer; permissions: TJavaObjectArray<JString>; grantResults: TJavaArray<Integer>); cdecl;
  end;
  TJOnActivityListener = class(TJavaGenericImport<JOnActivityListenerClass, JOnActivityListener>) end;

  JSystemServicesHelperClass = interface(JObjectClass)
    ['{B256824C-1EAD-48E6-99E4-53A6CDA59FD2}']
    {class} function init: JSystemServicesHelper; cdecl;
    {class} function getServiceOrThrow(context: JContext; serviceName: JString; serviceClass: Jlang_Class): JObject; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/SystemServicesHelper')]
  JSystemServicesHelper = interface(JObject)
    ['{A2688E28-CF41-4E0F-99F1-7863A5BB161A}']
  end;
  TJSystemServicesHelper = class(TJavaGenericImport<JSystemServicesHelperClass, JSystemServicesHelper>) end;

  JViewStackClass = interface(JObjectClass)
    ['{267403CF-D226-4018-A570-BB92912191FF}']
    {class} function init(context: JContext): JViewStack; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/ViewStack')]
  JViewStack = interface(JObject)
    ['{33CF1A1F-1D75-43B4-90C7-8822DFA6D1FB}']
    procedure addView(view: JViewGroup); cdecl;
    procedure disableViews; cdecl;
    procedure removeView(view: JViewGroup); cdecl;
    procedure setPosition(view: JViewGroup; absoluteX: Integer; absoluteY: Integer); cdecl;
    procedure setSize(view: JViewGroup; absoluteWidth: Integer; absoluteHeight: Integer); cdecl;
  end;
  TJViewStack = class(TJavaGenericImport<JViewStackClass, JViewStack>) end;

  JAddressBookObserverClass = interface(JContentObserverClass)
    ['{6F4C5DCF-451B-484D-A8CC-AB0FBA10739B}']
    {class} function init(listener: JOnAddressBookChangesListener): JAddressBookObserver; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/addressbook/AddressBookObserver')]
  JAddressBookObserver = interface(JContentObserver)
    ['{1942AB70-72D9-4305-9E13-2D8653A90595}']
    procedure onChange(selfChange: Boolean); cdecl;
  end;
  TJAddressBookObserver = class(TJavaGenericImport<JAddressBookObserverClass, JAddressBookObserver>) end;

  JOnAddressBookChangesListenerClass = interface(IJavaClass)
    ['{3E1F45C0-439C-492D-8573-835A12251052}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/addressbook/OnAddressBookChangesListener')]
  JOnAddressBookChangesListener = interface(IJavaInstance)
    ['{07FE15E5-7885-430E-B161-2E339965B549}']
    procedure onChanged(selfChange: Boolean); cdecl;
  end;
  TJOnAddressBookChangesListener = class(TJavaGenericImport<JOnAddressBookChangesListenerClass, JOnAddressBookChangesListener>) end;

  JAdListenerAdapterClass = interface(JAdListenerClass)
    ['{CD2C5FBC-0887-4691-A942-FAEBDC43BC70}']
    {class} function init(listener: JIAdListener): JAdListenerAdapter; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/advertising/AdListenerAdapter')]
  JAdListenerAdapter = interface(JAdListener)
    ['{9711888A-C126-4ACF-9F3C-E0E946542342}']
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(errorCode: Integer); cdecl;
    procedure onAdLeftApplication; cdecl;
    procedure onAdLoaded; cdecl;
    procedure onAdOpened; cdecl;
  end;
  TJAdListenerAdapter = class(TJavaGenericImport<JAdListenerAdapterClass, JAdListenerAdapter>) end;

  JIAdListenerClass = interface(IJavaClass)
    ['{3E8BEED5-B092-42FA-96EB-E4C49A7A0E00}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/advertising/IAdListener')]
  JIAdListener = interface(IJavaInstance)
    ['{8E46C3D5-1846-458C-9FA4-EFC3DDCA705F}']
    procedure onAdClosed; cdecl;
    procedure onAdFailedToLoad(errorCode: Integer); cdecl;
    procedure onAdLeftApplication; cdecl;
    procedure onAdLoaded; cdecl;
    procedure onAdOpened; cdecl;
  end;
  TJIAdListener = class(TJavaGenericImport<JIAdListenerClass, JIAdListener>) end;

  JFMXBroadcastReceiverClass = interface(JBroadcastReceiverClass)
    ['{18E76E33-CD0C-4E7F-9DBE-F1B2EB9DEFD9}']
    {class} function init(listener: JFMXBroadcastReceiverListener): JFMXBroadcastReceiver; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/broadcast/FMXBroadcastReceiver')]
  JFMXBroadcastReceiver = interface(JBroadcastReceiver)
    ['{A84605C5-6CC0-4C17-AE5A-A7065C0E3C6A}']
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  TJFMXBroadcastReceiver = class(TJavaGenericImport<JFMXBroadcastReceiverClass, JFMXBroadcastReceiver>) end;

  JFMXBroadcastReceiverListenerClass = interface(IJavaClass)
    ['{9896B7DB-1D20-4C30-82BB-3B0CEF41280E}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/broadcast/FMXBroadcastReceiverListener')]
  JFMXBroadcastReceiverListener = interface(IJavaInstance)
    ['{8D356FEB-9F54-40C6-8E01-94603B4AB486}']
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  TJFMXBroadcastReceiverListener = class(TJavaGenericImport<JFMXBroadcastReceiverListenerClass, JFMXBroadcastReceiverListener>) end;

  JCamPreviewClass = interface(JSurfaceViewClass)
    ['{4A2F8A98-B8E3-4616-8E02-DA083EC4E2BA}']
    {class} function init(context: JContext): JCamPreview; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/camerapreview/CamPreview')]
  JCamPreview = interface(JSurfaceView)
    ['{09E012FD-099E-45F9-AC84-DDB431920646}']
    function _GetmCamera: JCamera; cdecl;
    procedure _SetmCamera(Value: JCamera); cdecl;
    procedure draw(canvas: JCanvas); cdecl;
    procedure surfaceChanged(holder: JSurfaceHolder; format: Integer; w: Integer; h: Integer); cdecl;
    procedure surfaceCreated(holder: JSurfaceHolder); cdecl;
    procedure surfaceDestroyed(holder: JSurfaceHolder); cdecl;
    property mCamera: JCamera read _GetmCamera write _SetmCamera;
  end;
  TJCamPreview = class(TJavaGenericImport<JCamPreviewClass, JCamPreview>) end;

  JDebuggerUtilsClass = interface(JObjectClass)
    ['{2D7C74CD-B262-4957-A79A-B1902E086009}']
    {class} function init(activity: JActivity): JDebuggerUtils; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/debugger/DebuggerUtils')]
  JDebuggerUtils = interface(JObject)
    ['{56EE2D63-4F6E-41B4-949D-FB690E696B0D}']
    procedure tryStartDebugger; cdecl;
  end;
  TJDebuggerUtils = class(TJavaGenericImport<JDebuggerUtilsClass, JDebuggerUtils>) end;

  JDeviceArchitectureCheckerClass = interface(JObjectClass)
    ['{3981DBB7-CE54-4CDD-B9C5-D57D86F1084B}']
    {class} function init: JDeviceArchitectureChecker; cdecl;
    {class} procedure check; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/device/DeviceArchitectureChecker')]
  JDeviceArchitectureChecker = interface(JObject)
    ['{7CBD04BC-A051-4FE5-BDA1-BB9274840A67}']
  end;
  TJDeviceArchitectureChecker = class(TJavaGenericImport<JDeviceArchitectureCheckerClass, JDeviceArchitectureChecker>) end;

  JFMXDialogFactoryClass = interface(JObjectClass)
    ['{03FCA454-E214-41B1-93B2-66CEA875FF35}']
    {class} function init: JFMXDialogFactory; cdecl;
    {class} function getFactory: JFMXDialogFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXDialogFactory')]
  JFMXDialogFactory = interface(JObject)
    ['{F5811DCA-3A5F-4A62-A09D-0D53BB8A5814}']
    function createInputQueryDialog(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXStandardDialog; cdecl;
    function createMessageDialog(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXStandardDialog; cdecl;
  end;
  TJFMXDialogFactory = class(TJavaGenericImport<JFMXDialogFactoryClass, JFMXDialogFactory>) end;

  JFMXDialogHelpersClass = interface(JObjectClass)
    ['{7138130B-970C-447C-83D6-FE9A52C812A9}']
    {class} function init: JFMXDialogHelpers; cdecl;
    {class} procedure generateAlertDialog(activity: JFMXNativeActivity; builder: JAlertDialog_Builder; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer; fmxdialog: JFMXStandardDialog); cdecl;
    {class} function generateInputQuery(activity: JFMXNativeActivity; builder: JAlertDialog_Builder; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>; fmxdialog: JFMXStandardDialog): TJavaObjectArray<JEditText>; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXDialogHelpers')]
  JFMXDialogHelpers = interface(JObject)
    ['{A28D79BB-09AD-4173-B82E-A1FB140FA98F}']
  end;
  TJFMXDialogHelpers = class(TJavaGenericImport<JFMXDialogHelpersClass, JFMXDialogHelpers>) end;

  JFMXDialogListenerClass = interface(IJavaClass)
    ['{7C47781B-98A1-4A45-9F90-0B21A4A24FAC}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXDialogListener')]
  JFMXDialogListener = interface(IJavaInstance)
    ['{008E6099-5C9D-4FF3-9EDD-8AA87B6A52E2}']
    procedure onDialogClosed(modalResult: Integer; values: TJavaObjectArray<JString>); cdecl;
  end;
  TJFMXDialogListener = class(TJavaGenericImport<JFMXDialogListenerClass, JFMXDialogListener>) end;

  JFMXStandardDialogClass = interface(JObjectClass)
    ['{1A06AAF5-F5F5-48C0-89EE-65A1F061DA95}']
    {class} function init: JFMXStandardDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/FMXStandardDialog')]
  JFMXStandardDialog = interface(JObject)
    ['{30C9BF38-AE9D-486A-AAD9-885BDF3CC53E}']
    function getListener: JFMXDialogListener; cdecl;
    function getModalResult: Integer; cdecl;
    function getRealDialog: JDialog; cdecl;
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setListener(listener: JFMXDialogListener); cdecl;
    procedure show; cdecl;
  end;
  TJFMXStandardDialog = class(TJavaGenericImport<JFMXStandardDialogClass, JFMXStandardDialog>) end;

  JFMXDefaultStandardDialogClass = interface(JFMXStandardDialogClass)
    ['{D0013B08-E351-49D6-964F-829964750FCE}']
    {class} function init(aActivity: JFMXNativeActivity): JFMXDefaultStandardDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultStandardDialog')]
  JFMXDefaultStandardDialog = interface(JFMXStandardDialog)
    ['{DE4F0684-2CCE-4683-8129-1A3670786BC8}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure show; cdecl;
  end;
  TJFMXDefaultStandardDialog = class(TJavaGenericImport<JFMXDefaultStandardDialogClass, JFMXDefaultStandardDialog>) end;

  JFMXDefaultAlertDialogClass = interface(JFMXDefaultStandardDialogClass)
    ['{03590861-A4BD-4AF8-AD1A-C68FE14F26EB}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXDefaultAlertDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultAlertDialog')]
  JFMXDefaultAlertDialog = interface(JFMXDefaultStandardDialog)
    ['{0A269919-5978-4AD4-BABE-6A576A886F78}']
  end;
  TJFMXDefaultAlertDialog = class(TJavaGenericImport<JFMXDefaultAlertDialogClass, JFMXDefaultAlertDialog>) end;

  JFMXDefaultDialogFactoryClass = interface(JFMXDialogFactoryClass)
    ['{C4CC93D3-CEC9-4DD0-B23D-8219344FB73D}']
    {class} function init: JFMXDefaultDialogFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultDialogFactory')]
  JFMXDefaultDialogFactory = interface(JFMXDialogFactory)
    ['{6453A528-226B-4C72-9762-694413D677FB}']
    function createInputQueryDialog(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXStandardDialog; cdecl;
    function createMessageDialog(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXStandardDialog; cdecl;
  end;
  TJFMXDefaultDialogFactory = class(TJavaGenericImport<JFMXDefaultDialogFactoryClass, JFMXDefaultDialogFactory>) end;

  JFMXDefaultDialogFragmentClass = interface(JDialogFragmentClass)
    ['{EDB8636C-4BCF-4366-AA83-2D897866C3E4}']
    {class} function init: JFMXDefaultDialogFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultDialogFragment')]
  JFMXDefaultDialogFragment = interface(JDialogFragment)
    ['{D224B738-0D7A-4E8C-ADF3-54CE72EF6756}']
    procedure onCreate(savedInstanceState: JBundle); cdecl;
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure setDialog(dialog: JFMXDefaultStandardDialog); cdecl;
  end;
  TJFMXDefaultDialogFragment = class(TJavaGenericImport<JFMXDefaultDialogFragmentClass, JFMXDefaultDialogFragment>) end;

  JFMXDefaultInputQueryDialogClass = interface(JFMXDefaultStandardDialogClass)
    ['{DBDAE8E2-BDCA-4EC0-A786-9EEE6B8CFCE1}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXDefaultInputQueryDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/defaults/FMXDefaultInputQueryDialog')]
  JFMXDefaultInputQueryDialog = interface(JFMXDefaultStandardDialog)
    ['{C041BD5B-0A58-4CF1-8A91-B2B15DF013D7}']
    function getValues: TJavaObjectArray<JString>; cdecl;
  end;
  TJFMXDefaultInputQueryDialog = class(TJavaGenericImport<JFMXDefaultInputQueryDialogClass, JFMXDefaultInputQueryDialog>) end;

  JFMXGingerbreadStandardDialogClass = interface(JFMXStandardDialogClass)
    ['{BFDD344D-5113-4492-BC49-2F50AF5011F4}']
    {class} function init(aActivity: JFMXNativeActivity): JFMXGingerbreadStandardDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadStandardDialog')]
  JFMXGingerbreadStandardDialog = interface(JFMXStandardDialog)
    ['{63ECBF0C-7956-482E-AF9B-CEF3E9499A30}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setModalResult(result: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJFMXGingerbreadStandardDialog = class(TJavaGenericImport<JFMXGingerbreadStandardDialogClass, JFMXGingerbreadStandardDialog>) end;

  JFMXGingerbreadAlertDialogClass = interface(JFMXGingerbreadStandardDialogClass)
    ['{B382535A-0A9E-444F-A236-D87E9AE8AF83}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXGingerbreadAlertDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadAlertDialog')]
  JFMXGingerbreadAlertDialog = interface(JFMXGingerbreadStandardDialog)
    ['{7D2005B6-A6C8-4023-9B95-564602535997}']
  end;
  TJFMXGingerbreadAlertDialog = class(TJavaGenericImport<JFMXGingerbreadAlertDialogClass, JFMXGingerbreadAlertDialog>) end;

  JFMXGingerbreadDialogFactoryClass = interface(JFMXDialogFactoryClass)
    ['{E90B4670-3F25-42AC-9BB7-0626BABF255B}']
    {class} function init: JFMXGingerbreadDialogFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadDialogFactory')]
  JFMXGingerbreadDialogFactory = interface(JFMXDialogFactory)
    ['{536BFE48-7FEB-4EB0-84FD-A498DFA4A519}']
    function createInputQueryDialog(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXStandardDialog; cdecl;
    function createMessageDialog(activity: JFMXNativeActivity; theme: Integer; msg: JString; dlgType: Integer; captions: TJavaObjectArray<JString>; posButton: Integer; negButton: Integer; neutralButton: Integer): JFMXStandardDialog; cdecl;
  end;
  TJFMXGingerbreadDialogFactory = class(TJavaGenericImport<JFMXGingerbreadDialogFactoryClass, JFMXGingerbreadDialogFactory>) end;

  JFMXGingerbreadInputQueryDialogClass = interface(JFMXGingerbreadStandardDialogClass)
    ['{4C88CE24-90DD-48CE-B1EE-DEFF0B33C356}']
    {class} function init(activity: JFMXNativeActivity; theme: Integer; title: JString; prompts: TJavaObjectArray<JString>; values: TJavaObjectArray<JString>; captions: TJavaObjectArray<JString>): JFMXGingerbreadInputQueryDialog; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/dialogs/gingerbread/FMXGingerbreadInputQueryDialog')]
  JFMXGingerbreadInputQueryDialog = interface(JFMXGingerbreadStandardDialog)
    ['{1BFFEFCE-7D05-4A0A-8620-4939B63D6606}']
    function getValues: TJavaObjectArray<JString>; cdecl;
  end;
  TJFMXGingerbreadInputQueryDialog = class(TJavaGenericImport<JFMXGingerbreadInputQueryDialogClass, JFMXGingerbreadInputQueryDialog>) end;

  JFormViewClass = interface(JSurfaceViewClass)
    ['{90C7255E-64D1-4948-979C-4E7BB037AC02}']
    {class} function init(context: JContext): JFormView; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/form/FormView')]
  JFormView = interface(JSurfaceView)
    ['{BCBFA123-07D3-41A6-BFAB-41D77886F589}']
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
    procedure setListener(listener: JFormViewListener); cdecl;
  end;
  TJFormView = class(TJavaGenericImport<JFormViewClass, JFormView>) end;

  JFormViewListenerClass = interface(IJavaClass)
    ['{1AA438C5-4A64-4043-892F-0380FA658A09}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/form/FormViewListener')]
  JFormViewListener = interface(IJavaInstance)
    ['{BF611734-2D29-4D3D-83DD-53F9D948470D}']
    procedure onSizeChanged(newWidth: Integer; newHeight: Integer; oldWidth: Integer; oldHeight: Integer); cdecl;
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
  end;
  TJFormViewListener = class(TJavaGenericImport<JFormViewListenerClass, JFormViewListener>) end;

  JFullScreenManagerClass = interface(JObjectClass)
    ['{180320E3-73FD-456C-9F6C-83F20DCB73E1}']
    {class} function _GetSTATE_NAV: Integer; cdecl;
    {class} function _GetSTATE_STAT_NAV: Integer; cdecl;
    {class} function _GetSTATE_Z1: Integer; cdecl;
    {class} function _GetSTATE_Z2: Integer; cdecl;
    {class} function init(activity: JActivity): JFullScreenManager; cdecl;
    {class} property STATE_NAV: Integer read _GetSTATE_NAV;
    {class} property STATE_STAT_NAV: Integer read _GetSTATE_STAT_NAV;
    {class} property STATE_Z1: Integer read _GetSTATE_Z1;
    {class} property STATE_Z2: Integer read _GetSTATE_Z2;
  end;

  [JavaSignature('com/embarcadero/firemonkey/fullscreen/FullScreenManager')]
  JFullScreenManager = interface(JObject)
    ['{22E5507E-E778-4538-BF16-062E81ADB97F}']
    procedure callback; cdecl;
    function changeState(transition: Integer): Integer; cdecl;
    function getState: Integer; cdecl;
    function getStatusBarVisibility: Boolean; cdecl;
    function getSystemUIVisibility: Boolean; cdecl;
    procedure hideStatusBar; cdecl;
    procedure hideSystemUI; cdecl;
    procedure initFullScreenFSM; cdecl;
    procedure setStateCallback(state: Integer; callback: JOnFullScreenStateChangedListener); cdecl; overload;
    procedure setStateCallback(callback: JOnFullScreenStateChangedListener); cdecl; overload;
    procedure setStatusBarVisibility(visible: Boolean); cdecl;
    procedure setSystemUIVisibility(visible: Boolean); cdecl;
    procedure showStatusBar; cdecl;
    procedure showSystemUI; cdecl;
    procedure unInitFullScreenFSM; cdecl;
  end;
  TJFullScreenManager = class(TJavaGenericImport<JFullScreenManagerClass, JFullScreenManager>) end;

  JOnFullScreenStateChangedListenerClass = interface(IJavaClass)
    ['{4D3534F2-A291-4AEC-9F71-56FE395A3927}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/fullscreen/OnFullScreenStateChangedListener')]
  JOnFullScreenStateChangedListener = interface(IJavaInstance)
    ['{8EE73E7B-9BC0-4983-AFBC-9B133DB3F73B}']
    procedure stateChanged(oldState: Integer; newState: Integer); cdecl;
  end;
  TJOnFullScreenStateChangedListener = class(TJavaGenericImport<JOnFullScreenStateChangedListenerClass, JOnFullScreenStateChangedListener>) end;

  JJavaGeocoderClass = interface(JObjectClass)
    ['{DC6EC615-5DEF-4BFC-88A7-FA31017D974B}']
    {class} function init(Con: JContext): JJavaGeocoder; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/geocoder/JavaGeocoder')]
  JJavaGeocoder = interface(JObject)
    ['{A6AF9F65-04F2-4AE6-A75A-ABE841B23DD2}']
    function _GetInstanceOfGeocoder: JGeocoder; cdecl;
    procedure _SetInstanceOfGeocoder(Value: JGeocoder); cdecl;
    property InstanceOfGeocoder: JGeocoder read _GetInstanceOfGeocoder write _SetInstanceOfGeocoder;
  end;
  TJJavaGeocoder = class(TJavaGenericImport<JJavaGeocoderClass, JJavaGeocoder>) end;

  JOnKeyboardStateChangedListenerClass = interface(IJavaClass)
    ['{37A38DF0-02BE-4E06-8384-6281C577BDE6}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/keyboard/OnKeyboardStateChangedListener')]
  JOnKeyboardStateChangedListener = interface(IJavaInstance)
    ['{F85EB0C6-02EB-4DF3-9E2E-B320BA607CD3}']
    procedure onVirtualKeyboardFrameChanged(newFrame: JRect); cdecl;
    procedure onVirtualKeyboardWillHidden; cdecl;
    procedure onVirtualKeyboardWillShown; cdecl;
  end;
  TJOnKeyboardStateChangedListener = class(TJavaGenericImport<JOnKeyboardStateChangedListenerClass, JOnKeyboardStateChangedListener>) end;

  JVirtualKeyboardClass = interface(JObjectClass)
    ['{A757779B-BA0D-4139-8D7C-54D6A06620A8}']
    {class} function init(activity: JFMXNativeActivity): JVirtualKeyboard; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/keyboard/VirtualKeyboard')]
  JVirtualKeyboard = interface(JObject)
    ['{51662C0B-E5A0-4519-B09F-4131541C3442}']
    procedure addOnKeyboardStateChangedListener(listener: JOnKeyboardStateChangedListener); cdecl;
    function getVirtualKeyboardFrameObserver: JVirtualKeyboardFrameObserver; cdecl;
    function hide: Boolean; cdecl; overload;
    function hide(view: JView): Boolean; cdecl; overload;
    function isVirtualKeyboardShown: Boolean; cdecl;
    procedure onVirtualKeyboardFrameChanged(newFrame: JRect); cdecl;
    procedure removeOnKeyboardStateChangedListener(listener: JOnKeyboardStateChangedListener); cdecl;
    function showFor(view: JView): Boolean; cdecl;
  end;
  TJVirtualKeyboard = class(TJavaGenericImport<JVirtualKeyboardClass, JVirtualKeyboard>) end;

  JVirtualKeyboardFrameObserverClass = interface(JPopupWindowClass)
    ['{66F0AE1C-C8DA-4A13-AAEA-E3A0AC1993E5}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/keyboard/VirtualKeyboardFrameObserver')]
  JVirtualKeyboardFrameObserver = interface(JPopupWindow)
    ['{6CF8ED4B-C6A6-433C-B6EE-6B8AC4DD94B6}']
    function isVirtualKeyboardShown: Boolean; cdecl;
    procedure onLayoutChange(v: JView; left: Integer; top: Integer; right: Integer; bottom: Integer; oldLeft: Integer; oldTop: Integer; oldRight: Integer; oldBottom: Integer); cdecl;
    procedure setListener(listener: JObject); cdecl;
    procedure stopObservation; cdecl;
  end;
  TJVirtualKeyboardFrameObserver = class(TJavaGenericImport<JVirtualKeyboardFrameObserverClass, JVirtualKeyboardFrameObserver>) end;

  JCameraChangeListenerClass = interface(JObjectClass)
    ['{F4FEB220-69F8-42F6-B16C-8EE14637E5E8}']
    {class} function init: JCameraChangeListener; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/CameraChangeListener')]
  JCameraChangeListener = interface(JObject)
    ['{77995FF0-3B8E-4B7E-96DB-DD36E3359227}']
    function getBearing: Single; cdecl;
    function getLatitude: Double; cdecl;
    function getLongitude: Double; cdecl;
    function getTilt: Single; cdecl;
    function getZoom: Single; cdecl;
    procedure onCameraChange(position: JCameraPosition); cdecl;
    procedure setCallback(callback: JCameraChangeListener_Callback); cdecl;
  end;
  TJCameraChangeListener = class(TJavaGenericImport<JCameraChangeListenerClass, JCameraChangeListener>) end;

  JCameraChangeListener_CallbackClass = interface(IJavaClass)
    ['{B967D9A3-3A71-43F2-8603-7198391440EF}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/CameraChangeListener$Callback')]
  JCameraChangeListener_Callback = interface(IJavaInstance)
    ['{6EBC7047-A849-46A4-B610-B453B3876038}']
    procedure onCameraChange(listener: JCameraChangeListener); cdecl;
  end;
  TJCameraChangeListener_Callback = class(TJavaGenericImport<JCameraChangeListener_CallbackClass, JCameraChangeListener_Callback>) end;

  JMapViewWithGesturesClass = interface(JMapViewClass)
    ['{1C7E8661-598A-495E-B93F-F7F8ABFDE659}']
    {class} function init(context: JContext; options: JGoogleMapOptions): JMapViewWithGestures; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/maps/MapViewWithGestures')]
  JMapViewWithGestures = interface(JMapView)
    ['{619B12B4-6B8D-4FF0-B1E6-89E864F0C073}']
    function dispatchTouchEvent(ev: JMotionEvent): Boolean; cdecl;
    function getGestureDetector: JGestureDetector; cdecl;
  end;
  TJMapViewWithGestures = class(TJavaGenericImport<JMapViewWithGesturesClass, JMapViewWithGestures>) end;

  JFMXMediaLibraryClass = interface(JObjectClass)
    ['{66D17071-77BC-4881-9546-0F803D781E41}']
    {class} function _GetACTION_CROP_IMAGE: Integer; cdecl;
    {class} function _GetACTION_TAKE_IMAGE_FROM_CAMERA: Integer; cdecl;
    {class} function _GetACTION_TAKE_IMAGE_FROM_LIBRARY: Integer; cdecl;
    {class} function init(activity: JActivity): JFMXMediaLibrary; cdecl;
    {class} function isRequestForTakingImage(requestCode: Integer): Boolean; cdecl;
    {class} property ACTION_CROP_IMAGE: Integer read _GetACTION_CROP_IMAGE;
    {class} property ACTION_TAKE_IMAGE_FROM_CAMERA: Integer read _GetACTION_TAKE_IMAGE_FROM_CAMERA;
    {class} property ACTION_TAKE_IMAGE_FROM_LIBRARY: Integer read _GetACTION_TAKE_IMAGE_FROM_LIBRARY;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/FMXMediaLibrary')]
  JFMXMediaLibrary = interface(JObject)
    ['{FA55B1EF-8E7E-4D22-B835-14F0B0B4C375}']
    function getLastPhotoName: JString; cdecl;
    procedure handleTakingPhotoRequest(data: JIntent; requestCode: Integer); cdecl;
    procedure onRestoreInstanceState(savedInstanceState: JBundle); cdecl;
    procedure onSaveInstanceState(outState: JBundle); cdecl;
    procedure setListener(listener: JFMXMediaLibraryListener); cdecl;
    procedure takeImageFromCamera(maxWidth: Integer; maxHeight: Integer; editable: Boolean; needSaveToAlbum: Boolean); cdecl;
    procedure takeImageFromLibrary(maxWidth: Integer; maxHeight: Integer; editable: Boolean); cdecl;
  end;
  TJFMXMediaLibrary = class(TJavaGenericImport<JFMXMediaLibraryClass, JFMXMediaLibrary>) end;

  JFMXMediaLibraryListenerClass = interface(IJavaClass)
    ['{A9A14D40-E569-4D87-AA19-6759376B8E85}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/FMXMediaLibraryListener')]
  JFMXMediaLibraryListener = interface(IJavaInstance)
    ['{A74DD810-7822-4CD1-A67A-ED471D7F136F}']
    procedure OnMediaLibraryAccept(requestCode: Integer); cdecl;
    procedure OnMediaLibraryCancel(requestCode: Integer); cdecl;
  end;
  TJFMXMediaLibraryListener = class(TJavaGenericImport<JFMXMediaLibraryListenerClass, JFMXMediaLibraryListener>) end;

  JMediaImageClass = interface(JObjectClass)
    ['{F9A004A1-D818-4044-BB22-2BEF9964DDE9}']
    {class} function init(activity: JActivity): JMediaImage; cdecl; overload;
    {class} function init(activity: JActivity; imageType: JMediaImage_ImageStorePlace): JMediaImage; cdecl; overload;
    {class} function loadFromUri(activity: JActivity; imageUri: Jnet_Uri; requiredSize: JSize): JMediaImage; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/MediaImage')]
  JMediaImage = interface(JObject)
    ['{EBFB1830-3743-4322-841B-D229E5E28806}']
    procedure addPhotoToGallery; cdecl;
    function cropImage(selectedUri: Jnet_Uri): Boolean; cdecl;
    function getFileName: JString; cdecl;
    function getFileUri: Jnet_Uri; cdecl;
    function getRotationAngle: Integer; cdecl;
    function isFileExists: Boolean; cdecl;
    function isImageLoaded: Boolean; cdecl;
    procedure loadFromFile(requiredSize: JSize); cdecl; overload;
    procedure loadFromFile(fileName: JString; requiredSize: JSize); cdecl; overload;
    procedure normalizeOrientation; cdecl;
    procedure remove; cdecl;
    procedure saveToFile; cdecl;
    procedure saveToTempFile; cdecl;
    procedure unloadBitmap; cdecl;
  end;
  TJMediaImage = class(TJavaGenericImport<JMediaImageClass, JMediaImage>) end;

  JMediaImage_ImageStorePlaceClass = interface(JEnumClass)
    ['{E72870F7-4E76-4F02-B1BA-443154EC4CC1}']
    {class} function _GetCACHE: JMediaImage_ImageStorePlace; cdecl;
    {class} function _GetCAMERA_PHOTO: JMediaImage_ImageStorePlace; cdecl;
    {class} function valueOf(name: JString): JMediaImage_ImageStorePlace; cdecl;
    {class} function values: TJavaObjectArray<JMediaImage_ImageStorePlace>; cdecl;
    {class} property CACHE: JMediaImage_ImageStorePlace read _GetCACHE;
    {class} property CAMERA_PHOTO: JMediaImage_ImageStorePlace read _GetCAMERA_PHOTO;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/MediaImage$ImageStorePlace')]
  JMediaImage_ImageStorePlace = interface(JEnum)
    ['{23112798-8591-41BA-8411-BB8E4FF83766}']
  end;
  TJMediaImage_ImageStorePlace = class(TJavaGenericImport<JMediaImage_ImageStorePlaceClass, JMediaImage_ImageStorePlace>) end;

  JSizeClass = interface(JObjectClass)
    ['{504D8D1C-33C2-4616-B8A3-103EB98A0F3E}']
    {class} function init(width: Integer; height: Integer): JSize; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/Size')]
  JSize = interface(JObject)
    ['{8555E68B-9EA9-4F02-8DEE-89A9666DD7EB}']
    function getHeight: Integer; cdecl;
    function getWidth: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
  end;
  TJSize = class(TJavaGenericImport<JSizeClass, JSize>) end;

  JUtilsClass = interface(JObjectClass)
    ['{AA250306-1C54-4F37-BDE4-BF311C544025}']
    {class} function init: JUtils; cdecl;
    {class} function copyStream(input: JInputStream; output: JOutputStream): Integer; cdecl;
    {class} function getAlbumDir(albumName: JString): JFile; cdecl;
    {class} function getPhotosDir: JFile; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/medialibrary/Utils')]
  JUtils = interface(JObject)
    ['{0B0C8119-2A9F-480F-AE06-E17CE12DE684}']
  end;
  TJUtils = class(TJavaGenericImport<JUtilsClass, JUtils>) end;

  JNativeControlHostClass = interface(JObjectClass)
    ['{BAF9E1C5-7EBD-46AC-9B3B-BCE1C353E5FE}']
    {class} function init(context: JContext): JNativeControlHost; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/nativelayout/NativeControlHost')]
  JNativeControlHost = interface(JObject)
    ['{E6589CE6-E4BF-4A09-833B-0AF754D4E580}']
    function getView: JView; cdecl;
    procedure setControl(view: JView); cdecl;
    procedure setFocus(newFocusState: Boolean); cdecl;
    procedure setFocusable(focusable: Boolean); cdecl;
    procedure setPosition(absoluteX: Integer; absoluteY: Integer); cdecl;
    procedure setSize(absoluteWidth: Integer; absoluteHeight: Integer); cdecl;
  end;
  TJNativeControlHost = class(TJavaGenericImport<JNativeControlHostClass, JNativeControlHost>) end;

  JNativeLayoutClass = interface(JObjectClass)
    ['{199D9A89-2415-4FFA-8BF5-92EABBD883CE}']
    {class} function init(Con: JContext; Token: JIBinder): JNativeLayout; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/nativelayout/NativeLayout')]
  JNativeLayout = interface(JObject)
    ['{3D369CB4-4A09-4C30-8D92-9BA198957802}']
    procedure setControl(view: JView); cdecl;
    procedure setFocus(newFocusState: Boolean); cdecl;
    procedure setOnFocusChangeListener(listener: JView_OnFocusChangeListener); cdecl;
    procedure setPosition(absoluteX: Integer; absoluteY: Integer); cdecl;
    procedure setSize(absoluteWidth: Integer; absoluteHeight: Integer); cdecl;
  end;
  TJNativeLayout = class(TJavaGenericImport<JNativeLayoutClass, JNativeLayout>) end;

  JBasePickerClass = interface(JObjectClass)
    ['{9F35AC6E-96AD-4E73-BFC2-23B3ACB3F01E}']
    {class} function init: JBasePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BasePicker')]
  JBasePicker = interface(JObject)
    ['{FB1961D2-65AB-4224-B8D9-2D48AA436652}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJBasePicker = class(TJavaGenericImport<JBasePickerClass, JBasePicker>) end;

  JBaseDateTimePickerClass = interface(JBasePickerClass)
    ['{AEF4DB42-B726-4D97-923F-EBACCD26AE68}']
    {class} function init: JBaseDateTimePicker; cdecl;
    {class} function getGMTTimeZone: JTimeZone; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BaseDateTimePicker')]
  JBaseDateTimePicker = interface(JBasePicker)
    ['{93D09E24-E245-43DE-B992-77C7BB27C672}']
    function getDate: JDate; cdecl;
    function getTime: JDate; cdecl;
    function hasListener: Boolean; cdecl;
    procedure setDate(timeInMillis: Int64); cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
  end;
  TJBaseDateTimePicker = class(TJavaGenericImport<JBaseDateTimePickerClass, JBaseDateTimePicker>) end;

  JBaseListPickerClass = interface(JBasePickerClass)
    ['{960A0BD3-E971-4206-B089-ED555BA8F736}']
    {class} function init: JBaseListPicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BaseListPicker')]
  JBaseListPicker = interface(JBasePicker)
    ['{E7D99458-E717-4FDB-8CEB-8288A81AC9B4}']
    function hasListener: Boolean; cdecl;
    procedure setItemIndex(itemIndex: Integer); cdecl;
    procedure setItems(items: TJavaObjectArray<JCharSequence>); cdecl;
    procedure setListener(listener: JOnItemChangedListener); cdecl;
  end;
  TJBaseListPicker = class(TJavaGenericImport<JBaseListPickerClass, JBaseListPicker>) end;

  JBasePickersFactoryClass = interface(JObjectClass)
    ['{235431A6-84D7-48A1-9194-9A44E118294E}']
    {class} function init: JBasePickersFactory; cdecl;
    {class} function getFactory: JBasePickersFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/BasePickersFactory')]
  JBasePickersFactory = interface(JObject)
    ['{F192F199-A07C-41CC-A4A4-8DCC857B26EA}']
    function createDatePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
    function createListPicker(activity: JFMXNativeActivity): JBaseListPicker; cdecl;
    function createTimePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
  end;
  TJBasePickersFactory = class(TJavaGenericImport<JBasePickersFactoryClass, JBasePickersFactory>) end;

  JGeneratorPickerIDClass = interface(JObjectClass)
    ['{311AD0A1-F9EC-484D-B7D6-AEC67E5BFC55}']
    {class} function init: JGeneratorPickerID; cdecl;
    {class} function getUniqueID: Integer; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/GeneratorPickerID')]
  JGeneratorPickerID = interface(JObject)
    ['{3FE9FE79-740A-4D21-AE66-E8C9C2F0517F}']
  end;
  TJGeneratorPickerID = class(TJavaGenericImport<JGeneratorPickerIDClass, JGeneratorPickerID>) end;

  JOnDateTimeChangedListenerClass = interface(IJavaClass)
    ['{6253D5BE-9035-4894-B479-2B91B1496180}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/OnDateTimeChangedListener')]
  JOnDateTimeChangedListener = interface(IJavaInstance)
    ['{3BE7DC7B-92F9-4B5D-BBC4-B49FAE5CE96E}']
    procedure onDateChanged(date: JDate); cdecl;
    procedure onHide; cdecl;
    procedure onShow; cdecl;
  end;
  TJOnDateTimeChangedListener = class(TJavaGenericImport<JOnDateTimeChangedListenerClass, JOnDateTimeChangedListener>) end;

  JOnItemChangedListenerClass = interface(IJavaClass)
    ['{1A8B5BC7-25C3-43B9-9E0E-B144BDC49CC5}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/OnItemChangedListener')]
  JOnItemChangedListener = interface(IJavaInstance)
    ['{BC0BDDA3-53FD-4BA8-9E3D-B17F647345C6}']
    procedure onHide; cdecl;
    procedure onItemChanged(itemIndex: Integer); cdecl;
    procedure onShow; cdecl;
  end;
  TJOnItemChangedListener = class(TJavaGenericImport<JOnItemChangedListenerClass, JOnItemChangedListener>) end;

  Jdefaults_DatePickerFragmentClass = interface(JDialogFragmentClass)
    ['{BA993453-9297-45B2-B496-33DF58EC656E}']
    {class} function init(year: Integer; month: Integer; day: Integer): Jdefaults_DatePickerFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DatePickerFragment')]
  Jdefaults_DatePickerFragment = interface(JDialogFragment)
    ['{1E90BA78-2E8D-409C-9D3E-674B9C51E129}']
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onDateSet(view: JDatePicker; year: Integer; month: Integer; day: Integer); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure setDate(year: Integer; month: Integer; day: Integer); cdecl;
    procedure setHasDateConstraints(hasDateConstraints: Boolean); cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setMaxDate(date: JDate); cdecl;
    procedure setMinDate(date: JDate); cdecl;
    procedure setTheme(theme: Integer); cdecl;
  end;
  TJdefaults_DatePickerFragment = class(TJavaGenericImport<Jdefaults_DatePickerFragmentClass, Jdefaults_DatePickerFragment>) end;

  JDefaultDatePickerClass = interface(JBaseDateTimePickerClass)
    ['{4D36CFEF-1AD9-4C50-8992-32E13346574D}']
    {class} function init(activity: JFMXNativeActivity): JDefaultDatePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultDatePicker')]
  JDefaultDatePicker = interface(JBaseDateTimePicker)
    ['{E5CB7805-4603-44A2-A088-2F0D03E061ED}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJDefaultDatePicker = class(TJavaGenericImport<JDefaultDatePickerClass, JDefaultDatePicker>) end;

  JDefaultListPickerClass = interface(JBaseListPickerClass)
    ['{926BA109-6E51-43DD-A672-75FB33576476}']
    {class} function init(activity: JFMXNativeActivity): JDefaultListPicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultListPicker')]
  JDefaultListPicker = interface(JBaseListPicker)
    ['{15AE1BAA-54EF-42B3-B032-BFE66A11ED01}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setItemIndex(itemIndex: Integer); cdecl;
    procedure setItems(items: TJavaObjectArray<JCharSequence>); cdecl;
    procedure setListener(listener: JOnItemChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJDefaultListPicker = class(TJavaGenericImport<JDefaultListPickerClass, JDefaultListPicker>) end;

  JDefaultPickersFactoryClass = interface(JBasePickersFactoryClass)
    ['{87462100-5B6E-4DAE-B264-A8FC84E3AB3E}']
    {class} function init: JDefaultPickersFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultPickersFactory')]
  JDefaultPickersFactory = interface(JBasePickersFactory)
    ['{FD970141-B89F-4A1E-8781-A3D6A5C0DB67}']
    function createDatePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
    function createListPicker(activity: JFMXNativeActivity): JBaseListPicker; cdecl;
    function createTimePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
  end;
  TJDefaultPickersFactory = class(TJavaGenericImport<JDefaultPickersFactoryClass, JDefaultPickersFactory>) end;

  JDefaultTimePickerClass = interface(JBaseDateTimePickerClass)
    ['{F58D42AA-5303-40D1-9A50-EFA6079B6B70}']
    {class} function init(activity: JFMXNativeActivity): JDefaultTimePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/DefaultTimePicker')]
  JDefaultTimePicker = interface(JBaseDateTimePicker)
    ['{52F03A05-2EF3-4114-A5E6-D3B2FF4E4BBC}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJDefaultTimePicker = class(TJavaGenericImport<JDefaultTimePickerClass, JDefaultTimePicker>) end;

  Jdefaults_ListPickerFragmentClass = interface(JDialogFragmentClass)
    ['{E96F3E38-4949-4F21-B722-AD1AA5968AEB}']
    {class} function init: Jdefaults_ListPickerFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/ListPickerFragment')]
  Jdefaults_ListPickerFragment = interface(JDialogFragment)
    ['{FBCD51E2-88FE-4962-B0A4-5CE647E66659}']
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onStart; cdecl;
    procedure setTheme(theme: Integer); cdecl;
  end;
  TJdefaults_ListPickerFragment = class(TJavaGenericImport<Jdefaults_ListPickerFragmentClass, Jdefaults_ListPickerFragment>) end;

  Jdefaults_TimePickerFragmentClass = interface(JDialogFragmentClass)
    ['{1DF31EF0-1207-48B7-8AF2-B892DD120EFB}']
    {class} function init(hour: Integer; min: Integer): Jdefaults_TimePickerFragment; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/defaults/TimePickerFragment')]
  Jdefaults_TimePickerFragment = interface(JDialogFragment)
    ['{FA22FC03-0530-463C-8612-59B2266C92EC}']
    function onCreateDialog(savedInstanceState: JBundle): JDialog; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onTimeSet(view: JTimePicker; hourOfDay: Integer; minute: Integer); cdecl;
    procedure setListener(listener: JOnDateTimeChangedListener); cdecl;
    procedure setTheme(theme: Integer); cdecl;
    procedure setTime(hour: Integer; min: Integer); cdecl;
  end;
  TJdefaults_TimePickerFragment = class(TJavaGenericImport<Jdefaults_TimePickerFragmentClass, Jdefaults_TimePickerFragment>) end;

  JGingerbreadDatePickerClass = interface(JBaseDateTimePickerClass)
    ['{A14AF85E-0CC0-4DF1-B360-D096D9427D33}']
    {class} function init(activity: JFMXNativeActivity): JGingerbreadDatePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadDatePicker')]
  JGingerbreadDatePicker = interface(JBaseDateTimePicker)
    ['{DE11CE3A-2581-4854-8157-81D430D63BD7}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure onDateSet(view: JDatePicker; year: Integer; monthOfYear: Integer; dayOfMonth: Integer); cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onShow(dialog: JDialogInterface); cdecl;
    procedure show; cdecl;
  end;
  TJGingerbreadDatePicker = class(TJavaGenericImport<JGingerbreadDatePickerClass, JGingerbreadDatePicker>) end;

  JGingerbreadListPickerClass = interface(JBaseListPickerClass)
    ['{8DE518CE-091A-4B4D-A35F-52C33B2B6D47}']
    {class} function init(activity: JFMXNativeActivity): JGingerbreadListPicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadListPicker')]
  JGingerbreadListPicker = interface(JBaseListPicker)
    ['{452F008C-4501-472B-8DA7-D97B6A01363B}']
    procedure createNativePicker; cdecl;
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onShow(dialog: JDialogInterface); cdecl;
    procedure show; cdecl;
  end;
  TJGingerbreadListPicker = class(TJavaGenericImport<JGingerbreadListPickerClass, JGingerbreadListPicker>) end;

  JGingerbreadPickersFactoryClass = interface(JBasePickersFactoryClass)
    ['{7CED6A47-AF36-4331-8767-F10B3BB26AC2}']
    {class} function init: JGingerbreadPickersFactory; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadPickersFactory')]
  JGingerbreadPickersFactory = interface(JBasePickersFactory)
    ['{D8997335-A78B-4ED6-BCA6-BFD161D27DEB}']
    function createDatePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
    function createListPicker(activity: JFMXNativeActivity): JBaseListPicker; cdecl;
    function createTimePicker(activity: JFMXNativeActivity): JBaseDateTimePicker; cdecl;
  end;
  TJGingerbreadPickersFactory = class(TJavaGenericImport<JGingerbreadPickersFactoryClass, JGingerbreadPickersFactory>) end;

  JGingerbreadTimePickerClass = interface(JBaseDateTimePickerClass)
    ['{F8FA1BFD-468B-4BC0-8641-00477AF10DA9}']
    {class} function init(activity: JFMXNativeActivity): JGingerbreadTimePicker; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/pickers/gingerbread/GingerbreadTimePicker')]
  JGingerbreadTimePicker = interface(JBaseDateTimePicker)
    ['{6E8FEB86-AE04-4A87-A497-0DFA1EB267D7}']
    procedure hide; cdecl;
    function isShown: Boolean; cdecl;
    procedure onDismiss(dialog: JDialogInterface); cdecl;
    procedure onShow(dialog: JDialogInterface); cdecl;
    procedure onTimeSet(view: JTimePicker; hourOfDay: Integer; minute: Integer); cdecl;
    procedure show; cdecl;
  end;
  TJGingerbreadTimePicker = class(TJavaGenericImport<JGingerbreadTimePickerClass, JGingerbreadTimePicker>) end;

  JIAPSecurityClass = interface(JObjectClass)
    ['{D3239720-8053-483A-8E21-6B866406B512}']
    {class} function init: JIAPSecurity; cdecl;
    {class} function verifyPurchase(base64PublicKey: JString; signedData: JString; signature: JString): Boolean; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/purchasing/IAPSecurity')]
  JIAPSecurity = interface(JObject)
    ['{288E1DF2-92BC-4F89-808A-A3EF90C77280}']
  end;
  TJIAPSecurity = class(TJavaGenericImport<JIAPSecurityClass, JIAPSecurity>) end;

  JCharCaseClass = interface(JEnumClass)
    ['{7130BF07-0018-48B9-975B-DA5119E0B2FE}']
    {class} function _GetLOWER_CASE: JCharCase; cdecl;
    {class} function _GetNORMAL: JCharCase; cdecl;
    {class} function _GetUPPER_CASE: JCharCase; cdecl;
    {class} function valueOf(name: JString): JCharCase; cdecl;
    {class} function values: TJavaObjectArray<JCharCase>; cdecl;
    {class} property LOWER_CASE: JCharCase read _GetLOWER_CASE;
    {class} property NORMAL: JCharCase read _GetNORMAL;
    {class} property UPPER_CASE: JCharCase read _GetUPPER_CASE;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/CharCase')]
  JCharCase = interface(JEnum)
    ['{75C5997A-7992-4083-A76E-2B7BF0E2F8CA}']
  end;
  TJCharCase = class(TJavaGenericImport<JCharCaseClass, JCharCase>) end;

  JFMXEditTextClass = interface(JEditTextClass)
    ['{B9632454-D051-4E9F-B7E8-8A92EFDE2030}']
    {class} function init(context: JContext): JFMXEditText; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JFMXEditText; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyleAttr: Integer): JFMXEditText; cdecl; overload;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/FMXEditText')]
  JFMXEditText = interface(JEditText)
    ['{FF39BA82-C7A1-4D7C-B861-513A4DE18C90}']
    procedure addTextListener(textListener: JFMXTextListener); cdecl;
    function getCharCase: JCharCase; cdecl;
    function getFilterChars: JString; cdecl;
    function getKeyboardType: JVirtualKeyboardType; cdecl;
    function getMaxLength: Integer; cdecl;
    function getReturnKeyType: JReturnKeyType; cdecl;
    function hasFilterChars: Boolean; cdecl;
    function isMultiline: Boolean; cdecl;
    function isPassword: Boolean; cdecl;
    function isReadOnly: Boolean; cdecl;
    function onCreateInputConnection(outAttrs: JEditorInfo): JInputConnection; cdecl;
    procedure onEditorAction(actionCode: Integer); cdecl;
    function onTouchEvent(event: JMotionEvent): Boolean; cdecl;
    procedure removeTextListener(textListener: JFMXTextListener); cdecl;
    procedure setCharCase(charCase: JCharCase); cdecl;
    procedure setFilterChars(filterChars: JString); cdecl;
    procedure setKeyboardType(keyboardType: JVirtualKeyboardType); cdecl;
    procedure setMaxLength(maxLength: Integer); cdecl;
    procedure setMultiline(multiline: Boolean); cdecl;
    procedure setNeededToShowSoftKeyboardOnTouch(neededToShowSoftKeyboardOnTouch: Boolean); cdecl;
    procedure setPassword(password: Boolean); cdecl;
    procedure setReadOnly(readOnly: Boolean); cdecl;
    procedure setReturnKeyType(returnKeyType: JReturnKeyType); cdecl;
  end;
  TJFMXEditText = class(TJavaGenericImport<JFMXEditTextClass, JFMXEditText>) end;

  JFMXTextListenerClass = interface(IJavaClass)
    ['{A8C204B6-E91D-43C9-AAE6-A8F638AC8B0B}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/FMXTextListener')]
  JFMXTextListener = interface(IJavaInstance)
    ['{343503D5-CA05-4DAE-AABF-C112202B9CFA}']
    procedure onComposingText(beginPosition: Integer; endPosition: Integer); cdecl;
    procedure onEditorAction(actionCode: Integer); cdecl;
    procedure onTextUpdated(text: JCharSequence; cursorPosition: Integer); cdecl;
  end;
  TJFMXTextListener = class(TJavaGenericImport<JFMXTextListenerClass, JFMXTextListener>) end;

  JReturnKeyTypeClass = interface(JEnumClass)
    ['{B83238CE-4A71-4330-AB5C-D020E207B74E}']
    {class} function _GetDONE: JReturnKeyType; cdecl;
    {class} function _GetENTER: JReturnKeyType; cdecl;
    {class} function _GetGO: JReturnKeyType; cdecl;
    {class} function _GetNEXT: JReturnKeyType; cdecl;
    {class} function _GetSEARCH: JReturnKeyType; cdecl;
    {class} function _GetSEND: JReturnKeyType; cdecl;
    {class} function valueOf(name: JString): JReturnKeyType; cdecl;
    {class} function values: TJavaObjectArray<JReturnKeyType>; cdecl;
    {class} property DONE: JReturnKeyType read _GetDONE;
    {class} property ENTER: JReturnKeyType read _GetENTER;
    {class} property GO: JReturnKeyType read _GetGO;
    {class} property NEXT: JReturnKeyType read _GetNEXT;
    {class} property SEARCH: JReturnKeyType read _GetSEARCH;
    {class} property SEND: JReturnKeyType read _GetSEND;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/ReturnKeyType')]
  JReturnKeyType = interface(JEnum)
    ['{16AE8FAC-E2AC-4898-9A64-25C8F73E2294}']
    function getImeOptions: Integer; cdecl;
  end;
  TJReturnKeyType = class(TJavaGenericImport<JReturnKeyTypeClass, JReturnKeyType>) end;

  JVirtualKeyboardTypeClass = interface(JEnumClass)
    ['{E6DEC0E1-D886-4A5E-A07F-B50E17B8C28B}']
    {class} function _GetALPHABET: JVirtualKeyboardType; cdecl;
    {class} function _GetEMAIL_ADDRESS: JVirtualKeyboardType; cdecl;
    {class} function _GetNAME_PHONE_PAD: JVirtualKeyboardType; cdecl;
    {class} function _GetNUMBER: JVirtualKeyboardType; cdecl;
    {class} function _GetNUMBER_AND_PUNCTUATION: JVirtualKeyboardType; cdecl;
    {class} function _GetNUMBER_DECIMAL: JVirtualKeyboardType; cdecl;
    {class} function _GetPHONE: JVirtualKeyboardType; cdecl;
    {class} function _GetTEXT: JVirtualKeyboardType; cdecl;
    {class} function _GetURL: JVirtualKeyboardType; cdecl;
    {class} function valueOf(name: JString): JVirtualKeyboardType; cdecl;
    {class} function values: TJavaObjectArray<JVirtualKeyboardType>; cdecl;
    {class} property ALPHABET: JVirtualKeyboardType read _GetALPHABET;
    {class} property EMAIL_ADDRESS: JVirtualKeyboardType read _GetEMAIL_ADDRESS;
    {class} property NAME_PHONE_PAD: JVirtualKeyboardType read _GetNAME_PHONE_PAD;
    {class} property NUMBER: JVirtualKeyboardType read _GetNUMBER;
    {class} property NUMBER_AND_PUNCTUATION: JVirtualKeyboardType read _GetNUMBER_AND_PUNCTUATION;
    {class} property NUMBER_DECIMAL: JVirtualKeyboardType read _GetNUMBER_DECIMAL;
    {class} property PHONE: JVirtualKeyboardType read _GetPHONE;
    {class} property TEXT: JVirtualKeyboardType read _GetTEXT;
    {class} property URL: JVirtualKeyboardType read _GetURL;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/VirtualKeyboardType')]
  JVirtualKeyboardType = interface(JEnum)
    ['{31FBFD4B-7476-4041-A253-29D7098C1CDD}']
    function getInputType: Integer; cdecl;
    function isNumberClass: Boolean; cdecl;
    function isTextClass: Boolean; cdecl;
  end;
  TJVirtualKeyboardType = class(TJavaGenericImport<JVirtualKeyboardTypeClass, JVirtualKeyboardType>) end;

  JAllLowerClass = interface(JObjectClass)
    ['{A052D0AC-61A4-418C-AF59-0BFC82680EA7}']
    {class} function init: JAllLower; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/filters/AllLower')]
  JAllLower = interface(JObject)
    ['{E2429529-8F5A-4CAE-A84D-0197005858FF}']
    function filter(source: JCharSequence; start: Integer; end_: Integer; dest: JSpanned; dstart: Integer; dend: Integer): JCharSequence; cdecl;
  end;
  TJAllLower = class(TJavaGenericImport<JAllLowerClass, JAllLower>) end;

  JFilterCharClass = interface(JObjectClass)
    ['{5A483B22-6173-4AB3-BEB7-2F681A1F7276}']
    {class} function init(filterChar: JCharSequence): JFilterChar; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/filters/FilterChar')]
  JFilterChar = interface(JObject)
    ['{731E295B-8E15-47BB-B896-DEAFAB7CDA3E}']
    function filter(source: JCharSequence; start: Integer; end_: Integer; dest: JSpanned; dstart: Integer; dend: Integer): JCharSequence; cdecl;
  end;
  TJFilterChar = class(TJavaGenericImport<JFilterCharClass, JFilterChar>) end;

  JDelegatedActionModeCallbackClass = interface(JObjectClass)
    ['{BC6B3C35-D160-482B-B5E0-0B3F08F8C37F}']
    {class} function init(onContextMenuListener: JOnTextContextMenuListener): JDelegatedActionModeCallback; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/menu/DelegatedActionModeCallback')]
  JDelegatedActionModeCallback = interface(JObject)
    ['{A4D5C50B-B902-457D-A616-0F738B9B10F6}']
    function onActionItemClicked(mode: JActionMode; item: JMenuItem): Boolean; cdecl;
    function onCreateActionMode(mode: JActionMode; menu: JMenu): Boolean; cdecl;
    procedure onDestroyActionMode(mode: JActionMode); cdecl;
    function onPrepareActionMode(mode: JActionMode; menu: JMenu): Boolean; cdecl;
  end;
  TJDelegatedActionModeCallback = class(TJavaGenericImport<JDelegatedActionModeCallbackClass, JDelegatedActionModeCallback>) end;

  JDelegatedActionModeCallback2Class = interface(JActionMode_Callback2Class)
    ['{AD8135E3-E944-4032-AB94-0187D73E2716}']
    {class} function init(onContextMenuListener: JOnTextContextMenuListener): JDelegatedActionModeCallback2; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/menu/DelegatedActionModeCallback2')]
  JDelegatedActionModeCallback2 = interface(JActionMode_Callback2)
    ['{37FCE89A-8BCE-498A-A3E1-92F6961A715F}']
    function onActionItemClicked(mode: JActionMode; item: JMenuItem): Boolean; cdecl;
    function onCreateActionMode(mode: JActionMode; menu: JMenu): Boolean; cdecl;
    procedure onDestroyActionMode(mode: JActionMode); cdecl;
    procedure onGetContentRect(mode: JActionMode; view: JView; outRect: JRect); cdecl;
    function onPrepareActionMode(mode: JActionMode; menu: JMenu): Boolean; cdecl;
  end;
  TJDelegatedActionModeCallback2 = class(TJavaGenericImport<JDelegatedActionModeCallback2Class, JDelegatedActionModeCallback2>) end;

  JOnTextContextMenuListenerClass = interface(JActionMode_CallbackClass)
    ['{487107F4-005A-422A-B00C-D56EBC257588}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/text/menu/OnTextContextMenuListener')]
  JOnTextContextMenuListener = interface(JActionMode_Callback)
    ['{614FBEA7-BD83-4F1E-9978-423DA86E95E3}']
    procedure onGetContentRect(mode: JActionMode; view: JView; outRect: JRect); cdecl;
  end;
  TJOnTextContextMenuListener = class(TJavaGenericImport<JOnTextContextMenuListenerClass, JOnTextContextMenuListener>) end;

  JOnWebViewListenerClass = interface(IJavaClass)
    ['{01D11CF8-BF46-45EF-8090-628E2BA23A2E}']
  end;

  [JavaSignature('com/embarcadero/firemonkey/webbrowser/OnWebViewListener')]
  JOnWebViewListener = interface(IJavaInstance)
    ['{EF36619D-8759-4381-B638-C99B1C0A0EF8}']
    procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
    procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
    procedure onLoadResource(view: JWebView; url: JString); cdecl;
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
    procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
    procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
    function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
  end;
  TJOnWebViewListener = class(TJavaGenericImport<JOnWebViewListenerClass, JOnWebViewListener>) end;

  JWebBrowserClass = interface(JWebViewClass)
    ['{C9D39057-C2B7-4264-8E58-52DE4CA5AE56}']
    {class} function init(context: JContext): JWebBrowser; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/webbrowser/WebBrowser')]
  JWebBrowser = interface(JWebView)
    ['{21876269-EEA5-4130-BE15-F23BEB8ECA69}']
    procedure SetWebViewListener(listener: JOnWebViewListener); cdecl;
  end;
  TJWebBrowser = class(TJavaGenericImport<JWebBrowserClass, JWebBrowser>) end;

  JWebClientClass = interface(JWebViewClientClass)
    ['{424BCB34-24B0-4A4B-830B-D396C3667344}']
    {class} function init: JWebClient; cdecl;
  end;

  [JavaSignature('com/embarcadero/firemonkey/webbrowser/WebClient')]
  JWebClient = interface(JWebViewClient)
    ['{6D32A60F-6D97-4756-95C6-AFBFE15C465F}']
    procedure SetWebViewListener(listener: JOnWebViewListener); cdecl;
    procedure doUpdateVisitedHistory(view: JWebView; url: JString; isReload: Boolean); cdecl;
    procedure onFormResubmission(view: JWebView; dontResend: JMessage; resend: JMessage); cdecl;
    procedure onLoadResource(view: JWebView; url: JString); cdecl;
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    procedure onPageStarted(view: JWebView; url: JString; favicon: JBitmap); cdecl;
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
    procedure onReceivedHttpAuthRequest(view: JWebView; handler: JHttpAuthHandler; host: JString; realm: JString); cdecl;
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;
    procedure onScaleChanged(view: JWebView; oldScale: Single; newScale: Single); cdecl;
    procedure onUnhandledKeyEvent(view: JWebView; event: JKeyEvent); cdecl;
    function shouldOverrideKeyEvent(view: JWebView; event: JKeyEvent): Boolean; cdecl;
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
  end;
  TJWebClient = class(TJavaGenericImport<JWebClientClass, JWebClient>) end;

  // com.embarcadero.rtl.ProxyInterface
  JProxyServiceClass = interface(JObjectClass)
    ['{4308F1E3-BCAB-4A59-B386-8B467479DE19}']
    {class} function init: JProxyService; cdecl;
    {class} function getService(service: JObject; libraryName: JString): Int64; cdecl;
    {class} function onBind(service: JObject; libraryName: JString; intent: JIntent): JIBinder; cdecl;
    {class} procedure onConfigurationChanged(service: JObject; libraryName: JString; newConfig: JConfiguration); cdecl;
    {class} procedure onCreate(service: JObject; libraryName: JString); cdecl;
    {class} procedure onDestroy(service: JObject; libraryName: JString); cdecl;
    {class} procedure onHandleIntent(service: JObject; libraryName: JString; intent: JIntent); cdecl;
    {class} function onHandleMessage(service: JObject; libraryName: JString; msg: JMessage): Boolean; cdecl;
    {class} procedure onLowMemory(service: JObject; libraryName: JString); cdecl;
    {class} procedure onRebind(service: JObject; libraryName: JString; intent: JIntent); cdecl;
    {class} function onStartCommand(service: JObject; libraryName: JString; intent: JIntent; flags: Integer; startId: Integer): Integer; cdecl;
    {class} procedure onTaskRemoved(service: JObject; libraryName: JString; rootIntent: JIntent); cdecl;
    {class} procedure onTrimMemory(service: JObject; libraryName: JString; level: Integer); cdecl;
    {class} function onUnbind(service: JObject; libraryName: JString; intent: JIntent): Boolean; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/ProxyService')]
  JProxyService = interface(JObject)
    ['{81D7A55C-F3F2-4600-BBD0-F88F0D5B01A4}']
  end;
  TJProxyService = class(TJavaGenericImport<JProxyServiceClass, JProxyService>) end;

  JRTLHandlerClass = interface(JHandlerClass)
    ['{3417384C-A826-4CA7-B264-8728AB002B7B}']
    {class} function init(paramListener: JRTLHandler_Listener): JRTLHandler; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/RTLHandler')]
  JRTLHandler = interface(JHandler)
    ['{D703B524-788D-4D2C-A84C-96AEA91C1B9B}']
    function _GetSuper: JRTLHandler_RTLSuperHandler; cdecl;
    procedure handleMessage(paramMessage: JMessage); cdecl;
    property Super: JRTLHandler_RTLSuperHandler read _GetSuper;
  end;
  TJRTLHandler = class(TJavaGenericImport<JRTLHandlerClass, JRTLHandler>) end;

  JRTLHandler_ListenerClass = interface(IJavaClass)
    ['{49430D59-AA18-486D-94C7-04AC2EA58ADA}']
  end;

  [JavaSignature('com/embarcadero/rtl/RTLHandler$Listener')]
  JRTLHandler_Listener = interface(IJavaInstance)
    ['{D5EEE739-658B-4973-B431-F74CA8681B6E}']
    procedure handleMessage(paramMessage: JMessage); cdecl;
  end;
  TJRTLHandler_Listener = class(TJavaGenericImport<JRTLHandler_ListenerClass, JRTLHandler_Listener>) end;

  JRTLHandler_RTLSuperHandlerClass = interface(JObjectClass)
    ['{6B650C1B-F5D9-44EA-ACD9-CB2EDD0C3280}']
    {class} function init(paramRTLHandler: JRTLHandler): JRTLHandler_RTLSuperHandler; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/RTLHandler$RTLSuperHandler')]
  JRTLHandler_RTLSuperHandler = interface(JObject)
    ['{FF6A6138-30FC-4AE6-B6F6-3AF78E914A9E}']
    procedure handleMessage(paramMessage: JMessage); cdecl;
  end;
  TJRTLHandler_RTLSuperHandler = class(TJavaGenericImport<JRTLHandler_RTLSuperHandlerClass, JRTLHandler_RTLSuperHandler>) end;

  JChannelsManagerClass = interface(JObjectClass)
    ['{50B333A7-5022-4475-BC2A-A39994BED8E9}']
    {class} function init(context: JContext): JChannelsManager; cdecl;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/ChannelsManager')]
  JChannelsManager = interface(JObject)
    ['{0A0C031B-69C1-4915-BA49-2A26E4DB4A59}']
    function getDefaultChannelId: JString; cdecl;
  end;
  TJChannelsManager = class(TJavaGenericImport<JChannelsManagerClass, JChannelsManager>) end;

  JNotificationAlarmClass = interface(JBroadcastReceiverClass)
    ['{C845BD22-FDA5-4A19-84BB-2F7E8042B832}']
    {class} function _GetNOTIFICATION_CENTER: JString; cdecl;
    {class} function _GetSETTINGS_NOTIFICATION_IDS: JString; cdecl;
    {class} function init: JNotificationAlarm; cdecl;
    {class} property NOTIFICATION_CENTER: JString read _GetNOTIFICATION_CENTER;
    {class} property SETTINGS_NOTIFICATION_IDS: JString read _GetSETTINGS_NOTIFICATION_IDS;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/NotificationAlarm')]
  JNotificationAlarm = interface(JBroadcastReceiver)
    ['{B08E8F99-0DE7-404C-A290-0DFCFCB2DCF7}']
    procedure onReceive(context: JContext; intent: JIntent); cdecl;
  end;
  TJNotificationAlarm = class(TJavaGenericImport<JNotificationAlarmClass, JNotificationAlarm>) end;

  JNotificationInfoClass = interface(JObjectClass)
    ['{752976D5-5009-42D5-8A32-EC531871F704}']
    {class} function _GetACTION_NOTIFICATION: JString; cdecl;
    {class} function _GetEXTRA_ACTIVITY_CLASS_NAME: JString; cdecl;
    {class} function _GetEXTRA_ALERT_ACTION: JString; cdecl;
    {class} function _GetEXTRA_ALERT_BODY: JString; cdecl;
    {class} function _GetEXTRA_CHANNEL_ID: JString; cdecl;
    {class} function _GetEXTRA_ENABLE_SOUND: JString; cdecl;
    {class} function _GetEXTRA_FIRE_DATE: JString; cdecl;
    {class} function _GetEXTRA_FIRE_GMT_DATE: JString; cdecl;
    {class} function _GetEXTRA_HAS_ACTION: JString; cdecl;
    {class} function _GetEXTRA_NAME: JString; cdecl;
    {class} function _GetEXTRA_NUMBER: JString; cdecl;
    {class} function _GetEXTRA_REPEAT_INTERVAL: JString; cdecl;
    {class} function _GetEXTRA_SOUND_NAME: JString; cdecl;
    {class} function _GetEXTRA_TITLE: JString; cdecl;
    {class} function _GetEXTRA_UNIQUE_ID: JString; cdecl;
    {class} property ACTION_NOTIFICATION: JString read _GetACTION_NOTIFICATION;
    {class} property EXTRA_ACTIVITY_CLASS_NAME: JString read _GetEXTRA_ACTIVITY_CLASS_NAME;
    {class} property EXTRA_ALERT_ACTION: JString read _GetEXTRA_ALERT_ACTION;
    {class} property EXTRA_ALERT_BODY: JString read _GetEXTRA_ALERT_BODY;
    {class} property EXTRA_CHANNEL_ID: JString read _GetEXTRA_CHANNEL_ID;
    {class} property EXTRA_ENABLE_SOUND: JString read _GetEXTRA_ENABLE_SOUND;
    {class} property EXTRA_FIRE_DATE: JString read _GetEXTRA_FIRE_DATE;
    {class} property EXTRA_FIRE_GMT_DATE: JString read _GetEXTRA_FIRE_GMT_DATE;
    {class} property EXTRA_HAS_ACTION: JString read _GetEXTRA_HAS_ACTION;
    {class} property EXTRA_NAME: JString read _GetEXTRA_NAME;
    {class} property EXTRA_NUMBER: JString read _GetEXTRA_NUMBER;
    {class} property EXTRA_REPEAT_INTERVAL: JString read _GetEXTRA_REPEAT_INTERVAL;
    {class} property EXTRA_SOUND_NAME: JString read _GetEXTRA_SOUND_NAME;
    {class} property EXTRA_TITLE: JString read _GetEXTRA_TITLE;
    {class} property EXTRA_UNIQUE_ID: JString read _GetEXTRA_UNIQUE_ID;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/NotificationInfo')]
  JNotificationInfo = interface(JObject)
    ['{A9BD962E-87E0-46B6-96CB-0AEA5AA99BD9}']
    function getIntentCode: Integer; cdecl;
    function getName: JString; cdecl;
    function getNotificationPreferencesValue: JString; cdecl;
    function getRepeatInterval: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJNotificationInfo = class(TJavaGenericImport<JNotificationInfoClass, JNotificationInfo>) end;

  JNotificationPublisherClass = interface(JObjectClass)
    ['{5AEDA84B-10E7-4EAD-969D-4ECA6D5BA622}']
    {class} function _GetACTION_GCM_NOTIFICATION: JString; cdecl;
    {class} function init(context: JContext): JNotificationPublisher; cdecl;
    {class} property ACTION_GCM_NOTIFICATION: JString read _GetACTION_GCM_NOTIFICATION;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/NotificationPublisher')]
  JNotificationPublisher = interface(JObject)
    ['{16220D10-7DB4-4869-B047-3B10B1B9C5A1}']
    procedure publishGCM(extras: JBundle); cdecl;
  end;
  TJNotificationPublisher = class(TJavaGenericImport<JNotificationPublisherClass, JNotificationPublisher>) end;

  JRepeatIntervalClass = interface(JObjectClass)
    ['{9C4491C8-7BAF-4A5C-96DD-7DB579165E74}']
    {class} function _GetREPEAT_INTERVAL_DAY: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_ERA: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_HOUR: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_MINUTE: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_MONTH: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_NONE: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_QUAERTER: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_SECOND: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_WEEK: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_WEEKDAYS: Integer; cdecl;
    {class} function _GetREPEAT_INTERVAL_YEAR: Integer; cdecl;
    {class} function init: JRepeatInterval; cdecl;
    {class} function getRepeatIntervalMSsec(repeatIntervalType: Integer): Int64; cdecl;
    {class} property REPEAT_INTERVAL_DAY: Integer read _GetREPEAT_INTERVAL_DAY;
    {class} property REPEAT_INTERVAL_ERA: Integer read _GetREPEAT_INTERVAL_ERA;
    {class} property REPEAT_INTERVAL_HOUR: Integer read _GetREPEAT_INTERVAL_HOUR;
    {class} property REPEAT_INTERVAL_MINUTE: Integer read _GetREPEAT_INTERVAL_MINUTE;
    {class} property REPEAT_INTERVAL_MONTH: Integer read _GetREPEAT_INTERVAL_MONTH;
    {class} property REPEAT_INTERVAL_NONE: Integer read _GetREPEAT_INTERVAL_NONE;
    {class} property REPEAT_INTERVAL_QUAERTER: Integer read _GetREPEAT_INTERVAL_QUAERTER;
    {class} property REPEAT_INTERVAL_SECOND: Integer read _GetREPEAT_INTERVAL_SECOND;
    {class} property REPEAT_INTERVAL_WEEK: Integer read _GetREPEAT_INTERVAL_WEEK;
    {class} property REPEAT_INTERVAL_WEEKDAYS: Integer read _GetREPEAT_INTERVAL_WEEKDAYS;
    {class} property REPEAT_INTERVAL_YEAR: Integer read _GetREPEAT_INTERVAL_YEAR;
  end;

  [JavaSignature('com/embarcadero/rtl/notifications/RepeatInterval')]
  JRepeatInterval = interface(JObject)
    ['{71A87C37-FC7D-4A45-A1D4-7DE34B91336A}']
  end;
  TJRepeatInterval = class(TJavaGenericImport<JRepeatIntervalClass, JRepeatInterval>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXNativeActivity', TypeInfo(Androidapi.JNI.Embarcadero.JFMXNativeActivity));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnActivityInsetsChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnActivityInsetsChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnActivityListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnActivityListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JSystemServicesHelper', TypeInfo(Androidapi.JNI.Embarcadero.JSystemServicesHelper));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JViewStack', TypeInfo(Androidapi.JNI.Embarcadero.JViewStack));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JAddressBookObserver', TypeInfo(Androidapi.JNI.Embarcadero.JAddressBookObserver));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnAddressBookChangesListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnAddressBookChangesListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JAdListenerAdapter', TypeInfo(Androidapi.JNI.Embarcadero.JAdListenerAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JIAdListener', TypeInfo(Androidapi.JNI.Embarcadero.JIAdListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXBroadcastReceiver', TypeInfo(Androidapi.JNI.Embarcadero.JFMXBroadcastReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXBroadcastReceiverListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXBroadcastReceiverListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCamPreview', TypeInfo(Androidapi.JNI.Embarcadero.JCamPreview));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDebuggerUtils', TypeInfo(Androidapi.JNI.Embarcadero.JDebuggerUtils));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDeviceArchitectureChecker', TypeInfo(Androidapi.JNI.Embarcadero.JDeviceArchitectureChecker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDialogFactory', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDialogFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDialogHelpers', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDialogHelpers));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDialogListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDialogListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXStandardDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXStandardDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultStandardDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultStandardDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultAlertDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultAlertDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultDialogFactory', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultDialogFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultDialogFragment', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultDialogFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXDefaultInputQueryDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXDefaultInputQueryDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadStandardDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadStandardDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadAlertDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadAlertDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadDialogFactory', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadDialogFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXGingerbreadInputQueryDialog', TypeInfo(Androidapi.JNI.Embarcadero.JFMXGingerbreadInputQueryDialog));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFormView', TypeInfo(Androidapi.JNI.Embarcadero.JFormView));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFormViewListener', TypeInfo(Androidapi.JNI.Embarcadero.JFormViewListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFullScreenManager', TypeInfo(Androidapi.JNI.Embarcadero.JFullScreenManager));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnFullScreenStateChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnFullScreenStateChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JJavaGeocoder', TypeInfo(Androidapi.JNI.Embarcadero.JJavaGeocoder));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnKeyboardStateChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnKeyboardStateChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JVirtualKeyboard', TypeInfo(Androidapi.JNI.Embarcadero.JVirtualKeyboard));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JVirtualKeyboardFrameObserver', TypeInfo(Androidapi.JNI.Embarcadero.JVirtualKeyboardFrameObserver));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCameraChangeListener', TypeInfo(Androidapi.JNI.Embarcadero.JCameraChangeListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCameraChangeListener_Callback', TypeInfo(Androidapi.JNI.Embarcadero.JCameraChangeListener_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JMapViewWithGestures', TypeInfo(Androidapi.JNI.Embarcadero.JMapViewWithGestures));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXMediaLibrary', TypeInfo(Androidapi.JNI.Embarcadero.JFMXMediaLibrary));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXMediaLibraryListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXMediaLibraryListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JMediaImage', TypeInfo(Androidapi.JNI.Embarcadero.JMediaImage));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JMediaImage_ImageStorePlace', TypeInfo(Androidapi.JNI.Embarcadero.JMediaImage_ImageStorePlace));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JSize', TypeInfo(Androidapi.JNI.Embarcadero.JSize));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JUtils', TypeInfo(Androidapi.JNI.Embarcadero.JUtils));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNativeControlHost', TypeInfo(Androidapi.JNI.Embarcadero.JNativeControlHost));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNativeLayout', TypeInfo(Androidapi.JNI.Embarcadero.JNativeLayout));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBasePicker', TypeInfo(Androidapi.JNI.Embarcadero.JBasePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBaseDateTimePicker', TypeInfo(Androidapi.JNI.Embarcadero.JBaseDateTimePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBaseListPicker', TypeInfo(Androidapi.JNI.Embarcadero.JBaseListPicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JBasePickersFactory', TypeInfo(Androidapi.JNI.Embarcadero.JBasePickersFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGeneratorPickerID', TypeInfo(Androidapi.JNI.Embarcadero.JGeneratorPickerID));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnDateTimeChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnDateTimeChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnItemChangedListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnItemChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.Jdefaults_DatePickerFragment', TypeInfo(Androidapi.JNI.Embarcadero.Jdefaults_DatePickerFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultDatePicker', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultDatePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultListPicker', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultListPicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultPickersFactory', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultPickersFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDefaultTimePicker', TypeInfo(Androidapi.JNI.Embarcadero.JDefaultTimePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.Jdefaults_ListPickerFragment', TypeInfo(Androidapi.JNI.Embarcadero.Jdefaults_ListPickerFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.Jdefaults_TimePickerFragment', TypeInfo(Androidapi.JNI.Embarcadero.Jdefaults_TimePickerFragment));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadDatePicker', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadDatePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadListPicker', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadListPicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadPickersFactory', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadPickersFactory));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JGingerbreadTimePicker', TypeInfo(Androidapi.JNI.Embarcadero.JGingerbreadTimePicker));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JIAPSecurity', TypeInfo(Androidapi.JNI.Embarcadero.JIAPSecurity));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JCharCase', TypeInfo(Androidapi.JNI.Embarcadero.JCharCase));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXEditText', TypeInfo(Androidapi.JNI.Embarcadero.JFMXEditText));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFMXTextListener', TypeInfo(Androidapi.JNI.Embarcadero.JFMXTextListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JReturnKeyType', TypeInfo(Androidapi.JNI.Embarcadero.JReturnKeyType));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JVirtualKeyboardType', TypeInfo(Androidapi.JNI.Embarcadero.JVirtualKeyboardType));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JAllLower', TypeInfo(Androidapi.JNI.Embarcadero.JAllLower));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JFilterChar', TypeInfo(Androidapi.JNI.Embarcadero.JFilterChar));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDelegatedActionModeCallback', TypeInfo(Androidapi.JNI.Embarcadero.JDelegatedActionModeCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JDelegatedActionModeCallback2', TypeInfo(Androidapi.JNI.Embarcadero.JDelegatedActionModeCallback2));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnTextContextMenuListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnTextContextMenuListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JOnWebViewListener', TypeInfo(Androidapi.JNI.Embarcadero.JOnWebViewListener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JWebBrowser', TypeInfo(Androidapi.JNI.Embarcadero.JWebBrowser));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JWebClient', TypeInfo(Androidapi.JNI.Embarcadero.JWebClient));
  //TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JProxyInterface', TypeInfo(Androidapi.JNI.Embarcadero.JProxyInterface));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JProxyService', TypeInfo(Androidapi.JNI.Embarcadero.JProxyService));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRTLHandler', TypeInfo(Androidapi.JNI.Embarcadero.JRTLHandler));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRTLHandler_Listener', TypeInfo(Androidapi.JNI.Embarcadero.JRTLHandler_Listener));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRTLHandler_RTLSuperHandler', TypeInfo(Androidapi.JNI.Embarcadero.JRTLHandler_RTLSuperHandler));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JChannelsManager', TypeInfo(Androidapi.JNI.Embarcadero.JChannelsManager));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNotificationAlarm', TypeInfo(Androidapi.JNI.Embarcadero.JNotificationAlarm));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNotificationInfo', TypeInfo(Androidapi.JNI.Embarcadero.JNotificationInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JNotificationPublisher', TypeInfo(Androidapi.JNI.Embarcadero.JNotificationPublisher));
  TRegTypes.RegisterType('Androidapi.JNI.Embarcadero.JRepeatInterval', TypeInfo(Androidapi.JNI.Embarcadero.JRepeatInterval));
end;

initialization
  RegisterTypes;
end.


