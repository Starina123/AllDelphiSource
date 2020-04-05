{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.CommonTypes;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // External: Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IPropertySet>
  IAsyncOperation_1__IPropertySet = interface;
  PIAsyncOperation_1__IPropertySet = ^IAsyncOperation_1__IPropertySet;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IPropertySet>
  AsyncOperationCompletedHandler_1__IPropertySet = interface;
  PAsyncOperationCompletedHandler_1__IPropertySet = ^AsyncOperationCompletedHandler_1__IPropertySet;

  // External: Windows.Foundation.Collections.IPropertySet
  IPropertySet = interface;
  PIPropertySet = ^IPropertySet;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Services.Store.IStorePackageLicense,Object>
  TypedEventHandler_2__IStorePackageLicense__IInspectable = interface;
  PTypedEventHandler_2__IStorePackageLicense__IInspectable = ^TypedEventHandler_2__IStorePackageLicense__IInspectable;

  // External: Windows.Services.Store.IStorePackageLicense
  IStorePackageLicense = interface;
  PIStorePackageLicense = ^IStorePackageLicense;

  // External: Windows.ApplicationModel.IPackage
  IPackage = interface;
  PIPackage = ^IPackage;

  // External: Windows.ApplicationModel.IPackageId
  IPackageId = interface;
  PIPackageId = ^IPackageId;

  // External: Windows.Storage.IStorageFolder
  IStorageFolder = interface;
  PIStorageFolder = ^IStorageFolder;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  IAsyncOperation_1__IStorageFile = interface;
  PIAsyncOperation_1__IStorageFile = ^IAsyncOperation_1__IStorageFile;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  AsyncOperationCompletedHandler_1__IStorageFile = interface;
  PAsyncOperationCompletedHandler_1__IStorageFile = ^AsyncOperationCompletedHandler_1__IStorageFile;

  // External: Windows.Storage.IStorageFile
  IStorageFile = interface;
  PIStorageFile = ^IStorageFile;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  IAsyncOperation_1__IRandomAccessStream = interface;
  PIAsyncOperation_1__IRandomAccessStream = ^IAsyncOperation_1__IRandomAccessStream;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStream>
  AsyncOperationCompletedHandler_1__IRandomAccessStream = interface;
  PAsyncOperationCompletedHandler_1__IRandomAccessStream = ^AsyncOperationCompletedHandler_1__IRandomAccessStream;

  // External: Windows.Storage.Streams.IRandomAccessStream
  IRandomAccessStream = interface;
  PIRandomAccessStream = ^IRandomAccessStream;

  // External: Windows.Storage.Streams.IInputStream
  IInputStream = interface;
  PIInputStream = ^IInputStream;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // External: Windows.Storage.Streams.IBuffer
  IBuffer = interface;
  PIBuffer = ^IBuffer;

  // External: Windows.Storage.Streams.IOutputStream
  IOutputStream = interface;
  PIOutputStream = ^IOutputStream;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // External: Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  IAsyncOperation_1__IStorageStreamTransaction = interface;
  PIAsyncOperation_1__IStorageStreamTransaction = ^IAsyncOperation_1__IStorageStreamTransaction;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  AsyncOperationCompletedHandler_1__IStorageStreamTransaction = interface;
  PAsyncOperationCompletedHandler_1__IStorageStreamTransaction = ^AsyncOperationCompletedHandler_1__IStorageStreamTransaction;

  // External: Windows.Storage.IStorageStreamTransaction
  IStorageStreamTransaction = interface;
  PIStorageStreamTransaction = ^IStorageStreamTransaction;

  // External: Windows.Foundation.IAsyncAction
  IAsyncAction = interface;
  PIAsyncAction = ^IAsyncAction;

  // External: Windows.Foundation.AsyncActionCompletedHandler
  AsyncActionCompletedHandler = interface;
  PAsyncActionCompletedHandler = ^AsyncActionCompletedHandler;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  IAsyncOperation_1__IStorageFolder = interface;
  PIAsyncOperation_1__IStorageFolder = ^IAsyncOperation_1__IStorageFolder;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  AsyncOperationCompletedHandler_1__IStorageFolder = interface;
  PAsyncOperationCompletedHandler_1__IStorageFolder = ^AsyncOperationCompletedHandler_1__IStorageFolder;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  IAsyncOperation_1__IStorageItem = interface;
  PIAsyncOperation_1__IStorageItem = ^IAsyncOperation_1__IStorageItem;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageItem>
  AsyncOperationCompletedHandler_1__IStorageItem = interface;
  PAsyncOperationCompletedHandler_1__IStorageItem = ^AsyncOperationCompletedHandler_1__IStorageItem;

  // External: Windows.Storage.IStorageItem
  IStorageItem = interface;
  PIStorageItem = ^IStorageItem;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  IAsyncOperation_1__FileProperties_IBasicProperties = interface;
  PIAsyncOperation_1__FileProperties_IBasicProperties = ^IAsyncOperation_1__FileProperties_IBasicProperties;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IBasicProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties;

  // External: Windows.Storage.FileProperties.IBasicProperties
  FileProperties_IBasicProperties = interface;
  PFileProperties_IBasicProperties = ^FileProperties_IBasicProperties;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  IAsyncOperation_1__IVectorView_1__IStorageFile = interface;
  PIAsyncOperation_1__IVectorView_1__IStorageFile = ^IAsyncOperation_1__IVectorView_1__IStorageFile;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  IVectorView_1__IStorageFile = interface;
  PIVectorView_1__IStorageFile = ^IVectorView_1__IStorageFile;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  IAsyncOperation_1__IVectorView_1__IStorageFolder = interface;
  PIAsyncOperation_1__IVectorView_1__IStorageFolder = ^IAsyncOperation_1__IVectorView_1__IStorageFolder;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  IVectorView_1__IStorageFolder = interface;
  PIVectorView_1__IStorageFolder = ^IVectorView_1__IStorageFolder;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  IAsyncOperation_1__IVectorView_1__IStorageItem = interface;
  PIAsyncOperation_1__IVectorView_1__IStorageItem = ^IAsyncOperation_1__IVectorView_1__IStorageItem;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  IVectorView_1__IStorageItem = interface;
  PIVectorView_1__IStorageItem = ^IVectorView_1__IStorageItem;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IPackage>
  IVectorView_1__IPackage = interface;
  PIVectorView_1__IPackage = ^IVectorView_1__IPackage;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Services.Store.IStoreContext,Object>
  TypedEventHandler_2__IStoreContext__IInspectable = interface;
  PTypedEventHandler_2__IStoreContext__IInspectable = ^TypedEventHandler_2__IStoreContext__IInspectable;

  // External: Windows.Services.Store.IStoreContext
  IStoreContext = interface;
  PIStoreContext = ^IStoreContext;

  // External: Windows.System.IUser
  IUser = interface;
  PIUser = ^IUser;

  // External: Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // External: Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  IAsyncOperation_1__IRandomAccessStreamReference = interface;
  PIAsyncOperation_1__IRandomAccessStreamReference = ^IAsyncOperation_1__IRandomAccessStreamReference;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  AsyncOperationCompletedHandler_1__IRandomAccessStreamReference = interface;
  PAsyncOperationCompletedHandler_1__IRandomAccessStreamReference = ^AsyncOperationCompletedHandler_1__IRandomAccessStreamReference;

  // External: Windows.Storage.Streams.IRandomAccessStreamReference
  IRandomAccessStreamReference = interface;
  PIRandomAccessStreamReference = ^IRandomAccessStreamReference;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  IAsyncOperation_1__IRandomAccessStreamWithContentType = interface;
  PIAsyncOperation_1__IRandomAccessStreamWithContentType = ^IAsyncOperation_1__IRandomAccessStreamWithContentType;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType = interface;
  PAsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType = ^AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType;

  // External: Windows.Storage.Streams.IRandomAccessStreamWithContentType
  IRandomAccessStreamWithContentType = interface;
  PIRandomAccessStreamWithContentType = ^IRandomAccessStreamWithContentType;

  // External: Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreAppLicense>
  IAsyncOperation_1__IStoreAppLicense = interface;
  PIAsyncOperation_1__IStoreAppLicense = ^IAsyncOperation_1__IStoreAppLicense;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreAppLicense>
  AsyncOperationCompletedHandler_1__IStoreAppLicense = interface;
  PAsyncOperationCompletedHandler_1__IStoreAppLicense = ^AsyncOperationCompletedHandler_1__IStoreAppLicense;

  // External: Windows.Services.Store.IStoreAppLicense
  IStoreAppLicense = interface;
  PIStoreAppLicense = ^IStoreAppLicense;

  // External: Windows.Foundation.Collections.IMapView`2<String,Windows.Services.Store.IStoreLicense>
  IMapView_2__HSTRING__IStoreLicense = interface;
  PIMapView_2__HSTRING__IStoreLicense = ^IMapView_2__HSTRING__IStoreLicense;

  // External: Windows.Services.Store.IStoreLicense
  IStoreLicense = interface;
  PIStoreLicense = ^IStoreLicense;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductResult>
  IAsyncOperation_1__IStoreProductResult = interface;
  PIAsyncOperation_1__IStoreProductResult = ^IAsyncOperation_1__IStoreProductResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductResult>
  AsyncOperationCompletedHandler_1__IStoreProductResult = interface;
  PAsyncOperationCompletedHandler_1__IStoreProductResult = ^AsyncOperationCompletedHandler_1__IStoreProductResult;

  // External: Windows.Services.Store.IStoreProductResult
  IStoreProductResult = interface;
  PIStoreProductResult = ^IStoreProductResult;

  // External: Windows.Services.Store.IStoreProduct
  IStoreProduct = interface;
  PIStoreProduct = ^IStoreProduct;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreImage>
  IVectorView_1__IStoreImage = interface;
  PIVectorView_1__IStoreImage = ^IVectorView_1__IStoreImage;

  // External: Windows.Services.Store.IStoreImage
  IStoreImage = interface;
  PIStoreImage = ^IStoreImage;

  // External: Windows.Foundation.IUriRuntimeClass
  IUriRuntimeClass = interface;
  PIUriRuntimeClass = ^IUriRuntimeClass;

  // External: Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  IWwwFormUrlDecoderRuntimeClass = interface;
  PIWwwFormUrlDecoderRuntimeClass = ^IWwwFormUrlDecoderRuntimeClass;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreVideo>
  IVectorView_1__IStoreVideo = interface;
  PIVectorView_1__IStoreVideo = ^IVectorView_1__IStoreVideo;

  // External: Windows.Services.Store.IStoreVideo
  IStoreVideo = interface;
  PIStoreVideo = ^IStoreVideo;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreSku>
  IVectorView_1__IStoreSku = interface;
  PIVectorView_1__IStoreSku = ^IVectorView_1__IStoreSku;

  // External: Windows.Services.Store.IStoreSku
  IStoreSku = interface;
  PIStoreSku = ^IStoreSku;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreAvailability>
  IVectorView_1__IStoreAvailability = interface;
  PIVectorView_1__IStoreAvailability = ^IVectorView_1__IStoreAvailability;

  // External: Windows.Services.Store.IStoreAvailability
  IStoreAvailability = interface;
  PIStoreAvailability = ^IStoreAvailability;

  // External: Windows.Services.Store.IStorePrice
  IStorePrice = interface;
  PIStorePrice = ^IStorePrice;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStorePurchaseResult>
  IAsyncOperation_1__IStorePurchaseResult = interface;
  PIAsyncOperation_1__IStorePurchaseResult = ^IAsyncOperation_1__IStorePurchaseResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStorePurchaseResult>
  AsyncOperationCompletedHandler_1__IStorePurchaseResult = interface;
  PAsyncOperationCompletedHandler_1__IStorePurchaseResult = ^AsyncOperationCompletedHandler_1__IStorePurchaseResult;

  // External: Windows.Services.Store.IStorePurchaseResult
  IStorePurchaseResult = interface;
  PIStorePurchaseResult = ^IStorePurchaseResult;

  // External: Windows.Services.Store.IStorePurchaseProperties
  IStorePurchaseProperties = interface;
  PIStorePurchaseProperties = ^IStorePurchaseProperties;

  // External: Windows.Services.Store.IStoreCollectionData
  IStoreCollectionData = interface;
  PIStoreCollectionData = ^IStoreCollectionData;

  // External: Windows.Services.Store.IStoreSubscriptionInfo
  IStoreSubscriptionInfo = interface;
  PIStoreSubscriptionInfo = ^IStoreSubscriptionInfo;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductQueryResult>
  IAsyncOperation_1__IStoreProductQueryResult = interface;
  PIAsyncOperation_1__IStoreProductQueryResult = ^IAsyncOperation_1__IStoreProductQueryResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductQueryResult>
  AsyncOperationCompletedHandler_1__IStoreProductQueryResult = interface;
  PAsyncOperationCompletedHandler_1__IStoreProductQueryResult = ^AsyncOperationCompletedHandler_1__IStoreProductQueryResult;

  // External: Windows.Services.Store.IStoreProductQueryResult
  IStoreProductQueryResult = interface;
  PIStoreProductQueryResult = ^IStoreProductQueryResult;

  // External: Windows.Foundation.Collections.IMapView`2<String,Windows.Services.Store.IStoreProduct>
  IMapView_2__HSTRING__IStoreProduct = interface;
  PIMapView_2__HSTRING__IStoreProduct = ^IMapView_2__HSTRING__IStoreProduct;

  // External: Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // External: Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductPagedQueryResult>
  IAsyncOperation_1__IStoreProductPagedQueryResult = interface;
  PIAsyncOperation_1__IStoreProductPagedQueryResult = ^IAsyncOperation_1__IStoreProductPagedQueryResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductPagedQueryResult>
  AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult = interface;
  PAsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult = ^AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult;

  // External: Windows.Services.Store.IStoreProductPagedQueryResult
  IStoreProductPagedQueryResult = interface;
  PIStoreProductPagedQueryResult = ^IStoreProductPagedQueryResult;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreConsumableResult>
  IAsyncOperation_1__IStoreConsumableResult = interface;
  PIAsyncOperation_1__IStoreConsumableResult = ^IAsyncOperation_1__IStoreConsumableResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreConsumableResult>
  AsyncOperationCompletedHandler_1__IStoreConsumableResult = interface;
  PAsyncOperationCompletedHandler_1__IStoreConsumableResult = ^AsyncOperationCompletedHandler_1__IStoreConsumableResult;

  // External: Windows.Services.Store.IStoreConsumableResult
  IStoreConsumableResult = interface;
  PIStoreConsumableResult = ^IStoreConsumableResult;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreAcquireLicenseResult>
  IAsyncOperation_1__IStoreAcquireLicenseResult = interface;
  PIAsyncOperation_1__IStoreAcquireLicenseResult = ^IAsyncOperation_1__IStoreAcquireLicenseResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreAcquireLicenseResult>
  AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult = interface;
  PAsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult = ^AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult;

  // External: Windows.Services.Store.IStoreAcquireLicenseResult
  IStoreAcquireLicenseResult = interface;
  PIStoreAcquireLicenseResult = ^IStoreAcquireLicenseResult;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>>
  IAsyncOperation_1__IVectorView_1__IStorePackageUpdate = interface;
  PIAsyncOperation_1__IVectorView_1__IStorePackageUpdate = ^IAsyncOperation_1__IVectorView_1__IStorePackageUpdate;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate = ^AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>
  IVectorView_1__IStorePackageUpdate = interface;
  PIVectorView_1__IStorePackageUpdate = ^IVectorView_1__IStorePackageUpdate;

  // External: Windows.Services.Store.IStorePackageUpdate
  IStorePackageUpdate = interface;
  PIStorePackageUpdate = ^IStorePackageUpdate;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus = interface;
  PIAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus = ^IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus = interface;
  PAsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus = ^AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus = ^AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus;

  // External: Windows.Services.Store.IStorePackageUpdateResult
  IStorePackageUpdateResult = interface;
  PIStorePackageUpdateResult = ^IStorePackageUpdateResult;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.StorePackageUpdateStatus>
  IVectorView_1__StorePackageUpdateStatus = interface;
  PIVectorView_1__StorePackageUpdateStatus = ^IVectorView_1__StorePackageUpdateStatus;

  // External: Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStorePackageUpdate>
  IIterable_1__IStorePackageUpdate = interface;
  PIIterable_1__IStorePackageUpdate = ^IIterable_1__IStorePackageUpdate;

  // External: Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStorePackageUpdate>
  IIterator_1__IStorePackageUpdate = interface;
  PIIterator_1__IStorePackageUpdate = ^IIterator_1__IStorePackageUpdate;

  // External: Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // External: Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface;
  PTypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = ^TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable;

  // External: Windows.Storage.Search.IStorageQueryResultBase
  Search_IStorageQueryResultBase = interface;
  PSearch_IStorageQueryResultBase = ^Search_IStorageQueryResultBase;

  // External: Windows.Storage.Search.IQueryOptions
  Search_IQueryOptions = interface;
  PSearch_IQueryOptions = ^Search_IQueryOptions;

  // External: Windows.Foundation.Collections.IVector`1<Windows.Storage.Search.SortEntry>
  IVector_1__Search_SortEntry = interface;
  PIVector_1__Search_SortEntry = ^IVector_1__Search_SortEntry;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.SortEntry>
  IVectorView_1__Search_SortEntry = interface;
  PIVectorView_1__Search_SortEntry = ^IVectorView_1__Search_SortEntry;

  // External: Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface;
  PIAsyncOperationWithProgress_2__UInt64__UInt64 = ^IAsyncOperationWithProgress_2__UInt64__UInt64;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationProgressHandler_2__UInt64__UInt64 = ^AsyncOperationProgressHandler_2__UInt64__UInt64;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64;

  // External: Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
  RemoteSystems_IRemoteSystemConnectionRequest = interface;
  PRemoteSystems_IRemoteSystemConnectionRequest = ^RemoteSystems_IRemoteSystemConnectionRequest;

  // External: Windows.System.RemoteSystems.IRemoteSystem
  RemoteSystems_IRemoteSystem = interface;
  PRemoteSystems_IRemoteSystem = ^RemoteSystems_IRemoteSystem;

  // External: Windows.System.IDispatcherQueueTimer
  IDispatcherQueueTimer = interface;
  PIDispatcherQueueTimer = ^IDispatcherQueueTimer;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable = ^TypedEventHandler_2__IDispatcherQueueTimer__IInspectable;

  // External: Windows.System.IDispatcherQueue
  IDispatcherQueue = interface;
  PIDispatcherQueue = ^IDispatcherQueue;

  // External: Windows.System.DispatcherQueueHandler
  DispatcherQueueHandler = interface;
  PDispatcherQueueHandler = ^DispatcherQueueHandler;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Windows.System.IDispatcherQueueShutdownStartingEventArgs>
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = interface;
  PTypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = ^TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs;

  // External: Windows.System.IDispatcherQueueShutdownStartingEventArgs
  IDispatcherQueueShutdownStartingEventArgs = interface;
  PIDispatcherQueueShutdownStartingEventArgs = ^IDispatcherQueueShutdownStartingEventArgs;

  // External: Windows.Foundation.IDeferral
  IDeferral = interface;
  PIDeferral = ^IDeferral;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueue__IInspectable = ^TypedEventHandler_2__IDispatcherQueue__IInspectable;

  // External: Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // External: Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__HSTRING = ^IKeyValuePair_2__HSTRING__HSTRING;

  // External: Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__HSTRING;

  // External: Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface;
  PIMapView_2__HSTRING__HSTRING = ^IMapView_2__HSTRING__HSTRING;

  // External: Windows.Foundation.Collections.IIterator`1<Guid>
  IIterator_1__TGuid = interface;
  PIIterator_1__TGuid = ^IIterator_1__TGuid;

  // External: Windows.Foundation.Collections.IVectorView`1<Guid>
  IVectorView_1__TGuid = interface;
  PIVectorView_1__TGuid = ^IVectorView_1__TGuid;

  // External: Windows.ApplicationModel.IAppDisplayInfo
  IAppDisplayInfo = interface;
  PIAppDisplayInfo = ^IAppDisplayInfo;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Core.ICoreApplicationView,Windows.ApplicationModel.Activation.IActivatedEventArgs>
  TypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs = interface;
  PTypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs = ^TypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs;

  // External: Windows.ApplicationModel.Core.ICoreApplicationView
  ICoreApplicationView = interface;
  PICoreApplicationView = ^ICoreApplicationView;

  // External: Windows.UI.Core.ICoreWindow
  ICoreWindow = interface;
  PICoreWindow = ^ICoreWindow;

  // External: Windows.UI.Core.ICoreDispatcher
  ICoreDispatcher = interface;
  PICoreDispatcher = ^ICoreDispatcher;

  // External: Windows.UI.Core.DispatchedHandler
  DispatchedHandler = interface;
  PDispatchedHandler = ^DispatchedHandler;

  // External: Windows.UI.Core.IdleDispatchedHandler
  IdleDispatchedHandler = interface;
  PIdleDispatchedHandler = ^IdleDispatchedHandler;

  // External: Windows.UI.Core.IIdleDispatchedHandlerArgs
  IIdleDispatchedHandlerArgs = interface;
  PIIdleDispatchedHandlerArgs = ^IIdleDispatchedHandlerArgs;

  // External: Windows.UI.Core.ICoreCursor
  ICoreCursor = interface;
  PICoreCursor = ^ICoreCursor;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IWindowActivatedEventArgs>
  TypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs = ^TypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs;

  // External: Windows.UI.Core.IWindowActivatedEventArgs
  IWindowActivatedEventArgs = interface;
  PIWindowActivatedEventArgs = ^IWindowActivatedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IAutomationProviderRequestedEventArgs>
  TypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs = ^TypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs;

  // External: Windows.UI.Core.IAutomationProviderRequestedEventArgs
  IAutomationProviderRequestedEventArgs = interface;
  PIAutomationProviderRequestedEventArgs = ^IAutomationProviderRequestedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ICharacterReceivedEventArgs>
  TypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs = ^TypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs;

  // External: Windows.UI.Core.ICharacterReceivedEventArgs
  ICharacterReceivedEventArgs = interface;
  PICharacterReceivedEventArgs = ^ICharacterReceivedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ICoreWindowEventArgs>
  TypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs = ^TypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs;

  // External: Windows.UI.Core.ICoreWindowEventArgs
  ICoreWindowEventArgs = interface;
  PICoreWindowEventArgs = ^ICoreWindowEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IInputEnabledEventArgs>
  TypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs = ^TypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs;

  // External: Windows.UI.Core.IInputEnabledEventArgs
  IInputEnabledEventArgs = interface;
  PIInputEnabledEventArgs = ^IInputEnabledEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IKeyEventArgs>
  TypedEventHandler_2__ICoreWindow__IKeyEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IKeyEventArgs = ^TypedEventHandler_2__ICoreWindow__IKeyEventArgs;

  // External: Windows.UI.Core.IKeyEventArgs
  IKeyEventArgs = interface;
  PIKeyEventArgs = ^IKeyEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__ICoreWindow__IPointerEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IPointerEventArgs = ^TypedEventHandler_2__ICoreWindow__IPointerEventArgs;

  // External: Windows.UI.Core.IPointerEventArgs
  IPointerEventArgs = interface;
  PIPointerEventArgs = ^IPointerEventArgs;

  // External: Windows.UI.Input.IPointerPoint
  IPointerPoint = interface;
  PIPointerPoint = ^IPointerPoint;

  // External: Windows.Devices.Input.IPointerDevice
  Input_IPointerDevice = interface;
  PInput_IPointerDevice = ^Input_IPointerDevice;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Input.PointerDeviceUsage>
  IVectorView_1__Input_PointerDeviceUsage = interface;
  PIVectorView_1__Input_PointerDeviceUsage = ^IVectorView_1__Input_PointerDeviceUsage;

  // External: Windows.UI.Input.IPointerPointProperties
  IPointerPointProperties = interface;
  PIPointerPointProperties = ^IPointerPointProperties;

  // External: Windows.Foundation.Collections.IVector`1<Windows.UI.Input.IPointerPoint>
  IVector_1__IPointerPoint = interface;
  PIVector_1__IPointerPoint = ^IVector_1__IPointerPoint;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.IPointerPoint>
  IVectorView_1__IPointerPoint = interface;
  PIVectorView_1__IPointerPoint = ^IVectorView_1__IPointerPoint;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ITouchHitTestingEventArgs>
  TypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs = ^TypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs;

  // External: Windows.UI.Core.ITouchHitTestingEventArgs
  ITouchHitTestingEventArgs = interface;
  PITouchHitTestingEventArgs = ^ITouchHitTestingEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IWindowSizeChangedEventArgs>
  TypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs = ^TypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs;

  // External: Windows.UI.Core.IWindowSizeChangedEventArgs
  IWindowSizeChangedEventArgs = interface;
  PIWindowSizeChangedEventArgs = ^IWindowSizeChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IVisibilityChangedEventArgs>
  TypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs = interface;
  PTypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs = ^TypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs;

  // External: Windows.UI.Core.IVisibilityChangedEventArgs
  IVisibilityChangedEventArgs = interface;
  PIVisibilityChangedEventArgs = ^IVisibilityChangedEventArgs;

  // External: Windows.ApplicationModel.Activation.IActivatedEventArgs
  Activation_IActivatedEventArgs = interface;
  PActivation_IActivatedEventArgs = ^Activation_IActivatedEventArgs;

  // External: Windows.ApplicationModel.Activation.ISplashScreen
  Activation_ISplashScreen = interface;
  PActivation_ISplashScreen = ^Activation_ISplashScreen;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface;
  PTypedEventHandler_2__Activation_ISplashScreen__IInspectable = ^TypedEventHandler_2__Activation_ISplashScreen__IInspectable;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Object>
  TypedEventHandler_2__IDataPackage__IInspectable = interface;
  PTypedEventHandler_2__IDataPackage__IInspectable = ^TypedEventHandler_2__IDataPackage__IInspectable;

  // External: Windows.ApplicationModel.DataTransfer.IDataPackage
  IDataPackage = interface;
  PIDataPackage = ^IDataPackage;

  // External: Windows.ApplicationModel.DataTransfer.IDataPackageView
  IDataPackageView = interface;
  PIDataPackageView = ^IDataPackageView;

  // External: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView
  IDataPackagePropertySetView = interface;
  PIDataPackagePropertySetView = ^IDataPackagePropertySetView;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  IAsyncOperation_1__IUriRuntimeClass = interface;
  PIAsyncOperation_1__IUriRuntimeClass = ^IAsyncOperation_1__IUriRuntimeClass;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IUriRuntimeClass>
  AsyncOperationCompletedHandler_1__IUriRuntimeClass = interface;
  PAsyncOperationCompletedHandler_1__IUriRuntimeClass = ^AsyncOperationCompletedHandler_1__IUriRuntimeClass;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>>
  IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference = interface;
  PIAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference = ^IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>>
  AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference = interface;
  PAsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference = ^AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference;

  // External: Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>
  IMapView_2__HSTRING__IRandomAccessStreamReference = interface;
  PIMapView_2__HSTRING__IRandomAccessStreamReference = ^IMapView_2__HSTRING__IRandomAccessStreamReference;

  // External: Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet
  IDataPackagePropertySet = interface;
  PIDataPackagePropertySet = ^IDataPackagePropertySet;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs>
  TypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs = interface;
  PTypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs = ^TypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs;

  // External: Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs
  IOperationCompletedEventArgs = interface;
  PIOperationCompletedEventArgs = ^IOperationCompletedEventArgs;

  // External: Windows.ApplicationModel.DataTransfer.DataProviderHandler
  DataProviderHandler = interface;
  PDataProviderHandler = ^DataProviderHandler;

  // External: Windows.ApplicationModel.DataTransfer.IDataProviderRequest
  IDataProviderRequest = interface;
  PIDataProviderRequest = ^IDataProviderRequest;

  // External: Windows.ApplicationModel.DataTransfer.IDataProviderDeferral
  IDataProviderDeferral = interface;
  PIDataProviderDeferral = ^IDataProviderDeferral;

  // External: Windows.Foundation.Collections.IMap`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>
  IMap_2__HSTRING__IRandomAccessStreamReference = interface;
  PIMap_2__HSTRING__IRandomAccessStreamReference = ^IMap_2__HSTRING__IRandomAccessStreamReference;

  // External: Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageItem>
  IIterable_1__IStorageItem = interface;
  PIIterable_1__IStorageItem = ^IIterable_1__IStorageItem;

  // External: Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageItem>
  IIterator_1__IStorageItem = interface;
  PIIterator_1__IStorageItem = ^IIterator_1__IStorageItem;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable = ^TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
  GenericAttributeProfile_IGattSession = interface;
  PGenericAttributeProfile_IGattSession = ^GenericAttributeProfile_IGattSession;

  // External: Windows.Devices.Bluetooth.IBluetoothDeviceId
  IBluetoothDeviceId = interface;
  PIBluetoothDeviceId = ^IBluetoothDeviceId;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs
  GenericAttributeProfile_IGattSessionStatusChangedEventArgs = interface;
  PGenericAttributeProfile_IGattSessionStatusChangedEventArgs = ^GenericAttributeProfile_IGattSessionStatusChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable = ^TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
  GenericAttributeProfile_IGattSubscribedClient = interface;
  PGenericAttributeProfile_IGattSubscribedClient = ^GenericAttributeProfile_IGattSubscribedClient;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable = ^TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
  GenericAttributeProfile_IGattLocalCharacteristic = interface;
  PGenericAttributeProfile_IGattLocalCharacteristic = ^GenericAttributeProfile_IGattLocalCharacteristic;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult
  GenericAttributeProfile_IGattLocalDescriptorResult = interface;
  PGenericAttributeProfile_IGattLocalDescriptorResult = ^GenericAttributeProfile_IGattLocalDescriptorResult;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
  GenericAttributeProfile_IGattLocalDescriptor = interface;
  PGenericAttributeProfile_IGattLocalDescriptor = ^GenericAttributeProfile_IGattLocalDescriptor;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs
  GenericAttributeProfile_IGattReadRequestedEventArgs = interface;
  PGenericAttributeProfile_IGattReadRequestedEventArgs = ^GenericAttributeProfile_IGattReadRequestedEventArgs;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest>
  IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattReadRequest = ^IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest
  GenericAttributeProfile_IGattReadRequest = interface;
  PGenericAttributeProfile_IGattReadRequest = ^GenericAttributeProfile_IGattReadRequest;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs
  GenericAttributeProfile_IGattRequestStateChangedEventArgs = interface;
  PGenericAttributeProfile_IGattRequestStateChangedEventArgs = ^GenericAttributeProfile_IGattRequestStateChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs
  GenericAttributeProfile_IGattWriteRequestedEventArgs = interface;
  PGenericAttributeProfile_IGattWriteRequestedEventArgs = ^GenericAttributeProfile_IGattWriteRequestedEventArgs;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest>
  IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest = ^IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest
  GenericAttributeProfile_IGattWriteRequest = interface;
  PGenericAttributeProfile_IGattWriteRequest = ^GenericAttributeProfile_IGattWriteRequest;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters
  GenericAttributeProfile_IGattLocalDescriptorParameters = interface;
  PGenericAttributeProfile_IGattLocalDescriptorParameters = ^GenericAttributeProfile_IGattLocalDescriptorParameters;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IVectorView_1__GenericAttributeProfile_IGattLocalDescriptor = interface;
  PIVectorView_1__GenericAttributeProfile_IGattLocalDescriptor = ^IVectorView_1__GenericAttributeProfile_IGattLocalDescriptor;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IVectorView_1__GenericAttributeProfile_IGattPresentationFormat = interface;
  PIVectorView_1__GenericAttributeProfile_IGattPresentationFormat = ^IVectorView_1__GenericAttributeProfile_IGattPresentationFormat;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
  GenericAttributeProfile_IGattPresentationFormat = interface;
  PGenericAttributeProfile_IGattPresentationFormat = ^GenericAttributeProfile_IGattPresentationFormat;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IVectorView_1__GenericAttributeProfile_IGattSubscribedClient = interface;
  PIVectorView_1__GenericAttributeProfile_IGattSubscribedClient = ^IVectorView_1__GenericAttributeProfile_IGattSubscribedClient;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>>
  IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PIAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = ^IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>>
  AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = ^AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PIVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = ^IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult
  GenericAttributeProfile_IGattClientNotificationResult = interface;
  PGenericAttributeProfile_IGattClientNotificationResult = ^GenericAttributeProfile_IGattClientNotificationResult;

  // External: Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.IBluetoothLEDevice,Object>
  TypedEventHandler_2__IBluetoothLEDevice__IInspectable = interface;
  PTypedEventHandler_2__IBluetoothLEDevice__IInspectable = ^TypedEventHandler_2__IBluetoothLEDevice__IInspectable;

  // External: Windows.Devices.Bluetooth.IBluetoothLEDevice
  IBluetoothLEDevice = interface;
  PIBluetoothLEDevice = ^IBluetoothLEDevice;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IVectorView_1__GenericAttributeProfile_IGattDeviceService = interface;
  PIVectorView_1__GenericAttributeProfile_IGattDeviceService = ^IVectorView_1__GenericAttributeProfile_IGattDeviceService;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
  GenericAttributeProfile_IGattDeviceService = interface;
  PGenericAttributeProfile_IGattDeviceService = ^GenericAttributeProfile_IGattDeviceService;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IVectorView_1__GenericAttributeProfile_IGattCharacteristic = interface;
  PIVectorView_1__GenericAttributeProfile_IGattCharacteristic = ^IVectorView_1__GenericAttributeProfile_IGattCharacteristic;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
  GenericAttributeProfile_IGattCharacteristic = interface;
  PGenericAttributeProfile_IGattCharacteristic = ^GenericAttributeProfile_IGattCharacteristic;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IVectorView_1__GenericAttributeProfile_IGattDescriptor = interface;
  PIVectorView_1__GenericAttributeProfile_IGattDescriptor = ^IVectorView_1__GenericAttributeProfile_IGattDescriptor;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
  GenericAttributeProfile_IGattDescriptor = interface;
  PGenericAttributeProfile_IGattDescriptor = ^GenericAttributeProfile_IGattDescriptor;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattReadResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattReadResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattReadResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult
  GenericAttributeProfile_IGattReadResult = interface;
  PGenericAttributeProfile_IGattReadResult = ^GenericAttributeProfile_IGattReadResult;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus = interface;
  PIAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus = ^IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult
  GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = interface;
  PGenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = ^GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs;

  // External: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
  GenericAttributeProfile_IGattValueChangedEventArgs = interface;
  PGenericAttributeProfile_IGattValueChangedEventArgs = ^GenericAttributeProfile_IGattValueChangedEventArgs;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.IRadio>
  IAsyncOperation_1__Radios_IRadio = interface;
  PIAsyncOperation_1__Radios_IRadio = ^IAsyncOperation_1__Radios_IRadio;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Radios.IRadio>
  AsyncOperationCompletedHandler_1__Radios_IRadio = interface;
  PAsyncOperationCompletedHandler_1__Radios_IRadio = ^AsyncOperationCompletedHandler_1__Radios_IRadio;

  // External: Windows.Devices.Radios.IRadio
  Radios_IRadio = interface;
  PRadios_IRadio = ^Radios_IRadio;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.RadioAccessStatus>
  IAsyncOperation_1__Radios_RadioAccessStatus = interface;
  PIAsyncOperation_1__Radios_RadioAccessStatus = ^IAsyncOperation_1__Radios_RadioAccessStatus;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Radios.RadioAccessStatus>
  AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__Radios_RadioAccessStatus = ^AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Radios.IRadio,Object>
  TypedEventHandler_2__Radios_IRadio__IInspectable = interface;
  PTypedEventHandler_2__Radios_IRadio__IInspectable = ^TypedEventHandler_2__Radios_IRadio__IInspectable;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.IBluetoothDevice,Object>
  TypedEventHandler_2__IBluetoothDevice__IInspectable = interface;
  PTypedEventHandler_2__IBluetoothDevice__IInspectable = ^TypedEventHandler_2__IBluetoothDevice__IInspectable;

  // External: Windows.Devices.Bluetooth.IBluetoothDevice
  IBluetoothDevice = interface;
  PIBluetoothDevice = ^IBluetoothDevice;

  // External: Windows.Networking.IHostName
  IHostName = interface;
  PIHostName = ^IHostName;

  // External: Windows.Networking.Connectivity.IIPInformation
  IIPInformation = interface;
  PIIPInformation = ^IIPInformation;

  // External: Windows.Networking.Connectivity.INetworkAdapter
  INetworkAdapter = interface;
  PINetworkAdapter = ^INetworkAdapter;

  // External: Windows.Networking.Connectivity.INetworkItem
  INetworkItem = interface;
  PINetworkItem = ^INetworkItem;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Networking.Connectivity.IConnectionProfile>
  IAsyncOperation_1__IConnectionProfile = interface;
  PIAsyncOperation_1__IConnectionProfile = ^IAsyncOperation_1__IConnectionProfile;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Connectivity.IConnectionProfile>
  AsyncOperationCompletedHandler_1__IConnectionProfile = interface;
  PAsyncOperationCompletedHandler_1__IConnectionProfile = ^AsyncOperationCompletedHandler_1__IConnectionProfile;

  // External: Windows.Networking.Connectivity.IConnectionProfile
  IConnectionProfile = interface;
  PIConnectionProfile = ^IConnectionProfile;

  // External: Windows.Networking.Connectivity.IConnectionCost
  IConnectionCost = interface;
  PIConnectionCost = ^IConnectionCost;

  // External: Windows.Networking.Connectivity.IDataPlanStatus
  IDataPlanStatus = interface;
  PIDataPlanStatus = ^IDataPlanStatus;

  // External: Windows.Networking.Connectivity.IDataPlanUsage
  IDataPlanUsage = interface;
  PIDataPlanUsage = ^IDataPlanUsage;

  // External: Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  IReference_1__DateTime = interface;
  PIReference_1__DateTime = ^IReference_1__DateTime;

  // External: Windows.Networking.Connectivity.IDataUsage
  IDataUsage = interface;
  PIDataUsage = ^IDataUsage;

  // External: Windows.Networking.Connectivity.INetworkSecuritySettings
  INetworkSecuritySettings = interface;
  PINetworkSecuritySettings = ^INetworkSecuritySettings;

  // External: Windows.Devices.Bluetooth.IBluetoothClassOfDevice
  IBluetoothClassOfDevice = interface;
  PIBluetoothClassOfDevice = ^IBluetoothClassOfDevice;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Streams.IBuffer>
  IVectorView_1__IBuffer = interface;
  PIVectorView_1__IBuffer = ^IVectorView_1__IBuffer;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IVectorView_1__Rfcomm_IRfcommDeviceService = interface;
  PIVectorView_1__Rfcomm_IRfcommDeviceService = ^IVectorView_1__Rfcomm_IRfcommDeviceService;

  // External: Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
  Rfcomm_IRfcommDeviceService = interface;
  PRfcomm_IRfcommDeviceService = ^Rfcomm_IRfcommDeviceService;

  // External: Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  Rfcomm_IRfcommServiceId = interface;
  PRfcomm_IRfcommServiceId = ^Rfcomm_IRfcommServiceId;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>>
  IAsyncOperation_1__IMapView_2__Cardinal__IBuffer = interface;
  PIAsyncOperation_1__IMapView_2__Cardinal__IBuffer = ^IAsyncOperation_1__IMapView_2__Cardinal__IBuffer;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>>
  AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer = interface;
  PAsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer = ^AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer;

  // External: Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>
  IMapView_2__Cardinal__IBuffer = interface;
  PIMapView_2__Cardinal__IBuffer = ^IMapView_2__Cardinal__IBuffer;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Object>
  TypedEventHandler_2__IDeviceWatcher__IInspectable = interface;
  PTypedEventHandler_2__IDeviceWatcher__IInspectable = ^TypedEventHandler_2__IDeviceWatcher__IInspectable;

  // External: Windows.Devices.Enumeration.IDeviceWatcher
  IDeviceWatcher = interface;
  PIDeviceWatcher = ^IDeviceWatcher;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Windows.Devices.Enumeration.IDeviceInformation>
  TypedEventHandler_2__IDeviceWatcher__IDeviceInformation = interface;
  PTypedEventHandler_2__IDeviceWatcher__IDeviceInformation = ^TypedEventHandler_2__IDeviceWatcher__IDeviceInformation;

  // External: Windows.Devices.Enumeration.IDeviceInformation
  IDeviceInformation = interface;
  PIDeviceInformation = ^IDeviceInformation;

  // External: Windows.Devices.Enumeration.IEnclosureLocation
  IEnclosureLocation = interface;
  PIEnclosureLocation = ^IEnclosureLocation;

  // External: Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable = interface;
  PIMapView_2__HSTRING__IInspectable = ^IMapView_2__HSTRING__IInspectable;

  // External: Windows.Devices.Enumeration.IDeviceInformationUpdate
  IDeviceInformationUpdate = interface;
  PIDeviceInformationUpdate = ^IDeviceInformationUpdate;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Windows.Devices.Enumeration.IDeviceInformationUpdate>
  TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate = interface;
  PTypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate = ^TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Object>
  TypedEventHandler_2__IDevicePicker__IInspectable = interface;
  PTypedEventHandler_2__IDevicePicker__IInspectable = ^TypedEventHandler_2__IDevicePicker__IInspectable;

  // External: Windows.Devices.Enumeration.IDevicePicker
  IDevicePicker = interface;
  PIDevicePicker = ^IDevicePicker;

  // External: Windows.Devices.Enumeration.IDevicePickerFilter
  IDevicePickerFilter = interface;
  PIDevicePickerFilter = ^IDevicePickerFilter;

  // External: Windows.Foundation.Collections.IVector`1<Windows.Devices.Enumeration.DeviceClass>
  IVector_1__DeviceClass = interface;
  PIVector_1__DeviceClass = ^IVector_1__DeviceClass;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Enumeration.DeviceClass>
  IVectorView_1__DeviceClass = interface;
  PIVectorView_1__DeviceClass = ^IVectorView_1__DeviceClass;

  // External: Windows.Devices.Enumeration.IDevicePickerAppearance
  IDevicePickerAppearance = interface;
  PIDevicePickerAppearance = ^IDevicePickerAppearance;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Windows.Devices.Enumeration.IDeviceSelectedEventArgs>
  TypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs = interface;
  PTypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs = ^TypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs;

  // External: Windows.Devices.Enumeration.IDeviceSelectedEventArgs
  IDeviceSelectedEventArgs = interface;
  PIDeviceSelectedEventArgs = ^IDeviceSelectedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs>
  TypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs = interface;
  PTypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs = ^TypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs;

  // External: Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs
  IDeviceDisconnectButtonClickedEventArgs = interface;
  PIDeviceDisconnectButtonClickedEventArgs = ^IDeviceDisconnectButtonClickedEventArgs;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.IDeviceInformation>
  IAsyncOperation_1__IDeviceInformation = interface;
  PIAsyncOperation_1__IDeviceInformation = ^IAsyncOperation_1__IDeviceInformation;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Enumeration.IDeviceInformation>
  AsyncOperationCompletedHandler_1__IDeviceInformation = interface;
  PAsyncOperationCompletedHandler_1__IDeviceInformation = ^AsyncOperationCompletedHandler_1__IDeviceInformation;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Object>
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable = interface;
  PTypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable = ^TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable;

  // External: Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
  Pnp_IPnpObjectWatcher = interface;
  PPnp_IPnpObjectWatcher = ^Pnp_IPnpObjectWatcher;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Windows.Devices.Enumeration.Pnp.IPnpObject>
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject = interface;
  PTypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject = ^TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject;

  // External: Windows.Devices.Enumeration.Pnp.IPnpObject
  Pnp_IPnpObject = interface;
  PPnp_IPnpObject = ^Pnp_IPnpObject;

  // External: Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
  Pnp_IPnpObjectUpdate = interface;
  PPnp_IPnpObjectUpdate = ^Pnp_IPnpObjectUpdate;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate>
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate = interface;
  PTypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate = ^TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate;

  // External: Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface;
  PIVectorView_1__Cardinal = ^IVectorView_1__Cardinal;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.ICashDrawerCloseAlarm,Object>
  TypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable = interface;
  PTypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable = ^TypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable;

  // External: Windows.Devices.PointOfService.ICashDrawerCloseAlarm
  ICashDrawerCloseAlarm = interface;
  PICashDrawerCloseAlarm = ^ICashDrawerCloseAlarm;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.IClaimedLineDisplay,Object>
  TypedEventHandler_2__IClaimedLineDisplay__IInspectable = interface;
  PTypedEventHandler_2__IClaimedLineDisplay__IInspectable = ^TypedEventHandler_2__IClaimedLineDisplay__IInspectable;

  // External: Windows.Devices.PointOfService.IClaimedLineDisplay
  IClaimedLineDisplay = interface;
  PIClaimedLineDisplay = ^IClaimedLineDisplay;

  // External: Windows.Devices.PointOfService.ILineDisplayCapabilities
  ILineDisplayCapabilities = interface;
  PILineDisplayCapabilities = ^ILineDisplayCapabilities;

  // External: Windows.Devices.PointOfService.ILineDisplayWindow
  ILineDisplayWindow = interface;
  PILineDisplayWindow = ^ILineDisplayWindow;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.IClaimedCashDrawer,Object>
  TypedEventHandler_2__IClaimedCashDrawer__IInspectable = interface;
  PTypedEventHandler_2__IClaimedCashDrawer__IInspectable = ^TypedEventHandler_2__IClaimedCashDrawer__IInspectable;

  // External: Windows.Devices.PointOfService.IClaimedCashDrawer
  IClaimedCashDrawer = interface;
  PIClaimedCashDrawer = ^IClaimedCashDrawer;

  // External: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__HSTRING;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal = ^IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal = ^AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal;

  // External: Windows.Devices.Scanners.IImageScannerScanResult
  IImageScannerScanResult = interface;
  PIImageScannerScanResult = ^IImageScannerScanResult;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsDevice2,Object>
  TypedEventHandler_2__ISmsDevice2__IInspectable = interface;
  PTypedEventHandler_2__ISmsDevice2__IInspectable = ^TypedEventHandler_2__ISmsDevice2__IInspectable;

  // External: Windows.Devices.Sms.ISmsDevice2
  ISmsDevice2 = interface;
  PISmsDevice2 = ^ISmsDevice2;

  // External: Windows.Devices.Sms.ISmsMessageBase
  ISmsMessageBase = interface;
  PISmsMessageBase = ^ISmsMessageBase;

  // External: Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsSendMessageResult>
  IAsyncOperation_1__ISmsSendMessageResult = interface;
  PIAsyncOperation_1__ISmsSendMessageResult = ^IAsyncOperation_1__ISmsSendMessageResult;

  // External: Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsSendMessageResult>
  AsyncOperationCompletedHandler_1__ISmsSendMessageResult = interface;
  PAsyncOperationCompletedHandler_1__ISmsSendMessageResult = ^AsyncOperationCompletedHandler_1__ISmsSendMessageResult;

  // External: Windows.Devices.Sms.ISmsSendMessageResult
  ISmsSendMessageResult = interface;
  PISmsSendMessageResult = ^ISmsSendMessageResult;

  // External: Windows.Foundation.Collections.IVectorView`1<Int32>
  IVectorView_1__Integer = interface;
  PIVectorView_1__Integer = ^IVectorView_1__Integer;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer = interface;
  PIAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer = ^IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer = interface;
  PAsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer = ^AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer = ^AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>
  IVectorView_1__ISmsMessage = interface;
  PIVectorView_1__ISmsMessage = ^IVectorView_1__ISmsMessage;

  // External: Windows.Devices.Sms.ISmsMessage
  ISmsMessage = interface;
  PISmsMessage = ^ISmsMessage;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Gaming.Input.IGameController,Windows.System.IUserChangedEventArgs>
  TypedEventHandler_2__Input_IGameController__IUserChangedEventArgs = interface;
  PTypedEventHandler_2__Input_IGameController__IUserChangedEventArgs = ^TypedEventHandler_2__Input_IGameController__IUserChangedEventArgs;

  // External: Windows.Gaming.Input.IGameController
  Input_IGameController = interface;
  PInput_IGameController = ^Input_IGameController;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Gaming.Input.IGameController,Windows.Gaming.Input.IHeadset>
  TypedEventHandler_2__Input_IGameController__Input_IHeadset = interface;
  PTypedEventHandler_2__Input_IGameController__Input_IHeadset = ^TypedEventHandler_2__Input_IGameController__Input_IHeadset;

  // External: Windows.Gaming.Input.IHeadset
  Input_IHeadset = interface;
  PInput_IHeadset = ^Input_IHeadset;

  // External: Windows.System.IUserChangedEventArgs
  IUserChangedEventArgs = interface;
  PIUserChangedEventArgs = ^IUserChangedEventArgs;

  // External: Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // External: Windows.Foundation.Collections.IVectorChangedEventArgs
  IVectorChangedEventArgs = interface;
  PIVectorChangedEventArgs = ^IVectorChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackItem,Windows.Foundation.Collections.IVectorChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs;

  // External: Windows.Media.Playback.IMediaPlaybackItem
  Playback_IMediaPlaybackItem = interface;
  PPlayback_IMediaPlaybackItem = ^Playback_IMediaPlaybackItem;

  // External: Windows.Media.Core.IMediaSource2
  Core_IMediaSource2 = interface;
  PCore_IMediaSource2 = ^Core_IMediaSource2;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaSource2,Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs>
  TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceOpenOperationCompletedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceOpenOperationCompletedEventArgs = ^TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceOpenOperationCompletedEventArgs;

  // External: Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs
  Core_IMediaSourceOpenOperationCompletedEventArgs = interface;
  PCore_IMediaSourceOpenOperationCompletedEventArgs = ^Core_IMediaSourceOpenOperationCompletedEventArgs;

  // External: Windows.Media.Core.IMediaSourceError
  Core_IMediaSourceError = interface;
  PCore_IMediaSourceError = ^Core_IMediaSourceError;

  // External: Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  IReference_1__TimeSpan = interface;
  PIReference_1__TimeSpan = ^IReference_1__TimeSpan;

  // External: Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Core.ITimedTextSource>
  IObservableVector_1__Core_ITimedTextSource = interface;
  PIObservableVector_1__Core_ITimedTextSource = ^IObservableVector_1__Core_ITimedTextSource;

  // External: Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Core.ITimedTextSource>
  VectorChangedEventHandler_1__Core_ITimedTextSource = interface;
  PVectorChangedEventHandler_1__Core_ITimedTextSource = ^VectorChangedEventHandler_1__Core_ITimedTextSource;

  // External: Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Core.ITimedMetadataTrack>
  IObservableVector_1__Core_ITimedMetadataTrack = interface;
  PIObservableVector_1__Core_ITimedMetadataTrack = ^IObservableVector_1__Core_ITimedMetadataTrack;

  // External: Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Core.ITimedMetadataTrack>
  VectorChangedEventHandler_1__Core_ITimedMetadataTrack = interface;
  PVectorChangedEventHandler_1__Core_ITimedMetadataTrack = ^VectorChangedEventHandler_1__Core_ITimedMetadataTrack;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMediaTrack>
  IVectorView_1__Core_IMediaTrack = interface;
  PIVectorView_1__Core_IMediaTrack = ^IVectorView_1__Core_IMediaTrack;

  // External: Windows.Media.Core.IMediaTrack
  Core_IMediaTrack = interface;
  PCore_IMediaTrack = ^Core_IMediaTrack;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>
  IVectorView_1__Core_ITimedMetadataTrack = interface;
  PIVectorView_1__Core_ITimedMetadataTrack = ^IVectorView_1__Core_ITimedMetadataTrack;

  // External: Windows.Media.Core.ITimedMetadataTrack
  Core_ITimedMetadataTrack = interface;
  PCore_ITimedMetadataTrack = ^Core_ITimedMetadataTrack;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedMetadataTrack,Windows.Media.Core.IMediaCueEventArgs>
  TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs = interface;
  PTypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs = ^TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs;

  // External: Windows.Media.Core.IMediaCueEventArgs
  Core_IMediaCueEventArgs = interface;
  PCore_IMediaCueEventArgs = ^Core_IMediaCueEventArgs;

  // External: Windows.Media.Core.IMediaCue
  Core_IMediaCue = interface;
  PCore_IMediaCue = ^Core_IMediaCue;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedMetadataTrack,Windows.Media.Core.ITimedMetadataTrackFailedEventArgs>
  TypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs = interface;
  PTypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs = ^TypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs;

  // External: Windows.Media.Core.ITimedMetadataTrackFailedEventArgs
  Core_ITimedMetadataTrackFailedEventArgs = interface;
  PCore_ITimedMetadataTrackFailedEventArgs = ^Core_ITimedMetadataTrackFailedEventArgs;

  // External: Windows.Media.Core.ITimedMetadataTrackError
  Core_ITimedMetadataTrackError = interface;
  PCore_ITimedMetadataTrackError = ^Core_ITimedMetadataTrackError;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMediaCue>
  IVectorView_1__Core_IMediaCue = interface;
  PIVectorView_1__Core_IMediaCue = ^IVectorView_1__Core_IMediaCue;

  // External: Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface;
  PIIterator_1__Cardinal = ^IIterator_1__Cardinal;

  // External: Windows.Foundation.IReference`1<Single>
  IReference_1__Single = interface;
  PIReference_1__Single = ^IReference_1__Single;

  // External: Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface;
  PIReference_1__Boolean = ^IReference_1__Boolean;

  // External: Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IAudioStreamDescriptor>
  IIterable_1__Core_IAudioStreamDescriptor = interface;
  PIIterable_1__Core_IAudioStreamDescriptor = ^IIterable_1__Core_IAudioStreamDescriptor;

  // External: Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IAudioStreamDescriptor>
  IIterator_1__Core_IAudioStreamDescriptor = interface;
  PIIterator_1__Core_IAudioStreamDescriptor = ^IIterator_1__Core_IAudioStreamDescriptor;

  // External: Windows.Media.Core.IAudioStreamDescriptor
  Core_IAudioStreamDescriptor = interface;
  PCore_IAudioStreamDescriptor = ^Core_IAudioStreamDescriptor;

  // External: Windows.Media.MediaProperties.IAudioEncodingProperties
  IAudioEncodingProperties = interface;
  PIAudioEncodingProperties = ^IAudioEncodingProperties;

  // External: Windows.Foundation.Collections.IVector`1<Windows.Media.Core.IAudioStreamDescriptor>
  IVector_1__Core_IAudioStreamDescriptor = interface;
  PIVector_1__Core_IAudioStreamDescriptor = ^IVector_1__Core_IAudioStreamDescriptor;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IAudioStreamDescriptor>
  IVectorView_1__Core_IAudioStreamDescriptor = interface;
  PIVectorView_1__Core_IAudioStreamDescriptor = ^IVectorView_1__Core_IAudioStreamDescriptor;

  // External: Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IVideoStreamDescriptor>
  IIterable_1__Core_IVideoStreamDescriptor = interface;
  PIIterable_1__Core_IVideoStreamDescriptor = ^IIterable_1__Core_IVideoStreamDescriptor;

  // External: Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IVideoStreamDescriptor>
  IIterator_1__Core_IVideoStreamDescriptor = interface;
  PIIterator_1__Core_IVideoStreamDescriptor = ^IIterator_1__Core_IVideoStreamDescriptor;

  // External: Windows.Media.Core.IVideoStreamDescriptor
  Core_IVideoStreamDescriptor = interface;
  PCore_IVideoStreamDescriptor = ^Core_IVideoStreamDescriptor;

  // External: Windows.Media.MediaProperties.IVideoEncodingProperties
  IVideoEncodingProperties = interface;
  PIVideoEncodingProperties = ^IVideoEncodingProperties;

  // External: Windows.Media.MediaProperties.IMediaRatio
  IMediaRatio = interface;
  PIMediaRatio = ^IMediaRatio;

  // External: Windows.Foundation.Collections.IVector`1<Windows.Media.Core.IVideoStreamDescriptor>
  IVector_1__Core_IVideoStreamDescriptor = interface;
  PIVector_1__Core_IVideoStreamDescriptor = ^IVector_1__Core_IVideoStreamDescriptor;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IVideoStreamDescriptor>
  IVectorView_1__Core_IVideoStreamDescriptor = interface;
  PIVectorView_1__Core_IVideoStreamDescriptor = ^IVectorView_1__Core_IVideoStreamDescriptor;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IHostName>
  IVectorView_1__IHostName = interface;
  PIVectorView_1__IHostName = ^IVectorView_1__IHostName;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Object>
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable = interface;
  PTypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable = ^TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable;

  // External: Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
  IMobileBroadbandAccountWatcher = interface;
  PIMobileBroadbandAccountWatcher = ^IMobileBroadbandAccountWatcher;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs>
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs = interface;
  PTypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs = ^TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs;

  // External: Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs
  IMobileBroadbandAccountEventArgs = interface;
  PIMobileBroadbandAccountEventArgs = ^IMobileBroadbandAccountEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs>
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs = interface;
  PTypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs = ^TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs;

  // External: Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs
  IMobileBroadbandAccountUpdatedEventArgs = interface;
  PIMobileBroadbandAccountUpdatedEventArgs = ^IMobileBroadbandAccountUpdatedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionCapabilities,Object>
  TypedEventHandler_2__ICompositionCapabilities__IInspectable = interface;
  PTypedEventHandler_2__ICompositionCapabilities__IInspectable = ^TypedEventHandler_2__ICompositionCapabilities__IInspectable;

  // External: Windows.UI.Composition.ICompositionCapabilities
  ICompositionCapabilities = interface;
  PICompositionCapabilities = ^ICompositionCapabilities;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkUnprocessedInput,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs = interface;
  PTypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs = ^TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs;

  // External: Windows.UI.Input.Inking.IInkUnprocessedInput
  IInkUnprocessedInput = interface;
  PIInkUnprocessedInput = ^IInkUnprocessedInput;

  // External: Windows.UI.Input.Inking.IInkPresenter
  IInkPresenter = interface;
  PIInkPresenter = ^IInkPresenter;

  // External: Windows.UI.Input.Inking.IInkStrokeInput
  IInkStrokeInput = interface;
  PIInkStrokeInput = ^IInkStrokeInput;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkStrokeInput,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs = interface;
  PTypedEventHandler_2__IInkStrokeInput__IPointerEventArgs = ^TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs;

  // External: Windows.UI.Input.Inking.IInkInputProcessingConfiguration
  IInkInputProcessingConfiguration = interface;
  PIInkInputProcessingConfiguration = ^IInkInputProcessingConfiguration;

  // External: Windows.UI.Input.Inking.IInkStrokeContainer
  IInkStrokeContainer = interface;
  PIInkStrokeContainer = ^IInkStrokeContainer;

  // External: Windows.UI.Input.Inking.IInkStroke
  IInkStroke = interface;
  PIInkStroke = ^IInkStroke;

  // External: Windows.UI.Input.Inking.IInkDrawingAttributes
  IInkDrawingAttributes = interface;
  PIInkDrawingAttributes = ^IInkDrawingAttributes;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  IVectorView_1__IInkStrokeRenderingSegment = interface;
  PIVectorView_1__IInkStrokeRenderingSegment = ^IVectorView_1__IInkStrokeRenderingSegment;

  // External: Windows.UI.Input.Inking.IInkStrokeRenderingSegment
  IInkStrokeRenderingSegment = interface;
  PIInkStrokeRenderingSegment = ^IInkStrokeRenderingSegment;

  // External: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  IIterable_1__Point = interface;
  PIIterable_1__Point = ^IIterable_1__Point;

  // External: Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Point>
  IIterator_1__Point = interface;
  PIIterator_1__Point = ^IIterator_1__Point;

  // External: Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  IAsyncActionWithProgress_1__UInt64 = interface;
  PIAsyncActionWithProgress_1__UInt64 = ^IAsyncActionWithProgress_1__UInt64;

  // External: Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  AsyncActionProgressHandler_1__UInt64 = interface;
  PAsyncActionProgressHandler_1__UInt64 = ^AsyncActionProgressHandler_1__UInt64;

  // External: Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  AsyncActionWithProgressCompletedHandler_1__UInt64 = interface;
  PAsyncActionWithProgressCompletedHandler_1__UInt64 = ^AsyncActionWithProgressCompletedHandler_1__UInt64;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  IVectorView_1__IInkRecognitionResult = interface;
  PIVectorView_1__IInkRecognitionResult = ^IVectorView_1__IInkRecognitionResult;

  // External: Windows.UI.Input.Inking.IInkRecognitionResult
  IInkRecognitionResult = interface;
  PIInkRecognitionResult = ^IInkRecognitionResult;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkStroke>
  IVectorView_1__IInkStroke = interface;
  PIVectorView_1__IInkStroke = ^IVectorView_1__IInkStroke;

  // External: Windows.UI.Input.Inking.IInkSynchronizer
  IInkSynchronizer = interface;
  PIInkSynchronizer = ^IInkSynchronizer;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkPresenter,Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs>
  TypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs = interface;
  PTypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs = ^TypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs;

  // External: Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs
  IInkStrokesCollectedEventArgs = interface;
  PIInkStrokesCollectedEventArgs = ^IInkStrokesCollectedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkPresenter,Windows.UI.Input.Inking.IInkStrokesErasedEventArgs>
  TypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs = interface;
  PTypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs = ^TypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs;

  // External: Windows.UI.Input.Inking.IInkStrokesErasedEventArgs
  IInkStrokesErasedEventArgs = interface;
  PIInkStrokesErasedEventArgs = ^IInkStrokesErasedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs = interface;
  PTypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs = ^TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs;

  // External: Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
  Core_ICoreInkIndependentInputSource = interface;
  PCore_ICoreInkIndependentInputSource = ^Core_ICoreInkIndependentInputSource;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialControllerMenuItem,Object>
  TypedEventHandler_2__IRadialControllerMenuItem__IInspectable = interface;
  PTypedEventHandler_2__IRadialControllerMenuItem__IInspectable = ^TypedEventHandler_2__IRadialControllerMenuItem__IInspectable;

  // External: Windows.UI.Input.IRadialControllerMenuItem
  IRadialControllerMenuItem = interface;
  PIRadialControllerMenuItem = ^IRadialControllerMenuItem;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Object>
  TypedEventHandler_2__IRadialController__IInspectable = interface;
  PTypedEventHandler_2__IRadialController__IInspectable = ^TypedEventHandler_2__IRadialController__IInspectable;

  // External: Windows.UI.Input.IRadialController
  IRadialController = interface;
  PIRadialController = ^IRadialController;

  // External: Windows.UI.Input.IRadialControllerMenu
  IRadialControllerMenu = interface;
  PIRadialControllerMenu = ^IRadialControllerMenu;

  // External: Windows.Foundation.Collections.IVector`1<Windows.UI.Input.IRadialControllerMenuItem>
  IVector_1__IRadialControllerMenuItem = interface;
  PIVector_1__IRadialControllerMenuItem = ^IVector_1__IRadialControllerMenuItem;

  // External: Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.IRadialControllerMenuItem>
  IVectorView_1__IRadialControllerMenuItem = interface;
  PIVectorView_1__IRadialControllerMenuItem = ^IVectorView_1__IRadialControllerMenuItem;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs;

  // External: Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs
  IRadialControllerScreenContactStartedEventArgs = interface;
  PIRadialControllerScreenContactStartedEventArgs = ^IRadialControllerScreenContactStartedEventArgs;

  // External: Windows.UI.Input.IRadialControllerScreenContact
  IRadialControllerScreenContact = interface;
  PIRadialControllerScreenContact = ^IRadialControllerScreenContact;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs;

  // External: Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs
  IRadialControllerScreenContactContinuedEventArgs = interface;
  PIRadialControllerScreenContactContinuedEventArgs = ^IRadialControllerScreenContactContinuedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerRotationChangedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs;

  // External: Windows.UI.Input.IRadialControllerRotationChangedEventArgs
  IRadialControllerRotationChangedEventArgs = interface;
  PIRadialControllerRotationChangedEventArgs = ^IRadialControllerRotationChangedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonClickedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs;

  // External: Windows.UI.Input.IRadialControllerButtonClickedEventArgs
  IRadialControllerButtonClickedEventArgs = interface;
  PIRadialControllerButtonClickedEventArgs = ^IRadialControllerButtonClickedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerControlAcquiredEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs = interface;
  PTypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs = ^TypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs;

  // External: Windows.UI.Input.IRadialControllerControlAcquiredEventArgs
  IRadialControllerControlAcquiredEventArgs = interface;
  PIRadialControllerControlAcquiredEventArgs = ^IRadialControllerControlAcquiredEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable = interface;
  PTypedEventHandler_2__IToastNotification__IInspectable = ^TypedEventHandler_2__IToastNotification__IInspectable;

  // External: Windows.UI.Notifications.IToastNotification
  IToastNotification = interface;
  PIToastNotification = ^IToastNotification;

  // External: Windows.Data.Xml.Dom.IXmlDocument
  Xml_Dom_IXmlDocument = interface;
  PXml_Dom_IXmlDocument = ^Xml_Dom_IXmlDocument;

  // External: Windows.Data.Xml.Dom.IXmlDocumentType
  Xml_Dom_IXmlDocumentType = interface;
  PXml_Dom_IXmlDocumentType = ^Xml_Dom_IXmlDocumentType;

  // External: Windows.Data.Xml.Dom.IXmlNamedNodeMap
  Xml_Dom_IXmlNamedNodeMap = interface;
  PXml_Dom_IXmlNamedNodeMap = ^Xml_Dom_IXmlNamedNodeMap;

  // External: Windows.Data.Xml.Dom.IXmlNode
  Xml_Dom_IXmlNode = interface;
  PXml_Dom_IXmlNode = ^Xml_Dom_IXmlNode;

  // External: Windows.Data.Xml.Dom.IXmlNodeList
  Xml_Dom_IXmlNodeList = interface;
  PXml_Dom_IXmlNodeList = ^Xml_Dom_IXmlNodeList;

  // External: Windows.Data.Xml.Dom.IXmlDomImplementation
  Xml_Dom_IXmlDomImplementation = interface;
  PXml_Dom_IXmlDomImplementation = ^Xml_Dom_IXmlDomImplementation;

  // External: Windows.Data.Xml.Dom.IXmlElement
  Xml_Dom_IXmlElement = interface;
  PXml_Dom_IXmlElement = ^Xml_Dom_IXmlElement;

  // External: Windows.Data.Xml.Dom.IXmlAttribute
  Xml_Dom_IXmlAttribute = interface;
  PXml_Dom_IXmlAttribute = ^Xml_Dom_IXmlAttribute;

  // External: Windows.Data.Xml.Dom.IXmlDocumentFragment
  Xml_Dom_IXmlDocumentFragment = interface;
  PXml_Dom_IXmlDocumentFragment = ^Xml_Dom_IXmlDocumentFragment;

  // External: Windows.Data.Xml.Dom.IXmlText
  Xml_Dom_IXmlText = interface;
  PXml_Dom_IXmlText = ^Xml_Dom_IXmlText;

  // External: Windows.Data.Xml.Dom.IXmlComment
  Xml_Dom_IXmlComment = interface;
  PXml_Dom_IXmlComment = ^Xml_Dom_IXmlComment;

  // External: Windows.Data.Xml.Dom.IXmlProcessingInstruction
  Xml_Dom_IXmlProcessingInstruction = interface;
  PXml_Dom_IXmlProcessingInstruction = ^Xml_Dom_IXmlProcessingInstruction;

  // External: Windows.Data.Xml.Dom.IXmlEntityReference
  Xml_Dom_IXmlEntityReference = interface;
  PXml_Dom_IXmlEntityReference = ^Xml_Dom_IXmlEntityReference;

  // External: Windows.Data.Xml.Dom.IXmlCDataSection
  Xml_Dom_IXmlCDataSection = interface;
  PXml_Dom_IXmlCDataSection = ^Xml_Dom_IXmlCDataSection;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs = interface;
  PTypedEventHandler_2__IToastNotification__IToastDismissedEventArgs = ^TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs;

  // External: Windows.UI.Notifications.IToastDismissedEventArgs
  IToastDismissedEventArgs = interface;
  PIToastDismissedEventArgs = ^IToastDismissedEventArgs;

  // External: Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastFailedEventArgs = interface;
  PTypedEventHandler_2__IToastNotification__IToastFailedEventArgs = ^TypedEventHandler_2__IToastNotification__IToastFailedEventArgs;

  // External: Windows.UI.Notifications.IToastFailedEventArgs
  IToastFailedEventArgs = interface;
  PIToastFailedEventArgs = ^IToastFailedEventArgs;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IBuffer__UInt64 = ^IAsyncOperationWithProgress_2__IBuffer__UInt64;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IBuffer__UInt64 = ^AsyncOperationProgressHandler_2__IBuffer__UInt64;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IInputStream__UInt64 = ^IAsyncOperationWithProgress_2__IInputStream__UInt64;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IInputStream__UInt64 = ^AsyncOperationProgressHandler_2__IInputStream__UInt64;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64;

  // External: Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface;
  PIAsyncOperationWithProgress_2__HSTRING__UInt64 = ^IAsyncOperationWithProgress_2__HSTRING__UInt64;

  // External: Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationProgressHandler_2__HSTRING__UInt64 = ^AsyncOperationProgressHandler_2__HSTRING__UInt64;

  // External: Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64;


  // Emit enums
  //  Enums
  // Windows.Foundation.AsyncStatus
  AsyncStatus = (
    Canceled = 2,
    Completed = 1,
    Error = 3,
    Started = 0
  );
  PAsyncStatus = ^AsyncStatus;

  // Windows.Foundation.Collections.CollectionChange
  CollectionChange = (
    Reset = 0,
    ItemInserted = 1,
    ItemRemoved = 2,
    ItemChanged = 3
  );
  PCollectionChange = ^CollectionChange;

  // Windows.System.ShutdownKind
  ShutdownKind = (
    Shutdown = 0,
    Restart = 1
  );
  PShutdownKind = ^ShutdownKind;

  // Windows.System.PowerState
  PowerState = (
    ConnectedStandby = 0,
    SleepS3 = 1
  );
  PPowerState = ^PowerState;

  // Windows.System.Profile.SystemIdentificationSource
  Profile_SystemIdentificationSource = (
    None = 0,
    Tpm = 1,
    Uefi = 2,
    Registry = 3
  );
  PProfile_SystemIdentificationSource = ^Profile_SystemIdentificationSource;

  // Windows.System.ProcessorArchitecture
  ProcessorArchitecture = (
    X86 = 0,
    Arm = 5,
    X64 = 9,
    Neutral = 11,
    Unknown = 65535
  );
  PProcessorArchitecture = ^ProcessorArchitecture;

  // Windows.System.DispatcherQueuePriority
  DispatcherQueuePriority = (
    Low = -10,
    Normal = 0,
    High = 10
  );
  PDispatcherQueuePriority = ^DispatcherQueuePriority;

  // Windows.System.UserAuthenticationStatus
  UserAuthenticationStatus = (
    Unauthenticated = 0,
    LocallyAuthenticated = 1,
    RemotelyAuthenticated = 2
  );
  PUserAuthenticationStatus = ^UserAuthenticationStatus;

  // Windows.System.UserType
  UserType = (
    LocalUser = 0,
    RemoteUser = 1,
    LocalGuest = 2,
    RemoteGuest = 3
  );
  PUserType = ^UserType;

  // Windows.System.UserPictureSize
  UserPictureSize = (
    Size64x64 = 0,
    Size208x208 = 1,
    Size424x424 = 2,
    Size1080x1080 = 3
  );
  PUserPictureSize = ^UserPictureSize;

  // Windows.System.UserWatcherStatus
  UserWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PUserWatcherStatus = ^UserWatcherStatus;

  // Windows.System.Power.BatteryStatus
  Power_BatteryStatus = (
    NotPresent = 0,
    Discharging = 1,
    Idle = 2,
    Charging = 3
  );
  PPower_BatteryStatus = ^Power_BatteryStatus;

  // Windows.System.Power.EnergySaverStatus
  Power_EnergySaverStatus = (
    Disabled = 0,
    Off = 1,
    On = 2
  );
  PPower_EnergySaverStatus = ^Power_EnergySaverStatus;

  // Windows.System.Power.PowerSupplyStatus
  Power_PowerSupplyStatus = (
    NotPresent = 0,
    Inadequate = 1,
    Adequate = 2
  );
  PPower_PowerSupplyStatus = ^Power_PowerSupplyStatus;

  // Windows.System.AppMemoryUsageLevel
  AppMemoryUsageLevel = (
    Low = 0,
    Medium = 1,
    High = 2,
    OverLimit = 3
  );
  PAppMemoryUsageLevel = ^AppMemoryUsageLevel;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEscalationType
  Diagnostics_TraceReporting_PlatformDiagnosticEscalationType = (
    OnCompletion = 0,
    OnFailure = 1
  );
  PDiagnostics_TraceReporting_PlatformDiagnosticEscalationType = ^Diagnostics_TraceReporting_PlatformDiagnosticEscalationType;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
  Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType = (
    Alternative = 0,
    AlwaysOn = 1,
    Mini = 2
  );
  PDiagnostics_TraceReporting_PlatformDiagnosticTraceSlotType = ^Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTracePriority
  Diagnostics_TraceReporting_PlatformDiagnosticTracePriority = (
    Normal = 0,
    UserElevated = 1
  );
  PDiagnostics_TraceReporting_PlatformDiagnosticTracePriority = ^Diagnostics_TraceReporting_PlatformDiagnosticTracePriority;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotState
  Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotState = (
    NotRunning = 0,
    Running = 1,
    Throttled = 2
  );
  PDiagnostics_TraceReporting_PlatformDiagnosticTraceSlotState = ^Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotState;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState
  Diagnostics_TraceReporting_PlatformDiagnosticActionState = (
    Success = 0,
    FreeNetworkNotAvailable = 1,
    ACPowerNotAvailable = 2
  );
  PDiagnostics_TraceReporting_PlatformDiagnosticActionState = ^Diagnostics_TraceReporting_PlatformDiagnosticActionState;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEventBufferLatencies
  Diagnostics_TraceReporting_PlatformDiagnosticEventBufferLatencies = (
    Normal = 1,
    CostDeferred = 2,
    Realtime = 4
  );
  PDiagnostics_TraceReporting_PlatformDiagnosticEventBufferLatencies = ^Diagnostics_TraceReporting_PlatformDiagnosticEventBufferLatencies;

  // Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationStatus
  Diagnostics_Telemetry_PlatformTelemetryRegistrationStatus = (
    Success = 0,
    SettingsOutOfRange = 1,
    UnknownFailure = 2
  );
  PDiagnostics_Telemetry_PlatformTelemetryRegistrationStatus = ^Diagnostics_Telemetry_PlatformTelemetryRegistrationStatus;

  // Windows.System.RemoteSystems.RemoteSystemStatus
  RemoteSystems_RemoteSystemStatus = (
    Unavailable = 0,
    DiscoveringAvailability = 1,
    Available = 2,
    Unknown = 3
  );
  PRemoteSystems_RemoteSystemStatus = ^RemoteSystems_RemoteSystemStatus;

  // Windows.System.RemoteSystems.RemoteSystemDiscoveryType
  RemoteSystems_RemoteSystemDiscoveryType = (
    Any = 0,
    Proximal = 1,
    Cloud = 2,
    SpatiallyProximal = 3
  );
  PRemoteSystems_RemoteSystemDiscoveryType = ^RemoteSystems_RemoteSystemDiscoveryType;

  // Windows.System.RemoteSystems.RemoteSystemStatusType
  RemoteSystems_RemoteSystemStatusType = (
    Any = 0,
    Available = 1
  );
  PRemoteSystems_RemoteSystemStatusType = ^RemoteSystems_RemoteSystemStatusType;

  // Windows.System.RemoteSystems.RemoteSystemAccessStatus
  RemoteSystems_RemoteSystemAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    DeniedByUser = 2,
    DeniedBySystem = 3
  );
  PRemoteSystems_RemoteSystemAccessStatus = ^RemoteSystems_RemoteSystemAccessStatus;

  // Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
  RemoteSystems_RemoteSystemAuthorizationKind = (
    SameUser = 0,
    Anonymous = 1
  );
  PRemoteSystems_RemoteSystemAuthorizationKind = ^RemoteSystems_RemoteSystemAuthorizationKind;

  // Windows.System.RemoteSystems.RemoteSystemSessionJoinStatus
  RemoteSystems_RemoteSystemSessionJoinStatus = (
    Success = 0,
    SessionLimitsExceeded = 1,
    OperationAborted = 2,
    SessionUnavailable = 3,
    RejectedByController = 4
  );
  PRemoteSystems_RemoteSystemSessionJoinStatus = ^RemoteSystems_RemoteSystemSessionJoinStatus;

  // Windows.System.RemoteSystems.RemoteSystemSessionWatcherStatus
  RemoteSystems_RemoteSystemSessionWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PRemoteSystems_RemoteSystemSessionWatcherStatus = ^RemoteSystems_RemoteSystemSessionWatcherStatus;

  // Windows.System.RemoteSystems.RemoteSystemSessionParticipantWatcherStatus
  RemoteSystems_RemoteSystemSessionParticipantWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PRemoteSystems_RemoteSystemSessionParticipantWatcherStatus = ^RemoteSystems_RemoteSystemSessionParticipantWatcherStatus;

  // Windows.System.RemoteSystems.RemoteSystemSessionCreationStatus
  RemoteSystems_RemoteSystemSessionCreationStatus = (
    Success = 0,
    SessionLimitsExceeded = 1,
    OperationAborted = 2
  );
  PRemoteSystems_RemoteSystemSessionCreationStatus = ^RemoteSystems_RemoteSystemSessionCreationStatus;

  // Windows.System.RemoteSystems.RemoteSystemSessionDisconnectedReason
  RemoteSystems_RemoteSystemSessionDisconnectedReason = (
    SessionUnavailable = 0,
    RemovedByController = 1,
    SessionClosed = 2
  );
  PRemoteSystems_RemoteSystemSessionDisconnectedReason = ^RemoteSystems_RemoteSystemSessionDisconnectedReason;

  // Windows.System.RemoteSystems.RemoteSystemSessionMessageChannelReliability
  RemoteSystems_RemoteSystemSessionMessageChannelReliability = (
    Reliable = 0,
    Unreliable = 1
  );
  PRemoteSystems_RemoteSystemSessionMessageChannelReliability = ^RemoteSystems_RemoteSystemSessionMessageChannelReliability;

  // Windows.System.Threading.WorkItemPriority
  Threading_WorkItemPriority = (
    Low = -1,
    Normal = 0,
    High = 1
  );
  PThreading_WorkItemPriority = ^Threading_WorkItemPriority;

  // Windows.System.Threading.WorkItemOptions
  Threading_WorkItemOptions = (
    None = 0,
    TimeSliced = 1
  );
  PThreading_WorkItemOptions = ^Threading_WorkItemOptions;

  // Windows.System.DiagnosticAccessStatus
  DiagnosticAccessStatus = (
    Unspecified = 0,
    Denied = 1,
    Limited = 2,
    Allowed = 3
  );
  PDiagnosticAccessStatus = ^DiagnosticAccessStatus;

  // Windows.System.AppDiagnosticInfoWatcherStatus
  AppDiagnosticInfoWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PAppDiagnosticInfoWatcherStatus = ^AppDiagnosticInfoWatcherStatus;

  // Windows.System.AppResourceGroupInfoWatcherStatus
  AppResourceGroupInfoWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PAppResourceGroupInfoWatcherStatus = ^AppResourceGroupInfoWatcherStatus;

  // Windows.System.AppResourceGroupExecutionState
  AppResourceGroupExecutionState = (
    Unknown = 0,
    Running = 1,
    Suspending = 2,
    Suspended = 3,
    NotRunning = 4
  );
  PAppResourceGroupExecutionState = ^AppResourceGroupExecutionState;

  // Windows.System.AppResourceGroupEnergyQuotaState
  AppResourceGroupEnergyQuotaState = (
    Unknown = 0,
    Over = 1,
    Under = 2
  );
  PAppResourceGroupEnergyQuotaState = ^AppResourceGroupEnergyQuotaState;

  // Windows.System.Diagnostics.DevicePortal.DevicePortalConnectionClosedReason
  Diagnostics_DevicePortal_DevicePortalConnectionClosedReason = (
    Unknown = 0,
    ResourceLimitsExceeded = 1,
    ProtocolError = 2,
    NotAuthorized = 3,
    UserNotPresent = 4,
    ServiceTerminated = 5
  );
  PDiagnostics_DevicePortal_DevicePortalConnectionClosedReason = ^Diagnostics_DevicePortal_DevicePortalConnectionClosedReason;

  // Windows.System.Diagnostics.DiagnosticActionState
  Diagnostics_DiagnosticActionState = (
    Initializing = 0,
    Downloading = 1,
    VerifyingTrust = 2,
    Detecting = 3,
    Resolving = 4,
    VerifyingResolution = 5
  );
  PDiagnostics_DiagnosticActionState = ^Diagnostics_DiagnosticActionState;

  // Windows.System.VirtualKeyModifiers
  VirtualKeyModifiers = (
    None = 0,
    Control = 1,
    Menu = 2,
    Shift = 4,
    Windows = 8
  );
  PVirtualKeyModifiers = ^VirtualKeyModifiers;

  // Windows.System.VirtualKey
  VirtualKey = (
    None = 0,
    LeftButton = 1,
    RightButton = 2,
    Cancel = 3,
    MiddleButton = 4,
    XButton1 = 5,
    XButton2 = 6,
    Back = 8,
    Tab = 9,
    Clear = 12,
    Enter = 13,
    Shift = 16,
    Control = 17,
    Menu = 18,
    Pause = 19,
    CapitalLock = 20,
    Kana = 21,
    Hangul = 21,
    Junja = 23,
    Final = 24,
    Hanja = 25,
    Kanji = 25,
    Escape = 27,
    Convert = 28,
    NonConvert = 29,
    Accept = 30,
    ModeChange = 31,
    Space = 32,
    PageUp = 33,
    PageDown = 34,
    &End = 35,
    Home = 36,
    Left = 37,
    Up = 38,
    Right = 39,
    Down = 40,
    Select = 41,
    Print = 42,
    Execute = 43,
    Snapshot = 44,
    Insert = 45,
    Delete = 46,
    Help = 47,
    Number0 = 48,
    Number1 = 49,
    Number2 = 50,
    Number3 = 51,
    Number4 = 52,
    Number5 = 53,
    Number6 = 54,
    Number7 = 55,
    Number8 = 56,
    Number9 = 57,
    A = 65,
    B = 66,
    C = 67,
    D = 68,
    E = 69,
    F = 70,
    G = 71,
    H = 72,
    I = 73,
    J = 74,
    K = 75,
    L = 76,
    M = 77,
    N = 78,
    O = 79,
    P = 80,
    Q = 81,
    R = 82,
    S = 83,
    T = 84,
    U = 85,
    V = 86,
    W = 87,
    X = 88,
    Y = 89,
    Z = 90,
    LeftWindows = 91,
    RightWindows = 92,
    Application = 93,
    Sleep = 95,
    NumberPad0 = 96,
    NumberPad1 = 97,
    NumberPad2 = 98,
    NumberPad3 = 99,
    NumberPad4 = 100,
    NumberPad5 = 101,
    NumberPad6 = 102,
    NumberPad7 = 103,
    NumberPad8 = 104,
    NumberPad9 = 105,
    Multiply = 106,
    Add = 107,
    Separator = 108,
    Subtract = 109,
    Decimal = 110,
    Divide = 111,
    F1 = 112,
    F2 = 113,
    F3 = 114,
    F4 = 115,
    F5 = 116,
    F6 = 117,
    F7 = 118,
    F8 = 119,
    F9 = 120,
    F10 = 121,
    F11 = 122,
    F12 = 123,
    F13 = 124,
    F14 = 125,
    F15 = 126,
    F16 = 127,
    F17 = 128,
    F18 = 129,
    F19 = 130,
    F20 = 131,
    F21 = 132,
    F22 = 133,
    F23 = 134,
    F24 = 135,
    NavigationView = 136,
    NavigationMenu = 137,
    NavigationUp = 138,
    NavigationDown = 139,
    NavigationLeft = 140,
    NavigationRight = 141,
    NavigationAccept = 142,
    NavigationCancel = 143,
    NumberKeyLock = 144,
    Scroll = 145,
    LeftShift = 160,
    RightShift = 161,
    LeftControl = 162,
    RightControl = 163,
    LeftMenu = 164,
    RightMenu = 165,
    GoBack = 166,
    GoForward = 167,
    Refresh = 168,
    Stop = 169,
    Search = 170,
    Favorites = 171,
    GoHome = 172,
    GamepadA = 195,
    GamepadB = 196,
    GamepadX = 197,
    GamepadY = 198,
    GamepadRightShoulder = 199,
    GamepadLeftShoulder = 200,
    GamepadLeftTrigger = 201,
    GamepadRightTrigger = 202,
    GamepadDPadUp = 203,
    GamepadDPadDown = 204,
    GamepadDPadLeft = 205,
    GamepadDPadRight = 206,
    GamepadMenu = 207,
    GamepadView = 208,
    GamepadLeftThumbstickButton = 209,
    GamepadRightThumbstickButton = 210,
    GamepadLeftThumbstickUp = 211,
    GamepadLeftThumbstickDown = 212,
    GamepadLeftThumbstickRight = 213,
    GamepadLeftThumbstickLeft = 214,
    GamepadRightThumbstickUp = 215,
    GamepadRightThumbstickDown = 216,
    GamepadRightThumbstickRight = 217,
    GamepadRightThumbstickLeft = 218
  );
  PVirtualKey = ^VirtualKey;

  // Windows.System.Profile.PlatformDataCollectionLevel
  Profile_PlatformDataCollectionLevel = (
    Security = 0,
    Basic = 1,
    Enhanced = 2,
    Full = 3
  );
  PProfile_PlatformDataCollectionLevel = ^Profile_PlatformDataCollectionLevel;

  // Windows.System.LaunchQuerySupportType
  LaunchQuerySupportType = (
    Uri = 0,
    UriForResults = 1
  );
  PLaunchQuerySupportType = ^LaunchQuerySupportType;

  // Windows.System.LaunchQuerySupportStatus
  LaunchQuerySupportStatus = (
    Available = 0,
    AppNotInstalled = 1,
    AppUnavailable = 2,
    NotSupported = 3,
    Unknown = 4
  );
  PLaunchQuerySupportStatus = ^LaunchQuerySupportStatus;

  // Windows.System.LaunchUriStatus
  LaunchUriStatus = (
    Success = 0,
    AppUnavailable = 1,
    ProtocolUnavailable = 2,
    Unknown = 3
  );
  PLaunchUriStatus = ^LaunchUriStatus;

  // Windows.System.LaunchFileStatus
  LaunchFileStatus = (
    Success = 0,
    AppUnavailable = 1,
    DeniedByPolicy = 2,
    FileTypeNotSupported = 3,
    Unknown = 4
  );
  PLaunchFileStatus = ^LaunchFileStatus;

  // Windows.System.RemoteLaunchUriStatus
  RemoteLaunchUriStatus = (
    Unknown = 0,
    Success = 1,
    AppUnavailable = 2,
    ProtocolUnavailable = 3,
    RemoteSystemUnavailable = 4,
    ValueSetTooLarge = 5,
    DeniedByLocalSystem = 6,
    DeniedByRemoteSystem = 7
  );
  PRemoteLaunchUriStatus = ^RemoteLaunchUriStatus;

  // Windows.System.UserProfile.AccountPictureKind
  UserProfile_AccountPictureKind = (
    SmallImage = 0,
    LargeImage = 1,
    Video = 2
  );
  PUserProfile_AccountPictureKind = ^UserProfile_AccountPictureKind;

  // Windows.System.UserProfile.SetAccountPictureResult
  UserProfile_SetAccountPictureResult = (
    Success = 0,
    ChangeDisabled = 1,
    LargeOrDynamicError = 2,
    VideoFrameSizeError = 3,
    FileSizeError = 4,
    Failure = 5
  );
  PUserProfile_SetAccountPictureResult = ^UserProfile_SetAccountPictureResult;

  // Windows.System.UserProfile.SetImageFeedResult
  UserProfile_SetImageFeedResult = (
    Success = 0,
    ChangeDisabled = 1,
    UserCanceled = 2
  );
  PUserProfile_SetImageFeedResult = ^UserProfile_SetImageFeedResult;

  // Windows.Services.Cortana.CortanaPermissionsChangeResult
  Cortana_CortanaPermissionsChangeResult = (
    Success = 0,
    Unavailable = 1,
    DisabledByPolicy = 2
  );
  PCortana_CortanaPermissionsChangeResult = ^Cortana_CortanaPermissionsChangeResult;

  // Windows.Services.Cortana.CortanaPermission
  Cortana_CortanaPermission = (
    BrowsingHistory = 0,
    Calendar = 1,
    CallHistory = 2,
    Contacts = 3,
    Email = 4,
    InputPersonalization = 5,
    Location = 6,
    Messaging = 7,
    Microphone = 8,
    Personalization = 9,
    PhoneCall = 10
  );
  PCortana_CortanaPermission = ^Cortana_CortanaPermission;

  // Windows.Services.Maps.OfflineMaps.OfflineMapPackageQueryStatus
  Maps_OfflineMaps_OfflineMapPackageQueryStatus = (
    Success = 0,
    UnknownError = 1,
    InvalidCredentials = 2,
    NetworkFailure = 3
  );
  PMaps_OfflineMaps_OfflineMapPackageQueryStatus = ^Maps_OfflineMaps_OfflineMapPackageQueryStatus;

  // Windows.Services.Maps.OfflineMaps.OfflineMapPackageStatus
  Maps_OfflineMaps_OfflineMapPackageStatus = (
    NotDownloaded = 0,
    Downloading = 1,
    Downloaded = 2,
    Deleting = 3
  );
  PMaps_OfflineMaps_OfflineMapPackageStatus = ^Maps_OfflineMaps_OfflineMapPackageStatus;

  // Windows.Services.Maps.OfflineMaps.OfflineMapPackageStartDownloadStatus
  Maps_OfflineMaps_OfflineMapPackageStartDownloadStatus = (
    Success = 0,
    UnknownError = 1,
    InvalidCredentials = 2,
    DeniedWithoutCapability = 3
  );
  PMaps_OfflineMaps_OfflineMapPackageStartDownloadStatus = ^Maps_OfflineMaps_OfflineMapPackageStartDownloadStatus;

  // Windows.Services.Maps.MapRouteOptimization
  Maps_MapRouteOptimization = (
    Time = 0,
    Distance = 1,
    TimeWithTraffic = 2,
    Scenic = 3
  );
  PMaps_MapRouteOptimization = ^Maps_MapRouteOptimization;

  // Windows.Services.Maps.MapRouteRestrictions
  Maps_MapRouteRestrictions = (
    None = 0,
    Highways = 1,
    TollRoads = 2,
    Ferries = 4,
    Tunnels = 8,
    DirtRoads = 16,
    Motorail = 32
  );
  PMaps_MapRouteRestrictions = ^Maps_MapRouteRestrictions;

  // Windows.Services.Maps.MapRouteManeuverKind
  Maps_MapRouteManeuverKind = (
    None = 0,
    Start = 1,
    Stopover = 2,
    StopoverResume = 3,
    &End = 4,
    GoStraight = 5,
    UTurnLeft = 6,
    UTurnRight = 7,
    TurnKeepLeft = 8,
    TurnKeepRight = 9,
    TurnLightLeft = 10,
    TurnLightRight = 11,
    TurnLeft = 12,
    TurnRight = 13,
    TurnHardLeft = 14,
    TurnHardRight = 15,
    FreewayEnterLeft = 16,
    FreewayEnterRight = 17,
    FreewayLeaveLeft = 18,
    FreewayLeaveRight = 19,
    FreewayContinueLeft = 20,
    FreewayContinueRight = 21,
    TrafficCircleLeft = 22,
    TrafficCircleRight = 23,
    TakeFerry = 24
  );
  PMaps_MapRouteManeuverKind = ^Maps_MapRouteManeuverKind;

  // Windows.Services.Maps.MapManeuverNotices
  Maps_MapManeuverNotices = (
    None = 0,
    Toll = 1,
    Unpaved = 2
  );
  PMaps_MapManeuverNotices = ^Maps_MapManeuverNotices;

  // Windows.Services.Maps.MapLocationFinderStatus
  Maps_MapLocationFinderStatus = (
    Success = 0,
    UnknownError = 1,
    InvalidCredentials = 2,
    BadLocation = 3,
    IndexFailure = 4,
    NetworkFailure = 5,
    NotSupported = 6
  );
  PMaps_MapLocationFinderStatus = ^Maps_MapLocationFinderStatus;

  // Windows.Services.Maps.MapRouteFinderStatus
  Maps_MapRouteFinderStatus = (
    Success = 0,
    UnknownError = 1,
    InvalidCredentials = 2,
    NoRouteFound = 3,
    NoRouteFoundWithGivenOptions = 4,
    StartPointNotFound = 5,
    EndPointNotFound = 6,
    NoPedestrianRouteFound = 7,
    NetworkFailure = 8,
    NotSupported = 9
  );
  PMaps_MapRouteFinderStatus = ^Maps_MapRouteFinderStatus;

  // Windows.Services.Maps.MapLocationDesiredAccuracy
  Maps_MapLocationDesiredAccuracy = (
    High = 0,
    Low = 1
  );
  PMaps_MapLocationDesiredAccuracy = ^Maps_MapLocationDesiredAccuracy;

  // Windows.Services.Maps.WaypointKind
  Maps_WaypointKind = (
    Stop = 0,
    Via = 1
  );
  PMaps_WaypointKind = ^Maps_WaypointKind;

  // Windows.Services.Maps.MapServiceDataUsagePreference
  Maps_MapServiceDataUsagePreference = (
    Default = 0,
    OfflineMapDataOnly = 1
  );
  PMaps_MapServiceDataUsagePreference = ^Maps_MapServiceDataUsagePreference;

  // Windows.Services.Maps.TrafficCongestion
  Maps_TrafficCongestion = (
    Unknown = 0,
    Light = 1,
    Mild = 2,
    Medium = 3,
    Heavy = 4
  );
  PMaps_TrafficCongestion = ^Maps_TrafficCongestion;

  // Windows.Services.Maps.ManeuverWarningKind
  Maps_ManeuverWarningKind = (
    None = 0,
    Accident = 1,
    AdministrativeDivisionChange = 2,
    Alert = 3,
    BlockedRoad = 4,
    CheckTimetable = 5,
    Congestion = 6,
    Construction = 7,
    CountryChange = 8,
    DisabledVehicle = 9,
    GateAccess = 10,
    GetOffTransit = 11,
    GetOnTransit = 12,
    IllegalUTurn = 13,
    MassTransit = 14,
    Miscellaneous = 15,
    NoIncident = 16,
    Other = 17,
    OtherNews = 18,
    OtherTrafficIncidents = 19,
    PlannedEvent = 20,
    PrivateRoad = 21,
    RestrictedTurn = 22,
    RoadClosures = 23,
    RoadHazard = 24,
    ScheduledConstruction = 25,
    SeasonalClosures = 26,
    Tollbooth = 27,
    TollRoad = 28,
    TollZoneEnter = 29,
    TollZoneExit = 30,
    TrafficFlow = 31,
    TransitLineChange = 32,
    UnpavedRoad = 33,
    UnscheduledConstruction = 34,
    Weather = 35
  );
  PMaps_ManeuverWarningKind = ^Maps_ManeuverWarningKind;

  // Windows.Services.Maps.ManeuverWarningSeverity
  Maps_ManeuverWarningSeverity = (
    None = 0,
    LowImpact = 1,
    Minor = 2,
    Moderate = 3,
    Serious = 4
  );
  PMaps_ManeuverWarningSeverity = ^Maps_ManeuverWarningSeverity;

  // Windows.Services.TargetedContent.TargetedContentInteraction
  TargetedContent_TargetedContentInteraction = (
    Impression = 0,
    ClickThrough = 1,
    Hover = 2,
    Like = 3,
    Dislike = 4,
    Dismiss = 5,
    Ineligible = 6,
    Accept = 7,
    Decline = 8,
    Defer = 9,
    Canceled = 10,
    Conversion = 11,
    Opportunity = 12
  );
  PTargetedContent_TargetedContentInteraction = ^TargetedContent_TargetedContentInteraction;

  // Windows.Services.TargetedContent.TargetedContentValueKind
  TargetedContent_TargetedContentValueKind = (
    &String = 0,
    Uri = 1,
    Number = 2,
    Boolean = 3,
    &File = 4,
    ImageFile = 5,
    Action = 6,
    Strings = 7,
    Uris = 8,
    Numbers = 9,
    Booleans = 10,
    Files = 11,
    ImageFiles = 12,
    Actions = 13
  );
  PTargetedContent_TargetedContentValueKind = ^TargetedContent_TargetedContentValueKind;

  // Windows.Services.TargetedContent.TargetedContentObjectKind
  TargetedContent_TargetedContentObjectKind = (
    Collection = 0,
    Item = 1,
    Value = 2
  );
  PTargetedContent_TargetedContentObjectKind = ^TargetedContent_TargetedContentObjectKind;

  // Windows.Services.TargetedContent.TargetedContentAvailability
  TargetedContent_TargetedContentAvailability = (
    None = 0,
    Partial = 1,
    All = 2
  );
  PTargetedContent_TargetedContentAvailability = ^TargetedContent_TargetedContentAvailability;

  // Windows.Services.TargetedContent.TargetedContentAppInstallationState
  TargetedContent_TargetedContentAppInstallationState = (
    NotApplicable = 0,
    NotInstalled = 1,
    Installed = 2
  );
  PTargetedContent_TargetedContentAppInstallationState = ^TargetedContent_TargetedContentAppInstallationState;

  // Windows.Services.Maps.LocalSearch.LocalLocationFinderStatus
  Maps_LocalSearch_LocalLocationFinderStatus = (
    Success = 0,
    UnknownError = 1,
    InvalidCredentials = 2,
    InvalidCategory = 3,
    InvalidSearchTerm = 4,
    InvalidSearchArea = 5,
    NetworkFailure = 6,
    NotSupported = 7
  );
  PMaps_LocalSearch_LocalLocationFinderStatus = ^Maps_LocalSearch_LocalLocationFinderStatus;

  // Windows.Services.Maps.Guidance.GuidanceManeuverKind
  Maps_Guidance_GuidanceManeuverKind = (
    None = 0,
    GoStraight = 1,
    UTurnRight = 2,
    UTurnLeft = 3,
    TurnKeepRight = 4,
    TurnLightRight = 5,
    TurnRight = 6,
    TurnHardRight = 7,
    KeepMiddle = 8,
    TurnKeepLeft = 9,
    TurnLightLeft = 10,
    TurnLeft = 11,
    TurnHardLeft = 12,
    FreewayEnterRight = 13,
    FreewayEnterLeft = 14,
    FreewayLeaveRight = 15,
    FreewayLeaveLeft = 16,
    FreewayKeepRight = 17,
    FreewayKeepLeft = 18,
    TrafficCircleRight1 = 19,
    TrafficCircleRight2 = 20,
    TrafficCircleRight3 = 21,
    TrafficCircleRight4 = 22,
    TrafficCircleRight5 = 23,
    TrafficCircleRight6 = 24,
    TrafficCircleRight7 = 25,
    TrafficCircleRight8 = 26,
    TrafficCircleRight9 = 27,
    TrafficCircleRight10 = 28,
    TrafficCircleRight11 = 29,
    TrafficCircleRight12 = 30,
    TrafficCircleLeft1 = 31,
    TrafficCircleLeft2 = 32,
    TrafficCircleLeft3 = 33,
    TrafficCircleLeft4 = 34,
    TrafficCircleLeft5 = 35,
    TrafficCircleLeft6 = 36,
    TrafficCircleLeft7 = 37,
    TrafficCircleLeft8 = 38,
    TrafficCircleLeft9 = 39,
    TrafficCircleLeft10 = 40,
    TrafficCircleLeft11 = 41,
    TrafficCircleLeft12 = 42,
    Start = 43,
    &End = 44,
    TakeFerry = 45,
    PassTransitStation = 46,
    LeaveTransitStation = 47
  );
  PMaps_Guidance_GuidanceManeuverKind = ^Maps_Guidance_GuidanceManeuverKind;

  // Windows.Services.Maps.Guidance.GuidanceMode
  Maps_Guidance_GuidanceMode = (
    None = 0,
    Simulation = 1,
    Navigation = 2,
    Tracking = 3
  );
  PMaps_Guidance_GuidanceMode = ^Maps_Guidance_GuidanceMode;

  // Windows.Services.Maps.Guidance.GuidanceAudioMeasurementSystem
  Maps_Guidance_GuidanceAudioMeasurementSystem = (
    Meters = 0,
    MilesAndYards = 1,
    MilesAndFeet = 2
  );
  PMaps_Guidance_GuidanceAudioMeasurementSystem = ^Maps_Guidance_GuidanceAudioMeasurementSystem;

  // Windows.Services.Maps.Guidance.GuidanceAudioNotifications
  Maps_Guidance_GuidanceAudioNotifications = (
    None = 0,
    Maneuver = 1,
    Route = 2,
    Gps = 4,
    SpeedLimit = 8,
    Traffic = 16,
    TrafficCamera = 32
  );
  PMaps_Guidance_GuidanceAudioNotifications = ^Maps_Guidance_GuidanceAudioNotifications;

  // Windows.Services.Maps.Guidance.GuidanceAudioNotificationKind
  Maps_Guidance_GuidanceAudioNotificationKind = (
    Maneuver = 0,
    Route = 1,
    Gps = 2,
    SpeedLimit = 3,
    Traffic = 4,
    TrafficCamera = 5
  );
  PMaps_Guidance_GuidanceAudioNotificationKind = ^Maps_Guidance_GuidanceAudioNotificationKind;

  // Windows.Services.Maps.Guidance.GuidanceLaneMarkers
  Maps_Guidance_GuidanceLaneMarkers = (
    None = 0,
    LightRight = 1,
    Right = 2,
    HardRight = 4,
    Straight = 8,
    UTurnLeft = 16,
    HardLeft = 32,
    Left = 64,
    LightLeft = 128,
    UTurnRight = 256,
    Unknown = -1
  );
  PMaps_Guidance_GuidanceLaneMarkers = ^Maps_Guidance_GuidanceLaneMarkers;

  // Windows.Services.Store.StorePurchaseStatus
  StorePurchaseStatus = (
    Succeeded = 0,
    AlreadyPurchased = 1,
    NotPurchased = 2,
    NetworkError = 3,
    ServerError = 4
  );
  PStorePurchaseStatus = ^StorePurchaseStatus;

  // Windows.Services.Store.StoreConsumableStatus
  StoreConsumableStatus = (
    Succeeded = 0,
    InsufficentQuantity = 1,
    NetworkError = 2,
    ServerError = 3
  );
  PStoreConsumableStatus = ^StoreConsumableStatus;

  // Windows.Services.Store.StoreDurationUnit
  StoreDurationUnit = (
    Minute = 0,
    Hour = 1,
    Day = 2,
    Week = 3,
    Month = 4,
    Year = 5
  );
  PStoreDurationUnit = ^StoreDurationUnit;

  // Windows.Services.Store.StorePackageUpdateState
  StorePackageUpdateState = (
    Pending = 0,
    Downloading = 1,
    Deploying = 2,
    Completed = 3,
    Canceled = 4,
    OtherError = 5,
    ErrorLowBattery = 6,
    ErrorWiFiRecommended = 7,
    ErrorWiFiRequired = 8
  );
  PStorePackageUpdateState = ^StorePackageUpdateState;

  // Windows.Storage.Compression.CompressAlgorithm
  Compression_CompressAlgorithm = (
    InvalidAlgorithm = 0,
    NullAlgorithm = 1,
    Mszip = 2,
    Xpress = 3,
    XpressHuff = 4,
    Lzms = 5
  );
  PCompression_CompressAlgorithm = ^Compression_CompressAlgorithm;

  // Windows.Storage.Pickers.Provider.AddFileResult
  Pickers_Provider_AddFileResult = (
    Added = 0,
    AlreadyAdded = 1,
    NotAllowed = 2,
    Unavailable = 3
  );
  PPickers_Provider_AddFileResult = ^Pickers_Provider_AddFileResult;

  // Windows.Storage.Pickers.Provider.FileSelectionMode
  Pickers_Provider_FileSelectionMode = (
    Single = 0,
    Multiple = 1
  );
  PPickers_Provider_FileSelectionMode = ^Pickers_Provider_FileSelectionMode;

  // Windows.Storage.Pickers.Provider.SetFileNameResult
  Pickers_Provider_SetFileNameResult = (
    Succeeded = 0,
    NotAllowed = 1,
    Unavailable = 2
  );
  PPickers_Provider_SetFileNameResult = ^Pickers_Provider_SetFileNameResult;

  // Windows.Storage.Provider.CachedFileTarget
  Provider_CachedFileTarget = (
    Local = 0,
    Remote = 1
  );
  PProvider_CachedFileTarget = ^Provider_CachedFileTarget;

  // Windows.Storage.Provider.UIStatus
  Provider_UIStatus = (
    Unavailable = 0,
    Hidden = 1,
    Visible = 2,
    Complete = 3
  );
  PProvider_UIStatus = ^Provider_UIStatus;

  // Windows.Storage.FileProperties.PropertyPrefetchOptions
  FileProperties_PropertyPrefetchOptions = (
    None = 0,
    MusicProperties = 1,
    VideoProperties = 2,
    ImageProperties = 4,
    DocumentProperties = 8,
    BasicProperties = 16
  );
  PFileProperties_PropertyPrefetchOptions = ^FileProperties_PropertyPrefetchOptions;

  // Windows.Storage.FileProperties.ThumbnailType
  FileProperties_ThumbnailType = (
    Image = 0,
    Icon = 1
  );
  PFileProperties_ThumbnailType = ^FileProperties_ThumbnailType;

  // Windows.Storage.FileProperties.ThumbnailMode
  FileProperties_ThumbnailMode = (
    PicturesView = 0,
    VideosView = 1,
    MusicView = 2,
    DocumentsView = 3,
    ListView = 4,
    SingleItem = 5
  );
  PFileProperties_ThumbnailMode = ^FileProperties_ThumbnailMode;

  // Windows.Storage.FileProperties.ThumbnailOptions
  FileProperties_ThumbnailOptions = (
    None = 0,
    ReturnOnlyIfCached = 1,
    ResizeThumbnail = 2,
    UseCurrentScale = 4
  );
  PFileProperties_ThumbnailOptions = ^FileProperties_ThumbnailOptions;

  // Windows.Storage.FileProperties.PhotoOrientation
  FileProperties_PhotoOrientation = (
    Unspecified = 0,
    Normal = 1,
    FlipHorizontal = 2,
    Rotate180 = 3,
    FlipVertical = 4,
    Transpose = 5,
    Rotate270 = 6,
    Transverse = 7,
    Rotate90 = 8
  );
  PFileProperties_PhotoOrientation = ^FileProperties_PhotoOrientation;

  // Windows.Storage.FileProperties.VideoOrientation
  FileProperties_VideoOrientation = (
    Normal = 0,
    Rotate90 = 90,
    Rotate180 = 180,
    Rotate270 = 270
  );
  PFileProperties_VideoOrientation = ^FileProperties_VideoOrientation;

  // Windows.Storage.KnownLibraryId
  KnownLibraryId = (
    Music = 0,
    Pictures = 1,
    Videos = 2,
    Documents = 3
  );
  PKnownLibraryId = ^KnownLibraryId;

  // Windows.Storage.KnownFolderId
  KnownFolderId = (
    AppCaptures = 0,
    CameraRoll = 1,
    DocumentsLibrary = 2,
    HomeGroup = 3,
    MediaServerDevices = 4,
    MusicLibrary = 5,
    Objects3D = 6,
    PicturesLibrary = 7,
    Playlists = 8,
    RecordedCalls = 9,
    RemovableDevices = 10,
    SavedPictures = 11,
    Screenshots = 12,
    VideosLibrary = 13,
    AllAppMods = 14,
    CurrentAppMods = 15
  );
  PKnownFolderId = ^KnownFolderId;

  // Windows.Storage.CreationCollisionOption
  CreationCollisionOption = (
    GenerateUniqueName = 0,
    ReplaceExisting = 1,
    FailIfExists = 2,
    OpenIfExists = 3
  );
  PCreationCollisionOption = ^CreationCollisionOption;

  // Windows.Storage.NameCollisionOption
  NameCollisionOption = (
    GenerateUniqueName = 0,
    ReplaceExisting = 1,
    FailIfExists = 2
  );
  PNameCollisionOption = ^NameCollisionOption;

  // Windows.Storage.StorageDeleteOption
  StorageDeleteOption = (
    Default = 0,
    PermanentDelete = 1
  );
  PStorageDeleteOption = ^StorageDeleteOption;

  // Windows.Storage.StorageItemTypes
  StorageItemTypes = (
    None = 0,
    &File = 1,
    Folder = 2
  );
  PStorageItemTypes = ^StorageItemTypes;

  // Windows.Storage.FileAttributes
  FileAttributes = (
    Normal = 0,
    ReadOnly = 1,
    Directory = 16,
    Archive = 32,
    Temporary = 256,
    LocallyIncomplete = 512
  );
  PFileAttributes = ^FileAttributes;

  // Windows.Storage.FileAccessMode
  FileAccessMode = (
    Read = 0,
    ReadWrite = 1
  );
  PFileAccessMode = ^FileAccessMode;

  // Windows.Storage.StorageLibraryChangeType
  StorageLibraryChangeType = (
    Created = 0,
    Deleted = 1,
    MovedOrRenamed = 2,
    ContentsChanged = 3,
    MovedOutOfLibrary = 4,
    MovedIntoLibrary = 5,
    ContentsReplaced = 6,
    IndexingStatusChanged = 7,
    EncryptionChanged = 8,
    ChangeTrackingLost = 9
  );
  PStorageLibraryChangeType = ^StorageLibraryChangeType;

  // Windows.Storage.Search.DateStackOption
  Search_DateStackOption = (
    None = 0,
    Year = 1,
    Month = 2
  );
  PSearch_DateStackOption = ^Search_DateStackOption;

  // Windows.Storage.Search.IndexerOption
  Search_IndexerOption = (
    UseIndexerWhenAvailable = 0,
    OnlyUseIndexer = 1,
    DoNotUseIndexer = 2,
    OnlyUseIndexerAndOptimizeForIndexedProperties = 3
  );
  PSearch_IndexerOption = ^Search_IndexerOption;

  // Windows.Storage.Search.FolderDepth
  Search_FolderDepth = (
    Shallow = 0,
    Deep = 1
  );
  PSearch_FolderDepth = ^Search_FolderDepth;

  // Windows.Storage.Search.CommonFileQuery
  Search_CommonFileQuery = (
    DefaultQuery = 0,
    OrderByName = 1,
    OrderByTitle = 2,
    OrderByMusicProperties = 3,
    OrderBySearchRank = 4,
    OrderByDate = 5
  );
  PSearch_CommonFileQuery = ^Search_CommonFileQuery;

  // Windows.Storage.Search.CommonFolderQuery
  Search_CommonFolderQuery = (
    DefaultQuery = 0,
    GroupByYear = 100,
    GroupByMonth = 101,
    GroupByArtist = 102,
    GroupByAlbum = 103,
    GroupByAlbumArtist = 104,
    GroupByComposer = 105,
    GroupByGenre = 106,
    GroupByPublishedYear = 107,
    GroupByRating = 108,
    GroupByTag = 109,
    GroupByAuthor = 110,
    GroupByType = 111
  );
  PSearch_CommonFolderQuery = ^Search_CommonFolderQuery;

  // Windows.Storage.Search.IndexedState
  Search_IndexedState = (
    Unknown = 0,
    NotIndexed = 1,
    PartiallyIndexed = 2,
    FullyIndexed = 3
  );
  PSearch_IndexedState = ^Search_IndexedState;

  // Windows.Storage.StreamedFileFailureMode
  StreamedFileFailureMode = (
    Failed = 0,
    CurrentlyUnavailable = 1,
    Incomplete = 2
  );
  PStreamedFileFailureMode = ^StreamedFileFailureMode;

  // Windows.Storage.Provider.FileUpdateStatus
  Provider_FileUpdateStatus = (
    Incomplete = 0,
    Complete = 1,
    UserInputNeeded = 2,
    CurrentlyUnavailable = 3,
    Failed = 4,
    CompleteAndRenamed = 5
  );
  PProvider_FileUpdateStatus = ^Provider_FileUpdateStatus;

  // Windows.Storage.Provider.CachedFileOptions
  Provider_CachedFileOptions = (
    None = 0,
    RequireUpdateOnAccess = 1,
    UseCachedFileWhenOffline = 2,
    DenyAccessWhenOffline = 4
  );
  PProvider_CachedFileOptions = ^Provider_CachedFileOptions;

  // Windows.Storage.Provider.ReadActivationMode
  Provider_ReadActivationMode = (
    NotNeeded = 0,
    BeforeAccess = 1
  );
  PProvider_ReadActivationMode = ^Provider_ReadActivationMode;

  // Windows.Storage.Provider.WriteActivationMode
  Provider_WriteActivationMode = (
    ReadOnly = 0,
    NotNeeded = 1,
    AfterWrite = 2
  );
  PProvider_WriteActivationMode = ^Provider_WriteActivationMode;

  // Windows.Storage.StorageOpenOptions
  StorageOpenOptions = (
    None = 0,
    AllowOnlyReaders = 1,
    AllowReadersAndWriters = 2
  );
  PStorageOpenOptions = ^StorageOpenOptions;

  // Windows.Storage.AccessCache.AccessCacheOptions
  AccessCache_AccessCacheOptions = (
    None = 0,
    DisallowUserInput = 1,
    FastLocationsOnly = 2,
    UseReadOnlyCachedCopy = 4,
    SuppressAccessTimeUpdate = 8
  );
  PAccessCache_AccessCacheOptions = ^AccessCache_AccessCacheOptions;

  // Windows.Storage.AccessCache.RecentStorageItemVisibility
  AccessCache_RecentStorageItemVisibility = (
    AppOnly = 0,
    AppAndSystem = 1
  );
  PAccessCache_RecentStorageItemVisibility = ^AccessCache_RecentStorageItemVisibility;

  // Windows.Storage.Pickers.PickerViewMode
  Pickers_PickerViewMode = (
    List = 0,
    Thumbnail = 1
  );
  PPickers_PickerViewMode = ^Pickers_PickerViewMode;

  // Windows.Storage.Pickers.PickerLocationId
  Pickers_PickerLocationId = (
    DocumentsLibrary = 0,
    ComputerFolder = 1,
    Desktop = 2,
    Downloads = 3,
    HomeGroup = 4,
    MusicLibrary = 5,
    PicturesLibrary = 6,
    VideosLibrary = 7,
    Objects3D = 8,
    Unspecified = 9
  );
  PPickers_PickerLocationId = ^Pickers_PickerLocationId;

  // Windows.Storage.ApplicationDataLocality
  ApplicationDataLocality = (
    Local = 0,
    Roaming = 1,
    Temporary = 2,
    LocalCache = 3
  );
  PApplicationDataLocality = ^ApplicationDataLocality;

  // Windows.Storage.ApplicationDataCreateDisposition
  ApplicationDataCreateDisposition = (
    Always = 0,
    Existing = 1
  );
  PApplicationDataCreateDisposition = ^ApplicationDataCreateDisposition;

  // Windows.Storage.Provider.StorageProviderHydrationPolicy
  Provider_StorageProviderHydrationPolicy = (
    Partial = 0,
    Progressive = 1,
    Full = 2,
    AlwaysFull = 3
  );
  PProvider_StorageProviderHydrationPolicy = ^Provider_StorageProviderHydrationPolicy;

  // Windows.Storage.Provider.StorageProviderPopulationPolicy
  Provider_StorageProviderPopulationPolicy = (
    Full = 1,
    AlwaysFull = 2
  );
  PProvider_StorageProviderPopulationPolicy = ^Provider_StorageProviderPopulationPolicy;

  // Windows.Storage.Provider.StorageProviderHydrationPolicyModifier
  Provider_StorageProviderHydrationPolicyModifier = (
    None = 0,
    ValidationRequired = 1,
    StreamingAllowed = 2
  );
  PProvider_StorageProviderHydrationPolicyModifier = ^Provider_StorageProviderHydrationPolicyModifier;

  // Windows.Storage.Provider.StorageProviderInSyncPolicy
  Provider_StorageProviderInSyncPolicy = (
    Default = 0,
    FileCreationTime = 1,
    FileReadOnlyAttribute = 2,
    FileHiddenAttribute = 4,
    FileSystemAttribute = 8,
    DirectoryCreationTime = 16,
    DirectoryReadOnlyAttribute = 32,
    DirectoryHiddenAttribute = 64,
    DirectorySystemAttribute = 128,
    FileLastWriteTime = 256,
    DirectoryLastWriteTime = 512,
    PreserveInsyncForSyncEngine = -2147483648
  );
  PProvider_StorageProviderInSyncPolicy = ^Provider_StorageProviderInSyncPolicy;

  // Windows.Storage.Provider.StorageProviderHardlinkPolicy
  Provider_StorageProviderHardlinkPolicy = (
    None = 0,
    Allowed = 1
  );
  PProvider_StorageProviderHardlinkPolicy = ^Provider_StorageProviderHardlinkPolicy;

  // Windows.Storage.Provider.StorageProviderProtectionMode
  Provider_StorageProviderProtectionMode = (
    Unknown = 0,
    Personal = 1
  );
  PProvider_StorageProviderProtectionMode = ^Provider_StorageProviderProtectionMode;

  // Windows.Storage.Streams.ByteOrder
  ByteOrder = (
    LittleEndian = 0,
    BigEndian = 1
  );
  PByteOrder = ^ByteOrder;

  // Windows.Storage.Streams.UnicodeEncoding
  UnicodeEncoding = (
    Utf8 = 0,
    Utf16LE = 1,
    Utf16BE = 2
  );
  PUnicodeEncoding = ^UnicodeEncoding;

  // Windows.Storage.Streams.InputStreamOptions
  InputStreamOptions = (
    None = 0,
    Partial = 1,
    ReadAhead = 2
  );
  PInputStreamOptions = ^InputStreamOptions;

  // Windows.Storage.Streams.FileOpenDisposition
  FileOpenDisposition = (
    OpenExisting = 0,
    OpenAlways = 1,
    CreateNew = 2,
    CreateAlways = 3,
    TruncateExisting = 4
  );
  PFileOpenDisposition = ^FileOpenDisposition;

  // Windows.ApplicationModel.Calls.VoipPhoneCallMedia
  Calls_VoipPhoneCallMedia = (
    None = 0,
    Audio = 1,
    Video = 2
  );
  PCalls_VoipPhoneCallMedia = ^Calls_VoipPhoneCallMedia;

  // Windows.ApplicationModel.Calls.VoipPhoneCallRejectReason
  Calls_VoipPhoneCallRejectReason = (
    UserIgnored = 0,
    TimedOut = 1,
    OtherIncomingCall = 2,
    EmergencyCallExists = 3,
    InvalidCallState = 4
  );
  PCalls_VoipPhoneCallRejectReason = ^Calls_VoipPhoneCallRejectReason;

  // Windows.ApplicationModel.Calls.VoipPhoneCallState
  Calls_VoipPhoneCallState = (
    Ended = 0,
    Held = 1,
    Active = 2,
    Incoming = 3,
    Outgoing = 4
  );
  PCalls_VoipPhoneCallState = ^Calls_VoipPhoneCallState;

  // Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus
  Calls_VoipPhoneCallResourceReservationStatus = (
    Success = 0,
    ResourcesNotAvailable = 1
  );
  PCalls_VoipPhoneCallResourceReservationStatus = ^Calls_VoipPhoneCallResourceReservationStatus;

  // Windows.ApplicationModel.SocialInfo.SocialItemBadgeStyle
  SocialInfo_SocialItemBadgeStyle = (
    Hidden = 0,
    Visible = 1,
    VisibleWithCount = 2
  );
  PSocialInfo_SocialItemBadgeStyle = ^SocialInfo_SocialItemBadgeStyle;

  // Windows.ApplicationModel.SocialInfo.SocialFeedKind
  SocialInfo_SocialFeedKind = (
    HomeFeed = 0,
    ContactFeed = 1,
    Dashboard = 2
  );
  PSocialInfo_SocialFeedKind = ^SocialInfo_SocialFeedKind;

  // Windows.ApplicationModel.SocialInfo.SocialFeedItemStyle
  SocialInfo_SocialFeedItemStyle = (
    Default = 0,
    Photo = 1
  );
  PSocialInfo_SocialFeedItemStyle = ^SocialInfo_SocialFeedItemStyle;

  // Windows.ApplicationModel.SocialInfo.SocialFeedUpdateMode
  SocialInfo_SocialFeedUpdateMode = (
    Append = 0,
    Replace = 1
  );
  PSocialInfo_SocialFeedUpdateMode = ^SocialInfo_SocialFeedUpdateMode;

  // Windows.ApplicationModel.StartupTaskState
  StartupTaskState = (
    Disabled = 0,
    DisabledByUser = 1,
    Enabled = 2,
    DisabledByPolicy = 3
  );
  PStartupTaskState = ^StartupTaskState;

  // Windows.ApplicationModel.Search.Core.SearchSuggestionKind
  Search_Core_SearchSuggestionKind = (
    Query = 0,
    Result = 1,
    Separator = 2
  );
  PSearch_Core_SearchSuggestionKind = ^Search_Core_SearchSuggestionKind;

  // Windows.ApplicationModel.PackageSignatureKind
  PackageSignatureKind = (
    None = 0,
    Developer = 1,
    Enterprise = 2,
    Store = 3,
    System = 4
  );
  PPackageSignatureKind = ^PackageSignatureKind;

  // Windows.ApplicationModel.PackageContentGroupState
  PackageContentGroupState = (
    NotStaged = 0,
    Queued = 1,
    Staging = 2,
    Staged = 3
  );
  PPackageContentGroupState = ^PackageContentGroupState;

  // Windows.ApplicationModel.AppService.AppServiceClosedStatus
  AppService_AppServiceClosedStatus = (
    Completed = 0,
    Canceled = 1,
    ResourceLimitsExceeded = 2,
    Unknown = 3
  );
  PAppService_AppServiceClosedStatus = ^AppService_AppServiceClosedStatus;

  // Windows.ApplicationModel.AppService.AppServiceConnectionStatus
  AppService_AppServiceConnectionStatus = (
    Success = 0,
    AppNotInstalled = 1,
    AppUnavailable = 2,
    AppServiceUnavailable = 3,
    Unknown = 4,
    RemoteSystemUnavailable = 5,
    RemoteSystemNotSupportedByApp = 6,
    NotAuthorized = 7
  );
  PAppService_AppServiceConnectionStatus = ^AppService_AppServiceConnectionStatus;

  // Windows.ApplicationModel.AppService.AppServiceResponseStatus
  AppService_AppServiceResponseStatus = (
    Success = 0,
    Failure = 1,
    ResourceLimitsExceeded = 2,
    Unknown = 3,
    RemoteSystemUnavailable = 4,
    MessageSizeTooLarge = 5
  );
  PAppService_AppServiceResponseStatus = ^AppService_AppServiceResponseStatus;

  // Windows.ApplicationModel.Appointments.AppointmentStoreAccessType
  Appointments_AppointmentStoreAccessType = (
    AppCalendarsReadWrite = 0,
    AllCalendarsReadOnly = 1,
    AllCalendarsReadWrite = 2
  );
  PAppointments_AppointmentStoreAccessType = ^Appointments_AppointmentStoreAccessType;

  // Windows.ApplicationModel.Appointments.AppointmentSensitivity
  Appointments_AppointmentSensitivity = (
    Public = 0,
    Private = 1
  );
  PAppointments_AppointmentSensitivity = ^Appointments_AppointmentSensitivity;

  // Windows.ApplicationModel.Appointments.AppointmentBusyStatus
  Appointments_AppointmentBusyStatus = (
    Busy = 0,
    Tentative = 1,
    Free = 2,
    OutOfOffice = 3,
    WorkingElsewhere = 4
  );
  PAppointments_AppointmentBusyStatus = ^Appointments_AppointmentBusyStatus;

  // Windows.ApplicationModel.Appointments.AppointmentParticipantResponse
  Appointments_AppointmentParticipantResponse = (
    None = 0,
    Tentative = 1,
    Accepted = 2,
    Declined = 3,
    Unknown = 4
  );
  PAppointments_AppointmentParticipantResponse = ^Appointments_AppointmentParticipantResponse;

  // Windows.ApplicationModel.Appointments.AppointmentParticipantRole
  Appointments_AppointmentParticipantRole = (
    RequiredAttendee = 0,
    OptionalAttendee = 1,
    Resource = 2
  );
  PAppointments_AppointmentParticipantRole = ^Appointments_AppointmentParticipantRole;

  // Windows.ApplicationModel.Appointments.AppointmentRecurrenceUnit
  Appointments_AppointmentRecurrenceUnit = (
    Daily = 0,
    Weekly = 1,
    Monthly = 2,
    MonthlyOnDay = 3,
    Yearly = 4,
    YearlyOnDay = 5
  );
  PAppointments_AppointmentRecurrenceUnit = ^Appointments_AppointmentRecurrenceUnit;

  // Windows.ApplicationModel.Appointments.AppointmentDaysOfWeek
  Appointments_AppointmentDaysOfWeek = (
    None = 0,
    Sunday = 1,
    Monday = 2,
    Tuesday = 4,
    Wednesday = 8,
    Thursday = 16,
    Friday = 32,
    Saturday = 64
  );
  PAppointments_AppointmentDaysOfWeek = ^Appointments_AppointmentDaysOfWeek;

  // Windows.ApplicationModel.Appointments.AppointmentWeekOfMonth
  Appointments_AppointmentWeekOfMonth = (
    First = 0,
    Second = 1,
    Third = 2,
    Fourth = 3,
    Last = 4
  );
  PAppointments_AppointmentWeekOfMonth = ^Appointments_AppointmentWeekOfMonth;

  // Windows.ApplicationModel.Appointments.AppointmentCalendarSyncStatus
  Appointments_AppointmentCalendarSyncStatus = (
    Idle = 0,
    Syncing = 1,
    UpToDate = 2,
    AuthenticationError = 3,
    PolicyError = 4,
    UnknownError = 5,
    ManualAccountRemovalRequired = 6
  );
  PAppointments_AppointmentCalendarSyncStatus = ^Appointments_AppointmentCalendarSyncStatus;

  // Windows.ApplicationModel.Appointments.RecurrenceType
  Appointments_RecurrenceType = (
    Master = 0,
    Instance = 1,
    ExceptionInstance = 2
  );
  PAppointments_RecurrenceType = ^Appointments_RecurrenceType;

  // Windows.ApplicationModel.Appointments.AppointmentDetailsKind
  Appointments_AppointmentDetailsKind = (
    PlainText = 0,
    Html = 1
  );
  PAppointments_AppointmentDetailsKind = ^Appointments_AppointmentDetailsKind;

  // Windows.ApplicationModel.Appointments.FindAppointmentCalendarsOptions
  Appointments_FindAppointmentCalendarsOptions = (
    None = 0,
    IncludeHidden = 1
  );
  PAppointments_FindAppointmentCalendarsOptions = ^Appointments_FindAppointmentCalendarsOptions;

  // Windows.ApplicationModel.Appointments.AppointmentSummaryCardView
  Appointments_AppointmentSummaryCardView = (
    System = 0,
    App = 1
  );
  PAppointments_AppointmentSummaryCardView = ^Appointments_AppointmentSummaryCardView;

  // Windows.ApplicationModel.Appointments.AppointmentCalendarOtherAppReadAccess
  Appointments_AppointmentCalendarOtherAppReadAccess = (
    SystemOnly = 0,
    Limited = 1,
    Full = 2,
    None = 3
  );
  PAppointments_AppointmentCalendarOtherAppReadAccess = ^Appointments_AppointmentCalendarOtherAppReadAccess;

  // Windows.ApplicationModel.Appointments.AppointmentCalendarOtherAppWriteAccess
  Appointments_AppointmentCalendarOtherAppWriteAccess = (
    None = 0,
    SystemOnly = 1,
    Limited = 2
  );
  PAppointments_AppointmentCalendarOtherAppWriteAccess = ^Appointments_AppointmentCalendarOtherAppWriteAccess;

  // Windows.ApplicationModel.Appointments.AppointmentConflictType
  Appointments_AppointmentConflictType = (
    None = 0,
    Adjacent = 1,
    Overlap = 2
  );
  PAppointments_AppointmentConflictType = ^Appointments_AppointmentConflictType;

  // Windows.ApplicationModel.Appointments.AppointmentStoreChangeType
  Appointments_AppointmentStoreChangeType = (
    AppointmentCreated = 0,
    AppointmentModified = 1,
    AppointmentDeleted = 2,
    ChangeTrackingLost = 3,
    CalendarCreated = 4,
    CalendarModified = 5,
    CalendarDeleted = 6
  );
  PAppointments_AppointmentStoreChangeType = ^Appointments_AppointmentStoreChangeType;

  // Windows.ApplicationModel.Chat.ChatMessageStatus
  Chat_ChatMessageStatus = (
    Draft = 0,
    Sending = 1,
    Sent = 2,
    SendRetryNeeded = 3,
    SendFailed = 4,
    Received = 5,
    ReceiveDownloadNeeded = 6,
    ReceiveDownloadFailed = 7,
    ReceiveDownloading = 8,
    Deleted = 9,
    Declined = 10,
    Cancelled = 11,
    Recalled = 12,
    ReceiveRetryNeeded = 13
  );
  PChat_ChatMessageStatus = ^Chat_ChatMessageStatus;

  // Windows.ApplicationModel.Chat.ChatMessageKind
  Chat_ChatMessageKind = (
    Standard = 0,
    FileTransferRequest = 1,
    TransportCustom = 2,
    JoinedConversation = 3,
    LeftConversation = 4,
    OtherParticipantJoinedConversation = 5,
    OtherParticipantLeftConversation = 6
  );
  PChat_ChatMessageKind = ^Chat_ChatMessageKind;

  // Windows.ApplicationModel.Chat.ChatMessageOperatorKind
  Chat_ChatMessageOperatorKind = (
    Unspecified = 0,
    Sms = 1,
    Mms = 2,
    Rcs = 3
  );
  PChat_ChatMessageOperatorKind = ^Chat_ChatMessageOperatorKind;

  // Windows.ApplicationModel.Chat.ChatMessageChangeType
  Chat_ChatMessageChangeType = (
    MessageCreated = 0,
    MessageModified = 1,
    MessageDeleted = 2,
    ChangeTrackingLost = 3
  );
  PChat_ChatMessageChangeType = ^Chat_ChatMessageChangeType;

  // Windows.ApplicationModel.Chat.ChatMessageValidationStatus
  Chat_ChatMessageValidationStatus = (
    Valid = 0,
    NoRecipients = 1,
    InvalidData = 2,
    MessageTooLarge = 3,
    TooManyRecipients = 4,
    TransportInactive = 5,
    TransportNotFound = 6,
    TooManyAttachments = 7,
    InvalidRecipients = 8,
    InvalidBody = 9,
    InvalidOther = 10,
    ValidWithLargeMessage = 11,
    VoiceRoamingRestriction = 12,
    DataRoamingRestriction = 13
  );
  PChat_ChatMessageValidationStatus = ^Chat_ChatMessageValidationStatus;

  // Windows.ApplicationModel.Chat.ChatConversationThreadingKind
  Chat_ChatConversationThreadingKind = (
    Participants = 0,
    ContactId = 1,
    ConversationId = 2,
    Custom = 3
  );
  PChat_ChatConversationThreadingKind = ^Chat_ChatConversationThreadingKind;

  // Windows.ApplicationModel.Chat.ChatStoreChangedEventKind
  Chat_ChatStoreChangedEventKind = (
    NotificationsMissed = 0,
    StoreModified = 1,
    MessageCreated = 2,
    MessageModified = 3,
    MessageDeleted = 4,
    ConversationModified = 5,
    ConversationDeleted = 6,
    ConversationTransportDeleted = 7
  );
  PChat_ChatStoreChangedEventKind = ^Chat_ChatStoreChangedEventKind;

  // Windows.ApplicationModel.Chat.ChatTransportErrorCodeCategory
  Chat_ChatTransportErrorCodeCategory = (
    None = 0,
    Http = 1,
    Network = 2,
    MmsServer = 3
  );
  PChat_ChatTransportErrorCodeCategory = ^Chat_ChatTransportErrorCodeCategory;

  // Windows.ApplicationModel.Chat.ChatTransportInterpretedErrorCode
  Chat_ChatTransportInterpretedErrorCode = (
    None = 0,
    Unknown = 1,
    InvalidRecipientAddress = 2,
    NetworkConnectivity = 3,
    ServiceDenied = 4,
    Timeout = 5
  );
  PChat_ChatTransportInterpretedErrorCode = ^Chat_ChatTransportInterpretedErrorCode;

  // Windows.ApplicationModel.Chat.ChatMessageTransportKind
  Chat_ChatMessageTransportKind = (
    Text = 0,
    Untriaged = 1,
    Blocked = 2,
    Custom = 3
  );
  PChat_ChatMessageTransportKind = ^Chat_ChatMessageTransportKind;

  // Windows.ApplicationModel.Chat.RcsServiceKind
  Chat_RcsServiceKind = (
    Chat = 0,
    GroupChat = 1,
    FileTransfer = 2,
    Capability = 3
  );
  PChat_RcsServiceKind = ^Chat_RcsServiceKind;

  // Windows.ApplicationModel.Chat.ChatItemKind
  Chat_ChatItemKind = (
    Message = 0,
    Conversation = 1
  );
  PChat_ChatItemKind = ^Chat_ChatItemKind;

  // Windows.ApplicationModel.Chat.ChatRestoreHistorySpan
  Chat_ChatRestoreHistorySpan = (
    LastMonth = 0,
    LastYear = 1,
    AnyTime = 2
  );
  PChat_ChatRestoreHistorySpan = ^Chat_ChatRestoreHistorySpan;

  // Windows.ApplicationModel.Email.EmailCertificateValidationStatus
  Email_EmailCertificateValidationStatus = (
    Success = 0,
    NoMatch = 1,
    InvalidUsage = 2,
    InvalidCertificate = 3,
    Revoked = 4,
    ChainRevoked = 5,
    RevocationServerFailure = 6,
    Expired = 7,
    Untrusted = 8,
    ServerError = 9,
    UnknownFailure = 10
  );
  PEmail_EmailCertificateValidationStatus = ^Email_EmailCertificateValidationStatus;

  // Windows.ApplicationModel.Email.EmailStoreAccessType
  Email_EmailStoreAccessType = (
    AppMailboxesReadWrite = 0,
    AllMailboxesLimitedReadWrite = 1
  );
  PEmail_EmailStoreAccessType = ^Email_EmailStoreAccessType;

  // Windows.ApplicationModel.Email.EmailMessageBodyKind
  Email_EmailMessageBodyKind = (
    Html = 0,
    PlainText = 1
  );
  PEmail_EmailMessageBodyKind = ^Email_EmailMessageBodyKind;

  // Windows.ApplicationModel.Email.EmailAttachmentDownloadState
  Email_EmailAttachmentDownloadState = (
    NotDownloaded = 0,
    Downloading = 1,
    Downloaded = 2,
    Failed = 3
  );
  PEmail_EmailAttachmentDownloadState = ^Email_EmailAttachmentDownloadState;

  // Windows.ApplicationModel.Email.EmailMessageDownloadState
  Email_EmailMessageDownloadState = (
    PartiallyDownloaded = 0,
    Downloading = 1,
    Downloaded = 2,
    Failed = 3
  );
  PEmail_EmailMessageDownloadState = ^Email_EmailMessageDownloadState;

  // Windows.ApplicationModel.Email.EmailSpecialFolderKind
  Email_EmailSpecialFolderKind = (
    None = 0,
    Root = 1,
    Inbox = 2,
    Outbox = 3,
    Drafts = 4,
    DeletedItems = 5,
    Sent = 6
  );
  PEmail_EmailSpecialFolderKind = ^Email_EmailSpecialFolderKind;

  // Windows.ApplicationModel.Email.EmailQueryKind
  Email_EmailQueryKind = (
    All = 0,
    Important = 1,
    Flagged = 2,
    Unread = 3,
    Read = 4,
    Unseen = 5
  );
  PEmail_EmailQueryKind = ^Email_EmailQueryKind;

  // Windows.ApplicationModel.Email.EmailMailboxChangeType
  Email_EmailMailboxChangeType = (
    MessageCreated = 0,
    MessageModified = 1,
    MessageDeleted = 2,
    FolderCreated = 3,
    FolderModified = 4,
    FolderDeleted = 5,
    ChangeTrackingLost = 6
  );
  PEmail_EmailMailboxChangeType = ^Email_EmailMailboxChangeType;

  // Windows.ApplicationModel.Email.EmailQuerySortDirection
  Email_EmailQuerySortDirection = (
    Descending = 0,
    Ascending = 1
  );
  PEmail_EmailQuerySortDirection = ^Email_EmailQuerySortDirection;

  // Windows.ApplicationModel.Email.EmailQuerySortProperty
  Email_EmailQuerySortProperty = (
    Date = 0
  );
  PEmail_EmailQuerySortProperty = ^Email_EmailQuerySortProperty;

  // Windows.ApplicationModel.Email.EmailQuerySearchFields
  Email_EmailQuerySearchFields = (
    None = 0,
    Subject = 1,
    Sender = 2,
    Preview = 4,
    Recipients = 8,
    All = -1
  );
  PEmail_EmailQuerySearchFields = ^Email_EmailQuerySearchFields;

  // Windows.ApplicationModel.Email.EmailBatchStatus
  Email_EmailBatchStatus = (
    Success = 0,
    ServerSearchSyncManagerError = 1,
    ServerSearchUnknownError = 2
  );
  PEmail_EmailBatchStatus = ^Email_EmailBatchStatus;

  // Windows.ApplicationModel.Email.EmailMessageResponseKind
  Email_EmailMessageResponseKind = (
    None = 0,
    Reply = 1,
    ReplyAll = 2,
    Forward = 3
  );
  PEmail_EmailMessageResponseKind = ^Email_EmailMessageResponseKind;

  // Windows.ApplicationModel.Email.EmailMeetingResponseType
  Email_EmailMeetingResponseType = (
    Accept = 0,
    Decline = 1,
    Tentative = 2
  );
  PEmail_EmailMeetingResponseType = ^Email_EmailMeetingResponseType;

  // Windows.ApplicationModel.Email.EmailMailboxActionKind
  Email_EmailMailboxActionKind = (
    MarkMessageAsSeen = 0,
    MarkMessageRead = 1,
    ChangeMessageFlagState = 2,
    MoveMessage = 3,
    SaveDraft = 4,
    SendMessage = 5,
    CreateResponseReplyMessage = 6,
    CreateResponseReplyAllMessage = 7,
    CreateResponseForwardMessage = 8,
    MoveFolder = 9,
    MarkFolderForSyncEnabled = 10
  );
  PEmail_EmailMailboxActionKind = ^Email_EmailMailboxActionKind;

  // Windows.ApplicationModel.Email.EmailImportance
  Email_EmailImportance = (
    Normal = 0,
    High = 1,
    Low = 2
  );
  PEmail_EmailImportance = ^Email_EmailImportance;

  // Windows.ApplicationModel.Email.EmailFlagState
  Email_EmailFlagState = (
    Unflagged = 0,
    Flagged = 1,
    Completed = 2,
    Cleared = 3
  );
  PEmail_EmailFlagState = ^Email_EmailFlagState;

  // Windows.ApplicationModel.Email.EmailMailboxSyncStatus
  Email_EmailMailboxSyncStatus = (
    Idle = 0,
    Syncing = 1,
    UpToDate = 2,
    AuthenticationError = 3,
    PolicyError = 4,
    UnknownError = 5,
    ManualAccountRemovalRequired = 6
  );
  PEmail_EmailMailboxSyncStatus = ^Email_EmailMailboxSyncStatus;

  // Windows.ApplicationModel.Email.EmailMailboxOtherAppReadAccess
  Email_EmailMailboxOtherAppReadAccess = (
    SystemOnly = 0,
    Full = 1,
    None = 2
  );
  PEmail_EmailMailboxOtherAppReadAccess = ^Email_EmailMailboxOtherAppReadAccess;

  // Windows.ApplicationModel.Email.EmailMailboxOtherAppWriteAccess
  Email_EmailMailboxOtherAppWriteAccess = (
    None = 0,
    Limited = 1
  );
  PEmail_EmailMailboxOtherAppWriteAccess = ^Email_EmailMailboxOtherAppWriteAccess;

  // Windows.ApplicationModel.Email.EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation
  Email_EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation = (
    None = 0,
    StrongAlgorithm = 1,
    AnyAlgorithm = 2
  );
  PEmail_EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation = ^Email_EmailMailboxAllowedSmimeEncryptionAlgorithmNegotiation;

  // Windows.ApplicationModel.Email.EmailMailboxSmimeEncryptionAlgorithm
  Email_EmailMailboxSmimeEncryptionAlgorithm = (
    Any = 0,
    TripleDes = 1,
    Des = 2,
    RC2128Bit = 3,
    RC264Bit = 4,
    RC240Bit = 5
  );
  PEmail_EmailMailboxSmimeEncryptionAlgorithm = ^Email_EmailMailboxSmimeEncryptionAlgorithm;

  // Windows.ApplicationModel.Email.EmailMailboxSmimeSigningAlgorithm
  Email_EmailMailboxSmimeSigningAlgorithm = (
    Any = 0,
    Sha1 = 1,
    MD5 = 2
  );
  PEmail_EmailMailboxSmimeSigningAlgorithm = ^Email_EmailMailboxSmimeSigningAlgorithm;

  // Windows.ApplicationModel.Email.EmailMailboxAutoReplyMessageResponseKind
  Email_EmailMailboxAutoReplyMessageResponseKind = (
    Html = 0,
    PlainText = 1
  );
  PEmail_EmailMailboxAutoReplyMessageResponseKind = ^Email_EmailMailboxAutoReplyMessageResponseKind;

  // Windows.ApplicationModel.Email.EmailQuerySearchScope
  Email_EmailQuerySearchScope = (
    Local = 0,
    Server = 1
  );
  PEmail_EmailQuerySearchScope = ^Email_EmailQuerySearchScope;

  // Windows.ApplicationModel.Email.EmailRecipientResolutionStatus
  Email_EmailRecipientResolutionStatus = (
    Success = 0,
    RecipientNotFound = 1,
    AmbiguousRecipient = 2,
    NoCertificate = 3,
    CertificateRequestLimitReached = 4,
    CannotResolveDistributionList = 5,
    ServerError = 6,
    UnknownFailure = 7
  );
  PEmail_EmailRecipientResolutionStatus = ^Email_EmailRecipientResolutionStatus;

  // Windows.ApplicationModel.Email.EmailMessageSmimeKind
  Email_EmailMessageSmimeKind = (
    None = 0,
    ClearSigned = 1,
    OpaqueSigned = 2,
    Encrypted = 3
  );
  PEmail_EmailMessageSmimeKind = ^Email_EmailMessageSmimeKind;

  // Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus
  Email_EmailMailboxEmptyFolderStatus = (
    Success = 0,
    NetworkError = 1,
    PermissionsError = 2,
    ServerError = 3,
    UnknownFailure = 4,
    CouldNotDeleteEverything = 5
  );
  PEmail_EmailMailboxEmptyFolderStatus = ^Email_EmailMailboxEmptyFolderStatus;

  // Windows.ApplicationModel.Email.EmailMailboxCreateFolderStatus
  Email_EmailMailboxCreateFolderStatus = (
    Success = 0,
    NetworkError = 1,
    PermissionsError = 2,
    ServerError = 3,
    UnknownFailure = 4,
    NameCollision = 5,
    ServerRejected = 6
  );
  PEmail_EmailMailboxCreateFolderStatus = ^Email_EmailMailboxCreateFolderStatus;

  // Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus
  Email_EmailMailboxDeleteFolderStatus = (
    Success = 0,
    NetworkError = 1,
    PermissionsError = 2,
    ServerError = 3,
    UnknownFailure = 4,
    CouldNotDeleteEverything = 5
  );
  PEmail_EmailMailboxDeleteFolderStatus = ^Email_EmailMailboxDeleteFolderStatus;

  // Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionReason
  ExtendedExecution_ExtendedExecutionReason = (
    Unspecified = 0,
    LocationTracking = 1,
    SavingData = 2
  );
  PExtendedExecution_ExtendedExecutionReason = ^ExtendedExecution_ExtendedExecutionReason;

  // Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult
  ExtendedExecution_ExtendedExecutionResult = (
    Allowed = 0,
    Denied = 1
  );
  PExtendedExecution_ExtendedExecutionResult = ^ExtendedExecution_ExtendedExecutionResult;

  // Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionRevokedReason
  ExtendedExecution_ExtendedExecutionRevokedReason = (
    Resumed = 0,
    SystemPolicy = 1
  );
  PExtendedExecution_ExtendedExecutionRevokedReason = ^ExtendedExecution_ExtendedExecutionRevokedReason;

  // Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult
  ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = (
    Allowed = 0,
    Denied = 1
  );
  PExtendedExecution_Foreground_ExtendedExecutionForegroundResult = ^ExtendedExecution_Foreground_ExtendedExecutionForegroundResult;

  // Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundRevokedReason
  ExtendedExecution_Foreground_ExtendedExecutionForegroundRevokedReason = (
    Resumed = 0,
    SystemPolicy = 1
  );
  PExtendedExecution_Foreground_ExtendedExecutionForegroundRevokedReason = ^ExtendedExecution_Foreground_ExtendedExecutionForegroundRevokedReason;

  // Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundReason
  ExtendedExecution_Foreground_ExtendedExecutionForegroundReason = (
    Unspecified = 0,
    SavingData = 1,
    BackgroundAudio = 2,
    Unconstrained = 3
  );
  PExtendedExecution_Foreground_ExtendedExecutionForegroundReason = ^ExtendedExecution_Foreground_ExtendedExecutionForegroundReason;

  // Windows.ApplicationModel.Calls.PhoneCallHistoryEntryOtherAppReadAccess
  Calls_PhoneCallHistoryEntryOtherAppReadAccess = (
    Full = 0,
    SystemOnly = 1
  );
  PCalls_PhoneCallHistoryEntryOtherAppReadAccess = ^Calls_PhoneCallHistoryEntryOtherAppReadAccess;

  // Windows.ApplicationModel.Calls.PhoneCallHistoryEntryMedia
  Calls_PhoneCallHistoryEntryMedia = (
    Audio = 0,
    Video = 1
  );
  PCalls_PhoneCallHistoryEntryMedia = ^Calls_PhoneCallHistoryEntryMedia;

  // Windows.ApplicationModel.Calls.PhoneCallHistoryEntryRawAddressKind
  Calls_PhoneCallHistoryEntryRawAddressKind = (
    PhoneNumber = 0,
    Custom = 1
  );
  PCalls_PhoneCallHistoryEntryRawAddressKind = ^Calls_PhoneCallHistoryEntryRawAddressKind;

  // Windows.ApplicationModel.Calls.PhoneCallHistoryEntryQueryDesiredMedia
  Calls_PhoneCallHistoryEntryQueryDesiredMedia = (
    None = 0,
    Audio = 1,
    Video = 2,
    All = -1
  );
  PCalls_PhoneCallHistoryEntryQueryDesiredMedia = ^Calls_PhoneCallHistoryEntryQueryDesiredMedia;

  // Windows.ApplicationModel.Calls.PhoneCallHistoryStoreAccessType
  Calls_PhoneCallHistoryStoreAccessType = (
    AppEntriesReadWrite = 0,
    AllEntriesLimitedReadWrite = 1,
    AllEntriesReadWrite = 2
  );
  PCalls_PhoneCallHistoryStoreAccessType = ^Calls_PhoneCallHistoryStoreAccessType;

  // Windows.ApplicationModel.Calls.PhoneCallHistorySourceIdKind
  Calls_PhoneCallHistorySourceIdKind = (
    CellularPhoneLineId = 0,
    PackageFamilyName = 1
  );
  PCalls_PhoneCallHistorySourceIdKind = ^Calls_PhoneCallHistorySourceIdKind;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskStoreAccessType
  UserDataTasks_UserDataTaskStoreAccessType = (
    AppTasksReadWrite = 0,
    AllTasksLimitedReadWrite = 1
  );
  PUserDataTasks_UserDataTaskStoreAccessType = ^UserDataTasks_UserDataTaskStoreAccessType;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskListOtherAppReadAccess
  UserDataTasks_UserDataTaskListOtherAppReadAccess = (
    Full = 0,
    SystemOnly = 1,
    None = 2
  );
  PUserDataTasks_UserDataTaskListOtherAppReadAccess = ^UserDataTasks_UserDataTaskListOtherAppReadAccess;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskListOtherAppWriteAccess
  UserDataTasks_UserDataTaskListOtherAppWriteAccess = (
    Limited = 0,
    None = 1
  );
  PUserDataTasks_UserDataTaskListOtherAppWriteAccess = ^UserDataTasks_UserDataTaskListOtherAppWriteAccess;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskKind
  UserDataTasks_UserDataTaskKind = (
    Single = 0,
    Recurring = 1,
    Regenerating = 2
  );
  PUserDataTasks_UserDataTaskKind = ^UserDataTasks_UserDataTaskKind;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskPriority
  UserDataTasks_UserDataTaskPriority = (
    Normal = 0,
    Low = -1,
    High = 1
  );
  PUserDataTasks_UserDataTaskPriority = ^UserDataTasks_UserDataTaskPriority;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskSensitivity
  UserDataTasks_UserDataTaskSensitivity = (
    Public = 0,
    Private = 1
  );
  PUserDataTasks_UserDataTaskSensitivity = ^UserDataTasks_UserDataTaskSensitivity;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskDetailsKind
  UserDataTasks_UserDataTaskDetailsKind = (
    PlainText = 0,
    Html = 1
  );
  PUserDataTasks_UserDataTaskDetailsKind = ^UserDataTasks_UserDataTaskDetailsKind;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskRecurrenceUnit
  UserDataTasks_UserDataTaskRecurrenceUnit = (
    Daily = 0,
    Weekly = 1,
    Monthly = 2,
    MonthlyOnDay = 3,
    Yearly = 4,
    YearlyOnDay = 5
  );
  PUserDataTasks_UserDataTaskRecurrenceUnit = ^UserDataTasks_UserDataTaskRecurrenceUnit;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskRegenerationUnit
  UserDataTasks_UserDataTaskRegenerationUnit = (
    Daily = 0,
    Weekly = 1,
    Monthly = 2,
    Yearly = 4
  );
  PUserDataTasks_UserDataTaskRegenerationUnit = ^UserDataTasks_UserDataTaskRegenerationUnit;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskDaysOfWeek
  UserDataTasks_UserDataTaskDaysOfWeek = (
    None = 0,
    Sunday = 1,
    Monday = 2,
    Tuesday = 4,
    Wednesday = 8,
    Thursday = 16,
    Friday = 32,
    Saturday = 64
  );
  PUserDataTasks_UserDataTaskDaysOfWeek = ^UserDataTasks_UserDataTaskDaysOfWeek;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskQuerySortProperty
  UserDataTasks_UserDataTaskQuerySortProperty = (
    DueDate = 0
  );
  PUserDataTasks_UserDataTaskQuerySortProperty = ^UserDataTasks_UserDataTaskQuerySortProperty;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskQueryKind
  UserDataTasks_UserDataTaskQueryKind = (
    All = 0,
    Incomplete = 1,
    Complete = 2
  );
  PUserDataTasks_UserDataTaskQueryKind = ^UserDataTasks_UserDataTaskQueryKind;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskWeekOfMonth
  UserDataTasks_UserDataTaskWeekOfMonth = (
    First = 0,
    Second = 1,
    Third = 2,
    Fourth = 3,
    Last = 4
  );
  PUserDataTasks_UserDataTaskWeekOfMonth = ^UserDataTasks_UserDataTaskWeekOfMonth;

  // Windows.ApplicationModel.UserDataTasks.UserDataTaskListSyncStatus
  UserDataTasks_UserDataTaskListSyncStatus = (
    Idle = 0,
    Syncing = 1,
    UpToDate = 2,
    AuthenticationError = 3,
    PolicyError = 4,
    UnknownError = 5
  );
  PUserDataTasks_UserDataTaskListSyncStatus = ^UserDataTasks_UserDataTaskListSyncStatus;

  // Windows.ApplicationModel.UserActivities.UserActivityState
  UserActivities_UserActivityState = (
    New = 0,
    Published = 1
  );
  PUserActivities_UserActivityState = ^UserActivities_UserActivityState;

  // Windows.ApplicationModel.UserDataAccounts.Provider.UserDataAccountProviderOperationKind
  UserDataAccounts_Provider_UserDataAccountProviderOperationKind = (
    AddAccount = 0,
    Settings = 1,
    ResolveErrors = 2
  );
  PUserDataAccounts_Provider_UserDataAccountProviderOperationKind = ^UserDataAccounts_Provider_UserDataAccountProviderOperationKind;

  // Windows.ApplicationModel.UserDataAccounts.Provider.UserDataAccountProviderPartnerAccountKind
  UserDataAccounts_Provider_UserDataAccountProviderPartnerAccountKind = (
    Exchange = 0,
    PopOrImap = 1
  );
  PUserDataAccounts_Provider_UserDataAccountProviderPartnerAccountKind = ^UserDataAccounts_Provider_UserDataAccountProviderPartnerAccountKind;

  // Windows.ApplicationModel.UserDataAccounts.UserDataAccountOtherAppReadAccess
  UserDataAccounts_UserDataAccountOtherAppReadAccess = (
    SystemOnly = 0,
    Full = 1,
    None = 2
  );
  PUserDataAccounts_UserDataAccountOtherAppReadAccess = ^UserDataAccounts_UserDataAccountOtherAppReadAccess;

  // Windows.ApplicationModel.UserDataAccounts.UserDataAccountStoreAccessType
  UserDataAccounts_UserDataAccountStoreAccessType = (
    AllAccountsReadOnly = 0,
    AppAccountsReadWrite = 1
  );
  PUserDataAccounts_UserDataAccountStoreAccessType = ^UserDataAccounts_UserDataAccountStoreAccessType;

  // Windows.ApplicationModel.UserDataAccounts.UserDataAccountContentKinds
  UserDataAccounts_UserDataAccountContentKinds = (
    Email = 1,
    Contact = 2,
    Appointment = 4
  );
  PUserDataAccounts_UserDataAccountContentKinds = ^UserDataAccounts_UserDataAccountContentKinds;

  // Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountServerType
  UserDataAccounts_SystemAccess_DeviceAccountServerType = (
    Exchange = 0,
    Pop = 1,
    Imap = 2
  );
  PUserDataAccounts_SystemAccess_DeviceAccountServerType = ^UserDataAccounts_SystemAccess_DeviceAccountServerType;

  // Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountAuthenticationType
  UserDataAccounts_SystemAccess_DeviceAccountAuthenticationType = (
    Basic = 0,
    OAuth = 1,
    SingleSignOn = 2
  );
  PUserDataAccounts_SystemAccess_DeviceAccountAuthenticationType = ^UserDataAccounts_SystemAccess_DeviceAccountAuthenticationType;

  // Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountSyncScheduleKind
  UserDataAccounts_SystemAccess_DeviceAccountSyncScheduleKind = (
    Manual = 0,
    Every15Minutes = 1,
    Every30Minutes = 2,
    Every60Minutes = 3,
    Every2Hours = 4,
    Daily = 5,
    AsItemsArrive = 6
  );
  PUserDataAccounts_SystemAccess_DeviceAccountSyncScheduleKind = ^UserDataAccounts_SystemAccess_DeviceAccountSyncScheduleKind;

  // Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountMailAgeFilter
  UserDataAccounts_SystemAccess_DeviceAccountMailAgeFilter = (
    All = 0,
    Last1Day = 1,
    Last3Days = 2,
    Last7Days = 3,
    Last14Days = 4,
    Last30Days = 5,
    Last90Days = 6
  );
  PUserDataAccounts_SystemAccess_DeviceAccountMailAgeFilter = ^UserDataAccounts_SystemAccess_DeviceAccountMailAgeFilter;

  // Windows.ApplicationModel.UserDataAccounts.SystemAccess.DeviceAccountIconId
  UserDataAccounts_SystemAccess_DeviceAccountIconId = (
    Exchange = 0,
    Msa = 1,
    Outlook = 2,
    Generic = 3
  );
  PUserDataAccounts_SystemAccess_DeviceAccountIconId = ^UserDataAccounts_SystemAccess_DeviceAccountIconId;

  // Windows.ApplicationModel.Activation.ApplicationExecutionState
  Activation_ApplicationExecutionState = (
    NotRunning = 0,
    Running = 1,
    Suspended = 2,
    Terminated = 3,
    ClosedByUser = 4
  );
  PActivation_ApplicationExecutionState = ^Activation_ApplicationExecutionState;

  // Windows.ApplicationModel.Activation.ActivationKind
  Activation_ActivationKind = (
    Launch = 0,
    Search = 1,
    ShareTarget = 2,
    &File = 3,
    Protocol = 4,
    FileOpenPicker = 5,
    FileSavePicker = 6,
    CachedFileUpdater = 7,
    ContactPicker = 8,
    Device = 9,
    PrintTaskSettings = 10,
    CameraSettings = 11,
    RestrictedLaunch = 12,
    AppointmentsProvider = 13,
    Contact = 14,
    LockScreenCall = 15,
    VoiceCommand = 16,
    LockScreen = 17,
    PickerReturned = 1000,
    WalletAction = 1001,
    PickFileContinuation = 1002,
    PickSaveFileContinuation = 1003,
    PickFolderContinuation = 1004,
    WebAuthenticationBrokerContinuation = 1005,
    WebAccountProvider = 1006,
    ComponentUI = 1007,
    ProtocolForResults = 1009,
    ToastNotification = 1010,
    Print3DWorkflow = 1011,
    DialReceiver = 1012,
    DevicePairing = 1013,
    UserDataAccountsProvider = 1014,
    FilePickerExperience = 1015,
    LockScreenComponent = 1016,
    ContactPanel = 1017,
    PrintWorkflowForegroundTask = 1018,
    GameUIProvider = 1019,
    StartupTask = 1020,
    CommandLineLaunch = 1021
  );
  PActivation_ActivationKind = ^Activation_ActivationKind;

  // Windows.ApplicationModel.Payments.PaymentRequestStatus
  Payments_PaymentRequestStatus = (
    Succeeded = 0,
    Failed = 1,
    Canceled = 2
  );
  PPayments_PaymentRequestStatus = ^Payments_PaymentRequestStatus;

  // Windows.ApplicationModel.Payments.PaymentRequestCompletionStatus
  Payments_PaymentRequestCompletionStatus = (
    Succeeded = 0,
    Failed = 1,
    Unknown = 2
  );
  PPayments_PaymentRequestCompletionStatus = ^Payments_PaymentRequestCompletionStatus;

  // Windows.ApplicationModel.Payments.PaymentRequestChangeKind
  Payments_PaymentRequestChangeKind = (
    ShippingOption = 0,
    ShippingAddress = 1
  );
  PPayments_PaymentRequestChangeKind = ^Payments_PaymentRequestChangeKind;

  // Windows.ApplicationModel.Payments.PaymentOptionPresence
  Payments_PaymentOptionPresence = (
    None = 0,
    Optional = 1,
    Required = 2
  );
  PPayments_PaymentOptionPresence = ^Payments_PaymentOptionPresence;

  // Windows.ApplicationModel.Payments.PaymentShippingType
  Payments_PaymentShippingType = (
    Shipping = 0,
    Delivery = 1,
    Pickup = 2
  );
  PPayments_PaymentShippingType = ^Payments_PaymentShippingType;

  // Windows.ApplicationModel.Payments.PaymentCanMakePaymentResultStatus
  Payments_PaymentCanMakePaymentResultStatus = (
    Unknown = 0,
    Yes = 1,
    No = 2,
    NotAllowed = 3,
    UserNotSignedIn = 4,
    SpecifiedPaymentMethodIdsNotSupported = 5,
    NoQualifyingCardOnFile = 6
  );
  PPayments_PaymentCanMakePaymentResultStatus = ^Payments_PaymentCanMakePaymentResultStatus;

  // Windows.ApplicationModel.Resources.Core.ResourceQualifierPersistence
  Resources_Core_ResourceQualifierPersistence = (
    None = 0,
    LocalMachine = 1
  );
  PResources_Core_ResourceQualifierPersistence = ^Resources_Core_ResourceQualifierPersistence;

  // Windows.ApplicationModel.Store.Preview.InstallControl.GetEntitlementStatus
  Store_Preview_InstallControl_GetEntitlementStatus = (
    Succeeded = 0,
    NoStoreAccount = 1,
    NetworkError = 2,
    ServerError = 3
  );
  PStore_Preview_InstallControl_GetEntitlementStatus = ^Store_Preview_InstallControl_GetEntitlementStatus;

  // Windows.ApplicationModel.Store.Preview.InstallControl.AppInstallState
  Store_Preview_InstallControl_AppInstallState = (
    Pending = 0,
    Starting = 1,
    AcquiringLicense = 2,
    Downloading = 3,
    RestoringData = 4,
    Installing = 5,
    Completed = 6,
    Canceled = 7,
    Paused = 8,
    Error = 9,
    PausedLowBattery = 10,
    PausedWiFiRecommended = 11,
    PausedWiFiRequired = 12,
    ReadyToDownload = 13
  );
  PStore_Preview_InstallControl_AppInstallState = ^Store_Preview_InstallControl_AppInstallState;

  // Windows.ApplicationModel.Store.Preview.InstallControl.AppInstallType
  Store_Preview_InstallControl_AppInstallType = (
    Install = 0,
    Update = 1,
    Repair = 2
  );
  PStore_Preview_InstallControl_AppInstallType = ^Store_Preview_InstallControl_AppInstallType;

  // Windows.ApplicationModel.Store.Preview.InstallControl.AutoUpdateSetting
  Store_Preview_InstallControl_AutoUpdateSetting = (
    Disabled = 0,
    Enabled = 1,
    DisabledByPolicy = 2,
    EnabledByPolicy = 3
  );
  PStore_Preview_InstallControl_AutoUpdateSetting = ^Store_Preview_InstallControl_AutoUpdateSetting;

  // Windows.ApplicationModel.Store.LicenseManagement.LicenseRefreshOption
  Store_LicenseManagement_LicenseRefreshOption = (
    RunningLicenses = 0,
    AllLicenses = 1
  );
  PStore_LicenseManagement_LicenseRefreshOption = ^Store_LicenseManagement_LicenseRefreshOption;

  // Windows.ApplicationModel.Store.Preview.StorePreviewProductPurchaseStatus
  Store_Preview_StorePreviewProductPurchaseStatus = (
    Succeeded = 0,
    AlreadyPurchased = 1,
    NotFulfilled = 2,
    NotPurchased = 3
  );
  PStore_Preview_StorePreviewProductPurchaseStatus = ^Store_Preview_StorePreviewProductPurchaseStatus;

  // Windows.ApplicationModel.Store.Preview.StoreSystemFeature
  Store_Preview_StoreSystemFeature = (
    ArchitectureX86 = 0,
    ArchitectureX64 = 1,
    ArchitectureArm = 2,
    DirectX9 = 3,
    DirectX10 = 4,
    DirectX11 = 5,
    D3D12HardwareFL11 = 6,
    D3D12HardwareFL12 = 7,
    Memory300MB = 8,
    Memory750MB = 9,
    Memory1GB = 10,
    Memory2GB = 11,
    CameraFront = 12,
    CameraRear = 13,
    Gyroscope = 14,
    Hover = 15,
    Magnetometer = 16,
    Nfc = 17,
    Resolution720P = 18,
    ResolutionWvga = 19,
    ResolutionWvgaOr720P = 20,
    ResolutionWxga = 21,
    ResolutionWvgaOrWxga = 22,
    ResolutionWxgaOr720P = 23,
    Memory4GB = 24,
    Memory6GB = 25,
    Memory8GB = 26,
    Memory12GB = 27,
    Memory16GB = 28,
    Memory20GB = 29,
    VideoMemory2GB = 30,
    VideoMemory4GB = 31,
    VideoMemory6GB = 32,
    VideoMemory1GB = 33
  );
  PStore_Preview_StoreSystemFeature = ^Store_Preview_StoreSystemFeature;

  // Windows.ApplicationModel.Store.Preview.StoreLogOptions
  Store_Preview_StoreLogOptions = (
    None = 0,
    TryElevate = 1
  );
  PStore_Preview_StoreLogOptions = ^Store_Preview_StoreLogOptions;

  // Windows.ApplicationModel.Store.ProductPurchaseStatus
  Store_ProductPurchaseStatus = (
    Succeeded = 0,
    AlreadyPurchased = 1,
    NotFulfilled = 2,
    NotPurchased = 3
  );
  PStore_ProductPurchaseStatus = ^Store_ProductPurchaseStatus;

  // Windows.ApplicationModel.Store.ProductType
  Store_ProductType = (
    Unknown = 0,
    Durable = 1,
    Consumable = 2
  );
  PStore_ProductType = ^Store_ProductType;

  // Windows.ApplicationModel.Store.FulfillmentResult
  Store_FulfillmentResult = (
    Succeeded = 0,
    NothingToFulfill = 1,
    PurchasePending = 2,
    PurchaseReverted = 3,
    ServerError = 4
  );
  PStore_FulfillmentResult = ^Store_FulfillmentResult;

  // Windows.ApplicationModel.VoiceCommands.VoiceCommandContentTileType
  VoiceCommands_VoiceCommandContentTileType = (
    TitleOnly = 0,
    TitleWithText = 1,
    TitleWith68x68Icon = 2,
    TitleWith68x68IconAndText = 3,
    TitleWith68x92Icon = 4,
    TitleWith68x92IconAndText = 5,
    TitleWith280x140Icon = 6,
    TitleWith280x140IconAndText = 7
  );
  PVoiceCommands_VoiceCommandContentTileType = ^VoiceCommands_VoiceCommandContentTileType;

  // Windows.ApplicationModel.VoiceCommands.VoiceCommandCompletionReason
  VoiceCommands_VoiceCommandCompletionReason = (
    Unknown = 0,
    CommunicationFailed = 1,
    ResourceLimitsExceeded = 2,
    Canceled = 3,
    TimeoutExceeded = 4,
    AppLaunched = 5,
    Completed = 6
  );
  PVoiceCommands_VoiceCommandCompletionReason = ^VoiceCommands_VoiceCommandCompletionReason;

  // Windows.ApplicationModel.Wallet.WalletBarcodeSymbology
  Wallet_WalletBarcodeSymbology = (
    Invalid = 0,
    Upca = 1,
    Upce = 2,
    Ean13 = 3,
    Ean8 = 4,
    Itf = 5,
    Code39 = 6,
    Code128 = 7,
    Qr = 8,
    Pdf417 = 9,
    Aztec = 10,
    Custom = 100000
  );
  PWallet_WalletBarcodeSymbology = ^Wallet_WalletBarcodeSymbology;

  // Windows.ApplicationModel.Wallet.WalletDetailViewPosition
  Wallet_WalletDetailViewPosition = (
    Hidden = 0,
    HeaderField1 = 1,
    HeaderField2 = 2,
    PrimaryField1 = 3,
    PrimaryField2 = 4,
    SecondaryField1 = 5,
    SecondaryField2 = 6,
    SecondaryField3 = 7,
    SecondaryField4 = 8,
    SecondaryField5 = 9,
    CenterField1 = 10,
    FooterField1 = 11,
    FooterField2 = 12,
    FooterField3 = 13,
    FooterField4 = 14
  );
  PWallet_WalletDetailViewPosition = ^Wallet_WalletDetailViewPosition;

  // Windows.ApplicationModel.Wallet.WalletSummaryViewPosition
  Wallet_WalletSummaryViewPosition = (
    Hidden = 0,
    Field1 = 1,
    Field2 = 2
  );
  PWallet_WalletSummaryViewPosition = ^Wallet_WalletSummaryViewPosition;

  // Windows.ApplicationModel.Wallet.WalletItemKind
  Wallet_WalletItemKind = (
    Invalid = 0,
    Deal = 1,
    General = 2,
    PaymentInstrument = 3,
    Ticket = 4,
    BoardingPass = 5,
    MembershipCard = 6
  );
  PWallet_WalletItemKind = ^Wallet_WalletItemKind;

  // Windows.ApplicationModel.Wallet.System.WalletItemAppAssociation
  Wallet_System_WalletItemAppAssociation = (
    None = 0,
    AppInstalled = 1,
    AppNotInstalled = 2
  );
  PWallet_System_WalletItemAppAssociation = ^Wallet_System_WalletItemAppAssociation;

  // Windows.ApplicationModel.Calls.Background.PhoneCallBlockedReason
  Calls_Background_PhoneCallBlockedReason = (
    InCallBlockingList = 0,
    PrivateNumber = 1,
    UnknownNumber = 2
  );
  PCalls_Background_PhoneCallBlockedReason = ^Calls_Background_PhoneCallBlockedReason;

  // Windows.ApplicationModel.Calls.Background.PhoneTriggerType
  Calls_Background_PhoneTriggerType = (
    NewVoicemailMessage = 0,
    CallHistoryChanged = 1,
    LineChanged = 2,
    AirplaneModeDisabledForEmergencyCall = 3,
    CallOriginDataRequest = 4,
    CallBlocked = 5
  );
  PCalls_Background_PhoneTriggerType = ^Calls_Background_PhoneTriggerType;

  // Windows.ApplicationModel.Calls.Background.PhoneLineChangeKind
  Calls_Background_PhoneLineChangeKind = (
    Added = 0,
    Removed = 1,
    PropertiesChanged = 2
  );
  PCalls_Background_PhoneLineChangeKind = ^Calls_Background_PhoneLineChangeKind;

  // Windows.ApplicationModel.Calls.Background.PhoneLineProperties
  Calls_Background_PhoneLineProperties = (
    None = 0,
    BrandingOptions = 1,
    CanDial = 2,
    CellularDetails = 4,
    DisplayColor = 8,
    DisplayName = 16,
    NetworkName = 32,
    NetworkState = 64,
    Transport = 128,
    Voicemail = 256
  );
  PCalls_Background_PhoneLineProperties = ^Calls_Background_PhoneLineProperties;

  // Windows.ApplicationModel.Resources.Management.IndexedResourceType
  Resources_Management_IndexedResourceType = (
    &String = 0,
    Path = 1,
    EmbeddedData = 2
  );
  PResources_Management_IndexedResourceType = ^Resources_Management_IndexedResourceType;

  // Windows.ApplicationModel.Wallet.WalletActionKind
  Wallet_WalletActionKind = (
    OpenItem = 0,
    Transaction = 1,
    MoreTransactions = 2,
    Message = 3,
    Verb = 4
  );
  PWallet_WalletActionKind = ^Wallet_WalletActionKind;

  // Windows.ApplicationModel.Background.ApplicationTriggerResult
  ApplicationTriggerResult = (
    Allowed = 0,
    CurrentlyRunning = 1,
    DisabledByPolicy = 2,
    UnknownError = 3
  );
  PApplicationTriggerResult = ^ApplicationTriggerResult;

  // Windows.ApplicationModel.Background.MediaProcessingTriggerResult
  MediaProcessingTriggerResult = (
    Allowed = 0,
    CurrentlyRunning = 1,
    DisabledByPolicy = 2,
    UnknownError = 3
  );
  PMediaProcessingTriggerResult = ^MediaProcessingTriggerResult;

  // Windows.ApplicationModel.Background.SystemTriggerType
  SystemTriggerType = (
    Invalid = 0,
    SmsReceived = 1,
    UserPresent = 2,
    UserAway = 3,
    NetworkStateChange = 4,
    ControlChannelReset = 5,
    InternetAvailable = 6,
    SessionConnected = 7,
    ServicingComplete = 8,
    LockScreenApplicationAdded = 9,
    LockScreenApplicationRemoved = 10,
    TimeZoneChange = 11,
    OnlineIdConnectedStateChange = 12,
    BackgroundWorkCostChange = 13,
    PowerStateChange = 14,
    DefaultSignInAccountChange = 15
  );
  PSystemTriggerType = ^SystemTriggerType;

  // Windows.ApplicationModel.Background.SystemConditionType
  SystemConditionType = (
    Invalid = 0,
    UserPresent = 1,
    UserNotPresent = 2,
    InternetAvailable = 3,
    InternetNotAvailable = 4,
    SessionConnected = 5,
    SessionDisconnected = 6,
    FreeNetworkAvailable = 7,
    BackgroundWorkCostNotHigh = 8
  );
  PSystemConditionType = ^SystemConditionType;

  // Windows.ApplicationModel.Background.BackgroundAccessStatus
  BackgroundAccessStatus = (
    Unspecified = 0,
    AllowedWithAlwaysOnRealTimeConnectivity = 1,
    AllowedMayUseActiveRealTimeConnectivity = 2,
    Denied = 3,
    AlwaysAllowed = 4,
    AllowedSubjectToSystemPolicy = 5,
    DeniedBySystemPolicy = 6,
    DeniedByUser = 7
  );
  PBackgroundAccessStatus = ^BackgroundAccessStatus;

  // Windows.ApplicationModel.Background.BackgroundTaskCancellationReason
  BackgroundTaskCancellationReason = (
    Abort = 0,
    Terminating = 1,
    LoggingOff = 2,
    ServicingUpdate = 3,
    IdleTask = 4,
    Uninstall = 5,
    ConditionLoss = 6,
    SystemPolicy = 7,
    QuietHoursEntered = 8,
    ExecutionTimeExceeded = 9,
    ResourceRevocation = 10,
    EnergySaver = 11
  );
  PBackgroundTaskCancellationReason = ^BackgroundTaskCancellationReason;

  // Windows.ApplicationModel.Background.BackgroundWorkCostValue
  BackgroundWorkCostValue = (
    Low = 0,
    Medium = 1,
    High = 2
  );
  PBackgroundWorkCostValue = ^BackgroundWorkCostValue;

  // Windows.ApplicationModel.Background.BackgroundTaskThrottleCounter
  BackgroundTaskThrottleCounter = (
    All = 0,
    Cpu = 1,
    Network = 2
  );
  PBackgroundTaskThrottleCounter = ^BackgroundTaskThrottleCounter;

  // Windows.ApplicationModel.Background.DeviceTriggerResult
  DeviceTriggerResult = (
    Allowed = 0,
    DeniedByUser = 1,
    DeniedBySystem = 2,
    LowBattery = 3
  );
  PDeviceTriggerResult = ^DeviceTriggerResult;

  // Windows.ApplicationModel.Background.LocationTriggerType
  LocationTriggerType = (
    Geofence = 0
  );
  PLocationTriggerType = ^LocationTriggerType;

  // Windows.ApplicationModel.Background.AlarmAccessStatus
  AlarmAccessStatus = (
    Unspecified = 0,
    AllowedWithWakeupCapability = 1,
    AllowedWithoutWakeupCapability = 2,
    Denied = 3
  );
  PAlarmAccessStatus = ^AlarmAccessStatus;

  // Windows.ApplicationModel.Contacts.ContactSelectionMode
  ContactSelectionMode = (
    Contacts = 0,
    Fields = 1
  );
  PContactSelectionMode = ^ContactSelectionMode;

  // Windows.ApplicationModel.Contacts.ContactChangeType
  ContactChangeType = (
    Created = 0,
    Modified = 1,
    Deleted = 2,
    ChangeTrackingLost = 3
  );
  PContactChangeType = ^ContactChangeType;

  // Windows.ApplicationModel.Contacts.ContactQueryDesiredFields
  ContactQueryDesiredFields = (
    None = 0,
    PhoneNumber = 1,
    EmailAddress = 2,
    PostalAddress = 4
  );
  PContactQueryDesiredFields = ^ContactQueryDesiredFields;

  // Windows.ApplicationModel.Contacts.ContactQuerySearchFields
  ContactQuerySearchFields = (
    None = 0,
    Name = 1,
    Email = 2,
    Phone = 4,
    All = -1
  );
  PContactQuerySearchFields = ^ContactQuerySearchFields;

  // Windows.ApplicationModel.Contacts.ContactQuerySearchScope
  ContactQuerySearchScope = (
    Local = 0,
    Server = 1
  );
  PContactQuerySearchScope = ^ContactQuerySearchScope;

  // Windows.ApplicationModel.Contacts.ContactStoreAccessType
  ContactStoreAccessType = (
    AppContactsReadWrite = 0,
    AllContactsReadOnly = 1,
    AllContactsReadWrite = 2
  );
  PContactStoreAccessType = ^ContactStoreAccessType;

  // Windows.ApplicationModel.Contacts.ContactAnnotationStoreAccessType
  ContactAnnotationStoreAccessType = (
    AppAnnotationsReadWrite = 0,
    AllAnnotationsReadWrite = 1
  );
  PContactAnnotationStoreAccessType = ^ContactAnnotationStoreAccessType;

  // Windows.ApplicationModel.Contacts.ContactListOtherAppReadAccess
  ContactListOtherAppReadAccess = (
    SystemOnly = 0,
    Limited = 1,
    Full = 2,
    None = 3
  );
  PContactListOtherAppReadAccess = ^ContactListOtherAppReadAccess;

  // Windows.ApplicationModel.Contacts.ContactListOtherAppWriteAccess
  ContactListOtherAppWriteAccess = (
    None = 0,
    SystemOnly = 1,
    Limited = 2
  );
  PContactListOtherAppWriteAccess = ^ContactListOtherAppWriteAccess;

  // Windows.ApplicationModel.Contacts.ContactMatchReasonKind
  ContactMatchReasonKind = (
    Name = 0,
    EmailAddress = 1,
    PhoneNumber = 2,
    JobInfo = 3,
    YomiName = 4,
    Other = 5
  );
  PContactMatchReasonKind = ^ContactMatchReasonKind;

  // Windows.ApplicationModel.Contacts.ContactBatchStatus
  ContactBatchStatus = (
    Success = 0,
    ServerSearchSyncManagerError = 1,
    ServerSearchUnknownError = 2
  );
  PContactBatchStatus = ^ContactBatchStatus;

  // Windows.ApplicationModel.Contacts.ContactAnnotationOperations
  ContactAnnotationOperations = (
    None = 0,
    ContactProfile = 1,
    Message = 2,
    AudioCall = 4,
    VideoCall = 8,
    SocialFeeds = 16,
    Share = 32
  );
  PContactAnnotationOperations = ^ContactAnnotationOperations;

  // Windows.ApplicationModel.Contacts.ContactNameOrder
  ContactNameOrder = (
    FirstNameLastName = 0,
    LastNameFirstName = 1
  );
  PContactNameOrder = ^ContactNameOrder;

  // Windows.ApplicationModel.Contacts.ContactListSyncStatus
  ContactListSyncStatus = (
    Idle = 0,
    Syncing = 1,
    UpToDate = 2,
    AuthenticationError = 3,
    PolicyError = 4,
    UnknownError = 5,
    ManualAccountRemovalRequired = 6
  );
  PContactListSyncStatus = ^ContactListSyncStatus;

  // Windows.ApplicationModel.Contacts.ContactCardHeaderKind
  ContactCardHeaderKind = (
    Default = 0,
    Basic = 1,
    Enterprise = 2
  );
  PContactCardHeaderKind = ^ContactCardHeaderKind;

  // Windows.ApplicationModel.Contacts.ContactCardTabKind
  ContactCardTabKind = (
    Default = 0,
    Email = 1,
    Messaging = 2,
    Phone = 3,
    Video = 4,
    OrganizationalHierarchy = 5
  );
  PContactCardTabKind = ^ContactCardTabKind;

  // Windows.ApplicationModel.Contacts.Provider.AddContactResult
  Provider_AddContactResult = (
    Added = 0,
    AlreadyAdded = 1,
    Unavailable = 2
  );
  PProvider_AddContactResult = ^Provider_AddContactResult;

  // Windows.ApplicationModel.Contacts.ContactFieldType
  ContactFieldType = (
    Email = 0,
    PhoneNumber = 1,
    Location = 2,
    InstantMessage = 3,
    Custom = 4,
    ConnectedServiceAccount = 5,
    ImportantDate = 6,
    Address = 7,
    SignificantOther = 8,
    Notes = 9,
    Website = 10,
    JobInfo = 11
  );
  PContactFieldType = ^ContactFieldType;

  // Windows.ApplicationModel.Contacts.ContactEmailKind
  ContactEmailKind = (
    Personal = 0,
    Work = 1,
    Other = 2
  );
  PContactEmailKind = ^ContactEmailKind;

  // Windows.ApplicationModel.Contacts.ContactPhoneKind
  ContactPhoneKind = (
    Home = 0,
    Mobile = 1,
    Work = 2,
    Other = 3,
    Pager = 4,
    BusinessFax = 5,
    HomeFax = 6,
    Company = 7,
    Assistant = 8,
    Radio = 9
  );
  PContactPhoneKind = ^ContactPhoneKind;

  // Windows.ApplicationModel.Contacts.ContactAddressKind
  ContactAddressKind = (
    Home = 0,
    Work = 1,
    Other = 2
  );
  PContactAddressKind = ^ContactAddressKind;

  // Windows.ApplicationModel.Contacts.ContactDateKind
  ContactDateKind = (
    Birthday = 0,
    Anniversary = 1,
    Other = 2
  );
  PContactDateKind = ^ContactDateKind;

  // Windows.ApplicationModel.Contacts.ContactRelationship
  ContactRelationship = (
    Other = 0,
    Spouse = 1,
    Partner = 2,
    Sibling = 3,
    Parent = 4,
    Child = 5
  );
  PContactRelationship = ^ContactRelationship;

  // Windows.ApplicationModel.Contacts.ContactFieldCategory
  ContactFieldCategory = (
    None = 0,
    Home = 1,
    Work = 2,
    Mobile = 3,
    Other = 4
  );
  PContactFieldCategory = ^ContactFieldCategory;

  // Windows.ApplicationModel.Contacts.PinnedContactSurface
  PinnedContactSurface = (
    StartMenu = 0,
    Taskbar = 1
  );
  PPinnedContactSurface = ^PinnedContactSurface;

  // Windows.ApplicationModel.Core.AppRestartFailureReason
  AppRestartFailureReason = (
    RestartPending = 0,
    NotInForeground = 1,
    InvalidUser = 2,
    Other = 3
  );
  PAppRestartFailureReason = ^AppRestartFailureReason;

  // Windows.ApplicationModel.DataTransfer.DataPackageOperation
  DataPackageOperation = (
    None = 0,
    Copy = 1,
    Move = 2,
    Link = 4
  );
  PDataPackageOperation = ^DataPackageOperation;

  // Windows.ApplicationModel.DataTransfer.DragDrop.DragDropModifiers
  DragDrop_DragDropModifiers = (
    None = 0,
    Shift = 1,
    Control = 2,
    Alt = 4,
    LeftButton = 8,
    MiddleButton = 16,
    RightButton = 32
  );
  PDragDrop_DragDropModifiers = ^DragDrop_DragDropModifiers;

  // Windows.ApplicationModel.DataTransfer.DragDrop.Core.CoreDragUIContentMode
  DragDrop_Core_CoreDragUIContentMode = (
    Auto = 0,
    Deferred = 1
  );
  PDragDrop_Core_CoreDragUIContentMode = ^DragDrop_Core_CoreDragUIContentMode;

  // Windows.ApplicationModel.DataTransfer.ShareUITheme
  ShareUITheme = (
    Default = 0,
    Light = 1,
    Dark = 2
  );
  PShareUITheme = ^ShareUITheme;

  // Windows.Data.Json.JsonValueType
  Json_JsonValueType = (
    Null = 0,
    Boolean = 1,
    Number = 2,
    &String = 3,
    &Array = 4,
    &Object = 5
  );
  PJson_JsonValueType = ^Json_JsonValueType;

  // Windows.Data.Json.JsonErrorStatus
  Json_JsonErrorStatus = (
    Unknown = 0,
    InvalidJsonString = 1,
    InvalidJsonNumber = 2,
    JsonValueNotFound = 3,
    ImplementationLimit = 4
  );
  PJson_JsonErrorStatus = ^Json_JsonErrorStatus;

  // Windows.Data.Xml.Dom.NodeType
  Xml_Dom_NodeType = (
    Invalid = 0,
    ElementNode = 1,
    AttributeNode = 2,
    TextNode = 3,
    DataSectionNode = 4,
    EntityReferenceNode = 5,
    EntityNode = 6,
    ProcessingInstructionNode = 7,
    CommentNode = 8,
    DocumentNode = 9,
    DocumentTypeNode = 10,
    DocumentFragmentNode = 11,
    NotationNode = 12
  );
  PXml_Dom_NodeType = ^Xml_Dom_NodeType;

  // Windows.Data.Pdf.PdfPageRotation
  Pdf_PdfPageRotation = (
    Normal = 0,
    Rotate90 = 1,
    Rotate180 = 2,
    Rotate270 = 3
  );
  PPdf_PdfPageRotation = ^Pdf_PdfPageRotation;

  // Windows.Data.Text.UnicodeGeneralCategory
  Text_UnicodeGeneralCategory = (
    UppercaseLetter = 0,
    LowercaseLetter = 1,
    TitlecaseLetter = 2,
    ModifierLetter = 3,
    OtherLetter = 4,
    NonspacingMark = 5,
    SpacingCombiningMark = 6,
    EnclosingMark = 7,
    DecimalDigitNumber = 8,
    LetterNumber = 9,
    OtherNumber = 10,
    SpaceSeparator = 11,
    LineSeparator = 12,
    ParagraphSeparator = 13,
    Control = 14,
    Format = 15,
    Surrogate = 16,
    PrivateUse = 17,
    ConnectorPunctuation = 18,
    DashPunctuation = 19,
    OpenPunctuation = 20,
    ClosePunctuation = 21,
    InitialQuotePunctuation = 22,
    FinalQuotePunctuation = 23,
    OtherPunctuation = 24,
    MathSymbol = 25,
    CurrencySymbol = 26,
    ModifierSymbol = 27,
    OtherSymbol = 28,
    NotAssigned = 29
  );
  PText_UnicodeGeneralCategory = ^Text_UnicodeGeneralCategory;

  // Windows.Data.Text.UnicodeNumericType
  Text_UnicodeNumericType = (
    None = 0,
    Decimal = 1,
    Digit = 2,
    Numeric = 3
  );
  PText_UnicodeNumericType = ^Text_UnicodeNumericType;

  // Windows.Data.Text.AlternateNormalizationFormat
  Text_AlternateNormalizationFormat = (
    NotNormalized = 0,
    Number = 1,
    Currency = 3,
    Date = 4,
    Time = 5
  );
  PText_AlternateNormalizationFormat = ^Text_AlternateNormalizationFormat;

  // Windows.Devices.Custom.IOControlAccessMode
  Custom_IOControlAccessMode = (
    Any = 0,
    Read = 1,
    Write = 2,
    ReadWrite = 3
  );
  PCustom_IOControlAccessMode = ^Custom_IOControlAccessMode;

  // Windows.Devices.Custom.IOControlBufferingMethod
  Custom_IOControlBufferingMethod = (
    Buffered = 0,
    DirectInput = 1,
    DirectOutput = 2,
    Neither = 3
  );
  PCustom_IOControlBufferingMethod = ^Custom_IOControlBufferingMethod;

  // Windows.Devices.Custom.DeviceAccessMode
  Custom_DeviceAccessMode = (
    Read = 0,
    Write = 1,
    ReadWrite = 2
  );
  PCustom_DeviceAccessMode = ^Custom_DeviceAccessMode;

  // Windows.Devices.Custom.DeviceSharingMode
  Custom_DeviceSharingMode = (
    Shared = 0,
    Exclusive = 1
  );
  PCustom_DeviceSharingMode = ^Custom_DeviceSharingMode;

  // Windows.Devices.Adc.Provider.ProviderAdcChannelMode
  Adc_Provider_ProviderAdcChannelMode = (
    SingleEnded = 0,
    Differential = 1
  );
  PAdc_Provider_ProviderAdcChannelMode = ^Adc_Provider_ProviderAdcChannelMode;

  // Windows.Devices.Adc.AdcChannelMode
  Adc_AdcChannelMode = (
    SingleEnded = 0,
    Differential = 1
  );
  PAdc_AdcChannelMode = ^Adc_AdcChannelMode;

  // Windows.Devices.Gpio.Provider.ProviderGpioSharingMode
  Gpio_Provider_ProviderGpioSharingMode = (
    Exclusive = 0,
    SharedReadOnly = 1
  );
  PGpio_Provider_ProviderGpioSharingMode = ^Gpio_Provider_ProviderGpioSharingMode;

  // Windows.Devices.Gpio.Provider.ProviderGpioPinDriveMode
  Gpio_Provider_ProviderGpioPinDriveMode = (
    Input = 0,
    Output = 1,
    InputPullUp = 2,
    InputPullDown = 3,
    OutputOpenDrain = 4,
    OutputOpenDrainPullUp = 5,
    OutputOpenSource = 6,
    OutputOpenSourcePullDown = 7
  );
  PGpio_Provider_ProviderGpioPinDriveMode = ^Gpio_Provider_ProviderGpioPinDriveMode;

  // Windows.Devices.Gpio.Provider.ProviderGpioPinValue
  Gpio_Provider_ProviderGpioPinValue = (
    Low = 0,
    High = 1
  );
  PGpio_Provider_ProviderGpioPinValue = ^Gpio_Provider_ProviderGpioPinValue;

  // Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
  Gpio_Provider_ProviderGpioPinEdge = (
    FallingEdge = 0,
    RisingEdge = 1
  );
  PGpio_Provider_ProviderGpioPinEdge = ^Gpio_Provider_ProviderGpioPinEdge;

  // Windows.Devices.Gpio.GpioSharingMode
  Gpio_GpioSharingMode = (
    Exclusive = 0,
    SharedReadOnly = 1
  );
  PGpio_GpioSharingMode = ^Gpio_GpioSharingMode;

  // Windows.Devices.Gpio.GpioOpenStatus
  Gpio_GpioOpenStatus = (
    PinOpened = 0,
    PinUnavailable = 1,
    SharingViolation = 2,
    MuxingConflict = 3,
    UnknownError = 4
  );
  PGpio_GpioOpenStatus = ^Gpio_GpioOpenStatus;

  // Windows.Devices.Gpio.GpioPinDriveMode
  Gpio_GpioPinDriveMode = (
    Input = 0,
    Output = 1,
    InputPullUp = 2,
    InputPullDown = 3,
    OutputOpenDrain = 4,
    OutputOpenDrainPullUp = 5,
    OutputOpenSource = 6,
    OutputOpenSourcePullDown = 7
  );
  PGpio_GpioPinDriveMode = ^Gpio_GpioPinDriveMode;

  // Windows.Devices.Gpio.GpioPinValue
  Gpio_GpioPinValue = (
    Low = 0,
    High = 1
  );
  PGpio_GpioPinValue = ^Gpio_GpioPinValue;

  // Windows.Devices.Gpio.GpioPinEdge
  Gpio_GpioPinEdge = (
    FallingEdge = 0,
    RisingEdge = 1
  );
  PGpio_GpioPinEdge = ^Gpio_GpioPinEdge;

  // Windows.Devices.Gpio.GpioChangePolarity
  Gpio_GpioChangePolarity = (
    Falling = 0,
    Rising = 1,
    Both = 2
  );
  PGpio_GpioChangePolarity = ^Gpio_GpioChangePolarity;

  // Windows.Devices.I2c.Provider.ProviderI2cBusSpeed
  I2c_Provider_ProviderI2cBusSpeed = (
    StandardMode = 0,
    FastMode = 1
  );
  PI2c_Provider_ProviderI2cBusSpeed = ^I2c_Provider_ProviderI2cBusSpeed;

  // Windows.Devices.I2c.Provider.ProviderI2cTransferStatus
  I2c_Provider_ProviderI2cTransferStatus = (
    FullTransfer = 0,
    PartialTransfer = 1,
    SlaveAddressNotAcknowledged = 2
  );
  PI2c_Provider_ProviderI2cTransferStatus = ^I2c_Provider_ProviderI2cTransferStatus;

  // Windows.Devices.I2c.Provider.ProviderI2cSharingMode
  I2c_Provider_ProviderI2cSharingMode = (
    Exclusive = 0,
    Shared = 1
  );
  PI2c_Provider_ProviderI2cSharingMode = ^I2c_Provider_ProviderI2cSharingMode;

  // Windows.Devices.I2c.I2cBusSpeed
  I2c_I2cBusSpeed = (
    StandardMode = 0,
    FastMode = 1
  );
  PI2c_I2cBusSpeed = ^I2c_I2cBusSpeed;

  // Windows.Devices.I2c.I2cTransferStatus
  I2c_I2cTransferStatus = (
    FullTransfer = 0,
    PartialTransfer = 1,
    SlaveAddressNotAcknowledged = 2,
    ClockStretchTimeout = 3,
    UnknownError = 4
  );
  PI2c_I2cTransferStatus = ^I2c_I2cTransferStatus;

  // Windows.Devices.I2c.I2cSharingMode
  I2c_I2cSharingMode = (
    Exclusive = 0,
    Shared = 1
  );
  PI2c_I2cSharingMode = ^I2c_I2cSharingMode;

  // Windows.Devices.Pwm.PwmPulsePolarity
  Pwm_PwmPulsePolarity = (
    ActiveHigh = 0,
    ActiveLow = 1
  );
  PPwm_PwmPulsePolarity = ^Pwm_PwmPulsePolarity;

  // Windows.Devices.Spi.Provider.ProviderSpiMode
  Spi_Provider_ProviderSpiMode = (
    Mode0 = 0,
    Mode1 = 1,
    Mode2 = 2,
    Mode3 = 3
  );
  PSpi_Provider_ProviderSpiMode = ^Spi_Provider_ProviderSpiMode;

  // Windows.Devices.Spi.Provider.ProviderSpiSharingMode
  Spi_Provider_ProviderSpiSharingMode = (
    Exclusive = 0,
    Shared = 1
  );
  PSpi_Provider_ProviderSpiSharingMode = ^Spi_Provider_ProviderSpiSharingMode;

  // Windows.Devices.Spi.SpiMode
  Spi_SpiMode = (
    Mode0 = 0,
    Mode1 = 1,
    Mode2 = 2,
    Mode3 = 3
  );
  PSpi_SpiMode = ^Spi_SpiMode;

  // Windows.Devices.Spi.SpiSharingMode
  Spi_SpiSharingMode = (
    Exclusive = 0,
    Shared = 1
  );
  PSpi_SpiSharingMode = ^Spi_SpiSharingMode;

  // Windows.Devices.SmartCards.SmartCardTriggerType
  SmartCards_SmartCardTriggerType = (
    EmulatorTransaction = 0,
    EmulatorNearFieldEntry = 1,
    EmulatorNearFieldExit = 2,
    EmulatorHostApplicationActivated = 3,
    EmulatorAppletIdGroupRegistrationChanged = 4,
    ReaderCardAdded = 5
  );
  PSmartCards_SmartCardTriggerType = ^SmartCards_SmartCardTriggerType;

  // Windows.Devices.SmartCards.SmartCardLaunchBehavior
  SmartCards_SmartCardLaunchBehavior = (
    Default = 0,
    AboveLock = 1
  );
  PSmartCards_SmartCardLaunchBehavior = ^SmartCards_SmartCardLaunchBehavior;

  // Windows.Devices.SmartCards.SmartCardEmulatorEnablementPolicy
  SmartCards_SmartCardEmulatorEnablementPolicy = (
    Never = 0,
    Always = 1,
    ScreenOn = 2,
    ScreenUnlocked = 3
  );
  PSmartCards_SmartCardEmulatorEnablementPolicy = ^SmartCards_SmartCardEmulatorEnablementPolicy;

  // Windows.Devices.SmartCards.SmartCardEmulationCategory
  SmartCards_SmartCardEmulationCategory = (
    Other = 0,
    Payment = 1
  );
  PSmartCards_SmartCardEmulationCategory = ^SmartCards_SmartCardEmulationCategory;

  // Windows.Devices.SmartCards.SmartCardEmulationType
  SmartCards_SmartCardEmulationType = (
    Host = 0,
    Uicc = 1,
    EmbeddedSE = 2
  );
  PSmartCards_SmartCardEmulationType = ^SmartCards_SmartCardEmulationType;

  // Windows.Devices.SmartCards.SmartCardAppletIdGroupActivationPolicy
  SmartCards_SmartCardAppletIdGroupActivationPolicy = (
    Disabled = 0,
    ForegroundOverride = 1,
    Enabled = 2
  );
  PSmartCards_SmartCardAppletIdGroupActivationPolicy = ^SmartCards_SmartCardAppletIdGroupActivationPolicy;

  // Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult
  SmartCards_SmartCardActivationPolicyChangeResult = (
    Denied = 0,
    Allowed = 1
  );
  PSmartCards_SmartCardActivationPolicyChangeResult = ^SmartCards_SmartCardActivationPolicyChangeResult;

  // Windows.Devices.SmartCards.SmartCardEmulatorConnectionDeactivatedReason
  SmartCards_SmartCardEmulatorConnectionDeactivatedReason = (
    ConnectionLost = 0,
    ConnectionRedirected = 1
  );
  PSmartCards_SmartCardEmulatorConnectionDeactivatedReason = ^SmartCards_SmartCardEmulatorConnectionDeactivatedReason;

  // Windows.Devices.SmartCards.SmartCardEmulatorConnectionSource
  SmartCards_SmartCardEmulatorConnectionSource = (
    Unknown = 0,
    NfcReader = 1
  );
  PSmartCards_SmartCardEmulatorConnectionSource = ^SmartCards_SmartCardEmulatorConnectionSource;

  // Windows.Devices.SmartCards.SmartCardAutomaticResponseStatus
  SmartCards_SmartCardAutomaticResponseStatus = (
    None = 0,
    Success = 1,
    UnknownError = 2
  );
  PSmartCards_SmartCardAutomaticResponseStatus = ^SmartCards_SmartCardAutomaticResponseStatus;

  // Windows.Devices.SmartCards.SmartCardUnlockPromptingBehavior
  SmartCards_SmartCardUnlockPromptingBehavior = (
    AllowUnlockPrompt = 0,
    RequireUnlockPrompt = 1,
    PreventUnlockPrompt = 2
  );
  PSmartCards_SmartCardUnlockPromptingBehavior = ^SmartCards_SmartCardUnlockPromptingBehavior;

  // Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyAlgorithm
  SmartCards_SmartCardCryptogramStorageKeyAlgorithm = (
    None = 0,
    Rsa2048 = 1
  );
  PSmartCards_SmartCardCryptogramStorageKeyAlgorithm = ^SmartCards_SmartCardCryptogramStorageKeyAlgorithm;

  // Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
  SmartCards_SmartCardCryptogramMaterialType = (
    None = 0,
    StaticDataAuthentication = 1,
    TripleDes112 = 2,
    Aes = 3,
    RsaPkcs1 = 4
  );
  PSmartCards_SmartCardCryptogramMaterialType = ^SmartCards_SmartCardCryptogramMaterialType;

  // Windows.Devices.SmartCards.SmartCardCryptogramMaterialProtectionMethod
  SmartCards_SmartCardCryptogramMaterialProtectionMethod = (
    None = 0,
    WhiteBoxing = 1
  );
  PSmartCards_SmartCardCryptogramMaterialProtectionMethod = ^SmartCards_SmartCardCryptogramMaterialProtectionMethod;

  // Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
  SmartCards_SmartCardCryptogramAlgorithm = (
    None = 0,
    CbcMac = 1,
    Cvc3Umd = 2,
    DecimalizedMsd = 3,
    Cvc3MD = 4,
    Sha1 = 5,
    SignedDynamicApplicationData = 6,
    RsaPkcs1 = 7,
    Sha256Hmac = 8
  );
  PSmartCards_SmartCardCryptogramAlgorithm = ^SmartCards_SmartCardCryptogramAlgorithm;

  // Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
  SmartCards_SmartCardCryptogramMaterialPackageFormat = (
    None = 0,
    JweRsaPki = 1
  );
  PSmartCards_SmartCardCryptogramMaterialPackageFormat = ^SmartCards_SmartCardCryptogramMaterialPackageFormat;

  // Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
  SmartCards_SmartCardCryptogramStorageKeyCapabilities = (
    None = 0,
    HardwareProtection = 1,
    UnlockPrompt = 2
  );
  PSmartCards_SmartCardCryptogramStorageKeyCapabilities = ^SmartCards_SmartCardCryptogramStorageKeyCapabilities;

  // Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
  SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = (
    None = 0,
    VisaHmac = 1
  );
  PSmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = ^SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;

  // Windows.Devices.SmartCards.SmartCardCryptogramPlacementOptions
  SmartCards_SmartCardCryptogramPlacementOptions = (
    None = 0,
    UnitsAreInNibbles = 1,
    ChainOutput = 2
  );
  PSmartCards_SmartCardCryptogramPlacementOptions = ^SmartCards_SmartCardCryptogramPlacementOptions;

  // Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
  SmartCards_SmartCardCryptogramGeneratorOperationStatus = (
    Success = 0,
    AuthorizationFailed = 1,
    AuthorizationCanceled = 2,
    AuthorizationRequired = 3,
    CryptogramMaterialPackageStorageKeyExists = 4,
    NoCryptogramMaterialPackageStorageKey = 5,
    NoCryptogramMaterialPackage = 6,
    UnsupportedCryptogramMaterialPackage = 7,
    UnknownCryptogramMaterialName = 8,
    InvalidCryptogramMaterialUsage = 9,
    ApduResponseNotSent = 10,
    OtherError = 11,
    ValidationFailed = 12,
    NotSupported = 13
  );
  PSmartCards_SmartCardCryptogramGeneratorOperationStatus = ^SmartCards_SmartCardCryptogramGeneratorOperationStatus;

  // Windows.Devices.SmartCards.SmartCardCryptographicKeyAttestationStatus
  SmartCards_SmartCardCryptographicKeyAttestationStatus = (
    NoAttestation = 0,
    SoftwareKeyWithoutTpm = 1,
    SoftwareKeyWithTpm = 2,
    TpmKeyUnknownAttestationStatus = 3,
    TpmKeyWithoutAttestationCapability = 4,
    TpmKeyWithTemporaryAttestationFailure = 5,
    TpmKeyWithLongTermAttestationFailure = 6,
    TpmKeyWithAttestation = 7
  );
  PSmartCards_SmartCardCryptographicKeyAttestationStatus = ^SmartCards_SmartCardCryptographicKeyAttestationStatus;

  // Windows.Devices.SmartCards.SmartCardReaderKind
  SmartCards_SmartCardReaderKind = (
    Any = 0,
    Generic = 1,
    Tpm = 2,
    Nfc = 3,
    Uicc = 4,
    EmbeddedSE = 5
  );
  PSmartCards_SmartCardReaderKind = ^SmartCards_SmartCardReaderKind;

  // Windows.Devices.SmartCards.SmartCardReaderStatus
  SmartCards_SmartCardReaderStatus = (
    Disconnected = 0,
    Ready = 1,
    Exclusive = 2
  );
  PSmartCards_SmartCardReaderStatus = ^SmartCards_SmartCardReaderStatus;

  // Windows.Devices.SmartCards.SmartCardStatus
  SmartCards_SmartCardStatus = (
    Disconnected = 0,
    Ready = 1,
    Shared = 2,
    Exclusive = 3,
    Unresponsive = 4
  );
  PSmartCards_SmartCardStatus = ^SmartCards_SmartCardStatus;

  // Windows.Devices.SmartCards.SmartCardPinCharacterPolicyOption
  SmartCards_SmartCardPinCharacterPolicyOption = (
    Allow = 0,
    RequireAtLeastOne = 1,
    Disallow = 2
  );
  PSmartCards_SmartCardPinCharacterPolicyOption = ^SmartCards_SmartCardPinCharacterPolicyOption;

  // Windows.Devices.Haptics.VibrationAccessStatus
  Haptics_VibrationAccessStatus = (
    Allowed = 0,
    DeniedByUser = 1,
    DeniedBySystem = 2,
    DeniedByEnergySaver = 3
  );
  PHaptics_VibrationAccessStatus = ^Haptics_VibrationAccessStatus;

  // Windows.Devices.HumanInterfaceDevice.HidReportType
  HumanInterfaceDevice_HidReportType = (
    Input = 0,
    Output = 1,
    Feature = 2
  );
  PHumanInterfaceDevice_HidReportType = ^HumanInterfaceDevice_HidReportType;

  // Windows.Devices.HumanInterfaceDevice.HidCollectionType
  HumanInterfaceDevice_HidCollectionType = (
    Physical = 0,
    Application = 1,
    Logical = 2,
    Report = 3,
    NamedArray = 4,
    UsageSwitch = 5,
    UsageModifier = 6,
    Other = 7
  );
  PHumanInterfaceDevice_HidCollectionType = ^HumanInterfaceDevice_HidCollectionType;

  // Windows.Devices.Input.PointerDeviceType
  Input_PointerDeviceType = (
    Touch = 0,
    Pen = 1,
    Mouse = 2
  );
  PInput_PointerDeviceType = ^Input_PointerDeviceType;

  // Windows.Devices.Perception.PerceptionFrameSourceAccessStatus
  Perception_PerceptionFrameSourceAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    DeniedByUser = 2,
    DeniedBySystem = 3
  );
  PPerception_PerceptionFrameSourceAccessStatus = ^Perception_PerceptionFrameSourceAccessStatus;

  // Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeStatus
  Perception_PerceptionFrameSourcePropertyChangeStatus = (
    Unknown = 0,
    Accepted = 1,
    LostControl = 2,
    PropertyNotSupported = 3,
    PropertyReadOnly = 4,
    ValueOutOfRange = 5
  );
  PPerception_PerceptionFrameSourcePropertyChangeStatus = ^Perception_PerceptionFrameSourcePropertyChangeStatus;

  // Windows.Devices.Printers.Extensions.Print3DWorkflowStatus
  Printers_Extensions_Print3DWorkflowStatus = (
    Abandoned = 0,
    Canceled = 1,
    Failed = 2,
    Slicing = 3,
    Submitted = 4
  );
  PPrinters_Extensions_Print3DWorkflowStatus = ^Printers_Extensions_Print3DWorkflowStatus;

  // Windows.Devices.Printers.Extensions.Print3DWorkflowDetail
  Printers_Extensions_Print3DWorkflowDetail = (
    Unknown = 0,
    ModelExceedsPrintBed = 1,
    UploadFailed = 2,
    InvalidMaterialSelection = 3,
    InvalidModel = 4,
    ModelNotManifold = 5,
    InvalidPrintTicket = 6
  );
  PPrinters_Extensions_Print3DWorkflowDetail = ^Printers_Extensions_Print3DWorkflowDetail;

  // Windows.Devices.Radios.RadioState
  Radios_RadioState = (
    Unknown = 0,
    On = 1,
    Off = 2,
    Disabled = 3
  );
  PRadios_RadioState = ^Radios_RadioState;

  // Windows.Devices.Radios.RadioKind
  Radios_RadioKind = (
    Other = 0,
    WiFi = 1,
    MobileBroadband = 2,
    Bluetooth = 3,
    FM = 4
  );
  PRadios_RadioKind = ^Radios_RadioKind;

  // Windows.Devices.Radios.RadioAccessStatus
  Radios_RadioAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    DeniedByUser = 2,
    DeniedBySystem = 3
  );
  PRadios_RadioAccessStatus = ^Radios_RadioAccessStatus;

  // Windows.Devices.SerialCommunication.SerialParity
  SerialCommunication_SerialParity = (
    None = 0,
    Odd = 1,
    Even = 2,
    Mark = 3,
    Space = 4
  );
  PSerialCommunication_SerialParity = ^SerialCommunication_SerialParity;

  // Windows.Devices.SerialCommunication.SerialHandshake
  SerialCommunication_SerialHandshake = (
    None = 0,
    RequestToSend = 1,
    XOnXOff = 2,
    RequestToSendXOnXOff = 3
  );
  PSerialCommunication_SerialHandshake = ^SerialCommunication_SerialHandshake;

  // Windows.Devices.SerialCommunication.SerialStopBitCount
  SerialCommunication_SerialStopBitCount = (
    One = 0,
    OnePointFive = 1,
    Two = 2
  );
  PSerialCommunication_SerialStopBitCount = ^SerialCommunication_SerialStopBitCount;

  // Windows.Devices.SerialCommunication.SerialError
  SerialCommunication_SerialError = (
    Frame = 0,
    BufferOverrun = 1,
    ReceiveFull = 2,
    ReceiveParity = 3,
    TransmitFull = 4
  );
  PSerialCommunication_SerialError = ^SerialCommunication_SerialError;

  // Windows.Devices.SerialCommunication.SerialPinChange
  SerialCommunication_SerialPinChange = (
    BreakSignal = 0,
    CarrierDetect = 1,
    ClearToSend = 2,
    DataSetReady = 3,
    RingIndicator = 4
  );
  PSerialCommunication_SerialPinChange = ^SerialCommunication_SerialPinChange;

  // Windows.Devices.Usb.UsbTransferDirection
  Usb_UsbTransferDirection = (
    Out = 0,
    &In = 1
  );
  PUsb_UsbTransferDirection = ^Usb_UsbTransferDirection;

  // Windows.Devices.Usb.UsbEndpointType
  Usb_UsbEndpointType = (
    Control = 0,
    Isochronous = 1,
    Bulk = 2,
    Interrupt = 3
  );
  PUsb_UsbEndpointType = ^Usb_UsbEndpointType;

  // Windows.Devices.Usb.UsbControlRecipient
  Usb_UsbControlRecipient = (
    Device = 0,
    SpecifiedInterface = 1,
    Endpoint = 2,
    Other = 3,
    DefaultInterface = 4
  );
  PUsb_UsbControlRecipient = ^Usb_UsbControlRecipient;

  // Windows.Devices.Usb.UsbControlTransferType
  Usb_UsbControlTransferType = (
    Standard = 0,
    &Class = 1,
    Vendor = 2
  );
  PUsb_UsbControlTransferType = ^Usb_UsbControlTransferType;

  // Windows.Devices.Usb.UsbReadOptions
  Usb_UsbReadOptions = (
    None = 0,
    AutoClearStall = 1,
    OverrideAutomaticBufferManagement = 2,
    IgnoreShortPacket = 4,
    AllowPartialReads = 8
  );
  PUsb_UsbReadOptions = ^Usb_UsbReadOptions;

  // Windows.Devices.Usb.UsbWriteOptions
  Usb_UsbWriteOptions = (
    None = 0,
    AutoClearStall = 1,
    ShortPacketTerminate = 2
  );
  PUsb_UsbWriteOptions = ^Usb_UsbWriteOptions;

  // Windows.Devices.WiFi.WiFiNetworkKind
  WiFi_WiFiNetworkKind = (
    Any = 0,
    Infrastructure = 1,
    Adhoc = 2
  );
  PWiFi_WiFiNetworkKind = ^WiFi_WiFiNetworkKind;

  // Windows.Devices.WiFi.WiFiPhyKind
  WiFi_WiFiPhyKind = (
    Unknown = 0,
    Fhss = 1,
    Dsss = 2,
    IRBaseband = 3,
    Ofdm = 4,
    Hrdsss = 5,
    Erp = 6,
    HT = 7,
    Vht = 8,
    Dmg = 9
  );
  PWiFi_WiFiPhyKind = ^WiFi_WiFiPhyKind;

  // Windows.Devices.WiFi.WiFiAccessStatus
  WiFi_WiFiAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    DeniedByUser = 2,
    DeniedBySystem = 3
  );
  PWiFi_WiFiAccessStatus = ^WiFi_WiFiAccessStatus;

  // Windows.Devices.WiFi.WiFiReconnectionKind
  WiFi_WiFiReconnectionKind = (
    Automatic = 0,
    Manual = 1
  );
  PWiFi_WiFiReconnectionKind = ^WiFi_WiFiReconnectionKind;

  // Windows.Devices.WiFi.WiFiConnectionStatus
  WiFi_WiFiConnectionStatus = (
    UnspecifiedFailure = 0,
    Success = 1,
    AccessRevoked = 2,
    InvalidCredential = 3,
    NetworkNotAvailable = 4,
    Timeout = 5,
    UnsupportedAuthenticationProtocol = 6
  );
  PWiFi_WiFiConnectionStatus = ^WiFi_WiFiConnectionStatus;

  // Windows.Devices.WiFi.WiFiConnectionMethod
  WiFi_WiFiConnectionMethod = (
    Default = 0,
    WpsPin = 1,
    WpsPushButton = 2
  );
  PWiFi_WiFiConnectionMethod = ^WiFi_WiFiConnectionMethod;

  // Windows.Devices.WiFi.WiFiWpsKind
  WiFi_WiFiWpsKind = (
    Unknown = 0,
    Pin = 1,
    PushButton = 2,
    Nfc = 3,
    Ethernet = 4,
    Usb = 5
  );
  PWiFi_WiFiWpsKind = ^WiFi_WiFiWpsKind;

  // Windows.Devices.WiFi.WiFiWpsConfigurationStatus
  WiFi_WiFiWpsConfigurationStatus = (
    UnspecifiedFailure = 0,
    Success = 1,
    Timeout = 2
  );
  PWiFi_WiFiWpsConfigurationStatus = ^WiFi_WiFiWpsConfigurationStatus;

  // Windows.Devices.WiFiDirect.WiFiDirectConnectionStatus
  WiFiDirect_WiFiDirectConnectionStatus = (
    Disconnected = 0,
    Connected = 1
  );
  PWiFiDirect_WiFiDirectConnectionStatus = ^WiFiDirect_WiFiDirectConnectionStatus;

  // Windows.Devices.WiFiDirect.WiFiDirectError
  WiFiDirect_WiFiDirectError = (
    Success = 0,
    RadioNotAvailable = 1,
    ResourceInUse = 2
  );
  PWiFiDirect_WiFiDirectError = ^WiFiDirect_WiFiDirectError;

  // Windows.Devices.WiFiDirect.WiFiDirectDeviceSelectorType
  WiFiDirect_WiFiDirectDeviceSelectorType = (
    DeviceInterface = 0,
    AssociationEndpoint = 1
  );
  PWiFiDirect_WiFiDirectDeviceSelectorType = ^WiFiDirect_WiFiDirectDeviceSelectorType;

  // Windows.Devices.WiFiDirect.WiFiDirectAdvertisementListenStateDiscoverability
  WiFiDirect_WiFiDirectAdvertisementListenStateDiscoverability = (
    None = 0,
    Normal = 1,
    Intensive = 2
  );
  PWiFiDirect_WiFiDirectAdvertisementListenStateDiscoverability = ^WiFiDirect_WiFiDirectAdvertisementListenStateDiscoverability;

  // Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisherStatus
  WiFiDirect_WiFiDirectAdvertisementPublisherStatus = (
    Created = 0,
    Started = 1,
    Stopped = 2,
    Aborted = 3
  );
  PWiFiDirect_WiFiDirectAdvertisementPublisherStatus = ^WiFiDirect_WiFiDirectAdvertisementPublisherStatus;

  // Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
  WiFiDirect_WiFiDirectConfigurationMethod = (
    ProvidePin = 0,
    DisplayPin = 1,
    PushButton = 2
  );
  PWiFiDirect_WiFiDirectConfigurationMethod = ^WiFiDirect_WiFiDirectConfigurationMethod;

  // Windows.Devices.WiFiDirect.WiFiDirectPairingProcedure
  WiFiDirect_WiFiDirectPairingProcedure = (
    GroupOwnerNegotiation = 0,
    Invitation = 1
  );
  PWiFiDirect_WiFiDirectPairingProcedure = ^WiFiDirect_WiFiDirectPairingProcedure;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
  WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = (
    Default = 0,
    PinDisplay = 1,
    PinEntry = 2
  );
  PWiFiDirect_Services_WiFiDirectServiceConfigurationMethod = ^WiFiDirect_Services_WiFiDirectServiceConfigurationMethod;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceStatus
  WiFiDirect_Services_WiFiDirectServiceStatus = (
    Available = 0,
    Busy = 1,
    Custom = 2
  );
  PWiFiDirect_Services_WiFiDirectServiceStatus = ^WiFiDirect_Services_WiFiDirectServiceStatus;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionStatus
  WiFiDirect_Services_WiFiDirectServiceSessionStatus = (
    Closed = 0,
    Initiated = 1,
    Requested = 2,
    Open = 3
  );
  PWiFiDirect_Services_WiFiDirectServiceSessionStatus = ^WiFiDirect_Services_WiFiDirectServiceSessionStatus;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionErrorStatus
  WiFiDirect_Services_WiFiDirectServiceSessionErrorStatus = (
    Ok = 0,
    Disassociated = 1,
    LocalClose = 2,
    RemoteClose = 3,
    SystemFailure = 4,
    NoResponseFromRemote = 5
  );
  PWiFiDirect_Services_WiFiDirectServiceSessionErrorStatus = ^WiFiDirect_Services_WiFiDirectServiceSessionErrorStatus;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAdvertisementStatus
  WiFiDirect_Services_WiFiDirectServiceAdvertisementStatus = (
    Created = 0,
    Started = 1,
    Stopped = 2,
    Aborted = 3
  );
  PWiFiDirect_Services_WiFiDirectServiceAdvertisementStatus = ^WiFiDirect_Services_WiFiDirectServiceAdvertisementStatus;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceError
  WiFiDirect_Services_WiFiDirectServiceError = (
    Success = 0,
    RadioNotAvailable = 1,
    ResourceInUse = 2,
    UnsupportedHardware = 3,
    NoHardware = 4
  );
  PWiFiDirect_Services_WiFiDirectServiceError = ^WiFiDirect_Services_WiFiDirectServiceError;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceIPProtocol
  WiFiDirect_Services_WiFiDirectServiceIPProtocol = (
    Tcp = 6,
    Udp = 17
  );
  PWiFiDirect_Services_WiFiDirectServiceIPProtocol = ^WiFiDirect_Services_WiFiDirectServiceIPProtocol;

  // Windows.Devices.Portable.ServiceDeviceType
  Portable_ServiceDeviceType = (
    CalendarService = 0,
    ContactsService = 1,
    DeviceStatusService = 2,
    NotesService = 3,
    RingtonesService = 4,
    SmsService = 5,
    TasksService = 6
  );
  PPortable_ServiceDeviceType = ^Portable_ServiceDeviceType;

  // Windows.Devices.AllJoyn.AllJoynAuthenticationMechanism
  AllJoynAuthenticationMechanism = (
    None = 0,
    SrpAnonymous = 1,
    SrpLogon = 2,
    EcdheNull = 3,
    EcdhePsk = 4,
    EcdheEcdsa = 5,
    EcdheSpeke = 6
  );
  PAllJoynAuthenticationMechanism = ^AllJoynAuthenticationMechanism;

  // Windows.Devices.AllJoyn.AllJoynBusAttachmentState
  AllJoynBusAttachmentState = (
    Disconnected = 0,
    Connecting = 1,
    Connected = 2,
    Disconnecting = 3
  );
  PAllJoynBusAttachmentState = ^AllJoynBusAttachmentState;

  // Windows.Devices.AllJoyn.AllJoynTrafficType
  AllJoynTrafficType = (
    Unknown = 0,
    Messages = 1,
    RawUnreliable = 2,
    RawReliable = 4
  );
  PAllJoynTrafficType = ^AllJoynTrafficType;

  // Windows.Devices.AllJoyn.AllJoynSessionLostReason
  AllJoynSessionLostReason = (
    None = 0,
    ProducerLeftSession = 1,
    ProducerClosedAbruptly = 2,
    RemovedByProducer = 3,
    LinkTimeout = 4,
    Other = 5
  );
  PAllJoynSessionLostReason = ^AllJoynSessionLostReason;

  // Windows.Devices.Bluetooth.Advertisement.BluetoothLEScanningMode
  BluetoothLEScanningMode = (
    Passive = 0,
    Active = 1
  );
  PBluetoothLEScanningMode = ^BluetoothLEScanningMode;

  // Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementFlags
  BluetoothLEAdvertisementFlags = (
    None = 0,
    LimitedDiscoverableMode = 1,
    GeneralDiscoverableMode = 2,
    ClassicNotSupported = 4,
    DualModeControllerCapable = 8,
    DualModeHostCapable = 16
  );
  PBluetoothLEAdvertisementFlags = ^BluetoothLEAdvertisementFlags;

  // Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementType
  BluetoothLEAdvertisementType = (
    ConnectableUndirected = 0,
    ConnectableDirected = 1,
    ScannableUndirected = 2,
    NonConnectableUndirected = 3,
    ScanResponse = 4
  );
  PBluetoothLEAdvertisementType = ^BluetoothLEAdvertisementType;

  // Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementWatcherStatus
  BluetoothLEAdvertisementWatcherStatus = (
    Created = 0,
    Started = 1,
    Stopping = 2,
    Stopped = 3,
    Aborted = 4
  );
  PBluetoothLEAdvertisementWatcherStatus = ^BluetoothLEAdvertisementWatcherStatus;

  // Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisherStatus
  BluetoothLEAdvertisementPublisherStatus = (
    Created = 0,
    Waiting = 1,
    Started = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PBluetoothLEAdvertisementPublisherStatus = ^BluetoothLEAdvertisementPublisherStatus;

  // Windows.Devices.Bluetooth.BluetoothCacheMode
  BluetoothCacheMode = (
    Cached = 0,
    Uncached = 1
  );
  PBluetoothCacheMode = ^BluetoothCacheMode;

  // Windows.Devices.Bluetooth.BluetoothMajorClass
  BluetoothMajorClass = (
    Miscellaneous = 0,
    Computer = 1,
    Phone = 2,
    NetworkAccessPoint = 3,
    AudioVideo = 4,
    Peripheral = 5,
    Imaging = 6,
    Wearable = 7,
    Toy = 8,
    Health = 9
  );
  PBluetoothMajorClass = ^BluetoothMajorClass;

  // Windows.Devices.Bluetooth.BluetoothMinorClass
  BluetoothMinorClass = (
    Uncategorized = 0,
    ComputerDesktop = 1,
    ComputerServer = 2,
    ComputerLaptop = 3,
    ComputerHandheld = 4,
    ComputerPalmSize = 5,
    ComputerWearable = 6,
    ComputerTablet = 7,
    PhoneCellular = 1,
    PhoneCordless = 2,
    PhoneSmartPhone = 3,
    PhoneWired = 4,
    PhoneIsdn = 5,
    NetworkFullyAvailable = 0,
    NetworkUsed01To17Percent = 8,
    NetworkUsed17To33Percent = 16,
    NetworkUsed33To50Percent = 24,
    NetworkUsed50To67Percent = 32,
    NetworkUsed67To83Percent = 40,
    NetworkUsed83To99Percent = 48,
    NetworkNoServiceAvailable = 56,
    AudioVideoWearableHeadset = 1,
    AudioVideoHandsFree = 2,
    AudioVideoMicrophone = 4,
    AudioVideoLoudspeaker = 5,
    AudioVideoHeadphones = 6,
    AudioVideoPortableAudio = 7,
    AudioVideoCarAudio = 8,
    AudioVideoSetTopBox = 9,
    AudioVideoHifiAudioDevice = 10,
    AudioVideoVcr = 11,
    AudioVideoVideoCamera = 12,
    AudioVideoCamcorder = 13,
    AudioVideoVideoMonitor = 14,
    AudioVideoVideoDisplayAndLoudspeaker = 15,
    AudioVideoVideoConferencing = 16,
    AudioVideoGamingOrToy = 18,
    PeripheralJoystick = 1,
    PeripheralGamepad = 2,
    PeripheralRemoteControl = 3,
    PeripheralSensing = 4,
    PeripheralDigitizerTablet = 5,
    PeripheralCardReader = 6,
    PeripheralDigitalPen = 7,
    PeripheralHandheldScanner = 8,
    PeripheralHandheldGesture = 9,
    WearableWristwatch = 1,
    WearablePager = 2,
    WearableJacket = 3,
    WearableHelmet = 4,
    WearableGlasses = 5,
    ToyRobot = 1,
    ToyVehicle = 2,
    ToyDoll = 3,
    ToyController = 4,
    ToyGame = 5,
    HealthBloodPressureMonitor = 1,
    HealthThermometer = 2,
    HealthWeighingScale = 3,
    HealthGlucoseMeter = 4,
    HealthPulseOximeter = 5,
    HealthHeartRateMonitor = 6,
    HealthHealthDataDisplay = 7,
    HealthStepCounter = 8,
    HealthBodyCompositionAnalyzer = 9,
    HealthPeakFlowMonitor = 10,
    HealthMedicationMonitor = 11,
    HealthKneeProsthesis = 12,
    HealthAnkleProsthesis = 13,
    HealthGenericHealthManager = 14,
    HealthPersonalMobilityDevice = 15
  );
  PBluetoothMinorClass = ^BluetoothMinorClass;

  // Windows.Devices.Bluetooth.BluetoothServiceCapabilities
  BluetoothServiceCapabilities = (
    None = 0,
    LimitedDiscoverableMode = 1,
    PositioningService = 8,
    NetworkingService = 16,
    RenderingService = 32,
    CapturingService = 64,
    ObjectTransferService = 128,
    AudioService = 256,
    TelephoneService = 512,
    InformationService = 1024
  );
  PBluetoothServiceCapabilities = ^BluetoothServiceCapabilities;

  // Windows.Devices.Bluetooth.BluetoothConnectionStatus
  BluetoothConnectionStatus = (
    Disconnected = 0,
    Connected = 1
  );
  PBluetoothConnectionStatus = ^BluetoothConnectionStatus;

  // Windows.Devices.Bluetooth.BluetoothError
  BluetoothError = (
    Success = 0,
    RadioNotAvailable = 1,
    ResourceInUse = 2,
    DeviceNotConnected = 3,
    OtherError = 4,
    DisabledByPolicy = 5,
    NotSupported = 6,
    DisabledByUser = 7,
    ConsentRequired = 8,
    TransportNotSupported = 9
  );
  PBluetoothError = ^BluetoothError;

  // Windows.Devices.Bluetooth.BluetoothAddressType
  BluetoothAddressType = (
    Public = 0,
    Random = 1,
    Unspecified = 2
  );
  PBluetoothAddressType = ^BluetoothAddressType;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattSessionStatus
  GenericAttributeProfile_GattSessionStatus = (
    Closed = 0,
    Active = 1
  );
  PGenericAttributeProfile_GattSessionStatus = ^GenericAttributeProfile_GattSessionStatus;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicProperties
  GenericAttributeProfile_GattCharacteristicProperties = (
    None = 0,
    Broadcast = 1,
    Read = 2,
    WriteWithoutResponse = 4,
    Write = 8,
    Notify = 16,
    Indicate = 32,
    AuthenticatedSignedWrites = 64,
    ExtendedProperties = 128,
    ReliableWrites = 256,
    WritableAuxiliaries = 512
  );
  PGenericAttributeProfile_GattCharacteristicProperties = ^GenericAttributeProfile_GattCharacteristicProperties;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattClientCharacteristicConfigurationDescriptorValue
  GenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue = (
    None = 0,
    Notify = 1,
    Indicate = 2
  );
  PGenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue = ^GenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
  GenericAttributeProfile_GattProtectionLevel = (
    Plain = 0,
    AuthenticationRequired = 1,
    EncryptionRequired = 2,
    EncryptionAndAuthenticationRequired = 3
  );
  PGenericAttributeProfile_GattProtectionLevel = ^GenericAttributeProfile_GattProtectionLevel;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteOption
  GenericAttributeProfile_GattWriteOption = (
    WriteWithResponse = 0,
    WriteWithoutResponse = 1
  );
  PGenericAttributeProfile_GattWriteOption = ^GenericAttributeProfile_GattWriteOption;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
  GenericAttributeProfile_GattCommunicationStatus = (
    Success = 0,
    Unreachable = 1,
    ProtocolError = 2,
    AccessDenied = 3
  );
  PGenericAttributeProfile_GattCommunicationStatus = ^GenericAttributeProfile_GattCommunicationStatus;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
  GenericAttributeProfile_GattSharingMode = (
    Unspecified = 0,
    Exclusive = 1,
    SharedReadOnly = 2,
    SharedReadAndWrite = 3
  );
  PGenericAttributeProfile_GattSharingMode = ^GenericAttributeProfile_GattSharingMode;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus
  GenericAttributeProfile_GattOpenStatus = (
    Unspecified = 0,
    Success = 1,
    AlreadyOpened = 2,
    NotFound = 3,
    SharingViolation = 4,
    AccessDenied = 5
  );
  PGenericAttributeProfile_GattOpenStatus = ^GenericAttributeProfile_GattOpenStatus;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattRequestState
  GenericAttributeProfile_GattRequestState = (
    Pending = 0,
    Completed = 1,
    Canceled = 2
  );
  PGenericAttributeProfile_GattRequestState = ^GenericAttributeProfile_GattRequestState;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisementStatus
  GenericAttributeProfile_GattServiceProviderAdvertisementStatus = (
    Created = 0,
    Stopped = 1,
    Started = 2,
    Aborted = 3
  );
  PGenericAttributeProfile_GattServiceProviderAdvertisementStatus = ^GenericAttributeProfile_GattServiceProviderAdvertisementStatus;

  // Windows.Devices.Bluetooth.Background.BluetoothEventTriggeringMode
  Background_BluetoothEventTriggeringMode = (
    Serial = 0,
    Batch = 1,
    KeepLatest = 2
  );
  PBackground_BluetoothEventTriggeringMode = ^Background_BluetoothEventTriggeringMode;

  // Windows.Devices.Enumeration.DevicePickerDisplayStatusOptions
  DevicePickerDisplayStatusOptions = (
    None = 0,
    ShowProgress = 1,
    ShowDisconnectButton = 2,
    ShowRetryButton = 4
  );
  PDevicePickerDisplayStatusOptions = ^DevicePickerDisplayStatusOptions;

  // Windows.Devices.Enumeration.DeviceClass
  DeviceClass = (
    All = 0,
    AudioCapture = 1,
    AudioRender = 2,
    PortableStorageDevice = 3,
    VideoCapture = 4,
    ImageScanner = 5,
    Location = 6
  );
  PDeviceClass = ^DeviceClass;

  // Windows.Devices.Enumeration.DeviceWatcherStatus
  DeviceWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PDeviceWatcherStatus = ^DeviceWatcherStatus;

  // Windows.Devices.Enumeration.Panel
  Panel = (
    Unknown = 0,
    Front = 1,
    Back = 2,
    Top = 3,
    Bottom = 4,
    Left = 5,
    Right = 6
  );
  PPanel = ^Panel;

  // Windows.Devices.Enumeration.DeviceInformationKind
  DeviceInformationKind = (
    Unknown = 0,
    DeviceInterface = 1,
    DeviceContainer = 2,
    Device = 3,
    DeviceInterfaceClass = 4,
    AssociationEndpoint = 5,
    AssociationEndpointContainer = 6,
    AssociationEndpointService = 7
  );
  PDeviceInformationKind = ^DeviceInformationKind;

  // Windows.Devices.Enumeration.DeviceWatcherEventKind
  DeviceWatcherEventKind = (
    Add = 0,
    Update = 1,
    Remove = 2
  );
  PDeviceWatcherEventKind = ^DeviceWatcherEventKind;

  // Windows.Devices.Enumeration.DevicePairingKinds
  DevicePairingKinds = (
    None = 0,
    ConfirmOnly = 1,
    DisplayPin = 2,
    ProvidePin = 4,
    ConfirmPinMatch = 8
  );
  PDevicePairingKinds = ^DevicePairingKinds;

  // Windows.Devices.Enumeration.DevicePairingResultStatus
  DevicePairingResultStatus = (
    Paired = 0,
    NotReadyToPair = 1,
    NotPaired = 2,
    AlreadyPaired = 3,
    ConnectionRejected = 4,
    TooManyConnections = 5,
    HardwareFailure = 6,
    AuthenticationTimeout = 7,
    AuthenticationNotAllowed = 8,
    AuthenticationFailure = 9,
    NoSupportedProfiles = 10,
    ProtectionLevelCouldNotBeMet = 11,
    AccessDenied = 12,
    InvalidCeremonyData = 13,
    PairingCanceled = 14,
    OperationAlreadyInProgress = 15,
    RequiredHandlerNotRegistered = 16,
    RejectedByHandler = 17,
    RemoteDeviceHasAssociation = 18,
    Failed = 19
  );
  PDevicePairingResultStatus = ^DevicePairingResultStatus;

  // Windows.Devices.Enumeration.DeviceUnpairingResultStatus
  DeviceUnpairingResultStatus = (
    Unpaired = 0,
    AlreadyUnpaired = 1,
    OperationAlreadyInProgress = 2,
    AccessDenied = 3,
    Failed = 4
  );
  PDeviceUnpairingResultStatus = ^DeviceUnpairingResultStatus;

  // Windows.Devices.Enumeration.DevicePairingProtectionLevel
  DevicePairingProtectionLevel = (
    Default = 0,
    None = 1,
    Encryption = 2,
    EncryptionAndAuthentication = 3
  );
  PDevicePairingProtectionLevel = ^DevicePairingProtectionLevel;

  // Windows.Devices.Enumeration.DeviceAccessStatus
  DeviceAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    DeniedByUser = 2,
    DeniedBySystem = 3
  );
  PDeviceAccessStatus = ^DeviceAccessStatus;

  // Windows.Devices.Enumeration.Pnp.PnpObjectType
  Pnp_PnpObjectType = (
    Unknown = 0,
    DeviceInterface = 1,
    DeviceContainer = 2,
    Device = 3,
    DeviceInterfaceClass = 4,
    AssociationEndpoint = 5,
    AssociationEndpointContainer = 6,
    AssociationEndpointService = 7
  );
  PPnp_PnpObjectType = ^Pnp_PnpObjectType;

  // Windows.Devices.Geolocation.Geofencing.MonitoredGeofenceStates
  Geofencing_MonitoredGeofenceStates = (
    None = 0,
    Entered = 1,
    Exited = 2,
    Removed = 4
  );
  PGeofencing_MonitoredGeofenceStates = ^Geofencing_MonitoredGeofenceStates;

  // Windows.Devices.Geolocation.Geofencing.GeofenceState
  Geofencing_GeofenceState = (
    None = 0,
    Entered = 1,
    Exited = 2,
    Removed = 4
  );
  PGeofencing_GeofenceState = ^Geofencing_GeofenceState;

  // Windows.Devices.Geolocation.Geofencing.GeofenceMonitorStatus
  Geofencing_GeofenceMonitorStatus = (
    Ready = 0,
    Initializing = 1,
    NoData = 2,
    Disabled = 3,
    NotInitialized = 4,
    NotAvailable = 5
  );
  PGeofencing_GeofenceMonitorStatus = ^Geofencing_GeofenceMonitorStatus;

  // Windows.Devices.Geolocation.Geofencing.GeofenceRemovalReason
  Geofencing_GeofenceRemovalReason = (
    Used = 0,
    Expired = 1
  );
  PGeofencing_GeofenceRemovalReason = ^Geofencing_GeofenceRemovalReason;

  // Windows.Devices.Geolocation.PositionAccuracy
  PositionAccuracy = (
    Default = 0,
    High = 1
  );
  PPositionAccuracy = ^PositionAccuracy;

  // Windows.Devices.Geolocation.PositionStatus
  PositionStatus = (
    Ready = 0,
    Initializing = 1,
    NoData = 2,
    Disabled = 3,
    NotInitialized = 4,
    NotAvailable = 5
  );
  PPositionStatus = ^PositionStatus;

  // Windows.Devices.Geolocation.PositionSource
  PositionSource = (
    Cellular = 0,
    Satellite = 1,
    WiFi = 2,
    IPAddress = 3,
    Unknown = 4,
    Default = 5,
    Obfuscated = 6
  );
  PPositionSource = ^PositionSource;

  // Windows.Devices.Geolocation.GeoshapeType
  GeoshapeType = (
    Geopoint = 0,
    Geocircle = 1,
    Geopath = 2,
    GeoboundingBox = 3
  );
  PGeoshapeType = ^GeoshapeType;

  // Windows.Devices.Geolocation.AltitudeReferenceSystem
  AltitudeReferenceSystem = (
    Unspecified = 0,
    Terrain = 1,
    Ellipsoid = 2,
    Geoid = 3,
    Surface = 4
  );
  PAltitudeReferenceSystem = ^AltitudeReferenceSystem;

  // Windows.Devices.Geolocation.GeolocationAccessStatus
  GeolocationAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    Denied = 2
  );
  PGeolocationAccessStatus = ^GeolocationAccessStatus;

  // Windows.Devices.Geolocation.VisitMonitoringScope
  VisitMonitoringScope = (
    Venue = 0,
    City = 1
  );
  PVisitMonitoringScope = ^VisitMonitoringScope;

  // Windows.Devices.Geolocation.VisitStateChange
  VisitStateChange = (
    TrackingLost = 0,
    Arrived = 1,
    Departed = 2,
    OtherMovement = 3
  );
  PVisitStateChange = ^VisitStateChange;

  // Windows.Devices.Midi.MidiMessageType
  MidiMessageType = (
    None = 0,
    NoteOff = 128,
    NoteOn = 144,
    PolyphonicKeyPressure = 160,
    ControlChange = 176,
    ProgramChange = 192,
    ChannelPressure = 208,
    PitchBendChange = 224,
    SystemExclusive = 240,
    MidiTimeCode = 241,
    SongPositionPointer = 242,
    SongSelect = 243,
    TuneRequest = 246,
    EndSystemExclusive = 247,
    TimingClock = 248,
    Start = 250,
    Continue = 251,
    Stop = 252,
    ActiveSensing = 254,
    SystemReset = 255
  );
  PMidiMessageType = ^MidiMessageType;

  // Windows.Devices.PointOfService.UnifiedPosErrorSeverity
  UnifiedPosErrorSeverity = (
    UnknownErrorSeverity = 0,
    Warning = 1,
    Recoverable = 2,
    Unrecoverable = 3,
    AssistanceRequired = 4,
    Fatal = 5
  );
  PUnifiedPosErrorSeverity = ^UnifiedPosErrorSeverity;

  // Windows.Devices.PointOfService.UnifiedPosPowerReportingType
  UnifiedPosPowerReportingType = (
    UnknownPowerReportingType = 0,
    Standard = 1,
    Advanced = 2
  );
  PUnifiedPosPowerReportingType = ^UnifiedPosPowerReportingType;

  // Windows.Devices.PointOfService.UnifiedPosHealthCheckLevel
  UnifiedPosHealthCheckLevel = (
    UnknownHealthCheckLevel = 0,
    POSInternal = 1,
    External = 2,
    Interactive = 3
  );
  PUnifiedPosHealthCheckLevel = ^UnifiedPosHealthCheckLevel;

  // Windows.Devices.PointOfService.UnifiedPosErrorReason
  UnifiedPosErrorReason = (
    UnknownErrorReason = 0,
    NoService = 1,
    Disabled = 2,
    Illegal = 3,
    NoHardware = 4,
    Closed = 5,
    Offline = 6,
    Failure = 7,
    Timeout = 8,
    Busy = 9,
    Extended = 10
  );
  PUnifiedPosErrorReason = ^UnifiedPosErrorReason;

  // Windows.Devices.PointOfService.MagneticStripeReaderAuthenticationLevel
  MagneticStripeReaderAuthenticationLevel = (
    NotSupported = 0,
    Optional = 1,
    Required = 2
  );
  PMagneticStripeReaderAuthenticationLevel = ^MagneticStripeReaderAuthenticationLevel;

  // Windows.Devices.PointOfService.PosPrinterMapMode
  PosPrinterMapMode = (
    Dots = 0,
    Twips = 1,
    English = 2,
    Metric = 3
  );
  PPosPrinterMapMode = ^PosPrinterMapMode;

  // Windows.Devices.PointOfService.PosPrinterCartridgeSensors
  PosPrinterCartridgeSensors = (
    None = 0,
    Removed = 1,
    Empty = 2,
    HeadCleaning = 4,
    NearEnd = 8
  );
  PPosPrinterCartridgeSensors = ^PosPrinterCartridgeSensors;

  // Windows.Devices.PointOfService.PosPrinterColorCapabilities
  PosPrinterColorCapabilities = (
    None = 0,
    Primary = 1,
    Custom1 = 2,
    Custom2 = 4,
    Custom3 = 8,
    Custom4 = 16,
    Custom5 = 32,
    Custom6 = 64,
    Cyan = 128,
    Magenta = 256,
    Yellow = 512,
    Full = 1024
  );
  PPosPrinterColorCapabilities = ^PosPrinterColorCapabilities;

  // Windows.Devices.PointOfService.PosPrinterColorCartridge
  PosPrinterColorCartridge = (
    Unknown = 0,
    Primary = 1,
    Custom1 = 2,
    Custom2 = 3,
    Custom3 = 4,
    Custom4 = 5,
    Custom5 = 6,
    Custom6 = 7,
    Cyan = 8,
    Magenta = 9,
    Yellow = 10
  );
  PPosPrinterColorCartridge = ^PosPrinterColorCartridge;

  // Windows.Devices.PointOfService.PosPrinterMarkFeedCapabilities
  PosPrinterMarkFeedCapabilities = (
    None = 0,
    ToTakeUp = 1,
    ToCutter = 2,
    ToCurrentTopOfForm = 4,
    ToNextTopOfForm = 8
  );
  PPosPrinterMarkFeedCapabilities = ^PosPrinterMarkFeedCapabilities;

  // Windows.Devices.PointOfService.PosPrinterRuledLineCapabilities
  PosPrinterRuledLineCapabilities = (
    None = 0,
    Horizontal = 1,
    Vertical = 2
  );
  PPosPrinterRuledLineCapabilities = ^PosPrinterRuledLineCapabilities;

  // Windows.Devices.PointOfService.PosPrinterPrintSide
  PosPrinterPrintSide = (
    Unknown = 0,
    Side1 = 1,
    Side2 = 2
  );
  PPosPrinterPrintSide = ^PosPrinterPrintSide;

  // Windows.Devices.PointOfService.PosPrinterLineDirection
  PosPrinterLineDirection = (
    Horizontal = 0,
    Vertical = 1
  );
  PPosPrinterLineDirection = ^PosPrinterLineDirection;

  // Windows.Devices.PointOfService.PosPrinterLineStyle
  PosPrinterLineStyle = (
    SingleSolid = 0,
    DoubleSolid = 1,
    Broken = 2,
    Chain = 3
  );
  PPosPrinterLineStyle = ^PosPrinterLineStyle;

  // Windows.Devices.PointOfService.PosPrinterMarkFeedKind
  PosPrinterMarkFeedKind = (
    ToTakeUp = 0,
    ToCutter = 1,
    ToCurrentTopOfForm = 2,
    ToNextTopOfForm = 3
  );
  PPosPrinterMarkFeedKind = ^PosPrinterMarkFeedKind;

  // Windows.Devices.PointOfService.PosPrinterAlignment
  PosPrinterAlignment = (
    Left = 0,
    Center = 1,
    Right = 2
  );
  PPosPrinterAlignment = ^PosPrinterAlignment;

  // Windows.Devices.PointOfService.PosPrinterBarcodeTextPosition
  PosPrinterBarcodeTextPosition = (
    None = 0,
    Above = 1,
    Below = 2
  );
  PPosPrinterBarcodeTextPosition = ^PosPrinterBarcodeTextPosition;

  // Windows.Devices.PointOfService.PosPrinterRotation
  PosPrinterRotation = (
    Normal = 0,
    Right90 = 1,
    Left90 = 2,
    Rotate180 = 3
  );
  PPosPrinterRotation = ^PosPrinterRotation;

  // Windows.Devices.PointOfService.PosPrinterStatusKind
  PosPrinterStatusKind = (
    Online = 0,
    Off = 1,
    Offline = 2,
    OffOrOffline = 3,
    Extended = 4
  );
  PPosPrinterStatusKind = ^PosPrinterStatusKind;

  // Windows.Devices.PointOfService.CashDrawerStatusKind
  CashDrawerStatusKind = (
    Online = 0,
    Off = 1,
    Offline = 2,
    OffOrOffline = 3,
    Extended = 4
  );
  PCashDrawerStatusKind = ^CashDrawerStatusKind;

  // Windows.Devices.PointOfService.BarcodeScannerStatus
  BarcodeScannerStatus = (
    Online = 0,
    Off = 1,
    Offline = 2,
    OffOrOffline = 3,
    Extended = 4
  );
  PBarcodeScannerStatus = ^BarcodeScannerStatus;

  // Windows.Devices.PointOfService.LineDisplayPowerStatus
  LineDisplayPowerStatus = (
    Unknown = 0,
    Online = 1,
    Off = 2,
    Offline = 3,
    OffOrOffline = 4
  );
  PLineDisplayPowerStatus = ^LineDisplayPowerStatus;

  // Windows.Devices.PointOfService.LineDisplayHorizontalAlignment
  LineDisplayHorizontalAlignment = (
    Left = 0,
    Center = 1,
    Right = 2
  );
  PLineDisplayHorizontalAlignment = ^LineDisplayHorizontalAlignment;

  // Windows.Devices.PointOfService.LineDisplayVerticalAlignment
  LineDisplayVerticalAlignment = (
    Top = 0,
    Center = 1,
    Bottom = 2
  );
  PLineDisplayVerticalAlignment = ^LineDisplayVerticalAlignment;

  // Windows.Devices.PointOfService.LineDisplayScrollDirection
  LineDisplayScrollDirection = (
    Up = 0,
    Down = 1,
    Left = 2,
    Right = 3
  );
  PLineDisplayScrollDirection = ^LineDisplayScrollDirection;

  // Windows.Devices.PointOfService.LineDisplayTextAttribute
  LineDisplayTextAttribute = (
    Normal = 0,
    Blink = 1,
    Reverse = 2,
    ReverseBlink = 3
  );
  PLineDisplayTextAttribute = ^LineDisplayTextAttribute;

  // Windows.Devices.PointOfService.LineDisplayCursorType
  LineDisplayCursorType = (
    None = 0,
    Block = 1,
    HalfBlock = 2,
    Underline = 3,
    Reverse = 4,
    Other = 5
  );
  PLineDisplayCursorType = ^LineDisplayCursorType;

  // Windows.Devices.PointOfService.LineDisplayMarqueeFormat
  LineDisplayMarqueeFormat = (
    None = 0,
    Walk = 1,
    Place = 2
  );
  PLineDisplayMarqueeFormat = ^LineDisplayMarqueeFormat;

  // Windows.Devices.PointOfService.LineDisplayDescriptorState
  LineDisplayDescriptorState = (
    Off = 0,
    On = 1,
    Blink = 2
  );
  PLineDisplayDescriptorState = ^LineDisplayDescriptorState;

  // Windows.Devices.PointOfService.LineDisplayTextAttributeGranularity
  LineDisplayTextAttributeGranularity = (
    NotSupported = 0,
    EntireDisplay = 1,
    PerCharacter = 2
  );
  PLineDisplayTextAttributeGranularity = ^LineDisplayTextAttributeGranularity;

  // Windows.Devices.PointOfService.PosConnectionTypes
  PosConnectionTypes = (
    Local = 1,
    IP = 2,
    Bluetooth = 4,
    All = -1
  );
  PPosConnectionTypes = ^PosConnectionTypes;

  // Windows.Devices.PointOfService.BarcodeSymbologyDecodeLengthKind
  BarcodeSymbologyDecodeLengthKind = (
    AnyLength = 0,
    Discrete = 1,
    Range = 2
  );
  PBarcodeSymbologyDecodeLengthKind = ^BarcodeSymbologyDecodeLengthKind;

  // Windows.Devices.PointOfService.MagneticStripeReaderStatus
  MagneticStripeReaderStatus = (
    Unauthenticated = 0,
    Authenticated = 1,
    Extended = 2
  );
  PMagneticStripeReaderStatus = ^MagneticStripeReaderStatus;

  // Windows.Devices.PointOfService.MagneticStripeReaderAuthenticationProtocol
  MagneticStripeReaderAuthenticationProtocol = (
    None = 0,
    ChallengeResponse = 1
  );
  PMagneticStripeReaderAuthenticationProtocol = ^MagneticStripeReaderAuthenticationProtocol;

  // Windows.Devices.PointOfService.MagneticStripeReaderTrackIds
  MagneticStripeReaderTrackIds = (
    None = 0,
    Track1 = 1,
    Track2 = 2,
    Track3 = 4,
    Track4 = 8
  );
  PMagneticStripeReaderTrackIds = ^MagneticStripeReaderTrackIds;

  // Windows.Devices.PointOfService.MagneticStripeReaderErrorReportingType
  MagneticStripeReaderErrorReportingType = (
    CardLevel = 0,
    TrackLevel = 1
  );
  PMagneticStripeReaderErrorReportingType = ^MagneticStripeReaderErrorReportingType;

  // Windows.Devices.PointOfService.MagneticStripeReaderTrackErrorType
  MagneticStripeReaderTrackErrorType = (
    None = 0,
    StartSentinelError = 1,
    EndSentinelError = 2,
    ParityError = 3,
    LrcError = 4,
    Unknown = -1
  );
  PMagneticStripeReaderTrackErrorType = ^MagneticStripeReaderTrackErrorType;

  // Windows.Devices.Scanners.ImageScannerFormat
  ImageScannerFormat = (
    Jpeg = 0,
    Png = 1,
    DeviceIndependentBitmap = 2,
    Tiff = 3,
    Xps = 4,
    OpenXps = 5,
    Pdf = 6
  );
  PImageScannerFormat = ^ImageScannerFormat;

  // Windows.Devices.Scanners.ImageScannerAutoCroppingMode
  ImageScannerAutoCroppingMode = (
    Disabled = 0,
    SingleRegion = 1,
    MultipleRegion = 2
  );
  PImageScannerAutoCroppingMode = ^ImageScannerAutoCroppingMode;

  // Windows.Devices.Scanners.ImageScannerColorMode
  ImageScannerColorMode = (
    Color = 0,
    Grayscale = 1,
    Monochrome = 2,
    AutoColor = 3
  );
  PImageScannerColorMode = ^ImageScannerColorMode;

  // Windows.Devices.Scanners.ImageScannerScanSource
  ImageScannerScanSource = (
    Default = 0,
    Flatbed = 1,
    Feeder = 2,
    AutoConfigured = 3
  );
  PImageScannerScanSource = ^ImageScannerScanSource;

  // Windows.Devices.Sensors.MagnetometerAccuracy
  MagnetometerAccuracy = (
    Unknown = 0,
    Unreliable = 1,
    Approximate = 2,
    High = 3
  );
  PMagnetometerAccuracy = ^MagnetometerAccuracy;

  // Windows.Devices.Sensors.ActivityType
  ActivityType = (
    Unknown = 0,
    Idle = 1,
    Stationary = 2,
    Fidgeting = 3,
    Walking = 4,
    Running = 5,
    InVehicle = 6,
    Biking = 7
  );
  PActivityType = ^ActivityType;

  // Windows.Devices.Sensors.ActivitySensorReadingConfidence
  ActivitySensorReadingConfidence = (
    High = 0,
    Low = 1
  );
  PActivitySensorReadingConfidence = ^ActivitySensorReadingConfidence;

  // Windows.Devices.Sensors.SensorReadingType
  SensorReadingType = (
    Absolute = 0,
    Relative = 1
  );
  PSensorReadingType = ^SensorReadingType;

  // Windows.Devices.Sensors.AccelerometerReadingType
  AccelerometerReadingType = (
    Standard = 0,
    Linear = 1,
    Gravity = 2
  );
  PAccelerometerReadingType = ^AccelerometerReadingType;

  // Windows.Devices.Sensors.SensorOptimizationGoal
  SensorOptimizationGoal = (
    Precision = 0,
    PowerEfficiency = 1
  );
  PSensorOptimizationGoal = ^SensorOptimizationGoal;

  // Windows.Devices.Sensors.SensorType
  SensorType = (
    Accelerometer = 0,
    ActivitySensor = 1,
    Barometer = 2,
    Compass = 3,
    CustomSensor = 4,
    Gyroscope = 5,
    ProximitySensor = 6,
    Inclinometer = 7,
    LightSensor = 8,
    OrientationSensor = 9,
    Pedometer = 10,
    RelativeInclinometer = 11,
    RelativeOrientationSensor = 12,
    SimpleOrientationSensor = 13
  );
  PSensorType = ^SensorType;

  // Windows.Devices.Sensors.SimpleOrientation
  SimpleOrientation = (
    NotRotated = 0,
    Rotated90DegreesCounterclockwise = 1,
    Rotated180DegreesCounterclockwise = 2,
    Rotated270DegreesCounterclockwise = 3,
    Faceup = 4,
    Facedown = 5
  );
  PSimpleOrientation = ^SimpleOrientation;

  // Windows.Devices.Sensors.PedometerStepKind
  PedometerStepKind = (
    Unknown = 0,
    Walking = 1,
    Running = 2
  );
  PPedometerStepKind = ^PedometerStepKind;

  // Windows.Devices.Sms.SmsMessageClass
  SmsMessageClass = (
    None = 0,
    Class0 = 1,
    Class1 = 2,
    Class2 = 3,
    Class3 = 4
  );
  PSmsMessageClass = ^SmsMessageClass;

  // Windows.Devices.Sms.SmsMessageType
  SmsMessageType = (
    Binary = 0,
    Text = 1,
    Wap = 2,
    App = 3,
    Broadcast = 4,
    Voicemail = 5,
    Status = 6
  );
  PSmsMessageType = ^SmsMessageType;

  // Windows.Devices.Sms.CellularClass
  CellularClass = (
    None = 0,
    Gsm = 1,
    Cdma = 2
  );
  PCellularClass = ^CellularClass;

  // Windows.Devices.Sms.SmsDataFormat
  SmsDataFormat = (
    Unknown = 0,
    CdmaSubmit = 1,
    GsmSubmit = 2,
    CdmaDeliver = 3,
    GsmDeliver = 4
  );
  PSmsDataFormat = ^SmsDataFormat;

  // Windows.Devices.Sms.SmsEncoding
  SmsEncoding = (
    Unknown = 0,
    Optimal = 1,
    SevenBitAscii = 2,
    Unicode = 3,
    GsmSevenBit = 4,
    EightBit = 5,
    Latin = 6,
    Korean = 7,
    IA5 = 8,
    ShiftJis = 9,
    LatinHebrew = 10
  );
  PSmsEncoding = ^SmsEncoding;

  // Windows.Devices.Sms.SmsGeographicalScope
  SmsGeographicalScope = (
    None = 0,
    CellWithImmediateDisplay = 1,
    LocationArea = 2,
    Plmn = 3,
    Cell = 4
  );
  PSmsGeographicalScope = ^SmsGeographicalScope;

  // Windows.Devices.Sms.SmsBroadcastType
  SmsBroadcastType = (
    Other = 0,
    CmasPresidential = 1,
    CmasExtreme = 2,
    CmasSevere = 3,
    CmasAmber = 4,
    CmasTest = 5,
    EUAlert1 = 6,
    EUAlert2 = 7,
    EUAlert3 = 8,
    EUAlertAmber = 9,
    EUAlertInfo = 10,
    EtwsEarthquake = 11,
    EtwsTsunami = 12,
    EtwsTsunamiAndEarthquake = 13,
    LatAlertLocal = 14
  );
  PSmsBroadcastType = ^SmsBroadcastType;

  // Windows.Devices.Sms.SmsDeviceStatus
  SmsDeviceStatus = (
    Off = 0,
    Ready = 1,
    SimNotInserted = 2,
    BadSim = 3,
    DeviceFailure = 4,
    SubscriptionNotActivated = 5,
    DeviceLocked = 6,
    DeviceBlocked = 7
  );
  PSmsDeviceStatus = ^SmsDeviceStatus;

  // Windows.Devices.Sms.SmsModemErrorCode
  SmsModemErrorCode = (
    Other = 0,
    MessagingNetworkError = 1,
    SmsOperationNotSupportedByDevice = 2,
    SmsServiceNotSupportedByNetwork = 3,
    DeviceFailure = 4,
    MessageNotEncodedProperly = 5,
    MessageTooLarge = 6,
    DeviceNotReady = 7,
    NetworkNotReady = 8,
    InvalidSmscAddress = 9,
    NetworkFailure = 10,
    FixedDialingNumberRestricted = 11
  );
  PSmsModemErrorCode = ^SmsModemErrorCode;

  // Windows.Devices.Sms.SmsFilterActionType
  SmsFilterActionType = (
    AcceptImmediately = 0,
    Drop = 1,
    Peek = 2,
    Accept = 3
  );
  PSmsFilterActionType = ^SmsFilterActionType;

  // Windows.Devices.Sms.SmsMessageFilter
  SmsMessageFilter = (
    All = 0,
    Unread = 1,
    Read = 2,
    Sent = 3,
    Draft = 4
  );
  PSmsMessageFilter = ^SmsMessageFilter;

  // Windows.Gaming.Input.Custom.GipFirmwareUpdateStatus
  Input_Custom_GipFirmwareUpdateStatus = (
    Completed = 0,
    UpToDate = 1,
    Failed = 2
  );
  PInput_Custom_GipFirmwareUpdateStatus = ^Input_Custom_GipFirmwareUpdateStatus;

  // Windows.Gaming.Input.Custom.GipMessageClass
  Input_Custom_GipMessageClass = (
    Command = 0,
    LowLatency = 1,
    StandardLatency = 2
  );
  PInput_Custom_GipMessageClass = ^Input_Custom_GipMessageClass;

  // Windows.Gaming.Input.Custom.XusbDeviceType
  Input_Custom_XusbDeviceType = (
    Unknown = 0,
    Gamepad = 1
  );
  PInput_Custom_XusbDeviceType = ^Input_Custom_XusbDeviceType;

  // Windows.Gaming.Input.Custom.XusbDeviceSubtype
  Input_Custom_XusbDeviceSubtype = (
    Unknown = 0,
    Gamepad = 1,
    ArcadePad = 2,
    ArcadeStick = 3,
    FlightStick = 4,
    Wheel = 5,
    Guitar = 6,
    GuitarAlternate = 7,
    GuitarBass = 8,
    DrumKit = 9,
    DancePad = 10
  );
  PInput_Custom_XusbDeviceSubtype = ^Input_Custom_XusbDeviceSubtype;

  // Windows.Gaming.Input.ForceFeedback.ConditionForceEffectKind
  Input_ForceFeedback_ConditionForceEffectKind = (
    Spring = 0,
    Damper = 1,
    Inertia = 2,
    Friction = 3
  );
  PInput_ForceFeedback_ConditionForceEffectKind = ^Input_ForceFeedback_ConditionForceEffectKind;

  // Windows.Gaming.Input.ForceFeedback.ForceFeedbackEffectAxes
  Input_ForceFeedback_ForceFeedbackEffectAxes = (
    None = 0,
    X = 1,
    Y = 2,
    Z = 4
  );
  PInput_ForceFeedback_ForceFeedbackEffectAxes = ^Input_ForceFeedback_ForceFeedbackEffectAxes;

  // Windows.Gaming.Input.ForceFeedback.ForceFeedbackEffectState
  Input_ForceFeedback_ForceFeedbackEffectState = (
    Stopped = 0,
    Running = 1,
    Paused = 2,
    Faulted = 3
  );
  PInput_ForceFeedback_ForceFeedbackEffectState = ^Input_ForceFeedback_ForceFeedbackEffectState;

  // Windows.Gaming.Input.ForceFeedback.ForceFeedbackLoadEffectResult
  Input_ForceFeedback_ForceFeedbackLoadEffectResult = (
    Succeeded = 0,
    EffectStorageFull = 1,
    EffectNotSupported = 2
  );
  PInput_ForceFeedback_ForceFeedbackLoadEffectResult = ^Input_ForceFeedback_ForceFeedbackLoadEffectResult;

  // Windows.Gaming.Input.ForceFeedback.PeriodicForceEffectKind
  Input_ForceFeedback_PeriodicForceEffectKind = (
    SquareWave = 0,
    SineWave = 1,
    TriangleWave = 2,
    SawtoothWaveUp = 3,
    SawtoothWaveDown = 4
  );
  PInput_ForceFeedback_PeriodicForceEffectKind = ^Input_ForceFeedback_PeriodicForceEffectKind;

  // Windows.Gaming.Input.ArcadeStickButtons
  Input_ArcadeStickButtons = (
    None = 0,
    StickUp = 1,
    StickDown = 2,
    StickLeft = 4,
    StickRight = 8,
    Action1 = 16,
    Action2 = 32,
    Action3 = 64,
    Action4 = 128,
    Action5 = 256,
    Action6 = 512,
    Special1 = 1024,
    Special2 = 2048
  );
  PInput_ArcadeStickButtons = ^Input_ArcadeStickButtons;

  // Windows.Gaming.Input.FlightStickButtons
  Input_FlightStickButtons = (
    None = 0,
    FirePrimary = 1,
    FireSecondary = 2
  );
  PInput_FlightStickButtons = ^Input_FlightStickButtons;

  // Windows.Gaming.Input.GameControllerButtonLabel
  Input_GameControllerButtonLabel = (
    None = 0,
    XboxBack = 1,
    XboxStart = 2,
    XboxMenu = 3,
    XboxView = 4,
    XboxUp = 5,
    XboxDown = 6,
    XboxLeft = 7,
    XboxRight = 8,
    XboxA = 9,
    XboxB = 10,
    XboxX = 11,
    XboxY = 12,
    XboxLeftBumper = 13,
    XboxLeftTrigger = 14,
    XboxLeftStickButton = 15,
    XboxRightBumper = 16,
    XboxRightTrigger = 17,
    XboxRightStickButton = 18,
    XboxPaddle1 = 19,
    XboxPaddle2 = 20,
    XboxPaddle3 = 21,
    XboxPaddle4 = 22,
    Mode = 23,
    Select = 24,
    Menu = 25,
    View = 26,
    Back = 27,
    Start = 28,
    Options = 29,
    Share = 30,
    Up = 31,
    Down = 32,
    Left = 33,
    Right = 34,
    LetterA = 35,
    LetterB = 36,
    LetterC = 37,
    LetterL = 38,
    LetterR = 39,
    LetterX = 40,
    LetterY = 41,
    LetterZ = 42,
    Cross = 43,
    Circle = 44,
    Square = 45,
    Triangle = 46,
    LeftBumper = 47,
    LeftTrigger = 48,
    LeftStickButton = 49,
    Left1 = 50,
    Left2 = 51,
    Left3 = 52,
    RightBumper = 53,
    RightTrigger = 54,
    RightStickButton = 55,
    Right1 = 56,
    Right2 = 57,
    Right3 = 58,
    Paddle1 = 59,
    Paddle2 = 60,
    Paddle3 = 61,
    Paddle4 = 62,
    Plus = 63,
    Minus = 64,
    DownLeftArrow = 65,
    DialLeft = 66,
    DialRight = 67,
    Suspension = 68
  );
  PInput_GameControllerButtonLabel = ^Input_GameControllerButtonLabel;

  // Windows.Gaming.Input.GameControllerSwitchKind
  Input_GameControllerSwitchKind = (
    TwoWay = 0,
    FourWay = 1,
    EightWay = 2
  );
  PInput_GameControllerSwitchKind = ^Input_GameControllerSwitchKind;

  // Windows.Gaming.Input.GameControllerSwitchPosition
  Input_GameControllerSwitchPosition = (
    Center = 0,
    Up = 1,
    UpRight = 2,
    Right = 3,
    DownRight = 4,
    Down = 5,
    DownLeft = 6,
    Left = 7,
    UpLeft = 8
  );
  PInput_GameControllerSwitchPosition = ^Input_GameControllerSwitchPosition;

  // Windows.Gaming.Input.GamepadButtons
  Input_GamepadButtons = (
    None = 0,
    Menu = 1,
    View = 2,
    A = 4,
    B = 8,
    X = 16,
    Y = 32,
    DPadUp = 64,
    DPadDown = 128,
    DPadLeft = 256,
    DPadRight = 512,
    LeftShoulder = 1024,
    RightShoulder = 2048,
    LeftThumbstick = 4096,
    RightThumbstick = 8192,
    Paddle1 = 16384,
    Paddle2 = 32768,
    Paddle3 = 65536,
    Paddle4 = 131072
  );
  PInput_GamepadButtons = ^Input_GamepadButtons;

  // Windows.Gaming.Input.RacingWheelButtons
  Input_RacingWheelButtons = (
    None = 0,
    PreviousGear = 1,
    NextGear = 2,
    DPadUp = 4,
    DPadDown = 8,
    DPadLeft = 16,
    DPadRight = 32,
    Button1 = 64,
    Button2 = 128,
    Button3 = 256,
    Button4 = 512,
    Button5 = 1024,
    Button6 = 2048,
    Button7 = 4096,
    Button8 = 8192,
    Button9 = 16384,
    Button10 = 32768,
    Button11 = 65536,
    Button12 = 131072,
    Button13 = 262144,
    Button14 = 524288,
    Button15 = 1048576,
    Button16 = 2097152
  );
  PInput_RacingWheelButtons = ^Input_RacingWheelButtons;

  // Windows.Gaming.Input.RequiredUINavigationButtons
  Input_RequiredUINavigationButtons = (
    None = 0,
    Menu = 1,
    View = 2,
    Accept = 4,
    Cancel = 8,
    Up = 16,
    Down = 32,
    Left = 64,
    Right = 128
  );
  PInput_RequiredUINavigationButtons = ^Input_RequiredUINavigationButtons;

  // Windows.Gaming.Input.OptionalUINavigationButtons
  Input_OptionalUINavigationButtons = (
    None = 0,
    Context1 = 1,
    Context2 = 2,
    Context3 = 4,
    Context4 = 8,
    PageUp = 16,
    PageDown = 32,
    PageLeft = 64,
    PageRight = 128,
    ScrollUp = 256,
    ScrollDown = 512,
    ScrollLeft = 1024,
    ScrollRight = 2048
  );
  PInput_OptionalUINavigationButtons = ^Input_OptionalUINavigationButtons;

  // Windows.Gaming.UI.GameChatOverlayPosition
  UI_GameChatOverlayPosition = (
    BottomCenter = 0,
    BottomLeft = 1,
    BottomRight = 2,
    MiddleRight = 3,
    MiddleLeft = 4,
    TopCenter = 5,
    TopLeft = 6,
    TopRight = 7
  );
  PUI_GameChatOverlayPosition = ^UI_GameChatOverlayPosition;

  // Windows.Gaming.UI.GameChatMessageOrigin
  UI_GameChatMessageOrigin = (
    Voice = 0,
    Text = 1
  );
  PUI_GameChatMessageOrigin = ^UI_GameChatMessageOrigin;

  // Windows.Gaming.UI.GameMonitoringPermission
  UI_GameMonitoringPermission = (
    Allowed = 0,
    DeniedByUser = 1,
    DeniedBySystem = 2
  );
  PUI_GameMonitoringPermission = ^UI_GameMonitoringPermission;

  // Windows.Gaming.XboxLive.Storage.GameSaveErrorStatus
  XboxLive_Storage_GameSaveErrorStatus = (
    Ok = 0,
    Abort = -2147467260,
    InvalidContainerName = -2138898431,
    NoAccess = -2138898430,
    OutOfLocalStorage = -2138898429,
    UserCanceled = -2138898428,
    UpdateTooBig = -2138898427,
    QuotaExceeded = -2138898426,
    ProvidedBufferTooSmall = -2138898425,
    BlobNotFound = -2138898424,
    NoXboxLiveInfo = -2138898423,
    ContainerNotInSync = -2138898422,
    ContainerSyncFailed = -2138898421,
    UserHasNoXboxLiveInfo = -2138898420,
    ObjectExpired = -2138898419
  );
  PXboxLive_Storage_GameSaveErrorStatus = ^XboxLive_Storage_GameSaveErrorStatus;

  // Windows.Gaming.Preview.GamesEnumeration.GameListCategory
  Preview_GamesEnumeration_GameListCategory = (
    Candidate = 0,
    ConfirmedBySystem = 1,
    ConfirmedByUser = 2
  );
  PPreview_GamesEnumeration_GameListCategory = ^Preview_GamesEnumeration_GameListCategory;

  // Windows.Gaming.Preview.GamesEnumeration.GameListEntryLaunchableState
  Preview_GamesEnumeration_GameListEntryLaunchableState = (
    NotLaunchable = 0,
    ByLastRunningFullPath = 1,
    ByUserProvidedPath = 2,
    ByTile = 3
  );
  PPreview_GamesEnumeration_GameListEntryLaunchableState = ^Preview_GamesEnumeration_GameListEntryLaunchableState;

  // Windows.Globalization.PhoneNumberFormatting.PhoneNumberFormat
  PhoneNumberFormatting_PhoneNumberFormat = (
    E164 = 0,
    International = 1,
    National = 2,
    Rfc3966 = 3
  );
  PPhoneNumberFormatting_PhoneNumberFormat = ^PhoneNumberFormatting_PhoneNumberFormat;

  // Windows.Globalization.PhoneNumberFormatting.PredictedPhoneNumberKind
  PhoneNumberFormatting_PredictedPhoneNumberKind = (
    FixedLine = 0,
    Mobile = 1,
    FixedLineOrMobile = 2,
    TollFree = 3,
    PremiumRate = 4,
    SharedCost = 5,
    Voip = 6,
    PersonalNumber = 7,
    Pager = 8,
    UniversalAccountNumber = 9,
    Voicemail = 10,
    Unknown = 11
  );
  PPhoneNumberFormatting_PredictedPhoneNumberKind = ^PhoneNumberFormatting_PredictedPhoneNumberKind;

  // Windows.Globalization.PhoneNumberFormatting.PhoneNumberParseResult
  PhoneNumberFormatting_PhoneNumberParseResult = (
    Valid = 0,
    NotANumber = 1,
    InvalidCountryCode = 2,
    TooShort = 3,
    TooLong = 4
  );
  PPhoneNumberFormatting_PhoneNumberParseResult = ^PhoneNumberFormatting_PhoneNumberParseResult;

  // Windows.Globalization.PhoneNumberFormatting.PhoneNumberMatchResult
  PhoneNumberFormatting_PhoneNumberMatchResult = (
    NoMatch = 0,
    ShortNationalSignificantNumberMatch = 1,
    NationalSignificantNumberMatch = 2,
    ExactMatch = 3
  );
  PPhoneNumberFormatting_PhoneNumberMatchResult = ^PhoneNumberFormatting_PhoneNumberMatchResult;

  // Windows.Globalization.DayOfWeek
  DayOfWeek = (
    Sunday = 0,
    Monday = 1,
    Tuesday = 2,
    Wednesday = 3,
    Thursday = 4,
    Friday = 5,
    Saturday = 6
  );
  PDayOfWeek = ^DayOfWeek;

  // Windows.Globalization.DateTimeFormatting.YearFormat
  DateTimeFormatting_YearFormat = (
    None = 0,
    Default = 1,
    Abbreviated = 2,
    Full = 3
  );
  PDateTimeFormatting_YearFormat = ^DateTimeFormatting_YearFormat;

  // Windows.Globalization.DateTimeFormatting.MonthFormat
  DateTimeFormatting_MonthFormat = (
    None = 0,
    Default = 1,
    Abbreviated = 2,
    Full = 3,
    Numeric = 4
  );
  PDateTimeFormatting_MonthFormat = ^DateTimeFormatting_MonthFormat;

  // Windows.Globalization.DateTimeFormatting.DayOfWeekFormat
  DateTimeFormatting_DayOfWeekFormat = (
    None = 0,
    Default = 1,
    Abbreviated = 2,
    Full = 3
  );
  PDateTimeFormatting_DayOfWeekFormat = ^DateTimeFormatting_DayOfWeekFormat;

  // Windows.Globalization.DateTimeFormatting.DayFormat
  DateTimeFormatting_DayFormat = (
    None = 0,
    Default = 1
  );
  PDateTimeFormatting_DayFormat = ^DateTimeFormatting_DayFormat;

  // Windows.Globalization.DateTimeFormatting.HourFormat
  DateTimeFormatting_HourFormat = (
    None = 0,
    Default = 1
  );
  PDateTimeFormatting_HourFormat = ^DateTimeFormatting_HourFormat;

  // Windows.Globalization.DateTimeFormatting.MinuteFormat
  DateTimeFormatting_MinuteFormat = (
    None = 0,
    Default = 1
  );
  PDateTimeFormatting_MinuteFormat = ^DateTimeFormatting_MinuteFormat;

  // Windows.Globalization.DateTimeFormatting.SecondFormat
  DateTimeFormatting_SecondFormat = (
    None = 0,
    Default = 1
  );
  PDateTimeFormatting_SecondFormat = ^DateTimeFormatting_SecondFormat;

  // Windows.Globalization.NumberFormatting.RoundingAlgorithm
  NumberFormatting_RoundingAlgorithm = (
    None = 0,
    RoundDown = 1,
    RoundUp = 2,
    RoundTowardsZero = 3,
    RoundAwayFromZero = 4,
    RoundHalfDown = 5,
    RoundHalfUp = 6,
    RoundHalfTowardsZero = 7,
    RoundHalfAwayFromZero = 8,
    RoundHalfToEven = 9,
    RoundHalfToOdd = 10
  );
  PNumberFormatting_RoundingAlgorithm = ^NumberFormatting_RoundingAlgorithm;

  // Windows.Globalization.NumberFormatting.CurrencyFormatterMode
  NumberFormatting_CurrencyFormatterMode = (
    UseSymbol = 0,
    UseCurrencyCode = 1
  );
  PNumberFormatting_CurrencyFormatterMode = ^NumberFormatting_CurrencyFormatterMode;

  // Windows.Graphics.Printing3D.Print3DTaskDetail
  Printing3D_Print3DTaskDetail = (
    Unknown = 0,
    ModelExceedsPrintBed = 1,
    UploadFailed = 2,
    InvalidMaterialSelection = 3,
    InvalidModel = 4,
    ModelNotManifold = 5,
    InvalidPrintTicket = 6
  );
  PPrinting3D_Print3DTaskDetail = ^Printing3D_Print3DTaskDetail;

  // Windows.Graphics.Printing3D.Print3DTaskCompletion
  Printing3D_Print3DTaskCompletion = (
    Abandoned = 0,
    Canceled = 1,
    Failed = 2,
    Slicing = 3,
    Submitted = 4
  );
  PPrinting3D_Print3DTaskCompletion = ^Printing3D_Print3DTaskCompletion;

  // Windows.Graphics.Printing3D.Printing3DBufferFormat
  Printing3D_Printing3DBufferFormat = (
    Unknown = 0,
    R32G32B32A32Float = 2,
    R32G32B32A32UInt = 3,
    R32G32B32Float = 6,
    R32G32B32UInt = 7,
    Printing3DDouble = 500,
    Printing3DUInt = 501
  );
  PPrinting3D_Printing3DBufferFormat = ^Printing3D_Printing3DBufferFormat;

  // Windows.Graphics.Printing3D.Printing3DMeshVerificationMode
  Printing3D_Printing3DMeshVerificationMode = (
    FindFirstError = 0,
    FindAllErrors = 1
  );
  PPrinting3D_Printing3DMeshVerificationMode = ^Printing3D_Printing3DMeshVerificationMode;

  // Windows.Graphics.Printing3D.Printing3DModelUnit
  Printing3D_Printing3DModelUnit = (
    Meter = 0,
    Micron = 1,
    Millimeter = 2,
    Centimeter = 3,
    Inch = 4,
    Foot = 5
  );
  PPrinting3D_Printing3DModelUnit = ^Printing3D_Printing3DModelUnit;

  // Windows.Graphics.Printing3D.Printing3DTextureEdgeBehavior
  Printing3D_Printing3DTextureEdgeBehavior = (
    None = 0,
    Wrap = 1,
    Mirror = 2,
    Clamp = 3
  );
  PPrinting3D_Printing3DTextureEdgeBehavior = ^Printing3D_Printing3DTextureEdgeBehavior;

  // Windows.Graphics.Printing3D.Printing3DObjectType
  Printing3D_Printing3DObjectType = (
    Model = 0,
    Support = 1,
    Others = 2
  );
  PPrinting3D_Printing3DObjectType = ^Printing3D_Printing3DObjectType;

  // Windows.Graphics.Printing3D.Printing3DPackageCompression
  Printing3D_Printing3DPackageCompression = (
    Low = 0,
    Medium = 1,
    High = 2
  );
  PPrinting3D_Printing3DPackageCompression = ^Printing3D_Printing3DPackageCompression;

  // Windows.Graphics.Display.DisplayOrientations
  Display_DisplayOrientations = (
    None = 0,
    Landscape = 1,
    Portrait = 2,
    LandscapeFlipped = 4,
    PortraitFlipped = 8
  );
  PDisplay_DisplayOrientations = ^Display_DisplayOrientations;

  // Windows.Graphics.Display.ResolutionScale
  Display_ResolutionScale = (
    Invalid = 0,
    Scale100Percent = 100,
    Scale120Percent = 120,
    Scale125Percent = 125,
    Scale140Percent = 140,
    Scale150Percent = 150,
    Scale160Percent = 160,
    Scale175Percent = 175,
    Scale180Percent = 180,
    Scale200Percent = 200,
    Scale225Percent = 225,
    Scale250Percent = 250,
    Scale300Percent = 300,
    Scale350Percent = 350,
    Scale400Percent = 400,
    Scale450Percent = 450,
    Scale500Percent = 500
  );
  PDisplay_ResolutionScale = ^Display_ResolutionScale;

  // Windows.Graphics.Imaging.BitmapInterpolationMode
  Imaging_BitmapInterpolationMode = (
    NearestNeighbor = 0,
    Linear = 1,
    Cubic = 2,
    Fant = 3
  );
  PImaging_BitmapInterpolationMode = ^Imaging_BitmapInterpolationMode;

  // Windows.Graphics.Imaging.BitmapFlip
  Imaging_BitmapFlip = (
    None = 0,
    Horizontal = 1,
    Vertical = 2
  );
  PImaging_BitmapFlip = ^Imaging_BitmapFlip;

  // Windows.Graphics.Imaging.BitmapRotation
  Imaging_BitmapRotation = (
    None = 0,
    Clockwise90Degrees = 1,
    Clockwise180Degrees = 2,
    Clockwise270Degrees = 3
  );
  PImaging_BitmapRotation = ^Imaging_BitmapRotation;

  // Windows.Graphics.Imaging.ColorManagementMode
  Imaging_ColorManagementMode = (
    DoNotColorManage = 0,
    ColorManageToSRgb = 1
  );
  PImaging_ColorManagementMode = ^Imaging_ColorManagementMode;

  // Windows.Graphics.Imaging.ExifOrientationMode
  Imaging_ExifOrientationMode = (
    IgnoreExifOrientation = 0,
    RespectExifOrientation = 1
  );
  PImaging_ExifOrientationMode = ^Imaging_ExifOrientationMode;

  // Windows.Graphics.Imaging.PngFilterMode
  Imaging_PngFilterMode = (
    Automatic = 0,
    None = 1,
    Sub = 2,
    Up = 3,
    Average = 4,
    Paeth = 5,
    Adaptive = 6
  );
  PImaging_PngFilterMode = ^Imaging_PngFilterMode;

  // Windows.Graphics.Imaging.TiffCompressionMode
  Imaging_TiffCompressionMode = (
    Automatic = 0,
    None = 1,
    Ccitt3 = 2,
    Ccitt4 = 3,
    Lzw = 4,
    Rle = 5,
    Zip = 6,
    LzwhDifferencing = 7
  );
  PImaging_TiffCompressionMode = ^Imaging_TiffCompressionMode;

  // Windows.Graphics.Imaging.JpegSubsamplingMode
  Imaging_JpegSubsamplingMode = (
    Default = 0,
    Y4Cb2Cr0 = 1,
    Y4Cb2Cr2 = 2,
    Y4Cb4Cr4 = 3
  );
  PImaging_JpegSubsamplingMode = ^Imaging_JpegSubsamplingMode;

  // Windows.Graphics.Imaging.BitmapPixelFormat
  Imaging_BitmapPixelFormat = (
    Unknown = 0,
    Rgba16 = 12,
    Rgba8 = 30,
    Gray16 = 57,
    Gray8 = 62,
    Bgra8 = 87,
    Nv12 = 103,
    Yuy2 = 107
  );
  PImaging_BitmapPixelFormat = ^Imaging_BitmapPixelFormat;

  // Windows.Graphics.Imaging.BitmapAlphaMode
  Imaging_BitmapAlphaMode = (
    Premultiplied = 0,
    Straight = 1,
    Ignore = 2
  );
  PImaging_BitmapAlphaMode = ^Imaging_BitmapAlphaMode;

  // Windows.Graphics.Imaging.BitmapBufferAccessMode
  Imaging_BitmapBufferAccessMode = (
    Read = 0,
    ReadWrite = 1,
    Write = 2
  );
  PImaging_BitmapBufferAccessMode = ^Imaging_BitmapBufferAccessMode;

  // Windows.Graphics.Display.DisplayBrightnessScenario
  Display_DisplayBrightnessScenario = (
    DefaultBrightness = 0,
    IdleBrightness = 1,
    BarcodeReadingBrightness = 2,
    FullBrightness = 3
  );
  PDisplay_DisplayBrightnessScenario = ^Display_DisplayBrightnessScenario;

  // Windows.Graphics.Display.DisplayBrightnessOverrideOptions
  Display_DisplayBrightnessOverrideOptions = (
    None = 0,
    UseDimmedPolicyWhenBatteryIsLow = 1
  );
  PDisplay_DisplayBrightnessOverrideOptions = ^Display_DisplayBrightnessOverrideOptions;

  // Windows.Graphics.Display.Core.HdmiDisplayColorSpace
  Display_Core_HdmiDisplayColorSpace = (
    RgbLimited = 0,
    RgbFull = 1,
    BT2020 = 2,
    BT709 = 3
  );
  PDisplay_Core_HdmiDisplayColorSpace = ^Display_Core_HdmiDisplayColorSpace;

  // Windows.Graphics.Display.Core.HdmiDisplayPixelEncoding
  Display_Core_HdmiDisplayPixelEncoding = (
    Rgb444 = 0,
    Ycc444 = 1,
    Ycc422 = 2,
    Ycc420 = 3
  );
  PDisplay_Core_HdmiDisplayPixelEncoding = ^Display_Core_HdmiDisplayPixelEncoding;

  // Windows.Graphics.Display.Core.HdmiDisplayHdrOption
  Display_Core_HdmiDisplayHdrOption = (
    None = 0,
    EotfSdr = 1,
    Eotf2084 = 2
  );
  PDisplay_Core_HdmiDisplayHdrOption = ^Display_Core_HdmiDisplayHdrOption;

  // Windows.Graphics.Printing.OptionDetails.PrintOptionStates
  Printing_OptionDetails_PrintOptionStates = (
    None = 0,
    Enabled = 1,
    Constrained = 2
  );
  PPrinting_OptionDetails_PrintOptionStates = ^Printing_OptionDetails_PrintOptionStates;

  // Windows.Graphics.Printing.OptionDetails.PrintOptionType
  Printing_OptionDetails_PrintOptionType = (
    Unknown = 0,
    Number = 1,
    Text = 2,
    ItemList = 3
  );
  PPrinting_OptionDetails_PrintOptionType = ^Printing_OptionDetails_PrintOptionType;

  // Windows.Graphics.Printing.PrintMediaSize
  Printing_PrintMediaSize = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    BusinessCard = 3,
    CreditCard = 4,
    IsoA0 = 5,
    IsoA1 = 6,
    IsoA10 = 7,
    IsoA2 = 8,
    IsoA3 = 9,
    IsoA3Extra = 10,
    IsoA3Rotated = 11,
    IsoA4 = 12,
    IsoA4Extra = 13,
    IsoA4Rotated = 14,
    IsoA5 = 15,
    IsoA5Extra = 16,
    IsoA5Rotated = 17,
    IsoA6 = 18,
    IsoA6Rotated = 19,
    IsoA7 = 20,
    IsoA8 = 21,
    IsoA9 = 22,
    IsoB0 = 23,
    IsoB1 = 24,
    IsoB10 = 25,
    IsoB2 = 26,
    IsoB3 = 27,
    IsoB4 = 28,
    IsoB4Envelope = 29,
    IsoB5Envelope = 30,
    IsoB5Extra = 31,
    IsoB7 = 32,
    IsoB8 = 33,
    IsoB9 = 34,
    IsoC0 = 35,
    IsoC1 = 36,
    IsoC10 = 37,
    IsoC2 = 38,
    IsoC3 = 39,
    IsoC3Envelope = 40,
    IsoC4 = 41,
    IsoC4Envelope = 42,
    IsoC5 = 43,
    IsoC5Envelope = 44,
    IsoC6 = 45,
    IsoC6C5Envelope = 46,
    IsoC6Envelope = 47,
    IsoC7 = 48,
    IsoC8 = 49,
    IsoC9 = 50,
    IsoDLEnvelope = 51,
    IsoDLEnvelopeRotated = 52,
    IsoSRA3 = 53,
    Japan2LPhoto = 54,
    JapanChou3Envelope = 55,
    JapanChou3EnvelopeRotated = 56,
    JapanChou4Envelope = 57,
    JapanChou4EnvelopeRotated = 58,
    JapanDoubleHagakiPostcard = 59,
    JapanDoubleHagakiPostcardRotated = 60,
    JapanHagakiPostcard = 61,
    JapanHagakiPostcardRotated = 62,
    JapanKaku2Envelope = 63,
    JapanKaku2EnvelopeRotated = 64,
    JapanKaku3Envelope = 65,
    JapanKaku3EnvelopeRotated = 66,
    JapanLPhoto = 67,
    JapanQuadrupleHagakiPostcard = 68,
    JapanYou1Envelope = 69,
    JapanYou2Envelope = 70,
    JapanYou3Envelope = 71,
    JapanYou4Envelope = 72,
    JapanYou4EnvelopeRotated = 73,
    JapanYou6Envelope = 74,
    JapanYou6EnvelopeRotated = 75,
    JisB0 = 76,
    JisB1 = 77,
    JisB10 = 78,
    JisB2 = 79,
    JisB3 = 80,
    JisB4 = 81,
    JisB4Rotated = 82,
    JisB5 = 83,
    JisB5Rotated = 84,
    JisB6 = 85,
    JisB6Rotated = 86,
    JisB7 = 87,
    JisB8 = 88,
    JisB9 = 89,
    NorthAmerica10x11 = 90,
    NorthAmerica10x12 = 91,
    NorthAmerica10x14 = 92,
    NorthAmerica11x17 = 93,
    NorthAmerica14x17 = 94,
    NorthAmerica4x6 = 95,
    NorthAmerica4x8 = 96,
    NorthAmerica5x7 = 97,
    NorthAmerica8x10 = 98,
    NorthAmerica9x11 = 99,
    NorthAmericaArchitectureASheet = 100,
    NorthAmericaArchitectureBSheet = 101,
    NorthAmericaArchitectureCSheet = 102,
    NorthAmericaArchitectureDSheet = 103,
    NorthAmericaArchitectureESheet = 104,
    NorthAmericaCSheet = 105,
    NorthAmericaDSheet = 106,
    NorthAmericaESheet = 107,
    NorthAmericaExecutive = 108,
    NorthAmericaGermanLegalFanfold = 109,
    NorthAmericaGermanStandardFanfold = 110,
    NorthAmericaLegal = 111,
    NorthAmericaLegalExtra = 112,
    NorthAmericaLetter = 113,
    NorthAmericaLetterExtra = 114,
    NorthAmericaLetterPlus = 115,
    NorthAmericaLetterRotated = 116,
    NorthAmericaMonarchEnvelope = 117,
    NorthAmericaNote = 118,
    NorthAmericaNumber10Envelope = 119,
    NorthAmericaNumber10EnvelopeRotated = 120,
    NorthAmericaNumber11Envelope = 121,
    NorthAmericaNumber12Envelope = 122,
    NorthAmericaNumber14Envelope = 123,
    NorthAmericaNumber9Envelope = 124,
    NorthAmericaPersonalEnvelope = 125,
    NorthAmericaQuarto = 126,
    NorthAmericaStatement = 127,
    NorthAmericaSuperA = 128,
    NorthAmericaSuperB = 129,
    NorthAmericaTabloid = 130,
    NorthAmericaTabloidExtra = 131,
    OtherMetricA3Plus = 132,
    OtherMetricA4Plus = 133,
    OtherMetricFolio = 134,
    OtherMetricInviteEnvelope = 135,
    OtherMetricItalianEnvelope = 136,
    Prc10Envelope = 137,
    Prc10EnvelopeRotated = 138,
    Prc16K = 139,
    Prc16KRotated = 140,
    Prc1Envelope = 141,
    Prc1EnvelopeRotated = 142,
    Prc2Envelope = 143,
    Prc2EnvelopeRotated = 144,
    Prc32K = 145,
    Prc32KBig = 146,
    Prc32KRotated = 147,
    Prc3Envelope = 148,
    Prc3EnvelopeRotated = 149,
    Prc4Envelope = 150,
    Prc4EnvelopeRotated = 151,
    Prc5Envelope = 152,
    Prc5EnvelopeRotated = 153,
    Prc6Envelope = 154,
    Prc6EnvelopeRotated = 155,
    Prc7Envelope = 156,
    Prc7EnvelopeRotated = 157,
    Prc8Envelope = 158,
    Prc8EnvelopeRotated = 159,
    Prc9Envelope = 160,
    Prc9EnvelopeRotated = 161,
    Roll04Inch = 162,
    Roll06Inch = 163,
    Roll08Inch = 164,
    Roll12Inch = 165,
    Roll15Inch = 166,
    Roll18Inch = 167,
    Roll22Inch = 168,
    Roll24Inch = 169,
    Roll30Inch = 170,
    Roll36Inch = 171,
    Roll54Inch = 172
  );
  PPrinting_PrintMediaSize = ^Printing_PrintMediaSize;

  // Windows.Graphics.Printing.PrintMediaType
  Printing_PrintMediaType = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    AutoSelect = 3,
    Archival = 4,
    BackPrintFilm = 5,
    Bond = 6,
    CardStock = 7,
    Continuous = 8,
    EnvelopePlain = 9,
    EnvelopeWindow = 10,
    Fabric = 11,
    HighResolution = 12,
    &Label = 13,
    MultiLayerForm = 14,
    MultiPartForm = 15,
    Photographic = 16,
    PhotographicFilm = 17,
    PhotographicGlossy = 18,
    PhotographicHighGloss = 19,
    PhotographicMatte = 20,
    PhotographicSatin = 21,
    PhotographicSemiGloss = 22,
    Plain = 23,
    Screen = 24,
    ScreenPaged = 25,
    Stationery = 26,
    TabStockFull = 27,
    TabStockPreCut = 28,
    Transparency = 29,
    TShirtTransfer = 30,
    None = 31
  );
  PPrinting_PrintMediaType = ^Printing_PrintMediaType;

  // Windows.Graphics.Printing.PrintOrientation
  Printing_PrintOrientation = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    Portrait = 3,
    PortraitFlipped = 4,
    Landscape = 5,
    LandscapeFlipped = 6
  );
  PPrinting_PrintOrientation = ^Printing_PrintOrientation;

  // Windows.Graphics.Printing.PrintQuality
  Printing_PrintQuality = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    Automatic = 3,
    Draft = 4,
    Fax = 5,
    High = 6,
    Normal = 7,
    Photographic = 8,
    Text = 9
  );
  PPrinting_PrintQuality = ^Printing_PrintQuality;

  // Windows.Graphics.Printing.PrintColorMode
  Printing_PrintColorMode = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    Color = 3,
    Grayscale = 4,
    Monochrome = 5
  );
  PPrinting_PrintColorMode = ^Printing_PrintColorMode;

  // Windows.Graphics.Printing.PrintDuplex
  Printing_PrintDuplex = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    OneSided = 3,
    TwoSidedShortEdge = 4,
    TwoSidedLongEdge = 5
  );
  PPrinting_PrintDuplex = ^Printing_PrintDuplex;

  // Windows.Graphics.Printing.PrintCollation
  Printing_PrintCollation = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    Collated = 3,
    Uncollated = 4
  );
  PPrinting_PrintCollation = ^Printing_PrintCollation;

  // Windows.Graphics.Printing.PrintStaple
  Printing_PrintStaple = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    None = 3,
    StapleTopLeft = 4,
    StapleTopRight = 5,
    StapleBottomLeft = 6,
    StapleBottomRight = 7,
    StapleDualLeft = 8,
    StapleDualRight = 9,
    StapleDualTop = 10,
    StapleDualBottom = 11,
    SaddleStitch = 12
  );
  PPrinting_PrintStaple = ^Printing_PrintStaple;

  // Windows.Graphics.Printing.PrintHolePunch
  Printing_PrintHolePunch = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    None = 3,
    LeftEdge = 4,
    RightEdge = 5,
    TopEdge = 6,
    BottomEdge = 7
  );
  PPrinting_PrintHolePunch = ^Printing_PrintHolePunch;

  // Windows.Graphics.Printing.PrintBinding
  Printing_PrintBinding = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    None = 3,
    Bale = 4,
    BindBottom = 5,
    BindLeft = 6,
    BindRight = 7,
    BindTop = 8,
    Booklet = 9,
    EdgeStitchBottom = 10,
    EdgeStitchLeft = 11,
    EdgeStitchRight = 12,
    EdgeStitchTop = 13,
    Fold = 14,
    JogOffset = 15,
    Trim = 16
  );
  PPrinting_PrintBinding = ^Printing_PrintBinding;

  // Windows.Graphics.Printing.PrintBordering
  Printing_PrintBordering = (
    Default = 0,
    NotAvailable = 1,
    PrinterCustom = 2,
    Bordered = 3,
    Borderless = 4
  );
  PPrinting_PrintBordering = ^Printing_PrintBordering;

  // Windows.Graphics.Printing.PrintTicket.PrintTicketFeatureSelectionType
  Printing_PrintTicket_PrintTicketFeatureSelectionType = (
    PickOne = 0,
    PickMany = 1
  );
  PPrinting_PrintTicket_PrintTicketFeatureSelectionType = ^Printing_PrintTicket_PrintTicketFeatureSelectionType;

  // Windows.Graphics.Printing.PrintTicket.PrintTicketParameterDataType
  Printing_PrintTicket_PrintTicketParameterDataType = (
    Integer = 0,
    NumericString = 1,
    &String = 2
  );
  PPrinting_PrintTicket_PrintTicketParameterDataType = ^Printing_PrintTicket_PrintTicketParameterDataType;

  // Windows.Graphics.Printing.PrintTicket.PrintTicketValueType
  Printing_PrintTicket_PrintTicketValueType = (
    Integer = 0,
    &String = 1,
    Unknown = 2
  );
  PPrinting_PrintTicket_PrintTicketValueType = ^Printing_PrintTicket_PrintTicketValueType;

  // Windows.Graphics.Printing.PrintTaskCompletion
  Printing_PrintTaskCompletion = (
    Abandoned = 0,
    Canceled = 1,
    Failed = 2,
    Submitted = 3
  );
  PPrinting_PrintTaskCompletion = ^Printing_PrintTaskCompletion;

  // Windows.Graphics.Printing.Workflow.PrintWorkflowSessionStatus
  Printing_Workflow_PrintWorkflowSessionStatus = (
    Started = 0,
    Completed = 1,
    Aborted = 2,
    Closed = 3
  );
  PPrinting_Workflow_PrintWorkflowSessionStatus = ^Printing_Workflow_PrintWorkflowSessionStatus;

  // Windows.Graphics.Printing.Workflow.PrintWorkflowSubmittedStatus
  Printing_Workflow_PrintWorkflowSubmittedStatus = (
    Succeeded = 0,
    Canceled = 1,
    Failed = 2
  );
  PPrinting_Workflow_PrintWorkflowSubmittedStatus = ^Printing_Workflow_PrintWorkflowSubmittedStatus;

  // Windows.Graphics.Holographic.HolographicFramePresentResult
  Holographic_HolographicFramePresentResult = (
    Success = 0,
    DeviceRemoved = 1
  );
  PHolographic_HolographicFramePresentResult = ^Holographic_HolographicFramePresentResult;

  // Windows.Graphics.Holographic.HolographicFramePresentWaitBehavior
  Holographic_HolographicFramePresentWaitBehavior = (
    WaitForFrameToFinish = 0,
    DoNotWaitForFrameToFinish = 1
  );
  PHolographic_HolographicFramePresentWaitBehavior = ^Holographic_HolographicFramePresentWaitBehavior;

  // Windows.Graphics.Holographic.HolographicReprojectionMode
  Holographic_HolographicReprojectionMode = (
    PositionAndOrientation = 0,
    OrientationOnly = 1,
    Disabled = 2
  );
  PHolographic_HolographicReprojectionMode = ^Holographic_HolographicReprojectionMode;

  // Windows.Graphics.DirectX.Direct3D11.Direct3DUsage
  DirectX_Direct3D11_Direct3DUsage = (
    Default = 0,
    Immutable = 1,
    Dynamic = 2,
    Staging = 3
  );
  PDirectX_Direct3D11_Direct3DUsage = ^DirectX_Direct3D11_Direct3DUsage;

  // Windows.Graphics.DirectX.Direct3D11.Direct3DBindings
  DirectX_Direct3D11_Direct3DBindings = (
    VertexBuffer = 1,
    IndexBuffer = 2,
    ConstantBuffer = 4,
    ShaderResource = 8,
    StreamOutput = 16,
    RenderTarget = 32,
    DepthStencil = 64,
    UnorderedAccess = 128,
    Decoder = 512,
    VideoEncoder = 1024
  );
  PDirectX_Direct3D11_Direct3DBindings = ^DirectX_Direct3D11_Direct3DBindings;

  // Windows.Graphics.DirectX.DirectXAlphaMode
  DirectX_DirectXAlphaMode = (
    Unspecified = 0,
    Premultiplied = 1,
    Straight = 2,
    Ignore = 3
  );
  PDirectX_DirectXAlphaMode = ^DirectX_DirectXAlphaMode;

  // Windows.Graphics.DirectX.DirectXPixelFormat
  DirectX_DirectXPixelFormat = (
    Unknown = 0,
    R32G32B32A32Typeless = 1,
    R32G32B32A32Float = 2,
    R32G32B32A32UInt = 3,
    R32G32B32A32Int = 4,
    R32G32B32Typeless = 5,
    R32G32B32Float = 6,
    R32G32B32UInt = 7,
    R32G32B32Int = 8,
    R16G16B16A16Typeless = 9,
    R16G16B16A16Float = 10,
    R16G16B16A16UIntNormalized = 11,
    R16G16B16A16UInt = 12,
    R16G16B16A16IntNormalized = 13,
    R16G16B16A16Int = 14,
    R32G32Typeless = 15,
    R32G32Float = 16,
    R32G32UInt = 17,
    R32G32Int = 18,
    R32G8X24Typeless = 19,
    D32FloatS8X24UInt = 20,
    R32FloatX8X24Typeless = 21,
    X32TypelessG8X24UInt = 22,
    R10G10B10A2Typeless = 23,
    R10G10B10A2UIntNormalized = 24,
    R10G10B10A2UInt = 25,
    R11G11B10Float = 26,
    R8G8B8A8Typeless = 27,
    R8G8B8A8UIntNormalized = 28,
    R8G8B8A8UIntNormalizedSrgb = 29,
    R8G8B8A8UInt = 30,
    R8G8B8A8IntNormalized = 31,
    R8G8B8A8Int = 32,
    R16G16Typeless = 33,
    R16G16Float = 34,
    R16G16UIntNormalized = 35,
    R16G16UInt = 36,
    R16G16IntNormalized = 37,
    R16G16Int = 38,
    R32Typeless = 39,
    D32Float = 40,
    R32Float = 41,
    R32UInt = 42,
    R32Int = 43,
    R24G8Typeless = 44,
    D24UIntNormalizedS8UInt = 45,
    R24UIntNormalizedX8Typeless = 46,
    X24TypelessG8UInt = 47,
    R8G8Typeless = 48,
    R8G8UIntNormalized = 49,
    R8G8UInt = 50,
    R8G8IntNormalized = 51,
    R8G8Int = 52,
    R16Typeless = 53,
    R16Float = 54,
    D16UIntNormalized = 55,
    R16UIntNormalized = 56,
    R16UInt = 57,
    R16IntNormalized = 58,
    R16Int = 59,
    R8Typeless = 60,
    R8UIntNormalized = 61,
    R8UInt = 62,
    R8IntNormalized = 63,
    R8Int = 64,
    A8UIntNormalized = 65,
    R1UIntNormalized = 66,
    R9G9B9E5SharedExponent = 67,
    R8G8B8G8UIntNormalized = 68,
    G8R8G8B8UIntNormalized = 69,
    BC1Typeless = 70,
    BC1UIntNormalized = 71,
    BC1UIntNormalizedSrgb = 72,
    BC2Typeless = 73,
    BC2UIntNormalized = 74,
    BC2UIntNormalizedSrgb = 75,
    BC3Typeless = 76,
    BC3UIntNormalized = 77,
    BC3UIntNormalizedSrgb = 78,
    BC4Typeless = 79,
    BC4UIntNormalized = 80,
    BC4IntNormalized = 81,
    BC5Typeless = 82,
    BC5UIntNormalized = 83,
    BC5IntNormalized = 84,
    B5G6R5UIntNormalized = 85,
    B5G5R5A1UIntNormalized = 86,
    B8G8R8A8UIntNormalized = 87,
    B8G8R8X8UIntNormalized = 88,
    R10G10B10XRBiasA2UIntNormalized = 89,
    B8G8R8A8Typeless = 90,
    B8G8R8A8UIntNormalizedSrgb = 91,
    B8G8R8X8Typeless = 92,
    B8G8R8X8UIntNormalizedSrgb = 93,
    BC6HTypeless = 94,
    BC6H16UnsignedFloat = 95,
    BC6H16Float = 96,
    BC7Typeless = 97,
    BC7UIntNormalized = 98,
    BC7UIntNormalizedSrgb = 99,
    Ayuv = 100,
    Y410 = 101,
    Y416 = 102,
    NV12 = 103,
    P010 = 104,
    P016 = 105,
    Opaque420 = 106,
    Yuy2 = 107,
    Y210 = 108,
    Y216 = 109,
    NV11 = 110,
    AI44 = 111,
    IA44 = 112,
    P8 = 113,
    A8P8 = 114,
    B4G4R4A4UIntNormalized = 115,
    P208 = 130,
    V208 = 131,
    V408 = 132
  );
  PDirectX_DirectXPixelFormat = ^DirectX_DirectXPixelFormat;

  // Windows.Management.Deployment.DeploymentProgressState
  Deployment_DeploymentProgressState = (
    Queued = 0,
    Processing = 1
  );
  PDeployment_DeploymentProgressState = ^Deployment_DeploymentProgressState;

  // Windows.Management.Deployment.DeploymentOptions
  Deployment_DeploymentOptions = (
    None = 0,
    ForceApplicationShutdown = 1,
    DevelopmentMode = 2,
    InstallAllResources = 32,
    ForceTargetApplicationShutdown = 64,
    RequiredContentGroupOnly = 256
  );
  PDeployment_DeploymentOptions = ^Deployment_DeploymentOptions;

  // Windows.Management.Deployment.RemovalOptions
  Deployment_RemovalOptions = (
    None = 0,
    PreserveApplicationData = 4096
  );
  PDeployment_RemovalOptions = ^Deployment_RemovalOptions;

  // Windows.Management.Deployment.AddPackageByAppInstallerOptions
  Deployment_AddPackageByAppInstallerOptions = (
    None = 0,
    InstallAllResources = 32,
    ForceTargetAppShutdown = 64,
    RequiredContentGroupOnly = 256
  );
  PDeployment_AddPackageByAppInstallerOptions = ^Deployment_AddPackageByAppInstallerOptions;

  // Windows.Management.Deployment.PackageTypes
  Deployment_PackageTypes = (
    None = 0,
    Main = 1,
    Framework = 2,
    Resource = 4,
    Bundle = 8,
    Xap = 16,
    Optional = 32
  );
  PDeployment_PackageTypes = ^Deployment_PackageTypes;

  // Windows.Management.Deployment.PackageInstallState
  Deployment_PackageInstallState = (
    NotInstalled = 0,
    Staged = 1,
    Installed = 2,
    Paused = 6
  );
  PDeployment_PackageInstallState = ^Deployment_PackageInstallState;

  // Windows.Management.Deployment.PackageState
  Deployment_PackageState = (
    Normal = 0,
    LicenseInvalid = 1,
    Modified = 2,
    Tampered = 3
  );
  PDeployment_PackageState = ^Deployment_PackageState;

  // Windows.Management.Deployment.PackageStatus
  Deployment_PackageStatus = (
    OK = 0,
    LicenseIssue = 1,
    Modified = 2,
    Tampered = 4,
    Disabled = 8
  );
  PDeployment_PackageStatus = ^Deployment_PackageStatus;

  // Windows.Management.MdmAlertMark
  MdmAlertMark = (
    None = 0,
    Fatal = 1,
    Critical = 2,
    Warning = 3,
    Informational = 4
  );
  PMdmAlertMark = ^MdmAlertMark;

  // Windows.Management.MdmAlertDataType
  MdmAlertDataType = (
    &String = 0,
    Base64 = 1,
    Boolean = 2,
    Integer = 3
  );
  PMdmAlertDataType = ^MdmAlertDataType;

  // Windows.Management.MdmSessionState
  MdmSessionState = (
    NotStarted = 0,
    Starting = 1,
    Connecting = 2,
    Communicating = 3,
    AlertStatusAvailable = 4,
    Retrying = 5,
    Completed = 6
  );
  PMdmSessionState = ^MdmSessionState;

  // Windows.Management.Policies.NamedPolicyKind
  Policies_NamedPolicyKind = (
    Invalid = 0,
    Binary = 1,
    Boolean = 2,
    Int32 = 3,
    Int64 = 4,
    &String = 5
  );
  PPolicies_NamedPolicyKind = ^Policies_NamedPolicyKind;

  // Windows.Management.Workplace.MessagingSyncPolicy
  Workplace_MessagingSyncPolicy = (
    Disallowed = 0,
    Allowed = 1,
    Required = 2
  );
  PWorkplace_MessagingSyncPolicy = ^Workplace_MessagingSyncPolicy;

  // Windows.Media.Capture.AppCaptureVideoEncodingBitrateMode
  Capture_AppCaptureVideoEncodingBitrateMode = (
    Custom = 0,
    High = 1,
    Standard = 2
  );
  PCapture_AppCaptureVideoEncodingBitrateMode = ^Capture_AppCaptureVideoEncodingBitrateMode;

  // Windows.Media.Capture.AppCaptureVideoEncodingResolutionMode
  Capture_AppCaptureVideoEncodingResolutionMode = (
    Custom = 0,
    High = 1,
    Standard = 2
  );
  PCapture_AppCaptureVideoEncodingResolutionMode = ^Capture_AppCaptureVideoEncodingResolutionMode;

  // Windows.Media.Capture.AppCaptureVideoEncodingFrameRateMode
  Capture_AppCaptureVideoEncodingFrameRateMode = (
    Standard = 0,
    High = 1
  );
  PCapture_AppCaptureVideoEncodingFrameRateMode = ^Capture_AppCaptureVideoEncodingFrameRateMode;

  // Windows.Media.Capture.AppCaptureHistoricalBufferLengthUnit
  Capture_AppCaptureHistoricalBufferLengthUnit = (
    Megabytes = 0,
    Seconds = 1
  );
  PCapture_AppCaptureHistoricalBufferLengthUnit = ^Capture_AppCaptureHistoricalBufferLengthUnit;

  // Windows.Media.Capture.AppCaptureMicrophoneCaptureState
  Capture_AppCaptureMicrophoneCaptureState = (
    Stopped = 0,
    Started = 1,
    Failed = 2
  );
  PCapture_AppCaptureMicrophoneCaptureState = ^Capture_AppCaptureMicrophoneCaptureState;

  // Windows.Media.Capture.AppCaptureRecordingState
  Capture_AppCaptureRecordingState = (
    InProgress = 0,
    Completed = 1,
    Failed = 2
  );
  PCapture_AppCaptureRecordingState = ^Capture_AppCaptureRecordingState;

  // Windows.Media.AppRecording.AppRecordingSaveScreenshotOption
  AppRecording_AppRecordingSaveScreenshotOption = (
    None = 0,
    HdrContentVisible = 1
  );
  PAppRecording_AppRecordingSaveScreenshotOption = ^AppRecording_AppRecordingSaveScreenshotOption;

  // Windows.Media.AudioBufferAccessMode
  AudioBufferAccessMode = (
    Read = 0,
    ReadWrite = 1,
    Write = 2
  );
  PAudioBufferAccessMode = ^AudioBufferAccessMode;

  // Windows.Media.Audio.AudioGraphCreationStatus
  Audio_AudioGraphCreationStatus = (
    Success = 0,
    DeviceNotAvailable = 1,
    FormatNotSupported = 2,
    UnknownFailure = 3
  );
  PAudio_AudioGraphCreationStatus = ^Audio_AudioGraphCreationStatus;

  // Windows.Media.Audio.QuantumSizeSelectionMode
  Audio_QuantumSizeSelectionMode = (
    SystemDefault = 0,
    LowestLatency = 1,
    ClosestToDesired = 2
  );
  PAudio_QuantumSizeSelectionMode = ^Audio_QuantumSizeSelectionMode;

  // Windows.Media.Audio.AudioDeviceNodeCreationStatus
  Audio_AudioDeviceNodeCreationStatus = (
    Success = 0,
    DeviceNotAvailable = 1,
    FormatNotSupported = 2,
    UnknownFailure = 3,
    AccessDenied = 4
  );
  PAudio_AudioDeviceNodeCreationStatus = ^Audio_AudioDeviceNodeCreationStatus;

  // Windows.Media.Audio.AudioFileNodeCreationStatus
  Audio_AudioFileNodeCreationStatus = (
    Success = 0,
    FileNotFound = 1,
    InvalidFileType = 2,
    FormatNotSupported = 3,
    UnknownFailure = 4
  );
  PAudio_AudioFileNodeCreationStatus = ^Audio_AudioFileNodeCreationStatus;

  // Windows.Media.Audio.AudioGraphUnrecoverableError
  Audio_AudioGraphUnrecoverableError = (
    None = 0,
    AudioDeviceLost = 1,
    AudioSessionDisconnected = 2,
    UnknownFailure = 3
  );
  PAudio_AudioGraphUnrecoverableError = ^Audio_AudioGraphUnrecoverableError;

  // Windows.Media.Audio.AudioNodeEmitterSettings
  Audio_AudioNodeEmitterSettings = (
    None = 0,
    DisableDoppler = 1
  );
  PAudio_AudioNodeEmitterSettings = ^Audio_AudioNodeEmitterSettings;

  // Windows.Media.Audio.AudioNodeEmitterShapeKind
  Audio_AudioNodeEmitterShapeKind = (
    Omnidirectional = 0,
    Cone = 1
  );
  PAudio_AudioNodeEmitterShapeKind = ^Audio_AudioNodeEmitterShapeKind;

  // Windows.Media.Audio.AudioNodeEmitterDecayKind
  Audio_AudioNodeEmitterDecayKind = (
    Natural = 0,
    Custom = 1
  );
  PAudio_AudioNodeEmitterDecayKind = ^Audio_AudioNodeEmitterDecayKind;

  // Windows.Media.Audio.SpatialAudioModel
  Audio_SpatialAudioModel = (
    ObjectBased = 0,
    FoldDown = 1
  );
  PAudio_SpatialAudioModel = ^Audio_SpatialAudioModel;

  // Windows.Media.Capture.CameraCaptureUIMode
  Capture_CameraCaptureUIMode = (
    PhotoOrVideo = 0,
    Photo = 1,
    Video = 2
  );
  PCapture_CameraCaptureUIMode = ^Capture_CameraCaptureUIMode;

  // Windows.Media.Capture.CameraCaptureUIPhotoFormat
  Capture_CameraCaptureUIPhotoFormat = (
    Jpeg = 0,
    Png = 1,
    JpegXR = 2
  );
  PCapture_CameraCaptureUIPhotoFormat = ^Capture_CameraCaptureUIPhotoFormat;

  // Windows.Media.Capture.CameraCaptureUIVideoFormat
  Capture_CameraCaptureUIVideoFormat = (
    Mp4 = 0,
    Wmv = 1
  );
  PCapture_CameraCaptureUIVideoFormat = ^Capture_CameraCaptureUIVideoFormat;

  // Windows.Media.Capture.CameraCaptureUIMaxVideoResolution
  Capture_CameraCaptureUIMaxVideoResolution = (
    HighestAvailable = 0,
    LowDefinition = 1,
    StandardDefinition = 2,
    HighDefinition = 3
  );
  PCapture_CameraCaptureUIMaxVideoResolution = ^Capture_CameraCaptureUIMaxVideoResolution;

  // Windows.Media.Capture.CameraCaptureUIMaxPhotoResolution
  Capture_CameraCaptureUIMaxPhotoResolution = (
    HighestAvailable = 0,
    VerySmallQvga = 1,
    SmallVga = 2,
    MediumXga = 3,
    Large3M = 4,
    VeryLarge5M = 5
  );
  PCapture_CameraCaptureUIMaxPhotoResolution = ^Capture_CameraCaptureUIMaxPhotoResolution;

  // Windows.Media.Capture.MediaCategory
  Capture_MediaCategory = (
    Other = 0,
    Communications = 1,
    Media = 2,
    GameChat = 3,
    Speech = 4
  );
  PCapture_MediaCategory = ^Capture_MediaCategory;

  // Windows.Media.Capture.StreamingCaptureMode
  Capture_StreamingCaptureMode = (
    AudioAndVideo = 0,
    Audio = 1,
    Video = 2
  );
  PCapture_StreamingCaptureMode = ^Capture_StreamingCaptureMode;

  // Windows.Media.Capture.VideoRotation
  Capture_VideoRotation = (
    None = 0,
    Clockwise90Degrees = 1,
    Clockwise180Degrees = 2,
    Clockwise270Degrees = 3
  );
  PCapture_VideoRotation = ^Capture_VideoRotation;

  // Windows.Media.Capture.PhotoCaptureSource
  Capture_PhotoCaptureSource = (
    Auto = 0,
    VideoPreview = 1,
    Photo = 2
  );
  PCapture_PhotoCaptureSource = ^Capture_PhotoCaptureSource;

  // Windows.Media.Capture.VideoDeviceCharacteristic
  Capture_VideoDeviceCharacteristic = (
    AllStreamsIndependent = 0,
    PreviewRecordStreamsIdentical = 1,
    PreviewPhotoStreamsIdentical = 2,
    RecordPhotoStreamsIdentical = 3,
    AllStreamsIdentical = 4
  );
  PCapture_VideoDeviceCharacteristic = ^Capture_VideoDeviceCharacteristic;

  // Windows.Media.Capture.MediaCaptureThermalStatus
  Capture_MediaCaptureThermalStatus = (
    Normal = 0,
    Overheated = 1
  );
  PCapture_MediaCaptureThermalStatus = ^Capture_MediaCaptureThermalStatus;

  // Windows.Media.Capture.MediaCaptureDeviceExclusiveControlStatus
  Capture_MediaCaptureDeviceExclusiveControlStatus = (
    ExclusiveControlAvailable = 0,
    SharedReadOnlyAvailable = 1
  );
  PCapture_MediaCaptureDeviceExclusiveControlStatus = ^Capture_MediaCaptureDeviceExclusiveControlStatus;

  // Windows.Media.Capture.KnownVideoProfile
  Capture_KnownVideoProfile = (
    VideoRecording = 0,
    HighQualityPhoto = 1,
    BalancedVideoAndPhoto = 2,
    VideoConferencing = 3,
    PhotoSequence = 4
  );
  PCapture_KnownVideoProfile = ^Capture_KnownVideoProfile;

  // Windows.Media.Capture.MediaCaptureMemoryPreference
  Capture_MediaCaptureMemoryPreference = (
    Auto = 0,
    Cpu = 1
  );
  PCapture_MediaCaptureMemoryPreference = ^Capture_MediaCaptureMemoryPreference;

  // Windows.Media.Capture.MediaCaptureSharingMode
  Capture_MediaCaptureSharingMode = (
    ExclusiveControl = 0,
    SharedReadOnly = 1
  );
  PCapture_MediaCaptureSharingMode = ^Capture_MediaCaptureSharingMode;

  // Windows.Media.Capture.Frames.MediaFrameReaderStartStatus
  Capture_Frames_MediaFrameReaderStartStatus = (
    Success = 0,
    UnknownFailure = 1,
    DeviceNotAvailable = 2,
    OutputFormatNotSupported = 3,
    ExclusiveControlNotAvailable = 4
  );
  PCapture_Frames_MediaFrameReaderStartStatus = ^Capture_Frames_MediaFrameReaderStartStatus;

  // Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus
  Capture_Frames_MediaFrameSourceSetPropertyStatus = (
    Success = 0,
    UnknownFailure = 1,
    NotSupported = 2,
    InvalidValue = 3,
    DeviceNotAvailable = 4,
    NotInControl = 5
  );
  PCapture_Frames_MediaFrameSourceSetPropertyStatus = ^Capture_Frames_MediaFrameSourceSetPropertyStatus;

  // Windows.Media.Capture.Frames.MediaFrameSourceGetPropertyStatus
  Capture_Frames_MediaFrameSourceGetPropertyStatus = (
    Success = 0,
    UnknownFailure = 1,
    NotSupported = 2,
    DeviceNotAvailable = 3,
    MaxPropertyValueSizeTooSmall = 4,
    MaxPropertyValueSizeRequired = 5
  );
  PCapture_Frames_MediaFrameSourceGetPropertyStatus = ^Capture_Frames_MediaFrameSourceGetPropertyStatus;

  // Windows.Media.Capture.Frames.MediaFrameSourceKind
  Capture_Frames_MediaFrameSourceKind = (
    Custom = 0,
    Color = 1,
    Infrared = 2,
    Depth = 3
  );
  PCapture_Frames_MediaFrameSourceKind = ^Capture_Frames_MediaFrameSourceKind;

  // Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus
  Capture_Frames_MultiSourceMediaFrameReaderStartStatus = (
    Success = 0,
    NotSupported = 1,
    InsufficientResources = 2,
    DeviceNotAvailable = 3,
    UnknownFailure = 4
  );
  PCapture_Frames_MultiSourceMediaFrameReaderStartStatus = ^Capture_Frames_MultiSourceMediaFrameReaderStartStatus;

  // Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
  Capture_Frames_MediaFrameReaderAcquisitionMode = (
    Realtime = 0,
    Buffered = 1
  );
  PCapture_Frames_MediaFrameReaderAcquisitionMode = ^Capture_Frames_MediaFrameReaderAcquisitionMode;

  // Windows.Media.Casting.CastingPlaybackTypes
  Casting_CastingPlaybackTypes = (
    None = 0,
    Audio = 1,
    Video = 2,
    Picture = 4
  );
  PCasting_CastingPlaybackTypes = ^Casting_CastingPlaybackTypes;

  // Windows.Media.Casting.CastingConnectionErrorStatus
  Casting_CastingConnectionErrorStatus = (
    Succeeded = 0,
    DeviceDidNotRespond = 1,
    DeviceError = 2,
    DeviceLocked = 3,
    ProtectedPlaybackFailed = 4,
    InvalidCastingSource = 5,
    Unknown = 6
  );
  PCasting_CastingConnectionErrorStatus = ^Casting_CastingConnectionErrorStatus;

  // Windows.Media.Casting.CastingConnectionState
  Casting_CastingConnectionState = (
    Disconnected = 0,
    Connected = 1,
    Rendering = 2,
    Disconnecting = 3,
    Connecting = 4
  );
  PCasting_CastingConnectionState = ^Casting_CastingConnectionState;

  // Windows.Media.Core.TimedTextScrollMode
  Core_TimedTextScrollMode = (
    Popon = 0,
    Rollup = 1
  );
  PCore_TimedTextScrollMode = ^Core_TimedTextScrollMode;

  // Windows.Media.Core.TimedTextUnit
  Core_TimedTextUnit = (
    Pixels = 0,
    Percentage = 1
  );
  PCore_TimedTextUnit = ^Core_TimedTextUnit;

  // Windows.Media.Core.TimedTextWritingMode
  Core_TimedTextWritingMode = (
    LeftRightTopBottom = 0,
    RightLeftTopBottom = 1,
    TopBottomRightLeft = 2,
    TopBottomLeftRight = 3,
    LeftRight = 4,
    RightLeft = 5,
    TopBottom = 6
  );
  PCore_TimedTextWritingMode = ^Core_TimedTextWritingMode;

  // Windows.Media.Core.TimedTextDisplayAlignment
  Core_TimedTextDisplayAlignment = (
    Before = 0,
    After = 1,
    Center = 2
  );
  PCore_TimedTextDisplayAlignment = ^Core_TimedTextDisplayAlignment;

  // Windows.Media.Core.TimedTextLineAlignment
  Core_TimedTextLineAlignment = (
    Start = 0,
    &End = 1,
    Center = 2
  );
  PCore_TimedTextLineAlignment = ^Core_TimedTextLineAlignment;

  // Windows.Media.Core.TimedTextWrapping
  Core_TimedTextWrapping = (
    NoWrap = 0,
    Wrap = 1
  );
  PCore_TimedTextWrapping = ^Core_TimedTextWrapping;

  // Windows.Media.Core.TimedTextWeight
  Core_TimedTextWeight = (
    Normal = 400,
    Bold = 700
  );
  PCore_TimedTextWeight = ^Core_TimedTextWeight;

  // Windows.Media.Core.TimedTextFlowDirection
  Core_TimedTextFlowDirection = (
    LeftToRight = 0,
    RightToLeft = 1
  );
  PCore_TimedTextFlowDirection = ^Core_TimedTextFlowDirection;

  // Windows.Media.Core.TimedTextFontStyle
  Core_TimedTextFontStyle = (
    Normal = 0,
    Oblique = 1,
    Italic = 2
  );
  PCore_TimedTextFontStyle = ^Core_TimedTextFontStyle;

  // Windows.Media.Core.CodecKind
  Core_CodecKind = (
    Audio = 0,
    Video = 1
  );
  PCore_CodecKind = ^Core_CodecKind;

  // Windows.Media.Core.CodecCategory
  Core_CodecCategory = (
    Encoder = 0,
    Decoder = 1
  );
  PCore_CodecCategory = ^Core_CodecCategory;

  // Windows.Media.DialProtocol.DialAppState
  DialProtocol_DialAppState = (
    Unknown = 0,
    Stopped = 1,
    Running = 2,
    NetworkFailure = 3
  );
  PDialProtocol_DialAppState = ^DialProtocol_DialAppState;

  // Windows.Media.DialProtocol.DialAppLaunchResult
  DialProtocol_DialAppLaunchResult = (
    Launched = 0,
    FailedToLaunch = 1,
    NotFound = 2,
    NetworkFailure = 3
  );
  PDialProtocol_DialAppLaunchResult = ^DialProtocol_DialAppLaunchResult;

  // Windows.Media.DialProtocol.DialAppStopResult
  DialProtocol_DialAppStopResult = (
    Stopped = 0,
    StopFailed = 1,
    OperationNotSupported = 2,
    NetworkFailure = 3
  );
  PDialProtocol_DialAppStopResult = ^DialProtocol_DialAppStopResult;

  // Windows.Media.DialProtocol.DialDeviceDisplayStatus
  DialProtocol_DialDeviceDisplayStatus = (
    None = 0,
    Connecting = 1,
    Connected = 2,
    Disconnecting = 3,
    Disconnected = 4,
    Error = 5
  );
  PDialProtocol_DialDeviceDisplayStatus = ^DialProtocol_DialDeviceDisplayStatus;

  // Windows.Media.Editing.VideoFramePrecision
  Editing_VideoFramePrecision = (
    NearestFrame = 0,
    NearestKeyFrame = 1
  );
  PEditing_VideoFramePrecision = ^Editing_VideoFramePrecision;

  // Windows.Media.Editing.MediaTrimmingPreference
  Editing_MediaTrimmingPreference = (
    Fast = 0,
    Precise = 1
  );
  PEditing_MediaTrimmingPreference = ^Editing_MediaTrimmingPreference;

  // Windows.Media.Render.AudioRenderCategory
  Render_AudioRenderCategory = (
    Other = 0,
    ForegroundOnlyMedia = 1,
    BackgroundCapableMedia = 2,
    Communications = 3,
    Alerts = 4,
    SoundEffects = 5,
    GameEffects = 6,
    GameMedia = 7,
    GameChat = 8,
    Speech = 9,
    Movie = 10,
    Media = 11
  );
  PRender_AudioRenderCategory = ^Render_AudioRenderCategory;

  // Windows.Media.Effects.AudioEffectType
  Effects_AudioEffectType = (
    Other = 0,
    AcousticEchoCancellation = 1,
    NoiseSuppression = 2,
    AutomaticGainControl = 3,
    BeamForming = 4,
    ConstantToneRemoval = 5,
    Equalizer = 6,
    LoudnessEqualizer = 7,
    BassBoost = 8,
    VirtualSurround = 9,
    VirtualHeadphones = 10,
    SpeakerFill = 11,
    RoomCorrection = 12,
    BassManagement = 13,
    EnvironmentalEffects = 14,
    SpeakerProtection = 15,
    SpeakerCompensation = 16,
    DynamicRangeCompression = 17
  );
  PEffects_AudioEffectType = ^Effects_AudioEffectType;

  // Windows.Media.Import.PhotoImportStage
  Import_PhotoImportStage = (
    NotStarted = 0,
    FindingItems = 1,
    ImportingItems = 2,
    DeletingImportedItemsFromSource = 3
  );
  PImport_PhotoImportStage = ^Import_PhotoImportStage;

  // Windows.Media.Import.PhotoImportAccessMode
  Import_PhotoImportAccessMode = (
    ReadWrite = 0,
    ReadOnly = 1,
    ReadAndDelete = 2
  );
  PImport_PhotoImportAccessMode = ^Import_PhotoImportAccessMode;

  // Windows.Media.Import.PhotoImportImportMode
  Import_PhotoImportImportMode = (
    ImportEverything = 0,
    IgnoreSidecars = 1,
    IgnoreSiblings = 2,
    IgnoreSidecarsAndSiblings = 3
  );
  PImport_PhotoImportImportMode = ^Import_PhotoImportImportMode;

  // Windows.Media.Import.PhotoImportSourceType
  Import_PhotoImportSourceType = (
    Generic = 0,
    Camera = 1,
    MediaPlayer = 2,
    Phone = 3,
    Video = 4,
    PersonalInfoManager = 5,
    AudioRecorder = 6
  );
  PImport_PhotoImportSourceType = ^Import_PhotoImportSourceType;

  // Windows.Media.Import.PhotoImportContentType
  Import_PhotoImportContentType = (
    Unknown = 0,
    Image = 1,
    Video = 2
  );
  PImport_PhotoImportContentType = ^Import_PhotoImportContentType;

  // Windows.Media.Import.PhotoImportPowerSource
  Import_PhotoImportPowerSource = (
    Unknown = 0,
    Battery = 1,
    External = 2
  );
  PImport_PhotoImportPowerSource = ^Import_PhotoImportPowerSource;

  // Windows.Media.Import.PhotoImportStorageMediumType
  Import_PhotoImportStorageMediumType = (
    Undefined = 0,
    Fixed = 1,
    Removable = 2
  );
  PImport_PhotoImportStorageMediumType = ^Import_PhotoImportStorageMediumType;

  // Windows.Media.Import.PhotoImportContentTypeFilter
  Import_PhotoImportContentTypeFilter = (
    OnlyImages = 0,
    OnlyVideos = 1,
    ImagesAndVideos = 2
  );
  PImport_PhotoImportContentTypeFilter = ^Import_PhotoImportContentTypeFilter;

  // Windows.Media.Import.PhotoImportItemSelectionMode
  Import_PhotoImportItemSelectionMode = (
    SelectAll = 0,
    SelectNone = 1,
    SelectNew = 2
  );
  PImport_PhotoImportItemSelectionMode = ^Import_PhotoImportItemSelectionMode;

  // Windows.Media.Import.PhotoImportSubfolderDateFormat
  Import_PhotoImportSubfolderDateFormat = (
    Year = 0,
    YearMonth = 1,
    YearMonthDay = 2
  );
  PImport_PhotoImportSubfolderDateFormat = ^Import_PhotoImportSubfolderDateFormat;

  // Windows.Media.Import.PhotoImportConnectionTransport
  Import_PhotoImportConnectionTransport = (
    Unknown = 0,
    Usb = 1,
    IP = 2,
    Bluetooth = 3
  );
  PImport_PhotoImportConnectionTransport = ^Import_PhotoImportConnectionTransport;

  // Windows.Media.Import.PhotoImportSubfolderCreationMode
  Import_PhotoImportSubfolderCreationMode = (
    DoNotCreateSubfolders = 0,
    CreateSubfoldersFromFileDate = 1,
    CreateSubfoldersFromExifDate = 2,
    KeepOriginalFolderStructure = 3
  );
  PImport_PhotoImportSubfolderCreationMode = ^Import_PhotoImportSubfolderCreationMode;

  // Windows.Media.SoundLevel
  SoundLevel = (
    Muted = 0,
    Low = 1,
    Full = 2
  );
  PSoundLevel = ^SoundLevel;

  // Windows.Media.Playback.MediaPlayerState
  Playback_MediaPlayerState = (
    Closed = 0,
    Opening = 1,
    Buffering = 2,
    Playing = 3,
    Paused = 4,
    Stopped = 5
  );
  PPlayback_MediaPlayerState = ^Playback_MediaPlayerState;

  // Windows.Media.Playback.MediaPlaybackState
  Playback_MediaPlaybackState = (
    None = 0,
    Opening = 1,
    Buffering = 2,
    Playing = 3,
    Paused = 4
  );
  PPlayback_MediaPlaybackState = ^Playback_MediaPlaybackState;

  // Windows.Media.Playback.MediaPlayerError
  Playback_MediaPlayerError = (
    Unknown = 0,
    Aborted = 1,
    NetworkError = 2,
    DecodingError = 3,
    SourceNotSupported = 4
  );
  PPlayback_MediaPlayerError = ^Playback_MediaPlayerError;

  // Windows.Media.Playback.MediaPlayerAudioCategory
  Playback_MediaPlayerAudioCategory = (
    Other = 0,
    Communications = 3,
    Alerts = 4,
    SoundEffects = 5,
    GameEffects = 6,
    GameMedia = 7,
    GameChat = 8,
    Speech = 9,
    Movie = 10,
    Media = 11
  );
  PPlayback_MediaPlayerAudioCategory = ^Playback_MediaPlayerAudioCategory;

  // Windows.Media.Playback.MediaPlayerAudioDeviceType
  Playback_MediaPlayerAudioDeviceType = (
    Console = 0,
    Multimedia = 1,
    Communications = 2
  );
  PPlayback_MediaPlayerAudioDeviceType = ^Playback_MediaPlayerAudioDeviceType;

  // Windows.Media.Playback.StereoscopicVideoRenderMode
  Playback_StereoscopicVideoRenderMode = (
    Mono = 0,
    Stereo = 1
  );
  PPlayback_StereoscopicVideoRenderMode = ^Playback_StereoscopicVideoRenderMode;

  // Windows.Media.Playback.SphericalVideoProjectionMode
  Playback_SphericalVideoProjectionMode = (
    Spherical = 0,
    Flat = 1
  );
  PPlayback_SphericalVideoProjectionMode = ^Playback_SphericalVideoProjectionMode;

  // Windows.Media.Playback.MediaCommandEnablingRule
  Playback_MediaCommandEnablingRule = (
    Auto = 0,
    Always = 1,
    Never = 2
  );
  PPlayback_MediaCommandEnablingRule = ^Playback_MediaCommandEnablingRule;

  // Windows.Media.PlayTo.PlayToConnectionState
  PlayTo_PlayToConnectionState = (
    Disconnected = 0,
    Connected = 1,
    Rendering = 2
  );
  PPlayTo_PlayToConnectionState = ^PlayTo_PlayToConnectionState;

  // Windows.Media.PlayTo.PlayToConnectionError
  PlayTo_PlayToConnectionError = (
    None = 0,
    DeviceNotResponding = 1,
    DeviceError = 2,
    DeviceLocked = 3,
    ProtectedPlaybackFailed = 4
  );
  PPlayTo_PlayToConnectionError = ^PlayTo_PlayToConnectionError;

  // Windows.Media.Protection.PlayReady.PlayReadyDecryptorSetup
  Protection_PlayReady_PlayReadyDecryptorSetup = (
    Uninitialized = 0,
    OnDemand = 1
  );
  PProtection_PlayReady_PlayReadyDecryptorSetup = ^Protection_PlayReady_PlayReadyDecryptorSetup;

  // Windows.Media.Protection.PlayReady.PlayReadyEncryptionAlgorithm
  Protection_PlayReady_PlayReadyEncryptionAlgorithm = (
    Unprotected = 0,
    Aes128Ctr = 1,
    Cocktail = 4,
    Aes128Cbc = 5,
    Unspecified = 65535,
    Uninitialized = 2147483647
  );
  PProtection_PlayReady_PlayReadyEncryptionAlgorithm = ^Protection_PlayReady_PlayReadyEncryptionAlgorithm;

  // Windows.Media.Protection.PlayReady.PlayReadyHardwareDRMFeatures
  Protection_PlayReady_PlayReadyHardwareDRMFeatures = (
    HardwareDRM = 1,
    HEVC = 2,
    Aes128Cbc = 3
  );
  PProtection_PlayReady_PlayReadyHardwareDRMFeatures = ^Protection_PlayReady_PlayReadyHardwareDRMFeatures;

  // Windows.Media.Protection.PlayReady.PlayReadyITADataFormat
  Protection_PlayReady_PlayReadyITADataFormat = (
    SerializedProperties = 0,
    SerializedProperties_WithContentProtectionWrapper = 1
  );
  PProtection_PlayReady_PlayReadyITADataFormat = ^Protection_PlayReady_PlayReadyITADataFormat;

  // Windows.Media.Protection.PlayReady.NDCertificateType
  Protection_PlayReady_NDCertificateType = (
    Unknown = 0,
    PC = 1,
    Device = 2,
    Domain = 3,
    Issuer = 4,
    CrlSigner = 5,
    Service = 6,
    Silverlight = 7,
    Application = 8,
    Metering = 9,
    KeyFileSigner = 10,
    Server = 11,
    LicenseSigner = 12
  );
  PProtection_PlayReady_NDCertificateType = ^Protection_PlayReady_NDCertificateType;

  // Windows.Media.Protection.PlayReady.NDCertificatePlatformID
  Protection_PlayReady_NDCertificatePlatformID = (
    Windows = 0,
    OSX = 1,
    WindowsOnARM = 2,
    WindowsMobile7 = 5,
    iOSOnARM = 6,
    XBoxOnPPC = 7,
    WindowsPhone8OnARM = 8,
    WindowsPhone8OnX86 = 9,
    XboxOne = 10,
    AndroidOnARM = 11,
    WindowsPhone81OnARM = 12,
    WindowsPhone81OnX86 = 13
  );
  PProtection_PlayReady_NDCertificatePlatformID = ^Protection_PlayReady_NDCertificatePlatformID;

  // Windows.Media.Protection.PlayReady.NDCertificateFeature
  Protection_PlayReady_NDCertificateFeature = (
    Transmitter = 1,
    Receiver = 2,
    SharedCertificate = 3,
    SecureClock = 4,
    AntiRollBackClock = 5,
    CRLS = 9,
    PlayReady3Features = 13
  );
  PProtection_PlayReady_NDCertificateFeature = ^Protection_PlayReady_NDCertificateFeature;

  // Windows.Media.Protection.PlayReady.NDProximityDetectionType
  Protection_PlayReady_NDProximityDetectionType = (
    UDP = 1,
    TCP = 2,
    TransportAgnostic = 4
  );
  PProtection_PlayReady_NDProximityDetectionType = ^Protection_PlayReady_NDProximityDetectionType;

  // Windows.Media.Protection.PlayReady.NDMediaStreamType
  Protection_PlayReady_NDMediaStreamType = (
    Audio = 1,
    Video = 2
  );
  PProtection_PlayReady_NDMediaStreamType = ^Protection_PlayReady_NDMediaStreamType;

  // Windows.Media.Protection.PlayReady.NDContentIDType
  Protection_PlayReady_NDContentIDType = (
    KeyID = 1,
    PlayReadyObject = 2,
    Custom = 3
  );
  PProtection_PlayReady_NDContentIDType = ^Protection_PlayReady_NDContentIDType;

  // Windows.Media.Protection.PlayReady.NDClosedCaptionFormat
  Protection_PlayReady_NDClosedCaptionFormat = (
    ATSC = 0,
    SCTE20 = 1,
    Unknown = 2
  );
  PProtection_PlayReady_NDClosedCaptionFormat = ^Protection_PlayReady_NDClosedCaptionFormat;

  // Windows.Media.Protection.PlayReady.NDStartAsyncOptions
  Protection_PlayReady_NDStartAsyncOptions = (
    MutualAuthentication = 1,
    WaitForLicenseDescriptor = 2
  );
  PProtection_PlayReady_NDStartAsyncOptions = ^Protection_PlayReady_NDStartAsyncOptions;

  // Windows.Media.SpeechRecognition.SpeechRecognitionConstraintProbability
  SpeechRecognition_SpeechRecognitionConstraintProbability = (
    Default = 0,
    Min = 1,
    Max = 2
  );
  PSpeechRecognition_SpeechRecognitionConstraintProbability = ^SpeechRecognition_SpeechRecognitionConstraintProbability;

  // Windows.Media.SpeechRecognition.SpeechRecognitionConfidence
  SpeechRecognition_SpeechRecognitionConfidence = (
    High = 0,
    Medium = 1,
    Low = 2,
    Rejected = 3
  );
  PSpeechRecognition_SpeechRecognitionConfidence = ^SpeechRecognition_SpeechRecognitionConfidence;

  // Windows.Media.SpeechRecognition.SpeechRecognitionScenario
  SpeechRecognition_SpeechRecognitionScenario = (
    WebSearch = 0,
    Dictation = 1,
    FormFilling = 2
  );
  PSpeechRecognition_SpeechRecognitionScenario = ^SpeechRecognition_SpeechRecognitionScenario;

  // Windows.Media.SpeechRecognition.SpeechRecognitionConstraintType
  SpeechRecognition_SpeechRecognitionConstraintType = (
    Topic = 0,
    List = 1,
    Grammar = 2,
    VoiceCommandDefinition = 3
  );
  PSpeechRecognition_SpeechRecognitionConstraintType = ^SpeechRecognition_SpeechRecognitionConstraintType;

  // Windows.Media.SpeechRecognition.SpeechRecognizerState
  SpeechRecognition_SpeechRecognizerState = (
    Idle = 0,
    Capturing = 1,
    Processing = 2,
    SoundStarted = 3,
    SoundEnded = 4,
    SpeechDetected = 5,
    Paused = 6
  );
  PSpeechRecognition_SpeechRecognizerState = ^SpeechRecognition_SpeechRecognizerState;

  // Windows.Media.SpeechRecognition.SpeechRecognitionAudioProblem
  SpeechRecognition_SpeechRecognitionAudioProblem = (
    None = 0,
    TooNoisy = 1,
    NoSignal = 2,
    TooLoud = 3,
    TooQuiet = 4,
    TooFast = 5,
    TooSlow = 6
  );
  PSpeechRecognition_SpeechRecognitionAudioProblem = ^SpeechRecognition_SpeechRecognitionAudioProblem;

  // Windows.Media.SpeechRecognition.SpeechRecognitionResultStatus
  SpeechRecognition_SpeechRecognitionResultStatus = (
    Success = 0,
    TopicLanguageNotSupported = 1,
    GrammarLanguageMismatch = 2,
    GrammarCompilationFailure = 3,
    AudioQualityFailure = 4,
    UserCanceled = 5,
    Unknown = 6,
    TimeoutExceeded = 7,
    PauseLimitExceeded = 8,
    NetworkFailure = 9,
    MicrophoneUnavailable = 10
  );
  PSpeechRecognition_SpeechRecognitionResultStatus = ^SpeechRecognition_SpeechRecognitionResultStatus;

  // Windows.Media.SpeechRecognition.SpeechContinuousRecognitionMode
  SpeechRecognition_SpeechContinuousRecognitionMode = (
    Default = 0,
    PauseOnRecognition = 1
  );
  PSpeechRecognition_SpeechContinuousRecognitionMode = ^SpeechRecognition_SpeechContinuousRecognitionMode;

  // Windows.Media.SpeechSynthesis.VoiceGender
  SpeechSynthesis_VoiceGender = (
    Male = 0,
    Female = 1
  );
  PSpeechSynthesis_VoiceGender = ^SpeechSynthesis_VoiceGender;

  // Windows.Media.MediaPlaybackType
  MediaPlaybackType = (
    Unknown = 0,
    Music = 1,
    Video = 2,
    Image = 3
  );
  PMediaPlaybackType = ^MediaPlaybackType;

  // Windows.Media.MediaPlaybackAutoRepeatMode
  MediaPlaybackAutoRepeatMode = (
    None = 0,
    Track = 1,
    List = 2
  );
  PMediaPlaybackAutoRepeatMode = ^MediaPlaybackAutoRepeatMode;

  // Windows.Media.MediaPlaybackStatus
  MediaPlaybackStatus = (
    Closed = 0,
    Changing = 1,
    Stopped = 2,
    Playing = 3,
    Paused = 4
  );
  PMediaPlaybackStatus = ^MediaPlaybackStatus;

  // Windows.Media.SystemMediaTransportControlsButton
  SystemMediaTransportControlsButton = (
    Play = 0,
    Pause = 1,
    Stop = 2,
    &Record = 3,
    FastForward = 4,
    Rewind = 5,
    Next = 6,
    Previous = 7,
    ChannelUp = 8,
    ChannelDown = 9
  );
  PSystemMediaTransportControlsButton = ^SystemMediaTransportControlsButton;

  // Windows.Media.SystemMediaTransportControlsProperty
  SystemMediaTransportControlsProperty = (
    SoundLevel = 0
  );
  PSystemMediaTransportControlsProperty = ^SystemMediaTransportControlsProperty;

  // Windows.Media.MediaTimelineControllerState
  MediaTimelineControllerState = (
    Paused = 0,
    Running = 1,
    Stalled = 2,
    Error = 3
  );
  PMediaTimelineControllerState = ^MediaTimelineControllerState;

  // Windows.Media.AudioProcessing
  AudioProcessing = (
    Default = 0,
    Raw = 1
  );
  PAudioProcessing = ^AudioProcessing;

  // Windows.Media.Capture.MediaStreamType
  Capture_MediaStreamType = (
    VideoPreview = 0,
    VideoRecord = 1,
    Audio = 2,
    Photo = 3
  );
  PCapture_MediaStreamType = ^Capture_MediaStreamType;

  // Windows.Media.Capture.PowerlineFrequency
  Capture_PowerlineFrequency = (
    Disabled = 0,
    FiftyHertz = 1,
    SixtyHertz = 2,
    Auto = 3
  );
  PCapture_PowerlineFrequency = ^Capture_PowerlineFrequency;

  // Windows.Media.Transcoding.MediaVideoProcessingAlgorithm
  Transcoding_MediaVideoProcessingAlgorithm = (
    Default = 0,
    MrfCrf444 = 1
  );
  PTranscoding_MediaVideoProcessingAlgorithm = ^Transcoding_MediaVideoProcessingAlgorithm;

  // Windows.Media.Effects.MediaMemoryTypes
  Effects_MediaMemoryTypes = (
    Gpu = 0,
    Cpu = 1,
    GpuAndCpu = 2
  );
  PEffects_MediaMemoryTypes = ^Effects_MediaMemoryTypes;

  // Windows.Media.Effects.MediaEffectClosedReason
  Effects_MediaEffectClosedReason = (
    Done = 0,
    UnknownError = 1,
    UnsupportedEncodingFormat = 2,
    EffectCurrentlyUnloaded = 3
  );
  PEffects_MediaEffectClosedReason = ^Effects_MediaEffectClosedReason;

  // Windows.Media.Protection.RevocationAndRenewalReasons
  Protection_RevocationAndRenewalReasons = (
    UserModeComponentLoad = 1,
    KernelModeComponentLoad = 2,
    AppComponent = 4,
    GlobalRevocationListLoadFailed = 16,
    InvalidGlobalRevocationListSignature = 32,
    GlobalRevocationListAbsent = 4096,
    ComponentRevoked = 8192,
    InvalidComponentCertificateExtendedKeyUse = 16384,
    ComponentCertificateRevoked = 32768,
    InvalidComponentCertificateRoot = 65536,
    ComponentHighSecurityCertificateRevoked = 131072,
    ComponentLowSecurityCertificateRevoked = 262144,
    BootDriverVerificationFailed = 1048576,
    ComponentSignedWithTestCertificate = 16777216,
    EncryptionFailure = 268435456
  );
  PProtection_RevocationAndRenewalReasons = ^Protection_RevocationAndRenewalReasons;

  // Windows.Media.Protection.GraphicsTrustStatus
  Protection_GraphicsTrustStatus = (
    TrustNotRequired = 0,
    TrustEstablished = 1,
    EnvironmentNotSupported = 2,
    DriverNotSupported = 3,
    DriverSigningFailure = 4,
    UnknownFailure = 5
  );
  PProtection_GraphicsTrustStatus = ^Protection_GraphicsTrustStatus;

  // Windows.Media.Protection.ProtectionCapabilityResult
  Protection_ProtectionCapabilityResult = (
    NotSupported = 0,
    Maybe = 1,
    Probably = 2
  );
  PProtection_ProtectionCapabilityResult = ^Protection_ProtectionCapabilityResult;

  // Windows.Media.Protection.HdcpProtection
  Protection_HdcpProtection = (
    Off = 0,
    On = 1,
    OnWithTypeEnforcement = 2
  );
  PProtection_HdcpProtection = ^Protection_HdcpProtection;

  // Windows.Media.Protection.HdcpSetProtectionResult
  Protection_HdcpSetProtectionResult = (
    Success = 0,
    TimedOut = 1,
    NotSupported = 2,
    UnknownFailure = 3
  );
  PProtection_HdcpSetProtectionResult = ^Protection_HdcpSetProtectionResult;

  // Windows.Media.Core.MediaStreamSourceClosedReason
  Core_MediaStreamSourceClosedReason = (
    Done = 0,
    UnknownError = 1,
    AppReportedError = 2,
    UnsupportedProtectionSystem = 3,
    ProtectionSystemFailure = 4,
    UnsupportedEncodingFormat = 5,
    MissingSampleRequestedEventHandler = 6
  );
  PCore_MediaStreamSourceClosedReason = ^Core_MediaStreamSourceClosedReason;

  // Windows.Media.Core.MediaStreamSourceErrorStatus
  Core_MediaStreamSourceErrorStatus = (
    Other = 0,
    OutOfMemory = 1,
    FailedToOpenFile = 2,
    FailedToConnectToServer = 3,
    ConnectionToServerLost = 4,
    UnspecifiedNetworkError = 5,
    DecodeError = 6,
    UnsupportedMediaFormat = 7
  );
  PCore_MediaStreamSourceErrorStatus = ^Core_MediaStreamSourceErrorStatus;

  // Windows.Media.Core.MseReadyState
  Core_MseReadyState = (
    Closed = 0,
    Open = 1,
    Ended = 2
  );
  PCore_MseReadyState = ^Core_MseReadyState;

  // Windows.Media.Core.MseEndOfStreamStatus
  Core_MseEndOfStreamStatus = (
    Success = 0,
    NetworkError = 1,
    DecodeError = 2,
    UnknownError = 3
  );
  PCore_MseEndOfStreamStatus = ^Core_MseEndOfStreamStatus;

  // Windows.Media.Core.MseAppendMode
  Core_MseAppendMode = (
    Segments = 0,
    Sequence = 1
  );
  PCore_MseAppendMode = ^Core_MseAppendMode;

  // Windows.Media.Transcoding.TranscodeFailureReason
  Transcoding_TranscodeFailureReason = (
    None = 0,
    Unknown = 1,
    InvalidProfile = 2,
    CodecNotFound = 3
  );
  PTranscoding_TranscodeFailureReason = ^Transcoding_TranscodeFailureReason;

  // Windows.Media.Core.SceneAnalysisRecommendation
  Core_SceneAnalysisRecommendation = (
    Standard = 0,
    Hdr = 1,
    LowLight = 2
  );
  PCore_SceneAnalysisRecommendation = ^Core_SceneAnalysisRecommendation;

  // Windows.Media.Core.FaceDetectionMode
  Core_FaceDetectionMode = (
    HighPerformance = 0,
    Balanced = 1,
    HighQuality = 2
  );
  PCore_FaceDetectionMode = ^Core_FaceDetectionMode;

  // Windows.Media.Core.VideoStabilizationEffectEnabledChangedReason
  Core_VideoStabilizationEffectEnabledChangedReason = (
    Programmatic = 0,
    PixelRateTooHigh = 1,
    RunningSlowly = 2
  );
  PCore_VideoStabilizationEffectEnabledChangedReason = ^Core_VideoStabilizationEffectEnabledChangedReason;

  // Windows.Media.ClosedCaptioning.ClosedCaptionStyle
  ClosedCaptioning_ClosedCaptionStyle = (
    Default = 0,
    MonospacedWithSerifs = 1,
    ProportionalWithSerifs = 2,
    MonospacedWithoutSerifs = 3,
    ProportionalWithoutSerifs = 4,
    Casual = 5,
    Cursive = 6,
    SmallCapitals = 7
  );
  PClosedCaptioning_ClosedCaptionStyle = ^ClosedCaptioning_ClosedCaptionStyle;

  // Windows.Media.ClosedCaptioning.ClosedCaptionEdgeEffect
  ClosedCaptioning_ClosedCaptionEdgeEffect = (
    Default = 0,
    None = 1,
    Raised = 2,
    Depressed = 3,
    Uniform = 4,
    DropShadow = 5
  );
  PClosedCaptioning_ClosedCaptionEdgeEffect = ^ClosedCaptioning_ClosedCaptionEdgeEffect;

  // Windows.Media.ClosedCaptioning.ClosedCaptionOpacity
  ClosedCaptioning_ClosedCaptionOpacity = (
    Default = 0,
    OneHundredPercent = 1,
    SeventyFivePercent = 2,
    TwentyFivePercent = 3,
    ZeroPercent = 4
  );
  PClosedCaptioning_ClosedCaptionOpacity = ^ClosedCaptioning_ClosedCaptionOpacity;

  // Windows.Media.ClosedCaptioning.ClosedCaptionColor
  ClosedCaptioning_ClosedCaptionColor = (
    Default = 0,
    White = 1,
    Black = 2,
    Red = 3,
    Green = 4,
    Blue = 5,
    Yellow = 6,
    Magenta = 7,
    Cyan = 8
  );
  PClosedCaptioning_ClosedCaptionColor = ^ClosedCaptioning_ClosedCaptionColor;

  // Windows.Media.ClosedCaptioning.ClosedCaptionSize
  ClosedCaptioning_ClosedCaptionSize = (
    Default = 0,
    FiftyPercent = 1,
    OneHundredPercent = 2,
    OneHundredFiftyPercent = 3,
    TwoHundredPercent = 4
  );
  PClosedCaptioning_ClosedCaptionSize = ^ClosedCaptioning_ClosedCaptionSize;

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCreationStatus
  Streaming_Adaptive_AdaptiveMediaSourceCreationStatus = (
    Success = 0,
    ManifestDownloadFailure = 1,
    ManifestParseFailure = 2,
    UnsupportedManifestContentType = 3,
    UnsupportedManifestVersion = 4,
    UnsupportedManifestProfile = 5,
    UnknownFailure = 6
  );
  PStreaming_Adaptive_AdaptiveMediaSourceCreationStatus = ^Streaming_Adaptive_AdaptiveMediaSourceCreationStatus;

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedReason
  Streaming_Adaptive_AdaptiveMediaSourceDownloadBitrateChangedReason = (
    SufficientInboundBitsPerSecond = 0,
    InsufficientInboundBitsPerSecond = 1,
    LowBufferLevel = 2,
    PositionChanged = 3,
    TrackSelectionChanged = 4,
    DesiredBitratesChanged = 5,
    ErrorInPreviousBitrate = 6
  );
  PStreaming_Adaptive_AdaptiveMediaSourceDownloadBitrateChangedReason = ^Streaming_Adaptive_AdaptiveMediaSourceDownloadBitrateChangedReason;

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
  Streaming_Adaptive_AdaptiveMediaSourceResourceType = (
    Manifest = 0,
    InitializationSegment = 1,
    MediaSegment = 2,
    Key = 3,
    InitializationVector = 4
  );
  PStreaming_Adaptive_AdaptiveMediaSourceResourceType = ^Streaming_Adaptive_AdaptiveMediaSourceResourceType;

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnosticType
  Streaming_Adaptive_AdaptiveMediaSourceDiagnosticType = (
    ManifestUnchangedUponReload = 0,
    ManifestMismatchUponReload = 1,
    ManifestSignaledEndOfLiveEventUponReload = 2,
    MediaSegmentSkipped = 3,
    ResourceNotFound = 4,
    ResourceTimedOut = 5,
    ResourceParsingError = 6,
    BitrateDisabled = 7,
    FatalMediaSourceError = 8
  );
  PStreaming_Adaptive_AdaptiveMediaSourceDiagnosticType = ^Streaming_Adaptive_AdaptiveMediaSourceDiagnosticType;

  // Windows.Media.Core.MediaTrackKind
  Core_MediaTrackKind = (
    Audio = 0,
    Video = 1,
    TimedMetadata = 2
  );
  PCore_MediaTrackKind = ^Core_MediaTrackKind;

  // Windows.Media.Core.TimedMetadataKind
  Core_TimedMetadataKind = (
    Caption = 0,
    Chapter = 1,
    Custom = 2,
    Data = 3,
    Description = 4,
    Subtitle = 5,
    ImageSubtitle = 6,
    Speech = 7
  );
  PCore_TimedMetadataKind = ^Core_TimedMetadataKind;

  // Windows.Media.Core.TimedMetadataTrackErrorCode
  Core_TimedMetadataTrackErrorCode = (
    None = 0,
    DataFormatError = 1,
    NetworkError = 2,
    InternalError = 3
  );
  PCore_TimedMetadataTrackErrorCode = ^Core_TimedMetadataTrackErrorCode;

  // Windows.Media.Core.MediaDecoderStatus
  Core_MediaDecoderStatus = (
    FullySupported = 0,
    UnsupportedSubtype = 1,
    UnsupportedEncoderProperties = 2,
    Degraded = 3
  );
  PCore_MediaDecoderStatus = ^Core_MediaDecoderStatus;

  // Windows.Media.Core.AudioDecoderDegradation
  Core_AudioDecoderDegradation = (
    None = 0,
    DownmixTo2Channels = 1,
    DownmixTo6Channels = 2,
    DownmixTo8Channels = 3
  );
  PCore_AudioDecoderDegradation = ^Core_AudioDecoderDegradation;

  // Windows.Media.Core.AudioDecoderDegradationReason
  Core_AudioDecoderDegradationReason = (
    None = 0,
    LicensingRequirement = 1,
    SpatialAudioNotSupported = 2
  );
  PCore_AudioDecoderDegradationReason = ^Core_AudioDecoderDegradationReason;

  // Windows.Media.Core.MediaSourceStatus
  Core_MediaSourceStatus = (
    FullySupported = 0,
    Unknown = 1
  );
  PCore_MediaSourceStatus = ^Core_MediaSourceStatus;

  // Windows.Media.Core.MediaSourceState
  Core_MediaSourceState = (
    Initial = 0,
    Opening = 1,
    Opened = 2,
    Failed = 3,
    Closed = 4
  );
  PCore_MediaSourceState = ^Core_MediaSourceState;

  // Windows.Media.Playback.MediaPlaybackItemErrorCode
  Playback_MediaPlaybackItemErrorCode = (
    None = 0,
    Aborted = 1,
    NetworkError = 2,
    DecodeError = 3,
    SourceNotSupportedError = 4,
    EncryptionError = 5
  );
  PPlayback_MediaPlaybackItemErrorCode = ^Playback_MediaPlaybackItemErrorCode;

  // Windows.Media.Playback.FailedMediaStreamKind
  Playback_FailedMediaStreamKind = (
    Unknown = 0,
    Audio = 1,
    Video = 2
  );
  PPlayback_FailedMediaStreamKind = ^Playback_FailedMediaStreamKind;

  // Windows.Media.Playback.TimedMetadataTrackPresentationMode
  Playback_TimedMetadataTrackPresentationMode = (
    Disabled = 0,
    Hidden = 1,
    ApplicationPresented = 2,
    PlatformPresented = 3
  );
  PPlayback_TimedMetadataTrackPresentationMode = ^Playback_TimedMetadataTrackPresentationMode;

  // Windows.Media.Playback.MediaBreakInsertionMethod
  Playback_MediaBreakInsertionMethod = (
    Interrupt = 0,
    Replace = 1
  );
  PPlayback_MediaBreakInsertionMethod = ^Playback_MediaBreakInsertionMethod;

  // Windows.Media.Playback.MediaPlaybackItemChangedReason
  Playback_MediaPlaybackItemChangedReason = (
    InitialItem = 0,
    EndOfStream = 1,
    Error = 2,
    AppRequested = 3
  );
  PPlayback_MediaPlaybackItemChangedReason = ^Playback_MediaPlaybackItemChangedReason;

  // Windows.Media.Playback.AutoLoadedDisplayPropertyKind
  Playback_AutoLoadedDisplayPropertyKind = (
    None = 0,
    MusicOrVideo = 1,
    Music = 2,
    Video = 3
  );
  PPlayback_AutoLoadedDisplayPropertyKind = ^Playback_AutoLoadedDisplayPropertyKind;

  // Windows.Media.ContentRestrictions.RatedContentCategory
  ContentRestrictions_RatedContentCategory = (
    General = 0,
    Application = 1,
    Game = 2,
    Movie = 3,
    Television = 4,
    Music = 5
  );
  PContentRestrictions_RatedContentCategory = ^ContentRestrictions_RatedContentCategory;

  // Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel
  ContentRestrictions_ContentAccessRestrictionLevel = (
    Allow = 0,
    Warn = 1,
    Block = 2,
    Hide = 3
  );
  PContentRestrictions_ContentAccessRestrictionLevel = ^ContentRestrictions_ContentAccessRestrictionLevel;

  // Windows.Media.Capture.AppCaptureMetadataPriority
  Capture_AppCaptureMetadataPriority = (
    Informational = 0,
    Important = 1
  );
  PCapture_AppCaptureMetadataPriority = ^Capture_AppCaptureMetadataPriority;

  // Windows.Media.Capture.AppBroadcastCameraOverlayLocation
  Capture_AppBroadcastCameraOverlayLocation = (
    TopLeft = 0,
    TopCenter = 1,
    TopRight = 2,
    MiddleLeft = 3,
    MiddleCenter = 4,
    MiddleRight = 5,
    BottomLeft = 6,
    BottomCenter = 7,
    BottomRight = 8
  );
  PCapture_AppBroadcastCameraOverlayLocation = ^Capture_AppBroadcastCameraOverlayLocation;

  // Windows.Media.Capture.AppBroadcastCameraOverlaySize
  Capture_AppBroadcastCameraOverlaySize = (
    Small = 0,
    Medium = 1,
    Large = 2
  );
  PCapture_AppBroadcastCameraOverlaySize = ^Capture_AppBroadcastCameraOverlaySize;

  // Windows.Media.Capture.AppBroadcastVideoEncodingBitrateMode
  Capture_AppBroadcastVideoEncodingBitrateMode = (
    Custom = 0,
    Auto = 1
  );
  PCapture_AppBroadcastVideoEncodingBitrateMode = ^Capture_AppBroadcastVideoEncodingBitrateMode;

  // Windows.Media.Capture.AppBroadcastVideoEncodingResolutionMode
  Capture_AppBroadcastVideoEncodingResolutionMode = (
    Custom = 0,
    Auto = 1
  );
  PCapture_AppBroadcastVideoEncodingResolutionMode = ^Capture_AppBroadcastVideoEncodingResolutionMode;

  // Windows.Media.Capture.AppBroadcastPlugInState
  Capture_AppBroadcastPlugInState = (
    Unknown = 0,
    Initialized = 1,
    MicrosoftSignInRequired = 2,
    OAuthSignInRequired = 3,
    ProviderSignInRequired = 4,
    InBandwidthTest = 5,
    ReadyToBroadcast = 6
  );
  PCapture_AppBroadcastPlugInState = ^Capture_AppBroadcastPlugInState;

  // Windows.Media.Capture.AppBroadcastStreamState
  Capture_AppBroadcastStreamState = (
    Initializing = 0,
    StreamReady = 1,
    Started = 2,
    Paused = 3,
    Terminated = 4
  );
  PCapture_AppBroadcastStreamState = ^Capture_AppBroadcastStreamState;

  // Windows.Media.Capture.AppBroadcastSignInState
  Capture_AppBroadcastSignInState = (
    NotSignedIn = 0,
    MicrosoftSignInInProgress = 1,
    MicrosoftSignInComplete = 2,
    OAuthSignInInProgress = 3,
    OAuthSignInComplete = 4
  );
  PCapture_AppBroadcastSignInState = ^Capture_AppBroadcastSignInState;

  // Windows.Media.Capture.AppBroadcastTerminationReason
  Capture_AppBroadcastTerminationReason = (
    NormalTermination = 0,
    LostConnectionToService = 1,
    NoNetworkConnectivity = 2,
    ServiceAbort = 3,
    ServiceError = 4,
    ServiceUnavailable = 5,
    InternalError = 6,
    UnsupportedFormat = 7,
    BackgroundTaskTerminated = 8,
    BackgroundTaskUnresponsive = 9
  );
  PCapture_AppBroadcastTerminationReason = ^Capture_AppBroadcastTerminationReason;

  // Windows.Media.Capture.AppBroadcastSignInResult
  Capture_AppBroadcastSignInResult = (
    Success = 0,
    AuthenticationFailed = 1,
    Unauthorized = 2,
    ServiceUnavailable = 3,
    Unknown = 4
  );
  PCapture_AppBroadcastSignInResult = ^Capture_AppBroadcastSignInResult;

  // Windows.Media.Capture.ForegroundActivationArgument
  Capture_ForegroundActivationArgument = (
    SignInRequired = 0,
    MoreSettings = 1
  );
  PCapture_ForegroundActivationArgument = ^Capture_ForegroundActivationArgument;

  // Windows.Media.Capture.AppBroadcastMicrophoneCaptureState
  Capture_AppBroadcastMicrophoneCaptureState = (
    Stopped = 0,
    Started = 1,
    Failed = 2
  );
  PCapture_AppBroadcastMicrophoneCaptureState = ^Capture_AppBroadcastMicrophoneCaptureState;

  // Windows.Media.Capture.AppBroadcastCameraCaptureState
  Capture_AppBroadcastCameraCaptureState = (
    Stopped = 0,
    Started = 1,
    Failed = 2
  );
  PCapture_AppBroadcastCameraCaptureState = ^Capture_AppBroadcastCameraCaptureState;

  // Windows.Media.Capture.AppBroadcastExitBroadcastModeReason
  Capture_AppBroadcastExitBroadcastModeReason = (
    NormalExit = 0,
    UserCanceled = 1,
    AuthorizationFail = 2,
    ForegroundAppActivated = 3
  );
  PCapture_AppBroadcastExitBroadcastModeReason = ^Capture_AppBroadcastExitBroadcastModeReason;

  // Windows.Media.Capture.AppBroadcastPreviewState
  Capture_AppBroadcastPreviewState = (
    Started = 0,
    Stopped = 1,
    Failed = 2
  );
  PCapture_AppBroadcastPreviewState = ^Capture_AppBroadcastPreviewState;

  // Windows.Media.Capture.AppBroadcastCaptureTargetType
  Capture_AppBroadcastCaptureTargetType = (
    AppView = 0,
    EntireDisplay = 1
  );
  PCapture_AppBroadcastCaptureTargetType = ^Capture_AppBroadcastCaptureTargetType;

  // Windows.Media.Capture.GameBarServicesDisplayMode
  Capture_GameBarServicesDisplayMode = (
    Windowed = 0,
    FullScreenExclusive = 1
  );
  PCapture_GameBarServicesDisplayMode = ^Capture_GameBarServicesDisplayMode;

  // Windows.Media.Capture.GameBarCommand
  Capture_GameBarCommand = (
    OpenGameBar = 0,
    RecordHistoricalBuffer = 1,
    ToggleStartStopRecord = 2,
    StartRecord = 3,
    StopRecord = 4,
    TakeScreenshot = 5,
    StartBroadcast = 6,
    StopBroadcast = 7,
    PauseBroadcast = 8,
    ResumeBroadcast = 9,
    ToggleStartStopBroadcast = 10,
    ToggleMicrophoneCapture = 11,
    ToggleCameraCapture = 12,
    ToggleRecordingIndicator = 13
  );
  PCapture_GameBarCommand = ^Capture_GameBarCommand;

  // Windows.Media.Capture.GameBarCommandOrigin
  Capture_GameBarCommandOrigin = (
    ShortcutKey = 0,
    Cortana = 1,
    AppCommand = 2
  );
  PCapture_GameBarCommandOrigin = ^Capture_GameBarCommandOrigin;

  // Windows.Media.Capture.GameBarTargetCapturePolicy
  Capture_GameBarTargetCapturePolicy = (
    EnabledBySystem = 0,
    EnabledByUser = 1,
    NotEnabled = 2,
    ProhibitedBySystem = 3,
    ProhibitedByPublisher = 4
  );
  PCapture_GameBarTargetCapturePolicy = ^Capture_GameBarTargetCapturePolicy;

  // Windows.Media.Playlists.PlaylistFormat
  Playlists_PlaylistFormat = (
    WindowsMedia = 0,
    Zune = 1,
    M3u = 2
  );
  PPlaylists_PlaylistFormat = ^Playlists_PlaylistFormat;

  // Windows.Media.Protection.RenewalStatus
  Protection_RenewalStatus = (
    NotStarted = 0,
    UpdatesInProgress = 1,
    UserCancelled = 2,
    AppComponentsMayNeedUpdating = 3,
    NoComponentsFound = 4
  );
  PProtection_RenewalStatus = ^Protection_RenewalStatus;

  // Windows.Media.Devices.AudioDeviceRole
  AudioDeviceRole = (
    Default = 0,
    Communications = 1
  );
  PAudioDeviceRole = ^AudioDeviceRole;

  // Windows.Media.Devices.SendCommandStatus
  SendCommandStatus = (
    Success = 0,
    DeviceNotAvailable = 1
  );
  PSendCommandStatus = ^SendCommandStatus;

  // Windows.Media.Devices.IsoSpeedPreset
  IsoSpeedPreset = (
    Auto = 0,
    Iso50 = 1,
    Iso80 = 2,
    Iso100 = 3,
    Iso200 = 4,
    Iso400 = 5,
    Iso800 = 6,
    Iso1600 = 7,
    Iso3200 = 8,
    Iso6400 = 9,
    Iso12800 = 10,
    Iso25600 = 11
  );
  PIsoSpeedPreset = ^IsoSpeedPreset;

  // Windows.Media.Devices.CaptureSceneMode
  CaptureSceneMode = (
    Auto = 0,
    Manual = 1,
    Macro = 2,
    Portrait = 3,
    Sport = 4,
    Snow = 5,
    Night = 6,
    Beach = 7,
    Sunset = 8,
    Candlelight = 9,
    Landscape = 10,
    NightPortrait = 11,
    Backlit = 12
  );
  PCaptureSceneMode = ^CaptureSceneMode;

  // Windows.Media.Devices.MediaCaptureFocusState
  MediaCaptureFocusState = (
    Uninitialized = 0,
    Lost = 1,
    Searching = 2,
    Focused = 3,
    Failed = 4
  );
  PMediaCaptureFocusState = ^MediaCaptureFocusState;

  // Windows.Media.Devices.CameraStreamState
  CameraStreamState = (
    NotStreaming = 0,
    Streaming = 1,
    BlockedForPrivacy = 2,
    Shutdown = 3
  );
  PCameraStreamState = ^CameraStreamState;

  // Windows.Media.Devices.MediaCapturePauseBehavior
  MediaCapturePauseBehavior = (
    RetainHardwareResources = 0,
    ReleaseHardwareResources = 1
  );
  PMediaCapturePauseBehavior = ^MediaCapturePauseBehavior;

  // Windows.Media.Devices.AdvancedPhotoMode
  AdvancedPhotoMode = (
    Auto = 0,
    Standard = 1,
    Hdr = 2,
    LowLight = 3
  );
  PAdvancedPhotoMode = ^AdvancedPhotoMode;

  // Windows.Media.Devices.ColorTemperaturePreset
  ColorTemperaturePreset = (
    Auto = 0,
    Manual = 1,
    Cloudy = 2,
    Daylight = 3,
    Flash = 4,
    Fluorescent = 5,
    Tungsten = 6,
    Candlelight = 7
  );
  PColorTemperaturePreset = ^ColorTemperaturePreset;

  // Windows.Media.Devices.ZoomTransitionMode
  ZoomTransitionMode = (
    Auto = 0,
    Direct = 1,
    Smooth = 2
  );
  PZoomTransitionMode = ^ZoomTransitionMode;

  // Windows.Media.Devices.FocusPreset
  FocusPreset = (
    Auto = 0,
    Manual = 1,
    AutoMacro = 2,
    AutoNormal = 3,
    AutoInfinity = 4,
    AutoHyperfocal = 5
  );
  PFocusPreset = ^FocusPreset;

  // Windows.Media.Devices.FocusMode
  FocusMode = (
    Auto = 0,
    Single = 1,
    Continuous = 2,
    Manual = 3
  );
  PFocusMode = ^FocusMode;

  // Windows.Media.Devices.ManualFocusDistance
  ManualFocusDistance = (
    Infinity = 0,
    Hyperfocal = 1,
    Nearest = 2
  );
  PManualFocusDistance = ^ManualFocusDistance;

  // Windows.Media.Devices.AutoFocusRange
  AutoFocusRange = (
    FullRange = 0,
    Macro = 1,
    Normal = 2
  );
  PAutoFocusRange = ^AutoFocusRange;

  // Windows.Media.Devices.RegionOfInterestType
  RegionOfInterestType = (
    Unknown = 0,
    Face = 1
  );
  PRegionOfInterestType = ^RegionOfInterestType;

  // Windows.Media.Devices.HdrVideoMode
  HdrVideoMode = (
    Off = 0,
    On = 1,
    Auto = 2
  );
  PHdrVideoMode = ^HdrVideoMode;

  // Windows.Media.Devices.OpticalImageStabilizationMode
  OpticalImageStabilizationMode = (
    Off = 0,
    On = 1,
    Auto = 2
  );
  POpticalImageStabilizationMode = ^OpticalImageStabilizationMode;

  // Windows.Media.Devices.CaptureUse
  CaptureUse = (
    None = 0,
    Photo = 1,
    Video = 2
  );
  PCaptureUse = ^CaptureUse;

  // Windows.Media.Devices.MediaCaptureOptimization
  MediaCaptureOptimization = (
    Default = 0,
    Quality = 1,
    Latency = 2,
    Power = 3,
    LatencyThenQuality = 4,
    LatencyThenPower = 5,
    PowerAndQuality = 6
  );
  PMediaCaptureOptimization = ^MediaCaptureOptimization;

  // Windows.Media.Devices.VideoDeviceControllerSetDevicePropertyStatus
  VideoDeviceControllerSetDevicePropertyStatus = (
    Success = 0,
    UnknownFailure = 1,
    NotSupported = 2,
    InvalidValue = 3,
    DeviceNotAvailable = 4,
    NotInControl = 5
  );
  PVideoDeviceControllerSetDevicePropertyStatus = ^VideoDeviceControllerSetDevicePropertyStatus;

  // Windows.Media.Devices.VideoDeviceControllerGetDevicePropertyStatus
  VideoDeviceControllerGetDevicePropertyStatus = (
    Success = 0,
    UnknownFailure = 1,
    BufferTooSmall = 2,
    NotSupported = 3,
    DeviceNotAvailable = 4,
    MaxPropertyValueSizeTooSmall = 5,
    MaxPropertyValueSizeRequired = 6
  );
  PVideoDeviceControllerGetDevicePropertyStatus = ^VideoDeviceControllerGetDevicePropertyStatus;

  // Windows.Media.Devices.Core.FrameFlashMode
  Core_FrameFlashMode = (
    Disable = 0,
    Enable = 1,
    Global = 2
  );
  PCore_FrameFlashMode = ^Core_FrameFlashMode;

  // Windows.Media.Devices.TelephonyKey
  TelephonyKey = (
    D0 = 0,
    D1 = 1,
    D2 = 2,
    D3 = 3,
    D4 = 4,
    D5 = 5,
    D6 = 6,
    D7 = 7,
    D8 = 8,
    D9 = 9,
    Star = 10,
    Pound = 11,
    A = 12,
    B = 13,
    C = 14,
    D = 15
  );
  PTelephonyKey = ^TelephonyKey;

  // Windows.Media.MediaProperties.StereoscopicVideoPackingMode
  StereoscopicVideoPackingMode = (
    None = 0,
    SideBySide = 1,
    TopBottom = 2
  );
  PStereoscopicVideoPackingMode = ^StereoscopicVideoPackingMode;

  // Windows.Media.MediaProperties.SphericalVideoFrameFormat
  SphericalVideoFrameFormat = (
    None = 0,
    Unsupported = 1,
    Equirectangular = 2
  );
  PSphericalVideoFrameFormat = ^SphericalVideoFrameFormat;

  // Windows.Media.MediaProperties.MediaPixelFormat
  MediaPixelFormat = (
    Nv12 = 0,
    Bgra8 = 1
  );
  PMediaPixelFormat = ^MediaPixelFormat;

  // Windows.Media.MediaProperties.MediaThumbnailFormat
  MediaThumbnailFormat = (
    Bmp = 0,
    Bgra8 = 1
  );
  PMediaThumbnailFormat = ^MediaThumbnailFormat;

  // Windows.Media.MediaProperties.AudioEncodingQuality
  AudioEncodingQuality = (
    Auto = 0,
    High = 1,
    Medium = 2,
    Low = 3
  );
  PAudioEncodingQuality = ^AudioEncodingQuality;

  // Windows.Media.MediaProperties.VideoEncodingQuality
  VideoEncodingQuality = (
    Auto = 0,
    HD1080p = 1,
    HD720p = 2,
    Wvga = 3,
    Ntsc = 4,
    Pal = 5,
    Vga = 6,
    Qvga = 7,
    Uhd2160p = 8,
    Uhd4320p = 9
  );
  PVideoEncodingQuality = ^VideoEncodingQuality;

  // Windows.Media.MediaProperties.MediaRotation
  MediaRotation = (
    None = 0,
    Clockwise90Degrees = 1,
    Clockwise180Degrees = 2,
    Clockwise270Degrees = 3
  );
  PMediaRotation = ^MediaRotation;

  // Windows.Media.MediaProperties.MediaMirroringOptions
  MediaMirroringOptions = (
    None = 0,
    Horizontal = 1,
    Vertical = 2
  );
  PMediaMirroringOptions = ^MediaMirroringOptions;

  // Windows.Networking.HostNameSortOptions
  HostNameSortOptions = (
    None = 0,
    OptimizeForLongConnections = 2
  );
  PHostNameSortOptions = ^HostNameSortOptions;

  // Windows.Networking.HostNameType
  HostNameType = (
    DomainName = 0,
    Ipv4 = 1,
    Ipv6 = 2,
    Bluetooth = 3
  );
  PHostNameType = ^HostNameType;

  // Windows.Networking.DomainNameType
  DomainNameType = (
    Suffix = 0,
    FullyQualified = 1
  );
  PDomainNameType = ^DomainNameType;

  // Windows.Networking.BackgroundTransfer.BackgroundTransferStatus
  BackgroundTransfer_BackgroundTransferStatus = (
    Idle = 0,
    Running = 1,
    PausedByApplication = 2,
    PausedCostedNetwork = 3,
    PausedNoNetwork = 4,
    Completed = 5,
    Canceled = 6,
    Error = 7,
    PausedRecoverableWebErrorStatus = 8,
    PausedSystemPolicy = 32
  );
  PBackgroundTransfer_BackgroundTransferStatus = ^BackgroundTransfer_BackgroundTransferStatus;

  // Windows.Networking.BackgroundTransfer.BackgroundTransferCostPolicy
  BackgroundTransfer_BackgroundTransferCostPolicy = (
    Default = 0,
    UnrestrictedOnly = 1,
    Always = 2
  );
  PBackgroundTransfer_BackgroundTransferCostPolicy = ^BackgroundTransfer_BackgroundTransferCostPolicy;

  // Windows.Networking.BackgroundTransfer.BackgroundTransferPriority
  BackgroundTransfer_BackgroundTransferPriority = (
    Default = 0,
    High = 1
  );
  PBackgroundTransfer_BackgroundTransferPriority = ^BackgroundTransfer_BackgroundTransferPriority;

  // Windows.Networking.BackgroundTransfer.BackgroundTransferBehavior
  BackgroundTransfer_BackgroundTransferBehavior = (
    Parallel = 0,
    Serialized = 1
  );
  PBackgroundTransfer_BackgroundTransferBehavior = ^BackgroundTransfer_BackgroundTransferBehavior;

  // Windows.Networking.ServiceDiscovery.Dnssd.DnssdRegistrationStatus
  ServiceDiscovery_Dnssd_DnssdRegistrationStatus = (
    Success = 0,
    InvalidServiceName = 1,
    ServerError = 2,
    SecurityError = 3
  );
  PServiceDiscovery_Dnssd_DnssdRegistrationStatus = ^ServiceDiscovery_Dnssd_DnssdRegistrationStatus;

  // Windows.Networking.ServiceDiscovery.Dnssd.DnssdServiceWatcherStatus
  ServiceDiscovery_Dnssd_DnssdServiceWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PServiceDiscovery_Dnssd_DnssdServiceWatcherStatus = ^ServiceDiscovery_Dnssd_DnssdServiceWatcherStatus;

  // Windows.Networking.XboxLive.XboxLiveNetworkAccessKind
  XboxLive_XboxLiveNetworkAccessKind = (
    Open = 0,
    Moderate = 1,
    Strict = 2
  );
  PXboxLive_XboxLiveNetworkAccessKind = ^XboxLive_XboxLiveNetworkAccessKind;

  // Windows.Networking.XboxLive.XboxLiveSocketKind
  XboxLive_XboxLiveSocketKind = (
    None = 0,
    Datagram = 1,
    Stream = 2
  );
  PXboxLive_XboxLiveSocketKind = ^XboxLive_XboxLiveSocketKind;

  // Windows.Networking.XboxLive.XboxLiveEndpointPairCreationBehaviors
  XboxLive_XboxLiveEndpointPairCreationBehaviors = (
    None = 0,
    ReevaluatePath = 1
  );
  PXboxLive_XboxLiveEndpointPairCreationBehaviors = ^XboxLive_XboxLiveEndpointPairCreationBehaviors;

  // Windows.Networking.XboxLive.XboxLiveEndpointPairCreationStatus
  XboxLive_XboxLiveEndpointPairCreationStatus = (
    Succeeded = 0,
    NoLocalNetworks = 1,
    NoCompatibleNetworkPaths = 2,
    LocalSystemNotAuthorized = 3,
    Canceled = 4,
    TimedOut = 5,
    RemoteSystemNotAuthorized = 6,
    RefusedDueToConfiguration = 7,
    UnexpectedInternalError = 8
  );
  PXboxLive_XboxLiveEndpointPairCreationStatus = ^XboxLive_XboxLiveEndpointPairCreationStatus;

  // Windows.Networking.XboxLive.XboxLiveEndpointPairState
  XboxLive_XboxLiveEndpointPairState = (
    Invalid = 0,
    CreatingOutbound = 1,
    CreatingInbound = 2,
    Ready = 3,
    DeletingLocally = 4,
    RemoteEndpointTerminating = 5,
    Deleted = 6
  );
  PXboxLive_XboxLiveEndpointPairState = ^XboxLive_XboxLiveEndpointPairState;

  // Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
  XboxLive_XboxLiveQualityOfServiceMetric = (
    AverageLatencyInMilliseconds = 0,
    MinLatencyInMilliseconds = 1,
    MaxLatencyInMilliseconds = 2,
    AverageOutboundBitsPerSecond = 3,
    MinOutboundBitsPerSecond = 4,
    MaxOutboundBitsPerSecond = 5,
    AverageInboundBitsPerSecond = 6,
    MinInboundBitsPerSecond = 7,
    MaxInboundBitsPerSecond = 8
  );
  PXboxLive_XboxLiveQualityOfServiceMetric = ^XboxLive_XboxLiveQualityOfServiceMetric;

  // Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurementStatus
  XboxLive_XboxLiveQualityOfServiceMeasurementStatus = (
    NotStarted = 0,
    InProgress = 1,
    InProgressWithProvisionalResults = 2,
    Succeeded = 3,
    NoLocalNetworks = 4,
    NoCompatibleNetworkPaths = 5,
    LocalSystemNotAuthorized = 6,
    Canceled = 7,
    TimedOut = 8,
    RemoteSystemNotAuthorized = 9,
    RefusedDueToConfiguration = 10,
    UnexpectedInternalError = 11
  );
  PXboxLive_XboxLiveQualityOfServiceMeasurementStatus = ^XboxLive_XboxLiveQualityOfServiceMeasurementStatus;

  // Windows.Networking.Connectivity.NetworkCostType
  NetworkCostType = (
    Unknown = 0,
    Unrestricted = 1,
    Fixed = 2,
    Variable = 3
  );
  PNetworkCostType = ^NetworkCostType;

  // Windows.Networking.Connectivity.NetworkConnectivityLevel
  NetworkConnectivityLevel = (
    None = 0,
    LocalAccess = 1,
    ConstrainedInternetAccess = 2,
    InternetAccess = 3
  );
  PNetworkConnectivityLevel = ^NetworkConnectivityLevel;

  // Windows.Networking.Connectivity.NetworkTypes
  NetworkTypes = (
    None = 0,
    Internet = 1,
    PrivateNetwork = 2
  );
  PNetworkTypes = ^NetworkTypes;

  // Windows.Networking.Connectivity.RoamingStates
  RoamingStates = (
    None = 0,
    NotRoaming = 1,
    Roaming = 2
  );
  PRoamingStates = ^RoamingStates;

  // Windows.Networking.Connectivity.NetworkAuthenticationType
  NetworkAuthenticationType = (
    None = 0,
    Unknown = 1,
    Open80211 = 2,
    SharedKey80211 = 3,
    Wpa = 4,
    WpaPsk = 5,
    WpaNone = 6,
    Rsna = 7,
    RsnaPsk = 8,
    Ihv = 9
  );
  PNetworkAuthenticationType = ^NetworkAuthenticationType;

  // Windows.Networking.Connectivity.NetworkEncryptionType
  NetworkEncryptionType = (
    None = 0,
    Unknown = 1,
    Wep = 2,
    Wep40 = 3,
    Wep104 = 4,
    Tkip = 5,
    Ccmp = 6,
    WpaUseGroup = 7,
    RsnUseGroup = 8,
    Ihv = 9
  );
  PNetworkEncryptionType = ^NetworkEncryptionType;

  // Windows.Networking.Connectivity.DomainConnectivityLevel
  DomainConnectivityLevel = (
    None = 0,
    Unauthenticated = 1,
    Authenticated = 2
  );
  PDomainConnectivityLevel = ^DomainConnectivityLevel;

  // Windows.Networking.Connectivity.DataUsageGranularity
  DataUsageGranularity = (
    PerMinute = 0,
    PerHour = 1,
    PerDay = 2,
    Total = 3
  );
  PDataUsageGranularity = ^DataUsageGranularity;

  // Windows.Networking.Connectivity.CellularApnAuthenticationType
  CellularApnAuthenticationType = (
    None = 0,
    Pap = 1,
    Chap = 2,
    Mschapv2 = 3
  );
  PCellularApnAuthenticationType = ^CellularApnAuthenticationType;

  // Windows.Networking.Connectivity.TriStates
  TriStates = (
    DoNotCare = 0,
    No = 1,
    Yes = 2
  );
  PTriStates = ^TriStates;

  // Windows.Networking.Connectivity.WwanNetworkRegistrationState
  WwanNetworkRegistrationState = (
    None = 0,
    Deregistered = 1,
    Searching = 2,
    Home = 3,
    Roaming = 4,
    Partner = 5,
    Denied = 6
  );
  PWwanNetworkRegistrationState = ^WwanNetworkRegistrationState;

  // Windows.Networking.Connectivity.WwanDataClass
  WwanDataClass = (
    None = 0,
    Gprs = 1,
    Edge = 2,
    Umts = 4,
    Hsdpa = 8,
    Hsupa = 16,
    LteAdvanced = 32,
    Cdma1xRtt = 65536,
    Cdma1xEvdo = 131072,
    Cdma1xEvdoRevA = 262144,
    Cdma1xEvdv = 524288,
    Cdma3xRtt = 1048576,
    Cdma1xEvdoRevB = 2097152,
    CdmaUmb = 4194304,
    Custom = -2147483648
  );
  PWwanDataClass = ^WwanDataClass;

  // Windows.Networking.NetworkOperators.DataClasses
  DataClasses = (
    None = 0,
    Gprs = 1,
    Edge = 2,
    Umts = 4,
    Hsdpa = 8,
    Hsupa = 16,
    LteAdvanced = 32,
    Cdma1xRtt = 65536,
    Cdma1xEvdo = 131072,
    Cdma1xEvdoRevA = 262144,
    Cdma1xEvdv = 524288,
    Cdma3xRtt = 1048576,
    Cdma1xEvdoRevB = 2097152,
    CdmaUmb = 4194304,
    Custom = -2147483648
  );
  PDataClasses = ^DataClasses;

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceType
  MobileBroadbandDeviceType = (
    Unknown = 0,
    Embedded = 1,
    Removable = 2,
    Remote = 3
  );
  PMobileBroadbandDeviceType = ^MobileBroadbandDeviceType;

  // Windows.Networking.NetworkOperators.NetworkDeviceStatus
  NetworkDeviceStatus = (
    DeviceNotReady = 0,
    DeviceReady = 1,
    SimNotInserted = 2,
    BadSim = 3,
    DeviceHardwareFailure = 4,
    AccountNotActivated = 5,
    DeviceLocked = 6,
    DeviceBlocked = 7
  );
  PNetworkDeviceStatus = ^NetworkDeviceStatus;

  // Windows.Networking.NetworkOperators.NetworkRegistrationState
  NetworkRegistrationState = (
    None = 0,
    Deregistered = 1,
    Searching = 2,
    Home = 3,
    Roaming = 4,
    Partner = 5,
    Denied = 6
  );
  PNetworkRegistrationState = ^NetworkRegistrationState;

  // Windows.Networking.NetworkOperators.MobileBroadbandRadioState
  MobileBroadbandRadioState = (
    Off = 0,
    On = 1
  );
  PMobileBroadbandRadioState = ^MobileBroadbandRadioState;

  // Windows.Networking.NetworkOperators.NetworkOperatorEventMessageType
  NetworkOperatorEventMessageType = (
    Gsm = 0,
    Cdma = 1,
    Ussd = 2,
    DataPlanThresholdReached = 3,
    DataPlanReset = 4,
    DataPlanDeleted = 5,
    ProfileConnected = 6,
    ProfileDisconnected = 7,
    RegisteredRoaming = 8,
    RegisteredHome = 9,
    TetheringEntitlementCheck = 10,
    TetheringOperationalStateChanged = 11,
    TetheringNumberOfClientsChanged = 12
  );
  PNetworkOperatorEventMessageType = ^NetworkOperatorEventMessageType;

  // Windows.Networking.NetworkOperators.MobileBroadbandAccountWatcherStatus
  MobileBroadbandAccountWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopped = 3,
    Aborted = 4
  );
  PMobileBroadbandAccountWatcherStatus = ^MobileBroadbandAccountWatcherStatus;

  // Windows.Networking.NetworkOperators.TetheringOperationalState
  TetheringOperationalState = (
    Unknown = 0,
    On = 1,
    Off = 2,
    InTransition = 3
  );
  PTetheringOperationalState = ^TetheringOperationalState;

  // Windows.Networking.NetworkOperators.TetheringCapability
  TetheringCapability = (
    Enabled = 0,
    DisabledByGroupPolicy = 1,
    DisabledByHardwareLimitation = 2,
    DisabledByOperator = 3,
    DisabledBySku = 4,
    DisabledByRequiredAppNotInstalled = 5,
    DisabledDueToUnknownCause = 6,
    DisabledBySystemCapability = 7
  );
  PTetheringCapability = ^TetheringCapability;

  // Windows.Networking.NetworkOperators.TetheringOperationStatus
  TetheringOperationStatus = (
    Success = 0,
    Unknown = 1,
    MobileBroadbandDeviceOff = 2,
    WiFiDeviceOff = 3,
    EntitlementCheckTimeout = 4,
    EntitlementCheckFailure = 5,
    OperationInProgress = 6,
    BluetoothDeviceOff = 7,
    NetworkLimitedConnectivity = 8
  );
  PTetheringOperationStatus = ^TetheringOperationStatus;

  // Windows.Networking.NetworkOperators.MobileBroadbandPinLockState
  MobileBroadbandPinLockState = (
    Unknown = 0,
    Unlocked = 1,
    PinRequired = 2,
    PinUnblockKeyRequired = 3
  );
  PMobileBroadbandPinLockState = ^MobileBroadbandPinLockState;

  // Windows.Networking.NetworkOperators.MobileBroadbandPinType
  MobileBroadbandPinType = (
    None = 0,
    Custom = 1,
    Pin1 = 2,
    Pin2 = 3,
    SimPin = 4,
    FirstSimPin = 5,
    NetworkPin = 6,
    NetworkSubsetPin = 7,
    ServiceProviderPin = 8,
    CorporatePin = 9,
    SubsidyLock = 10
  );
  PMobileBroadbandPinType = ^MobileBroadbandPinType;

  // Windows.Networking.NetworkOperators.MobileBroadbandPinFormat
  MobileBroadbandPinFormat = (
    Unknown = 0,
    Numeric = 1,
    Alphanumeric = 2
  );
  PMobileBroadbandPinFormat = ^MobileBroadbandPinFormat;

  // Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
  MobileBroadbandUiccAppOperationStatus = (
    Success = 0,
    InvalidUiccFilePath = 1,
    AccessConditionNotHeld = 2,
    UiccBusy = 3
  );
  PMobileBroadbandUiccAppOperationStatus = ^MobileBroadbandUiccAppOperationStatus;

  // Windows.Networking.NetworkOperators.UiccAppKind
  UiccAppKind = (
    Unknown = 0,
    MF = 1,
    MFSim = 2,
    MFRuim = 3,
    USim = 4,
    CSim = 5,
    ISim = 6
  );
  PUiccAppKind = ^UiccAppKind;

  // Windows.Networking.NetworkOperators.UiccAppRecordKind
  UiccAppRecordKind = (
    Unknown = 0,
    Transparent = 1,
    RecordOriented = 2
  );
  PUiccAppRecordKind = ^UiccAppRecordKind;

  // Windows.Networking.NetworkOperators.UiccAccessCondition
  UiccAccessCondition = (
    AlwaysAllowed = 0,
    Pin1 = 1,
    Pin2 = 2,
    Pin3 = 3,
    Pin4 = 4,
    Administrative5 = 5,
    Administrative6 = 6,
    NeverAllowed = 7
  );
  PUiccAccessCondition = ^UiccAccessCondition;

  // Windows.Networking.NetworkOperators.MobileBroadbandModemStatus
  MobileBroadbandModemStatus = (
    Success = 0,
    OtherFailure = 1,
    Busy = 2,
    NoDeviceSupport = 3
  );
  PMobileBroadbandModemStatus = ^MobileBroadbandModemStatus;

  // Windows.Networking.NetworkOperators.HotspotAuthenticationResponseCode
  HotspotAuthenticationResponseCode = (
    NoError = 0,
    LoginSucceeded = 50,
    LoginFailed = 100,
    RadiusServerError = 102,
    NetworkAdministratorError = 105,
    LoginAborted = 151,
    AccessGatewayInternalError = 255
  );
  PHotspotAuthenticationResponseCode = ^HotspotAuthenticationResponseCode;

  // Windows.Networking.NetworkOperators.ProfileMediaType
  ProfileMediaType = (
    Wlan = 0,
    Wwan = 1
  );
  PProfileMediaType = ^ProfileMediaType;

  // Windows.Networking.NetworkOperators.UssdResultCode
  UssdResultCode = (
    NoActionRequired = 0,
    ActionRequired = 1,
    Terminated = 2,
    OtherLocalClient = 3,
    OperationNotSupported = 4,
    NetworkTimeout = 5
  );
  PUssdResultCode = ^UssdResultCode;

  // Windows.Networking.Proximity.TriggeredConnectState
  TriggeredConnectState = (
    PeerFound = 0,
    Listening = 1,
    Connecting = 2,
    Completed = 3,
    Canceled = 4,
    Failed = 5
  );
  PTriggeredConnectState = ^TriggeredConnectState;

  // Windows.Networking.Proximity.PeerWatcherStatus
  PeerWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PPeerWatcherStatus = ^PeerWatcherStatus;

  // Windows.Networking.Proximity.PeerDiscoveryTypes
  PeerDiscoveryTypes = (
    None = 0,
    Browse = 1,
    Triggered = 2
  );
  PPeerDiscoveryTypes = ^PeerDiscoveryTypes;

  // Windows.Networking.Proximity.PeerRole
  PeerRole = (
    Peer = 0,
    Host = 1,
    Client = 2
  );
  PPeerRole = ^PeerRole;

  // Windows.Networking.Sockets.SocketMessageType
  SocketMessageType = (
    Binary = 0,
    Utf8 = 1
  );
  PSocketMessageType = ^SocketMessageType;

  // Windows.Networking.Sockets.SocketProtectionLevel
  SocketProtectionLevel = (
    PlainSocket = 0,
    Ssl = 1,
    SslAllowNullEncryption = 2,
    BluetoothEncryptionAllowNullAuthentication = 3,
    BluetoothEncryptionWithAuthentication = 4,
    Ssl3AllowWeakEncryption = 5,
    Tls10 = 6,
    Tls11 = 7,
    Tls12 = 8,
    Unspecified = 9
  );
  PSocketProtectionLevel = ^SocketProtectionLevel;

  // Windows.Networking.Sockets.SocketQualityOfService
  SocketQualityOfService = (
    Normal = 0,
    LowLatency = 1
  );
  PSocketQualityOfService = ^SocketQualityOfService;

  // Windows.Networking.Sockets.SocketErrorStatus
  SocketErrorStatus = (
    Unknown = 0,
    OperationAborted = 1,
    HttpInvalidServerResponse = 2,
    ConnectionTimedOut = 3,
    AddressFamilyNotSupported = 4,
    SocketTypeNotSupported = 5,
    HostNotFound = 6,
    NoDataRecordOfRequestedType = 7,
    NonAuthoritativeHostNotFound = 8,
    ClassTypeNotFound = 9,
    AddressAlreadyInUse = 10,
    CannotAssignRequestedAddress = 11,
    ConnectionRefused = 12,
    NetworkIsUnreachable = 13,
    UnreachableHost = 14,
    NetworkIsDown = 15,
    NetworkDroppedConnectionOnReset = 16,
    SoftwareCausedConnectionAbort = 17,
    ConnectionResetByPeer = 18,
    HostIsDown = 19,
    NoAddressesFound = 20,
    TooManyOpenFiles = 21,
    MessageTooLong = 22,
    CertificateExpired = 23,
    CertificateUntrustedRoot = 24,
    CertificateCommonNameIsIncorrect = 25,
    CertificateWrongUsage = 26,
    CertificateRevoked = 27,
    CertificateNoRevocationCheck = 28,
    CertificateRevocationServerOffline = 29,
    CertificateIsInvalid = 30
  );
  PSocketErrorStatus = ^SocketErrorStatus;

  // Windows.Networking.Sockets.SocketSslErrorSeverity
  SocketSslErrorSeverity = (
    None = 0,
    Ignorable = 1,
    Fatal = 2
  );
  PSocketSslErrorSeverity = ^SocketSslErrorSeverity;

  // Windows.Networking.Sockets.SocketActivityKind
  SocketActivityKind = (
    None = 0,
    StreamSocketListener = 1,
    DatagramSocket = 2,
    StreamSocket = 3
  );
  PSocketActivityKind = ^SocketActivityKind;

  // Windows.Networking.Sockets.SocketActivityTriggerReason
  SocketActivityTriggerReason = (
    None = 0,
    SocketActivity = 1,
    ConnectionAccepted = 2,
    KeepAliveTimerExpired = 3,
    SocketClosed = 4
  );
  PSocketActivityTriggerReason = ^SocketActivityTriggerReason;

  // Windows.Networking.Sockets.SocketActivityConnectedStandbyAction
  SocketActivityConnectedStandbyAction = (
    DoNotWake = 0,
    Wake = 1
  );
  PSocketActivityConnectedStandbyAction = ^SocketActivityConnectedStandbyAction;

  // Windows.Networking.Sockets.MessageWebSocketReceiveMode
  MessageWebSocketReceiveMode = (
    FullMessage = 0,
    PartialMessage = 1
  );
  PMessageWebSocketReceiveMode = ^MessageWebSocketReceiveMode;

  // Windows.Networking.Sockets.ControlChannelTriggerStatus
  ControlChannelTriggerStatus = (
    HardwareSlotRequested = 0,
    SoftwareSlotAllocated = 1,
    HardwareSlotAllocated = 2,
    PolicyError = 3,
    SystemError = 4,
    TransportDisconnected = 5,
    ServiceUnavailable = 6
  );
  PControlChannelTriggerStatus = ^ControlChannelTriggerStatus;

  // Windows.Networking.Sockets.ControlChannelTriggerResourceType
  ControlChannelTriggerResourceType = (
    RequestSoftwareSlot = 0,
    RequestHardwareSlot = 1
  );
  PControlChannelTriggerResourceType = ^ControlChannelTriggerResourceType;

  // Windows.Networking.Sockets.ControlChannelTriggerResetReason
  ControlChannelTriggerResetReason = (
    FastUserSwitched = 0,
    LowPowerExit = 1,
    QuietHoursExit = 2,
    ApplicationRestart = 3
  );
  PControlChannelTriggerResetReason = ^ControlChannelTriggerResetReason;

  // Windows.Networking.PushNotifications.PushNotificationType
  PushNotificationType = (
    Toast = 0,
    Tile = 1,
    Badge = 2,
    Raw = 3,
    TileFlyout = 4
  );
  PPushNotificationType = ^PushNotificationType;

  // Windows.Networking.Vpn.VpnDataPathType
  VpnDataPathType = (
    Send = 0,
    Receive = 1
  );
  PVpnDataPathType = ^VpnDataPathType;

  // Windows.Networking.Vpn.VpnChannelActivityEventType
  VpnChannelActivityEventType = (
    Idle = 0,
    Active = 1
  );
  PVpnChannelActivityEventType = ^VpnChannelActivityEventType;

  // Windows.Networking.Vpn.VpnCredentialType
  VpnCredentialType = (
    UsernamePassword = 0,
    UsernameOtpPin = 1,
    UsernamePasswordAndPin = 2,
    UsernamePasswordChange = 3,
    SmartCard = 4,
    ProtectedCertificate = 5,
    UnProtectedCertificate = 6
  );
  PVpnCredentialType = ^VpnCredentialType;

  // Windows.Networking.Vpn.VpnPacketBufferStatus
  VpnPacketBufferStatus = (
    Ok = 0,
    InvalidBufferSize = 1
  );
  PVpnPacketBufferStatus = ^VpnPacketBufferStatus;

  // Windows.Networking.Vpn.VpnChannelRequestCredentialsOptions
  VpnChannelRequestCredentialsOptions = (
    None = 0,
    Retrying = 1,
    UseForSingleSignIn = 2
  );
  PVpnChannelRequestCredentialsOptions = ^VpnChannelRequestCredentialsOptions;

  // Windows.Networking.Vpn.VpnDomainNameType
  VpnDomainNameType = (
    Suffix = 0,
    FullyQualified = 1,
    Reserved = 65535
  );
  PVpnDomainNameType = ^VpnDomainNameType;

  // Windows.Networking.Vpn.VpnAppIdType
  VpnAppIdType = (
    PackageFamilyName = 0,
    FullyQualifiedBinaryName = 1,
    FilePath = 2
  );
  PVpnAppIdType = ^VpnAppIdType;

  // Windows.Networking.Vpn.VpnIPProtocol
  VpnIPProtocol = (
    None = 0,
    Tcp = 6,
    Udp = 17,
    Icmp = 1,
    Ipv6Icmp = 58,
    Igmp = 2,
    Pgm = 113
  );
  PVpnIPProtocol = ^VpnIPProtocol;

  // Windows.Networking.Vpn.VpnRoutingPolicyType
  VpnRoutingPolicyType = (
    SplitRouting = 0,
    ForceAllTrafficOverVpn = 1
  );
  PVpnRoutingPolicyType = ^VpnRoutingPolicyType;

  // Windows.Networking.Vpn.VpnManagementConnectionStatus
  VpnManagementConnectionStatus = (
    Disconnected = 0,
    Disconnecting = 1,
    Connected = 2,
    Connecting = 3
  );
  PVpnManagementConnectionStatus = ^VpnManagementConnectionStatus;

  // Windows.Networking.Vpn.VpnNativeProtocolType
  VpnNativeProtocolType = (
    Pptp = 0,
    L2tp = 1,
    IpsecIkev2 = 2
  );
  PVpnNativeProtocolType = ^VpnNativeProtocolType;

  // Windows.Networking.Vpn.VpnAuthenticationMethod
  VpnAuthenticationMethod = (
    Mschapv2 = 0,
    Eap = 1,
    Certificate = 2,
    PresharedKey = 3
  );
  PVpnAuthenticationMethod = ^VpnAuthenticationMethod;

  // Windows.Networking.Vpn.VpnManagementErrorStatus
  VpnManagementErrorStatus = (
    Ok = 0,
    Other = 1,
    InvalidXmlSyntax = 2,
    ProfileNameTooLong = 3,
    ProfileInvalidAppId = 4,
    AccessDenied = 5,
    CannotFindProfile = 6,
    AlreadyDisconnecting = 7,
    AlreadyConnected = 8,
    GeneralAuthenticationFailure = 9,
    EapFailure = 10,
    SmartCardFailure = 11,
    CertificateFailure = 12,
    ServerConfiguration = 13,
    NoConnection = 14,
    ServerConnection = 15,
    UserNamePassword = 16,
    DnsNotResolvable = 17,
    InvalidIP = 18
  );
  PVpnManagementErrorStatus = ^VpnManagementErrorStatus;

  // Windows.Perception.Spatial.SpatialPerceptionAccessStatus
  Spatial_SpatialPerceptionAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    DeniedByUser = 2,
    DeniedBySystem = 3
  );
  PSpatial_SpatialPerceptionAccessStatus = ^Spatial_SpatialPerceptionAccessStatus;

  // Windows.Perception.Spatial.SpatialLocatability
  Spatial_SpatialLocatability = (
    Unavailable = 0,
    OrientationOnly = 1,
    PositionalTrackingActivating = 2,
    PositionalTrackingActive = 3,
    PositionalTrackingInhibited = 4
  );
  PSpatial_SpatialLocatability = ^Spatial_SpatialLocatability;

  // Windows.Perception.Spatial.SpatialMovementRange
  Spatial_SpatialMovementRange = (
    NoMovement = 0,
    Bounded = 1
  );
  PSpatial_SpatialMovementRange = ^Spatial_SpatialMovementRange;

  // Windows.Perception.Spatial.SpatialLookDirectionRange
  Spatial_SpatialLookDirectionRange = (
    ForwardOnly = 0,
    Omnidirectional = 1
  );
  PSpatial_SpatialLookDirectionRange = ^Spatial_SpatialLookDirectionRange;

  // Windows.Perception.Spatial.SpatialEntityWatcherStatus
  Spatial_SpatialEntityWatcherStatus = (
    Created = 0,
    Started = 1,
    EnumerationCompleted = 2,
    Stopping = 3,
    Stopped = 4,
    Aborted = 5
  );
  PSpatial_SpatialEntityWatcherStatus = ^Spatial_SpatialEntityWatcherStatus;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceCapabilities
  Authentication_Identity_Provider_SecondaryAuthenticationFactorDeviceCapabilities = (
    None = 0,
    SecureStorage = 1,
    StoreKeys = 2,
    ConfirmUserIntentToAuthenticate = 4,
    SupportSecureUserPresenceCheck = 8,
    TransmittedDataIsEncrypted = 16,
    HMacSha256 = 32,
    CloseRangeDataTransmission = 64
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorDeviceCapabilities = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorDeviceCapabilities;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDeviceFindScope
  Authentication_Identity_Provider_SecondaryAuthenticationFactorDeviceFindScope = (
    User = 0,
    AllUsers = 1
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorDeviceFindScope = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorDeviceFindScope;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationStage
  Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationStage = (
    NotStarted = 0,
    WaitingForUserConfirmation = 1,
    CollectingCredential = 2,
    SuspendingAuthentication = 3,
    CredentialCollected = 4,
    CredentialAuthenticated = 5,
    StoppingAuthentication = 6,
    ReadyForLock = 7,
    CheckingDevicePresence = 8
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationStage = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationStage;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistrationStatus
  Authentication_Identity_Provider_SecondaryAuthenticationFactorRegistrationStatus = (
    Failed = 0,
    Started = 1,
    CanceledByUser = 2,
    PinSetupRequired = 3,
    DisabledByPolicy = 4
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorRegistrationStatus = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorRegistrationStatus;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus
  Authentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus = (
    Unsupported = 0,
    Succeeded = 1,
    DisabledByPolicy = 2
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatus;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationStatus
  Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationStatus = (
    Failed = 0,
    Started = 1,
    UnknownDevice = 2,
    DisabledByPolicy = 3,
    InvalidAuthenticationStage = 4
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationStatus = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationStatus;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorFinishAuthenticationStatus
  Authentication_Identity_Provider_SecondaryAuthenticationFactorFinishAuthenticationStatus = (
    Failed = 0,
    Completed = 1,
    NonceExpired = 2
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorFinishAuthenticationStatus = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorFinishAuthenticationStatus;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationScenario
  Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationScenario = (
    SignIn = 0,
    CredentialPrompt = 1
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationScenario = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationScenario;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthenticationMessage
  Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationMessage = (
    Invalid = 0,
    SwipeUpWelcome = 1,
    TapWelcome = 2,
    DeviceNeedsAttention = 3,
    LookingForDevice = 4,
    LookingForDevicePluggedin = 5,
    BluetoothIsDisabled = 6,
    NfcIsDisabled = 7,
    WiFiIsDisabled = 8,
    ExtraTapIsRequired = 9,
    DisabledByPolicy = 10,
    TapOnDeviceRequired = 11,
    HoldFinger = 12,
    ScanFinger = 13,
    UnauthorizedUser = 14,
    ReregisterRequired = 15,
    TryAgain = 16,
    SayPassphrase = 17,
    ReadyToSignIn = 18,
    UseAnotherSignInOption = 19
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationMessage = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorAuthenticationMessage;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresence
  Authentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresence = (
    Absent = 0,
    Present = 1
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresence = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresence;

  // Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorDevicePresenceMonitoringMode
  Authentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresenceMonitoringMode = (
    Unsupported = 0,
    AppManaged = 1,
    SystemManaged = 2
  );
  PAuthentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresenceMonitoringMode = ^Authentication_Identity_Provider_SecondaryAuthenticationFactorDevicePresenceMonitoringMode;

  // Windows.Security.EnterpriseData.ProtectionPolicyEvaluationResult
  EnterpriseData_ProtectionPolicyEvaluationResult = (
    Allowed = 0,
    Blocked = 1,
    ConsentRequired = 2
  );
  PEnterpriseData_ProtectionPolicyEvaluationResult = ^EnterpriseData_ProtectionPolicyEvaluationResult;

  // Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorServiceResponse
  Authentication_Identity_Core_MicrosoftAccountMultiFactorServiceResponse = (
    Success = 0,
    Error = 1,
    NoNetworkConnection = 2,
    ServiceUnavailable = 3,
    TotpSetupDenied = 4,
    NgcNotSetup = 5,
    SessionAlreadyDenied = 6,
    SessionAlreadyApproved = 7,
    SessionExpired = 8,
    NgcNonceExpired = 9,
    InvalidSessionId = 10,
    InvalidSessionType = 11,
    InvalidOperation = 12,
    InvalidStateTransition = 13,
    DeviceNotFound = 14,
    FlowDisabled = 15,
    SessionNotApproved = 16,
    OperationCanceledByUser = 17,
    NgcDisabledByServer = 18,
    NgcKeyNotFoundOnServer = 19,
    UIRequired = 20,
    DeviceIdChanged = 21
  );
  PAuthentication_Identity_Core_MicrosoftAccountMultiFactorServiceResponse = ^Authentication_Identity_Core_MicrosoftAccountMultiFactorServiceResponse;

  // Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorSessionAuthenticationStatus
  Authentication_Identity_Core_MicrosoftAccountMultiFactorSessionAuthenticationStatus = (
    Authenticated = 0,
    Unauthenticated = 1
  );
  PAuthentication_Identity_Core_MicrosoftAccountMultiFactorSessionAuthenticationStatus = ^Authentication_Identity_Core_MicrosoftAccountMultiFactorSessionAuthenticationStatus;

  // Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorAuthenticationType
  Authentication_Identity_Core_MicrosoftAccountMultiFactorAuthenticationType = (
    User = 0,
    Device = 1
  );
  PAuthentication_Identity_Core_MicrosoftAccountMultiFactorAuthenticationType = ^Authentication_Identity_Core_MicrosoftAccountMultiFactorAuthenticationType;

  // Windows.Security.Authentication.Identity.Core.MicrosoftAccountMultiFactorSessionApprovalStatus
  Authentication_Identity_Core_MicrosoftAccountMultiFactorSessionApprovalStatus = (
    Pending = 0,
    Approved = 1,
    Denied = 2
  );
  PAuthentication_Identity_Core_MicrosoftAccountMultiFactorSessionApprovalStatus = ^Authentication_Identity_Core_MicrosoftAccountMultiFactorSessionApprovalStatus;

  // Windows.Security.Authentication.OnlineId.CredentialPromptType
  Authentication_OnlineId_CredentialPromptType = (
    PromptIfNeeded = 0,
    RetypeCredentials = 1,
    DoNotPrompt = 2
  );
  PAuthentication_OnlineId_CredentialPromptType = ^Authentication_OnlineId_CredentialPromptType;

  // Windows.Security.Authentication.OnlineId.OnlineIdSystemTicketStatus
  Authentication_OnlineId_OnlineIdSystemTicketStatus = (
    Success = 0,
    Error = 1,
    ServiceConnectionError = 2
  );
  PAuthentication_OnlineId_OnlineIdSystemTicketStatus = ^Authentication_OnlineId_OnlineIdSystemTicketStatus;

  // Windows.Security.Authentication.Web.Provider.WebAccountProviderOperationKind
  Authentication_Web_Provider_WebAccountProviderOperationKind = (
    RequestToken = 0,
    GetTokenSilently = 1,
    AddAccount = 2,
    ManageAccount = 3,
    DeleteAccount = 4,
    RetrieveCookies = 5,
    SignOutAccount = 6
  );
  PAuthentication_Web_Provider_WebAccountProviderOperationKind = ^Authentication_Web_Provider_WebAccountProviderOperationKind;

  // Windows.Security.Authentication.Web.Core.WebTokenRequestPromptType
  Authentication_Web_Core_WebTokenRequestPromptType = (
    Default = 0,
    ForceAuthentication = 1
  );
  PAuthentication_Web_Core_WebTokenRequestPromptType = ^Authentication_Web_Core_WebTokenRequestPromptType;

  // Windows.Security.Authentication.Web.TokenBindingKeyType
  Authentication_Web_TokenBindingKeyType = (
    Rsa2048 = 0,
    EcdsaP256 = 1,
    AnyExisting = 2
  );
  PAuthentication_Web_TokenBindingKeyType = ^Authentication_Web_TokenBindingKeyType;

  // Windows.Security.Authentication.Web.Provider.WebAccountSelectionOptions
  Authentication_Web_Provider_WebAccountSelectionOptions = (
    Default = 0,
    New = 1
  );
  PAuthentication_Web_Provider_WebAccountSelectionOptions = ^Authentication_Web_Provider_WebAccountSelectionOptions;

  // Windows.Security.Authentication.Web.Provider.WebAccountClientViewType
  Authentication_Web_Provider_WebAccountClientViewType = (
    IdOnly = 0,
    IdAndProperties = 1
  );
  PAuthentication_Web_Provider_WebAccountClientViewType = ^Authentication_Web_Provider_WebAccountClientViewType;

  // Windows.Security.Authentication.Web.Provider.WebAccountScope
  Authentication_Web_Provider_WebAccountScope = (
    PerUser = 0,
    PerApplication = 1
  );
  PAuthentication_Web_Provider_WebAccountScope = ^Authentication_Web_Provider_WebAccountScope;

  // Windows.Security.Authentication.Web.Core.WebTokenRequestStatus
  Authentication_Web_Core_WebTokenRequestStatus = (
    Success = 0,
    UserCancel = 1,
    AccountSwitch = 2,
    UserInteractionRequired = 3,
    AccountProviderNotAvailable = 4,
    ProviderError = 5
  );
  PAuthentication_Web_Core_WebTokenRequestStatus = ^Authentication_Web_Core_WebTokenRequestStatus;

  // Windows.Security.Authentication.Web.WebAuthenticationStatus
  Authentication_Web_WebAuthenticationStatus = (
    Success = 0,
    UserCancel = 1,
    ErrorHttp = 2
  );
  PAuthentication_Web_WebAuthenticationStatus = ^Authentication_Web_WebAuthenticationStatus;

  // Windows.Security.Authentication.Web.WebAuthenticationOptions
  Authentication_Web_WebAuthenticationOptions = (
    None = 0,
    SilentMode = 1,
    UseTitle = 2,
    UseHttpPost = 4,
    UseCorporateNetwork = 8
  );
  PAuthentication_Web_WebAuthenticationOptions = ^Authentication_Web_WebAuthenticationOptions;

  // Windows.Security.EnterpriseData.FileProtectionStatus
  EnterpriseData_FileProtectionStatus = (
    Undetermined = 0,
    Unknown = 0,
    Unprotected = 1,
    Revoked = 2,
    Protected = 3,
    ProtectedByOtherUser = 4,
    ProtectedToOtherEnterprise = 5,
    NotProtectable = 6,
    ProtectedToOtherIdentity = 7,
    LicenseExpired = 8,
    AccessSuspended = 9,
    FileInUse = 10
  );
  PEnterpriseData_FileProtectionStatus = ^EnterpriseData_FileProtectionStatus;

  // Windows.Security.EnterpriseData.ProtectedImportExportStatus
  EnterpriseData_ProtectedImportExportStatus = (
    Ok = 0,
    Undetermined = 1,
    Unprotected = 2,
    Revoked = 3,
    NotRoamable = 4,
    ProtectedToOtherIdentity = 5,
    LicenseExpired = 6,
    AccessSuspended = 7
  );
  PEnterpriseData_ProtectedImportExportStatus = ^EnterpriseData_ProtectedImportExportStatus;

  // Windows.Security.EnterpriseData.DataProtectionStatus
  EnterpriseData_DataProtectionStatus = (
    ProtectedToOtherIdentity = 0,
    Protected = 1,
    Revoked = 2,
    Unprotected = 3,
    LicenseExpired = 4,
    AccessSuspended = 5
  );
  PEnterpriseData_DataProtectionStatus = ^EnterpriseData_DataProtectionStatus;

  // Windows.Security.EnterpriseData.ProtectionPolicyAuditAction
  EnterpriseData_ProtectionPolicyAuditAction = (
    Decrypt = 0,
    CopyToLocation = 1,
    SendToRecipient = 2,
    Other = 3
  );
  PEnterpriseData_ProtectionPolicyAuditAction = ^EnterpriseData_ProtectionPolicyAuditAction;

  // Windows.Security.EnterpriseData.ProtectionPolicyRequestAccessBehavior
  EnterpriseData_ProtectionPolicyRequestAccessBehavior = (
    Decrypt = 0,
    TreatOverridePolicyAsBlock = 1
  );
  PEnterpriseData_ProtectionPolicyRequestAccessBehavior = ^EnterpriseData_ProtectionPolicyRequestAccessBehavior;

  // Windows.Security.EnterpriseData.EnforcementLevel
  EnterpriseData_EnforcementLevel = (
    NoProtection = 0,
    Silent = 1,
    Override = 2,
    Block = 3
  );
  PEnterpriseData_EnforcementLevel = ^EnterpriseData_EnforcementLevel;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasRequireEncryptionResult
  ExchangeActiveSyncProvisioning_EasRequireEncryptionResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    NotProvisionedOnAllVolumes = 3,
    DeFixedDataNotSupported = 4,
    FixedDataNotSupported = 4,
    DeHardwareNotCompliant = 5,
    HardwareNotCompliant = 5,
    DeWinReNotConfigured = 6,
    LockNotConfigured = 6,
    DeProtectionSuspended = 7,
    ProtectionSuspended = 7,
    DeOsVolumeNotProtected = 8,
    OsVolumeNotProtected = 8,
    DeProtectionNotYetEnabled = 9,
    ProtectionNotYetEnabled = 9,
    NoFeatureLicense = 10,
    OsNotProtected = 11,
    UnexpectedFailure = 12
  );
  PExchangeActiveSyncProvisioning_EasRequireEncryptionResult = ^ExchangeActiveSyncProvisioning_EasRequireEncryptionResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasEncryptionProviderType
  ExchangeActiveSyncProvisioning_EasEncryptionProviderType = (
    NotEvaluated = 0,
    WindowsEncryption = 1,
    OtherEncryption = 2
  );
  PExchangeActiveSyncProvisioning_EasEncryptionProviderType = ^ExchangeActiveSyncProvisioning_EasEncryptionProviderType;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasMinPasswordLengthResult
  ExchangeActiveSyncProvisioning_EasMinPasswordLengthResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3,
    RequestedPolicyNotEnforceable = 4,
    InvalidParameter = 5,
    CurrentUserHasBlankPassword = 6,
    AdminsHaveBlankPassword = 7,
    UserCannotChangePassword = 8,
    AdminsCannotChangePassword = 9,
    LocalControlledUsersCannotChangePassword = 10,
    ConnectedAdminsProviderPolicyIsWeak = 11,
    ConnectedUserProviderPolicyIsWeak = 12,
    ChangeConnectedAdminsPassword = 13,
    ChangeConnectedUserPassword = 14
  );
  PExchangeActiveSyncProvisioning_EasMinPasswordLengthResult = ^ExchangeActiveSyncProvisioning_EasMinPasswordLengthResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasDisallowConvenienceLogonResult
  ExchangeActiveSyncProvisioning_EasDisallowConvenienceLogonResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3
  );
  PExchangeActiveSyncProvisioning_EasDisallowConvenienceLogonResult = ^ExchangeActiveSyncProvisioning_EasDisallowConvenienceLogonResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasMinPasswordComplexCharactersResult
  ExchangeActiveSyncProvisioning_EasMinPasswordComplexCharactersResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3,
    RequestedPolicyNotEnforceable = 4,
    InvalidParameter = 5,
    CurrentUserHasBlankPassword = 6,
    AdminsHaveBlankPassword = 7,
    UserCannotChangePassword = 8,
    AdminsCannotChangePassword = 9,
    LocalControlledUsersCannotChangePassword = 10,
    ConnectedAdminsProviderPolicyIsWeak = 11,
    ConnectedUserProviderPolicyIsWeak = 12,
    ChangeConnectedAdminsPassword = 13,
    ChangeConnectedUserPassword = 14
  );
  PExchangeActiveSyncProvisioning_EasMinPasswordComplexCharactersResult = ^ExchangeActiveSyncProvisioning_EasMinPasswordComplexCharactersResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasPasswordExpirationResult
  ExchangeActiveSyncProvisioning_EasPasswordExpirationResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3,
    RequestedExpirationIncompatible = 4,
    InvalidParameter = 5,
    UserCannotChangePassword = 6,
    AdminsCannotChangePassword = 7,
    LocalControlledUsersCannotChangePassword = 8
  );
  PExchangeActiveSyncProvisioning_EasPasswordExpirationResult = ^ExchangeActiveSyncProvisioning_EasPasswordExpirationResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasPasswordHistoryResult
  ExchangeActiveSyncProvisioning_EasPasswordHistoryResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3,
    InvalidParameter = 4
  );
  PExchangeActiveSyncProvisioning_EasPasswordHistoryResult = ^ExchangeActiveSyncProvisioning_EasPasswordHistoryResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasMaxPasswordFailedAttemptsResult
  ExchangeActiveSyncProvisioning_EasMaxPasswordFailedAttemptsResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3,
    InvalidParameter = 4
  );
  PExchangeActiveSyncProvisioning_EasMaxPasswordFailedAttemptsResult = ^ExchangeActiveSyncProvisioning_EasMaxPasswordFailedAttemptsResult;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasMaxInactivityTimeLockResult
  ExchangeActiveSyncProvisioning_EasMaxInactivityTimeLockResult = (
    NotEvaluated = 0,
    Compliant = 1,
    CanBeCompliant = 2,
    RequestedPolicyIsStricter = 3,
    InvalidParameter = 4
  );
  PExchangeActiveSyncProvisioning_EasMaxInactivityTimeLockResult = ^ExchangeActiveSyncProvisioning_EasMaxInactivityTimeLockResult;

  // Windows.Security.Credentials.UI.AuthenticationProtocol
  UI_AuthenticationProtocol = (
    Basic = 0,
    Digest = 1,
    Ntlm = 2,
    Kerberos = 3,
    Negotiate = 4,
    CredSsp = 5,
    Custom = 6
  );
  PUI_AuthenticationProtocol = ^UI_AuthenticationProtocol;

  // Windows.Security.Credentials.UI.CredentialSaveOption
  UI_CredentialSaveOption = (
    Unselected = 0,
    Selected = 1,
    Hidden = 2
  );
  PUI_CredentialSaveOption = ^UI_CredentialSaveOption;

  // Windows.Security.Credentials.UI.UserConsentVerifierAvailability
  UI_UserConsentVerifierAvailability = (
    Available = 0,
    DeviceNotPresent = 1,
    NotConfiguredForUser = 2,
    DisabledByPolicy = 3,
    DeviceBusy = 4
  );
  PUI_UserConsentVerifierAvailability = ^UI_UserConsentVerifierAvailability;

  // Windows.Security.Credentials.UI.UserConsentVerificationResult
  UI_UserConsentVerificationResult = (
    Verified = 0,
    DeviceNotPresent = 1,
    NotConfiguredForUser = 2,
    DisabledByPolicy = 3,
    DeviceBusy = 4,
    RetriesExhausted = 5,
    Canceled = 6
  );
  PUI_UserConsentVerificationResult = ^UI_UserConsentVerificationResult;

  // Windows.Security.Credentials.KeyCredentialStatus
  KeyCredentialStatus = (
    Success = 0,
    UnknownError = 1,
    NotFound = 2,
    UserCanceled = 3,
    UserPrefersPassword = 4,
    CredentialAlreadyExists = 5,
    SecurityDeviceLocked = 6
  );
  PKeyCredentialStatus = ^KeyCredentialStatus;

  // Windows.Security.Credentials.KeyCredentialAttestationStatus
  KeyCredentialAttestationStatus = (
    Success = 0,
    UnknownError = 1,
    NotSupported = 2,
    TemporaryFailure = 3
  );
  PKeyCredentialAttestationStatus = ^KeyCredentialAttestationStatus;

  // Windows.Security.Credentials.KeyCredentialCreationOption
  KeyCredentialCreationOption = (
    ReplaceExisting = 0,
    FailIfExists = 1
  );
  PKeyCredentialCreationOption = ^KeyCredentialCreationOption;

  // Windows.Security.Credentials.WebAccountState
  WebAccountState = (
    None = 0,
    Connected = 1,
    Error = 2
  );
  PWebAccountState = ^WebAccountState;

  // Windows.Security.Credentials.WebAccountPictureSize
  WebAccountPictureSize = (
    Size64x64 = 64,
    Size208x208 = 208,
    Size424x424 = 424,
    Size1080x1080 = 1080
  );
  PWebAccountPictureSize = ^WebAccountPictureSize;

  // Windows.Security.Cryptography.Certificates.EnrollKeyUsages
  Certificates_EnrollKeyUsages = (
    None = 0,
    Decryption = 1,
    Signing = 2,
    KeyAgreement = 4,
    All = 16777215
  );
  PCertificates_EnrollKeyUsages = ^Certificates_EnrollKeyUsages;

  // Windows.Security.Cryptography.Certificates.KeyProtectionLevel
  Certificates_KeyProtectionLevel = (
    NoConsent = 0,
    ConsentOnly = 1,
    ConsentWithPassword = 2,
    ConsentWithFingerprint = 3
  );
  PCertificates_KeyProtectionLevel = ^Certificates_KeyProtectionLevel;

  // Windows.Security.Cryptography.Certificates.ExportOption
  Certificates_ExportOption = (
    NotExportable = 0,
    Exportable = 1
  );
  PCertificates_ExportOption = ^Certificates_ExportOption;

  // Windows.Security.Cryptography.Certificates.KeySize
  Certificates_KeySize = (
    Invalid = 0,
    Rsa2048 = 2048,
    Rsa4096 = 4096
  );
  PCertificates_KeySize = ^Certificates_KeySize;

  // Windows.Security.Cryptography.Certificates.InstallOptions
  Certificates_InstallOptions = (
    None = 0,
    DeleteExpired = 1
  );
  PCertificates_InstallOptions = ^Certificates_InstallOptions;

  // Windows.Security.Cryptography.Certificates.CertificateChainPolicy
  Certificates_CertificateChainPolicy = (
    Base = 0,
    Ssl = 1,
    NTAuthentication = 2,
    MicrosoftRoot = 3
  );
  PCertificates_CertificateChainPolicy = ^Certificates_CertificateChainPolicy;

  // Windows.Security.Cryptography.Certificates.ChainValidationResult
  Certificates_ChainValidationResult = (
    Success = 0,
    Untrusted = 1,
    Revoked = 2,
    Expired = 3,
    IncompleteChain = 4,
    InvalidSignature = 5,
    WrongUsage = 6,
    InvalidName = 7,
    InvalidCertificateAuthorityPolicy = 8,
    BasicConstraintsError = 9,
    UnknownCriticalExtension = 10,
    RevocationInformationMissing = 11,
    RevocationFailure = 12,
    OtherErrors = 13
  );
  PCertificates_ChainValidationResult = ^Certificates_ChainValidationResult;

  // Windows.Security.Cryptography.Certificates.SignatureValidationResult
  Certificates_SignatureValidationResult = (
    Success = 0,
    InvalidParameter = 1,
    BadMessage = 2,
    InvalidSignature = 3,
    OtherErrors = 4
  );
  PCertificates_SignatureValidationResult = ^Certificates_SignatureValidationResult;

  // Windows.Security.Cryptography.Core.CryptographicPrivateKeyBlobType
  Core_CryptographicPrivateKeyBlobType = (
    Pkcs8RawPrivateKeyInfo = 0,
    Pkcs1RsaPrivateKey = 1,
    BCryptPrivateKey = 2,
    Capi1PrivateKey = 3,
    BCryptEccFullPrivateKey = 4
  );
  PCore_CryptographicPrivateKeyBlobType = ^Core_CryptographicPrivateKeyBlobType;

  // Windows.Security.Cryptography.Core.CryptographicPublicKeyBlobType
  Core_CryptographicPublicKeyBlobType = (
    X509SubjectPublicKeyInfo = 0,
    Pkcs1RsaPublicKey = 1,
    BCryptPublicKey = 2,
    Capi1PublicKey = 3,
    BCryptEccFullPublicKey = 4
  );
  PCore_CryptographicPublicKeyBlobType = ^Core_CryptographicPublicKeyBlobType;

  // Windows.Security.Cryptography.Core.Capi1KdfTargetAlgorithm
  Core_Capi1KdfTargetAlgorithm = (
    NotAes = 0,
    Aes = 1
  );
  PCore_Capi1KdfTargetAlgorithm = ^Core_Capi1KdfTargetAlgorithm;

  // Windows.Security.Cryptography.Core.CryptographicPadding
  Core_CryptographicPadding = (
    None = 0,
    RsaOaep = 1,
    RsaPkcs1V15 = 2,
    RsaPss = 3
  );
  PCore_CryptographicPadding = ^Core_CryptographicPadding;

  // Windows.Security.Cryptography.BinaryStringEncoding
  BinaryStringEncoding = (
    Utf8 = 0,
    Utf16LE = 1,
    Utf16BE = 2
  );
  PBinaryStringEncoding = ^BinaryStringEncoding;

  // Windows.UI.ApplicationSettings.WebAccountAction
  ApplicationSettings_WebAccountAction = (
    Reconnect = 0,
    Remove = 1,
    ViewDetails = 2,
    Manage = 3,
    More = 4
  );
  PApplicationSettings_WebAccountAction = ^ApplicationSettings_WebAccountAction;

  // Windows.UI.ApplicationSettings.SupportedWebAccountActions
  ApplicationSettings_SupportedWebAccountActions = (
    None = 0,
    Reconnect = 1,
    Remove = 2,
    ViewDetails = 4,
    Manage = 8,
    More = 16
  );
  PApplicationSettings_SupportedWebAccountActions = ^ApplicationSettings_SupportedWebAccountActions;

  // Windows.UI.StartScreen.JumpListSystemGroupKind
  StartScreen_JumpListSystemGroupKind = (
    None = 0,
    Frequent = 1,
    Recent = 2
  );
  PStartScreen_JumpListSystemGroupKind = ^StartScreen_JumpListSystemGroupKind;

  // Windows.UI.StartScreen.JumpListItemKind
  StartScreen_JumpListItemKind = (
    Arguments = 0,
    Separator = 1
  );
  PStartScreen_JumpListItemKind = ^StartScreen_JumpListItemKind;

  // Windows.UI.Popups.MessageDialogOptions
  Popups_MessageDialogOptions = (
    None = 0,
    AcceptUserInputAfterDelay = 1
  );
  PPopups_MessageDialogOptions = ^Popups_MessageDialogOptions;

  // Windows.UI.Popups.Placement
  Popups_Placement = (
    Default = 0,
    Above = 1,
    Below = 2,
    Left = 3,
    Right = 4
  );
  PPopups_Placement = ^Popups_Placement;

  // Windows.UI.StartScreen.TileOptions
  StartScreen_TileOptions = (
    None = 0,
    ShowNameOnLogo = 1,
    ShowNameOnWideLogo = 2,
    CopyOnDeployment = 4
  );
  PStartScreen_TileOptions = ^StartScreen_TileOptions;

  // Windows.UI.StartScreen.TileSize
  StartScreen_TileSize = (
    Default = 0,
    Square30x30 = 1,
    Square70x70 = 2,
    Square150x150 = 3,
    Wide310x150 = 4,
    Square310x310 = 5,
    Square71x71 = 6,
    Square44x44 = 7
  );
  PStartScreen_TileSize = ^StartScreen_TileSize;

  // Windows.UI.StartScreen.ForegroundText
  StartScreen_ForegroundText = (
    Dark = 0,
    Light = 1
  );
  PStartScreen_ForegroundText = ^StartScreen_ForegroundText;

  // Windows.UI.ApplicationSettings.SettingsEdgeLocation
  ApplicationSettings_SettingsEdgeLocation = (
    Right = 0,
    Left = 1
  );
  PApplicationSettings_SettingsEdgeLocation = ^ApplicationSettings_SettingsEdgeLocation;

  // Windows.UI.Composition.Effects.SceneLightingEffectReflectanceModel
  Effects_SceneLightingEffectReflectanceModel = (
    BlinnPhong = 0,
    PhysicallyBasedBlinnPhong = 1
  );
  PEffects_SceneLightingEffectReflectanceModel = ^Effects_SceneLightingEffectReflectanceModel;

  // Windows.UI.Composition.Interactions.InteractionChainingMode
  Interactions_InteractionChainingMode = (
    Auto = 0,
    Always = 1,
    Never = 2
  );
  PInteractions_InteractionChainingMode = ^Interactions_InteractionChainingMode;

  // Windows.UI.Composition.Interactions.InteractionSourceMode
  Interactions_InteractionSourceMode = (
    Disabled = 0,
    EnabledWithInertia = 1,
    EnabledWithoutInertia = 2
  );
  PInteractions_InteractionSourceMode = ^Interactions_InteractionSourceMode;

  // Windows.UI.Composition.Interactions.VisualInteractionSourceRedirectionMode
  Interactions_VisualInteractionSourceRedirectionMode = (
    Off = 0,
    CapableTouchpadOnly = 1
  );
  PInteractions_VisualInteractionSourceRedirectionMode = ^Interactions_VisualInteractionSourceRedirectionMode;

  // Windows.UI.Composition.AnimationDirection
  AnimationDirection = (
    Normal = 0,
    Reverse = 1,
    Alternate = 2,
    AlternateReverse = 3
  );
  PAnimationDirection = ^AnimationDirection;

  // Windows.UI.Composition.AnimationIterationBehavior
  AnimationIterationBehavior = (
    Count = 0,
    Forever = 1
  );
  PAnimationIterationBehavior = ^AnimationIterationBehavior;

  // Windows.UI.Composition.AnimationDelayBehavior
  AnimationDelayBehavior = (
    SetInitialValueAfterDelay = 0,
    SetInitialValueBeforeDelay = 1
  );
  PAnimationDelayBehavior = ^AnimationDelayBehavior;

  // Windows.UI.Composition.AnimationStopBehavior
  AnimationStopBehavior = (
    LeaveCurrentValue = 0,
    SetToInitialValue = 1,
    SetToFinalValue = 2
  );
  PAnimationStopBehavior = ^AnimationStopBehavior;

  // Windows.UI.Composition.CompositionBatchTypes
  CompositionBatchTypes = (
    None = 0,
    Animation = 1,
    Effect = 2
  );
  PCompositionBatchTypes = ^CompositionBatchTypes;

  // Windows.UI.Composition.CompositionBackfaceVisibility
  CompositionBackfaceVisibility = (
    Inherit = 0,
    Visible = 1,
    Hidden = 2
  );
  PCompositionBackfaceVisibility = ^CompositionBackfaceVisibility;

  // Windows.UI.Composition.CompositionBitmapInterpolationMode
  CompositionBitmapInterpolationMode = (
    NearestNeighbor = 0,
    Linear = 1
  );
  PCompositionBitmapInterpolationMode = ^CompositionBitmapInterpolationMode;

  // Windows.UI.Composition.CompositionBorderMode
  CompositionBorderMode = (
    Inherit = 0,
    Soft = 1,
    Hard = 2
  );
  PCompositionBorderMode = ^CompositionBorderMode;

  // Windows.UI.Composition.CompositionColorSpace
  CompositionColorSpace = (
    Auto = 0,
    Hsl = 1,
    Rgb = 2,
    HslLinear = 3,
    RgbLinear = 4
  );
  PCompositionColorSpace = ^CompositionColorSpace;

  // Windows.UI.Composition.CompositionCompositeMode
  CompositionCompositeMode = (
    Inherit = 0,
    SourceOver = 1,
    DestinationInvert = 2,
    MinBlend = 3
  );
  PCompositionCompositeMode = ^CompositionCompositeMode;

  // Windows.UI.Composition.CompositionDropShadowSourcePolicy
  CompositionDropShadowSourcePolicy = (
    Default = 0,
    InheritFromVisualContent = 1
  );
  PCompositionDropShadowSourcePolicy = ^CompositionDropShadowSourcePolicy;

  // Windows.UI.Composition.CompositionEffectFactoryLoadStatus
  CompositionEffectFactoryLoadStatus = (
    Success = 0,
    EffectTooComplex = 1,
    Pending = 2,
    Other = -1
  );
  PCompositionEffectFactoryLoadStatus = ^CompositionEffectFactoryLoadStatus;

  // Windows.UI.Composition.CompositionGetValueStatus
  CompositionGetValueStatus = (
    Succeeded = 0,
    TypeMismatch = 1,
    NotFound = 2
  );
  PCompositionGetValueStatus = ^CompositionGetValueStatus;

  // Windows.UI.Composition.CompositionGradientExtendMode
  CompositionGradientExtendMode = (
    Clamp = 0,
    Wrap = 1,
    Mirror = 2
  );
  PCompositionGradientExtendMode = ^CompositionGradientExtendMode;

  // Windows.UI.Composition.CompositionStretch
  CompositionStretch = (
    None = 0,
    Fill = 1,
    Uniform = 2,
    UniformToFill = 3
  );
  PCompositionStretch = ^CompositionStretch;

  // Windows.UI.Core.AppViewBackButtonVisibility
  AppViewBackButtonVisibility = (
    Visible = 0,
    Collapsed = 1
  );
  PAppViewBackButtonVisibility = ^AppViewBackButtonVisibility;

  // Windows.UI.Core.CoreWindowActivationState
  CoreWindowActivationState = (
    CodeActivated = 0,
    Deactivated = 1,
    PointerActivated = 2
  );
  PCoreWindowActivationState = ^CoreWindowActivationState;

  // Windows.UI.Core.CoreWindowActivationMode
  CoreWindowActivationMode = (
    None = 0,
    Deactivated = 1,
    ActivatedNotForeground = 2,
    ActivatedInForeground = 3
  );
  PCoreWindowActivationMode = ^CoreWindowActivationMode;

  // Windows.UI.Core.CoreCursorType
  CoreCursorType = (
    Arrow = 0,
    Cross = 1,
    Custom = 2,
    Hand = 3,
    Help = 4,
    IBeam = 5,
    SizeAll = 6,
    SizeNortheastSouthwest = 7,
    SizeNorthSouth = 8,
    SizeNorthwestSoutheast = 9,
    SizeWestEast = 10,
    UniversalNo = 11,
    UpArrow = 12,
    Wait = 13,
    Pin = 14,
    Person = 15
  );
  PCoreCursorType = ^CoreCursorType;

  // Windows.UI.Core.CoreDispatcherPriority
  CoreDispatcherPriority = (
    Idle = -2,
    Low = -1,
    Normal = 0,
    High = 1
  );
  PCoreDispatcherPriority = ^CoreDispatcherPriority;

  // Windows.UI.Core.CoreProcessEventsOption
  CoreProcessEventsOption = (
    ProcessOneAndAllPending = 0,
    ProcessOneIfPresent = 1,
    ProcessUntilQuit = 2,
    ProcessAllIfPresent = 3
  );
  PCoreProcessEventsOption = ^CoreProcessEventsOption;

  // Windows.UI.Core.CoreWindowFlowDirection
  CoreWindowFlowDirection = (
    LeftToRight = 0,
    RightToLeft = 1
  );
  PCoreWindowFlowDirection = ^CoreWindowFlowDirection;

  // Windows.UI.Core.CoreVirtualKeyStates
  CoreVirtualKeyStates = (
    None = 0,
    Down = 1,
    Locked = 2
  );
  PCoreVirtualKeyStates = ^CoreVirtualKeyStates;

  // Windows.UI.Core.CoreAcceleratorKeyEventType
  CoreAcceleratorKeyEventType = (
    Character = 2,
    DeadCharacter = 3,
    KeyDown = 0,
    KeyUp = 1,
    SystemCharacter = 6,
    SystemDeadCharacter = 7,
    SystemKeyDown = 4,
    SystemKeyUp = 5,
    UnicodeCharacter = 8
  );
  PCoreAcceleratorKeyEventType = ^CoreAcceleratorKeyEventType;

  // Windows.UI.Core.CoreProximityEvaluationScore
  CoreProximityEvaluationScore = (
    Closest = 0,
    Farthest = 2147483647
  );
  PCoreProximityEvaluationScore = ^CoreProximityEvaluationScore;

  // Windows.UI.Core.CoreInputDeviceTypes
  CoreInputDeviceTypes = (
    None = 0,
    Touch = 1,
    Pen = 2,
    Mouse = 4
  );
  PCoreInputDeviceTypes = ^CoreInputDeviceTypes;

  // Windows.UI.Core.AnimationMetrics.PropertyAnimationType
  AnimationMetrics_PropertyAnimationType = (
    Scale = 0,
    Translation = 1,
    Opacity = 2
  );
  PAnimationMetrics_PropertyAnimationType = ^AnimationMetrics_PropertyAnimationType;

  // Windows.UI.Core.AnimationMetrics.AnimationEffect
  AnimationMetrics_AnimationEffect = (
    Expand = 0,
    Collapse = 1,
    Reposition = 2,
    FadeIn = 3,
    FadeOut = 4,
    AddToList = 5,
    DeleteFromList = 6,
    AddToGrid = 7,
    DeleteFromGrid = 8,
    AddToSearchGrid = 9,
    DeleteFromSearchGrid = 10,
    AddToSearchList = 11,
    DeleteFromSearchList = 12,
    ShowEdgeUI = 13,
    ShowPanel = 14,
    HideEdgeUI = 15,
    HidePanel = 16,
    ShowPopup = 17,
    HidePopup = 18,
    PointerDown = 19,
    PointerUp = 20,
    DragSourceStart = 21,
    DragSourceEnd = 22,
    TransitionContent = 23,
    Reveal = 24,
    Hide = 25,
    DragBetweenEnter = 26,
    DragBetweenLeave = 27,
    SwipeSelect = 28,
    SwipeDeselect = 29,
    SwipeReveal = 30,
    EnterPage = 31,
    TransitionPage = 32,
    CrossFade = 33,
    Peek = 34,
    UpdateBadge = 35
  );
  PAnimationMetrics_AnimationEffect = ^AnimationMetrics_AnimationEffect;

  // Windows.UI.Core.AnimationMetrics.AnimationEffectTarget
  AnimationMetrics_AnimationEffectTarget = (
    Primary = 0,
    Added = 1,
    Affected = 2,
    Background = 3,
    Content = 4,
    Deleted = 5,
    Deselected = 6,
    DragSource = 7,
    Hidden = 8,
    Incoming = 9,
    Outgoing = 10,
    Outline = 11,
    Remaining = 12,
    Revealed = 13,
    RowIn = 14,
    RowOut = 15,
    Selected = 16,
    Selection = 17,
    Shown = 18,
    Tapped = 19
  );
  PAnimationMetrics_AnimationEffectTarget = ^AnimationMetrics_AnimationEffectTarget;

  // Windows.UI.Input.Inking.Analysis.InkAnalysisDrawingKind
  Analysis_InkAnalysisDrawingKind = (
    Drawing = 0,
    Circle = 1,
    Ellipse = 2,
    Triangle = 3,
    IsoscelesTriangle = 4,
    EquilateralTriangle = 5,
    RightTriangle = 6,
    Quadrilateral = 7,
    Rectangle = 8,
    Square = 9,
    Diamond = 10,
    Trapezoid = 11,
    Parallelogram = 12,
    Pentagon = 13,
    Hexagon = 14
  );
  PAnalysis_InkAnalysisDrawingKind = ^Analysis_InkAnalysisDrawingKind;

  // Windows.UI.Input.Inking.Analysis.InkAnalysisNodeKind
  Analysis_InkAnalysisNodeKind = (
    UnclassifiedInk = 0,
    Root = 1,
    WritingRegion = 2,
    Paragraph = 3,
    Line = 4,
    InkWord = 5,
    InkBullet = 6,
    InkDrawing = 7,
    ListItem = 8
  );
  PAnalysis_InkAnalysisNodeKind = ^Analysis_InkAnalysisNodeKind;

  // Windows.UI.Input.Inking.Analysis.InkAnalysisStatus
  Analysis_InkAnalysisStatus = (
    Updated = 0,
    Unchanged = 1
  );
  PAnalysis_InkAnalysisStatus = ^Analysis_InkAnalysisStatus;

  // Windows.UI.Input.Inking.Analysis.InkAnalysisStrokeKind
  Analysis_InkAnalysisStrokeKind = (
    Auto = 0,
    Writing = 1,
    Drawing = 2
  );
  PAnalysis_InkAnalysisStrokeKind = ^Analysis_InkAnalysisStrokeKind;

  // Windows.UI.Input.Inking.InkPresenterPredefinedConfiguration
  InkPresenterPredefinedConfiguration = (
    SimpleSinglePointer = 0,
    SimpleMultiplePointer = 1
  );
  PInkPresenterPredefinedConfiguration = ^InkPresenterPredefinedConfiguration;

  // Windows.UI.Input.Inking.InkInputRightDragAction
  InkInputRightDragAction = (
    LeaveUnprocessed = 0,
    AllowProcessing = 1
  );
  PInkInputRightDragAction = ^InkInputRightDragAction;

  // Windows.UI.Input.Inking.InkInputProcessingMode
  InkInputProcessingMode = (
    None = 0,
    Inking = 1,
    Erasing = 2
  );
  PInkInputProcessingMode = ^InkInputProcessingMode;

  // Windows.UI.Input.Inking.InkPresenterStencilKind
  InkPresenterStencilKind = (
    Other = 0,
    Ruler = 1,
    Protractor = 2
  );
  PInkPresenterStencilKind = ^InkPresenterStencilKind;

  // Windows.UI.Input.Inking.InkHighContrastAdjustment
  InkHighContrastAdjustment = (
    UseSystemColorsWhenNecessary = 0,
    UseSystemColors = 1,
    UseOriginalColors = 2
  );
  PInkHighContrastAdjustment = ^InkHighContrastAdjustment;

  // Windows.UI.Input.Inking.Core.CoreWetStrokeDisposition
  Core_CoreWetStrokeDisposition = (
    Inking = 0,
    Completed = 1,
    Canceled = 2
  );
  PCore_CoreWetStrokeDisposition = ^Core_CoreWetStrokeDisposition;

  // Windows.UI.Input.Inking.InkManipulationMode
  InkManipulationMode = (
    Inking = 0,
    Erasing = 1,
    Selecting = 2
  );
  PInkManipulationMode = ^InkManipulationMode;

  // Windows.UI.Input.Inking.InkRecognitionTarget
  InkRecognitionTarget = (
    All = 0,
    Selected = 1,
    Recent = 2
  );
  PInkRecognitionTarget = ^InkRecognitionTarget;

  // Windows.UI.Input.Inking.PenTipShape
  PenTipShape = (
    Circle = 0,
    Rectangle = 1
  );
  PPenTipShape = ^PenTipShape;

  // Windows.UI.Input.Inking.InkDrawingAttributesKind
  InkDrawingAttributesKind = (
    Default = 0,
    Pencil = 1
  );
  PInkDrawingAttributesKind = ^InkDrawingAttributesKind;

  // Windows.UI.Input.Inking.InkPersistenceFormat
  InkPersistenceFormat = (
    GifWithEmbeddedIsf = 0,
    Isf = 1
  );
  PInkPersistenceFormat = ^InkPersistenceFormat;

  // Windows.UI.Input.Preview.Injection.InjectedInputTouchParameters
  Preview_Injection_InjectedInputTouchParameters = (
    None = 0,
    Contact = 1,
    Orientation = 2,
    Pressure = 4
  );
  PPreview_Injection_InjectedInputTouchParameters = ^Preview_Injection_InjectedInputTouchParameters;

  // Windows.UI.Input.Preview.Injection.InjectedInputPointerOptions
  Preview_Injection_InjectedInputPointerOptions = (
    None = 0,
    New = 1,
    InRange = 2,
    InContact = 4,
    FirstButton = 16,
    SecondButton = 32,
    Primary = 8192,
    Confidence = 16384,
    Canceled = 32768,
    PointerDown = 65536,
    Update = 131072,
    PointerUp = 262144,
    CaptureChanged = 2097152
  );
  PPreview_Injection_InjectedInputPointerOptions = ^Preview_Injection_InjectedInputPointerOptions;

  // Windows.UI.Input.Preview.Injection.InjectedInputButtonChangeKind
  Preview_Injection_InjectedInputButtonChangeKind = (
    None = 0,
    FirstButtonDown = 1,
    FirstButtonUp = 2,
    SecondButtonDown = 3,
    SecondButtonUp = 4,
    ThirdButtonDown = 5,
    ThirdButtonUp = 6,
    FourthButtonDown = 7,
    FourthButtonUp = 8,
    FifthButtonDown = 9,
    FifthButtonUp = 10
  );
  PPreview_Injection_InjectedInputButtonChangeKind = ^Preview_Injection_InjectedInputButtonChangeKind;

  // Windows.UI.Input.Preview.Injection.InjectedInputPenButtons
  Preview_Injection_InjectedInputPenButtons = (
    None = 0,
    Barrel = 1,
    Inverted = 2,
    Eraser = 4
  );
  PPreview_Injection_InjectedInputPenButtons = ^Preview_Injection_InjectedInputPenButtons;

  // Windows.UI.Input.Preview.Injection.InjectedInputPenParameters
  Preview_Injection_InjectedInputPenParameters = (
    None = 0,
    Pressure = 1,
    Rotation = 2,
    TiltX = 4,
    TiltY = 8
  );
  PPreview_Injection_InjectedInputPenParameters = ^Preview_Injection_InjectedInputPenParameters;

  // Windows.UI.Input.Preview.Injection.InjectedInputMouseOptions
  Preview_Injection_InjectedInputMouseOptions = (
    None = 0,
    Move = 1,
    LeftDown = 2,
    LeftUp = 4,
    RightDown = 8,
    RightUp = 16,
    MiddleDown = 32,
    MiddleUp = 64,
    XDown = 128,
    XUp = 256,
    Wheel = 2048,
    HWheel = 4096,
    MoveNoCoalesce = 8192,
    VirtualDesk = 16384,
    Absolute = 32768
  );
  PPreview_Injection_InjectedInputMouseOptions = ^Preview_Injection_InjectedInputMouseOptions;

  // Windows.UI.Input.Preview.Injection.InjectedInputKeyOptions
  Preview_Injection_InjectedInputKeyOptions = (
    None = 0,
    ExtendedKey = 1,
    KeyUp = 2,
    ScanCode = 8,
    Unicode = 4
  );
  PPreview_Injection_InjectedInputKeyOptions = ^Preview_Injection_InjectedInputKeyOptions;

  // Windows.UI.Input.Preview.Injection.InjectedInputShortcut
  Preview_Injection_InjectedInputShortcut = (
    Back = 0,
    Start = 1,
    Search = 2
  );
  PPreview_Injection_InjectedInputShortcut = ^Preview_Injection_InjectedInputShortcut;

  // Windows.UI.Input.Preview.Injection.InjectedInputVisualizationMode
  Preview_Injection_InjectedInputVisualizationMode = (
    None = 0,
    Default = 1,
    Indirect = 2
  );
  PPreview_Injection_InjectedInputVisualizationMode = ^Preview_Injection_InjectedInputVisualizationMode;

  // Windows.UI.Input.EdgeGestureKind
  EdgeGestureKind = (
    Touch = 0,
    Keyboard = 1,
    Mouse = 2
  );
  PEdgeGestureKind = ^EdgeGestureKind;

  // Windows.UI.Input.Spatial.SpatialGestureSettings
  Spatial_SpatialGestureSettings = (
    None = 0,
    Tap = 1,
    DoubleTap = 2,
    Hold = 4,
    ManipulationTranslate = 8,
    NavigationX = 16,
    NavigationY = 32,
    NavigationZ = 64,
    NavigationRailsX = 128,
    NavigationRailsY = 256,
    NavigationRailsZ = 512
  );
  PSpatial_SpatialGestureSettings = ^Spatial_SpatialGestureSettings;

  // Windows.UI.Input.HoldingState
  HoldingState = (
    Started = 0,
    Completed = 1,
    Canceled = 2
  );
  PHoldingState = ^HoldingState;

  // Windows.UI.Input.DraggingState
  DraggingState = (
    Started = 0,
    Continuing = 1,
    Completed = 2
  );
  PDraggingState = ^DraggingState;

  // Windows.UI.Input.CrossSlidingState
  CrossSlidingState = (
    Started = 0,
    Dragging = 1,
    Selecting = 2,
    SelectSpeedBumping = 3,
    SpeedBumping = 4,
    Rearranging = 5,
    Completed = 6
  );
  PCrossSlidingState = ^CrossSlidingState;

  // Windows.UI.Input.GestureSettings
  GestureSettings = (
    None = 0,
    Tap = 1,
    DoubleTap = 2,
    Hold = 4,
    HoldWithMouse = 8,
    RightTap = 16,
    Drag = 32,
    ManipulationTranslateX = 64,
    ManipulationTranslateY = 128,
    ManipulationTranslateRailsX = 256,
    ManipulationTranslateRailsY = 512,
    ManipulationRotate = 1024,
    ManipulationScale = 2048,
    ManipulationTranslateInertia = 4096,
    ManipulationRotateInertia = 8192,
    ManipulationScaleInertia = 16384,
    CrossSlide = 32768,
    ManipulationMultipleFingerPanning = 65536
  );
  PGestureSettings = ^GestureSettings;

  // Windows.UI.Input.PointerUpdateKind
  PointerUpdateKind = (
    Other = 0,
    LeftButtonPressed = 1,
    LeftButtonReleased = 2,
    RightButtonPressed = 3,
    RightButtonReleased = 4,
    MiddleButtonPressed = 5,
    MiddleButtonReleased = 6,
    XButton1Pressed = 7,
    XButton1Released = 8,
    XButton2Pressed = 9,
    XButton2Released = 10
  );
  PPointerUpdateKind = ^PointerUpdateKind;

  // Windows.UI.Input.RadialControllerSystemMenuItemKind
  RadialControllerSystemMenuItemKind = (
    Scroll = 0,
    Zoom = 1,
    UndoRedo = 2,
    Volume = 3,
    NextPreviousTrack = 4
  );
  PRadialControllerSystemMenuItemKind = ^RadialControllerSystemMenuItemKind;

  // Windows.UI.Input.RadialControllerMenuKnownIcon
  RadialControllerMenuKnownIcon = (
    Scroll = 0,
    Zoom = 1,
    UndoRedo = 2,
    Volume = 3,
    NextPreviousTrack = 4,
    Ruler = 5,
    InkColor = 6,
    InkThickness = 7,
    PenType = 8
  );
  PRadialControllerMenuKnownIcon = ^RadialControllerMenuKnownIcon;

  // Windows.UI.Input.Spatial.SpatialInteractionSourceKind
  Spatial_SpatialInteractionSourceKind = (
    Other = 0,
    Hand = 1,
    Voice = 2,
    Controller = 3
  );
  PSpatial_SpatialInteractionSourceKind = ^Spatial_SpatialInteractionSourceKind;

  // Windows.UI.Input.Spatial.SpatialInteractionPressKind
  Spatial_SpatialInteractionPressKind = (
    None = 0,
    Select = 1,
    Menu = 2,
    Grasp = 3,
    Touchpad = 4,
    Thumbstick = 5
  );
  PSpatial_SpatialInteractionPressKind = ^Spatial_SpatialInteractionPressKind;

  // Windows.UI.Input.Spatial.SpatialInteractionSourceHandedness
  Spatial_SpatialInteractionSourceHandedness = (
    Unspecified = 0,
    Left = 1,
    Right = 2
  );
  PSpatial_SpatialInteractionSourceHandedness = ^Spatial_SpatialInteractionSourceHandedness;

  // Windows.UI.Input.Spatial.SpatialInteractionSourcePositionAccuracy
  Spatial_SpatialInteractionSourcePositionAccuracy = (
    High = 0,
    Approximate = 1
  );
  PSpatial_SpatialInteractionSourcePositionAccuracy = ^Spatial_SpatialInteractionSourcePositionAccuracy;

  // Windows.UI.Notifications.NotificationSetting
  NotificationSetting = (
    Enabled = 0,
    DisabledForApplication = 1,
    DisabledForUser = 2,
    DisabledByGroupPolicy = 3,
    DisabledByManifest = 4
  );
  PNotificationSetting = ^NotificationSetting;

  // Windows.UI.Notifications.ToastDismissalReason
  ToastDismissalReason = (
    UserCanceled = 0,
    ApplicationHidden = 1,
    TimedOut = 2
  );
  PToastDismissalReason = ^ToastDismissalReason;

  // Windows.UI.Notifications.BadgeTemplateType
  BadgeTemplateType = (
    BadgeGlyph = 0,
    BadgeNumber = 1
  );
  PBadgeTemplateType = ^BadgeTemplateType;

  // Windows.UI.Notifications.TileFlyoutTemplateType
  TileFlyoutTemplateType = (
    TileFlyoutTemplate01 = 0
  );
  PTileFlyoutTemplateType = ^TileFlyoutTemplateType;

  // Windows.UI.Notifications.TileTemplateType
  TileTemplateType = (
    TileSquareImage = 0,
    TileSquareBlock = 1,
    TileSquareText01 = 2,
    TileSquareText02 = 3,
    TileSquareText03 = 4,
    TileSquareText04 = 5,
    TileSquarePeekImageAndText01 = 6,
    TileSquarePeekImageAndText02 = 7,
    TileSquarePeekImageAndText03 = 8,
    TileSquarePeekImageAndText04 = 9,
    TileWideImage = 10,
    TileWideImageCollection = 11,
    TileWideImageAndText01 = 12,
    TileWideImageAndText02 = 13,
    TileWideBlockAndText01 = 14,
    TileWideBlockAndText02 = 15,
    TileWidePeekImageCollection01 = 16,
    TileWidePeekImageCollection02 = 17,
    TileWidePeekImageCollection03 = 18,
    TileWidePeekImageCollection04 = 19,
    TileWidePeekImageCollection05 = 20,
    TileWidePeekImageCollection06 = 21,
    TileWidePeekImageAndText01 = 22,
    TileWidePeekImageAndText02 = 23,
    TileWidePeekImage01 = 24,
    TileWidePeekImage02 = 25,
    TileWidePeekImage03 = 26,
    TileWidePeekImage04 = 27,
    TileWidePeekImage05 = 28,
    TileWidePeekImage06 = 29,
    TileWideSmallImageAndText01 = 30,
    TileWideSmallImageAndText02 = 31,
    TileWideSmallImageAndText03 = 32,
    TileWideSmallImageAndText04 = 33,
    TileWideSmallImageAndText05 = 34,
    TileWideText01 = 35,
    TileWideText02 = 36,
    TileWideText03 = 37,
    TileWideText04 = 38,
    TileWideText05 = 39,
    TileWideText06 = 40,
    TileWideText07 = 41,
    TileWideText08 = 42,
    TileWideText09 = 43,
    TileWideText10 = 44,
    TileWideText11 = 45,
    TileSquare150x150Image = 0,
    TileSquare150x150Block = 1,
    TileSquare150x150Text01 = 2,
    TileSquare150x150Text02 = 3,
    TileSquare150x150Text03 = 4,
    TileSquare150x150Text04 = 5,
    TileSquare150x150PeekImageAndText01 = 6,
    TileSquare150x150PeekImageAndText02 = 7,
    TileSquare150x150PeekImageAndText03 = 8,
    TileSquare150x150PeekImageAndText04 = 9,
    TileWide310x150Image = 10,
    TileWide310x150ImageCollection = 11,
    TileWide310x150ImageAndText01 = 12,
    TileWide310x150ImageAndText02 = 13,
    TileWide310x150BlockAndText01 = 14,
    TileWide310x150BlockAndText02 = 15,
    TileWide310x150PeekImageCollection01 = 16,
    TileWide310x150PeekImageCollection02 = 17,
    TileWide310x150PeekImageCollection03 = 18,
    TileWide310x150PeekImageCollection04 = 19,
    TileWide310x150PeekImageCollection05 = 20,
    TileWide310x150PeekImageCollection06 = 21,
    TileWide310x150PeekImageAndText01 = 22,
    TileWide310x150PeekImageAndText02 = 23,
    TileWide310x150PeekImage01 = 24,
    TileWide310x150PeekImage02 = 25,
    TileWide310x150PeekImage03 = 26,
    TileWide310x150PeekImage04 = 27,
    TileWide310x150PeekImage05 = 28,
    TileWide310x150PeekImage06 = 29,
    TileWide310x150SmallImageAndText01 = 30,
    TileWide310x150SmallImageAndText02 = 31,
    TileWide310x150SmallImageAndText03 = 32,
    TileWide310x150SmallImageAndText04 = 33,
    TileWide310x150SmallImageAndText05 = 34,
    TileWide310x150Text01 = 35,
    TileWide310x150Text02 = 36,
    TileWide310x150Text03 = 37,
    TileWide310x150Text04 = 38,
    TileWide310x150Text05 = 39,
    TileWide310x150Text06 = 40,
    TileWide310x150Text07 = 41,
    TileWide310x150Text08 = 42,
    TileWide310x150Text09 = 43,
    TileWide310x150Text10 = 44,
    TileWide310x150Text11 = 45,
    TileSquare310x310BlockAndText01 = 46,
    TileSquare310x310BlockAndText02 = 47,
    TileSquare310x310Image = 48,
    TileSquare310x310ImageAndText01 = 49,
    TileSquare310x310ImageAndText02 = 50,
    TileSquare310x310ImageAndTextOverlay01 = 51,
    TileSquare310x310ImageAndTextOverlay02 = 52,
    TileSquare310x310ImageAndTextOverlay03 = 53,
    TileSquare310x310ImageCollectionAndText01 = 54,
    TileSquare310x310ImageCollectionAndText02 = 55,
    TileSquare310x310ImageCollection = 56,
    TileSquare310x310SmallImagesAndTextList01 = 57,
    TileSquare310x310SmallImagesAndTextList02 = 58,
    TileSquare310x310SmallImagesAndTextList03 = 59,
    TileSquare310x310SmallImagesAndTextList04 = 60,
    TileSquare310x310Text01 = 61,
    TileSquare310x310Text02 = 62,
    TileSquare310x310Text03 = 63,
    TileSquare310x310Text04 = 64,
    TileSquare310x310Text05 = 65,
    TileSquare310x310Text06 = 66,
    TileSquare310x310Text07 = 67,
    TileSquare310x310Text08 = 68,
    TileSquare310x310TextList01 = 69,
    TileSquare310x310TextList02 = 70,
    TileSquare310x310TextList03 = 71,
    TileSquare310x310SmallImageAndText01 = 72,
    TileSquare310x310SmallImagesAndTextList05 = 73,
    TileSquare310x310Text09 = 74,
    TileSquare71x71IconWithBadge = 75,
    TileSquare150x150IconWithBadge = 76,
    TileWide310x150IconWithBadgeAndText = 77,
    TileSquare71x71Image = 78,
    TileTall150x310Image = 79
  );
  PTileTemplateType = ^TileTemplateType;

  // Windows.UI.Notifications.ToastTemplateType
  ToastTemplateType = (
    ToastImageAndText01 = 0,
    ToastImageAndText02 = 1,
    ToastImageAndText03 = 2,
    ToastImageAndText04 = 3,
    ToastText01 = 4,
    ToastText02 = 5,
    ToastText03 = 6,
    ToastText04 = 7
  );
  PToastTemplateType = ^ToastTemplateType;

  // Windows.UI.Notifications.PeriodicUpdateRecurrence
  PeriodicUpdateRecurrence = (
    HalfHour = 0,
    Hour = 1,
    SixHours = 2,
    TwelveHours = 3,
    Daily = 4
  );
  PPeriodicUpdateRecurrence = ^PeriodicUpdateRecurrence;

  // Windows.UI.Notifications.ToastHistoryChangedType
  ToastHistoryChangedType = (
    Cleared = 0,
    Removed = 1,
    Expired = 2,
    Added = 3
  );
  PToastHistoryChangedType = ^ToastHistoryChangedType;

  // Windows.UI.Notifications.AdaptiveNotificationContentKind
  AdaptiveNotificationContentKind = (
    Text = 0
  );
  PAdaptiveNotificationContentKind = ^AdaptiveNotificationContentKind;

  // Windows.UI.Notifications.NotificationMirroring
  NotificationMirroring = (
    Allowed = 0,
    Disabled = 1
  );
  PNotificationMirroring = ^NotificationMirroring;

  // Windows.UI.Notifications.NotificationKinds
  NotificationKinds = (
    Unknown = 0,
    Toast = 1
  );
  PNotificationKinds = ^NotificationKinds;

  // Windows.UI.Notifications.UserNotificationChangedKind
  UserNotificationChangedKind = (
    Added = 0,
    Removed = 1
  );
  PUserNotificationChangedKind = ^UserNotificationChangedKind;

  // Windows.UI.Notifications.NotificationUpdateResult
  NotificationUpdateResult = (
    Succeeded = 0,
    Failed = 1,
    NotificationNotFound = 2
  );
  PNotificationUpdateResult = ^NotificationUpdateResult;

  // Windows.UI.Notifications.ToastNotificationPriority
  ToastNotificationPriority = (
    Default = 0,
    High = 1
  );
  PToastNotificationPriority = ^ToastNotificationPriority;

  // Windows.UI.Notifications.Management.UserNotificationListenerAccessStatus
  Management_UserNotificationListenerAccessStatus = (
    Unspecified = 0,
    Allowed = 1,
    Denied = 2
  );
  PManagement_UserNotificationListenerAccessStatus = ^Management_UserNotificationListenerAccessStatus;

  // Windows.UI.Text.Core.CoreTextInputScope
  Core_CoreTextInputScope = (
    Default = 0,
    Url = 1,
    FilePath = 2,
    FileName = 3,
    EmailUserName = 4,
    EmailAddress = 5,
    UserName = 6,
    PersonalFullName = 7,
    PersonalNamePrefix = 8,
    PersonalGivenName = 9,
    PersonalMiddleName = 10,
    PersonalSurname = 11,
    PersonalNameSuffix = 12,
    Address = 13,
    AddressPostalCode = 14,
    AddressStreet = 15,
    AddressStateOrProvince = 16,
    AddressCity = 17,
    AddressCountryName = 18,
    AddressCountryShortName = 19,
    CurrencyAmountAndSymbol = 20,
    CurrencyAmount = 21,
    Date = 22,
    DateMonth = 23,
    DateDay = 24,
    DateYear = 25,
    DateMonthName = 26,
    DateDayName = 27,
    Number = 29,
    SingleCharacter = 30,
    Password = 31,
    TelephoneNumber = 32,
    TelephoneCountryCode = 33,
    TelephoneAreaCode = 34,
    TelephoneLocalNumber = 35,
    Time = 36,
    TimeHour = 37,
    TimeMinuteOrSecond = 38,
    NumberFullWidth = 39,
    AlphanumericHalfWidth = 40,
    AlphanumericFullWidth = 41,
    CurrencyChinese = 42,
    Bopomofo = 43,
    Hiragana = 44,
    KatakanaHalfWidth = 45,
    KatakanaFullWidth = 46,
    Hanja = 47,
    HangulHalfWidth = 48,
    HangulFullWidth = 49,
    Search = 50,
    Formula = 51,
    SearchIncremental = 52,
    ChineseHalfWidth = 53,
    ChineseFullWidth = 54,
    NativeScript = 55,
    Text = 57,
    Chat = 58,
    NameOrPhoneNumber = 59,
    EmailUserNameOrAddress = 60,
    Private = 61,
    Maps = 62,
    PasswordNumeric = 63,
    FormulaNumber = 67,
    ChatWithoutEmoji = 68,
    Digits = 28,
    PinNumeric = 64,
    PinAlphanumeric = 65
  );
  PCore_CoreTextInputScope = ^Core_CoreTextInputScope;

  // Windows.UI.Text.Core.CoreTextInputPaneDisplayPolicy
  Core_CoreTextInputPaneDisplayPolicy = (
    Automatic = 0,
    Manual = 1
  );
  PCore_CoreTextInputPaneDisplayPolicy = ^Core_CoreTextInputPaneDisplayPolicy;

  // Windows.UI.Text.Core.CoreTextTextUpdatingResult
  Core_CoreTextTextUpdatingResult = (
    Succeeded = 0,
    Failed = 1
  );
  PCore_CoreTextTextUpdatingResult = ^Core_CoreTextTextUpdatingResult;

  // Windows.UI.Text.Core.CoreTextSelectionUpdatingResult
  Core_CoreTextSelectionUpdatingResult = (
    Succeeded = 0,
    Failed = 1
  );
  PCore_CoreTextSelectionUpdatingResult = ^Core_CoreTextSelectionUpdatingResult;

  // Windows.UI.Text.Core.CoreTextFormatUpdatingResult
  Core_CoreTextFormatUpdatingResult = (
    Succeeded = 0,
    Failed = 1
  );
  PCore_CoreTextFormatUpdatingResult = ^Core_CoreTextFormatUpdatingResult;

  // Windows.UI.Text.Core.CoreTextFormatUpdatingReason
  Core_CoreTextFormatUpdatingReason = (
    None = 0,
    CompositionUnconverted = 1,
    CompositionConverted = 2,
    CompositionTargetUnconverted = 3,
    CompositionTargetConverted = 4
  );
  PCore_CoreTextFormatUpdatingReason = ^Core_CoreTextFormatUpdatingReason;

  // Windows.UI.Text.CaretType
  CaretType = (
    Normal = 0,
    Null = 1
  );
  PCaretType = ^CaretType;

  // Windows.UI.Text.FindOptions
  FindOptions = (
    None = 0,
    Word = 2,
    &Case = 4
  );
  PFindOptions = ^FindOptions;

  // Windows.UI.Text.FormatEffect
  FormatEffect = (
    Off = 0,
    On = 1,
    Toggle = 2,
    Undefined = 3
  );
  PFormatEffect = ^FormatEffect;

  // Windows.UI.Text.HorizontalCharacterAlignment
  HorizontalCharacterAlignment = (
    Left = 0,
    Right = 1,
    Center = 2
  );
  PHorizontalCharacterAlignment = ^HorizontalCharacterAlignment;

  // Windows.UI.Text.LetterCase
  LetterCase = (
    Lower = 0,
    Upper = 1
  );
  PLetterCase = ^LetterCase;

  // Windows.UI.Text.LineSpacingRule
  LineSpacingRule = (
    Undefined = 0,
    Single = 1,
    OneAndHalf = 2,
    Double = 3,
    AtLeast = 4,
    Exactly = 5,
    Multiple = 6,
    Percent = 7
  );
  PLineSpacingRule = ^LineSpacingRule;

  // Windows.UI.Text.LinkType
  LinkType = (
    Undefined = 0,
    NotALink = 1,
    ClientLink = 2,
    FriendlyLinkName = 3,
    FriendlyLinkAddress = 4,
    AutoLink = 5,
    AutoLinkEmail = 6,
    AutoLinkPhone = 7,
    AutoLinkPath = 8
  );
  PLinkType = ^LinkType;

  // Windows.UI.Text.MarkerAlignment
  MarkerAlignment = (
    Undefined = 0,
    Left = 1,
    Center = 2,
    Right = 3
  );
  PMarkerAlignment = ^MarkerAlignment;

  // Windows.UI.Text.MarkerStyle
  MarkerStyle = (
    Undefined = 0,
    Parenthesis = 1,
    Parentheses = 2,
    Period = 3,
    Plain = 4,
    Minus = 5,
    NoNumber = 6
  );
  PMarkerStyle = ^MarkerStyle;

  // Windows.UI.Text.MarkerType
  MarkerType = (
    Undefined = 0,
    None = 1,
    Bullet = 2,
    Arabic = 3,
    LowercaseEnglishLetter = 4,
    UppercaseEnglishLetter = 5,
    LowercaseRoman = 6,
    UppercaseRoman = 7,
    UnicodeSequence = 8,
    CircledNumber = 9,
    BlackCircleWingding = 10,
    WhiteCircleWingding = 11,
    ArabicWide = 12,
    SimplifiedChinese = 13,
    TraditionalChinese = 14,
    JapanSimplifiedChinese = 15,
    JapanKorea = 16,
    ArabicDictionary = 17,
    ArabicAbjad = 18,
    Hebrew = 19,
    ThaiAlphabetic = 20,
    ThaiNumeric = 21,
    DevanagariVowel = 22,
    DevanagariConsonant = 23,
    DevanagariNumeric = 24
  );
  PMarkerType = ^MarkerType;

  // Windows.UI.Text.ParagraphAlignment
  ParagraphAlignment = (
    Undefined = 0,
    Left = 1,
    Center = 2,
    Right = 3,
    Justify = 4
  );
  PParagraphAlignment = ^ParagraphAlignment;

  // Windows.UI.Text.ParagraphStyle
  ParagraphStyle = (
    Undefined = 0,
    None = 1,
    Normal = 2,
    Heading1 = 3,
    Heading2 = 4,
    Heading3 = 5,
    Heading4 = 6,
    Heading5 = 7,
    Heading6 = 8,
    Heading7 = 9,
    Heading8 = 10,
    Heading9 = 11
  );
  PParagraphStyle = ^ParagraphStyle;

  // Windows.UI.Text.PointOptions
  PointOptions = (
    None = 0,
    IncludeInset = 1,
    Start = 32,
    ClientCoordinates = 256,
    AllowOffClient = 512,
    Transform = 1024,
    NoHorizontalScroll = 65536,
    NoVerticalScroll = 262144
  );
  PPointOptions = ^PointOptions;

  // Windows.UI.Text.RangeGravity
  RangeGravity = (
    UIBehavior = 0,
    Backward = 1,
    Forward = 2,
    Inward = 3,
    Outward = 4
  );
  PRangeGravity = ^RangeGravity;

  // Windows.UI.Text.SelectionOptions
  SelectionOptions = (
    StartActive = 1,
    AtEndOfLine = 2,
    Overtype = 4,
    Active = 8,
    Replace = 16
  );
  PSelectionOptions = ^SelectionOptions;

  // Windows.UI.Text.SelectionType
  SelectionType = (
    None = 0,
    InsertionPoint = 1,
    Normal = 2,
    InlineShape = 7,
    Shape = 8
  );
  PSelectionType = ^SelectionType;

  // Windows.UI.Text.TabAlignment
  TabAlignment = (
    Left = 0,
    Center = 1,
    Right = 2,
    Decimal = 3,
    Bar = 4
  );
  PTabAlignment = ^TabAlignment;

  // Windows.UI.Text.TabLeader
  TabLeader = (
    Spaces = 0,
    Dots = 1,
    Dashes = 2,
    Lines = 3,
    ThickLines = 4,
    Equals = 5
  );
  PTabLeader = ^TabLeader;

  // Windows.UI.Text.TextGetOptions
  TextGetOptions = (
    None = 0,
    AdjustCrlf = 1,
    UseCrlf = 2,
    UseObjectText = 4,
    AllowFinalEop = 8,
    NoHidden = 32,
    IncludeNumbering = 64,
    FormatRtf = 8192,
    UseLf = 16777216
  );
  PTextGetOptions = ^TextGetOptions;

  // Windows.UI.Text.TextSetOptions
  TextSetOptions = (
    None = 0,
    UnicodeBidi = 1,
    Unlink = 8,
    Unhide = 16,
    CheckTextLimit = 32,
    FormatRtf = 8192,
    ApplyRtfDocumentDefaults = 16384
  );
  PTextSetOptions = ^TextSetOptions;

  // Windows.UI.Text.TextRangeUnit
  TextRangeUnit = (
    Character = 0,
    Word = 1,
    Sentence = 2,
    Paragraph = 3,
    Line = 4,
    Story = 5,
    Screen = 6,
    Section = 7,
    Window = 8,
    CharacterFormat = 9,
    ParagraphFormat = 10,
    &Object = 11,
    HardParagraph = 12,
    Cluster = 13,
    Bold = 14,
    Italic = 15,
    Underline = 16,
    Strikethrough = 17,
    ProtectedText = 18,
    Link = 19,
    SmallCaps = 20,
    AllCaps = 21,
    Hidden = 22,
    Outline = 23,
    Shadow = 24,
    Imprint = 25,
    Disabled = 26,
    Revised = 27,
    Subscript = 28,
    Superscript = 29,
    FontBound = 30,
    LinkProtected = 31
  );
  PTextRangeUnit = ^TextRangeUnit;

  // Windows.UI.Text.TextScript
  TextScript = (
    Undefined = 0,
    Ansi = 1,
    EastEurope = 2,
    Cyrillic = 3,
    Greek = 4,
    Turkish = 5,
    Hebrew = 6,
    Arabic = 7,
    Baltic = 8,
    Vietnamese = 9,
    Default = 10,
    Symbol = 11,
    Thai = 12,
    ShiftJis = 13,
    GB2312 = 14,
    Hangul = 15,
    Big5 = 16,
    PC437 = 17,
    Oem = 18,
    Mac = 19,
    Armenian = 20,
    Syriac = 21,
    Thaana = 22,
    Devanagari = 23,
    Bengali = 24,
    Gurmukhi = 25,
    Gujarati = 26,
    Oriya = 27,
    Tamil = 28,
    Telugu = 29,
    Kannada = 30,
    Malayalam = 31,
    Sinhala = 32,
    Lao = 33,
    Tibetan = 34,
    Myanmar = 35,
    Georgian = 36,
    Jamo = 37,
    Ethiopic = 38,
    Cherokee = 39,
    Aboriginal = 40,
    Ogham = 41,
    Runic = 42,
    Khmer = 43,
    Mongolian = 44,
    Braille = 45,
    Yi = 46,
    Limbu = 47,
    TaiLe = 48,
    NewTaiLue = 49,
    SylotiNagri = 50,
    Kharoshthi = 51,
    Kayahli = 52,
    UnicodeSymbol = 53,
    Emoji = 54,
    Glagolitic = 55,
    Lisu = 56,
    Vai = 57,
    NKo = 58,
    Osmanya = 59,
    PhagsPa = 60,
    Gothic = 61,
    Deseret = 62,
    Tifinagh = 63
  );
  PTextScript = ^TextScript;

  // Windows.UI.Text.UnderlineType
  UnderlineType = (
    Undefined = 0,
    None = 1,
    Single = 2,
    Words = 3,
    Double = 4,
    Dotted = 5,
    Dash = 6,
    DashDot = 7,
    DashDotDot = 8,
    Wave = 9,
    Thick = 10,
    Thin = 11,
    DoubleWave = 12,
    HeavyWave = 13,
    LongDash = 14,
    ThickDash = 15,
    ThickDashDot = 16,
    ThickDashDotDot = 17,
    ThickDotted = 18,
    ThickLongDash = 19
  );
  PUnderlineType = ^UnderlineType;

  // Windows.UI.Text.VerticalCharacterAlignment
  VerticalCharacterAlignment = (
    Top = 0,
    Baseline = 1,
    Bottom = 2
  );
  PVerticalCharacterAlignment = ^VerticalCharacterAlignment;

  // Windows.UI.Text.FontStretch
  FontStretch = (
    Undefined = 0,
    UltraCondensed = 1,
    ExtraCondensed = 2,
    Condensed = 3,
    SemiCondensed = 4,
    Normal = 5,
    SemiExpanded = 6,
    Expanded = 7,
    ExtraExpanded = 8,
    UltraExpanded = 9
  );
  PFontStretch = ^FontStretch;

  // Windows.UI.Text.FontStyle
  FontStyle = (
    Normal = 0,
    Oblique = 1,
    Italic = 2
  );
  PFontStyle = ^FontStyle;

  // Windows.UI.Text.TextDecorations
  TextDecorations = (
    None = 0,
    Underline = 1,
    Strikethrough = 2
  );
  PTextDecorations = ^TextDecorations;

  // Windows.UI.ViewManagement.Core.CoreInputViewOcclusionKind
  Core_CoreInputViewOcclusionKind = (
    Docked = 0,
    Floating = 1,
    Overlay = 2
  );
  PCore_CoreInputViewOcclusionKind = ^Core_CoreInputViewOcclusionKind;

  // Windows.UI.ViewManagement.ApplicationViewState
  ApplicationViewState = (
    FullScreenLandscape = 0,
    Filled = 1,
    Snapped = 2,
    FullScreenPortrait = 3
  );
  PApplicationViewState = ^ApplicationViewState;

  // Windows.UI.ViewManagement.ApplicationViewOrientation
  ApplicationViewOrientation = (
    Landscape = 0,
    Portrait = 1
  );
  PApplicationViewOrientation = ^ApplicationViewOrientation;

  // Windows.UI.ViewManagement.ApplicationViewSwitchingOptions
  ApplicationViewSwitchingOptions = (
    Default = 0,
    SkipAnimation = 1,
    ConsolidateViews = 2
  );
  PApplicationViewSwitchingOptions = ^ApplicationViewSwitchingOptions;

  // Windows.UI.ViewManagement.ViewSizePreference
  ViewSizePreference = (
    Default = 0,
    UseLess = 1,
    UseHalf = 2,
    UseMore = 3,
    UseMinimum = 4,
    UseNone = 5,
    Custom = 6
  );
  PViewSizePreference = ^ViewSizePreference;

  // Windows.UI.ViewManagement.ApplicationViewBoundsMode
  ApplicationViewBoundsMode = (
    UseVisible = 0,
    UseCoreWindow = 1
  );
  PApplicationViewBoundsMode = ^ApplicationViewBoundsMode;

  // Windows.UI.ViewManagement.FullScreenSystemOverlayMode
  FullScreenSystemOverlayMode = (
    Standard = 0,
    Minimal = 1
  );
  PFullScreenSystemOverlayMode = ^FullScreenSystemOverlayMode;

  // Windows.UI.ViewManagement.ApplicationViewWindowingMode
  ApplicationViewWindowingMode = (
    Auto = 0,
    PreferredLaunchViewSize = 1,
    FullScreen = 2
  );
  PApplicationViewWindowingMode = ^ApplicationViewWindowingMode;

  // Windows.UI.ViewManagement.ApplicationViewMode
  ApplicationViewMode = (
    Default = 0,
    CompactOverlay = 1
  );
  PApplicationViewMode = ^ApplicationViewMode;

  // Windows.UI.ViewManagement.UserInteractionMode
  UserInteractionMode = (
    Mouse = 0,
    Touch = 1
  );
  PUserInteractionMode = ^UserInteractionMode;

  // Windows.UI.ViewManagement.HandPreference
  HandPreference = (
    LeftHanded = 0,
    RightHanded = 1
  );
  PHandPreference = ^HandPreference;

  // Windows.UI.ViewManagement.UIColorType
  UIColorType = (
    Background = 0,
    Foreground = 1,
    AccentDark3 = 2,
    AccentDark2 = 3,
    AccentDark1 = 4,
    Accent = 5,
    AccentLight1 = 6,
    AccentLight2 = 7,
    AccentLight3 = 8,
    Complement = 9
  );
  PUIColorType = ^UIColorType;

  // Windows.UI.ViewManagement.UIElementType
  UIElementType = (
    ActiveCaption = 0,
    Background = 1,
    ButtonFace = 2,
    ButtonText = 3,
    CaptionText = 4,
    GrayText = 5,
    Highlight = 6,
    HighlightText = 7,
    Hotlight = 8,
    InactiveCaption = 9,
    InactiveCaptionText = 10,
    Window = 11,
    WindowText = 12,
    AccentColor = 1000,
    TextHigh = 1001,
    TextMedium = 1002,
    TextLow = 1003,
    TextContrastWithHigh = 1004,
    NonTextHigh = 1005,
    NonTextMediumHigh = 1006,
    NonTextMedium = 1007,
    NonTextMediumLow = 1008,
    NonTextLow = 1009,
    PageBackground = 1010,
    PopupBackground = 1011,
    OverlayOutsidePopup = 1012
  );
  PUIElementType = ^UIElementType;

  // Windows.UI.WebUI.PrintContent
  PrintContent = (
    AllPages = 0,
    CurrentPage = 1,
    CustomPageRange = 2,
    CurrentSelection = 3
  );
  PPrintContent = ^PrintContent;

  // Windows.UI.Xaml.Controls.ColorSpectrumShape
  Controls_ColorSpectrumShape = (
    Box = 0,
    Ring = 1
  );
  PControls_ColorSpectrumShape = ^Controls_ColorSpectrumShape;

  // Windows.UI.Xaml.Controls.ColorSpectrumComponents
  Controls_ColorSpectrumComponents = (
    HueValue = 0,
    ValueHue = 1,
    HueSaturation = 2,
    SaturationHue = 3,
    SaturationValue = 4,
    ValueSaturation = 5
  );
  PControls_ColorSpectrumComponents = ^Controls_ColorSpectrumComponents;

  // Windows.UI.Xaml.Controls.ColorPickerHsvChannel
  Controls_ColorPickerHsvChannel = (
    Hue = 0,
    Saturation = 1,
    Value = 2,
    Alpha = 3
  );
  PControls_ColorPickerHsvChannel = ^Controls_ColorPickerHsvChannel;

  // Windows.UI.Xaml.Controls.NavigationViewDisplayMode
  Controls_NavigationViewDisplayMode = (
    Minimal = 0,
    Compact = 1,
    Expanded = 2
  );
  PControls_NavigationViewDisplayMode = ^Controls_NavigationViewDisplayMode;

  // Windows.UI.Xaml.Controls.ParallaxSourceOffsetKind
  Controls_ParallaxSourceOffsetKind = (
    Absolute = 0,
    Relative = 1
  );
  PControls_ParallaxSourceOffsetKind = ^Controls_ParallaxSourceOffsetKind;

  // Windows.UI.Xaml.Controls.SwipeBehaviorOnInvoked
  Controls_SwipeBehaviorOnInvoked = (
    Auto = 0,
    Close = 1,
    RemainOpen = 2
  );
  PControls_SwipeBehaviorOnInvoked = ^Controls_SwipeBehaviorOnInvoked;

  // Windows.UI.Xaml.Controls.SwipeMode
  Controls_SwipeMode = (
    Reveal = 0,
    Execute = 1
  );
  PControls_SwipeMode = ^Controls_SwipeMode;

  // Windows.UI.Xaml.Media.AcrylicBackgroundSource
  Media_AcrylicBackgroundSource = (
    HostBackdrop = 0,
    Backdrop = 1
  );
  PMedia_AcrylicBackgroundSource = ^Media_AcrylicBackgroundSource;

  // Windows.UI.Xaml.Media.RevealBrushState
  Media_RevealBrushState = (
    Normal = 0,
    PointerOver = 1,
    Pressed = 2
  );
  PMedia_RevealBrushState = ^Media_RevealBrushState;

  // Windows.UI.Xaml.Documents.LogicalDirection
  Documents_LogicalDirection = (
    Backward = 0,
    Forward = 1
  );
  PDocuments_LogicalDirection = ^Documents_LogicalDirection;

  // Windows.UI.Xaml.Documents.UnderlineStyle
  Documents_UnderlineStyle = (
    None = 0,
    Single = 1
  );
  PDocuments_UnderlineStyle = ^Documents_UnderlineStyle;

  // Windows.UI.Xaml.Controls.CandidateWindowAlignment
  Controls_CandidateWindowAlignment = (
    Default = 0,
    BottomEdge = 1
  );
  PControls_CandidateWindowAlignment = ^Controls_CandidateWindowAlignment;

  // Windows.UI.Xaml.Controls.CharacterCasing
  Controls_CharacterCasing = (
    Normal = 0,
    Lower = 1,
    Upper = 2
  );
  PControls_CharacterCasing = ^Controls_CharacterCasing;

  // Windows.UI.Xaml.Controls.ClickMode
  Controls_ClickMode = (
    Release = 0,
    Press = 1,
    Hover = 2
  );
  PControls_ClickMode = ^Controls_ClickMode;

  // Windows.UI.Xaml.Controls.ComboBoxSelectionChangedTrigger
  Controls_ComboBoxSelectionChangedTrigger = (
    Committed = 0,
    Always = 1
  );
  PControls_ComboBoxSelectionChangedTrigger = ^Controls_ComboBoxSelectionChangedTrigger;

  // Windows.UI.Xaml.Controls.DisabledFormattingAccelerators
  Controls_DisabledFormattingAccelerators = (
    None = 0,
    Bold = 1,
    Italic = 2,
    Underline = 4,
    All = -1
  );
  PControls_DisabledFormattingAccelerators = ^Controls_DisabledFormattingAccelerators;

  // Windows.UI.Xaml.Controls.IncrementalLoadingTrigger
  Controls_IncrementalLoadingTrigger = (
    None = 0,
    Edge = 1
  );
  PControls_IncrementalLoadingTrigger = ^Controls_IncrementalLoadingTrigger;

  // Windows.UI.Xaml.Controls.ItemsUpdatingScrollMode
  Controls_ItemsUpdatingScrollMode = (
    KeepItemsInView = 0,
    KeepScrollOffset = 1,
    KeepLastItemInView = 2
  );
  PControls_ItemsUpdatingScrollMode = ^Controls_ItemsUpdatingScrollMode;

  // Windows.UI.Xaml.Controls.ListViewReorderMode
  Controls_ListViewReorderMode = (
    Disabled = 0,
    Enabled = 1
  );
  PControls_ListViewReorderMode = ^Controls_ListViewReorderMode;

  // Windows.UI.Xaml.Controls.ListViewSelectionMode
  Controls_ListViewSelectionMode = (
    None = 0,
    Single = 1,
    Multiple = 2,
    Extended = 3
  );
  PControls_ListViewSelectionMode = ^Controls_ListViewSelectionMode;

  // Windows.UI.Xaml.Controls.Orientation
  Controls_Orientation = (
    Vertical = 0,
    Horizontal = 1
  );
  PControls_Orientation = ^Controls_Orientation;

  // Windows.UI.Xaml.Controls.PanelScrollingDirection
  Controls_PanelScrollingDirection = (
    None = 0,
    Forward = 1,
    Backward = 2
  );
  PControls_PanelScrollingDirection = ^Controls_PanelScrollingDirection;

  // Windows.UI.Xaml.Controls.PasswordRevealMode
  Controls_PasswordRevealMode = (
    Peek = 0,
    Hidden = 1,
    Visible = 2
  );
  PControls_PasswordRevealMode = ^Controls_PasswordRevealMode;

  // Windows.UI.Xaml.Controls.RichEditClipboardFormat
  Controls_RichEditClipboardFormat = (
    AllFormats = 0,
    PlainText = 1
  );
  PControls_RichEditClipboardFormat = ^Controls_RichEditClipboardFormat;

  // Windows.UI.Xaml.Controls.ScrollBarVisibility
  Controls_ScrollBarVisibility = (
    Disabled = 0,
    Auto = 1,
    Hidden = 2,
    Visible = 3
  );
  PControls_ScrollBarVisibility = ^Controls_ScrollBarVisibility;

  // Windows.UI.Xaml.Controls.ScrollIntoViewAlignment
  Controls_ScrollIntoViewAlignment = (
    Default = 0,
    Leading = 1
  );
  PControls_ScrollIntoViewAlignment = ^Controls_ScrollIntoViewAlignment;

  // Windows.UI.Xaml.Controls.ScrollMode
  Controls_ScrollMode = (
    Disabled = 0,
    Enabled = 1,
    Auto = 2
  );
  PControls_ScrollMode = ^Controls_ScrollMode;

  // Windows.UI.Xaml.Controls.SelectionMode
  Controls_SelectionMode = (
    Single = 0,
    Multiple = 1,
    Extended = 2
  );
  PControls_SelectionMode = ^Controls_SelectionMode;

  // Windows.UI.Xaml.Controls.SnapPointsType
  Controls_SnapPointsType = (
    None = 0,
    Optional = 1,
    Mandatory = 2,
    OptionalSingle = 3,
    MandatorySingle = 4
  );
  PControls_SnapPointsType = ^Controls_SnapPointsType;

  // Windows.UI.Xaml.Controls.StretchDirection
  Controls_StretchDirection = (
    UpOnly = 0,
    DownOnly = 1,
    Both = 2
  );
  PControls_StretchDirection = ^Controls_StretchDirection;

  // Windows.UI.Xaml.Controls.VirtualizationMode
  Controls_VirtualizationMode = (
    Standard = 0,
    Recycling = 1
  );
  PControls_VirtualizationMode = ^Controls_VirtualizationMode;

  // Windows.UI.Xaml.Controls.ZoomMode
  Controls_ZoomMode = (
    Disabled = 0,
    Enabled = 1
  );
  PControls_ZoomMode = ^Controls_ZoomMode;

  // Windows.UI.Xaml.Controls.Primitives.GeneratorDirection
  Controls_Primitives_GeneratorDirection = (
    Forward = 0,
    Backward = 1
  );
  PControls_Primitives_GeneratorDirection = ^Controls_Primitives_GeneratorDirection;

  // Windows.UI.Xaml.Controls.Primitives.GroupHeaderPlacement
  Controls_Primitives_GroupHeaderPlacement = (
    Top = 0,
    Left = 1
  );
  PControls_Primitives_GroupHeaderPlacement = ^Controls_Primitives_GroupHeaderPlacement;

  // Windows.UI.Xaml.Controls.Primitives.PlacementMode
  Controls_Primitives_PlacementMode = (
    Bottom = 2,
    Left = 9,
    Mouse = 7,
    Right = 4,
    Top = 10
  );
  PControls_Primitives_PlacementMode = ^Controls_Primitives_PlacementMode;

  // Windows.UI.Xaml.Controls.Primitives.ScrollEventType
  Controls_Primitives_ScrollEventType = (
    SmallDecrement = 0,
    SmallIncrement = 1,
    LargeDecrement = 2,
    LargeIncrement = 3,
    ThumbPosition = 4,
    ThumbTrack = 5,
    First = 6,
    Last = 7,
    EndScroll = 8
  );
  PControls_Primitives_ScrollEventType = ^Controls_Primitives_ScrollEventType;

  // Windows.UI.Xaml.Controls.Primitives.ScrollingIndicatorMode
  Controls_Primitives_ScrollingIndicatorMode = (
    None = 0,
    TouchIndicator = 1,
    MouseIndicator = 2
  );
  PControls_Primitives_ScrollingIndicatorMode = ^Controls_Primitives_ScrollingIndicatorMode;

  // Windows.UI.Xaml.Controls.Primitives.SliderSnapsTo
  Controls_Primitives_SliderSnapsTo = (
    StepValues = 0,
    Ticks = 1
  );
  PControls_Primitives_SliderSnapsTo = ^Controls_Primitives_SliderSnapsTo;

  // Windows.UI.Xaml.Controls.Primitives.SnapPointsAlignment
  Controls_Primitives_SnapPointsAlignment = (
    Near = 0,
    Center = 1,
    Far = 2
  );
  PControls_Primitives_SnapPointsAlignment = ^Controls_Primitives_SnapPointsAlignment;

  // Windows.UI.Xaml.Controls.Primitives.TickPlacement
  Controls_Primitives_TickPlacement = (
    None = 0,
    TopLeft = 1,
    BottomRight = 2,
    Outside = 3,
    &Inline = 4
  );
  PControls_Primitives_TickPlacement = ^Controls_Primitives_TickPlacement;

  // Windows.UI.Xaml.Printing.PreviewPageCountType
  Printing_PreviewPageCountType = (
    Final = 0,
    Intermediate = 1
  );
  PPrinting_PreviewPageCountType = ^Printing_PreviewPageCountType;

  // Windows.UI.Xaml.Navigation.NavigationCacheMode
  Navigation_NavigationCacheMode = (
    Disabled = 0,
    Required = 1,
    Enabled = 2
  );
  PNavigation_NavigationCacheMode = ^Navigation_NavigationCacheMode;

  // Windows.UI.Xaml.Navigation.NavigationMode
  Navigation_NavigationMode = (
    New = 0,
    Back = 1,
    Forward = 2,
    Refresh = 3
  );
  PNavigation_NavigationMode = ^Navigation_NavigationMode;

  // Windows.UI.Xaml.Interop.NotifyCollectionChangedAction
  Interop_NotifyCollectionChangedAction = (
    Add = 0,
    Remove = 1,
    Replace = 2,
    Move = 3,
    Reset = 4
  );
  PInterop_NotifyCollectionChangedAction = ^Interop_NotifyCollectionChangedAction;

  // Windows.UI.Xaml.Media.MediaElementState
  Media_MediaElementState = (
    Closed = 0,
    Opening = 1,
    Buffering = 2,
    Playing = 3,
    Paused = 4,
    Stopped = 5
  );
  PMedia_MediaElementState = ^Media_MediaElementState;

  // Windows.UI.Xaml.Controls.AppBarClosedDisplayMode
  Controls_AppBarClosedDisplayMode = (
    Compact = 0,
    Minimal = 1,
    Hidden = 2
  );
  PControls_AppBarClosedDisplayMode = ^Controls_AppBarClosedDisplayMode;

  // Windows.UI.Xaml.Controls.AutoSuggestionBoxTextChangeReason
  Controls_AutoSuggestionBoxTextChangeReason = (
    UserInput = 0,
    ProgrammaticChange = 1,
    SuggestionChosen = 2
  );
  PControls_AutoSuggestionBoxTextChangeReason = ^Controls_AutoSuggestionBoxTextChangeReason;

  // Windows.UI.Xaml.Controls.CalendarViewDisplayMode
  Controls_CalendarViewDisplayMode = (
    Month = 0,
    Year = 1,
    Decade = 2
  );
  PControls_CalendarViewDisplayMode = ^Controls_CalendarViewDisplayMode;

  // Windows.UI.Xaml.Controls.CalendarViewSelectionMode
  Controls_CalendarViewSelectionMode = (
    None = 0,
    Single = 1,
    Multiple = 2
  );
  PControls_CalendarViewSelectionMode = ^Controls_CalendarViewSelectionMode;

  // Windows.UI.Xaml.Controls.CommandBarDefaultLabelPosition
  Controls_CommandBarDefaultLabelPosition = (
    Bottom = 0,
    Right = 1,
    Collapsed = 2
  );
  PControls_CommandBarDefaultLabelPosition = ^Controls_CommandBarDefaultLabelPosition;

  // Windows.UI.Xaml.Controls.CommandBarDynamicOverflowAction
  Controls_CommandBarDynamicOverflowAction = (
    AddingToOverflow = 0,
    RemovingFromOverflow = 1
  );
  PControls_CommandBarDynamicOverflowAction = ^Controls_CommandBarDynamicOverflowAction;

  // Windows.UI.Xaml.Controls.CommandBarLabelPosition
  Controls_CommandBarLabelPosition = (
    Default = 0,
    Collapsed = 1
  );
  PControls_CommandBarLabelPosition = ^Controls_CommandBarLabelPosition;

  // Windows.UI.Xaml.Controls.CommandBarOverflowButtonVisibility
  Controls_CommandBarOverflowButtonVisibility = (
    Auto = 0,
    Visible = 1,
    Collapsed = 2
  );
  PControls_CommandBarOverflowButtonVisibility = ^Controls_CommandBarOverflowButtonVisibility;

  // Windows.UI.Xaml.Controls.ContentDialogButton
  Controls_ContentDialogButton = (
    None = 0,
    Primary = 1,
    Secondary = 2,
    Close = 3
  );
  PControls_ContentDialogButton = ^Controls_ContentDialogButton;

  // Windows.UI.Xaml.Controls.ContentDialogPlacement
  Controls_ContentDialogPlacement = (
    Popup = 0,
    InPlace = 1
  );
  PControls_ContentDialogPlacement = ^Controls_ContentDialogPlacement;

  // Windows.UI.Xaml.Controls.ContentDialogResult
  Controls_ContentDialogResult = (
    None = 0,
    Primary = 1,
    Secondary = 2
  );
  PControls_ContentDialogResult = ^Controls_ContentDialogResult;

  // Windows.UI.Xaml.Controls.SplitViewDisplayMode
  Controls_SplitViewDisplayMode = (
    Overlay = 0,
    &Inline = 1,
    CompactOverlay = 2,
    CompactInline = 3
  );
  PControls_SplitViewDisplayMode = ^Controls_SplitViewDisplayMode;

  // Windows.UI.Xaml.Controls.SplitViewPanePlacement
  Controls_SplitViewPanePlacement = (
    Left = 0,
    Right = 1
  );
  PControls_SplitViewPanePlacement = ^Controls_SplitViewPanePlacement;

  // Windows.UI.Xaml.Controls.Symbol
  Controls_Symbol = (
    Previous = 57600,
    Next = 57601,
    Play = 57602,
    Pause = 57603,
    Edit = 57604,
    Save = 57605,
    Clear = 57606,
    Delete = 57607,
    Remove = 57608,
    Add = 57609,
    Cancel = 57610,
    Accept = 57611,
    More = 57612,
    Redo = 57613,
    Undo = 57614,
    Home = 57615,
    Up = 57616,
    Forward = 57617,
    Back = 57618,
    Favorite = 57619,
    Camera = 57620,
    Setting = 57621,
    Video = 57622,
    Sync = 57623,
    Download = 57624,
    Mail = 57625,
    Find = 57626,
    Help = 57627,
    Upload = 57628,
    Emoji = 57629,
    TwoPage = 57630,
    LeaveChat = 57631,
    MailForward = 57632,
    Clock = 57633,
    Send = 57634,
    Crop = 57635,
    RotateCamera = 57636,
    People = 57637,
    OpenPane = 57638,
    ClosePane = 57639,
    World = 57640,
    Flag = 57641,
    PreviewLink = 57642,
    Globe = 57643,
    Trim = 57644,
    AttachCamera = 57645,
    ZoomIn = 57646,
    Bookmarks = 57647,
    Document = 57648,
    ProtectedDocument = 57649,
    Page = 57650,
    Bullets = 57651,
    Comment = 57652,
    MailFilled = 57653,
    ContactInfo = 57654,
    HangUp = 57655,
    ViewAll = 57656,
    MapPin = 57657,
    Phone = 57658,
    VideoChat = 57659,
    Switch = 57660,
    Contact = 57661,
    Rename = 57662,
    Pin = 57665,
    MusicInfo = 57666,
    Go = 57667,
    Keyboard = 57668,
    DockLeft = 57669,
    DockRight = 57670,
    DockBottom = 57671,
    Remote = 57672,
    Refresh = 57673,
    Rotate = 57674,
    Shuffle = 57675,
    List = 57676,
    Shop = 57677,
    SelectAll = 57678,
    Orientation = 57679,
    Import = 57680,
    ImportAll = 57681,
    BrowsePhotos = 57685,
    WebCam = 57686,
    Pictures = 57688,
    SaveLocal = 57689,
    Caption = 57690,
    Stop = 57691,
    ShowResults = 57692,
    Volume = 57693,
    Repair = 57694,
    Message = 57695,
    Page2 = 57696,
    CalendarDay = 57697,
    CalendarWeek = 57698,
    Calendar = 57699,
    Character = 57700,
    MailReplyAll = 57701,
    Read = 57702,
    Link = 57703,
    Account = 57704,
    ShowBcc = 57705,
    HideBcc = 57706,
    Cut = 57707,
    Attach = 57708,
    Paste = 57709,
    Filter = 57710,
    Copy = 57711,
    Emoji2 = 57712,
    Important = 57713,
    MailReply = 57714,
    SlideShow = 57715,
    Sort = 57716,
    Manage = 57720,
    AllApps = 57721,
    DisconnectDrive = 57722,
    MapDrive = 57723,
    NewWindow = 57724,
    OpenWith = 57725,
    ContactPresence = 57729,
    Priority = 57730,
    GoToToday = 57732,
    Font = 57733,
    FontColor = 57734,
    Contact2 = 57735,
    Folder = 57736,
    Audio = 57737,
    Placeholder = 57738,
    View = 57739,
    SetLockScreen = 57740,
    SetTile = 57741,
    ClosedCaption = 57744,
    StopSlideShow = 57745,
    Permissions = 57746,
    Highlight = 57747,
    DisableUpdates = 57748,
    UnFavorite = 57749,
    UnPin = 57750,
    OpenLocal = 57751,
    Mute = 57752,
    Italic = 57753,
    Underline = 57754,
    Bold = 57755,
    MoveToFolder = 57756,
    LikeDislike = 57757,
    Dislike = 57758,
    Like = 57759,
    AlignRight = 57760,
    AlignCenter = 57761,
    AlignLeft = 57762,
    Zoom = 57763,
    ZoomOut = 57764,
    OpenFile = 57765,
    OtherUser = 57766,
    Admin = 57767,
    Street = 57795,
    Map = 57796,
    ClearSelection = 57797,
    FontDecrease = 57798,
    FontIncrease = 57799,
    FontSize = 57800,
    CellPhone = 57801,
    ReShare = 57802,
    Tag = 57803,
    RepeatOne = 57804,
    RepeatAll = 57805,
    OutlineStar = 57806,
    SolidStar = 57807,
    Calculator = 57808,
    Directions = 57809,
    Target = 57810,
    &Library = 57811,
    PhoneBook = 57812,
    Memo = 57813,
    Microphone = 57814,
    PostUpdate = 57815,
    BackToWindow = 57816,
    FullScreen = 57817,
    NewFolder = 57818,
    CalendarReply = 57819,
    UnSyncFolder = 57821,
    ReportHacked = 57822,
    SyncFolder = 57823,
    BlockContact = 57824,
    SwitchApps = 57825,
    AddFriend = 57826,
    TouchPointer = 57827,
    GoToStart = 57828,
    ZeroBars = 57829,
    OneBar = 57830,
    TwoBars = 57831,
    ThreeBars = 57832,
    FourBars = 57833,
    Scan = 58004,
    Preview = 58005,
    GlobalNavigationButton = 59136,
    Share = 59181,
    Print = 59209,
    XboxOneConsole = 59792
  );
  PControls_Symbol = ^Controls_Symbol;

  // Windows.UI.Xaml.Controls.WebViewExecutionMode
  Controls_WebViewExecutionMode = (
    SameThread = 0,
    SeparateThread = 1
  );
  PControls_WebViewExecutionMode = ^Controls_WebViewExecutionMode;

  // Windows.UI.Xaml.Controls.WebViewPermissionState
  Controls_WebViewPermissionState = (
    Unknown = 0,
    Defer = 1,
    Allow = 2,
    Deny = 3
  );
  PControls_WebViewPermissionState = ^Controls_WebViewPermissionState;

  // Windows.UI.Xaml.Controls.WebViewPermissionType
  Controls_WebViewPermissionType = (
    Geolocation = 0,
    UnlimitedIndexedDBQuota = 1,
    Media = 2,
    PointerLock = 3,
    WebNotifications = 4
  );
  PControls_WebViewPermissionType = ^Controls_WebViewPermissionType;

  // Windows.UI.Xaml.Controls.Primitives.ListViewItemPresenterCheckMode
  Controls_Primitives_ListViewItemPresenterCheckMode = (
    &Inline = 0,
    Overlay = 1
  );
  PControls_Primitives_ListViewItemPresenterCheckMode = ^Controls_Primitives_ListViewItemPresenterCheckMode;

  // Windows.UI.Xaml.DurationType
  DurationType = (
    Automatic = 0,
    TimeSpan = 1,
    Forever = 2
  );
  PDurationType = ^DurationType;

  // Windows.UI.Xaml.ElementHighContrastAdjustment
  ElementHighContrastAdjustment = (
    None = 0,
    Application = -2147483648,
    Auto = -1
  );
  PElementHighContrastAdjustment = ^ElementHighContrastAdjustment;

  // Windows.UI.Xaml.ElementSoundKind
  ElementSoundKind = (
    Focus = 0,
    Invoke = 1,
    Show = 2,
    Hide = 3,
    MovePrevious = 4,
    MoveNext = 5,
    GoBack = 6
  );
  PElementSoundKind = ^ElementSoundKind;

  // Windows.UI.Xaml.ElementSoundMode
  ElementSoundMode = (
    Default = 0,
    FocusOnly = 1,
    Off = 2
  );
  PElementSoundMode = ^ElementSoundMode;

  // Windows.UI.Xaml.ElementTheme
  ElementTheme = (
    Default = 0,
    Light = 1,
    Dark = 2
  );
  PElementTheme = ^ElementTheme;

  // Windows.UI.Xaml.FlowDirection
  FlowDirection = (
    LeftToRight = 0,
    RightToLeft = 1
  );
  PFlowDirection = ^FlowDirection;

  // Windows.UI.Xaml.FocusState
  FocusState = (
    Unfocused = 0,
    Pointer = 1,
    Keyboard = 2,
    Programmatic = 3
  );
  PFocusState = ^FocusState;

  // Windows.UI.Xaml.FocusVisualKind
  FocusVisualKind = (
    DottedLine = 0,
    HighVisibility = 1
  );
  PFocusVisualKind = ^FocusVisualKind;

  // Windows.UI.Xaml.HorizontalAlignment
  HorizontalAlignment = (
    Left = 0,
    Center = 1,
    Right = 2,
    Stretch = 3
  );
  PHorizontalAlignment = ^HorizontalAlignment;

  // Windows.UI.Xaml.VerticalAlignment
  VerticalAlignment = (
    Top = 0,
    Center = 1,
    Bottom = 2,
    Stretch = 3
  );
  PVerticalAlignment = ^VerticalAlignment;

  // Windows.UI.Xaml.Visibility
  Visibility = (
    Visible = 0,
    Collapsed = 1
  );
  PVisibility = ^Visibility;

  // Windows.UI.Xaml.Media.AudioCategory
  Media_AudioCategory = (
    Other = 0,
    ForegroundOnlyMedia = 1,
    BackgroundCapableMedia = 2,
    Communications = 3,
    Alerts = 4,
    SoundEffects = 5,
    GameEffects = 6,
    GameMedia = 7,
    GameChat = 8,
    Speech = 9,
    Movie = 10,
    Media = 11
  );
  PMedia_AudioCategory = ^Media_AudioCategory;

  // Windows.UI.Xaml.Media.AudioDeviceType
  Media_AudioDeviceType = (
    Console = 0,
    Multimedia = 1,
    Communications = 2
  );
  PMedia_AudioDeviceType = ^Media_AudioDeviceType;

  // Windows.UI.Xaml.Media.BrushMappingMode
  Media_BrushMappingMode = (
    Absolute = 0,
    RelativeToBoundingBox = 1
  );
  PMedia_BrushMappingMode = ^Media_BrushMappingMode;

  // Windows.UI.Xaml.Media.ColorInterpolationMode
  Media_ColorInterpolationMode = (
    ScRgbLinearInterpolation = 0,
    SRgbLinearInterpolation = 1
  );
  PMedia_ColorInterpolationMode = ^Media_ColorInterpolationMode;

  // Windows.UI.Xaml.Media.ElementCompositeMode
  Media_ElementCompositeMode = (
    Inherit = 0,
    SourceOver = 1,
    MinBlend = 2
  );
  PMedia_ElementCompositeMode = ^Media_ElementCompositeMode;

  // Windows.UI.Xaml.Media.FastPlayFallbackBehaviour
  Media_FastPlayFallbackBehaviour = (
    Skip = 0,
    Hide = 1,
    Disable = 2
  );
  PMedia_FastPlayFallbackBehaviour = ^Media_FastPlayFallbackBehaviour;

  // Windows.UI.Xaml.Media.FillRule
  Media_FillRule = (
    EvenOdd = 0,
    Nonzero = 1
  );
  PMedia_FillRule = ^Media_FillRule;

  // Windows.UI.Xaml.Media.GradientSpreadMethod
  Media_GradientSpreadMethod = (
    Pad = 0,
    Reflect = 1,
    &Repeat = 2
  );
  PMedia_GradientSpreadMethod = ^Media_GradientSpreadMethod;

  // Windows.UI.Xaml.Media.MediaCanPlayResponse
  Media_MediaCanPlayResponse = (
    NotSupported = 0,
    Maybe = 1,
    Probably = 2
  );
  PMedia_MediaCanPlayResponse = ^Media_MediaCanPlayResponse;

  // Windows.UI.Xaml.Media.PenLineCap
  Media_PenLineCap = (
    Flat = 0,
    Square = 1,
    Round = 2,
    Triangle = 3
  );
  PMedia_PenLineCap = ^Media_PenLineCap;

  // Windows.UI.Xaml.Media.PenLineJoin
  Media_PenLineJoin = (
    Miter = 0,
    Bevel = 1,
    Round = 2
  );
  PMedia_PenLineJoin = ^Media_PenLineJoin;

  // Windows.UI.Xaml.Media.Stereo3DVideoPackingMode
  Media_Stereo3DVideoPackingMode = (
    None = 0,
    SideBySide = 1,
    TopBottom = 2
  );
  PMedia_Stereo3DVideoPackingMode = ^Media_Stereo3DVideoPackingMode;

  // Windows.UI.Xaml.Media.Stereo3DVideoRenderMode
  Media_Stereo3DVideoRenderMode = (
    Mono = 0,
    Stereo = 1
  );
  PMedia_Stereo3DVideoRenderMode = ^Media_Stereo3DVideoRenderMode;

  // Windows.UI.Xaml.Media.Stretch
  Media_Stretch = (
    None = 0,
    Fill = 1,
    Uniform = 2,
    UniformToFill = 3
  );
  PMedia_Stretch = ^Media_Stretch;

  // Windows.UI.Xaml.Media.StyleSimulations
  Media_StyleSimulations = (
    None = 0,
    BoldSimulation = 1,
    ItalicSimulation = 2,
    BoldItalicSimulation = 3
  );
  PMedia_StyleSimulations = ^Media_StyleSimulations;

  // Windows.UI.Xaml.Media.SweepDirection
  Media_SweepDirection = (
    Counterclockwise = 0,
    Clockwise = 1
  );
  PMedia_SweepDirection = ^Media_SweepDirection;

  // Windows.UI.Xaml.Media.Animation.ClockState
  Media_Animation_ClockState = (
    Active = 0,
    Filling = 1,
    Stopped = 2
  );
  PMedia_Animation_ClockState = ^Media_Animation_ClockState;

  // Windows.UI.Xaml.Media.Animation.EasingMode
  Media_Animation_EasingMode = (
    EaseOut = 0,
    EaseIn = 1,
    EaseInOut = 2
  );
  PMedia_Animation_EasingMode = ^Media_Animation_EasingMode;

  // Windows.UI.Xaml.Media.Animation.FillBehavior
  Media_Animation_FillBehavior = (
    HoldEnd = 0,
    Stop = 1
  );
  PMedia_Animation_FillBehavior = ^Media_Animation_FillBehavior;

  // Windows.UI.Xaml.Media.Animation.RepeatBehaviorType
  Media_Animation_RepeatBehaviorType = (
    Count = 0,
    Duration = 1,
    Forever = 2
  );
  PMedia_Animation_RepeatBehaviorType = ^Media_Animation_RepeatBehaviorType;

  // Windows.UI.Xaml.Input.FocusInputDeviceKind
  Input_FocusInputDeviceKind = (
    None = 0,
    Mouse = 1,
    Touch = 2,
    Pen = 3,
    Keyboard = 4,
    GameController = 5
  );
  PInput_FocusInputDeviceKind = ^Input_FocusInputDeviceKind;

  // Windows.UI.Xaml.Input.FocusNavigationDirection
  Input_FocusNavigationDirection = (
    Next = 0,
    Previous = 1,
    Up = 2,
    Down = 3,
    Left = 4,
    Right = 5,
    None = 6
  );
  PInput_FocusNavigationDirection = ^Input_FocusNavigationDirection;

  // Windows.UI.Xaml.Input.InputScopeNameValue
  Input_InputScopeNameValue = (
    Default = 0,
    Url = 1,
    EmailSmtpAddress = 5,
    PersonalFullName = 7,
    CurrencyAmountAndSymbol = 20,
    CurrencyAmount = 21,
    DateMonthNumber = 23,
    DateDayNumber = 24,
    DateYear = 25,
    Digits = 28,
    Number = 29,
    Password = 31,
    TelephoneNumber = 32,
    TelephoneCountryCode = 33,
    TelephoneAreaCode = 34,
    TelephoneLocalNumber = 35,
    TimeHour = 37,
    TimeMinutesOrSeconds = 38,
    NumberFullWidth = 39,
    AlphanumericHalfWidth = 40,
    AlphanumericFullWidth = 41,
    Hiragana = 44,
    KatakanaHalfWidth = 45,
    KatakanaFullWidth = 46,
    Hanja = 47,
    HangulHalfWidth = 48,
    HangulFullWidth = 49,
    Search = 50,
    Formula = 51,
    SearchIncremental = 52,
    ChineseHalfWidth = 53,
    ChineseFullWidth = 54,
    NativeScript = 55,
    Text = 57,
    Chat = 58,
    NameOrPhoneNumber = 59,
    EmailNameOrAddress = 60,
    Maps = 62,
    NumericPassword = 63,
    NumericPin = 64,
    AlphanumericPin = 65,
    FormulaNumber = 67,
    ChatWithoutEmoji = 68
  );
  PInput_InputScopeNameValue = ^Input_InputScopeNameValue;

  // Windows.UI.Xaml.Input.KeyboardNavigationMode
  Input_KeyboardNavigationMode = (
    Local = 0,
    Cycle = 1,
    Once = 2
  );
  PInput_KeyboardNavigationMode = ^Input_KeyboardNavigationMode;

  // Windows.UI.Xaml.Input.KeyTipPlacementMode
  Input_KeyTipPlacementMode = (
    Auto = 0,
    Bottom = 1,
    Top = 2,
    Left = 3,
    Right = 4,
    Center = 5,
    Hidden = 6
  );
  PInput_KeyTipPlacementMode = ^Input_KeyTipPlacementMode;

  // Windows.UI.Xaml.Input.ManipulationModes
  Input_ManipulationModes = (
    None = 0,
    TranslateX = 1,
    TranslateY = 2,
    TranslateRailsX = 4,
    TranslateRailsY = 8,
    Rotate = 16,
    Scale = 32,
    TranslateInertia = 64,
    RotateInertia = 128,
    ScaleInertia = 256,
    All = 65535,
    System = 65536
  );
  PInput_ManipulationModes = ^Input_ManipulationModes;

  // Windows.UI.Xaml.Input.XYFocusKeyboardNavigationMode
  Input_XYFocusKeyboardNavigationMode = (
    Auto = 0,
    Enabled = 1,
    Disabled = 2
  );
  PInput_XYFocusKeyboardNavigationMode = ^Input_XYFocusKeyboardNavigationMode;

  // Windows.UI.Xaml.Input.XYFocusNavigationStrategy
  Input_XYFocusNavigationStrategy = (
    Auto = 0,
    Projection = 1,
    NavigationDirectionDistance = 2,
    RectilinearDistance = 3
  );
  PInput_XYFocusNavigationStrategy = ^Input_XYFocusNavigationStrategy;

  // Windows.UI.Xaml.Input.XYFocusNavigationStrategyOverride
  Input_XYFocusNavigationStrategyOverride = (
    None = 0,
    Auto = 1,
    Projection = 2,
    NavigationDirectionDistance = 3,
    RectilinearDistance = 4
  );
  PInput_XYFocusNavigationStrategyOverride = ^Input_XYFocusNavigationStrategyOverride;

  // Windows.UI.Xaml.Controls.LightDismissOverlayMode
  Controls_LightDismissOverlayMode = (
    Auto = 0,
    On = 1,
    Off = 2
  );
  PControls_LightDismissOverlayMode = ^Controls_LightDismissOverlayMode;

  // Windows.UI.Xaml.Controls.RequiresPointer
  Controls_RequiresPointer = (
    Never = 0,
    WhenEngaged = 1,
    WhenFocused = 2
  );
  PControls_RequiresPointer = ^Controls_RequiresPointer;

  // Windows.UI.Xaml.Media.Imaging.BitmapCreateOptions
  Media_Imaging_BitmapCreateOptions = (
    None = 0,
    IgnoreImageCache = 8
  );
  PMedia_Imaging_BitmapCreateOptions = ^Media_Imaging_BitmapCreateOptions;

  // Windows.UI.Xaml.Media.Imaging.DecodePixelType
  Media_Imaging_DecodePixelType = (
    Physical = 0,
    Logical = 1
  );
  PMedia_Imaging_DecodePixelType = ^Media_Imaging_DecodePixelType;

  // Windows.UI.Xaml.Controls.Primitives.AnimationDirection
  Controls_Primitives_AnimationDirection = (
    Left = 0,
    Top = 1,
    Right = 2,
    Bottom = 3
  );
  PControls_Primitives_AnimationDirection = ^Controls_Primitives_AnimationDirection;

  // Windows.UI.Xaml.Controls.Primitives.ComponentResourceLocation
  Controls_Primitives_ComponentResourceLocation = (
    Application = 0,
    Nested = 1
  );
  PControls_Primitives_ComponentResourceLocation = ^Controls_Primitives_ComponentResourceLocation;

  // Windows.UI.Xaml.Controls.Primitives.EdgeTransitionLocation
  Controls_Primitives_EdgeTransitionLocation = (
    Left = 0,
    Top = 1,
    Right = 2,
    Bottom = 3
  );
  PControls_Primitives_EdgeTransitionLocation = ^Controls_Primitives_EdgeTransitionLocation;

  // Windows.UI.Xaml.Controls.Primitives.FlyoutPlacementMode
  Controls_Primitives_FlyoutPlacementMode = (
    Top = 0,
    Bottom = 1,
    Left = 2,
    Right = 3,
    Full = 4
  );
  PControls_Primitives_FlyoutPlacementMode = ^Controls_Primitives_FlyoutPlacementMode;

  // Windows.UI.Xaml.Automation.AnnotationType
  Automation_AnnotationType = (
    Unknown = 60000,
    SpellingError = 60001,
    GrammarError = 60002,
    Comment = 60003,
    FormulaError = 60004,
    TrackChanges = 60005,
    Header = 60006,
    Footer = 60007,
    Highlighted = 60008,
    Endnote = 60009,
    Footnote = 60010,
    InsertionChange = 60011,
    DeletionChange = 60012,
    MoveChange = 60013,
    FormatChange = 60014,
    UnsyncedChange = 60015,
    EditingLockedChange = 60016,
    ExternalChange = 60017,
    ConflictingChange = 60018,
    Author = 60019,
    AdvancedProofingIssue = 60020,
    DataValidationError = 60021,
    CircularReferenceError = 60022
  );
  PAutomation_AnnotationType = ^Automation_AnnotationType;

  // Windows.UI.Xaml.Automation.AutomationTextEditChangeType
  Automation_AutomationTextEditChangeType = (
    None = 0,
    AutoCorrect = 1,
    Composition = 2,
    CompositionFinalized = 3
  );
  PAutomation_AutomationTextEditChangeType = ^Automation_AutomationTextEditChangeType;

  // Windows.UI.Xaml.Automation.DockPosition
  Automation_DockPosition = (
    Top = 0,
    Left = 1,
    Bottom = 2,
    Right = 3,
    Fill = 4,
    None = 5
  );
  PAutomation_DockPosition = ^Automation_DockPosition;

  // Windows.UI.Xaml.Automation.ExpandCollapseState
  Automation_ExpandCollapseState = (
    Collapsed = 0,
    Expanded = 1,
    PartiallyExpanded = 2,
    LeafNode = 3
  );
  PAutomation_ExpandCollapseState = ^Automation_ExpandCollapseState;

  // Windows.UI.Xaml.Automation.RowOrColumnMajor
  Automation_RowOrColumnMajor = (
    RowMajor = 0,
    ColumnMajor = 1,
    Indeterminate = 2
  );
  PAutomation_RowOrColumnMajor = ^Automation_RowOrColumnMajor;

  // Windows.UI.Xaml.Automation.ScrollAmount
  Automation_ScrollAmount = (
    LargeDecrement = 0,
    SmallDecrement = 1,
    NoAmount = 2,
    LargeIncrement = 3,
    SmallIncrement = 4
  );
  PAutomation_ScrollAmount = ^Automation_ScrollAmount;

  // Windows.UI.Xaml.Automation.SupportedTextSelection
  Automation_SupportedTextSelection = (
    None = 0,
    Single = 1,
    Multiple = 2
  );
  PAutomation_SupportedTextSelection = ^Automation_SupportedTextSelection;

  // Windows.UI.Xaml.Automation.SynchronizedInputType
  Automation_SynchronizedInputType = (
    KeyUp = 1,
    KeyDown = 2,
    LeftMouseUp = 4,
    LeftMouseDown = 8,
    RightMouseUp = 16,
    RightMouseDown = 32
  );
  PAutomation_SynchronizedInputType = ^Automation_SynchronizedInputType;

  // Windows.UI.Xaml.Automation.ToggleState
  Automation_ToggleState = (
    Off = 0,
    On = 1,
    Indeterminate = 2
  );
  PAutomation_ToggleState = ^Automation_ToggleState;

  // Windows.UI.Xaml.Automation.WindowInteractionState
  Automation_WindowInteractionState = (
    Running = 0,
    Closing = 1,
    ReadyForUserInteraction = 2,
    BlockedByModalWindow = 3,
    NotResponding = 4
  );
  PAutomation_WindowInteractionState = ^Automation_WindowInteractionState;

  // Windows.UI.Xaml.Automation.WindowVisualState
  Automation_WindowVisualState = (
    Normal = 0,
    Maximized = 1,
    Minimized = 2
  );
  PAutomation_WindowVisualState = ^Automation_WindowVisualState;

  // Windows.UI.Xaml.Automation.ZoomUnit
  Automation_ZoomUnit = (
    NoAmount = 0,
    LargeDecrement = 1,
    SmallDecrement = 2,
    LargeIncrement = 3,
    SmallIncrement = 4
  );
  PAutomation_ZoomUnit = ^Automation_ZoomUnit;

  // Windows.UI.Xaml.Automation.Peers.AccessibilityView
  Automation_Peers_AccessibilityView = (
    Raw = 0,
    Control = 1,
    Content = 2
  );
  PAutomation_Peers_AccessibilityView = ^Automation_Peers_AccessibilityView;

  // Windows.UI.Xaml.Automation.Peers.AutomationControlType
  Automation_Peers_AutomationControlType = (
    Button = 0,
    Calendar = 1,
    CheckBox = 2,
    ComboBox = 3,
    Edit = 4,
    Hyperlink = 5,
    Image = 6,
    ListItem = 7,
    List = 8,
    Menu = 9,
    MenuBar = 10,
    MenuItem = 11,
    ProgressBar = 12,
    RadioButton = 13,
    ScrollBar = 14,
    Slider = 15,
    Spinner = 16,
    StatusBar = 17,
    Tab = 18,
    TabItem = 19,
    Text = 20,
    ToolBar = 21,
    ToolTip = 22,
    Tree = 23,
    TreeItem = 24,
    Custom = 25,
    Group = 26,
    Thumb = 27,
    DataGrid = 28,
    DataItem = 29,
    Document = 30,
    SplitButton = 31,
    Window = 32,
    Pane = 33,
    Header = 34,
    HeaderItem = 35,
    Table = 36,
    TitleBar = 37,
    Separator = 38,
    SemanticZoom = 39,
    AppBar = 40
  );
  PAutomation_Peers_AutomationControlType = ^Automation_Peers_AutomationControlType;

  // Windows.UI.Xaml.Automation.Peers.AutomationEvents
  Automation_Peers_AutomationEvents = (
    ToolTipOpened = 0,
    ToolTipClosed = 1,
    MenuOpened = 2,
    MenuClosed = 3,
    AutomationFocusChanged = 4,
    InvokePatternOnInvoked = 5,
    SelectionItemPatternOnElementAddedToSelection = 6,
    SelectionItemPatternOnElementRemovedFromSelection = 7,
    SelectionItemPatternOnElementSelected = 8,
    SelectionPatternOnInvalidated = 9,
    TextPatternOnTextSelectionChanged = 10,
    TextPatternOnTextChanged = 11,
    AsyncContentLoaded = 12,
    PropertyChanged = 13,
    StructureChanged = 14,
    DragStart = 15,
    DragCancel = 16,
    DragComplete = 17,
    DragEnter = 18,
    DragLeave = 19,
    Dropped = 20,
    LiveRegionChanged = 21,
    InputReachedTarget = 22,
    InputReachedOtherElement = 23,
    InputDiscarded = 24,
    WindowClosed = 25,
    WindowOpened = 26,
    ConversionTargetChanged = 27,
    TextEditTextChanged = 28,
    LayoutInvalidated = 29
  );
  PAutomation_Peers_AutomationEvents = ^Automation_Peers_AutomationEvents;

  // Windows.UI.Xaml.Automation.Peers.AutomationLandmarkType
  Automation_Peers_AutomationLandmarkType = (
    None = 0,
    Custom = 1,
    Form = 2,
    Main = 3,
    Navigation = 4,
    Search = 5
  );
  PAutomation_Peers_AutomationLandmarkType = ^Automation_Peers_AutomationLandmarkType;

  // Windows.UI.Xaml.Automation.Peers.AutomationLiveSetting
  Automation_Peers_AutomationLiveSetting = (
    Off = 0,
    Polite = 1,
    Assertive = 2
  );
  PAutomation_Peers_AutomationLiveSetting = ^Automation_Peers_AutomationLiveSetting;

  // Windows.UI.Xaml.Automation.Peers.AutomationNavigationDirection
  Automation_Peers_AutomationNavigationDirection = (
    Parent = 0,
    NextSibling = 1,
    PreviousSibling = 2,
    FirstChild = 3,
    LastChild = 4
  );
  PAutomation_Peers_AutomationNavigationDirection = ^Automation_Peers_AutomationNavigationDirection;

  // Windows.UI.Xaml.Automation.Peers.AutomationNotificationKind
  Automation_Peers_AutomationNotificationKind = (
    ItemAdded = 0,
    ItemRemoved = 1,
    ActionCompleted = 2,
    ActionAborted = 3,
    Other = 4
  );
  PAutomation_Peers_AutomationNotificationKind = ^Automation_Peers_AutomationNotificationKind;

  // Windows.UI.Xaml.Automation.Peers.AutomationNotificationProcessing
  Automation_Peers_AutomationNotificationProcessing = (
    ImportantAll = 0,
    ImportantMostRecent = 1,
    All = 2,
    MostRecent = 3,
    CurrentThenMostRecent = 4
  );
  PAutomation_Peers_AutomationNotificationProcessing = ^Automation_Peers_AutomationNotificationProcessing;

  // Windows.UI.Xaml.Automation.Peers.AutomationOrientation
  Automation_Peers_AutomationOrientation = (
    None = 0,
    Horizontal = 1,
    Vertical = 2
  );
  PAutomation_Peers_AutomationOrientation = ^Automation_Peers_AutomationOrientation;

  // Windows.UI.Xaml.Automation.Peers.AutomationStructureChangeType
  Automation_Peers_AutomationStructureChangeType = (
    ChildAdded = 0,
    ChildRemoved = 1,
    ChildrenInvalidated = 2,
    ChildrenBulkAdded = 3,
    ChildrenBulkRemoved = 4,
    ChildrenReordered = 5
  );
  PAutomation_Peers_AutomationStructureChangeType = ^Automation_Peers_AutomationStructureChangeType;

  // Windows.UI.Xaml.Automation.Peers.PatternInterface
  Automation_Peers_PatternInterface = (
    Invoke = 0,
    Selection = 1,
    Value = 2,
    RangeValue = 3,
    Scroll = 4,
    ScrollItem = 5,
    ExpandCollapse = 6,
    Grid = 7,
    GridItem = 8,
    MultipleView = 9,
    Window = 10,
    SelectionItem = 11,
    Dock = 12,
    Table = 13,
    TableItem = 14,
    Toggle = 15,
    Transform = 16,
    Text = 17,
    ItemContainer = 18,
    VirtualizedItem = 19,
    Text2 = 20,
    TextChild = 21,
    TextRange = 22,
    Annotation = 23,
    Drag = 24,
    DropTarget = 25,
    ObjectModel = 26,
    Spreadsheet = 27,
    SpreadsheetItem = 28,
    Styles = 29,
    Transform2 = 30,
    SynchronizedInput = 31,
    TextEdit = 32,
    CustomNavigation = 33
  );
  PAutomation_Peers_PatternInterface = ^Automation_Peers_PatternInterface;

  // Windows.UI.Xaml.Automation.Text.TextPatternRangeEndpoint
  Automation_Text_TextPatternRangeEndpoint = (
    Start = 0,
    &End = 1
  );
  PAutomation_Text_TextPatternRangeEndpoint = ^Automation_Text_TextPatternRangeEndpoint;

  // Windows.UI.Xaml.Automation.Text.TextUnit
  Automation_Text_TextUnit = (
    Character = 0,
    Format = 1,
    Word = 2,
    Line = 3,
    Paragraph = 4,
    Page = 5,
    Document = 6
  );
  PAutomation_Text_TextUnit = ^Automation_Text_TextUnit;

  // Windows.UI.Xaml.Data.BindingMode
  Data_BindingMode = (
    OneWay = 1,
    OneTime = 2,
    TwoWay = 3
  );
  PData_BindingMode = ^Data_BindingMode;

  // Windows.UI.Xaml.Data.RelativeSourceMode
  Data_RelativeSourceMode = (
    None = 0,
    TemplatedParent = 1,
    Self = 2
  );
  PData_RelativeSourceMode = ^Data_RelativeSourceMode;

  // Windows.UI.Xaml.Data.UpdateSourceTrigger
  Data_UpdateSourceTrigger = (
    Default = 0,
    PropertyChanged = 1,
    Explicit = 2,
    LostFocus = 3
  );
  PData_UpdateSourceTrigger = ^Data_UpdateSourceTrigger;

  // Windows.UI.Xaml.Interop.TypeKind
  Interop_TypeKind = (
    Primitive = 0,
    Metadata = 1,
    Custom = 2
  );
  PInterop_TypeKind = ^Interop_TypeKind;

  // Windows.UI.Xaml.ApplicationHighContrastAdjustment
  ApplicationHighContrastAdjustment = (
    None = 0,
    Auto = -1
  );
  PApplicationHighContrastAdjustment = ^ApplicationHighContrastAdjustment;

  // Windows.UI.Xaml.ApplicationRequiresPointerMode
  ApplicationRequiresPointerMode = (
    Auto = 0,
    WhenRequested = 1
  );
  PApplicationRequiresPointerMode = ^ApplicationRequiresPointerMode;

  // Windows.UI.Xaml.ApplicationTheme
  ApplicationTheme = (
    Light = 0,
    Dark = 1
  );
  PApplicationTheme = ^ApplicationTheme;

  // Windows.UI.Xaml.AutomationTextAttributesEnum
  AutomationTextAttributesEnum = (
    AnimationStyleAttribute = 40000,
    BackgroundColorAttribute = 40001,
    BulletStyleAttribute = 40002,
    CapStyleAttribute = 40003,
    CultureAttribute = 40004,
    FontNameAttribute = 40005,
    FontSizeAttribute = 40006,
    FontWeightAttribute = 40007,
    ForegroundColorAttribute = 40008,
    HorizontalTextAlignmentAttribute = 40009,
    IndentationFirstLineAttribute = 40010,
    IndentationLeadingAttribute = 40011,
    IndentationTrailingAttribute = 40012,
    IsHiddenAttribute = 40013,
    IsItalicAttribute = 40014,
    IsReadOnlyAttribute = 40015,
    IsSubscriptAttribute = 40016,
    IsSuperscriptAttribute = 40017,
    MarginBottomAttribute = 40018,
    MarginLeadingAttribute = 40019,
    MarginTopAttribute = 40020,
    MarginTrailingAttribute = 40021,
    OutlineStylesAttribute = 40022,
    OverlineColorAttribute = 40023,
    OverlineStyleAttribute = 40024,
    StrikethroughColorAttribute = 40025,
    StrikethroughStyleAttribute = 40026,
    TabsAttribute = 40027,
    TextFlowDirectionsAttribute = 40028,
    UnderlineColorAttribute = 40029,
    UnderlineStyleAttribute = 40030,
    AnnotationTypesAttribute = 40031,
    AnnotationObjectsAttribute = 40032,
    StyleNameAttribute = 40033,
    StyleIdAttribute = 40034,
    LinkAttribute = 40035,
    IsActiveAttribute = 40036,
    SelectionActiveEndAttribute = 40037,
    CaretPositionAttribute = 40038,
    CaretBidiModeAttribute = 40039
  );
  PAutomationTextAttributesEnum = ^AutomationTextAttributesEnum;

  // Windows.UI.Xaml.ElementSoundPlayerState
  ElementSoundPlayerState = (
    Auto = 0,
    Off = 1,
    On = 2
  );
  PElementSoundPlayerState = ^ElementSoundPlayerState;

  // Windows.UI.Xaml.FontCapitals
  FontCapitals = (
    Normal = 0,
    AllSmallCaps = 1,
    SmallCaps = 2,
    AllPetiteCaps = 3,
    PetiteCaps = 4,
    Unicase = 5,
    Titling = 6
  );
  PFontCapitals = ^FontCapitals;

  // Windows.UI.Xaml.FontEastAsianLanguage
  FontEastAsianLanguage = (
    Normal = 0,
    HojoKanji = 1,
    Jis04 = 2,
    Jis78 = 3,
    Jis83 = 4,
    Jis90 = 5,
    NlcKanji = 6,
    Simplified = 7,
    Traditional = 8,
    TraditionalNames = 9
  );
  PFontEastAsianLanguage = ^FontEastAsianLanguage;

  // Windows.UI.Xaml.FontEastAsianWidths
  FontEastAsianWidths = (
    Normal = 0,
    Full = 1,
    Half = 2,
    Proportional = 3,
    Quarter = 4,
    Third = 5
  );
  PFontEastAsianWidths = ^FontEastAsianWidths;

  // Windows.UI.Xaml.FontFraction
  FontFraction = (
    Normal = 0,
    Stacked = 1,
    Slashed = 2
  );
  PFontFraction = ^FontFraction;

  // Windows.UI.Xaml.FontNumeralAlignment
  FontNumeralAlignment = (
    Normal = 0,
    Proportional = 1,
    Tabular = 2
  );
  PFontNumeralAlignment = ^FontNumeralAlignment;

  // Windows.UI.Xaml.FontNumeralStyle
  FontNumeralStyle = (
    Normal = 0,
    Lining = 1,
    OldStyle = 2
  );
  PFontNumeralStyle = ^FontNumeralStyle;

  // Windows.UI.Xaml.FontVariants
  FontVariants = (
    Normal = 0,
    Superscript = 1,
    Subscript = 2,
    Ordinal = 3,
    Inferior = 4,
    Ruby = 5
  );
  PFontVariants = ^FontVariants;

  // Windows.UI.Xaml.GridUnitType
  GridUnitType = (
    Auto = 0,
    Pixel = 1,
    Star = 2
  );
  PGridUnitType = ^GridUnitType;

  // Windows.UI.Xaml.LineStackingStrategy
  LineStackingStrategy = (
    MaxHeight = 0,
    BlockLineHeight = 1,
    BaselineToBaseline = 2
  );
  PLineStackingStrategy = ^LineStackingStrategy;

  // Windows.UI.Xaml.OpticalMarginAlignment
  OpticalMarginAlignment = (
    None = 0,
    TrimSideBearings = 1
  );
  POpticalMarginAlignment = ^OpticalMarginAlignment;

  // Windows.UI.Xaml.TextAlignment
  TextAlignment = (
    Center = 0,
    Left = 1,
    Start = 1,
    Right = 2,
    &End = 2,
    Justify = 3,
    DetectFromContent = 4
  );
  PTextAlignment = ^TextAlignment;

  // Windows.UI.Xaml.TextLineBounds
  TextLineBounds = (
    Full = 0,
    TrimToCapHeight = 1,
    TrimToBaseline = 2,
    Tight = 3
  );
  PTextLineBounds = ^TextLineBounds;

  // Windows.UI.Xaml.TextReadingOrder
  TextReadingOrder = (
    Default = 0,
    UseFlowDirection = 0,
    DetectFromContent = 1
  );
  PTextReadingOrder = ^TextReadingOrder;

  // Windows.UI.Xaml.TextTrimming
  TextTrimming = (
    None = 0,
    CharacterEllipsis = 1,
    WordEllipsis = 2,
    Clip = 3
  );
  PTextTrimming = ^TextTrimming;

  // Windows.UI.Xaml.TextWrapping
  TextWrapping = (
    NoWrap = 1,
    Wrap = 2,
    WrapWholeWords = 3
  );
  PTextWrapping = ^TextWrapping;

  // Windows.UI.Xaml.Media.AlignmentX
  Media_AlignmentX = (
    Left = 0,
    Center = 1,
    Right = 2
  );
  PMedia_AlignmentX = ^Media_AlignmentX;

  // Windows.UI.Xaml.Media.AlignmentY
  Media_AlignmentY = (
    Top = 0,
    Center = 1,
    Bottom = 2
  );
  PMedia_AlignmentY = ^Media_AlignmentY;

  // Windows.UI.Xaml.Media.LoadedImageSourceLoadStatus
  Media_LoadedImageSourceLoadStatus = (
    Success = 0,
    NetworkError = 1,
    InvalidFormat = 2,
    Other = 3
  );
  PMedia_LoadedImageSourceLoadStatus = ^Media_LoadedImageSourceLoadStatus;

  // Windows.UI.Xaml.Media.Animation.ConnectedAnimationComponent
  Media_Animation_ConnectedAnimationComponent = (
    OffsetX = 0,
    OffsetY = 1,
    CrossFade = 2,
    Scale = 3
  );
  PMedia_Animation_ConnectedAnimationComponent = ^Media_Animation_ConnectedAnimationComponent;

  // Windows.UI.Xaml.Media.Imaging.SvgImageSourceLoadStatus
  Media_Imaging_SvgImageSourceLoadStatus = (
    Success = 0,
    NetworkError = 1,
    InvalidFormat = 2,
    Other = 3
  );
  PMedia_Imaging_SvgImageSourceLoadStatus = ^Media_Imaging_SvgImageSourceLoadStatus;

  // Windows.UI.Xaml.Automation.AutomationActiveEnd
  Automation_AutomationActiveEnd = (
    None = 0,
    Start = 1,
    &End = 2
  );
  PAutomation_AutomationActiveEnd = ^Automation_AutomationActiveEnd;

  // Windows.UI.Xaml.Automation.AutomationAnimationStyle
  Automation_AutomationAnimationStyle = (
    None = 0,
    LasVegasLights = 1,
    BlinkingBackground = 2,
    SparkleText = 3,
    MarchingBlackAnts = 4,
    MarchingRedAnts = 5,
    Shimmer = 6,
    Other = 7
  );
  PAutomation_AutomationAnimationStyle = ^Automation_AutomationAnimationStyle;

  // Windows.UI.Xaml.Automation.AutomationBulletStyle
  Automation_AutomationBulletStyle = (
    None = 0,
    HollowRoundBullet = 1,
    FilledRoundBullet = 2,
    HollowSquareBullet = 3,
    FilledSquareBullet = 4,
    DashBullet = 5,
    Other = 6
  );
  PAutomation_AutomationBulletStyle = ^Automation_AutomationBulletStyle;

  // Windows.UI.Xaml.Automation.AutomationCaretBidiMode
  Automation_AutomationCaretBidiMode = (
    LTR = 0,
    RTL = 1
  );
  PAutomation_AutomationCaretBidiMode = ^Automation_AutomationCaretBidiMode;

  // Windows.UI.Xaml.Automation.AutomationCaretPosition
  Automation_AutomationCaretPosition = (
    Unknown = 0,
    EndOfLine = 1,
    BeginningOfLine = 2
  );
  PAutomation_AutomationCaretPosition = ^Automation_AutomationCaretPosition;

  // Windows.UI.Xaml.Automation.AutomationFlowDirections
  Automation_AutomationFlowDirections = (
    Default = 0,
    RightToLeft = 1,
    BottomToTop = 2,
    Vertical = 3
  );
  PAutomation_AutomationFlowDirections = ^Automation_AutomationFlowDirections;

  // Windows.UI.Xaml.Automation.AutomationOutlineStyles
  Automation_AutomationOutlineStyles = (
    None = 0,
    Outline = 1,
    Shadow = 2,
    Engraved = 3,
    Embossed = 4
  );
  PAutomation_AutomationOutlineStyles = ^Automation_AutomationOutlineStyles;

  // Windows.UI.Xaml.Automation.AutomationStyleId
  Automation_AutomationStyleId = (
    Heading1 = 70001,
    Heading2 = 70002,
    Heading3 = 70003,
    Heading4 = 70004,
    Heading5 = 70005,
    Heading6 = 70006,
    Heading7 = 70007,
    Heading8 = 70008,
    Heading9 = 70009,
    Title = 70010,
    Subtitle = 70011,
    Normal = 70012,
    Emphasis = 70013,
    Quote = 70014,
    BulletedList = 70015
  );
  PAutomation_AutomationStyleId = ^Automation_AutomationStyleId;

  // Windows.UI.Xaml.Automation.AutomationTextDecorationLineStyle
  Automation_AutomationTextDecorationLineStyle = (
    None = 0,
    Single = 1,
    WordsOnly = 2,
    Double = 3,
    Dot = 4,
    Dash = 5,
    DashDot = 6,
    DashDotDot = 7,
    Wavy = 8,
    ThickSingle = 9,
    DoubleWavy = 10,
    ThickWavy = 11,
    LongDash = 12,
    ThickDash = 13,
    ThickDashDot = 14,
    ThickDashDotDot = 15,
    ThickDot = 16,
    ThickLongDash = 17,
    Other = 18
  );
  PAutomation_AutomationTextDecorationLineStyle = ^Automation_AutomationTextDecorationLineStyle;

  // Windows.UI.Xaml.Controls.InkToolbarButtonFlyoutPlacement
  Controls_InkToolbarButtonFlyoutPlacement = (
    Auto = 0,
    Top = 1,
    Bottom = 2,
    Left = 3,
    Right = 4
  );
  PControls_InkToolbarButtonFlyoutPlacement = ^Controls_InkToolbarButtonFlyoutPlacement;

  // Windows.UI.Xaml.Controls.InkToolbarFlyoutItemKind
  Controls_InkToolbarFlyoutItemKind = (
    Simple = 0,
    Radio = 1,
    Check = 2,
    RadioCheck = 3
  );
  PControls_InkToolbarFlyoutItemKind = ^Controls_InkToolbarFlyoutItemKind;

  // Windows.UI.Xaml.Controls.InkToolbarInitialControls
  Controls_InkToolbarInitialControls = (
    All = 0,
    None = 1,
    PensOnly = 2,
    AllExceptPens = 3
  );
  PControls_InkToolbarInitialControls = ^Controls_InkToolbarInitialControls;

  // Windows.UI.Xaml.Controls.InkToolbarMenuKind
  Controls_InkToolbarMenuKind = (
    Stencil = 0
  );
  PControls_InkToolbarMenuKind = ^Controls_InkToolbarMenuKind;

  // Windows.UI.Xaml.Controls.InkToolbarStencilKind
  Controls_InkToolbarStencilKind = (
    Ruler = 0,
    Protractor = 1
  );
  PControls_InkToolbarStencilKind = ^Controls_InkToolbarStencilKind;

  // Windows.UI.Xaml.Controls.InkToolbarToggle
  Controls_InkToolbarToggle = (
    Ruler = 0,
    Custom = 1
  );
  PControls_InkToolbarToggle = ^Controls_InkToolbarToggle;

  // Windows.UI.Xaml.Controls.InkToolbarTool
  Controls_InkToolbarTool = (
    BallpointPen = 0,
    Pencil = 1,
    Highlighter = 2,
    Eraser = 3,
    CustomPen = 4,
    CustomTool = 5
  );
  PControls_InkToolbarTool = ^Controls_InkToolbarTool;

  // Windows.UI.Xaml.Controls.Maps.MapAnimationKind
  Controls_Maps_MapAnimationKind = (
    Default = 0,
    None = 1,
    Linear = 2,
    Bow = 3
  );
  PControls_Maps_MapAnimationKind = ^Controls_Maps_MapAnimationKind;

  // Windows.UI.Xaml.Controls.Maps.MapCameraChangeReason
  Controls_Maps_MapCameraChangeReason = (
    System = 0,
    UserInteraction = 1,
    Programmatic = 2
  );
  PControls_Maps_MapCameraChangeReason = ^Controls_Maps_MapCameraChangeReason;

  // Windows.UI.Xaml.Controls.Maps.MapColorScheme
  Controls_Maps_MapColorScheme = (
    Light = 0,
    Dark = 1
  );
  PControls_Maps_MapColorScheme = ^Controls_Maps_MapColorScheme;

  // Windows.UI.Xaml.Controls.Maps.MapElementCollisionBehavior
  Controls_Maps_MapElementCollisionBehavior = (
    Hide = 0,
    RemainVisible = 1
  );
  PControls_Maps_MapElementCollisionBehavior = ^Controls_Maps_MapElementCollisionBehavior;

  // Windows.UI.Xaml.Controls.Maps.MapInteractionMode
  Controls_Maps_MapInteractionMode = (
    Auto = 0,
    Disabled = 1,
    GestureOnly = 2,
    PointerAndKeyboard = 2,
    ControlOnly = 3,
    GestureAndControl = 4,
    PointerKeyboardAndControl = 4,
    PointerOnly = 5
  );
  PControls_Maps_MapInteractionMode = ^Controls_Maps_MapInteractionMode;

  // Windows.UI.Xaml.Controls.Maps.MapLoadingStatus
  Controls_Maps_MapLoadingStatus = (
    Loading = 0,
    Loaded = 1,
    DataUnavailable = 2
  );
  PControls_Maps_MapLoadingStatus = ^Controls_Maps_MapLoadingStatus;

  // Windows.UI.Xaml.Controls.Maps.MapModel3DShadingOption
  Controls_Maps_MapModel3DShadingOption = (
    Default = 0,
    Flat = 1,
    Smooth = 2
  );
  PControls_Maps_MapModel3DShadingOption = ^Controls_Maps_MapModel3DShadingOption;

  // Windows.UI.Xaml.Controls.Maps.MapPanInteractionMode
  Controls_Maps_MapPanInteractionMode = (
    Auto = 0,
    Disabled = 1
  );
  PControls_Maps_MapPanInteractionMode = ^Controls_Maps_MapPanInteractionMode;

  // Windows.UI.Xaml.Controls.Maps.MapProjection
  Controls_Maps_MapProjection = (
    WebMercator = 0,
    Globe = 1
  );
  PControls_Maps_MapProjection = ^Controls_Maps_MapProjection;

  // Windows.UI.Xaml.Controls.Maps.MapStyle
  Controls_Maps_MapStyle = (
    None = 0,
    Road = 1,
    Aerial = 2,
    AerialWithRoads = 3,
    Terrain = 4,
    Aerial3D = 5,
    Aerial3DWithRoads = 6,
    Custom = 7
  );
  PControls_Maps_MapStyle = ^Controls_Maps_MapStyle;

  // Windows.UI.Xaml.Controls.Maps.MapTileLayer
  Controls_Maps_MapTileLayer = (
    LabelOverlay = 0,
    RoadOverlay = 1,
    AreaOverlay = 2,
    BackgroundOverlay = 3,
    BackgroundReplacement = 4
  );
  PControls_Maps_MapTileLayer = ^Controls_Maps_MapTileLayer;

  // Windows.UI.Xaml.Controls.Maps.MapVisibleRegionKind
  Controls_Maps_MapVisibleRegionKind = (
    Near = 0,
    Full = 1
  );
  PControls_Maps_MapVisibleRegionKind = ^Controls_Maps_MapVisibleRegionKind;

  // Windows.UI.Xaml.Controls.Maps.MapWatermarkMode
  Controls_Maps_MapWatermarkMode = (
    Automatic = 0,
    On = 1
  );
  PControls_Maps_MapWatermarkMode = ^Controls_Maps_MapWatermarkMode;

  // Windows.UI.Xaml.Controls.ListPickerFlyoutSelectionMode
  Controls_ListPickerFlyoutSelectionMode = (
    Single = 0,
    Multiple = 1
  );
  PControls_ListPickerFlyoutSelectionMode = ^Controls_ListPickerFlyoutSelectionMode;

  // Windows.UI.Xaml.Controls.PivotHeaderFocusVisualPlacement
  Controls_PivotHeaderFocusVisualPlacement = (
    ItemHeaders = 0,
    SelectedItemHeader = 1
  );
  PControls_PivotHeaderFocusVisualPlacement = ^Controls_PivotHeaderFocusVisualPlacement;

  // Windows.UI.Xaml.Controls.PivotSlideInAnimationGroup
  Controls_PivotSlideInAnimationGroup = (
    Default = 0,
    GroupOne = 1,
    GroupTwo = 2,
    GroupThree = 3
  );
  PControls_PivotSlideInAnimationGroup = ^Controls_PivotSlideInAnimationGroup;

  // Windows.UI.Xaml.Hosting.DesignerAppViewState
  Hosting_DesignerAppViewState = (
    Visible = 0,
    Hidden = 1
  );
  PHosting_DesignerAppViewState = ^Hosting_DesignerAppViewState;

  // Windows.Web.Http.HttpVersion
  Http_HttpVersion = (
    None = 0,
    Http10 = 1,
    Http11 = 2,
    Http20 = 3
  );
  PHttp_HttpVersion = ^Http_HttpVersion;

  // Windows.Web.Http.HttpCompletionOption
  Http_HttpCompletionOption = (
    ResponseContentRead = 0,
    ResponseHeadersRead = 1
  );
  PHttp_HttpCompletionOption = ^Http_HttpCompletionOption;

  // Windows.Web.Http.HttpStatusCode
  Http_HttpStatusCode = (
    None = 0,
    Continue = 100,
    SwitchingProtocols = 101,
    Processing = 102,
    Ok = 200,
    Created = 201,
    Accepted = 202,
    NonAuthoritativeInformation = 203,
    NoContent = 204,
    ResetContent = 205,
    PartialContent = 206,
    MultiStatus = 207,
    AlreadyReported = 208,
    IMUsed = 226,
    MultipleChoices = 300,
    MovedPermanently = 301,
    Found = 302,
    SeeOther = 303,
    NotModified = 304,
    UseProxy = 305,
    TemporaryRedirect = 307,
    PermanentRedirect = 308,
    BadRequest = 400,
    Unauthorized = 401,
    PaymentRequired = 402,
    Forbidden = 403,
    NotFound = 404,
    MethodNotAllowed = 405,
    NotAcceptable = 406,
    ProxyAuthenticationRequired = 407,
    RequestTimeout = 408,
    Conflict = 409,
    Gone = 410,
    LengthRequired = 411,
    PreconditionFailed = 412,
    RequestEntityTooLarge = 413,
    RequestUriTooLong = 414,
    UnsupportedMediaType = 415,
    RequestedRangeNotSatisfiable = 416,
    ExpectationFailed = 417,
    UnprocessableEntity = 422,
    Locked = 423,
    FailedDependency = 424,
    UpgradeRequired = 426,
    PreconditionRequired = 428,
    TooManyRequests = 429,
    RequestHeaderFieldsTooLarge = 431,
    InternalServerError = 500,
    NotImplemented = 501,
    BadGateway = 502,
    ServiceUnavailable = 503,
    GatewayTimeout = 504,
    HttpVersionNotSupported = 505,
    VariantAlsoNegotiates = 506,
    InsufficientStorage = 507,
    LoopDetected = 508,
    NotExtended = 510,
    NetworkAuthenticationRequired = 511
  );
  PHttp_HttpStatusCode = ^Http_HttpStatusCode;

  // Windows.Web.Http.HttpProgressStage
  Http_HttpProgressStage = (
    None = 0,
    DetectingProxy = 10,
    ResolvingName = 20,
    ConnectingToServer = 30,
    NegotiatingSsl = 40,
    SendingHeaders = 50,
    SendingContent = 60,
    WaitingForResponse = 70,
    ReceivingHeaders = 80,
    ReceivingContent = 90
  );
  PHttp_HttpProgressStage = ^Http_HttpProgressStage;

  // Windows.Web.Http.HttpResponseMessageSource
  Http_HttpResponseMessageSource = (
    None = 0,
    Cache = 1,
    Network = 2
  );
  PHttp_HttpResponseMessageSource = ^Http_HttpResponseMessageSource;

  // Windows.Web.Http.Filters.HttpCacheReadBehavior
  Http_Filters_HttpCacheReadBehavior = (
    Default = 0,
    MostRecent = 1,
    OnlyFromCache = 2,
    NoCache = 3
  );
  PHttp_Filters_HttpCacheReadBehavior = ^Http_Filters_HttpCacheReadBehavior;

  // Windows.Web.Http.Filters.HttpCacheWriteBehavior
  Http_Filters_HttpCacheWriteBehavior = (
    Default = 0,
    NoCache = 1
  );
  PHttp_Filters_HttpCacheWriteBehavior = ^Http_Filters_HttpCacheWriteBehavior;

  // Windows.Web.Http.Filters.HttpCookieUsageBehavior
  Http_Filters_HttpCookieUsageBehavior = (
    Default = 0,
    NoCookies = 1
  );
  PHttp_Filters_HttpCookieUsageBehavior = ^Http_Filters_HttpCookieUsageBehavior;

  // Windows.Web.WebErrorStatus
  WebErrorStatus = (
    Unknown = 0,
    CertificateCommonNameIsIncorrect = 1,
    CertificateExpired = 2,
    CertificateContainsErrors = 3,
    CertificateRevoked = 4,
    CertificateIsInvalid = 5,
    ServerUnreachable = 6,
    Timeout = 7,
    ErrorHttpInvalidServerResponse = 8,
    ConnectionAborted = 9,
    ConnectionReset = 10,
    Disconnected = 11,
    HttpToHttpsOnRedirection = 12,
    HttpsToHttpOnRedirection = 13,
    CannotConnect = 14,
    HostNameNotResolved = 15,
    OperationCanceled = 16,
    RedirectFailed = 17,
    UnexpectedStatusCode = 18,
    UnexpectedRedirection = 19,
    UnexpectedClientError = 20,
    UnexpectedServerError = 21,
    InsufficientRangeSupport = 22,
    MissingContentLengthSupport = 23,
    MultipleChoices = 300,
    MovedPermanently = 301,
    Found = 302,
    SeeOther = 303,
    NotModified = 304,
    UseProxy = 305,
    TemporaryRedirect = 307,
    BadRequest = 400,
    Unauthorized = 401,
    PaymentRequired = 402,
    Forbidden = 403,
    NotFound = 404,
    MethodNotAllowed = 405,
    NotAcceptable = 406,
    ProxyAuthenticationRequired = 407,
    RequestTimeout = 408,
    Conflict = 409,
    Gone = 410,
    LengthRequired = 411,
    PreconditionFailed = 412,
    RequestEntityTooLarge = 413,
    RequestUriTooLong = 414,
    UnsupportedMediaType = 415,
    RequestedRangeNotSatisfiable = 416,
    ExpectationFailed = 417,
    InternalServerError = 500,
    NotImplemented = 501,
    BadGateway = 502,
    ServiceUnavailable = 503,
    GatewayTimeout = 504,
    HttpVersionNotSupported = 505
  );
  PWebErrorStatus = ^WebErrorStatus;

  // Windows.Web.Syndication.SyndicationFormat
  Syndication_SyndicationFormat = (
    Atom10 = 0,
    Rss20 = 1,
    Rss10 = 2,
    Rss092 = 3,
    Rss091 = 4,
    Atom03 = 5
  );
  PSyndication_SyndicationFormat = ^Syndication_SyndicationFormat;

  // Windows.Web.Syndication.SyndicationErrorStatus
  Syndication_SyndicationErrorStatus = (
    Unknown = 0,
    MissingRequiredElement = 1,
    MissingRequiredAttribute = 2,
    InvalidXml = 3,
    UnexpectedContent = 4,
    UnsupportedFormat = 5
  );
  PSyndication_SyndicationErrorStatus = ^Syndication_SyndicationErrorStatus;

  // Windows.Web.Syndication.SyndicationTextType
  Syndication_SyndicationTextType = (
    Text = 0,
    Html = 1,
    Xhtml = 2
  );
  PSyndication_SyndicationTextType = ^Syndication_SyndicationTextType;

  // Windows.Web.Http.Diagnostics.HttpDiagnosticRequestInitiator
  Http_Diagnostics_HttpDiagnosticRequestInitiator = (
    ParsedElement = 0,
    Script = 1,
    Image = 2,
    Link = 3,
    Style = 4,
    XmlHttpRequest = 5,
    Media = 6,
    HtmlDownload = 7,
    Prefetch = 8,
    Other = 9,
    CrossOriginPreFlight = 10,
    Fetch = 11,
    Beacon = 12
  );
  PHttp_Diagnostics_HttpDiagnosticRequestInitiator = ^Http_Diagnostics_HttpDiagnosticRequestInitiator;


  // Emit records
  //  Records
  // Windows.Foundation.EventRegistrationToken
  EventRegistrationToken = record
    Value: Int64;
  end;
  PEventRegistrationToken = ^EventRegistrationToken;

  // Windows.Foundation.Numerics.Quaternion
  Numerics_Quaternion = record
    X: Single;
    Y: Single;
    Z: Single;
    W: Single;
  end;
  PNumerics_Quaternion = ^Numerics_Quaternion;

  // Windows.Foundation.Numerics.Vector3
  Numerics_Vector3 = record
    X: Single;
    Y: Single;
    Z: Single;
  end;
  PNumerics_Vector3 = ^Numerics_Vector3;

  // Windows.Foundation.Numerics.Plane
  Numerics_Plane = record
    Normal: Numerics_Vector3;
    D: Single;
  end;
  PNumerics_Plane = ^Numerics_Plane;

  // Windows.Foundation.DateTime
  DateTime = record
    UniversalTime: Int64;
  end;
  PDateTime = ^DateTime;

  // Windows.Foundation.Numerics.Matrix4x4
  Numerics_Matrix4x4 = record
    M11: Single;
    M12: Single;
    M13: Single;
    M14: Single;
    M21: Single;
    M22: Single;
    M23: Single;
    M24: Single;
    M31: Single;
    M32: Single;
    M33: Single;
    M34: Single;
    M41: Single;
    M42: Single;
    M43: Single;
    M44: Single;
  end;
  PNumerics_Matrix4x4 = ^Numerics_Matrix4x4;

  // Windows.Foundation.TimeSpan
  TimeSpan = record
    Duration: Int64;
  end;
  PTimeSpan = ^TimeSpan;

  // Windows.System.SystemManagementContract
  SystemManagementContract = record
  end;
  PSystemManagementContract = ^SystemManagementContract;

  // Windows.System.Profile.ProfileHardwareTokenContract
  Profile_ProfileHardwareTokenContract = record
  end;
  PProfile_ProfileHardwareTokenContract = ^Profile_ProfileHardwareTokenContract;

  // Windows.System.Profile.ProfileSharedModeContract
  Profile_ProfileSharedModeContract = record
  end;
  PProfile_ProfileSharedModeContract = ^Profile_ProfileSharedModeContract;

  // Windows.System.Profile.SystemManufacturers.SystemManufacturersContract
  Profile_SystemManufacturers_SystemManufacturersContract = record
  end;
  PProfile_SystemManufacturers_SystemManufacturersContract = ^Profile_SystemManufacturers_SystemManufacturersContract;

  // Windows.System.Profile.ProfileRetailInfoContract
  Profile_ProfileRetailInfoContract = record
  end;
  PProfile_ProfileRetailInfoContract = ^Profile_ProfileRetailInfoContract;

  // Windows.System.UserProfile.UserProfileContract
  UserProfile_UserProfileContract = record
  end;
  PUserProfile_UserProfileContract = ^UserProfile_UserProfileContract;

  // Windows.System.UserProfile.UserProfileLockScreenContract
  UserProfile_UserProfileLockScreenContract = record
  end;
  PUserProfile_UserProfileLockScreenContract = ^UserProfile_UserProfileLockScreenContract;

  // Windows.Services.TargetedContent.TargetedContentContract
  TargetedContent_TargetedContentContract = record
  end;
  PTargetedContent_TargetedContentContract = ^TargetedContent_TargetedContentContract;

  // Windows.Services.Maps.LocalSearchContract
  Maps_LocalSearchContract = record
  end;
  PMaps_LocalSearchContract = ^Maps_LocalSearchContract;

  // Windows.Services.Maps.GuidanceContract
  Maps_GuidanceContract = record
  end;
  PMaps_GuidanceContract = ^Maps_GuidanceContract;

  // Windows.Services.Store.StoreContract
  StoreContract = record
  end;
  PStoreContract = ^StoreContract;

  // Windows.Services.Store.StorePackageUpdateStatus
  StorePackageUpdateStatus = record
    PackageFamilyName: HSTRING;
    PackageDownloadSizeInBytes: UInt64;
    PackageBytesDownloaded: UInt64;
    PackageDownloadProgress: Double;
    TotalDownloadProgress: Double;
    PackageUpdateState: StorePackageUpdateState;
  end;
  PStorePackageUpdateStatus = ^StorePackageUpdateStatus;

  // Windows.Storage.Search.SortEntry
  Search_SortEntry = record
    PropertyName: HSTRING;
    AscendingOrder: Boolean;
  end;
  PSearch_SortEntry = ^Search_SortEntry;

  // Windows.Storage.AccessCache.AccessListEntry
  AccessCache_AccessListEntry = record
    Token: HSTRING;
    Metadata: HSTRING;
  end;
  PAccessCache_AccessListEntry = ^AccessCache_AccessListEntry;

  // Windows.Storage.Provider.CloudFilesContract
  Provider_CloudFilesContract = record
  end;
  PProvider_CloudFilesContract = ^Provider_CloudFilesContract;

  // Windows.ApplicationModel.Calls.CallsVoipContract
  Calls_CallsVoipContract = record
  end;
  PCalls_CallsVoipContract = ^Calls_CallsVoipContract;

  // Windows.ApplicationModel.SocialInfo.SocialInfoContract
  SocialInfo_SocialInfoContract = record
  end;
  PSocialInfo_SocialInfoContract = ^SocialInfo_SocialInfoContract;

  // Windows.ApplicationModel.FullTrustAppContract
  FullTrustAppContract = record
  end;
  PFullTrustAppContract = ^FullTrustAppContract;

  // Windows.ApplicationModel.StartupTaskContract
  StartupTaskContract = record
  end;
  PStartupTaskContract = ^StartupTaskContract;

  // Windows.ApplicationModel.Search.Core.SearchCoreContract
  Search_Core_SearchCoreContract = record
  end;
  PSearch_Core_SearchCoreContract = ^Search_Core_SearchCoreContract;

  // Windows.ApplicationModel.Calls.LockScreenCallContract
  Calls_LockScreenCallContract = record
  end;
  PCalls_LockScreenCallContract = ^Calls_LockScreenCallContract;

  // Windows.ApplicationModel.PackageVersion
  PackageVersion = record
    Major: Word;
    Minor: Word;
    Build: Word;
    Revision: Word;
  end;
  PPackageVersion = ^PackageVersion;

  // Windows.ApplicationModel.Resources.Core.ResourceLayoutInfo
  Resources_Core_ResourceLayoutInfo = record
    MajorVersion: Cardinal;
    MinorVersion: Cardinal;
    ResourceSubtreeCount: Cardinal;
    NamedResourceCount: Cardinal;
    Checksum: Integer;
  end;
  PResources_Core_ResourceLayoutInfo = ^Resources_Core_ResourceLayoutInfo;

  // Windows.ApplicationModel.Preview.Notes.PreviewNotesContract
  Preview_Notes_PreviewNotesContract = record
  end;
  PPreview_Notes_PreviewNotesContract = ^Preview_Notes_PreviewNotesContract;

  // Windows.ApplicationModel.Calls.Background.CallsBackgroundContract
  Calls_Background_CallsBackgroundContract = record
  end;
  PCalls_Background_CallsBackgroundContract = ^Calls_Background_CallsBackgroundContract;

  // Windows.ApplicationModel.Activation.ActivatedEventsContract
  Activation_ActivatedEventsContract = record
  end;
  PActivation_ActivatedEventsContract = ^Activation_ActivatedEventsContract;

  // Windows.ApplicationModel.Activation.ActivationCameraSettingsContract
  Activation_ActivationCameraSettingsContract = record
  end;
  PActivation_ActivationCameraSettingsContract = ^Activation_ActivationCameraSettingsContract;

  // Windows.ApplicationModel.Activation.ContactActivatedEventsContract
  Activation_ContactActivatedEventsContract = record
  end;
  PActivation_ContactActivatedEventsContract = ^Activation_ContactActivatedEventsContract;

  // Windows.ApplicationModel.Activation.WebUISearchActivatedEventsContract
  Activation_WebUISearchActivatedEventsContract = record
  end;
  PActivation_WebUISearchActivatedEventsContract = ^Activation_WebUISearchActivatedEventsContract;

  // Windows.ApplicationModel.Preview.InkWorkspace.PreviewInkWorkspaceContract
  Preview_InkWorkspace_PreviewInkWorkspaceContract = record
  end;
  PPreview_InkWorkspace_PreviewInkWorkspaceContract = ^Preview_InkWorkspace_PreviewInkWorkspaceContract;

  // Windows.ApplicationModel.Resources.Management.ResourceIndexerContract
  Resources_Management_ResourceIndexerContract = record
  end;
  PResources_Management_ResourceIndexerContract = ^Resources_Management_ResourceIndexerContract;

  // Windows.ApplicationModel.Search.SearchContract
  Search_SearchContract = record
  end;
  PSearch_SearchContract = ^Search_SearchContract;

  // Windows.ApplicationModel.Wallet.WalletContract
  Wallet_WalletContract = record
  end;
  PWallet_WalletContract = ^Wallet_WalletContract;

  // Windows.ApplicationModel.Background.BackgroundAlarmApplicationContract
  BackgroundAlarmApplicationContract = record
  end;
  PBackgroundAlarmApplicationContract = ^BackgroundAlarmApplicationContract;

  // Windows.Data.Text.TextSegment
  Text_TextSegment = record
    StartPosition: Cardinal;
    Length: Cardinal;
  end;
  PText_TextSegment = ^Text_TextSegment;

  // Windows.Devices.Custom.CustomDeviceContract
  Custom_CustomDeviceContract = record
  end;
  PCustom_CustomDeviceContract = ^Custom_CustomDeviceContract;

  // Windows.Devices.Printers.PrintersContract
  Printers_PrintersContract = record
  end;
  PPrinters_PrintersContract = ^Printers_PrintersContract;

  // Windows.Devices.DevicesLowLevelContract
  DevicesLowLevelContract = record
  end;
  PDevicesLowLevelContract = ^DevicesLowLevelContract;

  // Windows.Devices.Gpio.GpioChangeRecord
  Gpio_GpioChangeRecord = record
    RelativeTime: TimeSpan;
    Edge: Gpio_GpioPinEdge;
  end;
  PGpio_GpioChangeRecord = ^Gpio_GpioChangeRecord;

  // Windows.Devices.Gpio.GpioChangeCount
  Gpio_GpioChangeCount = record
    Count: UInt64;
    RelativeTime: TimeSpan;
  end;
  PGpio_GpioChangeCount = ^Gpio_GpioChangeCount;

  // Windows.Devices.I2c.Provider.ProviderI2cTransferResult
  I2c_Provider_ProviderI2cTransferResult = record
    Status: I2c_Provider_ProviderI2cTransferStatus;
    BytesTransferred: Cardinal;
  end;
  PI2c_Provider_ProviderI2cTransferResult = ^I2c_Provider_ProviderI2cTransferResult;

  // Windows.Devices.I2c.I2cTransferResult
  I2c_I2cTransferResult = record
    Status: I2c_I2cTransferStatus;
    BytesTransferred: Cardinal;
  end;
  PI2c_I2cTransferResult = ^I2c_I2cTransferResult;

  // Windows.Devices.SmartCards.SmartCardBackgroundTriggerContract
  SmartCards_SmartCardBackgroundTriggerContract = record
  end;
  PSmartCards_SmartCardBackgroundTriggerContract = ^SmartCards_SmartCardBackgroundTriggerContract;

  // Windows.Devices.SmartCards.SmartCardEmulatorContract
  SmartCards_SmartCardEmulatorContract = record
  end;
  PSmartCards_SmartCardEmulatorContract = ^SmartCards_SmartCardEmulatorContract;

  // Windows.Devices.Input.PointerDeviceUsage
  Input_PointerDeviceUsage = record
    UsagePage: Cardinal;
    Usage: Cardinal;
    MinLogical: Integer;
    MaxLogical: Integer;
    MinPhysical: Integer;
    MaxPhysical: Integer;
    &Unit: Cardinal;
    PhysicalMultiplier: Single;
  end;
  PInput_PointerDeviceUsage = ^Input_PointerDeviceUsage;

  // Windows.Devices.Input.MouseDelta
  Input_MouseDelta = record
    X: Integer;
    Y: Integer;
  end;
  PInput_MouseDelta = ^Input_MouseDelta;

  // Windows.Devices.Portable.PortableDeviceContract
  Portable_PortableDeviceContract = record
  end;
  PPortable_PortableDeviceContract = ^Portable_PortableDeviceContract;

  // Windows.Devices.Printers.Extensions.ExtensionsContract
  Printers_Extensions_ExtensionsContract = record
  end;
  PPrinters_Extensions_ExtensionsContract = ^Printers_Extensions_ExtensionsContract;

  // Windows.Devices.Geolocation.BasicGeoposition
  BasicGeoposition = record
    Latitude: Double;
    Longitude: Double;
    Altitude: Double;
  end;
  PBasicGeoposition = ^BasicGeoposition;

  // Windows.Devices.Scanners.ScannerDeviceContract
  ScannerDeviceContract = record
  end;
  PScannerDeviceContract = ^ScannerDeviceContract;

  // Windows.Devices.Scanners.ImageScannerResolution
  ImageScannerResolution = record
    DpiX: Single;
    DpiY: Single;
  end;
  PImageScannerResolution = ^ImageScannerResolution;

  // Windows.Devices.Sms.SmsEncodedLength
  SmsEncodedLength = record
    SegmentCount: Cardinal;
    CharacterCountLastSegment: Cardinal;
    CharactersPerSegment: Cardinal;
    ByteCountLastSegment: Cardinal;
    BytesPerSegment: Cardinal;
  end;
  PSmsEncodedLength = ^SmsEncodedLength;

  // Windows.Devices.Sms.LegacySmsApiContract
  LegacySmsApiContract = record
  end;
  PLegacySmsApiContract = ^LegacySmsApiContract;

  // Windows.Gaming.UI.GamingUIProviderContract
  UI_GamingUIProviderContract = record
  end;
  PUI_GamingUIProviderContract = ^UI_GamingUIProviderContract;

  // Windows.Gaming.Input.Custom.GameControllerVersionInfo
  Input_Custom_GameControllerVersionInfo = record
    Major: Word;
    Minor: Word;
    Build: Word;
    Revision: Word;
  end;
  PInput_Custom_GameControllerVersionInfo = ^Input_Custom_GameControllerVersionInfo;

  // Windows.Gaming.Input.Custom.GipFirmwareUpdateProgress
  Input_Custom_GipFirmwareUpdateProgress = record
    PercentCompleted: Double;
    CurrentComponentId: Cardinal;
  end;
  PInput_Custom_GipFirmwareUpdateProgress = ^Input_Custom_GipFirmwareUpdateProgress;

  // Windows.Gaming.Input.ArcadeStickReading
  Input_ArcadeStickReading = record
    Timestamp: UInt64;
    Buttons: Input_ArcadeStickButtons;
  end;
  PInput_ArcadeStickReading = ^Input_ArcadeStickReading;

  // Windows.Gaming.Input.FlightStickReading
  Input_FlightStickReading = record
    Timestamp: UInt64;
    Buttons: Input_FlightStickButtons;
    HatSwitch: Input_GameControllerSwitchPosition;
    Roll: Double;
    Pitch: Double;
    Yaw: Double;
    Throttle: Double;
  end;
  PInput_FlightStickReading = ^Input_FlightStickReading;

  // Windows.Gaming.Input.GamepadReading
  Input_GamepadReading = record
    Timestamp: UInt64;
    Buttons: Input_GamepadButtons;
    LeftTrigger: Double;
    RightTrigger: Double;
    LeftThumbstickX: Double;
    LeftThumbstickY: Double;
    RightThumbstickX: Double;
    RightThumbstickY: Double;
  end;
  PInput_GamepadReading = ^Input_GamepadReading;

  // Windows.Gaming.Input.GamepadVibration
  Input_GamepadVibration = record
    LeftMotor: Double;
    RightMotor: Double;
    LeftTrigger: Double;
    RightTrigger: Double;
  end;
  PInput_GamepadVibration = ^Input_GamepadVibration;

  // Windows.Gaming.Input.RacingWheelReading
  Input_RacingWheelReading = record
    Timestamp: UInt64;
    Buttons: Input_RacingWheelButtons;
    PatternShifterGear: Integer;
    Wheel: Double;
    Throttle: Double;
    Brake: Double;
    Clutch: Double;
    Handbrake: Double;
  end;
  PInput_RacingWheelReading = ^Input_RacingWheelReading;

  // Windows.Gaming.Input.UINavigationReading
  Input_UINavigationReading = record
    Timestamp: UInt64;
    RequiredButtons: Input_RequiredUINavigationButtons;
    OptionalButtons: Input_OptionalUINavigationButtons;
  end;
  PInput_UINavigationReading = ^Input_UINavigationReading;

  // Windows.Gaming.XboxLive.StorageApiContract
  XboxLive_StorageApiContract = record
  end;
  PXboxLive_StorageApiContract = ^XboxLive_StorageApiContract;

  // Windows.Gaming.Input.GamingInputPreviewContract
  Input_GamingInputPreviewContract = record
  end;
  PInput_GamingInputPreviewContract = ^Input_GamingInputPreviewContract;

  // Windows.Gaming.Preview.GamesEnumerationContract
  Preview_GamesEnumerationContract = record
  end;
  PPreview_GamesEnumerationContract = ^Preview_GamesEnumerationContract;

  // Windows.Gaming.UI.GameChatOverlayContract
  UI_GameChatOverlayContract = record
  end;
  PUI_GameChatOverlayContract = ^UI_GameChatOverlayContract;

  // Windows.Globalization.GlobalizationJapanesePhoneticAnalyzerContract
  GlobalizationJapanesePhoneticAnalyzerContract = record
  end;
  PGlobalizationJapanesePhoneticAnalyzerContract = ^GlobalizationJapanesePhoneticAnalyzerContract;

  // Windows.Graphics.Printing3D.Printing3DContract
  Printing3D_Printing3DContract = record
  end;
  PPrinting3D_Printing3DContract = ^Printing3D_Printing3DContract;

  // Windows.Graphics.Printing3D.Printing3DBufferDescription
  Printing3D_Printing3DBufferDescription = record
    Format: Printing3D_Printing3DBufferFormat;
    Stride: Cardinal;
  end;
  PPrinting3D_Printing3DBufferDescription = ^Printing3D_Printing3DBufferDescription;

  // Windows.Graphics.Imaging.BitmapBounds
  Imaging_BitmapBounds = record
    X: Cardinal;
    Y: Cardinal;
    Width: Cardinal;
    Height: Cardinal;
  end;
  PImaging_BitmapBounds = ^Imaging_BitmapBounds;

  // Windows.Graphics.Imaging.BitmapSize
  Imaging_BitmapSize = record
    Width: Cardinal;
    Height: Cardinal;
  end;
  PImaging_BitmapSize = ^Imaging_BitmapSize;

  // Windows.Graphics.Imaging.BitmapPlaneDescription
  Imaging_BitmapPlaneDescription = record
    StartIndex: Integer;
    Width: Integer;
    Height: Integer;
    Stride: Integer;
  end;
  PImaging_BitmapPlaneDescription = ^Imaging_BitmapPlaneDescription;

  // Windows.Graphics.Display.Core.HdmiDisplayHdr2086Metadata
  Display_Core_HdmiDisplayHdr2086Metadata = record
    RedPrimaryX: Word;
    RedPrimaryY: Word;
    GreenPrimaryX: Word;
    GreenPrimaryY: Word;
    BluePrimaryX: Word;
    BluePrimaryY: Word;
    WhitePointX: Word;
    WhitePointY: Word;
    MaxMasteringLuminance: Word;
    MinMasteringLuminance: Word;
    MaxContentLightLevel: Word;
    MaxFrameAverageLightLevel: Word;
  end;
  PDisplay_Core_HdmiDisplayHdr2086Metadata = ^Display_Core_HdmiDisplayHdr2086Metadata;

  // Windows.Graphics.Printing.PrintPageDescription
  Printing_PrintPageDescription = record
    PageSize: TSizeF;
    ImageableRect: TRectF;
    DpiX: Cardinal;
    DpiY: Cardinal;
  end;
  PPrinting_PrintPageDescription = ^Printing_PrintPageDescription;

  // Windows.Graphics.PointInt32
  PointInt32 = record
    X: Integer;
    Y: Integer;
  end;
  PPointInt32 = ^PointInt32;

  // Windows.Graphics.SizeInt32
  SizeInt32 = record
    Width: Integer;
    Height: Integer;
  end;
  PSizeInt32 = ^SizeInt32;

  // Windows.Graphics.RectInt32
  RectInt32 = record
    X: Integer;
    Y: Integer;
    Width: Integer;
    Height: Integer;
  end;
  PRectInt32 = ^RectInt32;

  // Windows.Graphics.Holographic.HolographicStereoTransform
  Holographic_HolographicStereoTransform = record
    Left: Numerics_Matrix4x4;
    Right: Numerics_Matrix4x4;
  end;
  PHolographic_HolographicStereoTransform = ^Holographic_HolographicStereoTransform;

  // Windows.Graphics.Holographic.HolographicAdapterId
  Holographic_HolographicAdapterId = record
    LowPart: Cardinal;
    HighPart: Integer;
  end;
  PHolographic_HolographicAdapterId = ^Holographic_HolographicAdapterId;

  // Windows.Graphics.DirectX.Direct3D11.Direct3DMultisampleDescription
  DirectX_Direct3D11_Direct3DMultisampleDescription = record
    Count: Integer;
    Quality: Integer;
  end;
  PDirectX_Direct3D11_Direct3DMultisampleDescription = ^DirectX_Direct3D11_Direct3DMultisampleDescription;

  // Windows.Graphics.DirectX.Direct3D11.Direct3DSurfaceDescription
  DirectX_Direct3D11_Direct3DSurfaceDescription = record
    Width: Integer;
    Height: Integer;
    Format: DirectX_DirectXPixelFormat;
    MultisampleDescription: DirectX_Direct3D11_Direct3DMultisampleDescription;
  end;
  PDirectX_Direct3D11_Direct3DSurfaceDescription = ^DirectX_Direct3D11_Direct3DSurfaceDescription;

  // Windows.Management.Deployment.DeploymentProgress
  Deployment_DeploymentProgress = record
    state: Deployment_DeploymentProgressState;
    percentage: Cardinal;
  end;
  PDeployment_DeploymentProgress = ^Deployment_DeploymentProgress;

  // Windows.Management.Workplace.WorkplaceSettingsContract
  Workplace_WorkplaceSettingsContract = record
  end;
  PWorkplace_WorkplaceSettingsContract = ^Workplace_WorkplaceSettingsContract;

  // Windows.Management.Deployment.Preview.DeploymentPreviewContract
  Deployment_Preview_DeploymentPreviewContract = record
  end;
  PDeployment_Preview_DeploymentPreviewContract = ^Deployment_Preview_DeploymentPreviewContract;

  // Windows.Media.Capture.AppCaptureContract
  Capture_AppCaptureContract = record
  end;
  PCapture_AppCaptureContract = ^Capture_AppCaptureContract;

  // Windows.Media.AppRecording.AppRecordingContract
  AppRecording_AppRecordingContract = record
  end;
  PAppRecording_AppRecordingContract = ^AppRecording_AppRecordingContract;

  // Windows.Media.AppBroadcasting.AppBroadcastingContract
  AppBroadcasting_AppBroadcastingContract = record
  end;
  PAppBroadcasting_AppBroadcastingContract = ^AppBroadcasting_AppBroadcastingContract;

  // Windows.Media.Capture.WhiteBalanceGain
  Capture_WhiteBalanceGain = record
    R: Double;
    G: Double;
    B: Double;
  end;
  PCapture_WhiteBalanceGain = ^Capture_WhiteBalanceGain;

  // Windows.Media.Core.TimedTextPadding
  Core_TimedTextPadding = record
    Before: Double;
    After: Double;
    Start: Double;
    &End: Double;
    &Unit: Core_TimedTextUnit;
  end;
  PCore_TimedTextPadding = ^Core_TimedTextPadding;

  // Windows.Media.Core.TimedTextSize
  Core_TimedTextSize = record
    Height: Double;
    Width: Double;
    &Unit: Core_TimedTextUnit;
  end;
  PCore_TimedTextSize = ^Core_TimedTextSize;

  // Windows.Media.Core.TimedTextDouble
  Core_TimedTextDouble = record
    Value: Double;
    &Unit: Core_TimedTextUnit;
  end;
  PCore_TimedTextDouble = ^Core_TimedTextDouble;

  // Windows.Media.Core.TimedTextPoint
  Core_TimedTextPoint = record
    X: Double;
    Y: Double;
    &Unit: Core_TimedTextUnit;
  end;
  PCore_TimedTextPoint = ^Core_TimedTextPoint;

  // Windows.Media.Import.PhotoImportProgress
  Import_PhotoImportProgress = record
    ItemsImported: Cardinal;
    TotalItemsToImport: Cardinal;
    BytesImported: UInt64;
    TotalBytesToImport: UInt64;
    ImportProgress: Double;
  end;
  PImport_PhotoImportProgress = ^Import_PhotoImportProgress;

  // Windows.Media.MediaTimeRange
  MediaTimeRange = record
    Start: TimeSpan;
    &End: TimeSpan;
  end;
  PMediaTimeRange = ^MediaTimeRange;

  // Windows.Media.Core.MseTimeRange
  Core_MseTimeRange = record
    Start: TimeSpan;
    &End: TimeSpan;
  end;
  PCore_MseTimeRange = ^Core_MseTimeRange;

  // Windows.Media.Capture.AppCaptureMetadataContract
  Capture_AppCaptureMetadataContract = record
  end;
  PCapture_AppCaptureMetadataContract = ^Capture_AppCaptureMetadataContract;

  // Windows.Media.Capture.AppBroadcastContract
  Capture_AppBroadcastContract = record
  end;
  PCapture_AppBroadcastContract = ^Capture_AppBroadcastContract;

  // Windows.Media.Capture.CameraCaptureUIContract
  Capture_CameraCaptureUIContract = record
  end;
  PCapture_CameraCaptureUIContract = ^Capture_CameraCaptureUIContract;

  // Windows.Media.Capture.GameBarContract
  Capture_GameBarContract = record
  end;
  PCapture_GameBarContract = ^Capture_GameBarContract;

  // Windows.Media.MediaControlContract
  MediaControlContract = record
  end;
  PMediaControlContract = ^MediaControlContract;

  // Windows.Media.Playlists.PlaylistsContract
  Playlists_PlaylistsContract = record
  end;
  PPlaylists_PlaylistsContract = ^Playlists_PlaylistsContract;

  // Windows.Media.Protection.ProtectionRenewalContract
  Protection_ProtectionRenewalContract = record
  end;
  PProtection_ProtectionRenewalContract = ^Protection_ProtectionRenewalContract;

  // Windows.Media.Devices.CallControlContract
  CallControlContract = record
  end;
  PCallControlContract = ^CallControlContract;

  // Windows.Networking.BackgroundTransfer.BackgroundDownloadProgress
  BackgroundTransfer_BackgroundDownloadProgress = record
    BytesReceived: UInt64;
    TotalBytesToReceive: UInt64;
    Status: BackgroundTransfer_BackgroundTransferStatus;
    HasResponseChanged: Boolean;
    HasRestarted: Boolean;
  end;
  PBackgroundTransfer_BackgroundDownloadProgress = ^BackgroundTransfer_BackgroundDownloadProgress;

  // Windows.Networking.BackgroundTransfer.BackgroundUploadProgress
  BackgroundTransfer_BackgroundUploadProgress = record
    BytesReceived: UInt64;
    BytesSent: UInt64;
    TotalBytesToReceive: UInt64;
    TotalBytesToSend: UInt64;
    Status: BackgroundTransfer_BackgroundTransferStatus;
    HasResponseChanged: Boolean;
    HasRestarted: Boolean;
  end;
  PBackgroundTransfer_BackgroundUploadProgress = ^BackgroundTransfer_BackgroundUploadProgress;

  // Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
  BackgroundTransfer_BackgroundTransferFileRange = record
    Offset: UInt64;
    Length: UInt64;
  end;
  PBackgroundTransfer_BackgroundTransferFileRange = ^BackgroundTransfer_BackgroundTransferFileRange;

  // Windows.Networking.XboxLive.XboxLiveSecureSocketsContract
  XboxLive_XboxLiveSecureSocketsContract = record
  end;
  PXboxLive_XboxLiveSecureSocketsContract = ^XboxLive_XboxLiveSecureSocketsContract;

  // Windows.Networking.Connectivity.NetworkUsageStates
  NetworkUsageStates = record
    Roaming: TriStates;
    Shared: TriStates;
  end;
  PNetworkUsageStates = ^NetworkUsageStates;

  // Windows.Networking.Connectivity.WwanContract
  WwanContract = record
  end;
  PWwanContract = ^WwanContract;

  // Windows.Networking.NetworkOperators.LegacyNetworkOperatorsContract
  LegacyNetworkOperatorsContract = record
  end;
  PLegacyNetworkOperatorsContract = ^LegacyNetworkOperatorsContract;

  // Windows.Networking.NetworkOperators.ProfileUsage
  ProfileUsage = record
    UsageInMegabytes: Cardinal;
    LastSyncTime: DateTime;
  end;
  PProfileUsage = ^ProfileUsage;

  // Windows.Networking.Sockets.RoundTripTimeStatistics
  RoundTripTimeStatistics = record
    Variance: Cardinal;
    Max: Cardinal;
    Min: Cardinal;
    Sum: Cardinal;
  end;
  PRoundTripTimeStatistics = ^RoundTripTimeStatistics;

  // Windows.Networking.Sockets.BandwidthStatistics
  BandwidthStatistics = record
    OutboundBitsPerSecond: UInt64;
    InboundBitsPerSecond: UInt64;
    OutboundBitsPerSecondInstability: UInt64;
    InboundBitsPerSecondInstability: UInt64;
    OutboundBandwidthPeaked: Boolean;
    InboundBandwidthPeaked: Boolean;
  end;
  PBandwidthStatistics = ^BandwidthStatistics;

  // Windows.Networking.Sockets.ControlChannelTriggerContract
  ControlChannelTriggerContract = record
  end;
  PControlChannelTriggerContract = ^ControlChannelTriggerContract;

  // Windows.Perception.Spatial.SpatialBoundingFrustum
  Spatial_SpatialBoundingFrustum = record
    Near: Numerics_Plane;
    Far: Numerics_Plane;
    Right: Numerics_Plane;
    Left: Numerics_Plane;
    Top: Numerics_Plane;
    Bottom: Numerics_Plane;
  end;
  PSpatial_SpatialBoundingFrustum = ^Spatial_SpatialBoundingFrustum;

  // Windows.Perception.Spatial.SpatialBoundingBox
  Spatial_SpatialBoundingBox = record
    Center: Numerics_Vector3;
    Extents: Numerics_Vector3;
  end;
  PSpatial_SpatialBoundingBox = ^Spatial_SpatialBoundingBox;

  // Windows.Perception.Spatial.SpatialBoundingOrientedBox
  Spatial_SpatialBoundingOrientedBox = record
    Center: Numerics_Vector3;
    Extents: Numerics_Vector3;
    Orientation: Numerics_Quaternion;
  end;
  PSpatial_SpatialBoundingOrientedBox = ^Spatial_SpatialBoundingOrientedBox;

  // Windows.Perception.Spatial.SpatialBoundingSphere
  Spatial_SpatialBoundingSphere = record
    Center: Numerics_Vector3;
    Radius: Single;
  end;
  PSpatial_SpatialBoundingSphere = ^Spatial_SpatialBoundingSphere;

  // Windows.Perception.Automation.Core.PerceptionAutomationCoreContract
  Automation_Core_PerceptionAutomationCoreContract = record
  end;
  PAutomation_Core_PerceptionAutomationCoreContract = ^Automation_Core_PerceptionAutomationCoreContract;

  // Windows.Security.EnterpriseData.EnterpriseDataContract
  EnterpriseData_EnterpriseDataContract = record
  end;
  PEnterpriseData_EnterpriseDataContract = ^EnterpriseData_EnterpriseDataContract;

  // Windows.Security.ExchangeActiveSyncProvisioning.EasContract
  ExchangeActiveSyncProvisioning_EasContract = record
  end;
  PExchangeActiveSyncProvisioning_EasContract = ^ExchangeActiveSyncProvisioning_EasContract;

  // Windows.UI.Color
  Color = record
    A: Byte;
    R: Byte;
    G: Byte;
    B: Byte;
  end;
  PColor = ^Color;

  // Windows.UI.ApplicationSettings.ApplicationsSettingsContract
  ApplicationSettings_ApplicationsSettingsContract = record
  end;
  PApplicationSettings_ApplicationsSettingsContract = ^ApplicationSettings_ApplicationsSettingsContract;

  // Windows.UI.Core.CoreWindowDialogsContract
  CoreWindowDialogsContract = record
  end;
  PCoreWindowDialogsContract = ^CoreWindowDialogsContract;

  // Windows.UI.Core.CorePhysicalKeyStatus
  CorePhysicalKeyStatus = record
    RepeatCount: Cardinal;
    ScanCode: Cardinal;
    IsExtendedKey: Boolean;
    IsMenuKeyDown: Boolean;
    WasKeyDown: Boolean;
    IsKeyReleased: Boolean;
  end;
  PCorePhysicalKeyStatus = ^CorePhysicalKeyStatus;

  // Windows.UI.Core.CoreProximityEvaluation
  CoreProximityEvaluation = record
    Score: Integer;
    AdjustedPoint: TPointF;
  end;
  PCoreProximityEvaluation = ^CoreProximityEvaluation;

  // Windows.UI.Core.AnimationMetrics.AnimationMetricsContract
  AnimationMetrics_AnimationMetricsContract = record
  end;
  PAnimationMetrics_AnimationMetricsContract = ^AnimationMetrics_AnimationMetricsContract;

  // Windows.UI.Input.Preview.Injection.InjectedInputRectangle
  Preview_Injection_InjectedInputRectangle = record
    Left: Integer;
    Top: Integer;
    Bottom: Integer;
    Right: Integer;
  end;
  PPreview_Injection_InjectedInputRectangle = ^Preview_Injection_InjectedInputRectangle;

  // Windows.UI.Input.Preview.Injection.InjectedInputPoint
  Preview_Injection_InjectedInputPoint = record
    PositionX: Integer;
    PositionY: Integer;
  end;
  PPreview_Injection_InjectedInputPoint = ^Preview_Injection_InjectedInputPoint;

  // Windows.UI.Input.Preview.Injection.InjectedInputPointerInfo
  Preview_Injection_InjectedInputPointerInfo = record
    PointerId: Cardinal;
    PointerOptions: Preview_Injection_InjectedInputPointerOptions;
    PixelLocation: Preview_Injection_InjectedInputPoint;
    TimeOffsetInMilliseconds: Cardinal;
    PerformanceCount: UInt64;
  end;
  PPreview_Injection_InjectedInputPointerInfo = ^Preview_Injection_InjectedInputPointerInfo;

  // Windows.UI.Input.ManipulationDelta
  ManipulationDelta = record
    Translation: TPointF;
    Scale: Single;
    Rotation: Single;
    Expansion: Single;
  end;
  PManipulationDelta = ^ManipulationDelta;

  // Windows.UI.Input.ManipulationVelocities
  ManipulationVelocities = record
    Linear: TPointF;
    Angular: Single;
    Expansion: Single;
  end;
  PManipulationVelocities = ^ManipulationVelocities;

  // Windows.UI.Input.CrossSlideThresholds
  CrossSlideThresholds = record
    SelectionStart: Single;
    SpeedBumpStart: Single;
    SpeedBumpEnd: Single;
    RearrangeStart: Single;
  end;
  PCrossSlideThresholds = ^CrossSlideThresholds;

  // Windows.UI.Text.Core.CoreTextRange
  Core_CoreTextRange = record
    StartCaretPosition: Integer;
    EndCaretPosition: Integer;
  end;
  PCore_CoreTextRange = ^Core_CoreTextRange;

  // Windows.UI.Text.FontWeight
  FontWeight = record
    Weight: Word;
  end;
  PFontWeight = ^FontWeight;

  // Windows.UI.ViewManagement.ViewManagementViewScalingContract
  ViewManagementViewScalingContract = record
  end;
  PViewManagementViewScalingContract = ^ViewManagementViewScalingContract;

  // Windows.UI.Xaml.Documents.TextRange
  Documents_TextRange = record
    StartIndex: Integer;
    Length: Integer;
  end;
  PDocuments_TextRange = ^Documents_TextRange;

  // Windows.UI.Xaml.CornerRadius
  CornerRadius = record
    TopLeft: Double;
    TopRight: Double;
    BottomRight: Double;
    BottomLeft: Double;
  end;
  PCornerRadius = ^CornerRadius;

  // Windows.UI.Xaml.Duration
  Duration = record
    TimeSpan: TimeSpan;
    &Type: DurationType;
  end;
  PDuration = ^Duration;

  // Windows.UI.Xaml.Thickness
  Thickness = record
    Left: Double;
    Top: Double;
    Right: Double;
    Bottom: Double;
  end;
  PThickness = ^Thickness;

  // Windows.UI.Xaml.Media.Matrix
  Media_Matrix = record
    M11: Double;
    M12: Double;
    M21: Double;
    M22: Double;
    OffsetX: Double;
    OffsetY: Double;
  end;
  PMedia_Matrix = ^Media_Matrix;

  // Windows.UI.Xaml.Media.Animation.KeyTime
  Media_Animation_KeyTime = record
    TimeSpan: TimeSpan;
  end;
  PMedia_Animation_KeyTime = ^Media_Animation_KeyTime;

  // Windows.UI.Xaml.Media.Animation.RepeatBehavior
  Media_Animation_RepeatBehavior = record
    Count: Double;
    Duration: TimeSpan;
    &Type: Media_Animation_RepeatBehaviorType;
  end;
  PMedia_Animation_RepeatBehavior = ^Media_Animation_RepeatBehavior;

  // Windows.UI.Xaml.Controls.Primitives.GeneratorPosition
  Controls_Primitives_GeneratorPosition = record
    Index: Integer;
    Offset: Integer;
  end;
  PControls_Primitives_GeneratorPosition = ^Controls_Primitives_GeneratorPosition;

  // Windows.UI.Xaml.Automation.Peers.RawElementProviderRuntimeId
  Automation_Peers_RawElementProviderRuntimeId = record
    Part1: Cardinal;
    Part2: Cardinal;
  end;
  PAutomation_Peers_RawElementProviderRuntimeId = ^Automation_Peers_RawElementProviderRuntimeId;

  // Windows.UI.Xaml.Data.LoadMoreItemsResult
  Data_LoadMoreItemsResult = record
    Count: Cardinal;
  end;
  PData_LoadMoreItemsResult = ^Data_LoadMoreItemsResult;

  // Windows.UI.Xaml.Media.Media3D.Matrix3D
  Media_Media3D_Matrix3D = record
    M11: Double;
    M12: Double;
    M13: Double;
    M14: Double;
    M21: Double;
    M22: Double;
    M23: Double;
    M24: Double;
    M31: Double;
    M32: Double;
    M33: Double;
    M34: Double;
    OffsetX: Double;
    OffsetY: Double;
    OffsetZ: Double;
    M44: Double;
  end;
  PMedia_Media3D_Matrix3D = ^Media_Media3D_Matrix3D;

  // Windows.UI.Xaml.Interop.TypeName
  Interop_TypeName = record
    Name: HSTRING;
    Kind: Interop_TypeKind;
  end;
  PInterop_TypeName = ^Interop_TypeName;

  // Windows.UI.Xaml.GridLength
  GridLength = record
    Value: Double;
    GridUnitType: GridUnitType;
  end;
  PGridLength = ^GridLength;

  // Windows.UI.Xaml.Markup.XamlBinaryWriterErrorInformation
  Markup_XamlBinaryWriterErrorInformation = record
    InputStreamIndex: Cardinal;
    LineNumber: Cardinal;
    LinePosition: Cardinal;
  end;
  PMarkup_XamlBinaryWriterErrorInformation = ^Markup_XamlBinaryWriterErrorInformation;

  // Windows.UI.Xaml.Markup.XmlnsDefinition
  Markup_XmlnsDefinition = record
    XmlNamespace: HSTRING;
    Namespace: HSTRING;
  end;
  PMarkup_XmlnsDefinition = ^Markup_XmlnsDefinition;

  // Windows.UI.Xaml.Controls.Maps.MapZoomLevelRange
  Controls_Maps_MapZoomLevelRange = record
    Min: Double;
    Max: Double;
  end;
  PControls_Maps_MapZoomLevelRange = ^Controls_Maps_MapZoomLevelRange;

  // Windows.UI.Xaml.Hosting.HostingContract
  Hosting_HostingContract = record
  end;
  PHosting_HostingContract = ^Hosting_HostingContract;

  // Windows.Web.Http.HttpProgress
  Http_HttpProgress = record
    Stage: Http_HttpProgressStage;
    BytesSent: UInt64;
    TotalBytesToSend: IReference_1__UInt64;
    BytesReceived: UInt64;
    TotalBytesToReceive: IReference_1__UInt64;
    Retries: Cardinal;
  end;
  PHttp_HttpProgress = ^Http_HttpProgress;

  // Windows.Web.Syndication.RetrievalProgress
  Syndication_RetrievalProgress = record
    BytesRetrieved: Cardinal;
    TotalBytesToRetrieve: Cardinal;
  end;
  PSyndication_RetrievalProgress = ^Syndication_RetrievalProgress;

  // Windows.Web.Syndication.TransferProgress
  Syndication_TransferProgress = record
    BytesSent: Cardinal;
    TotalBytesToSend: Cardinal;
    BytesRetrieved: Cardinal;
    TotalBytesToRetrieve: Cardinal;
  end;
  PSyndication_TransferProgress = ^Syndication_TransferProgress;

  // Windows.Web.Http.Diagnostics.HttpDiagnosticsContract
  Http_Diagnostics_HttpDiagnosticsContract = record
  end;
  PHttp_Diagnostics_HttpDiagnosticsContract = ^Http_Diagnostics_HttpDiagnosticsContract;


  // Emit Forwarded interfaces
  //  Interfaces
  // Windows.Foundation.IReference`1<UInt64>
  // External 
  IReference_1__UInt64 = interface(IInspectable)
  ['{6755E376-53BB-568B-A11D-17239868309E}']
    function get_Value: UInt64; safecall;
    property Value: UInt64 read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IPropertySet>
  IAsyncOperation_1__IPropertySet_Base = interface(IInspectable)
  ['{490B0686-AFD7-5037-9647-D8FE248F182C}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IPropertySet>
  // External 
  IAsyncOperation_1__IPropertySet = interface(IAsyncOperation_1__IPropertySet_Base)
  ['{490B0686-AFD7-5037-9647-D8FE248F182C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IPropertySet); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IPropertySet; safecall;
    function GetResults: IPropertySet; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IPropertySet read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IPropertySet>
  AsyncOperationCompletedHandler_1__IPropertySet_Delegate_Base = interface(IUnknown)
  ['{5075A55F-68BA-56F2-97E6-9B1CBFA2C5F2}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IPropertySet>
  // External 
  AsyncOperationCompletedHandler_1__IPropertySet = interface(AsyncOperationCompletedHandler_1__IPropertySet_Delegate_Base)
  ['{5075A55F-68BA-56F2-97E6-9B1CBFA2C5F2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IPropertySet; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Foundation.Collections.IPropertySet
  // External 
  IPropertySet = interface(IInspectable)
  ['{8A43ED9F-F4E6-4421-ACF9-1DAB2986820C}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.Store.IStorePackageLicense,Object>
  TypedEventHandler_2__IStorePackageLicense__IInspectable_Delegate_Base = interface(IUnknown)
  ['{6C59D637-2970-5F64-9511-D39AC245BC94}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.Store.IStorePackageLicense,Object>
  // External 
  TypedEventHandler_2__IStorePackageLicense__IInspectable = interface(TypedEventHandler_2__IStorePackageLicense__IInspectable_Delegate_Base)
  ['{A60D9EA4-F3BA-5685-8F84-04DAC0F5300B}']
    procedure Invoke(sender: IStorePackageLicense; args: IInspectable); safecall;
  end;

  // Windows.Services.Store.IStorePackageLicense
  // External 
  IStorePackageLicense = interface(IInspectable)
  ['{0C465714-14E1-4973-BD14-F77724271E99}']
    function add_LicenseLost(handler: TypedEventHandler_2__IStorePackageLicense__IInspectable): EventRegistrationToken; safecall;
    procedure remove_LicenseLost(token: EventRegistrationToken); safecall;
    function get_Package: IPackage; safecall;
    function get_IsValid: Boolean; safecall;
    procedure ReleaseLicense; safecall;
    property IsValid: Boolean read get_IsValid;
    property Package: IPackage read get_Package;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.IPackage
  // External 
  IPackage = interface(IInspectable)
  ['{163C792F-BD75-413C-BF23-B1FE7B95D825}']
    function get_Id: IPackageId; safecall;
    function get_InstalledLocation: IStorageFolder; safecall;
    function get_IsFramework: Boolean; safecall;
    function get_Dependencies: IVectorView_1__IPackage; safecall;
    property Dependencies: IVectorView_1__IPackage read get_Dependencies;
    property Id: IPackageId read get_Id;
    property InstalledLocation: IStorageFolder read get_InstalledLocation;
    property IsFramework: Boolean read get_IsFramework;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.IPackageId
  // External 
  IPackageId = interface(IInspectable)
  ['{1ADB665E-37C7-4790-9980-DD7AE74E8BB2}']
    function get_Name: HSTRING; safecall;
    function get_Version: PackageVersion; safecall;
    function get_Architecture: ProcessorArchitecture; safecall;
    function get_ResourceId: HSTRING; safecall;
    function get_Publisher: HSTRING; safecall;
    function get_PublisherId: HSTRING; safecall;
    function get_FullName: HSTRING; safecall;
    function get_FamilyName: HSTRING; safecall;
    property Architecture: ProcessorArchitecture read get_Architecture;
    property FamilyName: HSTRING read get_FamilyName;
    property FullName: HSTRING read get_FullName;
    property Name: HSTRING read get_Name;
    property Publisher: HSTRING read get_Publisher;
    property PublisherId: HSTRING read get_PublisherId;
    property ResourceId: HSTRING read get_ResourceId;
    property Version: PackageVersion read get_Version;
  end;

  // Windows.Storage.IStorageFolder
  // External 
  IStorageFolder = interface(IInspectable)
  ['{72D1CB78-B3EF-4F75-A80B-6FD9DAE2944B}']
    function CreateFileAsync(desiredName: HSTRING): IAsyncOperation_1__IStorageFile; overload; safecall;
    function CreateFileAsync(desiredName: HSTRING; options: CreationCollisionOption): IAsyncOperation_1__IStorageFile; overload; safecall;
    function CreateFolderAsync(desiredName: HSTRING): IAsyncOperation_1__IStorageFolder; overload; safecall;
    function CreateFolderAsync(desiredName: HSTRING; options: CreationCollisionOption): IAsyncOperation_1__IStorageFolder; overload; safecall;
    function GetFileAsync(name: HSTRING): IAsyncOperation_1__IStorageFile; safecall;
    function GetFolderAsync(name: HSTRING): IAsyncOperation_1__IStorageFolder; safecall;
    function GetItemAsync(name: HSTRING): IAsyncOperation_1__IStorageItem; safecall;
    function GetFilesAsync: IAsyncOperation_1__IVectorView_1__IStorageFile; safecall;
    function GetFoldersAsync: IAsyncOperation_1__IVectorView_1__IStorageFolder; safecall;
    function GetItemsAsync: IAsyncOperation_1__IVectorView_1__IStorageItem; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  IAsyncOperation_1__IStorageFile_Base = interface(IInspectable)
  ['{5E52F8CE-ACED-5A42-95B4-F674DD84885E}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // External 
  IAsyncOperation_1__IStorageFile = interface(IAsyncOperation_1__IStorageFile_Base)
  ['{31C5C3AB-4BF6-51D1-B590-C6EFC00E9FF2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageFile); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageFile; safecall;
    function GetResults: IStorageFile; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageFile read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  AsyncOperationCompletedHandler_1__IStorageFile_Delegate_Base = interface(IUnknown)
  ['{E521C894-2C26-5946-9E61-2B5E188D01ED}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFile>
  // External 
  AsyncOperationCompletedHandler_1__IStorageFile = interface(AsyncOperationCompletedHandler_1__IStorageFile_Delegate_Base)
  ['{1247300D-7973-53D5-889F-5279D9322114}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageFile; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Storage.IStorageFile
  // External 
  IStorageFile = interface(IInspectable)
  ['{FA3F6186-4214-428C-A64C-14C9AC7315EA}']
    function get_FileType: HSTRING; safecall;
    function get_ContentType: HSTRING; safecall;
    function OpenAsync(accessMode: FileAccessMode): IAsyncOperation_1__IRandomAccessStream; safecall;
    function OpenTransactedWriteAsync: IAsyncOperation_1__IStorageStreamTransaction; safecall;
    function CopyAsync(destinationFolder: IStorageFolder): IAsyncOperation_1__IStorageFile; overload; safecall;
    function CopyAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING): IAsyncOperation_1__IStorageFile; overload; safecall;
    function CopyAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING; option: NameCollisionOption): IAsyncOperation_1__IStorageFile; overload; safecall;
    function CopyAndReplaceAsync(fileToReplace: IStorageFile): IAsyncAction; safecall;
    function MoveAsync(destinationFolder: IStorageFolder): IAsyncAction; overload; safecall;
    function MoveAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING): IAsyncAction; overload; safecall;
    function MoveAsync(destinationFolder: IStorageFolder; desiredNewName: HSTRING; option: NameCollisionOption): IAsyncAction; overload; safecall;
    function MoveAndReplaceAsync(fileToReplace: IStorageFile): IAsyncAction; safecall;
    property ContentType: HSTRING read get_ContentType;
    property FileType: HSTRING read get_FileType;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  IAsyncOperation_1__IRandomAccessStream_Base = interface(IInspectable)
  ['{430ECECE-1418-5D19-81B2-5DDB381603CC}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  // External 
  IAsyncOperation_1__IRandomAccessStream = interface(IAsyncOperation_1__IRandomAccessStream_Base)
  ['{430ECECE-1418-5D19-81B2-5DDB381603CC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IRandomAccessStream); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IRandomAccessStream; safecall;
    function GetResults: IRandomAccessStream; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IRandomAccessStream read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStream>
  AsyncOperationCompletedHandler_1__IRandomAccessStream_Delegate_Base = interface(IUnknown)
  ['{398C4183-793D-5B00-819B-4AEF92485E94}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStream>
  // External 
  AsyncOperationCompletedHandler_1__IRandomAccessStream = interface(AsyncOperationCompletedHandler_1__IRandomAccessStream_Delegate_Base)
  ['{398C4183-793D-5B00-819B-4AEF92485E94}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IRandomAccessStream; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Storage.Streams.IRandomAccessStream
  // External 
  IRandomAccessStream = interface(IInspectable)
  ['{905A0FE1-BC53-11DF-8C49-001E4FC686DA}']
    function get_Size: UInt64; safecall;
    procedure put_Size(value: UInt64); safecall;
    function GetInputStreamAt(position: UInt64): IInputStream; safecall;
    function GetOutputStreamAt(position: UInt64): IOutputStream; safecall;
    function get_Position: UInt64; safecall;
    procedure Seek(position: UInt64); safecall;
    function CloneStream: IRandomAccessStream; safecall;
    function get_CanRead: Boolean; safecall;
    function get_CanWrite: Boolean; safecall;
    property CanRead: Boolean read get_CanRead;
    property CanWrite: Boolean read get_CanWrite;
    property Position: UInt64 read get_Position;
    property Size: UInt64 read get_Size write put_Size;
  end;

  // DualAPI Interface
  // Windows.Storage.Streams.IInputStream
  // External 
  IInputStream = interface(IInspectable)
  ['{905A0FE2-BC53-11DF-8C49-001E4FC686DA}']
    function ReadAsync(buffer: IBuffer; count: Cardinal; options: InputStreamOptions): IAsyncOperationWithProgress_2__IBuffer__Cardinal; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal_Base = interface(IInspectable)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  // External 
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface(IAsyncOperationWithProgress_2__IBuffer__Cardinal_Base)
  ['{D26B2819-897F-5C7D-84D6-56D796561431}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal_Delegate_Base = interface(IUnknown)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // External 
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface(AsyncOperationProgressHandler_2__IBuffer__Cardinal_Delegate_Base)
  ['{BF666554-7605-5D9A-B14E-18D8C8472AFE}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal_Delegate_Base = interface(IUnknown)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal_Delegate_Base)
  ['{06386A7A-E009-5B0B-AB68-A8E48B516647}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Storage.Streams.IBuffer
  // External 
  IBuffer = interface(IInspectable)
  ['{905A0FE0-BC53-11DF-8C49-001E4FC686DA}']
    function get_Capacity: Cardinal; safecall;
    function get_Length: Cardinal; safecall;
    procedure put_Length(value: Cardinal); safecall;
    property Capacity: Cardinal read get_Capacity;
    property Length: Cardinal read get_Length write put_Length;
  end;

  // DualAPI Interface
  // Windows.Storage.Streams.IOutputStream
  // External 
  IOutputStream = interface(IInspectable)
  ['{905A0FE6-BC53-11DF-8C49-001E4FC686DA}']
    function WriteAsync(buffer: IBuffer): IAsyncOperationWithProgress_2__Cardinal__Cardinal; safecall;
    function FlushAsync: IAsyncOperation_1__Boolean; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal_Base = interface(IInspectable)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // External 
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface(IAsyncOperationWithProgress_2__Cardinal__Cardinal_Base)
  ['{ECCB574A-C684-5572-A679-6B0842CFB57F}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Cardinal__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Progress: AsyncOperationProgressHandler_2__Cardinal__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal_Delegate_Base = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  // External 
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(AsyncOperationProgressHandler_2__Cardinal__Cardinal_Delegate_Base)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal_Delegate_Base = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal_Delegate_Base)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean_Base = interface(IInspectable)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Boolean>
  // External 
  IAsyncOperation_1__Boolean = interface(IAsyncOperation_1__Boolean_Base)
  ['{CDB5EFB3-5788-509D-9BE1-71CCB8A3362A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Boolean); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Boolean; safecall;
    function GetResults: Boolean; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Boolean read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean_Delegate_Base = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  // External 
  AsyncOperationCompletedHandler_1__Boolean = interface(AsyncOperationCompletedHandler_1__Boolean_Delegate_Base)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  IAsyncOperation_1__IStorageStreamTransaction_Base = interface(IInspectable)
  ['{0D81405A-9BD3-5E87-82F4-9B4128A887EB}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  // External 
  IAsyncOperation_1__IStorageStreamTransaction = interface(IAsyncOperation_1__IStorageStreamTransaction_Base)
  ['{C5926392-4ECC-526D-BBC1-725AE3F7C449}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageStreamTransaction); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageStreamTransaction; safecall;
    function GetResults: IStorageStreamTransaction; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageStreamTransaction read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  AsyncOperationCompletedHandler_1__IStorageStreamTransaction_Delegate_Base = interface(IUnknown)
  ['{D11739E6-2995-5D33-BFFF-51B6041F68C1}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageStreamTransaction>
  // External 
  AsyncOperationCompletedHandler_1__IStorageStreamTransaction = interface(AsyncOperationCompletedHandler_1__IStorageStreamTransaction_Delegate_Base)
  ['{4F03213E-DFDA-5E67-98AC-0D139B467B19}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageStreamTransaction; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Storage.IStorageStreamTransaction
  // External 
  IStorageStreamTransaction = interface(IInspectable)
  ['{F67CF363-A53D-4D94-AE2C-67232D93ACDD}']
    function get_Stream: IRandomAccessStream; safecall;
    function CommitAsync: IAsyncAction; safecall;
    property Stream: IRandomAccessStream read get_Stream;
  end;

  // Windows.Foundation.IAsyncAction
  // External 
  IAsyncAction = interface(IInspectable)
  ['{5A648006-843A-4DA9-865B-9D26E5DFAD7B}']
    procedure put_Completed(handler: AsyncActionCompletedHandler); safecall;
    function get_Completed: AsyncActionCompletedHandler; safecall;
    procedure GetResults; safecall;
    property Completed: AsyncActionCompletedHandler read get_Completed write put_Completed;
  end;

  // Windows.Foundation.AsyncActionCompletedHandler
  // External 
  AsyncActionCompletedHandler = interface(IUnknown)
  ['{A4ED5C81-76C9-40BD-8BE6-B1D90FB20AE7}']
    procedure Invoke(asyncInfo: IAsyncAction; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  IAsyncOperation_1__IStorageFolder_Base = interface(IInspectable)
  ['{6BE9E7D7-E83A-5CBC-802C-1768960B52C3}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // External 
  IAsyncOperation_1__IStorageFolder = interface(IAsyncOperation_1__IStorageFolder_Base)
  ['{68EA25EA-D88C-5DB0-A24A-BBCBDFCD3ECC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageFolder); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageFolder; safecall;
    function GetResults: IStorageFolder; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageFolder read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  AsyncOperationCompletedHandler_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{C211026E-9E63-5452-BA54-3A07D6A96874}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageFolder>
  // External 
  AsyncOperationCompletedHandler_1__IStorageFolder = interface(AsyncOperationCompletedHandler_1__IStorageFolder_Delegate_Base)
  ['{8254DF53-F8CD-570A-AEB9-F2C0AD5368AC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageFolder; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  IAsyncOperation_1__IStorageItem_Base = interface(IInspectable)
  ['{5FC9C137-EBB7-5E6C-9CBA-686F2EC2B0BB}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageItem>
  // External 
  IAsyncOperation_1__IStorageItem = interface(IAsyncOperation_1__IStorageItem_Base)
  ['{5FC9C137-EBB7-5E6C-9CBA-686F2EC2B0BB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorageItem); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorageItem; safecall;
    function GetResults: IStorageItem; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorageItem read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageItem>
  AsyncOperationCompletedHandler_1__IStorageItem_Delegate_Base = interface(IUnknown)
  ['{92C3102F-A327-5318-A6C1-76F6B2A0ABFB}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IStorageItem>
  // External 
  AsyncOperationCompletedHandler_1__IStorageItem = interface(AsyncOperationCompletedHandler_1__IStorageItem_Delegate_Base)
  ['{92C3102F-A327-5318-A6C1-76F6B2A0ABFB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorageItem; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Storage.IStorageItem
  // External 
  IStorageItem = interface(IInspectable)
  ['{4207A996-CA2F-42F7-BDE8-8B10457A7F30}']
    function RenameAsync(desiredName: HSTRING): IAsyncAction; overload; safecall;
    function RenameAsync(desiredName: HSTRING; option: NameCollisionOption): IAsyncAction; overload; safecall;
    function DeleteAsync: IAsyncAction; overload; safecall;
    function DeleteAsync(option: StorageDeleteOption): IAsyncAction; overload; safecall;
    function GetBasicPropertiesAsync: IAsyncOperation_1__FileProperties_IBasicProperties; safecall;
    function get_Name: HSTRING; safecall;
    function get_Path: HSTRING; safecall;
    function get_Attributes: FileAttributes; safecall;
    function get_DateCreated: DateTime; safecall;
    function IsOfType(&type: StorageItemTypes): Boolean; safecall;
    property Attributes: FileAttributes read get_Attributes;
    property DateCreated: DateTime read get_DateCreated;
    property Name: HSTRING read get_Name;
    property Path: HSTRING read get_Path;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  IAsyncOperation_1__FileProperties_IBasicProperties_Base = interface(IInspectable)
  ['{5186131A-4467-504B-977A-0785A8230485}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IBasicProperties>
  // External 
  IAsyncOperation_1__FileProperties_IBasicProperties = interface(IAsyncOperation_1__FileProperties_IBasicProperties_Base)
  ['{ADA07FD2-C777-5490-BD12-C0E6D722EAD7}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties; safecall;
    function GetResults: FileProperties_IBasicProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties_Delegate_Base = interface(IUnknown)
  ['{C8659AAE-4926-52AD-8F60-D89FE5A8DF5F}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IBasicProperties>
  // External 
  AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IBasicProperties_Delegate_Base)
  ['{129B0F62-E176-5FB1-A3B9-69FEEE1BFB29}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IBasicProperties; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Storage.FileProperties.IBasicProperties
  // External 
  FileProperties_IBasicProperties = interface(IInspectable)
  ['{D05D55DB-785E-4A66-BE02-9BEEC58AEA81}']
    function get_Size: UInt64; safecall;
    function get_DateModified: DateTime; safecall;
    function get_ItemDate: DateTime; safecall;
    property DateModified: DateTime read get_DateModified;
    property ItemDate: DateTime read get_ItemDate;
    property Size: UInt64 read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  IAsyncOperation_1__IVectorView_1__IStorageFile_Base = interface(IInspectable)
  ['{03362E33-E413-5F29-97D0-48A4780935F9}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // External 
  IAsyncOperation_1__IVectorView_1__IStorageFile = interface(IAsyncOperation_1__IVectorView_1__IStorageFile_Base)
  ['{9751F304-CBA2-5A44-890D-0DBD9F173C43}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile; safecall;
    function GetResults: IVectorView_1__IStorageFile; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile_Delegate_Base = interface(IUnknown)
  ['{CB4206C5-0988-5104-AFA9-253C298F86FD}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // External 
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFile_Delegate_Base)
  ['{3B203E3A-6A0E-5FA3-A300-EAF350152625}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorageFile; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  // External 
  IVectorView_1__IStorageFile = interface(IInspectable)
  ['{4296B6E8-E219-5E74-8DDE-196F57200A82}']
    function GetAt(index: Cardinal): IStorageFile; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorageFile; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorageFile): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  IAsyncOperation_1__IVectorView_1__IStorageFolder_Base = interface(IInspectable)
  ['{CA40B21B-AEB1-5A61-9E08-3BD5D9594023}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // External 
  IAsyncOperation_1__IVectorView_1__IStorageFolder = interface(IAsyncOperation_1__IVectorView_1__IStorageFolder_Base)
  ['{A4D504A3-0D7B-5497-B35F-0889A2AF16FD}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder; safecall;
    function GetResults: IVectorView_1__IStorageFolder; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{ED2D1D9B-26EC-5BE7-A8A3-56458933D25F}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>>
  // External 
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IStorageFolder_Delegate_Base)
  ['{AEF07EE0-9203-543D-90C9-088DE0DF94E4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorageFolder; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  // External 
  IVectorView_1__IStorageFolder = interface(IInspectable)
  ['{6A8C9209-6392-5B08-AEE9-F2ADD7DECC49}']
    function GetAt(index: Cardinal): IStorageFolder; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorageFolder; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorageFolder): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  IAsyncOperation_1__IVectorView_1__IStorageItem_Base = interface(IInspectable)
  ['{4B1C0FD7-7A01-5E7A-A6FE-BE4500283F23}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  // External 
  IAsyncOperation_1__IVectorView_1__IStorageItem = interface(IAsyncOperation_1__IVectorView_1__IStorageItem_Base)
  ['{4B1C0FD7-7A01-5E7A-A6FE-BE4500283F23}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem; safecall;
    function GetResults: IVectorView_1__IStorageItem; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem_Delegate_Base = interface(IUnknown)
  ['{51436E75-ACE1-5A68-B260-F843B846F0DB}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>>
  // External 
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IStorageItem_Delegate_Base)
  ['{51436E75-ACE1-5A68-B260-F843B846F0DB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorageItem; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  // External 
  IVectorView_1__IStorageItem = interface(IInspectable)
  ['{85575A41-06CB-58D0-B98A-7C8F06E6E9D7}']
    function GetAt(index: Cardinal): IStorageItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorageItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorageItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IPackage>
  // External 
  IVectorView_1__IPackage = interface(IInspectable)
  ['{77191FA5-6652-5BC7-82EB-CDDF0E2F7ECD}']
    function GetAt(index: Cardinal): IPackage; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPackage; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPackage): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.Store.IStoreContext,Object>
  TypedEventHandler_2__IStoreContext__IInspectable_Delegate_Base = interface(IUnknown)
  ['{D5A00AC7-082D-547C-A04B-2540C1CDE97A}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Services.Store.IStoreContext,Object>
  // External 
  TypedEventHandler_2__IStoreContext__IInspectable = interface(TypedEventHandler_2__IStoreContext__IInspectable_Delegate_Base)
  ['{B1B19242-A891-5BEA-AD67-2F755CE676BA}']
    procedure Invoke(sender: IStoreContext; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Services.Store.IStoreContext
  // External 
  IStoreContext = interface(IInspectable)
  ['{AC98B6BE-F4FD-4912-BABD-5035E5E8BCAB}']
    function get_User: IUser; safecall;
    function add_OfflineLicensesChanged(handler: TypedEventHandler_2__IStoreContext__IInspectable): EventRegistrationToken; safecall;
    procedure remove_OfflineLicensesChanged(token: EventRegistrationToken); safecall;
    function GetCustomerPurchaseIdAsync(serviceTicket: HSTRING; publisherUserId: HSTRING): IAsyncOperation_1__HSTRING; safecall;
    function GetCustomerCollectionsIdAsync(serviceTicket: HSTRING; publisherUserId: HSTRING): IAsyncOperation_1__HSTRING; safecall;
    function GetAppLicenseAsync: IAsyncOperation_1__IStoreAppLicense; safecall;
    function GetStoreProductForCurrentAppAsync: IAsyncOperation_1__IStoreProductResult; safecall;
    function GetStoreProductsAsync(productKinds: IIterable_1__HSTRING; storeIds: IIterable_1__HSTRING): IAsyncOperation_1__IStoreProductQueryResult; safecall;
    function GetAssociatedStoreProductsAsync(productKinds: IIterable_1__HSTRING): IAsyncOperation_1__IStoreProductQueryResult; safecall;
    function GetAssociatedStoreProductsWithPagingAsync(productKinds: IIterable_1__HSTRING; maxItemsToRetrievePerPage: Cardinal): IAsyncOperation_1__IStoreProductPagedQueryResult; safecall;
    function GetUserCollectionAsync(productKinds: IIterable_1__HSTRING): IAsyncOperation_1__IStoreProductQueryResult; safecall;
    function GetUserCollectionWithPagingAsync(productKinds: IIterable_1__HSTRING; maxItemsToRetrievePerPage: Cardinal): IAsyncOperation_1__IStoreProductPagedQueryResult; safecall;
    function ReportConsumableFulfillmentAsync(productStoreId: HSTRING; quantity: Cardinal; trackingId: TGuid): IAsyncOperation_1__IStoreConsumableResult; safecall;
    function GetConsumableBalanceRemainingAsync(productStoreId: HSTRING): IAsyncOperation_1__IStoreConsumableResult; safecall;
    function AcquireStoreLicenseForOptionalPackageAsync(optionalPackage: IPackage): IAsyncOperation_1__IStoreAcquireLicenseResult; safecall;
    function RequestPurchaseAsync(storeId: HSTRING): IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function RequestPurchaseAsync(storeId: HSTRING; storePurchaseProperties: IStorePurchaseProperties): IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function GetAppAndOptionalStorePackageUpdatesAsync: IAsyncOperation_1__IVectorView_1__IStorePackageUpdate; safecall;
    function RequestDownloadStorePackageUpdatesAsync(storePackageUpdates: IIterable_1__IStorePackageUpdate): IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus; safecall;
    function RequestDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates: IIterable_1__IStorePackageUpdate): IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus; safecall;
    function RequestDownloadAndInstallStorePackagesAsync(storeIds: IIterable_1__HSTRING): IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus; safecall;
    property User: IUser read get_User;
  end;

  // DualAPI Interface
  // Windows.System.IUser
  // External 
  IUser = interface(IInspectable)
  ['{DF9A26C6-E746-4BCD-B5D4-120103C4209B}']
    function get_NonRoamableId: HSTRING; safecall;
    function get_AuthenticationStatus: UserAuthenticationStatus; safecall;
    function get_Type: UserType; safecall;
    function GetPropertyAsync(value: HSTRING): IAsyncOperation_1__IInspectable; safecall;
    function GetPropertiesAsync(values: IVectorView_1__HSTRING): IAsyncOperation_1__IPropertySet; safecall;
    function GetPictureAsync(desiredSize: UserPictureSize): IAsyncOperation_1__IRandomAccessStreamReference; safecall;
    property AuthenticationStatus: UserAuthenticationStatus read get_AuthenticationStatus;
    property NonRoamableId: HSTRING read get_NonRoamableId;
    property &Type: UserType read get_Type;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable_Base = interface(IInspectable)
  ['{ABF53C57-EE50-5342-B52A-26E3B8CC024F}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Object>
  // External 
  IAsyncOperation_1__IInspectable = interface(IAsyncOperation_1__IInspectable_Base)
  ['{ABF53C57-EE50-5342-B52A-26E3B8CC024F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IInspectable; safecall;
    function GetResults: IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IInspectable read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable_Delegate_Base = interface(IUnknown)
  ['{3F08262E-A2E1-5134-9297-E9211F481A2D}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  // External 
  AsyncOperationCompletedHandler_1__IInspectable = interface(AsyncOperationCompletedHandler_1__IInspectable_Delegate_Base)
  ['{3F08262E-A2E1-5134-9297-E9211F481A2D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<String>
  // External 
  IVectorView_1__HSTRING = interface(IInspectable)
  ['{2F13C006-A03A-5F69-B090-75A43E33423E}']
    function GetAt(index: Cardinal): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HSTRING; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  IAsyncOperation_1__IRandomAccessStreamReference_Base = interface(IInspectable)
  ['{65178D50-E6A2-5D16-B244-65E9725E5A0C}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  // External 
  IAsyncOperation_1__IRandomAccessStreamReference = interface(IAsyncOperation_1__IRandomAccessStreamReference_Base)
  ['{65178D50-E6A2-5D16-B244-65E9725E5A0C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IRandomAccessStreamReference); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IRandomAccessStreamReference; safecall;
    function GetResults: IRandomAccessStreamReference; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IRandomAccessStreamReference read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  AsyncOperationCompletedHandler_1__IRandomAccessStreamReference_Delegate_Base = interface(IUnknown)
  ['{60847289-EA0B-5DF6-89DF-F2C62CBA9693}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStreamReference>
  // External 
  AsyncOperationCompletedHandler_1__IRandomAccessStreamReference = interface(AsyncOperationCompletedHandler_1__IRandomAccessStreamReference_Delegate_Base)
  ['{60847289-EA0B-5DF6-89DF-F2C62CBA9693}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IRandomAccessStreamReference; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Storage.Streams.IRandomAccessStreamReference
  // External 
  IRandomAccessStreamReference = interface(IInspectable)
  ['{33EE3134-1DD6-4E3A-8067-D1C162E8642B}']
    function OpenReadAsync: IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  IAsyncOperation_1__IRandomAccessStreamWithContentType_Base = interface(IInspectable)
  ['{C4A57C5E-32B0-55B3-AD13-CE1C23041ED6}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // External 
  IAsyncOperation_1__IRandomAccessStreamWithContentType = interface(IAsyncOperation_1__IRandomAccessStreamWithContentType_Base)
  ['{C4A57C5E-32B0-55B3-AD13-CE1C23041ED6}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType; safecall;
    function GetResults: IRandomAccessStreamWithContentType; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType_Delegate_Base = interface(IUnknown)
  ['{86D455B2-D795-554C-9C31-BF6539349C19}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // External 
  AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType = interface(AsyncOperationCompletedHandler_1__IRandomAccessStreamWithContentType_Delegate_Base)
  ['{3DDDECF4-1D39-58E8-83B1-DBED541C7F35}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IRandomAccessStreamWithContentType; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Storage.Streams.IRandomAccessStreamWithContentType
  // External 
  IRandomAccessStreamWithContentType = interface(IInspectable)
  ['{CC254827-4B3D-438F-9232-10C76BC7E038}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING_Base = interface(IInspectable)
  ['{3E1FE603-F897-5263-B328-0806426B8A79}']
  end;
  // Windows.Foundation.IAsyncOperation`1<String>
  // External 
  IAsyncOperation_1__HSTRING = interface(IAsyncOperation_1__HSTRING_Base)
  ['{3E1FE603-F897-5263-B328-0806426B8A79}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HSTRING; safecall;
    function GetResults: HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HSTRING read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING_Delegate_Base = interface(IUnknown)
  ['{B79A741F-7FB5-50AE-9E99-911201EC3D41}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  // External 
  AsyncOperationCompletedHandler_1__HSTRING = interface(AsyncOperationCompletedHandler_1__HSTRING_Delegate_Base)
  ['{B79A741F-7FB5-50AE-9E99-911201EC3D41}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreAppLicense>
  IAsyncOperation_1__IStoreAppLicense_Base = interface(IInspectable)
  ['{3866370B-AFC6-5D01-84C2-4574628DE539}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreAppLicense>
  // External 
  IAsyncOperation_1__IStoreAppLicense = interface(IAsyncOperation_1__IStoreAppLicense_Base)
  ['{CA226C25-BABF-5F1E-8618-2C283333A3BD}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStoreAppLicense); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStoreAppLicense; safecall;
    function GetResults: IStoreAppLicense; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStoreAppLicense read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreAppLicense>
  AsyncOperationCompletedHandler_1__IStoreAppLicense_Delegate_Base = interface(IUnknown)
  ['{CEFF1E09-E506-50AD-A908-52038C256552}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreAppLicense>
  // External 
  AsyncOperationCompletedHandler_1__IStoreAppLicense = interface(AsyncOperationCompletedHandler_1__IStoreAppLicense_Delegate_Base)
  ['{87F9166A-AB97-5E61-8BCE-FBAF8AFB06A3}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStoreAppLicense; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStoreAppLicense
  // External 
  IStoreAppLicense = interface(IInspectable)
  ['{F389F9DE-73C0-45CE-9BAB-B2FE3E5EAFD3}']
    function get_SkuStoreId: HSTRING; safecall;
    function get_IsActive: Boolean; safecall;
    function get_IsTrial: Boolean; safecall;
    function get_ExpirationDate: DateTime; safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    function get_AddOnLicenses: IMapView_2__HSTRING__IStoreLicense; safecall;
    function get_TrialTimeRemaining: TimeSpan; safecall;
    function get_IsTrialOwnedByThisUser: Boolean; safecall;
    function get_TrialUniqueId: HSTRING; safecall;
    property AddOnLicenses: IMapView_2__HSTRING__IStoreLicense read get_AddOnLicenses;
    property ExpirationDate: DateTime read get_ExpirationDate;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData;
    property IsActive: Boolean read get_IsActive;
    property IsTrial: Boolean read get_IsTrial;
    property IsTrialOwnedByThisUser: Boolean read get_IsTrialOwnedByThisUser;
    property SkuStoreId: HSTRING read get_SkuStoreId;
    property TrialTimeRemaining: TimeSpan read get_TrialTimeRemaining;
    property TrialUniqueId: HSTRING read get_TrialUniqueId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.Store.IStoreLicense>
  IMapView_2__HSTRING__IStoreLicense_Base = interface(IInspectable)
  ['{7D0D74F5-4020-54AA-9F3D-0F17127ACDDF}']
  end;
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.Store.IStoreLicense>
  // External 
  IMapView_2__HSTRING__IStoreLicense = interface(IMapView_2__HSTRING__IStoreLicense_Base)
  ['{877D23DB-AF94-5D7C-B9D5-659B7FD285C5}']
    function Lookup(key: HSTRING): IStoreLicense; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IStoreLicense; out second: IMapView_2__HSTRING__IStoreLicense); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Services.Store.IStoreLicense
  // External 
  IStoreLicense = interface(IInspectable)
  ['{26DC9579-4C4F-4F30-BC89-649F60E36055}']
    function get_SkuStoreId: HSTRING; safecall;
    function get_IsActive: Boolean; safecall;
    function get_ExpirationDate: DateTime; safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    function get_InAppOfferToken: HSTRING; safecall;
    property ExpirationDate: DateTime read get_ExpirationDate;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData;
    property InAppOfferToken: HSTRING read get_InAppOfferToken;
    property IsActive: Boolean read get_IsActive;
    property SkuStoreId: HSTRING read get_SkuStoreId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductResult>
  IAsyncOperation_1__IStoreProductResult_Base = interface(IInspectable)
  ['{9E61E86B-6AFB-50AE-AFC1-C59F545108DD}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductResult>
  // External 
  IAsyncOperation_1__IStoreProductResult = interface(IAsyncOperation_1__IStoreProductResult_Base)
  ['{C071B5BC-BFF2-59D1-84FA-8ECBE3B73F8A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStoreProductResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStoreProductResult; safecall;
    function GetResults: IStoreProductResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStoreProductResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductResult>
  AsyncOperationCompletedHandler_1__IStoreProductResult_Delegate_Base = interface(IUnknown)
  ['{EB93E936-D515-5414-9D15-F050C0B8F521}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductResult>
  // External 
  AsyncOperationCompletedHandler_1__IStoreProductResult = interface(AsyncOperationCompletedHandler_1__IStoreProductResult_Delegate_Base)
  ['{318BEF1D-DC4E-5919-AB41-BA3C8898B4B2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStoreProductResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStoreProductResult
  // External 
  IStoreProductResult = interface(IInspectable)
  ['{B7674F73-3C87-4EE1-8201-F428359BD3AF}']
    function get_Product: IStoreProduct; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property Product: IStoreProduct read get_Product;
  end;

  // Windows.Services.Store.IStoreProduct
  // External 
  IStoreProduct = interface(IInspectable)
  ['{320E2C52-D760-450A-A42B-67D1E901AC90}']
    function get_StoreId: HSTRING; safecall;
    function get_Language: HSTRING; safecall;
    function get_Title: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_ProductKind: HSTRING; safecall;
    function get_HasDigitalDownload: Boolean; safecall;
    function get_Keywords: IVectorView_1__HSTRING; safecall;
    function get_Images: IVectorView_1__IStoreImage; safecall;
    function get_Videos: IVectorView_1__IStoreVideo; safecall;
    function get_Skus: IVectorView_1__IStoreSku; safecall;
    function get_IsInUserCollection: Boolean; safecall;
    function get_Price: IStorePrice; safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    function get_LinkUri: IUriRuntimeClass; safecall;
    function GetIsAnySkuInstalledAsync: IAsyncOperation_1__Boolean; safecall;
    function RequestPurchaseAsync: IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function RequestPurchaseAsync(storePurchaseProperties: IStorePurchaseProperties): IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function get_InAppOfferToken: HSTRING; safecall;
    property Description: HSTRING read get_Description;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData;
    property HasDigitalDownload: Boolean read get_HasDigitalDownload;
    property Images: IVectorView_1__IStoreImage read get_Images;
    property InAppOfferToken: HSTRING read get_InAppOfferToken;
    property IsInUserCollection: Boolean read get_IsInUserCollection;
    property Keywords: IVectorView_1__HSTRING read get_Keywords;
    property Language: HSTRING read get_Language;
    property LinkUri: IUriRuntimeClass read get_LinkUri;
    property Price: IStorePrice read get_Price;
    property ProductKind: HSTRING read get_ProductKind;
    property Skus: IVectorView_1__IStoreSku read get_Skus;
    property StoreId: HSTRING read get_StoreId;
    property Title: HSTRING read get_Title;
    property Videos: IVectorView_1__IStoreVideo read get_Videos;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreImage>
  // External 
  IVectorView_1__IStoreImage = interface(IInspectable)
  ['{641B279E-E8BE-5755-BF5F-058F31ED3A9C}']
    function GetAt(index: Cardinal): IStoreImage; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStoreImage; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStoreImage): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Services.Store.IStoreImage
  // External 
  IStoreImage = interface(IInspectable)
  ['{081FD248-ADB4-4B64-A993-784789926ED5}']
    function get_Uri: IUriRuntimeClass; safecall;
    function get_ImagePurposeTag: HSTRING; safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_Caption: HSTRING; safecall;
    property Caption: HSTRING read get_Caption;
    property Height: Cardinal read get_Height;
    property ImagePurposeTag: HSTRING read get_ImagePurposeTag;
    property Uri: IUriRuntimeClass read get_Uri;
    property Width: Cardinal read get_Width;
  end;

  // DualAPI Interface
  // Windows.Foundation.IUriRuntimeClass
  // External 
  IUriRuntimeClass = interface(IInspectable)
  ['{9E365E57-48B2-4160-956F-C7385120BBFC}']
    function get_AbsoluteUri: HSTRING; safecall;
    function get_DisplayUri: HSTRING; safecall;
    function get_Domain: HSTRING; safecall;
    function get_Extension: HSTRING; safecall;
    function get_Fragment: HSTRING; safecall;
    function get_Host: HSTRING; safecall;
    function get_Password: HSTRING; safecall;
    function get_Path: HSTRING; safecall;
    function get_Query: HSTRING; safecall;
    function get_QueryParsed: IWwwFormUrlDecoderRuntimeClass; safecall;
    function get_RawUri: HSTRING; safecall;
    function get_SchemeName: HSTRING; safecall;
    function get_UserName: HSTRING; safecall;
    function get_Port: Integer; safecall;
    function get_Suspicious: Boolean; safecall;
    function Equals(pUri: IUriRuntimeClass): Boolean; safecall;
    function CombineUri(relativeUri: HSTRING): IUriRuntimeClass; safecall;
    property AbsoluteUri: HSTRING read get_AbsoluteUri;
    property DisplayUri: HSTRING read get_DisplayUri;
    property Domain: HSTRING read get_Domain;
    property Extension: HSTRING read get_Extension;
    property Fragment: HSTRING read get_Fragment;
    property Host: HSTRING read get_Host;
    property Password: HSTRING read get_Password;
    property Path: HSTRING read get_Path;
    property Port: Integer read get_Port;
    property Query: HSTRING read get_Query;
    property QueryParsed: IWwwFormUrlDecoderRuntimeClass read get_QueryParsed;
    property RawUri: HSTRING read get_RawUri;
    property SchemeName: HSTRING read get_SchemeName;
    property Suspicious: Boolean read get_Suspicious;
    property UserName: HSTRING read get_UserName;
  end;

  // DualAPI Interface
  // Windows.Foundation.IWwwFormUrlDecoderRuntimeClass
  // External 
  IWwwFormUrlDecoderRuntimeClass = interface(IInspectable)
  ['{D45A0451-F225-4542-9296-0E1DF5D254DF}']
    function GetFirstValueByName(name: HSTRING): HSTRING; safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreVideo>
  // External 
  IVectorView_1__IStoreVideo = interface(IInspectable)
  ['{B240054D-573B-589D-9037-E5EC156D3F2C}']
    function GetAt(index: Cardinal): IStoreVideo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStoreVideo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStoreVideo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Services.Store.IStoreVideo
  // External 
  IStoreVideo = interface(IInspectable)
  ['{F26CB184-6F5E-4DC2-886C-3C63083C2F94}']
    function get_Uri: IUriRuntimeClass; safecall;
    function get_VideoPurposeTag: HSTRING; safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_Caption: HSTRING; safecall;
    function get_PreviewImage: IStoreImage; safecall;
    property Caption: HSTRING read get_Caption;
    property Height: Cardinal read get_Height;
    property PreviewImage: IStoreImage read get_PreviewImage;
    property Uri: IUriRuntimeClass read get_Uri;
    property VideoPurposeTag: HSTRING read get_VideoPurposeTag;
    property Width: Cardinal read get_Width;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreSku>
  // External 
  IVectorView_1__IStoreSku = interface(IInspectable)
  ['{C66AA27F-F6F7-53FB-A2A2-1C7CB2E12F78}']
    function GetAt(index: Cardinal): IStoreSku; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStoreSku; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStoreSku): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Services.Store.IStoreSku
  // External 
  IStoreSku = interface(IInspectable)
  ['{397E6F55-4440-4F03-863C-91F3FEC83D79}']
    function get_StoreId: HSTRING; safecall;
    function get_Language: HSTRING; safecall;
    function get_Title: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_IsTrial: Boolean; safecall;
    function get_CustomDeveloperData: HSTRING; safecall;
    function get_Images: IVectorView_1__IStoreImage; safecall;
    function get_Videos: IVectorView_1__IStoreVideo; safecall;
    function get_Availabilities: IVectorView_1__IStoreAvailability; safecall;
    function get_Price: IStorePrice; safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    function get_IsInUserCollection: Boolean; safecall;
    function get_BundledSkus: IVectorView_1__HSTRING; safecall;
    function get_CollectionData: IStoreCollectionData; safecall;
    function GetIsInstalledAsync: IAsyncOperation_1__Boolean; safecall;
    function RequestPurchaseAsync: IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function RequestPurchaseAsync(storePurchaseProperties: IStorePurchaseProperties): IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function get_IsSubscription: Boolean; safecall;
    function get_SubscriptionInfo: IStoreSubscriptionInfo; safecall;
    property Availabilities: IVectorView_1__IStoreAvailability read get_Availabilities;
    property BundledSkus: IVectorView_1__HSTRING read get_BundledSkus;
    property CollectionData: IStoreCollectionData read get_CollectionData;
    property CustomDeveloperData: HSTRING read get_CustomDeveloperData;
    property Description: HSTRING read get_Description;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData;
    property Images: IVectorView_1__IStoreImage read get_Images;
    property IsInUserCollection: Boolean read get_IsInUserCollection;
    property IsSubscription: Boolean read get_IsSubscription;
    property IsTrial: Boolean read get_IsTrial;
    property Language: HSTRING read get_Language;
    property Price: IStorePrice read get_Price;
    property StoreId: HSTRING read get_StoreId;
    property SubscriptionInfo: IStoreSubscriptionInfo read get_SubscriptionInfo;
    property Title: HSTRING read get_Title;
    property Videos: IVectorView_1__IStoreVideo read get_Videos;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStoreAvailability>
  // External 
  IVectorView_1__IStoreAvailability = interface(IInspectable)
  ['{831B70EA-807A-5FFD-9C1F-FD60E46387D5}']
    function GetAt(index: Cardinal): IStoreAvailability; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStoreAvailability; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStoreAvailability): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Services.Store.IStoreAvailability
  // External 
  IStoreAvailability = interface(IInspectable)
  ['{FA060325-0FFD-4493-AD43-F1F9918F69FA}']
    function get_StoreId: HSTRING; safecall;
    function get_EndDate: DateTime; safecall;
    function get_Price: IStorePrice; safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    function RequestPurchaseAsync: IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    function RequestPurchaseAsync(storePurchaseProperties: IStorePurchaseProperties): IAsyncOperation_1__IStorePurchaseResult; overload; safecall;
    property EndDate: DateTime read get_EndDate;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData;
    property Price: IStorePrice read get_Price;
    property StoreId: HSTRING read get_StoreId;
  end;

  // Windows.Services.Store.IStorePrice
  // External 
  IStorePrice = interface(IInspectable)
  ['{55BA94C4-15F1-407C-8F06-006380F4DF0B}']
    function get_FormattedBasePrice: HSTRING; safecall;
    function get_FormattedPrice: HSTRING; safecall;
    function get_IsOnSale: Boolean; safecall;
    function get_SaleEndDate: DateTime; safecall;
    function get_CurrencyCode: HSTRING; safecall;
    function get_FormattedRecurrencePrice: HSTRING; safecall;
    property CurrencyCode: HSTRING read get_CurrencyCode;
    property FormattedBasePrice: HSTRING read get_FormattedBasePrice;
    property FormattedPrice: HSTRING read get_FormattedPrice;
    property FormattedRecurrencePrice: HSTRING read get_FormattedRecurrencePrice;
    property IsOnSale: Boolean read get_IsOnSale;
    property SaleEndDate: DateTime read get_SaleEndDate;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStorePurchaseResult>
  IAsyncOperation_1__IStorePurchaseResult_Base = interface(IInspectable)
  ['{33D8CC30-78F5-5F81-AA2D-A4FA2A3B1C68}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStorePurchaseResult>
  // External 
  IAsyncOperation_1__IStorePurchaseResult = interface(IAsyncOperation_1__IStorePurchaseResult_Base)
  ['{CB0E05EF-67B6-5CE5-A236-E1D42A8E596D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStorePurchaseResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStorePurchaseResult; safecall;
    function GetResults: IStorePurchaseResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStorePurchaseResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStorePurchaseResult>
  AsyncOperationCompletedHandler_1__IStorePurchaseResult_Delegate_Base = interface(IUnknown)
  ['{1D9F89EE-2FCE-54E6-A0A9-52D00C52CC3A}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStorePurchaseResult>
  // External 
  AsyncOperationCompletedHandler_1__IStorePurchaseResult = interface(AsyncOperationCompletedHandler_1__IStorePurchaseResult_Delegate_Base)
  ['{2A34AE20-48B6-571D-B3E7-221126420352}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStorePurchaseResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStorePurchaseResult
  // External 
  IStorePurchaseResult = interface(IInspectable)
  ['{ADD28552-F96A-463D-A7BB-C20B4FCA6952}']
    function get_Status: StorePurchaseStatus; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property Status: StorePurchaseStatus read get_Status;
  end;

  // Windows.Services.Store.IStorePurchaseProperties
  // External 
  IStorePurchaseProperties = interface(IInspectable)
  ['{836278F3-FF87-4364-A5B4-FD2153EBE43B}']
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    procedure put_ExtendedJsonData(value: HSTRING); safecall;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData write put_ExtendedJsonData;
    property Name: HSTRING read get_Name write put_Name;
  end;

  // Windows.Services.Store.IStoreCollectionData
  // External 
  IStoreCollectionData = interface(IInspectable)
  ['{8AA4C3B3-5BB3-441A-2AB4-4DAB73D5CE67}']
    function get_IsTrial: Boolean; safecall;
    function get_CampaignId: HSTRING; safecall;
    function get_DeveloperOfferId: HSTRING; safecall;
    function get_AcquiredDate: DateTime; safecall;
    function get_StartDate: DateTime; safecall;
    function get_EndDate: DateTime; safecall;
    function get_TrialTimeRemaining: TimeSpan; safecall;
    function get_ExtendedJsonData: HSTRING; safecall;
    property AcquiredDate: DateTime read get_AcquiredDate;
    property CampaignId: HSTRING read get_CampaignId;
    property DeveloperOfferId: HSTRING read get_DeveloperOfferId;
    property EndDate: DateTime read get_EndDate;
    property ExtendedJsonData: HSTRING read get_ExtendedJsonData;
    property IsTrial: Boolean read get_IsTrial;
    property StartDate: DateTime read get_StartDate;
    property TrialTimeRemaining: TimeSpan read get_TrialTimeRemaining;
  end;

  // Windows.Services.Store.IStoreSubscriptionInfo
  // External 
  IStoreSubscriptionInfo = interface(IInspectable)
  ['{4189776A-0559-43AC-A9C6-3AB0011FB8EB}']
    function get_BillingPeriod: Cardinal; safecall;
    function get_BillingPeriodUnit: StoreDurationUnit; safecall;
    function get_HasTrialPeriod: Boolean; safecall;
    function get_TrialPeriod: Cardinal; safecall;
    function get_TrialPeriodUnit: StoreDurationUnit; safecall;
    property BillingPeriod: Cardinal read get_BillingPeriod;
    property BillingPeriodUnit: StoreDurationUnit read get_BillingPeriodUnit;
    property HasTrialPeriod: Boolean read get_HasTrialPeriod;
    property TrialPeriod: Cardinal read get_TrialPeriod;
    property TrialPeriodUnit: StoreDurationUnit read get_TrialPeriodUnit;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductQueryResult>
  IAsyncOperation_1__IStoreProductQueryResult_Base = interface(IInspectable)
  ['{9699E7BB-EA1F-5E03-9439-C80E6977B711}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductQueryResult>
  // External 
  IAsyncOperation_1__IStoreProductQueryResult = interface(IAsyncOperation_1__IStoreProductQueryResult_Base)
  ['{7F680236-A321-51CB-839B-804B9FD215E2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStoreProductQueryResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStoreProductQueryResult; safecall;
    function GetResults: IStoreProductQueryResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStoreProductQueryResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductQueryResult>
  AsyncOperationCompletedHandler_1__IStoreProductQueryResult_Delegate_Base = interface(IUnknown)
  ['{02F4A42C-0458-58D6-923C-B44BA8EF2222}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductQueryResult>
  // External 
  AsyncOperationCompletedHandler_1__IStoreProductQueryResult = interface(AsyncOperationCompletedHandler_1__IStoreProductQueryResult_Delegate_Base)
  ['{292E4706-ABCB-5774-A057-55448902142C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStoreProductQueryResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStoreProductQueryResult
  // External 
  IStoreProductQueryResult = interface(IInspectable)
  ['{D805E6C5-D456-4FF6-8049-9076D5165F73}']
    function get_Products: IMapView_2__HSTRING__IStoreProduct; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property Products: IMapView_2__HSTRING__IStoreProduct read get_Products;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.Store.IStoreProduct>
  IMapView_2__HSTRING__IStoreProduct_Base = interface(IInspectable)
  ['{DBAAC6E5-61A4-5C88-B5D8-3A3E161C3E4A}']
  end;
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Services.Store.IStoreProduct>
  // External 
  IMapView_2__HSTRING__IStoreProduct = interface(IMapView_2__HSTRING__IStoreProduct_Base)
  ['{7C28626B-F200-5355-8574-02005573BC63}']
    function Lookup(key: HSTRING): IStoreProduct; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IStoreProduct; out second: IMapView_2__HSTRING__IStoreProduct); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING_Base = interface(IInspectable)
  ['{E2FCC7C1-3BFC-5A0B-B2B0-72E769D1CB7E}']
  end;
  // Windows.Foundation.Collections.IIterable`1<String>
  // External 
  IIterable_1__HSTRING = interface(IIterable_1__HSTRING_Base)
  ['{E2FCC7C1-3BFC-5A0B-B2B0-72E769D1CB7E}']
    function First: IIterator_1__HSTRING; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING_Base = interface(IInspectable)
  ['{8C304EBB-6615-50A4-8829-879ECD443236}']
  end;
  // Windows.Foundation.Collections.IIterator`1<String>
  // External 
  IIterator_1__HSTRING = interface(IIterator_1__HSTRING_Base)
  ['{8C304EBB-6615-50A4-8829-879ECD443236}']
    function get_Current: HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHSTRING): Cardinal; safecall;
    property Current: HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductPagedQueryResult>
  IAsyncOperation_1__IStoreProductPagedQueryResult_Base = interface(IInspectable)
  ['{3079E7DB-1BA4-5B9E-856A-6576BF7F9C8A}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreProductPagedQueryResult>
  // External 
  IAsyncOperation_1__IStoreProductPagedQueryResult = interface(IAsyncOperation_1__IStoreProductPagedQueryResult_Base)
  ['{F878308C-4FDD-554E-AB2C-83466B5D778B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult; safecall;
    function GetResults: IStoreProductPagedQueryResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductPagedQueryResult>
  AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult_Delegate_Base = interface(IUnknown)
  ['{E786321F-B791-5E38-8BC4-98CB287D1085}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreProductPagedQueryResult>
  // External 
  AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult = interface(AsyncOperationCompletedHandler_1__IStoreProductPagedQueryResult_Delegate_Base)
  ['{10FB362F-7495-5DE3-BA40-0BD9550F744E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStoreProductPagedQueryResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStoreProductPagedQueryResult
  // External 
  IStoreProductPagedQueryResult = interface(IInspectable)
  ['{C92718C5-4DD5-4869-A462-ECC6872E43C5}']
    function get_Products: IMapView_2__HSTRING__IStoreProduct; safecall;
    function get_HasMoreResults: Boolean; safecall;
    function get_ExtendedError: HRESULT; safecall;
    function GetNextAsync: IAsyncOperation_1__IStoreProductPagedQueryResult; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property HasMoreResults: Boolean read get_HasMoreResults;
    property Products: IMapView_2__HSTRING__IStoreProduct read get_Products;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreConsumableResult>
  IAsyncOperation_1__IStoreConsumableResult_Base = interface(IInspectable)
  ['{873C497B-C3F7-5657-B921-3E58CE48EE50}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreConsumableResult>
  // External 
  IAsyncOperation_1__IStoreConsumableResult = interface(IAsyncOperation_1__IStoreConsumableResult_Base)
  ['{AD6D53A4-7EBC-5E8B-8B0A-0153E7E5695F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStoreConsumableResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStoreConsumableResult; safecall;
    function GetResults: IStoreConsumableResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStoreConsumableResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreConsumableResult>
  AsyncOperationCompletedHandler_1__IStoreConsumableResult_Delegate_Base = interface(IUnknown)
  ['{3F2BB178-3C4E-56ED-86A5-AD13797CFBFD}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreConsumableResult>
  // External 
  AsyncOperationCompletedHandler_1__IStoreConsumableResult = interface(AsyncOperationCompletedHandler_1__IStoreConsumableResult_Delegate_Base)
  ['{A0822E34-F573-574A-A5F8-38618D5411EC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStoreConsumableResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStoreConsumableResult
  // External 
  IStoreConsumableResult = interface(IInspectable)
  ['{EA5DAB72-6A00-4052-BE5B-BFDAB4433352}']
    function get_Status: StoreConsumableStatus; safecall;
    function get_TrackingId: TGuid; safecall;
    function get_BalanceRemaining: Cardinal; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property BalanceRemaining: Cardinal read get_BalanceRemaining;
    property ExtendedError: HRESULT read get_ExtendedError;
    property Status: StoreConsumableStatus read get_Status;
    property TrackingId: TGuid read get_TrackingId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreAcquireLicenseResult>
  IAsyncOperation_1__IStoreAcquireLicenseResult_Base = interface(IInspectable)
  ['{DD6C4705-A76C-528E-99A5-CDD13197D4CF}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Services.Store.IStoreAcquireLicenseResult>
  // External 
  IAsyncOperation_1__IStoreAcquireLicenseResult = interface(IAsyncOperation_1__IStoreAcquireLicenseResult_Base)
  ['{952A4A93-DB35-518D-82AD-F8FB6D84AE29}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult; safecall;
    function GetResults: IStoreAcquireLicenseResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreAcquireLicenseResult>
  AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult_Delegate_Base = interface(IUnknown)
  ['{6987C97C-2C19-5F44-B5AC-37393F3C1A4A}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Services.Store.IStoreAcquireLicenseResult>
  // External 
  AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult = interface(AsyncOperationCompletedHandler_1__IStoreAcquireLicenseResult_Delegate_Base)
  ['{9DD2E89D-B648-5F66-BD9A-E5FBBA66B2FE}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IStoreAcquireLicenseResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStoreAcquireLicenseResult
  // External 
  IStoreAcquireLicenseResult = interface(IInspectable)
  ['{FBD7946D-F040-4CB3-9A39-29BCECDBE22D}']
    function get_StorePackageLicense: IStorePackageLicense; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property StorePackageLicense: IStorePackageLicense read get_StorePackageLicense;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>>
  IAsyncOperation_1__IVectorView_1__IStorePackageUpdate_Base = interface(IInspectable)
  ['{0AC66C33-45B8-546B-AAAF-D58D62A4C5C5}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>>
  // External 
  IAsyncOperation_1__IVectorView_1__IStorePackageUpdate = interface(IAsyncOperation_1__IVectorView_1__IStorePackageUpdate_Base)
  ['{603DCCA3-2B6D-50E7-AAAA-7DDFCEAF169E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate; safecall;
    function GetResults: IVectorView_1__IStorePackageUpdate; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate_Delegate_Base = interface(IUnknown)
  ['{F8491BCD-2DB5-58E0-8C47-44E6EB10C12D}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>>
  // External 
  AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IStorePackageUpdate_Delegate_Base)
  ['{EC684BE8-7BAA-5335-934F-E647E407C1A6}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IStorePackageUpdate; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.IStorePackageUpdate>
  // External 
  IVectorView_1__IStorePackageUpdate = interface(IInspectable)
  ['{8E067DA9-4FAA-560F-BCE3-D974664BC4AC}']
    function GetAt(index: Cardinal): IStorePackageUpdate; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IStorePackageUpdate; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorePackageUpdate): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Services.Store.IStorePackageUpdate
  // External 
  IStorePackageUpdate = interface(IInspectable)
  ['{140FA150-3CBF-4A35-B91F-48271C31B072}']
    function get_Package: IPackage; safecall;
    function get_Mandatory: Boolean; safecall;
    property Mandatory: Boolean read get_Mandatory;
    property Package: IPackage read get_Package;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus_Base = interface(IInspectable)
  ['{42C436CA-51F7-50B2-8FE4-7B754062E6EB}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  // External 
  IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus = interface(IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus_Base)
  ['{7B9F1EF8-E09D-55D9-BA11-6C868BDA3430}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus; safecall;
    function GetResults: IStorePackageUpdateResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus_Delegate_Base = interface(IUnknown)
  ['{961260F1-7352-5EDF-9666-1F9A0A8EE477}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  // External 
  AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus = interface(AsyncOperationProgressHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus_Delegate_Base)
  ['{F9DD63B7-E13B-51CF-B017-963980CE0191}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus; progressInfo: StorePackageUpdateStatus); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus_Delegate_Base = interface(IUnknown)
  ['{B3BE0C8B-EF1D-56DC-8547-4DA06EA563DF}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Services.Store.IStorePackageUpdateResult,Windows.Services.Store.StorePackageUpdateStatus>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus = interface(AsyncOperationWithProgressCompletedHandler_2__IStorePackageUpdateResult__StorePackageUpdateStatus_Delegate_Base)
  ['{4FF3F43E-8B85-58FF-8DCC-5A8BC6EC699B}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IStorePackageUpdateResult__StorePackageUpdateStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Services.Store.IStorePackageUpdateResult
  // External 
  IStorePackageUpdateResult = interface(IInspectable)
  ['{E79142ED-61F9-4893-B4FE-CF191603AF7B}']
    function get_OverallState: StorePackageUpdateState; safecall;
    function get_StorePackageUpdateStatuses: IVectorView_1__StorePackageUpdateStatus; safecall;
    property OverallState: StorePackageUpdateState read get_OverallState;
    property StorePackageUpdateStatuses: IVectorView_1__StorePackageUpdateStatus read get_StorePackageUpdateStatuses;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Services.Store.StorePackageUpdateStatus>
  // External 
  IVectorView_1__StorePackageUpdateStatus = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): StorePackageUpdateStatus; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: StorePackageUpdateStatus; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PStorePackageUpdateStatus): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStorePackageUpdate>
  IIterable_1__IStorePackageUpdate_Base = interface(IInspectable)
  ['{6B076C51-849E-5EC5-AED5-9B0585591902}']
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Services.Store.IStorePackageUpdate>
  // External 
  IIterable_1__IStorePackageUpdate = interface(IIterable_1__IStorePackageUpdate_Base)
  ['{E7B20971-0E80-5A2D-8C77-A71A68EEE18B}']
    function First: IIterator_1__IStorePackageUpdate; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStorePackageUpdate>
  IIterator_1__IStorePackageUpdate_Base = interface(IInspectable)
  ['{B75DD77B-87CA-5956-8902-84E9FFC97D83}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Services.Store.IStorePackageUpdate>
  // External 
  IIterator_1__IStorePackageUpdate = interface(IIterator_1__IStorePackageUpdate_Base)
  ['{C2BCB285-D3C8-5F2A-8215-EE0C81093298}']
    function get_Current: IStorePackageUpdate; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStorePackageUpdate): Cardinal; safecall;
    property Current: IStorePackageUpdate read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.Collections.IVector`1<String>
  // External 
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

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal_Base = interface(IInspectable)
  ['{EF60385F-BE78-584B-AAEF-7829ADA2B0DE}']
  end;
  // Windows.Foundation.IAsyncOperation`1<UInt32>
  // External 
  IAsyncOperation_1__Cardinal = interface(IAsyncOperation_1__Cardinal_Base)
  ['{EF60385F-BE78-584B-AAEF-7829ADA2B0DE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Cardinal); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Cardinal read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal_Delegate_Base = interface(IUnknown)
  ['{9343B6E7-E3D2-5E4A-AB2D-2BCE4919A6A4}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  // External 
  AsyncOperationCompletedHandler_1__Cardinal = interface(AsyncOperationCompletedHandler_1__Cardinal_Delegate_Base)
  ['{9343B6E7-E3D2-5E4A-AB2D-2BCE4919A6A4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable_Delegate_Base = interface(IUnknown)
  ['{4BA22861-00C4-597F-B6BF-3AF516F3B870}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  // External 
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface(TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable_Delegate_Base)
  ['{4BA22861-00C4-597F-B6BF-3AF516F3B870}']
    procedure Invoke(sender: Search_IStorageQueryResultBase; args: IInspectable); safecall;
  end;

  // Windows.Storage.Search.IStorageQueryResultBase
  // External 
  Search_IStorageQueryResultBase = interface(IInspectable)
  ['{C297D70D-7353-47AB-BA58-8C61425DC54B}']
    function GetItemCountAsync: IAsyncOperation_1__Cardinal; safecall;
    function get_Folder: IStorageFolder; safecall;
    function add_ContentsChanged(handler: TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ContentsChanged(eventCookie: EventRegistrationToken); safecall;
    function add_OptionsChanged(changedHandler: TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable): EventRegistrationToken; safecall;
    procedure remove_OptionsChanged(eventCookie: EventRegistrationToken); safecall;
    function FindStartIndexAsync(value: IInspectable): IAsyncOperation_1__Cardinal; safecall;
    function GetCurrentQueryOptions: Search_IQueryOptions; safecall;
    procedure ApplyNewQueryOptions(newQueryOptions: Search_IQueryOptions); safecall;
    property Folder: IStorageFolder read get_Folder;
  end;

  // Windows.Storage.Search.IQueryOptions
  // External 
  Search_IQueryOptions = interface(IInspectable)
  ['{1E5E46EE-0F45-4838-A8E9-D0479D446C30}']
    function get_FileTypeFilter: IVector_1__HSTRING; safecall;
    function get_FolderDepth: Search_FolderDepth; safecall;
    procedure put_FolderDepth(value: Search_FolderDepth); safecall;
    function get_ApplicationSearchFilter: HSTRING; safecall;
    procedure put_ApplicationSearchFilter(value: HSTRING); safecall;
    function get_UserSearchFilter: HSTRING; safecall;
    procedure put_UserSearchFilter(value: HSTRING); safecall;
    function get_Language: HSTRING; safecall;
    procedure put_Language(value: HSTRING); safecall;
    function get_IndexerOption: Search_IndexerOption; safecall;
    procedure put_IndexerOption(value: Search_IndexerOption); safecall;
    function get_SortOrder: IVector_1__Search_SortEntry; safecall;
    function get_GroupPropertyName: HSTRING; safecall;
    function get_DateStackOption: Search_DateStackOption; safecall;
    function SaveToString: HSTRING; safecall;
    procedure LoadFromString(value: HSTRING); safecall;
    procedure SetThumbnailPrefetch(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal; options: FileProperties_ThumbnailOptions); safecall;
    procedure SetPropertyPrefetch(options: FileProperties_PropertyPrefetchOptions; propertiesToRetrieve: IIterable_1__HSTRING); safecall;
    property ApplicationSearchFilter: HSTRING read get_ApplicationSearchFilter write put_ApplicationSearchFilter;
    property DateStackOption: Search_DateStackOption read get_DateStackOption;
    property FileTypeFilter: IVector_1__HSTRING read get_FileTypeFilter;
    property FolderDepth: Search_FolderDepth read get_FolderDepth write put_FolderDepth;
    property GroupPropertyName: HSTRING read get_GroupPropertyName;
    property IndexerOption: Search_IndexerOption read get_IndexerOption write put_IndexerOption;
    property Language: HSTRING read get_Language write put_Language;
    property SortOrder: IVector_1__Search_SortEntry read get_SortOrder;
    property UserSearchFilter: HSTRING read get_UserSearchFilter write put_UserSearchFilter;
  end;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.Search.SortEntry>
  // External 
  IVector_1__Search_SortEntry = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): Search_SortEntry; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Search_SortEntry; safecall;
    function IndexOf(value: Search_SortEntry; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Search_SortEntry); safecall;
    procedure InsertAt(index: Cardinal; value: Search_SortEntry); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Search_SortEntry); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSearch_SortEntry): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PSearch_SortEntry); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Search.SortEntry>
  // External 
  IVectorView_1__Search_SortEntry = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Search_SortEntry; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Search_SortEntry; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSearch_SortEntry): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.IReference`1<Double>
  // External 
  IReference_1__Double = interface(IInspectable)
  ['{2F2D6C29-5473-5F3E-92E7-96572BB990E2}']
    function get_Value: Double; safecall;
    property Value: Double read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64_Base = interface(IInspectable)
  ['{8F1DB6E3-6556-5516-825C-1021EE27CD0C}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // External 
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface(IAsyncOperationWithProgress_2__UInt64__UInt64_Base)
  ['{8F1DB6E3-6556-5516-825C-1021EE27CD0C}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__UInt64__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__UInt64__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64; safecall;
    function GetResults: UInt64; safecall;
    property Progress: AsyncOperationProgressHandler_2__UInt64__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64_Delegate_Base = interface(IUnknown)
  ['{FFB2B65D-4120-5D13-826D-107851E6BB1C}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  // External 
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface(AsyncOperationProgressHandler_2__UInt64__UInt64_Delegate_Base)
  ['{FFB2B65D-4120-5D13-826D-107851E6BB1C}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; progressInfo: UInt64); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64_Delegate_Base = interface(IUnknown)
  ['{D2024E41-5500-5B5A-BA46-CB7009596A2F}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface(AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64_Delegate_Base)
  ['{D2024E41-5500-5B5A-BA46-CB7009596A2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
  // External 
  RemoteSystems_IRemoteSystemConnectionRequest = interface(IInspectable)
  ['{84ED4104-8D5E-4D72-8238-7621576C7A67}']
    function get_RemoteSystem: RemoteSystems_IRemoteSystem; safecall;
    property RemoteSystem: RemoteSystems_IRemoteSystem read get_RemoteSystem;
  end;

  // Windows.System.RemoteSystems.IRemoteSystem
  // External 
  RemoteSystems_IRemoteSystem = interface(IInspectable)
  ['{ED5838CD-1E10-4A8C-B4A6-4E5FD6F97721}']
    function get_DisplayName: HSTRING; safecall;
    function get_Id: HSTRING; safecall;
    function get_Kind: HSTRING; safecall;
    function get_Status: RemoteSystems_RemoteSystemStatus; safecall;
    function get_IsAvailableByProximity: Boolean; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property IsAvailableByProximity: Boolean read get_IsAvailableByProximity;
    property Kind: HSTRING read get_Kind;
    property Status: RemoteSystems_RemoteSystemStatus read get_Status;
  end;

  // DualAPI Interface
  // Windows.System.IDispatcherQueueTimer
  // External 
  IDispatcherQueueTimer = interface(IInspectable)
  ['{5FEABB1D-A31C-4727-B1AC-37454649D56A}']
    function get_Interval: TimeSpan; safecall;
    procedure put_Interval(value: TimeSpan); safecall;
    function get_IsRunning: Boolean; safecall;
    function get_IsRepeating: Boolean; safecall;
    procedure put_IsRepeating(value: Boolean); safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    function add_Tick(handler: TypedEventHandler_2__IDispatcherQueueTimer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Tick(token: EventRegistrationToken); safecall;
    property Interval: TimeSpan read get_Interval write put_Interval;
    property IsRepeating: Boolean read get_IsRepeating write put_IsRepeating;
    property IsRunning: Boolean read get_IsRunning;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base = interface(IUnknown)
  ['{8B5644C8-8B57-50CE-8933-7AB2CC5A14EF}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  // External 
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface(TypedEventHandler_2__IDispatcherQueueTimer__IInspectable_Delegate_Base)
  ['{8A13AE56-7643-5F25-A347-5C9F548273DC}']
    procedure Invoke(sender: IDispatcherQueueTimer; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.System.IDispatcherQueue
  // External 
  IDispatcherQueue = interface(IInspectable)
  ['{603E88E4-A338-4FFE-A457-A5CFB9CEB899}']
    function CreateTimer: IDispatcherQueueTimer; safecall;
    function TryEnqueue(callback: DispatcherQueueHandler): Boolean; overload; safecall;
    function TryEnqueue(priority: DispatcherQueuePriority; callback: DispatcherQueueHandler): Boolean; overload; safecall;
    function add_ShutdownStarting(handler: TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_ShutdownStarting(token: EventRegistrationToken); safecall;
    function add_ShutdownCompleted(handler: TypedEventHandler_2__IDispatcherQueue__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ShutdownCompleted(token: EventRegistrationToken); safecall;
  end;

  // Windows.System.DispatcherQueueHandler
  // External 
  DispatcherQueueHandler = interface(IUnknown)
  ['{DFA2DC9C-1A2D-4917-98F2-939AF1D6E0C8}']
    procedure Invoke; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Windows.System.IDispatcherQueueShutdownStartingEventArgs>
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{B58B5E24-E1C6-528E-9D99-07EC8829DEA5}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Windows.System.IDispatcherQueueShutdownStartingEventArgs>
  // External 
  TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs = interface(TypedEventHandler_2__IDispatcherQueue__IDispatcherQueueShutdownStartingEventArgs_Delegate_Base)
  ['{88AA433B-5865-5CFC-B469-07EEC9762F68}']
    procedure Invoke(sender: IDispatcherQueue; args: IDispatcherQueueShutdownStartingEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.System.IDispatcherQueueShutdownStartingEventArgs
  // External 
  IDispatcherQueueShutdownStartingEventArgs = interface(IInspectable)
  ['{C4724C4C-FF97-40C0-A226-CC0AAA545E89}']
    function GetDeferral: IDeferral; safecall;
  end;

  // DualAPI Interface
  // Windows.Foundation.IDeferral
  // External 
  IDeferral = interface(IInspectable)
  ['{D6269732-3B7F-46A7-B40B-4FDCA2A2C693}']
    procedure Complete; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base = interface(IUnknown)
  ['{FE79F855-2F40-5B88-A0C3-4C042A05DD05}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  // External 
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface(TypedEventHandler_2__IDispatcherQueue__IInspectable_Delegate_Base)
  ['{1ECC7D76-D5F1-5514-8DA3-343E7A82F842}']
    procedure Invoke(sender: IDispatcherQueue; args: IInspectable); safecall;
  end;

  // Windows.Foundation.IReference`1<UInt32>
  // External 
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  // External 
  IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{60310303-49C5-52E6-ABC6-A9B36ECCC716}']
    function get_Key: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: HSTRING read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING_Base = interface(IInspectable)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  // External 
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IIterator_1__IKeyValuePair_2__HSTRING__HSTRING_Base)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
    function get_Current: IKeyValuePair_2__HSTRING__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING_Base = interface(IInspectable)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
  end;
  // Windows.Foundation.Collections.IMapView`2<String,String>
  // External 
  IMapView_2__HSTRING__HSTRING = interface(IMapView_2__HSTRING__HSTRING_Base)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__HSTRING; out second: IMapView_2__HSTRING__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Guid>
  IIterator_1__TGuid_Base = interface(IInspectable)
  ['{D3D64048-82B3-53C7-9285-B0BE18368482}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Guid>
  // External 
  IIterator_1__TGuid = interface(IIterator_1__TGuid_Base)
  ['{D3D64048-82B3-53C7-9285-B0BE18368482}']
    function get_Current: TGuid; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGuid): Cardinal; safecall;
    property Current: TGuid read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Guid>
  // External 
  IVectorView_1__TGuid = interface(IInspectable)
  ['{9520E64B-15B2-52A6-98ED-3191FA6CF68A}']
    function GetAt(index: Cardinal): TGuid; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TGuid; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGuid): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.IAppDisplayInfo
  // External 
  IAppDisplayInfo = interface(IInspectable)
  ['{1AEB1103-E4D4-41AA-A4F6-C4A276E79EAC}']
    function get_DisplayName: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function GetLogo(size: TSizeF): IRandomAccessStreamReference; safecall;
    property Description: HSTRING read get_Description;
    property DisplayName: HSTRING read get_DisplayName;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Core.ICoreApplicationView,Windows.ApplicationModel.Activation.IActivatedEventArgs>
  TypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{CF193A96-EB13-5E3B-8BDF-87B6EFAE8339}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Core.ICoreApplicationView,Windows.ApplicationModel.Activation.IActivatedEventArgs>
  // External 
  TypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs = interface(TypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs_Delegate_Base)
  ['{11DE1090-7AC7-59D2-AE00-981268883D85}']
    procedure Invoke(sender: ICoreApplicationView; args: Activation_IActivatedEventArgs); safecall;
  end;

  // Windows.ApplicationModel.Core.ICoreApplicationView
  // External 
  ICoreApplicationView = interface(IInspectable)
  ['{638BB2DB-451D-4661-B099-414F34FFB9F1}']
    function get_CoreWindow: ICoreWindow; safecall;
    function add_Activated(handler: TypedEventHandler_2__ICoreApplicationView__Activation_IActivatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Activated(token: EventRegistrationToken); safecall;
    function get_IsMain: Boolean; safecall;
    function get_IsHosted: Boolean; safecall;
    property CoreWindow: ICoreWindow read get_CoreWindow;
    property IsHosted: Boolean read get_IsHosted;
    property IsMain: Boolean read get_IsMain;
  end;

  // Windows.UI.Core.ICoreWindow
  // External 
  ICoreWindow = interface(IInspectable)
  ['{79B9D5F2-879E-4B89-B798-79E47598030C}']
    function get_AutomationHostProvider: IInspectable; safecall;
    function get_Bounds: TRectF; safecall;
    function get_CustomProperties: IPropertySet; safecall;
    function get_Dispatcher: ICoreDispatcher; safecall;
    function get_FlowDirection: CoreWindowFlowDirection; safecall;
    procedure put_FlowDirection(value: CoreWindowFlowDirection); safecall;
    function get_IsInputEnabled: Boolean; safecall;
    procedure put_IsInputEnabled(value: Boolean); safecall;
    function get_PointerCursor: ICoreCursor; safecall;
    procedure put_PointerCursor(value: ICoreCursor); safecall;
    function get_PointerPosition: TPointF; safecall;
    function get_Visible: Boolean; safecall;
    procedure Activate; safecall;
    procedure Close; safecall;
    function GetAsyncKeyState(virtualKey: VirtualKey): CoreVirtualKeyStates; safecall;
    function GetKeyState(virtualKey: VirtualKey): CoreVirtualKeyStates; safecall;
    procedure ReleasePointerCapture; safecall;
    procedure SetPointerCapture; safecall;
    function add_Activated(handler: TypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Activated(cookie: EventRegistrationToken); safecall;
    function add_AutomationProviderRequested(handler: TypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AutomationProviderRequested(cookie: EventRegistrationToken); safecall;
    function add_CharacterReceived(handler: TypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CharacterReceived(cookie: EventRegistrationToken); safecall;
    function add_Closed(handler: TypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closed(cookie: EventRegistrationToken); safecall;
    function add_InputEnabled(handler: TypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs): EventRegistrationToken; safecall;
    procedure remove_InputEnabled(cookie: EventRegistrationToken); safecall;
    function add_KeyDown(handler: TypedEventHandler_2__ICoreWindow__IKeyEventArgs): EventRegistrationToken; safecall;
    procedure remove_KeyDown(cookie: EventRegistrationToken); safecall;
    function add_KeyUp(handler: TypedEventHandler_2__ICoreWindow__IKeyEventArgs): EventRegistrationToken; safecall;
    procedure remove_KeyUp(cookie: EventRegistrationToken); safecall;
    function add_PointerCaptureLost(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerCaptureLost(cookie: EventRegistrationToken); safecall;
    function add_PointerEntered(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerEntered(cookie: EventRegistrationToken); safecall;
    function add_PointerExited(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerExited(cookie: EventRegistrationToken); safecall;
    function add_PointerMoved(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerMoved(cookie: EventRegistrationToken); safecall;
    function add_PointerPressed(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerPressed(cookie: EventRegistrationToken); safecall;
    function add_PointerReleased(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerReleased(cookie: EventRegistrationToken); safecall;
    function add_TouchHitTesting(handler: TypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs): EventRegistrationToken; safecall;
    procedure remove_TouchHitTesting(cookie: EventRegistrationToken); safecall;
    function add_PointerWheelChanged(handler: TypedEventHandler_2__ICoreWindow__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerWheelChanged(cookie: EventRegistrationToken); safecall;
    function add_SizeChanged(handler: TypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SizeChanged(cookie: EventRegistrationToken); safecall;
    function add_VisibilityChanged(handler: TypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_VisibilityChanged(cookie: EventRegistrationToken); safecall;
    property AutomationHostProvider: IInspectable read get_AutomationHostProvider;
    property Bounds: TRectF read get_Bounds;
    property CustomProperties: IPropertySet read get_CustomProperties;
    property Dispatcher: ICoreDispatcher read get_Dispatcher;
    property FlowDirection: CoreWindowFlowDirection read get_FlowDirection write put_FlowDirection;
    property IsInputEnabled: Boolean read get_IsInputEnabled write put_IsInputEnabled;
    property PointerCursor: ICoreCursor read get_PointerCursor write put_PointerCursor;
    property PointerPosition: TPointF read get_PointerPosition;
    property Visible: Boolean read get_Visible;
  end;

  // Windows.UI.Core.ICoreDispatcher
  // External 
  ICoreDispatcher = interface(IInspectable)
  ['{60DB2FA8-B705-4FDE-A7D6-EBBB1891D39E}']
    function get_HasThreadAccess: Boolean; safecall;
    procedure ProcessEvents(options: CoreProcessEventsOption); safecall;
    function RunAsync(priority: CoreDispatcherPriority; agileCallback: DispatchedHandler): IAsyncAction; safecall;
    function RunIdleAsync(agileCallback: IdleDispatchedHandler): IAsyncAction; safecall;
    property HasThreadAccess: Boolean read get_HasThreadAccess;
  end;

  // Windows.UI.Core.DispatchedHandler
  // External 
  DispatchedHandler = interface(IUnknown)
  ['{D1F276C4-98D8-4636-BF49-EB79507548E9}']
    procedure Invoke; safecall;
  end;

  // Windows.UI.Core.IdleDispatchedHandler
  // External 
  IdleDispatchedHandler = interface(IUnknown)
  ['{A42B0C24-7F21-4ABC-99C1-8F01007F0880}']
    procedure Invoke(e: IIdleDispatchedHandlerArgs); safecall;
  end;

  // Windows.UI.Core.IIdleDispatchedHandlerArgs
  // External 
  IIdleDispatchedHandlerArgs = interface(IInspectable)
  ['{98BB6A24-DC1C-43CB-B4ED-D1C0EB2391F3}']
    function get_IsDispatcherIdle: Boolean; safecall;
    property IsDispatcherIdle: Boolean read get_IsDispatcherIdle;
  end;

  // Windows.UI.Core.ICoreCursor
  // External 
  ICoreCursor = interface(IInspectable)
  ['{96893ACF-111D-442C-8A77-B87992F8E2D6}']
    function get_Id: Cardinal; safecall;
    function get_Type: CoreCursorType; safecall;
    property Id: Cardinal read get_Id;
    property &Type: CoreCursorType read get_Type;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IWindowActivatedEventArgs>
  TypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{26A73B35-A7F9-52DB-88D6-15726DEB2523}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IWindowActivatedEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs = interface(TypedEventHandler_2__ICoreWindow__IWindowActivatedEventArgs_Delegate_Base)
  ['{DEBE997D-E6F5-55A7-B1ED-DE68DBBF7499}']
    procedure Invoke(sender: ICoreWindow; args: IWindowActivatedEventArgs); safecall;
  end;

  // Windows.UI.Core.IWindowActivatedEventArgs
  // External 
  IWindowActivatedEventArgs = interface(IInspectable)
  ['{179D65E7-4658-4CB6-AA13-41D094EA255E}']
    function get_WindowActivationState: CoreWindowActivationState; safecall;
    property WindowActivationState: CoreWindowActivationState read get_WindowActivationState;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IAutomationProviderRequestedEventArgs>
  TypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{54DB5C04-81F7-5F46-9FB8-E49BEEC70A24}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IAutomationProviderRequestedEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs = interface(TypedEventHandler_2__ICoreWindow__IAutomationProviderRequestedEventArgs_Delegate_Base)
  ['{4C101D07-8BE3-599C-962E-E0E5172AEB71}']
    procedure Invoke(sender: ICoreWindow; args: IAutomationProviderRequestedEventArgs); safecall;
  end;

  // Windows.UI.Core.IAutomationProviderRequestedEventArgs
  // External 
  IAutomationProviderRequestedEventArgs = interface(IInspectable)
  ['{961FF258-21BF-4B42-A298-FA479D4C52E2}']
    function get_AutomationProvider: IInspectable; safecall;
    procedure put_AutomationProvider(value: IInspectable); safecall;
    property AutomationProvider: IInspectable read get_AutomationProvider write put_AutomationProvider;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ICharacterReceivedEventArgs>
  TypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{73F846A8-0AF6-5872-8FB8-AE2F56D8553E}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ICharacterReceivedEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs = interface(TypedEventHandler_2__ICoreWindow__ICharacterReceivedEventArgs_Delegate_Base)
  ['{BCCC3656-64A2-59C5-BBD6-30222BBA45E2}']
    procedure Invoke(sender: ICoreWindow; args: ICharacterReceivedEventArgs); safecall;
  end;

  // Windows.UI.Core.ICharacterReceivedEventArgs
  // External 
  ICharacterReceivedEventArgs = interface(IInspectable)
  ['{C584659F-99B2-4BCC-BD33-04E63F42902E}']
    function get_KeyCode: Cardinal; safecall;
    function get_KeyStatus: CorePhysicalKeyStatus; safecall;
    property KeyCode: Cardinal read get_KeyCode;
    property KeyStatus: CorePhysicalKeyStatus read get_KeyStatus;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ICoreWindowEventArgs>
  TypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs_Delegate_Base = interface(IUnknown)
  ['{D08E4F66-3457-57F2-BA0C-CB347133BD15}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ICoreWindowEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs = interface(TypedEventHandler_2__ICoreWindow__ICoreWindowEventArgs_Delegate_Base)
  ['{8313079D-940D-5497-B414-EAEFB4BFB117}']
    procedure Invoke(sender: ICoreWindow; args: ICoreWindowEventArgs); safecall;
  end;

  // Windows.UI.Core.ICoreWindowEventArgs
  // External 
  ICoreWindowEventArgs = interface(IInspectable)
  ['{272B1EF3-C633-4DA5-A26C-C6D0F56B29DA}']
    function get_Handled: Boolean; safecall;
    procedure put_Handled(value: Boolean); safecall;
    property Handled: Boolean read get_Handled write put_Handled;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IInputEnabledEventArgs>
  TypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs_Delegate_Base = interface(IUnknown)
  ['{E230A64A-506A-59C3-BB61-5559FF995663}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IInputEnabledEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs = interface(TypedEventHandler_2__ICoreWindow__IInputEnabledEventArgs_Delegate_Base)
  ['{612B1DC7-D539-508E-BA99-EA96D28C773C}']
    procedure Invoke(sender: ICoreWindow; args: IInputEnabledEventArgs); safecall;
  end;

  // Windows.UI.Core.IInputEnabledEventArgs
  // External 
  IInputEnabledEventArgs = interface(IInspectable)
  ['{80371D4F-2FD8-4C24-AA86-3163A87B4E5A}']
    function get_InputEnabled: Boolean; safecall;
    property InputEnabled: Boolean read get_InputEnabled;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IKeyEventArgs>
  TypedEventHandler_2__ICoreWindow__IKeyEventArgs_Delegate_Base = interface(IUnknown)
  ['{A3EC0774-55AC-5D61-8232-B35C5D35C93C}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IKeyEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IKeyEventArgs = interface(TypedEventHandler_2__ICoreWindow__IKeyEventArgs_Delegate_Base)
  ['{6F418E8D-1111-5A06-B7E2-357E0F99D693}']
    procedure Invoke(sender: ICoreWindow; args: IKeyEventArgs); safecall;
  end;

  // Windows.UI.Core.IKeyEventArgs
  // External 
  IKeyEventArgs = interface(IInspectable)
  ['{5FF5E930-2544-4A17-BD78-1F2FDEBB106B}']
    function get_VirtualKey: VirtualKey; safecall;
    function get_KeyStatus: CorePhysicalKeyStatus; safecall;
    property KeyStatus: CorePhysicalKeyStatus read get_KeyStatus;
    [HPPGEN('//TODO: C++ Property')]
    property VirtualKey: VirtualKey read get_VirtualKey;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__ICoreWindow__IPointerEventArgs_Delegate_Base = interface(IUnknown)
  ['{420E1BB6-E99D-5E64-8E25-07467E3CAE9E}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IPointerEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IPointerEventArgs = interface(TypedEventHandler_2__ICoreWindow__IPointerEventArgs_Delegate_Base)
  ['{CA41B9D7-6784-528C-B771-3BD8AEBA67DB}']
    procedure Invoke(sender: ICoreWindow; args: IPointerEventArgs); safecall;
  end;

  // Windows.UI.Core.IPointerEventArgs
  // External 
  IPointerEventArgs = interface(IInspectable)
  ['{920D9CB1-A5FC-4A21-8C09-49DFE6FFE25F}']
    function get_CurrentPoint: IPointerPoint; safecall;
    function get_KeyModifiers: VirtualKeyModifiers; safecall;
    function GetIntermediatePoints: IVector_1__IPointerPoint; safecall;
    property CurrentPoint: IPointerPoint read get_CurrentPoint;
    property KeyModifiers: VirtualKeyModifiers read get_KeyModifiers;
  end;

  // Windows.UI.Input.IPointerPoint
  // External 
  IPointerPoint = interface(IInspectable)
  ['{E995317D-7296-42D9-8233-C5BE73B74A4A}']
    function get_PointerDevice: Input_IPointerDevice; safecall;
    function get_Position: TPointF; safecall;
    function get_RawPosition: TPointF; safecall;
    function get_PointerId: Cardinal; safecall;
    function get_FrameId: Cardinal; safecall;
    function get_Timestamp: UInt64; safecall;
    function get_IsInContact: Boolean; safecall;
    function get_Properties: IPointerPointProperties; safecall;
    property FrameId: Cardinal read get_FrameId;
    property IsInContact: Boolean read get_IsInContact;
    property PointerDevice: Input_IPointerDevice read get_PointerDevice;
    property PointerId: Cardinal read get_PointerId;
    property Position: TPointF read get_Position;
    property Properties: IPointerPointProperties read get_Properties;
    property RawPosition: TPointF read get_RawPosition;
    property Timestamp: UInt64 read get_Timestamp;
  end;

  // Windows.Devices.Input.IPointerDevice
  // External 
  Input_IPointerDevice = interface(IInspectable)
  ['{93C9BAFC-EBCB-467E-82C6-276FEAE36B5A}']
    function get_PointerDeviceType: Input_PointerDeviceType; safecall;
    function get_IsIntegrated: Boolean; safecall;
    function get_MaxContacts: Cardinal; safecall;
    function get_PhysicalDeviceRect: TRectF; safecall;
    function get_ScreenRect: TRectF; safecall;
    function get_SupportedUsages: IVectorView_1__Input_PointerDeviceUsage; safecall;
    property IsIntegrated: Boolean read get_IsIntegrated;
    property MaxContacts: Cardinal read get_MaxContacts;
    property PhysicalDeviceRect: TRectF read get_PhysicalDeviceRect;
    property PointerDeviceType: Input_PointerDeviceType read get_PointerDeviceType;
    property ScreenRect: TRectF read get_ScreenRect;
    property SupportedUsages: IVectorView_1__Input_PointerDeviceUsage read get_SupportedUsages;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Input.PointerDeviceUsage>
  // External 
  IVectorView_1__Input_PointerDeviceUsage = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Input_PointerDeviceUsage; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Input_PointerDeviceUsage; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_PointerDeviceUsage): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.UI.Input.IPointerPointProperties
  // External 
  IPointerPointProperties = interface(IInspectable)
  ['{C79D8A4B-C163-4EE7-803F-67CE79F9972D}']
    function get_Pressure: Single; safecall;
    function get_IsInverted: Boolean; safecall;
    function get_IsEraser: Boolean; safecall;
    function get_Orientation: Single; safecall;
    function get_XTilt: Single; safecall;
    function get_YTilt: Single; safecall;
    function get_Twist: Single; safecall;
    function get_ContactRect: TRectF; safecall;
    function get_ContactRectRaw: TRectF; safecall;
    function get_TouchConfidence: Boolean; safecall;
    function get_IsLeftButtonPressed: Boolean; safecall;
    function get_IsRightButtonPressed: Boolean; safecall;
    function get_IsMiddleButtonPressed: Boolean; safecall;
    function get_MouseWheelDelta: Integer; safecall;
    function get_IsHorizontalMouseWheel: Boolean; safecall;
    function get_IsPrimary: Boolean; safecall;
    function get_IsInRange: Boolean; safecall;
    function get_IsCanceled: Boolean; safecall;
    function get_IsBarrelButtonPressed: Boolean; safecall;
    function get_IsXButton1Pressed: Boolean; safecall;
    function get_IsXButton2Pressed: Boolean; safecall;
    function get_PointerUpdateKind: PointerUpdateKind; safecall;
    function HasUsage(usagePage: Cardinal; usageId: Cardinal): Boolean; safecall;
    function GetUsageValue(usagePage: Cardinal; usageId: Cardinal): Integer; safecall;
    property ContactRect: TRectF read get_ContactRect;
    property ContactRectRaw: TRectF read get_ContactRectRaw;
    property IsBarrelButtonPressed: Boolean read get_IsBarrelButtonPressed;
    property IsCanceled: Boolean read get_IsCanceled;
    property IsEraser: Boolean read get_IsEraser;
    property IsHorizontalMouseWheel: Boolean read get_IsHorizontalMouseWheel;
    property IsInRange: Boolean read get_IsInRange;
    property IsInverted: Boolean read get_IsInverted;
    property IsLeftButtonPressed: Boolean read get_IsLeftButtonPressed;
    property IsMiddleButtonPressed: Boolean read get_IsMiddleButtonPressed;
    property IsPrimary: Boolean read get_IsPrimary;
    property IsRightButtonPressed: Boolean read get_IsRightButtonPressed;
    property IsXButton1Pressed: Boolean read get_IsXButton1Pressed;
    property IsXButton2Pressed: Boolean read get_IsXButton2Pressed;
    property MouseWheelDelta: Integer read get_MouseWheelDelta;
    property Orientation: Single read get_Orientation;
    [HPPGEN('//TODO: C++ Property')]
    property PointerUpdateKind: PointerUpdateKind read get_PointerUpdateKind;
    property Pressure: Single read get_Pressure;
    property TouchConfidence: Boolean read get_TouchConfidence;
    property Twist: Single read get_Twist;
    property XTilt: Single read get_XTilt;
    property YTilt: Single read get_YTilt;
  end;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.Input.IPointerPoint>
  // External 
  IVector_1__IPointerPoint = interface(IInspectable)
  ['{73154191-695C-5F04-9D43-911CB8336411}']
    function GetAt(index: Cardinal): IPointerPoint; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IPointerPoint; safecall;
    function IndexOf(value: IPointerPoint; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IPointerPoint); safecall;
    procedure InsertAt(index: Cardinal; value: IPointerPoint); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IPointerPoint); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPointerPoint): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIPointerPoint); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.IPointerPoint>
  // External 
  IVectorView_1__IPointerPoint = interface(IInspectable)
  ['{1697E0A0-DFE4-5BAE-AC51-F4C43FCEF82B}']
    function GetAt(index: Cardinal): IPointerPoint; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPointerPoint; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPointerPoint): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ITouchHitTestingEventArgs>
  TypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs_Delegate_Base = interface(IUnknown)
  ['{197654C9-0C47-502B-9AA1-0DEB03ED9702}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.ITouchHitTestingEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs = interface(TypedEventHandler_2__ICoreWindow__ITouchHitTestingEventArgs_Delegate_Base)
  ['{4A977150-92AB-5A61-9150-21F08B3AEF81}']
    procedure Invoke(sender: ICoreWindow; args: ITouchHitTestingEventArgs); safecall;
  end;

  // Windows.UI.Core.ITouchHitTestingEventArgs
  // External 
  ITouchHitTestingEventArgs = interface(IInspectable)
  ['{22F3B823-0B7C-424E-9DF7-33D4F962931B}']
    function get_ProximityEvaluation: CoreProximityEvaluation; safecall;
    procedure put_ProximityEvaluation(value: CoreProximityEvaluation); safecall;
    function get_Point: TPointF; safecall;
    function get_BoundingBox: TRectF; safecall;
    function EvaluateProximity(controlBoundingBox: TRectF): CoreProximityEvaluation; overload; safecall;
    function EvaluateProximity(controlVerticesSize: Cardinal; controlVertices: PPointF): CoreProximityEvaluation; overload; safecall;
    property BoundingBox: TRectF read get_BoundingBox;
    property Point: TPointF read get_Point;
    property ProximityEvaluation: CoreProximityEvaluation read get_ProximityEvaluation write put_ProximityEvaluation;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IWindowSizeChangedEventArgs>
  TypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{318DBB67-4089-5690-9040-1D454FB2F686}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IWindowSizeChangedEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs = interface(TypedEventHandler_2__ICoreWindow__IWindowSizeChangedEventArgs_Delegate_Base)
  ['{44420CB4-1853-5BB7-A73B-2701EF06DC36}']
    procedure Invoke(sender: ICoreWindow; args: IWindowSizeChangedEventArgs); safecall;
  end;

  // Windows.UI.Core.IWindowSizeChangedEventArgs
  // External 
  IWindowSizeChangedEventArgs = interface(IInspectable)
  ['{5A200EC7-0426-47DC-B86C-6F475915E451}']
    function get_Size: TSizeF; safecall;
    property Size: TSizeF read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IVisibilityChangedEventArgs>
  TypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{14B7F692-5583-52A1-AA42-FC1843C0F748}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Core.ICoreWindow,Windows.UI.Core.IVisibilityChangedEventArgs>
  // External 
  TypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs = interface(TypedEventHandler_2__ICoreWindow__IVisibilityChangedEventArgs_Delegate_Base)
  ['{C57E132B-9D39-58F7-A15C-2F12895CF858}']
    procedure Invoke(sender: ICoreWindow; args: IVisibilityChangedEventArgs); safecall;
  end;

  // Windows.UI.Core.IVisibilityChangedEventArgs
  // External 
  IVisibilityChangedEventArgs = interface(IInspectable)
  ['{BF9918EA-D801-4564-A495-B1E84F8AD085}']
    function get_Visible: Boolean; safecall;
    property Visible: Boolean read get_Visible;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.Activation.IActivatedEventArgs
  // External 
  Activation_IActivatedEventArgs = interface(IInspectable)
  ['{CF651713-CD08-4FD8-B697-A281B6544E2E}']
    function get_Kind: Activation_ActivationKind; safecall;
    function get_PreviousExecutionState: Activation_ApplicationExecutionState; safecall;
    function get_SplashScreen: Activation_ISplashScreen; safecall;
    property Kind: Activation_ActivationKind read get_Kind;
    property PreviousExecutionState: Activation_ApplicationExecutionState read get_PreviousExecutionState;
    property SplashScreen: Activation_ISplashScreen read get_SplashScreen;
  end;

  // Windows.ApplicationModel.Activation.ISplashScreen
  // External 
  Activation_ISplashScreen = interface(IInspectable)
  ['{CA4D975C-D4D6-43F0-97C0-0833C6391C24}']
    function get_ImageLocation: TRectF; safecall;
    function add_Dismissed(handler: TypedEventHandler_2__Activation_ISplashScreen__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Dismissed(cookie: EventRegistrationToken); safecall;
    property ImageLocation: TRectF read get_ImageLocation;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable_Delegate_Base = interface(IUnknown)
  ['{7725B2A5-287D-5ED2-A789-2A6A2673C7FE}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.Activation.ISplashScreen,Object>
  // External 
  TypedEventHandler_2__Activation_ISplashScreen__IInspectable = interface(TypedEventHandler_2__Activation_ISplashScreen__IInspectable_Delegate_Base)
  ['{359B8887-2FA6-5405-A4AF-642C9FDACC93}']
    procedure Invoke(sender: Activation_ISplashScreen; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Object>
  TypedEventHandler_2__IDataPackage__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C156B0C3-1CBC-5CA4-901C-62C5A8CA5CB5}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Object>
  // External 
  TypedEventHandler_2__IDataPackage__IInspectable = interface(TypedEventHandler_2__IDataPackage__IInspectable_Delegate_Base)
  ['{FFA86A6A-1BEE-540E-9911-7272C487A1ED}']
    procedure Invoke(sender: IDataPackage; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IDataPackage
  // External 
  IDataPackage = interface(IInspectable)
  ['{61EBF5C7-EFEA-4346-9554-981D7E198FFE}']
    function GetView: IDataPackageView; safecall;
    function get_Properties: IDataPackagePropertySet; safecall;
    function get_RequestedOperation: DataPackageOperation; safecall;
    procedure put_RequestedOperation(value: DataPackageOperation); safecall;
    function add_OperationCompleted(handler: TypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OperationCompleted(eventCookie: EventRegistrationToken); safecall;
    function add_Destroyed(handler: TypedEventHandler_2__IDataPackage__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Destroyed(eventCookie: EventRegistrationToken); safecall;
    procedure SetData(formatId: HSTRING; value: IInspectable); safecall;
    procedure SetDataProvider(formatId: HSTRING; delayRenderer: DataProviderHandler); safecall;
    procedure SetText(value: HSTRING); safecall;
    procedure SetUri(value: IUriRuntimeClass); safecall;
    procedure SetHtmlFormat(value: HSTRING); safecall;
    function get_ResourceMap: IMap_2__HSTRING__IRandomAccessStreamReference; safecall;
    procedure SetRtf(value: HSTRING); safecall;
    procedure SetBitmap(value: IRandomAccessStreamReference); safecall;
    procedure SetStorageItems(value: IIterable_1__IStorageItem); overload; safecall;
    procedure SetStorageItems(value: IIterable_1__IStorageItem; readOnly: Boolean); overload; safecall;
    property Properties: IDataPackagePropertySet read get_Properties;
    property RequestedOperation: DataPackageOperation read get_RequestedOperation write put_RequestedOperation;
    property ResourceMap: IMap_2__HSTRING__IRandomAccessStreamReference read get_ResourceMap;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IDataPackageView
  // External 
  IDataPackageView = interface(IInspectable)
  ['{7B840471-5900-4D85-A90B-10CB85FE3552}']
    function get_Properties: IDataPackagePropertySetView; safecall;
    function get_RequestedOperation: DataPackageOperation; safecall;
    procedure ReportOperationCompleted(value: DataPackageOperation); safecall;
    function get_AvailableFormats: IVectorView_1__HSTRING; safecall;
    function Contains(formatId: HSTRING): Boolean; safecall;
    function GetDataAsync(formatId: HSTRING): IAsyncOperation_1__IInspectable; safecall;
    function GetTextAsync: IAsyncOperation_1__HSTRING; overload; safecall;
    function GetTextAsync(formatId: HSTRING): IAsyncOperation_1__HSTRING; overload; safecall;
    function GetUriAsync: IAsyncOperation_1__IUriRuntimeClass; safecall;
    function GetHtmlFormatAsync: IAsyncOperation_1__HSTRING; safecall;
    function GetResourceMapAsync: IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference; safecall;
    function GetRtfAsync: IAsyncOperation_1__HSTRING; safecall;
    function GetBitmapAsync: IAsyncOperation_1__IRandomAccessStreamReference; safecall;
    function GetStorageItemsAsync: IAsyncOperation_1__IVectorView_1__IStorageItem; safecall;
    property AvailableFormats: IVectorView_1__HSTRING read get_AvailableFormats;
    property Properties: IDataPackagePropertySetView read get_Properties;
    property RequestedOperation: DataPackageOperation read get_RequestedOperation;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySetView
  // External 
  IDataPackagePropertySetView = interface(IInspectable)
  ['{B94CEC01-0C1A-4C57-BE55-75D01289735D}']
    function get_Title: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_Thumbnail: IRandomAccessStreamReference; safecall;
    function get_FileTypes: IVectorView_1__HSTRING; safecall;
    function get_ApplicationName: HSTRING; safecall;
    function get_ApplicationListingUri: IUriRuntimeClass; safecall;
    property ApplicationListingUri: IUriRuntimeClass read get_ApplicationListingUri;
    property ApplicationName: HSTRING read get_ApplicationName;
    property Description: HSTRING read get_Description;
    property FileTypes: IVectorView_1__HSTRING read get_FileTypes;
    property Thumbnail: IRandomAccessStreamReference read get_Thumbnail;
    property Title: HSTRING read get_Title;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  IAsyncOperation_1__IUriRuntimeClass_Base = interface(IInspectable)
  ['{641CB9DD-A28D-59E2-B8DB-A227EDA6CF2E}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  // External 
  IAsyncOperation_1__IUriRuntimeClass = interface(IAsyncOperation_1__IUriRuntimeClass_Base)
  ['{45BD84D5-E60D-5525-BC8F-B568B5538D2D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IUriRuntimeClass); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IUriRuntimeClass; safecall;
    function GetResults: IUriRuntimeClass; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IUriRuntimeClass read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IUriRuntimeClass>
  AsyncOperationCompletedHandler_1__IUriRuntimeClass_Delegate_Base = interface(IUnknown)
  ['{AD46F1CC-2BB0-585C-9885-03C2780D4D58}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.IUriRuntimeClass>
  // External 
  AsyncOperationCompletedHandler_1__IUriRuntimeClass = interface(AsyncOperationCompletedHandler_1__IUriRuntimeClass_Delegate_Base)
  ['{A25BFF34-DC7C-5FBA-9850-5D6996615BF5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IUriRuntimeClass; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>>
  IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference_Base = interface(IInspectable)
  ['{FC012D44-2DCF-5162-BE9A-7668675AA590}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>>
  // External 
  IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference = interface(IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference_Base)
  ['{D2D20F27-DBCC-571C-9ADF-DDE7A5AF53CA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference; safecall;
    function GetResults: IMapView_2__HSTRING__IRandomAccessStreamReference; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>>
  AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference_Delegate_Base = interface(IUnknown)
  ['{D4CB6B80-821A-5A7B-898D-D58917B31A36}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>>
  // External 
  AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference = interface(AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IRandomAccessStreamReference_Delegate_Base)
  ['{2D6EFF82-24CB-5680-9184-AD687A705A8C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMapView_2__HSTRING__IRandomAccessStreamReference; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>
  IMapView_2__HSTRING__IRandomAccessStreamReference_Base = interface(IInspectable)
  ['{0A4CE7A5-DFE0-5796-A438-EFFDFAA31F1B}']
  end;
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>
  // External 
  IMapView_2__HSTRING__IRandomAccessStreamReference = interface(IMapView_2__HSTRING__IRandomAccessStreamReference_Base)
  ['{20784CBD-B6FB-530A-B732-5375919F30B8}']
    function Lookup(key: HSTRING): IRandomAccessStreamReference; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IRandomAccessStreamReference; out second: IMapView_2__HSTRING__IRandomAccessStreamReference); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IDataPackagePropertySet
  // External 
  IDataPackagePropertySet = interface(IInspectable)
  ['{CD1C93EB-4C4C-443A-A8D3-F5C241E91689}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Description: HSTRING; safecall;
    procedure put_Description(value: HSTRING); safecall;
    function get_Thumbnail: IRandomAccessStreamReference; safecall;
    procedure put_Thumbnail(value: IRandomAccessStreamReference); safecall;
    function get_FileTypes: IVector_1__HSTRING; safecall;
    function get_ApplicationName: HSTRING; safecall;
    procedure put_ApplicationName(value: HSTRING); safecall;
    function get_ApplicationListingUri: IUriRuntimeClass; safecall;
    procedure put_ApplicationListingUri(value: IUriRuntimeClass); safecall;
    property ApplicationListingUri: IUriRuntimeClass read get_ApplicationListingUri write put_ApplicationListingUri;
    property ApplicationName: HSTRING read get_ApplicationName write put_ApplicationName;
    property Description: HSTRING read get_Description write put_Description;
    property FileTypes: IVector_1__HSTRING read get_FileTypes;
    property Thumbnail: IRandomAccessStreamReference read get_Thumbnail write put_Thumbnail;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs>
  TypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{DD48AF6C-EF9A-59CB-B326-57D9E2411F21}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.DataTransfer.IDataPackage,Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs>
  // External 
  TypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs = interface(TypedEventHandler_2__IDataPackage__IOperationCompletedEventArgs_Delegate_Base)
  ['{DE9E577F-9562-5D55-A33B-9EE39B3E5435}']
    procedure Invoke(sender: IDataPackage; args: IOperationCompletedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IOperationCompletedEventArgs
  // External 
  IOperationCompletedEventArgs = interface(IInspectable)
  ['{E7AF329D-051D-4FAB-B1A9-47FD77F70A41}']
    function get_Operation: DataPackageOperation; safecall;
    property Operation: DataPackageOperation read get_Operation;
  end;

  // Windows.ApplicationModel.DataTransfer.DataProviderHandler
  // External 
  DataProviderHandler = interface(IUnknown)
  ['{E7ECD720-F2F4-4A2D-920E-170A2F482A27}']
    procedure Invoke(request: IDataProviderRequest); safecall;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IDataProviderRequest
  // External 
  IDataProviderRequest = interface(IInspectable)
  ['{EBBC7157-D3C8-47DA-ACDE-F82388D5F716}']
    function get_FormatId: HSTRING; safecall;
    function get_Deadline: DateTime; safecall;
    function GetDeferral: IDataProviderDeferral; safecall;
    procedure SetData(value: IInspectable); safecall;
    property Deadline: DateTime read get_Deadline;
    property FormatId: HSTRING read get_FormatId;
  end;

  // DualAPI Interface
  // Windows.ApplicationModel.DataTransfer.IDataProviderDeferral
  // External 
  IDataProviderDeferral = interface(IInspectable)
  ['{C2CF2373-2D26-43D9-B69D-DCB86D03F6DA}']
    procedure Complete; safecall;
  end;

  // Windows.Foundation.Collections.IMap`2<String,Windows.Storage.Streams.IRandomAccessStreamReference>
  // External 
  IMap_2__HSTRING__IRandomAccessStreamReference = interface(IInspectable)
  ['{6C5B38B7-9D17-5B5F-A04F-3730A82FD9B8}']
    function Lookup(key: HSTRING): IRandomAccessStreamReference; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IRandomAccessStreamReference; safecall;
    function Insert(key: HSTRING; value: IRandomAccessStreamReference): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageItem>
  IIterable_1__IStorageItem_Base = interface(IInspectable)
  ['{BB8B8418-65D1-544B-B083-6D172F568C73}']
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageItem>
  // External 
  IIterable_1__IStorageItem = interface(IIterable_1__IStorageItem_Base)
  ['{BB8B8418-65D1-544B-B083-6D172F568C73}']
    function First: IIterator_1__IStorageItem; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageItem>
  IIterator_1__IStorageItem_Base = interface(IInspectable)
  ['{05B487C2-3830-5D3C-98DA-25FA11542DBD}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageItem>
  // External 
  IIterator_1__IStorageItem = interface(IIterator_1__IStorageItem_Base)
  ['{05B487C2-3830-5D3C-98DA-25FA11542DBD}']
    function get_Current: IStorageItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStorageItem): Cardinal; safecall;
    property Current: IStorageItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable_Delegate_Base = interface(IUnknown)
  ['{6C7EC2EC-9F00-5EA0-9A08-60E5070BCF03}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Object>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable = interface(TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable_Delegate_Base)
  ['{36D17BB4-1E2A-5A74-A1F1-A9D1347B7702}']
    procedure Invoke(sender: GenericAttributeProfile_IGattSession; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
  // External 
  GenericAttributeProfile_IGattSession = interface(IInspectable)
  ['{D23B5143-E04E-4C24-999C-9C256F9856B1}']
    function get_DeviceId: IBluetoothDeviceId; safecall;
    function get_CanMaintainConnection: Boolean; safecall;
    procedure put_MaintainConnection(value: Boolean); safecall;
    function get_MaintainConnection: Boolean; safecall;
    function get_MaxPduSize: Word; safecall;
    function get_SessionStatus: GenericAttributeProfile_GattSessionStatus; safecall;
    function add_MaxPduSizeChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MaxPduSizeChanged(token: EventRegistrationToken); safecall;
    function add_SessionStatusChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SessionStatusChanged(token: EventRegistrationToken); safecall;
    property CanMaintainConnection: Boolean read get_CanMaintainConnection;
    property DeviceId: IBluetoothDeviceId read get_DeviceId;
    property MaintainConnection: Boolean read get_MaintainConnection write put_MaintainConnection;
    property MaxPduSize: Word read get_MaxPduSize;
    property SessionStatus: GenericAttributeProfile_GattSessionStatus read get_SessionStatus;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.IBluetoothDeviceId
  // External 
  IBluetoothDeviceId = interface(IInspectable)
  ['{C17949AF-57C1-4642-BCCE-E6C06B20AE76}']
    function get_Id: HSTRING; safecall;
    function get_IsClassicDevice: Boolean; safecall;
    function get_IsLowEnergyDevice: Boolean; safecall;
    property Id: HSTRING read get_Id;
    property IsClassicDevice: Boolean read get_IsClassicDevice;
    property IsLowEnergyDevice: Boolean read get_IsLowEnergyDevice;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{0E1210F2-7B6F-543E-8ADB-A61D34AB535D}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattSession__GenericAttributeProfile_IGattSessionStatusChangedEventArgs_Delegate_Base)
  ['{D8E88F7A-28D3-54CD-A320-F0FE6F40A999}']
    procedure Invoke(sender: GenericAttributeProfile_IGattSession; args: GenericAttributeProfile_IGattSessionStatusChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs
  // External 
  GenericAttributeProfile_IGattSessionStatusChangedEventArgs = interface(IInspectable)
  ['{7605B72E-837F-404C-AB34-3163F39DDF32}']
    function get_Error: BluetoothError; safecall;
    function get_Status: GenericAttributeProfile_GattSessionStatus; safecall;
    property Error: BluetoothError read get_Error;
    property Status: GenericAttributeProfile_GattSessionStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable_Delegate_Base = interface(IUnknown)
  ['{9C17A110-806D-594B-B33D-ED280BBF27E5}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient,Object>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable = interface(TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable_Delegate_Base)
  ['{996904B7-B6DC-5C98-996D-4A3E110EFDA5}']
    procedure Invoke(sender: GenericAttributeProfile_IGattSubscribedClient; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
  // External 
  GenericAttributeProfile_IGattSubscribedClient = interface(IInspectable)
  ['{736E9001-15A4-4EC2-9248-E3F20D463BE9}']
    function get_Session: GenericAttributeProfile_IGattSession; safecall;
    function get_MaxNotificationSize: Word; safecall;
    function add_MaxNotificationSizeChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MaxNotificationSizeChanged(token: EventRegistrationToken); safecall;
    property MaxNotificationSize: Word read get_MaxNotificationSize;
    property Session: GenericAttributeProfile_IGattSession read get_Session;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable_Delegate_Base = interface(IUnknown)
  ['{8087ACD6-AED7-53EB-9B23-4808BB910C17}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Object>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable = interface(TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable_Delegate_Base)
  ['{6FD0FBA3-A5CA-51A7-938F-310EDDB72631}']
    procedure Invoke(sender: GenericAttributeProfile_IGattLocalCharacteristic; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
  // External 
  GenericAttributeProfile_IGattLocalCharacteristic = interface(IInspectable)
  ['{AEDE376D-5412-4D74-92A8-8DEB8526829C}']
    function get_Uuid: TGuid; safecall;
    function get_StaticValue: IBuffer; safecall;
    function get_CharacteristicProperties: GenericAttributeProfile_GattCharacteristicProperties; safecall;
    function get_ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    function get_WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    function CreateDescriptorAsync(descriptorUuid: TGuid; parameters: GenericAttributeProfile_IGattLocalDescriptorParameters): IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult; safecall;
    function get_Descriptors: IVectorView_1__GenericAttributeProfile_IGattLocalDescriptor; safecall;
    function get_UserDescription: HSTRING; safecall;
    function get_PresentationFormats: IVectorView_1__GenericAttributeProfile_IGattPresentationFormat; safecall;
    function get_SubscribedClients: IVectorView_1__GenericAttributeProfile_IGattSubscribedClient; safecall;
    function add_SubscribedClientsChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SubscribedClientsChanged(token: EventRegistrationToken); safecall;
    function add_ReadRequested(handler: TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadRequested(token: EventRegistrationToken); safecall;
    function add_WriteRequested(handler: TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_WriteRequested(token: EventRegistrationToken); safecall;
    function NotifyValueAsync(value: IBuffer): IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult; overload; safecall;
    function NotifyValueAsync(value: IBuffer; subscribedClient: GenericAttributeProfile_IGattSubscribedClient): IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult; overload; safecall;
    property CharacteristicProperties: GenericAttributeProfile_GattCharacteristicProperties read get_CharacteristicProperties;
    property Descriptors: IVectorView_1__GenericAttributeProfile_IGattLocalDescriptor read get_Descriptors;
    property PresentationFormats: IVectorView_1__GenericAttributeProfile_IGattPresentationFormat read get_PresentationFormats;
    property ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_ReadProtectionLevel;
    property StaticValue: IBuffer read get_StaticValue;
    property SubscribedClients: IVectorView_1__GenericAttributeProfile_IGattSubscribedClient read get_SubscribedClients;
    property UserDescription: HSTRING read get_UserDescription;
    property Uuid: TGuid read get_Uuid;
    property WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_WriteProtectionLevel;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult_Base = interface(IInspectable)
  ['{3EF6D808-754F-5040-97AC-0703309C574F}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult_Base)
  ['{5AA981DA-EB28-5CE4-A874-3B103786518A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult; safecall;
    function GetResults: GenericAttributeProfile_IGattLocalDescriptorResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult_Delegate_Base = interface(IUnknown)
  ['{F2927EEC-47D9-5338-9BA5-5BE8461AD410}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalDescriptorResult_Delegate_Base)
  ['{CC95F9AF-E0FC-543C-8E84-61730CC57C28}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattLocalDescriptorResult; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult
  // External 
  GenericAttributeProfile_IGattLocalDescriptorResult = interface(IInspectable)
  ['{375791BE-321F-4366-BFC1-3BC6B82C79F8}']
    function get_Descriptor: GenericAttributeProfile_IGattLocalDescriptor; safecall;
    function get_Error: BluetoothError; safecall;
    property Descriptor: GenericAttributeProfile_IGattLocalDescriptor read get_Descriptor;
    property Error: BluetoothError read get_Error;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
  // External 
  GenericAttributeProfile_IGattLocalDescriptor = interface(IInspectable)
  ['{F48EBE06-789D-4A4B-8652-BD017B5D2FC6}']
    function get_Uuid: TGuid; safecall;
    function get_StaticValue: IBuffer; safecall;
    function get_ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    function get_WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    function add_ReadRequested(handler: TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadRequested(token: EventRegistrationToken); safecall;
    function add_WriteRequested(handler: TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_WriteRequested(token: EventRegistrationToken); safecall;
    property ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_ReadProtectionLevel;
    property StaticValue: IBuffer read get_StaticValue;
    property Uuid: TGuid read get_Uuid;
    property WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_WriteProtectionLevel;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{252DCA5C-86E7-5BE1-AEED-F78C6ED466AB}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattReadRequestedEventArgs_Delegate_Base)
  ['{563959F3-47CA-5E09-891E-C70420861446}']
    procedure Invoke(sender: GenericAttributeProfile_IGattLocalDescriptor; args: GenericAttributeProfile_IGattReadRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs
  // External 
  GenericAttributeProfile_IGattReadRequestedEventArgs = interface(IInspectable)
  ['{93497243-F39C-484B-8AB6-996BA486CFA3}']
    function get_Session: GenericAttributeProfile_IGattSession; safecall;
    function GetDeferral: IDeferral; safecall;
    function GetRequestAsync: IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest; safecall;
    property Session: GenericAttributeProfile_IGattSession read get_Session;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest>
  IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest_Base = interface(IInspectable)
  ['{4732CEC2-D943-5CEB-8281-8D54A21B9A45}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest = interface(IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest_Base)
  ['{15F1BC63-05AD-5B59-8749-F13D89A4D107}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest; safecall;
    function GetResults: GenericAttributeProfile_IGattReadRequest; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest_Delegate_Base = interface(IUnknown)
  ['{31823848-3AB2-547A-8303-964DCC377C9C}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadRequest_Delegate_Base)
  ['{79E10863-9602-5F2D-9C60-7ADD53B24F77}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattReadRequest; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest
  // External 
  GenericAttributeProfile_IGattReadRequest = interface(IInspectable)
  ['{F1DD6535-6ACD-42A6-A4BB-D789DAE0043E}']
    function get_Offset: Cardinal; safecall;
    function get_Length: Cardinal; safecall;
    function get_State: GenericAttributeProfile_GattRequestState; safecall;
    function add_StateChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StateChanged(token: EventRegistrationToken); safecall;
    procedure RespondWithValue(value: IBuffer); safecall;
    procedure RespondWithProtocolError(protocolError: Byte); safecall;
    property Length: Cardinal read get_Length;
    property Offset: Cardinal read get_Offset;
    property State: GenericAttributeProfile_GattRequestState read get_State;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{0246E199-5199-5BDB-919D-8544CE30FD71}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattReadRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs_Delegate_Base)
  ['{DA58BBDC-A307-5052-B47C-D1614AE89712}']
    procedure Invoke(sender: GenericAttributeProfile_IGattReadRequest; args: GenericAttributeProfile_IGattRequestStateChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs
  // External 
  GenericAttributeProfile_IGattRequestStateChangedEventArgs = interface(IInspectable)
  ['{E834D92C-27BE-44B3-9D0D-4FC6E808DD3F}']
    function get_State: GenericAttributeProfile_GattRequestState; safecall;
    function get_Error: BluetoothError; safecall;
    property Error: BluetoothError read get_Error;
    property State: GenericAttributeProfile_GattRequestState read get_State;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{6CF5B169-3731-591B-AE7C-D939FAAA8A71}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattLocalDescriptor__GenericAttributeProfile_IGattWriteRequestedEventArgs_Delegate_Base)
  ['{CB1ABF9C-5B64-5941-86B8-475239221291}']
    procedure Invoke(sender: GenericAttributeProfile_IGattLocalDescriptor; args: GenericAttributeProfile_IGattWriteRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs
  // External 
  GenericAttributeProfile_IGattWriteRequestedEventArgs = interface(IInspectable)
  ['{2DEC8BBE-A73A-471A-94D5-037DEADD0806}']
    function get_Session: GenericAttributeProfile_IGattSession; safecall;
    function GetDeferral: IDeferral; safecall;
    function GetRequestAsync: IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest; safecall;
    property Session: GenericAttributeProfile_IGattSession read get_Session;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest>
  IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest_Base = interface(IInspectable)
  ['{FB8B3C18-2F60-5B43-B773-146045816E03}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest = interface(IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest_Base)
  ['{E82BD98A-0FE5-5AC6-9505-9B93DD1617C1}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest; safecall;
    function GetResults: GenericAttributeProfile_IGattWriteRequest; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest_Delegate_Base = interface(IUnknown)
  ['{25B737F6-30FF-558E-BA16-B564C45FDC06}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteRequest_Delegate_Base)
  ['{3475725E-666D-5629-B747-163468E77F7D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattWriteRequest; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest
  // External 
  GenericAttributeProfile_IGattWriteRequest = interface(IInspectable)
  ['{AEB6A9ED-DE2F-4FC2-A9A8-94EA7844F13D}']
    function get_Value: IBuffer; safecall;
    function get_Offset: Cardinal; safecall;
    function get_Option: GenericAttributeProfile_GattWriteOption; safecall;
    function get_State: GenericAttributeProfile_GattRequestState; safecall;
    function add_StateChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StateChanged(token: EventRegistrationToken); safecall;
    procedure Respond; safecall;
    procedure RespondWithProtocolError(protocolError: Byte); safecall;
    property Offset: Cardinal read get_Offset;
    property Option: GenericAttributeProfile_GattWriteOption read get_Option;
    property State: GenericAttributeProfile_GattRequestState read get_State;
    property Value: IBuffer read get_Value;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{7744C6BC-CDCD-5283-9E4F-2E21B49A2EF2}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattWriteRequest__GenericAttributeProfile_IGattRequestStateChangedEventArgs_Delegate_Base)
  ['{58BE9D7F-7B15-56CD-B5FF-8D3CD0CDD9BB}']
    procedure Invoke(sender: GenericAttributeProfile_IGattWriteRequest; args: GenericAttributeProfile_IGattRequestStateChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters
  // External 
  GenericAttributeProfile_IGattLocalDescriptorParameters = interface(IInspectable)
  ['{5FDEDE6A-F3C1-4B66-8C4B-E3D2293B40E9}']
    procedure put_StaticValue(value: IBuffer); safecall;
    function get_StaticValue: IBuffer; safecall;
    procedure put_ReadProtectionLevel(value: GenericAttributeProfile_GattProtectionLevel); safecall;
    function get_ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    procedure put_WriteProtectionLevel(value: GenericAttributeProfile_GattProtectionLevel); safecall;
    function get_WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    property ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_ReadProtectionLevel write put_ReadProtectionLevel;
    property StaticValue: IBuffer read get_StaticValue write put_StaticValue;
    property WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_WriteProtectionLevel write put_WriteProtectionLevel;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattLocalDescriptor = interface(IInspectable)
  ['{F28FF66D-95D2-5DFE-B92C-E222DC58A527}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattLocalDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattLocalDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattLocalDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattPresentationFormat = interface(IInspectable)
  ['{E606B52C-CE92-5CAC-A4C3-6BED39EBB7D2}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattPresentationFormat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattPresentationFormat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattPresentationFormat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
  // External 
  GenericAttributeProfile_IGattPresentationFormat = interface(IInspectable)
  ['{196D0021-FAAD-45DC-AE5B-2AC3184E84DB}']
    function get_FormatType: Byte; safecall;
    function get_Exponent: Integer; safecall;
    function get_Unit: Word; safecall;
    function get_Namespace: Byte; safecall;
    function get_Description: Word; safecall;
    property Description: Word read get_Description;
    property Exponent: Integer read get_Exponent;
    property FormatType: Byte read get_FormatType;
    property Namespace: Byte read get_Namespace;
    property &Unit: Word read get_Unit;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattSubscribedClient = interface(IInspectable)
  ['{AC454392-B7E9-5F81-B490-8C22736E8FAF}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattSubscribedClient; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattSubscribedClient; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattSubscribedClient): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{218A3E4A-AA9D-500E-BCA7-047751BB10A3}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattReadRequestedEventArgs_Delegate_Base)
  ['{76E55EC5-0FA9-57DC-9A19-393D973B71D9}']
    procedure Invoke(sender: GenericAttributeProfile_IGattLocalCharacteristic; args: GenericAttributeProfile_IGattReadRequestedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{ED61A2FB-7D2A-5BA3-8EBF-8AD878E539A9}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__GenericAttributeProfile_IGattWriteRequestedEventArgs_Delegate_Base)
  ['{6648D851-ECC6-5BD1-B013-0F76FE46A7B4}']
    procedure Invoke(sender: GenericAttributeProfile_IGattLocalCharacteristic; args: GenericAttributeProfile_IGattWriteRequestedEventArgs); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>>
  IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult_Base = interface(IInspectable)
  ['{B6FA5848-ACCD-536B-A37E-2444D86F2C1F}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>>
  // External 
  IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = interface(IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult_Base)
  ['{77864A29-6D27-53FB-ACB3-5D0A63014C25}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult; safecall;
    function GetResults: IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>>
  AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult_Delegate_Base = interface(IUnknown)
  ['{2F6C4343-667F-5D74-8EE7-B39DE335A960}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>>
  // External 
  AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = interface(AsyncOperationCompletedHandler_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult_Delegate_Base)
  ['{43D6F81B-134C-5EBB-9FBC-DC7726A3E392}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattClientNotificationResult = interface(IInspectable)
  ['{4865DCB2-E33A-5D5E-9256-8825E5354F91}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattClientNotificationResult; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattClientNotificationResult; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattClientNotificationResult): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult
  // External 
  GenericAttributeProfile_IGattClientNotificationResult = interface(IInspectable)
  ['{506D5599-0112-419A-8E3B-AE21AFABD2C2}']
    function get_SubscribedClient: GenericAttributeProfile_IGattSubscribedClient; safecall;
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_ProtocolError: IReference_1__Byte; safecall;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
    property SubscribedClient: GenericAttributeProfile_IGattSubscribedClient read get_SubscribedClient;
  end;

  // Windows.Foundation.IReference`1<UInt8>
  // External 
  IReference_1__Byte = interface(IInspectable)
  ['{E5198CC8-2873-55F5-B0A1-84FF9E4AAD62}']
    function get_Value: Byte; safecall;
    property Value: Byte read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult_Base = interface(IInspectable)
  ['{DE27C5CF-6227-5829-B997-88E575AD0680}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult_Base)
  ['{F965BFC2-BE41-536F-97E7-C537FE92B218}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult; safecall;
    function GetResults: GenericAttributeProfile_IGattClientNotificationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult_Delegate_Base = interface(IUnknown)
  ['{9783FEF1-1B62-5418-9898-933138C2BD14}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattClientNotificationResult_Delegate_Base)
  ['{130F9942-D7D7-5FBA-9990-DF2B2E3ED58A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattClientNotificationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.IBluetoothLEDevice,Object>
  TypedEventHandler_2__IBluetoothLEDevice__IInspectable_Delegate_Base = interface(IUnknown)
  ['{A90661E2-372E-5D1E-BBBB-B8A2CE0E7C4D}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.IBluetoothLEDevice,Object>
  // External 
  TypedEventHandler_2__IBluetoothLEDevice__IInspectable = interface(TypedEventHandler_2__IBluetoothLEDevice__IInspectable_Delegate_Base)
  ['{68B7E600-528B-5EE6-BEE1-1A4B917B2AA8}']
    procedure Invoke(sender: IBluetoothLEDevice; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.IBluetoothLEDevice
  // External 
  IBluetoothLEDevice = interface(IInspectable)
  ['{B5EE2F7B-4AD8-4642-AC48-80A0B500E887}']
    function get_DeviceId: HSTRING; safecall;
    function get_Name: HSTRING; safecall;
    function get_GattServices: IVectorView_1__GenericAttributeProfile_IGattDeviceService; safecall;
    function get_ConnectionStatus: BluetoothConnectionStatus; safecall;
    function get_BluetoothAddress: UInt64; safecall;
    function GetGattService(serviceUuid: TGuid): GenericAttributeProfile_IGattDeviceService; safecall;
    function add_NameChanged(handler: TypedEventHandler_2__IBluetoothLEDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_NameChanged(token: EventRegistrationToken); safecall;
    function add_GattServicesChanged(handler: TypedEventHandler_2__IBluetoothLEDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_GattServicesChanged(token: EventRegistrationToken); safecall;
    function add_ConnectionStatusChanged(handler: TypedEventHandler_2__IBluetoothLEDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ConnectionStatusChanged(token: EventRegistrationToken); safecall;
    property BluetoothAddress: UInt64 read get_BluetoothAddress;
    property ConnectionStatus: BluetoothConnectionStatus read get_ConnectionStatus;
    property DeviceId: HSTRING read get_DeviceId;
    property GattServices: IVectorView_1__GenericAttributeProfile_IGattDeviceService read get_GattServices;
    property Name: HSTRING read get_Name;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattDeviceService = interface(IInspectable)
  ['{C44B7FD0-1C4C-56D8-A640-C159C17F1CF9}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattDeviceService; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattDeviceService; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattDeviceService): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
  // External 
  GenericAttributeProfile_IGattDeviceService = interface(IInspectable)
  ['{AC7B7C05-B33C-47CF-990F-6B8F5577DF71}']
    function GetCharacteristics(characteristicUuid: TGuid): IVectorView_1__GenericAttributeProfile_IGattCharacteristic; safecall;
    function GetIncludedServices(serviceUuid: TGuid): IVectorView_1__GenericAttributeProfile_IGattDeviceService; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_Uuid: TGuid; safecall;
    function get_AttributeHandle: Word; safecall;
    property AttributeHandle: Word read get_AttributeHandle;
    property DeviceId: HSTRING read get_DeviceId;
    property Uuid: TGuid read get_Uuid;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattCharacteristic = interface(IInspectable)
  ['{F5A70A0F-15F4-57EE-9FE7-0CE390AE530B}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattCharacteristic; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattCharacteristic; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattCharacteristic): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
  // External 
  GenericAttributeProfile_IGattCharacteristic = interface(IInspectable)
  ['{59CB50C1-5934-4F68-A198-EB864FA44E6B}']
    function GetDescriptors(descriptorUuid: TGuid): IVectorView_1__GenericAttributeProfile_IGattDescriptor; safecall;
    function get_CharacteristicProperties: GenericAttributeProfile_GattCharacteristicProperties; safecall;
    function get_ProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    procedure put_ProtectionLevel(value: GenericAttributeProfile_GattProtectionLevel); safecall;
    function get_UserDescription: HSTRING; safecall;
    function get_Uuid: TGuid; safecall;
    function get_AttributeHandle: Word; safecall;
    function get_PresentationFormats: IVectorView_1__GenericAttributeProfile_IGattPresentationFormat; safecall;
    function ReadValueAsync: IAsyncOperation_1__GenericAttributeProfile_IGattReadResult; overload; safecall;
    function ReadValueAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattReadResult; overload; safecall;
    function WriteValueAsync(value: IBuffer): IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus; overload; safecall;
    function WriteValueAsync(value: IBuffer; writeOption: GenericAttributeProfile_GattWriteOption): IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus; overload; safecall;
    function ReadClientCharacteristicConfigurationDescriptorAsync: IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult; safecall;
    function WriteClientCharacteristicConfigurationDescriptorAsync(clientCharacteristicConfigurationDescriptorValue: GenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue): IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus; safecall;
    function add_ValueChanged(valueChangedHandler: TypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ValueChanged(valueChangedEventCookie: EventRegistrationToken); safecall;
    property AttributeHandle: Word read get_AttributeHandle;
    property CharacteristicProperties: GenericAttributeProfile_GattCharacteristicProperties read get_CharacteristicProperties;
    property PresentationFormats: IVectorView_1__GenericAttributeProfile_IGattPresentationFormat read get_PresentationFormats;
    property ProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_ProtectionLevel write put_ProtectionLevel;
    property UserDescription: HSTRING read get_UserDescription;
    property Uuid: TGuid read get_Uuid;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  // External 
  IVectorView_1__GenericAttributeProfile_IGattDescriptor = interface(IInspectable)
  ['{F23D1B8A-27DF-547D-9482-1DD9089D8A99}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
  // External 
  GenericAttributeProfile_IGattDescriptor = interface(IInspectable)
  ['{92055F2B-8084-4344-B4C2-284DE19A8506}']
    function get_ProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    procedure put_ProtectionLevel(value: GenericAttributeProfile_GattProtectionLevel); safecall;
    function get_Uuid: TGuid; safecall;
    function get_AttributeHandle: Word; safecall;
    function ReadValueAsync: IAsyncOperation_1__GenericAttributeProfile_IGattReadResult; overload; safecall;
    function ReadValueAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattReadResult; overload; safecall;
    function WriteValueAsync(value: IBuffer): IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus; safecall;
    property AttributeHandle: Word read get_AttributeHandle;
    property ProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_ProtectionLevel write put_ProtectionLevel;
    property Uuid: TGuid read get_Uuid;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattReadResult_Base = interface(IInspectable)
  ['{D40432A8-1E14-51D0-B49B-AE2CE1AA05E5}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_IGattReadResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattReadResult_Base)
  ['{55FC83CB-542E-5E30-AF71-8E8CD0BD3DEB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult; safecall;
    function GetResults: GenericAttributeProfile_IGattReadResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult_Delegate_Base = interface(IUnknown)
  ['{D8992AA0-EAC2-55B7-92C5-894886BEB0CA}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadResult_Delegate_Base)
  ['{303B29E1-492A-5B34-8342-81B827B67051}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattReadResult; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult
  // External 
  GenericAttributeProfile_IGattReadResult = interface(IInspectable)
  ['{63A66F08-1AEA-4C4C-A50F-97BAE474B348}']
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_Value: IBuffer; safecall;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
    property Value: IBuffer read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus_Base = interface(IInspectable)
  ['{3FF69516-1BFB-52E9-9EE6-E5CDB78E1683}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus = interface(IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus; safecall;
    function GetResults: GenericAttributeProfile_GattCommunicationStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus_Delegate_Base = interface(IUnknown)
  ['{2154117A-978D-59DB-99CF-6B690CB3389B}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattCommunicationStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult_Base = interface(IInspectable)
  ['{CF4444CC-4077-5719-8366-46E86B983685}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult>
  // External 
  IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult_Base)
  ['{8B916488-861B-5537-A189-0239B2B84D64}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult; safecall;
    function GetResults: GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult_Delegate_Base = interface(IUnknown)
  ['{98F9A6F3-4D29-5351-8B12-751DC977A331}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult>
  // External 
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult_Delegate_Base)
  ['{A42294DB-768D-50EC-AA7C-F4AB7815980F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult
  // External 
  GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult = interface(IInspectable)
  ['{63A66F09-1AEA-4C4C-A50F-97BAE474B348}']
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_ClientCharacteristicConfigurationDescriptor: GenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue; safecall;
    property ClientCharacteristicConfigurationDescriptor: GenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue read get_ClientCharacteristicConfigurationDescriptor;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C1F420F6-6292-5760-A2C9-9DDF98683CFC}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  // External 
  TypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattCharacteristic__GenericAttributeProfile_IGattValueChangedEventArgs_Delegate_Base)
  ['{42B52484-A834-51A1-A02F-AC8EC8535CA6}']
    procedure Invoke(sender: GenericAttributeProfile_IGattCharacteristic; args: GenericAttributeProfile_IGattValueChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
  // External 
  GenericAttributeProfile_IGattValueChangedEventArgs = interface(IInspectable)
  ['{D21BDB54-06E3-4ED8-A263-ACFAC8BA7313}']
    function get_CharacteristicValue: IBuffer; safecall;
    function get_Timestamp: DateTime; safecall;
    property CharacteristicValue: IBuffer read get_CharacteristicValue;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.IRadio>
  IAsyncOperation_1__Radios_IRadio_Base = interface(IInspectable)
  ['{EAC62C40-8DBC-5854-8BA0-B7B9940E7389}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.IRadio>
  // External 
  IAsyncOperation_1__Radios_IRadio = interface(IAsyncOperation_1__Radios_IRadio_Base)
  ['{21F4F6AA-B8B3-541E-8C56-6B7DDA0081F4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Radios_IRadio); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Radios_IRadio; safecall;
    function GetResults: Radios_IRadio; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Radios_IRadio read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Radios.IRadio>
  AsyncOperationCompletedHandler_1__Radios_IRadio_Delegate_Base = interface(IUnknown)
  ['{8A5C7E3A-80E2-585B-8630-7A8E777F0354}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Radios.IRadio>
  // External 
  AsyncOperationCompletedHandler_1__Radios_IRadio = interface(AsyncOperationCompletedHandler_1__Radios_IRadio_Delegate_Base)
  ['{8178318F-1B1A-5DAE-BD78-77EA625EFAB0}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Radios_IRadio; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Radios.IRadio
  // External 
  Radios_IRadio = interface(IInspectable)
  ['{252118DF-B33E-416A-875F-1CF38AE2D83E}']
    function SetStateAsync(value: Radios_RadioState): IAsyncOperation_1__Radios_RadioAccessStatus; safecall;
    function add_StateChanged(handler: TypedEventHandler_2__Radios_IRadio__IInspectable): EventRegistrationToken; safecall;
    procedure remove_StateChanged(eventCookie: EventRegistrationToken); safecall;
    function get_State: Radios_RadioState; safecall;
    function get_Name: HSTRING; safecall;
    function get_Kind: Radios_RadioKind; safecall;
    property Kind: Radios_RadioKind read get_Kind;
    property Name: HSTRING read get_Name;
    property State: Radios_RadioState read get_State;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.RadioAccessStatus>
  IAsyncOperation_1__Radios_RadioAccessStatus_Base = interface(IInspectable)
  ['{21FB30EF-072F-502C-9898-D0C3B2CD9AC5}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.RadioAccessStatus>
  // External 
  IAsyncOperation_1__Radios_RadioAccessStatus = interface(IAsyncOperation_1__Radios_RadioAccessStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus; safecall;
    function GetResults: Radios_RadioAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Radios.RadioAccessStatus>
  AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus_Delegate_Base = interface(IUnknown)
  ['{BD248E73-F05F-574C-AE3D-9B95C4BF282A}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Radios.RadioAccessStatus>
  // External 
  AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus = interface(AsyncOperationCompletedHandler_1__Radios_RadioAccessStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Radios_RadioAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Radios.IRadio,Object>
  TypedEventHandler_2__Radios_IRadio__IInspectable_Delegate_Base = interface(IUnknown)
  ['{FC6AA329-B586-5EBB-9E85-3F6B84EBDF18}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Radios.IRadio,Object>
  // External 
  TypedEventHandler_2__Radios_IRadio__IInspectable = interface(TypedEventHandler_2__Radios_IRadio__IInspectable_Delegate_Base)
  ['{207C98EF-4610-5402-ADF3-7C412F7B6380}']
    procedure Invoke(sender: Radios_IRadio; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.IBluetoothDevice,Object>
  TypedEventHandler_2__IBluetoothDevice__IInspectable_Delegate_Base = interface(IUnknown)
  ['{DB56CE1C-5E9F-5138-9227-B1A66D60BC1B}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.IBluetoothDevice,Object>
  // External 
  TypedEventHandler_2__IBluetoothDevice__IInspectable = interface(TypedEventHandler_2__IBluetoothDevice__IInspectable_Delegate_Base)
  ['{E3343193-1080-53E0-9056-4FDA6A561704}']
    procedure Invoke(sender: IBluetoothDevice; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.IBluetoothDevice
  // External 
  IBluetoothDevice = interface(IInspectable)
  ['{2335B156-90D2-4A04-AEF5-0E20B9E6B707}']
    function get_DeviceId: HSTRING; safecall;
    function get_HostName: IHostName; safecall;
    function get_Name: HSTRING; safecall;
    function get_ClassOfDevice: IBluetoothClassOfDevice; safecall;
    function get_SdpRecords: IVectorView_1__IBuffer; safecall;
    function get_RfcommServices: IVectorView_1__Rfcomm_IRfcommDeviceService; safecall;
    function get_ConnectionStatus: BluetoothConnectionStatus; safecall;
    function get_BluetoothAddress: UInt64; safecall;
    function add_NameChanged(handler: TypedEventHandler_2__IBluetoothDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_NameChanged(token: EventRegistrationToken); safecall;
    function add_SdpRecordsChanged(handler: TypedEventHandler_2__IBluetoothDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SdpRecordsChanged(token: EventRegistrationToken); safecall;
    function add_ConnectionStatusChanged(handler: TypedEventHandler_2__IBluetoothDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ConnectionStatusChanged(token: EventRegistrationToken); safecall;
    property BluetoothAddress: UInt64 read get_BluetoothAddress;
    property ClassOfDevice: IBluetoothClassOfDevice read get_ClassOfDevice;
    property ConnectionStatus: BluetoothConnectionStatus read get_ConnectionStatus;
    property DeviceId: HSTRING read get_DeviceId;
    property HostName: IHostName read get_HostName;
    property Name: HSTRING read get_Name;
    property RfcommServices: IVectorView_1__Rfcomm_IRfcommDeviceService read get_RfcommServices;
    property SdpRecords: IVectorView_1__IBuffer read get_SdpRecords;
  end;

  // DualAPI Interface
  // Windows.Networking.IHostName
  // External 
  IHostName = interface(IInspectable)
  ['{BF8ECAAD-ED96-49A7-9084-D416CAE88DCB}']
    function get_IPInformation: IIPInformation; safecall;
    function get_RawName: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_CanonicalName: HSTRING; safecall;
    function get_Type: HostNameType; safecall;
    function IsEqual(hostName: IHostName): Boolean; safecall;
    property CanonicalName: HSTRING read get_CanonicalName;
    property DisplayName: HSTRING read get_DisplayName;
    property IPInformation: IIPInformation read get_IPInformation;
    property RawName: HSTRING read get_RawName;
    property &Type: HostNameType read get_Type;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.IIPInformation
  // External 
  IIPInformation = interface(IInspectable)
  ['{D85145E0-138F-47D7-9B3A-36BB488CEF33}']
    function get_NetworkAdapter: INetworkAdapter; safecall;
    function get_PrefixLength: IReference_1__Byte; safecall;
    property NetworkAdapter: INetworkAdapter read get_NetworkAdapter;
    property PrefixLength: IReference_1__Byte read get_PrefixLength;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.INetworkAdapter
  // External 
  INetworkAdapter = interface(IInspectable)
  ['{3B542E03-5388-496C-A8A3-AFFD39AEC2E6}']
    function get_OutboundMaxBitsPerSecond: UInt64; safecall;
    function get_InboundMaxBitsPerSecond: UInt64; safecall;
    function get_IanaInterfaceType: Cardinal; safecall;
    function get_NetworkItem: INetworkItem; safecall;
    function get_NetworkAdapterId: TGuid; safecall;
    function GetConnectedProfileAsync: IAsyncOperation_1__IConnectionProfile; safecall;
    property IanaInterfaceType: Cardinal read get_IanaInterfaceType;
    property InboundMaxBitsPerSecond: UInt64 read get_InboundMaxBitsPerSecond;
    property NetworkAdapterId: TGuid read get_NetworkAdapterId;
    property NetworkItem: INetworkItem read get_NetworkItem;
    property OutboundMaxBitsPerSecond: UInt64 read get_OutboundMaxBitsPerSecond;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.INetworkItem
  // External 
  INetworkItem = interface(IInspectable)
  ['{01BC4D39-F5E0-4567-A28C-42080C831B2B}']
    function get_NetworkId: TGuid; safecall;
    function GetNetworkTypes: NetworkTypes; safecall;
    property NetworkId: TGuid read get_NetworkId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.Connectivity.IConnectionProfile>
  IAsyncOperation_1__IConnectionProfile_Base = interface(IInspectable)
  ['{5BF519CA-8ADB-5AB5-ABB8-FF1BBE5D2DE8}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.Connectivity.IConnectionProfile>
  // External 
  IAsyncOperation_1__IConnectionProfile = interface(IAsyncOperation_1__IConnectionProfile_Base)
  ['{76F83AB3-8473-573F-929B-CB63C31C2217}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IConnectionProfile); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IConnectionProfile; safecall;
    function GetResults: IConnectionProfile; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IConnectionProfile read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Connectivity.IConnectionProfile>
  AsyncOperationCompletedHandler_1__IConnectionProfile_Delegate_Base = interface(IUnknown)
  ['{E4F0C96A-0571-59F4-A9A9-AFAC3E61CAA0}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.Connectivity.IConnectionProfile>
  // External 
  AsyncOperationCompletedHandler_1__IConnectionProfile = interface(AsyncOperationCompletedHandler_1__IConnectionProfile_Delegate_Base)
  ['{A3EA214F-1B9F-5581-AE53-9B2B1C552EC5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IConnectionProfile; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.IConnectionProfile
  // External 
  IConnectionProfile = interface(IInspectable)
  ['{71BA143C-598E-49D0-84EB-8FEBAEDCC195}']
    function get_ProfileName: HSTRING; safecall;
    function GetNetworkConnectivityLevel: NetworkConnectivityLevel; safecall;
    function GetNetworkNames: IVectorView_1__HSTRING; safecall;
    function GetConnectionCost: IConnectionCost; safecall;
    function GetDataPlanStatus: IDataPlanStatus; safecall;
    function get_NetworkAdapter: INetworkAdapter; safecall;
    function GetLocalUsage(StartTime: DateTime; EndTime: DateTime): IDataUsage; overload; safecall;
    function GetLocalUsage(StartTime: DateTime; EndTime: DateTime; States: RoamingStates): IDataUsage; overload; safecall;
    function get_NetworkSecuritySettings: INetworkSecuritySettings; safecall;
    property NetworkAdapter: INetworkAdapter read get_NetworkAdapter;
    property NetworkSecuritySettings: INetworkSecuritySettings read get_NetworkSecuritySettings;
    property ProfileName: HSTRING read get_ProfileName;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.IConnectionCost
  // External 
  IConnectionCost = interface(IInspectable)
  ['{BAD7D829-3416-4B10-A202-BAC0B075BDAE}']
    function get_NetworkCostType: NetworkCostType; safecall;
    function get_Roaming: Boolean; safecall;
    function get_OverDataLimit: Boolean; safecall;
    function get_ApproachingDataLimit: Boolean; safecall;
    property ApproachingDataLimit: Boolean read get_ApproachingDataLimit;
    [HPPGEN('//TODO: C++ Property')]
    property NetworkCostType: NetworkCostType read get_NetworkCostType;
    property OverDataLimit: Boolean read get_OverDataLimit;
    property Roaming: Boolean read get_Roaming;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.IDataPlanStatus
  // External 
  IDataPlanStatus = interface(IInspectable)
  ['{977A8B8C-3885-40F3-8851-42CD2BD568BB}']
    function get_DataPlanUsage: IDataPlanUsage; safecall;
    function get_DataLimitInMegabytes: IReference_1__Cardinal; safecall;
    function get_InboundBitsPerSecond: IReference_1__UInt64; safecall;
    function get_OutboundBitsPerSecond: IReference_1__UInt64; safecall;
    function get_NextBillingCycle: IReference_1__DateTime; safecall;
    function get_MaxTransferSizeInMegabytes: IReference_1__Cardinal; safecall;
    property DataLimitInMegabytes: IReference_1__Cardinal read get_DataLimitInMegabytes;
    property DataPlanUsage: IDataPlanUsage read get_DataPlanUsage;
    property InboundBitsPerSecond: IReference_1__UInt64 read get_InboundBitsPerSecond;
    property MaxTransferSizeInMegabytes: IReference_1__Cardinal read get_MaxTransferSizeInMegabytes;
    property NextBillingCycle: IReference_1__DateTime read get_NextBillingCycle;
    property OutboundBitsPerSecond: IReference_1__UInt64 read get_OutboundBitsPerSecond;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.IDataPlanUsage
  // External 
  IDataPlanUsage = interface(IInspectable)
  ['{B921492D-3B44-47FF-B361-BE59E69ED1B0}']
    function get_MegabytesUsed: Cardinal; safecall;
    function get_LastSyncTime: DateTime; safecall;
    property LastSyncTime: DateTime read get_LastSyncTime;
    property MegabytesUsed: Cardinal read get_MegabytesUsed;
  end;

  // Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // External 
  IReference_1__DateTime = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: DateTime; safecall;
    property Value: DateTime read get_Value;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.IDataUsage
  // External 
  IDataUsage = interface(IInspectable)
  ['{C1431DD3-B146-4D39-B959-0C69B096C512}']
    function get_BytesSent: UInt64; safecall;
    function get_BytesReceived: UInt64; safecall;
    property BytesReceived: UInt64 read get_BytesReceived;
    property BytesSent: UInt64 read get_BytesSent;
  end;

  // DualAPI Interface
  // Windows.Networking.Connectivity.INetworkSecuritySettings
  // External 
  INetworkSecuritySettings = interface(IInspectable)
  ['{7CA07E8D-917B-4B5F-B84D-28F7A5AC5402}']
    function get_NetworkAuthenticationType: NetworkAuthenticationType; safecall;
    function get_NetworkEncryptionType: NetworkEncryptionType; safecall;
    [HPPGEN('//TODO: C++ Property')]
    property NetworkAuthenticationType: NetworkAuthenticationType read get_NetworkAuthenticationType;
    [HPPGEN('//TODO: C++ Property')]
    property NetworkEncryptionType: NetworkEncryptionType read get_NetworkEncryptionType;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.IBluetoothClassOfDevice
  // External 
  IBluetoothClassOfDevice = interface(IInspectable)
  ['{D640227E-D7D7-4661-9454-65039CA17A2B}']
    function get_RawValue: Cardinal; safecall;
    function get_MajorClass: BluetoothMajorClass; safecall;
    function get_MinorClass: BluetoothMinorClass; safecall;
    function get_ServiceCapabilities: BluetoothServiceCapabilities; safecall;
    property MajorClass: BluetoothMajorClass read get_MajorClass;
    property MinorClass: BluetoothMinorClass read get_MinorClass;
    property RawValue: Cardinal read get_RawValue;
    property ServiceCapabilities: BluetoothServiceCapabilities read get_ServiceCapabilities;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Streams.IBuffer>
  // External 
  IVectorView_1__IBuffer = interface(IInspectable)
  ['{FD944562-11D6-5EAB-BD72-701993B68FAC}']
    function GetAt(index: Cardinal): IBuffer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IBuffer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIBuffer): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  // External 
  IVectorView_1__Rfcomm_IRfcommDeviceService = interface(IInspectable)
  ['{DB646C4B-561D-568C-96C9-A904005738D7}']
    function GetAt(index: Cardinal): Rfcomm_IRfcommDeviceService; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Rfcomm_IRfcommDeviceService; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PRfcomm_IRfcommDeviceService): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
  // External 
  Rfcomm_IRfcommDeviceService = interface(IInspectable)
  ['{AE81FF1F-C5A1-4C40-8C28-F3EFD69062F3}']
    function get_ConnectionHostName: IHostName; safecall;
    function get_ConnectionServiceName: HSTRING; safecall;
    function get_ServiceId: Rfcomm_IRfcommServiceId; safecall;
    function get_ProtectionLevel: SocketProtectionLevel; safecall;
    function get_MaxProtectionLevel: SocketProtectionLevel; safecall;
    function GetSdpRawAttributesAsync: IAsyncOperation_1__IMapView_2__Cardinal__IBuffer; overload; safecall;
    function GetSdpRawAttributesAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__IMapView_2__Cardinal__IBuffer; overload; safecall;
    property ConnectionHostName: IHostName read get_ConnectionHostName;
    property ConnectionServiceName: HSTRING read get_ConnectionServiceName;
    property MaxProtectionLevel: SocketProtectionLevel read get_MaxProtectionLevel;
    property ProtectionLevel: SocketProtectionLevel read get_ProtectionLevel;
    property ServiceId: Rfcomm_IRfcommServiceId read get_ServiceId;
  end;

  // DualAPI Interface
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  // External 
  Rfcomm_IRfcommServiceId = interface(IInspectable)
  ['{22629204-7E02-4017-8136-DA1B6A1B9BBF}']
    function get_Uuid: TGuid; safecall;
    function AsShortId: Cardinal; safecall;
    function AsString: HSTRING; safecall;
    property Uuid: TGuid read get_Uuid;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>>
  IAsyncOperation_1__IMapView_2__Cardinal__IBuffer_Base = interface(IInspectable)
  ['{D4904DED-BC1D-5933-AECF-E42C5D465BFF}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>>
  // External 
  IAsyncOperation_1__IMapView_2__Cardinal__IBuffer = interface(IAsyncOperation_1__IMapView_2__Cardinal__IBuffer_Base)
  ['{D4904DED-BC1D-5933-AECF-E42C5D465BFF}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer; safecall;
    function GetResults: IMapView_2__Cardinal__IBuffer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>>
  AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer_Delegate_Base = interface(IUnknown)
  ['{92C2E4D0-7C25-596B-9135-10D1472E6968}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>>
  // External 
  AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer = interface(AsyncOperationCompletedHandler_1__IMapView_2__Cardinal__IBuffer_Delegate_Base)
  ['{92C2E4D0-7C25-596B-9135-10D1472E6968}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMapView_2__Cardinal__IBuffer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>
  IMapView_2__Cardinal__IBuffer_Base = interface(IInspectable)
  ['{57DC41E6-8B4D-5910-9703-D7C668436852}']
  end;
  // Windows.Foundation.Collections.IMapView`2<UInt32,Windows.Storage.Streams.IBuffer>
  // External 
  IMapView_2__Cardinal__IBuffer = interface(IMapView_2__Cardinal__IBuffer_Base)
  ['{57DC41E6-8B4D-5910-9703-D7C668436852}']
    function Lookup(key: Cardinal): IBuffer; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: Cardinal): Boolean; safecall;
    procedure Split(out first: IMapView_2__Cardinal__IBuffer; out second: IMapView_2__Cardinal__IBuffer); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Object>
  TypedEventHandler_2__IDeviceWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{9234630F-1FF4-54F6-9E3F-AC20369B7725}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Object>
  // External 
  TypedEventHandler_2__IDeviceWatcher__IInspectable = interface(TypedEventHandler_2__IDeviceWatcher__IInspectable_Delegate_Base)
  ['{2E39B58C-3F86-5F12-B142-FABFA589D8FF}']
    procedure Invoke(sender: IDeviceWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDeviceWatcher
  // External 
  IDeviceWatcher = interface(IInspectable)
  ['{C9EAB97D-8F6B-4F96-A9F4-ABC814E22271}']
    function add_Added(handler: TypedEventHandler_2__IDeviceWatcher__IDeviceInformation): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Updated(handler: TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate): EventRegistrationToken; safecall;
    procedure remove_Updated(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__IDeviceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__IDeviceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function get_Status: DeviceWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: DeviceWatcherStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Windows.Devices.Enumeration.IDeviceInformation>
  TypedEventHandler_2__IDeviceWatcher__IDeviceInformation_Delegate_Base = interface(IUnknown)
  ['{03C5A07B-990C-5D09-B0B8-5734EAA38222}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Windows.Devices.Enumeration.IDeviceInformation>
  // External 
  TypedEventHandler_2__IDeviceWatcher__IDeviceInformation = interface(TypedEventHandler_2__IDeviceWatcher__IDeviceInformation_Delegate_Base)
  ['{45B8F772-CDC9-5498-8951-1E65FB72796C}']
    procedure Invoke(sender: IDeviceWatcher; args: IDeviceInformation); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDeviceInformation
  // External 
  IDeviceInformation = interface(IInspectable)
  ['{ABA0FB95-4398-489D-8E44-E6130927011F}']
    function get_Id: HSTRING; safecall;
    function get_Name: HSTRING; safecall;
    function get_IsEnabled: Boolean; safecall;
    function get_IsDefault: Boolean; safecall;
    function get_EnclosureLocation: IEnclosureLocation; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    procedure Update(updateInfo: IDeviceInformationUpdate); safecall;
    function GetThumbnailAsync: IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall;
    function GetGlyphThumbnailAsync: IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall;
    property EnclosureLocation: IEnclosureLocation read get_EnclosureLocation;
    property Id: HSTRING read get_Id;
    property IsDefault: Boolean read get_IsDefault;
    property IsEnabled: Boolean read get_IsEnabled;
    property Name: HSTRING read get_Name;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IEnclosureLocation
  // External 
  IEnclosureLocation = interface(IInspectable)
  ['{42340A27-5810-459C-AABB-C65E1F813ECF}']
    function get_InDock: Boolean; safecall;
    function get_InLid: Boolean; safecall;
    function get_Panel: Panel; safecall;
    property InDock: Boolean read get_InDock;
    property InLid: Boolean read get_InLid;
    [HPPGEN('//TODO: C++ Property')]
    property Panel: Panel read get_Panel;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Object>
  IMapView_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{BB78502A-F79D-54FA-92C9-90C5039FDF7E}']
  end;
  // Windows.Foundation.Collections.IMapView`2<String,Object>
  // External 
  IMapView_2__HSTRING__IInspectable = interface(IMapView_2__HSTRING__IInspectable_Base)
  ['{BB78502A-F79D-54FA-92C9-90C5039FDF7E}']
    function Lookup(key: HSTRING): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IInspectable; out second: IMapView_2__HSTRING__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDeviceInformationUpdate
  // External 
  IDeviceInformationUpdate = interface(IInspectable)
  ['{8F315305-D972-44B7-A37E-9E822C78213B}']
    function get_Id: HSTRING; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property Id: HSTRING read get_Id;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Windows.Devices.Enumeration.IDeviceInformationUpdate>
  TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate_Delegate_Base = interface(IUnknown)
  ['{906F1254-79AD-54FC-93C4-CDB99B437899}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDeviceWatcher,Windows.Devices.Enumeration.IDeviceInformationUpdate>
  // External 
  TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate = interface(TypedEventHandler_2__IDeviceWatcher__IDeviceInformationUpdate_Delegate_Base)
  ['{E974B937-20D2-5428-86F4-7464244D7744}']
    procedure Invoke(sender: IDeviceWatcher; args: IDeviceInformationUpdate); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Object>
  TypedEventHandler_2__IDevicePicker__IInspectable_Delegate_Base = interface(IUnknown)
  ['{62C6D98C-57EE-5BB8-A41C-958D20C3F3E8}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Object>
  // External 
  TypedEventHandler_2__IDevicePicker__IInspectable = interface(TypedEventHandler_2__IDevicePicker__IInspectable_Delegate_Base)
  ['{461CF512-3561-51C5-9C98-2972FF59D0B7}']
    procedure Invoke(sender: IDevicePicker; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDevicePicker
  // External 
  IDevicePicker = interface(IInspectable)
  ['{84997AA2-034A-4440-8813-7D0BD479BF5A}']
    function get_Filter: IDevicePickerFilter; safecall;
    function get_Appearance: IDevicePickerAppearance; safecall;
    function get_RequestedProperties: IVector_1__HSTRING; safecall;
    function add_DeviceSelected(handler: TypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DeviceSelected(token: EventRegistrationToken); safecall;
    function add_DisconnectButtonClicked(handler: TypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DisconnectButtonClicked(token: EventRegistrationToken); safecall;
    function add_DevicePickerDismissed(handler: TypedEventHandler_2__IDevicePicker__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DevicePickerDismissed(token: EventRegistrationToken); safecall;
    procedure Show(selection: TRectF); overload; safecall;
    procedure Show(selection: TRectF; placement: Popups_Placement); overload; safecall;
    function PickSingleDeviceAsync(selection: TRectF): IAsyncOperation_1__IDeviceInformation; overload; safecall;
    function PickSingleDeviceAsync(selection: TRectF; placement: Popups_Placement): IAsyncOperation_1__IDeviceInformation; overload; safecall;
    procedure Hide; safecall;
    procedure SetDisplayStatus(device: IDeviceInformation; status: HSTRING; options: DevicePickerDisplayStatusOptions); safecall;
    property Appearance: IDevicePickerAppearance read get_Appearance;
    property Filter: IDevicePickerFilter read get_Filter;
    property RequestedProperties: IVector_1__HSTRING read get_RequestedProperties;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDevicePickerFilter
  // External 
  IDevicePickerFilter = interface(IInspectable)
  ['{91DB92A2-57CB-48F1-9B59-A59B7A1F02A2}']
    function get_SupportedDeviceClasses: IVector_1__DeviceClass; safecall;
    function get_SupportedDeviceSelectors: IVector_1__HSTRING; safecall;
    property SupportedDeviceClasses: IVector_1__DeviceClass read get_SupportedDeviceClasses;
    property SupportedDeviceSelectors: IVector_1__HSTRING read get_SupportedDeviceSelectors;
  end;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Enumeration.DeviceClass>
  // External 
  IVector_1__DeviceClass = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): DeviceClass; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__DeviceClass; safecall;
    function IndexOf(value: DeviceClass; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: DeviceClass); safecall;
    procedure InsertAt(index: Cardinal; value: DeviceClass); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: DeviceClass); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDeviceClass): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDeviceClass); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Enumeration.DeviceClass>
  // External 
  IVectorView_1__DeviceClass = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): DeviceClass; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: DeviceClass; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDeviceClass): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDevicePickerAppearance
  // External 
  IDevicePickerAppearance = interface(IInspectable)
  ['{E69A12C6-E627-4ED8-9B6C-460AF445E56D}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_ForegroundColor: Color; safecall;
    procedure put_ForegroundColor(value: Color); safecall;
    function get_BackgroundColor: Color; safecall;
    procedure put_BackgroundColor(value: Color); safecall;
    function get_AccentColor: Color; safecall;
    procedure put_AccentColor(value: Color); safecall;
    function get_SelectedForegroundColor: Color; safecall;
    procedure put_SelectedForegroundColor(value: Color); safecall;
    function get_SelectedBackgroundColor: Color; safecall;
    procedure put_SelectedBackgroundColor(value: Color); safecall;
    function get_SelectedAccentColor: Color; safecall;
    procedure put_SelectedAccentColor(value: Color); safecall;
    property AccentColor: Color read get_AccentColor write put_AccentColor;
    property BackgroundColor: Color read get_BackgroundColor write put_BackgroundColor;
    property ForegroundColor: Color read get_ForegroundColor write put_ForegroundColor;
    property SelectedAccentColor: Color read get_SelectedAccentColor write put_SelectedAccentColor;
    property SelectedBackgroundColor: Color read get_SelectedBackgroundColor write put_SelectedBackgroundColor;
    property SelectedForegroundColor: Color read get_SelectedForegroundColor write put_SelectedForegroundColor;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Windows.Devices.Enumeration.IDeviceSelectedEventArgs>
  TypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{47E48C88-1C56-5B58-96A2-8E813D25077A}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Windows.Devices.Enumeration.IDeviceSelectedEventArgs>
  // External 
  TypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs = interface(TypedEventHandler_2__IDevicePicker__IDeviceSelectedEventArgs_Delegate_Base)
  ['{1E62D931-39AF-5E34-93A0-8500F98C53C8}']
    procedure Invoke(sender: IDevicePicker; args: IDeviceSelectedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDeviceSelectedEventArgs
  // External 
  IDeviceSelectedEventArgs = interface(IInspectable)
  ['{269EDADE-1D2F-4940-8402-4156B81D3C77}']
    function get_SelectedDevice: IDeviceInformation; safecall;
    property SelectedDevice: IDeviceInformation read get_SelectedDevice;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs>
  TypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs_Delegate_Base = interface(IUnknown)
  ['{35DD0319-5723-506C-8896-1A28B82BE798}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.IDevicePicker,Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs>
  // External 
  TypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs = interface(TypedEventHandler_2__IDevicePicker__IDeviceDisconnectButtonClickedEventArgs_Delegate_Base)
  ['{9B11002B-6A57-54AD-91FB-2B572A19150C}']
    procedure Invoke(sender: IDevicePicker; args: IDeviceDisconnectButtonClickedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.IDeviceDisconnectButtonClickedEventArgs
  // External 
  IDeviceDisconnectButtonClickedEventArgs = interface(IInspectable)
  ['{8E44B56D-F902-4A00-B536-F37992E6A2A7}']
    function get_Device: IDeviceInformation; safecall;
    property Device: IDeviceInformation read get_Device;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.IDeviceInformation>
  IAsyncOperation_1__IDeviceInformation_Base = interface(IInspectable)
  ['{07FAA053-EB2F-5CBA-B25B-D9D57BE6715F}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.IDeviceInformation>
  // External 
  IAsyncOperation_1__IDeviceInformation = interface(IAsyncOperation_1__IDeviceInformation_Base)
  ['{F6CE39E7-E062-5F4E-9663-1883AB9707DA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IDeviceInformation); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IDeviceInformation; safecall;
    function GetResults: IDeviceInformation; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IDeviceInformation read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Enumeration.IDeviceInformation>
  AsyncOperationCompletedHandler_1__IDeviceInformation_Delegate_Base = interface(IUnknown)
  ['{BB483DF2-7BB6-5923-A28D-8342EC30046B}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Enumeration.IDeviceInformation>
  // External 
  AsyncOperationCompletedHandler_1__IDeviceInformation = interface(AsyncOperationCompletedHandler_1__IDeviceInformation_Delegate_Base)
  ['{33A901B6-95BD-5152-B320-56644152046D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IDeviceInformation; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Object>
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{2EE2B4C9-B696-5ECC-B29B-F1E0EF5FE1F7}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Object>
  // External 
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable = interface(TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable_Delegate_Base)
  ['{B3E4D6DF-3B83-5CEA-895C-5B2CA60321AC}']
    procedure Invoke(sender: Pnp_IPnpObjectWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher
  // External 
  Pnp_IPnpObjectWatcher = interface(IInspectable)
  ['{83C95CA8-4772-4A7A-ACA8-E48C42A89C44}']
    function add_Added(handler: TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Updated(handler: TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate): EventRegistrationToken; safecall;
    procedure remove_Updated(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__Pnp_IPnpObjectWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function get_Status: DeviceWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: DeviceWatcherStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Windows.Devices.Enumeration.Pnp.IPnpObject>
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject_Delegate_Base = interface(IUnknown)
  ['{D578EED2-58E5-5825-8AF2-12F89387B656}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Windows.Devices.Enumeration.Pnp.IPnpObject>
  // External 
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject = interface(TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObject_Delegate_Base)
  ['{22A619AD-2356-5234-B2AC-0D26B29D6915}']
    procedure Invoke(sender: Pnp_IPnpObjectWatcher; args: Pnp_IPnpObject); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.Pnp.IPnpObject
  // External 
  Pnp_IPnpObject = interface(IInspectable)
  ['{95C66258-733B-4A8F-93A3-DB078AC870C1}']
    function get_Type: Pnp_PnpObjectType; safecall;
    function get_Id: HSTRING; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    procedure Update(updateInfo: Pnp_IPnpObjectUpdate); safecall;
    property Id: HSTRING read get_Id;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property &Type: Pnp_PnpObjectType read get_Type;
  end;

  // DualAPI Interface
  // Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate
  // External 
  Pnp_IPnpObjectUpdate = interface(IInspectable)
  ['{6F59E812-001E-4844-BCC6-432886856A17}']
    function get_Type: Pnp_PnpObjectType; safecall;
    function get_Id: HSTRING; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property Id: HSTRING read get_Id;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property &Type: Pnp_PnpObjectType read get_Type;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate>
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate_Delegate_Base = interface(IUnknown)
  ['{AF8F929D-8058-5C38-A3D8-30AA7A08B588}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Enumeration.Pnp.IPnpObjectWatcher,Windows.Devices.Enumeration.Pnp.IPnpObjectUpdate>
  // External 
  TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate = interface(TypedEventHandler_2__Pnp_IPnpObjectWatcher__Pnp_IPnpObjectUpdate_Delegate_Base)
  ['{6ED742E7-1453-5E28-97C5-73FD081CAEF3}']
    procedure Invoke(sender: Pnp_IPnpObjectWatcher; args: Pnp_IPnpObjectUpdate); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  // External 
  IVectorView_1__Cardinal = interface(IInspectable)
  ['{E5CE1A07-8D33-5007-BA64-7D2508CCF85C}']
    function GetAt(index: Cardinal): Cardinal; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Cardinal; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.ICashDrawerCloseAlarm,Object>
  TypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C54FBDA4-5E0B-54C3-94F2-83351E41C46F}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.ICashDrawerCloseAlarm,Object>
  // External 
  TypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable = interface(TypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable_Delegate_Base)
  ['{5D7EA46E-5DE1-5491-98E1-E554C6EDE1EC}']
    procedure Invoke(sender: ICashDrawerCloseAlarm; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.PointOfService.ICashDrawerCloseAlarm
  // External 
  ICashDrawerCloseAlarm = interface(IInspectable)
  ['{6BF88CC7-6F63-430E-AB3B-95D75FFBE87F}']
    procedure put_AlarmTimeout(value: TimeSpan); safecall;
    function get_AlarmTimeout: TimeSpan; safecall;
    procedure put_BeepFrequency(value: Cardinal); safecall;
    function get_BeepFrequency: Cardinal; safecall;
    procedure put_BeepDuration(value: TimeSpan); safecall;
    function get_BeepDuration: TimeSpan; safecall;
    procedure put_BeepDelay(value: TimeSpan); safecall;
    function get_BeepDelay: TimeSpan; safecall;
    function add_AlarmTimeoutExpired(handler: TypedEventHandler_2__ICashDrawerCloseAlarm__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AlarmTimeoutExpired(token: EventRegistrationToken); safecall;
    function StartAsync: IAsyncOperation_1__Boolean; safecall;
    property AlarmTimeout: TimeSpan read get_AlarmTimeout write put_AlarmTimeout;
    property BeepDelay: TimeSpan read get_BeepDelay write put_BeepDelay;
    property BeepDuration: TimeSpan read get_BeepDuration write put_BeepDuration;
    property BeepFrequency: Cardinal read get_BeepFrequency write put_BeepFrequency;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.IClaimedLineDisplay,Object>
  TypedEventHandler_2__IClaimedLineDisplay__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C997782B-46E9-5D92-AC84-EE9D7D073AB5}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.IClaimedLineDisplay,Object>
  // External 
  TypedEventHandler_2__IClaimedLineDisplay__IInspectable = interface(TypedEventHandler_2__IClaimedLineDisplay__IInspectable_Delegate_Base)
  ['{218B3209-AFA0-5469-841D-5F4F6C95C9D4}']
    procedure Invoke(sender: IClaimedLineDisplay; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.PointOfService.IClaimedLineDisplay
  // External 
  IClaimedLineDisplay = interface(IInspectable)
  ['{120AC970-9A75-4ACF-AAE7-09972BCF8794}']
    function get_DeviceId: HSTRING; safecall;
    function get_Capabilities: ILineDisplayCapabilities; safecall;
    function get_PhysicalDeviceName: HSTRING; safecall;
    function get_PhysicalDeviceDescription: HSTRING; safecall;
    function get_DeviceControlDescription: HSTRING; safecall;
    function get_DeviceControlVersion: HSTRING; safecall;
    function get_DeviceServiceVersion: HSTRING; safecall;
    function get_DefaultWindow: ILineDisplayWindow; safecall;
    procedure RetainDevice; safecall;
    function add_ReleaseDeviceRequested(handler: TypedEventHandler_2__IClaimedLineDisplay__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ReleaseDeviceRequested(token: EventRegistrationToken); safecall;
    property Capabilities: ILineDisplayCapabilities read get_Capabilities;
    property DefaultWindow: ILineDisplayWindow read get_DefaultWindow;
    property DeviceControlDescription: HSTRING read get_DeviceControlDescription;
    property DeviceControlVersion: HSTRING read get_DeviceControlVersion;
    property DeviceId: HSTRING read get_DeviceId;
    property DeviceServiceVersion: HSTRING read get_DeviceServiceVersion;
    property PhysicalDeviceDescription: HSTRING read get_PhysicalDeviceDescription;
    property PhysicalDeviceName: HSTRING read get_PhysicalDeviceName;
  end;

  // DualAPI Interface
  // Windows.Devices.PointOfService.ILineDisplayCapabilities
  // External 
  ILineDisplayCapabilities = interface(IInspectable)
  ['{5A15B5D1-8DC5-4B9C-9172-303E47B70C55}']
    function get_IsStatisticsReportingSupported: Boolean; safecall;
    function get_IsStatisticsUpdatingSupported: Boolean; safecall;
    function get_PowerReportingType: UnifiedPosPowerReportingType; safecall;
    function get_CanChangeScreenSize: Boolean; safecall;
    function get_CanDisplayBitmaps: Boolean; safecall;
    function get_CanReadCharacterAtCursor: Boolean; safecall;
    function get_CanMapCharacterSets: Boolean; safecall;
    function get_CanDisplayCustomGlyphs: Boolean; safecall;
    function get_CanReverse: LineDisplayTextAttributeGranularity; safecall;
    function get_CanBlink: LineDisplayTextAttributeGranularity; safecall;
    function get_CanChangeBlinkRate: Boolean; safecall;
    function get_IsBrightnessSupported: Boolean; safecall;
    function get_IsCursorSupported: Boolean; safecall;
    function get_IsHorizontalMarqueeSupported: Boolean; safecall;
    function get_IsVerticalMarqueeSupported: Boolean; safecall;
    function get_IsInterCharacterWaitSupported: Boolean; safecall;
    function get_SupportedDescriptors: Cardinal; safecall;
    function get_SupportedWindows: Cardinal; safecall;
    property CanBlink: LineDisplayTextAttributeGranularity read get_CanBlink;
    property CanChangeBlinkRate: Boolean read get_CanChangeBlinkRate;
    property CanChangeScreenSize: Boolean read get_CanChangeScreenSize;
    property CanDisplayBitmaps: Boolean read get_CanDisplayBitmaps;
    property CanDisplayCustomGlyphs: Boolean read get_CanDisplayCustomGlyphs;
    property CanMapCharacterSets: Boolean read get_CanMapCharacterSets;
    property CanReadCharacterAtCursor: Boolean read get_CanReadCharacterAtCursor;
    property CanReverse: LineDisplayTextAttributeGranularity read get_CanReverse;
    property IsBrightnessSupported: Boolean read get_IsBrightnessSupported;
    property IsCursorSupported: Boolean read get_IsCursorSupported;
    property IsHorizontalMarqueeSupported: Boolean read get_IsHorizontalMarqueeSupported;
    property IsInterCharacterWaitSupported: Boolean read get_IsInterCharacterWaitSupported;
    property IsStatisticsReportingSupported: Boolean read get_IsStatisticsReportingSupported;
    property IsStatisticsUpdatingSupported: Boolean read get_IsStatisticsUpdatingSupported;
    property IsVerticalMarqueeSupported: Boolean read get_IsVerticalMarqueeSupported;
    property PowerReportingType: UnifiedPosPowerReportingType read get_PowerReportingType;
    property SupportedDescriptors: Cardinal read get_SupportedDescriptors;
    property SupportedWindows: Cardinal read get_SupportedWindows;
  end;

  // DualAPI Interface
  // Windows.Devices.PointOfService.ILineDisplayWindow
  // External 
  ILineDisplayWindow = interface(IInspectable)
  ['{D21FEEF4-2364-4BE5-BEE1-851680AF4964}']
    function get_SizeInCharacters: TSizeF; safecall;
    function get_InterCharacterWaitInterval: TimeSpan; safecall;
    procedure put_InterCharacterWaitInterval(value: TimeSpan); safecall;
    function TryRefreshAsync: IAsyncOperation_1__Boolean; safecall;
    function TryDisplayTextAsync(text: HSTRING; displayAttribute: LineDisplayTextAttribute): IAsyncOperation_1__Boolean; overload; safecall;
    function TryDisplayTextAsync(text: HSTRING; displayAttribute: LineDisplayTextAttribute; startPosition: TPointF): IAsyncOperation_1__Boolean; overload; safecall;
    function TryDisplayTextAsync(text: HSTRING): IAsyncOperation_1__Boolean; overload; safecall;
    function TryScrollTextAsync(direction: LineDisplayScrollDirection; numberOfColumnsOrRows: Cardinal): IAsyncOperation_1__Boolean; safecall;
    function TryClearTextAsync: IAsyncOperation_1__Boolean; safecall;
    property InterCharacterWaitInterval: TimeSpan read get_InterCharacterWaitInterval write put_InterCharacterWaitInterval;
    property SizeInCharacters: TSizeF read get_SizeInCharacters;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.IClaimedCashDrawer,Object>
  TypedEventHandler_2__IClaimedCashDrawer__IInspectable_Delegate_Base = interface(IUnknown)
  ['{DB886581-2462-5C81-880C-06112CA70012}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.PointOfService.IClaimedCashDrawer,Object>
  // External 
  TypedEventHandler_2__IClaimedCashDrawer__IInspectable = interface(TypedEventHandler_2__IClaimedCashDrawer__IInspectable_Delegate_Base)
  ['{A39ABF81-03ED-5140-831E-33396C6B2E7C}']
    procedure Invoke(sender: IClaimedCashDrawer; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.PointOfService.IClaimedCashDrawer
  // External 
  IClaimedCashDrawer = interface(IInspectable)
  ['{CA3F99AF-ABB8-42C1-8A84-5C66512F5A75}']
    function get_DeviceId: HSTRING; safecall;
    function get_IsEnabled: Boolean; safecall;
    function get_IsDrawerOpen: Boolean; safecall;
    function get_CloseAlarm: ICashDrawerCloseAlarm; safecall;
    function OpenDrawerAsync: IAsyncOperation_1__Boolean; safecall;
    function EnableAsync: IAsyncOperation_1__Boolean; safecall;
    function DisableAsync: IAsyncOperation_1__Boolean; safecall;
    function RetainDeviceAsync: IAsyncOperation_1__Boolean; safecall;
    function ResetStatisticsAsync(statisticsCategories: IIterable_1__HSTRING): IAsyncOperation_1__Boolean; safecall;
    function UpdateStatisticsAsync(statistics: IIterable_1__IKeyValuePair_2__HSTRING__HSTRING): IAsyncOperation_1__Boolean; safecall;
    function add_ReleaseDeviceRequested(handler: TypedEventHandler_2__IClaimedCashDrawer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ReleaseDeviceRequested(token: EventRegistrationToken); safecall;
    property CloseAlarm: ICashDrawerCloseAlarm read get_CloseAlarm;
    property DeviceId: HSTRING read get_DeviceId;
    property IsDrawerOpen: Boolean read get_IsDrawerOpen;
    property IsEnabled: Boolean read get_IsEnabled;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING_Base = interface(IInspectable)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  // External 
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IIterable_1__IKeyValuePair_2__HSTRING__HSTRING_Base)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__HSTRING; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal_Base = interface(IInspectable)
  ['{6E6E228A-F618-5D33-8523-02D16672665B}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  // External 
  IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal = interface(IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal_Base)
  ['{F6E8107E-475B-577F-8806-8B6B046E5833}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal; safecall;
    function GetResults: IImageScannerScanResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal_Delegate_Base = interface(IUnknown)
  ['{D1662BAA-4F20-5D18-97F1-A01A6D0DD980}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  // External 
  AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal = interface(AsyncOperationProgressHandler_2__IImageScannerScanResult__Cardinal_Delegate_Base)
  ['{55F1599D-3490-5BF9-95C5-320EF1652B30}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal_Delegate_Base = interface(IUnknown)
  ['{BD8BDBD8-459A-52DC-B101-75B398A61AEF}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Devices.Scanners.IImageScannerScanResult,UInt32>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__IImageScannerScanResult__Cardinal_Delegate_Base)
  ['{0089CC7A-21E3-5AED-B565-F2FB72A84119}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IImageScannerScanResult__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Scanners.IImageScannerScanResult
  // External 
  IImageScannerScanResult = interface(IInspectable)
  ['{C91624CD-9037-4E48-84C1-AC0975076BC5}']
    function get_ScannedFiles: IVectorView_1__IStorageFile; safecall;
    property ScannedFiles: IVectorView_1__IStorageFile read get_ScannedFiles;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsDevice2,Object>
  TypedEventHandler_2__ISmsDevice2__IInspectable_Delegate_Base = interface(IUnknown)
  ['{3F3808E6-3DEE-57A6-A88D-BACFB066C7FB}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sms.ISmsDevice2,Object>
  // External 
  TypedEventHandler_2__ISmsDevice2__IInspectable = interface(TypedEventHandler_2__ISmsDevice2__IInspectable_Delegate_Base)
  ['{1FBD11F1-2F5F-569E-8544-6BE9B6E92197}']
    procedure Invoke(sender: ISmsDevice2; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Sms.ISmsDevice2
  // External 
  ISmsDevice2 = interface(IInspectable)
  ['{BD8A5C13-E522-46CB-B8D5-9EAD30FB6C47}']
    function get_SmscAddress: HSTRING; safecall;
    procedure put_SmscAddress(value: HSTRING); safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_ParentDeviceId: HSTRING; safecall;
    function get_AccountPhoneNumber: HSTRING; safecall;
    function get_CellularClass: CellularClass; safecall;
    function get_DeviceStatus: SmsDeviceStatus; safecall;
    function CalculateLength(message: ISmsMessageBase): SmsEncodedLength; safecall;
    function SendMessageAndGetResultAsync(message: ISmsMessageBase): IAsyncOperation_1__ISmsSendMessageResult; safecall;
    function add_DeviceStatusChanged(eventHandler: TypedEventHandler_2__ISmsDevice2__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DeviceStatusChanged(eventCookie: EventRegistrationToken); safecall;
    property AccountPhoneNumber: HSTRING read get_AccountPhoneNumber;
    [HPPGEN('//TODO: C++ Property')]
    property CellularClass: CellularClass read get_CellularClass;
    property DeviceId: HSTRING read get_DeviceId;
    property DeviceStatus: SmsDeviceStatus read get_DeviceStatus;
    property ParentDeviceId: HSTRING read get_ParentDeviceId;
    property SmscAddress: HSTRING read get_SmscAddress write put_SmscAddress;
  end;

  // DualAPI Interface
  // Windows.Devices.Sms.ISmsMessageBase
  // External 
  ISmsMessageBase = interface(IInspectable)
  ['{2CF0FE30-FE50-4FC6-AA88-4CCFE27A29EA}']
    function get_MessageType: SmsMessageType; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_CellularClass: CellularClass; safecall;
    function get_MessageClass: SmsMessageClass; safecall;
    function get_SimIccId: HSTRING; safecall;
    [HPPGEN('//TODO: C++ Property')]
    property CellularClass: CellularClass read get_CellularClass;
    property DeviceId: HSTRING read get_DeviceId;
    property MessageClass: SmsMessageClass read get_MessageClass;
    property MessageType: SmsMessageType read get_MessageType;
    property SimIccId: HSTRING read get_SimIccId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsSendMessageResult>
  IAsyncOperation_1__ISmsSendMessageResult_Base = interface(IInspectable)
  ['{FC0A0B0F-4DCC-5257-BC61-3435E302CE1F}']
  end;
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sms.ISmsSendMessageResult>
  // External 
  IAsyncOperation_1__ISmsSendMessageResult = interface(IAsyncOperation_1__ISmsSendMessageResult_Base)
  ['{C64F411D-53A8-580B-B467-4722D857F737}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ISmsSendMessageResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ISmsSendMessageResult; safecall;
    function GetResults: ISmsSendMessageResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ISmsSendMessageResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsSendMessageResult>
  AsyncOperationCompletedHandler_1__ISmsSendMessageResult_Delegate_Base = interface(IUnknown)
  ['{C7D5C6FE-9206-5EB1-ABC1-C1BC21804EEB}']
  end;
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sms.ISmsSendMessageResult>
  // External 
  AsyncOperationCompletedHandler_1__ISmsSendMessageResult = interface(AsyncOperationCompletedHandler_1__ISmsSendMessageResult_Delegate_Base)
  ['{3263560A-CB14-50E2-9FFA-6A6FC1405030}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ISmsSendMessageResult; asyncStatus: AsyncStatus); safecall;
  end;

  // DualAPI Interface
  // Windows.Devices.Sms.ISmsSendMessageResult
  // External 
  ISmsSendMessageResult = interface(IInspectable)
  ['{DB139AF2-78C9-4FEB-9622-452328088D62}']
    function get_IsSuccessful: Boolean; safecall;
    function get_MessageReferenceNumbers: IVectorView_1__Integer; safecall;
    function get_CellularClass: CellularClass; safecall;
    function get_ModemErrorCode: SmsModemErrorCode; safecall;
    function get_IsErrorTransient: Boolean; safecall;
    function get_NetworkCauseCode: Integer; safecall;
    function get_TransportFailureCause: Integer; safecall;
    [HPPGEN('//TODO: C++ Property')]
    property CellularClass: CellularClass read get_CellularClass;
    property IsErrorTransient: Boolean read get_IsErrorTransient;
    property IsSuccessful: Boolean read get_IsSuccessful;
    property MessageReferenceNumbers: IVectorView_1__Integer read get_MessageReferenceNumbers;
    property ModemErrorCode: SmsModemErrorCode read get_ModemErrorCode;
    property NetworkCauseCode: Integer read get_NetworkCauseCode;
    property TransportFailureCause: Integer read get_TransportFailureCause;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Int32>
  // External 
  IVectorView_1__Integer = interface(IInspectable)
  ['{8D720CDF-3934-5D3F-9A55-40E8063B086A}']
    function GetAt(index: Cardinal): Integer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Integer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInteger): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer_Base = interface(IInspectable)
  ['{12F85589-415D-5B5D-B0D0-FDA3B0295ADC}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  // External 
  IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer = interface(IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer_Base)
  ['{12F85589-415D-5B5D-B0D0-FDA3B0295ADC}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer; safecall;
    function GetResults: IVectorView_1__ISmsMessage; safecall;
    property Progress: AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer_Delegate_Base = interface(IUnknown)
  ['{3F9D1255-EBF8-569F-91C3-49740D5944CE}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  // External 
  AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer = interface(AsyncOperationProgressHandler_2__IVectorView_1__ISmsMessage__Integer_Delegate_Base)
  ['{3F9D1255-EBF8-569F-91C3-49740D5944CE}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer; progressInfo: Integer); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer_Delegate_Base = interface(IUnknown)
  ['{C0454CFC-2F2F-5E0C-8DE9-58B9E82A03BA}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>,Int32>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer = interface(AsyncOperationWithProgressCompletedHandler_2__IVectorView_1__ISmsMessage__Integer_Delegate_Base)
  ['{C0454CFC-2F2F-5E0C-8DE9-58B9E82A03BA}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IVectorView_1__ISmsMessage__Integer; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sms.ISmsMessage>
  // External 
  IVectorView_1__ISmsMessage = interface(IInspectable)
  ['{D3ACC5B1-6F85-507E-B40A-6950749B426F}']
    function GetAt(index: Cardinal): ISmsMessage; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ISmsMessage; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PISmsMessage): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Devices.Sms.ISmsMessage
  // External 
  ISmsMessage = interface(IInspectable)
  ['{ED3C5E28-6984-4B07-811D-8D5906ED3CEA}']
    function get_Id: Cardinal; safecall;
    function get_MessageClass: SmsMessageClass; safecall;
    property Id: Cardinal read get_Id;
    property MessageClass: SmsMessageClass read get_MessageClass;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Gaming.Input.IGameController,Windows.System.IUserChangedEventArgs>
  TypedEventHandler_2__Input_IGameController__IUserChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{CB753F2C-2F36-5A8F-ADAD-057BEAE73AA4}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Gaming.Input.IGameController,Windows.System.IUserChangedEventArgs>
  // External 
  TypedEventHandler_2__Input_IGameController__IUserChangedEventArgs = interface(TypedEventHandler_2__Input_IGameController__IUserChangedEventArgs_Delegate_Base)
  ['{705B706B-C815-51C1-AD7E-B93FEF3BE10C}']
    procedure Invoke(sender: Input_IGameController; args: IUserChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Gaming.Input.IGameController
  // External 
  Input_IGameController = interface(IInspectable)
  ['{1BAF6522-5F64-42C5-8267-B9FE2215BFBD}']
    function add_HeadsetConnected(value: TypedEventHandler_2__Input_IGameController__Input_IHeadset): EventRegistrationToken; safecall;
    procedure remove_HeadsetConnected(token: EventRegistrationToken); safecall;
    function add_HeadsetDisconnected(value: TypedEventHandler_2__Input_IGameController__Input_IHeadset): EventRegistrationToken; safecall;
    procedure remove_HeadsetDisconnected(token: EventRegistrationToken); safecall;
    function add_UserChanged(value: TypedEventHandler_2__Input_IGameController__IUserChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_UserChanged(token: EventRegistrationToken); safecall;
    function get_Headset: Input_IHeadset; safecall;
    function get_IsWireless: Boolean; safecall;
    function get_User: IUser; safecall;
    property Headset: Input_IHeadset read get_Headset;
    property IsWireless: Boolean read get_IsWireless;
    property User: IUser read get_User;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Gaming.Input.IGameController,Windows.Gaming.Input.IHeadset>
  TypedEventHandler_2__Input_IGameController__Input_IHeadset_Delegate_Base = interface(IUnknown)
  ['{07B2F2B7-8825-5C4E-A052-FCFEDF3AEEA1}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Gaming.Input.IGameController,Windows.Gaming.Input.IHeadset>
  // External 
  TypedEventHandler_2__Input_IGameController__Input_IHeadset = interface(TypedEventHandler_2__Input_IGameController__Input_IHeadset_Delegate_Base)
  ['{824670C2-00A1-537F-AD0A-E3086418DE81}']
    procedure Invoke(sender: Input_IGameController; args: Input_IHeadset); safecall;
  end;

  // DualAPI Interface
  // Windows.Gaming.Input.IHeadset
  // External 
  Input_IHeadset = interface(IInspectable)
  ['{3FD156EF-6925-3FA8-9181-029C5223AE3B}']
    function get_CaptureDeviceId: HSTRING; safecall;
    function get_RenderDeviceId: HSTRING; safecall;
    property CaptureDeviceId: HSTRING read get_CaptureDeviceId;
    property RenderDeviceId: HSTRING read get_RenderDeviceId;
  end;

  // DualAPI Interface
  // Windows.System.IUserChangedEventArgs
  // External 
  IUserChangedEventArgs = interface(IInspectable)
  ['{086459DC-18C6-48DB-BC99-724FB9203CCC}']
    function get_User: IUser; safecall;
    property User: IUser read get_User;
  end;

  // Generic Delegate for 
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
  end;
  // Windows.Foundation.EventHandler`1<Object>
  // External 
  EventHandler_1__IInspectable = interface(EventHandler_1__IInspectable_Delegate_Base)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  // Windows.Foundation.Collections.IVectorChangedEventArgs
  // External 
  IVectorChangedEventArgs = interface(IInspectable)
  ['{575933DF-34FE-4480-AF15-07691F3D5D9B}']
    function get_CollectionChange: CollectionChange; safecall;
    function get_Index: Cardinal; safecall;
    [HPPGEN('//TODO: C++ Property')]
    property CollectionChange: CollectionChange read get_CollectionChange;
    property Index: Cardinal read get_Index;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackItem,Windows.Foundation.Collections.IVectorChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{2DD51918-4525-5BE5-A6C1-409BC72863A6}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackItem,Windows.Foundation.Collections.IVectorChangedEventArgs>
  // External 
  TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs_Delegate_Base)
  ['{782906DD-5011-5A36-9331-14044DF71A56}']
    procedure Invoke(sender: Playback_IMediaPlaybackItem; args: IVectorChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Media.Playback.IMediaPlaybackItem
  // External 
  Playback_IMediaPlaybackItem = interface(IInspectable)
  ['{047097D2-E4AF-48AB-B283-6929E674ECE2}']
    function add_AudioTracksChanged(handler: TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AudioTracksChanged(token: EventRegistrationToken); safecall;
    function add_VideoTracksChanged(handler: TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_VideoTracksChanged(token: EventRegistrationToken); safecall;
    function add_TimedMetadataTracksChanged(handler: TypedEventHandler_2__Playback_IMediaPlaybackItem__IVectorChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TimedMetadataTracksChanged(token: EventRegistrationToken); safecall;
    function get_Source: Core_IMediaSource2; safecall;
    function get_AudioTracks: IVectorView_1__Core_IMediaTrack; safecall;
    function get_VideoTracks: IVectorView_1__Core_IMediaTrack; safecall;
    function get_TimedMetadataTracks: IVectorView_1__Core_ITimedMetadataTrack; safecall;
    property AudioTracks: IVectorView_1__Core_IMediaTrack read get_AudioTracks;
    property Source: Core_IMediaSource2 read get_Source;
    property TimedMetadataTracks: IVectorView_1__Core_ITimedMetadataTrack read get_TimedMetadataTracks;
    property VideoTracks: IVectorView_1__Core_IMediaTrack read get_VideoTracks;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IMediaSource2
  // External 
  Core_IMediaSource2 = interface(IInspectable)
  ['{2EB61048-655F-4C37-B813-B4E45DFA0ABE}']
    function add_OpenOperationCompleted(handler: TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceOpenOperationCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OpenOperationCompleted(token: EventRegistrationToken); safecall;
    function get_CustomProperties: IPropertySet; safecall;
    function get_Duration: IReference_1__TimeSpan; safecall;
    function get_IsOpen: Boolean; safecall;
    function get_ExternalTimedTextSources: IObservableVector_1__Core_ITimedTextSource; safecall;
    function get_ExternalTimedMetadataTracks: IObservableVector_1__Core_ITimedMetadataTrack; safecall;
    property CustomProperties: IPropertySet read get_CustomProperties;
    property Duration: IReference_1__TimeSpan read get_Duration;
    property ExternalTimedMetadataTracks: IObservableVector_1__Core_ITimedMetadataTrack read get_ExternalTimedMetadataTracks;
    property ExternalTimedTextSources: IObservableVector_1__Core_ITimedTextSource read get_ExternalTimedTextSources;
    property IsOpen: Boolean read get_IsOpen;
  end;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaSource2,Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs>
  // External 
  TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceOpenOperationCompletedEventArgs = interface(IUnknown)
  ['{2292B367-0CE9-58B0-978A-9149FFB031FB}']
    procedure Invoke(sender: Core_IMediaSource2; args: Core_IMediaSourceOpenOperationCompletedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs
  // External 
  Core_IMediaSourceOpenOperationCompletedEventArgs = interface(IInspectable)
  ['{FC682CEB-E281-477C-A8E0-1ACD654114C8}']
    function get_Error: Core_IMediaSourceError; safecall;
    property Error: Core_IMediaSourceError read get_Error;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IMediaSourceError
  // External 
  Core_IMediaSourceError = interface(IInspectable)
  ['{5C0A8965-37C5-4E9D-8D21-1CDEE90CECC6}']
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // External 
  IReference_1__TimeSpan = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: TimeSpan; safecall;
    property Value: TimeSpan read get_Value;
  end;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Core.ITimedTextSource>
  // External 
  IObservableVector_1__Core_ITimedTextSource = interface(IInspectable)
  ['{0C98C465-6D21-5D0F-9682-7337B29F0B91}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__Core_ITimedTextSource): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Core.ITimedTextSource>
  VectorChangedEventHandler_1__Core_ITimedTextSource_Delegate_Base = interface(IUnknown)
  ['{E12E6261-B198-56E0-9822-BA2D3BB6F8FE}']
  end;
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Core.ITimedTextSource>
  // External 
  VectorChangedEventHandler_1__Core_ITimedTextSource = interface(VectorChangedEventHandler_1__Core_ITimedTextSource_Delegate_Base)
  ['{3B4D630C-11EC-51AD-8B8C-CD2979D73A87}']
    procedure Invoke(sender: IObservableVector_1__Core_ITimedTextSource; event: IVectorChangedEventArgs); safecall;
  end;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Core.ITimedMetadataTrack>
  // External 
  IObservableVector_1__Core_ITimedMetadataTrack = interface(IInspectable)
  ['{19EAC50E-BEBF-58B6-B8B7-DB6B157EEAEC}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__Core_ITimedMetadataTrack): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Core.ITimedMetadataTrack>
  VectorChangedEventHandler_1__Core_ITimedMetadataTrack_Delegate_Base = interface(IUnknown)
  ['{BD1DC81C-23C4-5B4B-AC38-C5D34CDF34E4}']
  end;
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Core.ITimedMetadataTrack>
  // External 
  VectorChangedEventHandler_1__Core_ITimedMetadataTrack = interface(VectorChangedEventHandler_1__Core_ITimedMetadataTrack_Delegate_Base)
  ['{A2A777D5-776B-5806-A334-2193F4ECF158}']
    procedure Invoke(sender: IObservableVector_1__Core_ITimedMetadataTrack; event: IVectorChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMediaTrack>
  // External 
  IVectorView_1__Core_IMediaTrack = interface(IInspectable)
  ['{1CE05BEC-9E9B-5108-9D24-80E1C8C2866E}']
    function GetAt(index: Cardinal): Core_IMediaTrack; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_IMediaTrack; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IMediaTrack): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IMediaTrack
  // External 
  Core_IMediaTrack = interface(IInspectable)
  ['{03E1FAFC-C931-491A-B46B-C10EE8C256B7}']
    function get_Id: HSTRING; safecall;
    function get_Language: HSTRING; safecall;
    function get_TrackKind: Core_MediaTrackKind; safecall;
    procedure put_Label(value: HSTRING); safecall;
    function get_Label: HSTRING; safecall;
    property Id: HSTRING read get_Id;
    property &Label: HSTRING read get_Label write put_Label;
    property Language: HSTRING read get_Language;
    property TrackKind: Core_MediaTrackKind read get_TrackKind;
  end;

  // DualAPI Interface
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>
  // External 
  IVectorView_1__Core_ITimedMetadataTrack = interface(IInspectable)
  ['{DD588DAC-C2FE-523F-B519-6DDEAA5281A9}']
    function GetAt(index: Cardinal): Core_ITimedMetadataTrack; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_ITimedMetadataTrack; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedMetadataTrack): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.Media.Core.ITimedMetadataTrack
  // External 
  Core_ITimedMetadataTrack = interface(IInspectable)
  ['{9E6AED9E-F67A-49A9-B330-CF03B0E9CF07}']
    function add_CueEntered(handler: TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs): EventRegistrationToken; safecall;
    procedure remove_CueEntered(token: EventRegistrationToken); safecall;
    function add_CueExited(handler: TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs): EventRegistrationToken; safecall;
    procedure remove_CueExited(token: EventRegistrationToken); safecall;
    function add_TrackFailed(handler: TypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TrackFailed(token: EventRegistrationToken); safecall;
    function get_Cues: IVectorView_1__Core_IMediaCue; safecall;
    function get_ActiveCues: IVectorView_1__Core_IMediaCue; safecall;
    function get_TimedMetadataKind: Core_TimedMetadataKind; safecall;
    function get_DispatchType: HSTRING; safecall;
    procedure AddCue(cue: Core_IMediaCue); safecall;
    procedure RemoveCue(cue: Core_IMediaCue); safecall;
    property ActiveCues: IVectorView_1__Core_IMediaCue read get_ActiveCues;
    property Cues: IVectorView_1__Core_IMediaCue read get_Cues;
    property DispatchType: HSTRING read get_DispatchType;
    property TimedMetadataKind: Core_TimedMetadataKind read get_TimedMetadataKind;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedMetadataTrack,Windows.Media.Core.IMediaCueEventArgs>
  TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs_Delegate_Base = interface(IUnknown)
  ['{4AAC9411-C355-5C95-8C78-5A0F5CA1A54D}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedMetadataTrack,Windows.Media.Core.IMediaCueEventArgs>
  // External 
  TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs = interface(TypedEventHandler_2__Core_ITimedMetadataTrack__Core_IMediaCueEventArgs_Delegate_Base)
  ['{8994D194-4D58-5DD5-87F6-12576E1F75B5}']
    procedure Invoke(sender: Core_ITimedMetadataTrack; args: Core_IMediaCueEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IMediaCueEventArgs
  // External 
  Core_IMediaCueEventArgs = interface(IInspectable)
  ['{D12F47F7-5FA4-4E68-9FE5-32160DCEE57E}']
    function get_Cue: Core_IMediaCue; safecall;
    property Cue: Core_IMediaCue read get_Cue;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IMediaCue
  // External 
  Core_IMediaCue = interface(IInspectable)
  ['{C7D15E5D-59DC-431F-A0EE-27744323B36D}']
    procedure put_StartTime(value: TimeSpan); safecall;
    function get_StartTime: TimeSpan; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    function get_Duration: TimeSpan; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_Id: HSTRING; safecall;
    property Duration: TimeSpan read get_Duration write put_Duration;
    property Id: HSTRING read get_Id write put_Id;
    property StartTime: TimeSpan read get_StartTime write put_StartTime;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedMetadataTrack,Windows.Media.Core.ITimedMetadataTrackFailedEventArgs>
  TypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{8DC73162-255B-532E-B0C7-9A6D70B4BB9E}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedMetadataTrack,Windows.Media.Core.ITimedMetadataTrackFailedEventArgs>
  // External 
  TypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs = interface(TypedEventHandler_2__Core_ITimedMetadataTrack__Core_ITimedMetadataTrackFailedEventArgs_Delegate_Base)
  ['{93A88A48-6D62-56F5-AB42-286248198B55}']
    procedure Invoke(sender: Core_ITimedMetadataTrack; args: Core_ITimedMetadataTrackFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Media.Core.ITimedMetadataTrackFailedEventArgs
  // External 
  Core_ITimedMetadataTrackFailedEventArgs = interface(IInspectable)
  ['{A57FC9D1-6789-4D4D-B07F-84B4F31ACB70}']
    function get_Error: Core_ITimedMetadataTrackError; safecall;
    property Error: Core_ITimedMetadataTrackError read get_Error;
  end;

  // DualAPI Interface
  // Windows.Media.Core.ITimedMetadataTrackError
  // External 
  Core_ITimedMetadataTrackError = interface(IInspectable)
  ['{B3767915-4114-4819-B9D9-DD76089E72F8}']
    function get_ErrorCode: Core_TimedMetadataTrackErrorCode; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property ErrorCode: Core_TimedMetadataTrackErrorCode read get_ErrorCode;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMediaCue>
  // External 
  IVectorView_1__Core_IMediaCue = interface(IInspectable)
  ['{996421A1-625C-5D92-AD68-8B3911D294B0}']
    function GetAt(index: Cardinal): Core_IMediaCue; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_IMediaCue; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IMediaCue): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal_Base = interface(IInspectable)
  ['{F06A2739-9443-5EF0-B284-DC5AFF3E7D10}']
  end;
  // Windows.Foundation.Collections.IIterator`1<UInt32>
  // External 
  IIterator_1__Cardinal = interface(IIterator_1__Cardinal_Base)
  ['{F06A2739-9443-5EF0-B284-DC5AFF3E7D10}']
    function get_Current: Cardinal; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Current: Cardinal read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.IReference`1<Single>
  // External 
  IReference_1__Single = interface(IInspectable)
  ['{719CC2BA-3E76-5DEF-9F1A-38D85A145EA8}']
    function get_Value: Single; safecall;
    property Value: Single read get_Value;
  end;

  // Windows.Foundation.IReference`1<Boolean>
  // External 
  IReference_1__Boolean = interface(IInspectable)
  ['{3C00FD60-2950-5939-A21A-2D12C5A01B8A}']
    function get_Value: Boolean; safecall;
    property Value: Boolean read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IAudioStreamDescriptor>
  IIterable_1__Core_IAudioStreamDescriptor_Base = interface(IInspectable)
  ['{A3E2C972-A171-5B94-8389-E983EBC3F3B9}']
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IAudioStreamDescriptor>
  // External 
  IIterable_1__Core_IAudioStreamDescriptor = interface(IIterable_1__Core_IAudioStreamDescriptor_Base)
  ['{93E7C43E-0D19-5EEA-B110-02B24E6E007F}']
    function First: IIterator_1__Core_IAudioStreamDescriptor; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IAudioStreamDescriptor>
  IIterator_1__Core_IAudioStreamDescriptor_Base = interface(IInspectable)
  ['{A61A11CD-B32E-518B-A6A7-5472CBE00E83}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IAudioStreamDescriptor>
  // External 
  IIterator_1__Core_IAudioStreamDescriptor = interface(IIterator_1__Core_IAudioStreamDescriptor_Base)
  ['{676BE182-2B2B-5755-94CB-DD512AD111BE}']
    function get_Current: Core_IAudioStreamDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_IAudioStreamDescriptor): Cardinal; safecall;
    property Current: Core_IAudioStreamDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IAudioStreamDescriptor
  // External 
  Core_IAudioStreamDescriptor = interface(IInspectable)
  ['{1E3692E4-4027-4847-A70B-DF1D9A2A7B04}']
    function get_EncodingProperties: IAudioEncodingProperties; safecall;
    property EncodingProperties: IAudioEncodingProperties read get_EncodingProperties;
  end;

  // DualAPI Interface
  // Windows.Media.MediaProperties.IAudioEncodingProperties
  // External 
  IAudioEncodingProperties = interface(IInspectable)
  ['{62BC7A16-005C-4B3B-8A0B-0A090E9687F3}']
    procedure put_Bitrate(value: Cardinal); safecall;
    function get_Bitrate: Cardinal; safecall;
    procedure put_ChannelCount(value: Cardinal); safecall;
    function get_ChannelCount: Cardinal; safecall;
    procedure put_SampleRate(value: Cardinal); safecall;
    function get_SampleRate: Cardinal; safecall;
    procedure put_BitsPerSample(value: Cardinal); safecall;
    function get_BitsPerSample: Cardinal; safecall;
    property Bitrate: Cardinal read get_Bitrate write put_Bitrate;
    property BitsPerSample: Cardinal read get_BitsPerSample write put_BitsPerSample;
    property ChannelCount: Cardinal read get_ChannelCount write put_ChannelCount;
    property SampleRate: Cardinal read get_SampleRate write put_SampleRate;
  end;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.IAudioStreamDescriptor>
  // External 
  IVector_1__Core_IAudioStreamDescriptor = interface(IInspectable)
  ['{4AA8CDE4-787E-5075-AF19-B5E29A5B4A75}']
    function GetAt(index: Cardinal): Core_IAudioStreamDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Core_IAudioStreamDescriptor; safecall;
    function IndexOf(value: Core_IAudioStreamDescriptor; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Core_IAudioStreamDescriptor); safecall;
    procedure InsertAt(index: Cardinal; value: Core_IAudioStreamDescriptor); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Core_IAudioStreamDescriptor); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IAudioStreamDescriptor): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCore_IAudioStreamDescriptor); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IAudioStreamDescriptor>
  // External 
  IVectorView_1__Core_IAudioStreamDescriptor = interface(IInspectable)
  ['{A97548F5-13ED-5B5D-86C2-D9853F89CBD3}']
    function GetAt(index: Cardinal): Core_IAudioStreamDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_IAudioStreamDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IAudioStreamDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IVideoStreamDescriptor>
  IIterable_1__Core_IVideoStreamDescriptor_Base = interface(IInspectable)
  ['{3ACBF03C-0A79-5823-AAA9-D88BC3F8F594}']
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IVideoStreamDescriptor>
  // External 
  IIterable_1__Core_IVideoStreamDescriptor = interface(IIterable_1__Core_IVideoStreamDescriptor_Base)
  ['{279FFF16-8217-56BF-8117-B3BCA6705D0B}']
    function First: IIterator_1__Core_IVideoStreamDescriptor; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IVideoStreamDescriptor>
  IIterator_1__Core_IVideoStreamDescriptor_Base = interface(IInspectable)
  ['{DA51AB3C-3C64-545C-A3F4-F9B055AAF7D9}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IVideoStreamDescriptor>
  // External 
  IIterator_1__Core_IVideoStreamDescriptor = interface(IIterator_1__Core_IVideoStreamDescriptor_Base)
  ['{360EA333-DC3F-5682-986B-4C807136494A}']
    function get_Current: Core_IVideoStreamDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_IVideoStreamDescriptor): Cardinal; safecall;
    property Current: Core_IVideoStreamDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // DualAPI Interface
  // Windows.Media.Core.IVideoStreamDescriptor
  // External 
  Core_IVideoStreamDescriptor = interface(IInspectable)
  ['{12EE0D55-9C2B-4440-8057-2C7A90F0CBEC}']
    function get_EncodingProperties: IVideoEncodingProperties; safecall;
    property EncodingProperties: IVideoEncodingProperties read get_EncodingProperties;
  end;

  // DualAPI Interface
  // Windows.Media.MediaProperties.IVideoEncodingProperties
  // External 
  IVideoEncodingProperties = interface(IInspectable)
  ['{76EE6C9A-37C2-4F2A-880A-1282BBB4373D}']
    procedure put_Bitrate(value: Cardinal); safecall;
    function get_Bitrate: Cardinal; safecall;
    procedure put_Width(value: Cardinal); safecall;
    function get_Width: Cardinal; safecall;
    procedure put_Height(value: Cardinal); safecall;
    function get_Height: Cardinal; safecall;
    function get_FrameRate: IMediaRatio; safecall;
    function get_PixelAspectRatio: IMediaRatio; safecall;
    property Bitrate: Cardinal read get_Bitrate write put_Bitrate;
    property FrameRate: IMediaRatio read get_FrameRate;
    property Height: Cardinal read get_Height write put_Height;
    property PixelAspectRatio: IMediaRatio read get_PixelAspectRatio;
    property Width: Cardinal read get_Width write put_Width;
  end;

  // DualAPI Interface
  // Windows.Media.MediaProperties.IMediaRatio
  // External 
  IMediaRatio = interface(IInspectable)
  ['{D2D0FEE5-8929-401D-AC78-7D357E378163}']
    procedure put_Numerator(value: Cardinal); safecall;
    function get_Numerator: Cardinal; safecall;
    procedure put_Denominator(value: Cardinal); safecall;
    function get_Denominator: Cardinal; safecall;
    property Denominator: Cardinal read get_Denominator write put_Denominator;
    property Numerator: Cardinal read get_Numerator write put_Numerator;
  end;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.IVideoStreamDescriptor>
  // External 
  IVector_1__Core_IVideoStreamDescriptor = interface(IInspectable)
  ['{F4E5A134-CFFB-52DE-B2A9-5FA3AC96885E}']
    function GetAt(index: Cardinal): Core_IVideoStreamDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Core_IVideoStreamDescriptor; safecall;
    function IndexOf(value: Core_IVideoStreamDescriptor; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Core_IVideoStreamDescriptor); safecall;
    procedure InsertAt(index: Cardinal; value: Core_IVideoStreamDescriptor); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Core_IVideoStreamDescriptor); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IVideoStreamDescriptor): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCore_IVideoStreamDescriptor); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IVideoStreamDescriptor>
  // External 
  IVectorView_1__Core_IVideoStreamDescriptor = interface(IInspectable)
  ['{169BE92A-80D0-5ABF-A578-524970C2FEF3}']
    function GetAt(index: Cardinal): Core_IVideoStreamDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_IVideoStreamDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IVideoStreamDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IHostName>
  // External 
  IVectorView_1__IHostName = interface(IInspectable)
  ['{FB26F077-BEFF-523E-81C2-5A710F18359D}']
    function GetAt(index: Cardinal): IHostName; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IHostName; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIHostName): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Object>
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{E4DC9CFC-F462-5AFD-856D-04ACE229D00E}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Object>
  // External 
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable = interface(TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable_Delegate_Base)
  ['{86F13482-3275-5928-80CD-6A6B72B82CCD}']
    procedure Invoke(sender: IMobileBroadbandAccountWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
  // External 
  IMobileBroadbandAccountWatcher = interface(IInspectable)
  ['{6BF3335E-23B5-449F-928D-5E0D3E04471D}']
    function add_AccountAdded(handler: TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccountAdded(cookie: EventRegistrationToken); safecall;
    function add_AccountUpdated(handler: TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccountUpdated(cookie: EventRegistrationToken); safecall;
    function add_AccountRemoved(handler: TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs): EventRegistrationToken; safecall;
    procedure remove_AccountRemoved(cookie: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(cookie: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__IMobileBroadbandAccountWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(cookie: EventRegistrationToken); safecall;
    function get_Status: MobileBroadbandAccountWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: MobileBroadbandAccountWatcherStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs>
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs_Delegate_Base = interface(IUnknown)
  ['{423CC41E-FE8C-5A7D-9FEE-AAE04EF85700}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs>
  // External 
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs = interface(TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountEventArgs_Delegate_Base)
  ['{5475B308-13DA-55FA-A4E6-32B15DCD409C}']
    procedure Invoke(sender: IMobileBroadbandAccountWatcher; args: IMobileBroadbandAccountEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs
  // External 
  IMobileBroadbandAccountEventArgs = interface(IInspectable)
  ['{3853C880-77DE-4C04-BEAD-A123B08C9F59}']
    function get_NetworkAccountId: HSTRING; safecall;
    property NetworkAccountId: HSTRING read get_NetworkAccountId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs>
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{0E865096-1FFA-5792-8D4F-8623E3C77F56}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher,Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs>
  // External 
  TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs = interface(TypedEventHandler_2__IMobileBroadbandAccountWatcher__IMobileBroadbandAccountUpdatedEventArgs_Delegate_Base)
  ['{732723B5-733F-57AE-BAB8-65EFC90209EC}']
    procedure Invoke(sender: IMobileBroadbandAccountWatcher; args: IMobileBroadbandAccountUpdatedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs
  // External 
  IMobileBroadbandAccountUpdatedEventArgs = interface(IInspectable)
  ['{7BC31D88-A6BD-49E1-80AB-6B91354A57D4}']
    function get_NetworkAccountId: HSTRING; safecall;
    function get_HasDeviceInformationChanged: Boolean; safecall;
    function get_HasNetworkChanged: Boolean; safecall;
    property HasDeviceInformationChanged: Boolean read get_HasDeviceInformationChanged;
    property HasNetworkChanged: Boolean read get_HasNetworkChanged;
    property NetworkAccountId: HSTRING read get_NetworkAccountId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionCapabilities,Object>
  TypedEventHandler_2__ICompositionCapabilities__IInspectable_Delegate_Base = interface(IUnknown)
  ['{6E8CC6F4-6CF5-5994-9447-726171236EA8}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Composition.ICompositionCapabilities,Object>
  // External 
  TypedEventHandler_2__ICompositionCapabilities__IInspectable = interface(TypedEventHandler_2__ICompositionCapabilities__IInspectable_Delegate_Base)
  ['{A97C10D7-8BE1-57F7-89A8-BC1D9B5D0C28}']
    procedure Invoke(sender: ICompositionCapabilities; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Composition.ICompositionCapabilities
  // External 
  ICompositionCapabilities = interface(IInspectable)
  ['{8253353E-B517-48BC-B1E8-4B3561A2E181}']
    function AreEffectsSupported: Boolean; safecall;
    function AreEffectsFast: Boolean; safecall;
    function add_Changed(handler: TypedEventHandler_2__ICompositionCapabilities__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Changed(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkUnprocessedInput,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs_Delegate_Base = interface(IUnknown)
  ['{4A86BD78-5BCF-5EDE-8F65-A8C65235055C}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkUnprocessedInput,Windows.UI.Core.IPointerEventArgs>
  // External 
  TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs = interface(TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs_Delegate_Base)
  ['{E5E83F48-D96A-5622-81AD-4BA59E3DCF06}']
    procedure Invoke(sender: IInkUnprocessedInput; args: IPointerEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkUnprocessedInput
  // External 
  IInkUnprocessedInput = interface(IInspectable)
  ['{DB4445E0-8398-4921-AC3B-AB978C5BA256}']
    function add_PointerEntered(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerEntered(cookie: EventRegistrationToken); safecall;
    function add_PointerHovered(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerHovered(cookie: EventRegistrationToken); safecall;
    function add_PointerExited(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerExited(cookie: EventRegistrationToken); safecall;
    function add_PointerPressed(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerPressed(cookie: EventRegistrationToken); safecall;
    function add_PointerMoved(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerMoved(cookie: EventRegistrationToken); safecall;
    function add_PointerReleased(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerReleased(cookie: EventRegistrationToken); safecall;
    function add_PointerLost(handler: TypedEventHandler_2__IInkUnprocessedInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerLost(cookie: EventRegistrationToken); safecall;
    function get_InkPresenter: IInkPresenter; safecall;
    property InkPresenter: IInkPresenter read get_InkPresenter;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkPresenter
  // External 
  IInkPresenter = interface(IInspectable)
  ['{A69B70E2-887B-458F-B173-4FE4438930A3}']
    function get_IsInputEnabled: Boolean; safecall;
    procedure put_IsInputEnabled(value: Boolean); safecall;
    function get_InputDeviceTypes: CoreInputDeviceTypes; safecall;
    procedure put_InputDeviceTypes(value: CoreInputDeviceTypes); safecall;
    function get_UnprocessedInput: IInkUnprocessedInput; safecall;
    function get_StrokeInput: IInkStrokeInput; safecall;
    function get_InputProcessingConfiguration: IInkInputProcessingConfiguration; safecall;
    function get_StrokeContainer: IInkStrokeContainer; safecall;
    procedure put_StrokeContainer(value: IInkStrokeContainer); safecall;
    function CopyDefaultDrawingAttributes: IInkDrawingAttributes; safecall;
    procedure UpdateDefaultDrawingAttributes(value: IInkDrawingAttributes); safecall;
    function ActivateCustomDrying: IInkSynchronizer; safecall;
    procedure SetPredefinedConfiguration(value: InkPresenterPredefinedConfiguration); safecall;
    function add_StrokesCollected(handler: TypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StrokesCollected(cookie: EventRegistrationToken); safecall;
    function add_StrokesErased(handler: TypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StrokesErased(cookie: EventRegistrationToken); safecall;
    property InputDeviceTypes: CoreInputDeviceTypes read get_InputDeviceTypes write put_InputDeviceTypes;
    property InputProcessingConfiguration: IInkInputProcessingConfiguration read get_InputProcessingConfiguration;
    property IsInputEnabled: Boolean read get_IsInputEnabled write put_IsInputEnabled;
    property StrokeContainer: IInkStrokeContainer read get_StrokeContainer write put_StrokeContainer;
    property StrokeInput: IInkStrokeInput read get_StrokeInput;
    property UnprocessedInput: IInkUnprocessedInput read get_UnprocessedInput;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkStrokeInput
  // External 
  IInkStrokeInput = interface(IInspectable)
  ['{CF2FFE7B-5E10-43C6-A080-88F26E1DC67D}']
    function add_StrokeStarted(handler: TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_StrokeStarted(cookie: EventRegistrationToken); safecall;
    function add_StrokeContinued(handler: TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_StrokeContinued(cookie: EventRegistrationToken); safecall;
    function add_StrokeEnded(handler: TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_StrokeEnded(cookie: EventRegistrationToken); safecall;
    function add_StrokeCanceled(handler: TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_StrokeCanceled(cookie: EventRegistrationToken); safecall;
    function get_InkPresenter: IInkPresenter; safecall;
    property InkPresenter: IInkPresenter read get_InkPresenter;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkStrokeInput,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs_Delegate_Base = interface(IUnknown)
  ['{BF66B962-702D-5C07-A2D5-15F21583C43A}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkStrokeInput,Windows.UI.Core.IPointerEventArgs>
  // External 
  TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs = interface(TypedEventHandler_2__IInkStrokeInput__IPointerEventArgs_Delegate_Base)
  ['{8D3570C6-D204-57E3-9A3D-07B8A0D5E873}']
    procedure Invoke(sender: IInkStrokeInput; args: IPointerEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkInputProcessingConfiguration
  // External 
  IInkInputProcessingConfiguration = interface(IInspectable)
  ['{2778D85E-33CA-4B06-A6D3-AC3945116D37}']
    function get_Mode: InkInputProcessingMode; safecall;
    procedure put_Mode(value: InkInputProcessingMode); safecall;
    function get_RightDragAction: InkInputRightDragAction; safecall;
    procedure put_RightDragAction(value: InkInputRightDragAction); safecall;
    property Mode: InkInputProcessingMode read get_Mode write put_Mode;
    property RightDragAction: InkInputRightDragAction read get_RightDragAction write put_RightDragAction;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkStrokeContainer
  // External 
  IInkStrokeContainer = interface(IInspectable)
  ['{22ACCBC6-FAA9-4F14-B68C-F6CEE670AE16}']
    function get_BoundingRect: TRectF; safecall;
    procedure AddStroke(stroke: IInkStroke); safecall;
    function DeleteSelected: TRectF; safecall;
    function MoveSelected(translation: TPointF): TRectF; safecall;
    function SelectWithPolyLine(polyline: IIterable_1__Point): TRectF; safecall;
    function SelectWithLine(from: TPointF; &to: TPointF): TRectF; safecall;
    procedure CopySelectedToClipboard; safecall;
    function PasteFromClipboard(position: TPointF): TRectF; safecall;
    function CanPasteFromClipboard: Boolean; safecall;
    function LoadAsync(inputStream: IInputStream): IAsyncActionWithProgress_1__UInt64; safecall;
    function SaveAsync(outputStream: IOutputStream): IAsyncOperationWithProgress_2__Cardinal__Cardinal; safecall;
    procedure UpdateRecognitionResults(recognitionResults: IVectorView_1__IInkRecognitionResult); safecall;
    function GetStrokes: IVectorView_1__IInkStroke; safecall;
    function GetRecognitionResults: IVectorView_1__IInkRecognitionResult; safecall;
    property BoundingRect: TRectF read get_BoundingRect;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkStroke
  // External 
  IInkStroke = interface(IInspectable)
  ['{15144D60-CCE3-4FCF-9D52-11518AB6AFD4}']
    function get_DrawingAttributes: IInkDrawingAttributes; safecall;
    procedure put_DrawingAttributes(value: IInkDrawingAttributes); safecall;
    function get_BoundingRect: TRectF; safecall;
    function get_Selected: Boolean; safecall;
    procedure put_Selected(value: Boolean); safecall;
    function get_Recognized: Boolean; safecall;
    function GetRenderingSegments: IVectorView_1__IInkStrokeRenderingSegment; safecall;
    function Clone: IInkStroke; safecall;
    property BoundingRect: TRectF read get_BoundingRect;
    property DrawingAttributes: IInkDrawingAttributes read get_DrawingAttributes write put_DrawingAttributes;
    property Recognized: Boolean read get_Recognized;
    property Selected: Boolean read get_Selected write put_Selected;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkDrawingAttributes
  // External 
  IInkDrawingAttributes = interface(IInspectable)
  ['{97A2176C-6774-48AD-84F0-48F5A9BE74F9}']
    function get_Color: Color; safecall;
    procedure put_Color(value: Color); safecall;
    function get_PenTip: PenTipShape; safecall;
    procedure put_PenTip(value: PenTipShape); safecall;
    function get_Size: TSizeF; safecall;
    procedure put_Size(value: TSizeF); safecall;
    function get_IgnorePressure: Boolean; safecall;
    procedure put_IgnorePressure(value: Boolean); safecall;
    function get_FitToCurve: Boolean; safecall;
    procedure put_FitToCurve(value: Boolean); safecall;
    [HPPGEN('//TODO: C++ Property')]
    property Color: Color read get_Color write put_Color;
    property FitToCurve: Boolean read get_FitToCurve write put_FitToCurve;
    property IgnorePressure: Boolean read get_IgnorePressure write put_IgnorePressure;
    property PenTip: PenTipShape read get_PenTip write put_PenTip;
    property Size: TSizeF read get_Size write put_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkStrokeRenderingSegment>
  // External 
  IVectorView_1__IInkStrokeRenderingSegment = interface(IInspectable)
  ['{533D1D1F-D4DE-5B1B-8AD2-33127C4637DD}']
    function GetAt(index: Cardinal): IInkStrokeRenderingSegment; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInkStrokeRenderingSegment; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInkStrokeRenderingSegment): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkStrokeRenderingSegment
  // External 
  IInkStrokeRenderingSegment = interface(IInspectable)
  ['{68510F1F-88E3-477A-A2FA-569F5F1F9BD5}']
    function get_Position: TPointF; safecall;
    function get_BezierControlPoint1: TPointF; safecall;
    function get_BezierControlPoint2: TPointF; safecall;
    function get_Pressure: Single; safecall;
    function get_TiltX: Single; safecall;
    function get_TiltY: Single; safecall;
    function get_Twist: Single; safecall;
    property BezierControlPoint1: TPointF read get_BezierControlPoint1;
    property BezierControlPoint2: TPointF read get_BezierControlPoint2;
    property Position: TPointF read get_Position;
    property Pressure: Single read get_Pressure;
    property TiltX: Single read get_TiltX;
    property TiltY: Single read get_TiltY;
    property Twist: Single read get_Twist;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  IIterable_1__Point_Base = interface(IInspectable)
  ['{C192280D-3A09-5423-9DC5-67B83EBDE41D}']
  end;
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Point>
  // External 
  IIterable_1__Point = interface(IIterable_1__Point_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Point; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Point>
  IIterator_1__Point_Base = interface(IInspectable)
  ['{C602B59E-0A8E-5E99-B478-2B564585278D}']
  end;
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Point>
  // External 
  IIterator_1__Point = interface(IIterator_1__Point_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: TPointF; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPointF): Cardinal; safecall;
    property Current: TPointF read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Windows.Foundation.IAsyncActionWithProgress`1<UInt64>
  // External 
  IAsyncActionWithProgress_1__UInt64 = interface(IInspectable)
  ['{43F713D0-C49D-5E55-AEBF-AF395768351E}']
    procedure put_Progress(handler: AsyncActionProgressHandler_1__UInt64); safecall;
    function get_Progress: AsyncActionProgressHandler_1__UInt64; safecall;
    procedure put_Completed(handler: AsyncActionWithProgressCompletedHandler_1__UInt64); safecall;
    function get_Completed: AsyncActionWithProgressCompletedHandler_1__UInt64; safecall;
    procedure GetResults; safecall;
    property Progress: AsyncActionProgressHandler_1__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncActionWithProgressCompletedHandler_1__UInt64 read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  AsyncActionProgressHandler_1__UInt64_Delegate_Base = interface(IUnknown)
  ['{55E233CA-F243-5AE2-853B-F9CC7C0AE0CF}']
  end;
  // Windows.Foundation.AsyncActionProgressHandler`1<UInt64>
  // External 
  AsyncActionProgressHandler_1__UInt64 = interface(AsyncActionProgressHandler_1__UInt64_Delegate_Base)
  ['{55E233CA-F243-5AE2-853B-F9CC7C0AE0CF}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__UInt64; progressInfo: UInt64); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  AsyncActionWithProgressCompletedHandler_1__UInt64_Delegate_Base = interface(IUnknown)
  ['{E6FF857B-F160-571A-A934-2C61F98C862D}']
  end;
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<UInt64>
  // External 
  AsyncActionWithProgressCompletedHandler_1__UInt64 = interface(AsyncActionWithProgressCompletedHandler_1__UInt64_Delegate_Base)
  ['{E6FF857B-F160-571A-A934-2C61F98C862D}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkRecognitionResult>
  // External 
  IVectorView_1__IInkRecognitionResult = interface(IInspectable)
  ['{3C16D87C-E0C0-5689-A3D8-87D11003DEA9}']
    function GetAt(index: Cardinal): IInkRecognitionResult; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInkRecognitionResult; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInkRecognitionResult): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkRecognitionResult
  // External 
  IInkRecognitionResult = interface(IInspectable)
  ['{36461A94-5068-40EF-8A05-2C2FB60908A2}']
    function get_BoundingRect: TRectF; safecall;
    function GetTextCandidates: IVectorView_1__HSTRING; safecall;
    function GetStrokes: IVectorView_1__IInkStroke; safecall;
    property BoundingRect: TRectF read get_BoundingRect;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.Inking.IInkStroke>
  // External 
  IVectorView_1__IInkStroke = interface(IInspectable)
  ['{C3FC26F7-5323-55A2-90F5-5EBE01DAF672}']
    function GetAt(index: Cardinal): IInkStroke; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IInkStroke; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIInkStroke): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkSynchronizer
  // External 
  IInkSynchronizer = interface(IInspectable)
  ['{9B9EA160-AE9B-45F9-8407-4B493B163661}']
    function BeginDry: IVectorView_1__IInkStroke; safecall;
    procedure EndDry; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkPresenter,Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs>
  TypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{176BFA8F-C0DE-5B3A-B28C-0F3931CA52D3}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkPresenter,Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs>
  // External 
  TypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs = interface(TypedEventHandler_2__IInkPresenter__IInkStrokesCollectedEventArgs_Delegate_Base)
  ['{EAEA1A9B-FCE4-51A5-B952-C4037CF4291E}']
    procedure Invoke(sender: IInkPresenter; args: IInkStrokesCollectedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkStrokesCollectedEventArgs
  // External 
  IInkStrokesCollectedEventArgs = interface(IInspectable)
  ['{C4F3F229-1938-495C-B4D9-6DE4B08D4811}']
    function get_Strokes: IVectorView_1__IInkStroke; safecall;
    property Strokes: IVectorView_1__IInkStroke read get_Strokes;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkPresenter,Windows.UI.Input.Inking.IInkStrokesErasedEventArgs>
  TypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs_Delegate_Base = interface(IUnknown)
  ['{30FEC929-14D0-550F-84F2-137FC6A9F08F}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.IInkPresenter,Windows.UI.Input.Inking.IInkStrokesErasedEventArgs>
  // External 
  TypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs = interface(TypedEventHandler_2__IInkPresenter__IInkStrokesErasedEventArgs_Delegate_Base)
  ['{78213819-AC61-5AC9-987D-45069CDCB496}']
    procedure Invoke(sender: IInkPresenter; args: IInkStrokesErasedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.IInkStrokesErasedEventArgs
  // External 
  IInkStrokesErasedEventArgs = interface(IInspectable)
  ['{A4216A22-1503-4EBF-8FF5-2DE84584A8AA}']
    function get_Strokes: IVectorView_1__IInkStroke; safecall;
    property Strokes: IVectorView_1__IInkStroke read get_Strokes;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource,Windows.UI.Core.IPointerEventArgs>
  TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs_Delegate_Base = interface(IUnknown)
  ['{B83FBE98-882A-5B69-BD1C-C66690707FEF}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource,Windows.UI.Core.IPointerEventArgs>
  // External 
  TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs = interface(TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs_Delegate_Base)
  ['{D5E0528D-E040-5453-B8AE-4AABC229B374}']
    procedure Invoke(sender: Core_ICoreInkIndependentInputSource; args: IPointerEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.Inking.Core.ICoreInkIndependentInputSource
  // External 
  Core_ICoreInkIndependentInputSource = interface(IInspectable)
  ['{39B38DA9-7639-4499-A5B5-191D00E35B16}']
    function add_PointerEntering(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerEntering(cookie: EventRegistrationToken); safecall;
    function add_PointerHovering(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerHovering(cookie: EventRegistrationToken); safecall;
    function add_PointerExiting(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerExiting(cookie: EventRegistrationToken); safecall;
    function add_PointerPressing(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerPressing(cookie: EventRegistrationToken); safecall;
    function add_PointerMoving(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerMoving(cookie: EventRegistrationToken); safecall;
    function add_PointerReleasing(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerReleasing(cookie: EventRegistrationToken); safecall;
    function add_PointerLost(handler: TypedEventHandler_2__Core_ICoreInkIndependentInputSource__IPointerEventArgs): EventRegistrationToken; safecall;
    procedure remove_PointerLost(cookie: EventRegistrationToken); safecall;
    function get_InkPresenter: IInkPresenter; safecall;
    property InkPresenter: IInkPresenter read get_InkPresenter;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialControllerMenuItem,Object>
  TypedEventHandler_2__IRadialControllerMenuItem__IInspectable_Delegate_Base = interface(IUnknown)
  ['{5C90D6FB-E4F8-5BE2-8544-9DE33F82C41A}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialControllerMenuItem,Object>
  // External 
  TypedEventHandler_2__IRadialControllerMenuItem__IInspectable = interface(TypedEventHandler_2__IRadialControllerMenuItem__IInspectable_Delegate_Base)
  ['{2B1E4F55-8DA4-5328-9A67-2DE9E63DAFEB}']
    procedure Invoke(sender: IRadialControllerMenuItem; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerMenuItem
  // External 
  IRadialControllerMenuItem = interface(IInspectable)
  ['{C80FC98D-AD0B-4C9C-8F2F-136A2373A6BA}']
    function get_DisplayText: HSTRING; safecall;
    function get_Tag: IInspectable; safecall;
    procedure put_Tag(value: IInspectable); safecall;
    function add_Invoked(handler: TypedEventHandler_2__IRadialControllerMenuItem__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Invoked(token: EventRegistrationToken); safecall;
    property DisplayText: HSTRING read get_DisplayText;
    property Tag: IInspectable read get_Tag write put_Tag;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Object>
  TypedEventHandler_2__IRadialController__IInspectable_Delegate_Base = interface(IUnknown)
  ['{5E0F93B1-C2F2-5351-82AA-6CF5F4C2D068}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Object>
  // External 
  TypedEventHandler_2__IRadialController__IInspectable = interface(TypedEventHandler_2__IRadialController__IInspectable_Delegate_Base)
  ['{4DA17D78-6F80-5F2E-A1DB-83F8EC01736B}']
    procedure Invoke(sender: IRadialController; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialController
  // External 
  IRadialController = interface(IInspectable)
  ['{3055D1C8-DF51-43D4-B23B-0E1037467A09}']
    function get_Menu: IRadialControllerMenu; safecall;
    function get_RotationResolutionInDegrees: Double; safecall;
    procedure put_RotationResolutionInDegrees(value: Double); safecall;
    function get_UseAutomaticHapticFeedback: Boolean; safecall;
    procedure put_UseAutomaticHapticFeedback(value: Boolean); safecall;
    function add_ScreenContactStarted(handler: TypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ScreenContactStarted(cookie: EventRegistrationToken); safecall;
    function add_ScreenContactEnded(handler: TypedEventHandler_2__IRadialController__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ScreenContactEnded(cookie: EventRegistrationToken); safecall;
    function add_ScreenContactContinued(handler: TypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ScreenContactContinued(cookie: EventRegistrationToken); safecall;
    function add_ControlLost(handler: TypedEventHandler_2__IRadialController__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ControlLost(cookie: EventRegistrationToken); safecall;
    function add_RotationChanged(handler: TypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RotationChanged(token: EventRegistrationToken); safecall;
    function add_ButtonClicked(handler: TypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ButtonClicked(token: EventRegistrationToken); safecall;
    function add_ControlAcquired(handler: TypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs): EventRegistrationToken; safecall;
    procedure remove_ControlAcquired(cookie: EventRegistrationToken); safecall;
    property Menu: IRadialControllerMenu read get_Menu;
    property RotationResolutionInDegrees: Double read get_RotationResolutionInDegrees write put_RotationResolutionInDegrees;
    property UseAutomaticHapticFeedback: Boolean read get_UseAutomaticHapticFeedback write put_UseAutomaticHapticFeedback;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerMenu
  // External 
  IRadialControllerMenu = interface(IInspectable)
  ['{8506B35D-F640-4412-ABA0-BAD077E5EA8A}']
    function get_Items: IVector_1__IRadialControllerMenuItem; safecall;
    function get_IsEnabled: Boolean; safecall;
    procedure put_IsEnabled(value: Boolean); safecall;
    function GetSelectedMenuItem: IRadialControllerMenuItem; safecall;
    procedure SelectMenuItem(menuItem: IRadialControllerMenuItem); safecall;
    function TrySelectPreviouslySelectedMenuItem: Boolean; safecall;
    property IsEnabled: Boolean read get_IsEnabled write put_IsEnabled;
    property Items: IVector_1__IRadialControllerMenuItem read get_Items;
  end;

  // Windows.Foundation.Collections.IVector`1<Windows.UI.Input.IRadialControllerMenuItem>
  // External 
  IVector_1__IRadialControllerMenuItem = interface(IInspectable)
  ['{700BA2AD-8D5A-5481-8B7C-1AAA3277697B}']
    function GetAt(index: Cardinal): IRadialControllerMenuItem; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IRadialControllerMenuItem; safecall;
    function IndexOf(value: IRadialControllerMenuItem; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IRadialControllerMenuItem); safecall;
    procedure InsertAt(index: Cardinal; value: IRadialControllerMenuItem); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IRadialControllerMenuItem); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIRadialControllerMenuItem): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIRadialControllerMenuItem); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Windows.Foundation.Collections.IVectorView`1<Windows.UI.Input.IRadialControllerMenuItem>
  // External 
  IVectorView_1__IRadialControllerMenuItem = interface(IInspectable)
  ['{EFD7C099-1361-58A2-819C-F7A8E94FAD5F}']
    function GetAt(index: Cardinal): IRadialControllerMenuItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IRadialControllerMenuItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIRadialControllerMenuItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1F2D584E-3AD8-5049-B451-3A44A102FA82}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs>
  // External 
  TypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerScreenContactStartedEventArgs_Delegate_Base)
  ['{1DCA074B-CD0F-5F3F-93FE-4E34ED408A39}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerScreenContactStartedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerScreenContactStartedEventArgs
  // External 
  IRadialControllerScreenContactStartedEventArgs = interface(IInspectable)
  ['{206AA436-E651-11E5-BF62-2C27D7404E85}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerScreenContact
  // External 
  IRadialControllerScreenContact = interface(IInspectable)
  ['{206AA434-E651-11E5-BF62-2C27D7404E85}']
    function get_Bounds: TRectF; safecall;
    function get_Position: TPointF; safecall;
    property Bounds: TRectF read get_Bounds;
    property Position: TPointF read get_Position;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs_Delegate_Base = interface(IUnknown)
  ['{30579E67-FB4F-5D38-83B4-9CB610090DEF}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs>
  // External 
  TypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerScreenContactContinuedEventArgs_Delegate_Base)
  ['{5D23DB15-EE4E-5430-95EE-33FE7C4C9B11}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerScreenContactContinuedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerScreenContactContinuedEventArgs
  // External 
  IRadialControllerScreenContactContinuedEventArgs = interface(IInspectable)
  ['{206AA437-E651-11E5-BF62-2C27D7404E85}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerRotationChangedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{8FE73AC9-8A36-5152-815D-03310EE8BF85}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerRotationChangedEventArgs>
  // External 
  TypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerRotationChangedEventArgs_Delegate_Base)
  ['{4D94E51C-1735-5608-A356-6272EC47F5A0}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerRotationChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerRotationChangedEventArgs
  // External 
  IRadialControllerRotationChangedEventArgs = interface(IInspectable)
  ['{206AA435-E651-11E5-BF62-2C27D7404E85}']
    function get_RotationDeltaInDegrees: Double; safecall;
    function get_Contact: IRadialControllerScreenContact; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
    property RotationDeltaInDegrees: Double read get_RotationDeltaInDegrees;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonClickedEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D09D9FCC-EDB8-56C0-856D-70E477A9DDF3}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerButtonClickedEventArgs>
  // External 
  TypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerButtonClickedEventArgs_Delegate_Base)
  ['{B0128F18-A071-55B3-A456-74AFFFA9BCEF}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerButtonClickedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerButtonClickedEventArgs
  // External 
  IRadialControllerButtonClickedEventArgs = interface(IInspectable)
  ['{206AA438-E651-11E5-BF62-2C27D7404E85}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerControlAcquiredEventArgs>
  TypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs_Delegate_Base = interface(IUnknown)
  ['{4EC5F3FD-B217-5452-A2BD-9725CE9F6675}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Input.IRadialController,Windows.UI.Input.IRadialControllerControlAcquiredEventArgs>
  // External 
  TypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs = interface(TypedEventHandler_2__IRadialController__IRadialControllerControlAcquiredEventArgs_Delegate_Base)
  ['{F6423CA5-444F-50D3-A999-D97B66AFAF4A}']
    procedure Invoke(sender: IRadialController; args: IRadialControllerControlAcquiredEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Input.IRadialControllerControlAcquiredEventArgs
  // External 
  IRadialControllerControlAcquiredEventArgs = interface(IInspectable)
  ['{206AA439-E651-11E5-BF62-2C27D7404E85}']
    function get_Contact: IRadialControllerScreenContact; safecall;
    property Contact: IRadialControllerScreenContact read get_Contact;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  TypedEventHandler_2__IToastNotification__IInspectable_Delegate_Base = interface(IUnknown)
  ['{AB54DE2D-97D9-5528-B6AD-105AFE156530}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Object>
  // External 
  TypedEventHandler_2__IToastNotification__IInspectable = interface(TypedEventHandler_2__IToastNotification__IInspectable_Delegate_Base)
  ['{93621AAC-6E87-5F7A-AA83-927B2D905518}']
    procedure Invoke(sender: IToastNotification; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Notifications.IToastNotification
  // External 
  IToastNotification = interface(IInspectable)
  ['{997E2675-059E-4E60-8B06-1760917C8B80}']
    function get_Content: Xml_Dom_IXmlDocument; safecall;
    procedure put_ExpirationTime(value: IReference_1__DateTime); safecall;
    function get_ExpirationTime: IReference_1__DateTime; safecall;
    function add_Dismissed(handler: TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Dismissed(cookie: EventRegistrationToken); safecall;
    function add_Activated(handler: TypedEventHandler_2__IToastNotification__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Activated(cookie: EventRegistrationToken); safecall;
    function add_Failed(handler: TypedEventHandler_2__IToastNotification__IToastFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Failed(token: EventRegistrationToken); safecall;
    property Content: Xml_Dom_IXmlDocument read get_Content;
    property ExpirationTime: IReference_1__DateTime read get_ExpirationTime write put_ExpirationTime;
  end;

  // DualAPI Interface
  // Windows.Data.Xml.Dom.IXmlDocument
  // External 
  Xml_Dom_IXmlDocument = interface(IInspectable)
  ['{F7F3A506-1E87-42D6-BCFB-B8C809FA5494}']
    function get_Doctype: Xml_Dom_IXmlDocumentType; safecall;
    function get_Implementation: Xml_Dom_IXmlDomImplementation; safecall;
    function get_DocumentElement: Xml_Dom_IXmlElement; safecall;
    function CreateElement(tagName: HSTRING): Xml_Dom_IXmlElement; safecall;
    function CreateDocumentFragment: Xml_Dom_IXmlDocumentFragment; safecall;
    function CreateTextNode(data: HSTRING): Xml_Dom_IXmlText; safecall;
    function CreateComment(data: HSTRING): Xml_Dom_IXmlComment; safecall;
    function CreateProcessingInstruction(target: HSTRING; data: HSTRING): Xml_Dom_IXmlProcessingInstruction; safecall;
    function CreateAttribute(name: HSTRING): Xml_Dom_IXmlAttribute; safecall;
    function CreateEntityReference(name: HSTRING): Xml_Dom_IXmlEntityReference; safecall;
    function GetElementsByTagName(tagName: HSTRING): Xml_Dom_IXmlNodeList; safecall;
    function CreateCDataSection(data: HSTRING): Xml_Dom_IXmlCDataSection; safecall;
    function get_DocumentUri: HSTRING; safecall;
    function CreateAttributeNS(namespaceUri: IInspectable; qualifiedName: HSTRING): Xml_Dom_IXmlAttribute; safecall;
    function CreateElementNS(namespaceUri: IInspectable; qualifiedName: HSTRING): Xml_Dom_IXmlElement; safecall;
    function GetElementById(elementId: HSTRING): Xml_Dom_IXmlElement; safecall;
    function ImportNode(node: Xml_Dom_IXmlNode; deep: Boolean): Xml_Dom_IXmlNode; safecall;
    property Doctype: Xml_Dom_IXmlDocumentType read get_Doctype;
    property DocumentElement: Xml_Dom_IXmlElement read get_DocumentElement;
    property DocumentUri: HSTRING read get_DocumentUri;
    property &Implementation: Xml_Dom_IXmlDomImplementation read get_Implementation;
  end;

  // Windows.Data.Xml.Dom.IXmlDocumentType
  // External 
  Xml_Dom_IXmlDocumentType = interface(IInspectable)
  ['{F7342425-9781-4964-8E94-9B1C6DFC9BC7}']
    function get_Name: HSTRING; safecall;
    function get_Entities: Xml_Dom_IXmlNamedNodeMap; safecall;
    function get_Notations: Xml_Dom_IXmlNamedNodeMap; safecall;
    property Entities: Xml_Dom_IXmlNamedNodeMap read get_Entities;
    property Name: HSTRING read get_Name;
    property Notations: Xml_Dom_IXmlNamedNodeMap read get_Notations;
  end;

  // Windows.Data.Xml.Dom.IXmlNamedNodeMap
  // External 
  Xml_Dom_IXmlNamedNodeMap = interface(IInspectable)
  ['{B3A69EB0-AAB0-4B82-A6FA-B1453F7C021B}']
    function get_Length: Cardinal; safecall;
    function Item(index: Cardinal): Xml_Dom_IXmlNode; safecall;
    function GetNamedItem(name: HSTRING): Xml_Dom_IXmlNode; safecall;
    function SetNamedItem(node: Xml_Dom_IXmlNode): Xml_Dom_IXmlNode; safecall;
    function RemoveNamedItem(name: HSTRING): Xml_Dom_IXmlNode; safecall;
    function GetNamedItemNS(namespaceUri: IInspectable; name: HSTRING): Xml_Dom_IXmlNode; safecall;
    function RemoveNamedItemNS(namespaceUri: IInspectable; name: HSTRING): Xml_Dom_IXmlNode; safecall;
    function SetNamedItemNS(node: Xml_Dom_IXmlNode): Xml_Dom_IXmlNode; safecall;
    property Length: Cardinal read get_Length;
  end;

  // DualAPI Interface
  // Windows.Data.Xml.Dom.IXmlNode
  // External 
  Xml_Dom_IXmlNode = interface(IInspectable)
  ['{1C741D59-2122-47D5-A856-83F3D4214875}']
    function get_NodeValue: IInspectable; safecall;
    procedure put_NodeValue(value: IInspectable); safecall;
    function get_NodeType: Xml_Dom_NodeType; safecall;
    function get_NodeName: HSTRING; safecall;
    function get_ParentNode: Xml_Dom_IXmlNode; safecall;
    function get_ChildNodes: Xml_Dom_IXmlNodeList; safecall;
    function get_FirstChild: Xml_Dom_IXmlNode; safecall;
    function get_LastChild: Xml_Dom_IXmlNode; safecall;
    function get_PreviousSibling: Xml_Dom_IXmlNode; safecall;
    function get_NextSibling: Xml_Dom_IXmlNode; safecall;
    function get_Attributes: Xml_Dom_IXmlNamedNodeMap; safecall;
    function HasChildNodes: Boolean; safecall;
    function get_OwnerDocument: Xml_Dom_IXmlDocument; safecall;
    function InsertBefore(newChild: Xml_Dom_IXmlNode; referenceChild: Xml_Dom_IXmlNode): Xml_Dom_IXmlNode; safecall;
    function ReplaceChild(newChild: Xml_Dom_IXmlNode; referenceChild: Xml_Dom_IXmlNode): Xml_Dom_IXmlNode; safecall;
    function RemoveChild(childNode: Xml_Dom_IXmlNode): Xml_Dom_IXmlNode; safecall;
    function AppendChild(newChild: Xml_Dom_IXmlNode): Xml_Dom_IXmlNode; safecall;
    function CloneNode(deep: Boolean): Xml_Dom_IXmlNode; safecall;
    function get_NamespaceUri: IInspectable; safecall;
    function get_LocalName: IInspectable; safecall;
    function get_Prefix: IInspectable; safecall;
    procedure Normalize; safecall;
    procedure put_Prefix(value: IInspectable); safecall;
    property Attributes: Xml_Dom_IXmlNamedNodeMap read get_Attributes;
    property ChildNodes: Xml_Dom_IXmlNodeList read get_ChildNodes;
    property FirstChild: Xml_Dom_IXmlNode read get_FirstChild;
    property LastChild: Xml_Dom_IXmlNode read get_LastChild;
    property LocalName: IInspectable read get_LocalName;
    property NamespaceUri: IInspectable read get_NamespaceUri;
    property NextSibling: Xml_Dom_IXmlNode read get_NextSibling;
    property NodeName: HSTRING read get_NodeName;
    property NodeType: Xml_Dom_NodeType read get_NodeType;
    property NodeValue: IInspectable read get_NodeValue write put_NodeValue;
    property OwnerDocument: Xml_Dom_IXmlDocument read get_OwnerDocument;
    property ParentNode: Xml_Dom_IXmlNode read get_ParentNode;
    property Prefix: IInspectable read get_Prefix write put_Prefix;
    property PreviousSibling: Xml_Dom_IXmlNode read get_PreviousSibling;
  end;

  // Windows.Data.Xml.Dom.IXmlNodeList
  // External 
  Xml_Dom_IXmlNodeList = interface(IInspectable)
  ['{8C60AD77-83A4-4EC1-9C54-7BA429E13DA6}']
    function get_Length: Cardinal; safecall;
    function Item(index: Cardinal): Xml_Dom_IXmlNode; safecall;
    property Length: Cardinal read get_Length;
  end;

  // Windows.Data.Xml.Dom.IXmlDomImplementation
  // External 
  Xml_Dom_IXmlDomImplementation = interface(IInspectable)
  ['{6DE58132-F11D-4FBB-8CC6-583CBA93112F}']
    function HasFeature(feature: HSTRING; version: IInspectable): Boolean; safecall;
  end;

  // Windows.Data.Xml.Dom.IXmlElement
  // External 
  Xml_Dom_IXmlElement = interface(IInspectable)
  ['{2DFB8A1F-6B10-4EF8-9F83-EFCCE8FAEC37}']
    function get_TagName: HSTRING; safecall;
    function GetAttribute(attributeName: HSTRING): HSTRING; safecall;
    procedure SetAttribute(attributeName: HSTRING; attributeValue: HSTRING); safecall;
    procedure RemoveAttribute(attributeName: HSTRING); safecall;
    function GetAttributeNode(attributeName: HSTRING): Xml_Dom_IXmlAttribute; safecall;
    function SetAttributeNode(newAttribute: Xml_Dom_IXmlAttribute): Xml_Dom_IXmlAttribute; safecall;
    function RemoveAttributeNode(attributeNode: Xml_Dom_IXmlAttribute): Xml_Dom_IXmlAttribute; safecall;
    function GetElementsByTagName(tagName: HSTRING): Xml_Dom_IXmlNodeList; safecall;
    procedure SetAttributeNS(namespaceUri: IInspectable; qualifiedName: HSTRING; value: HSTRING); safecall;
    function GetAttributeNS(namespaceUri: IInspectable; localName: HSTRING): HSTRING; safecall;
    procedure RemoveAttributeNS(namespaceUri: IInspectable; localName: HSTRING); safecall;
    function SetAttributeNodeNS(newAttribute: Xml_Dom_IXmlAttribute): Xml_Dom_IXmlAttribute; safecall;
    function GetAttributeNodeNS(namespaceUri: IInspectable; localName: HSTRING): Xml_Dom_IXmlAttribute; safecall;
    property TagName: HSTRING read get_TagName;
  end;

  // Windows.Data.Xml.Dom.IXmlAttribute
  // External 
  Xml_Dom_IXmlAttribute = interface(IInspectable)
  ['{AC144AA4-B4F1-4DB6-B206-8A22C308DB0A}']
    function get_Name: HSTRING; safecall;
    function get_Specified: Boolean; safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    property Name: HSTRING read get_Name;
    property Specified: Boolean read get_Specified;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // Windows.Data.Xml.Dom.IXmlDocumentFragment
  // External 
  Xml_Dom_IXmlDocumentFragment = interface(IInspectable)
  ['{E2EA6A96-0C21-44A5-8BC9-9E4A262708EC}']
  end;

  // Windows.Data.Xml.Dom.IXmlText
  // External 
  Xml_Dom_IXmlText = interface(IInspectable)
  ['{F931A4CB-308D-4760-A1D5-43B67450AC7E}']
    function SplitText(offset: Cardinal): Xml_Dom_IXmlText; safecall;
  end;

  // Windows.Data.Xml.Dom.IXmlComment
  // External 
  Xml_Dom_IXmlComment = interface(IInspectable)
  ['{BCA474D5-B61F-4611-9CAC-2E92E3476D47}']
  end;

  // Windows.Data.Xml.Dom.IXmlProcessingInstruction
  // External 
  Xml_Dom_IXmlProcessingInstruction = interface(IInspectable)
  ['{2707FD1E-1E92-4ECE-B6F4-26F069078DDC}']
    function get_Target: HSTRING; safecall;
    function get_Data: HSTRING; safecall;
    procedure put_Data(value: HSTRING); safecall;
    property Data: HSTRING read get_Data write put_Data;
    property Target: HSTRING read get_Target;
  end;

  // Windows.Data.Xml.Dom.IXmlEntityReference
  // External 
  Xml_Dom_IXmlEntityReference = interface(IInspectable)
  ['{2E2F47BC-C3D0-4CCF-BB86-0AB8C36A61CF}']
  end;

  // Windows.Data.Xml.Dom.IXmlCDataSection
  // External 
  Xml_Dom_IXmlCDataSection = interface(IInspectable)
  ['{4D04B46F-C8BD-45B4-8899-0400D7C2C60F}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs_Delegate_Base = interface(IUnknown)
  ['{61C2402F-0ED0-5A18-AB69-59F4AA99A368}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastDismissedEventArgs>
  // External 
  TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs = interface(TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs_Delegate_Base)
  ['{52B78A8E-3D0A-5C4D-BBBA-24FAF495B9D4}']
    procedure Invoke(sender: IToastNotification; args: IToastDismissedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Notifications.IToastDismissedEventArgs
  // External 
  IToastDismissedEventArgs = interface(IInspectable)
  ['{3F89D935-D9CB-4538-A0F0-FFE7659938F8}']
    function get_Reason: ToastDismissalReason; safecall;
    property Reason: ToastDismissalReason read get_Reason;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  TypedEventHandler_2__IToastNotification__IToastFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{95E3E803-C969-5E3A-9753-EA2AD22A9A33}']
  end;
  // Windows.Foundation.TypedEventHandler`2<Windows.UI.Notifications.IToastNotification,Windows.UI.Notifications.IToastFailedEventArgs>
  // External 
  TypedEventHandler_2__IToastNotification__IToastFailedEventArgs = interface(TypedEventHandler_2__IToastNotification__IToastFailedEventArgs_Delegate_Base)
  ['{DB5E9BE6-9CDD-589F-96DA-A4A5D3697DFD}']
    procedure Invoke(sender: IToastNotification; args: IToastFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // Windows.UI.Notifications.IToastFailedEventArgs
  // External 
  IToastFailedEventArgs = interface(IInspectable)
  ['{35176862-CFD4-44F8-AD64-F500FD896C3B}']
    function get_ErrorCode: HRESULT; safecall;
    property ErrorCode: HRESULT read get_ErrorCode;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64_Base = interface(IInspectable)
  ['{AD960E7F-D73B-56E4-A58C-6EC7678CFD88}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // External 
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface(IAsyncOperationWithProgress_2__IBuffer__UInt64_Base)
  ['{AD960E7F-D73B-56E4-A58C-6EC7678CFD88}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64_Delegate_Base = interface(IUnknown)
  ['{D17F5EB6-B422-5E26-A817-7E0FD08F75D5}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // External 
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface(AsyncOperationProgressHandler_2__IBuffer__UInt64_Delegate_Base)
  ['{D17F5EB6-B422-5E26-A817-7E0FD08F75D5}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; progressInfo: UInt64); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64_Delegate_Base = interface(IUnknown)
  ['{ABC81235-39C7-59BF-9948-2D14A93D40FD}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface(AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64_Delegate_Base)
  ['{ABC81235-39C7-59BF-9948-2D14A93D40FD}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64_Base = interface(IInspectable)
  ['{455AA601-F13E-5DEE-B9CB-16B531996327}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // External 
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface(IAsyncOperationWithProgress_2__IInputStream__UInt64_Base)
  ['{455AA601-F13E-5DEE-B9CB-16B531996327}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IInputStream__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64; safecall;
    function GetResults: IInputStream; safecall;
    property Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64_Delegate_Base = interface(IUnknown)
  ['{F9B2E7F6-762F-50DB-95DD-7F6C6EC47090}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // External 
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface(AsyncOperationProgressHandler_2__IInputStream__UInt64_Delegate_Base)
  ['{F9B2E7F6-762F-50DB-95DD-7F6C6EC47090}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; progressInfo: UInt64); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64_Delegate_Base = interface(IUnknown)
  ['{8DB69706-3DD1-5A28-986A-93BE0776D9C3}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface(AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64_Delegate_Base)
  ['{8DB69706-3DD1-5A28-986A-93BE0776D9C3}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64_Base = interface(IInspectable)
  ['{C8BBCB29-6B64-5CE2-A831-038F6E02199E}']
  end;
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // External 
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface(IAsyncOperationWithProgress_2__HSTRING__UInt64_Base)
  ['{C8BBCB29-6B64-5CE2-A831-038F6E02199E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__HSTRING__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64; safecall;
    function GetResults: HSTRING; safecall;
    property Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64_Delegate_Base = interface(IUnknown)
  ['{14DA7DE7-40DF-5D4C-823F-CF310625AD39}']
  end;
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  // External 
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface(AsyncOperationProgressHandler_2__HSTRING__UInt64_Delegate_Base)
  ['{14DA7DE7-40DF-5D4C-823F-CF310625AD39}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; progressInfo: UInt64); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64_Delegate_Base = interface(IUnknown)
  ['{BD75EEBE-E7B5-5AF6-8415-A4B9C9045202}']
  end;
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  // External 
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface(AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64_Delegate_Base)
  ['{BD75EEBE-E7B5-5AF6-8415-A4B9C9045202}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; asyncStatus: AsyncStatus); safecall;
  end;


  // Emit Forwarded classes

implementation

  // Emit Classes Implementation

end.
