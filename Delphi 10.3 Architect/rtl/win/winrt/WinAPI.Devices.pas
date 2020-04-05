{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Devices;

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
  Winapi.ServicesRT, 
  Winapi.Foundation, 
  Winapi.Media, 
  Winapi.Media.Devices, 
  Winapi.Storage.Streams, 
  Winapi.Security.Credentials, 
  Winapi.Networking, 
  Winapi.Networking.Sockets, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.PointerDeviceUsage>
  IIterator_1__Input_PointerDeviceUsage = interface;
  PIIterator_1__Input_PointerDeviceUsage = ^IIterator_1__Input_PointerDeviceUsage;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Input.PointerDeviceUsage>
  IIterable_1__Input_PointerDeviceUsage = interface;
  PIIterable_1__Input_PointerDeviceUsage = ^IIterable_1__Input_PointerDeviceUsage;

  // Windows.Devices.Custom.IIOControlCode
  Custom_IIOControlCode = interface;
  PCustom_IIOControlCode = ^Custom_IIOControlCode;

  // Windows.Devices.Custom.IIOControlCodeFactory
  Custom_IIOControlCodeFactory = interface;
  PCustom_IIOControlCodeFactory = ^Custom_IIOControlCodeFactory;

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

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // Windows.Devices.Custom.ICustomDevice
  Custom_ICustomDevice = interface;
  PCustom_ICustomDevice = ^Custom_ICustomDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Custom.ICustomDevice>
  AsyncOperationCompletedHandler_1__Custom_ICustomDevice = interface;
  PAsyncOperationCompletedHandler_1__Custom_ICustomDevice = ^AsyncOperationCompletedHandler_1__Custom_ICustomDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Custom.ICustomDevice>
  IAsyncOperation_1__Custom_ICustomDevice = interface;
  PIAsyncOperation_1__Custom_ICustomDevice = ^IAsyncOperation_1__Custom_ICustomDevice;

  // Windows.Devices.Custom.ICustomDeviceStatics
  Custom_ICustomDeviceStatics = interface;
  PCustom_ICustomDeviceStatics = ^Custom_ICustomDeviceStatics;

  // Windows.Devices.Adc.Provider.IAdcControllerProvider
  Adc_Provider_IAdcControllerProvider = interface;
  PAdc_Provider_IAdcControllerProvider = ^Adc_Provider_IAdcControllerProvider;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IIterator_1__Adc_Provider_IAdcControllerProvider = interface;
  PIIterator_1__Adc_Provider_IAdcControllerProvider = ^IIterator_1__Adc_Provider_IAdcControllerProvider;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IIterable_1__Adc_Provider_IAdcControllerProvider = interface;
  PIIterable_1__Adc_Provider_IAdcControllerProvider = ^IIterable_1__Adc_Provider_IAdcControllerProvider;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IVectorView_1__Adc_Provider_IAdcControllerProvider = interface;
  PIVectorView_1__Adc_Provider_IAdcControllerProvider = ^IVectorView_1__Adc_Provider_IAdcControllerProvider;

  // Windows.Devices.Adc.Provider.IAdcProvider
  Adc_Provider_IAdcProvider = interface;
  PAdc_Provider_IAdcProvider = ^Adc_Provider_IAdcProvider;

  // Windows.Devices.Adc.IAdcChannel
  Adc_IAdcChannel = interface;
  PAdc_IAdcChannel = ^Adc_IAdcChannel;

  // Windows.Devices.Adc.IAdcController
  Adc_IAdcController = interface;
  PAdc_IAdcController = ^Adc_IAdcController;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.IAdcController>
  IIterator_1__Adc_IAdcController = interface;
  PIIterator_1__Adc_IAdcController = ^IIterator_1__Adc_IAdcController;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Adc.IAdcController>
  IIterable_1__Adc_IAdcController = interface;
  PIIterable_1__Adc_IAdcController = ^IIterable_1__Adc_IAdcController;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>
  IVectorView_1__Adc_IAdcController = interface;
  PIVectorView_1__Adc_IAdcController = ^IVectorView_1__Adc_IAdcController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController = ^AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  IAsyncOperation_1__IVectorView_1__Adc_IAdcController = interface;
  PIAsyncOperation_1__IVectorView_1__Adc_IAdcController = ^IAsyncOperation_1__IVectorView_1__Adc_IAdcController;

  // Windows.Devices.Adc.IAdcControllerStatics
  Adc_IAdcControllerStatics = interface;
  PAdc_IAdcControllerStatics = ^Adc_IAdcControllerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Adc.IAdcController>
  AsyncOperationCompletedHandler_1__Adc_IAdcController = interface;
  PAsyncOperationCompletedHandler_1__Adc_IAdcController = ^AsyncOperationCompletedHandler_1__Adc_IAdcController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Adc.IAdcController>
  IAsyncOperation_1__Adc_IAdcController = interface;
  PIAsyncOperation_1__Adc_IAdcController = ^IAsyncOperation_1__Adc_IAdcController;

  // Windows.Devices.Adc.IAdcControllerStatics2
  Adc_IAdcControllerStatics2 = interface;
  PAdc_IAdcControllerStatics2 = ^Adc_IAdcControllerStatics2;

  // Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
  Gpio_Provider_IGpioPinProviderValueChangedEventArgs = interface;
  PGpio_Provider_IGpioPinProviderValueChangedEventArgs = ^Gpio_Provider_IGpioPinProviderValueChangedEventArgs;

  // Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgsFactory
  Gpio_Provider_IGpioPinProviderValueChangedEventArgsFactory = interface;
  PGpio_Provider_IGpioPinProviderValueChangedEventArgsFactory = ^Gpio_Provider_IGpioPinProviderValueChangedEventArgsFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.Provider.IGpioPinProvider,Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs>
  TypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs = interface;
  PTypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs = ^TypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs;

  // Windows.Devices.Gpio.Provider.IGpioPinProvider
  Gpio_Provider_IGpioPinProvider = interface;
  PGpio_Provider_IGpioPinProvider = ^Gpio_Provider_IGpioPinProvider;

  // Windows.Devices.Gpio.Provider.IGpioControllerProvider
  Gpio_Provider_IGpioControllerProvider = interface;
  PGpio_Provider_IGpioControllerProvider = ^Gpio_Provider_IGpioControllerProvider;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IIterator_1__Gpio_Provider_IGpioControllerProvider = interface;
  PIIterator_1__Gpio_Provider_IGpioControllerProvider = ^IIterator_1__Gpio_Provider_IGpioControllerProvider;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IIterable_1__Gpio_Provider_IGpioControllerProvider = interface;
  PIIterable_1__Gpio_Provider_IGpioControllerProvider = ^IIterable_1__Gpio_Provider_IGpioControllerProvider;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IVectorView_1__Gpio_Provider_IGpioControllerProvider = interface;
  PIVectorView_1__Gpio_Provider_IGpioControllerProvider = ^IVectorView_1__Gpio_Provider_IGpioControllerProvider;

  // Windows.Devices.Gpio.Provider.IGpioProvider
  Gpio_Provider_IGpioProvider = interface;
  PGpio_Provider_IGpioProvider = ^Gpio_Provider_IGpioProvider;

  // Windows.Devices.Gpio.IGpioPinValueChangedEventArgs
  Gpio_IGpioPinValueChangedEventArgs = interface;
  PGpio_IGpioPinValueChangedEventArgs = ^Gpio_IGpioPinValueChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.IGpioPin,Windows.Devices.Gpio.IGpioPinValueChangedEventArgs>
  TypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs = interface;
  PTypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs = ^TypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs;

  // Windows.Devices.Gpio.IGpioPin
  Gpio_IGpioPin = interface;
  PGpio_IGpioPin = ^Gpio_IGpioPin;

  // Windows.Devices.Gpio.IGpioController
  Gpio_IGpioController = interface;
  PGpio_IGpioController = ^Gpio_IGpioController;

  // Windows.Devices.Gpio.IGpioControllerStatics
  Gpio_IGpioControllerStatics = interface;
  PGpio_IGpioControllerStatics = ^Gpio_IGpioControllerStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.IGpioController>
  IIterator_1__Gpio_IGpioController = interface;
  PIIterator_1__Gpio_IGpioController = ^IIterator_1__Gpio_IGpioController;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.IGpioController>
  IIterable_1__Gpio_IGpioController = interface;
  PIIterable_1__Gpio_IGpioController = ^IIterable_1__Gpio_IGpioController;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>
  IVectorView_1__Gpio_IGpioController = interface;
  PIVectorView_1__Gpio_IGpioController = ^IVectorView_1__Gpio_IGpioController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController = ^AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  IAsyncOperation_1__IVectorView_1__Gpio_IGpioController = interface;
  PIAsyncOperation_1__IVectorView_1__Gpio_IGpioController = ^IAsyncOperation_1__IVectorView_1__Gpio_IGpioController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Gpio.IGpioController>
  AsyncOperationCompletedHandler_1__Gpio_IGpioController = interface;
  PAsyncOperationCompletedHandler_1__Gpio_IGpioController = ^AsyncOperationCompletedHandler_1__Gpio_IGpioController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Gpio.IGpioController>
  IAsyncOperation_1__Gpio_IGpioController = interface;
  PIAsyncOperation_1__Gpio_IGpioController = ^IAsyncOperation_1__Gpio_IGpioController;

  // Windows.Devices.Gpio.IGpioControllerStatics2
  Gpio_IGpioControllerStatics2 = interface;
  PGpio_IGpioControllerStatics2 = ^Gpio_IGpioControllerStatics2;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.GpioChangeRecord>
  IIterator_1__Gpio_GpioChangeRecord = interface;
  PIIterator_1__Gpio_GpioChangeRecord = ^IIterator_1__Gpio_GpioChangeRecord;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.GpioChangeRecord>
  IIterable_1__Gpio_GpioChangeRecord = interface;
  PIIterable_1__Gpio_GpioChangeRecord = ^IIterable_1__Gpio_GpioChangeRecord;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.GpioChangeRecord>
  IVectorView_1__Gpio_GpioChangeRecord = interface;
  PIVectorView_1__Gpio_GpioChangeRecord = ^IVectorView_1__Gpio_GpioChangeRecord;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Gpio.GpioChangeRecord>
  IVector_1__Gpio_GpioChangeRecord = interface;
  PIVector_1__Gpio_GpioChangeRecord = ^IVector_1__Gpio_GpioChangeRecord;

  // Windows.Devices.Gpio.IGpioChangeReader
  Gpio_IGpioChangeReader = interface;
  PGpio_IGpioChangeReader = ^Gpio_IGpioChangeReader;

  // Windows.Devices.Gpio.IGpioChangeReaderFactory
  Gpio_IGpioChangeReaderFactory = interface;
  PGpio_IGpioChangeReaderFactory = ^Gpio_IGpioChangeReaderFactory;

  // Windows.Devices.Gpio.IGpioChangeCounter
  Gpio_IGpioChangeCounter = interface;
  PGpio_IGpioChangeCounter = ^Gpio_IGpioChangeCounter;

  // Windows.Devices.Gpio.IGpioChangeCounterFactory
  Gpio_IGpioChangeCounterFactory = interface;
  PGpio_IGpioChangeCounterFactory = ^Gpio_IGpioChangeCounterFactory;

  // Windows.Devices.I2c.Provider.IProviderI2cConnectionSettings
  I2c_Provider_IProviderI2cConnectionSettings = interface;
  PI2c_Provider_IProviderI2cConnectionSettings = ^I2c_Provider_IProviderI2cConnectionSettings;

  // Windows.Devices.I2c.Provider.II2cDeviceProvider
  I2c_Provider_II2cDeviceProvider = interface;
  PI2c_Provider_II2cDeviceProvider = ^I2c_Provider_II2cDeviceProvider;

  // Windows.Devices.I2c.Provider.II2cControllerProvider
  I2c_Provider_II2cControllerProvider = interface;
  PI2c_Provider_II2cControllerProvider = ^I2c_Provider_II2cControllerProvider;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IIterator_1__I2c_Provider_II2cControllerProvider = interface;
  PIIterator_1__I2c_Provider_II2cControllerProvider = ^IIterator_1__I2c_Provider_II2cControllerProvider;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IIterable_1__I2c_Provider_II2cControllerProvider = interface;
  PIIterable_1__I2c_Provider_II2cControllerProvider = ^IIterable_1__I2c_Provider_II2cControllerProvider;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IVectorView_1__I2c_Provider_II2cControllerProvider = interface;
  PIVectorView_1__I2c_Provider_II2cControllerProvider = ^IVectorView_1__I2c_Provider_II2cControllerProvider;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider = ^AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider = interface;
  PIAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider = ^IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider;

  // Windows.Devices.I2c.Provider.II2cProvider
  I2c_Provider_II2cProvider = interface;
  PI2c_Provider_II2cProvider = ^I2c_Provider_II2cProvider;

  // Windows.Devices.I2c.II2cConnectionSettings
  I2c_II2cConnectionSettings = interface;
  PI2c_II2cConnectionSettings = ^I2c_II2cConnectionSettings;

  // Windows.Devices.I2c.II2cConnectionSettingsFactory
  I2c_II2cConnectionSettingsFactory = interface;
  PI2c_II2cConnectionSettingsFactory = ^I2c_II2cConnectionSettingsFactory;

  // Windows.Devices.I2c.II2cDevice
  I2c_II2cDevice = interface;
  PI2c_II2cDevice = ^I2c_II2cDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cDevice>
  AsyncOperationCompletedHandler_1__I2c_II2cDevice = interface;
  PAsyncOperationCompletedHandler_1__I2c_II2cDevice = ^AsyncOperationCompletedHandler_1__I2c_II2cDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cDevice>
  IAsyncOperation_1__I2c_II2cDevice = interface;
  PIAsyncOperation_1__I2c_II2cDevice = ^IAsyncOperation_1__I2c_II2cDevice;

  // Windows.Devices.I2c.II2cDeviceStatics
  I2c_II2cDeviceStatics = interface;
  PI2c_II2cDeviceStatics = ^I2c_II2cDeviceStatics;

  // Windows.Devices.I2c.II2cController
  I2c_II2cController = interface;
  PI2c_II2cController = ^I2c_II2cController;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.II2cController>
  IIterator_1__I2c_II2cController = interface;
  PIIterator_1__I2c_II2cController = ^IIterator_1__I2c_II2cController;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.I2c.II2cController>
  IIterable_1__I2c_II2cController = interface;
  PIIterable_1__I2c_II2cController = ^IIterable_1__I2c_II2cController;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>
  IVectorView_1__I2c_II2cController = interface;
  PIVectorView_1__I2c_II2cController = ^IVectorView_1__I2c_II2cController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController = ^AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  IAsyncOperation_1__IVectorView_1__I2c_II2cController = interface;
  PIAsyncOperation_1__IVectorView_1__I2c_II2cController = ^IAsyncOperation_1__IVectorView_1__I2c_II2cController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cController>
  AsyncOperationCompletedHandler_1__I2c_II2cController = interface;
  PAsyncOperationCompletedHandler_1__I2c_II2cController = ^AsyncOperationCompletedHandler_1__I2c_II2cController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cController>
  IAsyncOperation_1__I2c_II2cController = interface;
  PIAsyncOperation_1__I2c_II2cController = ^IAsyncOperation_1__I2c_II2cController;

  // Windows.Devices.I2c.II2cControllerStatics
  I2c_II2cControllerStatics = interface;
  PI2c_II2cControllerStatics = ^I2c_II2cControllerStatics;

  // Windows.Devices.Pwm.Provider.IPwmControllerProvider
  Pwm_Provider_IPwmControllerProvider = interface;
  PPwm_Provider_IPwmControllerProvider = ^Pwm_Provider_IPwmControllerProvider;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IIterator_1__Pwm_Provider_IPwmControllerProvider = interface;
  PIIterator_1__Pwm_Provider_IPwmControllerProvider = ^IIterator_1__Pwm_Provider_IPwmControllerProvider;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IIterable_1__Pwm_Provider_IPwmControllerProvider = interface;
  PIIterable_1__Pwm_Provider_IPwmControllerProvider = ^IIterable_1__Pwm_Provider_IPwmControllerProvider;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IVectorView_1__Pwm_Provider_IPwmControllerProvider = interface;
  PIVectorView_1__Pwm_Provider_IPwmControllerProvider = ^IVectorView_1__Pwm_Provider_IPwmControllerProvider;

  // Windows.Devices.Pwm.Provider.IPwmProvider
  Pwm_Provider_IPwmProvider = interface;
  PPwm_Provider_IPwmProvider = ^Pwm_Provider_IPwmProvider;

  // Windows.Devices.Pwm.IPwmPin
  Pwm_IPwmPin = interface;
  PPwm_IPwmPin = ^Pwm_IPwmPin;

  // Windows.Devices.Pwm.IPwmController
  Pwm_IPwmController = interface;
  PPwm_IPwmController = ^Pwm_IPwmController;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.IPwmController>
  IIterator_1__Pwm_IPwmController = interface;
  PIIterator_1__Pwm_IPwmController = ^IIterator_1__Pwm_IPwmController;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Pwm.IPwmController>
  IIterable_1__Pwm_IPwmController = interface;
  PIIterable_1__Pwm_IPwmController = ^IIterable_1__Pwm_IPwmController;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>
  IVectorView_1__Pwm_IPwmController = interface;
  PIVectorView_1__Pwm_IPwmController = ^IVectorView_1__Pwm_IPwmController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController = ^AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  IAsyncOperation_1__IVectorView_1__Pwm_IPwmController = interface;
  PIAsyncOperation_1__IVectorView_1__Pwm_IPwmController = ^IAsyncOperation_1__IVectorView_1__Pwm_IPwmController;

  // Windows.Devices.Pwm.IPwmControllerStatics
  Pwm_IPwmControllerStatics = interface;
  PPwm_IPwmControllerStatics = ^Pwm_IPwmControllerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Pwm.IPwmController>
  AsyncOperationCompletedHandler_1__Pwm_IPwmController = interface;
  PAsyncOperationCompletedHandler_1__Pwm_IPwmController = ^AsyncOperationCompletedHandler_1__Pwm_IPwmController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Pwm.IPwmController>
  IAsyncOperation_1__Pwm_IPwmController = interface;
  PIAsyncOperation_1__Pwm_IPwmController = ^IAsyncOperation_1__Pwm_IPwmController;

  // Windows.Devices.Pwm.IPwmControllerStatics2
  Pwm_IPwmControllerStatics2 = interface;
  PPwm_IPwmControllerStatics2 = ^Pwm_IPwmControllerStatics2;

  // Windows.Devices.Pwm.IPwmControllerStatics3
  Pwm_IPwmControllerStatics3 = interface;
  PPwm_IPwmControllerStatics3 = ^Pwm_IPwmControllerStatics3;

  // Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
  Spi_Provider_IProviderSpiConnectionSettings = interface;
  PSpi_Provider_IProviderSpiConnectionSettings = ^Spi_Provider_IProviderSpiConnectionSettings;

  // Windows.Devices.Spi.Provider.IProviderSpiConnectionSettingsFactory
  Spi_Provider_IProviderSpiConnectionSettingsFactory = interface;
  PSpi_Provider_IProviderSpiConnectionSettingsFactory = ^Spi_Provider_IProviderSpiConnectionSettingsFactory;

  // Windows.Devices.Spi.Provider.ISpiDeviceProvider
  Spi_Provider_ISpiDeviceProvider = interface;
  PSpi_Provider_ISpiDeviceProvider = ^Spi_Provider_ISpiDeviceProvider;

  // Windows.Devices.Spi.Provider.ISpiControllerProvider
  Spi_Provider_ISpiControllerProvider = interface;
  PSpi_Provider_ISpiControllerProvider = ^Spi_Provider_ISpiControllerProvider;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IIterator_1__Spi_Provider_ISpiControllerProvider = interface;
  PIIterator_1__Spi_Provider_ISpiControllerProvider = ^IIterator_1__Spi_Provider_ISpiControllerProvider;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IIterable_1__Spi_Provider_ISpiControllerProvider = interface;
  PIIterable_1__Spi_Provider_ISpiControllerProvider = ^IIterable_1__Spi_Provider_ISpiControllerProvider;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IVectorView_1__Spi_Provider_ISpiControllerProvider = interface;
  PIVectorView_1__Spi_Provider_ISpiControllerProvider = ^IVectorView_1__Spi_Provider_ISpiControllerProvider;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider = ^AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider = interface;
  PIAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider = ^IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider;

  // Windows.Devices.Spi.Provider.ISpiProvider
  Spi_Provider_ISpiProvider = interface;
  PSpi_Provider_ISpiProvider = ^Spi_Provider_ISpiProvider;

  // Windows.Devices.Spi.ISpiConnectionSettings
  Spi_ISpiConnectionSettings = interface;
  PSpi_ISpiConnectionSettings = ^Spi_ISpiConnectionSettings;

  // Windows.Devices.Spi.ISpiConnectionSettingsFactory
  Spi_ISpiConnectionSettingsFactory = interface;
  PSpi_ISpiConnectionSettingsFactory = ^Spi_ISpiConnectionSettingsFactory;

  // Windows.Foundation.Collections.IIterator`1<Int32>
  IIterator_1__Integer = interface;
  PIIterator_1__Integer = ^IIterator_1__Integer;

  // Windows.Foundation.Collections.IIterable`1<Int32>
  IIterable_1__Integer = interface;
  PIIterable_1__Integer = ^IIterable_1__Integer;

  // Windows.Foundation.Collections.IVectorView`1<Int32>
  IVectorView_1__Integer = interface;
  PIVectorView_1__Integer = ^IVectorView_1__Integer;

  // Windows.Devices.Spi.ISpiBusInfo
  Spi_ISpiBusInfo = interface;
  PSpi_ISpiBusInfo = ^Spi_ISpiBusInfo;

  // Windows.Devices.Spi.ISpiDevice
  Spi_ISpiDevice = interface;
  PSpi_ISpiDevice = ^Spi_ISpiDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiDevice>
  AsyncOperationCompletedHandler_1__Spi_ISpiDevice = interface;
  PAsyncOperationCompletedHandler_1__Spi_ISpiDevice = ^AsyncOperationCompletedHandler_1__Spi_ISpiDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiDevice>
  IAsyncOperation_1__Spi_ISpiDevice = interface;
  PIAsyncOperation_1__Spi_ISpiDevice = ^IAsyncOperation_1__Spi_ISpiDevice;

  // Windows.Devices.Spi.ISpiDeviceStatics
  Spi_ISpiDeviceStatics = interface;
  PSpi_ISpiDeviceStatics = ^Spi_ISpiDeviceStatics;

  // Windows.Devices.Spi.ISpiController
  Spi_ISpiController = interface;
  PSpi_ISpiController = ^Spi_ISpiController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiController>
  AsyncOperationCompletedHandler_1__Spi_ISpiController = interface;
  PAsyncOperationCompletedHandler_1__Spi_ISpiController = ^AsyncOperationCompletedHandler_1__Spi_ISpiController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiController>
  IAsyncOperation_1__Spi_ISpiController = interface;
  PIAsyncOperation_1__Spi_ISpiController = ^IAsyncOperation_1__Spi_ISpiController;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.ISpiController>
  IIterator_1__Spi_ISpiController = interface;
  PIIterator_1__Spi_ISpiController = ^IIterator_1__Spi_ISpiController;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Spi.ISpiController>
  IIterable_1__Spi_ISpiController = interface;
  PIIterable_1__Spi_ISpiController = ^IIterable_1__Spi_ISpiController;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>
  IVectorView_1__Spi_ISpiController = interface;
  PIVectorView_1__Spi_ISpiController = ^IVectorView_1__Spi_ISpiController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController = ^AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  IAsyncOperation_1__IVectorView_1__Spi_ISpiController = interface;
  PIAsyncOperation_1__IVectorView_1__Spi_ISpiController = ^IAsyncOperation_1__IVectorView_1__Spi_ISpiController;

  // Windows.Devices.Spi.ISpiControllerStatics
  Spi_ISpiControllerStatics = interface;
  PSpi_ISpiControllerStatics = ^Spi_ISpiControllerStatics;

  // Windows.Devices.ILowLevelDevicesAggregateProvider
  ILowLevelDevicesAggregateProvider = interface;
  PILowLevelDevicesAggregateProvider = ^ILowLevelDevicesAggregateProvider;

  // Windows.Devices.ILowLevelDevicesAggregateProviderFactory
  ILowLevelDevicesAggregateProviderFactory = interface;
  PILowLevelDevicesAggregateProviderFactory = ^ILowLevelDevicesAggregateProviderFactory;

  // Windows.Devices.ILowLevelDevicesController
  ILowLevelDevicesController = interface;
  PILowLevelDevicesController = ^ILowLevelDevicesController;

  // Windows.Devices.ILowLevelDevicesControllerStatics
  ILowLevelDevicesControllerStatics = interface;
  PILowLevelDevicesControllerStatics = ^ILowLevelDevicesControllerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus = interface;
  PAsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus = ^AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  IAsyncOperation_1__SmartCards_SmartCardReaderStatus = interface;
  PIAsyncOperation_1__SmartCards_SmartCardReaderStatus = ^IAsyncOperation_1__SmartCards_SmartCardReaderStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus = interface;
  PAsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus = ^AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardStatus>
  IAsyncOperation_1__SmartCards_SmartCardStatus = interface;
  PIAsyncOperation_1__SmartCards_SmartCardStatus = ^IAsyncOperation_1__SmartCards_SmartCardStatus;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult = interface;
  PAsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult = ^AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  IAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult = interface;
  PIAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult = ^IAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult;

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus = interface;
  PAsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus = ^AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  IAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus = interface;
  PIAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus = ^IAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IIterator_1__SmartCards_SmartCardCryptogramAlgorithm = interface;
  PIIterator_1__SmartCards_SmartCardCryptogramAlgorithm = ^IIterator_1__SmartCards_SmartCardCryptogramAlgorithm;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IIterable_1__SmartCards_SmartCardCryptogramAlgorithm = interface;
  PIIterable_1__SmartCards_SmartCardCryptogramAlgorithm = ^IIterable_1__SmartCards_SmartCardCryptogramAlgorithm;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IVectorView_1__SmartCards_SmartCardCryptogramAlgorithm = interface;
  PIVectorView_1__SmartCards_SmartCardCryptogramAlgorithm = ^IVectorView_1__SmartCards_SmartCardCryptogramAlgorithm;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = interface;
  PIIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = ^IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = interface;
  PIIterable_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = ^IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = interface;
  PIVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = ^IVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialType = interface;
  PIIterator_1__SmartCards_SmartCardCryptogramMaterialType = ^IIterator_1__SmartCards_SmartCardCryptogramMaterialType;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialType = interface;
  PIIterable_1__SmartCards_SmartCardCryptogramMaterialType = ^IIterable_1__SmartCards_SmartCardCryptogramMaterialType;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IVectorView_1__SmartCards_SmartCardCryptogramMaterialType = interface;
  PIVectorView_1__SmartCards_SmartCardCryptogramMaterialType = ^IVectorView_1__SmartCards_SmartCardCryptogramMaterialType;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = interface;
  PIIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = ^IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = interface;
  PIIterable_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = ^IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageFormat;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = interface;
  PIVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = ^IVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageFormat;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = interface;
  PIIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = ^IIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IIterable_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = interface;
  PIIterable_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = ^IIterable_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IVectorView_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = interface;
  PIVectorView_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = ^IVectorView_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  AsyncOperationCompletedHandler_1__TGuid = interface;
  PAsyncOperationCompletedHandler_1__TGuid = ^AsyncOperationCompletedHandler_1__TGuid;

  // Windows.Foundation.IAsyncOperation`1<Guid>
  IAsyncOperation_1__TGuid = interface;
  PIAsyncOperation_1__TGuid = ^IAsyncOperation_1__TGuid;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;

  // Windows.Devices.Power.IBatteryReport
  Power_IBatteryReport = interface;
  PPower_IBatteryReport = ^Power_IBatteryReport;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Power.IBattery,Object>
  TypedEventHandler_2__Power_IBattery__IInspectable = interface;
  PTypedEventHandler_2__Power_IBattery__IInspectable = ^TypedEventHandler_2__Power_IBattery__IInspectable;

  // Windows.Devices.Power.IBattery
  Power_IBattery = interface;
  PPower_IBattery = ^Power_IBattery;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Power.IBattery>
  AsyncOperationCompletedHandler_1__Power_IBattery = interface;
  PAsyncOperationCompletedHandler_1__Power_IBattery = ^AsyncOperationCompletedHandler_1__Power_IBattery;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Power.IBattery>
  IAsyncOperation_1__Power_IBattery = interface;
  PIAsyncOperation_1__Power_IBattery = ^IAsyncOperation_1__Power_IBattery;

  // Windows.Devices.Power.IBatteryStatics
  Power_IBatteryStatics = interface;
  PPower_IBatteryStatics = ^Power_IBatteryStatics;

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

  // Windows.Foundation.Collections.IVector`1<Int32>
  IVector_1__Integer = interface;
  PIVector_1__Integer = ^IVector_1__Integer;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer = interface;
  PAsyncOperationCompletedHandler_1__Integer = ^AsyncOperationCompletedHandler_1__Integer;

  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer = interface;
  PIAsyncOperation_1__Integer = ^IAsyncOperation_1__Integer;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

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

  // Windows.Foundation.IReference`1<Int16>
  IReference_1__SmallInt = interface;
  PIReference_1__SmallInt = ^IReference_1__SmallInt;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable = ^TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable = ^TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable = interface;
  PTypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable = ^TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable;

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

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Devices.Haptics.IKnownSimpleHapticsControllerWaveformsStatics
  Haptics_IKnownSimpleHapticsControllerWaveformsStatics = interface;
  PHaptics_IKnownSimpleHapticsControllerWaveformsStatics = ^Haptics_IKnownSimpleHapticsControllerWaveformsStatics;

  // Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
  Haptics_ISimpleHapticsControllerFeedback = interface;
  PHaptics_ISimpleHapticsControllerFeedback = ^Haptics_ISimpleHapticsControllerFeedback;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IIterator_1__Haptics_ISimpleHapticsControllerFeedback = interface;
  PIIterator_1__Haptics_ISimpleHapticsControllerFeedback = ^IIterator_1__Haptics_ISimpleHapticsControllerFeedback;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IIterable_1__Haptics_ISimpleHapticsControllerFeedback = interface;
  PIIterable_1__Haptics_ISimpleHapticsControllerFeedback = ^IIterable_1__Haptics_ISimpleHapticsControllerFeedback;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IVectorView_1__Haptics_ISimpleHapticsControllerFeedback = interface;
  PIVectorView_1__Haptics_ISimpleHapticsControllerFeedback = ^IVectorView_1__Haptics_ISimpleHapticsControllerFeedback;

  // Windows.Devices.Haptics.ISimpleHapticsController
  Haptics_ISimpleHapticsController = interface;
  PHaptics_ISimpleHapticsController = ^Haptics_ISimpleHapticsController;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.VibrationAccessStatus>
  AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus = ^AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.VibrationAccessStatus>
  IAsyncOperation_1__Haptics_VibrationAccessStatus = interface;
  PIAsyncOperation_1__Haptics_VibrationAccessStatus = ^IAsyncOperation_1__Haptics_VibrationAccessStatus;

  // Windows.Devices.Haptics.IVibrationDevice
  Haptics_IVibrationDevice = interface;
  PHaptics_IVibrationDevice = ^Haptics_IVibrationDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.IVibrationDevice>
  AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice = interface;
  PAsyncOperationCompletedHandler_1__Haptics_IVibrationDevice = ^AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.IVibrationDevice>
  IAsyncOperation_1__Haptics_IVibrationDevice = interface;
  PIAsyncOperation_1__Haptics_IVibrationDevice = ^IAsyncOperation_1__Haptics_IVibrationDevice;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.IVibrationDevice>
  IIterator_1__Haptics_IVibrationDevice = interface;
  PIIterator_1__Haptics_IVibrationDevice = ^IIterator_1__Haptics_IVibrationDevice;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.IVibrationDevice>
  IIterable_1__Haptics_IVibrationDevice = interface;
  PIIterable_1__Haptics_IVibrationDevice = ^IIterable_1__Haptics_IVibrationDevice;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>
  IVectorView_1__Haptics_IVibrationDevice = interface;
  PIVectorView_1__Haptics_IVibrationDevice = ^IVectorView_1__Haptics_IVibrationDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice = ^AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice = interface;
  PIAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice = ^IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice;

  // Windows.Devices.Haptics.IVibrationDeviceStatics
  Haptics_IVibrationDeviceStatics = interface;
  PHaptics_IVibrationDeviceStatics = ^Haptics_IVibrationDeviceStatics;

  // Windows.Devices.HumanInterfaceDevice.IHidCollection
  HumanInterfaceDevice_IHidCollection = interface;
  PHumanInterfaceDevice_IHidCollection = ^HumanInterfaceDevice_IHidCollection;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IIterator_1__HumanInterfaceDevice_IHidCollection = interface;
  PIIterator_1__HumanInterfaceDevice_IHidCollection = ^IIterator_1__HumanInterfaceDevice_IHidCollection;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IIterable_1__HumanInterfaceDevice_IHidCollection = interface;
  PIIterable_1__HumanInterfaceDevice_IHidCollection = ^IIterable_1__HumanInterfaceDevice_IHidCollection;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IVectorView_1__HumanInterfaceDevice_IHidCollection = interface;
  PIVectorView_1__HumanInterfaceDevice_IHidCollection = ^IVectorView_1__HumanInterfaceDevice_IHidCollection;

  // Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  HumanInterfaceDevice_IHidBooleanControlDescription = interface;
  PHumanInterfaceDevice_IHidBooleanControlDescription = ^HumanInterfaceDevice_IHidBooleanControlDescription;

  // Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  HumanInterfaceDevice_IHidBooleanControl = interface;
  PHumanInterfaceDevice_IHidBooleanControl = ^HumanInterfaceDevice_IHidBooleanControl;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IIterator_1__HumanInterfaceDevice_IHidBooleanControl = interface;
  PIIterator_1__HumanInterfaceDevice_IHidBooleanControl = ^IIterator_1__HumanInterfaceDevice_IHidBooleanControl;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IIterable_1__HumanInterfaceDevice_IHidBooleanControl = interface;
  PIIterable_1__HumanInterfaceDevice_IHidBooleanControl = ^IIterable_1__HumanInterfaceDevice_IHidBooleanControl;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IVectorView_1__HumanInterfaceDevice_IHidBooleanControl = interface;
  PIVectorView_1__HumanInterfaceDevice_IHidBooleanControl = ^IVectorView_1__HumanInterfaceDevice_IHidBooleanControl;

  // Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  HumanInterfaceDevice_IHidNumericControlDescription = interface;
  PHumanInterfaceDevice_IHidNumericControlDescription = ^HumanInterfaceDevice_IHidNumericControlDescription;

  // Windows.Devices.HumanInterfaceDevice.IHidNumericControl
  HumanInterfaceDevice_IHidNumericControl = interface;
  PHumanInterfaceDevice_IHidNumericControl = ^HumanInterfaceDevice_IHidNumericControl;

  // Windows.Devices.HumanInterfaceDevice.IHidInputReport
  HumanInterfaceDevice_IHidInputReport = interface;
  PHumanInterfaceDevice_IHidInputReport = ^HumanInterfaceDevice_IHidInputReport;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport = interface;
  PAsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport = ^AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport = interface;
  PIAsyncOperation_1__HumanInterfaceDevice_IHidInputReport = ^IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport;

  // Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
  HumanInterfaceDevice_IHidFeatureReport = interface;
  PHumanInterfaceDevice_IHidFeatureReport = ^HumanInterfaceDevice_IHidFeatureReport;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport = interface;
  PAsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport = ^AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport = interface;
  PIAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport = ^IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport;

  // Windows.Devices.HumanInterfaceDevice.IHidOutputReport
  HumanInterfaceDevice_IHidOutputReport = interface;
  PHumanInterfaceDevice_IHidOutputReport = ^HumanInterfaceDevice_IHidOutputReport;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription = interface;
  PIIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription = ^IIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IIterable_1__HumanInterfaceDevice_IHidBooleanControlDescription = interface;
  PIIterable_1__HumanInterfaceDevice_IHidBooleanControlDescription = ^IIterable_1__HumanInterfaceDevice_IHidBooleanControlDescription;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IVectorView_1__HumanInterfaceDevice_IHidBooleanControlDescription = interface;
  PIVectorView_1__HumanInterfaceDevice_IHidBooleanControlDescription = ^IVectorView_1__HumanInterfaceDevice_IHidBooleanControlDescription;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IIterator_1__HumanInterfaceDevice_IHidNumericControlDescription = interface;
  PIIterator_1__HumanInterfaceDevice_IHidNumericControlDescription = ^IIterator_1__HumanInterfaceDevice_IHidNumericControlDescription;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IIterable_1__HumanInterfaceDevice_IHidNumericControlDescription = interface;
  PIIterable_1__HumanInterfaceDevice_IHidNumericControlDescription = ^IIterable_1__HumanInterfaceDevice_IHidNumericControlDescription;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IVectorView_1__HumanInterfaceDevice_IHidNumericControlDescription = interface;
  PIVectorView_1__HumanInterfaceDevice_IHidNumericControlDescription = ^IVectorView_1__HumanInterfaceDevice_IHidNumericControlDescription;

  // Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs
  HumanInterfaceDevice_IHidInputReportReceivedEventArgs = interface;
  PHumanInterfaceDevice_IHidInputReportReceivedEventArgs = ^HumanInterfaceDevice_IHidInputReportReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.HumanInterfaceDevice.IHidDevice,Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs>
  TypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs = interface;
  PTypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs = ^TypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs;

  // Windows.Devices.HumanInterfaceDevice.IHidDevice
  HumanInterfaceDevice_IHidDevice = interface;
  PHumanInterfaceDevice_IHidDevice = ^HumanInterfaceDevice_IHidDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice = interface;
  PAsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice = ^AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  IAsyncOperation_1__HumanInterfaceDevice_IHidDevice = interface;
  PIAsyncOperation_1__HumanInterfaceDevice_IHidDevice = ^IAsyncOperation_1__HumanInterfaceDevice_IHidDevice;

  // Windows.Devices.HumanInterfaceDevice.IHidDeviceStatics
  HumanInterfaceDevice_IHidDeviceStatics = interface;
  PHumanInterfaceDevice_IHidDeviceStatics = ^HumanInterfaceDevice_IHidDeviceStatics;

  // Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription2
  HumanInterfaceDevice_IHidBooleanControlDescription2 = interface;
  PHumanInterfaceDevice_IHidBooleanControlDescription2 = ^HumanInterfaceDevice_IHidBooleanControlDescription2;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.IPointerDevice>
  IIterator_1__Input_IPointerDevice = interface;
  PIIterator_1__Input_IPointerDevice = ^IIterator_1__Input_IPointerDevice;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Input.IPointerDevice>
  IIterable_1__Input_IPointerDevice = interface;
  PIIterable_1__Input_IPointerDevice = ^IIterable_1__Input_IPointerDevice;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Input.IPointerDevice>
  IVectorView_1__Input_IPointerDevice = interface;
  PIVectorView_1__Input_IPointerDevice = ^IVectorView_1__Input_IPointerDevice;

  // Windows.Devices.Perception.Provider.IKnownPerceptionFrameKindStatics
  Perception_Provider_IKnownPerceptionFrameKindStatics = interface;
  PPerception_Provider_IKnownPerceptionFrameKindStatics = ^Perception_Provider_IKnownPerceptionFrameKindStatics;

  // Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
  Perception_Provider_IPerceptionFrameProviderInfo = interface;
  PPerception_Provider_IPerceptionFrameProviderInfo = ^Perception_Provider_IPerceptionFrameProviderInfo;

  // Windows.Devices.Perception.Provider.IPerceptionPropertyChangeRequest
  Perception_Provider_IPerceptionPropertyChangeRequest = interface;
  PPerception_Provider_IPerceptionPropertyChangeRequest = ^Perception_Provider_IPerceptionPropertyChangeRequest;

  // Windows.Devices.Perception.Provider.IPerceptionFrameProvider
  Perception_Provider_IPerceptionFrameProvider = interface;
  PPerception_Provider_IPerceptionFrameProvider = ^Perception_Provider_IPerceptionFrameProvider;

  // Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
  Perception_Provider_IPerceptionFrameProviderManager = interface;
  PPerception_Provider_IPerceptionFrameProviderManager = ^Perception_Provider_IPerceptionFrameProviderManager;

  // Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  Perception_Provider_IPerceptionFaceAuthenticationGroup = interface;
  PPerception_Provider_IPerceptionFaceAuthenticationGroup = ^Perception_Provider_IPerceptionFaceAuthenticationGroup;

  // Windows.Devices.Perception.Provider.IPerceptionControlGroup
  Perception_Provider_IPerceptionControlGroup = interface;
  PPerception_Provider_IPerceptionControlGroup = ^Perception_Provider_IPerceptionControlGroup;

  // Windows.Devices.Perception.Provider.IPerceptionCorrelation
  Perception_Provider_IPerceptionCorrelation = interface;
  PPerception_Provider_IPerceptionCorrelation = ^Perception_Provider_IPerceptionCorrelation;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IIterator_1__Perception_Provider_IPerceptionCorrelation = interface;
  PIIterator_1__Perception_Provider_IPerceptionCorrelation = ^IIterator_1__Perception_Provider_IPerceptionCorrelation;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IIterable_1__Perception_Provider_IPerceptionCorrelation = interface;
  PIIterable_1__Perception_Provider_IPerceptionCorrelation = ^IIterable_1__Perception_Provider_IPerceptionCorrelation;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IVectorView_1__Perception_Provider_IPerceptionCorrelation = interface;
  PIVectorView_1__Perception_Provider_IPerceptionCorrelation = ^IVectorView_1__Perception_Provider_IPerceptionCorrelation;

  // Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
  Perception_Provider_IPerceptionCorrelationGroup = interface;
  PPerception_Provider_IPerceptionCorrelationGroup = ^Perception_Provider_IPerceptionCorrelationGroup;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Devices.Perception.Provider.IPerceptionFrame
  Perception_Provider_IPerceptionFrame = interface;
  PPerception_Provider_IPerceptionFrame = ^Perception_Provider_IPerceptionFrame;

  // Windows.Devices.Perception.Provider.IPerceptionFrameProviderManagerServiceStatics
  Perception_Provider_IPerceptionFrameProviderManagerServiceStatics = interface;
  PPerception_Provider_IPerceptionFrameProviderManagerServiceStatics = ^Perception_Provider_IPerceptionFrameProviderManagerServiceStatics;

  // Windows.Devices.Perception.Provider.IPerceptionControlGroupFactory
  Perception_Provider_IPerceptionControlGroupFactory = interface;
  PPerception_Provider_IPerceptionControlGroupFactory = ^Perception_Provider_IPerceptionControlGroupFactory;

  // Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
  Perception_Provider_PerceptionStartFaceAuthenticationHandler = interface;
  PPerception_Provider_PerceptionStartFaceAuthenticationHandler = ^Perception_Provider_PerceptionStartFaceAuthenticationHandler;

  // Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
  Perception_Provider_PerceptionStopFaceAuthenticationHandler = interface;
  PPerception_Provider_PerceptionStopFaceAuthenticationHandler = ^Perception_Provider_PerceptionStopFaceAuthenticationHandler;

  // Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroupFactory
  Perception_Provider_IPerceptionFaceAuthenticationGroupFactory = interface;
  PPerception_Provider_IPerceptionFaceAuthenticationGroupFactory = ^Perception_Provider_IPerceptionFaceAuthenticationGroupFactory;

  // Windows.Devices.Perception.Provider.IPerceptionCorrelationFactory
  Perception_Provider_IPerceptionCorrelationFactory = interface;
  PPerception_Provider_IPerceptionCorrelationFactory = ^Perception_Provider_IPerceptionCorrelationFactory;

  // Windows.Devices.Perception.Provider.IPerceptionCorrelationGroupFactory
  Perception_Provider_IPerceptionCorrelationGroupFactory = interface;
  PPerception_Provider_IPerceptionCorrelationGroupFactory = ^Perception_Provider_IPerceptionCorrelationGroupFactory;

  // Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator
  Perception_Provider_IPerceptionVideoFrameAllocator = interface;
  PPerception_Provider_IPerceptionVideoFrameAllocator = ^Perception_Provider_IPerceptionVideoFrameAllocator;

  // Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocatorFactory
  Perception_Provider_IPerceptionVideoFrameAllocatorFactory = interface;
  PPerception_Provider_IPerceptionVideoFrameAllocatorFactory = ^Perception_Provider_IPerceptionVideoFrameAllocatorFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable;

  // Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
  Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface;
  PPerception_IPerceptionFrameSourcePropertiesChangedEventArgs = ^Perception_IPerceptionFrameSourcePropertiesChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs;

  // Windows.Devices.Perception.IPerceptionVideoProfile
  Perception_IPerceptionVideoProfile = interface;
  PPerception_IPerceptionVideoProfile = ^Perception_IPerceptionVideoProfile;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IIterator_1__Perception_IPerceptionVideoProfile = interface;
  PIIterator_1__Perception_IPerceptionVideoProfile = ^IIterator_1__Perception_IPerceptionVideoProfile;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IIterable_1__Perception_IPerceptionVideoProfile = interface;
  PIIterable_1__Perception_IPerceptionVideoProfile = ^IIterable_1__Perception_IPerceptionVideoProfile;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IVectorView_1__Perception_IPerceptionVideoProfile = interface;
  PIVectorView_1__Perception_IPerceptionVideoProfile = ^IVectorView_1__Perception_IPerceptionVideoProfile;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionControlSession,Object>
  TypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable;

  // Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult
  Perception_IPerceptionFrameSourcePropertyChangeResult = interface;
  PPerception_IPerceptionFrameSourcePropertyChangeResult = ^Perception_IPerceptionFrameSourcePropertyChangeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult = interface;
  PAsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult = ^AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult = interface;
  PIAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult = ^IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult;

  // Windows.Devices.Perception.IPerceptionControlSession
  Perception_IPerceptionControlSession = interface;
  PPerception_IPerceptionControlSession = ^Perception_IPerceptionControlSession;

  // Windows.Devices.Perception.IPerceptionDepthFrame
  Perception_IPerceptionDepthFrame = interface;
  PPerception_IPerceptionDepthFrame = ^Perception_IPerceptionDepthFrame;

  // Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics
  Perception_IPerceptionDepthCorrelatedCameraIntrinsics = interface;
  PPerception_IPerceptionDepthCorrelatedCameraIntrinsics = ^Perception_IPerceptionDepthCorrelatedCameraIntrinsics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics = interface;
  PAsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics = ^AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics = interface;
  PIAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics = ^IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs;

  // Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper
  Perception_IPerceptionDepthCorrelatedCoordinateMapper = interface;
  PPerception_IPerceptionDepthCorrelatedCoordinateMapper = ^Perception_IPerceptionDepthCorrelatedCoordinateMapper;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper = interface;
  PAsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper = ^AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper = interface;
  PIAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper = ^IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper;

  // Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs
  Perception_IPerceptionDepthFrameArrivedEventArgs = interface;
  PPerception_IPerceptionDepthFrameArrivedEventArgs = ^Perception_IPerceptionDepthFrameArrivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameReader,Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs;

  // Windows.Devices.Perception.IPerceptionDepthFrameReader
  Perception_IPerceptionDepthFrameReader = interface;
  PPerception_IPerceptionDepthFrameReader = ^Perception_IPerceptionDepthFrameReader;

  // Windows.Devices.Perception.IPerceptionDepthFrameSource
  Perception_IPerceptionDepthFrameSource = interface;
  PPerception_IPerceptionDepthFrameSource = ^Perception_IPerceptionDepthFrameSource;

  // Windows.Devices.Perception.IPerceptionColorFrame
  Perception_IPerceptionColorFrame = interface;
  PPerception_IPerceptionColorFrame = ^Perception_IPerceptionColorFrame;

  // Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs
  Perception_IPerceptionColorFrameArrivedEventArgs = interface;
  PPerception_IPerceptionColorFrameArrivedEventArgs = ^Perception_IPerceptionColorFrameArrivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameReader,Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs;

  // Windows.Devices.Perception.IPerceptionColorFrameReader
  Perception_IPerceptionColorFrameReader = interface;
  PPerception_IPerceptionColorFrameReader = ^Perception_IPerceptionColorFrameReader;

  // Windows.Devices.Perception.IPerceptionColorFrameSource
  Perception_IPerceptionColorFrameSource = interface;
  PPerception_IPerceptionColorFrameSource = ^Perception_IPerceptionColorFrameSource;

  // Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs
  Perception_IPerceptionColorFrameSourceAddedEventArgs = interface;
  PPerception_IPerceptionColorFrameSourceAddedEventArgs = ^Perception_IPerceptionColorFrameSourceAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs;

  // Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs
  Perception_IPerceptionColorFrameSourceRemovedEventArgs = interface;
  PPerception_IPerceptionColorFrameSourceRemovedEventArgs = ^Perception_IPerceptionColorFrameSourceRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable;

  // Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
  Perception_IPerceptionColorFrameSourceWatcher = interface;
  PPerception_IPerceptionColorFrameSourceWatcher = ^Perception_IPerceptionColorFrameSourceWatcher;

  // Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs
  Perception_IPerceptionDepthFrameSourceAddedEventArgs = interface;
  PPerception_IPerceptionDepthFrameSourceAddedEventArgs = ^Perception_IPerceptionDepthFrameSourceAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs;

  // Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs
  Perception_IPerceptionDepthFrameSourceRemovedEventArgs = interface;
  PPerception_IPerceptionDepthFrameSourceRemovedEventArgs = ^Perception_IPerceptionDepthFrameSourceRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable;

  // Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
  Perception_IPerceptionDepthFrameSourceWatcher = interface;
  PPerception_IPerceptionDepthFrameSourceWatcher = ^Perception_IPerceptionDepthFrameSourceWatcher;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs;

  // Windows.Devices.Perception.IPerceptionInfraredFrame
  Perception_IPerceptionInfraredFrame = interface;
  PPerception_IPerceptionInfraredFrame = ^Perception_IPerceptionInfraredFrame;

  // Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs
  Perception_IPerceptionInfraredFrameArrivedEventArgs = interface;
  PPerception_IPerceptionInfraredFrameArrivedEventArgs = ^Perception_IPerceptionInfraredFrameArrivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameReader,Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs;

  // Windows.Devices.Perception.IPerceptionInfraredFrameReader
  Perception_IPerceptionInfraredFrameReader = interface;
  PPerception_IPerceptionInfraredFrameReader = ^Perception_IPerceptionInfraredFrameReader;

  // Windows.Devices.Perception.IPerceptionInfraredFrameSource
  Perception_IPerceptionInfraredFrameSource = interface;
  PPerception_IPerceptionInfraredFrameSource = ^Perception_IPerceptionInfraredFrameSource;

  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs
  Perception_IPerceptionInfraredFrameSourceAddedEventArgs = interface;
  PPerception_IPerceptionInfraredFrameSourceAddedEventArgs = ^Perception_IPerceptionInfraredFrameSourceAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs;

  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs
  Perception_IPerceptionInfraredFrameSourceRemovedEventArgs = interface;
  PPerception_IPerceptionInfraredFrameSourceRemovedEventArgs = ^Perception_IPerceptionInfraredFrameSourceRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs = interface;
  PTypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs = ^TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable = interface;
  PTypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable = ^TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable;

  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
  Perception_IPerceptionInfraredFrameSourceWatcher = interface;
  PPerception_IPerceptionInfraredFrameSourceWatcher = ^Perception_IPerceptionInfraredFrameSourceWatcher;

  // Windows.Devices.Perception.IKnownPerceptionFrameSourcePropertiesStatics
  Perception_IKnownPerceptionFrameSourcePropertiesStatics = interface;
  PPerception_IKnownPerceptionFrameSourcePropertiesStatics = ^Perception_IKnownPerceptionFrameSourcePropertiesStatics;

  // Windows.Devices.Perception.IKnownPerceptionFrameSourcePropertiesStatics2
  Perception_IKnownPerceptionFrameSourcePropertiesStatics2 = interface;
  PPerception_IKnownPerceptionFrameSourcePropertiesStatics2 = ^Perception_IKnownPerceptionFrameSourcePropertiesStatics2;

  // Windows.Devices.Perception.IKnownPerceptionVideoFrameSourcePropertiesStatics
  Perception_IKnownPerceptionVideoFrameSourcePropertiesStatics = interface;
  PPerception_IKnownPerceptionVideoFrameSourcePropertiesStatics = ^Perception_IKnownPerceptionVideoFrameSourcePropertiesStatics;

  // Windows.Devices.Perception.IKnownPerceptionInfraredFrameSourcePropertiesStatics
  Perception_IKnownPerceptionInfraredFrameSourcePropertiesStatics = interface;
  PPerception_IKnownPerceptionInfraredFrameSourcePropertiesStatics = ^Perception_IKnownPerceptionInfraredFrameSourcePropertiesStatics;

  // Windows.Devices.Perception.IKnownPerceptionDepthFrameSourcePropertiesStatics
  Perception_IKnownPerceptionDepthFrameSourcePropertiesStatics = interface;
  PPerception_IKnownPerceptionDepthFrameSourcePropertiesStatics = ^Perception_IKnownPerceptionDepthFrameSourcePropertiesStatics;

  // Windows.Devices.Perception.IKnownPerceptionColorFrameSourcePropertiesStatics
  Perception_IKnownPerceptionColorFrameSourcePropertiesStatics = interface;
  PPerception_IKnownPerceptionColorFrameSourcePropertiesStatics = ^Perception_IKnownPerceptionColorFrameSourcePropertiesStatics;

  // Windows.Devices.Perception.IKnownPerceptionVideoProfilePropertiesStatics
  Perception_IKnownPerceptionVideoProfilePropertiesStatics = interface;
  PPerception_IKnownPerceptionVideoProfilePropertiesStatics = ^Perception_IKnownPerceptionVideoProfilePropertiesStatics;

  // Windows.Devices.Perception.IKnownCameraIntrinsicsPropertiesStatics
  Perception_IKnownCameraIntrinsicsPropertiesStatics = interface;
  PPerception_IKnownCameraIntrinsicsPropertiesStatics = ^Perception_IKnownCameraIntrinsicsPropertiesStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IIterator_1__Perception_IPerceptionInfraredFrameSource = interface;
  PIIterator_1__Perception_IPerceptionInfraredFrameSource = ^IIterator_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IIterable_1__Perception_IPerceptionInfraredFrameSource = interface;
  PIIterable_1__Perception_IPerceptionInfraredFrameSource = ^IIterable_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IVectorView_1__Perception_IPerceptionInfraredFrameSource = interface;
  PIVectorView_1__Perception_IPerceptionInfraredFrameSource = ^IVectorView_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource = ^AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource = interface;
  PIAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource = ^IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource = interface;
  PAsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource = ^AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource = interface;
  PIAsyncOperation_1__Perception_IPerceptionInfraredFrameSource = ^IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus = ^AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus = interface;
  PIAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus = ^IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus;

  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceStatics
  Perception_IPerceptionInfraredFrameSourceStatics = interface;
  PPerception_IPerceptionInfraredFrameSourceStatics = ^Perception_IPerceptionInfraredFrameSourceStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IIterator_1__Perception_IPerceptionDepthFrameSource = interface;
  PIIterator_1__Perception_IPerceptionDepthFrameSource = ^IIterator_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IIterable_1__Perception_IPerceptionDepthFrameSource = interface;
  PIIterable_1__Perception_IPerceptionDepthFrameSource = ^IIterable_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IVectorView_1__Perception_IPerceptionDepthFrameSource = interface;
  PIVectorView_1__Perception_IPerceptionDepthFrameSource = ^IVectorView_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource = ^AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource = interface;
  PIAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource = ^IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource = interface;
  PAsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource = ^AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IAsyncOperation_1__Perception_IPerceptionDepthFrameSource = interface;
  PIAsyncOperation_1__Perception_IPerceptionDepthFrameSource = ^IAsyncOperation_1__Perception_IPerceptionDepthFrameSource;

  // Windows.Devices.Perception.IPerceptionDepthFrameSourceStatics
  Perception_IPerceptionDepthFrameSourceStatics = interface;
  PPerception_IPerceptionDepthFrameSourceStatics = ^Perception_IPerceptionDepthFrameSourceStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IIterator_1__Perception_IPerceptionColorFrameSource = interface;
  PIIterator_1__Perception_IPerceptionColorFrameSource = ^IIterator_1__Perception_IPerceptionColorFrameSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IIterable_1__Perception_IPerceptionColorFrameSource = interface;
  PIIterable_1__Perception_IPerceptionColorFrameSource = ^IIterable_1__Perception_IPerceptionColorFrameSource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IVectorView_1__Perception_IPerceptionColorFrameSource = interface;
  PIVectorView_1__Perception_IPerceptionColorFrameSource = ^IVectorView_1__Perception_IPerceptionColorFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource = ^AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource = interface;
  PIAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource = ^IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource = interface;
  PAsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource = ^AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IAsyncOperation_1__Perception_IPerceptionColorFrameSource = interface;
  PIAsyncOperation_1__Perception_IPerceptionColorFrameSource = ^IAsyncOperation_1__Perception_IPerceptionColorFrameSource;

  // Windows.Devices.Perception.IPerceptionColorFrameSourceStatics
  Perception_IPerceptionColorFrameSourceStatics = interface;
  PPerception_IPerceptionColorFrameSourceStatics = ^Perception_IPerceptionColorFrameSourceStatics;

  // Windows.Devices.Perception.IPerceptionColorFrameSource2
  Perception_IPerceptionColorFrameSource2 = interface;
  PPerception_IPerceptionColorFrameSource2 = ^Perception_IPerceptionColorFrameSource2;

  // Windows.Devices.Perception.IPerceptionDepthFrameSource2
  Perception_IPerceptionDepthFrameSource2 = interface;
  PPerception_IPerceptionDepthFrameSource2 = ^Perception_IPerceptionDepthFrameSource2;

  // Windows.Devices.Perception.IPerceptionInfraredFrameSource2
  Perception_IPerceptionInfraredFrameSource2 = interface;
  PPerception_IPerceptionInfraredFrameSource2 = ^Perception_IPerceptionInfraredFrameSource2;

  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface;
  PIIterable_1__Cardinal = ^IIterable_1__Cardinal;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Cardinal = ^AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  IAsyncOperation_1__IVectorView_1__Cardinal = interface;
  PIAsyncOperation_1__IVectorView_1__Cardinal = ^IAsyncOperation_1__IVectorView_1__Cardinal;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Radios.IRadio>
  IIterator_1__Radios_IRadio = interface;
  PIIterator_1__Radios_IRadio = ^IIterator_1__Radios_IRadio;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Radios.IRadio>
  IIterable_1__Radios_IRadio = interface;
  PIIterable_1__Radios_IRadio = ^IIterable_1__Radios_IRadio;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>
  IVectorView_1__Radios_IRadio = interface;
  PIVectorView_1__Radios_IRadio = ^IVectorView_1__Radios_IRadio;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio = ^AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  IAsyncOperation_1__IVectorView_1__Radios_IRadio = interface;
  PIAsyncOperation_1__IVectorView_1__Radios_IRadio = ^IAsyncOperation_1__IVectorView_1__Radios_IRadio;

  // Windows.Devices.Radios.IRadioStatics
  Radios_IRadioStatics = interface;
  PRadios_IRadioStatics = ^Radios_IRadioStatics;

  // Windows.Devices.SerialCommunication.IErrorReceivedEventArgs
  SerialCommunication_IErrorReceivedEventArgs = interface;
  PSerialCommunication_IErrorReceivedEventArgs = ^SerialCommunication_IErrorReceivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IErrorReceivedEventArgs>
  TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs = interface;
  PTypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs = ^TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs;

  // Windows.Devices.SerialCommunication.IPinChangedEventArgs
  SerialCommunication_IPinChangedEventArgs = interface;
  PSerialCommunication_IPinChangedEventArgs = ^SerialCommunication_IPinChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IPinChangedEventArgs>
  TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs = interface;
  PTypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs = ^TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs;

  // Windows.Devices.SerialCommunication.ISerialDevice
  SerialCommunication_ISerialDevice = interface;
  PSerialCommunication_ISerialDevice = ^SerialCommunication_ISerialDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SerialCommunication.ISerialDevice>
  AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice = interface;
  PAsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice = ^AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SerialCommunication.ISerialDevice>
  IAsyncOperation_1__SerialCommunication_ISerialDevice = interface;
  PIAsyncOperation_1__SerialCommunication_ISerialDevice = ^IAsyncOperation_1__SerialCommunication_ISerialDevice;

  // Windows.Devices.SerialCommunication.ISerialDeviceStatics
  SerialCommunication_ISerialDeviceStatics = interface;
  PSerialCommunication_ISerialDeviceStatics = ^SerialCommunication_ISerialDeviceStatics;

  // Windows.Devices.Usb.IUsbControlRequestType
  Usb_IUsbControlRequestType = interface;
  PUsb_IUsbControlRequestType = ^Usb_IUsbControlRequestType;

  // Windows.Devices.Usb.IUsbSetupPacket
  Usb_IUsbSetupPacket = interface;
  PUsb_IUsbSetupPacket = ^Usb_IUsbSetupPacket;

  // Windows.Devices.Usb.IUsbSetupPacketFactory
  Usb_IUsbSetupPacketFactory = interface;
  PUsb_IUsbSetupPacketFactory = ^Usb_IUsbSetupPacketFactory;

  // Windows.Devices.Usb.IUsbDeviceClass
  Usb_IUsbDeviceClass = interface;
  PUsb_IUsbDeviceClass = ^Usb_IUsbDeviceClass;

  // Windows.Devices.Usb.IUsbDeviceClassesStatics
  Usb_IUsbDeviceClassesStatics = interface;
  PUsb_IUsbDeviceClassesStatics = ^Usb_IUsbDeviceClassesStatics;

  // Windows.Devices.Usb.IUsbDeviceClasses
  Usb_IUsbDeviceClasses = interface;
  PUsb_IUsbDeviceClasses = ^Usb_IUsbDeviceClasses;

  // Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
  Usb_IUsbBulkInEndpointDescriptor = interface;
  PUsb_IUsbBulkInEndpointDescriptor = ^Usb_IUsbBulkInEndpointDescriptor;

  // Windows.Devices.Usb.IUsbBulkInPipe
  Usb_IUsbBulkInPipe = interface;
  PUsb_IUsbBulkInPipe = ^Usb_IUsbBulkInPipe;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IIterator_1__Usb_IUsbBulkInPipe = interface;
  PIIterator_1__Usb_IUsbBulkInPipe = ^IIterator_1__Usb_IUsbBulkInPipe;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IIterable_1__Usb_IUsbBulkInPipe = interface;
  PIIterable_1__Usb_IUsbBulkInPipe = ^IIterable_1__Usb_IUsbBulkInPipe;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IVectorView_1__Usb_IUsbBulkInPipe = interface;
  PIVectorView_1__Usb_IUsbBulkInPipe = ^IVectorView_1__Usb_IUsbBulkInPipe;

  // Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
  Usb_IUsbInterruptInEndpointDescriptor = interface;
  PUsb_IUsbInterruptInEndpointDescriptor = ^Usb_IUsbInterruptInEndpointDescriptor;

  // Windows.Devices.Usb.IUsbInterruptInEventArgs
  Usb_IUsbInterruptInEventArgs = interface;
  PUsb_IUsbInterruptInEventArgs = ^Usb_IUsbInterruptInEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Usb.IUsbInterruptInPipe,Windows.Devices.Usb.IUsbInterruptInEventArgs>
  TypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs = interface;
  PTypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs = ^TypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs;

  // Windows.Devices.Usb.IUsbInterruptInPipe
  Usb_IUsbInterruptInPipe = interface;
  PUsb_IUsbInterruptInPipe = ^Usb_IUsbInterruptInPipe;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IIterator_1__Usb_IUsbInterruptInPipe = interface;
  PIIterator_1__Usb_IUsbInterruptInPipe = ^IIterator_1__Usb_IUsbInterruptInPipe;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IIterable_1__Usb_IUsbInterruptInPipe = interface;
  PIIterable_1__Usb_IUsbInterruptInPipe = ^IIterable_1__Usb_IUsbInterruptInPipe;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IVectorView_1__Usb_IUsbInterruptInPipe = interface;
  PIVectorView_1__Usb_IUsbInterruptInPipe = ^IVectorView_1__Usb_IUsbInterruptInPipe;

  // Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
  Usb_IUsbBulkOutEndpointDescriptor = interface;
  PUsb_IUsbBulkOutEndpointDescriptor = ^Usb_IUsbBulkOutEndpointDescriptor;

  // Windows.Devices.Usb.IUsbBulkOutPipe
  Usb_IUsbBulkOutPipe = interface;
  PUsb_IUsbBulkOutPipe = ^Usb_IUsbBulkOutPipe;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IIterator_1__Usb_IUsbBulkOutPipe = interface;
  PIIterator_1__Usb_IUsbBulkOutPipe = ^IIterator_1__Usb_IUsbBulkOutPipe;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IIterable_1__Usb_IUsbBulkOutPipe = interface;
  PIIterable_1__Usb_IUsbBulkOutPipe = ^IIterable_1__Usb_IUsbBulkOutPipe;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IVectorView_1__Usb_IUsbBulkOutPipe = interface;
  PIVectorView_1__Usb_IUsbBulkOutPipe = ^IVectorView_1__Usb_IUsbBulkOutPipe;

  // Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
  Usb_IUsbInterruptOutEndpointDescriptor = interface;
  PUsb_IUsbInterruptOutEndpointDescriptor = ^Usb_IUsbInterruptOutEndpointDescriptor;

  // Windows.Devices.Usb.IUsbInterruptOutPipe
  Usb_IUsbInterruptOutPipe = interface;
  PUsb_IUsbInterruptOutPipe = ^Usb_IUsbInterruptOutPipe;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IIterator_1__Usb_IUsbInterruptOutPipe = interface;
  PIIterator_1__Usb_IUsbInterruptOutPipe = ^IIterator_1__Usb_IUsbInterruptOutPipe;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IIterable_1__Usb_IUsbInterruptOutPipe = interface;
  PIIterable_1__Usb_IUsbInterruptOutPipe = ^IIterable_1__Usb_IUsbInterruptOutPipe;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IVectorView_1__Usb_IUsbInterruptOutPipe = interface;
  PIVectorView_1__Usb_IUsbInterruptOutPipe = ^IVectorView_1__Usb_IUsbInterruptOutPipe;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IIterator_1__Usb_IUsbBulkInEndpointDescriptor = interface;
  PIIterator_1__Usb_IUsbBulkInEndpointDescriptor = ^IIterator_1__Usb_IUsbBulkInEndpointDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IIterable_1__Usb_IUsbBulkInEndpointDescriptor = interface;
  PIIterable_1__Usb_IUsbBulkInEndpointDescriptor = ^IIterable_1__Usb_IUsbBulkInEndpointDescriptor;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IVectorView_1__Usb_IUsbBulkInEndpointDescriptor = interface;
  PIVectorView_1__Usb_IUsbBulkInEndpointDescriptor = ^IVectorView_1__Usb_IUsbBulkInEndpointDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IIterator_1__Usb_IUsbInterruptInEndpointDescriptor = interface;
  PIIterator_1__Usb_IUsbInterruptInEndpointDescriptor = ^IIterator_1__Usb_IUsbInterruptInEndpointDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IIterable_1__Usb_IUsbInterruptInEndpointDescriptor = interface;
  PIIterable_1__Usb_IUsbInterruptInEndpointDescriptor = ^IIterable_1__Usb_IUsbInterruptInEndpointDescriptor;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IVectorView_1__Usb_IUsbInterruptInEndpointDescriptor = interface;
  PIVectorView_1__Usb_IUsbInterruptInEndpointDescriptor = ^IVectorView_1__Usb_IUsbInterruptInEndpointDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IIterator_1__Usb_IUsbBulkOutEndpointDescriptor = interface;
  PIIterator_1__Usb_IUsbBulkOutEndpointDescriptor = ^IIterator_1__Usb_IUsbBulkOutEndpointDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IIterable_1__Usb_IUsbBulkOutEndpointDescriptor = interface;
  PIIterable_1__Usb_IUsbBulkOutEndpointDescriptor = ^IIterable_1__Usb_IUsbBulkOutEndpointDescriptor;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IVectorView_1__Usb_IUsbBulkOutEndpointDescriptor = interface;
  PIVectorView_1__Usb_IUsbBulkOutEndpointDescriptor = ^IVectorView_1__Usb_IUsbBulkOutEndpointDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IIterator_1__Usb_IUsbInterruptOutEndpointDescriptor = interface;
  PIIterator_1__Usb_IUsbInterruptOutEndpointDescriptor = ^IIterator_1__Usb_IUsbInterruptOutEndpointDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IIterable_1__Usb_IUsbInterruptOutEndpointDescriptor = interface;
  PIIterable_1__Usb_IUsbInterruptOutEndpointDescriptor = ^IIterable_1__Usb_IUsbInterruptOutEndpointDescriptor;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IVectorView_1__Usb_IUsbInterruptOutEndpointDescriptor = interface;
  PIVectorView_1__Usb_IUsbInterruptOutEndpointDescriptor = ^IVectorView_1__Usb_IUsbInterruptOutEndpointDescriptor;

  // Windows.Devices.Usb.IUsbInterfaceDescriptor
  Usb_IUsbInterfaceDescriptor = interface;
  PUsb_IUsbInterfaceDescriptor = ^Usb_IUsbInterfaceDescriptor;

  // Windows.Devices.Usb.IUsbDescriptor
  Usb_IUsbDescriptor = interface;
  PUsb_IUsbDescriptor = ^Usb_IUsbDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbDescriptor>
  IIterator_1__Usb_IUsbDescriptor = interface;
  PIIterator_1__Usb_IUsbDescriptor = ^IIterator_1__Usb_IUsbDescriptor;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbDescriptor>
  IIterable_1__Usb_IUsbDescriptor = interface;
  PIIterable_1__Usb_IUsbDescriptor = ^IIterable_1__Usb_IUsbDescriptor;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbDescriptor>
  IVectorView_1__Usb_IUsbDescriptor = interface;
  PIVectorView_1__Usb_IUsbDescriptor = ^IVectorView_1__Usb_IUsbDescriptor;

  // Windows.Devices.Usb.IUsbInterfaceSetting
  Usb_IUsbInterfaceSetting = interface;
  PUsb_IUsbInterfaceSetting = ^Usb_IUsbInterfaceSetting;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IIterator_1__Usb_IUsbInterfaceSetting = interface;
  PIIterator_1__Usb_IUsbInterfaceSetting = ^IIterator_1__Usb_IUsbInterfaceSetting;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IIterable_1__Usb_IUsbInterfaceSetting = interface;
  PIIterable_1__Usb_IUsbInterfaceSetting = ^IIterable_1__Usb_IUsbInterfaceSetting;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IVectorView_1__Usb_IUsbInterfaceSetting = interface;
  PIVectorView_1__Usb_IUsbInterfaceSetting = ^IVectorView_1__Usb_IUsbInterfaceSetting;

  // Windows.Devices.Usb.IUsbInterface
  Usb_IUsbInterface = interface;
  PUsb_IUsbInterface = ^Usb_IUsbInterface;

  // Windows.Devices.Usb.IUsbDeviceDescriptor
  Usb_IUsbDeviceDescriptor = interface;
  PUsb_IUsbDeviceDescriptor = ^Usb_IUsbDeviceDescriptor;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterface>
  IIterator_1__Usb_IUsbInterface = interface;
  PIIterator_1__Usb_IUsbInterface = ^IIterator_1__Usb_IUsbInterface;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterface>
  IIterable_1__Usb_IUsbInterface = interface;
  PIIterable_1__Usb_IUsbInterface = ^IIterable_1__Usb_IUsbInterface;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterface>
  IVectorView_1__Usb_IUsbInterface = interface;
  PIVectorView_1__Usb_IUsbInterface = ^IVectorView_1__Usb_IUsbInterface;

  // Windows.Devices.Usb.IUsbConfigurationDescriptor
  Usb_IUsbConfigurationDescriptor = interface;
  PUsb_IUsbConfigurationDescriptor = ^Usb_IUsbConfigurationDescriptor;

  // Windows.Devices.Usb.IUsbConfiguration
  Usb_IUsbConfiguration = interface;
  PUsb_IUsbConfiguration = ^Usb_IUsbConfiguration;

  // Windows.Devices.Usb.IUsbDevice
  Usb_IUsbDevice = interface;
  PUsb_IUsbDevice = ^Usb_IUsbDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Usb.IUsbDevice>
  AsyncOperationCompletedHandler_1__Usb_IUsbDevice = interface;
  PAsyncOperationCompletedHandler_1__Usb_IUsbDevice = ^AsyncOperationCompletedHandler_1__Usb_IUsbDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Usb.IUsbDevice>
  IAsyncOperation_1__Usb_IUsbDevice = interface;
  PIAsyncOperation_1__Usb_IUsbDevice = ^IAsyncOperation_1__Usb_IUsbDevice;

  // Windows.Devices.Usb.IUsbDeviceStatics
  Usb_IUsbDeviceStatics = interface;
  PUsb_IUsbDeviceStatics = ^Usb_IUsbDeviceStatics;

  // Windows.Devices.Usb.IUsbConfigurationDescriptorStatics
  Usb_IUsbConfigurationDescriptorStatics = interface;
  PUsb_IUsbConfigurationDescriptorStatics = ^Usb_IUsbConfigurationDescriptorStatics;

  // Windows.Devices.Usb.IUsbInterfaceDescriptorStatics
  Usb_IUsbInterfaceDescriptorStatics = interface;
  PUsb_IUsbInterfaceDescriptorStatics = ^Usb_IUsbInterfaceDescriptorStatics;

  // Windows.Devices.Usb.IUsbEndpointDescriptor
  Usb_IUsbEndpointDescriptor = interface;
  PUsb_IUsbEndpointDescriptor = ^Usb_IUsbEndpointDescriptor;

  // Windows.Devices.Usb.IUsbEndpointDescriptorStatics
  Usb_IUsbEndpointDescriptorStatics = interface;
  PUsb_IUsbEndpointDescriptorStatics = ^Usb_IUsbEndpointDescriptorStatics;

  // Windows.Devices.WiFi.IWiFiAvailableNetwork
  WiFi_IWiFiAvailableNetwork = interface;
  PWiFi_IWiFiAvailableNetwork = ^WiFi_IWiFiAvailableNetwork;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IIterator_1__WiFi_IWiFiAvailableNetwork = interface;
  PIIterator_1__WiFi_IWiFiAvailableNetwork = ^IIterator_1__WiFi_IWiFiAvailableNetwork;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IIterable_1__WiFi_IWiFiAvailableNetwork = interface;
  PIIterable_1__WiFi_IWiFiAvailableNetwork = ^IIterable_1__WiFi_IWiFiAvailableNetwork;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IVectorView_1__WiFi_IWiFiAvailableNetwork = interface;
  PIVectorView_1__WiFi_IWiFiAvailableNetwork = ^IVectorView_1__WiFi_IWiFiAvailableNetwork;

  // Windows.Devices.WiFi.IWiFiNetworkReport
  WiFi_IWiFiNetworkReport = interface;
  PWiFi_IWiFiNetworkReport = ^WiFi_IWiFiNetworkReport;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFi.IWiFiAdapter,Object>
  TypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable = interface;
  PTypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable = ^TypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable;

  // Windows.Devices.WiFi.IWiFiConnectionResult
  WiFi_IWiFiConnectionResult = interface;
  PWiFi_IWiFiConnectionResult = ^WiFi_IWiFiConnectionResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult = interface;
  PAsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult = ^AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  IAsyncOperation_1__WiFi_IWiFiConnectionResult = interface;
  PIAsyncOperation_1__WiFi_IWiFiConnectionResult = ^IAsyncOperation_1__WiFi_IWiFiConnectionResult;

  // Windows.Devices.WiFi.IWiFiAdapter
  WiFi_IWiFiAdapter = interface;
  PWiFi_IWiFiAdapter = ^WiFi_IWiFiAdapter;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAdapter>
  IIterator_1__WiFi_IWiFiAdapter = interface;
  PIIterator_1__WiFi_IWiFiAdapter = ^IIterator_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.IWiFiAdapter>
  IIterable_1__WiFi_IWiFiAdapter = interface;
  PIIterable_1__WiFi_IWiFiAdapter = ^IIterable_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>
  IVectorView_1__WiFi_IWiFiAdapter = interface;
  PIVectorView_1__WiFi_IWiFiAdapter = ^IVectorView_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter = ^AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter = interface;
  PIAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter = ^IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiAdapter>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter = interface;
  PAsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter = ^AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiAdapter>
  IAsyncOperation_1__WiFi_IWiFiAdapter = interface;
  PIAsyncOperation_1__WiFi_IWiFiAdapter = ^IAsyncOperation_1__WiFi_IWiFiAdapter;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.WiFiAccessStatus>
  AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus = interface;
  PAsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus = ^AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.WiFiAccessStatus>
  IAsyncOperation_1__WiFi_WiFiAccessStatus = interface;
  PIAsyncOperation_1__WiFi_WiFiAccessStatus = ^IAsyncOperation_1__WiFi_WiFiAccessStatus;

  // Windows.Devices.WiFi.IWiFiAdapterStatics
  WiFi_IWiFiAdapterStatics = interface;
  PWiFi_IWiFiAdapterStatics = ^WiFi_IWiFiAdapterStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.WiFiWpsKind>
  IIterator_1__WiFi_WiFiWpsKind = interface;
  PIIterator_1__WiFi_WiFiWpsKind = ^IIterator_1__WiFi_WiFiWpsKind;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.WiFiWpsKind>
  IIterable_1__WiFi_WiFiWpsKind = interface;
  PIIterable_1__WiFi_WiFiWpsKind = ^IIterable_1__WiFi_WiFiWpsKind;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.WiFiWpsKind>
  IVectorView_1__WiFi_WiFiWpsKind = interface;
  PIVectorView_1__WiFi_WiFiWpsKind = ^IVectorView_1__WiFi_WiFiWpsKind;

  // Windows.Devices.WiFi.IWiFiWpsConfigurationResult
  WiFi_IWiFiWpsConfigurationResult = interface;
  PWiFi_IWiFiWpsConfigurationResult = ^WiFi_IWiFiWpsConfigurationResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult = interface;
  PAsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult = ^AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult = interface;
  PIAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult = ^IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult;

  // Windows.Devices.WiFi.IWiFiAdapter2
  WiFi_IWiFiAdapter2 = interface;
  PWiFi_IWiFiAdapter2 = ^WiFi_IWiFiAdapter2;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectDevice,Object>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable = interface;
  PTypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable = ^TypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable;

  // Windows.Devices.WiFiDirect.IWiFiDirectDevice
  WiFiDirect_IWiFiDirectDevice = interface;
  PWiFiDirect_IWiFiDirectDevice = ^WiFiDirect_IWiFiDirectDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice = interface;
  PAsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice = ^AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice = interface;
  PIAsyncOperation_1__WiFiDirect_IWiFiDirectDevice = ^IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice;

  // Windows.Devices.WiFiDirect.IWiFiDirectDeviceStatics
  WiFiDirect_IWiFiDirectDeviceStatics = interface;
  PWiFiDirect_IWiFiDirectDeviceStatics = ^WiFiDirect_IWiFiDirectDeviceStatics;

  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
  WiFiDirect_IWiFiDirectConnectionParameters = interface;
  PWiFiDirect_IWiFiDirectConnectionParameters = ^WiFiDirect_IWiFiDirectConnectionParameters;

  // Windows.Devices.WiFiDirect.IWiFiDirectDeviceStatics2
  WiFiDirect_IWiFiDirectDeviceStatics2 = interface;
  PWiFiDirect_IWiFiDirectDeviceStatics2 = ^WiFiDirect_IWiFiDirectDeviceStatics2;

  // Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
  WiFiDirect_IWiFiDirectInformationElement = interface;
  PWiFiDirect_IWiFiDirectInformationElement = ^WiFiDirect_IWiFiDirectInformationElement;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IIterator_1__WiFiDirect_IWiFiDirectInformationElement = interface;
  PIIterator_1__WiFiDirect_IWiFiDirectInformationElement = ^IIterator_1__WiFiDirect_IWiFiDirectInformationElement;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IIterable_1__WiFiDirect_IWiFiDirectInformationElement = interface;
  PIIterable_1__WiFiDirect_IWiFiDirectInformationElement = ^IIterable_1__WiFiDirect_IWiFiDirectInformationElement;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IVectorView_1__WiFiDirect_IWiFiDirectInformationElement = interface;
  PIVectorView_1__WiFiDirect_IWiFiDirectInformationElement = ^IVectorView_1__WiFiDirect_IWiFiDirectInformationElement;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IVector_1__WiFiDirect_IWiFiDirectInformationElement = interface;
  PIVector_1__WiFiDirect_IWiFiDirectInformationElement = ^IVector_1__WiFiDirect_IWiFiDirectInformationElement;

  // Windows.Devices.WiFiDirect.IWiFiDirectInformationElementStatics
  WiFiDirect_IWiFiDirectInformationElementStatics = interface;
  PWiFiDirect_IWiFiDirectInformationElementStatics = ^WiFiDirect_IWiFiDirectInformationElementStatics;

  // Windows.Devices.WiFiDirect.IWiFiDirectLegacySettings
  WiFiDirect_IWiFiDirectLegacySettings = interface;
  PWiFiDirect_IWiFiDirectLegacySettings = ^WiFiDirect_IWiFiDirectLegacySettings;

  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement
  WiFiDirect_IWiFiDirectAdvertisement = interface;
  PWiFiDirect_IWiFiDirectAdvertisement = ^WiFiDirect_IWiFiDirectAdvertisement;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IIterator_1__WiFiDirect_WiFiDirectConfigurationMethod = interface;
  PIIterator_1__WiFiDirect_WiFiDirectConfigurationMethod = ^IIterator_1__WiFiDirect_WiFiDirectConfigurationMethod;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IIterable_1__WiFiDirect_WiFiDirectConfigurationMethod = interface;
  PIIterable_1__WiFiDirect_WiFiDirectConfigurationMethod = ^IIterable_1__WiFiDirect_WiFiDirectConfigurationMethod;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IVectorView_1__WiFiDirect_WiFiDirectConfigurationMethod = interface;
  PIVectorView_1__WiFiDirect_WiFiDirectConfigurationMethod = ^IVectorView_1__WiFiDirect_WiFiDirectConfigurationMethod;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IVector_1__WiFiDirect_WiFiDirectConfigurationMethod = interface;
  PIVector_1__WiFiDirect_WiFiDirectConfigurationMethod = ^IVector_1__WiFiDirect_WiFiDirectConfigurationMethod;

  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement2
  WiFiDirect_IWiFiDirectAdvertisement2 = interface;
  PWiFiDirect_IWiFiDirectAdvertisement2 = ^WiFiDirect_IWiFiDirectAdvertisement2;

  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs
  WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs = interface;
  PWiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs = ^WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher,Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs = interface;
  PTypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs = ^TypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs;

  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher
  WiFiDirect_IWiFiDirectAdvertisementPublisher = interface;
  PWiFiDirect_IWiFiDirectAdvertisementPublisher = ^WiFiDirect_IWiFiDirectAdvertisementPublisher;

  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionParametersStatics
  WiFiDirect_IWiFiDirectConnectionParametersStatics = interface;
  PWiFiDirect_IWiFiDirectConnectionParametersStatics = ^WiFiDirect_IWiFiDirectConnectionParametersStatics;

  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters2
  WiFiDirect_IWiFiDirectConnectionParameters2 = interface;
  PWiFiDirect_IWiFiDirectConnectionParameters2 = ^WiFiDirect_IWiFiDirectConnectionParameters2;

  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequest
  WiFiDirect_IWiFiDirectConnectionRequest = interface;
  PWiFiDirect_IWiFiDirectConnectionRequest = ^WiFiDirect_IWiFiDirectConnectionRequest;

  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs
  WiFiDirect_IWiFiDirectConnectionRequestedEventArgs = interface;
  PWiFiDirect_IWiFiDirectConnectionRequestedEventArgs = ^WiFiDirect_IWiFiDirectConnectionRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener,Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs = interface;
  PTypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs = ^TypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs;

  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener
  WiFiDirect_IWiFiDirectConnectionListener = interface;
  PWiFiDirect_IWiFiDirectConnectionListener = ^WiFiDirect_IWiFiDirectConnectionListener;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo
  WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = interface;
  PWiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = ^WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Object>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable = interface;
  PTypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable = ^TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs
  WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs = interface;
  PWiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs = ^WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs = interface;
  PTypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs = ^TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  WiFiDirect_Services_IWiFiDirectServiceSession = interface;
  PWiFiDirect_Services_IWiFiDirectServiceSession = ^WiFiDirect_Services_IWiFiDirectServiceSession;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs
  WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs = interface;
  PWiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs = ^WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs
  WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs = interface;
  PWiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs = ^WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequest
  WiFiDirect_Services_IWiFiDirectServiceSessionRequest = interface;
  PWiFiDirect_Services_IWiFiDirectServiceSessionRequest = ^WiFiDirect_Services_IWiFiDirectServiceSessionRequest;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs
  WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs = interface;
  PWiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs = ^WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface;
  PIIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = ^IIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IIterable_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface;
  PIIterable_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = ^IIterable_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface;
  PIVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = ^IVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod;

  // Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IVector_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface;
  PIVector_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = ^IVector_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs = interface;
  PTypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs = ^TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs = interface;
  PTypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs = ^TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Object>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable = interface;
  PTypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable = ^TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession = interface;
  PAsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession = ^AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession = interface;
  PIAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession = ^IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  WiFiDirect_Services_IWiFiDirectServiceAdvertiser = interface;
  PWiFiDirect_Services_IWiFiDirectServiceAdvertiser = ^WiFiDirect_Services_IWiFiDirectServiceAdvertiser;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiserFactory
  WiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory = interface;
  PWiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory = ^WiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory;

  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectService,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs = interface;
  PTypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs = ^TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = interface;
  PAsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = ^AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = interface;
  PIAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = ^IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectService
  WiFiDirect_Services_IWiFiDirectService = interface;
  PWiFiDirect_Services_IWiFiDirectService = ^WiFiDirect_Services_IWiFiDirectService;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService = interface;
  PAsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService = ^AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService;

  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService = interface;
  PIAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService = ^IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService;

  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceStatics
  WiFiDirect_Services_IWiFiDirectServiceStatics = interface;
  PWiFiDirect_Services_IWiFiDirectServiceStatics = ^WiFiDirect_Services_IWiFiDirectServiceStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IIterator_1__Haptics_ISimpleHapticsController = interface;
  PIIterator_1__Haptics_ISimpleHapticsController = ^IIterator_1__Haptics_ISimpleHapticsController;

  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IIterable_1__Haptics_ISimpleHapticsController = interface;
  PIIterable_1__Haptics_ISimpleHapticsController = ^IIterable_1__Haptics_ISimpleHapticsController;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IVectorView_1__Haptics_ISimpleHapticsController = interface;
  PIVectorView_1__Haptics_ISimpleHapticsController = ^IVectorView_1__Haptics_ISimpleHapticsController;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Devices Interfaces
  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.PointerDeviceUsage>
  IIterator_1__Input_PointerDeviceUsage_Base = interface(IInspectable)
  ['{9AB2160D-11EF-5ECA-8DD9-3E13AA4E5F99}']
  end;
  {
  // Used Types:  Windows.Devices.Input.PointerDeviceUsage
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.PointerDeviceUsage>
  IIterator_1__Input_PointerDeviceUsage = interface(IIterator_1__Input_PointerDeviceUsage_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Input_PointerDeviceUsage; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInput_PointerDeviceUsage): Cardinal; safecall;
    property Current: Input_PointerDeviceUsage read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Input.PointerDeviceUsage>
  IIterable_1__Input_PointerDeviceUsage_Base = interface(IInspectable)
  ['{592D6618-EAAB-5A79-A47A-C7FC0B749A4E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.PointerDeviceUsage>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Input.PointerDeviceUsage>
  IIterable_1__Input_PointerDeviceUsage = interface(IIterable_1__Input_PointerDeviceUsage_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Input_PointerDeviceUsage; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Custom.IOControlAccessMode
  // Used Types:  Windows.Devices.Custom.IOControlBufferingMethod
  // Used Types:  UInt16
  // Used Types:  UInt32
  }
  // Windows.Devices.Custom.IIOControlCode
  [WinRTClassNameAttribute(SCustom_IOControlCode)]
  Custom_IIOControlCode = interface(IInspectable)
  ['{0E9559E7-60C8-4375-A761-7F8808066C60}']
    function get_AccessMode: Custom_IOControlAccessMode; safecall;
    function get_BufferingMethod: Custom_IOControlBufferingMethod; safecall;
    function get_Function: Word; safecall;
    function get_DeviceType: Word; safecall;
    function get_ControlCode: Cardinal; safecall;
    property AccessMode: Custom_IOControlAccessMode read get_AccessMode;
    property BufferingMethod: Custom_IOControlBufferingMethod read get_BufferingMethod;
    property ControlCode: Cardinal read get_ControlCode;
    property DeviceType: Word read get_DeviceType;
    property &Function: Word read get_Function;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Custom.IIOControlCode
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.Custom.IOControlAccessMode
  // Used Types:  Windows.Devices.Custom.IOControlBufferingMethod
  }
  // Windows.Devices.Custom.IIOControlCodeFactory
  [WinRTClassNameAttribute(SCustom_IOControlCode)]
  Custom_IIOControlCodeFactory = interface(IInspectable)
  ['{856A7CF0-4C11-44AE-AFC6-B8D4A212788F}']
    function CreateIOControlCode(deviceType: Word; &function: Word; accessMode: Custom_IOControlAccessMode; bufferingMethod: Custom_IOControlBufferingMethod): Custom_IIOControlCode; safecall;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  Windows.Storage.Streams.IOutputStream
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Devices.Custom.IIOControlCode
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  }
  // Windows.Devices.Custom.ICustomDevice
  [WinRTClassNameAttribute(SCustom_CustomDevice)]
  Custom_ICustomDevice = interface(IInspectable)
  ['{DD30251F-C48B-43BD-BCB1-DEC88F15143E}']
    function get_InputStream: IInputStream; safecall;
    function get_OutputStream: IOutputStream; safecall;
    function SendIOControlAsync(ioControlCode: Custom_IIOControlCode; inputBuffer: IBuffer; outputBuffer: IBuffer): IAsyncOperation_1__Cardinal; safecall;
    function TrySendIOControlAsync(ioControlCode: Custom_IIOControlCode; inputBuffer: IBuffer; outputBuffer: IBuffer): IAsyncOperation_1__Boolean; safecall;
    property InputStream: IInputStream read get_InputStream;
    property OutputStream: IOutputStream read get_OutputStream;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Custom.ICustomDevice>
  AsyncOperationCompletedHandler_1__Custom_ICustomDevice_Delegate_Base = interface(IUnknown)
  ['{1FDD39B0-E0E5-5C59-B27D-A549B1075CE9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Custom.ICustomDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Custom.ICustomDevice>
  AsyncOperationCompletedHandler_1__Custom_ICustomDevice = interface(AsyncOperationCompletedHandler_1__Custom_ICustomDevice_Delegate_Base)
  ['{F995ECCF-238B-5D87-B018-22900725C5D2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Custom_ICustomDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Custom.ICustomDevice>
  IAsyncOperation_1__Custom_ICustomDevice_Base = interface(IInspectable)
  ['{2A6344AA-0568-548E-A1A2-B6BB451D228C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Custom.ICustomDevice>
  // Used Types:  Windows.Devices.Custom.ICustomDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Custom.ICustomDevice>
  IAsyncOperation_1__Custom_ICustomDevice = interface(IAsyncOperation_1__Custom_ICustomDevice_Base)
  ['{48D6D390-0051-5E26-913F-A2B6D168525F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Custom_ICustomDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Custom_ICustomDevice; safecall;
    function GetResults: Custom_ICustomDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Custom_ICustomDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Guid
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Custom.ICustomDevice>
  // Used Types:  Windows.Devices.Custom.DeviceAccessMode
  // Used Types:  Windows.Devices.Custom.DeviceSharingMode
  }
  // Windows.Devices.Custom.ICustomDeviceStatics
  [WinRTClassNameAttribute(SCustom_CustomDevice)]
  Custom_ICustomDeviceStatics = interface(IInspectable)
  ['{C8220312-EF4C-46B1-A58E-EEB308DC8917}']
    function GetDeviceSelector(classGuid: TGuid): HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING; desiredAccess: Custom_DeviceAccessMode; sharingMode: Custom_DeviceSharingMode): IAsyncOperation_1__Custom_ICustomDevice; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Adc.Provider.ProviderAdcChannelMode
  // Used Types:  Boolean
  }
  // Windows.Devices.Adc.Provider.IAdcControllerProvider
  Adc_Provider_IAdcControllerProvider = interface(IInspectable)
  ['{BE545828-816D-4DE5-A048-ABA06958AAA8}']
    function get_ChannelCount: Integer; safecall;
    function get_ResolutionInBits: Integer; safecall;
    function get_MinValue: Integer; safecall;
    function get_MaxValue: Integer; safecall;
    function get_ChannelMode: Adc_Provider_ProviderAdcChannelMode; safecall;
    procedure put_ChannelMode(value: Adc_Provider_ProviderAdcChannelMode); safecall;
    function IsChannelModeSupported(channelMode: Adc_Provider_ProviderAdcChannelMode): Boolean; safecall;
    procedure AcquireChannel(channel: Integer); safecall;
    procedure ReleaseChannel(channel: Integer); safecall;
    function ReadValue(channelNumber: Integer): Integer; safecall;
    property ChannelCount: Integer read get_ChannelCount;
    property ChannelMode: Adc_Provider_ProviderAdcChannelMode read get_ChannelMode write put_ChannelMode;
    property MaxValue: Integer read get_MaxValue;
    property MinValue: Integer read get_MinValue;
    property ResolutionInBits: Integer read get_ResolutionInBits;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IIterator_1__Adc_Provider_IAdcControllerProvider_Base = interface(IInspectable)
  ['{B43ACF15-A24A-5B00-B710-1737BA550A18}']
  end;
  {
  // Used Types:  Windows.Devices.Adc.Provider.IAdcControllerProvider
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IIterator_1__Adc_Provider_IAdcControllerProvider = interface(IIterator_1__Adc_Provider_IAdcControllerProvider_Base)
  ['{B43ACF15-A24A-5B00-B710-1737BA550A18}']
    function get_Current: Adc_Provider_IAdcControllerProvider; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAdc_Provider_IAdcControllerProvider): Cardinal; safecall;
    property Current: Adc_Provider_IAdcControllerProvider read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IIterable_1__Adc_Provider_IAdcControllerProvider_Base = interface(IInspectable)
  ['{30047155-1F71-5223-8482-E5159D0137D0}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IIterable_1__Adc_Provider_IAdcControllerProvider = interface(IIterable_1__Adc_Provider_IAdcControllerProvider_Base)
  ['{30047155-1F71-5223-8482-E5159D0137D0}']
    function First: IIterator_1__Adc_Provider_IAdcControllerProvider; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Adc.Provider.IAdcControllerProvider
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  IVectorView_1__Adc_Provider_IAdcControllerProvider = interface(IInspectable)
  ['{7C4789C0-8445-5757-AAB7-659CBF50AAA7}']
    function GetAt(index: Cardinal): Adc_Provider_IAdcControllerProvider; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Adc_Provider_IAdcControllerProvider; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAdc_Provider_IAdcControllerProvider): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.Provider.IAdcControllerProvider>
  }
  // Windows.Devices.Adc.Provider.IAdcProvider
  Adc_Provider_IAdcProvider = interface(IInspectable)
  ['{28953668-9359-4C57-BC88-E275E81638C9}']
    function GetControllers: IVectorView_1__Adc_Provider_IAdcControllerProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Adc.IAdcController
  // Used Types:  Int32
  // Used Types:  Double
  }
  // Windows.Devices.Adc.IAdcChannel
  [WinRTClassNameAttribute(SAdc_AdcChannel)]
  Adc_IAdcChannel = interface(IInspectable)
  ['{040BF414-2588-4A56-ABEF-73A260ACC60A}']
    function get_Controller: Adc_IAdcController; safecall;
    function ReadValue: Integer; safecall;
    function ReadRatio: Double; safecall;
    property Controller: Adc_IAdcController read get_Controller;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Adc.AdcChannelMode
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Adc.IAdcChannel
  }
  // Windows.Devices.Adc.IAdcController
  [WinRTClassNameAttribute(SAdc_AdcController)]
  Adc_IAdcController = interface(IInspectable)
  ['{2A76E4B0-A896-4219-86B6-EA8CDCE98F56}']
    function get_ChannelCount: Integer; safecall;
    function get_ResolutionInBits: Integer; safecall;
    function get_MinValue: Integer; safecall;
    function get_MaxValue: Integer; safecall;
    function get_ChannelMode: Adc_AdcChannelMode; safecall;
    procedure put_ChannelMode(value: Adc_AdcChannelMode); safecall;
    function IsChannelModeSupported(channelMode: Adc_AdcChannelMode): Boolean; safecall;
    function OpenChannel(channelNumber: Integer): Adc_IAdcChannel; safecall;
    property ChannelCount: Integer read get_ChannelCount;
    property ChannelMode: Adc_AdcChannelMode read get_ChannelMode write put_ChannelMode;
    property MaxValue: Integer read get_MaxValue;
    property MinValue: Integer read get_MinValue;
    property ResolutionInBits: Integer read get_ResolutionInBits;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.IAdcController>
  IIterator_1__Adc_IAdcController_Base = interface(IInspectable)
  ['{A10B62C1-A014-5335-8867-747FCAB16005}']
  end;
  {
  // Used Types:  Windows.Devices.Adc.IAdcController
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.IAdcController>
  IIterator_1__Adc_IAdcController = interface(IIterator_1__Adc_IAdcController_Base)
  ['{BC4C8ADF-96F0-5F86-A077-CA3E51969021}']
    function get_Current: Adc_IAdcController; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAdc_IAdcController): Cardinal; safecall;
    property Current: Adc_IAdcController read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Adc.IAdcController>
  IIterable_1__Adc_IAdcController_Base = interface(IInspectable)
  ['{4E478AAD-4861-5758-B64B-5B4F28D8F86E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Adc.IAdcController>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Adc.IAdcController>
  IIterable_1__Adc_IAdcController = interface(IIterable_1__Adc_IAdcController_Base)
  ['{38FC1E06-32FF-56E7-8BC6-5952085EE69A}']
    function First: IIterator_1__Adc_IAdcController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Adc.IAdcController
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>
  IVectorView_1__Adc_IAdcController = interface(IInspectable)
  ['{706FC9A6-CC21-545F-94AE-A87FF514A04A}']
    function GetAt(index: Cardinal): Adc_IAdcController; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Adc_IAdcController; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAdc_IAdcController): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController_Delegate_Base = interface(IUnknown)
  ['{7C4038C8-D920-53C7-A5D6-A976070D7637}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController_Delegate_Base)
  ['{8AD20A44-9E0A-5A8C-9B3E-0A2AAC874991}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Adc_IAdcController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  IAsyncOperation_1__IVectorView_1__Adc_IAdcController_Base = interface(IInspectable)
  ['{1B0CDDFB-D255-5A93-BCB9-DE2047A3E4F3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  IAsyncOperation_1__IVectorView_1__Adc_IAdcController = interface(IAsyncOperation_1__IVectorView_1__Adc_IAdcController_Base)
  ['{FA115F33-839D-5CC0-B43B-6C8B81525274}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController; safecall;
    function GetResults: IVectorView_1__Adc_IAdcController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Adc_IAdcController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Adc.IAdcController>>
  // Used Types:  Windows.Devices.Adc.Provider.IAdcProvider
  }
  // Windows.Devices.Adc.IAdcControllerStatics
  [WinRTClassNameAttribute(SAdc_AdcController)]
  Adc_IAdcControllerStatics = interface(IInspectable)
  ['{CCE98E0C-01F8-4891-BC3B-BE53EF279CA4}']
    function GetControllersAsync(provider: Adc_Provider_IAdcProvider): IAsyncOperation_1__IVectorView_1__Adc_IAdcController; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Adc.IAdcController>
  AsyncOperationCompletedHandler_1__Adc_IAdcController_Delegate_Base = interface(IUnknown)
  ['{BAF66488-202F-5D51-B05E-18606C46B808}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Adc.IAdcController>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Adc.IAdcController>
  AsyncOperationCompletedHandler_1__Adc_IAdcController = interface(AsyncOperationCompletedHandler_1__Adc_IAdcController_Delegate_Base)
  ['{E6EC9449-76CF-505E-A0BA-C6D1889B2E38}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Adc_IAdcController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Adc.IAdcController>
  IAsyncOperation_1__Adc_IAdcController_Base = interface(IInspectable)
  ['{69420262-35C9-583F-A40E-C2694562C9E2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Adc.IAdcController>
  // Used Types:  Windows.Devices.Adc.IAdcController
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Adc.IAdcController>
  IAsyncOperation_1__Adc_IAdcController = interface(IAsyncOperation_1__Adc_IAdcController_Base)
  ['{784B090A-0F91-5020-8891-B4450D076EC8}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Adc_IAdcController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Adc_IAdcController; safecall;
    function GetResults: Adc_IAdcController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Adc_IAdcController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Adc.IAdcController>
  }
  // Windows.Devices.Adc.IAdcControllerStatics2
  [WinRTClassNameAttribute(SAdc_AdcController)]
  Adc_IAdcControllerStatics2 = interface(IInspectable)
  ['{A2B93B1D-977B-4F5A-A5FE-A6ABAFFE6484}']
    function GetDefaultAsync: IAsyncOperation_1__Adc_IAdcController; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
  }
  // Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
  [WinRTClassNameAttribute(SGpio_Provider_GpioPinProviderValueChangedEventArgs)]
  Gpio_Provider_IGpioPinProviderValueChangedEventArgs = interface(IInspectable)
  ['{32A6D6F2-3D5B-44CD-8FBE-13A69F2EDB24}']
    function get_Edge: Gpio_Provider_ProviderGpioPinEdge; safecall;
    property Edge: Gpio_Provider_ProviderGpioPinEdge read get_Edge;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
  // Used Types:  Windows.Devices.Gpio.Provider.ProviderGpioPinEdge
  }
  // Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgsFactory
  [WinRTClassNameAttribute(SGpio_Provider_GpioPinProviderValueChangedEventArgs)]
  Gpio_Provider_IGpioPinProviderValueChangedEventArgsFactory = interface(IInspectable)
  ['{3ECB0B59-568C-4392-B24A-8A59A902B1F1}']
    function Create(edge: Gpio_Provider_ProviderGpioPinEdge): Gpio_Provider_IGpioPinProviderValueChangedEventArgs; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.Provider.IGpioPinProvider,Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs>
  TypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{AF259D89-9E01-529E-A879-C6763142D160}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioPinProvider
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.Provider.IGpioPinProvider,Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs>
  TypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs = interface(TypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs_Delegate_Base)
  ['{F0A62C5E-0CF0-5C1D-AC81-838A2034BB19}']
    procedure Invoke(sender: Gpio_Provider_IGpioPinProvider; args: Gpio_Provider_IGpioPinProviderValueChangedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.Provider.IGpioPinProvider,Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Gpio.Provider.ProviderGpioSharingMode
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Gpio.Provider.ProviderGpioPinDriveMode
  // Used Types:  Windows.Devices.Gpio.Provider.ProviderGpioPinValue
  }
  // Windows.Devices.Gpio.Provider.IGpioPinProvider
  Gpio_Provider_IGpioPinProvider = interface(IInspectable)
  ['{42344CB7-6ABC-40FF-9CE7-73B85301B900}']
    function add_ValueChanged(handler: TypedEventHandler_2__Gpio_Provider_IGpioPinProvider__Gpio_Provider_IGpioPinProviderValueChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ValueChanged(token: EventRegistrationToken); safecall;
    function get_DebounceTimeout: TimeSpan; safecall;
    procedure put_DebounceTimeout(value: TimeSpan); safecall;
    function get_PinNumber: Integer; safecall;
    function get_SharingMode: Gpio_Provider_ProviderGpioSharingMode; safecall;
    function IsDriveModeSupported(driveMode: Gpio_Provider_ProviderGpioPinDriveMode): Boolean; safecall;
    function GetDriveMode: Gpio_Provider_ProviderGpioPinDriveMode; safecall;
    procedure SetDriveMode(value: Gpio_Provider_ProviderGpioPinDriveMode); safecall;
    procedure Write(value: Gpio_Provider_ProviderGpioPinValue); safecall;
    function Read: Gpio_Provider_ProviderGpioPinValue; safecall;
    property DebounceTimeout: TimeSpan read get_DebounceTimeout write put_DebounceTimeout;
    property PinNumber: Integer read get_PinNumber;
    property SharingMode: Gpio_Provider_ProviderGpioSharingMode read get_SharingMode;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioPinProvider
  // Used Types:  Windows.Devices.Gpio.Provider.ProviderGpioSharingMode
  }
  // Windows.Devices.Gpio.Provider.IGpioControllerProvider
  Gpio_Provider_IGpioControllerProvider = interface(IInspectable)
  ['{AD11CEC7-19EA-4B21-874F-B91AED4A25DB}']
    function get_PinCount: Integer; safecall;
    function OpenPinProvider(pin: Integer; sharingMode: Gpio_Provider_ProviderGpioSharingMode): Gpio_Provider_IGpioPinProvider; safecall;
    property PinCount: Integer read get_PinCount;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IIterator_1__Gpio_Provider_IGpioControllerProvider_Base = interface(IInspectable)
  ['{6AC0EDB9-E3C9-5840-8AA8-1BC45366F6CA}']
  end;
  {
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioControllerProvider
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IIterator_1__Gpio_Provider_IGpioControllerProvider = interface(IIterator_1__Gpio_Provider_IGpioControllerProvider_Base)
  ['{6AC0EDB9-E3C9-5840-8AA8-1BC45366F6CA}']
    function get_Current: Gpio_Provider_IGpioControllerProvider; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGpio_Provider_IGpioControllerProvider): Cardinal; safecall;
    property Current: Gpio_Provider_IGpioControllerProvider read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IIterable_1__Gpio_Provider_IGpioControllerProvider_Base = interface(IInspectable)
  ['{09212BD4-851B-52BD-B82C-421BF3D6F511}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IIterable_1__Gpio_Provider_IGpioControllerProvider = interface(IIterable_1__Gpio_Provider_IGpioControllerProvider_Base)
  ['{09212BD4-851B-52BD-B82C-421BF3D6F511}']
    function First: IIterator_1__Gpio_Provider_IGpioControllerProvider; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioControllerProvider
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  IVectorView_1__Gpio_Provider_IGpioControllerProvider = interface(IInspectable)
  ['{F429355F-7A16-5DCF-A575-DB7D2A20ECED}']
    function GetAt(index: Cardinal): Gpio_Provider_IGpioControllerProvider; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Gpio_Provider_IGpioControllerProvider; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGpio_Provider_IGpioControllerProvider): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.Provider.IGpioControllerProvider>
  }
  // Windows.Devices.Gpio.Provider.IGpioProvider
  Gpio_Provider_IGpioProvider = interface(IInspectable)
  ['{44E82707-08CA-434A-AFE0-D61580446F7E}']
    function GetControllers: IVectorView_1__Gpio_Provider_IGpioControllerProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.GpioPinEdge
  }
  // Windows.Devices.Gpio.IGpioPinValueChangedEventArgs
  [WinRTClassNameAttribute(SGpio_GpioPinValueChangedEventArgs)]
  Gpio_IGpioPinValueChangedEventArgs = interface(IInspectable)
  ['{3137AAE1-703D-4059-BD24-B5B25DFFB84E}']
    function get_Edge: Gpio_GpioPinEdge; safecall;
    property Edge: Gpio_GpioPinEdge read get_Edge;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.IGpioPin,Windows.Devices.Gpio.IGpioPinValueChangedEventArgs>
  TypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{44BA689B-7D42-5374-ADD9-AB41E877A34B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.IGpioPin
  // Used Types:  Windows.Devices.Gpio.IGpioPinValueChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.IGpioPin,Windows.Devices.Gpio.IGpioPinValueChangedEventArgs>
  TypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs = interface(TypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs_Delegate_Base)
  ['{89CD5658-EF05-5CED-AA39-C52298A93BBE}']
    procedure Invoke(sender: Gpio_IGpioPin; args: Gpio_IGpioPinValueChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Gpio.IGpioPin,Windows.Devices.Gpio.IGpioPinValueChangedEventArgs>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Gpio.GpioSharingMode
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Gpio.GpioPinDriveMode
  // Used Types:  Windows.Devices.Gpio.GpioPinValue
  }
  // Windows.Devices.Gpio.IGpioPin
  [WinRTClassNameAttribute(SGpio_GpioPin)]
  Gpio_IGpioPin = interface(IInspectable)
  ['{11D9B087-AFAE-4790-9EE9-E0EAC942D201}']
    function add_ValueChanged(handler: TypedEventHandler_2__Gpio_IGpioPin__Gpio_IGpioPinValueChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ValueChanged(token: EventRegistrationToken); safecall;
    function get_DebounceTimeout: TimeSpan; safecall;
    procedure put_DebounceTimeout(value: TimeSpan); safecall;
    function get_PinNumber: Integer; safecall;
    function get_SharingMode: Gpio_GpioSharingMode; safecall;
    function IsDriveModeSupported(driveMode: Gpio_GpioPinDriveMode): Boolean; safecall;
    function GetDriveMode: Gpio_GpioPinDriveMode; safecall;
    procedure SetDriveMode(value: Gpio_GpioPinDriveMode); safecall;
    procedure Write(value: Gpio_GpioPinValue); safecall;
    function Read: Gpio_GpioPinValue; safecall;
    property DebounceTimeout: TimeSpan read get_DebounceTimeout write put_DebounceTimeout;
    property PinNumber: Integer read get_PinNumber;
    property SharingMode: Gpio_GpioSharingMode read get_SharingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Gpio.IGpioPin
  // Used Types:  Windows.Devices.Gpio.GpioSharingMode
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Gpio.GpioOpenStatus
  }
  // Windows.Devices.Gpio.IGpioController
  [WinRTClassNameAttribute(SGpio_GpioController)]
  Gpio_IGpioController = interface(IInspectable)
  ['{284012E3-7461-469C-A8BC-61D69D08A53C}']
    function get_PinCount: Integer; safecall;
    function OpenPin(pinNumber: Integer): Gpio_IGpioPin; overload; safecall;
    function OpenPin(pinNumber: Integer; sharingMode: Gpio_GpioSharingMode): Gpio_IGpioPin; overload; safecall;
    function TryOpenPin(pinNumber: Integer; sharingMode: Gpio_GpioSharingMode; out pin: Gpio_IGpioPin; out openStatus: Gpio_GpioOpenStatus): Boolean; safecall;
    property PinCount: Integer read get_PinCount;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.IGpioController
  }
  // Windows.Devices.Gpio.IGpioControllerStatics
  [WinRTClassNameAttribute(SGpio_GpioController)]
  Gpio_IGpioControllerStatics = interface(IInspectable)
  ['{2ED6F42E-7AF7-4116-9533-C43D99A1FB64}']
    function GetDefault: Gpio_IGpioController; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.IGpioController>
  IIterator_1__Gpio_IGpioController_Base = interface(IInspectable)
  ['{67944DB0-6C56-5A2F-9E7B-63CA1AA8C411}']
  end;
  {
  // Used Types:  Windows.Devices.Gpio.IGpioController
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.IGpioController>
  IIterator_1__Gpio_IGpioController = interface(IIterator_1__Gpio_IGpioController_Base)
  ['{603C01C4-8465-5668-B2F2-B4C44E8F7AC1}']
    function get_Current: Gpio_IGpioController; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGpio_IGpioController): Cardinal; safecall;
    property Current: Gpio_IGpioController read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.IGpioController>
  IIterable_1__Gpio_IGpioController_Base = interface(IInspectable)
  ['{415C3794-B2B6-5F5C-9A05-AE9268514726}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.IGpioController>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.IGpioController>
  IIterable_1__Gpio_IGpioController = interface(IIterable_1__Gpio_IGpioController_Base)
  ['{85DF6ACD-77F8-5640-910F-FED2DC82824A}']
    function First: IIterator_1__Gpio_IGpioController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.IGpioController
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>
  IVectorView_1__Gpio_IGpioController = interface(IInspectable)
  ['{88121F4A-7A82-5E04-9D18-F29C074EBA84}']
    function GetAt(index: Cardinal): Gpio_IGpioController; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Gpio_IGpioController; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGpio_IGpioController): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController_Delegate_Base = interface(IUnknown)
  ['{EE427F2E-7D37-558F-9718-9CBCBFF40C94}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController_Delegate_Base)
  ['{9D8CFCAC-AA68-5DF6-987E-5A467821C8C2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Gpio_IGpioController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  IAsyncOperation_1__IVectorView_1__Gpio_IGpioController_Base = interface(IInspectable)
  ['{5DA3FAF4-60A7-5A14-9319-3941DFB13FED}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  IAsyncOperation_1__IVectorView_1__Gpio_IGpioController = interface(IAsyncOperation_1__IVectorView_1__Gpio_IGpioController_Base)
  ['{5CD8A977-7A88-593A-840C-1EBBC58D1552}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController; safecall;
    function GetResults: IVectorView_1__Gpio_IGpioController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Gpio_IGpioController read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Gpio.IGpioController>
  AsyncOperationCompletedHandler_1__Gpio_IGpioController_Delegate_Base = interface(IUnknown)
  ['{370167C0-0F7B-5E77-9BAE-D35089A3DB75}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Gpio.IGpioController>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Gpio.IGpioController>
  AsyncOperationCompletedHandler_1__Gpio_IGpioController = interface(AsyncOperationCompletedHandler_1__Gpio_IGpioController_Delegate_Base)
  ['{33AF6B5E-442A-5A3E-A4EC-1C4050C81F0A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Gpio_IGpioController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Gpio.IGpioController>
  IAsyncOperation_1__Gpio_IGpioController_Base = interface(IInspectable)
  ['{ED045917-96C7-5735-B4BE-D79619D4835E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Gpio.IGpioController>
  // Used Types:  Windows.Devices.Gpio.IGpioController
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Gpio.IGpioController>
  IAsyncOperation_1__Gpio_IGpioController = interface(IAsyncOperation_1__Gpio_IGpioController_Base)
  ['{B8AFBD34-D020-55FC-BCD6-C461B4C414D1}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Gpio_IGpioController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Gpio_IGpioController; safecall;
    function GetResults: Gpio_IGpioController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Gpio_IGpioController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.IGpioController>>
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioProvider
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Gpio.IGpioController>
  }
  // Windows.Devices.Gpio.IGpioControllerStatics2
  [WinRTClassNameAttribute(SGpio_GpioController)]
  Gpio_IGpioControllerStatics2 = interface(IInspectable)
  ['{912B7D20-6CA4-4106-A373-FFFD346B0E5B}']
    function GetControllersAsync(provider: Gpio_Provider_IGpioProvider): IAsyncOperation_1__IVectorView_1__Gpio_IGpioController; safecall;
    function GetDefaultAsync: IAsyncOperation_1__Gpio_IGpioController; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.GpioChangeRecord>
  IIterator_1__Gpio_GpioChangeRecord_Base = interface(IInspectable)
  ['{A4C620B9-CB89-5A25-BF16-5F412C1A3388}']
  end;
  {
  // Used Types:  Windows.Devices.Gpio.GpioChangeRecord
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.GpioChangeRecord>
  IIterator_1__Gpio_GpioChangeRecord = interface(IIterator_1__Gpio_GpioChangeRecord_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Gpio_GpioChangeRecord; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PGpio_GpioChangeRecord): Cardinal; safecall;
    property Current: Gpio_GpioChangeRecord read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.GpioChangeRecord>
  IIterable_1__Gpio_GpioChangeRecord_Base = interface(IInspectable)
  ['{B4AFBF4F-620E-5725-878A-78C6ED10374E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Gpio.GpioChangeRecord>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Gpio.GpioChangeRecord>
  IIterable_1__Gpio_GpioChangeRecord = interface(IIterable_1__Gpio_GpioChangeRecord_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Gpio_GpioChangeRecord; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.GpioChangeRecord
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.GpioChangeRecord>
  IVectorView_1__Gpio_GpioChangeRecord = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Gpio_GpioChangeRecord; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Gpio_GpioChangeRecord; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGpio_GpioChangeRecord): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.GpioChangeRecord
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Gpio.GpioChangeRecord>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.Gpio.GpioChangeRecord>
  IVector_1__Gpio_GpioChangeRecord = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): Gpio_GpioChangeRecord; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Gpio_GpioChangeRecord; safecall;
    function IndexOf(value: Gpio_GpioChangeRecord; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Gpio_GpioChangeRecord); safecall;
    procedure InsertAt(index: Cardinal; value: Gpio_GpioChangeRecord); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Gpio_GpioChangeRecord); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PGpio_GpioChangeRecord): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PGpio_GpioChangeRecord); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Gpio.GpioChangePolarity
  // Used Types:  Windows.Devices.Gpio.GpioChangeRecord
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.Gpio.GpioChangeRecord>
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Devices.Gpio.IGpioChangeReader
  [WinRTClassNameAttribute(SGpio_GpioChangeReader)]
  Gpio_IGpioChangeReader = interface(IInspectable)
  ['{0ABC885F-E031-48E8-8590-70DE78363C6D}']
    function get_Capacity: Integer; safecall;
    function get_Length: Integer; safecall;
    function get_IsEmpty: Boolean; safecall;
    function get_IsOverflowed: Boolean; safecall;
    procedure put_Polarity(value: Gpio_GpioChangePolarity); safecall;
    function get_Polarity: Gpio_GpioChangePolarity; safecall;
    function get_IsStarted: Boolean; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure Clear; safecall;
    function GetNextItem: Gpio_GpioChangeRecord; safecall;
    function PeekNextItem: Gpio_GpioChangeRecord; safecall;
    function GetAllItems: IVector_1__Gpio_GpioChangeRecord; safecall;
    function WaitForItemsAsync(count: Integer): IAsyncAction; safecall;
    property Capacity: Integer read get_Capacity;
    property IsEmpty: Boolean read get_IsEmpty;
    property IsOverflowed: Boolean read get_IsOverflowed;
    property IsStarted: Boolean read get_IsStarted;
    property Length: Integer read get_Length;
    property Polarity: Gpio_GpioChangePolarity read get_Polarity write put_Polarity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.IGpioChangeReader
  // Used Types:  Windows.Devices.Gpio.IGpioPin
  // Used Types:  Int32
  }
  // Windows.Devices.Gpio.IGpioChangeReaderFactory
  [WinRTClassNameAttribute(SGpio_GpioChangeReader)]
  Gpio_IGpioChangeReaderFactory = interface(IInspectable)
  ['{A9598EF3-390E-441A-9D1C-E8DE0B2DF0DF}']
    function Create(pin: Gpio_IGpioPin): Gpio_IGpioChangeReader; safecall;
    function CreateWithCapacity(pin: Gpio_IGpioPin; minCapacity: Integer): Gpio_IGpioChangeReader; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.GpioChangePolarity
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Gpio.GpioChangeCount
  }
  // Windows.Devices.Gpio.IGpioChangeCounter
  [WinRTClassNameAttribute(SGpio_GpioChangeCounter)]
  Gpio_IGpioChangeCounter = interface(IInspectable)
  ['{CB5EC0DE-6801-43FF-803D-4576628A8B26}']
    procedure put_Polarity(value: Gpio_GpioChangePolarity); safecall;
    function get_Polarity: Gpio_GpioChangePolarity; safecall;
    function get_IsStarted: Boolean; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    function Read: Gpio_GpioChangeCount; safecall;
    function Reset: Gpio_GpioChangeCount; safecall;
    property IsStarted: Boolean read get_IsStarted;
    property Polarity: Gpio_GpioChangePolarity read get_Polarity write put_Polarity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Gpio.IGpioChangeCounter
  // Used Types:  Windows.Devices.Gpio.IGpioPin
  }
  // Windows.Devices.Gpio.IGpioChangeCounterFactory
  [WinRTClassNameAttribute(SGpio_GpioChangeCounter)]
  Gpio_IGpioChangeCounterFactory = interface(IInspectable)
  ['{147D94B6-0A9E-410C-B4FA-F89F4052084D}']
    function Create(pin: Gpio_IGpioPin): Gpio_IGpioChangeCounter; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.I2c.Provider.ProviderI2cBusSpeed
  // Used Types:  Windows.Devices.I2c.Provider.ProviderI2cSharingMode
  }
  // Windows.Devices.I2c.Provider.IProviderI2cConnectionSettings
  [WinRTClassNameAttribute(SI2c_Provider_ProviderI2cConnectionSettings)]
  I2c_Provider_IProviderI2cConnectionSettings = interface(IInspectable)
  ['{E9DB4E34-E510-44B7-809D-F2F85B555339}']
    function get_SlaveAddress: Integer; safecall;
    procedure put_SlaveAddress(value: Integer); safecall;
    function get_BusSpeed: I2c_Provider_ProviderI2cBusSpeed; safecall;
    procedure put_BusSpeed(value: I2c_Provider_ProviderI2cBusSpeed); safecall;
    function get_SharingMode: I2c_Provider_ProviderI2cSharingMode; safecall;
    procedure put_SharingMode(value: I2c_Provider_ProviderI2cSharingMode); safecall;
    property BusSpeed: I2c_Provider_ProviderI2cBusSpeed read get_BusSpeed write put_BusSpeed;
    property SharingMode: I2c_Provider_ProviderI2cSharingMode read get_SharingMode write put_SharingMode;
    property SlaveAddress: Integer read get_SlaveAddress write put_SlaveAddress;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.I2c.Provider.ProviderI2cTransferResult
  }
  // Windows.Devices.I2c.Provider.II2cDeviceProvider
  I2c_Provider_II2cDeviceProvider = interface(IInspectable)
  ['{AD342654-57E8-453E-8329-D1E447D103A9}']
    function get_DeviceId: HSTRING; safecall;
    procedure Write(bufferSize: Cardinal; buffer: PByte); safecall;
    function WritePartial(bufferSize: Cardinal; buffer: PByte): I2c_Provider_ProviderI2cTransferResult; safecall;
    procedure Read(bufferSize: Cardinal; buffer: PByte); safecall;
    function ReadPartial(bufferSize: Cardinal; buffer: PByte): I2c_Provider_ProviderI2cTransferResult; safecall;
    procedure WriteRead(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte); safecall;
    function WriteReadPartial(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte): I2c_Provider_ProviderI2cTransferResult; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.I2c.Provider.II2cDeviceProvider
  // Used Types:  Windows.Devices.I2c.Provider.IProviderI2cConnectionSettings
  }
  // Windows.Devices.I2c.Provider.II2cControllerProvider
  I2c_Provider_II2cControllerProvider = interface(IInspectable)
  ['{61C2BB82-4510-4163-A87C-4E15A9558980}']
    function GetDeviceProvider(settings: I2c_Provider_IProviderI2cConnectionSettings): I2c_Provider_II2cDeviceProvider; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IIterator_1__I2c_Provider_II2cControllerProvider_Base = interface(IInspectable)
  ['{F6232961-C660-50A1-82E8-12892FCD91F7}']
  end;
  {
  // Used Types:  Windows.Devices.I2c.Provider.II2cControllerProvider
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IIterator_1__I2c_Provider_II2cControllerProvider = interface(IIterator_1__I2c_Provider_II2cControllerProvider_Base)
  ['{F6232961-C660-50A1-82E8-12892FCD91F7}']
    function get_Current: I2c_Provider_II2cControllerProvider; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PI2c_Provider_II2cControllerProvider): Cardinal; safecall;
    property Current: I2c_Provider_II2cControllerProvider read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IIterable_1__I2c_Provider_II2cControllerProvider_Base = interface(IInspectable)
  ['{11341A6C-3A02-5F73-9DB8-C3EC5823E35D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IIterable_1__I2c_Provider_II2cControllerProvider = interface(IIterable_1__I2c_Provider_II2cControllerProvider_Base)
  ['{11341A6C-3A02-5F73-9DB8-C3EC5823E35D}']
    function First: IIterator_1__I2c_Provider_II2cControllerProvider; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.I2c.Provider.II2cControllerProvider
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  IVectorView_1__I2c_Provider_II2cControllerProvider = interface(IInspectable)
  ['{511F8A39-98CA-550D-AF25-1DF2C1193C01}']
    function GetAt(index: Cardinal): I2c_Provider_II2cControllerProvider; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: I2c_Provider_II2cControllerProvider; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PI2c_Provider_II2cControllerProvider): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider_Delegate_Base = interface(IUnknown)
  ['{771E22ED-DA9E-50BE-B730-A3BADA6BFB25}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider = interface(AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider_Delegate_Base)
  ['{771E22ED-DA9E-50BE-B730-A3BADA6BFB25}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider_Base = interface(IInspectable)
  ['{5FE77838-1125-5B2C-A281-E06A3DFBB76E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider = interface(IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider_Base)
  ['{5FE77838-1125-5B2C-A281-E06A3DFBB76E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider; safecall;
    function GetResults: IVectorView_1__I2c_Provider_II2cControllerProvider; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__I2c_Provider_II2cControllerProvider read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.Provider.II2cControllerProvider>>
  }
  // Windows.Devices.I2c.Provider.II2cProvider
  I2c_Provider_II2cProvider = interface(IInspectable)
  ['{6F13083E-BF62-4FE2-A95A-F08999669818}']
    function GetControllersAsync: IAsyncOperation_1__IVectorView_1__I2c_Provider_II2cControllerProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.I2c.I2cBusSpeed
  // Used Types:  Windows.Devices.I2c.I2cSharingMode
  }
  // Windows.Devices.I2c.II2cConnectionSettings
  [WinRTClassNameAttribute(SI2c_I2cConnectionSettings)]
  I2c_II2cConnectionSettings = interface(IInspectable)
  ['{F2DB1307-AB6F-4639-A767-54536DC3460F}']
    function get_SlaveAddress: Integer; safecall;
    procedure put_SlaveAddress(value: Integer); safecall;
    function get_BusSpeed: I2c_I2cBusSpeed; safecall;
    procedure put_BusSpeed(value: I2c_I2cBusSpeed); safecall;
    function get_SharingMode: I2c_I2cSharingMode; safecall;
    procedure put_SharingMode(value: I2c_I2cSharingMode); safecall;
    property BusSpeed: I2c_I2cBusSpeed read get_BusSpeed write put_BusSpeed;
    property SharingMode: I2c_I2cSharingMode read get_SharingMode write put_SharingMode;
    property SlaveAddress: Integer read get_SlaveAddress write put_SlaveAddress;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.I2c.II2cConnectionSettings
  // Used Types:  Int32
  }
  // Windows.Devices.I2c.II2cConnectionSettingsFactory
  [WinRTClassNameAttribute(SI2c_I2cConnectionSettings)]
  I2c_II2cConnectionSettingsFactory = interface(IInspectable)
  ['{81B586B3-9693-41B1-A243-DED4F6E66926}']
    function Create(slaveAddress: Integer): I2c_II2cConnectionSettings; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.I2c.II2cConnectionSettings
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.I2c.I2cTransferResult
  }
  // Windows.Devices.I2c.II2cDevice
  [WinRTClassNameAttribute(SI2c_I2cDevice)]
  I2c_II2cDevice = interface(IInspectable)
  ['{8636C136-B9C5-4F70-9449-CC46DC6F57EB}']
    function get_DeviceId: HSTRING; safecall;
    function get_ConnectionSettings: I2c_II2cConnectionSettings; safecall;
    procedure Write(bufferSize: Cardinal; buffer: PByte); safecall;
    function WritePartial(bufferSize: Cardinal; buffer: PByte): I2c_I2cTransferResult; safecall;
    procedure Read(bufferSize: Cardinal; buffer: PByte); safecall;
    function ReadPartial(bufferSize: Cardinal; buffer: PByte): I2c_I2cTransferResult; safecall;
    procedure WriteRead(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte); safecall;
    function WriteReadPartial(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte): I2c_I2cTransferResult; safecall;
    property ConnectionSettings: I2c_II2cConnectionSettings read get_ConnectionSettings;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cDevice>
  AsyncOperationCompletedHandler_1__I2c_II2cDevice_Delegate_Base = interface(IUnknown)
  ['{2DF5BB6A-5E73-5AE3-A0B2-22E1C9D8EF4D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cDevice>
  AsyncOperationCompletedHandler_1__I2c_II2cDevice = interface(AsyncOperationCompletedHandler_1__I2c_II2cDevice_Delegate_Base)
  ['{7945B4C9-BCBE-5FCA-AC9C-AF3D854C9708}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__I2c_II2cDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cDevice>
  IAsyncOperation_1__I2c_II2cDevice_Base = interface(IInspectable)
  ['{1E8A7CD8-E41B-5A41-82B1-80055012AE00}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cDevice>
  // Used Types:  Windows.Devices.I2c.II2cDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cDevice>
  IAsyncOperation_1__I2c_II2cDevice = interface(IAsyncOperation_1__I2c_II2cDevice_Base)
  ['{E4A484D9-E8CF-5B8E-A035-26B5371180B4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__I2c_II2cDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__I2c_II2cDevice; safecall;
    function GetResults: I2c_II2cDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__I2c_II2cDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cDevice>
  // Used Types:  Windows.Devices.I2c.II2cConnectionSettings
  }
  // Windows.Devices.I2c.II2cDeviceStatics
  [WinRTClassNameAttribute(SI2c_I2cDevice)]
  I2c_II2cDeviceStatics = interface(IInspectable)
  ['{91A33BE3-7334-4512-96BC-FBAE9459F5F6}']
    function GetDeviceSelector: HSTRING; overload; safecall;
    function GetDeviceSelector(friendlyName: HSTRING): HSTRING; overload; safecall;
    function FromIdAsync(deviceId: HSTRING; settings: I2c_II2cConnectionSettings): IAsyncOperation_1__I2c_II2cDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.I2c.II2cDevice
  // Used Types:  Windows.Devices.I2c.II2cConnectionSettings
  }
  // Windows.Devices.I2c.II2cController
  [WinRTClassNameAttribute(SI2c_I2cController)]
  I2c_II2cController = interface(IInspectable)
  ['{C48AB1B2-87A0-4166-8E3E-B4B8F97CD729}']
    function GetDevice(settings: I2c_II2cConnectionSettings): I2c_II2cDevice; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.II2cController>
  IIterator_1__I2c_II2cController_Base = interface(IInspectable)
  ['{8F6822FC-E4EA-5B35-939A-27F3B3D550D2}']
  end;
  {
  // Used Types:  Windows.Devices.I2c.II2cController
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.II2cController>
  IIterator_1__I2c_II2cController = interface(IIterator_1__I2c_II2cController_Base)
  ['{70AAEAE0-17E9-5C40-A0E8-EEF59C6DEF11}']
    function get_Current: I2c_II2cController; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PI2c_II2cController): Cardinal; safecall;
    property Current: I2c_II2cController read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.I2c.II2cController>
  IIterable_1__I2c_II2cController_Base = interface(IInspectable)
  ['{A5EE8233-2429-5B26-9A02-993E4E7EDFA9}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.I2c.II2cController>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.I2c.II2cController>
  IIterable_1__I2c_II2cController = interface(IIterable_1__I2c_II2cController_Base)
  ['{5CD77BEE-9859-556A-8642-C5D0D0AA2921}']
    function First: IIterator_1__I2c_II2cController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.I2c.II2cController
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>
  IVectorView_1__I2c_II2cController = interface(IInspectable)
  ['{FC2CE606-BAD0-592E-B954-ECA6ABC2F43D}']
    function GetAt(index: Cardinal): I2c_II2cController; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: I2c_II2cController; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PI2c_II2cController): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController_Delegate_Base = interface(IUnknown)
  ['{3B9D7CB1-AE0B-56AF-8ED5-6856B1E7CD5B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController = interface(AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController_Delegate_Base)
  ['{A51A44CC-ABF3-563B-99E8-B83FCB8D489B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__I2c_II2cController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  IAsyncOperation_1__IVectorView_1__I2c_II2cController_Base = interface(IInspectable)
  ['{77F52FF7-ABA0-54BB-891A-49351A838E33}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  IAsyncOperation_1__IVectorView_1__I2c_II2cController = interface(IAsyncOperation_1__IVectorView_1__I2c_II2cController_Base)
  ['{FB329B48-BF72-5B4B-A78A-BEA93A806388}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController; safecall;
    function GetResults: IVectorView_1__I2c_II2cController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__I2c_II2cController read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cController>
  AsyncOperationCompletedHandler_1__I2c_II2cController_Delegate_Base = interface(IUnknown)
  ['{6FF64B72-A5AA-5986-B563-27612AFB373C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cController>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cController>
  AsyncOperationCompletedHandler_1__I2c_II2cController = interface(AsyncOperationCompletedHandler_1__I2c_II2cController_Delegate_Base)
  ['{4F4456F1-8FFC-58FB-91B1-2EBE62B2F18F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__I2c_II2cController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cController>
  IAsyncOperation_1__I2c_II2cController_Base = interface(IInspectable)
  ['{A4FB1DD4-80C9-5A61-AE8D-C8A7AFC03275}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.I2c.II2cController>
  // Used Types:  Windows.Devices.I2c.II2cController
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cController>
  IAsyncOperation_1__I2c_II2cController = interface(IAsyncOperation_1__I2c_II2cController_Base)
  ['{7D0B5387-F1B5-5D2C-A35B-76764A40E0CF}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__I2c_II2cController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__I2c_II2cController; safecall;
    function GetResults: I2c_II2cController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__I2c_II2cController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.I2c.II2cController>>
  // Used Types:  Windows.Devices.I2c.Provider.II2cProvider
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.I2c.II2cController>
  }
  // Windows.Devices.I2c.II2cControllerStatics
  [WinRTClassNameAttribute(SI2c_I2cController)]
  I2c_II2cControllerStatics = interface(IInspectable)
  ['{40FC0365-5F05-4E7E-84BD-100DB8E0AEC5}']
    function GetControllersAsync(provider: I2c_Provider_II2cProvider): IAsyncOperation_1__IVectorView_1__I2c_II2cController; safecall;
    function GetDefaultAsync: IAsyncOperation_1__I2c_II2cController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Double
  // Used Types:  Boolean
  }
  // Windows.Devices.Pwm.Provider.IPwmControllerProvider
  Pwm_Provider_IPwmControllerProvider = interface(IInspectable)
  ['{1300593B-E2E3-40A4-B7D9-48DFF0377A52}']
    function get_PinCount: Integer; safecall;
    function get_ActualFrequency: Double; safecall;
    function SetDesiredFrequency(frequency: Double): Double; safecall;
    function get_MaxFrequency: Double; safecall;
    function get_MinFrequency: Double; safecall;
    procedure AcquirePin(pin: Integer); safecall;
    procedure ReleasePin(pin: Integer); safecall;
    procedure EnablePin(pin: Integer); safecall;
    procedure DisablePin(pin: Integer); safecall;
    procedure SetPulseParameters(pin: Integer; dutyCycle: Double; invertPolarity: Boolean); safecall;
    property ActualFrequency: Double read get_ActualFrequency;
    property MaxFrequency: Double read get_MaxFrequency;
    property MinFrequency: Double read get_MinFrequency;
    property PinCount: Integer read get_PinCount;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IIterator_1__Pwm_Provider_IPwmControllerProvider_Base = interface(IInspectable)
  ['{90389702-F036-56E1-A94F-6D99D52B9578}']
  end;
  {
  // Used Types:  Windows.Devices.Pwm.Provider.IPwmControllerProvider
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IIterator_1__Pwm_Provider_IPwmControllerProvider = interface(IIterator_1__Pwm_Provider_IPwmControllerProvider_Base)
  ['{90389702-F036-56E1-A94F-6D99D52B9578}']
    function get_Current: Pwm_Provider_IPwmControllerProvider; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPwm_Provider_IPwmControllerProvider): Cardinal; safecall;
    property Current: Pwm_Provider_IPwmControllerProvider read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IIterable_1__Pwm_Provider_IPwmControllerProvider_Base = interface(IInspectable)
  ['{4936ED59-B494-5128-BC7E-03E630346475}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IIterable_1__Pwm_Provider_IPwmControllerProvider = interface(IIterable_1__Pwm_Provider_IPwmControllerProvider_Base)
  ['{4936ED59-B494-5128-BC7E-03E630346475}']
    function First: IIterator_1__Pwm_Provider_IPwmControllerProvider; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Pwm.Provider.IPwmControllerProvider
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  IVectorView_1__Pwm_Provider_IPwmControllerProvider = interface(IInspectable)
  ['{1A166093-1A7A-5E12-9D38-F892FEC3EC66}']
    function GetAt(index: Cardinal): Pwm_Provider_IPwmControllerProvider; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Pwm_Provider_IPwmControllerProvider; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPwm_Provider_IPwmControllerProvider): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.Provider.IPwmControllerProvider>
  }
  // Windows.Devices.Pwm.Provider.IPwmProvider
  Pwm_Provider_IPwmProvider = interface(IInspectable)
  ['{A3301228-52F1-47B0-9349-66BA43D25902}']
    function GetControllers: IVectorView_1__Pwm_Provider_IPwmControllerProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Pwm.IPwmController
  // Used Types:  Double
  // Used Types:  Windows.Devices.Pwm.PwmPulsePolarity
  // Used Types:  Boolean
  }
  // Windows.Devices.Pwm.IPwmPin
  [WinRTClassNameAttribute(SPwm_PwmPin)]
  Pwm_IPwmPin = interface(IInspectable)
  ['{22972DC8-C6CF-4821-B7F9-C6454FB6AF79}']
    function get_Controller: Pwm_IPwmController; safecall;
    function GetActiveDutyCyclePercentage: Double; safecall;
    procedure SetActiveDutyCyclePercentage(dutyCyclePercentage: Double); safecall;
    function get_Polarity: Pwm_PwmPulsePolarity; safecall;
    procedure put_Polarity(value: Pwm_PwmPulsePolarity); safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    function get_IsStarted: Boolean; safecall;
    property Controller: Pwm_IPwmController read get_Controller;
    property IsStarted: Boolean read get_IsStarted;
    property Polarity: Pwm_PwmPulsePolarity read get_Polarity write put_Polarity;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Double
  // Used Types:  Windows.Devices.Pwm.IPwmPin
  }
  // Windows.Devices.Pwm.IPwmController
  [WinRTClassNameAttribute(SPwm_PwmController)]
  Pwm_IPwmController = interface(IInspectable)
  ['{C45F5C85-D2E8-42CF-9BD6-CF5ED029E6A7}']
    function get_PinCount: Integer; safecall;
    function get_ActualFrequency: Double; safecall;
    function SetDesiredFrequency(desiredFrequency: Double): Double; safecall;
    function get_MinFrequency: Double; safecall;
    function get_MaxFrequency: Double; safecall;
    function OpenPin(pinNumber: Integer): Pwm_IPwmPin; safecall;
    property ActualFrequency: Double read get_ActualFrequency;
    property MaxFrequency: Double read get_MaxFrequency;
    property MinFrequency: Double read get_MinFrequency;
    property PinCount: Integer read get_PinCount;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.IPwmController>
  IIterator_1__Pwm_IPwmController_Base = interface(IInspectable)
  ['{599330BD-B0CA-533E-938F-5DD4242BF513}']
  end;
  {
  // Used Types:  Windows.Devices.Pwm.IPwmController
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.IPwmController>
  IIterator_1__Pwm_IPwmController = interface(IIterator_1__Pwm_IPwmController_Base)
  ['{76DE5160-7A4B-5438-A5C7-EAB1CD1A46FC}']
    function get_Current: Pwm_IPwmController; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPwm_IPwmController): Cardinal; safecall;
    property Current: Pwm_IPwmController read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Pwm.IPwmController>
  IIterable_1__Pwm_IPwmController_Base = interface(IInspectable)
  ['{1403A6AB-73CB-5805-9BBC-A0DD39D476B0}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Pwm.IPwmController>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Pwm.IPwmController>
  IIterable_1__Pwm_IPwmController = interface(IIterable_1__Pwm_IPwmController_Base)
  ['{C0712FAE-5202-57C5-899F-8FDDB5E8CE7B}']
    function First: IIterator_1__Pwm_IPwmController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Pwm.IPwmController
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>
  IVectorView_1__Pwm_IPwmController = interface(IInspectable)
  ['{98B1BFDB-A27C-50F2-B43B-A67F3DE0E65A}']
    function GetAt(index: Cardinal): Pwm_IPwmController; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Pwm_IPwmController; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPwm_IPwmController): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController_Delegate_Base = interface(IUnknown)
  ['{E72BD078-CE02-55AC-A7B9-ABD01248D888}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController_Delegate_Base)
  ['{5973FBF0-36E8-52B0-8316-DA4E6860C976}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Pwm_IPwmController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  IAsyncOperation_1__IVectorView_1__Pwm_IPwmController_Base = interface(IInspectable)
  ['{E4151E8D-4688-5023-9F5D-008BBD904891}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  IAsyncOperation_1__IVectorView_1__Pwm_IPwmController = interface(IAsyncOperation_1__IVectorView_1__Pwm_IPwmController_Base)
  ['{A48E85F3-3DF5-5D10-90BD-239D609CFF4B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController; safecall;
    function GetResults: IVectorView_1__Pwm_IPwmController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Pwm_IPwmController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Pwm.IPwmController>>
  // Used Types:  Windows.Devices.Pwm.Provider.IPwmProvider
  }
  // Windows.Devices.Pwm.IPwmControllerStatics
  [WinRTClassNameAttribute(SPwm_PwmController)]
  Pwm_IPwmControllerStatics = interface(IInspectable)
  ['{4263BDA1-8946-4404-BD48-81DD124AF4D9}']
    function GetControllersAsync(provider: Pwm_Provider_IPwmProvider): IAsyncOperation_1__IVectorView_1__Pwm_IPwmController; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Pwm.IPwmController>
  AsyncOperationCompletedHandler_1__Pwm_IPwmController_Delegate_Base = interface(IUnknown)
  ['{5FC68E9F-FFFF-5D53-BA21-9C33EF56B240}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Pwm.IPwmController>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Pwm.IPwmController>
  AsyncOperationCompletedHandler_1__Pwm_IPwmController = interface(AsyncOperationCompletedHandler_1__Pwm_IPwmController_Delegate_Base)
  ['{833997B9-57C1-5C63-99C8-47ABA6026B71}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Pwm_IPwmController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Pwm.IPwmController>
  IAsyncOperation_1__Pwm_IPwmController_Base = interface(IInspectable)
  ['{0A288D41-1F20-5D16-85DD-52855B11569A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Pwm.IPwmController>
  // Used Types:  Windows.Devices.Pwm.IPwmController
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Pwm.IPwmController>
  IAsyncOperation_1__Pwm_IPwmController = interface(IAsyncOperation_1__Pwm_IPwmController_Base)
  ['{7D0B8E78-5354-51F8-A483-2FCC1551E583}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Pwm_IPwmController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Pwm_IPwmController; safecall;
    function GetResults: Pwm_IPwmController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Pwm_IPwmController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Pwm.IPwmController>
  }
  // Windows.Devices.Pwm.IPwmControllerStatics2
  [WinRTClassNameAttribute(SPwm_PwmController)]
  Pwm_IPwmControllerStatics2 = interface(IInspectable)
  ['{44FC5B1F-F119-4BDD-97AD-F76EF986736D}']
    function GetDefaultAsync: IAsyncOperation_1__Pwm_IPwmController; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Pwm.IPwmController>
  }
  // Windows.Devices.Pwm.IPwmControllerStatics3
  [WinRTClassNameAttribute(SPwm_PwmController)]
  Pwm_IPwmControllerStatics3 = interface(IInspectable)
  ['{B2581871-0229-4344-AE3F-9B7CD0E66B94}']
    function GetDeviceSelector: HSTRING; overload; safecall;
    function GetDeviceSelector(friendlyName: HSTRING): HSTRING; overload; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Pwm_IPwmController; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Spi.Provider.ProviderSpiMode
  // Used Types:  Windows.Devices.Spi.Provider.ProviderSpiSharingMode
  }
  // Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
  [WinRTClassNameAttribute(SSpi_Provider_ProviderSpiConnectionSettings)]
  Spi_Provider_IProviderSpiConnectionSettings = interface(IInspectable)
  ['{F6034550-A542-4EC0-9601-A4DD68F8697B}']
    function get_ChipSelectLine: Integer; safecall;
    procedure put_ChipSelectLine(value: Integer); safecall;
    function get_Mode: Spi_Provider_ProviderSpiMode; safecall;
    procedure put_Mode(value: Spi_Provider_ProviderSpiMode); safecall;
    function get_DataBitLength: Integer; safecall;
    procedure put_DataBitLength(value: Integer); safecall;
    function get_ClockFrequency: Integer; safecall;
    procedure put_ClockFrequency(value: Integer); safecall;
    function get_SharingMode: Spi_Provider_ProviderSpiSharingMode; safecall;
    procedure put_SharingMode(value: Spi_Provider_ProviderSpiSharingMode); safecall;
    property ChipSelectLine: Integer read get_ChipSelectLine write put_ChipSelectLine;
    property ClockFrequency: Integer read get_ClockFrequency write put_ClockFrequency;
    property DataBitLength: Integer read get_DataBitLength write put_DataBitLength;
    property Mode: Spi_Provider_ProviderSpiMode read get_Mode write put_Mode;
    property SharingMode: Spi_Provider_ProviderSpiSharingMode read get_SharingMode write put_SharingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
  // Used Types:  Int32
  }
  // Windows.Devices.Spi.Provider.IProviderSpiConnectionSettingsFactory
  [WinRTClassNameAttribute(SSpi_Provider_ProviderSpiConnectionSettings)]
  Spi_Provider_IProviderSpiConnectionSettingsFactory = interface(IInspectable)
  ['{66456B5A-0C79-43E3-9F3C-E59780AC18FA}']
    function Create(chipSelectLine: Integer): Spi_Provider_IProviderSpiConnectionSettings; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
  // Used Types:  UInt8
  }
  // Windows.Devices.Spi.Provider.ISpiDeviceProvider
  Spi_Provider_ISpiDeviceProvider = interface(IInspectable)
  ['{0D1C3443-304B-405C-B4F7-F5AB1074461E}']
    function get_DeviceId: HSTRING; safecall;
    function get_ConnectionSettings: Spi_Provider_IProviderSpiConnectionSettings; safecall;
    procedure Write(bufferSize: Cardinal; buffer: PByte); safecall;
    procedure Read(bufferSize: Cardinal; buffer: PByte); safecall;
    procedure TransferSequential(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte); safecall;
    procedure TransferFullDuplex(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte); safecall;
    property ConnectionSettings: Spi_Provider_IProviderSpiConnectionSettings read get_ConnectionSettings;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Spi.Provider.ISpiDeviceProvider
  // Used Types:  Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
  }
  // Windows.Devices.Spi.Provider.ISpiControllerProvider
  Spi_Provider_ISpiControllerProvider = interface(IInspectable)
  ['{C1686504-02CE-4226-A385-4F11FB04B41B}']
    function GetDeviceProvider(settings: Spi_Provider_IProviderSpiConnectionSettings): Spi_Provider_ISpiDeviceProvider; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IIterator_1__Spi_Provider_ISpiControllerProvider_Base = interface(IInspectable)
  ['{CF1D15D3-A6C8-56DD-80C8-E8D960262277}']
  end;
  {
  // Used Types:  Windows.Devices.Spi.Provider.ISpiControllerProvider
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IIterator_1__Spi_Provider_ISpiControllerProvider = interface(IIterator_1__Spi_Provider_ISpiControllerProvider_Base)
  ['{CF1D15D3-A6C8-56DD-80C8-E8D960262277}']
    function get_Current: Spi_Provider_ISpiControllerProvider; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSpi_Provider_ISpiControllerProvider): Cardinal; safecall;
    property Current: Spi_Provider_ISpiControllerProvider read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IIterable_1__Spi_Provider_ISpiControllerProvider_Base = interface(IInspectable)
  ['{71BA027D-8C84-58B1-8D66-9177C11698EB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IIterable_1__Spi_Provider_ISpiControllerProvider = interface(IIterable_1__Spi_Provider_ISpiControllerProvider_Base)
  ['{71BA027D-8C84-58B1-8D66-9177C11698EB}']
    function First: IIterator_1__Spi_Provider_ISpiControllerProvider; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Spi.Provider.ISpiControllerProvider
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  IVectorView_1__Spi_Provider_ISpiControllerProvider = interface(IInspectable)
  ['{96A4919B-3229-5E41-8B10-C8198C44F10C}']
    function GetAt(index: Cardinal): Spi_Provider_ISpiControllerProvider; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Spi_Provider_ISpiControllerProvider; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSpi_Provider_ISpiControllerProvider): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider_Delegate_Base = interface(IUnknown)
  ['{E9E2AE03-42D6-5211-AB52-325E722E2611}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider_Delegate_Base)
  ['{E9E2AE03-42D6-5211-AB52-325E722E2611}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider_Base = interface(IInspectable)
  ['{B3AF3490-DEDE-59D1-B562-1F6BE71AE139}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider = interface(IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider_Base)
  ['{B3AF3490-DEDE-59D1-B562-1F6BE71AE139}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider; safecall;
    function GetResults: IVectorView_1__Spi_Provider_ISpiControllerProvider; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Spi_Provider_ISpiControllerProvider read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.Provider.ISpiControllerProvider>>
  }
  // Windows.Devices.Spi.Provider.ISpiProvider
  Spi_Provider_ISpiProvider = interface(IInspectable)
  ['{96B461E2-77D4-48CE-AAA0-75715A8362CF}']
    function GetControllersAsync: IAsyncOperation_1__IVectorView_1__Spi_Provider_ISpiControllerProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Devices.Spi.SpiMode
  // Used Types:  Windows.Devices.Spi.SpiSharingMode
  }
  // Windows.Devices.Spi.ISpiConnectionSettings
  [WinRTClassNameAttribute(SSpi_SpiConnectionSettings)]
  Spi_ISpiConnectionSettings = interface(IInspectable)
  ['{5283A37F-F935-4B9F-A7A7-3A7890AFA5CE}']
    function get_ChipSelectLine: Integer; safecall;
    procedure put_ChipSelectLine(value: Integer); safecall;
    function get_Mode: Spi_SpiMode; safecall;
    procedure put_Mode(value: Spi_SpiMode); safecall;
    function get_DataBitLength: Integer; safecall;
    procedure put_DataBitLength(value: Integer); safecall;
    function get_ClockFrequency: Integer; safecall;
    procedure put_ClockFrequency(value: Integer); safecall;
    function get_SharingMode: Spi_SpiSharingMode; safecall;
    procedure put_SharingMode(value: Spi_SpiSharingMode); safecall;
    property ChipSelectLine: Integer read get_ChipSelectLine write put_ChipSelectLine;
    property ClockFrequency: Integer read get_ClockFrequency write put_ClockFrequency;
    property DataBitLength: Integer read get_DataBitLength write put_DataBitLength;
    property Mode: Spi_SpiMode read get_Mode write put_Mode;
    property SharingMode: Spi_SpiSharingMode read get_SharingMode write put_SharingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Spi.ISpiConnectionSettings
  // Used Types:  Int32
  }
  // Windows.Devices.Spi.ISpiConnectionSettingsFactory
  [WinRTClassNameAttribute(SSpi_SpiConnectionSettings)]
  Spi_ISpiConnectionSettingsFactory = interface(IInspectable)
  ['{FF99081E-10C4-44B7-9FEA-A748B5A46F31}']
    function Create(chipSelectLine: Integer): Spi_ISpiConnectionSettings; safecall;
  end;

  {
  // Used Types:  Int32
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Int32>
  IIterator_1__Integer = interface(IInspectable)
  ['{BFEA7F78-50C2-5F1D-A6EA-9E978D2699FF}']
    function get_Current: Integer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInteger): Cardinal; safecall;
    property Current: Integer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Int32>
  }
  // Windows.Foundation.Collections.IIterable`1<Int32>
  IIterable_1__Integer = interface(IInspectable)
  ['{81A643FB-F51C-5565-83C4-F96425777B66}']
    function First: IIterator_1__Integer; safecall;
  end;

  {
  // Used Types:  Int32
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Int32>
  IVectorView_1__Integer = interface(IInspectable)
  ['{8D720CDF-3934-5D3F-9A55-40E8063B086A}']
    function GetAt(index: Cardinal): Integer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Integer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInteger): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Int32>
  }
  // Windows.Devices.Spi.ISpiBusInfo
  [WinRTClassNameAttribute(SSpi_SpiBusInfo)]
  Spi_ISpiBusInfo = interface(IInspectable)
  ['{9929444A-54F2-48C6-B952-9C32FC02C669}']
    function get_ChipSelectLineCount: Integer; safecall;
    function get_MinClockFrequency: Integer; safecall;
    function get_MaxClockFrequency: Integer; safecall;
    function get_SupportedDataBitLengths: IVectorView_1__Integer; safecall;
    property ChipSelectLineCount: Integer read get_ChipSelectLineCount;
    property MaxClockFrequency: Integer read get_MaxClockFrequency;
    property MinClockFrequency: Integer read get_MinClockFrequency;
    property SupportedDataBitLengths: IVectorView_1__Integer read get_SupportedDataBitLengths;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Spi.ISpiConnectionSettings
  // Used Types:  UInt8
  }
  // Windows.Devices.Spi.ISpiDevice
  [WinRTClassNameAttribute(SSpi_SpiDevice)]
  Spi_ISpiDevice = interface(IInspectable)
  ['{05D5356D-11B6-4D39-84D5-95DFB4C9F2CE}']
    function get_DeviceId: HSTRING; safecall;
    function get_ConnectionSettings: Spi_ISpiConnectionSettings; safecall;
    procedure Write(bufferSize: Cardinal; buffer: PByte); safecall;
    procedure Read(bufferSize: Cardinal; buffer: PByte); safecall;
    procedure TransferSequential(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte); safecall;
    procedure TransferFullDuplex(writeBufferSize: Cardinal; writeBuffer: PByte; out readBuffer: Byte); safecall;
    property ConnectionSettings: Spi_ISpiConnectionSettings read get_ConnectionSettings;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiDevice>
  AsyncOperationCompletedHandler_1__Spi_ISpiDevice_Delegate_Base = interface(IUnknown)
  ['{A88A28BA-6966-55E7-8C81-7C65F74E39C0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiDevice>
  AsyncOperationCompletedHandler_1__Spi_ISpiDevice = interface(AsyncOperationCompletedHandler_1__Spi_ISpiDevice_Delegate_Base)
  ['{7226EB58-2C6B-5E46-9BAC-BB7291AE390F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Spi_ISpiDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiDevice>
  IAsyncOperation_1__Spi_ISpiDevice_Base = interface(IInspectable)
  ['{FEB8466A-878F-577B-BBCA-89575CFC56E4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiDevice>
  // Used Types:  Windows.Devices.Spi.ISpiDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiDevice>
  IAsyncOperation_1__Spi_ISpiDevice = interface(IAsyncOperation_1__Spi_ISpiDevice_Base)
  ['{D5466926-066E-515E-B243-02F8648C3B4C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Spi_ISpiDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Spi_ISpiDevice; safecall;
    function GetResults: Spi_ISpiDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Spi_ISpiDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Spi.ISpiBusInfo
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiDevice>
  // Used Types:  Windows.Devices.Spi.ISpiConnectionSettings
  }
  // Windows.Devices.Spi.ISpiDeviceStatics
  [WinRTClassNameAttribute(SSpi_SpiDevice)]
  Spi_ISpiDeviceStatics = interface(IInspectable)
  ['{A278E559-5720-4D3F-BD93-56F5FF5A5879}']
    function GetDeviceSelector: HSTRING; overload; safecall;
    function GetDeviceSelector(friendlyName: HSTRING): HSTRING; overload; safecall;
    function GetBusInfo(busId: HSTRING): Spi_ISpiBusInfo; safecall;
    function FromIdAsync(busId: HSTRING; settings: Spi_ISpiConnectionSettings): IAsyncOperation_1__Spi_ISpiDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Spi.ISpiDevice
  // Used Types:  Windows.Devices.Spi.ISpiConnectionSettings
  }
  // Windows.Devices.Spi.ISpiController
  [WinRTClassNameAttribute(SSpi_SpiController)]
  Spi_ISpiController = interface(IInspectable)
  ['{A8D3C829-9895-4159-A934-8741F1EE6D27}']
    function GetDevice(settings: Spi_ISpiConnectionSettings): Spi_ISpiDevice; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiController>
  AsyncOperationCompletedHandler_1__Spi_ISpiController_Delegate_Base = interface(IUnknown)
  ['{5E94D949-A844-5B25-A3CC-AFABEB18C1D2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiController>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiController>
  AsyncOperationCompletedHandler_1__Spi_ISpiController = interface(AsyncOperationCompletedHandler_1__Spi_ISpiController_Delegate_Base)
  ['{3CDB1829-3036-55BA-A935-4E5BF0CCF0A2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Spi_ISpiController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiController>
  IAsyncOperation_1__Spi_ISpiController_Base = interface(IInspectable)
  ['{B6B0DF6F-C097-5844-93BD-7821998FDB8E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Spi.ISpiController>
  // Used Types:  Windows.Devices.Spi.ISpiController
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiController>
  IAsyncOperation_1__Spi_ISpiController = interface(IAsyncOperation_1__Spi_ISpiController_Base)
  ['{99BE089B-4EA7-5036-AF78-20BBC6D810C5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Spi_ISpiController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Spi_ISpiController; safecall;
    function GetResults: Spi_ISpiController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Spi_ISpiController read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.ISpiController>
  IIterator_1__Spi_ISpiController_Base = interface(IInspectable)
  ['{FD7D5997-544C-5BE9-B0FA-1D0EFBFC4A03}']
  end;
  {
  // Used Types:  Windows.Devices.Spi.ISpiController
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.ISpiController>
  IIterator_1__Spi_ISpiController = interface(IIterator_1__Spi_ISpiController_Base)
  ['{D7DE94D8-79D8-54B9-B02D-3A8832A0E6C2}']
    function get_Current: Spi_ISpiController; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSpi_ISpiController): Cardinal; safecall;
    property Current: Spi_ISpiController read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Spi.ISpiController>
  IIterable_1__Spi_ISpiController_Base = interface(IInspectable)
  ['{7B076938-DC1B-5368-9003-059291D37F35}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Spi.ISpiController>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Spi.ISpiController>
  IIterable_1__Spi_ISpiController = interface(IIterable_1__Spi_ISpiController_Base)
  ['{BF1502A4-CE46-55B1-AEA7-8DB51397D5F4}']
    function First: IIterator_1__Spi_ISpiController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Spi.ISpiController
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>
  IVectorView_1__Spi_ISpiController = interface(IInspectable)
  ['{3D32F598-38DD-5778-914B-3287BB83E935}']
    function GetAt(index: Cardinal): Spi_ISpiController; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Spi_ISpiController; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSpi_ISpiController): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController_Delegate_Base = interface(IUnknown)
  ['{C8AFC9CB-6807-57EC-84C9-9F3DBC003450}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController_Delegate_Base)
  ['{8926030C-48D4-5CEB-B1B7-794C06197611}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Spi_ISpiController; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  IAsyncOperation_1__IVectorView_1__Spi_ISpiController_Base = interface(IInspectable)
  ['{89624331-F802-56F7-9B33-17C616ECBCFA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  IAsyncOperation_1__IVectorView_1__Spi_ISpiController = interface(IAsyncOperation_1__IVectorView_1__Spi_ISpiController_Base)
  ['{05667BB1-1589-5E46-BB72-CC6658139775}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController; safecall;
    function GetResults: IVectorView_1__Spi_ISpiController; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Spi_ISpiController read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Spi.ISpiController>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Spi.ISpiController>>
  // Used Types:  Windows.Devices.Spi.Provider.ISpiProvider
  }
  // Windows.Devices.Spi.ISpiControllerStatics
  [WinRTClassNameAttribute(SSpi_SpiController)]
  Spi_ISpiControllerStatics = interface(IInspectable)
  ['{0D5229E2-138B-4E48-B964-4F2F79B9C5A2}']
    function GetDefaultAsync: IAsyncOperation_1__Spi_ISpiController; safecall;
    function GetControllersAsync(provider: Spi_Provider_ISpiProvider): IAsyncOperation_1__IVectorView_1__Spi_ISpiController; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Adc.Provider.IAdcControllerProvider
  // Used Types:  Windows.Devices.Pwm.Provider.IPwmControllerProvider
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioControllerProvider
  // Used Types:  Windows.Devices.I2c.Provider.II2cControllerProvider
  // Used Types:  Windows.Devices.Spi.Provider.ISpiControllerProvider
  }
  // Windows.Devices.ILowLevelDevicesAggregateProvider
  [WinRTClassNameAttribute(SLowLevelDevicesAggregateProvider)]
  ILowLevelDevicesAggregateProvider = interface(IInspectable)
  ['{A73E561C-AAC1-4EC7-A852-479F7060D01F}']
    function get_AdcControllerProvider: Adc_Provider_IAdcControllerProvider; safecall;
    function get_PwmControllerProvider: Pwm_Provider_IPwmControllerProvider; safecall;
    function get_GpioControllerProvider: Gpio_Provider_IGpioControllerProvider; safecall;
    function get_I2cControllerProvider: I2c_Provider_II2cControllerProvider; safecall;
    function get_SpiControllerProvider: Spi_Provider_ISpiControllerProvider; safecall;
    property AdcControllerProvider: Adc_Provider_IAdcControllerProvider read get_AdcControllerProvider;
    property GpioControllerProvider: Gpio_Provider_IGpioControllerProvider read get_GpioControllerProvider;
    property I2cControllerProvider: I2c_Provider_II2cControllerProvider read get_I2cControllerProvider;
    property PwmControllerProvider: Pwm_Provider_IPwmControllerProvider read get_PwmControllerProvider;
    property SpiControllerProvider: Spi_Provider_ISpiControllerProvider read get_SpiControllerProvider;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.ILowLevelDevicesAggregateProvider
  // Used Types:  Windows.Devices.Adc.Provider.IAdcControllerProvider
  // Used Types:  Windows.Devices.Pwm.Provider.IPwmControllerProvider
  // Used Types:  Windows.Devices.Gpio.Provider.IGpioControllerProvider
  // Used Types:  Windows.Devices.I2c.Provider.II2cControllerProvider
  // Used Types:  Windows.Devices.Spi.Provider.ISpiControllerProvider
  }
  // Windows.Devices.ILowLevelDevicesAggregateProviderFactory
  [WinRTClassNameAttribute(SLowLevelDevicesAggregateProvider)]
  ILowLevelDevicesAggregateProviderFactory = interface(IInspectable)
  ['{9AC4AAF6-3473-465E-96D5-36281A2C57AF}']
    function Create(adc: Adc_Provider_IAdcControllerProvider; pwm: Pwm_Provider_IPwmControllerProvider; gpio: Gpio_Provider_IGpioControllerProvider; i2c: I2c_Provider_II2cControllerProvider; spi: Spi_Provider_ISpiControllerProvider): ILowLevelDevicesAggregateProvider; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Devices.ILowLevelDevicesController
  [WinRTClassNameAttribute(SLowLevelDevicesController)]
  ILowLevelDevicesController = interface(IInspectable)
  ['{2EC23DD4-179B-45DE-9B39-3AE02527DE52}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.ILowLevelDevicesAggregateProvider
  }
  // Windows.Devices.ILowLevelDevicesControllerStatics
  [WinRTClassNameAttribute(SLowLevelDevicesController)]
  ILowLevelDevicesControllerStatics = interface(IInspectable)
  ['{093E926A-FCCB-4394-A697-19DE637C2DB3}']
    function get_DefaultProvider: ILowLevelDevicesAggregateProvider; safecall;
    procedure put_DefaultProvider(value: ILowLevelDevicesAggregateProvider); safecall;
    property DefaultProvider: ILowLevelDevicesAggregateProvider read get_DefaultProvider write put_DefaultProvider;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus_Delegate_Base = interface(IUnknown)
  ['{3D7E6EA9-E739-555C-9C02-07396C5321F5}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus = interface(AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__SmartCards_SmartCardReaderStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  IAsyncOperation_1__SmartCards_SmartCardReaderStatus_Base = interface(IInspectable)
  ['{5AE402FA-1F22-5570-A0C8-B2320ADEDB81}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  // Used Types:  Windows.Devices.SmartCards.SmartCardReaderStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardReaderStatus>
  IAsyncOperation_1__SmartCards_SmartCardReaderStatus = interface(IAsyncOperation_1__SmartCards_SmartCardReaderStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus; safecall;
    function GetResults: SmartCards_SmartCardReaderStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardReaderStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus_Delegate_Base = interface(IUnknown)
  ['{BDAF4A41-3B4A-56B0-AEEC-FEE71CC7F328}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus = interface(AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__SmartCards_SmartCardStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardStatus>
  IAsyncOperation_1__SmartCards_SmartCardStatus_Base = interface(IInspectable)
  ['{E2223376-8CF6-51BD-9907-1344AA665E5D}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardStatus>
  // Used Types:  Windows.Devices.SmartCards.SmartCardStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardStatus>
  IAsyncOperation_1__SmartCards_SmartCardStatus = interface(IAsyncOperation_1__SmartCards_SmartCardStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus; safecall;
    function GetResults: SmartCards_SmartCardStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardStatus read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult_Delegate_Base = interface(IUnknown)
  ['{9528F94B-047B-5E2A-8FC0-7017F5DADDFF}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult = interface(AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  IAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult_Base = interface(IInspectable)
  ['{B8F15D35-2F3D-53AA-B5C6-FACA4C7FF16E}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  // Used Types:  Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardActivationPolicyChangeResult>
  IAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult = interface(IAsyncOperation_1__SmartCards_SmartCardActivationPolicyChangeResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult; safecall;
    function GetResults: SmartCards_SmartCardActivationPolicyChangeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardActivationPolicyChangeResult read get_Completed write put_Completed;
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
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus_Delegate_Base = interface(IUnknown)
  ['{C6C447C7-A60D-500A-9BFE-59F25C33E979}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus = interface(AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  IAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus_Base = interface(IInspectable)
  ['{F5B0E1B0-57A7-5AB3-AEAA-D6B635257866}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SmartCards.SmartCardCryptogramGeneratorOperationStatus>
  IAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus = interface(IAsyncOperation_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus; safecall;
    function GetResults: SmartCards_SmartCardCryptogramGeneratorOperationStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__SmartCards_SmartCardCryptogramGeneratorOperationStatus read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IIterator_1__SmartCards_SmartCardCryptogramAlgorithm_Base = interface(IInspectable)
  ['{4F1E0492-DAB2-53C3-B5FB-C4B4373B1EC2}']
  end;
  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IIterator_1__SmartCards_SmartCardCryptogramAlgorithm = interface(IIterator_1__SmartCards_SmartCardCryptogramAlgorithm_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: SmartCards_SmartCardCryptogramAlgorithm; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramAlgorithm): Cardinal; safecall;
    property Current: SmartCards_SmartCardCryptogramAlgorithm read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IIterable_1__SmartCards_SmartCardCryptogramAlgorithm_Base = interface(IInspectable)
  ['{8E0DE0E9-0742-559E-9B1B-460268622C1F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IIterable_1__SmartCards_SmartCardCryptogramAlgorithm = interface(IIterable_1__SmartCards_SmartCardCryptogramAlgorithm_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__SmartCards_SmartCardCryptogramAlgorithm; safecall;
  end;

  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramAlgorithm>
  IVectorView_1__SmartCards_SmartCardCryptogramAlgorithm = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): SmartCards_SmartCardCryptogramAlgorithm; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: SmartCards_SmartCardCryptogramAlgorithm; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramAlgorithm): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Base = interface(IInspectable)
  ['{9D1091AE-BE37-5BE7-8EDF-60C5164880B6}']
  end;
  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = interface(IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat): Cardinal; safecall;
    property Current: SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Base = interface(IInspectable)
  ['{C40C4451-4EBB-5635-9C7D-33C8C5D37A09}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = interface(IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat; safecall;
  end;

  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageConfirmationResponseFormat>
  IVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: SmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramMaterialPackageConfirmationResponseFormat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialType_Base = interface(IInspectable)
  ['{97E1414D-439A-5DC2-81FC-D988E32C8DAB}']
  end;
  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialType = interface(IIterator_1__SmartCards_SmartCardCryptogramMaterialType_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: SmartCards_SmartCardCryptogramMaterialType; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramMaterialType): Cardinal; safecall;
    property Current: SmartCards_SmartCardCryptogramMaterialType read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialType_Base = interface(IInspectable)
  ['{2D379F84-389C-5809-A2C6-919B47CAAB88}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialType = interface(IIterable_1__SmartCards_SmartCardCryptogramMaterialType_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__SmartCards_SmartCardCryptogramMaterialType; safecall;
  end;

  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramMaterialType
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialType>
  IVectorView_1__SmartCards_SmartCardCryptogramMaterialType = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): SmartCards_SmartCardCryptogramMaterialType; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: SmartCards_SmartCardCryptogramMaterialType; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramMaterialType): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat_Base = interface(IInspectable)
  ['{7BF75A02-EE7E-513A-80F8-F7D8F004C907}']
  end;
  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = interface(IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: SmartCards_SmartCardCryptogramMaterialPackageFormat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramMaterialPackageFormat): Cardinal; safecall;
    property Current: SmartCards_SmartCardCryptogramMaterialPackageFormat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageFormat_Base = interface(IInspectable)
  ['{3E241ACC-1745-57CE-9368-21BA2130C3C1}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = interface(IIterable_1__SmartCards_SmartCardCryptogramMaterialPackageFormat_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__SmartCards_SmartCardCryptogramMaterialPackageFormat; safecall;
  end;

  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramMaterialPackageFormat>
  IVectorView_1__SmartCards_SmartCardCryptogramMaterialPackageFormat = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): SmartCards_SmartCardCryptogramMaterialPackageFormat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: SmartCards_SmartCardCryptogramMaterialPackageFormat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramMaterialPackageFormat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities_Base = interface(IInspectable)
  ['{C858D7A0-C54E-513C-A097-A42FD3D569AF}']
  end;
  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = interface(IIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: SmartCards_SmartCardCryptogramStorageKeyCapabilities; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramStorageKeyCapabilities): Cardinal; safecall;
    property Current: SmartCards_SmartCardCryptogramStorageKeyCapabilities read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IIterable_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities_Base = interface(IInspectable)
  ['{983619F1-45B9-5557-9800-EAA2BCA6DA57}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IIterable_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = interface(IIterable_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities; safecall;
  end;

  {
  // Used Types:  Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.SmartCards.SmartCardCryptogramStorageKeyCapabilities>
  IVectorView_1__SmartCards_SmartCardCryptogramStorageKeyCapabilities = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): SmartCards_SmartCardCryptogramStorageKeyCapabilities; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: SmartCards_SmartCardCryptogramStorageKeyCapabilities; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PSmartCards_SmartCardCryptogramStorageKeyCapabilities): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  AsyncOperationCompletedHandler_1__TGuid_Delegate_Base = interface(IUnknown)
  ['{5233899B-BA7E-504F-BB83-CEEBAC62DECF}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Guid>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  AsyncOperationCompletedHandler_1__TGuid = interface(AsyncOperationCompletedHandler_1__TGuid_Delegate_Base)
  ['{5233899B-BA7E-504F-BB83-CEEBAC62DECF}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__TGuid; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Guid>
  IAsyncOperation_1__TGuid_Base = interface(IInspectable)
  ['{6607BC41-294B-5975-9C3F-4B49836D0916}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Guid>
  // Used Types:  Guid
  }
  // Windows.Foundation.IAsyncOperation`1<Guid>
  IAsyncOperation_1__TGuid = interface(IAsyncOperation_1__TGuid_Base)
  ['{6607BC41-294B-5975-9C3F-4B49836D0916}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__TGuid); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__TGuid; safecall;
    function GetResults: TGuid; safecall;
    property Completed: AsyncOperationCompletedHandler_1__TGuid read get_Completed write put_Completed;
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
  // Used Types:  Int32
  }
  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface(IInspectable)
  ['{548CEFBD-BC8A-5FA0-8DF2-957440FC8BF4}']
    function get_Value: Integer; safecall;
    property Value: Integer read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.System.Power.BatteryStatus
  }
  // Windows.Devices.Power.IBatteryReport
  [WinRTClassNameAttribute(SPower_BatteryReport)]
  Power_IBatteryReport = interface(IInspectable)
  ['{C9858C3A-4E13-420A-A8D0-24F18F395401}']
    function get_ChargeRateInMilliwatts: IReference_1__Integer; safecall;
    function get_DesignCapacityInMilliwattHours: IReference_1__Integer; safecall;
    function get_FullChargeCapacityInMilliwattHours: IReference_1__Integer; safecall;
    function get_RemainingCapacityInMilliwattHours: IReference_1__Integer; safecall;
    function get_Status: Power_BatteryStatus; safecall;
    property ChargeRateInMilliwatts: IReference_1__Integer read get_ChargeRateInMilliwatts;
    property DesignCapacityInMilliwattHours: IReference_1__Integer read get_DesignCapacityInMilliwattHours;
    property FullChargeCapacityInMilliwattHours: IReference_1__Integer read get_FullChargeCapacityInMilliwattHours;
    property RemainingCapacityInMilliwattHours: IReference_1__Integer read get_RemainingCapacityInMilliwattHours;
    property Status: Power_BatteryStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Power.IBattery,Object>
  TypedEventHandler_2__Power_IBattery__IInspectable_Delegate_Base = interface(IUnknown)
  ['{4D4AA646-767F-5645-AF5C-546464D3EC09}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Power.IBattery
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Power.IBattery,Object>
  TypedEventHandler_2__Power_IBattery__IInspectable = interface(TypedEventHandler_2__Power_IBattery__IInspectable_Delegate_Base)
  ['{19353443-78A6-559C-8027-DB75D1D0B929}']
    procedure Invoke(sender: Power_IBattery; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Power.IBatteryReport
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Power.IBattery,Object>
  }
  // Windows.Devices.Power.IBattery
  [WinRTClassNameAttribute(SPower_Battery)]
  Power_IBattery = interface(IInspectable)
  ['{BC894FC6-0072-47C8-8B5D-614AAA7A437E}']
    function get_DeviceId: HSTRING; safecall;
    function GetReport: Power_IBatteryReport; safecall;
    function add_ReportUpdated(handler: TypedEventHandler_2__Power_IBattery__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ReportUpdated(token: EventRegistrationToken); safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Power.IBattery>
  AsyncOperationCompletedHandler_1__Power_IBattery_Delegate_Base = interface(IUnknown)
  ['{97F82115-3822-507B-82E6-2777B336E98E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Power.IBattery>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Power.IBattery>
  AsyncOperationCompletedHandler_1__Power_IBattery = interface(AsyncOperationCompletedHandler_1__Power_IBattery_Delegate_Base)
  ['{83470E01-83B8-5AE6-B55B-5238B131C668}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Power_IBattery; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Power.IBattery>
  IAsyncOperation_1__Power_IBattery_Base = interface(IInspectable)
  ['{DAA3D556-1529-56D2-A5F8-BFB6C22A3DFE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Power.IBattery>
  // Used Types:  Windows.Devices.Power.IBattery
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Power.IBattery>
  IAsyncOperation_1__Power_IBattery = interface(IAsyncOperation_1__Power_IBattery_Base)
  ['{36EF8E68-C5B7-53CD-A533-D42C3F66B9E0}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Power_IBattery); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Power_IBattery; safecall;
    function GetResults: Power_IBattery; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Power_IBattery read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Power.IBattery
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Power.IBattery>
  // Used Types:  String
  }
  // Windows.Devices.Power.IBatteryStatics
  [WinRTClassNameAttribute(SPower_Battery)]
  Power_IBatteryStatics = interface(IInspectable)
  ['{79CD72B6-9E5E-4452-BEA6-DFCD541E597F}']
    function get_AggregateBattery: Power_IBattery; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Power_IBattery; safecall;
    function GetDeviceSelector: HSTRING; safecall;
    property AggregateBattery: Power_IBattery read get_AggregateBattery;
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
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Int32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  AsyncOperationCompletedHandler_1__Integer = interface(IUnknown)
  ['{D60CAE9D-88CB-59F1-8576-3FBA44796BE8}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Integer; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Int32>
  // Used Types:  Int32
  }
  // Windows.Foundation.IAsyncOperation`1<Int32>
  IAsyncOperation_1__Integer = interface(IInspectable)
  ['{968B9665-06ED-5774-8F53-8EDEABD5F7B5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Integer); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Integer; safecall;
    function GetResults: Integer; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Integer read get_Completed write put_Completed;
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
  // Used Types:  Int16
  }
  // Windows.Foundation.IReference`1<Int16>
  IReference_1__SmallInt = interface(IInspectable)
  ['{6EC9E41B-6709-5647-9918-A1270110FC4E}']
    function get_Value: SmallInt; safecall;
    property Value: SmallInt read get_Value;
  end;

  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSession,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSession__IInspectable = interface(IUnknown)
  ['{36D17BB4-1E2A-5A74-A1F1-A9D1347B7702}']
    procedure Invoke(sender: GenericAttributeProfile_IGattSession; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattSubscribedClient,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattSubscribedClient__IInspectable = interface(IUnknown)
  ['{996904B7-B6DC-5C98-996D-4A3E110EFDA5}']
    procedure Invoke(sender: GenericAttributeProfile_IGattSubscribedClient; args: IInspectable); safecall;
  end;

  {
  // Used Types:  Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Bluetooth.GenericAttributeProfile.IGattLocalCharacteristic,Object>
  TypedEventHandler_2__GenericAttributeProfile_IGattLocalCharacteristic__IInspectable = interface(IUnknown)
  ['{6FD0FBA3-A5CA-51A7-938F-310EDDB72631}']
    procedure Invoke(sender: GenericAttributeProfile_IGattLocalCharacteristic; args: IInspectable); safecall;
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
  // Used Types:  UInt16
  }
  // Windows.Devices.Haptics.IKnownSimpleHapticsControllerWaveformsStatics
  [WinRTClassNameAttribute(SHaptics_KnownSimpleHapticsControllerWaveforms)]
  Haptics_IKnownSimpleHapticsControllerWaveformsStatics = interface(IInspectable)
  ['{3D577EF7-4CEE-11E6-B535-001BDC06AB3B}']
    function get_Click: Word; safecall;
    function get_BuzzContinuous: Word; safecall;
    function get_RumbleContinuous: Word; safecall;
    function get_Press: Word; safecall;
    function get_Release: Word; safecall;
    property BuzzContinuous: Word read get_BuzzContinuous;
    property Click: Word read get_Click;
    property Press: Word read get_Press;
    property Release: Word read get_Release;
    property RumbleContinuous: Word read get_RumbleContinuous;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
  [WinRTClassNameAttribute(SHaptics_SimpleHapticsControllerFeedback)]
  Haptics_ISimpleHapticsControllerFeedback = interface(IInspectable)
  ['{3D577EF8-4CEE-11E6-B535-001BDC06AB3B}']
    function get_Waveform: Word; safecall;
    function get_Duration: TimeSpan; safecall;
    property Duration: TimeSpan read get_Duration;
    property Waveform: Word read get_Waveform;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IIterator_1__Haptics_ISimpleHapticsControllerFeedback_Base = interface(IInspectable)
  ['{B7D297D6-9666-5C9E-9DCC-5C382EAE6750}']
  end;
  {
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IIterator_1__Haptics_ISimpleHapticsControllerFeedback = interface(IIterator_1__Haptics_ISimpleHapticsControllerFeedback_Base)
  ['{278D1F59-66FB-5E8D-BC14-EBFA23648444}']
    function get_Current: Haptics_ISimpleHapticsControllerFeedback; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHaptics_ISimpleHapticsControllerFeedback): Cardinal; safecall;
    property Current: Haptics_ISimpleHapticsControllerFeedback read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IIterable_1__Haptics_ISimpleHapticsControllerFeedback_Base = interface(IInspectable)
  ['{8894A0DF-33B0-57B0-AA1A-9255EEE72DD5}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IIterable_1__Haptics_ISimpleHapticsControllerFeedback = interface(IIterable_1__Haptics_ISimpleHapticsControllerFeedback_Base)
  ['{B6A8C8E0-BEAB-5664-BF3A-288E9C48A721}']
    function First: IIterator_1__Haptics_ISimpleHapticsControllerFeedback; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  IVectorView_1__Haptics_ISimpleHapticsControllerFeedback = interface(IInspectable)
  ['{FE0D7BA7-AF19-52A8-A31C-5678ACB7F93A}']
    function GetAt(index: Cardinal): Haptics_ISimpleHapticsControllerFeedback; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Haptics_ISimpleHapticsControllerFeedback; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHaptics_ISimpleHapticsControllerFeedback): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.ISimpleHapticsControllerFeedback>
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsControllerFeedback
  // Used Types:  Double
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Int32
  }
  // Windows.Devices.Haptics.ISimpleHapticsController
  [WinRTClassNameAttribute(SHaptics_SimpleHapticsController)]
  Haptics_ISimpleHapticsController = interface(IInspectable)
  ['{3D577EF9-4CEE-11E6-B535-001BDC06AB3B}']
    function get_Id: HSTRING; safecall;
    function get_SupportedFeedback: IVectorView_1__Haptics_ISimpleHapticsControllerFeedback; safecall;
    function get_IsIntensitySupported: Boolean; safecall;
    function get_IsPlayCountSupported: Boolean; safecall;
    function get_IsPlayDurationSupported: Boolean; safecall;
    function get_IsReplayPauseIntervalSupported: Boolean; safecall;
    procedure StopFeedback; safecall;
    procedure SendHapticFeedback(feedback: Haptics_ISimpleHapticsControllerFeedback); overload; safecall;
    procedure SendHapticFeedback(feedback: Haptics_ISimpleHapticsControllerFeedback; intensity: Double); overload; safecall;
    procedure SendHapticFeedbackForDuration(feedback: Haptics_ISimpleHapticsControllerFeedback; intensity: Double; playDuration: TimeSpan); safecall;
    procedure SendHapticFeedbackForPlayCount(feedback: Haptics_ISimpleHapticsControllerFeedback; intensity: Double; playCount: Integer; replayPauseInterval: TimeSpan); safecall;
    property Id: HSTRING read get_Id;
    property IsIntensitySupported: Boolean read get_IsIntensitySupported;
    property IsPlayCountSupported: Boolean read get_IsPlayCountSupported;
    property IsPlayDurationSupported: Boolean read get_IsPlayDurationSupported;
    property IsReplayPauseIntervalSupported: Boolean read get_IsReplayPauseIntervalSupported;
    property SupportedFeedback: IVectorView_1__Haptics_ISimpleHapticsControllerFeedback read get_SupportedFeedback;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.VibrationAccessStatus>
  AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus_Delegate_Base = interface(IUnknown)
  ['{A38B59DB-4EF1-5BD2-89EF-F1D9F1FACA96}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.VibrationAccessStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.VibrationAccessStatus>
  AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus = interface(AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Haptics_VibrationAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.VibrationAccessStatus>
  IAsyncOperation_1__Haptics_VibrationAccessStatus_Base = interface(IInspectable)
  ['{076B2611-5614-55A5-9C58-F9D17A8F0B79}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.VibrationAccessStatus>
  // Used Types:  Windows.Devices.Haptics.VibrationAccessStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.VibrationAccessStatus>
  IAsyncOperation_1__Haptics_VibrationAccessStatus = interface(IAsyncOperation_1__Haptics_VibrationAccessStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus; safecall;
    function GetResults: Haptics_VibrationAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Haptics_VibrationAccessStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  }
  // Windows.Devices.Haptics.IVibrationDevice
  [WinRTClassNameAttribute(SHaptics_VibrationDevice)]
  Haptics_IVibrationDevice = interface(IInspectable)
  ['{40F21A3E-8844-47FF-B312-06185A3844DA}']
    function get_Id: HSTRING; safecall;
    function get_SimpleHapticsController: Haptics_ISimpleHapticsController; safecall;
    property Id: HSTRING read get_Id;
    property SimpleHapticsController: Haptics_ISimpleHapticsController read get_SimpleHapticsController;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.IVibrationDevice>
  AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice_Delegate_Base = interface(IUnknown)
  ['{4E22A135-F59A-546D-9FCF-82DEB833D968}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.IVibrationDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.IVibrationDevice>
  AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice = interface(AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice_Delegate_Base)
  ['{4B87309F-10C5-570E-A3FD-97CB76B6D8E4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Haptics_IVibrationDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.IVibrationDevice>
  IAsyncOperation_1__Haptics_IVibrationDevice_Base = interface(IInspectable)
  ['{44193494-E331-50CA-BB61-6A71BD9B01C4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Haptics.IVibrationDevice>
  // Used Types:  Windows.Devices.Haptics.IVibrationDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.IVibrationDevice>
  IAsyncOperation_1__Haptics_IVibrationDevice = interface(IAsyncOperation_1__Haptics_IVibrationDevice_Base)
  ['{C6A30145-5374-5AC1-B4B5-59A45C2AB06D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice; safecall;
    function GetResults: Haptics_IVibrationDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Haptics_IVibrationDevice read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.IVibrationDevice>
  IIterator_1__Haptics_IVibrationDevice_Base = interface(IInspectable)
  ['{24E9B323-EEF1-533F-AD38-DE8FC8CA5692}']
  end;
  {
  // Used Types:  Windows.Devices.Haptics.IVibrationDevice
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.IVibrationDevice>
  IIterator_1__Haptics_IVibrationDevice = interface(IIterator_1__Haptics_IVibrationDevice_Base)
  ['{B1993615-DC75-5B32-AC45-A59D65CF4C49}']
    function get_Current: Haptics_IVibrationDevice; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHaptics_IVibrationDevice): Cardinal; safecall;
    property Current: Haptics_IVibrationDevice read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.IVibrationDevice>
  IIterable_1__Haptics_IVibrationDevice_Base = interface(IInspectable)
  ['{1A40C994-8810-5688-9362-C4BB51018552}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.IVibrationDevice>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.IVibrationDevice>
  IIterable_1__Haptics_IVibrationDevice = interface(IIterable_1__Haptics_IVibrationDevice_Base)
  ['{28FA3244-BDE9-5B44-96AF-222F35394CB0}']
    function First: IIterator_1__Haptics_IVibrationDevice; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Haptics.IVibrationDevice
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>
  IVectorView_1__Haptics_IVibrationDevice = interface(IInspectable)
  ['{FC58B864-3BA2-54FE-9C85-6C98492DD7C5}']
    function GetAt(index: Cardinal): Haptics_IVibrationDevice; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Haptics_IVibrationDevice; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHaptics_IVibrationDevice): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice_Delegate_Base = interface(IUnknown)
  ['{096F6389-6757-56DF-AF12-CFE1D8F23FC1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice_Delegate_Base)
  ['{BDCAB79B-84D3-5718-82F6-BAF9C4DA04F5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice_Base = interface(IInspectable)
  ['{BDA8B138-7862-59F3-BFD9-5F1CB063DF02}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice = interface(IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice_Base)
  ['{9E8DED53-5778-5115-9F0D-2A09B1D4E7F8}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice; safecall;
    function GetResults: IVectorView_1__Haptics_IVibrationDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Haptics_IVibrationDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.VibrationAccessStatus>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Haptics.IVibrationDevice>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.IVibrationDevice>>
  }
  // Windows.Devices.Haptics.IVibrationDeviceStatics
  [WinRTClassNameAttribute(SHaptics_VibrationDevice)]
  Haptics_IVibrationDeviceStatics = interface(IInspectable)
  ['{53E2EDED-2290-4AC9-8EB3-1A84122EB71C}']
    function RequestAccessAsync: IAsyncOperation_1__Haptics_VibrationAccessStatus; safecall;
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Haptics_IVibrationDevice; safecall;
    function GetDefaultAsync: IAsyncOperation_1__Haptics_IVibrationDevice; safecall;
    function FindAllAsync: IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Devices.HumanInterfaceDevice.HidCollectionType
  }
  // Windows.Devices.HumanInterfaceDevice.IHidCollection
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidCollection)]
  HumanInterfaceDevice_IHidCollection = interface(IInspectable)
  ['{7189F5A3-32F1-46E3-BEFD-44D2663B7E6A}']
    function get_Id: Cardinal; safecall;
    function get_Type: HumanInterfaceDevice_HidCollectionType; safecall;
    function get_UsagePage: Cardinal; safecall;
    function get_UsageId: Cardinal; safecall;
    property Id: Cardinal read get_Id;
    property &Type: HumanInterfaceDevice_HidCollectionType read get_Type;
    property UsageId: Cardinal read get_UsageId;
    property UsagePage: Cardinal read get_UsagePage;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IIterator_1__HumanInterfaceDevice_IHidCollection_Base = interface(IInspectable)
  ['{CEFCEE70-C7FF-57C1-A675-A0DF8976A988}']
  end;
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidCollection
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IIterator_1__HumanInterfaceDevice_IHidCollection = interface(IIterator_1__HumanInterfaceDevice_IHidCollection_Base)
  ['{5B5860C9-576C-58B9-A049-CD0DA734CA61}']
    function get_Current: HumanInterfaceDevice_IHidCollection; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidCollection): Cardinal; safecall;
    property Current: HumanInterfaceDevice_IHidCollection read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IIterable_1__HumanInterfaceDevice_IHidCollection_Base = interface(IInspectable)
  ['{BBEADA0F-708F-5B5E-A017-5C64FFB96B69}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IIterable_1__HumanInterfaceDevice_IHidCollection = interface(IIterable_1__HumanInterfaceDevice_IHidCollection_Base)
  ['{D4FE88CE-C443-5096-8CAC-83CF73DEC8EC}']
    function First: IIterator_1__HumanInterfaceDevice_IHidCollection; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidCollection
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  IVectorView_1__HumanInterfaceDevice_IHidCollection = interface(IInspectable)
  ['{909C5998-72D1-5649-82E6-3D323471498B}']
    function GetAt(index: Cardinal): HumanInterfaceDevice_IHidCollection; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HumanInterfaceDevice_IHidCollection; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidCollection): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.HumanInterfaceDevice.HidReportType
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  }
  // Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidBooleanControlDescription)]
  HumanInterfaceDevice_IHidBooleanControlDescription = interface(IInspectable)
  ['{6196E543-29D8-4A2A-8683-849E207BBE31}']
    function get_Id: Cardinal; safecall;
    function get_ReportId: Word; safecall;
    function get_ReportType: HumanInterfaceDevice_HidReportType; safecall;
    function get_UsagePage: Word; safecall;
    function get_UsageId: Word; safecall;
    function get_ParentCollections: IVectorView_1__HumanInterfaceDevice_IHidCollection; safecall;
    property Id: Cardinal read get_Id;
    property ParentCollections: IVectorView_1__HumanInterfaceDevice_IHidCollection read get_ParentCollections;
    property ReportId: Word read get_ReportId;
    property ReportType: HumanInterfaceDevice_HidReportType read get_ReportType;
    property UsageId: Word read get_UsageId;
    property UsagePage: Word read get_UsagePage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt16
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  }
  // Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidBooleanControl)]
  HumanInterfaceDevice_IHidBooleanControl = interface(IInspectable)
  ['{524DF48A-3695-408C-BBA2-E2EB5ABFBC20}']
    function get_Id: Cardinal; safecall;
    function get_UsagePage: Word; safecall;
    function get_UsageId: Word; safecall;
    function get_IsActive: Boolean; safecall;
    procedure put_IsActive(value: Boolean); safecall;
    function get_ControlDescription: HumanInterfaceDevice_IHidBooleanControlDescription; safecall;
    property ControlDescription: HumanInterfaceDevice_IHidBooleanControlDescription read get_ControlDescription;
    property Id: Cardinal read get_Id;
    property IsActive: Boolean read get_IsActive write put_IsActive;
    property UsageId: Word read get_UsageId;
    property UsagePage: Word read get_UsagePage;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IIterator_1__HumanInterfaceDevice_IHidBooleanControl_Base = interface(IInspectable)
  ['{5CDE3C23-D054-53D6-ABF1-41E73379B472}']
  end;
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IIterator_1__HumanInterfaceDevice_IHidBooleanControl = interface(IIterator_1__HumanInterfaceDevice_IHidBooleanControl_Base)
  ['{46D54E7C-DDC6-5ECB-AFA4-B93442B0B3F1}']
    function get_Current: HumanInterfaceDevice_IHidBooleanControl; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidBooleanControl): Cardinal; safecall;
    property Current: HumanInterfaceDevice_IHidBooleanControl read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IIterable_1__HumanInterfaceDevice_IHidBooleanControl_Base = interface(IInspectable)
  ['{1111E585-5AB0-5D2B-8AED-B6D6186D1C3F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IIterable_1__HumanInterfaceDevice_IHidBooleanControl = interface(IIterable_1__HumanInterfaceDevice_IHidBooleanControl_Base)
  ['{CE73EA56-67AD-5EDE-9D94-8B2239F01F95}']
    function First: IIterator_1__HumanInterfaceDevice_IHidBooleanControl; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  IVectorView_1__HumanInterfaceDevice_IHidBooleanControl = interface(IInspectable)
  ['{71D6B8C2-DAD6-54BD-AF65-892273FA8456}']
    function GetAt(index: Cardinal): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HumanInterfaceDevice_IHidBooleanControl; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidBooleanControl): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.HumanInterfaceDevice.HidReportType
  // Used Types:  Int32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidCollection>
  }
  // Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidNumericControlDescription)]
  HumanInterfaceDevice_IHidNumericControlDescription = interface(IInspectable)
  ['{638D5E86-1D97-4C75-927F-5FF58BA05E32}']
    function get_Id: Cardinal; safecall;
    function get_ReportId: Word; safecall;
    function get_ReportType: HumanInterfaceDevice_HidReportType; safecall;
    function get_ReportSize: Cardinal; safecall;
    function get_ReportCount: Cardinal; safecall;
    function get_UsagePage: Word; safecall;
    function get_UsageId: Word; safecall;
    function get_LogicalMinimum: Integer; safecall;
    function get_LogicalMaximum: Integer; safecall;
    function get_PhysicalMinimum: Integer; safecall;
    function get_PhysicalMaximum: Integer; safecall;
    function get_UnitExponent: Cardinal; safecall;
    function get_Unit: Cardinal; safecall;
    function get_IsAbsolute: Boolean; safecall;
    function get_HasNull: Boolean; safecall;
    function get_ParentCollections: IVectorView_1__HumanInterfaceDevice_IHidCollection; safecall;
    property HasNull: Boolean read get_HasNull;
    property Id: Cardinal read get_Id;
    property IsAbsolute: Boolean read get_IsAbsolute;
    property LogicalMaximum: Integer read get_LogicalMaximum;
    property LogicalMinimum: Integer read get_LogicalMinimum;
    property ParentCollections: IVectorView_1__HumanInterfaceDevice_IHidCollection read get_ParentCollections;
    property PhysicalMaximum: Integer read get_PhysicalMaximum;
    property PhysicalMinimum: Integer read get_PhysicalMinimum;
    property ReportCount: Cardinal read get_ReportCount;
    property ReportId: Word read get_ReportId;
    property ReportSize: Cardinal read get_ReportSize;
    property ReportType: HumanInterfaceDevice_HidReportType read get_ReportType;
    property &Unit: Cardinal read get_Unit;
    property UnitExponent: Cardinal read get_UnitExponent;
    property UsageId: Word read get_UsageId;
    property UsagePage: Word read get_UsagePage;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  UInt16
  // Used Types:  Int64
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  }
  // Windows.Devices.HumanInterfaceDevice.IHidNumericControl
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidNumericControl)]
  HumanInterfaceDevice_IHidNumericControl = interface(IInspectable)
  ['{E38A12A5-35A7-4B75-89C8-FB1F28B10823}']
    function get_Id: Cardinal; safecall;
    function get_IsGrouped: Boolean; safecall;
    function get_UsagePage: Word; safecall;
    function get_UsageId: Word; safecall;
    function get_Value: Int64; safecall;
    procedure put_Value(value: Int64); safecall;
    function get_ScaledValue: Int64; safecall;
    procedure put_ScaledValue(value: Int64); safecall;
    function get_ControlDescription: HumanInterfaceDevice_IHidNumericControlDescription; safecall;
    property ControlDescription: HumanInterfaceDevice_IHidNumericControlDescription read get_ControlDescription;
    property Id: Cardinal read get_Id;
    property IsGrouped: Boolean read get_IsGrouped;
    property ScaledValue: Int64 read get_ScaledValue write put_ScaledValue;
    property UsageId: Word read get_UsageId;
    property UsagePage: Word read get_UsagePage;
    property Value: Int64 read get_Value write put_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControl>
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControl
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  }
  // Windows.Devices.HumanInterfaceDevice.IHidInputReport
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidInputReport)]
  HumanInterfaceDevice_IHidInputReport = interface(IInspectable)
  ['{C35D0E50-F7E7-4E8D-B23E-CABBE56B90E9}']
    function get_Id: Word; safecall;
    function get_Data: IBuffer; safecall;
    function get_ActivatedBooleanControls: IVectorView_1__HumanInterfaceDevice_IHidBooleanControl; safecall;
    function get_TransitionedBooleanControls: IVectorView_1__HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetBooleanControl(usagePage: Word; usageId: Word): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetBooleanControlByDescription(controlDescription: HumanInterfaceDevice_IHidBooleanControlDescription): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetNumericControl(usagePage: Word; usageId: Word): HumanInterfaceDevice_IHidNumericControl; safecall;
    function GetNumericControlByDescription(controlDescription: HumanInterfaceDevice_IHidNumericControlDescription): HumanInterfaceDevice_IHidNumericControl; safecall;
    property ActivatedBooleanControls: IVectorView_1__HumanInterfaceDevice_IHidBooleanControl read get_ActivatedBooleanControls;
    property Data: IBuffer read get_Data;
    property Id: Word read get_Id;
    property TransitionedBooleanControls: IVectorView_1__HumanInterfaceDevice_IHidBooleanControl read get_TransitionedBooleanControls;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport_Delegate_Base = interface(IUnknown)
  ['{01C83770-03AB-5576-98B4-8D75CE1A9885}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport = interface(AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport_Delegate_Base)
  ['{218F0A5D-736F-5991-BF40-9D8DE63E9CC5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport_Base = interface(IInspectable)
  ['{B3E28917-CD48-57B3-A0B1-321432E85BD6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidInputReport
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport = interface(IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport_Base)
  ['{447A32CF-2A9D-544F-B04A-454B268C1D2B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport; safecall;
    function GetResults: HumanInterfaceDevice_IHidInputReport; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidInputReport read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControl
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  }
  // Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidFeatureReport)]
  HumanInterfaceDevice_IHidFeatureReport = interface(IInspectable)
  ['{841D9B79-5AE5-46E3-82EF-1FEC5C8942F4}']
    function get_Id: Word; safecall;
    function get_Data: IBuffer; safecall;
    procedure put_Data(value: IBuffer); safecall;
    function GetBooleanControl(usagePage: Word; usageId: Word): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetBooleanControlByDescription(controlDescription: HumanInterfaceDevice_IHidBooleanControlDescription): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetNumericControl(usagePage: Word; usageId: Word): HumanInterfaceDevice_IHidNumericControl; safecall;
    function GetNumericControlByDescription(controlDescription: HumanInterfaceDevice_IHidNumericControlDescription): HumanInterfaceDevice_IHidNumericControl; safecall;
    property Data: IBuffer read get_Data write put_Data;
    property Id: Word read get_Id;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport_Delegate_Base = interface(IUnknown)
  ['{DB643555-3D16-57FE-B7EF-2BDBD719FDBF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport = interface(AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport_Delegate_Base)
  ['{70DFCECA-050A-5B4B-85FA-C9AAD766B541}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport_Base = interface(IInspectable)
  ['{D72FB6F9-42F6-5F45-BFE3-29AF247C2E85}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport = interface(IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport_Base)
  ['{317F7199-0362-571C-8C73-36A76961F38E}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport; safecall;
    function GetResults: HumanInterfaceDevice_IHidFeatureReport; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidFeatureReport read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControl
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControl
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  }
  // Windows.Devices.HumanInterfaceDevice.IHidOutputReport
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidOutputReport)]
  HumanInterfaceDevice_IHidOutputReport = interface(IInspectable)
  ['{62CB2544-C896-4463-93C1-DF9DB053C450}']
    function get_Id: Word; safecall;
    function get_Data: IBuffer; safecall;
    procedure put_Data(value: IBuffer); safecall;
    function GetBooleanControl(usagePage: Word; usageId: Word): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetBooleanControlByDescription(controlDescription: HumanInterfaceDevice_IHidBooleanControlDescription): HumanInterfaceDevice_IHidBooleanControl; safecall;
    function GetNumericControl(usagePage: Word; usageId: Word): HumanInterfaceDevice_IHidNumericControl; safecall;
    function GetNumericControlByDescription(controlDescription: HumanInterfaceDevice_IHidNumericControlDescription): HumanInterfaceDevice_IHidNumericControl; safecall;
    property Data: IBuffer read get_Data write put_Data;
    property Id: Word read get_Id;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription_Base = interface(IInspectable)
  ['{203203B0-B7F4-542D-B0D0-9CAA1FB55D7F}']
  end;
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription = interface(IIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription_Base)
  ['{58198D0C-DD87-5365-A8EA-8A3CB1E29C40}']
    function get_Current: HumanInterfaceDevice_IHidBooleanControlDescription; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidBooleanControlDescription): Cardinal; safecall;
    property Current: HumanInterfaceDevice_IHidBooleanControlDescription read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IIterable_1__HumanInterfaceDevice_IHidBooleanControlDescription_Base = interface(IInspectable)
  ['{D0FF0FED-A156-58BF-9411-5777DF9D57BF}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IIterable_1__HumanInterfaceDevice_IHidBooleanControlDescription = interface(IIterable_1__HumanInterfaceDevice_IHidBooleanControlDescription_Base)
  ['{68DD8797-E4E3-5E55-9F2E-38C25674D9A0}']
    function First: IIterator_1__HumanInterfaceDevice_IHidBooleanControlDescription; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  IVectorView_1__HumanInterfaceDevice_IHidBooleanControlDescription = interface(IInspectable)
  ['{DD5CD347-21F8-5CE7-B15B-216CA9F4CEDE}']
    function GetAt(index: Cardinal): HumanInterfaceDevice_IHidBooleanControlDescription; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HumanInterfaceDevice_IHidBooleanControlDescription; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidBooleanControlDescription): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IIterator_1__HumanInterfaceDevice_IHidNumericControlDescription_Base = interface(IInspectable)
  ['{52B9C36E-7D95-5D1C-ACAB-23C19EA76F01}']
  end;
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IIterator_1__HumanInterfaceDevice_IHidNumericControlDescription = interface(IIterator_1__HumanInterfaceDevice_IHidNumericControlDescription_Base)
  ['{4A1F5341-EFC3-526A-8111-1E2C578800BD}']
    function get_Current: HumanInterfaceDevice_IHidNumericControlDescription; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidNumericControlDescription): Cardinal; safecall;
    property Current: HumanInterfaceDevice_IHidNumericControlDescription read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IIterable_1__HumanInterfaceDevice_IHidNumericControlDescription_Base = interface(IInspectable)
  ['{868F060D-E0D4-571B-B2F7-431D6984A513}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IIterable_1__HumanInterfaceDevice_IHidNumericControlDescription = interface(IIterable_1__HumanInterfaceDevice_IHidNumericControlDescription_Base)
  ['{6C9252D6-8330-553A-AE3B-C659DE6AB666}']
    function First: IIterator_1__HumanInterfaceDevice_IHidNumericControlDescription; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  IVectorView_1__HumanInterfaceDevice_IHidNumericControlDescription = interface(IInspectable)
  ['{8BFE8BFD-2BAE-5AC2-AB76-C73F50FF5A2C}']
    function GetAt(index: Cardinal): HumanInterfaceDevice_IHidNumericControlDescription; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: HumanInterfaceDevice_IHidNumericControlDescription; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHumanInterfaceDevice_IHidNumericControlDescription): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidInputReport
  }
  // Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidInputReportReceivedEventArgs)]
  HumanInterfaceDevice_IHidInputReportReceivedEventArgs = interface(IInspectable)
  ['{7059C5CB-59B2-4DC2-985C-0ADC6136FA2D}']
    function get_Report: HumanInterfaceDevice_IHidInputReport; safecall;
    property Report: HumanInterfaceDevice_IHidInputReport read get_Report;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.HumanInterfaceDevice.IHidDevice,Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs>
  TypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{31E757C8-8F6A-540B-938B-ABA79B6F03EC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidDevice
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.HumanInterfaceDevice.IHidDevice,Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs>
  TypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs = interface(TypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs_Delegate_Base)
  ['{E32AB987-9008-5720-869C-3351133C9281}']
    procedure Invoke(sender: HumanInterfaceDevice_IHidDevice; args: HumanInterfaceDevice_IHidInputReportReceivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt16
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidInputReport>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidFeatureReport>
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidOutputReport
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidFeatureReport
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription>
  // Used Types:  Windows.Devices.HumanInterfaceDevice.HidReportType
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.HumanInterfaceDevice.IHidDevice,Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs>
  }
  // Windows.Devices.HumanInterfaceDevice.IHidDevice
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidDevice)]
  HumanInterfaceDevice_IHidDevice = interface(IInspectable)
  ['{5F8A14E7-2200-432E-95DA-D09B87D574A8}']
    function get_VendorId: Word; safecall;
    function get_ProductId: Word; safecall;
    function get_Version: Word; safecall;
    function get_UsagePage: Word; safecall;
    function get_UsageId: Word; safecall;
    function GetInputReportAsync: IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport; overload; safecall;
    function GetInputReportAsync(reportId: Word): IAsyncOperation_1__HumanInterfaceDevice_IHidInputReport; overload; safecall;
    function GetFeatureReportAsync: IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport; overload; safecall;
    function GetFeatureReportAsync(reportId: Word): IAsyncOperation_1__HumanInterfaceDevice_IHidFeatureReport; overload; safecall;
    function CreateOutputReport: HumanInterfaceDevice_IHidOutputReport; overload; safecall;
    function CreateOutputReport(reportId: Word): HumanInterfaceDevice_IHidOutputReport; overload; safecall;
    function CreateFeatureReport: HumanInterfaceDevice_IHidFeatureReport; overload; safecall;
    function CreateFeatureReport(reportId: Word): HumanInterfaceDevice_IHidFeatureReport; overload; safecall;
    function SendOutputReportAsync(outputReport: HumanInterfaceDevice_IHidOutputReport): IAsyncOperation_1__Cardinal; safecall;
    function SendFeatureReportAsync(featureReport: HumanInterfaceDevice_IHidFeatureReport): IAsyncOperation_1__Cardinal; safecall;
    function GetBooleanControlDescriptions(reportType: HumanInterfaceDevice_HidReportType; usagePage: Word; usageId: Word): IVectorView_1__HumanInterfaceDevice_IHidBooleanControlDescription; safecall;
    function GetNumericControlDescriptions(reportType: HumanInterfaceDevice_HidReportType; usagePage: Word; usageId: Word): IVectorView_1__HumanInterfaceDevice_IHidNumericControlDescription; safecall;
    function add_InputReportReceived(reportHandler: TypedEventHandler_2__HumanInterfaceDevice_IHidDevice__HumanInterfaceDevice_IHidInputReportReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_InputReportReceived(token: EventRegistrationToken); safecall;
    property ProductId: Word read get_ProductId;
    property UsageId: Word read get_UsageId;
    property UsagePage: Word read get_UsagePage;
    property VendorId: Word read get_VendorId;
    property Version: Word read get_Version;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice_Delegate_Base = interface(IUnknown)
  ['{B0E8E149-0CB6-55A7-BCC1-D996324D65C4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice = interface(AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice_Delegate_Base)
  ['{45177FBD-9977-5248-87AD-5DE7AB8FA566}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__HumanInterfaceDevice_IHidDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  IAsyncOperation_1__HumanInterfaceDevice_IHidDevice_Base = interface(IInspectable)
  ['{A76A4FBF-5177-5256-84A8-B31A8DCF1048}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  // Used Types:  Windows.Devices.HumanInterfaceDevice.IHidDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  IAsyncOperation_1__HumanInterfaceDevice_IHidDevice = interface(IAsyncOperation_1__HumanInterfaceDevice_IHidDevice_Base)
  ['{9BE2DD5E-2EB8-59EE-9E27-29F6AE5EF920}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice; safecall;
    function GetResults: HumanInterfaceDevice_IHidDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__HumanInterfaceDevice_IHidDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt16
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.HumanInterfaceDevice.IHidDevice>
  // Used Types:  Windows.Storage.FileAccessMode
  }
  // Windows.Devices.HumanInterfaceDevice.IHidDeviceStatics
  [WinRTClassNameAttribute(SHumanInterfaceDevice_HidDevice)]
  HumanInterfaceDevice_IHidDeviceStatics = interface(IInspectable)
  ['{9E5981E4-9856-418C-9F73-77DE0CD85754}']
    function GetDeviceSelector(usagePage: Word; usageId: Word): HSTRING; overload; safecall;
    function GetDeviceSelector(usagePage: Word; usageId: Word; vendorId: Word; productId: Word): HSTRING; overload; safecall;
    function FromIdAsync(deviceId: HSTRING; accessMode: FileAccessMode): IAsyncOperation_1__HumanInterfaceDevice_IHidDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription2
  HumanInterfaceDevice_IHidBooleanControlDescription2 = interface(IInspectable)
  ['{C8EED2EA-8A77-4C36-AA00-5FF0449D3E73}']
    function get_IsAbsolute: Boolean; safecall;
    property IsAbsolute: Boolean read get_IsAbsolute;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.IPointerDevice>
  IIterator_1__Input_IPointerDevice_Base = interface(IInspectable)
  ['{DE94641C-7960-5FCD-ABE8-D6BA609EF7D3}']
  end;
  {
  // Used Types:  Windows.Devices.Input.IPointerDevice
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.IPointerDevice>
  IIterator_1__Input_IPointerDevice = interface(IIterator_1__Input_IPointerDevice_Base)
  ['{65C701AB-8D72-5276-9212-5869688FA034}']
    function get_Current: Input_IPointerDevice; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PInput_IPointerDevice): Cardinal; safecall;
    property Current: Input_IPointerDevice read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Input.IPointerDevice>
  IIterable_1__Input_IPointerDevice_Base = interface(IInspectable)
  ['{AD26662C-845B-5C6D-AEAA-406F48C21AE9}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Input.IPointerDevice>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Input.IPointerDevice>
  IIterable_1__Input_IPointerDevice = interface(IIterable_1__Input_IPointerDevice_Base)
  ['{81F54716-BA6A-5508-8432-EEC662857BC7}']
    function First: IIterator_1__Input_IPointerDevice; safecall;
  end;

  {
  // Used Types:  Windows.Devices.Input.IPointerDevice
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Input.IPointerDevice>
  IVectorView_1__Input_IPointerDevice = interface(IInspectable)
  ['{84EBCA20-739B-5879-A514-CA20C1771BFE}']
    function GetAt(index: Cardinal): Input_IPointerDevice; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Input_IPointerDevice; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PInput_IPointerDevice): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.Provider.IKnownPerceptionFrameKindStatics
  [WinRTClassNameAttribute(SPerception_Provider_KnownPerceptionFrameKind)]
  Perception_Provider_IKnownPerceptionFrameKindStatics = interface(IInspectable)
  ['{3AE651D6-9669-4106-9FAE-4835C1B96104}']
    function get_Color: HSTRING; safecall;
    function get_Depth: HSTRING; safecall;
    function get_Infrared: HSTRING; safecall;
    property Color: HSTRING read get_Color;
    property Depth: HSTRING read get_Depth;
    property Infrared: HSTRING read get_Infrared;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionFrameProviderInfo)]
  Perception_Provider_IPerceptionFrameProviderInfo = interface(IInspectable)
  ['{CCA959E8-797E-4E83-9B87-036A74142FC4}']
    function get_Id: HSTRING; safecall;
    procedure put_Id(value: HSTRING); safecall;
    function get_DisplayName: HSTRING; safecall;
    procedure put_DisplayName(value: HSTRING); safecall;
    function get_DeviceKind: HSTRING; safecall;
    procedure put_DeviceKind(value: HSTRING); safecall;
    function get_FrameKind: HSTRING; safecall;
    procedure put_FrameKind(value: HSTRING); safecall;
    function get_Hidden: Boolean; safecall;
    procedure put_Hidden(value: Boolean); safecall;
    property DeviceKind: HSTRING read get_DeviceKind write put_DeviceKind;
    property DisplayName: HSTRING read get_DisplayName write put_DisplayName;
    property FrameKind: HSTRING read get_FrameKind write put_FrameKind;
    property Hidden: Boolean read get_Hidden write put_Hidden;
    property Id: HSTRING read get_Id write put_Id;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Object
  // Used Types:  Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeStatus
  // Used Types:  Windows.Foundation.IDeferral
  }
  // Windows.Devices.Perception.Provider.IPerceptionPropertyChangeRequest
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionPropertyChangeRequest)]
  Perception_Provider_IPerceptionPropertyChangeRequest = interface(IInspectable)
  ['{3C5AEB51-350B-4DF8-9414-59E09815510B}']
    function get_Name: HSTRING; safecall;
    function get_Value: IInspectable; safecall;
    function get_Status: Perception_PerceptionFrameSourcePropertyChangeStatus; safecall;
    procedure put_Status(value: Perception_PerceptionFrameSourcePropertyChangeStatus); safecall;
    function GetDeferral: IDeferral; safecall;
    property Name: HSTRING read get_Name;
    property Status: Perception_PerceptionFrameSourcePropertyChangeStatus read get_Status write put_Status;
    property Value: IInspectable read get_Value;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionPropertyChangeRequest
  }
  // Windows.Devices.Perception.Provider.IPerceptionFrameProvider
  Perception_Provider_IPerceptionFrameProvider = interface(IInspectable)
  ['{794F7AB9-B37D-3B33-A10D-30626419CE65}']
    function get_FrameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo; safecall;
    function get_Available: Boolean; safecall;
    function get_Properties: IPropertySet; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure SetProperty(value: Perception_Provider_IPerceptionPropertyChangeRequest); safecall;
    property Available: Boolean read get_Available;
    property FrameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo read get_FrameProviderInfo;
    property Properties: IPropertySet read get_Properties;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrameProvider
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
  }
  // Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
  Perception_Provider_IPerceptionFrameProviderManager = interface(IInspectable)
  ['{A959CE07-EAD3-33DF-8EC1-B924ABE019C4}']
    function GetFrameProvider(frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo): Perception_Provider_IPerceptionFrameProvider; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionFaceAuthenticationGroup)]
  Perception_Provider_IPerceptionFaceAuthenticationGroup = interface(IInspectable)
  ['{E8019814-4A91-41B0-83A6-881A1775353E}']
    function get_FrameProviderIds: IVectorView_1__HSTRING; safecall;
    property FrameProviderIds: IVectorView_1__HSTRING read get_FrameProviderIds;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Devices.Perception.Provider.IPerceptionControlGroup
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionControlGroup)]
  Perception_Provider_IPerceptionControlGroup = interface(IInspectable)
  ['{172C4882-2FD9-4C4E-BA34-FDF20A73DDE5}']
    function get_FrameProviderIds: IVectorView_1__HSTRING; safecall;
    property FrameProviderIds: IVectorView_1__HSTRING read get_FrameProviderIds;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  }
  // Windows.Devices.Perception.Provider.IPerceptionCorrelation
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionCorrelation)]
  Perception_Provider_IPerceptionCorrelation = interface(IInspectable)
  ['{B4131A82-DFF5-4047-8A19-3B4D805F7176}']
    function get_TargetId: HSTRING; safecall;
    function get_Position: Numerics_Vector3; safecall;
    function get_Orientation: Numerics_Quaternion; safecall;
    property Orientation: Numerics_Quaternion read get_Orientation;
    property Position: Numerics_Vector3 read get_Position;
    property TargetId: HSTRING read get_TargetId;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IIterator_1__Perception_Provider_IPerceptionCorrelation_Base = interface(IInspectable)
  ['{C4DB1093-D705-5503-8BCE-68535CD42FFA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionCorrelation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IIterator_1__Perception_Provider_IPerceptionCorrelation = interface(IIterator_1__Perception_Provider_IPerceptionCorrelation_Base)
  ['{D9E6DD9C-B782-5B12-AAB2-4C5851CEB710}']
    function get_Current: Perception_Provider_IPerceptionCorrelation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPerception_Provider_IPerceptionCorrelation): Cardinal; safecall;
    property Current: Perception_Provider_IPerceptionCorrelation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IIterable_1__Perception_Provider_IPerceptionCorrelation_Base = interface(IInspectable)
  ['{CA6BF87E-1745-5CD0-AEE2-59736F5A206D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IIterable_1__Perception_Provider_IPerceptionCorrelation = interface(IIterable_1__Perception_Provider_IPerceptionCorrelation_Base)
  ['{B0D49670-8483-5F0D-BEB1-232BB931D441}']
    function First: IIterator_1__Perception_Provider_IPerceptionCorrelation; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionCorrelation
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  IVectorView_1__Perception_Provider_IPerceptionCorrelation = interface(IInspectable)
  ['{28C0D4FB-231F-5627-AE3E-81A37BDA576A}']
    function GetAt(index: Cardinal): Perception_Provider_IPerceptionCorrelation; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Perception_Provider_IPerceptionCorrelation; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPerception_Provider_IPerceptionCorrelation): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  }
  // Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionCorrelationGroup)]
  Perception_Provider_IPerceptionCorrelationGroup = interface(IInspectable)
  ['{752A0906-36A7-47BB-9B79-56CC6B746770}']
    function get_RelativeLocations: IVectorView_1__Perception_Provider_IPerceptionCorrelation; safecall;
    property RelativeLocations: IVectorView_1__Perception_Provider_IPerceptionCorrelation read get_RelativeLocations;
  end deprecated;

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
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.IMemoryBuffer
  }
  // Windows.Devices.Perception.Provider.IPerceptionFrame
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionFrame)]
  Perception_Provider_IPerceptionFrame = interface(IInspectable)
  ['{7CFE7825-54BB-4D9D-BEC5-8EF66151D2AC}']
    function get_RelativeTime: TimeSpan; safecall;
    procedure put_RelativeTime(value: TimeSpan); safecall;
    function get_Properties: IPropertySet; safecall;
    function get_FrameData: IMemoryBuffer; safecall;
    property FrameData: IMemoryBuffer read get_FrameData;
    property Properties: IPropertySet read get_Properties;
    property RelativeTime: TimeSpan read get_RelativeTime write put_RelativeTime;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrameProviderManager
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionControlGroup
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrameProvider
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrame
  }
  // Windows.Devices.Perception.Provider.IPerceptionFrameProviderManagerServiceStatics
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionFrameProviderManagerService)]
  Perception_Provider_IPerceptionFrameProviderManagerServiceStatics = interface(IInspectable)
  ['{AE8386E6-CAD9-4359-8F96-8EAE51810526}']
    procedure RegisterFrameProviderInfo(manager: Perception_Provider_IPerceptionFrameProviderManager; frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo); safecall;
    procedure UnregisterFrameProviderInfo(manager: Perception_Provider_IPerceptionFrameProviderManager; frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo); safecall;
    procedure RegisterFaceAuthenticationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; faceAuthenticationGroup: Perception_Provider_IPerceptionFaceAuthenticationGroup); safecall;
    procedure UnregisterFaceAuthenticationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; faceAuthenticationGroup: Perception_Provider_IPerceptionFaceAuthenticationGroup); safecall;
    procedure RegisterControlGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; controlGroup: Perception_Provider_IPerceptionControlGroup); safecall;
    procedure UnregisterControlGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; controlGroup: Perception_Provider_IPerceptionControlGroup); safecall;
    procedure RegisterCorrelationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; correlationGroup: Perception_Provider_IPerceptionCorrelationGroup); safecall;
    procedure UnregisterCorrelationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; correlationGroup: Perception_Provider_IPerceptionCorrelationGroup); safecall;
    procedure UpdateAvailabilityForProvider(provider: Perception_Provider_IPerceptionFrameProvider; available: Boolean); safecall;
    procedure PublishFrameForProvider(provider: Perception_Provider_IPerceptionFrameProvider; frame: Perception_Provider_IPerceptionFrame); safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionControlGroup
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  }
  // Windows.Devices.Perception.Provider.IPerceptionControlGroupFactory
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionControlGroup)]
  Perception_Provider_IPerceptionControlGroupFactory = interface(IInspectable)
  ['{2F1AF2E0-BAF1-453B-BED4-CD9D4619154C}']
    function Create(ids: IIterable_1__HSTRING): Perception_Provider_IPerceptionControlGroup; safecall;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  }
  // Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
  Perception_Provider_PerceptionStartFaceAuthenticationHandler = interface(IUnknown)
  ['{74816D2A-2090-4670-8C48-EF39E7FF7C26}']
    function Invoke(sender: Perception_Provider_IPerceptionFaceAuthenticationGroup): Boolean; safecall;
  end deprecated;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  }
  // Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
  Perception_Provider_PerceptionStopFaceAuthenticationHandler = interface(IUnknown)
  ['{387EE6AA-89CD-481E-AADE-DD92F70B2AD7}']
    procedure Invoke(sender: Perception_Provider_IPerceptionFaceAuthenticationGroup); safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  // Used Types:  Windows.Foundation.Collections.IIterable`1<String>
  // Used Types:  Windows.Devices.Perception.Provider.PerceptionStartFaceAuthenticationHandler
  // Used Types:  Windows.Devices.Perception.Provider.PerceptionStopFaceAuthenticationHandler
  }
  // Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroupFactory
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionFaceAuthenticationGroup)]
  Perception_Provider_IPerceptionFaceAuthenticationGroupFactory = interface(IInspectable)
  ['{E68A05D4-B60C-40F4-BCB9-F24D46467320}']
    function Create(ids: IIterable_1__HSTRING; startHandler: Perception_Provider_PerceptionStartFaceAuthenticationHandler; stopHandler: Perception_Provider_PerceptionStopFaceAuthenticationHandler): Perception_Provider_IPerceptionFaceAuthenticationGroup; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionCorrelation
  // Used Types:  String
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  }
  // Windows.Devices.Perception.Provider.IPerceptionCorrelationFactory
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionCorrelation)]
  Perception_Provider_IPerceptionCorrelationFactory = interface(IInspectable)
  ['{D4A6C425-2884-4A8F-8134-2835D7286CBF}']
    function Create(targetId: HSTRING; position: Numerics_Vector3; orientation: Numerics_Quaternion): Perception_Provider_IPerceptionCorrelation; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.Provider.IPerceptionCorrelation>
  }
  // Windows.Devices.Perception.Provider.IPerceptionCorrelationGroupFactory
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionCorrelationGroup)]
  Perception_Provider_IPerceptionCorrelationGroupFactory = interface(IInspectable)
  ['{7DFE2088-63DF-48ED-83B1-4AB829132995}']
    function Create(relativeLocations: IIterable_1__Perception_Provider_IPerceptionCorrelation): Perception_Provider_IPerceptionCorrelationGroup; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionFrame
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionVideoFrameAllocator)]
  Perception_Provider_IPerceptionVideoFrameAllocator = interface(IInspectable)
  ['{4C38A7DA-FDD8-4ED4-A039-2A6F9B235038}']
    function AllocateFrame: Perception_Provider_IPerceptionFrame; safecall;
    function CopyFromVideoFrame(frame: IVideoFrame): Perception_Provider_IPerceptionFrame; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator
  // Used Types:  UInt32
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Windows.Foundation.Size
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  }
  // Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocatorFactory
  [WinRTClassNameAttribute(SPerception_Provider_PerceptionVideoFrameAllocator)]
  Perception_Provider_IPerceptionVideoFrameAllocatorFactory = interface(IInspectable)
  ['{1A58B0E1-E91A-481E-B876-A89E2BBC6B33}']
    function Create(maxOutstandingFrameCountForWrite: Cardinal; format: Imaging_BitmapPixelFormat; resolution: TSizeF; alpha: Imaging_BitmapAlphaMode): Perception_Provider_IPerceptionVideoFrameAllocator; safecall;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable_Delegate_Base = interface(IUnknown)
  ['{023444D9-7B47-5497-9569-4399FAF96717}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable_Delegate_Base)
  ['{F629481D-0AB3-59E8-86FA-0B554C9CAB8F}']
    procedure Invoke(sender: Perception_IPerceptionColorFrameSource; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.CollectionChange
  // Used Types:  String
  }
  // Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionFrameSourcePropertiesChangedEventArgs)]
  Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface(IInspectable)
  ['{6C68E068-BCF1-4ECC-B891-7625D1244B6B}']
    function get_CollectionChange: CollectionChange; safecall;
    function get_Key: HSTRING; safecall;
    property CollectionChange: CollectionChange read get_CollectionChange;
    property Key: HSTRING read get_Key;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{B2C3A488-7ED9-5110-804A-9792EF7F26BE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  // Used Types:  Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs_Delegate_Base)
  ['{51A34A0D-16F2-5267-A320-8E3EFAB8CD22}']
    procedure Invoke(sender: Perception_IPerceptionColorFrameSource; args: Perception_IPerceptionFrameSourcePropertiesChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Perception.IPerceptionVideoProfile
  }
  // Windows.Devices.Perception.IPerceptionVideoProfile
  [WinRTClassNameAttribute(SPerception_PerceptionVideoProfile)]
  Perception_IPerceptionVideoProfile = interface(IInspectable)
  ['{75763EA3-011A-470E-8225-6F05ADE25648}']
    function get_BitmapPixelFormat: Imaging_BitmapPixelFormat; safecall;
    function get_BitmapAlphaMode: Imaging_BitmapAlphaMode; safecall;
    function get_Width: Integer; safecall;
    function get_Height: Integer; safecall;
    function get_FrameDuration: TimeSpan; safecall;
    function IsEqual(other: Perception_IPerceptionVideoProfile): Boolean; safecall;
    property BitmapAlphaMode: Imaging_BitmapAlphaMode read get_BitmapAlphaMode;
    property BitmapPixelFormat: Imaging_BitmapPixelFormat read get_BitmapPixelFormat;
    property FrameDuration: TimeSpan read get_FrameDuration;
    property Height: Integer read get_Height;
    property Width: Integer read get_Width;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IIterator_1__Perception_IPerceptionVideoProfile_Base = interface(IInspectable)
  ['{38CE8062-7079-5D7B-841F-9AA4580FD5F1}']
  end;
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionVideoProfile
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IIterator_1__Perception_IPerceptionVideoProfile = interface(IIterator_1__Perception_IPerceptionVideoProfile_Base)
  ['{671268F5-72E2-59AE-A380-1D8C0ADD35C1}']
    function get_Current: Perception_IPerceptionVideoProfile; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPerception_IPerceptionVideoProfile): Cardinal; safecall;
    property Current: Perception_IPerceptionVideoProfile read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IIterable_1__Perception_IPerceptionVideoProfile_Base = interface(IInspectable)
  ['{F6AEA351-EB9B-564D-B10A-06673094ACC8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IIterable_1__Perception_IPerceptionVideoProfile = interface(IIterable_1__Perception_IPerceptionVideoProfile_Base)
  ['{BF1371F1-171B-526F-B938-FEED0F8BFFD9}']
    function First: IIterator_1__Perception_IPerceptionVideoProfile; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionVideoProfile
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  IVectorView_1__Perception_IPerceptionVideoProfile = interface(IInspectable)
  ['{78D23A35-FAE7-593F-A5CA-5C411AA74009}']
    function GetAt(index: Cardinal): Perception_IPerceptionVideoProfile; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Perception_IPerceptionVideoProfile; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPerception_IPerceptionVideoProfile): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionControlSession,Object>
  TypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable_Delegate_Base = interface(IUnknown)
  ['{ABC21152-2495-5E8C-AED3-7DC55309AC08}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionControlSession
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionControlSession,Object>
  TypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable_Delegate_Base)
  ['{D2958D52-527D-5D26-A7D4-7FB526E8D2CC}']
    procedure Invoke(sender: Perception_IPerceptionControlSession; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeStatus
  // Used Types:  Object
  }
  // Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult
  [WinRTClassNameAttribute(SPerception_PerceptionFrameSourcePropertyChangeResult)]
  Perception_IPerceptionFrameSourcePropertyChangeResult = interface(IInspectable)
  ['{1E33390A-3C90-4D22-B898-F42BBA6418FF}']
    function get_Status: Perception_PerceptionFrameSourcePropertyChangeStatus; safecall;
    function get_NewValue: IInspectable; safecall;
    property NewValue: IInspectable read get_NewValue;
    property Status: Perception_PerceptionFrameSourcePropertyChangeStatus read get_Status;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult_Delegate_Base = interface(IUnknown)
  ['{3A06099C-DBA6-58A5-8464-E2326896841A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult = interface(AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult_Delegate_Base)
  ['{90DE99F8-BD9D-54DE-AFB8-1A60B8099B52}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult_Base = interface(IInspectable)
  ['{4A7BCB69-2B09-55D1-AF68-B5AA5C2C6471}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  // Used Types:  Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult = interface(IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult_Base)
  ['{4B1621E7-C3E0-551E-8F6F-DE797928C4F0}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult; safecall;
    function GetResults: Perception_IPerceptionFrameSourcePropertyChangeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionFrameSourcePropertyChangeResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionControlSession,Object>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  // Used Types:  String
  // Used Types:  Object
  }
  // Windows.Devices.Perception.IPerceptionControlSession
  [WinRTClassNameAttribute(SPerception_PerceptionControlSession)]
  Perception_IPerceptionControlSession = interface(IInspectable)
  ['{99998653-5A3D-417F-9239-F1889E548B48}']
    function add_ControlLost(handler: TypedEventHandler_2__Perception_IPerceptionControlSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ControlLost(token: EventRegistrationToken); safecall;
    function TrySetPropertyAsync(name: HSTRING; value: IInspectable): IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Devices.Perception.IPerceptionDepthFrame
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrame)]
  Perception_IPerceptionDepthFrame = interface(IInspectable)
  ['{A37B81FC-9906-4FFD-9161-0024B360B657}']
    function get_VideoFrame: IVideoFrame; safecall;
    property VideoFrame: IVideoFrame read get_VideoFrame;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrame
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics
  [WinRTClassNameAttribute(SPerception_PerceptionDepthCorrelatedCameraIntrinsics)]
  Perception_IPerceptionDepthCorrelatedCameraIntrinsics = interface(IInspectable)
  ['{6548CA01-86DE-5BE1-6582-807FCF4C95CF}']
    function UnprojectPixelAtCorrelatedDepth(pixelCoordinate: TPointF; depthFrame: Perception_IPerceptionDepthFrame): Numerics_Vector3; safecall;
    procedure UnprojectPixelsAtCorrelatedDepth(sourceCoordinatesSize: Cardinal; sourceCoordinates: PPointF; depthFrameSize: Cardinal; depthFrame: PPointF; resultsSize: Cardinal; results: PNumerics_Vector3); safecall;
    function UnprojectRegionPixelsAtCorrelatedDepthAsync(region: TRectF; depthFrame: Perception_IPerceptionDepthFrame; resultsSize: Cardinal; results: PNumerics_Vector3): IAsyncAction; safecall;
    function UnprojectAllPixelsAtCorrelatedDepthAsync(depthFrame: Perception_IPerceptionDepthFrame; resultsSize: Cardinal; results: PNumerics_Vector3): IAsyncAction; safecall;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics_Delegate_Base = interface(IUnknown)
  ['{F396602A-3D8D-5FD5-99E3-1D3630BE5938}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics = interface(AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics_Delegate_Base)
  ['{D42FB251-E3CE-5CB5-AAB6-E0E6F8570A58}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics_Base = interface(IInspectable)
  ['{702B0F49-A742-5C3A-ABD6-77F9999B8A09}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics = interface(IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics_Base)
  ['{DA39F392-589A-5189-92E2-7583DFB89F19}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics; safecall;
    function GetResults: Perception_IPerceptionDepthCorrelatedCameraIntrinsics; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable_Delegate_Base = interface(IUnknown)
  ['{135BA76A-AB44-5F69-B208-E732CCE9403B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable_Delegate_Base)
  ['{1471751F-FB76-5088-B973-EA4A0D479AD7}']
    procedure Invoke(sender: Perception_IPerceptionDepthFrameSource; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{188FDEF2-D829-548B-A89D-38A34C5CB641}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs_Delegate_Base)
  ['{19283244-B1DE-5542-9A48-05C5FCB51DDB}']
    procedure Invoke(sender: Perception_IPerceptionDepthFrameSource; args: Perception_IPerceptionFrameSourcePropertiesChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Point
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrame
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.Rect
  }
  // Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper
  [WinRTClassNameAttribute(SPerception_PerceptionDepthCorrelatedCoordinateMapper)]
  Perception_IPerceptionDepthCorrelatedCoordinateMapper = interface(IInspectable)
  ['{5B4D9D1D-B5F6-469C-B8C2-B97A45E6863B}']
    function MapPixelToTarget(sourcePixelCoordinate: TPointF; depthFrame: Perception_IPerceptionDepthFrame): TPointF; safecall;
    procedure MapPixelsToTarget(sourceCoordinatesSize: Cardinal; sourceCoordinates: PPointF; depthFrameSize: Cardinal; depthFrame: PPointF; resultsSize: Cardinal; results: PPointF); safecall;
    function MapRegionOfPixelsToTargetAsync(region: TRectF; depthFrame: Perception_IPerceptionDepthFrame; targetCoordinatesSize: Cardinal; targetCoordinates: PPointF): IAsyncAction; safecall;
    function MapAllPixelsToTargetAsync(depthFrame: Perception_IPerceptionDepthFrame; targetCoordinatesSize: Cardinal; targetCoordinates: PPointF): IAsyncAction; safecall;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper_Delegate_Base = interface(IUnknown)
  ['{48DEEDA0-684D-51E6-B07C-D234D1006BFC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper = interface(AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper_Delegate_Base)
  ['{3E9767AC-EA5C-5745-B9E7-AA5348D2615F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper_Base = interface(IInspectable)
  ['{F04B9D99-C0D5-5B48-9AE5-9802093CB45E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper = interface(IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper_Base)
  ['{76F72598-9EAC-50B7-9439-FE6021A737C4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper; safecall;
    function GetResults: Perception_IPerceptionDepthCorrelatedCoordinateMapper; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrame
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameArrivedEventArgs)]
  Perception_IPerceptionDepthFrameArrivedEventArgs = interface(IInspectable)
  ['{443D25B2-B282-4637-9173-AC978435C985}']
    function get_RelativeTime: TimeSpan; safecall;
    function TryOpenFrame: Perception_IPerceptionDepthFrame; safecall;
    property RelativeTime: TimeSpan read get_RelativeTime;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameReader,Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{4D529B7E-EEA0-511B-8285-47E8C85D0295}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameReader
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameReader,Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs_Delegate_Base)
  ['{B9C3182E-D1F5-5252-9709-93FF9956F1F8}']
    procedure Invoke(sender: Perception_IPerceptionDepthFrameReader; args: Perception_IPerceptionDepthFrameArrivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameReader,Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrame
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameReader
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameReader)]
  Perception_IPerceptionDepthFrameReader = interface(IInspectable)
  ['{B1A3C09F-299B-4612-A4F7-270F25A096EC}']
    function add_FrameArrived(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameReader__Perception_IPerceptionDepthFrameArrivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FrameArrived(token: EventRegistrationToken); safecall;
    function get_Source: Perception_IPerceptionDepthFrameSource; safecall;
    function get_IsPaused: Boolean; safecall;
    procedure put_IsPaused(value: Boolean); safecall;
    function TryReadLatestFrame: Perception_IPerceptionDepthFrame; safecall;
    property IsPaused: Boolean read get_IsPaused write put_IsPaused;
    property Source: Perception_IPerceptionDepthFrameSource read get_Source;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  // Used Types:  Windows.Devices.Perception.IPerceptionVideoProfile
  // Used Types:  Windows.Media.Devices.Core.ICameraIntrinsics
  // Used Types:  Windows.Devices.Perception.IPerceptionControlSession
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameReader
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameSource
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameSource)]
  Perception_IPerceptionDepthFrameSource = interface(IInspectable)
  ['{79D433D6-47FB-4DF1-BFC9-F01D40BD9942}']
    function add_AvailableChanged(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AvailableChanged(token: EventRegistrationToken); safecall;
    function add_ActiveChanged(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ActiveChanged(token: EventRegistrationToken); safecall;
    function add_PropertiesChanged(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PropertiesChanged(token: EventRegistrationToken); safecall;
    function add_VideoProfileChanged(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_VideoProfileChanged(token: EventRegistrationToken); safecall;
    function add_CameraIntrinsicsChanged(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CameraIntrinsicsChanged(token: EventRegistrationToken); safecall;
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_DeviceKind: HSTRING; safecall;
    function get_Available: Boolean; safecall;
    function get_Active: Boolean; safecall;
    function get_IsControlled: Boolean; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    function get_SupportedVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile; safecall;
    function get_AvailableVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile; safecall;
    function get_VideoProfile: Perception_IPerceptionVideoProfile; safecall;
    function get_CameraIntrinsics: Core_ICameraIntrinsics; safecall;
    function AcquireControlSession: Perception_IPerceptionControlSession; safecall;
    function CanControlIndependentlyFrom(targetId: HSTRING): Boolean; safecall;
    function IsCorrelatedWith(targetId: HSTRING): Boolean; safecall;
    function TryGetTransformTo(targetId: HSTRING; out a_result: Numerics_Matrix4x4): Boolean; safecall;
    function TryGetDepthCorrelatedCameraIntrinsicsAsync(target: Perception_IPerceptionDepthFrameSource): IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics; safecall;
    function TryGetDepthCorrelatedCoordinateMapperAsync(targetId: HSTRING; depthFrameSourceToMapWith: Perception_IPerceptionDepthFrameSource): IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper; safecall;
    function TrySetVideoProfileAsync(controlSession: Perception_IPerceptionControlSession; profile: Perception_IPerceptionVideoProfile): IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult; safecall;
    function OpenReader: Perception_IPerceptionDepthFrameReader; safecall;
    property Active: Boolean read get_Active;
    property Available: Boolean read get_Available;
    property AvailableVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile read get_AvailableVideoProfiles;
    property CameraIntrinsics: Core_ICameraIntrinsics read get_CameraIntrinsics;
    property DeviceKind: HSTRING read get_DeviceKind;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property IsControlled: Boolean read get_IsControlled;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property SupportedVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile read get_SupportedVideoProfiles;
    property VideoProfile: Perception_IPerceptionVideoProfile read get_VideoProfile;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Devices.Perception.IPerceptionColorFrame
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrame)]
  Perception_IPerceptionColorFrame = interface(IInspectable)
  ['{FE621549-2CBF-4F94-9861-F817EA317747}']
    function get_VideoFrame: IVideoFrame; safecall;
    property VideoFrame: IVideoFrame read get_VideoFrame;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrame
  }
  // Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameArrivedEventArgs)]
  Perception_IPerceptionColorFrameArrivedEventArgs = interface(IInspectable)
  ['{8FAD02D5-86F7-4D8D-B966-5A3761BA9F59}']
    function get_RelativeTime: TimeSpan; safecall;
    function TryOpenFrame: Perception_IPerceptionColorFrame; safecall;
    property RelativeTime: TimeSpan read get_RelativeTime;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameReader,Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A4A50EA5-778D-5056-A1CF-546A1BE2C010}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameReader
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameReader,Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs_Delegate_Base)
  ['{3B946E88-F2A7-5CBF-A885-D5ED3923FC84}']
    procedure Invoke(sender: Perception_IPerceptionColorFrameReader; args: Perception_IPerceptionColorFrameArrivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameReader,Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs>
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrame
  }
  // Windows.Devices.Perception.IPerceptionColorFrameReader
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameReader)]
  Perception_IPerceptionColorFrameReader = interface(IInspectable)
  ['{7650F56E-B9F5-461B-83AD-F222AF2AAADC}']
    function add_FrameArrived(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameReader__Perception_IPerceptionColorFrameArrivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FrameArrived(token: EventRegistrationToken); safecall;
    function get_Source: Perception_IPerceptionColorFrameSource; safecall;
    function get_IsPaused: Boolean; safecall;
    procedure put_IsPaused(value: Boolean); safecall;
    function TryReadLatestFrame: Perception_IPerceptionColorFrame; safecall;
    property IsPaused: Boolean read get_IsPaused write put_IsPaused;
    property Source: Perception_IPerceptionColorFrameSource read get_Source;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  // Used Types:  Windows.Devices.Perception.IPerceptionVideoProfile
  // Used Types:  Windows.Media.Devices.Core.ICameraIntrinsics
  // Used Types:  Windows.Devices.Perception.IPerceptionControlSession
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameReader
  }
  // Windows.Devices.Perception.IPerceptionColorFrameSource
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameSource)]
  Perception_IPerceptionColorFrameSource = interface(IInspectable)
  ['{DC6DBA7C-0B58-468D-9CA1-6DB04CC0477C}']
    function add_AvailableChanged(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AvailableChanged(token: EventRegistrationToken); safecall;
    function add_ActiveChanged(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ActiveChanged(token: EventRegistrationToken); safecall;
    function add_PropertiesChanged(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PropertiesChanged(token: EventRegistrationToken); safecall;
    function add_VideoProfileChanged(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_VideoProfileChanged(token: EventRegistrationToken); safecall;
    function add_CameraIntrinsicsChanged(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CameraIntrinsicsChanged(token: EventRegistrationToken); safecall;
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_DeviceKind: HSTRING; safecall;
    function get_Available: Boolean; safecall;
    function get_Active: Boolean; safecall;
    function get_IsControlled: Boolean; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    function get_SupportedVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile; safecall;
    function get_AvailableVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile; safecall;
    function get_VideoProfile: Perception_IPerceptionVideoProfile; safecall;
    function get_CameraIntrinsics: Core_ICameraIntrinsics; safecall;
    function AcquireControlSession: Perception_IPerceptionControlSession; safecall;
    function CanControlIndependentlyFrom(targetId: HSTRING): Boolean; safecall;
    function IsCorrelatedWith(targetId: HSTRING): Boolean; safecall;
    function TryGetTransformTo(targetId: HSTRING; out a_result: Numerics_Matrix4x4): Boolean; safecall;
    function TryGetDepthCorrelatedCameraIntrinsicsAsync(correlatedDepthFrameSource: Perception_IPerceptionDepthFrameSource): IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics; safecall;
    function TryGetDepthCorrelatedCoordinateMapperAsync(targetSourceId: HSTRING; correlatedDepthFrameSource: Perception_IPerceptionDepthFrameSource): IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper; safecall;
    function TrySetVideoProfileAsync(controlSession: Perception_IPerceptionControlSession; profile: Perception_IPerceptionVideoProfile): IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult; safecall;
    function OpenReader: Perception_IPerceptionColorFrameReader; safecall;
    property Active: Boolean read get_Active;
    property Available: Boolean read get_Available;
    property AvailableVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile read get_AvailableVideoProfiles;
    property CameraIntrinsics: Core_ICameraIntrinsics read get_CameraIntrinsics;
    property DeviceKind: HSTRING read get_DeviceKind;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property IsControlled: Boolean read get_IsControlled;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property SupportedVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile read get_SupportedVideoProfiles;
    property VideoProfile: Perception_IPerceptionVideoProfile read get_VideoProfile;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  }
  // Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameSourceAddedEventArgs)]
  Perception_IPerceptionColorFrameSourceAddedEventArgs = interface(IInspectable)
  ['{D16BF4E6-DA24-442C-BBD5-55549B5B94F3}']
    function get_FrameSource: Perception_IPerceptionColorFrameSource; safecall;
    property FrameSource: Perception_IPerceptionColorFrameSource read get_FrameSource;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{7202E817-22B8-5E7B-86B5-C4A90CCC23AA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs_Delegate_Base)
  ['{02EC59EC-2BF5-5C70-9C50-AB0109741792}']
    procedure Invoke(sender: Perception_IPerceptionColorFrameSourceWatcher; args: Perception_IPerceptionColorFrameSourceAddedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  }
  // Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameSourceRemovedEventArgs)]
  Perception_IPerceptionColorFrameSourceRemovedEventArgs = interface(IInspectable)
  ['{D277FA69-EB4C-42EF-BA4F-288F615C93C1}']
    function get_FrameSource: Perception_IPerceptionColorFrameSource; safecall;
    property FrameSource: Perception_IPerceptionColorFrameSource read get_FrameSource;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C7131DDD-FF22-5FB7-ADA0-961E3B28917B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs_Delegate_Base)
  ['{D1419A9F-E016-52AD-A455-0CE0B6331D05}']
    procedure Invoke(sender: Perception_IPerceptionColorFrameSourceWatcher; args: Perception_IPerceptionColorFrameSourceRemovedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{B3F5BF64-7FC0-5D8C-978C-A38D5B18A51D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable_Delegate_Base)
  ['{93F3F821-1743-5585-8985-BB155E3FCC3B}']
    procedure Invoke(sender: Perception_IPerceptionColorFrameSourceWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher,Object>
  // Used Types:  Windows.Devices.Enumeration.DeviceWatcherStatus
  }
  // Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameSourceWatcher)]
  Perception_IPerceptionColorFrameSourceWatcher = interface(IInspectable)
  ['{96BD1392-E667-40C4-89F9-1462DEA6A9CC}']
    function add_SourceAdded(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceAdded(token: EventRegistrationToken); safecall;
    function add_SourceRemoved(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__Perception_IPerceptionColorFrameSourceRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceRemoved(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__Perception_IPerceptionColorFrameSourceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function get_Status: DeviceWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: DeviceWatcherStatus read get_Status;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameSourceAddedEventArgs)]
  Perception_IPerceptionDepthFrameSourceAddedEventArgs = interface(IInspectable)
  ['{93A48168-8BF8-45D2-A2F8-4AC0931CC7A6}']
    function get_FrameSource: Perception_IPerceptionDepthFrameSource; safecall;
    property FrameSource: Perception_IPerceptionDepthFrameSource read get_FrameSource;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A3C1E25F-3574-5A27-A791-16E1BCC424F4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs_Delegate_Base)
  ['{0A03645B-8B08-5FE9-A16E-724457F2DC30}']
    procedure Invoke(sender: Perception_IPerceptionDepthFrameSourceWatcher; args: Perception_IPerceptionDepthFrameSourceAddedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameSourceRemovedEventArgs)]
  Perception_IPerceptionDepthFrameSourceRemovedEventArgs = interface(IInspectable)
  ['{A0C0CC4D-E96C-4D81-86DD-38B95E49C6DF}']
    function get_FrameSource: Perception_IPerceptionDepthFrameSource; safecall;
    property FrameSource: Perception_IPerceptionDepthFrameSource read get_FrameSource;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{5CF5FAF7-0785-5589-A621-089D900412C8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs_Delegate_Base)
  ['{87B8A5BC-2D47-5DAA-9F91-CC955B0B5312}']
    procedure Invoke(sender: Perception_IPerceptionDepthFrameSourceWatcher; args: Perception_IPerceptionDepthFrameSourceRemovedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C5EFA976-D948-50C7-8555-664190F9A968}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable_Delegate_Base)
  ['{E07F79AF-535A-5431-A2B1-2BBA6C8375A8}']
    procedure Invoke(sender: Perception_IPerceptionDepthFrameSourceWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher,Object>
  // Used Types:  Windows.Devices.Enumeration.DeviceWatcherStatus
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameSourceWatcher)]
  Perception_IPerceptionDepthFrameSourceWatcher = interface(IInspectable)
  ['{780E96D1-8D02-4D2B-ADA4-5BA624A0EB10}']
    function add_SourceAdded(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceAdded(token: EventRegistrationToken); safecall;
    function add_SourceRemoved(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__Perception_IPerceptionDepthFrameSourceRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceRemoved(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__Perception_IPerceptionDepthFrameSourceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function get_Status: DeviceWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: DeviceWatcherStatus read get_Status;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable_Delegate_Base = interface(IUnknown)
  ['{31EDABBD-D123-5E88-89D8-C80EE8F0F2CA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Object>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable_Delegate_Base)
  ['{FA316CB6-4E11-5E86-B376-D08219788D76}']
    procedure Invoke(sender: Perception_IPerceptionInfraredFrameSource; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{B6C1B828-A157-54ED-9C18-6919B9F91BE9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  // Used Types:  Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs_Delegate_Base)
  ['{2DED5365-3F12-59C5-B7D6-2755263F629F}']
    procedure Invoke(sender: Perception_IPerceptionInfraredFrameSource; args: Perception_IPerceptionFrameSourcePropertiesChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrame
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrame)]
  Perception_IPerceptionInfraredFrame = interface(IInspectable)
  ['{B0886276-849E-4C7A-8AE6-B56064532153}']
    function get_VideoFrame: IVideoFrame; safecall;
    property VideoFrame: IVideoFrame read get_VideoFrame;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrame
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameArrivedEventArgs)]
  Perception_IPerceptionInfraredFrameArrivedEventArgs = interface(IInspectable)
  ['{9F77FAC7-B4BD-4857-9D50-BE8EF075DAEF}']
    function get_RelativeTime: TimeSpan; safecall;
    function TryOpenFrame: Perception_IPerceptionInfraredFrame; safecall;
    property RelativeTime: TimeSpan read get_RelativeTime;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameReader,Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{687FEF67-8871-56FE-8E7E-1D2929CC6F42}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameReader
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameReader,Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs_Delegate_Base)
  ['{6955842D-EC7C-51BF-886D-2DE5104A1802}']
    procedure Invoke(sender: Perception_IPerceptionInfraredFrameReader; args: Perception_IPerceptionInfraredFrameArrivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameReader,Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs>
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrame
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameReader
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameReader)]
  Perception_IPerceptionInfraredFrameReader = interface(IInspectable)
  ['{7960CE18-D39B-4FC8-A04A-929734C6756C}']
    function add_FrameArrived(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameReader__Perception_IPerceptionInfraredFrameArrivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FrameArrived(token: EventRegistrationToken); safecall;
    function get_Source: Perception_IPerceptionInfraredFrameSource; safecall;
    function get_IsPaused: Boolean; safecall;
    procedure put_IsPaused(value: Boolean); safecall;
    function TryReadLatestFrame: Perception_IPerceptionInfraredFrame; safecall;
    property IsPaused: Boolean read get_IsPaused write put_IsPaused;
    property Source: Perception_IPerceptionInfraredFrameSource read get_Source;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSource,Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs>
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Object>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionVideoProfile>
  // Used Types:  Windows.Devices.Perception.IPerceptionVideoProfile
  // Used Types:  Windows.Media.Devices.Core.ICameraIntrinsics
  // Used Types:  Windows.Devices.Perception.IPerceptionControlSession
  // Used Types:  Windows.Foundation.Numerics.Matrix4x4
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult>
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameReader
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameSource
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameSource)]
  Perception_IPerceptionInfraredFrameSource = interface(IInspectable)
  ['{55B08742-1808-494E-9E30-9D2A7BE8F700}']
    function add_AvailableChanged(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AvailableChanged(token: EventRegistrationToken); safecall;
    function add_ActiveChanged(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ActiveChanged(token: EventRegistrationToken); safecall;
    function add_PropertiesChanged(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__Perception_IPerceptionFrameSourcePropertiesChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PropertiesChanged(token: EventRegistrationToken); safecall;
    function add_VideoProfileChanged(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_VideoProfileChanged(token: EventRegistrationToken); safecall;
    function add_CameraIntrinsicsChanged(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CameraIntrinsicsChanged(token: EventRegistrationToken); safecall;
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_DeviceKind: HSTRING; safecall;
    function get_Available: Boolean; safecall;
    function get_Active: Boolean; safecall;
    function get_IsControlled: Boolean; safecall;
    function get_Properties: IMapView_2__HSTRING__IInspectable; safecall;
    function get_SupportedVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile; safecall;
    function get_AvailableVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile; safecall;
    function get_VideoProfile: Perception_IPerceptionVideoProfile; safecall;
    function get_CameraIntrinsics: Core_ICameraIntrinsics; safecall;
    function AcquireControlSession: Perception_IPerceptionControlSession; safecall;
    function CanControlIndependentlyFrom(targetId: HSTRING): Boolean; safecall;
    function IsCorrelatedWith(targetId: HSTRING): Boolean; safecall;
    function TryGetTransformTo(targetId: HSTRING; out a_result: Numerics_Matrix4x4): Boolean; safecall;
    function TryGetDepthCorrelatedCameraIntrinsicsAsync(target: Perception_IPerceptionDepthFrameSource): IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCameraIntrinsics; safecall;
    function TryGetDepthCorrelatedCoordinateMapperAsync(targetId: HSTRING; depthFrameSourceToMapWith: Perception_IPerceptionDepthFrameSource): IAsyncOperation_1__Perception_IPerceptionDepthCorrelatedCoordinateMapper; safecall;
    function TrySetVideoProfileAsync(controlSession: Perception_IPerceptionControlSession; profile: Perception_IPerceptionVideoProfile): IAsyncOperation_1__Perception_IPerceptionFrameSourcePropertyChangeResult; safecall;
    function OpenReader: Perception_IPerceptionInfraredFrameReader; safecall;
    property Active: Boolean read get_Active;
    property Available: Boolean read get_Available;
    property AvailableVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile read get_AvailableVideoProfiles;
    property CameraIntrinsics: Core_ICameraIntrinsics read get_CameraIntrinsics;
    property DeviceKind: HSTRING read get_DeviceKind;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property IsControlled: Boolean read get_IsControlled;
    property Properties: IMapView_2__HSTRING__IInspectable read get_Properties;
    property SupportedVideoProfiles: IVectorView_1__Perception_IPerceptionVideoProfile read get_SupportedVideoProfiles;
    property VideoProfile: Perception_IPerceptionVideoProfile read get_VideoProfile;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameSourceAddedEventArgs)]
  Perception_IPerceptionInfraredFrameSourceAddedEventArgs = interface(IInspectable)
  ['{6D334120-95CE-4660-907A-D98035AA2B7C}']
    function get_FrameSource: Perception_IPerceptionInfraredFrameSource; safecall;
    property FrameSource: Perception_IPerceptionInfraredFrameSource read get_FrameSource;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A8180CD1-C25B-5C7F-94DD-198423BB56D5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs_Delegate_Base)
  ['{7BA29527-FB87-55B5-A002-EBA13DE7729A}']
    procedure Invoke(sender: Perception_IPerceptionInfraredFrameSourceWatcher; args: Perception_IPerceptionInfraredFrameSourceAddedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameSourceRemovedEventArgs)]
  Perception_IPerceptionInfraredFrameSourceRemovedEventArgs = interface(IInspectable)
  ['{EA1A8071-7A70-4A61-AF94-07303853F695}']
    function get_FrameSource: Perception_IPerceptionInfraredFrameSource; safecall;
    property FrameSource: Perception_IPerceptionInfraredFrameSource read get_FrameSource;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs_Delegate_Base = interface(IUnknown)
  ['{2CA3A9B7-3348-5953-8D0D-EF8D78640B23}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs = interface(TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs_Delegate_Base)
  ['{999D3B2A-33AA-5F3C-AEFC-9E3359A26E4D}']
    procedure Invoke(sender: Perception_IPerceptionInfraredFrameSourceWatcher; args: Perception_IPerceptionInfraredFrameSourceRemovedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable_Delegate_Base = interface(IUnknown)
  ['{1555A628-3DFF-5FD0-B10A-CA6ADB2440C6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Object>
  TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable = interface(TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable_Delegate_Base)
  ['{CE367948-4B55-5F92-8323-905D1C4992BD}']
    procedure Invoke(sender: Perception_IPerceptionInfraredFrameSourceWatcher; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher,Object>
  // Used Types:  Windows.Devices.Enumeration.DeviceWatcherStatus
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameSourceWatcher)]
  Perception_IPerceptionInfraredFrameSourceWatcher = interface(IInspectable)
  ['{383CFF99-D70C-444D-A8B0-720C2E66FE3B}']
    function add_SourceAdded(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceAdded(token: EventRegistrationToken); safecall;
    function add_SourceRemoved(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__Perception_IPerceptionInfraredFrameSourceRemovedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SourceRemoved(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
    function add_EnumerationCompleted(handler: TypedEventHandler_2__Perception_IPerceptionInfraredFrameSourceWatcher__IInspectable): EventRegistrationToken; safecall;
    procedure remove_EnumerationCompleted(token: EventRegistrationToken); safecall;
    function get_Status: DeviceWatcherStatus; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Status: DeviceWatcherStatus read get_Status;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionFrameSourcePropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownPerceptionFrameSourceProperties)]
  Perception_IKnownPerceptionFrameSourcePropertiesStatics = interface(IInspectable)
  ['{5DF1CCA2-01F8-4A87-B859-D5E5B7E1DE47}']
    function get_Id: HSTRING; safecall;
    function get_PhysicalDeviceIds: HSTRING; safecall;
    function get_FrameKind: HSTRING; safecall;
    function get_DeviceModelVersion: HSTRING; safecall;
    function get_EnclosureLocation: HSTRING; safecall;
    property DeviceModelVersion: HSTRING read get_DeviceModelVersion;
    property EnclosureLocation: HSTRING read get_EnclosureLocation;
    property FrameKind: HSTRING read get_FrameKind;
    property Id: HSTRING read get_Id;
    property PhysicalDeviceIds: HSTRING read get_PhysicalDeviceIds;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionFrameSourcePropertiesStatics2
  [WinRTClassNameAttribute(SPerception_KnownPerceptionFrameSourceProperties)]
  Perception_IKnownPerceptionFrameSourcePropertiesStatics2 = interface(IInspectable)
  ['{A9C86871-05DC-4A4D-8A5C-A4ECF26BBC46}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionVideoFrameSourcePropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownPerceptionVideoFrameSourceProperties)]
  Perception_IKnownPerceptionVideoFrameSourcePropertiesStatics = interface(IInspectable)
  ['{5DF1CCA2-01F8-4A87-B859-D5E5B7E1DE48}']
    function get_VideoProfile: HSTRING; safecall;
    function get_SupportedVideoProfiles: HSTRING; safecall;
    function get_AvailableVideoProfiles: HSTRING; safecall;
    function get_IsMirrored: HSTRING; safecall;
    function get_CameraIntrinsics: HSTRING; safecall;
    property AvailableVideoProfiles: HSTRING read get_AvailableVideoProfiles;
    property CameraIntrinsics: HSTRING read get_CameraIntrinsics;
    property IsMirrored: HSTRING read get_IsMirrored;
    property SupportedVideoProfiles: HSTRING read get_SupportedVideoProfiles;
    property VideoProfile: HSTRING read get_VideoProfile;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionInfraredFrameSourcePropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownPerceptionInfraredFrameSourceProperties)]
  Perception_IKnownPerceptionInfraredFrameSourcePropertiesStatics = interface(IInspectable)
  ['{5DF1CCA2-01F8-4A87-B859-D5E5B7E1DE49}']
    function get_Exposure: HSTRING; safecall;
    function get_AutoExposureEnabled: HSTRING; safecall;
    function get_ExposureCompensation: HSTRING; safecall;
    function get_ActiveIlluminationEnabled: HSTRING; safecall;
    function get_AmbientSubtractionEnabled: HSTRING; safecall;
    function get_StructureLightPatternEnabled: HSTRING; safecall;
    function get_InterleavedIlluminationEnabled: HSTRING; safecall;
    property ActiveIlluminationEnabled: HSTRING read get_ActiveIlluminationEnabled;
    property AmbientSubtractionEnabled: HSTRING read get_AmbientSubtractionEnabled;
    property AutoExposureEnabled: HSTRING read get_AutoExposureEnabled;
    property Exposure: HSTRING read get_Exposure;
    property ExposureCompensation: HSTRING read get_ExposureCompensation;
    property InterleavedIlluminationEnabled: HSTRING read get_InterleavedIlluminationEnabled;
    property StructureLightPatternEnabled: HSTRING read get_StructureLightPatternEnabled;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionDepthFrameSourcePropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownPerceptionDepthFrameSourceProperties)]
  Perception_IKnownPerceptionDepthFrameSourcePropertiesStatics = interface(IInspectable)
  ['{5DF1CCA2-01F8-4A87-B859-D5E5B7E1DE4A}']
    function get_MinDepth: HSTRING; safecall;
    function get_MaxDepth: HSTRING; safecall;
    property MaxDepth: HSTRING read get_MaxDepth;
    property MinDepth: HSTRING read get_MinDepth;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionColorFrameSourcePropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownPerceptionColorFrameSourceProperties)]
  Perception_IKnownPerceptionColorFrameSourcePropertiesStatics = interface(IInspectable)
  ['{5DF1CCA2-01F8-4A87-B859-D5E5B7E1DE4B}']
    function get_Exposure: HSTRING; safecall;
    function get_AutoExposureEnabled: HSTRING; safecall;
    function get_ExposureCompensation: HSTRING; safecall;
    property AutoExposureEnabled: HSTRING read get_AutoExposureEnabled;
    property Exposure: HSTRING read get_Exposure;
    property ExposureCompensation: HSTRING read get_ExposureCompensation;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownPerceptionVideoProfilePropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownPerceptionVideoProfileProperties)]
  Perception_IKnownPerceptionVideoProfilePropertiesStatics = interface(IInspectable)
  ['{8F08E2E7-5A76-43E3-A13A-DA3D91A9EF98}']
    function get_BitmapPixelFormat: HSTRING; safecall;
    function get_BitmapAlphaMode: HSTRING; safecall;
    function get_Width: HSTRING; safecall;
    function get_Height: HSTRING; safecall;
    function get_FrameDuration: HSTRING; safecall;
    property BitmapAlphaMode: HSTRING read get_BitmapAlphaMode;
    property BitmapPixelFormat: HSTRING read get_BitmapPixelFormat;
    property FrameDuration: HSTRING read get_FrameDuration;
    property Height: HSTRING read get_Height;
    property Width: HSTRING read get_Width;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IKnownCameraIntrinsicsPropertiesStatics
  [WinRTClassNameAttribute(SPerception_KnownCameraIntrinsicsProperties)]
  Perception_IKnownCameraIntrinsicsPropertiesStatics = interface(IInspectable)
  ['{08C03978-437A-4D97-A663-FD3195600249}']
    function get_FocalLength: HSTRING; safecall;
    function get_PrincipalPoint: HSTRING; safecall;
    function get_RadialDistortion: HSTRING; safecall;
    function get_TangentialDistortion: HSTRING; safecall;
    property FocalLength: HSTRING read get_FocalLength;
    property PrincipalPoint: HSTRING read get_PrincipalPoint;
    property RadialDistortion: HSTRING read get_RadialDistortion;
    property TangentialDistortion: HSTRING read get_TangentialDistortion;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IIterator_1__Perception_IPerceptionInfraredFrameSource_Base = interface(IInspectable)
  ['{B22B294F-A4D2-5726-A7FC-5E331432D9B4}']
  end;
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IIterator_1__Perception_IPerceptionInfraredFrameSource = interface(IIterator_1__Perception_IPerceptionInfraredFrameSource_Base)
  ['{F029E6A7-9436-5FB7-81DE-6151371FD4C1}']
    function get_Current: Perception_IPerceptionInfraredFrameSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPerception_IPerceptionInfraredFrameSource): Cardinal; safecall;
    property Current: Perception_IPerceptionInfraredFrameSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IIterable_1__Perception_IPerceptionInfraredFrameSource_Base = interface(IInspectable)
  ['{9309D0DB-338D-5ADF-8B3E-509BFDFCCEF3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IIterable_1__Perception_IPerceptionInfraredFrameSource = interface(IIterable_1__Perception_IPerceptionInfraredFrameSource_Base)
  ['{280D5700-15A8-5747-92BD-9365F362D3BC}']
    function First: IIterator_1__Perception_IPerceptionInfraredFrameSource; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IVectorView_1__Perception_IPerceptionInfraredFrameSource = interface(IInspectable)
  ['{6FE8CCAE-DF9C-55D2-BDC7-8AC2BE1DE6C4}']
    function GetAt(index: Cardinal): Perception_IPerceptionInfraredFrameSource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Perception_IPerceptionInfraredFrameSource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPerception_IPerceptionInfraredFrameSource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource_Delegate_Base = interface(IUnknown)
  ['{3AAC58A8-4454-57E5-A90B-2449C5B7DFE8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource_Delegate_Base)
  ['{86D96F37-AD63-5F5D-99B4-E318B6BD7342}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource_Base = interface(IInspectable)
  ['{B11EECAA-6F8C-5040-8D46-C3204C562582}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource = interface(IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource_Base)
  ['{404376C7-0E88-5EAF-AA88-714A7117AAC0}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource; safecall;
    function GetResults: IVectorView_1__Perception_IPerceptionInfraredFrameSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource_Delegate_Base = interface(IUnknown)
  ['{A8D4CD8E-B210-54F7-AE2B-7770E19B3E36}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource = interface(AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource_Delegate_Base)
  ['{435AC889-32ED-599B-A0B5-B87F1A8DB897}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource_Base = interface(IInspectable)
  ['{55122E42-CC65-5CCD-8F6C-84CED09DB24E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSource
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource = interface(IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource_Base)
  ['{B85C4DB7-6AC5-5EF4-B38E-A1A3A8A4706F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource; safecall;
    function GetResults: Perception_IPerceptionInfraredFrameSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionInfraredFrameSource read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus_Delegate_Base = interface(IUnknown)
  ['{62744EA4-3447-5722-AB5E-02567B4FCEEB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus = interface(AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus_Base = interface(IInspectable)
  ['{2C2F22A8-F383-5802-BA2C-0CBBCD989C9A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  // Used Types:  Windows.Devices.Perception.PerceptionFrameSourceAccessStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus = interface(IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus; safecall;
    function GetResults: Perception_PerceptionFrameSourceAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_PerceptionFrameSourceAccessStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionInfraredFrameSource>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameSourceStatics
  [WinRTClassNameAttribute(SPerception_PerceptionInfraredFrameSource)]
  Perception_IPerceptionInfraredFrameSourceStatics = interface(IInspectable)
  ['{5DF3CCA2-01F8-4A87-B859-D5E5B7E1DE47}']
    function CreateWatcher: Perception_IPerceptionInfraredFrameSourceWatcher; safecall;
    function FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource; safecall;
    function FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource; safecall;
    function RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; safecall;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IIterator_1__Perception_IPerceptionDepthFrameSource_Base = interface(IInspectable)
  ['{20CFF8C2-7844-54E5-AE4F-57E7768F9B69}']
  end;
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IIterator_1__Perception_IPerceptionDepthFrameSource = interface(IIterator_1__Perception_IPerceptionDepthFrameSource_Base)
  ['{2676CCA4-A7D4-5277-B4F4-20B3A944E2A3}']
    function get_Current: Perception_IPerceptionDepthFrameSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPerception_IPerceptionDepthFrameSource): Cardinal; safecall;
    property Current: Perception_IPerceptionDepthFrameSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IIterable_1__Perception_IPerceptionDepthFrameSource_Base = interface(IInspectable)
  ['{8A07E1E8-5A02-585B-A26E-AD79BEAA94CF}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IIterable_1__Perception_IPerceptionDepthFrameSource = interface(IIterable_1__Perception_IPerceptionDepthFrameSource_Base)
  ['{3E375908-BD00-5D8A-9183-B10D1008ECB7}']
    function First: IIterator_1__Perception_IPerceptionDepthFrameSource; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IVectorView_1__Perception_IPerceptionDepthFrameSource = interface(IInspectable)
  ['{FFF44896-404D-5542-9542-55332E49F017}']
    function GetAt(index: Cardinal): Perception_IPerceptionDepthFrameSource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Perception_IPerceptionDepthFrameSource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPerception_IPerceptionDepthFrameSource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource_Delegate_Base = interface(IUnknown)
  ['{C06E62A4-965B-5A29-9732-8AC8669B585E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource_Delegate_Base)
  ['{FFD457B7-557E-51AB-8718-7CACA9C8648B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource_Base = interface(IInspectable)
  ['{E20A534D-D406-5964-8465-E6DC75C5821D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource = interface(IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource_Base)
  ['{B8589408-3C4A-56D9-94E4-1CA17BD41785}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource; safecall;
    function GetResults: IVectorView_1__Perception_IPerceptionDepthFrameSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionDepthFrameSource read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource_Delegate_Base = interface(IUnknown)
  ['{B48CB886-3476-58D9-B76D-FDA6B3E81F54}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource = interface(AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource_Delegate_Base)
  ['{53408DCD-9E70-5AD6-B392-9540124C9060}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_IPerceptionDepthFrameSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IAsyncOperation_1__Perception_IPerceptionDepthFrameSource_Base = interface(IInspectable)
  ['{4382B038-D4B1-540B-859A-7016626BB99D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSource
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  IAsyncOperation_1__Perception_IPerceptionDepthFrameSource = interface(IAsyncOperation_1__Perception_IPerceptionDepthFrameSource_Base)
  ['{470DB5FC-1289-50F1-9593-8663B555A959}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource; safecall;
    function GetResults: Perception_IPerceptionDepthFrameSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionDepthFrameSource read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionDepthFrameSource>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameSourceStatics
  [WinRTClassNameAttribute(SPerception_PerceptionDepthFrameSource)]
  Perception_IPerceptionDepthFrameSourceStatics = interface(IInspectable)
  ['{5DF3CCA2-01F8-4A87-B859-D5E5B7E1DE48}']
    function CreateWatcher: Perception_IPerceptionDepthFrameSourceWatcher; safecall;
    function FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource; safecall;
    function FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionDepthFrameSource; safecall;
    function RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; safecall;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IIterator_1__Perception_IPerceptionColorFrameSource_Base = interface(IInspectable)
  ['{24089F00-BA6D-50D4-AC46-F288755E4181}']
  end;
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IIterator_1__Perception_IPerceptionColorFrameSource = interface(IIterator_1__Perception_IPerceptionColorFrameSource_Base)
  ['{70D78692-BE43-5D34-AEED-11E4A267CD8B}']
    function get_Current: Perception_IPerceptionColorFrameSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPerception_IPerceptionColorFrameSource): Cardinal; safecall;
    property Current: Perception_IPerceptionColorFrameSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IIterable_1__Perception_IPerceptionColorFrameSource_Base = interface(IInspectable)
  ['{DB18069E-7B5A-54C3-A627-D56F9517FDF5}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IIterable_1__Perception_IPerceptionColorFrameSource = interface(IIterable_1__Perception_IPerceptionColorFrameSource_Base)
  ['{1314C7FF-4067-520A-A26D-2D4A20C2E91D}']
    function First: IIterator_1__Perception_IPerceptionColorFrameSource; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IVectorView_1__Perception_IPerceptionColorFrameSource = interface(IInspectable)
  ['{82FDFAC9-2B68-56EA-944D-1AAD4C421424}']
    function GetAt(index: Cardinal): Perception_IPerceptionColorFrameSource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Perception_IPerceptionColorFrameSource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPerception_IPerceptionColorFrameSource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource_Delegate_Base = interface(IUnknown)
  ['{0A36A7AF-DA9E-553F-8DC5-E89D705BB40B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource_Delegate_Base)
  ['{6C418B78-7910-5A79-8E6F-59F8C052C927}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource_Base = interface(IInspectable)
  ['{33845B5F-D59E-5271-BB68-F74E9D6A538D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource = interface(IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource_Base)
  ['{C8FEE1DE-6605-53D1-9365-B000F2D94AE4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource; safecall;
    function GetResults: IVectorView_1__Perception_IPerceptionColorFrameSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Perception_IPerceptionColorFrameSource read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource_Delegate_Base = interface(IUnknown)
  ['{3B56ACC2-E275-54FB-BE08-9FDC8F1A1E10}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource = interface(AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource_Delegate_Base)
  ['{49C5610F-DECC-509F-BC35-F69472D9B11B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Perception_IPerceptionColorFrameSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IAsyncOperation_1__Perception_IPerceptionColorFrameSource_Base = interface(IInspectable)
  ['{9647FEC8-2C56-5348-86C8-A9C3A97FB944}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSource
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  IAsyncOperation_1__Perception_IPerceptionColorFrameSource = interface(IAsyncOperation_1__Perception_IPerceptionColorFrameSource_Base)
  ['{9EAEE81E-020A-5710-9610-2D3E24E7B8C1}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource; safecall;
    function GetResults: Perception_IPerceptionColorFrameSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Perception_IPerceptionColorFrameSource read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Perception.IPerceptionColorFrameSource>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.IPerceptionColorFrameSource>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Perception.PerceptionFrameSourceAccessStatus>
  }
  // Windows.Devices.Perception.IPerceptionColorFrameSourceStatics
  [WinRTClassNameAttribute(SPerception_PerceptionColorFrameSource)]
  Perception_IPerceptionColorFrameSourceStatics = interface(IInspectable)
  ['{5DF3CCA2-01F8-4A87-B859-D5E5B7E1DE49}']
    function CreateWatcher: Perception_IPerceptionColorFrameSourceWatcher; safecall;
    function FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource; safecall;
    function FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionColorFrameSource; safecall;
    function RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; safecall;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IPerceptionColorFrameSource2
  Perception_IPerceptionColorFrameSource2 = interface(IInspectable)
  ['{F88008E5-5631-45ED-AD98-8C6AA04CFB91}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IPerceptionDepthFrameSource2
  Perception_IPerceptionDepthFrameSource2 = interface(IInspectable)
  ['{E3D23D2E-6E2C-4E6D-91D9-704CD8DFF79D}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Devices.Perception.IPerceptionInfraredFrameSource2
  Perception_IPerceptionInfraredFrameSource2 = interface(IInspectable)
  ['{DCD4D798-4B0B-4300-8D85-410817FAA032}']
    function get_DeviceId: HSTRING; safecall;
    property DeviceId: HSTRING read get_DeviceId;
  end deprecated;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal_Base = interface(IInspectable)
  ['{421D4B91-B13B-5F37-AE54-B5249BD80539}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<UInt32>
  }
  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface(IIterable_1__Cardinal_Base)
  ['{421D4B91-B13B-5F37-AE54-B5249BD80539}']
    function First: IIterator_1__Cardinal; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal_Delegate_Base = interface(IUnknown)
  ['{55772F29-DA64-5C87-871C-074337A84573}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal_Delegate_Base)
  ['{55772F29-DA64-5C87-871C-074337A84573}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  IAsyncOperation_1__IVectorView_1__Cardinal_Base = interface(IInspectable)
  ['{52C56F3C-713A-5162-9E62-362CE7ED53BE}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<UInt32>>
  IAsyncOperation_1__IVectorView_1__Cardinal = interface(IAsyncOperation_1__IVectorView_1__Cardinal_Base)
  ['{52C56F3C-713A-5162-9E62-362CE7ED53BE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal; safecall;
    function GetResults: IVectorView_1__Cardinal; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Cardinal read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Radios.IRadio>
  IIterator_1__Radios_IRadio_Base = interface(IInspectable)
  ['{CF37EDE7-EAEC-5B8F-AD31-4D51ABD9DB05}']
  end;
  {
  // Used Types:  Windows.Devices.Radios.IRadio
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Radios.IRadio>
  IIterator_1__Radios_IRadio = interface(IIterator_1__Radios_IRadio_Base)
  ['{D5E281D8-3298-5D8B-847E-F8A319A96A01}']
    function get_Current: Radios_IRadio; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PRadios_IRadio): Cardinal; safecall;
    property Current: Radios_IRadio read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Radios.IRadio>
  IIterable_1__Radios_IRadio_Base = interface(IInspectable)
  ['{E82500AF-1F53-504E-B8BE-DAC4FBB69084}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Radios.IRadio>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Radios.IRadio>
  IIterable_1__Radios_IRadio = interface(IIterable_1__Radios_IRadio_Base)
  ['{BB3BA8B2-21B5-5ACC-BD30-615A27AEAB0D}']
    function First: IIterator_1__Radios_IRadio; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Radios.IRadio
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>
  IVectorView_1__Radios_IRadio = interface(IInspectable)
  ['{58A077B6-FC4B-55DB-84EC-B64EBC9E3F96}']
    function GetAt(index: Cardinal): Radios_IRadio; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Radios_IRadio; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PRadios_IRadio): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio_Delegate_Base = interface(IUnknown)
  ['{D30691E6-60A0-59C9-8965-5BBE282E8208}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio_Delegate_Base)
  ['{2F9D3C27-8C3A-5B41-B970-4CF2CCF50E55}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Radios_IRadio; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  IAsyncOperation_1__IVectorView_1__Radios_IRadio_Base = interface(IInspectable)
  ['{040B54A1-203E-58F5-943F-C1CCA86BD532}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  IAsyncOperation_1__IVectorView_1__Radios_IRadio = interface(IAsyncOperation_1__IVectorView_1__Radios_IRadio_Base)
  ['{328B0086-F58E-5363-A074-9A7497A26758}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio; safecall;
    function GetResults: IVectorView_1__Radios_IRadio; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Radios_IRadio read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Radios.IRadio>>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.IRadio>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Radios.RadioAccessStatus>
  }
  // Windows.Devices.Radios.IRadioStatics
  [WinRTClassNameAttribute(SRadios_Radio)]
  Radios_IRadioStatics = interface(IInspectable)
  ['{5FB6A12E-67CB-46AE-AAE9-65919F86EFF4}']
    function GetRadiosAsync: IAsyncOperation_1__IVectorView_1__Radios_IRadio; safecall;
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Radios_IRadio; safecall;
    function RequestAccessAsync: IAsyncOperation_1__Radios_RadioAccessStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.SerialCommunication.SerialError
  }
  // Windows.Devices.SerialCommunication.IErrorReceivedEventArgs
  [WinRTClassNameAttribute(SSerialCommunication_ErrorReceivedEventArgs)]
  SerialCommunication_IErrorReceivedEventArgs = interface(IInspectable)
  ['{FCC6BF59-1283-4D8A-BFDF-566B33DDB28F}']
    function get_Error: SerialCommunication_SerialError; safecall;
    property Error: SerialCommunication_SerialError read get_Error;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IErrorReceivedEventArgs>
  TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D92EA323-B7BF-5E02-B9FB-C61F97D080E9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.SerialCommunication.ISerialDevice
  // Used Types:  Windows.Devices.SerialCommunication.IErrorReceivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IErrorReceivedEventArgs>
  TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs = interface(TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs_Delegate_Base)
  ['{C48C3A7B-6F3E-540D-8C21-0F2B6D60C5D3}']
    procedure Invoke(sender: SerialCommunication_ISerialDevice; args: SerialCommunication_IErrorReceivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.SerialCommunication.SerialPinChange
  }
  // Windows.Devices.SerialCommunication.IPinChangedEventArgs
  [WinRTClassNameAttribute(SSerialCommunication_PinChangedEventArgs)]
  SerialCommunication_IPinChangedEventArgs = interface(IInspectable)
  ['{A2BF1DB0-FC9C-4607-93D0-FA5E8343EE22}']
    function get_PinChange: SerialCommunication_SerialPinChange; safecall;
    property PinChange: SerialCommunication_SerialPinChange read get_PinChange;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IPinChangedEventArgs>
  TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E496C3EF-5802-5AC4-AC2E-96BC23FA9447}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.SerialCommunication.ISerialDevice
  // Used Types:  Windows.Devices.SerialCommunication.IPinChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IPinChangedEventArgs>
  TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs = interface(TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs_Delegate_Base)
  ['{3BDBC63E-575B-5206-B6F6-C7ADDC5E81A3}']
    procedure Invoke(sender: SerialCommunication_ISerialDevice; args: SerialCommunication_IPinChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  UInt16
  // Used Types:  Windows.Devices.SerialCommunication.SerialHandshake
  // Used Types:  Windows.Devices.SerialCommunication.SerialParity
  // Used Types:  String
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Devices.SerialCommunication.SerialStopBitCount
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  Windows.Storage.Streams.IOutputStream
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IErrorReceivedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.SerialCommunication.ISerialDevice,Windows.Devices.SerialCommunication.IPinChangedEventArgs>
  }
  // Windows.Devices.SerialCommunication.ISerialDevice
  [WinRTClassNameAttribute(SSerialCommunication_SerialDevice)]
  SerialCommunication_ISerialDevice = interface(IInspectable)
  ['{E187CCC6-2210-414F-B65A-F5553A03372A}']
    function get_BaudRate: Cardinal; safecall;
    procedure put_BaudRate(value: Cardinal); safecall;
    function get_BreakSignalState: Boolean; safecall;
    procedure put_BreakSignalState(value: Boolean); safecall;
    function get_BytesReceived: Cardinal; safecall;
    function get_CarrierDetectState: Boolean; safecall;
    function get_ClearToSendState: Boolean; safecall;
    function get_DataBits: Word; safecall;
    procedure put_DataBits(value: Word); safecall;
    function get_DataSetReadyState: Boolean; safecall;
    function get_Handshake: SerialCommunication_SerialHandshake; safecall;
    procedure put_Handshake(value: SerialCommunication_SerialHandshake); safecall;
    function get_IsDataTerminalReadyEnabled: Boolean; safecall;
    procedure put_IsDataTerminalReadyEnabled(value: Boolean); safecall;
    function get_IsRequestToSendEnabled: Boolean; safecall;
    procedure put_IsRequestToSendEnabled(value: Boolean); safecall;
    function get_Parity: SerialCommunication_SerialParity; safecall;
    procedure put_Parity(value: SerialCommunication_SerialParity); safecall;
    function get_PortName: HSTRING; safecall;
    function get_ReadTimeout: TimeSpan; safecall;
    procedure put_ReadTimeout(value: TimeSpan); safecall;
    function get_StopBits: SerialCommunication_SerialStopBitCount; safecall;
    procedure put_StopBits(value: SerialCommunication_SerialStopBitCount); safecall;
    function get_UsbVendorId: Word; safecall;
    function get_UsbProductId: Word; safecall;
    function get_WriteTimeout: TimeSpan; safecall;
    procedure put_WriteTimeout(value: TimeSpan); safecall;
    function get_InputStream: IInputStream; safecall;
    function get_OutputStream: IOutputStream; safecall;
    function add_ErrorReceived(reportHandler: TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IErrorReceivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ErrorReceived(token: EventRegistrationToken); safecall;
    function add_PinChanged(reportHandler: TypedEventHandler_2__SerialCommunication_ISerialDevice__SerialCommunication_IPinChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PinChanged(token: EventRegistrationToken); safecall;
    property BaudRate: Cardinal read get_BaudRate write put_BaudRate;
    property BreakSignalState: Boolean read get_BreakSignalState write put_BreakSignalState;
    property BytesReceived: Cardinal read get_BytesReceived;
    property CarrierDetectState: Boolean read get_CarrierDetectState;
    property ClearToSendState: Boolean read get_ClearToSendState;
    property DataBits: Word read get_DataBits write put_DataBits;
    property DataSetReadyState: Boolean read get_DataSetReadyState;
    property Handshake: SerialCommunication_SerialHandshake read get_Handshake write put_Handshake;
    property InputStream: IInputStream read get_InputStream;
    property IsDataTerminalReadyEnabled: Boolean read get_IsDataTerminalReadyEnabled write put_IsDataTerminalReadyEnabled;
    property IsRequestToSendEnabled: Boolean read get_IsRequestToSendEnabled write put_IsRequestToSendEnabled;
    property OutputStream: IOutputStream read get_OutputStream;
    property Parity: SerialCommunication_SerialParity read get_Parity write put_Parity;
    property PortName: HSTRING read get_PortName;
    property ReadTimeout: TimeSpan read get_ReadTimeout write put_ReadTimeout;
    property StopBits: SerialCommunication_SerialStopBitCount read get_StopBits write put_StopBits;
    property UsbProductId: Word read get_UsbProductId;
    property UsbVendorId: Word read get_UsbVendorId;
    property WriteTimeout: TimeSpan read get_WriteTimeout write put_WriteTimeout;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SerialCommunication.ISerialDevice>
  AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice_Delegate_Base = interface(IUnknown)
  ['{84A34B33-06FC-5E63-8EE2-EAB4FF69ACB7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.SerialCommunication.ISerialDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SerialCommunication.ISerialDevice>
  AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice = interface(AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice_Delegate_Base)
  ['{6125F375-FD95-540B-B6CA-2A47B62927CF}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__SerialCommunication_ISerialDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SerialCommunication.ISerialDevice>
  IAsyncOperation_1__SerialCommunication_ISerialDevice_Base = interface(IInspectable)
  ['{44EF26ED-C1FF-546A-A46B-6A37DE9187FB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.SerialCommunication.ISerialDevice>
  // Used Types:  Windows.Devices.SerialCommunication.ISerialDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.SerialCommunication.ISerialDevice>
  IAsyncOperation_1__SerialCommunication_ISerialDevice = interface(IAsyncOperation_1__SerialCommunication_ISerialDevice_Base)
  ['{034769CB-9142-5F9A-833F-65D3B76FBF0F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice; safecall;
    function GetResults: SerialCommunication_ISerialDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__SerialCommunication_ISerialDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt16
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.SerialCommunication.ISerialDevice>
  }
  // Windows.Devices.SerialCommunication.ISerialDeviceStatics
  [WinRTClassNameAttribute(SSerialCommunication_SerialDevice)]
  SerialCommunication_ISerialDeviceStatics = interface(IInspectable)
  ['{058C4A70-0836-4993-AE1A-B61AE3BE056B}']
    function GetDeviceSelector: HSTRING; overload; safecall;
    function GetDeviceSelector(portName: HSTRING): HSTRING; overload; safecall;
    function GetDeviceSelectorFromUsbVidPid(vendorId: Word; productId: Word): HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__SerialCommunication_ISerialDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.UsbTransferDirection
  // Used Types:  Windows.Devices.Usb.UsbControlTransferType
  // Used Types:  Windows.Devices.Usb.UsbControlRecipient
  // Used Types:  UInt8
  }
  // Windows.Devices.Usb.IUsbControlRequestType
  [WinRTClassNameAttribute(SUsb_UsbControlRequestType)]
  Usb_IUsbControlRequestType = interface(IInspectable)
  ['{8E9465A6-D73D-46DE-94BE-AAE7F07C0F5C}']
    function get_Direction: Usb_UsbTransferDirection; safecall;
    procedure put_Direction(value: Usb_UsbTransferDirection); safecall;
    function get_ControlTransferType: Usb_UsbControlTransferType; safecall;
    procedure put_ControlTransferType(value: Usb_UsbControlTransferType); safecall;
    function get_Recipient: Usb_UsbControlRecipient; safecall;
    procedure put_Recipient(value: Usb_UsbControlRecipient); safecall;
    function get_AsByte: Byte; safecall;
    procedure put_AsByte(value: Byte); safecall;
    property AsByte: Byte read get_AsByte write put_AsByte;
    property ControlTransferType: Usb_UsbControlTransferType read get_ControlTransferType write put_ControlTransferType;
    property Direction: Usb_UsbTransferDirection read get_Direction write put_Direction;
    property Recipient: Usb_UsbControlRecipient read get_Recipient write put_Recipient;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbControlRequestType
  // Used Types:  UInt8
  // Used Types:  UInt32
  }
  // Windows.Devices.Usb.IUsbSetupPacket
  [WinRTClassNameAttribute(SUsb_UsbSetupPacket)]
  Usb_IUsbSetupPacket = interface(IInspectable)
  ['{104BA132-C78F-4C51-B654-E49D02F2CB03}']
    function get_RequestType: Usb_IUsbControlRequestType; safecall;
    procedure put_RequestType(value: Usb_IUsbControlRequestType); safecall;
    function get_Request: Byte; safecall;
    procedure put_Request(value: Byte); safecall;
    function get_Value: Cardinal; safecall;
    procedure put_Value(value: Cardinal); safecall;
    function get_Index: Cardinal; safecall;
    procedure put_Index(value: Cardinal); safecall;
    function get_Length: Cardinal; safecall;
    procedure put_Length(value: Cardinal); safecall;
    property Index: Cardinal read get_Index write put_Index;
    property Length: Cardinal read get_Length write put_Length;
    property Request: Byte read get_Request write put_Request;
    property RequestType: Usb_IUsbControlRequestType read get_RequestType write put_RequestType;
    property Value: Cardinal read get_Value write put_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbSetupPacket
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.Usb.IUsbSetupPacketFactory
  [WinRTClassNameAttribute(SUsb_UsbSetupPacket)]
  Usb_IUsbSetupPacketFactory = interface(IInspectable)
  ['{C9257D50-1B2E-4A41-A2A7-338F0CEF3C14}']
    function CreateWithEightByteBuffer(eightByteBuffer: IBuffer): Usb_IUsbSetupPacket; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  Windows.Foundation.IReference`1<UInt8>
  }
  // Windows.Devices.Usb.IUsbDeviceClass
  [WinRTClassNameAttribute(SUsb_UsbDeviceClass)]
  Usb_IUsbDeviceClass = interface(IInspectable)
  ['{051942F9-845E-47EB-B12A-38F2F617AFE7}']
    function get_ClassCode: Byte; safecall;
    procedure put_ClassCode(value: Byte); safecall;
    function get_SubclassCode: IReference_1__Byte; safecall;
    procedure put_SubclassCode(value: IReference_1__Byte); safecall;
    function get_ProtocolCode: IReference_1__Byte; safecall;
    procedure put_ProtocolCode(value: IReference_1__Byte); safecall;
    property ClassCode: Byte read get_ClassCode write put_ClassCode;
    property ProtocolCode: IReference_1__Byte read get_ProtocolCode write put_ProtocolCode;
    property SubclassCode: IReference_1__Byte read get_SubclassCode write put_SubclassCode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbDeviceClass
  }
  // Windows.Devices.Usb.IUsbDeviceClassesStatics
  [WinRTClassNameAttribute(SUsb_UsbDeviceClasses)]
  Usb_IUsbDeviceClassesStatics = interface(IInspectable)
  ['{B20B0527-C580-4599-A165-981B4FD03230}']
    function get_CdcControl: Usb_IUsbDeviceClass; safecall;
    function get_Physical: Usb_IUsbDeviceClass; safecall;
    function get_PersonalHealthcare: Usb_IUsbDeviceClass; safecall;
    function get_ActiveSync: Usb_IUsbDeviceClass; safecall;
    function get_PalmSync: Usb_IUsbDeviceClass; safecall;
    function get_DeviceFirmwareUpdate: Usb_IUsbDeviceClass; safecall;
    function get_Irda: Usb_IUsbDeviceClass; safecall;
    function get_Measurement: Usb_IUsbDeviceClass; safecall;
    function get_VendorSpecific: Usb_IUsbDeviceClass; safecall;
    property ActiveSync: Usb_IUsbDeviceClass read get_ActiveSync;
    property CdcControl: Usb_IUsbDeviceClass read get_CdcControl;
    property DeviceFirmwareUpdate: Usb_IUsbDeviceClass read get_DeviceFirmwareUpdate;
    property Irda: Usb_IUsbDeviceClass read get_Irda;
    property Measurement: Usb_IUsbDeviceClass read get_Measurement;
    property PalmSync: Usb_IUsbDeviceClass read get_PalmSync;
    property PersonalHealthcare: Usb_IUsbDeviceClass read get_PersonalHealthcare;
    property Physical: Usb_IUsbDeviceClass read get_Physical;
    property VendorSpecific: Usb_IUsbDeviceClass read get_VendorSpecific;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Devices.Usb.IUsbDeviceClasses
  [WinRTClassNameAttribute(SUsb_UsbDeviceClasses)]
  Usb_IUsbDeviceClasses = interface(IInspectable)
  ['{686F955D-9B92-4B30-9781-C22C55AC35CB}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.Usb.IUsbBulkInPipe
  }
  // Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
  [WinRTClassNameAttribute(SUsb_UsbBulkInEndpointDescriptor)]
  Usb_IUsbBulkInEndpointDescriptor = interface(IInspectable)
  ['{3C6E4846-06CF-42A9-9DC2-971C1B14B6E3}']
    function get_MaxPacketSize: Cardinal; safecall;
    function get_EndpointNumber: Byte; safecall;
    function get_Pipe: Usb_IUsbBulkInPipe; safecall;
    property EndpointNumber: Byte read get_EndpointNumber;
    property MaxPacketSize: Cardinal read get_MaxPacketSize;
    property Pipe: Usb_IUsbBulkInPipe read get_Pipe;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.Usb.UsbReadOptions
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Devices.Usb.IUsbBulkInPipe
  [WinRTClassNameAttribute(SUsb_UsbBulkInPipe)]
  Usb_IUsbBulkInPipe = interface(IInspectable)
  ['{F01D2D3B-4548-4D50-B326-D82CDABE1220}']
    function get_MaxTransferSizeBytes: Cardinal; safecall;
    function get_EndpointDescriptor: Usb_IUsbBulkInEndpointDescriptor; safecall;
    function ClearStallAsync: IAsyncAction; safecall;
    procedure put_ReadOptions(value: Usb_UsbReadOptions); safecall;
    function get_ReadOptions: Usb_UsbReadOptions; safecall;
    procedure FlushBuffer; safecall;
    function get_InputStream: IInputStream; safecall;
    property EndpointDescriptor: Usb_IUsbBulkInEndpointDescriptor read get_EndpointDescriptor;
    property InputStream: IInputStream read get_InputStream;
    property MaxTransferSizeBytes: Cardinal read get_MaxTransferSizeBytes;
    property ReadOptions: Usb_UsbReadOptions read get_ReadOptions write put_ReadOptions;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IIterator_1__Usb_IUsbBulkInPipe_Base = interface(IInspectable)
  ['{D7AF2C5B-528D-5CBB-A997-D830ADE704C7}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkInPipe
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IIterator_1__Usb_IUsbBulkInPipe = interface(IIterator_1__Usb_IUsbBulkInPipe_Base)
  ['{FF11A7AE-9846-52CE-854F-33E5E03E4847}']
    function get_Current: Usb_IUsbBulkInPipe; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbBulkInPipe): Cardinal; safecall;
    property Current: Usb_IUsbBulkInPipe read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IIterable_1__Usb_IUsbBulkInPipe_Base = interface(IInspectable)
  ['{2201A671-42D2-508D-A848-64B5447083C8}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInPipe>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IIterable_1__Usb_IUsbBulkInPipe = interface(IIterable_1__Usb_IUsbBulkInPipe_Base)
  ['{CF269E63-FE4C-5D20-B60E-A2E5870120CC}']
    function First: IIterator_1__Usb_IUsbBulkInPipe; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkInPipe
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkInPipe>
  IVectorView_1__Usb_IUsbBulkInPipe = interface(IInspectable)
  ['{07B6F572-D3C2-524D-836E-7C3D8CFA3F01}']
    function GetAt(index: Cardinal): Usb_IUsbBulkInPipe; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbBulkInPipe; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbBulkInPipe): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt8
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInPipe
  }
  // Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
  [WinRTClassNameAttribute(SUsb_UsbInterruptInEndpointDescriptor)]
  Usb_IUsbInterruptInEndpointDescriptor = interface(IInspectable)
  ['{C0528967-C911-4C3A-86B2-419C2DA89039}']
    function get_MaxPacketSize: Cardinal; safecall;
    function get_EndpointNumber: Byte; safecall;
    function get_Interval: TimeSpan; safecall;
    function get_Pipe: Usb_IUsbInterruptInPipe; safecall;
    property EndpointNumber: Byte read get_EndpointNumber;
    property Interval: TimeSpan read get_Interval;
    property MaxPacketSize: Cardinal read get_MaxPacketSize;
    property Pipe: Usb_IUsbInterruptInPipe read get_Pipe;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.Usb.IUsbInterruptInEventArgs
  [WinRTClassNameAttribute(SUsb_UsbInterruptInEventArgs)]
  Usb_IUsbInterruptInEventArgs = interface(IInspectable)
  ['{B7B04092-1418-4936-8209-299CF5605583}']
    function get_InterruptData: IBuffer; safecall;
    property InterruptData: IBuffer read get_InterruptData;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Usb.IUsbInterruptInPipe,Windows.Devices.Usb.IUsbInterruptInEventArgs>
  TypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs_Delegate_Base = interface(IUnknown)
  ['{E6DB9449-F36A-50F2-926C-2AFD85C49F01}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInPipe
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.Usb.IUsbInterruptInPipe,Windows.Devices.Usb.IUsbInterruptInEventArgs>
  TypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs = interface(TypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs_Delegate_Base)
  ['{027C1D23-73B8-5913-B4D9-BC42ACC59785}']
    procedure Invoke(sender: Usb_IUsbInterruptInPipe; args: Usb_IUsbInterruptInEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.Usb.IUsbInterruptInPipe,Windows.Devices.Usb.IUsbInterruptInEventArgs>
  }
  // Windows.Devices.Usb.IUsbInterruptInPipe
  [WinRTClassNameAttribute(SUsb_UsbInterruptInPipe)]
  Usb_IUsbInterruptInPipe = interface(IInspectable)
  ['{FA007116-84D7-48C7-8A3F-4C0B235F2EA6}']
    function get_EndpointDescriptor: Usb_IUsbInterruptInEndpointDescriptor; safecall;
    function ClearStallAsync: IAsyncAction; safecall;
    function add_DataReceived(handler: TypedEventHandler_2__Usb_IUsbInterruptInPipe__Usb_IUsbInterruptInEventArgs): EventRegistrationToken; safecall;
    procedure remove_DataReceived(token: EventRegistrationToken); safecall;
    property EndpointDescriptor: Usb_IUsbInterruptInEndpointDescriptor read get_EndpointDescriptor;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IIterator_1__Usb_IUsbInterruptInPipe_Base = interface(IInspectable)
  ['{E3A7B1C0-74F6-5292-A22A-672AA2B49985}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInPipe
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IIterator_1__Usb_IUsbInterruptInPipe = interface(IIterator_1__Usb_IUsbInterruptInPipe_Base)
  ['{23DC3AAD-64E4-5BF3-A1D2-0ECB1489E74C}']
    function get_Current: Usb_IUsbInterruptInPipe; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbInterruptInPipe): Cardinal; safecall;
    property Current: Usb_IUsbInterruptInPipe read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IIterable_1__Usb_IUsbInterruptInPipe_Base = interface(IInspectable)
  ['{39AEF336-18AA-5BE4-86D9-E332FE2632F3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IIterable_1__Usb_IUsbInterruptInPipe = interface(IIterable_1__Usb_IUsbInterruptInPipe_Base)
  ['{48DA6605-1F29-54D2-B22A-E6B9753A6C2C}']
    function First: IIterator_1__Usb_IUsbInterruptInPipe; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInPipe
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  IVectorView_1__Usb_IUsbInterruptInPipe = interface(IInspectable)
  ['{9E237120-79D7-5D18-9D14-E7F5F2AB8062}']
    function GetAt(index: Cardinal): Usb_IUsbInterruptInPipe; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbInterruptInPipe; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbInterruptInPipe): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutPipe
  }
  // Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
  [WinRTClassNameAttribute(SUsb_UsbBulkOutEndpointDescriptor)]
  Usb_IUsbBulkOutEndpointDescriptor = interface(IInspectable)
  ['{2820847A-FFEE-4F60-9BE1-956CAC3ECB65}']
    function get_MaxPacketSize: Cardinal; safecall;
    function get_EndpointNumber: Byte; safecall;
    function get_Pipe: Usb_IUsbBulkOutPipe; safecall;
    property EndpointNumber: Byte read get_EndpointNumber;
    property MaxPacketSize: Cardinal read get_MaxPacketSize;
    property Pipe: Usb_IUsbBulkOutPipe read get_Pipe;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.Usb.UsbWriteOptions
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Devices.Usb.IUsbBulkOutPipe
  [WinRTClassNameAttribute(SUsb_UsbBulkOutPipe)]
  Usb_IUsbBulkOutPipe = interface(IInspectable)
  ['{A8E9EE6E-0115-45AA-8B21-37B225BCCEE7}']
    function get_EndpointDescriptor: Usb_IUsbBulkOutEndpointDescriptor; safecall;
    function ClearStallAsync: IAsyncAction; safecall;
    procedure put_WriteOptions(value: Usb_UsbWriteOptions); safecall;
    function get_WriteOptions: Usb_UsbWriteOptions; safecall;
    function get_OutputStream: IOutputStream; safecall;
    property EndpointDescriptor: Usb_IUsbBulkOutEndpointDescriptor read get_EndpointDescriptor;
    property OutputStream: IOutputStream read get_OutputStream;
    property WriteOptions: Usb_UsbWriteOptions read get_WriteOptions write put_WriteOptions;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IIterator_1__Usb_IUsbBulkOutPipe_Base = interface(IInspectable)
  ['{46DD2F6A-573B-5C45-B168-9223038491DD}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutPipe
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IIterator_1__Usb_IUsbBulkOutPipe = interface(IIterator_1__Usb_IUsbBulkOutPipe_Base)
  ['{A4803805-794E-5501-AC0F-205BF262CCDB}']
    function get_Current: Usb_IUsbBulkOutPipe; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbBulkOutPipe): Cardinal; safecall;
    property Current: Usb_IUsbBulkOutPipe read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IIterable_1__Usb_IUsbBulkOutPipe_Base = interface(IInspectable)
  ['{9824CABA-5CA6-5C2D-80CF-1949026D7857}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IIterable_1__Usb_IUsbBulkOutPipe = interface(IIterable_1__Usb_IUsbBulkOutPipe_Base)
  ['{CAC92CBB-62C4-5C78-8A9C-D7C6B1E913B9}']
    function First: IIterator_1__Usb_IUsbBulkOutPipe; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutPipe
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  IVectorView_1__Usb_IUsbBulkOutPipe = interface(IInspectable)
  ['{A8E1014C-A104-577D-B617-85F5BCF273C5}']
    function GetAt(index: Cardinal): Usb_IUsbBulkOutPipe; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbBulkOutPipe; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbBulkOutPipe): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt8
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutPipe
  }
  // Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
  [WinRTClassNameAttribute(SUsb_UsbInterruptOutEndpointDescriptor)]
  Usb_IUsbInterruptOutEndpointDescriptor = interface(IInspectable)
  ['{CC9FED81-10CA-4533-952D-9E278341E80F}']
    function get_MaxPacketSize: Cardinal; safecall;
    function get_EndpointNumber: Byte; safecall;
    function get_Interval: TimeSpan; safecall;
    function get_Pipe: Usb_IUsbInterruptOutPipe; safecall;
    property EndpointNumber: Byte read get_EndpointNumber;
    property Interval: TimeSpan read get_Interval;
    property MaxPacketSize: Cardinal read get_MaxPacketSize;
    property Pipe: Usb_IUsbInterruptOutPipe read get_Pipe;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.Usb.UsbWriteOptions
  // Used Types:  Windows.Storage.Streams.IOutputStream
  }
  // Windows.Devices.Usb.IUsbInterruptOutPipe
  [WinRTClassNameAttribute(SUsb_UsbInterruptOutPipe)]
  Usb_IUsbInterruptOutPipe = interface(IInspectable)
  ['{E984C8A9-AAF9-49D0-B96C-F661AB4A7F95}']
    function get_EndpointDescriptor: Usb_IUsbInterruptOutEndpointDescriptor; safecall;
    function ClearStallAsync: IAsyncAction; safecall;
    procedure put_WriteOptions(value: Usb_UsbWriteOptions); safecall;
    function get_WriteOptions: Usb_UsbWriteOptions; safecall;
    function get_OutputStream: IOutputStream; safecall;
    property EndpointDescriptor: Usb_IUsbInterruptOutEndpointDescriptor read get_EndpointDescriptor;
    property OutputStream: IOutputStream read get_OutputStream;
    property WriteOptions: Usb_UsbWriteOptions read get_WriteOptions write put_WriteOptions;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IIterator_1__Usb_IUsbInterruptOutPipe_Base = interface(IInspectable)
  ['{CBD8D8A8-2286-5CBD-A6E4-962742FFD91A}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutPipe
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IIterator_1__Usb_IUsbInterruptOutPipe = interface(IIterator_1__Usb_IUsbInterruptOutPipe_Base)
  ['{FBB460C8-E572-5BE2-9873-CE4B496C3ED8}']
    function get_Current: Usb_IUsbInterruptOutPipe; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbInterruptOutPipe): Cardinal; safecall;
    property Current: Usb_IUsbInterruptOutPipe read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IIterable_1__Usb_IUsbInterruptOutPipe_Base = interface(IInspectable)
  ['{E61A011E-4ABE-53F2-83B3-ED4A949D2E3F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IIterable_1__Usb_IUsbInterruptOutPipe = interface(IIterable_1__Usb_IUsbInterruptOutPipe_Base)
  ['{29417055-7276-5B12-97F5-59565A8CD316}']
    function First: IIterator_1__Usb_IUsbInterruptOutPipe; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutPipe
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  IVectorView_1__Usb_IUsbInterruptOutPipe = interface(IInspectable)
  ['{AE2EFE6E-75DD-5DC0-B7E6-DBF87C02595D}']
    function GetAt(index: Cardinal): Usb_IUsbInterruptOutPipe; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbInterruptOutPipe; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbInterruptOutPipe): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IIterator_1__Usb_IUsbBulkInEndpointDescriptor_Base = interface(IInspectable)
  ['{EA511030-89C4-503D-8CAF-667F4230D2A9}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IIterator_1__Usb_IUsbBulkInEndpointDescriptor = interface(IIterator_1__Usb_IUsbBulkInEndpointDescriptor_Base)
  ['{1C76885D-D705-572B-9DA3-B89C1AA3790B}']
    function get_Current: Usb_IUsbBulkInEndpointDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbBulkInEndpointDescriptor): Cardinal; safecall;
    property Current: Usb_IUsbBulkInEndpointDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IIterable_1__Usb_IUsbBulkInEndpointDescriptor_Base = interface(IInspectable)
  ['{101B1FD9-F1C9-5DDA-9AD4-71176FA839B2}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IIterable_1__Usb_IUsbBulkInEndpointDescriptor = interface(IIterable_1__Usb_IUsbBulkInEndpointDescriptor_Base)
  ['{76F7A429-BF9D-54ED-AB7B-1AA37748A5AE}']
    function First: IIterator_1__Usb_IUsbBulkInEndpointDescriptor; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  IVectorView_1__Usb_IUsbBulkInEndpointDescriptor = interface(IInspectable)
  ['{C69418D9-6878-5B7A-A0C7-A6B6B7A6B5A8}']
    function GetAt(index: Cardinal): Usb_IUsbBulkInEndpointDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbBulkInEndpointDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbBulkInEndpointDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IIterator_1__Usb_IUsbInterruptInEndpointDescriptor_Base = interface(IInspectable)
  ['{6717500F-EC1C-5B12-BF33-0E3E3D244587}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IIterator_1__Usb_IUsbInterruptInEndpointDescriptor = interface(IIterator_1__Usb_IUsbInterruptInEndpointDescriptor_Base)
  ['{AA8E498E-6BEE-5E72-B0E2-29EA3C541A13}']
    function get_Current: Usb_IUsbInterruptInEndpointDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbInterruptInEndpointDescriptor): Cardinal; safecall;
    property Current: Usb_IUsbInterruptInEndpointDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IIterable_1__Usb_IUsbInterruptInEndpointDescriptor_Base = interface(IInspectable)
  ['{8A7BAC69-1F10-59C7-9837-72CFED7154A4}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IIterable_1__Usb_IUsbInterruptInEndpointDescriptor = interface(IIterable_1__Usb_IUsbInterruptInEndpointDescriptor_Base)
  ['{D1C25D57-16DC-5944-B4D0-628F8AA75848}']
    function First: IIterator_1__Usb_IUsbInterruptInEndpointDescriptor; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  IVectorView_1__Usb_IUsbInterruptInEndpointDescriptor = interface(IInspectable)
  ['{F0CEC6BF-FA60-5D88-A442-AB418F04D974}']
    function GetAt(index: Cardinal): Usb_IUsbInterruptInEndpointDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbInterruptInEndpointDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbInterruptInEndpointDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IIterator_1__Usb_IUsbBulkOutEndpointDescriptor_Base = interface(IInspectable)
  ['{A8B89AB3-883D-5361-9903-F489CC62BEA5}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IIterator_1__Usb_IUsbBulkOutEndpointDescriptor = interface(IIterator_1__Usb_IUsbBulkOutEndpointDescriptor_Base)
  ['{4E4002FC-43FF-54F3-A978-A2E14FD43802}']
    function get_Current: Usb_IUsbBulkOutEndpointDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbBulkOutEndpointDescriptor): Cardinal; safecall;
    property Current: Usb_IUsbBulkOutEndpointDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IIterable_1__Usb_IUsbBulkOutEndpointDescriptor_Base = interface(IInspectable)
  ['{B80BEB39-62B3-5F59-B3E7-882CC9C5B0C0}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IIterable_1__Usb_IUsbBulkOutEndpointDescriptor = interface(IIterable_1__Usb_IUsbBulkOutEndpointDescriptor_Base)
  ['{72271814-2599-5B39-B0B3-377BEB269986}']
    function First: IIterator_1__Usb_IUsbBulkOutEndpointDescriptor; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  IVectorView_1__Usb_IUsbBulkOutEndpointDescriptor = interface(IInspectable)
  ['{96922C96-FBD4-5EEB-83A6-B1E2BD6739BB}']
    function GetAt(index: Cardinal): Usb_IUsbBulkOutEndpointDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbBulkOutEndpointDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbBulkOutEndpointDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IIterator_1__Usb_IUsbInterruptOutEndpointDescriptor_Base = interface(IInspectable)
  ['{4B6426DB-DB32-5B51-ADAD-04532EA94ACD}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IIterator_1__Usb_IUsbInterruptOutEndpointDescriptor = interface(IIterator_1__Usb_IUsbInterruptOutEndpointDescriptor_Base)
  ['{AF2F2BDD-F286-5179-A486-62AD44812B97}']
    function get_Current: Usb_IUsbInterruptOutEndpointDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbInterruptOutEndpointDescriptor): Cardinal; safecall;
    property Current: Usb_IUsbInterruptOutEndpointDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IIterable_1__Usb_IUsbInterruptOutEndpointDescriptor_Base = interface(IInspectable)
  ['{09393D62-2316-536B-8A10-7038884AB2A7}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IIterable_1__Usb_IUsbInterruptOutEndpointDescriptor = interface(IIterable_1__Usb_IUsbInterruptOutEndpointDescriptor_Base)
  ['{CDAA8321-5DE1-5313-95EE-37A3712CB1C8}']
    function First: IIterator_1__Usb_IUsbInterruptOutEndpointDescriptor; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  IVectorView_1__Usb_IUsbInterruptOutEndpointDescriptor = interface(IInspectable)
  ['{02341969-0617-5C88-957D-BEFF461E3278}']
    function GetAt(index: Cardinal): Usb_IUsbInterruptOutEndpointDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbInterruptOutEndpointDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbInterruptOutEndpointDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Devices.Usb.IUsbInterfaceDescriptor
  [WinRTClassNameAttribute(SUsb_UsbInterfaceDescriptor)]
  Usb_IUsbInterfaceDescriptor = interface(IInspectable)
  ['{199670C7-B7EE-4F90-8CD5-94A2E257598A}']
    function get_ClassCode: Byte; safecall;
    function get_SubclassCode: Byte; safecall;
    function get_ProtocolCode: Byte; safecall;
    function get_AlternateSettingNumber: Byte; safecall;
    function get_InterfaceNumber: Byte; safecall;
    property AlternateSettingNumber: Byte read get_AlternateSettingNumber;
    property ClassCode: Byte read get_ClassCode;
    property InterfaceNumber: Byte read get_InterfaceNumber;
    property ProtocolCode: Byte read get_ProtocolCode;
    property SubclassCode: Byte read get_SubclassCode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.Usb.IUsbDescriptor
  [WinRTClassNameAttribute(SUsb_UsbDescriptor)]
  Usb_IUsbDescriptor = interface(IInspectable)
  ['{0A89F216-5F9D-4874-8904-DA9AD3F5528F}']
    function get_Length: Byte; safecall;
    function get_DescriptorType: Byte; safecall;
    procedure ReadDescriptorBuffer(buffer: IBuffer); safecall;
    property DescriptorType: Byte read get_DescriptorType;
    property Length: Byte read get_Length;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbDescriptor>
  IIterator_1__Usb_IUsbDescriptor_Base = interface(IInspectable)
  ['{521598ED-0167-528E-990D-52ABB712F072}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbDescriptor
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbDescriptor>
  IIterator_1__Usb_IUsbDescriptor = interface(IIterator_1__Usb_IUsbDescriptor_Base)
  ['{441F8E8D-4491-5F9A-AF52-5B2312056F5F}']
    function get_Current: Usb_IUsbDescriptor; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbDescriptor): Cardinal; safecall;
    property Current: Usb_IUsbDescriptor read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbDescriptor>
  IIterable_1__Usb_IUsbDescriptor_Base = interface(IInspectable)
  ['{989909A5-5A03-51FB-BD94-84DA7BDA8819}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbDescriptor>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbDescriptor>
  IIterable_1__Usb_IUsbDescriptor = interface(IIterable_1__Usb_IUsbDescriptor_Base)
  ['{B45C805B-D61A-5D33-AA47-5347D2BE5455}']
    function First: IIterator_1__Usb_IUsbDescriptor; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbDescriptor
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbDescriptor>
  IVectorView_1__Usb_IUsbDescriptor = interface(IInspectable)
  ['{02B8F396-E5FD-5862-8C3D-552DD08C089B}']
    function GetAt(index: Cardinal): Usb_IUsbDescriptor; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbDescriptor; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbDescriptor): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkInEndpointDescriptor>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor>
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.Usb.IUsbInterfaceDescriptor
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbDescriptor>
  }
  // Windows.Devices.Usb.IUsbInterfaceSetting
  [WinRTClassNameAttribute(SUsb_UsbInterfaceSetting)]
  Usb_IUsbInterfaceSetting = interface(IInspectable)
  ['{1827BBA7-8DA7-4AF7-8F4C-7F3032E781F5}']
    function get_BulkInEndpoints: IVectorView_1__Usb_IUsbBulkInEndpointDescriptor; safecall;
    function get_InterruptInEndpoints: IVectorView_1__Usb_IUsbInterruptInEndpointDescriptor; safecall;
    function get_BulkOutEndpoints: IVectorView_1__Usb_IUsbBulkOutEndpointDescriptor; safecall;
    function get_InterruptOutEndpoints: IVectorView_1__Usb_IUsbInterruptOutEndpointDescriptor; safecall;
    function get_Selected: Boolean; safecall;
    function SelectSettingAsync: IAsyncAction; safecall;
    function get_InterfaceDescriptor: Usb_IUsbInterfaceDescriptor; safecall;
    function get_Descriptors: IVectorView_1__Usb_IUsbDescriptor; safecall;
    property BulkInEndpoints: IVectorView_1__Usb_IUsbBulkInEndpointDescriptor read get_BulkInEndpoints;
    property BulkOutEndpoints: IVectorView_1__Usb_IUsbBulkOutEndpointDescriptor read get_BulkOutEndpoints;
    property Descriptors: IVectorView_1__Usb_IUsbDescriptor read get_Descriptors;
    property InterfaceDescriptor: Usb_IUsbInterfaceDescriptor read get_InterfaceDescriptor;
    property InterruptInEndpoints: IVectorView_1__Usb_IUsbInterruptInEndpointDescriptor read get_InterruptInEndpoints;
    property InterruptOutEndpoints: IVectorView_1__Usb_IUsbInterruptOutEndpointDescriptor read get_InterruptOutEndpoints;
    property Selected: Boolean read get_Selected;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IIterator_1__Usb_IUsbInterfaceSetting_Base = interface(IInspectable)
  ['{71267EC7-5697-5DEA-B2F8-14CF698EC0AD}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterfaceSetting
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IIterator_1__Usb_IUsbInterfaceSetting = interface(IIterator_1__Usb_IUsbInterfaceSetting_Base)
  ['{77C63F31-727A-546E-9548-2CB07171D4C1}']
    function get_Current: Usb_IUsbInterfaceSetting; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbInterfaceSetting): Cardinal; safecall;
    property Current: Usb_IUsbInterfaceSetting read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IIterable_1__Usb_IUsbInterfaceSetting_Base = interface(IInspectable)
  ['{1AAF5739-9C2C-533E-A0E9-D53FDB45D15D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IIterable_1__Usb_IUsbInterfaceSetting = interface(IIterable_1__Usb_IUsbInterfaceSetting_Base)
  ['{E6FD0DB5-7054-5E28-B0C9-45C1D0404F9B}']
    function First: IIterator_1__Usb_IUsbInterfaceSetting; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterfaceSetting
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  IVectorView_1__Usb_IUsbInterfaceSetting = interface(IInspectable)
  ['{9F7E471F-AA3B-5F83-A82D-A51187D16707}']
    function GetAt(index: Cardinal): Usb_IUsbInterfaceSetting; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbInterfaceSetting; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbInterfaceSetting): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkInPipe>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptInPipe>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbBulkOutPipe>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterruptOutPipe>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterfaceSetting>
  // Used Types:  UInt8
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbDescriptor>
  }
  // Windows.Devices.Usb.IUsbInterface
  [WinRTClassNameAttribute(SUsb_UsbInterface)]
  Usb_IUsbInterface = interface(IInspectable)
  ['{A0322B95-7F47-48AB-A727-678C25BE2112}']
    function get_BulkInPipes: IVectorView_1__Usb_IUsbBulkInPipe; safecall;
    function get_InterruptInPipes: IVectorView_1__Usb_IUsbInterruptInPipe; safecall;
    function get_BulkOutPipes: IVectorView_1__Usb_IUsbBulkOutPipe; safecall;
    function get_InterruptOutPipes: IVectorView_1__Usb_IUsbInterruptOutPipe; safecall;
    function get_InterfaceSettings: IVectorView_1__Usb_IUsbInterfaceSetting; safecall;
    function get_InterfaceNumber: Byte; safecall;
    function get_Descriptors: IVectorView_1__Usb_IUsbDescriptor; safecall;
    property BulkInPipes: IVectorView_1__Usb_IUsbBulkInPipe read get_BulkInPipes;
    property BulkOutPipes: IVectorView_1__Usb_IUsbBulkOutPipe read get_BulkOutPipes;
    property Descriptors: IVectorView_1__Usb_IUsbDescriptor read get_Descriptors;
    property InterfaceNumber: Byte read get_InterfaceNumber;
    property InterfaceSettings: IVectorView_1__Usb_IUsbInterfaceSetting read get_InterfaceSettings;
    property InterruptInPipes: IVectorView_1__Usb_IUsbInterruptInPipe read get_InterruptInPipes;
    property InterruptOutPipes: IVectorView_1__Usb_IUsbInterruptOutPipe read get_InterruptOutPipes;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  UInt8
  }
  // Windows.Devices.Usb.IUsbDeviceDescriptor
  [WinRTClassNameAttribute(SUsb_UsbDeviceDescriptor)]
  Usb_IUsbDeviceDescriptor = interface(IInspectable)
  ['{1F48D1F6-BA97-4322-B92C-B5B189216588}']
    function get_BcdUsb: Cardinal; safecall;
    function get_MaxPacketSize0: Byte; safecall;
    function get_VendorId: Cardinal; safecall;
    function get_ProductId: Cardinal; safecall;
    function get_BcdDeviceRevision: Cardinal; safecall;
    function get_NumberOfConfigurations: Byte; safecall;
    property BcdDeviceRevision: Cardinal read get_BcdDeviceRevision;
    property BcdUsb: Cardinal read get_BcdUsb;
    property MaxPacketSize0: Byte read get_MaxPacketSize0;
    property NumberOfConfigurations: Byte read get_NumberOfConfigurations;
    property ProductId: Cardinal read get_ProductId;
    property VendorId: Cardinal read get_VendorId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterface>
  IIterator_1__Usb_IUsbInterface_Base = interface(IInspectable)
  ['{216B5A5F-63E3-5A9B-9C99-B09CBC0FF3B1}']
  end;
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterface
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterface>
  IIterator_1__Usb_IUsbInterface = interface(IIterator_1__Usb_IUsbInterface_Base)
  ['{349042AE-BB47-5B12-B7F7-83023F903427}']
    function get_Current: Usb_IUsbInterface; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PUsb_IUsbInterface): Cardinal; safecall;
    property Current: Usb_IUsbInterface read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterface>
  IIterable_1__Usb_IUsbInterface_Base = interface(IInspectable)
  ['{F54037ED-92E9-590D-B904-3AD7BFA9A621}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Usb.IUsbInterface>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Usb.IUsbInterface>
  IIterable_1__Usb_IUsbInterface = interface(IIterable_1__Usb_IUsbInterface_Base)
  ['{965A7DCE-99E2-5B0E-B4F3-69EFD29CBF25}']
    function First: IIterator_1__Usb_IUsbInterface; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Usb.IUsbInterface
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterface>
  IVectorView_1__Usb_IUsbInterface = interface(IInspectable)
  ['{CF4B10AB-3239-583A-8B72-82ECC4DB8AF3}']
    function GetAt(index: Cardinal): Usb_IUsbInterface; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Usb_IUsbInterface; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PUsb_IUsbInterface): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Devices.Usb.IUsbConfigurationDescriptor
  [WinRTClassNameAttribute(SUsb_UsbConfigurationDescriptor)]
  Usb_IUsbConfigurationDescriptor = interface(IInspectable)
  ['{F2176D92-B442-407A-8207-7D646C0385F3}']
    function get_ConfigurationValue: Byte; safecall;
    function get_MaxPowerMilliamps: Cardinal; safecall;
    function get_SelfPowered: Boolean; safecall;
    function get_RemoteWakeup: Boolean; safecall;
    property ConfigurationValue: Byte read get_ConfigurationValue;
    property MaxPowerMilliamps: Cardinal read get_MaxPowerMilliamps;
    property RemoteWakeup: Boolean read get_RemoteWakeup;
    property SelfPowered: Boolean read get_SelfPowered;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbInterface>
  // Used Types:  Windows.Devices.Usb.IUsbConfigurationDescriptor
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Usb.IUsbDescriptor>
  }
  // Windows.Devices.Usb.IUsbConfiguration
  [WinRTClassNameAttribute(SUsb_UsbConfiguration)]
  Usb_IUsbConfiguration = interface(IInspectable)
  ['{68177429-36A9-46D7-B873-FC689251EC30}']
    function get_UsbInterfaces: IVectorView_1__Usb_IUsbInterface; safecall;
    function get_ConfigurationDescriptor: Usb_IUsbConfigurationDescriptor; safecall;
    function get_Descriptors: IVectorView_1__Usb_IUsbDescriptor; safecall;
    property ConfigurationDescriptor: Usb_IUsbConfigurationDescriptor read get_ConfigurationDescriptor;
    property Descriptors: IVectorView_1__Usb_IUsbDescriptor read get_Descriptors;
    property UsbInterfaces: IVectorView_1__Usb_IUsbInterface read get_UsbInterfaces;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<UInt32>
  // Used Types:  Windows.Devices.Usb.IUsbSetupPacket
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IBuffer>
  // Used Types:  Windows.Devices.Usb.IUsbInterface
  // Used Types:  Windows.Devices.Usb.IUsbDeviceDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbConfiguration
  }
  // Windows.Devices.Usb.IUsbDevice
  [WinRTClassNameAttribute(SUsb_UsbDevice)]
  Usb_IUsbDevice = interface(IInspectable)
  ['{5249B992-C456-44D5-AD5E-24F5A089F63B}']
    function SendControlOutTransferAsync(setupPacket: Usb_IUsbSetupPacket; buffer: IBuffer): IAsyncOperation_1__Cardinal; overload; safecall;
    function SendControlOutTransferAsync(setupPacket: Usb_IUsbSetupPacket): IAsyncOperation_1__Cardinal; overload; safecall;
    function SendControlInTransferAsync(setupPacket: Usb_IUsbSetupPacket; buffer: IBuffer): IAsyncOperation_1__IBuffer; overload; safecall;
    function SendControlInTransferAsync(setupPacket: Usb_IUsbSetupPacket): IAsyncOperation_1__IBuffer; overload; safecall;
    function get_DefaultInterface: Usb_IUsbInterface; safecall;
    function get_DeviceDescriptor: Usb_IUsbDeviceDescriptor; safecall;
    function get_Configuration: Usb_IUsbConfiguration; safecall;
    property Configuration: Usb_IUsbConfiguration read get_Configuration;
    property DefaultInterface: Usb_IUsbInterface read get_DefaultInterface;
    property DeviceDescriptor: Usb_IUsbDeviceDescriptor read get_DeviceDescriptor;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Usb.IUsbDevice>
  AsyncOperationCompletedHandler_1__Usb_IUsbDevice_Delegate_Base = interface(IUnknown)
  ['{7331254F-6CAF-587D-9C2A-018C66D312DB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Usb.IUsbDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Usb.IUsbDevice>
  AsyncOperationCompletedHandler_1__Usb_IUsbDevice = interface(AsyncOperationCompletedHandler_1__Usb_IUsbDevice_Delegate_Base)
  ['{4051BE31-92C0-5AB0-94A3-BF0BA6F5BE0D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Usb_IUsbDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Usb.IUsbDevice>
  IAsyncOperation_1__Usb_IUsbDevice_Base = interface(IInspectable)
  ['{2138C5ED-B71A-5166-9948-D55792748F5C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.Usb.IUsbDevice>
  // Used Types:  Windows.Devices.Usb.IUsbDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.Usb.IUsbDevice>
  IAsyncOperation_1__Usb_IUsbDevice = interface(IAsyncOperation_1__Usb_IUsbDevice_Base)
  ['{6A6D5FA8-38B7-5229-B898-D18D7E7FA549}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Usb_IUsbDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Usb_IUsbDevice; safecall;
    function GetResults: Usb_IUsbDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Usb_IUsbDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Guid
  // Used Types:  Windows.Devices.Usb.IUsbDeviceClass
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.Usb.IUsbDevice>
  }
  // Windows.Devices.Usb.IUsbDeviceStatics
  [WinRTClassNameAttribute(SUsb_UsbDevice)]
  Usb_IUsbDeviceStatics = interface(IInspectable)
  ['{066B85A2-09B7-4446-8502-6FE6DCAA7309}']
    function GetDeviceSelector(vendorId: Cardinal; productId: Cardinal; winUsbInterfaceClass: TGuid): HSTRING; overload; safecall;
    function GetDeviceSelector(winUsbInterfaceClass: TGuid): HSTRING; overload; safecall;
    function GetDeviceSelector(vendorId: Cardinal; productId: Cardinal): HSTRING; overload; safecall;
    function GetDeviceClassSelector(usbClass: Usb_IUsbDeviceClass): HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Usb_IUsbDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Usb.IUsbDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbConfigurationDescriptor
  }
  // Windows.Devices.Usb.IUsbConfigurationDescriptorStatics
  [WinRTClassNameAttribute(SUsb_UsbConfigurationDescriptor)]
  Usb_IUsbConfigurationDescriptorStatics = interface(IInspectable)
  ['{424CED93-E740-40A1-92BD-DA120EA04914}']
    function TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbConfigurationDescriptor): Boolean; safecall;
    function Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbConfigurationDescriptor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Usb.IUsbDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbInterfaceDescriptor
  }
  // Windows.Devices.Usb.IUsbInterfaceDescriptorStatics
  [WinRTClassNameAttribute(SUsb_UsbInterfaceDescriptor)]
  Usb_IUsbInterfaceDescriptorStatics = interface(IInspectable)
  ['{E34A9FF5-77D6-48B6-B0BE-16C6422316FE}']
    function TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbInterfaceDescriptor): Boolean; safecall;
    function Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbInterfaceDescriptor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.Usb.UsbTransferDirection
  // Used Types:  Windows.Devices.Usb.UsbEndpointType
  // Used Types:  Windows.Devices.Usb.IUsbBulkInEndpointDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor
  }
  // Windows.Devices.Usb.IUsbEndpointDescriptor
  [WinRTClassNameAttribute(SUsb_UsbEndpointDescriptor)]
  Usb_IUsbEndpointDescriptor = interface(IInspectable)
  ['{6B4862D9-8DF7-4B40-AC83-578F139F0575}']
    function get_EndpointNumber: Byte; safecall;
    function get_Direction: Usb_UsbTransferDirection; safecall;
    function get_EndpointType: Usb_UsbEndpointType; safecall;
    function get_AsBulkInEndpointDescriptor: Usb_IUsbBulkInEndpointDescriptor; safecall;
    function get_AsInterruptInEndpointDescriptor: Usb_IUsbInterruptInEndpointDescriptor; safecall;
    function get_AsBulkOutEndpointDescriptor: Usb_IUsbBulkOutEndpointDescriptor; safecall;
    function get_AsInterruptOutEndpointDescriptor: Usb_IUsbInterruptOutEndpointDescriptor; safecall;
    property AsBulkInEndpointDescriptor: Usb_IUsbBulkInEndpointDescriptor read get_AsBulkInEndpointDescriptor;
    property AsBulkOutEndpointDescriptor: Usb_IUsbBulkOutEndpointDescriptor read get_AsBulkOutEndpointDescriptor;
    property AsInterruptInEndpointDescriptor: Usb_IUsbInterruptInEndpointDescriptor read get_AsInterruptInEndpointDescriptor;
    property AsInterruptOutEndpointDescriptor: Usb_IUsbInterruptOutEndpointDescriptor read get_AsInterruptOutEndpointDescriptor;
    property Direction: Usb_UsbTransferDirection read get_Direction;
    property EndpointNumber: Byte read get_EndpointNumber;
    property EndpointType: Usb_UsbEndpointType read get_EndpointType;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.Usb.IUsbDescriptor
  // Used Types:  Windows.Devices.Usb.IUsbEndpointDescriptor
  }
  // Windows.Devices.Usb.IUsbEndpointDescriptorStatics
  [WinRTClassNameAttribute(SUsb_UsbEndpointDescriptor)]
  Usb_IUsbEndpointDescriptorStatics = interface(IInspectable)
  ['{C890B201-9A6A-495E-A82C-295B9E708106}']
    function TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbEndpointDescriptor): Boolean; safecall;
    function Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbEndpointDescriptor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  String
  // Used Types:  Int32
  // Used Types:  Double
  // Used Types:  UInt8
  // Used Types:  Windows.Devices.WiFi.WiFiNetworkKind
  // Used Types:  Windows.Devices.WiFi.WiFiPhyKind
  // Used Types:  Windows.Networking.Connectivity.INetworkSecuritySettings
  // Used Types:  Boolean
  }
  // Windows.Devices.WiFi.IWiFiAvailableNetwork
  [WinRTClassNameAttribute(SWiFi_WiFiAvailableNetwork)]
  WiFi_IWiFiAvailableNetwork = interface(IInspectable)
  ['{26E96246-183E-4704-9826-71B4A2F0F668}']
    function get_Uptime: TimeSpan; safecall;
    function get_Ssid: HSTRING; safecall;
    function get_Bssid: HSTRING; safecall;
    function get_ChannelCenterFrequencyInKilohertz: Integer; safecall;
    function get_NetworkRssiInDecibelMilliwatts: Double; safecall;
    function get_SignalBars: Byte; safecall;
    function get_NetworkKind: WiFi_WiFiNetworkKind; safecall;
    function get_PhyKind: WiFi_WiFiPhyKind; safecall;
    function get_SecuritySettings: INetworkSecuritySettings; safecall;
    function get_BeaconInterval: TimeSpan; safecall;
    function get_IsWiFiDirect: Boolean; safecall;
    property BeaconInterval: TimeSpan read get_BeaconInterval;
    property Bssid: HSTRING read get_Bssid;
    property ChannelCenterFrequencyInKilohertz: Integer read get_ChannelCenterFrequencyInKilohertz;
    property IsWiFiDirect: Boolean read get_IsWiFiDirect;
    property NetworkKind: WiFi_WiFiNetworkKind read get_NetworkKind;
    property NetworkRssiInDecibelMilliwatts: Double read get_NetworkRssiInDecibelMilliwatts;
    property PhyKind: WiFi_WiFiPhyKind read get_PhyKind;
    property SecuritySettings: INetworkSecuritySettings read get_SecuritySettings;
    property SignalBars: Byte read get_SignalBars;
    property Ssid: HSTRING read get_Ssid;
    property Uptime: TimeSpan read get_Uptime;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IIterator_1__WiFi_IWiFiAvailableNetwork_Base = interface(IInspectable)
  ['{468677C4-EBB9-5196-836D-72FAA9FE673E}']
  end;
  {
  // Used Types:  Windows.Devices.WiFi.IWiFiAvailableNetwork
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IIterator_1__WiFi_IWiFiAvailableNetwork = interface(IIterator_1__WiFi_IWiFiAvailableNetwork_Base)
  ['{5C7025C6-7C52-590B-AC35-8D3341B50843}']
    function get_Current: WiFi_IWiFiAvailableNetwork; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWiFi_IWiFiAvailableNetwork): Cardinal; safecall;
    property Current: WiFi_IWiFiAvailableNetwork read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IIterable_1__WiFi_IWiFiAvailableNetwork_Base = interface(IInspectable)
  ['{F17484EA-C71E-5D3E-B74C-3A0E61DD9C20}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IIterable_1__WiFi_IWiFiAvailableNetwork = interface(IIterable_1__WiFi_IWiFiAvailableNetwork_Base)
  ['{26875CAE-2345-514C-B1B7-C80FA95C85F7}']
    function First: IIterator_1__WiFi_IWiFiAvailableNetwork; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFi.IWiFiAvailableNetwork
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  IVectorView_1__WiFi_IWiFiAvailableNetwork = interface(IInspectable)
  ['{9DDD5C88-94EF-5125-8BC1-B324F35BCF9E}']
    function GetAt(index: Cardinal): WiFi_IWiFiAvailableNetwork; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WiFi_IWiFiAvailableNetwork; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFi_IWiFiAvailableNetwork): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAvailableNetwork>
  }
  // Windows.Devices.WiFi.IWiFiNetworkReport
  [WinRTClassNameAttribute(SWiFi_WiFiNetworkReport)]
  WiFi_IWiFiNetworkReport = interface(IInspectable)
  ['{9524DED2-5911-445E-8194-BE4F1A704895}']
    function get_Timestamp: DateTime; safecall;
    function get_AvailableNetworks: IVectorView_1__WiFi_IWiFiAvailableNetwork; safecall;
    property AvailableNetworks: IVectorView_1__WiFi_IWiFiAvailableNetwork read get_AvailableNetworks;
    property Timestamp: DateTime read get_Timestamp;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFi.IWiFiAdapter,Object>
  TypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F6C02D1B-43E8-5FC8-8E8E-EE7B8094B683}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFi.IWiFiAdapter
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFi.IWiFiAdapter,Object>
  TypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable = interface(TypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable_Delegate_Base)
  ['{D2C5A4EF-84BA-5A70-A3BE-561BEF919F07}']
    procedure Invoke(sender: WiFi_IWiFiAdapter; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFi.WiFiConnectionStatus
  }
  // Windows.Devices.WiFi.IWiFiConnectionResult
  [WinRTClassNameAttribute(SWiFi_WiFiConnectionResult)]
  WiFi_IWiFiConnectionResult = interface(IInspectable)
  ['{143BDFD9-C37D-40BE-A5C8-857BCE85A931}']
    function get_ConnectionStatus: WiFi_WiFiConnectionStatus; safecall;
    property ConnectionStatus: WiFi_WiFiConnectionStatus read get_ConnectionStatus;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult_Delegate_Base = interface(IUnknown)
  ['{F380EB8D-1E52-5350-A288-861C963A84F0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult = interface(AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult_Delegate_Base)
  ['{EA9EB85D-7049-5100-9504-522FA021204C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFi_IWiFiConnectionResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  IAsyncOperation_1__WiFi_IWiFiConnectionResult_Base = interface(IInspectable)
  ['{FFA41F49-4C30-50D3-9549-E4F055B417B4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  // Used Types:  Windows.Devices.WiFi.IWiFiConnectionResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  IAsyncOperation_1__WiFi_IWiFiConnectionResult = interface(IAsyncOperation_1__WiFi_IWiFiConnectionResult_Base)
  ['{80D79BEC-239B-52A3-8195-F0C7AF863A65}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult; safecall;
    function GetResults: WiFi_IWiFiConnectionResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFi_IWiFiConnectionResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Networking.Connectivity.INetworkAdapter
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Devices.WiFi.IWiFiNetworkReport
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFi.IWiFiAdapter,Object>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  // Used Types:  Windows.Devices.WiFi.IWiFiAvailableNetwork
  // Used Types:  Windows.Devices.WiFi.WiFiReconnectionKind
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  // Used Types:  String
  }
  // Windows.Devices.WiFi.IWiFiAdapter
  [WinRTClassNameAttribute(SWiFi_WiFiAdapter)]
  WiFi_IWiFiAdapter = interface(IInspectable)
  ['{A6C4E423-3D75-43A4-B9DE-11E26B72D9B0}']
    function get_NetworkAdapter: INetworkAdapter; safecall;
    function ScanAsync: IAsyncAction; safecall;
    function get_NetworkReport: WiFi_IWiFiNetworkReport; safecall;
    function add_AvailableNetworksChanged(args: TypedEventHandler_2__WiFi_IWiFiAdapter__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AvailableNetworksChanged(eventCookie: EventRegistrationToken); safecall;
    function ConnectAsync(availableNetwork: WiFi_IWiFiAvailableNetwork; reconnectionKind: WiFi_WiFiReconnectionKind): IAsyncOperation_1__WiFi_IWiFiConnectionResult; overload; safecall;
    function ConnectAsync(availableNetwork: WiFi_IWiFiAvailableNetwork; reconnectionKind: WiFi_WiFiReconnectionKind; passwordCredential: IPasswordCredential): IAsyncOperation_1__WiFi_IWiFiConnectionResult; overload; safecall;
    function ConnectAsync(availableNetwork: WiFi_IWiFiAvailableNetwork; reconnectionKind: WiFi_WiFiReconnectionKind; passwordCredential: IPasswordCredential; ssid: HSTRING): IAsyncOperation_1__WiFi_IWiFiConnectionResult; overload; safecall;
    procedure Disconnect; safecall;
    property NetworkAdapter: INetworkAdapter read get_NetworkAdapter;
    property NetworkReport: WiFi_IWiFiNetworkReport read get_NetworkReport;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAdapter>
  IIterator_1__WiFi_IWiFiAdapter_Base = interface(IInspectable)
  ['{144136C6-B502-5A52-90FC-22A09318F932}']
  end;
  {
  // Used Types:  Windows.Devices.WiFi.IWiFiAdapter
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAdapter>
  IIterator_1__WiFi_IWiFiAdapter = interface(IIterator_1__WiFi_IWiFiAdapter_Base)
  ['{8A41512C-A8D4-5B3D-BE76-284F67B84E22}']
    function get_Current: WiFi_IWiFiAdapter; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWiFi_IWiFiAdapter): Cardinal; safecall;
    property Current: WiFi_IWiFiAdapter read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.IWiFiAdapter>
  IIterable_1__WiFi_IWiFiAdapter_Base = interface(IInspectable)
  ['{E0BC76C4-8D0C-53FC-BCD4-228F47210ACE}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.IWiFiAdapter>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.IWiFiAdapter>
  IIterable_1__WiFi_IWiFiAdapter = interface(IIterable_1__WiFi_IWiFiAdapter_Base)
  ['{121D4006-1642-5324-AA30-358210021E4D}']
    function First: IIterator_1__WiFi_IWiFiAdapter; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFi.IWiFiAdapter
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>
  IVectorView_1__WiFi_IWiFiAdapter = interface(IInspectable)
  ['{E9CDED59-810B-5D57-98DA-A23C1FCE0032}']
    function GetAt(index: Cardinal): WiFi_IWiFiAdapter; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WiFi_IWiFiAdapter; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFi_IWiFiAdapter): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter_Delegate_Base = interface(IUnknown)
  ['{92902A07-2F18-56E9-87FB-24FE19F70688}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter = interface(AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter_Delegate_Base)
  ['{85EE788F-21F8-5ABD-AFA8-67C4B6E0CD7F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter_Base = interface(IInspectable)
  ['{3140802B-987C-5C56-A430-90FBC1898DDA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter = interface(IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter_Base)
  ['{E2B44CDA-C8FF-5A89-B32A-DEBC74BBEB76}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter; safecall;
    function GetResults: IVectorView_1__WiFi_IWiFiAdapter; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__WiFi_IWiFiAdapter read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiAdapter>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter_Delegate_Base = interface(IUnknown)
  ['{35362F75-6AAE-560D-B3D0-3FAE9C7260A8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiAdapter>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiAdapter>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter = interface(AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter_Delegate_Base)
  ['{EC6050BD-8CC5-52AC-9039-887654EC6AD1}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFi_IWiFiAdapter; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiAdapter>
  IAsyncOperation_1__WiFi_IWiFiAdapter_Base = interface(IInspectable)
  ['{1DCF739D-10B7-59E9-AB47-8B0277E20193}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiAdapter>
  // Used Types:  Windows.Devices.WiFi.IWiFiAdapter
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiAdapter>
  IAsyncOperation_1__WiFi_IWiFiAdapter = interface(IAsyncOperation_1__WiFi_IWiFiAdapter_Base)
  ['{9A20C0A0-A7F6-5E2B-AD11-644EFC719BA4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter; safecall;
    function GetResults: WiFi_IWiFiAdapter; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFi_IWiFiAdapter read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.WiFiAccessStatus>
  AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus_Delegate_Base = interface(IUnknown)
  ['{65E889CA-F6C9-5C75-BEF9-05AB88A49A54}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.WiFiAccessStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.WiFiAccessStatus>
  AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus = interface(AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFi_WiFiAccessStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.WiFiAccessStatus>
  IAsyncOperation_1__WiFi_WiFiAccessStatus_Base = interface(IInspectable)
  ['{F8C75A3A-739A-57AA-986D-1F7604D7E386}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.WiFiAccessStatus>
  // Used Types:  Windows.Devices.WiFi.WiFiAccessStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.WiFiAccessStatus>
  IAsyncOperation_1__WiFi_WiFiAccessStatus = interface(IAsyncOperation_1__WiFi_WiFiAccessStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus; safecall;
    function GetResults: WiFi_WiFiAccessStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFi_WiFiAccessStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.IWiFiAdapter>>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiAdapter>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.WiFiAccessStatus>
  }
  // Windows.Devices.WiFi.IWiFiAdapterStatics
  [WinRTClassNameAttribute(SWiFi_WiFiAdapter)]
  WiFi_IWiFiAdapterStatics = interface(IInspectable)
  ['{DA25FDDD-D24C-43E3-AABD-C4659F730F99}']
    function FindAllAdaptersAsync: IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter; safecall;
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFi_IWiFiAdapter; safecall;
    function RequestAccessAsync: IAsyncOperation_1__WiFi_WiFiAccessStatus; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.WiFiWpsKind>
  IIterator_1__WiFi_WiFiWpsKind_Base = interface(IInspectable)
  ['{9B19593C-602D-57D9-A852-A48A8204FF42}']
  end;
  {
  // Used Types:  Windows.Devices.WiFi.WiFiWpsKind
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.WiFiWpsKind>
  IIterator_1__WiFi_WiFiWpsKind = interface(IIterator_1__WiFi_WiFiWpsKind_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: WiFi_WiFiWpsKind; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWiFi_WiFiWpsKind): Cardinal; safecall;
    property Current: WiFi_WiFiWpsKind read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.WiFiWpsKind>
  IIterable_1__WiFi_WiFiWpsKind_Base = interface(IInspectable)
  ['{41E16513-A8F2-55ED-9BE4-5665167D49D7}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFi.WiFiWpsKind>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFi.WiFiWpsKind>
  IIterable_1__WiFi_WiFiWpsKind = interface(IIterable_1__WiFi_WiFiWpsKind_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__WiFi_WiFiWpsKind; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFi.WiFiWpsKind
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.WiFiWpsKind>
  IVectorView_1__WiFi_WiFiWpsKind = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): WiFi_WiFiWpsKind; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WiFi_WiFiWpsKind; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFi_WiFiWpsKind): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFi.WiFiWpsConfigurationStatus
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFi.WiFiWpsKind>
  }
  // Windows.Devices.WiFi.IWiFiWpsConfigurationResult
  WiFi_IWiFiWpsConfigurationResult = interface(IInspectable)
  ['{67B49871-17EE-42D1-B14F-5A11F1226FB5}']
    function get_Status: WiFi_WiFiWpsConfigurationStatus; safecall;
    function get_SupportedWpsKinds: IVectorView_1__WiFi_WiFiWpsKind; safecall;
    property Status: WiFi_WiFiWpsConfigurationStatus read get_Status;
    property SupportedWpsKinds: IVectorView_1__WiFi_WiFiWpsKind read get_SupportedWpsKinds;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult_Delegate_Base = interface(IUnknown)
  ['{33FA345B-28CD-58A8-BCFC-BE4CFD108E91}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult = interface(AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult_Delegate_Base)
  ['{AD5E5469-0581-5AC3-B166-2D0B93B4B31E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult_Base = interface(IInspectable)
  ['{4B721D74-0289-583C-A81D-F3BE03EA596D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  // Used Types:  Windows.Devices.WiFi.IWiFiWpsConfigurationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult = interface(IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult_Base)
  ['{DFC39273-8FE9-50E9-AE5E-62E34296A28C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult; safecall;
    function GetResults: WiFi_IWiFiWpsConfigurationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFi_IWiFiWpsConfigurationResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiWpsConfigurationResult>
  // Used Types:  Windows.Devices.WiFi.IWiFiAvailableNetwork
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFi.IWiFiConnectionResult>
  // Used Types:  Windows.Devices.WiFi.WiFiReconnectionKind
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  // Used Types:  String
  // Used Types:  Windows.Devices.WiFi.WiFiConnectionMethod
  }
  // Windows.Devices.WiFi.IWiFiAdapter2
  WiFi_IWiFiAdapter2 = interface(IInspectable)
  ['{5BC4501D-81E4-453D-9430-1FCAFBADD6B6}']
    function GetWpsConfigurationAsync(availableNetwork: WiFi_IWiFiAvailableNetwork): IAsyncOperation_1__WiFi_IWiFiWpsConfigurationResult; safecall;
    function ConnectAsync(availableNetwork: WiFi_IWiFiAvailableNetwork; reconnectionKind: WiFi_WiFiReconnectionKind; passwordCredential: IPasswordCredential; ssid: HSTRING; connectionMethod: WiFi_WiFiConnectionMethod): IAsyncOperation_1__WiFi_IWiFiConnectionResult; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectDevice,Object>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable_Delegate_Base = interface(IUnknown)
  ['{9208929A-2A3C-50AD-AA08-A0A986EDBABE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectDevice
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectDevice,Object>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable = interface(TypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable_Delegate_Base)
  ['{4BA6EACB-3A8B-58A7-B1CA-1FDBFFA4596A}']
    procedure Invoke(sender: WiFiDirect_IWiFiDirectDevice; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectConnectionStatus
  // Used Types:  String
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectDevice,Object>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectDevice
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectDevice)]
  WiFiDirect_IWiFiDirectDevice = interface(IInspectable)
  ['{72DEAAA8-72EB-4DAE-8A28-8513355D2777}']
    function get_ConnectionStatus: WiFiDirect_WiFiDirectConnectionStatus; safecall;
    function get_DeviceId: HSTRING; safecall;
    function add_ConnectionStatusChanged(handler: TypedEventHandler_2__WiFiDirect_IWiFiDirectDevice__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ConnectionStatusChanged(token: EventRegistrationToken); safecall;
    function GetConnectionEndpointPairs: IVectorView_1__IEndpointPair; safecall;
    property ConnectionStatus: WiFiDirect_WiFiDirectConnectionStatus read get_ConnectionStatus;
    property DeviceId: HSTRING read get_DeviceId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice_Delegate_Base = interface(IUnknown)
  ['{D34ABE17-FB19-57BE-BC41-0EB83DEA151C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice = interface(AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice_Delegate_Base)
  ['{0CD454A0-8746-59AA-9ED6-EA7DDBD57D7B}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice_Base = interface(IInspectable)
  ['{DAD01B61-A82D-566C-BA82-224C11500669}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice = interface(IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice_Base)
  ['{3262C1BC-5881-5E0B-84DA-4990EF8448DB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice; safecall;
    function GetResults: WiFiDirect_IWiFiDirectDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFiDirect_IWiFiDirectDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectDeviceStatics
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectDevice)]
  WiFiDirect_IWiFiDirectDeviceStatics = interface(IInspectable)
  ['{E86CB57C-3AAC-4851-A792-482AAF931B04}']
    function GetDeviceSelector: HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int16
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectConnectionParameters)]
  WiFiDirect_IWiFiDirectConnectionParameters = interface(IInspectable)
  ['{B2E55405-5702-4B16-A02C-BBCD21EF6098}']
    function get_GroupOwnerIntent: SmallInt; safecall;
    procedure put_GroupOwnerIntent(value: SmallInt); safecall;
    property GroupOwnerIntent: SmallInt read get_GroupOwnerIntent write put_GroupOwnerIntent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectDeviceSelectorType
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.IWiFiDirectDevice>
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectDeviceStatics2
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectDevice)]
  WiFiDirect_IWiFiDirectDeviceStatics2 = interface(IInspectable)
  ['{1A953E49-B103-437E-9226-AB67971342F9}']
    function GetDeviceSelector(&type: WiFiDirect_WiFiDirectDeviceSelectorType): HSTRING; safecall;
    function FromIdAsync(deviceId: HSTRING; connectionParameters: WiFiDirect_IWiFiDirectConnectionParameters): IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  UInt8
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectInformationElement)]
  WiFiDirect_IWiFiDirectInformationElement = interface(IInspectable)
  ['{AFFB72D6-76BB-497E-AC8B-DC72838BC309}']
    function get_Oui: IBuffer; safecall;
    procedure put_Oui(value: IBuffer); safecall;
    function get_OuiType: Byte; safecall;
    procedure put_OuiType(value: Byte); safecall;
    function get_Value: IBuffer; safecall;
    procedure put_Value(value: IBuffer); safecall;
    property Oui: IBuffer read get_Oui write put_Oui;
    property OuiType: Byte read get_OuiType write put_OuiType;
    property Value: IBuffer read get_Value write put_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IIterator_1__WiFiDirect_IWiFiDirectInformationElement_Base = interface(IInspectable)
  ['{CF806026-C915-553E-AF3C-8DA43871B693}']
  end;
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IIterator_1__WiFiDirect_IWiFiDirectInformationElement = interface(IIterator_1__WiFiDirect_IWiFiDirectInformationElement_Base)
  ['{5DB19ED4-B49F-59B1-AD47-89BDA9372F29}']
    function get_Current: WiFiDirect_IWiFiDirectInformationElement; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWiFiDirect_IWiFiDirectInformationElement): Cardinal; safecall;
    property Current: WiFiDirect_IWiFiDirectInformationElement read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IIterable_1__WiFiDirect_IWiFiDirectInformationElement_Base = interface(IInspectable)
  ['{19C1CA4E-9561-5253-96D9-DBAF28D47D89}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IIterable_1__WiFiDirect_IWiFiDirectInformationElement = interface(IIterable_1__WiFiDirect_IWiFiDirectInformationElement_Base)
  ['{0DEBEBC3-B2C0-5BF3-BEA5-8482E9288B73}']
    function First: IIterator_1__WiFiDirect_IWiFiDirectInformationElement; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IVectorView_1__WiFiDirect_IWiFiDirectInformationElement = interface(IInspectable)
  ['{3E40623D-5498-5C64-A898-2C06586E5EA5}']
    function GetAt(index: Cardinal): WiFiDirect_IWiFiDirectInformationElement; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WiFiDirect_IWiFiDirectInformationElement; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFiDirect_IWiFiDirectInformationElement): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  IVector_1__WiFiDirect_IWiFiDirectInformationElement = interface(IInspectable)
  ['{AC699196-FAF0-588B-AD06-726FD1DFB794}']
    function GetAt(index: Cardinal): WiFiDirect_IWiFiDirectInformationElement; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__WiFiDirect_IWiFiDirectInformationElement; safecall;
    function IndexOf(value: WiFiDirect_IWiFiDirectInformationElement; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: WiFiDirect_IWiFiDirectInformationElement); safecall;
    procedure InsertAt(index: Cardinal; value: WiFiDirect_IWiFiDirectInformationElement); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: WiFiDirect_IWiFiDirectInformationElement); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFiDirect_IWiFiDirectInformationElement): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PWiFiDirect_IWiFiDirectInformationElement); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectInformationElementStatics
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectInformationElement)]
  WiFiDirect_IWiFiDirectInformationElementStatics = interface(IInspectable)
  ['{DBD02F16-11A5-4E60-8CAA-34772148378A}']
    function CreateFromBuffer(buffer: IBuffer): IVector_1__WiFiDirect_IWiFiDirectInformationElement; safecall;
    function CreateFromDeviceInformation(deviceInformation: IDeviceInformation): IVector_1__WiFiDirect_IWiFiDirectInformationElement; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Security.Credentials.IPasswordCredential
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectLegacySettings
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectLegacySettings)]
  WiFiDirect_IWiFiDirectLegacySettings = interface(IInspectable)
  ['{A64FDBBA-F2FD-4567-A91B-F5C2F5321057}']
    function get_IsEnabled: Boolean; safecall;
    procedure put_IsEnabled(value: Boolean); safecall;
    function get_Ssid: HSTRING; safecall;
    procedure put_Ssid(value: HSTRING); safecall;
    function get_Passphrase: IPasswordCredential; safecall;
    procedure put_Passphrase(value: IPasswordCredential); safecall;
    property IsEnabled: Boolean read get_IsEnabled write put_IsEnabled;
    property Passphrase: IPasswordCredential read get_Passphrase write put_Passphrase;
    property Ssid: HSTRING read get_Ssid write put_Ssid;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.IWiFiDirectInformationElement>
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectAdvertisementListenStateDiscoverability
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectLegacySettings
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectAdvertisement)]
  WiFiDirect_IWiFiDirectAdvertisement = interface(IInspectable)
  ['{AB511A2D-2A06-49A1-A584-61435C7905A6}']
    function get_InformationElements: IVector_1__WiFiDirect_IWiFiDirectInformationElement; safecall;
    procedure put_InformationElements(value: IVector_1__WiFiDirect_IWiFiDirectInformationElement); safecall;
    function get_ListenStateDiscoverability: WiFiDirect_WiFiDirectAdvertisementListenStateDiscoverability; safecall;
    procedure put_ListenStateDiscoverability(value: WiFiDirect_WiFiDirectAdvertisementListenStateDiscoverability); safecall;
    function get_IsAutonomousGroupOwnerEnabled: Boolean; safecall;
    procedure put_IsAutonomousGroupOwnerEnabled(value: Boolean); safecall;
    function get_LegacySettings: WiFiDirect_IWiFiDirectLegacySettings; safecall;
    property InformationElements: IVector_1__WiFiDirect_IWiFiDirectInformationElement read get_InformationElements write put_InformationElements;
    property IsAutonomousGroupOwnerEnabled: Boolean read get_IsAutonomousGroupOwnerEnabled write put_IsAutonomousGroupOwnerEnabled;
    property LegacySettings: WiFiDirect_IWiFiDirectLegacySettings read get_LegacySettings;
    property ListenStateDiscoverability: WiFiDirect_WiFiDirectAdvertisementListenStateDiscoverability read get_ListenStateDiscoverability write put_ListenStateDiscoverability;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IIterator_1__WiFiDirect_WiFiDirectConfigurationMethod_Base = interface(IInspectable)
  ['{201940F9-A368-57F4-9EF2-3F64E243E0A4}']
  end;
  {
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IIterator_1__WiFiDirect_WiFiDirectConfigurationMethod = interface(IIterator_1__WiFiDirect_WiFiDirectConfigurationMethod_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: WiFiDirect_WiFiDirectConfigurationMethod; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWiFiDirect_WiFiDirectConfigurationMethod): Cardinal; safecall;
    property Current: WiFiDirect_WiFiDirectConfigurationMethod read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IIterable_1__WiFiDirect_WiFiDirectConfigurationMethod_Base = interface(IInspectable)
  ['{794F12DA-2DC6-5277-82DC-B0781610537B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IIterable_1__WiFiDirect_WiFiDirectConfigurationMethod = interface(IIterable_1__WiFiDirect_WiFiDirectConfigurationMethod_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__WiFiDirect_WiFiDirectConfigurationMethod; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IVectorView_1__WiFiDirect_WiFiDirectConfigurationMethod = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): WiFiDirect_WiFiDirectConfigurationMethod; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WiFiDirect_WiFiDirectConfigurationMethod; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFiDirect_WiFiDirectConfigurationMethod): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  IVector_1__WiFiDirect_WiFiDirectConfigurationMethod = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): WiFiDirect_WiFiDirectConfigurationMethod; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__WiFiDirect_WiFiDirectConfigurationMethod; safecall;
    function IndexOf(value: WiFiDirect_WiFiDirectConfigurationMethod; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: WiFiDirect_WiFiDirectConfigurationMethod); safecall;
    procedure InsertAt(index: Cardinal; value: WiFiDirect_WiFiDirectConfigurationMethod); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: WiFiDirect_WiFiDirectConfigurationMethod); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFiDirect_WiFiDirectConfigurationMethod): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PWiFiDirect_WiFiDirectConfigurationMethod); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement2
  WiFiDirect_IWiFiDirectAdvertisement2 = interface(IInspectable)
  ['{B759AA46-D816-491B-917A-B40D7DC403A2}']
    function get_SupportedConfigurationMethods: IVector_1__WiFiDirect_WiFiDirectConfigurationMethod; safecall;
    property SupportedConfigurationMethods: IVector_1__WiFiDirect_WiFiDirectConfigurationMethod read get_SupportedConfigurationMethods;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisherStatus
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectError
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectAdvertisementPublisherStatusChangedEventArgs)]
  WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs = interface(IInspectable)
  ['{AAFDE53C-5481-46E6-90DD-32116518F192}']
    function get_Status: WiFiDirect_WiFiDirectAdvertisementPublisherStatus; safecall;
    function get_Error: WiFiDirect_WiFiDirectError; safecall;
    property Error: WiFiDirect_WiFiDirectError read get_Error;
    property Status: WiFiDirect_WiFiDirectAdvertisementPublisherStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher,Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{DE73CBA7-370D-550C-B23A-53DD0B4E480D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher,Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs = interface(TypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs_Delegate_Base)
  ['{FFBA9DBF-6276-54AF-ACC5-C143104D84EA}']
    procedure Invoke(sender: WiFiDirect_IWiFiDirectAdvertisementPublisher; args: WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisherStatus
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher,Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs>
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectAdvertisementPublisher)]
  WiFiDirect_IWiFiDirectAdvertisementPublisher = interface(IInspectable)
  ['{B35A2D1A-9B1F-45D9-925A-694D66DF68EF}']
    function get_Advertisement: WiFiDirect_IWiFiDirectAdvertisement; safecall;
    function get_Status: WiFiDirect_WiFiDirectAdvertisementPublisherStatus; safecall;
    function add_StatusChanged(handler: TypedEventHandler_2__WiFiDirect_IWiFiDirectAdvertisementPublisher__WiFiDirect_IWiFiDirectAdvertisementPublisherStatusChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StatusChanged(token: EventRegistrationToken); safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property Advertisement: WiFiDirect_IWiFiDirectAdvertisement read get_Advertisement;
    property Status: WiFiDirect_WiFiDirectAdvertisementPublisherStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.DevicePairingKinds
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionParametersStatics
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectConnectionParameters)]
  WiFiDirect_IWiFiDirectConnectionParametersStatics = interface(IInspectable)
  ['{598AF493-7642-456F-B9D8-E8A9EB1F401A}']
    function GetDevicePairingKinds(configurationMethod: WiFiDirect_WiFiDirectConfigurationMethod): DevicePairingKinds; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.WiFiDirectConfigurationMethod>
  // Used Types:  Windows.Devices.WiFiDirect.WiFiDirectPairingProcedure
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters2
  WiFiDirect_IWiFiDirectConnectionParameters2 = interface(IInspectable)
  ['{AB3B0FBE-AA82-44B4-88C8-E3056B89801D}']
    function get_PreferenceOrderedConfigurationMethods: IVector_1__WiFiDirect_WiFiDirectConfigurationMethod; safecall;
    function get_PreferredPairingProcedure: WiFiDirect_WiFiDirectPairingProcedure; safecall;
    procedure put_PreferredPairingProcedure(value: WiFiDirect_WiFiDirectPairingProcedure); safecall;
    property PreferenceOrderedConfigurationMethods: IVector_1__WiFiDirect_WiFiDirectConfigurationMethod read get_PreferenceOrderedConfigurationMethods;
    property PreferredPairingProcedure: WiFiDirect_WiFiDirectPairingProcedure read get_PreferredPairingProcedure write put_PreferredPairingProcedure;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequest
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectConnectionRequest)]
  WiFiDirect_IWiFiDirectConnectionRequest = interface(IInspectable)
  ['{8EB99605-914F-49C3-A614-D18DC5B19B43}']
    function get_DeviceInformation: IDeviceInformation; safecall;
    property DeviceInformation: IDeviceInformation read get_DeviceInformation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequest
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectConnectionRequestedEventArgs)]
  WiFiDirect_IWiFiDirectConnectionRequestedEventArgs = interface(IInspectable)
  ['{F99D20BE-D38D-484F-8215-E7B65ABF244C}']
    function GetConnectionRequest: WiFiDirect_IWiFiDirectConnectionRequest; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener,Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D04B0403-1FE2-532F-8E47-4823A14E624F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener
  // Used Types:  Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener,Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs>
  TypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs = interface(TypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs_Delegate_Base)
  ['{23EADA2E-D484-5E53-8879-DEA050C00570}']
    procedure Invoke(sender: WiFiDirect_IWiFiDirectConnectionListener; args: WiFiDirect_IWiFiDirectConnectionRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener,Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs>
  }
  // Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener
  [WinRTClassNameAttribute(SWiFiDirect_WiFiDirectConnectionListener)]
  WiFiDirect_IWiFiDirectConnectionListener = interface(IInspectable)
  ['{699C1B0D-8D13-4EE9-B9EC-9C72F8251F7D}']
    function add_ConnectionRequested(handler: TypedEventHandler_2__WiFiDirect_IWiFiDirectConnectionListener__WiFiDirect_IWiFiDirectConnectionRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ConnectionRequested(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
  // Used Types:  Boolean
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceProvisioningInfo)]
  WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = interface(IInspectable)
  ['{8BDB7CFE-97D9-45A2-8E99-DB50910FB6A6}']
    function get_SelectedConfigurationMethod: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function get_IsGroupFormationNeeded: Boolean; safecall;
    property IsGroupFormationNeeded: Boolean read get_IsGroupFormationNeeded;
    property SelectedConfigurationMethod: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod read get_SelectedConfigurationMethod;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Object>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable_Delegate_Base = interface(IUnknown)
  ['{10C33301-E31C-5CCE-B2A0-C1DC2D8D0E13}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Object>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable = interface(TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable_Delegate_Base)
  ['{DFB033B1-755C-5DEF-AE9D-5C62913A7F20}']
    procedure Invoke(sender: WiFiDirect_Services_IWiFiDirectServiceSession; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceIPProtocol
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceRemotePortAddedEventArgs)]
  WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs = interface(IInspectable)
  ['{D4CEBAC1-3FD3-4F0E-B7BD-782906F44411}']
    function get_EndpointPairs: IVectorView_1__IEndpointPair; safecall;
    function get_Protocol: WiFiDirect_Services_WiFiDirectServiceIPProtocol; safecall;
    property EndpointPairs: IVectorView_1__IEndpointPair read get_EndpointPairs;
    property Protocol: WiFiDirect_Services_WiFiDirectServiceIPProtocol read get_Protocol;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs_Delegate_Base = interface(IUnknown)
  ['{8326A337-3C19-57A7-80EC-CCA2EA62EF12}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs = interface(TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs_Delegate_Base)
  ['{FEBCEF17-4038-57E4-9F35-54F34E8AD987}']
    procedure Invoke(sender: WiFiDirect_Services_IWiFiDirectServiceSession; args: WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionStatus
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionErrorStatus
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Networking.IEndpointPair>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Object>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Networking.Sockets.IStreamSocketListener
  // Used Types:  Windows.Networking.Sockets.IDatagramSocket
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs>
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceSession)]
  WiFiDirect_Services_IWiFiDirectServiceSession = interface(IInspectable)
  ['{81142163-E426-47CB-8640-E1B3588BF26F}']
    function get_ServiceName: HSTRING; safecall;
    function get_Status: WiFiDirect_Services_WiFiDirectServiceSessionStatus; safecall;
    function get_ErrorStatus: WiFiDirect_Services_WiFiDirectServiceSessionErrorStatus; safecall;
    function get_SessionId: Cardinal; safecall;
    function get_AdvertisementId: Cardinal; safecall;
    function get_ServiceAddress: HSTRING; safecall;
    function get_SessionAddress: HSTRING; safecall;
    function GetConnectionEndpointPairs: IVectorView_1__IEndpointPair; safecall;
    function add_SessionStatusChanged(handler: TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SessionStatusChanged(token: EventRegistrationToken); safecall;
    function AddStreamSocketListenerAsync(value: IStreamSocketListener): IAsyncAction; safecall;
    function AddDatagramSocketAsync(value: IDatagramSocket): IAsyncAction; safecall;
    function add_RemotePortAdded(handler: TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceSession__WiFiDirect_Services_IWiFiDirectServiceRemotePortAddedEventArgs): EventRegistrationToken; safecall;
    procedure remove_RemotePortAdded(token: EventRegistrationToken); safecall;
    property AdvertisementId: Cardinal read get_AdvertisementId;
    property ErrorStatus: WiFiDirect_Services_WiFiDirectServiceSessionErrorStatus read get_ErrorStatus;
    property ServiceAddress: HSTRING read get_ServiceAddress;
    property ServiceName: HSTRING read get_ServiceName;
    property SessionAddress: HSTRING read get_SessionAddress;
    property SessionId: Cardinal read get_SessionId;
    property Status: WiFiDirect_Services_WiFiDirectServiceSessionStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceAutoAcceptSessionConnectedEventArgs)]
  WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs = interface(IInspectable)
  ['{DCD9E01E-83DF-43E5-8F43-CBE8479E84EB}']
    function get_Session: WiFiDirect_Services_IWiFiDirectServiceSession; safecall;
    function get_SessionInfo: IBuffer; safecall;
    property Session: WiFiDirect_Services_IWiFiDirectServiceSession read get_Session;
    property SessionInfo: IBuffer read get_SessionInfo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceSessionDeferredEventArgs)]
  WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs = interface(IInspectable)
  ['{8DFC197F-1201-4F1F-B6F4-5DF1B7B9FB2E}']
    function get_DeferredSessionInfo: IBuffer; safecall;
    property DeferredSessionInfo: IBuffer read get_DeferredSessionInfo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequest
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceSessionRequest)]
  WiFiDirect_Services_IWiFiDirectServiceSessionRequest = interface(IInspectable)
  ['{A0E27C8B-50CB-4A58-9BCF-E472B99FBA04}']
    function get_DeviceInformation: IDeviceInformation; safecall;
    function get_ProvisioningInfo: WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo; safecall;
    function get_SessionInfo: IBuffer; safecall;
    property DeviceInformation: IDeviceInformation read get_DeviceInformation;
    property ProvisioningInfo: WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo read get_ProvisioningInfo;
    property SessionInfo: IBuffer read get_SessionInfo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequest
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceSessionRequestedEventArgs)]
  WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs = interface(IInspectable)
  ['{74BDCC11-53D6-4999-B4F8-6C8ECC1771E7}']
    function GetSessionRequest: WiFiDirect_Services_IWiFiDirectServiceSessionRequest; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod_Base = interface(IInspectable)
  ['{19889F5E-49AE-5E31-B059-083F9F1532C3}']
  end;
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface(IIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PWiFiDirect_Services_WiFiDirectServiceConfigurationMethod): Cardinal; safecall;
    property Current: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IIterable_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod_Base = interface(IInspectable)
  ['{D9773B1A-A148-58BF-9C4B-AFEAC9BE3AB4}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IIterable_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface(IIterable_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFiDirect_Services_WiFiDirectServiceConfigurationMethod): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  IVector_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod = interface(IInspectable)
  ['{A4739064-B54E-55D4-8012-317E2B6A807B}']
    function GetAt(index: Cardinal): WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function IndexOf(value: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod); safecall;
    procedure InsertAt(index: Cardinal; value: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PWiFiDirect_Services_WiFiDirectServiceConfigurationMethod): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PWiFiDirect_Services_WiFiDirectServiceConfigurationMethod); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{CB98FD74-871D-5730-91FE-81EF947FE78F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs = interface(TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs_Delegate_Base)
  ['{90B84E0D-8775-5739-9176-7AA21DBB2FF4}']
    procedure Invoke(sender: WiFiDirect_Services_IWiFiDirectServiceAdvertiser; args: WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{3BE2D508-A856-5C09-9998-522597B44B07}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs = interface(TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs_Delegate_Base)
  ['{A98FE153-F2EC-5247-B227-FC0BCD90AF3B}']
    procedure Invoke(sender: WiFiDirect_Services_IWiFiDirectServiceAdvertiser; args: WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Object>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable_Delegate_Base = interface(IUnknown)
  ['{67FC3121-C1A0-5C23-AF58-ECB7F2A7D773}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Object>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable = interface(TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable_Delegate_Base)
  ['{21DD85A7-E94F-5B3A-94BC-1076A93CBF19}']
    procedure Invoke(sender: WiFiDirect_Services_IWiFiDirectServiceAdvertiser; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession_Delegate_Base = interface(IUnknown)
  ['{B29DE711-60B8-59DA-8F4D-FC79D8CCD422}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession = interface(AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession_Delegate_Base)
  ['{888D8F9C-5639-5A70-A152-53D9AD375FCD}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession_Base = interface(IInspectable)
  ['{C2DA4E97-728B-5401-A9D9-3A0185450AF2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession = interface(IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession_Base)
  ['{078C3963-DBE4-5D07-B4E9-6F9FD007A851}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession; safecall;
    function GetResults: WiFiDirect_Services_IWiFiDirectServiceSession; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceSession read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceStatus
  // Used Types:  UInt32
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAdvertisementStatus
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceError
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser,Object>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceAdvertiser)]
  WiFiDirect_Services_IWiFiDirectServiceAdvertiser = interface(IInspectable)
  ['{A4AA1EE1-9D8F-4F4F-93EE-7DDEA2E37F46}']
    function get_ServiceName: HSTRING; safecall;
    function get_ServiceNamePrefixes: IVector_1__HSTRING; safecall;
    function get_ServiceInfo: IBuffer; safecall;
    procedure put_ServiceInfo(value: IBuffer); safecall;
    function get_AutoAcceptSession: Boolean; safecall;
    procedure put_AutoAcceptSession(value: Boolean); safecall;
    function get_PreferGroupOwnerMode: Boolean; safecall;
    procedure put_PreferGroupOwnerMode(value: Boolean); safecall;
    function get_PreferredConfigurationMethods: IVector_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function get_ServiceStatus: WiFiDirect_Services_WiFiDirectServiceStatus; safecall;
    procedure put_ServiceStatus(value: WiFiDirect_Services_WiFiDirectServiceStatus); safecall;
    function get_CustomServiceStatusCode: Cardinal; safecall;
    procedure put_CustomServiceStatusCode(value: Cardinal); safecall;
    function get_DeferredSessionInfo: IBuffer; safecall;
    procedure put_DeferredSessionInfo(value: IBuffer); safecall;
    function get_AdvertisementStatus: WiFiDirect_Services_WiFiDirectServiceAdvertisementStatus; safecall;
    function get_ServiceError: WiFiDirect_Services_WiFiDirectServiceError; safecall;
    function add_SessionRequested(handler: TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceSessionRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SessionRequested(token: EventRegistrationToken); safecall;
    function add_AutoAcceptSessionConnected(handler: TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__WiFiDirect_Services_IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AutoAcceptSessionConnected(token: EventRegistrationToken); safecall;
    function add_AdvertisementStatusChanged(handler: TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectServiceAdvertiser__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AdvertisementStatusChanged(token: EventRegistrationToken); safecall;
    function ConnectAsync(deviceInfo: IDeviceInformation): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession; overload; safecall;
    function ConnectAsync(deviceInfo: IDeviceInformation; pin: HSTRING): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession; overload; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    property AdvertisementStatus: WiFiDirect_Services_WiFiDirectServiceAdvertisementStatus read get_AdvertisementStatus;
    property AutoAcceptSession: Boolean read get_AutoAcceptSession write put_AutoAcceptSession;
    property CustomServiceStatusCode: Cardinal read get_CustomServiceStatusCode write put_CustomServiceStatusCode;
    property DeferredSessionInfo: IBuffer read get_DeferredSessionInfo write put_DeferredSessionInfo;
    property PreferGroupOwnerMode: Boolean read get_PreferGroupOwnerMode write put_PreferGroupOwnerMode;
    property PreferredConfigurationMethods: IVector_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod read get_PreferredConfigurationMethods;
    property ServiceError: WiFiDirect_Services_WiFiDirectServiceError read get_ServiceError;
    property ServiceInfo: IBuffer read get_ServiceInfo write put_ServiceInfo;
    property ServiceName: HSTRING read get_ServiceName;
    property ServiceNamePrefixes: IVector_1__HSTRING read get_ServiceNamePrefixes;
    property ServiceStatus: WiFiDirect_Services_WiFiDirectServiceStatus read get_ServiceStatus write put_ServiceStatus;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  // Used Types:  String
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiserFactory
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectServiceAdvertiser)]
  WiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory = interface(IInspectable)
  ['{3106AC0D-B446-4F13-9F9A-8AE925FEBA2B}']
    function CreateWiFiDirectServiceAdvertiser(serviceName: HSTRING): WiFiDirect_Services_IWiFiDirectServiceAdvertiser; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectService,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs_Delegate_Base = interface(IUnknown)
  ['{FC3DFC2C-9CFA-5822-BA3F-FF3AFB65777E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectService
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectService,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs>
  TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs = interface(TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs_Delegate_Base)
  ['{FCDA050E-8790-5B90-9899-B0F6D1CC8A77}']
    procedure Invoke(sender: WiFiDirect_Services_IWiFiDirectService; args: WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo_Delegate_Base = interface(IUnknown)
  ['{94CB9568-040A-5186-A3C9-52680EE17984}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = interface(AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo_Delegate_Base)
  ['{BF13B8AD-48F8-500F-9B38-2BF6AE27BF45}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo_Base = interface(IInspectable)
  ['{D7FA4DC4-4730-506E-BFF0-801EB4A831A8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo = interface(IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo_Base)
  ['{24562F84-1A12-5072-BDCE-188EF31F0E40}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo; safecall;
    function GetResults: WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod>
  // Used Types:  Boolean
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceError
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Devices.WiFiDirect.Services.IWiFiDirectService,Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo>
  // Used Types:  Windows.Devices.WiFiDirect.Services.WiFiDirectServiceConfigurationMethod
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession>
  // Used Types:  String
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectService
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectService)]
  WiFiDirect_Services_IWiFiDirectService = interface(IInspectable)
  ['{50AABBB8-5F71-45EC-84F1-A1E4FC7879A3}']
    function get_RemoteServiceInfo: IBuffer; safecall;
    function get_SupportedConfigurationMethods: IVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod; safecall;
    function get_PreferGroupOwnerMode: Boolean; safecall;
    procedure put_PreferGroupOwnerMode(value: Boolean); safecall;
    function get_SessionInfo: IBuffer; safecall;
    procedure put_SessionInfo(value: IBuffer); safecall;
    function get_ServiceError: WiFiDirect_Services_WiFiDirectServiceError; safecall;
    function add_SessionDeferred(handler: TypedEventHandler_2__WiFiDirect_Services_IWiFiDirectService__WiFiDirect_Services_IWiFiDirectServiceSessionDeferredEventArgs): EventRegistrationToken; safecall;
    procedure remove_SessionDeferred(token: EventRegistrationToken); safecall;
    function GetProvisioningInfoAsync(selectedConfigurationMethod: WiFiDirect_Services_WiFiDirectServiceConfigurationMethod): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceProvisioningInfo; safecall;
    function ConnectAsync: IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession; overload; safecall;
    function ConnectAsync(pin: HSTRING): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectServiceSession; overload; safecall;
    property PreferGroupOwnerMode: Boolean read get_PreferGroupOwnerMode write put_PreferGroupOwnerMode;
    property RemoteServiceInfo: IBuffer read get_RemoteServiceInfo;
    property ServiceError: WiFiDirect_Services_WiFiDirectServiceError read get_ServiceError;
    property SessionInfo: IBuffer read get_SessionInfo write put_SessionInfo;
    property SupportedConfigurationMethods: IVectorView_1__WiFiDirect_Services_WiFiDirectServiceConfigurationMethod read get_SupportedConfigurationMethods;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService_Delegate_Base = interface(IUnknown)
  ['{F505A3C8-4837-5E0E-8A4D-1E2AF5477E5C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService = interface(AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService_Delegate_Base)
  ['{E5F9153D-46B4-552D-B096-E7B997E9FE65}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService_Base = interface(IInspectable)
  ['{C4FA2AE8-4FF7-5AA0-AF97-ED85EA66F9AE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  // Used Types:  Windows.Devices.WiFiDirect.Services.IWiFiDirectService
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService = interface(IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService_Base)
  ['{F74A5CED-D2FC-5420-A463-CC8A54893F98}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService; safecall;
    function GetResults: WiFiDirect_Services_IWiFiDirectService; safecall;
    property Completed: AsyncOperationCompletedHandler_1__WiFiDirect_Services_IWiFiDirectService read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Devices.WiFiDirect.Services.IWiFiDirectService>
  }
  // Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceStatics
  [WinRTClassNameAttribute(SWiFiDirect_Services_WiFiDirectService)]
  WiFiDirect_Services_IWiFiDirectServiceStatics = interface(IInspectable)
  ['{7DB40045-FD74-4688-B725-5DCE86ACF233}']
    function GetSelector(serviceName: HSTRING): HSTRING; overload; safecall;
    function GetSelector(serviceName: HSTRING; serviceInfoFilter: IBuffer): HSTRING; overload; safecall;
    function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IIterator_1__Haptics_ISimpleHapticsController_Base = interface(IInspectable)
  ['{3C501BA4-EDA4-5238-BDB7-D10BA350CD83}']
  end;
  {
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IIterator_1__Haptics_ISimpleHapticsController = interface(IIterator_1__Haptics_ISimpleHapticsController_Base)
  ['{038EFEDB-EF47-54EF-87EB-1EF372F9A986}']
    function get_Current: Haptics_ISimpleHapticsController; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PHaptics_ISimpleHapticsController): Cardinal; safecall;
    property Current: Haptics_ISimpleHapticsController read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IIterable_1__Haptics_ISimpleHapticsController_Base = interface(IInspectable)
  ['{B50DA692-4A2B-5C8A-8E14-0439C0B1DBA4}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Devices.Haptics.ISimpleHapticsController>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IIterable_1__Haptics_ISimpleHapticsController = interface(IIterable_1__Haptics_ISimpleHapticsController_Base)
  ['{ECA0AF19-3104-5DD0-AD28-E15DBF157956}']
    function First: IIterator_1__Haptics_ISimpleHapticsController; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Haptics.ISimpleHapticsController
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Devices.Haptics.ISimpleHapticsController>
  IVectorView_1__Haptics_ISimpleHapticsController = interface(IInspectable)
  ['{1B1C9184-A6EB-52D4-BCBE-5DCBE538DD7F}']
    function GetAt(index: Cardinal): Haptics_ISimpleHapticsController; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Haptics_ISimpleHapticsController; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PHaptics_ISimpleHapticsController): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;


  // Emit Forwarded classes
  // Windows.Devices.Custom.IOControlCode
  // DualAPI
  // Implements: Windows.Devices.Custom.IIOControlCode
  // Factory: "Windows.Devices.Custom.IIOControlCodeFactory"
  TCustom_IOControlCode = class(TWinRTGenericImportF<Custom_IIOControlCodeFactory>)
  public
    // -> Custom_IIOControlCodeFactory
    class function CreateIOControlCode(deviceType: Word; &function: Word; accessMode: Custom_IOControlAccessMode; bufferingMethod: Custom_IOControlBufferingMethod): Custom_IIOControlCode; static; inline;
  end;

  // Windows.Devices.Custom.CustomDevice
  // DualAPI
  // Implements: Windows.Devices.Custom.ICustomDevice
  // Statics: "Windows.Devices.Custom.ICustomDeviceStatics"
  TCustom_CustomDevice = class(TWinRTGenericImportS<Custom_ICustomDeviceStatics>)
  public
    // -> Custom_ICustomDeviceStatics
    class function GetDeviceSelector(classGuid: TGuid): HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING; desiredAccess: Custom_DeviceAccessMode; sharingMode: Custom_DeviceSharingMode): IAsyncOperation_1__Custom_ICustomDevice; static; inline;
  end;

  // Windows.Devices.Adc.AdcChannel
  // DualAPI
  // Implements: Windows.Devices.Adc.IAdcChannel
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Adc.AdcController
  // DualAPI
  // Implements: Windows.Devices.Adc.IAdcController
  // Statics: "Windows.Devices.Adc.IAdcControllerStatics2"
  // Statics: "Windows.Devices.Adc.IAdcControllerStatics"
  TAdc_AdcController = class(TWinRTGenericImportS2<Adc_IAdcControllerStatics, Adc_IAdcControllerStatics2>)
  public
    // -> Adc_IAdcControllerStatics2
    class function GetDefaultAsync: IAsyncOperation_1__Adc_IAdcController; static; inline;

    // -> Adc_IAdcControllerStatics
    class function GetControllersAsync(provider: Adc_Provider_IAdcProvider): IAsyncOperation_1__IVectorView_1__Adc_IAdcController; static; inline;
  end;

  // Windows.Devices.Gpio.Provider.GpioPinProviderValueChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgs
  // Factory: "Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgsFactory"
  TGpio_Provider_GpioPinProviderValueChangedEventArgs = class(TWinRTGenericImportF<Gpio_Provider_IGpioPinProviderValueChangedEventArgsFactory>)
  public
    // -> Gpio_Provider_IGpioPinProviderValueChangedEventArgsFactory
    class function Create(edge: Gpio_Provider_ProviderGpioPinEdge): Gpio_Provider_IGpioPinProviderValueChangedEventArgs; static; inline;
  end;

  // Windows.Devices.Gpio.GpioPinValueChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Gpio.IGpioPinValueChangedEventArgs

  // Windows.Devices.Gpio.GpioPin
  // DualAPI
  // Implements: Windows.Devices.Gpio.IGpioPin
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Gpio.GpioController
  // DualAPI
  // Implements: Windows.Devices.Gpio.IGpioController
  // Statics: "Windows.Devices.Gpio.IGpioControllerStatics"
  // Statics: "Windows.Devices.Gpio.IGpioControllerStatics2"
  TGpio_GpioController = class(TWinRTGenericImportS2<Gpio_IGpioControllerStatics, Gpio_IGpioControllerStatics2>)
  public
    // -> Gpio_IGpioControllerStatics
    class function GetDefault: Gpio_IGpioController; static; inline;

    // -> Gpio_IGpioControllerStatics2
    class function GetControllersAsync(provider: Gpio_Provider_IGpioProvider): IAsyncOperation_1__IVectorView_1__Gpio_IGpioController; static; inline;
    class function GetDefaultAsync: IAsyncOperation_1__Gpio_IGpioController; static; inline;
  end;

  // Windows.Devices.Gpio.GpioChangeReader
  // DualAPI
  // Implements: Windows.Devices.Gpio.IGpioChangeReader
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Devices.Gpio.IGpioChangeReaderFactory"
  TGpio_GpioChangeReader = class(TWinRTGenericImportF<Gpio_IGpioChangeReaderFactory>)
  public
    // -> Gpio_IGpioChangeReaderFactory
    class function Create(pin: Gpio_IGpioPin): Gpio_IGpioChangeReader; static; inline;
    class function CreateWithCapacity(pin: Gpio_IGpioPin; minCapacity: Integer): Gpio_IGpioChangeReader; static; inline;
  end;

  // Windows.Devices.Gpio.GpioChangeCounter
  // DualAPI
  // Implements: Windows.Devices.Gpio.IGpioChangeCounter
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Devices.Gpio.IGpioChangeCounterFactory"
  TGpio_GpioChangeCounter = class(TWinRTGenericImportF<Gpio_IGpioChangeCounterFactory>)
  public
    // -> Gpio_IGpioChangeCounterFactory
    class function Create(pin: Gpio_IGpioPin): Gpio_IGpioChangeCounter; static; inline;
  end;

  // Windows.Devices.I2c.Provider.ProviderI2cConnectionSettings
  // DualAPI
  // Implements: Windows.Devices.I2c.Provider.IProviderI2cConnectionSettings

  // Windows.Devices.I2c.I2cConnectionSettings
  // DualAPI
  // Implements: Windows.Devices.I2c.II2cConnectionSettings
  // Factory: "Windows.Devices.I2c.II2cConnectionSettingsFactory"
  TI2c_I2cConnectionSettings = class(TWinRTGenericImportF<I2c_II2cConnectionSettingsFactory>)
  public
    // -> I2c_II2cConnectionSettingsFactory
    class function Create(slaveAddress: Integer): I2c_II2cConnectionSettings; static; inline;
  end;

  // Windows.Devices.I2c.I2cDevice
  // DualAPI
  // Implements: Windows.Devices.I2c.II2cDevice
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.I2c.II2cDeviceStatics"
  TI2c_I2cDevice = class(TWinRTGenericImportS<I2c_II2cDeviceStatics>)
  public
    // -> I2c_II2cDeviceStatics
    class function GetDeviceSelector: HSTRING; overload; static; inline;
    class function GetDeviceSelector(friendlyName: HSTRING): HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING; settings: I2c_II2cConnectionSettings): IAsyncOperation_1__I2c_II2cDevice; static; inline;
  end;

  // Windows.Devices.I2c.I2cController
  // DualAPI
  // Implements: Windows.Devices.I2c.II2cController
  // Statics: "Windows.Devices.I2c.II2cControllerStatics"
  TI2c_I2cController = class(TWinRTGenericImportS<I2c_II2cControllerStatics>)
  public
    // -> I2c_II2cControllerStatics
    class function GetControllersAsync(provider: I2c_Provider_II2cProvider): IAsyncOperation_1__IVectorView_1__I2c_II2cController; static; inline;
    class function GetDefaultAsync: IAsyncOperation_1__I2c_II2cController; static; inline;
  end;

  // Windows.Devices.Pwm.PwmPin
  // DualAPI
  // Implements: Windows.Devices.Pwm.IPwmPin
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Pwm.PwmController
  // DualAPI
  // Implements: Windows.Devices.Pwm.IPwmController
  // Statics: "Windows.Devices.Pwm.IPwmControllerStatics2"
  // Statics: "Windows.Devices.Pwm.IPwmControllerStatics3"
  // Statics: "Windows.Devices.Pwm.IPwmControllerStatics"
  TPwm_PwmController = class(TWinRTGenericImportS3<Pwm_IPwmControllerStatics, Pwm_IPwmControllerStatics2, Pwm_IPwmControllerStatics3>)
  public
    // -> Pwm_IPwmControllerStatics2
    class function GetDefaultAsync: IAsyncOperation_1__Pwm_IPwmController; static; inline;

    // -> Pwm_IPwmControllerStatics3
    class function GetDeviceSelector: HSTRING; overload; static; inline;
    class function GetDeviceSelector(friendlyName: HSTRING): HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Pwm_IPwmController; static; inline;

    // -> Pwm_IPwmControllerStatics
    class function GetControllersAsync(provider: Pwm_Provider_IPwmProvider): IAsyncOperation_1__IVectorView_1__Pwm_IPwmController; static; inline;
  end;

  // Windows.Devices.Spi.Provider.ProviderSpiConnectionSettings
  // DualAPI
  // Implements: Windows.Devices.Spi.Provider.IProviderSpiConnectionSettings
  // Factory: "Windows.Devices.Spi.Provider.IProviderSpiConnectionSettingsFactory"
  TSpi_Provider_ProviderSpiConnectionSettings = class(TWinRTGenericImportF<Spi_Provider_IProviderSpiConnectionSettingsFactory>)
  public
    // -> Spi_Provider_IProviderSpiConnectionSettingsFactory
    class function Create(chipSelectLine: Integer): Spi_Provider_IProviderSpiConnectionSettings; static; inline;
  end;

  // Windows.Devices.Spi.SpiConnectionSettings
  // DualAPI
  // Implements: Windows.Devices.Spi.ISpiConnectionSettings
  // Factory: "Windows.Devices.Spi.ISpiConnectionSettingsFactory"
  TSpi_SpiConnectionSettings = class(TWinRTGenericImportF<Spi_ISpiConnectionSettingsFactory>)
  public
    // -> Spi_ISpiConnectionSettingsFactory
    class function Create(chipSelectLine: Integer): Spi_ISpiConnectionSettings; static; inline;
  end;

  // Windows.Devices.Spi.SpiBusInfo
  // DualAPI
  // Implements: Windows.Devices.Spi.ISpiBusInfo

  // Windows.Devices.Spi.SpiDevice
  // DualAPI
  // Implements: Windows.Devices.Spi.ISpiDevice
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.Spi.ISpiDeviceStatics"
  TSpi_SpiDevice = class(TWinRTGenericImportS<Spi_ISpiDeviceStatics>)
  public
    // -> Spi_ISpiDeviceStatics
    class function GetDeviceSelector: HSTRING; overload; static; inline;
    class function GetDeviceSelector(friendlyName: HSTRING): HSTRING; overload; static; inline;
    class function GetBusInfo(busId: HSTRING): Spi_ISpiBusInfo; static; inline;
    class function FromIdAsync(busId: HSTRING; settings: Spi_ISpiConnectionSettings): IAsyncOperation_1__Spi_ISpiDevice; static; inline;
  end;

  // Windows.Devices.Spi.SpiController
  // DualAPI
  // Implements: Windows.Devices.Spi.ISpiController
  // Statics: "Windows.Devices.Spi.ISpiControllerStatics"
  TSpi_SpiController = class(TWinRTGenericImportS<Spi_ISpiControllerStatics>)
  public
    // -> Spi_ISpiControllerStatics
    class function GetDefaultAsync: IAsyncOperation_1__Spi_ISpiController; static; inline;
    class function GetControllersAsync(provider: Spi_Provider_ISpiProvider): IAsyncOperation_1__IVectorView_1__Spi_ISpiController; static; inline;
  end;

  // Windows.Devices.LowLevelDevicesAggregateProvider
  // DualAPI
  // Implements: Windows.Devices.ILowLevelDevicesAggregateProvider
  // Factory: "Windows.Devices.ILowLevelDevicesAggregateProviderFactory"
  TLowLevelDevicesAggregateProvider = class(TWinRTGenericImportF<ILowLevelDevicesAggregateProviderFactory>)
  public
    // -> ILowLevelDevicesAggregateProviderFactory
    class function Create(adc: Adc_Provider_IAdcControllerProvider; pwm: Pwm_Provider_IPwmControllerProvider; gpio: Gpio_Provider_IGpioControllerProvider; i2c: I2c_Provider_II2cControllerProvider; spi: Spi_Provider_ISpiControllerProvider): ILowLevelDevicesAggregateProvider; static; inline;
  end;

  // Windows.Devices.LowLevelDevicesController
  // DualAPI
  // Implements: Windows.Devices.ILowLevelDevicesController
  // Statics: "Windows.Devices.ILowLevelDevicesControllerStatics"
  TLowLevelDevicesController = class(TWinRTGenericImportS<ILowLevelDevicesControllerStatics>)
  public
    // -> ILowLevelDevicesControllerStatics
    class function get_DefaultProvider: ILowLevelDevicesAggregateProvider; static; inline;
    class procedure put_DefaultProvider(value: ILowLevelDevicesAggregateProvider); static; inline;
    class property DefaultProvider: ILowLevelDevicesAggregateProvider read get_DefaultProvider write put_DefaultProvider;
  end;

  // Windows.Devices.Power.BatteryReport
  // DualAPI
  // Implements: Windows.Devices.Power.IBatteryReport

  // Windows.Devices.Power.Battery
  // DualAPI
  // Implements: Windows.Devices.Power.IBattery
  // Statics: "Windows.Devices.Power.IBatteryStatics"
  TPower_Battery = class(TWinRTGenericImportS<Power_IBatteryStatics>)
  public
    // -> Power_IBatteryStatics
    class function get_AggregateBattery: Power_IBattery; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Power_IBattery; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
    class property AggregateBattery: Power_IBattery read get_AggregateBattery;
  end;

  // Windows.Devices.Haptics.SimpleHapticsControllerFeedback
  // DualAPI
  // Implements: Windows.Devices.Haptics.ISimpleHapticsControllerFeedback

  // Windows.Devices.Haptics.SimpleHapticsController
  // DualAPI
  // Implements: Windows.Devices.Haptics.ISimpleHapticsController

  // Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms
  // DualAPI
  // Statics: "Windows.Devices.Haptics.IKnownSimpleHapticsControllerWaveformsStatics"
  THaptics_KnownSimpleHapticsControllerWaveforms = class(TWinRTGenericImportS<Haptics_IKnownSimpleHapticsControllerWaveformsStatics>)
  public
    // -> Haptics_IKnownSimpleHapticsControllerWaveformsStatics
    class function get_Click: Word; static; inline;
    class function get_BuzzContinuous: Word; static; inline;
    class function get_RumbleContinuous: Word; static; inline;
    class function get_Press: Word; static; inline;
    class function get_Release: Word; static; inline;
    class property BuzzContinuous: Word read get_BuzzContinuous;
    class property Click: Word read get_Click;
    class property Press: Word read get_Press;
    class property Release: Word read get_Release;
    class property RumbleContinuous: Word read get_RumbleContinuous;
  end;

  // Windows.Devices.Haptics.VibrationDevice
  // DualAPI
  // Implements: Windows.Devices.Haptics.IVibrationDevice
  // Statics: "Windows.Devices.Haptics.IVibrationDeviceStatics"
  THaptics_VibrationDevice = class(TWinRTGenericImportS<Haptics_IVibrationDeviceStatics>)
  public
    // -> Haptics_IVibrationDeviceStatics
    class function RequestAccessAsync: IAsyncOperation_1__Haptics_VibrationAccessStatus; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Haptics_IVibrationDevice; static; inline;
    class function GetDefaultAsync: IAsyncOperation_1__Haptics_IVibrationDevice; static; inline;
    class function FindAllAsync: IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice; static; inline;
  end;

  // Windows.Devices.HumanInterfaceDevice.HidDevice
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidDevice
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.HumanInterfaceDevice.IHidDeviceStatics"
  THumanInterfaceDevice_HidDevice = class(TWinRTGenericImportS<HumanInterfaceDevice_IHidDeviceStatics>)
  public
    // -> HumanInterfaceDevice_IHidDeviceStatics
    class function GetDeviceSelector(usagePage: Word; usageId: Word): HSTRING; overload; static; inline;
    class function GetDeviceSelector(usagePage: Word; usageId: Word; vendorId: Word; productId: Word): HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING; accessMode: FileAccessMode): IAsyncOperation_1__HumanInterfaceDevice_IHidDevice; static; inline;
  end;

  // Windows.Devices.HumanInterfaceDevice.HidInputReport
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidInputReport

  // Windows.Devices.HumanInterfaceDevice.HidFeatureReport
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidFeatureReport

  // Windows.Devices.HumanInterfaceDevice.HidOutputReport
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidOutputReport

  // Windows.Devices.HumanInterfaceDevice.HidBooleanControlDescription
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidBooleanControlDescription2

  // Windows.Devices.HumanInterfaceDevice.HidNumericControlDescription
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidNumericControlDescription

  // Windows.Devices.HumanInterfaceDevice.HidInputReportReceivedEventArgs
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidInputReportReceivedEventArgs

  // Windows.Devices.HumanInterfaceDevice.HidCollection
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidCollection

  // Windows.Devices.HumanInterfaceDevice.HidBooleanControl
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidBooleanControl

  // Windows.Devices.HumanInterfaceDevice.HidNumericControl
  // DualAPI
  // Implements: Windows.Devices.HumanInterfaceDevice.IHidNumericControl

  // Windows.Devices.Perception.Provider.PerceptionFrameProviderInfo
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionFrameProviderInfo
  // Instantiable: "Perception_Provider_IPerceptionFrameProviderInfo"
  TPerception_Provider_PerceptionFrameProviderInfo = class(TWinRTGenericImportI<Perception_Provider_IPerceptionFrameProviderInfo>) end;

  // Windows.Devices.Perception.Provider.PerceptionPropertyChangeRequest
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionPropertyChangeRequest

  // Windows.Devices.Perception.Provider.PerceptionFaceAuthenticationGroup
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroup
  // Factory: "Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroupFactory"
  TPerception_Provider_PerceptionFaceAuthenticationGroup = class(TWinRTGenericImportF<Perception_Provider_IPerceptionFaceAuthenticationGroupFactory>)
  public
    // -> Perception_Provider_IPerceptionFaceAuthenticationGroupFactory
    class function Create(ids: IIterable_1__HSTRING; startHandler: Perception_Provider_PerceptionStartFaceAuthenticationHandler; stopHandler: Perception_Provider_PerceptionStopFaceAuthenticationHandler): Perception_Provider_IPerceptionFaceAuthenticationGroup; static; inline;
  end;

  // Windows.Devices.Perception.Provider.PerceptionControlGroup
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionControlGroup
  // Factory: "Windows.Devices.Perception.Provider.IPerceptionControlGroupFactory"
  TPerception_Provider_PerceptionControlGroup = class(TWinRTGenericImportF<Perception_Provider_IPerceptionControlGroupFactory>)
  public
    // -> Perception_Provider_IPerceptionControlGroupFactory
    class function Create(ids: IIterable_1__HSTRING): Perception_Provider_IPerceptionControlGroup; static; inline;
  end;

  // Windows.Devices.Perception.Provider.PerceptionCorrelationGroup
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionCorrelationGroup
  // Factory: "Windows.Devices.Perception.Provider.IPerceptionCorrelationGroupFactory"
  TPerception_Provider_PerceptionCorrelationGroup = class(TWinRTGenericImportF<Perception_Provider_IPerceptionCorrelationGroupFactory>)
  public
    // -> Perception_Provider_IPerceptionCorrelationGroupFactory
    class function Create(relativeLocations: IIterable_1__Perception_Provider_IPerceptionCorrelation): Perception_Provider_IPerceptionCorrelationGroup; static; inline;
  end;

  // Windows.Devices.Perception.Provider.PerceptionFrame
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionFrame

  // Windows.Devices.Perception.Provider.PerceptionCorrelation
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionCorrelation
  // Factory: "Windows.Devices.Perception.Provider.IPerceptionCorrelationFactory"
  TPerception_Provider_PerceptionCorrelation = class(TWinRTGenericImportF<Perception_Provider_IPerceptionCorrelationFactory>)
  public
    // -> Perception_Provider_IPerceptionCorrelationFactory
    class function Create(targetId: HSTRING; position: Numerics_Vector3; orientation: Numerics_Quaternion): Perception_Provider_IPerceptionCorrelation; static; inline;
  end;

  // Windows.Devices.Perception.Provider.PerceptionVideoFrameAllocator
  // DualAPI
  // Implements: Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocator
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocatorFactory"
  TPerception_Provider_PerceptionVideoFrameAllocator = class(TWinRTGenericImportF<Perception_Provider_IPerceptionVideoFrameAllocatorFactory>)
  public
    // -> Perception_Provider_IPerceptionVideoFrameAllocatorFactory
    class function Create(maxOutstandingFrameCountForWrite: Cardinal; format: Imaging_BitmapPixelFormat; resolution: TSizeF; alpha: Imaging_BitmapAlphaMode): Perception_Provider_IPerceptionVideoFrameAllocator; static; inline;
  end;

  // Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService
  // DualAPI
  // Statics: "Windows.Devices.Perception.Provider.IPerceptionFrameProviderManagerServiceStatics"
  TPerception_Provider_PerceptionFrameProviderManagerService = class(TWinRTGenericImportS<Perception_Provider_IPerceptionFrameProviderManagerServiceStatics>)
  public
    // -> Perception_Provider_IPerceptionFrameProviderManagerServiceStatics
    class procedure RegisterFrameProviderInfo(manager: Perception_Provider_IPerceptionFrameProviderManager; frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo); static; inline;
    class procedure UnregisterFrameProviderInfo(manager: Perception_Provider_IPerceptionFrameProviderManager; frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo); static; inline;
    class procedure RegisterFaceAuthenticationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; faceAuthenticationGroup: Perception_Provider_IPerceptionFaceAuthenticationGroup); static; inline;
    class procedure UnregisterFaceAuthenticationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; faceAuthenticationGroup: Perception_Provider_IPerceptionFaceAuthenticationGroup); static; inline;
    class procedure RegisterControlGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; controlGroup: Perception_Provider_IPerceptionControlGroup); static; inline;
    class procedure UnregisterControlGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; controlGroup: Perception_Provider_IPerceptionControlGroup); static; inline;
    class procedure RegisterCorrelationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; correlationGroup: Perception_Provider_IPerceptionCorrelationGroup); static; inline;
    class procedure UnregisterCorrelationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; correlationGroup: Perception_Provider_IPerceptionCorrelationGroup); static; inline;
    class procedure UpdateAvailabilityForProvider(provider: Perception_Provider_IPerceptionFrameProvider; available: Boolean); static; inline;
    class procedure PublishFrameForProvider(provider: Perception_Provider_IPerceptionFrameProvider; frame: Perception_Provider_IPerceptionFrame); static; inline;
  end;

  // Windows.Devices.Perception.Provider.KnownPerceptionFrameKind
  // DualAPI
  // Statics: "Windows.Devices.Perception.Provider.IKnownPerceptionFrameKindStatics"
  TPerception_Provider_KnownPerceptionFrameKind = class(TWinRTGenericImportS<Perception_Provider_IKnownPerceptionFrameKindStatics>)
  public
    // -> Perception_Provider_IKnownPerceptionFrameKindStatics
    class function get_Color: HSTRING; static; inline;
    class function get_Depth: HSTRING; static; inline;
    class function get_Infrared: HSTRING; static; inline;
    class property Color: HSTRING read get_Color;
    class property Depth: HSTRING read get_Depth;
    class property Infrared: HSTRING read get_Infrared;
  end;

  // Windows.Devices.Perception.PerceptionColorFrameSourceWatcher
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameSourceWatcher

  // Windows.Devices.Perception.PerceptionColorFrameSourceAddedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameSourceAddedEventArgs

  // Windows.Devices.Perception.PerceptionColorFrameSourceRemovedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameSourceRemovedEventArgs

  // Windows.Devices.Perception.PerceptionDepthFrameSourceWatcher
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameSourceWatcher

  // Windows.Devices.Perception.PerceptionDepthFrameSourceAddedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameSourceAddedEventArgs

  // Windows.Devices.Perception.PerceptionDepthFrameSourceRemovedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameSourceRemovedEventArgs

  // Windows.Devices.Perception.PerceptionInfraredFrameSourceWatcher
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameSourceWatcher

  // Windows.Devices.Perception.PerceptionInfraredFrameSourceAddedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameSourceAddedEventArgs

  // Windows.Devices.Perception.PerceptionInfraredFrameSourceRemovedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameSourceRemovedEventArgs

  // Windows.Devices.Perception.PerceptionColorFrameSource
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameSource
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameSource2
  // Statics: "Windows.Devices.Perception.IPerceptionColorFrameSourceStatics"
  TPerception_PerceptionColorFrameSource = class(TWinRTGenericImportS<Perception_IPerceptionColorFrameSourceStatics>)
  public
    // -> Perception_IPerceptionColorFrameSourceStatics
    class function CreateWatcher: Perception_IPerceptionColorFrameSourceWatcher; static; inline;
    class function FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource; static; inline;
    class function FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionColorFrameSource; static; inline;
    class function RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; static; inline;
  end;

  // Windows.Devices.Perception.PerceptionDepthFrameSource
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameSource
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameSource2
  // Statics: "Windows.Devices.Perception.IPerceptionDepthFrameSourceStatics"
  TPerception_PerceptionDepthFrameSource = class(TWinRTGenericImportS<Perception_IPerceptionDepthFrameSourceStatics>)
  public
    // -> Perception_IPerceptionDepthFrameSourceStatics
    class function CreateWatcher: Perception_IPerceptionDepthFrameSourceWatcher; static; inline;
    class function FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource; static; inline;
    class function FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionDepthFrameSource; static; inline;
    class function RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; static; inline;
  end;

  // Windows.Devices.Perception.PerceptionInfraredFrameSource
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameSource
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameSource2
  // Statics: "Windows.Devices.Perception.IPerceptionInfraredFrameSourceStatics"
  TPerception_PerceptionInfraredFrameSource = class(TWinRTGenericImportS<Perception_IPerceptionInfraredFrameSourceStatics>)
  public
    // -> Perception_IPerceptionInfraredFrameSourceStatics
    class function CreateWatcher: Perception_IPerceptionInfraredFrameSourceWatcher; static; inline;
    class function FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource; static; inline;
    class function FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource; static; inline;
    class function RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus; static; inline;
  end;

  // Windows.Devices.Perception.PerceptionControlSession
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionControlSession
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.PerceptionFrameSourcePropertyChangeResult
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionFrameSourcePropertyChangeResult

  // Windows.Devices.Perception.PerceptionFrameSourcePropertiesChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionFrameSourcePropertiesChangedEventArgs

  // Windows.Devices.Perception.PerceptionVideoProfile
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionVideoProfile

  // Windows.Devices.Perception.PerceptionDepthCorrelatedCameraIntrinsics
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthCorrelatedCameraIntrinsics

  // Windows.Devices.Perception.PerceptionDepthCorrelatedCoordinateMapper
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthCorrelatedCoordinateMapper

  // Windows.Devices.Perception.PerceptionColorFrameReader
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameReader
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.PerceptionDepthFrameReader
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameReader
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.PerceptionInfraredFrameReader
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameReader
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.PerceptionColorFrameArrivedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrameArrivedEventArgs

  // Windows.Devices.Perception.PerceptionColorFrame
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionColorFrame
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.PerceptionDepthFrameArrivedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrameArrivedEventArgs

  // Windows.Devices.Perception.PerceptionDepthFrame
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionDepthFrame
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.PerceptionInfraredFrameArrivedEventArgs
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrameArrivedEventArgs

  // Windows.Devices.Perception.PerceptionInfraredFrame
  // DualAPI
  // Implements: Windows.Devices.Perception.IPerceptionInfraredFrame
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.Perception.KnownPerceptionFrameSourceProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownPerceptionFrameSourcePropertiesStatics"
  // Statics: "Windows.Devices.Perception.IKnownPerceptionFrameSourcePropertiesStatics2"
  TPerception_KnownPerceptionFrameSourceProperties = class(TWinRTGenericImportS2<Perception_IKnownPerceptionFrameSourcePropertiesStatics, Perception_IKnownPerceptionFrameSourcePropertiesStatics2>)
  public
    // -> Perception_IKnownPerceptionFrameSourcePropertiesStatics
    class function get_Id: HSTRING; static; inline;
    class function get_PhysicalDeviceIds: HSTRING; static; inline;
    class function get_FrameKind: HSTRING; static; inline;
    class function get_DeviceModelVersion: HSTRING; static; inline;
    class function get_EnclosureLocation: HSTRING; static; inline;
    class property DeviceModelVersion: HSTRING read get_DeviceModelVersion;
    class property EnclosureLocation: HSTRING read get_EnclosureLocation;
    class property FrameKind: HSTRING read get_FrameKind;
    class property Id: HSTRING read get_Id;
    class property PhysicalDeviceIds: HSTRING read get_PhysicalDeviceIds;

    // -> Perception_IKnownPerceptionFrameSourcePropertiesStatics2
    class function get_DeviceId: HSTRING; static; inline;
    class property DeviceId: HSTRING read get_DeviceId;
  end;

  // Windows.Devices.Perception.KnownPerceptionVideoFrameSourceProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownPerceptionVideoFrameSourcePropertiesStatics"
  TPerception_KnownPerceptionVideoFrameSourceProperties = class(TWinRTGenericImportS<Perception_IKnownPerceptionVideoFrameSourcePropertiesStatics>)
  public
    // -> Perception_IKnownPerceptionVideoFrameSourcePropertiesStatics
    class function get_VideoProfile: HSTRING; static; inline;
    class function get_SupportedVideoProfiles: HSTRING; static; inline;
    class function get_AvailableVideoProfiles: HSTRING; static; inline;
    class function get_IsMirrored: HSTRING; static; inline;
    class function get_CameraIntrinsics: HSTRING; static; inline;
    class property AvailableVideoProfiles: HSTRING read get_AvailableVideoProfiles;
    class property CameraIntrinsics: HSTRING read get_CameraIntrinsics;
    class property IsMirrored: HSTRING read get_IsMirrored;
    class property SupportedVideoProfiles: HSTRING read get_SupportedVideoProfiles;
    class property VideoProfile: HSTRING read get_VideoProfile;
  end;

  // Windows.Devices.Perception.KnownPerceptionInfraredFrameSourceProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownPerceptionInfraredFrameSourcePropertiesStatics"
  TPerception_KnownPerceptionInfraredFrameSourceProperties = class(TWinRTGenericImportS<Perception_IKnownPerceptionInfraredFrameSourcePropertiesStatics>)
  public
    // -> Perception_IKnownPerceptionInfraredFrameSourcePropertiesStatics
    class function get_Exposure: HSTRING; static; inline;
    class function get_AutoExposureEnabled: HSTRING; static; inline;
    class function get_ExposureCompensation: HSTRING; static; inline;
    class function get_ActiveIlluminationEnabled: HSTRING; static; inline;
    class function get_AmbientSubtractionEnabled: HSTRING; static; inline;
    class function get_StructureLightPatternEnabled: HSTRING; static; inline;
    class function get_InterleavedIlluminationEnabled: HSTRING; static; inline;
    class property ActiveIlluminationEnabled: HSTRING read get_ActiveIlluminationEnabled;
    class property AmbientSubtractionEnabled: HSTRING read get_AmbientSubtractionEnabled;
    class property AutoExposureEnabled: HSTRING read get_AutoExposureEnabled;
    class property Exposure: HSTRING read get_Exposure;
    class property ExposureCompensation: HSTRING read get_ExposureCompensation;
    class property InterleavedIlluminationEnabled: HSTRING read get_InterleavedIlluminationEnabled;
    class property StructureLightPatternEnabled: HSTRING read get_StructureLightPatternEnabled;
  end;

  // Windows.Devices.Perception.KnownPerceptionDepthFrameSourceProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownPerceptionDepthFrameSourcePropertiesStatics"
  TPerception_KnownPerceptionDepthFrameSourceProperties = class(TWinRTGenericImportS<Perception_IKnownPerceptionDepthFrameSourcePropertiesStatics>)
  public
    // -> Perception_IKnownPerceptionDepthFrameSourcePropertiesStatics
    class function get_MinDepth: HSTRING; static; inline;
    class function get_MaxDepth: HSTRING; static; inline;
    class property MaxDepth: HSTRING read get_MaxDepth;
    class property MinDepth: HSTRING read get_MinDepth;
  end;

  // Windows.Devices.Perception.KnownPerceptionColorFrameSourceProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownPerceptionColorFrameSourcePropertiesStatics"
  TPerception_KnownPerceptionColorFrameSourceProperties = class(TWinRTGenericImportS<Perception_IKnownPerceptionColorFrameSourcePropertiesStatics>)
  public
    // -> Perception_IKnownPerceptionColorFrameSourcePropertiesStatics
    class function get_Exposure: HSTRING; static; inline;
    class function get_AutoExposureEnabled: HSTRING; static; inline;
    class function get_ExposureCompensation: HSTRING; static; inline;
    class property AutoExposureEnabled: HSTRING read get_AutoExposureEnabled;
    class property Exposure: HSTRING read get_Exposure;
    class property ExposureCompensation: HSTRING read get_ExposureCompensation;
  end;

  // Windows.Devices.Perception.KnownPerceptionVideoProfileProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownPerceptionVideoProfilePropertiesStatics"
  TPerception_KnownPerceptionVideoProfileProperties = class(TWinRTGenericImportS<Perception_IKnownPerceptionVideoProfilePropertiesStatics>)
  public
    // -> Perception_IKnownPerceptionVideoProfilePropertiesStatics
    class function get_BitmapPixelFormat: HSTRING; static; inline;
    class function get_BitmapAlphaMode: HSTRING; static; inline;
    class function get_Width: HSTRING; static; inline;
    class function get_Height: HSTRING; static; inline;
    class function get_FrameDuration: HSTRING; static; inline;
    class property BitmapAlphaMode: HSTRING read get_BitmapAlphaMode;
    class property BitmapPixelFormat: HSTRING read get_BitmapPixelFormat;
    class property FrameDuration: HSTRING read get_FrameDuration;
    class property Height: HSTRING read get_Height;
    class property Width: HSTRING read get_Width;
  end;

  // Windows.Devices.Perception.KnownCameraIntrinsicsProperties
  // DualAPI
  // Statics: "Windows.Devices.Perception.IKnownCameraIntrinsicsPropertiesStatics"
  TPerception_KnownCameraIntrinsicsProperties = class(TWinRTGenericImportS<Perception_IKnownCameraIntrinsicsPropertiesStatics>)
  public
    // -> Perception_IKnownCameraIntrinsicsPropertiesStatics
    class function get_FocalLength: HSTRING; static; inline;
    class function get_PrincipalPoint: HSTRING; static; inline;
    class function get_RadialDistortion: HSTRING; static; inline;
    class function get_TangentialDistortion: HSTRING; static; inline;
    class property FocalLength: HSTRING read get_FocalLength;
    class property PrincipalPoint: HSTRING read get_PrincipalPoint;
    class property RadialDistortion: HSTRING read get_RadialDistortion;
    class property TangentialDistortion: HSTRING read get_TangentialDistortion;
  end;

  // Windows.Devices.Radios.Radio
  // DualAPI
  // Implements: Windows.Devices.Radios.IRadio
  // Statics: "Windows.Devices.Radios.IRadioStatics"
  TRadios_Radio = class(TWinRTGenericImportS<Radios_IRadioStatics>)
  public
    // -> Radios_IRadioStatics
    class function GetRadiosAsync: IAsyncOperation_1__IVectorView_1__Radios_IRadio; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Radios_IRadio; static; inline;
    class function RequestAccessAsync: IAsyncOperation_1__Radios_RadioAccessStatus; static; inline;
  end;

  // Windows.Devices.SerialCommunication.SerialDevice
  // DualAPI
  // Implements: Windows.Devices.SerialCommunication.ISerialDevice
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.SerialCommunication.ISerialDeviceStatics"
  TSerialCommunication_SerialDevice = class(TWinRTGenericImportS<SerialCommunication_ISerialDeviceStatics>)
  public
    // -> SerialCommunication_ISerialDeviceStatics
    class function GetDeviceSelector: HSTRING; overload; static; inline;
    class function GetDeviceSelector(portName: HSTRING): HSTRING; overload; static; inline;
    class function GetDeviceSelectorFromUsbVidPid(vendorId: Word; productId: Word): HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__SerialCommunication_ISerialDevice; static; inline;
  end;

  // Windows.Devices.SerialCommunication.ErrorReceivedEventArgs
  // DualAPI
  // Implements: Windows.Devices.SerialCommunication.IErrorReceivedEventArgs

  // Windows.Devices.SerialCommunication.PinChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.SerialCommunication.IPinChangedEventArgs

  // Windows.Devices.Usb.UsbControlRequestType
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbControlRequestType
  // Instantiable: "Usb_IUsbControlRequestType"
  TUsb_UsbControlRequestType = class(TWinRTGenericImportI<Usb_IUsbControlRequestType>) end;

  // Windows.Devices.Usb.UsbSetupPacket
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbSetupPacket
  // Factory: "Windows.Devices.Usb.IUsbSetupPacketFactory"
  // Instantiable: "Usb_IUsbSetupPacket"
  TUsb_UsbSetupPacket = class(TWinRTGenericImportFI<Usb_IUsbSetupPacketFactory, Usb_IUsbSetupPacket>)
  public
    // -> Usb_IUsbSetupPacketFactory
    class function CreateWithEightByteBuffer(eightByteBuffer: IBuffer): Usb_IUsbSetupPacket; static; inline;
  end;

  // Windows.Devices.Usb.UsbDeviceClass
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbDeviceClass
  // Instantiable: "Usb_IUsbDeviceClass"
  TUsb_UsbDeviceClass = class(TWinRTGenericImportI<Usb_IUsbDeviceClass>) end;

  // Windows.Devices.Usb.UsbDeviceClasses
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbDeviceClasses
  // Statics: "Windows.Devices.Usb.IUsbDeviceClassesStatics"
  TUsb_UsbDeviceClasses = class(TWinRTGenericImportS<Usb_IUsbDeviceClassesStatics>)
  public
    // -> Usb_IUsbDeviceClassesStatics
    class function get_CdcControl: Usb_IUsbDeviceClass; static; inline;
    class function get_Physical: Usb_IUsbDeviceClass; static; inline;
    class function get_PersonalHealthcare: Usb_IUsbDeviceClass; static; inline;
    class function get_ActiveSync: Usb_IUsbDeviceClass; static; inline;
    class function get_PalmSync: Usb_IUsbDeviceClass; static; inline;
    class function get_DeviceFirmwareUpdate: Usb_IUsbDeviceClass; static; inline;
    class function get_Irda: Usb_IUsbDeviceClass; static; inline;
    class function get_Measurement: Usb_IUsbDeviceClass; static; inline;
    class function get_VendorSpecific: Usb_IUsbDeviceClass; static; inline;
    class property ActiveSync: Usb_IUsbDeviceClass read get_ActiveSync;
    class property CdcControl: Usb_IUsbDeviceClass read get_CdcControl;
    class property DeviceFirmwareUpdate: Usb_IUsbDeviceClass read get_DeviceFirmwareUpdate;
    class property Irda: Usb_IUsbDeviceClass read get_Irda;
    class property Measurement: Usb_IUsbDeviceClass read get_Measurement;
    class property PalmSync: Usb_IUsbDeviceClass read get_PalmSync;
    class property PersonalHealthcare: Usb_IUsbDeviceClass read get_PersonalHealthcare;
    class property Physical: Usb_IUsbDeviceClass read get_Physical;
    class property VendorSpecific: Usb_IUsbDeviceClass read get_VendorSpecific;
  end;

  // Windows.Devices.Usb.UsbDevice
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbDevice
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.Usb.IUsbDeviceStatics"
  TUsb_UsbDevice = class(TWinRTGenericImportS<Usb_IUsbDeviceStatics>)
  public
    // -> Usb_IUsbDeviceStatics
    class function GetDeviceSelector(vendorId: Cardinal; productId: Cardinal; winUsbInterfaceClass: TGuid): HSTRING; overload; static; inline;
    class function GetDeviceSelector(winUsbInterfaceClass: TGuid): HSTRING; overload; static; inline;
    class function GetDeviceSelector(vendorId: Cardinal; productId: Cardinal): HSTRING; overload; static; inline;
    class function GetDeviceClassSelector(usbClass: Usb_IUsbDeviceClass): HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Usb_IUsbDevice; static; inline;
  end;

  // Windows.Devices.Usb.UsbInterface
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterface

  // Windows.Devices.Usb.UsbDeviceDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbDeviceDescriptor

  // Windows.Devices.Usb.UsbConfiguration
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbConfiguration

  // Windows.Devices.Usb.UsbDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbDescriptor

  // Windows.Devices.Usb.UsbConfigurationDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbConfigurationDescriptor
  // Statics: "Windows.Devices.Usb.IUsbConfigurationDescriptorStatics"
  TUsb_UsbConfigurationDescriptor = class(TWinRTGenericImportS<Usb_IUsbConfigurationDescriptorStatics>)
  public
    // -> Usb_IUsbConfigurationDescriptorStatics
    class function TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbConfigurationDescriptor): Boolean; static; inline;
    class function Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbConfigurationDescriptor; static; inline;
  end;

  // Windows.Devices.Usb.UsbInterfaceDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterfaceDescriptor
  // Statics: "Windows.Devices.Usb.IUsbInterfaceDescriptorStatics"
  TUsb_UsbInterfaceDescriptor = class(TWinRTGenericImportS<Usb_IUsbInterfaceDescriptorStatics>)
  public
    // -> Usb_IUsbInterfaceDescriptorStatics
    class function TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbInterfaceDescriptor): Boolean; static; inline;
    class function Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbInterfaceDescriptor; static; inline;
  end;

  // Windows.Devices.Usb.UsbBulkInEndpointDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbBulkInEndpointDescriptor

  // Windows.Devices.Usb.UsbInterruptInEndpointDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterruptInEndpointDescriptor

  // Windows.Devices.Usb.UsbBulkOutEndpointDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbBulkOutEndpointDescriptor

  // Windows.Devices.Usb.UsbInterruptOutEndpointDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterruptOutEndpointDescriptor

  // Windows.Devices.Usb.UsbEndpointDescriptor
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbEndpointDescriptor
  // Statics: "Windows.Devices.Usb.IUsbEndpointDescriptorStatics"
  TUsb_UsbEndpointDescriptor = class(TWinRTGenericImportS<Usb_IUsbEndpointDescriptorStatics>)
  public
    // -> Usb_IUsbEndpointDescriptorStatics
    class function TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbEndpointDescriptor): Boolean; static; inline;
    class function Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbEndpointDescriptor; static; inline;
  end;

  // Windows.Devices.Usb.UsbInterruptInEventArgs
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterruptInEventArgs

  // Windows.Devices.Usb.UsbInterruptInPipe
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterruptInPipe

  // Windows.Devices.Usb.UsbBulkInPipe
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbBulkInPipe

  // Windows.Devices.Usb.UsbBulkOutPipe
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbBulkOutPipe

  // Windows.Devices.Usb.UsbInterruptOutPipe
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterruptOutPipe

  // Windows.Devices.Usb.UsbInterfaceSetting
  // DualAPI
  // Implements: Windows.Devices.Usb.IUsbInterfaceSetting

  // Windows.Devices.WiFi.WiFiAdapter
  // DualAPI
  // Implements: Windows.Devices.WiFi.IWiFiAdapter
  // Implements: Windows.Devices.WiFi.IWiFiAdapter2
  // Statics: "Windows.Devices.WiFi.IWiFiAdapterStatics"
  TWiFi_WiFiAdapter = class(TWinRTGenericImportS<WiFi_IWiFiAdapterStatics>)
  public
    // -> WiFi_IWiFiAdapterStatics
    class function FindAllAdaptersAsync: IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFi_IWiFiAdapter; static; inline;
    class function RequestAccessAsync: IAsyncOperation_1__WiFi_WiFiAccessStatus; static; inline;
  end;

  // Windows.Devices.WiFi.WiFiNetworkReport
  // DualAPI
  // Implements: Windows.Devices.WiFi.IWiFiNetworkReport

  // Windows.Devices.WiFi.WiFiAvailableNetwork
  // DualAPI
  // Implements: Windows.Devices.WiFi.IWiFiAvailableNetwork

  // Windows.Devices.WiFi.WiFiConnectionResult
  // DualAPI
  // Implements: Windows.Devices.WiFi.IWiFiConnectionResult

  // Windows.Devices.WiFiDirect.WiFiDirectDevice
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectDevice
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Devices.WiFiDirect.IWiFiDirectDeviceStatics"
  // Statics: "Windows.Devices.WiFiDirect.IWiFiDirectDeviceStatics2"
  TWiFiDirect_WiFiDirectDevice = class(TWinRTGenericImportS2<WiFiDirect_IWiFiDirectDeviceStatics, WiFiDirect_IWiFiDirectDeviceStatics2>)
  public
    // -> WiFiDirect_IWiFiDirectDeviceStatics
    class function GetDeviceSelector: HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice; overload; static; inline;

    // -> WiFiDirect_IWiFiDirectDeviceStatics2
    class function GetDeviceSelector(&type: WiFiDirect_WiFiDirectDeviceSelectorType): HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING; connectionParameters: WiFiDirect_IWiFiDirectConnectionParameters): IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice; overload; static; inline;
  end;

  // Windows.Devices.WiFiDirect.WiFiDirectConnectionParameters
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectConnectionParameters2
  // Implements: Windows.Devices.Enumeration.IDevicePairingSettings
  // Statics: "Windows.Devices.WiFiDirect.IWiFiDirectConnectionParametersStatics"
  // Instantiable: "WiFiDirect_IWiFiDirectConnectionParameters"
  TWiFiDirect_WiFiDirectConnectionParameters = class(TWinRTGenericImportSI<WiFiDirect_IWiFiDirectConnectionParametersStatics, WiFiDirect_IWiFiDirectConnectionParameters>)
  public
    // -> WiFiDirect_IWiFiDirectConnectionParametersStatics
    class function GetDevicePairingKinds(configurationMethod: WiFiDirect_WiFiDirectConfigurationMethod): DevicePairingKinds; static; inline;
  end;

  // Windows.Devices.WiFiDirect.WiFiDirectInformationElement
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectInformationElement
  // Statics: "Windows.Devices.WiFiDirect.IWiFiDirectInformationElementStatics"
  // Instantiable: "WiFiDirect_IWiFiDirectInformationElement"
  TWiFiDirect_WiFiDirectInformationElement = class(TWinRTGenericImportSI<WiFiDirect_IWiFiDirectInformationElementStatics, WiFiDirect_IWiFiDirectInformationElement>)
  public
    // -> WiFiDirect_IWiFiDirectInformationElementStatics
    class function CreateFromBuffer(buffer: IBuffer): IVector_1__WiFiDirect_IWiFiDirectInformationElement; static; inline;
    class function CreateFromDeviceInformation(deviceInformation: IDeviceInformation): IVector_1__WiFiDirect_IWiFiDirectInformationElement; static; inline;
  end;

  // Windows.Devices.WiFiDirect.WiFiDirectLegacySettings
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectLegacySettings

  // Windows.Devices.WiFiDirect.WiFiDirectAdvertisement
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectAdvertisement2

  // Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisherStatusChangedEventArgs
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisherStatusChangedEventArgs

  // Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisher
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectAdvertisementPublisher
  // Instantiable: "WiFiDirect_IWiFiDirectAdvertisementPublisher"
  TWiFiDirect_WiFiDirectAdvertisementPublisher = class(TWinRTGenericImportI<WiFiDirect_IWiFiDirectAdvertisementPublisher>) end;

  // Windows.Devices.WiFiDirect.WiFiDirectConnectionRequest
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequest
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.WiFiDirect.WiFiDirectConnectionRequestedEventArgs
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectConnectionRequestedEventArgs

  // Windows.Devices.WiFiDirect.WiFiDirectConnectionListener
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.IWiFiDirectConnectionListener
  // Instantiable: "WiFiDirect_IWiFiDirectConnectionListener"
  TWiFiDirect_WiFiDirectConnectionListener = class(TWinRTGenericImportI<WiFiDirect_IWiFiDirectConnectionListener>) end;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceProvisioningInfo
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceProvisioningInfo

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSession
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSession
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAutoAcceptSessionConnectedEventArgs
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceRemotePortAddedEventArgs
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceRemotePortAddedEventArgs

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionDeferredEventArgs
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionDeferredEventArgs

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionRequest
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequest
  // Implements: Windows.Foundation.IClosable

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceSessionRequestedEventArgs
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceSessionRequestedEventArgs

  // Windows.Devices.WiFiDirect.Services.WiFiDirectServiceAdvertiser
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiser
  // Factory: "Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiserFactory"
  TWiFiDirect_Services_WiFiDirectServiceAdvertiser = class(TWinRTGenericImportF<WiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory>)
  public
    // -> WiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory
    class function CreateWiFiDirectServiceAdvertiser(serviceName: HSTRING): WiFiDirect_Services_IWiFiDirectServiceAdvertiser; static; inline;
  end;

  // Windows.Devices.WiFiDirect.Services.WiFiDirectService
  // DualAPI
  // Implements: Windows.Devices.WiFiDirect.Services.IWiFiDirectService
  // Statics: "Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceStatics"
  TWiFiDirect_Services_WiFiDirectService = class(TWinRTGenericImportS<WiFiDirect_Services_IWiFiDirectServiceStatics>)
  public
    // -> WiFiDirect_Services_IWiFiDirectServiceStatics
    class function GetSelector(serviceName: HSTRING): HSTRING; overload; static; inline;
    class function GetSelector(serviceName: HSTRING; serviceInfoFilter: IBuffer): HSTRING; overload; static; inline;
    class function FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TCustom_IOControlCode }
// Factories for : "Custom_IOControlCode"
// Factory: "Windows.Devices.Custom.IIOControlCodeFactory"
// -> Custom_IIOControlCodeFactory

class function TCustom_IOControlCode.CreateIOControlCode(deviceType: Word; &function: Word; accessMode: Custom_IOControlAccessMode; bufferingMethod: Custom_IOControlBufferingMethod): Custom_IIOControlCode;
begin
  Result := Factory.CreateIOControlCode(deviceType, &function, accessMode, bufferingMethod);
end;


 { TCustom_CustomDevice }

class function TCustom_CustomDevice.GetDeviceSelector(classGuid: TGuid): HSTRING;
begin
  Result := Statics.GetDeviceSelector(classGuid);
end;

class function TCustom_CustomDevice.FromIdAsync(deviceId: HSTRING; desiredAccess: Custom_DeviceAccessMode; sharingMode: Custom_DeviceSharingMode): IAsyncOperation_1__Custom_ICustomDevice;
begin
  Result := Statics.FromIdAsync(deviceId, desiredAccess, sharingMode);
end;


 { TAdc_AdcController }

class function TAdc_AdcController.GetControllersAsync(provider: Adc_Provider_IAdcProvider): IAsyncOperation_1__IVectorView_1__Adc_IAdcController;
begin
  Result := Statics.GetControllersAsync(provider);
end;


class function TAdc_AdcController.GetDefaultAsync: IAsyncOperation_1__Adc_IAdcController;
begin
  Result := Statics2.GetDefaultAsync;
end;


 { TGpio_Provider_GpioPinProviderValueChangedEventArgs }
// Factories for : "Gpio_Provider_GpioPinProviderValueChangedEventArgs"
// Factory: "Windows.Devices.Gpio.Provider.IGpioPinProviderValueChangedEventArgsFactory"
// -> Gpio_Provider_IGpioPinProviderValueChangedEventArgsFactory

class function TGpio_Provider_GpioPinProviderValueChangedEventArgs.Create(edge: Gpio_Provider_ProviderGpioPinEdge): Gpio_Provider_IGpioPinProviderValueChangedEventArgs;
begin
  Result := Factory.Create(edge);
end;


 { TGpio_GpioController }

class function TGpio_GpioController.GetDefault: Gpio_IGpioController;
begin
  Result := Statics.GetDefault;
end;


class function TGpio_GpioController.GetControllersAsync(provider: Gpio_Provider_IGpioProvider): IAsyncOperation_1__IVectorView_1__Gpio_IGpioController;
begin
  Result := Statics2.GetControllersAsync(provider);
end;

class function TGpio_GpioController.GetDefaultAsync: IAsyncOperation_1__Gpio_IGpioController;
begin
  Result := Statics2.GetDefaultAsync;
end;


 { TGpio_GpioChangeReader }
// Factories for : "Gpio_GpioChangeReader"
// Factory: "Windows.Devices.Gpio.IGpioChangeReaderFactory"
// -> Gpio_IGpioChangeReaderFactory

class function TGpio_GpioChangeReader.Create(pin: Gpio_IGpioPin): Gpio_IGpioChangeReader;
begin
  Result := Factory.Create(pin);
end;

class function TGpio_GpioChangeReader.CreateWithCapacity(pin: Gpio_IGpioPin; minCapacity: Integer): Gpio_IGpioChangeReader;
begin
  Result := Factory.CreateWithCapacity(pin, minCapacity);
end;


 { TGpio_GpioChangeCounter }
// Factories for : "Gpio_GpioChangeCounter"
// Factory: "Windows.Devices.Gpio.IGpioChangeCounterFactory"
// -> Gpio_IGpioChangeCounterFactory

class function TGpio_GpioChangeCounter.Create(pin: Gpio_IGpioPin): Gpio_IGpioChangeCounter;
begin
  Result := Factory.Create(pin);
end;


 { TI2c_I2cConnectionSettings }
// Factories for : "I2c_I2cConnectionSettings"
// Factory: "Windows.Devices.I2c.II2cConnectionSettingsFactory"
// -> I2c_II2cConnectionSettingsFactory

class function TI2c_I2cConnectionSettings.Create(slaveAddress: Integer): I2c_II2cConnectionSettings;
begin
  Result := Factory.Create(slaveAddress);
end;


 { TI2c_I2cDevice }

class function TI2c_I2cDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TI2c_I2cDevice.GetDeviceSelector(friendlyName: HSTRING): HSTRING;
begin
  Result := Statics.GetDeviceSelector(friendlyName);
end;

class function TI2c_I2cDevice.FromIdAsync(deviceId: HSTRING; settings: I2c_II2cConnectionSettings): IAsyncOperation_1__I2c_II2cDevice;
begin
  Result := Statics.FromIdAsync(deviceId, settings);
end;


 { TI2c_I2cController }

class function TI2c_I2cController.GetControllersAsync(provider: I2c_Provider_II2cProvider): IAsyncOperation_1__IVectorView_1__I2c_II2cController;
begin
  Result := Statics.GetControllersAsync(provider);
end;

class function TI2c_I2cController.GetDefaultAsync: IAsyncOperation_1__I2c_II2cController;
begin
  Result := Statics.GetDefaultAsync;
end;


 { TPwm_PwmController }

class function TPwm_PwmController.GetControllersAsync(provider: Pwm_Provider_IPwmProvider): IAsyncOperation_1__IVectorView_1__Pwm_IPwmController;
begin
  Result := Statics.GetControllersAsync(provider);
end;


class function TPwm_PwmController.GetDefaultAsync: IAsyncOperation_1__Pwm_IPwmController;
begin
  Result := Statics2.GetDefaultAsync;
end;


class function TPwm_PwmController.GetDeviceSelector: HSTRING;
begin
  Result := Statics3.GetDeviceSelector;
end;

class function TPwm_PwmController.GetDeviceSelector(friendlyName: HSTRING): HSTRING;
begin
  Result := Statics3.GetDeviceSelector(friendlyName);
end;

class function TPwm_PwmController.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Pwm_IPwmController;
begin
  Result := Statics3.FromIdAsync(deviceId);
end;


 { TSpi_Provider_ProviderSpiConnectionSettings }
// Factories for : "Spi_Provider_ProviderSpiConnectionSettings"
// Factory: "Windows.Devices.Spi.Provider.IProviderSpiConnectionSettingsFactory"
// -> Spi_Provider_IProviderSpiConnectionSettingsFactory

class function TSpi_Provider_ProviderSpiConnectionSettings.Create(chipSelectLine: Integer): Spi_Provider_IProviderSpiConnectionSettings;
begin
  Result := Factory.Create(chipSelectLine);
end;


 { TSpi_SpiConnectionSettings }
// Factories for : "Spi_SpiConnectionSettings"
// Factory: "Windows.Devices.Spi.ISpiConnectionSettingsFactory"
// -> Spi_ISpiConnectionSettingsFactory

class function TSpi_SpiConnectionSettings.Create(chipSelectLine: Integer): Spi_ISpiConnectionSettings;
begin
  Result := Factory.Create(chipSelectLine);
end;


 { TSpi_SpiDevice }

class function TSpi_SpiDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TSpi_SpiDevice.GetDeviceSelector(friendlyName: HSTRING): HSTRING;
begin
  Result := Statics.GetDeviceSelector(friendlyName);
end;

class function TSpi_SpiDevice.GetBusInfo(busId: HSTRING): Spi_ISpiBusInfo;
begin
  Result := Statics.GetBusInfo(busId);
end;

class function TSpi_SpiDevice.FromIdAsync(busId: HSTRING; settings: Spi_ISpiConnectionSettings): IAsyncOperation_1__Spi_ISpiDevice;
begin
  Result := Statics.FromIdAsync(busId, settings);
end;


 { TSpi_SpiController }

class function TSpi_SpiController.GetDefaultAsync: IAsyncOperation_1__Spi_ISpiController;
begin
  Result := Statics.GetDefaultAsync;
end;

class function TSpi_SpiController.GetControllersAsync(provider: Spi_Provider_ISpiProvider): IAsyncOperation_1__IVectorView_1__Spi_ISpiController;
begin
  Result := Statics.GetControllersAsync(provider);
end;


 { TLowLevelDevicesAggregateProvider }
// Factories for : "LowLevelDevicesAggregateProvider"
// Factory: "Windows.Devices.ILowLevelDevicesAggregateProviderFactory"
// -> ILowLevelDevicesAggregateProviderFactory

class function TLowLevelDevicesAggregateProvider.Create(adc: Adc_Provider_IAdcControllerProvider; pwm: Pwm_Provider_IPwmControllerProvider; gpio: Gpio_Provider_IGpioControllerProvider; i2c: I2c_Provider_II2cControllerProvider; spi: Spi_Provider_ISpiControllerProvider): ILowLevelDevicesAggregateProvider;
begin
  Result := Factory.Create(adc, pwm, gpio, i2c, spi);
end;


 { TLowLevelDevicesController }

class function TLowLevelDevicesController.get_DefaultProvider: ILowLevelDevicesAggregateProvider;
begin
  Result := Statics.get_DefaultProvider;
end;

class procedure TLowLevelDevicesController.put_DefaultProvider(value: ILowLevelDevicesAggregateProvider);
begin
  Statics.put_DefaultProvider(value);
end;


 { TPower_Battery }

class function TPower_Battery.get_AggregateBattery: Power_IBattery;
begin
  Result := Statics.get_AggregateBattery;
end;

class function TPower_Battery.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Power_IBattery;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TPower_Battery.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;


 { THaptics_KnownSimpleHapticsControllerWaveforms }

class function THaptics_KnownSimpleHapticsControllerWaveforms.get_Click: Word;
begin
  Result := Statics.get_Click;
end;

class function THaptics_KnownSimpleHapticsControllerWaveforms.get_BuzzContinuous: Word;
begin
  Result := Statics.get_BuzzContinuous;
end;

class function THaptics_KnownSimpleHapticsControllerWaveforms.get_RumbleContinuous: Word;
begin
  Result := Statics.get_RumbleContinuous;
end;

class function THaptics_KnownSimpleHapticsControllerWaveforms.get_Press: Word;
begin
  Result := Statics.get_Press;
end;

class function THaptics_KnownSimpleHapticsControllerWaveforms.get_Release: Word;
begin
  Result := Statics.get_Release;
end;


 { THaptics_VibrationDevice }

class function THaptics_VibrationDevice.RequestAccessAsync: IAsyncOperation_1__Haptics_VibrationAccessStatus;
begin
  Result := Statics.RequestAccessAsync;
end;

class function THaptics_VibrationDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function THaptics_VibrationDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Haptics_IVibrationDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function THaptics_VibrationDevice.GetDefaultAsync: IAsyncOperation_1__Haptics_IVibrationDevice;
begin
  Result := Statics.GetDefaultAsync;
end;

class function THaptics_VibrationDevice.FindAllAsync: IAsyncOperation_1__IVectorView_1__Haptics_IVibrationDevice;
begin
  Result := Statics.FindAllAsync;
end;


 { THumanInterfaceDevice_HidDevice }

class function THumanInterfaceDevice_HidDevice.GetDeviceSelector(usagePage: Word; usageId: Word): HSTRING;
begin
  Result := Statics.GetDeviceSelector(usagePage, usageId);
end;

class function THumanInterfaceDevice_HidDevice.GetDeviceSelector(usagePage: Word; usageId: Word; vendorId: Word; productId: Word): HSTRING;
begin
  Result := Statics.GetDeviceSelector(usagePage, usageId, vendorId, productId);
end;

class function THumanInterfaceDevice_HidDevice.FromIdAsync(deviceId: HSTRING; accessMode: FileAccessMode): IAsyncOperation_1__HumanInterfaceDevice_IHidDevice;
begin
  Result := Statics.FromIdAsync(deviceId, accessMode);
end;


 { TPerception_Provider_PerceptionFrameProviderInfo }

 { TPerception_Provider_PerceptionFaceAuthenticationGroup }
// Factories for : "Perception_Provider_PerceptionFaceAuthenticationGroup"
// Factory: "Windows.Devices.Perception.Provider.IPerceptionFaceAuthenticationGroupFactory"
// -> Perception_Provider_IPerceptionFaceAuthenticationGroupFactory

class function TPerception_Provider_PerceptionFaceAuthenticationGroup.Create(ids: IIterable_1__HSTRING; startHandler: Perception_Provider_PerceptionStartFaceAuthenticationHandler; stopHandler: Perception_Provider_PerceptionStopFaceAuthenticationHandler): Perception_Provider_IPerceptionFaceAuthenticationGroup;
begin
  Result := Factory.Create(ids, startHandler, stopHandler);
end;


 { TPerception_Provider_PerceptionControlGroup }
// Factories for : "Perception_Provider_PerceptionControlGroup"
// Factory: "Windows.Devices.Perception.Provider.IPerceptionControlGroupFactory"
// -> Perception_Provider_IPerceptionControlGroupFactory

class function TPerception_Provider_PerceptionControlGroup.Create(ids: IIterable_1__HSTRING): Perception_Provider_IPerceptionControlGroup;
begin
  Result := Factory.Create(ids);
end;


 { TPerception_Provider_PerceptionCorrelationGroup }
// Factories for : "Perception_Provider_PerceptionCorrelationGroup"
// Factory: "Windows.Devices.Perception.Provider.IPerceptionCorrelationGroupFactory"
// -> Perception_Provider_IPerceptionCorrelationGroupFactory

class function TPerception_Provider_PerceptionCorrelationGroup.Create(relativeLocations: IIterable_1__Perception_Provider_IPerceptionCorrelation): Perception_Provider_IPerceptionCorrelationGroup;
begin
  Result := Factory.Create(relativeLocations);
end;


 { TPerception_Provider_PerceptionCorrelation }
// Factories for : "Perception_Provider_PerceptionCorrelation"
// Factory: "Windows.Devices.Perception.Provider.IPerceptionCorrelationFactory"
// -> Perception_Provider_IPerceptionCorrelationFactory

class function TPerception_Provider_PerceptionCorrelation.Create(targetId: HSTRING; position: Numerics_Vector3; orientation: Numerics_Quaternion): Perception_Provider_IPerceptionCorrelation;
begin
  Result := Factory.Create(targetId, position, orientation);
end;


 { TPerception_Provider_PerceptionVideoFrameAllocator }
// Factories for : "Perception_Provider_PerceptionVideoFrameAllocator"
// Factory: "Windows.Devices.Perception.Provider.IPerceptionVideoFrameAllocatorFactory"
// -> Perception_Provider_IPerceptionVideoFrameAllocatorFactory

class function TPerception_Provider_PerceptionVideoFrameAllocator.Create(maxOutstandingFrameCountForWrite: Cardinal; format: Imaging_BitmapPixelFormat; resolution: TSizeF; alpha: Imaging_BitmapAlphaMode): Perception_Provider_IPerceptionVideoFrameAllocator;
begin
  Result := Factory.Create(maxOutstandingFrameCountForWrite, format, resolution, alpha);
end;


 { TPerception_Provider_PerceptionFrameProviderManagerService }

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.RegisterFrameProviderInfo(manager: Perception_Provider_IPerceptionFrameProviderManager; frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo);
begin
  Statics.RegisterFrameProviderInfo(manager, frameProviderInfo);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.UnregisterFrameProviderInfo(manager: Perception_Provider_IPerceptionFrameProviderManager; frameProviderInfo: Perception_Provider_IPerceptionFrameProviderInfo);
begin
  Statics.UnregisterFrameProviderInfo(manager, frameProviderInfo);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.RegisterFaceAuthenticationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; faceAuthenticationGroup: Perception_Provider_IPerceptionFaceAuthenticationGroup);
begin
  Statics.RegisterFaceAuthenticationGroup(manager, faceAuthenticationGroup);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.UnregisterFaceAuthenticationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; faceAuthenticationGroup: Perception_Provider_IPerceptionFaceAuthenticationGroup);
begin
  Statics.UnregisterFaceAuthenticationGroup(manager, faceAuthenticationGroup);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.RegisterControlGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; controlGroup: Perception_Provider_IPerceptionControlGroup);
begin
  Statics.RegisterControlGroup(manager, controlGroup);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.UnregisterControlGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; controlGroup: Perception_Provider_IPerceptionControlGroup);
begin
  Statics.UnregisterControlGroup(manager, controlGroup);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.RegisterCorrelationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; correlationGroup: Perception_Provider_IPerceptionCorrelationGroup);
begin
  Statics.RegisterCorrelationGroup(manager, correlationGroup);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.UnregisterCorrelationGroup(manager: Perception_Provider_IPerceptionFrameProviderManager; correlationGroup: Perception_Provider_IPerceptionCorrelationGroup);
begin
  Statics.UnregisterCorrelationGroup(manager, correlationGroup);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.UpdateAvailabilityForProvider(provider: Perception_Provider_IPerceptionFrameProvider; available: Boolean);
begin
  Statics.UpdateAvailabilityForProvider(provider, available);
end;

class procedure TPerception_Provider_PerceptionFrameProviderManagerService.PublishFrameForProvider(provider: Perception_Provider_IPerceptionFrameProvider; frame: Perception_Provider_IPerceptionFrame);
begin
  Statics.PublishFrameForProvider(provider, frame);
end;


 { TPerception_Provider_KnownPerceptionFrameKind }

class function TPerception_Provider_KnownPerceptionFrameKind.get_Color: HSTRING;
begin
  Result := Statics.get_Color;
end;

class function TPerception_Provider_KnownPerceptionFrameKind.get_Depth: HSTRING;
begin
  Result := Statics.get_Depth;
end;

class function TPerception_Provider_KnownPerceptionFrameKind.get_Infrared: HSTRING;
begin
  Result := Statics.get_Infrared;
end;


 { TPerception_PerceptionColorFrameSource }

class function TPerception_PerceptionColorFrameSource.CreateWatcher: Perception_IPerceptionColorFrameSourceWatcher;
begin
  Result := Statics.CreateWatcher;
end;

class function TPerception_PerceptionColorFrameSource.FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionColorFrameSource;
begin
  Result := Statics.FindAllAsync;
end;

class function TPerception_PerceptionColorFrameSource.FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionColorFrameSource;
begin
  Result := Statics.FromIdAsync(id);
end;

class function TPerception_PerceptionColorFrameSource.RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus;
begin
  Result := Statics.RequestAccessAsync;
end;


 { TPerception_PerceptionDepthFrameSource }

class function TPerception_PerceptionDepthFrameSource.CreateWatcher: Perception_IPerceptionDepthFrameSourceWatcher;
begin
  Result := Statics.CreateWatcher;
end;

class function TPerception_PerceptionDepthFrameSource.FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionDepthFrameSource;
begin
  Result := Statics.FindAllAsync;
end;

class function TPerception_PerceptionDepthFrameSource.FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionDepthFrameSource;
begin
  Result := Statics.FromIdAsync(id);
end;

class function TPerception_PerceptionDepthFrameSource.RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus;
begin
  Result := Statics.RequestAccessAsync;
end;


 { TPerception_PerceptionInfraredFrameSource }

class function TPerception_PerceptionInfraredFrameSource.CreateWatcher: Perception_IPerceptionInfraredFrameSourceWatcher;
begin
  Result := Statics.CreateWatcher;
end;

class function TPerception_PerceptionInfraredFrameSource.FindAllAsync: IAsyncOperation_1__IVectorView_1__Perception_IPerceptionInfraredFrameSource;
begin
  Result := Statics.FindAllAsync;
end;

class function TPerception_PerceptionInfraredFrameSource.FromIdAsync(id: HSTRING): IAsyncOperation_1__Perception_IPerceptionInfraredFrameSource;
begin
  Result := Statics.FromIdAsync(id);
end;

class function TPerception_PerceptionInfraredFrameSource.RequestAccessAsync: IAsyncOperation_1__Perception_PerceptionFrameSourceAccessStatus;
begin
  Result := Statics.RequestAccessAsync;
end;


 { TPerception_KnownPerceptionFrameSourceProperties }

class function TPerception_KnownPerceptionFrameSourceProperties.get_Id: HSTRING;
begin
  Result := Statics.get_Id;
end;

class function TPerception_KnownPerceptionFrameSourceProperties.get_PhysicalDeviceIds: HSTRING;
begin
  Result := Statics.get_PhysicalDeviceIds;
end;

class function TPerception_KnownPerceptionFrameSourceProperties.get_FrameKind: HSTRING;
begin
  Result := Statics.get_FrameKind;
end;

class function TPerception_KnownPerceptionFrameSourceProperties.get_DeviceModelVersion: HSTRING;
begin
  Result := Statics.get_DeviceModelVersion;
end;

class function TPerception_KnownPerceptionFrameSourceProperties.get_EnclosureLocation: HSTRING;
begin
  Result := Statics.get_EnclosureLocation;
end;


class function TPerception_KnownPerceptionFrameSourceProperties.get_DeviceId: HSTRING;
begin
  Result := Statics2.get_DeviceId;
end;


 { TPerception_KnownPerceptionVideoFrameSourceProperties }

class function TPerception_KnownPerceptionVideoFrameSourceProperties.get_VideoProfile: HSTRING;
begin
  Result := Statics.get_VideoProfile;
end;

class function TPerception_KnownPerceptionVideoFrameSourceProperties.get_SupportedVideoProfiles: HSTRING;
begin
  Result := Statics.get_SupportedVideoProfiles;
end;

class function TPerception_KnownPerceptionVideoFrameSourceProperties.get_AvailableVideoProfiles: HSTRING;
begin
  Result := Statics.get_AvailableVideoProfiles;
end;

class function TPerception_KnownPerceptionVideoFrameSourceProperties.get_IsMirrored: HSTRING;
begin
  Result := Statics.get_IsMirrored;
end;

class function TPerception_KnownPerceptionVideoFrameSourceProperties.get_CameraIntrinsics: HSTRING;
begin
  Result := Statics.get_CameraIntrinsics;
end;


 { TPerception_KnownPerceptionInfraredFrameSourceProperties }

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_Exposure: HSTRING;
begin
  Result := Statics.get_Exposure;
end;

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_AutoExposureEnabled: HSTRING;
begin
  Result := Statics.get_AutoExposureEnabled;
end;

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_ExposureCompensation: HSTRING;
begin
  Result := Statics.get_ExposureCompensation;
end;

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_ActiveIlluminationEnabled: HSTRING;
begin
  Result := Statics.get_ActiveIlluminationEnabled;
end;

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_AmbientSubtractionEnabled: HSTRING;
begin
  Result := Statics.get_AmbientSubtractionEnabled;
end;

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_StructureLightPatternEnabled: HSTRING;
begin
  Result := Statics.get_StructureLightPatternEnabled;
end;

class function TPerception_KnownPerceptionInfraredFrameSourceProperties.get_InterleavedIlluminationEnabled: HSTRING;
begin
  Result := Statics.get_InterleavedIlluminationEnabled;
end;


 { TPerception_KnownPerceptionDepthFrameSourceProperties }

class function TPerception_KnownPerceptionDepthFrameSourceProperties.get_MinDepth: HSTRING;
begin
  Result := Statics.get_MinDepth;
end;

class function TPerception_KnownPerceptionDepthFrameSourceProperties.get_MaxDepth: HSTRING;
begin
  Result := Statics.get_MaxDepth;
end;


 { TPerception_KnownPerceptionColorFrameSourceProperties }

class function TPerception_KnownPerceptionColorFrameSourceProperties.get_Exposure: HSTRING;
begin
  Result := Statics.get_Exposure;
end;

class function TPerception_KnownPerceptionColorFrameSourceProperties.get_AutoExposureEnabled: HSTRING;
begin
  Result := Statics.get_AutoExposureEnabled;
end;

class function TPerception_KnownPerceptionColorFrameSourceProperties.get_ExposureCompensation: HSTRING;
begin
  Result := Statics.get_ExposureCompensation;
end;


 { TPerception_KnownPerceptionVideoProfileProperties }

class function TPerception_KnownPerceptionVideoProfileProperties.get_BitmapPixelFormat: HSTRING;
begin
  Result := Statics.get_BitmapPixelFormat;
end;

class function TPerception_KnownPerceptionVideoProfileProperties.get_BitmapAlphaMode: HSTRING;
begin
  Result := Statics.get_BitmapAlphaMode;
end;

class function TPerception_KnownPerceptionVideoProfileProperties.get_Width: HSTRING;
begin
  Result := Statics.get_Width;
end;

class function TPerception_KnownPerceptionVideoProfileProperties.get_Height: HSTRING;
begin
  Result := Statics.get_Height;
end;

class function TPerception_KnownPerceptionVideoProfileProperties.get_FrameDuration: HSTRING;
begin
  Result := Statics.get_FrameDuration;
end;


 { TPerception_KnownCameraIntrinsicsProperties }

class function TPerception_KnownCameraIntrinsicsProperties.get_FocalLength: HSTRING;
begin
  Result := Statics.get_FocalLength;
end;

class function TPerception_KnownCameraIntrinsicsProperties.get_PrincipalPoint: HSTRING;
begin
  Result := Statics.get_PrincipalPoint;
end;

class function TPerception_KnownCameraIntrinsicsProperties.get_RadialDistortion: HSTRING;
begin
  Result := Statics.get_RadialDistortion;
end;

class function TPerception_KnownCameraIntrinsicsProperties.get_TangentialDistortion: HSTRING;
begin
  Result := Statics.get_TangentialDistortion;
end;


 { TRadios_Radio }

class function TRadios_Radio.GetRadiosAsync: IAsyncOperation_1__IVectorView_1__Radios_IRadio;
begin
  Result := Statics.GetRadiosAsync;
end;

class function TRadios_Radio.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TRadios_Radio.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Radios_IRadio;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TRadios_Radio.RequestAccessAsync: IAsyncOperation_1__Radios_RadioAccessStatus;
begin
  Result := Statics.RequestAccessAsync;
end;


 { TSerialCommunication_SerialDevice }

class function TSerialCommunication_SerialDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TSerialCommunication_SerialDevice.GetDeviceSelector(portName: HSTRING): HSTRING;
begin
  Result := Statics.GetDeviceSelector(portName);
end;

class function TSerialCommunication_SerialDevice.GetDeviceSelectorFromUsbVidPid(vendorId: Word; productId: Word): HSTRING;
begin
  Result := Statics.GetDeviceSelectorFromUsbVidPid(vendorId, productId);
end;

class function TSerialCommunication_SerialDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__SerialCommunication_ISerialDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;


 { TUsb_UsbControlRequestType }

 { TUsb_UsbSetupPacket }
// Factories for : "Usb_UsbSetupPacket"
// Factory: "Windows.Devices.Usb.IUsbSetupPacketFactory"
// -> Usb_IUsbSetupPacketFactory

class function TUsb_UsbSetupPacket.CreateWithEightByteBuffer(eightByteBuffer: IBuffer): Usb_IUsbSetupPacket;
begin
  Result := Factory.CreateWithEightByteBuffer(eightByteBuffer);
end;


 { TUsb_UsbDeviceClass }

 { TUsb_UsbDeviceClasses }

class function TUsb_UsbDeviceClasses.get_CdcControl: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_CdcControl;
end;

class function TUsb_UsbDeviceClasses.get_Physical: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_Physical;
end;

class function TUsb_UsbDeviceClasses.get_PersonalHealthcare: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_PersonalHealthcare;
end;

class function TUsb_UsbDeviceClasses.get_ActiveSync: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_ActiveSync;
end;

class function TUsb_UsbDeviceClasses.get_PalmSync: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_PalmSync;
end;

class function TUsb_UsbDeviceClasses.get_DeviceFirmwareUpdate: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_DeviceFirmwareUpdate;
end;

class function TUsb_UsbDeviceClasses.get_Irda: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_Irda;
end;

class function TUsb_UsbDeviceClasses.get_Measurement: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_Measurement;
end;

class function TUsb_UsbDeviceClasses.get_VendorSpecific: Usb_IUsbDeviceClass;
begin
  Result := Statics.get_VendorSpecific;
end;


 { TUsb_UsbDevice }

class function TUsb_UsbDevice.GetDeviceSelector(vendorId: Cardinal; productId: Cardinal; winUsbInterfaceClass: TGuid): HSTRING;
begin
  Result := Statics.GetDeviceSelector(vendorId, productId, winUsbInterfaceClass);
end;

class function TUsb_UsbDevice.GetDeviceSelector(winUsbInterfaceClass: TGuid): HSTRING;
begin
  Result := Statics.GetDeviceSelector(winUsbInterfaceClass);
end;

class function TUsb_UsbDevice.GetDeviceSelector(vendorId: Cardinal; productId: Cardinal): HSTRING;
begin
  Result := Statics.GetDeviceSelector(vendorId, productId);
end;

class function TUsb_UsbDevice.GetDeviceClassSelector(usbClass: Usb_IUsbDeviceClass): HSTRING;
begin
  Result := Statics.GetDeviceClassSelector(usbClass);
end;

class function TUsb_UsbDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__Usb_IUsbDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;


 { TUsb_UsbConfigurationDescriptor }

class function TUsb_UsbConfigurationDescriptor.TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbConfigurationDescriptor): Boolean;
begin
  Result := Statics.TryParse(descriptor, parsed);
end;

class function TUsb_UsbConfigurationDescriptor.Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbConfigurationDescriptor;
begin
  Result := Statics.Parse(descriptor);
end;


 { TUsb_UsbInterfaceDescriptor }

class function TUsb_UsbInterfaceDescriptor.TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbInterfaceDescriptor): Boolean;
begin
  Result := Statics.TryParse(descriptor, parsed);
end;

class function TUsb_UsbInterfaceDescriptor.Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbInterfaceDescriptor;
begin
  Result := Statics.Parse(descriptor);
end;


 { TUsb_UsbEndpointDescriptor }

class function TUsb_UsbEndpointDescriptor.TryParse(descriptor: Usb_IUsbDescriptor; out parsed: Usb_IUsbEndpointDescriptor): Boolean;
begin
  Result := Statics.TryParse(descriptor, parsed);
end;

class function TUsb_UsbEndpointDescriptor.Parse(descriptor: Usb_IUsbDescriptor): Usb_IUsbEndpointDescriptor;
begin
  Result := Statics.Parse(descriptor);
end;


 { TWiFi_WiFiAdapter }

class function TWiFi_WiFiAdapter.FindAllAdaptersAsync: IAsyncOperation_1__IVectorView_1__WiFi_IWiFiAdapter;
begin
  Result := Statics.FindAllAdaptersAsync;
end;

class function TWiFi_WiFiAdapter.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TWiFi_WiFiAdapter.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFi_IWiFiAdapter;
begin
  Result := Statics.FromIdAsync(deviceId);
end;

class function TWiFi_WiFiAdapter.RequestAccessAsync: IAsyncOperation_1__WiFi_WiFiAccessStatus;
begin
  Result := Statics.RequestAccessAsync;
end;


 { TWiFiDirect_WiFiDirectDevice }

class function TWiFiDirect_WiFiDirectDevice.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;

class function TWiFiDirect_WiFiDirectDevice.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice;
begin
  Result := Statics.FromIdAsync(deviceId);
end;


class function TWiFiDirect_WiFiDirectDevice.GetDeviceSelector(&type: WiFiDirect_WiFiDirectDeviceSelectorType): HSTRING;
begin
  Result := Statics2.GetDeviceSelector(&type);
end;

class function TWiFiDirect_WiFiDirectDevice.FromIdAsync(deviceId: HSTRING; connectionParameters: WiFiDirect_IWiFiDirectConnectionParameters): IAsyncOperation_1__WiFiDirect_IWiFiDirectDevice;
begin
  Result := Statics2.FromIdAsync(deviceId, connectionParameters);
end;


 { TWiFiDirect_WiFiDirectConnectionParameters }

class function TWiFiDirect_WiFiDirectConnectionParameters.GetDevicePairingKinds(configurationMethod: WiFiDirect_WiFiDirectConfigurationMethod): DevicePairingKinds;
begin
  Result := Statics.GetDevicePairingKinds(configurationMethod);
end;


 { TWiFiDirect_WiFiDirectInformationElement }

class function TWiFiDirect_WiFiDirectInformationElement.CreateFromBuffer(buffer: IBuffer): IVector_1__WiFiDirect_IWiFiDirectInformationElement;
begin
  Result := Statics.CreateFromBuffer(buffer);
end;

class function TWiFiDirect_WiFiDirectInformationElement.CreateFromDeviceInformation(deviceInformation: IDeviceInformation): IVector_1__WiFiDirect_IWiFiDirectInformationElement;
begin
  Result := Statics.CreateFromDeviceInformation(deviceInformation);
end;


 { TWiFiDirect_WiFiDirectAdvertisementPublisher }

 { TWiFiDirect_WiFiDirectConnectionListener }

 { TWiFiDirect_Services_WiFiDirectServiceAdvertiser }
// Factories for : "WiFiDirect_Services_WiFiDirectServiceAdvertiser"
// Factory: "Windows.Devices.WiFiDirect.Services.IWiFiDirectServiceAdvertiserFactory"
// -> WiFiDirect_Services_IWiFiDirectServiceAdvertiserFactory

class function TWiFiDirect_Services_WiFiDirectServiceAdvertiser.CreateWiFiDirectServiceAdvertiser(serviceName: HSTRING): WiFiDirect_Services_IWiFiDirectServiceAdvertiser;
begin
  Result := Factory.CreateWiFiDirectServiceAdvertiser(serviceName);
end;


 { TWiFiDirect_Services_WiFiDirectService }

class function TWiFiDirect_Services_WiFiDirectService.GetSelector(serviceName: HSTRING): HSTRING;
begin
  Result := Statics.GetSelector(serviceName);
end;

class function TWiFiDirect_Services_WiFiDirectService.GetSelector(serviceName: HSTRING; serviceInfoFilter: IBuffer): HSTRING;
begin
  Result := Statics.GetSelector(serviceName, serviceInfoFilter);
end;

class function TWiFiDirect_Services_WiFiDirectService.FromIdAsync(deviceId: HSTRING): IAsyncOperation_1__WiFiDirect_Services_IWiFiDirectService;
begin
  Result := Statics.FromIdAsync(deviceId);
end;



end.
