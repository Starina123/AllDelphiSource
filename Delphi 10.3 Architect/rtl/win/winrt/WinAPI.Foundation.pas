{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Foundation;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Foundation.Types, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.IAsyncInfo
  IAsyncInfo = interface;
  PIAsyncInfo = ^IAsyncInfo;

  // Windows.Foundation.IWwwFormUrlDecoderEntry
  IWwwFormUrlDecoderEntry = interface;
  PIWwwFormUrlDecoderEntry = ^IWwwFormUrlDecoderEntry;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterator_1__IWwwFormUrlDecoderEntry = interface;
  PIIterator_1__IWwwFormUrlDecoderEntry = ^IIterator_1__IWwwFormUrlDecoderEntry;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterable_1__IWwwFormUrlDecoderEntry = interface;
  PIIterable_1__IWwwFormUrlDecoderEntry = ^IIterable_1__IWwwFormUrlDecoderEntry;

  // Windows.Foundation.IClosable
  IClosable = interface;
  PIClosable = ^IClosable;

  // Windows.Foundation.IPropertyValue
  IPropertyValue = interface;
  PIPropertyValue = ^IPropertyValue;

  // Windows.Foundation.IMemoryBufferReference
  IMemoryBufferReference = interface;
  PIMemoryBufferReference = ^IMemoryBufferReference;

  // Windows.Foundation.IMemoryBuffer
  IMemoryBuffer = interface;
  PIMemoryBuffer = ^IMemoryBuffer;

  // Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  IReference_1__Rect = interface;
  PIReference_1__Rect = ^IReference_1__Rect;

  // Windows.Foundation.IGetActivationFactory
  IGetActivationFactory = interface;
  PIGetActivationFactory = ^IGetActivationFactory;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Size>
  IIterator_1__Size = interface;
  PIIterator_1__Size = ^IIterator_1__Size;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Size>
  IIterable_1__Size = interface;
  PIIterable_1__Size = ^IIterable_1__Size;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Size>
  IVectorView_1__Size = interface;
  PIVectorView_1__Size = ^IVectorView_1__Size;

  // Windows.Foundation.IPropertyValueStatics
  IPropertyValueStatics = interface;
  PIPropertyValueStatics = ^IPropertyValueStatics;

  // Windows.Foundation.IStringable
  IStringable = interface;
  PIStringable = ^IStringable;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIKeyValuePair_2__HSTRING__IInspectable = ^IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterator_1__IKeyValuePair_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IInspectable = ^IIterable_1__IKeyValuePair_2__HSTRING__IInspectable;

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

  // Windows.Foundation.DeferralCompletedHandler
  DeferralCompletedHandler = interface;
  PDeferralCompletedHandler = ^DeferralCompletedHandler;

  // Windows.Foundation.IDeferralFactory
  IDeferralFactory = interface;
  PIDeferralFactory = ^IDeferralFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Foundation.IUriRuntimeClassWithAbsoluteCanonicalUri
  IUriRuntimeClassWithAbsoluteCanonicalUri = interface;
  PIUriRuntimeClassWithAbsoluteCanonicalUri = ^IUriRuntimeClassWithAbsoluteCanonicalUri;

  // Windows.Foundation.IUriEscapeStatics
  IUriEscapeStatics = interface;
  PIUriEscapeStatics = ^IUriEscapeStatics;

  // Windows.Foundation.IUriRuntimeClassFactory
  IUriRuntimeClassFactory = interface;
  PIUriRuntimeClassFactory = ^IUriRuntimeClassFactory;

  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory
  IWwwFormUrlDecoderRuntimeClassFactory = interface;
  PIWwwFormUrlDecoderRuntimeClassFactory = ^IWwwFormUrlDecoderRuntimeClassFactory;

  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Matrix4x4>
  IReference_1__Numerics_Matrix4x4 = interface;
  PIReference_1__Numerics_Matrix4x4 = ^IReference_1__Numerics_Matrix4x4;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IClosable>
  IIterator_1__IClosable = interface;
  PIIterator_1__IClosable = ^IIterator_1__IClosable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IClosable>
  IIterable_1__IClosable = interface;
  PIIterable_1__IClosable = ^IIterable_1__IClosable;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IClosable>
  IVectorView_1__IClosable = interface;
  PIVectorView_1__IClosable = ^IVectorView_1__IClosable;

  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.IClosable>
  IVector_1__IClosable = interface;
  PIVector_1__IClosable = ^IVector_1__IClosable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  IIterator_1__IUriRuntimeClass = interface;
  PIIterator_1__IUriRuntimeClass = ^IIterator_1__IUriRuntimeClass;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  IIterable_1__IUriRuntimeClass = interface;
  PIIterable_1__IUriRuntimeClass = ^IIterable_1__IUriRuntimeClass;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  IIterator_1__TimeSpan = interface;
  PIIterator_1__TimeSpan = ^IIterator_1__TimeSpan;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  IIterable_1__TimeSpan = interface;
  PIIterable_1__TimeSpan = ^IIterable_1__TimeSpan;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  IVectorView_1__IUriRuntimeClass = interface;
  PIVectorView_1__IUriRuntimeClass = ^IVectorView_1__IUriRuntimeClass;

  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.IUriRuntimeClass>
  IVector_1__IUriRuntimeClass = interface;
  PIVector_1__IUriRuntimeClass = ^IVector_1__IUriRuntimeClass;

  // Windows.Foundation.IReference`1<Windows.Foundation.Point>
  IReference_1__Point = interface;
  PIReference_1__Point = ^IReference_1__Point;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  IIterator_1__DateTime = interface;
  PIIterator_1__DateTime = ^IIterator_1__DateTime;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.DateTime>
  IIterable_1__DateTime = interface;
  PIIterable_1__DateTime = ^IIterable_1__DateTime;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.DateTime>
  IVectorView_1__DateTime = interface;
  PIVectorView_1__DateTime = ^IVectorView_1__DateTime;

  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.DateTime>
  IVector_1__DateTime = interface;
  PIVector_1__DateTime = ^IVector_1__DateTime;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterator_1__IIterable_1__Point = interface;
  PIIterator_1__IIterable_1__Point = ^IIterator_1__IIterable_1__Point;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterable_1__IIterable_1__Point = interface;
  PIIterable_1__IIterable_1__Point = ^IIterable_1__IIterable_1__Point;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  IVectorView_1__Point = interface;
  PIVectorView_1__Point = ^IVectorView_1__Point;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  AsyncOperationCompletedHandler_1__IReference_1__DateTime = interface;
  PAsyncOperationCompletedHandler_1__IReference_1__DateTime = ^AsyncOperationCompletedHandler_1__IReference_1__DateTime;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  IAsyncOperation_1__IReference_1__DateTime = interface;
  PIAsyncOperation_1__IReference_1__DateTime = ^IAsyncOperation_1__IReference_1__DateTime;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  AsyncOperationCompletedHandler_1__IReference_1__TimeSpan = interface;
  PAsyncOperationCompletedHandler_1__IReference_1__TimeSpan = ^AsyncOperationCompletedHandler_1__IReference_1__TimeSpan;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  IAsyncOperation_1__IReference_1__TimeSpan = interface;
  PIAsyncOperation_1__IReference_1__TimeSpan = ^IAsyncOperation_1__IReference_1__TimeSpan;

  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector3>
  IReference_1__Numerics_Vector3 = interface;
  PIReference_1__Numerics_Vector3 = ^IReference_1__Numerics_Vector3;

  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector2>
  IReference_1__Numerics_Vector2 = interface;
  PIReference_1__Numerics_Vector2 = ^IReference_1__Numerics_Vector2;

  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Quaternion>
  IReference_1__Numerics_Quaternion = interface;
  PIReference_1__Numerics_Quaternion = ^IReference_1__Numerics_Quaternion;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Foundation Interfaces
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.AsyncStatus
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Foundation.IAsyncInfo
  IAsyncInfo = interface(IInspectable)
  ['{00000036-0000-0000-C000-000000000046}']
    function get_Id: Cardinal; safecall;
    function get_Status: AsyncStatus; safecall;
    function get_ErrorCode: HRESULT; safecall;
    procedure Cancel; safecall;
    procedure Close; safecall;
    property ErrorCode: HRESULT read get_ErrorCode;
    property Id: Cardinal read get_Id;
    property Status: AsyncStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IWwwFormUrlDecoderEntry
  [WinRTClassNameAttribute(SWwwFormUrlDecoderEntry)]
  IWwwFormUrlDecoderEntry = interface(IInspectable)
  ['{125E7431-F678-4E8E-B670-20A9B06C512D}']
    function get_Name: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Name: HSTRING read get_Name;
    property Value: HSTRING read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterator_1__IWwwFormUrlDecoderEntry_Base = interface(IInspectable)
  ['{32E54295-373C-50CB-80A1-468A990CA780}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IWwwFormUrlDecoderEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterator_1__IWwwFormUrlDecoderEntry = interface(IIterator_1__IWwwFormUrlDecoderEntry_Base)
  ['{32E54295-373C-50CB-80A1-468A990CA780}']
    function get_Current: IWwwFormUrlDecoderEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIWwwFormUrlDecoderEntry): Cardinal; safecall;
    property Current: IWwwFormUrlDecoderEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterable_1__IWwwFormUrlDecoderEntry_Base = interface(IInspectable)
  ['{876BE83B-7218-5BFB-A169-83152EF7E146}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  IIterable_1__IWwwFormUrlDecoderEntry = interface(IIterable_1__IWwwFormUrlDecoderEntry_Base)
  ['{876BE83B-7218-5BFB-A169-83152EF7E146}']
    function First: IIterator_1__IWwwFormUrlDecoderEntry; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Foundation.IClosable
  [WinRTClassNameAttribute(SAudio_AudioGraphBatchUpdater)]
  IClosable = interface(IInspectable)
  ['{30D5A829-7FA4-4026-83BB-D75BAE4EA99E}']
    procedure Close; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.PropertyType
  // Used Types:  Boolean
  // Used Types:  UInt8
  // Used Types:  Int16
  // Used Types:  UInt16
  // Used Types:  Int32
  // Used Types:  UInt32
  // Used Types:  Int64
  // Used Types:  UInt64
  // Used Types:  Single
  // Used Types:  Double
  // Used Types:  Char
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Object
  }
  // Windows.Foundation.IPropertyValue
  IPropertyValue = interface(IInspectable)
  ['{4BD682DD-7554-40E9-9A9B-82654EDE7E62}']
    function get_Type: PropertyType; safecall;
    function get_IsNumericScalar: Boolean; safecall;
    function GetUInt8: Byte; safecall;
    function GetInt16: SmallInt; safecall;
    function GetUInt16: Word; safecall;
    function GetInt32: Integer; safecall;
    function GetUInt32: Cardinal; safecall;
    function GetInt64: Int64; safecall;
    function GetUInt64: UInt64; safecall;
    function GetSingle: Single; safecall;
    function GetDouble: Double; safecall;
    function GetChar16: Char; safecall;
    function GetBoolean: Boolean; safecall;
    function GetString: HSTRING; safecall;
    function GetGuid: TGuid; safecall;
    function GetDateTime: DateTime; safecall;
    function GetTimeSpan: TimeSpan; safecall;
    function GetPoint: TPointF; safecall;
    function GetSize: TSizeF; safecall;
    function GetRect: TRectF; safecall;
    procedure GetUInt8Array(valueSize: Cardinal; value: PByte); safecall;
    procedure GetInt16Array(valueSize: Cardinal; value: PSmallInt); safecall;
    procedure GetUInt16Array(valueSize: Cardinal; value: PWord); safecall;
    procedure GetInt32Array(valueSize: Cardinal; value: PInteger); safecall;
    procedure GetUInt32Array(valueSize: Cardinal; value: PCardinal); safecall;
    procedure GetInt64Array(valueSize: Cardinal; value: PInt64); safecall;
    procedure GetUInt64Array(valueSize: Cardinal; value: PUInt64); safecall;
    procedure GetSingleArray(valueSize: Cardinal; value: PSingle); safecall;
    procedure GetDoubleArray(valueSize: Cardinal; value: PDouble); safecall;
    procedure GetChar16Array(valueSize: Cardinal; value: PChar); safecall;
    procedure GetBooleanArray(valueSize: Cardinal; value: PBoolean); safecall;
    procedure GetStringArray(valueSize: Cardinal; value: PHSTRING); safecall;
    procedure GetInspectableArray(valueSize: Cardinal; value: PIInspectable); safecall;
    procedure GetGuidArray(valueSize: Cardinal; value: PGuid); safecall;
    procedure GetDateTimeArray(valueSize: Cardinal; value: PDateTime); safecall;
    procedure GetTimeSpanArray(valueSize: Cardinal; value: PTimeSpan); safecall;
    procedure GetPointArray(valueSize: Cardinal; value: PPointF); safecall;
    procedure GetSizeArray(valueSize: Cardinal; value: PSizeF); safecall;
    procedure GetRectArray(valueSize: Cardinal; value: PRectF); safecall;
    property IsNumericScalar: Boolean read get_IsNumericScalar;
    property &Type: PropertyType read get_Type;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  }
  // Windows.Foundation.IMemoryBufferReference
  IMemoryBufferReference = interface(IInspectable)
  ['{FBC4DD29-245B-11E4-AF98-689423260CF8}']
    function get_Capacity: Cardinal; safecall;
    function add_Closed(handler: TypedEventHandler_2__IMemoryBufferReference__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Closed(cookie: EventRegistrationToken); safecall;
    property Capacity: Cardinal read get_Capacity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  }
  // Windows.Foundation.IMemoryBuffer
  IMemoryBuffer = interface(IInspectable)
  ['{FBC4DD2A-245B-11E4-AF98-689423260CF8}']
    function CreateReference: IMemoryBufferReference; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  IReference_1__Rect = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: TRectF; safecall;
    property Value: TRectF read get_Value;
  end;

  {
  // Used Types:  Object
  // Used Types:  String
  }
  // Windows.Foundation.IGetActivationFactory
  IGetActivationFactory = interface(IInspectable)
  ['{4EDB8EE2-96DD-49A7-94F7-4607DDAB8E3C}']
    function GetActivationFactory(activatableClassId: HSTRING): IInspectable; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Size>
  IIterator_1__Size_Base = interface(IInspectable)
  ['{A3508EE0-3527-5144-894D-422EADEF43D7}']
  end;
  {
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Size>
  IIterator_1__Size = interface(IIterator_1__Size_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: TSizeF; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSizeF): Cardinal; safecall;
    property Current: TSizeF read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Size>
  IIterable_1__Size_Base = interface(IInspectable)
  ['{C9DF55C3-4D41-5E90-BA76-E89ED564446B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Size>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Size>
  IIterable_1__Size = interface(IIterable_1__Size_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Size; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Size
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Size>
  IVectorView_1__Size = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): TSizeF; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TSizeF; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSizeF): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Object
  // Used Types:  UInt8
  // Used Types:  Int16
  // Used Types:  UInt16
  // Used Types:  Int32
  // Used Types:  UInt32
  // Used Types:  Int64
  // Used Types:  UInt64
  // Used Types:  Single
  // Used Types:  Double
  // Used Types:  Char
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.Foundation.IPropertyValueStatics
  [WinRTClassNameAttribute(SPropertyValue)]
  IPropertyValueStatics = interface(IInspectable)
  ['{629BDBC8-D932-4FF4-96B9-8D96C5C1E858}']
    function CreateEmpty: IInspectable; safecall;
    function CreateUInt8(value: Byte): IInspectable; safecall;
    function CreateInt16(value: SmallInt): IInspectable; safecall;
    function CreateUInt16(value: Word): IInspectable; safecall;
    function CreateInt32(value: Integer): IInspectable; safecall;
    function CreateUInt32(value: Cardinal): IInspectable; safecall;
    function CreateInt64(value: Int64): IInspectable; safecall;
    function CreateUInt64(value: UInt64): IInspectable; safecall;
    function CreateSingle(value: Single): IInspectable; safecall;
    function CreateDouble(value: Double): IInspectable; safecall;
    function CreateChar16(value: Char): IInspectable; safecall;
    function CreateBoolean(value: Boolean): IInspectable; safecall;
    function CreateString(value: HSTRING): IInspectable; safecall;
    function CreateInspectable(value: IInspectable): IInspectable; safecall;
    function CreateGuid(value: TGuid): IInspectable; safecall;
    function CreateDateTime(value: DateTime): IInspectable; safecall;
    function CreateTimeSpan(value: TimeSpan): IInspectable; safecall;
    function CreatePoint(value: TPointF): IInspectable; safecall;
    function CreateSize(value: TSizeF): IInspectable; safecall;
    function CreateRect(value: TRectF): IInspectable; safecall;
    function CreateUInt8Array(valueSize: Cardinal; value: PByte): IInspectable; safecall;
    function CreateInt16Array(valueSize: Cardinal; value: PSmallInt): IInspectable; safecall;
    function CreateUInt16Array(valueSize: Cardinal; value: PWord): IInspectable; safecall;
    function CreateInt32Array(valueSize: Cardinal; value: PInteger): IInspectable; safecall;
    function CreateUInt32Array(valueSize: Cardinal; value: PCardinal): IInspectable; safecall;
    function CreateInt64Array(valueSize: Cardinal; value: PInt64): IInspectable; safecall;
    function CreateUInt64Array(valueSize: Cardinal; value: PUInt64): IInspectable; safecall;
    function CreateSingleArray(valueSize: Cardinal; value: PSingle): IInspectable; safecall;
    function CreateDoubleArray(valueSize: Cardinal; value: PDouble): IInspectable; safecall;
    function CreateChar16Array(valueSize: Cardinal; value: PChar): IInspectable; safecall;
    function CreateBooleanArray(valueSize: Cardinal; value: PBoolean): IInspectable; safecall;
    function CreateStringArray(valueSize: Cardinal; value: PHSTRING): IInspectable; safecall;
    function CreateInspectableArray(valueSize: Cardinal; value: PIInspectable): IInspectable; safecall;
    function CreateGuidArray(valueSize: Cardinal; value: PGuid): IInspectable; safecall;
    function CreateDateTimeArray(valueSize: Cardinal; value: PDateTime): IInspectable; safecall;
    function CreateTimeSpanArray(valueSize: Cardinal; value: PTimeSpan): IInspectable; safecall;
    function CreatePointArray(valueSize: Cardinal; value: PPointF): IInspectable; safecall;
    function CreateSizeArray(valueSize: Cardinal; value: PSizeF): IInspectable; safecall;
    function CreateRectArray(valueSize: Cardinal; value: PRectF): IInspectable; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IStringable
  IStringable = interface(IInspectable)
  ['{96369F54-8EB6-48F0-ABCE-C1B211E627C3}']
    function ToString: HSTRING; safecall;
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

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{5DB5FA32-707C-5849-A06B-91C8EB9D10E8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterator_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IIterator_1__IKeyValuePair_2__HSTRING__IInspectable_Base)
  ['{5DB5FA32-707C-5849-A06B-91C8EB9D10E8}']
    function get_Current: IKeyValuePair_2__HSTRING__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{FE2F3D47-5D47-5499-8374-430C7CDA0204}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IIterable_1__IKeyValuePair_2__HSTRING__IInspectable_Base)
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

  // Generic Delegate for 
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable_Delegate_Base = interface(IUnknown)
  ['{24F981E5-DDCA-538D-AADA-A59906084CF1}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  }
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface(MapChangedEventHandler_2__HSTRING__IInspectable_Delegate_Base)
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
  }
  // Windows.Foundation.DeferralCompletedHandler
  DeferralCompletedHandler = interface(IUnknown)
  ['{ED32A372-F3C8-4FAA-9CFB-470148DA3888}']
    procedure Invoke; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IDeferral
  // Used Types:  Windows.Foundation.DeferralCompletedHandler
  }
  // Windows.Foundation.IDeferralFactory
  [WinRTClassNameAttribute(SDeferral)]
  IDeferralFactory = interface(IInspectable)
  ['{65A1ECC5-3FB5-4832-8CA9-F061B281D13A}']
    function Create(handler: DeferralCompletedHandler): IDeferral; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(TypedEventHandler_2__IMemoryBufferReference__IInspectable_Delegate_Base)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IUriRuntimeClassWithAbsoluteCanonicalUri
  IUriRuntimeClassWithAbsoluteCanonicalUri = interface(IInspectable)
  ['{758D9661-221C-480F-A339-50656673F46F}']
    function get_AbsoluteCanonicalUri: HSTRING; safecall;
    function get_DisplayIri: HSTRING; safecall;
    property AbsoluteCanonicalUri: HSTRING read get_AbsoluteCanonicalUri;
    property DisplayIri: HSTRING read get_DisplayIri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Foundation.IUriEscapeStatics
  [WinRTClassNameAttribute(SUri)]
  IUriEscapeStatics = interface(IInspectable)
  ['{C1D432BA-C824-4452-A7FD-512BC3BBE9A1}']
    function UnescapeComponent(toUnescape: HSTRING): HSTRING; safecall;
    function EscapeComponent(toEscape: HSTRING): HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  }
  // Windows.Foundation.IUriRuntimeClassFactory
  [WinRTClassNameAttribute(SUri)]
  IUriRuntimeClassFactory = interface(IInspectable)
  ['{44A9796F-723E-4FDF-A218-033E75B0C084}']
    function CreateUri(uri: HSTRING): IUriRuntimeClass; safecall;
    function CreateWithRelativeUri(baseUri: HSTRING; relativeUri: HSTRING): IUriRuntimeClass; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  // Used Types:  String
  }
  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory
  [WinRTClassNameAttribute(SWwwFormUrlDecoder)]
  IWwwFormUrlDecoderRuntimeClassFactory = interface(IInspectable)
  ['{5B8C6B3D-24AE-41B5-A1BF-F0C3D544845B}']
    function CreateWwwFormUrlDecoder(query: HSTRING): IWwwFormUrlDecoderRuntimeClass; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Matrix4x4>
  IReference_1__Numerics_Matrix4x4 = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Numerics_Matrix4x4; safecall;
    property Value: Numerics_Matrix4x4 read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.IClosable
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IClosable>
  IIterator_1__IClosable = interface(IInspectable)
  ['{C9463957-E47D-5649-9874-4B13AE23061B}']
    function get_Current: IClosable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIClosable): Cardinal; safecall;
    property Current: IClosable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IClosable>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IClosable>
  IIterable_1__IClosable = interface(IInspectable)
  ['{44DA7ECF-B8CF-5DEF-8BF1-664578A8FB16}']
    function First: IIterator_1__IClosable; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IClosable
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IClosable>
  IVectorView_1__IClosable = interface(IInspectable)
  ['{26DEBA5E-F73B-5181-94DB-2FCBC1DBAF8F}']
    function GetAt(index: Cardinal): IClosable; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IClosable; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIClosable): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IClosable
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IClosable>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.IClosable>
  IVector_1__IClosable = interface(IInspectable)
  ['{1BFCA4F6-2C4E-5174-9869-B39D35848FCC}']
    function GetAt(index: Cardinal): IClosable; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IClosable; safecall;
    function IndexOf(value: IClosable; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IClosable); safecall;
    procedure InsertAt(index: Cardinal; value: IClosable); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IClosable); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIClosable): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIClosable); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  IIterator_1__IUriRuntimeClass_Base = interface(IInspectable)
  ['{1C157D0F-5EFE-5CEC-BBD6-0C6CE9AF07A5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  IIterator_1__IUriRuntimeClass = interface(IIterator_1__IUriRuntimeClass_Base)
  ['{E070225C-CB16-5FE3-8CC4-CAB4CE987C97}']
    function get_Current: IUriRuntimeClass; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIUriRuntimeClass): Cardinal; safecall;
    property Current: IUriRuntimeClass read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  IIterable_1__IUriRuntimeClass_Base = interface(IInspectable)
  ['{B0D63B78-78AD-5E31-B6D8-E32A0E16C447}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.IUriRuntimeClass>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  IIterable_1__IUriRuntimeClass = interface(IIterable_1__IUriRuntimeClass_Base)
  ['{EA0329A4-F285-5263-A1BA-D87F0BF8D236}']
    function First: IIterator_1__IUriRuntimeClass; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  IIterator_1__TimeSpan_Base = interface(IInspectable)
  ['{67E9EADB-324B-5661-A405-DED8445B1EEA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  IIterator_1__TimeSpan = interface(IIterator_1__TimeSpan_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: TimeSpan; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PTimeSpan): Cardinal; safecall;
    property Current: TimeSpan read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  IIterable_1__TimeSpan_Base = interface(IInspectable)
  ['{E9F78726-829A-5F67-8D19-95EF154B7742}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  IIterable_1__TimeSpan = interface(IIterable_1__TimeSpan_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__TimeSpan; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  IVectorView_1__IUriRuntimeClass = interface(IInspectable)
  ['{D38FF558-9620-5253-B2C2-7B2F4B27AF6F}']
    function GetAt(index: Cardinal): IUriRuntimeClass; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IUriRuntimeClass; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIUriRuntimeClass): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.IUriRuntimeClass>
  IVector_1__IUriRuntimeClass = interface(IInspectable)
  ['{B13E7C58-8A01-5524-A397-45B4629C84C1}']
    function GetAt(index: Cardinal): IUriRuntimeClass; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IUriRuntimeClass; safecall;
    function IndexOf(value: IUriRuntimeClass; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IUriRuntimeClass); safecall;
    procedure InsertAt(index: Cardinal; value: IUriRuntimeClass); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IUriRuntimeClass); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIUriRuntimeClass): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIUriRuntimeClass); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Point
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Point>
  IReference_1__Point = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: TPointF; safecall;
    property Value: TPointF read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  IIterator_1__DateTime_Base = interface(IInspectable)
  ['{F56158DF-8947-5480-96ED-36C1057877EA}']
  end;
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  IIterator_1__DateTime = interface(IIterator_1__DateTime_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: DateTime; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDateTime): Cardinal; safecall;
    property Current: DateTime read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.DateTime>
  IIterable_1__DateTime_Base = interface(IInspectable)
  ['{576A207D-977C-5B36-B54D-624EC86C53A3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.DateTime>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.DateTime>
  IIterable_1__DateTime = interface(IIterable_1__DateTime_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__DateTime; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.DateTime>
  IVectorView_1__DateTime = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): DateTime; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: DateTime; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDateTime): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.DateTime>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Foundation.DateTime>
  IVector_1__DateTime = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): DateTime; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__DateTime; safecall;
    function IndexOf(value: DateTime; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: DateTime); safecall;
    procedure InsertAt(index: Cardinal; value: DateTime); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: DateTime); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDateTime): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDateTime); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterator_1__IIterable_1__Point_Base = interface(IInspectable)
  ['{377F6162-6E4D-574E-BF01-77F4FD021D0E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterator_1__IIterable_1__Point = interface(IIterator_1__IIterable_1__Point_Base)
  ['{66C2C906-6BCA-5085-BBA5-C7D445D25EE6}']
    function get_Current: IIterable_1__Point; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIIterable_1__Point): Cardinal; safecall;
    property Current: IIterable_1__Point read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterable_1__IIterable_1__Point_Base = interface(IInspectable)
  ['{AE44597E-D411-5B7F-BBEC-6A96C94A107A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>>
  IIterable_1__IIterable_1__Point = interface(IIterable_1__IIterable_1__Point_Base)
  ['{0FB49B66-3A39-5E05-B730-60ADDFB9795F}']
    function First: IIterator_1__IIterable_1__Point; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Point
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Point>
  IVectorView_1__Point = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): TPointF; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TPointF; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPointF): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  AsyncOperationCompletedHandler_1__IReference_1__DateTime_Delegate_Base = interface(IUnknown)
  ['{C4225D5E-1B7C-571E-9B88-2AB2EEFA8C8F}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  AsyncOperationCompletedHandler_1__IReference_1__DateTime = interface(AsyncOperationCompletedHandler_1__IReference_1__DateTime_Delegate_Base)
  ['{1AD5D0F6-8398-587D-AA9A-978252B1BBA2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IReference_1__DateTime; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  IAsyncOperation_1__IReference_1__DateTime_Base = interface(IInspectable)
  ['{2025B34F-4214-56AB-ABFE-2FBE6595DA9D}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.DateTime>>
  IAsyncOperation_1__IReference_1__DateTime = interface(IAsyncOperation_1__IReference_1__DateTime_Base)
  ['{00BEDA26-245F-5D19-B775-4DE00BBDC644}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IReference_1__DateTime); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IReference_1__DateTime; safecall;
    function GetResults: IReference_1__DateTime; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IReference_1__DateTime read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  AsyncOperationCompletedHandler_1__IReference_1__TimeSpan_Delegate_Base = interface(IUnknown)
  ['{E137B677-BFEF-54B0-B200-95C5C2902A25}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  AsyncOperationCompletedHandler_1__IReference_1__TimeSpan = interface(AsyncOperationCompletedHandler_1__IReference_1__TimeSpan_Delegate_Base)
  ['{1AD5D0F6-8398-587D-AA9A-978252B1BBA2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IReference_1__TimeSpan; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  IAsyncOperation_1__IReference_1__TimeSpan_Base = interface(IInspectable)
  ['{24A901AD-910F-5C0F-B23C-67007577A558}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>>
  IAsyncOperation_1__IReference_1__TimeSpan = interface(IAsyncOperation_1__IReference_1__TimeSpan_Base)
  ['{00BEDA26-245F-5D19-B775-4DE00BBDC644}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IReference_1__TimeSpan); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IReference_1__TimeSpan; safecall;
    function GetResults: IReference_1__TimeSpan; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IReference_1__TimeSpan read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector3
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector3>
  IReference_1__Numerics_Vector3 = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Numerics_Vector3; safecall;
    property Value: Numerics_Vector3 read get_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector2
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Vector2>
  IReference_1__Numerics_Vector2 = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Numerics_Vector2; safecall;
    property Value: Numerics_Vector2 read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  }
  // Windows.Foundation.IReference`1<Windows.Foundation.Numerics.Quaternion>
  IReference_1__Numerics_Quaternion = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Numerics_Quaternion; safecall;
    property Value: Numerics_Quaternion read get_Value;
  end;


  // Emit Forwarded classes
  // Windows.Foundation.PropertyValue
  // DualAPI
  // Statics: "Windows.Foundation.IPropertyValueStatics"
  TPropertyValue = class(TWinRTGenericImportS<IPropertyValueStatics>)
  public
    // -> IPropertyValueStatics
    class function CreateEmpty: IInspectable; static; inline;
    class function CreateUInt8(value: Byte): IInspectable; static; inline;
    class function CreateInt16(value: SmallInt): IInspectable; static; inline;
    class function CreateUInt16(value: Word): IInspectable; static; inline;
    class function CreateInt32(value: Integer): IInspectable; static; inline;
    class function CreateUInt32(value: Cardinal): IInspectable; static; inline;
    class function CreateInt64(value: Int64): IInspectable; static; inline;
    class function CreateUInt64(value: UInt64): IInspectable; static; inline;
    class function CreateSingle(value: Single): IInspectable; static; inline;
    class function CreateDouble(value: Double): IInspectable; static; inline;
    class function CreateChar16(value: Char): IInspectable; static; inline;
    class function CreateBoolean(value: Boolean): IInspectable; static; inline;
    class function CreateString(value: HSTRING): IInspectable; static; inline;
    class function CreateInspectable(value: IInspectable): IInspectable; static; inline;
    class function CreateGuid(value: TGuid): IInspectable; static; inline;
    class function CreateDateTime(value: DateTime): IInspectable; static; inline;
    class function CreateTimeSpan(value: TimeSpan): IInspectable; static; inline;
    class function CreatePoint(value: TPointF): IInspectable; static; inline;
    class function CreateSize(value: TSizeF): IInspectable; static; inline;
    class function CreateRect(value: TRectF): IInspectable; static; inline;
    class function CreateUInt8Array(valueSize: Cardinal; value: PByte): IInspectable; static; inline;
    class function CreateInt16Array(valueSize: Cardinal; value: PSmallInt): IInspectable; static; inline;
    class function CreateUInt16Array(valueSize: Cardinal; value: PWord): IInspectable; static; inline;
    class function CreateInt32Array(valueSize: Cardinal; value: PInteger): IInspectable; static; inline;
    class function CreateUInt32Array(valueSize: Cardinal; value: PCardinal): IInspectable; static; inline;
    class function CreateInt64Array(valueSize: Cardinal; value: PInt64): IInspectable; static; inline;
    class function CreateUInt64Array(valueSize: Cardinal; value: PUInt64): IInspectable; static; inline;
    class function CreateSingleArray(valueSize: Cardinal; value: PSingle): IInspectable; static; inline;
    class function CreateDoubleArray(valueSize: Cardinal; value: PDouble): IInspectable; static; inline;
    class function CreateChar16Array(valueSize: Cardinal; value: PChar): IInspectable; static; inline;
    class function CreateBooleanArray(valueSize: Cardinal; value: PBoolean): IInspectable; static; inline;
    class function CreateStringArray(valueSize: Cardinal; value: PHSTRING): IInspectable; static; inline;
    class function CreateInspectableArray(valueSize: Cardinal; value: PIInspectable): IInspectable; static; inline;
    class function CreateGuidArray(valueSize: Cardinal; value: PGuid): IInspectable; static; inline;
    class function CreateDateTimeArray(valueSize: Cardinal; value: PDateTime): IInspectable; static; inline;
    class function CreateTimeSpanArray(valueSize: Cardinal; value: PTimeSpan): IInspectable; static; inline;
    class function CreatePointArray(valueSize: Cardinal; value: PPointF): IInspectable; static; inline;
    class function CreateSizeArray(valueSize: Cardinal; value: PSizeF): IInspectable; static; inline;
    class function CreateRectArray(valueSize: Cardinal; value: PRectF): IInspectable; static; inline;
  end;

  // Windows.Foundation.Deferral
  // DualAPI
  // Implements: Windows.Foundation.IDeferral
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Foundation.IDeferralFactory"
  TDeferral = class(TWinRTGenericImportF<IDeferralFactory>)
  public
    // -> IDeferralFactory
    class function Create(handler: DeferralCompletedHandler): IDeferral; static; inline;
  end;

  // Windows.Foundation.WwwFormUrlDecoder
  // DualAPI
  // Implements: Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  // Implements: Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IWwwFormUrlDecoderEntry>
  // Factory: "Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory"
  TWwwFormUrlDecoder = class(TWinRTGenericImportF<IWwwFormUrlDecoderRuntimeClassFactory>)
  public
    // -> IWwwFormUrlDecoderRuntimeClassFactory
    class function CreateWwwFormUrlDecoder(query: HSTRING): IWwwFormUrlDecoderRuntimeClass; static; inline;
  end;

  // Windows.Foundation.Uri
  // DualAPI
  // Implements: Windows.Foundation.IUriRuntimeClass
  // Implements: Windows.Foundation.IUriRuntimeClassWithAbsoluteCanonicalUri
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Foundation.IUriEscapeStatics"
  // Factory: "Windows.Foundation.IUriRuntimeClassFactory"
  TUri = class(TWinRTGenericImportFS<IUriRuntimeClassFactory, IUriEscapeStatics>)
  public
    // -> IUriEscapeStatics
    class function UnescapeComponent(toUnescape: HSTRING): HSTRING; static; inline;
    class function EscapeComponent(toEscape: HSTRING): HSTRING; static; inline;

    // -> IUriRuntimeClassFactory
    class function CreateUri(uri: HSTRING): IUriRuntimeClass; static; inline;
    class function CreateWithRelativeUri(baseUri: HSTRING; relativeUri: HSTRING): IUriRuntimeClass; static; inline;
  end;

  // Windows.Foundation.WwwFormUrlDecoderEntry
  // DualAPI
  // Implements: Windows.Foundation.IWwwFormUrlDecoderEntry


implementation

  // Emit Classes Implementation
 { TPropertyValue }

class function TPropertyValue.CreateEmpty: IInspectable;
begin
  Result := Statics.CreateEmpty;
end;

class function TPropertyValue.CreateUInt8(value: Byte): IInspectable;
begin
  Result := Statics.CreateUInt8(value);
end;

class function TPropertyValue.CreateInt16(value: SmallInt): IInspectable;
begin
  Result := Statics.CreateInt16(value);
end;

class function TPropertyValue.CreateUInt16(value: Word): IInspectable;
begin
  Result := Statics.CreateUInt16(value);
end;

class function TPropertyValue.CreateInt32(value: Integer): IInspectable;
begin
  Result := Statics.CreateInt32(value);
end;

class function TPropertyValue.CreateUInt32(value: Cardinal): IInspectable;
begin
  Result := Statics.CreateUInt32(value);
end;

class function TPropertyValue.CreateInt64(value: Int64): IInspectable;
begin
  Result := Statics.CreateInt64(value);
end;

class function TPropertyValue.CreateUInt64(value: UInt64): IInspectable;
begin
  Result := Statics.CreateUInt64(value);
end;

class function TPropertyValue.CreateSingle(value: Single): IInspectable;
begin
  Result := Statics.CreateSingle(value);
end;

class function TPropertyValue.CreateDouble(value: Double): IInspectable;
begin
  Result := Statics.CreateDouble(value);
end;

class function TPropertyValue.CreateChar16(value: Char): IInspectable;
begin
  Result := Statics.CreateChar16(value);
end;

class function TPropertyValue.CreateBoolean(value: Boolean): IInspectable;
begin
  Result := Statics.CreateBoolean(value);
end;

class function TPropertyValue.CreateString(value: HSTRING): IInspectable;
begin
  Result := Statics.CreateString(value);
end;

class function TPropertyValue.CreateInspectable(value: IInspectable): IInspectable;
begin
  Result := Statics.CreateInspectable(value);
end;

class function TPropertyValue.CreateGuid(value: TGuid): IInspectable;
begin
  Result := Statics.CreateGuid(value);
end;

class function TPropertyValue.CreateDateTime(value: DateTime): IInspectable;
begin
  Result := Statics.CreateDateTime(value);
end;

class function TPropertyValue.CreateTimeSpan(value: TimeSpan): IInspectable;
begin
  Result := Statics.CreateTimeSpan(value);
end;

class function TPropertyValue.CreatePoint(value: TPointF): IInspectable;
begin
  Result := Statics.CreatePoint(value);
end;

class function TPropertyValue.CreateSize(value: TSizeF): IInspectable;
begin
  Result := Statics.CreateSize(value);
end;

class function TPropertyValue.CreateRect(value: TRectF): IInspectable;
begin
  Result := Statics.CreateRect(value);
end;

class function TPropertyValue.CreateUInt8Array(valueSize: Cardinal; value: PByte): IInspectable;
begin
  Result := Statics.CreateUInt8Array(valueSize, value);
end;

class function TPropertyValue.CreateInt16Array(valueSize: Cardinal; value: PSmallInt): IInspectable;
begin
  Result := Statics.CreateInt16Array(valueSize, value);
end;

class function TPropertyValue.CreateUInt16Array(valueSize: Cardinal; value: PWord): IInspectable;
begin
  Result := Statics.CreateUInt16Array(valueSize, value);
end;

class function TPropertyValue.CreateInt32Array(valueSize: Cardinal; value: PInteger): IInspectable;
begin
  Result := Statics.CreateInt32Array(valueSize, value);
end;

class function TPropertyValue.CreateUInt32Array(valueSize: Cardinal; value: PCardinal): IInspectable;
begin
  Result := Statics.CreateUInt32Array(valueSize, value);
end;

class function TPropertyValue.CreateInt64Array(valueSize: Cardinal; value: PInt64): IInspectable;
begin
  Result := Statics.CreateInt64Array(valueSize, value);
end;

class function TPropertyValue.CreateUInt64Array(valueSize: Cardinal; value: PUInt64): IInspectable;
begin
  Result := Statics.CreateUInt64Array(valueSize, value);
end;

class function TPropertyValue.CreateSingleArray(valueSize: Cardinal; value: PSingle): IInspectable;
begin
  Result := Statics.CreateSingleArray(valueSize, value);
end;

class function TPropertyValue.CreateDoubleArray(valueSize: Cardinal; value: PDouble): IInspectable;
begin
  Result := Statics.CreateDoubleArray(valueSize, value);
end;

class function TPropertyValue.CreateChar16Array(valueSize: Cardinal; value: PChar): IInspectable;
begin
  Result := Statics.CreateChar16Array(valueSize, value);
end;

class function TPropertyValue.CreateBooleanArray(valueSize: Cardinal; value: PBoolean): IInspectable;
begin
  Result := Statics.CreateBooleanArray(valueSize, value);
end;

class function TPropertyValue.CreateStringArray(valueSize: Cardinal; value: PHSTRING): IInspectable;
begin
  Result := Statics.CreateStringArray(valueSize, value);
end;

class function TPropertyValue.CreateInspectableArray(valueSize: Cardinal; value: PIInspectable): IInspectable;
begin
  Result := Statics.CreateInspectableArray(valueSize, value);
end;

class function TPropertyValue.CreateGuidArray(valueSize: Cardinal; value: PGuid): IInspectable;
begin
  Result := Statics.CreateGuidArray(valueSize, value);
end;

class function TPropertyValue.CreateDateTimeArray(valueSize: Cardinal; value: PDateTime): IInspectable;
begin
  Result := Statics.CreateDateTimeArray(valueSize, value);
end;

class function TPropertyValue.CreateTimeSpanArray(valueSize: Cardinal; value: PTimeSpan): IInspectable;
begin
  Result := Statics.CreateTimeSpanArray(valueSize, value);
end;

class function TPropertyValue.CreatePointArray(valueSize: Cardinal; value: PPointF): IInspectable;
begin
  Result := Statics.CreatePointArray(valueSize, value);
end;

class function TPropertyValue.CreateSizeArray(valueSize: Cardinal; value: PSizeF): IInspectable;
begin
  Result := Statics.CreateSizeArray(valueSize, value);
end;

class function TPropertyValue.CreateRectArray(valueSize: Cardinal; value: PRectF): IInspectable;
begin
  Result := Statics.CreateRectArray(valueSize, value);
end;


 { TDeferral }
// Factories for : "Deferral"
// Factory: "Windows.Foundation.IDeferralFactory"
// -> IDeferralFactory

class function TDeferral.Create(handler: DeferralCompletedHandler): IDeferral;
begin
  Result := Factory.Create(handler);
end;


 { TWwwFormUrlDecoder }
// Factories for : "WwwFormUrlDecoder"
// Factory: "Windows.Foundation.IWwwFormUrlDecoderRuntimeClassFactory"
// -> IWwwFormUrlDecoderRuntimeClassFactory

class function TWwwFormUrlDecoder.CreateWwwFormUrlDecoder(query: HSTRING): IWwwFormUrlDecoderRuntimeClass;
begin
  Result := Factory.CreateWwwFormUrlDecoder(query);
end;


 { TUri }

class function TUri.UnescapeComponent(toUnescape: HSTRING): HSTRING;
begin
  Result := Statics.UnescapeComponent(toUnescape);
end;

class function TUri.EscapeComponent(toEscape: HSTRING): HSTRING;
begin
  Result := Statics.EscapeComponent(toEscape);
end;

// Factories for : "Uri"
// Factory: "Windows.Foundation.IUriRuntimeClassFactory"
// -> IUriRuntimeClassFactory

class function TUri.CreateUri(uri: HSTRING): IUriRuntimeClass;
begin
  Result := Factory.CreateUri(uri);
end;

class function TUri.CreateWithRelativeUri(baseUri: HSTRING; relativeUri: HSTRING): IUriRuntimeClass;
begin
  Result := Factory.CreateWithRelativeUri(baseUri, relativeUri);
end;



end.
