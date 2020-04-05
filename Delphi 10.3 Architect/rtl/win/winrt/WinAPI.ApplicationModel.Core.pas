{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.ApplicationModel.Core;

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
  // Windows.ApplicationModel.Core.IAppListEntry
  IAppListEntry = interface;
  PIAppListEntry = ^IAppListEntry;

  // Windows.ApplicationModel.Core.IAppListEntry2
  IAppListEntry2 = interface;
  PIAppListEntry2 = ^IAppListEntry2;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.IAppListEntry>
  IIterator_1__IAppListEntry = interface;
  PIIterator_1__IAppListEntry = ^IIterator_1__IAppListEntry;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Core.IAppListEntry>
  IIterable_1__IAppListEntry = interface;
  PIIterable_1__IAppListEntry = ^IIterable_1__IAppListEntry;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>
  IVectorView_1__IAppListEntry = interface;
  PIVectorView_1__IAppListEntry = ^IVectorView_1__IAppListEntry;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry = ^AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  IAsyncOperation_1__IVectorView_1__IAppListEntry = interface;
  PIAsyncOperation_1__IVectorView_1__IAppListEntry = ^IAsyncOperation_1__IVectorView_1__IAppListEntry;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  AsyncOperationCompletedHandler_1__AppRestartFailureReason = interface;
  PAsyncOperationCompletedHandler_1__AppRestartFailureReason = ^AsyncOperationCompletedHandler_1__AppRestartFailureReason;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  IAsyncOperation_1__AppRestartFailureReason = interface;
  PIAsyncOperation_1__AppRestartFailureReason = ^IAsyncOperation_1__AppRestartFailureReason;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IIterator_1__ICoreApplicationView = interface;
  PIIterator_1__ICoreApplicationView = ^IIterator_1__ICoreApplicationView;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IIterable_1__ICoreApplicationView = interface;
  PIIterable_1__ICoreApplicationView = ^IIterable_1__ICoreApplicationView;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IVectorView_1__ICoreApplicationView = interface;
  PIVectorView_1__ICoreApplicationView = ^IVectorView_1__ICoreApplicationView;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.ApplicationModel.Core Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IAppDisplayInfo
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  }
  // Windows.ApplicationModel.Core.IAppListEntry
  [WinRTClassNameAttribute(SAppListEntry)]
  IAppListEntry = interface(IInspectable)
  ['{EF00F07F-2108-490A-877A-8A9F17C25FAD}']
    function get_DisplayInfo: IAppDisplayInfo; safecall;
    function LaunchAsync: IAsyncOperation_1__Boolean; safecall;
    property DisplayInfo: IAppDisplayInfo read get_DisplayInfo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.Core.IAppListEntry2
  IAppListEntry2 = interface(IInspectable)
  ['{D0A618AD-BF35-42AC-AC06-86EEEB41D04B}']
    function get_AppUserModelId: HSTRING; safecall;
    property AppUserModelId: HSTRING read get_AppUserModelId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.IAppListEntry>
  IIterator_1__IAppListEntry_Base = interface(IInspectable)
  ['{B93E2028-50BC-599E-B3D9-427B61D26C01}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Core.IAppListEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.IAppListEntry>
  IIterator_1__IAppListEntry = interface(IIterator_1__IAppListEntry_Base)
  ['{1E94D34D-7C77-50D7-B65A-CA24954EBAFA}']
    function get_Current: IAppListEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIAppListEntry): Cardinal; safecall;
    property Current: IAppListEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Core.IAppListEntry>
  IIterable_1__IAppListEntry_Base = interface(IInspectable)
  ['{86F4D4EF-D8FD-5FB5-807C-72DA8FC9E544}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.IAppListEntry>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Core.IAppListEntry>
  IIterable_1__IAppListEntry = interface(IIterable_1__IAppListEntry_Base)
  ['{3B58FDB7-ED7D-5B1D-8996-ADED30E93DF9}']
    function First: IIterator_1__IAppListEntry; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Core.IAppListEntry
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>
  IVectorView_1__IAppListEntry = interface(IInspectable)
  ['{1D8ACCFE-BA75-591F-AF1E-2ACDA21D85C1}']
    function GetAt(index: Cardinal): IAppListEntry; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IAppListEntry; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppListEntry): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry_Delegate_Base = interface(IUnknown)
  ['{51C74372-9452-57CE-9270-762009FBFE4D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry_Delegate_Base)
  ['{4CB461E4-D1B6-5C09-98B4-583C5EE8ACED}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IAppListEntry; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  IAsyncOperation_1__IVectorView_1__IAppListEntry_Base = interface(IInspectable)
  ['{D3BCF8A0-3538-5DAE-98D7-1F2AB88C3F01}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  IAsyncOperation_1__IVectorView_1__IAppListEntry = interface(IAsyncOperation_1__IVectorView_1__IAppListEntry_Base)
  ['{A320E67B-2293-546B-B9FE-E80AB59BA643}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry; safecall;
    function GetResults: IVectorView_1__IAppListEntry; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IAppListEntry read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  AsyncOperationCompletedHandler_1__AppRestartFailureReason_Delegate_Base = interface(IUnknown)
  ['{DCEC478A-9F27-5C5D-AFDB-C91AEE4F1F02}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  AsyncOperationCompletedHandler_1__AppRestartFailureReason = interface(AsyncOperationCompletedHandler_1__AppRestartFailureReason_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__AppRestartFailureReason; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  IAsyncOperation_1__AppRestartFailureReason_Base = interface(IInspectable)
  ['{0938905D-54C0-572F-8451-4BFD2B52EDDA}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  // Used Types:  Windows.ApplicationModel.Core.AppRestartFailureReason
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Core.AppRestartFailureReason>
  IAsyncOperation_1__AppRestartFailureReason = interface(IAsyncOperation_1__AppRestartFailureReason_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__AppRestartFailureReason); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__AppRestartFailureReason; safecall;
    function GetResults: AppRestartFailureReason; safecall;
    property Completed: AsyncOperationCompletedHandler_1__AppRestartFailureReason read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IIterator_1__ICoreApplicationView_Base = interface(IInspectable)
  ['{4F5F6944-264B-5868-809E-C7AC1AC5EDAD}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Core.ICoreApplicationView
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IIterator_1__ICoreApplicationView = interface(IIterator_1__ICoreApplicationView_Base)
  ['{A5D1343F-43AF-53F8-9698-10E77D4C9094}']
    function get_Current: ICoreApplicationView; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PICoreApplicationView): Cardinal; safecall;
    property Current: ICoreApplicationView read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IIterable_1__ICoreApplicationView_Base = interface(IInspectable)
  ['{32BC12D1-2653-5A41-A55E-88A12AF2026A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IIterable_1__ICoreApplicationView = interface(IIterable_1__ICoreApplicationView_Base)
  ['{E250C2A8-1628-5D13-9822-344A1D9B7765}']
    function First: IIterator_1__ICoreApplicationView; safecall;
  end;

  {
  // Used Types:  Windows.ApplicationModel.Core.ICoreApplicationView
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.ICoreApplicationView>
  IVectorView_1__ICoreApplicationView = interface(IInspectable)
  ['{9B43BA8B-9015-5462-9982-C81F5183FC31}']
    function GetAt(index: Cardinal): ICoreApplicationView; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ICoreApplicationView; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PICoreApplicationView): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;


  // Emit Forwarded classes
  // Windows.ApplicationModel.Core.AppListEntry
  // DualAPI
  // Implements: Windows.ApplicationModel.Core.IAppListEntry
  // Implements: Windows.ApplicationModel.Core.IAppListEntry2


implementation

  // Emit Classes Implementation

end.
