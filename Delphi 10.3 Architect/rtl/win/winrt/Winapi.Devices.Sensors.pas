{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Devices.Sensors;

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
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.ActivityType>
  IIterator_1__ActivityType = interface;
  PIIterator_1__ActivityType = ^IIterator_1__ActivityType;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.ActivityType>
  IIterable_1__ActivityType = interface;
  PIIterable_1__ActivityType = ^IIterable_1__ActivityType;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.ActivityType>
  IVectorView_1__ActivityType = interface;
  PIVectorView_1__ActivityType = ^IVectorView_1__ActivityType;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Sensors.ActivityType>
  IVector_1__ActivityType = interface;
  PIVector_1__ActivityType = ^IVector_1__ActivityType;

  // Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
  ISensorDataThresholdTriggerDetails = interface;
  PISensorDataThresholdTriggerDetails = ^ISensorDataThresholdTriggerDetails;

  // Windows.Devices.Sensors.IAccelerometerDeviceId
  IAccelerometerDeviceId = interface;
  PIAccelerometerDeviceId = ^IAccelerometerDeviceId;

  // Windows.Devices.Sensors.IAccelerometerReading
  IAccelerometerReading = interface;
  PIAccelerometerReading = ^IAccelerometerReading;

  // Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs
  IAccelerometerReadingChangedEventArgs = interface;
  PIAccelerometerReadingChangedEventArgs = ^IAccelerometerReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs>
  TypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs = ^TypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs;

  // Windows.Devices.Sensors.IAccelerometerShakenEventArgs
  IAccelerometerShakenEventArgs = interface;
  PIAccelerometerShakenEventArgs = ^IAccelerometerShakenEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerShakenEventArgs>
  TypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs = interface;
  PTypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs = ^TypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs;

  // Windows.Devices.Sensors.IAccelerometer
  IAccelerometer = interface;
  PIAccelerometer = ^IAccelerometer;

  // Windows.Devices.Sensors.IAccelerometerStatics
  IAccelerometerStatics = interface;
  PIAccelerometerStatics = ^IAccelerometerStatics;

  // Windows.Devices.Sensors.IAccelerometerStatics2
  IAccelerometerStatics2 = interface;
  PIAccelerometerStatics2 = ^IAccelerometerStatics2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IAccelerometer>
  AsyncOperationCompletedHandler_1__IAccelerometer = interface;
  PAsyncOperationCompletedHandler_1__IAccelerometer = ^AsyncOperationCompletedHandler_1__IAccelerometer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IAccelerometer>
  IAsyncOperation_1__IAccelerometer = interface;
  PIAsyncOperation_1__IAccelerometer = ^IAsyncOperation_1__IAccelerometer;

  // Windows.Devices.Sensors.IAccelerometerStatics3
  IAccelerometerStatics3 = interface;
  PIAccelerometerStatics3 = ^IAccelerometerStatics3;

  // Windows.Devices.Sensors.IAccelerometer2
  IAccelerometer2 = interface;
  PIAccelerometer2 = ^IAccelerometer2;

  // Windows.Devices.Sensors.IAccelerometer3
  IAccelerometer3 = interface;
  PIAccelerometer3 = ^IAccelerometer3;

  // Windows.Devices.Sensors.IAccelerometer4
  IAccelerometer4 = interface;
  PIAccelerometer4 = ^IAccelerometer4;

  // Windows.Devices.Sensors.IAccelerometerReading2
  IAccelerometerReading2 = interface;
  PIAccelerometerReading2 = ^IAccelerometerReading2;

  // Windows.Devices.Sensors.IInclinometerDeviceId
  IInclinometerDeviceId = interface;
  PIInclinometerDeviceId = ^IInclinometerDeviceId;

  // Windows.Devices.Sensors.IInclinometerReading
  IInclinometerReading = interface;
  PIInclinometerReading = ^IInclinometerReading;

  // Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs
  IInclinometerReadingChangedEventArgs = interface;
  PIInclinometerReadingChangedEventArgs = ^IInclinometerReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IInclinometer,Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs>
  TypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs = ^TypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs;

  // Windows.Devices.Sensors.IInclinometer
  IInclinometer = interface;
  PIInclinometer = ^IInclinometer;

  // Windows.Devices.Sensors.IInclinometerStatics
  IInclinometerStatics = interface;
  PIInclinometerStatics = ^IInclinometerStatics;

  // Windows.Devices.Sensors.IInclinometerStatics2
  IInclinometerStatics2 = interface;
  PIInclinometerStatics2 = ^IInclinometerStatics2;

  // Windows.Devices.Sensors.IInclinometerStatics3
  IInclinometerStatics3 = interface;
  PIInclinometerStatics3 = ^IInclinometerStatics3;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IInclinometer>
  AsyncOperationCompletedHandler_1__IInclinometer = interface;
  PAsyncOperationCompletedHandler_1__IInclinometer = ^AsyncOperationCompletedHandler_1__IInclinometer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IInclinometer>
  IAsyncOperation_1__IInclinometer = interface;
  PIAsyncOperation_1__IInclinometer = ^IAsyncOperation_1__IInclinometer;

  // Windows.Devices.Sensors.IInclinometerStatics4
  IInclinometerStatics4 = interface;
  PIInclinometerStatics4 = ^IInclinometerStatics4;

  // Windows.Devices.Sensors.IInclinometer2
  IInclinometer2 = interface;
  PIInclinometer2 = ^IInclinometer2;

  // Windows.Devices.Sensors.IInclinometer3
  IInclinometer3 = interface;
  PIInclinometer3 = ^IInclinometer3;

  // Windows.Devices.Sensors.IInclinometerReading2
  IInclinometerReading2 = interface;
  PIInclinometerReading2 = ^IInclinometerReading2;

  // Windows.Devices.Sensors.IInclinometerReadingYawAccuracy
  IInclinometerReadingYawAccuracy = interface;
  PIInclinometerReadingYawAccuracy = ^IInclinometerReadingYawAccuracy;

  // Windows.Devices.Sensors.IGyrometerDeviceId
  IGyrometerDeviceId = interface;
  PIGyrometerDeviceId = ^IGyrometerDeviceId;

  // Windows.Devices.Sensors.IGyrometerReading
  IGyrometerReading = interface;
  PIGyrometerReading = ^IGyrometerReading;

  // Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs
  IGyrometerReadingChangedEventArgs = interface;
  PIGyrometerReadingChangedEventArgs = ^IGyrometerReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IGyrometer,Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs>
  TypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs = ^TypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs;

  // Windows.Devices.Sensors.IGyrometer
  IGyrometer = interface;
  PIGyrometer = ^IGyrometer;

  // Windows.Devices.Sensors.IGyrometerStatics
  IGyrometerStatics = interface;
  PIGyrometerStatics = ^IGyrometerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IGyrometer>
  AsyncOperationCompletedHandler_1__IGyrometer = interface;
  PAsyncOperationCompletedHandler_1__IGyrometer = ^AsyncOperationCompletedHandler_1__IGyrometer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IGyrometer>
  IAsyncOperation_1__IGyrometer = interface;
  PIAsyncOperation_1__IGyrometer = ^IAsyncOperation_1__IGyrometer;

  // Windows.Devices.Sensors.IGyrometerStatics2
  IGyrometerStatics2 = interface;
  PIGyrometerStatics2 = ^IGyrometerStatics2;

  // Windows.Devices.Sensors.IGyrometer2
  IGyrometer2 = interface;
  PIGyrometer2 = ^IGyrometer2;

  // Windows.Devices.Sensors.IGyrometer3
  IGyrometer3 = interface;
  PIGyrometer3 = ^IGyrometer3;

  // Windows.Devices.Sensors.IGyrometerReading2
  IGyrometerReading2 = interface;
  PIGyrometerReading2 = ^IGyrometerReading2;

  // Windows.Devices.Sensors.ICompassDeviceId
  ICompassDeviceId = interface;
  PICompassDeviceId = ^ICompassDeviceId;

  // Windows.Devices.Sensors.ICompassReading
  ICompassReading = interface;
  PICompassReading = ^ICompassReading;

  // Windows.Devices.Sensors.ICompassReadingChangedEventArgs
  ICompassReadingChangedEventArgs = interface;
  PICompassReadingChangedEventArgs = ^ICompassReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ICompass,Windows.Devices.Sensors.ICompassReadingChangedEventArgs>
  TypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs = interface;
  PTypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs = ^TypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs;

  // Windows.Devices.Sensors.ICompass
  ICompass = interface;
  PICompass = ^ICompass;

  // Windows.Devices.Sensors.ICompassStatics
  ICompassStatics = interface;
  PICompassStatics = ^ICompassStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ICompass>
  AsyncOperationCompletedHandler_1__ICompass = interface;
  PAsyncOperationCompletedHandler_1__ICompass = ^AsyncOperationCompletedHandler_1__ICompass;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ICompass>
  IAsyncOperation_1__ICompass = interface;
  PIAsyncOperation_1__ICompass = ^IAsyncOperation_1__ICompass;

  // Windows.Devices.Sensors.ICompassStatics2
  ICompassStatics2 = interface;
  PICompassStatics2 = ^ICompassStatics2;

  // Windows.Devices.Sensors.ICompass2
  ICompass2 = interface;
  PICompass2 = ^ICompass2;

  // Windows.Devices.Sensors.ICompass3
  ICompass3 = interface;
  PICompass3 = ^ICompass3;

  // Windows.Devices.Sensors.ICompassReading2
  ICompassReading2 = interface;
  PICompassReading2 = ^ICompassReading2;

  // Windows.Devices.Sensors.ICompassReadingHeadingAccuracy
  ICompassReadingHeadingAccuracy = interface;
  PICompassReadingHeadingAccuracy = ^ICompassReadingHeadingAccuracy;

  // Windows.Devices.Sensors.ILightSensorDeviceId
  ILightSensorDeviceId = interface;
  PILightSensorDeviceId = ^ILightSensorDeviceId;

  // Windows.Devices.Sensors.ILightSensorReading
  ILightSensorReading = interface;
  PILightSensorReading = ^ILightSensorReading;

  // Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs
  ILightSensorReadingChangedEventArgs = interface;
  PILightSensorReadingChangedEventArgs = ^ILightSensorReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ILightSensor,Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs>
  TypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs = interface;
  PTypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs = ^TypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs;

  // Windows.Devices.Sensors.ILightSensor
  ILightSensor = interface;
  PILightSensor = ^ILightSensor;

  // Windows.Devices.Sensors.ILightSensorStatics
  ILightSensorStatics = interface;
  PILightSensorStatics = ^ILightSensorStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ILightSensor>
  AsyncOperationCompletedHandler_1__ILightSensor = interface;
  PAsyncOperationCompletedHandler_1__ILightSensor = ^AsyncOperationCompletedHandler_1__ILightSensor;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ILightSensor>
  IAsyncOperation_1__ILightSensor = interface;
  PIAsyncOperation_1__ILightSensor = ^IAsyncOperation_1__ILightSensor;

  // Windows.Devices.Sensors.ILightSensorStatics2
  ILightSensorStatics2 = interface;
  PILightSensorStatics2 = ^ILightSensorStatics2;

  // Windows.Devices.Sensors.ILightSensor2
  ILightSensor2 = interface;
  PILightSensor2 = ^ILightSensor2;

  // Windows.Devices.Sensors.ILightSensorReading2
  ILightSensorReading2 = interface;
  PILightSensorReading2 = ^ILightSensorReading2;

  // Windows.Devices.Sensors.ISensorRotationMatrix
  ISensorRotationMatrix = interface;
  PISensorRotationMatrix = ^ISensorRotationMatrix;

  // Windows.Devices.Sensors.ISensorQuaternion
  ISensorQuaternion = interface;
  PISensorQuaternion = ^ISensorQuaternion;

  // Windows.Devices.Sensors.IOrientationSensorDeviceId
  IOrientationSensorDeviceId = interface;
  PIOrientationSensorDeviceId = ^IOrientationSensorDeviceId;

  // Windows.Devices.Sensors.IOrientationSensorReading
  IOrientationSensorReading = interface;
  PIOrientationSensorReading = ^IOrientationSensorReading;

  // Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs
  IOrientationSensorReadingChangedEventArgs = interface;
  PIOrientationSensorReadingChangedEventArgs = ^IOrientationSensorReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IOrientationSensor,Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs>
  TypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs = ^TypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs;

  // Windows.Devices.Sensors.IOrientationSensor
  IOrientationSensor = interface;
  PIOrientationSensor = ^IOrientationSensor;

  // Windows.Devices.Sensors.IOrientationSensorStatics
  IOrientationSensorStatics = interface;
  PIOrientationSensorStatics = ^IOrientationSensorStatics;

  // Windows.Devices.Sensors.IOrientationSensorStatics2
  IOrientationSensorStatics2 = interface;
  PIOrientationSensorStatics2 = ^IOrientationSensorStatics2;

  // Windows.Devices.Sensors.IOrientationSensorStatics3
  IOrientationSensorStatics3 = interface;
  PIOrientationSensorStatics3 = ^IOrientationSensorStatics3;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IOrientationSensor>
  AsyncOperationCompletedHandler_1__IOrientationSensor = interface;
  PAsyncOperationCompletedHandler_1__IOrientationSensor = ^AsyncOperationCompletedHandler_1__IOrientationSensor;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IOrientationSensor>
  IAsyncOperation_1__IOrientationSensor = interface;
  PIAsyncOperation_1__IOrientationSensor = ^IAsyncOperation_1__IOrientationSensor;

  // Windows.Devices.Sensors.IOrientationSensorStatics4
  IOrientationSensorStatics4 = interface;
  PIOrientationSensorStatics4 = ^IOrientationSensorStatics4;

  // Windows.Devices.Sensors.IOrientationSensor2
  IOrientationSensor2 = interface;
  PIOrientationSensor2 = ^IOrientationSensor2;

  // Windows.Devices.Sensors.IOrientationSensor3
  IOrientationSensor3 = interface;
  PIOrientationSensor3 = ^IOrientationSensor3;

  // Windows.Devices.Sensors.IOrientationSensorReading2
  IOrientationSensorReading2 = interface;
  PIOrientationSensorReading2 = ^IOrientationSensorReading2;

  // Windows.Devices.Sensors.IOrientationSensorReadingYawAccuracy
  IOrientationSensorReadingYawAccuracy = interface;
  PIOrientationSensorReadingYawAccuracy = ^IOrientationSensorReadingYawAccuracy;

  // Windows.Devices.Sensors.ISimpleOrientationSensorDeviceId
  ISimpleOrientationSensorDeviceId = interface;
  PISimpleOrientationSensorDeviceId = ^ISimpleOrientationSensorDeviceId;

  // Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs
  ISimpleOrientationSensorOrientationChangedEventArgs = interface;
  PISimpleOrientationSensorOrientationChangedEventArgs = ^ISimpleOrientationSensorOrientationChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ISimpleOrientationSensor,Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs>
  TypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs = interface;
  PTypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs = ^TypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs;

  // Windows.Devices.Sensors.ISimpleOrientationSensor
  ISimpleOrientationSensor = interface;
  PISimpleOrientationSensor = ^ISimpleOrientationSensor;

  // Windows.Devices.Sensors.ISimpleOrientationSensorStatics
  ISimpleOrientationSensorStatics = interface;
  PISimpleOrientationSensorStatics = ^ISimpleOrientationSensorStatics;

  // Windows.Devices.Sensors.ISimpleOrientationSensor2
  ISimpleOrientationSensor2 = interface;
  PISimpleOrientationSensor2 = ^ISimpleOrientationSensor2;

  // Windows.Devices.Sensors.IMagnetometerDeviceId
  IMagnetometerDeviceId = interface;
  PIMagnetometerDeviceId = ^IMagnetometerDeviceId;

  // Windows.Devices.Sensors.IMagnetometerReading
  IMagnetometerReading = interface;
  PIMagnetometerReading = ^IMagnetometerReading;

  // Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs
  IMagnetometerReadingChangedEventArgs = interface;
  PIMagnetometerReadingChangedEventArgs = ^IMagnetometerReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IMagnetometer,Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs>
  TypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs = ^TypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs;

  // Windows.Devices.Sensors.IMagnetometer
  IMagnetometer = interface;
  PIMagnetometer = ^IMagnetometer;

  // Windows.Devices.Sensors.IMagnetometerStatics
  IMagnetometerStatics = interface;
  PIMagnetometerStatics = ^IMagnetometerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IMagnetometer>
  AsyncOperationCompletedHandler_1__IMagnetometer = interface;
  PAsyncOperationCompletedHandler_1__IMagnetometer = ^AsyncOperationCompletedHandler_1__IMagnetometer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IMagnetometer>
  IAsyncOperation_1__IMagnetometer = interface;
  PIAsyncOperation_1__IMagnetometer = ^IAsyncOperation_1__IMagnetometer;

  // Windows.Devices.Sensors.IMagnetometerStatics2
  IMagnetometerStatics2 = interface;
  PIMagnetometerStatics2 = ^IMagnetometerStatics2;

  // Windows.Devices.Sensors.IMagnetometer2
  IMagnetometer2 = interface;
  PIMagnetometer2 = ^IMagnetometer2;

  // Windows.Devices.Sensors.IMagnetometer3
  IMagnetometer3 = interface;
  PIMagnetometer3 = ^IMagnetometer3;

  // Windows.Devices.Sensors.IMagnetometerReading2
  IMagnetometerReading2 = interface;
  PIMagnetometerReading2 = ^IMagnetometerReading2;

  // Windows.Devices.Sensors.IActivitySensorReading
  IActivitySensorReading = interface;
  PIActivitySensorReading = ^IActivitySensorReading;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensorReading>
  AsyncOperationCompletedHandler_1__IActivitySensorReading = interface;
  PAsyncOperationCompletedHandler_1__IActivitySensorReading = ^AsyncOperationCompletedHandler_1__IActivitySensorReading;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensorReading>
  IAsyncOperation_1__IActivitySensorReading = interface;
  PIAsyncOperation_1__IActivitySensorReading = ^IAsyncOperation_1__IActivitySensorReading;

  // Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs
  IActivitySensorReadingChangedEventArgs = interface;
  PIActivitySensorReadingChangedEventArgs = ^IActivitySensorReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IActivitySensor,Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs>
  TypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs = ^TypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs;

  // Windows.Devices.Sensors.IActivitySensor
  IActivitySensor = interface;
  PIActivitySensor = ^IActivitySensor;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensor>
  AsyncOperationCompletedHandler_1__IActivitySensor = interface;
  PAsyncOperationCompletedHandler_1__IActivitySensor = ^AsyncOperationCompletedHandler_1__IActivitySensor;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensor>
  IAsyncOperation_1__IActivitySensor = interface;
  PIAsyncOperation_1__IActivitySensor = ^IAsyncOperation_1__IActivitySensor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReading>
  IIterator_1__IActivitySensorReading = interface;
  PIIterator_1__IActivitySensorReading = ^IIterator_1__IActivitySensorReading;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IActivitySensorReading>
  IIterable_1__IActivitySensorReading = interface;
  PIIterable_1__IActivitySensorReading = ^IIterable_1__IActivitySensorReading;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>
  IVectorView_1__IActivitySensorReading = interface;
  PIVectorView_1__IActivitySensorReading = ^IVectorView_1__IActivitySensorReading;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading = ^AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  IAsyncOperation_1__IVectorView_1__IActivitySensorReading = interface;
  PIAsyncOperation_1__IVectorView_1__IActivitySensorReading = ^IAsyncOperation_1__IVectorView_1__IActivitySensorReading;

  // Windows.Devices.Sensors.IActivitySensorStatics
  IActivitySensorStatics = interface;
  PIActivitySensorStatics = ^IActivitySensorStatics;

  // Windows.Devices.Sensors.IActivitySensorReadingChangeReport
  IActivitySensorReadingChangeReport = interface;
  PIActivitySensorReadingChangeReport = ^IActivitySensorReadingChangeReport;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IIterator_1__IActivitySensorReadingChangeReport = interface;
  PIIterator_1__IActivitySensorReadingChangeReport = ^IIterator_1__IActivitySensorReadingChangeReport;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IIterable_1__IActivitySensorReadingChangeReport = interface;
  PIIterable_1__IActivitySensorReadingChangeReport = ^IIterable_1__IActivitySensorReadingChangeReport;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IVectorView_1__IActivitySensorReadingChangeReport = interface;
  PIVectorView_1__IActivitySensorReadingChangeReport = ^IVectorView_1__IActivitySensorReadingChangeReport;

  // Windows.Devices.Sensors.IBarometerReading
  IBarometerReading = interface;
  PIBarometerReading = ^IBarometerReading;

  // Windows.Devices.Sensors.IBarometerReadingChangedEventArgs
  IBarometerReadingChangedEventArgs = interface;
  PIBarometerReadingChangedEventArgs = ^IBarometerReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IBarometer,Windows.Devices.Sensors.IBarometerReadingChangedEventArgs>
  TypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs = ^TypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs;

  // Windows.Devices.Sensors.IBarometer
  IBarometer = interface;
  PIBarometer = ^IBarometer;

  // Windows.Devices.Sensors.IBarometerStatics
  IBarometerStatics = interface;
  PIBarometerStatics = ^IBarometerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IBarometer>
  AsyncOperationCompletedHandler_1__IBarometer = interface;
  PAsyncOperationCompletedHandler_1__IBarometer = ^AsyncOperationCompletedHandler_1__IBarometer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IBarometer>
  IAsyncOperation_1__IBarometer = interface;
  PIAsyncOperation_1__IBarometer = ^IAsyncOperation_1__IBarometer;

  // Windows.Devices.Sensors.IBarometerStatics2
  IBarometerStatics2 = interface;
  PIBarometerStatics2 = ^IBarometerStatics2;

  // Windows.Devices.Sensors.IBarometer2
  IBarometer2 = interface;
  PIBarometer2 = ^IBarometer2;

  // Windows.Devices.Sensors.IBarometerReading2
  IBarometerReading2 = interface;
  PIBarometerReading2 = ^IBarometerReading2;

  // Windows.Devices.Sensors.IPedometerReading
  IPedometerReading = interface;
  PIPedometerReading = ^IPedometerReading;

  // Windows.Devices.Sensors.IPedometerReadingChangedEventArgs
  IPedometerReadingChangedEventArgs = interface;
  PIPedometerReadingChangedEventArgs = ^IPedometerReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IPedometer,Windows.Devices.Sensors.IPedometerReadingChangedEventArgs>
  TypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs = ^TypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs;

  // Windows.Devices.Sensors.IPedometer
  IPedometer = interface;
  PIPedometer = ^IPedometer;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IPedometer>
  AsyncOperationCompletedHandler_1__IPedometer = interface;
  PAsyncOperationCompletedHandler_1__IPedometer = ^AsyncOperationCompletedHandler_1__IPedometer;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IPedometer>
  IAsyncOperation_1__IPedometer = interface;
  PIAsyncOperation_1__IPedometer = ^IAsyncOperation_1__IPedometer;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IPedometerReading>
  IIterator_1__IPedometerReading = interface;
  PIIterator_1__IPedometerReading = ^IIterator_1__IPedometerReading;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IPedometerReading>
  IIterable_1__IPedometerReading = interface;
  PIIterable_1__IPedometerReading = ^IIterable_1__IPedometerReading;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>
  IVectorView_1__IPedometerReading = interface;
  PIVectorView_1__IPedometerReading = ^IVectorView_1__IPedometerReading;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading = ^AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  IAsyncOperation_1__IVectorView_1__IPedometerReading = interface;
  PIAsyncOperation_1__IVectorView_1__IPedometerReading = ^IAsyncOperation_1__IVectorView_1__IPedometerReading;

  // Windows.Devices.Sensors.IPedometerStatics
  IPedometerStatics = interface;
  PIPedometerStatics = ^IPedometerStatics;

  // Windows.Devices.Sensors.IPedometerStatics2
  IPedometerStatics2 = interface;
  PIPedometerStatics2 = ^IPedometerStatics2;

  // Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  IKeyValuePair_2__PedometerStepKind__IPedometerReading = interface;
  PIKeyValuePair_2__PedometerStepKind__IPedometerReading = ^IKeyValuePair_2__PedometerStepKind__IPedometerReading;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  IIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading = interface;
  PIIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading = ^IIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  IIterable_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading = interface;
  PIIterable_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading = ^IIterable_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading;

  // Windows.Foundation.Collections.IMapView`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  IMapView_2__PedometerStepKind__IPedometerReading = interface;
  PIMapView_2__PedometerStepKind__IPedometerReading = ^IMapView_2__PedometerStepKind__IPedometerReading;

  // Windows.Devices.Sensors.IPedometer2
  IPedometer2 = interface;
  PIPedometer2 = ^IPedometer2;

  // Windows.Devices.Sensors.IProximitySensorReading
  IProximitySensorReading = interface;
  PIProximitySensorReading = ^IProximitySensorReading;

  // Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs
  IProximitySensorReadingChangedEventArgs = interface;
  PIProximitySensorReadingChangedEventArgs = ^IProximitySensorReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IProximitySensor,Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs>
  TypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs = ^TypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs;

  // Windows.Devices.Sensors.IProximitySensor
  IProximitySensor = interface;
  PIProximitySensor = ^IProximitySensor;

  // Windows.Devices.Sensors.IProximitySensorStatics
  IProximitySensorStatics = interface;
  PIProximitySensorStatics = ^IProximitySensorStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IProximitySensorReading>
  IIterator_1__IProximitySensorReading = interface;
  PIIterator_1__IProximitySensorReading = ^IIterator_1__IProximitySensorReading;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IProximitySensorReading>
  IIterable_1__IProximitySensorReading = interface;
  PIIterable_1__IProximitySensorReading = ^IIterable_1__IProximitySensorReading;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IProximitySensorReading>
  IVectorView_1__IProximitySensorReading = interface;
  PIVectorView_1__IProximitySensorReading = ^IVectorView_1__IProximitySensorReading;

  // Windows.Devices.Sensors.IProximitySensorStatics2
  IProximitySensorStatics2 = interface;
  PIProximitySensorStatics2 = ^IProximitySensorStatics2;

  // Windows.Devices.Sensors.IAltimeterReading
  IAltimeterReading = interface;
  PIAltimeterReading = ^IAltimeterReading;

  // Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs
  IAltimeterReadingChangedEventArgs = interface;
  PIAltimeterReadingChangedEventArgs = ^IAltimeterReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAltimeter,Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs>
  TypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs = interface;
  PTypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs = ^TypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs;

  // Windows.Devices.Sensors.IAltimeter
  IAltimeter = interface;
  PIAltimeter = ^IAltimeter;

  // Windows.Devices.Sensors.IAltimeterStatics
  IAltimeterStatics = interface;
  PIAltimeterStatics = ^IAltimeterStatics;

  // Windows.Devices.Sensors.IAltimeter2
  IAltimeter2 = interface;
  PIAltimeter2 = ^IAltimeter2;

  // Windows.Devices.Sensors.IAltimeterReading2
  IAltimeterReading2 = interface;
  PIAltimeterReading2 = ^IAltimeterReading2;

  // Windows.Devices.Sensors.Custom.ICustomSensorReading
  Custom_ICustomSensorReading = interface;
  PCustom_ICustomSensorReading = ^Custom_ICustomSensorReading;

  // Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs
  Custom_ICustomSensorReadingChangedEventArgs = interface;
  PCustom_ICustomSensorReadingChangedEventArgs = ^Custom_ICustomSensorReadingChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.Custom.ICustomSensor,Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs>
  TypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs = interface;
  PTypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs = ^TypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs;

  // Windows.Devices.Sensors.Custom.ICustomSensor
  Custom_ICustomSensor = interface;
  PCustom_ICustomSensor = ^Custom_ICustomSensor;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  AsyncOperationCompletedHandler_1__Custom_ICustomSensor = interface;
  PAsyncOperationCompletedHandler_1__Custom_ICustomSensor = ^AsyncOperationCompletedHandler_1__Custom_ICustomSensor;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  IAsyncOperation_1__Custom_ICustomSensor = interface;
  PIAsyncOperation_1__Custom_ICustomSensor = ^IAsyncOperation_1__Custom_ICustomSensor;

  // Windows.Devices.Sensors.Custom.ICustomSensorStatics
  Custom_ICustomSensorStatics = interface;
  PCustom_ICustomSensorStatics = ^Custom_ICustomSensorStatics;

  // Windows.Devices.Sensors.Custom.ICustomSensor2
  Custom_ICustomSensor2 = interface;
  PCustom_ICustomSensor2 = ^Custom_ICustomSensor2;

  // Windows.Devices.Sensors.Custom.ICustomSensorReading2
  Custom_ICustomSensorReading2 = interface;
  PCustom_ICustomSensorReading2 = ^Custom_ICustomSensorReading2;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Devices.Sensors Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.ActivityType>
  IIterator_1__ActivityType_Base = interface(IInspectable)
  ['{40524281-A7C6-50B1-B6F5-0BAA95D902C2}']
  end;
  {
  // Used Types:  Windows.Devices.Sensors.ActivityType
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.ActivityType>
  IIterator_1__ActivityType = interface(IIterator_1__ActivityType_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: ActivityType; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PActivityType): Cardinal; safecall;
    property Current: ActivityType read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.ActivityType>
  IIterable_1__ActivityType_Base = interface(IInspectable)
  ['{2A04CDFA-5DFD-5178-8731-ADE998E4A7F6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.ActivityType>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.ActivityType>
  IIterable_1__ActivityType = interface(IIterable_1__ActivityType_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__ActivityType; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ActivityType
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.ActivityType>
  IVectorView_1__ActivityType = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): ActivityType; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: ActivityType; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PActivityType): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ActivityType
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.ActivityType>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Sensors.ActivityType>
  IVector_1__ActivityType = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): ActivityType; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__ActivityType; safecall;
    function IndexOf(value: ActivityType; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: ActivityType); safecall;
    procedure InsertAt(index: Cardinal; value: ActivityType); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: ActivityType); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PActivityType): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PActivityType); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Sensors.SensorType
  }
  // Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
  ISensorDataThresholdTriggerDetails = interface(IInspectable)
  ['{9106F1B7-E88D-48B1-BC90-619C7B349391}']
    function get_DeviceId: HSTRING; safecall;
    function get_SensorType: SensorType; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property SensorType: SensorType read get_SensorType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.IAccelerometerDeviceId
  IAccelerometerDeviceId = interface(IInspectable)
  ['{7EAC64A9-97D5-446D-AB5A-917DF9B96A2C}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Double
  }
  // Windows.Devices.Sensors.IAccelerometerReading
  [WinRTClassNameAttribute(SAccelerometerReading)]
  IAccelerometerReading = interface(IInspectable)
  ['{B9FE7ACB-D351-40AF-8BB6-7AA9AE641FB7}']
    function get_Timestamp: DateTime; safecall;
    function get_AccelerationX: Double; safecall;
    function get_AccelerationY: Double; safecall;
    function get_AccelerationZ: Double; safecall;
    property AccelerationX: Double read get_AccelerationX;
    property AccelerationY: Double read get_AccelerationY;
    property AccelerationZ: Double read get_AccelerationZ;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAccelerometerReading
  }
  // Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs
  [WinRTClassNameAttribute(SAccelerometerReadingChangedEventArgs)]
  IAccelerometerReadingChangedEventArgs = interface(IInspectable)
  ['{0095C65B-B6AC-475A-9F44-8B32D35A3F25}']
    function get_Reading: IAccelerometerReading; safecall;
    property Reading: IAccelerometerReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs>
  TypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A5E83E40-B597-5B83-92F5-5BED3926CA80}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAccelerometer
  // Used Types:  Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs>
  TypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs = interface(TypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs_Delegate_Base)
  ['{9D20AAA1-647B-56D4-B668-0B6002475AB4}']
    procedure Invoke(sender: IAccelerometer; args: IAccelerometerReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Devices.Sensors.IAccelerometerShakenEventArgs
  [WinRTClassNameAttribute(SAccelerometerShakenEventArgs)]
  IAccelerometerShakenEventArgs = interface(IInspectable)
  ['{95FF01D1-4A28-4F35-98E8-8178AAE4084A}']
    function get_Timestamp: DateTime; safecall;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerShakenEventArgs>
  TypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs_Delegate_Base = interface(IUnknown)
  ['{3E5D6EAF-F169-5D60-92B0-98CD6BD8F808}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAccelerometer
  // Used Types:  Windows.Devices.Sensors.IAccelerometerShakenEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerShakenEventArgs>
  TypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs = interface(TypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs_Delegate_Base)
  ['{ED8C9EE8-1DB6-55E3-BE0B-25B5B8476431}']
    procedure Invoke(sender: IAccelerometer; args: IAccelerometerShakenEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAccelerometerReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAccelerometer,Windows.Devices.Sensors.IAccelerometerShakenEventArgs>
  }
  // Windows.Devices.Sensors.IAccelerometer
  [WinRTClassNameAttribute(SAccelerometer)]
  IAccelerometer = interface(IInspectable)
  ['{DF184548-2711-4DA7-8098-4B82205D3C7D}']
    function GetCurrentReading: IAccelerometerReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IAccelerometer__IAccelerometerReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    function add_Shaken(handler: TypedEventHandler_2__IAccelerometer__IAccelerometerShakenEventArgs): EventRegistrationToken; safecall;
    procedure remove_Shaken(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAccelerometer
  }
  // Windows.Devices.Sensors.IAccelerometerStatics
  [WinRTClassNameAttribute(SAccelerometer)]
  IAccelerometerStatics = interface(IInspectable)
  ['{A5E28B74-5A87-4A2D-BECC-0F906EA061DD}']
    function GetDefault: IAccelerometer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAccelerometer
  // Used Types:  Windows.Devices.Sensors.AccelerometerReadingType
  }
  // Windows.Devices.Sensors.IAccelerometerStatics2
  [WinRTClassNameAttribute(SAccelerometer)]
  IAccelerometerStatics2 = interface(IInspectable)
  ['{C4C4842F-D86B-4685-B2D7-3396F798D57B}']
    function GetDefault(readingType: AccelerometerReadingType): IAccelerometer; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IAccelerometer>
  AsyncOperationCompletedHandler_1__IAccelerometer_Delegate_Base = interface(IUnknown)
  ['{C7C339B6-7527-502A-8A4C-CB9BEFE15840}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IAccelerometer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IAccelerometer>
  AsyncOperationCompletedHandler_1__IAccelerometer = interface(AsyncOperationCompletedHandler_1__IAccelerometer_Delegate_Base)
  ['{0C3C472A-5E99-5317-BF40-F155BA996602}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IAccelerometer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IAccelerometer>
  IAsyncOperation_1__IAccelerometer_Base = interface(IInspectable)
  ['{FC761D3B-5E4D-5148-A618-7B677059D0B8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IAccelerometer>
  // Used Types:  Windows.Devices.Sensors.IAccelerometer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IAccelerometer>
  IAsyncOperation_1__IAccelerometer = interface(IAsyncOperation_1__IAccelerometer_Base)
  ['{DCBCC462-5310-5B74-B9E4-FDE908F7BD54}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IAccelerometer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IAccelerometer; safecall;
    function GetResults: IAccelerometer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IAccelerometer read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IAccelerometer>
  // Used Types:  String
  // Used Types:  Windows.Devices.Sensors.AccelerometerReadingType
  }
  // Windows.Devices.Sensors.IAccelerometerStatics3
  [WinRTClassNameAttribute(SAccelerometer)]
  IAccelerometerStatics3 = interface(IInspectable)
  ['{9DE218CF-455D-4CF3-8200-70E1410340F8}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IAccelerometer; safecall;
    function GetDeviceSelector(readingType: AccelerometerReadingType): HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  }
  // Windows.Devices.Sensors.IAccelerometer2
  IAccelerometer2 = interface(IInspectable)
  ['{E8F092EE-4964-401A-B602-220D7153C60A}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IAccelerometer3
  IAccelerometer3 = interface(IInspectable)
  ['{87E0022A-ED80-49EB-BF8A-A4EA31E5CD84}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.AccelerometerReadingType
  }
  // Windows.Devices.Sensors.IAccelerometer4
  IAccelerometer4 = interface(IInspectable)
  ['{1D373C4F-42D3-45B2-8144-AB7FB665EB59}']
    function get_ReadingType: AccelerometerReadingType; safecall;
    property ReadingType: AccelerometerReadingType read get_ReadingType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IAccelerometerReading2
  IAccelerometerReading2 = interface(IInspectable)
  ['{0A864AA2-15AE-4A40-BE55-DB58D7DE7389}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.IInclinometerDeviceId
  IInclinometerDeviceId = interface(IInspectable)
  ['{01E91982-41FF-4406-AE83-62210FF16FE3}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Single
  }
  // Windows.Devices.Sensors.IInclinometerReading
  [WinRTClassNameAttribute(SInclinometerReading)]
  IInclinometerReading = interface(IInspectable)
  ['{9F44F055-B6F6-497F-B127-1A775E501458}']
    function get_Timestamp: DateTime; safecall;
    function get_PitchDegrees: Single; safecall;
    function get_RollDegrees: Single; safecall;
    function get_YawDegrees: Single; safecall;
    property PitchDegrees: Single read get_PitchDegrees;
    property RollDegrees: Single read get_RollDegrees;
    property Timestamp: DateTime read get_Timestamp;
    property YawDegrees: Single read get_YawDegrees;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IInclinometerReading
  }
  // Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs
  [WinRTClassNameAttribute(SInclinometerReadingChangedEventArgs)]
  IInclinometerReadingChangedEventArgs = interface(IInspectable)
  ['{4AE91DC1-E7EB-4938-8511-AE0D6B440438}']
    function get_Reading: IInclinometerReading; safecall;
    property Reading: IInclinometerReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IInclinometer,Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs>
  TypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{6F3B411F-D147-59F1-BBE4-7BEC396C7B6E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IInclinometer
  // Used Types:  Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IInclinometer,Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs>
  TypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs = interface(TypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs_Delegate_Base)
  ['{6A75A7D0-5CCB-5331-9437-3D202A95EC6D}']
    procedure Invoke(sender: IInclinometer; args: IInclinometerReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IInclinometerReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IInclinometer,Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IInclinometer
  [WinRTClassNameAttribute(SInclinometer)]
  IInclinometer = interface(IInspectable)
  ['{2648CA6F-2286-406F-9161-F0C4BD806EBF}']
    function GetCurrentReading: IInclinometerReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IInclinometer__IInclinometerReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IInclinometer
  }
  // Windows.Devices.Sensors.IInclinometerStatics
  [WinRTClassNameAttribute(SInclinometer)]
  IInclinometerStatics = interface(IInspectable)
  ['{F22EC551-9C30-453A-8B49-3C3EEB33CB61}']
    function GetDefault: IInclinometer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IInclinometer
  }
  // Windows.Devices.Sensors.IInclinometerStatics2
  [WinRTClassNameAttribute(SInclinometer)]
  IInclinometerStatics2 = interface(IInspectable)
  ['{043F9775-6A1E-499C-86E0-638C1A864B00}']
    function GetDefaultForRelativeReadings: IInclinometer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IInclinometer
  // Used Types:  Windows.Devices.Sensors.SensorReadingType
  }
  // Windows.Devices.Sensors.IInclinometerStatics3
  [WinRTClassNameAttribute(SInclinometer)]
  IInclinometerStatics3 = interface(IInspectable)
  ['{BD9A4280-B91A-4829-9392-ABC0B6BDF2B4}']
    function GetDefault(sensorReadingtype: SensorReadingType): IInclinometer; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IInclinometer>
  AsyncOperationCompletedHandler_1__IInclinometer_Delegate_Base = interface(IUnknown)
  ['{8F0EDE2A-2D0F-55F6-9566-3C21385FAE64}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IInclinometer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IInclinometer>
  AsyncOperationCompletedHandler_1__IInclinometer = interface(AsyncOperationCompletedHandler_1__IInclinometer_Delegate_Base)
  ['{8D258CE8-C204-5657-AB82-D0574D5FF386}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IInclinometer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IInclinometer>
  IAsyncOperation_1__IInclinometer_Base = interface(IInspectable)
  ['{84EBB496-B69A-53CD-B690-A46189822B01}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IInclinometer>
  // Used Types:  Windows.Devices.Sensors.IInclinometer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IInclinometer>
  IAsyncOperation_1__IInclinometer = interface(IAsyncOperation_1__IInclinometer_Base)
  ['{8DFFE885-CBAA-5369-94AA-60F4441EB622}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IInclinometer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IInclinometer; safecall;
    function GetResults: IInclinometer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IInclinometer read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Sensors.SensorReadingType
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IInclinometer>
  }
  // Windows.Devices.Sensors.IInclinometerStatics4
  [WinRTClassNameAttribute(SInclinometer)]
  IInclinometerStatics4 = interface(IInspectable)
  ['{E8BA96F9-6E85-4A83-AED0-D7CDCC9856C8}']
    function GetDeviceSelector(readingType: SensorReadingType): HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IInclinometer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  // Used Types:  Windows.Devices.Sensors.SensorReadingType
  }
  // Windows.Devices.Sensors.IInclinometer2
  IInclinometer2 = interface(IInspectable)
  ['{029F3393-28B2-45F8-BB16-61E86A7FAE6E}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    function get_ReadingType: SensorReadingType; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
    property ReadingType: SensorReadingType read get_ReadingType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IInclinometer3
  IInclinometer3 = interface(IInspectable)
  ['{3A095004-D765-4384-A3D7-0283F3ABE6AE}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IInclinometerReading2
  IInclinometerReading2 = interface(IInspectable)
  ['{4F164781-E90B-4658-8915-0103E08A805A}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.MagnetometerAccuracy
  }
  // Windows.Devices.Sensors.IInclinometerReadingYawAccuracy
  IInclinometerReadingYawAccuracy = interface(IInspectable)
  ['{B453E880-1FE3-4986-A257-E6ECE2723949}']
    function get_YawAccuracy: MagnetometerAccuracy; safecall;
    property YawAccuracy: MagnetometerAccuracy read get_YawAccuracy;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.IGyrometerDeviceId
  IGyrometerDeviceId = interface(IInspectable)
  ['{1EE5E978-89A2-4275-9E95-7126F4708760}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Double
  }
  // Windows.Devices.Sensors.IGyrometerReading
  [WinRTClassNameAttribute(SGyrometerReading)]
  IGyrometerReading = interface(IInspectable)
  ['{B3D6DE5C-1EE4-456F-9DE7-E2493B5C8E03}']
    function get_Timestamp: DateTime; safecall;
    function get_AngularVelocityX: Double; safecall;
    function get_AngularVelocityY: Double; safecall;
    function get_AngularVelocityZ: Double; safecall;
    property AngularVelocityX: Double read get_AngularVelocityX;
    property AngularVelocityY: Double read get_AngularVelocityY;
    property AngularVelocityZ: Double read get_AngularVelocityZ;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IGyrometerReading
  }
  // Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs
  [WinRTClassNameAttribute(SGyrometerReadingChangedEventArgs)]
  IGyrometerReadingChangedEventArgs = interface(IInspectable)
  ['{0FDF1895-6F9E-42CE-8D58-388C0AB8356D}']
    function get_Reading: IGyrometerReading; safecall;
    property Reading: IGyrometerReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IGyrometer,Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs>
  TypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{15171524-5786-59A5-AF5B-A01245726C44}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IGyrometer
  // Used Types:  Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IGyrometer,Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs>
  TypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs = interface(TypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs_Delegate_Base)
  ['{2AA7CF2F-D411-5180-B557-8B5DFE728B7B}']
    procedure Invoke(sender: IGyrometer; args: IGyrometerReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IGyrometerReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IGyrometer,Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IGyrometer
  [WinRTClassNameAttribute(SGyrometer)]
  IGyrometer = interface(IInspectable)
  ['{FDB9A9C4-84B1-4CA2-9763-9B589506C70C}']
    function GetCurrentReading: IGyrometerReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IGyrometer__IGyrometerReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IGyrometer
  }
  // Windows.Devices.Sensors.IGyrometerStatics
  [WinRTClassNameAttribute(SGyrometer)]
  IGyrometerStatics = interface(IInspectable)
  ['{83B6E7C9-E49D-4B39-86E6-CD554BE4C5C1}']
    function GetDefault: IGyrometer; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IGyrometer>
  AsyncOperationCompletedHandler_1__IGyrometer_Delegate_Base = interface(IUnknown)
  ['{15799501-958E-5315-A24A-0D7D7ACBC79C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IGyrometer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IGyrometer>
  AsyncOperationCompletedHandler_1__IGyrometer = interface(AsyncOperationCompletedHandler_1__IGyrometer_Delegate_Base)
  ['{4817C0F7-F481-5983-92EA-FDD649299CE8}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IGyrometer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IGyrometer>
  IAsyncOperation_1__IGyrometer_Base = interface(IInspectable)
  ['{FCEE7ABF-1DCF-50CC-B91B-7A1F59E0C28B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IGyrometer>
  // Used Types:  Windows.Devices.Sensors.IGyrometer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IGyrometer>
  IAsyncOperation_1__IGyrometer = interface(IAsyncOperation_1__IGyrometer_Base)
  ['{C19DC157-AE9F-5F37-A487-F12D8D8D374E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IGyrometer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IGyrometer; safecall;
    function GetResults: IGyrometer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IGyrometer read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IGyrometer>
  }
  // Windows.Devices.Sensors.IGyrometerStatics2
  [WinRTClassNameAttribute(SGyrometer)]
  IGyrometerStatics2 = interface(IInspectable)
  ['{EF83F7A1-D700-4204-9613-79C6B161DF4E}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IGyrometer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  }
  // Windows.Devices.Sensors.IGyrometer2
  IGyrometer2 = interface(IInspectable)
  ['{63DF2443-8CE8-41C3-AC44-8698810B557F}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IGyrometer3
  IGyrometer3 = interface(IInspectable)
  ['{5D6F88D5-8FBC-4484-914B-528ADFD947B1}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IGyrometerReading2
  IGyrometerReading2 = interface(IInspectable)
  ['{16AFE13C-2B89-44BB-822B-D1E1556FF09B}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.ICompassDeviceId
  ICompassDeviceId = interface(IInspectable)
  ['{D181CA29-B085-4B1D-870A-4FF57BA74FD4}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Double
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Devices.Sensors.ICompassReading
  [WinRTClassNameAttribute(SCompassReading)]
  ICompassReading = interface(IInspectable)
  ['{82911128-513D-4DC9-B781-5EEDFBF02D0C}']
    function get_Timestamp: DateTime; safecall;
    function get_HeadingMagneticNorth: Double; safecall;
    function get_HeadingTrueNorth: IReference_1__Double; safecall;
    property HeadingMagneticNorth: Double read get_HeadingMagneticNorth;
    property HeadingTrueNorth: IReference_1__Double read get_HeadingTrueNorth;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ICompassReading
  }
  // Windows.Devices.Sensors.ICompassReadingChangedEventArgs
  [WinRTClassNameAttribute(SCompassReadingChangedEventArgs)]
  ICompassReadingChangedEventArgs = interface(IInspectable)
  ['{8F1549B0-E8BC-4C7E-B009-4E41DF137072}']
    function get_Reading: ICompassReading; safecall;
    property Reading: ICompassReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ICompass,Windows.Devices.Sensors.ICompassReadingChangedEventArgs>
  TypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E787D73D-A121-5AE6-B497-AB934837E57F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ICompass
  // Used Types:  Windows.Devices.Sensors.ICompassReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ICompass,Windows.Devices.Sensors.ICompassReadingChangedEventArgs>
  TypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs = interface(TypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs_Delegate_Base)
  ['{E918EC6B-CC83-5428-A983-F23DB6D211C3}']
    procedure Invoke(sender: ICompass; args: ICompassReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ICompassReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ICompass,Windows.Devices.Sensors.ICompassReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.ICompass
  [WinRTClassNameAttribute(SCompass)]
  ICompass = interface(IInspectable)
  ['{292FFA94-1B45-403C-BA06-B106DBA69A64}']
    function GetCurrentReading: ICompassReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__ICompass__ICompassReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ICompass
  }
  // Windows.Devices.Sensors.ICompassStatics
  [WinRTClassNameAttribute(SCompass)]
  ICompassStatics = interface(IInspectable)
  ['{9ABC97DF-56EC-4C25-B54D-40A68BB5B269}']
    function GetDefault: ICompass; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ICompass>
  AsyncOperationCompletedHandler_1__ICompass_Delegate_Base = interface(IUnknown)
  ['{0CF1E460-BC2C-587C-9822-420BA04D0551}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ICompass>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ICompass>
  AsyncOperationCompletedHandler_1__ICompass = interface(AsyncOperationCompletedHandler_1__ICompass_Delegate_Base)
  ['{83AE0D8F-80B3-51B4-A59B-AB046DCBD404}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ICompass; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ICompass>
  IAsyncOperation_1__ICompass_Base = interface(IInspectable)
  ['{5297C24C-A6FB-5E03-A4F8-EE143C435DF8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ICompass>
  // Used Types:  Windows.Devices.Sensors.ICompass
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ICompass>
  IAsyncOperation_1__ICompass = interface(IAsyncOperation_1__ICompass_Base)
  ['{3E917A0F-7B90-5B89-A301-9467F8C36C52}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ICompass); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ICompass; safecall;
    function GetResults: ICompass; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ICompass read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ICompass>
  }
  // Windows.Devices.Sensors.ICompassStatics2
  [WinRTClassNameAttribute(SCompass)]
  ICompassStatics2 = interface(IInspectable)
  ['{0ACE0EAD-3BAA-4990-9CE4-BE0913754ED2}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ICompass; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  }
  // Windows.Devices.Sensors.ICompass2
  ICompass2 = interface(IInspectable)
  ['{36F26D09-C7D7-434F-B461-979DDFC2322F}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.ICompass3
  ICompass3 = interface(IInspectable)
  ['{A424801B-C5EA-4D45-A0EC-4B791F041A89}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.ICompassReading2
  ICompassReading2 = interface(IInspectable)
  ['{B13A661E-51BB-4A12-BEDD-AD47FF87D2E8}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.MagnetometerAccuracy
  }
  // Windows.Devices.Sensors.ICompassReadingHeadingAccuracy
  ICompassReadingHeadingAccuracy = interface(IInspectable)
  ['{E761354E-8911-40F7-9E16-6ECC7DAEC5DE}']
    function get_HeadingAccuracy: MagnetometerAccuracy; safecall;
    property HeadingAccuracy: MagnetometerAccuracy read get_HeadingAccuracy;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.ILightSensorDeviceId
  ILightSensorDeviceId = interface(IInspectable)
  ['{7FEE49F8-0AFB-4F51-87F0-6C26375CE94F}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Single
  }
  // Windows.Devices.Sensors.ILightSensorReading
  [WinRTClassNameAttribute(SLightSensorReading)]
  ILightSensorReading = interface(IInspectable)
  ['{FFDF6300-227C-4D2B-B302-FC0142485C68}']
    function get_Timestamp: DateTime; safecall;
    function get_IlluminanceInLux: Single; safecall;
    property IlluminanceInLux: Single read get_IlluminanceInLux;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ILightSensorReading
  }
  // Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs
  [WinRTClassNameAttribute(SLightSensorReadingChangedEventArgs)]
  ILightSensorReadingChangedEventArgs = interface(IInspectable)
  ['{A3A2F4CF-258B-420C-B8AB-8EDD601ECF50}']
    function get_Reading: ILightSensorReading; safecall;
    property Reading: ILightSensorReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ILightSensor,Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs>
  TypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{1ECF183A-9F0A-5F73-9225-5A33EAB5594F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ILightSensor
  // Used Types:  Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ILightSensor,Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs>
  TypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs = interface(TypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs_Delegate_Base)
  ['{7356B947-E0F6-5A86-9EF8-17ACFB9B1DE7}']
    procedure Invoke(sender: ILightSensor; args: ILightSensorReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ILightSensorReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ILightSensor,Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.ILightSensor
  [WinRTClassNameAttribute(SLightSensor)]
  ILightSensor = interface(IInspectable)
  ['{F84C0718-0C54-47AE-922E-789F57FB03A0}']
    function GetCurrentReading: ILightSensorReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__ILightSensor__ILightSensorReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ILightSensor
  }
  // Windows.Devices.Sensors.ILightSensorStatics
  [WinRTClassNameAttribute(SLightSensor)]
  ILightSensorStatics = interface(IInspectable)
  ['{45DB8C84-C3A8-471E-9A53-6457FAD87C0E}']
    function GetDefault: ILightSensor; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ILightSensor>
  AsyncOperationCompletedHandler_1__ILightSensor_Delegate_Base = interface(IUnknown)
  ['{5D04E2BF-5163-5238-8F23-CE470B30340D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ILightSensor>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ILightSensor>
  AsyncOperationCompletedHandler_1__ILightSensor = interface(AsyncOperationCompletedHandler_1__ILightSensor_Delegate_Base)
  ['{0ABED528-449E-525A-897C-81EAF528785B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ILightSensor; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ILightSensor>
  IAsyncOperation_1__ILightSensor_Base = interface(IInspectable)
  ['{380E592C-47A0-5DF4-8DE2-B2EEFA9DB8AD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.ILightSensor>
  // Used Types:  Windows.Devices.Sensors.ILightSensor
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ILightSensor>
  IAsyncOperation_1__ILightSensor = interface(IAsyncOperation_1__ILightSensor_Base)
  ['{47168FBC-2105-5603-B81B-5CC5FBF68377}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ILightSensor); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ILightSensor; safecall;
    function GetResults: ILightSensor; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ILightSensor read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.ILightSensor>
  }
  // Windows.Devices.Sensors.ILightSensorStatics2
  [WinRTClassNameAttribute(SLightSensor)]
  ILightSensorStatics2 = interface(IInspectable)
  ['{0EC0A650-DDC6-40AB-ACE3-EC3359D42C51}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ILightSensor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.ILightSensor2
  ILightSensor2 = interface(IInspectable)
  ['{486B24E8-A94C-4090-8F48-09F782A9F7D5}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.ILightSensorReading2
  ILightSensorReading2 = interface(IInspectable)
  ['{B7512185-44A3-44C9-8190-9EF6DE0A8A74}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.Devices.Sensors.ISensorRotationMatrix
  [WinRTClassNameAttribute(SSensorRotationMatrix)]
  ISensorRotationMatrix = interface(IInspectable)
  ['{0A3D5A67-22F4-4392-9538-65D0BD064AA6}']
    function get_M11: Single; safecall;
    function get_M12: Single; safecall;
    function get_M13: Single; safecall;
    function get_M21: Single; safecall;
    function get_M22: Single; safecall;
    function get_M23: Single; safecall;
    function get_M31: Single; safecall;
    function get_M32: Single; safecall;
    function get_M33: Single; safecall;
    property M11: Single read get_M11;
    property M12: Single read get_M12;
    property M13: Single read get_M13;
    property M21: Single read get_M21;
    property M22: Single read get_M22;
    property M23: Single read get_M23;
    property M31: Single read get_M31;
    property M32: Single read get_M32;
    property M33: Single read get_M33;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Single
  }
  // Windows.Devices.Sensors.ISensorQuaternion
  [WinRTClassNameAttribute(SSensorQuaternion)]
  ISensorQuaternion = interface(IInspectable)
  ['{C9C5C827-C71C-46E7-9DA3-36A193B232BC}']
    function get_W: Single; safecall;
    function get_X: Single; safecall;
    function get_Y: Single; safecall;
    function get_Z: Single; safecall;
    property W: Single read get_W;
    property X: Single read get_X;
    property Y: Single read get_Y;
    property Z: Single read get_Z;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.IOrientationSensorDeviceId
  IOrientationSensorDeviceId = interface(IInspectable)
  ['{5A69B648-4C29-49EC-B28F-EA1D117B66F0}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Devices.Sensors.ISensorRotationMatrix
  // Used Types:  Windows.Devices.Sensors.ISensorQuaternion
  }
  // Windows.Devices.Sensors.IOrientationSensorReading
  [WinRTClassNameAttribute(SOrientationSensorReading)]
  IOrientationSensorReading = interface(IInspectable)
  ['{4756C993-6595-4897-BCC6-D537EE757564}']
    function get_Timestamp: DateTime; safecall;
    function get_RotationMatrix: ISensorRotationMatrix; safecall;
    function get_Quaternion: ISensorQuaternion; safecall;
    property Quaternion: ISensorQuaternion read get_Quaternion;
    property RotationMatrix: ISensorRotationMatrix read get_RotationMatrix;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IOrientationSensorReading
  }
  // Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs
  [WinRTClassNameAttribute(SOrientationSensorReadingChangedEventArgs)]
  IOrientationSensorReadingChangedEventArgs = interface(IInspectable)
  ['{012C1186-C3BA-46BC-AE65-7A98996CBFB8}']
    function get_Reading: IOrientationSensorReading; safecall;
    property Reading: IOrientationSensorReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IOrientationSensor,Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs>
  TypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{91AE0C43-E1F7-577D-A161-8AAF275EB927}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IOrientationSensor
  // Used Types:  Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IOrientationSensor,Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs>
  TypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs = interface(TypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs_Delegate_Base)
  ['{DCCA4324-96EB-5315-9D53-6EF61E4C8750}']
    procedure Invoke(sender: IOrientationSensor; args: IOrientationSensorReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IOrientationSensorReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IOrientationSensor,Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IOrientationSensor
  [WinRTClassNameAttribute(SOrientationSensor)]
  IOrientationSensor = interface(IInspectable)
  ['{5E354635-CF6B-4C63-ABD8-10252B0BF6EC}']
    function GetCurrentReading: IOrientationSensorReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IOrientationSensor__IOrientationSensorReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IOrientationSensor
  }
  // Windows.Devices.Sensors.IOrientationSensorStatics
  [WinRTClassNameAttribute(SOrientationSensor)]
  IOrientationSensorStatics = interface(IInspectable)
  ['{10EF8712-FB4C-428A-898B-2765E409E669}']
    function GetDefault: IOrientationSensor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IOrientationSensor
  }
  // Windows.Devices.Sensors.IOrientationSensorStatics2
  [WinRTClassNameAttribute(SOrientationSensor)]
  IOrientationSensorStatics2 = interface(IInspectable)
  ['{59DA0D0B-D40A-4C71-9276-8A272A0A6619}']
    function GetDefaultForRelativeReadings: IOrientationSensor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IOrientationSensor
  // Used Types:  Windows.Devices.Sensors.SensorReadingType
  // Used Types:  Windows.Devices.Sensors.SensorOptimizationGoal
  }
  // Windows.Devices.Sensors.IOrientationSensorStatics3
  [WinRTClassNameAttribute(SOrientationSensor)]
  IOrientationSensorStatics3 = interface(IInspectable)
  ['{D82CE920-2777-40FF-9F59-D654B085F12F}']
    function GetDefault(sensorReadingtype: SensorReadingType): IOrientationSensor; overload; safecall;
    function GetDefault(sensorReadingType: SensorReadingType; optimizationGoal: SensorOptimizationGoal): IOrientationSensor; overload; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IOrientationSensor>
  AsyncOperationCompletedHandler_1__IOrientationSensor_Delegate_Base = interface(IUnknown)
  ['{8330B323-6695-53D4-ACD7-B60C24C1B879}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IOrientationSensor>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IOrientationSensor>
  AsyncOperationCompletedHandler_1__IOrientationSensor = interface(AsyncOperationCompletedHandler_1__IOrientationSensor_Delegate_Base)
  ['{98586AA9-59B5-50E9-8FE6-2BAF0554C9A4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IOrientationSensor; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IOrientationSensor>
  IAsyncOperation_1__IOrientationSensor_Base = interface(IInspectable)
  ['{8EF36AA8-6F6D-538B-A42B-37AF7369049E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IOrientationSensor>
  // Used Types:  Windows.Devices.Sensors.IOrientationSensor
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IOrientationSensor>
  IAsyncOperation_1__IOrientationSensor = interface(IAsyncOperation_1__IOrientationSensor_Base)
  ['{FE4811A2-9428-57D4-961B-62B658FB89CE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IOrientationSensor); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IOrientationSensor; safecall;
    function GetResults: IOrientationSensor; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IOrientationSensor read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Sensors.SensorReadingType
  // Used Types:  Windows.Devices.Sensors.SensorOptimizationGoal
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IOrientationSensor>
  }
  // Windows.Devices.Sensors.IOrientationSensorStatics4
  [WinRTClassNameAttribute(SOrientationSensor)]
  IOrientationSensorStatics4 = interface(IInspectable)
  ['{A67FEB55-2C85-4B28-A0FE-58C4B20495F5}']
    function GetDeviceSelector(readingType: SensorReadingType): HSTRING; overload; safecall;
    function GetDeviceSelector(readingType: SensorReadingType; optimizationGoal: SensorOptimizationGoal): HSTRING; overload; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IOrientationSensor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  // Used Types:  Windows.Devices.Sensors.SensorReadingType
  }
  // Windows.Devices.Sensors.IOrientationSensor2
  IOrientationSensor2 = interface(IInspectable)
  ['{0D924CF9-2F1F-49C9-8042-4A1813D67760}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    function get_ReadingType: SensorReadingType; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
    property ReadingType: SensorReadingType read get_ReadingType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IOrientationSensor3
  IOrientationSensor3 = interface(IInspectable)
  ['{2CCE578D-646B-48C5-B7EE-44FDC4C6AAFD}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IOrientationSensorReading2
  IOrientationSensorReading2 = interface(IInspectable)
  ['{00576E5F-49F8-4C05-9E07-24FAC79408C3}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.MagnetometerAccuracy
  }
  // Windows.Devices.Sensors.IOrientationSensorReadingYawAccuracy
  IOrientationSensorReadingYawAccuracy = interface(IInspectable)
  ['{D1AC9824-3F5A-49A2-BC7B-1180BC38CD2B}']
    function get_YawAccuracy: MagnetometerAccuracy; safecall;
    property YawAccuracy: MagnetometerAccuracy read get_YawAccuracy;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.ISimpleOrientationSensorDeviceId
  ISimpleOrientationSensorDeviceId = interface(IInspectable)
  ['{FBC00ACB-3B76-41F6-8091-30EFE646D3CF}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Devices.Sensors.SimpleOrientation
  }
  // Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs
  [WinRTClassNameAttribute(SSimpleOrientationSensorOrientationChangedEventArgs)]
  ISimpleOrientationSensorOrientationChangedEventArgs = interface(IInspectable)
  ['{BCD5C660-23D4-4B4C-A22E-BA81ADE0C601}']
    function get_Timestamp: DateTime; safecall;
    function get_Orientation: SimpleOrientation; safecall;
    property Orientation: SimpleOrientation read get_Orientation;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ISimpleOrientationSensor,Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs>
  TypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{92437FA7-EA7B-5FC5-8ECF-1B911BEA2BFC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ISimpleOrientationSensor
  // Used Types:  Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ISimpleOrientationSensor,Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs>
  TypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs = interface(TypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs_Delegate_Base)
  ['{EC8B4336-878E-597A-ACE4-659581E77F5B}']
    procedure Invoke(sender: ISimpleOrientationSensor; args: ISimpleOrientationSensorOrientationChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.SimpleOrientation
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.ISimpleOrientationSensor,Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs>
  }
  // Windows.Devices.Sensors.ISimpleOrientationSensor
  [WinRTClassNameAttribute(SSimpleOrientationSensor)]
  ISimpleOrientationSensor = interface(IInspectable)
  ['{5FF53856-214A-4DEE-A3F9-616F1AB06FFD}']
    function GetCurrentOrientation: SimpleOrientation; safecall;
    function add_OrientationChanged(handler: TypedEventHandler_2__ISimpleOrientationSensor__ISimpleOrientationSensorOrientationChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OrientationChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.ISimpleOrientationSensor
  }
  // Windows.Devices.Sensors.ISimpleOrientationSensorStatics
  [WinRTClassNameAttribute(SSimpleOrientationSensor)]
  ISimpleOrientationSensorStatics = interface(IInspectable)
  ['{72ED066F-70AA-40C6-9B1B-3433F7459B4E}']
    function GetDefault: ISimpleOrientationSensor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  }
  // Windows.Devices.Sensors.ISimpleOrientationSensor2
  ISimpleOrientationSensor2 = interface(IInspectable)
  ['{A277A798-8870-453E-8BD6-B8F5D8D7941B}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Sensors.IMagnetometerDeviceId
  IMagnetometerDeviceId = interface(IInspectable)
  ['{58B498C2-7E4B-404C-9FC5-5DE8B40EBAE3}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Single
  // Used Types:  Windows.Devices.Sensors.MagnetometerAccuracy
  }
  // Windows.Devices.Sensors.IMagnetometerReading
  [WinRTClassNameAttribute(SMagnetometerReading)]
  IMagnetometerReading = interface(IInspectable)
  ['{0C2CC40D-EBFD-4E5C-BB11-AFC29B3CAE61}']
    function get_Timestamp: DateTime; safecall;
    function get_MagneticFieldX: Single; safecall;
    function get_MagneticFieldY: Single; safecall;
    function get_MagneticFieldZ: Single; safecall;
    function get_DirectionalAccuracy: MagnetometerAccuracy; safecall;
    property DirectionalAccuracy: MagnetometerAccuracy read get_DirectionalAccuracy;
    property MagneticFieldX: Single read get_MagneticFieldX;
    property MagneticFieldY: Single read get_MagneticFieldY;
    property MagneticFieldZ: Single read get_MagneticFieldZ;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IMagnetometerReading
  }
  // Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs
  [WinRTClassNameAttribute(SMagnetometerReadingChangedEventArgs)]
  IMagnetometerReadingChangedEventArgs = interface(IInspectable)
  ['{17EAE872-2EB9-4EE7-8AD0-3127537D949B}']
    function get_Reading: IMagnetometerReading; safecall;
    property Reading: IMagnetometerReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IMagnetometer,Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs>
  TypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{F9A0DA76-C4FD-50AB-98B6-BFD26D6D3D82}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IMagnetometer
  // Used Types:  Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IMagnetometer,Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs>
  TypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs = interface(TypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs_Delegate_Base)
  ['{C594359D-2616-5095-832B-CC3935C3A9D9}']
    procedure Invoke(sender: IMagnetometer; args: IMagnetometerReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IMagnetometerReading
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IMagnetometer,Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IMagnetometer
  [WinRTClassNameAttribute(SMagnetometer)]
  IMagnetometer = interface(IInspectable)
  ['{484F626E-D3C9-4111-B3F6-2CF1FAA418D5}']
    function GetCurrentReading: IMagnetometerReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IMagnetometer__IMagnetometerReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IMagnetometer
  }
  // Windows.Devices.Sensors.IMagnetometerStatics
  [WinRTClassNameAttribute(SMagnetometer)]
  IMagnetometerStatics = interface(IInspectable)
  ['{853C64CC-0698-4DDA-A6DF-9CB9CC4AB40A}']
    function GetDefault: IMagnetometer; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IMagnetometer>
  AsyncOperationCompletedHandler_1__IMagnetometer_Delegate_Base = interface(IUnknown)
  ['{46E0A768-9645-51A6-B6A7-1E5F4B40E1F3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IMagnetometer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IMagnetometer>
  AsyncOperationCompletedHandler_1__IMagnetometer = interface(AsyncOperationCompletedHandler_1__IMagnetometer_Delegate_Base)
  ['{CBE628AF-5D3B-5057-995E-0F04EEF36C38}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMagnetometer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IMagnetometer>
  IAsyncOperation_1__IMagnetometer_Base = interface(IInspectable)
  ['{B0455443-E790-5AA3-8767-4932032274EE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IMagnetometer>
  // Used Types:  Windows.Devices.Sensors.IMagnetometer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IMagnetometer>
  IAsyncOperation_1__IMagnetometer = interface(IAsyncOperation_1__IMagnetometer_Base)
  ['{8C71DB4D-D3FF-5F01-867A-8BE76BFDB279}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMagnetometer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMagnetometer; safecall;
    function GetResults: IMagnetometer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMagnetometer read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IMagnetometer>
  }
  // Windows.Devices.Sensors.IMagnetometerStatics2
  [WinRTClassNameAttribute(SMagnetometer)]
  IMagnetometerStatics2 = interface(IInspectable)
  ['{2C0819F0-FFC6-4F89-A06F-18FA10792933}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IMagnetometer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Display.DisplayOrientations
  }
  // Windows.Devices.Sensors.IMagnetometer2
  IMagnetometer2 = interface(IInspectable)
  ['{B4656C85-26F6-444B-A9E2-A23F966CD368}']
    procedure put_ReadingTransform(value: Display_DisplayOrientations); safecall;
    function get_ReadingTransform: Display_DisplayOrientations; safecall;
    property ReadingTransform: Display_DisplayOrientations read get_ReadingTransform write put_ReadingTransform;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IMagnetometer3
  IMagnetometer3 = interface(IInspectable)
  ['{BE93DB7C-A625-48EF-ACF7-FAC104832671}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IMagnetometerReading2
  IMagnetometerReading2 = interface(IInspectable)
  ['{D4C95C61-61D9-404B-A328-066F177A1409}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Devices.Sensors.ActivityType
  // Used Types:  Windows.Devices.Sensors.ActivitySensorReadingConfidence
  }
  // Windows.Devices.Sensors.IActivitySensorReading
  [WinRTClassNameAttribute(SActivitySensorReading)]
  IActivitySensorReading = interface(IInspectable)
  ['{85125A96-1472-40A2-B2AE-E1EF29226C78}']
    function get_Timestamp: DateTime; safecall;
    function get_Activity: ActivityType; safecall;
    function get_Confidence: ActivitySensorReadingConfidence; safecall;
    property Activity: ActivityType read get_Activity;
    property Confidence: ActivitySensorReadingConfidence read get_Confidence;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensorReading>
  AsyncOperationCompletedHandler_1__IActivitySensorReading_Delegate_Base = interface(IUnknown)
  ['{ADC48D5D-B343-5A58-8454-6E2BC2E0475C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensorReading>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensorReading>
  AsyncOperationCompletedHandler_1__IActivitySensorReading = interface(AsyncOperationCompletedHandler_1__IActivitySensorReading_Delegate_Base)
  ['{856A17A1-6B88-5986-ACBE-600B21971EBC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IActivitySensorReading; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensorReading>
  IAsyncOperation_1__IActivitySensorReading_Base = interface(IInspectable)
  ['{79A87969-327F-5B7A-A0D3-73EAB16DE21C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensorReading>
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReading
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensorReading>
  IAsyncOperation_1__IActivitySensorReading = interface(IAsyncOperation_1__IActivitySensorReading_Base)
  ['{8553FAE3-FE1A-5952-84C0-30C817E9E597}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IActivitySensorReading); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IActivitySensorReading; safecall;
    function GetResults: IActivitySensorReading; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IActivitySensorReading read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReading
  }
  // Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs
  [WinRTClassNameAttribute(SActivitySensorReadingChangedEventArgs)]
  IActivitySensorReadingChangedEventArgs = interface(IInspectable)
  ['{DE386717-AEB6-4EC7-946A-D9CC19B951EC}']
    function get_Reading: IActivitySensorReading; safecall;
    property Reading: IActivitySensorReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IActivitySensor,Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs>
  TypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A5B72E01-546C-5FBB-B847-49200AAAAAC5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensor
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IActivitySensor,Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs>
  TypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs = interface(TypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs_Delegate_Base)
  ['{BDA69EDC-1056-5BFA-8955-E4618E29C9C9}']
    procedure Invoke(sender: IActivitySensor; args: IActivitySensorReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensorReading>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.Sensors.ActivityType>
  // Used Types:  Double
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.ActivityType>
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IActivitySensor,Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IActivitySensor
  [WinRTClassNameAttribute(SActivitySensor)]
  IActivitySensor = interface(IInspectable)
  ['{CD7A630C-FB5F-48EB-B09B-A2708D1C61EF}']
    function GetCurrentReadingAsync: IAsyncOperation_1__IActivitySensorReading; safecall;
    function get_SubscribedActivities: IVector_1__ActivityType; safecall;
    function get_PowerInMilliwatts: Double; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_SupportedActivities: IVectorView_1__ActivityType; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IActivitySensor__IActivitySensorReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property PowerInMilliwatts: Double read get_PowerInMilliwatts;
    property SubscribedActivities: IVector_1__ActivityType read get_SubscribedActivities;
    property SupportedActivities: IVectorView_1__ActivityType read get_SupportedActivities;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensor>
  AsyncOperationCompletedHandler_1__IActivitySensor_Delegate_Base = interface(IUnknown)
  ['{FB0594F4-93D9-5C2F-B8EB-90F1E9258FDC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensor>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensor>
  AsyncOperationCompletedHandler_1__IActivitySensor = interface(AsyncOperationCompletedHandler_1__IActivitySensor_Delegate_Base)
  ['{6CC7625C-29FF-5A56-BCE3-806CDE6AB524}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IActivitySensor; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensor>
  IAsyncOperation_1__IActivitySensor_Base = interface(IInspectable)
  ['{C33003AE-E7AE-572B-8D55-7DB197356C30}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IActivitySensor>
  // Used Types:  Windows.Devices.Sensors.IActivitySensor
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensor>
  IAsyncOperation_1__IActivitySensor = interface(IAsyncOperation_1__IActivitySensor_Base)
  ['{73ADA693-ABC7-509B-8093-5BC4A5809253}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IActivitySensor); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IActivitySensor; safecall;
    function GetResults: IActivitySensor; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IActivitySensor read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReading>
  IIterator_1__IActivitySensorReading_Base = interface(IInspectable)
  ['{D2DAB535-0C94-547E-AFE3-5527BCBEB9CC}']
  end;
  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReading
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReading>
  IIterator_1__IActivitySensorReading = interface(IIterator_1__IActivitySensorReading_Base)
  ['{8E90F3DC-B93D-51A4-85B2-AFD31EA67A7B}']
    function get_Current: IActivitySensorReading; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIActivitySensorReading): Cardinal; safecall;
    property Current: IActivitySensorReading read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IActivitySensorReading>
  IIterable_1__IActivitySensorReading_Base = interface(IInspectable)
  ['{9A34CE03-8C6D-5994-907F-D5C2D19148CB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReading>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IActivitySensorReading>
  IIterable_1__IActivitySensorReading = interface(IIterable_1__IActivitySensorReading_Base)
  ['{2EBBCB05-1A40-5DB4-9245-95E5FBBF9C98}']
    function First: IIterator_1__IActivitySensorReading; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReading
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>
  IVectorView_1__IActivitySensorReading = interface(IInspectable)
  ['{780FDF9E-4215-50AA-B2FC-9643492B7E6C}']
    function GetAt(index: Cardinal): IActivitySensorReading; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IActivitySensorReading; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIActivitySensorReading): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading_Delegate_Base = interface(IUnknown)
  ['{179FB953-2D58-5991-8F5B-AC64219A1101}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading_Delegate_Base)
  ['{731CBCE6-E265-58D6-93EE-E23E4B29FF68}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IActivitySensorReading; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  IAsyncOperation_1__IVectorView_1__IActivitySensorReading_Base = interface(IInspectable)
  ['{CD781B82-7900-51A3-80CE-903E2E0A4F0E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  IAsyncOperation_1__IVectorView_1__IActivitySensorReading = interface(IAsyncOperation_1__IVectorView_1__IActivitySensorReading_Base)
  ['{22BF6528-41D4-5F6B-BC5C-0B29C82FBD5A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading; safecall;
    function GetResults: IVectorView_1__IActivitySensorReading; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IActivitySensorReading read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IActivitySensor>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReading>>
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Devices.Sensors.IActivitySensorStatics
  [WinRTClassNameAttribute(SActivitySensor)]
  IActivitySensorStatics = interface(IInspectable)
  ['{A71E0E9D-EE8B-45D1-B25B-08CC0DF92AB6}']
    function GetDefaultAsync: IAsyncOperation_1__IActivitySensor; safecall;
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IActivitySensor; safecall;
    function GetSystemHistoryAsync(fromTime: DateTime): IAsyncOperation_1__IVectorView_1__IActivitySensorReading; overload; safecall;
    function GetSystemHistoryAsync(fromTime: DateTime; duration: TimeSpan): IAsyncOperation_1__IVectorView_1__IActivitySensorReading; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReading
  }
  // Windows.Devices.Sensors.IActivitySensorReadingChangeReport
  [WinRTClassNameAttribute(SActivitySensorReadingChangeReport)]
  IActivitySensorReadingChangeReport = interface(IInspectable)
  ['{4F3C2915-D93B-47BD-960A-F20FB2F322B9}']
    function get_Reading: IActivitySensorReading; safecall;
    property Reading: IActivitySensorReading read get_Reading;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IIterator_1__IActivitySensorReadingChangeReport_Base = interface(IInspectable)
  ['{9C07034E-8333-59D5-8D60-0E3F0438AC12}']
  end;
  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReadingChangeReport
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IIterator_1__IActivitySensorReadingChangeReport = interface(IIterator_1__IActivitySensorReadingChangeReport_Base)
  ['{F01A64E7-E3E3-5D94-9F3A-EA63C9C4495E}']
    function get_Current: IActivitySensorReadingChangeReport; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIActivitySensorReadingChangeReport): Cardinal; safecall;
    property Current: IActivitySensorReadingChangeReport read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IIterable_1__IActivitySensorReadingChangeReport_Base = interface(IInspectable)
  ['{551A4962-9E96-5E6B-8B8A-65EE3D0046F3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IIterable_1__IActivitySensorReadingChangeReport = interface(IIterable_1__IActivitySensorReadingChangeReport_Base)
  ['{2960EDAE-C062-5C20-ACA2-0EFF1A2EBEF0}']
    function First: IIterator_1__IActivitySensorReadingChangeReport; safecall;
  end;

  {
  // Used Types:  Windows.Devices.Sensors.IActivitySensorReadingChangeReport
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IActivitySensorReadingChangeReport>
  IVectorView_1__IActivitySensorReadingChangeReport = interface(IInspectable)
  ['{50767C75-433E-5527-8CE5-7D61ED23BC9E}']
    function GetAt(index: Cardinal): IActivitySensorReadingChangeReport; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IActivitySensorReadingChangeReport; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIActivitySensorReadingChangeReport): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Double
  }
  // Windows.Devices.Sensors.IBarometerReading
  [WinRTClassNameAttribute(SBarometerReading)]
  IBarometerReading = interface(IInspectable)
  ['{F5B9D2E6-1DF6-4A1A-A7AD-321D4F5DB247}']
    function get_Timestamp: DateTime; safecall;
    function get_StationPressureInHectopascals: Double; safecall;
    property StationPressureInHectopascals: Double read get_StationPressureInHectopascals;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IBarometerReading
  }
  // Windows.Devices.Sensors.IBarometerReadingChangedEventArgs
  [WinRTClassNameAttribute(SBarometerReadingChangedEventArgs)]
  IBarometerReadingChangedEventArgs = interface(IInspectable)
  ['{3D84945F-037B-404F-9BBB-6232D69543C3}']
    function get_Reading: IBarometerReading; safecall;
    property Reading: IBarometerReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IBarometer,Windows.Devices.Sensors.IBarometerReadingChangedEventArgs>
  TypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E4CAF459-D101-5CA5-A4EA-DEB0917AE27E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IBarometer
  // Used Types:  Windows.Devices.Sensors.IBarometerReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IBarometer,Windows.Devices.Sensors.IBarometerReadingChangedEventArgs>
  TypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs = interface(TypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs_Delegate_Base)
  ['{A55A1B34-4A10-5FBC-BDA2-3B1BA63C9620}']
    procedure Invoke(sender: IBarometer; args: IBarometerReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IBarometerReading
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IBarometer,Windows.Devices.Sensors.IBarometerReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IBarometer
  [WinRTClassNameAttribute(SBarometer)]
  IBarometer = interface(IInspectable)
  ['{934475A8-78BF-452F-B017-F0209CE6DAB4}']
    function GetCurrentReading: IBarometerReading; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IBarometer__IBarometerReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IBarometer
  }
  // Windows.Devices.Sensors.IBarometerStatics
  [WinRTClassNameAttribute(SBarometer)]
  IBarometerStatics = interface(IInspectable)
  ['{286B270A-02E3-4F86-84FC-FDD892B5940F}']
    function GetDefault: IBarometer; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IBarometer>
  AsyncOperationCompletedHandler_1__IBarometer_Delegate_Base = interface(IUnknown)
  ['{A15E21D6-5467-590C-AFE1-9C8132DCD8A4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IBarometer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IBarometer>
  AsyncOperationCompletedHandler_1__IBarometer = interface(AsyncOperationCompletedHandler_1__IBarometer_Delegate_Base)
  ['{15D80F28-0E9D-5608-A4CF-7D00336F37BC}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IBarometer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IBarometer>
  IAsyncOperation_1__IBarometer_Base = interface(IInspectable)
  ['{51876037-9F36-5C86-855D-3DDD251DF9A8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IBarometer>
  // Used Types:  Windows.Devices.Sensors.IBarometer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IBarometer>
  IAsyncOperation_1__IBarometer = interface(IAsyncOperation_1__IBarometer_Base)
  ['{8E9AB142-3E6D-5F6A-9219-C28CBE795CEF}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IBarometer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IBarometer; safecall;
    function GetResults: IBarometer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IBarometer read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IBarometer>
  // Used Types:  String
  }
  // Windows.Devices.Sensors.IBarometerStatics2
  [WinRTClassNameAttribute(SBarometer)]
  IBarometerStatics2 = interface(IInspectable)
  ['{8FC6B1E7-95FF-44AC-878E-D65C8308C34C}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBarometer; safecall;
    function GetDeviceSelector: HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IBarometer2
  IBarometer2 = interface(IInspectable)
  ['{32BCC418-3EEB-4D04-9574-7633A8781F9F}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IBarometerReading2
  IBarometerReading2 = interface(IInspectable)
  ['{85A244EB-90C5-4875-891C-3865B4C357E7}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.PedometerStepKind
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Devices.Sensors.IPedometerReading
  [WinRTClassNameAttribute(SPedometerReading)]
  IPedometerReading = interface(IInspectable)
  ['{2245DCF4-A8E1-432F-896A-BE0DD9B02D24}']
    function get_StepKind: PedometerStepKind; safecall;
    function get_CumulativeSteps: Integer; safecall;
    function get_Timestamp: DateTime; safecall;
    function get_CumulativeStepsDuration: TimeSpan; safecall;
    property CumulativeSteps: Integer read get_CumulativeSteps;
    property CumulativeStepsDuration: TimeSpan read get_CumulativeStepsDuration;
    property StepKind: PedometerStepKind read get_StepKind;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IPedometerReading
  }
  // Windows.Devices.Sensors.IPedometerReadingChangedEventArgs
  [WinRTClassNameAttribute(SPedometerReadingChangedEventArgs)]
  IPedometerReadingChangedEventArgs = interface(IInspectable)
  ['{F855E47E-ABBC-4456-86A8-25CF2B333742}']
    function get_Reading: IPedometerReading; safecall;
    property Reading: IPedometerReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IPedometer,Windows.Devices.Sensors.IPedometerReadingChangedEventArgs>
  TypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{DCD47693-AAD5-5B3C-9C8D-140B8BC2122B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IPedometer
  // Used Types:  Windows.Devices.Sensors.IPedometerReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IPedometer,Windows.Devices.Sensors.IPedometerReadingChangedEventArgs>
  TypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs = interface(TypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs_Delegate_Base)
  ['{AA04307E-B7E8-5AE2-99CB-3C75CD084E48}']
    procedure Invoke(sender: IPedometer; args: IPedometerReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IPedometer,Windows.Devices.Sensors.IPedometerReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IPedometer
  [WinRTClassNameAttribute(SPedometer)]
  IPedometer = interface(IInspectable)
  ['{9A1E013D-3D98-45F8-8920-8E4ECACA5F97}']
    function get_DeviceId: HSTRING; safecall;
    function get_PowerInMilliwatts: Double; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IPedometer__IPedometerReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property PowerInMilliwatts: Double read get_PowerInMilliwatts;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IPedometer>
  AsyncOperationCompletedHandler_1__IPedometer_Delegate_Base = interface(IUnknown)
  ['{A62DBE4E-51DE-5A13-BA21-E76DF3BC1396}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IPedometer>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IPedometer>
  AsyncOperationCompletedHandler_1__IPedometer = interface(AsyncOperationCompletedHandler_1__IPedometer_Delegate_Base)
  ['{6F524164-28F7-55AF-803E-57BEFA8E348B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IPedometer; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IPedometer>
  IAsyncOperation_1__IPedometer_Base = interface(IInspectable)
  ['{9414388F-1B3E-55F5-819B-AB3833646055}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.IPedometer>
  // Used Types:  Windows.Devices.Sensors.IPedometer
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IPedometer>
  IAsyncOperation_1__IPedometer = interface(IAsyncOperation_1__IPedometer_Base)
  ['{EC8C42C2-06A0-5A6A-9A0D-F9D87516604D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IPedometer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IPedometer; safecall;
    function GetResults: IPedometer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IPedometer read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IPedometerReading>
  IIterator_1__IPedometerReading_Base = interface(IInspectable)
  ['{0AC70ED3-8553-5EF3-92F8-438609623087}']
  end;
  {
  // Used Types:  Windows.Devices.Sensors.IPedometerReading
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IPedometerReading>
  IIterator_1__IPedometerReading = interface(IIterator_1__IPedometerReading_Base)
  ['{5DE1D135-53ED-5540-BB3A-974D4734E763}']
    function get_Current: IPedometerReading; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIPedometerReading): Cardinal; safecall;
    property Current: IPedometerReading read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IPedometerReading>
  IIterable_1__IPedometerReading_Base = interface(IInspectable)
  ['{BBB61A5C-98C3-5718-88FE-5392A7451E2D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IPedometerReading>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IPedometerReading>
  IIterable_1__IPedometerReading = interface(IIterable_1__IPedometerReading_Base)
  ['{A2C8ABEB-1922-5560-9DC3-07BEAC496D61}']
    function First: IIterator_1__IPedometerReading; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IPedometerReading
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>
  IVectorView_1__IPedometerReading = interface(IInspectable)
  ['{44BEB693-AA66-5003-886B-1BF273FA5750}']
    function GetAt(index: Cardinal): IPedometerReading; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IPedometerReading; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIPedometerReading): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading_Delegate_Base = interface(IUnknown)
  ['{5BBFF840-59F2-5108-9205-A0BBF8F9BA68}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading = interface(AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading_Delegate_Base)
  ['{9981AC9E-9B71-5AB7-A104-B9896CCF5BC9}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__IPedometerReading; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  IAsyncOperation_1__IVectorView_1__IPedometerReading_Base = interface(IInspectable)
  ['{2AEAC503-A3A8-57B3-A8A9-E16B0CD4C0A4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  IAsyncOperation_1__IVectorView_1__IPedometerReading = interface(IAsyncOperation_1__IVectorView_1__IPedometerReading_Base)
  ['{F29A8A7A-BB35-53C8-B794-C7A235320EF5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading; safecall;
    function GetResults: IVectorView_1__IPedometerReading; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__IPedometerReading read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.IPedometer>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>>
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Devices.Sensors.IPedometerStatics
  [WinRTClassNameAttribute(SPedometer)]
  IPedometerStatics = interface(IInspectable)
  ['{82980A2F-4083-4DFB-B411-938EA0F4B946}']
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IPedometer; safecall;
    function GetDefaultAsync: IAsyncOperation_1__IPedometer; safecall;
    function GetDeviceSelector: HSTRING; safecall;
    function GetSystemHistoryAsync(fromTime: DateTime): IAsyncOperation_1__IVectorView_1__IPedometerReading; overload; safecall;
    function GetSystemHistoryAsync(fromTime: DateTime; duration: TimeSpan): IAsyncOperation_1__IVectorView_1__IPedometerReading; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IPedometerReading>
  // Used Types:  Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
  }
  // Windows.Devices.Sensors.IPedometerStatics2
  [WinRTClassNameAttribute(SPedometer)]
  IPedometerStatics2 = interface(IInspectable)
  ['{79F5C6BB-CE0E-4133-B47E-8627EA72F677}']
    function GetReadingsFromTriggerDetails(triggerDetails: ISensorDataThresholdTriggerDetails): IVectorView_1__IPedometerReading; safecall;
  end;

  {
  // Used Types:  Windows.Devices.Sensors.PedometerStepKind
  // Used Types:  Windows.Devices.Sensors.IPedometerReading
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  IKeyValuePair_2__PedometerStepKind__IPedometerReading = interface(IInspectable)
  ['{94FB7BA0-8960-53B6-9428-327D79078C93}']
    function get_Key: PedometerStepKind; safecall;
    function get_Value: IPedometerReading; safecall;
    property Key: PedometerStepKind read get_Key;
    property Value: IPedometerReading read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  IIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading_Base = interface(IInspectable)
  ['{3E88FE66-D4A7-5658-B5CF-1A39E1FC4165}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  IIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading = interface(IIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading_Base)
  ['{86F2DB87-DD00-5A3D-8080-F747FA12BE6F}']
    function get_Current: IKeyValuePair_2__PedometerStepKind__IPedometerReading; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__PedometerStepKind__IPedometerReading): Cardinal; safecall;
    property Current: IKeyValuePair_2__PedometerStepKind__IPedometerReading read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  IIterable_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading_Base = interface(IInspectable)
  ['{098F29CB-BC91-5639-A541-D5A4811EC35B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>>
  IIterable_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading = interface(IIterable_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading_Base)
  ['{B739C641-577F-5840-ACE4-FB73FD6A35FF}']
    function First: IIterator_1__IKeyValuePair_2__PedometerStepKind__IPedometerReading; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  IMapView_2__PedometerStepKind__IPedometerReading_Base = interface(IInspectable)
  ['{64F0C54C-4865-56BD-AC98-64A98451E362}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IPedometerReading
  // Used Types:  Windows.Devices.Sensors.PedometerStepKind
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  }
  // Windows.Foundation.Collections.IMapView`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  IMapView_2__PedometerStepKind__IPedometerReading = interface(IMapView_2__PedometerStepKind__IPedometerReading_Base)
  ['{0E724522-3044-5B79-A2BC-50AC3B3317BD}']
    function Lookup(key: PedometerStepKind): IPedometerReading; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: PedometerStepKind): Boolean; safecall;
    procedure Split(out first: IMapView_2__PedometerStepKind__IPedometerReading; out second: IMapView_2__PedometerStepKind__IPedometerReading); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Windows.Devices.Sensors.PedometerStepKind,Windows.Devices.Sensors.IPedometerReading>
  }
  // Windows.Devices.Sensors.IPedometer2
  IPedometer2 = interface(IInspectable)
  ['{E5A406DF-2B81-4ADD-B2FF-77AB6C98BA19}']
    function GetCurrentReadings: IMapView_2__PedometerStepKind__IPedometerReading; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  }
  // Windows.Devices.Sensors.IProximitySensorReading
  [WinRTClassNameAttribute(SProximitySensorReading)]
  IProximitySensorReading = interface(IInspectable)
  ['{71228D59-132D-4D5F-8FF9-2F0DB8751CED}']
    function get_Timestamp: DateTime; safecall;
    function get_IsDetected: Boolean; safecall;
    function get_DistanceInMillimeters: IReference_1__Cardinal; safecall;
    property DistanceInMillimeters: IReference_1__Cardinal read get_DistanceInMillimeters;
    property IsDetected: Boolean read get_IsDetected;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IProximitySensorReading
  }
  // Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs
  [WinRTClassNameAttribute(SProximitySensorReadingChangedEventArgs)]
  IProximitySensorReadingChangedEventArgs = interface(IInspectable)
  ['{CFC2F366-C3E8-40FD-8CC3-67E289004938}']
    function get_Reading: IProximitySensorReading; safecall;
    property Reading: IProximitySensorReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IProximitySensor,Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs>
  TypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{9F7E222B-892A-5E68-B08A-10384B5F92B9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IProximitySensor
  // Used Types:  Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IProximitySensor,Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs>
  TypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs = interface(TypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs_Delegate_Base)
  ['{26EF705D-2550-54A0-B0D7-82B21D59B6E1}']
    procedure Invoke(sender: IProximitySensor; args: IProximitySensorReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  Windows.Devices.Sensors.IProximitySensorReading
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IProximitySensor,Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs>
  // Used Types:  Windows.Foundation.IClosable
  }
  // Windows.Devices.Sensors.IProximitySensor
  [WinRTClassNameAttribute(SProximitySensor)]
  IProximitySensor = interface(IInspectable)
  ['{54C076B8-ECFB-4944-B928-74FC504D47EE}']
    function get_DeviceId: HSTRING; safecall;
    function get_MaxDistanceInMillimeters: IReference_1__Cardinal; safecall;
    function get_MinDistanceInMillimeters: IReference_1__Cardinal; safecall;
    function GetCurrentReading: IProximitySensorReading; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IProximitySensor__IProximitySensorReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    function CreateDisplayOnOffController: IClosable; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MaxDistanceInMillimeters: IReference_1__Cardinal read get_MaxDistanceInMillimeters;
    property MinDistanceInMillimeters: IReference_1__Cardinal read get_MinDistanceInMillimeters;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Sensors.IProximitySensor
  }
  // Windows.Devices.Sensors.IProximitySensorStatics
  [WinRTClassNameAttribute(SProximitySensor)]
  IProximitySensorStatics = interface(IInspectable)
  ['{29186649-6269-4E57-A5AD-82BE80813392}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromId(sensorId: HSTRING): IProximitySensor; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IProximitySensorReading>
  IIterator_1__IProximitySensorReading_Base = interface(IInspectable)
  ['{1D4F08DF-7F49-573B-936A-6D4D4E610930}']
  end;
  {
  // Used Types:  Windows.Devices.Sensors.IProximitySensorReading
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IProximitySensorReading>
  IIterator_1__IProximitySensorReading = interface(IIterator_1__IProximitySensorReading_Base)
  ['{C10AB1E1-01ED-558C-A391-8393B7BC574C}']
    function get_Current: IProximitySensorReading; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIProximitySensorReading): Cardinal; safecall;
    property Current: IProximitySensorReading read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IProximitySensorReading>
  IIterable_1__IProximitySensorReading_Base = interface(IInspectable)
  ['{301EBCCF-11AB-5E90-98EE-BD99C0E3BB76}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Sensors.IProximitySensorReading>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Sensors.IProximitySensorReading>
  IIterable_1__IProximitySensorReading = interface(IIterable_1__IProximitySensorReading_Base)
  ['{CE54F169-A3F3-5A06-8AAE-6223F48C64BC}']
    function First: IIterator_1__IProximitySensorReading; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IProximitySensorReading
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IProximitySensorReading>
  IVectorView_1__IProximitySensorReading = interface(IInspectable)
  ['{E94032E2-CD06-511E-BC3C-5C4750E39FC9}']
    function GetAt(index: Cardinal): IProximitySensorReading; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IProximitySensorReading; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIProximitySensorReading): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Sensors.IProximitySensorReading>
  // Used Types:  Windows.Devices.Sensors.ISensorDataThresholdTriggerDetails
  }
  // Windows.Devices.Sensors.IProximitySensorStatics2
  [WinRTClassNameAttribute(SProximitySensor)]
  IProximitySensorStatics2 = interface(IInspectable)
  ['{CBF473AE-E9CA-422F-AD67-4C3D25DF350C}']
    function GetReadingsFromTriggerDetails(triggerDetails: ISensorDataThresholdTriggerDetails): IVectorView_1__IProximitySensorReading; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Double
  }
  // Windows.Devices.Sensors.IAltimeterReading
  [WinRTClassNameAttribute(SAltimeterReading)]
  IAltimeterReading = interface(IInspectable)
  ['{FBE8EF73-7F5E-48C8-AA1A-F1F3BEFC1144}']
    function get_Timestamp: DateTime; safecall;
    function get_AltitudeChangeInMeters: Double; safecall;
    property AltitudeChangeInMeters: Double read get_AltitudeChangeInMeters;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAltimeterReading
  }
  // Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs
  [WinRTClassNameAttribute(SAltimeterReadingChangedEventArgs)]
  IAltimeterReadingChangedEventArgs = interface(IInspectable)
  ['{7069D077-446D-47F7-998C-EBC23B45E4A2}']
    function get_Reading: IAltimeterReading; safecall;
    property Reading: IAltimeterReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAltimeter,Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs>
  TypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D775D699-9D74-5473-9C1B-D51A89DB6642}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAltimeter
  // Used Types:  Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAltimeter,Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs>
  TypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs = interface(TypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs_Delegate_Base)
  ['{1564E105-0FCE-54DB-BEFC-EA3A8A698F3D}']
    procedure Invoke(sender: IAltimeter; args: IAltimeterReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAltimeterReading
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.IAltimeter,Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.IAltimeter
  [WinRTClassNameAttribute(SAltimeter)]
  IAltimeter = interface(IInspectable)
  ['{72F057FD-8F04-49F1-B4A7-F4E363B701A2}']
    function GetCurrentReading: IAltimeterReading; safecall;
    function get_DeviceId: HSTRING; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__IAltimeter__IAltimeterReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.IAltimeter
  }
  // Windows.Devices.Sensors.IAltimeterStatics
  [WinRTClassNameAttribute(SAltimeter)]
  IAltimeterStatics = interface(IInspectable)
  ['{9EB4D7C3-E5AC-47CE-8EEF-D3718168C01F}']
    function GetDefault: IAltimeter; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.IAltimeter2
  IAltimeter2 = interface(IInspectable)
  ['{C9471BF9-2ADD-48F5-9F08-3D0C7660D938}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.IAltimeterReading2
  IAltimeterReading2 = interface(IInspectable)
  ['{543A1BD9-6D0B-42B2-BD69-BC8FAE0F782C}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  }
  // Windows.Devices.Sensors.Custom.ICustomSensorReading
  [WinRTClassNameAttribute(SCustom_CustomSensorReading)]
  Custom_ICustomSensorReading = interface(IInspectable)
  ['{64004F4D-446A-4366-A87A-5F963268EC53}']
    function get_Timestamp: DateTime; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.Custom.ICustomSensorReading
  }
  // Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs
  [WinRTClassNameAttribute(SCustom_CustomSensorReadingChangedEventArgs)]
  Custom_ICustomSensorReadingChangedEventArgs = interface(IInspectable)
  ['{6B202023-CFFD-4CC1-8FF0-E21823D76FCC}']
    function get_Reading: Custom_ICustomSensorReading; safecall;
    property Reading: Custom_ICustomSensorReading read get_Reading;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.Custom.ICustomSensor,Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs>
  TypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{AA9460CB-F08C-5963-B232-CC4075E984E7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.Custom.ICustomSensor
  // Used Types:  Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.Custom.ICustomSensor,Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs>
  TypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs = interface(TypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs_Delegate_Base)
  ['{A0D2F048-CAC9-5841-927F-5B5A19B6B0B1}']
    procedure Invoke(sender: Custom_ICustomSensor; args: Custom_ICustomSensorReadingChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Sensors.Custom.ICustomSensorReading
  // Used Types:  UInt32
  // Used Types:  String
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Sensors.Custom.ICustomSensor,Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs>
  }
  // Windows.Devices.Sensors.Custom.ICustomSensor
  [WinRTClassNameAttribute(SCustom_CustomSensor)]
  Custom_ICustomSensor = interface(IInspectable)
  ['{A136F9AD-4034-4B4D-99DD-531AAC649C09}']
    function GetCurrentReading: Custom_ICustomSensorReading; safecall;
    function get_MinimumReportInterval: Cardinal; safecall;
    procedure put_ReportInterval(value: Cardinal); safecall;
    function get_ReportInterval: Cardinal; safecall;
    function get_DeviceId: HSTRING; safecall;
    function add_ReadingChanged(handler: TypedEventHandler_2__Custom_ICustomSensor__Custom_ICustomSensorReadingChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ReadingChanged(token: EventRegistrationToken); safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property MinimumReportInterval: Cardinal read get_MinimumReportInterval;
    property ReportInterval: Cardinal read get_ReportInterval write put_ReportInterval;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  AsyncOperationCompletedHandler_1__Custom_ICustomSensor_Delegate_Base = interface(IUnknown)
  ['{808B62D7-6E02-5680-A59E-118A98A4E70F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  AsyncOperationCompletedHandler_1__Custom_ICustomSensor = interface(AsyncOperationCompletedHandler_1__Custom_ICustomSensor_Delegate_Base)
  ['{AA01C1BB-91C4-54DB-9838-F10719591E16}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Custom_ICustomSensor; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  IAsyncOperation_1__Custom_ICustomSensor_Base = interface(IInspectable)
  ['{7FBFBE55-9674-54E3-A269-9CAA820ED23C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  // Used Types:  Windows.Devices.Sensors.Custom.ICustomSensor
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  IAsyncOperation_1__Custom_ICustomSensor = interface(IAsyncOperation_1__Custom_ICustomSensor_Base)
  ['{0E389148-2046-5C91-B993-D30929949BF8}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Custom_ICustomSensor); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Custom_ICustomSensor; safecall;
    function GetResults: Custom_ICustomSensor; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Custom_ICustomSensor read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Sensors.Custom.ICustomSensor>
  }
  // Windows.Devices.Sensors.Custom.ICustomSensorStatics
  [WinRTClassNameAttribute(SCustom_CustomSensor)]
  Custom_ICustomSensorStatics = interface(IInspectable)
  ['{992052CF-F422-4C7D-836B-E7DC74A7124B}']
    function GetDeviceSelector(interfaceId: TGuid): HSTRING; safecall;
    function FromIdAsync(sensorId: HSTRING): IAsyncOperation_1__Custom_ICustomSensor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Devices.Sensors.Custom.ICustomSensor2
  Custom_ICustomSensor2 = interface(IInspectable)
  ['{20DB3111-EC58-4D9F-BFBD-E77825088510}']
    procedure put_ReportLatency(value: Cardinal); safecall;
    function get_ReportLatency: Cardinal; safecall;
    function get_MaxBatchSize: Cardinal; safecall;
    property MaxBatchSize: Cardinal read get_MaxBatchSize;
    property ReportLatency: Cardinal read get_ReportLatency write put_ReportLatency;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Devices.Sensors.Custom.ICustomSensorReading2
  Custom_ICustomSensorReading2 = interface(IInspectable)
  ['{223C98EA-BF73-4992-9A48-D3C897594CCB}']
    function get_PerformanceCount: IReference_1__TimeSpan; safecall;
    property PerformanceCount: IReference_1__TimeSpan read get_PerformanceCount;
  end;


  // Emit Forwarded classes
  // Windows.Devices.Sensors.Accelerometer
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAccelerometer
  // Implements: Windows.Devices.Sensors.IAccelerometerDeviceId
  // Implements: Windows.Devices.Sensors.IAccelerometer2
  // Implements: Windows.Devices.Sensors.IAccelerometer3
  // Implements: Windows.Devices.Sensors.IAccelerometer4
  // Statics: "Windows.Devices.Sensors.IAccelerometerStatics"
  // Statics: "Windows.Devices.Sensors.IAccelerometerStatics2"
  // Statics: "Windows.Devices.Sensors.IAccelerometerStatics3"
  TAccelerometer = class(TWinRTGenericImportS3<IAccelerometerStatics, IAccelerometerStatics2, IAccelerometerStatics3>)
  public
    // -> IAccelerometerStatics
    class function GetDefault: IAccelerometer; overload; static; inline;

    // -> IAccelerometerStatics2
    class function GetDefault(readingType: AccelerometerReadingType): IAccelerometer; overload; static; inline;

    // -> IAccelerometerStatics3
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IAccelerometer; static; inline;
    class function GetDeviceSelector(readingType: AccelerometerReadingType): HSTRING; static; inline;
  end;

  // Windows.Devices.Sensors.AccelerometerReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAccelerometerReading
  // Implements: Windows.Devices.Sensors.IAccelerometerReading2

  // Windows.Devices.Sensors.AccelerometerReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAccelerometerReadingChangedEventArgs

  // Windows.Devices.Sensors.AccelerometerShakenEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAccelerometerShakenEventArgs

  // Windows.Devices.Sensors.Inclinometer
  // DualAPI
  // Implements: Windows.Devices.Sensors.IInclinometer
  // Implements: Windows.Devices.Sensors.IInclinometerDeviceId
  // Implements: Windows.Devices.Sensors.IInclinometer2
  // Implements: Windows.Devices.Sensors.IInclinometer3
  // Statics: "Windows.Devices.Sensors.IInclinometerStatics4"
  // Statics: "Windows.Devices.Sensors.IInclinometerStatics3"
  // Statics: "Windows.Devices.Sensors.IInclinometerStatics"
  // Statics: "Windows.Devices.Sensors.IInclinometerStatics2"
  TInclinometer = class(TWinRTGenericImportS4<IInclinometerStatics, IInclinometerStatics2, IInclinometerStatics3, IInclinometerStatics4>)
  public
    // -> IInclinometerStatics4
    class function GetDeviceSelector(readingType: SensorReadingType): HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IInclinometer; static; inline;

    // -> IInclinometerStatics3
    class function GetDefault(sensorReadingtype: SensorReadingType): IInclinometer; overload; static; inline;

    // -> IInclinometerStatics
    class function GetDefault: IInclinometer; overload; static; inline;

    // -> IInclinometerStatics2
    class function GetDefaultForRelativeReadings: IInclinometer; static; inline;
  end;

  // Windows.Devices.Sensors.InclinometerReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IInclinometerReading
  // Implements: Windows.Devices.Sensors.IInclinometerReadingYawAccuracy
  // Implements: Windows.Devices.Sensors.IInclinometerReading2

  // Windows.Devices.Sensors.InclinometerReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IInclinometerReadingChangedEventArgs

  // Windows.Devices.Sensors.Gyrometer
  // DualAPI
  // Implements: Windows.Devices.Sensors.IGyrometer
  // Implements: Windows.Devices.Sensors.IGyrometerDeviceId
  // Implements: Windows.Devices.Sensors.IGyrometer2
  // Implements: Windows.Devices.Sensors.IGyrometer3
  // Statics: "Windows.Devices.Sensors.IGyrometerStatics2"
  // Statics: "Windows.Devices.Sensors.IGyrometerStatics"
  TGyrometer = class(TWinRTGenericImportS2<IGyrometerStatics, IGyrometerStatics2>)
  public
    // -> IGyrometerStatics2
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IGyrometer; static; inline;

    // -> IGyrometerStatics
    class function GetDefault: IGyrometer; static; inline;
  end;

  // Windows.Devices.Sensors.GyrometerReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IGyrometerReading
  // Implements: Windows.Devices.Sensors.IGyrometerReading2

  // Windows.Devices.Sensors.GyrometerReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IGyrometerReadingChangedEventArgs

  // Windows.Devices.Sensors.Compass
  // DualAPI
  // Implements: Windows.Devices.Sensors.ICompass
  // Implements: Windows.Devices.Sensors.ICompassDeviceId
  // Implements: Windows.Devices.Sensors.ICompass2
  // Implements: Windows.Devices.Sensors.ICompass3
  // Statics: "Windows.Devices.Sensors.ICompassStatics2"
  // Statics: "Windows.Devices.Sensors.ICompassStatics"
  TCompass = class(TWinRTGenericImportS2<ICompassStatics, ICompassStatics2>)
  public
    // -> ICompassStatics2
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ICompass; static; inline;

    // -> ICompassStatics
    class function GetDefault: ICompass; static; inline;
  end;

  // Windows.Devices.Sensors.CompassReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.ICompassReading
  // Implements: Windows.Devices.Sensors.ICompassReadingHeadingAccuracy
  // Implements: Windows.Devices.Sensors.ICompassReading2

  // Windows.Devices.Sensors.CompassReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.ICompassReadingChangedEventArgs

  // Windows.Devices.Sensors.LightSensor
  // DualAPI
  // Implements: Windows.Devices.Sensors.ILightSensor
  // Implements: Windows.Devices.Sensors.ILightSensorDeviceId
  // Implements: Windows.Devices.Sensors.ILightSensor2
  // Statics: "Windows.Devices.Sensors.ILightSensorStatics2"
  // Statics: "Windows.Devices.Sensors.ILightSensorStatics"
  TLightSensor = class(TWinRTGenericImportS2<ILightSensorStatics, ILightSensorStatics2>)
  public
    // -> ILightSensorStatics2
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ILightSensor; static; inline;

    // -> ILightSensorStatics
    class function GetDefault: ILightSensor; static; inline;
  end;

  // Windows.Devices.Sensors.LightSensorReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.ILightSensorReading
  // Implements: Windows.Devices.Sensors.ILightSensorReading2

  // Windows.Devices.Sensors.LightSensorReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.ILightSensorReadingChangedEventArgs

  // Windows.Devices.Sensors.SensorRotationMatrix
  // DualAPI
  // Implements: Windows.Devices.Sensors.ISensorRotationMatrix

  // Windows.Devices.Sensors.SensorQuaternion
  // DualAPI
  // Implements: Windows.Devices.Sensors.ISensorQuaternion

  // Windows.Devices.Sensors.OrientationSensor
  // DualAPI
  // Implements: Windows.Devices.Sensors.IOrientationSensor
  // Implements: Windows.Devices.Sensors.IOrientationSensorDeviceId
  // Implements: Windows.Devices.Sensors.IOrientationSensor2
  // Implements: Windows.Devices.Sensors.IOrientationSensor3
  // Statics: "Windows.Devices.Sensors.IOrientationSensorStatics"
  // Statics: "Windows.Devices.Sensors.IOrientationSensorStatics2"
  // Statics: "Windows.Devices.Sensors.IOrientationSensorStatics3"
  // Statics: "Windows.Devices.Sensors.IOrientationSensorStatics4"
  TOrientationSensor = class(TWinRTGenericImportS4<IOrientationSensorStatics, IOrientationSensorStatics2, IOrientationSensorStatics3, IOrientationSensorStatics4>)
  public
    // -> IOrientationSensorStatics
    class function GetDefault: IOrientationSensor; overload; static; inline;

    // -> IOrientationSensorStatics2
    class function GetDefaultForRelativeReadings: IOrientationSensor; static; inline;

    // -> IOrientationSensorStatics3
    class function GetDefault(sensorReadingtype: SensorReadingType): IOrientationSensor; overload; static; inline;
    class function GetDefault(sensorReadingType: SensorReadingType; optimizationGoal: SensorOptimizationGoal): IOrientationSensor; overload; static; inline;

    // -> IOrientationSensorStatics4
    class function GetDeviceSelector(readingType: SensorReadingType): HSTRING; overload; static; inline;
    class function GetDeviceSelector(readingType: SensorReadingType; optimizationGoal: SensorOptimizationGoal): HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IOrientationSensor; static; inline;
  end;

  // Windows.Devices.Sensors.OrientationSensorReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IOrientationSensorReading
  // Implements: Windows.Devices.Sensors.IOrientationSensorReadingYawAccuracy
  // Implements: Windows.Devices.Sensors.IOrientationSensorReading2

  // Windows.Devices.Sensors.OrientationSensorReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IOrientationSensorReadingChangedEventArgs

  // Windows.Devices.Sensors.SimpleOrientationSensor
  // DualAPI
  // Implements: Windows.Devices.Sensors.ISimpleOrientationSensor
  // Implements: Windows.Devices.Sensors.ISimpleOrientationSensorDeviceId
  // Implements: Windows.Devices.Sensors.ISimpleOrientationSensor2
  // Statics: "Windows.Devices.Sensors.ISimpleOrientationSensorStatics"
  TSimpleOrientationSensor = class(TWinRTGenericImportS<ISimpleOrientationSensorStatics>)
  public
    // -> ISimpleOrientationSensorStatics
    class function GetDefault: ISimpleOrientationSensor; static; inline;
  end;

  // Windows.Devices.Sensors.SimpleOrientationSensorOrientationChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.ISimpleOrientationSensorOrientationChangedEventArgs

  // Windows.Devices.Sensors.Magnetometer
  // DualAPI
  // Implements: Windows.Devices.Sensors.IMagnetometer
  // Implements: Windows.Devices.Sensors.IMagnetometerDeviceId
  // Implements: Windows.Devices.Sensors.IMagnetometer2
  // Implements: Windows.Devices.Sensors.IMagnetometer3
  // Statics: "Windows.Devices.Sensors.IMagnetometerStatics"
  // Statics: "Windows.Devices.Sensors.IMagnetometerStatics2"
  TMagnetometer = class(TWinRTGenericImportS2<IMagnetometerStatics, IMagnetometerStatics2>)
  public
    // -> IMagnetometerStatics
    class function GetDefault: IMagnetometer; static; inline;

    // -> IMagnetometerStatics2
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IMagnetometer; static; inline;
  end;

  // Windows.Devices.Sensors.MagnetometerReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IMagnetometerReading
  // Implements: Windows.Devices.Sensors.IMagnetometerReading2

  // Windows.Devices.Sensors.MagnetometerReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IMagnetometerReadingChangedEventArgs

  // Windows.Devices.Sensors.ActivitySensor
  // DualAPI
  // Implements: Windows.Devices.Sensors.IActivitySensor
  // Statics: "Windows.Devices.Sensors.IActivitySensorStatics"
  TActivitySensor = class(TWinRTGenericImportS<IActivitySensorStatics>)
  public
    // -> IActivitySensorStatics
    class function GetDefaultAsync: IAsyncOperation_1__IActivitySensor; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IActivitySensor; static; inline;
    class function GetSystemHistoryAsync(fromTime: DateTime): IAsyncOperation_1__IVectorView_1__IActivitySensorReading; overload; static; inline;
    class function GetSystemHistoryAsync(fromTime: DateTime; duration: TimeSpan): IAsyncOperation_1__IVectorView_1__IActivitySensorReading; overload; static; inline;
  end;

  // Windows.Devices.Sensors.ActivitySensorReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IActivitySensorReading

  // Windows.Devices.Sensors.ActivitySensorReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IActivitySensorReadingChangedEventArgs

  // Windows.Devices.Sensors.ActivitySensorReadingChangeReport
  // DualAPI
  // Implements: Windows.Devices.Sensors.IActivitySensorReadingChangeReport

  // Windows.Devices.Sensors.Barometer
  // DualAPI
  // Implements: Windows.Devices.Sensors.IBarometer
  // Implements: Windows.Devices.Sensors.IBarometer2
  // Statics: "Windows.Devices.Sensors.IBarometerStatics"
  // Statics: "Windows.Devices.Sensors.IBarometerStatics2"
  TBarometer = class(TWinRTGenericImportS2<IBarometerStatics, IBarometerStatics2>)
  public
    // -> IBarometerStatics
    class function GetDefault: IBarometer; static; inline;

    // -> IBarometerStatics2
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBarometer; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
  end;

  // Windows.Devices.Sensors.BarometerReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IBarometerReading
  // Implements: Windows.Devices.Sensors.IBarometerReading2

  // Windows.Devices.Sensors.BarometerReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IBarometerReadingChangedEventArgs

  // Windows.Devices.Sensors.PedometerReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IPedometerReading

  // Windows.Devices.Sensors.Pedometer
  // DualAPI
  // Implements: Windows.Devices.Sensors.IPedometer
  // Implements: Windows.Devices.Sensors.IPedometer2
  // Statics: "Windows.Devices.Sensors.IPedometerStatics"
  // Statics: "Windows.Devices.Sensors.IPedometerStatics2"
  TPedometer = class(TWinRTGenericImportS2<IPedometerStatics, IPedometerStatics2>)
  public
    // -> IPedometerStatics
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IPedometer; static; inline;
    class function GetDefaultAsync: IAsyncOperation_1__IPedometer; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
    class function GetSystemHistoryAsync(fromTime: DateTime): IAsyncOperation_1__IVectorView_1__IPedometerReading; overload; static; inline;
    class function GetSystemHistoryAsync(fromTime: DateTime; duration: TimeSpan): IAsyncOperation_1__IVectorView_1__IPedometerReading; overload; static; inline;

    // -> IPedometerStatics2
    class function GetReadingsFromTriggerDetails(triggerDetails: ISensorDataThresholdTriggerDetails): IVectorView_1__IPedometerReading; static; inline;
  end;

  // Windows.Devices.Sensors.PedometerReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IPedometerReadingChangedEventArgs

  // Windows.Devices.Sensors.ProximitySensor
  // DualAPI
  // Implements: Windows.Devices.Sensors.IProximitySensor
  // Statics: "Windows.Devices.Sensors.IProximitySensorStatics2"
  // Statics: "Windows.Devices.Sensors.IProximitySensorStatics"
  TProximitySensor = class(TWinRTGenericImportS2<IProximitySensorStatics, IProximitySensorStatics2>)
  public
    // -> IProximitySensorStatics2
    class function GetReadingsFromTriggerDetails(triggerDetails: ISensorDataThresholdTriggerDetails): IVectorView_1__IProximitySensorReading; static; inline;

    // -> IProximitySensorStatics
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromId(sensorId: HSTRING): IProximitySensor; static; inline;
  end;

  // Windows.Devices.Sensors.ProximitySensorReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IProximitySensorReading

  // Windows.Devices.Sensors.ProximitySensorReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IProximitySensorReadingChangedEventArgs

  // Windows.Devices.Sensors.ProximitySensorDisplayOnOffController
  // DualAPI
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Sensors.Altimeter
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAltimeter
  // Implements: Windows.Devices.Sensors.IAltimeter2
  // Statics: "Windows.Devices.Sensors.IAltimeterStatics"
  TAltimeter = class(TWinRTGenericImportS<IAltimeterStatics>)
  public
    // -> IAltimeterStatics
    class function GetDefault: IAltimeter; static; inline;
  end;

  // Windows.Devices.Sensors.AltimeterReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAltimeterReading
  // Implements: Windows.Devices.Sensors.IAltimeterReading2

  // Windows.Devices.Sensors.AltimeterReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.IAltimeterReadingChangedEventArgs

  // Windows.Devices.Sensors.Custom.CustomSensor
  // DualAPI
  // Implements: Windows.Devices.Sensors.Custom.ICustomSensor
  // Implements: Windows.Devices.Sensors.Custom.ICustomSensor2
  // Statics: "Windows.Devices.Sensors.Custom.ICustomSensorStatics"
  TCustom_CustomSensor = class(TWinRTGenericImportS<Custom_ICustomSensorStatics>)
  public
    // -> Custom_ICustomSensorStatics
    class function GetDeviceSelector(interfaceId: TGuid): HSTRING; static; inline;
    class function FromIdAsync(sensorId: HSTRING): IAsyncOperation_1__Custom_ICustomSensor; static; inline;
  end;

  // Windows.Devices.Sensors.Custom.CustomSensorReading
  // DualAPI
  // Implements: Windows.Devices.Sensors.Custom.ICustomSensorReading
  // Implements: Windows.Devices.Sensors.Custom.ICustomSensorReading2

  // Windows.Devices.Sensors.Custom.CustomSensorReadingChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Sensors.Custom.ICustomSensorReadingChangedEventArgs


implementation

  // Emit Classes Implementation
 { TAccelerometer }

class function TAccelerometer.GetDefault: IAccelerometer;
begin
  Result := Statics.GetDefault;
end;


class function TAccelerometer.GetDefault(readingType: AccelerometerReadingType): IAccelerometer;
begin
  Result := Statics2.GetDefault(readingType);
end;


class function TAccelerometer.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IAccelerometer;
begin
  Result := Statics3.FromIdAsync(deviceId);
end;

class function TAccelerometer.GetDeviceSelector(readingType: AccelerometerReadingType): HSTRING;
begin
  Result := Statics3.GetDeviceSelector(readingType);
end;


 { TInclinometer }

class function TInclinometer.GetDefault: IInclinometer;
begin
  Result := Statics.GetDefault;
end;


class function TInclinometer.GetDefaultForRelativeReadings: IInclinometer;
begin
  Result := Statics2.GetDefaultForRelativeReadings;
end;


class function TInclinometer.GetDefault(sensorReadingtype: SensorReadingType): IInclinometer;
begin
  Result := Statics3.GetDefault(sensorReadingtype);
end;


class function TInclinometer.GetDeviceSelector(readingType: SensorReadingType): HSTRING;
begin
  Result := Statics4.GetDeviceSelector(readingType);
end;

class function TInclinometer.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IInclinometer;
begin
  Result := Statics4.FromIdAsync(deviceId);
end;


 { TGyrometer }

class function TGyrometer.GetDefault: IGyrometer;
begin
  Result := Statics.GetDefault;
end;


class function TGyrometer.GetDeviceSelector: HSTRING;
begin
  Result := Statics2.GetDeviceSelector;
end;

class function TGyrometer.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IGyrometer;
begin
  Result := Statics2.FromIdAsync(deviceId);
end;


 { TCompass }

class function TCompass.GetDefault: ICompass;
begin
  Result := Statics.GetDefault;
end;


class function TCompass.GetDeviceSelector: HSTRING;
begin
  Result := Statics2.GetDeviceSelector;
end;

class function TCompass.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ICompass;
begin
  Result := Statics2.FromIdAsync(deviceId);
end;


 { TLightSensor }

class function TLightSensor.GetDefault: ILightSensor;
begin
  Result := Statics.GetDefault;
end;


class function TLightSensor.GetDeviceSelector: HSTRING;
begin
  Result := Statics2.GetDeviceSelector;
end;

class function TLightSensor.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__ILightSensor;
begin
  Result := Statics2.FromIdAsync(deviceId);
end;


 { TOrientationSensor }

class function TOrientationSensor.GetDefault: IOrientationSensor;
begin
  Result := Statics.GetDefault;
end;


class function TOrientationSensor.GetDefaultForRelativeReadings: IOrientationSensor;
begin
  Result := Statics2.GetDefaultForRelativeReadings;
end;


class function TOrientationSensor.GetDefault(sensorReadingtype: SensorReadingType): IOrientationSensor;
begin
  Result := Statics3.GetDefault(sensorReadingtype);
end;

class function TOrientationSensor.GetDefault(sensorReadingType: SensorReadingType; optimizationGoal: SensorOptimizationGoal): IOrientationSensor;
begin
  Result := Statics3.GetDefault(sensorReadingType, optimizationGoal);
end;


class function TOrientationSensor.GetDeviceSelector(readingType: SensorReadingType): HSTRING;
begin
  Result := Statics4.GetDeviceSelector(readingType);
end;

class function TOrientationSensor.GetDeviceSelector(readingType: SensorReadingType; optimizationGoal: SensorOptimizationGoal): HSTRING;
begin
  Result := Statics4.GetDeviceSelector(readingType, optimizationGoal);
end;

class function TOrientationSensor.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IOrientationSensor;
begin
  Result := Statics4.FromIdAsync(deviceId);
end;


 { TSimpleOrientationSensor }

class function TSimpleOrientationSensor.GetDefault: ISimpleOrientationSensor;
begin
  Result := Statics.GetDefault;
end;


 { TMagnetometer }

class function TMagnetometer.GetDefault: IMagnetometer;
begin
  Result := Statics.GetDefault;
end;


class function TMagnetometer.GetDeviceSelector: HSTRING;
begin
  Result := Statics2.GetDeviceSelector;
end;

class function TMagnetometer.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IMagnetometer;
begin
  Result := Statics2.FromIdAsync(deviceId);
end;


 { TActivitySensor }

class function TActivitySensor.GetDefaultAsync: IAsyncOperation_1__IActivitySensor;
begin
  Result := Statics.GetDefaultAsync;
end;

class function TActivitySensor.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TActivitySensor.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IActivitySensor;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TActivitySensor.GetSystemHistoryAsync(fromTime: DateTime): IAsyncOperation_1__IVectorView_1__IActivitySensorReading;
begin
  Result := Statics.GetSystemHistoryAsync(fromTime);
end;

class function TActivitySensor.GetSystemHistoryAsync(fromTime: DateTime; duration: TimeSpan): IAsyncOperation_1__IVectorView_1__IActivitySensorReading;
begin
  Result := Statics.GetSystemHistoryAsync(fromTime, duration);
end;


 { TBarometer }

class function TBarometer.GetDefault: IBarometer;
begin
  Result := Statics.GetDefault;
end;


class function TBarometer.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IBarometer;
begin
  Result := Statics2.FromIdAsync(deviceId);
end;

class function TBarometer.GetDeviceSelector: HSTRING;
begin
  Result := Statics2.GetDeviceSelector;
end;


 { TPedometer }

class function TPedometer.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__IPedometer;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TPedometer.GetDefaultAsync: IAsyncOperation_1__IPedometer;
begin
  Result := Statics.GetDefaultAsync;
end;

class function TPedometer.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TPedometer.GetSystemHistoryAsync(fromTime: DateTime): IAsyncOperation_1__IVectorView_1__IPedometerReading;
begin
  Result := Statics.GetSystemHistoryAsync(fromTime);
end;

class function TPedometer.GetSystemHistoryAsync(fromTime: DateTime; duration: TimeSpan): IAsyncOperation_1__IVectorView_1__IPedometerReading;
begin
  Result := Statics.GetSystemHistoryAsync(fromTime, duration);
end;


class function TPedometer.GetReadingsFromTriggerDetails(triggerDetails: ISensorDataThresholdTriggerDetails): IVectorView_1__IPedometerReading;
begin
  Result := Statics2.GetReadingsFromTriggerDetails(triggerDetails);
end;


 { TProximitySensor }

class function TProximitySensor.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TProximitySensor.FromId(sensorId: HSTRING): IProximitySensor;
begin
  Result := Statics.FromId(sensorId);
end;


class function TProximitySensor.GetReadingsFromTriggerDetails(triggerDetails: ISensorDataThresholdTriggerDetails): IVectorView_1__IProximitySensorReading;
begin
  Result := Statics2.GetReadingsFromTriggerDetails(triggerDetails);
end;


 { TAltimeter }

class function TAltimeter.GetDefault: IAltimeter;
begin
  Result := Statics.GetDefault;
end;


 { TCustom_CustomSensor }

class function TCustom_CustomSensor.GetDeviceSelector(interfaceId: TGuid): HSTRING;
begin
  Result := Statics.GetDeviceSelector(interfaceId);
end;

class function TCustom_CustomSensor.FromIdAsync(sensorId: HSTRING): IAsyncOperation_1__Custom_ICustomSensor;
begin
  Result := Statics.FromIdAsync(sensorId);
end;



end.
