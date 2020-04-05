{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Storage;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Foundation, 
  Winapi.Devices.Geolocation, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type

  // MANUAL EDITS to workaround build problems (FIXME)
  AsyncOperationCompletedHandler_1__IStorageFile_Delegate_Base = Winapi.CommonTypes.AsyncOperationCompletedHandler_1__IStorageFile_Delegate_Base;
  AsyncOperationCompletedHandler_1__IStorageFile = Winapi.CommonTypes.AsyncOperationCompletedHandler_1__IStorageFile;
  IAsyncOperation_1__IStorageFile = Winapi.CommonTypes.IAsyncOperation_1__IStorageFile;
  IIterable_1__IStorageItem = Winapi.CommonTypes.IIterable_1__IStorageItem;
  IStorageItem = Winapi.CommonTypes.IStorageItem;
  PIStorageItem = Winapi.CommonTypes.PIStorageItem;
  IIterator_1__IStorageItem = Winapi.CommonTypes.IIterator_1__IStorageItem;
  IStorageFile = Winapi.CommonTypes.IStorageFile;
  // END OF MANUAL EDITS

  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFile>
  IIterator_1__IStorageFile = interface;
  PIIterator_1__IStorageFile = ^IIterator_1__IStorageFile;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  IIterator_1__IStorageFolder = interface;
  PIIterator_1__IStorageFolder = ^IIterator_1__IStorageFolder;

  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFolder>
  IIterable_1__IStorageFolder = interface;
  PIIterable_1__IStorageFolder = ^IIterable_1__IStorageFolder;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFolder>
  IVector_1__IStorageFolder = interface;
  PIVector_1__IStorageFolder = ^IVector_1__IStorageFolder;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  VectorChangedEventHandler_1__IStorageFolder = interface;
  PVectorChangedEventHandler_1__IStorageFolder = ^VectorChangedEventHandler_1__IStorageFolder;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  IObservableVector_1__IStorageFolder = interface;
  PIObservableVector_1__IStorageFolder = ^IObservableVector_1__IStorageFolder;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.SortEntry>
  IIterator_1__Search_SortEntry = interface;
  PIIterator_1__Search_SortEntry = ^IIterator_1__Search_SortEntry;

  // Windows.Storage.Search.IStorageFileQueryResult
  Search_IStorageFileQueryResult = interface;
  PSearch_IStorageFileQueryResult = ^Search_IStorageFileQueryResult;

  // Windows.Storage.ISetVersionDeferral
  ISetVersionDeferral = interface;
  PISetVersionDeferral = ^ISetVersionDeferral;

  // Windows.Storage.ISetVersionRequest
  ISetVersionRequest = interface;
  PISetVersionRequest = ^ISetVersionRequest;

  // Windows.Storage.ApplicationDataSetVersionHandler
  ApplicationDataSetVersionHandler = interface;
  PApplicationDataSetVersionHandler = ^ApplicationDataSetVersionHandler;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>
  IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface;
  PIKeyValuePair_2__HSTRING__IApplicationDataContainer = ^IKeyValuePair_2__HSTRING__IApplicationDataContainer;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = ^IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = ^IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  IMapView_2__HSTRING__IApplicationDataContainer = interface;
  PIMapView_2__HSTRING__IApplicationDataContainer = ^IMapView_2__HSTRING__IApplicationDataContainer;

  // Windows.Storage.IApplicationDataContainer
  IApplicationDataContainer = interface;
  PIApplicationDataContainer = ^IApplicationDataContainer;

  // Windows.Storage.IApplicationData
  IApplicationData = interface;
  PIApplicationData = ^IApplicationData;

  // Windows.Storage.FileProperties.IMusicProperties
  FileProperties_IMusicProperties = interface;
  PFileProperties_IMusicProperties = ^FileProperties_IMusicProperties;

  // Windows.Storage.FileProperties.IVideoProperties
  FileProperties_IVideoProperties = interface;
  PFileProperties_IVideoProperties = ^FileProperties_IVideoProperties;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFile>
  IVector_1__IStorageFile = interface;
  PIVector_1__IStorageFile = ^IVector_1__IStorageFile;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationProgressHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationProgressHandler_2__IBuffer__Cardinal = ^AsyncOperationProgressHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt32>
  IAsyncOperationWithProgress_2__IBuffer__Cardinal = interface;
  PIAsyncOperationWithProgress_2__IBuffer__Cardinal = ^IAsyncOperationWithProgress_2__IBuffer__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface;
  PAsyncOperationCompletedHandler_1__Boolean = ^AsyncOperationCompletedHandler_1__Boolean;

  // Windows.Foundation.IAsyncOperation`1<Boolean>
  IAsyncOperation_1__Boolean = interface;
  PIAsyncOperation_1__Boolean = ^IAsyncOperation_1__Boolean;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Storage.Compression.ICompressor
  Compression_ICompressor = interface;
  PCompression_ICompressor = ^Compression_ICompressor;

  // Windows.Storage.Compression.IDecompressor
  Compression_IDecompressor = interface;
  PCompression_IDecompressor = ^Compression_IDecompressor;

  // Windows.Storage.Compression.ICompressorFactory
  Compression_ICompressorFactory = interface;
  PCompression_ICompressorFactory = ^Compression_ICompressorFactory;

  // Windows.Storage.Compression.IDecompressorFactory
  Compression_IDecompressorFactory = interface;
  PCompression_IDecompressorFactory = ^Compression_IDecompressorFactory;

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

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable = ^AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IAsyncOperation_1__IMapView_2__HSTRING__IInspectable = interface;
  PIAsyncOperation_1__IMapView_2__HSTRING__IInspectable = ^IAsyncOperation_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IIterator_1__IMapView_2__HSTRING__IInspectable = interface;
  PIIterator_1__IMapView_2__HSTRING__IInspectable = ^IIterator_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IIterable_1__IMapView_2__HSTRING__IInspectable = interface;
  PIIterable_1__IMapView_2__HSTRING__IInspectable = ^IIterable_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IVectorView_1__IMapView_2__HSTRING__IInspectable = interface;
  PIVectorView_1__IMapView_2__HSTRING__IInspectable = ^IVectorView_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable = ^AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable = interface;
  PIAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable = ^IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Storage.FileProperties.IGeotagHelperStatics
  FileProperties_IGeotagHelperStatics = interface;
  PFileProperties_IGeotagHelperStatics = ^FileProperties_IGeotagHelperStatics;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationProgressHandler_2__UInt64__UInt64 = ^AsyncOperationProgressHandler_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface;
  PIAsyncOperationWithProgress_2__UInt64__UInt64 = ^IAsyncOperationWithProgress_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable = ^AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  IAsyncOperation_1__IMap_2__HSTRING__IInspectable = interface;
  PIAsyncOperation_1__IMap_2__HSTRING__IInspectable = ^IAsyncOperation_1__IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IMusicProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  IAsyncOperation_1__FileProperties_IMusicProperties = interface;
  PIAsyncOperation_1__FileProperties_IMusicProperties = ^IAsyncOperation_1__FileProperties_IMusicProperties;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IVideoProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  IAsyncOperation_1__FileProperties_IVideoProperties = interface;
  PIAsyncOperation_1__FileProperties_IVideoProperties = ^IAsyncOperation_1__FileProperties_IVideoProperties;

  // Windows.Storage.FileProperties.IImageProperties
  FileProperties_IImageProperties = interface;
  PFileProperties_IImageProperties = ^FileProperties_IImageProperties;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IImageProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IImageProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IImageProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  IAsyncOperation_1__FileProperties_IImageProperties = interface;
  PIAsyncOperation_1__FileProperties_IImageProperties = ^IAsyncOperation_1__FileProperties_IImageProperties;

  // Windows.Storage.FileProperties.IDocumentProperties
  FileProperties_IDocumentProperties = interface;
  PFileProperties_IDocumentProperties = ^FileProperties_IDocumentProperties;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties = interface;
  PAsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties = ^AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  IAsyncOperation_1__FileProperties_IDocumentProperties = interface;
  PIAsyncOperation_1__FileProperties_IDocumentProperties = ^IAsyncOperation_1__FileProperties_IDocumentProperties;

  // Windows.Storage.FileProperties.IStorageItemContentProperties
  FileProperties_IStorageItemContentProperties = interface;
  PFileProperties_IStorageItemContentProperties = ^FileProperties_IStorageItemContentProperties;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  IMapChangedEventArgs_1__HSTRING = interface;
  PIMapChangedEventArgs_1__HSTRING = ^IMapChangedEventArgs_1__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface;
  PMapChangedEventHandler_2__HSTRING__IInspectable = ^MapChangedEventHandler_2__HSTRING__IInspectable;

  // Windows.Foundation.Collections.IObservableMap`2<String,Object>
  IObservableMap_2__HSTRING__IInspectable = interface;
  PIObservableMap_2__HSTRING__IInspectable = ^IObservableMap_2__HSTRING__IInspectable;

  // Windows.Storage.StreamedFileDataRequestedHandler
  StreamedFileDataRequestedHandler = interface;
  PStreamedFileDataRequestedHandler = ^StreamedFileDataRequestedHandler;

  // Windows.Storage.IStorageFileStatics
  IStorageFileStatics = interface;
  PIStorageFileStatics = ^IStorageFileStatics;

  // Windows.Storage.IStorageItem2
  IStorageItem2 = interface;
  PIStorageItem2 = ^IStorageItem2;

  // Windows.Storage.IStorageItemProperties
  IStorageItemProperties = interface;
  PIStorageItemProperties = ^IStorageItemProperties;

  // Windows.Storage.IStorageItemProperties2
  IStorageItemProperties2 = interface;
  PIStorageItemProperties2 = ^IStorageItemProperties2;

  // Windows.Storage.IStorageProvider
  IStorageProvider = interface;
  PIStorageProvider = ^IStorageProvider;

  // Windows.Storage.IStorageItemPropertiesWithProvider
  IStorageItemPropertiesWithProvider = interface;
  PIStorageItemPropertiesWithProvider = ^IStorageItemPropertiesWithProvider;

  // Windows.Storage.IStorageFilePropertiesWithAvailability
  IStorageFilePropertiesWithAvailability = interface;
  PIStorageFilePropertiesWithAvailability = ^IStorageFilePropertiesWithAvailability;

  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface;
  PTypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = ^TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  AsyncOperationCompletedHandler_1__Search_IndexedState = interface;
  PAsyncOperationCompletedHandler_1__Search_IndexedState = ^AsyncOperationCompletedHandler_1__Search_IndexedState;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  IAsyncOperation_1__Search_IndexedState = interface;
  PIAsyncOperation_1__Search_IndexedState = ^IAsyncOperation_1__Search_IndexedState;

  // Windows.Storage.IStorageFile2
  IStorageFile2 = interface;
  PIStorageFile2 = ^IStorageFile2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<String>>
  AsyncOperationCompletedHandler_1__IVector_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__IVector_1__HSTRING = ^AsyncOperationCompletedHandler_1__IVector_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<String>>
  IAsyncOperation_1__IVector_1__HSTRING = interface;
  PIAsyncOperation_1__IVector_1__HSTRING = ^IAsyncOperation_1__IVector_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus = interface;
  PAsyncOperationCompletedHandler_1__Provider_FileUpdateStatus = ^AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  IAsyncOperation_1__Provider_FileUpdateStatus = interface;
  PIAsyncOperation_1__Provider_FileUpdateStatus = ^IAsyncOperation_1__Provider_FileUpdateStatus;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterator_1__AccessCache_AccessListEntry = interface;
  PIIterator_1__AccessCache_AccessListEntry = ^IIterator_1__AccessCache_AccessListEntry;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IKeyValuePair_2__HSTRING__IVector_1__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__IVector_1__HSTRING = ^IKeyValuePair_2__HSTRING__IVector_1__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IMapView_2__HSTRING__IVector_1__HSTRING = interface;
  PIMapView_2__HSTRING__IVector_1__HSTRING = ^IMapView_2__HSTRING__IVector_1__HSTRING;

  // Windows.Foundation.Collections.IMap`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IMap_2__HSTRING__IVector_1__HSTRING = interface;
  PIMap_2__HSTRING__IVector_1__HSTRING = ^IMap_2__HSTRING__IVector_1__HSTRING;

  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable = interface;
  PTypedEventHandler_2__IApplicationData__IInspectable = ^TypedEventHandler_2__IApplicationData__IInspectable;

  // Windows.Storage.IApplicationDataStatics
  IApplicationDataStatics = interface;
  PIApplicationDataStatics = ^IApplicationDataStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  AsyncOperationCompletedHandler_1__IApplicationData = interface;
  PAsyncOperationCompletedHandler_1__IApplicationData = ^AsyncOperationCompletedHandler_1__IApplicationData;

  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  IAsyncOperation_1__IApplicationData = interface;
  PIAsyncOperation_1__IApplicationData = ^IAsyncOperation_1__IApplicationData;

  // Windows.Storage.IApplicationDataStatics2
  IApplicationDataStatics2 = interface;
  PIApplicationDataStatics2 = ^IApplicationDataStatics2;

  // Windows.Storage.IApplicationData2
  IApplicationData2 = interface;
  PIApplicationData2 = ^IApplicationData2;

  // Windows.Storage.IApplicationData3
  IApplicationData3 = interface;
  PIApplicationData3 = ^IApplicationData3;

  // Windows.Storage.Provider.IStorageProviderPropertyCapabilities
  Provider_IStorageProviderPropertyCapabilities = interface;
  PProvider_IStorageProviderPropertyCapabilities = ^Provider_IStorageProviderPropertyCapabilities;

  // Windows.Storage.Provider.IStorageProviderItemProperty
  Provider_IStorageProviderItemProperty = interface;
  PProvider_IStorageProviderItemProperty = ^Provider_IStorageProviderItemProperty;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  IIterator_1__Provider_IStorageProviderItemProperty = interface;
  PIIterator_1__Provider_IStorageProviderItemProperty = ^IIterator_1__Provider_IStorageProviderItemProperty;

  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  IIterable_1__Provider_IStorageProviderItemProperty = interface;
  PIIterable_1__Provider_IStorageProviderItemProperty = ^IIterable_1__Provider_IStorageProviderItemProperty;

  // Windows.Storage.Provider.IStorageProviderItemPropertiesStatics
  Provider_IStorageProviderItemPropertiesStatics = interface;
  PProvider_IStorageProviderItemPropertiesStatics = ^Provider_IStorageProviderItemPropertiesStatics;

  // Windows.Storage.Provider.IStorageProviderItemPropertySource
  Provider_IStorageProviderItemPropertySource = interface;
  PProvider_IStorageProviderItemPropertySource = ^Provider_IStorageProviderItemPropertySource;

  // Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
  Provider_IStorageProviderItemPropertyDefinition = interface;
  PProvider_IStorageProviderItemPropertyDefinition = ^Provider_IStorageProviderItemPropertyDefinition;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IIterator_1__Provider_IStorageProviderItemPropertyDefinition = interface;
  PIIterator_1__Provider_IStorageProviderItemPropertyDefinition = ^IIterator_1__Provider_IStorageProviderItemPropertyDefinition;

  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IIterable_1__Provider_IStorageProviderItemPropertyDefinition = interface;
  PIIterable_1__Provider_IStorageProviderItemPropertyDefinition = ^IIterable_1__Provider_IStorageProviderItemPropertyDefinition;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IVectorView_1__Provider_IStorageProviderItemPropertyDefinition = interface;
  PIVectorView_1__Provider_IStorageProviderItemPropertyDefinition = ^IVectorView_1__Provider_IStorageProviderItemPropertyDefinition;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IVector_1__Provider_IStorageProviderItemPropertyDefinition = interface;
  PIVector_1__Provider_IStorageProviderItemPropertyDefinition = ^IVector_1__Provider_IStorageProviderItemPropertyDefinition;

  // Windows.Storage.Provider.IStorageProviderSyncRootInfo
  Provider_IStorageProviderSyncRootInfo = interface;
  PProvider_IStorageProviderSyncRootInfo = ^Provider_IStorageProviderSyncRootInfo;

  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IIterator_1__Provider_IStorageProviderSyncRootInfo = interface;
  PIIterator_1__Provider_IStorageProviderSyncRootInfo = ^IIterator_1__Provider_IStorageProviderSyncRootInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IIterable_1__Provider_IStorageProviderSyncRootInfo = interface;
  PIIterable_1__Provider_IStorageProviderSyncRootInfo = ^IIterable_1__Provider_IStorageProviderSyncRootInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IVectorView_1__Provider_IStorageProviderSyncRootInfo = interface;
  PIVectorView_1__Provider_IStorageProviderSyncRootInfo = ^IVectorView_1__Provider_IStorageProviderSyncRootInfo;

  // Windows.Storage.Provider.IStorageProviderSyncRootManagerStatics
  Provider_IStorageProviderSyncRootManagerStatics = interface;
  PProvider_IStorageProviderSyncRootManagerStatics = ^Provider_IStorageProviderSyncRootManagerStatics;

  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageItem>
  IVector_1__IStorageItem = interface;
  PIVector_1__IStorageItem = ^IVector_1__IStorageItem;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Storage Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFile>
  IIterator_1__IStorageFile_Base = interface(IInspectable)
  ['{314D2318-74EE-535C-B361-2144DBC573A0}']
  end;
  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFile>
  IIterator_1__IStorageFile = interface(IIterator_1__IStorageFile_Base)
  ['{314D2318-74EE-535C-B361-2144DBC573A0}']
    function get_Current: IStorageFile; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStorageFile): Cardinal; safecall;
    property Current: IStorageFile read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  IIterator_1__IStorageFolder_Base = interface(IInspectable)
  ['{5AAC96FB-B3B9-5A7F-A920-4B5A8DF81168}']
  end;
  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  IIterator_1__IStorageFolder = interface(IIterator_1__IStorageFolder_Base)
  ['{73E42360-10FC-513C-9C38-D7FB007ABBC4}']
    function get_Current: IStorageFolder; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIStorageFolder): Cardinal; safecall;
    property Current: IStorageFolder read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFolder>
  IIterable_1__IStorageFolder_Base = interface(IInspectable)
  ['{4669BEFC-AE5C-52B1-8A97-5466CE61E94E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.IStorageFolder>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.IStorageFolder>
  IIterable_1__IStorageFolder = interface(IIterable_1__IStorageFolder_Base)
  ['{D09B688F-402A-5B3F-B552-1FFA23116952}']
    function First: IIterator_1__IStorageFolder; safecall;
  end;

  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFolder>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFolder>
  IVector_1__IStorageFolder = interface(IInspectable)
  ['{AD736464-7886-5872-88E3-395643C94759}']
    function GetAt(index: Cardinal): IStorageFolder; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IStorageFolder; safecall;
    function IndexOf(value: IStorageFolder; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IStorageFolder); safecall;
    procedure InsertAt(index: Cardinal; value: IStorageFolder); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IStorageFolder); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorageFolder): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIStorageFolder); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  VectorChangedEventHandler_1__IStorageFolder_Delegate_Base = interface(IUnknown)
  ['{2057B641-4B9B-5338-A19A-E9A951916775}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  VectorChangedEventHandler_1__IStorageFolder = interface(VectorChangedEventHandler_1__IStorageFolder_Delegate_Base)
  ['{02B1C206-D4FA-5E88-BD76-9C158F6CFAFF}']
    procedure Invoke(sender: IObservableVector_1__IStorageFolder; event: IVectorChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Storage.IStorageFolder>
  }
  // Windows.Foundation.Collections.IObservableVector`1<Windows.Storage.IStorageFolder>
  IObservableVector_1__IStorageFolder = interface(IInspectable)
  ['{772A1791-7293-589A-A10E-5F888E78FA05}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__IStorageFolder): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.SortEntry>
  IIterator_1__Search_SortEntry_Base = interface(IInspectable)
  ['{520434A2-ACF7-58C9-B47A-2741F2FAC2C2}']
  end;
  {
  // Used Types:  Windows.Storage.Search.SortEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Search.SortEntry>
  IIterator_1__Search_SortEntry = interface(IIterator_1__Search_SortEntry_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Search_SortEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSearch_SortEntry): Cardinal; safecall;
    property Current: Search_SortEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>>
  // Used Types:  UInt32
  }
  // Windows.Storage.Search.IStorageFileQueryResult
  Search_IStorageFileQueryResult = interface(IInspectable)
  ['{52FDA447-2BAA-412C-B29F-D4B1778EFA1E}']
    function GetFilesAsync(startIndex: Cardinal; maxNumberOfItems: Cardinal): IAsyncOperation_1__IVectorView_1__IStorageFile; overload; safecall;
    function GetFilesAsync: IAsyncOperation_1__IVectorView_1__IStorageFile; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Storage.ISetVersionDeferral
  [WinRTClassNameAttribute(SSetVersionDeferral)]
  ISetVersionDeferral = interface(IInspectable)
  ['{033508A2-781A-437A-B078-3F32BADCFE47}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.ISetVersionDeferral
  }
  // Windows.Storage.ISetVersionRequest
  [WinRTClassNameAttribute(SSetVersionRequest)]
  ISetVersionRequest = interface(IInspectable)
  ['{B9C76B9B-1056-4E69-8330-162619956F9B}']
    function get_CurrentVersion: Cardinal; safecall;
    function get_DesiredVersion: Cardinal; safecall;
    function GetDeferral: ISetVersionDeferral; safecall;
    property CurrentVersion: Cardinal read get_CurrentVersion;
    property DesiredVersion: Cardinal read get_DesiredVersion;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.ISetVersionRequest
  }
  // Windows.Storage.ApplicationDataSetVersionHandler
  ApplicationDataSetVersionHandler = interface(IUnknown)
  ['{A05791E6-CC9F-4687-ACAB-A364FD785463}']
    procedure Invoke(setVersionRequest: ISetVersionRequest); safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Storage.IApplicationDataContainer
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>
  IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface(IInspectable)
  ['{9C29CDD1-F5FA-5E4B-BC39-A1FDB2E48959}']
    function get_Key: HSTRING; safecall;
    function get_Value: IApplicationDataContainer; safecall;
    property Key: HSTRING read get_Key;
    property Value: IApplicationDataContainer read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer_Base = interface(IInspectable)
  ['{AF3C131D-67AA-5C8D-AE0E-272BA24AE74F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface(IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer_Base)
  ['{C00495D1-304D-5005-8F60-35610C7A70A1}']
    function get_Current: IKeyValuePair_2__HSTRING__IApplicationDataContainer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IApplicationDataContainer): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IApplicationDataContainer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer_Base = interface(IInspectable)
  ['{A785BE1D-159E-53AD-9553-598B03DCA048}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Storage.IApplicationDataContainer>>
  IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer = interface(IIterable_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer_Base)
  ['{BE784D1D-41C6-557E-8776-DFDEF79D733E}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IApplicationDataContainer; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  IMapView_2__HSTRING__IApplicationDataContainer_Base = interface(IInspectable)
  ['{13624F8D-85CC-5780-A78D-64DBA58F2C3C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IApplicationDataContainer
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  IMapView_2__HSTRING__IApplicationDataContainer = interface(IMapView_2__HSTRING__IApplicationDataContainer_Base)
  ['{EB2E8596-3B90-592B-83DE-3A1AFD8B48A7}']
    function Lookup(key: HSTRING): IApplicationDataContainer; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IApplicationDataContainer; out second: IMapView_2__HSTRING__IApplicationDataContainer); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.ApplicationDataLocality
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Storage.IApplicationDataContainer>
  // Used Types:  Windows.Storage.IApplicationDataContainer
  // Used Types:  Windows.Storage.ApplicationDataCreateDisposition
  }
  // Windows.Storage.IApplicationDataContainer
  [WinRTClassNameAttribute(SApplicationDataContainer)]
  IApplicationDataContainer = interface(IInspectable)
  ['{C5AEFD1E-F467-40BA-8566-AB640A441E1D}']
    function get_Name: HSTRING; safecall;
    function get_Locality: ApplicationDataLocality; safecall;
    function get_Values: IPropertySet; safecall;
    function get_Containers: IMapView_2__HSTRING__IApplicationDataContainer; safecall;
    function CreateContainer(name: HSTRING; disposition: ApplicationDataCreateDisposition): IApplicationDataContainer; safecall;
    procedure DeleteContainer(name: HSTRING); safecall;
    property Containers: IMapView_2__HSTRING__IApplicationDataContainer read get_Containers;
    property Locality: ApplicationDataLocality read get_Locality;
    property Name: HSTRING read get_Name;
    property Values: IPropertySet read get_Values;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.ApplicationDataSetVersionHandler
  // Used Types:  Windows.Storage.ApplicationDataLocality
  // Used Types:  Windows.Storage.IApplicationDataContainer
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  // Used Types:  UInt64
  }
  // Windows.Storage.IApplicationData
  [WinRTClassNameAttribute(SApplicationData)]
  IApplicationData = interface(IInspectable)
  ['{C3DA6FB7-B744-4B45-B0B8-223A0938D0DC}']
    function get_Version: Cardinal; safecall;
    function SetVersionAsync(desiredVersion: Cardinal; handler: ApplicationDataSetVersionHandler): IAsyncAction; safecall;
    function ClearAsync: IAsyncAction; overload; safecall;
    function ClearAsync(locality: ApplicationDataLocality): IAsyncAction; overload; safecall;
    function get_LocalSettings: IApplicationDataContainer; safecall;
    function get_RoamingSettings: IApplicationDataContainer; safecall;
    function get_LocalFolder: IStorageFolder; safecall;
    function get_RoamingFolder: IStorageFolder; safecall;
    function get_TemporaryFolder: IStorageFolder; safecall;
    function add_DataChanged(handler: TypedEventHandler_2__IApplicationData__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DataChanged(token: EventRegistrationToken); safecall;
    procedure SignalDataChanged; safecall;
    function get_RoamingStorageQuota: UInt64; safecall;
    property LocalFolder: IStorageFolder read get_LocalFolder;
    property LocalSettings: IApplicationDataContainer read get_LocalSettings;
    property RoamingFolder: IStorageFolder read get_RoamingFolder;
    property RoamingSettings: IApplicationDataContainer read get_RoamingSettings;
    property RoamingStorageQuota: UInt64 read get_RoamingStorageQuota;
    property TemporaryFolder: IStorageFolder read get_TemporaryFolder;
    property Version: Cardinal read get_Version;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Storage.FileProperties.IMusicProperties
  FileProperties_IMusicProperties = interface(IInspectable)
  ['{BC8AAB62-66EC-419A-BC5D-CA65A4CB46DA}']
    function get_Album: HSTRING; safecall;
    procedure put_Album(value: HSTRING); safecall;
    function get_Artist: HSTRING; safecall;
    procedure put_Artist(value: HSTRING); safecall;
    function get_Genre: IVector_1__HSTRING; safecall;
    function get_TrackNumber: Cardinal; safecall;
    procedure put_TrackNumber(value: Cardinal); safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Rating: Cardinal; safecall;
    procedure put_Rating(value: Cardinal); safecall;
    function get_Duration: TimeSpan; safecall;
    function get_Bitrate: Cardinal; safecall;
    function get_AlbumArtist: HSTRING; safecall;
    procedure put_AlbumArtist(value: HSTRING); safecall;
    function get_Composers: IVector_1__HSTRING; safecall;
    function get_Conductors: IVector_1__HSTRING; safecall;
    function get_Subtitle: HSTRING; safecall;
    procedure put_Subtitle(value: HSTRING); safecall;
    function get_Producers: IVector_1__HSTRING; safecall;
    function get_Publisher: HSTRING; safecall;
    procedure put_Publisher(value: HSTRING); safecall;
    function get_Writers: IVector_1__HSTRING; safecall;
    function get_Year: Cardinal; safecall;
    procedure put_Year(value: Cardinal); safecall;
    property Album: HSTRING read get_Album write put_Album;
    property AlbumArtist: HSTRING read get_AlbumArtist write put_AlbumArtist;
    property Artist: HSTRING read get_Artist write put_Artist;
    property Bitrate: Cardinal read get_Bitrate;
    property Composers: IVector_1__HSTRING read get_Composers;
    property Conductors: IVector_1__HSTRING read get_Conductors;
    property Duration: TimeSpan read get_Duration;
    property Genre: IVector_1__HSTRING read get_Genre;
    property Producers: IVector_1__HSTRING read get_Producers;
    property Publisher: HSTRING read get_Publisher write put_Publisher;
    property Rating: Cardinal read get_Rating write put_Rating;
    property Subtitle: HSTRING read get_Subtitle write put_Subtitle;
    property Title: HSTRING read get_Title write put_Title;
    property TrackNumber: Cardinal read get_TrackNumber write put_TrackNumber;
    property Writers: IVector_1__HSTRING read get_Writers;
    property Year: Cardinal read get_Year write put_Year;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  String
  // Used Types:  Windows.Storage.FileProperties.VideoOrientation
  }
  // Windows.Storage.FileProperties.IVideoProperties
  FileProperties_IVideoProperties = interface(IInspectable)
  ['{719AE507-68DE-4DB8-97DE-49998C059F2F}']
    function get_Rating: Cardinal; safecall;
    procedure put_Rating(value: Cardinal); safecall;
    function get_Keywords: IVector_1__HSTRING; safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_Duration: TimeSpan; safecall;
    function get_Latitude: IReference_1__Double; safecall;
    function get_Longitude: IReference_1__Double; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Subtitle: HSTRING; safecall;
    procedure put_Subtitle(value: HSTRING); safecall;
    function get_Producers: IVector_1__HSTRING; safecall;
    function get_Publisher: HSTRING; safecall;
    procedure put_Publisher(value: HSTRING); safecall;
    function get_Writers: IVector_1__HSTRING; safecall;
    function get_Year: Cardinal; safecall;
    procedure put_Year(value: Cardinal); safecall;
    function get_Bitrate: Cardinal; safecall;
    function get_Directors: IVector_1__HSTRING; safecall;
    function get_Orientation: FileProperties_VideoOrientation; safecall;
    property Bitrate: Cardinal read get_Bitrate;
    property Directors: IVector_1__HSTRING read get_Directors;
    property Duration: TimeSpan read get_Duration;
    property Height: Cardinal read get_Height;
    property Keywords: IVector_1__HSTRING read get_Keywords;
    property Latitude: IReference_1__Double read get_Latitude;
    property Longitude: IReference_1__Double read get_Longitude;
    property Orientation: FileProperties_VideoOrientation read get_Orientation;
    property Producers: IVector_1__HSTRING read get_Producers;
    property Publisher: HSTRING read get_Publisher write put_Publisher;
    property Rating: Cardinal read get_Rating write put_Rating;
    property Subtitle: HSTRING read get_Subtitle write put_Subtitle;
    property Title: HSTRING read get_Title write put_Title;
    property Width: Cardinal read get_Width;
    property Writers: IVector_1__HSTRING read get_Writers;
    property Year: Cardinal read get_Year write put_Year;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageFile>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFile>
  IVector_1__IStorageFile = interface(IInspectable)
  ['{021A3F69-AD1E-5FB9-978A-056984AE2B2D}']
    function GetAt(index: Cardinal): IStorageFile; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IStorageFile; safecall;
    function IndexOf(value: IStorageFile; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IStorageFile); safecall;
    procedure InsertAt(index: Cardinal; value: IStorageFile); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IStorageFile); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorageFile): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIStorageFile); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface(IUnknown)
  ['{9343B6E7-E3D2-5E4A-AB2D-2BCE4919A6A4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface(IInspectable)
  ['{EF60385F-BE78-584B-AAEF-7829ADA2B0DE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Cardinal); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Cardinal; safecall;
    function GetResults: Cardinal; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Cardinal read get_Completed write put_Completed;
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
  // Used Types:  Windows.Foundation.IMemoryBufferReference
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface(IUnknown)
  ['{F4637D4A-0760-5431-BFC0-24EB1D4F6C4F}']
    procedure Invoke(sender: IMemoryBufferReference; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Storage.Compression.ICompressor
  [WinRTClassNameAttribute(SCompression_Compressor)]
  Compression_ICompressor = interface(IInspectable)
  ['{0AC3645A-57AC-4EE1-B702-84D39D5424E0}']
    function FinishAsync: IAsyncOperation_1__Boolean; safecall;
    function DetachStream: IOutputStream; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Storage.Compression.IDecompressor
  [WinRTClassNameAttribute(SCompression_Decompressor)]
  Compression_IDecompressor = interface(IInspectable)
  ['{B883FE46-D68A-4C8B-ADA0-4EE813FC5283}']
    function DetachStream: IInputStream; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Compression.ICompressor
  // Used Types:  Windows.Storage.Streams.IOutputStream
  // Used Types:  Windows.Storage.Compression.CompressAlgorithm
  // Used Types:  UInt32
  }
  // Windows.Storage.Compression.ICompressorFactory
  [WinRTClassNameAttribute(SCompression_Compressor)]
  Compression_ICompressorFactory = interface(IInspectable)
  ['{5F3D96A4-2CFB-442C-A8BA-D7D11B039DA0}']
    function CreateCompressor(underlyingStream: IOutputStream): Compression_ICompressor; safecall;
    function CreateCompressorEx(underlyingStream: IOutputStream; algorithm: Compression_CompressAlgorithm; blockSize: Cardinal): Compression_ICompressor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Compression.IDecompressor
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Storage.Compression.IDecompressorFactory
  [WinRTClassNameAttribute(SCompression_Decompressor)]
  Compression_IDecompressorFactory = interface(IInspectable)
  ['{5337E252-1DA2-42E1-8834-0379D28D742F}']
    function CreateDecompressor(underlyingStream: IInputStream): Compression_IDecompressor; safecall;
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

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable_Delegate_Base = interface(IUnknown)
  ['{89981889-1207-5AE6-9B28-CCC58F3AAC6E}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable = interface(AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable_Delegate_Base)
  ['{89981889-1207-5AE6-9B28-CCC58F3AAC6E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMapView_2__HSTRING__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IAsyncOperation_1__IMapView_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{5DCBEE48-9965-51DA-A461-177C885BE7E5}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IAsyncOperation_1__IMapView_2__HSTRING__IInspectable = interface(IAsyncOperation_1__IMapView_2__HSTRING__IInspectable_Base)
  ['{5DCBEE48-9965-51DA-A461-177C885BE7E5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable; safecall;
    function GetResults: IMapView_2__HSTRING__IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMapView_2__HSTRING__IInspectable read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IIterator_1__IMapView_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{53A2E825-9BF1-5083-8A7B-9D94F312DADE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IIterator_1__IMapView_2__HSTRING__IInspectable = interface(IIterator_1__IMapView_2__HSTRING__IInspectable_Base)
  ['{53A2E825-9BF1-5083-8A7B-9D94F312DADE}']
    function get_Current: IMapView_2__HSTRING__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMapView_2__HSTRING__IInspectable): Cardinal; safecall;
    property Current: IMapView_2__HSTRING__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IIterable_1__IMapView_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{E1670FAE-49CD-5C47-A8C8-F6FA2C650C6C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IIterable_1__IMapView_2__HSTRING__IInspectable = interface(IIterable_1__IMapView_2__HSTRING__IInspectable_Base)
  ['{E1670FAE-49CD-5C47-A8C8-F6FA2C650C6C}']
    function First: IIterator_1__IMapView_2__HSTRING__IInspectable; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  IVectorView_1__IMapView_2__HSTRING__IInspectable = interface(IInspectable)
  ['{172A655B-B3B8-5EAE-BC2E-A6A1F1708B4B}']
    function GetAt(index: Cardinal): IMapView_2__HSTRING__IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMapView_2__HSTRING__IInspectable; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMapView_2__HSTRING__IInspectable): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable_Delegate_Base = interface(IUnknown)
  ['{A782A13A-16A0-5326-B985-C4CA49E54E77}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable_Delegate_Base)
  ['{A782A13A-16A0-5326-B985-C4CA49E54E77}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{FC227365-219D-5D59-8B5B-58EB0A91CA0A}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String,Object>>>
  IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable = interface(IAsyncOperation_1__IVectorView_1__IMapView_2__HSTRING__IInspectable_Base)
  ['{FC227365-219D-5D59-8B5B-58EB0A91CA0A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable; safecall;
    function GetResults: IVectorView_1__IMapView_2__HSTRING__IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IMapView_2__HSTRING__IInspectable read get_Completed write put_Completed;
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
  // Used Types:  Double
  }
  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface(IInspectable)
  ['{2F2D6C29-5473-5F3E-92E7-96572BB990E2}']
    function get_Value: Double; safecall;
    property Value: Double read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Geolocation.IGeopoint>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.Geolocation.IGeolocator
  // Used Types:  Windows.Devices.Geolocation.IGeopoint
  }
  // Windows.Storage.FileProperties.IGeotagHelperStatics
  [WinRTClassNameAttribute(SFileProperties_GeotagHelper)]
  FileProperties_IGeotagHelperStatics = interface(IInspectable)
  ['{41493244-2524-4655-86A6-ED16F5FC716B}']
    function GetGeotagAsync(&file: IStorageFile): IAsyncOperation_1__IInspectable{Geolocation_IGeopoint}; safecall;
    function SetGeotagFromGeolocatorAsync(&file: IStorageFile; geolocator: IInspectable{Geolocation_IGeolocator}): IAsyncAction; safecall;
    function SetGeotagAsync(&file: IStorageFile; geopoint: IInspectable{Geolocation_IGeopoint}): IAsyncAction; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{FFB2B65D-4120-5D13-826D-107851E6BB1C}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface(IUnknown)
  ['{D2024E41-5500-5B5A-BA46-CB7009596A2F}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__UInt64__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface(IInspectable)
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
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable_Delegate_Base = interface(IUnknown)
  ['{7344F356-8399-5756-A2F8-ABD50C4146FF}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable = interface(AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable_Delegate_Base)
  ['{7344F356-8399-5756-A2F8-ABD50C4146FF}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMap_2__HSTRING__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  IAsyncOperation_1__IMap_2__HSTRING__IInspectable_Base = interface(IInspectable)
  ['{127E39C7-07C1-58E5-B48E-3A4729839FEC}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Object>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  IAsyncOperation_1__IMap_2__HSTRING__IInspectable = interface(IAsyncOperation_1__IMap_2__HSTRING__IInspectable_Base)
  ['{127E39C7-07C1-58E5-B48E-3A4729839FEC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable; safecall;
    function GetResults: IMap_2__HSTRING__IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable read get_Completed write put_Completed;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<String>
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

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties_Delegate_Base = interface(IUnknown)
  ['{D84E1312-D661-5B7F-9566-7421BDEDC1EA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties_Delegate_Base)
  ['{AE688CD9-E302-5657-82B5-1B974D1FA81F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IMusicProperties; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  IAsyncOperation_1__FileProperties_IMusicProperties_Base = interface(IInspectable)
  ['{0D023B76-20A7-56F3-84AB-CE31E6544B71}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IMusicProperties>
  // Used Types:  Windows.Storage.FileProperties.IMusicProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  IAsyncOperation_1__FileProperties_IMusicProperties = interface(IAsyncOperation_1__FileProperties_IMusicProperties_Base)
  ['{D3A7B974-3A90-55E8-82D0-D22F2A7B4856}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties; safecall;
    function GetResults: FileProperties_IMusicProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IMusicProperties read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties_Delegate_Base = interface(IUnknown)
  ['{43401D34-61AB-5CF2-921F-55B616631D1D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties_Delegate_Base)
  ['{75953071-FA00-5044-9240-B48C6CEF57B0}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IVideoProperties; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  IAsyncOperation_1__FileProperties_IVideoProperties_Base = interface(IInspectable)
  ['{447D4590-D3F9-58BF-AC58-6F9A50839EFE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IVideoProperties>
  // Used Types:  Windows.Storage.FileProperties.IVideoProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  IAsyncOperation_1__FileProperties_IVideoProperties = interface(IAsyncOperation_1__FileProperties_IVideoProperties_Base)
  ['{C5B61E97-459B-5AA8-B350-2CF55E7C7D47}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties; safecall;
    function GetResults: FileProperties_IVideoProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IVideoProperties read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  Windows.Storage.FileProperties.PhotoOrientation
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Storage.FileProperties.IImageProperties
  FileProperties_IImageProperties = interface(IInspectable)
  ['{523C9424-FCFF-4275-AFEE-ECDB9AB47973}']
    function get_Rating: Cardinal; safecall;
    procedure put_Rating(value: Cardinal); safecall;
    function get_Keywords: IVector_1__HSTRING; safecall;
    function get_DateTaken: DateTime; safecall;
    procedure put_DateTaken(value: DateTime); safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Latitude: IReference_1__Double; safecall;
    function get_Longitude: IReference_1__Double; safecall;
    function get_CameraManufacturer: HSTRING; safecall;
    procedure put_CameraManufacturer(value: HSTRING); safecall;
    function get_CameraModel: HSTRING; safecall;
    procedure put_CameraModel(value: HSTRING); safecall;
    function get_Orientation: FileProperties_PhotoOrientation; safecall;
    function get_PeopleNames: IVectorView_1__HSTRING; safecall;
    property CameraManufacturer: HSTRING read get_CameraManufacturer write put_CameraManufacturer;
    property CameraModel: HSTRING read get_CameraModel write put_CameraModel;
    property DateTaken: DateTime read get_DateTaken write put_DateTaken;
    property Height: Cardinal read get_Height;
    property Keywords: IVector_1__HSTRING read get_Keywords;
    property Latitude: IReference_1__Double read get_Latitude;
    property Longitude: IReference_1__Double read get_Longitude;
    property Orientation: FileProperties_PhotoOrientation read get_Orientation;
    property PeopleNames: IVectorView_1__HSTRING read get_PeopleNames;
    property Rating: Cardinal read get_Rating write put_Rating;
    property Title: HSTRING read get_Title write put_Title;
    property Width: Cardinal read get_Width;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IImageProperties_Delegate_Base = interface(IUnknown)
  ['{C63729BC-E4C3-564C-B137-2CB4F5966A83}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IImageProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IImageProperties_Delegate_Base)
  ['{3E47A7AF-FC5E-5D68-A93B-98CEA696089D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IImageProperties; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  IAsyncOperation_1__FileProperties_IImageProperties_Base = interface(IInspectable)
  ['{FCD07511-E7F8-5BDA-8C04-795A639DAE8F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IImageProperties>
  // Used Types:  Windows.Storage.FileProperties.IImageProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  IAsyncOperation_1__FileProperties_IImageProperties = interface(IAsyncOperation_1__FileProperties_IImageProperties_Base)
  ['{6248A622-38DA-5FC3-AA6B-374D26DAC6BA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IImageProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IImageProperties; safecall;
    function GetResults: FileProperties_IImageProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IImageProperties read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  String
  }
  // Windows.Storage.FileProperties.IDocumentProperties
  FileProperties_IDocumentProperties = interface(IInspectable)
  ['{7EAB19BC-1821-4923-B4A9-0AEA404D0070}']
    function get_Author: IVector_1__HSTRING; safecall;
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Keywords: IVector_1__HSTRING; safecall;
    function get_Comment: HSTRING; safecall;
    procedure put_Comment(value: HSTRING); safecall;
    property Author: IVector_1__HSTRING read get_Author;
    property Comment: HSTRING read get_Comment write put_Comment;
    property Keywords: IVector_1__HSTRING read get_Keywords;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties_Delegate_Base = interface(IUnknown)
  ['{4452ED4C-642B-501B-9617-7D68B4AC3C66}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties = interface(AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties_Delegate_Base)
  ['{E4B7DD5B-B84A-5EF6-884A-5383529B637B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__FileProperties_IDocumentProperties; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  IAsyncOperation_1__FileProperties_IDocumentProperties_Base = interface(IInspectable)
  ['{6C86E97C-5699-5700-8D35-D350AD3E4DF2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.FileProperties.IDocumentProperties>
  // Used Types:  Windows.Storage.FileProperties.IDocumentProperties
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  IAsyncOperation_1__FileProperties_IDocumentProperties = interface(IAsyncOperation_1__FileProperties_IDocumentProperties_Base)
  ['{A861F227-13B9-5FA3-A62E-01F9C918BA48}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties; safecall;
    function GetResults: FileProperties_IDocumentProperties; safecall;
    property Completed: AsyncOperationCompletedHandler_1__FileProperties_IDocumentProperties read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IMusicProperties>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IVideoProperties>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IImageProperties>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.FileProperties.IDocumentProperties>
  }
  // Windows.Storage.FileProperties.IStorageItemContentProperties
  FileProperties_IStorageItemContentProperties = interface(IInspectable)
  ['{05294BAD-BC38-48BF-85D7-770E0E2AE0BA}']
    function GetMusicPropertiesAsync: IAsyncOperation_1__FileProperties_IMusicProperties; safecall;
    function GetVideoPropertiesAsync: IAsyncOperation_1__FileProperties_IVideoProperties; safecall;
    function GetImagePropertiesAsync: IAsyncOperation_1__FileProperties_IImageProperties; safecall;
    function GetDocumentPropertiesAsync: IAsyncOperation_1__FileProperties_IDocumentProperties; safecall;
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Storage.StreamedFileDataRequestedHandler
  StreamedFileDataRequestedHandler = interface(IUnknown)
  ['{FEF6A824-2FE1-4D07-A35B-B77C50B5F4CC}']
    procedure Invoke(stream: IOutputStream); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.StreamedFileDataRequestedHandler
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Storage.IStorageFileStatics
  [WinRTClassNameAttribute(SStorageFile)]
  IStorageFileStatics = interface(IInspectable)
  ['{5984C710-DAF2-43C8-8BB4-A4D3EACFD03F}']
    function GetFileFromPathAsync(path: HSTRING): IAsyncOperation_1__IStorageFile; safecall;
    function GetFileFromApplicationUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__IStorageFile; safecall;
    function CreateStreamedFileAsync(displayNameWithExtension: HSTRING; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
    function ReplaceWithStreamedFileAsync(fileToReplace: IStorageFile; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
    function CreateStreamedFileFromUriAsync(displayNameWithExtension: HSTRING; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
    function ReplaceWithStreamedFileFromUriAsync(fileToReplace: IStorageFile; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.IStorageItem
  }
  // Windows.Storage.IStorageItem2
  IStorageItem2 = interface(IInspectable)
  ['{53F926D2-083C-4283-B45B-81C007237E44}']
    function GetParentAsync: IAsyncOperation_1__IStorageFolder; safecall;
    function IsEqual(item: IStorageItem): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // Used Types:  Windows.Storage.FileProperties.ThumbnailMode
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.FileProperties.ThumbnailOptions
  // Used Types:  String
  // Used Types:  Windows.Storage.FileProperties.IStorageItemContentProperties
  }
  // Windows.Storage.IStorageItemProperties
  IStorageItemProperties = interface(IInspectable)
  ['{86664478-8029-46FE-A789-1C2F3E2FFB5C}']
    function GetThumbnailAsync(mode: FileProperties_ThumbnailMode): IAsyncOperation_1__IRandomAccessStreamWithContentType; overload; safecall;
    function GetThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal): IAsyncOperation_1__IRandomAccessStreamWithContentType; overload; safecall;
    function GetThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal; options: FileProperties_ThumbnailOptions): IAsyncOperation_1__IRandomAccessStreamWithContentType; overload; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_DisplayType: HSTRING; safecall;
    function get_FolderRelativeId: HSTRING; safecall;
    function get_Properties: FileProperties_IStorageItemContentProperties; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property DisplayType: HSTRING read get_DisplayType;
    property FolderRelativeId: HSTRING read get_FolderRelativeId;
    property Properties: FileProperties_IStorageItemContentProperties read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // Used Types:  Windows.Storage.FileProperties.ThumbnailMode
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.FileProperties.ThumbnailOptions
  }
  // Windows.Storage.IStorageItemProperties2
  IStorageItemProperties2 = interface(IInspectable)
  ['{8E86A951-04B9-4BD2-929D-FEF3F71621D0}']
    function GetScaledImageAsThumbnailAsync(mode: FileProperties_ThumbnailMode): IAsyncOperation_1__IRandomAccessStreamWithContentType; overload; safecall;
    function GetScaledImageAsThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal): IAsyncOperation_1__IRandomAccessStreamWithContentType; overload; safecall;
    function GetScaledImageAsThumbnailAsync(mode: FileProperties_ThumbnailMode; requestedSize: Cardinal; options: FileProperties_ThumbnailOptions): IAsyncOperation_1__IRandomAccessStreamWithContentType; overload; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Storage.IStorageProvider
  IStorageProvider = interface(IInspectable)
  ['{E705EED4-D478-47D6-BA46-1A8EBE114A20}']
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageProvider
  }
  // Windows.Storage.IStorageItemPropertiesWithProvider
  IStorageItemPropertiesWithProvider = interface(IInspectable)
  ['{861BF39B-6368-4DEE-B40E-74684A5CE714}']
    function get_Provider: IStorageProvider; safecall;
    property Provider: IStorageProvider read get_Provider;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Storage.IStorageFilePropertiesWithAvailability
  IStorageFilePropertiesWithAvailability = interface(IInspectable)
  ['{AFCBBE9B-582B-4133-9648-E44CA46EE491}']
    function get_IsAvailable: Boolean; safecall;
    property IsAvailable: Boolean read get_IsAvailable;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Search.IStorageQueryResultBase
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface(IUnknown)
  ['{4BA22861-00C4-597F-B6BF-3AF516F3B870}']
    procedure Invoke(sender: Search_IStorageQueryResultBase; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  AsyncOperationCompletedHandler_1__Search_IndexedState_Delegate_Base = interface(IUnknown)
  ['{B67A3CBA-F5F7-5E51-968A-385126D1F918}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  AsyncOperationCompletedHandler_1__Search_IndexedState = interface(AsyncOperationCompletedHandler_1__Search_IndexedState_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Search_IndexedState; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  IAsyncOperation_1__Search_IndexedState_Base = interface(IInspectable)
  ['{88694B1F-F380-574D-8A05-4F67BD52CD11}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Search.IndexedState>
  // Used Types:  Windows.Storage.Search.IndexedState
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Search.IndexedState>
  IAsyncOperation_1__Search_IndexedState = interface(IAsyncOperation_1__Search_IndexedState_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Search_IndexedState); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Search_IndexedState; safecall;
    function GetResults: Search_IndexedState; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Search_IndexedState read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStream>
  // Used Types:  Windows.Storage.FileAccessMode
  // Used Types:  Windows.Storage.StorageOpenOptions
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageStreamTransaction>
  }
  // Windows.Storage.IStorageFile2
  IStorageFile2 = interface(IInspectable)
  ['{954E4BCF-0A77-42FB-B777-C2ED58A52E44}']
    function OpenAsync(accessMode: FileAccessMode; options: StorageOpenOptions): IAsyncOperation_1__IRandomAccessStream; safecall;
    function OpenTransactedWriteAsync(options: StorageOpenOptions): IAsyncOperation_1__IStorageStreamTransaction; safecall;
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

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<String>>
  AsyncOperationCompletedHandler_1__IVector_1__HSTRING_Delegate_Base = interface(IUnknown)
  ['{FAE4B396-97C8-5CC3-BF88-EA3098EDF6B2}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<String>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<String>>
  AsyncOperationCompletedHandler_1__IVector_1__HSTRING = interface(AsyncOperationCompletedHandler_1__IVector_1__HSTRING_Delegate_Base)
  ['{FAE4B396-97C8-5CC3-BF88-EA3098EDF6B2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVector_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<String>>
  IAsyncOperation_1__IVector_1__HSTRING_Base = interface(IInspectable)
  ['{92B02CD3-AA6E-573D-BC03-8D2309CBA3EB}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<String>>
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<String>>
  IAsyncOperation_1__IVector_1__HSTRING = interface(IAsyncOperation_1__IVector_1__HSTRING_Base)
  ['{92B02CD3-AA6E-573D-BC03-8D2309CBA3EB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVector_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVector_1__HSTRING; safecall;
    function GetResults: IVector_1__HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVector_1__HSTRING read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus_Delegate_Base = interface(IUnknown)
  ['{BB185A07-0285-5F37-9C7D-2FC6A3E0E6E5}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus = interface(AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Provider_FileUpdateStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  IAsyncOperation_1__Provider_FileUpdateStatus_Base = interface(IInspectable)
  ['{8F0F439E-87D0-531F-85B1-54F4528F29C3}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.Provider.FileUpdateStatus>
  // Used Types:  Windows.Storage.Provider.FileUpdateStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.Provider.FileUpdateStatus>
  IAsyncOperation_1__Provider_FileUpdateStatus = interface(IAsyncOperation_1__Provider_FileUpdateStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus; safecall;
    function GetResults: Provider_FileUpdateStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Provider_FileUpdateStatus read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterator_1__AccessCache_AccessListEntry_Base = interface(IInspectable)
  ['{D1A0A6C4-889D-519B-8508-26241B329B7E}']
  end;
  {
  // Used Types:  Windows.Storage.AccessCache.AccessListEntry
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.AccessCache.AccessListEntry>
  IIterator_1__AccessCache_AccessListEntry = interface(IIterator_1__AccessCache_AccessListEntry_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: AccessCache_AccessListEntry; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAccessCache_AccessListEntry): Cardinal; safecall;
    property Current: AccessCache_AccessListEntry read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IKeyValuePair_2__HSTRING__IVector_1__HSTRING = interface(IInspectable)
  ['{174F26C7-79EA-5F7C-BD70-AC4457F2CAC8}']
    function get_Key: HSTRING; safecall;
    function get_Value: IVector_1__HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: IVector_1__HSTRING read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING_Base = interface(IInspectable)
  ['{A11824C9-E458-502A-AFD8-CE3CE0ABD6FE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING = interface(IIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING_Base)
  ['{A11824C9-E458-502A-AFD8-CE3CE0ABD6FE}']
    function get_Current: IKeyValuePair_2__HSTRING__IVector_1__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IVector_1__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IVector_1__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING_Base = interface(IInspectable)
  ['{4FED2669-D0D3-59F6-91D9-95902D728D6A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVector`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING = interface(IIterable_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING_Base)
  ['{4FED2669-D0D3-59F6-91D9-95902D728D6A}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IVector_1__HSTRING; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IMapView_2__HSTRING__IVector_1__HSTRING_Base = interface(IInspectable)
  ['{153F9C9C-D22A-5C9E-9C74-8B85C908B000}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVector`1<String>>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IMapView_2__HSTRING__IVector_1__HSTRING = interface(IMapView_2__HSTRING__IVector_1__HSTRING_Base)
  ['{153F9C9C-D22A-5C9E-9C74-8B85C908B000}']
    function Lookup(key: HSTRING): IVector_1__HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IVector_1__HSTRING; out second: IMapView_2__HSTRING__IVector_1__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVector`1<String>>
  }
  // Windows.Foundation.Collections.IMap`2<String,Windows.Foundation.Collections.IVector`1<String>>
  IMap_2__HSTRING__IVector_1__HSTRING = interface(IInspectable)
  ['{E475CA9D-6AFB-5992-993E-53E6EF7A9ECD}']
    function Lookup(key: HSTRING): IVector_1__HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__IVector_1__HSTRING; safecall;
    function Insert(key: HSTRING; value: IVector_1__HSTRING): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable_Delegate_Base = interface(IUnknown)
  ['{B5348B3B-5081-5AE9-8FA3-4D22D68FB0EA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IApplicationData
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.IApplicationData,Object>
  TypedEventHandler_2__IApplicationData__IInspectable = interface(TypedEventHandler_2__IApplicationData__IInspectable_Delegate_Base)
  ['{4E72D889-3D9A-5E3B-AA8A-3B37D17226DC}']
    procedure Invoke(sender: IApplicationData; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IApplicationData
  }
  // Windows.Storage.IApplicationDataStatics
  [WinRTClassNameAttribute(SApplicationData)]
  IApplicationDataStatics = interface(IInspectable)
  ['{5612147B-E843-45E3-94D8-06169E3C8E17}']
    function get_Current: IApplicationData; safecall;
    property Current: IApplicationData read get_Current;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  AsyncOperationCompletedHandler_1__IApplicationData_Delegate_Base = interface(IUnknown)
  ['{ABAFE590-65FE-520A-9D7C-6AB5F1882237}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  AsyncOperationCompletedHandler_1__IApplicationData = interface(AsyncOperationCompletedHandler_1__IApplicationData_Delegate_Base)
  ['{C30AEE19-A1A1-5CBD-9B91-DCC5DB72F16B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IApplicationData; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  IAsyncOperation_1__IApplicationData_Base = interface(IInspectable)
  ['{31456B58-A5CB-5C5B-BD6E-CCCE3A7BF4B4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Storage.IApplicationData>
  // Used Types:  Windows.Storage.IApplicationData
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  IAsyncOperation_1__IApplicationData = interface(IAsyncOperation_1__IApplicationData_Base)
  ['{141FA633-8D79-53C8-991A-60A5DA990CAE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IApplicationData); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IApplicationData; safecall;
    function GetResults: IApplicationData; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IApplicationData read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IApplicationData>
  // Used Types:  Windows.System.IUser
  }
  // Windows.Storage.IApplicationDataStatics2
  [WinRTClassNameAttribute(SApplicationData)]
  IApplicationDataStatics2 = interface(IInspectable)
  ['{CD606211-CF49-40A4-A47C-C7F0DBBA8107}']
    function GetForUserAsync(user: IInspectable{IUser}): IAsyncOperation_1__IApplicationData; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Storage.IApplicationData2
  IApplicationData2 = interface(IInspectable)
  ['{9E65CD69-0BA3-4E32-BE29-B02DE6607638}']
    function get_LocalCacheFolder: IStorageFolder; safecall;
    property LocalCacheFolder: IStorageFolder read get_LocalCacheFolder;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Storage.IApplicationData3
  IApplicationData3 = interface(IInspectable)
  ['{DC222CF4-2772-4C1D-AA2C-C9F743ADE8D1}']
    function GetPublisherCacheFolder(folderName: HSTRING): IStorageFolder; safecall;
    function ClearPublisherCacheFolderAsync(folderName: HSTRING): IAsyncAction; safecall;
    function get_SharedLocalFolder: IStorageFolder; safecall;
    property SharedLocalFolder: IStorageFolder read get_SharedLocalFolder;
  end;

  {
  // Used Types:  Boolean
  // Used Types:  String
  }
  // Windows.Storage.Provider.IStorageProviderPropertyCapabilities
  Provider_IStorageProviderPropertyCapabilities = interface(IInspectable)
  ['{658D2F0E-63B7-4567-ACF9-51ABE301DDA5}']
    function IsPropertySupported(propertyCanonicalName: HSTRING): Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  String
  }
  // Windows.Storage.Provider.IStorageProviderItemProperty
  [WinRTClassNameAttribute(SProvider_StorageProviderItemProperty)]
  Provider_IStorageProviderItemProperty = interface(IInspectable)
  ['{476CB558-730B-4188-B7B5-63B716ED476D}']
    procedure put_Id(value: Integer); safecall;
    function get_Id: Integer; safecall;
    procedure put_Value(value: HSTRING); safecall;
    function get_Value: HSTRING; safecall;
    procedure put_IconResource(value: HSTRING); safecall;
    function get_IconResource: HSTRING; safecall;
    property IconResource: HSTRING read get_IconResource write put_IconResource;
    property Id: Integer read get_Id write put_Id;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  IIterator_1__Provider_IStorageProviderItemProperty_Base = interface(IInspectable)
  ['{0C6DDDDE-1AA3-54F5-B139-E4A237DC1C5F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderItemProperty
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  IIterator_1__Provider_IStorageProviderItemProperty = interface(IIterator_1__Provider_IStorageProviderItemProperty_Base)
  ['{BB037BEF-95D6-5868-B5AC-4398D6EFC162}']
    function get_Current: Provider_IStorageProviderItemProperty; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PProvider_IStorageProviderItemProperty): Cardinal; safecall;
    property Current: Provider_IStorageProviderItemProperty read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  IIterable_1__Provider_IStorageProviderItemProperty_Base = interface(IInspectable)
  ['{4584CB69-EE26-59E0-B05D-C9A7851A7317}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  IIterable_1__Provider_IStorageProviderItemProperty = interface(IIterable_1__Provider_IStorageProviderItemProperty_Base)
  ['{CF281CBB-1B32-591A-9346-6444C59E1D72}']
    function First: IIterator_1__Provider_IStorageProviderItemProperty; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  }
  // Windows.Storage.Provider.IStorageProviderItemPropertiesStatics
  [WinRTClassNameAttribute(SProvider_StorageProviderItemProperties)]
  Provider_IStorageProviderItemPropertiesStatics = interface(IInspectable)
  ['{2D2C1C97-2704-4729-8FA9-7E6B8E158C2F}']
    function SetAsync(item: IStorageItem; itemProperties: IIterable_1__Provider_IStorageProviderItemProperty): IAsyncAction; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemProperty>
  // Used Types:  String
  }
  // Windows.Storage.Provider.IStorageProviderItemPropertySource
  Provider_IStorageProviderItemPropertySource = interface(IInspectable)
  ['{8F6F9C3E-F632-4A9B-8D99-D2D7A11DF56A}']
    function GetItemProperties(itemPath: HSTRING): IIterable_1__Provider_IStorageProviderItemProperty; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  String
  }
  // Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
  [WinRTClassNameAttribute(SProvider_StorageProviderItemPropertyDefinition)]
  Provider_IStorageProviderItemPropertyDefinition = interface(IInspectable)
  ['{C5B383BB-FF1F-4298-831E-FF1C08089690}']
    function get_Id: Integer; safecall;
    procedure put_Id(value: Integer); safecall;
    function get_DisplayNameResource: HSTRING; safecall;
    procedure put_DisplayNameResource(value: HSTRING); safecall;
    property DisplayNameResource: HSTRING read get_DisplayNameResource write put_DisplayNameResource;
    property Id: Integer read get_Id write put_Id;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IIterator_1__Provider_IStorageProviderItemPropertyDefinition_Base = interface(IInspectable)
  ['{55E5719D-2BDA-521F-8C60-6921D90B0BB1}']
  end;
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IIterator_1__Provider_IStorageProviderItemPropertyDefinition = interface(IIterator_1__Provider_IStorageProviderItemPropertyDefinition_Base)
  ['{3427A4E8-5546-57AC-891A-B0FF7CF8EA9E}']
    function get_Current: Provider_IStorageProviderItemPropertyDefinition; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PProvider_IStorageProviderItemPropertyDefinition): Cardinal; safecall;
    property Current: Provider_IStorageProviderItemPropertyDefinition read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IIterable_1__Provider_IStorageProviderItemPropertyDefinition_Base = interface(IInspectable)
  ['{41E78B90-1A7F-5DAB-A123-7D5F5011DFEB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IIterable_1__Provider_IStorageProviderItemPropertyDefinition = interface(IIterable_1__Provider_IStorageProviderItemPropertyDefinition_Base)
  ['{A21B7E41-0D3E-57F7-B529-726665A04F54}']
    function First: IIterator_1__Provider_IStorageProviderItemPropertyDefinition; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IVectorView_1__Provider_IStorageProviderItemPropertyDefinition = interface(IInspectable)
  ['{A550E99C-4754-5A2D-91A4-F09EBF454C95}']
    function GetAt(index: Cardinal): Provider_IStorageProviderItemPropertyDefinition; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Provider_IStorageProviderItemPropertyDefinition; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PProvider_IStorageProviderItemPropertyDefinition): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  IVector_1__Provider_IStorageProviderItemPropertyDefinition = interface(IInspectable)
  ['{3963ACFA-643D-5006-A90F-037D698C4387}']
    function GetAt(index: Cardinal): Provider_IStorageProviderItemPropertyDefinition; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Provider_IStorageProviderItemPropertyDefinition; safecall;
    function IndexOf(value: Provider_IStorageProviderItemPropertyDefinition; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Provider_IStorageProviderItemPropertyDefinition); safecall;
    procedure InsertAt(index: Cardinal; value: Provider_IStorageProviderItemPropertyDefinition); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Provider_IStorageProviderItemPropertyDefinition); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PProvider_IStorageProviderItemPropertyDefinition): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PProvider_IStorageProviderItemPropertyDefinition); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Storage.Provider.StorageProviderHydrationPolicy
  // Used Types:  Windows.Storage.Provider.StorageProviderHydrationPolicyModifier
  // Used Types:  Windows.Storage.Provider.StorageProviderPopulationPolicy
  // Used Types:  Windows.Storage.Provider.StorageProviderInSyncPolicy
  // Used Types:  Windows.Storage.Provider.StorageProviderHardlinkPolicy
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.Provider.StorageProviderProtectionMode
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Storage.Provider.IStorageProviderItemPropertyDefinition>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Storage.Provider.IStorageProviderSyncRootInfo
  [WinRTClassNameAttribute(SProvider_StorageProviderSyncRootInfo)]
  Provider_IStorageProviderSyncRootInfo = interface(IInspectable)
  ['{7C1305C4-99F9-41AC-8904-AB055D654926}']
    function get_Id: HSTRING; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_Context: IBuffer; safecall;
    procedure put_Context(value: IBuffer); safecall;
    function get_Path: IStorageFolder; safecall;
    procedure put_Path(folder: IStorageFolder); safecall;
    function get_DisplayNameResource: HSTRING; safecall;
    procedure put_DisplayNameResource(value: HSTRING); safecall;
    function get_IconResource: HSTRING; safecall;
    procedure put_IconResource(value: HSTRING); safecall;
    function get_HydrationPolicy: Provider_StorageProviderHydrationPolicy; safecall;
    procedure put_HydrationPolicy(value: Provider_StorageProviderHydrationPolicy); safecall;
    function get_HydrationPolicyModifier: Provider_StorageProviderHydrationPolicyModifier; safecall;
    procedure put_HydrationPolicyModifier(value: Provider_StorageProviderHydrationPolicyModifier); safecall;
    function get_PopulationPolicy: Provider_StorageProviderPopulationPolicy; safecall;
    procedure put_PopulationPolicy(value: Provider_StorageProviderPopulationPolicy); safecall;
    function get_InSyncPolicy: Provider_StorageProviderInSyncPolicy; safecall;
    procedure put_InSyncPolicy(value: Provider_StorageProviderInSyncPolicy); safecall;
    function get_HardlinkPolicy: Provider_StorageProviderHardlinkPolicy; safecall;
    procedure put_HardlinkPolicy(value: Provider_StorageProviderHardlinkPolicy); safecall;
    function get_ShowSiblingsAsGroup: Boolean; safecall;
    procedure put_ShowSiblingsAsGroup(value: Boolean); safecall;
    function get_Version: HSTRING; safecall;
    procedure put_Version(value: HSTRING); safecall;
    function get_ProtectionMode: Provider_StorageProviderProtectionMode; safecall;
    procedure put_ProtectionMode(value: Provider_StorageProviderProtectionMode); safecall;
    function get_AllowPinning: Boolean; safecall;
    procedure put_AllowPinning(value: Boolean); safecall;
    function get_StorageProviderItemPropertyDefinitions: IVector_1__Provider_IStorageProviderItemPropertyDefinition; safecall;
    function get_RecycleBinUri: IUriRuntimeClass; safecall;
    procedure put_RecycleBinUri(value: IUriRuntimeClass); safecall;
    property AllowPinning: Boolean read get_AllowPinning write put_AllowPinning;
    property Context: IBuffer read get_Context write put_Context;
    property DisplayNameResource: HSTRING read get_DisplayNameResource write put_DisplayNameResource;
    property HardlinkPolicy: Provider_StorageProviderHardlinkPolicy read get_HardlinkPolicy write put_HardlinkPolicy;
    property HydrationPolicy: Provider_StorageProviderHydrationPolicy read get_HydrationPolicy write put_HydrationPolicy;
    property HydrationPolicyModifier: Provider_StorageProviderHydrationPolicyModifier read get_HydrationPolicyModifier write put_HydrationPolicyModifier;
    property IconResource: HSTRING read get_IconResource write put_IconResource;
    property Id: HSTRING read get_Id write put_Id;
    property InSyncPolicy: Provider_StorageProviderInSyncPolicy read get_InSyncPolicy write put_InSyncPolicy;
    property Path: IStorageFolder read get_Path write put_Path;
    property PopulationPolicy: Provider_StorageProviderPopulationPolicy read get_PopulationPolicy write put_PopulationPolicy;
    property ProtectionMode: Provider_StorageProviderProtectionMode read get_ProtectionMode write put_ProtectionMode;
    property RecycleBinUri: IUriRuntimeClass read get_RecycleBinUri write put_RecycleBinUri;
    property ShowSiblingsAsGroup: Boolean read get_ShowSiblingsAsGroup write put_ShowSiblingsAsGroup;
    property StorageProviderItemPropertyDefinitions: IVector_1__Provider_IStorageProviderItemPropertyDefinition read get_StorageProviderItemPropertyDefinitions;
    property Version: HSTRING read get_Version write put_Version;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IIterator_1__Provider_IStorageProviderSyncRootInfo_Base = interface(IInspectable)
  ['{F73F72C9-6BF9-5F24-95AF-7264E5516423}']
  end;
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderSyncRootInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IIterator_1__Provider_IStorageProviderSyncRootInfo = interface(IIterator_1__Provider_IStorageProviderSyncRootInfo_Base)
  ['{EC16ACE5-8024-5247-9513-CD3D7CA3C12C}']
    function get_Current: Provider_IStorageProviderSyncRootInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PProvider_IStorageProviderSyncRootInfo): Cardinal; safecall;
    property Current: Provider_IStorageProviderSyncRootInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IIterable_1__Provider_IStorageProviderSyncRootInfo_Base = interface(IInspectable)
  ['{62BA69A0-F65C-502C-9782-B4BC25194D11}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IIterable_1__Provider_IStorageProviderSyncRootInfo = interface(IIterable_1__Provider_IStorageProviderSyncRootInfo_Base)
  ['{B13B7ACA-9C63-50A1-8555-64E420EA59F1}']
    function First: IIterator_1__Provider_IStorageProviderSyncRootInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderSyncRootInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  IVectorView_1__Provider_IStorageProviderSyncRootInfo = interface(IInspectable)
  ['{2B4BBBA2-1C96-5417-988E-9F2A39BA0596}']
    function GetAt(index: Cardinal): Provider_IStorageProviderSyncRootInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Provider_IStorageProviderSyncRootInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PProvider_IStorageProviderSyncRootInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Provider.IStorageProviderSyncRootInfo
  // Used Types:  String
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Provider.IStorageProviderSyncRootInfo>
  }
  // Windows.Storage.Provider.IStorageProviderSyncRootManagerStatics
  [WinRTClassNameAttribute(SProvider_StorageProviderSyncRootManager)]
  Provider_IStorageProviderSyncRootManagerStatics = interface(IInspectable)
  ['{3E99FBBF-8FE3-4B40-ABC7-F6FC3D74C98E}']
    procedure Register(syncRootInformation: Provider_IStorageProviderSyncRootInfo); safecall;
    procedure Unregister(id: HSTRING); safecall;
    function GetSyncRootInformationForFolder(folder: IStorageFolder): Provider_IStorageProviderSyncRootInfo; safecall;
    function GetSyncRootInformationForId(id: HSTRING): Provider_IStorageProviderSyncRootInfo; safecall;
    function GetCurrentSyncRoots: IVectorView_1__Provider_IStorageProviderSyncRootInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageItem
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Storage.IStorageItem>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageItem>
  IVector_1__IStorageItem = interface(IInspectable)
  ['{802508E2-9C2C-5B91-89A8-39BCF7223344}']
    function GetAt(index: Cardinal): IStorageItem; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IStorageItem; safecall;
    function IndexOf(value: IStorageItem; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IStorageItem); safecall;
    procedure InsertAt(index: Cardinal; value: IStorageItem); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IStorageItem); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIStorageItem): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIStorageItem); safecall;
    property Size: Cardinal read get_Size;
  end;


  // Emit Forwarded classes
  // Windows.Storage.Compression.Compressor
  // DualAPI
  // Implements: Windows.Storage.Compression.ICompressor
  // Implements: Windows.Storage.Streams.IOutputStream
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Storage.Compression.ICompressorFactory"
  TCompression_Compressor = class(TWinRTGenericImportF<Compression_ICompressorFactory>)
  public
    // -> Compression_ICompressorFactory
    class function CreateCompressor(underlyingStream: IOutputStream): Compression_ICompressor; static; inline;
    class function CreateCompressorEx(underlyingStream: IOutputStream; algorithm: Compression_CompressAlgorithm; blockSize: Cardinal): Compression_ICompressor; static; inline;
  end;

  // Windows.Storage.Compression.Decompressor
  // DualAPI
  // Implements: Windows.Storage.Compression.IDecompressor
  // Implements: Windows.Storage.Streams.IInputStream
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Storage.Compression.IDecompressorFactory"
  TCompression_Decompressor = class(TWinRTGenericImportF<Compression_IDecompressorFactory>)
  public
    // -> Compression_IDecompressorFactory
    class function CreateDecompressor(underlyingStream: IInputStream): Compression_IDecompressor; static; inline;
  end;

  // Windows.Storage.FileProperties.GeotagHelper
  // DualAPI
  // Statics: "Windows.Storage.FileProperties.IGeotagHelperStatics"
  TFileProperties_GeotagHelper = class(TWinRTGenericImportS<FileProperties_IGeotagHelperStatics>)
  public
    // -> FileProperties_IGeotagHelperStatics
    class function GetGeotagAsync(&file: IStorageFile): IAsyncOperation_1__IInspectable{Geolocation_IGeopoint}; static; inline;
    class function SetGeotagFromGeolocatorAsync(&file: IStorageFile; geolocator: IInspectable{Geolocation_IGeolocator}): IAsyncAction; static; inline;
    class function SetGeotagAsync(&file: IStorageFile; geopoint: IInspectable{Geolocation_IGeopoint}): IAsyncAction; static; inline;
  end;

  // Windows.Storage.StorageFile
  // WinRT Only
  // WhiteListed
  // Implements: Windows.Storage.IStorageFile
  // Implements: Windows.Storage.Streams.IInputStreamReference
  // Implements: Windows.Storage.Streams.IRandomAccessStreamReference
  // Implements: Windows.Storage.IStorageItem
  // Implements: Windows.Storage.IStorageItemProperties
  // Implements: Windows.Storage.IStorageItemProperties2
  // Implements: Windows.Storage.IStorageItem2
  // Implements: Windows.Storage.IStorageItemPropertiesWithProvider
  // Implements: Windows.Storage.IStorageFilePropertiesWithAvailability
  // Implements: Windows.Storage.IStorageFile2
  // Statics: "Windows.Storage.IStorageFileStatics"
  TStorageFile = class(TWinRTGenericImportS<IStorageFileStatics>)
  public
    // -> IStorageFileStatics
    class function GetFileFromPathAsync(path: HSTRING): IAsyncOperation_1__IStorageFile; static; inline;
    class function GetFileFromApplicationUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__IStorageFile; static; inline;
    class function CreateStreamedFileAsync(displayNameWithExtension: HSTRING; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; static; inline;
    class function ReplaceWithStreamedFileAsync(fileToReplace: IStorageFile; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; static; inline;
    class function CreateStreamedFileFromUriAsync(displayNameWithExtension: HSTRING; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; static; inline;
    class function ReplaceWithStreamedFileFromUriAsync(fileToReplace: IStorageFile; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile; static; inline;
  end;

  // Windows.Storage.ApplicationData
  // DualAPI
  // Implements: Windows.Storage.IApplicationData
  // Implements: Windows.Storage.IApplicationData2
  // Implements: Windows.Storage.IApplicationData3
  // Statics: "Windows.Storage.IApplicationDataStatics"
  // Statics: "Windows.Storage.IApplicationDataStatics2"
  TApplicationData = class(TWinRTGenericImportS2<IApplicationDataStatics, IApplicationDataStatics2>)
  public
    // -> IApplicationDataStatics
    class function get_Current: IApplicationData; static; inline;
    class property Current: IApplicationData read get_Current;

    // -> IApplicationDataStatics2
    class function GetForUserAsync(user: IInspectable{IUser}): IAsyncOperation_1__IApplicationData; static; inline;
  end;

  // Windows.Storage.SetVersionRequest
  // DualAPI
  // Implements: Windows.Storage.ISetVersionRequest

  // Windows.Storage.ApplicationDataContainer
  // DualAPI
  // Implements: Windows.Storage.IApplicationDataContainer

  // Windows.Storage.SetVersionDeferral
  // DualAPI
  // Implements: Windows.Storage.ISetVersionDeferral

  // Windows.Storage.ApplicationDataContainerSettings
  // DualAPI
  // Implements: Windows.Foundation.Collections.IPropertySet
  // Implements: Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>

  // Windows.Storage.ApplicationDataCompositeValue
  // DualAPI
  // Implements: Windows.Foundation.Collections.IPropertySet
  // Implements: Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IMap`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  // Instantiable: "IPropertySet"
  TApplicationDataCompositeValue = class(TWinRTGenericImportI<IPropertySet>) end;

  // Windows.Storage.Provider.StorageProviderItemProperty
  // DualAPI
  // Implements: Windows.Storage.Provider.IStorageProviderItemProperty
  // Instantiable: "Provider_IStorageProviderItemProperty"
  TProvider_StorageProviderItemProperty = class(TWinRTGenericImportI<Provider_IStorageProviderItemProperty>) end;

  // Windows.Storage.Provider.StorageProviderItemProperties
  // DualAPI
  // Statics: "Windows.Storage.Provider.IStorageProviderItemPropertiesStatics"
  TProvider_StorageProviderItemProperties = class(TWinRTGenericImportS<Provider_IStorageProviderItemPropertiesStatics>)
  public
    // -> Provider_IStorageProviderItemPropertiesStatics
    class function SetAsync(item: IStorageItem; itemProperties: IIterable_1__Provider_IStorageProviderItemProperty): IAsyncAction; static; inline;
  end;

  // Windows.Storage.Provider.StorageProviderItemPropertyDefinition
  // DualAPI
  // Implements: Windows.Storage.Provider.IStorageProviderItemPropertyDefinition
  // Instantiable: "Provider_IStorageProviderItemPropertyDefinition"
  TProvider_StorageProviderItemPropertyDefinition = class(TWinRTGenericImportI<Provider_IStorageProviderItemPropertyDefinition>) end;

  // Windows.Storage.Provider.StorageProviderSyncRootInfo
  // DualAPI
  // Implements: Windows.Storage.Provider.IStorageProviderSyncRootInfo
  // Instantiable: "Provider_IStorageProviderSyncRootInfo"
  TProvider_StorageProviderSyncRootInfo = class(TWinRTGenericImportI<Provider_IStorageProviderSyncRootInfo>) end;

  // Windows.Storage.Provider.StorageProviderSyncRootManager
  // DualAPI
  // Statics: "Windows.Storage.Provider.IStorageProviderSyncRootManagerStatics"
  TProvider_StorageProviderSyncRootManager = class(TWinRTGenericImportS<Provider_IStorageProviderSyncRootManagerStatics>)
  public
    // -> Provider_IStorageProviderSyncRootManagerStatics
    class procedure Register(syncRootInformation: Provider_IStorageProviderSyncRootInfo); static; inline;
    class procedure Unregister(id: HSTRING); static; inline;
    class function GetSyncRootInformationForFolder(folder: IStorageFolder): Provider_IStorageProviderSyncRootInfo; static; inline;
    class function GetSyncRootInformationForId(id: HSTRING): Provider_IStorageProviderSyncRootInfo; static; inline;
    class function GetCurrentSyncRoots: IVectorView_1__Provider_IStorageProviderSyncRootInfo; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TCompression_Compressor }
// Factories for : "Compression_Compressor"
// Factory: "Windows.Storage.Compression.ICompressorFactory"
// -> Compression_ICompressorFactory

class function TCompression_Compressor.CreateCompressor(underlyingStream: IOutputStream): Compression_ICompressor;
begin
  Result := Factory.CreateCompressor(underlyingStream);
end;

class function TCompression_Compressor.CreateCompressorEx(underlyingStream: IOutputStream; algorithm: Compression_CompressAlgorithm; blockSize: Cardinal): Compression_ICompressor;
begin
  Result := Factory.CreateCompressorEx(underlyingStream, algorithm, blockSize);
end;


 { TCompression_Decompressor }
// Factories for : "Compression_Decompressor"
// Factory: "Windows.Storage.Compression.IDecompressorFactory"
// -> Compression_IDecompressorFactory

class function TCompression_Decompressor.CreateDecompressor(underlyingStream: IInputStream): Compression_IDecompressor;
begin
  Result := Factory.CreateDecompressor(underlyingStream);
end;


 { TFileProperties_GeotagHelper }

class function TFileProperties_GeotagHelper.GetGeotagAsync(&file: IStorageFile): IAsyncOperation_1__IInspectable{Geolocation_IGeopoint};
begin
  Result := Statics.GetGeotagAsync(&file);
end;

class function TFileProperties_GeotagHelper.SetGeotagFromGeolocatorAsync(&file: IStorageFile; geolocator: IInspectable{Geolocation_IGeolocator}): IAsyncAction;
begin
  Result := Statics.SetGeotagFromGeolocatorAsync(&file, geolocator);
end;

class function TFileProperties_GeotagHelper.SetGeotagAsync(&file: IStorageFile; geopoint: IInspectable{Geolocation_IGeopoint}): IAsyncAction;
begin
  Result := Statics.SetGeotagAsync(&file, geopoint);
end;


 { TStorageFile }

class function TStorageFile.GetFileFromPathAsync(path: HSTRING): IAsyncOperation_1__IStorageFile;
begin
  Result := Statics.GetFileFromPathAsync(path);
end;

class function TStorageFile.GetFileFromApplicationUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__IStorageFile;
begin
  Result := Statics.GetFileFromApplicationUriAsync(uri);
end;

class function TStorageFile.CreateStreamedFileAsync(displayNameWithExtension: HSTRING; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile;
begin
  Result := Statics.CreateStreamedFileAsync(displayNameWithExtension, dataRequested, thumbnail);
end;

class function TStorageFile.ReplaceWithStreamedFileAsync(fileToReplace: IStorageFile; dataRequested: StreamedFileDataRequestedHandler; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile;
begin
  Result := Statics.ReplaceWithStreamedFileAsync(fileToReplace, dataRequested, thumbnail);
end;

class function TStorageFile.CreateStreamedFileFromUriAsync(displayNameWithExtension: HSTRING; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile;
begin
  Result := Statics.CreateStreamedFileFromUriAsync(displayNameWithExtension, uri, thumbnail);
end;

class function TStorageFile.ReplaceWithStreamedFileFromUriAsync(fileToReplace: IStorageFile; uri: IUriRuntimeClass; thumbnail: IRandomAccessStreamReference): IAsyncOperation_1__IStorageFile;
begin
  Result := Statics.ReplaceWithStreamedFileFromUriAsync(fileToReplace, uri, thumbnail);
end;


 { TApplicationData }

class function TApplicationData.get_Current: IApplicationData;
begin
  Result := Statics.get_Current;
end;


class function TApplicationData.GetForUserAsync(user: IInspectable{IUser}): IAsyncOperation_1__IApplicationData;
begin
  Result := Statics2.GetForUserAsync(user);
end;


 { TApplicationDataCompositeValue }

 { TProvider_StorageProviderItemProperty }

 { TProvider_StorageProviderItemProperties }

class function TProvider_StorageProviderItemProperties.SetAsync(item: IStorageItem; itemProperties: IIterable_1__Provider_IStorageProviderItemProperty): IAsyncAction;
begin
  Result := Statics.SetAsync(item, itemProperties);
end;


 { TProvider_StorageProviderItemPropertyDefinition }

 { TProvider_StorageProviderSyncRootInfo }

 { TProvider_StorageProviderSyncRootManager }

class procedure TProvider_StorageProviderSyncRootManager.Register(syncRootInformation: Provider_IStorageProviderSyncRootInfo);
begin
  Statics.Register(syncRootInformation);
end;

class procedure TProvider_StorageProviderSyncRootManager.Unregister(id: HSTRING);
begin
  Statics.Unregister(id);
end;

class function TProvider_StorageProviderSyncRootManager.GetSyncRootInformationForFolder(folder: IStorageFolder): Provider_IStorageProviderSyncRootInfo;
begin
  Result := Statics.GetSyncRootInformationForFolder(folder);
end;

class function TProvider_StorageProviderSyncRootManager.GetSyncRootInformationForId(id: HSTRING): Provider_IStorageProviderSyncRootInfo;
begin
  Result := Statics.GetSyncRootInformationForId(id);
end;

class function TProvider_StorageProviderSyncRootManager.GetCurrentSyncRoots: IVectorView_1__Provider_IStorageProviderSyncRootInfo;
begin
  Result := Statics.GetCurrentSyncRoots;
end;



end.
