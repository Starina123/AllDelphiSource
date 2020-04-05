{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Devices.AllJoyn;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.SystemRT, 
  Winapi.CommonTypes, 
  Winapi.Security.Cryptography, 
  Winapi.Security.Credentials, 
  Winapi.ApplicationModel, 
  Winapi.Globalization, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Devices.AllJoyn.IAllJoynStatusStatics
  IAllJoynStatusStatics = interface;
  PIAllJoynStatusStatics = ^IAllJoynStatusStatics;

  // Windows.Devices.AllJoyn.IAllJoynAboutData
  IAllJoynAboutData = interface;
  PIAllJoynAboutData = ^IAllJoynAboutData;

  // Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs
  IAllJoynBusAttachmentStateChangedEventArgs = interface;
  PIAllJoynBusAttachmentStateChangedEventArgs = ^IAllJoynBusAttachmentStateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs = ^TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IIterator_1__AllJoynAuthenticationMechanism = interface;
  PIIterator_1__AllJoynAuthenticationMechanism = ^IIterator_1__AllJoynAuthenticationMechanism;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IIterable_1__AllJoynAuthenticationMechanism = interface;
  PIIterable_1__AllJoynAuthenticationMechanism = ^IIterable_1__AllJoynAuthenticationMechanism;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IVectorView_1__AllJoynAuthenticationMechanism = interface;
  PIVectorView_1__AllJoynAuthenticationMechanism = ^IVectorView_1__AllJoynAuthenticationMechanism;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IVector_1__AllJoynAuthenticationMechanism = interface;
  PIVector_1__AllJoynAuthenticationMechanism = ^IVector_1__AllJoynAuthenticationMechanism;

  // Windows.Devices.AllJoyn.IAllJoynCredentials
  IAllJoynCredentials = interface;
  PIAllJoynCredentials = ^IAllJoynCredentials;

  // Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs
  IAllJoynCredentialsRequestedEventArgs = interface;
  PIAllJoynCredentialsRequestedEventArgs = ^IAllJoynCredentialsRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs = ^TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs
  IAllJoynCredentialsVerificationRequestedEventArgs = interface;
  PIAllJoynCredentialsVerificationRequestedEventArgs = ^IAllJoynCredentialsVerificationRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs = ^TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs
  IAllJoynAuthenticationCompleteEventArgs = interface;
  PIAllJoynAuthenticationCompleteEventArgs = ^IAllJoynAuthenticationCompleteEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs = ^TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynBusAttachment
  IAllJoynBusAttachment = interface;
  PIAllJoynBusAttachment = ^IAllJoynBusAttachment;

  // Windows.Devices.AllJoyn.IAllJoynAboutDataView
  IAllJoynAboutDataView = interface;
  PIAllJoynAboutDataView = ^IAllJoynAboutDataView;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  AsyncOperationCompletedHandler_1__IAllJoynAboutDataView = interface;
  PAsyncOperationCompletedHandler_1__IAllJoynAboutDataView = ^AsyncOperationCompletedHandler_1__IAllJoynAboutDataView;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  IAsyncOperation_1__IAllJoynAboutDataView = interface;
  PIAsyncOperation_1__IAllJoynAboutDataView = ^IAsyncOperation_1__IAllJoynAboutDataView;

  // Windows.Devices.AllJoyn.IAllJoynServiceInfo
  IAllJoynServiceInfo = interface;
  PIAllJoynServiceInfo = ^IAllJoynServiceInfo;

  // Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
  IAllJoynAcceptSessionJoinerEventArgs = interface;
  PIAllJoynAcceptSessionJoinerEventArgs = ^IAllJoynAcceptSessionJoinerEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs = ^TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
  IAllJoynSessionMemberAddedEventArgs = interface;
  PIAllJoynSessionMemberAddedEventArgs = ^IAllJoynSessionMemberAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs = ^TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
  IAllJoynSessionMemberRemovedEventArgs = interface;
  PIAllJoynSessionMemberRemovedEventArgs = ^IAllJoynSessionMemberRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs = ^TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
  IAllJoynSessionLostEventArgs = interface;
  PIAllJoynSessionLostEventArgs = ^IAllJoynSessionLostEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs = interface;
  PTypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs = ^TypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynSession
  IAllJoynSession = interface;
  PIAllJoynSession = ^IAllJoynSession;

  // Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
  IAllJoynSessionJoinedEventArgs = interface;
  PIAllJoynSessionJoinedEventArgs = ^IAllJoynSessionJoinedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs = ^TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynBusAttachment2
  IAllJoynBusAttachment2 = interface;
  PIAllJoynBusAttachment2 = ^IAllJoynBusAttachment2;

  // Windows.Devices.AllJoyn.IAllJoynBusAttachmentStatics
  IAllJoynBusAttachmentStatics = interface;
  PIAllJoynBusAttachmentStatics = ^IAllJoynBusAttachmentStatics;

  // Windows.Devices.AllJoyn.IAllJoynBusAttachmentFactory
  IAllJoynBusAttachmentFactory = interface;
  PIAllJoynBusAttachmentFactory = ^IAllJoynBusAttachmentFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynSession>
  AsyncOperationCompletedHandler_1__IAllJoynSession = interface;
  PAsyncOperationCompletedHandler_1__IAllJoynSession = ^AsyncOperationCompletedHandler_1__IAllJoynSession;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynSession>
  IAsyncOperation_1__IAllJoynSession = interface;
  PIAsyncOperation_1__IAllJoynSession = ^IAsyncOperation_1__IAllJoynSession;

  // Windows.Devices.AllJoyn.IAllJoynSessionStatics
  IAllJoynSessionStatics = interface;
  PIAllJoynSessionStatics = ^IAllJoynSessionStatics;

  // Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
  IAllJoynBusObjectStoppedEventArgs = interface;
  PIAllJoynBusObjectStoppedEventArgs = ^IAllJoynBusObjectStoppedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusObject,Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs>
  TypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs = interface;
  PTypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs = ^TypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynBusObject
  IAllJoynBusObject = interface;
  PIAllJoynBusObject = ^IAllJoynBusObject;

  // Windows.Devices.AllJoyn.IAllJoynProducer
  IAllJoynProducer = interface;
  PIAllJoynProducer = ^IAllJoynProducer;

  // Windows.Devices.AllJoyn.IAllJoynBusObjectFactory
  IAllJoynBusObjectFactory = interface;
  PIAllJoynBusObjectFactory = ^IAllJoynBusObjectFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  AsyncOperationCompletedHandler_1__IAllJoynServiceInfo = interface;
  PAsyncOperationCompletedHandler_1__IAllJoynServiceInfo = ^AsyncOperationCompletedHandler_1__IAllJoynServiceInfo;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  IAsyncOperation_1__IAllJoynServiceInfo = interface;
  PIAsyncOperation_1__IAllJoynServiceInfo = ^IAsyncOperation_1__IAllJoynServiceInfo;

  // Windows.Devices.AllJoyn.IAllJoynServiceInfoStatics
  IAllJoynServiceInfoStatics = interface;
  PIAllJoynServiceInfoStatics = ^IAllJoynServiceInfoStatics;

  // Windows.Devices.AllJoyn.IAllJoynServiceInfoFactory
  IAllJoynServiceInfoFactory = interface;
  PIAllJoynServiceInfoFactory = ^IAllJoynServiceInfoFactory;

  // Windows.Devices.AllJoyn.IAllJoynAboutDataViewStatics
  IAllJoynAboutDataViewStatics = interface;
  PIAllJoynAboutDataViewStatics = ^IAllJoynAboutDataViewStatics;

  // Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoiner
  IAllJoynAcceptSessionJoiner = interface;
  PIAllJoynAcceptSessionJoiner = ^IAllJoynAcceptSessionJoiner;

  // Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgsFactory
  IAllJoynAcceptSessionJoinerEventArgsFactory = interface;
  PIAllJoynAcceptSessionJoinerEventArgsFactory = ^IAllJoynAcceptSessionJoinerEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgsFactory
  IAllJoynSessionMemberAddedEventArgsFactory = interface;
  PIAllJoynSessionMemberAddedEventArgsFactory = ^IAllJoynSessionMemberAddedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgsFactory
  IAllJoynSessionMemberRemovedEventArgsFactory = interface;
  PIAllJoynSessionMemberRemovedEventArgsFactory = ^IAllJoynSessionMemberRemovedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgsFactory
  IAllJoynSessionJoinedEventArgsFactory = interface;
  PIAllJoynSessionJoinedEventArgsFactory = ^IAllJoynSessionJoinedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgsFactory
  IAllJoynSessionLostEventArgsFactory = interface;
  PIAllJoynSessionLostEventArgsFactory = ^IAllJoynSessionLostEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs
  IAllJoynProducerStoppedEventArgs = interface;
  PIAllJoynProducerStoppedEventArgs = ^IAllJoynProducerStoppedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgsFactory
  IAllJoynProducerStoppedEventArgsFactory = interface;
  PIAllJoynProducerStoppedEventArgsFactory = ^IAllJoynProducerStoppedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgsFactory
  IAllJoynBusObjectStoppedEventArgsFactory = interface;
  PIAllJoynBusObjectStoppedEventArgsFactory = ^IAllJoynBusObjectStoppedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs
  IAllJoynWatcherStoppedEventArgs = interface;
  PIAllJoynWatcherStoppedEventArgs = ^IAllJoynWatcherStoppedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgsFactory
  IAllJoynWatcherStoppedEventArgsFactory = interface;
  PIAllJoynWatcherStoppedEventArgsFactory = ^IAllJoynWatcherStoppedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs
  IAllJoynServiceInfoRemovedEventArgs = interface;
  PIAllJoynServiceInfoRemovedEventArgs = ^IAllJoynServiceInfoRemovedEventArgs;

  // Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgsFactory
  IAllJoynServiceInfoRemovedEventArgsFactory = interface;
  PIAllJoynServiceInfoRemovedEventArgsFactory = ^IAllJoynServiceInfoRemovedEventArgsFactory;

  // Windows.Devices.AllJoyn.IAllJoynMessageInfo
  IAllJoynMessageInfo = interface;
  PIAllJoynMessageInfo = ^IAllJoynMessageInfo;

  // Windows.Devices.AllJoyn.IAllJoynMessageInfoFactory
  IAllJoynMessageInfoFactory = interface;
  PIAllJoynMessageInfoFactory = ^IAllJoynMessageInfoFactory;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Devices.AllJoyn Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynStatusStatics
  [WinRTClassNameAttribute(SAllJoynStatus)]
  IAllJoynStatusStatics = interface(IInspectable)
  ['{D0B7A17E-0D29-4DA9-8AC6-54C554BEDBC5}']
    function get_Ok: Integer; safecall;
    function get_Fail: Integer; safecall;
    function get_OperationTimedOut: Integer; safecall;
    function get_OtherEndClosed: Integer; safecall;
    function get_ConnectionRefused: Integer; safecall;
    function get_AuthenticationFailed: Integer; safecall;
    function get_AuthenticationRejectedByUser: Integer; safecall;
    function get_SslConnectFailed: Integer; safecall;
    function get_SslIdentityVerificationFailed: Integer; safecall;
    function get_InsufficientSecurity: Integer; safecall;
    function get_InvalidArgument1: Integer; safecall;
    function get_InvalidArgument2: Integer; safecall;
    function get_InvalidArgument3: Integer; safecall;
    function get_InvalidArgument4: Integer; safecall;
    function get_InvalidArgument5: Integer; safecall;
    function get_InvalidArgument6: Integer; safecall;
    function get_InvalidArgument7: Integer; safecall;
    function get_InvalidArgument8: Integer; safecall;
    property AuthenticationFailed: Integer read get_AuthenticationFailed;
    property AuthenticationRejectedByUser: Integer read get_AuthenticationRejectedByUser;
    property ConnectionRefused: Integer read get_ConnectionRefused;
    property Fail: Integer read get_Fail;
    property InsufficientSecurity: Integer read get_InsufficientSecurity;
    property InvalidArgument1: Integer read get_InvalidArgument1;
    property InvalidArgument2: Integer read get_InvalidArgument2;
    property InvalidArgument3: Integer read get_InvalidArgument3;
    property InvalidArgument4: Integer read get_InvalidArgument4;
    property InvalidArgument5: Integer read get_InvalidArgument5;
    property InvalidArgument6: Integer read get_InvalidArgument6;
    property InvalidArgument7: Integer read get_InvalidArgument7;
    property InvalidArgument8: Integer read get_InvalidArgument8;
    property Ok: Integer read get_Ok;
    property OperationTimedOut: Integer read get_OperationTimedOut;
    property OtherEndClosed: Integer read get_OtherEndClosed;
    property SslConnectFailed: Integer read get_SslConnectFailed;
    property SslIdentityVerificationFailed: Integer read get_SslIdentityVerificationFailed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Guid
  }
  // Windows.Devices.AllJoyn.IAllJoynAboutData
  [WinRTClassNameAttribute(SAllJoynAboutData)]
  IAllJoynAboutData = interface(IInspectable)
  ['{E5A9BF00-1FA2-4839-93EF-F9DF404890F7}']
    function get_IsEnabled: Boolean; safecall;
    procedure put_IsEnabled(value: Boolean); safecall;
    function get_DefaultAppName: HSTRING; safecall;
    procedure put_DefaultAppName(value: HSTRING); safecall;
    function get_AppNames: IMap_2__HSTRING__HSTRING; safecall;
    function get_DateOfManufacture: IReference_1__DateTime; safecall;
    procedure put_DateOfManufacture(value: IReference_1__DateTime); safecall;
    function get_DefaultDescription: HSTRING; safecall;
    procedure put_DefaultDescription(value: HSTRING); safecall;
    function get_Descriptions: IMap_2__HSTRING__HSTRING; safecall;
    function get_DefaultManufacturer: HSTRING; safecall;
    procedure put_DefaultManufacturer(value: HSTRING); safecall;
    function get_Manufacturers: IMap_2__HSTRING__HSTRING; safecall;
    function get_ModelNumber: HSTRING; safecall;
    procedure put_ModelNumber(value: HSTRING); safecall;
    function get_SoftwareVersion: HSTRING; safecall;
    procedure put_SoftwareVersion(value: HSTRING); safecall;
    function get_SupportUrl: IUriRuntimeClass; safecall;
    procedure put_SupportUrl(value: IUriRuntimeClass); safecall;
    function get_AppId: TGuid; safecall;
    procedure put_AppId(value: TGuid); safecall;
    property AppId: TGuid read get_AppId write put_AppId;
    property AppNames: IMap_2__HSTRING__HSTRING read get_AppNames;
    property DateOfManufacture: IReference_1__DateTime read get_DateOfManufacture write put_DateOfManufacture;
    property DefaultAppName: HSTRING read get_DefaultAppName write put_DefaultAppName;
    property DefaultDescription: HSTRING read get_DefaultDescription write put_DefaultDescription;
    property DefaultManufacturer: HSTRING read get_DefaultManufacturer write put_DefaultManufacturer;
    property Descriptions: IMap_2__HSTRING__HSTRING read get_Descriptions;
    property IsEnabled: Boolean read get_IsEnabled write put_IsEnabled;
    property Manufacturers: IMap_2__HSTRING__HSTRING read get_Manufacturers;
    property ModelNumber: HSTRING read get_ModelNumber write put_ModelNumber;
    property SoftwareVersion: HSTRING read get_SoftwareVersion write put_SoftwareVersion;
    property SupportUrl: IUriRuntimeClass read get_SupportUrl write put_SupportUrl;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynBusAttachmentState
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs
  [WinRTClassNameAttribute(SAllJoynBusAttachmentStateChangedEventArgs)]
  IAllJoynBusAttachmentStateChangedEventArgs = interface(IInspectable)
  ['{D82E75F4-C02A-41EC-A8D5-EAB1558953AA}']
    function get_State: AllJoynBusAttachmentState; safecall;
    function get_Status: Integer; safecall;
    property State: AllJoynBusAttachmentState read get_State;
    property Status: Integer read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{82A8561D-3693-5C90-8CF2-58DE83D80243}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs = interface(TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs_Delegate_Base)
  ['{29DC3D05-5B86-5A84-8420-640DC74209A6}']
    procedure Invoke(sender: IAllJoynBusAttachment; args: IAllJoynBusAttachmentStateChangedEventArgs); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IIterator_1__AllJoynAuthenticationMechanism_Base = interface(IInspectable)
  ['{0FBC36D2-F46E-5A4D-AA10-4C806B4945D6}']
  end;
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IIterator_1__AllJoynAuthenticationMechanism = interface(IIterator_1__AllJoynAuthenticationMechanism_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: AllJoynAuthenticationMechanism; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAllJoynAuthenticationMechanism): Cardinal; safecall;
    property Current: AllJoynAuthenticationMechanism read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IIterable_1__AllJoynAuthenticationMechanism_Base = interface(IInspectable)
  ['{D307C7AF-4106-5D1C-B06C-5EB593D9BE34}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IIterable_1__AllJoynAuthenticationMechanism = interface(IIterable_1__AllJoynAuthenticationMechanism_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__AllJoynAuthenticationMechanism; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IVectorView_1__AllJoynAuthenticationMechanism = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): AllJoynAuthenticationMechanism; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: AllJoynAuthenticationMechanism; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAllJoynAuthenticationMechanism): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  IVector_1__AllJoynAuthenticationMechanism = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): AllJoynAuthenticationMechanism; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__AllJoynAuthenticationMechanism; safecall;
    function IndexOf(value: AllJoynAuthenticationMechanism; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: AllJoynAuthenticationMechanism); safecall;
    procedure InsertAt(index: Cardinal; value: AllJoynAuthenticationMechanism); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: AllJoynAuthenticationMechanism); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAllJoynAuthenticationMechanism): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PAllJoynAuthenticationMechanism); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  // Used Types:  Windows.Security.Cryptography.Certificates.ICertificate
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Devices.AllJoyn.IAllJoynCredentials
  [WinRTClassNameAttribute(SAllJoynCredentials)]
  IAllJoynCredentials = interface(IInspectable)
  ['{824650F2-A190-40B1-ABAB-349EC244DFAA}']
    function get_AuthenticationMechanism: AllJoynAuthenticationMechanism; safecall;
    function get_Certificate: Certificates_ICertificate; safecall;
    procedure put_Certificate(value: Certificates_ICertificate); safecall;
    function get_PasswordCredential: IPasswordCredential; safecall;
    procedure put_PasswordCredential(value: IPasswordCredential); safecall;
    function get_Timeout: TimeSpan; safecall;
    procedure put_Timeout(value: TimeSpan); safecall;
    property AuthenticationMechanism: AllJoynAuthenticationMechanism read get_AuthenticationMechanism;
    property Certificate: Certificates_ICertificate read get_Certificate write put_Certificate;
    property PasswordCredential: IPasswordCredential read get_PasswordCredential write put_PasswordCredential;
    property Timeout: TimeSpan read get_Timeout write put_Timeout;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynCredentials
  // Used Types:  String
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs
  [WinRTClassNameAttribute(SAllJoynCredentialsRequestedEventArgs)]
  IAllJoynCredentialsRequestedEventArgs = interface(IInspectable)
  ['{6A87E34E-B069-4B80-9E1A-41BC837C65D2}']
    function get_AttemptCount: Word; safecall;
    function get_Credentials: IAllJoynCredentials; safecall;
    function get_PeerUniqueName: HSTRING; safecall;
    function get_RequestedUserName: HSTRING; safecall;
    function GetDeferral: IDeferral; safecall;
    property AttemptCount: Word read get_AttemptCount;
    property Credentials: IAllJoynCredentials read get_Credentials;
    property PeerUniqueName: HSTRING read get_PeerUniqueName;
    property RequestedUserName: HSTRING read get_RequestedUserName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{AB2196E7-4B41-53BD-95B1-B80CAD824795}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs = interface(TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs_Delegate_Base)
  ['{E7DD83C2-EA54-565E-9FAA-4BEE17B6871B}']
    procedure Invoke(sender: IAllJoynBusAttachment; args: IAllJoynCredentialsRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  // Used Types:  String
  // Used Types:  Windows.Security.Cryptography.Certificates.ICertificate
  // Used Types:  Windows.Networking.Sockets.SocketSslErrorSeverity
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Security.Cryptography.Certificates.ChainValidationResult>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Security.Cryptography.Certificates.ICertificate>
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs
  [WinRTClassNameAttribute(SAllJoynCredentialsVerificationRequestedEventArgs)]
  IAllJoynCredentialsVerificationRequestedEventArgs = interface(IInspectable)
  ['{800A7612-B805-44AF-A2E1-792AB655A2D0}']
    function get_AuthenticationMechanism: AllJoynAuthenticationMechanism; safecall;
    function get_PeerUniqueName: HSTRING; safecall;
    function get_PeerCertificate: Certificates_ICertificate; safecall;
    function get_PeerCertificateErrorSeverity: SocketSslErrorSeverity; safecall;
    function get_PeerCertificateErrors: IVectorView_1__Certificates_ChainValidationResult; safecall;
    function get_PeerIntermediateCertificates: IVectorView_1__Certificates_ICertificate; safecall;
    procedure Accept; safecall;
    function GetDeferral: IDeferral; safecall;
    property AuthenticationMechanism: AllJoynAuthenticationMechanism read get_AuthenticationMechanism;
    property PeerCertificate: Certificates_ICertificate read get_PeerCertificate;
    property PeerCertificateErrorSeverity: SocketSslErrorSeverity read get_PeerCertificateErrorSeverity;
    property PeerCertificateErrors: IVectorView_1__Certificates_ChainValidationResult read get_PeerCertificateErrors;
    property PeerIntermediateCertificates: IVectorView_1__Certificates_ICertificate read get_PeerIntermediateCertificates;
    property PeerUniqueName: HSTRING read get_PeerUniqueName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{7EF99C96-51B1-5670-A41F-AE404F2FF53F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs = interface(TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs_Delegate_Base)
  ['{4AD61AAB-D8D2-5DE7-B9C8-F595115E267F}']
    procedure Invoke(sender: IAllJoynBusAttachment; args: IAllJoynCredentialsVerificationRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs
  [WinRTClassNameAttribute(SAllJoynAuthenticationCompleteEventArgs)]
  IAllJoynAuthenticationCompleteEventArgs = interface(IInspectable)
  ['{97B4701C-15DC-4B53-B6A4-7D134300D7BF}']
    function get_AuthenticationMechanism: AllJoynAuthenticationMechanism; safecall;
    function get_PeerUniqueName: HSTRING; safecall;
    function get_Succeeded: Boolean; safecall;
    property AuthenticationMechanism: AllJoynAuthenticationMechanism read get_AuthenticationMechanism;
    property PeerUniqueName: HSTRING read get_PeerUniqueName;
    property Succeeded: Boolean read get_Succeeded;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs_Delegate_Base = interface(IUnknown)
  ['{E4FD18B4-4CDE-508E-8084-63E7283262C5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs = interface(TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs_Delegate_Base)
  ['{67D215E8-9E69-5A88-815C-2098F6761202}']
    procedure Invoke(sender: IAllJoynBusAttachment; args: IAllJoynAuthenticationCompleteEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynAboutData
  // Used Types:  String
  // Used Types:  Windows.Devices.AllJoyn.AllJoynBusAttachmentState
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Int32>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs>
  }
  // Windows.Devices.AllJoyn.IAllJoynBusAttachment
  [WinRTClassNameAttribute(SAllJoynBusAttachment)]
  IAllJoynBusAttachment = interface(IInspectable)
  ['{F309F153-1EED-42C3-A20E-436D41FE62F6}']
    function get_AboutData: IAllJoynAboutData; safecall;
    function get_ConnectionSpecification: HSTRING; safecall;
    function get_State: AllJoynBusAttachmentState; safecall;
    function get_UniqueName: HSTRING; safecall;
    function PingAsync(uniqueName: HSTRING): IAsyncOperation_1__Integer; safecall;
    procedure Connect; safecall;
    procedure Disconnect; safecall;
    function add_StateChanged(handler: TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynBusAttachmentStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StateChanged(token: EventRegistrationToken); safecall;
    function get_AuthenticationMechanisms: IVector_1__AllJoynAuthenticationMechanism; safecall;
    function add_CredentialsRequested(handler: TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CredentialsRequested(token: EventRegistrationToken); safecall;
    function add_CredentialsVerificationRequested(handler: TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynCredentialsVerificationRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CredentialsVerificationRequested(token: EventRegistrationToken); safecall;
    function add_AuthenticationComplete(handler: TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAuthenticationCompleteEventArgs): EventRegistrationToken; safecall;
    procedure remove_AuthenticationComplete(token: EventRegistrationToken); safecall;
    property AboutData: IAllJoynAboutData read get_AboutData;
    property AuthenticationMechanisms: IVector_1__AllJoynAuthenticationMechanism read get_AuthenticationMechanisms;
    property ConnectionSpecification: HSTRING read get_ConnectionSpecification;
    property State: AllJoynBusAttachmentState read get_State;
    property UniqueName: HSTRING read get_UniqueName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Globalization.ILanguage
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Globalization.ILanguage>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Devices.AllJoyn.IAllJoynAboutDataView
  [WinRTClassNameAttribute(SAllJoynAboutDataView)]
  IAllJoynAboutDataView = interface(IInspectable)
  ['{6823111F-6212-4934-9C48-E19CA4984288}']
    function get_Status: Integer; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    function get_AJSoftwareVersion: HSTRING; safecall;
    function get_AppId: TGuid; safecall;
    function get_DateOfManufacture: IReference_1__DateTime; safecall;
    function get_DefaultLanguage: ILanguage; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_HardwareVersion: HSTRING; safecall;
    function get_ModelNumber: HSTRING; safecall;
    function get_SoftwareVersion: HSTRING; safecall;
    function get_SupportedLanguages: IVectorView_1__ILanguage; safecall;
    function get_SupportUrl: IUriRuntimeClass; safecall;
    function get_AppName: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_DeviceName: HSTRING; safecall;
    function get_Manufacturer: HSTRING; safecall;
    property AJSoftwareVersion: HSTRING read get_AJSoftwareVersion;
    property AppId: TGuid read get_AppId;
    property AppName: HSTRING read get_AppName;
    property DateOfManufacture: IReference_1__DateTime read get_DateOfManufacture;
    property DefaultLanguage: ILanguage read get_DefaultLanguage;
    property Description: HSTRING read get_Description;
    property DeviceId: HSTRING read get_DeviceId;
    property DeviceName: HSTRING read get_DeviceName;
    property HardwareVersion: HSTRING read get_HardwareVersion;
    property Manufacturer: HSTRING read get_Manufacturer;
    property ModelNumber: HSTRING read get_ModelNumber;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property SoftwareVersion: HSTRING read get_SoftwareVersion;
    property Status: Integer read get_Status;
    property SupportUrl: IUriRuntimeClass read get_SupportUrl;
    property SupportedLanguages: IVectorView_1__ILanguage read get_SupportedLanguages;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  AsyncOperationCompletedHandler_1__IAllJoynAboutDataView_Delegate_Base = interface(IUnknown)
  ['{BA2DA2F5-F9B0-5C66-8FC9-7D437A67F28A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  AsyncOperationCompletedHandler_1__IAllJoynAboutDataView = interface(AsyncOperationCompletedHandler_1__IAllJoynAboutDataView_Delegate_Base)
  ['{F8256533-24D4-517F-8837-AFB1442A90AB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IAllJoynAboutDataView; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  IAsyncOperation_1__IAllJoynAboutDataView_Base = interface(IInspectable)
  ['{3757414E-F54B-51C4-8F2F-E0477559B2AD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynAboutDataView
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  IAsyncOperation_1__IAllJoynAboutDataView = interface(IAsyncOperation_1__IAllJoynAboutDataView_Base)
  ['{AA3E95CB-D128-5A0F-8E68-05ABB381FBEC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IAllJoynAboutDataView); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IAllJoynAboutDataView; safecall;
    function GetResults: IAllJoynAboutDataView; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IAllJoynAboutDataView read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt16
  }
  // Windows.Devices.AllJoyn.IAllJoynServiceInfo
  [WinRTClassNameAttribute(SAllJoynServiceInfo)]
  IAllJoynServiceInfo = interface(IInspectable)
  ['{4CBE8209-B93E-4182-999B-DDD000F9C575}']
    function get_UniqueName: HSTRING; safecall;
    function get_ObjectPath: HSTRING; safecall;
    function get_SessionPort: Word; safecall;
    property ObjectPath: HSTRING read get_ObjectPath;
    property SessionPort: Word read get_SessionPort;
    property UniqueName: HSTRING read get_UniqueName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.AllJoyn.AllJoynTrafficType
  // Used Types:  Boolean
  }
  // Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
  [WinRTClassNameAttribute(SAllJoynAcceptSessionJoinerEventArgs)]
  IAllJoynAcceptSessionJoinerEventArgs = interface(IInspectable)
  ['{4EFB5365-3E8A-4257-8F10-539CE0D56C0F}']
    function get_UniqueName: HSTRING; safecall;
    function get_SessionPort: Word; safecall;
    function get_TrafficType: AllJoynTrafficType; safecall;
    function get_SamePhysicalNode: Boolean; safecall;
    function get_SameNetwork: Boolean; safecall;
    procedure Accept; safecall;
    property SameNetwork: Boolean read get_SameNetwork;
    property SamePhysicalNode: Boolean read get_SamePhysicalNode;
    property SessionPort: Word read get_SessionPort;
    property TrafficType: AllJoynTrafficType read get_TrafficType;
    property UniqueName: HSTRING read get_UniqueName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs_Delegate_Base = interface(IUnknown)
  ['{DD224D96-F45C-5E3D-8860-8596D0E474F0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs = interface(TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs_Delegate_Base)
  ['{F41E75C7-5B92-52CC-AFEE-54CF2AE4A301}']
    procedure Invoke(sender: IAllJoynBusAttachment; args: IAllJoynAcceptSessionJoinerEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
  [WinRTClassNameAttribute(SAllJoynSessionMemberAddedEventArgs)]
  IAllJoynSessionMemberAddedEventArgs = interface(IInspectable)
  ['{49A2798A-0DD1-46C1-9CD6-27190E503A5E}']
    function get_UniqueName: HSTRING; safecall;
    property UniqueName: HSTRING read get_UniqueName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{330BAA61-1C24-5FAA-AF3C-4D69AD2F1E31}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs = interface(TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs_Delegate_Base)
  ['{4635741C-8ACC-5D6C-A0EF-1D2048BF3E61}']
    procedure Invoke(sender: IAllJoynSession; args: IAllJoynSessionMemberAddedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
  [WinRTClassNameAttribute(SAllJoynSessionMemberRemovedEventArgs)]
  IAllJoynSessionMemberRemovedEventArgs = interface(IInspectable)
  ['{409A219F-AA4A-4893-B430-BAA1B63C6219}']
    function get_UniqueName: HSTRING; safecall;
    property UniqueName: HSTRING read get_UniqueName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{2969ED7C-DB6C-58AA-9F6D-89E7FE089FC1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs = interface(TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs_Delegate_Base)
  ['{44FE5812-1C70-5379-BCA1-4D01BA4F5FAC}']
    procedure Invoke(sender: IAllJoynSession; args: IAllJoynSessionMemberRemovedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.AllJoynSessionLostReason
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
  [WinRTClassNameAttribute(SAllJoynSessionLostEventArgs)]
  IAllJoynSessionLostEventArgs = interface(IInspectable)
  ['{E766A48A-8BB8-4954-AE67-D2FA43D1F96B}']
    function get_Reason: AllJoynSessionLostReason; safecall;
    property Reason: AllJoynSessionLostReason read get_Reason;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs_Delegate_Base = interface(IUnknown)
  ['{DFFC2B25-5AE2-52F1-BBC4-363CEFEDA03F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs>
  TypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs = interface(TypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs_Delegate_Base)
  ['{BEB06AF4-7AF5-5A3C-B032-00FC56F09D6D}']
    procedure Invoke(sender: IAllJoynSession; args: IAllJoynSessionLostEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Int32>
  // Used Types:  String
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynSession,Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs>
  }
  // Windows.Devices.AllJoyn.IAllJoynSession
  [WinRTClassNameAttribute(SAllJoynSession)]
  IAllJoynSession = interface(IInspectable)
  ['{E8D11B0C-C0D4-406C-88A9-A93EFA85D4B1}']
    function get_Id: Integer; safecall;
    function get_Status: Integer; safecall;
    function RemoveMemberAsync(uniqueName: HSTRING): IAsyncOperation_1__Integer; safecall;
    function add_MemberAdded(handler: TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_MemberAdded(token: EventRegistrationToken); safecall;
    function add_MemberRemoved(handler: TypedEventHandler_2__IAllJoynSession__IAllJoynSessionMemberRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_MemberRemoved(token: EventRegistrationToken); safecall;
    function add_Lost(handler: TypedEventHandler_2__IAllJoynSession__IAllJoynSessionLostEventArgs): EventRegistrationToken; safecall;
    procedure remove_Lost(token: EventRegistrationToken); safecall;
    property Id: Integer read get_Id;
    property Status: Integer read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
  [WinRTClassNameAttribute(SAllJoynSessionJoinedEventArgs)]
  IAllJoynSessionJoinedEventArgs = interface(IInspectable)
  ['{9E9F5BD0-B5D7-47C5-8DAB-B040CC192871}']
    function get_Session: IAllJoynSession; safecall;
    property Session: IAllJoynSession read get_Session;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs_Delegate_Base = interface(IUnknown)
  ['{56BB8D26-39B6-53FA-8013-3781AA27A0BC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs>
  TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs = interface(TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs_Delegate_Base)
  ['{3BF101A7-25DA-56ED-B70D-CC1AC581A6CB}']
    procedure Invoke(sender: IAllJoynBusAttachment; args: IAllJoynSessionJoinedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynServiceInfo
  // Used Types:  Windows.Globalization.ILanguage
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusAttachment,Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs>
  }
  // Windows.Devices.AllJoyn.IAllJoynBusAttachment2
  IAllJoynBusAttachment2 = interface(IInspectable)
  ['{3474CB1E-2368-43B2-B43E-6A3AC1278D98}']
    function GetAboutDataAsync(serviceInfo: IAllJoynServiceInfo): IAsyncOperation_1__IAllJoynAboutDataView; overload; safecall;
    function GetAboutDataAsync(serviceInfo: IAllJoynServiceInfo; language: ILanguage): IAsyncOperation_1__IAllJoynAboutDataView; overload; safecall;
    function add_AcceptSessionJoinerRequested(handler: TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynAcceptSessionJoinerEventArgs): EventRegistrationToken; safecall;
    procedure remove_AcceptSessionJoinerRequested(token: EventRegistrationToken); safecall;
    function add_SessionJoined(handler: TypedEventHandler_2__IAllJoynBusAttachment__IAllJoynSessionJoinedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SessionJoined(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.Enumeration.IDeviceWatcher
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  }
  // Windows.Devices.AllJoyn.IAllJoynBusAttachmentStatics
  [WinRTClassNameAttribute(SAllJoynBusAttachment)]
  IAllJoynBusAttachmentStatics = interface(IInspectable)
  ['{839D4D3D-1051-40D7-872A-8D0141115B1F}']
    function GetDefault: IAllJoynBusAttachment; safecall;
    function GetWatcher(requiredInterfaces: IIterable_1__HSTRING): IDeviceWatcher; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynBusAttachmentFactory
  [WinRTClassNameAttribute(SAllJoynBusAttachment)]
  IAllJoynBusAttachmentFactory = interface(IInspectable)
  ['{642EF1A4-AD85-4DDF-90AE-604452B22288}']
    function Create(connectionSpecification: HSTRING): IAllJoynBusAttachment; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynSession>
  AsyncOperationCompletedHandler_1__IAllJoynSession_Delegate_Base = interface(IUnknown)
  ['{52490F64-C98F-5019-8361-B2A3E1679F27}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynSession>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynSession>
  AsyncOperationCompletedHandler_1__IAllJoynSession = interface(AsyncOperationCompletedHandler_1__IAllJoynSession_Delegate_Base)
  ['{78CDCB8A-D7F3-5F4E-9768-B2D7C5C438B0}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IAllJoynSession; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynSession>
  IAsyncOperation_1__IAllJoynSession_Base = interface(IInspectable)
  ['{74AE55F8-3D63-5472-913D-74E9A1125DD3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynSession>
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynSession>
  IAsyncOperation_1__IAllJoynSession = interface(IAsyncOperation_1__IAllJoynSession_Base)
  ['{D17BD492-54E8-5B50-BB5C-512E616919D9}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IAllJoynSession); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IAllJoynSession; safecall;
    function GetResults: IAllJoynSession; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IAllJoynSession read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynSession>
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynServiceInfo
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionStatics
  [WinRTClassNameAttribute(SAllJoynSession)]
  IAllJoynSessionStatics = interface(IInspectable)
  ['{9E05D604-A06C-46D4-B46C-0B0B54105B44}']
    function GetFromServiceInfoAsync(serviceInfo: IAllJoynServiceInfo): IAsyncOperation_1__IAllJoynSession; overload; safecall;
    function GetFromServiceInfoAsync(serviceInfo: IAllJoynServiceInfo; busAttachment: IAllJoynBusAttachment): IAsyncOperation_1__IAllJoynSession; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
  [WinRTClassNameAttribute(SAllJoynBusObjectStoppedEventArgs)]
  IAllJoynBusObjectStoppedEventArgs = interface(IInspectable)
  ['{DE102115-EF8E-4D42-B93B-A2AE74519766}']
    function get_Status: Integer; safecall;
    property Status: Integer read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusObject,Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs>
  TypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs_Delegate_Base = interface(IUnknown)
  ['{9871592F-823D-5630-BE72-CA8F17846B71}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusObject
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusObject,Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs>
  TypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs = interface(TypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs_Delegate_Base)
  ['{B9DF8852-3946-5AA4-AA38-4740B35089FE}']
    procedure Invoke(sender: IAllJoynBusObject; args: IAllJoynBusObjectStoppedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynProducer
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.AllJoyn.IAllJoynBusObject,Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs>
  }
  // Windows.Devices.AllJoyn.IAllJoynBusObject
  [WinRTClassNameAttribute(SAllJoynBusObject)]
  IAllJoynBusObject = interface(IInspectable)
  ['{E8FD825E-F73A-490C-8804-04E026643047}']
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure AddProducer(producer: IAllJoynProducer); safecall;
    function get_BusAttachment: IAllJoynBusAttachment; safecall;
    function get_Session: IAllJoynSession; safecall;
    function add_Stopped(handler: TypedEventHandler_2__IAllJoynBusObject__IAllJoynBusObjectStoppedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    property BusAttachment: IAllJoynBusAttachment read get_BusAttachment;
    property Session: IAllJoynSession read get_Session;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusObject
  }
  // Windows.Devices.AllJoyn.IAllJoynProducer
  IAllJoynProducer = interface(IInspectable)
  ['{9D084679-469B-495A-A710-AC50F123069F}']
    procedure SetBusObject(busObject: IAllJoynBusObject); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusObject
  // Used Types:  String
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  }
  // Windows.Devices.AllJoyn.IAllJoynBusObjectFactory
  [WinRTClassNameAttribute(SAllJoynBusObject)]
  IAllJoynBusObjectFactory = interface(IInspectable)
  ['{2C2F9F0B-8E02-4F9C-AC27-EA6DAD5D3B50}']
    function Create(objectPath: HSTRING): IAllJoynBusObject; safecall;
    function CreateWithBusAttachment(objectPath: HSTRING; busAttachment: IAllJoynBusAttachment): IAllJoynBusObject; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  AsyncOperationCompletedHandler_1__IAllJoynServiceInfo_Delegate_Base = interface(IUnknown)
  ['{FFB22299-A9C9-5C2A-ACE3-0CD0A6DD1039}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  AsyncOperationCompletedHandler_1__IAllJoynServiceInfo = interface(AsyncOperationCompletedHandler_1__IAllJoynServiceInfo_Delegate_Base)
  ['{83FD2C55-C8BD-5D40-A679-E12D36FE5A26}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IAllJoynServiceInfo; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  IAsyncOperation_1__IAllJoynServiceInfo_Base = interface(IInspectable)
  ['{B9CE48C1-16CC-5E46-91D5-E5CD06F8026E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynServiceInfo
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  IAsyncOperation_1__IAllJoynServiceInfo = interface(IAsyncOperation_1__IAllJoynServiceInfo_Base)
  ['{96E9C54F-A203-54A5-8970-F1B0EA9D674A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IAllJoynServiceInfo); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IAllJoynServiceInfo; safecall;
    function GetResults: IAllJoynServiceInfo; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IAllJoynServiceInfo read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynServiceInfo>
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynServiceInfoStatics
  [WinRTClassNameAttribute(SAllJoynServiceInfo)]
  IAllJoynServiceInfoStatics = interface(IInspectable)
  ['{5678570A-603A-49FC-B750-0EF13609213C}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IAllJoynServiceInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynServiceInfo
  // Used Types:  String
  // Used Types:  UInt16
  }
  // Windows.Devices.AllJoyn.IAllJoynServiceInfoFactory
  [WinRTClassNameAttribute(SAllJoynServiceInfo)]
  IAllJoynServiceInfoFactory = interface(IInspectable)
  ['{7581DABD-FE03-4F4B-94A4-F02FDCBD11B8}']
    function Create(uniqueName: HSTRING; objectPath: HSTRING; sessionPort: Word): IAllJoynServiceInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.AllJoyn.IAllJoynAboutDataView>
  // Used Types:  String
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Used Types:  UInt16
  // Used Types:  Windows.Globalization.ILanguage
  }
  // Windows.Devices.AllJoyn.IAllJoynAboutDataViewStatics
  [WinRTClassNameAttribute(SAllJoynAboutDataView)]
  IAllJoynAboutDataViewStatics = interface(IInspectable)
  ['{57EDB688-0C5E-416E-88B5-39B32D25C47D}']
    function GetDataBySessionPortAsync(uniqueName: HSTRING; busAttachment: IAllJoynBusAttachment; sessionPort: Word): IAsyncOperation_1__IAllJoynAboutDataView; overload; safecall;
    function GetDataBySessionPortAsync(uniqueName: HSTRING; busAttachment: IAllJoynBusAttachment; sessionPort: Word; language: ILanguage): IAsyncOperation_1__IAllJoynAboutDataView; overload; safecall;
  end;

  // UsedAPI Interface
  {
  }
  // Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoiner
  IAllJoynAcceptSessionJoiner = interface(IInspectable)
  ['{4DA817D2-CD1D-4023-A7C4-16DEF89C28DF}']
    procedure Accept; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
  // Used Types:  String
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.AllJoyn.AllJoynTrafficType
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoiner
  }
  // Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynAcceptSessionJoinerEventArgs)]
  IAllJoynAcceptSessionJoinerEventArgsFactory = interface(IInspectable)
  ['{B4435BC0-6145-429E-84DB-D5BFE772B14F}']
    function Create(uniqueName: HSTRING; sessionPort: Word; trafficType: AllJoynTrafficType; proximity: Byte; acceptSessionJoiner: IAllJoynAcceptSessionJoiner): IAllJoynAcceptSessionJoinerEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynSessionMemberAddedEventArgs)]
  IAllJoynSessionMemberAddedEventArgsFactory = interface(IInspectable)
  ['{341DE352-1D33-40A1-A1D3-E5777020E1F1}']
    function Create(uniqueName: HSTRING): IAllJoynSessionMemberAddedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynSessionMemberRemovedEventArgs)]
  IAllJoynSessionMemberRemovedEventArgsFactory = interface(IInspectable)
  ['{C4D355E8-42B8-4B67-B757-D0CFCAD59280}']
    function Create(uniqueName: HSTRING): IAllJoynSessionMemberRemovedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSession
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynSessionJoinedEventArgs)]
  IAllJoynSessionJoinedEventArgsFactory = interface(IInspectable)
  ['{6824D689-D6CB-4D9E-A09E-35806870B17F}']
    function Create(session: IAllJoynSession): IAllJoynSessionJoinedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
  // Used Types:  Windows.Devices.AllJoyn.AllJoynSessionLostReason
  }
  // Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynSessionLostEventArgs)]
  IAllJoynSessionLostEventArgsFactory = interface(IInspectable)
  ['{13BBFD32-D2F4-49C9-980E-2805E13586B1}']
    function Create(reason: AllJoynSessionLostReason): IAllJoynSessionLostEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs
  [WinRTClassNameAttribute(SAllJoynProducerStoppedEventArgs)]
  IAllJoynProducerStoppedEventArgs = interface(IInspectable)
  ['{51309770-4937-492D-8080-236439987CEB}']
    function get_Status: Integer; safecall;
    property Status: Integer read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynProducerStoppedEventArgs)]
  IAllJoynProducerStoppedEventArgsFactory = interface(IInspectable)
  ['{56529961-B219-4D6E-9F78-FA3F99FA8FE5}']
    function Create(status: Integer): IAllJoynProducerStoppedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynBusObjectStoppedEventArgs)]
  IAllJoynBusObjectStoppedEventArgsFactory = interface(IInspectable)
  ['{6B22FD48-D0A3-4255-953A-4772B4028073}']
    function Create(status: Integer): IAllJoynBusObjectStoppedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs
  [WinRTClassNameAttribute(SAllJoynWatcherStoppedEventArgs)]
  IAllJoynWatcherStoppedEventArgs = interface(IInspectable)
  ['{C9FCA03B-701D-4AA8-97DD-A2BB0A8F5FA3}']
    function get_Status: Integer; safecall;
    property Status: Integer read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs
  // Used Types:  Int32
  }
  // Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynWatcherStoppedEventArgs)]
  IAllJoynWatcherStoppedEventArgsFactory = interface(IInspectable)
  ['{878FA5A8-2D50-47E1-904A-20BF0D48C782}']
    function Create(status: Integer): IAllJoynWatcherStoppedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs
  [WinRTClassNameAttribute(SAllJoynServiceInfoRemovedEventArgs)]
  IAllJoynServiceInfoRemovedEventArgs = interface(IInspectable)
  ['{3057A95F-1D3F-41F3-8969-E32792627396}']
    function get_UniqueName: HSTRING; safecall;
    property UniqueName: HSTRING read get_UniqueName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgsFactory
  [WinRTClassNameAttribute(SAllJoynServiceInfoRemovedEventArgs)]
  IAllJoynServiceInfoRemovedEventArgsFactory = interface(IInspectable)
  ['{0DBF8627-9AFF-4955-9227-6953BAF41569}']
    function Create(uniqueName: HSTRING): IAllJoynServiceInfoRemovedEventArgs; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynMessageInfo
  [WinRTClassNameAttribute(SAllJoynMessageInfo)]
  IAllJoynMessageInfo = interface(IInspectable)
  ['{FF2B0127-2C12-4859-AA3A-C74461EE814C}']
    function get_SenderUniqueName: HSTRING; safecall;
    property SenderUniqueName: HSTRING read get_SenderUniqueName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.AllJoyn.IAllJoynMessageInfo
  // Used Types:  String
  }
  // Windows.Devices.AllJoyn.IAllJoynMessageInfoFactory
  [WinRTClassNameAttribute(SAllJoynMessageInfo)]
  IAllJoynMessageInfoFactory = interface(IInspectable)
  ['{34664C2A-8289-43D4-B4A8-3F4DE359F043}']
    function Create(senderUniqueName: HSTRING): IAllJoynMessageInfo; safecall;
  end;


  // Emit Forwarded classes
  // Windows.Devices.AllJoyn.AllJoynStatus
  // DualAPI
  // Statics: "Windows.Devices.AllJoyn.IAllJoynStatusStatics"
  TAllJoynStatus = class(TWinRTGenericImportS<IAllJoynStatusStatics>)
  public
    // -> IAllJoynStatusStatics
    class function get_Ok: Integer; static; inline;
    class function get_Fail: Integer; static; inline;
    class function get_OperationTimedOut: Integer; static; inline;
    class function get_OtherEndClosed: Integer; static; inline;
    class function get_ConnectionRefused: Integer; static; inline;
    class function get_AuthenticationFailed: Integer; static; inline;
    class function get_AuthenticationRejectedByUser: Integer; static; inline;
    class function get_SslConnectFailed: Integer; static; inline;
    class function get_SslIdentityVerificationFailed: Integer; static; inline;
    class function get_InsufficientSecurity: Integer; static; inline;
    class function get_InvalidArgument1: Integer; static; inline;
    class function get_InvalidArgument2: Integer; static; inline;
    class function get_InvalidArgument3: Integer; static; inline;
    class function get_InvalidArgument4: Integer; static; inline;
    class function get_InvalidArgument5: Integer; static; inline;
    class function get_InvalidArgument6: Integer; static; inline;
    class function get_InvalidArgument7: Integer; static; inline;
    class function get_InvalidArgument8: Integer; static; inline;
    class property AuthenticationFailed: Integer read get_AuthenticationFailed;
    class property AuthenticationRejectedByUser: Integer read get_AuthenticationRejectedByUser;
    class property ConnectionRefused: Integer read get_ConnectionRefused;
    class property Fail: Integer read get_Fail;
    class property InsufficientSecurity: Integer read get_InsufficientSecurity;
    class property InvalidArgument1: Integer read get_InvalidArgument1;
    class property InvalidArgument2: Integer read get_InvalidArgument2;
    class property InvalidArgument3: Integer read get_InvalidArgument3;
    class property InvalidArgument4: Integer read get_InvalidArgument4;
    class property InvalidArgument5: Integer read get_InvalidArgument5;
    class property InvalidArgument6: Integer read get_InvalidArgument6;
    class property InvalidArgument7: Integer read get_InvalidArgument7;
    class property InvalidArgument8: Integer read get_InvalidArgument8;
    class property Ok: Integer read get_Ok;
    class property OperationTimedOut: Integer read get_OperationTimedOut;
    class property OtherEndClosed: Integer read get_OtherEndClosed;
    class property SslConnectFailed: Integer read get_SslConnectFailed;
    class property SslIdentityVerificationFailed: Integer read get_SslIdentityVerificationFailed;
  end;

  // Windows.Devices.AllJoyn.AllJoynAboutData
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynAboutData

  // Windows.Devices.AllJoyn.AllJoynBusAttachment
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynBusAttachment
  // Implements: Windows.Devices.AllJoyn.IAllJoynBusAttachment2
  // Statics: "Windows.Devices.AllJoyn.IAllJoynBusAttachmentStatics"
  // Factory: "Windows.Devices.AllJoyn.IAllJoynBusAttachmentFactory"
  // Instantiable: "IAllJoynBusAttachment"
  TAllJoynBusAttachment = class(TWinRTGenericImportFSI<IAllJoynBusAttachmentFactory, IAllJoynBusAttachmentStatics, IAllJoynBusAttachment>)
  public
    // -> IAllJoynBusAttachmentStatics
    class function GetDefault: IAllJoynBusAttachment; static; inline;
    class function GetWatcher(requiredInterfaces: IIterable_1__HSTRING): IDeviceWatcher; static; inline;

    // -> IAllJoynBusAttachmentFactory
    class function Create(connectionSpecification: HSTRING): IAllJoynBusAttachment; overload; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynBusAttachmentStateChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynBusAttachmentStateChangedEventArgs

  // Windows.Devices.AllJoyn.AllJoynCredentialsRequestedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynCredentialsRequestedEventArgs

  // Windows.Devices.AllJoyn.AllJoynCredentialsVerificationRequestedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynCredentialsVerificationRequestedEventArgs

  // Windows.Devices.AllJoyn.AllJoynAuthenticationCompleteEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynAuthenticationCompleteEventArgs

  // Windows.Devices.AllJoyn.AllJoynServiceInfo
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynServiceInfo
  // Statics: "Windows.Devices.AllJoyn.IAllJoynServiceInfoStatics"
  // Factory: "Windows.Devices.AllJoyn.IAllJoynServiceInfoFactory"
  TAllJoynServiceInfo = class(TWinRTGenericImportFS<IAllJoynServiceInfoFactory, IAllJoynServiceInfoStatics>)
  public
    // -> IAllJoynServiceInfoStatics
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IAllJoynServiceInfo; static; inline;

    // -> IAllJoynServiceInfoFactory
    class function Create(uniqueName: HSTRING; objectPath: HSTRING; sessionPort: Word): IAllJoynServiceInfo; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynAboutDataView
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynAboutDataView
  // Statics: "Windows.Devices.AllJoyn.IAllJoynAboutDataViewStatics"
  TAllJoynAboutDataView = class(TWinRTGenericImportS<IAllJoynAboutDataViewStatics>)
  public
    // -> IAllJoynAboutDataViewStatics
    class function GetDataBySessionPortAsync(uniqueName: HSTRING; busAttachment: IAllJoynBusAttachment; sessionPort: Word): IAsyncOperation_1__IAllJoynAboutDataView; overload; static; inline;
    class function GetDataBySessionPortAsync(uniqueName: HSTRING; busAttachment: IAllJoynBusAttachment; sessionPort: Word; language: ILanguage): IAsyncOperation_1__IAllJoynAboutDataView; overload; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynAcceptSessionJoinerEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgsFactory"
  TAllJoynAcceptSessionJoinerEventArgs = class(TWinRTGenericImportF<IAllJoynAcceptSessionJoinerEventArgsFactory>)
  public
    // -> IAllJoynAcceptSessionJoinerEventArgsFactory
    class function Create(uniqueName: HSTRING; sessionPort: Word; trafficType: AllJoynTrafficType; proximity: Byte; acceptSessionJoiner: IAllJoynAcceptSessionJoiner): IAllJoynAcceptSessionJoinerEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynSessionJoinedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgsFactory"
  TAllJoynSessionJoinedEventArgs = class(TWinRTGenericImportF<IAllJoynSessionJoinedEventArgsFactory>)
  public
    // -> IAllJoynSessionJoinedEventArgsFactory
    class function Create(session: IAllJoynSession): IAllJoynSessionJoinedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynCredentials
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynCredentials

  // Windows.Devices.AllJoyn.AllJoynSession
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynSession
  // Statics: "Windows.Devices.AllJoyn.IAllJoynSessionStatics"
  TAllJoynSession = class(TWinRTGenericImportS<IAllJoynSessionStatics>)
  public
    // -> IAllJoynSessionStatics
    class function GetFromServiceInfoAsync(serviceInfo: IAllJoynServiceInfo): IAsyncOperation_1__IAllJoynSession; overload; static; inline;
    class function GetFromServiceInfoAsync(serviceInfo: IAllJoynServiceInfo; busAttachment: IAllJoynBusAttachment): IAsyncOperation_1__IAllJoynSession; overload; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynSessionMemberAddedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgsFactory"
  TAllJoynSessionMemberAddedEventArgs = class(TWinRTGenericImportF<IAllJoynSessionMemberAddedEventArgsFactory>)
  public
    // -> IAllJoynSessionMemberAddedEventArgsFactory
    class function Create(uniqueName: HSTRING): IAllJoynSessionMemberAddedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynSessionMemberRemovedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgsFactory"
  TAllJoynSessionMemberRemovedEventArgs = class(TWinRTGenericImportF<IAllJoynSessionMemberRemovedEventArgsFactory>)
  public
    // -> IAllJoynSessionMemberRemovedEventArgsFactory
    class function Create(uniqueName: HSTRING): IAllJoynSessionMemberRemovedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynSessionLostEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgsFactory"
  TAllJoynSessionLostEventArgs = class(TWinRTGenericImportF<IAllJoynSessionLostEventArgsFactory>)
  public
    // -> IAllJoynSessionLostEventArgsFactory
    class function Create(reason: AllJoynSessionLostReason): IAllJoynSessionLostEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynBusObject
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynBusObject
  // Factory: "Windows.Devices.AllJoyn.IAllJoynBusObjectFactory"
  // Instantiable: "IAllJoynBusObject"
  TAllJoynBusObject = class(TWinRTGenericImportFI<IAllJoynBusObjectFactory, IAllJoynBusObject>)
  public
    // -> IAllJoynBusObjectFactory
    class function Create(objectPath: HSTRING): IAllJoynBusObject; overload; static; inline;
    class function CreateWithBusAttachment(objectPath: HSTRING; busAttachment: IAllJoynBusAttachment): IAllJoynBusObject; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynBusObjectStoppedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgsFactory"
  TAllJoynBusObjectStoppedEventArgs = class(TWinRTGenericImportF<IAllJoynBusObjectStoppedEventArgsFactory>)
  public
    // -> IAllJoynBusObjectStoppedEventArgsFactory
    class function Create(status: Integer): IAllJoynBusObjectStoppedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynProducerStoppedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgsFactory"
  TAllJoynProducerStoppedEventArgs = class(TWinRTGenericImportF<IAllJoynProducerStoppedEventArgsFactory>)
  public
    // -> IAllJoynProducerStoppedEventArgsFactory
    class function Create(status: Integer): IAllJoynProducerStoppedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynWatcherStoppedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgsFactory"
  TAllJoynWatcherStoppedEventArgs = class(TWinRTGenericImportF<IAllJoynWatcherStoppedEventArgsFactory>)
  public
    // -> IAllJoynWatcherStoppedEventArgsFactory
    class function Create(status: Integer): IAllJoynWatcherStoppedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynServiceInfoRemovedEventArgs
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgs
  // Factory: "Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgsFactory"
  TAllJoynServiceInfoRemovedEventArgs = class(TWinRTGenericImportF<IAllJoynServiceInfoRemovedEventArgsFactory>)
  public
    // -> IAllJoynServiceInfoRemovedEventArgsFactory
    class function Create(uniqueName: HSTRING): IAllJoynServiceInfoRemovedEventArgs; static; inline;
  end;

  // Windows.Devices.AllJoyn.AllJoynMessageInfo
  // DualAPI
  // Implements: Windows.Devices.AllJoyn.IAllJoynMessageInfo
  // Factory: "Windows.Devices.AllJoyn.IAllJoynMessageInfoFactory"
  TAllJoynMessageInfo = class(TWinRTGenericImportF<IAllJoynMessageInfoFactory>)
  public
    // -> IAllJoynMessageInfoFactory
    class function Create(senderUniqueName: HSTRING): IAllJoynMessageInfo; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TAllJoynStatus }

class function TAllJoynStatus.get_Ok: Integer;
begin
  Result := Statics.get_Ok;
end;

class function TAllJoynStatus.get_Fail: Integer;
begin
  Result := Statics.get_Fail;
end;

class function TAllJoynStatus.get_OperationTimedOut: Integer;
begin
  Result := Statics.get_OperationTimedOut;
end;

class function TAllJoynStatus.get_OtherEndClosed: Integer;
begin
  Result := Statics.get_OtherEndClosed;
end;

class function TAllJoynStatus.get_ConnectionRefused: Integer;
begin
  Result := Statics.get_ConnectionRefused;
end;

class function TAllJoynStatus.get_AuthenticationFailed: Integer;
begin
  Result := Statics.get_AuthenticationFailed;
end;

class function TAllJoynStatus.get_AuthenticationRejectedByUser: Integer;
begin
  Result := Statics.get_AuthenticationRejectedByUser;
end;

class function TAllJoynStatus.get_SslConnectFailed: Integer;
begin
  Result := Statics.get_SslConnectFailed;
end;

class function TAllJoynStatus.get_SslIdentityVerificationFailed: Integer;
begin
  Result := Statics.get_SslIdentityVerificationFailed;
end;

class function TAllJoynStatus.get_InsufficientSecurity: Integer;
begin
  Result := Statics.get_InsufficientSecurity;
end;

class function TAllJoynStatus.get_InvalidArgument1: Integer;
begin
  Result := Statics.get_InvalidArgument1;
end;

class function TAllJoynStatus.get_InvalidArgument2: Integer;
begin
  Result := Statics.get_InvalidArgument2;
end;

class function TAllJoynStatus.get_InvalidArgument3: Integer;
begin
  Result := Statics.get_InvalidArgument3;
end;

class function TAllJoynStatus.get_InvalidArgument4: Integer;
begin
  Result := Statics.get_InvalidArgument4;
end;

class function TAllJoynStatus.get_InvalidArgument5: Integer;
begin
  Result := Statics.get_InvalidArgument5;
end;

class function TAllJoynStatus.get_InvalidArgument6: Integer;
begin
  Result := Statics.get_InvalidArgument6;
end;

class function TAllJoynStatus.get_InvalidArgument7: Integer;
begin
  Result := Statics.get_InvalidArgument7;
end;

class function TAllJoynStatus.get_InvalidArgument8: Integer;
begin
  Result := Statics.get_InvalidArgument8;
end;


 { TAllJoynBusAttachment }

class function TAllJoynBusAttachment.GetDefault: IAllJoynBusAttachment;
begin
  Result := Statics.GetDefault;
end;

class function TAllJoynBusAttachment.GetWatcher(requiredInterfaces: IIterable_1__HSTRING): IDeviceWatcher;
begin
  Result := Statics.GetWatcher(requiredInterfaces);
end;

// Factories for : "AllJoynBusAttachment"
// Factory: "Windows.Devices.AllJoyn.IAllJoynBusAttachmentFactory"
// -> IAllJoynBusAttachmentFactory

class function TAllJoynBusAttachment.Create(connectionSpecification: HSTRING): IAllJoynBusAttachment;
begin
  Result := Factory.Create(connectionSpecification);
end;


 { TAllJoynServiceInfo }

class function TAllJoynServiceInfo.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IAllJoynServiceInfo;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

// Factories for : "AllJoynServiceInfo"
// Factory: "Windows.Devices.AllJoyn.IAllJoynServiceInfoFactory"
// -> IAllJoynServiceInfoFactory

class function TAllJoynServiceInfo.Create(uniqueName: HSTRING; objectPath: HSTRING; sessionPort: Word): IAllJoynServiceInfo;
begin
  Result := Factory.Create(uniqueName, objectPath, sessionPort);
end;


 { TAllJoynAboutDataView }

class function TAllJoynAboutDataView.GetDataBySessionPortAsync(uniqueName: HSTRING; busAttachment: IAllJoynBusAttachment; sessionPort: Word): IAsyncOperation_1__IAllJoynAboutDataView;
begin
  Result := Statics.GetDataBySessionPortAsync(uniqueName, busAttachment, sessionPort);
end;

class function TAllJoynAboutDataView.GetDataBySessionPortAsync(uniqueName: HSTRING; busAttachment: IAllJoynBusAttachment; sessionPort: Word; language: ILanguage): IAsyncOperation_1__IAllJoynAboutDataView;
begin
  Result := Statics.GetDataBySessionPortAsync(uniqueName, busAttachment, sessionPort, language);
end;


 { TAllJoynAcceptSessionJoinerEventArgs }
// Factories for : "AllJoynAcceptSessionJoinerEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynAcceptSessionJoinerEventArgsFactory"
// -> IAllJoynAcceptSessionJoinerEventArgsFactory

class function TAllJoynAcceptSessionJoinerEventArgs.Create(uniqueName: HSTRING; sessionPort: Word; trafficType: AllJoynTrafficType; proximity: Byte; acceptSessionJoiner: IAllJoynAcceptSessionJoiner): IAllJoynAcceptSessionJoinerEventArgs;
begin
  Result := Factory.Create(uniqueName, sessionPort, trafficType, proximity, acceptSessionJoiner);
end;


 { TAllJoynSessionJoinedEventArgs }
// Factories for : "AllJoynSessionJoinedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynSessionJoinedEventArgsFactory"
// -> IAllJoynSessionJoinedEventArgsFactory

class function TAllJoynSessionJoinedEventArgs.Create(session: IAllJoynSession): IAllJoynSessionJoinedEventArgs;
begin
  Result := Factory.Create(session);
end;


 { TAllJoynSession }

class function TAllJoynSession.GetFromServiceInfoAsync(serviceInfo: IAllJoynServiceInfo): IAsyncOperation_1__IAllJoynSession;
begin
  Result := Statics.GetFromServiceInfoAsync(serviceInfo);
end;

class function TAllJoynSession.GetFromServiceInfoAsync(serviceInfo: IAllJoynServiceInfo; busAttachment: IAllJoynBusAttachment): IAsyncOperation_1__IAllJoynSession;
begin
  Result := Statics.GetFromServiceInfoAsync(serviceInfo, busAttachment);
end;


 { TAllJoynSessionMemberAddedEventArgs }
// Factories for : "AllJoynSessionMemberAddedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynSessionMemberAddedEventArgsFactory"
// -> IAllJoynSessionMemberAddedEventArgsFactory

class function TAllJoynSessionMemberAddedEventArgs.Create(uniqueName: HSTRING): IAllJoynSessionMemberAddedEventArgs;
begin
  Result := Factory.Create(uniqueName);
end;


 { TAllJoynSessionMemberRemovedEventArgs }
// Factories for : "AllJoynSessionMemberRemovedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynSessionMemberRemovedEventArgsFactory"
// -> IAllJoynSessionMemberRemovedEventArgsFactory

class function TAllJoynSessionMemberRemovedEventArgs.Create(uniqueName: HSTRING): IAllJoynSessionMemberRemovedEventArgs;
begin
  Result := Factory.Create(uniqueName);
end;


 { TAllJoynSessionLostEventArgs }
// Factories for : "AllJoynSessionLostEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynSessionLostEventArgsFactory"
// -> IAllJoynSessionLostEventArgsFactory

class function TAllJoynSessionLostEventArgs.Create(reason: AllJoynSessionLostReason): IAllJoynSessionLostEventArgs;
begin
  Result := Factory.Create(reason);
end;


 { TAllJoynBusObject }
// Factories for : "AllJoynBusObject"
// Factory: "Windows.Devices.AllJoyn.IAllJoynBusObjectFactory"
// -> IAllJoynBusObjectFactory

class function TAllJoynBusObject.Create(objectPath: HSTRING): IAllJoynBusObject;
begin
  Result := Factory.Create(objectPath);
end;

class function TAllJoynBusObject.CreateWithBusAttachment(objectPath: HSTRING; busAttachment: IAllJoynBusAttachment): IAllJoynBusObject;
begin
  Result := Factory.CreateWithBusAttachment(objectPath, busAttachment);
end;


 { TAllJoynBusObjectStoppedEventArgs }
// Factories for : "AllJoynBusObjectStoppedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynBusObjectStoppedEventArgsFactory"
// -> IAllJoynBusObjectStoppedEventArgsFactory

class function TAllJoynBusObjectStoppedEventArgs.Create(status: Integer): IAllJoynBusObjectStoppedEventArgs;
begin
  Result := Factory.Create(status);
end;


 { TAllJoynProducerStoppedEventArgs }
// Factories for : "AllJoynProducerStoppedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynProducerStoppedEventArgsFactory"
// -> IAllJoynProducerStoppedEventArgsFactory

class function TAllJoynProducerStoppedEventArgs.Create(status: Integer): IAllJoynProducerStoppedEventArgs;
begin
  Result := Factory.Create(status);
end;


 { TAllJoynWatcherStoppedEventArgs }
// Factories for : "AllJoynWatcherStoppedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynWatcherStoppedEventArgsFactory"
// -> IAllJoynWatcherStoppedEventArgsFactory

class function TAllJoynWatcherStoppedEventArgs.Create(status: Integer): IAllJoynWatcherStoppedEventArgs;
begin
  Result := Factory.Create(status);
end;


 { TAllJoynServiceInfoRemovedEventArgs }
// Factories for : "AllJoynServiceInfoRemovedEventArgs"
// Factory: "Windows.Devices.AllJoyn.IAllJoynServiceInfoRemovedEventArgsFactory"
// -> IAllJoynServiceInfoRemovedEventArgsFactory

class function TAllJoynServiceInfoRemovedEventArgs.Create(uniqueName: HSTRING): IAllJoynServiceInfoRemovedEventArgs;
begin
  Result := Factory.Create(uniqueName);
end;


 { TAllJoynMessageInfo }
// Factories for : "AllJoynMessageInfo"
// Factory: "Windows.Devices.AllJoyn.IAllJoynMessageInfoFactory"
// -> IAllJoynMessageInfoFactory

class function TAllJoynMessageInfo.Create(senderUniqueName: HSTRING): IAllJoynMessageInfo;
begin
  Result := Factory.Create(senderUniqueName);
end;



end.
