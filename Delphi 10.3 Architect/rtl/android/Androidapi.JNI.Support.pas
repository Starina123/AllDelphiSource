{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Support;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JContextCompat = interface;//android.support.v4.content.ContextCompat
  JActivityCompat = interface;//android.support.v4.app.ActivityCompat
  Japp_Fragment = interface;//android.support.v4.app.Fragment
  Japp_Fragment_SavedState = interface;//android.support.v4.app.Fragment$SavedState
  Japp_FragmentActivity = interface;//android.support.v4.app.FragmentActivity
  Japp_FragmentManager = interface;//android.support.v4.app.FragmentManager
  Japp_FragmentManager_BackStackEntry = interface;//android.support.v4.app.FragmentManager$BackStackEntry
  Japp_FragmentManager_FragmentLifecycleCallbacks = interface;//android.support.v4.app.FragmentManager$FragmentLifecycleCallbacks
  Japp_FragmentManager_OnBackStackChangedListener = interface;//android.support.v4.app.FragmentManager$OnBackStackChangedListener
  Japp_FragmentTransaction = interface;//android.support.v4.app.FragmentTransaction
  JJobIntentService = interface;//android.support.v4.app.JobIntentService
  Japp_LoaderManager = interface;//android.support.v4.app.LoaderManager
  Japp_LoaderManager_LoaderCallbacks = interface;//android.support.v4.app.LoaderManager$LoaderCallbacks
  JNotificationCompat_Action = interface;//android.support.v4.app.NotificationCompat$Action
  JNotificationCompat_Builder = interface;//android.support.v4.app.NotificationCompat$Builder
  JNotificationCompat_Extender = interface;//android.support.v4.app.NotificationCompat$Extender
  JNotificationCompat_Style = interface;//android.support.v4.app.NotificationCompat$Style
  Japp_RemoteInput = interface;//android.support.v4.app.RemoteInput
  Japp_SharedElementCallback = interface;//android.support.v4.app.SharedElementCallback
  Japp_SharedElementCallback_OnSharedElementsReadyListener = interface;//android.support.v4.app.SharedElementCallback$OnSharedElementsReadyListener
  JFileProvider = interface;//android.support.v4.content.FileProvider
  Jcontent_Loader = interface;//android.support.v4.content.Loader
  Jcontent_Loader_OnLoadCanceledListener = interface;//android.support.v4.content.Loader$OnLoadCanceledListener
  Jcontent_Loader_OnLoadCompleteListener = interface;//android.support.v4.content.Loader$OnLoadCompleteListener
  JPermissionChecker = interface;//android.support.v4.content.PermissionChecker
  JWakefulBroadcastReceiver = interface;//android.support.v4.content.WakefulBroadcastReceiver
  JWindowInsetsCompat = interface;//android.support.v4.view.WindowInsetsCompat

// ===== Interface declarations =====

  JContextCompatClass = interface(JObjectClass)
    ['{17CBF90F-B907-448F-9BFE-07ABAD5919D0}']
    {class} function checkSelfPermission(context: JContext; permission: JString): Integer; cdecl;
    {class} function createDeviceProtectedStorageContext(context: JContext): JContext; cdecl;
    {class} function getCodeCacheDir(context: JContext): JFile; cdecl;
    {class} function getColor(context: JContext; id: Integer): Integer; cdecl;
    {class} function getColorStateList(context: JContext; id: Integer): JColorStateList; cdecl;
    {class} function getDataDir(context: JContext): JFile; cdecl;
    {class} function getDrawable(context: JContext; id: Integer): JDrawable; cdecl;
    {class} function getExternalCacheDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function getExternalFilesDirs(context: JContext; type_: JString): TJavaObjectArray<JFile>; cdecl;
    {class} function getNoBackupFilesDir(context: JContext): JFile; cdecl;
    {class} function getObbDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function isDeviceProtectedStorage(context: JContext): Boolean; cdecl;
    {class} function startActivities(context: JContext; intents: TJavaObjectArray<JIntent>): Boolean; cdecl; overload;
    {class} function startActivities(context: JContext; intents: TJavaObjectArray<JIntent>; options: JBundle): Boolean; cdecl; overload;
    {class} procedure startActivity(context: JContext; intent: JIntent; options: JBundle); cdecl;
    {class} procedure startForegroundService(context: JContext; intent: JIntent); cdecl;
  end;

  [JavaSignature('android/support/v4/content/ContextCompat')]
  JContextCompat = interface(JObject)
    ['{DA319CC4-B7F8-4702-B969-3137BE6260C9}']
  end;
  TJContextCompat = class(TJavaGenericImport<JContextCompatClass, JContextCompat>) end;

  JActivityCompatClass = interface(JContextCompatClass)
    ['{AF83EB83-0A07-45E4-A615-3E9F50EEC123}']
    {class} procedure finishAffinity(activity: JActivity); cdecl;
    {class} procedure finishAfterTransition(activity: JActivity); cdecl;
    {class} function getReferrer(activity: JActivity): Jnet_Uri; cdecl;
    {class} function invalidateOptionsMenu(activity: JActivity): Boolean; cdecl;
    {class} procedure postponeEnterTransition(activity: JActivity); cdecl;
    {class} procedure requestPermissions(activity: JActivity; permissions: TJavaObjectArray<JString>; requestCode: Integer); cdecl;
    {class} procedure setEnterSharedElementCallback(activity: JActivity; callback: Japp_SharedElementCallback); cdecl;
    {class} procedure setExitSharedElementCallback(activity: JActivity; callback: Japp_SharedElementCallback); cdecl;
    {class} function shouldShowRequestPermissionRationale(activity: JActivity; permission: JString): Boolean; cdecl;
    {class} procedure startActivityForResult(activity: JActivity; intent: JIntent; requestCode: Integer; options: JBundle); cdecl;
    {class} procedure startIntentSenderForResult(activity: JActivity; intent: JIntentSender; requestCode: Integer; fillInIntent: JIntent; flagsMask: Integer; flagsValues: Integer; extraFlags: Integer; options: JBundle); cdecl;
    {class} procedure startPostponedEnterTransition(activity: JActivity); cdecl;
  end;

  [JavaSignature('android/support/v4/app/ActivityCompat')]
  JActivityCompat = interface(JContextCompat)
    ['{7108F0BF-5819-4668-9D20-7165FCB5A871}']
  end;
  TJActivityCompat = class(TJavaGenericImport<JActivityCompatClass, JActivityCompat>) end;

  Japp_FragmentClass = interface(JObjectClass)
    ['{E3089B9B-FD4C-463E-A7C9-BD9DE5C6D3F7}']
    {class} function init: Japp_Fragment; cdecl;
    {class} function instantiate(context: JContext; fname: JString): Japp_Fragment; cdecl; overload;
    {class} function instantiate(context: JContext; fname: JString; args: JBundle): Japp_Fragment; cdecl; overload;
  end;

  [JavaSignature('android/support/v4/app/Fragment')]
  Japp_Fragment = interface(JObject)
    ['{7C819B68-2FEC-4843-B2FB-B0CCFDA11642}']
    procedure dump(prefix: JString; fd: JFileDescriptor; writer: JPrintWriter; args: TJavaObjectArray<JString>); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getActivity: Japp_FragmentActivity; cdecl;
    function getAllowEnterTransitionOverlap: Boolean; cdecl;
    function getAllowReturnTransitionOverlap: Boolean; cdecl;
    function getArguments: JBundle; cdecl;
    function getChildFragmentManager: Japp_FragmentManager; cdecl;
    function getContext: JContext; cdecl;
    function getEnterTransition: JObject; cdecl;
    function getExitTransition: JObject; cdecl;
    function getFragmentManager: Japp_FragmentManager; cdecl;
    function getHost: JObject; cdecl;
    function getId: Integer; cdecl;
    function getLayoutInflater: JLayoutInflater; cdecl;
    function getLoaderManager: Japp_LoaderManager; cdecl;
    function getParentFragment: Japp_Fragment; cdecl;
    function getReenterTransition: JObject; cdecl;
    function getResources: JResources; cdecl;
    function getRetainInstance: Boolean; cdecl;
    function getReturnTransition: JObject; cdecl;
    function getSharedElementEnterTransition: JObject; cdecl;
    function getSharedElementReturnTransition: JObject; cdecl;
    function getString(resId: Integer): JString; cdecl; overload;
    function getTag: JString; cdecl;
    function getTargetFragment: Japp_Fragment; cdecl;
    function getTargetRequestCode: Integer; cdecl;
    function getText(resId: Integer): JCharSequence; cdecl;
    function getUserVisibleHint: Boolean; cdecl;
    function getView: JView; cdecl;
    function hashCode: Integer; cdecl;
    function isAdded: Boolean; cdecl;
    function isDetached: Boolean; cdecl;
    function isHidden: Boolean; cdecl;
    function isInLayout: Boolean; cdecl;
    function isRemoving: Boolean; cdecl;
    function isResumed: Boolean; cdecl;
    function isStateSaved: Boolean; cdecl;
    function isVisible: Boolean; cdecl;
    procedure onActivityCreated(savedInstanceState: JBundle); cdecl;
    procedure onActivityResult(requestCode: Integer; resultCode: Integer; data: JIntent); cdecl;
    procedure onAttach(context: JContext); cdecl; overload;
    procedure onAttach(activity: JActivity); cdecl; overload;//Deprecated
    procedure onAttachFragment(childFragment: Japp_Fragment); cdecl;
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl;
    function onContextItemSelected(item: JMenuItem): Boolean; cdecl;
    procedure onCreate(savedInstanceState: JBundle); cdecl;
    function onCreateAnimation(transit: Integer; enter: Boolean; nextAnim: Integer): JAnimation; cdecl;
    //function onCreateAnimator(transit: Integer; enter: Boolean; nextAnim: Integer): JAnimator; cdecl;
    procedure onCreateContextMenu(menu: JContextMenu; v: JView; menuInfo: JContextMenu_ContextMenuInfo); cdecl;
    procedure onCreateOptionsMenu(menu: JMenu; inflater: JMenuInflater); cdecl;
    function onCreateView(inflater: JLayoutInflater; container: JViewGroup; savedInstanceState: JBundle): JView; cdecl;
    procedure onDestroy; cdecl;
    procedure onDestroyOptionsMenu; cdecl;
    procedure onDestroyView; cdecl;
    procedure onDetach; cdecl;
    function onGetLayoutInflater(savedInstanceState: JBundle): JLayoutInflater; cdecl;
    procedure onHiddenChanged(hidden: Boolean); cdecl;
    procedure onInflate(context: JContext; attrs: JAttributeSet; savedInstanceState: JBundle); cdecl; overload;
    procedure onInflate(activity: JActivity; attrs: JAttributeSet; savedInstanceState: JBundle); cdecl; overload;//Deprecated
    procedure onLowMemory; cdecl;
    procedure onMultiWindowModeChanged(isInMultiWindowMode: Boolean); cdecl;
    function onOptionsItemSelected(item: JMenuItem): Boolean; cdecl;
    procedure onOptionsMenuClosed(menu: JMenu); cdecl;
    procedure onPause; cdecl;
    procedure onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean); cdecl;
    procedure onPrepareOptionsMenu(menu: JMenu); cdecl;
    procedure onRequestPermissionsResult(requestCode: Integer; permissions: TJavaObjectArray<JString>; grantResults: TJavaArray<Integer>); cdecl;
    procedure onResume; cdecl;
    procedure onSaveInstanceState(outState: JBundle); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onViewCreated(view: JView; savedInstanceState: JBundle); cdecl;
    procedure onViewStateRestored(savedInstanceState: JBundle); cdecl;
    procedure postponeEnterTransition; cdecl;
    procedure registerForContextMenu(view: JView); cdecl;
    procedure requestPermissions(permissions: TJavaObjectArray<JString>; requestCode: Integer); cdecl;
    procedure setAllowEnterTransitionOverlap(allow: Boolean); cdecl;
    procedure setAllowReturnTransitionOverlap(allow: Boolean); cdecl;
    procedure setArguments(args: JBundle); cdecl;
    procedure setEnterSharedElementCallback(callback: Japp_SharedElementCallback); cdecl;
    procedure setEnterTransition(transition: JObject); cdecl;
    procedure setExitSharedElementCallback(callback: Japp_SharedElementCallback); cdecl;
    procedure setExitTransition(transition: JObject); cdecl;
    procedure setHasOptionsMenu(hasMenu: Boolean); cdecl;
    procedure setInitialSavedState(state: Japp_Fragment_SavedState); cdecl;
    procedure setMenuVisibility(menuVisible: Boolean); cdecl;
    procedure setReenterTransition(transition: JObject); cdecl;
    procedure setRetainInstance(retain: Boolean); cdecl;
    procedure setReturnTransition(transition: JObject); cdecl;
    procedure setSharedElementEnterTransition(transition: JObject); cdecl;
    procedure setSharedElementReturnTransition(transition: JObject); cdecl;
    procedure setTargetFragment(fragment: Japp_Fragment; requestCode: Integer); cdecl;
    procedure setUserVisibleHint(isVisibleToUser: Boolean); cdecl;
    function shouldShowRequestPermissionRationale(permission: JString): Boolean; cdecl;
    procedure startActivity(intent: JIntent); cdecl; overload;
    procedure startActivity(intent: JIntent; options: JBundle); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; requestCode: Integer); cdecl; overload;
    procedure startActivityForResult(intent: JIntent; requestCode: Integer; options: JBundle); cdecl; overload;
    procedure startIntentSenderForResult(intent: JIntentSender; requestCode: Integer; fillInIntent: JIntent; flagsMask: Integer; flagsValues: Integer; extraFlags: Integer; options: JBundle); cdecl;
    procedure startPostponedEnterTransition; cdecl;
    function toString: JString; cdecl;
    procedure unregisterForContextMenu(view: JView); cdecl;
  end;
  TJapp_Fragment = class(TJavaGenericImport<Japp_FragmentClass, Japp_Fragment>) end;

  Japp_Fragment_SavedStateClass = interface(JObjectClass)
    ['{6AF46B16-0976-4759-AB40-599B705C4239}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/support/v4/app/Fragment$SavedState')]
  Japp_Fragment_SavedState = interface(JObject)
    ['{21C3F0C5-A8C9-444E-B4DF-8DBA6E797052}']
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJapp_Fragment_SavedState = class(TJavaGenericImport<Japp_Fragment_SavedStateClass, Japp_Fragment_SavedState>) end;

  Japp_FragmentActivityClass = interface(JObjectClass)
    ['{750FF7AB-0643-439B-A6C3-DB0EA3D1AFD7}']
    {class} function init: Japp_FragmentActivity; cdecl;
  end;

  [JavaSignature('android/support/v4/app/FragmentActivity')]
  Japp_FragmentActivity = interface(JObject)
    ['{150D107F-E0C3-49B0-BFC7-5A551379615C}']
    procedure dump(prefix: JString; fd: JFileDescriptor; writer: JPrintWriter; args: TJavaObjectArray<JString>); cdecl;
    function getLastCustomNonConfigurationInstance: JObject; cdecl;
    function getSupportFragmentManager: Japp_FragmentManager; cdecl;
    function getSupportLoaderManager: Japp_LoaderManager; cdecl;
    procedure onAttachFragment(fragment: Japp_Fragment); cdecl;
    procedure onBackPressed; cdecl;
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl;
    function onCreatePanelMenu(featureId: Integer; menu: JMenu): Boolean; cdecl;
    procedure onLowMemory; cdecl;
    function onMenuItemSelected(featureId: Integer; item: JMenuItem): Boolean; cdecl;
    procedure onMultiWindowModeChanged(isInMultiWindowMode: Boolean); cdecl;
    procedure onPanelClosed(featureId: Integer; menu: JMenu); cdecl;
    procedure onPictureInPictureModeChanged(isInPictureInPictureMode: Boolean); cdecl;
    function onPreparePanel(featureId: Integer; view: JView; menu: JMenu): Boolean; cdecl;
    procedure onRequestPermissionsResult(requestCode: Integer; permissions: TJavaObjectArray<JString>; grantResults: TJavaArray<Integer>); cdecl;
    function onRetainCustomNonConfigurationInstance: JObject; cdecl;
    function onRetainNonConfigurationInstance: JObject; cdecl;
    procedure onStateNotSaved; cdecl;
    procedure setEnterSharedElementCallback(callback: Japp_SharedElementCallback); cdecl;
    procedure setExitSharedElementCallback(listener: Japp_SharedElementCallback); cdecl;
    procedure startActivityForResult(intent: JIntent; requestCode: Integer); cdecl;
    procedure startActivityFromFragment(fragment: Japp_Fragment; intent: JIntent; requestCode: Integer); cdecl; overload;
    procedure startActivityFromFragment(fragment: Japp_Fragment; intent: JIntent; requestCode: Integer; options: JBundle); cdecl; overload;
    procedure startIntentSenderFromFragment(fragment: Japp_Fragment; intent: JIntentSender; requestCode: Integer; fillInIntent: JIntent; flagsMask: Integer; flagsValues: Integer; extraFlags: Integer; options: JBundle); cdecl;
    procedure supportFinishAfterTransition; cdecl;
    procedure supportInvalidateOptionsMenu; cdecl;//Deprecated
    procedure supportPostponeEnterTransition; cdecl;
    procedure supportStartPostponedEnterTransition; cdecl;
    procedure validateRequestPermissionsRequestCode(requestCode: Integer); cdecl;
  end;
  TJapp_FragmentActivity = class(TJavaGenericImport<Japp_FragmentActivityClass, Japp_FragmentActivity>) end;

  Japp_FragmentManagerClass = interface(JObjectClass)
    ['{B337A371-DC72-4A07-940A-4CA4F5FFB078}']
    {class} function _GetPOP_BACK_STACK_INCLUSIVE: Integer; cdecl;
    {class} function init: Japp_FragmentManager; cdecl;
    {class} procedure enableDebugLogging(enabled: Boolean); cdecl;
    {class} property POP_BACK_STACK_INCLUSIVE: Integer read _GetPOP_BACK_STACK_INCLUSIVE;
  end;

  [JavaSignature('android/support/v4/app/FragmentManager')]
  Japp_FragmentManager = interface(JObject)
    ['{19B65C80-D723-4014-9185-44BEBAD0947A}']
    procedure addOnBackStackChangedListener(listener: Japp_FragmentManager_OnBackStackChangedListener); cdecl;
    function beginTransaction: Japp_FragmentTransaction; cdecl;
    procedure dump(prefix: JString; fd: JFileDescriptor; writer: JPrintWriter; args: TJavaObjectArray<JString>); cdecl;
    function executePendingTransactions: Boolean; cdecl;
    function findFragmentById(id: Integer): Japp_Fragment; cdecl;
    function findFragmentByTag(tag: JString): Japp_Fragment; cdecl;
    function getBackStackEntryAt(index: Integer): Japp_FragmentManager_BackStackEntry; cdecl;
    function getBackStackEntryCount: Integer; cdecl;
    function getFragment(bundle: JBundle; key: JString): Japp_Fragment; cdecl;
    function getFragments: JList; cdecl;
    function getPrimaryNavigationFragment: Japp_Fragment; cdecl;
    function isDestroyed: Boolean; cdecl;
    function isStateSaved: Boolean; cdecl;
    procedure popBackStack; cdecl; overload;
    procedure popBackStack(name: JString; flags: Integer); cdecl; overload;
    procedure popBackStack(id: Integer; flags: Integer); cdecl; overload;
    function popBackStackImmediate: Boolean; cdecl; overload;
    function popBackStackImmediate(name: JString; flags: Integer): Boolean; cdecl; overload;
    function popBackStackImmediate(id: Integer; flags: Integer): Boolean; cdecl; overload;
    procedure putFragment(bundle: JBundle; key: JString; fragment: Japp_Fragment); cdecl;
    procedure registerFragmentLifecycleCallbacks(cb: Japp_FragmentManager_FragmentLifecycleCallbacks; recursive: Boolean); cdecl;
    procedure removeOnBackStackChangedListener(listener: Japp_FragmentManager_OnBackStackChangedListener); cdecl;
    function saveFragmentInstanceState(f: Japp_Fragment): Japp_Fragment_SavedState; cdecl;
    procedure unregisterFragmentLifecycleCallbacks(cb: Japp_FragmentManager_FragmentLifecycleCallbacks); cdecl;
  end;
  TJapp_FragmentManager = class(TJavaGenericImport<Japp_FragmentManagerClass, Japp_FragmentManager>) end;

  Japp_FragmentManager_BackStackEntryClass = interface(IJavaClass)
    ['{DEF82AEE-4F42-417B-81E1-14471A8BA6AE}']
  end;

  [JavaSignature('android/support/v4/app/FragmentManager$BackStackEntry')]
  Japp_FragmentManager_BackStackEntry = interface(IJavaInstance)
    ['{9DCCFF9D-2628-433C-A071-212F3C1DE5FA}']
    function getBreadCrumbShortTitle: JCharSequence; cdecl;
    function getBreadCrumbShortTitleRes: Integer; cdecl;
    function getBreadCrumbTitle: JCharSequence; cdecl;
    function getBreadCrumbTitleRes: Integer; cdecl;
    function getId: Integer; cdecl;
    function getName: JString; cdecl;
  end;
  TJapp_FragmentManager_BackStackEntry = class(TJavaGenericImport<Japp_FragmentManager_BackStackEntryClass, Japp_FragmentManager_BackStackEntry>) end;

  Japp_FragmentManager_FragmentLifecycleCallbacksClass = interface(JObjectClass)
    ['{8DF03887-3AE5-47C0-A97B-2EF9B7869B20}']
    {class} function init: Japp_FragmentManager_FragmentLifecycleCallbacks; cdecl;
  end;

  [JavaSignature('android/support/v4/app/FragmentManager$FragmentLifecycleCallbacks')]
  Japp_FragmentManager_FragmentLifecycleCallbacks = interface(JObject)
    ['{735F708B-427C-4C89-B5AD-536DDC38ED1A}']
    procedure onFragmentActivityCreated(fm: Japp_FragmentManager; f: Japp_Fragment; savedInstanceState: JBundle); cdecl;
    procedure onFragmentAttached(fm: Japp_FragmentManager; f: Japp_Fragment; context: JContext); cdecl;
    procedure onFragmentCreated(fm: Japp_FragmentManager; f: Japp_Fragment; savedInstanceState: JBundle); cdecl;
    procedure onFragmentDestroyed(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
    procedure onFragmentDetached(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
    procedure onFragmentPaused(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
    procedure onFragmentPreAttached(fm: Japp_FragmentManager; f: Japp_Fragment; context: JContext); cdecl;
    procedure onFragmentPreCreated(fm: Japp_FragmentManager; f: Japp_Fragment; savedInstanceState: JBundle); cdecl;
    procedure onFragmentResumed(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
    procedure onFragmentSaveInstanceState(fm: Japp_FragmentManager; f: Japp_Fragment; outState: JBundle); cdecl;
    procedure onFragmentStarted(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
    procedure onFragmentStopped(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
    procedure onFragmentViewCreated(fm: Japp_FragmentManager; f: Japp_Fragment; v: JView; savedInstanceState: JBundle); cdecl;
    procedure onFragmentViewDestroyed(fm: Japp_FragmentManager; f: Japp_Fragment); cdecl;
  end;
  TJapp_FragmentManager_FragmentLifecycleCallbacks = class(TJavaGenericImport<Japp_FragmentManager_FragmentLifecycleCallbacksClass, Japp_FragmentManager_FragmentLifecycleCallbacks>) end;

  Japp_FragmentManager_OnBackStackChangedListenerClass = interface(IJavaClass)
    ['{F60DD80B-2570-4ED5-A16C-E7EAC6B63F30}']
  end;

  [JavaSignature('android/support/v4/app/FragmentManager$OnBackStackChangedListener')]
  Japp_FragmentManager_OnBackStackChangedListener = interface(IJavaInstance)
    ['{63207AFF-576A-40BA-A51B-4A7C17CC1D45}']
    procedure onBackStackChanged; cdecl;
  end;
  TJapp_FragmentManager_OnBackStackChangedListener = class(TJavaGenericImport<Japp_FragmentManager_OnBackStackChangedListenerClass, Japp_FragmentManager_OnBackStackChangedListener>) end;

  Japp_FragmentTransactionClass = interface(JObjectClass)
    ['{ACA4981E-8459-4155-BF06-5D19957B6BE7}']
    {class} function _GetTRANSIT_ENTER_MASK: Integer; cdecl;
    {class} function _GetTRANSIT_EXIT_MASK: Integer; cdecl;
    {class} function _GetTRANSIT_FRAGMENT_CLOSE: Integer; cdecl;
    {class} function _GetTRANSIT_FRAGMENT_FADE: Integer; cdecl;
    {class} function _GetTRANSIT_FRAGMENT_OPEN: Integer; cdecl;
    {class} function _GetTRANSIT_NONE: Integer; cdecl;
    {class} function _GetTRANSIT_UNSET: Integer; cdecl;
    {class} function init: Japp_FragmentTransaction; cdecl;
    {class} property TRANSIT_ENTER_MASK: Integer read _GetTRANSIT_ENTER_MASK;
    {class} property TRANSIT_EXIT_MASK: Integer read _GetTRANSIT_EXIT_MASK;
    {class} property TRANSIT_FRAGMENT_CLOSE: Integer read _GetTRANSIT_FRAGMENT_CLOSE;
    {class} property TRANSIT_FRAGMENT_FADE: Integer read _GetTRANSIT_FRAGMENT_FADE;
    {class} property TRANSIT_FRAGMENT_OPEN: Integer read _GetTRANSIT_FRAGMENT_OPEN;
    {class} property TRANSIT_NONE: Integer read _GetTRANSIT_NONE;
    {class} property TRANSIT_UNSET: Integer read _GetTRANSIT_UNSET;
  end;

  [JavaSignature('android/support/v4/app/FragmentTransaction')]
  Japp_FragmentTransaction = interface(JObject)
    ['{9B1E0684-DC82-4C71-BC05-56C51FF65DD3}']
    function add(fragment: Japp_Fragment; tag: JString): Japp_FragmentTransaction; cdecl; overload;
    function add(containerViewId: Integer; fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl; overload;
    function add(containerViewId: Integer; fragment: Japp_Fragment; tag: JString): Japp_FragmentTransaction; cdecl; overload;
    function addSharedElement(sharedElement: JView; name: JString): Japp_FragmentTransaction; cdecl;
    function addToBackStack(name: JString): Japp_FragmentTransaction; cdecl;
    function attach(fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl;
    function commit: Integer; cdecl;
    function commitAllowingStateLoss: Integer; cdecl;
    procedure commitNow; cdecl;
    procedure commitNowAllowingStateLoss; cdecl;
    function detach(fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl;
    function disallowAddToBackStack: Japp_FragmentTransaction; cdecl;
    function hide(fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl;
    function isAddToBackStackAllowed: Boolean; cdecl;
    function isEmpty: Boolean; cdecl;
    function remove(fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl;
    function replace(containerViewId: Integer; fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl; overload;
    function replace(containerViewId: Integer; fragment: Japp_Fragment; tag: JString): Japp_FragmentTransaction; cdecl; overload;
    function runOnCommit(runnable: JRunnable): Japp_FragmentTransaction; cdecl;
    function setAllowOptimization(allowOptimization: Boolean): Japp_FragmentTransaction; cdecl;//Deprecated
    function setBreadCrumbShortTitle(res: Integer): Japp_FragmentTransaction; cdecl; overload;
    function setBreadCrumbShortTitle(text: JCharSequence): Japp_FragmentTransaction; cdecl; overload;
    function setBreadCrumbTitle(res: Integer): Japp_FragmentTransaction; cdecl; overload;
    function setBreadCrumbTitle(text: JCharSequence): Japp_FragmentTransaction; cdecl; overload;
    function setCustomAnimations(enter: Integer; exit: Integer): Japp_FragmentTransaction; cdecl; overload;
    function setCustomAnimations(enter: Integer; exit: Integer; popEnter: Integer; popExit: Integer): Japp_FragmentTransaction; cdecl; overload;
    function setPrimaryNavigationFragment(fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl;
    function setReorderingAllowed(reorderingAllowed: Boolean): Japp_FragmentTransaction; cdecl;
    function setTransition(transit: Integer): Japp_FragmentTransaction; cdecl;
    function setTransitionStyle(styleRes: Integer): Japp_FragmentTransaction; cdecl;
    function show(fragment: Japp_Fragment): Japp_FragmentTransaction; cdecl;
  end;
  TJapp_FragmentTransaction = class(TJavaGenericImport<Japp_FragmentTransactionClass, Japp_FragmentTransaction>) end;

  JJobIntentServiceClass = interface(JServiceClass)
    ['{FE42203A-1313-4AED-98A7-973CD56FB4A9}']
    {class} function init: JJobIntentService; cdecl;
    {class} procedure enqueueWork(context: JContext; cls: Jlang_Class; jobId: Integer; work: JIntent); cdecl;
  end;

  [JavaSignature('android/support/v4/app/JobIntentService')]
  JJobIntentService = interface(JService)
    ['{5DA74544-B80C-4832-8171-25E7FC726C4E}']
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onCreate; cdecl;
    procedure onDestroy; cdecl;
    function onStartCommand(intent: JIntent; flags: Integer; startId: Integer): Integer; cdecl;
    function onStopCurrentWork: Boolean; cdecl;
  end;
  TJJobIntentService = class(TJavaGenericImport<JJobIntentServiceClass, JJobIntentService>) end;

  Japp_LoaderManagerClass = interface(JObjectClass)
    ['{479A03D5-D5F3-4084-A8EC-241CEA0F0AFB}']
    {class} function init: Japp_LoaderManager; cdecl;
    {class} procedure enableDebugLogging(enabled: Boolean); cdecl;
  end;

  [JavaSignature('android/support/v4/app/LoaderManager')]
  Japp_LoaderManager = interface(JObject)
    ['{E13F6C45-41F3-4A16-9B2D-6C3BFF45FDE5}']
    procedure destroyLoader(id: Integer); cdecl;
    procedure dump(prefix: JString; fd: JFileDescriptor; writer: JPrintWriter; args: TJavaObjectArray<JString>); cdecl;
    function getLoader(id: Integer): Jcontent_Loader; cdecl;
    function hasRunningLoaders: Boolean; cdecl;
    function initLoader(id: Integer; args: JBundle; callback: Japp_LoaderManager_LoaderCallbacks): Jcontent_Loader; cdecl;
    function restartLoader(id: Integer; args: JBundle; callback: Japp_LoaderManager_LoaderCallbacks): Jcontent_Loader; cdecl;
  end;
  TJapp_LoaderManager = class(TJavaGenericImport<Japp_LoaderManagerClass, Japp_LoaderManager>) end;

  Japp_LoaderManager_LoaderCallbacksClass = interface(IJavaClass)
    ['{49F864F7-F0C4-4990-AE14-1B20E356F92C}']
  end;

  [JavaSignature('android/support/v4/app/LoaderManager$LoaderCallbacks')]
  Japp_LoaderManager_LoaderCallbacks = interface(IJavaInstance)
    ['{FD34E913-C4A1-4D1D-B6B8-421D9C3D9770}']
    function onCreateLoader(id: Integer; args: JBundle): Jcontent_Loader; cdecl;
    procedure onLoadFinished(loader: Jcontent_Loader; data: JObject); cdecl;
    procedure onLoaderReset(loader: Jcontent_Loader); cdecl;
  end;
  TJapp_LoaderManager_LoaderCallbacks = class(TJavaGenericImport<Japp_LoaderManager_LoaderCallbacksClass, Japp_LoaderManager_LoaderCallbacks>) end;

  JNotificationCompat_ActionClass = interface(JObjectClass)
    ['{9A2975B1-7BCA-4120-BAE9-A99F23F48159}']
    {class} function init(icon: Integer; title: JCharSequence; intent: JPendingIntent): JNotificationCompat_Action; cdecl;
  end;

  [JavaSignature('android/support/v4/app/NotificationCompat$Action')]
  JNotificationCompat_Action = interface(JObject)
    ['{2C05FC19-2838-47F8-97B0-44836566B08D}']
    function _GetactionIntent: JPendingIntent; cdecl;
    procedure _SetactionIntent(Value: JPendingIntent); cdecl;
    function _Geticon: Integer; cdecl;
    procedure _Seticon(Value: Integer); cdecl;
    function _Gettitle: JCharSequence; cdecl;
    procedure _Settitle(Value: JCharSequence); cdecl;
    function getActionIntent: JPendingIntent; cdecl;
    function getAllowGeneratedReplies: Boolean; cdecl;
    function getDataOnlyRemoteInputs: TJavaObjectArray<Japp_RemoteInput>; cdecl;
    function getExtras: JBundle; cdecl;
    function getIcon: Integer; cdecl;
    function getRemoteInputs: TJavaObjectArray<Japp_RemoteInput>; cdecl;
    function getTitle: JCharSequence; cdecl;
    property actionIntent: JPendingIntent read _GetactionIntent write _SetactionIntent;
    property icon: Integer read _Geticon write _Seticon;
    property title: JCharSequence read _Gettitle write _Settitle;
  end;
  TJNotificationCompat_Action = class(TJavaGenericImport<JNotificationCompat_ActionClass, JNotificationCompat_Action>) end;

  JNotificationCompat_BuilderClass = interface(JObjectClass)
    ['{6EC74C2C-EBCC-4A55-98B6-6DD36DE3BA8C}']
    {class} function init(context: JContext; channelId: JString): JNotificationCompat_Builder; cdecl; overload;
    {class} function init(context: JContext): JNotificationCompat_Builder; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/support/v4/app/NotificationCompat$Builder')]
  JNotificationCompat_Builder = interface(JObject)
    ['{7DE9C385-1C34-413C-9E85-D8FA90028065}']
    function _GetmPeople: JArrayList; cdecl;
    procedure _SetmPeople(Value: JArrayList); cdecl;
    function addAction(icon: Integer; title: JCharSequence; intent: JPendingIntent): JNotificationCompat_Builder; cdecl; overload;
    function addAction(action: JNotificationCompat_Action): JNotificationCompat_Builder; cdecl; overload;
    function addExtras(extras: JBundle): JNotificationCompat_Builder; cdecl;
    function addPerson(uri: JString): JNotificationCompat_Builder; cdecl;
    function build: JNotification; cdecl;
    function extend(extender: JNotificationCompat_Extender): JNotificationCompat_Builder; cdecl;
    function getExtras: JBundle; cdecl;
    function getNotification: JNotification; cdecl;//Deprecated
    function setAutoCancel(autoCancel: Boolean): JNotificationCompat_Builder; cdecl;
    function setBadgeIconType(icon: Integer): JNotificationCompat_Builder; cdecl;
    function setCategory(category: JString): JNotificationCompat_Builder; cdecl;
    function setChannel(channelId: JString): JNotificationCompat_Builder; cdecl;//Deprecated
    function setChannelId(channelId: JString): JNotificationCompat_Builder; cdecl;
    function setColor(argb: Integer): JNotificationCompat_Builder; cdecl;
    function setColorized(colorize: Boolean): JNotificationCompat_Builder; cdecl;
    function setContent(views: JRemoteViews): JNotificationCompat_Builder; cdecl;
    function setContentInfo(info: JCharSequence): JNotificationCompat_Builder; cdecl;
    function setContentIntent(intent: JPendingIntent): JNotificationCompat_Builder; cdecl;
    function setContentText(text: JCharSequence): JNotificationCompat_Builder; cdecl;
    function setContentTitle(title: JCharSequence): JNotificationCompat_Builder; cdecl;
    function setCustomBigContentView(contentView: JRemoteViews): JNotificationCompat_Builder; cdecl;
    function setCustomContentView(contentView: JRemoteViews): JNotificationCompat_Builder; cdecl;
    function setCustomHeadsUpContentView(contentView: JRemoteViews): JNotificationCompat_Builder; cdecl;
    function setDefaults(defaults: Integer): JNotificationCompat_Builder; cdecl;
    function setDeleteIntent(intent: JPendingIntent): JNotificationCompat_Builder; cdecl;
    function setExtras(extras: JBundle): JNotificationCompat_Builder; cdecl;
    function setFullScreenIntent(intent: JPendingIntent; highPriority: Boolean): JNotificationCompat_Builder; cdecl;
    function setGroup(groupKey: JString): JNotificationCompat_Builder; cdecl;
    function setGroupAlertBehavior(groupAlertBehavior: Integer): JNotificationCompat_Builder; cdecl;
    function setGroupSummary(isGroupSummary: Boolean): JNotificationCompat_Builder; cdecl;
    function setLargeIcon(icon: JBitmap): JNotificationCompat_Builder; cdecl;
    function setLights(argb: Integer; onMs: Integer; offMs: Integer): JNotificationCompat_Builder; cdecl;
    function setLocalOnly(b: Boolean): JNotificationCompat_Builder; cdecl;
    function setNumber(number: Integer): JNotificationCompat_Builder; cdecl;
    function setOngoing(ongoing: Boolean): JNotificationCompat_Builder; cdecl;
    function setOnlyAlertOnce(onlyAlertOnce: Boolean): JNotificationCompat_Builder; cdecl;
    function setPriority(pri: Integer): JNotificationCompat_Builder; cdecl;
    function setProgress(max: Integer; progress: Integer; indeterminate: Boolean): JNotificationCompat_Builder; cdecl;
    function setPublicVersion(n: JNotification): JNotificationCompat_Builder; cdecl;
    function setRemoteInputHistory(text: TJavaObjectArray<JCharSequence>): JNotificationCompat_Builder; cdecl;
    function setShortcutId(shortcutId: JString): JNotificationCompat_Builder; cdecl;
    function setShowWhen(show: Boolean): JNotificationCompat_Builder; cdecl;
    function setSmallIcon(icon: Integer): JNotificationCompat_Builder; cdecl; overload;
    function setSmallIcon(icon: Integer; level: Integer): JNotificationCompat_Builder; cdecl; overload;
    function setSortKey(sortKey: JString): JNotificationCompat_Builder; cdecl;
    function setSound(sound: Jnet_Uri): JNotificationCompat_Builder; cdecl; overload;
    function setSound(sound: Jnet_Uri; streamType: Integer): JNotificationCompat_Builder; cdecl; overload;
    function setStyle(style: JNotificationCompat_Style): JNotificationCompat_Builder; cdecl;
    function setSubText(text: JCharSequence): JNotificationCompat_Builder; cdecl;
    function setTicker(tickerText: JCharSequence): JNotificationCompat_Builder; cdecl; overload;
    function setTicker(tickerText: JCharSequence; views: JRemoteViews): JNotificationCompat_Builder; cdecl; overload;
    function setTimeout(durationMs: Int64): JNotificationCompat_Builder; cdecl;//Deprecated
    function setTimeoutAfter(durationMs: Int64): JNotificationCompat_Builder; cdecl;
    function setUsesChronometer(b: Boolean): JNotificationCompat_Builder; cdecl;
    function setVibrate(pattern: TJavaArray<Int64>): JNotificationCompat_Builder; cdecl;
    function setVisibility(visibility: Integer): JNotificationCompat_Builder; cdecl;
    function setWhen(when: Int64): JNotificationCompat_Builder; cdecl;
    property mPeople: JArrayList read _GetmPeople write _SetmPeople;
  end;
  TJNotificationCompat_Builder = class(TJavaGenericImport<JNotificationCompat_BuilderClass, JNotificationCompat_Builder>) end;

  JNotificationCompat_ExtenderClass = interface(IJavaClass)
    ['{FE44EF36-1DB6-47B7-AA66-5F91FE5134C5}']
  end;

  [JavaSignature('android/support/v4/app/NotificationCompat$Extender')]
  JNotificationCompat_Extender = interface(IJavaInstance)
    ['{C96F5828-B7E4-48EC-9A8C-8B8518A347BB}']
    function extend(builder: JNotificationCompat_Builder): JNotificationCompat_Builder; cdecl;
  end;
  TJNotificationCompat_Extender = class(TJavaGenericImport<JNotificationCompat_ExtenderClass, JNotificationCompat_Extender>) end;

  JNotificationCompat_StyleClass = interface(JObjectClass)
    ['{A76478B0-8BCB-4AFA-AFCD-CB0460219CDA}']
    {class} function init: JNotificationCompat_Style; cdecl;
  end;

  [JavaSignature('android/support/v4/app/NotificationCompat$Style')]
  JNotificationCompat_Style = interface(JObject)
    ['{5C782C73-8C4B-4ADA-994D-4293E0D2D282}']
    function build: JNotification; cdecl;
    procedure setBuilder(builder: JNotificationCompat_Builder); cdecl;
  end;
  TJNotificationCompat_Style = class(TJavaGenericImport<JNotificationCompat_StyleClass, JNotificationCompat_Style>) end;

  Japp_RemoteInputClass = interface(JObjectClass)
    ['{2D5C5EF8-294E-4B0F-A648-9D1EA5BED891}']
    {class} function _GetEXTRA_RESULTS_DATA: JString; cdecl;
    {class} function _GetRESULTS_CLIP_LABEL: JString; cdecl;
    {class} procedure addDataResultToIntent(remoteInput: Japp_RemoteInput; intent: JIntent; results: JMap); cdecl;
    {class} procedure addResultsToIntent(remoteInputs: TJavaObjectArray<Japp_RemoteInput>; intent: JIntent; results: JBundle); cdecl;
    {class} function getDataResultsFromIntent(intent: JIntent; remoteInputResultKey: JString): JMap; cdecl;
    {class} function getResultsFromIntent(intent: JIntent): JBundle; cdecl;
    {class} property EXTRA_RESULTS_DATA: JString read _GetEXTRA_RESULTS_DATA;
    {class} property RESULTS_CLIP_LABEL: JString read _GetRESULTS_CLIP_LABEL;
  end;

  [JavaSignature('android/support/v4/app/RemoteInput')]
  Japp_RemoteInput = interface(JObject)
    ['{728FBA2D-C0B9-45AC-A5DD-24B89188687E}']
    function getAllowFreeFormInput: Boolean; cdecl;
    function getAllowedDataTypes: JSet; cdecl;
    function getChoices: TJavaObjectArray<JCharSequence>; cdecl;
    function getExtras: JBundle; cdecl;
    function getLabel: JCharSequence; cdecl;
    function getResultKey: JString; cdecl;
    function isDataOnly: Boolean; cdecl;
  end;
  TJapp_RemoteInput = class(TJavaGenericImport<Japp_RemoteInputClass, Japp_RemoteInput>) end;

  Japp_SharedElementCallbackClass = interface(JObjectClass)
    ['{4E37BD6A-6494-425B-9528-DD56C6E4EB12}']
    {class} function init: Japp_SharedElementCallback; cdecl;
  end;

  [JavaSignature('android/support/v4/app/SharedElementCallback')]
  Japp_SharedElementCallback = interface(JObject)
    ['{BA8B8350-C929-499D-8B13-5E7FDBD6AF92}']
    function onCaptureSharedElementSnapshot(sharedElement: JView; viewToGlobalMatrix: JMatrix; screenBounds: JRectF): JParcelable; cdecl;
    function onCreateSnapshotView(context: JContext; snapshot: JParcelable): JView; cdecl;
    procedure onMapSharedElements(names: JList; sharedElements: JMap); cdecl;
    procedure onRejectSharedElements(rejectedSharedElements: JList); cdecl;
    procedure onSharedElementEnd(sharedElementNames: JList; sharedElements: JList; sharedElementSnapshots: JList); cdecl;
    procedure onSharedElementStart(sharedElementNames: JList; sharedElements: JList; sharedElementSnapshots: JList); cdecl;
    procedure onSharedElementsArrived(sharedElementNames: JList; sharedElements: JList; listener: Japp_SharedElementCallback_OnSharedElementsReadyListener); cdecl;
  end;
  TJapp_SharedElementCallback = class(TJavaGenericImport<Japp_SharedElementCallbackClass, Japp_SharedElementCallback>) end;

  Japp_SharedElementCallback_OnSharedElementsReadyListenerClass = interface(IJavaClass)
    ['{5AB9395E-A8B1-4932-A92B-4BD7AEF39E11}']
  end;

  [JavaSignature('android/support/v4/app/SharedElementCallback$OnSharedElementsReadyListener')]
  Japp_SharedElementCallback_OnSharedElementsReadyListener = interface(IJavaInstance)
    ['{89CD4036-B7EA-43B6-97E9-259FE977C0C4}']
    procedure onSharedElementsReady; cdecl;
  end;
  TJapp_SharedElementCallback_OnSharedElementsReadyListener = class(TJavaGenericImport<Japp_SharedElementCallback_OnSharedElementsReadyListenerClass, Japp_SharedElementCallback_OnSharedElementsReadyListener>) end;

  JFileProviderClass = interface(JContentProviderClass)
    ['{33A87969-5731-4791-90F6-3AD22F2BB822}']
    {class} function init: JFileProvider; cdecl;
    {class} function getUriForFile(context: JContext; authority: JString; file_: JFile): Jnet_Uri; cdecl;
  end;

  [JavaSignature('android/support/v4/content/FileProvider')]
  JFileProvider = interface(JContentProvider)
    ['{12F5DD38-A3CE-4D2E-9F68-24933C9D221B}']
    procedure attachInfo(context: JContext; info: JProviderInfo); cdecl;
    function delete(uri: Jnet_Uri; selection: JString; selectionArgs: TJavaObjectArray<JString>): Integer; cdecl;
    function getType(uri: Jnet_Uri): JString; cdecl;
    function insert(uri: Jnet_Uri; values: JContentValues): Jnet_Uri; cdecl;
    function onCreate: Boolean; cdecl;
    function openFile(uri: Jnet_Uri; mode: JString): JParcelFileDescriptor; cdecl;
    function query(uri: Jnet_Uri; projection: TJavaObjectArray<JString>; selection: JString; selectionArgs: TJavaObjectArray<JString>; sortOrder: JString): JCursor; cdecl;
    function update(uri: Jnet_Uri; values: JContentValues; selection: JString; selectionArgs: TJavaObjectArray<JString>): Integer; cdecl;
  end;
  TJFileProvider = class(TJavaGenericImport<JFileProviderClass, JFileProvider>) end;

  Jcontent_LoaderClass = interface(JObjectClass)
    ['{75230956-00B9-43CD-8C60-ADA295F7E7F3}']
    {class} function init(context: JContext): Jcontent_Loader; cdecl;
  end;

  [JavaSignature('android/support/v4/content/Loader')]
  Jcontent_Loader = interface(JObject)
    ['{B43C247C-8BDF-497A-BAC1-1E900F51A47D}']
    procedure abandon; cdecl;
    function cancelLoad: Boolean; cdecl;
    procedure commitContentChanged; cdecl;
    function dataToString(data: JObject): JString; cdecl;
    procedure deliverCancellation; cdecl;
    procedure deliverResult(data: JObject); cdecl;
    procedure dump(prefix: JString; fd: JFileDescriptor; writer: JPrintWriter; args: TJavaObjectArray<JString>); cdecl;
    procedure forceLoad; cdecl;
    function getContext: JContext; cdecl;
    function getId: Integer; cdecl;
    function isAbandoned: Boolean; cdecl;
    function isReset: Boolean; cdecl;
    function isStarted: Boolean; cdecl;
    procedure onContentChanged; cdecl;
    procedure registerListener(id: Integer; listener: Jcontent_Loader_OnLoadCompleteListener); cdecl;
    procedure registerOnLoadCanceledListener(listener: Jcontent_Loader_OnLoadCanceledListener); cdecl;
    procedure reset; cdecl;
    procedure rollbackContentChanged; cdecl;
    procedure startLoading; cdecl;
    procedure stopLoading; cdecl;
    function takeContentChanged: Boolean; cdecl;
    function toString: JString; cdecl;
    procedure unregisterListener(listener: Jcontent_Loader_OnLoadCompleteListener); cdecl;
    procedure unregisterOnLoadCanceledListener(listener: Jcontent_Loader_OnLoadCanceledListener); cdecl;
  end;
  TJcontent_Loader = class(TJavaGenericImport<Jcontent_LoaderClass, Jcontent_Loader>) end;

  Jcontent_Loader_OnLoadCanceledListenerClass = interface(IJavaClass)
    ['{A92A64DD-99A8-4582-9291-38BB8CDF7500}']
  end;

  [JavaSignature('android/support/v4/content/Loader$OnLoadCanceledListener')]
  Jcontent_Loader_OnLoadCanceledListener = interface(IJavaInstance)
    ['{6B2BDFD1-1384-46BF-B895-0B8EF000D0ED}']
    procedure onLoadCanceled(loader: Jcontent_Loader); cdecl;
  end;
  TJcontent_Loader_OnLoadCanceledListener = class(TJavaGenericImport<Jcontent_Loader_OnLoadCanceledListenerClass, Jcontent_Loader_OnLoadCanceledListener>) end;

  Jcontent_Loader_OnLoadCompleteListenerClass = interface(IJavaClass)
    ['{AD54E07C-4FD0-4274-9A2D-A17F9D57FF5C}']
  end;

  [JavaSignature('android/support/v4/content/Loader$OnLoadCompleteListener')]
  Jcontent_Loader_OnLoadCompleteListener = interface(IJavaInstance)
    ['{C9E1065D-CEC5-4C51-BBFB-CEE633EADB45}']
    procedure onLoadComplete(loader: Jcontent_Loader; data: JObject); cdecl;
  end;
  TJcontent_Loader_OnLoadCompleteListener = class(TJavaGenericImport<Jcontent_Loader_OnLoadCompleteListenerClass, Jcontent_Loader_OnLoadCompleteListener>) end;

  JPermissionCheckerClass = interface(JObjectClass)
    ['{A1030BEA-760D-43D3-B303-1107F333DE59}']
    {class} function _GetPERMISSION_DENIED: Integer; cdecl;
    {class} function _GetPERMISSION_DENIED_APP_OP: Integer; cdecl;
    {class} function _GetPERMISSION_GRANTED: Integer; cdecl;
    {class} function checkCallingOrSelfPermission(context: JContext; permission: JString): Integer; cdecl;
    {class} function checkCallingPermission(context: JContext; permission: JString; packageName: JString): Integer; cdecl;
    {class} function checkPermission(context: JContext; permission: JString; pid: Integer; uid: Integer; packageName: JString): Integer; cdecl;
    {class} function checkSelfPermission(context: JContext; permission: JString): Integer; cdecl;
    {class} property PERMISSION_DENIED: Integer read _GetPERMISSION_DENIED;
    {class} property PERMISSION_DENIED_APP_OP: Integer read _GetPERMISSION_DENIED_APP_OP;
    {class} property PERMISSION_GRANTED: Integer read _GetPERMISSION_GRANTED;
  end;

  [JavaSignature('android/support/v4/content/PermissionChecker')]
  JPermissionChecker = interface(JObject)
    ['{153463C8-6544-4775-8641-B5E90044A3D9}']
  end;
  TJPermissionChecker = class(TJavaGenericImport<JPermissionCheckerClass, JPermissionChecker>) end;

  JWakefulBroadcastReceiverClass = interface(JBroadcastReceiverClass)
    ['{DECFDD83-E88E-449A-8198-F539F905B2A8}']
    {class} function init: JWakefulBroadcastReceiver; cdecl;
    {class} function completeWakefulIntent(intent: JIntent): Boolean; cdecl;
    {class} function startWakefulService(context: JContext; intent: JIntent): JComponentName; cdecl;
  end;

  [JavaSignature('android/support/v4/content/WakefulBroadcastReceiver')]
  JWakefulBroadcastReceiver = interface(JBroadcastReceiver)
    ['{2B7CD6F2-EB86-4F3C-9BB7-804797C60B05}']
  end;
  TJWakefulBroadcastReceiver = class(TJavaGenericImport<JWakefulBroadcastReceiverClass, JWakefulBroadcastReceiver>) end;

  JWindowInsetsCompatClass = interface(JObjectClass)
    ['{4B7521B6-AD61-46FE-9921-4DF794FD5913}']
    {class} function init(src: JWindowInsetsCompat): JWindowInsetsCompat; cdecl;
  end;

  [JavaSignature('android/support/v4/view/WindowInsetsCompat')]
  JWindowInsetsCompat = interface(JObject)
    ['{E7655533-41AA-41E5-A2EF-3BA60A800EB7}']
    function consumeStableInsets: JWindowInsetsCompat; cdecl;
    function consumeSystemWindowInsets: JWindowInsetsCompat; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function getStableInsetBottom: Integer; cdecl;
    function getStableInsetLeft: Integer; cdecl;
    function getStableInsetRight: Integer; cdecl;
    function getStableInsetTop: Integer; cdecl;
    function getSystemWindowInsetBottom: Integer; cdecl;
    function getSystemWindowInsetLeft: Integer; cdecl;
    function getSystemWindowInsetRight: Integer; cdecl;
    function getSystemWindowInsetTop: Integer; cdecl;
    function hasInsets: Boolean; cdecl;
    function hasStableInsets: Boolean; cdecl;
    function hasSystemWindowInsets: Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function isConsumed: Boolean; cdecl;
    function isRound: Boolean; cdecl;
    function replaceSystemWindowInsets(left: Integer; top: Integer; right: Integer; bottom: Integer): JWindowInsetsCompat; cdecl; overload;
    function replaceSystemWindowInsets(systemWindowInsets: JRect): JWindowInsetsCompat; cdecl; overload;
  end;
  TJWindowInsetsCompat = class(TJavaGenericImport<JWindowInsetsCompatClass, JWindowInsetsCompat>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Support.JContextCompat', TypeInfo(Androidapi.JNI.Support.JContextCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JActivityCompat', TypeInfo(Androidapi.JNI.Support.JActivityCompat));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_Fragment', TypeInfo(Androidapi.JNI.Support.Japp_Fragment));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_Fragment_SavedState', TypeInfo(Androidapi.JNI.Support.Japp_Fragment_SavedState));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_FragmentActivity', TypeInfo(Androidapi.JNI.Support.Japp_FragmentActivity));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_FragmentManager', TypeInfo(Androidapi.JNI.Support.Japp_FragmentManager));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_FragmentManager_BackStackEntry', TypeInfo(Androidapi.JNI.Support.Japp_FragmentManager_BackStackEntry));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_FragmentManager_FragmentLifecycleCallbacks', TypeInfo(Androidapi.JNI.Support.Japp_FragmentManager_FragmentLifecycleCallbacks));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_FragmentManager_OnBackStackChangedListener', TypeInfo(Androidapi.JNI.Support.Japp_FragmentManager_OnBackStackChangedListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_FragmentTransaction', TypeInfo(Androidapi.JNI.Support.Japp_FragmentTransaction));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JJobIntentService', TypeInfo(Androidapi.JNI.Support.JJobIntentService));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_LoaderManager', TypeInfo(Androidapi.JNI.Support.Japp_LoaderManager));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_LoaderManager_LoaderCallbacks', TypeInfo(Androidapi.JNI.Support.Japp_LoaderManager_LoaderCallbacks));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationCompat_Action', TypeInfo(Androidapi.JNI.Support.JNotificationCompat_Action));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationCompat_Builder', TypeInfo(Androidapi.JNI.Support.JNotificationCompat_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationCompat_Extender', TypeInfo(Androidapi.JNI.Support.JNotificationCompat_Extender));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JNotificationCompat_Style', TypeInfo(Androidapi.JNI.Support.JNotificationCompat_Style));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_RemoteInput', TypeInfo(Androidapi.JNI.Support.Japp_RemoteInput));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_SharedElementCallback', TypeInfo(Androidapi.JNI.Support.Japp_SharedElementCallback));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Japp_SharedElementCallback_OnSharedElementsReadyListener', TypeInfo(Androidapi.JNI.Support.Japp_SharedElementCallback_OnSharedElementsReadyListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JFileProvider', TypeInfo(Androidapi.JNI.Support.JFileProvider));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_Loader', TypeInfo(Androidapi.JNI.Support.Jcontent_Loader));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_Loader_OnLoadCanceledListener', TypeInfo(Androidapi.JNI.Support.Jcontent_Loader_OnLoadCanceledListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.Jcontent_Loader_OnLoadCompleteListener', TypeInfo(Androidapi.JNI.Support.Jcontent_Loader_OnLoadCompleteListener));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JPermissionChecker', TypeInfo(Androidapi.JNI.Support.JPermissionChecker));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JWakefulBroadcastReceiver', TypeInfo(Androidapi.JNI.Support.JWakefulBroadcastReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Support.JWindowInsetsCompat', TypeInfo(Androidapi.JNI.Support.JWindowInsetsCompat));
end;

initialization
  RegisterTypes;
end.


