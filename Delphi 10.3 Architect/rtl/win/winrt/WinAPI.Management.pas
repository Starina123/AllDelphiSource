{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Management;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.ApplicationModel, 
  Winapi.CommonTypes, 
  Winapi.Foundation, 
  Winapi.Storage, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Management.Deployment.IPackageVolume
  Deployment_IPackageVolume = interface;
  PDeployment_IPackageVolume = ^Deployment_IPackageVolume;

  // Windows.Management.Deployment.IDeploymentResult
  Deployment_IDeploymentResult = interface;
  PDeployment_IDeploymentResult = ^Deployment_IDeploymentResult;

  // Windows.Management.Deployment.IPackageUserInformation
  Deployment_IPackageUserInformation = interface;
  PDeployment_IPackageUserInformation = ^Deployment_IPackageUserInformation;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = interface;
  PAsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = ^AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = ^AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = interface;
  PIAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = ^IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress;

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

  // Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageUserInformation>
  IIterator_1__Deployment_IPackageUserInformation = interface;
  PIIterator_1__Deployment_IPackageUserInformation = ^IIterator_1__Deployment_IPackageUserInformation;

  // Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageUserInformation>
  IIterable_1__Deployment_IPackageUserInformation = interface;
  PIIterable_1__Deployment_IPackageUserInformation = ^IIterable_1__Deployment_IPackageUserInformation;

  // Windows.Management.Deployment.IPackageManager
  Deployment_IPackageManager = interface;
  PDeployment_IPackageManager = ^Deployment_IPackageManager;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Management.Deployment.IPackageManager2
  Deployment_IPackageManager2 = interface;
  PDeployment_IPackageManager2 = ^Deployment_IPackageManager2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Management.Deployment.IPackageVolume>
  AsyncOperationCompletedHandler_1__Deployment_IPackageVolume = interface;
  PAsyncOperationCompletedHandler_1__Deployment_IPackageVolume = ^AsyncOperationCompletedHandler_1__Deployment_IPackageVolume;

  // Windows.Foundation.IAsyncOperation`1<Windows.Management.Deployment.IPackageVolume>
  IAsyncOperation_1__Deployment_IPackageVolume = interface;
  PIAsyncOperation_1__Deployment_IPackageVolume = ^IAsyncOperation_1__Deployment_IPackageVolume;

  // Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageVolume>
  IIterator_1__Deployment_IPackageVolume = interface;
  PIIterator_1__Deployment_IPackageVolume = ^IIterator_1__Deployment_IPackageVolume;

  // Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageVolume>
  IIterable_1__Deployment_IPackageVolume = interface;
  PIIterable_1__Deployment_IPackageVolume = ^IIterable_1__Deployment_IPackageVolume;

  // Windows.Management.Deployment.IPackageManager3
  Deployment_IPackageManager3 = interface;
  PDeployment_IPackageManager3 = ^Deployment_IPackageManager3;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>
  IVectorView_1__Deployment_IPackageVolume = interface;
  PIVectorView_1__Deployment_IPackageVolume = ^IVectorView_1__Deployment_IPackageVolume;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume = ^AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume = interface;
  PIAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume = ^IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume;

  // Windows.Management.Deployment.IPackageManager4
  Deployment_IPackageManager4 = interface;
  PDeployment_IPackageManager4 = ^Deployment_IPackageManager4;

  // Windows.Management.Deployment.IPackageManagerDebugSettings
  Deployment_IPackageManagerDebugSettings = interface;
  PDeployment_IPackageManagerDebugSettings = ^Deployment_IPackageManagerDebugSettings;

  // Windows.Management.Deployment.IPackageManager5
  Deployment_IPackageManager5 = interface;
  PDeployment_IPackageManager5 = ^Deployment_IPackageManager5;

  // Windows.Management.Deployment.IPackageManager6
  Deployment_IPackageManager6 = interface;
  PDeployment_IPackageManager6 = ^Deployment_IPackageManager6;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt64>
  AsyncOperationCompletedHandler_1__UInt64 = interface;
  PAsyncOperationCompletedHandler_1__UInt64 = ^AsyncOperationCompletedHandler_1__UInt64;

  // Windows.Foundation.IAsyncOperation`1<UInt64>
  IAsyncOperation_1__UInt64 = interface;
  PIAsyncOperation_1__UInt64 = ^IAsyncOperation_1__UInt64;

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

  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable = interface;
  PTypedEventHandler_2__IApplicationData__IInspectable = ^TypedEventHandler_2__IApplicationData__IInspectable;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.Management.Deployment.Preview.IInstalledClassicAppInfo
  Deployment_Preview_IInstalledClassicAppInfo = interface;
  PDeployment_Preview_IInstalledClassicAppInfo = ^Deployment_Preview_IInstalledClassicAppInfo;

  // Windows.Management.Deployment.Preview.IClassicAppManagerStatics
  Deployment_Preview_IClassicAppManagerStatics = interface;
  PDeployment_Preview_IClassicAppManagerStatics = ^Deployment_Preview_IClassicAppManagerStatics;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Management Interfaces
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackage>
  // Used Types:  Windows.Management.Deployment.PackageTypes
  }
  // Windows.Management.Deployment.IPackageVolume
  Deployment_IPackageVolume = interface(IInspectable)
  ['{CF2672C3-1A40-4450-9739-2ACE2E898853}']
    function get_IsOffline: Boolean; safecall;
    function get_IsSystemVolume: Boolean; safecall;
    function get_MountPoint: HSTRING; safecall;
    function get_Name: HSTRING; safecall;
    function get_PackageStorePath: HSTRING; safecall;
    function get_SupportsHardLinks: Boolean; safecall;
    function FindPackages: IVector_1__IPackage; overload; safecall;
    function FindPackages(packageName: HSTRING; packagePublisher: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackages(packageFamilyName: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackagesWithPackageTypes(packageTypes: Deployment_PackageTypes): IVector_1__IPackage; overload; safecall;
    function FindPackagesWithPackageTypes(packageTypes: Deployment_PackageTypes; packageName: HSTRING; packagePublisher: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackagesWithPackageTypes(packageTypes: Deployment_PackageTypes; packageFamilyName: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackage(packageFullName: HSTRING): IVector_1__IPackage; safecall;
    function FindPackagesForUser(userSecurityId: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackagesForUser(userSecurityId: HSTRING; packageName: HSTRING; packagePublisher: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackagesForUser(userSecurityId: HSTRING; packageFamilyName: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackagesForUserWithPackageTypes(userSecurityId: HSTRING; packageTypes: Deployment_PackageTypes): IVector_1__IPackage; overload; safecall;
    function FindPackagesForUserWithPackageTypes(userSecurityId: HSTRING; packageTypes: Deployment_PackageTypes; packageName: HSTRING; packagePublisher: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackagesForUserWithPackageTypes(userSecurityId: HSTRING; packageTypes: Deployment_PackageTypes; packageFamilyName: HSTRING): IVector_1__IPackage; overload; safecall;
    function FindPackageForUser(userSecurityId: HSTRING; packageFullName: HSTRING): IVector_1__IPackage; safecall;
    property IsOffline: Boolean read get_IsOffline;
    property IsSystemVolume: Boolean read get_IsSystemVolume;
    property MountPoint: HSTRING read get_MountPoint;
    property Name: HSTRING read get_Name;
    property PackageStorePath: HSTRING read get_PackageStorePath;
    property SupportsHardLinks: Boolean read get_SupportsHardLinks;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Management.Deployment.IDeploymentResult
  Deployment_IDeploymentResult = interface(IInspectable)
  ['{2563B9AE-B77D-4C1F-8A7B-20E6AD515EF3}']
    function get_ErrorText: HSTRING; safecall;
    function get_ActivityId: TGuid; safecall;
    function get_ExtendedErrorCode: HRESULT; safecall;
    property ActivityId: TGuid read get_ActivityId;
    property ErrorText: HSTRING read get_ErrorText;
    property ExtendedErrorCode: HRESULT read get_ExtendedErrorCode;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Management.Deployment.PackageInstallState
  }
  // Windows.Management.Deployment.IPackageUserInformation
  Deployment_IPackageUserInformation = interface(IInspectable)
  ['{F6383423-FA09-4CBC-9055-15CA275E2E7E}']
    function get_UserSecurityId: HSTRING; safecall;
    function get_InstallState: Deployment_PackageInstallState; safecall;
    property InstallState: Deployment_PackageInstallState read get_InstallState;
    property UserSecurityId: HSTRING read get_UserSecurityId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress_Delegate_Base = interface(IUnknown)
  ['{F1B926D1-1796-597A-9BEA-6C6449D03EEF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Management.Deployment.DeploymentProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = interface(AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress_Delegate_Base)
  ['{861AC421-B865-5686-86C4-4917F24750BB}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; progressInfo: Deployment_DeploymentProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress_Delegate_Base = interface(IUnknown)
  ['{6E1C7129-61E0-5D88-9FD4-F3CE65A05719}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = interface(AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress_Delegate_Base)
  ['{2ABB4ED1-2F62-5ED0-8D86-755BEEBBB430}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress_Base = interface(IInspectable)
  ['{5A97AAB7-B6EA-55AC-A5DC-D5B164D94E94}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Management.Deployment.IDeploymentResult
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress = interface(IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress_Base)
  ['{7AF23842-29E8-5C37-BB0B-6561C00ADB92}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function GetResults: Deployment_IDeploymentResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress read get_Completed write put_Completed;
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

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageUserInformation>
  IIterator_1__Deployment_IPackageUserInformation_Base = interface(IInspectable)
  ['{75660566-AE43-5858-ADA6-D57DDAE90277}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Management.Deployment.IPackageUserInformation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageUserInformation>
  IIterator_1__Deployment_IPackageUserInformation = interface(IIterator_1__Deployment_IPackageUserInformation_Base)
  ['{BA4EB7C5-E98F-56CE-965B-8E26E0FF88DC}']
    function get_Current: Deployment_IPackageUserInformation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDeployment_IPackageUserInformation): Cardinal; safecall;
    property Current: Deployment_IPackageUserInformation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageUserInformation>
  IIterable_1__Deployment_IPackageUserInformation_Base = interface(IInspectable)
  ['{341348B9-52C8-5B57-9E91-F19F2A05B188}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageUserInformation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageUserInformation>
  IIterable_1__Deployment_IPackageUserInformation = interface(IIterable_1__Deployment_IPackageUserInformation_Base)
  ['{1CD8D83B-9210-50C2-A324-5A8E16954951}']
    function First: IIterator_1__Deployment_IPackageUserInformation; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Management.Deployment.DeploymentOptions
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackage>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageUserInformation>
  // Used Types:  Windows.Management.Deployment.PackageState
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.Management.Deployment.IPackageManager
  [WinRTClassNameAttribute(SDeployment_PackageManager)]
  Deployment_IPackageManager = interface(IInspectable)
  ['{9A7D4B65-5E8F-4FC7-A2E5-7F6925CB8B53}']
    function AddPackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function UpdatePackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RemovePackageAsync(packageFullName: HSTRING): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function StagePackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RegisterPackageAsync(manifestUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function FindPackages: IIterable_1__IPackage; overload; safecall;
    function FindPackagesForUser(userSecurityId: HSTRING): IIterable_1__IPackage; overload; safecall;
    function FindPackages(packageName: HSTRING; packagePublisher: HSTRING): IIterable_1__IPackage; overload; safecall;
    function FindPackagesForUser(userSecurityId: HSTRING; packageName: HSTRING; packagePublisher: HSTRING): IIterable_1__IPackage; overload; safecall;
    function FindUsers(packageFullName: HSTRING): IIterable_1__Deployment_IPackageUserInformation; safecall;
    procedure SetPackageState(packageFullName: HSTRING; packageState: Deployment_PackageState); safecall;
    function FindPackage(packageFullName: HSTRING): IPackage; safecall;
    function CleanupPackageForUserAsync(packageName: HSTRING; userSecurityId: HSTRING): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function FindPackages(packageFamilyName: HSTRING): IIterable_1__IPackage; overload; safecall;
    function FindPackagesForUser(userSecurityId: HSTRING; packageFamilyName: HSTRING): IIterable_1__IPackage; overload; safecall;
    function FindPackageForUser(userSecurityId: HSTRING; packageFullName: HSTRING): IPackage; safecall;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  String
  // Used Types:  Windows.Management.Deployment.RemovalOptions
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Management.Deployment.DeploymentOptions
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackage>
  // Used Types:  Windows.Management.Deployment.PackageTypes
  }
  // Windows.Management.Deployment.IPackageManager2
  Deployment_IPackageManager2 = interface(IInspectable)
  ['{F7AAD08D-0840-46F2-B5D8-CAD47693A095}']
    function RemovePackageAsync(packageFullName: HSTRING; removalOptions: Deployment_RemovalOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function StagePackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RegisterPackageByFullNameAsync(mainPackageFullName: HSTRING; dependencyPackageFullNames: IIterable_1__HSTRING; deploymentOptions: Deployment_DeploymentOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function FindPackagesWithPackageTypes(packageTypes: Deployment_PackageTypes): IIterable_1__IPackage; overload; safecall;
    function FindPackagesForUserWithPackageTypes(userSecurityId: HSTRING; packageTypes: Deployment_PackageTypes): IIterable_1__IPackage; overload; safecall;
    function FindPackagesWithPackageTypes(packageName: HSTRING; packagePublisher: HSTRING; packageTypes: Deployment_PackageTypes): IIterable_1__IPackage; overload; safecall;
    function FindPackagesForUserWithPackageTypes(userSecurityId: HSTRING; packageName: HSTRING; packagePublisher: HSTRING; packageTypes: Deployment_PackageTypes): IIterable_1__IPackage; overload; safecall;
    function FindPackagesWithPackageTypes(packageFamilyName: HSTRING; packageTypes: Deployment_PackageTypes): IIterable_1__IPackage; overload; safecall;
    function FindPackagesForUserWithPackageTypes(userSecurityId: HSTRING; packageFamilyName: HSTRING; packageTypes: Deployment_PackageTypes): IIterable_1__IPackage; overload; safecall;
    function StageUserDataAsync(packageFullName: HSTRING): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Management.Deployment.IPackageVolume>
  AsyncOperationCompletedHandler_1__Deployment_IPackageVolume_Delegate_Base = interface(IUnknown)
  ['{35FEE361-6CEA-5E5C-8EDA-34B3F22DF4E7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Management.Deployment.IPackageVolume>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Management.Deployment.IPackageVolume>
  AsyncOperationCompletedHandler_1__Deployment_IPackageVolume = interface(AsyncOperationCompletedHandler_1__Deployment_IPackageVolume_Delegate_Base)
  ['{6FE7A673-8668-57D3-B7F0-4B020D7ACA77}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Deployment_IPackageVolume; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Management.Deployment.IPackageVolume>
  IAsyncOperation_1__Deployment_IPackageVolume_Base = interface(IInspectable)
  ['{0315EDB6-DC58-51CC-A519-44901AD2CF15}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Management.Deployment.IPackageVolume>
  // Used Types:  Windows.Management.Deployment.IPackageVolume
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Management.Deployment.IPackageVolume>
  IAsyncOperation_1__Deployment_IPackageVolume = interface(IAsyncOperation_1__Deployment_IPackageVolume_Base)
  ['{EEED3F8D-7911-534D-99E8-F5C0D3968F23}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Deployment_IPackageVolume); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Deployment_IPackageVolume; safecall;
    function GetResults: Deployment_IPackageVolume; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Deployment_IPackageVolume read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageVolume>
  IIterator_1__Deployment_IPackageVolume_Base = interface(IInspectable)
  ['{A8D5B736-4E68-5EF1-9F07-F06837988C73}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Management.Deployment.IPackageVolume
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageVolume>
  IIterator_1__Deployment_IPackageVolume = interface(IIterator_1__Deployment_IPackageVolume_Base)
  ['{6502657F-39D1-51CB-8EFC-A5C8E5249C0F}']
    function get_Current: Deployment_IPackageVolume; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDeployment_IPackageVolume): Cardinal; safecall;
    property Current: Deployment_IPackageVolume read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageVolume>
  IIterable_1__Deployment_IPackageVolume_Base = interface(IInspectable)
  ['{A6199162-B163-56A1-9980-DB0C3F4E9284}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Management.Deployment.IPackageVolume>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageVolume>
  IIterable_1__Deployment_IPackageVolume = interface(IIterable_1__Deployment_IPackageVolume_Base)
  ['{FF5F02E2-4F72-50FC-B792-22550539B8A0}']
    function First: IIterator_1__Deployment_IPackageVolume; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Management.Deployment.IPackageVolume>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Management.Deployment.DeploymentOptions
  // Used Types:  Windows.Management.Deployment.IPackageVolume
  // Used Types:  Windows.Management.Deployment.PackageStatus
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Management.Deployment.IPackageVolume>
  }
  // Windows.Management.Deployment.IPackageManager3
  Deployment_IPackageManager3 = interface(IInspectable)
  ['{DAAD9948-36F1-41A7-9188-BC263E0DCB72}']
    function AddPackageVolumeAsync(packageStorePath: HSTRING): IAsyncOperation_1__Deployment_IPackageVolume; safecall;
    function AddPackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    procedure ClearPackageStatus(packageFullName: HSTRING; status: Deployment_PackageStatus); safecall;
    function RegisterPackageAsync(manifestUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions; appDataVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function FindPackageVolume(volumeName: HSTRING): Deployment_IPackageVolume; safecall;
    function FindPackageVolumes: IIterable_1__Deployment_IPackageVolume; safecall;
    function GetDefaultPackageVolume: Deployment_IPackageVolume; safecall;
    function MovePackageToVolumeAsync(packageFullName: HSTRING; deploymentOptions: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RemovePackageVolumeAsync(volume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    procedure SetDefaultPackageVolume(volume: Deployment_IPackageVolume); safecall;
    procedure SetPackageStatus(packageFullName: HSTRING; status: Deployment_PackageStatus); safecall;
    function SetPackageVolumeOfflineAsync(packageVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function SetPackageVolumeOnlineAsync(packageVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function StagePackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function StageUserDataAsync(packageFullName: HSTRING; deploymentOptions: Deployment_DeploymentOptions): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Management.Deployment.IPackageVolume
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>
  IVectorView_1__Deployment_IPackageVolume = interface(IInspectable)
  ['{3A73E178-6A1B-565F-9E4D-5FA259CA687E}']
    function GetAt(index: Cardinal): Deployment_IPackageVolume; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Deployment_IPackageVolume; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDeployment_IPackageVolume): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume_Delegate_Base = interface(IUnknown)
  ['{721241C2-0B83-594A-9B61-CE7F1492C415}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume_Delegate_Base)
  ['{F20E797E-09FA-5BAA-B39F-599C139664E1}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume_Base = interface(IInspectable)
  ['{1E357E07-D337-5C07-AE06-900C1B9A77C1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume = interface(IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume_Base)
  ['{6FD8C3AE-E9B7-5052-A4F6-0481394B4685}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume; safecall;
    function GetResults: IVectorView_1__Deployment_IPackageVolume; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Deployment_IPackageVolume read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Management.Deployment.IPackageVolume>>
  }
  // Windows.Management.Deployment.IPackageManager4
  Deployment_IPackageManager4 = interface(IInspectable)
  ['{3C719963-BAB6-46BF-8FF7-DA4719230AE6}']
    function GetPackageVolumesAsync: IAsyncOperation_1__IVectorView_1__Deployment_IPackageVolume; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.PackageContentGroupState
  // Used Types:  Double
  }
  // Windows.Management.Deployment.IPackageManagerDebugSettings
  Deployment_IPackageManagerDebugSettings = interface(IInspectable)
  ['{1A611683-A988-4FCF-8F0F-CE175898E8EB}']
    function SetContentGroupStateAsync(package: IPackage; contentGroupName: HSTRING; state: PackageContentGroupState): IAsyncAction; overload; safecall;
    function SetContentGroupStateAsync(package: IPackage; contentGroupName: HSTRING; state: PackageContentGroupState; completionPercentage: Double): IAsyncAction; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Management.Deployment.DeploymentOptions
  // Used Types:  Windows.Management.Deployment.IPackageVolume
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  String
  // Used Types:  Windows.Management.Deployment.IPackageManagerDebugSettings
  }
  // Windows.Management.Deployment.IPackageManager5
  Deployment_IPackageManager5 = interface(IInspectable)
  ['{711F3117-1AFD-4313-978C-9BB6E1B864A7}']
    function AddPackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume; optionalPackageFamilyNames: IIterable_1__HSTRING; externalPackageUris: IIterable_1__IUriRuntimeClass): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function StagePackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume; optionalPackageFamilyNames: IIterable_1__HSTRING; externalPackageUris: IIterable_1__IUriRuntimeClass): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RegisterPackageByFamilyNameAsync(mainPackageFamilyName: HSTRING; dependencyPackageFamilyNames: IIterable_1__HSTRING; deploymentOptions: Deployment_DeploymentOptions; appDataVolume: Deployment_IPackageVolume; optionalPackageFamilyNames: IIterable_1__HSTRING): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function get_DebugSettings: Deployment_IPackageManagerDebugSettings; safecall;
    property DebugSettings: Deployment_IPackageManagerDebugSettings read get_DebugSettings;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Management.Deployment.IDeploymentResult,Windows.Management.Deployment.DeploymentProgress>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Management.Deployment.AddPackageByAppInstallerOptions
  // Used Types:  Windows.Management.Deployment.IPackageVolume
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.IUriRuntimeClass>
  // Used Types:  Windows.Management.Deployment.DeploymentOptions
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  }
  // Windows.Management.Deployment.IPackageManager6
  Deployment_IPackageManager6 = interface(IInspectable)
  ['{0847E909-53CD-4E4F-832E-57D180F6E447}']
    function ProvisionPackageForAllUsersAsync(packageFamilyName: HSTRING): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function AddPackageByAppInstallerFileAsync(appInstallerFileUri: IUriRuntimeClass; options: Deployment_AddPackageByAppInstallerOptions; targetVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RequestAddPackageByAppInstallerFileAsync(appInstallerFileUri: IUriRuntimeClass; options: Deployment_AddPackageByAppInstallerOptions; targetVolume: Deployment_IPackageVolume): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function AddPackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; options: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume; optionalPackageFamilyNames: IIterable_1__HSTRING; packageUrisToInstall: IIterable_1__IUriRuntimeClass; relatedPackageUris: IIterable_1__IUriRuntimeClass): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function StagePackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; options: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume; optionalPackageFamilyNames: IIterable_1__HSTRING; packageUrisToInstall: IIterable_1__IUriRuntimeClass; relatedPackageUris: IIterable_1__IUriRuntimeClass): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
    function RequestAddPackageAsync(packageUri: IUriRuntimeClass; dependencyPackageUris: IIterable_1__IUriRuntimeClass; deploymentOptions: Deployment_DeploymentOptions; targetVolume: Deployment_IPackageVolume; optionalPackageFamilyNames: IIterable_1__HSTRING; relatedPackageUris: IIterable_1__IUriRuntimeClass): IAsyncOperationWithProgress_2__Deployment_IDeploymentResult__Deployment_DeploymentProgress; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt64>
  AsyncOperationCompletedHandler_1__UInt64_Delegate_Base = interface(IUnknown)
  ['{EE8AEB02-FB00-51FA-8F57-32583EA241F9}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt64>
  AsyncOperationCompletedHandler_1__UInt64 = interface(AsyncOperationCompletedHandler_1__UInt64_Delegate_Base)
  ['{EE8AEB02-FB00-51FA-8F57-32583EA241F9}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<UInt64>
  IAsyncOperation_1__UInt64_Base = interface(IInspectable)
  ['{2A70D630-0767-5F0A-A1C2-DEB08126E26E}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.IAsyncOperation`1<UInt64>
  IAsyncOperation_1__UInt64 = interface(IAsyncOperation_1__UInt64_Base)
  ['{2A70D630-0767-5F0A-A1C2-DEB08126E26E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__UInt64); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__UInt64; safecall;
    function GetResults: UInt64; safecall;
    property Completed: AsyncOperationCompletedHandler_1__UInt64 read get_Completed write put_Completed;
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
  // Used Types:  Windows.Storage.IApplicationData
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable = interface(IUnknown)
  ['{4E72D889-3D9A-5E3B-AA8A-3B37D17226DC}']
    procedure Invoke(sender: IApplicationData; args: IInspectable); safecall;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Management.Deployment.Preview.IInstalledClassicAppInfo
  [WinRTClassNameAttribute(SDeployment_Preview_InstalledClassicAppInfo)]
  Deployment_Preview_IInstalledClassicAppInfo = interface(IInspectable)
  ['{0A7D3DA3-65D0-4086-80D6-0610D760207D}']
    function get_DisplayName: HSTRING; safecall;
    function get_DisplayVersion: HSTRING; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property DisplayVersion: HSTRING read get_DisplayVersion;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Management.Deployment.Preview.IInstalledClassicAppInfo
  // Used Types:  String
  }
  // Windows.Management.Deployment.Preview.IClassicAppManagerStatics
  [WinRTClassNameAttribute(SDeployment_Preview_ClassicAppManager)]
  Deployment_Preview_IClassicAppManagerStatics = interface(IInspectable)
  ['{E2FAD668-882C-4F33-B035-0DF7B90D67E6}']
    function FindInstalledApp(appUninstallKey: HSTRING): Deployment_Preview_IInstalledClassicAppInfo; safecall;
  end;


  // Emit Forwarded classes
  // Windows.Management.Deployment.PackageManager
  // WinRT Only
  // WhiteListed
  // Implements: Windows.Management.Deployment.IPackageManager
  // Implements: Windows.Management.Deployment.IPackageManager2
  // Implements: Windows.Management.Deployment.IPackageManager3
  // Implements: Windows.Management.Deployment.IPackageManager4
  // Implements: Windows.Management.Deployment.IPackageManager5
  // Implements: Windows.Management.Deployment.IPackageManager6
  // Instantiable: "Deployment_IPackageManager"
  TDeployment_PackageManager = class(TWinRTGenericImportI<Deployment_IPackageManager>) end;

  // Windows.Management.Deployment.Preview.InstalledClassicAppInfo
  // DualAPI
  // Implements: Windows.Management.Deployment.Preview.IInstalledClassicAppInfo

  // Windows.Management.Deployment.Preview.ClassicAppManager
  // DualAPI
  // Statics: "Windows.Management.Deployment.Preview.IClassicAppManagerStatics"
  TDeployment_Preview_ClassicAppManager = class(TWinRTGenericImportS<Deployment_Preview_IClassicAppManagerStatics>)
  public
    // -> Deployment_Preview_IClassicAppManagerStatics
    class function FindInstalledApp(appUninstallKey: HSTRING): Deployment_Preview_IInstalledClassicAppInfo; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TDeployment_PackageManager }

 { TDeployment_Preview_ClassicAppManager }

class function TDeployment_Preview_ClassicAppManager.FindInstalledApp(appUninstallKey: HSTRING): Deployment_Preview_IInstalledClassicAppInfo;
begin
  Result := Statics.FindInstalledApp(appUninstallKey);
end;



end.
