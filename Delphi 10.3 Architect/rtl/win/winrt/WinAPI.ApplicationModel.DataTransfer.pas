{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.ApplicationModel.DataTransfer;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Security, 
  Winapi.GraphicsRT, 
  Winapi.Foundation, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // MANUAL EDITS to workaround build problems (FIXME)
  IDataProviderRequest = Winapi.CommonTypes.IDataProviderRequest;
  DataProviderHandler = Winapi.CommonTypes.DataProviderHandler;
  // END OF MANUAL EDITS


  // Forward declare interfaces
  // Windows.ApplicationModel.DataTransfer.IStandardDataFormatsStatics
  IStandardDataFormatsStatics = interface;
  PIStandardDataFormatsStatics = ^IStandardDataFormatsStatics;

  // Windows.ApplicationModel.DataTransfer.IStandardDataFormatsStatics2
  IStandardDataFormatsStatics2 = interface;
  PIStandardDataFormatsStatics2 = ^IStandardDataFormatsStatics2;

  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView2
  IDataPackagePropertySetView2 = interface;
  PIDataPackagePropertySetView2 = ^IDataPackagePropertySetView2;

  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView3
  IDataPackagePropertySetView3 = interface;
  PIDataPackagePropertySetView3 = ^IDataPackagePropertySetView3;

  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet2
  IDataPackagePropertySet2 = interface;
  PIDataPackagePropertySet2 = ^IDataPackagePropertySet2;

  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet3
  IDataPackagePropertySet3 = interface;
  PIDataPackagePropertySet3 = ^IDataPackagePropertySet3;

  // Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs2
  IOperationCompletedEventArgs2 = interface;
  PIOperationCompletedEventArgs2 = ^IOperationCompletedEventArgs2;

  // Windows.ApplicationModel.DataTransfer.IShareProvider
  IShareProvider = interface;
  PIShareProvider = ^IShareProvider;

  // Windows.ApplicationModel.DataTransfer.IShareTargetInfo
  IShareTargetInfo = interface;
  PIShareTargetInfo = ^IShareTargetInfo;

  // Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs
  IShareCompletedEventArgs = interface;
  PIShareCompletedEventArgs = ^IShareCompletedEventArgs;

  // Windows.ApplicationModel.DataTransfer.IDataPackageView2
  IDataPackageView2 = interface;
  PIDataPackageView2 = ^IDataPackageView2;

  // Windows.ApplicationModel.DataTransfer.IDataPackageView3
  IDataPackageView3 = interface;
  PIDataPackageView3 = ^IDataPackageView3;

  // Windows.ApplicationModel.DataTransfer.IDataPackageView4
  IDataPackageView4 = interface;
  PIDataPackageView4 = ^IDataPackageView4;

  // Windows.ApplicationModel.DataTransfer.IDataPackage2
  IDataPackage2 = interface;
  PIDataPackage2 = ^IDataPackage2;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs>
  TypedEventHandler_2__IDataPackage__IShareCompletedEventArgs = interface;
  PTypedEventHandler_2__IDataPackage__IShareCompletedEventArgs = ^TypedEventHandler_2__IDataPackage__IShareCompletedEventArgs;

  // Windows.ApplicationModel.DataTransfer.IDataPackage3
  IDataPackage3 = interface;
  PIDataPackage3 = ^IDataPackage3;

  // Windows.ApplicationModel.DataTransfer.IHtmlFormatHelperStatics
  IHtmlFormatHelperStatics = interface;
  PIHtmlFormatHelperStatics = ^IHtmlFormatHelperStatics;

  // Windows.ApplicationModel.DataTransfer.IClipboardStatics
  IClipboardStatics = interface;
  PIClipboardStatics = ^IClipboardStatics;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
  DragDrop_Core_ICoreDragInfo = interface;
  PDragDrop_Core_ICoreDragInfo = ^DragDrop_Core_ICoreDragInfo;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo2
  DragDrop_Core_ICoreDragInfo2 = interface;
  PDragDrop_Core_ICoreDragInfo2 = ^DragDrop_Core_ICoreDragInfo2;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride
  DragDrop_Core_ICoreDragUIOverride = interface;
  PDragDrop_Core_ICoreDragUIOverride = ^DragDrop_Core_ICoreDragUIOverride;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  AsyncOperationCompletedHandler_1__DataPackageOperation = interface;
  PAsyncOperationCompletedHandler_1__DataPackageOperation = ^AsyncOperationCompletedHandler_1__DataPackageOperation;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  IAsyncOperation_1__DataPackageOperation = interface;
  PIAsyncOperation_1__DataPackageOperation = ^IAsyncOperation_1__DataPackageOperation;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTarget
  DragDrop_Core_ICoreDropOperationTarget = interface;
  PDragDrop_Core_ICoreDropOperationTarget = ^DragDrop_Core_ICoreDropOperationTarget;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation
  DragDrop_Core_ICoreDragOperation = interface;
  PDragDrop_Core_ICoreDragOperation = ^DragDrop_Core_ICoreDragOperation;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation2
  DragDrop_Core_ICoreDragOperation2 = interface;
  PDragDrop_Core_ICoreDragOperation2 = ^DragDrop_Core_ICoreDragOperation2;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs
  DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs = interface;
  PDragDrop_Core_ICoreDropOperationTargetRequestedEventArgs = ^DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager,Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs>
  TypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs = interface;
  PTypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs = ^TypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
  DragDrop_Core_ICoreDragDropManager = interface;
  PDragDrop_Core_ICoreDragDropManager = ^DragDrop_Core_ICoreDragDropManager;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManagerStatics
  DragDrop_Core_ICoreDragDropManagerStatics = interface;
  PDragDrop_Core_ICoreDragDropManagerStatics = ^DragDrop_Core_ICoreDragDropManagerStatics;

  // Windows.ApplicationModel.DataTransfer.IShareUIOptions
  IShareUIOptions = interface;
  PIShareUIOptions = ^IShareUIOptions;

  // Windows.ApplicationModel.DataTransfer.IDataRequestDeferral
  IDataRequestDeferral = interface;
  PIDataRequestDeferral = ^IDataRequestDeferral;

  // Windows.ApplicationModel.DataTransfer.IDataRequest
  IDataRequest = interface;
  PIDataRequest = ^IDataRequest;

  // Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs
  IDataRequestedEventArgs = interface;
  PIDataRequestedEventArgs = ^IDataRequestedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IIterator_1__IShareProvider = interface;
  PIIterator_1__IShareProvider = ^IIterator_1__IShareProvider;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IIterable_1__IShareProvider = interface;
  PIIterable_1__IShareProvider = ^IIterable_1__IShareProvider;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IVectorView_1__IShareProvider = interface;
  PIVectorView_1__IShareProvider = ^IVectorView_1__IShareProvider;

  // Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IVector_1__IShareProvider = interface;
  PIVector_1__IShareProvider = ^IVector_1__IShareProvider;

  // Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs
  IShareProvidersRequestedEventArgs = interface;
  PIShareProvidersRequestedEventArgs = ^IShareProvidersRequestedEventArgs;

  // Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs
  ITargetApplicationChosenEventArgs = interface;
  PITargetApplicationChosenEventArgs = ^ITargetApplicationChosenEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs>
  TypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs = interface;
  PTypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs = ^TypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs>
  TypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs = interface;
  PTypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs = ^TypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs;

  // Windows.ApplicationModel.DataTransfer.IDataTransferManager
  IDataTransferManager = interface;
  PIDataTransferManager = ^IDataTransferManager;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs>
  TypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs = interface;
  PTypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs = ^TypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs;

  // Windows.ApplicationModel.DataTransfer.IDataTransferManager2
  IDataTransferManager2 = interface;
  PIDataTransferManager2 = ^IDataTransferManager2;

  // Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics
  IDataTransferManagerStatics = interface;
  PIDataTransferManagerStatics = ^IDataTransferManagerStatics;

  // Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics2
  IDataTransferManagerStatics2 = interface;
  PIDataTransferManagerStatics2 = ^IDataTransferManagerStatics2;

  // Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics3
  IDataTransferManagerStatics3 = interface;
  PIDataTransferManagerStatics3 = ^IDataTransferManagerStatics3;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  AsyncOperationCompletedHandler_1__IDataPackage = interface;
  PAsyncOperationCompletedHandler_1__IDataPackage = ^AsyncOperationCompletedHandler_1__IDataPackage;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  IAsyncOperation_1__IDataPackage = interface;
  PIAsyncOperation_1__IDataPackage = ^IAsyncOperation_1__IDataPackage;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.ApplicationModel.DataTransfer Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IStandardDataFormatsStatics
  [WinRTClassNameAttribute(SStandardDataFormats)]
  IStandardDataFormatsStatics = interface(IInspectable)
  ['{7ED681A1-A880-40C9-B4ED-0BEE1E15F549}']
    function get_Text: HSTRING; safecall;
    function get_Uri: HSTRING; safecall;
    function get_Html: HSTRING; safecall;
    function get_Rtf: HSTRING; safecall;
    function get_Bitmap: HSTRING; safecall;
    function get_StorageItems: HSTRING; safecall;
    property Bitmap: HSTRING read get_Bitmap;
    property Html: HSTRING read get_Html;
    property Rtf: HSTRING read get_Rtf;
    property StorageItems: HSTRING read get_StorageItems;
    property Text: HSTRING read get_Text;
    property Uri: HSTRING read get_Uri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IStandardDataFormatsStatics2
  [WinRTClassNameAttribute(SStandardDataFormats)]
  IStandardDataFormatsStatics2 = interface(IInspectable)
  ['{42A254F4-9D76-42E8-861B-47C25DD0CF71}']
    function get_WebLink: HSTRING; safecall;
    function get_ApplicationLink: HSTRING; safecall;
    property ApplicationLink: HSTRING read get_ApplicationLink;
    property WebLink: HSTRING read get_WebLink;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.UI.Color
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView2
  IDataPackagePropertySetView2 = interface(IInspectable)
  ['{6054509B-8EBE-4FEB-9C1E-75E69DE54B84}']
    function get_PackageFamilyName: HSTRING; safecall;
    function get_ContentSourceWebLink: IUriRuntimeClass; safecall;
    function get_ContentSourceApplicationLink: IUriRuntimeClass; safecall;
    function get_Square30x30Logo: IRandomAccessStreamReference; safecall;
    function get_LogoBackgroundColor: Color; safecall;
    property ContentSourceApplicationLink: IUriRuntimeClass read get_ContentSourceApplicationLink;
    property ContentSourceWebLink: IUriRuntimeClass read get_ContentSourceWebLink;
    property LogoBackgroundColor: Color read get_LogoBackgroundColor;
    property PackageFamilyName: HSTRING read get_PackageFamilyName;
    property Square30x30Logo: IRandomAccessStreamReference read get_Square30x30Logo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView3
  IDataPackagePropertySetView3 = interface(IInspectable)
  ['{DB764CE5-D174-495C-84FC-1A51F6AB45D7}']
    function get_EnterpriseId: HSTRING; safecall;
    property EnterpriseId: HSTRING read get_EnterpriseId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.UI.Color
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet2
  IDataPackagePropertySet2 = interface(IInspectable)
  ['{EB505D4A-9800-46AA-B181-7B6F0F2B919A}']
    function get_ContentSourceWebLink: IUriRuntimeClass; safecall;
    procedure put_ContentSourceWebLink(value: IUriRuntimeClass); safecall;
    function get_ContentSourceApplicationLink: IUriRuntimeClass; safecall;
    procedure put_ContentSourceApplicationLink(value: IUriRuntimeClass); safecall;
    function get_PackageFamilyName: HSTRING; safecall;
    procedure put_PackageFamilyName(value: HSTRING); safecall;
    function get_Square30x30Logo: IRandomAccessStreamReference; safecall;
    procedure put_Square30x30Logo(value: IRandomAccessStreamReference); safecall;
    function get_LogoBackgroundColor: Color; safecall;
    procedure put_LogoBackgroundColor(value: Color); safecall;
    property ContentSourceApplicationLink: IUriRuntimeClass read get_ContentSourceApplicationLink write put_ContentSourceApplicationLink;
    property ContentSourceWebLink: IUriRuntimeClass read get_ContentSourceWebLink write put_ContentSourceWebLink;
    property LogoBackgroundColor: Color read get_LogoBackgroundColor write put_LogoBackgroundColor;
    property PackageFamilyName: HSTRING read get_PackageFamilyName write put_PackageFamilyName;
    property Square30x30Logo: IRandomAccessStreamReference read get_Square30x30Logo write put_Square30x30Logo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet3
  IDataPackagePropertySet3 = interface(IInspectable)
  ['{9E87FD9B-5205-401B-874A-455653BD39E8}']
    function get_EnterpriseId: HSTRING; safecall;
    procedure put_EnterpriseId(value: HSTRING); safecall;
    property EnterpriseId: HSTRING read get_EnterpriseId write put_EnterpriseId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs2
  IOperationCompletedEventArgs2 = interface(IInspectable)
  ['{858FA073-1E19-4105-B2F7-C8478808D562}']
    function get_AcceptedFormatId: HSTRING; safecall;
    property AcceptedFormatId: HSTRING read get_AcceptedFormatId;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.UI.Color
  // Used Types:  Object
  }
  // Windows.ApplicationModel.DataTransfer.IShareProvider
  IShareProvider = interface(IInspectable)
  ['{2FABE026-443E-4CDA-AF25-8D81070EFD80}']
    function get_Title: HSTRING; safecall;
    function get_DisplayIcon: IRandomAccessStreamReference; safecall;
    function get_BackgroundColor: Color; safecall;
    function get_Tag: IInspectable; safecall;
    procedure put_Tag(value: IInspectable); safecall;
    property BackgroundColor: Color read get_BackgroundColor;
    property DisplayIcon: IRandomAccessStreamReference read get_DisplayIcon;
    property Tag: IInspectable read get_Tag write put_Tag;
    property Title: HSTRING read get_Title;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareProvider
  }
  // Windows.ApplicationModel.DataTransfer.IShareTargetInfo
  IShareTargetInfo = interface(IInspectable)
  ['{385BE607-C6E8-4114-B294-28F3BB6F9904}']
    function get_AppUserModelId: HSTRING; safecall;
    function get_ShareProvider: IShareProvider; safecall;
    property AppUserModelId: HSTRING read get_AppUserModelId;
    property ShareProvider: IShareProvider read get_ShareProvider;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareTargetInfo
  }
  // Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs
  IShareCompletedEventArgs = interface(IInspectable)
  ['{4574C442-F913-4F60-9DF7-CC4060AB1916}']
    function get_ShareTarget: IShareTargetInfo; safecall;
    property ShareTarget: IShareTargetInfo read get_ShareTarget;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackageView2
  IDataPackageView2 = interface(IInspectable)
  ['{40ECBA95-2450-4C1D-B6B4-ED45463DEE9C}']
    function GetApplicationLinkAsync: IAsyncOperation_1__IUriRuntimeClass; safecall;
    function GetWebLinkAsync: IAsyncOperation_1__IUriRuntimeClass; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult>
  // Used Types:  String
  // Used Types:  Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackageView3
  IDataPackageView3 = interface(IInspectable)
  ['{D37771A8-DDAD-4288-8428-D1CAE394128B}']
    function RequestAccessAsync: IAsyncOperation_1__EnterpriseData_ProtectionPolicyEvaluationResult; overload; safecall;
    function RequestAccessAsync(enterpriseId: HSTRING): IAsyncOperation_1__EnterpriseData_ProtectionPolicyEvaluationResult; overload; safecall;
    function UnlockAndAssumeEnterpriseIdentity: EnterpriseData_ProtectionPolicyEvaluationResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackageView4
  IDataPackageView4 = interface(IInspectable)
  ['{DFE96F1F-E042-4433-A09F-26D6FFDA8B85}']
    procedure SetAcceptedFormatId(formatId: HSTRING); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackage2
  IDataPackage2 = interface(IInspectable)
  ['{041C1FE9-2409-45E1-A538-4C53EEEE04A7}']
    procedure SetApplicationLink(value: IUriRuntimeClass); safecall;
    procedure SetWebLink(value: IUriRuntimeClass); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs>
  TypedEventHandler_2__IDataPackage__IShareCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{F8F7E24A-56FE-58DF-BC15-2365AEC03966}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackage
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs>
  TypedEventHandler_2__IDataPackage__IShareCompletedEventArgs = interface(TypedEventHandler_2__IDataPackage__IShareCompletedEventArgs_Delegate_Base)
  ['{2B4C35E5-96FD-58E2-82A0-3B40DF89065E}']
    procedure Invoke(sender: IDataPackage; args: IShareCompletedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IShareCompletedEventArgs>
  }
  // Windows.ApplicationModel.DataTransfer.IDataPackage3
  IDataPackage3 = interface(IInspectable)
  ['{88F31F5D-787B-4D32-965A-A9838105A056}']
    function add_ShareCompleted(handler: TypedEventHandler_2__IDataPackage__IShareCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ShareCompleted(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.IHtmlFormatHelperStatics
  [WinRTClassNameAttribute(SHtmlFormatHelper)]
  IHtmlFormatHelperStatics = interface(IInspectable)
  ['{E22E7749-DD70-446F-AEFC-61CEE59F655E}']
    function GetStaticFragment(htmlFormat: HSTRING): HSTRING; safecall;
    function CreateHtmlFormat(htmlFragment: HSTRING): HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackageView
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackage
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.EventHandler`1<Object>
  }
  // Windows.ApplicationModel.DataTransfer.IClipboardStatics
  [WinRTClassNameAttribute(SClipboard)]
  IClipboardStatics = interface(IInspectable)
  ['{C627E291-34E2-4963-8EED-93CBB0EA3D70}']
    function GetContent: IDataPackageView; safecall;
    procedure SetContent(content: IDataPackage); safecall;
    procedure Flush; safecall;
    procedure Clear; safecall;
    function add_ContentChanged(changeHandler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ContentChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackageView
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.DragDropModifiers
  // Used Types:  Windows.Foundation.Point
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
  [WinRTClassNameAttribute(SDragDrop_Core_CoreDragInfo)]
  DragDrop_Core_ICoreDragInfo = interface(IInspectable)
  ['{48353A8B-CB50-464E-9575-CD4E3A7AB028}']
    function get_Data: IDataPackageView; safecall;
    function get_Modifiers: DragDrop_DragDropModifiers; safecall;
    function get_Position: TPointF; safecall;
    property Data: IDataPackageView read get_Data;
    property Modifiers: DragDrop_DragDropModifiers read get_Modifiers;
    property Position: TPointF read get_Position;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.DataPackageOperation
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo2
  DragDrop_Core_ICoreDragInfo2 = interface(IInspectable)
  ['{C54691E5-E6FB-4D74-B4B1-8A3C17F25E9E}']
    function get_AllowedOperations: DataPackageOperation; safecall;
    property AllowedOperations: DataPackageOperation read get_AllowedOperations;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Boolean
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride
  [WinRTClassNameAttribute(SDragDrop_Core_CoreDragUIOverride)]
  DragDrop_Core_ICoreDragUIOverride = interface(IInspectable)
  ['{89A85064-3389-4F4F-8897-7E8A3FFB3C93}']
    procedure SetContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap); overload; safecall;
    procedure SetContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap; anchorPoint: TPointF); overload; safecall;
    function get_IsContentVisible: Boolean; safecall;
    procedure put_IsContentVisible(value: Boolean); safecall;
    function get_Caption: HSTRING; safecall;
    procedure put_Caption(value: HSTRING); safecall;
    function get_IsCaptionVisible: Boolean; safecall;
    procedure put_IsCaptionVisible(value: Boolean); safecall;
    function get_IsGlyphVisible: Boolean; safecall;
    procedure put_IsGlyphVisible(value: Boolean); safecall;
    procedure Clear; safecall;
    property Caption: HSTRING read get_Caption write put_Caption;
    property IsCaptionVisible: Boolean read get_IsCaptionVisible write put_IsCaptionVisible;
    property IsContentVisible: Boolean read get_IsContentVisible write put_IsContentVisible;
    property IsGlyphVisible: Boolean read get_IsGlyphVisible write put_IsGlyphVisible;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  AsyncOperationCompletedHandler_1__DataPackageOperation_Delegate_Base = interface(IUnknown)
  ['{ADD21D46-17DF-5A43-A685-3262FCE84643}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  AsyncOperationCompletedHandler_1__DataPackageOperation = interface(AsyncOperationCompletedHandler_1__DataPackageOperation_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DataPackageOperation; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  IAsyncOperation_1__DataPackageOperation_Base = interface(IInspectable)
  ['{8B98AEA9-64F0-5672-B30E-DFD9C2E4F6FE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  // Used Types:  Windows.ApplicationModel.DataTransfer.DataPackageOperation
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  IAsyncOperation_1__DataPackageOperation = interface(IAsyncOperation_1__DataPackageOperation_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DataPackageOperation); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DataPackageOperation; safecall;
    function GetResults: DataPackageOperation; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DataPackageOperation read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTarget
  DragDrop_Core_ICoreDropOperationTarget = interface(IInspectable)
  ['{D9126196-4C5B-417D-BB37-76381DEF8DB4}']
    function EnterAsync(dragInfo: DragDrop_Core_ICoreDragInfo; dragUIOverride: DragDrop_Core_ICoreDragUIOverride): IAsyncOperation_1__DataPackageOperation; safecall;
    function OverAsync(dragInfo: DragDrop_Core_ICoreDragInfo; dragUIOverride: DragDrop_Core_ICoreDragUIOverride): IAsyncOperation_1__DataPackageOperation; safecall;
    function LeaveAsync(dragInfo: DragDrop_Core_ICoreDragInfo): IAsyncAction; safecall;
    function DropAsync(dragInfo: DragDrop_Core_ICoreDragInfo): IAsyncOperation_1__DataPackageOperation; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackage
  // Used Types:  UInt32
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragUIContentMode
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.DataPackageOperation>
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation
  [WinRTClassNameAttribute(SDragDrop_Core_CoreDragOperation)]
  DragDrop_Core_ICoreDragOperation = interface(IInspectable)
  ['{CC06DE4F-6DB0-4E62-AB1B-A74A02DC6D85}']
    function get_Data: IDataPackage; safecall;
    procedure SetPointerId(pointerId: Cardinal); safecall;
    procedure SetDragUIContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap); overload; safecall;
    procedure SetDragUIContentFromSoftwareBitmap(softwareBitmap: Imaging_ISoftwareBitmap; anchorPoint: TPointF); overload; safecall;
    function get_DragUIContentMode: DragDrop_Core_CoreDragUIContentMode; safecall;
    procedure put_DragUIContentMode(value: DragDrop_Core_CoreDragUIContentMode); safecall;
    function StartAsync: IAsyncOperation_1__DataPackageOperation; safecall;
    property Data: IDataPackage read get_Data;
    property DragUIContentMode: DragDrop_Core_CoreDragUIContentMode read get_DragUIContentMode write put_DragUIContentMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.DataPackageOperation
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation2
  DragDrop_Core_ICoreDragOperation2 = interface(IInspectable)
  ['{824B1E2C-D99A-4FC3-8507-6C182F33B46A}']
    function get_AllowedOperations: DataPackageOperation; safecall;
    procedure put_AllowedOperations(value: DataPackageOperation); safecall;
    property AllowedOperations: DataPackageOperation read get_AllowedOperations write put_AllowedOperations;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTarget
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs
  [WinRTClassNameAttribute(SDragDrop_Core_CoreDropOperationTargetRequestedEventArgs)]
  DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs = interface(IInspectable)
  ['{2ACA929A-5E28-4EA6-829E-29134E665D6D}']
    procedure SetTarget(target: DragDrop_Core_ICoreDropOperationTarget); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager,Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs>
  TypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A4C3B1C1-B8AD-58CB-ACC0-8EF37EAE4ED4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager,Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs>
  TypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs = interface(TypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs_Delegate_Base)
  ['{79E5B8A1-F24A-5D72-9E29-0503937617EB}']
    procedure Invoke(sender: DragDrop_Core_ICoreDragDropManager; args: DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager,Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs>
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
  [WinRTClassNameAttribute(SDragDrop_Core_CoreDragDropManager)]
  DragDrop_Core_ICoreDragDropManager = interface(IInspectable)
  ['{7D56D344-8464-4FAF-AA49-37EA6E2D7BD1}']
    function add_TargetRequested(value: TypedEventHandler_2__DragDrop_Core_ICoreDragDropManager__DragDrop_Core_ICoreDropOperationTargetRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TargetRequested(value: EventRegistrationToken); safecall;
    function get_AreConcurrentOperationsEnabled: Boolean; safecall;
    procedure put_AreConcurrentOperationsEnabled(value: Boolean); safecall;
    property AreConcurrentOperationsEnabled: Boolean read get_AreConcurrentOperationsEnabled write put_AreConcurrentOperationsEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
  }
  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManagerStatics
  [WinRTClassNameAttribute(SDragDrop_Core_CoreDragDropManager)]
  DragDrop_Core_ICoreDragDropManagerStatics = interface(IInspectable)
  ['{9542FDCA-DA12-4C1C-8D06-041DB29733C3}']
    function GetForCurrentView: DragDrop_Core_ICoreDragDropManager; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.ShareUITheme
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  }
  // Windows.ApplicationModel.DataTransfer.IShareUIOptions
  [WinRTClassNameAttribute(SShareUIOptions)]
  IShareUIOptions = interface(IInspectable)
  ['{72FA8A80-342F-4D90-9551-2AE04E37680C}']
    function get_Theme: ShareUITheme; safecall;
    procedure put_Theme(value: ShareUITheme); safecall;
    function get_SelectionRect: IReference_1__Rect; safecall;
    procedure put_SelectionRect(value: IReference_1__Rect); safecall;
    property SelectionRect: IReference_1__Rect read get_SelectionRect write put_SelectionRect;
    property Theme: ShareUITheme read get_Theme write put_Theme;
  end;

  // UsedAPI Interface
  {
  }
  // Windows.ApplicationModel.DataTransfer.IDataRequestDeferral
  IDataRequestDeferral = interface(IInspectable)
  ['{6DC4B89F-0386-4263-87C1-ED7DCE30890E}']
    procedure Complete; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackage
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataRequestDeferral
  }
  // Windows.ApplicationModel.DataTransfer.IDataRequest
  IDataRequest = interface(IInspectable)
  ['{4341AE3B-FC12-4E53-8C02-AC714C415A27}']
    function get_Data: IDataPackage; safecall;
    procedure put_Data(value: IDataPackage); safecall;
    function get_Deadline: DateTime; safecall;
    procedure FailWithDisplayText(value: HSTRING); safecall;
    function GetDeferral: IDataRequestDeferral; safecall;
    property Data: IDataPackage read get_Data write put_Data;
    property Deadline: DateTime read get_Deadline;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataRequest
  }
  // Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs
  IDataRequestedEventArgs = interface(IInspectable)
  ['{CB8BA807-6AC5-43C9-8AC5-9BA232163182}']
    function get_Request: IDataRequest; safecall;
    property Request: IDataRequest read get_Request;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IIterator_1__IShareProvider_Base = interface(IInspectable)
  ['{886F5642-E9F9-573B-9213-5840B5062B40}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareProvider
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IIterator_1__IShareProvider = interface(IIterator_1__IShareProvider_Base)
  ['{D7A2A7A2-254A-55DA-AE8F-EDF525A5036A}']
    function get_Current: IShareProvider; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIShareProvider): Cardinal; safecall;
    property Current: IShareProvider read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IIterable_1__IShareProvider_Base = interface(IInspectable)
  ['{0903B218-5CAD-53E6-9A21-6F4B31C4A409}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IIterable_1__IShareProvider = interface(IIterable_1__IShareProvider_Base)
  ['{3C8AA09E-5CC9-5F78-AE2E-04FB0E8C6C48}']
    function First: IIterator_1__IShareProvider; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareProvider
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IVectorView_1__IShareProvider = interface(IInspectable)
  ['{82017F36-CFE0-5FE3-8AB0-6F0055957FB4}']
    function GetAt(index: Cardinal): IShareProvider; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IShareProvider; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIShareProvider): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareProvider
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  IVector_1__IShareProvider = interface(IInspectable)
  ['{2F775C24-EE1E-509C-A4D0-CCC66B046507}']
    function GetAt(index: Cardinal): IShareProvider; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IShareProvider; safecall;
    function IndexOf(value: IShareProvider; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IShareProvider); safecall;
    procedure InsertAt(index: Cardinal; value: IShareProvider); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IShareProvider); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIShareProvider): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIShareProvider); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.DataTransfer.IShareProvider>
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackageView
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs
  IShareProvidersRequestedEventArgs = interface(IInspectable)
  ['{F888F356-A3F8-4FCE-85E4-8826E63BE799}']
    function get_Providers: IVector_1__IShareProvider; safecall;
    function get_Data: IDataPackageView; safecall;
    function GetDeferral: IDeferral; safecall;
    property Data: IDataPackageView read get_Data;
    property Providers: IVector_1__IShareProvider read get_Providers;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs
  ITargetApplicationChosenEventArgs = interface(IInspectable)
  ['{CA6FB8AC-2987-4EE3-9C54-D8AFBCB86C1D}']
    function get_ApplicationName: HSTRING; safecall;
    property ApplicationName: HSTRING read get_ApplicationName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs>
  TypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{EC6F9CC8-46D0-5E0E-B4D2-7D7773AE37A0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataTransferManager
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs>
  TypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs = interface(TypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs_Delegate_Base)
  ['{041062FC-4655-55C7-A13F-1153F9CA6E51}']
    procedure Invoke(sender: IDataTransferManager; args: IDataRequestedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs>
  TypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs_Delegate_Base = interface(IUnknown)
  ['{C4AC1BA2-7851-5A44-BC8D-3D7C713F1F41}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataTransferManager
  // Used Types:  Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs>
  TypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs = interface(TypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs_Delegate_Base)
  ['{A3639038-7CA2-5BF9-9657-DDBB0B7C6142}']
    procedure Invoke(sender: IDataTransferManager; args: ITargetApplicationChosenEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IDataRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.ITargetApplicationChosenEventArgs>
  }
  // Windows.ApplicationModel.DataTransfer.IDataTransferManager
  [WinRTClassNameAttribute(SDataTransferManager)]
  IDataTransferManager = interface(IInspectable)
  ['{A5CAEE9B-8708-49D1-8D36-67D25A8DA00C}']
    function add_DataRequested(eventHandler: TypedEventHandler_2__IDataTransferManager__IDataRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DataRequested(eventCookie: EventRegistrationToken); safecall;
    function add_TargetApplicationChosen(eventHandler: TypedEventHandler_2__IDataTransferManager__ITargetApplicationChosenEventArgs): EventRegistrationToken; safecall;
    procedure remove_TargetApplicationChosen(eventCookie: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs>
  TypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{147E2860-7397-582F-80DB-B8685383A937}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataTransferManager
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs>
  TypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs = interface(TypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs_Delegate_Base)
  ['{AD4E35F1-51EC-5CC1-854F-87BDBB80C810}']
    procedure Invoke(sender: IDataTransferManager; args: IShareProvidersRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataTransferManager,Windows.ApplicationModel.DataTransfer.IShareProvidersRequestedEventArgs>
  }
  // Windows.ApplicationModel.DataTransfer.IDataTransferManager2
  IDataTransferManager2 = interface(IInspectable)
  ['{30AE7D71-8BA8-4C02-8E3F-DDB23B388715}']
    function add_ShareProvidersRequested(handler: TypedEventHandler_2__IDataTransferManager__IShareProvidersRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ShareProvidersRequested(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataTransferManager
  }
  // Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics
  [WinRTClassNameAttribute(SDataTransferManager)]
  IDataTransferManagerStatics = interface(IInspectable)
  ['{A9DA01AA-E00E-4CFE-AA44-2DD932DCA3D8}']
    procedure ShowShareUI; safecall;
    function GetForCurrentView: IDataTransferManager; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics2
  [WinRTClassNameAttribute(SDataTransferManager)]
  IDataTransferManagerStatics2 = interface(IInspectable)
  ['{C54EC2EC-9F97-4D63-9868-395E271AD8F5}']
    function IsSupported: Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.DataTransfer.IShareUIOptions
  }
  // Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics3
  [WinRTClassNameAttribute(SDataTransferManager)]
  IDataTransferManagerStatics3 = interface(IInspectable)
  ['{05845473-6C82-4F5C-AC23-62E458361FAC}']
    procedure ShowShareUI(options: IShareUIOptions); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  AsyncOperationCompletedHandler_1__IDataPackage_Delegate_Base = interface(IUnknown)
  ['{A93A3B99-E946-57CE-AAD9-C23D138C353E}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  AsyncOperationCompletedHandler_1__IDataPackage = interface(AsyncOperationCompletedHandler_1__IDataPackage_Delegate_Base)
  ['{926269A5-BCC6-5C70-90E0-79EAF8ECBABC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IDataPackage; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  IAsyncOperation_1__IDataPackage_Base = interface(IInspectable)
  ['{A16F2D07-EAD3-53E4-9490-75BDBAEB7A5B}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  // Used Types:  Windows.ApplicationModel.DataTransfer.IDataPackage
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.DataTransfer.IDataPackage>
  IAsyncOperation_1__IDataPackage = interface(IAsyncOperation_1__IDataPackage_Base)
  ['{F5B89375-4322-58CD-9F18-DBCF55147BF3}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IDataPackage); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IDataPackage; safecall;
    function GetResults: IDataPackage; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IDataPackage read get_Completed write put_Completed;
  end;


  // Emit Forwarded classes
  // Windows.ApplicationModel.DataTransfer.StandardDataFormats
  // DualAPI
  // Statics: "Windows.ApplicationModel.DataTransfer.IStandardDataFormatsStatics"
  // Statics: "Windows.ApplicationModel.DataTransfer.IStandardDataFormatsStatics2"
  TStandardDataFormats = class(TWinRTGenericImportS2<IStandardDataFormatsStatics, IStandardDataFormatsStatics2>)
  public
    // -> IStandardDataFormatsStatics
    class function get_Text: HSTRING; static; inline;
    class function get_Uri: HSTRING; static; inline;
    class function get_Html: HSTRING; static; inline;
    class function get_Rtf: HSTRING; static; inline;
    class function get_Bitmap: HSTRING; static; inline;
    class function get_StorageItems: HSTRING; static; inline;
    class property Bitmap: HSTRING read get_Bitmap;
    class property Html: HSTRING read get_Html;
    class property Rtf: HSTRING read get_Rtf;
    class property StorageItems: HSTRING read get_StorageItems;
    class property Text: HSTRING read get_Text;
    class property Uri: HSTRING read get_Uri;

    // -> IStandardDataFormatsStatics2
    class function get_WebLink: HSTRING; static; inline;
    class function get_ApplicationLink: HSTRING; static; inline;
    class property ApplicationLink: HSTRING read get_ApplicationLink;
    class property WebLink: HSTRING read get_WebLink;
  end;

  // Windows.ApplicationModel.DataTransfer.DataPackagePropertySetView
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView
  // Implements: Windows.Foundation.Collections.IMapView`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView2
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView3

  // Windows.ApplicationModel.DataTransfer.DataPackagePropertySet
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet
  // Implements: Windows.Foundation.Collections.IMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet2
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet3

  // Windows.ApplicationModel.DataTransfer.DataProviderDeferral
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataProviderDeferral

  // Windows.ApplicationModel.DataTransfer.DataProviderRequest
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataProviderRequest

  // Windows.ApplicationModel.DataTransfer.OperationCompletedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs
  // Implements: Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs2

  // Windows.ApplicationModel.DataTransfer.DataPackageView
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackageView
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackageView2
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackageView3
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackageView4

  // Windows.ApplicationModel.DataTransfer.DataPackage
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackage
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackage2
  // Implements: Windows.ApplicationModel.DataTransfer.IDataPackage3
  // Instantiable: "IDataPackage"
  TDataPackage = class(TWinRTGenericImportI<IDataPackage>) end;

  // Windows.ApplicationModel.DataTransfer.HtmlFormatHelper
  // DualAPI
  // Statics: "Windows.ApplicationModel.DataTransfer.IHtmlFormatHelperStatics"
  THtmlFormatHelper = class(TWinRTGenericImportS<IHtmlFormatHelperStatics>)
  public
    // -> IHtmlFormatHelperStatics
    class function GetStaticFragment(htmlFormat: HSTRING): HSTRING; static; inline;
    class function CreateHtmlFormat(htmlFragment: HSTRING): HSTRING; static; inline;
  end;

  // Windows.ApplicationModel.DataTransfer.Clipboard
  // DualAPI
  // Statics: "Windows.ApplicationModel.DataTransfer.IClipboardStatics"
  TClipboard = class(TWinRTGenericImportS<IClipboardStatics>)
  public
    // -> IClipboardStatics
    class function GetContent: IDataPackageView; static; inline;
    class procedure SetContent(content: IDataPackage); static; inline;
    class procedure Flush; static; inline;
    class procedure Clear; static; inline;
    class function add_ContentChanged(changeHandler: EventHandler_1__IInspectable): EventRegistrationToken; static; inline;
    class procedure remove_ContentChanged(token: EventRegistrationToken); static; inline;
  end;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragInfo
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragInfo2

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragUIOverride
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragUIOverride

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragDropManager
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManager
  // Statics: "Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragDropManagerStatics"
  TDragDrop_Core_CoreDragDropManager = class(TWinRTGenericImportS<DragDrop_Core_ICoreDragDropManagerStatics>)
  public
    // -> DragDrop_Core_ICoreDragDropManagerStatics
    class function GetForCurrentView: DragDrop_Core_ICoreDragDropManager; static; inline;
  end;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDropOperationTargetRequestedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDropOperationTargetRequestedEventArgs

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragOperation
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation
  // Implements: Windows.ApplicationModel.DataTransfer.DragDrop.Core.ICoreDragOperation2
  // Instantiable: "DragDrop_Core_ICoreDragOperation"
  TDragDrop_Core_CoreDragOperation = class(TWinRTGenericImportI<DragDrop_Core_ICoreDragOperation>) end;

  // Windows.ApplicationModel.DataTransfer.ShareUIOptions
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IShareUIOptions
  // Instantiable: "IShareUIOptions"
  TShareUIOptions = class(TWinRTGenericImportI<IShareUIOptions>) end;

  // Windows.ApplicationModel.DataTransfer.DataTransferManager
  // DualAPI
  // Implements: Windows.ApplicationModel.DataTransfer.IDataTransferManager
  // Implements: Windows.ApplicationModel.DataTransfer.IDataTransferManager2
  // Statics: "Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics2"
  // Statics: "Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics3"
  // Statics: "Windows.ApplicationModel.DataTransfer.IDataTransferManagerStatics"
  // Interop Intf: "IDataTransferManagerInterop"
  IDataTransferManagerInterop = interface(IUnknown)
    ['{3A3DCD6C-3EAB-43DC-BCDE-45671CE800C8}']
    function GetForWindow(appWindow: THandle; const riid: TGUID): IDataTransferManager; safecall;
    procedure ShowShareUIForWindow(appWindow: THandle); safecall;
  end;
  TDataTransferManager = class(TWinRTGenericImportS3O<IDataTransferManagerStatics, IDataTransferManagerStatics2, IDataTransferManagerStatics3, IDataTransferManagerInterop>)
  public
    // -> IDataTransferManagerStatics2
    class function IsSupported: Boolean; static; inline;

    // -> IDataTransferManagerStatics3
    class procedure ShowShareUI(options: IShareUIOptions); overload; static; inline;

    // -> IDataTransferManagerStatics
    class procedure ShowShareUI; overload; static; inline;
    class function GetForCurrentView: IDataTransferManager; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TStandardDataFormats }

class function TStandardDataFormats.get_Text: HSTRING;
begin
  Result := Statics.get_Text;
end;

class function TStandardDataFormats.get_Uri: HSTRING;
begin
  Result := Statics.get_Uri;
end;

class function TStandardDataFormats.get_Html: HSTRING;
begin
  Result := Statics.get_Html;
end;

class function TStandardDataFormats.get_Rtf: HSTRING;
begin
  Result := Statics.get_Rtf;
end;

class function TStandardDataFormats.get_Bitmap: HSTRING;
begin
  Result := Statics.get_Bitmap;
end;

class function TStandardDataFormats.get_StorageItems: HSTRING;
begin
  Result := Statics.get_StorageItems;
end;


class function TStandardDataFormats.get_WebLink: HSTRING;
begin
  Result := Statics2.get_WebLink;
end;

class function TStandardDataFormats.get_ApplicationLink: HSTRING;
begin
  Result := Statics2.get_ApplicationLink;
end;


 { TDataPackage }

 { THtmlFormatHelper }

class function THtmlFormatHelper.GetStaticFragment(htmlFormat: HSTRING): HSTRING;
begin
  Result := Statics.GetStaticFragment(htmlFormat);
end;

class function THtmlFormatHelper.CreateHtmlFormat(htmlFragment: HSTRING): HSTRING;
begin
  Result := Statics.CreateHtmlFormat(htmlFragment);
end;


 { TClipboard }

class function TClipboard.GetContent: IDataPackageView;
begin
  Result := Statics.GetContent;
end;

class procedure TClipboard.SetContent(content: IDataPackage);
begin
  Statics.SetContent(content);
end;

class procedure TClipboard.Flush;
begin
  Statics.Flush;
end;

class procedure TClipboard.Clear;
begin
  Statics.Clear;
end;

class function TClipboard.add_ContentChanged(changeHandler: EventHandler_1__IInspectable): EventRegistrationToken;
begin
  Result := Statics.add_ContentChanged(changeHandler);
end;

class procedure TClipboard.remove_ContentChanged(token: EventRegistrationToken);
begin
  Statics.remove_ContentChanged(token);
end;


 { TDragDrop_Core_CoreDragDropManager }

class function TDragDrop_Core_CoreDragDropManager.GetForCurrentView: DragDrop_Core_ICoreDragDropManager;
begin
  Result := Statics.GetForCurrentView;
end;


 { TDragDrop_Core_CoreDragOperation }

 { TShareUIOptions }

 { TDataTransferManager }

class procedure TDataTransferManager.ShowShareUI;
begin
  Statics.ShowShareUI;
end;

class function TDataTransferManager.GetForCurrentView: IDataTransferManager;
begin
  Result := Statics.GetForCurrentView;
end;


class function TDataTransferManager.IsSupported: Boolean;
begin
  Result := Statics2.IsSupported;
end;


class procedure TDataTransferManager.ShowShareUI(options: IShareUIOptions);
begin
  Statics3.ShowShareUI(options);
end;



end.
