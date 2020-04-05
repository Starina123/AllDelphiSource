{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Devices.Bluetooth;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.ApplicationModel, 
  Winapi.Devices.Enumeration, 
  Winapi.Storage.Streams, 
  Winapi.Networking.Sockets, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IIterator_1__GenericAttributeProfile_IGattDescriptor = interface;
  PIIterator_1__GenericAttributeProfile_IGattDescriptor = ^IIterator_1__GenericAttributeProfile_IGattDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IIterable_1__GenericAttributeProfile_IGattDescriptor = interface;
  PIIterable_1__GenericAttributeProfile_IGattDescriptor = ^IIterable_1__GenericAttributeProfile_IGattDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IIterator_1__GenericAttributeProfile_IGattPresentationFormat = interface;
  PIIterator_1__GenericAttributeProfile_IGattPresentationFormat = ^IIterator_1__GenericAttributeProfile_IGattPresentationFormat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IIterable_1__GenericAttributeProfile_IGattPresentationFormat = interface;
  PIIterable_1__GenericAttributeProfile_IGattPresentationFormat = ^IIterable_1__GenericAttributeProfile_IGattPresentationFormat;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IIterator_1__GenericAttributeProfile_IGattLocalDescriptor = interface;
  PIIterator_1__GenericAttributeProfile_IGattLocalDescriptor = ^IIterator_1__GenericAttributeProfile_IGattLocalDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IIterable_1__GenericAttributeProfile_IGattLocalDescriptor = interface;
  PIIterable_1__GenericAttributeProfile_IGattLocalDescriptor = ^IIterable_1__GenericAttributeProfile_IGattLocalDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IIterator_1__GenericAttributeProfile_IGattSubscribedClient = interface;
  PIIterator_1__GenericAttributeProfile_IGattSubscribedClient = ^IIterator_1__GenericAttributeProfile_IGattSubscribedClient;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IIterable_1__GenericAttributeProfile_IGattSubscribedClient = interface;
  PIIterable_1__GenericAttributeProfile_IGattSubscribedClient = ^IIterable_1__GenericAttributeProfile_IGattSubscribedClient;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IIterator_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PIIterator_1__GenericAttributeProfile_IGattClientNotificationResult = ^IIterator_1__GenericAttributeProfile_IGattClientNotificationResult;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IIterable_1__GenericAttributeProfile_IGattClientNotificationResult = interface;
  PIIterable_1__GenericAttributeProfile_IGattClientNotificationResult = ^IIterable_1__GenericAttributeProfile_IGattClientNotificationResult;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult
  GenericAttributeProfile_IGattLocalCharacteristicResult = interface;
  PGenericAttributeProfile_IGattLocalCharacteristicResult = ^GenericAttributeProfile_IGattLocalCharacteristicResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IVector_1__GenericAttributeProfile_IGattPresentationFormat = interface;
  PIVector_1__GenericAttributeProfile_IGattPresentationFormat = ^IVector_1__GenericAttributeProfile_IGattPresentationFormat;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters
  GenericAttributeProfile_IGattLocalCharacteristicParameters = interface;
  PGenericAttributeProfile_IGattLocalCharacteristicParameters = ^GenericAttributeProfile_IGattLocalCharacteristicParameters;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IIterator_1__GenericAttributeProfile_IGattLocalCharacteristic = interface;
  PIIterator_1__GenericAttributeProfile_IGattLocalCharacteristic = ^IIterator_1__GenericAttributeProfile_IGattLocalCharacteristic;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IIterable_1__GenericAttributeProfile_IGattLocalCharacteristic = interface;
  PIIterable_1__GenericAttributeProfile_IGattLocalCharacteristic = ^IIterable_1__GenericAttributeProfile_IGattLocalCharacteristic;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IVectorView_1__GenericAttributeProfile_IGattLocalCharacteristic = interface;
  PIVectorView_1__GenericAttributeProfile_IGattLocalCharacteristic = ^IVectorView_1__GenericAttributeProfile_IGattLocalCharacteristic;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
  GenericAttributeProfile_IGattLocalService = interface;
  PGenericAttributeProfile_IGattLocalService = ^GenericAttributeProfile_IGattLocalService;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
  GenericAttributeProfile_IGattServiceProviderAdvertisingParameters = interface;
  PGenericAttributeProfile_IGattServiceProviderAdvertisingParameters = ^GenericAttributeProfile_IGattServiceProviderAdvertisingParameters;

  // Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
  IBluetoothSignalStrengthFilter = interface;
  PIBluetoothSignalStrengthFilter = ^IBluetoothSignalStrengthFilter;

  // Windows.Devices.Bluetooth.IBluetoothAdapter
  IBluetoothAdapter = interface;
  PIBluetoothAdapter = ^IBluetoothAdapter;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  AsyncOperationCompletedHandler_1__IBluetoothAdapter = interface;
  PAsyncOperationCompletedHandler_1__IBluetoothAdapter = ^AsyncOperationCompletedHandler_1__IBluetoothAdapter;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  IAsyncOperation_1__IBluetoothAdapter = interface;
  PIAsyncOperation_1__IBluetoothAdapter = ^IAsyncOperation_1__IBluetoothAdapter;

  // Windows.Devices.Bluetooth.IBluetoothAdapterStatics
  IBluetoothAdapterStatics = interface;
  PIBluetoothAdapterStatics = ^IBluetoothAdapterStatics;

  // Windows.Devices.Bluetooth.IBluetoothDeviceIdStatics
  IBluetoothDeviceIdStatics = interface;
  PIBluetoothDeviceIdStatics = ^IBluetoothDeviceIdStatics;

  // Windows.Devices.Bluetooth.IBluetoothUuidHelperStatics
  IBluetoothUuidHelperStatics = interface;
  PIBluetoothUuidHelperStatics = ^IBluetoothUuidHelperStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IIterator_1__Rfcomm_IRfcommDeviceService = interface;
  PIIterator_1__Rfcomm_IRfcommDeviceService = ^IIterator_1__Rfcomm_IRfcommDeviceService;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IIterable_1__Rfcomm_IRfcommDeviceService = interface;
  PIIterable_1__Rfcomm_IRfcommDeviceService = ^IIterable_1__Rfcomm_IRfcommDeviceService;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  AsyncOperationCompletedHandler_1__IBluetoothDevice = interface;
  PAsyncOperationCompletedHandler_1__IBluetoothDevice = ^AsyncOperationCompletedHandler_1__IBluetoothDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  IAsyncOperation_1__IBluetoothDevice = interface;
  PIAsyncOperation_1__IBluetoothDevice = ^IAsyncOperation_1__IBluetoothDevice;

  // Windows.Devices.Bluetooth.IBluetoothDeviceStatics
  IBluetoothDeviceStatics = interface;
  PIBluetoothDeviceStatics = ^IBluetoothDeviceStatics;

  // Windows.Devices.Bluetooth.IBluetoothDeviceStatics2
  IBluetoothDeviceStatics2 = interface;
  PIBluetoothDeviceStatics2 = ^IBluetoothDeviceStatics2;

  // Windows.Devices.Bluetooth.IBluetoothDevice2
  IBluetoothDevice2 = interface;
  PIBluetoothDevice2 = ^IBluetoothDevice2;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult
  Rfcomm_IRfcommDeviceServicesResult = interface;
  PRfcomm_IRfcommDeviceServicesResult = ^Rfcomm_IRfcommDeviceServicesResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult = interface;
  PAsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult = ^AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult = interface;
  PIAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult = ^IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult;

  // Windows.Devices.Bluetooth.IBluetoothDevice3
  IBluetoothDevice3 = interface;
  PIBluetoothDevice3 = ^IBluetoothDevice3;

  // Windows.Devices.Bluetooth.IBluetoothDevice4
  IBluetoothDevice4 = interface;
  PIBluetoothDevice4 = ^IBluetoothDevice4;

  // Windows.Devices.Bluetooth.IBluetoothLEAppearanceCategoriesStatics
  IBluetoothLEAppearanceCategoriesStatics = interface;
  PIBluetoothLEAppearanceCategoriesStatics = ^IBluetoothLEAppearanceCategoriesStatics;

  // Windows.Devices.Bluetooth.IBluetoothLEAppearanceSubcategoriesStatics
  IBluetoothLEAppearanceSubcategoriesStatics = interface;
  PIBluetoothLEAppearanceSubcategoriesStatics = ^IBluetoothLEAppearanceSubcategoriesStatics;

  // Windows.Devices.Bluetooth.IBluetoothLEAppearance
  IBluetoothLEAppearance = interface;
  PIBluetoothLEAppearance = ^IBluetoothLEAppearance;

  // Windows.Devices.Bluetooth.IBluetoothLEAppearanceStatics
  IBluetoothLEAppearanceStatics = interface;
  PIBluetoothLEAppearanceStatics = ^IBluetoothLEAppearanceStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IIterator_1__GenericAttributeProfile_IGattCharacteristic = interface;
  PIIterator_1__GenericAttributeProfile_IGattCharacteristic = ^IIterator_1__GenericAttributeProfile_IGattCharacteristic;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IIterable_1__GenericAttributeProfile_IGattCharacteristic = interface;
  PIIterable_1__GenericAttributeProfile_IGattCharacteristic = ^IIterable_1__GenericAttributeProfile_IGattCharacteristic;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IIterator_1__GenericAttributeProfile_IGattDeviceService = interface;
  PIIterator_1__GenericAttributeProfile_IGattDeviceService = ^IIterator_1__GenericAttributeProfile_IGattDeviceService;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IIterable_1__GenericAttributeProfile_IGattDeviceService = interface;
  PIIterable_1__GenericAttributeProfile_IGattDeviceService = ^IIterable_1__GenericAttributeProfile_IGattDeviceService;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  AsyncOperationCompletedHandler_1__IBluetoothLEDevice = interface;
  PAsyncOperationCompletedHandler_1__IBluetoothLEDevice = ^AsyncOperationCompletedHandler_1__IBluetoothLEDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  IAsyncOperation_1__IBluetoothLEDevice = interface;
  PIAsyncOperation_1__IBluetoothLEDevice = ^IAsyncOperation_1__IBluetoothLEDevice;

  // Windows.Devices.Bluetooth.IBluetoothLEDeviceStatics
  IBluetoothLEDeviceStatics = interface;
  PIBluetoothLEDeviceStatics = ^IBluetoothLEDeviceStatics;

  // Windows.Devices.Bluetooth.IBluetoothLEDeviceStatics2
  IBluetoothLEDeviceStatics2 = interface;
  PIBluetoothLEDeviceStatics2 = ^IBluetoothLEDeviceStatics2;

  // Windows.Devices.Bluetooth.IBluetoothLEDevice2
  IBluetoothLEDevice2 = interface;
  PIBluetoothLEDevice2 = ^IBluetoothLEDevice2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult
  GenericAttributeProfile_IGattDeviceServicesResult = interface;
  PGenericAttributeProfile_IGattDeviceServicesResult = ^GenericAttributeProfile_IGattDeviceServicesResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult;

  // Windows.Devices.Bluetooth.IBluetoothLEDevice3
  IBluetoothLEDevice3 = interface;
  PIBluetoothLEDevice3 = ^IBluetoothLEDevice3;

  // Windows.Devices.Bluetooth.IBluetoothLEDevice4
  IBluetoothLEDevice4 = interface;
  PIBluetoothLEDevice4 = ^IBluetoothLEDevice4;

  // Windows.Devices.Bluetooth.IBluetoothClassOfDeviceStatics
  IBluetoothClassOfDeviceStatics = interface;
  PIBluetoothClassOfDeviceStatics = ^IBluetoothClassOfDeviceStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattProtocolErrorStatics
  GenericAttributeProfile_IGattProtocolErrorStatics = interface;
  PGenericAttributeProfile_IGattProtocolErrorStatics = ^GenericAttributeProfile_IGattProtocolErrorStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  IAsyncOperation_1__GenericAttributeProfile_IGattSession = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattSession = ^IAsyncOperation_1__GenericAttributeProfile_IGattSession;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatics
  GenericAttributeProfile_IGattSessionStatics = interface;
  PGenericAttributeProfile_IGattSessionStatics = ^GenericAttributeProfile_IGattSessionStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattDeviceService = ^IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServiceStatics
  GenericAttributeProfile_IGattDeviceServiceStatics = interface;
  PGenericAttributeProfile_IGattDeviceServiceStatics = ^GenericAttributeProfile_IGattDeviceServiceStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServiceStatics2
  GenericAttributeProfile_IGattDeviceServiceStatics2 = interface;
  PGenericAttributeProfile_IGattDeviceServiceStatics2 = ^GenericAttributeProfile_IGattDeviceServiceStatics2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService2
  GenericAttributeProfile_IGattDeviceService2 = interface;
  PGenericAttributeProfile_IGattDeviceService2 = ^GenericAttributeProfile_IGattDeviceService2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus = interface;
  PIAsyncOperation_1__GenericAttributeProfile_GattOpenStatus = ^IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult
  GenericAttributeProfile_IGattCharacteristicsResult = interface;
  PGenericAttributeProfile_IGattCharacteristicsResult = ^GenericAttributeProfile_IGattCharacteristicsResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService3
  GenericAttributeProfile_IGattDeviceService3 = interface;
  PGenericAttributeProfile_IGattDeviceService3 = ^GenericAttributeProfile_IGattDeviceService3;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicStatics
  GenericAttributeProfile_IGattCharacteristicStatics = interface;
  PGenericAttributeProfile_IGattCharacteristicStatics = ^GenericAttributeProfile_IGattCharacteristicStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic2
  GenericAttributeProfile_IGattCharacteristic2 = interface;
  PGenericAttributeProfile_IGattCharacteristic2 = ^GenericAttributeProfile_IGattCharacteristic2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult
  GenericAttributeProfile_IGattDescriptorsResult = interface;
  PGenericAttributeProfile_IGattDescriptorsResult = ^GenericAttributeProfile_IGattDescriptorsResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult
  GenericAttributeProfile_IGattWriteResult = interface;
  PGenericAttributeProfile_IGattWriteResult = ^GenericAttributeProfile_IGattWriteResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattWriteResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic3
  GenericAttributeProfile_IGattCharacteristic3 = interface;
  PGenericAttributeProfile_IGattCharacteristic3 = ^GenericAttributeProfile_IGattCharacteristic3;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorStatics
  GenericAttributeProfile_IGattDescriptorStatics = interface;
  PGenericAttributeProfile_IGattDescriptorStatics = ^GenericAttributeProfile_IGattDescriptorStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor2
  GenericAttributeProfile_IGattDescriptor2 = interface;
  PGenericAttributeProfile_IGattDescriptor2 = ^GenericAttributeProfile_IGattDescriptor2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatTypesStatics
  GenericAttributeProfile_IGattPresentationFormatTypesStatics = interface;
  PGenericAttributeProfile_IGattPresentationFormatTypesStatics = ^GenericAttributeProfile_IGattPresentationFormatTypesStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatStatics
  GenericAttributeProfile_IGattPresentationFormatStatics = interface;
  PGenericAttributeProfile_IGattPresentationFormatStatics = ^GenericAttributeProfile_IGattPresentationFormatStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatStatics2
  GenericAttributeProfile_IGattPresentationFormatStatics2 = interface;
  PGenericAttributeProfile_IGattPresentationFormatStatics2 = ^GenericAttributeProfile_IGattPresentationFormatStatics2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceUuidsStatics
  GenericAttributeProfile_IGattServiceUuidsStatics = interface;
  PGenericAttributeProfile_IGattServiceUuidsStatics = ^GenericAttributeProfile_IGattServiceUuidsStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceUuidsStatics2
  GenericAttributeProfile_IGattServiceUuidsStatics2 = interface;
  PGenericAttributeProfile_IGattServiceUuidsStatics2 = ^GenericAttributeProfile_IGattServiceUuidsStatics2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicUuidsStatics
  GenericAttributeProfile_IGattCharacteristicUuidsStatics = interface;
  PGenericAttributeProfile_IGattCharacteristicUuidsStatics = ^GenericAttributeProfile_IGattCharacteristicUuidsStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicUuidsStatics2
  GenericAttributeProfile_IGattCharacteristicUuidsStatics2 = interface;
  PGenericAttributeProfile_IGattCharacteristicUuidsStatics2 = ^GenericAttributeProfile_IGattCharacteristicUuidsStatics2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorUuidsStatics
  GenericAttributeProfile_IGattDescriptorUuidsStatics = interface;
  PGenericAttributeProfile_IGattDescriptorUuidsStatics = ^GenericAttributeProfile_IGattDescriptorUuidsStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction
  GenericAttributeProfile_IGattReliableWriteTransaction = interface;
  PGenericAttributeProfile_IGattReliableWriteTransaction = ^GenericAttributeProfile_IGattReliableWriteTransaction;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction2
  GenericAttributeProfile_IGattReliableWriteTransaction2 = interface;
  PGenericAttributeProfile_IGattReliableWriteTransaction2 = ^GenericAttributeProfile_IGattReliableWriteTransaction2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult2
  GenericAttributeProfile_IGattReadResult2 = interface;
  PGenericAttributeProfile_IGattReadResult2 = ^GenericAttributeProfile_IGattReadResult2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult2
  GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult2 = interface;
  PGenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult2 = ^GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult2;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs
  GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs = interface;
  PGenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs = ^GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs = ^TypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
  GenericAttributeProfile_IGattServiceProvider = interface;
  PGenericAttributeProfile_IGattServiceProvider = ^GenericAttributeProfile_IGattServiceProvider;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult
  GenericAttributeProfile_IGattServiceProviderResult = interface;
  PGenericAttributeProfile_IGattServiceProviderResult = ^GenericAttributeProfile_IGattServiceProviderResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult = interface;
  PAsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult = ^AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult = interface;
  PIAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult = ^IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderStatics
  GenericAttributeProfile_IGattServiceProviderStatics = interface;
  PGenericAttributeProfile_IGattServiceProviderStatics = ^GenericAttributeProfile_IGattServiceProviderStatics;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult2
  GenericAttributeProfile_IGattClientNotificationResult2 = interface;
  PGenericAttributeProfile_IGattClientNotificationResult2 = ^GenericAttributeProfile_IGattClientNotificationResult2;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceIdStatics
  Rfcomm_IRfcommServiceIdStatics = interface;
  PRfcomm_IRfcommServiceIdStatics = ^Rfcomm_IRfcommServiceIdStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService = interface;
  PAsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService = ^AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IAsyncOperation_1__Rfcomm_IRfcommDeviceService = interface;
  PIAsyncOperation_1__Rfcomm_IRfcommDeviceService = ^IAsyncOperation_1__Rfcomm_IRfcommDeviceService;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServiceStatics
  Rfcomm_IRfcommDeviceServiceStatics = interface;
  PRfcomm_IRfcommDeviceServiceStatics = ^Rfcomm_IRfcommDeviceServiceStatics;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServiceStatics2
  Rfcomm_IRfcommDeviceServiceStatics2 = interface;
  PRfcomm_IRfcommDeviceServiceStatics2 = ^Rfcomm_IRfcommDeviceServiceStatics2;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService2
  Rfcomm_IRfcommDeviceService2 = interface;
  PRfcomm_IRfcommDeviceService2 = ^Rfcomm_IRfcommDeviceService2;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService3
  Rfcomm_IRfcommDeviceService3 = interface;
  PRfcomm_IRfcommDeviceService3 = ^Rfcomm_IRfcommDeviceService3;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider
  Rfcomm_IRfcommServiceProvider = interface;
  PRfcomm_IRfcommServiceProvider = ^Rfcomm_IRfcommServiceProvider;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider = interface;
  PAsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider = ^AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  IAsyncOperation_1__Rfcomm_IRfcommServiceProvider = interface;
  PIAsyncOperation_1__Rfcomm_IRfcommServiceProvider = ^IAsyncOperation_1__Rfcomm_IRfcommServiceProvider;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProviderStatics
  Rfcomm_IRfcommServiceProviderStatics = interface;
  PRfcomm_IRfcommServiceProviderStatics = ^Rfcomm_IRfcommServiceProviderStatics;

  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider2
  Rfcomm_IRfcommServiceProvider2 = interface;
  PRfcomm_IRfcommServiceProvider2 = ^Rfcomm_IRfcommServiceProvider2;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs = interface;
  PIIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs = ^IIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IIterable_1__GenericAttributeProfile_IGattValueChangedEventArgs = interface;
  PIIterable_1__GenericAttributeProfile_IGattValueChangedEventArgs = ^IIterable_1__GenericAttributeProfile_IGattValueChangedEventArgs;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IVectorView_1__GenericAttributeProfile_IGattValueChangedEventArgs = interface;
  PIVectorView_1__GenericAttributeProfile_IGattValueChangedEventArgs = ^IVectorView_1__GenericAttributeProfile_IGattValueChangedEventArgs;

  // Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection
  Background_IGattServiceProviderConnection = interface;
  PBackground_IGattServiceProviderConnection = ^Background_IGattServiceProviderConnection;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = interface;
  PIKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = ^IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  IIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = ^IIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  IIterable_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = ^IIterable_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  IMapView_2__HSTRING__Background_IGattServiceProviderConnection = interface;
  PIMapView_2__HSTRING__Background_IGattServiceProviderConnection = ^IMapView_2__HSTRING__Background_IGattServiceProviderConnection;

  // Windows.Devices.Bluetooth.Background.IGattServiceProviderConnectionStatics
  Background_IGattServiceProviderConnectionStatics = interface;
  PBackground_IGattServiceProviderConnectionStatics = ^Background_IGattServiceProviderConnectionStatics;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Devices.Bluetooth Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IIterator_1__GenericAttributeProfile_IGattDescriptor_Base = interface(IInspectable)
  ['{3D8DF436-CEFB-5FFB-858C-4882CE1DA079}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IIterator_1__GenericAttributeProfile_IGattDescriptor = interface(IIterator_1__GenericAttributeProfile_IGattDescriptor_Base)
  ['{D69006B8-AE84-5F9F-8AE8-6E247776A601}']
    function get_Current: GenericAttributeProfile_IGattDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattDescriptor): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IIterable_1__GenericAttributeProfile_IGattDescriptor_Base = interface(IInspectable)
  ['{30E2FFC4-3AA3-5219-9A18-CA2D0B6562E8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  IIterable_1__GenericAttributeProfile_IGattDescriptor = interface(IIterable_1__GenericAttributeProfile_IGattDescriptor_Base)
  ['{FFADB7B1-7363-520B-AAE6-9C4076F019D2}']
    function First: IIterator_1__GenericAttributeProfile_IGattDescriptor; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IIterator_1__GenericAttributeProfile_IGattPresentationFormat_Base = interface(IInspectable)
  ['{20006C53-5DDA-5319-91B1-C6F28FE65933}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IIterator_1__GenericAttributeProfile_IGattPresentationFormat = interface(IIterator_1__GenericAttributeProfile_IGattPresentationFormat_Base)
  ['{5ACD2F6A-F8C6-59BD-A0D2-A103C4CA22AA}']
    function get_Current: GenericAttributeProfile_IGattPresentationFormat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattPresentationFormat): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattPresentationFormat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IIterable_1__GenericAttributeProfile_IGattPresentationFormat_Base = interface(IInspectable)
  ['{D75FCEF1-C10E-5B7B-B130-F5A00314D35D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IIterable_1__GenericAttributeProfile_IGattPresentationFormat = interface(IIterable_1__GenericAttributeProfile_IGattPresentationFormat_Base)
  ['{14DBBC80-0C57-5698-BFFE-F7B532896AB3}']
    function First: IIterator_1__GenericAttributeProfile_IGattPresentationFormat; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IIterator_1__GenericAttributeProfile_IGattLocalDescriptor_Base = interface(IInspectable)
  ['{08023045-5F5C-59CC-ABD3-BBCFE6FA7030}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IIterator_1__GenericAttributeProfile_IGattLocalDescriptor = interface(IIterator_1__GenericAttributeProfile_IGattLocalDescriptor_Base)
  ['{BDEA0872-BBD7-5928-9B8A-AA95775FE674}']
    function get_Current: GenericAttributeProfile_IGattLocalDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattLocalDescriptor): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattLocalDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IIterable_1__GenericAttributeProfile_IGattLocalDescriptor_Base = interface(IInspectable)
  ['{9016E9A2-C9F7-5D09-B0AE-552FA67796AE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor>
  IIterable_1__GenericAttributeProfile_IGattLocalDescriptor = interface(IIterable_1__GenericAttributeProfile_IGattLocalDescriptor_Base)
  ['{8F713FA3-69AA-5F2A-BD52-846B7651B911}']
    function First: IIterator_1__GenericAttributeProfile_IGattLocalDescriptor; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IIterator_1__GenericAttributeProfile_IGattSubscribedClient_Base = interface(IInspectable)
  ['{DF039115-A5FF-5D5A-B07B-20B42E078765}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IIterator_1__GenericAttributeProfile_IGattSubscribedClient = interface(IIterator_1__GenericAttributeProfile_IGattSubscribedClient_Base)
  ['{3FCB9572-D2AC-5507-B6AE-B7551F0E496C}']
    function get_Current: GenericAttributeProfile_IGattSubscribedClient; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattSubscribedClient): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattSubscribedClient read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IIterable_1__GenericAttributeProfile_IGattSubscribedClient_Base = interface(IInspectable)
  ['{B19864E4-F2B1-50DE-8C11-FFF9ECA934E9}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient>
  IIterable_1__GenericAttributeProfile_IGattSubscribedClient = interface(IIterable_1__GenericAttributeProfile_IGattSubscribedClient_Base)
  ['{31C463B4-2D8B-5A43-B3FE-68B9B3BF27C7}']
    function First: IIterator_1__GenericAttributeProfile_IGattSubscribedClient; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IIterator_1__GenericAttributeProfile_IGattClientNotificationResult_Base = interface(IInspectable)
  ['{FCA87386-A3AB-55E2-A83E-21F5BFAB4049}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IIterator_1__GenericAttributeProfile_IGattClientNotificationResult = interface(IIterator_1__GenericAttributeProfile_IGattClientNotificationResult_Base)
  ['{ED77FC4B-572D-5FB7-BAAB-75B4A5C41030}']
    function get_Current: GenericAttributeProfile_IGattClientNotificationResult; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattClientNotificationResult): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattClientNotificationResult read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IIterable_1__GenericAttributeProfile_IGattClientNotificationResult_Base = interface(IInspectable)
  ['{D3F4B8AD-251F-5BBB-ADA2-EA47434E74D6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult>
  IIterable_1__GenericAttributeProfile_IGattClientNotificationResult = interface(IIterable_1__GenericAttributeProfile_IGattClientNotificationResult_Base)
  ['{A6AA475A-7B41-5F8A-9F5E-CB9AC8B74E55}']
    function First: IIterator_1__GenericAttributeProfile_IGattClientNotificationResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
  // Used Types:  Windows.Devices.Bluetooth.BluetoothError
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattLocalCharacteristicResult)]
  GenericAttributeProfile_IGattLocalCharacteristicResult = interface(IInspectable)
  ['{7975DE9B-0170-4397-9666-92F863F12EE6}']
    function get_Characteristic: GenericAttributeProfile_IGattLocalCharacteristic; safecall;
    function get_Error: BluetoothError; safecall;
    property Characteristic: GenericAttributeProfile_IGattLocalCharacteristic read get_Characteristic;
    property Error: BluetoothError read get_Error;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult_Delegate_Base = interface(IUnknown)
  ['{85C70EDD-D815-5284-8C84-58A8F769E388}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult_Delegate_Base)
  ['{D3887AC8-9FEA-5D39-911C-22BAF366E048}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult_Base = interface(IInspectable)
  ['{1F97164E-88D5-567D-90F9-75D4F6455274}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult_Base)
  ['{1BEDF471-F925-5E7E-833E-D753210C766B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult; safecall;
    function GetResults: GenericAttributeProfile_IGattLocalCharacteristicResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattLocalCharacteristicResult read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  IVector_1__GenericAttributeProfile_IGattPresentationFormat = interface(IInspectable)
  ['{9A1587B3-DE1B-5D7E-BF56-147970DA54B3}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattPresentationFormat; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__GenericAttributeProfile_IGattPresentationFormat; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattPresentationFormat; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: GenericAttributeProfile_IGattPresentationFormat); safecall;
    procedure InsertAt(index: Cardinal; value: GenericAttributeProfile_IGattPresentationFormat); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: GenericAttributeProfile_IGattPresentationFormat); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattPresentationFormat): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattPresentationFormat); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicProperties
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtectionLevel
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattLocalCharacteristicParameters)]
  GenericAttributeProfile_IGattLocalCharacteristicParameters = interface(IInspectable)
  ['{FAF73DB4-4CFF-44C7-8445-040E6EAD0063}']
    procedure put_StaticValue(value: IBuffer); safecall;
    function get_StaticValue: IBuffer; safecall;
    procedure put_CharacteristicProperties(value: GenericAttributeProfile_GattCharacteristicProperties); safecall;
    function get_CharacteristicProperties: GenericAttributeProfile_GattCharacteristicProperties; safecall;
    procedure put_ReadProtectionLevel(value: GenericAttributeProfile_GattProtectionLevel); safecall;
    function get_ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    procedure put_WriteProtectionLevel(value: GenericAttributeProfile_GattProtectionLevel); safecall;
    function get_WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel; safecall;
    procedure put_UserDescription(value: HSTRING); safecall;
    function get_UserDescription: HSTRING; safecall;
    function get_PresentationFormats: IVector_1__GenericAttributeProfile_IGattPresentationFormat; safecall;
    property CharacteristicProperties: GenericAttributeProfile_GattCharacteristicProperties read get_CharacteristicProperties write put_CharacteristicProperties;
    property PresentationFormats: IVector_1__GenericAttributeProfile_IGattPresentationFormat read get_PresentationFormats;
    property ReadProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_ReadProtectionLevel write put_ReadProtectionLevel;
    property StaticValue: IBuffer read get_StaticValue write put_StaticValue;
    property UserDescription: HSTRING read get_UserDescription write put_UserDescription;
    property WriteProtectionLevel: GenericAttributeProfile_GattProtectionLevel read get_WriteProtectionLevel write put_WriteProtectionLevel;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IIterator_1__GenericAttributeProfile_IGattLocalCharacteristic_Base = interface(IInspectable)
  ['{EDD74875-8E85-546F-83B8-1E00AA896419}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IIterator_1__GenericAttributeProfile_IGattLocalCharacteristic = interface(IIterator_1__GenericAttributeProfile_IGattLocalCharacteristic_Base)
  ['{7C77A33F-4C60-517C-BBAA-209AA91C496C}']
    function get_Current: GenericAttributeProfile_IGattLocalCharacteristic; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattLocalCharacteristic): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattLocalCharacteristic read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IIterable_1__GenericAttributeProfile_IGattLocalCharacteristic_Base = interface(IInspectable)
  ['{7082ED53-37F6-5262-8D09-939BEA9EDBD5}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IIterable_1__GenericAttributeProfile_IGattLocalCharacteristic = interface(IIterable_1__GenericAttributeProfile_IGattLocalCharacteristic_Base)
  ['{92D01E39-808D-5B6D-982B-143C382EA6A1}']
    function First: IIterator_1__GenericAttributeProfile_IGattLocalCharacteristic; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  IVectorView_1__GenericAttributeProfile_IGattLocalCharacteristic = interface(IInspectable)
  ['{03006881-0DAA-5C2A-B84A-C036A8ED3D9D}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattLocalCharacteristic; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattLocalCharacteristic; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattLocalCharacteristic): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattLocalService)]
  GenericAttributeProfile_IGattLocalService = interface(IInspectable)
  ['{F513E258-F7F7-4902-B803-57FCC7D6FE83}']
    function get_Uuid: TGuid; safecall;
    function CreateCharacteristicAsync(characteristicUuid: TGuid; parameters: GenericAttributeProfile_IGattLocalCharacteristicParameters): IAsyncOperation_1__GenericAttributeProfile_IGattLocalCharacteristicResult; safecall;
    function get_Characteristics: IVectorView_1__GenericAttributeProfile_IGattLocalCharacteristic; safecall;
    property Characteristics: IVectorView_1__GenericAttributeProfile_IGattLocalCharacteristic read get_Characteristics;
    property Uuid: TGuid read get_Uuid;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceProviderAdvertisingParameters)]
  GenericAttributeProfile_IGattServiceProviderAdvertisingParameters = interface(IInspectable)
  ['{E2CE31AB-6315-4C22-9BD7-781DBC3D8D82}']
    procedure put_IsConnectable(value: Boolean); safecall;
    function get_IsConnectable: Boolean; safecall;
    procedure put_IsDiscoverable(value: Boolean); safecall;
    function get_IsDiscoverable: Boolean; safecall;
    property IsConnectable: Boolean read get_IsConnectable write put_IsConnectable;
    property IsDiscoverable: Boolean read get_IsDiscoverable write put_IsDiscoverable;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int16>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
  [WinRTClassNameAttribute(SBluetoothSignalStrengthFilter)]
  IBluetoothSignalStrengthFilter = interface(IInspectable)
  ['{DF7B7391-6BB5-4CFE-90B1-5D7324EDCF7F}']
    function get_InRangeThresholdInDBm: IReference_1__SmallInt; safecall;
    procedure put_InRangeThresholdInDBm(value: IReference_1__SmallInt); safecall;
    function get_OutOfRangeThresholdInDBm: IReference_1__SmallInt; safecall;
    procedure put_OutOfRangeThresholdInDBm(value: IReference_1__SmallInt); safecall;
    function get_OutOfRangeTimeout: IReference_1__TimeSpan; safecall;
    procedure put_OutOfRangeTimeout(value: IReference_1__TimeSpan); safecall;
    function get_SamplingInterval: IReference_1__TimeSpan; safecall;
    procedure put_SamplingInterval(value: IReference_1__TimeSpan); safecall;
    property InRangeThresholdInDBm: IReference_1__SmallInt read get_InRangeThresholdInDBm write put_InRangeThresholdInDBm;
    property OutOfRangeThresholdInDBm: IReference_1__SmallInt read get_OutOfRangeThresholdInDBm write put_OutOfRangeThresholdInDBm;
    property OutOfRangeTimeout: IReference_1__TimeSpan read get_OutOfRangeTimeout write put_OutOfRangeTimeout;
    property SamplingInterval: IReference_1__TimeSpan read get_SamplingInterval write put_SamplingInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt64
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.IRadio>
  }
  // Windows.Devices.Bluetooth.IBluetoothAdapter
  [WinRTClassNameAttribute(SBluetoothAdapter)]
  IBluetoothAdapter = interface(IInspectable)
  ['{7974F04C-5F7A-4A34-9225-A855F84B1A8B}']
    function get_DeviceId: HSTRING; safecall;
    function get_BluetoothAddress: UInt64; safecall;
    function get_IsClassicSupported: Boolean; safecall;
    function get_IsLowEnergySupported: Boolean; safecall;
    function get_IsPeripheralRoleSupported: Boolean; safecall;
    function get_IsCentralRoleSupported: Boolean; safecall;
    function get_IsAdvertisementOffloadSupported: Boolean; safecall;
    function GetRadioAsync: IAsyncOperation_1__Radios_IRadio; safecall;
    property BluetoothAddress: UInt64 read get_BluetoothAddress;
    property DeviceId: HSTRING read get_DeviceId;
    property IsAdvertisementOffloadSupported: Boolean read get_IsAdvertisementOffloadSupported;
    property IsCentralRoleSupported: Boolean read get_IsCentralRoleSupported;
    property IsClassicSupported: Boolean read get_IsClassicSupported;
    property IsLowEnergySupported: Boolean read get_IsLowEnergySupported;
    property IsPeripheralRoleSupported: Boolean read get_IsPeripheralRoleSupported;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  AsyncOperationCompletedHandler_1__IBluetoothAdapter_Delegate_Base = interface(IUnknown)
  ['{10A10A88-90E0-511A-9A08-D75FEB52A19F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  AsyncOperationCompletedHandler_1__IBluetoothAdapter = interface(AsyncOperationCompletedHandler_1__IBluetoothAdapter_Delegate_Base)
  ['{9747F666-398E-557E-87F8-398AF4E6271B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IBluetoothAdapter; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  IAsyncOperation_1__IBluetoothAdapter_Base = interface(IInspectable)
  ['{46FCE70C-6C07-5A3A-B775-26F99402553F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothAdapter
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  IAsyncOperation_1__IBluetoothAdapter = interface(IAsyncOperation_1__IBluetoothAdapter_Base)
  ['{D589731E-1A0C-5334-AE45-77F10B689B69}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IBluetoothAdapter); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IBluetoothAdapter; safecall;
    function GetResults: IBluetoothAdapter; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IBluetoothAdapter read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothAdapter>
  }
  // Windows.Devices.Bluetooth.IBluetoothAdapterStatics
  [WinRTClassNameAttribute(SBluetoothAdapter)]
  IBluetoothAdapterStatics = interface(IInspectable)
  ['{8B02FB6A-AC4C-4741-8661-8EAB7D17EA9F}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothAdapter; safecall;
    function GetDefaultAsync: IAsyncOperation_1__IBluetoothAdapter; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDeviceId
  // Used Types:  String
  }
  // Windows.Devices.Bluetooth.IBluetoothDeviceIdStatics
  [WinRTClassNameAttribute(SBluetoothDeviceId)]
  IBluetoothDeviceIdStatics = interface(IInspectable)
  ['{A7884E67-3EFB-4F31-BBC2-810E09977404}']
    function FromId(deviceId: HSTRING): IBluetoothDeviceId; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  }
  // Windows.Devices.Bluetooth.IBluetoothUuidHelperStatics
  [WinRTClassNameAttribute(SBluetoothUuidHelper)]
  IBluetoothUuidHelperStatics = interface(IInspectable)
  ['{17DF0CD8-CF74-4B21-AFE6-F57A11BCDEA0}']
    function FromShortId(shortId: Cardinal): TGuid; safecall;
    function TryGetShortId(uuid: TGuid): IReference_1__Cardinal; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IIterator_1__Rfcomm_IRfcommDeviceService_Base = interface(IInspectable)
  ['{64AB0132-C64C-5A87-8113-613EF356924C}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IIterator_1__Rfcomm_IRfcommDeviceService = interface(IIterator_1__Rfcomm_IRfcommDeviceService_Base)
  ['{F00FFD9B-BCA7-5F4D-867A-4B48841290B0}']
    function get_Current: Rfcomm_IRfcommDeviceService; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PRfcomm_IRfcommDeviceService): Cardinal; safecall;
    property Current: Rfcomm_IRfcommDeviceService read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IIterable_1__Rfcomm_IRfcommDeviceService_Base = interface(IInspectable)
  ['{3378E9A6-F6E2-50EA-BFEE-B8109631FECA}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IIterable_1__Rfcomm_IRfcommDeviceService = interface(IIterable_1__Rfcomm_IRfcommDeviceService_Base)
  ['{97D4D552-D3D3-58F3-8898-94F214591AFF}']
    function First: IIterator_1__Rfcomm_IRfcommDeviceService; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  AsyncOperationCompletedHandler_1__IBluetoothDevice_Delegate_Base = interface(IUnknown)
  ['{B2E8CDD1-66AA-5892-85A3-8F0B165E43FC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  AsyncOperationCompletedHandler_1__IBluetoothDevice = interface(AsyncOperationCompletedHandler_1__IBluetoothDevice_Delegate_Base)
  ['{BCF1744C-5B01-5A78-A60C-5C4356372057}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IBluetoothDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  IAsyncOperation_1__IBluetoothDevice_Base = interface(IInspectable)
  ['{B58D8D19-44BD-5AC0-A0D6-1B50800F3181}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  IAsyncOperation_1__IBluetoothDevice = interface(IAsyncOperation_1__IBluetoothDevice_Base)
  ['{7D9DE800-D40C-5FE7-B81B-8B7F489BF3D5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IBluetoothDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IBluetoothDevice; safecall;
    function GetResults: IBluetoothDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IBluetoothDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothDevice>
  // Used Types:  String
  // Used Types:  Windows.Networking.IHostName
  // Used Types:  UInt64
  }
  // Windows.Devices.Bluetooth.IBluetoothDeviceStatics
  [WinRTClassNameAttribute(SBluetoothDevice)]
  IBluetoothDeviceStatics = interface(IInspectable)
  ['{0991DF51-57DB-4725-BBD7-84F64327EC2C}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothDevice; safecall;
    function FromHostNameAsync(hostName: IHostName): IAsyncOperation_1__IBluetoothDevice; safecall;
    function FromBluetoothAddressAsync(address: UInt64): IAsyncOperation_1__IBluetoothDevice; safecall;
    function GetDeviceSelector: HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Bluetooth.BluetoothConnectionStatus
  // Used Types:  UInt64
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothClassOfDevice
  }
  // Windows.Devices.Bluetooth.IBluetoothDeviceStatics2
  [WinRTClassNameAttribute(SBluetoothDevice)]
  IBluetoothDeviceStatics2 = interface(IInspectable)
  ['{C29E8E2F-4E14-4477-AA1B-B8B47E5B7ECE}']
    function GetDeviceSelectorFromPairingState(pairingState: Boolean): HSTRING; safecall;
    function GetDeviceSelectorFromConnectionStatus(connectionStatus: BluetoothConnectionStatus): HSTRING; safecall;
    function GetDeviceSelectorFromDeviceName(deviceName: HSTRING): HSTRING; safecall;
    function GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64): HSTRING; safecall;
    function GetDeviceSelectorFromClassOfDevice(classOfDevice: IBluetoothClassOfDevice): HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Devices.Bluetooth.IBluetoothDevice2
  IBluetoothDevice2 = interface(IInspectable)
  ['{0133F954-B156-4DD0-B1F5-C11BC31A5163}']
    function get_DeviceInformation: IDeviceInformation; safecall;
    property DeviceInformation: IDeviceInformation read get_DeviceInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.BluetoothError
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult
  [WinRTClassNameAttribute(SRfcomm_RfcommDeviceServicesResult)]
  Rfcomm_IRfcommDeviceServicesResult = interface(IInspectable)
  ['{3B48388C-7CCF-488E-9625-D259A5732D55}']
    function get_Error: BluetoothError; safecall;
    function get_Services: IVectorView_1__Rfcomm_IRfcommDeviceService; safecall;
    property Error: BluetoothError read get_Error;
    property Services: IVectorView_1__Rfcomm_IRfcommDeviceService read get_Services;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult_Delegate_Base = interface(IUnknown)
  ['{522C25D1-866B-5DE4-BD8E-1FEB5AE60D47}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult = interface(AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult_Delegate_Base)
  ['{09E4E7A9-852E-593E-ADB6-2E837011ACB2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult_Base = interface(IInspectable)
  ['{B7F2F74D-BF9C-5721-BF6E-03F1B4409588}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult = interface(IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult_Base)
  ['{7C9E6E8B-7A9E-53C7-B44F-27F315813E9D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult; safecall;
    function GetResults: Rfcomm_IRfcommDeviceServicesResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceServicesResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceAccessInformation
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.DeviceAccessStatus>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult>
  // Used Types:  Windows.Devices.Bluetooth.BluetoothCacheMode
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  }
  // Windows.Devices.Bluetooth.IBluetoothDevice3
  IBluetoothDevice3 = interface(IInspectable)
  ['{57FFF78B-651A-4454-B90F-EB21EF0B0D71}']
    function get_DeviceAccessInformation: IDeviceAccessInformation; safecall;
    function RequestAccessAsync: IAsyncOperation_1__DeviceAccessStatus; safecall;
    function GetRfcommServicesAsync: IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult; overload; safecall;
    function GetRfcommServicesAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult; overload; safecall;
    function GetRfcommServicesForIdAsync(serviceId: Rfcomm_IRfcommServiceId): IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult; overload; safecall;
    function GetRfcommServicesForIdAsync(serviceId: Rfcomm_IRfcommServiceId; cacheMode: BluetoothCacheMode): IAsyncOperation_1__Rfcomm_IRfcommDeviceServicesResult; overload; safecall;
    property DeviceAccessInformation: IDeviceAccessInformation read get_DeviceAccessInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDeviceId
  }
  // Windows.Devices.Bluetooth.IBluetoothDevice4
  IBluetoothDevice4 = interface(IInspectable)
  ['{817C34AD-0E9C-42B2-A8DC-3E8094940D12}']
    function get_BluetoothDeviceId: IBluetoothDeviceId; safecall;
    property BluetoothDeviceId: IBluetoothDeviceId read get_BluetoothDeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.IBluetoothLEAppearanceCategoriesStatics
  [WinRTClassNameAttribute(SBluetoothLEAppearanceCategories)]
  IBluetoothLEAppearanceCategoriesStatics = interface(IInspectable)
  ['{6D4D54FE-046A-4185-AAB6-824CF0610861}']
    function get_Uncategorized: Word; safecall;
    function get_Phone: Word; safecall;
    function get_Computer: Word; safecall;
    function get_Watch: Word; safecall;
    function get_Clock: Word; safecall;
    function get_Display: Word; safecall;
    function get_RemoteControl: Word; safecall;
    function get_EyeGlasses: Word; safecall;
    function get_Tag: Word; safecall;
    function get_Keyring: Word; safecall;
    function get_MediaPlayer: Word; safecall;
    function get_BarcodeScanner: Word; safecall;
    function get_Thermometer: Word; safecall;
    function get_HeartRate: Word; safecall;
    function get_BloodPressure: Word; safecall;
    function get_HumanInterfaceDevice: Word; safecall;
    function get_GlucoseMeter: Word; safecall;
    function get_RunningWalking: Word; safecall;
    function get_Cycling: Word; safecall;
    function get_PulseOximeter: Word; safecall;
    function get_WeightScale: Word; safecall;
    function get_OutdoorSportActivity: Word; safecall;
    property BarcodeScanner: Word read get_BarcodeScanner;
    property BloodPressure: Word read get_BloodPressure;
    property Clock: Word read get_Clock;
    property Computer: Word read get_Computer;
    property Cycling: Word read get_Cycling;
    property Display: Word read get_Display;
    property EyeGlasses: Word read get_EyeGlasses;
    property GlucoseMeter: Word read get_GlucoseMeter;
    property HeartRate: Word read get_HeartRate;
    property HumanInterfaceDevice: Word read get_HumanInterfaceDevice;
    property Keyring: Word read get_Keyring;
    property MediaPlayer: Word read get_MediaPlayer;
    property OutdoorSportActivity: Word read get_OutdoorSportActivity;
    property Phone: Word read get_Phone;
    property PulseOximeter: Word read get_PulseOximeter;
    property RemoteControl: Word read get_RemoteControl;
    property RunningWalking: Word read get_RunningWalking;
    property Tag: Word read get_Tag;
    property Thermometer: Word read get_Thermometer;
    property Uncategorized: Word read get_Uncategorized;
    property Watch: Word read get_Watch;
    property WeightScale: Word read get_WeightScale;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.IBluetoothLEAppearanceSubcategoriesStatics
  [WinRTClassNameAttribute(SBluetoothLEAppearanceSubcategories)]
  IBluetoothLEAppearanceSubcategoriesStatics = interface(IInspectable)
  ['{E57BA606-2144-415A-8312-71CCF291F8D1}']
    function get_Generic: Word; safecall;
    function get_SportsWatch: Word; safecall;
    function get_ThermometerEar: Word; safecall;
    function get_HeartRateBelt: Word; safecall;
    function get_BloodPressureArm: Word; safecall;
    function get_BloodPressureWrist: Word; safecall;
    function get_Keyboard: Word; safecall;
    function get_Mouse: Word; safecall;
    function get_Joystick: Word; safecall;
    function get_Gamepad: Word; safecall;
    function get_DigitizerTablet: Word; safecall;
    function get_CardReader: Word; safecall;
    function get_DigitalPen: Word; safecall;
    function get_BarcodeScanner: Word; safecall;
    function get_RunningWalkingInShoe: Word; safecall;
    function get_RunningWalkingOnShoe: Word; safecall;
    function get_RunningWalkingOnHip: Word; safecall;
    function get_CyclingComputer: Word; safecall;
    function get_CyclingSpeedSensor: Word; safecall;
    function get_CyclingCadenceSensor: Word; safecall;
    function get_CyclingPowerSensor: Word; safecall;
    function get_CyclingSpeedCadenceSensor: Word; safecall;
    function get_OximeterFingertip: Word; safecall;
    function get_OximeterWristWorn: Word; safecall;
    function get_LocationDisplay: Word; safecall;
    function get_LocationNavigationDisplay: Word; safecall;
    function get_LocationPod: Word; safecall;
    function get_LocationNavigationPod: Word; safecall;
    property BarcodeScanner: Word read get_BarcodeScanner;
    property BloodPressureArm: Word read get_BloodPressureArm;
    property BloodPressureWrist: Word read get_BloodPressureWrist;
    property CardReader: Word read get_CardReader;
    property CyclingCadenceSensor: Word read get_CyclingCadenceSensor;
    property CyclingComputer: Word read get_CyclingComputer;
    property CyclingPowerSensor: Word read get_CyclingPowerSensor;
    property CyclingSpeedCadenceSensor: Word read get_CyclingSpeedCadenceSensor;
    property CyclingSpeedSensor: Word read get_CyclingSpeedSensor;
    property DigitalPen: Word read get_DigitalPen;
    property DigitizerTablet: Word read get_DigitizerTablet;
    property Gamepad: Word read get_Gamepad;
    property Generic: Word read get_Generic;
    property HeartRateBelt: Word read get_HeartRateBelt;
    property Joystick: Word read get_Joystick;
    property Keyboard: Word read get_Keyboard;
    property LocationDisplay: Word read get_LocationDisplay;
    property LocationNavigationDisplay: Word read get_LocationNavigationDisplay;
    property LocationNavigationPod: Word read get_LocationNavigationPod;
    property LocationPod: Word read get_LocationPod;
    property Mouse: Word read get_Mouse;
    property OximeterFingertip: Word read get_OximeterFingertip;
    property OximeterWristWorn: Word read get_OximeterWristWorn;
    property RunningWalkingInShoe: Word read get_RunningWalkingInShoe;
    property RunningWalkingOnHip: Word read get_RunningWalkingOnHip;
    property RunningWalkingOnShoe: Word read get_RunningWalkingOnShoe;
    property SportsWatch: Word read get_SportsWatch;
    property ThermometerEar: Word read get_ThermometerEar;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.IBluetoothLEAppearance
  [WinRTClassNameAttribute(SBluetoothLEAppearance)]
  IBluetoothLEAppearance = interface(IInspectable)
  ['{5D2079F2-66A8-4258-985E-02B4D9509F18}']
    function get_RawValue: Word; safecall;
    function get_Category: Word; safecall;
    function get_SubCategory: Word; safecall;
    property Category: Word read get_Category;
    property RawValue: Word read get_RawValue;
    property SubCategory: Word read get_SubCategory;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothLEAppearance
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.IBluetoothLEAppearanceStatics
  [WinRTClassNameAttribute(SBluetoothLEAppearance)]
  IBluetoothLEAppearanceStatics = interface(IInspectable)
  ['{A193C0C7-4504-4F4A-9BA5-CD1054E5E065}']
    function FromRawValue(rawValue: Word): IBluetoothLEAppearance; safecall;
    function FromParts(appearanceCategory: Word; appearanceSubCategory: Word): IBluetoothLEAppearance; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IIterator_1__GenericAttributeProfile_IGattCharacteristic_Base = interface(IInspectable)
  ['{1FFC4777-4346-5564-B7A5-59EAE385F4F6}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IIterator_1__GenericAttributeProfile_IGattCharacteristic = interface(IIterator_1__GenericAttributeProfile_IGattCharacteristic_Base)
  ['{DBDCBD08-FD03-5CD2-AC27-CB4C8637755A}']
    function get_Current: GenericAttributeProfile_IGattCharacteristic; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattCharacteristic): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattCharacteristic read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IIterable_1__GenericAttributeProfile_IGattCharacteristic_Base = interface(IInspectable)
  ['{E3C56728-7F2D-5A0D-AD38-030D39C60F9F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  IIterable_1__GenericAttributeProfile_IGattCharacteristic = interface(IIterable_1__GenericAttributeProfile_IGattCharacteristic_Base)
  ['{0A1F6ACA-8DFF-58A2-A505-86D7FF7F4592}']
    function First: IIterator_1__GenericAttributeProfile_IGattCharacteristic; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IIterator_1__GenericAttributeProfile_IGattDeviceService_Base = interface(IInspectable)
  ['{8BEB3A26-73CA-50F3-A1D3-418C60A9F3B2}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IIterator_1__GenericAttributeProfile_IGattDeviceService = interface(IIterator_1__GenericAttributeProfile_IGattDeviceService_Base)
  ['{C0BFCA7A-4010-5A3E-A5B7-4A093B0D983C}']
    function get_Current: GenericAttributeProfile_IGattDeviceService; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattDeviceService): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattDeviceService read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IIterable_1__GenericAttributeProfile_IGattDeviceService_Base = interface(IInspectable)
  ['{4B192E23-4893-56B2-8EFF-439C3AB7FD1F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IIterable_1__GenericAttributeProfile_IGattDeviceService = interface(IIterable_1__GenericAttributeProfile_IGattDeviceService_Base)
  ['{35D49B12-34FE-5300-9A6C-05963EAA1B1C}']
    function First: IIterator_1__GenericAttributeProfile_IGattDeviceService; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  AsyncOperationCompletedHandler_1__IBluetoothLEDevice_Delegate_Base = interface(IUnknown)
  ['{9156B79F-C54A-5277-8F8B-D2CC43C7E004}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  AsyncOperationCompletedHandler_1__IBluetoothLEDevice = interface(AsyncOperationCompletedHandler_1__IBluetoothLEDevice_Delegate_Base)
  ['{C419959E-2699-526E-BB76-574BFD539521}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IBluetoothLEDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  IAsyncOperation_1__IBluetoothLEDevice_Base = interface(IInspectable)
  ['{375F9D67-74A2-5F91-A11D-169093718D41}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothLEDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  IAsyncOperation_1__IBluetoothLEDevice = interface(IAsyncOperation_1__IBluetoothLEDevice_Base)
  ['{495928B4-715C-587B-9A94-65741C303185}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IBluetoothLEDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IBluetoothLEDevice; safecall;
    function GetResults: IBluetoothLEDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IBluetoothLEDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  // Used Types:  String
  // Used Types:  UInt64
  }
  // Windows.Devices.Bluetooth.IBluetoothLEDeviceStatics
  [WinRTClassNameAttribute(SBluetoothLEDevice)]
  IBluetoothLEDeviceStatics = interface(IInspectable)
  ['{C8CF1A19-F0B6-4BF0-8689-41303DE2D9F4}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothLEDevice; safecall;
    function FromBluetoothAddressAsync(bluetoothAddress: UInt64): IAsyncOperation_1__IBluetoothLEDevice; safecall;
    function GetDeviceSelector: HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Bluetooth.BluetoothConnectionStatus
  // Used Types:  UInt64
  // Used Types:  Windows.Devices.Bluetooth.BluetoothAddressType
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothLEAppearance
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.IBluetoothLEDevice>
  }
  // Windows.Devices.Bluetooth.IBluetoothLEDeviceStatics2
  [WinRTClassNameAttribute(SBluetoothLEDevice)]
  IBluetoothLEDeviceStatics2 = interface(IInspectable)
  ['{5F12C06B-3BAC-43E8-AD16-563271BD41C2}']
    function GetDeviceSelectorFromPairingState(pairingState: Boolean): HSTRING; safecall;
    function GetDeviceSelectorFromConnectionStatus(connectionStatus: BluetoothConnectionStatus): HSTRING; safecall;
    function GetDeviceSelectorFromDeviceName(deviceName: HSTRING): HSTRING; safecall;
    function GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64): HSTRING; overload; safecall;
    function GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64; bluetoothAddressType: BluetoothAddressType): HSTRING; overload; safecall;
    function GetDeviceSelectorFromAppearance(appearance: IBluetoothLEAppearance): HSTRING; safecall;
    function FromBluetoothAddressAsync(bluetoothAddress: UInt64; bluetoothAddressType: BluetoothAddressType): IAsyncOperation_1__IBluetoothLEDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothLEAppearance
  // Used Types:  Windows.Devices.Bluetooth.BluetoothAddressType
  }
  // Windows.Devices.Bluetooth.IBluetoothLEDevice2
  IBluetoothLEDevice2 = interface(IInspectable)
  ['{26F062B3-7AEE-4D31-BABA-B1B9775F5916}']
    function get_DeviceInformation: IDeviceInformation; safecall;
    function get_Appearance: IBluetoothLEAppearance; safecall;
    function get_BluetoothAddressType: BluetoothAddressType; safecall;
    property Appearance: IBluetoothLEAppearance read get_Appearance;
    property BluetoothAddressType: BluetoothAddressType read get_BluetoothAddressType;
    property DeviceInformation: IDeviceInformation read get_DeviceInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattDeviceServicesResult)]
  GenericAttributeProfile_IGattDeviceServicesResult = interface(IInspectable)
  ['{171DD3EE-016D-419D-838A-576CF475A3D8}']
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_ProtocolError: IReference_1__Byte; safecall;
    function get_Services: IVectorView_1__GenericAttributeProfile_IGattDeviceService; safecall;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
    property Services: IVectorView_1__GenericAttributeProfile_IGattDeviceService read get_Services;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult_Delegate_Base = interface(IUnknown)
  ['{74AB0892-A631-5D6C-B1B4-BD2E1A741A9B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult_Delegate_Base)
  ['{D4A70ECD-1A5F-5311-8CD2-C4DC31E70AC4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult_Base = interface(IInspectable)
  ['{E7C667F6-E874-500F-86FF-760CA6F07A58}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult_Base)
  ['{18B5C525-57AA-5353-9918-9C6DD430419B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult; safecall;
    function GetResults: GenericAttributeProfile_IGattDeviceServicesResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceServicesResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceAccessInformation
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.DeviceAccessStatus>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  // Used Types:  Windows.Devices.Bluetooth.BluetoothCacheMode
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.IBluetoothLEDevice3
  IBluetoothLEDevice3 = interface(IInspectable)
  ['{AEE9E493-44AC-40DC-AF33-B2C13C01CA46}']
    function get_DeviceAccessInformation: IDeviceAccessInformation; safecall;
    function RequestAccessAsync: IAsyncOperation_1__DeviceAccessStatus; safecall;
    function GetGattServicesAsync: IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    function GetGattServicesAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    function GetGattServicesForUuidAsync(serviceUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    function GetGattServicesForUuidAsync(serviceUuid: TGuid; cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    property DeviceAccessInformation: IDeviceAccessInformation read get_DeviceAccessInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDeviceId
  }
  // Windows.Devices.Bluetooth.IBluetoothLEDevice4
  IBluetoothLEDevice4 = interface(IInspectable)
  ['{2B605031-2248-4B2F-ACF0-7CEE36FC5870}']
    function get_BluetoothDeviceId: IBluetoothDeviceId; safecall;
    property BluetoothDeviceId: IBluetoothDeviceId read get_BluetoothDeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothClassOfDevice
  // Used Types:  UInt32
  // Used Types:  Windows.Devices.Bluetooth.BluetoothMajorClass
  // Used Types:  Windows.Devices.Bluetooth.BluetoothMinorClass
  // Used Types:  Windows.Devices.Bluetooth.BluetoothServiceCapabilities
  }
  // Windows.Devices.Bluetooth.IBluetoothClassOfDeviceStatics
  [WinRTClassNameAttribute(SBluetoothClassOfDevice)]
  IBluetoothClassOfDeviceStatics = interface(IInspectable)
  ['{E46135BD-0FA2-416C-91B4-C1E48CA061C1}']
    function FromRawValue(rawValue: Cardinal): IBluetoothClassOfDevice; safecall;
    function FromParts(majorClass: BluetoothMajorClass; minorClass: BluetoothMinorClass; serviceCapabilities: BluetoothServiceCapabilities): IBluetoothClassOfDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattProtocolErrorStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattProtocolError)]
  GenericAttributeProfile_IGattProtocolErrorStatics = interface(IInspectable)
  ['{CA46C5C5-0ECC-4809-BEA3-CF79BC991E37}']
    function get_InvalidHandle: Byte; safecall;
    function get_ReadNotPermitted: Byte; safecall;
    function get_WriteNotPermitted: Byte; safecall;
    function get_InvalidPdu: Byte; safecall;
    function get_InsufficientAuthentication: Byte; safecall;
    function get_RequestNotSupported: Byte; safecall;
    function get_InvalidOffset: Byte; safecall;
    function get_InsufficientAuthorization: Byte; safecall;
    function get_PrepareQueueFull: Byte; safecall;
    function get_AttributeNotFound: Byte; safecall;
    function get_AttributeNotLong: Byte; safecall;
    function get_InsufficientEncryptionKeySize: Byte; safecall;
    function get_InvalidAttributeValueLength: Byte; safecall;
    function get_UnlikelyError: Byte; safecall;
    function get_InsufficientEncryption: Byte; safecall;
    function get_UnsupportedGroupType: Byte; safecall;
    function get_InsufficientResources: Byte; safecall;
    property AttributeNotFound: Byte read get_AttributeNotFound;
    property AttributeNotLong: Byte read get_AttributeNotLong;
    property InsufficientAuthentication: Byte read get_InsufficientAuthentication;
    property InsufficientAuthorization: Byte read get_InsufficientAuthorization;
    property InsufficientEncryption: Byte read get_InsufficientEncryption;
    property InsufficientEncryptionKeySize: Byte read get_InsufficientEncryptionKeySize;
    property InsufficientResources: Byte read get_InsufficientResources;
    property InvalidAttributeValueLength: Byte read get_InvalidAttributeValueLength;
    property InvalidHandle: Byte read get_InvalidHandle;
    property InvalidOffset: Byte read get_InvalidOffset;
    property InvalidPdu: Byte read get_InvalidPdu;
    property PrepareQueueFull: Byte read get_PrepareQueueFull;
    property ReadNotPermitted: Byte read get_ReadNotPermitted;
    property RequestNotSupported: Byte read get_RequestNotSupported;
    property UnlikelyError: Byte read get_UnlikelyError;
    property UnsupportedGroupType: Byte read get_UnsupportedGroupType;
    property WriteNotPermitted: Byte read get_WriteNotPermitted;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession_Delegate_Base = interface(IUnknown)
  ['{CAE01A28-FD33-542E-A5AD-3D878F73DB90}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession_Delegate_Base)
  ['{2BC2FFC8-0F75-5832-BB4D-5F44EAD2BDFB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattSession; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  IAsyncOperation_1__GenericAttributeProfile_IGattSession_Base = interface(IInspectable)
  ['{6D40B467-46B9-516F-8208-DB23B786EA48}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  IAsyncOperation_1__GenericAttributeProfile_IGattSession = interface(IAsyncOperation_1__GenericAttributeProfile_IGattSession_Base)
  ['{BBE3F2A2-74CF-5C3D-AA71-03FD6C96934C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession; safecall;
    function GetResults: GenericAttributeProfile_IGattSession; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattSession read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession>
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDeviceId
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattSession)]
  GenericAttributeProfile_IGattSessionStatics = interface(IInspectable)
  ['{2E65B95C-539F-4DB7-82A8-73BDBBF73EBF}']
    function FromDeviceIdAsync(deviceId: IBluetoothDeviceId): IAsyncOperation_1__GenericAttributeProfile_IGattSession; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService_Delegate_Base = interface(IUnknown)
  ['{2DBCF64A-262B-5708-ADB1-C3B8750BD680}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService_Delegate_Base)
  ['{0B5712A5-4883-5B7C-AE40-D4AD0F0E8D95}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService_Base = interface(IInspectable)
  ['{E5E90272-408F-5055-9BD3-88408982D301}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService = interface(IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService_Base)
  ['{6816BA80-95DD-57CC-9053-513BA84FEC1D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService; safecall;
    function GetResults: GenericAttributeProfile_IGattDeviceService; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDeviceService read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServiceStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattDeviceService)]
  GenericAttributeProfile_IGattDeviceServiceStatics = interface(IInspectable)
  ['{196D0022-FAAD-45DC-AE5B-2AC3184E84DB}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService; safecall;
    function GetDeviceSelectorFromUuid(serviceUuid: TGuid): HSTRING; safecall;
    function GetDeviceSelectorFromShortId(serviceShortId: Word): HSTRING; safecall;
    function ConvertShortIdToUuid(shortId: Word): TGuid; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  // Used Types:  String
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDeviceId
  // Used Types:  Windows.Devices.Bluetooth.BluetoothCacheMode
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServiceStatics2
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattDeviceService)]
  GenericAttributeProfile_IGattDeviceServiceStatics2 = interface(IInspectable)
  ['{0604186E-24A6-4B0D-A2F2-30CC01545D25}']
    function FromIdAsync(deviceId: HSTRING; sharingMode: GenericAttributeProfile_GattSharingMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService; safecall;
    function GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId: IBluetoothDeviceId): HSTRING; overload; safecall;
    function GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId: IBluetoothDeviceId; cacheMode: BluetoothCacheMode): HSTRING; overload; safecall;
    function GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId: IBluetoothDeviceId; serviceUuid: TGuid): HSTRING; overload; safecall;
    function GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId: IBluetoothDeviceId; serviceUuid: TGuid; cacheMode: BluetoothCacheMode): HSTRING; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothLEDevice
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService2
  GenericAttributeProfile_IGattDeviceService2 = interface(IInspectable)
  ['{FC54520B-0B0D-4708-BAE0-9FFD9489BC59}']
    function get_Device: IBluetoothLEDevice; safecall;
    function get_ParentServices: IVectorView_1__GenericAttributeProfile_IGattDeviceService; safecall;
    function GetAllCharacteristics: IVectorView_1__GenericAttributeProfile_IGattCharacteristic; safecall;
    function GetAllIncludedServices: IVectorView_1__GenericAttributeProfile_IGattDeviceService; safecall;
    property Device: IBluetoothLEDevice read get_Device;
    property ParentServices: IVectorView_1__GenericAttributeProfile_IGattDeviceService read get_ParentServices;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus_Delegate_Base = interface(IUnknown)
  ['{548B3CD0-DCE8-5D3D-98AB-6948DD7F90B8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus_Base = interface(IInspectable)
  ['{983201AC-8777-53E8-86E0-63FA684BE1BD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus = interface(IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus; safecall;
    function GetResults: GenericAttributeProfile_GattOpenStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_GattOpenStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattCharacteristicsResult)]
  GenericAttributeProfile_IGattCharacteristicsResult = interface(IInspectable)
  ['{1194945C-B257-4F3E-9DB7-F68BC9A9AEF2}']
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_ProtocolError: IReference_1__Byte; safecall;
    function get_Characteristics: IVectorView_1__GenericAttributeProfile_IGattCharacteristic; safecall;
    property Characteristics: IVectorView_1__GenericAttributeProfile_IGattCharacteristic read get_Characteristics;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult_Delegate_Base = interface(IUnknown)
  ['{D6A15475-1E72-5C56-98E8-88F4BC3E0313}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult_Delegate_Base)
  ['{9AF86346-DD39-5C71-BABB-821FDEEADACB}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult_Base = interface(IInspectable)
  ['{0972194A-AC1C-5536-9886-27E58A18F273}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult_Base)
  ['{A0A67005-B18A-55FE-B065-355D80BB2302}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult; safecall;
    function GetResults: GenericAttributeProfile_IGattCharacteristicsResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattCharacteristicsResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceAccessInformation
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattSharingMode
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.DeviceAccessStatus>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattOpenStatus>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult>
  // Used Types:  Windows.Devices.Bluetooth.BluetoothCacheMode
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService3
  GenericAttributeProfile_IGattDeviceService3 = interface(IInspectable)
  ['{B293A950-0C53-437C-A9B3-5C3210C6E569}']
    function get_DeviceAccessInformation: IDeviceAccessInformation; safecall;
    function get_Session: GenericAttributeProfile_IGattSession; safecall;
    function get_SharingMode: GenericAttributeProfile_GattSharingMode; safecall;
    function RequestAccessAsync: IAsyncOperation_1__DeviceAccessStatus; safecall;
    function OpenAsync(sharingMode: GenericAttributeProfile_GattSharingMode): IAsyncOperation_1__GenericAttributeProfile_GattOpenStatus; safecall;
    function GetCharacteristicsAsync: IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult; overload; safecall;
    function GetCharacteristicsAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult; overload; safecall;
    function GetCharacteristicsForUuidAsync(characteristicUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult; overload; safecall;
    function GetCharacteristicsForUuidAsync(characteristicUuid: TGuid; cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattCharacteristicsResult; overload; safecall;
    function GetIncludedServicesAsync: IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    function GetIncludedServicesAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    function GetIncludedServicesForUuidAsync(serviceUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    function GetIncludedServicesForUuidAsync(serviceUuid: TGuid; cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceServicesResult; overload; safecall;
    property DeviceAccessInformation: IDeviceAccessInformation read get_DeviceAccessInformation;
    property Session: GenericAttributeProfile_IGattSession read get_Session;
    property SharingMode: GenericAttributeProfile_GattSharingMode read get_SharingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattCharacteristic)]
  GenericAttributeProfile_IGattCharacteristicStatics = interface(IInspectable)
  ['{59CB50C3-5934-4F68-A198-EB864FA44E6B}']
    function ConvertShortIdToUuid(shortId: Word): TGuid; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic2
  GenericAttributeProfile_IGattCharacteristic2 = interface(IInspectable)
  ['{AE1AB578-EC06-4764-B780-9835A1D35D6E}']
    function get_Service: GenericAttributeProfile_IGattDeviceService; safecall;
    function GetAllDescriptors: IVectorView_1__GenericAttributeProfile_IGattDescriptor; safecall;
    property Service: GenericAttributeProfile_IGattDeviceService read get_Service;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattDescriptorsResult)]
  GenericAttributeProfile_IGattDescriptorsResult = interface(IInspectable)
  ['{9BC091F3-95E7-4489-8D25-FF81955A57B9}']
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_ProtocolError: IReference_1__Byte; safecall;
    function get_Descriptors: IVectorView_1__GenericAttributeProfile_IGattDescriptor; safecall;
    property Descriptors: IVectorView_1__GenericAttributeProfile_IGattDescriptor read get_Descriptors;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult_Delegate_Base = interface(IUnknown)
  ['{DF09AE77-F606-53E4-8BA6-799F5992C85E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult_Delegate_Base)
  ['{22C61691-1635-5778-9503-584E99884004}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult_Base = interface(IInspectable)
  ['{CEAF40C7-BE37-52A5-9A1B-63398513E597}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult_Base)
  ['{147C8C9A-E511-5F88-8769-38C97A09EEAB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult; safecall;
    function GetResults: GenericAttributeProfile_IGattDescriptorsResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattDescriptorsResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattWriteResult)]
  GenericAttributeProfile_IGattWriteResult = interface(IInspectable)
  ['{4991DDB1-CB2B-44F7-99FC-D29A2871DC9B}']
    function get_Status: GenericAttributeProfile_GattCommunicationStatus; safecall;
    function get_ProtocolError: IReference_1__Byte; safecall;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
    property Status: GenericAttributeProfile_GattCommunicationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult_Delegate_Base = interface(IUnknown)
  ['{6FA8C9C3-FF7E-5FA1-A2F3-2714CF04B899}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult_Delegate_Base)
  ['{74613A28-9F73-55A2-85F6-D8DDCFB1E294}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult_Base = interface(IInspectable)
  ['{E83B4534-BD14-5A9B-A53B-17CC02A2A8A8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult_Base)
  ['{223EE764-4757-5086-B813-0CFDE50269E9}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult; safecall;
    function GetResults: GenericAttributeProfile_IGattWriteResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattWriteResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult>
  // Used Types:  Windows.Devices.Bluetooth.BluetoothCacheMode
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteOption
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattClientCharacteristicConfigurationDescriptorValue
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic3
  GenericAttributeProfile_IGattCharacteristic3 = interface(IInspectable)
  ['{3F3C663E-93D4-406B-B817-DB81F8ED53B3}']
    function GetDescriptorsAsync: IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult; overload; safecall;
    function GetDescriptorsAsync(cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult; overload; safecall;
    function GetDescriptorsForUuidAsync(descriptorUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult; overload; safecall;
    function GetDescriptorsForUuidAsync(descriptorUuid: TGuid; cacheMode: BluetoothCacheMode): IAsyncOperation_1__GenericAttributeProfile_IGattDescriptorsResult; overload; safecall;
    function WriteValueWithResultAsync(value: IBuffer): IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult; overload; safecall;
    function WriteValueWithResultAsync(value: IBuffer; writeOption: GenericAttributeProfile_GattWriteOption): IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult; overload; safecall;
    function WriteClientCharacteristicConfigurationDescriptorWithResultAsync(clientCharacteristicConfigurationDescriptorValue: GenericAttributeProfile_GattClientCharacteristicConfigurationDescriptorValue): IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattDescriptor)]
  GenericAttributeProfile_IGattDescriptorStatics = interface(IInspectable)
  ['{92055F2D-8084-4344-B4C2-284DE19A8506}']
    function ConvertShortIdToUuid(shortId: Word): TGuid; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor2
  GenericAttributeProfile_IGattDescriptor2 = interface(IInspectable)
  ['{8F563D39-D630-406C-BA11-10CDD16B0E5E}']
    function WriteValueWithResultAsync(value: IBuffer): IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatTypesStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattPresentationFormatTypes)]
  GenericAttributeProfile_IGattPresentationFormatTypesStatics = interface(IInspectable)
  ['{FAF1BA0A-30BA-409C-BEF7-CFFB6D03B8FB}']
    function get_Boolean: Byte; safecall;
    function get_Bit2: Byte; safecall;
    function get_Nibble: Byte; safecall;
    function get_UInt8: Byte; safecall;
    function get_UInt12: Byte; safecall;
    function get_UInt16: Byte; safecall;
    function get_UInt24: Byte; safecall;
    function get_UInt32: Byte; safecall;
    function get_UInt48: Byte; safecall;
    function get_UInt64: Byte; safecall;
    function get_UInt128: Byte; safecall;
    function get_SInt8: Byte; safecall;
    function get_SInt12: Byte; safecall;
    function get_SInt16: Byte; safecall;
    function get_SInt24: Byte; safecall;
    function get_SInt32: Byte; safecall;
    function get_SInt48: Byte; safecall;
    function get_SInt64: Byte; safecall;
    function get_SInt128: Byte; safecall;
    function get_Float32: Byte; safecall;
    function get_Float64: Byte; safecall;
    function get_SFloat: Byte; safecall;
    function get_Float: Byte; safecall;
    function get_DUInt16: Byte; safecall;
    function get_Utf8: Byte; safecall;
    function get_Utf16: Byte; safecall;
    function get_Struct: Byte; safecall;
    property Bit2: Byte read get_Bit2;
    property Boolean: Byte read get_Boolean;
    property DUInt16: Byte read get_DUInt16;
    property Float: Byte read get_Float;
    property Float32: Byte read get_Float32;
    property Float64: Byte read get_Float64;
    property Nibble: Byte read get_Nibble;
    property SFloat: Byte read get_SFloat;
    property SInt12: Byte read get_SInt12;
    property SInt128: Byte read get_SInt128;
    property SInt16: Byte read get_SInt16;
    property SInt24: Byte read get_SInt24;
    property SInt32: Byte read get_SInt32;
    property SInt48: Byte read get_SInt48;
    property SInt64: Byte read get_SInt64;
    property SInt8: Byte read get_SInt8;
    property Struct: Byte read get_Struct;
    property UInt12: Byte read get_UInt12;
    property UInt128: Byte read get_UInt128;
    property UInt16: Byte read get_UInt16;
    property UInt24: Byte read get_UInt24;
    property UInt32: Byte read get_UInt32;
    property UInt48: Byte read get_UInt48;
    property UInt64: Byte read get_UInt64;
    property UInt8: Byte read get_UInt8;
    property Utf16: Byte read get_Utf16;
    property Utf8: Byte read get_Utf8;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattPresentationFormat)]
  GenericAttributeProfile_IGattPresentationFormatStatics = interface(IInspectable)
  ['{196D0020-FAAD-45DC-AE5B-2AC3184E84DB}']
    function get_BluetoothSigAssignedNumbers: Byte; safecall;
    property BluetoothSigAssignedNumbers: Byte read get_BluetoothSigAssignedNumbers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
  // Used Types:  UInt8
  // Used Types:  Int32
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatStatics2
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattPresentationFormat)]
  GenericAttributeProfile_IGattPresentationFormatStatics2 = interface(IInspectable)
  ['{A9C21713-B82F-435E-B634-21FD85A43C07}']
    function FromParts(formatType: Byte; exponent: Integer; &unit: Word; namespaceId: Byte; description: Word): GenericAttributeProfile_IGattPresentationFormat; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceUuidsStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceUuids)]
  GenericAttributeProfile_IGattServiceUuidsStatics = interface(IInspectable)
  ['{6DC57058-9ABA-4417-B8F2-DCE016D34EE2}']
    function get_Battery: TGuid; safecall;
    function get_BloodPressure: TGuid; safecall;
    function get_CyclingSpeedAndCadence: TGuid; safecall;
    function get_GenericAccess: TGuid; safecall;
    function get_GenericAttribute: TGuid; safecall;
    function get_Glucose: TGuid; safecall;
    function get_HealthThermometer: TGuid; safecall;
    function get_HeartRate: TGuid; safecall;
    function get_RunningSpeedAndCadence: TGuid; safecall;
    property Battery: TGuid read get_Battery;
    property BloodPressure: TGuid read get_BloodPressure;
    property CyclingSpeedAndCadence: TGuid read get_CyclingSpeedAndCadence;
    property GenericAccess: TGuid read get_GenericAccess;
    property GenericAttribute: TGuid read get_GenericAttribute;
    property Glucose: TGuid read get_Glucose;
    property HealthThermometer: TGuid read get_HealthThermometer;
    property HeartRate: TGuid read get_HeartRate;
    property RunningSpeedAndCadence: TGuid read get_RunningSpeedAndCadence;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceUuidsStatics2
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceUuids)]
  GenericAttributeProfile_IGattServiceUuidsStatics2 = interface(IInspectable)
  ['{D2AE94F5-3D15-4F79-9C0C-EAAFA675155C}']
    function get_AlertNotification: TGuid; safecall;
    function get_CurrentTime: TGuid; safecall;
    function get_CyclingPower: TGuid; safecall;
    function get_DeviceInformation: TGuid; safecall;
    function get_HumanInterfaceDevice: TGuid; safecall;
    function get_ImmediateAlert: TGuid; safecall;
    function get_LinkLoss: TGuid; safecall;
    function get_LocationAndNavigation: TGuid; safecall;
    function get_NextDstChange: TGuid; safecall;
    function get_PhoneAlertStatus: TGuid; safecall;
    function get_ReferenceTimeUpdate: TGuid; safecall;
    function get_ScanParameters: TGuid; safecall;
    function get_TxPower: TGuid; safecall;
    property AlertNotification: TGuid read get_AlertNotification;
    property CurrentTime: TGuid read get_CurrentTime;
    property CyclingPower: TGuid read get_CyclingPower;
    property DeviceInformation: TGuid read get_DeviceInformation;
    property HumanInterfaceDevice: TGuid read get_HumanInterfaceDevice;
    property ImmediateAlert: TGuid read get_ImmediateAlert;
    property LinkLoss: TGuid read get_LinkLoss;
    property LocationAndNavigation: TGuid read get_LocationAndNavigation;
    property NextDstChange: TGuid read get_NextDstChange;
    property PhoneAlertStatus: TGuid read get_PhoneAlertStatus;
    property ReferenceTimeUpdate: TGuid read get_ReferenceTimeUpdate;
    property ScanParameters: TGuid read get_ScanParameters;
    property TxPower: TGuid read get_TxPower;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicUuidsStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattCharacteristicUuids)]
  GenericAttributeProfile_IGattCharacteristicUuidsStatics = interface(IInspectable)
  ['{58FA4586-B1DE-470C-B7DE-0D11FF44F4B7}']
    function get_BatteryLevel: TGuid; safecall;
    function get_BloodPressureFeature: TGuid; safecall;
    function get_BloodPressureMeasurement: TGuid; safecall;
    function get_BodySensorLocation: TGuid; safecall;
    function get_CscFeature: TGuid; safecall;
    function get_CscMeasurement: TGuid; safecall;
    function get_GlucoseFeature: TGuid; safecall;
    function get_GlucoseMeasurement: TGuid; safecall;
    function get_GlucoseMeasurementContext: TGuid; safecall;
    function get_HeartRateControlPoint: TGuid; safecall;
    function get_HeartRateMeasurement: TGuid; safecall;
    function get_IntermediateCuffPressure: TGuid; safecall;
    function get_IntermediateTemperature: TGuid; safecall;
    function get_MeasurementInterval: TGuid; safecall;
    function get_RecordAccessControlPoint: TGuid; safecall;
    function get_RscFeature: TGuid; safecall;
    function get_RscMeasurement: TGuid; safecall;
    function get_SCControlPoint: TGuid; safecall;
    function get_SensorLocation: TGuid; safecall;
    function get_TemperatureMeasurement: TGuid; safecall;
    function get_TemperatureType: TGuid; safecall;
    property BatteryLevel: TGuid read get_BatteryLevel;
    property BloodPressureFeature: TGuid read get_BloodPressureFeature;
    property BloodPressureMeasurement: TGuid read get_BloodPressureMeasurement;
    property BodySensorLocation: TGuid read get_BodySensorLocation;
    property CscFeature: TGuid read get_CscFeature;
    property CscMeasurement: TGuid read get_CscMeasurement;
    property GlucoseFeature: TGuid read get_GlucoseFeature;
    property GlucoseMeasurement: TGuid read get_GlucoseMeasurement;
    property GlucoseMeasurementContext: TGuid read get_GlucoseMeasurementContext;
    property HeartRateControlPoint: TGuid read get_HeartRateControlPoint;
    property HeartRateMeasurement: TGuid read get_HeartRateMeasurement;
    property IntermediateCuffPressure: TGuid read get_IntermediateCuffPressure;
    property IntermediateTemperature: TGuid read get_IntermediateTemperature;
    property MeasurementInterval: TGuid read get_MeasurementInterval;
    property RecordAccessControlPoint: TGuid read get_RecordAccessControlPoint;
    property RscFeature: TGuid read get_RscFeature;
    property RscMeasurement: TGuid read get_RscMeasurement;
    property SCControlPoint: TGuid read get_SCControlPoint;
    property SensorLocation: TGuid read get_SensorLocation;
    property TemperatureMeasurement: TGuid read get_TemperatureMeasurement;
    property TemperatureType: TGuid read get_TemperatureType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicUuidsStatics2
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattCharacteristicUuids)]
  GenericAttributeProfile_IGattCharacteristicUuidsStatics2 = interface(IInspectable)
  ['{1855B425-D46E-4A2C-9C3F-ED6DEA29E7BE}']
    function get_AlertCategoryId: TGuid; safecall;
    function get_AlertCategoryIdBitMask: TGuid; safecall;
    function get_AlertLevel: TGuid; safecall;
    function get_AlertNotificationControlPoint: TGuid; safecall;
    function get_AlertStatus: TGuid; safecall;
    function get_GapAppearance: TGuid; safecall;
    function get_BootKeyboardInputReport: TGuid; safecall;
    function get_BootKeyboardOutputReport: TGuid; safecall;
    function get_BootMouseInputReport: TGuid; safecall;
    function get_CurrentTime: TGuid; safecall;
    function get_CyclingPowerControlPoint: TGuid; safecall;
    function get_CyclingPowerFeature: TGuid; safecall;
    function get_CyclingPowerMeasurement: TGuid; safecall;
    function get_CyclingPowerVector: TGuid; safecall;
    function get_DateTime: TGuid; safecall;
    function get_DayDateTime: TGuid; safecall;
    function get_DayOfWeek: TGuid; safecall;
    function get_GapDeviceName: TGuid; safecall;
    function get_DstOffset: TGuid; safecall;
    function get_ExactTime256: TGuid; safecall;
    function get_FirmwareRevisionString: TGuid; safecall;
    function get_HardwareRevisionString: TGuid; safecall;
    function get_HidControlPoint: TGuid; safecall;
    function get_HidInformation: TGuid; safecall;
    function get_Ieee1107320601RegulatoryCertificationDataList: TGuid; safecall;
    function get_LnControlPoint: TGuid; safecall;
    function get_LnFeature: TGuid; safecall;
    function get_LocalTimeInformation: TGuid; safecall;
    function get_LocationAndSpeed: TGuid; safecall;
    function get_ManufacturerNameString: TGuid; safecall;
    function get_ModelNumberString: TGuid; safecall;
    function get_Navigation: TGuid; safecall;
    function get_NewAlert: TGuid; safecall;
    function get_GapPeripheralPreferredConnectionParameters: TGuid; safecall;
    function get_GapPeripheralPrivacyFlag: TGuid; safecall;
    function get_PnpId: TGuid; safecall;
    function get_PositionQuality: TGuid; safecall;
    function get_ProtocolMode: TGuid; safecall;
    function get_GapReconnectionAddress: TGuid; safecall;
    function get_ReferenceTimeInformation: TGuid; safecall;
    function get_Report: TGuid; safecall;
    function get_ReportMap: TGuid; safecall;
    function get_RingerControlPoint: TGuid; safecall;
    function get_RingerSetting: TGuid; safecall;
    function get_ScanIntervalWindow: TGuid; safecall;
    function get_ScanRefresh: TGuid; safecall;
    function get_SerialNumberString: TGuid; safecall;
    function get_GattServiceChanged: TGuid; safecall;
    function get_SoftwareRevisionString: TGuid; safecall;
    function get_SupportedNewAlertCategory: TGuid; safecall;
    function get_SupportUnreadAlertCategory: TGuid; safecall;
    function get_SystemId: TGuid; safecall;
    function get_TimeAccuracy: TGuid; safecall;
    function get_TimeSource: TGuid; safecall;
    function get_TimeUpdateControlPoint: TGuid; safecall;
    function get_TimeUpdateState: TGuid; safecall;
    function get_TimeWithDst: TGuid; safecall;
    function get_TimeZone: TGuid; safecall;
    function get_TxPowerLevel: TGuid; safecall;
    function get_UnreadAlertStatus: TGuid; safecall;
    property AlertCategoryId: TGuid read get_AlertCategoryId;
    property AlertCategoryIdBitMask: TGuid read get_AlertCategoryIdBitMask;
    property AlertLevel: TGuid read get_AlertLevel;
    property AlertNotificationControlPoint: TGuid read get_AlertNotificationControlPoint;
    property AlertStatus: TGuid read get_AlertStatus;
    property BootKeyboardInputReport: TGuid read get_BootKeyboardInputReport;
    property BootKeyboardOutputReport: TGuid read get_BootKeyboardOutputReport;
    property BootMouseInputReport: TGuid read get_BootMouseInputReport;
    property CurrentTime: TGuid read get_CurrentTime;
    property CyclingPowerControlPoint: TGuid read get_CyclingPowerControlPoint;
    property CyclingPowerFeature: TGuid read get_CyclingPowerFeature;
    property CyclingPowerMeasurement: TGuid read get_CyclingPowerMeasurement;
    property CyclingPowerVector: TGuid read get_CyclingPowerVector;
    property DateTime: TGuid read get_DateTime;
    property DayDateTime: TGuid read get_DayDateTime;
    property DayOfWeek: TGuid read get_DayOfWeek;
    property DstOffset: TGuid read get_DstOffset;
    property ExactTime256: TGuid read get_ExactTime256;
    property FirmwareRevisionString: TGuid read get_FirmwareRevisionString;
    property GapAppearance: TGuid read get_GapAppearance;
    property GapDeviceName: TGuid read get_GapDeviceName;
    property GapPeripheralPreferredConnectionParameters: TGuid read get_GapPeripheralPreferredConnectionParameters;
    property GapPeripheralPrivacyFlag: TGuid read get_GapPeripheralPrivacyFlag;
    property GapReconnectionAddress: TGuid read get_GapReconnectionAddress;
    property GattServiceChanged: TGuid read get_GattServiceChanged;
    property HardwareRevisionString: TGuid read get_HardwareRevisionString;
    property HidControlPoint: TGuid read get_HidControlPoint;
    property HidInformation: TGuid read get_HidInformation;
    property Ieee1107320601RegulatoryCertificationDataList: TGuid read get_Ieee1107320601RegulatoryCertificationDataList;
    property LnControlPoint: TGuid read get_LnControlPoint;
    property LnFeature: TGuid read get_LnFeature;
    property LocalTimeInformation: TGuid read get_LocalTimeInformation;
    property LocationAndSpeed: TGuid read get_LocationAndSpeed;
    property ManufacturerNameString: TGuid read get_ManufacturerNameString;
    property ModelNumberString: TGuid read get_ModelNumberString;
    property Navigation: TGuid read get_Navigation;
    property NewAlert: TGuid read get_NewAlert;
    property PnpId: TGuid read get_PnpId;
    property PositionQuality: TGuid read get_PositionQuality;
    property ProtocolMode: TGuid read get_ProtocolMode;
    property ReferenceTimeInformation: TGuid read get_ReferenceTimeInformation;
    property Report: TGuid read get_Report;
    property ReportMap: TGuid read get_ReportMap;
    property RingerControlPoint: TGuid read get_RingerControlPoint;
    property RingerSetting: TGuid read get_RingerSetting;
    property ScanIntervalWindow: TGuid read get_ScanIntervalWindow;
    property ScanRefresh: TGuid read get_ScanRefresh;
    property SerialNumberString: TGuid read get_SerialNumberString;
    property SoftwareRevisionString: TGuid read get_SoftwareRevisionString;
    property SupportUnreadAlertCategory: TGuid read get_SupportUnreadAlertCategory;
    property SupportedNewAlertCategory: TGuid read get_SupportedNewAlertCategory;
    property SystemId: TGuid read get_SystemId;
    property TimeAccuracy: TGuid read get_TimeAccuracy;
    property TimeSource: TGuid read get_TimeSource;
    property TimeUpdateControlPoint: TGuid read get_TimeUpdateControlPoint;
    property TimeUpdateState: TGuid read get_TimeUpdateState;
    property TimeWithDst: TGuid read get_TimeWithDst;
    property TimeZone: TGuid read get_TimeZone;
    property TxPowerLevel: TGuid read get_TxPowerLevel;
    property UnreadAlertStatus: TGuid read get_UnreadAlertStatus;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorUuidsStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattDescriptorUuids)]
  GenericAttributeProfile_IGattDescriptorUuidsStatics = interface(IInspectable)
  ['{A6F862CE-9CFC-42F1-9185-FF37B75181D3}']
    function get_CharacteristicAggregateFormat: TGuid; safecall;
    function get_CharacteristicExtendedProperties: TGuid; safecall;
    function get_CharacteristicPresentationFormat: TGuid; safecall;
    function get_CharacteristicUserDescription: TGuid; safecall;
    function get_ClientCharacteristicConfiguration: TGuid; safecall;
    function get_ServerCharacteristicConfiguration: TGuid; safecall;
    property CharacteristicAggregateFormat: TGuid read get_CharacteristicAggregateFormat;
    property CharacteristicExtendedProperties: TGuid read get_CharacteristicExtendedProperties;
    property CharacteristicPresentationFormat: TGuid read get_CharacteristicPresentationFormat;
    property CharacteristicUserDescription: TGuid read get_CharacteristicUserDescription;
    property ClientCharacteristicConfiguration: TGuid read get_ClientCharacteristicConfiguration;
    property ServerCharacteristicConfiguration: TGuid read get_ServerCharacteristicConfiguration;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.GattCommunicationStatus>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattReliableWriteTransaction)]
  GenericAttributeProfile_IGattReliableWriteTransaction = interface(IInspectable)
  ['{63A66F07-1AEA-4C4C-A50F-97BAE474B348}']
    procedure WriteValue(characteristic: GenericAttributeProfile_IGattCharacteristic; value: IBuffer); safecall;
    function CommitAsync: IAsyncOperation_1__GenericAttributeProfile_GattCommunicationStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction2
  GenericAttributeProfile_IGattReliableWriteTransaction2 = interface(IInspectable)
  ['{51113987-EF12-462F-9FB2-A1A43A679416}']
    function CommitWithResultAsync: IAsyncOperation_1__GenericAttributeProfile_IGattWriteResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult2
  GenericAttributeProfile_IGattReadResult2 = interface(IInspectable)
  ['{A10F50A0-FB43-48AF-BAAA-638A5C6329FE}']
    function get_ProtocolError: IReference_1__Byte; safecall;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult2
  GenericAttributeProfile_IGattReadClientCharacteristicConfigurationDescriptorResult2 = interface(IInspectable)
  ['{1BF1A59D-BA4D-4622-8651-F4EE150D0A5D}']
    function get_ProtocolError: IReference_1__Byte; safecall;
    property ProtocolError: IReference_1__Byte read get_ProtocolError;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.BluetoothError
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisementStatus
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceProviderAdvertisementStatusChangedEventArgs)]
  GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs = interface(IInspectable)
  ['{59A5AA65-FA21-4FFC-B155-04D928012686}']
    function get_Error: BluetoothError; safecall;
    function get_Status: GenericAttributeProfile_GattServiceProviderAdvertisementStatus; safecall;
    property Error: BluetoothError read get_Error;
    property Status: GenericAttributeProfile_GattServiceProviderAdvertisementStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{56CE41B0-2570-50D3-A1B1-7E4167E1FDE7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs>
  TypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs = interface(TypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs_Delegate_Base)
  ['{5B999BE9-F091-5E89-A8DF-6C933ED192C3}']
    procedure Invoke(sender: GenericAttributeProfile_IGattServiceProvider; args: GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisementStatus
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider,Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceProvider)]
  GenericAttributeProfile_IGattServiceProvider = interface(IInspectable)
  ['{7822B3CD-2889-4F86-A051-3F0AED1C2760}']
    function get_Service: GenericAttributeProfile_IGattLocalService; safecall;
    function get_AdvertisementStatus: GenericAttributeProfile_GattServiceProviderAdvertisementStatus; safecall;
    function add_AdvertisementStatusChanged(handler: TypedEventHandler_2__GenericAttributeProfile_IGattServiceProvider__GenericAttributeProfile_IGattServiceProviderAdvertisementStatusChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AdvertisementStatusChanged(token: EventRegistrationToken); safecall;
    procedure StartAdvertising; overload; safecall;
    procedure StartAdvertising(parameters: GenericAttributeProfile_IGattServiceProviderAdvertisingParameters); overload; safecall;
    procedure StopAdvertising; safecall;
    property AdvertisementStatus: GenericAttributeProfile_GattServiceProviderAdvertisementStatus read get_AdvertisementStatus;
    property Service: GenericAttributeProfile_IGattLocalService read get_Service;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.BluetoothError
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceProviderResult)]
  GenericAttributeProfile_IGattServiceProviderResult = interface(IInspectable)
  ['{764696D8-C53E-428C-8A48-67AFE02C3AE6}']
    function get_Error: BluetoothError; safecall;
    function get_ServiceProvider: GenericAttributeProfile_IGattServiceProvider; safecall;
    property Error: BluetoothError read get_Error;
    property ServiceProvider: GenericAttributeProfile_IGattServiceProvider read get_ServiceProvider;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult_Delegate_Base = interface(IUnknown)
  ['{F992789A-E981-597A-9197-1FBD986F74C7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult = interface(AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult_Delegate_Base)
  ['{79C97460-2066-5CD9-BB42-06F12872F1DA}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult_Base = interface(IInspectable)
  ['{21781028-F5A2-5D99-A5AB-BCE6554FBC02}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult = interface(IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult_Base)
  ['{AE2F2BDE-997D-526B-BFEE-D938B1E82A20}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult; safecall;
    function GetResults: GenericAttributeProfile_IGattServiceProviderResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__GenericAttributeProfile_IGattServiceProviderResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult>
  // Used Types:  Guid
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderStatics
  [WinRTClassNameAttribute(SGenericAttributeProfile_GattServiceProvider)]
  GenericAttributeProfile_IGattServiceProviderStatics = interface(IInspectable)
  ['{31794063-5256-4054-A4F4-7BBE7755A57E}']
    function CreateAsync(serviceUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  }
  // Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult2
  GenericAttributeProfile_IGattClientNotificationResult2 = interface(IInspectable)
  ['{8FAEC497-45E0-497E-9582-29A1FE281AD5}']
    function get_BytesSent: Word; safecall;
    property BytesSent: Word read get_BytesSent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  // Used Types:  Guid
  // Used Types:  UInt32
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceIdStatics
  [WinRTClassNameAttribute(SRfcomm_RfcommServiceId)]
  Rfcomm_IRfcommServiceIdStatics = interface(IInspectable)
  ['{2A179EBA-A975-46E3-B56B-08FFD783A5FE}']
    function FromUuid(uuid: TGuid): Rfcomm_IRfcommServiceId; safecall;
    function FromShortId(shortId: Cardinal): Rfcomm_IRfcommServiceId; safecall;
    function get_SerialPort: Rfcomm_IRfcommServiceId; safecall;
    function get_ObexObjectPush: Rfcomm_IRfcommServiceId; safecall;
    function get_ObexFileTransfer: Rfcomm_IRfcommServiceId; safecall;
    function get_PhoneBookAccessPce: Rfcomm_IRfcommServiceId; safecall;
    function get_PhoneBookAccessPse: Rfcomm_IRfcommServiceId; safecall;
    function get_GenericFileTransfer: Rfcomm_IRfcommServiceId; safecall;
    property GenericFileTransfer: Rfcomm_IRfcommServiceId read get_GenericFileTransfer;
    property ObexFileTransfer: Rfcomm_IRfcommServiceId read get_ObexFileTransfer;
    property ObexObjectPush: Rfcomm_IRfcommServiceId read get_ObexObjectPush;
    property PhoneBookAccessPce: Rfcomm_IRfcommServiceId read get_PhoneBookAccessPce;
    property PhoneBookAccessPse: Rfcomm_IRfcommServiceId read get_PhoneBookAccessPse;
    property SerialPort: Rfcomm_IRfcommServiceId read get_SerialPort;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService_Delegate_Base = interface(IUnknown)
  ['{5C772518-442F-58ED-80CB-538D34B88295}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService = interface(AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService_Delegate_Base)
  ['{B50BCE04-E854-5D91-AB6E-BB395E2FB295}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Rfcomm_IRfcommDeviceService; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IAsyncOperation_1__Rfcomm_IRfcommDeviceService_Base = interface(IInspectable)
  ['{0DF56BD7-C8F6-5C32-9644-AA0BCF28D78C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  IAsyncOperation_1__Rfcomm_IRfcommDeviceService = interface(IAsyncOperation_1__Rfcomm_IRfcommDeviceService_Base)
  ['{298F527C-1155-5B54-AEEC-EE74805C54CC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService; safecall;
    function GetResults: Rfcomm_IRfcommDeviceService; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommDeviceService read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService>
  // Used Types:  String
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServiceStatics
  [WinRTClassNameAttribute(SRfcomm_RfcommDeviceService)]
  Rfcomm_IRfcommDeviceServiceStatics = interface(IInspectable)
  ['{A4A149EF-626D-41AC-B253-87AC5C27E28A}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Rfcomm_IRfcommDeviceService; safecall;
    function GetDeviceSelector(serviceId: Rfcomm_IRfcommServiceId): HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDevice
  // Used Types:  Windows.Devices.Bluetooth.BluetoothCacheMode
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServiceStatics2
  [WinRTClassNameAttribute(SRfcomm_RfcommDeviceService)]
  Rfcomm_IRfcommDeviceServiceStatics2 = interface(IInspectable)
  ['{AA8CB1C9-E78D-4BE4-8076-0A3D87A0A05F}']
    function GetDeviceSelectorForBluetoothDevice(bluetoothDevice: IBluetoothDevice): HSTRING; overload; safecall;
    function GetDeviceSelectorForBluetoothDevice(bluetoothDevice: IBluetoothDevice; cacheMode: BluetoothCacheMode): HSTRING; overload; safecall;
    function GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice: IBluetoothDevice; serviceId: Rfcomm_IRfcommServiceId): HSTRING; overload; safecall;
    function GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice: IBluetoothDevice; serviceId: Rfcomm_IRfcommServiceId; cacheMode: BluetoothCacheMode): HSTRING; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.IBluetoothDevice
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService2
  Rfcomm_IRfcommDeviceService2 = interface(IInspectable)
  ['{536CED14-EBCD-49FE-BF9F-40EFC689B20D}']
    function get_Device: IBluetoothDevice; safecall;
    property Device: IBluetoothDevice read get_Device;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceAccessInformation
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Enumeration.DeviceAccessStatus>
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService3
  Rfcomm_IRfcommDeviceService3 = interface(IInspectable)
  ['{1C22ACE6-DD44-4D23-866D-8F3486EE6490}']
    function get_DeviceAccessInformation: IDeviceAccessInformation; safecall;
    function RequestAccessAsync: IAsyncOperation_1__DeviceAccessStatus; safecall;
    property DeviceAccessInformation: IDeviceAccessInformation read get_DeviceAccessInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  // Used Types:  Windows.Foundation.Collections.IMap`2<UInt32,Windows.Storage.Streams.IBuffer>
  // Used Types:  Windows.Networking.Sockets.IStreamSocketListener
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider
  [WinRTClassNameAttribute(SRfcomm_RfcommServiceProvider)]
  Rfcomm_IRfcommServiceProvider = interface(IInspectable)
  ['{EADBFDC4-B1F6-44FF-9F7C-E7A82AB86821}']
    function get_ServiceId: Rfcomm_IRfcommServiceId; safecall;
    function get_SdpRawAttributes: IMap_2__Cardinal__IBuffer; safecall;
    procedure StartAdvertising(listener: IStreamSocketListener); safecall;
    procedure StopAdvertising; safecall;
    property SdpRawAttributes: IMap_2__Cardinal__IBuffer read get_SdpRawAttributes;
    property ServiceId: Rfcomm_IRfcommServiceId read get_ServiceId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider_Delegate_Base = interface(IUnknown)
  ['{446A7F50-8F2E-51F0-AEBB-1BC3D192905F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider = interface(AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider_Delegate_Base)
  ['{45D3CA57-9754-58BF-BC45-851E07061D01}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Rfcomm_IRfcommServiceProvider; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  IAsyncOperation_1__Rfcomm_IRfcommServiceProvider_Base = interface(IInspectable)
  ['{FED44828-E232-554D-85D1-2F04D1322E69}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  IAsyncOperation_1__Rfcomm_IRfcommServiceProvider = interface(IAsyncOperation_1__Rfcomm_IRfcommServiceProvider_Base)
  ['{049FA020-5F01-5D52-B724-C34021660BEB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider; safecall;
    function GetResults: Rfcomm_IRfcommServiceProvider; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Rfcomm_IRfcommServiceProvider read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider>
  // Used Types:  Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProviderStatics
  [WinRTClassNameAttribute(SRfcomm_RfcommServiceProvider)]
  Rfcomm_IRfcommServiceProviderStatics = interface(IInspectable)
  ['{98888303-69CA-413A-84F7-4344C7292997}']
    function CreateAsync(serviceId: Rfcomm_IRfcommServiceId): IAsyncOperation_1__Rfcomm_IRfcommServiceProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.Sockets.IStreamSocketListener
  // Used Types:  Boolean
  }
  // Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider2
  Rfcomm_IRfcommServiceProvider2 = interface(IInspectable)
  ['{736BDFC6-3C81-4D1E-BAF2-DDBB81284512}']
    procedure StartAdvertising(listener: IStreamSocketListener; radioDiscoverable: Boolean); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs_Base = interface(IInspectable)
  ['{CD20A796-AA22-521D-8E0F-FC6D4A18E287}']
  end;
  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs = interface(IIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs_Base)
  ['{1F78B4F6-1F43-56FE-8C72-A88E7FC9E698}']
    function get_Current: GenericAttributeProfile_IGattValueChangedEventArgs; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGenericAttributeProfile_IGattValueChangedEventArgs): Cardinal; safecall;
    property Current: GenericAttributeProfile_IGattValueChangedEventArgs read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IIterable_1__GenericAttributeProfile_IGattValueChangedEventArgs_Base = interface(IInspectable)
  ['{526A63DF-8827-51B9-9E2C-9D65021A79D7}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IIterable_1__GenericAttributeProfile_IGattValueChangedEventArgs = interface(IIterable_1__GenericAttributeProfile_IGattValueChangedEventArgs_Base)
  ['{F3AA4B9A-AE8F-5F6E-86D8-5EA8205A9CA9}']
    function First: IIterator_1__GenericAttributeProfile_IGattValueChangedEventArgs; safecall;
  end;

  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs>
  IVectorView_1__GenericAttributeProfile_IGattValueChangedEventArgs = interface(IInspectable)
  ['{F48A117C-6B10-5DB1-BF27-B71F13555BD7}']
    function GetAt(index: Cardinal): GenericAttributeProfile_IGattValueChangedEventArgs; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: GenericAttributeProfile_IGattValueChangedEventArgs; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGenericAttributeProfile_IGattValueChangedEventArgs): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService
  }
  // Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection
  [WinRTClassNameAttribute(SBackground_GattServiceProviderConnection)]
  Background_IGattServiceProviderConnection = interface(IInspectable)
  ['{7FA1B9B9-2F13-40B5-9582-8EB78E98EF13}']
    function get_TriggerId: HSTRING; safecall;
    function get_Service: GenericAttributeProfile_IGattLocalService; safecall;
    procedure Start; safecall;
    property Service: GenericAttributeProfile_IGattLocalService read get_Service;
    property TriggerId: HSTRING read get_TriggerId;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = interface(IInspectable)
  ['{35B7A492-E305-565E-AA7E-609DAF95C18B}']
    function get_Key: HSTRING; safecall;
    function get_Value: Background_IGattServiceProviderConnection; safecall;
    property Key: HSTRING read get_Key;
    property Value: Background_IGattServiceProviderConnection read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  IIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection_Base = interface(IInspectable)
  ['{6FAF610E-CF1E-50E4-B1CC-F322FCF25036}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  IIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = interface(IIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection_Base)
  ['{D1C80CDA-FD2C-5472-8193-A2175008710F}']
    function get_Current: IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  IIterable_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection_Base = interface(IInspectable)
  ['{EB2CECFB-DD6C-5329-8E17-7FB80A84191F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>>
  IIterable_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection = interface(IIterable_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection_Base)
  ['{B9063D6F-AD59-51C2-B942-3DD377140EA6}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__Background_IGattServiceProviderConnection; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  IMapView_2__HSTRING__Background_IGattServiceProviderConnection_Base = interface(IInspectable)
  ['{94ECCB06-19AD-5E4F-953E-12C4AEC054E9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  IMapView_2__HSTRING__Background_IGattServiceProviderConnection = interface(IMapView_2__HSTRING__Background_IGattServiceProviderConnection_Base)
  ['{DF9595A0-54C3-5843-BDA7-443CC85A6938}']
    function Lookup(key: HSTRING): Background_IGattServiceProviderConnection; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__Background_IGattServiceProviderConnection; out second: IMapView_2__HSTRING__Background_IGattServiceProviderConnection); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection>
  }
  // Windows.Devices.Bluetooth.Background.IGattServiceProviderConnectionStatics
  [WinRTClassNameAttribute(SBackground_GattServiceProviderConnection)]
  Background_IGattServiceProviderConnectionStatics = interface(IInspectable)
  ['{3D509F4B-0B0E-4466-B8CD-6EBDDA1FA17D}']
    function get_AllServices: IMapView_2__HSTRING__Background_IGattServiceProviderConnection; safecall;
    property AllServices: IMapView_2__HSTRING__Background_IGattServiceProviderConnection read get_AllServices;
  end;


  // Emit Forwarded classes
  // Windows.Devices.Bluetooth.BluetoothAdapter
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothAdapter
  // Statics: "Windows.Devices.Bluetooth.IBluetoothAdapterStatics"
  TBluetoothAdapter = class(TWinRTGenericImportS<IBluetoothAdapterStatics>)
  public
    // -> IBluetoothAdapterStatics
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothAdapter; static; inline;
    class function GetDefaultAsync: IAsyncOperation_1__IBluetoothAdapter; static; inline;
  end;

  // Windows.Devices.Bluetooth.BluetoothDeviceId
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothDeviceId
  // Statics: "Windows.Devices.Bluetooth.IBluetoothDeviceIdStatics"
  TBluetoothDeviceId = class(TWinRTGenericImportS<IBluetoothDeviceIdStatics>)
  public
    // -> IBluetoothDeviceIdStatics
    class function FromId(deviceId: HSTRING): IBluetoothDeviceId; static; inline;
  end;

  // Windows.Devices.Bluetooth.BluetoothUuidHelper
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.IBluetoothUuidHelperStatics"
  TBluetoothUuidHelper = class(TWinRTGenericImportS<IBluetoothUuidHelperStatics>)
  public
    // -> IBluetoothUuidHelperStatics
    class function FromShortId(shortId: Cardinal): TGuid; static; inline;
    class function TryGetShortId(uuid: TGuid): IReference_1__Cardinal; static; inline;
  end;

  // Windows.Devices.Bluetooth.BluetoothDevice
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothDevice
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Devices.Bluetooth.IBluetoothDevice2
  // Implements: Windows.Devices.Bluetooth.IBluetoothDevice3
  // Implements: Windows.Devices.Bluetooth.IBluetoothDevice4
  // Statics: "Windows.Devices.Bluetooth.IBluetoothDeviceStatics"
  // Statics: "Windows.Devices.Bluetooth.IBluetoothDeviceStatics2"
  TBluetoothDevice = class(TWinRTGenericImportS2<IBluetoothDeviceStatics, IBluetoothDeviceStatics2>)
  public
    // -> IBluetoothDeviceStatics
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothDevice; static; inline;
    class function FromHostNameAsync(hostName: IHostName): IAsyncOperation_1__IBluetoothDevice; static; inline;
    class function FromBluetoothAddressAsync(address: UInt64): IAsyncOperation_1__IBluetoothDevice; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;

    // -> IBluetoothDeviceStatics2
    class function GetDeviceSelectorFromPairingState(pairingState: Boolean): HSTRING; static; inline;
    class function GetDeviceSelectorFromConnectionStatus(connectionStatus: BluetoothConnectionStatus): HSTRING; static; inline;
    class function GetDeviceSelectorFromDeviceName(deviceName: HSTRING): HSTRING; static; inline;
    class function GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64): HSTRING; static; inline;
    class function GetDeviceSelectorFromClassOfDevice(classOfDevice: IBluetoothClassOfDevice): HSTRING; static; inline;
  end;

  // Windows.Devices.Bluetooth.BluetoothClassOfDevice
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothClassOfDevice
  // Statics: "Windows.Devices.Bluetooth.IBluetoothClassOfDeviceStatics"
  TBluetoothClassOfDevice = class(TWinRTGenericImportS<IBluetoothClassOfDeviceStatics>)
  public
    // -> IBluetoothClassOfDeviceStatics
    class function FromRawValue(rawValue: Cardinal): IBluetoothClassOfDevice; static; inline;
    class function FromParts(majorClass: BluetoothMajorClass; minorClass: BluetoothMinorClass; serviceCapabilities: BluetoothServiceCapabilities): IBluetoothClassOfDevice; static; inline;
  end;

  // Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService2
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceService3
  // Statics: "Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServiceStatics2"
  // Statics: "Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServiceStatics"
  TRfcomm_RfcommDeviceService = class(TWinRTGenericImportS2<Rfcomm_IRfcommDeviceServiceStatics, Rfcomm_IRfcommDeviceServiceStatics2>)
  public
    // -> Rfcomm_IRfcommDeviceServiceStatics2
    class function GetDeviceSelectorForBluetoothDevice(bluetoothDevice: IBluetoothDevice): HSTRING; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDevice(bluetoothDevice: IBluetoothDevice; cacheMode: BluetoothCacheMode): HSTRING; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice: IBluetoothDevice; serviceId: Rfcomm_IRfcommServiceId): HSTRING; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice: IBluetoothDevice; serviceId: Rfcomm_IRfcommServiceId; cacheMode: BluetoothCacheMode): HSTRING; overload; static; inline;

    // -> Rfcomm_IRfcommDeviceServiceStatics
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Rfcomm_IRfcommDeviceService; static; inline;
    class function GetDeviceSelector(serviceId: Rfcomm_IRfcommServiceId): HSTRING; static; inline;
  end;

  // Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceServicesResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommDeviceServicesResult

  // Windows.Devices.Bluetooth.Rfcomm.RfcommServiceId
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceId
  // Statics: "Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceIdStatics"
  TRfcomm_RfcommServiceId = class(TWinRTGenericImportS<Rfcomm_IRfcommServiceIdStatics>)
  public
    // -> Rfcomm_IRfcommServiceIdStatics
    class function FromUuid(uuid: TGuid): Rfcomm_IRfcommServiceId; static; inline;
    class function FromShortId(shortId: Cardinal): Rfcomm_IRfcommServiceId; static; inline;
    class function get_SerialPort: Rfcomm_IRfcommServiceId; static; inline;
    class function get_ObexObjectPush: Rfcomm_IRfcommServiceId; static; inline;
    class function get_ObexFileTransfer: Rfcomm_IRfcommServiceId; static; inline;
    class function get_PhoneBookAccessPce: Rfcomm_IRfcommServiceId; static; inline;
    class function get_PhoneBookAccessPse: Rfcomm_IRfcommServiceId; static; inline;
    class function get_GenericFileTransfer: Rfcomm_IRfcommServiceId; static; inline;
    class property GenericFileTransfer: Rfcomm_IRfcommServiceId read get_GenericFileTransfer;
    class property ObexFileTransfer: Rfcomm_IRfcommServiceId read get_ObexFileTransfer;
    class property ObexObjectPush: Rfcomm_IRfcommServiceId read get_ObexObjectPush;
    class property PhoneBookAccessPce: Rfcomm_IRfcommServiceId read get_PhoneBookAccessPce;
    class property PhoneBookAccessPse: Rfcomm_IRfcommServiceId read get_PhoneBookAccessPse;
    class property SerialPort: Rfcomm_IRfcommServiceId read get_SerialPort;
  end;

  // Windows.Devices.Bluetooth.BluetoothLEAppearanceCategories
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.IBluetoothLEAppearanceCategoriesStatics"
  TBluetoothLEAppearanceCategories = class(TWinRTGenericImportS<IBluetoothLEAppearanceCategoriesStatics>)
  public
    // -> IBluetoothLEAppearanceCategoriesStatics
    class function get_Uncategorized: Word; static; inline;
    class function get_Phone: Word; static; inline;
    class function get_Computer: Word; static; inline;
    class function get_Watch: Word; static; inline;
    class function get_Clock: Word; static; inline;
    class function get_Display: Word; static; inline;
    class function get_RemoteControl: Word; static; inline;
    class function get_EyeGlasses: Word; static; inline;
    class function get_Tag: Word; static; inline;
    class function get_Keyring: Word; static; inline;
    class function get_MediaPlayer: Word; static; inline;
    class function get_BarcodeScanner: Word; static; inline;
    class function get_Thermometer: Word; static; inline;
    class function get_HeartRate: Word; static; inline;
    class function get_BloodPressure: Word; static; inline;
    class function get_HumanInterfaceDevice: Word; static; inline;
    class function get_GlucoseMeter: Word; static; inline;
    class function get_RunningWalking: Word; static; inline;
    class function get_Cycling: Word; static; inline;
    class function get_PulseOximeter: Word; static; inline;
    class function get_WeightScale: Word; static; inline;
    class function get_OutdoorSportActivity: Word; static; inline;
    class property BarcodeScanner: Word read get_BarcodeScanner;
    class property BloodPressure: Word read get_BloodPressure;
    class property Clock: Word read get_Clock;
    class property Computer: Word read get_Computer;
    class property Cycling: Word read get_Cycling;
    class property Display: Word read get_Display;
    class property EyeGlasses: Word read get_EyeGlasses;
    class property GlucoseMeter: Word read get_GlucoseMeter;
    class property HeartRate: Word read get_HeartRate;
    class property HumanInterfaceDevice: Word read get_HumanInterfaceDevice;
    class property Keyring: Word read get_Keyring;
    class property MediaPlayer: Word read get_MediaPlayer;
    class property OutdoorSportActivity: Word read get_OutdoorSportActivity;
    class property Phone: Word read get_Phone;
    class property PulseOximeter: Word read get_PulseOximeter;
    class property RemoteControl: Word read get_RemoteControl;
    class property RunningWalking: Word read get_RunningWalking;
    class property Tag: Word read get_Tag;
    class property Thermometer: Word read get_Thermometer;
    class property Uncategorized: Word read get_Uncategorized;
    class property Watch: Word read get_Watch;
    class property WeightScale: Word read get_WeightScale;
  end;

  // Windows.Devices.Bluetooth.BluetoothLEAppearanceSubcategories
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.IBluetoothLEAppearanceSubcategoriesStatics"
  TBluetoothLEAppearanceSubcategories = class(TWinRTGenericImportS<IBluetoothLEAppearanceSubcategoriesStatics>)
  public
    // -> IBluetoothLEAppearanceSubcategoriesStatics
    class function get_Generic: Word; static; inline;
    class function get_SportsWatch: Word; static; inline;
    class function get_ThermometerEar: Word; static; inline;
    class function get_HeartRateBelt: Word; static; inline;
    class function get_BloodPressureArm: Word; static; inline;
    class function get_BloodPressureWrist: Word; static; inline;
    class function get_Keyboard: Word; static; inline;
    class function get_Mouse: Word; static; inline;
    class function get_Joystick: Word; static; inline;
    class function get_Gamepad: Word; static; inline;
    class function get_DigitizerTablet: Word; static; inline;
    class function get_CardReader: Word; static; inline;
    class function get_DigitalPen: Word; static; inline;
    class function get_BarcodeScanner: Word; static; inline;
    class function get_RunningWalkingInShoe: Word; static; inline;
    class function get_RunningWalkingOnShoe: Word; static; inline;
    class function get_RunningWalkingOnHip: Word; static; inline;
    class function get_CyclingComputer: Word; static; inline;
    class function get_CyclingSpeedSensor: Word; static; inline;
    class function get_CyclingCadenceSensor: Word; static; inline;
    class function get_CyclingPowerSensor: Word; static; inline;
    class function get_CyclingSpeedCadenceSensor: Word; static; inline;
    class function get_OximeterFingertip: Word; static; inline;
    class function get_OximeterWristWorn: Word; static; inline;
    class function get_LocationDisplay: Word; static; inline;
    class function get_LocationNavigationDisplay: Word; static; inline;
    class function get_LocationPod: Word; static; inline;
    class function get_LocationNavigationPod: Word; static; inline;
    class property BarcodeScanner: Word read get_BarcodeScanner;
    class property BloodPressureArm: Word read get_BloodPressureArm;
    class property BloodPressureWrist: Word read get_BloodPressureWrist;
    class property CardReader: Word read get_CardReader;
    class property CyclingCadenceSensor: Word read get_CyclingCadenceSensor;
    class property CyclingComputer: Word read get_CyclingComputer;
    class property CyclingPowerSensor: Word read get_CyclingPowerSensor;
    class property CyclingSpeedCadenceSensor: Word read get_CyclingSpeedCadenceSensor;
    class property CyclingSpeedSensor: Word read get_CyclingSpeedSensor;
    class property DigitalPen: Word read get_DigitalPen;
    class property DigitizerTablet: Word read get_DigitizerTablet;
    class property Gamepad: Word read get_Gamepad;
    class property Generic: Word read get_Generic;
    class property HeartRateBelt: Word read get_HeartRateBelt;
    class property Joystick: Word read get_Joystick;
    class property Keyboard: Word read get_Keyboard;
    class property LocationDisplay: Word read get_LocationDisplay;
    class property LocationNavigationDisplay: Word read get_LocationNavigationDisplay;
    class property LocationNavigationPod: Word read get_LocationNavigationPod;
    class property LocationPod: Word read get_LocationPod;
    class property Mouse: Word read get_Mouse;
    class property OximeterFingertip: Word read get_OximeterFingertip;
    class property OximeterWristWorn: Word read get_OximeterWristWorn;
    class property RunningWalkingInShoe: Word read get_RunningWalkingInShoe;
    class property RunningWalkingOnHip: Word read get_RunningWalkingOnHip;
    class property RunningWalkingOnShoe: Word read get_RunningWalkingOnShoe;
    class property SportsWatch: Word read get_SportsWatch;
    class property ThermometerEar: Word read get_ThermometerEar;
  end;

  // Windows.Devices.Bluetooth.BluetoothLEAppearance
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothLEAppearance
  // Statics: "Windows.Devices.Bluetooth.IBluetoothLEAppearanceStatics"
  TBluetoothLEAppearance = class(TWinRTGenericImportS<IBluetoothLEAppearanceStatics>)
  public
    // -> IBluetoothLEAppearanceStatics
    class function FromRawValue(rawValue: Word): IBluetoothLEAppearance; static; inline;
    class function FromParts(appearanceCategory: Word; appearanceSubCategory: Word): IBluetoothLEAppearance; static; inline;
  end;

  // Windows.Devices.Bluetooth.BluetoothLEDevice
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothLEDevice
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Devices.Bluetooth.IBluetoothLEDevice2
  // Implements: Windows.Devices.Bluetooth.IBluetoothLEDevice3
  // Implements: Windows.Devices.Bluetooth.IBluetoothLEDevice4
  // Statics: "Windows.Devices.Bluetooth.IBluetoothLEDeviceStatics2"
  // Statics: "Windows.Devices.Bluetooth.IBluetoothLEDeviceStatics"
  TBluetoothLEDevice = class(TWinRTGenericImportS2<IBluetoothLEDeviceStatics, IBluetoothLEDeviceStatics2>)
  public
    // -> IBluetoothLEDeviceStatics2
    class function GetDeviceSelectorFromPairingState(pairingState: Boolean): HSTRING; static; inline;
    class function GetDeviceSelectorFromConnectionStatus(connectionStatus: BluetoothConnectionStatus): HSTRING; static; inline;
    class function GetDeviceSelectorFromDeviceName(deviceName: HSTRING): HSTRING; static; inline;
    class function GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64): HSTRING; overload; static; inline;
    class function GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64; bluetoothAddressType: BluetoothAddressType): HSTRING; overload; static; inline;
    class function GetDeviceSelectorFromAppearance(appearance: IBluetoothLEAppearance): HSTRING; static; inline;
    class function FromBluetoothAddressAsync(bluetoothAddress: UInt64; bluetoothAddressType: BluetoothAddressType): IAsyncOperation_1__IBluetoothLEDevice; overload; static; inline;

    // -> IBluetoothLEDeviceStatics
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothLEDevice; static; inline;
    class function FromBluetoothAddressAsync(bluetoothAddress: UInt64): IAsyncOperation_1__IBluetoothLEDevice; overload; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService2
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceService3
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServiceStatics2"
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServiceStatics"
  TGenericAttributeProfile_GattDeviceService = class(TWinRTGenericImportS2<GenericAttributeProfile_IGattDeviceServiceStatics, GenericAttributeProfile_IGattDeviceServiceStatics2>)
  public
    // -> GenericAttributeProfile_IGattDeviceServiceStatics2
    class function FromIdAsync(deviceId: HSTRING; sharingMode: GenericAttributeProfile_GattSharingMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId: IBluetoothDeviceId): HSTRING; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId: IBluetoothDeviceId; cacheMode: BluetoothCacheMode): HSTRING; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId: IBluetoothDeviceId; serviceUuid: TGuid): HSTRING; overload; static; inline;
    class function GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId: IBluetoothDeviceId; serviceUuid: TGuid; cacheMode: BluetoothCacheMode): HSTRING; overload; static; inline;

    // -> GenericAttributeProfile_IGattDeviceServiceStatics
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService; overload; static; inline;
    class function GetDeviceSelectorFromUuid(serviceUuid: TGuid): HSTRING; static; inline;
    class function GetDeviceSelectorFromShortId(serviceShortId: Word): HSTRING; static; inline;
    class function ConvertShortIdToUuid(shortId: Word): TGuid; static; inline;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceServicesResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDeviceServicesResult

  // Windows.Devices.Bluetooth.BluetoothSignalStrengthFilter
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.IBluetoothSignalStrengthFilter
  // Instantiable: "IBluetoothSignalStrengthFilter"
  TBluetoothSignalStrengthFilter = class(TWinRTGenericImportI<IBluetoothSignalStrengthFilter>) end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattProtocolError
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattProtocolErrorStatics"
  TGenericAttributeProfile_GattProtocolError = class(TWinRTGenericImportS<GenericAttributeProfile_IGattProtocolErrorStatics>)
  public
    // -> GenericAttributeProfile_IGattProtocolErrorStatics
    class function get_InvalidHandle: Byte; static; inline;
    class function get_ReadNotPermitted: Byte; static; inline;
    class function get_WriteNotPermitted: Byte; static; inline;
    class function get_InvalidPdu: Byte; static; inline;
    class function get_InsufficientAuthentication: Byte; static; inline;
    class function get_RequestNotSupported: Byte; static; inline;
    class function get_InvalidOffset: Byte; static; inline;
    class function get_InsufficientAuthorization: Byte; static; inline;
    class function get_PrepareQueueFull: Byte; static; inline;
    class function get_AttributeNotFound: Byte; static; inline;
    class function get_AttributeNotLong: Byte; static; inline;
    class function get_InsufficientEncryptionKeySize: Byte; static; inline;
    class function get_InvalidAttributeValueLength: Byte; static; inline;
    class function get_UnlikelyError: Byte; static; inline;
    class function get_InsufficientEncryption: Byte; static; inline;
    class function get_UnsupportedGroupType: Byte; static; inline;
    class function get_InsufficientResources: Byte; static; inline;
    class property AttributeNotFound: Byte read get_AttributeNotFound;
    class property AttributeNotLong: Byte read get_AttributeNotLong;
    class property InsufficientAuthentication: Byte read get_InsufficientAuthentication;
    class property InsufficientAuthorization: Byte read get_InsufficientAuthorization;
    class property InsufficientEncryption: Byte read get_InsufficientEncryption;
    class property InsufficientEncryptionKeySize: Byte read get_InsufficientEncryptionKeySize;
    class property InsufficientResources: Byte read get_InsufficientResources;
    class property InvalidAttributeValueLength: Byte read get_InvalidAttributeValueLength;
    class property InvalidHandle: Byte read get_InvalidHandle;
    class property InvalidOffset: Byte read get_InvalidOffset;
    class property InvalidPdu: Byte read get_InvalidPdu;
    class property PrepareQueueFull: Byte read get_PrepareQueueFull;
    class property ReadNotPermitted: Byte read get_ReadNotPermitted;
    class property RequestNotSupported: Byte read get_RequestNotSupported;
    class property UnlikelyError: Byte read get_UnlikelyError;
    class property UnsupportedGroupType: Byte read get_UnsupportedGroupType;
    class property WriteNotPermitted: Byte read get_WriteNotPermitted;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattSession
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatics"
  TGenericAttributeProfile_GattSession = class(TWinRTGenericImportS<GenericAttributeProfile_IGattSessionStatics>)
  public
    // -> GenericAttributeProfile_IGattSessionStatics
    class function FromDeviceIdAsync(deviceId: IBluetoothDeviceId): IAsyncOperation_1__GenericAttributeProfile_IGattSession; static; inline;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattSessionStatusChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSessionStatusChangedEventArgs

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristic
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic2
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristic3
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicStatics"
  TGenericAttributeProfile_GattCharacteristic = class(TWinRTGenericImportS<GenericAttributeProfile_IGattCharacteristicStatics>)
  public
    // -> GenericAttributeProfile_IGattCharacteristicStatics
    class function ConvertShortIdToUuid(shortId: Word): TGuid; static; inline;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicsResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicsResult

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptor
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptor2
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorStatics"
  TGenericAttributeProfile_GattDescriptor = class(TWinRTGenericImportS<GenericAttributeProfile_IGattDescriptorStatics>)
  public
    // -> GenericAttributeProfile_IGattDescriptorStatics
    class function ConvertShortIdToUuid(shortId: Word): TGuid; static; inline;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormat
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormat
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatStatics2"
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatStatics"
  TGenericAttributeProfile_GattPresentationFormat = class(TWinRTGenericImportS2<GenericAttributeProfile_IGattPresentationFormatStatics, GenericAttributeProfile_IGattPresentationFormatStatics2>)
  public
    // -> GenericAttributeProfile_IGattPresentationFormatStatics2
    class function FromParts(formatType: Byte; exponent: Integer; &unit: Word; namespaceId: Byte; description: Word): GenericAttributeProfile_IGattPresentationFormat; static; inline;

    // -> GenericAttributeProfile_IGattPresentationFormatStatics
    class function get_BluetoothSigAssignedNumbers: Byte; static; inline;
    class property BluetoothSigAssignedNumbers: Byte read get_BluetoothSigAssignedNumbers;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattReadResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadResult2

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattReadClientCharacteristicConfigurationDescriptorResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadClientCharacteristicConfigurationDescriptorResult2

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattValueChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattValueChangedEventArgs

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorsResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorsResult

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteResult

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattPresentationFormatTypes
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattPresentationFormatTypesStatics"
  TGenericAttributeProfile_GattPresentationFormatTypes = class(TWinRTGenericImportS<GenericAttributeProfile_IGattPresentationFormatTypesStatics>)
  public
    // -> GenericAttributeProfile_IGattPresentationFormatTypesStatics
    class function get_Boolean: Byte; static; inline;
    class function get_Bit2: Byte; static; inline;
    class function get_Nibble: Byte; static; inline;
    class function get_UInt8: Byte; static; inline;
    class function get_UInt12: Byte; static; inline;
    class function get_UInt16: Byte; static; inline;
    class function get_UInt24: Byte; static; inline;
    class function get_UInt32: Byte; static; inline;
    class function get_UInt48: Byte; static; inline;
    class function get_UInt64: Byte; static; inline;
    class function get_UInt128: Byte; static; inline;
    class function get_SInt8: Byte; static; inline;
    class function get_SInt12: Byte; static; inline;
    class function get_SInt16: Byte; static; inline;
    class function get_SInt24: Byte; static; inline;
    class function get_SInt32: Byte; static; inline;
    class function get_SInt48: Byte; static; inline;
    class function get_SInt64: Byte; static; inline;
    class function get_SInt128: Byte; static; inline;
    class function get_Float32: Byte; static; inline;
    class function get_Float64: Byte; static; inline;
    class function get_SFloat: Byte; static; inline;
    class function get_Float: Byte; static; inline;
    class function get_DUInt16: Byte; static; inline;
    class function get_Utf8: Byte; static; inline;
    class function get_Utf16: Byte; static; inline;
    class function get_Struct: Byte; static; inline;
    class property Bit2: Byte read get_Bit2;
    class property Boolean: Byte read get_Boolean;
    class property DUInt16: Byte read get_DUInt16;
    class property Float: Byte read get_Float;
    class property Float32: Byte read get_Float32;
    class property Float64: Byte read get_Float64;
    class property Nibble: Byte read get_Nibble;
    class property SFloat: Byte read get_SFloat;
    class property SInt12: Byte read get_SInt12;
    class property SInt128: Byte read get_SInt128;
    class property SInt16: Byte read get_SInt16;
    class property SInt24: Byte read get_SInt24;
    class property SInt32: Byte read get_SInt32;
    class property SInt48: Byte read get_SInt48;
    class property SInt64: Byte read get_SInt64;
    class property SInt8: Byte read get_SInt8;
    class property Struct: Byte read get_Struct;
    class property UInt12: Byte read get_UInt12;
    class property UInt128: Byte read get_UInt128;
    class property UInt16: Byte read get_UInt16;
    class property UInt24: Byte read get_UInt24;
    class property UInt32: Byte read get_UInt32;
    class property UInt48: Byte read get_UInt48;
    class property UInt64: Byte read get_UInt64;
    class property UInt8: Byte read get_UInt8;
    class property Utf16: Byte read get_Utf16;
    class property Utf8: Byte read get_Utf8;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceUuids
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceUuidsStatics2"
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceUuidsStatics"
  TGenericAttributeProfile_GattServiceUuids = class(TWinRTGenericImportS2<GenericAttributeProfile_IGattServiceUuidsStatics, GenericAttributeProfile_IGattServiceUuidsStatics2>)
  public
    // -> GenericAttributeProfile_IGattServiceUuidsStatics2
    class function get_AlertNotification: TGuid; static; inline;
    class function get_CurrentTime: TGuid; static; inline;
    class function get_CyclingPower: TGuid; static; inline;
    class function get_DeviceInformation: TGuid; static; inline;
    class function get_HumanInterfaceDevice: TGuid; static; inline;
    class function get_ImmediateAlert: TGuid; static; inline;
    class function get_LinkLoss: TGuid; static; inline;
    class function get_LocationAndNavigation: TGuid; static; inline;
    class function get_NextDstChange: TGuid; static; inline;
    class function get_PhoneAlertStatus: TGuid; static; inline;
    class function get_ReferenceTimeUpdate: TGuid; static; inline;
    class function get_ScanParameters: TGuid; static; inline;
    class function get_TxPower: TGuid; static; inline;
    class property AlertNotification: TGuid read get_AlertNotification;
    class property CurrentTime: TGuid read get_CurrentTime;
    class property CyclingPower: TGuid read get_CyclingPower;
    class property DeviceInformation: TGuid read get_DeviceInformation;
    class property HumanInterfaceDevice: TGuid read get_HumanInterfaceDevice;
    class property ImmediateAlert: TGuid read get_ImmediateAlert;
    class property LinkLoss: TGuid read get_LinkLoss;
    class property LocationAndNavigation: TGuid read get_LocationAndNavigation;
    class property NextDstChange: TGuid read get_NextDstChange;
    class property PhoneAlertStatus: TGuid read get_PhoneAlertStatus;
    class property ReferenceTimeUpdate: TGuid read get_ReferenceTimeUpdate;
    class property ScanParameters: TGuid read get_ScanParameters;
    class property TxPower: TGuid read get_TxPower;

    // -> GenericAttributeProfile_IGattServiceUuidsStatics
    class function get_Battery: TGuid; static; inline;
    class function get_BloodPressure: TGuid; static; inline;
    class function get_CyclingSpeedAndCadence: TGuid; static; inline;
    class function get_GenericAccess: TGuid; static; inline;
    class function get_GenericAttribute: TGuid; static; inline;
    class function get_Glucose: TGuid; static; inline;
    class function get_HealthThermometer: TGuid; static; inline;
    class function get_HeartRate: TGuid; static; inline;
    class function get_RunningSpeedAndCadence: TGuid; static; inline;
    class property Battery: TGuid read get_Battery;
    class property BloodPressure: TGuid read get_BloodPressure;
    class property CyclingSpeedAndCadence: TGuid read get_CyclingSpeedAndCadence;
    class property GenericAccess: TGuid read get_GenericAccess;
    class property GenericAttribute: TGuid read get_GenericAttribute;
    class property Glucose: TGuid read get_Glucose;
    class property HealthThermometer: TGuid read get_HealthThermometer;
    class property HeartRate: TGuid read get_HeartRate;
    class property RunningSpeedAndCadence: TGuid read get_RunningSpeedAndCadence;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicUuidsStatics2"
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattCharacteristicUuidsStatics"
  TGenericAttributeProfile_GattCharacteristicUuids = class(TWinRTGenericImportS2<GenericAttributeProfile_IGattCharacteristicUuidsStatics, GenericAttributeProfile_IGattCharacteristicUuidsStatics2>)
  public
    // -> GenericAttributeProfile_IGattCharacteristicUuidsStatics2
    class function get_AlertCategoryId: TGuid; static; inline;
    class function get_AlertCategoryIdBitMask: TGuid; static; inline;
    class function get_AlertLevel: TGuid; static; inline;
    class function get_AlertNotificationControlPoint: TGuid; static; inline;
    class function get_AlertStatus: TGuid; static; inline;
    class function get_GapAppearance: TGuid; static; inline;
    class function get_BootKeyboardInputReport: TGuid; static; inline;
    class function get_BootKeyboardOutputReport: TGuid; static; inline;
    class function get_BootMouseInputReport: TGuid; static; inline;
    class function get_CurrentTime: TGuid; static; inline;
    class function get_CyclingPowerControlPoint: TGuid; static; inline;
    class function get_CyclingPowerFeature: TGuid; static; inline;
    class function get_CyclingPowerMeasurement: TGuid; static; inline;
    class function get_CyclingPowerVector: TGuid; static; inline;
    class function get_DateTime: TGuid; static; inline;
    class function get_DayDateTime: TGuid; static; inline;
    class function get_DayOfWeek: TGuid; static; inline;
    class function get_GapDeviceName: TGuid; static; inline;
    class function get_DstOffset: TGuid; static; inline;
    class function get_ExactTime256: TGuid; static; inline;
    class function get_FirmwareRevisionString: TGuid; static; inline;
    class function get_HardwareRevisionString: TGuid; static; inline;
    class function get_HidControlPoint: TGuid; static; inline;
    class function get_HidInformation: TGuid; static; inline;
    class function get_Ieee1107320601RegulatoryCertificationDataList: TGuid; static; inline;
    class function get_LnControlPoint: TGuid; static; inline;
    class function get_LnFeature: TGuid; static; inline;
    class function get_LocalTimeInformation: TGuid; static; inline;
    class function get_LocationAndSpeed: TGuid; static; inline;
    class function get_ManufacturerNameString: TGuid; static; inline;
    class function get_ModelNumberString: TGuid; static; inline;
    class function get_Navigation: TGuid; static; inline;
    class function get_NewAlert: TGuid; static; inline;
    class function get_GapPeripheralPreferredConnectionParameters: TGuid; static; inline;
    class function get_GapPeripheralPrivacyFlag: TGuid; static; inline;
    class function get_PnpId: TGuid; static; inline;
    class function get_PositionQuality: TGuid; static; inline;
    class function get_ProtocolMode: TGuid; static; inline;
    class function get_GapReconnectionAddress: TGuid; static; inline;
    class function get_ReferenceTimeInformation: TGuid; static; inline;
    class function get_Report: TGuid; static; inline;
    class function get_ReportMap: TGuid; static; inline;
    class function get_RingerControlPoint: TGuid; static; inline;
    class function get_RingerSetting: TGuid; static; inline;
    class function get_ScanIntervalWindow: TGuid; static; inline;
    class function get_ScanRefresh: TGuid; static; inline;
    class function get_SerialNumberString: TGuid; static; inline;
    class function get_GattServiceChanged: TGuid; static; inline;
    class function get_SoftwareRevisionString: TGuid; static; inline;
    class function get_SupportedNewAlertCategory: TGuid; static; inline;
    class function get_SupportUnreadAlertCategory: TGuid; static; inline;
    class function get_SystemId: TGuid; static; inline;
    class function get_TimeAccuracy: TGuid; static; inline;
    class function get_TimeSource: TGuid; static; inline;
    class function get_TimeUpdateControlPoint: TGuid; static; inline;
    class function get_TimeUpdateState: TGuid; static; inline;
    class function get_TimeWithDst: TGuid; static; inline;
    class function get_TimeZone: TGuid; static; inline;
    class function get_TxPowerLevel: TGuid; static; inline;
    class function get_UnreadAlertStatus: TGuid; static; inline;
    class property AlertCategoryId: TGuid read get_AlertCategoryId;
    class property AlertCategoryIdBitMask: TGuid read get_AlertCategoryIdBitMask;
    class property AlertLevel: TGuid read get_AlertLevel;
    class property AlertNotificationControlPoint: TGuid read get_AlertNotificationControlPoint;
    class property AlertStatus: TGuid read get_AlertStatus;
    class property BootKeyboardInputReport: TGuid read get_BootKeyboardInputReport;
    class property BootKeyboardOutputReport: TGuid read get_BootKeyboardOutputReport;
    class property BootMouseInputReport: TGuid read get_BootMouseInputReport;
    class property CurrentTime: TGuid read get_CurrentTime;
    class property CyclingPowerControlPoint: TGuid read get_CyclingPowerControlPoint;
    class property CyclingPowerFeature: TGuid read get_CyclingPowerFeature;
    class property CyclingPowerMeasurement: TGuid read get_CyclingPowerMeasurement;
    class property CyclingPowerVector: TGuid read get_CyclingPowerVector;
    class property DateTime: TGuid read get_DateTime;
    class property DayDateTime: TGuid read get_DayDateTime;
    class property DayOfWeek: TGuid read get_DayOfWeek;
    class property DstOffset: TGuid read get_DstOffset;
    class property ExactTime256: TGuid read get_ExactTime256;
    class property FirmwareRevisionString: TGuid read get_FirmwareRevisionString;
    class property GapAppearance: TGuid read get_GapAppearance;
    class property GapDeviceName: TGuid read get_GapDeviceName;
    class property GapPeripheralPreferredConnectionParameters: TGuid read get_GapPeripheralPreferredConnectionParameters;
    class property GapPeripheralPrivacyFlag: TGuid read get_GapPeripheralPrivacyFlag;
    class property GapReconnectionAddress: TGuid read get_GapReconnectionAddress;
    class property GattServiceChanged: TGuid read get_GattServiceChanged;
    class property HardwareRevisionString: TGuid read get_HardwareRevisionString;
    class property HidControlPoint: TGuid read get_HidControlPoint;
    class property HidInformation: TGuid read get_HidInformation;
    class property Ieee1107320601RegulatoryCertificationDataList: TGuid read get_Ieee1107320601RegulatoryCertificationDataList;
    class property LnControlPoint: TGuid read get_LnControlPoint;
    class property LnFeature: TGuid read get_LnFeature;
    class property LocalTimeInformation: TGuid read get_LocalTimeInformation;
    class property LocationAndSpeed: TGuid read get_LocationAndSpeed;
    class property ManufacturerNameString: TGuid read get_ManufacturerNameString;
    class property ModelNumberString: TGuid read get_ModelNumberString;
    class property Navigation: TGuid read get_Navigation;
    class property NewAlert: TGuid read get_NewAlert;
    class property PnpId: TGuid read get_PnpId;
    class property PositionQuality: TGuid read get_PositionQuality;
    class property ProtocolMode: TGuid read get_ProtocolMode;
    class property ReferenceTimeInformation: TGuid read get_ReferenceTimeInformation;
    class property Report: TGuid read get_Report;
    class property ReportMap: TGuid read get_ReportMap;
    class property RingerControlPoint: TGuid read get_RingerControlPoint;
    class property RingerSetting: TGuid read get_RingerSetting;
    class property ScanIntervalWindow: TGuid read get_ScanIntervalWindow;
    class property ScanRefresh: TGuid read get_ScanRefresh;
    class property SerialNumberString: TGuid read get_SerialNumberString;
    class property SoftwareRevisionString: TGuid read get_SoftwareRevisionString;
    class property SupportUnreadAlertCategory: TGuid read get_SupportUnreadAlertCategory;
    class property SupportedNewAlertCategory: TGuid read get_SupportedNewAlertCategory;
    class property SystemId: TGuid read get_SystemId;
    class property TimeAccuracy: TGuid read get_TimeAccuracy;
    class property TimeSource: TGuid read get_TimeSource;
    class property TimeUpdateControlPoint: TGuid read get_TimeUpdateControlPoint;
    class property TimeUpdateState: TGuid read get_TimeUpdateState;
    class property TimeWithDst: TGuid read get_TimeWithDst;
    class property TimeZone: TGuid read get_TimeZone;
    class property TxPowerLevel: TGuid read get_TxPowerLevel;
    class property UnreadAlertStatus: TGuid read get_UnreadAlertStatus;

    // -> GenericAttributeProfile_IGattCharacteristicUuidsStatics
    class function get_BatteryLevel: TGuid; static; inline;
    class function get_BloodPressureFeature: TGuid; static; inline;
    class function get_BloodPressureMeasurement: TGuid; static; inline;
    class function get_BodySensorLocation: TGuid; static; inline;
    class function get_CscFeature: TGuid; static; inline;
    class function get_CscMeasurement: TGuid; static; inline;
    class function get_GlucoseFeature: TGuid; static; inline;
    class function get_GlucoseMeasurement: TGuid; static; inline;
    class function get_GlucoseMeasurementContext: TGuid; static; inline;
    class function get_HeartRateControlPoint: TGuid; static; inline;
    class function get_HeartRateMeasurement: TGuid; static; inline;
    class function get_IntermediateCuffPressure: TGuid; static; inline;
    class function get_IntermediateTemperature: TGuid; static; inline;
    class function get_MeasurementInterval: TGuid; static; inline;
    class function get_RecordAccessControlPoint: TGuid; static; inline;
    class function get_RscFeature: TGuid; static; inline;
    class function get_RscMeasurement: TGuid; static; inline;
    class function get_SCControlPoint: TGuid; static; inline;
    class function get_SensorLocation: TGuid; static; inline;
    class function get_TemperatureMeasurement: TGuid; static; inline;
    class function get_TemperatureType: TGuid; static; inline;
    class property BatteryLevel: TGuid read get_BatteryLevel;
    class property BloodPressureFeature: TGuid read get_BloodPressureFeature;
    class property BloodPressureMeasurement: TGuid read get_BloodPressureMeasurement;
    class property BodySensorLocation: TGuid read get_BodySensorLocation;
    class property CscFeature: TGuid read get_CscFeature;
    class property CscMeasurement: TGuid read get_CscMeasurement;
    class property GlucoseFeature: TGuid read get_GlucoseFeature;
    class property GlucoseMeasurement: TGuid read get_GlucoseMeasurement;
    class property GlucoseMeasurementContext: TGuid read get_GlucoseMeasurementContext;
    class property HeartRateControlPoint: TGuid read get_HeartRateControlPoint;
    class property HeartRateMeasurement: TGuid read get_HeartRateMeasurement;
    class property IntermediateCuffPressure: TGuid read get_IntermediateCuffPressure;
    class property IntermediateTemperature: TGuid read get_IntermediateTemperature;
    class property MeasurementInterval: TGuid read get_MeasurementInterval;
    class property RecordAccessControlPoint: TGuid read get_RecordAccessControlPoint;
    class property RscFeature: TGuid read get_RscFeature;
    class property RscMeasurement: TGuid read get_RscMeasurement;
    class property SCControlPoint: TGuid read get_SCControlPoint;
    class property SensorLocation: TGuid read get_SensorLocation;
    class property TemperatureMeasurement: TGuid read get_TemperatureMeasurement;
    class property TemperatureType: TGuid read get_TemperatureType;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattDescriptorUuids
  // DualAPI
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattDescriptorUuidsStatics"
  TGenericAttributeProfile_GattDescriptorUuids = class(TWinRTGenericImportS<GenericAttributeProfile_IGattDescriptorUuidsStatics>)
  public
    // -> GenericAttributeProfile_IGattDescriptorUuidsStatics
    class function get_CharacteristicAggregateFormat: TGuid; static; inline;
    class function get_CharacteristicExtendedProperties: TGuid; static; inline;
    class function get_CharacteristicPresentationFormat: TGuid; static; inline;
    class function get_CharacteristicUserDescription: TGuid; static; inline;
    class function get_ClientCharacteristicConfiguration: TGuid; static; inline;
    class function get_ServerCharacteristicConfiguration: TGuid; static; inline;
    class property CharacteristicAggregateFormat: TGuid read get_CharacteristicAggregateFormat;
    class property CharacteristicExtendedProperties: TGuid read get_CharacteristicExtendedProperties;
    class property CharacteristicPresentationFormat: TGuid read get_CharacteristicPresentationFormat;
    class property CharacteristicUserDescription: TGuid read get_CharacteristicUserDescription;
    class property ClientCharacteristicConfiguration: TGuid read get_ClientCharacteristicConfiguration;
    class property ServerCharacteristicConfiguration: TGuid read get_ServerCharacteristicConfiguration;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattReliableWriteTransaction
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReliableWriteTransaction2
  // Instantiable: "GenericAttributeProfile_IGattReliableWriteTransaction"
  TGenericAttributeProfile_GattReliableWriteTransaction = class(TWinRTGenericImportI<GenericAttributeProfile_IGattReliableWriteTransaction>) end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisingParameters
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisingParameters
  // Instantiable: "GenericAttributeProfile_IGattServiceProviderAdvertisingParameters"
  TGenericAttributeProfile_GattServiceProviderAdvertisingParameters = class(TWinRTGenericImportI<GenericAttributeProfile_IGattServiceProviderAdvertisingParameters>) end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalCharacteristicParameters
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicParameters
  // Instantiable: "GenericAttributeProfile_IGattLocalCharacteristicParameters"
  TGenericAttributeProfile_GattLocalCharacteristicParameters = class(TWinRTGenericImportI<GenericAttributeProfile_IGattLocalCharacteristicParameters>) end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalDescriptorParameters
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorParameters
  // Instantiable: "GenericAttributeProfile_IGattLocalDescriptorParameters"
  TGenericAttributeProfile_GattLocalDescriptorParameters = class(TWinRTGenericImportI<GenericAttributeProfile_IGattLocalDescriptorParameters>) end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderResult

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalService
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalService

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProvider
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProvider
  // Statics: "Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderStatics"
  TGenericAttributeProfile_GattServiceProvider = class(TWinRTGenericImportS<GenericAttributeProfile_IGattServiceProviderStatics>)
  public
    // -> GenericAttributeProfile_IGattServiceProviderStatics
    class function CreateAsync(serviceUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult; static; inline;
  end;

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisementStatusChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattServiceProviderAdvertisementStatusChangedEventArgs

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalCharacteristicResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristicResult

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalCharacteristic
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalDescriptorResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptorResult

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattLocalDescriptor
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalDescriptor

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattSubscribedClient
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattReadRequestedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequestedEventArgs

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteRequestedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequestedEventArgs

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattClientNotificationResult
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattClientNotificationResult2

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattReadRequest
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattReadRequest

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattRequestStateChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattRequestStateChangedEventArgs

  // Windows.Devices.Bluetooth.GenericAttributeProfile.GattWriteRequest
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.GenericAttributeProfile.IGattWriteRequest

  // Windows.Devices.Bluetooth.Rfcomm.RfcommServiceProvider
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider
  // Implements: Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProvider2
  // Statics: "Windows.Devices.Bluetooth.Rfcomm.IRfcommServiceProviderStatics"
  TRfcomm_RfcommServiceProvider = class(TWinRTGenericImportS<Rfcomm_IRfcommServiceProviderStatics>)
  public
    // -> Rfcomm_IRfcommServiceProviderStatics
    class function CreateAsync(serviceId: Rfcomm_IRfcommServiceId): IAsyncOperation_1__Rfcomm_IRfcommServiceProvider; static; inline;
  end;

  // Windows.Devices.Bluetooth.Background.GattServiceProviderConnection
  // DualAPI
  // Implements: Windows.Devices.Bluetooth.Background.IGattServiceProviderConnection
  // Statics: "Windows.Devices.Bluetooth.Background.IGattServiceProviderConnectionStatics"
  TBackground_GattServiceProviderConnection = class(TWinRTGenericImportS<Background_IGattServiceProviderConnectionStatics>)
  public
    // -> Background_IGattServiceProviderConnectionStatics
    class function get_AllServices: IMapView_2__HSTRING__Background_IGattServiceProviderConnection; static; inline;
    class property AllServices: IMapView_2__HSTRING__Background_IGattServiceProviderConnection read get_AllServices;
  end;


implementation

  // Emit Classes Implementation
 { TBluetoothAdapter }

class function TBluetoothAdapter.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TBluetoothAdapter.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothAdapter;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TBluetoothAdapter.GetDefaultAsync: IAsyncOperation_1__IBluetoothAdapter;
begin
  Result := Statics.GetDefaultAsync;
end;

 { TBluetoothDeviceId }

class function TBluetoothDeviceId.FromId(deviceId: HSTRING): IBluetoothDeviceId;
begin
  Result := Statics.FromId(deviceId);
end;

 { TBluetoothUuidHelper }

class function TBluetoothUuidHelper.FromShortId(shortId: Cardinal): TGuid;
begin
  Result := Statics.FromShortId(shortId);
end;

class function TBluetoothUuidHelper.TryGetShortId(uuid: TGuid): IReference_1__Cardinal;
begin
  Result := Statics.TryGetShortId(uuid);
end;

 { TBluetoothDevice }

class function TBluetoothDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TBluetoothDevice.FromHostNameAsync(hostName: IHostName): IAsyncOperation_1__IBluetoothDevice;
begin
  Result := Statics.FromHostNameAsync(hostName);
end;

class function TBluetoothDevice.FromBluetoothAddressAsync(address: UInt64): IAsyncOperation_1__IBluetoothDevice;
begin
  Result := Statics.FromBluetoothAddressAsync(address);
end;

class function TBluetoothDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;


class function TBluetoothDevice.GetDeviceSelectorFromPairingState(pairingState: Boolean): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromPairingState(pairingState);
end;

class function TBluetoothDevice.GetDeviceSelectorFromConnectionStatus(connectionStatus: BluetoothConnectionStatus): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromConnectionStatus(connectionStatus);
end;

class function TBluetoothDevice.GetDeviceSelectorFromDeviceName(deviceName: HSTRING): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromDeviceName(deviceName);
end;

class function TBluetoothDevice.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress);
end;

class function TBluetoothDevice.GetDeviceSelectorFromClassOfDevice(classOfDevice: IBluetoothClassOfDevice): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromClassOfDevice(classOfDevice);
end;


 { TBluetoothClassOfDevice }

class function TBluetoothClassOfDevice.FromRawValue(rawValue: Cardinal): IBluetoothClassOfDevice;
begin
  Result := Statics.FromRawValue(rawValue);
end;

class function TBluetoothClassOfDevice.FromParts(majorClass: BluetoothMajorClass; minorClass: BluetoothMinorClass; serviceCapabilities: BluetoothServiceCapabilities): IBluetoothClassOfDevice;
begin
  Result := Statics.FromParts(majorClass, minorClass, serviceCapabilities);
end;


 { TRfcomm_RfcommDeviceService }

class function TRfcomm_RfcommDeviceService.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Rfcomm_IRfcommDeviceService;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TRfcomm_RfcommDeviceService.GetDeviceSelector(serviceId: Rfcomm_IRfcommServiceId): HSTRING;
begin
  Result := Statics.GetDeviceSelector(serviceId);
end;


class function TRfcomm_RfcommDeviceService.GetDeviceSelectorForBluetoothDevice(bluetoothDevice: IBluetoothDevice): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDevice(bluetoothDevice);
end;

class function TRfcomm_RfcommDeviceService.GetDeviceSelectorForBluetoothDevice(bluetoothDevice: IBluetoothDevice; cacheMode: BluetoothCacheMode): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDevice(bluetoothDevice, cacheMode);
end;

class function TRfcomm_RfcommDeviceService.GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice: IBluetoothDevice; serviceId: Rfcomm_IRfcommServiceId): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice, serviceId);
end;

class function TRfcomm_RfcommDeviceService.GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice: IBluetoothDevice; serviceId: Rfcomm_IRfcommServiceId; cacheMode: BluetoothCacheMode): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice, serviceId, cacheMode);
end;


 { TRfcomm_RfcommServiceId }

class function TRfcomm_RfcommServiceId.FromUuid(uuid: TGuid): Rfcomm_IRfcommServiceId;
begin
  Result := Statics.FromUuid(uuid);
end;

class function TRfcomm_RfcommServiceId.FromShortId(shortId: Cardinal): Rfcomm_IRfcommServiceId;
begin
  Result := Statics.FromShortId(shortId);
end;

class function TRfcomm_RfcommServiceId.get_SerialPort: Rfcomm_IRfcommServiceId;
begin
  Result := Statics.get_SerialPort;
end;

class function TRfcomm_RfcommServiceId.get_ObexObjectPush: Rfcomm_IRfcommServiceId;
begin
  Result := Statics.get_ObexObjectPush;
end;

class function TRfcomm_RfcommServiceId.get_ObexFileTransfer: Rfcomm_IRfcommServiceId;
begin
  Result := Statics.get_ObexFileTransfer;
end;

class function TRfcomm_RfcommServiceId.get_PhoneBookAccessPce: Rfcomm_IRfcommServiceId;
begin
  Result := Statics.get_PhoneBookAccessPce;
end;

class function TRfcomm_RfcommServiceId.get_PhoneBookAccessPse: Rfcomm_IRfcommServiceId;
begin
  Result := Statics.get_PhoneBookAccessPse;
end;

class function TRfcomm_RfcommServiceId.get_GenericFileTransfer: Rfcomm_IRfcommServiceId;
begin
  Result := Statics.get_GenericFileTransfer;
end;


 { TBluetoothLEAppearanceCategories }

class function TBluetoothLEAppearanceCategories.get_Uncategorized: Word;
begin
  Result := Statics.get_Uncategorized;
end;

class function TBluetoothLEAppearanceCategories.get_Phone: Word;
begin
  Result := Statics.get_Phone;
end;

class function TBluetoothLEAppearanceCategories.get_Computer: Word;
begin
  Result := Statics.get_Computer;
end;

class function TBluetoothLEAppearanceCategories.get_Watch: Word;
begin
  Result := Statics.get_Watch;
end;

class function TBluetoothLEAppearanceCategories.get_Clock: Word;
begin
  Result := Statics.get_Clock;
end;

class function TBluetoothLEAppearanceCategories.get_Display: Word;
begin
  Result := Statics.get_Display;
end;

class function TBluetoothLEAppearanceCategories.get_RemoteControl: Word;
begin
  Result := Statics.get_RemoteControl;
end;

class function TBluetoothLEAppearanceCategories.get_EyeGlasses: Word;
begin
  Result := Statics.get_EyeGlasses;
end;

class function TBluetoothLEAppearanceCategories.get_Tag: Word;
begin
  Result := Statics.get_Tag;
end;

class function TBluetoothLEAppearanceCategories.get_Keyring: Word;
begin
  Result := Statics.get_Keyring;
end;

class function TBluetoothLEAppearanceCategories.get_MediaPlayer: Word;
begin
  Result := Statics.get_MediaPlayer;
end;

class function TBluetoothLEAppearanceCategories.get_BarcodeScanner: Word;
begin
  Result := Statics.get_BarcodeScanner;
end;

class function TBluetoothLEAppearanceCategories.get_Thermometer: Word;
begin
  Result := Statics.get_Thermometer;
end;

class function TBluetoothLEAppearanceCategories.get_HeartRate: Word;
begin
  Result := Statics.get_HeartRate;
end;

class function TBluetoothLEAppearanceCategories.get_BloodPressure: Word;
begin
  Result := Statics.get_BloodPressure;
end;

class function TBluetoothLEAppearanceCategories.get_HumanInterfaceDevice: Word;
begin
  Result := Statics.get_HumanInterfaceDevice;
end;

class function TBluetoothLEAppearanceCategories.get_GlucoseMeter: Word;
begin
  Result := Statics.get_GlucoseMeter;
end;

class function TBluetoothLEAppearanceCategories.get_RunningWalking: Word;
begin
  Result := Statics.get_RunningWalking;
end;

class function TBluetoothLEAppearanceCategories.get_Cycling: Word;
begin
  Result := Statics.get_Cycling;
end;

class function TBluetoothLEAppearanceCategories.get_PulseOximeter: Word;
begin
  Result := Statics.get_PulseOximeter;
end;

class function TBluetoothLEAppearanceCategories.get_WeightScale: Word;
begin
  Result := Statics.get_WeightScale;
end;

class function TBluetoothLEAppearanceCategories.get_OutdoorSportActivity: Word;
begin
  Result := Statics.get_OutdoorSportActivity;
end;


 { TBluetoothLEAppearanceSubcategories }

class function TBluetoothLEAppearanceSubcategories.get_Generic: Word;
begin
  Result := Statics.get_Generic;
end;

class function TBluetoothLEAppearanceSubcategories.get_SportsWatch: Word;
begin
  Result := Statics.get_SportsWatch;
end;

class function TBluetoothLEAppearanceSubcategories.get_ThermometerEar: Word;
begin
  Result := Statics.get_ThermometerEar;
end;

class function TBluetoothLEAppearanceSubcategories.get_HeartRateBelt: Word;
begin
  Result := Statics.get_HeartRateBelt;
end;

class function TBluetoothLEAppearanceSubcategories.get_BloodPressureArm: Word;
begin
  Result := Statics.get_BloodPressureArm;
end;

class function TBluetoothLEAppearanceSubcategories.get_BloodPressureWrist: Word;
begin
  Result := Statics.get_BloodPressureWrist;
end;

class function TBluetoothLEAppearanceSubcategories.get_Keyboard: Word;
begin
  Result := Statics.get_Keyboard;
end;

class function TBluetoothLEAppearanceSubcategories.get_Mouse: Word;
begin
  Result := Statics.get_Mouse;
end;

class function TBluetoothLEAppearanceSubcategories.get_Joystick: Word;
begin
  Result := Statics.get_Joystick;
end;

class function TBluetoothLEAppearanceSubcategories.get_Gamepad: Word;
begin
  Result := Statics.get_Gamepad;
end;

class function TBluetoothLEAppearanceSubcategories.get_DigitizerTablet: Word;
begin
  Result := Statics.get_DigitizerTablet;
end;

class function TBluetoothLEAppearanceSubcategories.get_CardReader: Word;
begin
  Result := Statics.get_CardReader;
end;

class function TBluetoothLEAppearanceSubcategories.get_DigitalPen: Word;
begin
  Result := Statics.get_DigitalPen;
end;

class function TBluetoothLEAppearanceSubcategories.get_BarcodeScanner: Word;
begin
  Result := Statics.get_BarcodeScanner;
end;

class function TBluetoothLEAppearanceSubcategories.get_RunningWalkingInShoe: Word;
begin
  Result := Statics.get_RunningWalkingInShoe;
end;

class function TBluetoothLEAppearanceSubcategories.get_RunningWalkingOnShoe: Word;
begin
  Result := Statics.get_RunningWalkingOnShoe;
end;

class function TBluetoothLEAppearanceSubcategories.get_RunningWalkingOnHip: Word;
begin
  Result := Statics.get_RunningWalkingOnHip;
end;

class function TBluetoothLEAppearanceSubcategories.get_CyclingComputer: Word;
begin
  Result := Statics.get_CyclingComputer;
end;

class function TBluetoothLEAppearanceSubcategories.get_CyclingSpeedSensor: Word;
begin
  Result := Statics.get_CyclingSpeedSensor;
end;

class function TBluetoothLEAppearanceSubcategories.get_CyclingCadenceSensor: Word;
begin
  Result := Statics.get_CyclingCadenceSensor;
end;

class function TBluetoothLEAppearanceSubcategories.get_CyclingPowerSensor: Word;
begin
  Result := Statics.get_CyclingPowerSensor;
end;

class function TBluetoothLEAppearanceSubcategories.get_CyclingSpeedCadenceSensor: Word;
begin
  Result := Statics.get_CyclingSpeedCadenceSensor;
end;

class function TBluetoothLEAppearanceSubcategories.get_OximeterFingertip: Word;
begin
  Result := Statics.get_OximeterFingertip;
end;

class function TBluetoothLEAppearanceSubcategories.get_OximeterWristWorn: Word;
begin
  Result := Statics.get_OximeterWristWorn;
end;

class function TBluetoothLEAppearanceSubcategories.get_LocationDisplay: Word;
begin
  Result := Statics.get_LocationDisplay;
end;

class function TBluetoothLEAppearanceSubcategories.get_LocationNavigationDisplay: Word;
begin
  Result := Statics.get_LocationNavigationDisplay;
end;

class function TBluetoothLEAppearanceSubcategories.get_LocationPod: Word;
begin
  Result := Statics.get_LocationPod;
end;

class function TBluetoothLEAppearanceSubcategories.get_LocationNavigationPod: Word;
begin
  Result := Statics.get_LocationNavigationPod;
end;


 { TBluetoothLEAppearance }

class function TBluetoothLEAppearance.FromRawValue(rawValue: Word): IBluetoothLEAppearance;
begin
  Result := Statics.FromRawValue(rawValue);
end;

class function TBluetoothLEAppearance.FromParts(appearanceCategory: Word; appearanceSubCategory: Word): IBluetoothLEAppearance;
begin
  Result := Statics.FromParts(appearanceCategory, appearanceSubCategory);
end;


 { TBluetoothLEDevice }

class function TBluetoothLEDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBluetoothLEDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TBluetoothLEDevice.FromBluetoothAddressAsync(bluetoothAddress: UInt64): IAsyncOperation_1__IBluetoothLEDevice;
begin
  Result := Statics.FromBluetoothAddressAsync(bluetoothAddress);
end;

class function TBluetoothLEDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;


class function TBluetoothLEDevice.GetDeviceSelectorFromPairingState(pairingState: Boolean): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromPairingState(pairingState);
end;

class function TBluetoothLEDevice.GetDeviceSelectorFromConnectionStatus(connectionStatus: BluetoothConnectionStatus): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromConnectionStatus(connectionStatus);
end;

class function TBluetoothLEDevice.GetDeviceSelectorFromDeviceName(deviceName: HSTRING): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromDeviceName(deviceName);
end;

class function TBluetoothLEDevice.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress);
end;

class function TBluetoothLEDevice.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress: UInt64; bluetoothAddressType: BluetoothAddressType): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress, bluetoothAddressType);
end;

class function TBluetoothLEDevice.GetDeviceSelectorFromAppearance(appearance: IBluetoothLEAppearance): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorFromAppearance(appearance);
end;

class function TBluetoothLEDevice.FromBluetoothAddressAsync(bluetoothAddress: UInt64; bluetoothAddressType: BluetoothAddressType): IAsyncOperation_1__IBluetoothLEDevice;
begin
  Result := Statics2.FromBluetoothAddressAsync(bluetoothAddress, bluetoothAddressType);
end;


 { TGenericAttributeProfile_GattDeviceService }

class function TGenericAttributeProfile_GattDeviceService.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TGenericAttributeProfile_GattDeviceService.GetDeviceSelectorFromUuid(serviceUuid: TGuid): HSTRING;
begin
  Result := Statics.GetDeviceSelectorFromUuid(serviceUuid);
end;

class function TGenericAttributeProfile_GattDeviceService.GetDeviceSelectorFromShortId(serviceShortId: Word): HSTRING;
begin
  Result := Statics.GetDeviceSelectorFromShortId(serviceShortId);
end;

class function TGenericAttributeProfile_GattDeviceService.ConvertShortIdToUuid(shortId: Word): TGuid;
begin
  Result := Statics.ConvertShortIdToUuid(shortId);
end;


class function TGenericAttributeProfile_GattDeviceService.FromIdAsync(deviceId: HSTRING; sharingMode: GenericAttributeProfile_GattSharingMode): IAsyncOperation_1__GenericAttributeProfile_IGattDeviceService;
begin
  Result := Statics2.FromIdAsync(deviceId, sharingMode);
end;

class function TGenericAttributeProfile_GattDeviceService.GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId: IBluetoothDeviceId): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId);
end;

class function TGenericAttributeProfile_GattDeviceService.GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId: IBluetoothDeviceId; cacheMode: BluetoothCacheMode): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId, cacheMode);
end;

class function TGenericAttributeProfile_GattDeviceService.GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId: IBluetoothDeviceId; serviceUuid: TGuid): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId, serviceUuid);
end;

class function TGenericAttributeProfile_GattDeviceService.GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId: IBluetoothDeviceId; serviceUuid: TGuid; cacheMode: BluetoothCacheMode): HSTRING;
begin
  Result := Statics2.GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId, serviceUuid, cacheMode);
end;


 { TBluetoothSignalStrengthFilter }

 { TGenericAttributeProfile_GattProtocolError }

class function TGenericAttributeProfile_GattProtocolError.get_InvalidHandle: Byte;
begin
  Result := Statics.get_InvalidHandle;
end;

class function TGenericAttributeProfile_GattProtocolError.get_ReadNotPermitted: Byte;
begin
  Result := Statics.get_ReadNotPermitted;
end;

class function TGenericAttributeProfile_GattProtocolError.get_WriteNotPermitted: Byte;
begin
  Result := Statics.get_WriteNotPermitted;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InvalidPdu: Byte;
begin
  Result := Statics.get_InvalidPdu;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InsufficientAuthentication: Byte;
begin
  Result := Statics.get_InsufficientAuthentication;
end;

class function TGenericAttributeProfile_GattProtocolError.get_RequestNotSupported: Byte;
begin
  Result := Statics.get_RequestNotSupported;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InvalidOffset: Byte;
begin
  Result := Statics.get_InvalidOffset;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InsufficientAuthorization: Byte;
begin
  Result := Statics.get_InsufficientAuthorization;
end;

class function TGenericAttributeProfile_GattProtocolError.get_PrepareQueueFull: Byte;
begin
  Result := Statics.get_PrepareQueueFull;
end;

class function TGenericAttributeProfile_GattProtocolError.get_AttributeNotFound: Byte;
begin
  Result := Statics.get_AttributeNotFound;
end;

class function TGenericAttributeProfile_GattProtocolError.get_AttributeNotLong: Byte;
begin
  Result := Statics.get_AttributeNotLong;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InsufficientEncryptionKeySize: Byte;
begin
  Result := Statics.get_InsufficientEncryptionKeySize;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InvalidAttributeValueLength: Byte;
begin
  Result := Statics.get_InvalidAttributeValueLength;
end;

class function TGenericAttributeProfile_GattProtocolError.get_UnlikelyError: Byte;
begin
  Result := Statics.get_UnlikelyError;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InsufficientEncryption: Byte;
begin
  Result := Statics.get_InsufficientEncryption;
end;

class function TGenericAttributeProfile_GattProtocolError.get_UnsupportedGroupType: Byte;
begin
  Result := Statics.get_UnsupportedGroupType;
end;

class function TGenericAttributeProfile_GattProtocolError.get_InsufficientResources: Byte;
begin
  Result := Statics.get_InsufficientResources;
end;


 { TGenericAttributeProfile_GattSession }

class function TGenericAttributeProfile_GattSession.FromDeviceIdAsync(deviceId: IBluetoothDeviceId): IAsyncOperation_1__GenericAttributeProfile_IGattSession;
begin
  Result := Statics.FromDeviceIdAsync(deviceId);
end;


 { TGenericAttributeProfile_GattCharacteristic }

class function TGenericAttributeProfile_GattCharacteristic.ConvertShortIdToUuid(shortId: Word): TGuid;
begin
  Result := Statics.ConvertShortIdToUuid(shortId);
end;


 { TGenericAttributeProfile_GattDescriptor }

class function TGenericAttributeProfile_GattDescriptor.ConvertShortIdToUuid(shortId: Word): TGuid;
begin
  Result := Statics.ConvertShortIdToUuid(shortId);
end;


 { TGenericAttributeProfile_GattPresentationFormat }

class function TGenericAttributeProfile_GattPresentationFormat.get_BluetoothSigAssignedNumbers: Byte;
begin
  Result := Statics.get_BluetoothSigAssignedNumbers;
end;


class function TGenericAttributeProfile_GattPresentationFormat.FromParts(formatType: Byte; exponent: Integer; &unit: Word; namespaceId: Byte; description: Word): GenericAttributeProfile_IGattPresentationFormat;
begin
  Result := Statics2.FromParts(formatType, exponent, &unit, namespaceId, description);
end;


 { TGenericAttributeProfile_GattPresentationFormatTypes }

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Boolean: Byte;
begin
  Result := Statics.get_Boolean;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Bit2: Byte;
begin
  Result := Statics.get_Bit2;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Nibble: Byte;
begin
  Result := Statics.get_Nibble;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt8: Byte;
begin
  Result := Statics.get_UInt8;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt12: Byte;
begin
  Result := Statics.get_UInt12;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt16: Byte;
begin
  Result := Statics.get_UInt16;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt24: Byte;
begin
  Result := Statics.get_UInt24;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt32: Byte;
begin
  Result := Statics.get_UInt32;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt48: Byte;
begin
  Result := Statics.get_UInt48;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt64: Byte;
begin
  Result := Statics.get_UInt64;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_UInt128: Byte;
begin
  Result := Statics.get_UInt128;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt8: Byte;
begin
  Result := Statics.get_SInt8;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt12: Byte;
begin
  Result := Statics.get_SInt12;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt16: Byte;
begin
  Result := Statics.get_SInt16;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt24: Byte;
begin
  Result := Statics.get_SInt24;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt32: Byte;
begin
  Result := Statics.get_SInt32;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt48: Byte;
begin
  Result := Statics.get_SInt48;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt64: Byte;
begin
  Result := Statics.get_SInt64;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SInt128: Byte;
begin
  Result := Statics.get_SInt128;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Float32: Byte;
begin
  Result := Statics.get_Float32;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Float64: Byte;
begin
  Result := Statics.get_Float64;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_SFloat: Byte;
begin
  Result := Statics.get_SFloat;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Float: Byte;
begin
  Result := Statics.get_Float;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_DUInt16: Byte;
begin
  Result := Statics.get_DUInt16;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Utf8: Byte;
begin
  Result := Statics.get_Utf8;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Utf16: Byte;
begin
  Result := Statics.get_Utf16;
end;

class function TGenericAttributeProfile_GattPresentationFormatTypes.get_Struct: Byte;
begin
  Result := Statics.get_Struct;
end;


 { TGenericAttributeProfile_GattServiceUuids }

class function TGenericAttributeProfile_GattServiceUuids.get_Battery: TGuid;
begin
  Result := Statics.get_Battery;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_BloodPressure: TGuid;
begin
  Result := Statics.get_BloodPressure;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_CyclingSpeedAndCadence: TGuid;
begin
  Result := Statics.get_CyclingSpeedAndCadence;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_GenericAccess: TGuid;
begin
  Result := Statics.get_GenericAccess;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_GenericAttribute: TGuid;
begin
  Result := Statics.get_GenericAttribute;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_Glucose: TGuid;
begin
  Result := Statics.get_Glucose;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_HealthThermometer: TGuid;
begin
  Result := Statics.get_HealthThermometer;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_HeartRate: TGuid;
begin
  Result := Statics.get_HeartRate;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_RunningSpeedAndCadence: TGuid;
begin
  Result := Statics.get_RunningSpeedAndCadence;
end;


class function TGenericAttributeProfile_GattServiceUuids.get_AlertNotification: TGuid;
begin
  Result := Statics2.get_AlertNotification;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_CurrentTime: TGuid;
begin
  Result := Statics2.get_CurrentTime;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_CyclingPower: TGuid;
begin
  Result := Statics2.get_CyclingPower;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_DeviceInformation: TGuid;
begin
  Result := Statics2.get_DeviceInformation;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_HumanInterfaceDevice: TGuid;
begin
  Result := Statics2.get_HumanInterfaceDevice;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_ImmediateAlert: TGuid;
begin
  Result := Statics2.get_ImmediateAlert;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_LinkLoss: TGuid;
begin
  Result := Statics2.get_LinkLoss;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_LocationAndNavigation: TGuid;
begin
  Result := Statics2.get_LocationAndNavigation;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_NextDstChange: TGuid;
begin
  Result := Statics2.get_NextDstChange;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_PhoneAlertStatus: TGuid;
begin
  Result := Statics2.get_PhoneAlertStatus;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_ReferenceTimeUpdate: TGuid;
begin
  Result := Statics2.get_ReferenceTimeUpdate;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_ScanParameters: TGuid;
begin
  Result := Statics2.get_ScanParameters;
end;

class function TGenericAttributeProfile_GattServiceUuids.get_TxPower: TGuid;
begin
  Result := Statics2.get_TxPower;
end;


 { TGenericAttributeProfile_GattCharacteristicUuids }

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BatteryLevel: TGuid;
begin
  Result := Statics.get_BatteryLevel;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BloodPressureFeature: TGuid;
begin
  Result := Statics.get_BloodPressureFeature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BloodPressureMeasurement: TGuid;
begin
  Result := Statics.get_BloodPressureMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BodySensorLocation: TGuid;
begin
  Result := Statics.get_BodySensorLocation;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CscFeature: TGuid;
begin
  Result := Statics.get_CscFeature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CscMeasurement: TGuid;
begin
  Result := Statics.get_CscMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GlucoseFeature: TGuid;
begin
  Result := Statics.get_GlucoseFeature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GlucoseMeasurement: TGuid;
begin
  Result := Statics.get_GlucoseMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GlucoseMeasurementContext: TGuid;
begin
  Result := Statics.get_GlucoseMeasurementContext;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_HeartRateControlPoint: TGuid;
begin
  Result := Statics.get_HeartRateControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_HeartRateMeasurement: TGuid;
begin
  Result := Statics.get_HeartRateMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_IntermediateCuffPressure: TGuid;
begin
  Result := Statics.get_IntermediateCuffPressure;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_IntermediateTemperature: TGuid;
begin
  Result := Statics.get_IntermediateTemperature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_MeasurementInterval: TGuid;
begin
  Result := Statics.get_MeasurementInterval;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_RecordAccessControlPoint: TGuid;
begin
  Result := Statics.get_RecordAccessControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_RscFeature: TGuid;
begin
  Result := Statics.get_RscFeature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_RscMeasurement: TGuid;
begin
  Result := Statics.get_RscMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SCControlPoint: TGuid;
begin
  Result := Statics.get_SCControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SensorLocation: TGuid;
begin
  Result := Statics.get_SensorLocation;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TemperatureMeasurement: TGuid;
begin
  Result := Statics.get_TemperatureMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TemperatureType: TGuid;
begin
  Result := Statics.get_TemperatureType;
end;


class function TGenericAttributeProfile_GattCharacteristicUuids.get_AlertCategoryId: TGuid;
begin
  Result := Statics2.get_AlertCategoryId;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_AlertCategoryIdBitMask: TGuid;
begin
  Result := Statics2.get_AlertCategoryIdBitMask;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_AlertLevel: TGuid;
begin
  Result := Statics2.get_AlertLevel;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_AlertNotificationControlPoint: TGuid;
begin
  Result := Statics2.get_AlertNotificationControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_AlertStatus: TGuid;
begin
  Result := Statics2.get_AlertStatus;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GapAppearance: TGuid;
begin
  Result := Statics2.get_GapAppearance;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BootKeyboardInputReport: TGuid;
begin
  Result := Statics2.get_BootKeyboardInputReport;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BootKeyboardOutputReport: TGuid;
begin
  Result := Statics2.get_BootKeyboardOutputReport;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_BootMouseInputReport: TGuid;
begin
  Result := Statics2.get_BootMouseInputReport;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CurrentTime: TGuid;
begin
  Result := Statics2.get_CurrentTime;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CyclingPowerControlPoint: TGuid;
begin
  Result := Statics2.get_CyclingPowerControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CyclingPowerFeature: TGuid;
begin
  Result := Statics2.get_CyclingPowerFeature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CyclingPowerMeasurement: TGuid;
begin
  Result := Statics2.get_CyclingPowerMeasurement;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_CyclingPowerVector: TGuid;
begin
  Result := Statics2.get_CyclingPowerVector;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_DateTime: TGuid;
begin
  Result := Statics2.get_DateTime;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_DayDateTime: TGuid;
begin
  Result := Statics2.get_DayDateTime;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_DayOfWeek: TGuid;
begin
  Result := Statics2.get_DayOfWeek;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GapDeviceName: TGuid;
begin
  Result := Statics2.get_GapDeviceName;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_DstOffset: TGuid;
begin
  Result := Statics2.get_DstOffset;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ExactTime256: TGuid;
begin
  Result := Statics2.get_ExactTime256;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_FirmwareRevisionString: TGuid;
begin
  Result := Statics2.get_FirmwareRevisionString;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_HardwareRevisionString: TGuid;
begin
  Result := Statics2.get_HardwareRevisionString;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_HidControlPoint: TGuid;
begin
  Result := Statics2.get_HidControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_HidInformation: TGuid;
begin
  Result := Statics2.get_HidInformation;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_Ieee1107320601RegulatoryCertificationDataList: TGuid;
begin
  Result := Statics2.get_Ieee1107320601RegulatoryCertificationDataList;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_LnControlPoint: TGuid;
begin
  Result := Statics2.get_LnControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_LnFeature: TGuid;
begin
  Result := Statics2.get_LnFeature;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_LocalTimeInformation: TGuid;
begin
  Result := Statics2.get_LocalTimeInformation;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_LocationAndSpeed: TGuid;
begin
  Result := Statics2.get_LocationAndSpeed;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ManufacturerNameString: TGuid;
begin
  Result := Statics2.get_ManufacturerNameString;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ModelNumberString: TGuid;
begin
  Result := Statics2.get_ModelNumberString;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_Navigation: TGuid;
begin
  Result := Statics2.get_Navigation;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_NewAlert: TGuid;
begin
  Result := Statics2.get_NewAlert;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GapPeripheralPreferredConnectionParameters: TGuid;
begin
  Result := Statics2.get_GapPeripheralPreferredConnectionParameters;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GapPeripheralPrivacyFlag: TGuid;
begin
  Result := Statics2.get_GapPeripheralPrivacyFlag;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_PnpId: TGuid;
begin
  Result := Statics2.get_PnpId;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_PositionQuality: TGuid;
begin
  Result := Statics2.get_PositionQuality;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ProtocolMode: TGuid;
begin
  Result := Statics2.get_ProtocolMode;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GapReconnectionAddress: TGuid;
begin
  Result := Statics2.get_GapReconnectionAddress;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ReferenceTimeInformation: TGuid;
begin
  Result := Statics2.get_ReferenceTimeInformation;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_Report: TGuid;
begin
  Result := Statics2.get_Report;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ReportMap: TGuid;
begin
  Result := Statics2.get_ReportMap;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_RingerControlPoint: TGuid;
begin
  Result := Statics2.get_RingerControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_RingerSetting: TGuid;
begin
  Result := Statics2.get_RingerSetting;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ScanIntervalWindow: TGuid;
begin
  Result := Statics2.get_ScanIntervalWindow;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_ScanRefresh: TGuid;
begin
  Result := Statics2.get_ScanRefresh;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SerialNumberString: TGuid;
begin
  Result := Statics2.get_SerialNumberString;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_GattServiceChanged: TGuid;
begin
  Result := Statics2.get_GattServiceChanged;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SoftwareRevisionString: TGuid;
begin
  Result := Statics2.get_SoftwareRevisionString;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SupportedNewAlertCategory: TGuid;
begin
  Result := Statics2.get_SupportedNewAlertCategory;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SupportUnreadAlertCategory: TGuid;
begin
  Result := Statics2.get_SupportUnreadAlertCategory;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_SystemId: TGuid;
begin
  Result := Statics2.get_SystemId;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TimeAccuracy: TGuid;
begin
  Result := Statics2.get_TimeAccuracy;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TimeSource: TGuid;
begin
  Result := Statics2.get_TimeSource;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TimeUpdateControlPoint: TGuid;
begin
  Result := Statics2.get_TimeUpdateControlPoint;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TimeUpdateState: TGuid;
begin
  Result := Statics2.get_TimeUpdateState;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TimeWithDst: TGuid;
begin
  Result := Statics2.get_TimeWithDst;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TimeZone: TGuid;
begin
  Result := Statics2.get_TimeZone;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_TxPowerLevel: TGuid;
begin
  Result := Statics2.get_TxPowerLevel;
end;

class function TGenericAttributeProfile_GattCharacteristicUuids.get_UnreadAlertStatus: TGuid;
begin
  Result := Statics2.get_UnreadAlertStatus;
end;


 { TGenericAttributeProfile_GattDescriptorUuids }

class function TGenericAttributeProfile_GattDescriptorUuids.get_CharacteristicAggregateFormat: TGuid;
begin
  Result := Statics.get_CharacteristicAggregateFormat;
end;

class function TGenericAttributeProfile_GattDescriptorUuids.get_CharacteristicExtendedProperties: TGuid;
begin
  Result := Statics.get_CharacteristicExtendedProperties;
end;

class function TGenericAttributeProfile_GattDescriptorUuids.get_CharacteristicPresentationFormat: TGuid;
begin
  Result := Statics.get_CharacteristicPresentationFormat;
end;

class function TGenericAttributeProfile_GattDescriptorUuids.get_CharacteristicUserDescription: TGuid;
begin
  Result := Statics.get_CharacteristicUserDescription;
end;

class function TGenericAttributeProfile_GattDescriptorUuids.get_ClientCharacteristicConfiguration: TGuid;
begin
  Result := Statics.get_ClientCharacteristicConfiguration;
end;

class function TGenericAttributeProfile_GattDescriptorUuids.get_ServerCharacteristicConfiguration: TGuid;
begin
  Result := Statics.get_ServerCharacteristicConfiguration;
end;


 { TGenericAttributeProfile_GattReliableWriteTransaction }

 { TGenericAttributeProfile_GattServiceProviderAdvertisingParameters }

 { TGenericAttributeProfile_GattLocalCharacteristicParameters }

 { TGenericAttributeProfile_GattLocalDescriptorParameters }

 { TGenericAttributeProfile_GattServiceProvider }

class function TGenericAttributeProfile_GattServiceProvider.CreateAsync(serviceUuid: TGuid): IAsyncOperation_1__GenericAttributeProfile_IGattServiceProviderResult;
begin
  Result := Statics.CreateAsync(serviceUuid);
end;


 { TRfcomm_RfcommServiceProvider }

class function TRfcomm_RfcommServiceProvider.CreateAsync(serviceId: Rfcomm_IRfcommServiceId): IAsyncOperation_1__Rfcomm_IRfcommServiceProvider;
begin
  Result := Statics.CreateAsync(serviceId);
end;


 { TBackground_GattServiceProviderConnection }

class function TBackground_GattServiceProviderConnection.get_AllServices: IMapView_2__HSTRING__Background_IGattServiceProviderConnection;
begin
  Result := Statics.get_AllServices;
end;



end.
