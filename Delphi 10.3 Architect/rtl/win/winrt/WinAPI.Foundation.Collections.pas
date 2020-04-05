{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Foundation.Collections;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.SystemRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces

  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Foundation.Collections Interfaces

  // Emit Forwarded classes
  // Windows.Foundation.Collections.PropertySet
  // DualAPI
  // Implements: Windows.Foundation.Collections.IPropertySet
  // Implements: Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  // Instantiable: "IPropertySet"
  TPropertySet = class(TWinRTGenericImportI<IPropertySet>) end;

  // Windows.Foundation.Collections.ValueSet
  // DualAPI
  // Implements: Windows.Foundation.Collections.IPropertySet
  // Implements: Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  // Instantiable: "IPropertySet"
  TValueSet = class(TWinRTGenericImportI<IPropertySet>) end;

  // Windows.Foundation.Collections.StringMap
  // DualAPI
  // Implements: Windows.Foundation.Collections.IMap`2<String,String>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  // Implements: Windows.Foundation.Collections.IObservableMap`2<String,String>
  // Instantiable: "IMap_2__HSTRING__HSTRING"
  TStringMap = class(TWinRTGenericImportI<IMap_2__HSTRING__HSTRING>) end;


implementation

  // Emit Classes Implementation
 { TPropertySet }

 { TValueSet }

 { TStringMap }


end.
