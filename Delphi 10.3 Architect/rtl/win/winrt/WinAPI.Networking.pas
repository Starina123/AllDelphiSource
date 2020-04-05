{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Networking;

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
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Networking.IEndpointPair
  IEndpointPair = interface;
  PIEndpointPair = ^IEndpointPair;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.IEndpointPair>
  IIterator_1__IEndpointPair = interface;
  PIIterator_1__IEndpointPair = ^IIterator_1__IEndpointPair;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.IEndpointPair>
  IIterable_1__IEndpointPair = interface;
  PIIterable_1__IEndpointPair = ^IIterable_1__IEndpointPair;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>
  IVectorView_1__IEndpointPair = interface;
  PIVectorView_1__IEndpointPair = ^IVectorView_1__IEndpointPair;

  // Windows.Networking.IHostNameStatics
  IHostNameStatics = interface;
  PIHostNameStatics = ^IHostNameStatics;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.Networking.IHostNameFactory
  IHostNameFactory = interface;
  PIHostNameFactory = ^IHostNameFactory;

  // Windows.Networking.IEndpointPairFactory
  IEndpointPairFactory = interface;
  PIEndpointPairFactory = ^IEndpointPairFactory;

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

  // Windows.Foundation.IReference`1<Guid>
  IReference_1__TGuid = interface;
  PIReference_1__TGuid = ^IReference_1__TGuid;

  // Windows.Foundation.Collections.IIterator`1<UInt8>
  IIterator_1__Byte = interface;
  PIIterator_1__Byte = ^IIterator_1__Byte;

  // Windows.Foundation.Collections.IIterable`1<UInt8>
  IIterable_1__Byte = interface;
  PIIterable_1__Byte = ^IIterable_1__Byte;

  // Windows.Foundation.Collections.IVectorView`1<UInt8>
  IVectorView_1__Byte = interface;
  PIVectorView_1__Byte = ^IVectorView_1__Byte;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.IHostName>
  IIterator_1__IHostName = interface;
  PIIterator_1__IHostName = ^IIterator_1__IHostName;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.IHostName>
  IIterable_1__IHostName = interface;
  PIIterable_1__IHostName = ^IIterable_1__IHostName;

  // Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface;
  PIReference_1__Boolean = ^IReference_1__Boolean;

  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface;
  PIIterator_1__Cardinal = ^IIterator_1__Cardinal;

  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface;
  PIIterable_1__Cardinal = ^IIterable_1__Cardinal;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface;
  PIVectorView_1__Cardinal = ^IVectorView_1__Cardinal;

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

  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__HSTRING = ^IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface;
  PIMapView_2__HSTRING__HSTRING = ^IMapView_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IIterator_1__BackgroundTransfer_BackgroundTransferFileRange = interface;
  PIIterator_1__BackgroundTransfer_BackgroundTransferFileRange = ^IIterator_1__BackgroundTransfer_BackgroundTransferFileRange;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IIterable_1__BackgroundTransfer_BackgroundTransferFileRange = interface;
  PIIterable_1__BackgroundTransfer_BackgroundTransferFileRange = ^IIterable_1__BackgroundTransfer_BackgroundTransferFileRange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IVectorView_1__BackgroundTransfer_BackgroundTransferFileRange = interface;
  PIVectorView_1__BackgroundTransfer_BackgroundTransferFileRange = ^IVectorView_1__BackgroundTransfer_BackgroundTransferFileRange;

  // Windows.Foundation.Collections.IVector`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IVector_1__BackgroundTransfer_BackgroundTransferFileRange = interface;
  PIVector_1__BackgroundTransfer_BackgroundTransferFileRange = ^IVector_1__BackgroundTransfer_BackgroundTransferFileRange;

  // Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs
  BackgroundTransfer_IBackgroundTransferRangesDownloadedEventArgs = interface;
  PBackgroundTransfer_IBackgroundTransferRangesDownloadedEventArgs = ^BackgroundTransfer_IBackgroundTransferRangesDownloadedEventArgs;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair = ^AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  IAsyncOperation_1__IVectorView_1__IEndpointPair = interface;
  PIAsyncOperation_1__IVectorView_1__IEndpointPair = ^IAsyncOperation_1__IVectorView_1__IEndpointPair;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Foundation.Collections.IVector`1<Windows.Networking.IHostName>
  IVector_1__IHostName = interface;
  PIVector_1__IHostName = ^IVector_1__IHostName;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveDeviceAddress,Object>
  TypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable = interface;
  PTypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable = ^TypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable;

  // Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  XboxLive_IXboxLiveDeviceAddress = interface;
  PXboxLive_IXboxLiveDeviceAddress = ^XboxLive_IXboxLiveDeviceAddress;

  // Windows.Networking.XboxLive.IXboxLiveDeviceAddressStatics
  XboxLive_IXboxLiveDeviceAddressStatics = interface;
  PXboxLive_IXboxLiveDeviceAddressStatics = ^XboxLive_IXboxLiveDeviceAddressStatics;

  // Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs
  XboxLive_IXboxLiveEndpointPairStateChangedEventArgs = interface;
  PXboxLive_IXboxLiveEndpointPairStateChangedEventArgs = ^XboxLive_IXboxLiveEndpointPairStateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPair,Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs>
  TypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs = interface;
  PTypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs = ^TypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate,Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs>
  TypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs = interface;
  PTypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs = ^TypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs;

  // Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult
  XboxLive_IXboxLiveEndpointPairCreationResult = interface;
  PXboxLive_IXboxLiveEndpointPairCreationResult = ^XboxLive_IXboxLiveEndpointPairCreationResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult = interface;
  PAsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult = ^AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult = interface;
  PIAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult = ^IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IIterator_1__XboxLive_IXboxLiveEndpointPair = interface;
  PIIterator_1__XboxLive_IXboxLiveEndpointPair = ^IIterator_1__XboxLive_IXboxLiveEndpointPair;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IIterable_1__XboxLive_IXboxLiveEndpointPair = interface;
  PIIterable_1__XboxLive_IXboxLiveEndpointPair = ^IIterable_1__XboxLive_IXboxLiveEndpointPair;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IVectorView_1__XboxLive_IXboxLiveEndpointPair = interface;
  PIVectorView_1__XboxLive_IXboxLiveEndpointPair = ^IVectorView_1__XboxLive_IXboxLiveEndpointPair;

  // Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  XboxLive_IXboxLiveEndpointPairTemplate = interface;
  PXboxLive_IXboxLiveEndpointPairTemplate = ^XboxLive_IXboxLiveEndpointPairTemplate;

  // Windows.Networking.XboxLive.IXboxLiveEndpointPair
  XboxLive_IXboxLiveEndpointPair = interface;
  PXboxLive_IXboxLiveEndpointPair = ^XboxLive_IXboxLiveEndpointPair;

  // Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs
  XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs = interface;
  PXboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs = ^XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IIterator_1__XboxLive_IXboxLiveEndpointPairTemplate = interface;
  PIIterator_1__XboxLive_IXboxLiveEndpointPairTemplate = ^IIterator_1__XboxLive_IXboxLiveEndpointPairTemplate;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IIterable_1__XboxLive_IXboxLiveEndpointPairTemplate = interface;
  PIIterable_1__XboxLive_IXboxLiveEndpointPairTemplate = ^IIterable_1__XboxLive_IXboxLiveEndpointPairTemplate;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate = interface;
  PIVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate = ^IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate;

  // Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplateStatics
  XboxLive_IXboxLiveEndpointPairTemplateStatics = interface;
  PXboxLive_IXboxLiveEndpointPairTemplateStatics = ^XboxLive_IXboxLiveEndpointPairTemplateStatics;

  // Windows.Networking.XboxLive.IXboxLiveEndpointPairStatics
  XboxLive_IXboxLiveEndpointPairStatics = interface;
  PXboxLive_IXboxLiveEndpointPairStatics = ^XboxLive_IXboxLiveEndpointPairStatics;

  // Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
  XboxLive_IXboxLiveQualityOfServiceMetricResult = interface;
  PXboxLive_IXboxLiveQualityOfServiceMetricResult = ^XboxLive_IXboxLiveQualityOfServiceMetricResult;

  // Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
  XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface;
  PXboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = ^XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult;

  // Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurementStatics
  XboxLive_IXboxLiveQualityOfServiceMeasurementStatics = interface;
  PXboxLive_IXboxLiveQualityOfServiceMeasurementStatics = ^XboxLive_IXboxLiveQualityOfServiceMeasurementStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = interface;
  PIIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = ^IIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IIterable_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = interface;
  PIIterable_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = ^IIterable_1__XboxLive_IXboxLiveQualityOfServiceMetricResult;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = interface;
  PIVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = ^IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IIterator_1__XboxLive_XboxLiveQualityOfServiceMetric = interface;
  PIIterator_1__XboxLive_XboxLiveQualityOfServiceMetric = ^IIterator_1__XboxLive_XboxLiveQualityOfServiceMetric;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IIterable_1__XboxLive_XboxLiveQualityOfServiceMetric = interface;
  PIIterable_1__XboxLive_XboxLiveQualityOfServiceMetric = ^IIterable_1__XboxLive_XboxLiveQualityOfServiceMetric;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IVectorView_1__XboxLive_XboxLiveQualityOfServiceMetric = interface;
  PIVectorView_1__XboxLive_XboxLiveQualityOfServiceMetric = ^IVectorView_1__XboxLive_XboxLiveQualityOfServiceMetric;

  // Windows.Foundation.Collections.IVector`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IVector_1__XboxLive_XboxLiveQualityOfServiceMetric = interface;
  PIVector_1__XboxLive_XboxLiveQualityOfServiceMetric = ^IVector_1__XboxLive_XboxLiveQualityOfServiceMetric;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IIterator_1__XboxLive_IXboxLiveDeviceAddress = interface;
  PIIterator_1__XboxLive_IXboxLiveDeviceAddress = ^IIterator_1__XboxLive_IXboxLiveDeviceAddress;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IIterable_1__XboxLive_IXboxLiveDeviceAddress = interface;
  PIIterable_1__XboxLive_IXboxLiveDeviceAddress = ^IIterable_1__XboxLive_IXboxLiveDeviceAddress;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IVectorView_1__XboxLive_IXboxLiveDeviceAddress = interface;
  PIVectorView_1__XboxLive_IXboxLiveDeviceAddress = ^IVectorView_1__XboxLive_IXboxLiveDeviceAddress;

  // Windows.Foundation.Collections.IVector`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IVector_1__XboxLive_IXboxLiveDeviceAddress = interface;
  PIVector_1__XboxLive_IXboxLiveDeviceAddress = ^IVector_1__XboxLive_IXboxLiveDeviceAddress;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface;
  PIIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = ^IIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IIterable_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface;
  PIIterable_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = ^IIterable_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IVectorView_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface;
  PIVectorView_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = ^IVectorView_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult;

  // Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement
  XboxLive_IXboxLiveQualityOfServiceMeasurement = interface;
  PXboxLive_IXboxLiveQualityOfServiceMeasurement = ^XboxLive_IXboxLiveQualityOfServiceMeasurement;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Networking Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  String
  }
  // Windows.Networking.IEndpointPair
  [WinRTClassNameAttribute(SEndpointPair)]
  IEndpointPair = interface(IInspectable)
  ['{33A0AA36-F8FA-4B30-B856-76517C3BD06D}']
    function get_LocalHostName: IHostName; safecall;
    procedure put_LocalHostName(value: IHostName); safecall;
    function get_LocalServiceName: HSTRING; safecall;
    procedure put_LocalServiceName(value: HSTRING); safecall;
    function get_RemoteHostName: IHostName; safecall;
    procedure put_RemoteHostName(value: IHostName); safecall;
    function get_RemoteServiceName: HSTRING; safecall;
    procedure put_RemoteServiceName(value: HSTRING); safecall;
    property LocalHostName: IHostName read get_LocalHostName write put_LocalHostName;
    property LocalServiceName: HSTRING read get_LocalServiceName write put_LocalServiceName;
    property RemoteHostName: IHostName read get_RemoteHostName write put_RemoteHostName;
    property RemoteServiceName: HSTRING read get_RemoteServiceName write put_RemoteServiceName;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.IEndpointPair>
  IIterator_1__IEndpointPair_Base = interface(IInspectable)
  ['{C899FF9F-E6F5-5673-810C-04E2FF98704F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.IEndpointPair
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.IEndpointPair>
  IIterator_1__IEndpointPair = interface(IIterator_1__IEndpointPair_Base)
  ['{485A4E12-55E5-5021-9EF2-C641FC5DD7AA}']
    function get_Current: IEndpointPair; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIEndpointPair): Cardinal; safecall;
    property Current: IEndpointPair read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.IEndpointPair>
  IIterable_1__IEndpointPair_Base = interface(IInspectable)
  ['{D7EC83C4-A17B-51BF-8997-AA33B9102DC9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.IEndpointPair>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.IEndpointPair>
  IIterable_1__IEndpointPair = interface(IIterable_1__IEndpointPair_Base)
  ['{4DC02A52-9EF2-50EB-85BC-412FE0370355}']
    function First: IIterator_1__IEndpointPair; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.IEndpointPair
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>
  IVectorView_1__IEndpointPair = interface(IInspectable)
  ['{C1DD3EA0-5F59-5BA6-B7B2-58413F0FAA36}']
    function GetAt(index: Cardinal): IEndpointPair; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IEndpointPair; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIEndpointPair): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  String
  }
  // Windows.Networking.IHostNameStatics
  [WinRTClassNameAttribute(SHostName)]
  IHostNameStatics = interface(IInspectable)
  ['{F68CD4BF-A388-4E8B-91EA-54DD6DD901C0}']
    function Compare(value1: HSTRING; value2: HSTRING): Integer; safecall;
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
  // Used Types:  UInt32
  }
  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  {
  // Used Types:  UInt64
  }
  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface(IInspectable)
  ['{6755E376-53BB-568B-A11D-17239868309E}']
    function get_Value: UInt64; safecall;
    property Value: UInt64 read get_Value;
  end;

  {
  // Used Types:  UInt8
  }
  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface(IInspectable)
  ['{E5198CC8-2873-55F5-B0A1-84FF9E4AAD62}']
    function get_Value: Byte; safecall;
    property Value: Byte read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  String
  }
  // Windows.Networking.IHostNameFactory
  [WinRTClassNameAttribute(SHostName)]
  IHostNameFactory = interface(IInspectable)
  ['{458C23ED-712F-4576-ADF1-C20B2C643558}']
    function CreateHostName(hostName: HSTRING): IHostName; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.IEndpointPair
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  String
  }
  // Windows.Networking.IEndpointPairFactory
  [WinRTClassNameAttribute(SEndpointPair)]
  IEndpointPairFactory = interface(IInspectable)
  ['{B609D971-64E0-442B-AA6F-CC8C8F181F78}']
    function CreateEndpointPair(localHostName: IHostName; localServiceName: HSTRING; remoteHostName: IHostName; remoteServiceName: HSTRING): IEndpointPair; safecall;
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

  {
  // Used Types:  Guid
  }
  // Windows.Foundation.IReference`1<Guid>
  IReference_1__TGuid = interface(IInspectable)
  ['{7D50F649-632C-51F9-849A-EE49428933EA}']
    function get_Value: TGuid; safecall;
    property Value: TGuid read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<UInt8>
  IIterator_1__Byte_Base = interface(IInspectable)
  ['{40556131-A2A1-5FAB-AAEE-5F35268CA26B}']
  end;
  {
  // Used Types:  UInt8
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<UInt8>
  IIterator_1__Byte = interface(IIterator_1__Byte_Base)
  ['{40556131-A2A1-5FAB-AAEE-5F35268CA26B}']
    function get_Current: Byte; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PByte): Cardinal; safecall;
    property Current: Byte read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<UInt8>
  IIterable_1__Byte_Base = interface(IInspectable)
  ['{88318266-F3FD-50FC-8F08-B823A41B60C1}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<UInt8>
  }
  // Windows.Foundation.Collections.IIterable`1<UInt8>
  IIterable_1__Byte = interface(IIterable_1__Byte_Base)
  ['{88318266-F3FD-50FC-8F08-B823A41B60C1}']
    function First: IIterator_1__Byte; safecall;
  end;

  {
  // Used Types:  UInt8
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<UInt8>
  IVectorView_1__Byte = interface(IInspectable)
  ['{6D05FB29-7885-544E-9382-A1AD391A3FA4}']
    function GetAt(index: Cardinal): Byte; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Byte; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PByte): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.IHostName>
  IIterator_1__IHostName_Base = interface(IInspectable)
  ['{557BF83C-A428-5DBD-A0FE-05F6EE543D45}']
  end;
  {
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.IHostName>
  IIterator_1__IHostName = interface(IIterator_1__IHostName_Base)
  ['{9AFF90FF-F758-5D63-A5D5-DC7C9F7C0179}']
    function get_Current: IHostName; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIHostName): Cardinal; safecall;
    property Current: IHostName read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.IHostName>
  IIterable_1__IHostName_Base = interface(IInspectable)
  ['{9E5F3ED0-CF1C-5D38-832C-ACEA6164BF5C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.IHostName>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.IHostName>
  IIterable_1__IHostName = interface(IIterable_1__IHostName_Base)
  ['{74DEE455-E95C-5DEC-92A4-97C33B8A2AD1}']
    function First: IIterator_1__IHostName; safecall;
  end;

  {
  // Used Types:  Boolean
  }
  // Windows.Foundation.IReference`1<Boolean>
  IReference_1__Boolean = interface(IInspectable)
  ['{3C00FD60-2950-5939-A21A-2D12C5A01B8A}']
    function get_Value: Boolean; safecall;
    property Value: Boolean read get_Value;
  end;

  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface(IInspectable)
  ['{F06A2739-9443-5EF0-B284-DC5AFF3E7D10}']
    function get_Current: Cardinal; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Current: Cardinal read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<UInt32>
  }
  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface(IInspectable)
  ['{421D4B91-B13B-5F37-AE54-B5249BD80539}']
    function First: IIterator_1__Cardinal; safecall;
  end;

  {
  // Used Types:  Int32
  }
  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface(IInspectable)
  ['{548CEFBD-BC8A-5FA0-8DF2-957440FC8BF4}']
    function get_Value: Integer; safecall;
    property Value: Integer read get_Value;
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

  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface(IInspectable)
  ['{E5CE1A07-8D33-5007-BA64-7D2508CCF85C}']
    function GetAt(index: Cardinal): Cardinal; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Cardinal; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCardinal): Cardinal; safecall;
    property Size: Cardinal read get_Size;
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
  // Used Types:  String
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{60310303-49C5-52E6-ABC6-A9B36ECCC716}']
    function get_Key: HSTRING; safecall;
    function get_Value: HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: HSTRING read get_Value;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,String>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterator_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{05EB86F1-7140-5517-B88D-CBAEBE57E6B1}']
    function get_Current: IKeyValuePair_2__HSTRING__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,String>>
  IIterable_1__IKeyValuePair_2__HSTRING__HSTRING = interface(IInspectable)
  ['{E9BDAAF0-CBF6-5C72-BE90-29CBF3A1319B}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__HSTRING; safecall;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMapView`2<String,String>
  IMapView_2__HSTRING__HSTRING = interface(IInspectable)
  ['{AC7F26F2-FEB7-5B2A-8AC4-345BC62CAEDE}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__HSTRING; out second: IMapView_2__HSTRING__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IIterator_1__BackgroundTransfer_BackgroundTransferFileRange_Base = interface(IInspectable)
  ['{A753D778-8CBB-524A-B8C4-70C515A42782}']
  end;
  {
  // Used Types:  Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IIterator_1__BackgroundTransfer_BackgroundTransferFileRange = interface(IIterator_1__BackgroundTransfer_BackgroundTransferFileRange_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: BackgroundTransfer_BackgroundTransferFileRange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PBackgroundTransfer_BackgroundTransferFileRange): Cardinal; safecall;
    property Current: BackgroundTransfer_BackgroundTransferFileRange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IIterable_1__BackgroundTransfer_BackgroundTransferFileRange_Base = interface(IInspectable)
  ['{2CC2D499-974C-5078-89AE-2D4EE1139721}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IIterable_1__BackgroundTransfer_BackgroundTransferFileRange = interface(IIterable_1__BackgroundTransfer_BackgroundTransferFileRange_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__BackgroundTransfer_BackgroundTransferFileRange; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IVectorView_1__BackgroundTransfer_BackgroundTransferFileRange = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): BackgroundTransfer_BackgroundTransferFileRange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: BackgroundTransfer_BackgroundTransferFileRange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PBackgroundTransfer_BackgroundTransferFileRange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  IVector_1__BackgroundTransfer_BackgroundTransferFileRange = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): BackgroundTransfer_BackgroundTransferFileRange; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__BackgroundTransfer_BackgroundTransferFileRange; safecall;
    function IndexOf(value: BackgroundTransfer_BackgroundTransferFileRange; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: BackgroundTransfer_BackgroundTransferFileRange); safecall;
    procedure InsertAt(index: Cardinal; value: BackgroundTransfer_BackgroundTransferFileRange); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: BackgroundTransfer_BackgroundTransferFileRange); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PBackgroundTransfer_BackgroundTransferFileRange): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PBackgroundTransfer_BackgroundTransferFileRange); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Networking.BackgroundTransfer.BackgroundTransferFileRange>
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs
  [WinRTClassNameAttribute(SBackgroundTransfer_BackgroundTransferRangesDownloadedEventArgs)]
  BackgroundTransfer_IBackgroundTransferRangesDownloadedEventArgs = interface(IInspectable)
  ['{3EBC7453-BF48-4A88-9248-B0C165184F5C}']
    function get_WasDownloadRestarted: Boolean; safecall;
    function get_AddedRanges: IVector_1__BackgroundTransfer_BackgroundTransferFileRange; safecall;
    function GetDeferral: IDeferral; safecall;
    property AddedRanges: IVector_1__BackgroundTransfer_BackgroundTransferFileRange read get_AddedRanges;
    property WasDownloadRestarted: Boolean read get_WasDownloadRestarted;
  end;

  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface(IInspectable)
  ['{F6D1F700-49C2-52AE-8154-826F9908773C}']
    function Lookup(key: HSTRING): HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    function GetView: IMapView_2__HSTRING__HSTRING; safecall;
    function Insert(key: HSTRING; value: HSTRING): Boolean; safecall;
    procedure Remove(key: HSTRING); safecall;
    procedure Clear; safecall;
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

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair_Delegate_Base = interface(IUnknown)
  ['{20D6FAAB-3B8E-5A1F-8397-B01CB219A18D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair_Delegate_Base)
  ['{69395ED9-F36A-524C-8937-BFECF69B2C9E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IEndpointPair; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  IAsyncOperation_1__IVectorView_1__IEndpointPair_Base = interface(IInspectable)
  ['{AFC2FF8E-E393-566A-89C4-D043E940050D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>>
  IAsyncOperation_1__IVectorView_1__IEndpointPair = interface(IAsyncOperation_1__IVectorView_1__IEndpointPair_Base)
  ['{8E5932D3-2F98-5261-9A31-A5B09CB2B0E2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair; safecall;
    function GetResults: IVectorView_1__IEndpointPair; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IEndpointPair read get_Completed write put_Completed;
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

  {
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IHostName>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Networking.IHostName>
  IVector_1__IHostName = interface(IInspectable)
  ['{BDBBDC0E-445B-5239-A7A4-DBB889EDE179}']
    function GetAt(index: Cardinal): IHostName; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IHostName; safecall;
    function IndexOf(value: IHostName; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IHostName); safecall;
    procedure InsertAt(index: Cardinal; value: IHostName); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IHostName); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIHostName): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIHostName); safecall;
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

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveDeviceAddress,Object>
  TypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable_Delegate_Base = interface(IUnknown)
  ['{7FA76199-D1B8-5494-A042-7002A416ADC3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveDeviceAddress,Object>
  TypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable = interface(TypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable_Delegate_Base)
  ['{92EA8704-9C9B-54FB-985D-886447BE838F}']
    procedure Invoke(sender: XboxLive_IXboxLiveDeviceAddress; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveDeviceAddress,Object>
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  UInt8
  // Used Types:  UInt32
  // Used Types:  Int32
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Boolean
  // Used Types:  Windows.Networking.XboxLive.XboxLiveNetworkAccessKind
  }
  // Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  [WinRTClassNameAttribute(SXboxLive_XboxLiveDeviceAddress)]
  XboxLive_IXboxLiveDeviceAddress = interface(IInspectable)
  ['{F5BBD279-3C86-4B57-A31A-B9462408FD01}']
    function add_SnapshotChanged(handler: TypedEventHandler_2__XboxLive_IXboxLiveDeviceAddress__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SnapshotChanged(token: EventRegistrationToken); safecall;
    function GetSnapshotAsBase64: HSTRING; safecall;
    function GetSnapshotAsBuffer: IBuffer; safecall;
    procedure GetSnapshotAsBytes(bufferSize: Cardinal; buffer: PByte; out bytesWritten: Cardinal); safecall;
    function Compare(otherDeviceAddress: XboxLive_IXboxLiveDeviceAddress): Integer; safecall;
    function get_IsValid: Boolean; safecall;
    function get_IsLocal: Boolean; safecall;
    function get_NetworkAccessKind: XboxLive_XboxLiveNetworkAccessKind; safecall;
    property IsLocal: Boolean read get_IsLocal;
    property IsValid: Boolean read get_IsValid;
    property NetworkAccessKind: XboxLive_XboxLiveNetworkAccessKind read get_NetworkAccessKind;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  UInt8
  // Used Types:  UInt32
  }
  // Windows.Networking.XboxLive.IXboxLiveDeviceAddressStatics
  [WinRTClassNameAttribute(SXboxLive_XboxLiveDeviceAddress)]
  XboxLive_IXboxLiveDeviceAddressStatics = interface(IInspectable)
  ['{5954A819-4A79-4931-827C-7F503E963263}']
    function CreateFromSnapshotBase64(base64: HSTRING): XboxLive_IXboxLiveDeviceAddress; safecall;
    function CreateFromSnapshotBuffer(buffer: IBuffer): XboxLive_IXboxLiveDeviceAddress; safecall;
    function CreateFromSnapshotBytes(bufferSize: Cardinal; buffer: PByte): XboxLive_IXboxLiveDeviceAddress; safecall;
    function GetLocal: XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_MaxSnapshotBytesSize: Cardinal; safecall;
    property MaxSnapshotBytesSize: Cardinal read get_MaxSnapshotBytesSize;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.XboxLiveEndpointPairState
  }
  // Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs
  [WinRTClassNameAttribute(SXboxLive_XboxLiveEndpointPairStateChangedEventArgs)]
  XboxLive_IXboxLiveEndpointPairStateChangedEventArgs = interface(IInspectable)
  ['{592E3B55-DE08-44E7-AC3B-B9B9A169583A}']
    function get_OldState: XboxLive_XboxLiveEndpointPairState; safecall;
    function get_NewState: XboxLive_XboxLiveEndpointPairState; safecall;
    property NewState: XboxLive_XboxLiveEndpointPairState read get_NewState;
    property OldState: XboxLive_XboxLiveEndpointPairState read get_OldState;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPair,Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs>
  TypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{51037260-4609-58C1-ADB3-0618B89B9975}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPair
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPair,Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs>
  TypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs = interface(TypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs_Delegate_Base)
  ['{9FD6BED1-AAC6-53F0-98AF-DA7301D08A60}']
    procedure Invoke(sender: XboxLive_IXboxLiveEndpointPair; args: XboxLive_IXboxLiveEndpointPairStateChangedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate,Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs>
  TypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{2AEF5136-6E7A-51F8-8853-CC0CE466FEF9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate,Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs>
  TypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs = interface(TypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs_Delegate_Base)
  ['{51B4BE05-E802-5722-AECE-A3E01AA14D97}']
    procedure Invoke(sender: XboxLive_IXboxLiveEndpointPairTemplate; args: XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Windows.Networking.XboxLive.XboxLiveEndpointPairCreationStatus
  // Used Types:  Boolean
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPair
  }
  // Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult
  [WinRTClassNameAttribute(SXboxLive_XboxLiveEndpointPairCreationResult)]
  XboxLive_IXboxLiveEndpointPairCreationResult = interface(IInspectable)
  ['{D9A8BB95-2AAB-4D1E-9794-33ECC0DCF0FE}']
    function get_DeviceAddress: XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_Status: XboxLive_XboxLiveEndpointPairCreationStatus; safecall;
    function get_IsExistingPathEvaluation: Boolean; safecall;
    function get_EndpointPair: XboxLive_IXboxLiveEndpointPair; safecall;
    property DeviceAddress: XboxLive_IXboxLiveDeviceAddress read get_DeviceAddress;
    property EndpointPair: XboxLive_IXboxLiveEndpointPair read get_EndpointPair;
    property IsExistingPathEvaluation: Boolean read get_IsExistingPathEvaluation;
    property Status: XboxLive_XboxLiveEndpointPairCreationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult_Delegate_Base = interface(IUnknown)
  ['{AD57FA1D-DB1B-5DF5-9694-F71B9BD5625B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult = interface(AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult_Delegate_Base)
  ['{7DD008DD-A716-53C2-964D-C878CFA95EAB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult_Base = interface(IInspectable)
  ['{A4B9D41E-4B2C-5BF9-A19D-ED395B23823C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult = interface(IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult_Base)
  ['{CE32A8C2-B160-5985-90A9-C9B298647E7F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult; safecall;
    function GetResults: XboxLive_IXboxLiveEndpointPairCreationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__XboxLive_IXboxLiveEndpointPairCreationResult read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IIterator_1__XboxLive_IXboxLiveEndpointPair_Base = interface(IInspectable)
  ['{E796A96B-98A0-52A2-BB54-9DBA5BB64FC4}']
  end;
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPair
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IIterator_1__XboxLive_IXboxLiveEndpointPair = interface(IIterator_1__XboxLive_IXboxLiveEndpointPair_Base)
  ['{59B4F20B-B3F0-531F-B6BF-3B42EF1643C9}']
    function get_Current: XboxLive_IXboxLiveEndpointPair; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXboxLive_IXboxLiveEndpointPair): Cardinal; safecall;
    property Current: XboxLive_IXboxLiveEndpointPair read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IIterable_1__XboxLive_IXboxLiveEndpointPair_Base = interface(IInspectable)
  ['{7FCAF666-DDC0-50DC-A76F-9BB6058BE3C9}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IIterable_1__XboxLive_IXboxLiveEndpointPair = interface(IIterable_1__XboxLive_IXboxLiveEndpointPair_Base)
  ['{CA2C55D1-F577-541E-ADF2-01F89AF0AC18}']
    function First: IIterator_1__XboxLive_IXboxLiveEndpointPair; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPair
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  IVectorView_1__XboxLive_IXboxLiveEndpointPair = interface(IInspectable)
  ['{76EE6AB6-3DB4-5C04-9548-46CA05FA4E3A}']
    function GetAt(index: Cardinal): XboxLive_IXboxLiveEndpointPair; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: XboxLive_IXboxLiveEndpointPair; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_IXboxLiveEndpointPair): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate,Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult>
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Windows.Networking.XboxLive.XboxLiveEndpointPairCreationBehaviors
  // Used Types:  String
  // Used Types:  Windows.Networking.XboxLive.XboxLiveSocketKind
  // Used Types:  UInt16
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveEndpointPair>
  }
  // Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  [WinRTClassNameAttribute(SXboxLive_XboxLiveEndpointPairTemplate)]
  XboxLive_IXboxLiveEndpointPairTemplate = interface(IInspectable)
  ['{6B286ECF-3457-40CE-B9A1-C0CFE0213EA7}']
    function add_InboundEndpointPairCreated(handler: TypedEventHandler_2__XboxLive_IXboxLiveEndpointPairTemplate__XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_InboundEndpointPairCreated(token: EventRegistrationToken); safecall;
    function CreateEndpointPairAsync(deviceAddress: XboxLive_IXboxLiveDeviceAddress): IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult; overload; safecall;
    function CreateEndpointPairAsync(deviceAddress: XboxLive_IXboxLiveDeviceAddress; behaviors: XboxLive_XboxLiveEndpointPairCreationBehaviors): IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult; overload; safecall;
    function CreateEndpointPairForPortsAsync(deviceAddress: XboxLive_IXboxLiveDeviceAddress; initiatorPort: HSTRING; acceptorPort: HSTRING): IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult; overload; safecall;
    function CreateEndpointPairForPortsAsync(deviceAddress: XboxLive_IXboxLiveDeviceAddress; initiatorPort: HSTRING; acceptorPort: HSTRING; behaviors: XboxLive_XboxLiveEndpointPairCreationBehaviors): IAsyncOperation_1__XboxLive_IXboxLiveEndpointPairCreationResult; overload; safecall;
    function get_Name: HSTRING; safecall;
    function get_SocketKind: XboxLive_XboxLiveSocketKind; safecall;
    function get_InitiatorBoundPortRangeLower: Word; safecall;
    function get_InitiatorBoundPortRangeUpper: Word; safecall;
    function get_AcceptorBoundPortRangeLower: Word; safecall;
    function get_AcceptorBoundPortRangeUpper: Word; safecall;
    function get_EndpointPairs: IVectorView_1__XboxLive_IXboxLiveEndpointPair; safecall;
    property AcceptorBoundPortRangeLower: Word read get_AcceptorBoundPortRangeLower;
    property AcceptorBoundPortRangeUpper: Word read get_AcceptorBoundPortRangeUpper;
    property EndpointPairs: IVectorView_1__XboxLive_IXboxLiveEndpointPair read get_EndpointPairs;
    property InitiatorBoundPortRangeLower: Word read get_InitiatorBoundPortRangeLower;
    property InitiatorBoundPortRangeUpper: Word read get_InitiatorBoundPortRangeUpper;
    property Name: HSTRING read get_Name;
    property SocketKind: XboxLive_XboxLiveSocketKind read get_SocketKind;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Networking.XboxLive.IXboxLiveEndpointPair,Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  UInt8
  // Used Types:  Windows.Networking.XboxLive.XboxLiveEndpointPairState
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  String
  }
  // Windows.Networking.XboxLive.IXboxLiveEndpointPair
  [WinRTClassNameAttribute(SXboxLive_XboxLiveEndpointPair)]
  XboxLive_IXboxLiveEndpointPair = interface(IInspectable)
  ['{1E9A839B-813E-44E0-B87F-C87A093475E4}']
    function add_StateChanged(handler: TypedEventHandler_2__XboxLive_IXboxLiveEndpointPair__XboxLive_IXboxLiveEndpointPairStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StateChanged(token: EventRegistrationToken); safecall;
    function DeleteAsync: IAsyncAction; safecall;
    procedure GetRemoteSocketAddressBytes(socketAddressSize: Cardinal; socketAddress: PByte); safecall;
    procedure GetLocalSocketAddressBytes(socketAddressSize: Cardinal; socketAddress: PByte); safecall;
    function get_State: XboxLive_XboxLiveEndpointPairState; safecall;
    function get_Template: XboxLive_IXboxLiveEndpointPairTemplate; safecall;
    function get_RemoteDeviceAddress: XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_RemoteHostName: IHostName; safecall;
    function get_RemotePort: HSTRING; safecall;
    function get_LocalHostName: IHostName; safecall;
    function get_LocalPort: HSTRING; safecall;
    property LocalHostName: IHostName read get_LocalHostName;
    property LocalPort: HSTRING read get_LocalPort;
    property RemoteDeviceAddress: XboxLive_IXboxLiveDeviceAddress read get_RemoteDeviceAddress;
    property RemoteHostName: IHostName read get_RemoteHostName;
    property RemotePort: HSTRING read get_RemotePort;
    property State: XboxLive_XboxLiveEndpointPairState read get_State;
    property Template: XboxLive_IXboxLiveEndpointPairTemplate read get_Template;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPair
  }
  // Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs
  [WinRTClassNameAttribute(SXboxLive_XboxLiveInboundEndpointPairCreatedEventArgs)]
  XboxLive_IXboxLiveInboundEndpointPairCreatedEventArgs = interface(IInspectable)
  ['{DC183B62-22BA-48D2-80DE-C23968BD198B}']
    function get_EndpointPair: XboxLive_IXboxLiveEndpointPair; safecall;
    property EndpointPair: XboxLive_IXboxLiveEndpointPair read get_EndpointPair;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IIterator_1__XboxLive_IXboxLiveEndpointPairTemplate_Base = interface(IInspectable)
  ['{515331C6-39E1-5CC7-8454-7F1C8BCBA18E}']
  end;
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IIterator_1__XboxLive_IXboxLiveEndpointPairTemplate = interface(IIterator_1__XboxLive_IXboxLiveEndpointPairTemplate_Base)
  ['{E2620202-4E6F-5CBA-8550-59CC5F79737B}']
    function get_Current: XboxLive_IXboxLiveEndpointPairTemplate; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXboxLive_IXboxLiveEndpointPairTemplate): Cardinal; safecall;
    property Current: XboxLive_IXboxLiveEndpointPairTemplate read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IIterable_1__XboxLive_IXboxLiveEndpointPairTemplate_Base = interface(IInspectable)
  ['{9FCE55C3-5580-581A-85B5-88DD5E9D4FF7}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IIterable_1__XboxLive_IXboxLiveEndpointPairTemplate = interface(IIterable_1__XboxLive_IXboxLiveEndpointPairTemplate_Base)
  ['{348BD365-326D-5535-A7A3-FE5A9DF3885C}']
    function First: IIterator_1__XboxLive_IXboxLiveEndpointPairTemplate; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate = interface(IInspectable)
  ['{E83B97D1-36E3-5AD7-9919-7D25D4A44E7A}']
    function GetAt(index: Cardinal): XboxLive_IXboxLiveEndpointPairTemplate; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: XboxLive_IXboxLiveEndpointPairTemplate; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_IXboxLiveEndpointPairTemplate): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate>
  }
  // Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplateStatics
  [WinRTClassNameAttribute(SXboxLive_XboxLiveEndpointPairTemplate)]
  XboxLive_IXboxLiveEndpointPairTemplateStatics = interface(IInspectable)
  ['{1E13137B-737B-4A23-BC64-0870F75655BA}']
    function GetTemplateByName(name: HSTRING): XboxLive_IXboxLiveEndpointPairTemplate; safecall;
    function get_Templates: IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate; safecall;
    property Templates: IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate read get_Templates;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveEndpointPair
  // Used Types:  UInt8
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  String
  }
  // Windows.Networking.XboxLive.IXboxLiveEndpointPairStatics
  [WinRTClassNameAttribute(SXboxLive_XboxLiveEndpointPair)]
  XboxLive_IXboxLiveEndpointPairStatics = interface(IInspectable)
  ['{64316B30-217A-4243-8EE1-6729281D27DB}']
    function FindEndpointPairBySocketAddressBytes(localSocketAddressSize: Cardinal; localSocketAddress: PByte; remoteSocketAddress: Byte): XboxLive_IXboxLiveEndpointPair; safecall;
    function FindEndpointPairByHostNamesAndPorts(localHostName: IHostName; localPort: HSTRING; remoteHostName: IHostName; remotePort: HSTRING): XboxLive_IXboxLiveEndpointPair; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurementStatus
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
  // Used Types:  UInt64
  }
  // Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
  [WinRTClassNameAttribute(SXboxLive_XboxLiveQualityOfServiceMetricResult)]
  XboxLive_IXboxLiveQualityOfServiceMetricResult = interface(IInspectable)
  ['{AEEC53D1-3561-4782-B0CF-D3AE29D9FA87}']
    function get_Status: XboxLive_XboxLiveQualityOfServiceMeasurementStatus; safecall;
    function get_DeviceAddress: XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_Metric: XboxLive_XboxLiveQualityOfServiceMetric; safecall;
    function get_Value: UInt64; safecall;
    property DeviceAddress: XboxLive_IXboxLiveDeviceAddress read get_DeviceAddress;
    property Metric: XboxLive_XboxLiveQualityOfServiceMetric read get_Metric;
    property Status: XboxLive_XboxLiveQualityOfServiceMeasurementStatus read get_Status;
    property Value: UInt64 read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurementStatus
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
  [WinRTClassNameAttribute(SXboxLive_XboxLiveQualityOfServicePrivatePayloadResult)]
  XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface(IInspectable)
  ['{5A6302AE-6F38-41C0-9FCC-EA6CB978CAFC}']
    function get_Status: XboxLive_XboxLiveQualityOfServiceMeasurementStatus; safecall;
    function get_DeviceAddress: XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_Value: IBuffer; safecall;
    property DeviceAddress: XboxLive_IXboxLiveDeviceAddress read get_DeviceAddress;
    property Status: XboxLive_XboxLiveQualityOfServiceMeasurementStatus read get_Status;
    property Value: IBuffer read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurementStatics
  [WinRTClassNameAttribute(SXboxLive_XboxLiveQualityOfServiceMeasurement)]
  XboxLive_IXboxLiveQualityOfServiceMeasurementStatics = interface(IInspectable)
  ['{6E352DCA-23CF-440A-B077-5E30857A8234}']
    procedure PublishPrivatePayloadBytes(payloadSize: Cardinal; payload: PByte); safecall;
    procedure ClearPrivatePayload; safecall;
    function get_MaxSimultaneousProbeConnections: Cardinal; safecall;
    procedure put_MaxSimultaneousProbeConnections(value: Cardinal); safecall;
    function get_IsSystemOutboundBandwidthConstrained: Boolean; safecall;
    procedure put_IsSystemOutboundBandwidthConstrained(value: Boolean); safecall;
    function get_IsSystemInboundBandwidthConstrained: Boolean; safecall;
    procedure put_IsSystemInboundBandwidthConstrained(value: Boolean); safecall;
    function get_PublishedPrivatePayload: IBuffer; safecall;
    procedure put_PublishedPrivatePayload(value: IBuffer); safecall;
    function get_MaxPrivatePayloadSize: Cardinal; safecall;
    property IsSystemInboundBandwidthConstrained: Boolean read get_IsSystemInboundBandwidthConstrained write put_IsSystemInboundBandwidthConstrained;
    property IsSystemOutboundBandwidthConstrained: Boolean read get_IsSystemOutboundBandwidthConstrained write put_IsSystemOutboundBandwidthConstrained;
    property MaxPrivatePayloadSize: Cardinal read get_MaxPrivatePayloadSize;
    property MaxSimultaneousProbeConnections: Cardinal read get_MaxSimultaneousProbeConnections write put_MaxSimultaneousProbeConnections;
    property PublishedPrivatePayload: IBuffer read get_PublishedPrivatePayload write put_PublishedPrivatePayload;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult_Base = interface(IInspectable)
  ['{E0696826-0069-57D6-9AD8-D0B368629E2E}']
  end;
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = interface(IIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult_Base)
  ['{1950D722-133A-5C7E-A0B3-E99224EBCF4B}']
    function get_Current: XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXboxLive_IXboxLiveQualityOfServiceMetricResult): Cardinal; safecall;
    property Current: XboxLive_IXboxLiveQualityOfServiceMetricResult read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IIterable_1__XboxLive_IXboxLiveQualityOfServiceMetricResult_Base = interface(IInspectable)
  ['{65CC99EC-9779-568A-8982-AEE439FA24CE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IIterable_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = interface(IIterable_1__XboxLive_IXboxLiveQualityOfServiceMetricResult_Base)
  ['{2D6643AF-8545-5FC5-A84E-1D7CDFA8E366}']
    function First: IIterator_1__XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult = interface(IInspectable)
  ['{2280991F-95D7-5E86-80F1-AD73F0B8D66D}']
    function GetAt(index: Cardinal): XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: XboxLive_IXboxLiveQualityOfServiceMetricResult; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_IXboxLiveQualityOfServiceMetricResult): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IIterator_1__XboxLive_XboxLiveQualityOfServiceMetric_Base = interface(IInspectable)
  ['{B281EF1A-56BC-5DAA-BBE2-65E617B49925}']
  end;
  {
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IIterator_1__XboxLive_XboxLiveQualityOfServiceMetric = interface(IIterator_1__XboxLive_XboxLiveQualityOfServiceMetric_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: XboxLive_XboxLiveQualityOfServiceMetric; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXboxLive_XboxLiveQualityOfServiceMetric): Cardinal; safecall;
    property Current: XboxLive_XboxLiveQualityOfServiceMetric read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IIterable_1__XboxLive_XboxLiveQualityOfServiceMetric_Base = interface(IInspectable)
  ['{E202EEF6-93BD-5FA2-91FC-7CA6A4EDC38A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IIterable_1__XboxLive_XboxLiveQualityOfServiceMetric = interface(IIterable_1__XboxLive_XboxLiveQualityOfServiceMetric_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__XboxLive_XboxLiveQualityOfServiceMetric; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IVectorView_1__XboxLive_XboxLiveQualityOfServiceMetric = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): XboxLive_XboxLiveQualityOfServiceMetric; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: XboxLive_XboxLiveQualityOfServiceMetric; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_XboxLiveQualityOfServiceMetric): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  IVector_1__XboxLive_XboxLiveQualityOfServiceMetric = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): XboxLive_XboxLiveQualityOfServiceMetric; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__XboxLive_XboxLiveQualityOfServiceMetric; safecall;
    function IndexOf(value: XboxLive_XboxLiveQualityOfServiceMetric; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: XboxLive_XboxLiveQualityOfServiceMetric); safecall;
    procedure InsertAt(index: Cardinal; value: XboxLive_XboxLiveQualityOfServiceMetric); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: XboxLive_XboxLiveQualityOfServiceMetric); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_XboxLiveQualityOfServiceMetric): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PXboxLive_XboxLiveQualityOfServiceMetric); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IIterator_1__XboxLive_IXboxLiveDeviceAddress_Base = interface(IInspectable)
  ['{85FB7103-EF5E-5746-9341-1DFBB21D720D}']
  end;
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IIterator_1__XboxLive_IXboxLiveDeviceAddress = interface(IIterator_1__XboxLive_IXboxLiveDeviceAddress_Base)
  ['{CCDA928E-16EE-56F4-83D1-D5923B4355DD}']
    function get_Current: XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXboxLive_IXboxLiveDeviceAddress): Cardinal; safecall;
    property Current: XboxLive_IXboxLiveDeviceAddress read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IIterable_1__XboxLive_IXboxLiveDeviceAddress_Base = interface(IInspectable)
  ['{44DF817C-B475-5FDB-862A-4A96ED1DAD5C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IIterable_1__XboxLive_IXboxLiveDeviceAddress = interface(IIterable_1__XboxLive_IXboxLiveDeviceAddress_Base)
  ['{31FC949A-2812-5F04-96C1-5711B1746910}']
    function First: IIterator_1__XboxLive_IXboxLiveDeviceAddress; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IVectorView_1__XboxLive_IXboxLiveDeviceAddress = interface(IInspectable)
  ['{B231854B-6A72-57A1-AB6A-5ABDBEE96096}']
    function GetAt(index: Cardinal): XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: XboxLive_IXboxLiveDeviceAddress; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_IXboxLiveDeviceAddress): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  IVector_1__XboxLive_IXboxLiveDeviceAddress = interface(IInspectable)
  ['{992D83EE-D73D-56AA-A1B1-FF3074FEE1EE}']
    function GetAt(index: Cardinal): XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__XboxLive_IXboxLiveDeviceAddress; safecall;
    function IndexOf(value: XboxLive_IXboxLiveDeviceAddress; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: XboxLive_IXboxLiveDeviceAddress); safecall;
    procedure InsertAt(index: Cardinal; value: XboxLive_IXboxLiveDeviceAddress); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: XboxLive_IXboxLiveDeviceAddress); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_IXboxLiveDeviceAddress): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PXboxLive_IXboxLiveDeviceAddress); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult_Base = interface(IInspectable)
  ['{EB5BFDF4-7897-5CBF-AAA5-3582FAFB4D78}']
  end;
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface(IIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult_Base)
  ['{54F63A7B-E356-533A-9EE3-62E3D823F770}']
    function get_Current: XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PXboxLive_IXboxLiveQualityOfServicePrivatePayloadResult): Cardinal; safecall;
    property Current: XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IIterable_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult_Base = interface(IInspectable)
  ['{3A061DD4-03DD-52FB-9A83-067DE27C2BB1}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IIterable_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface(IIterable_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult_Base)
  ['{E1FCF7AC-BFC5-5B75-8929-1E575A6B4121}']
    function First: IIterator_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  IVectorView_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult = interface(IInspectable)
  ['{45013733-5353-518D-8658-21A4961795A4}']
    function GetAt(index: Cardinal): XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PXboxLive_IXboxLiveQualityOfServicePrivatePayloadResult): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult>
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Used Types:  Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult
  // Used Types:  Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetric>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Networking.XboxLive.IXboxLiveDeviceAddress>
  // Used Types:  Boolean
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult>
  }
  // Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement
  [WinRTClassNameAttribute(SXboxLive_XboxLiveQualityOfServiceMeasurement)]
  XboxLive_IXboxLiveQualityOfServiceMeasurement = interface(IInspectable)
  ['{4D682BCE-A5D6-47E6-A236-CFDE5FBDF2ED}']
    function MeasureAsync: IAsyncAction; safecall;
    function GetMetricResultsForDevice(deviceAddress: XboxLive_IXboxLiveDeviceAddress): IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
    function GetMetricResultsForMetric(metric: XboxLive_XboxLiveQualityOfServiceMetric): IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
    function GetMetricResult(deviceAddress: XboxLive_IXboxLiveDeviceAddress; metric: XboxLive_XboxLiveQualityOfServiceMetric): XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
    function GetPrivatePayloadResult(deviceAddress: XboxLive_IXboxLiveDeviceAddress): XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult; safecall;
    function get_Metrics: IVector_1__XboxLive_XboxLiveQualityOfServiceMetric; safecall;
    function get_DeviceAddresses: IVector_1__XboxLive_IXboxLiveDeviceAddress; safecall;
    function get_ShouldRequestPrivatePayloads: Boolean; safecall;
    procedure put_ShouldRequestPrivatePayloads(value: Boolean); safecall;
    function get_TimeoutInMilliseconds: Cardinal; safecall;
    procedure put_TimeoutInMilliseconds(value: Cardinal); safecall;
    function get_NumberOfProbesToAttempt: Cardinal; safecall;
    procedure put_NumberOfProbesToAttempt(value: Cardinal); safecall;
    function get_NumberOfResultsPending: Cardinal; safecall;
    function get_MetricResults: IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult; safecall;
    function get_PrivatePayloadResults: IVectorView_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult; safecall;
    property DeviceAddresses: IVector_1__XboxLive_IXboxLiveDeviceAddress read get_DeviceAddresses;
    property MetricResults: IVectorView_1__XboxLive_IXboxLiveQualityOfServiceMetricResult read get_MetricResults;
    property Metrics: IVector_1__XboxLive_XboxLiveQualityOfServiceMetric read get_Metrics;
    property NumberOfProbesToAttempt: Cardinal read get_NumberOfProbesToAttempt write put_NumberOfProbesToAttempt;
    property NumberOfResultsPending: Cardinal read get_NumberOfResultsPending;
    property PrivatePayloadResults: IVectorView_1__XboxLive_IXboxLiveQualityOfServicePrivatePayloadResult read get_PrivatePayloadResults;
    property ShouldRequestPrivatePayloads: Boolean read get_ShouldRequestPrivatePayloads write put_ShouldRequestPrivatePayloads;
    property TimeoutInMilliseconds: Cardinal read get_TimeoutInMilliseconds write put_TimeoutInMilliseconds;
  end;


  // Emit Forwarded classes
  // Windows.Networking.HostName
  // DualAPI
  // Implements: Windows.Networking.IHostName
  // Implements: Windows.Foundation.IStringable
  // Statics: "Windows.Networking.IHostNameStatics"
  // Factory: "Windows.Networking.IHostNameFactory"
  THostName = class(TWinRTGenericImportFS<IHostNameFactory, IHostNameStatics>)
  public
    // -> IHostNameStatics
    class function Compare(value1: HSTRING; value2: HSTRING): Integer; static; inline;

    // -> IHostNameFactory
    class function CreateHostName(hostName: HSTRING): IHostName; static; inline;
  end;

  // Windows.Networking.EndpointPair
  // DualAPI
  // Implements: Windows.Networking.IEndpointPair
  // Factory: "Windows.Networking.IEndpointPairFactory"
  TEndpointPair = class(TWinRTGenericImportF<IEndpointPairFactory>)
  public
    // -> IEndpointPairFactory
    class function CreateEndpointPair(localHostName: IHostName; localServiceName: HSTRING; remoteHostName: IHostName; remoteServiceName: HSTRING): IEndpointPair; static; inline;
  end;

  // Windows.Networking.BackgroundTransfer.BackgroundTransferRangesDownloadedEventArgs
  // DualAPI
  // Implements: Windows.Networking.BackgroundTransfer.IBackgroundTransferRangesDownloadedEventArgs

  // Windows.Networking.XboxLive.XboxLiveDeviceAddress
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveDeviceAddress
  // Statics: "Windows.Networking.XboxLive.IXboxLiveDeviceAddressStatics"
  TXboxLive_XboxLiveDeviceAddress = class(TWinRTGenericImportS<XboxLive_IXboxLiveDeviceAddressStatics>)
  public
    // -> XboxLive_IXboxLiveDeviceAddressStatics
    class function CreateFromSnapshotBase64(base64: HSTRING): XboxLive_IXboxLiveDeviceAddress; static; inline;
    class function CreateFromSnapshotBuffer(buffer: IBuffer): XboxLive_IXboxLiveDeviceAddress; static; inline;
    class function CreateFromSnapshotBytes(bufferSize: Cardinal; buffer: PByte): XboxLive_IXboxLiveDeviceAddress; static; inline;
    class function GetLocal: XboxLive_IXboxLiveDeviceAddress; static; inline;
    class function get_MaxSnapshotBytesSize: Cardinal; static; inline;
    class property MaxSnapshotBytesSize: Cardinal read get_MaxSnapshotBytesSize;
  end;

  // Windows.Networking.XboxLive.XboxLiveEndpointPair
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveEndpointPair
  // Statics: "Windows.Networking.XboxLive.IXboxLiveEndpointPairStatics"
  TXboxLive_XboxLiveEndpointPair = class(TWinRTGenericImportS<XboxLive_IXboxLiveEndpointPairStatics>)
  public
    // -> XboxLive_IXboxLiveEndpointPairStatics
    class function FindEndpointPairBySocketAddressBytes(localSocketAddressSize: Cardinal; localSocketAddress: PByte; remoteSocketAddress: Byte): XboxLive_IXboxLiveEndpointPair; static; inline;
    class function FindEndpointPairByHostNamesAndPorts(localHostName: IHostName; localPort: HSTRING; remoteHostName: IHostName; remotePort: HSTRING): XboxLive_IXboxLiveEndpointPair; static; inline;
  end;

  // Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplate
  // Statics: "Windows.Networking.XboxLive.IXboxLiveEndpointPairTemplateStatics"
  TXboxLive_XboxLiveEndpointPairTemplate = class(TWinRTGenericImportS<XboxLive_IXboxLiveEndpointPairTemplateStatics>)
  public
    // -> XboxLive_IXboxLiveEndpointPairTemplateStatics
    class function GetTemplateByName(name: HSTRING): XboxLive_IXboxLiveEndpointPairTemplate; static; inline;
    class function get_Templates: IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate; static; inline;
    class property Templates: IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate read get_Templates;
  end;

  // Windows.Networking.XboxLive.XboxLiveInboundEndpointPairCreatedEventArgs
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveInboundEndpointPairCreatedEventArgs

  // Windows.Networking.XboxLive.XboxLiveEndpointPairCreationResult
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveEndpointPairCreationResult

  // Windows.Networking.XboxLive.XboxLiveEndpointPairStateChangedEventArgs
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveEndpointPairStateChangedEventArgs

  // Windows.Networking.XboxLive.XboxLiveQualityOfServiceMetricResult
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMetricResult

  // Windows.Networking.XboxLive.XboxLiveQualityOfServicePrivatePayloadResult
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveQualityOfServicePrivatePayloadResult

  // Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement
  // DualAPI
  // Implements: Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurement
  // Statics: "Windows.Networking.XboxLive.IXboxLiveQualityOfServiceMeasurementStatics"
  // Instantiable: "XboxLive_IXboxLiveQualityOfServiceMeasurement"
  TXboxLive_XboxLiveQualityOfServiceMeasurement = class(TWinRTGenericImportSI<XboxLive_IXboxLiveQualityOfServiceMeasurementStatics, XboxLive_IXboxLiveQualityOfServiceMeasurement>)
  public
    // -> XboxLive_IXboxLiveQualityOfServiceMeasurementStatics
    class procedure PublishPrivatePayloadBytes(payloadSize: Cardinal; payload: PByte); static; inline;
    class procedure ClearPrivatePayload; static; inline;
    class function get_MaxSimultaneousProbeConnections: Cardinal; static; inline;
    class procedure put_MaxSimultaneousProbeConnections(value: Cardinal); static; inline;
    class function get_IsSystemOutboundBandwidthConstrained: Boolean; static; inline;
    class procedure put_IsSystemOutboundBandwidthConstrained(value: Boolean); static; inline;
    class function get_IsSystemInboundBandwidthConstrained: Boolean; static; inline;
    class procedure put_IsSystemInboundBandwidthConstrained(value: Boolean); static; inline;
    class function get_PublishedPrivatePayload: IBuffer; static; inline;
    class procedure put_PublishedPrivatePayload(value: IBuffer); static; inline;
    class function get_MaxPrivatePayloadSize: Cardinal; static; inline;
    class property IsSystemInboundBandwidthConstrained: Boolean read get_IsSystemInboundBandwidthConstrained write put_IsSystemInboundBandwidthConstrained;
    class property IsSystemOutboundBandwidthConstrained: Boolean read get_IsSystemOutboundBandwidthConstrained write put_IsSystemOutboundBandwidthConstrained;
    class property MaxPrivatePayloadSize: Cardinal read get_MaxPrivatePayloadSize;
    class property MaxSimultaneousProbeConnections: Cardinal read get_MaxSimultaneousProbeConnections write put_MaxSimultaneousProbeConnections;
    class property PublishedPrivatePayload: IBuffer read get_PublishedPrivatePayload write put_PublishedPrivatePayload;
  end;


implementation

  // Emit Classes Implementation
 { THostName }

class function THostName.Compare(value1: HSTRING; value2: HSTRING): Integer;
begin
  Result := Statics.Compare(value1, value2);
end;

// Factories for : "HostName"
// Factory: "Windows.Networking.IHostNameFactory"
// -> IHostNameFactory

class function THostName.CreateHostName(hostName: HSTRING): IHostName;
begin
  Result := Factory.CreateHostName(hostName);
end;


 { TEndpointPair }
// Factories for : "EndpointPair"
// Factory: "Windows.Networking.IEndpointPairFactory"
// -> IEndpointPairFactory

class function TEndpointPair.CreateEndpointPair(localHostName: IHostName; localServiceName: HSTRING; remoteHostName: IHostName; remoteServiceName: HSTRING): IEndpointPair;
begin
  Result := Factory.CreateEndpointPair(localHostName, localServiceName, remoteHostName, remoteServiceName);
end;


 { TXboxLive_XboxLiveDeviceAddress }

class function TXboxLive_XboxLiveDeviceAddress.CreateFromSnapshotBase64(base64: HSTRING): XboxLive_IXboxLiveDeviceAddress;
begin
  Result := Statics.CreateFromSnapshotBase64(base64);
end;

class function TXboxLive_XboxLiveDeviceAddress.CreateFromSnapshotBuffer(buffer: IBuffer): XboxLive_IXboxLiveDeviceAddress;
begin
  Result := Statics.CreateFromSnapshotBuffer(buffer);
end;

class function TXboxLive_XboxLiveDeviceAddress.CreateFromSnapshotBytes(bufferSize: Cardinal; buffer: PByte): XboxLive_IXboxLiveDeviceAddress;
begin
  Result := Statics.CreateFromSnapshotBytes(bufferSize, buffer);
end;

class function TXboxLive_XboxLiveDeviceAddress.GetLocal: XboxLive_IXboxLiveDeviceAddress;
begin
  Result := Statics.GetLocal;
end;

class function TXboxLive_XboxLiveDeviceAddress.get_MaxSnapshotBytesSize: Cardinal;
begin
  Result := Statics.get_MaxSnapshotBytesSize;
end;


 { TXboxLive_XboxLiveEndpointPair }

class function TXboxLive_XboxLiveEndpointPair.FindEndpointPairBySocketAddressBytes(localSocketAddressSize: Cardinal; localSocketAddress: PByte; remoteSocketAddress: Byte): XboxLive_IXboxLiveEndpointPair;
begin
  Result := Statics.FindEndpointPairBySocketAddressBytes(localSocketAddressSize, localSocketAddress, remoteSocketAddress);
end;

class function TXboxLive_XboxLiveEndpointPair.FindEndpointPairByHostNamesAndPorts(localHostName: IHostName; localPort: HSTRING; remoteHostName: IHostName; remotePort: HSTRING): XboxLive_IXboxLiveEndpointPair;
begin
  Result := Statics.FindEndpointPairByHostNamesAndPorts(localHostName, localPort, remoteHostName, remotePort);
end;


 { TXboxLive_XboxLiveEndpointPairTemplate }

class function TXboxLive_XboxLiveEndpointPairTemplate.GetTemplateByName(name: HSTRING): XboxLive_IXboxLiveEndpointPairTemplate;
begin
  Result := Statics.GetTemplateByName(name);
end;

class function TXboxLive_XboxLiveEndpointPairTemplate.get_Templates: IVectorView_1__XboxLive_IXboxLiveEndpointPairTemplate;
begin
  Result := Statics.get_Templates;
end;


 { TXboxLive_XboxLiveQualityOfServiceMeasurement }

class procedure TXboxLive_XboxLiveQualityOfServiceMeasurement.PublishPrivatePayloadBytes(payloadSize: Cardinal; payload: PByte);
begin
  Statics.PublishPrivatePayloadBytes(payloadSize, payload);
end;

class procedure TXboxLive_XboxLiveQualityOfServiceMeasurement.ClearPrivatePayload;
begin
  Statics.ClearPrivatePayload;
end;

class function TXboxLive_XboxLiveQualityOfServiceMeasurement.get_MaxSimultaneousProbeConnections: Cardinal;
begin
  Result := Statics.get_MaxSimultaneousProbeConnections;
end;

class procedure TXboxLive_XboxLiveQualityOfServiceMeasurement.put_MaxSimultaneousProbeConnections(value: Cardinal);
begin
  Statics.put_MaxSimultaneousProbeConnections(value);
end;

class function TXboxLive_XboxLiveQualityOfServiceMeasurement.get_IsSystemOutboundBandwidthConstrained: Boolean;
begin
  Result := Statics.get_IsSystemOutboundBandwidthConstrained;
end;

class procedure TXboxLive_XboxLiveQualityOfServiceMeasurement.put_IsSystemOutboundBandwidthConstrained(value: Boolean);
begin
  Statics.put_IsSystemOutboundBandwidthConstrained(value);
end;

class function TXboxLive_XboxLiveQualityOfServiceMeasurement.get_IsSystemInboundBandwidthConstrained: Boolean;
begin
  Result := Statics.get_IsSystemInboundBandwidthConstrained;
end;

class procedure TXboxLive_XboxLiveQualityOfServiceMeasurement.put_IsSystemInboundBandwidthConstrained(value: Boolean);
begin
  Statics.put_IsSystemInboundBandwidthConstrained(value);
end;

class function TXboxLive_XboxLiveQualityOfServiceMeasurement.get_PublishedPrivatePayload: IBuffer;
begin
  Result := Statics.get_PublishedPrivatePayload;
end;

class procedure TXboxLive_XboxLiveQualityOfServiceMeasurement.put_PublishedPrivatePayload(value: IBuffer);
begin
  Statics.put_PublishedPrivatePayload(value);
end;

class function TXboxLive_XboxLiveQualityOfServiceMeasurement.get_MaxPrivatePayloadSize: Cardinal;
begin
  Result := Statics.get_MaxPrivatePayloadSize;
end;



end.
