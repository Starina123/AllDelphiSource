{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.ServicesRT.Store;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreImage>
  IIterator_1__IStoreImage = interface;
  PIIterator_1__IStoreImage = ^IIterator_1__IStoreImage;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreImage>
  IIterable_1__IStoreImage = interface;
  PIIterable_1__IStoreImage = ^IIterable_1__IStoreImage;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreVideo>
  IIterator_1__IStoreVideo = interface;
  PIIterator_1__IStoreVideo = ^IIterator_1__IStoreVideo;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreVideo>
  IIterable_1__IStoreVideo = interface;
  PIIterable_1__IStoreVideo = ^IIterable_1__IStoreVideo;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreAvailability>
  IIterator_1__IStoreAvailability = interface;
  PIIterator_1__IStoreAvailability = ^IIterator_1__IStoreAvailability;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreAvailability>
  IIterable_1__IStoreAvailability = interface;
  PIIterable_1__IStoreAvailability = ^IIterable_1__IStoreAvailability;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreSku>
  IIterator_1__IStoreSku = interface;
  PIIterator_1__IStoreSku = ^IIterator_1__IStoreSku;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreSku>
  IIterable_1__IStoreSku = interface;
  PIIterable_1__IStoreSku = ^IIterable_1__IStoreSku;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>
  IKeyValuePair_2__HSTRING__IStoreProduct = interface;
  PIKeyValuePair_2__HSTRING__IStoreProduct = ^IKeyValuePair_2__HSTRING__IStoreProduct;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct = ^IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct = ^IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>
  IKeyValuePair_2__HSTRING__IStoreLicense = interface;
  PIKeyValuePair_2__HSTRING__IStoreLicense = ^IKeyValuePair_2__HSTRING__IStoreLicense;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  IIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense = ^IIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  IIterable_1__IKeyValuePair_2__HSTRING__IStoreLicense = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IStoreLicense = ^IIterable_1__IKeyValuePair_2__HSTRING__IStoreLicense;

  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.StorePackageUpdateStatus>
  IIterator_1__StorePackageUpdateStatus = interface;
  PIIterator_1__StorePackageUpdateStatus = ^IIterator_1__StorePackageUpdateStatus;

  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.StorePackageUpdateStatus>
  IIterable_1__StorePackageUpdateStatus = interface;
  PIIterable_1__StorePackageUpdateStatus = ^IIterable_1__StorePackageUpdateStatus;

  // Windows.Services.Store.IStoreContextStatics
  IStoreContextStatics = interface;
  PIStoreContextStatics = ^IStoreContextStatics;

  // Windows.Services.Store.IStoreContext2
  IStoreContext2 = interface;
  PIStoreContext2 = ^IStoreContext2;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Services.Store Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreImage>
  IIterator_1__IStoreImage_Base = interface(IInspectable)
  ['{FBE076F6-C3D2-5DF7-839F-012AC0F951C5}']
  end;
  {
  // Used Types:  Windows.Services.Store.IStoreImage
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreImage>
  IIterator_1__IStoreImage = interface(IIterator_1__IStoreImage_Base)
  ['{C172A6FB-2505-5706-BCB1-9D75E14AC85C}']
    function get_Current: IStoreImage; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStoreImage): Cardinal; safecall;
    property Current: IStoreImage read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreImage>
  IIterable_1__IStoreImage_Base = interface(IInspectable)
  ['{B2DA6DE8-AD55-56CE-8754-2C96F4FE1C2E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreImage>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreImage>
  IIterable_1__IStoreImage = interface(IIterable_1__IStoreImage_Base)
  ['{01D22578-8616-5728-A0FF-7E486F3A9C4D}']
    function First: IIterator_1__IStoreImage; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreVideo>
  IIterator_1__IStoreVideo_Base = interface(IInspectable)
  ['{91B0B554-A537-5E22-B39F-6A935D0BEF45}']
  end;
  {
  // Used Types:  Windows.Services.Store.IStoreVideo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreVideo>
  IIterator_1__IStoreVideo = interface(IIterator_1__IStoreVideo_Base)
  ['{8AAEEAB6-7651-5658-8601-6553F357697F}']
    function get_Current: IStoreVideo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStoreVideo): Cardinal; safecall;
    property Current: IStoreVideo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreVideo>
  IIterable_1__IStoreVideo_Base = interface(IInspectable)
  ['{46BE61E4-7173-565E-AED5-4A2152F1CE69}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreVideo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreVideo>
  IIterable_1__IStoreVideo = interface(IIterable_1__IStoreVideo_Base)
  ['{9D74B863-34A8-5D61-8782-4F2AB3528D08}']
    function First: IIterator_1__IStoreVideo; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreAvailability>
  IIterator_1__IStoreAvailability_Base = interface(IInspectable)
  ['{50511CCB-089E-5B73-BB4A-4D1EF77B8F0F}']
  end;
  {
  // Used Types:  Windows.Services.Store.IStoreAvailability
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreAvailability>
  IIterator_1__IStoreAvailability = interface(IIterator_1__IStoreAvailability_Base)
  ['{381E2DFF-80C3-5CC8-AD28-2C0F87720026}']
    function get_Current: IStoreAvailability; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStoreAvailability): Cardinal; safecall;
    property Current: IStoreAvailability read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreAvailability>
  IIterable_1__IStoreAvailability_Base = interface(IInspectable)
  ['{C58DE1A0-25DE-578B-BB69-E0A26D67B203}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreAvailability>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreAvailability>
  IIterable_1__IStoreAvailability = interface(IIterable_1__IStoreAvailability_Base)
  ['{9EA2B48F-FF9D-5850-876D-CEE55741FA56}']
    function First: IIterator_1__IStoreAvailability; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreSku>
  IIterator_1__IStoreSku_Base = interface(IInspectable)
  ['{365CDE92-7FE3-59D5-B8F8-8F05ACF50947}']
  end;
  {
  // Used Types:  Windows.Services.Store.IStoreSku
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreSku>
  IIterator_1__IStoreSku = interface(IIterator_1__IStoreSku_Base)
  ['{85F25C19-9E41-5A04-8324-E7B0F04595F0}']
    function get_Current: IStoreSku; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStoreSku): Cardinal; safecall;
    property Current: IStoreSku read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreSku>
  IIterable_1__IStoreSku_Base = interface(IInspectable)
  ['{522D34EF-4B5A-5B44-A046-7A16051D011E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStoreSku>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStoreSku>
  IIterable_1__IStoreSku = interface(IIterable_1__IStoreSku_Base)
  ['{0A9BDF4A-25BF-5C9C-A798-121849885E96}']
    function First: IIterator_1__IStoreSku; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Services.Store.IStoreProduct
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>
  IKeyValuePair_2__HSTRING__IStoreProduct = interface(IInspectable)
  ['{7649AE79-029E-51E4-AE99-7E3AB8D9EC53}']
    function get_Key: HSTRING; safecall;
    function get_Value: IStoreProduct; safecall;
    property Key: HSTRING read get_Key;
    property Value: IStoreProduct read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct_Base = interface(IInspectable)
  ['{0EDB142C-9D04-532B-81E9-4C84AB09B34B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct = interface(IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct_Base)
  ['{9EDA8AB5-7E61-5DF9-9D15-E8AED01A7EB6}']
    function get_Current: IKeyValuePair_2__HSTRING__IStoreProduct; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IStoreProduct): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IStoreProduct read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct_Base = interface(IInspectable)
  ['{78A33722-ABFB-57C0-853F-5616A3AB8D57}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreProduct>>
  IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct = interface(IIterable_1__IKeyValuePair_2__HSTRING__IStoreProduct_Base)
  ['{F0188E6C-4198-535A-9600-DF68157D5718}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IStoreProduct; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Services.Store.IStoreLicense
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>
  IKeyValuePair_2__HSTRING__IStoreLicense = interface(IInspectable)
  ['{CEB25B50-83EF-5774-B16E-4BB96C6E4C65}']
    function get_Key: HSTRING; safecall;
    function get_Value: IStoreLicense; safecall;
    property Key: HSTRING read get_Key;
    property Value: IStoreLicense read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  IIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense_Base = interface(IInspectable)
  ['{A1509348-6522-5062-AE86-CF595475926D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  IIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense = interface(IIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense_Base)
  ['{204D492F-1E5B-50CD-AF8A-CEADCE5B568D}']
    function get_Current: IKeyValuePair_2__HSTRING__IStoreLicense; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IStoreLicense): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IStoreLicense read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  IIterable_1__IKeyValuePair_2__HSTRING__IStoreLicense_Base = interface(IInspectable)
  ['{CA8BA445-6F4D-5DA9-95EE-42CF118DEF63}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Services.Store.IStoreLicense>>
  IIterable_1__IKeyValuePair_2__HSTRING__IStoreLicense = interface(IIterable_1__IKeyValuePair_2__HSTRING__IStoreLicense_Base)
  ['{2641BCF5-1955-560D-9665-96894F3EB16C}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IStoreLicense; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.StorePackageUpdateStatus>
  IIterator_1__StorePackageUpdateStatus_Base = interface(IInspectable)
  ['{6181D84F-F731-57B8-9A6B-8A12FCD58D04}']
  end;
  {
  // Used Types:  Windows.Services.Store.StorePackageUpdateStatus
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.StorePackageUpdateStatus>
  IIterator_1__StorePackageUpdateStatus = interface(IIterator_1__StorePackageUpdateStatus_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: StorePackageUpdateStatus; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PStorePackageUpdateStatus): Cardinal; safecall;
    property Current: StorePackageUpdateStatus read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.StorePackageUpdateStatus>
  IIterable_1__StorePackageUpdateStatus_Base = interface(IInspectable)
  ['{60832223-7EB4-5CD7-8340-F5077173D364}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.StorePackageUpdateStatus>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.StorePackageUpdateStatus>
  IIterable_1__StorePackageUpdateStatus = interface(IIterable_1__StorePackageUpdateStatus_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__StorePackageUpdateStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Services.Store.IStoreContext
  // Used Types:  Windows.System.IUser
  }
  // Windows.Services.Store.IStoreContextStatics
  [WinRTClassNameAttribute(SStoreContext)]
  IStoreContextStatics = interface(IInspectable)
  ['{9C06EE5F-15C0-4E72-9330-D6191CEBD19C}']
    function GetDefault: IStoreContext; safecall;
    function GetForUser(user: IUser): IStoreContext; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductResult>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.Services.Store.IStoreContext2
  IStoreContext2 = interface(IInspectable)
  ['{18BC54DA-7BD9-452C-9116-3BBD06FFC63A}']
    function FindStoreProductForPackageAsync(productKinds: IIterable_1__HSTRING; package: IPackage): IAsyncOperation_1__IStoreProductResult; safecall;
  end;


  // Emit Forwarded classes
  // Windows.Services.Store.StoreContext
  // WinRT Only
  // WhiteListed
  // Implements: Windows.Services.Store.IStoreContext
  // Implements: Windows.Services.Store.IStoreContext2
  // Statics: "Windows.Services.Store.IStoreContextStatics"
  TStoreContext = class(TWinRTGenericImportS<IStoreContextStatics>)
  public
    // -> IStoreContextStatics
    class function GetDefault: IStoreContext; static; inline;
    class function GetForUser(user: IUser): IStoreContext; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TStoreContext }

class function TStoreContext.GetDefault: IStoreContext;
begin
  Result := Statics.GetDefault;
end;

class function TStoreContext.GetForUser(user: IUser): IStoreContext;
begin
  Result := Statics.GetForUser(user);
end;



end.
