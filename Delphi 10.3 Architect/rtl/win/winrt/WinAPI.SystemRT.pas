{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.SystemRT;

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
  Winapi.ApplicationModel, 
  Winapi.WebRT, 
  Winapi.DataRT, 
  Winapi.Storage, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.System.IProtocolForResultsOperation
  IProtocolForResultsOperation = interface;
  PIProtocolForResultsOperation = ^IProtocolForResultsOperation;

  // Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs
  RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionDisconnectedEventArgs = ^RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSession,Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  RemoteSystems_IRemoteSystemSessionParticipant = interface;
  PRemoteSystems_IRemoteSystemSessionParticipant = ^RemoteSystems_IRemoteSystemSessionParticipant;

  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs
  RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs = ^RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs
  RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs = ^RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
  RemoteSystems_IRemoteSystemSessionParticipantWatcher = interface;
  PRemoteSystems_IRemoteSystemSessionParticipantWatcher = ^RemoteSystems_IRemoteSystemSessionParticipantWatcher;

  // Windows.System.RemoteSystems.IRemoteSystemSession
  RemoteSystems_IRemoteSystemSession = interface;
  PRemoteSystems_IRemoteSystemSession = ^RemoteSystems_IRemoteSystemSession;

  // Windows.System.IDateTimeSettingsStatics
  IDateTimeSettingsStatics = interface;
  PIDateTimeSettingsStatics = ^IDateTimeSettingsStatics;

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

  // Windows.System.IProcessLauncherOptions
  IProcessLauncherOptions = interface;
  PIProcessLauncherOptions = ^IProcessLauncherOptions;

  // Windows.System.IProcessLauncherResult
  IProcessLauncherResult = interface;
  PIProcessLauncherResult = ^IProcessLauncherResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IProcessLauncherResult>
  AsyncOperationCompletedHandler_1__IProcessLauncherResult = interface;
  PAsyncOperationCompletedHandler_1__IProcessLauncherResult = ^AsyncOperationCompletedHandler_1__IProcessLauncherResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.IProcessLauncherResult>
  IAsyncOperation_1__IProcessLauncherResult = interface;
  PIAsyncOperation_1__IProcessLauncherResult = ^IAsyncOperation_1__IProcessLauncherResult;

  // Windows.System.IProcessLauncherStatics
  IProcessLauncherStatics = interface;
  PIProcessLauncherStatics = ^IProcessLauncherStatics;

  // Windows.System.IShutdownManagerStatics
  IShutdownManagerStatics = interface;
  PIShutdownManagerStatics = ^IShutdownManagerStatics;

  // Windows.System.IShutdownManagerStatics2
  IShutdownManagerStatics2 = interface;
  PIShutdownManagerStatics2 = ^IShutdownManagerStatics2;

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

  // Windows.System.UserProfile.IAdvertisingManagerForUser
  UserProfile_IAdvertisingManagerForUser = interface;
  PUserProfile_IAdvertisingManagerForUser = ^UserProfile_IAdvertisingManagerForUser;

  // Windows.System.Profile.ISystemIdentificationInfo
  Profile_ISystemIdentificationInfo = interface;
  PProfile_ISystemIdentificationInfo = ^Profile_ISystemIdentificationInfo;

  // Windows.System.IDispatcherQueueController
  IDispatcherQueueController = interface;
  PIDispatcherQueueController = ^IDispatcherQueueController;

  // Windows.System.IDispatcherQueueControllerStatics
  IDispatcherQueueControllerStatics = interface;
  PIDispatcherQueueControllerStatics = ^IDispatcherQueueControllerStatics;

  // Windows.System.IDispatcherQueueStatics
  IDispatcherQueueStatics = interface;
  PIDispatcherQueueStatics = ^IDispatcherQueueStatics;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserChangedEventArgs>
  TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs = interface;
  PTypedEventHandler_2__IUserWatcher__IUserChangedEventArgs = ^TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs;

  // Windows.System.IUserAuthenticationStatusChangeDeferral
  IUserAuthenticationStatusChangeDeferral = interface;
  PIUserAuthenticationStatusChangeDeferral = ^IUserAuthenticationStatusChangeDeferral;

  // Windows.System.IUserAuthenticationStatusChangingEventArgs
  IUserAuthenticationStatusChangingEventArgs = interface;
  PIUserAuthenticationStatusChangingEventArgs = ^IUserAuthenticationStatusChangingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserAuthenticationStatusChangingEventArgs>
  TypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs = interface;
  PTypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs = ^TypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Object>
  TypedEventHandler_2__IUserWatcher__IInspectable = interface;
  PTypedEventHandler_2__IUserWatcher__IInspectable = ^TypedEventHandler_2__IUserWatcher__IInspectable;

  // Windows.System.IUserWatcher
  IUserWatcher = interface;
  PIUserWatcher = ^IUserWatcher;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.IUser>
  IIterator_1__IUser = interface;
  PIIterator_1__IUser = ^IIterator_1__IUser;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.IUser>
  IIterable_1__IUser = interface;
  PIIterable_1__IUser = ^IIterable_1__IUser;

  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>
  IVectorView_1__IUser = interface;
  PIVectorView_1__IUser = ^IVectorView_1__IUser;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IUser = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IUser = ^AsyncOperationCompletedHandler_1__IVectorView_1__IUser;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  IAsyncOperation_1__IVectorView_1__IUser = interface;
  PIAsyncOperation_1__IVectorView_1__IUser = ^IAsyncOperation_1__IVectorView_1__IUser;

  // Windows.System.IUserStatics
  IUserStatics = interface;
  PIUserStatics = ^IUserStatics;

  // Windows.System.IKnownUserPropertiesStatics
  IKnownUserPropertiesStatics = interface;
  PIKnownUserPropertiesStatics = ^IKnownUserPropertiesStatics;

  // Windows.System.IUserPickerStatics
  IUserPickerStatics = interface;
  PIUserPickerStatics = ^IUserPickerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IUser>
  AsyncOperationCompletedHandler_1__IUser = interface;
  PAsyncOperationCompletedHandler_1__IUser = ^AsyncOperationCompletedHandler_1__IUser;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.IUser>
  IAsyncOperation_1__IUser = interface;
  PIAsyncOperation_1__IUser = ^IAsyncOperation_1__IUser;

  // Windows.System.IUserPicker
  IUserPicker = interface;
  PIUserPicker = ^IUserPicker;

  // Windows.System.IUserDeviceAssociationChangedEventArgs
  IUserDeviceAssociationChangedEventArgs = interface;
  PIUserDeviceAssociationChangedEventArgs = ^IUserDeviceAssociationChangedEventArgs;

  // Windows.Foundation.EventHandler`1<Windows.System.IUserDeviceAssociationChangedEventArgs>
  EventHandler_1__IUserDeviceAssociationChangedEventArgs = interface;
  PEventHandler_1__IUserDeviceAssociationChangedEventArgs = ^EventHandler_1__IUserDeviceAssociationChangedEventArgs;

  // Windows.System.IUserDeviceAssociationStatics
  IUserDeviceAssociationStatics = interface;
  PIUserDeviceAssociationStatics = ^IUserDeviceAssociationStatics;

  // Windows.System.Profile.IAnalyticsVersionInfo
  Profile_IAnalyticsVersionInfo = interface;
  PProfile_IAnalyticsVersionInfo = ^Profile_IAnalyticsVersionInfo;

  // Windows.System.UserProfile.IDiagnosticsSettings
  UserProfile_IDiagnosticsSettings = interface;
  PUserProfile_IDiagnosticsSettings = ^UserProfile_IDiagnosticsSettings;

  // Windows.System.UserProfile.IDiagnosticsSettingsStatics
  UserProfile_IDiagnosticsSettingsStatics = interface;
  PUserProfile_IDiagnosticsSettingsStatics = ^UserProfile_IDiagnosticsSettingsStatics;

  // Windows.System.IAppMemoryReport
  IAppMemoryReport = interface;
  PIAppMemoryReport = ^IAppMemoryReport;

  // Windows.System.IAppMemoryReport2
  IAppMemoryReport2 = interface;
  PIAppMemoryReport2 = ^IAppMemoryReport2;

  // Windows.System.IProcessMemoryReport
  IProcessMemoryReport = interface;
  PIProcessMemoryReport = ^IProcessMemoryReport;

  // Windows.System.IAppMemoryUsageLimitChangingEventArgs
  IAppMemoryUsageLimitChangingEventArgs = interface;
  PIAppMemoryUsageLimitChangingEventArgs = ^IAppMemoryUsageLimitChangingEventArgs;

  // Windows.Foundation.EventHandler`1<Windows.System.IAppMemoryUsageLimitChangingEventArgs>
  EventHandler_1__IAppMemoryUsageLimitChangingEventArgs = interface;
  PEventHandler_1__IAppMemoryUsageLimitChangingEventArgs = ^EventHandler_1__IAppMemoryUsageLimitChangingEventArgs;

  // Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
  Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface;
  PDiagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = ^Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo;

  // Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo
  Diagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo = interface;
  PDiagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo = ^Diagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo;

  // Windows.Foundation.Collections.IIterable`1<Guid>
  IIterable_1__TGuid = interface;
  PIIterable_1__TGuid = ^IIterable_1__TGuid;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface;
  PIIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = ^IIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IIterable_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface;
  PIIterable_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = ^IIterable_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface;
  PIVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = ^IVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo;

  // Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticActionsStatics
  Diagnostics_TraceReporting_IPlatformDiagnosticActionsStatics = interface;
  PDiagnostics_TraceReporting_IPlatformDiagnosticActionsStatics = ^Diagnostics_TraceReporting_IPlatformDiagnosticActionsStatics;

  // Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
  Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings = interface;
  PDiagnostics_Telemetry_IPlatformTelemetryRegistrationSettings = ^Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings;

  // Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult
  Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult = interface;
  PDiagnostics_Telemetry_IPlatformTelemetryRegistrationResult = ^Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult;

  // Windows.System.Diagnostics.Telemetry.IPlatformTelemetryClientStatics
  Diagnostics_Telemetry_IPlatformTelemetryClientStatics = interface;
  PDiagnostics_Telemetry_IPlatformTelemetryClientStatics = ^Diagnostics_Telemetry_IPlatformTelemetryClientStatics;

  // Windows.System.RemoteSystems.IRemoteSystemFilter
  RemoteSystems_IRemoteSystemFilter = interface;
  PRemoteSystems_IRemoteSystemFilter = ^RemoteSystems_IRemoteSystemFilter;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystem>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem = interface;
  PAsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem = ^AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystem>
  IAsyncOperation_1__RemoteSystems_IRemoteSystem = interface;
  PIAsyncOperation_1__RemoteSystems_IRemoteSystem = ^IAsyncOperation_1__RemoteSystems_IRemoteSystem;

  // Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs
  RemoteSystems_IRemoteSystemAddedEventArgs = interface;
  PRemoteSystems_IRemoteSystemAddedEventArgs = ^RemoteSystems_IRemoteSystemAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs
  RemoteSystems_IRemoteSystemUpdatedEventArgs = interface;
  PRemoteSystems_IRemoteSystemUpdatedEventArgs = ^RemoteSystems_IRemoteSystemUpdatedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs
  RemoteSystems_IRemoteSystemRemovedEventArgs = interface;
  PRemoteSystems_IRemoteSystemRemovedEventArgs = ^RemoteSystems_IRemoteSystemRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemWatcher
  RemoteSystems_IRemoteSystemWatcher = interface;
  PRemoteSystems_IRemoteSystemWatcher = ^RemoteSystems_IRemoteSystemWatcher;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  IIterator_1__RemoteSystems_IRemoteSystemFilter = interface;
  PIIterator_1__RemoteSystems_IRemoteSystemFilter = ^IIterator_1__RemoteSystems_IRemoteSystemFilter;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  IIterable_1__RemoteSystems_IRemoteSystemFilter = interface;
  PIIterable_1__RemoteSystems_IRemoteSystemFilter = ^IIterable_1__RemoteSystems_IRemoteSystemFilter;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus = ^AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  IAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus = interface;
  PIAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus = ^IAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus;

  // Windows.System.RemoteSystems.IRemoteSystem2
  RemoteSystems_IRemoteSystem2 = interface;
  PRemoteSystems_IRemoteSystem2 = ^RemoteSystems_IRemoteSystem2;

  // Windows.System.RemoteSystems.IRemoteSystem3
  RemoteSystems_IRemoteSystem3 = interface;
  PRemoteSystems_IRemoteSystem3 = ^RemoteSystems_IRemoteSystem3;

  // Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter
  RemoteSystems_IRemoteSystemAuthorizationKindFilter = interface;
  PRemoteSystems_IRemoteSystemAuthorizationKindFilter = ^RemoteSystems_IRemoteSystemAuthorizationKindFilter;

  // Windows.System.RemoteSystems.IRemoteSystemKindFilter
  RemoteSystems_IRemoteSystemKindFilter = interface;
  PRemoteSystems_IRemoteSystemKindFilter = ^RemoteSystems_IRemoteSystemKindFilter;

  // Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter
  RemoteSystems_IRemoteSystemDiscoveryTypeFilter = interface;
  PRemoteSystems_IRemoteSystemDiscoveryTypeFilter = ^RemoteSystems_IRemoteSystemDiscoveryTypeFilter;

  // Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter
  RemoteSystems_IRemoteSystemStatusTypeFilter = interface;
  PRemoteSystems_IRemoteSystemStatusTypeFilter = ^RemoteSystems_IRemoteSystemStatusTypeFilter;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Object>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable;

  // Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult
  RemoteSystems_IRemoteSystemSessionJoinResult = interface;
  PRemoteSystems_IRemoteSystemSessionJoinResult = ^RemoteSystems_IRemoteSystemSessionJoinResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult = interface;
  PAsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult = ^AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult = interface;
  PIAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult = ^IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult;

  // Windows.System.RemoteSystems.IRemoteSystemSessionInfo
  RemoteSystems_IRemoteSystemSessionInfo = interface;
  PRemoteSystems_IRemoteSystemSessionInfo = ^RemoteSystems_IRemoteSystemSessionInfo;

  // Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs
  RemoteSystems_IRemoteSystemSessionAddedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionAddedEventArgs = ^RemoteSystems_IRemoteSystemSessionAddedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs
  RemoteSystems_IRemoteSystemSessionUpdatedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionUpdatedEventArgs = ^RemoteSystems_IRemoteSystemSessionUpdatedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs
  RemoteSystems_IRemoteSystemSessionRemovedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionRemovedEventArgs = ^RemoteSystems_IRemoteSystemSessionRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
  RemoteSystems_IRemoteSystemSessionWatcher = interface;
  PRemoteSystems_IRemoteSystemSessionWatcher = ^RemoteSystems_IRemoteSystemSessionWatcher;

  // Windows.System.RemoteSystems.IRemoteSystemSessionInvitation
  RemoteSystems_IRemoteSystemSessionInvitation = interface;
  PRemoteSystems_IRemoteSystemSessionInvitation = ^RemoteSystems_IRemoteSystemSessionInvitation;

  // Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs
  RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs = ^RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener,Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener
  RemoteSystems_IRemoteSystemSessionInvitationListener = interface;
  PRemoteSystems_IRemoteSystemSessionInvitationListener = ^RemoteSystems_IRemoteSystemSessionInvitationListener;

  // Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequest
  RemoteSystems_IRemoteSystemSessionJoinRequest = interface;
  PRemoteSystems_IRemoteSystemSessionJoinRequest = ^RemoteSystems_IRemoteSystemSessionJoinRequest;

  // Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs
  RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs = ^RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult
  RemoteSystems_IRemoteSystemSessionCreationResult = interface;
  PRemoteSystems_IRemoteSystemSessionCreationResult = ^RemoteSystems_IRemoteSystemSessionCreationResult;

  // Windows.System.RemoteSystems.IRemoteSystemSessionOptions
  RemoteSystems_IRemoteSystemSessionOptions = interface;
  PRemoteSystems_IRemoteSystemSessionOptions = ^RemoteSystems_IRemoteSystemSessionOptions;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionController,Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult = interface;
  PAsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult = ^AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult = interface;
  PIAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult = ^IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult;

  // Windows.System.RemoteSystems.IRemoteSystemSessionController
  RemoteSystems_IRemoteSystemSessionController = interface;
  PRemoteSystems_IRemoteSystemSessionController = ^RemoteSystems_IRemoteSystemSessionController;

  // Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs
  RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs = interface;
  PRemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs = ^RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  IIterator_1__RemoteSystems_IRemoteSystemSessionParticipant = interface;
  PIIterator_1__RemoteSystems_IRemoteSystemSessionParticipant = ^IIterator_1__RemoteSystems_IRemoteSystemSessionParticipant;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  IIterable_1__RemoteSystems_IRemoteSystemSessionParticipant = interface;
  PIIterable_1__RemoteSystems_IRemoteSystemSessionParticipant = ^IIterable_1__RemoteSystems_IRemoteSystemSessionParticipant;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel,Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs = interface;
  PTypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs = ^TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs;

  // Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
  RemoteSystems_IRemoteSystemSessionMessageChannel = interface;
  PRemoteSystems_IRemoteSystemSessionMessageChannel = ^RemoteSystems_IRemoteSystemSessionMessageChannel;

  // Windows.System.Threading.IThreadPoolTimer
  Threading_IThreadPoolTimer = interface;
  PThreading_IThreadPoolTimer = ^Threading_IThreadPoolTimer;

  // Windows.System.Threading.TimerElapsedHandler
  Threading_TimerElapsedHandler = interface;
  PThreading_TimerElapsedHandler = ^Threading_TimerElapsedHandler;

  // Windows.System.Threading.TimerDestroyedHandler
  Threading_TimerDestroyedHandler = interface;
  PThreading_TimerDestroyedHandler = ^Threading_TimerDestroyedHandler;

  // Windows.System.Threading.WorkItemHandler
  Threading_WorkItemHandler = interface;
  PThreading_WorkItemHandler = ^Threading_WorkItemHandler;

  // Windows.System.Threading.Core.ISignalNotifier
  Threading_Core_ISignalNotifier = interface;
  PThreading_Core_ISignalNotifier = ^Threading_Core_ISignalNotifier;

  // Windows.System.Threading.Core.SignalHandler
  Threading_Core_SignalHandler = interface;
  PThreading_Core_SignalHandler = ^Threading_Core_SignalHandler;

  // Windows.System.Threading.Core.IPreallocatedWorkItem
  Threading_Core_IPreallocatedWorkItem = interface;
  PThreading_Core_IPreallocatedWorkItem = ^Threading_Core_IPreallocatedWorkItem;

  // Windows.System.UserProfile.IUserProfilePersonalizationSettings
  UserProfile_IUserProfilePersonalizationSettings = interface;
  PUserProfile_IUserProfilePersonalizationSettings = ^UserProfile_IUserProfilePersonalizationSettings;

  // Windows.System.UserProfile.IUserProfilePersonalizationSettingsStatics
  UserProfile_IUserProfilePersonalizationSettingsStatics = interface;
  PUserProfile_IUserProfilePersonalizationSettingsStatics = ^UserProfile_IUserProfilePersonalizationSettingsStatics;

  // Windows.System.Diagnostics.IProcessDiskUsageReport
  Diagnostics_IProcessDiskUsageReport = interface;
  PDiagnostics_IProcessDiskUsageReport = ^Diagnostics_IProcessDiskUsageReport;

  // Windows.System.Diagnostics.IProcessDiskUsage
  Diagnostics_IProcessDiskUsage = interface;
  PDiagnostics_IProcessDiskUsage = ^Diagnostics_IProcessDiskUsage;

  // Windows.System.Diagnostics.IProcessMemoryUsageReport
  Diagnostics_IProcessMemoryUsageReport = interface;
  PDiagnostics_IProcessMemoryUsageReport = ^Diagnostics_IProcessMemoryUsageReport;

  // Windows.System.Diagnostics.IProcessMemoryUsage
  Diagnostics_IProcessMemoryUsage = interface;
  PDiagnostics_IProcessMemoryUsage = ^Diagnostics_IProcessMemoryUsage;

  // Windows.System.Diagnostics.IProcessCpuUsageReport
  Diagnostics_IProcessCpuUsageReport = interface;
  PDiagnostics_IProcessCpuUsageReport = ^Diagnostics_IProcessCpuUsageReport;

  // Windows.System.Diagnostics.IProcessCpuUsage
  Diagnostics_IProcessCpuUsage = interface;
  PDiagnostics_IProcessCpuUsage = ^Diagnostics_IProcessCpuUsage;

  // Windows.System.Diagnostics.IProcessDiagnosticInfo
  Diagnostics_IProcessDiagnosticInfo = interface;
  PDiagnostics_IProcessDiagnosticInfo = ^Diagnostics_IProcessDiagnosticInfo;

  // Windows.System.IAppDiagnosticInfo
  IAppDiagnosticInfo = interface;
  PIAppDiagnosticInfo = ^IAppDiagnosticInfo;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppDiagnosticInfo>
  IIterator_1__IAppDiagnosticInfo = interface;
  PIIterator_1__IAppDiagnosticInfo = ^IIterator_1__IAppDiagnosticInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppDiagnosticInfo>
  IIterable_1__IAppDiagnosticInfo = interface;
  PIIterable_1__IAppDiagnosticInfo = ^IIterable_1__IAppDiagnosticInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppDiagnosticInfo>
  IVectorView_1__IAppDiagnosticInfo = interface;
  PIVectorView_1__IAppDiagnosticInfo = ^IVectorView_1__IAppDiagnosticInfo;

  // Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>
  IVector_1__IAppDiagnosticInfo = interface;
  PIVector_1__IAppDiagnosticInfo = ^IVector_1__IAppDiagnosticInfo;

  // Windows.System.Diagnostics.IProcessDiagnosticInfo2
  Diagnostics_IProcessDiagnosticInfo2 = interface;
  PDiagnostics_IProcessDiagnosticInfo2 = ^Diagnostics_IProcessDiagnosticInfo2;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IIterator_1__Diagnostics_IProcessDiagnosticInfo = interface;
  PIIterator_1__Diagnostics_IProcessDiagnosticInfo = ^IIterator_1__Diagnostics_IProcessDiagnosticInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IIterable_1__Diagnostics_IProcessDiagnosticInfo = interface;
  PIIterable_1__Diagnostics_IProcessDiagnosticInfo = ^IIterable_1__Diagnostics_IProcessDiagnosticInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IVectorView_1__Diagnostics_IProcessDiagnosticInfo = interface;
  PIVectorView_1__Diagnostics_IProcessDiagnosticInfo = ^IVectorView_1__Diagnostics_IProcessDiagnosticInfo;

  // Windows.System.Diagnostics.IProcessDiagnosticInfoStatics
  Diagnostics_IProcessDiagnosticInfoStatics = interface;
  PDiagnostics_IProcessDiagnosticInfoStatics = ^Diagnostics_IProcessDiagnosticInfoStatics;

  // Windows.System.Diagnostics.IProcessDiagnosticInfoStatics2
  Diagnostics_IProcessDiagnosticInfoStatics2 = interface;
  PDiagnostics_IProcessDiagnosticInfoStatics2 = ^Diagnostics_IProcessDiagnosticInfoStatics2;

  // Windows.System.Diagnostics.ISystemMemoryUsageReport
  Diagnostics_ISystemMemoryUsageReport = interface;
  PDiagnostics_ISystemMemoryUsageReport = ^Diagnostics_ISystemMemoryUsageReport;

  // Windows.System.Diagnostics.ISystemMemoryUsage
  Diagnostics_ISystemMemoryUsage = interface;
  PDiagnostics_ISystemMemoryUsage = ^Diagnostics_ISystemMemoryUsage;

  // Windows.System.Diagnostics.ISystemCpuUsageReport
  Diagnostics_ISystemCpuUsageReport = interface;
  PDiagnostics_ISystemCpuUsageReport = ^Diagnostics_ISystemCpuUsageReport;

  // Windows.System.Diagnostics.ISystemCpuUsage
  Diagnostics_ISystemCpuUsage = interface;
  PDiagnostics_ISystemCpuUsage = ^Diagnostics_ISystemCpuUsage;

  // Windows.System.Diagnostics.ISystemDiagnosticInfo
  Diagnostics_ISystemDiagnosticInfo = interface;
  PDiagnostics_ISystemDiagnosticInfo = ^Diagnostics_ISystemDiagnosticInfo;

  // Windows.System.Diagnostics.ISystemDiagnosticInfoStatics
  Diagnostics_ISystemDiagnosticInfoStatics = interface;
  PDiagnostics_ISystemDiagnosticInfoStatics = ^Diagnostics_ISystemDiagnosticInfoStatics;

  // Windows.System.UserProfile.IGlobalizationPreferencesStatics
  UserProfile_IGlobalizationPreferencesStatics = interface;
  PUserProfile_IGlobalizationPreferencesStatics = ^UserProfile_IGlobalizationPreferencesStatics;

  // Windows.System.UserProfile.IGlobalizationPreferencesStatics2
  UserProfile_IGlobalizationPreferencesStatics2 = interface;
  PUserProfile_IGlobalizationPreferencesStatics2 = ^UserProfile_IGlobalizationPreferencesStatics2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo = interface;
  PAsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo = ^AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  IAsyncOperation_1__IVector_1__IAppDiagnosticInfo = interface;
  PIAsyncOperation_1__IVector_1__IAppDiagnosticInfo = ^IAsyncOperation_1__IVector_1__IAppDiagnosticInfo;

  // Windows.System.IAppDiagnosticInfoStatics
  IAppDiagnosticInfoStatics = interface;
  PIAppDiagnosticInfoStatics = ^IAppDiagnosticInfoStatics;

  // Windows.System.IAppDiagnosticInfoWatcherEventArgs
  IAppDiagnosticInfoWatcherEventArgs = interface;
  PIAppDiagnosticInfoWatcherEventArgs = ^IAppDiagnosticInfoWatcherEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Windows.System.IAppDiagnosticInfoWatcherEventArgs>
  TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs = interface;
  PTypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs = ^TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Object>
  TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable = interface;
  PTypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable = ^TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable;

  // Windows.System.IAppDiagnosticInfoWatcher
  IAppDiagnosticInfoWatcher = interface;
  PIAppDiagnosticInfoWatcher = ^IAppDiagnosticInfoWatcher;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.DiagnosticAccessStatus>
  AsyncOperationCompletedHandler_1__DiagnosticAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__DiagnosticAccessStatus = ^AsyncOperationCompletedHandler_1__DiagnosticAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.DiagnosticAccessStatus>
  IAsyncOperation_1__DiagnosticAccessStatus = interface;
  PIAsyncOperation_1__DiagnosticAccessStatus = ^IAsyncOperation_1__DiagnosticAccessStatus;

  // Windows.System.IAppDiagnosticInfoStatics2
  IAppDiagnosticInfoStatics2 = interface;
  PIAppDiagnosticInfoStatics2 = ^IAppDiagnosticInfoStatics2;

  // Windows.System.IAppResourceGroupBackgroundTaskReport
  IAppResourceGroupBackgroundTaskReport = interface;
  PIAppResourceGroupBackgroundTaskReport = ^IAppResourceGroupBackgroundTaskReport;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IIterator_1__IAppResourceGroupBackgroundTaskReport = interface;
  PIIterator_1__IAppResourceGroupBackgroundTaskReport = ^IIterator_1__IAppResourceGroupBackgroundTaskReport;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IIterable_1__IAppResourceGroupBackgroundTaskReport = interface;
  PIIterable_1__IAppResourceGroupBackgroundTaskReport = ^IIterable_1__IAppResourceGroupBackgroundTaskReport;

  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IVectorView_1__IAppResourceGroupBackgroundTaskReport = interface;
  PIVectorView_1__IAppResourceGroupBackgroundTaskReport = ^IVectorView_1__IAppResourceGroupBackgroundTaskReport;

  // Windows.Foundation.Collections.IVector`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IVector_1__IAppResourceGroupBackgroundTaskReport = interface;
  PIVector_1__IAppResourceGroupBackgroundTaskReport = ^IVector_1__IAppResourceGroupBackgroundTaskReport;

  // Windows.System.IAppResourceGroupMemoryReport
  IAppResourceGroupMemoryReport = interface;
  PIAppResourceGroupMemoryReport = ^IAppResourceGroupMemoryReport;

  // Windows.Foundation.Collections.IVector`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IVector_1__Diagnostics_IProcessDiagnosticInfo = interface;
  PIVector_1__Diagnostics_IProcessDiagnosticInfo = ^IVector_1__Diagnostics_IProcessDiagnosticInfo;

  // Windows.System.IAppResourceGroupStateReport
  IAppResourceGroupStateReport = interface;
  PIAppResourceGroupStateReport = ^IAppResourceGroupStateReport;

  // Windows.System.IAppResourceGroupInfo
  IAppResourceGroupInfo = interface;
  PIAppResourceGroupInfo = ^IAppResourceGroupInfo;

  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupInfo>
  IIterator_1__IAppResourceGroupInfo = interface;
  PIIterator_1__IAppResourceGroupInfo = ^IIterator_1__IAppResourceGroupInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppResourceGroupInfo>
  IIterable_1__IAppResourceGroupInfo = interface;
  PIIterable_1__IAppResourceGroupInfo = ^IIterable_1__IAppResourceGroupInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppResourceGroupInfo>
  IVectorView_1__IAppResourceGroupInfo = interface;
  PIVectorView_1__IAppResourceGroupInfo = ^IVectorView_1__IAppResourceGroupInfo;

  // Windows.Foundation.Collections.IVector`1<Windows.System.IAppResourceGroupInfo>
  IVector_1__IAppResourceGroupInfo = interface;
  PIVector_1__IAppResourceGroupInfo = ^IVector_1__IAppResourceGroupInfo;

  // Windows.System.IAppResourceGroupInfoWatcherEventArgs
  IAppResourceGroupInfoWatcherEventArgs = interface;
  PIAppResourceGroupInfoWatcherEventArgs = ^IAppResourceGroupInfoWatcherEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherEventArgs>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs = interface;
  PTypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs = ^TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Object>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable = interface;
  PTypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable = ^TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable;

  // Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs
  IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs = interface;
  PIAppResourceGroupInfoWatcherExecutionStateChangedEventArgs = ^IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs = interface;
  PTypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs = ^TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs;

  // Windows.System.IAppResourceGroupInfoWatcher
  IAppResourceGroupInfoWatcher = interface;
  PIAppResourceGroupInfoWatcher = ^IAppResourceGroupInfoWatcher;

  // Windows.System.IAppDiagnosticInfo2
  IAppDiagnosticInfo2 = interface;
  PIAppDiagnosticInfo2 = ^IAppDiagnosticInfo2;

  // Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
  Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs = interface;
  PDiagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs = ^Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs;

  // Windows.Foundation.Collections.IMap`2<String,String>
  IMap_2__HSTRING__HSTRING = interface;
  PIMap_2__HSTRING__HSTRING = ^IMap_2__HSTRING__HSTRING;

  // Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
  Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs = interface;
  PDiagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs = ^Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs>
  TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs = interface;
  PTypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs = ^TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs>
  TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs = interface;
  PTypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs = ^TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs;

  // Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
  Diagnostics_DevicePortal_IDevicePortalConnection = interface;
  PDiagnostics_DevicePortal_IDevicePortalConnection = ^Diagnostics_DevicePortal_IDevicePortalConnection;

  // Windows.System.Diagnostics.IDiagnosticActionResult
  Diagnostics_IDiagnosticActionResult = interface;
  PDiagnostics_IDiagnosticActionResult = ^Diagnostics_IDiagnosticActionResult;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = interface;
  PAsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = ^AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = ^AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = interface;
  PIAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = ^IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState;

  // Windows.System.Diagnostics.IDiagnosticInvoker
  Diagnostics_IDiagnosticInvoker = interface;
  PDiagnostics_IDiagnosticInvoker = ^Diagnostics_IDiagnosticInvoker;

  // Windows.System.Display.IDisplayRequest
  Display_IDisplayRequest = interface;
  PDisplay_IDisplayRequest = ^Display_IDisplayRequest;

  // Windows.System.Profile.IPlatformDiagnosticsAndUsageDataSettingsStatics
  Profile_IPlatformDiagnosticsAndUsageDataSettingsStatics = interface;
  PProfile_IPlatformDiagnosticsAndUsageDataSettingsStatics = ^Profile_IPlatformDiagnosticsAndUsageDataSettingsStatics;

  // Windows.System.UserProfile.IFirstSignInSettings
  UserProfile_IFirstSignInSettings = interface;
  PUserProfile_IFirstSignInSettings = ^UserProfile_IFirstSignInSettings;

  // Windows.System.UserProfile.IFirstSignInSettingsStatics
  UserProfile_IFirstSignInSettingsStatics = interface;
  PUserProfile_IFirstSignInSettingsStatics = ^UserProfile_IFirstSignInSettingsStatics;

  // Windows.System.ILaunchUriResult
  ILaunchUriResult = interface;
  PILaunchUriResult = ^ILaunchUriResult;

  // Windows.System.ILauncherUIOptions
  ILauncherUIOptions = interface;
  PILauncherUIOptions = ^ILauncherUIOptions;

  // Windows.System.ILauncherOptions
  ILauncherOptions = interface;
  PILauncherOptions = ^ILauncherOptions;

  // Windows.System.ILauncherOptions2
  ILauncherOptions2 = interface;
  PILauncherOptions2 = ^ILauncherOptions2;

  // Windows.System.ILauncherOptions3
  ILauncherOptions3 = interface;
  PILauncherOptions3 = ^ILauncherOptions3;

  // Windows.System.ILauncherOptions4
  ILauncherOptions4 = interface;
  PILauncherOptions4 = ^ILauncherOptions4;

  // Windows.System.ILauncherViewOptions
  ILauncherViewOptions = interface;
  PILauncherViewOptions = ^ILauncherViewOptions;

  // Windows.System.IRemoteLauncherOptions
  IRemoteLauncherOptions = interface;
  PIRemoteLauncherOptions = ^IRemoteLauncherOptions;

  // Windows.System.IFolderLauncherOptions
  IFolderLauncherOptions = interface;
  PIFolderLauncherOptions = ^IFolderLauncherOptions;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.ILaunchUriResult>
  AsyncOperationCompletedHandler_1__ILaunchUriResult = interface;
  PAsyncOperationCompletedHandler_1__ILaunchUriResult = ^AsyncOperationCompletedHandler_1__ILaunchUriResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.ILaunchUriResult>
  IAsyncOperation_1__ILaunchUriResult = interface;
  PIAsyncOperation_1__ILaunchUriResult = ^IAsyncOperation_1__ILaunchUriResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchQuerySupportStatus>
  AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus = interface;
  PAsyncOperationCompletedHandler_1__LaunchQuerySupportStatus = ^AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchQuerySupportStatus>
  IAsyncOperation_1__LaunchQuerySupportStatus = interface;
  PIAsyncOperation_1__LaunchQuerySupportStatus = ^IAsyncOperation_1__LaunchQuerySupportStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchUriStatus>
  AsyncOperationCompletedHandler_1__LaunchUriStatus = interface;
  PAsyncOperationCompletedHandler_1__LaunchUriStatus = ^AsyncOperationCompletedHandler_1__LaunchUriStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchUriStatus>
  IAsyncOperation_1__LaunchUriStatus = interface;
  PIAsyncOperation_1__LaunchUriStatus = ^IAsyncOperation_1__LaunchUriStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteLaunchUriStatus>
  AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus = interface;
  PAsyncOperationCompletedHandler_1__RemoteLaunchUriStatus = ^AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteLaunchUriStatus>
  IAsyncOperation_1__RemoteLaunchUriStatus = interface;
  PIAsyncOperation_1__RemoteLaunchUriStatus = ^IAsyncOperation_1__RemoteLaunchUriStatus;

  // Windows.System.Profile.IHardwareToken
  Profile_IHardwareToken = interface;
  PProfile_IHardwareToken = ^Profile_IHardwareToken;

  // Windows.System.Profile.ISharedModeSettingsStatics
  Profile_ISharedModeSettingsStatics = interface;
  PProfile_ISharedModeSettingsStatics = ^Profile_ISharedModeSettingsStatics;

  // Windows.System.Profile.ISharedModeSettingsStatics2
  Profile_ISharedModeSettingsStatics2 = interface;
  PProfile_ISharedModeSettingsStatics2 = ^Profile_ISharedModeSettingsStatics2;

  // Windows.System.Profile.SystemManufacturers.IOemSupportInfo
  Profile_SystemManufacturers_IOemSupportInfo = interface;
  PProfile_SystemManufacturers_IOemSupportInfo = ^Profile_SystemManufacturers_IOemSupportInfo;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetAccountPictureResult>
  AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult = interface;
  PAsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult = ^AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetAccountPictureResult>
  IAsyncOperation_1__UserProfile_SetAccountPictureResult = interface;
  PIAsyncOperation_1__UserProfile_SetAccountPictureResult = ^IAsyncOperation_1__UserProfile_SetAccountPictureResult;

  // Windows.System.UserProfile.IUserInformationStatics
  UserProfile_IUserInformationStatics = interface;
  PUserProfile_IUserInformationStatics = ^UserProfile_IUserInformationStatics;

  // Windows.System.UserProfile.ILockScreenStatics
  UserProfile_ILockScreenStatics = interface;
  PUserProfile_ILockScreenStatics = ^UserProfile_ILockScreenStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetImageFeedResult>
  AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult = interface;
  PAsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult = ^AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetImageFeedResult>
  IAsyncOperation_1__UserProfile_SetImageFeedResult = interface;
  PIAsyncOperation_1__UserProfile_SetImageFeedResult = ^IAsyncOperation_1__UserProfile_SetImageFeedResult;

  // Windows.System.UserProfile.ILockScreenImageFeedStatics
  UserProfile_ILockScreenImageFeedStatics = interface;
  PUserProfile_ILockScreenImageFeedStatics = ^UserProfile_ILockScreenImageFeedStatics;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.System Interfaces
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.System.IProtocolForResultsOperation
  IProtocolForResultsOperation = interface(IInspectable)
  ['{D581293A-6DE9-4D28-9378-F86782E182BB}']
    procedure ReportCompleted(data: IPropertySet); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemSessionDisconnectedReason
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs
  RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs = interface(IInspectable)
  ['{DE0BC69B-77C5-461C-8209-7C6C5D3111AB}']
    function get_Reason: RemoteSystems_RemoteSystemSessionDisconnectedReason; safecall;
    property Reason: RemoteSystems_RemoteSystemSessionDisconnectedReason read get_Reason;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSession,Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{FBA14773-5038-511A-95A3-4BA45349100A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSession
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSession,Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs_Delegate_Base)
  ['{FA2DF6EF-2BC7-513C-B451-4EEBE73F3565}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSession; args: RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystem
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IHostName>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  RemoteSystems_IRemoteSystemSessionParticipant = interface(IInspectable)
  ['{7E90058C-ACF9-4729-8A17-44E7BAED5DCC}']
    function get_RemoteSystem: RemoteSystems_IRemoteSystem; safecall;
    function GetHostNames: IVectorView_1__IHostName; safecall;
    property RemoteSystem: RemoteSystems_IRemoteSystem read get_RemoteSystem;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs
  RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs = interface(IInspectable)
  ['{D35A57D8-C9A1-4BB7-B6B0-79BB91ADF93D}']
    function get_Participant: RemoteSystems_IRemoteSystemSessionParticipant; safecall;
    property Participant: RemoteSystems_IRemoteSystemSessionParticipant read get_Participant;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{7D42FFF3-FD21-5E15-B21A-75E1BBCD13C7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs_Delegate_Base)
  ['{8050242C-8736-5D00-8922-F57E2C4619CA}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionParticipantWatcher; args: RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs
  RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs = interface(IInspectable)
  ['{866EF088-DE68-4ABF-88A1-F90D16274192}']
    function get_Participant: RemoteSystems_IRemoteSystemSessionParticipant; safecall;
    property Participant: RemoteSystems_IRemoteSystemSessionParticipant read get_Participant;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{73D7E8B3-7D44-50C8-AFAD-450DE59FD0AE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs_Delegate_Base)
  ['{ED891AAF-359D-5082-A50F-786496D6DAAB}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionParticipantWatcher; args: RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemSessionParticipantWatcherStatus
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionParticipantRemovedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Object>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
  RemoteSystems_IRemoteSystemSessionParticipantWatcher = interface(IInspectable)
  ['{DCDD02CC-AA87-4D79-B6CC-4459B3E92075}']
    procedure Start; safecall;
    procedure Stop; safecall;
    function get_Status: RemoteSystems_RemoteSystemSessionParticipantWatcherStatus; safecall;
    function add_Added(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__RemoteSystems_IRemoteSystemSessionParticipantRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    property Status: RemoteSystems_RemoteSystemSessionParticipantWatcherStatus read get_Status;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSession,Windows.System.RemoteSystems.IRemoteSystemSessionDisconnectedEventArgs>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystem
  }
  // Windows.System.RemoteSystems.IRemoteSystemSession
  RemoteSystems_IRemoteSystemSession = interface(IInspectable)
  ['{69476A01-9ADA-490F-9549-D31CB14C9E95}']
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_ControllerDisplayName: HSTRING; safecall;
    function add_Disconnected(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSession__RemoteSystems_IRemoteSystemSessionDisconnectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Disconnected(token: EventRegistrationToken); safecall;
    function CreateParticipantWatcher: RemoteSystems_IRemoteSystemSessionParticipantWatcher; safecall;
    function SendInvitationAsync(invitee: RemoteSystems_IRemoteSystem): IAsyncOperation_1__Boolean; safecall;
    property ControllerDisplayName: HSTRING read get_ControllerDisplayName;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.System.IDateTimeSettingsStatics
  [WinRTClassNameAttribute(SDateTimeSettings)]
  IDateTimeSettingsStatics = interface(IInspectable)
  ['{5D2150D1-47EE-48AB-A52B-9F1954278D82}']
    procedure SetSystemDateTime(utcDateTime: DateTime); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt32,UInt32>
  AsyncOperationProgressHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{EA0FE405-D432-5AC7-9EF8-5A65E1F97D7E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<UInt32,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt32,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Cardinal__Cardinal = interface(IUnknown)
  ['{1E466DC5-840F-54F9-B877-5E3A9F4B6C74}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Cardinal__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Boolean>
  AsyncOperationCompletedHandler_1__Boolean = interface(IUnknown)
  ['{C1D3D1A2-AE17-5A5F-B5A2-BDCC8844889A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Boolean; asyncStatus: AsyncStatus); safecall;
  end;

  // UsedAPI Interface
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
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  Windows.Storage.Streams.IOutputStream
  // Used Types:  String
  }
  // Windows.System.IProcessLauncherOptions
  [WinRTClassNameAttribute(SProcessLauncherOptions)]
  IProcessLauncherOptions = interface(IInspectable)
  ['{3080B9CF-F444-4A83-BEAF-A549A0F3229C}']
    function get_StandardInput: IInputStream; safecall;
    procedure put_StandardInput(value: IInputStream); safecall;
    function get_StandardOutput: IOutputStream; safecall;
    procedure put_StandardOutput(value: IOutputStream); safecall;
    function get_StandardError: IOutputStream; safecall;
    procedure put_StandardError(value: IOutputStream); safecall;
    function get_WorkingDirectory: HSTRING; safecall;
    procedure put_WorkingDirectory(value: HSTRING); safecall;
    property StandardError: IOutputStream read get_StandardError write put_StandardError;
    property StandardInput: IInputStream read get_StandardInput write put_StandardInput;
    property StandardOutput: IOutputStream read get_StandardOutput write put_StandardOutput;
    property WorkingDirectory: HSTRING read get_WorkingDirectory write put_WorkingDirectory;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.System.IProcessLauncherResult
  [WinRTClassNameAttribute(SProcessLauncherResult)]
  IProcessLauncherResult = interface(IInspectable)
  ['{544C8934-86D8-4991-8E75-ECE8A43B6B6D}']
    function get_ExitCode: Cardinal; safecall;
    property ExitCode: Cardinal read get_ExitCode;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IProcessLauncherResult>
  AsyncOperationCompletedHandler_1__IProcessLauncherResult_Delegate_Base = interface(IUnknown)
  ['{8D787EE6-07E4-5DCE-8FE5-B503A1F6368C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.IProcessLauncherResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IProcessLauncherResult>
  AsyncOperationCompletedHandler_1__IProcessLauncherResult = interface(AsyncOperationCompletedHandler_1__IProcessLauncherResult_Delegate_Base)
  ['{512FE955-DDF9-558A-A619-D23B5829279F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IProcessLauncherResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.IProcessLauncherResult>
  IAsyncOperation_1__IProcessLauncherResult_Base = interface(IInspectable)
  ['{E6827240-7A8D-51BE-8D21-E093268CCC15}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IProcessLauncherResult>
  // Used Types:  Windows.System.IProcessLauncherResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.IProcessLauncherResult>
  IAsyncOperation_1__IProcessLauncherResult = interface(IAsyncOperation_1__IProcessLauncherResult_Base)
  ['{57592837-AB2C-55CA-A796-9121A2902C39}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IProcessLauncherResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IProcessLauncherResult; safecall;
    function GetResults: IProcessLauncherResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IProcessLauncherResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.IProcessLauncherResult>
  // Used Types:  String
  // Used Types:  Windows.System.IProcessLauncherOptions
  }
  // Windows.System.IProcessLauncherStatics
  [WinRTClassNameAttribute(SProcessLauncher)]
  IProcessLauncherStatics = interface(IInspectable)
  ['{33AB66E7-2D0E-448B-A6A0-C13C3836D09C}']
    function RunToCompletionAsync(fileName: HSTRING; args: HSTRING): IAsyncOperation_1__IProcessLauncherResult; overload; safecall;
    function RunToCompletionAsync(fileName: HSTRING; args: HSTRING; options: IProcessLauncherOptions): IAsyncOperation_1__IProcessLauncherResult; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.ShutdownKind
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.System.IShutdownManagerStatics
  [WinRTClassNameAttribute(SShutdownManager)]
  IShutdownManagerStatics = interface(IInspectable)
  ['{72E247ED-DD5B-4D6C-B1D0-C57A7BBB5F94}']
    procedure BeginShutdown(shutdownKind: ShutdownKind; timeout: TimeSpan); safecall;
    procedure CancelShutdown; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.System.PowerState
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.System.IShutdownManagerStatics2
  [WinRTClassNameAttribute(SShutdownManager)]
  IShutdownManagerStatics2 = interface(IInspectable)
  ['{0F69A02F-9C34-43C7-A8C3-70B30A7F7504}']
    function IsPowerStateSupported(powerState: PowerState): Boolean; safecall;
    procedure EnterPowerState(powerState: PowerState); overload; safecall;
    procedure EnterPowerState(powerState: PowerState; wakeUpAfter: TimeSpan); overload; safecall;
  end;

  // UsedAPI Interface
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

  // UsedAPI Interface
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  IIterable_1__IKeyValuePair_2__HSTRING__IInspectable = interface(IInspectable)
  ['{FE2F3D47-5D47-5499-8374-430C7CDA0204}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IInspectable; safecall;
  end;

  // UsedAPI Interface
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

  // UsedAPI Interface
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

  // UsedAPI Interface
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IObservableMap`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IMapChangedEventArgs`1<String>
  }
  // Windows.Foundation.Collections.MapChangedEventHandler`2<String,Object>
  MapChangedEventHandler_2__HSTRING__IInspectable = interface(IUnknown)
  ['{24F981E5-DDCA-538D-AADA-A59906084CF1}']
    procedure Invoke(sender: IObservableMap_2__HSTRING__IInspectable; event: IMapChangedEventArgs_1__HSTRING); safecall;
  end;

  // UsedAPI Interface
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
  // Used Types:  Windows.System.IUser
  }
  // Windows.System.UserProfile.IAdvertisingManagerForUser
  [WinRTClassNameAttribute(SUserProfile_AdvertisingManagerForUser)]
  UserProfile_IAdvertisingManagerForUser = interface(IInspectable)
  ['{928BF3D0-CF7C-4AB0-A7DC-6DC5BCD44252}']
    function get_AdvertisingId: HSTRING; safecall;
    function get_User: IUser; safecall;
    property AdvertisingId: HSTRING read get_AdvertisingId;
    property User: IUser read get_User;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.System.Profile.SystemIdentificationSource
  }
  // Windows.System.Profile.ISystemIdentificationInfo
  Profile_ISystemIdentificationInfo = interface(IInspectable)
  ['{0C659E7D-C3C2-4D33-A2DF-21BC41916EB3}']
    function get_Id: IBuffer; safecall;
    function get_Source: Profile_SystemIdentificationSource; safecall;
    property Id: IBuffer read get_Id;
    property Source: Profile_SystemIdentificationSource read get_Source;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IDispatcherQueue
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.System.IDispatcherQueueController
  [WinRTClassNameAttribute(SDispatcherQueueController)]
  IDispatcherQueueController = interface(IInspectable)
  ['{22F34E66-50DB-4E36-A98D-61C01B384D20}']
    function get_DispatcherQueue: IDispatcherQueue; safecall;
    function ShutdownQueueAsync: IAsyncAction; safecall;
    property DispatcherQueue: IDispatcherQueue read get_DispatcherQueue;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IDispatcherQueueController
  }
  // Windows.System.IDispatcherQueueControllerStatics
  [WinRTClassNameAttribute(SDispatcherQueueController)]
  IDispatcherQueueControllerStatics = interface(IInspectable)
  ['{0A6C98E0-5198-49A2-A313-3F70D1F13C27}']
    function CreateOnDedicatedThread: IDispatcherQueueController; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IDispatcherQueue
  }
  // Windows.System.IDispatcherQueueStatics
  [WinRTClassNameAttribute(SDispatcherQueue)]
  IDispatcherQueueStatics = interface(IInspectable)
  ['{A96D83D7-9371-4517-9245-D0824AC12C74}']
    function GetForCurrentThread: IDispatcherQueue; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserChangedEventArgs>
  TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{EB9D0454-25DB-5620-98B8-BE4C5D0DBC67}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUserWatcher
  // Used Types:  Windows.System.IUserChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserChangedEventArgs>
  TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs = interface(TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs_Delegate_Base)
  ['{86D02F04-FE8D-56E3-BF34-02086CE023C3}']
    procedure Invoke(sender: IUserWatcher; args: IUserChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.System.IUserAuthenticationStatusChangeDeferral
  [WinRTClassNameAttribute(SUserAuthenticationStatusChangeDeferral)]
  IUserAuthenticationStatusChangeDeferral = interface(IInspectable)
  ['{88B59568-BB30-42FB-A270-E9902E40EFA7}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUserAuthenticationStatusChangeDeferral
  // Used Types:  Windows.System.IUser
  // Used Types:  Windows.System.UserAuthenticationStatus
  }
  // Windows.System.IUserAuthenticationStatusChangingEventArgs
  [WinRTClassNameAttribute(SUserAuthenticationStatusChangingEventArgs)]
  IUserAuthenticationStatusChangingEventArgs = interface(IInspectable)
  ['{8C030F28-A711-4C1E-AB48-04179C15938F}']
    function GetDeferral: IUserAuthenticationStatusChangeDeferral; safecall;
    function get_User: IUser; safecall;
    function get_NewStatus: UserAuthenticationStatus; safecall;
    function get_CurrentStatus: UserAuthenticationStatus; safecall;
    property CurrentStatus: UserAuthenticationStatus read get_CurrentStatus;
    property NewStatus: UserAuthenticationStatus read get_NewStatus;
    property User: IUser read get_User;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserAuthenticationStatusChangingEventArgs>
  TypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs_Delegate_Base = interface(IUnknown)
  ['{9EC3D9D5-B413-51DF-8C64-640E3356E351}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUserWatcher
  // Used Types:  Windows.System.IUserAuthenticationStatusChangingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserAuthenticationStatusChangingEventArgs>
  TypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs = interface(TypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs_Delegate_Base)
  ['{8E52A522-D252-5C66-981D-5C4669CAA182}']
    procedure Invoke(sender: IUserWatcher; args: IUserAuthenticationStatusChangingEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Object>
  TypedEventHandler_2__IUserWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F155E0FF-DBB5-5C34-AC0C-7E291E3300AB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUserWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Object>
  TypedEventHandler_2__IUserWatcher__IInspectable = interface(TypedEventHandler_2__IUserWatcher__IInspectable_Delegate_Base)
  ['{84CEB98E-C67B-5F00-9D4D-BAE9724A3F2C}']
    procedure Invoke(sender: IUserWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.UserWatcherStatus
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Windows.System.IUserAuthenticationStatusChangingEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IUserWatcher,Object>
  }
  // Windows.System.IUserWatcher
  [WinRTClassNameAttribute(SUserWatcher)]
  IUserWatcher = interface(IInspectable)
  ['{155EB23B-242A-45E0-A2E9-3171FC6A7FBB}']
    function get_Status: UserWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    function add_Added(handler: TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    function add_Updated(handler: TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Updated(token: EventRegistrationToken); safecall;
    function add_AuthenticationStatusChanged(handler: TypedEventHandler_2__IUserWatcher__IUserChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AuthenticationStatusChanged(token: EventRegistrationToken); safecall;
    function add_AuthenticationStatusChanging(handler: TypedEventHandler_2__IUserWatcher__IUserAuthenticationStatusChangingEventArgs): EventRegistrationToken; safecall;
    procedure remove_AuthenticationStatusChanging(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__IUserWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__IUserWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    property Status: UserWatcherStatus read get_Status;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IUser>
  IIterator_1__IUser_Base = interface(IInspectable)
  ['{326FE162-582B-5659-B8A4-68FF0F525745}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUser
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IUser>
  IIterator_1__IUser = interface(IIterator_1__IUser_Base)
  ['{7CA609B7-BB87-5F99-93CE-9F66837F18B2}']
    function get_Current: IUser; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIUser): Cardinal; safecall;
    property Current: IUser read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IUser>
  IIterable_1__IUser_Base = interface(IInspectable)
  ['{D1BACD1F-0376-5823-8C29-1D45B9F4C191}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.IUser>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IUser>
  IIterable_1__IUser = interface(IIterable_1__IUser_Base)
  ['{31EAD71A-B0E3-523D-ADC3-A3C6C4E566CD}']
    function First: IIterator_1__IUser; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUser
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>
  IVectorView_1__IUser = interface(IInspectable)
  ['{5B679876-AAF7-5044-99B1-64E9A66CAD79}']
    function GetAt(index: Cardinal): IUser; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IUser; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIUser): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IUser_Delegate_Base = interface(IUnknown)
  ['{09870533-F7CB-569C-B797-DCB48DEBD709}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IUser = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IUser_Delegate_Base)
  ['{5F64D434-639D-57F4-A6E7-351B8BBF48B3}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IUser; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  IAsyncOperation_1__IVectorView_1__IUser_Base = interface(IInspectable)
  ['{E44EA1DF-BB85-5A8C-BDDC-C8E960C355C9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  IAsyncOperation_1__IVectorView_1__IUser = interface(IAsyncOperation_1__IVectorView_1__IUser_Base)
  ['{A2CB77C4-6586-5D0A-B451-72EA90169873}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IUser); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IUser; safecall;
    function GetResults: IVectorView_1__IUser; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IUser read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUserWatcher
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.System.IUser>>
  // Used Types:  Windows.System.UserType
  // Used Types:  Windows.System.UserAuthenticationStatus
  // Used Types:  Windows.System.IUser
  // Used Types:  String
  }
  // Windows.System.IUserStatics
  [WinRTClassNameAttribute(SUser)]
  IUserStatics = interface(IInspectable)
  ['{155EB23B-242A-45E0-A2E9-3171FC6A7FDD}']
    function CreateWatcher: IUserWatcher; safecall;
    function FindAllAsync: IAsyncOperation_1__IVectorView_1__IUser; overload; safecall;
    function FindAllAsync(&type: UserType): IAsyncOperation_1__IVectorView_1__IUser; overload; safecall;
    function FindAllAsync(&type: UserType; status: UserAuthenticationStatus): IAsyncOperation_1__IVectorView_1__IUser; overload; safecall;
    function GetFromId(nonRoamableId: HSTRING): IUser; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.System.IKnownUserPropertiesStatics
  [WinRTClassNameAttribute(SKnownUserProperties)]
  IKnownUserPropertiesStatics = interface(IInspectable)
  ['{7755911A-70C5-48E5-B637-5BA3441E4EE4}']
    function get_DisplayName: HSTRING; safecall;
    function get_FirstName: HSTRING; safecall;
    function get_LastName: HSTRING; safecall;
    function get_ProviderName: HSTRING; safecall;
    function get_AccountName: HSTRING; safecall;
    function get_GuestHost: HSTRING; safecall;
    function get_PrincipalName: HSTRING; safecall;
    function get_DomainName: HSTRING; safecall;
    function get_SessionInitiationProtocolUri: HSTRING; safecall;
    property AccountName: HSTRING read get_AccountName;
    property DisplayName: HSTRING read get_DisplayName;
    property DomainName: HSTRING read get_DomainName;
    property FirstName: HSTRING read get_FirstName;
    property GuestHost: HSTRING read get_GuestHost;
    property LastName: HSTRING read get_LastName;
    property PrincipalName: HSTRING read get_PrincipalName;
    property ProviderName: HSTRING read get_ProviderName;
    property SessionInitiationProtocolUri: HSTRING read get_SessionInitiationProtocolUri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.System.IUserPickerStatics
  [WinRTClassNameAttribute(SUserPicker)]
  IUserPickerStatics = interface(IInspectable)
  ['{DE3290DC-7E73-4DF6-A1AE-4D7ECA82B40D}']
    function IsSupported: Boolean; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IUser>
  AsyncOperationCompletedHandler_1__IUser_Delegate_Base = interface(IUnknown)
  ['{F913E3A2-D1C5-5308-BECF-4C2D8167824A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.IUser>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IUser>
  AsyncOperationCompletedHandler_1__IUser = interface(AsyncOperationCompletedHandler_1__IUser_Delegate_Base)
  ['{EF43E3B4-FD2D-5741-8316-4615C835932A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IUser; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.IUser>
  IAsyncOperation_1__IUser_Base = interface(IInspectable)
  ['{A895D2F9-2399-5104-A532-5BA44AB4B165}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.IUser>
  // Used Types:  Windows.System.IUser
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.IUser>
  IAsyncOperation_1__IUser = interface(IAsyncOperation_1__IUser_Base)
  ['{0C897611-AD41-5100-B8E0-8E9A2A63DD93}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IUser); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IUser; safecall;
    function GetResults: IUser; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IUser read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.System.IUser
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.IUser>
  }
  // Windows.System.IUserPicker
  [WinRTClassNameAttribute(SUserPicker)]
  IUserPicker = interface(IInspectable)
  ['{7D548008-F1E3-4A6C-8DDC-A9BB0F488AED}']
    function get_AllowGuestAccounts: Boolean; safecall;
    procedure put_AllowGuestAccounts(value: Boolean); safecall;
    function get_SuggestedSelectedUser: IUser; safecall;
    procedure put_SuggestedSelectedUser(value: IUser); safecall;
    function PickSingleUserAsync: IAsyncOperation_1__IUser; safecall;
    property AllowGuestAccounts: Boolean read get_AllowGuestAccounts write put_AllowGuestAccounts;
    property SuggestedSelectedUser: IUser read get_SuggestedSelectedUser write put_SuggestedSelectedUser;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.System.IUser
  }
  // Windows.System.IUserDeviceAssociationChangedEventArgs
  [WinRTClassNameAttribute(SUserDeviceAssociationChangedEventArgs)]
  IUserDeviceAssociationChangedEventArgs = interface(IInspectable)
  ['{BD1F6F6C-BB5D-4D7B-A5F0-C8CD11A38D42}']
    function get_DeviceId: HSTRING; safecall;
    function get_NewUser: IUser; safecall;
    function get_OldUser: IUser; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property NewUser: IUser read get_NewUser;
    property OldUser: IUser read get_OldUser;
  end;

  // Generic Delegate for 
  // Windows.Foundation.EventHandler`1<Windows.System.IUserDeviceAssociationChangedEventArgs>
  EventHandler_1__IUserDeviceAssociationChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D3A3D4C5-D8B6-5A0E-88ED-A5499C377BE3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Object
  // Used Types:  Windows.System.IUserDeviceAssociationChangedEventArgs
  }
  // Windows.Foundation.EventHandler`1<Windows.System.IUserDeviceAssociationChangedEventArgs>
  EventHandler_1__IUserDeviceAssociationChangedEventArgs = interface(EventHandler_1__IUserDeviceAssociationChangedEventArgs_Delegate_Base)
  ['{DCB776BF-9377-5EAA-A1E9-1663A74E8A82}']
    procedure Invoke(sender: IInspectable; args: IUserDeviceAssociationChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IUser
  // Used Types:  String
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.EventHandler`1<Windows.System.IUserDeviceAssociationChangedEventArgs>
  }
  // Windows.System.IUserDeviceAssociationStatics
  [WinRTClassNameAttribute(SUserDeviceAssociation)]
  IUserDeviceAssociationStatics = interface(IInspectable)
  ['{7E491E14-F85A-4C07-8DA9-7FE3D0542343}']
    function FindUserFromDeviceId(deviceId: HSTRING): IUser; safecall;
    function add_UserDeviceAssociationChanged(handler: EventHandler_1__IUserDeviceAssociationChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_UserDeviceAssociationChanged(token: EventRegistrationToken); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.System.Profile.IAnalyticsVersionInfo
  Profile_IAnalyticsVersionInfo = interface(IInspectable)
  ['{926130B8-9955-4C74-BDC1-7CD0DECF9B03}']
    function get_DeviceFamily: HSTRING; safecall;
    function get_DeviceFamilyVersion: HSTRING; safecall;
    property DeviceFamily: HSTRING read get_DeviceFamily;
    property DeviceFamilyVersion: HSTRING read get_DeviceFamilyVersion;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.System.IUser
  }
  // Windows.System.UserProfile.IDiagnosticsSettings
  [WinRTClassNameAttribute(SUserProfile_DiagnosticsSettings)]
  UserProfile_IDiagnosticsSettings = interface(IInspectable)
  ['{E5E9ECCD-2711-44E0-973C-491D78048D24}']
    function get_CanUseDiagnosticsToTailorExperiences: Boolean; safecall;
    function get_User: IUser; safecall;
    property CanUseDiagnosticsToTailorExperiences: Boolean read get_CanUseDiagnosticsToTailorExperiences;
    property User: IUser read get_User;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.UserProfile.IDiagnosticsSettings
  // Used Types:  Windows.System.IUser
  }
  // Windows.System.UserProfile.IDiagnosticsSettingsStatics
  [WinRTClassNameAttribute(SUserProfile_DiagnosticsSettings)]
  UserProfile_IDiagnosticsSettingsStatics = interface(IInspectable)
  ['{72D2E80F-5390-4793-990B-3CCC7D6AC9C8}']
    function GetDefault: UserProfile_IDiagnosticsSettings; safecall;
    function GetForUser(user: IUser): UserProfile_IDiagnosticsSettings; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt64
  }
  // Windows.System.IAppMemoryReport
  IAppMemoryReport = interface(IInspectable)
  ['{6D65339B-4D6F-45BC-9C5E-E49B3FF2758D}']
    function get_PrivateCommitUsage: UInt64; safecall;
    function get_PeakPrivateCommitUsage: UInt64; safecall;
    function get_TotalCommitUsage: UInt64; safecall;
    function get_TotalCommitLimit: UInt64; safecall;
    property PeakPrivateCommitUsage: UInt64 read get_PeakPrivateCommitUsage;
    property PrivateCommitUsage: UInt64 read get_PrivateCommitUsage;
    property TotalCommitLimit: UInt64 read get_TotalCommitLimit;
    property TotalCommitUsage: UInt64 read get_TotalCommitUsage;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt64
  }
  // Windows.System.IAppMemoryReport2
  IAppMemoryReport2 = interface(IInspectable)
  ['{5F7F3738-51B7-42DC-B7ED-79BA46D28857}']
    function get_ExpectedTotalCommitLimit: UInt64; safecall;
    property ExpectedTotalCommitLimit: UInt64 read get_ExpectedTotalCommitLimit;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt64
  }
  // Windows.System.IProcessMemoryReport
  IProcessMemoryReport = interface(IInspectable)
  ['{087305A8-9B70-4782-8741-3A982B6CE5E4}']
    function get_PrivateWorkingSetUsage: UInt64; safecall;
    function get_TotalWorkingSetUsage: UInt64; safecall;
    property PrivateWorkingSetUsage: UInt64 read get_PrivateWorkingSetUsage;
    property TotalWorkingSetUsage: UInt64 read get_TotalWorkingSetUsage;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt64
  }
  // Windows.System.IAppMemoryUsageLimitChangingEventArgs
  IAppMemoryUsageLimitChangingEventArgs = interface(IInspectable)
  ['{79F86664-FECA-4DA5-9E40-2BC63EFDC979}']
    function get_OldLimit: UInt64; safecall;
    function get_NewLimit: UInt64; safecall;
    property NewLimit: UInt64 read get_NewLimit;
    property OldLimit: UInt64 read get_OldLimit;
  end;

  // Generic Delegate for 
  // Windows.Foundation.EventHandler`1<Windows.System.IAppMemoryUsageLimitChangingEventArgs>
  EventHandler_1__IAppMemoryUsageLimitChangingEventArgs_Delegate_Base = interface(IUnknown)
  ['{6030E7C3-F93F-5E9C-9BA2-9A018D2B09C0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Object
  // Used Types:  Windows.System.IAppMemoryUsageLimitChangingEventArgs
  }
  // Windows.Foundation.EventHandler`1<Windows.System.IAppMemoryUsageLimitChangingEventArgs>
  EventHandler_1__IAppMemoryUsageLimitChangingEventArgs = interface(EventHandler_1__IAppMemoryUsageLimitChangingEventArgs_Delegate_Base)
  ['{12BD3887-6A66-56D5-9565-5E66B00BD683}']
    procedure Invoke(sender: IInspectable; args: IAppMemoryUsageLimitChangingEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  UInt64
  // Used Types:  Boolean
  // Used Types:  Int64
  // Used Types:  Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTracePriority
  }
  // Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
  [WinRTClassNameAttribute(SDiagnostics_TraceReporting_PlatformDiagnosticTraceInfo)]
  Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface(IInspectable)
  ['{F870ED97-D597-4BF7-88DC-CF5C7DC2A1D2}']
    function get_ScenarioId: TGuid; safecall;
    function get_ProfileHash: UInt64; safecall;
    function get_IsExclusive: Boolean; safecall;
    function get_IsAutoLogger: Boolean; safecall;
    function get_MaxTraceDurationFileTime: Int64; safecall;
    function get_Priority: Diagnostics_TraceReporting_PlatformDiagnosticTracePriority; safecall;
    property IsAutoLogger: Boolean read get_IsAutoLogger;
    property IsExclusive: Boolean read get_IsExclusive;
    property MaxTraceDurationFileTime: Int64 read get_MaxTraceDurationFileTime;
    property Priority: Diagnostics_TraceReporting_PlatformDiagnosticTracePriority read get_Priority;
    property ProfileHash: UInt64 read get_ProfileHash;
    property ScenarioId: TGuid read get_ScenarioId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int64
  }
  // Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo
  [WinRTClassNameAttribute(SDiagnostics_TraceReporting_PlatformDiagnosticTraceRuntimeInfo)]
  Diagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo = interface(IInspectable)
  ['{3D4D5E2D-01D8-4768-8554-1EB1CA610986}']
    function get_RuntimeFileTime: Int64; safecall;
    function get_EtwRuntimeFileTime: Int64; safecall;
    property EtwRuntimeFileTime: Int64 read get_EtwRuntimeFileTime;
    property RuntimeFileTime: Int64 read get_RuntimeFileTime;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Guid>
  IIterable_1__TGuid_Base = interface(IInspectable)
  ['{F4CA3045-5DD7-54BE-982E-D88D8CA0876E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Guid>
  }
  // Windows.Foundation.Collections.IIterable`1<Guid>
  IIterable_1__TGuid = interface(IIterable_1__TGuid_Base)
  ['{F4CA3045-5DD7-54BE-982E-D88D8CA0876E}']
    function First: IIterator_1__TGuid; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo_Base = interface(IInspectable)
  ['{1AF4598D-98BB-5E51-842B-CF691925B6C2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface(IIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo_Base)
  ['{7562E3E2-C8A6-51DD-BD63-8B2C09552F81}']
    function get_Current: Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDiagnostics_TraceReporting_IPlatformDiagnosticTraceInfo): Cardinal; safecall;
    property Current: Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IIterable_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo_Base = interface(IInspectable)
  ['{ECB0C107-C97B-52FE-A5E6-A33E93493769}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IIterable_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface(IIterable_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo_Base)
  ['{7DFED320-640F-5C13-8250-0BAA9D96750C}']
    function First: IIterator_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  IVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo = interface(IInspectable)
  ['{23E1B446-6D86-59EA-BEF4-56662F7A131C}']
    function GetAt(index: Cardinal): Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDiagnostics_TraceReporting_IPlatformDiagnosticTraceInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Guid
  // Used Types:  Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEscalationType
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  // Used Types:  Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActionState
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Guid>
  // Used Types:  Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticEventBufferLatencies
  // Used Types:  Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotState
  // Used Types:  Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceSlotType
  // Used Types:  UInt64
  // Used Types:  Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo>
  }
  // Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticActionsStatics
  [WinRTClassNameAttribute(SDiagnostics_TraceReporting_PlatformDiagnosticActions)]
  Diagnostics_TraceReporting_IPlatformDiagnosticActionsStatics = interface(IInspectable)
  ['{C1145CFA-9292-4267-890A-9EA3ED072312}']
    function IsScenarioEnabled(scenarioId: TGuid): Boolean; safecall;
    function TryEscalateScenario(scenarioId: TGuid; escalationType: Diagnostics_TraceReporting_PlatformDiagnosticEscalationType; outputDirectory: HSTRING; timestampOutputDirectory: Boolean; forceEscalationUpload: Boolean; triggers: IMapView_2__HSTRING__HSTRING): Boolean; safecall;
    function DownloadLatestSettingsForNamespace(partner: HSTRING; feature: HSTRING; isScenarioNamespace: Boolean; downloadOverCostedNetwork: Boolean; downloadOverBattery: Boolean): Diagnostics_TraceReporting_PlatformDiagnosticActionState; safecall;
    function GetActiveScenarioList: IVectorView_1__TGuid; safecall;
    function ForceUpload(latency: Diagnostics_TraceReporting_PlatformDiagnosticEventBufferLatencies; uploadOverCostedNetwork: Boolean; uploadOverBattery: Boolean): Diagnostics_TraceReporting_PlatformDiagnosticActionState; safecall;
    function IsTraceRunning(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType; scenarioId: TGuid; traceProfileHash: UInt64): Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotState; safecall;
    function GetActiveTraceRuntime(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType): Diagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo; safecall;
    function GetKnownTraceList(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType): IVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
  [WinRTClassNameAttribute(SDiagnostics_Telemetry_PlatformTelemetryRegistrationSettings)]
  Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings = interface(IInspectable)
  ['{819A8582-CA19-415E-BB79-9C224BFA3A73}']
    function get_StorageSize: Cardinal; safecall;
    procedure put_StorageSize(value: Cardinal); safecall;
    function get_UploadQuotaSize: Cardinal; safecall;
    procedure put_UploadQuotaSize(value: Cardinal); safecall;
    property StorageSize: Cardinal read get_StorageSize write put_StorageSize;
    property UploadQuotaSize: Cardinal read get_UploadQuotaSize write put_UploadQuotaSize;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationStatus
  }
  // Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult
  [WinRTClassNameAttribute(SDiagnostics_Telemetry_PlatformTelemetryRegistrationResult)]
  Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult = interface(IInspectable)
  ['{4D8518AB-2292-49BD-A15A-3D71D2145112}']
    function get_Status: Diagnostics_Telemetry_PlatformTelemetryRegistrationStatus; safecall;
    property Status: Diagnostics_Telemetry_PlatformTelemetryRegistrationStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult
  // Used Types:  String
  // Used Types:  Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
  }
  // Windows.System.Diagnostics.Telemetry.IPlatformTelemetryClientStatics
  [WinRTClassNameAttribute(SDiagnostics_Telemetry_PlatformTelemetryClient)]
  Diagnostics_Telemetry_IPlatformTelemetryClientStatics = interface(IInspectable)
  ['{9BF3F25D-D5C3-4EEA-8DBE-9C8DBB0D9D8F}']
    function Register(id: HSTRING): Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult; overload; safecall;
    function Register(id: HSTRING; settings: Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings): Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult; overload; safecall;
  end;

  // UsedAPI Interface
  {
  }
  // Windows.System.RemoteSystems.IRemoteSystemFilter
  RemoteSystems_IRemoteSystemFilter = interface(IInspectable)
  ['{4A3BA9E4-99EB-45EB-BA16-0367728FF374}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystem>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem_Delegate_Base = interface(IUnknown)
  ['{3A0B522D-98D0-5D34-ACE6-2C7346613F1D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystem>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystem>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem = interface(AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem_Delegate_Base)
  ['{C7AD9F11-8299-58C1-A4C5-8DDA4DCD7C4D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__RemoteSystems_IRemoteSystem; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystem>
  IAsyncOperation_1__RemoteSystems_IRemoteSystem_Base = interface(IInspectable)
  ['{0D39F546-0ECA-5236-A5CA-7E3660658462}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystem>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystem
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystem>
  IAsyncOperation_1__RemoteSystems_IRemoteSystem = interface(IAsyncOperation_1__RemoteSystems_IRemoteSystem_Base)
  ['{362CDF3D-FCE5-5BD7-AD39-508002EF07B1}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem; safecall;
    function GetResults: RemoteSystems_IRemoteSystem; safecall;
    property Completed: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystem read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystem
  }
  // Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs
  RemoteSystems_IRemoteSystemAddedEventArgs = interface(IInspectable)
  ['{8F39560F-E534-4697-8836-7ABEA151516E}']
    function get_RemoteSystem: RemoteSystems_IRemoteSystem; safecall;
    property RemoteSystem: RemoteSystems_IRemoteSystem read get_RemoteSystem;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A9B98F4A-B63D-5D07-92BB-E2ACB39455D1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs_Delegate_Base)
  ['{72DA44DC-F0EA-5F1A-96C3-DAF4BE2C1E41}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemWatcher; args: RemoteSystems_IRemoteSystemAddedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystem
  }
  // Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs
  RemoteSystems_IRemoteSystemUpdatedEventArgs = interface(IInspectable)
  ['{7502FF0E-DBCB-4155-B4CA-B30A04F27627}']
    function get_RemoteSystem: RemoteSystems_IRemoteSystem; safecall;
    property RemoteSystem: RemoteSystems_IRemoteSystem read get_RemoteSystem;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{88F9D23F-8946-5A1E-8DA1-82C66982A6D2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs_Delegate_Base)
  ['{2B52C566-64E8-53FC-AB07-63625590A415}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemWatcher; args: RemoteSystems_IRemoteSystemUpdatedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs
  RemoteSystems_IRemoteSystemRemovedEventArgs = interface(IInspectable)
  ['{8B3D16BB-7306-49EA-B7DF-67D5714CB013}']
    function get_RemoteSystemId: HSTRING; safecall;
    property RemoteSystemId: HSTRING read get_RemoteSystemId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C290FB5A-3ED0-5858-AF19-F85553CB96B8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs_Delegate_Base)
  ['{C61924BF-05D0-5750-8BDA-4447DF035B81}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemWatcher; args: RemoteSystems_IRemoteSystemRemovedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemUpdatedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemWatcher,Windows.System.RemoteSystems.IRemoteSystemRemovedEventArgs>
  }
  // Windows.System.RemoteSystems.IRemoteSystemWatcher
  RemoteSystems_IRemoteSystemWatcher = interface(IInspectable)
  ['{5D600C7E-2C07-48C5-889C-455D2B099771}']
    procedure Start; safecall;
    procedure Stop; safecall;
    function add_RemoteSystemAdded(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RemoteSystemAdded(token: EventRegistrationToken); safecall;
    function add_RemoteSystemUpdated(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemUpdatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RemoteSystemUpdated(token: EventRegistrationToken); safecall;
    function add_RemoteSystemRemoved(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemWatcher__RemoteSystems_IRemoteSystemRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RemoteSystemRemoved(token: EventRegistrationToken); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  IIterator_1__RemoteSystems_IRemoteSystemFilter_Base = interface(IInspectable)
  ['{6A2C5AEF-9F30-58AE-A6CB-9AC9C8092A41}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemFilter
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  IIterator_1__RemoteSystems_IRemoteSystemFilter = interface(IIterator_1__RemoteSystems_IRemoteSystemFilter_Base)
  ['{6A2C5AEF-9F30-58AE-A6CB-9AC9C8092A41}']
    function get_Current: RemoteSystems_IRemoteSystemFilter; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PRemoteSystems_IRemoteSystemFilter): Cardinal; safecall;
    property Current: RemoteSystems_IRemoteSystemFilter read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  IIterable_1__RemoteSystems_IRemoteSystemFilter_Base = interface(IInspectable)
  ['{13966C92-A8DE-50C0-B16B-00C2C48F5F37}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemFilter>
  IIterable_1__RemoteSystems_IRemoteSystemFilter = interface(IIterable_1__RemoteSystems_IRemoteSystemFilter_Base)
  ['{13966C92-A8DE-50C0-B16B-00C2C48F5F37}']
    function First: IIterator_1__RemoteSystems_IRemoteSystemFilter; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus_Delegate_Base = interface(IUnknown)
  ['{543A221D-EF39-57F5-9741-B052DBC29249}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus = interface(AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  IAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus_Base = interface(IInspectable)
  ['{D76DA678-DD76-5460-8745-915B4410C905}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemAccessStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.RemoteSystemAccessStatus>
  IAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus = interface(IAsyncOperation_1__RemoteSystems_RemoteSystemAccessStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus; safecall;
    function GetResults: RemoteSystems_RemoteSystemAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__RemoteSystems_RemoteSystemAccessStatus read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  String
  }
  // Windows.System.RemoteSystems.IRemoteSystem2
  RemoteSystems_IRemoteSystem2 = interface(IInspectable)
  ['{09DFE4EC-FB8B-4A08-A758-6876435D769E}']
    function get_IsAvailableBySpatialProximity: Boolean; safecall;
    function GetCapabilitySupportedAsync(capabilityName: HSTRING): IAsyncOperation_1__Boolean; safecall;
    property IsAvailableBySpatialProximity: Boolean read get_IsAvailableBySpatialProximity;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.System.RemoteSystems.IRemoteSystem3
  RemoteSystems_IRemoteSystem3 = interface(IInspectable)
  ['{72B4B495-B7C6-40BE-831B-73562F12FFA8}']
    function get_ManufacturerDisplayName: HSTRING; safecall;
    function get_ModelDisplayName: HSTRING; safecall;
    property ManufacturerDisplayName: HSTRING read get_ManufacturerDisplayName;
    property ModelDisplayName: HSTRING read get_ModelDisplayName;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemAuthorizationKind
  }
  // Windows.System.RemoteSystems.IRemoteSystemAuthorizationKindFilter
  RemoteSystems_IRemoteSystemAuthorizationKindFilter = interface(IInspectable)
  ['{6B0DDE8E-04D0-40F4-A27F-C2ACBBD6B734}']
    function get_RemoteSystemAuthorizationKind: RemoteSystems_RemoteSystemAuthorizationKind; safecall;
    property RemoteSystemAuthorizationKind: RemoteSystems_RemoteSystemAuthorizationKind read get_RemoteSystemAuthorizationKind;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.System.RemoteSystems.IRemoteSystemKindFilter
  RemoteSystems_IRemoteSystemKindFilter = interface(IInspectable)
  ['{38E1C9EC-22C3-4EF6-901A-BBB1C7AAD4ED}']
    function get_RemoteSystemKinds: IVectorView_1__HSTRING; safecall;
    property RemoteSystemKinds: IVectorView_1__HSTRING read get_RemoteSystemKinds;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemDiscoveryType
  }
  // Windows.System.RemoteSystems.IRemoteSystemDiscoveryTypeFilter
  RemoteSystems_IRemoteSystemDiscoveryTypeFilter = interface(IInspectable)
  ['{42D9041F-EE5A-43DA-AC6A-6FEE25460741}']
    function get_RemoteSystemDiscoveryType: RemoteSystems_RemoteSystemDiscoveryType; safecall;
    property RemoteSystemDiscoveryType: RemoteSystems_RemoteSystemDiscoveryType read get_RemoteSystemDiscoveryType;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemStatusType
  }
  // Windows.System.RemoteSystems.IRemoteSystemStatusTypeFilter
  RemoteSystems_IRemoteSystemStatusTypeFilter = interface(IInspectable)
  ['{0C39514E-CBB6-4777-8534-2E0C521AFFA2}']
    function get_RemoteSystemStatusType: RemoteSystems_RemoteSystemStatusType; safecall;
    property RemoteSystemStatusType: RemoteSystems_RemoteSystemStatusType read get_RemoteSystemStatusType;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Object>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{D4CF5BDA-CC7A-52EF-A256-C4B36163BEEC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionParticipantWatcher,Object>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionParticipantWatcher__IInspectable_Delegate_Base)
  ['{EE7948C0-7384-5E23-A792-9EDC68234AED}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionParticipantWatcher; args: IInspectable); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemSessionJoinStatus
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSession
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult
  RemoteSystems_IRemoteSystemSessionJoinResult = interface(IInspectable)
  ['{CE7B1F04-A03E-41A4-900B-1E79328C1267}']
    function get_Status: RemoteSystems_RemoteSystemSessionJoinStatus; safecall;
    function get_Session: RemoteSystems_IRemoteSystemSession; safecall;
    property Session: RemoteSystems_IRemoteSystemSession read get_Session;
    property Status: RemoteSystems_RemoteSystemSessionJoinStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult_Delegate_Base = interface(IUnknown)
  ['{379ADF35-4CB4-522F-91BE-913B5690568F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult = interface(AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult_Delegate_Base)
  ['{21900619-F845-51E1-B2CA-F5C02F69F8AC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult_Base = interface(IInspectable)
  ['{C58DBD1E-E300-55A8-ADA5-E25AAAA86667}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult = interface(IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult_Base)
  ['{F09147BC-C4F3-5DC2-8838-008E7F5F612C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult; safecall;
    function GetResults: RemoteSystems_IRemoteSystemSessionJoinResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionJoinResult read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionJoinResult>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionInfo
  RemoteSystems_IRemoteSystemSessionInfo = interface(IInspectable)
  ['{FF4DF648-8B0A-4E9A-9905-69E4B841C588}']
    function get_DisplayName: HSTRING; safecall;
    function get_ControllerDisplayName: HSTRING; safecall;
    function JoinAsync: IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionJoinResult; safecall;
    property ControllerDisplayName: HSTRING read get_ControllerDisplayName;
    property DisplayName: HSTRING read get_DisplayName;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInfo
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs
  RemoteSystems_IRemoteSystemSessionAddedEventArgs = interface(IInspectable)
  ['{D585D754-BC97-4C39-99B4-BECA76E04C3F}']
    function get_SessionInfo: RemoteSystems_IRemoteSystemSessionInfo; safecall;
    property SessionInfo: RemoteSystems_IRemoteSystemSessionInfo read get_SessionInfo;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInfo
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs
  RemoteSystems_IRemoteSystemSessionUpdatedEventArgs = interface(IInspectable)
  ['{16875069-231E-4C91-8EC8-B3A39D9E55A3}']
    function get_SessionInfo: RemoteSystems_IRemoteSystemSessionInfo; safecall;
    property SessionInfo: RemoteSystems_IRemoteSystemSessionInfo read get_SessionInfo;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInfo
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs
  RemoteSystems_IRemoteSystemSessionRemovedEventArgs = interface(IInspectable)
  ['{AF82914E-39A1-4DEA-9D63-43798D5BBBD0}']
    function get_SessionInfo: RemoteSystems_IRemoteSystemSessionInfo; safecall;
    property SessionInfo: RemoteSystems_IRemoteSystemSessionInfo read get_SessionInfo;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1B036C4F-6B8F-55D6-B6DF-45E46A823B1D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs_Delegate_Base)
  ['{F0EC5210-7411-5E32-BEC2-E232D23DB4D8}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionWatcher; args: RemoteSystems_IRemoteSystemSessionAddedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs_Delegate_Base = interface(IUnknown)
  ['{040F48B7-0D41-5AA2-85E8-6311666F0324}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs_Delegate_Base)
  ['{B8B0C3CD-2DEF-5E52-96BB-404410E617D3}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionWatcher; args: RemoteSystems_IRemoteSystemSessionUpdatedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1CBC54F0-0C9D-59CC-8055-5E017A317812}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs_Delegate_Base)
  ['{221C1F5B-1C80-589C-82F3-96397A421EF2}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionWatcher; args: RemoteSystems_IRemoteSystemSessionRemovedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemSessionWatcherStatus
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionUpdatedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionWatcher,Windows.System.RemoteSystems.IRemoteSystemSessionRemovedEventArgs>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionWatcher
  RemoteSystems_IRemoteSystemSessionWatcher = interface(IInspectable)
  ['{8003E340-0C41-4A62-B6D7-BDBE2B19BE2D}']
    procedure Start; safecall;
    procedure Stop; safecall;
    function get_Status: RemoteSystems_RemoteSystemSessionWatcherStatus; safecall;
    function add_Added(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Updated(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionUpdatedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Updated(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionWatcher__RemoteSystems_IRemoteSystemSessionRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    property Status: RemoteSystems_RemoteSystemSessionWatcherStatus read get_Status;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystem
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInfo
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionInvitation
  RemoteSystems_IRemoteSystemSessionInvitation = interface(IInspectable)
  ['{3E32CC91-51D7-4766-A121-25516C3B8294}']
    function get_Sender: RemoteSystems_IRemoteSystem; safecall;
    function get_SessionInfo: RemoteSystems_IRemoteSystemSessionInfo; safecall;
    property Sender: RemoteSystems_IRemoteSystem read get_Sender;
    property SessionInfo: RemoteSystems_IRemoteSystemSessionInfo read get_SessionInfo;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInvitation
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs
  RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs = interface(IInspectable)
  ['{5E964A2D-A10D-4EDB-8DEA-54D20AC19543}']
    function get_Invitation: RemoteSystems_IRemoteSystemSessionInvitation; safecall;
    property Invitation: RemoteSystems_IRemoteSystemSessionInvitation read get_Invitation;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener,Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{18A242BB-D338-56C4-9559-568D5C2C3E93}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener,Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs_Delegate_Base)
  ['{3BA42A79-4ED0-55BE-9A6B-864E4D80A359}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionInvitationListener; args: RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener,Windows.System.RemoteSystems.IRemoteSystemSessionInvitationReceivedEventArgs>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionInvitationListener
  RemoteSystems_IRemoteSystemSessionInvitationListener = interface(IInspectable)
  ['{08F4003F-BC71-49E1-874A-31DDFF9A27B9}']
    function add_InvitationReceived(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionInvitationListener__RemoteSystems_IRemoteSystemSessionInvitationReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_InvitationReceived(token: EventRegistrationToken); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequest
  RemoteSystems_IRemoteSystemSessionJoinRequest = interface(IInspectable)
  ['{20600068-7994-4331-86D1-D89D882585EE}']
    function get_Participant: RemoteSystems_IRemoteSystemSessionParticipant; safecall;
    procedure Accept; safecall;
    property Participant: RemoteSystems_IRemoteSystemSessionParticipant read get_Participant;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequest
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs
  RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs = interface(IInspectable)
  ['{DBCA4FC3-82B9-4816-9C24-E40E61774BD8}']
    function get_JoinRequest: RemoteSystems_IRemoteSystemSessionJoinRequest; safecall;
    function GetDeferral: IDeferral; safecall;
    property JoinRequest: RemoteSystems_IRemoteSystemSessionJoinRequest read get_JoinRequest;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.RemoteSystemSessionCreationStatus
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSession
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult
  RemoteSystems_IRemoteSystemSessionCreationResult = interface(IInspectable)
  ['{A79812C2-37DE-448C-8B83-A30AA3C4EAD6}']
    function get_Status: RemoteSystems_RemoteSystemSessionCreationStatus; safecall;
    function get_Session: RemoteSystems_IRemoteSystemSession; safecall;
    property Session: RemoteSystems_IRemoteSystemSession read get_Session;
    property Status: RemoteSystems_RemoteSystemSessionCreationStatus read get_Status;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionOptions
  RemoteSystems_IRemoteSystemSessionOptions = interface(IInspectable)
  ['{740ED755-8418-4F01-9353-E21C9ECC6CFC}']
    function get_IsInviteOnly: Boolean; safecall;
    procedure put_IsInviteOnly(value: Boolean); safecall;
    property IsInviteOnly: Boolean read get_IsInviteOnly write put_IsInviteOnly;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionController,Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D8E04916-B452-5322-AEC9-E3D4D581C772}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionController
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionController,Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs_Delegate_Base)
  ['{BAF77AF6-343C-5702-8706-BBBFEAF12675}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionController; args: RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult_Delegate_Base = interface(IUnknown)
  ['{6E72C549-73AA-5168-8560-C7236493B504}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult = interface(AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult_Delegate_Base)
  ['{3DFE2F14-E59E-5D1B-924C-64423E4742DE}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult_Base = interface(IInspectable)
  ['{90364BF5-D084-5F50-9729-82025326ABEF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult = interface(IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult_Base)
  ['{1742DD31-0963-5C4D-9E37-B6EE48A2D2AF}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult; safecall;
    function GetResults: RemoteSystems_IRemoteSystemSessionCreationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__RemoteSystems_IRemoteSystemSessionCreationResult read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionController,Windows.System.RemoteSystems.IRemoteSystemSessionJoinRequestedEventArgs>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteSystems.IRemoteSystemSessionCreationResult>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionController
  RemoteSystems_IRemoteSystemSessionController = interface(IInspectable)
  ['{E48B2DD2-6820-4867-B425-D89C0A3EF7BA}']
    function add_JoinRequested(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionController__RemoteSystems_IRemoteSystemSessionJoinRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_JoinRequested(token: EventRegistrationToken); safecall;
    function RemoveParticipantAsync(pParticipant: RemoteSystems_IRemoteSystemSessionParticipant): IAsyncOperation_1__Boolean; safecall;
    function CreateSessionAsync: IAsyncOperation_1__RemoteSystems_IRemoteSystemSessionCreationResult; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs
  RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs = interface(IInspectable)
  ['{06F31785-2DA5-4E58-A78F-9E8D0784EE25}']
    function get_Sender: RemoteSystems_IRemoteSystemSessionParticipant; safecall;
    function get_Message: IPropertySet; safecall;
    property Message: IPropertySet read get_Message;
    property Sender: RemoteSystems_IRemoteSystemSessionParticipant read get_Sender;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  IIterator_1__RemoteSystems_IRemoteSystemSessionParticipant_Base = interface(IInspectable)
  ['{05FEC44B-3DD9-5CF1-A100-BEDC9233292D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  IIterator_1__RemoteSystems_IRemoteSystemSessionParticipant = interface(IIterator_1__RemoteSystems_IRemoteSystemSessionParticipant_Base)
  ['{707ECFB6-6C93-5E70-8DDD-13F82E7A5271}']
    function get_Current: RemoteSystems_IRemoteSystemSessionParticipant; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PRemoteSystems_IRemoteSystemSessionParticipant): Cardinal; safecall;
    property Current: RemoteSystems_IRemoteSystemSessionParticipant read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  IIterable_1__RemoteSystems_IRemoteSystemSessionParticipant_Base = interface(IInspectable)
  ['{00189D10-16EC-5D1A-8369-4870C69E52B3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  IIterable_1__RemoteSystems_IRemoteSystemSessionParticipant = interface(IIterable_1__RemoteSystems_IRemoteSystemSessionParticipant_Base)
  ['{0A9C2978-E826-5FE2-92BA-1CF75BDBFA08}']
    function First: IIterator_1__RemoteSystems_IRemoteSystemSessionParticipant; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel,Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C476232D-8C76-5BA6-99F5-14557484C20D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel,Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs>
  TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs = interface(TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs_Delegate_Base)
  ['{988ADC1B-9F30-593E-AA1A-6C99958853C3}']
    procedure Invoke(sender: RemoteSystems_IRemoteSystemSessionMessageChannel; args: RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSession
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.System.RemoteSystems.IRemoteSystemSessionParticipant
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.System.RemoteSystems.IRemoteSystemSessionParticipant>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel,Windows.System.RemoteSystems.IRemoteSystemSessionValueSetReceivedEventArgs>
  }
  // Windows.System.RemoteSystems.IRemoteSystemSessionMessageChannel
  RemoteSystems_IRemoteSystemSessionMessageChannel = interface(IInspectable)
  ['{9524D12A-73D9-4C10-B751-C26784437127}']
    function get_Session: RemoteSystems_IRemoteSystemSession; safecall;
    function BroadcastValueSetAsync(messageData: IPropertySet): IAsyncOperation_1__Boolean; safecall;
    function SendValueSetAsync(messageData: IPropertySet; participant: RemoteSystems_IRemoteSystemSessionParticipant): IAsyncOperation_1__Boolean; safecall;
    function SendValueSetToParticipantsAsync(messageData: IPropertySet; participants: IIterable_1__RemoteSystems_IRemoteSystemSessionParticipant): IAsyncOperation_1__Boolean; safecall;
    function add_ValueSetReceived(handler: TypedEventHandler_2__RemoteSystems_IRemoteSystemSessionMessageChannel__RemoteSystems_IRemoteSystemSessionValueSetReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ValueSetReceived(token: EventRegistrationToken); safecall;
    property Session: RemoteSystems_IRemoteSystemSession read get_Session;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.System.Threading.IThreadPoolTimer
  Threading_IThreadPoolTimer = interface(IInspectable)
  ['{594EBE78-55EA-4A88-A50D-3402AE1F9CF2}']
    function get_Period: TimeSpan; safecall;
    function get_Delay: TimeSpan; safecall;
    procedure Cancel; safecall;
    property Delay: TimeSpan read get_Delay;
    property Period: TimeSpan read get_Period;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Threading.IThreadPoolTimer
  }
  // Windows.System.Threading.TimerElapsedHandler
  Threading_TimerElapsedHandler = interface(IUnknown)
  ['{FAAEA667-FBEB-49CB-ADB2-71184C556E43}']
    procedure Invoke(timer: Threading_IThreadPoolTimer); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Threading.IThreadPoolTimer
  }
  // Windows.System.Threading.TimerDestroyedHandler
  Threading_TimerDestroyedHandler = interface(IUnknown)
  ['{34ED19FA-8384-4EB9-8209-FB5094EEEC35}']
    procedure Invoke(timer: Threading_IThreadPoolTimer); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.System.Threading.WorkItemHandler
  Threading_WorkItemHandler = interface(IUnknown)
  ['{1D1A8B8B-FA66-414F-9CBD-B65FC99D17FA}']
    procedure Invoke(operation: IAsyncAction); safecall;
  end;

  // UsedAPI Interface
  {
  }
  // Windows.System.Threading.Core.ISignalNotifier
  Threading_Core_ISignalNotifier = interface(IInspectable)
  ['{14285E06-63A7-4713-B6D9-62F64B56FB8B}']
    procedure Enable; safecall;
    procedure Terminate; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Threading.Core.ISignalNotifier
  // Used Types:  Boolean
  }
  // Windows.System.Threading.Core.SignalHandler
  Threading_Core_SignalHandler = interface(IUnknown)
  ['{923C402E-4721-440E-9DDA-55B6F2E07710}']
    procedure Invoke(signalNotifier: Threading_Core_ISignalNotifier; timedOut: Boolean); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.System.Threading.Core.IPreallocatedWorkItem
  Threading_Core_IPreallocatedWorkItem = interface(IInspectable)
  ['{B6DAA9FC-BC5B-401A-A8B2-6E754D14DAA6}']
    function RunAsync: IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.System.UserProfile.IUserProfilePersonalizationSettings
  [WinRTClassNameAttribute(SUserProfile_UserProfilePersonalizationSettings)]
  UserProfile_IUserProfilePersonalizationSettings = interface(IInspectable)
  ['{8CEDDAB4-7998-46D5-8DD3-184F1C5F9AB9}']
    function TrySetLockScreenImageAsync(imageFile: IStorageFile): IAsyncOperation_1__Boolean; safecall;
    function TrySetWallpaperImageAsync(imageFile: IStorageFile): IAsyncOperation_1__Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.UserProfile.IUserProfilePersonalizationSettings
  // Used Types:  Boolean
  }
  // Windows.System.UserProfile.IUserProfilePersonalizationSettingsStatics
  [WinRTClassNameAttribute(SUserProfile_UserProfilePersonalizationSettings)]
  UserProfile_IUserProfilePersonalizationSettingsStatics = interface(IInspectable)
  ['{91ACB841-5037-454B-9883-BB772D08DD16}']
    function get_Current: UserProfile_IUserProfilePersonalizationSettings; safecall;
    function IsSupported: Boolean; safecall;
    property Current: UserProfile_IUserProfilePersonalizationSettings read get_Current;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int64
  }
  // Windows.System.Diagnostics.IProcessDiskUsageReport
  [WinRTClassNameAttribute(SDiagnostics_ProcessDiskUsageReport)]
  Diagnostics_IProcessDiskUsageReport = interface(IInspectable)
  ['{401627FD-535D-4C1F-81B8-DA54E1BE635E}']
    function get_ReadOperationCount: Int64; safecall;
    function get_WriteOperationCount: Int64; safecall;
    function get_OtherOperationCount: Int64; safecall;
    function get_BytesReadCount: Int64; safecall;
    function get_BytesWrittenCount: Int64; safecall;
    function get_OtherBytesCount: Int64; safecall;
    property BytesReadCount: Int64 read get_BytesReadCount;
    property BytesWrittenCount: Int64 read get_BytesWrittenCount;
    property OtherBytesCount: Int64 read get_OtherBytesCount;
    property OtherOperationCount: Int64 read get_OtherOperationCount;
    property ReadOperationCount: Int64 read get_ReadOperationCount;
    property WriteOperationCount: Int64 read get_WriteOperationCount;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessDiskUsageReport
  }
  // Windows.System.Diagnostics.IProcessDiskUsage
  [WinRTClassNameAttribute(SDiagnostics_ProcessDiskUsage)]
  Diagnostics_IProcessDiskUsage = interface(IInspectable)
  ['{5AD78BFD-7E51-4E53-BFAA-5A6EE1AABBF8}']
    function GetReport: Diagnostics_IProcessDiskUsageReport; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt64
  // Used Types:  UInt32
  }
  // Windows.System.Diagnostics.IProcessMemoryUsageReport
  [WinRTClassNameAttribute(SDiagnostics_ProcessMemoryUsageReport)]
  Diagnostics_IProcessMemoryUsageReport = interface(IInspectable)
  ['{C2C77CBA-1951-4685-8532-7E749ECF8EEB}']
    function get_NonPagedPoolSizeInBytes: UInt64; safecall;
    function get_PageFaultCount: Cardinal; safecall;
    function get_PageFileSizeInBytes: UInt64; safecall;
    function get_PagedPoolSizeInBytes: UInt64; safecall;
    function get_PeakNonPagedPoolSizeInBytes: UInt64; safecall;
    function get_PeakPageFileSizeInBytes: UInt64; safecall;
    function get_PeakPagedPoolSizeInBytes: UInt64; safecall;
    function get_PeakVirtualMemorySizeInBytes: UInt64; safecall;
    function get_PeakWorkingSetSizeInBytes: UInt64; safecall;
    function get_PrivatePageCount: UInt64; safecall;
    function get_VirtualMemorySizeInBytes: UInt64; safecall;
    function get_WorkingSetSizeInBytes: UInt64; safecall;
    property NonPagedPoolSizeInBytes: UInt64 read get_NonPagedPoolSizeInBytes;
    property PageFaultCount: Cardinal read get_PageFaultCount;
    property PageFileSizeInBytes: UInt64 read get_PageFileSizeInBytes;
    property PagedPoolSizeInBytes: UInt64 read get_PagedPoolSizeInBytes;
    property PeakNonPagedPoolSizeInBytes: UInt64 read get_PeakNonPagedPoolSizeInBytes;
    property PeakPageFileSizeInBytes: UInt64 read get_PeakPageFileSizeInBytes;
    property PeakPagedPoolSizeInBytes: UInt64 read get_PeakPagedPoolSizeInBytes;
    property PeakVirtualMemorySizeInBytes: UInt64 read get_PeakVirtualMemorySizeInBytes;
    property PeakWorkingSetSizeInBytes: UInt64 read get_PeakWorkingSetSizeInBytes;
    property PrivatePageCount: UInt64 read get_PrivatePageCount;
    property VirtualMemorySizeInBytes: UInt64 read get_VirtualMemorySizeInBytes;
    property WorkingSetSizeInBytes: UInt64 read get_WorkingSetSizeInBytes;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessMemoryUsageReport
  }
  // Windows.System.Diagnostics.IProcessMemoryUsage
  [WinRTClassNameAttribute(SDiagnostics_ProcessMemoryUsage)]
  Diagnostics_IProcessMemoryUsage = interface(IInspectable)
  ['{F50B229B-827C-42B7-B07C-0E32627E6B3E}']
    function GetReport: Diagnostics_IProcessMemoryUsageReport; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.System.Diagnostics.IProcessCpuUsageReport
  [WinRTClassNameAttribute(SDiagnostics_ProcessCpuUsageReport)]
  Diagnostics_IProcessCpuUsageReport = interface(IInspectable)
  ['{8A6D9CAC-3987-4E2F-A119-6B5FA214F1B4}']
    function get_KernelTime: TimeSpan; safecall;
    function get_UserTime: TimeSpan; safecall;
    property KernelTime: TimeSpan read get_KernelTime;
    property UserTime: TimeSpan read get_UserTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessCpuUsageReport
  }
  // Windows.System.Diagnostics.IProcessCpuUsage
  [WinRTClassNameAttribute(SDiagnostics_ProcessCpuUsage)]
  Diagnostics_IProcessCpuUsage = interface(IInspectable)
  ['{0BBB2472-C8BF-423A-A810-B559AE4354E2}']
    function GetReport: Diagnostics_IProcessCpuUsageReport; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  String
  // Used Types:  Windows.System.Diagnostics.IProcessDiagnosticInfo
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.System.Diagnostics.IProcessDiskUsage
  // Used Types:  Windows.System.Diagnostics.IProcessMemoryUsage
  // Used Types:  Windows.System.Diagnostics.IProcessCpuUsage
  }
  // Windows.System.Diagnostics.IProcessDiagnosticInfo
  [WinRTClassNameAttribute(SDiagnostics_ProcessDiagnosticInfo)]
  Diagnostics_IProcessDiagnosticInfo = interface(IInspectable)
  ['{E830B04B-300E-4EE6-A0AB-5B5F5231B434}']
    function get_ProcessId: Cardinal; safecall;
    function get_ExecutableFileName: HSTRING; safecall;
    function get_Parent: Diagnostics_IProcessDiagnosticInfo; safecall;
    function get_ProcessStartTime: DateTime; safecall;
    function get_DiskUsage: Diagnostics_IProcessDiskUsage; safecall;
    function get_MemoryUsage: Diagnostics_IProcessMemoryUsage; safecall;
    function get_CpuUsage: Diagnostics_IProcessCpuUsage; safecall;
    property CpuUsage: Diagnostics_IProcessCpuUsage read get_CpuUsage;
    property DiskUsage: Diagnostics_IProcessDiskUsage read get_DiskUsage;
    property ExecutableFileName: HSTRING read get_ExecutableFileName;
    property MemoryUsage: Diagnostics_IProcessMemoryUsage read get_MemoryUsage;
    property Parent: Diagnostics_IProcessDiagnosticInfo read get_Parent;
    property ProcessId: Cardinal read get_ProcessId;
    property ProcessStartTime: DateTime read get_ProcessStartTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.ApplicationModel.IAppInfo
  }
  // Windows.System.IAppDiagnosticInfo
  [WinRTClassNameAttribute(SAppDiagnosticInfo)]
  IAppDiagnosticInfo = interface(IInspectable)
  ['{E348A69A-8889-4CA3-BE07-D5FFFF5F0804}']
    function get_AppInfo: IAppInfo; safecall;
    property AppInfo: IAppInfo read get_AppInfo;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppDiagnosticInfo>
  IIterator_1__IAppDiagnosticInfo_Base = interface(IInspectable)
  ['{183F1E4A-2224-5FE4-B064-68869C53E361}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppDiagnosticInfo>
  IIterator_1__IAppDiagnosticInfo = interface(IIterator_1__IAppDiagnosticInfo_Base)
  ['{DF568DD5-94EA-58BE-B7D0-A548D9A07CBF}']
    function get_Current: IAppDiagnosticInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIAppDiagnosticInfo): Cardinal; safecall;
    property Current: IAppDiagnosticInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppDiagnosticInfo>
  IIterable_1__IAppDiagnosticInfo_Base = interface(IInspectable)
  ['{8118DE8F-3AE3-55E1-80A8-25453CDBA894}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.IAppDiagnosticInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppDiagnosticInfo>
  IIterable_1__IAppDiagnosticInfo = interface(IIterable_1__IAppDiagnosticInfo_Base)
  ['{C9F3E100-91FF-5C51-919A-78099F112FEB}']
    function First: IIterator_1__IAppDiagnosticInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppDiagnosticInfo>
  IVectorView_1__IAppDiagnosticInfo = interface(IInspectable)
  ['{111C345B-2F9D-5733-A270-3177DBFB6B20}']
    function GetAt(index: Cardinal): IAppDiagnosticInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IAppDiagnosticInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppDiagnosticInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfo
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppDiagnosticInfo>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>
  IVector_1__IAppDiagnosticInfo = interface(IInspectable)
  ['{9A0235E7-9D87-5D5D-8DF4-578F8AD4CEA6}']
    function GetAt(index: Cardinal): IAppDiagnosticInfo; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IAppDiagnosticInfo; safecall;
    function IndexOf(value: IAppDiagnosticInfo; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IAppDiagnosticInfo); safecall;
    procedure InsertAt(index: Cardinal; value: IAppDiagnosticInfo); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IAppDiagnosticInfo); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppDiagnosticInfo): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIAppDiagnosticInfo); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>
  // Used Types:  Boolean
  }
  // Windows.System.Diagnostics.IProcessDiagnosticInfo2
  Diagnostics_IProcessDiagnosticInfo2 = interface(IInspectable)
  ['{9558CB1A-3D0B-49EC-AB70-4F7A112805DE}']
    function GetAppDiagnosticInfos: IVector_1__IAppDiagnosticInfo; safecall;
    function get_IsPackaged: Boolean; safecall;
    property IsPackaged: Boolean read get_IsPackaged;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IIterator_1__Diagnostics_IProcessDiagnosticInfo_Base = interface(IInspectable)
  ['{A89B4418-4C3B-5F49-B957-785697C99ABF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessDiagnosticInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IIterator_1__Diagnostics_IProcessDiagnosticInfo = interface(IIterator_1__Diagnostics_IProcessDiagnosticInfo_Base)
  ['{E762FF68-C456-5132-8750-6EE48B937BD2}']
    function get_Current: Diagnostics_IProcessDiagnosticInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PDiagnostics_IProcessDiagnosticInfo): Cardinal; safecall;
    property Current: Diagnostics_IProcessDiagnosticInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IIterable_1__Diagnostics_IProcessDiagnosticInfo_Base = interface(IInspectable)
  ['{97B73627-B296-5076-B8CD-6BD8A240E966}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IIterable_1__Diagnostics_IProcessDiagnosticInfo = interface(IIterable_1__Diagnostics_IProcessDiagnosticInfo_Base)
  ['{957BC743-9FE0-5719-856A-BEFC3CDF91FC}']
    function First: IIterator_1__Diagnostics_IProcessDiagnosticInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessDiagnosticInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IVectorView_1__Diagnostics_IProcessDiagnosticInfo = interface(IInspectable)
  ['{BE0A1D23-95D6-50B7-B4B4-7BDAAB89D3C0}']
    function GetAt(index: Cardinal): Diagnostics_IProcessDiagnosticInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Diagnostics_IProcessDiagnosticInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDiagnostics_IProcessDiagnosticInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  // Used Types:  Windows.System.Diagnostics.IProcessDiagnosticInfo
  }
  // Windows.System.Diagnostics.IProcessDiagnosticInfoStatics
  [WinRTClassNameAttribute(SDiagnostics_ProcessDiagnosticInfo)]
  Diagnostics_IProcessDiagnosticInfoStatics = interface(IInspectable)
  ['{2F41B260-B49F-428C-AA0E-84744F49CA95}']
    function GetForProcesses: IVectorView_1__Diagnostics_IProcessDiagnosticInfo; safecall;
    function GetForCurrentProcess: Diagnostics_IProcessDiagnosticInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessDiagnosticInfo
  // Used Types:  UInt32
  }
  // Windows.System.Diagnostics.IProcessDiagnosticInfoStatics2
  [WinRTClassNameAttribute(SDiagnostics_ProcessDiagnosticInfo)]
  Diagnostics_IProcessDiagnosticInfoStatics2 = interface(IInspectable)
  ['{4A869897-9899-4A44-A29B-091663BE09B6}']
    function TryGetForProcessId(processId: Cardinal): Diagnostics_IProcessDiagnosticInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt64
  }
  // Windows.System.Diagnostics.ISystemMemoryUsageReport
  [WinRTClassNameAttribute(SDiagnostics_SystemMemoryUsageReport)]
  Diagnostics_ISystemMemoryUsageReport = interface(IInspectable)
  ['{38663C87-2A9F-403A-BD19-2CF3E8169500}']
    function get_TotalPhysicalSizeInBytes: UInt64; safecall;
    function get_AvailableSizeInBytes: UInt64; safecall;
    function get_CommittedSizeInBytes: UInt64; safecall;
    property AvailableSizeInBytes: UInt64 read get_AvailableSizeInBytes;
    property CommittedSizeInBytes: UInt64 read get_CommittedSizeInBytes;
    property TotalPhysicalSizeInBytes: UInt64 read get_TotalPhysicalSizeInBytes;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.ISystemMemoryUsageReport
  }
  // Windows.System.Diagnostics.ISystemMemoryUsage
  [WinRTClassNameAttribute(SDiagnostics_SystemMemoryUsage)]
  Diagnostics_ISystemMemoryUsage = interface(IInspectable)
  ['{17FFC595-1702-49CF-AA27-2F0A32591404}']
    function GetReport: Diagnostics_ISystemMemoryUsageReport; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.System.Diagnostics.ISystemCpuUsageReport
  [WinRTClassNameAttribute(SDiagnostics_SystemCpuUsageReport)]
  Diagnostics_ISystemCpuUsageReport = interface(IInspectable)
  ['{2C26D0B2-9483-4F62-AB57-82B29D9719B8}']
    function get_KernelTime: TimeSpan; safecall;
    function get_UserTime: TimeSpan; safecall;
    function get_IdleTime: TimeSpan; safecall;
    property IdleTime: TimeSpan read get_IdleTime;
    property KernelTime: TimeSpan read get_KernelTime;
    property UserTime: TimeSpan read get_UserTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.ISystemCpuUsageReport
  }
  // Windows.System.Diagnostics.ISystemCpuUsage
  [WinRTClassNameAttribute(SDiagnostics_SystemCpuUsage)]
  Diagnostics_ISystemCpuUsage = interface(IInspectable)
  ['{6037B3AC-02D6-4234-8362-7FE3ADC81F5F}']
    function GetReport: Diagnostics_ISystemCpuUsageReport; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.ISystemMemoryUsage
  // Used Types:  Windows.System.Diagnostics.ISystemCpuUsage
  }
  // Windows.System.Diagnostics.ISystemDiagnosticInfo
  [WinRTClassNameAttribute(SDiagnostics_SystemDiagnosticInfo)]
  Diagnostics_ISystemDiagnosticInfo = interface(IInspectable)
  ['{A290FE05-DFF3-407F-9A1B-0B2B317CA800}']
    function get_MemoryUsage: Diagnostics_ISystemMemoryUsage; safecall;
    function get_CpuUsage: Diagnostics_ISystemCpuUsage; safecall;
    property CpuUsage: Diagnostics_ISystemCpuUsage read get_CpuUsage;
    property MemoryUsage: Diagnostics_ISystemMemoryUsage read get_MemoryUsage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.ISystemDiagnosticInfo
  }
  // Windows.System.Diagnostics.ISystemDiagnosticInfoStatics
  [WinRTClassNameAttribute(SDiagnostics_SystemDiagnosticInfo)]
  Diagnostics_ISystemDiagnosticInfoStatics = interface(IInspectable)
  ['{D404AC21-FC7D-45F0-9A3F-39203AED9F7E}']
    function GetForCurrentSystem: Diagnostics_ISystemDiagnosticInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  String
  // Used Types:  Windows.Globalization.DayOfWeek
  }
  // Windows.System.UserProfile.IGlobalizationPreferencesStatics
  [WinRTClassNameAttribute(SUserProfile_GlobalizationPreferences)]
  UserProfile_IGlobalizationPreferencesStatics = interface(IInspectable)
  ['{01BF4326-ED37-4E96-B0E9-C1340D1EA158}']
    function get_Calendars: IVectorView_1__HSTRING; safecall;
    function get_Clocks: IVectorView_1__HSTRING; safecall;
    function get_Currencies: IVectorView_1__HSTRING; safecall;
    function get_Languages: IVectorView_1__HSTRING; safecall;
    function get_HomeGeographicRegion: HSTRING; safecall;
    function get_WeekStartsOn: DayOfWeek; safecall;
    property Calendars: IVectorView_1__HSTRING read get_Calendars;
    property Clocks: IVectorView_1__HSTRING read get_Clocks;
    property Currencies: IVectorView_1__HSTRING read get_Currencies;
    property HomeGeographicRegion: HSTRING read get_HomeGeographicRegion;
    property Languages: IVectorView_1__HSTRING read get_Languages;
    property WeekStartsOn: DayOfWeek read get_WeekStartsOn;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  }
  // Windows.System.UserProfile.IGlobalizationPreferencesStatics2
  [WinRTClassNameAttribute(SUserProfile_GlobalizationPreferences)]
  UserProfile_IGlobalizationPreferencesStatics2 = interface(IInspectable)
  ['{FCCE85F1-4300-4CD0-9CAC-1A8E7B7E18F4}']
    function TrySetHomeGeographicRegion(region: HSTRING): Boolean; safecall;
    function TrySetLanguages(languageTags: IIterable_1__HSTRING): Boolean; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo_Delegate_Base = interface(IUnknown)
  ['{CC3F5F7E-4160-567F-A0F6-AA9AEB187AF3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo = interface(AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo_Delegate_Base)
  ['{DD0A962C-4758-5704-874F-F9A0B4569AB5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  IAsyncOperation_1__IVector_1__IAppDiagnosticInfo_Base = interface(IInspectable)
  ['{D6A9D3B9-F63C-59BE-A096-3E9557C41182}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  IAsyncOperation_1__IVector_1__IAppDiagnosticInfo = interface(IAsyncOperation_1__IVector_1__IAppDiagnosticInfo_Base)
  ['{6D5AABF2-C335-5E91-B107-FF73B353250F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo; safecall;
    function GetResults: IVector_1__IAppDiagnosticInfo; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVector_1__IAppDiagnosticInfo read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  }
  // Windows.System.IAppDiagnosticInfoStatics
  [WinRTClassNameAttribute(SAppDiagnosticInfo)]
  IAppDiagnosticInfoStatics = interface(IInspectable)
  ['{CE6925BF-10CA-40C8-A9CA-C5C96501866E}']
    function RequestInfoAsync: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfo
  }
  // Windows.System.IAppDiagnosticInfoWatcherEventArgs
  [WinRTClassNameAttribute(SAppDiagnosticInfoWatcherEventArgs)]
  IAppDiagnosticInfoWatcherEventArgs = interface(IInspectable)
  ['{7017C716-E1DA-4C65-99DF-046DFF5BE71A}']
    function get_AppDiagnosticInfo: IAppDiagnosticInfo; safecall;
    property AppDiagnosticInfo: IAppDiagnosticInfo read get_AppDiagnosticInfo;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Windows.System.IAppDiagnosticInfoWatcherEventArgs>
  TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs_Delegate_Base = interface(IUnknown)
  ['{7C8C6F9F-D6BF-5566-B013-39C141E0FF8C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfoWatcher
  // Used Types:  Windows.System.IAppDiagnosticInfoWatcherEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Windows.System.IAppDiagnosticInfoWatcherEventArgs>
  TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs = interface(TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs_Delegate_Base)
  ['{04C9F500-14BC-5CF5-B34D-339156E07E21}']
    procedure Invoke(sender: IAppDiagnosticInfoWatcher; args: IAppDiagnosticInfoWatcherEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Object>
  TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{895DEE2F-E0F2-5304-A40E-1C67A2C058AA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfoWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Object>
  TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable = interface(TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable_Delegate_Base)
  ['{BFEA2810-7690-5913-A3AF-EC1B829F2DE3}']
    procedure Invoke(sender: IAppDiagnosticInfoWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Windows.System.IAppDiagnosticInfoWatcherEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IAppDiagnosticInfoWatcher,Object>
  // Used Types:  Windows.System.AppDiagnosticInfoWatcherStatus
  }
  // Windows.System.IAppDiagnosticInfoWatcher
  [WinRTClassNameAttribute(SAppDiagnosticInfoWatcher)]
  IAppDiagnosticInfoWatcher = interface(IInspectable)
  ['{75575070-01D3-489A-9325-52F9CC6EDE0A}']
    function add_Added(handler: TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__IAppDiagnosticInfoWatcher__IAppDiagnosticInfoWatcherEventArgs): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__IAppDiagnosticInfoWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function get_Status: AppDiagnosticInfoWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: AppDiagnosticInfoWatcherStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.DiagnosticAccessStatus>
  AsyncOperationCompletedHandler_1__DiagnosticAccessStatus_Delegate_Base = interface(IUnknown)
  ['{5D1302D7-5497-5A92-BF43-EB8B50679AAB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.DiagnosticAccessStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.DiagnosticAccessStatus>
  AsyncOperationCompletedHandler_1__DiagnosticAccessStatus = interface(AsyncOperationCompletedHandler_1__DiagnosticAccessStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DiagnosticAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.DiagnosticAccessStatus>
  IAsyncOperation_1__DiagnosticAccessStatus_Base = interface(IInspectable)
  ['{61C11BBE-2618-588A-A7CA-F60691272324}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.DiagnosticAccessStatus>
  // Used Types:  Windows.System.DiagnosticAccessStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.DiagnosticAccessStatus>
  IAsyncOperation_1__DiagnosticAccessStatus = interface(IAsyncOperation_1__DiagnosticAccessStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DiagnosticAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DiagnosticAccessStatus; safecall;
    function GetResults: DiagnosticAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DiagnosticAccessStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppDiagnosticInfoWatcher
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.DiagnosticAccessStatus>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.System.IAppDiagnosticInfo>>
  // Used Types:  String
  }
  // Windows.System.IAppDiagnosticInfoStatics2
  [WinRTClassNameAttribute(SAppDiagnosticInfo)]
  IAppDiagnosticInfoStatics2 = interface(IInspectable)
  ['{05B24B86-1000-4C90-BB9F-7235071C50FE}']
    function CreateWatcher: IAppDiagnosticInfoWatcher; safecall;
    function RequestAccessAsync: IAsyncOperation_1__DiagnosticAccessStatus; safecall;
    function RequestInfoForPackageAsync(packageFamilyName: HSTRING): IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; safecall;
    function RequestInfoForAppAsync: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; overload; safecall;
    function RequestInfoForAppAsync(appUserModelId: HSTRING): IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  String
  }
  // Windows.System.IAppResourceGroupBackgroundTaskReport
  [WinRTClassNameAttribute(SAppResourceGroupBackgroundTaskReport)]
  IAppResourceGroupBackgroundTaskReport = interface(IInspectable)
  ['{2566E74E-B05D-40C2-9DC1-1A4F039EA120}']
    function get_TaskId: TGuid; safecall;
    function get_Name: HSTRING; safecall;
    function get_Trigger: HSTRING; safecall;
    function get_EntryPoint: HSTRING; safecall;
    property EntryPoint: HSTRING read get_EntryPoint;
    property Name: HSTRING read get_Name;
    property TaskId: TGuid read get_TaskId;
    property Trigger: HSTRING read get_Trigger;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IIterator_1__IAppResourceGroupBackgroundTaskReport_Base = interface(IInspectable)
  ['{00C2180A-08E5-5EED-A08D-56A356CC004F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupBackgroundTaskReport
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IIterator_1__IAppResourceGroupBackgroundTaskReport = interface(IIterator_1__IAppResourceGroupBackgroundTaskReport_Base)
  ['{C4E4BA89-4E75-517B-AB55-604D817607BC}']
    function get_Current: IAppResourceGroupBackgroundTaskReport; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIAppResourceGroupBackgroundTaskReport): Cardinal; safecall;
    property Current: IAppResourceGroupBackgroundTaskReport read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IIterable_1__IAppResourceGroupBackgroundTaskReport_Base = interface(IInspectable)
  ['{3E7DCBCA-1804-5672-AD3B-58D944BB044C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IIterable_1__IAppResourceGroupBackgroundTaskReport = interface(IIterable_1__IAppResourceGroupBackgroundTaskReport_Base)
  ['{791F83F7-F902-5D88-9467-3B9F82BA82E9}']
    function First: IIterator_1__IAppResourceGroupBackgroundTaskReport; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupBackgroundTaskReport
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IVectorView_1__IAppResourceGroupBackgroundTaskReport = interface(IInspectable)
  ['{8A469227-CBCA-5739-A5FC-6FDE622585BE}']
    function GetAt(index: Cardinal): IAppResourceGroupBackgroundTaskReport; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IAppResourceGroupBackgroundTaskReport; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppResourceGroupBackgroundTaskReport): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupBackgroundTaskReport
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  IVector_1__IAppResourceGroupBackgroundTaskReport = interface(IInspectable)
  ['{84EEBBBD-2840-534E-9069-537987B62DF6}']
    function GetAt(index: Cardinal): IAppResourceGroupBackgroundTaskReport; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IAppResourceGroupBackgroundTaskReport; safecall;
    function IndexOf(value: IAppResourceGroupBackgroundTaskReport; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IAppResourceGroupBackgroundTaskReport); safecall;
    procedure InsertAt(index: Cardinal; value: IAppResourceGroupBackgroundTaskReport); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IAppResourceGroupBackgroundTaskReport); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppResourceGroupBackgroundTaskReport): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIAppResourceGroupBackgroundTaskReport); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt64
  // Used Types:  Windows.System.AppMemoryUsageLevel
  }
  // Windows.System.IAppResourceGroupMemoryReport
  [WinRTClassNameAttribute(SAppResourceGroupMemoryReport)]
  IAppResourceGroupMemoryReport = interface(IInspectable)
  ['{2C8C06B1-7DB1-4C51-A225-7FAE2D49E431}']
    function get_CommitUsageLimit: UInt64; safecall;
    function get_CommitUsageLevel: AppMemoryUsageLevel; safecall;
    function get_PrivateCommitUsage: UInt64; safecall;
    function get_TotalCommitUsage: UInt64; safecall;
    property CommitUsageLevel: AppMemoryUsageLevel read get_CommitUsageLevel;
    property CommitUsageLimit: UInt64 read get_CommitUsageLimit;
    property PrivateCommitUsage: UInt64 read get_PrivateCommitUsage;
    property TotalCommitUsage: UInt64 read get_TotalCommitUsage;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.IProcessDiagnosticInfo
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  IVector_1__Diagnostics_IProcessDiagnosticInfo = interface(IInspectable)
  ['{8411BB34-D0B6-5D65-A543-D1C3F6EE8DB1}']
    function GetAt(index: Cardinal): Diagnostics_IProcessDiagnosticInfo; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Diagnostics_IProcessDiagnosticInfo; safecall;
    function IndexOf(value: Diagnostics_IProcessDiagnosticInfo; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Diagnostics_IProcessDiagnosticInfo); safecall;
    procedure InsertAt(index: Cardinal; value: Diagnostics_IProcessDiagnosticInfo); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Diagnostics_IProcessDiagnosticInfo); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PDiagnostics_IProcessDiagnosticInfo): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PDiagnostics_IProcessDiagnosticInfo); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.AppResourceGroupExecutionState
  // Used Types:  Windows.System.AppResourceGroupEnergyQuotaState
  }
  // Windows.System.IAppResourceGroupStateReport
  [WinRTClassNameAttribute(SAppResourceGroupStateReport)]
  IAppResourceGroupStateReport = interface(IInspectable)
  ['{52849F18-2F70-4236-AB40-D04DB0C7B931}']
    function get_ExecutionState: AppResourceGroupExecutionState; safecall;
    function get_EnergyQuotaState: AppResourceGroupEnergyQuotaState; safecall;
    property EnergyQuotaState: AppResourceGroupEnergyQuotaState read get_EnergyQuotaState;
    property ExecutionState: AppResourceGroupExecutionState read get_ExecutionState;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.System.IAppResourceGroupBackgroundTaskReport>
  // Used Types:  Windows.System.IAppResourceGroupMemoryReport
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.System.Diagnostics.IProcessDiagnosticInfo>
  // Used Types:  Windows.System.IAppResourceGroupStateReport
  }
  // Windows.System.IAppResourceGroupInfo
  [WinRTClassNameAttribute(SAppResourceGroupInfo)]
  IAppResourceGroupInfo = interface(IInspectable)
  ['{B913F77A-E807-49F4-845E-7B8BDCFE8EE7}']
    function get_InstanceId: TGuid; safecall;
    function get_IsShared: Boolean; safecall;
    function GetBackgroundTaskReports: IVector_1__IAppResourceGroupBackgroundTaskReport; safecall;
    function GetMemoryReport: IAppResourceGroupMemoryReport; safecall;
    function GetProcessDiagnosticInfos: IVector_1__Diagnostics_IProcessDiagnosticInfo; safecall;
    function GetStateReport: IAppResourceGroupStateReport; safecall;
    property InstanceId: TGuid read get_InstanceId;
    property IsShared: Boolean read get_IsShared;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupInfo>
  IIterator_1__IAppResourceGroupInfo_Base = interface(IInspectable)
  ['{E44D5851-E4BC-50B9-A898-6903137D8A99}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupInfo>
  IIterator_1__IAppResourceGroupInfo = interface(IIterator_1__IAppResourceGroupInfo_Base)
  ['{3DA7A949-D470-566C-86B4-F7BA4F4F52BA}']
    function get_Current: IAppResourceGroupInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIAppResourceGroupInfo): Cardinal; safecall;
    property Current: IAppResourceGroupInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppResourceGroupInfo>
  IIterable_1__IAppResourceGroupInfo_Base = interface(IInspectable)
  ['{8B640948-C0D3-5B7E-A99C-5956190D5408}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.System.IAppResourceGroupInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.System.IAppResourceGroupInfo>
  IIterable_1__IAppResourceGroupInfo = interface(IIterable_1__IAppResourceGroupInfo_Base)
  ['{814734E8-4E80-5E9C-B35F-1739D873CEF1}']
    function First: IIterator_1__IAppResourceGroupInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppResourceGroupInfo>
  IVectorView_1__IAppResourceGroupInfo = interface(IInspectable)
  ['{E7985B3F-72DA-5EC5-A5F9-9E60EFB9F95D}']
    function GetAt(index: Cardinal): IAppResourceGroupInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IAppResourceGroupInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppResourceGroupInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupInfo
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppResourceGroupInfo>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.System.IAppResourceGroupInfo>
  IVector_1__IAppResourceGroupInfo = interface(IInspectable)
  ['{066D7BEA-9A12-57CA-B4C6-3B82F19202D4}']
    function GetAt(index: Cardinal): IAppResourceGroupInfo; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__IAppResourceGroupInfo; safecall;
    function IndexOf(value: IAppResourceGroupInfo; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: IAppResourceGroupInfo); safecall;
    procedure InsertAt(index: Cardinal; value: IAppResourceGroupInfo); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: IAppResourceGroupInfo); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAppResourceGroupInfo): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PIAppResourceGroupInfo); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppDiagnosticInfo>
  // Used Types:  Windows.System.IAppResourceGroupInfo
  }
  // Windows.System.IAppResourceGroupInfoWatcherEventArgs
  [WinRTClassNameAttribute(SAppResourceGroupInfoWatcherEventArgs)]
  IAppResourceGroupInfoWatcherEventArgs = interface(IInspectable)
  ['{7A787637-6302-4D2F-BF89-1C12D0B2A6B9}']
    function get_AppDiagnosticInfos: IVectorView_1__IAppDiagnosticInfo; safecall;
    function get_AppResourceGroupInfo: IAppResourceGroupInfo; safecall;
    property AppDiagnosticInfos: IVectorView_1__IAppDiagnosticInfo read get_AppDiagnosticInfos;
    property AppResourceGroupInfo: IAppResourceGroupInfo read get_AppResourceGroupInfo;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherEventArgs>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs_Delegate_Base = interface(IUnknown)
  ['{A7E14BAE-C778-5661-A41C-1AC3AC635F79}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupInfoWatcher
  // Used Types:  Windows.System.IAppResourceGroupInfoWatcherEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherEventArgs>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs = interface(TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs_Delegate_Base)
  ['{35349A4B-786E-5C09-93E7-A96B6ACC4FEC}']
    procedure Invoke(sender: IAppResourceGroupInfoWatcher; args: IAppResourceGroupInfoWatcherEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Object>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{E23A2901-197A-5867-8728-9C9DB9498D76}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupInfoWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Object>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable = interface(TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable_Delegate_Base)
  ['{1EA21D71-2F41-5B6D-BCE2-D833782A47D7}']
    procedure Invoke(sender: IAppResourceGroupInfoWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.System.IAppDiagnosticInfo>
  // Used Types:  Windows.System.IAppResourceGroupInfo
  }
  // Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs
  [WinRTClassNameAttribute(SAppResourceGroupInfoWatcherExecutionStateChangedEventArgs)]
  IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs = interface(IInspectable)
  ['{1BDBEDD7-FEE6-4FD4-98DD-E92A2CC299F3}']
    function get_AppDiagnosticInfos: IVectorView_1__IAppDiagnosticInfo; safecall;
    function get_AppResourceGroupInfo: IAppResourceGroupInfo; safecall;
    property AppDiagnosticInfos: IVectorView_1__IAppDiagnosticInfo read get_AppDiagnosticInfos;
    property AppResourceGroupInfo: IAppResourceGroupInfo read get_AppResourceGroupInfo;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{93F9724C-17F8-5DF5-A6CF-2F0AB90C0A27}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.IAppResourceGroupInfoWatcher
  // Used Types:  Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs>
  TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs = interface(TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs_Delegate_Base)
  ['{9BC01C3F-3C2C-5ABF-AF45-B4FF1B0229B6}']
    procedure Invoke(sender: IAppResourceGroupInfoWatcher; args: IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.IAppResourceGroupInfoWatcher,Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs>
  // Used Types:  Windows.System.AppResourceGroupInfoWatcherStatus
  }
  // Windows.System.IAppResourceGroupInfoWatcher
  [WinRTClassNameAttribute(SAppResourceGroupInfoWatcher)]
  IAppResourceGroupInfoWatcher = interface(IInspectable)
  ['{D9B0A0FD-6E5A-4C72-8B17-09FEC4A212BD}']
    function add_Added(handler: TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs): EventRegistrationToken; safecall;
    procedure remove_Added(token: EventRegistrationToken); safecall;
    function add_Removed(handler: TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherEventArgs): EventRegistrationToken; safecall;
    procedure remove_Removed(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__IAppResourceGroupInfoWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function add_ExecutionStateChanged(handler: TypedEventHandler_2__IAppResourceGroupInfoWatcher__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ExecutionStateChanged(token: EventRegistrationToken); safecall;
    function get_Status: AppResourceGroupInfoWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: AppResourceGroupInfoWatcherStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.System.IAppResourceGroupInfo>
  // Used Types:  Windows.System.IAppResourceGroupInfoWatcher
  }
  // Windows.System.IAppDiagnosticInfo2
  IAppDiagnosticInfo2 = interface(IInspectable)
  ['{DF46FBD7-191A-446C-9473-8FBC2374A354}']
    function GetResourceGroups: IVector_1__IAppResourceGroupInfo; safecall;
    function CreateResourceGroupWatcher: IAppResourceGroupInfoWatcher; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.DevicePortal.DevicePortalConnectionClosedReason
  }
  // Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
  Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs = interface(IInspectable)
  ['{FCF70E38-7032-428C-9F50-945C15A9F0CB}']
    function get_Reason: Diagnostics_DevicePortal_DevicePortalConnectionClosedReason; safecall;
    property Reason: Diagnostics_DevicePortal_DevicePortalConnectionClosedReason read get_Reason;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,String>
  }
  // Windows.Foundation.Collections.IMap`2<String,String>
  [WinRTClassNameAttribute(SInitialValueExpressionCollection)]
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Web.Http.IHttpRequestMessage
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  }
  // Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
  Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs = interface(IInspectable)
  ['{64DAE045-6FDA-4459-9EBD-ECCE22E38559}']
    function get_RequestMessage: Http_IHttpRequestMessage; safecall;
    function get_ResponseMessage: Http_IHttpResponseMessage; safecall;
    property RequestMessage: Http_IHttpRequestMessage read get_RequestMessage;
    property ResponseMessage: Http_IHttpResponseMessage read get_ResponseMessage;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs>
  TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs_Delegate_Base = interface(IUnknown)
  ['{2AAD93A8-52FA-54B3-9556-15D651208B3F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
  // Used Types:  Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs>
  TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs = interface(TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs_Delegate_Base)
  ['{E9F86B9E-CF54-5113-B75C-6A33CAD94BF7}']
    procedure Invoke(sender: Diagnostics_DevicePortal_IDevicePortalConnection; args: Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs>
  TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D8E33FF8-8AC4-5FD9-B184-8AE87D828EB9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
  // Used Types:  Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs>
  TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs = interface(TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs_Delegate_Base)
  ['{310F708B-99D6-56B5-B9FB-16EE3829BF30}']
    procedure Invoke(sender: Diagnostics_DevicePortal_IDevicePortalConnection; args: Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionClosedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection,Windows.System.Diagnostics.DevicePortal.IDevicePortalConnectionRequestReceivedEventArgs>
  }
  // Windows.System.Diagnostics.DevicePortal.IDevicePortalConnection
  Diagnostics_DevicePortal_IDevicePortalConnection = interface(IInspectable)
  ['{0F447F51-1198-4DA1-8D54-BDEF393E09B6}']
    function add_Closed(handler: TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionClosedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    function add_RequestReceived(handler: TypedEventHandler_2__Diagnostics_DevicePortal_IDevicePortalConnection__Diagnostics_DevicePortal_IDevicePortalConnectionRequestReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RequestReceived(token: EventRegistrationToken); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.System.Diagnostics.IDiagnosticActionResult
  Diagnostics_IDiagnosticActionResult = interface(IInspectable)
  ['{C265A296-E73B-4097-B28F-3442F03DD831}']
    function get_ExtendedError: HRESULT; safecall;
    function get_Results: IPropertySet; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property Results: IPropertySet read get_Results;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState_Delegate_Base = interface(IUnknown)
  ['{A0422898-B50A-52E3-B461-53989308BE12}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  // Used Types:  Windows.System.Diagnostics.DiagnosticActionState
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = interface(AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState_Delegate_Base)
  ['{FCB602D1-427A-5444-8BF6-0869255DF4BE}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState; progressInfo: Diagnostics_DiagnosticActionState); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState_Delegate_Base = interface(IUnknown)
  ['{390B0091-CAF7-5B64-839D-4990AE7F753C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = interface(AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState_Delegate_Base)
  ['{3567B618-0206-58EC-B7E8-CA14C1D88A47}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState_Base = interface(IInspectable)
  ['{BB5D493E-74E9-57A1-8C4C-923E0DC4565B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  // Used Types:  Windows.System.Diagnostics.IDiagnosticActionResult
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState = interface(IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState_Base)
  ['{AD7AF5A3-0017-5C89-BF4E-B8C15E0E77A0}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState; safecall;
    function GetResults: Diagnostics_IDiagnosticActionResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.System.Diagnostics.IDiagnosticActionResult,Windows.System.Diagnostics.DiagnosticActionState>
  // Used Types:  Windows.Data.Json.IJsonObject
  }
  // Windows.System.Diagnostics.IDiagnosticInvoker
  Diagnostics_IDiagnosticInvoker = interface(IInspectable)
  ['{187B270A-02E3-4F86-84FC-FDD892B5940F}']
    function RunDiagnosticActionAsync(context: Json_IJsonObject): IAsyncOperationWithProgress_2__Diagnostics_IDiagnosticActionResult__Diagnostics_DiagnosticActionState; safecall;
  end;

  // UsedAPI Interface
  {
  }
  // Windows.System.Display.IDisplayRequest
  Display_IDisplayRequest = interface(IInspectable)
  ['{E5732044-F49F-4B60-8DD4-5E7E3A632AC0}']
    procedure RequestActive; safecall;
    procedure RequestRelease; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.Profile.PlatformDataCollectionLevel
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.EventHandler`1<Object>
  // Used Types:  Boolean
  }
  // Windows.System.Profile.IPlatformDiagnosticsAndUsageDataSettingsStatics
  [WinRTClassNameAttribute(SProfile_PlatformDiagnosticsAndUsageDataSettings)]
  Profile_IPlatformDiagnosticsAndUsageDataSettingsStatics = interface(IInspectable)
  ['{B6E24C1B-7B1C-4B32-8C62-A66597CE723A}']
    function get_CollectionLevel: Profile_PlatformDataCollectionLevel; safecall;
    function add_CollectionLevelChanged(handler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CollectionLevelChanged(token: EventRegistrationToken); safecall;
    function CanCollectDiagnostics(level: Profile_PlatformDataCollectionLevel): Boolean; safecall;
    property CollectionLevel: Profile_PlatformDataCollectionLevel read get_CollectionLevel;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.System.UserProfile.IFirstSignInSettings
  [WinRTClassNameAttribute(SUserProfile_FirstSignInSettings)]
  UserProfile_IFirstSignInSettings = interface(IInspectable)
  ['{3E945153-3A5E-452E-A601-F5BAAD2A4870}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.System.UserProfile.IFirstSignInSettings
  }
  // Windows.System.UserProfile.IFirstSignInSettingsStatics
  [WinRTClassNameAttribute(SUserProfile_FirstSignInSettings)]
  UserProfile_IFirstSignInSettingsStatics = interface(IInspectable)
  ['{1CE18F0F-1C41-4EA0-B7A2-6F0C1C7E8438}']
    function GetDefault: UserProfile_IFirstSignInSettings; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.System.LaunchUriStatus
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.System.ILaunchUriResult
  ILaunchUriResult = interface(IInspectable)
  ['{EC27A8DF-F6D5-45CA-913A-70A40C5C8221}']
    function get_Status: LaunchUriStatus; safecall;
    function get_Result: IPropertySet; safecall;
    property Result: IPropertySet read get_Result;
    property Status: LaunchUriStatus read get_Status;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Point>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  // Used Types:  Windows.UI.Popups.Placement
  }
  // Windows.System.ILauncherUIOptions
  ILauncherUIOptions = interface(IInspectable)
  ['{1B25DA6E-8AA6-41E9-8251-4165F5985F49}']
    function get_InvocationPoint: IReference_1__Point; safecall;
    procedure put_InvocationPoint(value: IReference_1__Point); safecall;
    function get_SelectionRect: IReference_1__Rect; safecall;
    procedure put_SelectionRect(value: IReference_1__Rect); safecall;
    function get_PreferredPlacement: Popups_Placement; safecall;
    procedure put_PreferredPlacement(value: Popups_Placement); safecall;
    property InvocationPoint: IReference_1__Point read get_InvocationPoint write put_InvocationPoint;
    property PreferredPlacement: Popups_Placement read get_PreferredPlacement write put_PreferredPlacement;
    property SelectionRect: IReference_1__Rect read get_SelectionRect write put_SelectionRect;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.System.ILauncherUIOptions
  // Used Types:  String
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.System.ILauncherOptions
  ILauncherOptions = interface(IInspectable)
  ['{BAFA21D8-B071-4CD8-853E-341203E557D3}']
    function get_TreatAsUntrusted: Boolean; safecall;
    procedure put_TreatAsUntrusted(value: Boolean); safecall;
    function get_DisplayApplicationPicker: Boolean; safecall;
    procedure put_DisplayApplicationPicker(value: Boolean); safecall;
    function get_UI: ILauncherUIOptions; safecall;
    function get_PreferredApplicationPackageFamilyName: HSTRING; safecall;
    procedure put_PreferredApplicationPackageFamilyName(value: HSTRING); safecall;
    function get_PreferredApplicationDisplayName: HSTRING; safecall;
    procedure put_PreferredApplicationDisplayName(value: HSTRING); safecall;
    function get_FallbackUri: IUriRuntimeClass; safecall;
    procedure put_FallbackUri(value: IUriRuntimeClass); safecall;
    function get_ContentType: HSTRING; safecall;
    procedure put_ContentType(value: HSTRING); safecall;
    property ContentType: HSTRING read get_ContentType write put_ContentType;
    property DisplayApplicationPicker: Boolean read get_DisplayApplicationPicker write put_DisplayApplicationPicker;
    property FallbackUri: IUriRuntimeClass read get_FallbackUri write put_FallbackUri;
    property PreferredApplicationDisplayName: HSTRING read get_PreferredApplicationDisplayName write put_PreferredApplicationDisplayName;
    property PreferredApplicationPackageFamilyName: HSTRING read get_PreferredApplicationPackageFamilyName write put_PreferredApplicationPackageFamilyName;
    property TreatAsUntrusted: Boolean read get_TreatAsUntrusted write put_TreatAsUntrusted;
    property UI: ILauncherUIOptions read get_UI;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.Search.IStorageFileQueryResult
  }
  // Windows.System.ILauncherOptions2
  ILauncherOptions2 = interface(IInspectable)
  ['{3BA08EB4-6E40-4DCE-A1A3-2F53950AFB49}']
    function get_TargetApplicationPackageFamilyName: HSTRING; safecall;
    procedure put_TargetApplicationPackageFamilyName(value: HSTRING); safecall;
    function get_NeighboringFilesQuery: Search_IStorageFileQueryResult; safecall;
    procedure put_NeighboringFilesQuery(value: Search_IStorageFileQueryResult); safecall;
    property NeighboringFilesQuery: Search_IStorageFileQueryResult read get_NeighboringFilesQuery write put_NeighboringFilesQuery;
    property TargetApplicationPackageFamilyName: HSTRING read get_TargetApplicationPackageFamilyName write put_TargetApplicationPackageFamilyName;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.System.ILauncherOptions3
  ILauncherOptions3 = interface(IInspectable)
  ['{F0770655-4B63-4E3A-9107-4E687841923A}']
    function get_IgnoreAppUriHandlers: Boolean; safecall;
    procedure put_IgnoreAppUriHandlers(value: Boolean); safecall;
    property IgnoreAppUriHandlers: Boolean read get_IgnoreAppUriHandlers write put_IgnoreAppUriHandlers;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.System.ILauncherOptions4
  ILauncherOptions4 = interface(IInspectable)
  ['{EF6FD10E-E6FB-4814-A44E-57E8B9D9A01B}']
    function get_LimitPickerToCurrentAppAndAppUriHandlers: Boolean; safecall;
    procedure put_LimitPickerToCurrentAppAndAppUriHandlers(value: Boolean); safecall;
    property LimitPickerToCurrentAppAndAppUriHandlers: Boolean read get_LimitPickerToCurrentAppAndAppUriHandlers write put_LimitPickerToCurrentAppAndAppUriHandlers;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.UI.ViewManagement.ViewSizePreference
  }
  // Windows.System.ILauncherViewOptions
  ILauncherViewOptions = interface(IInspectable)
  ['{8A9B29F1-7CA7-49DE-9BD3-3C5B7184F616}']
    function get_DesiredRemainingView: ViewSizePreference; safecall;
    procedure put_DesiredRemainingView(value: ViewSizePreference); safecall;
    property DesiredRemainingView: ViewSizePreference read get_DesiredRemainingView write put_DesiredRemainingView;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  }
  // Windows.System.IRemoteLauncherOptions
  IRemoteLauncherOptions = interface(IInspectable)
  ['{9E3A2788-2891-4CDF-A2D6-9DFF7D02E693}']
    function get_FallbackUri: IUriRuntimeClass; safecall;
    procedure put_FallbackUri(value: IUriRuntimeClass); safecall;
    function get_PreferredAppIds: IVector_1__HSTRING; safecall;
    property FallbackUri: IUriRuntimeClass read get_FallbackUri write put_FallbackUri;
    property PreferredAppIds: IVector_1__HSTRING read get_PreferredAppIds;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageItem>
  }
  // Windows.System.IFolderLauncherOptions
  IFolderLauncherOptions = interface(IInspectable)
  ['{BB91C27D-6B87-432A-BD04-776C6F5FB2AB}']
    function get_ItemsToSelect: IVector_1__IStorageItem; safecall;
    property ItemsToSelect: IVector_1__IStorageItem read get_ItemsToSelect;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.ILaunchUriResult>
  AsyncOperationCompletedHandler_1__ILaunchUriResult_Delegate_Base = interface(IUnknown)
  ['{70A97BF8-E0A5-59BB-9174-812A131D85A0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.ILaunchUriResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.ILaunchUriResult>
  AsyncOperationCompletedHandler_1__ILaunchUriResult = interface(AsyncOperationCompletedHandler_1__ILaunchUriResult_Delegate_Base)
  ['{BD70A9E4-87D5-5255-959E-50CAB9725561}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ILaunchUriResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.ILaunchUriResult>
  IAsyncOperation_1__ILaunchUriResult_Base = interface(IInspectable)
  ['{7F97FC15-1CD6-54B7-A290-ACB60DBA81A1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.ILaunchUriResult>
  // Used Types:  Windows.System.ILaunchUriResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.ILaunchUriResult>
  IAsyncOperation_1__ILaunchUriResult = interface(IAsyncOperation_1__ILaunchUriResult_Base)
  ['{82847C29-EA1C-5C0C-8FAB-362F9DF7BE07}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ILaunchUriResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ILaunchUriResult; safecall;
    function GetResults: ILaunchUriResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ILaunchUriResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchQuerySupportStatus>
  AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus_Delegate_Base = interface(IUnknown)
  ['{198CAC52-ABCD-5529-933F-071CC93FD635}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchQuerySupportStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchQuerySupportStatus>
  AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus = interface(AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__LaunchQuerySupportStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchQuerySupportStatus>
  IAsyncOperation_1__LaunchQuerySupportStatus_Base = interface(IInspectable)
  ['{E7539992-2220-5D2D-82C4-3D44F8750D91}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchQuerySupportStatus>
  // Used Types:  Windows.System.LaunchQuerySupportStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchQuerySupportStatus>
  IAsyncOperation_1__LaunchQuerySupportStatus = interface(IAsyncOperation_1__LaunchQuerySupportStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus; safecall;
    function GetResults: LaunchQuerySupportStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__LaunchQuerySupportStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchUriStatus>
  AsyncOperationCompletedHandler_1__LaunchUriStatus_Delegate_Base = interface(IUnknown)
  ['{520AA58E-40D6-5A57-A6DC-CB5FAEA5CCA5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchUriStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchUriStatus>
  AsyncOperationCompletedHandler_1__LaunchUriStatus = interface(AsyncOperationCompletedHandler_1__LaunchUriStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__LaunchUriStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchUriStatus>
  IAsyncOperation_1__LaunchUriStatus_Base = interface(IInspectable)
  ['{AB3D721B-A4F3-5861-B034-030B15233C52}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.LaunchUriStatus>
  // Used Types:  Windows.System.LaunchUriStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.LaunchUriStatus>
  IAsyncOperation_1__LaunchUriStatus = interface(IAsyncOperation_1__LaunchUriStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__LaunchUriStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__LaunchUriStatus; safecall;
    function GetResults: LaunchUriStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__LaunchUriStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteLaunchUriStatus>
  AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus_Delegate_Base = interface(IUnknown)
  ['{3F8F4B1B-CD54-543C-817F-2630487F1878}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteLaunchUriStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteLaunchUriStatus>
  AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus = interface(AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__RemoteLaunchUriStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteLaunchUriStatus>
  IAsyncOperation_1__RemoteLaunchUriStatus_Base = interface(IInspectable)
  ['{BB70E5CD-62C2-5F78-AC8D-F4B973981DA4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.RemoteLaunchUriStatus>
  // Used Types:  Windows.System.RemoteLaunchUriStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.RemoteLaunchUriStatus>
  IAsyncOperation_1__RemoteLaunchUriStatus = interface(IAsyncOperation_1__RemoteLaunchUriStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus; safecall;
    function GetResults: RemoteLaunchUriStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__RemoteLaunchUriStatus read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.System.Profile.IHardwareToken
  Profile_IHardwareToken = interface(IInspectable)
  ['{28F6D4C0-FB12-40A4-8167-7F4E03D2724C}']
    function get_Id: IBuffer; safecall;
    function get_Signature: IBuffer; safecall;
    function get_Certificate: IBuffer; safecall;
    property Certificate: IBuffer read get_Certificate;
    property Id: IBuffer read get_Id;
    property Signature: IBuffer read get_Signature;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.System.Profile.ISharedModeSettingsStatics
  [WinRTClassNameAttribute(SProfile_SharedModeSettings)]
  Profile_ISharedModeSettingsStatics = interface(IInspectable)
  ['{893DF40E-CAD6-4D50-8C49-6FCFC03EDB29}']
    function get_IsEnabled: Boolean; safecall;
    property IsEnabled: Boolean read get_IsEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.System.Profile.ISharedModeSettingsStatics2
  [WinRTClassNameAttribute(SProfile_SharedModeSettings)]
  Profile_ISharedModeSettingsStatics2 = interface(IInspectable)
  ['{608988A4-CCF1-4EE8-A5E2-FD6A1D0CFAC8}']
    function get_ShouldAvoidLocalStorage: Boolean; safecall;
    property ShouldAvoidLocalStorage: Boolean read get_ShouldAvoidLocalStorage;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  }
  // Windows.System.Profile.SystemManufacturers.IOemSupportInfo
  Profile_SystemManufacturers_IOemSupportInfo = interface(IInspectable)
  ['{8D2EAE55-87EF-4266-86D0-C4AFBEB29BB9}']
    function get_SupportLink: IUriRuntimeClass; safecall;
    function get_SupportAppLink: IUriRuntimeClass; safecall;
    function get_SupportProvider: HSTRING; safecall;
    property SupportAppLink: IUriRuntimeClass read get_SupportAppLink;
    property SupportLink: IUriRuntimeClass read get_SupportLink;
    property SupportProvider: HSTRING read get_SupportProvider;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetAccountPictureResult>
  AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult_Delegate_Base = interface(IUnknown)
  ['{603F3E31-7A51-518C-9280-C188EA4213D8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetAccountPictureResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetAccountPictureResult>
  AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult = interface(AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__UserProfile_SetAccountPictureResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetAccountPictureResult>
  IAsyncOperation_1__UserProfile_SetAccountPictureResult_Base = interface(IInspectable)
  ['{6809E406-6D3B-5164-8F32-B845B0781405}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetAccountPictureResult>
  // Used Types:  Windows.System.UserProfile.SetAccountPictureResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetAccountPictureResult>
  IAsyncOperation_1__UserProfile_SetAccountPictureResult = interface(IAsyncOperation_1__UserProfile_SetAccountPictureResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult; safecall;
    function GetResults: UserProfile_SetAccountPictureResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__UserProfile_SetAccountPictureResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.System.UserProfile.AccountPictureKind
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetAccountPictureResult>
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.EventHandler`1<Object>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.IUriRuntimeClass>
  }
  // Windows.System.UserProfile.IUserInformationStatics
  [WinRTClassNameAttribute(SUserProfile_UserInformation)]
  UserProfile_IUserInformationStatics = interface(IInspectable)
  ['{77F3A910-48FA-489C-934E-2AE85BA8F772}']
    function get_AccountPictureChangeEnabled: Boolean; safecall;
    function get_NameAccessAllowed: Boolean; safecall;
    function GetAccountPicture(kind: UserProfile_AccountPictureKind): IStorageFile; safecall;
    function SetAccountPictureAsync(image: IStorageFile): IAsyncOperation_1__UserProfile_SetAccountPictureResult; safecall;
    function SetAccountPicturesAsync(smallImage: IStorageFile; largeImage: IStorageFile; video: IStorageFile): IAsyncOperation_1__UserProfile_SetAccountPictureResult; safecall;
    function SetAccountPictureFromStreamAsync(image: IRandomAccessStream): IAsyncOperation_1__UserProfile_SetAccountPictureResult; safecall;
    function SetAccountPicturesFromStreamsAsync(smallImage: IRandomAccessStream; largeImage: IRandomAccessStream; video: IRandomAccessStream): IAsyncOperation_1__UserProfile_SetAccountPictureResult; safecall;
    function add_AccountPictureChanged(changeHandler: EventHandler_1__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AccountPictureChanged(token: EventRegistrationToken); safecall;
    function GetDisplayNameAsync: IAsyncOperation_1__HSTRING; safecall;
    function GetFirstNameAsync: IAsyncOperation_1__HSTRING; safecall;
    function GetLastNameAsync: IAsyncOperation_1__HSTRING; safecall;
    function GetPrincipalNameAsync: IAsyncOperation_1__HSTRING; safecall;
    function GetSessionInitiationProtocolUriAsync: IAsyncOperation_1__IUriRuntimeClass; safecall;
    function GetDomainNameAsync: IAsyncOperation_1__HSTRING; safecall;
    property AccountPictureChangeEnabled: Boolean read get_AccountPictureChangeEnabled;
    property NameAccessAllowed: Boolean read get_NameAccessAllowed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.System.UserProfile.ILockScreenStatics
  [WinRTClassNameAttribute(SUserProfile_LockScreen)]
  UserProfile_ILockScreenStatics = interface(IInspectable)
  ['{3EE9D3AD-B607-40AE-B426-7631D9821269}']
    function get_OriginalImageFile: IUriRuntimeClass; safecall;
    function GetImageStream: IRandomAccessStream; safecall;
    function SetImageFileAsync(value: IStorageFile): IAsyncAction; safecall;
    function SetImageStreamAsync(value: IRandomAccessStream): IAsyncAction; safecall;
    property OriginalImageFile: IUriRuntimeClass read get_OriginalImageFile;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetImageFeedResult>
  AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult_Delegate_Base = interface(IUnknown)
  ['{F214731A-1305-5B44-932C-AF9A1E4D78C9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetImageFeedResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetImageFeedResult>
  AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult = interface(AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__UserProfile_SetImageFeedResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetImageFeedResult>
  IAsyncOperation_1__UserProfile_SetImageFeedResult_Base = interface(IInspectable)
  ['{5361BFC9-0740-544A-9797-1FFE5E73C54E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.System.UserProfile.SetImageFeedResult>
  // Used Types:  Windows.System.UserProfile.SetImageFeedResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetImageFeedResult>
  IAsyncOperation_1__UserProfile_SetImageFeedResult = interface(IAsyncOperation_1__UserProfile_SetImageFeedResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult; safecall;
    function GetResults: UserProfile_SetImageFeedResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__UserProfile_SetImageFeedResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.System.UserProfile.SetImageFeedResult>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Boolean
  }
  // Windows.System.UserProfile.ILockScreenImageFeedStatics
  [WinRTClassNameAttribute(SUserProfile_LockScreen)]
  UserProfile_ILockScreenImageFeedStatics = interface(IInspectable)
  ['{2C0D73F6-03A9-41A6-9B01-495251FF51D5}']
    function RequestSetImageFeedAsync(syndicationFeedUri: IUriRuntimeClass): IAsyncOperation_1__UserProfile_SetImageFeedResult; safecall;
    function TryRemoveImageFeed: Boolean; safecall;
  end;


  // Emit Forwarded classes
  // Windows.System.DateTimeSettings
  // DualAPI
  // Statics: "Windows.System.IDateTimeSettingsStatics"
  TDateTimeSettings = class(TWinRTGenericImportS<IDateTimeSettingsStatics>)
  public
    // -> IDateTimeSettingsStatics
    class procedure SetSystemDateTime(utcDateTime: DateTime); static; inline;
  end;

  // Windows.System.ProcessLauncherOptions
  // DualAPI
  // Implements: Windows.System.IProcessLauncherOptions
  // Instantiable: "IProcessLauncherOptions"
  TProcessLauncherOptions = class(TWinRTGenericImportI<IProcessLauncherOptions>) end;

  // Windows.System.ProcessLauncherResult
  // DualAPI
  // Implements: Windows.System.IProcessLauncherResult

  // Windows.System.ProcessLauncher
  // DualAPI
  // Statics: "Windows.System.IProcessLauncherStatics"
  TProcessLauncher = class(TWinRTGenericImportS<IProcessLauncherStatics>)
  public
    // -> IProcessLauncherStatics
    class function RunToCompletionAsync(fileName: HSTRING; args: HSTRING): IAsyncOperation_1__IProcessLauncherResult; overload; static; inline;
    class function RunToCompletionAsync(fileName: HSTRING; args: HSTRING; options: IProcessLauncherOptions): IAsyncOperation_1__IProcessLauncherResult; overload; static; inline;
  end;

  // Windows.System.ShutdownManager
  // DualAPI
  // Statics: "Windows.System.IShutdownManagerStatics2"
  // Statics: "Windows.System.IShutdownManagerStatics"
  TShutdownManager = class(TWinRTGenericImportS2<IShutdownManagerStatics, IShutdownManagerStatics2>)
  public
    // -> IShutdownManagerStatics2
    class function IsPowerStateSupported(powerState: PowerState): Boolean; static; inline;
    class procedure EnterPowerState(powerState: PowerState); overload; static; inline;
    class procedure EnterPowerState(powerState: PowerState; wakeUpAfter: TimeSpan); overload; static; inline;

    // -> IShutdownManagerStatics
    class procedure BeginShutdown(shutdownKind: ShutdownKind; timeout: TimeSpan); static; inline;
    class procedure CancelShutdown; static; inline;
  end;

  // Windows.System.UserProfile.AdvertisingManagerForUser
  // DualAPI
  // Implements: Windows.System.UserProfile.IAdvertisingManagerForUser

  // Windows.System.DispatcherQueueTimer
  // DualAPI
  // Implements: Windows.System.IDispatcherQueueTimer

  // Windows.System.DispatcherQueue
  // DualAPI
  // Implements: Windows.System.IDispatcherQueue
  // Statics: "Windows.System.IDispatcherQueueStatics"
  TDispatcherQueue = class(TWinRTGenericImportS<IDispatcherQueueStatics>)
  public
    // -> IDispatcherQueueStatics
    class function GetForCurrentThread: IDispatcherQueue; static; inline;
  end;

  // Windows.System.DispatcherQueueShutdownStartingEventArgs
  // DualAPI
  // Implements: Windows.System.IDispatcherQueueShutdownStartingEventArgs

  // Windows.System.DispatcherQueueController
  // DualAPI
  // Implements: Windows.System.IDispatcherQueueController
  // Statics: "Windows.System.IDispatcherQueueControllerStatics"
  TDispatcherQueueController = class(TWinRTGenericImportS<IDispatcherQueueControllerStatics>)
  public
    // -> IDispatcherQueueControllerStatics
    class function CreateOnDedicatedThread: IDispatcherQueueController; static; inline;
  end;

  // Windows.System.UserWatcher
  // DualAPI
  // Implements: Windows.System.IUserWatcher

  // Windows.System.User
  // DualAPI
  // Implements: Windows.System.IUser
  // Statics: "Windows.System.IUserStatics"
  TUser = class(TWinRTGenericImportS<IUserStatics>)
  public
    // -> IUserStatics
    class function CreateWatcher: IUserWatcher; static; inline;
    class function FindAllAsync: IAsyncOperation_1__IVectorView_1__IUser; overload; static; inline;
    class function FindAllAsync(&type: UserType): IAsyncOperation_1__IVectorView_1__IUser; overload; static; inline;
    class function FindAllAsync(&type: UserType; status: UserAuthenticationStatus): IAsyncOperation_1__IVectorView_1__IUser; overload; static; inline;
    class function GetFromId(nonRoamableId: HSTRING): IUser; static; inline;
  end;

  // Windows.System.UserChangedEventArgs
  // DualAPI
  // Implements: Windows.System.IUserChangedEventArgs

  // Windows.System.UserAuthenticationStatusChangingEventArgs
  // DualAPI
  // Implements: Windows.System.IUserAuthenticationStatusChangingEventArgs

  // Windows.System.UserAuthenticationStatusChangeDeferral
  // DualAPI
  // Implements: Windows.System.IUserAuthenticationStatusChangeDeferral

  // Windows.System.KnownUserProperties
  // DualAPI
  // Statics: "Windows.System.IKnownUserPropertiesStatics"
  TKnownUserProperties = class(TWinRTGenericImportS<IKnownUserPropertiesStatics>)
  public
    // -> IKnownUserPropertiesStatics
    class function get_DisplayName: HSTRING; static; inline;
    class function get_FirstName: HSTRING; static; inline;
    class function get_LastName: HSTRING; static; inline;
    class function get_ProviderName: HSTRING; static; inline;
    class function get_AccountName: HSTRING; static; inline;
    class function get_GuestHost: HSTRING; static; inline;
    class function get_PrincipalName: HSTRING; static; inline;
    class function get_DomainName: HSTRING; static; inline;
    class function get_SessionInitiationProtocolUri: HSTRING; static; inline;
    class property AccountName: HSTRING read get_AccountName;
    class property DisplayName: HSTRING read get_DisplayName;
    class property DomainName: HSTRING read get_DomainName;
    class property FirstName: HSTRING read get_FirstName;
    class property GuestHost: HSTRING read get_GuestHost;
    class property LastName: HSTRING read get_LastName;
    class property PrincipalName: HSTRING read get_PrincipalName;
    class property ProviderName: HSTRING read get_ProviderName;
    class property SessionInitiationProtocolUri: HSTRING read get_SessionInitiationProtocolUri;
  end;

  // Windows.System.UserPicker
  // DualAPI
  // Implements: Windows.System.IUserPicker
  // Statics: "Windows.System.IUserPickerStatics"
  // Instantiable: "IUserPicker"
  TUserPicker = class(TWinRTGenericImportSI<IUserPickerStatics, IUserPicker>)
  public
    // -> IUserPickerStatics
    class function IsSupported: Boolean; static; inline;
  end;

  // Windows.System.UserDeviceAssociationChangedEventArgs
  // DualAPI
  // Implements: Windows.System.IUserDeviceAssociationChangedEventArgs

  // Windows.System.UserDeviceAssociation
  // DualAPI
  // Statics: "Windows.System.IUserDeviceAssociationStatics"
  TUserDeviceAssociation = class(TWinRTGenericImportS<IUserDeviceAssociationStatics>)
  public
    // -> IUserDeviceAssociationStatics
    class function FindUserFromDeviceId(deviceId: HSTRING): IUser; static; inline;
    class function add_UserDeviceAssociationChanged(handler: EventHandler_1__IUserDeviceAssociationChangedEventArgs): EventRegistrationToken; static; inline;
    class procedure remove_UserDeviceAssociationChanged(token: EventRegistrationToken); static; inline;
  end;

  // Windows.System.UserProfile.DiagnosticsSettings
  // DualAPI
  // Implements: Windows.System.UserProfile.IDiagnosticsSettings
  // Statics: "Windows.System.UserProfile.IDiagnosticsSettingsStatics"
  TUserProfile_DiagnosticsSettings = class(TWinRTGenericImportS<UserProfile_IDiagnosticsSettingsStatics>)
  public
    // -> UserProfile_IDiagnosticsSettingsStatics
    class function GetDefault: UserProfile_IDiagnosticsSettings; static; inline;
    class function GetForUser(user: IUser): UserProfile_IDiagnosticsSettings; static; inline;
  end;

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceInfo
  // DualAPI
  // Implements: Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceInfo

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticTraceRuntimeInfo
  // DualAPI
  // Implements: Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticTraceRuntimeInfo

  // Windows.System.Diagnostics.TraceReporting.PlatformDiagnosticActions
  // DualAPI
  // Statics: "Windows.System.Diagnostics.TraceReporting.IPlatformDiagnosticActionsStatics"
  TDiagnostics_TraceReporting_PlatformDiagnosticActions = class(TWinRTGenericImportS<Diagnostics_TraceReporting_IPlatformDiagnosticActionsStatics>)
  public
    // -> Diagnostics_TraceReporting_IPlatformDiagnosticActionsStatics
    class function IsScenarioEnabled(scenarioId: TGuid): Boolean; static; inline;
    class function TryEscalateScenario(scenarioId: TGuid; escalationType: Diagnostics_TraceReporting_PlatformDiagnosticEscalationType; outputDirectory: HSTRING; timestampOutputDirectory: Boolean; forceEscalationUpload: Boolean; triggers: IMapView_2__HSTRING__HSTRING): Boolean; static; inline;
    class function DownloadLatestSettingsForNamespace(partner: HSTRING; feature: HSTRING; isScenarioNamespace: Boolean; downloadOverCostedNetwork: Boolean; downloadOverBattery: Boolean): Diagnostics_TraceReporting_PlatformDiagnosticActionState; static; inline;
    class function GetActiveScenarioList: IVectorView_1__TGuid; static; inline;
    class function ForceUpload(latency: Diagnostics_TraceReporting_PlatformDiagnosticEventBufferLatencies; uploadOverCostedNetwork: Boolean; uploadOverBattery: Boolean): Diagnostics_TraceReporting_PlatformDiagnosticActionState; static; inline;
    class function IsTraceRunning(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType; scenarioId: TGuid; traceProfileHash: UInt64): Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotState; static; inline;
    class function GetActiveTraceRuntime(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType): Diagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo; static; inline;
    class function GetKnownTraceList(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType): IVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo; static; inline;
  end;

  // Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationResult
  // DualAPI
  // Implements: Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationResult

  // Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationSettings
  // DualAPI
  // Implements: Windows.System.Diagnostics.Telemetry.IPlatformTelemetryRegistrationSettings
  // Instantiable: "Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings"
  TDiagnostics_Telemetry_PlatformTelemetryRegistrationSettings = class(TWinRTGenericImportI<Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings>) end;

  // Windows.System.Diagnostics.Telemetry.PlatformTelemetryClient
  // DualAPI
  // Statics: "Windows.System.Diagnostics.Telemetry.IPlatformTelemetryClientStatics"
  TDiagnostics_Telemetry_PlatformTelemetryClient = class(TWinRTGenericImportS<Diagnostics_Telemetry_IPlatformTelemetryClientStatics>)
  public
    // -> Diagnostics_Telemetry_IPlatformTelemetryClientStatics
    class function Register(id: HSTRING): Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult; overload; static; inline;
    class function Register(id: HSTRING; settings: Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings): Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult; overload; static; inline;
  end;

  // Windows.System.UserProfile.UserProfilePersonalizationSettings
  // DualAPI
  // Implements: Windows.System.UserProfile.IUserProfilePersonalizationSettings
  // Statics: "Windows.System.UserProfile.IUserProfilePersonalizationSettingsStatics"
  TUserProfile_UserProfilePersonalizationSettings = class(TWinRTGenericImportS<UserProfile_IUserProfilePersonalizationSettingsStatics>)
  public
    // -> UserProfile_IUserProfilePersonalizationSettingsStatics
    class function get_Current: UserProfile_IUserProfilePersonalizationSettings; static; inline;
    class function IsSupported: Boolean; static; inline;
    class property Current: UserProfile_IUserProfilePersonalizationSettings read get_Current;
  end;

  // Windows.System.Diagnostics.ProcessDiagnosticInfo
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessDiagnosticInfo
  // Implements: Windows.System.Diagnostics.IProcessDiagnosticInfo2
  // Statics: "Windows.System.Diagnostics.IProcessDiagnosticInfoStatics2"
  // Statics: "Windows.System.Diagnostics.IProcessDiagnosticInfoStatics"
  TDiagnostics_ProcessDiagnosticInfo = class(TWinRTGenericImportS2<Diagnostics_IProcessDiagnosticInfoStatics, Diagnostics_IProcessDiagnosticInfoStatics2>)
  public
    // -> Diagnostics_IProcessDiagnosticInfoStatics2
    class function TryGetForProcessId(processId: Cardinal): Diagnostics_IProcessDiagnosticInfo; static; inline;

    // -> Diagnostics_IProcessDiagnosticInfoStatics
    class function GetForProcesses: IVectorView_1__Diagnostics_IProcessDiagnosticInfo; static; inline;
    class function GetForCurrentProcess: Diagnostics_IProcessDiagnosticInfo; static; inline;
  end;

  // Windows.System.Diagnostics.ProcessDiskUsage
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessDiskUsage

  // Windows.System.Diagnostics.ProcessMemoryUsage
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessMemoryUsage

  // Windows.System.Diagnostics.ProcessCpuUsage
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessCpuUsage

  // Windows.System.Diagnostics.ProcessMemoryUsageReport
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessMemoryUsageReport

  // Windows.System.Diagnostics.ProcessDiskUsageReport
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessDiskUsageReport

  // Windows.System.Diagnostics.ProcessCpuUsageReport
  // DualAPI
  // Implements: Windows.System.Diagnostics.IProcessCpuUsageReport

  // Windows.System.Diagnostics.SystemMemoryUsage
  // DualAPI
  // Implements: Windows.System.Diagnostics.ISystemMemoryUsage

  // Windows.System.Diagnostics.SystemCpuUsage
  // DualAPI
  // Implements: Windows.System.Diagnostics.ISystemCpuUsage

  // Windows.System.Diagnostics.SystemDiagnosticInfo
  // DualAPI
  // Implements: Windows.System.Diagnostics.ISystemDiagnosticInfo
  // Statics: "Windows.System.Diagnostics.ISystemDiagnosticInfoStatics"
  TDiagnostics_SystemDiagnosticInfo = class(TWinRTGenericImportS<Diagnostics_ISystemDiagnosticInfoStatics>)
  public
    // -> Diagnostics_ISystemDiagnosticInfoStatics
    class function GetForCurrentSystem: Diagnostics_ISystemDiagnosticInfo; static; inline;
  end;

  // Windows.System.Diagnostics.SystemMemoryUsageReport
  // DualAPI
  // Implements: Windows.System.Diagnostics.ISystemMemoryUsageReport

  // Windows.System.Diagnostics.SystemCpuUsageReport
  // DualAPI
  // Implements: Windows.System.Diagnostics.ISystemCpuUsageReport

  // Windows.System.UserProfile.GlobalizationPreferences
  // DualAPI
  // Statics: "Windows.System.UserProfile.IGlobalizationPreferencesStatics"
  // Statics: "Windows.System.UserProfile.IGlobalizationPreferencesStatics2"
  TUserProfile_GlobalizationPreferences = class(TWinRTGenericImportS2<UserProfile_IGlobalizationPreferencesStatics, UserProfile_IGlobalizationPreferencesStatics2>)
  public
    // -> UserProfile_IGlobalizationPreferencesStatics
    class function get_Calendars: IVectorView_1__HSTRING; static; inline;
    class function get_Clocks: IVectorView_1__HSTRING; static; inline;
    class function get_Currencies: IVectorView_1__HSTRING; static; inline;
    class function get_Languages: IVectorView_1__HSTRING; static; inline;
    class function get_HomeGeographicRegion: HSTRING; static; inline;
    class function get_WeekStartsOn: DayOfWeek; static; inline;
    class property Calendars: IVectorView_1__HSTRING read get_Calendars;
    class property Clocks: IVectorView_1__HSTRING read get_Clocks;
    class property Currencies: IVectorView_1__HSTRING read get_Currencies;
    class property HomeGeographicRegion: HSTRING read get_HomeGeographicRegion;
    class property Languages: IVectorView_1__HSTRING read get_Languages;
    class property WeekStartsOn: DayOfWeek read get_WeekStartsOn;

    // -> UserProfile_IGlobalizationPreferencesStatics2
    class function TrySetHomeGeographicRegion(region: HSTRING): Boolean; static; inline;
    class function TrySetLanguages(languageTags: IIterable_1__HSTRING): Boolean; static; inline;
  end;

  // Windows.System.AppDiagnosticInfo
  // DualAPI
  // Implements: Windows.System.IAppDiagnosticInfo
  // Implements: Windows.System.IAppDiagnosticInfo2
  // Statics: "Windows.System.IAppDiagnosticInfoStatics"
  // Statics: "Windows.System.IAppDiagnosticInfoStatics2"
  TAppDiagnosticInfo = class(TWinRTGenericImportS2<IAppDiagnosticInfoStatics, IAppDiagnosticInfoStatics2>)
  public
    // -> IAppDiagnosticInfoStatics
    class function RequestInfoAsync: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; static; inline;

    // -> IAppDiagnosticInfoStatics2
    class function CreateWatcher: IAppDiagnosticInfoWatcher; static; inline;
    class function RequestAccessAsync: IAsyncOperation_1__DiagnosticAccessStatus; static; inline;
    class function RequestInfoForPackageAsync(packageFamilyName: HSTRING): IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; static; inline;
    class function RequestInfoForAppAsync: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; overload; static; inline;
    class function RequestInfoForAppAsync(appUserModelId: HSTRING): IAsyncOperation_1__IVector_1__IAppDiagnosticInfo; overload; static; inline;
  end;

  // Windows.System.AppDiagnosticInfoWatcher
  // DualAPI
  // Implements: Windows.System.IAppDiagnosticInfoWatcher

  // Windows.System.AppResourceGroupInfo
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupInfo

  // Windows.System.AppResourceGroupInfoWatcher
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupInfoWatcher

  // Windows.System.AppDiagnosticInfoWatcherEventArgs
  // DualAPI
  // Implements: Windows.System.IAppDiagnosticInfoWatcherEventArgs

  // Windows.System.AppResourceGroupBackgroundTaskReport
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupBackgroundTaskReport

  // Windows.System.AppResourceGroupMemoryReport
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupMemoryReport

  // Windows.System.AppResourceGroupStateReport
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupStateReport

  // Windows.System.AppResourceGroupInfoWatcherEventArgs
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupInfoWatcherEventArgs

  // Windows.System.AppResourceGroupInfoWatcherExecutionStateChangedEventArgs
  // DualAPI
  // Implements: Windows.System.IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs

  // Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings
  // DualAPI
  // Statics: "Windows.System.Profile.IPlatformDiagnosticsAndUsageDataSettingsStatics"
  TProfile_PlatformDiagnosticsAndUsageDataSettings = class(TWinRTGenericImportS<Profile_IPlatformDiagnosticsAndUsageDataSettingsStatics>)
  public
    // -> Profile_IPlatformDiagnosticsAndUsageDataSettingsStatics
    class function get_CollectionLevel: Profile_PlatformDataCollectionLevel; static; inline;
    class function add_CollectionLevelChanged(handler: EventHandler_1__IInspectable): EventRegistrationToken; static; inline;
    class procedure remove_CollectionLevelChanged(token: EventRegistrationToken); static; inline;
    class function CanCollectDiagnostics(level: Profile_PlatformDataCollectionLevel): Boolean; static; inline;
    class property CollectionLevel: Profile_PlatformDataCollectionLevel read get_CollectionLevel;
  end;

  // Windows.System.UserProfile.FirstSignInSettings
  // DualAPI
  // Implements: Windows.System.UserProfile.IFirstSignInSettings
  // Implements: Windows.Foundation.Collections.IMapView`2<String,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Object>>
  // Statics: "Windows.System.UserProfile.IFirstSignInSettingsStatics"
  TUserProfile_FirstSignInSettings = class(TWinRTGenericImportS<UserProfile_IFirstSignInSettingsStatics>)
  public
    // -> UserProfile_IFirstSignInSettingsStatics
    class function GetDefault: UserProfile_IFirstSignInSettings; static; inline;
  end;

  // Windows.System.Profile.SharedModeSettings
  // DualAPI
  // Statics: "Windows.System.Profile.ISharedModeSettingsStatics"
  // Statics: "Windows.System.Profile.ISharedModeSettingsStatics2"
  TProfile_SharedModeSettings = class(TWinRTGenericImportS2<Profile_ISharedModeSettingsStatics, Profile_ISharedModeSettingsStatics2>)
  public
    // -> Profile_ISharedModeSettingsStatics
    class function get_IsEnabled: Boolean; static; inline;
    class property IsEnabled: Boolean read get_IsEnabled;

    // -> Profile_ISharedModeSettingsStatics2
    class function get_ShouldAvoidLocalStorage: Boolean; static; inline;
    class property ShouldAvoidLocalStorage: Boolean read get_ShouldAvoidLocalStorage;
  end;

  // Windows.System.UserProfile.UserInformation
  // DualAPI
  // Statics: "Windows.System.UserProfile.IUserInformationStatics"
  TUserProfile_UserInformation = class(TWinRTGenericImportS<UserProfile_IUserInformationStatics>)
  public
    // -> UserProfile_IUserInformationStatics
    class function get_AccountPictureChangeEnabled: Boolean; static; inline;
    class function get_NameAccessAllowed: Boolean; static; inline;
    class function GetAccountPicture(kind: UserProfile_AccountPictureKind): IStorageFile; static; inline;
    class function SetAccountPictureAsync(image: IStorageFile): IAsyncOperation_1__UserProfile_SetAccountPictureResult; static; inline;
    class function SetAccountPicturesAsync(smallImage: IStorageFile; largeImage: IStorageFile; video: IStorageFile): IAsyncOperation_1__UserProfile_SetAccountPictureResult; static; inline;
    class function SetAccountPictureFromStreamAsync(image: IRandomAccessStream): IAsyncOperation_1__UserProfile_SetAccountPictureResult; static; inline;
    class function SetAccountPicturesFromStreamsAsync(smallImage: IRandomAccessStream; largeImage: IRandomAccessStream; video: IRandomAccessStream): IAsyncOperation_1__UserProfile_SetAccountPictureResult; static; inline;
    class function add_AccountPictureChanged(changeHandler: EventHandler_1__IInspectable): EventRegistrationToken; static; inline;
    class procedure remove_AccountPictureChanged(token: EventRegistrationToken); static; inline;
    class function GetDisplayNameAsync: IAsyncOperation_1__HSTRING; static; inline;
    class function GetFirstNameAsync: IAsyncOperation_1__HSTRING; static; inline;
    class function GetLastNameAsync: IAsyncOperation_1__HSTRING; static; inline;
    class function GetPrincipalNameAsync: IAsyncOperation_1__HSTRING; static; inline;
    class function GetSessionInitiationProtocolUriAsync: IAsyncOperation_1__IUriRuntimeClass; static; inline;
    class function GetDomainNameAsync: IAsyncOperation_1__HSTRING; static; inline;
    class property AccountPictureChangeEnabled: Boolean read get_AccountPictureChangeEnabled;
    class property NameAccessAllowed: Boolean read get_NameAccessAllowed;
  end;

  // Windows.System.UserProfile.LockScreen
  // DualAPI
  // Statics: "Windows.System.UserProfile.ILockScreenImageFeedStatics"
  // Statics: "Windows.System.UserProfile.ILockScreenStatics"
  TUserProfile_LockScreen = class(TWinRTGenericImportS2<UserProfile_ILockScreenImageFeedStatics, UserProfile_ILockScreenStatics>)
  public
    // -> UserProfile_ILockScreenImageFeedStatics
    class function RequestSetImageFeedAsync(syndicationFeedUri: IUriRuntimeClass): IAsyncOperation_1__UserProfile_SetImageFeedResult; static; inline;
    class function TryRemoveImageFeed: Boolean; static; inline;

    // -> UserProfile_ILockScreenStatics
    class function get_OriginalImageFile: IUriRuntimeClass; static; inline;
    class function GetImageStream: IRandomAccessStream; static; inline;
    class function SetImageFileAsync(value: IStorageFile): IAsyncAction; static; inline;
    class function SetImageStreamAsync(value: IRandomAccessStream): IAsyncAction; static; inline;
    class property OriginalImageFile: IUriRuntimeClass read get_OriginalImageFile;
  end;


implementation

  // Emit Classes Implementation
 { TDateTimeSettings }

class procedure TDateTimeSettings.SetSystemDateTime(utcDateTime: DateTime);
begin
  Statics.SetSystemDateTime(utcDateTime);
end;


 { TProcessLauncherOptions }

 { TProcessLauncher }

class function TProcessLauncher.RunToCompletionAsync(fileName: HSTRING; args: HSTRING): IAsyncOperation_1__IProcessLauncherResult;
begin
  Result := Statics.RunToCompletionAsync(fileName, args);
end;

class function TProcessLauncher.RunToCompletionAsync(fileName: HSTRING; args: HSTRING; options: IProcessLauncherOptions): IAsyncOperation_1__IProcessLauncherResult;
begin
  Result := Statics.RunToCompletionAsync(fileName, args, options);
end;


 { TShutdownManager }

class procedure TShutdownManager.BeginShutdown(shutdownKind: ShutdownKind; timeout: TimeSpan);
begin
  Statics.BeginShutdown(shutdownKind, timeout);
end;

class procedure TShutdownManager.CancelShutdown;
begin
  Statics.CancelShutdown;
end;


class function TShutdownManager.IsPowerStateSupported(powerState: PowerState): Boolean;
begin
  Result := Statics2.IsPowerStateSupported(powerState);
end;

class procedure TShutdownManager.EnterPowerState(powerState: PowerState);
begin
  Statics2.EnterPowerState(powerState);
end;

class procedure TShutdownManager.EnterPowerState(powerState: PowerState; wakeUpAfter: TimeSpan);
begin
  Statics2.EnterPowerState(powerState, wakeUpAfter);
end;


 { TDispatcherQueue }

class function TDispatcherQueue.GetForCurrentThread: IDispatcherQueue;
begin
  Result := Statics.GetForCurrentThread;
end;


 { TDispatcherQueueController }

class function TDispatcherQueueController.CreateOnDedicatedThread: IDispatcherQueueController;
begin
  Result := Statics.CreateOnDedicatedThread;
end;


 { TUser }

class function TUser.CreateWatcher: IUserWatcher;
begin
  Result := Statics.CreateWatcher;
end;

class function TUser.FindAllAsync: IAsyncOperation_1__IVectorView_1__IUser;
begin
  Result := Statics.FindAllAsync;
end;

class function TUser.FindAllAsync(&type: UserType): IAsyncOperation_1__IVectorView_1__IUser;
begin
  Result := Statics.FindAllAsync(&type);
end;

class function TUser.FindAllAsync(&type: UserType; status: UserAuthenticationStatus): IAsyncOperation_1__IVectorView_1__IUser;
begin
  Result := Statics.FindAllAsync(&type, status);
end;

class function TUser.GetFromId(nonRoamableId: HSTRING): IUser;
begin
  Result := Statics.GetFromId(nonRoamableId);
end;


 { TKnownUserProperties }

class function TKnownUserProperties.get_DisplayName: HSTRING;
begin
  Result := Statics.get_DisplayName;
end;

class function TKnownUserProperties.get_FirstName: HSTRING;
begin
  Result := Statics.get_FirstName;
end;

class function TKnownUserProperties.get_LastName: HSTRING;
begin
  Result := Statics.get_LastName;
end;

class function TKnownUserProperties.get_ProviderName: HSTRING;
begin
  Result := Statics.get_ProviderName;
end;

class function TKnownUserProperties.get_AccountName: HSTRING;
begin
  Result := Statics.get_AccountName;
end;

class function TKnownUserProperties.get_GuestHost: HSTRING;
begin
  Result := Statics.get_GuestHost;
end;

class function TKnownUserProperties.get_PrincipalName: HSTRING;
begin
  Result := Statics.get_PrincipalName;
end;

class function TKnownUserProperties.get_DomainName: HSTRING;
begin
  Result := Statics.get_DomainName;
end;

class function TKnownUserProperties.get_SessionInitiationProtocolUri: HSTRING;
begin
  Result := Statics.get_SessionInitiationProtocolUri;
end;


 { TUserPicker }

class function TUserPicker.IsSupported: Boolean;
begin
  Result := Statics.IsSupported;
end;


 { TUserDeviceAssociation }

class function TUserDeviceAssociation.FindUserFromDeviceId(deviceId: HSTRING): IUser;
begin
  Result := Statics.FindUserFromDeviceId(deviceId);
end;

class function TUserDeviceAssociation.add_UserDeviceAssociationChanged(handler: EventHandler_1__IUserDeviceAssociationChangedEventArgs): EventRegistrationToken;
begin
  Result := Statics.add_UserDeviceAssociationChanged(handler);
end;

class procedure TUserDeviceAssociation.remove_UserDeviceAssociationChanged(token: EventRegistrationToken);
begin
  Statics.remove_UserDeviceAssociationChanged(token);
end;


 { TUserProfile_DiagnosticsSettings }

class function TUserProfile_DiagnosticsSettings.GetDefault: UserProfile_IDiagnosticsSettings;
begin
  Result := Statics.GetDefault;
end;

class function TUserProfile_DiagnosticsSettings.GetForUser(user: IUser): UserProfile_IDiagnosticsSettings;
begin
  Result := Statics.GetForUser(user);
end;


 { TDiagnostics_TraceReporting_PlatformDiagnosticActions }

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.IsScenarioEnabled(scenarioId: TGuid): Boolean;
begin
  Result := Statics.IsScenarioEnabled(scenarioId);
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.TryEscalateScenario(scenarioId: TGuid; escalationType: Diagnostics_TraceReporting_PlatformDiagnosticEscalationType; outputDirectory: HSTRING; timestampOutputDirectory: Boolean; forceEscalationUpload: Boolean; triggers: IMapView_2__HSTRING__HSTRING): Boolean;
begin
  Result := Statics.TryEscalateScenario(scenarioId, escalationType, outputDirectory, timestampOutputDirectory, forceEscalationUpload, triggers);
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.DownloadLatestSettingsForNamespace(partner: HSTRING; feature: HSTRING; isScenarioNamespace: Boolean; downloadOverCostedNetwork: Boolean; downloadOverBattery: Boolean): Diagnostics_TraceReporting_PlatformDiagnosticActionState;
begin
  Result := Statics.DownloadLatestSettingsForNamespace(partner, feature, isScenarioNamespace, downloadOverCostedNetwork, downloadOverBattery);
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.GetActiveScenarioList: IVectorView_1__TGuid;
begin
  Result := Statics.GetActiveScenarioList;
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.ForceUpload(latency: Diagnostics_TraceReporting_PlatformDiagnosticEventBufferLatencies; uploadOverCostedNetwork: Boolean; uploadOverBattery: Boolean): Diagnostics_TraceReporting_PlatformDiagnosticActionState;
begin
  Result := Statics.ForceUpload(latency, uploadOverCostedNetwork, uploadOverBattery);
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.IsTraceRunning(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType; scenarioId: TGuid; traceProfileHash: UInt64): Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotState;
begin
  Result := Statics.IsTraceRunning(slotType, scenarioId, traceProfileHash);
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.GetActiveTraceRuntime(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType): Diagnostics_TraceReporting_IPlatformDiagnosticTraceRuntimeInfo;
begin
  Result := Statics.GetActiveTraceRuntime(slotType);
end;

class function TDiagnostics_TraceReporting_PlatformDiagnosticActions.GetKnownTraceList(slotType: Diagnostics_TraceReporting_PlatformDiagnosticTraceSlotType): IVectorView_1__Diagnostics_TraceReporting_IPlatformDiagnosticTraceInfo;
begin
  Result := Statics.GetKnownTraceList(slotType);
end;


 { TDiagnostics_Telemetry_PlatformTelemetryRegistrationSettings }

 { TDiagnostics_Telemetry_PlatformTelemetryClient }

class function TDiagnostics_Telemetry_PlatformTelemetryClient.Register(id: HSTRING): Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult;
begin
  Result := Statics.Register(id);
end;

class function TDiagnostics_Telemetry_PlatformTelemetryClient.Register(id: HSTRING; settings: Diagnostics_Telemetry_IPlatformTelemetryRegistrationSettings): Diagnostics_Telemetry_IPlatformTelemetryRegistrationResult;
begin
  Result := Statics.Register(id, settings);
end;


 { TUserProfile_UserProfilePersonalizationSettings }

class function TUserProfile_UserProfilePersonalizationSettings.get_Current: UserProfile_IUserProfilePersonalizationSettings;
begin
  Result := Statics.get_Current;
end;

class function TUserProfile_UserProfilePersonalizationSettings.IsSupported: Boolean;
begin
  Result := Statics.IsSupported;
end;


 { TDiagnostics_ProcessDiagnosticInfo }

class function TDiagnostics_ProcessDiagnosticInfo.GetForProcesses: IVectorView_1__Diagnostics_IProcessDiagnosticInfo;
begin
  Result := Statics.GetForProcesses;
end;

class function TDiagnostics_ProcessDiagnosticInfo.GetForCurrentProcess: Diagnostics_IProcessDiagnosticInfo;
begin
  Result := Statics.GetForCurrentProcess;
end;


class function TDiagnostics_ProcessDiagnosticInfo.TryGetForProcessId(processId: Cardinal): Diagnostics_IProcessDiagnosticInfo;
begin
  Result := Statics2.TryGetForProcessId(processId);
end;


 { TDiagnostics_SystemDiagnosticInfo }

class function TDiagnostics_SystemDiagnosticInfo.GetForCurrentSystem: Diagnostics_ISystemDiagnosticInfo;
begin
  Result := Statics.GetForCurrentSystem;
end;


 { TUserProfile_GlobalizationPreferences }

class function TUserProfile_GlobalizationPreferences.get_Calendars: IVectorView_1__HSTRING;
begin
  Result := Statics.get_Calendars;
end;

class function TUserProfile_GlobalizationPreferences.get_Clocks: IVectorView_1__HSTRING;
begin
  Result := Statics.get_Clocks;
end;

class function TUserProfile_GlobalizationPreferences.get_Currencies: IVectorView_1__HSTRING;
begin
  Result := Statics.get_Currencies;
end;

class function TUserProfile_GlobalizationPreferences.get_Languages: IVectorView_1__HSTRING;
begin
  Result := Statics.get_Languages;
end;

class function TUserProfile_GlobalizationPreferences.get_HomeGeographicRegion: HSTRING;
begin
  Result := Statics.get_HomeGeographicRegion;
end;

class function TUserProfile_GlobalizationPreferences.get_WeekStartsOn: DayOfWeek;
begin
  Result := Statics.get_WeekStartsOn;
end;


class function TUserProfile_GlobalizationPreferences.TrySetHomeGeographicRegion(region: HSTRING): Boolean;
begin
  Result := Statics2.TrySetHomeGeographicRegion(region);
end;

class function TUserProfile_GlobalizationPreferences.TrySetLanguages(languageTags: IIterable_1__HSTRING): Boolean;
begin
  Result := Statics2.TrySetLanguages(languageTags);
end;


 { TAppDiagnosticInfo }

class function TAppDiagnosticInfo.RequestInfoAsync: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo;
begin
  Result := Statics.RequestInfoAsync;
end;


class function TAppDiagnosticInfo.CreateWatcher: IAppDiagnosticInfoWatcher;
begin
  Result := Statics2.CreateWatcher;
end;

class function TAppDiagnosticInfo.RequestAccessAsync: IAsyncOperation_1__DiagnosticAccessStatus;
begin
  Result := Statics2.RequestAccessAsync;
end;

class function TAppDiagnosticInfo.RequestInfoForPackageAsync(packageFamilyName: HSTRING): IAsyncOperation_1__IVector_1__IAppDiagnosticInfo;
begin
  Result := Statics2.RequestInfoForPackageAsync(packageFamilyName);
end;

class function TAppDiagnosticInfo.RequestInfoForAppAsync: IAsyncOperation_1__IVector_1__IAppDiagnosticInfo;
begin
  Result := Statics2.RequestInfoForAppAsync;
end;

class function TAppDiagnosticInfo.RequestInfoForAppAsync(appUserModelId: HSTRING): IAsyncOperation_1__IVector_1__IAppDiagnosticInfo;
begin
  Result := Statics2.RequestInfoForAppAsync(appUserModelId);
end;


 { TProfile_PlatformDiagnosticsAndUsageDataSettings }

class function TProfile_PlatformDiagnosticsAndUsageDataSettings.get_CollectionLevel: Profile_PlatformDataCollectionLevel;
begin
  Result := Statics.get_CollectionLevel;
end;

class function TProfile_PlatformDiagnosticsAndUsageDataSettings.add_CollectionLevelChanged(handler: EventHandler_1__IInspectable): EventRegistrationToken;
begin
  Result := Statics.add_CollectionLevelChanged(handler);
end;

class procedure TProfile_PlatformDiagnosticsAndUsageDataSettings.remove_CollectionLevelChanged(token: EventRegistrationToken);
begin
  Statics.remove_CollectionLevelChanged(token);
end;

class function TProfile_PlatformDiagnosticsAndUsageDataSettings.CanCollectDiagnostics(level: Profile_PlatformDataCollectionLevel): Boolean;
begin
  Result := Statics.CanCollectDiagnostics(level);
end;


 { TUserProfile_FirstSignInSettings }

class function TUserProfile_FirstSignInSettings.GetDefault: UserProfile_IFirstSignInSettings;
begin
  Result := Statics.GetDefault;
end;


 { TProfile_SharedModeSettings }

class function TProfile_SharedModeSettings.get_IsEnabled: Boolean;
begin
  Result := Statics.get_IsEnabled;
end;


class function TProfile_SharedModeSettings.get_ShouldAvoidLocalStorage: Boolean;
begin
  Result := Statics2.get_ShouldAvoidLocalStorage;
end;


 { TUserProfile_UserInformation }

class function TUserProfile_UserInformation.get_AccountPictureChangeEnabled: Boolean;
begin
  Result := Statics.get_AccountPictureChangeEnabled;
end;

class function TUserProfile_UserInformation.get_NameAccessAllowed: Boolean;
begin
  Result := Statics.get_NameAccessAllowed;
end;

class function TUserProfile_UserInformation.GetAccountPicture(kind: UserProfile_AccountPictureKind): IStorageFile;
begin
  Result := Statics.GetAccountPicture(kind);
end;

class function TUserProfile_UserInformation.SetAccountPictureAsync(image: IStorageFile): IAsyncOperation_1__UserProfile_SetAccountPictureResult;
begin
  Result := Statics.SetAccountPictureAsync(image);
end;

class function TUserProfile_UserInformation.SetAccountPicturesAsync(smallImage: IStorageFile; largeImage: IStorageFile; video: IStorageFile): IAsyncOperation_1__UserProfile_SetAccountPictureResult;
begin
  Result := Statics.SetAccountPicturesAsync(smallImage, largeImage, video);
end;

class function TUserProfile_UserInformation.SetAccountPictureFromStreamAsync(image: IRandomAccessStream): IAsyncOperation_1__UserProfile_SetAccountPictureResult;
begin
  Result := Statics.SetAccountPictureFromStreamAsync(image);
end;

class function TUserProfile_UserInformation.SetAccountPicturesFromStreamsAsync(smallImage: IRandomAccessStream; largeImage: IRandomAccessStream; video: IRandomAccessStream): IAsyncOperation_1__UserProfile_SetAccountPictureResult;
begin
  Result := Statics.SetAccountPicturesFromStreamsAsync(smallImage, largeImage, video);
end;

class function TUserProfile_UserInformation.add_AccountPictureChanged(changeHandler: EventHandler_1__IInspectable): EventRegistrationToken;
begin
  Result := Statics.add_AccountPictureChanged(changeHandler);
end;

class procedure TUserProfile_UserInformation.remove_AccountPictureChanged(token: EventRegistrationToken);
begin
  Statics.remove_AccountPictureChanged(token);
end;

class function TUserProfile_UserInformation.GetDisplayNameAsync: IAsyncOperation_1__HSTRING;
begin
  Result := Statics.GetDisplayNameAsync;
end;

class function TUserProfile_UserInformation.GetFirstNameAsync: IAsyncOperation_1__HSTRING;
begin
  Result := Statics.GetFirstNameAsync;
end;

class function TUserProfile_UserInformation.GetLastNameAsync: IAsyncOperation_1__HSTRING;
begin
  Result := Statics.GetLastNameAsync;
end;

class function TUserProfile_UserInformation.GetPrincipalNameAsync: IAsyncOperation_1__HSTRING;
begin
  Result := Statics.GetPrincipalNameAsync;
end;

class function TUserProfile_UserInformation.GetSessionInitiationProtocolUriAsync: IAsyncOperation_1__IUriRuntimeClass;
begin
  Result := Statics.GetSessionInitiationProtocolUriAsync;
end;

class function TUserProfile_UserInformation.GetDomainNameAsync: IAsyncOperation_1__HSTRING;
begin
  Result := Statics.GetDomainNameAsync;
end;


 { TUserProfile_LockScreen }

class function TUserProfile_LockScreen.RequestSetImageFeedAsync(syndicationFeedUri: IUriRuntimeClass): IAsyncOperation_1__UserProfile_SetImageFeedResult;
begin
  Result := Statics.RequestSetImageFeedAsync(syndicationFeedUri);
end;

class function TUserProfile_LockScreen.TryRemoveImageFeed: Boolean;
begin
  Result := Statics.TryRemoveImageFeed;
end;


class function TUserProfile_LockScreen.get_OriginalImageFile: IUriRuntimeClass;
begin
  Result := Statics2.get_OriginalImageFile;
end;

class function TUserProfile_LockScreen.GetImageStream: IRandomAccessStream;
begin
  Result := Statics2.GetImageStream;
end;

class function TUserProfile_LockScreen.SetImageFileAsync(value: IStorageFile): IAsyncAction;
begin
  Result := Statics2.SetImageFileAsync(value);
end;

class function TUserProfile_LockScreen.SetImageStreamAsync(value: IRandomAccessStream): IAsyncAction;
begin
  Result := Statics2.SetImageStreamAsync(value);
end;



end.
