{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Networking.NetworkOperators;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.Networking.Connectivity, 
  Winapi.Devices, 
  Winapi.ServicesRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Networking.NetworkOperators.INetworkOperatorNotificationEventDetails
  INetworkOperatorNotificationEventDetails = interface;
  PINetworkOperatorNotificationEventDetails = ^INetworkOperatorNotificationEventDetails;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringEntitlementCheck
  INetworkOperatorTetheringEntitlementCheck = interface;
  PINetworkOperatorTetheringEntitlementCheck = ^INetworkOperatorTetheringEntitlementCheck;

  // Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
  IMobileBroadbandNetwork = interface;
  PIMobileBroadbandNetwork = ^IMobileBroadbandNetwork;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
  IMobileBroadbandDeviceInformation = interface;
  PIMobileBroadbandDeviceInformation = ^IMobileBroadbandDeviceInformation;

  // Windows.Networking.NetworkOperators.IMobileBroadbandAccount
  IMobileBroadbandAccount = interface;
  PIMobileBroadbandAccount = ^IMobileBroadbandAccount;

  // Windows.Networking.NetworkOperators.IMobileBroadbandAccountStatics
  IMobileBroadbandAccountStatics = interface;
  PIMobileBroadbandAccountStatics = ^IMobileBroadbandAccountStatics;

  // Windows.Networking.NetworkOperators.IMobileBroadbandAccount2
  IMobileBroadbandAccount2 = interface;
  PIMobileBroadbandAccount2 = ^IMobileBroadbandAccount2;

  // Windows.Networking.NetworkOperators.IMobileBroadbandAccount3
  IMobileBroadbandAccount3 = interface;
  PIMobileBroadbandAccount3 = ^IMobileBroadbandAccount3;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IIterator_1__MobileBroadbandPinType = interface;
  PIIterator_1__MobileBroadbandPinType = ^IIterator_1__MobileBroadbandPinType;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IIterable_1__MobileBroadbandPinType = interface;
  PIIterable_1__MobileBroadbandPinType = ^IIterable_1__MobileBroadbandPinType;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IVectorView_1__MobileBroadbandPinType = interface;
  PIVectorView_1__MobileBroadbandPinType = ^IVectorView_1__MobileBroadbandPinType;

  // Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult
  IMobileBroadbandPinOperationResult = interface;
  PIMobileBroadbandPinOperationResult = ^IMobileBroadbandPinOperationResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult = ^AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  IAsyncOperation_1__IMobileBroadbandPinOperationResult = interface;
  PIAsyncOperation_1__IMobileBroadbandPinOperationResult = ^IAsyncOperation_1__IMobileBroadbandPinOperationResult;

  // Windows.Networking.NetworkOperators.IMobileBroadbandPin
  IMobileBroadbandPin = interface;
  PIMobileBroadbandPin = ^IMobileBroadbandPin;

  // Windows.Networking.NetworkOperators.IMobileBroadbandPinManager
  IMobileBroadbandPinManager = interface;
  PIMobileBroadbandPinManager = ^IMobileBroadbandPinManager;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation2
  IMobileBroadbandDeviceInformation2 = interface;
  PIMobileBroadbandDeviceInformation2 = ^IMobileBroadbandDeviceInformation2;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation3
  IMobileBroadbandDeviceInformation3 = interface;
  PIMobileBroadbandDeviceInformation3 = ^IMobileBroadbandDeviceInformation3;

  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult
  IMobileBroadbandUiccAppRecordDetailsResult = interface;
  PIMobileBroadbandUiccAppRecordDetailsResult = ^IMobileBroadbandUiccAppRecordDetailsResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult = ^AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult = interface;
  PIAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult = ^IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult;

  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult
  IMobileBroadbandUiccAppReadRecordResult = interface;
  PIMobileBroadbandUiccAppReadRecordResult = ^IMobileBroadbandUiccAppReadRecordResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult = ^AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult = interface;
  PIAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult = ^IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult;

  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
  IMobileBroadbandUiccApp = interface;
  PIMobileBroadbandUiccApp = ^IMobileBroadbandUiccApp;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IIterator_1__IMobileBroadbandUiccApp = interface;
  PIIterator_1__IMobileBroadbandUiccApp = ^IIterator_1__IMobileBroadbandUiccApp;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IIterable_1__IMobileBroadbandUiccApp = interface;
  PIIterable_1__IMobileBroadbandUiccApp = ^IIterable_1__IMobileBroadbandUiccApp;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IVectorView_1__IMobileBroadbandUiccApp = interface;
  PIVectorView_1__IMobileBroadbandUiccApp = ^IVectorView_1__IMobileBroadbandUiccApp;

  // Windows.Networking.NetworkOperators.IMobileBroadbandNetwork2
  IMobileBroadbandNetwork2 = interface;
  PIMobileBroadbandNetwork2 = ^IMobileBroadbandNetwork2;

  // Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
  IMobileBroadbandCellCdma = interface;
  PIMobileBroadbandCellCdma = ^IMobileBroadbandCellCdma;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IIterator_1__IMobileBroadbandCellCdma = interface;
  PIIterator_1__IMobileBroadbandCellCdma = ^IIterator_1__IMobileBroadbandCellCdma;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IIterable_1__IMobileBroadbandCellCdma = interface;
  PIIterable_1__IMobileBroadbandCellCdma = ^IIterable_1__IMobileBroadbandCellCdma;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IVectorView_1__IMobileBroadbandCellCdma = interface;
  PIVectorView_1__IMobileBroadbandCellCdma = ^IVectorView_1__IMobileBroadbandCellCdma;

  // Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
  IMobileBroadbandCellGsm = interface;
  PIMobileBroadbandCellGsm = ^IMobileBroadbandCellGsm;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IIterator_1__IMobileBroadbandCellGsm = interface;
  PIIterator_1__IMobileBroadbandCellGsm = ^IIterator_1__IMobileBroadbandCellGsm;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IIterable_1__IMobileBroadbandCellGsm = interface;
  PIIterable_1__IMobileBroadbandCellGsm = ^IIterable_1__IMobileBroadbandCellGsm;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IVectorView_1__IMobileBroadbandCellGsm = interface;
  PIVectorView_1__IMobileBroadbandCellGsm = ^IVectorView_1__IMobileBroadbandCellGsm;

  // Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
  IMobileBroadbandCellLte = interface;
  PIMobileBroadbandCellLte = ^IMobileBroadbandCellLte;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IIterator_1__IMobileBroadbandCellLte = interface;
  PIIterator_1__IMobileBroadbandCellLte = ^IIterator_1__IMobileBroadbandCellLte;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IIterable_1__IMobileBroadbandCellLte = interface;
  PIIterable_1__IMobileBroadbandCellLte = ^IIterable_1__IMobileBroadbandCellLte;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IVectorView_1__IMobileBroadbandCellLte = interface;
  PIVectorView_1__IMobileBroadbandCellLte = ^IVectorView_1__IMobileBroadbandCellLte;

  // Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
  IMobileBroadbandCellTdscdma = interface;
  PIMobileBroadbandCellTdscdma = ^IMobileBroadbandCellTdscdma;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IIterator_1__IMobileBroadbandCellTdscdma = interface;
  PIIterator_1__IMobileBroadbandCellTdscdma = ^IIterator_1__IMobileBroadbandCellTdscdma;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IIterable_1__IMobileBroadbandCellTdscdma = interface;
  PIIterable_1__IMobileBroadbandCellTdscdma = ^IIterable_1__IMobileBroadbandCellTdscdma;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IVectorView_1__IMobileBroadbandCellTdscdma = interface;
  PIVectorView_1__IMobileBroadbandCellTdscdma = ^IVectorView_1__IMobileBroadbandCellTdscdma;

  // Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
  IMobileBroadbandCellUmts = interface;
  PIMobileBroadbandCellUmts = ^IMobileBroadbandCellUmts;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IIterator_1__IMobileBroadbandCellUmts = interface;
  PIIterator_1__IMobileBroadbandCellUmts = ^IIterator_1__IMobileBroadbandCellUmts;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IIterable_1__IMobileBroadbandCellUmts = interface;
  PIIterable_1__IMobileBroadbandCellUmts = ^IIterable_1__IMobileBroadbandCellUmts;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IVectorView_1__IMobileBroadbandCellUmts = interface;
  PIVectorView_1__IMobileBroadbandCellUmts = ^IVectorView_1__IMobileBroadbandCellUmts;

  // Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo
  IMobileBroadbandCellsInfo = interface;
  PIMobileBroadbandCellsInfo = ^IMobileBroadbandCellsInfo;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo = ^AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  IAsyncOperation_1__IMobileBroadbandCellsInfo = interface;
  PIAsyncOperation_1__IMobileBroadbandCellsInfo = ^IAsyncOperation_1__IMobileBroadbandCellsInfo;

  // Windows.Networking.NetworkOperators.IMobileBroadbandNetwork3
  IMobileBroadbandNetwork3 = interface;
  PIMobileBroadbandNetwork3 = ^IMobileBroadbandNetwork3;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration
  INetworkOperatorTetheringAccessPointConfiguration = interface;
  PINetworkOperatorTetheringAccessPointConfiguration = ^INetworkOperatorTetheringAccessPointConfiguration;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult
  INetworkOperatorTetheringOperationResult = interface;
  PINetworkOperatorTetheringOperationResult = ^INetworkOperatorTetheringOperationResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult = interface;
  PAsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult = ^AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  IAsyncOperation_1__INetworkOperatorTetheringOperationResult = interface;
  PIAsyncOperation_1__INetworkOperatorTetheringOperationResult = ^IAsyncOperation_1__INetworkOperatorTetheringOperationResult;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
  INetworkOperatorTetheringManager = interface;
  PINetworkOperatorTetheringManager = ^INetworkOperatorTetheringManager;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics
  INetworkOperatorTetheringManagerStatics = interface;
  PINetworkOperatorTetheringManagerStatics = ^INetworkOperatorTetheringManagerStatics;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics2
  INetworkOperatorTetheringManagerStatics2 = interface;
  PINetworkOperatorTetheringManagerStatics2 = ^INetworkOperatorTetheringManagerStatics2;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics3
  INetworkOperatorTetheringManagerStatics3 = interface;
  PINetworkOperatorTetheringManagerStatics3 = ^INetworkOperatorTetheringManagerStatics3;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
  INetworkOperatorTetheringClient = interface;
  PINetworkOperatorTetheringClient = ^INetworkOperatorTetheringClient;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IIterator_1__INetworkOperatorTetheringClient = interface;
  PIIterator_1__INetworkOperatorTetheringClient = ^IIterator_1__INetworkOperatorTetheringClient;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IIterable_1__INetworkOperatorTetheringClient = interface;
  PIIterable_1__INetworkOperatorTetheringClient = ^IIterable_1__INetworkOperatorTetheringClient;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IVectorView_1__INetworkOperatorTetheringClient = interface;
  PIVectorView_1__INetworkOperatorTetheringClient = ^IVectorView_1__INetworkOperatorTetheringClient;

  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringClientManager
  INetworkOperatorTetheringClientManager = interface;
  PINetworkOperatorTetheringClientManager = ^INetworkOperatorTetheringClientManager;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
  IMobileBroadbandDeviceServiceInformation = interface;
  PIMobileBroadbandDeviceServiceInformation = ^IMobileBroadbandDeviceServiceInformation;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IIterator_1__IMobileBroadbandDeviceServiceInformation = interface;
  PIIterator_1__IMobileBroadbandDeviceServiceInformation = ^IIterator_1__IMobileBroadbandDeviceServiceInformation;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IIterable_1__IMobileBroadbandDeviceServiceInformation = interface;
  PIIterable_1__IMobileBroadbandDeviceServiceInformation = ^IIterable_1__IMobileBroadbandDeviceServiceInformation;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IVectorView_1__IMobileBroadbandDeviceServiceInformation = interface;
  PIVectorView_1__IMobileBroadbandDeviceServiceInformation = ^IVectorView_1__IMobileBroadbandDeviceServiceInformation;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs
  IMobileBroadbandDeviceServiceDataReceivedEventArgs = interface;
  PIMobileBroadbandDeviceServiceDataReceivedEventArgs = ^IMobileBroadbandDeviceServiceDataReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession,Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs>
  TypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs = interface;
  PTypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs = ^TypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
  IMobileBroadbandDeviceServiceDataSession = interface;
  PIMobileBroadbandDeviceServiceDataSession = ^IMobileBroadbandDeviceServiceDataSession;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult
  IMobileBroadbandDeviceServiceCommandResult = interface;
  PIMobileBroadbandDeviceServiceCommandResult = ^IMobileBroadbandDeviceServiceCommandResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult = ^AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult = interface;
  PIAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult = ^IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandSession
  IMobileBroadbandDeviceServiceCommandSession = interface;
  PIMobileBroadbandDeviceServiceCommandSession = ^IMobileBroadbandDeviceServiceCommandSession;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceService
  IMobileBroadbandDeviceService = interface;
  PIMobileBroadbandDeviceService = ^IMobileBroadbandDeviceService;

  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult
  IMobileBroadbandUiccAppsResult = interface;
  PIMobileBroadbandUiccAppsResult = ^IMobileBroadbandUiccAppsResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult = ^AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppsResult = interface;
  PIAsyncOperation_1__IMobileBroadbandUiccAppsResult = ^IAsyncOperation_1__IMobileBroadbandUiccAppsResult;

  // Windows.Networking.NetworkOperators.IMobileBroadbandUicc
  IMobileBroadbandUicc = interface;
  PIMobileBroadbandUicc = ^IMobileBroadbandUicc;

  // Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration
  IMobileBroadbandModemConfiguration = interface;
  PIMobileBroadbandModemConfiguration = ^IMobileBroadbandModemConfiguration;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration = interface;
  PAsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration = ^AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  IAsyncOperation_1__IMobileBroadbandModemConfiguration = interface;
  PIAsyncOperation_1__IMobileBroadbandModemConfiguration = ^IAsyncOperation_1__IMobileBroadbandModemConfiguration;

  // Windows.Networking.NetworkOperators.IMobileBroadbandModem
  IMobileBroadbandModem = interface;
  PIMobileBroadbandModem = ^IMobileBroadbandModem;

  // Windows.Networking.NetworkOperators.IMobileBroadbandModemStatics
  IMobileBroadbandModemStatics = interface;
  PIMobileBroadbandModemStatics = ^IMobileBroadbandModemStatics;

  // Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
  IMobileBroadbandAntennaSar = interface;
  PIMobileBroadbandAntennaSar = ^IMobileBroadbandAntennaSar;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IIterator_1__IMobileBroadbandAntennaSar = interface;
  PIIterator_1__IMobileBroadbandAntennaSar = ^IIterator_1__IMobileBroadbandAntennaSar;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IIterable_1__IMobileBroadbandAntennaSar = interface;
  PIIterable_1__IMobileBroadbandAntennaSar = ^IIterable_1__IMobileBroadbandAntennaSar;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IVectorView_1__IMobileBroadbandAntennaSar = interface;
  PIVectorView_1__IMobileBroadbandAntennaSar = ^IVectorView_1__IMobileBroadbandAntennaSar;

  // Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs
  IMobileBroadbandTransmissionStateChangedEventArgs = interface;
  PIMobileBroadbandTransmissionStateChangedEventArgs = ^IMobileBroadbandTransmissionStateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandSarManager,Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs>
  TypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs = interface;
  PTypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs = ^TypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs;

  // Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
  IMobileBroadbandSarManager = interface;
  PIMobileBroadbandSarManager = ^IMobileBroadbandSarManager;

  // Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration2
  IMobileBroadbandModemConfiguration2 = interface;
  PIMobileBroadbandModemConfiguration2 = ^IMobileBroadbandModemConfiguration2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus = interface;
  PAsyncOperationCompletedHandler_1__MobileBroadbandModemStatus = ^AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  IAsyncOperation_1__MobileBroadbandModemStatus = interface;
  PIAsyncOperation_1__MobileBroadbandModemStatus = ^IAsyncOperation_1__MobileBroadbandModemStatus;

  // Windows.Networking.NetworkOperators.IMobileBroadbandModem2
  IMobileBroadbandModem2 = interface;
  PIMobileBroadbandModem2 = ^IMobileBroadbandModem2;

  // Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
  IMobileBroadbandNetworkRegistrationStateChange = interface;
  PIMobileBroadbandNetworkRegistrationStateChange = ^IMobileBroadbandNetworkRegistrationStateChange;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IIterator_1__IMobileBroadbandNetworkRegistrationStateChange = interface;
  PIIterator_1__IMobileBroadbandNetworkRegistrationStateChange = ^IIterator_1__IMobileBroadbandNetworkRegistrationStateChange;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IIterable_1__IMobileBroadbandNetworkRegistrationStateChange = interface;
  PIIterable_1__IMobileBroadbandNetworkRegistrationStateChange = ^IIterable_1__IMobileBroadbandNetworkRegistrationStateChange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IVectorView_1__IMobileBroadbandNetworkRegistrationStateChange = interface;
  PIVectorView_1__IMobileBroadbandNetworkRegistrationStateChange = ^IVectorView_1__IMobileBroadbandNetworkRegistrationStateChange;

  // Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails
  IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails = interface;
  PIMobileBroadbandNetworkRegistrationStateChangeTriggerDetails = ^IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails;

  // Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
  IMobileBroadbandRadioStateChange = interface;
  PIMobileBroadbandRadioStateChange = ^IMobileBroadbandRadioStateChange;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IIterator_1__IMobileBroadbandRadioStateChange = interface;
  PIIterator_1__IMobileBroadbandRadioStateChange = ^IIterator_1__IMobileBroadbandRadioStateChange;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IIterable_1__IMobileBroadbandRadioStateChange = interface;
  PIIterable_1__IMobileBroadbandRadioStateChange = ^IIterable_1__IMobileBroadbandRadioStateChange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IVectorView_1__IMobileBroadbandRadioStateChange = interface;
  PIVectorView_1__IMobileBroadbandRadioStateChange = ^IVectorView_1__IMobileBroadbandRadioStateChange;

  // Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChangeTriggerDetails
  IMobileBroadbandRadioStateChangeTriggerDetails = interface;
  PIMobileBroadbandRadioStateChangeTriggerDetails = ^IMobileBroadbandRadioStateChangeTriggerDetails;

  // Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
  IMobileBroadbandPinLockStateChange = interface;
  PIMobileBroadbandPinLockStateChange = ^IMobileBroadbandPinLockStateChange;

  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IIterator_1__IMobileBroadbandPinLockStateChange = interface;
  PIIterator_1__IMobileBroadbandPinLockStateChange = ^IIterator_1__IMobileBroadbandPinLockStateChange;

  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IIterable_1__IMobileBroadbandPinLockStateChange = interface;
  PIIterable_1__IMobileBroadbandPinLockStateChange = ^IIterable_1__IMobileBroadbandPinLockStateChange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IVectorView_1__IMobileBroadbandPinLockStateChange = interface;
  PIVectorView_1__IMobileBroadbandPinLockStateChange = ^IVectorView_1__IMobileBroadbandPinLockStateChange;

  // Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChangeTriggerDetails
  IMobileBroadbandPinLockStateChangeTriggerDetails = interface;
  PIMobileBroadbandPinLockStateChangeTriggerDetails = ^IMobileBroadbandPinLockStateChangeTriggerDetails;

  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceTriggerDetails
  IMobileBroadbandDeviceServiceTriggerDetails = interface;
  PIMobileBroadbandDeviceServiceTriggerDetails = ^IMobileBroadbandDeviceServiceTriggerDetails;

  // Windows.Networking.NetworkOperators.IKnownCSimFilePathsStatics
  IKnownCSimFilePathsStatics = interface;
  PIKnownCSimFilePathsStatics = ^IKnownCSimFilePathsStatics;

  // Windows.Networking.NetworkOperators.IKnownRuimFilePathsStatics
  IKnownRuimFilePathsStatics = interface;
  PIKnownRuimFilePathsStatics = ^IKnownRuimFilePathsStatics;

  // Windows.Networking.NetworkOperators.IKnownSimFilePathsStatics
  IKnownSimFilePathsStatics = interface;
  PIKnownSimFilePathsStatics = ^IKnownSimFilePathsStatics;

  // Windows.Networking.NetworkOperators.IKnownUSimFilePathsStatics
  IKnownUSimFilePathsStatics = interface;
  PIKnownUSimFilePathsStatics = ^IKnownUSimFilePathsStatics;

  // Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult
  IHotspotCredentialsAuthenticationResult = interface;
  PIHotspotCredentialsAuthenticationResult = ^IHotspotCredentialsAuthenticationResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult = interface;
  PAsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult = ^AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  IAsyncOperation_1__IHotspotCredentialsAuthenticationResult = interface;
  PIAsyncOperation_1__IHotspotCredentialsAuthenticationResult = ^IAsyncOperation_1__IHotspotCredentialsAuthenticationResult;

  // Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults
  IProvisionFromXmlDocumentResults = interface;
  PIProvisionFromXmlDocumentResults = ^IProvisionFromXmlDocumentResults;

  // Windows.Networking.NetworkOperators.IProvisionedProfile
  IProvisionedProfile = interface;
  PIProvisionedProfile = ^IProvisionedProfile;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults = interface;
  PAsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults = ^AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  IAsyncOperation_1__IProvisionFromXmlDocumentResults = interface;
  PIAsyncOperation_1__IProvisionFromXmlDocumentResults = ^IAsyncOperation_1__IProvisionFromXmlDocumentResults;

  // Windows.Networking.NetworkOperators.IProvisioningAgent
  IProvisioningAgent = interface;
  PIProvisioningAgent = ^IProvisioningAgent;

  // Windows.Networking.NetworkOperators.IProvisioningAgentStaticMethods
  IProvisioningAgentStaticMethods = interface;
  PIProvisioningAgentStaticMethods = ^IProvisioningAgentStaticMethods;

  // Windows.Networking.NetworkOperators.IUssdMessage
  IUssdMessage = interface;
  PIUssdMessage = ^IUssdMessage;

  // Windows.Networking.NetworkOperators.IUssdMessageFactory
  IUssdMessageFactory = interface;
  PIUssdMessageFactory = ^IUssdMessageFactory;

  // Windows.Networking.NetworkOperators.IUssdReply
  IUssdReply = interface;
  PIUssdReply = ^IUssdReply;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IUssdReply>
  AsyncOperationCompletedHandler_1__IUssdReply = interface;
  PAsyncOperationCompletedHandler_1__IUssdReply = ^AsyncOperationCompletedHandler_1__IUssdReply;

  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IUssdReply>
  IAsyncOperation_1__IUssdReply = interface;
  PIAsyncOperation_1__IUssdReply = ^IAsyncOperation_1__IUssdReply;

  // Windows.Networking.NetworkOperators.IUssdSession
  IUssdSession = interface;
  PIUssdSession = ^IUssdSession;

  // Windows.Networking.NetworkOperators.IUssdSessionStatics
  IUssdSessionStatics = interface;
  PIUssdSessionStatics = ^IUssdSessionStatics;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Networking.NetworkOperators Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.NetworkOperatorEventMessageType
  // Used Types:  String
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.Sms.ISmsMessage
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorNotificationEventDetails
  [WinRTClassNameAttribute(SNetworkOperatorNotificationEventDetails)]
  INetworkOperatorNotificationEventDetails = interface(IInspectable)
  ['{BC68A9D1-82E1-4488-9F2C-1276C2468FAC}']
    function get_NotificationType: NetworkOperatorEventMessageType; safecall;
    function get_NetworkAccountId: HSTRING; safecall;
    function get_EncodingType: Byte; safecall;
    function get_Message: HSTRING; safecall;
    function get_RuleId: HSTRING; safecall;
    function get_SmsMessage: ISmsMessage; safecall;
    property EncodingType: Byte read get_EncodingType;
    property Message: HSTRING read get_Message;
    property NetworkAccountId: HSTRING read get_NetworkAccountId;
    property NotificationType: NetworkOperatorEventMessageType read get_NotificationType;
    property RuleId: HSTRING read get_RuleId;
    property SmsMessage: ISmsMessage read get_SmsMessage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringEntitlementCheck
  INetworkOperatorTetheringEntitlementCheck = interface(IInspectable)
  ['{0108916D-9E9A-4AF6-8DA3-60493B19C204}']
    procedure AuthorizeTethering(allow: Boolean; entitlementFailureReason: HSTRING); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.Connectivity.INetworkAdapter
  // Used Types:  Windows.Networking.NetworkOperators.NetworkRegistrationState
  // Used Types:  UInt32
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.DataClasses
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
  [WinRTClassNameAttribute(SMobileBroadbandNetwork)]
  IMobileBroadbandNetwork = interface(IInspectable)
  ['{CB63928C-0309-4CB6-A8C1-6A5A3C8E1FF6}']
    function get_NetworkAdapter: INetworkAdapter; safecall;
    function get_NetworkRegistrationState: NetworkRegistrationState; safecall;
    function get_RegistrationNetworkError: Cardinal; safecall;
    function get_PacketAttachNetworkError: Cardinal; safecall;
    function get_ActivationNetworkError: Cardinal; safecall;
    function get_AccessPointName: HSTRING; safecall;
    function get_RegisteredDataClass: DataClasses; safecall;
    function get_RegisteredProviderId: HSTRING; safecall;
    function get_RegisteredProviderName: HSTRING; safecall;
    procedure ShowConnectionUI; safecall;
    property AccessPointName: HSTRING read get_AccessPointName;
    property ActivationNetworkError: Cardinal read get_ActivationNetworkError;
    property NetworkAdapter: INetworkAdapter read get_NetworkAdapter;
    property NetworkRegistrationState: NetworkRegistrationState read get_NetworkRegistrationState;
    property PacketAttachNetworkError: Cardinal read get_PacketAttachNetworkError;
    property RegisteredDataClass: DataClasses read get_RegisteredDataClass;
    property RegisteredProviderId: HSTRING read get_RegisteredProviderId;
    property RegisteredProviderName: HSTRING read get_RegisteredProviderName;
    property RegistrationNetworkError: Cardinal read get_RegistrationNetworkError;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.NetworkDeviceStatus
  // Used Types:  String
  // Used Types:  Windows.Devices.Sms.CellularClass
  // Used Types:  Windows.Networking.NetworkOperators.DataClasses
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandDeviceType
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandRadioState
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
  [WinRTClassNameAttribute(SMobileBroadbandDeviceInformation)]
  IMobileBroadbandDeviceInformation = interface(IInspectable)
  ['{E6D08168-E381-4C6E-9BE8-FE156969A446}']
    function get_NetworkDeviceStatus: NetworkDeviceStatus; safecall;
    function get_Manufacturer: HSTRING; safecall;
    function get_Model: HSTRING; safecall;
    function get_FirmwareInformation: HSTRING; safecall;
    function get_CellularClass: CellularClass; safecall;
    function get_DataClasses: DataClasses; safecall;
    function get_CustomDataClass: HSTRING; safecall;
    function get_MobileEquipmentId: HSTRING; safecall;
    function get_TelephoneNumbers: IVectorView_1__HSTRING; safecall;
    function get_SubscriberId: HSTRING; safecall;
    function get_SimIccId: HSTRING; safecall;
    function get_DeviceType: MobileBroadbandDeviceType; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_CurrentRadioState: MobileBroadbandRadioState; safecall;
    property CellularClass: CellularClass read get_CellularClass;
    property CurrentRadioState: MobileBroadbandRadioState read get_CurrentRadioState;
    property CustomDataClass: HSTRING read get_CustomDataClass;
    property DataClasses: DataClasses read get_DataClasses;
    property DeviceId: HSTRING read get_DeviceId;
    property DeviceType: MobileBroadbandDeviceType read get_DeviceType;
    property FirmwareInformation: HSTRING read get_FirmwareInformation;
    property Manufacturer: HSTRING read get_Manufacturer;
    property MobileEquipmentId: HSTRING read get_MobileEquipmentId;
    property Model: HSTRING read get_Model;
    property NetworkDeviceStatus: NetworkDeviceStatus read get_NetworkDeviceStatus;
    property SimIccId: HSTRING read get_SimIccId;
    property SubscriberId: HSTRING read get_SubscriberId;
    property TelephoneNumbers: IVectorView_1__HSTRING read get_TelephoneNumbers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccount
  [WinRTClassNameAttribute(SMobileBroadbandAccount)]
  IMobileBroadbandAccount = interface(IInspectable)
  ['{36C24CCD-CEE2-43E0-A603-EE86A36D6570}']
    function get_NetworkAccountId: HSTRING; safecall;
    function get_ServiceProviderGuid: TGuid; safecall;
    function get_ServiceProviderName: HSTRING; safecall;
    function get_CurrentNetwork: IMobileBroadbandNetwork; safecall;
    function get_CurrentDeviceInformation: IMobileBroadbandDeviceInformation; safecall;
    property CurrentDeviceInformation: IMobileBroadbandDeviceInformation read get_CurrentDeviceInformation;
    property CurrentNetwork: IMobileBroadbandNetwork read get_CurrentNetwork;
    property NetworkAccountId: HSTRING read get_NetworkAccountId;
    property ServiceProviderGuid: TGuid read get_ServiceProviderGuid;
    property ServiceProviderName: HSTRING read get_ServiceProviderName;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandAccount
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccountStatics
  [WinRTClassNameAttribute(SMobileBroadbandAccount)]
  IMobileBroadbandAccountStatics = interface(IInspectable)
  ['{AA7F4D24-AFC1-4FC8-AE9A-A9175310FAAD}']
    function get_AvailableNetworkAccountIds: IVectorView_1__HSTRING; safecall;
    function CreateFromNetworkAccountId(networkAccountId: HSTRING): IMobileBroadbandAccount; safecall;
    property AvailableNetworkAccountIds: IVectorView_1__HSTRING read get_AvailableNetworkAccountIds;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.Connectivity.IConnectionProfile>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccount2
  IMobileBroadbandAccount2 = interface(IInspectable)
  ['{38F52F1C-1136-4257-959F-B658A352B6D4}']
    function GetConnectionProfiles: IVectorView_1__IConnectionProfile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandAccount3
  IMobileBroadbandAccount3 = interface(IInspectable)
  ['{092A1E21-9379-4B9B-AD31-D5FEE2F748C6}']
    function get_AccountExperienceUrl: IUriRuntimeClass; safecall;
    property AccountExperienceUrl: IUriRuntimeClass read get_AccountExperienceUrl;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IIterator_1__MobileBroadbandPinType_Base = interface(IInspectable)
  ['{23EFCF0C-1F8E-5BD9-8B57-F0850121201C}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinType
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IIterator_1__MobileBroadbandPinType = interface(IIterator_1__MobileBroadbandPinType_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: MobileBroadbandPinType; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PMobileBroadbandPinType): Cardinal; safecall;
    property Current: MobileBroadbandPinType read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IIterable_1__MobileBroadbandPinType_Base = interface(IInspectable)
  ['{9D55726D-813E-50FB-9498-87AA872DD6CA}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IIterable_1__MobileBroadbandPinType = interface(IIterable_1__MobileBroadbandPinType_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__MobileBroadbandPinType; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinType
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  IVectorView_1__MobileBroadbandPinType = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): MobileBroadbandPinType; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: MobileBroadbandPinType; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PMobileBroadbandPinType): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult
  [WinRTClassNameAttribute(SMobileBroadbandPinOperationResult)]
  IMobileBroadbandPinOperationResult = interface(IInspectable)
  ['{11DDDC32-31E7-49F5-B663-123D3BEF0362}']
    function get_IsSuccessful: Boolean; safecall;
    function get_AttemptsRemaining: Cardinal; safecall;
    property AttemptsRemaining: Cardinal read get_AttemptsRemaining;
    property IsSuccessful: Boolean read get_IsSuccessful;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult_Delegate_Base = interface(IUnknown)
  ['{595AD094-60E3-5349-8FE6-EA8ECBBB2541}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult_Delegate_Base)
  ['{5376FE24-4843-598E-9423-B7A8FDE0AF79}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandPinOperationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  IAsyncOperation_1__IMobileBroadbandPinOperationResult_Base = interface(IInspectable)
  ['{2F76661C-2F74-5CE2-99F9-47D1A3A13633}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  IAsyncOperation_1__IMobileBroadbandPinOperationResult = interface(IAsyncOperation_1__IMobileBroadbandPinOperationResult_Base)
  ['{251B212E-0F07-5D6C-8BE4-C75257773102}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult; safecall;
    function GetResults: IMobileBroadbandPinOperationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandPinOperationResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinType
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinLockState
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult>
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandPin
  [WinRTClassNameAttribute(SMobileBroadbandPin)]
  IMobileBroadbandPin = interface(IInspectable)
  ['{E661D709-E779-45BF-8281-75323DF9E321}']
    function get_Type: MobileBroadbandPinType; safecall;
    function get_LockState: MobileBroadbandPinLockState; safecall;
    function get_Format: MobileBroadbandPinFormat; safecall;
    function get_Enabled: Boolean; safecall;
    function get_MaxLength: Cardinal; safecall;
    function get_MinLength: Cardinal; safecall;
    function get_AttemptsRemaining: Cardinal; safecall;
    function EnableAsync(currentPin: HSTRING): IAsyncOperation_1__IMobileBroadbandPinOperationResult; safecall;
    function DisableAsync(currentPin: HSTRING): IAsyncOperation_1__IMobileBroadbandPinOperationResult; safecall;
    function EnterAsync(currentPin: HSTRING): IAsyncOperation_1__IMobileBroadbandPinOperationResult; safecall;
    function ChangeAsync(currentPin: HSTRING; newPin: HSTRING): IAsyncOperation_1__IMobileBroadbandPinOperationResult; safecall;
    function UnblockAsync(pinUnblockKey: HSTRING; newPin: HSTRING): IAsyncOperation_1__IMobileBroadbandPinOperationResult; safecall;
    property AttemptsRemaining: Cardinal read get_AttemptsRemaining;
    property Enabled: Boolean read get_Enabled;
    property Format: MobileBroadbandPinFormat read get_Format;
    property LockState: MobileBroadbandPinLockState read get_LockState;
    property MaxLength: Cardinal read get_MaxLength;
    property MinLength: Cardinal read get_MinLength;
    property &Type: MobileBroadbandPinType read get_Type;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.MobileBroadbandPinType>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandPin
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinType
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandPinManager
  [WinRTClassNameAttribute(SMobileBroadbandPinManager)]
  IMobileBroadbandPinManager = interface(IInspectable)
  ['{83567EDD-6E1F-4B9B-A413-2B1F50CC36DF}']
    function get_SupportedPins: IVectorView_1__MobileBroadbandPinType; safecall;
    function GetPin(pinType: MobileBroadbandPinType): IMobileBroadbandPin; safecall;
    property SupportedPins: IVectorView_1__MobileBroadbandPinType read get_SupportedPins;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandPinManager
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation2
  IMobileBroadbandDeviceInformation2 = interface(IInspectable)
  ['{2E467AF1-F932-4737-A722-03BA72370CB8}']
    function get_PinManager: IMobileBroadbandPinManager; safecall;
    function get_Revision: HSTRING; safecall;
    function get_SerialNumber: HSTRING; safecall;
    property PinManager: IMobileBroadbandPinManager read get_PinManager;
    property Revision: HSTRING read get_Revision;
    property SerialNumber: HSTRING read get_SerialNumber;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation3
  IMobileBroadbandDeviceInformation3 = interface(IInspectable)
  ['{E08BB4BD-5D30-4B5A-92CC-D54DF881D49E}']
    function get_SimSpn: HSTRING; safecall;
    function get_SimPnn: HSTRING; safecall;
    function get_SimGid1: HSTRING; safecall;
    property SimGid1: HSTRING read get_SimGid1;
    property SimPnn: HSTRING read get_SimPnn;
    property SimSpn: HSTRING read get_SimSpn;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
  // Used Types:  Windows.Networking.NetworkOperators.UiccAppRecordKind
  // Used Types:  Int32
  // Used Types:  Windows.Networking.NetworkOperators.UiccAccessCondition
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult
  [WinRTClassNameAttribute(SMobileBroadbandUiccAppRecordDetailsResult)]
  IMobileBroadbandUiccAppRecordDetailsResult = interface(IInspectable)
  ['{D919682F-BE14-4934-981D-2F57B9ED83E6}']
    function get_Status: MobileBroadbandUiccAppOperationStatus; safecall;
    function get_Kind: UiccAppRecordKind; safecall;
    function get_RecordCount: Integer; safecall;
    function get_RecordSize: Integer; safecall;
    function get_ReadAccessCondition: UiccAccessCondition; safecall;
    function get_WriteAccessCondition: UiccAccessCondition; safecall;
    property Kind: UiccAppRecordKind read get_Kind;
    property ReadAccessCondition: UiccAccessCondition read get_ReadAccessCondition;
    property RecordCount: Integer read get_RecordCount;
    property RecordSize: Integer read get_RecordSize;
    property Status: MobileBroadbandUiccAppOperationStatus read get_Status;
    property WriteAccessCondition: UiccAccessCondition read get_WriteAccessCondition;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult_Delegate_Base = interface(IUnknown)
  ['{D0B53858-0E54-5791-82ED-3313DC75DA45}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult_Delegate_Base)
  ['{27D58B7A-136A-5311-9339-3EFA8B4C4673}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult_Base = interface(IInspectable)
  ['{0774F4A6-BDBE-59FF-AA1C-A62E3C6F9D37}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult = interface(IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult_Base)
  ['{A82D52D6-E249-502B-B158-1C5B47B33840}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult; safecall;
    function GetResults: IMobileBroadbandUiccAppRecordDetailsResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppRecordDetailsResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult
  [WinRTClassNameAttribute(SMobileBroadbandUiccAppReadRecordResult)]
  IMobileBroadbandUiccAppReadRecordResult = interface(IInspectable)
  ['{64C95285-358E-47C5-8249-695F383B2BDB}']
    function get_Status: MobileBroadbandUiccAppOperationStatus; safecall;
    function get_Data: IBuffer; safecall;
    property Data: IBuffer read get_Data;
    property Status: MobileBroadbandUiccAppOperationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult_Delegate_Base = interface(IUnknown)
  ['{B81892B3-4CA9-5EC4-8971-2FBC19B56CA9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult_Delegate_Base)
  ['{8A6A0DF5-24F6-50DA-87A6-9460D7A5603B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult_Base = interface(IInspectable)
  ['{27FC8483-30D8-5BE3-BC1E-8CCA0B241DF3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult = interface(IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult_Base)
  ['{04D99A02-299A-56ED-B6EA-18C5DC2DE9EC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult; safecall;
    function GetResults: IMobileBroadbandUiccAppReadRecordResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppReadRecordResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Networking.NetworkOperators.UiccAppKind
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<UInt32>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult>
  // Used Types:  Int32
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
  [WinRTClassNameAttribute(SMobileBroadbandUiccApp)]
  IMobileBroadbandUiccApp = interface(IInspectable)
  ['{4D170556-98A1-43DD-B2EC-50C90CF248DF}']
    function get_Id: IBuffer; safecall;
    function get_Kind: UiccAppKind; safecall;
    function GetRecordDetailsAsync(uiccFilePath: IIterable_1__Cardinal): IAsyncOperation_1__IMobileBroadbandUiccAppRecordDetailsResult; safecall;
    function ReadRecordAsync(uiccFilePath: IIterable_1__Cardinal; recordIndex: Integer): IAsyncOperation_1__IMobileBroadbandUiccAppReadRecordResult; safecall;
    property Id: IBuffer read get_Id;
    property Kind: UiccAppKind read get_Kind;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IIterator_1__IMobileBroadbandUiccApp_Base = interface(IInspectable)
  ['{4BB2066F-1B75-57CF-A722-1E58BFC5AE50}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IIterator_1__IMobileBroadbandUiccApp = interface(IIterator_1__IMobileBroadbandUiccApp_Base)
  ['{776CC781-A67D-5518-A04C-F787677835C1}']
    function get_Current: IMobileBroadbandUiccApp; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandUiccApp): Cardinal; safecall;
    property Current: IMobileBroadbandUiccApp read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IIterable_1__IMobileBroadbandUiccApp_Base = interface(IInspectable)
  ['{AF538114-BD14-53B0-B1D1-841DCAA451AD}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IIterable_1__IMobileBroadbandUiccApp = interface(IIterable_1__IMobileBroadbandUiccApp_Base)
  ['{1E7B803F-BB49-5260-B98C-719667953BA7}']
    function First: IIterator_1__IMobileBroadbandUiccApp; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  IVectorView_1__IMobileBroadbandUiccApp = interface(IInspectable)
  ['{61E0715E-E1F9-522E-8BD9-B1D946F964AE}']
    function GetAt(index: Cardinal): IMobileBroadbandUiccApp; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandUiccApp; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandUiccApp): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandNetwork2
  IMobileBroadbandNetwork2 = interface(IInspectable)
  ['{5A55DB22-62F7-4BDD-BA1D-477441960BA0}']
    function GetVoiceCallSupportAsync: IAsyncOperation_1__Boolean; safecall;
    function get_RegistrationUiccApps: IVectorView_1__IMobileBroadbandUiccApp; safecall;
    property RegistrationUiccApps: IVectorView_1__IMobileBroadbandUiccApp read get_RegistrationUiccApps;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
  IMobileBroadbandCellCdma = interface(IInspectable)
  ['{0601B3B4-411A-4F2E-8287-76F5650C60CD}']
    function get_BaseStationId: IReference_1__Integer; safecall;
    function get_BaseStationPNCode: IReference_1__Integer; safecall;
    function get_BaseStationLatitude: IReference_1__Double; safecall;
    function get_BaseStationLongitude: IReference_1__Double; safecall;
    function get_BaseStationLastBroadcastGpsTime: IReference_1__TimeSpan; safecall;
    function get_NetworkId: IReference_1__Integer; safecall;
    function get_PilotSignalStrengthInDB: IReference_1__Double; safecall;
    function get_SystemId: IReference_1__Integer; safecall;
    property BaseStationId: IReference_1__Integer read get_BaseStationId;
    property BaseStationLastBroadcastGpsTime: IReference_1__TimeSpan read get_BaseStationLastBroadcastGpsTime;
    property BaseStationLatitude: IReference_1__Double read get_BaseStationLatitude;
    property BaseStationLongitude: IReference_1__Double read get_BaseStationLongitude;
    property BaseStationPNCode: IReference_1__Integer read get_BaseStationPNCode;
    property NetworkId: IReference_1__Integer read get_NetworkId;
    property PilotSignalStrengthInDB: IReference_1__Double read get_PilotSignalStrengthInDB;
    property SystemId: IReference_1__Integer read get_SystemId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IIterator_1__IMobileBroadbandCellCdma_Base = interface(IInspectable)
  ['{B86379F2-5369-508F-A2DF-DEB3B72C3378}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IIterator_1__IMobileBroadbandCellCdma = interface(IIterator_1__IMobileBroadbandCellCdma_Base)
  ['{9B839918-E71F-5170-AD93-DD93474494BA}']
    function get_Current: IMobileBroadbandCellCdma; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandCellCdma): Cardinal; safecall;
    property Current: IMobileBroadbandCellCdma read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IIterable_1__IMobileBroadbandCellCdma_Base = interface(IInspectable)
  ['{46E83A22-4C40-5F27-BBCD-255DFD97EA93}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IIterable_1__IMobileBroadbandCellCdma = interface(IIterable_1__IMobileBroadbandCellCdma_Base)
  ['{7C1B38A6-6599-5F8F-9605-DED140DB6FDE}']
    function First: IIterator_1__IMobileBroadbandCellCdma; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  IVectorView_1__IMobileBroadbandCellCdma = interface(IInspectable)
  ['{4D4F8518-73F2-59FE-9675-7B9B44CAB21A}']
    function GetAt(index: Cardinal): IMobileBroadbandCellCdma; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandCellCdma; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandCellCdma): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
  IMobileBroadbandCellGsm = interface(IInspectable)
  ['{CC917F06-7EE0-47B8-9E1F-C3B48DF9DF5B}']
    function get_BaseStationId: IReference_1__Integer; safecall;
    function get_CellId: IReference_1__Integer; safecall;
    function get_ChannelNumber: IReference_1__Integer; safecall;
    function get_LocationAreaCode: IReference_1__Integer; safecall;
    function get_ProviderId: HSTRING; safecall;
    function get_ReceivedSignalStrengthInDBm: IReference_1__Double; safecall;
    function get_TimingAdvanceInBitPeriods: IReference_1__Integer; safecall;
    property BaseStationId: IReference_1__Integer read get_BaseStationId;
    property CellId: IReference_1__Integer read get_CellId;
    property ChannelNumber: IReference_1__Integer read get_ChannelNumber;
    property LocationAreaCode: IReference_1__Integer read get_LocationAreaCode;
    property ProviderId: HSTRING read get_ProviderId;
    property ReceivedSignalStrengthInDBm: IReference_1__Double read get_ReceivedSignalStrengthInDBm;
    property TimingAdvanceInBitPeriods: IReference_1__Integer read get_TimingAdvanceInBitPeriods;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IIterator_1__IMobileBroadbandCellGsm_Base = interface(IInspectable)
  ['{8BE60634-4021-5AC2-BD8A-A969B090B58D}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IIterator_1__IMobileBroadbandCellGsm = interface(IIterator_1__IMobileBroadbandCellGsm_Base)
  ['{0C0DE8C7-338E-52AF-AC04-82081592EAE7}']
    function get_Current: IMobileBroadbandCellGsm; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandCellGsm): Cardinal; safecall;
    property Current: IMobileBroadbandCellGsm read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IIterable_1__IMobileBroadbandCellGsm_Base = interface(IInspectable)
  ['{83E5EAE8-3887-599E-BEBF-8C51362DB44C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IIterable_1__IMobileBroadbandCellGsm = interface(IIterable_1__IMobileBroadbandCellGsm_Base)
  ['{ACB4B833-77B1-5FD5-99F2-0BC85F9A0505}']
    function First: IIterator_1__IMobileBroadbandCellGsm; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  IVectorView_1__IMobileBroadbandCellGsm = interface(IInspectable)
  ['{C106B752-03BA-5551-86E3-FA712FC15A40}']
    function GetAt(index: Cardinal): IMobileBroadbandCellGsm; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandCellGsm; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandCellGsm): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
  IMobileBroadbandCellLte = interface(IInspectable)
  ['{9197C87B-2B78-456D-8B53-AAA25D0AF741}']
    function get_CellId: IReference_1__Integer; safecall;
    function get_ChannelNumber: IReference_1__Integer; safecall;
    function get_PhysicalCellId: IReference_1__Integer; safecall;
    function get_ProviderId: HSTRING; safecall;
    function get_ReferenceSignalReceivedPowerInDBm: IReference_1__Double; safecall;
    function get_ReferenceSignalReceivedQualityInDBm: IReference_1__Double; safecall;
    function get_TimingAdvanceInBitPeriods: IReference_1__Integer; safecall;
    function get_TrackingAreaCode: IReference_1__Integer; safecall;
    property CellId: IReference_1__Integer read get_CellId;
    property ChannelNumber: IReference_1__Integer read get_ChannelNumber;
    property PhysicalCellId: IReference_1__Integer read get_PhysicalCellId;
    property ProviderId: HSTRING read get_ProviderId;
    property ReferenceSignalReceivedPowerInDBm: IReference_1__Double read get_ReferenceSignalReceivedPowerInDBm;
    property ReferenceSignalReceivedQualityInDBm: IReference_1__Double read get_ReferenceSignalReceivedQualityInDBm;
    property TimingAdvanceInBitPeriods: IReference_1__Integer read get_TimingAdvanceInBitPeriods;
    property TrackingAreaCode: IReference_1__Integer read get_TrackingAreaCode;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IIterator_1__IMobileBroadbandCellLte_Base = interface(IInspectable)
  ['{186B9D0B-EF0C-540A-8FE7-4DBC5C1D14DA}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IIterator_1__IMobileBroadbandCellLte = interface(IIterator_1__IMobileBroadbandCellLte_Base)
  ['{93CBDE87-0D99-5C06-A624-5457F6438D9F}']
    function get_Current: IMobileBroadbandCellLte; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandCellLte): Cardinal; safecall;
    property Current: IMobileBroadbandCellLte read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IIterable_1__IMobileBroadbandCellLte_Base = interface(IInspectable)
  ['{45D961D3-E228-5AFD-B18C-D4CFA3903432}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IIterable_1__IMobileBroadbandCellLte = interface(IIterable_1__IMobileBroadbandCellLte_Base)
  ['{74C2C055-4342-5791-9BD3-1C3A2167DC3F}']
    function First: IIterator_1__IMobileBroadbandCellLte; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellLte
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  IVectorView_1__IMobileBroadbandCellLte = interface(IInspectable)
  ['{9C435EFC-7DD6-5AE1-BE6A-02A478F20361}']
    function GetAt(index: Cardinal): IMobileBroadbandCellLte; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandCellLte; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandCellLte): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
  IMobileBroadbandCellTdscdma = interface(IInspectable)
  ['{0EDA1655-DB0E-4182-8CDA-CC419A7BDE08}']
    function get_CellId: IReference_1__Integer; safecall;
    function get_CellParameterId: IReference_1__Integer; safecall;
    function get_ChannelNumber: IReference_1__Integer; safecall;
    function get_LocationAreaCode: IReference_1__Integer; safecall;
    function get_PathLossInDB: IReference_1__Double; safecall;
    function get_ProviderId: HSTRING; safecall;
    function get_ReceivedSignalCodePowerInDBm: IReference_1__Double; safecall;
    function get_TimingAdvanceInBitPeriods: IReference_1__Integer; safecall;
    property CellId: IReference_1__Integer read get_CellId;
    property CellParameterId: IReference_1__Integer read get_CellParameterId;
    property ChannelNumber: IReference_1__Integer read get_ChannelNumber;
    property LocationAreaCode: IReference_1__Integer read get_LocationAreaCode;
    property PathLossInDB: IReference_1__Double read get_PathLossInDB;
    property ProviderId: HSTRING read get_ProviderId;
    property ReceivedSignalCodePowerInDBm: IReference_1__Double read get_ReceivedSignalCodePowerInDBm;
    property TimingAdvanceInBitPeriods: IReference_1__Integer read get_TimingAdvanceInBitPeriods;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IIterator_1__IMobileBroadbandCellTdscdma_Base = interface(IInspectable)
  ['{DD0AEB24-0EFE-5548-8448-E153D4903DF7}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IIterator_1__IMobileBroadbandCellTdscdma = interface(IIterator_1__IMobileBroadbandCellTdscdma_Base)
  ['{969C6054-F92E-56A4-A1DC-306366F2E110}']
    function get_Current: IMobileBroadbandCellTdscdma; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandCellTdscdma): Cardinal; safecall;
    property Current: IMobileBroadbandCellTdscdma read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IIterable_1__IMobileBroadbandCellTdscdma_Base = interface(IInspectable)
  ['{6E1E543F-1CF0-5CB3-B3FC-B559213C58E2}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IIterable_1__IMobileBroadbandCellTdscdma = interface(IIterable_1__IMobileBroadbandCellTdscdma_Base)
  ['{CB579560-E8CE-51B7-AD78-385040E0DB53}']
    function First: IIterator_1__IMobileBroadbandCellTdscdma; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  IVectorView_1__IMobileBroadbandCellTdscdma = interface(IInspectable)
  ['{06030CB9-0821-5DC8-B9D4-56EFEA78451F}']
    function GetAt(index: Cardinal): IMobileBroadbandCellTdscdma; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandCellTdscdma; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandCellTdscdma): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
  IMobileBroadbandCellUmts = interface(IInspectable)
  ['{77B4B5AE-49C8-4F15-B285-4C26A7F67215}']
    function get_CellId: IReference_1__Integer; safecall;
    function get_ChannelNumber: IReference_1__Integer; safecall;
    function get_LocationAreaCode: IReference_1__Integer; safecall;
    function get_PathLossInDB: IReference_1__Double; safecall;
    function get_PrimaryScramblingCode: IReference_1__Integer; safecall;
    function get_ProviderId: HSTRING; safecall;
    function get_ReceivedSignalCodePowerInDBm: IReference_1__Double; safecall;
    function get_SignalToNoiseRatioInDB: IReference_1__Double; safecall;
    property CellId: IReference_1__Integer read get_CellId;
    property ChannelNumber: IReference_1__Integer read get_ChannelNumber;
    property LocationAreaCode: IReference_1__Integer read get_LocationAreaCode;
    property PathLossInDB: IReference_1__Double read get_PathLossInDB;
    property PrimaryScramblingCode: IReference_1__Integer read get_PrimaryScramblingCode;
    property ProviderId: HSTRING read get_ProviderId;
    property ReceivedSignalCodePowerInDBm: IReference_1__Double read get_ReceivedSignalCodePowerInDBm;
    property SignalToNoiseRatioInDB: IReference_1__Double read get_SignalToNoiseRatioInDB;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IIterator_1__IMobileBroadbandCellUmts_Base = interface(IInspectable)
  ['{DC24CDB5-15F5-5A1D-A60B-AE12F9F42F06}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IIterator_1__IMobileBroadbandCellUmts = interface(IIterator_1__IMobileBroadbandCellUmts_Base)
  ['{C53844E5-BC2B-5AA0-AEC6-8FA020BE477D}']
    function get_Current: IMobileBroadbandCellUmts; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandCellUmts): Cardinal; safecall;
    property Current: IMobileBroadbandCellUmts read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IIterable_1__IMobileBroadbandCellUmts_Base = interface(IInspectable)
  ['{20392566-69CB-5EDA-B641-5510E7ED1A12}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IIterable_1__IMobileBroadbandCellUmts = interface(IIterable_1__IMobileBroadbandCellUmts_Base)
  ['{5C2125B5-2BE4-5CA9-9B75-486FFB8B61C6}']
    function First: IIterator_1__IMobileBroadbandCellUmts; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  IVectorView_1__IMobileBroadbandCellUmts = interface(IInspectable)
  ['{5B288E7B-B538-58E5-AD91-5A43ED866F4F}']
    function GetAt(index: Cardinal): IMobileBroadbandCellUmts; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandCellUmts; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandCellUmts): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellCdma>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellGsm>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellLte>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellTdscdma>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellUmts>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo
  IMobileBroadbandCellsInfo = interface(IInspectable)
  ['{89A9562A-E472-4DA5-929C-DE61711DD261}']
    function get_NeighboringCellsCdma: IVectorView_1__IMobileBroadbandCellCdma; safecall;
    function get_NeighboringCellsGsm: IVectorView_1__IMobileBroadbandCellGsm; safecall;
    function get_NeighboringCellsLte: IVectorView_1__IMobileBroadbandCellLte; safecall;
    function get_NeighboringCellsTdscdma: IVectorView_1__IMobileBroadbandCellTdscdma; safecall;
    function get_NeighboringCellsUmts: IVectorView_1__IMobileBroadbandCellUmts; safecall;
    function get_ServingCellsCdma: IVectorView_1__IMobileBroadbandCellCdma; safecall;
    function get_ServingCellsGsm: IVectorView_1__IMobileBroadbandCellGsm; safecall;
    function get_ServingCellsLte: IVectorView_1__IMobileBroadbandCellLte; safecall;
    function get_ServingCellsTdscdma: IVectorView_1__IMobileBroadbandCellTdscdma; safecall;
    function get_ServingCellsUmts: IVectorView_1__IMobileBroadbandCellUmts; safecall;
    property NeighboringCellsCdma: IVectorView_1__IMobileBroadbandCellCdma read get_NeighboringCellsCdma;
    property NeighboringCellsGsm: IVectorView_1__IMobileBroadbandCellGsm read get_NeighboringCellsGsm;
    property NeighboringCellsLte: IVectorView_1__IMobileBroadbandCellLte read get_NeighboringCellsLte;
    property NeighboringCellsTdscdma: IVectorView_1__IMobileBroadbandCellTdscdma read get_NeighboringCellsTdscdma;
    property NeighboringCellsUmts: IVectorView_1__IMobileBroadbandCellUmts read get_NeighboringCellsUmts;
    property ServingCellsCdma: IVectorView_1__IMobileBroadbandCellCdma read get_ServingCellsCdma;
    property ServingCellsGsm: IVectorView_1__IMobileBroadbandCellGsm read get_ServingCellsGsm;
    property ServingCellsLte: IVectorView_1__IMobileBroadbandCellLte read get_ServingCellsLte;
    property ServingCellsTdscdma: IVectorView_1__IMobileBroadbandCellTdscdma read get_ServingCellsTdscdma;
    property ServingCellsUmts: IVectorView_1__IMobileBroadbandCellUmts read get_ServingCellsUmts;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo_Delegate_Base = interface(IUnknown)
  ['{98F9A3F7-92A2-5431-902F-9BF01067AB60}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo_Delegate_Base)
  ['{31C0E476-D3C1-5E4A-A320-6DE0DAD28E4C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandCellsInfo; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  IAsyncOperation_1__IMobileBroadbandCellsInfo_Base = interface(IInspectable)
  ['{BA1101D2-7219-5421-A087-4CC5F1F25FC4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  IAsyncOperation_1__IMobileBroadbandCellsInfo = interface(IAsyncOperation_1__IMobileBroadbandCellsInfo_Base)
  ['{0ACBFB16-711D-5E93-96AB-1FE64ABABF0F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo; safecall;
    function GetResults: IMobileBroadbandCellsInfo; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandCellsInfo read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandCellsInfo>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandNetwork3
  IMobileBroadbandNetwork3 = interface(IInspectable)
  ['{33670A8A-C7EF-444C-AB6C-DF7EF7A390FE}']
    function GetCellsInfoAsync: IAsyncOperation_1__IMobileBroadbandCellsInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration
  [WinRTClassNameAttribute(SNetworkOperatorTetheringAccessPointConfiguration)]
  INetworkOperatorTetheringAccessPointConfiguration = interface(IInspectable)
  ['{0BCC0284-412E-403D-ACC6-B757E34774A4}']
    function get_Ssid: HSTRING; safecall;
    procedure put_Ssid(value: HSTRING); safecall;
    function get_Passphrase: HSTRING; safecall;
    procedure put_Passphrase(value: HSTRING); safecall;
    property Passphrase: HSTRING read get_Passphrase write put_Passphrase;
    property Ssid: HSTRING read get_Ssid write put_Ssid;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.TetheringOperationStatus
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult
  [WinRTClassNameAttribute(SNetworkOperatorTetheringOperationResult)]
  INetworkOperatorTetheringOperationResult = interface(IInspectable)
  ['{EBD203A1-01BA-476D-B4B3-BF3D12C8F80C}']
    function get_Status: TetheringOperationStatus; safecall;
    function get_AdditionalErrorMessage: HSTRING; safecall;
    property AdditionalErrorMessage: HSTRING read get_AdditionalErrorMessage;
    property Status: TetheringOperationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult_Delegate_Base = interface(IUnknown)
  ['{A936B927-7537-59C6-89DE-33F36A9725AB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult = interface(AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult_Delegate_Base)
  ['{E8DB81F2-A338-5D47-89B0-F26A42FEE582}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__INetworkOperatorTetheringOperationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  IAsyncOperation_1__INetworkOperatorTetheringOperationResult_Base = interface(IInspectable)
  ['{601B30ED-9B7F-54B6-B61B-24A09BC56304}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  IAsyncOperation_1__INetworkOperatorTetheringOperationResult = interface(IAsyncOperation_1__INetworkOperatorTetheringOperationResult_Base)
  ['{3112BC41-BE86-53A8-81C0-D0BA85CB5CE2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult; safecall;
    function GetResults: INetworkOperatorTetheringOperationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__INetworkOperatorTetheringOperationResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Networking.NetworkOperators.TetheringOperationalState
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult>
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
  [WinRTClassNameAttribute(SNetworkOperatorTetheringManager)]
  INetworkOperatorTetheringManager = interface(IInspectable)
  ['{D45A8DA0-0E86-4D98-8BA4-DD70D4B764D3}']
    function get_MaxClientCount: Cardinal; safecall;
    function get_ClientCount: Cardinal; safecall;
    function get_TetheringOperationalState: TetheringOperationalState; safecall;
    function GetCurrentAccessPointConfiguration: INetworkOperatorTetheringAccessPointConfiguration; safecall;
    function ConfigureAccessPointAsync(configuration: INetworkOperatorTetheringAccessPointConfiguration): IAsyncAction; safecall;
    function StartTetheringAsync: IAsyncOperation_1__INetworkOperatorTetheringOperationResult; safecall;
    function StopTetheringAsync: IAsyncOperation_1__INetworkOperatorTetheringOperationResult; safecall;
    property ClientCount: Cardinal read get_ClientCount;
    property MaxClientCount: Cardinal read get_MaxClientCount;
    property TetheringOperationalState: TetheringOperationalState read get_TetheringOperationalState;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.TetheringCapability
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics
  [WinRTClassNameAttribute(SNetworkOperatorTetheringManager)]
  INetworkOperatorTetheringManagerStatics = interface(IInspectable)
  ['{3EBCBACC-F8C3-405C-9964-70A1EEABE194}']
    function GetTetheringCapability(networkAccountId: HSTRING): TetheringCapability; safecall;
    function CreateFromNetworkAccountId(networkAccountId: HSTRING): INetworkOperatorTetheringManager; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.TetheringCapability
  // Used Types:  Windows.Networking.Connectivity.IConnectionProfile
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics2
  [WinRTClassNameAttribute(SNetworkOperatorTetheringManager)]
  INetworkOperatorTetheringManagerStatics2 = interface(IInspectable)
  ['{5B235412-35F0-49E7-9B08-16D278FBAA42}']
    function GetTetheringCapabilityFromConnectionProfile(profile: IConnectionProfile): TetheringCapability; safecall;
    function CreateFromConnectionProfile(profile: IConnectionProfile): INetworkOperatorTetheringManager; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
  // Used Types:  Windows.Networking.Connectivity.IConnectionProfile
  // Used Types:  Windows.Networking.Connectivity.INetworkAdapter
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics3
  [WinRTClassNameAttribute(SNetworkOperatorTetheringManager)]
  INetworkOperatorTetheringManagerStatics3 = interface(IInspectable)
  ['{8FDAADB6-4AF9-4F21-9B58-D53E9F24231E}']
    function CreateFromConnectionProfile(profile: IConnectionProfile; adapter: INetworkAdapter): INetworkOperatorTetheringManager; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IHostName>
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
  [WinRTClassNameAttribute(SNetworkOperatorTetheringClient)]
  INetworkOperatorTetheringClient = interface(IInspectable)
  ['{709D254C-595F-4847-BB30-646935542918}']
    function get_MacAddress: HSTRING; safecall;
    function get_HostNames: IVectorView_1__IHostName; safecall;
    property HostNames: IVectorView_1__IHostName read get_HostNames;
    property MacAddress: HSTRING read get_MacAddress;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IIterator_1__INetworkOperatorTetheringClient_Base = interface(IInspectable)
  ['{5653D065-C708-5341-BC05-D3B9CECD2AC7}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IIterator_1__INetworkOperatorTetheringClient = interface(IIterator_1__INetworkOperatorTetheringClient_Base)
  ['{52FC26D5-75EF-527D-AB08-C10685F93A66}']
    function get_Current: INetworkOperatorTetheringClient; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PINetworkOperatorTetheringClient): Cardinal; safecall;
    property Current: INetworkOperatorTetheringClient read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IIterable_1__INetworkOperatorTetheringClient_Base = interface(IInspectable)
  ['{4762ECB3-AF48-5B63-89B7-78A42056549F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IIterable_1__INetworkOperatorTetheringClient = interface(IIterable_1__INetworkOperatorTetheringClient_Base)
  ['{443E479B-46B8-5D56-B4EA-13101020B6A6}']
    function First: IIterator_1__INetworkOperatorTetheringClient; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  IVectorView_1__INetworkOperatorTetheringClient = interface(IInspectable)
  ['{23AA5A28-AD35-5C47-976A-53269CDC5293}']
    function GetAt(index: Cardinal): INetworkOperatorTetheringClient; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: INetworkOperatorTetheringClient; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PINetworkOperatorTetheringClient): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient>
  }
  // Windows.Networking.NetworkOperators.INetworkOperatorTetheringClientManager
  INetworkOperatorTetheringClientManager = interface(IInspectable)
  ['{91B14016-8DCA-4225-BBED-EEF8B8D718D7}']
    function GetTetheringClients: IVectorView_1__INetworkOperatorTetheringClient; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Boolean
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
  [WinRTClassNameAttribute(SMobileBroadbandDeviceServiceInformation)]
  IMobileBroadbandDeviceServiceInformation = interface(IInspectable)
  ['{53D69B5B-C4ED-45F0-803A-D9417A6D9846}']
    function get_DeviceServiceId: TGuid; safecall;
    function get_IsDataReadSupported: Boolean; safecall;
    function get_IsDataWriteSupported: Boolean; safecall;
    property DeviceServiceId: TGuid read get_DeviceServiceId;
    property IsDataReadSupported: Boolean read get_IsDataReadSupported;
    property IsDataWriteSupported: Boolean read get_IsDataWriteSupported;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IIterator_1__IMobileBroadbandDeviceServiceInformation_Base = interface(IInspectable)
  ['{D8D776F6-4692-5461-9155-816E63BAC874}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IIterator_1__IMobileBroadbandDeviceServiceInformation = interface(IIterator_1__IMobileBroadbandDeviceServiceInformation_Base)
  ['{05415FF7-5FDE-51DC-A0D5-4F704E3651A3}']
    function get_Current: IMobileBroadbandDeviceServiceInformation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandDeviceServiceInformation): Cardinal; safecall;
    property Current: IMobileBroadbandDeviceServiceInformation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IIterable_1__IMobileBroadbandDeviceServiceInformation_Base = interface(IInspectable)
  ['{88511855-6FE6-5694-83A7-991E29033DE5}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IIterable_1__IMobileBroadbandDeviceServiceInformation = interface(IIterable_1__IMobileBroadbandDeviceServiceInformation_Base)
  ['{C06A2C8F-A6D4-5C58-937B-A9DDBB8FBBD1}']
    function First: IIterator_1__IMobileBroadbandDeviceServiceInformation; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  IVectorView_1__IMobileBroadbandDeviceServiceInformation = interface(IInspectable)
  ['{52C008C3-0273-53EC-80FE-EAF6B34CE03F}']
    function GetAt(index: Cardinal): IMobileBroadbandDeviceServiceInformation; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandDeviceServiceInformation; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandDeviceServiceInformation): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs
  IMobileBroadbandDeviceServiceDataReceivedEventArgs = interface(IInspectable)
  ['{B6AA13DE-1380-40E3-8618-73CBCA48138C}']
    function get_ReceivedData: IBuffer; safecall;
    property ReceivedData: IBuffer read get_ReceivedData;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession,Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs>
  TypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{31F89CA6-DD7F-5325-9020-627D8B47EA02}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession,Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs>
  TypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs = interface(TypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs_Delegate_Base)
  ['{1A79C740-7A77-57DA-BBE8-9C068B8E0853}']
    procedure Invoke(sender: IMobileBroadbandDeviceServiceDataSession; args: IMobileBroadbandDeviceServiceDataReceivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession,Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataReceivedEventArgs>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
  [WinRTClassNameAttribute(SMobileBroadbandDeviceServiceDataSession)]
  IMobileBroadbandDeviceServiceDataSession = interface(IInspectable)
  ['{DAD62333-8BCF-4289-8A37-045C2169486A}']
    function WriteDataAsync(value: IBuffer): IAsyncAction; safecall;
    procedure CloseSession; safecall;
    function add_DataReceived(eventHandler: TypedEventHandler_2__IMobileBroadbandDeviceServiceDataSession__IMobileBroadbandDeviceServiceDataReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DataReceived(eventCookie: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult
  [WinRTClassNameAttribute(SMobileBroadbandDeviceServiceCommandResult)]
  IMobileBroadbandDeviceServiceCommandResult = interface(IInspectable)
  ['{B0F46ABB-94D6-44B9-A538-F0810B645389}']
    function get_StatusCode: Cardinal; safecall;
    function get_ResponseData: IBuffer; safecall;
    property ResponseData: IBuffer read get_ResponseData;
    property StatusCode: Cardinal read get_StatusCode;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult_Delegate_Base = interface(IUnknown)
  ['{21F0CE4F-8F33-5E71-A457-DDA553B0D6BB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult_Delegate_Base)
  ['{D7D3031C-A595-52C3-9179-7C74B197645D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult_Base = interface(IInspectable)
  ['{2C673AA8-6A35-50FD-9422-3615A1C28CCB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult = interface(IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult_Base)
  ['{0943E466-3D80-5767-827C-BEADC11B3BC9}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult; safecall;
    function GetResults: IMobileBroadbandDeviceServiceCommandResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandDeviceServiceCommandResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult>
  // Used Types:  UInt32
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandSession
  [WinRTClassNameAttribute(SMobileBroadbandDeviceServiceCommandSession)]
  IMobileBroadbandDeviceServiceCommandSession = interface(IInspectable)
  ['{FC098A45-913B-4914-B6C3-AE6304593E75}']
    function SendQueryCommandAsync(commandId: Cardinal; data: IBuffer): IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult; safecall;
    function SendSetCommandAsync(commandId: Cardinal; data: IBuffer): IAsyncOperation_1__IMobileBroadbandDeviceServiceCommandResult; safecall;
    procedure CloseSession; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandSession
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceService
  [WinRTClassNameAttribute(SMobileBroadbandDeviceService)]
  IMobileBroadbandDeviceService = interface(IInspectable)
  ['{22BE1A52-BD80-40AC-8E1F-2E07836A3DBD}']
    function get_DeviceServiceId: TGuid; safecall;
    function get_SupportedCommands: IVectorView_1__Cardinal; safecall;
    function OpenDataSession: IMobileBroadbandDeviceServiceDataSession; safecall;
    function OpenCommandSession: IMobileBroadbandDeviceServiceCommandSession; safecall;
    property DeviceServiceId: TGuid read get_DeviceServiceId;
    property SupportedCommands: IVectorView_1__Cardinal read get_SupportedCommands;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandUiccAppOperationStatus
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult
  [WinRTClassNameAttribute(SMobileBroadbandUiccAppsResult)]
  IMobileBroadbandUiccAppsResult = interface(IInspectable)
  ['{744930EB-8157-4A41-8494-6BF54C9B1D2B}']
    function get_Status: MobileBroadbandUiccAppOperationStatus; safecall;
    function get_UiccApps: IVectorView_1__IMobileBroadbandUiccApp; safecall;
    property Status: MobileBroadbandUiccAppOperationStatus read get_Status;
    property UiccApps: IVectorView_1__IMobileBroadbandUiccApp read get_UiccApps;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult_Delegate_Base = interface(IUnknown)
  ['{A12BED56-C672-595E-A67B-49ABC285ADDC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult_Delegate_Base)
  ['{A9553FA4-EEEC-5CF5-8791-3743312C16E1}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandUiccAppsResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppsResult_Base = interface(IInspectable)
  ['{CF1CE97F-1A81-5CE6-8AD5-55FF8B0E8D1B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  IAsyncOperation_1__IMobileBroadbandUiccAppsResult = interface(IAsyncOperation_1__IMobileBroadbandUiccAppsResult_Base)
  ['{FC71A253-3C12-51B6-93E0-A6E61C50A26E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult; safecall;
    function GetResults: IMobileBroadbandUiccAppsResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandUiccAppsResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandUicc
  [WinRTClassNameAttribute(SMobileBroadbandUicc)]
  IMobileBroadbandUicc = interface(IInspectable)
  ['{E634F691-525A-4CE2-8FCE-AA4162579154}']
    function get_SimIccId: HSTRING; safecall;
    function GetUiccAppsAsync: IAsyncOperation_1__IMobileBroadbandUiccAppsResult; safecall;
    property SimIccId: HSTRING read get_SimIccId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandUicc
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration
  [WinRTClassNameAttribute(SMobileBroadbandModemConfiguration)]
  IMobileBroadbandModemConfiguration = interface(IInspectable)
  ['{FCE035A3-D6CD-4320-B982-BE9D3EC7890F}']
    function get_Uicc: IMobileBroadbandUicc; safecall;
    function get_HomeProviderId: HSTRING; safecall;
    function get_HomeProviderName: HSTRING; safecall;
    property HomeProviderId: HSTRING read get_HomeProviderId;
    property HomeProviderName: HSTRING read get_HomeProviderName;
    property Uicc: IMobileBroadbandUicc read get_Uicc;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration_Delegate_Base = interface(IUnknown)
  ['{C11E0649-8237-5C93-BBDB-2EDA5216FD3F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration = interface(AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration_Delegate_Base)
  ['{C6FCAF27-08E3-52FF-B470-BFF281F7EB51}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMobileBroadbandModemConfiguration; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  IAsyncOperation_1__IMobileBroadbandModemConfiguration_Base = interface(IInspectable)
  ['{CDBE0003-DAAA-5C89-92E6-A47FFC2418A2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  IAsyncOperation_1__IMobileBroadbandModemConfiguration = interface(IAsyncOperation_1__IMobileBroadbandModemConfiguration_Base)
  ['{A1DA01E4-C772-5CCB-9C5E-F67D9EDAA903}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration; safecall;
    function GetResults: IMobileBroadbandModemConfiguration; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMobileBroadbandModemConfiguration read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandAccount
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandDeviceService
  // Used Types:  Guid
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration>
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandModem
  [WinRTClassNameAttribute(SMobileBroadbandModem)]
  IMobileBroadbandModem = interface(IInspectable)
  ['{D0356912-E9F9-4F67-A03D-43189A316BF1}']
    function get_CurrentAccount: IMobileBroadbandAccount; safecall;
    function get_DeviceInformation: IMobileBroadbandDeviceInformation; safecall;
    function get_MaxDeviceServiceCommandSizeInBytes: Cardinal; safecall;
    function get_MaxDeviceServiceDataSizeInBytes: Cardinal; safecall;
    function get_DeviceServices: IVectorView_1__IMobileBroadbandDeviceServiceInformation; safecall;
    function GetDeviceService(deviceServiceId: TGuid): IMobileBroadbandDeviceService; safecall;
    function get_IsResetSupported: Boolean; safecall;
    function ResetAsync: IAsyncAction; safecall;
    function GetCurrentConfigurationAsync: IAsyncOperation_1__IMobileBroadbandModemConfiguration; safecall;
    function get_CurrentNetwork: IMobileBroadbandNetwork; safecall;
    property CurrentAccount: IMobileBroadbandAccount read get_CurrentAccount;
    property CurrentNetwork: IMobileBroadbandNetwork read get_CurrentNetwork;
    property DeviceInformation: IMobileBroadbandDeviceInformation read get_DeviceInformation;
    property DeviceServices: IVectorView_1__IMobileBroadbandDeviceServiceInformation read get_DeviceServices;
    property IsResetSupported: Boolean read get_IsResetSupported;
    property MaxDeviceServiceCommandSizeInBytes: Cardinal read get_MaxDeviceServiceCommandSizeInBytes;
    property MaxDeviceServiceDataSizeInBytes: Cardinal read get_MaxDeviceServiceDataSizeInBytes;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandModem
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandModemStatics
  [WinRTClassNameAttribute(SMobileBroadbandModem)]
  IMobileBroadbandModemStatics = interface(IInspectable)
  ['{F99ED637-D6F1-4A78-8CBC-6421A65063C8}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromId(deviceId: HSTRING): IMobileBroadbandModem; safecall;
    function GetDefault: IMobileBroadbandModem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
  IMobileBroadbandAntennaSar = interface(IInspectable)
  ['{B9AF4B7E-CBF9-4109-90BE-5C06BFD513B6}']
    function get_AntennaIndex: Integer; safecall;
    function get_SarBackoffIndex: Integer; safecall;
    property AntennaIndex: Integer read get_AntennaIndex;
    property SarBackoffIndex: Integer read get_SarBackoffIndex;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IIterator_1__IMobileBroadbandAntennaSar_Base = interface(IInspectable)
  ['{03327F15-E40F-52D1-BB6C-BEBBD8155134}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IIterator_1__IMobileBroadbandAntennaSar = interface(IIterator_1__IMobileBroadbandAntennaSar_Base)
  ['{1350B4FF-C8DB-5560-AE1D-D0A102E44989}']
    function get_Current: IMobileBroadbandAntennaSar; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandAntennaSar): Cardinal; safecall;
    property Current: IMobileBroadbandAntennaSar read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IIterable_1__IMobileBroadbandAntennaSar_Base = interface(IInspectable)
  ['{FD66B9AC-40DC-5AC7-AAF1-2D3403E5FCBB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IIterable_1__IMobileBroadbandAntennaSar = interface(IIterable_1__IMobileBroadbandAntennaSar_Base)
  ['{44A0C809-A4BD-551C-AC98-49B590923873}']
    function First: IIterator_1__IMobileBroadbandAntennaSar; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  IVectorView_1__IMobileBroadbandAntennaSar = interface(IInspectable)
  ['{3D6C9C8E-A41B-5DD5-A783-3E7EAD9A445E}']
    function GetAt(index: Cardinal): IMobileBroadbandAntennaSar; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandAntennaSar; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandAntennaSar): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs
  IMobileBroadbandTransmissionStateChangedEventArgs = interface(IInspectable)
  ['{612E3875-040A-4F99-A4F9-61D7C32DA129}']
    function get_IsTransmitting: Boolean; safecall;
    property IsTransmitting: Boolean read get_IsTransmitting;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandSarManager,Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs>
  TypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{540C4534-CD85-5ABE-8013-13CB140ED18B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandSarManager,Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs>
  TypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs = interface(TypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs_Delegate_Base)
  ['{75442265-AA4C-5F05-B317-3EB6E90FBE34}']
    procedure Invoke(sender: IMobileBroadbandSarManager; args: IMobileBroadbandTransmissionStateChangedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Networking.NetworkOperators.IMobileBroadbandSarManager,Windows.Networking.NetworkOperators.IMobileBroadbandTransmissionStateChangedEventArgs>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandAntennaSar>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
  IMobileBroadbandSarManager = interface(IInspectable)
  ['{E5B26833-967E-40C9-A485-19C0DD209E22}']
    function get_IsBackoffEnabled: Boolean; safecall;
    function get_IsWiFiHardwareIntegrated: Boolean; safecall;
    function get_IsSarControlledByHardware: Boolean; safecall;
    function get_Antennas: IVectorView_1__IMobileBroadbandAntennaSar; safecall;
    function get_HysteresisTimerPeriod: TimeSpan; safecall;
    function add_TransmissionStateChanged(handler: TypedEventHandler_2__IMobileBroadbandSarManager__IMobileBroadbandTransmissionStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_TransmissionStateChanged(token: EventRegistrationToken); safecall;
    function EnableBackoffAsync: IAsyncAction; safecall;
    function DisableBackoffAsync: IAsyncAction; safecall;
    function SetConfigurationAsync(antennas: IIterable_1__IMobileBroadbandAntennaSar): IAsyncAction; safecall;
    function RevertSarToHardwareControlAsync: IAsyncAction; safecall;
    function SetTransmissionStateChangedHysteresisAsync(timerPeriod: TimeSpan): IAsyncAction; safecall;
    function GetIsTransmittingAsync: IAsyncOperation_1__Boolean; safecall;
    procedure StartTransmissionStateMonitoring; safecall;
    procedure StopTransmissionStateMonitoring; safecall;
    property Antennas: IVectorView_1__IMobileBroadbandAntennaSar read get_Antennas;
    property HysteresisTimerPeriod: TimeSpan read get_HysteresisTimerPeriod;
    property IsBackoffEnabled: Boolean read get_IsBackoffEnabled;
    property IsSarControlledByHardware: Boolean read get_IsSarControlledByHardware;
    property IsWiFiHardwareIntegrated: Boolean read get_IsWiFiHardwareIntegrated;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandSarManager
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration2
  IMobileBroadbandModemConfiguration2 = interface(IInspectable)
  ['{320FF5C5-E460-42AE-AA51-69621E7A4477}']
    function get_SarManager: IMobileBroadbandSarManager; safecall;
    property SarManager: IMobileBroadbandSarManager read get_SarManager;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus_Delegate_Base = interface(IUnknown)
  ['{B8628318-EE4F-5AF4-9E3B-AF994FA96C51}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus = interface(AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__MobileBroadbandModemStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  IAsyncOperation_1__MobileBroadbandModemStatus_Base = interface(IInspectable)
  ['{AB0D25AB-68CD-54AB-B19C-624711659D3D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandModemStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  IAsyncOperation_1__MobileBroadbandModemStatus = interface(IAsyncOperation_1__MobileBroadbandModemStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus; safecall;
    function GetResults: MobileBroadbandModemStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__MobileBroadbandModemStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.MobileBroadbandModemStatus>
  // Used Types:  Boolean
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandModem2
  IMobileBroadbandModem2 = interface(IInspectable)
  ['{12862B28-B9EB-4EE2-BBE3-711F53EEA373}']
    function GetIsPassthroughEnabledAsync: IAsyncOperation_1__Boolean; safecall;
    function SetIsPassthroughEnabledAsync(value: Boolean): IAsyncOperation_1__MobileBroadbandModemStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
  [WinRTClassNameAttribute(SMobileBroadbandNetworkRegistrationStateChange)]
  IMobileBroadbandNetworkRegistrationStateChange = interface(IInspectable)
  ['{BEAF94E1-960F-49B4-A08D-7D85E968C7EC}']
    function get_DeviceId: HSTRING; safecall;
    function get_Network: IMobileBroadbandNetwork; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property Network: IMobileBroadbandNetwork read get_Network;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IIterator_1__IMobileBroadbandNetworkRegistrationStateChange_Base = interface(IInspectable)
  ['{9CB0F858-E589-57A7-9D01-2C6291567CC7}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IIterator_1__IMobileBroadbandNetworkRegistrationStateChange = interface(IIterator_1__IMobileBroadbandNetworkRegistrationStateChange_Base)
  ['{3D7E7450-0C2A-537D-9F77-937B4856757A}']
    function get_Current: IMobileBroadbandNetworkRegistrationStateChange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandNetworkRegistrationStateChange): Cardinal; safecall;
    property Current: IMobileBroadbandNetworkRegistrationStateChange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IIterable_1__IMobileBroadbandNetworkRegistrationStateChange_Base = interface(IInspectable)
  ['{0B90BB30-660C-51C6-9B8C-31DD8486E10E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IIterable_1__IMobileBroadbandNetworkRegistrationStateChange = interface(IIterable_1__IMobileBroadbandNetworkRegistrationStateChange_Base)
  ['{E0E40C22-CFC9-5DF3-8EBE-C551D691287E}']
    function First: IIterator_1__IMobileBroadbandNetworkRegistrationStateChange; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  IVectorView_1__IMobileBroadbandNetworkRegistrationStateChange = interface(IInspectable)
  ['{BD95AB62-44B2-5ADD-B16E-03D48253F162}']
    function GetAt(index: Cardinal): IMobileBroadbandNetworkRegistrationStateChange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandNetworkRegistrationStateChange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandNetworkRegistrationStateChange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails
  [WinRTClassNameAttribute(SMobileBroadbandNetworkRegistrationStateChangeTriggerDetails)]
  IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails = interface(IInspectable)
  ['{89135CFF-28B8-46AA-B137-1C4B0F21EDFE}']
    function get_NetworkRegistrationStateChanges: IVectorView_1__IMobileBroadbandNetworkRegistrationStateChange; safecall;
    property NetworkRegistrationStateChanges: IVectorView_1__IMobileBroadbandNetworkRegistrationStateChange read get_NetworkRegistrationStateChanges;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandRadioState
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
  [WinRTClassNameAttribute(SMobileBroadbandRadioStateChange)]
  IMobileBroadbandRadioStateChange = interface(IInspectable)
  ['{B054A561-9833-4AED-9717-4348B21A24B3}']
    function get_DeviceId: HSTRING; safecall;
    function get_RadioState: MobileBroadbandRadioState; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property RadioState: MobileBroadbandRadioState read get_RadioState;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IIterator_1__IMobileBroadbandRadioStateChange_Base = interface(IInspectable)
  ['{C088CEC3-08E5-5F35-A2B9-0900D028C83B}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IIterator_1__IMobileBroadbandRadioStateChange = interface(IIterator_1__IMobileBroadbandRadioStateChange_Base)
  ['{C47426E0-8EBF-523A-BD9A-E23C0C7E5D7F}']
    function get_Current: IMobileBroadbandRadioStateChange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandRadioStateChange): Cardinal; safecall;
    property Current: IMobileBroadbandRadioStateChange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IIterable_1__IMobileBroadbandRadioStateChange_Base = interface(IInspectable)
  ['{C385ADAA-574C-5AD8-98C2-61309525132D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IIterable_1__IMobileBroadbandRadioStateChange = interface(IIterable_1__IMobileBroadbandRadioStateChange_Base)
  ['{E4E62A7B-F718-58A8-9FFA-062BD7E51E20}']
    function First: IIterator_1__IMobileBroadbandRadioStateChange; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  IVectorView_1__IMobileBroadbandRadioStateChange = interface(IInspectable)
  ['{D1CB8E13-2478-5488-A9F6-863309D9DF35}']
    function GetAt(index: Cardinal): IMobileBroadbandRadioStateChange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandRadioStateChange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandRadioStateChange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChangeTriggerDetails
  [WinRTClassNameAttribute(SMobileBroadbandRadioStateChangeTriggerDetails)]
  IMobileBroadbandRadioStateChangeTriggerDetails = interface(IInspectable)
  ['{71301ACE-093C-42C6-B0DB-AD1F75A65445}']
    function get_RadioStateChanges: IVectorView_1__IMobileBroadbandRadioStateChange; safecall;
    property RadioStateChanges: IVectorView_1__IMobileBroadbandRadioStateChange read get_RadioStateChanges;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinType
  // Used Types:  Windows.Networking.NetworkOperators.MobileBroadbandPinLockState
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
  [WinRTClassNameAttribute(SMobileBroadbandPinLockStateChange)]
  IMobileBroadbandPinLockStateChange = interface(IInspectable)
  ['{BE16673E-1F04-4F95-8B90-E7F559DDE7E5}']
    function get_DeviceId: HSTRING; safecall;
    function get_PinType: MobileBroadbandPinType; safecall;
    function get_PinLockState: MobileBroadbandPinLockState; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property PinLockState: MobileBroadbandPinLockState read get_PinLockState;
    property PinType: MobileBroadbandPinType read get_PinType;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IIterator_1__IMobileBroadbandPinLockStateChange_Base = interface(IInspectable)
  ['{E61B479F-7BD9-5550-BC69-F9C2F71C6A05}']
  end;
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IIterator_1__IMobileBroadbandPinLockStateChange = interface(IIterator_1__IMobileBroadbandPinLockStateChange_Base)
  ['{9F6CDEEA-0EF0-5BCE-BEBA-F8667FEFEC97}']
    function get_Current: IMobileBroadbandPinLockStateChange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMobileBroadbandPinLockStateChange): Cardinal; safecall;
    property Current: IMobileBroadbandPinLockStateChange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IIterable_1__IMobileBroadbandPinLockStateChange_Base = interface(IInspectable)
  ['{AA4A8700-9943-59A3-8647-D373FD5E0E2B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IIterable_1__IMobileBroadbandPinLockStateChange = interface(IIterable_1__IMobileBroadbandPinLockStateChange_Base)
  ['{3876476B-DF73-551E-A695-2F70A4292032}']
    function First: IIterator_1__IMobileBroadbandPinLockStateChange; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  IVectorView_1__IMobileBroadbandPinLockStateChange = interface(IInspectable)
  ['{8AAE04EC-BB01-53AD-A97D-612EEE2A0D2A}']
    function GetAt(index: Cardinal): IMobileBroadbandPinLockStateChange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMobileBroadbandPinLockStateChange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMobileBroadbandPinLockStateChange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange>
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChangeTriggerDetails
  [WinRTClassNameAttribute(SMobileBroadbandPinLockStateChangeTriggerDetails)]
  IMobileBroadbandPinLockStateChangeTriggerDetails = interface(IInspectable)
  ['{D338C091-3E91-4D38-9036-AEE83A6E79AD}']
    function get_PinLockStateChanges: IVectorView_1__IMobileBroadbandPinLockStateChange; safecall;
    property PinLockStateChanges: IVectorView_1__IMobileBroadbandPinLockStateChange read get_PinLockStateChanges;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceTriggerDetails
  [WinRTClassNameAttribute(SMobileBroadbandDeviceServiceTriggerDetails)]
  IMobileBroadbandDeviceServiceTriggerDetails = interface(IInspectable)
  ['{4A055B70-B9AE-4458-9241-A6A5FBF18A0C}']
    function get_DeviceId: HSTRING; safecall;
    function get_DeviceServiceId: TGuid; safecall;
    function get_ReceivedData: IBuffer; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property DeviceServiceId: TGuid read get_DeviceServiceId;
    property ReceivedData: IBuffer read get_ReceivedData;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.Networking.NetworkOperators.IKnownCSimFilePathsStatics
  [WinRTClassNameAttribute(SKnownCSimFilePaths)]
  IKnownCSimFilePathsStatics = interface(IInspectable)
  ['{B458AEED-49F1-4C22-B073-96D511BF9C35}']
    function get_EFSpn: IVectorView_1__Cardinal; safecall;
    function get_Gid1: IVectorView_1__Cardinal; safecall;
    function get_Gid2: IVectorView_1__Cardinal; safecall;
    property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    property Gid1: IVectorView_1__Cardinal read get_Gid1;
    property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.Networking.NetworkOperators.IKnownRuimFilePathsStatics
  [WinRTClassNameAttribute(SKnownRuimFilePaths)]
  IKnownRuimFilePathsStatics = interface(IInspectable)
  ['{3883C8B9-FF24-4571-A867-09F960426E14}']
    function get_EFSpn: IVectorView_1__Cardinal; safecall;
    function get_Gid1: IVectorView_1__Cardinal; safecall;
    function get_Gid2: IVectorView_1__Cardinal; safecall;
    property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    property Gid1: IVectorView_1__Cardinal read get_Gid1;
    property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.Networking.NetworkOperators.IKnownSimFilePathsStatics
  [WinRTClassNameAttribute(SKnownSimFilePaths)]
  IKnownSimFilePathsStatics = interface(IInspectable)
  ['{80CD1A63-37A5-43D3-80A3-CCD23E8FECEE}']
    function get_EFOns: IVectorView_1__Cardinal; safecall;
    function get_EFSpn: IVectorView_1__Cardinal; safecall;
    function get_Gid1: IVectorView_1__Cardinal; safecall;
    function get_Gid2: IVectorView_1__Cardinal; safecall;
    property EFOns: IVectorView_1__Cardinal read get_EFOns;
    property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    property Gid1: IVectorView_1__Cardinal read get_Gid1;
    property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.Networking.NetworkOperators.IKnownUSimFilePathsStatics
  [WinRTClassNameAttribute(SKnownUSimFilePaths)]
  IKnownUSimFilePathsStatics = interface(IInspectable)
  ['{7C34E581-1F1B-43F4-9530-8B092D32D71F}']
    function get_EFSpn: IVectorView_1__Cardinal; safecall;
    function get_EFOpl: IVectorView_1__Cardinal; safecall;
    function get_EFPnn: IVectorView_1__Cardinal; safecall;
    function get_Gid1: IVectorView_1__Cardinal; safecall;
    function get_Gid2: IVectorView_1__Cardinal; safecall;
    property EFOpl: IVectorView_1__Cardinal read get_EFOpl;
    property EFPnn: IVectorView_1__Cardinal read get_EFPnn;
    property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    property Gid1: IVectorView_1__Cardinal read get_Gid1;
    property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Networking.NetworkOperators.HotspotAuthenticationResponseCode
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Data.Xml.Dom.IXmlDocument
  }
  // Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult
  [WinRTClassNameAttribute(SHotspotCredentialsAuthenticationResult)]
  IHotspotCredentialsAuthenticationResult = interface(IInspectable)
  ['{E756C791-1005-4DE5-83C7-DE61D88831D0}']
    function get_HasNetworkErrorOccurred: Boolean; safecall;
    function get_ResponseCode: HotspotAuthenticationResponseCode; safecall;
    function get_LogoffUrl: IUriRuntimeClass; safecall;
    function get_AuthenticationReplyXml: Xml_Dom_IXmlDocument; safecall;
    property AuthenticationReplyXml: Xml_Dom_IXmlDocument read get_AuthenticationReplyXml;
    property HasNetworkErrorOccurred: Boolean read get_HasNetworkErrorOccurred;
    property LogoffUrl: IUriRuntimeClass read get_LogoffUrl;
    property ResponseCode: HotspotAuthenticationResponseCode read get_ResponseCode;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult_Delegate_Base = interface(IUnknown)
  ['{7F254BEB-471F-5000-94CE-102CC333055F}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult = interface(AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult_Delegate_Base)
  ['{100A520E-981A-57A0-91FC-3F0B8D5D6ADB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IHotspotCredentialsAuthenticationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  IAsyncOperation_1__IHotspotCredentialsAuthenticationResult_Base = interface(IInspectable)
  ['{522781D8-29C8-5D89-8937-1D1C2032F0C8}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  // Used Types:  Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult>
  IAsyncOperation_1__IHotspotCredentialsAuthenticationResult = interface(IAsyncOperation_1__IHotspotCredentialsAuthenticationResult_Base)
  ['{19D48783-66B3-54E3-A880-38E143C588FA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult; safecall;
    function GetResults: IHotspotCredentialsAuthenticationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IHotspotCredentialsAuthenticationResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults
  [WinRTClassNameAttribute(SProvisionFromXmlDocumentResults)]
  IProvisionFromXmlDocumentResults = interface(IInspectable)
  ['{217700E0-8203-11DF-ADB9-F4CE462D9137}']
    function get_AllElementsProvisioned: Boolean; safecall;
    function get_ProvisionResultsXml: HSTRING; safecall;
    property AllElementsProvisioned: Boolean read get_AllElementsProvisioned;
    property ProvisionResultsXml: HSTRING read get_ProvisionResultsXml;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.Connectivity.NetworkCostType
  // Used Types:  Windows.Networking.NetworkOperators.ProfileUsage
  }
  // Windows.Networking.NetworkOperators.IProvisionedProfile
  [WinRTClassNameAttribute(SProvisionedProfile)]
  IProvisionedProfile = interface(IInspectable)
  ['{217700E0-8202-11DF-ADB9-F4CE462D9137}']
    procedure UpdateCost(value: NetworkCostType); safecall;
    procedure UpdateUsage(value: ProfileUsage); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults_Delegate_Base = interface(IUnknown)
  ['{7A7EEE1B-17F9-5A41-861B-C30EA127D0F1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults = interface(AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults_Delegate_Base)
  ['{77FF2BE3-9CFD-5034-89B9-FF78EFAFCB68}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IProvisionFromXmlDocumentResults; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  IAsyncOperation_1__IProvisionFromXmlDocumentResults_Base = interface(IInspectable)
  ['{9F8FE338-C6B1-5614-A14F-8977A77E17F2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  // Used Types:  Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  IAsyncOperation_1__IProvisionFromXmlDocumentResults = interface(IAsyncOperation_1__IProvisionFromXmlDocumentResults_Base)
  ['{68AFF662-59AD-5B99-81EE-9AA2C780B858}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults; safecall;
    function GetResults: IProvisionFromXmlDocumentResults; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IProvisionFromXmlDocumentResults read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults>
  // Used Types:  String
  // Used Types:  Windows.Networking.NetworkOperators.IProvisionedProfile
  // Used Types:  Windows.Networking.NetworkOperators.ProfileMediaType
  }
  // Windows.Networking.NetworkOperators.IProvisioningAgent
  [WinRTClassNameAttribute(SProvisioningAgent)]
  IProvisioningAgent = interface(IInspectable)
  ['{217700E0-8201-11DF-ADB9-F4CE462D9137}']
    function ProvisionFromXmlDocumentAsync(provisioningXmlDocument: HSTRING): IAsyncOperation_1__IProvisionFromXmlDocumentResults; safecall;
    function GetProvisionedProfile(mediaType: ProfileMediaType; profileName: HSTRING): IProvisionedProfile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IProvisioningAgent
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IProvisioningAgentStaticMethods
  [WinRTClassNameAttribute(SProvisioningAgent)]
  IProvisioningAgentStaticMethods = interface(IInspectable)
  ['{217700E0-8101-11DF-ADB9-F4CE462D9137}']
    function CreateFromNetworkAccountId(networkAccountId: HSTRING): IProvisioningAgent; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  UInt8[]
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IUssdMessage
  [WinRTClassNameAttribute(SUssdMessage)]
  IUssdMessage = interface(IInspectable)
  ['{2F9ACF82-2004-4D5D-BF81-2ABA1B4BE4A8}']
    function get_DataCodingScheme: Byte; safecall;
    procedure put_DataCodingScheme(value: Byte); safecall;
    function GetPayload(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
    procedure SetPayload(valueSize: Cardinal; value: PByte); safecall;
    function get_PayloadAsText: HSTRING; safecall;
    procedure put_PayloadAsText(value: HSTRING); safecall;
    property DataCodingScheme: Byte read get_DataCodingScheme write put_DataCodingScheme;
    property PayloadAsText: HSTRING read get_PayloadAsText write put_PayloadAsText;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IUssdMessage
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IUssdMessageFactory
  [WinRTClassNameAttribute(SUssdMessage)]
  IUssdMessageFactory = interface(IInspectable)
  ['{2F9ACF82-1003-4D5D-BF81-2ABA1B4BE4A8}']
    function CreateMessage(messageText: HSTRING): IUssdMessage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.UssdResultCode
  // Used Types:  Windows.Networking.NetworkOperators.IUssdMessage
  }
  // Windows.Networking.NetworkOperators.IUssdReply
  [WinRTClassNameAttribute(SUssdReply)]
  IUssdReply = interface(IInspectable)
  ['{2F9ACF82-2005-4D5D-BF81-2ABA1B4BE4A8}']
    function get_ResultCode: UssdResultCode; safecall;
    function get_Message: IUssdMessage; safecall;
    property Message: IUssdMessage read get_Message;
    property ResultCode: UssdResultCode read get_ResultCode;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IUssdReply>
  AsyncOperationCompletedHandler_1__IUssdReply_Delegate_Base = interface(IUnknown)
  ['{9385BD8F-5E14-557A-A7F1-63F33D9ECACF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IUssdReply>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IUssdReply>
  AsyncOperationCompletedHandler_1__IUssdReply = interface(AsyncOperationCompletedHandler_1__IUssdReply_Delegate_Base)
  ['{354DAF3D-8EB1-5BEE-8710-2DF30BF322A0}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IUssdReply; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IUssdReply>
  IAsyncOperation_1__IUssdReply_Base = interface(IInspectable)
  ['{9DD0A063-6153-5AFD-8288-8770DDCFF2DB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Networking.NetworkOperators.IUssdReply>
  // Used Types:  Windows.Networking.NetworkOperators.IUssdReply
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IUssdReply>
  IAsyncOperation_1__IUssdReply = interface(IAsyncOperation_1__IUssdReply_Base)
  ['{032A3426-9808-53E4-8012-2C0A747442DA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IUssdReply); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IUssdReply; safecall;
    function GetResults: IUssdReply; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IUssdReply read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Networking.NetworkOperators.IUssdReply>
  // Used Types:  Windows.Networking.NetworkOperators.IUssdMessage
  }
  // Windows.Networking.NetworkOperators.IUssdSession
  [WinRTClassNameAttribute(SUssdSession)]
  IUssdSession = interface(IInspectable)
  ['{2F9ACF82-2002-4D5D-BF81-2ABA1B4BE4A8}']
    function SendMessageAndGetReplyAsync(message: IUssdMessage): IAsyncOperation_1__IUssdReply; safecall;
    procedure Close; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.NetworkOperators.IUssdSession
  // Used Types:  String
  }
  // Windows.Networking.NetworkOperators.IUssdSessionStatics
  [WinRTClassNameAttribute(SUssdSession)]
  IUssdSessionStatics = interface(IInspectable)
  ['{2F9ACF82-1001-4D5D-BF81-2ABA1B4BE4A8}']
    function CreateFromNetworkAccountId(networkAccountId: HSTRING): IUssdSession; safecall;
    function CreateFromNetworkInterfaceId(networkInterfaceId: HSTRING): IUssdSession; safecall;
  end;


  // Emit Forwarded classes
  // Windows.Networking.NetworkOperators.NetworkOperatorNotificationEventDetails
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorNotificationEventDetails
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorTetheringEntitlementCheck

  // Windows.Networking.NetworkOperators.MobileBroadbandAccount
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandAccount
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandAccount2
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandAccount3
  // Statics: "Windows.Networking.NetworkOperators.IMobileBroadbandAccountStatics"
  TMobileBroadbandAccount = class(TWinRTGenericImportS<IMobileBroadbandAccountStatics>)
  public
    // -> IMobileBroadbandAccountStatics
    class function get_AvailableNetworkAccountIds: IVectorView_1__HSTRING; static; inline;
    class function CreateFromNetworkAccountId(networkAccountId: HSTRING): IMobileBroadbandAccount; static; inline;
    class property AvailableNetworkAccountIds: IVectorView_1__HSTRING read get_AvailableNetworkAccountIds;
  end;

  // Windows.Networking.NetworkOperators.MobileBroadbandNetwork
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandNetwork
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandNetwork2
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandNetwork3

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceInformation
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation2
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceInformation3

  // Windows.Networking.NetworkOperators.MobileBroadbandPinManager
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandPinManager

  // Windows.Networking.NetworkOperators.MobileBroadbandUiccApp
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandUiccApp

  // Windows.Networking.NetworkOperators.NetworkOperatorTetheringAccessPointConfiguration
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorTetheringAccessPointConfiguration
  // Instantiable: "INetworkOperatorTetheringAccessPointConfiguration"
  TNetworkOperatorTetheringAccessPointConfiguration = class(TWinRTGenericImportI<INetworkOperatorTetheringAccessPointConfiguration>) end;

  // Windows.Networking.NetworkOperators.NetworkOperatorTetheringOperationResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorTetheringOperationResult

  // Windows.Networking.NetworkOperators.NetworkOperatorTetheringManager
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorTetheringManager
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorTetheringClientManager
  // Statics: "Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics3"
  // Statics: "Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics"
  // Statics: "Windows.Networking.NetworkOperators.INetworkOperatorTetheringManagerStatics2"
  TNetworkOperatorTetheringManager = class(TWinRTGenericImportS3<INetworkOperatorTetheringManagerStatics, INetworkOperatorTetheringManagerStatics2, INetworkOperatorTetheringManagerStatics3>)
  public
    // -> INetworkOperatorTetheringManagerStatics3
    class function CreateFromConnectionProfile(profile: IConnectionProfile; adapter: INetworkAdapter): INetworkOperatorTetheringManager; overload; static; inline;

    // -> INetworkOperatorTetheringManagerStatics
    class function GetTetheringCapability(networkAccountId: HSTRING): TetheringCapability; static; inline;
    class function CreateFromNetworkAccountId(networkAccountId: HSTRING): INetworkOperatorTetheringManager; static; inline;

    // -> INetworkOperatorTetheringManagerStatics2
    class function GetTetheringCapabilityFromConnectionProfile(profile: IConnectionProfile): TetheringCapability; static; inline;
    class function CreateFromConnectionProfile(profile: IConnectionProfile): INetworkOperatorTetheringManager; overload; static; inline;
  end;

  // Windows.Networking.NetworkOperators.NetworkOperatorTetheringClient
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.INetworkOperatorTetheringClient

  // Windows.Networking.NetworkOperators.MobileBroadbandAccountEventArgs
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandAccountEventArgs

  // Windows.Networking.NetworkOperators.MobileBroadbandAccountUpdatedEventArgs
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandAccountUpdatedEventArgs

  // Windows.Networking.NetworkOperators.MobileBroadbandAccountWatcher
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandAccountWatcher
  // Instantiable: "IMobileBroadbandAccountWatcher"
  TMobileBroadbandAccountWatcher = class(TWinRTGenericImportI<IMobileBroadbandAccountWatcher>) end;

  // Windows.Networking.NetworkOperators.MobileBroadbandModem
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandModem
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandModem2
  // Statics: "Windows.Networking.NetworkOperators.IMobileBroadbandModemStatics"
  TMobileBroadbandModem = class(TWinRTGenericImportS<IMobileBroadbandModemStatics>)
  public
    // -> IMobileBroadbandModemStatics
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromId(deviceId: HSTRING): IMobileBroadbandModem; static; inline;
    class function GetDefault: IMobileBroadbandModem; static; inline;
  end;

  // Windows.Networking.NetworkOperators.MobileBroadbandUicc
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandUicc

  // Windows.Networking.NetworkOperators.MobileBroadbandModemConfiguration
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandModemConfiguration2

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceServiceInformation
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceInformation

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceService
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceService

  // Windows.Networking.NetworkOperators.MobileBroadbandPin
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandPin

  // Windows.Networking.NetworkOperators.MobileBroadbandPinOperationResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandPinOperationResult

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceServiceDataSession
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceDataSession

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceServiceCommandSession
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandSession

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceServiceCommandResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceCommandResult

  // Windows.Networking.NetworkOperators.MobileBroadbandUiccAppsResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppsResult

  // Windows.Networking.NetworkOperators.MobileBroadbandUiccAppRecordDetailsResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppRecordDetailsResult

  // Windows.Networking.NetworkOperators.MobileBroadbandUiccAppReadRecordResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandUiccAppReadRecordResult

  // Windows.Networking.NetworkOperators.MobileBroadbandNetworkRegistrationStateChange
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChange

  // Windows.Networking.NetworkOperators.MobileBroadbandNetworkRegistrationStateChangeTriggerDetails
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails

  // Windows.Networking.NetworkOperators.MobileBroadbandRadioStateChange
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChange

  // Windows.Networking.NetworkOperators.MobileBroadbandRadioStateChangeTriggerDetails
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandRadioStateChangeTriggerDetails

  // Windows.Networking.NetworkOperators.MobileBroadbandPinLockStateChange
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChange

  // Windows.Networking.NetworkOperators.MobileBroadbandPinLockStateChangeTriggerDetails
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandPinLockStateChangeTriggerDetails

  // Windows.Networking.NetworkOperators.MobileBroadbandDeviceServiceTriggerDetails
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IMobileBroadbandDeviceServiceTriggerDetails

  // Windows.Networking.NetworkOperators.KnownCSimFilePaths
  // DualAPI
  // Statics: "Windows.Networking.NetworkOperators.IKnownCSimFilePathsStatics"
  TKnownCSimFilePaths = class(TWinRTGenericImportS<IKnownCSimFilePathsStatics>)
  public
    // -> IKnownCSimFilePathsStatics
    class function get_EFSpn: IVectorView_1__Cardinal; static; inline;
    class function get_Gid1: IVectorView_1__Cardinal; static; inline;
    class function get_Gid2: IVectorView_1__Cardinal; static; inline;
    class property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    class property Gid1: IVectorView_1__Cardinal read get_Gid1;
    class property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // Windows.Networking.NetworkOperators.KnownRuimFilePaths
  // DualAPI
  // Statics: "Windows.Networking.NetworkOperators.IKnownRuimFilePathsStatics"
  TKnownRuimFilePaths = class(TWinRTGenericImportS<IKnownRuimFilePathsStatics>)
  public
    // -> IKnownRuimFilePathsStatics
    class function get_EFSpn: IVectorView_1__Cardinal; static; inline;
    class function get_Gid1: IVectorView_1__Cardinal; static; inline;
    class function get_Gid2: IVectorView_1__Cardinal; static; inline;
    class property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    class property Gid1: IVectorView_1__Cardinal read get_Gid1;
    class property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // Windows.Networking.NetworkOperators.KnownSimFilePaths
  // DualAPI
  // Statics: "Windows.Networking.NetworkOperators.IKnownSimFilePathsStatics"
  TKnownSimFilePaths = class(TWinRTGenericImportS<IKnownSimFilePathsStatics>)
  public
    // -> IKnownSimFilePathsStatics
    class function get_EFOns: IVectorView_1__Cardinal; static; inline;
    class function get_EFSpn: IVectorView_1__Cardinal; static; inline;
    class function get_Gid1: IVectorView_1__Cardinal; static; inline;
    class function get_Gid2: IVectorView_1__Cardinal; static; inline;
    class property EFOns: IVectorView_1__Cardinal read get_EFOns;
    class property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    class property Gid1: IVectorView_1__Cardinal read get_Gid1;
    class property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // Windows.Networking.NetworkOperators.KnownUSimFilePaths
  // DualAPI
  // Statics: "Windows.Networking.NetworkOperators.IKnownUSimFilePathsStatics"
  TKnownUSimFilePaths = class(TWinRTGenericImportS<IKnownUSimFilePathsStatics>)
  public
    // -> IKnownUSimFilePathsStatics
    class function get_EFSpn: IVectorView_1__Cardinal; static; inline;
    class function get_EFOpl: IVectorView_1__Cardinal; static; inline;
    class function get_EFPnn: IVectorView_1__Cardinal; static; inline;
    class function get_Gid1: IVectorView_1__Cardinal; static; inline;
    class function get_Gid2: IVectorView_1__Cardinal; static; inline;
    class property EFOpl: IVectorView_1__Cardinal read get_EFOpl;
    class property EFPnn: IVectorView_1__Cardinal read get_EFPnn;
    class property EFSpn: IVectorView_1__Cardinal read get_EFSpn;
    class property Gid1: IVectorView_1__Cardinal read get_Gid1;
    class property Gid2: IVectorView_1__Cardinal read get_Gid2;
  end;

  // Windows.Networking.NetworkOperators.HotspotCredentialsAuthenticationResult
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IHotspotCredentialsAuthenticationResult

  // Windows.Networking.NetworkOperators.ProvisionFromXmlDocumentResults
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IProvisionFromXmlDocumentResults

  // Windows.Networking.NetworkOperators.ProvisionedProfile
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IProvisionedProfile

  // Windows.Networking.NetworkOperators.ProvisioningAgent
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IProvisioningAgent
  // Statics: "Windows.Networking.NetworkOperators.IProvisioningAgentStaticMethods"
  // Instantiable: "IProvisioningAgent"
  TProvisioningAgent = class(TWinRTGenericImportSI<IProvisioningAgentStaticMethods, IProvisioningAgent>)
  public
    // -> IProvisioningAgentStaticMethods
    class function CreateFromNetworkAccountId(networkAccountId: HSTRING): IProvisioningAgent; static; inline;
  end;

  // Windows.Networking.NetworkOperators.UssdMessage
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IUssdMessage
  // Factory: "Windows.Networking.NetworkOperators.IUssdMessageFactory"
  TUssdMessage = class(TWinRTGenericImportF<IUssdMessageFactory>)
  public
    // -> IUssdMessageFactory
    class function CreateMessage(messageText: HSTRING): IUssdMessage; static; inline;
  end;

  // Windows.Networking.NetworkOperators.UssdReply
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IUssdReply

  // Windows.Networking.NetworkOperators.UssdSession
  // DualAPI
  // Implements: Windows.Networking.NetworkOperators.IUssdSession
  // Statics: "Windows.Networking.NetworkOperators.IUssdSessionStatics"
  TUssdSession = class(TWinRTGenericImportS<IUssdSessionStatics>)
  public
    // -> IUssdSessionStatics
    class function CreateFromNetworkAccountId(networkAccountId: HSTRING): IUssdSession; static; inline;
    class function CreateFromNetworkInterfaceId(networkInterfaceId: HSTRING): IUssdSession; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TMobileBroadbandAccount }

class function TMobileBroadbandAccount.get_AvailableNetworkAccountIds: IVectorView_1__HSTRING;
begin
  Result := Statics.get_AvailableNetworkAccountIds;
end;

class function TMobileBroadbandAccount.CreateFromNetworkAccountId(networkAccountId: HSTRING): IMobileBroadbandAccount;
begin
  Result := Statics.CreateFromNetworkAccountId(networkAccountId);
end;


 { TNetworkOperatorTetheringAccessPointConfiguration }

 { TNetworkOperatorTetheringManager }

class function TNetworkOperatorTetheringManager.GetTetheringCapability(networkAccountId: HSTRING): TetheringCapability;
begin
  Result := Statics.GetTetheringCapability(networkAccountId);
end;

class function TNetworkOperatorTetheringManager.CreateFromNetworkAccountId(networkAccountId: HSTRING): INetworkOperatorTetheringManager;
begin
  Result := Statics.CreateFromNetworkAccountId(networkAccountId);
end;


class function TNetworkOperatorTetheringManager.GetTetheringCapabilityFromConnectionProfile(profile: IConnectionProfile): TetheringCapability;
begin
  Result := Statics2.GetTetheringCapabilityFromConnectionProfile(profile);
end;

class function TNetworkOperatorTetheringManager.CreateFromConnectionProfile(profile: IConnectionProfile): INetworkOperatorTetheringManager;
begin
  Result := Statics2.CreateFromConnectionProfile(profile);
end;


class function TNetworkOperatorTetheringManager.CreateFromConnectionProfile(profile: IConnectionProfile; adapter: INetworkAdapter): INetworkOperatorTetheringManager;
begin
  Result := Statics3.CreateFromConnectionProfile(profile, adapter);
end;


 { TMobileBroadbandAccountWatcher }

 { TMobileBroadbandModem }

class function TMobileBroadbandModem.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TMobileBroadbandModem.FromId(deviceId: HSTRING): IMobileBroadbandModem;
begin
  Result := Statics.FromId(deviceId);
end;

class function TMobileBroadbandModem.GetDefault: IMobileBroadbandModem;
begin
  Result := Statics.GetDefault;
end;


 { TKnownCSimFilePaths }

class function TKnownCSimFilePaths.get_EFSpn: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFSpn;
end;

class function TKnownCSimFilePaths.get_Gid1: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid1;
end;

class function TKnownCSimFilePaths.get_Gid2: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid2;
end;


 { TKnownRuimFilePaths }

class function TKnownRuimFilePaths.get_EFSpn: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFSpn;
end;

class function TKnownRuimFilePaths.get_Gid1: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid1;
end;

class function TKnownRuimFilePaths.get_Gid2: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid2;
end;


 { TKnownSimFilePaths }

class function TKnownSimFilePaths.get_EFOns: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFOns;
end;

class function TKnownSimFilePaths.get_EFSpn: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFSpn;
end;

class function TKnownSimFilePaths.get_Gid1: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid1;
end;

class function TKnownSimFilePaths.get_Gid2: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid2;
end;


 { TKnownUSimFilePaths }

class function TKnownUSimFilePaths.get_EFSpn: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFSpn;
end;

class function TKnownUSimFilePaths.get_EFOpl: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFOpl;
end;

class function TKnownUSimFilePaths.get_EFPnn: IVectorView_1__Cardinal;
begin
  Result := Statics.get_EFPnn;
end;

class function TKnownUSimFilePaths.get_Gid1: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid1;
end;

class function TKnownUSimFilePaths.get_Gid2: IVectorView_1__Cardinal;
begin
  Result := Statics.get_Gid2;
end;


 { TProvisioningAgent }

class function TProvisioningAgent.CreateFromNetworkAccountId(networkAccountId: HSTRING): IProvisioningAgent;
begin
  Result := Statics.CreateFromNetworkAccountId(networkAccountId);
end;


 { TUssdMessage }
// Factories for : "UssdMessage"
// Factory: "Windows.Networking.NetworkOperators.IUssdMessageFactory"
// -> IUssdMessageFactory

class function TUssdMessage.CreateMessage(messageText: HSTRING): IUssdMessage;
begin
  Result := Factory.CreateMessage(messageText);
end;


 { TUssdSession }

class function TUssdSession.CreateFromNetworkAccountId(networkAccountId: HSTRING): IUssdSession;
begin
  Result := Statics.CreateFromNetworkAccountId(networkAccountId);
end;

class function TUssdSession.CreateFromNetworkInterfaceId(networkInterfaceId: HSTRING): IUssdSession;
begin
  Result := Statics.CreateFromNetworkInterfaceId(networkInterfaceId);
end;



end.
