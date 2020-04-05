{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.ApplicationModel;

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
  Winapi.ApplicationModel.Core, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus = interface;
  PAsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus = ^AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  IAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus = interface;
  PIAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus = ^IAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus;

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

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.StartupTaskState>
  AsyncOperationCompletedHandler_1__StartupTaskState = interface;
  PAsyncOperationCompletedHandler_1__StartupTaskState = ^AsyncOperationCompletedHandler_1__StartupTaskState;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.StartupTaskState>
  IAsyncOperation_1__StartupTaskState = interface;
  PIAsyncOperation_1__StartupTaskState = ^IAsyncOperation_1__StartupTaskState;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Cardinal__Cardinal = ^AsyncOperationProgressHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  IAsyncOperationWithProgress_2__Cardinal__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Cardinal__Cardinal = ^IAsyncOperationWithProgress_2__Cardinal__Cardinal;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.ApplicationModel.Search.Core.ISearchSuggestion>
  VectorChangedEventHandler_1__Search_Core_ISearchSuggestion = interface;
  PVectorChangedEventHandler_1__Search_Core_ISearchSuggestion = ^VectorChangedEventHandler_1__Search_Core_ISearchSuggestion;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.ApplicationModel.Search.Core.ISearchSuggestion>
  IObservableVector_1__Search_Core_ISearchSuggestion = interface;
  PIObservableVector_1__Search_Core_ISearchSuggestion = ^IObservableVector_1__Search_Core_ISearchSuggestion;

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

  // Windows.ApplicationModel.IAppInfo
  IAppInfo = interface;
  PIAppInfo = ^IAppInfo;

  // Windows.ApplicationModel.IPackageIdWithMetadata
  IPackageIdWithMetadata = interface;
  PIPackageIdWithMetadata = ^IPackageIdWithMetadata;

  // Windows.ApplicationModel.IPackageWithMetadata
  IPackageWithMetadata = interface;
  PIPackageWithMetadata = ^IPackageWithMetadata;

  // Windows.ApplicationModel.IPackageStatus
  IPackageStatus = interface;
  PIPackageStatus = ^IPackageStatus;

  // Windows.ApplicationModel.IPackageStatus2
  IPackageStatus2 = interface;
  PIPackageStatus2 = ^IPackageStatus2;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackage>
  IIterator_1__IPackage = interface;
  PIIterator_1__IPackage = ^IIterator_1__IPackage;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackage>
  IIterable_1__IPackage = interface;
  PIIterable_1__IPackage = ^IIterable_1__IPackage;

  // Windows.ApplicationModel.IPackage2
  IPackage2 = interface;
  PIPackage2 = ^IPackage2;

  // Windows.ApplicationModel.IPackage3
  IPackage3 = interface;
  PIPackage3 = ^IPackage3;

  // Windows.ApplicationModel.IPackage4
  IPackage4 = interface;
  PIPackage4 = ^IPackage4;

  // Windows.ApplicationModel.IPackageContentGroup
  IPackageContentGroup = interface;
  PIPackageContentGroup = ^IPackageContentGroup;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackageContentGroup>
  IIterator_1__IPackageContentGroup = interface;
  PIIterator_1__IPackageContentGroup = ^IIterator_1__IPackageContentGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackageContentGroup>
  IIterable_1__IPackageContentGroup = interface;
  PIIterable_1__IPackageContentGroup = ^IIterable_1__IPackageContentGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IPackageContentGroup>
  IVectorView_1__IPackageContentGroup = interface;
  PIVectorView_1__IPackageContentGroup = ^IVectorView_1__IPackageContentGroup;

  // Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>
  IVector_1__IPackageContentGroup = interface;
  PIVector_1__IPackageContentGroup = ^IVector_1__IPackageContentGroup;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup = interface;
  PAsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup = ^AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  IAsyncOperation_1__IVector_1__IPackageContentGroup = interface;
  PIAsyncOperation_1__IVector_1__IPackageContentGroup = ^IAsyncOperation_1__IVector_1__IPackageContentGroup;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.IPackageContentGroup>
  AsyncOperationCompletedHandler_1__IPackageContentGroup = interface;
  PAsyncOperationCompletedHandler_1__IPackageContentGroup = ^AsyncOperationCompletedHandler_1__IPackageContentGroup;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.IPackageContentGroup>
  IAsyncOperation_1__IPackageContentGroup = interface;
  PIAsyncOperation_1__IPackageContentGroup = ^IAsyncOperation_1__IPackageContentGroup;

  // Windows.ApplicationModel.IPackage5
  IPackage5 = interface;
  PIPackage5 = ^IPackage5;

  // Windows.ApplicationModel.IPackageStatics
  IPackageStatics = interface;
  PIPackageStatics = ^IPackageStatics;

  // Windows.ApplicationModel.IPackageStagingEventArgs
  IPackageStagingEventArgs = interface;
  PIPackageStagingEventArgs = ^IPackageStagingEventArgs;

  // Windows.ApplicationModel.IPackageInstallingEventArgs
  IPackageInstallingEventArgs = interface;
  PIPackageInstallingEventArgs = ^IPackageInstallingEventArgs;

  // Windows.ApplicationModel.IPackageUpdatingEventArgs
  IPackageUpdatingEventArgs = interface;
  PIPackageUpdatingEventArgs = ^IPackageUpdatingEventArgs;

  // Windows.ApplicationModel.IPackageUninstallingEventArgs
  IPackageUninstallingEventArgs = interface;
  PIPackageUninstallingEventArgs = ^IPackageUninstallingEventArgs;

  // Windows.ApplicationModel.IPackageStatusChangedEventArgs
  IPackageStatusChangedEventArgs = interface;
  PIPackageStatusChangedEventArgs = ^IPackageStatusChangedEventArgs;

  // Windows.ApplicationModel.IPackageContentGroupStagingEventArgs
  IPackageContentGroupStagingEventArgs = interface;
  PIPackageContentGroupStagingEventArgs = ^IPackageContentGroupStagingEventArgs;

  // Windows.ApplicationModel.AppService.IAppServiceDeferral
  AppService_IAppServiceDeferral = interface;
  PAppService_IAppServiceDeferral = ^AppService_IAppServiceDeferral;

  // Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs
  AppService_IAppServiceClosedEventArgs = interface;
  PAppService_IAppServiceClosedEventArgs = ^AppService_IAppServiceClosedEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus = interface;
  PAsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus = ^AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  IAsyncOperation_1__AppService_AppServiceResponseStatus = interface;
  PIAsyncOperation_1__AppService_AppServiceResponseStatus = ^IAsyncOperation_1__AppService_AppServiceResponseStatus;

  // Windows.ApplicationModel.AppService.IAppServiceRequest
  AppService_IAppServiceRequest = interface;
  PAppService_IAppServiceRequest = ^AppService_IAppServiceRequest;

  // Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs
  AppService_IAppServiceRequestReceivedEventArgs = interface;
  PAppService_IAppServiceRequestReceivedEventArgs = ^AppService_IAppServiceRequestReceivedEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus = interface;
  PAsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus = ^AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  IAsyncOperation_1__AppService_AppServiceConnectionStatus = interface;
  PIAsyncOperation_1__AppService_AppServiceConnectionStatus = ^IAsyncOperation_1__AppService_AppServiceConnectionStatus;

  // Windows.ApplicationModel.AppService.IAppServiceResponse
  AppService_IAppServiceResponse = interface;
  PAppService_IAppServiceResponse = ^AppService_IAppServiceResponse;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse = interface;
  PAsyncOperationCompletedHandler_1__AppService_IAppServiceResponse = ^AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  IAsyncOperation_1__AppService_IAppServiceResponse = interface;
  PIAsyncOperation_1__AppService_IAppServiceResponse = ^IAsyncOperation_1__AppService_IAppServiceResponse;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs>
  TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs = interface;
  PTypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs = ^TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs>
  TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs = interface;
  PTypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs = ^TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs;

  // Windows.ApplicationModel.AppService.IAppServiceConnection
  AppService_IAppServiceConnection = interface;
  PAppService_IAppServiceConnection = ^AppService_IAppServiceConnection;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

  // Windows.ApplicationModel.AppService.IAppServiceConnection2
  AppService_IAppServiceConnection2 = interface;
  PAppService_IAppServiceConnection2 = ^AppService_IAppServiceConnection2;

  // Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
  AppService_IAppServiceTriggerDetails = interface;
  PAppService_IAppServiceTriggerDetails = ^AppService_IAppServiceTriggerDetails;

  // Windows.ApplicationModel.AppService.IAppServiceTriggerDetails2
  AppService_IAppServiceTriggerDetails2 = interface;
  PAppService_IAppServiceTriggerDetails2 = ^AppService_IAppServiceTriggerDetails2;

  // Windows.ApplicationModel.AppService.IAppServiceTriggerDetails3
  AppService_IAppServiceTriggerDetails3 = interface;
  PAppService_IAppServiceTriggerDetails3 = ^AppService_IAppServiceTriggerDetails3;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IAppInfo>
  IIterator_1__IAppInfo = interface;
  PIIterator_1__IAppInfo = ^IIterator_1__IAppInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IAppInfo>
  IIterable_1__IAppInfo = interface;
  PIIterable_1__IAppInfo = ^IIterable_1__IAppInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>
  IVectorView_1__IAppInfo = interface;
  PIVectorView_1__IAppInfo = ^IVectorView_1__IAppInfo;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo = ^AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  IAsyncOperation_1__IVectorView_1__IAppInfo = interface;
  PIAsyncOperation_1__IVectorView_1__IAppInfo = ^IAsyncOperation_1__IVectorView_1__IAppInfo;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = ^AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING = interface;
  PIAsyncOperation_1__IVectorView_1__HSTRING = ^IAsyncOperation_1__IVectorView_1__HSTRING;

  // Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  IKeyValuePair_2__TGuid__IInspectable = interface;
  PIKeyValuePair_2__TGuid__IInspectable = ^IKeyValuePair_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterator_1__IKeyValuePair_2__TGuid__IInspectable = interface;
  PIIterator_1__IKeyValuePair_2__TGuid__IInspectable = ^IIterator_1__IKeyValuePair_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterable_1__IKeyValuePair_2__TGuid__IInspectable = interface;
  PIIterable_1__IKeyValuePair_2__TGuid__IInspectable = ^IIterable_1__IKeyValuePair_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IMapView`2<Guid,Object>
  IMapView_2__TGuid__IInspectable = interface;
  PIMapView_2__TGuid__IInspectable = ^IMapView_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IMap`2<Guid,Object>
  IMap_2__TGuid__IInspectable = interface;
  PIMap_2__TGuid__IInspectable = ^IMap_2__TGuid__IInspectable;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = interface;
  PIKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = ^IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  IIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = ^IIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  IIterable_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = ^IIterable_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  IMapView_2__HSTRING__Chat_ChatMessageStatus = interface;
  PIMapView_2__HSTRING__Chat_ChatMessageStatus = ^IMapView_2__HSTRING__Chat_ChatMessageStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer = interface;
  PAsyncOperationCompletedHandler_1__Integer = ^AsyncOperationCompletedHandler_1__Integer;

  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer = interface;
  PIAsyncOperation_1__Integer = ^IAsyncOperation_1__Integer;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;

  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Foundation.IReference`1<Windows.ApplicationModel.Email.EmailMailboxSmimeEncryptionAlgorithm>
  IReference_1__Email_EmailMailboxSmimeEncryptionAlgorithm = interface;
  PIReference_1__Email_EmailMailboxSmimeEncryptionAlgorithm = ^IReference_1__Email_EmailMailboxSmimeEncryptionAlgorithm;

  // Windows.Foundation.IReference`1<Windows.ApplicationModel.Email.EmailMailboxSmimeSigningAlgorithm>
  IReference_1__Email_EmailMailboxSmimeSigningAlgorithm = interface;
  PIReference_1__Email_EmailMailboxSmimeSigningAlgorithm = ^IReference_1__Email_EmailMailboxSmimeSigningAlgorithm;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IIterator_1__Email_EmailCertificateValidationStatus = interface;
  PIIterator_1__Email_EmailCertificateValidationStatus = ^IIterator_1__Email_EmailCertificateValidationStatus;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IIterable_1__Email_EmailCertificateValidationStatus = interface;
  PIIterable_1__Email_EmailCertificateValidationStatus = ^IIterable_1__Email_EmailCertificateValidationStatus;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IVectorView_1__Email_EmailCertificateValidationStatus = interface;
  PIVectorView_1__Email_EmailCertificateValidationStatus = ^IVectorView_1__Email_EmailCertificateValidationStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus = ^AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  IAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus = interface;
  PIAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus = ^IAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus = interface;
  PAsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus = ^AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  IAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus = interface;
  PIAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus = ^IAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus = interface;
  PAsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus = ^AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  IAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus = interface;
  PIAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus = ^IAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult = interface;
  PAsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult = ^AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  IAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult = interface;
  PIAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult = ^IAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = interface;
  PAsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = ^AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  IAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = interface;
  PIAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = ^IAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // Windows.Foundation.Collections.IIterator`1<Int32>
  IIterator_1__Integer = interface;
  PIIterator_1__Integer = ^IIterator_1__Integer;

  // Windows.Foundation.Collections.IIterable`1<Int32>
  IIterable_1__Integer = interface;
  PIIterable_1__Integer = ^IIterable_1__Integer;

  // Windows.Foundation.Collections.IVector`1<Int32>
  IVector_1__Integer = interface;
  PIVector_1__Integer = ^IVector_1__Integer;

  // Windows.Foundation.IReference`1<Windows.ApplicationModel.UserDataTasks.UserDataTaskDaysOfWeek>
  IReference_1__UserDataTasks_UserDataTaskDaysOfWeek = interface;
  PIReference_1__UserDataTasks_UserDataTaskDaysOfWeek = ^IReference_1__UserDataTasks_UserDataTaskDaysOfWeek;

  // Windows.Foundation.IReference`1<Windows.ApplicationModel.UserDataTasks.UserDataTaskWeekOfMonth>
  IReference_1__UserDataTasks_UserDataTaskWeekOfMonth = interface;
  PIReference_1__UserDataTasks_UserDataTaskWeekOfMonth = ^IReference_1__UserDataTasks_UserDataTaskWeekOfMonth;

  // Windows.ApplicationModel.Activation.IActivatedEventArgsWithUser
  Activation_IActivatedEventArgsWithUser = interface;
  PActivation_IActivatedEventArgsWithUser = ^Activation_IActivatedEventArgsWithUser;

  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface;
  PTypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = ^TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable;

  // Windows.ApplicationModel.Activation.ILockScreenActivatedEventArgs
  Activation_ILockScreenActivatedEventArgs = interface;
  PActivation_ILockScreenActivatedEventArgs = ^Activation_ILockScreenActivatedEventArgs;

  // Windows.ApplicationModel.AppExtensions.IAppExtension
  AppExtensions_IAppExtension = interface;
  PAppExtensions_IAppExtension = ^AppExtensions_IAppExtension;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IIterator_1__AppExtensions_IAppExtension = interface;
  PIIterator_1__AppExtensions_IAppExtension = ^IIterator_1__AppExtensions_IAppExtension;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IIterable_1__AppExtensions_IAppExtension = interface;
  PIIterable_1__AppExtensions_IAppExtension = ^IIterable_1__AppExtensions_IAppExtension;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IVectorView_1__AppExtensions_IAppExtension = interface;
  PIVectorView_1__AppExtensions_IAppExtension = ^IVectorView_1__AppExtensions_IAppExtension;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension = ^AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  IAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension = interface;
  PIAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension = ^IAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension;

  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs
  AppExtensions_IAppExtensionPackageInstalledEventArgs = interface;
  PAppExtensions_IAppExtensionPackageInstalledEventArgs = ^AppExtensions_IAppExtensionPackageInstalledEventArgs;

  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs
  AppExtensions_IAppExtensionPackageUpdatingEventArgs = interface;
  PAppExtensions_IAppExtensionPackageUpdatingEventArgs = ^AppExtensions_IAppExtensionPackageUpdatingEventArgs;

  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs
  AppExtensions_IAppExtensionPackageUpdatedEventArgs = interface;
  PAppExtensions_IAppExtensionPackageUpdatedEventArgs = ^AppExtensions_IAppExtensionPackageUpdatedEventArgs;

  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs
  AppExtensions_IAppExtensionPackageUninstallingEventArgs = interface;
  PAppExtensions_IAppExtensionPackageUninstallingEventArgs = ^AppExtensions_IAppExtensionPackageUninstallingEventArgs;

  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs
  AppExtensions_IAppExtensionPackageStatusChangedEventArgs = interface;
  PAppExtensions_IAppExtensionPackageStatusChangedEventArgs = ^AppExtensions_IAppExtensionPackageStatusChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueueTimer__IInspectable = ^TypedEventHandler_2__IDispatcherQueueTimer__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface;
  PTypedEventHandler_2__IDispatcherQueue__IInspectable = ^TypedEventHandler_2__IDispatcherQueue__IInspectable;

  // Windows.ApplicationModel.LockScreen.ILockScreenBadge
  LockScreen_ILockScreenBadge = interface;
  PLockScreen_ILockScreenBadge = ^LockScreen_ILockScreenBadge;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockScreenInfo,Object>
  TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable = interface;
  PTypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable = ^TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IIterator_1__LockScreen_ILockScreenBadge = interface;
  PIIterator_1__LockScreen_ILockScreenBadge = ^IIterator_1__LockScreen_ILockScreenBadge;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IIterable_1__LockScreen_ILockScreenBadge = interface;
  PIIterable_1__LockScreen_ILockScreenBadge = ^IIterable_1__LockScreen_ILockScreenBadge;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IVectorView_1__LockScreen_ILockScreenBadge = interface;
  PIVectorView_1__LockScreen_ILockScreenBadge = ^IVectorView_1__LockScreen_ILockScreenBadge;

  // Windows.ApplicationModel.LockScreen.ILockScreenInfo
  LockScreen_ILockScreenInfo = interface;
  PLockScreen_ILockScreenInfo = ^LockScreen_ILockScreenInfo;

  // Windows.ApplicationModel.LockScreen.ILockScreenUnlockingDeferral
  LockScreen_ILockScreenUnlockingDeferral = interface;
  PLockScreen_ILockScreenUnlockingDeferral = ^LockScreen_ILockScreenUnlockingDeferral;

  // Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs
  LockScreen_ILockScreenUnlockingEventArgs = interface;
  PLockScreen_ILockScreenUnlockingEventArgs = ^LockScreen_ILockScreenUnlockingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockApplicationHost,Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs>
  TypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs = interface;
  PTypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs = ^TypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs;

  // Windows.ApplicationModel.LockScreen.ILockApplicationHost
  LockScreen_ILockApplicationHost = interface;
  PLockScreen_ILockApplicationHost = ^LockScreen_ILockApplicationHost;

  // Windows.ApplicationModel.LockScreen.ILockApplicationHostStatics
  LockScreen_ILockApplicationHostStatics = interface;
  PLockScreen_ILockApplicationHostStatics = ^LockScreen_ILockApplicationHostStatics;

  // Windows.ApplicationModel.Payments.IPaymentMerchantInfo
  Payments_IPaymentMerchantInfo = interface;
  PPayments_IPaymentMerchantInfo = ^Payments_IPaymentMerchantInfo;

  // Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
  Payments_IPaymentCurrencyAmount = interface;
  PPayments_IPaymentCurrencyAmount = ^Payments_IPaymentCurrencyAmount;

  // Windows.ApplicationModel.Payments.IPaymentItem
  Payments_IPaymentItem = interface;
  PPayments_IPaymentItem = ^Payments_IPaymentItem;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IIterator_1__Payments_IPaymentItem = interface;
  PIIterator_1__Payments_IPaymentItem = ^IIterator_1__Payments_IPaymentItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IIterable_1__Payments_IPaymentItem = interface;
  PIIterable_1__Payments_IPaymentItem = ^IIterable_1__Payments_IPaymentItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IVectorView_1__Payments_IPaymentItem = interface;
  PIVectorView_1__Payments_IPaymentItem = ^IVectorView_1__Payments_IPaymentItem;

  // Windows.ApplicationModel.Payments.IPaymentShippingOption
  Payments_IPaymentShippingOption = interface;
  PPayments_IPaymentShippingOption = ^Payments_IPaymentShippingOption;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IIterator_1__Payments_IPaymentShippingOption = interface;
  PIIterator_1__Payments_IPaymentShippingOption = ^IIterator_1__Payments_IPaymentShippingOption;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IIterable_1__Payments_IPaymentShippingOption = interface;
  PIIterable_1__Payments_IPaymentShippingOption = ^IIterable_1__Payments_IPaymentShippingOption;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IVectorView_1__Payments_IPaymentShippingOption = interface;
  PIVectorView_1__Payments_IPaymentShippingOption = ^IVectorView_1__Payments_IPaymentShippingOption;

  // Windows.ApplicationModel.Payments.IPaymentDetailsModifier
  Payments_IPaymentDetailsModifier = interface;
  PPayments_IPaymentDetailsModifier = ^Payments_IPaymentDetailsModifier;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IIterator_1__Payments_IPaymentDetailsModifier = interface;
  PIIterator_1__Payments_IPaymentDetailsModifier = ^IIterator_1__Payments_IPaymentDetailsModifier;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IIterable_1__Payments_IPaymentDetailsModifier = interface;
  PIIterable_1__Payments_IPaymentDetailsModifier = ^IIterable_1__Payments_IPaymentDetailsModifier;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IVectorView_1__Payments_IPaymentDetailsModifier = interface;
  PIVectorView_1__Payments_IPaymentDetailsModifier = ^IVectorView_1__Payments_IPaymentDetailsModifier;

  // Windows.ApplicationModel.Payments.IPaymentDetails
  Payments_IPaymentDetails = interface;
  PPayments_IPaymentDetails = ^Payments_IPaymentDetails;

  // Windows.ApplicationModel.Payments.IPaymentMethodData
  Payments_IPaymentMethodData = interface;
  PPayments_IPaymentMethodData = ^Payments_IPaymentMethodData;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IIterator_1__Payments_IPaymentMethodData = interface;
  PIIterator_1__Payments_IPaymentMethodData = ^IIterator_1__Payments_IPaymentMethodData;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IIterable_1__Payments_IPaymentMethodData = interface;
  PIIterable_1__Payments_IPaymentMethodData = ^IIterable_1__Payments_IPaymentMethodData;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IVectorView_1__Payments_IPaymentMethodData = interface;
  PIVectorView_1__Payments_IPaymentMethodData = ^IVectorView_1__Payments_IPaymentMethodData;

  // Windows.ApplicationModel.Payments.IPaymentOptions
  Payments_IPaymentOptions = interface;
  PPayments_IPaymentOptions = ^Payments_IPaymentOptions;

  // Windows.ApplicationModel.Payments.IPaymentRequest
  Payments_IPaymentRequest = interface;
  PPayments_IPaymentRequest = ^Payments_IPaymentRequest;

  // Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
  Payments_IPaymentRequestChangedResult = interface;
  PPayments_IPaymentRequestChangedResult = ^Payments_IPaymentRequestChangedResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult = interface;
  PAsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult = ^AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  IAsyncOperation_1__Payments_IPaymentRequestChangedResult = interface;
  PIAsyncOperation_1__Payments_IPaymentRequestChangedResult = ^IAsyncOperation_1__Payments_IPaymentRequestChangedResult;

  // Windows.ApplicationModel.Payments.IPaymentAddress
  Payments_IPaymentAddress = interface;
  PPayments_IPaymentAddress = ^Payments_IPaymentAddress;

  // Windows.ApplicationModel.Payments.IPaymentToken
  Payments_IPaymentToken = interface;
  PPayments_IPaymentToken = ^Payments_IPaymentToken;

  // Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult
  Payments_IPaymentCanMakePaymentResult = interface;
  PPayments_IPaymentCanMakePaymentResult = ^Payments_IPaymentCanMakePaymentResult;

  // Windows.ApplicationModel.Payments.IPaymentResponse
  Payments_IPaymentResponse = interface;
  PPayments_IPaymentResponse = ^Payments_IPaymentResponse;

  // Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs
  Payments_IPaymentRequestChangedArgs = interface;
  PPayments_IPaymentRequestChangedArgs = ^Payments_IPaymentRequestChangedArgs;

  // Windows.ApplicationModel.Payments.PaymentRequestChangedHandler
  Payments_PaymentRequestChangedHandler = interface;
  PPayments_PaymentRequestChangedHandler = ^Payments_PaymentRequestChangedHandler;

  // Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult
  Payments_IPaymentRequestSubmitResult = interface;
  PPayments_IPaymentRequestSubmitResult = ^Payments_IPaymentRequestSubmitResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult = interface;
  PAsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult = ^AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  IAsyncOperation_1__Payments_IPaymentRequestSubmitResult = interface;
  PIAsyncOperation_1__Payments_IPaymentRequestSubmitResult = ^IAsyncOperation_1__Payments_IPaymentRequestSubmitResult;

  // Windows.ApplicationModel.Payments.IPaymentMediator
  Payments_IPaymentMediator = interface;
  PPayments_IPaymentMediator = ^Payments_IPaymentMediator;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult = interface;
  PAsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult = ^AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult = interface;
  PIAsyncOperation_1__Payments_IPaymentCanMakePaymentResult = ^IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult;

  // Windows.ApplicationModel.Payments.IPaymentMediator2
  Payments_IPaymentMediator2 = interface;
  PPayments_IPaymentMediator2 = ^Payments_IPaymentMediator2;

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

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,String>
  MapChangedEventHandler_2__HSTRING__HSTRING = interface;
  PMapChangedEventHandler_2__HSTRING__HSTRING = ^MapChangedEventHandler_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IObservableMap`2<String,String>
  IObservableMap_2__HSTRING__HSTRING = interface;
  PIObservableMap_2__HSTRING__HSTRING = ^IObservableMap_2__HSTRING__HSTRING;

  // Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackage>
  IVector_1__IPackage = interface;
  PIVector_1__IPackage = ^IVector_1__IPackage;

  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IIterator_1__Store_Preview_StoreSystemFeature = interface;
  PIIterator_1__Store_Preview_StoreSystemFeature = ^IIterator_1__Store_Preview_StoreSystemFeature;

  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IIterable_1__Store_Preview_StoreSystemFeature = interface;
  PIIterable_1__Store_Preview_StoreSystemFeature = ^IIterable_1__Store_Preview_StoreSystemFeature;

  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IVectorView_1__Store_Preview_StoreSystemFeature = interface;
  PIVectorView_1__Store_Preview_StoreSystemFeature = ^IVectorView_1__Store_Preview_StoreSystemFeature;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature = ^AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  IAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature = interface;
  PIAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature = ^IAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature;

  // Windows.ApplicationModel.Store.LicenseChangedEventHandler
  Store_LicenseChangedEventHandler = interface;
  PStore_LicenseChangedEventHandler = ^Store_LicenseChangedEventHandler;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Store.FulfillmentResult>
  AsyncOperationCompletedHandler_1__Store_FulfillmentResult = interface;
  PAsyncOperationCompletedHandler_1__Store_FulfillmentResult = ^AsyncOperationCompletedHandler_1__Store_FulfillmentResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Store.FulfillmentResult>
  IAsyncOperation_1__Store_FulfillmentResult = interface;
  PIAsyncOperation_1__Store_FulfillmentResult = ^IAsyncOperation_1__Store_FulfillmentResult;

  // Windows.ApplicationModel.Store.IProductListingWithConsumables
  Store_IProductListingWithConsumables = interface;
  PStore_IProductListingWithConsumables = ^Store_IProductListingWithConsumables;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface;
  PIKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = ^IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = ^IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = ^IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  IMapView_2__HSTRING__IVectorView_1__HSTRING = interface;
  PIMapView_2__HSTRING__IVectorView_1__HSTRING = ^IMapView_2__HSTRING__IVectorView_1__HSTRING;

  // Windows.Foundation.IReference`1<Int16>
  IReference_1__SmallInt = interface;
  PIReference_1__SmallInt = ^IReference_1__SmallInt;

  // Windows.Foundation.Collections.IIterator`1<Guid>
  IIterator_1__TGuid = interface;
  PIIterator_1__TGuid = ^IIterator_1__TGuid;

  // Windows.Foundation.Collections.IIterable`1<Guid>
  IIterable_1__TGuid = interface;
  PIIterable_1__TGuid = ^IIterable_1__TGuid;

  // Windows.Foundation.Collections.IVectorView`1<Guid>
  IVectorView_1__TGuid = interface;
  PIVectorView_1__TGuid = ^IVectorView_1__TGuid;

  // Windows.Foundation.Collections.IVector`1<Guid>
  IVector_1__TGuid = interface;
  PIVector_1__TGuid = ^IVector_1__TGuid;

  // Windows.ApplicationModel.Activation.IContactsProviderActivatedEventArgs
  Activation_IContactsProviderActivatedEventArgs = interface;
  PActivation_IContactsProviderActivatedEventArgs = ^Activation_IContactsProviderActivatedEventArgs;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.ApplicationModel Interfaces
  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus_Delegate_Base = interface(IUnknown)
  ['{7A27B20F-647A-53FC-80F0-A79D083CE531}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus = interface(AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  IAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus_Base = interface(IInspectable)
  ['{8528BE80-7CE9-5668-8E48-469AE5BA9EAD}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  // Used Types:  Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Calls.VoipPhoneCallResourceReservationStatus>
  IAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus = interface(IAsyncOperation_1__Calls_VoipPhoneCallResourceReservationStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus; safecall;
    function GetResults: Calls_VoipPhoneCallResourceReservationStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Calls_VoipPhoneCallResourceReservationStatus read get_Completed write put_Completed;
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

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.StartupTaskState>
  AsyncOperationCompletedHandler_1__StartupTaskState_Delegate_Base = interface(IUnknown)
  ['{70A0BF67-19E8-5A86-A32E-3C9863825A04}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.StartupTaskState>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.StartupTaskState>
  AsyncOperationCompletedHandler_1__StartupTaskState = interface(AsyncOperationCompletedHandler_1__StartupTaskState_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__StartupTaskState; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.StartupTaskState>
  IAsyncOperation_1__StartupTaskState_Base = interface(IInspectable)
  ['{5239A934-80E2-518F-B819-1F316F379A3F}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.StartupTaskState>
  // Used Types:  Windows.ApplicationModel.StartupTaskState
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.StartupTaskState>
  IAsyncOperation_1__StartupTaskState = interface(IAsyncOperation_1__StartupTaskState_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__StartupTaskState); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__StartupTaskState; safecall;
    function GetResults: StartupTaskState; safecall;
    property Completed: AsyncOperationCompletedHandler_1__StartupTaskState read get_Completed write put_Completed;
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
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.ApplicationModel.Search.Core.ISearchSuggestion>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.ApplicationModel.Search.Core.ISearchSuggestion>
  VectorChangedEventHandler_1__Search_Core_ISearchSuggestion = interface(IUnknown)
  ['{3528538E-1115-54FD-8943-A340AE8FEAB1}']
    procedure Invoke(sender: IObservableVector_1__Search_Core_ISearchSuggestion; event: IVectorChangedEventArgs); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.ApplicationModel.Search.Core.ISearchSuggestion>
  }
  // Windows.Foundation.Collections.IObservableVector`1<Windows.ApplicationModel.Search.Core.ISearchSuggestion>
  IObservableVector_1__Search_Core_ISearchSuggestion = interface(IInspectable)
  ['{944A3DA2-8D2E-5EAE-8E5A-99D6B12F6043}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__Search_Core_ISearchSuggestion): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IAppDisplayInfo
  }
  // Windows.ApplicationModel.IAppInfo
  [WinRTClassNameAttribute(SAppInfo)]
  IAppInfo = interface(IInspectable)
  ['{CF7F59B3-6A09-4DE8-A6C0-5792D56880D1}']
    function get_Id: HSTRING; safecall;
    function get_AppUserModelId: HSTRING; safecall;
    function get_DisplayInfo: IAppDisplayInfo; safecall;
    function get_PackageFamilyName: HSTRING; safecall;
    property AppUserModelId: HSTRING read get_AppUserModelId;
    property DisplayInfo: IAppDisplayInfo read get_DisplayInfo;
    property Id: HSTRING read get_Id;
    property PackageFamilyName: HSTRING read get_PackageFamilyName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.IPackageIdWithMetadata
  IPackageIdWithMetadata = interface(IInspectable)
  ['{40577A7C-0C9E-443D-9074-855F5CE0A08D}']
    function get_ProductId: HSTRING; safecall;
    function get_Author: HSTRING; safecall;
    property Author: HSTRING read get_Author;
    property ProductId: HSTRING read get_ProductId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  String
  }
  // Windows.ApplicationModel.IPackageWithMetadata
  IPackageWithMetadata = interface(IInspectable)
  ['{95949780-1DE9-40F2-B452-0DE9F1910012}']
    function get_InstallDate: DateTime; safecall;
    function GetThumbnailToken: HSTRING; safecall;
    procedure Launch(parameters: HSTRING); safecall;
    property InstallDate: DateTime read get_InstallDate;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.IPackageStatus
  [WinRTClassNameAttribute(SPackageStatus)]
  IPackageStatus = interface(IInspectable)
  ['{5FE74F71-A365-4C09-A02D-046D525EA1DA}']
    function VerifyIsOK: Boolean; safecall;
    function get_NotAvailable: Boolean; safecall;
    function get_PackageOffline: Boolean; safecall;
    function get_DataOffline: Boolean; safecall;
    function get_Disabled: Boolean; safecall;
    function get_NeedsRemediation: Boolean; safecall;
    function get_LicenseIssue: Boolean; safecall;
    function get_Modified: Boolean; safecall;
    function get_Tampered: Boolean; safecall;
    function get_DependencyIssue: Boolean; safecall;
    function get_Servicing: Boolean; safecall;
    function get_DeploymentInProgress: Boolean; safecall;
    property DataOffline: Boolean read get_DataOffline;
    property DependencyIssue: Boolean read get_DependencyIssue;
    property DeploymentInProgress: Boolean read get_DeploymentInProgress;
    property Disabled: Boolean read get_Disabled;
    property LicenseIssue: Boolean read get_LicenseIssue;
    property Modified: Boolean read get_Modified;
    property NeedsRemediation: Boolean read get_NeedsRemediation;
    property NotAvailable: Boolean read get_NotAvailable;
    property PackageOffline: Boolean read get_PackageOffline;
    property Servicing: Boolean read get_Servicing;
    property Tampered: Boolean read get_Tampered;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.IPackageStatus2
  IPackageStatus2 = interface(IInspectable)
  ['{F428FA93-7C56-4862-ACFA-ABAEDCC0694D}']
    function get_IsPartiallyStaged: Boolean; safecall;
    property IsPartiallyStaged: Boolean read get_IsPartiallyStaged;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackage>
  IIterator_1__IPackage_Base = interface(IInspectable)
  ['{0217F069-025C-5EE6-A87F-E782E3B623AE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackage>
  IIterator_1__IPackage = interface(IIterator_1__IPackage_Base)
  ['{33045CC3-8892-5AAA-AB26-83F5614F6792}']
    function get_Current: IPackage; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPackage): Cardinal; safecall;
    property Current: IPackage read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackage>
  IIterable_1__IPackage_Base = interface(IInspectable)
  ['{69AD6AA7-0C49-5F27-A5EB-EF4D59467B6D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackage>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackage>
  IIterable_1__IPackage = interface(IIterable_1__IPackage_Base)
  ['{9ECA5389-C150-5A23-98C4-E5A26309B5B3}']
    function First: IIterator_1__IPackage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.IPackage2
  IPackage2 = interface(IInspectable)
  ['{A6612FB6-7688-4ACE-95FB-359538E7AA01}']
    function get_DisplayName: HSTRING; safecall;
    function get_PublisherDisplayName: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_Logo: IUriRuntimeClass; safecall;
    function get_IsResourcePackage: Boolean; safecall;
    function get_IsBundle: Boolean; safecall;
    function get_IsDevelopmentMode: Boolean; safecall;
    property Description: HSTRING read get_Description;
    property DisplayName: HSTRING read get_DisplayName;
    property IsBundle: Boolean read get_IsBundle;
    property IsDevelopmentMode: Boolean read get_IsDevelopmentMode;
    property IsResourcePackage: Boolean read get_IsResourcePackage;
    property Logo: IUriRuntimeClass read get_Logo;
    property PublisherDisplayName: HSTRING read get_PublisherDisplayName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackageStatus
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Core.IAppListEntry>>
  }
  // Windows.ApplicationModel.IPackage3
  IPackage3 = interface(IInspectable)
  ['{5F738B61-F86A-4917-93D1-F1EE9D3B35D9}']
    function get_Status: IPackageStatus; safecall;
    function get_InstalledDate: DateTime; safecall;
    function GetAppListEntriesAsync: IInspectable{IAsyncOperation_1__IVectorView_1__IAppListEntry}; safecall;
    property InstalledDate: DateTime read get_InstalledDate;
    property Status: IPackageStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.PackageSignatureKind
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  }
  // Windows.ApplicationModel.IPackage4
  IPackage4 = interface(IInspectable)
  ['{65AED1AE-B95B-450C-882B-6255187F397E}']
    function get_SignatureKind: PackageSignatureKind; safecall;
    function get_IsOptional: Boolean; safecall;
    function VerifyContentIntegrityAsync: IAsyncOperation_1__Boolean; safecall;
    property IsOptional: Boolean read get_IsOptional;
    property SignatureKind: PackageSignatureKind read get_SignatureKind;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.PackageContentGroupState
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.IPackageContentGroup
  IPackageContentGroup = interface(IInspectable)
  ['{8F62695D-120A-4798-B5E1-5800DDA8F2E1}']
    function get_Package: IPackage; safecall;
    function get_Name: HSTRING; safecall;
    function get_State: PackageContentGroupState; safecall;
    function get_IsRequired: Boolean; safecall;
    property IsRequired: Boolean read get_IsRequired;
    property Name: HSTRING read get_Name;
    property Package: IPackage read get_Package;
    property State: PackageContentGroupState read get_State;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackageContentGroup>
  IIterator_1__IPackageContentGroup_Base = interface(IInspectable)
  ['{5F23D323-28F5-560F-A40E-6F3827F82E9F}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.IPackageContentGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackageContentGroup>
  IIterator_1__IPackageContentGroup = interface(IIterator_1__IPackageContentGroup_Base)
  ['{FBD3B150-A8CF-5061-8186-E72C2EB0569A}']
    function get_Current: IPackageContentGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPackageContentGroup): Cardinal; safecall;
    property Current: IPackageContentGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackageContentGroup>
  IIterable_1__IPackageContentGroup_Base = interface(IInspectable)
  ['{D7DD1456-4805-5768-A25D-99641B096491}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IPackageContentGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IPackageContentGroup>
  IIterable_1__IPackageContentGroup = interface(IIterable_1__IPackageContentGroup_Base)
  ['{DCF0DE3A-AFC2-5CB4-82D5-083EB242E820}']
    function First: IIterator_1__IPackageContentGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackageContentGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IPackageContentGroup>
  IVectorView_1__IPackageContentGroup = interface(IInspectable)
  ['{B80F5A11-40E9-5694-998F-F8F16BBD6E78}']
    function GetAt(index: Cardinal): IPackageContentGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPackageContentGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPackageContentGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackageContentGroup
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IPackageContentGroup>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>
  IVector_1__IPackageContentGroup = interface(IInspectable)
  ['{97EF46B2-B1E4-5150-A8BB-BB4FE6A45B7A}']
    function GetAt(index: Cardinal): IPackageContentGroup; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IPackageContentGroup; safecall;
    function IndexOf(value: IPackageContentGroup; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IPackageContentGroup); safecall;
    procedure InsertAt(index: Cardinal; value: IPackageContentGroup); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IPackageContentGroup); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPackageContentGroup): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIPackageContentGroup); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup_Delegate_Base = interface(IUnknown)
  ['{52465BF3-3CA6-5681-A7B4-91847757B5FD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup = interface(AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup_Delegate_Base)
  ['{9DF4403A-879F-5481-BDB6-712E26321F23}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVector_1__IPackageContentGroup; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  IAsyncOperation_1__IVector_1__IPackageContentGroup_Base = interface(IInspectable)
  ['{929E3C29-BF29-5594-BC63-67DB43A539EA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  IAsyncOperation_1__IVector_1__IPackageContentGroup = interface(IAsyncOperation_1__IVector_1__IPackageContentGroup_Base)
  ['{48E9F438-96F7-54A4-9239-DCE346EE2580}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup; safecall;
    function GetResults: IVector_1__IPackageContentGroup; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVector_1__IPackageContentGroup read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.IPackageContentGroup>
  AsyncOperationCompletedHandler_1__IPackageContentGroup_Delegate_Base = interface(IUnknown)
  ['{2253DC38-9A1A-5364-9A3B-03A7DA615499}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.IPackageContentGroup>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.IPackageContentGroup>
  AsyncOperationCompletedHandler_1__IPackageContentGroup = interface(AsyncOperationCompletedHandler_1__IPackageContentGroup_Delegate_Base)
  ['{B22BEECF-1BFC-5D65-9148-9B49796B0511}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IPackageContentGroup; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.IPackageContentGroup>
  IAsyncOperation_1__IPackageContentGroup_Base = interface(IInspectable)
  ['{BBD292E3-DB9F-5802-A488-40F156332C04}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.IPackageContentGroup>
  // Used Types:  Windows.ApplicationModel.IPackageContentGroup
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.IPackageContentGroup>
  IAsyncOperation_1__IPackageContentGroup = interface(IAsyncOperation_1__IPackageContentGroup_Base)
  ['{422F6877-7C41-5240-A94C-B1A9E7C1DD19}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IPackageContentGroup); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IPackageContentGroup; safecall;
    function GetResults: IPackageContentGroup; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IPackageContentGroup read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackageContentGroup>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.IPackageContentGroup>
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  }
  // Windows.ApplicationModel.IPackage5
  IPackage5 = interface(IInspectable)
  ['{0E842DD4-D9AC-45ED-9A1E-74CE056B2635}']
    function GetContentGroupsAsync: IAsyncOperation_1__IVector_1__IPackageContentGroup; safecall;
    function GetContentGroupAsync(name: HSTRING): IAsyncOperation_1__IPackageContentGroup; safecall;
    function StageContentGroupsAsync(names: IIterable_1__HSTRING): IAsyncOperation_1__IVector_1__IPackageContentGroup; overload; safecall;
    function StageContentGroupsAsync(names: IIterable_1__HSTRING; moveToHeadOfQueue: Boolean): IAsyncOperation_1__IVector_1__IPackageContentGroup; overload; safecall;
    function SetInUseAsync(inUse: Boolean): IAsyncOperation_1__Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.ApplicationModel.IPackageStatics
  [WinRTClassNameAttribute(SPackageRT)]
  IPackageStatics = interface(IInspectable)
  ['{4E534BDF-2960-4878-97A4-9624DEB72F2D}']
    function get_Current: IPackage; safecall;
    property Current: IPackage read get_Current;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.ApplicationModel.IPackageStagingEventArgs
  [WinRTClassNameAttribute(SPackageStagingEventArgs)]
  IPackageStagingEventArgs = interface(IInspectable)
  ['{1041682D-54E2-4F51-B828-9EF7046C210F}']
    function get_ActivityId: TGuid; safecall;
    function get_Package: IPackage; safecall;
    function get_Progress: Double; safecall;
    function get_IsComplete: Boolean; safecall;
    function get_ErrorCode: HRESULT; safecall;
    property ActivityId: TGuid read get_ActivityId;
    property ErrorCode: HRESULT read get_ErrorCode;
    property IsComplete: Boolean read get_IsComplete;
    property Package: IPackage read get_Package;
    property Progress: Double read get_Progress;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.ApplicationModel.IPackageInstallingEventArgs
  [WinRTClassNameAttribute(SPackageInstallingEventArgs)]
  IPackageInstallingEventArgs = interface(IInspectable)
  ['{97741EB7-AB7A-401A-8B61-EB0E7FAFF237}']
    function get_ActivityId: TGuid; safecall;
    function get_Package: IPackage; safecall;
    function get_Progress: Double; safecall;
    function get_IsComplete: Boolean; safecall;
    function get_ErrorCode: HRESULT; safecall;
    property ActivityId: TGuid read get_ActivityId;
    property ErrorCode: HRESULT read get_ErrorCode;
    property IsComplete: Boolean read get_IsComplete;
    property Package: IPackage read get_Package;
    property Progress: Double read get_Progress;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.ApplicationModel.IPackageUpdatingEventArgs
  [WinRTClassNameAttribute(SPackageUpdatingEventArgs)]
  IPackageUpdatingEventArgs = interface(IInspectable)
  ['{CD7B4228-FD74-443E-B114-23E677B0E86F}']
    function get_ActivityId: TGuid; safecall;
    function get_SourcePackage: IPackage; safecall;
    function get_TargetPackage: IPackage; safecall;
    function get_Progress: Double; safecall;
    function get_IsComplete: Boolean; safecall;
    function get_ErrorCode: HRESULT; safecall;
    property ActivityId: TGuid read get_ActivityId;
    property ErrorCode: HRESULT read get_ErrorCode;
    property IsComplete: Boolean read get_IsComplete;
    property Progress: Double read get_Progress;
    property SourcePackage: IPackage read get_SourcePackage;
    property TargetPackage: IPackage read get_TargetPackage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.ApplicationModel.IPackageUninstallingEventArgs
  [WinRTClassNameAttribute(SPackageUninstallingEventArgs)]
  IPackageUninstallingEventArgs = interface(IInspectable)
  ['{4443AA52-AB22-44CD-82BB-4EC9B827367A}']
    function get_ActivityId: TGuid; safecall;
    function get_Package: IPackage; safecall;
    function get_Progress: Double; safecall;
    function get_IsComplete: Boolean; safecall;
    function get_ErrorCode: HRESULT; safecall;
    property ActivityId: TGuid read get_ActivityId;
    property ErrorCode: HRESULT read get_ErrorCode;
    property IsComplete: Boolean read get_IsComplete;
    property Package: IPackage read get_Package;
    property Progress: Double read get_Progress;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.ApplicationModel.IPackageStatusChangedEventArgs
  [WinRTClassNameAttribute(SPackageStatusChangedEventArgs)]
  IPackageStatusChangedEventArgs = interface(IInspectable)
  ['{437D714D-BD80-4A70-BC50-F6E796509575}']
    function get_Package: IPackage; safecall;
    property Package: IPackage read get_Package;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Double
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.HResult
  // Used Types:  String
  }
  // Windows.ApplicationModel.IPackageContentGroupStagingEventArgs
  [WinRTClassNameAttribute(SPackageContentGroupStagingEventArgs)]
  IPackageContentGroupStagingEventArgs = interface(IInspectable)
  ['{3D7BC27E-6F27-446C-986E-D4733D4D9113}']
    function get_ActivityId: TGuid; safecall;
    function get_Package: IPackage; safecall;
    function get_Progress: Double; safecall;
    function get_IsComplete: Boolean; safecall;
    function get_ErrorCode: HRESULT; safecall;
    function get_ContentGroupName: HSTRING; safecall;
    function get_IsContentGroupRequired: Boolean; safecall;
    property ActivityId: TGuid read get_ActivityId;
    property ContentGroupName: HSTRING read get_ContentGroupName;
    property ErrorCode: HRESULT read get_ErrorCode;
    property IsComplete: Boolean read get_IsComplete;
    property IsContentGroupRequired: Boolean read get_IsContentGroupRequired;
    property Package: IPackage read get_Package;
    property Progress: Double read get_Progress;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.ApplicationModel.AppService.IAppServiceDeferral
  [WinRTClassNameAttribute(SAppService_AppServiceDeferral)]
  AppService_IAppServiceDeferral = interface(IInspectable)
  ['{7E1B5322-EAB0-4248-AE04-FDF93838E472}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.AppService.AppServiceClosedStatus
  }
  // Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs
  [WinRTClassNameAttribute(SAppService_AppServiceClosedEventArgs)]
  AppService_IAppServiceClosedEventArgs = interface(IInspectable)
  ['{DE6016F6-CB03-4D35-AC8D-CC6303239731}']
    function get_Status: AppService_AppServiceClosedStatus; safecall;
    property Status: AppService_AppServiceClosedStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus_Delegate_Base = interface(IUnknown)
  ['{B824383D-32E0-5579-8670-A06A61457F20}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus = interface(AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__AppService_AppServiceResponseStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  IAsyncOperation_1__AppService_AppServiceResponseStatus_Base = interface(IInspectable)
  ['{98FDB842-5A0B-539A-A35C-55AC5F228612}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  // Used Types:  Windows.ApplicationModel.AppService.AppServiceResponseStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  IAsyncOperation_1__AppService_AppServiceResponseStatus = interface(IAsyncOperation_1__AppService_AppServiceResponseStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus; safecall;
    function GetResults: AppService_AppServiceResponseStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__AppService_AppServiceResponseStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceResponseStatus>
  }
  // Windows.ApplicationModel.AppService.IAppServiceRequest
  [WinRTClassNameAttribute(SAppService_AppServiceRequest)]
  AppService_IAppServiceRequest = interface(IInspectable)
  ['{20E58D9D-18DE-4B01-80BA-90A76204E3C8}']
    function get_Message: IPropertySet; safecall;
    function SendResponseAsync(message: IPropertySet): IAsyncOperation_1__AppService_AppServiceResponseStatus; safecall;
    property Message: IPropertySet read get_Message;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceRequest
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceDeferral
  }
  // Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs
  [WinRTClassNameAttribute(SAppService_AppServiceRequestReceivedEventArgs)]
  AppService_IAppServiceRequestReceivedEventArgs = interface(IInspectable)
  ['{6E122360-FF65-44AE-9E45-857FE4180681}']
    function get_Request: AppService_IAppServiceRequest; safecall;
    function GetDeferral: AppService_IAppServiceDeferral; safecall;
    property Request: AppService_IAppServiceRequest read get_Request;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus_Delegate_Base = interface(IUnknown)
  ['{B6C6BBF2-72CA-5799-A651-D1990670097B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus = interface(AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__AppService_AppServiceConnectionStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  IAsyncOperation_1__AppService_AppServiceConnectionStatus_Base = interface(IInspectable)
  ['{0D0E6663-2639-5A9A-9CBC-30D7D4CE533B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  // Used Types:  Windows.ApplicationModel.AppService.AppServiceConnectionStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  IAsyncOperation_1__AppService_AppServiceConnectionStatus = interface(IAsyncOperation_1__AppService_AppServiceConnectionStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus; safecall;
    function GetResults: AppService_AppServiceConnectionStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__AppService_AppServiceConnectionStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.ApplicationModel.AppService.AppServiceResponseStatus
  }
  // Windows.ApplicationModel.AppService.IAppServiceResponse
  [WinRTClassNameAttribute(SAppService_AppServiceResponse)]
  AppService_IAppServiceResponse = interface(IInspectable)
  ['{8D503CEC-9AA3-4E68-9559-9DE63E372CE4}']
    function get_Message: IPropertySet; safecall;
    function get_Status: AppService_AppServiceResponseStatus; safecall;
    property Message: IPropertySet read get_Message;
    property Status: AppService_AppServiceResponseStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse_Delegate_Base = interface(IUnknown)
  ['{7EA7D7EC-E164-52C3-8E32-BBA7126D9028}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse = interface(AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse_Delegate_Base)
  ['{5A4BFBFF-4CE1-5E2F-B758-8FADCC08AA8C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__AppService_IAppServiceResponse; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  IAsyncOperation_1__AppService_IAppServiceResponse_Base = interface(IInspectable)
  ['{48755A7C-C88F-5EF0-9B4C-876FCC2610B4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceResponse
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  IAsyncOperation_1__AppService_IAppServiceResponse = interface(IAsyncOperation_1__AppService_IAppServiceResponse_Base)
  ['{D75C9CFD-0669-5A8E-AE3C-6DAEF08F6377}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse; safecall;
    function GetResults: AppService_IAppServiceResponse; safecall;
    property Completed: AsyncOperationCompletedHandler_1__AppService_IAppServiceResponse read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs>
  TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{18C67D61-4176-5553-B18D-D8F57FE79552}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceConnection
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs>
  TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs = interface(TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs_Delegate_Base)
  ['{6AE5027F-820F-553A-9187-32660AA33A35}']
    procedure Invoke(sender: AppService_IAppServiceConnection; args: AppService_IAppServiceRequestReceivedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs>
  TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E4EFA98D-4BFC-5E61-A233-688F5F06521F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceConnection
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs>
  TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs = interface(TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs_Delegate_Base)
  ['{71776122-4988-5F38-8637-D8876D35AD61}']
    procedure Invoke(sender: AppService_IAppServiceConnection; args: AppService_IAppServiceClosedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.IAppServiceResponse>
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.AppService.IAppServiceConnection,Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs>
  }
  // Windows.ApplicationModel.AppService.IAppServiceConnection
  [WinRTClassNameAttribute(SAppService_AppServiceConnection)]
  AppService_IAppServiceConnection = interface(IInspectable)
  ['{9DD474A2-871F-4D52-89A9-9E090531BD27}']
    function get_AppServiceName: HSTRING; safecall;
    procedure put_AppServiceName(value: HSTRING); safecall;
    function get_PackageFamilyName: HSTRING; safecall;
    procedure put_PackageFamilyName(value: HSTRING); safecall;
    function OpenAsync: IAsyncOperation_1__AppService_AppServiceConnectionStatus; safecall;
    function SendMessageAsync(message: IPropertySet): IAsyncOperation_1__AppService_IAppServiceResponse; safecall;
    function add_RequestReceived(handler: TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceRequestReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RequestReceived(token: EventRegistrationToken); safecall;
    function add_ServiceClosed(handler: TypedEventHandler_2__AppService_IAppServiceConnection__AppService_IAppServiceClosedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ServiceClosed(token: EventRegistrationToken); safecall;
    property AppServiceName: HSTRING read get_AppServiceName write put_AppServiceName;
    property PackageFamilyName: HSTRING read get_PackageFamilyName write put_PackageFamilyName;
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
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.AppService.AppServiceConnectionStatus>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemConnectionRequest
  // Used Types:  Windows.System.IUser
  }
  // Windows.ApplicationModel.AppService.IAppServiceConnection2
  AppService_IAppServiceConnection2 = interface(IInspectable)
  ['{8BDFCD5F-2302-4FBD-8061-52511C2F8BF9}']
    function OpenRemoteAsync(remoteSystemConnectionRequest: RemoteSystems_IRemoteSystemConnectionRequest): IAsyncOperation_1__AppService_AppServiceConnectionStatus; safecall;
    function get_User: IUser; safecall;
    procedure put_User(value: IUser); safecall;
    property User: IUser read get_User write put_User;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.AppService.IAppServiceConnection
  }
  // Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
  [WinRTClassNameAttribute(SAppService_AppServiceTriggerDetails)]
  AppService_IAppServiceTriggerDetails = interface(IInspectable)
  ['{88A2DCAC-AD28-41B8-80BB-BDF1B2169E19}']
    function get_Name: HSTRING; safecall;
    function get_CallerPackageFamilyName: HSTRING; safecall;
    function get_AppServiceConnection: AppService_IAppServiceConnection; safecall;
    property AppServiceConnection: AppService_IAppServiceConnection read get_AppServiceConnection;
    property CallerPackageFamilyName: HSTRING read get_CallerPackageFamilyName;
    property Name: HSTRING read get_Name;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.AppService.IAppServiceTriggerDetails2
  AppService_IAppServiceTriggerDetails2 = interface(IInspectable)
  ['{E83D54B2-28CC-43F2-B465-C0482E59E2DC}']
    function get_IsRemoteSystemConnection: Boolean; safecall;
    property IsRemoteSystemConnection: Boolean read get_IsRemoteSystemConnection;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  String
  }
  // Windows.ApplicationModel.AppService.IAppServiceTriggerDetails3
  AppService_IAppServiceTriggerDetails3 = interface(IInspectable)
  ['{FBD71E21-7939-4E68-9E3C-7780147AABB6}']
    function CheckCallerForCapabilityAsync(capabilityName: HSTRING): IAsyncOperation_1__Boolean; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IAppInfo>
  IIterator_1__IAppInfo_Base = interface(IInspectable)
  ['{69CEC62C-41EB-5D69-A475-29EE22323DD8}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.IAppInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IAppInfo>
  IIterator_1__IAppInfo = interface(IIterator_1__IAppInfo_Base)
  ['{9CA3E755-877F-5FA6-9C68-CEB20FF87804}']
    function get_Current: IAppInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIAppInfo): Cardinal; safecall;
    property Current: IAppInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IAppInfo>
  IIterable_1__IAppInfo_Base = interface(IInspectable)
  ['{63D0BFFE-0E34-55B3-83D5-314CAFF2B137}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.IAppInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.IAppInfo>
  IIterable_1__IAppInfo = interface(IIterable_1__IAppInfo_Base)
  ['{F5021AB5-F6AC-59C9-9632-6E82797B6196}']
    function First: IIterator_1__IAppInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IAppInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>
  IVectorView_1__IAppInfo = interface(IInspectable)
  ['{A7320DC1-90CE-5568-98B9-707AC47E5C33}']
    function GetAt(index: Cardinal): IAppInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IAppInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo_Delegate_Base = interface(IUnknown)
  ['{07F25B6F-F054-5649-A5CE-B348DDC618B6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo_Delegate_Base)
  ['{3FA954FE-6B27-52B7-A97F-E691E1BC3B53}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IAppInfo; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  IAsyncOperation_1__IVectorView_1__IAppInfo_Base = interface(IInspectable)
  ['{07543D91-8610-5152-B0E4-43D6E4CDD0CB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IAppInfo>>
  IAsyncOperation_1__IVectorView_1__IAppInfo = interface(IAsyncOperation_1__IVectorView_1__IAppInfo_Base)
  ['{74E17AC2-5438-594C-9B2B-4D85BB307A73}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo; safecall;
    function GetResults: IVectorView_1__IAppInfo; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IAppInfo read get_Completed write put_Completed;
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

  {
  // Used Types:  UInt32
  }
  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING_Delegate_Base = interface(IUnknown)
  ['{7C7899BE-5F2E-5BF3-ADE5-AD98B772C7CD}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING = interface(AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING_Delegate_Base)
  ['{7C7899BE-5F2E-5BF3-ADE5-AD98B772C7CD}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING_Base = interface(IInspectable)
  ['{2F92B529-119B-575A-A419-3904B4E41AF2}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  IAsyncOperation_1__IVectorView_1__HSTRING = interface(IAsyncOperation_1__IVectorView_1__HSTRING_Base)
  ['{2F92B529-119B-575A-A419-3904B4E41AF2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING; safecall;
    function GetResults: IVectorView_1__HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__HSTRING read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Guid
  // Used Types:  Object
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  IKeyValuePair_2__TGuid__IInspectable = interface(IInspectable)
  ['{3BDA1540-D089-5A1A-8F0D-94EBA8068E58}']
    function get_Key: TGuid; safecall;
    function get_Value: IInspectable; safecall;
    property Key: TGuid read get_Key;
    property Value: IInspectable read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterator_1__IKeyValuePair_2__TGuid__IInspectable_Base = interface(IInspectable)
  ['{4F25059A-0B9A-5F25-9B9E-4B9F1D22FF65}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterator_1__IKeyValuePair_2__TGuid__IInspectable = interface(IIterator_1__IKeyValuePair_2__TGuid__IInspectable_Base)
  ['{4F25059A-0B9A-5F25-9B9E-4B9F1D22FF65}']
    function get_Current: IKeyValuePair_2__TGuid__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__TGuid__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__TGuid__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterable_1__IKeyValuePair_2__TGuid__IInspectable_Base = interface(IInspectable)
  ['{F3B20528-E3B3-5331-B2D0-0C2623AEE785}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterable_1__IKeyValuePair_2__TGuid__IInspectable = interface(IIterable_1__IKeyValuePair_2__TGuid__IInspectable_Base)
  ['{F3B20528-E3B3-5331-B2D0-0C2623AEE785}']
    function First: IIterator_1__IKeyValuePair_2__TGuid__IInspectable; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<Guid,Object>
  IMapView_2__TGuid__IInspectable_Base = interface(IInspectable)
  ['{E4D2C732-BBC1-5EF4-869F-5007CEB55F6E}']
  end;
  {
  // Used Types:  Object
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<Guid,Object>
  IMapView_2__TGuid__IInspectable = interface(IMapView_2__TGuid__IInspectable_Base)
  ['{E4D2C732-BBC1-5EF4-869F-5007CEB55F6E}']
    function Lookup(key: TGuid): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: TGuid): Boolean; safecall;
    procedure Split(out first: IMapView_2__TGuid__IInspectable; out second: IMapView_2__TGuid__IInspectable); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Object
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  }
  // Windows.Foundation.Collections.IMap`2<Guid,Object>
  [WinRTClassNameAttribute(SMediaPropertySet)]
  IMap_2__TGuid__IInspectable = interface(IInspectable)
  ['{5EE3189C-7DBF-5998-AD07-5414FB82567C}']
    function Lookup(key: TGuid): IInspectable; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: TGuid): Boolean; safecall;
    function GetView: IMapView_2__TGuid__IInspectable; safecall;
    function Insert(key: TGuid; value: IInspectable): Boolean; safecall;
    procedure Remove(key: TGuid); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.Chat.ChatMessageStatus
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = interface(IInspectable)
  ['{3E882181-FFAB-529C-B56F-3704D4E76A37}']
    function get_Key: HSTRING; safecall;
    function get_Value: Chat_ChatMessageStatus; safecall;
    property Key: HSTRING read get_Key;
    property Value: Chat_ChatMessageStatus read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  IIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus_Base = interface(IInspectable)
  ['{5B099E05-07E2-5346-B075-F4297B3E308B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  IIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = interface(IIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus_Base)
  ['{223DA751-0A6C-55A6-A771-0400E1D0C302}']
    function get_Current: IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__Chat_ChatMessageStatus): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  IIterable_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus_Base = interface(IInspectable)
  ['{57D87C13-48E9-546F-9B4E-A3906E1E7C24}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>>
  IIterable_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus = interface(IIterable_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus_Base)
  ['{AEA35BCF-2498-50FE-9FB2-6CEF59B30B2E}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__Chat_ChatMessageStatus; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  IMapView_2__HSTRING__Chat_ChatMessageStatus_Base = interface(IInspectable)
  ['{6A44FF0F-A172-5285-9BA5-B9FDD699A0FE}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Chat.ChatMessageStatus
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.ApplicationModel.Chat.ChatMessageStatus>
  IMapView_2__HSTRING__Chat_ChatMessageStatus = interface(IMapView_2__HSTRING__Chat_ChatMessageStatus_Base)
  ['{8A182EDF-78BB-553A-B6B7-9112F3CC65BF}']
    function Lookup(key: HSTRING): Chat_ChatMessageStatus; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__Chat_ChatMessageStatus; out second: IMapView_2__HSTRING__Chat_ChatMessageStatus); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer_Delegate_Base = interface(IUnknown)
  ['{D60CAE9D-88CB-59F1-8576-3FBA44796BE8}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Int32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer = interface(AsyncOperationCompletedHandler_1__Integer_Delegate_Base)
  ['{D60CAE9D-88CB-59F1-8576-3FBA44796BE8}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Integer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer_Base = interface(IInspectable)
  ['{968B9665-06ED-5774-8F53-8EDEABD5F7B5}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  // Used Types:  Int32
  }
  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer = interface(IAsyncOperation_1__Integer_Base)
  ['{968B9665-06ED-5774-8F53-8EDEABD5F7B5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Integer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Integer; safecall;
    function GetResults: Integer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Integer read get_Completed write put_Completed;
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
  // Used Types:  Object
  }
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
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

  {
  // Used Types:  Windows.ApplicationModel.Email.EmailMailboxSmimeEncryptionAlgorithm
  }
  // Windows.Foundation.IReference`1<Windows.ApplicationModel.Email.EmailMailboxSmimeEncryptionAlgorithm>
  IReference_1__Email_EmailMailboxSmimeEncryptionAlgorithm = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Email_EmailMailboxSmimeEncryptionAlgorithm; safecall;
    property Value: Email_EmailMailboxSmimeEncryptionAlgorithm read get_Value;
  end;

  {
  // Used Types:  Windows.ApplicationModel.Email.EmailMailboxSmimeSigningAlgorithm
  }
  // Windows.Foundation.IReference`1<Windows.ApplicationModel.Email.EmailMailboxSmimeSigningAlgorithm>
  IReference_1__Email_EmailMailboxSmimeSigningAlgorithm = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Email_EmailMailboxSmimeSigningAlgorithm; safecall;
    property Value: Email_EmailMailboxSmimeSigningAlgorithm read get_Value;
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

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IIterator_1__Email_EmailCertificateValidationStatus_Base = interface(IInspectable)
  ['{1CFE3D41-16A5-5026-A6FE-2CB0A303A605}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Email.EmailCertificateValidationStatus
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IIterator_1__Email_EmailCertificateValidationStatus = interface(IIterator_1__Email_EmailCertificateValidationStatus_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Email_EmailCertificateValidationStatus; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEmail_EmailCertificateValidationStatus): Cardinal; safecall;
    property Current: Email_EmailCertificateValidationStatus read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IIterable_1__Email_EmailCertificateValidationStatus_Base = interface(IInspectable)
  ['{7E326530-7449-51A7-B1BC-C43533A78E06}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IIterable_1__Email_EmailCertificateValidationStatus = interface(IIterable_1__Email_EmailCertificateValidationStatus_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Email_EmailCertificateValidationStatus; safecall;
  end;

  {
  // Used Types:  Windows.ApplicationModel.Email.EmailCertificateValidationStatus
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  IVectorView_1__Email_EmailCertificateValidationStatus = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Email_EmailCertificateValidationStatus; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Email_EmailCertificateValidationStatus; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEmail_EmailCertificateValidationStatus): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus_Delegate_Base = interface(IUnknown)
  ['{7DB1B498-0944-5B7F-8653-45D0D35DDFF1}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus_Delegate_Base)
  ['{5A9F94D2-879A-565B-91C7-6CD2248BA109}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  IAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus_Base = interface(IInspectable)
  ['{F3E7EF5B-8894-5488-97EF-029CA4913947}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Email.EmailCertificateValidationStatus>>
  IAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus = interface(IAsyncOperation_1__IVectorView_1__Email_EmailCertificateValidationStatus_Base)
  ['{DF78340B-B47F-50E2-9EC5-530CB35D7BE7}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus; safecall;
    function GetResults: IVectorView_1__Email_EmailCertificateValidationStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Email_EmailCertificateValidationStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus_Delegate_Base = interface(IUnknown)
  ['{50333005-DAED-567E-BB88-B1BC4663B075}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus = interface(AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  IAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus_Base = interface(IInspectable)
  ['{0033A74E-9BAA-5F50-8D6E-238635E6FDD3}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  // Used Types:  Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxEmptyFolderStatus>
  IAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus = interface(IAsyncOperation_1__Email_EmailMailboxEmptyFolderStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus; safecall;
    function GetResults: Email_EmailMailboxEmptyFolderStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Email_EmailMailboxEmptyFolderStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus_Delegate_Base = interface(IUnknown)
  ['{52604DA6-485B-5445-8E6F-64CC13056045}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus = interface(AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  IAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus_Base = interface(IInspectable)
  ['{6860F87F-0297-5ADF-AA16-9F1F08E2D950}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  // Used Types:  Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Email.EmailMailboxDeleteFolderStatus>
  IAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus = interface(IAsyncOperation_1__Email_EmailMailboxDeleteFolderStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus; safecall;
    function GetResults: Email_EmailMailboxDeleteFolderStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Email_EmailMailboxDeleteFolderStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult_Delegate_Base = interface(IUnknown)
  ['{873C5C7A-C638-5A33-9B03-215C72471663}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult = interface(AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  IAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult_Base = interface(IInspectable)
  ['{1DBB1BC9-6CD7-5947-8CD1-29632B5AA950}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  // Used Types:  Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.ExtendedExecutionResult>
  IAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult = interface(IAsyncOperation_1__ExtendedExecution_ExtendedExecutionResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult; safecall;
    function GetResults: ExtendedExecution_ExtendedExecutionResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ExtendedExecution_ExtendedExecutionResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult_Delegate_Base = interface(IUnknown)
  ['{07E1DC01-18BA-596A-B745-79F9CDE44CCC}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = interface(AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  IAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult_Base = interface(IInspectable)
  ['{B18EA00F-8C20-5AC2-9246-3EF405271F1A}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  // Used Types:  Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.ExtendedExecution.Foreground.ExtendedExecutionForegroundResult>
  IAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult = interface(IAsyncOperation_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult; safecall;
    function GetResults: ExtendedExecution_Foreground_ExtendedExecutionForegroundResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ExtendedExecution_Foreground_ExtendedExecutionForegroundResult read get_Completed write put_Completed;
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

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Int32>
  IIterator_1__Integer_Base = interface(IInspectable)
  ['{BFEA7F78-50C2-5F1D-A6EA-9E978D2699FF}']
  end;
  {
  // Used Types:  Int32
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Int32>
  IIterator_1__Integer = interface(IIterator_1__Integer_Base)
  ['{BFEA7F78-50C2-5F1D-A6EA-9E978D2699FF}']
    function get_Current: Integer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInteger): Cardinal; safecall;
    property Current: Integer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Int32>
  IIterable_1__Integer_Base = interface(IInspectable)
  ['{81A643FB-F51C-5565-83C4-F96425777B66}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Int32>
  }
  // Windows.Foundation.Collections.IIterable`1<Int32>
  IIterable_1__Integer = interface(IIterable_1__Integer_Base)
  ['{81A643FB-F51C-5565-83C4-F96425777B66}']
    function First: IIterator_1__Integer; safecall;
  end;

  {
  // Used Types:  Int32
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Int32>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Int32>
  IVector_1__Integer = interface(IInspectable)
  ['{B939AF5B-B45D-5489-9149-61442C1905FE}']
    function GetAt(index: Cardinal): Integer; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Integer; safecall;
    function IndexOf(value: Integer; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Integer); safecall;
    procedure InsertAt(index: Cardinal; value: Integer); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Integer); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInteger): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PInteger); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.ApplicationModel.UserDataTasks.UserDataTaskDaysOfWeek
  }
  // Windows.Foundation.IReference`1<Windows.ApplicationModel.UserDataTasks.UserDataTaskDaysOfWeek>
  IReference_1__UserDataTasks_UserDataTaskDaysOfWeek = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: UserDataTasks_UserDataTaskDaysOfWeek; safecall;
    property Value: UserDataTasks_UserDataTaskDaysOfWeek read get_Value;
  end;

  {
  // Used Types:  Windows.ApplicationModel.UserDataTasks.UserDataTaskWeekOfMonth
  }
  // Windows.Foundation.IReference`1<Windows.ApplicationModel.UserDataTasks.UserDataTaskWeekOfMonth>
  IReference_1__UserDataTasks_UserDataTaskWeekOfMonth = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: UserDataTasks_UserDataTaskWeekOfMonth; safecall;
    property Value: UserDataTasks_UserDataTaskWeekOfMonth read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUser
  }
  // Windows.ApplicationModel.Activation.IActivatedEventArgsWithUser
  Activation_IActivatedEventArgsWithUser = interface(IInspectable)
  ['{1CF09B9E-9962-4936-80FF-AFC8E8AE5C8C}']
    function get_User: IUser; safecall;
    property User: IUser read get_User;
  end;

  {
  // Used Types:  Windows.Storage.Search.IStorageQueryResultBase
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Storage.Search.IStorageQueryResultBase,Object>
  TypedEventHandler_2__Search_IStorageQueryResultBase__IInspectable = interface(IUnknown)
  ['{4BA22861-00C4-597F-B6BF-3AF516F3B870}']
    procedure Invoke(sender: Search_IStorageQueryResultBase; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Object
  }
  // Windows.ApplicationModel.Activation.ILockScreenActivatedEventArgs
  [WinRTClassNameAttribute(SActivation_LockScreenActivatedEventArgs)]
  Activation_ILockScreenActivatedEventArgs = interface(IInspectable)
  ['{3CA77966-6108-4A41-8220-EE7D133C8532}']
    function get_Info: IInspectable; safecall;
    property Info: IInspectable read get_Info;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Windows.ApplicationModel.IAppInfo
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IPropertySet>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFolder>
  }
  // Windows.ApplicationModel.AppExtensions.IAppExtension
  [WinRTClassNameAttribute(SAppExtensions_AppExtension)]
  AppExtensions_IAppExtension = interface(IInspectable)
  ['{8450902C-15ED-4FAF-93EA-2237BBF8CBD6}']
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_Package: IPackage; safecall;
    function get_AppInfo: IAppInfo; safecall;
    function GetExtensionPropertiesAsync: IAsyncOperation_1__IPropertySet; safecall;
    function GetPublicFolderAsync: IAsyncOperation_1__IStorageFolder; safecall;
    property AppInfo: IAppInfo read get_AppInfo;
    property Description: HSTRING read get_Description;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property Package: IPackage read get_Package;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IIterator_1__AppExtensions_IAppExtension_Base = interface(IInspectable)
  ['{8E80CA83-3CD3-5F9C-83E4-84347CA5498C}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.AppExtensions.IAppExtension
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IIterator_1__AppExtensions_IAppExtension = interface(IIterator_1__AppExtensions_IAppExtension_Base)
  ['{4A8EAC9C-606C-5772-80DA-AB77456837A5}']
    function get_Current: AppExtensions_IAppExtension; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAppExtensions_IAppExtension): Cardinal; safecall;
    property Current: AppExtensions_IAppExtension read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IIterable_1__AppExtensions_IAppExtension_Base = interface(IInspectable)
  ['{3B4FE356-1B13-59CB-AB1F-C4667A74756B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IIterable_1__AppExtensions_IAppExtension = interface(IIterable_1__AppExtensions_IAppExtension_Base)
  ['{ACFFA2EC-084E-51F1-A9CF-E17E266D3332}']
    function First: IIterator_1__AppExtensions_IAppExtension; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.AppExtensions.IAppExtension
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  IVectorView_1__AppExtensions_IAppExtension = interface(IInspectable)
  ['{5F917E50-6D70-56D4-BE5F-AFD72E2799D5}']
    function GetAt(index: Cardinal): AppExtensions_IAppExtension; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: AppExtensions_IAppExtension; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAppExtensions_IAppExtension): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension_Delegate_Base = interface(IUnknown)
  ['{CBD3EA3B-1275-5688-8610-0AB1F83442FC}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension = interface(AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension_Delegate_Base)
  ['{A5F0FF22-A276-5DB2-A4E4-DE758B4C2CD9}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  IAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension_Base = interface(IInspectable)
  ['{83295BB9-10DF-530F-A0D7-BE05BA80CB18}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>>
  IAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension = interface(IAsyncOperation_1__IVectorView_1__AppExtensions_IAppExtension_Base)
  ['{75C04410-5E1A-59A9-B030-943B4F74093C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension; safecall;
    function GetResults: IVectorView_1__AppExtensions_IAppExtension; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__AppExtensions_IAppExtension read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  }
  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs
  [WinRTClassNameAttribute(SAppExtensions_AppExtensionPackageInstalledEventArgs)]
  AppExtensions_IAppExtensionPackageInstalledEventArgs = interface(IInspectable)
  ['{39E59234-3351-4A8D-9745-E7D3DD45BC48}']
    function get_AppExtensionName: HSTRING; safecall;
    function get_Package: IPackage; safecall;
    function get_Extensions: IVectorView_1__AppExtensions_IAppExtension; safecall;
    property AppExtensionName: HSTRING read get_AppExtensionName;
    property Extensions: IVectorView_1__AppExtensions_IAppExtension read get_Extensions;
    property Package: IPackage read get_Package;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs
  [WinRTClassNameAttribute(SAppExtensions_AppExtensionPackageUpdatingEventArgs)]
  AppExtensions_IAppExtensionPackageUpdatingEventArgs = interface(IInspectable)
  ['{7ED59329-1A65-4800-A700-B321009E306A}']
    function get_AppExtensionName: HSTRING; safecall;
    function get_Package: IPackage; safecall;
    property AppExtensionName: HSTRING read get_AppExtensionName;
    property Package: IPackage read get_Package;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.AppExtensions.IAppExtension>
  }
  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs
  [WinRTClassNameAttribute(SAppExtensions_AppExtensionPackageUpdatedEventArgs)]
  AppExtensions_IAppExtensionPackageUpdatedEventArgs = interface(IInspectable)
  ['{3A83C43F-797E-44B5-BA24-A4C8B5A543D7}']
    function get_AppExtensionName: HSTRING; safecall;
    function get_Package: IPackage; safecall;
    function get_Extensions: IVectorView_1__AppExtensions_IAppExtension; safecall;
    property AppExtensionName: HSTRING read get_AppExtensionName;
    property Extensions: IVectorView_1__AppExtensions_IAppExtension read get_Extensions;
    property Package: IPackage read get_Package;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs
  [WinRTClassNameAttribute(SAppExtensions_AppExtensionPackageUninstallingEventArgs)]
  AppExtensions_IAppExtensionPackageUninstallingEventArgs = interface(IInspectable)
  ['{60F160C5-171E-40FF-AE98-AB2C20DD4D75}']
    function get_AppExtensionName: HSTRING; safecall;
    function get_Package: IPackage; safecall;
    property AppExtensionName: HSTRING read get_AppExtensionName;
    property Package: IPackage read get_Package;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.IPackage
  }
  // Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs
  [WinRTClassNameAttribute(SAppExtensions_AppExtensionPackageStatusChangedEventArgs)]
  AppExtensions_IAppExtensionPackageStatusChangedEventArgs = interface(IInspectable)
  ['{1CE17433-1153-44FD-87B1-8AE1050303DF}']
    function get_AppExtensionName: HSTRING; safecall;
    function get_Package: IPackage; safecall;
    property AppExtensionName: HSTRING read get_AppExtensionName;
    property Package: IPackage read get_Package;
  end;

  {
  // Used Types:  Windows.System.IDispatcherQueueTimer
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueueTimer,Object>
  TypedEventHandler_2__IDispatcherQueueTimer__IInspectable = interface(IUnknown)
  ['{8A13AE56-7643-5F25-A347-5C9F548273DC}']
    procedure Invoke(sender: IDispatcherQueueTimer; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.System.IDispatcherQueue
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IDispatcherQueue,Object>
  TypedEventHandler_2__IDispatcherQueue__IInspectable = interface(IUnknown)
  ['{1ECC7D76-D5F1-5514-8DA3-343E7A82F842}']
    procedure Invoke(sender: IDispatcherQueue; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  String
  }
  // Windows.ApplicationModel.LockScreen.ILockScreenBadge
  [WinRTClassNameAttribute(SLockScreen_LockScreenBadge)]
  LockScreen_ILockScreenBadge = interface(IInspectable)
  ['{E95105D9-2BFF-4DB0-9B4F-3824778B9C9A}']
    function get_Logo: IRandomAccessStream; safecall;
    function get_Glyph: IRandomAccessStream; safecall;
    function get_Number: IReference_1__Cardinal; safecall;
    function get_AutomationName: HSTRING; safecall;
    procedure LaunchApp; safecall;
    property AutomationName: HSTRING read get_AutomationName;
    property Glyph: IRandomAccessStream read get_Glyph;
    property Logo: IRandomAccessStream read get_Logo;
    property Number: IReference_1__Cardinal read get_Number;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockScreenInfo,Object>
  TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable_Delegate_Base = interface(IUnknown)
  ['{8BE9E6A3-F88A-5429-8DA3-676B7D4F1A5B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockScreenInfo
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockScreenInfo,Object>
  TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable = interface(TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable_Delegate_Base)
  ['{A7F4A3EF-0F52-51A1-B9B9-05A40776EA01}']
    procedure Invoke(sender: LockScreen_ILockScreenInfo; args: IInspectable); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IIterator_1__LockScreen_ILockScreenBadge_Base = interface(IInspectable)
  ['{8D38F924-154D-5705-8F0B-ED61353F6CE2}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockScreenBadge
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IIterator_1__LockScreen_ILockScreenBadge = interface(IIterator_1__LockScreen_ILockScreenBadge_Base)
  ['{088B8AF0-7137-5D3F-ACD7-2294E05A4237}']
    function get_Current: LockScreen_ILockScreenBadge; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PLockScreen_ILockScreenBadge): Cardinal; safecall;
    property Current: LockScreen_ILockScreenBadge read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IIterable_1__LockScreen_ILockScreenBadge_Base = interface(IInspectable)
  ['{6E82DEDC-B74E-503A-B00B-9C6F47F12A0F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IIterable_1__LockScreen_ILockScreenBadge = interface(IIterable_1__LockScreen_ILockScreenBadge_Base)
  ['{3BDF34B0-B187-5268-990D-9D6BF3AE507A}']
    function First: IIterator_1__LockScreen_ILockScreenBadge; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockScreenBadge
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  IVectorView_1__LockScreen_ILockScreenBadge = interface(IInspectable)
  ['{AEFD5B55-DB8D-5E08-93F9-8AD48C511F09}']
    function GetAt(index: Cardinal): LockScreen_ILockScreenBadge; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: LockScreen_ILockScreenBadge; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PLockScreen_ILockScreenBadge): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockScreenInfo,Object>
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.LockScreen.ILockScreenBadge>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.ApplicationModel.LockScreen.ILockScreenInfo
  [WinRTClassNameAttribute(SLockScreen_LockScreenInfo)]
  LockScreen_ILockScreenInfo = interface(IInspectable)
  ['{F59AA65C-9711-4DC9-A630-95B6CB8CDAD0}']
    function add_LockScreenImageChanged(handler: TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable): EventRegistrationToken; safecall;
    procedure remove_LockScreenImageChanged(token: EventRegistrationToken); safecall;
    function get_LockScreenImage: IRandomAccessStream; safecall;
    function add_BadgesChanged(handler: TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable): EventRegistrationToken; safecall;
    procedure remove_BadgesChanged(token: EventRegistrationToken); safecall;
    function get_Badges: IVectorView_1__LockScreen_ILockScreenBadge; safecall;
    function add_DetailTextChanged(handler: TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DetailTextChanged(token: EventRegistrationToken); safecall;
    function get_DetailText: IVectorView_1__HSTRING; safecall;
    function add_AlarmIconChanged(handler: TypedEventHandler_2__LockScreen_ILockScreenInfo__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AlarmIconChanged(token: EventRegistrationToken); safecall;
    function get_AlarmIcon: IRandomAccessStream; safecall;
    property AlarmIcon: IRandomAccessStream read get_AlarmIcon;
    property Badges: IVectorView_1__LockScreen_ILockScreenBadge read get_Badges;
    property DetailText: IVectorView_1__HSTRING read get_DetailText;
    property LockScreenImage: IRandomAccessStream read get_LockScreenImage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.ApplicationModel.LockScreen.ILockScreenUnlockingDeferral
  [WinRTClassNameAttribute(SLockScreen_LockScreenUnlockingDeferral)]
  LockScreen_ILockScreenUnlockingDeferral = interface(IInspectable)
  ['{7E7D1AD6-5203-43E7-9BD6-7C3947D1E3FE}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockScreenUnlockingDeferral
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs
  [WinRTClassNameAttribute(SLockScreen_LockScreenUnlockingEventArgs)]
  LockScreen_ILockScreenUnlockingEventArgs = interface(IInspectable)
  ['{44E6C007-75FB-4ABB-9F8B-824748900C71}']
    function GetDeferral: LockScreen_ILockScreenUnlockingDeferral; safecall;
    function get_Deadline: DateTime; safecall;
    property Deadline: DateTime read get_Deadline;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockApplicationHost,Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs>
  TypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs_Delegate_Base = interface(IUnknown)
  ['{002E5776-8A5B-5B93-8C6C-9C4C8788F5B4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockApplicationHost
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockApplicationHost,Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs>
  TypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs = interface(TypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs_Delegate_Base)
  ['{08F45A4A-0029-5309-A6E5-B4554E404F8F}']
    procedure Invoke(sender: LockScreen_ILockApplicationHost; args: LockScreen_ILockScreenUnlockingEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.ApplicationModel.LockScreen.ILockApplicationHost,Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs>
  }
  // Windows.ApplicationModel.LockScreen.ILockApplicationHost
  [WinRTClassNameAttribute(SLockScreen_LockApplicationHost)]
  LockScreen_ILockApplicationHost = interface(IInspectable)
  ['{38EE31AD-D94F-4E7C-81FA-4F4436506281}']
    procedure RequestUnlock; safecall;
    function add_Unlocking(handler: TypedEventHandler_2__LockScreen_ILockApplicationHost__LockScreen_ILockScreenUnlockingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Unlocking(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.LockScreen.ILockApplicationHost
  }
  // Windows.ApplicationModel.LockScreen.ILockApplicationHostStatics
  [WinRTClassNameAttribute(SLockScreen_LockApplicationHost)]
  LockScreen_ILockApplicationHostStatics = interface(IInspectable)
  ['{F48FAB8E-23D7-4E63-96A1-666FF52D3B2C}']
    function GetForCurrentView: LockScreen_ILockApplicationHost; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.ApplicationModel.Payments.IPaymentMerchantInfo
  Payments_IPaymentMerchantInfo = interface(IInspectable)
  ['{63445050-0E94-4ED6-AACB-E6012BD327A7}']
    function get_PackageFullName: HSTRING; safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    property PackageFullName: HSTRING read get_PackageFullName;
    property Uri: IUriRuntimeClass read get_Uri;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
  Payments_IPaymentCurrencyAmount = interface(IInspectable)
  ['{E3A3E9E0-B41F-4987-BDCB-071331F2DAA4}']
    function get_Currency: HSTRING; safecall;
    procedure put_Currency(value: HSTRING); safecall;
    function get_CurrencySystem: HSTRING; safecall;
    procedure put_CurrencySystem(value: HSTRING); safecall;
    function get_Value: HSTRING; safecall;
    procedure put_Value(value: HSTRING); safecall;
    property Currency: HSTRING read get_Currency write put_Currency;
    property CurrencySystem: HSTRING read get_CurrencySystem write put_CurrencySystem;
    property Value: HSTRING read get_Value write put_Value;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.Payments.IPaymentItem
  Payments_IPaymentItem = interface(IInspectable)
  ['{685AC88B-79B2-4B76-9E03-A876223DFE72}']
    function get_Label: HSTRING; safecall;
    procedure put_Label(value: HSTRING); safecall;
    function get_Amount: Payments_IPaymentCurrencyAmount; safecall;
    procedure put_Amount(value: Payments_IPaymentCurrencyAmount); safecall;
    function get_Pending: Boolean; safecall;
    procedure put_Pending(value: Boolean); safecall;
    property Amount: Payments_IPaymentCurrencyAmount read get_Amount write put_Amount;
    property &Label: HSTRING read get_Label write put_Label;
    property Pending: Boolean read get_Pending write put_Pending;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IIterator_1__Payments_IPaymentItem_Base = interface(IInspectable)
  ['{93C12CC3-6A0B-5F02-AC74-056007472731}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IIterator_1__Payments_IPaymentItem = interface(IIterator_1__Payments_IPaymentItem_Base)
  ['{FD90DE59-18D1-5AA8-95F4-8C36690EF85F}']
    function get_Current: Payments_IPaymentItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPayments_IPaymentItem): Cardinal; safecall;
    property Current: Payments_IPaymentItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IIterable_1__Payments_IPaymentItem_Base = interface(IInspectable)
  ['{B61B704C-E5FA-5524-8B95-7D03F5D36AE9}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IIterable_1__Payments_IPaymentItem = interface(IIterable_1__Payments_IPaymentItem_Base)
  ['{F75248ED-55D4-5CDC-80C8-F4584B015FE9}']
    function First: IIterator_1__Payments_IPaymentItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentItem>
  IVectorView_1__Payments_IPaymentItem = interface(IInspectable)
  ['{DFCB5863-B26C-56CF-9DC7-9D811C215A21}']
    function GetAt(index: Cardinal): Payments_IPaymentItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Payments_IPaymentItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPayments_IPaymentItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentCurrencyAmount
  // Used Types:  Boolean
  }
  // Windows.ApplicationModel.Payments.IPaymentShippingOption
  Payments_IPaymentShippingOption = interface(IInspectable)
  ['{13372ADA-9753-4574-8966-93145A76C7F9}']
    function get_Label: HSTRING; safecall;
    procedure put_Label(value: HSTRING); safecall;
    function get_Amount: Payments_IPaymentCurrencyAmount; safecall;
    procedure put_Amount(value: Payments_IPaymentCurrencyAmount); safecall;
    function get_Tag: HSTRING; safecall;
    procedure put_Tag(value: HSTRING); safecall;
    function get_IsSelected: Boolean; safecall;
    procedure put_IsSelected(value: Boolean); safecall;
    property Amount: Payments_IPaymentCurrencyAmount read get_Amount write put_Amount;
    property IsSelected: Boolean read get_IsSelected write put_IsSelected;
    property &Label: HSTRING read get_Label write put_Label;
    property Tag: HSTRING read get_Tag write put_Tag;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IIterator_1__Payments_IPaymentShippingOption_Base = interface(IInspectable)
  ['{49EDC9F4-2CE6-534C-B529-5CEEC705DEF5}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentShippingOption
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IIterator_1__Payments_IPaymentShippingOption = interface(IIterator_1__Payments_IPaymentShippingOption_Base)
  ['{EEF23E99-D8A7-5E62-BD76-5417EE084074}']
    function get_Current: Payments_IPaymentShippingOption; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPayments_IPaymentShippingOption): Cardinal; safecall;
    property Current: Payments_IPaymentShippingOption read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IIterable_1__Payments_IPaymentShippingOption_Base = interface(IInspectable)
  ['{DE881C69-6642-54DE-A8F7-D1A88B2404CF}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IIterable_1__Payments_IPaymentShippingOption = interface(IIterable_1__Payments_IPaymentShippingOption_Base)
  ['{EA4D6388-6D88-5FE0-B6EA-AFDDFC41E88B}']
    function First: IIterator_1__Payments_IPaymentShippingOption; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentShippingOption
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  IVectorView_1__Payments_IPaymentShippingOption = interface(IInspectable)
  ['{01ABA80A-C376-56F9-8191-79E5081F918B}']
    function GetAt(index: Cardinal): Payments_IPaymentShippingOption; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Payments_IPaymentShippingOption; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPayments_IPaymentShippingOption): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentItem
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentItem>
  }
  // Windows.ApplicationModel.Payments.IPaymentDetailsModifier
  Payments_IPaymentDetailsModifier = interface(IInspectable)
  ['{BE1C7D65-4323-41D7-B305-DFCB765F69DE}']
    function get_JsonData: HSTRING; safecall;
    function get_SupportedMethodIds: IVectorView_1__HSTRING; safecall;
    function get_Total: Payments_IPaymentItem; safecall;
    function get_AdditionalDisplayItems: IVectorView_1__Payments_IPaymentItem; safecall;
    property AdditionalDisplayItems: IVectorView_1__Payments_IPaymentItem read get_AdditionalDisplayItems;
    property JsonData: HSTRING read get_JsonData;
    property SupportedMethodIds: IVectorView_1__HSTRING read get_SupportedMethodIds;
    property Total: Payments_IPaymentItem read get_Total;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IIterator_1__Payments_IPaymentDetailsModifier_Base = interface(IInspectable)
  ['{FAFB6774-B665-5B8B-B1EF-95038C3AABE1}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentDetailsModifier
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IIterator_1__Payments_IPaymentDetailsModifier = interface(IIterator_1__Payments_IPaymentDetailsModifier_Base)
  ['{0D68A9E4-8321-5A50-8BFE-C3C690B75688}']
    function get_Current: Payments_IPaymentDetailsModifier; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPayments_IPaymentDetailsModifier): Cardinal; safecall;
    property Current: Payments_IPaymentDetailsModifier read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IIterable_1__Payments_IPaymentDetailsModifier_Base = interface(IInspectable)
  ['{585D2B3D-CB34-58C4-81F4-1EA157996DEF}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IIterable_1__Payments_IPaymentDetailsModifier = interface(IIterable_1__Payments_IPaymentDetailsModifier_Base)
  ['{ECFEA4BD-ADED-5A8B-A607-5D9015631128}']
    function First: IIterator_1__Payments_IPaymentDetailsModifier; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentDetailsModifier
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  IVectorView_1__Payments_IPaymentDetailsModifier = interface(IInspectable)
  ['{205CEF2F-53D2-5A33-A7FF-5D8C8DA2AFC8}']
    function GetAt(index: Cardinal): Payments_IPaymentDetailsModifier; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Payments_IPaymentDetailsModifier; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPayments_IPaymentDetailsModifier): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentItem
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentItem>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentShippingOption>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentDetailsModifier>
  }
  // Windows.ApplicationModel.Payments.IPaymentDetails
  Payments_IPaymentDetails = interface(IInspectable)
  ['{53BB2D7D-E0EB-4053-8EAE-CE7C48E02945}']
    function get_Total: Payments_IPaymentItem; safecall;
    procedure put_Total(value: Payments_IPaymentItem); safecall;
    function get_DisplayItems: IVectorView_1__Payments_IPaymentItem; safecall;
    procedure put_DisplayItems(value: IVectorView_1__Payments_IPaymentItem); safecall;
    function get_ShippingOptions: IVectorView_1__Payments_IPaymentShippingOption; safecall;
    procedure put_ShippingOptions(value: IVectorView_1__Payments_IPaymentShippingOption); safecall;
    function get_Modifiers: IVectorView_1__Payments_IPaymentDetailsModifier; safecall;
    procedure put_Modifiers(value: IVectorView_1__Payments_IPaymentDetailsModifier); safecall;
    property DisplayItems: IVectorView_1__Payments_IPaymentItem read get_DisplayItems write put_DisplayItems;
    property Modifiers: IVectorView_1__Payments_IPaymentDetailsModifier read get_Modifiers write put_Modifiers;
    property ShippingOptions: IVectorView_1__Payments_IPaymentShippingOption read get_ShippingOptions write put_ShippingOptions;
    property Total: Payments_IPaymentItem read get_Total write put_Total;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  String
  }
  // Windows.ApplicationModel.Payments.IPaymentMethodData
  Payments_IPaymentMethodData = interface(IInspectable)
  ['{D1D3CAF4-DE98-4129-B1B7-C3AD86237BF4}']
    function get_SupportedMethodIds: IVectorView_1__HSTRING; safecall;
    function get_JsonData: HSTRING; safecall;
    property JsonData: HSTRING read get_JsonData;
    property SupportedMethodIds: IVectorView_1__HSTRING read get_SupportedMethodIds;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IIterator_1__Payments_IPaymentMethodData_Base = interface(IInspectable)
  ['{9666522E-E5AC-5374-A5D9-5CF57C4BF689}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentMethodData
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IIterator_1__Payments_IPaymentMethodData = interface(IIterator_1__Payments_IPaymentMethodData_Base)
  ['{E9B48910-E831-5A98-A88F-BBF38F80C834}']
    function get_Current: Payments_IPaymentMethodData; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPayments_IPaymentMethodData): Cardinal; safecall;
    property Current: Payments_IPaymentMethodData read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IIterable_1__Payments_IPaymentMethodData_Base = interface(IInspectable)
  ['{8C9ED87E-4ADD-58A8-AD9A-9DFA48CA250A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IIterable_1__Payments_IPaymentMethodData = interface(IIterable_1__Payments_IPaymentMethodData_Base)
  ['{9A12292A-4C45-5D4A-A598-A8462A6E7BB8}']
    function First: IIterator_1__Payments_IPaymentMethodData; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentMethodData
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  IVectorView_1__Payments_IPaymentMethodData = interface(IInspectable)
  ['{D4EB6D93-3C91-50AB-9E50-46FC93402229}']
    function GetAt(index: Cardinal): Payments_IPaymentMethodData; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Payments_IPaymentMethodData; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPayments_IPaymentMethodData): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.PaymentOptionPresence
  // Used Types:  Boolean
  // Used Types:  Windows.ApplicationModel.Payments.PaymentShippingType
  }
  // Windows.ApplicationModel.Payments.IPaymentOptions
  Payments_IPaymentOptions = interface(IInspectable)
  ['{AAA30854-1F2B-4365-8251-01B58915A5BC}']
    function get_RequestPayerEmail: Payments_PaymentOptionPresence; safecall;
    procedure put_RequestPayerEmail(value: Payments_PaymentOptionPresence); safecall;
    function get_RequestPayerName: Payments_PaymentOptionPresence; safecall;
    procedure put_RequestPayerName(value: Payments_PaymentOptionPresence); safecall;
    function get_RequestPayerPhoneNumber: Payments_PaymentOptionPresence; safecall;
    procedure put_RequestPayerPhoneNumber(value: Payments_PaymentOptionPresence); safecall;
    function get_RequestShipping: Boolean; safecall;
    procedure put_RequestShipping(value: Boolean); safecall;
    function get_ShippingType: Payments_PaymentShippingType; safecall;
    procedure put_ShippingType(value: Payments_PaymentShippingType); safecall;
    property RequestPayerEmail: Payments_PaymentOptionPresence read get_RequestPayerEmail write put_RequestPayerEmail;
    property RequestPayerName: Payments_PaymentOptionPresence read get_RequestPayerName write put_RequestPayerName;
    property RequestPayerPhoneNumber: Payments_PaymentOptionPresence read get_RequestPayerPhoneNumber write put_RequestPayerPhoneNumber;
    property RequestShipping: Boolean read get_RequestShipping write put_RequestShipping;
    property ShippingType: Payments_PaymentShippingType read get_ShippingType write put_ShippingType;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentMerchantInfo
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentDetails
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Payments.IPaymentMethodData>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentOptions
  }
  // Windows.ApplicationModel.Payments.IPaymentRequest
  Payments_IPaymentRequest = interface(IInspectable)
  ['{B74942E1-ED7B-47EB-BC08-78CC5D6896B6}']
    function get_MerchantInfo: Payments_IPaymentMerchantInfo; safecall;
    function get_Details: Payments_IPaymentDetails; safecall;
    function get_MethodData: IVectorView_1__Payments_IPaymentMethodData; safecall;
    function get_Options: Payments_IPaymentOptions; safecall;
    property Details: Payments_IPaymentDetails read get_Details;
    property MerchantInfo: Payments_IPaymentMerchantInfo read get_MerchantInfo;
    property MethodData: IVectorView_1__Payments_IPaymentMethodData read get_MethodData;
    property Options: Payments_IPaymentOptions read get_Options;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentDetails
  }
  // Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
  Payments_IPaymentRequestChangedResult = interface(IInspectable)
  ['{DF699E5C-16C4-47AD-9401-8440EC0757DB}']
    function get_ChangeAcceptedByMerchant: Boolean; safecall;
    procedure put_ChangeAcceptedByMerchant(value: Boolean); safecall;
    function get_Message: HSTRING; safecall;
    procedure put_Message(value: HSTRING); safecall;
    function get_UpdatedPaymentDetails: Payments_IPaymentDetails; safecall;
    procedure put_UpdatedPaymentDetails(value: Payments_IPaymentDetails); safecall;
    property ChangeAcceptedByMerchant: Boolean read get_ChangeAcceptedByMerchant write put_ChangeAcceptedByMerchant;
    property Message: HSTRING read get_Message write put_Message;
    property UpdatedPaymentDetails: Payments_IPaymentDetails read get_UpdatedPaymentDetails write put_UpdatedPaymentDetails;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult_Delegate_Base = interface(IUnknown)
  ['{BEC8B726-9056-5E47-B22A-0DA09AA84AFE}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult = interface(AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult_Delegate_Base)
  ['{80510216-7791-5D33-B04B-94D78F32CABC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Payments_IPaymentRequestChangedResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  IAsyncOperation_1__Payments_IPaymentRequestChangedResult_Base = interface(IInspectable)
  ['{0CC32025-AC67-57E2-A0F6-3A8E116CEF4C}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestChangedResult>
  IAsyncOperation_1__Payments_IPaymentRequestChangedResult = interface(IAsyncOperation_1__Payments_IPaymentRequestChangedResult_Base)
  ['{F2EAE227-35BE-5AFA-BC94-912567CFB700}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult; safecall;
    function GetResults: Payments_IPaymentRequestChangedResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Payments_IPaymentRequestChangedResult read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.ApplicationModel.Payments.IPaymentAddress
  Payments_IPaymentAddress = interface(IInspectable)
  ['{5F2264E9-6F3A-4166-A018-0A0B06BB32B5}']
    function get_Country: HSTRING; safecall;
    procedure put_Country(value: HSTRING); safecall;
    function get_AddressLines: IVectorView_1__HSTRING; safecall;
    procedure put_AddressLines(value: IVectorView_1__HSTRING); safecall;
    function get_Region: HSTRING; safecall;
    procedure put_Region(value: HSTRING); safecall;
    function get_City: HSTRING; safecall;
    procedure put_City(value: HSTRING); safecall;
    function get_DependentLocality: HSTRING; safecall;
    procedure put_DependentLocality(value: HSTRING); safecall;
    function get_PostalCode: HSTRING; safecall;
    procedure put_PostalCode(value: HSTRING); safecall;
    function get_SortingCode: HSTRING; safecall;
    procedure put_SortingCode(value: HSTRING); safecall;
    function get_LanguageCode: HSTRING; safecall;
    procedure put_LanguageCode(value: HSTRING); safecall;
    function get_Organization: HSTRING; safecall;
    procedure put_Organization(value: HSTRING); safecall;
    function get_Recipient: HSTRING; safecall;
    procedure put_Recipient(value: HSTRING); safecall;
    function get_PhoneNumber: HSTRING; safecall;
    procedure put_PhoneNumber(value: HSTRING); safecall;
    function get_Properties: IPropertySet; safecall;
    property AddressLines: IVectorView_1__HSTRING read get_AddressLines write put_AddressLines;
    property City: HSTRING read get_City write put_City;
    property Country: HSTRING read get_Country write put_Country;
    property DependentLocality: HSTRING read get_DependentLocality write put_DependentLocality;
    property LanguageCode: HSTRING read get_LanguageCode write put_LanguageCode;
    property Organization: HSTRING read get_Organization write put_Organization;
    property PhoneNumber: HSTRING read get_PhoneNumber write put_PhoneNumber;
    property PostalCode: HSTRING read get_PostalCode write put_PostalCode;
    property Properties: IPropertySet read get_Properties;
    property Recipient: HSTRING read get_Recipient write put_Recipient;
    property Region: HSTRING read get_Region write put_Region;
    property SortingCode: HSTRING read get_SortingCode write put_SortingCode;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.Payments.IPaymentToken
  Payments_IPaymentToken = interface(IInspectable)
  ['{BBCAC013-CCD0-41F2-B2A1-0A2E4B5DCE25}']
    function get_PaymentMethodId: HSTRING; safecall;
    function get_JsonDetails: HSTRING; safecall;
    property JsonDetails: HSTRING read get_JsonDetails;
    property PaymentMethodId: HSTRING read get_PaymentMethodId;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.PaymentCanMakePaymentResultStatus
  }
  // Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult
  Payments_IPaymentCanMakePaymentResult = interface(IInspectable)
  ['{7696FE55-D5D3-4D3D-B345-45591759C510}']
    function get_Status: Payments_PaymentCanMakePaymentResultStatus; safecall;
    property Status: Payments_PaymentCanMakePaymentResultStatus read get_Status;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentToken
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentShippingOption
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentAddress
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.ApplicationModel.Payments.PaymentRequestCompletionStatus
  }
  // Windows.ApplicationModel.Payments.IPaymentResponse
  Payments_IPaymentResponse = interface(IInspectable)
  ['{E1389457-8BD2-4888-9FA8-97985545108E}']
    function get_PaymentToken: Payments_IPaymentToken; safecall;
    function get_ShippingOption: Payments_IPaymentShippingOption; safecall;
    function get_ShippingAddress: Payments_IPaymentAddress; safecall;
    function get_PayerEmail: HSTRING; safecall;
    function get_PayerName: HSTRING; safecall;
    function get_PayerPhoneNumber: HSTRING; safecall;
    function CompleteAsync(status: Payments_PaymentRequestCompletionStatus): IAsyncAction; safecall;
    property PayerEmail: HSTRING read get_PayerEmail;
    property PayerName: HSTRING read get_PayerName;
    property PayerPhoneNumber: HSTRING read get_PayerPhoneNumber;
    property PaymentToken: Payments_IPaymentToken read get_PaymentToken;
    property ShippingAddress: Payments_IPaymentAddress read get_ShippingAddress;
    property ShippingOption: Payments_IPaymentShippingOption read get_ShippingOption;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.PaymentRequestChangeKind
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentAddress
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentShippingOption
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequestChangedResult
  }
  // Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs
  Payments_IPaymentRequestChangedArgs = interface(IInspectable)
  ['{C6145E44-CD8B-4BE4-B555-27C99194C0C5}']
    function get_ChangeKind: Payments_PaymentRequestChangeKind; safecall;
    function get_ShippingAddress: Payments_IPaymentAddress; safecall;
    function get_SelectedShippingOption: Payments_IPaymentShippingOption; safecall;
    procedure Acknowledge(changeResult: Payments_IPaymentRequestChangedResult); safecall;
    property ChangeKind: Payments_PaymentRequestChangeKind read get_ChangeKind;
    property SelectedShippingOption: Payments_IPaymentShippingOption read get_SelectedShippingOption;
    property ShippingAddress: Payments_IPaymentAddress read get_ShippingAddress;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequest
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequestChangedArgs
  }
  // Windows.ApplicationModel.Payments.PaymentRequestChangedHandler
  Payments_PaymentRequestChangedHandler = interface(IUnknown)
  ['{5078B9E1-F398-4F2C-A27E-94D371CF6C7D}']
    procedure Invoke(paymentRequest: Payments_IPaymentRequest; args: Payments_IPaymentRequestChangedArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.Payments.PaymentRequestStatus
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentResponse
  }
  // Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult
  Payments_IPaymentRequestSubmitResult = interface(IInspectable)
  ['{7B9C3912-30F2-4E90-B249-8CE7D78FFE56}']
    function get_Status: Payments_PaymentRequestStatus; safecall;
    function get_Response: Payments_IPaymentResponse; safecall;
    property Response: Payments_IPaymentResponse read get_Response;
    property Status: Payments_PaymentRequestStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult_Delegate_Base = interface(IUnknown)
  ['{CBCD07A6-AE2A-5A70-BC0B-9120560825D1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult = interface(AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult_Delegate_Base)
  ['{9B9E95FF-2F0D-5120-A5F5-25368049D3D3}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Payments_IPaymentRequestSubmitResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  IAsyncOperation_1__Payments_IPaymentRequestSubmitResult_Base = interface(IInspectable)
  ['{CF290DEB-5549-57C3-8ABD-53B76C643CCA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  IAsyncOperation_1__Payments_IPaymentRequestSubmitResult = interface(IAsyncOperation_1__Payments_IPaymentRequestSubmitResult_Base)
  ['{CA6E042F-DB8E-53BA-8178-F710B91FB420}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult; safecall;
    function GetResults: Payments_IPaymentRequestSubmitResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Payments_IPaymentRequestSubmitResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentRequestSubmitResult>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequest
  // Used Types:  Windows.ApplicationModel.Payments.PaymentRequestChangedHandler
  }
  // Windows.ApplicationModel.Payments.IPaymentMediator
  [WinRTClassNameAttribute(SPayments_PaymentMediator)]
  Payments_IPaymentMediator = interface(IInspectable)
  ['{FB0EE829-EC0C-449A-83DA-7AE3073365A2}']
    function GetSupportedMethodIdsAsync: IAsyncOperation_1__IVectorView_1__HSTRING; safecall;
    function SubmitPaymentRequestAsync(paymentRequest: Payments_IPaymentRequest): IAsyncOperation_1__Payments_IPaymentRequestSubmitResult; overload; safecall;
    function SubmitPaymentRequestAsync(paymentRequest: Payments_IPaymentRequest; changeHandler: Payments_PaymentRequestChangedHandler): IAsyncOperation_1__Payments_IPaymentRequestSubmitResult; overload; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult_Delegate_Base = interface(IUnknown)
  ['{89AE5B89-6D05-5842-9CDF-F4CBF706DC5E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult = interface(AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult_Delegate_Base)
  ['{4F0B1A8D-A80A-5EC5-B418-1C561AB31D2B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult_Base = interface(IInspectable)
  ['{A467410A-11DE-5090-B905-96A562D85DE5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult = interface(IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult_Base)
  ['{40D26067-7810-5D27-860B-8E8D5E6A06A5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult; safecall;
    function GetResults: Payments_IPaymentCanMakePaymentResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Payments_IPaymentCanMakePaymentResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Payments.IPaymentCanMakePaymentResult>
  // Used Types:  Windows.ApplicationModel.Payments.IPaymentRequest
  }
  // Windows.ApplicationModel.Payments.IPaymentMediator2
  Payments_IPaymentMediator2 = interface(IInspectable)
  ['{CEEF98F1-E407-4128-8E73-D93D5F822786}']
    function CanMakePaymentAsync(paymentRequest: Payments_IPaymentRequest): IAsyncOperation_1__Payments_IPaymentCanMakePaymentResult; safecall;
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

  // Generic Delegate for 
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,String>
  MapChangedEventHandler_2__HSTRING__HSTRING_Delegate_Base = interface(IUnknown)
  ['{E2663F37-2E1B-500C-AD68-C3ED7A8F74C8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IObservableMap`2<String,String>
  // Used Types:  Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  }
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,String>
  MapChangedEventHandler_2__HSTRING__HSTRING = interface(MapChangedEventHandler_2__HSTRING__HSTRING_Delegate_Base)
  ['{E2663F37-2E1B-500C-AD68-C3ED7A8F74C8}']
    procedure Invoke(sender: IObservableMap_2__HSTRING__HSTRING; event: IMapChangedEventArgs_1__HSTRING); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.MapChangedEventHandler`2<String,String>
  }
  // Windows.Foundation.Collections.IObservableMap`2<String,String>
  IObservableMap_2__HSTRING__HSTRING = interface(IInspectable)
  ['{1E036276-2F60-55F6-B7F3-F86079E6900B}']
    function add_MapChanged(vhnd: MapChangedEventHandler_2__HSTRING__HSTRING): EventRegistrationToken; safecall;
    procedure remove_MapChanged(token: EventRegistrationToken); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IPackage
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.IPackage>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.ApplicationModel.IPackage>
  IVector_1__IPackage = interface(IInspectable)
  ['{7704985F-8D81-5C7F-9B57-870C324DA741}']
    function GetAt(index: Cardinal): IPackage; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IPackage; safecall;
    function IndexOf(value: IPackage; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IPackage); safecall;
    procedure InsertAt(index: Cardinal; value: IPackage); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IPackage); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPackage): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIPackage); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IIterator_1__Store_Preview_StoreSystemFeature_Base = interface(IInspectable)
  ['{D0455B2D-D8AA-557E-89A3-63C33E8CEE99}']
  end;
  {
  // Used Types:  Windows.ApplicationModel.Store.Preview.StoreSystemFeature
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IIterator_1__Store_Preview_StoreSystemFeature = interface(IIterator_1__Store_Preview_StoreSystemFeature_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Store_Preview_StoreSystemFeature; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PStore_Preview_StoreSystemFeature): Cardinal; safecall;
    property Current: Store_Preview_StoreSystemFeature read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IIterable_1__Store_Preview_StoreSystemFeature_Base = interface(IInspectable)
  ['{98A8577A-B128-5400-8D3D-58654EAAF957}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IIterable_1__Store_Preview_StoreSystemFeature = interface(IIterable_1__Store_Preview_StoreSystemFeature_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Store_Preview_StoreSystemFeature; safecall;
  end;

  {
  // Used Types:  Windows.ApplicationModel.Store.Preview.StoreSystemFeature
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  IVectorView_1__Store_Preview_StoreSystemFeature = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Store_Preview_StoreSystemFeature; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Store_Preview_StoreSystemFeature; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PStore_Preview_StoreSystemFeature): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature_Delegate_Base = interface(IUnknown)
  ['{7E7946EF-F8F0-53FD-9613-7261CB35DAF4}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature_Delegate_Base)
  ['{5A9F94D2-879A-565B-91C7-6CD2248BA109}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  IAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature_Base = interface(IInspectable)
  ['{B1713163-EE1B-5290-8316-F7EBB9D53163}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.ApplicationModel.Store.Preview.StoreSystemFeature>>
  IAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature = interface(IAsyncOperation_1__IVectorView_1__Store_Preview_StoreSystemFeature_Base)
  ['{DF78340B-B47F-50E2-9EC5-530CB35D7BE7}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature; safecall;
    function GetResults: IVectorView_1__Store_Preview_StoreSystemFeature; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Store_Preview_StoreSystemFeature read get_Completed write put_Completed;
  end;

  {
  }
  // Windows.ApplicationModel.Store.LicenseChangedEventHandler
  Store_LicenseChangedEventHandler = interface(IUnknown)
  ['{D4A50255-1369-4C36-832F-6F2D88E3659B}']
    procedure Invoke; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Store.FulfillmentResult>
  AsyncOperationCompletedHandler_1__Store_FulfillmentResult_Delegate_Base = interface(IUnknown)
  ['{8775ACC9-B9AE-5CCE-895C-971BF9270892}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Store.FulfillmentResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Store.FulfillmentResult>
  AsyncOperationCompletedHandler_1__Store_FulfillmentResult = interface(AsyncOperationCompletedHandler_1__Store_FulfillmentResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Store_FulfillmentResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Store.FulfillmentResult>
  IAsyncOperation_1__Store_FulfillmentResult_Base = interface(IInspectable)
  ['{5C8531AC-5D8D-5E07-B6EE-7CAB96930E8A}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.ApplicationModel.Store.FulfillmentResult>
  // Used Types:  Windows.ApplicationModel.Store.FulfillmentResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.ApplicationModel.Store.FulfillmentResult>
  IAsyncOperation_1__Store_FulfillmentResult = interface(IAsyncOperation_1__Store_FulfillmentResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Store_FulfillmentResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Store_FulfillmentResult; safecall;
    function GetResults: Store_FulfillmentResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Store_FulfillmentResult read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.ApplicationModel.Store.ProductType
  }
  // Windows.ApplicationModel.Store.IProductListingWithConsumables
  Store_IProductListingWithConsumables = interface(IInspectable)
  ['{EB9E9790-8F6B-481F-93A7-5C3A63068149}']
    function get_ProductType: Store_ProductType; safecall;
    property ProductType: Store_ProductType read get_ProductType;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface(IInspectable)
  ['{BCDE03AD-EA71-5077-A961-1C0ECFF57202}']
    function get_Key: HSTRING; safecall;
    function get_Value: IVectorView_1__HSTRING; safecall;
    property Key: HSTRING read get_Key;
    property Value: IVectorView_1__HSTRING read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING_Base = interface(IInspectable)
  ['{643B6D83-457E-5A43-800F-B0449F91D96B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface(IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING_Base)
  ['{643B6D83-457E-5A43-800F-B0449F91D96B}']
    function get_Current: IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IVectorView_1__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING_Base = interface(IInspectable)
  ['{A4CD6151-2CC1-56F1-9014-DF6BA3410BEB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface(IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING_Base)
  ['{A4CD6151-2CC1-56F1-9014-DF6BA3410BEB}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  IMapView_2__HSTRING__IVectorView_1__HSTRING_Base = interface(IInspectable)
  ['{2843D34F-D3E5-5FCA-9FDC-B568DD5C1E64}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  IMapView_2__HSTRING__IVectorView_1__HSTRING = interface(IMapView_2__HSTRING__IVectorView_1__HSTRING_Base)
  ['{2843D34F-D3E5-5FCA-9FDC-B568DD5C1E64}']
    function Lookup(key: HSTRING): IVectorView_1__HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IVectorView_1__HSTRING; out second: IMapView_2__HSTRING__IVectorView_1__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Int16
  }
  // Windows.Foundation.IReference`1<Int16>
  IReference_1__SmallInt = interface(IInspectable)
  ['{6EC9E41B-6709-5647-9918-A1270110FC4E}']
    function get_Value: SmallInt; safecall;
    property Value: SmallInt read get_Value;
  end;

  {
  // Used Types:  Guid
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Guid>
  IIterator_1__TGuid = interface(IInspectable)
  ['{D3D64048-82B3-53C7-9285-B0BE18368482}']
    function get_Current: TGuid; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGuid): Cardinal; safecall;
    property Current: TGuid read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Guid>
  }
  // Windows.Foundation.Collections.IIterable`1<Guid>
  IIterable_1__TGuid = interface(IInspectable)
  ['{F4CA3045-5DD7-54BE-982E-D88D8CA0876E}']
    function First: IIterator_1__TGuid; safecall;
  end;

  {
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Guid>
  IVectorView_1__TGuid = interface(IInspectable)
  ['{9520E64B-15B2-52A6-98ED-3191FA6CF68A}']
    function GetAt(index: Cardinal): TGuid; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: TGuid; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGuid): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Guid>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Guid>
  IVector_1__TGuid = interface(IInspectable)
  ['{482E676D-B913-5EC1-AFA8-5F96922E94AE}']
    function GetAt(index: Cardinal): TGuid; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__TGuid; safecall;
    function IndexOf(value: TGuid; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: TGuid); safecall;
    procedure InsertAt(index: Cardinal; value: TGuid); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: TGuid); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGuid): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PGuid); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  String
  }
  // Windows.ApplicationModel.Activation.IContactsProviderActivatedEventArgs
  Activation_IContactsProviderActivatedEventArgs = interface(IInspectable)
  ['{4580DCA8-5750-4916-AA52-C0829521EB94}']
    function get_Verb: HSTRING; safecall;
    property Verb: HSTRING read get_Verb;
  end;


  // Emit Forwarded classes
  // Windows.ApplicationModel.AppDisplayInfo
  // DualAPI
  // Implements: Windows.ApplicationModel.IAppDisplayInfo

  // Windows.ApplicationModel.AppInfo
  // DualAPI
  // Implements: Windows.ApplicationModel.IAppInfo

  // Windows.ApplicationModel.PackageStatus
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageStatus
  // Implements: Windows.ApplicationModel.IPackageStatus2

  // Windows.ApplicationModel.PackageId
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageId
  // Implements: Windows.ApplicationModel.IPackageIdWithMetadata

  // Windows.ApplicationModel.Package
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackage
  // Implements: Windows.ApplicationModel.IPackage2
  // Implements: Windows.ApplicationModel.IPackage3
  // Implements: Windows.ApplicationModel.IPackageWithMetadata
  // Implements: Windows.ApplicationModel.IPackage4
  // Implements: Windows.ApplicationModel.IPackage5
  // Statics: "Windows.ApplicationModel.IPackageStatics"
  TPackageRT = class(TWinRTGenericImportS<IPackageStatics>)
  public
    // -> IPackageStatics
    class function get_Current: IPackage; static; inline;
    class property Current: IPackage read get_Current;
  end;

  // Windows.ApplicationModel.PackageStagingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageStagingEventArgs

  // Windows.ApplicationModel.PackageInstallingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageInstallingEventArgs

  // Windows.ApplicationModel.PackageUpdatingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageUpdatingEventArgs

  // Windows.ApplicationModel.PackageUninstallingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageUninstallingEventArgs

  // Windows.ApplicationModel.PackageStatusChangedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageStatusChangedEventArgs

  // Windows.ApplicationModel.PackageContentGroupStagingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.IPackageContentGroupStagingEventArgs

  // Windows.ApplicationModel.AppService.AppServiceRequest
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceRequest

  // Windows.ApplicationModel.AppService.AppServiceDeferral
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceDeferral

  // Windows.ApplicationModel.AppService.AppServiceResponse
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceResponse

  // Windows.ApplicationModel.AppService.AppServiceConnection
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceConnection
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.ApplicationModel.AppService.IAppServiceConnection2
  // Instantiable: "AppService_IAppServiceConnection"
  TAppService_AppServiceConnection = class(TWinRTGenericImportI<AppService_IAppServiceConnection>) end;

  // Windows.ApplicationModel.AppService.AppServiceRequestReceivedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceRequestReceivedEventArgs

  // Windows.ApplicationModel.AppService.AppServiceClosedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceClosedEventArgs

  // Windows.ApplicationModel.AppService.AppServiceTriggerDetails
  // DualAPI
  // Implements: Windows.ApplicationModel.AppService.IAppServiceTriggerDetails
  // Implements: Windows.ApplicationModel.AppService.IAppServiceTriggerDetails2
  // Implements: Windows.ApplicationModel.AppService.IAppServiceTriggerDetails3

  // Windows.ApplicationModel.Activation.LockScreenActivatedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.Activation.ILockScreenActivatedEventArgs
  // Implements: Windows.ApplicationModel.Activation.IActivatedEventArgs
  // Implements: Windows.ApplicationModel.Activation.IActivatedEventArgsWithUser

  // Windows.ApplicationModel.AppExtensions.AppExtension
  // DualAPI
  // Implements: Windows.ApplicationModel.AppExtensions.IAppExtension

  // Windows.ApplicationModel.AppExtensions.AppExtensionPackageInstalledEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppExtensions.IAppExtensionPackageInstalledEventArgs

  // Windows.ApplicationModel.AppExtensions.AppExtensionPackageUpdatingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatingEventArgs

  // Windows.ApplicationModel.AppExtensions.AppExtensionPackageUpdatedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUpdatedEventArgs

  // Windows.ApplicationModel.AppExtensions.AppExtensionPackageUninstallingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppExtensions.IAppExtensionPackageUninstallingEventArgs

  // Windows.ApplicationModel.AppExtensions.AppExtensionPackageStatusChangedEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.AppExtensions.IAppExtensionPackageStatusChangedEventArgs

  // Windows.ApplicationModel.LockScreen.LockScreenInfo
  // DualAPI
  // Implements: Windows.ApplicationModel.LockScreen.ILockScreenInfo

  // Windows.ApplicationModel.LockScreen.LockScreenBadge
  // DualAPI
  // Implements: Windows.ApplicationModel.LockScreen.ILockScreenBadge

  // Windows.ApplicationModel.LockScreen.LockScreenUnlockingDeferral
  // DualAPI
  // Implements: Windows.ApplicationModel.LockScreen.ILockScreenUnlockingDeferral

  // Windows.ApplicationModel.LockScreen.LockApplicationHost
  // DualAPI
  // Implements: Windows.ApplicationModel.LockScreen.ILockApplicationHost
  // Statics: "Windows.ApplicationModel.LockScreen.ILockApplicationHostStatics"
  TLockScreen_LockApplicationHost = class(TWinRTGenericImportS<LockScreen_ILockApplicationHostStatics>)
  public
    // -> LockScreen_ILockApplicationHostStatics
    class function GetForCurrentView: LockScreen_ILockApplicationHost; static; inline;
  end;

  // Windows.ApplicationModel.LockScreen.LockScreenUnlockingEventArgs
  // DualAPI
  // Implements: Windows.ApplicationModel.LockScreen.ILockScreenUnlockingEventArgs

  // Windows.ApplicationModel.Payments.PaymentMediator
  // DualAPI
  // Implements: Windows.ApplicationModel.Payments.IPaymentMediator
  // Implements: Windows.ApplicationModel.Payments.IPaymentMediator2
  // Instantiable: "Payments_IPaymentMediator"
  TPayments_PaymentMediator = class(TWinRTGenericImportI<Payments_IPaymentMediator>) end;


implementation

  // Emit Classes Implementation
 { TPackageRT }

class function TPackageRT.get_Current: IPackage;
begin
  Result := Statics.get_Current;
end;


 { TAppService_AppServiceConnection }

 { TLockScreen_LockApplicationHost }

class function TLockScreen_LockApplicationHost.GetForCurrentView: LockScreen_ILockApplicationHost;
begin
  Result := Statics.GetForCurrentView;
end;


 { TPayments_PaymentMediator }


end.
