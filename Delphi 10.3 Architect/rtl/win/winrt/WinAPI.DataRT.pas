{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.DataRT;

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
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.TextSegment>
  IIterator_1__Text_TextSegment = interface;
  PIIterator_1__Text_TextSegment = ^IIterator_1__Text_TextSegment;

  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.TextSegment>
  IIterable_1__Text_TextSegment = interface;
  PIIterable_1__Text_TextSegment = ^IIterable_1__Text_TextSegment;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>
  IVectorView_1__Text_TextSegment = interface;
  PIVectorView_1__Text_TextSegment = ^IVectorView_1__Text_TextSegment;

  // Windows.Data.Json.IJsonObject
  Json_IJsonObject = interface;
  PJson_IJsonObject = ^Json_IJsonObject;

  // Windows.Data.Json.IJsonArray
  Json_IJsonArray = interface;
  PJson_IJsonArray = ^Json_IJsonArray;

  // Windows.Data.Json.IJsonValue
  Json_IJsonValue = interface;
  PJson_IJsonValue = ^Json_IJsonValue;

  // Windows.Data.Json.IJsonValueStatics
  Json_IJsonValueStatics = interface;
  PJson_IJsonValueStatics = ^Json_IJsonValueStatics;

  // Windows.Data.Json.IJsonValueStatics2
  Json_IJsonValueStatics2 = interface;
  PJson_IJsonValueStatics2 = ^Json_IJsonValueStatics2;

  // Windows.Data.Json.IJsonObjectWithDefaultValues
  Json_IJsonObjectWithDefaultValues = interface;
  PJson_IJsonObjectWithDefaultValues = ^Json_IJsonObjectWithDefaultValues;

  // Windows.Data.Json.IJsonObjectStatics
  Json_IJsonObjectStatics = interface;
  PJson_IJsonObjectStatics = ^Json_IJsonObjectStatics;

  // Windows.Data.Json.IJsonArrayStatics
  Json_IJsonArrayStatics = interface;
  PJson_IJsonArrayStatics = ^Json_IJsonArrayStatics;

  // Windows.Data.Json.IJsonErrorStatics2
  Json_IJsonErrorStatics2 = interface;
  PJson_IJsonErrorStatics2 = ^Json_IJsonErrorStatics2;

  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Xml.Dom.IXmlNode>
  IIterator_1__Xml_Dom_IXmlNode = interface;
  PIIterator_1__Xml_Dom_IXmlNode = ^IIterator_1__Xml_Dom_IXmlNode;

  // Windows.Data.Xml.Dom.IXmlNodeSelector
  Xml_Dom_IXmlNodeSelector = interface;
  PXml_Dom_IXmlNodeSelector = ^Xml_Dom_IXmlNodeSelector;

  // Windows.Data.Xml.Dom.IXmlNodeSerializer
  Xml_Dom_IXmlNodeSerializer = interface;
  PXml_Dom_IXmlNodeSerializer = ^Xml_Dom_IXmlNodeSerializer;

  // Windows.Data.Xml.Dom.IXmlLoadSettings
  Xml_Dom_IXmlLoadSettings = interface;
  PXml_Dom_IXmlLoadSettings = ^Xml_Dom_IXmlLoadSettings;

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

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Data.Xml.Dom.IXmlDocumentIO
  Xml_Dom_IXmlDocumentIO = interface;
  PXml_Dom_IXmlDocumentIO = ^Xml_Dom_IXmlDocumentIO;

  // Windows.Data.Xml.Dom.IXmlDocumentIO2
  Xml_Dom_IXmlDocumentIO2 = interface;
  PXml_Dom_IXmlDocumentIO2 = ^Xml_Dom_IXmlDocumentIO2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Data.Xml.Dom.IXmlDocument>
  AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument = interface;
  PAsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument = ^AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument;

  // Windows.Foundation.IAsyncOperation`1<Windows.Data.Xml.Dom.IXmlDocument>
  IAsyncOperation_1__Xml_Dom_IXmlDocument = interface;
  PIAsyncOperation_1__Xml_Dom_IXmlDocument = ^IAsyncOperation_1__Xml_Dom_IXmlDocument;

  // Windows.Data.Xml.Dom.IXmlDocumentStatics
  Xml_Dom_IXmlDocumentStatics = interface;
  PXml_Dom_IXmlDocumentStatics = ^Xml_Dom_IXmlDocumentStatics;

  // Windows.Data.Text.IUnicodeCharactersStatics
  Text_IUnicodeCharactersStatics = interface;
  PText_IUnicodeCharactersStatics = ^Text_IUnicodeCharactersStatics;

  // Windows.Data.Text.IAlternateWordForm
  Text_IAlternateWordForm = interface;
  PText_IAlternateWordForm = ^Text_IAlternateWordForm;

  // Windows.Data.Text.ISelectableWordSegment
  Text_ISelectableWordSegment = interface;
  PText_ISelectableWordSegment = ^Text_ISelectableWordSegment;

  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IAlternateWordForm>
  IIterator_1__Text_IAlternateWordForm = interface;
  PIIterator_1__Text_IAlternateWordForm = ^IIterator_1__Text_IAlternateWordForm;

  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IAlternateWordForm>
  IIterable_1__Text_IAlternateWordForm = interface;
  PIIterable_1__Text_IAlternateWordForm = ^IIterable_1__Text_IAlternateWordForm;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.IAlternateWordForm>
  IVectorView_1__Text_IAlternateWordForm = interface;
  PIVectorView_1__Text_IAlternateWordForm = ^IVectorView_1__Text_IAlternateWordForm;

  // Windows.Data.Text.IWordSegment
  Text_IWordSegment = interface;
  PText_IWordSegment = ^Text_IWordSegment;

  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IWordSegment>
  IIterator_1__Text_IWordSegment = interface;
  PIIterator_1__Text_IWordSegment = ^IIterator_1__Text_IWordSegment;

  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IWordSegment>
  IIterable_1__Text_IWordSegment = interface;
  PIIterable_1__Text_IWordSegment = ^IIterable_1__Text_IWordSegment;

  // Windows.Data.Text.WordSegmentsTokenizingHandler
  Text_WordSegmentsTokenizingHandler = interface;
  PText_WordSegmentsTokenizingHandler = ^Text_WordSegmentsTokenizingHandler;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.IWordSegment>
  IVectorView_1__Text_IWordSegment = interface;
  PIVectorView_1__Text_IWordSegment = ^IVectorView_1__Text_IWordSegment;

  // Windows.Data.Text.IWordsSegmenter
  Text_IWordsSegmenter = interface;
  PText_IWordsSegmenter = ^Text_IWordsSegmenter;

  // Windows.Data.Text.IWordsSegmenterFactory
  Text_IWordsSegmenterFactory = interface;
  PText_IWordsSegmenterFactory = ^Text_IWordsSegmenterFactory;

  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ISelectableWordSegment>
  IIterator_1__Text_ISelectableWordSegment = interface;
  PIIterator_1__Text_ISelectableWordSegment = ^IIterator_1__Text_ISelectableWordSegment;

  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ISelectableWordSegment>
  IIterable_1__Text_ISelectableWordSegment = interface;
  PIIterable_1__Text_ISelectableWordSegment = ^IIterable_1__Text_ISelectableWordSegment;

  // Windows.Data.Text.SelectableWordSegmentsTokenizingHandler
  Text_SelectableWordSegmentsTokenizingHandler = interface;
  PText_SelectableWordSegmentsTokenizingHandler = ^Text_SelectableWordSegmentsTokenizingHandler;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ISelectableWordSegment>
  IVectorView_1__Text_ISelectableWordSegment = interface;
  PIVectorView_1__Text_ISelectableWordSegment = ^IVectorView_1__Text_ISelectableWordSegment;

  // Windows.Data.Text.ISelectableWordsSegmenter
  Text_ISelectableWordsSegmenter = interface;
  PText_ISelectableWordsSegmenter = ^Text_ISelectableWordsSegmenter;

  // Windows.Data.Text.ISelectableWordsSegmenterFactory
  Text_ISelectableWordsSegmenterFactory = interface;
  PText_ISelectableWordsSegmenterFactory = ^Text_ISelectableWordsSegmenterFactory;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = ^AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING = interface;
  PIAsyncOperation_1__IVectorView_1__HSTRING = ^IAsyncOperation_1__IVectorView_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Data.Text.ITextPhoneme
  Text_ITextPhoneme = interface;
  PText_ITextPhoneme = ^Text_ITextPhoneme;

  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ITextPhoneme>
  IIterator_1__Text_ITextPhoneme = interface;
  PIIterator_1__Text_ITextPhoneme = ^IIterator_1__Text_ITextPhoneme;

  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ITextPhoneme>
  IIterable_1__Text_ITextPhoneme = interface;
  PIIterable_1__Text_ITextPhoneme = ^IIterable_1__Text_ITextPhoneme;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>
  IVectorView_1__Text_ITextPhoneme = interface;
  PIVectorView_1__Text_ITextPhoneme = ^IVectorView_1__Text_ITextPhoneme;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme = ^AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  IAsyncOperation_1__IVectorView_1__Text_ITextPhoneme = interface;
  PIAsyncOperation_1__IVectorView_1__Text_ITextPhoneme = ^IAsyncOperation_1__IVectorView_1__Text_ITextPhoneme;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = interface;
  PIKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = ^IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = ^IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = ^IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IMapView_2__HSTRING__IVectorView_1__Text_TextSegment = interface;
  PIMapView_2__HSTRING__IVectorView_1__Text_TextSegment = ^IMapView_2__HSTRING__IVectorView_1__Text_TextSegment;

  // Windows.Foundation.Collections.IMap`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IMap_2__HSTRING__IVectorView_1__Text_TextSegment = interface;
  PIMap_2__HSTRING__IVectorView_1__Text_TextSegment = ^IMap_2__HSTRING__IVectorView_1__Text_TextSegment;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Data Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.TextSegment>
  IIterator_1__Text_TextSegment_Base = interface(IInspectable)
  ['{645A39B4-F001-5272-9015-FB4A327179AE}']
  end;
  {
  // Used Types:  Windows.Data.Text.TextSegment
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.TextSegment>
  IIterator_1__Text_TextSegment = interface(IIterator_1__Text_TextSegment_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Text_TextSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PText_TextSegment): Cardinal; safecall;
    property Current: Text_TextSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.TextSegment>
  IIterable_1__Text_TextSegment_Base = interface(IInspectable)
  ['{5498F4F3-CEE4-5B72-9729-815C4AD7B9DC}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.TextSegment>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.TextSegment>
  IIterable_1__Text_TextSegment = interface(IIterable_1__Text_TextSegment_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Text_TextSegment; safecall;
  end;

  {
  // Used Types:  Windows.Data.Text.TextSegment
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>
  IVectorView_1__Text_TextSegment = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Text_TextSegment; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Text_TextSegment; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PText_TextSegment): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonValue
  // Used Types:  String
  // Used Types:  Windows.Data.Json.IJsonObject
  // Used Types:  Windows.Data.Json.IJsonArray
  // Used Types:  Double
  // Used Types:  Boolean
  }
  // Windows.Data.Json.IJsonObject
  [WinRTClassNameAttribute(SJson_JsonObject)]
  Json_IJsonObject = interface(IInspectable)
  ['{064E24DD-29C2-4F83-9AC1-9EE11578BEB3}']
    function GetNamedValue(name: HSTRING): Json_IJsonValue; safecall;
    procedure SetNamedValue(name: HSTRING; value: Json_IJsonValue); safecall;
    function GetNamedObject(name: HSTRING): Json_IJsonObject; safecall;
    function GetNamedArray(name: HSTRING): Json_IJsonArray; safecall;
    function GetNamedString(name: HSTRING): HSTRING; safecall;
    function GetNamedNumber(name: HSTRING): Double; safecall;
    function GetNamedBoolean(name: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonObject
  // Used Types:  UInt32
  // Used Types:  Windows.Data.Json.IJsonArray
  // Used Types:  String
  // Used Types:  Double
  // Used Types:  Boolean
  }
  // Windows.Data.Json.IJsonArray
  [WinRTClassNameAttribute(SJson_JsonArray)]
  Json_IJsonArray = interface(IInspectable)
  ['{08C1DDB6-0CBD-4A9A-B5D3-2F852DC37E81}']
    function GetObjectAt(index: Cardinal): Json_IJsonObject; safecall;
    function GetArrayAt(index: Cardinal): Json_IJsonArray; safecall;
    function GetStringAt(index: Cardinal): HSTRING; safecall;
    function GetNumberAt(index: Cardinal): Double; safecall;
    function GetBooleanAt(index: Cardinal): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.JsonValueType
  // Used Types:  String
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Data.Json.IJsonArray
  // Used Types:  Windows.Data.Json.IJsonObject
  }
  // Windows.Data.Json.IJsonValue
  [WinRTClassNameAttribute(SJson_JsonValue)]
  Json_IJsonValue = interface(IInspectable)
  ['{A3219ECB-F0B3-4DCD-BEEE-19D48CD3ED1E}']
    function get_ValueType: Json_JsonValueType; safecall;
    function Stringify: HSTRING; safecall;
    function GetString: HSTRING; safecall;
    function GetNumber: Double; safecall;
    function GetBoolean: Boolean; safecall;
    function GetArray: Json_IJsonArray; safecall;
    function GetObject: Json_IJsonObject; safecall;
    property ValueType: Json_JsonValueType read get_ValueType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonValue
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Double
  }
  // Windows.Data.Json.IJsonValueStatics
  [WinRTClassNameAttribute(SJson_JsonValue)]
  Json_IJsonValueStatics = interface(IInspectable)
  ['{5F6B544A-2F53-48E1-91A3-F78B50A6345C}']
    function Parse(input: HSTRING): Json_IJsonValue; safecall;
    function TryParse(input: HSTRING; out a_result: Json_IJsonValue): Boolean; safecall;
    function CreateBooleanValue(input: Boolean): Json_IJsonValue; safecall;
    function CreateNumberValue(input: Double): Json_IJsonValue; safecall;
    function CreateStringValue(input: HSTRING): Json_IJsonValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonValue
  }
  // Windows.Data.Json.IJsonValueStatics2
  [WinRTClassNameAttribute(SJson_JsonValue)]
  Json_IJsonValueStatics2 = interface(IInspectable)
  ['{1D9ECBE4-3FE8-4335-8392-93D8E36865F0}']
    function CreateNullValue: Json_IJsonValue; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonValue
  // Used Types:  String
  // Used Types:  Windows.Data.Json.IJsonObject
  // Used Types:  Windows.Data.Json.IJsonArray
  // Used Types:  Double
  // Used Types:  Boolean
  }
  // Windows.Data.Json.IJsonObjectWithDefaultValues
  Json_IJsonObjectWithDefaultValues = interface(IInspectable)
  ['{D960D2A2-B7F0-4F00-8E44-D82CF415EA13}']
    function GetNamedValue(name: HSTRING; defaultValue: Json_IJsonValue): Json_IJsonValue; safecall;
    function GetNamedObject(name: HSTRING; defaultValue: Json_IJsonObject): Json_IJsonObject; safecall;
    function GetNamedString(name: HSTRING; defaultValue: HSTRING): HSTRING; safecall;
    function GetNamedArray(name: HSTRING; defaultValue: Json_IJsonArray): Json_IJsonArray; safecall;
    function GetNamedNumber(name: HSTRING; defaultValue: Double): Double; safecall;
    function GetNamedBoolean(name: HSTRING; defaultValue: Boolean): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonObject
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Data.Json.IJsonObjectStatics
  [WinRTClassNameAttribute(SJson_JsonObject)]
  Json_IJsonObjectStatics = interface(IInspectable)
  ['{2289F159-54DE-45D8-ABCC-22603FA066A0}']
    function Parse(input: HSTRING): Json_IJsonObject; safecall;
    function TryParse(input: HSTRING; out a_result: Json_IJsonObject): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.IJsonArray
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Data.Json.IJsonArrayStatics
  [WinRTClassNameAttribute(SJson_JsonArray)]
  Json_IJsonArrayStatics = interface(IInspectable)
  ['{DB1434A9-E164-499F-93E2-8A8F49BB90BA}']
    function Parse(input: HSTRING): Json_IJsonArray; safecall;
    function TryParse(input: HSTRING; out a_result: Json_IJsonArray): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Json.JsonErrorStatus
  // Used Types:  Int32
  }
  // Windows.Data.Json.IJsonErrorStatics2
  [WinRTClassNameAttribute(SJson_JsonError)]
  Json_IJsonErrorStatics2 = interface(IInspectable)
  ['{404030DA-87D0-436C-83AB-FC7B12C0CC26}']
    function GetJsonStatus(hresult: Integer): Json_JsonErrorStatus; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Xml.Dom.IXmlNode>
  IIterator_1__Xml_Dom_IXmlNode_Base = interface(IInspectable)
  ['{3833A35E-2C61-56BD-B093-3694165F8898}']
  end;
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlNode
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Xml.Dom.IXmlNode>
  IIterator_1__Xml_Dom_IXmlNode = interface(IIterator_1__Xml_Dom_IXmlNode_Base)
  ['{3833A35E-2C61-56BD-B093-3694165F8898}']
    function get_Current: Xml_Dom_IXmlNode; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXml_Dom_IXmlNode): Cardinal; safecall;
    property Current: Xml_Dom_IXmlNode read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Xml.Dom.IXmlNode
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlNodeList
  // Used Types:  Object
  }
  // Windows.Data.Xml.Dom.IXmlNodeSelector
  Xml_Dom_IXmlNodeSelector = interface(IInspectable)
  ['{63DBBA8B-D0DB-4FE1-B745-F9433AFDC25B}']
    function SelectSingleNode(xpath: HSTRING): Xml_Dom_IXmlNode; safecall;
    function SelectNodes(xpath: HSTRING): Xml_Dom_IXmlNodeList; safecall;
    function SelectSingleNodeNS(xpath: HSTRING; namespaces: IInspectable): Xml_Dom_IXmlNode; safecall;
    function SelectNodesNS(xpath: HSTRING; namespaces: IInspectable): Xml_Dom_IXmlNodeList; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Data.Xml.Dom.IXmlNodeSerializer
  Xml_Dom_IXmlNodeSerializer = interface(IInspectable)
  ['{5CC5B382-E6DD-4991-ABEF-06D8D2E7BD0C}']
    function GetXml: HSTRING; safecall;
    function get_InnerText: HSTRING; safecall;
    procedure put_InnerText(value: HSTRING); safecall;
    property InnerText: HSTRING read get_InnerText write put_InnerText;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Data.Xml.Dom.IXmlLoadSettings
  Xml_Dom_IXmlLoadSettings = interface(IInspectable)
  ['{58AA07A8-FED6-46F7-B4C5-FB1BA72108D6}']
    function get_MaxElementDepth: Cardinal; safecall;
    procedure put_MaxElementDepth(value: Cardinal); safecall;
    function get_ProhibitDtd: Boolean; safecall;
    procedure put_ProhibitDtd(value: Boolean); safecall;
    function get_ResolveExternals: Boolean; safecall;
    procedure put_ResolveExternals(value: Boolean); safecall;
    function get_ValidateOnParse: Boolean; safecall;
    procedure put_ValidateOnParse(value: Boolean); safecall;
    function get_ElementContentWhiteSpace: Boolean; safecall;
    procedure put_ElementContentWhiteSpace(value: Boolean); safecall;
    property ElementContentWhiteSpace: Boolean read get_ElementContentWhiteSpace write put_ElementContentWhiteSpace;
    property MaxElementDepth: Cardinal read get_MaxElementDepth write put_MaxElementDepth;
    property ProhibitDtd: Boolean read get_ProhibitDtd write put_ProhibitDtd;
    property ResolveExternals: Boolean read get_ResolveExternals write put_ResolveExternals;
    property ValidateOnParse: Boolean read get_ValidateOnParse write put_ValidateOnParse;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Data.Xml.Dom.IXmlLoadSettings
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Data.Xml.Dom.IXmlDocumentIO
  Xml_Dom_IXmlDocumentIO = interface(IInspectable)
  ['{6CD0E74E-EE65-4489-9EBF-CA43E87BA637}']
    procedure LoadXml(xml: HSTRING); overload; safecall;
    procedure LoadXml(xml: HSTRING; loadSettings: Xml_Dom_IXmlLoadSettings); overload; safecall;
    function SaveToFileAsync(&file: IStorageFile): IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Data.Xml.Dom.IXmlLoadSettings
  }
  // Windows.Data.Xml.Dom.IXmlDocumentIO2
  Xml_Dom_IXmlDocumentIO2 = interface(IInspectable)
  ['{5D034661-7BD8-4AD5-9EBF-81E6347263B1}']
    procedure LoadXmlFromBuffer(buffer: IBuffer); overload; safecall;
    procedure LoadXmlFromBuffer(buffer: IBuffer; loadSettings: Xml_Dom_IXmlLoadSettings); overload; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Data.Xml.Dom.IXmlDocument>
  AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument_Delegate_Base = interface(IUnknown)
  ['{5EEF7817-93DD-5C0B-9E5A-EB490408F3A9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Data.Xml.Dom.IXmlDocument>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Data.Xml.Dom.IXmlDocument>
  AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument = interface(AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument_Delegate_Base)
  ['{4D733BCA-331A-59A6-8361-D703C963C6D1}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Xml_Dom_IXmlDocument; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Data.Xml.Dom.IXmlDocument>
  IAsyncOperation_1__Xml_Dom_IXmlDocument_Base = interface(IInspectable)
  ['{F858E239-1896-5982-8495-143168478EB8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Data.Xml.Dom.IXmlDocument>
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Data.Xml.Dom.IXmlDocument>
  IAsyncOperation_1__Xml_Dom_IXmlDocument = interface(IAsyncOperation_1__Xml_Dom_IXmlDocument_Base)
  ['{CA3E8F7C-BBE4-5C32-B42F-CBA0C469E42C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument; safecall;
    function GetResults: Xml_Dom_IXmlDocument; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Xml_Dom_IXmlDocument read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Data.Xml.Dom.IXmlDocument>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Data.Xml.Dom.IXmlLoadSettings
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Data.Xml.Dom.IXmlDocumentStatics
  [WinRTClassNameAttribute(SXml_Dom_XmlDocument)]
  Xml_Dom_IXmlDocumentStatics = interface(IInspectable)
  ['{5543D254-D757-4B79-9539-232B18F50BF1}']
    function LoadFromUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; safecall;
    function LoadFromUriAsync(uri: IUriRuntimeClass; loadSettings: Xml_Dom_IXmlLoadSettings): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; safecall;
    function LoadFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; safecall;
    function LoadFromFileAsync(&file: IStorageFile; loadSettings: Xml_Dom_IXmlLoadSettings): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Char
  // Used Types:  Boolean
  // Used Types:  Windows.Data.Text.UnicodeNumericType
  // Used Types:  Windows.Data.Text.UnicodeGeneralCategory
  }
  // Windows.Data.Text.IUnicodeCharactersStatics
  [WinRTClassNameAttribute(SText_UnicodeCharacters)]
  Text_IUnicodeCharactersStatics = interface(IInspectable)
  ['{97909E87-9291-4F91-B6C8-B6E359D7A7FB}']
    function GetCodepointFromSurrogatePair(highSurrogate: Cardinal; lowSurrogate: Cardinal): Cardinal; safecall;
    procedure GetSurrogatePairFromCodepoint(codepoint: Cardinal; out highSurrogate: Char; out lowSurrogate: Char); safecall;
    function IsHighSurrogate(codepoint: Cardinal): Boolean; safecall;
    function IsLowSurrogate(codepoint: Cardinal): Boolean; safecall;
    function IsSupplementary(codepoint: Cardinal): Boolean; safecall;
    function IsNoncharacter(codepoint: Cardinal): Boolean; safecall;
    function IsWhitespace(codepoint: Cardinal): Boolean; safecall;
    function IsAlphabetic(codepoint: Cardinal): Boolean; safecall;
    function IsCased(codepoint: Cardinal): Boolean; safecall;
    function IsUppercase(codepoint: Cardinal): Boolean; safecall;
    function IsLowercase(codepoint: Cardinal): Boolean; safecall;
    function IsIdStart(codepoint: Cardinal): Boolean; safecall;
    function IsIdContinue(codepoint: Cardinal): Boolean; safecall;
    function IsGraphemeBase(codepoint: Cardinal): Boolean; safecall;
    function IsGraphemeExtend(codepoint: Cardinal): Boolean; safecall;
    function GetNumericType(codepoint: Cardinal): Text_UnicodeNumericType; safecall;
    function GetGeneralCategory(codepoint: Cardinal): Text_UnicodeGeneralCategory; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.TextSegment
  // Used Types:  String
  // Used Types:  Windows.Data.Text.AlternateNormalizationFormat
  }
  // Windows.Data.Text.IAlternateWordForm
  [WinRTClassNameAttribute(SText_AlternateWordForm)]
  Text_IAlternateWordForm = interface(IInspectable)
  ['{47396C1E-51B9-4207-9146-248E636A1D1D}']
    function get_SourceTextSegment: Text_TextSegment; safecall;
    function get_AlternateText: HSTRING; safecall;
    function get_NormalizationFormat: Text_AlternateNormalizationFormat; safecall;
    property AlternateText: HSTRING read get_AlternateText;
    property NormalizationFormat: Text_AlternateNormalizationFormat read get_NormalizationFormat;
    property SourceTextSegment: Text_TextSegment read get_SourceTextSegment;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Data.Text.TextSegment
  }
  // Windows.Data.Text.ISelectableWordSegment
  [WinRTClassNameAttribute(SText_SelectableWordSegment)]
  Text_ISelectableWordSegment = interface(IInspectable)
  ['{916A4CB7-8AA7-4C78-B374-5DEDB752E60B}']
    function get_Text: HSTRING; safecall;
    function get_SourceTextSegment: Text_TextSegment; safecall;
    property SourceTextSegment: Text_TextSegment read get_SourceTextSegment;
    property Text: HSTRING read get_Text;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IAlternateWordForm>
  IIterator_1__Text_IAlternateWordForm_Base = interface(IInspectable)
  ['{7F463F8A-E08F-516E-B4B8-81B5417BFB58}']
  end;
  {
  // Used Types:  Windows.Data.Text.IAlternateWordForm
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IAlternateWordForm>
  IIterator_1__Text_IAlternateWordForm = interface(IIterator_1__Text_IAlternateWordForm_Base)
  ['{0D806514-0F6A-5579-BC4C-BF0B91C511E2}']
    function get_Current: Text_IAlternateWordForm; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PText_IAlternateWordForm): Cardinal; safecall;
    property Current: Text_IAlternateWordForm read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IAlternateWordForm>
  IIterable_1__Text_IAlternateWordForm_Base = interface(IInspectable)
  ['{AE838C29-60C1-5093-AE61-0ED22857DB05}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IAlternateWordForm>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IAlternateWordForm>
  IIterable_1__Text_IAlternateWordForm = interface(IIterable_1__Text_IAlternateWordForm_Base)
  ['{3A8C90F6-6AAC-5697-8EF8-ECDB54D25DDF}']
    function First: IIterator_1__Text_IAlternateWordForm; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.IAlternateWordForm
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.IAlternateWordForm>
  IVectorView_1__Text_IAlternateWordForm = interface(IInspectable)
  ['{118A250E-A55C-5CF2-ABF9-0FAE89D20E85}']
    function GetAt(index: Cardinal): Text_IAlternateWordForm; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Text_IAlternateWordForm; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PText_IAlternateWordForm): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Data.Text.TextSegment
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.IAlternateWordForm>
  }
  // Windows.Data.Text.IWordSegment
  [WinRTClassNameAttribute(SText_WordSegment)]
  Text_IWordSegment = interface(IInspectable)
  ['{D2D4BA6D-987C-4CC0-B6BD-D49A11B38F9A}']
    function get_Text: HSTRING; safecall;
    function get_SourceTextSegment: Text_TextSegment; safecall;
    function get_AlternateForms: IVectorView_1__Text_IAlternateWordForm; safecall;
    property AlternateForms: IVectorView_1__Text_IAlternateWordForm read get_AlternateForms;
    property SourceTextSegment: Text_TextSegment read get_SourceTextSegment;
    property Text: HSTRING read get_Text;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IWordSegment>
  IIterator_1__Text_IWordSegment_Base = interface(IInspectable)
  ['{AEB846B3-664B-545E-AB93-F5FC66D24E32}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.IWordSegment
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IWordSegment>
  IIterator_1__Text_IWordSegment = interface(IIterator_1__Text_IWordSegment_Base)
  ['{5AE16A4D-93C9-57B6-8811-249A7E7C07A0}']
    function get_Current: Text_IWordSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PText_IWordSegment): Cardinal; safecall;
    property Current: Text_IWordSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IWordSegment>
  IIterable_1__Text_IWordSegment_Base = interface(IInspectable)
  ['{D14DC94A-A311-5DDC-BF8B-D58795D87D6D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.IWordSegment>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IWordSegment>
  IIterable_1__Text_IWordSegment = interface(IIterable_1__Text_IWordSegment_Base)
  ['{DE2D0496-8160-501B-825B-933D35601BA4}']
    function First: IIterator_1__Text_IWordSegment; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.IWordSegment>
  }
  // Windows.Data.Text.WordSegmentsTokenizingHandler
  Text_WordSegmentsTokenizingHandler = interface(IUnknown)
  ['{A5DD6357-BF2A-4C4F-A31F-29E71C6F8B35}']
    procedure Invoke(precedingWords: IIterable_1__Text_IWordSegment; words: IIterable_1__Text_IWordSegment); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.IWordSegment
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.IWordSegment>
  IVectorView_1__Text_IWordSegment = interface(IInspectable)
  ['{F931F534-BDA4-593C-97C1-072B3CDB05E9}']
    function GetAt(index: Cardinal): Text_IWordSegment; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Text_IWordSegment; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PText_IWordSegment): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Data.Text.IWordSegment
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.IWordSegment>
  // Used Types:  Windows.Data.Text.WordSegmentsTokenizingHandler
  }
  // Windows.Data.Text.IWordsSegmenter
  [WinRTClassNameAttribute(SText_WordsSegmenter)]
  Text_IWordsSegmenter = interface(IInspectable)
  ['{86B4D4D1-B2FE-4E34-A81D-66640300454F}']
    function get_ResolvedLanguage: HSTRING; safecall;
    function GetTokenAt(text: HSTRING; startIndex: Cardinal): Text_IWordSegment; safecall;
    function GetTokens(text: HSTRING): IVectorView_1__Text_IWordSegment; safecall;
    procedure Tokenize(text: HSTRING; startIndex: Cardinal; handler: Text_WordSegmentsTokenizingHandler); safecall;
    property ResolvedLanguage: HSTRING read get_ResolvedLanguage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.IWordsSegmenter
  // Used Types:  String
  }
  // Windows.Data.Text.IWordsSegmenterFactory
  [WinRTClassNameAttribute(SText_WordsSegmenter)]
  Text_IWordsSegmenterFactory = interface(IInspectable)
  ['{E6977274-FC35-455C-8BFB-6D7F4653CA97}']
    function CreateWithLanguage(language: HSTRING): Text_IWordsSegmenter; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ISelectableWordSegment>
  IIterator_1__Text_ISelectableWordSegment_Base = interface(IInspectable)
  ['{A5842459-147D-5A88-8F23-A3398AFD8A85}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.ISelectableWordSegment
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ISelectableWordSegment>
  IIterator_1__Text_ISelectableWordSegment = interface(IIterator_1__Text_ISelectableWordSegment_Base)
  ['{C0E508BB-A33E-5D60-B630-6F92DF91252C}']
    function get_Current: Text_ISelectableWordSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PText_ISelectableWordSegment): Cardinal; safecall;
    property Current: Text_ISelectableWordSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ISelectableWordSegment>
  IIterable_1__Text_ISelectableWordSegment_Base = interface(IInspectable)
  ['{784B0CEC-1348-5334-91E5-2E013294E211}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ISelectableWordSegment>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ISelectableWordSegment>
  IIterable_1__Text_ISelectableWordSegment = interface(IIterable_1__Text_ISelectableWordSegment_Base)
  ['{01806953-9F16-574D-B498-A026DCA5D767}']
    function First: IIterator_1__Text_ISelectableWordSegment; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ISelectableWordSegment>
  }
  // Windows.Data.Text.SelectableWordSegmentsTokenizingHandler
  Text_SelectableWordSegmentsTokenizingHandler = interface(IUnknown)
  ['{3A3DFC9C-AEDE-4DC7-9E6C-41C044BD3592}']
    procedure Invoke(precedingWords: IIterable_1__Text_ISelectableWordSegment; words: IIterable_1__Text_ISelectableWordSegment); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.ISelectableWordSegment
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ISelectableWordSegment>
  IVectorView_1__Text_ISelectableWordSegment = interface(IInspectable)
  ['{08BCD90D-CDB2-5FE6-B17D-8675BDF1482A}']
    function GetAt(index: Cardinal): Text_ISelectableWordSegment; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Text_ISelectableWordSegment; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PText_ISelectableWordSegment): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Data.Text.ISelectableWordSegment
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ISelectableWordSegment>
  // Used Types:  Windows.Data.Text.SelectableWordSegmentsTokenizingHandler
  }
  // Windows.Data.Text.ISelectableWordsSegmenter
  [WinRTClassNameAttribute(SText_SelectableWordsSegmenter)]
  Text_ISelectableWordsSegmenter = interface(IInspectable)
  ['{F6DC31E7-4B13-45C5-8897-7D71269E085D}']
    function get_ResolvedLanguage: HSTRING; safecall;
    function GetTokenAt(text: HSTRING; startIndex: Cardinal): Text_ISelectableWordSegment; safecall;
    function GetTokens(text: HSTRING): IVectorView_1__Text_ISelectableWordSegment; safecall;
    procedure Tokenize(text: HSTRING; startIndex: Cardinal; handler: Text_SelectableWordSegmentsTokenizingHandler); safecall;
    property ResolvedLanguage: HSTRING read get_ResolvedLanguage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Data.Text.ISelectableWordsSegmenter
  // Used Types:  String
  }
  // Windows.Data.Text.ISelectableWordsSegmenterFactory
  [WinRTClassNameAttribute(SText_SelectableWordsSegmenter)]
  Text_ISelectableWordsSegmenterFactory = interface(IInspectable)
  ['{8C7A7648-6057-4339-BC70-F210010A4150}']
    function CreateWithLanguage(language: HSTRING): Text_ISelectableWordsSegmenter; safecall;
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
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = interface(IUnknown)
  ['{7C7899BE-5F2E-5BF3-ADE5-AD98B772C7CD}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F92B529-119B-575A-A419-3904B4E41AF2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING; safecall;
    function GetResults: IVectorView_1__HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING read get_Completed write put_Completed;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Data.Text.ITextPhoneme
  [WinRTClassNameAttribute(SText_TextPhoneme)]
  Text_ITextPhoneme = interface(IInspectable)
  ['{9362A40A-9B7A-4569-94CF-D84F2F38CF9B}']
    function get_DisplayText: HSTRING; safecall;
    function get_ReadingText: HSTRING; safecall;
    property DisplayText: HSTRING read get_DisplayText;
    property ReadingText: HSTRING read get_ReadingText;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ITextPhoneme>
  IIterator_1__Text_ITextPhoneme_Base = interface(IInspectable)
  ['{36426C36-B5C4-5D1B-A468-AFF3B48B7C3A}']
  end;
  {
  // Used Types:  Windows.Data.Text.ITextPhoneme
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ITextPhoneme>
  IIterator_1__Text_ITextPhoneme = interface(IIterator_1__Text_ITextPhoneme_Base)
  ['{4E72A6A6-1069-50AB-AD0F-DEB9E7EBDC16}']
    function get_Current: Text_ITextPhoneme; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PText_ITextPhoneme): Cardinal; safecall;
    property Current: Text_ITextPhoneme read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ITextPhoneme>
  IIterable_1__Text_ITextPhoneme_Base = interface(IInspectable)
  ['{2017F561-8162-55F8-B056-656636935815}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Data.Text.ITextPhoneme>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Data.Text.ITextPhoneme>
  IIterable_1__Text_ITextPhoneme = interface(IIterable_1__Text_ITextPhoneme_Base)
  ['{D7DA1415-771F-5C33-A51C-AB3E83E49D5F}']
    function First: IIterator_1__Text_ITextPhoneme; safecall;
  end;

  {
  // Used Types:  Windows.Data.Text.ITextPhoneme
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>
  IVectorView_1__Text_ITextPhoneme = interface(IInspectable)
  ['{999FAB8C-F583-571B-A856-DAC177FC85F9}']
    function GetAt(index: Cardinal): Text_ITextPhoneme; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Text_ITextPhoneme; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PText_ITextPhoneme): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme_Delegate_Base = interface(IUnknown)
  ['{83E14307-0BE1-5560-8BFC-291095CF6D30}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme_Delegate_Base)
  ['{B7D8CB4A-CFD5-568B-ACF3-EC639BE99911}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Text_ITextPhoneme; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  IAsyncOperation_1__IVectorView_1__Text_ITextPhoneme_Base = interface(IInspectable)
  ['{6BC3019D-DD10-5510-B164-808C232B7D64}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.ITextPhoneme>>
  IAsyncOperation_1__IVectorView_1__Text_ITextPhoneme = interface(IAsyncOperation_1__IVectorView_1__Text_ITextPhoneme_Base)
  ['{C4BE9346-FA66-564C-98C0-725092640F4F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme; safecall;
    function GetResults: IVectorView_1__Text_ITextPhoneme; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Text_ITextPhoneme read get_Completed write put_Completed;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = interface(IInspectable)
  ['{55F778D6-F408-5E83-84AA-7E359540639A}']
    function get_Key: HSTRING; safecall;
    function get_Value: IVectorView_1__Text_TextSegment; safecall;
    property Key: HSTRING read get_Key;
    property Value: IVectorView_1__Text_TextSegment read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment_Base = interface(IInspectable)
  ['{00078AA3-8676-5F06-ADF5-FFE5D661D670}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = interface(IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment_Base)
  ['{87CF56D8-0231-5FC8-8E9D-E06E7237F991}']
    function get_Current: IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment_Base = interface(IInspectable)
  ['{F819A276-B3F5-54D4-B8FD-C9ADB7F700E3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment = interface(IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment_Base)
  ['{09FC0D28-9CF3-5562-8129-3EE9B34BB332}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__Text_TextSegment; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IMapView_2__HSTRING__IVectorView_1__Text_TextSegment_Base = interface(IInspectable)
  ['{91D443D6-3777-5102-B0BC-3D4183A26FF9}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IMapView_2__HSTRING__IVectorView_1__Text_TextSegment = interface(IMapView_2__HSTRING__IVectorView_1__Text_TextSegment_Base)
  ['{61C67A85-7658-508B-A585-D9DEFFED6302}']
    function Lookup(key: HSTRING): IVectorView_1__Text_TextSegment; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IVectorView_1__Text_TextSegment; out second: IMapView_2__HSTRING__IVectorView_1__Text_TextSegment); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  }
  // Windows.Foundation.Collections.IMap`2<String,Windows.Foundation.Collections.IVectorView`1<Windows.Data.Text.TextSegment>>
  IMap_2__HSTRING__IVectorView_1__Text_TextSegment = interface(IInspectable)
  ['{DD54B51A-FF01-544B-9FA7-A6213845628C}']
    function Lookup(key: HSTRING): IVectorView_1__Text_TextSegment; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IVectorView_1__Text_TextSegment; safecall;
    function Insert(key: HSTRING; value: IVectorView_1__Text_TextSegment): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;


  // Emit Forwarded classes
  // Windows.Data.Json.JsonArray
  // DualAPI
  // Implements: Windows.Data.Json.IJsonArray
  // Implements: Windows.Data.Json.IJsonValue
  // Implements: Windows.Foundation.Collections.IVector`1<Windows.Data.Json.IJsonValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Data.Json.IJsonValue>
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Data.Json.IJsonArrayStatics"
  // Instantiable: "Json_IJsonArray"
  TJson_JsonArray = class(TWinRTGenericImportSI<Json_IJsonArrayStatics, Json_IJsonArray>)
  public
    // -> Json_IJsonArrayStatics
    class function Parse(input: HSTRING): Json_IJsonArray; static; inline;
    class function TryParse(input: HSTRING; out a_result: Json_IJsonArray): Boolean; static; inline;
  end;

  // Windows.Data.Json.JsonObject
  // DualAPI
  // Implements: Windows.Data.Json.IJsonObject
  // Implements: Windows.Data.Json.IJsonValue
  // Implements: Windows.Foundation.Collections.IMap`2<String,Windows.Data.Json.IJsonValue>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Data.Json.IJsonValue>>
  // Implements: Windows.Data.Json.IJsonObjectWithDefaultValues
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Data.Json.IJsonObjectStatics"
  // Instantiable: "Json_IJsonObject"
  TJson_JsonObject = class(TWinRTGenericImportSI<Json_IJsonObjectStatics, Json_IJsonObject>)
  public
    // -> Json_IJsonObjectStatics
    class function Parse(input: HSTRING): Json_IJsonObject; static; inline;
    class function TryParse(input: HSTRING; out a_result: Json_IJsonObject): Boolean; static; inline;
  end;

  // Windows.Data.Json.JsonValue
  // DualAPI
  // Implements: Windows.Data.Json.IJsonValue
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Data.Json.IJsonValueStatics2"
  // Statics: "Windows.Data.Json.IJsonValueStatics"
  TJson_JsonValue = class(TWinRTGenericImportS2<Json_IJsonValueStatics, Json_IJsonValueStatics2>)
  public
    // -> Json_IJsonValueStatics2
    class function CreateNullValue: Json_IJsonValue; static; inline;

    // -> Json_IJsonValueStatics
    class function Parse(input: HSTRING): Json_IJsonValue; static; inline;
    class function TryParse(input: HSTRING; out a_result: Json_IJsonValue): Boolean; static; inline;
    class function CreateBooleanValue(input: Boolean): Json_IJsonValue; static; inline;
    class function CreateNumberValue(input: Double): Json_IJsonValue; static; inline;
    class function CreateStringValue(input: HSTRING): Json_IJsonValue; static; inline;
  end;

  // Windows.Data.Json.JsonError
  // DualAPI
  // Statics: "Windows.Data.Json.IJsonErrorStatics2"
  TJson_JsonError = class(TWinRTGenericImportS<Json_IJsonErrorStatics2>)
  public
    // -> Json_IJsonErrorStatics2
    class function GetJsonStatus(hresult: Integer): Json_JsonErrorStatus; static; inline;
  end;

  // Windows.Data.Xml.Dom.XmlDocument
  // WinRT Only
  // WhiteListed
  // Implements: Windows.Data.Xml.Dom.IXmlDocument
  // Implements: Windows.Data.Xml.Dom.IXmlNode
  // Implements: Windows.Data.Xml.Dom.IXmlNodeSerializer
  // Implements: Windows.Data.Xml.Dom.IXmlNodeSelector
  // Implements: Windows.Data.Xml.Dom.IXmlDocumentIO
  // Implements: Windows.Data.Xml.Dom.IXmlDocumentIO2
  // Statics: "Windows.Data.Xml.Dom.IXmlDocumentStatics"
  // Instantiable: "Xml_Dom_IXmlDocument"
  TXml_Dom_XmlDocument = class(TWinRTGenericImportSI<Xml_Dom_IXmlDocumentStatics, Xml_Dom_IXmlDocument>)
  public
    // -> Xml_Dom_IXmlDocumentStatics
    class function LoadFromUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; static; inline;
    class function LoadFromUriAsync(uri: IUriRuntimeClass; loadSettings: Xml_Dom_IXmlLoadSettings): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; static; inline;
    class function LoadFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; static; inline;
    class function LoadFromFileAsync(&file: IStorageFile; loadSettings: Xml_Dom_IXmlLoadSettings): IAsyncOperation_1__Xml_Dom_IXmlDocument; overload; static; inline;
  end;

  // Windows.Data.Text.UnicodeCharacters
  // DualAPI
  // Statics: "Windows.Data.Text.IUnicodeCharactersStatics"
  TText_UnicodeCharacters = class(TWinRTGenericImportS<Text_IUnicodeCharactersStatics>)
  public
    // -> Text_IUnicodeCharactersStatics
    class function GetCodepointFromSurrogatePair(highSurrogate: Cardinal; lowSurrogate: Cardinal): Cardinal; static; inline;
    class procedure GetSurrogatePairFromCodepoint(codepoint: Cardinal; out highSurrogate: Char; out lowSurrogate: Char); static; inline;
    class function IsHighSurrogate(codepoint: Cardinal): Boolean; static; inline;
    class function IsLowSurrogate(codepoint: Cardinal): Boolean; static; inline;
    class function IsSupplementary(codepoint: Cardinal): Boolean; static; inline;
    class function IsNoncharacter(codepoint: Cardinal): Boolean; static; inline;
    class function IsWhitespace(codepoint: Cardinal): Boolean; static; inline;
    class function IsAlphabetic(codepoint: Cardinal): Boolean; static; inline;
    class function IsCased(codepoint: Cardinal): Boolean; static; inline;
    class function IsUppercase(codepoint: Cardinal): Boolean; static; inline;
    class function IsLowercase(codepoint: Cardinal): Boolean; static; inline;
    class function IsIdStart(codepoint: Cardinal): Boolean; static; inline;
    class function IsIdContinue(codepoint: Cardinal): Boolean; static; inline;
    class function IsGraphemeBase(codepoint: Cardinal): Boolean; static; inline;
    class function IsGraphemeExtend(codepoint: Cardinal): Boolean; static; inline;
    class function GetNumericType(codepoint: Cardinal): Text_UnicodeNumericType; static; inline;
    class function GetGeneralCategory(codepoint: Cardinal): Text_UnicodeGeneralCategory; static; inline;
  end;

  // Windows.Data.Text.AlternateWordForm
  // DualAPI
  // Implements: Windows.Data.Text.IAlternateWordForm

  // Windows.Data.Text.WordSegment
  // DualAPI
  // Implements: Windows.Data.Text.IWordSegment

  // Windows.Data.Text.WordsSegmenter
  // DualAPI
  // Implements: Windows.Data.Text.IWordsSegmenter
  // Factory: "Windows.Data.Text.IWordsSegmenterFactory"
  TText_WordsSegmenter = class(TWinRTGenericImportF<Text_IWordsSegmenterFactory>)
  public
    // -> Text_IWordsSegmenterFactory
    class function CreateWithLanguage(language: HSTRING): Text_IWordsSegmenter; static; inline;
  end;

  // Windows.Data.Text.SelectableWordSegment
  // DualAPI
  // Implements: Windows.Data.Text.ISelectableWordSegment

  // Windows.Data.Text.SelectableWordsSegmenter
  // DualAPI
  // Implements: Windows.Data.Text.ISelectableWordsSegmenter
  // Factory: "Windows.Data.Text.ISelectableWordsSegmenterFactory"
  TText_SelectableWordsSegmenter = class(TWinRTGenericImportF<Text_ISelectableWordsSegmenterFactory>)
  public
    // -> Text_ISelectableWordsSegmenterFactory
    class function CreateWithLanguage(language: HSTRING): Text_ISelectableWordsSegmenter; static; inline;
  end;

  // Windows.Data.Text.TextPhoneme
  // DualAPI
  // Implements: Windows.Data.Text.ITextPhoneme


implementation

  // Emit Classes Implementation
 { TJson_JsonArray }

class function TJson_JsonArray.Parse(input: HSTRING): Json_IJsonArray;
begin
  Result := Statics.Parse(input);
end;

class function TJson_JsonArray.TryParse(input: HSTRING; out a_result: Json_IJsonArray): Boolean;
begin
  Result := Statics.TryParse(input, a_result);
end;


 { TJson_JsonObject }

class function TJson_JsonObject.Parse(input: HSTRING): Json_IJsonObject;
begin
  Result := Statics.Parse(input);
end;

class function TJson_JsonObject.TryParse(input: HSTRING; out a_result: Json_IJsonObject): Boolean;
begin
  Result := Statics.TryParse(input, a_result);
end;


 { TJson_JsonValue }

class function TJson_JsonValue.Parse(input: HSTRING): Json_IJsonValue;
begin
  Result := Statics.Parse(input);
end;

class function TJson_JsonValue.TryParse(input: HSTRING; out a_result: Json_IJsonValue): Boolean;
begin
  Result := Statics.TryParse(input, a_result);
end;

class function TJson_JsonValue.CreateBooleanValue(input: Boolean): Json_IJsonValue;
begin
  Result := Statics.CreateBooleanValue(input);
end;

class function TJson_JsonValue.CreateNumberValue(input: Double): Json_IJsonValue;
begin
  Result := Statics.CreateNumberValue(input);
end;

class function TJson_JsonValue.CreateStringValue(input: HSTRING): Json_IJsonValue;
begin
  Result := Statics.CreateStringValue(input);
end;


class function TJson_JsonValue.CreateNullValue: Json_IJsonValue;
begin
  Result := Statics2.CreateNullValue;
end;


 { TJson_JsonError }

class function TJson_JsonError.GetJsonStatus(hresult: Integer): Json_JsonErrorStatus;
begin
  Result := Statics.GetJsonStatus(hresult);
end;


 { TXml_Dom_XmlDocument }

class function TXml_Dom_XmlDocument.LoadFromUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__Xml_Dom_IXmlDocument;
begin
  Result := Statics.LoadFromUriAsync(uri);
end;

class function TXml_Dom_XmlDocument.LoadFromUriAsync(uri: IUriRuntimeClass; loadSettings: Xml_Dom_IXmlLoadSettings): IAsyncOperation_1__Xml_Dom_IXmlDocument;
begin
  Result := Statics.LoadFromUriAsync(uri, loadSettings);
end;

class function TXml_Dom_XmlDocument.LoadFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Xml_Dom_IXmlDocument;
begin
  Result := Statics.LoadFromFileAsync(&file);
end;

class function TXml_Dom_XmlDocument.LoadFromFileAsync(&file: IStorageFile; loadSettings: Xml_Dom_IXmlLoadSettings): IAsyncOperation_1__Xml_Dom_IXmlDocument;
begin
  Result := Statics.LoadFromFileAsync(&file, loadSettings);
end;


 { TText_UnicodeCharacters }

class function TText_UnicodeCharacters.GetCodepointFromSurrogatePair(highSurrogate: Cardinal; lowSurrogate: Cardinal): Cardinal;
begin
  Result := Statics.GetCodepointFromSurrogatePair(highSurrogate, lowSurrogate);
end;

class procedure TText_UnicodeCharacters.GetSurrogatePairFromCodepoint(codepoint: Cardinal; out highSurrogate: Char; out lowSurrogate: Char);
begin
  Statics.GetSurrogatePairFromCodepoint(codepoint, highSurrogate, lowSurrogate);
end;

class function TText_UnicodeCharacters.IsHighSurrogate(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsHighSurrogate(codepoint);
end;

class function TText_UnicodeCharacters.IsLowSurrogate(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsLowSurrogate(codepoint);
end;

class function TText_UnicodeCharacters.IsSupplementary(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsSupplementary(codepoint);
end;

class function TText_UnicodeCharacters.IsNoncharacter(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsNoncharacter(codepoint);
end;

class function TText_UnicodeCharacters.IsWhitespace(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsWhitespace(codepoint);
end;

class function TText_UnicodeCharacters.IsAlphabetic(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsAlphabetic(codepoint);
end;

class function TText_UnicodeCharacters.IsCased(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsCased(codepoint);
end;

class function TText_UnicodeCharacters.IsUppercase(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsUppercase(codepoint);
end;

class function TText_UnicodeCharacters.IsLowercase(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsLowercase(codepoint);
end;

class function TText_UnicodeCharacters.IsIdStart(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsIdStart(codepoint);
end;

class function TText_UnicodeCharacters.IsIdContinue(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsIdContinue(codepoint);
end;

class function TText_UnicodeCharacters.IsGraphemeBase(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsGraphemeBase(codepoint);
end;

class function TText_UnicodeCharacters.IsGraphemeExtend(codepoint: Cardinal): Boolean;
begin
  Result := Statics.IsGraphemeExtend(codepoint);
end;

class function TText_UnicodeCharacters.GetNumericType(codepoint: Cardinal): Text_UnicodeNumericType;
begin
  Result := Statics.GetNumericType(codepoint);
end;

class function TText_UnicodeCharacters.GetGeneralCategory(codepoint: Cardinal): Text_UnicodeGeneralCategory;
begin
  Result := Statics.GetGeneralCategory(codepoint);
end;


 { TText_WordsSegmenter }
// Factories for : "Text_WordsSegmenter"
// Factory: "Windows.Data.Text.IWordsSegmenterFactory"
// -> Text_IWordsSegmenterFactory

class function TText_WordsSegmenter.CreateWithLanguage(language: HSTRING): Text_IWordsSegmenter;
begin
  Result := Factory.CreateWithLanguage(language);
end;


 { TText_SelectableWordsSegmenter }
// Factories for : "Text_SelectableWordsSegmenter"
// Factory: "Windows.Data.Text.ISelectableWordsSegmenterFactory"
// -> Text_ISelectableWordsSegmenterFactory

class function TText_SelectableWordsSegmenter.CreateWithLanguage(language: HSTRING): Text_ISelectableWordsSegmenter;
begin
  Result := Factory.CreateWithLanguage(language);
end;



end.
