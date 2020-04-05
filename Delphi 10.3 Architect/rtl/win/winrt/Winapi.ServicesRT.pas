{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.ServicesRT;

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
  Winapi.SystemRT, 
  Winapi.Storage.Streams, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Services.Cortana.ICortanaSettings
  Cortana_ICortanaSettings = interface;
  PCortana_ICortanaSettings = ^Cortana_ICortanaSettings;

  // Windows.Services.Cortana.ICortanaSettingsStatics
  Cortana_ICortanaSettingsStatics = interface;
  PCortana_ICortanaSettingsStatics = ^Cortana_ICortanaSettingsStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Cortana.CortanaPermission>
  IIterator_1__Cortana_CortanaPermission = interface;
  PIIterator_1__Cortana_CortanaPermission = ^IIterator_1__Cortana_CortanaPermission;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Cortana.CortanaPermission>
  IIterable_1__Cortana_CortanaPermission = interface;
  PIIterable_1__Cortana_CortanaPermission = ^IIterable_1__Cortana_CortanaPermission;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult = interface;
  PAsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult = ^AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  IAsyncOperation_1__Cortana_CortanaPermissionsChangeResult = interface;
  PIAsyncOperation_1__Cortana_CortanaPermissionsChangeResult = ^IAsyncOperation_1__Cortana_CortanaPermissionsChangeResult;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

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

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

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

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions
  TargetedContent_ITargetedContentSubscriptionOptions = interface;
  PTargetedContent_ITargetedContentSubscriptionOptions = ^TargetedContent_ITargetedContentSubscriptionOptions;

  // Windows.Services.TargetedContent.ITargetedContentImage
  TargetedContent_ITargetedContentImage = interface;
  PTargetedContent_ITargetedContentImage = ^TargetedContent_ITargetedContentImage;

  // Windows.Services.TargetedContent.ITargetedContentAction
  TargetedContent_ITargetedContentAction = interface;
  PTargetedContent_ITargetedContentAction = ^TargetedContent_ITargetedContentAction;

  // Windows.Foundation.Collections.IIterator`1<Double>
  IIterator_1__Double = interface;
  PIIterator_1__Double = ^IIterator_1__Double;

  // Windows.Foundation.Collections.IIterable`1<Double>
  IIterable_1__Double = interface;
  PIIterable_1__Double = ^IIterable_1__Double;

  // Windows.Foundation.Collections.IVectorView`1<Double>
  IVectorView_1__Double = interface;
  PIVectorView_1__Double = ^IVectorView_1__Double;

  // Windows.Foundation.Collections.IIterator`1<Boolean>
  IIterator_1__Boolean = interface;
  PIIterator_1__Boolean = ^IIterator_1__Boolean;

  // Windows.Foundation.Collections.IIterable`1<Boolean>
  IIterable_1__Boolean = interface;
  PIIterable_1__Boolean = ^IIterable_1__Boolean;

  // Windows.Foundation.Collections.IVectorView`1<Boolean>
  IVectorView_1__Boolean = interface;
  PIVectorView_1__Boolean = ^IVectorView_1__Boolean;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IIterator_1__TargetedContent_ITargetedContentImage = interface;
  PIIterator_1__TargetedContent_ITargetedContentImage = ^IIterator_1__TargetedContent_ITargetedContentImage;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IIterable_1__TargetedContent_ITargetedContentImage = interface;
  PIIterable_1__TargetedContent_ITargetedContentImage = ^IIterable_1__TargetedContent_ITargetedContentImage;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IVectorView_1__TargetedContent_ITargetedContentImage = interface;
  PIVectorView_1__TargetedContent_ITargetedContentImage = ^IVectorView_1__TargetedContent_ITargetedContentImage;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IIterator_1__TargetedContent_ITargetedContentAction = interface;
  PIIterator_1__TargetedContent_ITargetedContentAction = ^IIterator_1__TargetedContent_ITargetedContentAction;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IIterable_1__TargetedContent_ITargetedContentAction = interface;
  PIIterable_1__TargetedContent_ITargetedContentAction = ^IIterable_1__TargetedContent_ITargetedContentAction;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IVectorView_1__TargetedContent_ITargetedContentAction = interface;
  PIVectorView_1__TargetedContent_ITargetedContentAction = ^IVectorView_1__TargetedContent_ITargetedContentAction;

  // Windows.Services.TargetedContent.ITargetedContentValue
  TargetedContent_ITargetedContentValue = interface;
  PTargetedContent_ITargetedContentValue = ^TargetedContent_ITargetedContentValue;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = interface;
  PIKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = ^IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  IIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = ^IIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  IIterable_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = ^IIterable_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  IMapView_2__HSTRING__TargetedContent_ITargetedContentValue = interface;
  PIMapView_2__HSTRING__TargetedContent_ITargetedContentValue = ^IMapView_2__HSTRING__TargetedContent_ITargetedContentValue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IIterator_1__TargetedContent_ITargetedContentCollection = interface;
  PIIterator_1__TargetedContent_ITargetedContentCollection = ^IIterator_1__TargetedContent_ITargetedContentCollection;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IIterable_1__TargetedContent_ITargetedContentCollection = interface;
  PIIterable_1__TargetedContent_ITargetedContentCollection = ^IIterable_1__TargetedContent_ITargetedContentCollection;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IVectorView_1__TargetedContent_ITargetedContentCollection = interface;
  PIVectorView_1__TargetedContent_ITargetedContentCollection = ^IVectorView_1__TargetedContent_ITargetedContentCollection;

  // Windows.Services.TargetedContent.ITargetedContentItemState
  TargetedContent_ITargetedContentItemState = interface;
  PTargetedContent_ITargetedContentItemState = ^TargetedContent_ITargetedContentItemState;

  // Windows.Services.TargetedContent.ITargetedContentItem
  TargetedContent_ITargetedContentItem = interface;
  PTargetedContent_ITargetedContentItem = ^TargetedContent_ITargetedContentItem;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IIterator_1__TargetedContent_ITargetedContentItem = interface;
  PIIterator_1__TargetedContent_ITargetedContentItem = ^IIterator_1__TargetedContent_ITargetedContentItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IIterable_1__TargetedContent_ITargetedContentItem = interface;
  PIIterable_1__TargetedContent_ITargetedContentItem = ^IIterable_1__TargetedContent_ITargetedContentItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IVectorView_1__TargetedContent_ITargetedContentItem = interface;
  PIVectorView_1__TargetedContent_ITargetedContentItem = ^IVectorView_1__TargetedContent_ITargetedContentItem;

  // Windows.Services.TargetedContent.ITargetedContentCollection
  TargetedContent_ITargetedContentCollection = interface;
  PTargetedContent_ITargetedContentCollection = ^TargetedContent_ITargetedContentCollection;

  // Windows.Services.TargetedContent.ITargetedContentObject
  TargetedContent_ITargetedContentObject = interface;
  PTargetedContent_ITargetedContentObject = ^TargetedContent_ITargetedContentObject;

  // Windows.Services.TargetedContent.ITargetedContentContainer
  TargetedContent_ITargetedContentContainer = interface;
  PTargetedContent_ITargetedContentContainer = ^TargetedContent_ITargetedContentContainer;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer = interface;
  PAsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer = ^AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  IAsyncOperation_1__TargetedContent_ITargetedContentContainer = interface;
  PIAsyncOperation_1__TargetedContent_ITargetedContentContainer = ^IAsyncOperation_1__TargetedContent_ITargetedContentContainer;

  // Windows.Services.TargetedContent.ITargetedContentChangedEventArgs
  TargetedContent_ITargetedContentChangedEventArgs = interface;
  PTargetedContent_ITargetedContentChangedEventArgs = ^TargetedContent_ITargetedContentChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs = interface;
  PTypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs = ^TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs;

  // Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs
  TargetedContent_ITargetedContentAvailabilityChangedEventArgs = interface;
  PTargetedContent_ITargetedContentAvailabilityChangedEventArgs = ^TargetedContent_ITargetedContentAvailabilityChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs = interface;
  PTypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs = ^TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs;

  // Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs
  TargetedContent_ITargetedContentStateChangedEventArgs = interface;
  PTargetedContent_ITargetedContentStateChangedEventArgs = ^TargetedContent_ITargetedContentStateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs = interface;
  PTypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs = ^TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs;

  // Windows.Services.TargetedContent.ITargetedContentSubscription
  TargetedContent_ITargetedContentSubscription = interface;
  PTargetedContent_ITargetedContentSubscription = ^TargetedContent_ITargetedContentSubscription;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription = interface;
  PAsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription = ^AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription;

  // Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  IAsyncOperation_1__TargetedContent_ITargetedContentSubscription = interface;
  PIAsyncOperation_1__TargetedContent_ITargetedContentSubscription = ^IAsyncOperation_1__TargetedContent_ITargetedContentSubscription;

  // Windows.Services.TargetedContent.ITargetedContentSubscriptionStatics
  TargetedContent_ITargetedContentSubscriptionStatics = interface;
  PTargetedContent_ITargetedContentSubscriptionStatics = ^TargetedContent_ITargetedContentSubscriptionStatics;

  // Windows.Services.TargetedContent.ITargetedContentContainerStatics
  TargetedContent_ITargetedContentContainerStatics = interface;
  PTargetedContent_ITargetedContentContainerStatics = ^TargetedContent_ITargetedContentContainerStatics;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Services Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Services.Cortana.ICortanaSettings
  [WinRTClassNameAttribute(SCortana_CortanaSettings)]
  Cortana_ICortanaSettings = interface(IInspectable)
  ['{54D571A7-8062-40F4-ABE7-DEDFD697B019}']
    function get_HasUserConsentToVoiceActivation: Boolean; safecall;
    function get_IsVoiceActivationEnabled: Boolean; safecall;
    procedure put_IsVoiceActivationEnabled(value: Boolean); safecall;
    property HasUserConsentToVoiceActivation: Boolean read get_HasUserConsentToVoiceActivation;
    property IsVoiceActivationEnabled: Boolean read get_IsVoiceActivationEnabled write put_IsVoiceActivationEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Services.Cortana.ICortanaSettings
  }
  // Windows.Services.Cortana.ICortanaSettingsStatics
  [WinRTClassNameAttribute(SCortana_CortanaSettings)]
  Cortana_ICortanaSettingsStatics = interface(IInspectable)
  ['{8B2CCD7E-2EC0-446D-9285-33F07CE8AC04}']
    function IsSupported: Boolean; safecall;
    function GetDefault: Cortana_ICortanaSettings; safecall;
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

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Cortana.CortanaPermission>
  IIterator_1__Cortana_CortanaPermission_Base = interface(IInspectable)
  ['{0F1AC33C-511A-52E8-AF09-D89F7004E8C5}']
  end;
  {
  // Used Types:  Windows.Services.Cortana.CortanaPermission
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Cortana.CortanaPermission>
  IIterator_1__Cortana_CortanaPermission = interface(IIterator_1__Cortana_CortanaPermission_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Cortana_CortanaPermission; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCortana_CortanaPermission): Cardinal; safecall;
    property Current: Cortana_CortanaPermission read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Cortana.CortanaPermission>
  IIterable_1__Cortana_CortanaPermission_Base = interface(IInspectable)
  ['{36A12EAE-2E24-5E07-BFD0-344A92990916}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.Cortana.CortanaPermission>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Cortana.CortanaPermission>
  IIterable_1__Cortana_CortanaPermission = interface(IIterable_1__Cortana_CortanaPermission_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Cortana_CortanaPermission; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult_Delegate_Base = interface(IUnknown)
  ['{EC1C6586-5E0D-5BC0-B84F-20052C5AC7A9}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult = interface(AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Cortana_CortanaPermissionsChangeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  IAsyncOperation_1__Cortana_CortanaPermissionsChangeResult_Base = interface(IInspectable)
  ['{838A3DD0-F0A3-508F-846A-D3C19E4FE7A0}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  // Used Types:  Windows.Services.Cortana.CortanaPermissionsChangeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Cortana.CortanaPermissionsChangeResult>
  IAsyncOperation_1__Cortana_CortanaPermissionsChangeResult = interface(IAsyncOperation_1__Cortana_CortanaPermissionsChangeResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult; safecall;
    function GetResults: Cortana_CortanaPermissionsChangeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Cortana_CortanaPermissionsChangeResult read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Double
  }
  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface(IInspectable)
  ['{2F2D6C29-5473-5F3E-92E7-96572BB990E2}']
    function get_Value: Double; safecall;
    property Value: Double read get_Value;
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
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface(IUnknown)
  ['{B79A741F-7FB5-50AE-9E99-911201EC3D41}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface(IInspectable)
  ['{3E1FE603-F897-5263-B328-0806426B8A79}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HSTRING; safecall;
    function GetResults: HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HSTRING read get_Completed write put_Completed;
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
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface(IInspectable)
  ['{98B9ACC1-4B56-532E-AC73-03D5291CCA90}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__HSTRING; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: HSTRING); safecall;
    procedure InsertAt(index: Cardinal; value: HSTRING); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: HSTRING); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PHSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  }
  // Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions
  [WinRTClassNameAttribute(STargetedContent_TargetedContentSubscriptionOptions)]
  TargetedContent_ITargetedContentSubscriptionOptions = interface(IInspectable)
  ['{61EE6AD0-2C83-421B-8467-413EAF1AEB97}']
    function get_SubscriptionId: HSTRING; safecall;
    function get_AllowPartialContentAvailability: Boolean; safecall;
    procedure put_AllowPartialContentAvailability(value: Boolean); safecall;
    function get_CloudQueryParameters: IMap_2__HSTRING__HSTRING; safecall;
    function get_LocalFilters: IVector_1__HSTRING; safecall;
    procedure Update; safecall;
    property AllowPartialContentAvailability: Boolean read get_AllowPartialContentAvailability write put_AllowPartialContentAvailability;
    property CloudQueryParameters: IMap_2__HSTRING__HSTRING read get_CloudQueryParameters;
    property LocalFilters: IVector_1__HSTRING read get_LocalFilters;
    property SubscriptionId: HSTRING read get_SubscriptionId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Services.TargetedContent.ITargetedContentImage
  [WinRTClassNameAttribute(STargetedContent_TargetedContentImage)]
  TargetedContent_ITargetedContentImage = interface(IInspectable)
  ['{A7A585D9-779F-4B1E-BBB1-8EAF53FBEAB2}']
    function get_Height: Cardinal; safecall;
    function get_Width: Cardinal; safecall;
    property Height: Cardinal read get_Height;
    property Width: Cardinal read get_Width;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Services.TargetedContent.ITargetedContentAction
  [WinRTClassNameAttribute(STargetedContent_TargetedContentAction)]
  TargetedContent_ITargetedContentAction = interface(IInspectable)
  ['{D75B691E-6CD6-4CA0-9D8F-4728B0B7E6B6}']
    function InvokeAsync: IAsyncAction; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Double>
  IIterator_1__Double_Base = interface(IInspectable)
  ['{638A2CF4-F474-5318-9055-141CB909AC4B}']
  end;
  {
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Double>
  IIterator_1__Double = interface(IIterator_1__Double_Base)
  ['{638A2CF4-F474-5318-9055-141CB909AC4B}']
    function get_Current: Double; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDouble): Cardinal; safecall;
    property Current: Double read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Double>
  IIterable_1__Double_Base = interface(IInspectable)
  ['{C738964E-9C64-5BCE-B5CE-61E9A282EC4A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Double>
  }
  // Windows.Foundation.Collections.IIterable`1<Double>
  IIterable_1__Double = interface(IIterable_1__Double_Base)
  ['{C738964E-9C64-5BCE-B5CE-61E9A282EC4A}']
    function First: IIterator_1__Double; safecall;
  end;

  {
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Double>
  IVectorView_1__Double = interface(IInspectable)
  ['{AF7586A8-6B21-5F61-BFF1-1B682293AD96}']
    function GetAt(index: Cardinal): Double; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Double; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDouble): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Boolean>
  IIterator_1__Boolean_Base = interface(IInspectable)
  ['{740A0296-A535-572A-BF0B-17C18FF71FE6}']
  end;
  {
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Boolean>
  IIterator_1__Boolean = interface(IIterator_1__Boolean_Base)
  ['{740A0296-A535-572A-BF0B-17C18FF71FE6}']
    function get_Current: Boolean; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PBoolean): Cardinal; safecall;
    property Current: Boolean read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Boolean>
  IIterable_1__Boolean_Base = interface(IInspectable)
  ['{30160817-1D7D-54E9-99DB-D7636266A476}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Boolean>
  }
  // Windows.Foundation.Collections.IIterable`1<Boolean>
  IIterable_1__Boolean = interface(IIterable_1__Boolean_Base)
  ['{30160817-1D7D-54E9-99DB-D7636266A476}']
    function First: IIterator_1__Boolean; safecall;
  end;

  {
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IVectorView`1<Boolean>
  IVectorView_1__Boolean = interface(IInspectable)
  ['{243A09CB-6F40-56AF-A442-FE81431FBEF5}']
    function GetAt(index: Cardinal): Boolean; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Boolean; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PBoolean): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IIterator_1__TargetedContent_ITargetedContentImage_Base = interface(IInspectable)
  ['{A807B298-9E2F-5673-BCF6-1E35FEBA0647}']
  end;
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentImage
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IIterator_1__TargetedContent_ITargetedContentImage = interface(IIterator_1__TargetedContent_ITargetedContentImage_Base)
  ['{1C83E55A-3608-5AB1-943C-E33B44B1E90D}']
    function get_Current: TargetedContent_ITargetedContentImage; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PTargetedContent_ITargetedContentImage): Cardinal; safecall;
    property Current: TargetedContent_ITargetedContentImage read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IIterable_1__TargetedContent_ITargetedContentImage_Base = interface(IInspectable)
  ['{EFADB6BF-AF18-5AF9-A509-19881BC586F5}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentImage>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IIterable_1__TargetedContent_ITargetedContentImage = interface(IIterable_1__TargetedContent_ITargetedContentImage_Base)
  ['{9A43508E-4B30-551B-8E9F-CCC976B881DA}']
    function First: IIterator_1__TargetedContent_ITargetedContentImage; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentImage
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentImage>
  IVectorView_1__TargetedContent_ITargetedContentImage = interface(IInspectable)
  ['{0D42E297-EAB2-5574-B73F-C81C029C4FC7}']
    function GetAt(index: Cardinal): TargetedContent_ITargetedContentImage; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TargetedContent_ITargetedContentImage; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PTargetedContent_ITargetedContentImage): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IIterator_1__TargetedContent_ITargetedContentAction_Base = interface(IInspectable)
  ['{79656935-5813-5AA6-8E69-627A0D85088F}']
  end;
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentAction
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IIterator_1__TargetedContent_ITargetedContentAction = interface(IIterator_1__TargetedContent_ITargetedContentAction_Base)
  ['{92E3EADE-F4FF-58AE-A4A8-AB377B72AB53}']
    function get_Current: TargetedContent_ITargetedContentAction; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PTargetedContent_ITargetedContentAction): Cardinal; safecall;
    property Current: TargetedContent_ITargetedContentAction read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IIterable_1__TargetedContent_ITargetedContentAction_Base = interface(IInspectable)
  ['{CF05B497-3AFD-5D00-859E-9FBD1A36D576}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentAction>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IIterable_1__TargetedContent_ITargetedContentAction = interface(IIterable_1__TargetedContent_ITargetedContentAction_Base)
  ['{14C2653E-03F5-5EE6-B439-C5A8EA794DC5}']
    function First: IIterator_1__TargetedContent_ITargetedContentAction; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentAction
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentAction>
  IVectorView_1__TargetedContent_ITargetedContentAction = interface(IInspectable)
  ['{C3C1FD9C-D409-5CAD-9DBB-F8E6D4663D36}']
    function GetAt(index: Cardinal): TargetedContent_ITargetedContentAction; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TargetedContent_ITargetedContentAction; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PTargetedContent_ITargetedContentAction): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.TargetedContentValueKind
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentImage
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentAction
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Double>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Boolean>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentImage>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentAction>
  }
  // Windows.Services.TargetedContent.ITargetedContentValue
  [WinRTClassNameAttribute(STargetedContent_TargetedContentValue)]
  TargetedContent_ITargetedContentValue = interface(IInspectable)
  ['{AAFDE4B3-4215-4BF8-867F-43F04865F9BF}']
    function get_ValueKind: TargetedContent_TargetedContentValueKind; safecall;
    function get_Path: HSTRING; safecall;
    function get_String: HSTRING; safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    function get_Number: Double; safecall;
    function get_Boolean: Boolean; safecall;
    function get_File: IRandomAccessStreamReference; safecall;
    function get_ImageFile: TargetedContent_ITargetedContentImage; safecall;
    function get_Action: TargetedContent_ITargetedContentAction; safecall;
    function get_Strings: IVectorView_1__HSTRING; safecall;
    function get_Uris: IVectorView_1__IUriRuntimeClass; safecall;
    function get_Numbers: IVectorView_1__Double; safecall;
    function get_Booleans: IVectorView_1__Boolean; safecall;
    function get_Files: IVectorView_1__IRandomAccessStreamReference; safecall;
    function get_ImageFiles: IVectorView_1__TargetedContent_ITargetedContentImage; safecall;
    function get_Actions: IVectorView_1__TargetedContent_ITargetedContentAction; safecall;
    property Action: TargetedContent_ITargetedContentAction read get_Action;
    property Actions: IVectorView_1__TargetedContent_ITargetedContentAction read get_Actions;
    property Boolean: Boolean read get_Boolean;
    property Booleans: IVectorView_1__Boolean read get_Booleans;
    property &File: IRandomAccessStreamReference read get_File;
    property Files: IVectorView_1__IRandomAccessStreamReference read get_Files;
    property ImageFile: TargetedContent_ITargetedContentImage read get_ImageFile;
    property ImageFiles: IVectorView_1__TargetedContent_ITargetedContentImage read get_ImageFiles;
    property Number: Double read get_Number;
    property Numbers: IVectorView_1__Double read get_Numbers;
    property Path: HSTRING read get_Path;
    property &String: HSTRING read get_String;
    property Strings: IVectorView_1__HSTRING read get_Strings;
    property Uri: IUriRuntimeClass read get_Uri;
    property Uris: IVectorView_1__IUriRuntimeClass read get_Uris;
    property ValueKind: TargetedContent_TargetedContentValueKind read get_ValueKind;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentValue
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = interface(IInspectable)
  ['{5EE8132B-C17A-5E9C-A5B8-50046EFA47B2}']
    function get_Key: HSTRING; safecall;
    function get_Value: TargetedContent_ITargetedContentValue; safecall;
    property Key: HSTRING read get_Key;
    property Value: TargetedContent_ITargetedContentValue read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  IIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue_Base = interface(IInspectable)
  ['{B97E682B-6E0A-5EEA-B70B-25795B28E937}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  IIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = interface(IIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue_Base)
  ['{D7033487-BEE9-52AA-9301-F44E20E22419}']
    function get_Current: IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  IIterable_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue_Base = interface(IInspectable)
  ['{45A020D8-FE49-5720-950B-3CCEAB655531}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.TargetedContent.ITargetedContentValue>>
  IIterable_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue = interface(IIterable_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue_Base)
  ['{FE39EE98-B2BC-51D4-A65C-92FC53E14A1D}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__TargetedContent_ITargetedContentValue; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  IMapView_2__HSTRING__TargetedContent_ITargetedContentValue_Base = interface(IInspectable)
  ['{19A87E94-AB75-574F-A226-8726A0D8EB3E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentValue
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  IMapView_2__HSTRING__TargetedContent_ITargetedContentValue = interface(IMapView_2__HSTRING__TargetedContent_ITargetedContentValue_Base)
  ['{912F2A9E-4709-5963-8FDB-FA84BEDBD648}']
    function Lookup(key: HSTRING): TargetedContent_ITargetedContentValue; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__TargetedContent_ITargetedContentValue; out second: IMapView_2__HSTRING__TargetedContent_ITargetedContentValue); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IIterator_1__TargetedContent_ITargetedContentCollection_Base = interface(IInspectable)
  ['{6093B8FD-6D5D-53CD-B497-7B4540F10857}']
  end;
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentCollection
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IIterator_1__TargetedContent_ITargetedContentCollection = interface(IIterator_1__TargetedContent_ITargetedContentCollection_Base)
  ['{8B466069-8C41-57F4-8D92-B7E375C8D3D9}']
    function get_Current: TargetedContent_ITargetedContentCollection; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PTargetedContent_ITargetedContentCollection): Cardinal; safecall;
    property Current: TargetedContent_ITargetedContentCollection read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IIterable_1__TargetedContent_ITargetedContentCollection_Base = interface(IInspectable)
  ['{2049F813-37EE-5158-9996-709859F0CE49}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IIterable_1__TargetedContent_ITargetedContentCollection = interface(IIterable_1__TargetedContent_ITargetedContentCollection_Base)
  ['{E7CFDBAD-0551-59B8-881F-4448B45E57D8}']
    function First: IIterator_1__TargetedContent_ITargetedContentCollection; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentCollection
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  IVectorView_1__TargetedContent_ITargetedContentCollection = interface(IInspectable)
  ['{95C4EE43-C628-5A3B-94FD-7A1E33C25E7B}']
    function GetAt(index: Cardinal): TargetedContent_ITargetedContentCollection; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TargetedContent_ITargetedContentCollection; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PTargetedContent_ITargetedContentCollection): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Services.TargetedContent.TargetedContentAppInstallationState
  }
  // Windows.Services.TargetedContent.ITargetedContentItemState
  [WinRTClassNameAttribute(STargetedContent_TargetedContentItemState)]
  TargetedContent_ITargetedContentItemState = interface(IInspectable)
  ['{73935454-4C65-4B47-A441-472DE53C79B6}']
    function get_ShouldDisplay: Boolean; safecall;
    function get_AppInstallationState: TargetedContent_TargetedContentAppInstallationState; safecall;
    property AppInstallationState: TargetedContent_TargetedContentAppInstallationState read get_AppInstallationState;
    property ShouldDisplay: Boolean read get_ShouldDisplay;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Services.TargetedContent.TargetedContentInteraction
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentItemState
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  }
  // Windows.Services.TargetedContent.ITargetedContentItem
  [WinRTClassNameAttribute(STargetedContent_TargetedContentItem)]
  TargetedContent_ITargetedContentItem = interface(IInspectable)
  ['{38168DC4-276C-4C32-96BA-565C6E406E74}']
    function get_Path: HSTRING; safecall;
    procedure ReportInteraction(interaction: TargetedContent_TargetedContentInteraction); safecall;
    procedure ReportCustomInteraction(customInteractionName: HSTRING); safecall;
    function get_State: TargetedContent_ITargetedContentItemState; safecall;
    function get_Properties: IMapView_2__HSTRING__TargetedContent_ITargetedContentValue; safecall;
    function get_Collections: IVectorView_1__TargetedContent_ITargetedContentCollection; safecall;
    property Collections: IVectorView_1__TargetedContent_ITargetedContentCollection read get_Collections;
    property Path: HSTRING read get_Path;
    property Properties: IMapView_2__HSTRING__TargetedContent_ITargetedContentValue read get_Properties;
    property State: TargetedContent_ITargetedContentItemState read get_State;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IIterator_1__TargetedContent_ITargetedContentItem_Base = interface(IInspectable)
  ['{50109D8E-F711-5076-8309-E4E230EF7E85}']
  end;
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IIterator_1__TargetedContent_ITargetedContentItem = interface(IIterator_1__TargetedContent_ITargetedContentItem_Base)
  ['{30DC72C3-92DB-5061-A737-41CD0B30CBD9}']
    function get_Current: TargetedContent_ITargetedContentItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PTargetedContent_ITargetedContentItem): Cardinal; safecall;
    property Current: TargetedContent_ITargetedContentItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IIterable_1__TargetedContent_ITargetedContentItem_Base = interface(IInspectable)
  ['{03F38FB6-54E6-5BF1-913B-9510FEC8BE1F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.TargetedContent.ITargetedContentItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IIterable_1__TargetedContent_ITargetedContentItem = interface(IIterable_1__TargetedContent_ITargetedContentItem_Base)
  ['{285C6A83-EE35-520C-BD25-FF69B60C9142}']
    function First: IIterator_1__TargetedContent_ITargetedContentItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentItem>
  IVectorView_1__TargetedContent_ITargetedContentItem = interface(IInspectable)
  ['{7D1E349F-F3DB-52DD-8648-0F95A9E2ADBC}']
    function GetAt(index: Cardinal): TargetedContent_ITargetedContentItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TargetedContent_ITargetedContentItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PTargetedContent_ITargetedContentItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Services.TargetedContent.TargetedContentInteraction
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Services.TargetedContent.ITargetedContentValue>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentCollection>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Services.TargetedContent.ITargetedContentItem>
  }
  // Windows.Services.TargetedContent.ITargetedContentCollection
  [WinRTClassNameAttribute(STargetedContent_TargetedContentCollection)]
  TargetedContent_ITargetedContentCollection = interface(IInspectable)
  ['{2D4B66C5-F163-44BA-9F6E-E1A4C2BB559D}']
    function get_Id: HSTRING; safecall;
    procedure ReportInteraction(interaction: TargetedContent_TargetedContentInteraction); safecall;
    procedure ReportCustomInteraction(customInteractionName: HSTRING); safecall;
    function get_Path: HSTRING; safecall;
    function get_Properties: IMapView_2__HSTRING__TargetedContent_ITargetedContentValue; safecall;
    function get_Collections: IVectorView_1__TargetedContent_ITargetedContentCollection; safecall;
    function get_Items: IVectorView_1__TargetedContent_ITargetedContentItem; safecall;
    property Collections: IVectorView_1__TargetedContent_ITargetedContentCollection read get_Collections;
    property Id: HSTRING read get_Id;
    property Items: IVectorView_1__TargetedContent_ITargetedContentItem read get_Items;
    property Path: HSTRING read get_Path;
    property Properties: IMapView_2__HSTRING__TargetedContent_ITargetedContentValue read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.TargetedContentObjectKind
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentCollection
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentItem
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentValue
  }
  // Windows.Services.TargetedContent.ITargetedContentObject
  [WinRTClassNameAttribute(STargetedContent_TargetedContentObject)]
  TargetedContent_ITargetedContentObject = interface(IInspectable)
  ['{041D7969-2212-42D1-9DFA-88A8E3033AA3}']
    function get_ObjectKind: TargetedContent_TargetedContentObjectKind; safecall;
    function get_Collection: TargetedContent_ITargetedContentCollection; safecall;
    function get_Item: TargetedContent_ITargetedContentItem; safecall;
    function get_Value: TargetedContent_ITargetedContentValue; safecall;
    property Collection: TargetedContent_ITargetedContentCollection read get_Collection;
    property Item: TargetedContent_ITargetedContentItem read get_Item;
    property ObjectKind: TargetedContent_TargetedContentObjectKind read get_ObjectKind;
    property Value: TargetedContent_ITargetedContentValue read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Services.TargetedContent.TargetedContentAvailability
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentCollection
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentObject
  }
  // Windows.Services.TargetedContent.ITargetedContentContainer
  [WinRTClassNameAttribute(STargetedContent_TargetedContentContainer)]
  TargetedContent_ITargetedContentContainer = interface(IInspectable)
  ['{BC2494C9-8837-47C2-850F-D79D64595926}']
    function get_Id: HSTRING; safecall;
    function get_Timestamp: DateTime; safecall;
    function get_Availability: TargetedContent_TargetedContentAvailability; safecall;
    function get_Content: TargetedContent_ITargetedContentCollection; safecall;
    function SelectSingleObject(path: HSTRING): TargetedContent_ITargetedContentObject; safecall;
    property Availability: TargetedContent_TargetedContentAvailability read get_Availability;
    property Content: TargetedContent_ITargetedContentCollection read get_Content;
    property Id: HSTRING read get_Id;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer_Delegate_Base = interface(IUnknown)
  ['{8FC6BC2A-26CE-50B5-97BB-FCC80CA0871D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer = interface(AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer_Delegate_Base)
  ['{FED1B264-C32E-532C-A751-020C559F2EDE}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__TargetedContent_ITargetedContentContainer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  IAsyncOperation_1__TargetedContent_ITargetedContentContainer_Base = interface(IInspectable)
  ['{E757E0FC-0136-5F63-97B8-6A96B8D0601E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentContainer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  IAsyncOperation_1__TargetedContent_ITargetedContentContainer = interface(IAsyncOperation_1__TargetedContent_ITargetedContentContainer_Base)
  ['{E1123519-91E3-5624-B9D3-D89427E6DECC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer; safecall;
    function GetResults: TargetedContent_ITargetedContentContainer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentContainer read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IDeferral
  // Used Types:  Boolean
  }
  // Windows.Services.TargetedContent.ITargetedContentChangedEventArgs
  [WinRTClassNameAttribute(STargetedContent_TargetedContentChangedEventArgs)]
  TargetedContent_ITargetedContentChangedEventArgs = interface(IInspectable)
  ['{99D488C9-587E-4586-8EF7-B54CA9453A16}']
    function GetDeferral: IDeferral; safecall;
    function get_HasPreviousContentExpired: Boolean; safecall;
    property HasPreviousContentExpired: Boolean read get_HasPreviousContentExpired;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{EF11D751-9D56-580D-8A9F-51AE7E8036E3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentSubscription
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs = interface(TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs_Delegate_Base)
  ['{F783CE54-8F3E-532E-9D4B-64747270FB07}']
    procedure Invoke(sender: TargetedContent_ITargetedContentSubscription; args: TargetedContent_ITargetedContentChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs
  [WinRTClassNameAttribute(STargetedContent_TargetedContentAvailabilityChangedEventArgs)]
  TargetedContent_ITargetedContentAvailabilityChangedEventArgs = interface(IInspectable)
  ['{E0F59D26-5927-4450-965C-1CEB7BECDE65}']
    function GetDeferral: IDeferral; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{99929904-138A-59AC-A11A-FE0042F0FD50}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentSubscription
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs = interface(TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs_Delegate_Base)
  ['{967DFE2E-B4FE-5C8A-BDF2-C5F578917B11}']
    procedure Invoke(sender: TargetedContent_ITargetedContentSubscription; args: TargetedContent_ITargetedContentAvailabilityChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs
  [WinRTClassNameAttribute(STargetedContent_TargetedContentStateChangedEventArgs)]
  TargetedContent_ITargetedContentStateChangedEventArgs = interface(IInspectable)
  ['{9A1CEF3D-8073-4416-8DF2-546835A6414F}']
    function GetDeferral: IDeferral; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C4D5ACBE-F65B-5FA4-9242-D2860DE85D52}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentSubscription
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs>
  TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs = interface(TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs_Delegate_Base)
  ['{3DF9C7F4-A4B2-564F-AA7F-06C5D9689C6C}']
    procedure Invoke(sender: TargetedContent_ITargetedContentSubscription; args: TargetedContent_ITargetedContentStateChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Services.TargetedContent.ITargetedContentSubscription,Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs>
  }
  // Windows.Services.TargetedContent.ITargetedContentSubscription
  [WinRTClassNameAttribute(STargetedContent_TargetedContentSubscription)]
  TargetedContent_ITargetedContentSubscription = interface(IInspectable)
  ['{882C2C49-C652-4C7A-ACAD-1F7FA2986C73}']
    function get_Id: HSTRING; safecall;
    function GetContentContainerAsync: IAsyncOperation_1__TargetedContent_ITargetedContentContainer; safecall;
    function add_ContentChanged(handler: TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ContentChanged(cookie: EventRegistrationToken); safecall;
    function add_AvailabilityChanged(handler: TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentAvailabilityChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AvailabilityChanged(cookie: EventRegistrationToken); safecall;
    function add_StateChanged(handler: TypedEventHandler_2__TargetedContent_ITargetedContentSubscription__TargetedContent_ITargetedContentStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StateChanged(cookie: EventRegistrationToken); safecall;
    property Id: HSTRING read get_Id;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription_Delegate_Base = interface(IUnknown)
  ['{E4188C71-5A8E-57EC-B0DE-1D314FB3E2CF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription = interface(AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription_Delegate_Base)
  ['{D2B7262E-1BEA-57BB-B2AD-57ABA1E8D6B9}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__TargetedContent_ITargetedContentSubscription; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  IAsyncOperation_1__TargetedContent_ITargetedContentSubscription_Base = interface(IInspectable)
  ['{46F16F4B-8EC1-5C4F-B1F5-A7E7ACD63366}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentSubscription
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  IAsyncOperation_1__TargetedContent_ITargetedContentSubscription = interface(IAsyncOperation_1__TargetedContent_ITargetedContentSubscription_Base)
  ['{1BFE512A-FF67-5732-859C-5D1FA236EBAB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription; safecall;
    function GetResults: TargetedContent_ITargetedContentSubscription; safecall;
    property Completed: AsyncOperationCompletedHandler_1__TargetedContent_ITargetedContentSubscription read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentSubscription>
  // Used Types:  String
  // Used Types:  Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions
  }
  // Windows.Services.TargetedContent.ITargetedContentSubscriptionStatics
  [WinRTClassNameAttribute(STargetedContent_TargetedContentSubscription)]
  TargetedContent_ITargetedContentSubscriptionStatics = interface(IInspectable)
  ['{FADDFE80-360D-4916-B53C-7EA27090D02A}']
    function GetAsync(subscriptionId: HSTRING): IAsyncOperation_1__TargetedContent_ITargetedContentSubscription; safecall;
    function GetOptions(subscriptionId: HSTRING): TargetedContent_ITargetedContentSubscriptionOptions; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.TargetedContent.ITargetedContentContainer>
  // Used Types:  String
  }
  // Windows.Services.TargetedContent.ITargetedContentContainerStatics
  [WinRTClassNameAttribute(STargetedContent_TargetedContentContainer)]
  TargetedContent_ITargetedContentContainerStatics = interface(IInspectable)
  ['{5B47E7FB-2140-4C1F-A736-C59583F227D8}']
    function GetAsync(contentId: HSTRING): IAsyncOperation_1__TargetedContent_ITargetedContentContainer; safecall;
  end;

  {
  // Used Types:  Int32
  }
  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface(IInspectable)
  ['{548CEFBD-BC8A-5FA0-8DF2-957440FC8BF4}']
    function get_Value: Integer; safecall;
    property Value: Integer read get_Value;
  end;


  // Emit Forwarded classes
  // Windows.Services.Cortana.CortanaSettings
  // DualAPI
  // Implements: Windows.Services.Cortana.ICortanaSettings
  // Statics: "Windows.Services.Cortana.ICortanaSettingsStatics"
  TCortana_CortanaSettings = class(TWinRTGenericImportS<Cortana_ICortanaSettingsStatics>)
  public
    // -> Cortana_ICortanaSettingsStatics
    class function IsSupported: Boolean; static; inline;
    class function GetDefault: Cortana_ICortanaSettings; static; inline;
  end;

  // Windows.Services.TargetedContent.TargetedContentSubscription
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentSubscription
  // Statics: "Windows.Services.TargetedContent.ITargetedContentSubscriptionStatics"
  TTargetedContent_TargetedContentSubscription = class(TWinRTGenericImportS<TargetedContent_ITargetedContentSubscriptionStatics>)
  public
    // -> TargetedContent_ITargetedContentSubscriptionStatics
    class function GetAsync(subscriptionId: HSTRING): IAsyncOperation_1__TargetedContent_ITargetedContentSubscription; static; inline;
    class function GetOptions(subscriptionId: HSTRING): TargetedContent_ITargetedContentSubscriptionOptions; static; inline;
  end;

  // Windows.Services.TargetedContent.TargetedContentSubscriptionOptions
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentSubscriptionOptions

  // Windows.Services.TargetedContent.TargetedContentContainer
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentContainer
  // Statics: "Windows.Services.TargetedContent.ITargetedContentContainerStatics"
  TTargetedContent_TargetedContentContainer = class(TWinRTGenericImportS<TargetedContent_ITargetedContentContainerStatics>)
  public
    // -> TargetedContent_ITargetedContentContainerStatics
    class function GetAsync(contentId: HSTRING): IAsyncOperation_1__TargetedContent_ITargetedContentContainer; static; inline;
  end;

  // Windows.Services.TargetedContent.TargetedContentChangedEventArgs
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentChangedEventArgs

  // Windows.Services.TargetedContent.TargetedContentAvailabilityChangedEventArgs
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentAvailabilityChangedEventArgs

  // Windows.Services.TargetedContent.TargetedContentStateChangedEventArgs
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentStateChangedEventArgs

  // Windows.Services.TargetedContent.TargetedContentCollection
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentCollection

  // Windows.Services.TargetedContent.TargetedContentObject
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentObject

  // Windows.Services.TargetedContent.TargetedContentItem
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentItem

  // Windows.Services.TargetedContent.TargetedContentValue
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentValue

  // Windows.Services.TargetedContent.TargetedContentItemState
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentItemState

  // Windows.Services.TargetedContent.TargetedContentFile
  // DualAPI
  // Implements: Windows.Storage.Streams.IRandomAccessStreamReference

  // Windows.Services.TargetedContent.TargetedContentImage
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentImage
  // Implements: Windows.Storage.Streams.IRandomAccessStreamReference

  // Windows.Services.TargetedContent.TargetedContentAction
  // DualAPI
  // Implements: Windows.Services.TargetedContent.ITargetedContentAction


implementation

  // Emit Classes Implementation
 { TCortana_CortanaSettings }

class function TCortana_CortanaSettings.IsSupported: Boolean;
begin
  Result := Statics.IsSupported;
end;

class function TCortana_CortanaSettings.GetDefault: Cortana_ICortanaSettings;
begin
  Result := Statics.GetDefault;
end;


 { TTargetedContent_TargetedContentSubscription }

class function TTargetedContent_TargetedContentSubscription.GetAsync(subscriptionId: HSTRING): IAsyncOperation_1__TargetedContent_ITargetedContentSubscription;
begin
  Result := Statics.GetAsync(subscriptionId);
end;

class function TTargetedContent_TargetedContentSubscription.GetOptions(subscriptionId: HSTRING): TargetedContent_ITargetedContentSubscriptionOptions;
begin
  Result := Statics.GetOptions(subscriptionId);
end;


 { TTargetedContent_TargetedContentContainer }

class function TTargetedContent_TargetedContentContainer.GetAsync(contentId: HSTRING): IAsyncOperation_1__TargetedContent_ITargetedContentContainer;
begin
  Result := Statics.GetAsync(contentId);
end;



end.
