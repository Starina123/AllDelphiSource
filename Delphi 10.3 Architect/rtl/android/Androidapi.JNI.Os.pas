{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Androidapi.JNI.Os;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JManifest = interface;//android.Manifest
  JManifest_permission = interface;//android.Manifest$permission
  JManifest_permission_group = interface;//android.Manifest$permission_group
  JBaseBundle = interface;//android.os.BaseBundle
  JBinder = interface;//android.os.Binder
  JBuild = interface;//android.os.Build
  JBuild_VERSION = interface;//android.os.Build$VERSION
  JBuild_VERSION_CODES = interface;//android.os.Build$VERSION_CODES
  JBundle = interface;//android.os.Bundle
  JCancellationSignal = interface;//android.os.CancellationSignal
  JCancellationSignal_OnCancelListener = interface;//android.os.CancellationSignal$OnCancelListener
  JDebug_MemoryInfo = interface;//android.os.Debug$MemoryInfo
  JHandler = interface;//android.os.Handler
  JHandler_Callback = interface;//android.os.Handler$Callback
  JIBinder = interface;//android.os.IBinder
  JIBinder_DeathRecipient = interface;//android.os.IBinder$DeathRecipient
  JIInterface = interface;//android.os.IInterface
  JLocaleList = interface;//android.os.LocaleList
  JLooper = interface;//android.os.Looper
  JMessage = interface;//android.os.Message
  JMessageQueue = interface;//android.os.MessageQueue
  JMessageQueue_IdleHandler = interface;//android.os.MessageQueue$IdleHandler
  JMessageQueue_OnFileDescriptorEventListener = interface;//android.os.MessageQueue$OnFileDescriptorEventListener
  JMessenger = interface;//android.os.Messenger
  JParcel = interface;//android.os.Parcel
  JParcelFileDescriptor = interface;//android.os.ParcelFileDescriptor
  JParcelFileDescriptor_AutoCloseInputStream = interface;//android.os.ParcelFileDescriptor$AutoCloseInputStream
  JParcelFileDescriptor_AutoCloseOutputStream = interface;//android.os.ParcelFileDescriptor$AutoCloseOutputStream
  JParcelFileDescriptor_OnCloseListener = interface;//android.os.ParcelFileDescriptor$OnCloseListener
  JParcelUuid = interface;//android.os.ParcelUuid
  JParcelable = interface;//android.os.Parcelable
  JParcelable_Creator = interface;//android.os.Parcelable$Creator
  JParcelable_ClassLoaderCreator = interface;//android.os.Parcelable$ClassLoaderCreator
  JPatternMatcher = interface;//android.os.PatternMatcher
  JPersistableBundle = interface;//android.os.PersistableBundle
  JPowerManager = interface;//android.os.PowerManager
  JPowerManager_WakeLock = interface;//android.os.PowerManager$WakeLock
  JRemoteException = interface;//android.os.RemoteException
  JResultReceiver = interface;//android.os.ResultReceiver
  JUserHandle = interface;//android.os.UserHandle
  JVibrationEffect = interface;//android.os.VibrationEffect
  JVibrator = interface;//android.os.Vibrator
  JWorkSource = interface;//android.os.WorkSource
  JOnObbStateChangeListener = interface;//android.os.storage.OnObbStateChangeListener

// ===== Interface declarations =====

  JManifestClass = interface(JObjectClass)
    ['{40E146F0-8571-43FF-86AB-1305BFCE94AE}']
    {class} function init: JManifest; cdecl;
  end;

  [JavaSignature('android/Manifest')]
  JManifest = interface(JObject)
    ['{177627AA-0D00-4BC4-A8A7-9EC6C8157E86}']
  end;
  TJManifest = class(TJavaGenericImport<JManifestClass, JManifest>) end;

  JManifest_permissionClass = interface(JObjectClass)
    ['{7138C56B-F5A7-4319-8D1D-0035C5F4E01A}']
    {class} function _GetACCESS_CHECKIN_PROPERTIES: JString; cdecl;
    {class} function _GetACCESS_COARSE_LOCATION: JString; cdecl;
    {class} function _GetACCESS_FINE_LOCATION: JString; cdecl;
    {class} function _GetACCESS_LOCATION_EXTRA_COMMANDS: JString; cdecl;
    {class} function _GetACCESS_NETWORK_STATE: JString; cdecl;
    {class} function _GetACCESS_NOTIFICATION_POLICY: JString; cdecl;
    {class} function _GetACCESS_WIFI_STATE: JString; cdecl;
    {class} function _GetACCOUNT_MANAGER: JString; cdecl;
    {class} function _GetADD_VOICEMAIL: JString; cdecl;
    {class} function _GetANSWER_PHONE_CALLS: JString; cdecl;
    {class} function _GetBATTERY_STATS: JString; cdecl;
    {class} function _GetBIND_ACCESSIBILITY_SERVICE: JString; cdecl;
    {class} function _GetBIND_APPWIDGET: JString; cdecl;
    {class} function _GetBIND_AUTOFILL_SERVICE: JString; cdecl;
    {class} function _GetBIND_CARRIER_MESSAGING_SERVICE: JString; cdecl;
    {class} function _GetBIND_CARRIER_SERVICES: JString; cdecl;
    {class} function _GetBIND_CHOOSER_TARGET_SERVICE: JString; cdecl;
    {class} function _GetBIND_CONDITION_PROVIDER_SERVICE: JString; cdecl;
    {class} function _GetBIND_DEVICE_ADMIN: JString; cdecl;
    {class} function _GetBIND_DREAM_SERVICE: JString; cdecl;
    {class} function _GetBIND_INCALL_SERVICE: JString; cdecl;
    {class} function _GetBIND_INPUT_METHOD: JString; cdecl;
    {class} function _GetBIND_MIDI_DEVICE_SERVICE: JString; cdecl;
    {class} function _GetBIND_NFC_SERVICE: JString; cdecl;
    {class} function _GetBIND_NOTIFICATION_LISTENER_SERVICE: JString; cdecl;
    {class} function _GetBIND_PRINT_SERVICE: JString; cdecl;
    {class} function _GetBIND_QUICK_SETTINGS_TILE: JString; cdecl;
    {class} function _GetBIND_REMOTEVIEWS: JString; cdecl;
    {class} function _GetBIND_SCREENING_SERVICE: JString; cdecl;
    {class} function _GetBIND_TELECOM_CONNECTION_SERVICE: JString; cdecl;
    {class} function _GetBIND_TEXT_SERVICE: JString; cdecl;
    {class} function _GetBIND_TV_INPUT: JString; cdecl;
    {class} function _GetBIND_VISUAL_VOICEMAIL_SERVICE: JString; cdecl;
    {class} function _GetBIND_VOICE_INTERACTION: JString; cdecl;
    {class} function _GetBIND_VPN_SERVICE: JString; cdecl;
    {class} function _GetBIND_VR_LISTENER_SERVICE: JString; cdecl;
    {class} function _GetBIND_WALLPAPER: JString; cdecl;
    {class} function _GetBLUETOOTH: JString; cdecl;
    {class} function _GetBLUETOOTH_ADMIN: JString; cdecl;
    {class} function _GetBLUETOOTH_PRIVILEGED: JString; cdecl;
    {class} function _GetBODY_SENSORS: JString; cdecl;
    {class} function _GetBROADCAST_PACKAGE_REMOVED: JString; cdecl;
    {class} function _GetBROADCAST_SMS: JString; cdecl;
    {class} function _GetBROADCAST_STICKY: JString; cdecl;
    {class} function _GetBROADCAST_WAP_PUSH: JString; cdecl;
    {class} function _GetCALL_PHONE: JString; cdecl;
    {class} function _GetCALL_PRIVILEGED: JString; cdecl;
    {class} function _GetCAMERA: JString; cdecl;
    {class} function _GetCAPTURE_AUDIO_OUTPUT: JString; cdecl;
    {class} function _GetCAPTURE_SECURE_VIDEO_OUTPUT: JString; cdecl;
    {class} function _GetCAPTURE_VIDEO_OUTPUT: JString; cdecl;
    {class} function _GetCHANGE_COMPONENT_ENABLED_STATE: JString; cdecl;
    {class} function _GetCHANGE_CONFIGURATION: JString; cdecl;
    {class} function _GetCHANGE_NETWORK_STATE: JString; cdecl;
    {class} function _GetCHANGE_WIFI_MULTICAST_STATE: JString; cdecl;
    {class} function _GetCHANGE_WIFI_STATE: JString; cdecl;
    {class} function _GetCLEAR_APP_CACHE: JString; cdecl;
    {class} function _GetCONTROL_LOCATION_UPDATES: JString; cdecl;
    {class} function _GetDELETE_CACHE_FILES: JString; cdecl;
    {class} function _GetDELETE_PACKAGES: JString; cdecl;
    {class} function _GetDIAGNOSTIC: JString; cdecl;
    {class} function _GetDISABLE_KEYGUARD: JString; cdecl;
    {class} function _GetDUMP: JString; cdecl;
    {class} function _GetEXPAND_STATUS_BAR: JString; cdecl;
    {class} function _GetFACTORY_TEST: JString; cdecl;
    {class} function _GetGET_ACCOUNTS: JString; cdecl;
    {class} function _GetGET_ACCOUNTS_PRIVILEGED: JString; cdecl;
    {class} function _GetGET_PACKAGE_SIZE: JString; cdecl;
    {class} function _GetGET_TASKS: JString; cdecl;
    {class} function _GetGLOBAL_SEARCH: JString; cdecl;
    {class} function _GetINSTALL_LOCATION_PROVIDER: JString; cdecl;
    {class} function _GetINSTALL_PACKAGES: JString; cdecl;
    {class} function _GetINSTALL_SHORTCUT: JString; cdecl;
    {class} function _GetINSTANT_APP_FOREGROUND_SERVICE: JString; cdecl;
    {class} function _GetINTERNET: JString; cdecl;
    {class} function _GetKILL_BACKGROUND_PROCESSES: JString; cdecl;
    {class} function _GetLOCATION_HARDWARE: JString; cdecl;
    {class} function _GetMANAGE_DOCUMENTS: JString; cdecl;
    {class} function _GetMANAGE_OWN_CALLS: JString; cdecl;
    {class} function _GetMASTER_CLEAR: JString; cdecl;
    {class} function _GetMEDIA_CONTENT_CONTROL: JString; cdecl;
    {class} function _GetMODIFY_AUDIO_SETTINGS: JString; cdecl;
    {class} function _GetMODIFY_PHONE_STATE: JString; cdecl;
    {class} function _GetMOUNT_FORMAT_FILESYSTEMS: JString; cdecl;
    {class} function _GetMOUNT_UNMOUNT_FILESYSTEMS: JString; cdecl;
    {class} function _GetNFC: JString; cdecl;
    {class} function _GetPACKAGE_USAGE_STATS: JString; cdecl;
    {class} function _GetPERSISTENT_ACTIVITY: JString; cdecl;
    {class} function _GetPROCESS_OUTGOING_CALLS: JString; cdecl;
    {class} function _GetREAD_CALENDAR: JString; cdecl;
    {class} function _GetREAD_CALL_LOG: JString; cdecl;
    {class} function _GetREAD_CONTACTS: JString; cdecl;
    {class} function _GetREAD_EXTERNAL_STORAGE: JString; cdecl;
    {class} function _GetREAD_FRAME_BUFFER: JString; cdecl;
    {class} function _GetREAD_INPUT_STATE: JString; cdecl;
    {class} function _GetREAD_LOGS: JString; cdecl;
    {class} function _GetREAD_PHONE_NUMBERS: JString; cdecl;
    {class} function _GetREAD_PHONE_STATE: JString; cdecl;
    {class} function _GetREAD_SMS: JString; cdecl;
    {class} function _GetREAD_SYNC_SETTINGS: JString; cdecl;
    {class} function _GetREAD_SYNC_STATS: JString; cdecl;
    {class} function _GetREAD_VOICEMAIL: JString; cdecl;
    {class} function _GetREBOOT: JString; cdecl;
    {class} function _GetRECEIVE_BOOT_COMPLETED: JString; cdecl;
    {class} function _GetRECEIVE_MMS: JString; cdecl;
    {class} function _GetRECEIVE_SMS: JString; cdecl;
    {class} function _GetRECEIVE_WAP_PUSH: JString; cdecl;
    {class} function _GetRECORD_AUDIO: JString; cdecl;
    {class} function _GetREORDER_TASKS: JString; cdecl;
    {class} function _GetREQUEST_COMPANION_RUN_IN_BACKGROUND: JString; cdecl;
    {class} function _GetREQUEST_COMPANION_USE_DATA_IN_BACKGROUND: JString; cdecl;
    {class} function _GetREQUEST_DELETE_PACKAGES: JString; cdecl;
    {class} function _GetREQUEST_IGNORE_BATTERY_OPTIMIZATIONS: JString; cdecl;
    {class} function _GetREQUEST_INSTALL_PACKAGES: JString; cdecl;
    {class} function _GetRESTART_PACKAGES: JString; cdecl;
    {class} function _GetSEND_RESPOND_VIA_MESSAGE: JString; cdecl;
    {class} function _GetSEND_SMS: JString; cdecl;
    {class} function _GetSET_ALARM: JString; cdecl;
    {class} function _GetSET_ALWAYS_FINISH: JString; cdecl;
    {class} function _GetSET_ANIMATION_SCALE: JString; cdecl;
    {class} function _GetSET_DEBUG_APP: JString; cdecl;
    {class} function _GetSET_PREFERRED_APPLICATIONS: JString; cdecl;
    {class} function _GetSET_PROCESS_LIMIT: JString; cdecl;
    {class} function _GetSET_TIME: JString; cdecl;
    {class} function _GetSET_TIME_ZONE: JString; cdecl;
    {class} function _GetSET_WALLPAPER: JString; cdecl;
    {class} function _GetSET_WALLPAPER_HINTS: JString; cdecl;
    {class} function _GetSIGNAL_PERSISTENT_PROCESSES: JString; cdecl;
    {class} function _GetSTATUS_BAR: JString; cdecl;
    {class} function _GetSYSTEM_ALERT_WINDOW: JString; cdecl;
    {class} function _GetTRANSMIT_IR: JString; cdecl;
    {class} function _GetUNINSTALL_SHORTCUT: JString; cdecl;
    {class} function _GetUPDATE_DEVICE_STATS: JString; cdecl;
    {class} function _GetUSE_FINGERPRINT: JString; cdecl;
    {class} function _GetUSE_SIP: JString; cdecl;
    {class} function _GetVIBRATE: JString; cdecl;
    {class} function _GetWAKE_LOCK: JString; cdecl;
    {class} function _GetWRITE_APN_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_CALENDAR: JString; cdecl;
    {class} function _GetWRITE_CALL_LOG: JString; cdecl;
    {class} function _GetWRITE_CONTACTS: JString; cdecl;
    {class} function _GetWRITE_EXTERNAL_STORAGE: JString; cdecl;
    {class} function _GetWRITE_GSERVICES: JString; cdecl;
    {class} function _GetWRITE_SECURE_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_SYNC_SETTINGS: JString; cdecl;
    {class} function _GetWRITE_VOICEMAIL: JString; cdecl;
    {class} function init: JManifest_permission; cdecl;
    {class} property ACCESS_CHECKIN_PROPERTIES: JString read _GetACCESS_CHECKIN_PROPERTIES;
    {class} property ACCESS_COARSE_LOCATION: JString read _GetACCESS_COARSE_LOCATION;
    {class} property ACCESS_FINE_LOCATION: JString read _GetACCESS_FINE_LOCATION;
    {class} property ACCESS_LOCATION_EXTRA_COMMANDS: JString read _GetACCESS_LOCATION_EXTRA_COMMANDS;
    {class} property ACCESS_NETWORK_STATE: JString read _GetACCESS_NETWORK_STATE;
    {class} property ACCESS_NOTIFICATION_POLICY: JString read _GetACCESS_NOTIFICATION_POLICY;
    {class} property ACCESS_WIFI_STATE: JString read _GetACCESS_WIFI_STATE;
    {class} property ACCOUNT_MANAGER: JString read _GetACCOUNT_MANAGER;
    {class} property ADD_VOICEMAIL: JString read _GetADD_VOICEMAIL;
    {class} property ANSWER_PHONE_CALLS: JString read _GetANSWER_PHONE_CALLS;
    {class} property BATTERY_STATS: JString read _GetBATTERY_STATS;
    {class} property BIND_ACCESSIBILITY_SERVICE: JString read _GetBIND_ACCESSIBILITY_SERVICE;
    {class} property BIND_APPWIDGET: JString read _GetBIND_APPWIDGET;
    {class} property BIND_AUTOFILL_SERVICE: JString read _GetBIND_AUTOFILL_SERVICE;
    {class} property BIND_CARRIER_MESSAGING_SERVICE: JString read _GetBIND_CARRIER_MESSAGING_SERVICE;
    {class} property BIND_CARRIER_SERVICES: JString read _GetBIND_CARRIER_SERVICES;
    {class} property BIND_CHOOSER_TARGET_SERVICE: JString read _GetBIND_CHOOSER_TARGET_SERVICE;
    {class} property BIND_CONDITION_PROVIDER_SERVICE: JString read _GetBIND_CONDITION_PROVIDER_SERVICE;
    {class} property BIND_DEVICE_ADMIN: JString read _GetBIND_DEVICE_ADMIN;
    {class} property BIND_DREAM_SERVICE: JString read _GetBIND_DREAM_SERVICE;
    {class} property BIND_INCALL_SERVICE: JString read _GetBIND_INCALL_SERVICE;
    {class} property BIND_INPUT_METHOD: JString read _GetBIND_INPUT_METHOD;
    {class} property BIND_MIDI_DEVICE_SERVICE: JString read _GetBIND_MIDI_DEVICE_SERVICE;
    {class} property BIND_NFC_SERVICE: JString read _GetBIND_NFC_SERVICE;
    {class} property BIND_NOTIFICATION_LISTENER_SERVICE: JString read _GetBIND_NOTIFICATION_LISTENER_SERVICE;
    {class} property BIND_PRINT_SERVICE: JString read _GetBIND_PRINT_SERVICE;
    {class} property BIND_QUICK_SETTINGS_TILE: JString read _GetBIND_QUICK_SETTINGS_TILE;
    {class} property BIND_REMOTEVIEWS: JString read _GetBIND_REMOTEVIEWS;
    {class} property BIND_SCREENING_SERVICE: JString read _GetBIND_SCREENING_SERVICE;
    {class} property BIND_TELECOM_CONNECTION_SERVICE: JString read _GetBIND_TELECOM_CONNECTION_SERVICE;
    {class} property BIND_TEXT_SERVICE: JString read _GetBIND_TEXT_SERVICE;
    {class} property BIND_TV_INPUT: JString read _GetBIND_TV_INPUT;
    {class} property BIND_VISUAL_VOICEMAIL_SERVICE: JString read _GetBIND_VISUAL_VOICEMAIL_SERVICE;
    {class} property BIND_VOICE_INTERACTION: JString read _GetBIND_VOICE_INTERACTION;
    {class} property BIND_VPN_SERVICE: JString read _GetBIND_VPN_SERVICE;
    {class} property BIND_VR_LISTENER_SERVICE: JString read _GetBIND_VR_LISTENER_SERVICE;
    {class} property BIND_WALLPAPER: JString read _GetBIND_WALLPAPER;
    {class} property BLUETOOTH: JString read _GetBLUETOOTH;
    {class} property BLUETOOTH_ADMIN: JString read _GetBLUETOOTH_ADMIN;
    {class} property BLUETOOTH_PRIVILEGED: JString read _GetBLUETOOTH_PRIVILEGED;
    {class} property BODY_SENSORS: JString read _GetBODY_SENSORS;
    {class} property BROADCAST_PACKAGE_REMOVED: JString read _GetBROADCAST_PACKAGE_REMOVED;
    {class} property BROADCAST_SMS: JString read _GetBROADCAST_SMS;
    {class} property BROADCAST_STICKY: JString read _GetBROADCAST_STICKY;
    {class} property BROADCAST_WAP_PUSH: JString read _GetBROADCAST_WAP_PUSH;
    {class} property CALL_PHONE: JString read _GetCALL_PHONE;
    {class} property CALL_PRIVILEGED: JString read _GetCALL_PRIVILEGED;
    {class} property CAMERA: JString read _GetCAMERA;
    {class} property CAPTURE_AUDIO_OUTPUT: JString read _GetCAPTURE_AUDIO_OUTPUT;
    {class} property CAPTURE_SECURE_VIDEO_OUTPUT: JString read _GetCAPTURE_SECURE_VIDEO_OUTPUT;
    {class} property CAPTURE_VIDEO_OUTPUT: JString read _GetCAPTURE_VIDEO_OUTPUT;
    {class} property CHANGE_COMPONENT_ENABLED_STATE: JString read _GetCHANGE_COMPONENT_ENABLED_STATE;
    {class} property CHANGE_CONFIGURATION: JString read _GetCHANGE_CONFIGURATION;
    {class} property CHANGE_NETWORK_STATE: JString read _GetCHANGE_NETWORK_STATE;
    {class} property CHANGE_WIFI_MULTICAST_STATE: JString read _GetCHANGE_WIFI_MULTICAST_STATE;
    {class} property CHANGE_WIFI_STATE: JString read _GetCHANGE_WIFI_STATE;
    {class} property CLEAR_APP_CACHE: JString read _GetCLEAR_APP_CACHE;
    {class} property CONTROL_LOCATION_UPDATES: JString read _GetCONTROL_LOCATION_UPDATES;
    {class} property DELETE_CACHE_FILES: JString read _GetDELETE_CACHE_FILES;
    {class} property DELETE_PACKAGES: JString read _GetDELETE_PACKAGES;
    {class} property DIAGNOSTIC: JString read _GetDIAGNOSTIC;
    {class} property DISABLE_KEYGUARD: JString read _GetDISABLE_KEYGUARD;
    {class} property DUMP: JString read _GetDUMP;
    {class} property EXPAND_STATUS_BAR: JString read _GetEXPAND_STATUS_BAR;
    {class} property FACTORY_TEST: JString read _GetFACTORY_TEST;
    {class} property GET_ACCOUNTS: JString read _GetGET_ACCOUNTS;
    {class} property GET_ACCOUNTS_PRIVILEGED: JString read _GetGET_ACCOUNTS_PRIVILEGED;
    {class} property GET_PACKAGE_SIZE: JString read _GetGET_PACKAGE_SIZE;
    {class} property GET_TASKS: JString read _GetGET_TASKS;
    {class} property GLOBAL_SEARCH: JString read _GetGLOBAL_SEARCH;
    {class} property INSTALL_LOCATION_PROVIDER: JString read _GetINSTALL_LOCATION_PROVIDER;
    {class} property INSTALL_PACKAGES: JString read _GetINSTALL_PACKAGES;
    {class} property INSTALL_SHORTCUT: JString read _GetINSTALL_SHORTCUT;
    {class} property INSTANT_APP_FOREGROUND_SERVICE: JString read _GetINSTANT_APP_FOREGROUND_SERVICE;
    {class} property INTERNET: JString read _GetINTERNET;
    {class} property KILL_BACKGROUND_PROCESSES: JString read _GetKILL_BACKGROUND_PROCESSES;
    {class} property LOCATION_HARDWARE: JString read _GetLOCATION_HARDWARE;
    {class} property MANAGE_DOCUMENTS: JString read _GetMANAGE_DOCUMENTS;
    {class} property MANAGE_OWN_CALLS: JString read _GetMANAGE_OWN_CALLS;
    {class} property MASTER_CLEAR: JString read _GetMASTER_CLEAR;
    {class} property MEDIA_CONTENT_CONTROL: JString read _GetMEDIA_CONTENT_CONTROL;
    {class} property MODIFY_AUDIO_SETTINGS: JString read _GetMODIFY_AUDIO_SETTINGS;
    {class} property MODIFY_PHONE_STATE: JString read _GetMODIFY_PHONE_STATE;
    {class} property MOUNT_FORMAT_FILESYSTEMS: JString read _GetMOUNT_FORMAT_FILESYSTEMS;
    {class} property MOUNT_UNMOUNT_FILESYSTEMS: JString read _GetMOUNT_UNMOUNT_FILESYSTEMS;
    {class} property NFC: JString read _GetNFC;
    {class} property PACKAGE_USAGE_STATS: JString read _GetPACKAGE_USAGE_STATS;
    {class} property PERSISTENT_ACTIVITY: JString read _GetPERSISTENT_ACTIVITY;
    {class} property PROCESS_OUTGOING_CALLS: JString read _GetPROCESS_OUTGOING_CALLS;
    {class} property READ_CALENDAR: JString read _GetREAD_CALENDAR;
    {class} property READ_CALL_LOG: JString read _GetREAD_CALL_LOG;
    {class} property READ_CONTACTS: JString read _GetREAD_CONTACTS;
    {class} property READ_EXTERNAL_STORAGE: JString read _GetREAD_EXTERNAL_STORAGE;
    {class} property READ_FRAME_BUFFER: JString read _GetREAD_FRAME_BUFFER;
    {class} property READ_INPUT_STATE: JString read _GetREAD_INPUT_STATE;
    {class} property READ_LOGS: JString read _GetREAD_LOGS;
    {class} property READ_PHONE_NUMBERS: JString read _GetREAD_PHONE_NUMBERS;
    {class} property READ_PHONE_STATE: JString read _GetREAD_PHONE_STATE;
    {class} property READ_SMS: JString read _GetREAD_SMS;
    {class} property READ_SYNC_SETTINGS: JString read _GetREAD_SYNC_SETTINGS;
    {class} property READ_SYNC_STATS: JString read _GetREAD_SYNC_STATS;
    {class} property READ_VOICEMAIL: JString read _GetREAD_VOICEMAIL;
    {class} property REBOOT: JString read _GetREBOOT;
    {class} property RECEIVE_BOOT_COMPLETED: JString read _GetRECEIVE_BOOT_COMPLETED;
    {class} property RECEIVE_MMS: JString read _GetRECEIVE_MMS;
    {class} property RECEIVE_SMS: JString read _GetRECEIVE_SMS;
    {class} property RECEIVE_WAP_PUSH: JString read _GetRECEIVE_WAP_PUSH;
    {class} property RECORD_AUDIO: JString read _GetRECORD_AUDIO;
    {class} property REORDER_TASKS: JString read _GetREORDER_TASKS;
    {class} property REQUEST_COMPANION_RUN_IN_BACKGROUND: JString read _GetREQUEST_COMPANION_RUN_IN_BACKGROUND;
    {class} property REQUEST_COMPANION_USE_DATA_IN_BACKGROUND: JString read _GetREQUEST_COMPANION_USE_DATA_IN_BACKGROUND;
    {class} property REQUEST_DELETE_PACKAGES: JString read _GetREQUEST_DELETE_PACKAGES;
    {class} property REQUEST_IGNORE_BATTERY_OPTIMIZATIONS: JString read _GetREQUEST_IGNORE_BATTERY_OPTIMIZATIONS;
    {class} property REQUEST_INSTALL_PACKAGES: JString read _GetREQUEST_INSTALL_PACKAGES;
    {class} property RESTART_PACKAGES: JString read _GetRESTART_PACKAGES;
    {class} property SEND_RESPOND_VIA_MESSAGE: JString read _GetSEND_RESPOND_VIA_MESSAGE;
    {class} property SEND_SMS: JString read _GetSEND_SMS;
    {class} property SET_ALARM: JString read _GetSET_ALARM;
    {class} property SET_ALWAYS_FINISH: JString read _GetSET_ALWAYS_FINISH;
    {class} property SET_ANIMATION_SCALE: JString read _GetSET_ANIMATION_SCALE;
    {class} property SET_DEBUG_APP: JString read _GetSET_DEBUG_APP;
    {class} property SET_PREFERRED_APPLICATIONS: JString read _GetSET_PREFERRED_APPLICATIONS;
    {class} property SET_PROCESS_LIMIT: JString read _GetSET_PROCESS_LIMIT;
    {class} property SET_TIME: JString read _GetSET_TIME;
    {class} property SET_TIME_ZONE: JString read _GetSET_TIME_ZONE;
    {class} property SET_WALLPAPER: JString read _GetSET_WALLPAPER;
    {class} property SET_WALLPAPER_HINTS: JString read _GetSET_WALLPAPER_HINTS;
    {class} property SIGNAL_PERSISTENT_PROCESSES: JString read _GetSIGNAL_PERSISTENT_PROCESSES;
    {class} property STATUS_BAR: JString read _GetSTATUS_BAR;
    {class} property SYSTEM_ALERT_WINDOW: JString read _GetSYSTEM_ALERT_WINDOW;
    {class} property TRANSMIT_IR: JString read _GetTRANSMIT_IR;
    {class} property UNINSTALL_SHORTCUT: JString read _GetUNINSTALL_SHORTCUT;
    {class} property UPDATE_DEVICE_STATS: JString read _GetUPDATE_DEVICE_STATS;
    {class} property USE_FINGERPRINT: JString read _GetUSE_FINGERPRINT;
    {class} property USE_SIP: JString read _GetUSE_SIP;
    {class} property VIBRATE: JString read _GetVIBRATE;
    {class} property WAKE_LOCK: JString read _GetWAKE_LOCK;
    {class} property WRITE_APN_SETTINGS: JString read _GetWRITE_APN_SETTINGS;
    {class} property WRITE_CALENDAR: JString read _GetWRITE_CALENDAR;
    {class} property WRITE_CALL_LOG: JString read _GetWRITE_CALL_LOG;
    {class} property WRITE_CONTACTS: JString read _GetWRITE_CONTACTS;
    {class} property WRITE_EXTERNAL_STORAGE: JString read _GetWRITE_EXTERNAL_STORAGE;
    {class} property WRITE_GSERVICES: JString read _GetWRITE_GSERVICES;
    {class} property WRITE_SECURE_SETTINGS: JString read _GetWRITE_SECURE_SETTINGS;
    {class} property WRITE_SETTINGS: JString read _GetWRITE_SETTINGS;
    {class} property WRITE_SYNC_SETTINGS: JString read _GetWRITE_SYNC_SETTINGS;
    {class} property WRITE_VOICEMAIL: JString read _GetWRITE_VOICEMAIL;
  end;

  [JavaSignature('android/Manifest$permission')]
  JManifest_permission = interface(JObject)
    ['{85A59978-A449-472E-BD22-F0674731D240}']
  end;
  TJManifest_permission = class(TJavaGenericImport<JManifest_permissionClass, JManifest_permission>) end;

  JManifest_permission_groupClass = interface(JObjectClass)
    ['{16D53E24-6ED5-42C0-A890-978B49643B1A}']
    {class} function _GetCALENDAR: JString; cdecl;
    {class} function _GetCAMERA: JString; cdecl;
    {class} function _GetCONTACTS: JString; cdecl;
    {class} function _GetLOCATION: JString; cdecl;
    {class} function _GetMICROPHONE: JString; cdecl;
    {class} function _GetPHONE: JString; cdecl;
    {class} function _GetSENSORS: JString; cdecl;
    {class} function _GetSMS: JString; cdecl;
    {class} function _GetSTORAGE: JString; cdecl;
    {class} function init: JManifest_permission_group; cdecl;
    {class} property CALENDAR: JString read _GetCALENDAR;
    {class} property CAMERA: JString read _GetCAMERA;
    {class} property CONTACTS: JString read _GetCONTACTS;
    {class} property LOCATION: JString read _GetLOCATION;
    {class} property MICROPHONE: JString read _GetMICROPHONE;
    {class} property PHONE: JString read _GetPHONE;
    {class} property SENSORS: JString read _GetSENSORS;
    {class} property SMS: JString read _GetSMS;
    {class} property STORAGE: JString read _GetSTORAGE;
  end;

  [JavaSignature('android/Manifest$permission_group')]
  JManifest_permission_group = interface(JObject)
    ['{55CD45CB-F813-4B61-BD7D-F6EF3CF99D76}']
  end;
  TJManifest_permission_group = class(TJavaGenericImport<JManifest_permission_groupClass, JManifest_permission_group>) end;

  JBaseBundleClass = interface(JObjectClass)
    ['{099680A9-7573-4870-8603-6E81F97AEEF2}']
  end;

  [JavaSignature('android/os/BaseBundle')]
  JBaseBundle = interface(JObject)
    ['{4A1E7433-E9A8-485A-94BC-AB502A0F5820}']
    procedure clear; cdecl;
    function containsKey(key: JString): Boolean; cdecl;
    function &get(key: JString): JObject; cdecl;
    function getBoolean(key: JString): Boolean; cdecl; overload;
    function getBoolean(key: JString; defaultValue: Boolean): Boolean; cdecl; overload;
    function getBooleanArray(key: JString): TJavaArray<Boolean>; cdecl;
    function getDouble(key: JString): Double; cdecl; overload;
    function getDouble(key: JString; defaultValue: Double): Double; cdecl; overload;
    function getDoubleArray(key: JString): TJavaArray<Double>; cdecl;
    function getInt(key: JString): Integer; cdecl; overload;
    function getInt(key: JString; defaultValue: Integer): Integer; cdecl; overload;
    function getIntArray(key: JString): TJavaArray<Integer>; cdecl;
    function getLong(key: JString): Int64; cdecl; overload;
    function getLong(key: JString; defaultValue: Int64): Int64; cdecl; overload;
    function getLongArray(key: JString): TJavaArray<Int64>; cdecl;
    function getString(key: JString): JString; cdecl; overload;
    function getString(key: JString; defaultValue: JString): JString; cdecl; overload;
    function getStringArray(key: JString): TJavaObjectArray<JString>; cdecl;
    function isEmpty: Boolean; cdecl;
    function keySet: JSet; cdecl;
    procedure putAll(bundle: JPersistableBundle); cdecl;
    procedure putBoolean(key: JString; value: Boolean); cdecl;
    procedure putBooleanArray(key: JString; value: TJavaArray<Boolean>); cdecl;
    procedure putDouble(key: JString; value: Double); cdecl;
    procedure putDoubleArray(key: JString; value: TJavaArray<Double>); cdecl;
    procedure putInt(key: JString; value: Integer); cdecl;
    procedure putIntArray(key: JString; value: TJavaArray<Integer>); cdecl;
    procedure putLong(key: JString; value: Int64); cdecl;
    procedure putLongArray(key: JString; value: TJavaArray<Int64>); cdecl;
    procedure putString(key: JString; value: JString); cdecl;
    procedure putStringArray(key: JString; value: TJavaObjectArray<JString>); cdecl;
    procedure remove(key: JString); cdecl;
    function size: Integer; cdecl;
  end;
  TJBaseBundle = class(TJavaGenericImport<JBaseBundleClass, JBaseBundle>) end;

  JBinderClass = interface(JObjectClass)
    ['{28B153C2-C5E2-4A29-8263-9F290048E72A}']
    {class} function init: JBinder; cdecl;
    {class} function clearCallingIdentity: Int64; cdecl;
    {class} procedure flushPendingCommands; cdecl;
    {class} function getCallingPid: Integer; cdecl;
    {class} function getCallingUid: Integer; cdecl;
    {class} function getCallingUserHandle: JUserHandle; cdecl;
    {class} procedure joinThreadPool; cdecl;
    {class} procedure restoreCallingIdentity(token: Int64); cdecl;
  end;

  [JavaSignature('android/os/Binder')]
  JBinder = interface(JObject)
    ['{0A24225C-72F2-43B3-904F-77E148717C48}']
    procedure attachInterface(owner: JIInterface; descriptor: JString); cdecl;
    procedure dump(fd: JFileDescriptor; args: TJavaObjectArray<JString>); cdecl;
    procedure dumpAsync(fd: JFileDescriptor; args: TJavaObjectArray<JString>); cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function isBinderAlive: Boolean; cdecl;
    procedure linkToDeath(recipient: JIBinder_DeathRecipient; flags: Integer); cdecl;
    function pingBinder: Boolean; cdecl;
    function queryLocalInterface(descriptor: JString): JIInterface; cdecl;
    function transact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;
    function unlinkToDeath(recipient: JIBinder_DeathRecipient; flags: Integer): Boolean; cdecl;
  end;
  TJBinder = class(TJavaGenericImport<JBinderClass, JBinder>) end;

  JBuildClass = interface(JObjectClass)
    ['{D90671CF-F0CF-4B07-9660-00D373289D50}']
    {class} function _GetBOARD: JString; cdecl;
    {class} function _GetBOOTLOADER: JString; cdecl;
    {class} function _GetBRAND: JString; cdecl;
    {class} function _GetCPU_ABI: JString; cdecl;
    {class} function _GetCPU_ABI2: JString; cdecl;
    {class} function _GetDEVICE: JString; cdecl;
    {class} function _GetDISPLAY: JString; cdecl;
    {class} function _GetFINGERPRINT: JString; cdecl;
    {class} function _GetHARDWARE: JString; cdecl;
    {class} function _GetHOST: JString; cdecl;
    {class} function _GetID: JString; cdecl;
    {class} function _GetMANUFACTURER: JString; cdecl;
    {class} function _GetMODEL: JString; cdecl;
    {class} function _GetPRODUCT: JString; cdecl;
    {class} function _GetRADIO: JString; cdecl;
    {class} function _GetSERIAL: JString; cdecl;
    {class} function _GetSUPPORTED_32_BIT_ABIS: TJavaObjectArray<JString>; cdecl;
    {class} function _GetSUPPORTED_64_BIT_ABIS: TJavaObjectArray<JString>; cdecl;
    {class} function _GetSUPPORTED_ABIS: TJavaObjectArray<JString>; cdecl;
    {class} function _GetTAGS: JString; cdecl;
    {class} function _GetTIME: Int64; cdecl;
    {class} function _GetTYPE: JString; cdecl;
    {class} function _GetUNKNOWN: JString; cdecl;
    {class} function _GetUSER: JString; cdecl;
    {class} function init: JBuild; cdecl;
    {class} function getRadioVersion: JString; cdecl;
    {class} function getSerial: JString; cdecl;
    {class} property BOARD: JString read _GetBOARD;
    {class} property BOOTLOADER: JString read _GetBOOTLOADER;
    {class} property BRAND: JString read _GetBRAND;
    {class} property CPU_ABI: JString read _GetCPU_ABI;
    {class} property CPU_ABI2: JString read _GetCPU_ABI2;
    {class} property DEVICE: JString read _GetDEVICE;
    {class} property DISPLAY: JString read _GetDISPLAY;
    {class} property FINGERPRINT: JString read _GetFINGERPRINT;
    {class} property HARDWARE: JString read _GetHARDWARE;
    {class} property HOST: JString read _GetHOST;
    {class} property ID: JString read _GetID;
    {class} property MANUFACTURER: JString read _GetMANUFACTURER;
    {class} property MODEL: JString read _GetMODEL;
    {class} property PRODUCT: JString read _GetPRODUCT;
    {class} property RADIO: JString read _GetRADIO;
    {class} property SERIAL: JString read _GetSERIAL;
    {class} property SUPPORTED_32_BIT_ABIS: TJavaObjectArray<JString> read _GetSUPPORTED_32_BIT_ABIS;
    {class} property SUPPORTED_64_BIT_ABIS: TJavaObjectArray<JString> read _GetSUPPORTED_64_BIT_ABIS;
    {class} property SUPPORTED_ABIS: TJavaObjectArray<JString> read _GetSUPPORTED_ABIS;
    {class} property TAGS: JString read _GetTAGS;
    {class} property TIME: Int64 read _GetTIME;
    {class} property &TYPE: JString read _GetTYPE;
    {class} property UNKNOWN: JString read _GetUNKNOWN;
    {class} property USER: JString read _GetUSER;
  end;

  [JavaSignature('android/os/Build')]
  JBuild = interface(JObject)
    ['{68FCB5C7-BF21-4462-AEA3-D43FBD2D2B24}']
  end;
  TJBuild = class(TJavaGenericImport<JBuildClass, JBuild>) end;

  JBuild_VERSIONClass = interface(JObjectClass)
    ['{1CEE3318-C68B-4A45-A09A-0584BFB9FA31}']
    {class} function _GetBASE_OS: JString; cdecl;
    {class} function _GetCODENAME: JString; cdecl;
    {class} function _GetINCREMENTAL: JString; cdecl;
    {class} function _GetPREVIEW_SDK_INT: Integer; cdecl;
    {class} function _GetRELEASE: JString; cdecl;
    {class} function _GetSDK: JString; cdecl;
    {class} function _GetSDK_INT: Integer; cdecl;
    {class} function _GetSECURITY_PATCH: JString; cdecl;
    {class} function init: JBuild_VERSION; cdecl;
    {class} property BASE_OS: JString read _GetBASE_OS;
    {class} property CODENAME: JString read _GetCODENAME;
    {class} property INCREMENTAL: JString read _GetINCREMENTAL;
    {class} property PREVIEW_SDK_INT: Integer read _GetPREVIEW_SDK_INT;
    {class} property RELEASE: JString read _GetRELEASE;
    {class} property SDK: JString read _GetSDK;
    {class} property SDK_INT: Integer read _GetSDK_INT;
    {class} property SECURITY_PATCH: JString read _GetSECURITY_PATCH;
  end;

  [JavaSignature('android/os/Build$VERSION')]
  JBuild_VERSION = interface(JObject)
    ['{364B79B2-B660-4622-BCD5-85A530549F8E}']
  end;
  TJBuild_VERSION = class(TJavaGenericImport<JBuild_VERSIONClass, JBuild_VERSION>) end;

  JBuild_VERSION_CODESClass = interface(JObjectClass)
    ['{B29B57B4-E754-4491-8E21-18F8AC40121D}']
    {class} function _GetBASE: Integer; cdecl;
    {class} function _GetBASE_1_1: Integer; cdecl;
    {class} function _GetCUPCAKE: Integer; cdecl;
    {class} function _GetCUR_DEVELOPMENT: Integer; cdecl;
    {class} function _GetDONUT: Integer; cdecl;
    {class} function _GetECLAIR: Integer; cdecl;
    {class} function _GetECLAIR_0_1: Integer; cdecl;
    {class} function _GetECLAIR_MR1: Integer; cdecl;
    {class} function _GetFROYO: Integer; cdecl;
    {class} function _GetGINGERBREAD: Integer; cdecl;
    {class} function _GetGINGERBREAD_MR1: Integer; cdecl;
    {class} function _GetHONEYCOMB: Integer; cdecl;
    {class} function _GetHONEYCOMB_MR1: Integer; cdecl;
    {class} function _GetHONEYCOMB_MR2: Integer; cdecl;
    {class} function _GetICE_CREAM_SANDWICH: Integer; cdecl;
    {class} function _GetICE_CREAM_SANDWICH_MR1: Integer; cdecl;
    {class} function _GetJELLY_BEAN: Integer; cdecl;
    {class} function _GetJELLY_BEAN_MR1: Integer; cdecl;
    {class} function _GetJELLY_BEAN_MR2: Integer; cdecl;
    {class} function _GetKITKAT: Integer; cdecl;
    {class} function _GetKITKAT_WATCH: Integer; cdecl;
    {class} function _GetLOLLIPOP: Integer; cdecl;
    {class} function _GetLOLLIPOP_MR1: Integer; cdecl;
    {class} function _GetM: Integer; cdecl;
    {class} function _GetN: Integer; cdecl;
    {class} function _GetN_MR1: Integer; cdecl;
    {class} function _GetO: Integer; cdecl;
    {class} function init: JBuild_VERSION_CODES; cdecl;
    {class} property BASE: Integer read _GetBASE;
    {class} property BASE_1_1: Integer read _GetBASE_1_1;
    {class} property CUPCAKE: Integer read _GetCUPCAKE;
    {class} property CUR_DEVELOPMENT: Integer read _GetCUR_DEVELOPMENT;
    {class} property DONUT: Integer read _GetDONUT;
    {class} property ECLAIR: Integer read _GetECLAIR;
    {class} property ECLAIR_0_1: Integer read _GetECLAIR_0_1;
    {class} property ECLAIR_MR1: Integer read _GetECLAIR_MR1;
    {class} property FROYO: Integer read _GetFROYO;
    {class} property GINGERBREAD: Integer read _GetGINGERBREAD;
    {class} property GINGERBREAD_MR1: Integer read _GetGINGERBREAD_MR1;
    {class} property HONEYCOMB: Integer read _GetHONEYCOMB;
    {class} property HONEYCOMB_MR1: Integer read _GetHONEYCOMB_MR1;
    {class} property HONEYCOMB_MR2: Integer read _GetHONEYCOMB_MR2;
    {class} property ICE_CREAM_SANDWICH: Integer read _GetICE_CREAM_SANDWICH;
    {class} property ICE_CREAM_SANDWICH_MR1: Integer read _GetICE_CREAM_SANDWICH_MR1;
    {class} property JELLY_BEAN: Integer read _GetJELLY_BEAN;
    {class} property JELLY_BEAN_MR1: Integer read _GetJELLY_BEAN_MR1;
    {class} property JELLY_BEAN_MR2: Integer read _GetJELLY_BEAN_MR2;
    {class} property KITKAT: Integer read _GetKITKAT;
    {class} property KITKAT_WATCH: Integer read _GetKITKAT_WATCH;
    {class} property LOLLIPOP: Integer read _GetLOLLIPOP;
    {class} property LOLLIPOP_MR1: Integer read _GetLOLLIPOP_MR1;
    {class} property M: Integer read _GetM;
    {class} property N: Integer read _GetN;
    {class} property N_MR1: Integer read _GetN_MR1;
    {class} property O: Integer read _GetO;
  end;

  [JavaSignature('android/os/Build$VERSION_CODES')]
  JBuild_VERSION_CODES = interface(JObject)
    ['{02FEBAA4-6C7B-4AA8-8415-ED410352FF64}']
  end;
  TJBuild_VERSION_CODES = class(TJavaGenericImport<JBuild_VERSION_CODESClass, JBuild_VERSION_CODES>) end;

  JBundleClass = interface(JBaseBundleClass)
    ['{35D462B0-8866-4937-B9CD-5DC0F7E9DE87}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEMPTY: JBundle; cdecl;
    {class} function init: JBundle; cdecl; overload;
    {class} function init(loader: JClassLoader): JBundle; cdecl; overload;
    {class} function init(capacity: Integer): JBundle; cdecl; overload;
    {class} function init(b: JBundle): JBundle; cdecl; overload;
    {class} function init(b: JPersistableBundle): JBundle; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EMPTY: JBundle read _GetEMPTY;
  end;

  [JavaSignature('android/os/Bundle')]
  JBundle = interface(JBaseBundle)
    ['{7D0B7FBA-46ED-4D53-9E0C-F48362182E4F}']
    procedure clear; cdecl;
    function clone: JObject; cdecl;
    function deepCopy: JBundle; cdecl;
    function describeContents: Integer; cdecl;
    function getBinder(key: JString): JIBinder; cdecl;
    function getBundle(key: JString): JBundle; cdecl;
    function getByte(key: JString): Byte; cdecl; overload;
    function getByte(key: JString; defaultValue: Byte): JByte; cdecl; overload;
    function getByteArray(key: JString): TJavaArray<Byte>; cdecl;
    function getChar(key: JString): Char; cdecl; overload;
    function getChar(key: JString; defaultValue: Char): Char; cdecl; overload;
    function getCharArray(key: JString): TJavaArray<Char>; cdecl;
    function getCharSequence(key: JString): JCharSequence; cdecl; overload;
    function getCharSequence(key: JString; defaultValue: JCharSequence): JCharSequence; cdecl; overload;
    function getCharSequenceArray(key: JString): TJavaObjectArray<JCharSequence>; cdecl;
    function getCharSequenceArrayList(key: JString): JArrayList; cdecl;
    function getClassLoader: JClassLoader; cdecl;
    function getFloat(key: JString): Single; cdecl; overload;
    function getFloat(key: JString; defaultValue: Single): Single; cdecl; overload;
    function getFloatArray(key: JString): TJavaArray<Single>; cdecl;
    function getIntegerArrayList(key: JString): JArrayList; cdecl;
    function getParcelable(key: JString): JParcelable; cdecl;
    function getParcelableArray(key: JString): TJavaObjectArray<JParcelable>; cdecl;
    function getParcelableArrayList(key: JString): JArrayList; cdecl;
    function getSerializable(key: JString): JSerializable; cdecl;
    function getShort(key: JString): SmallInt; cdecl; overload;
    function getShort(key: JString; defaultValue: SmallInt): SmallInt; cdecl; overload;
    function getShortArray(key: JString): TJavaArray<SmallInt>; cdecl;
    function getSize(key: JString): Jutil_Size; cdecl;
    function getSizeF(key: JString): JSizeF; cdecl;
    function getSparseParcelableArray(key: JString): JSparseArray; cdecl;
    function getStringArrayList(key: JString): JArrayList; cdecl;
    function hasFileDescriptors: Boolean; cdecl;
    procedure putAll(bundle: JBundle); cdecl;
    procedure putBinder(key: JString; value: JIBinder); cdecl;
    procedure putBundle(key: JString; value: JBundle); cdecl;
    procedure putByte(key: JString; value: Byte); cdecl;
    procedure putByteArray(key: JString; value: TJavaArray<Byte>); cdecl;
    procedure putChar(key: JString; value: Char); cdecl;
    procedure putCharArray(key: JString; value: TJavaArray<Char>); cdecl;
    procedure putCharSequence(key: JString; value: JCharSequence); cdecl;
    procedure putCharSequenceArray(key: JString; value: TJavaObjectArray<JCharSequence>); cdecl;
    procedure putCharSequenceArrayList(key: JString; value: JArrayList); cdecl;
    procedure putFloat(key: JString; value: Single); cdecl;
    procedure putFloatArray(key: JString; value: TJavaArray<Single>); cdecl;
    procedure putIntegerArrayList(key: JString; value: JArrayList); cdecl;
    procedure putParcelable(key: JString; value: JParcelable); cdecl;
    procedure putParcelableArray(key: JString; value: TJavaObjectArray<JParcelable>); cdecl;
    procedure putParcelableArrayList(key: JString; value: JArrayList); cdecl;
    procedure putSerializable(key: JString; value: JSerializable); cdecl;
    procedure putShort(key: JString; value: SmallInt); cdecl;
    procedure putShortArray(key: JString; value: TJavaArray<SmallInt>); cdecl;
    procedure putSize(key: JString; value: Jutil_Size); cdecl;
    procedure putSizeF(key: JString; value: JSizeF); cdecl;
    procedure putSparseParcelableArray(key: JString; value: JSparseArray); cdecl;
    procedure putStringArrayList(key: JString; value: JArrayList); cdecl;
    procedure readFromParcel(parcel: JParcel); cdecl;
    procedure remove(key: JString); cdecl;
    procedure setClassLoader(loader: JClassLoader); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJBundle = class(TJavaGenericImport<JBundleClass, JBundle>) end;

  JCancellationSignalClass = interface(JObjectClass)
    ['{15B2FE5D-1470-43DD-8693-45A3DC38300A}']
    {class} function init: JCancellationSignal; cdecl;
  end;

  [JavaSignature('android/os/CancellationSignal')]
  JCancellationSignal = interface(JObject)
    ['{68D52DA5-BAFC-40CA-9CC8-083A1DC6EF2A}']
    procedure cancel; cdecl;
    function isCanceled: Boolean; cdecl;
    procedure setOnCancelListener(listener: JCancellationSignal_OnCancelListener); cdecl;
    procedure throwIfCanceled; cdecl;
  end;
  TJCancellationSignal = class(TJavaGenericImport<JCancellationSignalClass, JCancellationSignal>) end;

  JCancellationSignal_OnCancelListenerClass = interface(IJavaClass)
    ['{C5DA883A-D40B-4567-93D7-B7D9EB1399EA}']
  end;

  [JavaSignature('android/os/CancellationSignal$OnCancelListener')]
  JCancellationSignal_OnCancelListener = interface(IJavaInstance)
    ['{6B0E6041-7C1B-4911-8FC3-167328179B8C}']
    procedure onCancel; cdecl;
  end;
  TJCancellationSignal_OnCancelListener = class(TJavaGenericImport<JCancellationSignal_OnCancelListenerClass, JCancellationSignal_OnCancelListener>) end;

  JDebug_MemoryInfoClass = interface(JObjectClass)
    ['{3048CDA3-574F-455F-B26C-9535F0644AF5}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JDebug_MemoryInfo; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/Debug$MemoryInfo')]
  JDebug_MemoryInfo = interface(JObject)
    ['{7D2ECE2E-A223-4DD4-8964-4E53F21B8BE2}']
    function _GetdalvikPrivateDirty: Integer; cdecl;
    procedure _SetdalvikPrivateDirty(Value: Integer); cdecl;
    function _GetdalvikPss: Integer; cdecl;
    procedure _SetdalvikPss(Value: Integer); cdecl;
    function _GetdalvikSharedDirty: Integer; cdecl;
    procedure _SetdalvikSharedDirty(Value: Integer); cdecl;
    function _GetnativePrivateDirty: Integer; cdecl;
    procedure _SetnativePrivateDirty(Value: Integer); cdecl;
    function _GetnativePss: Integer; cdecl;
    procedure _SetnativePss(Value: Integer); cdecl;
    function _GetnativeSharedDirty: Integer; cdecl;
    procedure _SetnativeSharedDirty(Value: Integer); cdecl;
    function _GetotherPrivateDirty: Integer; cdecl;
    procedure _SetotherPrivateDirty(Value: Integer); cdecl;
    function _GetotherPss: Integer; cdecl;
    procedure _SetotherPss(Value: Integer); cdecl;
    function _GetotherSharedDirty: Integer; cdecl;
    procedure _SetotherSharedDirty(Value: Integer); cdecl;
    function describeContents: Integer; cdecl;
    function getMemoryStat(statName: JString): JString; cdecl;
    function getMemoryStats: JMap; cdecl;
    function getTotalPrivateClean: Integer; cdecl;
    function getTotalPrivateDirty: Integer; cdecl;
    function getTotalPss: Integer; cdecl;
    function getTotalSharedClean: Integer; cdecl;
    function getTotalSharedDirty: Integer; cdecl;
    function getTotalSwappablePss: Integer; cdecl;
    procedure readFromParcel(source: JParcel); cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property dalvikPrivateDirty: Integer read _GetdalvikPrivateDirty write _SetdalvikPrivateDirty;
    property dalvikPss: Integer read _GetdalvikPss write _SetdalvikPss;
    property dalvikSharedDirty: Integer read _GetdalvikSharedDirty write _SetdalvikSharedDirty;
    property nativePrivateDirty: Integer read _GetnativePrivateDirty write _SetnativePrivateDirty;
    property nativePss: Integer read _GetnativePss write _SetnativePss;
    property nativeSharedDirty: Integer read _GetnativeSharedDirty write _SetnativeSharedDirty;
    property otherPrivateDirty: Integer read _GetotherPrivateDirty write _SetotherPrivateDirty;
    property otherPss: Integer read _GetotherPss write _SetotherPss;
    property otherSharedDirty: Integer read _GetotherSharedDirty write _SetotherSharedDirty;
  end;
  TJDebug_MemoryInfo = class(TJavaGenericImport<JDebug_MemoryInfoClass, JDebug_MemoryInfo>) end;

  JHandlerClass = interface(JObjectClass)
    ['{6DFA74DD-1C38-4654-A690-215B98106A9E}']
    {class} function init: JHandler; cdecl; overload;
    {class} function init(callback: JHandler_Callback): JHandler; cdecl; overload;
    {class} function init(looper: JLooper): JHandler; cdecl; overload;
    {class} function init(looper: JLooper; callback: JHandler_Callback): JHandler; cdecl; overload;
  end;

  [JavaSignature('android/os/Handler')]
  JHandler = interface(JObject)
    ['{9D5EF727-535C-41E1-8459-570107053097}']
    procedure dispatchMessage(msg: JMessage); cdecl;
    procedure dump(pw: JPrinter; prefix: JString); cdecl;
    function getLooper: JLooper; cdecl;
    function getMessageName(message: JMessage): JString; cdecl;
    procedure handleMessage(msg: JMessage); cdecl;
    function hasMessages(what: Integer): Boolean; cdecl; overload;
    function hasMessages(what: Integer; object_: JObject): Boolean; cdecl; overload;
    function obtainMessage: JMessage; cdecl; overload;
    function obtainMessage(what: Integer): JMessage; cdecl; overload;
    function obtainMessage(what: Integer; obj: JObject): JMessage; cdecl; overload;
    function obtainMessage(what: Integer; arg1: Integer; arg2: Integer): JMessage; cdecl; overload;
    function obtainMessage(what: Integer; arg1: Integer; arg2: Integer; obj: JObject): JMessage; cdecl; overload;
    function post(r: JRunnable): Boolean; cdecl;
    function postAtFrontOfQueue(r: JRunnable): Boolean; cdecl;
    function postAtTime(r: JRunnable; uptimeMillis: Int64): Boolean; cdecl; overload;
    function postAtTime(r: JRunnable; token: JObject; uptimeMillis: Int64): Boolean; cdecl; overload;
    function postDelayed(r: JRunnable; delayMillis: Int64): Boolean; cdecl;
    procedure removeCallbacks(r: JRunnable); cdecl; overload;
    procedure removeCallbacks(r: JRunnable; token: JObject); cdecl; overload;
    procedure removeCallbacksAndMessages(token: JObject); cdecl;
    procedure removeMessages(what: Integer); cdecl; overload;
    procedure removeMessages(what: Integer; object_: JObject); cdecl; overload;
    function sendEmptyMessage(what: Integer): Boolean; cdecl;
    function sendEmptyMessageAtTime(what: Integer; uptimeMillis: Int64): Boolean; cdecl;
    function sendEmptyMessageDelayed(what: Integer; delayMillis: Int64): Boolean; cdecl;
    function sendMessage(msg: JMessage): Boolean; cdecl;
    function sendMessageAtFrontOfQueue(msg: JMessage): Boolean; cdecl;
    function sendMessageAtTime(msg: JMessage; uptimeMillis: Int64): Boolean; cdecl;
    function sendMessageDelayed(msg: JMessage; delayMillis: Int64): Boolean; cdecl;
    function toString: JString; cdecl;
  end;
  TJHandler = class(TJavaGenericImport<JHandlerClass, JHandler>) end;

  JHandler_CallbackClass = interface(IJavaClass)
    ['{56610FAC-0DB7-4E6C-9DE7-34BC98A7CF57}']
  end;

  [JavaSignature('android/os/Handler$Callback')]
  JHandler_Callback = interface(IJavaInstance)
    ['{347B7489-1A0D-4B7E-BA98-26BF948DA15B}']
    function handleMessage(msg: JMessage): Boolean; cdecl;
  end;
  TJHandler_Callback = class(TJavaGenericImport<JHandler_CallbackClass, JHandler_Callback>) end;

  JIBinderClass = interface(IJavaClass)
    ['{39FDECDD-962B-44DB-80B1-BA608C7F6F22}']
    {class} function _GetDUMP_TRANSACTION: Integer; cdecl;
    {class} function _GetFIRST_CALL_TRANSACTION: Integer; cdecl;
    {class} function _GetFLAG_ONEWAY: Integer; cdecl;
    {class} function _GetINTERFACE_TRANSACTION: Integer; cdecl;
    {class} function _GetLAST_CALL_TRANSACTION: Integer; cdecl;
    {class} function _GetLIKE_TRANSACTION: Integer; cdecl;
    {class} function _GetPING_TRANSACTION: Integer; cdecl;
    {class} function _GetTWEET_TRANSACTION: Integer; cdecl;
    {class} property DUMP_TRANSACTION: Integer read _GetDUMP_TRANSACTION;
    {class} property FIRST_CALL_TRANSACTION: Integer read _GetFIRST_CALL_TRANSACTION;
    {class} property FLAG_ONEWAY: Integer read _GetFLAG_ONEWAY;
    {class} property INTERFACE_TRANSACTION: Integer read _GetINTERFACE_TRANSACTION;
    {class} property LAST_CALL_TRANSACTION: Integer read _GetLAST_CALL_TRANSACTION;
    {class} property LIKE_TRANSACTION: Integer read _GetLIKE_TRANSACTION;
    {class} property PING_TRANSACTION: Integer read _GetPING_TRANSACTION;
    {class} property TWEET_TRANSACTION: Integer read _GetTWEET_TRANSACTION;
  end;

  [JavaSignature('android/os/IBinder')]
  JIBinder = interface(IJavaInstance)
    ['{9DCFD46A-EA83-48EB-87BC-B18A3D9284E0}']
    procedure dump(fd: JFileDescriptor; args: TJavaObjectArray<JString>); cdecl;
    procedure dumpAsync(fd: JFileDescriptor; args: TJavaObjectArray<JString>); cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    function isBinderAlive: Boolean; cdecl;
    procedure linkToDeath(recipient: JIBinder_DeathRecipient; flags: Integer); cdecl;
    function pingBinder: Boolean; cdecl;
    function queryLocalInterface(descriptor: JString): JIInterface; cdecl;
    function transact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;
    function unlinkToDeath(recipient: JIBinder_DeathRecipient; flags: Integer): Boolean; cdecl;
  end;
  TJIBinder = class(TJavaGenericImport<JIBinderClass, JIBinder>) end;

  JIBinder_DeathRecipientClass = interface(IJavaClass)
    ['{0BB1DF5F-6D10-4BDE-B1FD-00479125622E}']
  end;

  [JavaSignature('android/os/IBinder$DeathRecipient')]
  JIBinder_DeathRecipient = interface(IJavaInstance)
    ['{C23CFA91-43FE-4E30-86C2-5F125D7F01E0}']
    procedure binderDied; cdecl;
  end;
  TJIBinder_DeathRecipient = class(TJavaGenericImport<JIBinder_DeathRecipientClass, JIBinder_DeathRecipient>) end;

  JIInterfaceClass = interface(IJavaClass)
    ['{5C536661-DE48-4AEF-B371-51FFBFB39875}']
  end;

  [JavaSignature('android/os/IInterface')]
  JIInterface = interface(IJavaInstance)
    ['{CCF0440C-DEDC-468C-952A-8EB7637E0E57}']
    function asBinder: JIBinder; cdecl;
  end;
  TJIInterface = class(TJavaGenericImport<JIInterfaceClass, JIInterface>) end;

  JLocaleListClass = interface(JObjectClass)
    ['{46C8C965-7921-43D7-B7F7-272946E90586}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function forLanguageTags(list: JString): JLocaleList; cdecl;
    {class} function getAdjustedDefault: JLocaleList; cdecl;
    {class} function getDefault: JLocaleList; cdecl;
    {class} function getEmptyLocaleList: JLocaleList; cdecl;
    {class} procedure setDefault(locales: JLocaleList); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/LocaleList')]
  JLocaleList = interface(JObject)
    ['{1BF27FFB-8F03-4E68-8831-B891DE2E2312}']
    function describeContents: Integer; cdecl;
    function equals(other: JObject): Boolean; cdecl;
    function &get(index: Integer): JLocale; cdecl;
    function getFirstMatch(supportedLocales: TJavaObjectArray<JString>): JLocale; cdecl;
    function hashCode: Integer; cdecl;
    function indexOf(locale: JLocale): Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function size: Integer; cdecl;
    function toLanguageTags: JString; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; parcelableFlags: Integer); cdecl;
  end;
  TJLocaleList = class(TJavaGenericImport<JLocaleListClass, JLocaleList>) end;

  JLooperClass = interface(JObjectClass)
    ['{EDF411AD-10E9-46B9-851F-0BF490BEBDEA}']
    {class} function getMainLooper: JLooper; cdecl;
    {class} procedure loop; cdecl;
    {class} function myLooper: JLooper; cdecl;
    {class} function myQueue: JMessageQueue; cdecl;
    {class} procedure prepare; cdecl;
    {class} procedure prepareMainLooper; cdecl;
  end;

  [JavaSignature('android/os/Looper')]
  JLooper = interface(JObject)
    ['{C7E0949B-044A-41EB-A38F-87D18DB4750E}']
    procedure dump(pw: JPrinter; prefix: JString); cdecl;
    function getQueue: JMessageQueue; cdecl;
    function getThread: JThread; cdecl;
    function isCurrentThread: Boolean; cdecl;
    procedure quit; cdecl;
    procedure quitSafely; cdecl;
    procedure setMessageLogging(printer: JPrinter); cdecl;
    function toString: JString; cdecl;
  end;
  TJLooper = class(TJavaGenericImport<JLooperClass, JLooper>) end;

  JMessageClass = interface(JObjectClass)
    ['{1B2538A8-B0AD-4E06-B2E5-80EF21543420}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JMessage; cdecl;
    {class} function obtain: JMessage; cdecl; overload;
    {class} function obtain(orig: JMessage): JMessage; cdecl; overload;
    {class} function obtain(h: JHandler): JMessage; cdecl; overload;
    {class} function obtain(h: JHandler; callback: JRunnable): JMessage; cdecl; overload;
    {class} function obtain(h: JHandler; what: Integer): JMessage; cdecl; overload;
    {class} function obtain(h: JHandler; what: Integer; obj: JObject): JMessage; cdecl; overload;
    {class} function obtain(h: JHandler; what: Integer; arg1: Integer; arg2: Integer): JMessage; cdecl; overload;
    {class} function obtain(h: JHandler; what: Integer; arg1: Integer; arg2: Integer; obj: JObject): JMessage; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/Message')]
  JMessage = interface(JObject)
    ['{6BD63150-99D3-4A77-A12D-41F00022009A}']
    function _Getarg1: Integer; cdecl;
    procedure _Setarg1(Value: Integer); cdecl;
    function _Getarg2: Integer; cdecl;
    procedure _Setarg2(Value: Integer); cdecl;
    function _Getobj: JObject; cdecl;
    procedure _Setobj(Value: JObject); cdecl;
    function _GetreplyTo: JMessenger; cdecl;
    procedure _SetreplyTo(Value: JMessenger); cdecl;
    function _GetsendingUid: Integer; cdecl;
    procedure _SetsendingUid(Value: Integer); cdecl;
    function _Getwhat: Integer; cdecl;
    procedure _Setwhat(Value: Integer); cdecl;
    procedure copyFrom(o: JMessage); cdecl;
    function describeContents: Integer; cdecl;
    function getCallback: JRunnable; cdecl;
    function getData: JBundle; cdecl;
    function getTarget: JHandler; cdecl;
    function getWhen: Int64; cdecl;
    function isAsynchronous: Boolean; cdecl;
    function peekData: JBundle; cdecl;
    procedure recycle; cdecl;
    procedure sendToTarget; cdecl;
    procedure setAsynchronous(async: Boolean); cdecl;
    procedure setData(data: JBundle); cdecl;
    procedure setTarget(target: JHandler); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
    property arg1: Integer read _Getarg1 write _Setarg1;
    property arg2: Integer read _Getarg2 write _Setarg2;
    property obj: JObject read _Getobj write _Setobj;
    property replyTo: JMessenger read _GetreplyTo write _SetreplyTo;
    property sendingUid: Integer read _GetsendingUid write _SetsendingUid;
    property what: Integer read _Getwhat write _Setwhat;
  end;
  TJMessage = class(TJavaGenericImport<JMessageClass, JMessage>) end;

  JMessageQueueClass = interface(JObjectClass)
    ['{C3690F20-6E73-4103-B86F-02B72CC58D9E}']
  end;

  [JavaSignature('android/os/MessageQueue')]
  JMessageQueue = interface(JObject)
    ['{73ED03E5-98F2-49F7-970D-B96D3B54F339}']
    procedure addIdleHandler(handler: JMessageQueue_IdleHandler); cdecl;
    procedure addOnFileDescriptorEventListener(fd: JFileDescriptor; events: Integer; listener: JMessageQueue_OnFileDescriptorEventListener); cdecl;
    function isIdle: Boolean; cdecl;
    procedure removeIdleHandler(handler: JMessageQueue_IdleHandler); cdecl;
    procedure removeOnFileDescriptorEventListener(fd: JFileDescriptor); cdecl;
  end;
  TJMessageQueue = class(TJavaGenericImport<JMessageQueueClass, JMessageQueue>) end;

  JMessageQueue_IdleHandlerClass = interface(IJavaClass)
    ['{5AA2B208-7429-47C2-824A-B9A94B306B83}']
  end;

  [JavaSignature('android/os/MessageQueue$IdleHandler')]
  JMessageQueue_IdleHandler = interface(IJavaInstance)
    ['{36B80D1E-6D2E-421C-A29D-E7435F3023DE}']
    function queueIdle: Boolean; cdecl;
  end;
  TJMessageQueue_IdleHandler = class(TJavaGenericImport<JMessageQueue_IdleHandlerClass, JMessageQueue_IdleHandler>) end;

  JMessageQueue_OnFileDescriptorEventListenerClass = interface(IJavaClass)
    ['{2B65AB49-2C3D-4520-8259-442A93E185C8}']
    {class} function _GetEVENT_ERROR: Integer; cdecl;
    {class} function _GetEVENT_INPUT: Integer; cdecl;
    {class} function _GetEVENT_OUTPUT: Integer; cdecl;
    {class} property EVENT_ERROR: Integer read _GetEVENT_ERROR;
    {class} property EVENT_INPUT: Integer read _GetEVENT_INPUT;
    {class} property EVENT_OUTPUT: Integer read _GetEVENT_OUTPUT;
  end;

  [JavaSignature('android/os/MessageQueue$OnFileDescriptorEventListener')]
  JMessageQueue_OnFileDescriptorEventListener = interface(IJavaInstance)
    ['{D23AA2CE-AE16-478A-A9D3-5EB63F3500E2}']
    function onFileDescriptorEvents(fd: JFileDescriptor; events: Integer): Integer; cdecl;
  end;
  TJMessageQueue_OnFileDescriptorEventListener = class(TJavaGenericImport<JMessageQueue_OnFileDescriptorEventListenerClass, JMessageQueue_OnFileDescriptorEventListener>) end;

  JMessengerClass = interface(JObjectClass)
    ['{F56C4382-C9CD-44C5-8FD9-ED57F2EB7020}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(target: JHandler): JMessenger; cdecl; overload;
    {class} function init(target: JIBinder): JMessenger; cdecl; overload;
    {class} function readMessengerOrNullFromParcel(in_: JParcel): JMessenger; cdecl;
    {class} procedure writeMessengerOrNullToParcel(messenger: JMessenger; out_: JParcel); cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/Messenger')]
  JMessenger = interface(JObject)
    ['{5DB42D38-8B04-4E46-BB40-71E75131EE34}']
    function describeContents: Integer; cdecl;
    function equals(otherObj: JObject): Boolean; cdecl;
    function getBinder: JIBinder; cdecl;
    function hashCode: Integer; cdecl;
    procedure send(message: JMessage); cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJMessenger = class(TJavaGenericImport<JMessengerClass, JMessenger>) end;

  JParcelClass = interface(JObjectClass)
    ['{4221C753-227D-4D4A-8F17-7897C2BD8870}']
    {class} function _GetSTRING_CREATOR: JParcelable_Creator; cdecl;
    {class} function obtain: JParcel; cdecl;
    {class} property STRING_CREATOR: JParcelable_Creator read _GetSTRING_CREATOR;
  end;

  [JavaSignature('android/os/Parcel')]
  JParcel = interface(JObject)
    ['{4E777D3D-D7CB-4157-9ED0-F956FB00B18E}']
    procedure appendFrom(parcel: JParcel; offset: Integer; length: Integer); cdecl;
    function createBinderArray: TJavaObjectArray<JIBinder>; cdecl;
    function createBinderArrayList: JArrayList; cdecl;
    function createBooleanArray: TJavaArray<Boolean>; cdecl;
    function createByteArray: TJavaArray<Byte>; cdecl;
    function createCharArray: TJavaArray<Char>; cdecl;
    function createDoubleArray: TJavaArray<Double>; cdecl;
    function createFloatArray: TJavaArray<Single>; cdecl;
    function createIntArray: TJavaArray<Integer>; cdecl;
    function createLongArray: TJavaArray<Int64>; cdecl;
    function createStringArray: TJavaObjectArray<JString>; cdecl;
    function createStringArrayList: JArrayList; cdecl;
    function createTypedArray(c: JParcelable_Creator): TJavaObjectArray<JObject>; cdecl;
    function createTypedArrayList(c: JParcelable_Creator): JArrayList; cdecl;
    function dataAvail: Integer; cdecl;
    function dataCapacity: Integer; cdecl;
    function dataPosition: Integer; cdecl;
    function dataSize: Integer; cdecl;
    procedure enforceInterface(interfaceName: JString); cdecl;
    function hasFileDescriptors: Boolean; cdecl;
    function marshall: TJavaArray<Byte>; cdecl;
    function readArray(loader: JClassLoader): TJavaObjectArray<JObject>; cdecl;
    function readArrayList(loader: JClassLoader): JArrayList; cdecl;
    procedure readBinderArray(val: TJavaObjectArray<JIBinder>); cdecl;
    procedure readBinderList(list: JList); cdecl;
    procedure readBooleanArray(val: TJavaArray<Boolean>); cdecl;
    function readBundle: JBundle; cdecl; overload;
    function readBundle(loader: JClassLoader): JBundle; cdecl; overload;
    function readByte: Byte; cdecl;
    procedure readByteArray(val: TJavaArray<Byte>); cdecl;
    procedure readCharArray(val: TJavaArray<Char>); cdecl;
    function readDouble: Double; cdecl;
    procedure readDoubleArray(val: TJavaArray<Double>); cdecl;
    procedure readException; cdecl; overload;
    procedure readException(code: Integer; msg: JString); cdecl; overload;
    function readFileDescriptor: JParcelFileDescriptor; cdecl;
    function readFloat: Single; cdecl;
    procedure readFloatArray(val: TJavaArray<Single>); cdecl;
    function readHashMap(loader: JClassLoader): JHashMap; cdecl;
    function readInt: Integer; cdecl;
    procedure readIntArray(val: TJavaArray<Integer>); cdecl;
    procedure readList(outVal: JList; loader: JClassLoader); cdecl;
    function readLong: Int64; cdecl;
    procedure readLongArray(val: TJavaArray<Int64>); cdecl;
    procedure readMap(outVal: JMap; loader: JClassLoader); cdecl;
    function readParcelable(loader: JClassLoader): JParcelable; cdecl;
    function readParcelableArray(loader: JClassLoader): TJavaObjectArray<JParcelable>; cdecl;
    function readPersistableBundle: JPersistableBundle; cdecl; overload;
    function readPersistableBundle(loader: JClassLoader): JPersistableBundle; cdecl; overload;
    function readSerializable: JSerializable; cdecl;
    function readSize: Jutil_Size; cdecl;
    function readSizeF: JSizeF; cdecl;
    function readSparseArray(loader: JClassLoader): JSparseArray; cdecl;
    function readSparseBooleanArray: JSparseBooleanArray; cdecl;
    function readString: JString; cdecl;
    procedure readStringArray(val: TJavaObjectArray<JString>); cdecl;
    procedure readStringList(list: JList); cdecl;
    function readStrongBinder: JIBinder; cdecl;
    procedure readTypedArray(val: TJavaObjectArray<JObject>; c: JParcelable_Creator); cdecl;
    procedure readTypedList(list: JList; c: JParcelable_Creator); cdecl;
    function readTypedObject(c: JParcelable_Creator): JObject; cdecl;
    function readValue(loader: JClassLoader): JObject; cdecl;
    procedure recycle; cdecl;
    procedure setDataCapacity(size: Integer); cdecl;
    procedure setDataPosition(pos: Integer); cdecl;
    procedure setDataSize(size: Integer); cdecl;
    procedure unmarshall(data: TJavaArray<Byte>; offset: Integer; length: Integer); cdecl;
    procedure writeArray(val: TJavaObjectArray<JObject>); cdecl;
    procedure writeBinderArray(val: TJavaObjectArray<JIBinder>); cdecl;
    procedure writeBinderList(val: JList); cdecl;
    procedure writeBooleanArray(val: TJavaArray<Boolean>); cdecl;
    procedure writeBundle(val: JBundle); cdecl;
    procedure writeByte(val: Byte); cdecl;
    procedure writeByteArray(b: TJavaArray<Byte>); cdecl; overload;
    procedure writeByteArray(b: TJavaArray<Byte>; offset: Integer; len: Integer); cdecl; overload;
    procedure writeCharArray(val: TJavaArray<Char>); cdecl;
    procedure writeDouble(val: Double); cdecl;
    procedure writeDoubleArray(val: TJavaArray<Double>); cdecl;
    procedure writeException(e: JException); cdecl;
    procedure writeFileDescriptor(val: JFileDescriptor); cdecl;
    procedure writeFloat(val: Single); cdecl;
    procedure writeFloatArray(val: TJavaArray<Single>); cdecl;
    procedure writeInt(val: Integer); cdecl;
    procedure writeIntArray(val: TJavaArray<Integer>); cdecl;
    procedure writeInterfaceToken(interfaceName: JString); cdecl;
    procedure writeList(val: JList); cdecl;
    procedure writeLong(val: Int64); cdecl;
    procedure writeLongArray(val: TJavaArray<Int64>); cdecl;
    procedure writeMap(val: JMap); cdecl;
    procedure writeNoException; cdecl;
    procedure writeParcelable(p: JParcelable; parcelableFlags: Integer); cdecl;
    procedure writeParcelableArray(value: TJavaObjectArray<JParcelable>; parcelableFlags: Integer); cdecl;
    procedure writePersistableBundle(val: JPersistableBundle); cdecl;
    procedure writeSerializable(s: JSerializable); cdecl;
    procedure writeSize(val: Jutil_Size); cdecl;
    procedure writeSizeF(val: JSizeF); cdecl;
    procedure writeSparseArray(val: JSparseArray); cdecl;
    procedure writeSparseBooleanArray(val: JSparseBooleanArray); cdecl;
    procedure writeString(val: JString); cdecl;
    procedure writeStringArray(val: TJavaObjectArray<JString>); cdecl;
    procedure writeStringList(val: JList); cdecl;
    procedure writeStrongBinder(val: JIBinder); cdecl;
    procedure writeStrongInterface(val: JIInterface); cdecl;
    procedure writeTypedArray(val: TJavaObjectArray<JParcelable>; parcelableFlags: Integer); cdecl;
    procedure writeTypedList(val: JList); cdecl;
    procedure writeTypedObject(val: JParcelable; parcelableFlags: Integer); cdecl;
    procedure writeValue(v: JObject); cdecl;
  end;
  TJParcel = class(TJavaGenericImport<JParcelClass, JParcel>) end;

  JParcelFileDescriptorClass = interface(JObjectClass)
    ['{FFBFF8DF-F6F4-4EB2-A73D-0B2E753BD03D}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetMODE_APPEND: Integer; cdecl;
    {class} function _GetMODE_CREATE: Integer; cdecl;
    {class} function _GetMODE_READ_ONLY: Integer; cdecl;
    {class} function _GetMODE_READ_WRITE: Integer; cdecl;
    {class} function _GetMODE_TRUNCATE: Integer; cdecl;
    {class} function _GetMODE_WORLD_READABLE: Integer; cdecl;
    {class} function _GetMODE_WORLD_WRITEABLE: Integer; cdecl;
    {class} function _GetMODE_WRITE_ONLY: Integer; cdecl;
    {class} function init(wrapped: JParcelFileDescriptor): JParcelFileDescriptor; cdecl;
    {class} function adoptFd(fd: Integer): JParcelFileDescriptor; cdecl;
    {class} function createPipe: TJavaObjectArray<JParcelFileDescriptor>; cdecl;
    {class} function createReliablePipe: TJavaObjectArray<JParcelFileDescriptor>; cdecl;
    {class} function createReliableSocketPair: TJavaObjectArray<JParcelFileDescriptor>; cdecl;
    {class} function createSocketPair: TJavaObjectArray<JParcelFileDescriptor>; cdecl;
    {class} function dup(orig: JFileDescriptor): JParcelFileDescriptor; cdecl; overload;
    {class} //function fromDatagramSocket(datagramSocket: JDatagramSocket): JParcelFileDescriptor; cdecl;
    {class} function fromFd(fd: Integer): JParcelFileDescriptor; cdecl;
    {class} //function fromSocket(socket: JSocket): JParcelFileDescriptor; cdecl;
    {class} function open(file_: JFile; mode: Integer): JParcelFileDescriptor; cdecl; overload;
    {class} function open(file_: JFile; mode: Integer; handler: JHandler; listener: JParcelFileDescriptor_OnCloseListener): JParcelFileDescriptor; cdecl; overload;
    {class} function parseMode(mode: JString): Integer; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property MODE_APPEND: Integer read _GetMODE_APPEND;
    {class} property MODE_CREATE: Integer read _GetMODE_CREATE;
    {class} property MODE_READ_ONLY: Integer read _GetMODE_READ_ONLY;
    {class} property MODE_READ_WRITE: Integer read _GetMODE_READ_WRITE;
    {class} property MODE_TRUNCATE: Integer read _GetMODE_TRUNCATE;
    {class} property MODE_WORLD_READABLE: Integer read _GetMODE_WORLD_READABLE;
    {class} property MODE_WORLD_WRITEABLE: Integer read _GetMODE_WORLD_WRITEABLE;
    {class} property MODE_WRITE_ONLY: Integer read _GetMODE_WRITE_ONLY;
  end;

  [JavaSignature('android/os/ParcelFileDescriptor')]
  JParcelFileDescriptor = interface(JObject)
    ['{C1A682AA-6579-416E-868E-C951ED8FB338}']
    function canDetectErrors: Boolean; cdecl;
    procedure checkError; cdecl;
    procedure close; cdecl;
    procedure closeWithError(msg: JString); cdecl;
    function describeContents: Integer; cdecl;
    function detachFd: Integer; cdecl;
    function dup: JParcelFileDescriptor; cdecl; overload;
    function getFd: Integer; cdecl;
    function getFileDescriptor: JFileDescriptor; cdecl;
    function getStatSize: Int64; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJParcelFileDescriptor = class(TJavaGenericImport<JParcelFileDescriptorClass, JParcelFileDescriptor>) end;

  JParcelFileDescriptor_AutoCloseInputStreamClass = interface(JFileInputStreamClass)
    ['{5C32589D-9078-47EE-9BCC-B7E2C587ACEF}']
    {class} function init(pfd: JParcelFileDescriptor): JParcelFileDescriptor_AutoCloseInputStream; cdecl;
  end;

  [JavaSignature('android/os/ParcelFileDescriptor$AutoCloseInputStream')]
  JParcelFileDescriptor_AutoCloseInputStream = interface(JFileInputStream)
    ['{28B7EEA4-CA6D-4565-AF0B-9AA87233C96B}']
    procedure close; cdecl;
    function read: Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>): Integer; cdecl; overload;
    function read(b: TJavaArray<Byte>; off: Integer; len: Integer): Integer; cdecl; overload;
  end;
  TJParcelFileDescriptor_AutoCloseInputStream = class(TJavaGenericImport<JParcelFileDescriptor_AutoCloseInputStreamClass, JParcelFileDescriptor_AutoCloseInputStream>) end;

  JParcelFileDescriptor_AutoCloseOutputStreamClass = interface(JFileOutputStreamClass)
    ['{3DA3CB8C-5AF5-4ACD-915D-6BB844D37AC5}']
    {class} function init(pfd: JParcelFileDescriptor): JParcelFileDescriptor_AutoCloseOutputStream; cdecl;
  end;

  [JavaSignature('android/os/ParcelFileDescriptor$AutoCloseOutputStream')]
  JParcelFileDescriptor_AutoCloseOutputStream = interface(JFileOutputStream)
    ['{AC268DEA-CB4A-49D1-B14B-78950AD93E4F}']
    procedure close; cdecl;
  end;
  TJParcelFileDescriptor_AutoCloseOutputStream = class(TJavaGenericImport<JParcelFileDescriptor_AutoCloseOutputStreamClass, JParcelFileDescriptor_AutoCloseOutputStream>) end;

  JParcelFileDescriptor_OnCloseListenerClass = interface(IJavaClass)
    ['{F7A3B73F-80F9-4DD2-8B9D-4C0F6A3C9765}']
  end;

  [JavaSignature('android/os/ParcelFileDescriptor$OnCloseListener')]
  JParcelFileDescriptor_OnCloseListener = interface(IJavaInstance)
    ['{B2ED31DD-67CA-4981-8707-B3B002F38505}']
    procedure onClose(e: JIOException); cdecl;
  end;
  TJParcelFileDescriptor_OnCloseListener = class(TJavaGenericImport<JParcelFileDescriptor_OnCloseListenerClass, JParcelFileDescriptor_OnCloseListener>) end;

  JParcelUuidClass = interface(JObjectClass)
    ['{4AE7B935-7452-4EDB-B8D9-51A90A45DD54}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(uuid: JUUID): JParcelUuid; cdecl;
    {class} function fromString(uuid: JString): JParcelUuid; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/ParcelUuid')]
  JParcelUuid = interface(JObject)
    ['{B6E17AEC-B949-4660-820B-D09DE86EB7EA}']
    function describeContents: Integer; cdecl;
    function equals(object_: JObject): Boolean; cdecl;
    function getUuid: JUUID; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJParcelUuid = class(TJavaGenericImport<JParcelUuidClass, JParcelUuid>) end;

  JParcelableClass = interface(IJavaClass)
    ['{C4028E29-2B61-4CBE-86B0-E7AEB7DB6073}']
    {class} function _GetCONTENTS_FILE_DESCRIPTOR: Integer; cdecl;
    {class} function _GetPARCELABLE_WRITE_RETURN_VALUE: Integer; cdecl;
    {class} property CONTENTS_FILE_DESCRIPTOR: Integer read _GetCONTENTS_FILE_DESCRIPTOR;
    {class} property PARCELABLE_WRITE_RETURN_VALUE: Integer read _GetPARCELABLE_WRITE_RETURN_VALUE;
  end;

  [JavaSignature('android/os/Parcelable')]
  JParcelable = interface(IJavaInstance)
    ['{60865491-0B26-486B-A5EA-F137A0408CFD}']
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJParcelable = class(TJavaGenericImport<JParcelableClass, JParcelable>) end;

  JParcelable_CreatorClass = interface(IJavaClass)
    ['{BDBDE50C-1639-42B7-8880-F0DE45C12CE1}']
  end;

  [JavaSignature('android/os/Parcelable$Creator')]
  JParcelable_Creator = interface(IJavaInstance)
    ['{A2263E47-9FD8-4553-B31B-9EBB64A04843}']
    function createFromParcel(source: JParcel): JObject; cdecl;
    function newArray(size: Integer): TJavaObjectArray<JObject>; cdecl;
  end;
  TJParcelable_Creator = class(TJavaGenericImport<JParcelable_CreatorClass, JParcelable_Creator>) end;

  JParcelable_ClassLoaderCreatorClass = interface(JParcelable_CreatorClass)
    ['{AD975D2E-9776-4FED-8213-81FA6C89A7BA}']
  end;

  [JavaSignature('android/os/Parcelable$ClassLoaderCreator')]
  JParcelable_ClassLoaderCreator = interface(JParcelable_Creator)
    ['{FCAFEC5F-1CCE-4991-B75D-9376254D7E15}']
    function createFromParcel(source: JParcel; loader: JClassLoader): JObject; cdecl;
  end;
  TJParcelable_ClassLoaderCreator = class(TJavaGenericImport<JParcelable_ClassLoaderCreatorClass, JParcelable_ClassLoaderCreator>) end;

  JPatternMatcherClass = interface(JObjectClass)
    ['{5531BAAE-118E-44DB-8296-A24A9DCC4B84}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetPATTERN_ADVANCED_GLOB: Integer; cdecl;
    {class} function _GetPATTERN_LITERAL: Integer; cdecl;
    {class} function _GetPATTERN_PREFIX: Integer; cdecl;
    {class} function _GetPATTERN_SIMPLE_GLOB: Integer; cdecl;
    {class} function init(pattern: JString; type_: Integer): JPatternMatcher; cdecl; overload;
    {class} function init(src: JParcel): JPatternMatcher; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property PATTERN_ADVANCED_GLOB: Integer read _GetPATTERN_ADVANCED_GLOB;
    {class} property PATTERN_LITERAL: Integer read _GetPATTERN_LITERAL;
    {class} property PATTERN_PREFIX: Integer read _GetPATTERN_PREFIX;
    {class} property PATTERN_SIMPLE_GLOB: Integer read _GetPATTERN_SIMPLE_GLOB;
  end;

  [JavaSignature('android/os/PatternMatcher')]
  JPatternMatcher = interface(JObject)
    ['{FDB6AB90-AA53-4B07-A28D-9BD3FD65AF85}']
    function describeContents: Integer; cdecl;
    function getPath: JString; cdecl;
    function getType: Integer; cdecl;
    function match(str: JString): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJPatternMatcher = class(TJavaGenericImport<JPatternMatcherClass, JPatternMatcher>) end;

  JPersistableBundleClass = interface(JBaseBundleClass)
    ['{2B8F5539-AC2A-45D5-8370-6E34C5EA659E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetEMPTY: JPersistableBundle; cdecl;
    {class} function init: JPersistableBundle; cdecl; overload;
    {class} function init(capacity: Integer): JPersistableBundle; cdecl; overload;
    {class} function init(b: JPersistableBundle): JPersistableBundle; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property EMPTY: JPersistableBundle read _GetEMPTY;
  end;

  [JavaSignature('android/os/PersistableBundle')]
  JPersistableBundle = interface(JBaseBundle)
    ['{077D0418-0AF5-4175-A444-A5A5D2F26924}']
    function clone: JObject; cdecl;
    function deepCopy: JPersistableBundle; cdecl;
    function describeContents: Integer; cdecl;
    function getPersistableBundle(key: JString): JPersistableBundle; cdecl;
    procedure putPersistableBundle(key: JString; value: JPersistableBundle); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(parcel: JParcel; flags: Integer); cdecl;
  end;
  TJPersistableBundle = class(TJavaGenericImport<JPersistableBundleClass, JPersistableBundle>) end;

  JPowerManagerClass = interface(JObjectClass)
    ['{E4AC8BDC-18D1-42AA-84A3-A1ACEAAEDAEF}']
    {class} function _GetACQUIRE_CAUSES_WAKEUP: Integer; cdecl;
    {class} function _GetACTION_DEVICE_IDLE_MODE_CHANGED: JString; cdecl;
    {class} function _GetACTION_POWER_SAVE_MODE_CHANGED: JString; cdecl;
    {class} function _GetFULL_WAKE_LOCK: Integer; cdecl;
    {class} function _GetON_AFTER_RELEASE: Integer; cdecl;
    {class} function _GetPARTIAL_WAKE_LOCK: Integer; cdecl;
    {class} function _GetPROXIMITY_SCREEN_OFF_WAKE_LOCK: Integer; cdecl;
    {class} function _GetRELEASE_FLAG_WAIT_FOR_NO_PROXIMITY: Integer; cdecl;
    {class} function _GetSCREEN_BRIGHT_WAKE_LOCK: Integer; cdecl;
    {class} function _GetSCREEN_DIM_WAKE_LOCK: Integer; cdecl;
    {class} property ACQUIRE_CAUSES_WAKEUP: Integer read _GetACQUIRE_CAUSES_WAKEUP;
    {class} property ACTION_DEVICE_IDLE_MODE_CHANGED: JString read _GetACTION_DEVICE_IDLE_MODE_CHANGED;
    {class} property ACTION_POWER_SAVE_MODE_CHANGED: JString read _GetACTION_POWER_SAVE_MODE_CHANGED;
    {class} property FULL_WAKE_LOCK: Integer read _GetFULL_WAKE_LOCK;
    {class} property ON_AFTER_RELEASE: Integer read _GetON_AFTER_RELEASE;
    {class} property PARTIAL_WAKE_LOCK: Integer read _GetPARTIAL_WAKE_LOCK;
    {class} property PROXIMITY_SCREEN_OFF_WAKE_LOCK: Integer read _GetPROXIMITY_SCREEN_OFF_WAKE_LOCK;
    {class} property RELEASE_FLAG_WAIT_FOR_NO_PROXIMITY: Integer read _GetRELEASE_FLAG_WAIT_FOR_NO_PROXIMITY;
    {class} property SCREEN_BRIGHT_WAKE_LOCK: Integer read _GetSCREEN_BRIGHT_WAKE_LOCK;
    {class} property SCREEN_DIM_WAKE_LOCK: Integer read _GetSCREEN_DIM_WAKE_LOCK;
  end;

  [JavaSignature('android/os/PowerManager')]
  JPowerManager = interface(JObject)
    ['{53E56DDD-6061-438E-9C19-ECDE3B32FE22}']
    procedure goToSleep(time: Int64); cdecl;
    function isDeviceIdleMode: Boolean; cdecl;
    function isIgnoringBatteryOptimizations(packageName: JString): Boolean; cdecl;
    function isInteractive: Boolean; cdecl;
    function isPowerSaveMode: Boolean; cdecl;
    function isScreenOn: Boolean; cdecl;//Deprecated
    function isSustainedPerformanceModeSupported: Boolean; cdecl;
    function isWakeLockLevelSupported(level: Integer): Boolean; cdecl;
    function newWakeLock(levelAndFlags: Integer; tag: JString): JPowerManager_WakeLock; cdecl;
    procedure reboot(reason: JString); cdecl;
    procedure userActivity(when: Int64; noChangeLights: Boolean); cdecl;//Deprecated
    procedure wakeUp(time: Int64); cdecl;
  end;
  TJPowerManager = class(TJavaGenericImport<JPowerManagerClass, JPowerManager>) end;

  JPowerManager_WakeLockClass = interface(JObjectClass)
    ['{DA204013-460E-4CE5-B77E-772870E53853}']
  end;

  [JavaSignature('android/os/PowerManager$WakeLock')]
  JPowerManager_WakeLock = interface(JObject)
    ['{944B58EB-1BDA-403B-AF6F-D37E07CFE914}']
    procedure acquire; cdecl; overload;
    procedure acquire(timeout: Int64); cdecl; overload;
    function isHeld: Boolean; cdecl;
    procedure release; cdecl; overload;
    procedure release(flags: Integer); cdecl; overload;
    procedure setReferenceCounted(value: Boolean); cdecl;
    procedure setWorkSource(ws: JWorkSource); cdecl;
    function toString: JString; cdecl;
  end;
  TJPowerManager_WakeLock = class(TJavaGenericImport<JPowerManager_WakeLockClass, JPowerManager_WakeLock>) end;

  JRemoteExceptionClass = interface(JAndroidExceptionClass)
    ['{51B4919C-703A-41F5-B1E4-9BA4BAA4139A}']
    {class} function init: JRemoteException; cdecl; overload;
    {class} function init(message: JString): JRemoteException; cdecl; overload;
  end;

  [JavaSignature('android/os/RemoteException')]
  JRemoteException = interface(JAndroidException)
    ['{D75584EB-7EF7-444D-B989-C9487675E1ED}']
  end;
  TJRemoteException = class(TJavaGenericImport<JRemoteExceptionClass, JRemoteException>) end;

  JResultReceiverClass = interface(JObjectClass)
    ['{590CF4A2-8625-4919-A054-77EC93C5981E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(handler: JHandler): JResultReceiver; cdecl;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/ResultReceiver')]
  JResultReceiver = interface(JObject)
    ['{BBFBBD02-25B2-49B9-B441-CFB8DF3AA9C5}']
    function describeContents: Integer; cdecl;
    procedure send(resultCode: Integer; resultData: JBundle); cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl;
  end;
  TJResultReceiver = class(TJavaGenericImport<JResultReceiverClass, JResultReceiver>) end;

  JUserHandleClass = interface(JObjectClass)
    ['{FF26D134-0260-4F44-A103-45FECCA03842}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init(in_: JParcel): JUserHandle; cdecl;
    {class} function getUserHandleForUid(uid: Integer): JUserHandle; cdecl;
    {class} function readFromParcel(in_: JParcel): JUserHandle; cdecl;
    {class} procedure writeToParcel(h: JUserHandle; out_: JParcel); cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/UserHandle')]
  JUserHandle = interface(JObject)
    ['{77D557B7-B984-434F-93A1-19407712B375}']
    function describeContents: Integer; cdecl;
    function equals(obj: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(out_: JParcel; flags: Integer); cdecl; overload;
  end;
  TJUserHandle = class(TJavaGenericImport<JUserHandleClass, JUserHandle>) end;

  JVibrationEffectClass = interface(JObjectClass)
    ['{9F0674B4-6A70-43B8-9BD8-B2D87E90F796}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function _GetDEFAULT_AMPLITUDE: Integer; cdecl;
    {class} function createOneShot(milliseconds: Int64; amplitude: Integer): JVibrationEffect; cdecl;
    {class} function createWaveform(timings: TJavaArray<Int64>; repeat_: Integer): JVibrationEffect; cdecl; overload;
    {class} function createWaveform(timings: TJavaArray<Int64>; amplitudes: TJavaArray<Integer>; repeat_: Integer): JVibrationEffect; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
    {class} property DEFAULT_AMPLITUDE: Integer read _GetDEFAULT_AMPLITUDE;
  end;

  [JavaSignature('android/os/VibrationEffect')]
  JVibrationEffect = interface(JObject)
    ['{E0D8404E-FAD6-41BF-9498-1D216E6252A6}']
    function describeContents: Integer; cdecl;
  end;
  TJVibrationEffect = class(TJavaGenericImport<JVibrationEffectClass, JVibrationEffect>) end;

  JVibratorClass = interface(JObjectClass)
    ['{00EEB92F-8145-441D-81C3-218E7B271F1B}']
  end;

  [JavaSignature('android/os/Vibrator')]
  JVibrator = interface(JObject)
    ['{82BDC8BC-22A3-4EAD-99AF-5DA70739B086}']
    procedure cancel; cdecl;
    function hasAmplitudeControl: Boolean; cdecl;
    function hasVibrator: Boolean; cdecl;
    procedure vibrate(milliseconds: Int64); cdecl; overload;//Deprecated
    //procedure vibrate(milliseconds: Int64; attributes: JAudioAttributes); cdecl; overload;//Deprecated
    procedure vibrate(pattern: TJavaArray<Int64>; repeat_: Integer); cdecl; overload;//Deprecated
    //procedure vibrate(pattern: TJavaArray<Int64>; repeat_: Integer; attributes: JAudioAttributes); cdecl; overload;//Deprecated
    procedure vibrate(vibe: JVibrationEffect); cdecl; overload;
    //procedure vibrate(vibe: JVibrationEffect; attributes: JAudioAttributes); cdecl; overload;
  end;
  TJVibrator = class(TJavaGenericImport<JVibratorClass, JVibrator>) end;

  JWorkSourceClass = interface(JObjectClass)
    ['{9910D5A2-6162-4A96-B8F3-C5DC531FE31E}']
    {class} function _GetCREATOR: JParcelable_Creator; cdecl;
    {class} function init: JWorkSource; cdecl; overload;
    {class} function init(orig: JWorkSource): JWorkSource; cdecl; overload;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('android/os/WorkSource')]
  JWorkSource = interface(JObject)
    ['{04F85B42-2599-4F09-AB20-D4996613853E}']
    function add(other: JWorkSource): Boolean; cdecl;
    procedure clear; cdecl;
    function describeContents: Integer; cdecl;
    function diff(other: JWorkSource): Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function remove(other: JWorkSource): Boolean; cdecl;
    procedure &set(other: JWorkSource); cdecl;
    function toString: JString; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;
  end;
  TJWorkSource = class(TJavaGenericImport<JWorkSourceClass, JWorkSource>) end;

  JOnObbStateChangeListenerClass = interface(JObjectClass)
    ['{3CD1E5E4-4025-43F4-9078-A0AA40F574F6}']
    {class} function _GetERROR_ALREADY_MOUNTED: Integer; cdecl;
    {class} function _GetERROR_COULD_NOT_MOUNT: Integer; cdecl;
    {class} function _GetERROR_COULD_NOT_UNMOUNT: Integer; cdecl;
    {class} function _GetERROR_INTERNAL: Integer; cdecl;
    {class} function _GetERROR_NOT_MOUNTED: Integer; cdecl;
    {class} function _GetERROR_PERMISSION_DENIED: Integer; cdecl;
    {class} function _GetMOUNTED: Integer; cdecl;
    {class} function _GetUNMOUNTED: Integer; cdecl;
    {class} function init: JOnObbStateChangeListener; cdecl;
    {class} property ERROR_ALREADY_MOUNTED: Integer read _GetERROR_ALREADY_MOUNTED;
    {class} property ERROR_COULD_NOT_MOUNT: Integer read _GetERROR_COULD_NOT_MOUNT;
    {class} property ERROR_COULD_NOT_UNMOUNT: Integer read _GetERROR_COULD_NOT_UNMOUNT;
    {class} property ERROR_INTERNAL: Integer read _GetERROR_INTERNAL;
    {class} property ERROR_NOT_MOUNTED: Integer read _GetERROR_NOT_MOUNTED;
    {class} property ERROR_PERMISSION_DENIED: Integer read _GetERROR_PERMISSION_DENIED;
    {class} property MOUNTED: Integer read _GetMOUNTED;
    {class} property UNMOUNTED: Integer read _GetUNMOUNTED;
  end;

  [JavaSignature('android/os/storage/OnObbStateChangeListener')]
  JOnObbStateChangeListener = interface(JObject)
    ['{7B0E93C5-9C0A-445D-9CCB-6428BAE64C52}']
    procedure onObbStateChange(path: JString; state: Integer); cdecl;
  end;
  TJOnObbStateChangeListener = class(TJavaGenericImport<JOnObbStateChangeListenerClass, JOnObbStateChangeListener>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Os.JManifest', TypeInfo(Androidapi.JNI.Os.JManifest));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JManifest_permission', TypeInfo(Androidapi.JNI.Os.JManifest_permission));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JManifest_permission_group', TypeInfo(Androidapi.JNI.Os.JManifest_permission_group));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JBaseBundle', TypeInfo(Androidapi.JNI.Os.JBaseBundle));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JBinder', TypeInfo(Androidapi.JNI.Os.JBinder));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JBuild', TypeInfo(Androidapi.JNI.Os.JBuild));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JBuild_VERSION', TypeInfo(Androidapi.JNI.Os.JBuild_VERSION));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JBuild_VERSION_CODES', TypeInfo(Androidapi.JNI.Os.JBuild_VERSION_CODES));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JBundle', TypeInfo(Androidapi.JNI.Os.JBundle));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JCancellationSignal', TypeInfo(Androidapi.JNI.Os.JCancellationSignal));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JCancellationSignal_OnCancelListener', TypeInfo(Androidapi.JNI.Os.JCancellationSignal_OnCancelListener));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JDebug_MemoryInfo', TypeInfo(Androidapi.JNI.Os.JDebug_MemoryInfo));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JHandler', TypeInfo(Androidapi.JNI.Os.JHandler));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JHandler_Callback', TypeInfo(Androidapi.JNI.Os.JHandler_Callback));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JIBinder', TypeInfo(Androidapi.JNI.Os.JIBinder));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JIBinder_DeathRecipient', TypeInfo(Androidapi.JNI.Os.JIBinder_DeathRecipient));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JIInterface', TypeInfo(Androidapi.JNI.Os.JIInterface));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JLocaleList', TypeInfo(Androidapi.JNI.Os.JLocaleList));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JLooper', TypeInfo(Androidapi.JNI.Os.JLooper));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JMessage', TypeInfo(Androidapi.JNI.Os.JMessage));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JMessageQueue', TypeInfo(Androidapi.JNI.Os.JMessageQueue));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JMessageQueue_IdleHandler', TypeInfo(Androidapi.JNI.Os.JMessageQueue_IdleHandler));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JMessageQueue_OnFileDescriptorEventListener', TypeInfo(Androidapi.JNI.Os.JMessageQueue_OnFileDescriptorEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JMessenger', TypeInfo(Androidapi.JNI.Os.JMessenger));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcel', TypeInfo(Androidapi.JNI.Os.JParcel));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelFileDescriptor', TypeInfo(Androidapi.JNI.Os.JParcelFileDescriptor));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelFileDescriptor_AutoCloseInputStream', TypeInfo(Androidapi.JNI.Os.JParcelFileDescriptor_AutoCloseInputStream));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelFileDescriptor_AutoCloseOutputStream', TypeInfo(Androidapi.JNI.Os.JParcelFileDescriptor_AutoCloseOutputStream));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelFileDescriptor_OnCloseListener', TypeInfo(Androidapi.JNI.Os.JParcelFileDescriptor_OnCloseListener));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelUuid', TypeInfo(Androidapi.JNI.Os.JParcelUuid));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelable', TypeInfo(Androidapi.JNI.Os.JParcelable));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelable_Creator', TypeInfo(Androidapi.JNI.Os.JParcelable_Creator));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JParcelable_ClassLoaderCreator', TypeInfo(Androidapi.JNI.Os.JParcelable_ClassLoaderCreator));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JPatternMatcher', TypeInfo(Androidapi.JNI.Os.JPatternMatcher));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JPersistableBundle', TypeInfo(Androidapi.JNI.Os.JPersistableBundle));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JPowerManager', TypeInfo(Androidapi.JNI.Os.JPowerManager));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JPowerManager_WakeLock', TypeInfo(Androidapi.JNI.Os.JPowerManager_WakeLock));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JRemoteException', TypeInfo(Androidapi.JNI.Os.JRemoteException));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JResultReceiver', TypeInfo(Androidapi.JNI.Os.JResultReceiver));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JUserHandle', TypeInfo(Androidapi.JNI.Os.JUserHandle));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JVibrationEffect', TypeInfo(Androidapi.JNI.Os.JVibrationEffect));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JVibrator', TypeInfo(Androidapi.JNI.Os.JVibrator));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JWorkSource', TypeInfo(Androidapi.JNI.Os.JWorkSource));
  TRegTypes.RegisterType('Androidapi.JNI.Os.JOnObbStateChangeListener', TypeInfo(Androidapi.JNI.Os.JOnObbStateChangeListener));
end;

initialization
  RegisterTypes;
end.


