{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.UI;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Foundation, 
  Winapi.Security.Credentials, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.IReference`1<Windows.UI.Color>
  IReference_1__Color = interface;
  PIReference_1__Color = ^IReference_1__Color;

  // Windows.UI.Shell.IAdaptiveCard
  Shell_IAdaptiveCard = interface;
  PShell_IAdaptiveCard = ^Shell_IAdaptiveCard;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIKeyValuePair_2__HSTRING__IInspectable = ^IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterator_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterable_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface;
  PIMapView_2__HSTRING__IInspectable = ^IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface;
  PIMap_2__HSTRING__IInspectable = ^IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface;
  PIMapChangedEventArgs_1__HSTRING = ^IMapChangedEventArgs_1__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface;
  PMapChangedEventHandler_2__HSTRING__IInspectable = ^MapChangedEventHandler_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface;
  PIObservableMap_2__HSTRING__IInspectable = ^IObservableMap_2__HSTRING__IInspectable;

  // Windows.UI.Popups.UICommandInvokedHandler
  Popups_UICommandInvokedHandler = interface;
  PPopups_UICommandInvokedHandler = ^Popups_UICommandInvokedHandler;

  // Windows.UI.Popups.IUICommand
  Popups_IUICommand = interface;
  PPopups_IUICommand = ^Popups_IUICommand;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Popups.IUICommand>
  IIterator_1__Popups_IUICommand = interface;
  PIIterator_1__Popups_IUICommand = ^IIterator_1__Popups_IUICommand;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Popups.IUICommand>
  IIterable_1__Popups_IUICommand = interface;
  PIIterable_1__Popups_IUICommand = ^IIterable_1__Popups_IUICommand;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Popups.IUICommand>
  IVectorView_1__Popups_IUICommand = interface;
  PIVectorView_1__Popups_IUICommand = ^IVectorView_1__Popups_IUICommand;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.Popups.IUICommand>
  IVector_1__Popups_IUICommand = interface;
  PIVector_1__Popups_IUICommand = ^IVector_1__Popups_IUICommand;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Popups.IUICommand>
  AsyncOperationCompletedHandler_1__Popups_IUICommand = interface;
  PAsyncOperationCompletedHandler_1__Popups_IUICommand = ^AsyncOperationCompletedHandler_1__Popups_IUICommand;

  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Popups.IUICommand>
  IAsyncOperation_1__Popups_IUICommand = interface;
  PIAsyncOperation_1__Popups_IUICommand = ^IAsyncOperation_1__Popups_IUICommand;

  // Windows.UI.ApplicationSettings.ISettingsCommandFactory
  ApplicationSettings_ISettingsCommandFactory = interface;
  PApplicationSettings_ISettingsCommandFactory = ^ApplicationSettings_ISettingsCommandFactory;

  // Windows.UI.ApplicationSettings.ISettingsCommandStatics
  ApplicationSettings_ISettingsCommandStatics = interface;
  PApplicationSettings_ISettingsCommandStatics = ^ApplicationSettings_ISettingsCommandStatics;

  // Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  ApplicationSettings_IWebAccountProviderCommand = interface;
  PApplicationSettings_IWebAccountProviderCommand = ^ApplicationSettings_IWebAccountProviderCommand;

  // Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
  ApplicationSettings_WebAccountProviderCommandInvokedHandler = interface;
  PApplicationSettings_WebAccountProviderCommandInvokedHandler = ^ApplicationSettings_WebAccountProviderCommandInvokedHandler;

  // Windows.UI.ApplicationSettings.IWebAccountProviderCommandFactory
  ApplicationSettings_IWebAccountProviderCommandFactory = interface;
  PApplicationSettings_IWebAccountProviderCommandFactory = ^ApplicationSettings_IWebAccountProviderCommandFactory;

  // Windows.UI.ApplicationSettings.IWebAccountCommand
  ApplicationSettings_IWebAccountCommand = interface;
  PApplicationSettings_IWebAccountCommand = ^ApplicationSettings_IWebAccountCommand;

  // Windows.UI.ApplicationSettings.IWebAccountInvokedArgs
  ApplicationSettings_IWebAccountInvokedArgs = interface;
  PApplicationSettings_IWebAccountInvokedArgs = ^ApplicationSettings_IWebAccountInvokedArgs;

  // Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
  ApplicationSettings_WebAccountCommandInvokedHandler = interface;
  PApplicationSettings_WebAccountCommandInvokedHandler = ^ApplicationSettings_WebAccountCommandInvokedHandler;

  // Windows.UI.ApplicationSettings.IWebAccountCommandFactory
  ApplicationSettings_IWebAccountCommandFactory = interface;
  PApplicationSettings_IWebAccountCommandFactory = ^ApplicationSettings_IWebAccountCommandFactory;

  // Windows.UI.ApplicationSettings.ICredentialCommand
  ApplicationSettings_ICredentialCommand = interface;
  PApplicationSettings_ICredentialCommand = ^ApplicationSettings_ICredentialCommand;

  // Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
  ApplicationSettings_CredentialCommandCredentialDeletedHandler = interface;
  PApplicationSettings_CredentialCommandCredentialDeletedHandler = ^ApplicationSettings_CredentialCommandCredentialDeletedHandler;

  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneEventDeferral
  ApplicationSettings_IAccountsSettingsPaneEventDeferral = interface;
  PApplicationSettings_IAccountsSettingsPaneEventDeferral = ^ApplicationSettings_IAccountsSettingsPaneEventDeferral;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IIterator_1__ApplicationSettings_IWebAccountProviderCommand = interface;
  PIIterator_1__ApplicationSettings_IWebAccountProviderCommand = ^IIterator_1__ApplicationSettings_IWebAccountProviderCommand;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IIterable_1__ApplicationSettings_IWebAccountProviderCommand = interface;
  PIIterable_1__ApplicationSettings_IWebAccountProviderCommand = ^IIterable_1__ApplicationSettings_IWebAccountProviderCommand;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IVectorView_1__ApplicationSettings_IWebAccountProviderCommand = interface;
  PIVectorView_1__ApplicationSettings_IWebAccountProviderCommand = ^IVectorView_1__ApplicationSettings_IWebAccountProviderCommand;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IVector_1__ApplicationSettings_IWebAccountProviderCommand = interface;
  PIVector_1__ApplicationSettings_IWebAccountProviderCommand = ^IVector_1__ApplicationSettings_IWebAccountProviderCommand;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IIterator_1__ApplicationSettings_IWebAccountCommand = interface;
  PIIterator_1__ApplicationSettings_IWebAccountCommand = ^IIterator_1__ApplicationSettings_IWebAccountCommand;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IIterable_1__ApplicationSettings_IWebAccountCommand = interface;
  PIIterable_1__ApplicationSettings_IWebAccountCommand = ^IIterable_1__ApplicationSettings_IWebAccountCommand;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IVectorView_1__ApplicationSettings_IWebAccountCommand = interface;
  PIVectorView_1__ApplicationSettings_IWebAccountCommand = ^IVectorView_1__ApplicationSettings_IWebAccountCommand;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IVector_1__ApplicationSettings_IWebAccountCommand = interface;
  PIVector_1__ApplicationSettings_IWebAccountCommand = ^IVector_1__ApplicationSettings_IWebAccountCommand;

  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IIterator_1__ApplicationSettings_ICredentialCommand = interface;
  PIIterator_1__ApplicationSettings_ICredentialCommand = ^IIterator_1__ApplicationSettings_ICredentialCommand;

  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IIterable_1__ApplicationSettings_ICredentialCommand = interface;
  PIIterable_1__ApplicationSettings_ICredentialCommand = ^IIterable_1__ApplicationSettings_ICredentialCommand;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IVectorView_1__ApplicationSettings_ICredentialCommand = interface;
  PIVectorView_1__ApplicationSettings_ICredentialCommand = ^IVectorView_1__ApplicationSettings_ICredentialCommand;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IVector_1__ApplicationSettings_ICredentialCommand = interface;
  PIVector_1__ApplicationSettings_ICredentialCommand = ^IVector_1__ApplicationSettings_ICredentialCommand;

  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs
  ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs = interface;
  PApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs = ^ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ApplicationSettings.IAccountsSettingsPane,Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs>
  TypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs = interface;
  PTypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs = ^TypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs;

  // Windows.UI.ApplicationSettings.IAccountsSettingsPane
  ApplicationSettings_IAccountsSettingsPane = interface;
  PApplicationSettings_IAccountsSettingsPane = ^ApplicationSettings_IAccountsSettingsPane;

  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneStatics
  ApplicationSettings_IAccountsSettingsPaneStatics = interface;
  PApplicationSettings_IAccountsSettingsPaneStatics = ^ApplicationSettings_IAccountsSettingsPaneStatics;

  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneStatics2
  ApplicationSettings_IAccountsSettingsPaneStatics2 = interface;
  PApplicationSettings_IAccountsSettingsPaneStatics2 = ^ApplicationSettings_IAccountsSettingsPaneStatics2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface;
  PIReference_1__Single = ^IReference_1__Single;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__HSTRING = ^IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface;
  PIMapView_2__HSTRING__HSTRING = ^IMapView_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable = ^TypedEventHandler_2__IDispatcherQueueTimer__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueue__IInspectable = ^TypedEventHandler_2__IDispatcherQueue__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Object>
  TypedEventHandler_2__ICoreWindow__IInspectable = interface;
  PTypedEventHandler_2__ICoreWindow__IInspectable = ^TypedEventHandler_2__ICoreWindow__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface;
  PTypedEventHandler_2__Activation_ISplashScreen__IInspectable = ^TypedEventHandler_2__Activation_ISplashScreen__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface;
  PIIterator_1__Cardinal = ^IIterator_1__Cardinal;

  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface;
  PIIterable_1__Cardinal = ^IIterable_1__Cardinal;

  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface;
  PIVectorView_1__Cardinal = ^IVectorView_1__Cardinal;

  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable = interface;
  PTypedEventHandler_2__IToastNotification__IInspectable = ^TypedEventHandler_2__IToastNotification__IInspectable;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.UI Interfaces
  {
  // Used Types:  Windows.UI.Color
  }
  // Windows.Foundation.IReference`1<Windows.UI.Color>
  IReference_1__Color = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Color; safecall;
    property Value: Color read get_Value;
  end;

  {
  // Used Types:  String
  }
  // Windows.UI.Shell.IAdaptiveCard
  Shell_IAdaptiveCard = interface(IInspectable)
  ['{72D0568C-A274-41CD-82A8-989D40B9B05E}']
    function ToJson: HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Object
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{09335560-6C6B-5A26-9348-97B781132B20}']
    function get_Key: HSTRING; safecall;
    function get_Value: IInspectable; safecall;
    property Key: HSTRING read get_Key;
    property Value: IInspectable read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{5DB5FA32-707C-5849-A06B-91C8EB9D10E8}']
    function get_Current: IKeyValuePair_2__HSTRING__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{FE2F3D47-5D47-5499-8374-430C7CDA0204}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IInspectable; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface(IInspectable)
  ['{BB78502A-F79D-54FA-92C9-90C5039FDF7E}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IInspectable; out second: IMapView_2__HSTRING__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.Collections.IMap`2<String,Object>
  IMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{1B0D3570-0877-5EC2-8A2C-3B9539506ACA}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IInspectable; safecall;
    function Insert(key: HSTRING; value: IInspectable): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.CollectionChange
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface(IInspectable)
  ['{60141EFB-F2F9-5377-96FD-F8C60D9558B5}']
    function get_CollectionChange: CollectionChange; safecall;
    function get_Key: HSTRING; safecall;
    property CollectionChange: CollectionChange read get_CollectionChange;
    property Key: HSTRING read get_Key;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  }
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface(IUnknown)
  ['{24F981E5-DDCA-538D-AADA-A59906084CF1}']
    procedure Invoke(sender: IObservableMap_2__HSTRING__IInspectable; event: IMapChangedEventArgs_1__HSTRING); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  }
  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{236AAC9D-FB12-5C4D-A41C-9E445FB4D7EC}']
    function add_MapChanged(vhnd: MapChangedEventHandler_2__HSTRING__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MapChanged(token: EventRegistrationToken); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Popups.IUICommand
  }
  // Windows.UI.Popups.UICommandInvokedHandler
  Popups_UICommandInvokedHandler = interface(IUnknown)
  ['{DAF77A4F-C27A-4298-9AC6-2922C45E7DA6}']
    procedure Invoke(command: Popups_IUICommand); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.UI.Popups.UICommandInvokedHandler
  // Used Types:  Object
  }
  // Windows.UI.Popups.IUICommand
  [WinRTClassNameAttribute(SApplicationSettings_SettingsCommand)]
  Popups_IUICommand = interface(IInspectable)
  ['{4FF93A75-4145-47FF-AC7F-DFF1C1FA5B0F}']
    function get_Label: HSTRING; safecall;
    procedure put_Label(value: HSTRING); safecall;
    function get_Invoked: Popups_UICommandInvokedHandler; safecall;
    procedure put_Invoked(value: Popups_UICommandInvokedHandler); safecall;
    function get_Id: IInspectable; safecall;
    procedure put_Id(value: IInspectable); safecall;
    property Id: IInspectable read get_Id write put_Id;
    property Invoked: Popups_UICommandInvokedHandler read get_Invoked write put_Invoked;
    property &Label: HSTRING read get_Label write put_Label;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Popups.IUICommand>
  IIterator_1__Popups_IUICommand_Base = interface(IInspectable)
  ['{2F071C24-4A58-5A00-A294-C7162E98C2A0}']
  end;
  {
  // Used Types:  Windows.UI.Popups.IUICommand
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.Popups.IUICommand>
  IIterator_1__Popups_IUICommand = interface(IIterator_1__Popups_IUICommand_Base)
  ['{F45DB3D3-7299-57CE-A73E-297CF0AF3083}']
    function get_Current: Popups_IUICommand; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPopups_IUICommand): Cardinal; safecall;
    property Current: Popups_IUICommand read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Popups.IUICommand>
  IIterable_1__Popups_IUICommand_Base = interface(IInspectable)
  ['{6308E7E8-CB85-5339-A3E9-9A7500D19C68}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.Popups.IUICommand>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.Popups.IUICommand>
  IIterable_1__Popups_IUICommand = interface(IIterable_1__Popups_IUICommand_Base)
  ['{E63DE42B-53C3-5E07-90D3-98172D545412}']
    function First: IIterator_1__Popups_IUICommand; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Popups.IUICommand
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Popups.IUICommand>
  IVectorView_1__Popups_IUICommand = interface(IInspectable)
  ['{ED1165E6-F377-5B00-8172-93C1BD04DEB4}']
    function GetAt(index: Cardinal): Popups_IUICommand; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Popups_IUICommand; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPopups_IUICommand): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Popups.IUICommand
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.Popups.IUICommand>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.UI.Popups.IUICommand>
  IVector_1__Popups_IUICommand = interface(IInspectable)
  ['{105139A1-DCB8-5F65-97EF-CB1BF0B75F9D}']
    function GetAt(index: Cardinal): Popups_IUICommand; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Popups_IUICommand; safecall;
    function IndexOf(value: Popups_IUICommand; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Popups_IUICommand); safecall;
    procedure InsertAt(index: Cardinal; value: Popups_IUICommand); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Popups_IUICommand); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPopups_IUICommand): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPopups_IUICommand); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Popups.IUICommand>
  AsyncOperationCompletedHandler_1__Popups_IUICommand_Delegate_Base = interface(IUnknown)
  ['{DD33FD5B-A24D-5A44-91FE-DD6441770103}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.UI.Popups.IUICommand>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Popups.IUICommand>
  AsyncOperationCompletedHandler_1__Popups_IUICommand = interface(AsyncOperationCompletedHandler_1__Popups_IUICommand_Delegate_Base)
  ['{DD33FD5B-A24D-5A44-91FE-DD6441770103}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Popups_IUICommand; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Popups.IUICommand>
  IAsyncOperation_1__Popups_IUICommand_Base = interface(IInspectable)
  ['{B8770535-6A4B-52B1-B578-F3CDC5007A1F}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.UI.Popups.IUICommand>
  // Used Types:  Windows.UI.Popups.IUICommand
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.UI.Popups.IUICommand>
  IAsyncOperation_1__Popups_IUICommand = interface(IAsyncOperation_1__Popups_IUICommand_Base)
  ['{B8770535-6A4B-52B1-B578-F3CDC5007A1F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Popups_IUICommand); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Popups_IUICommand; safecall;
    function GetResults: Popups_IUICommand; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Popups_IUICommand read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Popups.IUICommand
  // Used Types:  Object
  // Used Types:  String
  // Used Types:  Windows.UI.Popups.UICommandInvokedHandler
  }
  // Windows.UI.ApplicationSettings.ISettingsCommandFactory
  [WinRTClassNameAttribute(SApplicationSettings_SettingsCommand)]
  ApplicationSettings_ISettingsCommandFactory = interface(IInspectable)
  ['{68E15B33-1C83-433A-AA5A-CEEEA5BD4764}']
    function CreateSettingsCommand(settingsCommandId: IInspectable; &label: HSTRING; handler: Popups_UICommandInvokedHandler): Popups_IUICommand; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.Popups.IUICommand
  }
  // Windows.UI.ApplicationSettings.ISettingsCommandStatics
  [WinRTClassNameAttribute(SApplicationSettings_SettingsCommand)]
  ApplicationSettings_ISettingsCommandStatics = interface(IInspectable)
  ['{749AE954-2F69-4B17-8ABA-D05CE5778E46}']
    function get_AccountsCommand: Popups_IUICommand; safecall;
    property AccountsCommand: Popups_IUICommand read get_AccountsCommand;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Security.Credentials.IWebAccountProvider
  // Used Types:  Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
  }
  // Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  [WinRTClassNameAttribute(SApplicationSettings_WebAccountProviderCommand)]
  ApplicationSettings_IWebAccountProviderCommand = interface(IInspectable)
  ['{D69BDD9A-A0A6-4E9B-88DC-C71E757A3501}']
    function get_WebAccountProvider: IWebAccountProvider; safecall;
    function get_Invoked: ApplicationSettings_WebAccountProviderCommandInvokedHandler; safecall;
    property Invoked: ApplicationSettings_WebAccountProviderCommandInvokedHandler read get_Invoked;
    property WebAccountProvider: IWebAccountProvider read get_WebAccountProvider;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  }
  // Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
  ApplicationSettings_WebAccountProviderCommandInvokedHandler = interface(IUnknown)
  ['{B7DE5527-4C8F-42DD-84DA-5EC493ABDB9A}']
    procedure Invoke(command: ApplicationSettings_IWebAccountProviderCommand); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  // Used Types:  Windows.Security.Credentials.IWebAccountProvider
  // Used Types:  Windows.UI.ApplicationSettings.WebAccountProviderCommandInvokedHandler
  }
  // Windows.UI.ApplicationSettings.IWebAccountProviderCommandFactory
  [WinRTClassNameAttribute(SApplicationSettings_WebAccountProviderCommand)]
  ApplicationSettings_IWebAccountProviderCommandFactory = interface(IInspectable)
  ['{D5658A1B-B176-4776-8469-A9D3FF0B3F59}']
    function CreateWebAccountProviderCommand(webAccountProvider: IWebAccountProvider; invoked: ApplicationSettings_WebAccountProviderCommandInvokedHandler): ApplicationSettings_IWebAccountProviderCommand; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Security.Credentials.IWebAccount
  // Used Types:  Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
  // Used Types:  Windows.UI.ApplicationSettings.SupportedWebAccountActions
  }
  // Windows.UI.ApplicationSettings.IWebAccountCommand
  [WinRTClassNameAttribute(SApplicationSettings_WebAccountCommand)]
  ApplicationSettings_IWebAccountCommand = interface(IInspectable)
  ['{CAA39398-9CFA-4246-B0C4-A913A3896541}']
    function get_WebAccount: IWebAccount; safecall;
    function get_Invoked: ApplicationSettings_WebAccountCommandInvokedHandler; safecall;
    function get_Actions: ApplicationSettings_SupportedWebAccountActions; safecall;
    property Actions: ApplicationSettings_SupportedWebAccountActions read get_Actions;
    property Invoked: ApplicationSettings_WebAccountCommandInvokedHandler read get_Invoked;
    property WebAccount: IWebAccount read get_WebAccount;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.WebAccountAction
  }
  // Windows.UI.ApplicationSettings.IWebAccountInvokedArgs
  [WinRTClassNameAttribute(SApplicationSettings_WebAccountInvokedArgs)]
  ApplicationSettings_IWebAccountInvokedArgs = interface(IInspectable)
  ['{E7ABCC40-A1D8-4C5D-9A7F-1D34B2F90AD2}']
    function get_Action: ApplicationSettings_WebAccountAction; safecall;
    property Action: ApplicationSettings_WebAccountAction read get_Action;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountCommand
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountInvokedArgs
  }
  // Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
  ApplicationSettings_WebAccountCommandInvokedHandler = interface(IUnknown)
  ['{1EE6E459-1705-4A9A-B599-A0C3D6921973}']
    procedure Invoke(command: ApplicationSettings_IWebAccountCommand; args: ApplicationSettings_IWebAccountInvokedArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountCommand
  // Used Types:  Windows.Security.Credentials.IWebAccount
  // Used Types:  Windows.UI.ApplicationSettings.WebAccountCommandInvokedHandler
  // Used Types:  Windows.UI.ApplicationSettings.SupportedWebAccountActions
  }
  // Windows.UI.ApplicationSettings.IWebAccountCommandFactory
  [WinRTClassNameAttribute(SApplicationSettings_WebAccountCommand)]
  ApplicationSettings_IWebAccountCommandFactory = interface(IInspectable)
  ['{BFA6CDFF-2F2D-42F5-81DE-1D56BAFC496D}']
    function CreateWebAccountCommand(webAccount: IWebAccount; invoked: ApplicationSettings_WebAccountCommandInvokedHandler; actions: ApplicationSettings_SupportedWebAccountActions): ApplicationSettings_IWebAccountCommand; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  // Used Types:  Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
  }
  // Windows.UI.ApplicationSettings.ICredentialCommand
  ApplicationSettings_ICredentialCommand = interface(IInspectable)
  ['{A5F665E6-6143-4A7A-A971-B017BA978CE2}']
    function get_PasswordCredential: IPasswordCredential; safecall;
    function get_CredentialDeleted: ApplicationSettings_CredentialCommandCredentialDeletedHandler; safecall;
    property CredentialDeleted: ApplicationSettings_CredentialCommandCredentialDeletedHandler read get_CredentialDeleted;
    property PasswordCredential: IPasswordCredential read get_PasswordCredential;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.ICredentialCommand
  }
  // Windows.UI.ApplicationSettings.CredentialCommandCredentialDeletedHandler
  ApplicationSettings_CredentialCommandCredentialDeletedHandler = interface(IUnknown)
  ['{61C0E185-0977-4678-B4E2-98727AFBEED9}']
    procedure Invoke(command: ApplicationSettings_ICredentialCommand); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneEventDeferral
  [WinRTClassNameAttribute(SApplicationSettings_AccountsSettingsPaneEventDeferral)]
  ApplicationSettings_IAccountsSettingsPaneEventDeferral = interface(IInspectable)
  ['{CBF25D3F-E5BA-40EF-93DA-65E096E5FB04}']
    procedure Complete; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IIterator_1__ApplicationSettings_IWebAccountProviderCommand_Base = interface(IInspectable)
  ['{82D7CD74-8E33-5F06-92FC-915138AACBDE}']
  end;
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IIterator_1__ApplicationSettings_IWebAccountProviderCommand = interface(IIterator_1__ApplicationSettings_IWebAccountProviderCommand_Base)
  ['{0589F3D7-4C7B-5DCF-8B69-521E998840E3}']
    function get_Current: ApplicationSettings_IWebAccountProviderCommand; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PApplicationSettings_IWebAccountProviderCommand): Cardinal; safecall;
    property Current: ApplicationSettings_IWebAccountProviderCommand read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IIterable_1__ApplicationSettings_IWebAccountProviderCommand_Base = interface(IInspectable)
  ['{15165367-2E93-59A6-B5C7-16D3B58FD2E7}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IIterable_1__ApplicationSettings_IWebAccountProviderCommand = interface(IIterable_1__ApplicationSettings_IWebAccountProviderCommand_Base)
  ['{5D3ADB92-B711-52EB-9CEE-0EF716E42707}']
    function First: IIterator_1__ApplicationSettings_IWebAccountProviderCommand; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IVectorView_1__ApplicationSettings_IWebAccountProviderCommand = interface(IInspectable)
  ['{6D1C614A-F7CB-5051-8AF9-79B46848FE39}']
    function GetAt(index: Cardinal): ApplicationSettings_IWebAccountProviderCommand; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ApplicationSettings_IWebAccountProviderCommand; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PApplicationSettings_IWebAccountProviderCommand): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  IVector_1__ApplicationSettings_IWebAccountProviderCommand = interface(IInspectable)
  ['{5E4F3A00-0619-55EB-BDC5-B5AC43E5E153}']
    function GetAt(index: Cardinal): ApplicationSettings_IWebAccountProviderCommand; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ApplicationSettings_IWebAccountProviderCommand; safecall;
    function IndexOf(value: ApplicationSettings_IWebAccountProviderCommand; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ApplicationSettings_IWebAccountProviderCommand); safecall;
    procedure InsertAt(index: Cardinal; value: ApplicationSettings_IWebAccountProviderCommand); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ApplicationSettings_IWebAccountProviderCommand); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PApplicationSettings_IWebAccountProviderCommand): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PApplicationSettings_IWebAccountProviderCommand); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IIterator_1__ApplicationSettings_IWebAccountCommand_Base = interface(IInspectable)
  ['{8CBB62B6-BD9C-5486-9D14-9CC4627B32D4}']
  end;
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountCommand
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IIterator_1__ApplicationSettings_IWebAccountCommand = interface(IIterator_1__ApplicationSettings_IWebAccountCommand_Base)
  ['{E620D41D-D00D-54D0-B860-4A421577D0B1}']
    function get_Current: ApplicationSettings_IWebAccountCommand; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PApplicationSettings_IWebAccountCommand): Cardinal; safecall;
    property Current: ApplicationSettings_IWebAccountCommand read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IIterable_1__ApplicationSettings_IWebAccountCommand_Base = interface(IInspectable)
  ['{BD0D999C-B2BA-51B2-BCC0-D4A5CD821555}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IIterable_1__ApplicationSettings_IWebAccountCommand = interface(IIterable_1__ApplicationSettings_IWebAccountCommand_Base)
  ['{3629C358-6F4E-58FD-80EE-0E5F1F4082E8}']
    function First: IIterator_1__ApplicationSettings_IWebAccountCommand; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountCommand
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IVectorView_1__ApplicationSettings_IWebAccountCommand = interface(IInspectable)
  ['{B927432C-66BF-5A20-ADFE-25DB09CA2B30}']
    function GetAt(index: Cardinal): ApplicationSettings_IWebAccountCommand; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ApplicationSettings_IWebAccountCommand; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PApplicationSettings_IWebAccountCommand): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IWebAccountCommand
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  IVector_1__ApplicationSettings_IWebAccountCommand = interface(IInspectable)
  ['{58120E09-4156-5FAB-B9BB-8909C18470EE}']
    function GetAt(index: Cardinal): ApplicationSettings_IWebAccountCommand; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ApplicationSettings_IWebAccountCommand; safecall;
    function IndexOf(value: ApplicationSettings_IWebAccountCommand; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ApplicationSettings_IWebAccountCommand); safecall;
    procedure InsertAt(index: Cardinal; value: ApplicationSettings_IWebAccountCommand); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ApplicationSettings_IWebAccountCommand); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PApplicationSettings_IWebAccountCommand): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PApplicationSettings_IWebAccountCommand); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IIterator_1__ApplicationSettings_ICredentialCommand_Base = interface(IInspectable)
  ['{9F1177F1-85BB-5CD0-9B08-A0B47A764C75}']
  end;
  {
  // Used Types:  Windows.UI.ApplicationSettings.ICredentialCommand
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IIterator_1__ApplicationSettings_ICredentialCommand = interface(IIterator_1__ApplicationSettings_ICredentialCommand_Base)
  ['{B8A25360-140B-5563-8918-58B6E53E057A}']
    function get_Current: ApplicationSettings_ICredentialCommand; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PApplicationSettings_ICredentialCommand): Cardinal; safecall;
    property Current: ApplicationSettings_ICredentialCommand read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IIterable_1__ApplicationSettings_ICredentialCommand_Base = interface(IInspectable)
  ['{883ED18D-4DBB-58F2-8FD2-E4B018509553}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IIterable_1__ApplicationSettings_ICredentialCommand = interface(IIterable_1__ApplicationSettings_ICredentialCommand_Base)
  ['{E36B7DB3-5D4F-501A-AAD3-062A4D8927A5}']
    function First: IIterator_1__ApplicationSettings_ICredentialCommand; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.ICredentialCommand
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IVectorView_1__ApplicationSettings_ICredentialCommand = interface(IInspectable)
  ['{CFE85330-C245-5639-B839-4E548E5E6B17}']
    function GetAt(index: Cardinal): ApplicationSettings_ICredentialCommand; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ApplicationSettings_ICredentialCommand; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PApplicationSettings_ICredentialCommand): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.ICredentialCommand
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  IVector_1__ApplicationSettings_ICredentialCommand = interface(IInspectable)
  ['{458D5549-557E-5756-B5CA-13209BA7D91E}']
    function GetAt(index: Cardinal): ApplicationSettings_ICredentialCommand; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ApplicationSettings_ICredentialCommand; safecall;
    function IndexOf(value: ApplicationSettings_ICredentialCommand; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ApplicationSettings_ICredentialCommand); safecall;
    procedure InsertAt(index: Cardinal; value: ApplicationSettings_ICredentialCommand); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ApplicationSettings_ICredentialCommand); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PApplicationSettings_ICredentialCommand): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PApplicationSettings_ICredentialCommand); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.IWebAccountProviderCommand>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.IWebAccountCommand>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.UI.ApplicationSettings.ICredentialCommand>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.UI.Popups.IUICommand>
  // Used Types:  String
  // Used Types:  Windows.UI.ApplicationSettings.IAccountsSettingsPaneEventDeferral
  }
  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs
  [WinRTClassNameAttribute(SApplicationSettings_AccountsSettingsPaneCommandsRequestedEventArgs)]
  ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs = interface(IInspectable)
  ['{3B68C099-DB19-45D0-9ABF-95D3773C9330}']
    function get_WebAccountProviderCommands: IVector_1__ApplicationSettings_IWebAccountProviderCommand; safecall;
    function get_WebAccountCommands: IVector_1__ApplicationSettings_IWebAccountCommand; safecall;
    function get_CredentialCommands: IVector_1__ApplicationSettings_ICredentialCommand; safecall;
    function get_Commands: IVector_1__Popups_IUICommand; safecall;
    function get_HeaderText: HSTRING; safecall;
    procedure put_HeaderText(value: HSTRING); safecall;
    function GetDeferral: ApplicationSettings_IAccountsSettingsPaneEventDeferral; safecall;
    property Commands: IVector_1__Popups_IUICommand read get_Commands;
    property CredentialCommands: IVector_1__ApplicationSettings_ICredentialCommand read get_CredentialCommands;
    property HeaderText: HSTRING read get_HeaderText write put_HeaderText;
    property WebAccountCommands: IVector_1__ApplicationSettings_IWebAccountCommand read get_WebAccountCommands;
    property WebAccountProviderCommands: IVector_1__ApplicationSettings_IWebAccountProviderCommand read get_WebAccountProviderCommands;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ApplicationSettings.IAccountsSettingsPane,Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs>
  TypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{69B8847E-7D72-5A15-BC1C-4CA39C93B162}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IAccountsSettingsPane
  // Used Types:  Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.ApplicationSettings.IAccountsSettingsPane,Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs>
  TypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs = interface(TypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs_Delegate_Base)
  ['{F355D7FC-61F8-5271-A250-80C756A1DE3A}']
    procedure Invoke(sender: ApplicationSettings_IAccountsSettingsPane; args: ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.UI.ApplicationSettings.IAccountsSettingsPane,Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs>
  }
  // Windows.UI.ApplicationSettings.IAccountsSettingsPane
  [WinRTClassNameAttribute(SApplicationSettings_AccountsSettingsPane)]
  ApplicationSettings_IAccountsSettingsPane = interface(IInspectable)
  ['{81EA942C-4F09-4406-A538-838D9B14B7E6}']
    function add_AccountCommandsRequested(handler: TypedEventHandler_2__ApplicationSettings_IAccountsSettingsPane__ApplicationSettings_IAccountsSettingsPaneCommandsRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccountCommandsRequested(cookie: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ApplicationSettings.IAccountsSettingsPane
  }
  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneStatics
  [WinRTClassNameAttribute(SApplicationSettings_AccountsSettingsPane)]
  ApplicationSettings_IAccountsSettingsPaneStatics = interface(IInspectable)
  ['{561F8B60-B0EC-4150-A8DC-208EE44B068A}']
    function GetForCurrentView: ApplicationSettings_IAccountsSettingsPane; safecall;
    procedure Show; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.UI.ApplicationSettings.IAccountsSettingsPaneStatics2
  [WinRTClassNameAttribute(SApplicationSettings_AccountsSettingsPane)]
  ApplicationSettings_IAccountsSettingsPaneStatics2 = interface(IInspectable)
  ['{D21DF7C2-CE0D-484F-B8E8-E823C215765E}']
    function ShowManageAccountsAsync: IAsyncAction; safecall;
    function ShowAddAccountAsync: IAsyncAction; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  // Used Types:  Boolean
  }
  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Object
  }
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface(IUnknown)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; progressInfo: Cardinal); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface(IUnknown)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface(IInspectable)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Object>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface(IUnknown)
  ['{3F08262E-A2E1-5134-9297-E9211F481A2D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  // Used Types:  Object
  }
  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface(IInspectable)
  ['{ABF53C57-EE50-5342-B52A-26E3B8CC024F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IInspectable; safecall;
    function GetResults: IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IInspectable read get_Completed write put_Completed;
  end;

  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface(IInspectable)
  ['{8C304EBB-6615-50A4-8829-879ECD443236}']
    function get_Current: HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Current: HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<String>
  }
  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface(IInspectable)
  ['{E2FCC7C1-3BFC-5A0B-B2B0-72E769D1CB7E}']
    function First: IIterator_1__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F13C006-A03A-5F69-B090-75A43E33423E}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Single
  }
  // Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface(IInspectable)
  ['{719CC2BA-3E76-5DEF-9F1A-38D85A145EA8}']
    function get_Value: Single; safecall;
    property Value: Single read get_Value;
  end;

  {
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{60310303-49C5-52E6-ABC6-A9B36ECCC716}']
    function get_Key: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: HSTRING read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
    function get_Current: IKeyValuePair_2__HSTRING__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface(IInspectable)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__HSTRING; out second: IMapView_2__HSTRING__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface(IInspectable)
  ['{F6D1F700-49C2-52AE-8154-826F9908773C}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__HSTRING; safecall;
    function Insert(key: HSTRING; value: HSTRING): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.System.IDispatcherQueueTimer
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface(IUnknown)
  ['{8A13AE56-7643-5F25-A347-5C9F548273DC}']
    procedure Invoke(sender: IDispatcherQueueTimer; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.System.IDispatcherQueue
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface(IUnknown)
  ['{1ECC7D76-D5F1-5514-8DA3-343E7A82F842}']
    procedure Invoke(sender: IDispatcherQueue; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Object>
  TypedEventHandler_2__ICoreWindow__IInspectable_Delegate_Base = interface(IUnknown)
  ['{6368AE3D-52D4-5290-B936-717A9ACF5BEA}']
  end;
  {
  // Used Types:  Windows.UI.Core.ICoreWindow
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Object>
  TypedEventHandler_2__ICoreWindow__IInspectable = interface(TypedEventHandler_2__ICoreWindow__IInspectable_Delegate_Base)
  ['{B36B7AF8-9A47-5035-B15C-4B124BDFC849}']
    procedure Invoke(sender: ICoreWindow; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.ApplicationModel.Activation.ISplashScreen
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface(IUnknown)
  ['{359B8887-2FA6-5405-A4AF-642C9FDACC93}']
    procedure Invoke(sender: Activation_ISplashScreen; args: IInspectable); safecall;
  end;

  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface(IInspectable)
  ['{F06A2739-9443-5EF0-B284-DC5AFF3E7D10}']
    function get_Current: Cardinal; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Current: Cardinal read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<UInt32>
  }
  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface(IInspectable)
  ['{421D4B91-B13B-5F37-AE54-B5249BD80539}']
    function First: IIterator_1__Cardinal; safecall;
  end;

  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface(IInspectable)
  ['{E5CE1A07-8D33-5007-BA64-7D2508CCF85C}']
    function GetAt(index: Cardinal): Cardinal; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Cardinal; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.UI.Notifications.IToastNotification
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable = interface(IUnknown)
  ['{93621AAC-6E87-5F7A-AA83-927B2D905518}']
    procedure Invoke(sender: IToastNotification; args: IInspectable); safecall;
  end;


  // Emit Forwarded classes
  // Windows.UI.ApplicationSettings.SettingsCommand
  // DualAPI
  // Implements: Windows.UI.Popups.IUICommand
  // Statics: "Windows.UI.ApplicationSettings.ISettingsCommandStatics"
  // Factory: "Windows.UI.ApplicationSettings.ISettingsCommandFactory"
  TApplicationSettings_SettingsCommand = class(TWinRTGenericImportFS<ApplicationSettings_ISettingsCommandFactory, ApplicationSettings_ISettingsCommandStatics>)
  public
    // -> ApplicationSettings_ISettingsCommandStatics
    class function get_AccountsCommand: Popups_IUICommand; static; inline;
    class property AccountsCommand: Popups_IUICommand read get_AccountsCommand;

    // -> ApplicationSettings_ISettingsCommandFactory
    class function CreateSettingsCommand(settingsCommandId: IInspectable; &label: HSTRING; handler: Popups_UICommandInvokedHandler): Popups_IUICommand; static; inline;
  end;

  // Windows.UI.ApplicationSettings.WebAccountProviderCommand
  // DualAPI
  // Implements: Windows.UI.ApplicationSettings.IWebAccountProviderCommand
  // Factory: "Windows.UI.ApplicationSettings.IWebAccountProviderCommandFactory"
  TApplicationSettings_WebAccountProviderCommand = class(TWinRTGenericImportF<ApplicationSettings_IWebAccountProviderCommandFactory>)
  public
    // -> ApplicationSettings_IWebAccountProviderCommandFactory
    class function CreateWebAccountProviderCommand(webAccountProvider: IWebAccountProvider; invoked: ApplicationSettings_WebAccountProviderCommandInvokedHandler): ApplicationSettings_IWebAccountProviderCommand; static; inline;
  end;

  // Windows.UI.ApplicationSettings.WebAccountCommand
  // DualAPI
  // Implements: Windows.UI.ApplicationSettings.IWebAccountCommand
  // Factory: "Windows.UI.ApplicationSettings.IWebAccountCommandFactory"
  TApplicationSettings_WebAccountCommand = class(TWinRTGenericImportF<ApplicationSettings_IWebAccountCommandFactory>)
  public
    // -> ApplicationSettings_IWebAccountCommandFactory
    class function CreateWebAccountCommand(webAccount: IWebAccount; invoked: ApplicationSettings_WebAccountCommandInvokedHandler; actions: ApplicationSettings_SupportedWebAccountActions): ApplicationSettings_IWebAccountCommand; static; inline;
  end;

  // Windows.UI.ApplicationSettings.WebAccountInvokedArgs
  // DualAPI
  // Implements: Windows.UI.ApplicationSettings.IWebAccountInvokedArgs

  // Windows.UI.ApplicationSettings.AccountsSettingsPaneEventDeferral
  // DualAPI
  // Implements: Windows.UI.ApplicationSettings.IAccountsSettingsPaneEventDeferral

  // Windows.UI.ApplicationSettings.AccountsSettingsPaneCommandsRequestedEventArgs
  // DualAPI
  // Implements: Windows.UI.ApplicationSettings.IAccountsSettingsPaneCommandsRequestedEventArgs

  // Windows.UI.ApplicationSettings.AccountsSettingsPane
  // DualAPI
  // Implements: Windows.UI.ApplicationSettings.IAccountsSettingsPane
  // Statics: "Windows.UI.ApplicationSettings.IAccountsSettingsPaneStatics"
  // Statics: "Windows.UI.ApplicationSettings.IAccountsSettingsPaneStatics2"
  TApplicationSettings_AccountsSettingsPane = class(TWinRTGenericImportS2<ApplicationSettings_IAccountsSettingsPaneStatics, ApplicationSettings_IAccountsSettingsPaneStatics2>)
  public
    // -> ApplicationSettings_IAccountsSettingsPaneStatics
    class function GetForCurrentView: ApplicationSettings_IAccountsSettingsPane; static; inline;
    class procedure Show; static; inline;

    // -> ApplicationSettings_IAccountsSettingsPaneStatics2
    class function ShowManageAccountsAsync: IAsyncAction; static; inline;
    class function ShowAddAccountAsync: IAsyncAction; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TApplicationSettings_SettingsCommand }

class function TApplicationSettings_SettingsCommand.get_AccountsCommand: Popups_IUICommand;
begin
  Result := Statics.get_AccountsCommand;
end;

// Factories for : "ApplicationSettings_SettingsCommand"
// Factory: "Windows.UI.ApplicationSettings.ISettingsCommandFactory"
// -> ApplicationSettings_ISettingsCommandFactory

class function TApplicationSettings_SettingsCommand.CreateSettingsCommand(settingsCommandId: IInspectable; &label: HSTRING; handler: Popups_UICommandInvokedHandler): Popups_IUICommand;
begin
  Result := Factory.CreateSettingsCommand(settingsCommandId, &label, handler);
end;


 { TApplicationSettings_WebAccountProviderCommand }
// Factories for : "ApplicationSettings_WebAccountProviderCommand"
// Factory: "Windows.UI.ApplicationSettings.IWebAccountProviderCommandFactory"
// -> ApplicationSettings_IWebAccountProviderCommandFactory

class function TApplicationSettings_WebAccountProviderCommand.CreateWebAccountProviderCommand(webAccountProvider: IWebAccountProvider; invoked: ApplicationSettings_WebAccountProviderCommandInvokedHandler): ApplicationSettings_IWebAccountProviderCommand;
begin
  Result := Factory.CreateWebAccountProviderCommand(webAccountProvider, invoked);
end;


 { TApplicationSettings_WebAccountCommand }
// Factories for : "ApplicationSettings_WebAccountCommand"
// Factory: "Windows.UI.ApplicationSettings.IWebAccountCommandFactory"
// -> ApplicationSettings_IWebAccountCommandFactory

class function TApplicationSettings_WebAccountCommand.CreateWebAccountCommand(webAccount: IWebAccount; invoked: ApplicationSettings_WebAccountCommandInvokedHandler; actions: ApplicationSettings_SupportedWebAccountActions): ApplicationSettings_IWebAccountCommand;
begin
  Result := Factory.CreateWebAccountCommand(webAccount, invoked, actions);
end;


 { TApplicationSettings_AccountsSettingsPane }

class function TApplicationSettings_AccountsSettingsPane.GetForCurrentView: ApplicationSettings_IAccountsSettingsPane;
begin
  Result := Statics.GetForCurrentView;
end;

class procedure TApplicationSettings_AccountsSettingsPane.Show;
begin
  Statics.Show;
end;


class function TApplicationSettings_AccountsSettingsPane.ShowManageAccountsAsync: IAsyncAction;
begin
  Result := Statics2.ShowManageAccountsAsync;
end;

class function TApplicationSettings_AccountsSettingsPane.ShowAddAccountAsync: IAsyncAction;
begin
  Result := Statics2.ShowAddAccountAsync;
end;



end.
