{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Devices.Sms;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.ApplicationModel, 
  Winapi.SystemRT, 
  Winapi.ServicesRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.SmsBroadcastType>
  IIterator_1__SmsBroadcastType = interface;
  PIIterator_1__SmsBroadcastType = ^IIterator_1__SmsBroadcastType;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.SmsBroadcastType>
  IIterable_1__SmsBroadcastType = interface;
  PIIterable_1__SmsBroadcastType = ^IIterable_1__SmsBroadcastType;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.SmsBroadcastType>
  IVectorView_1__SmsBroadcastType = interface;
  PIVectorView_1__SmsBroadcastType = ^IVectorView_1__SmsBroadcastType;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Sms.SmsBroadcastType>
  IVector_1__SmsBroadcastType = interface;
  PIVector_1__SmsBroadcastType = ^IVector_1__SmsBroadcastType;

  // Windows.Devices.Sms.ISmsFilterRule
  ISmsFilterRule = interface;
  PISmsFilterRule = ^ISmsFilterRule;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsFilterRule>
  IIterator_1__ISmsFilterRule = interface;
  PIIterator_1__ISmsFilterRule = ^IIterator_1__ISmsFilterRule;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsFilterRule>
  IIterable_1__ISmsFilterRule = interface;
  PIIterable_1__ISmsFilterRule = ^IIterable_1__ISmsFilterRule;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsFilterRule>
  IVectorView_1__ISmsFilterRule = interface;
  PIVectorView_1__ISmsFilterRule = ^IVectorView_1__ISmsFilterRule;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Sms.ISmsFilterRule>
  IVector_1__ISmsFilterRule = interface;
  PIVector_1__ISmsFilterRule = ^IVector_1__ISmsFilterRule;

  // Windows.Devices.Sms.ISmsFilterRules
  ISmsFilterRules = interface;
  PISmsFilterRules = ^ISmsFilterRules;

  // Windows.Devices.Sms.ISmsTextMessage2
  ISmsTextMessage2 = interface;
  PISmsTextMessage2 = ^ISmsTextMessage2;

  // Windows.Devices.Sms.ISmsWapMessage
  ISmsWapMessage = interface;
  PISmsWapMessage = ^ISmsWapMessage;

  // Windows.Devices.Sms.ISmsAppMessage
  ISmsAppMessage = interface;
  PISmsAppMessage = ^ISmsAppMessage;

  // Windows.Devices.Sms.ISmsBroadcastMessage
  ISmsBroadcastMessage = interface;
  PISmsBroadcastMessage = ^ISmsBroadcastMessage;

  // Windows.Devices.Sms.ISmsVoicemailMessage
  ISmsVoicemailMessage = interface;
  PISmsVoicemailMessage = ^ISmsVoicemailMessage;

  // Windows.Devices.Sms.ISmsStatusMessage
  ISmsStatusMessage = interface;
  PISmsStatusMessage = ^ISmsStatusMessage;

  // Windows.Devices.Sms.ISmsDevice2Statics
  ISmsDevice2Statics = interface;
  PISmsDevice2Statics = ^ISmsDevice2Statics;

  // Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails
  ISmsMessageReceivedTriggerDetails = interface;
  PISmsMessageReceivedTriggerDetails = ^ISmsMessageReceivedTriggerDetails;

  // Windows.Devices.Sms.ISmsFilterRuleFactory
  ISmsFilterRuleFactory = interface;
  PISmsFilterRuleFactory = ^ISmsFilterRuleFactory;

  // Windows.Devices.Sms.ISmsFilterRulesFactory
  ISmsFilterRulesFactory = interface;
  PISmsFilterRulesFactory = ^ISmsFilterRulesFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsMessageRegistration,Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails>
  TypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails = interface;
  PTypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails = ^TypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails;

  // Windows.Devices.Sms.ISmsMessageRegistration
  ISmsMessageRegistration = interface;
  PISmsMessageRegistration = ^ISmsMessageRegistration;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IIterator_1__ISmsMessageRegistration = interface;
  PIIterator_1__ISmsMessageRegistration = ^IIterator_1__ISmsMessageRegistration;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IIterable_1__ISmsMessageRegistration = interface;
  PIIterable_1__ISmsMessageRegistration = ^IIterable_1__ISmsMessageRegistration;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IVectorView_1__ISmsMessageRegistration = interface;
  PIVectorView_1__ISmsMessageRegistration = ^IVectorView_1__ISmsMessageRegistration;

  // Windows.Devices.Sms.ISmsMessageRegistrationStatics
  ISmsMessageRegistrationStatics = interface;
  PISmsMessageRegistrationStatics = ^ISmsMessageRegistrationStatics;

  // Windows.Devices.Sms.ISmsBinaryMessage
  ISmsBinaryMessage = interface;
  PISmsBinaryMessage = ^ISmsBinaryMessage;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IIterator_1__ISmsBinaryMessage = interface;
  PIIterator_1__ISmsBinaryMessage = ^IIterator_1__ISmsBinaryMessage;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IIterable_1__ISmsBinaryMessage = interface;
  PIIterable_1__ISmsBinaryMessage = ^IIterable_1__ISmsBinaryMessage;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IVectorView_1__ISmsBinaryMessage = interface;
  PIVectorView_1__ISmsBinaryMessage = ^IVectorView_1__ISmsBinaryMessage;

  // Windows.Devices.Sms.ISmsTextMessage
  ISmsTextMessage = interface;
  PISmsTextMessage = ^ISmsTextMessage;

  // Windows.Devices.Sms.ISmsTextMessageStatics
  ISmsTextMessageStatics = interface;
  PISmsTextMessageStatics = ^ISmsTextMessageStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsMessage>
  AsyncOperationCompletedHandler_1__ISmsMessage = interface;
  PAsyncOperationCompletedHandler_1__ISmsMessage = ^AsyncOperationCompletedHandler_1__ISmsMessage;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsMessage>
  IAsyncOperation_1__ISmsMessage = interface;
  PIAsyncOperation_1__ISmsMessage = ^IAsyncOperation_1__ISmsMessage;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessage>
  IIterator_1__ISmsMessage = interface;
  PIIterator_1__ISmsMessage = ^IIterator_1__ISmsMessage;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsMessage>
  IIterable_1__ISmsMessage = interface;
  PIIterable_1__ISmsMessage = ^IIterable_1__ISmsMessage;

  // Windows.Devices.Sms.ISmsDeviceMessageStore
  ISmsDeviceMessageStore = interface;
  PISmsDeviceMessageStore = ^ISmsDeviceMessageStore;

  // Windows.Devices.Sms.ISmsMessageReceivedEventArgs
  ISmsMessageReceivedEventArgs = interface;
  PISmsMessageReceivedEventArgs = ^ISmsMessageReceivedEventArgs;

  // Windows.Devices.Sms.SmsDeviceStatusChangedEventHandler
  SmsDeviceStatusChangedEventHandler = interface;
  PSmsDeviceStatusChangedEventHandler = ^SmsDeviceStatusChangedEventHandler;

  // Windows.Devices.Sms.ISmsDevice
  ISmsDevice = interface;
  PISmsDevice = ^ISmsDevice;

  // Windows.Devices.Sms.SmsMessageReceivedEventHandler
  SmsMessageReceivedEventHandler = interface;
  PSmsMessageReceivedEventHandler = ^SmsMessageReceivedEventHandler;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsDevice>
  AsyncOperationCompletedHandler_1__ISmsDevice = interface;
  PAsyncOperationCompletedHandler_1__ISmsDevice = ^AsyncOperationCompletedHandler_1__ISmsDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsDevice>
  IAsyncOperation_1__ISmsDevice = interface;
  PIAsyncOperation_1__ISmsDevice = ^IAsyncOperation_1__ISmsDevice;

  // Windows.Devices.Sms.ISmsDeviceStatics
  ISmsDeviceStatics = interface;
  PISmsDeviceStatics = ^ISmsDeviceStatics;

  // Windows.Devices.Sms.ISmsDeviceStatics2
  ISmsDeviceStatics2 = interface;
  PISmsDeviceStatics2 = ^ISmsDeviceStatics2;

  // Windows.Devices.Sms.ISmsReceivedEventDetails
  ISmsReceivedEventDetails = interface;
  PISmsReceivedEventDetails = ^ISmsReceivedEventDetails;

  // Windows.Devices.Sms.ISmsReceivedEventDetails2
  ISmsReceivedEventDetails2 = interface;
  PISmsReceivedEventDetails2 = ^ISmsReceivedEventDetails2;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Devices.Sms Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.SmsBroadcastType>
  IIterator_1__SmsBroadcastType_Base = interface(IInspectable)
  ['{6448DDEA-C1CD-5143-A422-5FE4F008CC92}']
  end;
  {
  // Used Types:  Windows.Devices.Sms.SmsBroadcastType
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.SmsBroadcastType>
  IIterator_1__SmsBroadcastType = interface(IIterator_1__SmsBroadcastType_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: SmsBroadcastType; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSmsBroadcastType): Cardinal; safecall;
    property Current: SmsBroadcastType read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.SmsBroadcastType>
  IIterable_1__SmsBroadcastType_Base = interface(IInspectable)
  ['{12276B75-173E-514B-98F0-8A7927A9206C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.SmsBroadcastType>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.SmsBroadcastType>
  IIterable_1__SmsBroadcastType = interface(IIterable_1__SmsBroadcastType_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__SmsBroadcastType; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsBroadcastType
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.SmsBroadcastType>
  IVectorView_1__SmsBroadcastType = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): SmsBroadcastType; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: SmsBroadcastType; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmsBroadcastType): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsBroadcastType
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.SmsBroadcastType>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Sms.SmsBroadcastType>
  IVector_1__SmsBroadcastType = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): SmsBroadcastType; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__SmsBroadcastType; safecall;
    function IndexOf(value: SmsBroadcastType; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: SmsBroadcastType); safecall;
    procedure InsertAt(index: Cardinal; value: SmsBroadcastType); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: SmsBroadcastType); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmsBroadcastType): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSmsBroadcastType); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsMessageType
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Int32>
  // Used Types:  Windows.Devices.Sms.CellularClass
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.Sms.SmsBroadcastType>
  }
  // Windows.Devices.Sms.ISmsFilterRule
  [WinRTClassNameAttribute(SSmsFilterRule)]
  ISmsFilterRule = interface(IInspectable)
  ['{40E32FAE-B049-4FBC-AFE9-E2A610EFF55C}']
    function get_MessageType: SmsMessageType; safecall;
    function get_ImsiPrefixes: IVector_1__HSTRING; safecall;
    function get_DeviceIds: IVector_1__HSTRING; safecall;
    function get_SenderNumbers: IVector_1__HSTRING; safecall;
    function get_TextMessagePrefixes: IVector_1__HSTRING; safecall;
    function get_PortNumbers: IVector_1__Integer; safecall;
    function get_CellularClass: CellularClass; safecall;
    procedure put_CellularClass(value: CellularClass); safecall;
    function get_ProtocolIds: IVector_1__Integer; safecall;
    function get_TeleserviceIds: IVector_1__Integer; safecall;
    function get_WapApplicationIds: IVector_1__HSTRING; safecall;
    function get_WapContentTypes: IVector_1__HSTRING; safecall;
    function get_BroadcastTypes: IVector_1__SmsBroadcastType; safecall;
    function get_BroadcastChannels: IVector_1__Integer; safecall;
    property BroadcastChannels: IVector_1__Integer read get_BroadcastChannels;
    property BroadcastTypes: IVector_1__SmsBroadcastType read get_BroadcastTypes;
    property CellularClass: CellularClass read get_CellularClass write put_CellularClass;
    property DeviceIds: IVector_1__HSTRING read get_DeviceIds;
    property ImsiPrefixes: IVector_1__HSTRING read get_ImsiPrefixes;
    property MessageType: SmsMessageType read get_MessageType;
    property PortNumbers: IVector_1__Integer read get_PortNumbers;
    property ProtocolIds: IVector_1__Integer read get_ProtocolIds;
    property SenderNumbers: IVector_1__HSTRING read get_SenderNumbers;
    property TeleserviceIds: IVector_1__Integer read get_TeleserviceIds;
    property TextMessagePrefixes: IVector_1__HSTRING read get_TextMessagePrefixes;
    property WapApplicationIds: IVector_1__HSTRING read get_WapApplicationIds;
    property WapContentTypes: IVector_1__HSTRING read get_WapContentTypes;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsFilterRule>
  IIterator_1__ISmsFilterRule_Base = interface(IInspectable)
  ['{FEC7CAE6-97F5-5A19-B32A-D8F0BA276F34}']
  end;
  {
  // Used Types:  Windows.Devices.Sms.ISmsFilterRule
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsFilterRule>
  IIterator_1__ISmsFilterRule = interface(IIterator_1__ISmsFilterRule_Base)
  ['{CC79B2E6-032B-5700-8B64-E354F2AEC051}']
    function get_Current: ISmsFilterRule; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PISmsFilterRule): Cardinal; safecall;
    property Current: ISmsFilterRule read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsFilterRule>
  IIterable_1__ISmsFilterRule_Base = interface(IInspectable)
  ['{03ED8267-9C90-5260-8BC0-6C3E3306C964}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsFilterRule>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsFilterRule>
  IIterable_1__ISmsFilterRule = interface(IIterable_1__ISmsFilterRule_Base)
  ['{FD505BFC-A0B1-5BFB-96E3-753FB3673F3E}']
    function First: IIterator_1__ISmsFilterRule; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsFilterRule
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsFilterRule>
  IVectorView_1__ISmsFilterRule = interface(IInspectable)
  ['{5B019FA3-B284-5CA2-B487-859442DBEE50}']
    function GetAt(index: Cardinal): ISmsFilterRule; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ISmsFilterRule; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PISmsFilterRule): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsFilterRule
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsFilterRule>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Sms.ISmsFilterRule>
  IVector_1__ISmsFilterRule = interface(IInspectable)
  ['{82744C94-93C9-59B1-9957-505E9000A972}']
    function GetAt(index: Cardinal): ISmsFilterRule; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ISmsFilterRule; safecall;
    function IndexOf(value: ISmsFilterRule; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ISmsFilterRule); safecall;
    procedure InsertAt(index: Cardinal; value: ISmsFilterRule); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ISmsFilterRule); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PISmsFilterRule): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PISmsFilterRule); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsFilterActionType
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.Sms.ISmsFilterRule>
  }
  // Windows.Devices.Sms.ISmsFilterRules
  [WinRTClassNameAttribute(SSmsFilterRules)]
  ISmsFilterRules = interface(IInspectable)
  ['{4E47EAFB-79CD-4881-9894-55A4135B23FA}']
    function get_ActionType: SmsFilterActionType; safecall;
    function get_Rules: IVector_1__ISmsFilterRule; safecall;
    property ActionType: SmsFilterActionType read get_ActionType;
    property Rules: IVector_1__ISmsFilterRule read get_Rules;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Windows.Devices.Sms.SmsEncoding
  // Used Types:  Boolean
  // Used Types:  Int32
  }
  // Windows.Devices.Sms.ISmsTextMessage2
  [WinRTClassNameAttribute(SSmsTextMessage2)]
  ISmsTextMessage2 = interface(IInspectable)
  ['{22A0D893-4555-4755-B5A1-E7FD84955F8D}']
    function get_Timestamp: DateTime; safecall;
    function get_To: HSTRING; safecall;
    procedure put_To(value: HSTRING); safecall;
    function get_From: HSTRING; safecall;
    function get_Body: HSTRING; safecall;
    procedure put_Body(value: HSTRING); safecall;
    function get_Encoding: SmsEncoding; safecall;
    procedure put_Encoding(value: SmsEncoding); safecall;
    function get_CallbackNumber: HSTRING; safecall;
    procedure put_CallbackNumber(value: HSTRING); safecall;
    function get_IsDeliveryNotificationEnabled: Boolean; safecall;
    procedure put_IsDeliveryNotificationEnabled(value: Boolean); safecall;
    function get_RetryAttemptCount: Integer; safecall;
    procedure put_RetryAttemptCount(value: Integer); safecall;
    function get_TeleserviceId: Integer; safecall;
    function get_ProtocolId: Integer; safecall;
    property Body: HSTRING read get_Body write put_Body;
    property CallbackNumber: HSTRING read get_CallbackNumber write put_CallbackNumber;
    property Encoding: SmsEncoding read get_Encoding write put_Encoding;
    property From: HSTRING read get_From;
    property IsDeliveryNotificationEnabled: Boolean read get_IsDeliveryNotificationEnabled write put_IsDeliveryNotificationEnabled;
    property ProtocolId: Integer read get_ProtocolId;
    property RetryAttemptCount: Integer read get_RetryAttemptCount write put_RetryAttemptCount;
    property TeleserviceId: Integer read get_TeleserviceId;
    property Timestamp: DateTime read get_Timestamp;
    property &To: HSTRING read get_To write put_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  }
  // Windows.Devices.Sms.ISmsWapMessage
  [WinRTClassNameAttribute(SSmsWapMessage)]
  ISmsWapMessage = interface(IInspectable)
  ['{CD937743-7A55-4D3B-9021-F22E022D09C5}']
    function get_Timestamp: DateTime; safecall;
    function get_To: HSTRING; safecall;
    function get_From: HSTRING; safecall;
    function get_ApplicationId: HSTRING; safecall;
    function get_ContentType: HSTRING; safecall;
    function get_BinaryBody: IBuffer; safecall;
    function get_Headers: IMap_2__HSTRING__HSTRING; safecall;
    property ApplicationId: HSTRING read get_ApplicationId;
    property BinaryBody: IBuffer read get_BinaryBody;
    property ContentType: HSTRING read get_ContentType;
    property From: HSTRING read get_From;
    property Headers: IMap_2__HSTRING__HSTRING read get_Headers;
    property Timestamp: DateTime read get_Timestamp;
    property &To: HSTRING read get_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Sms.SmsEncoding
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.Sms.ISmsAppMessage
  [WinRTClassNameAttribute(SSmsAppMessage)]
  ISmsAppMessage = interface(IInspectable)
  ['{E8BB8494-D3A0-4A0A-86D7-291033A8CF54}']
    function get_Timestamp: DateTime; safecall;
    function get_To: HSTRING; safecall;
    procedure put_To(value: HSTRING); safecall;
    function get_From: HSTRING; safecall;
    function get_Body: HSTRING; safecall;
    procedure put_Body(value: HSTRING); safecall;
    function get_CallbackNumber: HSTRING; safecall;
    procedure put_CallbackNumber(value: HSTRING); safecall;
    function get_IsDeliveryNotificationEnabled: Boolean; safecall;
    procedure put_IsDeliveryNotificationEnabled(value: Boolean); safecall;
    function get_RetryAttemptCount: Integer; safecall;
    procedure put_RetryAttemptCount(value: Integer); safecall;
    function get_Encoding: SmsEncoding; safecall;
    procedure put_Encoding(value: SmsEncoding); safecall;
    function get_PortNumber: Integer; safecall;
    procedure put_PortNumber(value: Integer); safecall;
    function get_TeleserviceId: Integer; safecall;
    procedure put_TeleserviceId(value: Integer); safecall;
    function get_ProtocolId: Integer; safecall;
    procedure put_ProtocolId(value: Integer); safecall;
    function get_BinaryBody: IBuffer; safecall;
    procedure put_BinaryBody(value: IBuffer); safecall;
    property BinaryBody: IBuffer read get_BinaryBody write put_BinaryBody;
    property Body: HSTRING read get_Body write put_Body;
    property CallbackNumber: HSTRING read get_CallbackNumber write put_CallbackNumber;
    property Encoding: SmsEncoding read get_Encoding write put_Encoding;
    property From: HSTRING read get_From;
    property IsDeliveryNotificationEnabled: Boolean read get_IsDeliveryNotificationEnabled write put_IsDeliveryNotificationEnabled;
    property PortNumber: Integer read get_PortNumber write put_PortNumber;
    property ProtocolId: Integer read get_ProtocolId write put_ProtocolId;
    property RetryAttemptCount: Integer read get_RetryAttemptCount write put_RetryAttemptCount;
    property TeleserviceId: Integer read get_TeleserviceId write put_TeleserviceId;
    property Timestamp: DateTime read get_Timestamp;
    property &To: HSTRING read get_To write put_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Sms.SmsGeographicalScope
  // Used Types:  Windows.Devices.Sms.SmsBroadcastType
  // Used Types:  Boolean
  }
  // Windows.Devices.Sms.ISmsBroadcastMessage
  [WinRTClassNameAttribute(SSmsBroadcastMessage)]
  ISmsBroadcastMessage = interface(IInspectable)
  ['{75AEBBF1-E4B7-4874-A09C-2956E592F957}']
    function get_Timestamp: DateTime; safecall;
    function get_To: HSTRING; safecall;
    function get_Body: HSTRING; safecall;
    function get_Channel: Integer; safecall;
    function get_GeographicalScope: SmsGeographicalScope; safecall;
    function get_MessageCode: Integer; safecall;
    function get_UpdateNumber: Integer; safecall;
    function get_BroadcastType: SmsBroadcastType; safecall;
    function get_IsEmergencyAlert: Boolean; safecall;
    function get_IsUserPopupRequested: Boolean; safecall;
    property Body: HSTRING read get_Body;
    property BroadcastType: SmsBroadcastType read get_BroadcastType;
    property Channel: Integer read get_Channel;
    property GeographicalScope: SmsGeographicalScope read get_GeographicalScope;
    property IsEmergencyAlert: Boolean read get_IsEmergencyAlert;
    property IsUserPopupRequested: Boolean read get_IsUserPopupRequested;
    property MessageCode: Integer read get_MessageCode;
    property Timestamp: DateTime read get_Timestamp;
    property &To: HSTRING read get_To;
    property UpdateNumber: Integer read get_UpdateNumber;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  }
  // Windows.Devices.Sms.ISmsVoicemailMessage
  [WinRTClassNameAttribute(SSmsVoicemailMessage)]
  ISmsVoicemailMessage = interface(IInspectable)
  ['{271AA0A6-95B1-44FF-BCB8-B8FDD7E08BC3}']
    function get_Timestamp: DateTime; safecall;
    function get_To: HSTRING; safecall;
    function get_Body: HSTRING; safecall;
    function get_MessageCount: IReference_1__Integer; safecall;
    property Body: HSTRING read get_Body;
    property MessageCount: IReference_1__Integer read get_MessageCount;
    property Timestamp: DateTime read get_Timestamp;
    property &To: HSTRING read get_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Devices.Sms.ISmsStatusMessage
  [WinRTClassNameAttribute(SSmsStatusMessage)]
  ISmsStatusMessage = interface(IInspectable)
  ['{E6D28342-B70B-4677-9379-C9783FDFF8F4}']
    function get_To: HSTRING; safecall;
    function get_From: HSTRING; safecall;
    function get_Body: HSTRING; safecall;
    function get_Status: Integer; safecall;
    function get_MessageReferenceNumber: Integer; safecall;
    function get_ServiceCenterTimestamp: DateTime; safecall;
    function get_DischargeTime: DateTime; safecall;
    property Body: HSTRING read get_Body;
    property DischargeTime: DateTime read get_DischargeTime;
    property From: HSTRING read get_From;
    property MessageReferenceNumber: Integer read get_MessageReferenceNumber;
    property ServiceCenterTimestamp: DateTime read get_ServiceCenterTimestamp;
    property Status: Integer read get_Status;
    property &To: HSTRING read get_To;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Sms.ISmsDevice2
  }
  // Windows.Devices.Sms.ISmsDevice2Statics
  [WinRTClassNameAttribute(SSmsDevice2)]
  ISmsDevice2Statics = interface(IInspectable)
  ['{65C78325-1031-491E-8FB6-EF9991AFE363}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromId(deviceId: HSTRING): ISmsDevice2; safecall;
    function GetDefault: ISmsDevice2; safecall;
    function FromParentId(parentDeviceId: HSTRING): ISmsDevice2; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsMessageType
  // Used Types:  Windows.Devices.Sms.ISmsTextMessage2
  // Used Types:  Windows.Devices.Sms.ISmsWapMessage
  // Used Types:  Windows.Devices.Sms.ISmsAppMessage
  // Used Types:  Windows.Devices.Sms.ISmsBroadcastMessage
  // Used Types:  Windows.Devices.Sms.ISmsVoicemailMessage
  // Used Types:  Windows.Devices.Sms.ISmsStatusMessage
  }
  // Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails
  [WinRTClassNameAttribute(SSmsMessageReceivedTriggerDetails)]
  ISmsMessageReceivedTriggerDetails = interface(IInspectable)
  ['{2BCFCBD4-2657-4128-AD5F-E3877132BDB1}']
    function get_MessageType: SmsMessageType; safecall;
    function get_TextMessage: ISmsTextMessage2; safecall;
    function get_WapMessage: ISmsWapMessage; safecall;
    function get_AppMessage: ISmsAppMessage; safecall;
    function get_BroadcastMessage: ISmsBroadcastMessage; safecall;
    function get_VoicemailMessage: ISmsVoicemailMessage; safecall;
    function get_StatusMessage: ISmsStatusMessage; safecall;
    procedure Drop; safecall;
    procedure Accept; safecall;
    property AppMessage: ISmsAppMessage read get_AppMessage;
    property BroadcastMessage: ISmsBroadcastMessage read get_BroadcastMessage;
    property MessageType: SmsMessageType read get_MessageType;
    property StatusMessage: ISmsStatusMessage read get_StatusMessage;
    property TextMessage: ISmsTextMessage2 read get_TextMessage;
    property VoicemailMessage: ISmsVoicemailMessage read get_VoicemailMessage;
    property WapMessage: ISmsWapMessage read get_WapMessage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsFilterRule
  // Used Types:  Windows.Devices.Sms.SmsMessageType
  }
  // Windows.Devices.Sms.ISmsFilterRuleFactory
  [WinRTClassNameAttribute(SSmsFilterRule)]
  ISmsFilterRuleFactory = interface(IInspectable)
  ['{00C36508-6296-4F29-9AAD-8920CEBA3CE8}']
    function CreateFilterRule(messageType: SmsMessageType): ISmsFilterRule; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsFilterRules
  // Used Types:  Windows.Devices.Sms.SmsFilterActionType
  }
  // Windows.Devices.Sms.ISmsFilterRulesFactory
  [WinRTClassNameAttribute(SSmsFilterRules)]
  ISmsFilterRulesFactory = interface(IInspectable)
  ['{A09924ED-6E2E-4530-9FDE-465D02EED00E}']
    function CreateFilterRules(actionType: SmsFilterActionType): ISmsFilterRules; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsMessageRegistration,Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails>
  TypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails_Delegate_Base = interface(IUnknown)
  ['{33F985C7-DCFA-531F-9CCE-EE5E6C26B1E6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsMessageRegistration
  // Used Types:  Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsMessageRegistration,Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails>
  TypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails = interface(TypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails_Delegate_Base)
  ['{D0A6E7F7-6387-5382-8E25-E55753669949}']
    procedure Invoke(sender: ISmsMessageRegistration; args: ISmsMessageReceivedTriggerDetails); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsMessageRegistration,Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails>
  }
  // Windows.Devices.Sms.ISmsMessageRegistration
  [WinRTClassNameAttribute(SSmsMessageRegistration)]
  ISmsMessageRegistration = interface(IInspectable)
  ['{1720503E-F34F-446B-83B3-0FF19923B409}']
    function get_Id: HSTRING; safecall;
    procedure Unregister; safecall;
    function add_MessageReceived(eventHandler: TypedEventHandler_2__ISmsMessageRegistration__ISmsMessageReceivedTriggerDetails): EventRegistrationToken; safecall;
    procedure remove_MessageReceived(eventCookie: EventRegistrationToken); safecall;
    property Id: HSTRING read get_Id;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IIterator_1__ISmsMessageRegistration_Base = interface(IInspectable)
  ['{EE1A0675-F3C9-5C12-93E0-F2B01BDCE611}']
  end;
  {
  // Used Types:  Windows.Devices.Sms.ISmsMessageRegistration
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IIterator_1__ISmsMessageRegistration = interface(IIterator_1__ISmsMessageRegistration_Base)
  ['{C1985A1F-F4DC-5181-8F1A-C0074A777DE5}']
    function get_Current: ISmsMessageRegistration; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PISmsMessageRegistration): Cardinal; safecall;
    property Current: ISmsMessageRegistration read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IIterable_1__ISmsMessageRegistration_Base = interface(IInspectable)
  ['{F836FA0A-770D-5E8F-8664-01C43F959EEA}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessageRegistration>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IIterable_1__ISmsMessageRegistration = interface(IIterable_1__ISmsMessageRegistration_Base)
  ['{6DE88D72-D08E-5B3B-BAF8-3C4129EAA61B}']
    function First: IIterator_1__ISmsMessageRegistration; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsMessageRegistration
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessageRegistration>
  IVectorView_1__ISmsMessageRegistration = interface(IInspectable)
  ['{A476AD97-23AC-5525-890F-C514921A1854}']
    function GetAt(index: Cardinal): ISmsMessageRegistration; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ISmsMessageRegistration; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PISmsMessageRegistration): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessageRegistration>
  // Used Types:  Windows.Devices.Sms.ISmsMessageRegistration
  // Used Types:  String
  // Used Types:  Windows.Devices.Sms.ISmsFilterRules
  }
  // Windows.Devices.Sms.ISmsMessageRegistrationStatics
  [WinRTClassNameAttribute(SSmsMessageRegistration)]
  ISmsMessageRegistrationStatics = interface(IInspectable)
  ['{63A05464-2898-4778-A03C-6F994907D63A}']
    function get_AllRegistrations: IVectorView_1__ISmsMessageRegistration; safecall;
    function Register(id: HSTRING; filterRules: ISmsFilterRules): ISmsMessageRegistration; safecall;
    property AllRegistrations: IVectorView_1__ISmsMessageRegistration read get_AllRegistrations;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsDataFormat
  // Used Types:  UInt8[]
  // Used Types:  UInt8
  }
  // Windows.Devices.Sms.ISmsBinaryMessage
  [WinRTClassNameAttribute(SSmsBinaryMessage)]
  ISmsBinaryMessage = interface(IInspectable)
  ['{5BF4E813-3B53-4C6E-B61A-D86A63755650}']
    function get_Format: SmsDataFormat; safecall;
    procedure put_Format(value: SmsDataFormat); safecall;
    function GetData(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
    procedure SetData(valueSize: Cardinal; value: PByte); safecall;
    property Format: SmsDataFormat read get_Format write put_Format;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IIterator_1__ISmsBinaryMessage_Base = interface(IInspectable)
  ['{13E60D89-EA0A-5B01-9C2F-0E5B435058E0}']
  end;
  {
  // Used Types:  Windows.Devices.Sms.ISmsBinaryMessage
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IIterator_1__ISmsBinaryMessage = interface(IIterator_1__ISmsBinaryMessage_Base)
  ['{13E60D89-EA0A-5B01-9C2F-0E5B435058E0}']
    function get_Current: ISmsBinaryMessage; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PISmsBinaryMessage): Cardinal; safecall;
    property Current: ISmsBinaryMessage read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IIterable_1__ISmsBinaryMessage_Base = interface(IInspectable)
  ['{5678A6A5-4D5A-51C2-A133-4B83BF25D987}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsBinaryMessage>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IIterable_1__ISmsBinaryMessage = interface(IIterable_1__ISmsBinaryMessage_Base)
  ['{5678A6A5-4D5A-51C2-A133-4B83BF25D987}']
    function First: IIterator_1__ISmsBinaryMessage; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsBinaryMessage
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsBinaryMessage>
  IVectorView_1__ISmsBinaryMessage = interface(IInspectable)
  ['{6EA176EA-99EA-5C79-876A-F4C437B83DF6}']
    function GetAt(index: Cardinal): ISmsBinaryMessage; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ISmsBinaryMessage; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PISmsBinaryMessage): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  UInt32
  // Used Types:  String
  // Used Types:  Windows.Devices.Sms.SmsEncoding
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsBinaryMessage>
  // Used Types:  Windows.Devices.Sms.SmsDataFormat
  }
  // Windows.Devices.Sms.ISmsTextMessage
  [WinRTClassNameAttribute(SSmsTextMessage)]
  ISmsTextMessage = interface(IInspectable)
  ['{D61C904C-A495-487F-9A6F-971548C5BC9F}']
    function get_Timestamp: DateTime; safecall;
    function get_PartReferenceId: Cardinal; safecall;
    function get_PartNumber: Cardinal; safecall;
    function get_PartCount: Cardinal; safecall;
    function get_To: HSTRING; safecall;
    procedure put_To(value: HSTRING); safecall;
    function get_From: HSTRING; safecall;
    procedure put_From(value: HSTRING); safecall;
    function get_Body: HSTRING; safecall;
    procedure put_Body(value: HSTRING); safecall;
    function get_Encoding: SmsEncoding; safecall;
    procedure put_Encoding(value: SmsEncoding); safecall;
    function ToBinaryMessages(format: SmsDataFormat): IVectorView_1__ISmsBinaryMessage; safecall;
    property Body: HSTRING read get_Body write put_Body;
    property Encoding: SmsEncoding read get_Encoding write put_Encoding;
    property From: HSTRING read get_From write put_From;
    property PartCount: Cardinal read get_PartCount;
    property PartNumber: Cardinal read get_PartNumber;
    property PartReferenceId: Cardinal read get_PartReferenceId;
    property Timestamp: DateTime read get_Timestamp;
    property &To: HSTRING read get_To write put_To;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsTextMessage
  // Used Types:  Windows.Devices.Sms.ISmsBinaryMessage
  // Used Types:  Windows.Devices.Sms.SmsDataFormat
  // Used Types:  UInt8
  }
  // Windows.Devices.Sms.ISmsTextMessageStatics
  [WinRTClassNameAttribute(SSmsTextMessage)]
  ISmsTextMessageStatics = interface(IInspectable)
  ['{7F68C5ED-3CCC-47A3-8C55-380D3B010892}']
    function FromBinaryMessage(binaryMessage: ISmsBinaryMessage): ISmsTextMessage; safecall;
    function FromBinaryData(format: SmsDataFormat; valueSize: Cardinal; value: PByte): ISmsTextMessage; safecall;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsMessage>
  AsyncOperationCompletedHandler_1__ISmsMessage_Delegate_Base = interface(IUnknown)
  ['{4E6C4C86-EBE6-55D9-ADC0-FECC38C82AA2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsMessage>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsMessage>
  AsyncOperationCompletedHandler_1__ISmsMessage = interface(AsyncOperationCompletedHandler_1__ISmsMessage_Delegate_Base)
  ['{4E6C4C86-EBE6-55D9-ADC0-FECC38C82AA2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ISmsMessage; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsMessage>
  IAsyncOperation_1__ISmsMessage_Base = interface(IInspectable)
  ['{ABF9B459-48C3-5EAC-9749-4C6DB4D507E6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsMessage>
  // Used Types:  Windows.Devices.Sms.ISmsMessage
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsMessage>
  IAsyncOperation_1__ISmsMessage = interface(IAsyncOperation_1__ISmsMessage_Base)
  ['{ABF9B459-48C3-5EAC-9749-4C6DB4D507E6}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ISmsMessage); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ISmsMessage; safecall;
    function GetResults: ISmsMessage; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ISmsMessage read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessage>
  IIterator_1__ISmsMessage_Base = interface(IInspectable)
  ['{EED04F5C-B2B2-5C83-8B13-C78AF6CA3A18}']
  end;
  {
  // Used Types:  Windows.Devices.Sms.ISmsMessage
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessage>
  IIterator_1__ISmsMessage = interface(IIterator_1__ISmsMessage_Base)
  ['{EED04F5C-B2B2-5C83-8B13-C78AF6CA3A18}']
    function get_Current: ISmsMessage; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PISmsMessage): Cardinal; safecall;
    property Current: ISmsMessage read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsMessage>
  IIterable_1__ISmsMessage_Base = interface(IInspectable)
  ['{ECABFD70-9601-5E38-83CF-B1046022A244}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sms.ISmsMessage>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sms.ISmsMessage>
  IIterable_1__ISmsMessage = interface(IIterable_1__ISmsMessage_Base)
  ['{ECABFD70-9601-5E38-83CF-B1046022A244}']
    function First: IIterator_1__ISmsMessage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  UInt32
  // Used Types:  Windows.Devices.Sms.SmsMessageFilter
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsMessage>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  }
  // Windows.Devices.Sms.ISmsDeviceMessageStore
  [WinRTClassNameAttribute(SSmsDeviceMessageStore)]
  ISmsDeviceMessageStore = interface(IInspectable)
  ['{9889F253-F188-4427-8D54-CE0C2423C5C1}']
    function DeleteMessageAsync(messageId: Cardinal): IAsyncAction; safecall;
    function DeleteMessagesAsync(messageFilter: SmsMessageFilter): IAsyncAction; safecall;
    function GetMessageAsync(messageId: Cardinal): IAsyncOperation_1__ISmsMessage; safecall;
    function GetMessagesAsync(messageFilter: SmsMessageFilter): IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer; safecall;
    function get_MaxMessages: Cardinal; safecall;
    property MaxMessages: Cardinal read get_MaxMessages;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsTextMessage
  // Used Types:  Windows.Devices.Sms.ISmsBinaryMessage
  }
  // Windows.Devices.Sms.ISmsMessageReceivedEventArgs
  ISmsMessageReceivedEventArgs = interface(IInspectable)
  ['{08E80A98-B8E5-41C1-A3D8-D3ABFAE22675}']
    function get_TextMessage: ISmsTextMessage; safecall;
    function get_BinaryMessage: ISmsBinaryMessage; safecall;
    property BinaryMessage: ISmsBinaryMessage read get_BinaryMessage;
    property TextMessage: ISmsTextMessage read get_TextMessage;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsDevice
  }
  // Windows.Devices.Sms.SmsDeviceStatusChangedEventHandler
  SmsDeviceStatusChangedEventHandler = interface(IUnknown)
  ['{982B1162-3DD7-4618-AF89-0C272D5D06D8}']
    procedure Invoke(sender: ISmsDevice); safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.Sms.ISmsMessage
  // Used Types:  Windows.Devices.Sms.SmsEncodedLength
  // Used Types:  Windows.Devices.Sms.ISmsTextMessage
  // Used Types:  String
  // Used Types:  Windows.Devices.Sms.CellularClass
  // Used Types:  Windows.Devices.Sms.ISmsDeviceMessageStore
  // Used Types:  Windows.Devices.Sms.SmsDeviceStatus
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Devices.Sms.SmsMessageReceivedEventHandler
  // Used Types:  Windows.Devices.Sms.SmsDeviceStatusChangedEventHandler
  }
  // Windows.Devices.Sms.ISmsDevice
  [WinRTClassNameAttribute(SSmsDevice)]
  ISmsDevice = interface(IInspectable)
  ['{091791ED-872B-4EEC-9C72-AB11627B34EC}']
    function SendMessageAsync(message: ISmsMessage): IAsyncAction; safecall;
    function CalculateLength(message: ISmsTextMessage): SmsEncodedLength; safecall;
    function get_AccountPhoneNumber: HSTRING; safecall;
    function get_CellularClass: CellularClass; safecall;
    function get_MessageStore: ISmsDeviceMessageStore; safecall;
    function get_DeviceStatus: SmsDeviceStatus; safecall;
    function add_SmsMessageReceived(eventHandler: SmsMessageReceivedEventHandler): EventRegistrationToken; safecall;
    procedure remove_SmsMessageReceived(eventCookie: EventRegistrationToken); safecall;
    function add_SmsDeviceStatusChanged(eventHandler: SmsDeviceStatusChangedEventHandler): EventRegistrationToken; safecall;
    procedure remove_SmsDeviceStatusChanged(eventCookie: EventRegistrationToken); safecall;
    property AccountPhoneNumber: HSTRING read get_AccountPhoneNumber;
    property CellularClass: CellularClass read get_CellularClass;
    property DeviceStatus: SmsDeviceStatus read get_DeviceStatus;
    property MessageStore: ISmsDeviceMessageStore read get_MessageStore;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.ISmsDevice
  // Used Types:  Windows.Devices.Sms.ISmsMessageReceivedEventArgs
  }
  // Windows.Devices.Sms.SmsMessageReceivedEventHandler
  SmsMessageReceivedEventHandler = interface(IUnknown)
  ['{0B7AD409-EC2D-47CE-A253-732BEEEBCACD}']
    procedure Invoke(sender: ISmsDevice; e: ISmsMessageReceivedEventArgs); safecall;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsDevice>
  AsyncOperationCompletedHandler_1__ISmsDevice_Delegate_Base = interface(IUnknown)
  ['{44AA5484-43D0-5893-A4EE-7DB00113AE60}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsDevice>
  AsyncOperationCompletedHandler_1__ISmsDevice = interface(AsyncOperationCompletedHandler_1__ISmsDevice_Delegate_Base)
  ['{4112847D-E507-5969-A8B8-709FD150970B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ISmsDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsDevice>
  IAsyncOperation_1__ISmsDevice_Base = interface(IInspectable)
  ['{AB710DE1-FCBB-5BD6-9F2F-285FA9FB44E8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsDevice>
  // Used Types:  Windows.Devices.Sms.ISmsDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsDevice>
  IAsyncOperation_1__ISmsDevice = interface(IAsyncOperation_1__ISmsDevice_Base)
  ['{2100FBA5-F2F0-5001-AEFC-7AA0B1B744CC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ISmsDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ISmsDevice; safecall;
    function GetResults: ISmsDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ISmsDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsDevice>
  }
  // Windows.Devices.Sms.ISmsDeviceStatics
  [WinRTClassNameAttribute(SSmsDevice)]
  ISmsDeviceStatics = interface(IInspectable)
  ['{F88D07EA-D815-4DD1-A234-4520CE4604A4}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ISmsDevice; safecall;
    function GetDefaultAsync: IAsyncOperation_1__ISmsDevice; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsDevice>
  // Used Types:  String
  }
  // Windows.Devices.Sms.ISmsDeviceStatics2
  [WinRTClassNameAttribute(SSmsDevice)]
  ISmsDeviceStatics2 = interface(IInspectable)
  ['{2CA11C87-0873-4CAF-8A7D-BD471E8586D1}']
    function FromNetworkAccountIdAsync(networkAccountId: HSTRING): IAsyncOperation_1__ISmsDevice; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt32
  }
  // Windows.Devices.Sms.ISmsReceivedEventDetails
  [WinRTClassNameAttribute(SSmsReceivedEventDetails)]
  ISmsReceivedEventDetails = interface(IInspectable)
  ['{5BB50F15-E46D-4C82-847D-5A0304C1D53D}']
    function get_DeviceId: HSTRING; safecall;
    function get_MessageIndex: Cardinal; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MessageIndex: Cardinal read get_MessageIndex;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sms.SmsMessageClass
  // Used Types:  Windows.Devices.Sms.ISmsBinaryMessage
  }
  // Windows.Devices.Sms.ISmsReceivedEventDetails2
  ISmsReceivedEventDetails2 = interface(IInspectable)
  ['{40E05C86-A7B4-4771-9AE7-0B5FFB12C03A}']
    function get_MessageClass: SmsMessageClass; safecall;
    function get_BinaryMessage: ISmsBinaryMessage; safecall;
    property BinaryMessage: ISmsBinaryMessage read get_BinaryMessage;
    property MessageClass: SmsMessageClass read get_MessageClass;
  end deprecated;


  // Emit Forwarded classes
  // Windows.Devices.Sms.SmsTextMessage2
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsTextMessage2
  // Implements: Windows.Devices.Sms.ISmsMessageBase
  // Instantiable: "ISmsTextMessage2"
  TSmsTextMessage2 = class(TWinRTGenericImportI<ISmsTextMessage2>) end;

  // Windows.Devices.Sms.SmsWapMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsWapMessage
  // Implements: Windows.Devices.Sms.ISmsMessageBase

  // Windows.Devices.Sms.SmsAppMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsAppMessage
  // Implements: Windows.Devices.Sms.ISmsMessageBase
  // Instantiable: "ISmsAppMessage"
  TSmsAppMessage = class(TWinRTGenericImportI<ISmsAppMessage>) end;

  // Windows.Devices.Sms.SmsBroadcastMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsBroadcastMessage
  // Implements: Windows.Devices.Sms.ISmsMessageBase

  // Windows.Devices.Sms.SmsVoicemailMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsVoicemailMessage
  // Implements: Windows.Devices.Sms.ISmsMessageBase

  // Windows.Devices.Sms.SmsStatusMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsStatusMessage
  // Implements: Windows.Devices.Sms.ISmsMessageBase

  // Windows.Devices.Sms.SmsSendMessageResult
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsSendMessageResult

  // Windows.Devices.Sms.SmsDevice2
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsDevice2
  // Statics: "Windows.Devices.Sms.ISmsDevice2Statics"
  TSmsDevice2 = class(TWinRTGenericImportS<ISmsDevice2Statics>)
  public
    // -> ISmsDevice2Statics
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromId(deviceId: HSTRING): ISmsDevice2; static; inline;
    class function GetDefault: ISmsDevice2; static; inline;
    class function FromParentId(parentDeviceId: HSTRING): ISmsDevice2; static; inline;
  end;

  // Windows.Devices.Sms.SmsMessageReceivedTriggerDetails
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsMessageReceivedTriggerDetails

  // Windows.Devices.Sms.SmsFilterRule
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsFilterRule
  // Factory: "Windows.Devices.Sms.ISmsFilterRuleFactory"
  TSmsFilterRule = class(TWinRTGenericImportF<ISmsFilterRuleFactory>)
  public
    // -> ISmsFilterRuleFactory
    class function CreateFilterRule(messageType: SmsMessageType): ISmsFilterRule; static; inline;
  end;

  // Windows.Devices.Sms.SmsFilterRules
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsFilterRules
  // Factory: "Windows.Devices.Sms.ISmsFilterRulesFactory"
  TSmsFilterRules = class(TWinRTGenericImportF<ISmsFilterRulesFactory>)
  public
    // -> ISmsFilterRulesFactory
    class function CreateFilterRules(actionType: SmsFilterActionType): ISmsFilterRules; static; inline;
  end;

  // Windows.Devices.Sms.SmsMessageRegistration
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsMessageRegistration
  // Statics: "Windows.Devices.Sms.ISmsMessageRegistrationStatics"
  TSmsMessageRegistration = class(TWinRTGenericImportS<ISmsMessageRegistrationStatics>)
  public
    // -> ISmsMessageRegistrationStatics
    class function get_AllRegistrations: IVectorView_1__ISmsMessageRegistration; static; inline;
    class function Register(id: HSTRING; filterRules: ISmsFilterRules): ISmsMessageRegistration; static; inline;
    class property AllRegistrations: IVectorView_1__ISmsMessageRegistration read get_AllRegistrations;
  end;

  // Windows.Devices.Sms.SmsBinaryMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsBinaryMessage
  // Implements: Windows.Devices.Sms.ISmsMessage
  // Instantiable: "ISmsBinaryMessage"
  TSmsBinaryMessage = class(TWinRTGenericImportI<ISmsBinaryMessage>) end;

  // Windows.Devices.Sms.SmsTextMessage
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsTextMessage
  // Implements: Windows.Devices.Sms.ISmsMessage
  // Statics: "Windows.Devices.Sms.ISmsTextMessageStatics"
  // Instantiable: "ISmsTextMessage"
  TSmsTextMessage = class(TWinRTGenericImportSI<ISmsTextMessageStatics, ISmsTextMessage>)
  public
    // -> ISmsTextMessageStatics
    class function FromBinaryMessage(binaryMessage: ISmsBinaryMessage): ISmsTextMessage; static; inline;
    class function FromBinaryData(format: SmsDataFormat; valueSize: Cardinal; value: PByte): ISmsTextMessage; static; inline;
  end;

  // Windows.Devices.Sms.SmsDeviceMessageStore
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsDeviceMessageStore

  // Windows.Devices.Sms.SmsDevice
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsDevice
  // Statics: "Windows.Devices.Sms.ISmsDeviceStatics"
  // Statics: "Windows.Devices.Sms.ISmsDeviceStatics2"
  TSmsDevice = class(TWinRTGenericImportS2<ISmsDeviceStatics, ISmsDeviceStatics2>)
  public
    // -> ISmsDeviceStatics
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ISmsDevice; static; inline;
    class function GetDefaultAsync: IAsyncOperation_1__ISmsDevice; static; inline;

    // -> ISmsDeviceStatics2
    class function FromNetworkAccountIdAsync(networkAccountId: HSTRING): IAsyncOperation_1__ISmsDevice; static; inline;
  end;

  // Windows.Devices.Sms.SmsReceivedEventDetails
  // DualAPI
  // Implements: Windows.Devices.Sms.ISmsReceivedEventDetails
  // Implements: Windows.Devices.Sms.ISmsReceivedEventDetails2


implementation

  // Emit Classes Implementation
 { TSmsTextMessage2 }

 { TSmsAppMessage }

 { TSmsDevice2 }

class function TSmsDevice2.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TSmsDevice2.FromId(deviceId: HSTRING): ISmsDevice2;
begin
  Result := Statics.FromId(deviceId);
end;

class function TSmsDevice2.GetDefault: ISmsDevice2;
begin
  Result := Statics.GetDefault;
end;

class function TSmsDevice2.FromParentId(parentDeviceId: HSTRING): ISmsDevice2;
begin
  Result := Statics.FromParentId(parentDeviceId);
end;


 { TSmsFilterRule }
// Factories for : "SmsFilterRule"
// Factory: "Windows.Devices.Sms.ISmsFilterRuleFactory"
// -> ISmsFilterRuleFactory

class function TSmsFilterRule.CreateFilterRule(messageType: SmsMessageType): ISmsFilterRule;
begin
  Result := Factory.CreateFilterRule(messageType);
end;


 { TSmsFilterRules }
// Factories for : "SmsFilterRules"
// Factory: "Windows.Devices.Sms.ISmsFilterRulesFactory"
// -> ISmsFilterRulesFactory

class function TSmsFilterRules.CreateFilterRules(actionType: SmsFilterActionType): ISmsFilterRules;
begin
  Result := Factory.CreateFilterRules(actionType);
end;


 { TSmsMessageRegistration }

class function TSmsMessageRegistration.get_AllRegistrations: IVectorView_1__ISmsMessageRegistration;
begin
  Result := Statics.get_AllRegistrations;
end;

class function TSmsMessageRegistration.Register(id: HSTRING; filterRules: ISmsFilterRules): ISmsMessageRegistration;
begin
  Result := Statics.Register(id, filterRules);
end;


 { TSmsBinaryMessage }

 { TSmsTextMessage }

class function TSmsTextMessage.FromBinaryMessage(binaryMessage: ISmsBinaryMessage): ISmsTextMessage;
begin
  Result := Statics.FromBinaryMessage(binaryMessage);
end;

class function TSmsTextMessage.FromBinaryData(format: SmsDataFormat; valueSize: Cardinal; value: PByte): ISmsTextMessage;
begin
  Result := Statics.FromBinaryData(format, valueSize, value);
end;


 { TSmsDevice }

class function TSmsDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TSmsDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ISmsDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TSmsDevice.GetDefaultAsync: IAsyncOperation_1__ISmsDevice;
begin
  Result := Statics.GetDefaultAsync;
end;


class function TSmsDevice.FromNetworkAccountIdAsync(networkAccountId: HSTRING): IAsyncOperation_1__ISmsDevice;
begin
  Result := Statics2.FromNetworkAccountIdAsync(networkAccountId);
end;



end.
