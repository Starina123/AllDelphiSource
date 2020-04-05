{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Media;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.CommonTypes, 
  Winapi.GraphicsRT, 
  Winapi.Foundation, 
  Winapi.ApplicationModel, 
  Winapi.ServicesRT, 
  Winapi.Media.MediaProperties, 
  Winapi.Media.Devices, 
  Winapi.Perception, 
  Winapi.SystemRT, 
  Winapi.Storage, 
  Winapi.Storage.Streams, 
  Winapi.WebRT, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Media.IMediaFrame
  IMediaFrame = interface;
  PIMediaFrame = ^IMediaFrame;

  // Windows.Media.IVideoFrame
  IVideoFrame = interface;
  PIVideoFrame = ^IVideoFrame;

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

  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface;
  PIReference_1__Cardinal = ^IReference_1__Cardinal;

  // Windows.Foundation.Collections.IIterator`1<String>
  IIterator_1__HSTRING = interface;
  PIIterator_1__HSTRING = ^IIterator_1__HSTRING;

  // Windows.Foundation.Collections.IIterable`1<String>
  IIterable_1__HSTRING = interface;
  PIIterable_1__HSTRING = ^IIterable_1__HSTRING;

  // Windows.Foundation.Collections.IVectorView`1<String>
  IVectorView_1__HSTRING = interface;
  PIVectorView_1__HSTRING = ^IVectorView_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Object>
  AsyncOperationCompletedHandler_1__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IInspectable = ^AsyncOperationCompletedHandler_1__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Object>
  IAsyncOperation_1__IInspectable = interface;
  PIAsyncOperation_1__IInspectable = ^IAsyncOperation_1__IInspectable;

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

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.IMemoryBufferReference,Object>
  TypedEventHandler_2__IMemoryBufferReference__IInspectable = interface;
  PTypedEventHandler_2__IMemoryBufferReference__IInspectable = ^TypedEventHandler_2__IMemoryBufferReference__IInspectable;

  // Windows.Media.IVideoFrameFactory
  IVideoFrameFactory = interface;
  PIVideoFrameFactory = ^IVideoFrameFactory;

  // Windows.Media.IAudioBuffer
  IAudioBuffer = interface;
  PIAudioBuffer = ^IAudioBuffer;

  // Windows.Media.IAudioFrame
  IAudioFrame = interface;
  PIAudioFrame = ^IAudioFrame;

  // Windows.Media.IAudioFrameFactory
  IAudioFrameFactory = interface;
  PIAudioFrameFactory = ^IAudioFrameFactory;

  // Windows.Media.Effects.IAudioEffectDefinition
  Effects_IAudioEffectDefinition = interface;
  PEffects_IAudioEffectDefinition = ^Effects_IAudioEffectDefinition;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IAudioEffectDefinition>
  IIterator_1__Effects_IAudioEffectDefinition = interface;
  PIIterator_1__Effects_IAudioEffectDefinition = ^IIterator_1__Effects_IAudioEffectDefinition;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Effects.IAudioEffectDefinition>
  IIterable_1__Effects_IAudioEffectDefinition = interface;
  PIIterable_1__Effects_IAudioEffectDefinition = ^IIterable_1__Effects_IAudioEffectDefinition;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Effects.IAudioEffectDefinition>
  IVectorView_1__Effects_IAudioEffectDefinition = interface;
  PIVectorView_1__Effects_IAudioEffectDefinition = ^IVectorView_1__Effects_IAudioEffectDefinition;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IAudioEffectDefinition>
  IVector_1__Effects_IAudioEffectDefinition = interface;
  PIVector_1__Effects_IAudioEffectDefinition = ^IVector_1__Effects_IAudioEffectDefinition;

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

  // Windows.Media.Audio.IAudioNode
  Audio_IAudioNode = interface;
  PAudio_IAudioNode = ^Audio_IAudioNode;

  // Windows.Media.Audio.IAudioGraphConnection
  Audio_IAudioGraphConnection = interface;
  PAudio_IAudioGraphConnection = ^Audio_IAudioGraphConnection;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IAudioGraphConnection>
  IIterator_1__Audio_IAudioGraphConnection = interface;
  PIIterator_1__Audio_IAudioGraphConnection = ^IIterator_1__Audio_IAudioGraphConnection;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Audio.IAudioGraphConnection>
  IIterable_1__Audio_IAudioGraphConnection = interface;
  PIIterable_1__Audio_IAudioGraphConnection = ^IIterable_1__Audio_IAudioGraphConnection;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Audio.IAudioGraphConnection>
  IVectorView_1__Audio_IAudioGraphConnection = interface;
  PIVectorView_1__Audio_IAudioGraphConnection = ^IVectorView_1__Audio_IAudioGraphConnection;

  // Windows.Media.Audio.IAudioInputNode
  Audio_IAudioInputNode = interface;
  PAudio_IAudioInputNode = ^Audio_IAudioInputNode;

  // Windows.Media.Audio.IAudioFrameCompletedEventArgs
  Audio_IAudioFrameCompletedEventArgs = interface;
  PAudio_IAudioFrameCompletedEventArgs = ^Audio_IAudioFrameCompletedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IAudioFrameCompletedEventArgs>
  TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs = interface;
  PTypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs = ^TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs;

  // Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs
  Audio_IFrameInputNodeQuantumStartedEventArgs = interface;
  PAudio_IFrameInputNodeQuantumStartedEventArgs = ^Audio_IFrameInputNodeQuantumStartedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs>
  TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs = interface;
  PTypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs = ^TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs;

  // Windows.Media.Audio.IAudioFrameInputNode
  Audio_IAudioFrameInputNode = interface;
  PAudio_IAudioFrameInputNode = ^Audio_IAudioFrameInputNode;

  // Windows.Media.Audio.IAudioDeviceInputNode
  Audio_IAudioDeviceInputNode = interface;
  PAudio_IAudioDeviceInputNode = ^Audio_IAudioDeviceInputNode;

  // Windows.Media.Audio.ICreateAudioDeviceInputNodeResult
  Audio_ICreateAudioDeviceInputNodeResult = interface;
  PAudio_ICreateAudioDeviceInputNodeResult = ^Audio_ICreateAudioDeviceInputNodeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult = interface;
  PAsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult = ^AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult = interface;
  PIAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult = ^IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult;

  // Windows.Media.Audio.IAudioFrameOutputNode
  Audio_IAudioFrameOutputNode = interface;
  PAudio_IAudioFrameOutputNode = ^Audio_IAudioFrameOutputNode;

  // Windows.Media.Audio.IAudioDeviceOutputNode
  Audio_IAudioDeviceOutputNode = interface;
  PAudio_IAudioDeviceOutputNode = ^Audio_IAudioDeviceOutputNode;

  // Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult
  Audio_ICreateAudioDeviceOutputNodeResult = interface;
  PAudio_ICreateAudioDeviceOutputNodeResult = ^Audio_ICreateAudioDeviceOutputNodeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult = interface;
  PAsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult = ^AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult = interface;
  PIAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult = ^IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult;

  // Windows.Foundation.IReference`1<Int32>
  IReference_1__Integer = interface;
  PIReference_1__Integer = ^IReference_1__Integer;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFileInputNode,Object>
  TypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable = interface;
  PTypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable = ^TypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable;

  // Windows.Media.Audio.IAudioFileInputNode
  Audio_IAudioFileInputNode = interface;
  PAudio_IAudioFileInputNode = ^Audio_IAudioFileInputNode;

  // Windows.Media.Audio.ICreateAudioFileInputNodeResult
  Audio_ICreateAudioFileInputNodeResult = interface;
  PAudio_ICreateAudioFileInputNodeResult = ^Audio_ICreateAudioFileInputNodeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult = interface;
  PAsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult = ^AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult = interface;
  PIAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult = ^IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.TranscodeFailureReason>
  AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason = interface;
  PAsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason = ^AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.TranscodeFailureReason>
  IAsyncOperation_1__Transcoding_TranscodeFailureReason = interface;
  PIAsyncOperation_1__Transcoding_TranscodeFailureReason = ^IAsyncOperation_1__Transcoding_TranscodeFailureReason;

  // Windows.Media.Audio.IAudioFileOutputNode
  Audio_IAudioFileOutputNode = interface;
  PAudio_IAudioFileOutputNode = ^Audio_IAudioFileOutputNode;

  // Windows.Media.Audio.ICreateAudioFileOutputNodeResult
  Audio_ICreateAudioFileOutputNodeResult = interface;
  PAudio_ICreateAudioFileOutputNodeResult = ^Audio_ICreateAudioFileOutputNodeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult = interface;
  PAsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult = ^AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult = interface;
  PIAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult = ^IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Object>
  TypedEventHandler_2__Audio_IAudioGraph__IInspectable = interface;
  PTypedEventHandler_2__Audio_IAudioGraph__IInspectable = ^TypedEventHandler_2__Audio_IAudioGraph__IInspectable;

  // Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs
  Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs = interface;
  PAudio_IAudioGraphUnrecoverableErrorOccurredEventArgs = ^Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs>
  TypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs = interface;
  PTypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs = ^TypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs;

  // Windows.Media.Audio.IAudioGraph
  Audio_IAudioGraph = interface;
  PAudio_IAudioGraph = ^Audio_IAudioGraph;

  // Windows.Media.Audio.ICreateAudioGraphResult
  Audio_ICreateAudioGraphResult = interface;
  PAudio_ICreateAudioGraphResult = ^Audio_ICreateAudioGraphResult;

  // Windows.Media.Audio.IAudioGraphSettings
  Audio_IAudioGraphSettings = interface;
  PAudio_IAudioGraphSettings = ^Audio_IAudioGraphSettings;

  // Windows.Media.Audio.IAudioGraphSettingsFactory
  Audio_IAudioGraphSettingsFactory = interface;
  PAudio_IAudioGraphSettingsFactory = ^Audio_IAudioGraphSettingsFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioGraphResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult = interface;
  PAsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult = ^AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioGraphResult>
  IAsyncOperation_1__Audio_ICreateAudioGraphResult = interface;
  PIAsyncOperation_1__Audio_ICreateAudioGraphResult = ^IAsyncOperation_1__Audio_ICreateAudioGraphResult;

  // Windows.Media.Audio.IAudioGraphStatics
  Audio_IAudioGraphStatics = interface;
  PAudio_IAudioGraphStatics = ^Audio_IAudioGraphStatics;

  // Windows.Media.Audio.IAudioNodeEmitterConeProperties
  Audio_IAudioNodeEmitterConeProperties = interface;
  PAudio_IAudioNodeEmitterConeProperties = ^Audio_IAudioNodeEmitterConeProperties;

  // Windows.Media.Audio.IAudioNodeEmitterShape
  Audio_IAudioNodeEmitterShape = interface;
  PAudio_IAudioNodeEmitterShape = ^Audio_IAudioNodeEmitterShape;

  // Windows.Media.Audio.IAudioNodeEmitterNaturalDecayModelProperties
  Audio_IAudioNodeEmitterNaturalDecayModelProperties = interface;
  PAudio_IAudioNodeEmitterNaturalDecayModelProperties = ^Audio_IAudioNodeEmitterNaturalDecayModelProperties;

  // Windows.Media.Audio.IAudioNodeEmitterDecayModel
  Audio_IAudioNodeEmitterDecayModel = interface;
  PAudio_IAudioNodeEmitterDecayModel = ^Audio_IAudioNodeEmitterDecayModel;

  // Windows.Media.Audio.IAudioNodeEmitter
  Audio_IAudioNodeEmitter = interface;
  PAudio_IAudioNodeEmitter = ^Audio_IAudioNodeEmitter;

  // Windows.Media.Audio.IAudioGraph2
  Audio_IAudioGraph2 = interface;
  PAudio_IAudioGraph2 = ^Audio_IAudioGraph2;

  // Windows.Media.Audio.IAudioNodeListener
  Audio_IAudioNodeListener = interface;
  PAudio_IAudioNodeListener = ^Audio_IAudioNodeListener;

  // Windows.Media.Audio.IAudioNodeWithListener
  Audio_IAudioNodeWithListener = interface;
  PAudio_IAudioNodeWithListener = ^Audio_IAudioNodeWithListener;

  // Windows.Media.Audio.IAudioInputNode2
  Audio_IAudioInputNode2 = interface;
  PAudio_IAudioInputNode2 = ^Audio_IAudioInputNode2;

  // Windows.Media.Audio.IEqualizerBand
  Audio_IEqualizerBand = interface;
  PAudio_IEqualizerBand = ^Audio_IEqualizerBand;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IEqualizerBand>
  IIterator_1__Audio_IEqualizerBand = interface;
  PIIterator_1__Audio_IEqualizerBand = ^IIterator_1__Audio_IEqualizerBand;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Audio.IEqualizerBand>
  IIterable_1__Audio_IEqualizerBand = interface;
  PIIterable_1__Audio_IEqualizerBand = ^IIterable_1__Audio_IEqualizerBand;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Audio.IEqualizerBand>
  IVectorView_1__Audio_IEqualizerBand = interface;
  PIVectorView_1__Audio_IEqualizerBand = ^IVectorView_1__Audio_IEqualizerBand;

  // Windows.Media.Audio.IEqualizerEffectDefinition
  Audio_IEqualizerEffectDefinition = interface;
  PAudio_IEqualizerEffectDefinition = ^Audio_IEqualizerEffectDefinition;

  // Windows.Media.Audio.IEqualizerEffectDefinitionFactory
  Audio_IEqualizerEffectDefinitionFactory = interface;
  PAudio_IEqualizerEffectDefinitionFactory = ^Audio_IEqualizerEffectDefinitionFactory;

  // Windows.Media.Audio.IReverbEffectDefinition
  Audio_IReverbEffectDefinition = interface;
  PAudio_IReverbEffectDefinition = ^Audio_IReverbEffectDefinition;

  // Windows.Media.Audio.IReverbEffectDefinitionFactory
  Audio_IReverbEffectDefinitionFactory = interface;
  PAudio_IReverbEffectDefinitionFactory = ^Audio_IReverbEffectDefinitionFactory;

  // Windows.Media.Audio.IEchoEffectDefinition
  Audio_IEchoEffectDefinition = interface;
  PAudio_IEchoEffectDefinition = ^Audio_IEchoEffectDefinition;

  // Windows.Media.Audio.IEchoEffectDefinitionFactory
  Audio_IEchoEffectDefinitionFactory = interface;
  PAudio_IEchoEffectDefinitionFactory = ^Audio_IEchoEffectDefinitionFactory;

  // Windows.Media.Audio.ILimiterEffectDefinition
  Audio_ILimiterEffectDefinition = interface;
  PAudio_ILimiterEffectDefinition = ^Audio_ILimiterEffectDefinition;

  // Windows.Media.Audio.ILimiterEffectDefinitionFactory
  Audio_ILimiterEffectDefinitionFactory = interface;
  PAudio_ILimiterEffectDefinitionFactory = ^Audio_ILimiterEffectDefinitionFactory;

  // Windows.Media.Audio.IAudioNodeEmitterShapeStatics
  Audio_IAudioNodeEmitterShapeStatics = interface;
  PAudio_IAudioNodeEmitterShapeStatics = ^Audio_IAudioNodeEmitterShapeStatics;

  // Windows.Media.Audio.IAudioNodeEmitterDecayModelStatics
  Audio_IAudioNodeEmitterDecayModelStatics = interface;
  PAudio_IAudioNodeEmitterDecayModelStatics = ^Audio_IAudioNodeEmitterDecayModelStatics;

  // Windows.Media.Audio.IAudioNodeEmitter2
  Audio_IAudioNodeEmitter2 = interface;
  PAudio_IAudioNodeEmitter2 = ^Audio_IAudioNodeEmitter2;

  // Windows.Media.Audio.IAudioNodeEmitterFactory
  Audio_IAudioNodeEmitterFactory = interface;
  PAudio_IAudioNodeEmitterFactory = ^Audio_IAudioNodeEmitterFactory;

  // Windows.Media.Capture.IMediaCaptureFailedEventArgs
  Capture_IMediaCaptureFailedEventArgs = interface;
  PCapture_IMediaCaptureFailedEventArgs = ^Capture_IMediaCaptureFailedEventArgs;

  // Windows.Media.Capture.IMediaCaptureInitializationSettings
  Capture_IMediaCaptureInitializationSettings = interface;
  PCapture_IMediaCaptureInitializationSettings = ^Capture_IMediaCaptureInitializationSettings;

  // Windows.Media.IMediaExtension
  IMediaExtension = interface;
  PIMediaExtension = ^IMediaExtension;

  // Windows.Media.Capture.RecordLimitationExceededEventHandler
  Capture_RecordLimitationExceededEventHandler = interface;
  PCapture_RecordLimitationExceededEventHandler = ^Capture_RecordLimitationExceededEventHandler;

  // Windows.Media.Capture.IMediaCaptureSettings
  Capture_IMediaCaptureSettings = interface;
  PCapture_IMediaCaptureSettings = ^Capture_IMediaCaptureSettings;

  // Windows.Media.Capture.IMediaCapture
  Capture_IMediaCapture = interface;
  PCapture_IMediaCapture = ^Capture_IMediaCapture;

  // Windows.Media.Capture.MediaCaptureFailedEventHandler
  Capture_MediaCaptureFailedEventHandler = interface;
  PCapture_MediaCaptureFailedEventHandler = ^Capture_MediaCaptureFailedEventHandler;

  // Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
  Capture_IMediaCaptureVideoProfileMediaDescription = interface;
  PCapture_IMediaCaptureVideoProfileMediaDescription = ^Capture_IMediaCaptureVideoProfileMediaDescription;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription = interface;
  PIIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription = ^IIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IIterable_1__Capture_IMediaCaptureVideoProfileMediaDescription = interface;
  PIIterable_1__Capture_IMediaCaptureVideoProfileMediaDescription = ^IIterable_1__Capture_IMediaCaptureVideoProfileMediaDescription;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription = interface;
  PIVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription = ^IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IIterator_1__Capture_IMediaCaptureVideoProfile = interface;
  PIIterator_1__Capture_IMediaCaptureVideoProfile = ^IIterator_1__Capture_IMediaCaptureVideoProfile;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IIterable_1__Capture_IMediaCaptureVideoProfile = interface;
  PIIterable_1__Capture_IMediaCaptureVideoProfile = ^IIterable_1__Capture_IMediaCaptureVideoProfile;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IVectorView_1__Capture_IMediaCaptureVideoProfile = interface;
  PIVectorView_1__Capture_IMediaCaptureVideoProfile = ^IVectorView_1__Capture_IMediaCaptureVideoProfile;

  // Windows.Media.Capture.IMediaCaptureVideoProfile
  Capture_IMediaCaptureVideoProfile = interface;
  PCapture_IMediaCaptureVideoProfile = ^Capture_IMediaCaptureVideoProfile;

  // Windows.Media.Capture.IMediaCaptureInitializationSettings2
  Capture_IMediaCaptureInitializationSettings2 = interface;
  PCapture_IMediaCaptureInitializationSettings2 = ^Capture_IMediaCaptureInitializationSettings2;

  // Windows.Media.Core.IMediaSource
  Core_IMediaSource = interface;
  PCore_IMediaSource = ^Core_IMediaSource;

  // Windows.Media.Capture.IMediaCaptureInitializationSettings3
  Capture_IMediaCaptureInitializationSettings3 = interface;
  PCapture_IMediaCaptureInitializationSettings3 = ^Capture_IMediaCaptureInitializationSettings3;

  // Windows.Media.Capture.IMediaCaptureInitializationSettings4
  Capture_IMediaCaptureInitializationSettings4 = interface;
  PCapture_IMediaCaptureInitializationSettings4 = ^Capture_IMediaCaptureInitializationSettings4;

  // Windows.Media.Capture.Frames.IMediaFrameSourceInfo
  Capture_Frames_IMediaFrameSourceInfo = interface;
  PCapture_Frames_IMediaFrameSourceInfo = ^Capture_Frames_IMediaFrameSourceInfo;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IIterator_1__Capture_Frames_IMediaFrameSourceInfo = interface;
  PIIterator_1__Capture_Frames_IMediaFrameSourceInfo = ^IIterator_1__Capture_Frames_IMediaFrameSourceInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IIterable_1__Capture_Frames_IMediaFrameSourceInfo = interface;
  PIIterable_1__Capture_Frames_IMediaFrameSourceInfo = ^IIterable_1__Capture_Frames_IMediaFrameSourceInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IVectorView_1__Capture_Frames_IMediaFrameSourceInfo = interface;
  PIVectorView_1__Capture_Frames_IMediaFrameSourceInfo = ^IVectorView_1__Capture_Frames_IMediaFrameSourceInfo;

  // Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  Capture_Frames_IMediaFrameSourceGroup = interface;
  PCapture_Frames_IMediaFrameSourceGroup = ^Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Media.Capture.IMediaCaptureInitializationSettings5
  Capture_IMediaCaptureInitializationSettings5 = interface;
  PCapture_IMediaCaptureInitializationSettings5 = ^Capture_IMediaCaptureInitializationSettings5;

  // Windows.Media.Capture.IMediaCaptureInitializationSettings6
  Capture_IMediaCaptureInitializationSettings6 = interface;
  PCapture_IMediaCaptureInitializationSettings6 = ^Capture_IMediaCaptureInitializationSettings6;

  // Windows.Media.Capture.IMediaCaptureStatics
  Capture_IMediaCaptureStatics = interface;
  PCapture_IMediaCaptureStatics = ^Capture_IMediaCaptureStatics;

  // Windows.Media.Capture.ILowLagMediaRecording
  Capture_ILowLagMediaRecording = interface;
  PCapture_ILowLagMediaRecording = ^Capture_ILowLagMediaRecording;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagMediaRecording>
  AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording = interface;
  PAsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording = ^AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagMediaRecording>
  IAsyncOperation_1__Capture_ILowLagMediaRecording = interface;
  PIAsyncOperation_1__Capture_ILowLagMediaRecording = ^IAsyncOperation_1__Capture_ILowLagMediaRecording;

  // Windows.Media.Capture.ICapturedFrame
  Capture_ICapturedFrame = interface;
  PCapture_ICapturedFrame = ^Capture_ICapturedFrame;

  // Windows.Media.Capture.ICapturedPhoto
  Capture_ICapturedPhoto = interface;
  PCapture_ICapturedPhoto = ^Capture_ICapturedPhoto;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ICapturedPhoto>
  AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto = interface;
  PAsyncOperationCompletedHandler_1__Capture_ICapturedPhoto = ^AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ICapturedPhoto>
  IAsyncOperation_1__Capture_ICapturedPhoto = interface;
  PIAsyncOperation_1__Capture_ICapturedPhoto = ^IAsyncOperation_1__Capture_ICapturedPhoto;

  // Windows.Media.Capture.ILowLagPhotoCapture
  Capture_ILowLagPhotoCapture = interface;
  PCapture_ILowLagPhotoCapture = ^Capture_ILowLagPhotoCapture;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoCapture>
  AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture = interface;
  PAsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture = ^AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoCapture>
  IAsyncOperation_1__Capture_ILowLagPhotoCapture = interface;
  PIAsyncOperation_1__Capture_ILowLagPhotoCapture = ^IAsyncOperation_1__Capture_ILowLagPhotoCapture;

  // Windows.Media.Capture.IPhotoCapturedEventArgs
  Capture_IPhotoCapturedEventArgs = interface;
  PCapture_IPhotoCapturedEventArgs = ^Capture_IPhotoCapturedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.ILowLagPhotoSequenceCapture,Windows.Media.Capture.IPhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs = interface;
  PTypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs = ^TypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs;

  // Windows.Media.Capture.ILowLagPhotoSequenceCapture
  Capture_ILowLagPhotoSequenceCapture = interface;
  PCapture_ILowLagPhotoSequenceCapture = ^Capture_ILowLagPhotoSequenceCapture;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture = interface;
  PAsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture = ^AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture = interface;
  PIAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture = ^IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture;

  // Windows.Media.Capture.IMediaCapture2
  Capture_IMediaCapture2 = interface;
  PCapture_IMediaCapture2 = ^Capture_IMediaCapture2;

  // Windows.Media.Capture.ICapturedFrameControlValues
  Capture_ICapturedFrameControlValues = interface;
  PCapture_ICapturedFrameControlValues = ^Capture_ICapturedFrameControlValues;

  // Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs
  Capture_Core_IVariablePhotoCapturedEventArgs = interface;
  PCapture_Core_IVariablePhotoCapturedEventArgs = ^Capture_Core_IVariablePhotoCapturedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs = interface;
  PTypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs = ^TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Object>
  TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable = interface;
  PTypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable = ^TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable;

  // Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
  Capture_Core_IVariablePhotoSequenceCapture = interface;
  PCapture_Core_IVariablePhotoSequenceCapture = ^Capture_Core_IVariablePhotoSequenceCapture;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture = interface;
  PAsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture = ^AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture = interface;
  PIAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture = ^IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture;

  // Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs
  Capture_IMediaCaptureFocusChangedEventArgs = interface;
  PCapture_IMediaCaptureFocusChangedEventArgs = ^Capture_IMediaCaptureFocusChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs = interface;
  PTypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs = ^TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs;

  // Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs
  Capture_IPhotoConfirmationCapturedEventArgs = interface;
  PCapture_IPhotoConfirmationCapturedEventArgs = ^Capture_IPhotoConfirmationCapturedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs = interface;
  PTypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs = ^TypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs;

  // Windows.Media.Capture.IMediaCapture3
  Capture_IMediaCapture3 = interface;
  PCapture_IMediaCapture3 = ^Capture_IMediaCapture3;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IMediaExtension>
  AsyncOperationCompletedHandler_1__IMediaExtension = interface;
  PAsyncOperationCompletedHandler_1__IMediaExtension = ^AsyncOperationCompletedHandler_1__IMediaExtension;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.IMediaExtension>
  IAsyncOperation_1__IMediaExtension = interface;
  PIAsyncOperation_1__IMediaExtension = ^IAsyncOperation_1__IMediaExtension;

  // Windows.Media.Effects.IVideoEffectDefinition
  Effects_IVideoEffectDefinition = interface;
  PEffects_IVideoEffectDefinition = ^Effects_IVideoEffectDefinition;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Object>
  TypedEventHandler_2__Capture_IMediaCapture__IInspectable = interface;
  PTypedEventHandler_2__Capture_IMediaCapture__IInspectable = ^TypedEventHandler_2__Capture_IMediaCapture__IInspectable;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IVideoFrame>
  AsyncOperationCompletedHandler_1__IVideoFrame = interface;
  PAsyncOperationCompletedHandler_1__IVideoFrame = ^AsyncOperationCompletedHandler_1__IVideoFrame;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.IVideoFrame>
  IAsyncOperation_1__IVideoFrame = interface;
  PIAsyncOperation_1__IVideoFrame = ^IAsyncOperation_1__IVideoFrame;

  // Windows.Media.Capture.IAdvancedCapturedPhoto
  Capture_IAdvancedCapturedPhoto = interface;
  PCapture_IAdvancedCapturedPhoto = ^Capture_IAdvancedCapturedPhoto;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto = interface;
  PAsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto = ^AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  IAsyncOperation_1__Capture_IAdvancedCapturedPhoto = interface;
  PIAsyncOperation_1__Capture_IAdvancedCapturedPhoto = ^IAsyncOperation_1__Capture_IAdvancedCapturedPhoto;

  // Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs
  Capture_IOptionalReferencePhotoCapturedEventArgs = interface;
  PCapture_IOptionalReferencePhotoCapturedEventArgs = ^Capture_IOptionalReferencePhotoCapturedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs = interface;
  PTypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs = ^TypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Object>
  TypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable = interface;
  PTypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable = ^TypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable;

  // Windows.Media.Capture.IAdvancedPhotoCapture
  Capture_IAdvancedPhotoCapture = interface;
  PCapture_IAdvancedPhotoCapture = ^Capture_IAdvancedPhotoCapture;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture = interface;
  PAsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture = ^AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  IAsyncOperation_1__Capture_IAdvancedPhotoCapture = interface;
  PIAsyncOperation_1__Capture_IAdvancedPhotoCapture = ^IAsyncOperation_1__Capture_IAdvancedPhotoCapture;

  // Windows.Media.Capture.IMediaCapture4
  Capture_IMediaCapture4 = interface;
  PCapture_IMediaCapture4 = ^Capture_IMediaCapture4;

  // Windows.Media.Capture.IMediaCapturePauseResult
  Capture_IMediaCapturePauseResult = interface;
  PCapture_IMediaCapturePauseResult = ^Capture_IMediaCapturePauseResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCapturePauseResult>
  AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult = interface;
  PAsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult = ^AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCapturePauseResult>
  IAsyncOperation_1__Capture_IMediaCapturePauseResult = interface;
  PIAsyncOperation_1__Capture_IMediaCapturePauseResult = ^IAsyncOperation_1__Capture_IMediaCapturePauseResult;

  // Windows.Media.Capture.IMediaCaptureStopResult
  Capture_IMediaCaptureStopResult = interface;
  PCapture_IMediaCaptureStopResult = ^Capture_IMediaCaptureStopResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCaptureStopResult>
  AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult = interface;
  PAsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult = ^AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCaptureStopResult>
  IAsyncOperation_1__Capture_IMediaCaptureStopResult = interface;
  PIAsyncOperation_1__Capture_IMediaCaptureStopResult = ^IAsyncOperation_1__Capture_IMediaCaptureStopResult;

  // Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult
  Capture_Frames_IMediaFrameSourceGetPropertyResult = interface;
  PCapture_Frames_IMediaFrameSourceGetPropertyResult = ^Capture_Frames_IMediaFrameSourceGetPropertyResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult = ^AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult = interface;
  PIAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult = ^IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus = ^AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus = interface;
  PIAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus = ^IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus;

  // Windows.Media.Capture.Frames.IMediaFrameSourceController
  Capture_Frames_IMediaFrameSourceController = interface;
  PCapture_Frames_IMediaFrameSourceController = ^Capture_Frames_IMediaFrameSourceController;

  // Windows.Media.Capture.Frames.IDepthMediaFrameFormat
  Capture_Frames_IDepthMediaFrameFormat = interface;
  PCapture_Frames_IDepthMediaFrameFormat = ^Capture_Frames_IDepthMediaFrameFormat;

  // Windows.Media.Capture.Frames.IVideoMediaFrameFormat
  Capture_Frames_IVideoMediaFrameFormat = interface;
  PCapture_Frames_IVideoMediaFrameFormat = ^Capture_Frames_IVideoMediaFrameFormat;

  // Windows.Media.Capture.Frames.IMediaFrameFormat
  Capture_Frames_IMediaFrameFormat = interface;
  PCapture_Frames_IMediaFrameFormat = ^Capture_Frames_IMediaFrameFormat;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IIterator_1__Capture_Frames_IMediaFrameFormat = interface;
  PIIterator_1__Capture_Frames_IMediaFrameFormat = ^IIterator_1__Capture_Frames_IMediaFrameFormat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IIterable_1__Capture_Frames_IMediaFrameFormat = interface;
  PIIterable_1__Capture_Frames_IMediaFrameFormat = ^IIterable_1__Capture_Frames_IMediaFrameFormat;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IVectorView_1__Capture_Frames_IMediaFrameFormat = interface;
  PIVectorView_1__Capture_Frames_IMediaFrameFormat = ^IVectorView_1__Capture_Frames_IMediaFrameFormat;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameSource,Object>
  TypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable = interface;
  PTypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable = ^TypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable;

  // Windows.Media.Capture.Frames.IMediaFrameSource
  Capture_Frames_IMediaFrameSource = interface;
  PCapture_Frames_IMediaFrameSource = ^Capture_Frames_IMediaFrameSource;

  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = interface;
  PIKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = ^IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource;

  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  IIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = interface;
  PIIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = ^IIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  IIterable_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = interface;
  PIIterable_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = ^IIterable_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource;

  // Windows.Foundation.Collections.IMapView`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource = interface;
  PIMapView_2__HSTRING__Capture_Frames_IMediaFrameSource = ^IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource;

  // Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs
  Capture_Frames_IMediaFrameArrivedEventArgs = interface;
  PCapture_Frames_IMediaFrameArrivedEventArgs = ^Capture_Frames_IMediaFrameArrivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameReader,Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs>
  TypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs = interface;
  PTypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs = ^TypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs;

  // Windows.Media.Capture.Frames.IBufferMediaFrame
  Capture_Frames_IBufferMediaFrame = interface;
  PCapture_Frames_IBufferMediaFrame = ^Capture_Frames_IBufferMediaFrame;

  // Windows.Media.Capture.Frames.IInfraredMediaFrame
  Capture_Frames_IInfraredMediaFrame = interface;
  PCapture_Frames_IInfraredMediaFrame = ^Capture_Frames_IInfraredMediaFrame;

  // Windows.Media.Capture.Frames.IDepthMediaFrame
  Capture_Frames_IDepthMediaFrame = interface;
  PCapture_Frames_IDepthMediaFrame = ^Capture_Frames_IDepthMediaFrame;

  // Windows.Media.Capture.Frames.IVideoMediaFrame
  Capture_Frames_IVideoMediaFrame = interface;
  PCapture_Frames_IVideoMediaFrame = ^Capture_Frames_IVideoMediaFrame;

  // Windows.Media.Capture.Frames.IMediaFrameReference
  Capture_Frames_IMediaFrameReference = interface;
  PCapture_Frames_IMediaFrameReference = ^Capture_Frames_IMediaFrameReference;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus = ^AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus = interface;
  PIAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus = ^IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus;

  // Windows.Media.Capture.Frames.IMediaFrameReader
  Capture_Frames_IMediaFrameReader = interface;
  PCapture_Frames_IMediaFrameReader = ^Capture_Frames_IMediaFrameReader;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader = ^AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  IAsyncOperation_1__Capture_Frames_IMediaFrameReader = interface;
  PIAsyncOperation_1__Capture_Frames_IMediaFrameReader = ^IAsyncOperation_1__Capture_Frames_IMediaFrameReader;

  // Windows.Media.Capture.IMediaCapture5
  Capture_IMediaCapture5 = interface;
  PCapture_IMediaCapture5 = ^Capture_IMediaCapture5;

  // Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs
  Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs = interface;
  PCapture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs = ^Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs = interface;
  PTypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs = ^TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs;

  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs
  Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs = interface;
  PCapture_Frames_IMultiSourceMediaFrameArrivedEventArgs = ^Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader,Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs>
  TypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs = interface;
  PTypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs = ^TypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs;

  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameReference
  Capture_Frames_IMultiSourceMediaFrameReference = interface;
  PCapture_Frames_IMultiSourceMediaFrameReference = ^Capture_Frames_IMultiSourceMediaFrameReference;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus = ^AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus = interface;
  PIAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus = ^IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus;

  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
  Capture_Frames_IMultiSourceMediaFrameReader = interface;
  PCapture_Frames_IMultiSourceMediaFrameReader = ^Capture_Frames_IMultiSourceMediaFrameReader;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader = ^AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader = interface;
  PIAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader = ^IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  IIterator_1__Capture_Frames_IMediaFrameSource = interface;
  PIIterator_1__Capture_Frames_IMediaFrameSource = ^IIterator_1__Capture_Frames_IMediaFrameSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  IIterable_1__Capture_Frames_IMediaFrameSource = interface;
  PIIterable_1__Capture_Frames_IMediaFrameSource = ^IIterable_1__Capture_Frames_IMediaFrameSource;

  // Windows.Media.Capture.IMediaCapture6
  Capture_IMediaCapture6 = interface;
  PCapture_IMediaCapture6 = ^Capture_IMediaCapture6;

  // Windows.Media.Capture.IAdvancedCapturedPhoto2
  Capture_IAdvancedCapturedPhoto2 = interface;
  PCapture_IAdvancedCapturedPhoto2 = ^Capture_IAdvancedCapturedPhoto2;

  // Windows.Media.Capture.ILowLagMediaRecording2
  Capture_ILowLagMediaRecording2 = interface;
  PCapture_ILowLagMediaRecording2 = ^Capture_ILowLagMediaRecording2;

  // Windows.Media.Capture.ILowLagMediaRecording3
  Capture_ILowLagMediaRecording3 = interface;
  PCapture_ILowLagMediaRecording3 = ^Capture_ILowLagMediaRecording3;

  // Windows.Foundation.IReference`1<Double>
  IReference_1__Double = interface;
  PIReference_1__Double = ^IReference_1__Double;

  // Windows.Foundation.IReference`1<Windows.Media.Capture.WhiteBalanceGain>
  IReference_1__Capture_WhiteBalanceGain = interface;
  PIReference_1__Capture_WhiteBalanceGain = ^IReference_1__Capture_WhiteBalanceGain;

  // Windows.Media.Capture.ICapturedFrameControlValues2
  Capture_ICapturedFrameControlValues2 = interface;
  PCapture_ICapturedFrameControlValues2 = ^Capture_ICapturedFrameControlValues2;

  // Windows.Media.Capture.ICapturedFrameWithSoftwareBitmap
  Capture_ICapturedFrameWithSoftwareBitmap = interface;
  PCapture_ICapturedFrameWithSoftwareBitmap = ^Capture_ICapturedFrameWithSoftwareBitmap;

  // Windows.Media.Capture.IMediaCaptureVideoPreview
  Capture_IMediaCaptureVideoPreview = interface;
  PCapture_IMediaCaptureVideoPreview = ^Capture_IMediaCaptureVideoPreview;

  // Windows.Media.Capture.IMediaCaptureSettings2
  Capture_IMediaCaptureSettings2 = interface;
  PCapture_IMediaCaptureSettings2 = ^Capture_IMediaCaptureSettings2;

  // Windows.Media.Capture.IVideoStreamConfiguration
  Capture_IVideoStreamConfiguration = interface;
  PCapture_IVideoStreamConfiguration = ^Capture_IVideoStreamConfiguration;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IIterator_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PIIterator_1__Capture_Frames_IMediaFrameSourceGroup = ^IIterator_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IIterable_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PIIterable_1__Capture_Frames_IMediaFrameSourceGroup = ^IIterable_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PIVectorView_1__Capture_Frames_IMediaFrameSourceGroup = ^IVectorView_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = ^AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PIAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = ^IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PAsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup = ^AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup = interface;
  PIAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup = ^IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup;

  // Windows.Media.Capture.Frames.IMediaFrameSourceGroupStatics
  Capture_Frames_IMediaFrameSourceGroupStatics = interface;
  PCapture_Frames_IMediaFrameSourceGroupStatics = ^Capture_Frames_IMediaFrameSourceGroupStatics;

  // Windows.Media.Capture.Frames.IMediaFrameReader2
  Capture_Frames_IMediaFrameReader2 = interface;
  PCapture_Frames_IMediaFrameReader2 = ^Capture_Frames_IMediaFrameReader2;

  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader2
  Capture_Frames_IMultiSourceMediaFrameReader2 = interface;
  PCapture_Frames_IMultiSourceMediaFrameReader2 = ^Capture_Frames_IMultiSourceMediaFrameReader2;

  // Windows.Media.Capture.Frames.IMediaFrameSourceController2
  Capture_Frames_IMediaFrameSourceController2 = interface;
  PCapture_Frames_IMediaFrameSourceController2 = ^Capture_Frames_IMediaFrameSourceController2;

  // Windows.Media.Capture.Frames.IDepthMediaFrame2
  Capture_Frames_IDepthMediaFrame2 = interface;
  PCapture_Frames_IDepthMediaFrame2 = ^Capture_Frames_IDepthMediaFrame2;

  // Windows.Media.Capture.Core.IVariablePhotoSequenceCapture2
  Capture_Core_IVariablePhotoSequenceCapture2 = interface;
  PCapture_Core_IVariablePhotoSequenceCapture2 = ^Capture_Core_IVariablePhotoSequenceCapture2;

  // Windows.Media.Casting.ICastingSource
  Casting_ICastingSource = interface;
  PCasting_ICastingSource = ^Casting_ICastingSource;

  // Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs
  Casting_ICastingConnectionErrorOccurredEventArgs = interface;
  PCasting_ICastingConnectionErrorOccurredEventArgs = ^Casting_ICastingConnectionErrorOccurredEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingPlaybackTypes>
  AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes = interface;
  PAsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes = ^AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingPlaybackTypes>
  IAsyncOperation_1__Casting_CastingPlaybackTypes = interface;
  PIAsyncOperation_1__Casting_CastingPlaybackTypes = ^IAsyncOperation_1__Casting_CastingPlaybackTypes;

  // Windows.Media.Casting.ICastingDevice
  Casting_ICastingDevice = interface;
  PCasting_ICastingDevice = ^Casting_ICastingDevice;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Object>
  TypedEventHandler_2__Casting_ICastingConnection__IInspectable = interface;
  PTypedEventHandler_2__Casting_ICastingConnection__IInspectable = ^TypedEventHandler_2__Casting_ICastingConnection__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs>
  TypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs = interface;
  PTypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs = ^TypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus = interface;
  PAsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus = ^AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  IAsyncOperation_1__Casting_CastingConnectionErrorStatus = interface;
  PIAsyncOperation_1__Casting_CastingConnectionErrorStatus = ^IAsyncOperation_1__Casting_CastingConnectionErrorStatus;

  // Windows.Media.Casting.ICastingConnection
  Casting_ICastingConnection = interface;
  PCasting_ICastingConnection = ^Casting_ICastingConnection;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<String>
  AsyncOperationCompletedHandler_1__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__HSTRING = ^AsyncOperationCompletedHandler_1__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<String>
  IAsyncOperation_1__HSTRING = interface;
  PIAsyncOperation_1__HSTRING = ^IAsyncOperation_1__HSTRING;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.ICastingDevice>
  AsyncOperationCompletedHandler_1__Casting_ICastingDevice = interface;
  PAsyncOperationCompletedHandler_1__Casting_ICastingDevice = ^AsyncOperationCompletedHandler_1__Casting_ICastingDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.ICastingDevice>
  IAsyncOperation_1__Casting_ICastingDevice = interface;
  PIAsyncOperation_1__Casting_ICastingDevice = ^IAsyncOperation_1__Casting_ICastingDevice;

  // Windows.Media.Casting.ICastingDeviceStatics
  Casting_ICastingDeviceStatics = interface;
  PCasting_ICastingDeviceStatics = ^Casting_ICastingDeviceStatics;

  // Windows.Media.Casting.ICastingDeviceSelectedEventArgs
  Casting_ICastingDeviceSelectedEventArgs = interface;
  PCasting_ICastingDeviceSelectedEventArgs = ^Casting_ICastingDeviceSelectedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Casting.ICastingSource>
  IIterator_1__Casting_ICastingSource = interface;
  PIIterator_1__Casting_ICastingSource = ^IIterator_1__Casting_ICastingSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Casting.ICastingSource>
  IIterable_1__Casting_ICastingSource = interface;
  PIIterable_1__Casting_ICastingSource = ^IIterable_1__Casting_ICastingSource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Casting.ICastingSource>
  IVectorView_1__Casting_ICastingSource = interface;
  PIVectorView_1__Casting_ICastingSource = ^IVectorView_1__Casting_ICastingSource;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Casting.ICastingSource>
  IVector_1__Casting_ICastingSource = interface;
  PIVector_1__Casting_ICastingSource = ^IVector_1__Casting_ICastingSource;

  // Windows.Media.Casting.ICastingDevicePickerFilter
  Casting_ICastingDevicePickerFilter = interface;
  PCasting_ICastingDevicePickerFilter = ^Casting_ICastingDevicePickerFilter;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Windows.Media.Casting.ICastingDeviceSelectedEventArgs>
  TypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs = interface;
  PTypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs = ^TypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Object>
  TypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable = interface;
  PTypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable = ^TypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable;

  // Windows.Media.Casting.ICastingDevicePicker
  Casting_ICastingDevicePicker = interface;
  PCasting_ICastingDevicePicker = ^Casting_ICastingDevicePicker;

  // Windows.Media.Core.IDataCue
  Core_IDataCue = interface;
  PCore_IDataCue = ^Core_IDataCue;

  // Windows.Media.Core.IDataCue2
  Core_IDataCue2 = interface;
  PCore_IDataCue2 = ^Core_IDataCue2;

  // Windows.Media.Core.IChapterCue
  Core_IChapterCue = interface;
  PCore_IChapterCue = ^Core_IChapterCue;

  // Windows.Media.Core.IImageCue
  Core_IImageCue = interface;
  PCore_IImageCue = ^Core_IImageCue;

  // Windows.Media.Core.ISpeechCue
  Core_ISpeechCue = interface;
  PCore_ISpeechCue = ^Core_ISpeechCue;

  // Windows.Media.Core.ITimedTextRegion
  Core_ITimedTextRegion = interface;
  PCore_ITimedTextRegion = ^Core_ITimedTextRegion;

  // Windows.Media.Core.ITimedTextStyle
  Core_ITimedTextStyle = interface;
  PCore_ITimedTextStyle = ^Core_ITimedTextStyle;

  // Windows.Media.Core.ITimedTextSubformat
  Core_ITimedTextSubformat = interface;
  PCore_ITimedTextSubformat = ^Core_ITimedTextSubformat;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSubformat>
  IIterator_1__Core_ITimedTextSubformat = interface;
  PIIterator_1__Core_ITimedTextSubformat = ^IIterator_1__Core_ITimedTextSubformat;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextSubformat>
  IIterable_1__Core_ITimedTextSubformat = interface;
  PIIterable_1__Core_ITimedTextSubformat = ^IIterable_1__Core_ITimedTextSubformat;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextSubformat>
  IVectorView_1__Core_ITimedTextSubformat = interface;
  PIVectorView_1__Core_ITimedTextSubformat = ^IVectorView_1__Core_ITimedTextSubformat;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextSubformat>
  IVector_1__Core_ITimedTextSubformat = interface;
  PIVector_1__Core_ITimedTextSubformat = ^IVector_1__Core_ITimedTextSubformat;

  // Windows.Media.Core.ITimedTextLine
  Core_ITimedTextLine = interface;
  PCore_ITimedTextLine = ^Core_ITimedTextLine;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextLine>
  IIterator_1__Core_ITimedTextLine = interface;
  PIIterator_1__Core_ITimedTextLine = ^IIterator_1__Core_ITimedTextLine;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextLine>
  IIterable_1__Core_ITimedTextLine = interface;
  PIIterable_1__Core_ITimedTextLine = ^IIterable_1__Core_ITimedTextLine;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextLine>
  IVectorView_1__Core_ITimedTextLine = interface;
  PIVectorView_1__Core_ITimedTextLine = ^IVectorView_1__Core_ITimedTextLine;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextLine>
  IVector_1__Core_ITimedTextLine = interface;
  PIVector_1__Core_ITimedTextLine = ^IVector_1__Core_ITimedTextLine;

  // Windows.Media.Core.ITimedTextCue
  Core_ITimedTextCue = interface;
  PCore_ITimedTextCue = ^Core_ITimedTextCue;

  // Windows.Media.Core.ITimedTextStyle2
  Core_ITimedTextStyle2 = interface;
  PCore_ITimedTextStyle2 = ^Core_ITimedTextStyle2;

  // Windows.Media.Core.ICodecInfo
  Core_ICodecInfo = interface;
  PCore_ICodecInfo = ^Core_ICodecInfo;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ICodecInfo>
  IIterator_1__Core_ICodecInfo = interface;
  PIIterator_1__Core_ICodecInfo = ^IIterator_1__Core_ICodecInfo;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ICodecInfo>
  IIterable_1__Core_ICodecInfo = interface;
  PIIterable_1__Core_ICodecInfo = ^IIterable_1__Core_ICodecInfo;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>
  IVectorView_1__Core_ICodecInfo = interface;
  PIVectorView_1__Core_ICodecInfo = ^IVectorView_1__Core_ICodecInfo;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo = ^AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  IAsyncOperation_1__IVectorView_1__Core_ICodecInfo = interface;
  PIAsyncOperation_1__IVectorView_1__Core_ICodecInfo = ^IAsyncOperation_1__IVectorView_1__Core_ICodecInfo;

  // Windows.Media.Core.ICodecQuery
  Core_ICodecQuery = interface;
  PCore_ICodecQuery = ^Core_ICodecQuery;

  // Windows.Media.Core.ILowLightFusionResult
  Core_ILowLightFusionResult = interface;
  PCore_ILowLightFusionResult = ^Core_ILowLightFusionResult;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double = interface;
  PAsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double = ^AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double = ^AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Core.ILowLightFusionResult,Double>
  IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double = interface;
  PIAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double = ^IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double;

  // Windows.Media.Core.ILowLightFusionStatics
  Core_ILowLightFusionStatics = interface;
  PCore_ILowLightFusionStatics = ^Core_ILowLightFusionStatics;

  // Windows.Media.DialProtocol.IDialAppStateDetails
  DialProtocol_IDialAppStateDetails = interface;
  PDialProtocol_IDialAppStateDetails = ^DialProtocol_IDialAppStateDetails;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult = interface;
  PAsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult = ^AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  IAsyncOperation_1__DialProtocol_DialAppLaunchResult = interface;
  PIAsyncOperation_1__DialProtocol_DialAppLaunchResult = ^IAsyncOperation_1__DialProtocol_DialAppLaunchResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppStopResult>
  AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult = interface;
  PAsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult = ^AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppStopResult>
  IAsyncOperation_1__DialProtocol_DialAppStopResult = interface;
  PIAsyncOperation_1__DialProtocol_DialAppStopResult = ^IAsyncOperation_1__DialProtocol_DialAppStopResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails = interface;
  PAsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails = ^AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  IAsyncOperation_1__DialProtocol_IDialAppStateDetails = interface;
  PIAsyncOperation_1__DialProtocol_IDialAppStateDetails = ^IAsyncOperation_1__DialProtocol_IDialAppStateDetails;

  // Windows.Media.DialProtocol.IDialApp
  DialProtocol_IDialApp = interface;
  PDialProtocol_IDialApp = ^DialProtocol_IDialApp;

  // Windows.Media.DialProtocol.IDialDevice
  DialProtocol_IDialDevice = interface;
  PDialProtocol_IDialDevice = ^DialProtocol_IDialDevice;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialDevice>
  AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice = interface;
  PAsyncOperationCompletedHandler_1__DialProtocol_IDialDevice = ^AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialDevice>
  IAsyncOperation_1__DialProtocol_IDialDevice = interface;
  PIAsyncOperation_1__DialProtocol_IDialDevice = ^IAsyncOperation_1__DialProtocol_IDialDevice;

  // Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs
  DialProtocol_IDialDeviceSelectedEventArgs = interface;
  PDialProtocol_IDialDeviceSelectedEventArgs = ^DialProtocol_IDialDeviceSelectedEventArgs;

  // Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs
  DialProtocol_IDialDisconnectButtonClickedEventArgs = interface;
  PDialProtocol_IDialDisconnectButtonClickedEventArgs = ^DialProtocol_IDialDisconnectButtonClickedEventArgs;

  // Windows.Foundation.Collections.IVector`1<String>
  IVector_1__HSTRING = interface;
  PIVector_1__HSTRING = ^IVector_1__HSTRING;

  // Windows.Media.DialProtocol.IDialDevicePickerFilter
  DialProtocol_IDialDevicePickerFilter = interface;
  PDialProtocol_IDialDevicePickerFilter = ^DialProtocol_IDialDevicePickerFilter;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs = interface;
  PTypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs = ^TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs = interface;
  PTypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs = ^TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Object>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable = interface;
  PTypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable = ^TypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable;

  // Windows.Media.DialProtocol.IDialDevicePicker
  DialProtocol_IDialDevicePicker = interface;
  PDialProtocol_IDialDevicePicker = ^DialProtocol_IDialDevicePicker;

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

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,String>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING = interface;
  PAsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING = ^AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,String>>
  IAsyncOperation_1__IMap_2__HSTRING__HSTRING = interface;
  PIAsyncOperation_1__IMap_2__HSTRING__HSTRING = ^IAsyncOperation_1__IMap_2__HSTRING__HSTRING;

  // Windows.Media.Effects.IVideoCompositorDefinition
  Effects_IVideoCompositorDefinition = interface;
  PEffects_IVideoCompositorDefinition = ^Effects_IVideoCompositorDefinition;

  // Windows.Media.Editing.IEmbeddedAudioTrack
  Editing_IEmbeddedAudioTrack = interface;
  PEditing_IEmbeddedAudioTrack = ^Editing_IEmbeddedAudioTrack;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IIterator_1__Editing_IEmbeddedAudioTrack = interface;
  PIIterator_1__Editing_IEmbeddedAudioTrack = ^IIterator_1__Editing_IEmbeddedAudioTrack;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IIterable_1__Editing_IEmbeddedAudioTrack = interface;
  PIIterable_1__Editing_IEmbeddedAudioTrack = ^IIterable_1__Editing_IEmbeddedAudioTrack;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IVectorView_1__Editing_IEmbeddedAudioTrack = interface;
  PIVectorView_1__Editing_IEmbeddedAudioTrack = ^IVectorView_1__Editing_IEmbeddedAudioTrack;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IVideoEffectDefinition>
  IIterator_1__Effects_IVideoEffectDefinition = interface;
  PIIterator_1__Effects_IVideoEffectDefinition = ^IIterator_1__Effects_IVideoEffectDefinition;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Effects.IVideoEffectDefinition>
  IIterable_1__Effects_IVideoEffectDefinition = interface;
  PIIterable_1__Effects_IVideoEffectDefinition = ^IIterable_1__Effects_IVideoEffectDefinition;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Effects.IVideoEffectDefinition>
  IVectorView_1__Effects_IVideoEffectDefinition = interface;
  PIVectorView_1__Effects_IVideoEffectDefinition = ^IVectorView_1__Effects_IVideoEffectDefinition;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IVideoEffectDefinition>
  IVector_1__Effects_IVideoEffectDefinition = interface;
  PIVector_1__Effects_IVideoEffectDefinition = ^IVector_1__Effects_IVideoEffectDefinition;

  // Windows.Media.Editing.IMediaClip
  Editing_IMediaClip = interface;
  PEditing_IMediaClip = ^Editing_IMediaClip;

  // Windows.Media.Editing.IMediaOverlay
  Editing_IMediaOverlay = interface;
  PEditing_IMediaOverlay = ^Editing_IMediaOverlay;

  // Windows.Media.Effects.ICompositeVideoFrameContext
  Effects_ICompositeVideoFrameContext = interface;
  PEffects_ICompositeVideoFrameContext = ^Effects_ICompositeVideoFrameContext;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaClip>
  IIterator_1__Editing_IMediaClip = interface;
  PIIterator_1__Editing_IMediaClip = ^IIterator_1__Editing_IMediaClip;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaClip>
  IIterable_1__Editing_IMediaClip = interface;
  PIIterable_1__Editing_IMediaClip = ^IIterable_1__Editing_IMediaClip;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaClip>
  IVectorView_1__Editing_IMediaClip = interface;
  PIVectorView_1__Editing_IMediaClip = ^IVectorView_1__Editing_IMediaClip;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaClip>
  IVector_1__Editing_IMediaClip = interface;
  PIVector_1__Editing_IMediaClip = ^IVector_1__Editing_IMediaClip;

  // Windows.Media.Editing.IBackgroundAudioTrack
  Editing_IBackgroundAudioTrack = interface;
  PEditing_IBackgroundAudioTrack = ^Editing_IBackgroundAudioTrack;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IIterator_1__Editing_IBackgroundAudioTrack = interface;
  PIIterator_1__Editing_IBackgroundAudioTrack = ^IIterator_1__Editing_IBackgroundAudioTrack;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IIterable_1__Editing_IBackgroundAudioTrack = interface;
  PIIterable_1__Editing_IBackgroundAudioTrack = ^IIterable_1__Editing_IBackgroundAudioTrack;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IVectorView_1__Editing_IBackgroundAudioTrack = interface;
  PIVectorView_1__Editing_IBackgroundAudioTrack = ^IVectorView_1__Editing_IBackgroundAudioTrack;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IVector_1__Editing_IBackgroundAudioTrack = interface;
  PIVector_1__Editing_IBackgroundAudioTrack = ^IVector_1__Editing_IBackgroundAudioTrack;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double = interface;
  PAsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double = ^AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double = ^AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double = interface;
  PIAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double = ^IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double;

  // Windows.Media.Core.IMediaStreamSourceClosedRequest
  Core_IMediaStreamSourceClosedRequest = interface;
  PCore_IMediaStreamSourceClosedRequest = ^Core_IMediaStreamSourceClosedRequest;

  // Windows.Media.Core.IMediaStreamSourceClosedEventArgs
  Core_IMediaStreamSourceClosedEventArgs = interface;
  PCore_IMediaStreamSourceClosedEventArgs = ^Core_IMediaStreamSourceClosedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceClosedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs = ^TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs;

  // Windows.Media.Core.IMediaStreamSourceStartingRequestDeferral
  Core_IMediaStreamSourceStartingRequestDeferral = interface;
  PCore_IMediaStreamSourceStartingRequestDeferral = ^Core_IMediaStreamSourceStartingRequestDeferral;

  // Windows.Media.Core.IMediaStreamSourceStartingRequest
  Core_IMediaStreamSourceStartingRequest = interface;
  PCore_IMediaStreamSourceStartingRequest = ^Core_IMediaStreamSourceStartingRequest;

  // Windows.Media.Core.IMediaStreamSourceStartingEventArgs
  Core_IMediaStreamSourceStartingEventArgs = interface;
  PCore_IMediaStreamSourceStartingEventArgs = ^Core_IMediaStreamSourceStartingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceStartingEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs = ^TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Object>
  TypedEventHandler_2__Core_IMediaStreamSource__IInspectable = interface;
  PTypedEventHandler_2__Core_IMediaStreamSource__IInspectable = ^TypedEventHandler_2__Core_IMediaStreamSource__IInspectable;

  // Windows.Media.Core.IMediaStreamDescriptor
  Core_IMediaStreamDescriptor = interface;
  PCore_IMediaStreamDescriptor = ^Core_IMediaStreamDescriptor;

  // Windows.Media.Core.IMediaStreamSourceSampleRequestDeferral
  Core_IMediaStreamSourceSampleRequestDeferral = interface;
  PCore_IMediaStreamSourceSampleRequestDeferral = ^Core_IMediaStreamSourceSampleRequestDeferral;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSample,Object>
  TypedEventHandler_2__Core_IMediaStreamSample__IInspectable = interface;
  PTypedEventHandler_2__Core_IMediaStreamSample__IInspectable = ^TypedEventHandler_2__Core_IMediaStreamSample__IInspectable;

  // Windows.Media.Core.IMediaStreamSampleProtectionProperties
  Core_IMediaStreamSampleProtectionProperties = interface;
  PCore_IMediaStreamSampleProtectionProperties = ^Core_IMediaStreamSampleProtectionProperties;

  // Windows.Media.Core.IMediaStreamSample
  Core_IMediaStreamSample = interface;
  PCore_IMediaStreamSample = ^Core_IMediaStreamSample;

  // Windows.Media.Core.IMediaStreamSourceSampleRequest
  Core_IMediaStreamSourceSampleRequest = interface;
  PCore_IMediaStreamSourceSampleRequest = ^Core_IMediaStreamSourceSampleRequest;

  // Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs
  Core_IMediaStreamSourceSampleRequestedEventArgs = interface;
  PCore_IMediaStreamSourceSampleRequestedEventArgs = ^Core_IMediaStreamSourceSampleRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs = ^TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs;

  // Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestDeferral
  Core_IMediaStreamSourceSwitchStreamsRequestDeferral = interface;
  PCore_IMediaStreamSourceSwitchStreamsRequestDeferral = ^Core_IMediaStreamSourceSwitchStreamsRequestDeferral;

  // Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequest
  Core_IMediaStreamSourceSwitchStreamsRequest = interface;
  PCore_IMediaStreamSourceSwitchStreamsRequest = ^Core_IMediaStreamSourceSwitchStreamsRequest;

  // Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs
  Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs = interface;
  PCore_IMediaStreamSourceSwitchStreamsRequestedEventArgs = ^Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs = ^TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs;

  // Windows.Media.Protection.IMediaProtectionServiceRequest
  Protection_IMediaProtectionServiceRequest = interface;
  PProtection_IMediaProtectionServiceRequest = ^Protection_IMediaProtectionServiceRequest;

  // Windows.Media.Protection.IMediaProtectionServiceCompletion
  Protection_IMediaProtectionServiceCompletion = interface;
  PProtection_IMediaProtectionServiceCompletion = ^Protection_IMediaProtectionServiceCompletion;

  // Windows.Media.Protection.IServiceRequestedEventArgs
  Protection_IServiceRequestedEventArgs = interface;
  PProtection_IServiceRequestedEventArgs = ^Protection_IServiceRequestedEventArgs;

  // Windows.Media.Protection.ServiceRequestedEventHandler
  Protection_ServiceRequestedEventHandler = interface;
  PProtection_ServiceRequestedEventHandler = ^Protection_ServiceRequestedEventHandler;

  // Windows.Media.Protection.RebootNeededEventHandler
  Protection_RebootNeededEventHandler = interface;
  PProtection_RebootNeededEventHandler = ^Protection_RebootNeededEventHandler;

  // Windows.Media.Protection.IRevocationAndRenewalItem
  Protection_IRevocationAndRenewalItem = interface;
  PProtection_IRevocationAndRenewalItem = ^Protection_IRevocationAndRenewalItem;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IIterator_1__Protection_IRevocationAndRenewalItem = interface;
  PIIterator_1__Protection_IRevocationAndRenewalItem = ^IIterator_1__Protection_IRevocationAndRenewalItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IIterable_1__Protection_IRevocationAndRenewalItem = interface;
  PIIterable_1__Protection_IRevocationAndRenewalItem = ^IIterable_1__Protection_IRevocationAndRenewalItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IVectorView_1__Protection_IRevocationAndRenewalItem = interface;
  PIVectorView_1__Protection_IRevocationAndRenewalItem = ^IVectorView_1__Protection_IRevocationAndRenewalItem;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IVector_1__Protection_IRevocationAndRenewalItem = interface;
  PIVector_1__Protection_IRevocationAndRenewalItem = ^IVector_1__Protection_IRevocationAndRenewalItem;

  // Windows.Media.Protection.IRevocationAndRenewalInformation
  Protection_IRevocationAndRenewalInformation = interface;
  PProtection_IRevocationAndRenewalInformation = ^Protection_IRevocationAndRenewalInformation;

  // Windows.Media.Protection.IComponentLoadFailedEventArgs
  Protection_IComponentLoadFailedEventArgs = interface;
  PProtection_IComponentLoadFailedEventArgs = ^Protection_IComponentLoadFailedEventArgs;

  // Windows.Media.Protection.ComponentLoadFailedEventHandler
  Protection_ComponentLoadFailedEventHandler = interface;
  PProtection_ComponentLoadFailedEventHandler = ^Protection_ComponentLoadFailedEventHandler;

  // Windows.Media.Protection.IMediaProtectionManager
  Protection_IMediaProtectionManager = interface;
  PProtection_IMediaProtectionManager = ^Protection_IMediaProtectionManager;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable = interface;
  PAsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable = ^AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  IAsyncOperation_1__IMap_2__HSTRING__IInspectable = interface;
  PIAsyncOperation_1__IMap_2__HSTRING__IInspectable = ^IAsyncOperation_1__IMap_2__HSTRING__IInspectable;

  // Windows.Media.Core.IMediaStreamSource
  Core_IMediaStreamSource = interface;
  PCore_IMediaStreamSource = ^Core_IMediaStreamSource;

  // Windows.Media.Editing.IMediaComposition
  Editing_IMediaComposition = interface;
  PEditing_IMediaComposition = ^Editing_IMediaComposition;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaClip>
  AsyncOperationCompletedHandler_1__Editing_IMediaClip = interface;
  PAsyncOperationCompletedHandler_1__Editing_IMediaClip = ^AsyncOperationCompletedHandler_1__Editing_IMediaClip;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaClip>
  IAsyncOperation_1__Editing_IMediaClip = interface;
  PIAsyncOperation_1__Editing_IMediaClip = ^IAsyncOperation_1__Editing_IMediaClip;

  // Windows.Media.Editing.IMediaClipStatics
  Editing_IMediaClipStatics = interface;
  PEditing_IMediaClipStatics = ^Editing_IMediaClipStatics;

  // Windows.Media.Editing.IMediaClipStatics2
  Editing_IMediaClipStatics2 = interface;
  PEditing_IMediaClipStatics2 = ^Editing_IMediaClipStatics2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaComposition>
  AsyncOperationCompletedHandler_1__Editing_IMediaComposition = interface;
  PAsyncOperationCompletedHandler_1__Editing_IMediaComposition = ^AsyncOperationCompletedHandler_1__Editing_IMediaComposition;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaComposition>
  IAsyncOperation_1__Editing_IMediaComposition = interface;
  PIAsyncOperation_1__Editing_IMediaComposition = ^IAsyncOperation_1__Editing_IMediaComposition;

  // Windows.Media.Editing.IMediaCompositionStatics
  Editing_IMediaCompositionStatics = interface;
  PEditing_IMediaCompositionStatics = ^Editing_IMediaCompositionStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IBackgroundAudioTrack>
  AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack = interface;
  PAsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack = ^AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IAsyncOperation_1__Editing_IBackgroundAudioTrack = interface;
  PIAsyncOperation_1__Editing_IBackgroundAudioTrack = ^IAsyncOperation_1__Editing_IBackgroundAudioTrack;

  // Windows.Media.Editing.IBackgroundAudioTrackStatics
  Editing_IBackgroundAudioTrackStatics = interface;
  PEditing_IBackgroundAudioTrackStatics = ^Editing_IBackgroundAudioTrackStatics;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlay>
  IIterator_1__Editing_IMediaOverlay = interface;
  PIIterator_1__Editing_IMediaOverlay = ^IIterator_1__Editing_IMediaOverlay;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaOverlay>
  IIterable_1__Editing_IMediaOverlay = interface;
  PIIterable_1__Editing_IMediaOverlay = ^IIterable_1__Editing_IMediaOverlay;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaOverlay>
  IVectorView_1__Editing_IMediaOverlay = interface;
  PIVectorView_1__Editing_IMediaOverlay = ^IVectorView_1__Editing_IMediaOverlay;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaOverlay>
  IVector_1__Editing_IMediaOverlay = interface;
  PIVector_1__Editing_IMediaOverlay = ^IVector_1__Editing_IMediaOverlay;

  // Windows.Media.Editing.IMediaOverlayLayer
  Editing_IMediaOverlayLayer = interface;
  PEditing_IMediaOverlayLayer = ^Editing_IMediaOverlayLayer;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlayLayer>
  IIterator_1__Editing_IMediaOverlayLayer = interface;
  PIIterator_1__Editing_IMediaOverlayLayer = ^IIterator_1__Editing_IMediaOverlayLayer;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaOverlayLayer>
  IIterable_1__Editing_IMediaOverlayLayer = interface;
  PIIterable_1__Editing_IMediaOverlayLayer = ^IIterable_1__Editing_IMediaOverlayLayer;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaOverlayLayer>
  IVectorView_1__Editing_IMediaOverlayLayer = interface;
  PIVectorView_1__Editing_IMediaOverlayLayer = ^IVectorView_1__Editing_IMediaOverlayLayer;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaOverlayLayer>
  IVector_1__Editing_IMediaOverlayLayer = interface;
  PIVector_1__Editing_IMediaOverlayLayer = ^IVector_1__Editing_IMediaOverlayLayer;

  // Windows.Media.Editing.IMediaComposition2
  Editing_IMediaComposition2 = interface;
  PEditing_IMediaComposition2 = ^Editing_IMediaComposition2;

  // Windows.Media.Editing.IMediaOverlayFactory
  Editing_IMediaOverlayFactory = interface;
  PEditing_IMediaOverlayFactory = ^Editing_IMediaOverlayFactory;

  // Windows.Media.Editing.IMediaOverlayLayerFactory
  Editing_IMediaOverlayLayerFactory = interface;
  PEditing_IMediaOverlayLayerFactory = ^Editing_IMediaOverlayLayerFactory;

  // Windows.Media.FaceAnalysis.IDetectedFace
  FaceAnalysis_IDetectedFace = interface;
  PFaceAnalysis_IDetectedFace = ^FaceAnalysis_IDetectedFace;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IIterator_1__FaceAnalysis_IDetectedFace = interface;
  PIIterator_1__FaceAnalysis_IDetectedFace = ^IIterator_1__FaceAnalysis_IDetectedFace;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IIterable_1__FaceAnalysis_IDetectedFace = interface;
  PIIterable_1__FaceAnalysis_IDetectedFace = ^IIterable_1__FaceAnalysis_IDetectedFace;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IVectorView_1__FaceAnalysis_IDetectedFace = interface;
  PIVectorView_1__FaceAnalysis_IDetectedFace = ^IVectorView_1__FaceAnalysis_IDetectedFace;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IVector_1__FaceAnalysis_IDetectedFace = interface;
  PIVector_1__FaceAnalysis_IDetectedFace = ^IVector_1__FaceAnalysis_IDetectedFace;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace = interface;
  PAsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace = ^AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  IAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace = interface;
  PIAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace = ^IAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace;

  // Windows.Media.Import.IPhotoImportStorageMedium
  Import_IPhotoImportStorageMedium = interface;
  PImport_IPhotoImportStorageMedium = ^Import_IPhotoImportStorageMedium;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IIterator_1__Import_IPhotoImportStorageMedium = interface;
  PIIterator_1__Import_IPhotoImportStorageMedium = ^IIterator_1__Import_IPhotoImportStorageMedium;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IIterable_1__Import_IPhotoImportStorageMedium = interface;
  PIIterable_1__Import_IPhotoImportStorageMedium = ^IIterable_1__Import_IPhotoImportStorageMedium;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IVectorView_1__Import_IPhotoImportStorageMedium = interface;
  PIVectorView_1__Import_IPhotoImportStorageMedium = ^IVectorView_1__Import_IPhotoImportStorageMedium;

  // Windows.Media.Import.IPhotoImportSidecar
  Import_IPhotoImportSidecar = interface;
  PImport_IPhotoImportSidecar = ^Import_IPhotoImportSidecar;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSidecar>
  IIterator_1__Import_IPhotoImportSidecar = interface;
  PIIterator_1__Import_IPhotoImportSidecar = ^IIterator_1__Import_IPhotoImportSidecar;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportSidecar>
  IIterable_1__Import_IPhotoImportSidecar = interface;
  PIIterable_1__Import_IPhotoImportSidecar = ^IIterable_1__Import_IPhotoImportSidecar;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSidecar>
  IVectorView_1__Import_IPhotoImportSidecar = interface;
  PIVectorView_1__Import_IPhotoImportSidecar = ^IVectorView_1__Import_IPhotoImportSidecar;

  // Windows.Media.Import.IPhotoImportVideoSegment
  Import_IPhotoImportVideoSegment = interface;
  PImport_IPhotoImportVideoSegment = ^Import_IPhotoImportVideoSegment;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IIterator_1__Import_IPhotoImportVideoSegment = interface;
  PIIterator_1__Import_IPhotoImportVideoSegment = ^IIterator_1__Import_IPhotoImportVideoSegment;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IIterable_1__Import_IPhotoImportVideoSegment = interface;
  PIIterable_1__Import_IPhotoImportVideoSegment = ^IIterable_1__Import_IPhotoImportVideoSegment;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IVectorView_1__Import_IPhotoImportVideoSegment = interface;
  PIVectorView_1__Import_IPhotoImportVideoSegment = ^IVectorView_1__Import_IPhotoImportVideoSegment;

  // Windows.Media.Import.IPhotoImportItem
  Import_IPhotoImportItem = interface;
  PImport_IPhotoImportItem = ^Import_IPhotoImportItem;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportItem>
  IIterator_1__Import_IPhotoImportItem = interface;
  PIIterator_1__Import_IPhotoImportItem = ^IIterator_1__Import_IPhotoImportItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportItem>
  IIterable_1__Import_IPhotoImportItem = interface;
  PIIterable_1__Import_IPhotoImportItem = ^IIterable_1__Import_IPhotoImportItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportItem>
  IVectorView_1__Import_IPhotoImportItem = interface;
  PIVectorView_1__Import_IPhotoImportItem = ^IVectorView_1__Import_IPhotoImportItem;

  // Windows.Media.Import.IPhotoImportSelectionChangedEventArgs
  Import_IPhotoImportSelectionChangedEventArgs = interface;
  PImport_IPhotoImportSelectionChangedEventArgs = ^Import_IPhotoImportSelectionChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportSelectionChangedEventArgs>
  TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs = interface;
  PTypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs = ^TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs;

  // Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult
  Import_IPhotoImportDeleteImportedItemsFromSourceResult = interface;
  PImport_IPhotoImportDeleteImportedItemsFromSourceResult = ^Import_IPhotoImportDeleteImportedItemsFromSourceResult;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = interface;
  PAsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = ^AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = ^AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = interface;
  PIAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = ^IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double;

  // Windows.Media.Import.IPhotoImportImportItemsResult
  Import_IPhotoImportImportItemsResult = interface;
  PImport_IPhotoImportImportItemsResult = ^Import_IPhotoImportImportItemsResult;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = interface;
  PAsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = ^AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = ^AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = interface;
  PIAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = ^IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress;

  // Windows.Media.Import.IPhotoImportItemImportedEventArgs
  Import_IPhotoImportItemImportedEventArgs = interface;
  PImport_IPhotoImportItemImportedEventArgs = ^Import_IPhotoImportItemImportedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportItemImportedEventArgs>
  TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs = interface;
  PTypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs = ^TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs;

  // Windows.Media.Import.IPhotoImportFindItemsResult
  Import_IPhotoImportFindItemsResult = interface;
  PImport_IPhotoImportFindItemsResult = ^Import_IPhotoImportFindItemsResult;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal = ^AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal = ^IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal;

  // Windows.Media.Import.IPhotoImportSession
  Import_IPhotoImportSession = interface;
  PImport_IPhotoImportSession = ^Import_IPhotoImportSession;

  // Windows.Media.Import.IPhotoImportSource
  Import_IPhotoImportSource = interface;
  PImport_IPhotoImportSource = ^Import_IPhotoImportSource;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSource>
  IIterator_1__Import_IPhotoImportSource = interface;
  PIIterator_1__Import_IPhotoImportSource = ^IIterator_1__Import_IPhotoImportSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportSource>
  IIterable_1__Import_IPhotoImportSource = interface;
  PIIterable_1__Import_IPhotoImportSource = ^IIterable_1__Import_IPhotoImportSource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>
  IVectorView_1__Import_IPhotoImportSource = interface;
  PIVectorView_1__Import_IPhotoImportSource = ^IVectorView_1__Import_IPhotoImportSource;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource = interface;
  PAsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource = ^AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource = interface;
  PIAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource = ^IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource;

  // Windows.Media.Import.IPhotoImportOperation
  Import_IPhotoImportOperation = interface;
  PImport_IPhotoImportOperation = ^Import_IPhotoImportOperation;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportOperation>
  IIterator_1__Import_IPhotoImportOperation = interface;
  PIIterator_1__Import_IPhotoImportOperation = ^IIterator_1__Import_IPhotoImportOperation;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportOperation>
  IIterable_1__Import_IPhotoImportOperation = interface;
  PIIterable_1__Import_IPhotoImportOperation = ^IIterable_1__Import_IPhotoImportOperation;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportOperation>
  IVectorView_1__Import_IPhotoImportOperation = interface;
  PIVectorView_1__Import_IPhotoImportOperation = ^IVectorView_1__Import_IPhotoImportOperation;

  // Windows.Media.Import.IPhotoImportManagerStatics
  Import_IPhotoImportManagerStatics = interface;
  PImport_IPhotoImportManagerStatics = ^Import_IPhotoImportManagerStatics;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Import.IPhotoImportSource>
  AsyncOperationCompletedHandler_1__Import_IPhotoImportSource = interface;
  PAsyncOperationCompletedHandler_1__Import_IPhotoImportSource = ^AsyncOperationCompletedHandler_1__Import_IPhotoImportSource;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Import.IPhotoImportSource>
  IAsyncOperation_1__Import_IPhotoImportSource = interface;
  PIAsyncOperation_1__Import_IPhotoImportSource = ^IAsyncOperation_1__Import_IPhotoImportSource;

  // Windows.Media.Import.IPhotoImportSourceStatics
  Import_IPhotoImportSourceStatics = interface;
  PImport_IPhotoImportSourceStatics = ^Import_IPhotoImportSourceStatics;

  // Windows.Media.Import.IPhotoImportSession2
  Import_IPhotoImportSession2 = interface;
  PImport_IPhotoImportSession2 = ^Import_IPhotoImportSession2;

  // Windows.Media.Import.IPhotoImportFindItemsResult2
  Import_IPhotoImportFindItemsResult2 = interface;
  PImport_IPhotoImportFindItemsResult2 = ^Import_IPhotoImportFindItemsResult2;

  // Windows.Media.Playback.IPlaybackMediaMarker
  Playback_IPlaybackMediaMarker = interface;
  PPlayback_IPlaybackMediaMarker = ^Playback_IPlaybackMediaMarker;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IPlaybackMediaMarker>
  IIterator_1__Playback_IPlaybackMediaMarker = interface;
  PIIterator_1__Playback_IPlaybackMediaMarker = ^IIterator_1__Playback_IPlaybackMediaMarker;

  // Windows.Media.Playback.IPlaybackMediaMarkerSequence
  Playback_IPlaybackMediaMarkerSequence = interface;
  PPlayback_IPlaybackMediaMarkerSequence = ^Playback_IPlaybackMediaMarkerSequence;

  // Windows.Media.Playback.IMediaPlayerFailedEventArgs
  Playback_IMediaPlayerFailedEventArgs = interface;
  PPlayback_IMediaPlayerFailedEventArgs = ^Playback_IMediaPlayerFailedEventArgs;

  // Windows.Media.Playback.IMediaPlayerRateChangedEventArgs
  Playback_IMediaPlayerRateChangedEventArgs = interface;
  PPlayback_IMediaPlayerRateChangedEventArgs = ^Playback_IMediaPlayerRateChangedEventArgs;

  // Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs
  Playback_IPlaybackMediaMarkerReachedEventArgs = interface;
  PPlayback_IPlaybackMediaMarkerReachedEventArgs = ^Playback_IPlaybackMediaMarkerReachedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Object>
  TypedEventHandler_2__Playback_IMediaPlayer__IInspectable = interface;
  PTypedEventHandler_2__Playback_IMediaPlayer__IInspectable = ^TypedEventHandler_2__Playback_IMediaPlayer__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerFailedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerRateChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs;

  // Windows.Media.Playback.IMediaPlayer
  Playback_IMediaPlayer = interface;
  PPlayback_IMediaPlayer = ^Playback_IMediaPlayer;

  // Windows.Media.IMusicDisplayProperties
  IMusicDisplayProperties = interface;
  PIMusicDisplayProperties = ^IMusicDisplayProperties;

  // Windows.Media.IVideoDisplayProperties
  IVideoDisplayProperties = interface;
  PIVideoDisplayProperties = ^IVideoDisplayProperties;

  // Windows.Media.Playback.IMediaPlaybackSource
  Playback_IMediaPlaybackSource = interface;
  PPlayback_IMediaPlaybackSource = ^Playback_IMediaPlaybackSource;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaCue>
  IIterator_1__Core_IMediaCue = interface;
  PIIterator_1__Core_IMediaCue = ^IIterator_1__Core_IMediaCue;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaCue>
  IIterable_1__Core_IMediaCue = interface;
  PIIterable_1__Core_IMediaCue = ^IIterable_1__Core_IMediaCue;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedMetadataTrack>
  IIterator_1__Core_ITimedMetadataTrack = interface;
  PIIterator_1__Core_ITimedMetadataTrack = ^IIterator_1__Core_ITimedMetadataTrack;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedMetadataTrack>
  IIterable_1__Core_ITimedMetadataTrack = interface;
  PIIterable_1__Core_ITimedMetadataTrack = ^IIterable_1__Core_ITimedMetadataTrack;

  // Windows.Media.Core.ITimedTextSourceResolveResultEventArgs
  Core_ITimedTextSourceResolveResultEventArgs = interface;
  PCore_ITimedTextSourceResolveResultEventArgs = ^Core_ITimedTextSourceResolveResultEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedTextSource,Windows.Media.Core.ITimedTextSourceResolveResultEventArgs>
  TypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs = interface;
  PTypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs = ^TypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs;

  // Windows.Media.Core.ITimedTextSource
  Core_ITimedTextSource = interface;
  PCore_ITimedTextSource = ^Core_ITimedTextSource;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSource>
  IIterator_1__Core_ITimedTextSource = interface;
  PIIterator_1__Core_ITimedTextSource = ^IIterator_1__Core_ITimedTextSource;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextSource>
  IIterable_1__Core_ITimedTextSource = interface;
  PIIterable_1__Core_ITimedTextSource = ^IIterable_1__Core_ITimedTextSource;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextSource>
  IVectorView_1__Core_ITimedTextSource = interface;
  PIVectorView_1__Core_ITimedTextSource = ^IVectorView_1__Core_ITimedTextSource;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextSource>
  IVector_1__Core_ITimedTextSource = interface;
  PIVector_1__Core_ITimedTextSource = ^IVector_1__Core_ITimedTextSource;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedMetadataTrack>
  IVector_1__Core_ITimedMetadataTrack = interface;
  PIVector_1__Core_ITimedMetadataTrack = ^IVector_1__Core_ITimedMetadataTrack;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaTrack>
  IIterator_1__Core_IMediaTrack = interface;
  PIIterator_1__Core_IMediaTrack = ^IIterator_1__Core_IMediaTrack;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaTrack>
  IIterable_1__Core_IMediaTrack = interface;
  PIIterable_1__Core_IMediaTrack = ^IIterable_1__Core_IMediaTrack;

  // Windows.Media.Playback.IMediaPlaybackItemError
  Playback_IMediaPlaybackItemError = interface;
  PPlayback_IMediaPlaybackItemError = ^Playback_IMediaPlaybackItemError;

  // Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs
  Playback_IMediaPlaybackItemFailedEventArgs = interface;
  PPlayback_IMediaPlaybackItemFailedEventArgs = ^Playback_IMediaPlaybackItemFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs;

  // Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs
  Playback_ICurrentMediaPlaybackItemChangedEventArgs = interface;
  PPlayback_ICurrentMediaPlaybackItemChangedEventArgs = ^Playback_ICurrentMediaPlaybackItemChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs;

  // Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs
  Playback_IMediaPlaybackItemOpenedEventArgs = interface;
  PPlayback_IMediaPlaybackItemOpenedEventArgs = ^Playback_IMediaPlaybackItemOpenedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs = ^TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaPlaybackItem>
  IIterator_1__Playback_IMediaPlaybackItem = interface;
  PIIterator_1__Playback_IMediaPlaybackItem = ^IIterator_1__Playback_IMediaPlaybackItem;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaPlaybackItem>
  IIterable_1__Playback_IMediaPlaybackItem = interface;
  PIIterable_1__Playback_IMediaPlaybackItem = ^IIterable_1__Playback_IMediaPlaybackItem;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaPlaybackItem>
  IVectorView_1__Playback_IMediaPlaybackItem = interface;
  PIVectorView_1__Playback_IMediaPlaybackItem = ^IVectorView_1__Playback_IMediaPlaybackItem;

  // Windows.Foundation.Collections.IVector`1<Windows.Media.Playback.IMediaPlaybackItem>
  IVector_1__Playback_IMediaPlaybackItem = interface;
  PIVector_1__Playback_IMediaPlaybackItem = ^IVector_1__Playback_IMediaPlaybackItem;

  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Playback.IMediaPlaybackItem>
  VectorChangedEventHandler_1__Playback_IMediaPlaybackItem = interface;
  PVectorChangedEventHandler_1__Playback_IMediaPlaybackItem = ^VectorChangedEventHandler_1__Playback_IMediaPlaybackItem;

  // Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Playback.IMediaPlaybackItem>
  IObservableVector_1__Playback_IMediaPlaybackItem = interface;
  PIObservableVector_1__Playback_IMediaPlaybackItem = ^IObservableVector_1__Playback_IMediaPlaybackItem;

  // Windows.Media.Playback.IMediaPlaybackList
  Playback_IMediaPlaybackList = interface;
  PPlayback_IMediaPlaybackList = ^Playback_IMediaPlaybackList;

  // Windows.Media.Playback.IMediaBreak
  Playback_IMediaBreak = interface;
  PPlayback_IMediaBreak = ^Playback_IMediaBreak;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaBreak>
  IIterator_1__Playback_IMediaBreak = interface;
  PIIterator_1__Playback_IMediaBreak = ^IIterator_1__Playback_IMediaBreak;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaBreak>
  IIterable_1__Playback_IMediaBreak = interface;
  PIIterable_1__Playback_IMediaBreak = ^IIterable_1__Playback_IMediaBreak;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaBreak>
  IVectorView_1__Playback_IMediaBreak = interface;
  PIVectorView_1__Playback_IMediaBreak = ^IVectorView_1__Playback_IMediaBreak;

  // Windows.Media.Playback.IMediaBreakSeekedOverEventArgs
  Playback_IMediaBreakSeekedOverEventArgs = interface;
  PPlayback_IMediaBreakSeekedOverEventArgs = ^Playback_IMediaBreakSeekedOverEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSeekedOverEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs = ^TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs;

  // Windows.Media.Playback.IMediaBreakStartedEventArgs
  Playback_IMediaBreakStartedEventArgs = interface;
  PPlayback_IMediaBreakStartedEventArgs = ^Playback_IMediaBreakStartedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakStartedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs = ^TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs;

  // Windows.Media.Playback.IMediaBreakEndedEventArgs
  Playback_IMediaBreakEndedEventArgs = interface;
  PPlayback_IMediaBreakEndedEventArgs = ^Playback_IMediaBreakEndedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakEndedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs = ^TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs;

  // Windows.Media.Playback.IMediaBreakSkippedEventArgs
  Playback_IMediaBreakSkippedEventArgs = interface;
  PPlayback_IMediaBreakSkippedEventArgs = ^Playback_IMediaBreakSkippedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSkippedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs = interface;
  PTypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs = ^TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackSession,Object>
  TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable = interface;
  PTypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable = ^TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable;

  // Windows.Media.Playback.IMediaPlaybackSession
  Playback_IMediaPlaybackSession = interface;
  PPlayback_IMediaPlaybackSession = ^Playback_IMediaPlaybackSession;

  // Windows.Media.Playback.IMediaBreakManager
  Playback_IMediaBreakManager = interface;
  PPlayback_IMediaBreakManager = ^Playback_IMediaBreakManager;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Object>
  TypedEventHandler_2__IMediaTimelineController__IInspectable = interface;
  PTypedEventHandler_2__IMediaTimelineController__IInspectable = ^TypedEventHandler_2__IMediaTimelineController__IInspectable;

  // Windows.Media.IMediaTimelineController
  IMediaTimelineController = interface;
  PIMediaTimelineController = ^IMediaTimelineController;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaTimeRange>
  IIterator_1__MediaTimeRange = interface;
  PIIterator_1__MediaTimeRange = ^IIterator_1__MediaTimeRange;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaTimeRange>
  IIterable_1__MediaTimeRange = interface;
  PIIterable_1__MediaTimeRange = ^IIterable_1__MediaTimeRange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaTimeRange>
  IVectorView_1__MediaTimeRange = interface;
  PIVectorView_1__MediaTimeRange = ^IVectorView_1__MediaTimeRange;

  // Windows.Media.Playback.IMediaPlaybackSessionBufferingStartedEventArgs
  Playback_IMediaPlaybackSessionBufferingStartedEventArgs = interface;
  PPlayback_IMediaPlaybackSessionBufferingStartedEventArgs = ^Playback_IMediaPlaybackSessionBufferingStartedEventArgs;

  // Windows.Media.Protection.PlayReady.INDSendResult
  Protection_PlayReady_INDSendResult = interface;
  PProtection_PlayReady_INDSendResult = ^Protection_PlayReady_INDSendResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDSendResult>
  AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult = interface;
  PAsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult = ^AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDSendResult>
  IAsyncOperation_1__Protection_PlayReady_INDSendResult = interface;
  PIAsyncOperation_1__Protection_PlayReady_INDSendResult = ^IAsyncOperation_1__Protection_PlayReady_INDSendResult;

  // Windows.Media.Protection.PlayReady.INDTransmitterProperties
  Protection_PlayReady_INDTransmitterProperties = interface;
  PProtection_PlayReady_INDTransmitterProperties = ^Protection_PlayReady_INDTransmitterProperties;

  // Windows.Media.Protection.PlayReady.INDStartResult
  Protection_PlayReady_INDStartResult = interface;
  PProtection_PlayReady_INDStartResult = ^Protection_PlayReady_INDStartResult;

  // Windows.Media.Protection.PlayReady.INDProximityDetectionCompletedEventArgs
  Protection_PlayReady_INDProximityDetectionCompletedEventArgs = interface;
  PProtection_PlayReady_INDProximityDetectionCompletedEventArgs = ^Protection_PlayReady_INDProximityDetectionCompletedEventArgs;

  // Windows.Media.Protection.PlayReady.INDClosedCaptionDataReceivedEventArgs
  Protection_PlayReady_INDClosedCaptionDataReceivedEventArgs = interface;
  PProtection_PlayReady_INDClosedCaptionDataReceivedEventArgs = ^Protection_PlayReady_INDClosedCaptionDataReceivedEventArgs;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDStartResult>
  AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult = interface;
  PAsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult = ^AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDStartResult>
  IAsyncOperation_1__Protection_PlayReady_INDStartResult = interface;
  PIAsyncOperation_1__Protection_PlayReady_INDStartResult = ^IAsyncOperation_1__Protection_PlayReady_INDStartResult;

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

  // Windows.Media.IMediaMarker
  IMediaMarker = interface;
  PIMediaMarker = ^IMediaMarker;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.IMediaMarker>
  IIterator_1__IMediaMarker = interface;
  PIIterator_1__IMediaMarker = ^IIterator_1__IMediaMarker;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.IMediaMarker>
  IIterable_1__IMediaMarker = interface;
  PIIterable_1__IMediaMarker = ^IIterable_1__IMediaMarker;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.IMediaMarker>
  IVectorView_1__IMediaMarker = interface;
  PIVectorView_1__IMediaMarker = ^IVectorView_1__IMediaMarker;

  // Windows.Media.IMediaMarkers
  IMediaMarkers = interface;
  PIMediaMarkers = ^IMediaMarkers;

  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface;
  PEventHandler_1__IInspectable = ^EventHandler_1__IInspectable;

  // Windows.Media.IMediaTimelineControllerFailedEventArgs
  IMediaTimelineControllerFailedEventArgs = interface;
  PIMediaTimelineControllerFailedEventArgs = ^IMediaTimelineControllerFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Windows.Media.IMediaTimelineControllerFailedEventArgs>
  TypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs = interface;
  PTypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs = ^TypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs;

  // Windows.Media.IMediaTimelineController2
  IMediaTimelineController2 = interface;
  PIMediaTimelineController2 = ^IMediaTimelineController2;

  // Windows.Media.Effects.IVideoCompositor
  Effects_IVideoCompositor = interface;
  PEffects_IVideoCompositor = ^Effects_IVideoCompositor;

  // Windows.Media.IVideoEffectsStatics
  IVideoEffectsStatics = interface;
  PIVideoEffectsStatics = ^IVideoEffectsStatics;

  // Windows.Media.Effects.IProcessVideoFrameContext
  Effects_IProcessVideoFrameContext = interface;
  PEffects_IProcessVideoFrameContext = ^Effects_IProcessVideoFrameContext;

  // Windows.Media.Effects.IBasicVideoEffect
  Effects_IBasicVideoEffect = interface;
  PEffects_IBasicVideoEffect = ^Effects_IBasicVideoEffect;

  // Windows.Media.Protection.IMediaProtectionPMPServer
  Protection_IMediaProtectionPMPServer = interface;
  PProtection_IMediaProtectionPMPServer = ^Protection_IMediaProtectionPMPServer;

  // Windows.Media.Protection.IMediaProtectionPMPServerFactory
  Protection_IMediaProtectionPMPServerFactory = interface;
  PProtection_IMediaProtectionPMPServerFactory = ^Protection_IMediaProtectionPMPServerFactory;

  // Windows.Media.Protection.IProtectionCapabilities
  Protection_IProtectionCapabilities = interface;
  PProtection_IProtectionCapabilities = ^Protection_IProtectionCapabilities;

  // Windows.Foundation.IReference`1<Windows.Media.Protection.HdcpProtection>
  IReference_1__Protection_HdcpProtection = interface;
  PIReference_1__Protection_HdcpProtection = ^IReference_1__Protection_HdcpProtection;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.HdcpSetProtectionResult>
  AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult = interface;
  PAsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult = ^AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.HdcpSetProtectionResult>
  IAsyncOperation_1__Protection_HdcpSetProtectionResult = interface;
  PIAsyncOperation_1__Protection_HdcpSetProtectionResult = ^IAsyncOperation_1__Protection_HdcpSetProtectionResult;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Protection.IHdcpSession,Object>
  TypedEventHandler_2__Protection_IHdcpSession__IInspectable = interface;
  PTypedEventHandler_2__Protection_IHdcpSession__IInspectable = ^TypedEventHandler_2__Protection_IHdcpSession__IInspectable;

  // Windows.Media.Protection.IHdcpSession
  Protection_IHdcpSession = interface;
  PProtection_IHdcpSession = ^Protection_IHdcpSession;

  // Windows.Media.Core.IMediaStreamDescriptor2
  Core_IMediaStreamDescriptor2 = interface;
  PCore_IMediaStreamDescriptor2 = ^Core_IMediaStreamDescriptor2;

  // Windows.Media.Core.IAudioStreamDescriptor2
  Core_IAudioStreamDescriptor2 = interface;
  PCore_IAudioStreamDescriptor2 = ^Core_IAudioStreamDescriptor2;

  // Windows.Media.Core.IAudioStreamDescriptorFactory
  Core_IAudioStreamDescriptorFactory = interface;
  PCore_IAudioStreamDescriptorFactory = ^Core_IAudioStreamDescriptorFactory;

  // Windows.Media.Core.IVideoStreamDescriptorFactory
  Core_IVideoStreamDescriptorFactory = interface;
  PCore_IVideoStreamDescriptorFactory = ^Core_IVideoStreamDescriptorFactory;

  // Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs
  Core_IMediaStreamSourceSampleRenderedEventArgs = interface;
  PCore_IMediaStreamSourceSampleRenderedEventArgs = ^Core_IMediaStreamSourceSampleRenderedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs = ^TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs;

  // Windows.Media.Core.IMediaStreamSource2
  Core_IMediaStreamSource2 = interface;
  PCore_IMediaStreamSource2 = ^Core_IMediaStreamSource2;

  // Windows.Media.Core.IMediaStreamSource3
  Core_IMediaStreamSource3 = interface;
  PCore_IMediaStreamSource3 = ^Core_IMediaStreamSource3;

  // Windows.Media.Core.IMediaStreamSource4
  Core_IMediaStreamSource4 = interface;
  PCore_IMediaStreamSource4 = ^Core_IMediaStreamSource4;

  // Windows.Media.Core.IMediaStreamSourceFactory
  Core_IMediaStreamSourceFactory = interface;
  PCore_IMediaStreamSourceFactory = ^Core_IMediaStreamSourceFactory;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Core.IMediaStreamSample>
  AsyncOperationCompletedHandler_1__Core_IMediaStreamSample = interface;
  PAsyncOperationCompletedHandler_1__Core_IMediaStreamSample = ^AsyncOperationCompletedHandler_1__Core_IMediaStreamSample;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Core.IMediaStreamSample>
  IAsyncOperation_1__Core_IMediaStreamSample = interface;
  PIAsyncOperation_1__Core_IMediaStreamSample = ^IAsyncOperation_1__Core_IMediaStreamSample;

  // Windows.Media.Core.IMediaStreamSampleStatics
  Core_IMediaStreamSampleStatics = interface;
  PCore_IMediaStreamSampleStatics = ^Core_IMediaStreamSampleStatics;

  // Windows.Media.Core.IMseStreamSourceStatics
  Core_IMseStreamSourceStatics = interface;
  PCore_IMseStreamSourceStatics = ^Core_IMseStreamSourceStatics;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseStreamSource,Object>
  TypedEventHandler_2__Core_IMseStreamSource__IInspectable = interface;
  PTypedEventHandler_2__Core_IMseStreamSource__IInspectable = ^TypedEventHandler_2__Core_IMseStreamSource__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBufferList,Object>
  TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable = interface;
  PTypedEventHandler_2__Core_IMseSourceBufferList__IInspectable = ^TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBuffer,Object>
  TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable = interface;
  PTypedEventHandler_2__Core_IMseSourceBuffer__IInspectable = ^TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.MseTimeRange>
  IIterator_1__Core_MseTimeRange = interface;
  PIIterator_1__Core_MseTimeRange = ^IIterator_1__Core_MseTimeRange;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.MseTimeRange>
  IIterable_1__Core_MseTimeRange = interface;
  PIIterable_1__Core_MseTimeRange = ^IIterable_1__Core_MseTimeRange;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.MseTimeRange>
  IVectorView_1__Core_MseTimeRange = interface;
  PIVectorView_1__Core_MseTimeRange = ^IVectorView_1__Core_MseTimeRange;

  // Windows.Media.Core.IMseSourceBuffer
  Core_IMseSourceBuffer = interface;
  PCore_IMseSourceBuffer = ^Core_IMseSourceBuffer;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMseSourceBuffer>
  IIterator_1__Core_IMseSourceBuffer = interface;
  PIIterator_1__Core_IMseSourceBuffer = ^IIterator_1__Core_IMseSourceBuffer;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMseSourceBuffer>
  IIterable_1__Core_IMseSourceBuffer = interface;
  PIIterable_1__Core_IMseSourceBuffer = ^IIterable_1__Core_IMseSourceBuffer;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMseSourceBuffer>
  IVectorView_1__Core_IMseSourceBuffer = interface;
  PIVectorView_1__Core_IMseSourceBuffer = ^IVectorView_1__Core_IMseSourceBuffer;

  // Windows.Media.Core.IMseSourceBufferList
  Core_IMseSourceBufferList = interface;
  PCore_IMseSourceBufferList = ^Core_IMseSourceBufferList;

  // Windows.Media.Core.IMseStreamSource
  Core_IMseStreamSource = interface;
  PCore_IMseStreamSource = ^Core_IMseStreamSource;

  // Windows.Foundation.IReference`1<Windows.Media.Core.MseTimeRange>
  IReference_1__Core_MseTimeRange = interface;
  PIReference_1__Core_MseTimeRange = ^IReference_1__Core_MseTimeRange;

  // Windows.Media.Core.IMseStreamSource2
  Core_IMseStreamSource2 = interface;
  PCore_IMseStreamSource2 = ^Core_IMseStreamSource2;

  // Windows.Foundation.AsyncActionProgressHandler`1<Double>
  AsyncActionProgressHandler_1__Double = interface;
  PAsyncActionProgressHandler_1__Double = ^AsyncActionProgressHandler_1__Double;

  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  AsyncActionWithProgressCompletedHandler_1__Double = interface;
  PAsyncActionWithProgressCompletedHandler_1__Double = ^AsyncActionWithProgressCompletedHandler_1__Double;

  // Windows.Foundation.IAsyncActionWithProgress`1<Double>
  IAsyncActionWithProgress_1__Double = interface;
  PIAsyncActionWithProgress_1__Double = ^IAsyncActionWithProgress_1__Double;

  // Windows.Media.Transcoding.IPrepareTranscodeResult
  Transcoding_IPrepareTranscodeResult = interface;
  PTranscoding_IPrepareTranscodeResult = ^Transcoding_IPrepareTranscodeResult;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult = interface;
  PAsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult = ^AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  IAsyncOperation_1__Transcoding_IPrepareTranscodeResult = interface;
  PIAsyncOperation_1__Transcoding_IPrepareTranscodeResult = ^IAsyncOperation_1__Transcoding_IPrepareTranscodeResult;

  // Windows.Media.Transcoding.IMediaTranscoder2
  Transcoding_IMediaTranscoder2 = interface;
  PTranscoding_IMediaTranscoder2 = ^Transcoding_IMediaTranscoder2;

  // Windows.Media.Transcoding.IMediaTranscoder
  Transcoding_IMediaTranscoder = interface;
  PTranscoding_IMediaTranscoder = ^Transcoding_IMediaTranscoder;

  // Windows.Media.Core.IHighDynamicRangeControl
  Core_IHighDynamicRangeControl = interface;
  PCore_IHighDynamicRangeControl = ^Core_IHighDynamicRangeControl;

  // Windows.Media.Core.IHighDynamicRangeOutput
  Core_IHighDynamicRangeOutput = interface;
  PCore_IHighDynamicRangeOutput = ^Core_IHighDynamicRangeOutput;

  // Windows.Media.Core.ISceneAnalysisEffectFrame
  Core_ISceneAnalysisEffectFrame = interface;
  PCore_ISceneAnalysisEffectFrame = ^Core_ISceneAnalysisEffectFrame;

  // Windows.Media.Core.ISceneAnalyzedEventArgs
  Core_ISceneAnalyzedEventArgs = interface;
  PCore_ISceneAnalyzedEventArgs = ^Core_ISceneAnalyzedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISceneAnalysisEffect,Windows.Media.Core.ISceneAnalyzedEventArgs>
  TypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs = interface;
  PTypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs = ^TypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs;

  // Windows.Media.Core.ISceneAnalysisEffect
  Core_ISceneAnalysisEffect = interface;
  PCore_ISceneAnalysisEffect = ^Core_ISceneAnalysisEffect;

  // Windows.Media.Core.ISceneAnalysisEffectFrame2
  Core_ISceneAnalysisEffectFrame2 = interface;
  PCore_ISceneAnalysisEffectFrame2 = ^Core_ISceneAnalysisEffectFrame2;

  // Windows.Media.Core.IFaceDetectionEffectFrame
  Core_IFaceDetectionEffectFrame = interface;
  PCore_IFaceDetectionEffectFrame = ^Core_IFaceDetectionEffectFrame;

  // Windows.Media.Core.IFaceDetectedEventArgs
  Core_IFaceDetectedEventArgs = interface;
  PCore_IFaceDetectedEventArgs = ^Core_IFaceDetectedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IFaceDetectionEffect,Windows.Media.Core.IFaceDetectedEventArgs>
  TypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs = interface;
  PTypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs = ^TypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs;

  // Windows.Media.Core.IFaceDetectionEffect
  Core_IFaceDetectionEffect = interface;
  PCore_IFaceDetectionEffect = ^Core_IFaceDetectionEffect;

  // Windows.Media.Core.IFaceDetectionEffectDefinition
  Core_IFaceDetectionEffectDefinition = interface;
  PCore_IFaceDetectionEffectDefinition = ^Core_IFaceDetectionEffectDefinition;

  // Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs
  Core_IVideoStabilizationEffectEnabledChangedEventArgs = interface;
  PCore_IVideoStabilizationEffectEnabledChangedEventArgs = ^Core_IVideoStabilizationEffectEnabledChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IVideoStabilizationEffect,Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs>
  TypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs = interface;
  PTypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs = ^TypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs;

  // Windows.Media.Core.IVideoStabilizationEffect
  Core_IVideoStabilizationEffect = interface;
  PCore_IVideoStabilizationEffect = ^Core_IVideoStabilizationEffect;

  // Windows.Foundation.Collections.IIterator`1<UInt32>
  IIterator_1__Cardinal = interface;
  PIIterator_1__Cardinal = ^IIterator_1__Cardinal;

  // Windows.Foundation.Collections.IIterable`1<UInt32>
  IIterable_1__Cardinal = interface;
  PIIterable_1__Cardinal = ^IIterable_1__Cardinal;

  // Windows.Foundation.Collections.IVectorView`1<UInt32>
  IVectorView_1__Cardinal = interface;
  PIVectorView_1__Cardinal = ^IVectorView_1__Cardinal;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = interface;
  PTypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = ^TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
  Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = ^Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = interface;
  PTypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = ^TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs;

  // Windows.Foundation.IReference`1<UInt64>
  IReference_1__UInt64 = interface;
  PIReference_1__UInt64 = ^IReference_1__UInt64;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadResult = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedDeferral
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedDeferral = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedDeferral = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedDeferral;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs = interface;
  PTypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs = ^TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs;

  // Windows.Foundation.AsyncOperationProgressHandler`2<UInt64,UInt64>
  AsyncOperationProgressHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationProgressHandler_2__UInt64__UInt64 = ^AsyncOperationProgressHandler_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<UInt64,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__UInt64__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<UInt64,UInt64>
  IAsyncOperationWithProgress_2__UInt64__UInt64 = interface;
  PIAsyncOperationWithProgress_2__UInt64__UInt64 = ^IAsyncOperationWithProgress_2__UInt64__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IBuffer__UInt64 = ^AsyncOperationProgressHandler_2__IBuffer__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IBuffer__UInt64 = ^IAsyncOperationWithProgress_2__IBuffer__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationProgressHandler_2__IInputStream__UInt64 = ^AsyncOperationProgressHandler_2__IInputStream__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface;
  PIAsyncOperationWithProgress_2__IInputStream__UInt64 = ^IAsyncOperationWithProgress_2__IInputStream__UInt64;

  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationProgressHandler_2__HSTRING__UInt64 = ^AsyncOperationProgressHandler_2__HSTRING__UInt64;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface;
  PAsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = ^AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64;

  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface;
  PIAsyncOperationWithProgress_2__HSTRING__UInt64 = ^IAsyncOperationWithProgress_2__HSTRING__UInt64;

  // Windows.Foundation.IReference`1<UInt8>
  IReference_1__Byte = interface;
  PIReference_1__Byte = ^IReference_1__Byte;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs = interface;
  PTypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs = ^TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs = interface;
  PTypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs = ^TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  Streaming_Adaptive_IAdaptiveMediaSource = interface;
  PStreaming_Adaptive_IAdaptiveMediaSource = ^Streaming_Adaptive_IAdaptiveMediaSource;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult
  Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceCreationResult = ^Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult2
  Streaming_Adaptive_IAdaptiveMediaSourceCreationResult2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceCreationResult2 = ^Streaming_Adaptive_IAdaptiveMediaSourceCreationResult2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = interface;
  PAsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = ^AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = interface;
  PIAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = ^IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceStatics
  Streaming_Adaptive_IAdaptiveMediaSourceStatics = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceStatics = ^Streaming_Adaptive_IAdaptiveMediaSourceStatics;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings
  Streaming_Adaptive_IAdaptiveMediaSourceAdvancedSettings = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceAdvancedSettings = ^Streaming_Adaptive_IAdaptiveMediaSourceAdvancedSettings;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource2
  Streaming_Adaptive_IAdaptiveMediaSource2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSource2 = ^Streaming_Adaptive_IAdaptiveMediaSource2;

  // Windows.Foundation.IReference`1<Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType>
  IReference_1__Streaming_Adaptive_AdaptiveMediaSourceResourceType = interface;
  PIReference_1__Streaming_Adaptive_AdaptiveMediaSourceResourceType = ^IReference_1__Streaming_Adaptive_AdaptiveMediaSourceResourceType;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs
  Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = ^Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = interface;
  PTypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = ^TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
  Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDiagnostics = ^Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes
  Streaming_Adaptive_IAdaptiveMediaSourceCorrelatedTimes = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceCorrelatedTimes = ^Streaming_Adaptive_IAdaptiveMediaSourceCorrelatedTimes;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource3
  Streaming_Adaptive_IAdaptiveMediaSource3 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSource3 = ^Streaming_Adaptive_IAdaptiveMediaSource3;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs2 = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs2;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadResult2 = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult2;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs2 = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs2;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs2 = ^Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs2;

  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 = interface;
  PStreaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 = ^Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2;

  // Windows.Media.Core.IMediaSourceStateChangedEventArgs
  Core_IMediaSourceStateChangedEventArgs = interface;
  PCore_IMediaSourceStateChangedEventArgs = ^Core_IMediaSourceStateChangedEventArgs;

  // Windows.Media.Core.IMediaSourceStatics
  Core_IMediaSourceStatics = interface;
  PCore_IMediaSourceStatics = ^Core_IMediaSourceStatics;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBindingEventArgs,Object>
  TypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable = interface;
  PTypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable = ^TypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable;

  // Windows.Media.Core.IMediaBindingEventArgs
  Core_IMediaBindingEventArgs = interface;
  PCore_IMediaBindingEventArgs = ^Core_IMediaBindingEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBinder,Windows.Media.Core.IMediaBindingEventArgs>
  TypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs = ^TypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs;

  // Windows.Media.Core.IMediaBinder
  Core_IMediaBinder = interface;
  PCore_IMediaBinder = ^Core_IMediaBinder;

  // Windows.Media.Core.IMediaSourceStatics2
  Core_IMediaSourceStatics2 = interface;
  PCore_IMediaSourceStatics2 = ^Core_IMediaSourceStatics2;

  // Windows.Media.Core.IMediaSourceStatics3
  Core_IMediaSourceStatics3 = interface;
  PCore_IMediaSourceStatics3 = ^Core_IMediaSourceStatics3;

  // Windows.Media.Core.IMediaBindingEventArgs2
  Core_IMediaBindingEventArgs2 = interface;
  PCore_IMediaBindingEventArgs2 = ^Core_IMediaBindingEventArgs2;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaSource2,Windows.Media.Core.IMediaSourceStateChangedEventArgs>
  TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceStateChangedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceStateChangedEventArgs = ^TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceStateChangedEventArgs;

  // Windows.Media.Core.IMediaSource3
  Core_IMediaSource3 = interface;
  PCore_IMediaSource3 = ^Core_IMediaSource3;

  // Windows.Media.Core.IMediaSource4
  Core_IMediaSource4 = interface;
  PCore_IMediaSource4 = ^Core_IMediaSource4;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISingleSelectMediaTrackList,Object>
  TypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable = interface;
  PTypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable = ^TypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable;

  // Windows.Media.Core.ISingleSelectMediaTrackList
  Core_ISingleSelectMediaTrackList = interface;
  PCore_ISingleSelectMediaTrackList = ^Core_ISingleSelectMediaTrackList;

  // Windows.Media.Core.ITimedMetadataTrackFactory
  Core_ITimedMetadataTrackFactory = interface;
  PCore_ITimedMetadataTrackFactory = ^Core_ITimedMetadataTrackFactory;

  // Windows.Media.Core.ITimedTextSourceStatics
  Core_ITimedTextSourceStatics = interface;
  PCore_ITimedTextSourceStatics = ^Core_ITimedTextSourceStatics;

  // Windows.Media.Core.ITimedTextSourceStatics2
  Core_ITimedTextSourceStatics2 = interface;
  PCore_ITimedTextSourceStatics2 = ^Core_ITimedTextSourceStatics2;

  // Windows.Media.Core.IVideoTrackSupportInfo
  Core_IVideoTrackSupportInfo = interface;
  PCore_IVideoTrackSupportInfo = ^Core_IVideoTrackSupportInfo;

  // Windows.Media.Core.IAudioTrackSupportInfo
  Core_IAudioTrackSupportInfo = interface;
  PCore_IAudioTrackSupportInfo = ^Core_IAudioTrackSupportInfo;

  // Windows.Media.Core.IVideoTrackOpenFailedEventArgs
  Core_IVideoTrackOpenFailedEventArgs = interface;
  PCore_IVideoTrackOpenFailedEventArgs = ^Core_IVideoTrackOpenFailedEventArgs;

  // Windows.Media.Core.IAudioTrackOpenFailedEventArgs
  Core_IAudioTrackOpenFailedEventArgs = interface;
  PCore_IAudioTrackOpenFailedEventArgs = ^Core_IAudioTrackOpenFailedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaTrack,Windows.Media.Core.IVideoTrackOpenFailedEventArgs>
  TypedEventHandler_2__Core_IMediaTrack__Core_IVideoTrackOpenFailedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaTrack__Core_IVideoTrackOpenFailedEventArgs = ^TypedEventHandler_2__Core_IMediaTrack__Core_IVideoTrackOpenFailedEventArgs;

  // Windows.Media.Core.IVideoTrack
  Core_IVideoTrack = interface;
  PCore_IVideoTrack = ^Core_IVideoTrack;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaTrack,Windows.Media.Core.IAudioTrackOpenFailedEventArgs>
  TypedEventHandler_2__Core_IMediaTrack__Core_IAudioTrackOpenFailedEventArgs = interface;
  PTypedEventHandler_2__Core_IMediaTrack__Core_IAudioTrackOpenFailedEventArgs = ^TypedEventHandler_2__Core_IMediaTrack__Core_IAudioTrackOpenFailedEventArgs;

  // Windows.Media.Core.IAudioTrack
  Core_IAudioTrack = interface;
  PCore_IAudioTrack = ^Core_IAudioTrack;

  // Windows.Media.Core.ITimedMetadataTrack2
  Core_ITimedMetadataTrack2 = interface;
  PCore_ITimedMetadataTrack2 = ^Core_ITimedMetadataTrack2;

  // Windows.Media.Playback.IMediaPlaybackItemFactory
  Playback_IMediaPlaybackItemFactory = interface;
  PPlayback_IMediaPlaybackItemFactory = ^Playback_IMediaPlaybackItemFactory;

  // Windows.Media.Playback.IMediaPlaybackItemFactory2
  Playback_IMediaPlaybackItemFactory2 = interface;
  PPlayback_IMediaPlaybackItemFactory2 = ^Playback_IMediaPlaybackItemFactory2;

  // Windows.Media.Playback.IMediaPlaybackItemStatics
  Playback_IMediaPlaybackItemStatics = interface;
  PPlayback_IMediaPlaybackItemStatics = ^Playback_IMediaPlaybackItemStatics;

  // Windows.Media.Playback.IMediaItemDisplayProperties
  Playback_IMediaItemDisplayProperties = interface;
  PPlayback_IMediaItemDisplayProperties = ^Playback_IMediaItemDisplayProperties;

  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakSchedule,Object>
  TypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable = interface;
  PTypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable = ^TypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable;

  // Windows.Media.Playback.IMediaBreakSchedule
  Playback_IMediaBreakSchedule = interface;
  PPlayback_IMediaBreakSchedule = ^Playback_IMediaBreakSchedule;

  // Windows.Media.Playback.IMediaPlaybackItem2
  Playback_IMediaPlaybackItem2 = interface;
  PPlayback_IMediaPlaybackItem2 = ^Playback_IMediaPlaybackItem2;

  // Windows.Media.Playback.IMediaPlaybackItem3
  Playback_IMediaPlaybackItem3 = interface;
  PPlayback_IMediaPlaybackItem3 = ^Playback_IMediaPlaybackItem3;

  // Windows.Media.Playback.IMediaBreakFactory
  Playback_IMediaBreakFactory = interface;
  PPlayback_IMediaBreakFactory = ^Playback_IMediaBreakFactory;

  // Windows.Media.Playback.IMediaEnginePlaybackSource
  Playback_IMediaEnginePlaybackSource = interface;
  PPlayback_IMediaEnginePlaybackSource = ^Playback_IMediaEnginePlaybackSource;

  // Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs2
  Playback_ICurrentMediaPlaybackItemChangedEventArgs2 = interface;
  PPlayback_ICurrentMediaPlaybackItemChangedEventArgs2 = ^Playback_ICurrentMediaPlaybackItemChangedEventArgs2;

  // Windows.Media.Playback.IMediaPlaybackList2
  Playback_IMediaPlaybackList2 = interface;
  PPlayback_IMediaPlaybackList2 = ^Playback_IMediaPlaybackList2;

  // Windows.Media.Playback.IMediaPlaybackList3
  Playback_IMediaPlaybackList3 = interface;
  PPlayback_IMediaPlaybackList3 = ^Playback_IMediaPlaybackList3;

  // Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs
  Playback_ITimedMetadataPresentationModeChangedEventArgs = interface;
  PPlayback_ITimedMetadataPresentationModeChangedEventArgs = ^Playback_ITimedMetadataPresentationModeChangedEventArgs;

  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>,Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs>
  TypedEventHandler_2__IVectorView_1__Core_ITimedMetadataTrack__Playback_ITimedMetadataPresentationModeChangedEventArgs = interface;
  PTypedEventHandler_2__IVectorView_1__Core_ITimedMetadataTrack__Playback_ITimedMetadataPresentationModeChangedEventArgs = ^TypedEventHandler_2__IVectorView_1__Core_ITimedMetadataTrack__Playback_ITimedMetadataPresentationModeChangedEventArgs;

  // Windows.Media.Playback.IMediaPlaybackTimedMetadataTrackList
  Playback_IMediaPlaybackTimedMetadataTrackList = interface;
  PPlayback_IMediaPlaybackTimedMetadataTrackList = ^Playback_IMediaPlaybackTimedMetadataTrackList;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel = interface;
  PAsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel = ^AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  IAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel = interface;
  PIAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel = ^IAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<UInt32>
  AsyncOperationCompletedHandler_1__Cardinal = interface;
  PAsyncOperationCompletedHandler_1__Cardinal = ^AsyncOperationCompletedHandler_1__Cardinal;

  // Windows.Foundation.IAsyncOperation`1<UInt32>
  IAsyncOperation_1__Cardinal = interface;
  PIAsyncOperation_1__Cardinal = ^IAsyncOperation_1__Cardinal;

  // Windows.Media.Playlists.IPlaylist
  Playlists_IPlaylist = interface;
  PPlaylists_IPlaylist = ^Playlists_IPlaylist;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Playlists.IPlaylist>
  AsyncOperationCompletedHandler_1__Playlists_IPlaylist = interface;
  PAsyncOperationCompletedHandler_1__Playlists_IPlaylist = ^AsyncOperationCompletedHandler_1__Playlists_IPlaylist;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Playlists.IPlaylist>
  IAsyncOperation_1__Playlists_IPlaylist = interface;
  PIAsyncOperation_1__Playlists_IPlaylist = ^IAsyncOperation_1__Playlists_IPlaylist;

  // Windows.Media.Playlists.IPlaylistStatics
  Playlists_IPlaylistStatics = interface;
  PPlaylists_IPlaylistStatics = ^Playlists_IPlaylistStatics;

  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal = interface;
  PAsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal = ^AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal;

  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal = interface;
  PAsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal = ^AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal;

  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Protection.RenewalStatus,UInt32>
  IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal = interface;
  PIAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal = ^IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Media Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.IMediaFrame
  IMediaFrame = interface(IInspectable)
  ['{BFB52F8C-5943-47D8-8E10-05308AA5FBD0}']
    function get_Type: HSTRING; safecall;
    function get_IsReadOnly: Boolean; safecall;
    procedure put_RelativeTime(value: IReference_1__TimeSpan); safecall;
    function get_RelativeTime: IReference_1__TimeSpan; safecall;
    procedure put_SystemRelativeTime(value: IReference_1__TimeSpan); safecall;
    function get_SystemRelativeTime: IReference_1__TimeSpan; safecall;
    procedure put_Duration(value: IReference_1__TimeSpan); safecall;
    function get_Duration: IReference_1__TimeSpan; safecall;
    procedure put_IsDiscontinuous(value: Boolean); safecall;
    function get_IsDiscontinuous: Boolean; safecall;
    function get_ExtendedProperties: IPropertySet; safecall;
    property Duration: IReference_1__TimeSpan read get_Duration write put_Duration;
    property ExtendedProperties: IPropertySet read get_ExtendedProperties;
    property IsDiscontinuous: Boolean read get_IsDiscontinuous write put_IsDiscontinuous;
    property IsReadOnly: Boolean read get_IsReadOnly;
    property RelativeTime: IReference_1__TimeSpan read get_RelativeTime write put_RelativeTime;
    property SystemRelativeTime: IReference_1__TimeSpan read get_SystemRelativeTime write put_SystemRelativeTime;
    property &Type: HSTRING read get_Type;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.IVideoFrame
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  }
  // Windows.Media.IVideoFrame
  [WinRTClassNameAttribute(SVideoFrame)]
  IVideoFrame = interface(IInspectable)
  ['{0CC06625-90FC-4C92-BD95-7DED21819D1C}']
    function get_SoftwareBitmap: Imaging_ISoftwareBitmap; safecall;
    function CopyToAsync(frame: IVideoFrame): IAsyncAction; safecall;
    function get_Direct3DSurface: DirectX_Direct3D11_IDirect3DSurface; safecall;
    property Direct3DSurface: DirectX_Direct3D11_IDirect3DSurface read get_Direct3DSurface;
    property SoftwareBitmap: Imaging_ISoftwareBitmap read get_SoftwareBitmap;
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
  // Used Types:  UInt32
  }
  // Windows.Foundation.IReference`1<UInt32>
  IReference_1__Cardinal = interface(IInspectable)
  ['{513EF3AF-E784-5325-A91E-97C2B8111CF3}']
    function get_Value: Cardinal; safecall;
    property Value: Cardinal read get_Value;
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
  // Used Types:  Windows.Media.IVideoFrame
  // Used Types:  Windows.Graphics.Imaging.BitmapPixelFormat
  // Used Types:  Int32
  // Used Types:  Windows.Graphics.Imaging.BitmapAlphaMode
  }
  // Windows.Media.IVideoFrameFactory
  [WinRTClassNameAttribute(SVideoFrame)]
  IVideoFrameFactory = interface(IInspectable)
  ['{014B6D69-2228-4C92-92FF-50C380D3E776}']
    function Create(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): IVideoFrame; safecall;
    function CreateWithAlpha(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): IVideoFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Media.IAudioBuffer
  [WinRTClassNameAttribute(SAudioBuffer)]
  IAudioBuffer = interface(IInspectable)
  ['{35175827-724B-4C6A-B130-F6537F9AE0D0}']
    function get_Capacity: Cardinal; safecall;
    function get_Length: Cardinal; safecall;
    procedure put_Length(value: Cardinal); safecall;
    property Capacity: Cardinal read get_Capacity;
    property Length: Cardinal read get_Length write put_Length;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IAudioBuffer
  // Used Types:  Windows.Media.AudioBufferAccessMode
  }
  // Windows.Media.IAudioFrame
  [WinRTClassNameAttribute(SAudioFrame)]
  IAudioFrame = interface(IInspectable)
  ['{E36AC304-AAB2-4277-9ED0-43CEDF8E29C6}']
    function LockBuffer(mode: AudioBufferAccessMode): IAudioBuffer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IAudioFrame
  // Used Types:  UInt32
  }
  // Windows.Media.IAudioFrameFactory
  [WinRTClassNameAttribute(SAudioFrame)]
  IAudioFrameFactory = interface(IInspectable)
  ['{91A90ADE-2422-40A6-B9AD-30D02404317D}']
    function Create(capacity: Cardinal): IAudioFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Effects.IAudioEffectDefinition
  Effects_IAudioEffectDefinition = interface(IInspectable)
  ['{E4D7F974-7D80-4F73-9089-E31C9DB9C294}']
    function get_ActivatableClassId: HSTRING; safecall;
    function get_Properties: IPropertySet; safecall;
    property ActivatableClassId: HSTRING read get_ActivatableClassId;
    property Properties: IPropertySet read get_Properties;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IAudioEffectDefinition>
  IIterator_1__Effects_IAudioEffectDefinition_Base = interface(IInspectable)
  ['{EC0F39FC-6959-5423-9E1A-F7CB8E845CA1}']
  end;
  {
  // Used Types:  Windows.Media.Effects.IAudioEffectDefinition
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IAudioEffectDefinition>
  IIterator_1__Effects_IAudioEffectDefinition = interface(IIterator_1__Effects_IAudioEffectDefinition_Base)
  ['{EC0F39FC-6959-5423-9E1A-F7CB8E845CA1}']
    function get_Current: Effects_IAudioEffectDefinition; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEffects_IAudioEffectDefinition): Cardinal; safecall;
    property Current: Effects_IAudioEffectDefinition read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Effects.IAudioEffectDefinition>
  IIterable_1__Effects_IAudioEffectDefinition_Base = interface(IInspectable)
  ['{607A20BF-32B4-5B8E-A793-3024F8D3582A}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IAudioEffectDefinition>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Effects.IAudioEffectDefinition>
  IIterable_1__Effects_IAudioEffectDefinition = interface(IIterable_1__Effects_IAudioEffectDefinition_Base)
  ['{607A20BF-32B4-5B8E-A793-3024F8D3582A}']
    function First: IIterator_1__Effects_IAudioEffectDefinition; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Effects.IAudioEffectDefinition
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Effects.IAudioEffectDefinition>
  IVectorView_1__Effects_IAudioEffectDefinition = interface(IInspectable)
  ['{DE9E6A7F-D28E-5EF1-916A-EFA880B489D1}']
    function GetAt(index: Cardinal): Effects_IAudioEffectDefinition; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Effects_IAudioEffectDefinition; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEffects_IAudioEffectDefinition): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Effects.IAudioEffectDefinition
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Effects.IAudioEffectDefinition>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IAudioEffectDefinition>
  IVector_1__Effects_IAudioEffectDefinition = interface(IInspectable)
  ['{2828A982-D849-5FC9-84CE-F9A4B3B4D341}']
    function GetAt(index: Cardinal): Effects_IAudioEffectDefinition; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Effects_IAudioEffectDefinition; safecall;
    function IndexOf(value: Effects_IAudioEffectDefinition; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Effects_IAudioEffectDefinition); safecall;
    procedure InsertAt(index: Cardinal; value: Effects_IAudioEffectDefinition); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Effects_IAudioEffectDefinition); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEffects_IAudioEffectDefinition): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PEffects_IAudioEffectDefinition); safecall;
    property Size: Cardinal read get_Size;
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

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterator_1__IKeyValuePair_2__TGuid__IInspectable = interface(IInspectable)
  ['{4F25059A-0B9A-5F25-9B9E-4B9F1D22FF65}']
    function get_Current: IKeyValuePair_2__TGuid__IInspectable; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__TGuid__IInspectable): Cardinal; safecall;
    property Current: IKeyValuePair_2__TGuid__IInspectable read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  IIterable_1__IKeyValuePair_2__TGuid__IInspectable = interface(IInspectable)
  ['{F3B20528-E3B3-5331-B2D0-0C2623AEE785}']
    function First: IIterator_1__IKeyValuePair_2__TGuid__IInspectable; safecall;
  end;

  {
  // Used Types:  Object
  // Used Types:  Guid
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  }
  // Windows.Foundation.Collections.IMapView`2<Guid,Object>
  IMapView_2__TGuid__IInspectable = interface(IInspectable)
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IAudioEffectDefinition>
  // Used Types:  Double
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Effects.IAudioEffectDefinition
  }
  // Windows.Media.Audio.IAudioNode
  Audio_IAudioNode = interface(IInspectable)
  ['{15389D7F-DBD8-4819-BF03-668E9357CD6D}']
    function get_EffectDefinitions: IVector_1__Effects_IAudioEffectDefinition; safecall;
    procedure put_OutgoingGain(value: Double); safecall;
    function get_OutgoingGain: Double; safecall;
    function get_EncodingProperties: IAudioEncodingProperties; safecall;
    function get_ConsumeInput: Boolean; safecall;
    procedure put_ConsumeInput(value: Boolean); safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure Reset; safecall;
    procedure DisableEffectsByDefinition(definition: Effects_IAudioEffectDefinition); safecall;
    procedure EnableEffectsByDefinition(definition: Effects_IAudioEffectDefinition); safecall;
    property ConsumeInput: Boolean read get_ConsumeInput write put_ConsumeInput;
    property EffectDefinitions: IVector_1__Effects_IAudioEffectDefinition read get_EffectDefinitions;
    property EncodingProperties: IAudioEncodingProperties read get_EncodingProperties;
    property OutgoingGain: Double read get_OutgoingGain write put_OutgoingGain;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioNode
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioGraphConnection
  [WinRTClassNameAttribute(SAudio_AudioGraphConnection)]
  Audio_IAudioGraphConnection = interface(IInspectable)
  ['{763070ED-D04E-4FAC-B233-600B42EDD469}']
    function get_Destination: Audio_IAudioNode; safecall;
    procedure put_Gain(value: Double); safecall;
    function get_Gain: Double; safecall;
    property Destination: Audio_IAudioNode read get_Destination;
    property Gain: Double read get_Gain write put_Gain;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IAudioGraphConnection>
  IIterator_1__Audio_IAudioGraphConnection_Base = interface(IInspectable)
  ['{4AF6A8FC-E7FB-5957-91C1-2DF9600B22EB}']
  end;
  {
  // Used Types:  Windows.Media.Audio.IAudioGraphConnection
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IAudioGraphConnection>
  IIterator_1__Audio_IAudioGraphConnection = interface(IIterator_1__Audio_IAudioGraphConnection_Base)
  ['{7C7BD0C4-7FBA-5AF3-82DC-DC37A172EE13}']
    function get_Current: Audio_IAudioGraphConnection; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAudio_IAudioGraphConnection): Cardinal; safecall;
    property Current: Audio_IAudioGraphConnection read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Audio.IAudioGraphConnection>
  IIterable_1__Audio_IAudioGraphConnection_Base = interface(IInspectable)
  ['{96168D06-A51A-5480-9403-FBD7631E3B3C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IAudioGraphConnection>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Audio.IAudioGraphConnection>
  IIterable_1__Audio_IAudioGraphConnection = interface(IIterable_1__Audio_IAudioGraphConnection_Base)
  ['{52713CD2-9D0F-5FAE-A8A4-D3DBD69DBFC4}']
    function First: IIterator_1__Audio_IAudioGraphConnection; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioGraphConnection
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Audio.IAudioGraphConnection>
  IVectorView_1__Audio_IAudioGraphConnection = interface(IInspectable)
  ['{56CA9249-0753-5D4C-B9AC-581BFD70E8C0}']
    function GetAt(index: Cardinal): Audio_IAudioGraphConnection; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Audio_IAudioGraphConnection; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAudio_IAudioGraphConnection): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Audio.IAudioGraphConnection>
  // Used Types:  Windows.Media.Audio.IAudioNode
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioInputNode
  [WinRTClassNameAttribute(SAudio_AudioSubmixNode)]
  Audio_IAudioInputNode = interface(IInspectable)
  ['{D148005C-8428-4784-B7FD-A99D468C5D20}']
    function get_OutgoingConnections: IVectorView_1__Audio_IAudioGraphConnection; safecall;
    procedure AddOutgoingConnection(destination: Audio_IAudioNode); overload; safecall;
    procedure AddOutgoingConnection(destination: Audio_IAudioNode; gain: Double); overload; safecall;
    procedure RemoveOutgoingConnection(destination: Audio_IAudioNode); safecall;
    property OutgoingConnections: IVectorView_1__Audio_IAudioGraphConnection read get_OutgoingConnections;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IAudioFrame
  }
  // Windows.Media.Audio.IAudioFrameCompletedEventArgs
  [WinRTClassNameAttribute(SAudio_AudioFrameCompletedEventArgs)]
  Audio_IAudioFrameCompletedEventArgs = interface(IInspectable)
  ['{DC7C829E-0208-4504-A5A8-F0F268920A65}']
    function get_Frame: IAudioFrame; safecall;
    property Frame: IAudioFrame read get_Frame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IAudioFrameCompletedEventArgs>
  TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{AD59DCFE-71B0-5E16-99C2-CD90644D8EE8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioFrameInputNode
  // Used Types:  Windows.Media.Audio.IAudioFrameCompletedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IAudioFrameCompletedEventArgs>
  TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs = interface(TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs_Delegate_Base)
  ['{87136DC3-7179-5D76-AB37-AE1936C73E61}']
    procedure Invoke(sender: Audio_IAudioFrameInputNode; args: Audio_IAudioFrameCompletedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  }
  // Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs
  [WinRTClassNameAttribute(SAudio_FrameInputNodeQuantumStartedEventArgs)]
  Audio_IFrameInputNodeQuantumStartedEventArgs = interface(IInspectable)
  ['{3D9BD498-A306-4F06-BD9F-E9EFC8226304}']
    function get_RequiredSamples: Integer; safecall;
    property RequiredSamples: Integer read get_RequiredSamples;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs>
  TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs_Delegate_Base = interface(IUnknown)
  ['{4530D121-BB9A-57FE-922F-A98EEEDF59AF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioFrameInputNode
  // Used Types:  Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs>
  TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs = interface(TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs_Delegate_Base)
  ['{E82D8A90-3812-5930-A62C-BAD415076BE6}']
    procedure Invoke(sender: Audio_IAudioFrameInputNode; args: Audio_IFrameInputNodeQuantumStartedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  // Used Types:  Windows.Media.IAudioFrame
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IAudioFrameCompletedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFrameInputNode,Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs>
  }
  // Windows.Media.Audio.IAudioFrameInputNode
  [WinRTClassNameAttribute(SAudio_AudioFrameInputNode)]
  Audio_IAudioFrameInputNode = interface(IInspectable)
  ['{01B266C7-FD96-4FF5-A3C5-D27A9BF44237}']
    procedure put_PlaybackSpeedFactor(value: Double); safecall;
    function get_PlaybackSpeedFactor: Double; safecall;
    procedure AddFrame(frame: IAudioFrame); safecall;
    procedure DiscardQueuedFrames; safecall;
    function get_QueuedSampleCount: UInt64; safecall;
    function add_AudioFrameCompleted(handler: TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IAudioFrameCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_AudioFrameCompleted(token: EventRegistrationToken); safecall;
    function add_QuantumStarted(handler: TypedEventHandler_2__Audio_IAudioFrameInputNode__Audio_IFrameInputNodeQuantumStartedEventArgs): EventRegistrationToken; safecall;
    procedure remove_QuantumStarted(token: EventRegistrationToken); safecall;
    property PlaybackSpeedFactor: Double read get_PlaybackSpeedFactor write put_PlaybackSpeedFactor;
    property QueuedSampleCount: UInt64 read get_QueuedSampleCount;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Media.Audio.IAudioDeviceInputNode
  [WinRTClassNameAttribute(SAudio_AudioDeviceInputNode)]
  Audio_IAudioDeviceInputNode = interface(IInspectable)
  ['{B01B6BE1-6F4E-49E2-AC01-559D62BEB3A9}']
    function get_Device: IDeviceInformation; safecall;
    property Device: IDeviceInformation read get_Device;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioDeviceNodeCreationStatus
  // Used Types:  Windows.Media.Audio.IAudioDeviceInputNode
  }
  // Windows.Media.Audio.ICreateAudioDeviceInputNodeResult
  [WinRTClassNameAttribute(SAudio_CreateAudioDeviceInputNodeResult)]
  Audio_ICreateAudioDeviceInputNodeResult = interface(IInspectable)
  ['{16EEC7A8-1CA7-40EF-91A4-D346E0AA1BBA}']
    function get_Status: Audio_AudioDeviceNodeCreationStatus; safecall;
    function get_DeviceInputNode: Audio_IAudioDeviceInputNode; safecall;
    property DeviceInputNode: Audio_IAudioDeviceInputNode read get_DeviceInputNode;
    property Status: Audio_AudioDeviceNodeCreationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult_Delegate_Base = interface(IUnknown)
  ['{6CC56450-E4E8-59C9-83D8-63E46EACB20B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult = interface(AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult_Delegate_Base)
  ['{D3FBAF3D-B1BE-5447-A6B8-A24B9266B30E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult_Base = interface(IInspectable)
  ['{71AB4481-EC4A-5EE9-A342-3A31747829B8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  // Used Types:  Windows.Media.Audio.ICreateAudioDeviceInputNodeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult = interface(IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult_Base)
  ['{BE15A1DC-4FBB-5A22-8452-881A590E3ACA}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult; safecall;
    function GetResults: Audio_ICreateAudioDeviceInputNodeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceInputNodeResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IAudioFrame
  }
  // Windows.Media.Audio.IAudioFrameOutputNode
  [WinRTClassNameAttribute(SAudio_AudioFrameOutputNode)]
  Audio_IAudioFrameOutputNode = interface(IInspectable)
  ['{B847371B-3299-45F5-88B3-C9D12A3F1CC8}']
    function GetFrame: IAudioFrame; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Media.Audio.IAudioDeviceOutputNode
  [WinRTClassNameAttribute(SAudio_AudioDeviceOutputNode)]
  Audio_IAudioDeviceOutputNode = interface(IInspectable)
  ['{362EDBFF-FF1C-4434-9E0F-BD2EF522AC82}']
    function get_Device: IDeviceInformation; safecall;
    property Device: IDeviceInformation read get_Device;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioDeviceNodeCreationStatus
  // Used Types:  Windows.Media.Audio.IAudioDeviceOutputNode
  }
  // Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult
  [WinRTClassNameAttribute(SAudio_CreateAudioDeviceOutputNodeResult)]
  Audio_ICreateAudioDeviceOutputNodeResult = interface(IInspectable)
  ['{F7776D27-1D9A-47F7-9CD4-2859CC1B7BFF}']
    function get_Status: Audio_AudioDeviceNodeCreationStatus; safecall;
    function get_DeviceOutputNode: Audio_IAudioDeviceOutputNode; safecall;
    property DeviceOutputNode: Audio_IAudioDeviceOutputNode read get_DeviceOutputNode;
    property Status: Audio_AudioDeviceNodeCreationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult_Delegate_Base = interface(IUnknown)
  ['{EDBC9B59-7CAE-513F-B0DC-17666D37BA77}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult = interface(AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult_Delegate_Base)
  ['{8350138E-5DD6-5DC0-AEF7-2AB7C058CF3E}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult_Base = interface(IInspectable)
  ['{F810D730-DE15-58E0-A5F4-C159F73669ED}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  // Used Types:  Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult = interface(IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult_Base)
  ['{4CB6F751-D460-5037-AA59-E0B2314F948F}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult; safecall;
    function GetResults: Audio_ICreateAudioDeviceOutputNodeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioDeviceOutputNodeResult read get_Completed write put_Completed;
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

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFileInputNode,Object>
  TypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable_Delegate_Base = interface(IUnknown)
  ['{4481085B-8B8B-5520-9825-E9671DA2A89F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioFileInputNode
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFileInputNode,Object>
  TypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable = interface(TypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable_Delegate_Base)
  ['{C3299F12-9086-5F50-86EB-06FEDA10DF6E}']
    procedure Invoke(sender: Audio_IAudioFileInputNode; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioFileInputNode,Object>
  }
  // Windows.Media.Audio.IAudioFileInputNode
  [WinRTClassNameAttribute(SAudio_AudioFileInputNode)]
  Audio_IAudioFileInputNode = interface(IInspectable)
  ['{905B67C8-6F65-4CD4-8890-4694843C276D}']
    procedure put_PlaybackSpeedFactor(value: Double); safecall;
    function get_PlaybackSpeedFactor: Double; safecall;
    function get_Position: TimeSpan; safecall;
    procedure Seek(position: TimeSpan); safecall;
    function get_StartTime: IReference_1__TimeSpan; safecall;
    procedure put_StartTime(value: IReference_1__TimeSpan); safecall;
    function get_EndTime: IReference_1__TimeSpan; safecall;
    procedure put_EndTime(value: IReference_1__TimeSpan); safecall;
    function get_LoopCount: IReference_1__Integer; safecall;
    procedure put_LoopCount(value: IReference_1__Integer); safecall;
    function get_Duration: TimeSpan; safecall;
    function get_SourceFile: IStorageFile; safecall;
    function add_FileCompleted(handler: TypedEventHandler_2__Audio_IAudioFileInputNode__IInspectable): EventRegistrationToken; safecall;
    procedure remove_FileCompleted(token: EventRegistrationToken); safecall;
    property Duration: TimeSpan read get_Duration;
    property EndTime: IReference_1__TimeSpan read get_EndTime write put_EndTime;
    property LoopCount: IReference_1__Integer read get_LoopCount write put_LoopCount;
    property PlaybackSpeedFactor: Double read get_PlaybackSpeedFactor write put_PlaybackSpeedFactor;
    property Position: TimeSpan read get_Position;
    property SourceFile: IStorageFile read get_SourceFile;
    property StartTime: IReference_1__TimeSpan read get_StartTime write put_StartTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioFileNodeCreationStatus
  // Used Types:  Windows.Media.Audio.IAudioFileInputNode
  }
  // Windows.Media.Audio.ICreateAudioFileInputNodeResult
  [WinRTClassNameAttribute(SAudio_CreateAudioFileInputNodeResult)]
  Audio_ICreateAudioFileInputNodeResult = interface(IInspectable)
  ['{CE83D61C-E297-4C50-9CE7-1C7A69D6BD09}']
    function get_Status: Audio_AudioFileNodeCreationStatus; safecall;
    function get_FileInputNode: Audio_IAudioFileInputNode; safecall;
    property FileInputNode: Audio_IAudioFileInputNode read get_FileInputNode;
    property Status: Audio_AudioFileNodeCreationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult_Delegate_Base = interface(IUnknown)
  ['{504D1EFD-C11C-506E-B8C9-AF17C771EFB5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult = interface(AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult_Delegate_Base)
  ['{74969811-B1BE-55AF-BE81-9F9280C90FB8}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult_Base = interface(IInspectable)
  ['{473B06BF-387B-56CA-BEE1-527480272B0F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  // Used Types:  Windows.Media.Audio.ICreateAudioFileInputNodeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult = interface(IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult_Base)
  ['{09523B34-2247-58D1-ADDE-D388D76B966B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult; safecall;
    function GetResults: Audio_ICreateAudioFileInputNodeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileInputNodeResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.TranscodeFailureReason>
  AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason_Delegate_Base = interface(IUnknown)
  ['{C42AE2BF-E194-5179-B8AD-03B51C04E1DA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.TranscodeFailureReason>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.TranscodeFailureReason>
  AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason = interface(AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Transcoding_TranscodeFailureReason; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.TranscodeFailureReason>
  IAsyncOperation_1__Transcoding_TranscodeFailureReason_Base = interface(IInspectable)
  ['{02132510-3899-5257-BED9-A43E5149D28C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.TranscodeFailureReason>
  // Used Types:  Windows.Media.Transcoding.TranscodeFailureReason
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.TranscodeFailureReason>
  IAsyncOperation_1__Transcoding_TranscodeFailureReason = interface(IAsyncOperation_1__Transcoding_TranscodeFailureReason_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason; safecall;
    function GetResults: Transcoding_TranscodeFailureReason; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Transcoding_TranscodeFailureReason read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.TranscodeFailureReason>
  }
  // Windows.Media.Audio.IAudioFileOutputNode
  [WinRTClassNameAttribute(SAudio_AudioFileOutputNode)]
  Audio_IAudioFileOutputNode = interface(IInspectable)
  ['{50E01980-5166-4093-80F8-ADA00089E9CF}']
    function get_File: IStorageFile; safecall;
    function get_FileEncodingProfile: IMediaEncodingProfile; safecall;
    function FinalizeAsync: IAsyncOperation_1__Transcoding_TranscodeFailureReason; safecall;
    property &File: IStorageFile read get_File;
    property FileEncodingProfile: IMediaEncodingProfile read get_FileEncodingProfile;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioFileNodeCreationStatus
  // Used Types:  Windows.Media.Audio.IAudioFileOutputNode
  }
  // Windows.Media.Audio.ICreateAudioFileOutputNodeResult
  [WinRTClassNameAttribute(SAudio_CreateAudioFileOutputNodeResult)]
  Audio_ICreateAudioFileOutputNodeResult = interface(IInspectable)
  ['{47D6BA7B-E909-453F-866E-5540CDA734FF}']
    function get_Status: Audio_AudioFileNodeCreationStatus; safecall;
    function get_FileOutputNode: Audio_IAudioFileOutputNode; safecall;
    property FileOutputNode: Audio_IAudioFileOutputNode read get_FileOutputNode;
    property Status: Audio_AudioFileNodeCreationStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult_Delegate_Base = interface(IUnknown)
  ['{A7A95713-A08F-5FDF-89C6-9627BCF5D80A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult = interface(AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult_Delegate_Base)
  ['{7A7D880E-AFF4-5211-951C-D11439458145}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult_Base = interface(IInspectable)
  ['{1164517D-E953-5415-A5B3-4249A969BE7B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  // Used Types:  Windows.Media.Audio.ICreateAudioFileOutputNodeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult = interface(IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult_Base)
  ['{4D516665-1D50-592C-9E86-75AF69A44B55}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult; safecall;
    function GetResults: Audio_ICreateAudioFileOutputNodeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioFileOutputNodeResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Object>
  TypedEventHandler_2__Audio_IAudioGraph__IInspectable_Delegate_Base = interface(IUnknown)
  ['{E1407134-09E7-53DE-B54C-8A0659397B88}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioGraph
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Object>
  TypedEventHandler_2__Audio_IAudioGraph__IInspectable = interface(TypedEventHandler_2__Audio_IAudioGraph__IInspectable_Delegate_Base)
  ['{AD7722FD-63CE-595F-9867-3695871F2152}']
    procedure Invoke(sender: Audio_IAudioGraph; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioGraphUnrecoverableError
  }
  // Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs
  [WinRTClassNameAttribute(SAudio_AudioGraphUnrecoverableErrorOccurredEventArgs)]
  Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs = interface(IInspectable)
  ['{C3D9CBE0-3FF6-4FB3-B262-50D435C55423}']
    function get_Error: Audio_AudioGraphUnrecoverableError; safecall;
    property Error: Audio_AudioGraphUnrecoverableError read get_Error;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs>
  TypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs_Delegate_Base = interface(IUnknown)
  ['{899670C9-DD7F-5F12-98CB-8B17FE80A47F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioGraph
  // Used Types:  Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs>
  TypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs = interface(TypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs_Delegate_Base)
  ['{097D4FD7-937E-5B2E-BB98-38E78447F22B}']
    procedure Invoke(sender: Audio_IAudioGraph; args: Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioFrameInputNode
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  // Used Types:  Windows.Media.Capture.MediaCategory
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  // Used Types:  Windows.Media.Audio.IAudioFrameOutputNode
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileOutputNodeResult>
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.Audio.IAudioInputNode
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Audio.IAudioGraph,Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs>
  // Used Types:  UInt64
  // Used Types:  Int32
  // Used Types:  Windows.Media.AudioProcessing
  }
  // Windows.Media.Audio.IAudioGraph
  [WinRTClassNameAttribute(SAudio_AudioGraph)]
  Audio_IAudioGraph = interface(IInspectable)
  ['{1AD46EED-E48C-4E14-9660-2C4F83E9CDD8}']
    function CreateFrameInputNode: Audio_IAudioFrameInputNode; overload; safecall;
    function CreateFrameInputNode(encodingProperties: IAudioEncodingProperties): Audio_IAudioFrameInputNode; overload; safecall;
    function CreateDeviceInputNodeAsync(category: Capture_MediaCategory): IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult; overload; safecall;
    function CreateDeviceInputNodeAsync(category: Capture_MediaCategory; encodingProperties: IAudioEncodingProperties): IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult; overload; safecall;
    function CreateDeviceInputNodeAsync(category: Capture_MediaCategory; encodingProperties: IAudioEncodingProperties; device: IDeviceInformation): IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult; overload; safecall;
    function CreateFrameOutputNode: Audio_IAudioFrameOutputNode; overload; safecall;
    function CreateFrameOutputNode(encodingProperties: IAudioEncodingProperties): Audio_IAudioFrameOutputNode; overload; safecall;
    function CreateDeviceOutputNodeAsync: IAsyncOperation_1__Audio_ICreateAudioDeviceOutputNodeResult; safecall;
    function CreateFileInputNodeAsync(&file: IStorageFile): IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult; safecall;
    function CreateFileOutputNodeAsync(&file: IStorageFile): IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult; overload; safecall;
    function CreateFileOutputNodeAsync(&file: IStorageFile; fileEncodingProfile: IMediaEncodingProfile): IAsyncOperation_1__Audio_ICreateAudioFileOutputNodeResult; overload; safecall;
    function CreateSubmixNode: Audio_IAudioInputNode; overload; safecall;
    function CreateSubmixNode(encodingProperties: IAudioEncodingProperties): Audio_IAudioInputNode; overload; safecall;
    procedure Start; safecall;
    procedure Stop; safecall;
    procedure ResetAllNodes; safecall;
    function add_QuantumStarted(handler: TypedEventHandler_2__Audio_IAudioGraph__IInspectable): EventRegistrationToken; safecall;
    procedure remove_QuantumStarted(token: EventRegistrationToken); safecall;
    function add_QuantumProcessed(handler: TypedEventHandler_2__Audio_IAudioGraph__IInspectable): EventRegistrationToken; safecall;
    procedure remove_QuantumProcessed(token: EventRegistrationToken); safecall;
    function add_UnrecoverableErrorOccurred(handler: TypedEventHandler_2__Audio_IAudioGraph__Audio_IAudioGraphUnrecoverableErrorOccurredEventArgs): EventRegistrationToken; safecall;
    procedure remove_UnrecoverableErrorOccurred(token: EventRegistrationToken); safecall;
    function get_CompletedQuantumCount: UInt64; safecall;
    function get_EncodingProperties: IAudioEncodingProperties; safecall;
    function get_LatencyInSamples: Integer; safecall;
    function get_PrimaryRenderDevice: IDeviceInformation; safecall;
    function get_RenderDeviceAudioProcessing: AudioProcessing; safecall;
    function get_SamplesPerQuantum: Integer; safecall;
    property CompletedQuantumCount: UInt64 read get_CompletedQuantumCount;
    property EncodingProperties: IAudioEncodingProperties read get_EncodingProperties;
    property LatencyInSamples: Integer read get_LatencyInSamples;
    property PrimaryRenderDevice: IDeviceInformation read get_PrimaryRenderDevice;
    property RenderDeviceAudioProcessing: AudioProcessing read get_RenderDeviceAudioProcessing;
    property SamplesPerQuantum: Integer read get_SamplesPerQuantum;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioGraphCreationStatus
  // Used Types:  Windows.Media.Audio.IAudioGraph
  }
  // Windows.Media.Audio.ICreateAudioGraphResult
  [WinRTClassNameAttribute(SAudio_CreateAudioGraphResult)]
  Audio_ICreateAudioGraphResult = interface(IInspectable)
  ['{5453EF7E-7BDE-4B76-BB5D-48F79CFC8C0B}']
    function get_Status: Audio_AudioGraphCreationStatus; safecall;
    function get_Graph: Audio_IAudioGraph; safecall;
    property Graph: Audio_IAudioGraph read get_Graph;
    property Status: Audio_AudioGraphCreationStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  // Used Types:  Windows.Media.Audio.QuantumSizeSelectionMode
  // Used Types:  Int32
  // Used Types:  Windows.Media.Render.AudioRenderCategory
  // Used Types:  Windows.Media.AudioProcessing
  }
  // Windows.Media.Audio.IAudioGraphSettings
  [WinRTClassNameAttribute(SAudio_AudioGraphSettings)]
  Audio_IAudioGraphSettings = interface(IInspectable)
  ['{1D59647F-E6FE-4628-84F8-9D8BDBA25785}']
    function get_EncodingProperties: IAudioEncodingProperties; safecall;
    procedure put_EncodingProperties(value: IAudioEncodingProperties); safecall;
    function get_PrimaryRenderDevice: IDeviceInformation; safecall;
    procedure put_PrimaryRenderDevice(value: IDeviceInformation); safecall;
    function get_QuantumSizeSelectionMode: Audio_QuantumSizeSelectionMode; safecall;
    procedure put_QuantumSizeSelectionMode(value: Audio_QuantumSizeSelectionMode); safecall;
    function get_DesiredSamplesPerQuantum: Integer; safecall;
    procedure put_DesiredSamplesPerQuantum(value: Integer); safecall;
    function get_AudioRenderCategory: Render_AudioRenderCategory; safecall;
    procedure put_AudioRenderCategory(value: Render_AudioRenderCategory); safecall;
    function get_DesiredRenderDeviceAudioProcessing: AudioProcessing; safecall;
    procedure put_DesiredRenderDeviceAudioProcessing(value: AudioProcessing); safecall;
    property AudioRenderCategory: Render_AudioRenderCategory read get_AudioRenderCategory write put_AudioRenderCategory;
    property DesiredRenderDeviceAudioProcessing: AudioProcessing read get_DesiredRenderDeviceAudioProcessing write put_DesiredRenderDeviceAudioProcessing;
    property DesiredSamplesPerQuantum: Integer read get_DesiredSamplesPerQuantum write put_DesiredSamplesPerQuantum;
    property EncodingProperties: IAudioEncodingProperties read get_EncodingProperties write put_EncodingProperties;
    property PrimaryRenderDevice: IDeviceInformation read get_PrimaryRenderDevice write put_PrimaryRenderDevice;
    property QuantumSizeSelectionMode: Audio_QuantumSizeSelectionMode read get_QuantumSizeSelectionMode write put_QuantumSizeSelectionMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioGraphSettings
  // Used Types:  Windows.Media.Render.AudioRenderCategory
  }
  // Windows.Media.Audio.IAudioGraphSettingsFactory
  [WinRTClassNameAttribute(SAudio_AudioGraphSettings)]
  Audio_IAudioGraphSettingsFactory = interface(IInspectable)
  ['{A5D91CC6-C2EB-4A61-A214-1D66D75F83DA}']
    function Create(audioRenderCategory: Render_AudioRenderCategory): Audio_IAudioGraphSettings; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioGraphResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult_Delegate_Base = interface(IUnknown)
  ['{4E660BDA-D438-5741-8B66-85FE72574AAB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioGraphResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioGraphResult>
  AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult = interface(AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult_Delegate_Base)
  ['{1A7B6376-3D51-57BB-9489-72C6CCD7157D}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Audio_ICreateAudioGraphResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioGraphResult>
  IAsyncOperation_1__Audio_ICreateAudioGraphResult_Base = interface(IInspectable)
  ['{3E13B431-65CE-5BFB-B0AA-FAC8DF958B95}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Audio.ICreateAudioGraphResult>
  // Used Types:  Windows.Media.Audio.ICreateAudioGraphResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioGraphResult>
  IAsyncOperation_1__Audio_ICreateAudioGraphResult = interface(IAsyncOperation_1__Audio_ICreateAudioGraphResult_Base)
  ['{F46C1B8D-C5CA-581F-AA97-2948BAE4E844}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult; safecall;
    function GetResults: Audio_ICreateAudioGraphResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Audio_ICreateAudioGraphResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioGraphResult>
  // Used Types:  Windows.Media.Audio.IAudioGraphSettings
  }
  // Windows.Media.Audio.IAudioGraphStatics
  [WinRTClassNameAttribute(SAudio_AudioGraph)]
  Audio_IAudioGraphStatics = interface(IInspectable)
  ['{76EC3132-E159-4AB7-A82A-17BEB4B31E94}']
    function CreateAsync(settings: Audio_IAudioGraphSettings): IAsyncOperation_1__Audio_ICreateAudioGraphResult; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioNodeEmitterConeProperties
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitterConeProperties)]
  Audio_IAudioNodeEmitterConeProperties = interface(IInspectable)
  ['{E99B2CEE-02CA-4375-9326-0C6AE4BCDFB5}']
    function get_InnerAngle: Double; safecall;
    function get_OuterAngle: Double; safecall;
    function get_OuterAngleGain: Double; safecall;
    property InnerAngle: Double read get_InnerAngle;
    property OuterAngle: Double read get_OuterAngle;
    property OuterAngleGain: Double read get_OuterAngleGain;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioNodeEmitterShapeKind
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterConeProperties
  }
  // Windows.Media.Audio.IAudioNodeEmitterShape
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitterShape)]
  Audio_IAudioNodeEmitterShape = interface(IInspectable)
  ['{EA0311C5-E73D-44BC-859C-45553BBC4828}']
    function get_Kind: Audio_AudioNodeEmitterShapeKind; safecall;
    function get_ConeProperties: Audio_IAudioNodeEmitterConeProperties; safecall;
    property ConeProperties: Audio_IAudioNodeEmitterConeProperties read get_ConeProperties;
    property Kind: Audio_AudioNodeEmitterShapeKind read get_Kind;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioNodeEmitterNaturalDecayModelProperties
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitterNaturalDecayModelProperties)]
  Audio_IAudioNodeEmitterNaturalDecayModelProperties = interface(IInspectable)
  ['{48934BCF-CF2C-4EFC-9331-75BD22DF1F0C}']
    function get_UnityGainDistance: Double; safecall;
    function get_CutoffDistance: Double; safecall;
    property CutoffDistance: Double read get_CutoffDistance;
    property UnityGainDistance: Double read get_UnityGainDistance;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.AudioNodeEmitterDecayKind
  // Used Types:  Double
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterNaturalDecayModelProperties
  }
  // Windows.Media.Audio.IAudioNodeEmitterDecayModel
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitterDecayModel)]
  Audio_IAudioNodeEmitterDecayModel = interface(IInspectable)
  ['{1D1D5AF7-0D53-4FA9-BD84-D5816A86F3FF}']
    function get_Kind: Audio_AudioNodeEmitterDecayKind; safecall;
    function get_MinGain: Double; safecall;
    function get_MaxGain: Double; safecall;
    function get_NaturalProperties: Audio_IAudioNodeEmitterNaturalDecayModelProperties; safecall;
    property Kind: Audio_AudioNodeEmitterDecayKind read get_Kind;
    property MaxGain: Double read get_MaxGain;
    property MinGain: Double read get_MinGain;
    property NaturalProperties: Audio_IAudioNodeEmitterNaturalDecayModelProperties read get_NaturalProperties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterShape
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterDecayModel
  // Used Types:  Double
  // Used Types:  Boolean
  }
  // Windows.Media.Audio.IAudioNodeEmitter
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitter)]
  Audio_IAudioNodeEmitter = interface(IInspectable)
  ['{3676971D-880A-47B8-ADF7-1323A9D965BE}']
    function get_Position: Numerics_Vector3; safecall;
    procedure put_Position(value: Numerics_Vector3); safecall;
    function get_Direction: Numerics_Vector3; safecall;
    procedure put_Direction(value: Numerics_Vector3); safecall;
    function get_Shape: Audio_IAudioNodeEmitterShape; safecall;
    function get_DecayModel: Audio_IAudioNodeEmitterDecayModel; safecall;
    function get_Gain: Double; safecall;
    procedure put_Gain(value: Double); safecall;
    function get_DistanceScale: Double; safecall;
    procedure put_DistanceScale(value: Double); safecall;
    function get_DopplerScale: Double; safecall;
    procedure put_DopplerScale(value: Double); safecall;
    function get_DopplerVelocity: Numerics_Vector3; safecall;
    procedure put_DopplerVelocity(value: Numerics_Vector3); safecall;
    function get_IsDopplerDisabled: Boolean; safecall;
    property DecayModel: Audio_IAudioNodeEmitterDecayModel read get_DecayModel;
    property Direction: Numerics_Vector3 read get_Direction write put_Direction;
    property DistanceScale: Double read get_DistanceScale write put_DistanceScale;
    property DopplerScale: Double read get_DopplerScale write put_DopplerScale;
    property DopplerVelocity: Numerics_Vector3 read get_DopplerVelocity write put_DopplerVelocity;
    property Gain: Double read get_Gain write put_Gain;
    property IsDopplerDisabled: Boolean read get_IsDopplerDisabled;
    property Position: Numerics_Vector3 read get_Position write put_Position;
    property Shape: Audio_IAudioNodeEmitterShape read get_Shape;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioFrameInputNode
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitter
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioDeviceInputNodeResult>
  // Used Types:  Windows.Media.Capture.MediaCategory
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Audio.ICreateAudioFileInputNodeResult>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Media.Audio.IAudioInputNode
  // Used Types:  Windows.Foundation.IClosable
  }
  // Windows.Media.Audio.IAudioGraph2
  Audio_IAudioGraph2 = interface(IInspectable)
  ['{4E4C3BD5-4FC1-45F6-A947-3CD38F4FD839}']
    function CreateFrameInputNode(encodingProperties: IAudioEncodingProperties; emitter: Audio_IAudioNodeEmitter): Audio_IAudioFrameInputNode; safecall;
    function CreateDeviceInputNodeAsync(category: Capture_MediaCategory; encodingProperties: IAudioEncodingProperties; device: IDeviceInformation; emitter: Audio_IAudioNodeEmitter): IAsyncOperation_1__Audio_ICreateAudioDeviceInputNodeResult; safecall;
    function CreateFileInputNodeAsync(&file: IStorageFile; emitter: Audio_IAudioNodeEmitter): IAsyncOperation_1__Audio_ICreateAudioFileInputNodeResult; safecall;
    function CreateSubmixNode(encodingProperties: IAudioEncodingProperties; emitter: Audio_IAudioNodeEmitter): Audio_IAudioInputNode; safecall;
    function CreateBatchUpdater: IClosable; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Numerics.Vector3
  // Used Types:  Windows.Foundation.Numerics.Quaternion
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioNodeListener
  [WinRTClassNameAttribute(SAudio_AudioNodeListener)]
  Audio_IAudioNodeListener = interface(IInspectable)
  ['{D9722E16-0C0A-41DA-B755-6C77835FB1EB}']
    function get_Position: Numerics_Vector3; safecall;
    procedure put_Position(value: Numerics_Vector3); safecall;
    function get_Orientation: Numerics_Quaternion; safecall;
    procedure put_Orientation(value: Numerics_Quaternion); safecall;
    function get_SpeedOfSound: Double; safecall;
    procedure put_SpeedOfSound(value: Double); safecall;
    function get_DopplerVelocity: Numerics_Vector3; safecall;
    procedure put_DopplerVelocity(value: Numerics_Vector3); safecall;
    property DopplerVelocity: Numerics_Vector3 read get_DopplerVelocity write put_DopplerVelocity;
    property Orientation: Numerics_Quaternion read get_Orientation write put_Orientation;
    property Position: Numerics_Vector3 read get_Position write put_Position;
    property SpeedOfSound: Double read get_SpeedOfSound write put_SpeedOfSound;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioNodeListener
  }
  // Windows.Media.Audio.IAudioNodeWithListener
  Audio_IAudioNodeWithListener = interface(IInspectable)
  ['{0E0F907C-79FF-4544-9EEB-01257B15105A}']
    procedure put_Listener(value: Audio_IAudioNodeListener); safecall;
    function get_Listener: Audio_IAudioNodeListener; safecall;
    property Listener: Audio_IAudioNodeListener read get_Listener write put_Listener;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitter
  }
  // Windows.Media.Audio.IAudioInputNode2
  Audio_IAudioInputNode2 = interface(IInspectable)
  ['{905156B7-CA68-4C6D-A8BC-E3EE17FE3FD2}']
    function get_Emitter: Audio_IAudioNodeEmitter; safecall;
    property Emitter: Audio_IAudioNodeEmitter read get_Emitter;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.Media.Audio.IEqualizerBand
  [WinRTClassNameAttribute(SAudio_EqualizerBand)]
  Audio_IEqualizerBand = interface(IInspectable)
  ['{C00A5A6A-262D-4B85-9BB7-43280B62ED0C}']
    function get_Bandwidth: Double; safecall;
    procedure put_Bandwidth(value: Double); safecall;
    function get_FrequencyCenter: Double; safecall;
    procedure put_FrequencyCenter(value: Double); safecall;
    function get_Gain: Double; safecall;
    procedure put_Gain(value: Double); safecall;
    property Bandwidth: Double read get_Bandwidth write put_Bandwidth;
    property FrequencyCenter: Double read get_FrequencyCenter write put_FrequencyCenter;
    property Gain: Double read get_Gain write put_Gain;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IEqualizerBand>
  IIterator_1__Audio_IEqualizerBand_Base = interface(IInspectable)
  ['{EB4F8B6A-7928-5F2F-B7F2-7B90C084356F}']
  end;
  {
  // Used Types:  Windows.Media.Audio.IEqualizerBand
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IEqualizerBand>
  IIterator_1__Audio_IEqualizerBand = interface(IIterator_1__Audio_IEqualizerBand_Base)
  ['{A32D544C-1599-56FA-B966-8749B547CF9A}']
    function get_Current: Audio_IEqualizerBand; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PAudio_IEqualizerBand): Cardinal; safecall;
    property Current: Audio_IEqualizerBand read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Audio.IEqualizerBand>
  IIterable_1__Audio_IEqualizerBand_Base = interface(IInspectable)
  ['{6F76D148-023E-565A-9F09-4AD4A32AD74F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Audio.IEqualizerBand>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Audio.IEqualizerBand>
  IIterable_1__Audio_IEqualizerBand = interface(IIterable_1__Audio_IEqualizerBand_Base)
  ['{5E78AB72-2967-555C-B1B1-3FDA9303A920}']
    function First: IIterator_1__Audio_IEqualizerBand; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IEqualizerBand
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Audio.IEqualizerBand>
  IVectorView_1__Audio_IEqualizerBand = interface(IInspectable)
  ['{BCEA7D0A-5756-58DE-9A28-0D7A22C763D7}']
    function GetAt(index: Cardinal): Audio_IEqualizerBand; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Audio_IEqualizerBand; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PAudio_IEqualizerBand): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Audio.IEqualizerBand>
  }
  // Windows.Media.Audio.IEqualizerEffectDefinition
  [WinRTClassNameAttribute(SAudio_EqualizerEffectDefinition)]
  Audio_IEqualizerEffectDefinition = interface(IInspectable)
  ['{023F6F1F-83FE-449A-A822-C696442D16B0}']
    function get_Bands: IVectorView_1__Audio_IEqualizerBand; safecall;
    property Bands: IVectorView_1__Audio_IEqualizerBand read get_Bands;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IEqualizerEffectDefinition
  // Used Types:  Windows.Media.Audio.IAudioGraph
  }
  // Windows.Media.Audio.IEqualizerEffectDefinitionFactory
  [WinRTClassNameAttribute(SAudio_EqualizerEffectDefinition)]
  Audio_IEqualizerEffectDefinitionFactory = interface(IInspectable)
  ['{D2876FC4-D410-4EB5-9E69-C9AA1277EAF0}']
    function Create(audioGraph: Audio_IAudioGraph): Audio_IEqualizerEffectDefinition; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  UInt8
  // Used Types:  Boolean
  }
  // Windows.Media.Audio.IReverbEffectDefinition
  [WinRTClassNameAttribute(SAudio_ReverbEffectDefinition)]
  Audio_IReverbEffectDefinition = interface(IInspectable)
  ['{4606AA89-F563-4D0A-8F6E-F0CDDFF35D84}']
    procedure put_WetDryMix(value: Double); safecall;
    function get_WetDryMix: Double; safecall;
    procedure put_ReflectionsDelay(value: Cardinal); safecall;
    function get_ReflectionsDelay: Cardinal; safecall;
    procedure put_ReverbDelay(value: Byte); safecall;
    function get_ReverbDelay: Byte; safecall;
    procedure put_RearDelay(value: Byte); safecall;
    function get_RearDelay: Byte; safecall;
    procedure put_PositionLeft(value: Byte); safecall;
    function get_PositionLeft: Byte; safecall;
    procedure put_PositionRight(value: Byte); safecall;
    function get_PositionRight: Byte; safecall;
    procedure put_PositionMatrixLeft(value: Byte); safecall;
    function get_PositionMatrixLeft: Byte; safecall;
    procedure put_PositionMatrixRight(value: Byte); safecall;
    function get_PositionMatrixRight: Byte; safecall;
    procedure put_EarlyDiffusion(value: Byte); safecall;
    function get_EarlyDiffusion: Byte; safecall;
    procedure put_LateDiffusion(value: Byte); safecall;
    function get_LateDiffusion: Byte; safecall;
    procedure put_LowEQGain(value: Byte); safecall;
    function get_LowEQGain: Byte; safecall;
    procedure put_LowEQCutoff(value: Byte); safecall;
    function get_LowEQCutoff: Byte; safecall;
    procedure put_HighEQGain(value: Byte); safecall;
    function get_HighEQGain: Byte; safecall;
    procedure put_HighEQCutoff(value: Byte); safecall;
    function get_HighEQCutoff: Byte; safecall;
    procedure put_RoomFilterFreq(value: Double); safecall;
    function get_RoomFilterFreq: Double; safecall;
    procedure put_RoomFilterMain(value: Double); safecall;
    function get_RoomFilterMain: Double; safecall;
    procedure put_RoomFilterHF(value: Double); safecall;
    function get_RoomFilterHF: Double; safecall;
    procedure put_ReflectionsGain(value: Double); safecall;
    function get_ReflectionsGain: Double; safecall;
    procedure put_ReverbGain(value: Double); safecall;
    function get_ReverbGain: Double; safecall;
    procedure put_DecayTime(value: Double); safecall;
    function get_DecayTime: Double; safecall;
    procedure put_Density(value: Double); safecall;
    function get_Density: Double; safecall;
    procedure put_RoomSize(value: Double); safecall;
    function get_RoomSize: Double; safecall;
    procedure put_DisableLateField(value: Boolean); safecall;
    function get_DisableLateField: Boolean; safecall;
    property DecayTime: Double read get_DecayTime write put_DecayTime;
    property Density: Double read get_Density write put_Density;
    property DisableLateField: Boolean read get_DisableLateField write put_DisableLateField;
    property EarlyDiffusion: Byte read get_EarlyDiffusion write put_EarlyDiffusion;
    property HighEQCutoff: Byte read get_HighEQCutoff write put_HighEQCutoff;
    property HighEQGain: Byte read get_HighEQGain write put_HighEQGain;
    property LateDiffusion: Byte read get_LateDiffusion write put_LateDiffusion;
    property LowEQCutoff: Byte read get_LowEQCutoff write put_LowEQCutoff;
    property LowEQGain: Byte read get_LowEQGain write put_LowEQGain;
    property PositionLeft: Byte read get_PositionLeft write put_PositionLeft;
    property PositionMatrixLeft: Byte read get_PositionMatrixLeft write put_PositionMatrixLeft;
    property PositionMatrixRight: Byte read get_PositionMatrixRight write put_PositionMatrixRight;
    property PositionRight: Byte read get_PositionRight write put_PositionRight;
    property RearDelay: Byte read get_RearDelay write put_RearDelay;
    property ReflectionsDelay: Cardinal read get_ReflectionsDelay write put_ReflectionsDelay;
    property ReflectionsGain: Double read get_ReflectionsGain write put_ReflectionsGain;
    property ReverbDelay: Byte read get_ReverbDelay write put_ReverbDelay;
    property ReverbGain: Double read get_ReverbGain write put_ReverbGain;
    property RoomFilterFreq: Double read get_RoomFilterFreq write put_RoomFilterFreq;
    property RoomFilterHF: Double read get_RoomFilterHF write put_RoomFilterHF;
    property RoomFilterMain: Double read get_RoomFilterMain write put_RoomFilterMain;
    property RoomSize: Double read get_RoomSize write put_RoomSize;
    property WetDryMix: Double read get_WetDryMix write put_WetDryMix;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IReverbEffectDefinition
  // Used Types:  Windows.Media.Audio.IAudioGraph
  }
  // Windows.Media.Audio.IReverbEffectDefinitionFactory
  [WinRTClassNameAttribute(SAudio_ReverbEffectDefinition)]
  Audio_IReverbEffectDefinitionFactory = interface(IInspectable)
  ['{A7D5CBFE-100B-4FF0-9DA6-DC4E05A759F0}']
    function Create(audioGraph: Audio_IAudioGraph): Audio_IReverbEffectDefinition; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.Media.Audio.IEchoEffectDefinition
  [WinRTClassNameAttribute(SAudio_EchoEffectDefinition)]
  Audio_IEchoEffectDefinition = interface(IInspectable)
  ['{0E4D3FAA-36B8-4C91-B9DA-11F44A8A6610}']
    procedure put_WetDryMix(value: Double); safecall;
    function get_WetDryMix: Double; safecall;
    procedure put_Feedback(value: Double); safecall;
    function get_Feedback: Double; safecall;
    procedure put_Delay(value: Double); safecall;
    function get_Delay: Double; safecall;
    property Delay: Double read get_Delay write put_Delay;
    property Feedback: Double read get_Feedback write put_Feedback;
    property WetDryMix: Double read get_WetDryMix write put_WetDryMix;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IEchoEffectDefinition
  // Used Types:  Windows.Media.Audio.IAudioGraph
  }
  // Windows.Media.Audio.IEchoEffectDefinitionFactory
  [WinRTClassNameAttribute(SAudio_EchoEffectDefinition)]
  Audio_IEchoEffectDefinitionFactory = interface(IInspectable)
  ['{0D4E2257-AAF2-4E86-A54C-FB79DB8F6C12}']
    function Create(audioGraph: Audio_IAudioGraph): Audio_IEchoEffectDefinition; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Media.Audio.ILimiterEffectDefinition
  [WinRTClassNameAttribute(SAudio_LimiterEffectDefinition)]
  Audio_ILimiterEffectDefinition = interface(IInspectable)
  ['{6B755D19-2603-47BA-BDEB-39055E3486DC}']
    procedure put_Release(value: Cardinal); safecall;
    function get_Release: Cardinal; safecall;
    procedure put_Loudness(value: Cardinal); safecall;
    function get_Loudness: Cardinal; safecall;
    property Loudness: Cardinal read get_Loudness write put_Loudness;
    property Release: Cardinal read get_Release write put_Release;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.ILimiterEffectDefinition
  // Used Types:  Windows.Media.Audio.IAudioGraph
  }
  // Windows.Media.Audio.ILimiterEffectDefinitionFactory
  [WinRTClassNameAttribute(SAudio_LimiterEffectDefinition)]
  Audio_ILimiterEffectDefinitionFactory = interface(IInspectable)
  ['{ECBAE6F1-61FF-45EF-B8F5-48659A57C72D}']
    function Create(audioGraph: Audio_IAudioGraph): Audio_ILimiterEffectDefinition; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterShape
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioNodeEmitterShapeStatics
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitterShape)]
  Audio_IAudioNodeEmitterShapeStatics = interface(IInspectable)
  ['{57BB2771-FFA5-4B86-A779-E264AEB9145F}']
    function CreateCone(innerAngle: Double; outerAngle: Double; outerAngleGain: Double): Audio_IAudioNodeEmitterShape; safecall;
    function CreateOmnidirectional: Audio_IAudioNodeEmitterShape; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterDecayModel
  // Used Types:  Double
  }
  // Windows.Media.Audio.IAudioNodeEmitterDecayModelStatics
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitterDecayModel)]
  Audio_IAudioNodeEmitterDecayModelStatics = interface(IInspectable)
  ['{C7787CA8-F178-462F-BC81-8DD5CBE5DAE8}']
    function CreateNatural(minGain: Double; maxGain: Double; unityGainDistance: Double; cutoffDistance: Double): Audio_IAudioNodeEmitterDecayModel; safecall;
    function CreateCustom(minGain: Double; maxGain: Double): Audio_IAudioNodeEmitterDecayModel; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.SpatialAudioModel
  }
  // Windows.Media.Audio.IAudioNodeEmitter2
  Audio_IAudioNodeEmitter2 = interface(IInspectable)
  ['{4AB6EECB-EC29-47F8-818C-B6B660A5AEB1}']
    function get_SpatialAudioModel: Audio_SpatialAudioModel; safecall;
    procedure put_SpatialAudioModel(value: Audio_SpatialAudioModel); safecall;
    property SpatialAudioModel: Audio_SpatialAudioModel read get_SpatialAudioModel write put_SpatialAudioModel;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitter
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterShape
  // Used Types:  Windows.Media.Audio.IAudioNodeEmitterDecayModel
  // Used Types:  Windows.Media.Audio.AudioNodeEmitterSettings
  }
  // Windows.Media.Audio.IAudioNodeEmitterFactory
  [WinRTClassNameAttribute(SAudio_AudioNodeEmitter)]
  Audio_IAudioNodeEmitterFactory = interface(IInspectable)
  ['{FDC8489A-6AD6-4CE4-B7F7-A99370DF7EE9}']
    function CreateAudioNodeEmitter(shape: Audio_IAudioNodeEmitterShape; decayModel: Audio_IAudioNodeEmitterDecayModel; settings: Audio_AudioNodeEmitterSettings): Audio_IAudioNodeEmitter; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt32
  }
  // Windows.Media.Capture.IMediaCaptureFailedEventArgs
  Capture_IMediaCaptureFailedEventArgs = interface(IInspectable)
  ['{80FDE3F4-54C4-42C0-8D19-CEA1A87CA18B}']
    function get_Message: HSTRING; safecall;
    function get_Code: Cardinal; safecall;
    property Code: Cardinal read get_Code;
    property Message: HSTRING read get_Message;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Capture.StreamingCaptureMode
  // Used Types:  Windows.Media.Capture.PhotoCaptureSource
  }
  // Windows.Media.Capture.IMediaCaptureInitializationSettings
  [WinRTClassNameAttribute(SCapture_MediaCaptureInitializationSettings)]
  Capture_IMediaCaptureInitializationSettings = interface(IInspectable)
  ['{9782BA70-EA65-4900-9356-8CA887726884}']
    procedure put_AudioDeviceId(value: HSTRING); safecall;
    function get_AudioDeviceId: HSTRING; safecall;
    procedure put_VideoDeviceId(value: HSTRING); safecall;
    function get_VideoDeviceId: HSTRING; safecall;
    procedure put_StreamingCaptureMode(value: Capture_StreamingCaptureMode); safecall;
    function get_StreamingCaptureMode: Capture_StreamingCaptureMode; safecall;
    procedure put_PhotoCaptureSource(value: Capture_PhotoCaptureSource); safecall;
    function get_PhotoCaptureSource: Capture_PhotoCaptureSource; safecall;
    property AudioDeviceId: HSTRING read get_AudioDeviceId write put_AudioDeviceId;
    property PhotoCaptureSource: Capture_PhotoCaptureSource read get_PhotoCaptureSource write put_PhotoCaptureSource;
    property StreamingCaptureMode: Capture_StreamingCaptureMode read get_StreamingCaptureMode write put_StreamingCaptureMode;
    property VideoDeviceId: HSTRING read get_VideoDeviceId write put_VideoDeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.IMediaExtension
  IMediaExtension = interface(IInspectable)
  ['{07915118-45DF-442B-8A3F-F7826A6370AB}']
    procedure SetProperties(configuration: IPropertySet); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCapture
  }
  // Windows.Media.Capture.RecordLimitationExceededEventHandler
  Capture_RecordLimitationExceededEventHandler = interface(IUnknown)
  ['{3FAE8F2E-4FE1-4FFD-AABA-E1F1337D4E53}']
    procedure Invoke(sender: Capture_IMediaCapture); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Capture.StreamingCaptureMode
  // Used Types:  Windows.Media.Capture.PhotoCaptureSource
  // Used Types:  Windows.Media.Capture.VideoDeviceCharacteristic
  }
  // Windows.Media.Capture.IMediaCaptureSettings
  [WinRTClassNameAttribute(SCapture_MediaCaptureSettings)]
  Capture_IMediaCaptureSettings = interface(IInspectable)
  ['{1D83AAFE-6D45-4477-8DC4-AC5BC01C4091}']
    function get_AudioDeviceId: HSTRING; safecall;
    function get_VideoDeviceId: HSTRING; safecall;
    function get_StreamingCaptureMode: Capture_StreamingCaptureMode; safecall;
    function get_PhotoCaptureSource: Capture_PhotoCaptureSource; safecall;
    function get_VideoDeviceCharacteristic: Capture_VideoDeviceCharacteristic; safecall;
    property AudioDeviceId: HSTRING read get_AudioDeviceId;
    property PhotoCaptureSource: Capture_PhotoCaptureSource read get_PhotoCaptureSource;
    property StreamingCaptureMode: Capture_StreamingCaptureMode read get_StreamingCaptureMode;
    property VideoDeviceCharacteristic: Capture_VideoDeviceCharacteristic read get_VideoDeviceCharacteristic;
    property VideoDeviceId: HSTRING read get_VideoDeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.Capture.IMediaCaptureInitializationSettings
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Media.IMediaExtension
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Media.MediaProperties.IImageEncodingProperties
  // Used Types:  Windows.Media.Capture.MediaStreamType
  // Used Types:  Guid
  // Used Types:  Object
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Media.Capture.MediaCaptureFailedEventHandler
  // Used Types:  Windows.Media.Capture.RecordLimitationExceededEventHandler
  // Used Types:  Windows.Media.Capture.IMediaCaptureSettings
  // Used Types:  Windows.Media.Devices.IAudioDeviceController
  // Used Types:  Windows.Media.Devices.IVideoDeviceController
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Capture.VideoRotation
  }
  // Windows.Media.Capture.IMediaCapture
  [WinRTClassNameAttribute(SCapture_MediaCapture)]
  Capture_IMediaCapture = interface(IInspectable)
  ['{C61AFBB4-FB10-4A34-AC18-CA80D9C8E7EE}']
    function InitializeAsync: IAsyncAction; overload; safecall;
    function InitializeAsync(mediaCaptureInitializationSettings: Capture_IMediaCaptureInitializationSettings): IAsyncAction; overload; safecall;
    function StartRecordToStorageFileAsync(encodingProfile: IMediaEncodingProfile; &file: IStorageFile): IAsyncAction; safecall;
    function StartRecordToStreamAsync(encodingProfile: IMediaEncodingProfile; stream: IRandomAccessStream): IAsyncAction; safecall;
    function StartRecordToCustomSinkAsync(encodingProfile: IMediaEncodingProfile; customMediaSink: IMediaExtension): IAsyncAction; overload; safecall;
    function StartRecordToCustomSinkAsync(encodingProfile: IMediaEncodingProfile; customSinkActivationId: HSTRING; customSinkSettings: IPropertySet): IAsyncAction; overload; safecall;
    function StopRecordAsync: IAsyncAction; safecall;
    function CapturePhotoToStorageFileAsync(&type: IImageEncodingProperties; &file: IStorageFile): IAsyncAction; safecall;
    function CapturePhotoToStreamAsync(&type: IImageEncodingProperties; stream: IRandomAccessStream): IAsyncAction; safecall;
    function AddEffectAsync(mediaStreamType: Capture_MediaStreamType; effectActivationID: HSTRING; effectSettings: IPropertySet): IAsyncAction; safecall;
    function ClearEffectsAsync(mediaStreamType: Capture_MediaStreamType): IAsyncAction; safecall;
    procedure SetEncoderProperty(mediaStreamType: Capture_MediaStreamType; propertyId: TGuid; propertyValue: IInspectable); safecall;
    function GetEncoderProperty(mediaStreamType: Capture_MediaStreamType; propertyId: TGuid): IInspectable; safecall;
    function add_Failed(errorEventHandler: Capture_MediaCaptureFailedEventHandler): EventRegistrationToken; safecall;
    procedure remove_Failed(eventCookie: EventRegistrationToken); safecall;
    function add_RecordLimitationExceeded(recordLimitationExceededEventHandler: Capture_RecordLimitationExceededEventHandler): EventRegistrationToken; safecall;
    procedure remove_RecordLimitationExceeded(eventCookie: EventRegistrationToken); safecall;
    function get_MediaCaptureSettings: Capture_IMediaCaptureSettings; safecall;
    function get_AudioDeviceController: IAudioDeviceController; safecall;
    function get_VideoDeviceController: IVideoDeviceController; safecall;
    procedure SetPreviewMirroring(value: Boolean); safecall;
    function GetPreviewMirroring: Boolean; safecall;
    procedure SetPreviewRotation(value: Capture_VideoRotation); safecall;
    function GetPreviewRotation: Capture_VideoRotation; safecall;
    procedure SetRecordRotation(value: Capture_VideoRotation); safecall;
    function GetRecordRotation: Capture_VideoRotation; safecall;
    property AudioDeviceController: IAudioDeviceController read get_AudioDeviceController;
    property MediaCaptureSettings: Capture_IMediaCaptureSettings read get_MediaCaptureSettings;
    property VideoDeviceController: IVideoDeviceController read get_VideoDeviceController;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCapture
  // Used Types:  Windows.Media.Capture.IMediaCaptureFailedEventArgs
  }
  // Windows.Media.Capture.MediaCaptureFailedEventHandler
  Capture_MediaCaptureFailedEventHandler = interface(IUnknown)
  ['{2014EFFB-5CD8-4F08-A314-0D360DA59F14}']
    procedure Invoke(sender: Capture_IMediaCapture; errorEventArgs: Capture_IMediaCaptureFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Double
  // Used Types:  Boolean
  }
  // Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
  [WinRTClassNameAttribute(SCapture_MediaCaptureVideoProfileMediaDescription)]
  Capture_IMediaCaptureVideoProfileMediaDescription = interface(IInspectable)
  ['{8012AFEF-B691-49FF-83F2-C1E76EAAEA1B}']
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    function get_FrameRate: Double; safecall;
    function get_IsVariablePhotoSequenceSupported: Boolean; safecall;
    function get_IsHdrVideoSupported: Boolean; safecall;
    property FrameRate: Double read get_FrameRate;
    property Height: Cardinal read get_Height;
    property IsHdrVideoSupported: Boolean read get_IsHdrVideoSupported;
    property IsVariablePhotoSequenceSupported: Boolean read get_IsVariablePhotoSequenceSupported;
    property Width: Cardinal read get_Width;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription_Base = interface(IInspectable)
  ['{B3E8378F-710C-5126-A6C9-8F489F63E15E}']
  end;
  {
  // Used Types:  Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription = interface(IIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription_Base)
  ['{D8A28063-75B8-5B18-99F6-DAA842E0E03E}']
    function get_Current: Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCapture_IMediaCaptureVideoProfileMediaDescription): Cardinal; safecall;
    property Current: Capture_IMediaCaptureVideoProfileMediaDescription read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IIterable_1__Capture_IMediaCaptureVideoProfileMediaDescription_Base = interface(IInspectable)
  ['{0895E56D-FE1F-5364-AB67-C597D8970B89}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IIterable_1__Capture_IMediaCaptureVideoProfileMediaDescription = interface(IIterable_1__Capture_IMediaCaptureVideoProfileMediaDescription_Base)
  ['{6DA537F0-3321-5348-A52A-D3C7EB841B6E}']
    function First: IIterator_1__Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription = interface(IInspectable)
  ['{05C7BEEF-90A2-559D-BAA7-EF2829B73F50}']
    function GetAt(index: Cardinal): Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Capture_IMediaCaptureVideoProfileMediaDescription; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCapture_IMediaCaptureVideoProfileMediaDescription): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IIterator_1__Capture_IMediaCaptureVideoProfile_Base = interface(IInspectable)
  ['{A9BC95F8-B5C0-5108-B9ED-A902339366E9}']
  end;
  {
  // Used Types:  Windows.Media.Capture.IMediaCaptureVideoProfile
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IIterator_1__Capture_IMediaCaptureVideoProfile = interface(IIterator_1__Capture_IMediaCaptureVideoProfile_Base)
  ['{C79887D9-00EC-5467-ACE7-526C66AE12EC}']
    function get_Current: Capture_IMediaCaptureVideoProfile; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCapture_IMediaCaptureVideoProfile): Cardinal; safecall;
    property Current: Capture_IMediaCaptureVideoProfile read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IIterable_1__Capture_IMediaCaptureVideoProfile_Base = interface(IInspectable)
  ['{DBD49D71-E07B-5E11-824A-62ACE8BDFC3E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IIterable_1__Capture_IMediaCaptureVideoProfile = interface(IIterable_1__Capture_IMediaCaptureVideoProfile_Base)
  ['{AA89F4F4-E6A8-5FE1-9F90-8EC7D6361B78}']
    function First: IIterator_1__Capture_IMediaCaptureVideoProfile; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCaptureVideoProfile
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  IVectorView_1__Capture_IMediaCaptureVideoProfile = interface(IInspectable)
  ['{ACAE267E-7B10-533A-BAA3-DA739D17B4D8}']
    function GetAt(index: Cardinal): Capture_IMediaCaptureVideoProfile; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Capture_IMediaCaptureVideoProfile; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCapture_IMediaCaptureVideoProfile): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  }
  // Windows.Media.Capture.IMediaCaptureVideoProfile
  [WinRTClassNameAttribute(SCapture_MediaCaptureVideoProfile)]
  Capture_IMediaCaptureVideoProfile = interface(IInspectable)
  ['{21A073BF-A3EE-4ECF-9EF6-50B0BC4E1305}']
    function get_Id: HSTRING; safecall;
    function get_VideoDeviceId: HSTRING; safecall;
    function get_SupportedPreviewMediaDescription: IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    function get_SupportedRecordMediaDescription: IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    function get_SupportedPhotoMediaDescription: IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    function GetConcurrency: IVectorView_1__Capture_IMediaCaptureVideoProfile; safecall;
    property Id: HSTRING read get_Id;
    property SupportedPhotoMediaDescription: IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription read get_SupportedPhotoMediaDescription;
    property SupportedPreviewMediaDescription: IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription read get_SupportedPreviewMediaDescription;
    property SupportedRecordMediaDescription: IVectorView_1__Capture_IMediaCaptureVideoProfileMediaDescription read get_SupportedRecordMediaDescription;
    property VideoDeviceId: HSTRING read get_VideoDeviceId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.MediaCategory
  // Used Types:  Windows.Media.AudioProcessing
  }
  // Windows.Media.Capture.IMediaCaptureInitializationSettings2
  Capture_IMediaCaptureInitializationSettings2 = interface(IInspectable)
  ['{404E0626-C9DC-43E9-AEE4-E6BF1B57B44C}']
    procedure put_MediaCategory(value: Capture_MediaCategory); safecall;
    function get_MediaCategory: Capture_MediaCategory; safecall;
    procedure put_AudioProcessing(value: AudioProcessing); safecall;
    function get_AudioProcessing: AudioProcessing; safecall;
    property AudioProcessing: AudioProcessing read get_AudioProcessing write put_AudioProcessing;
    property MediaCategory: Capture_MediaCategory read get_MediaCategory write put_MediaCategory;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Core.IMediaSource
  [WinRTClassNameAttribute(SCore_MediaSource)]
  Core_IMediaSource = interface(IInspectable)
  ['{E7BFB599-A09D-4C21-BCDF-20AF4F86B3D9}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaSource
  }
  // Windows.Media.Capture.IMediaCaptureInitializationSettings3
  Capture_IMediaCaptureInitializationSettings3 = interface(IInspectable)
  ['{4160519D-BE48-4730-8104-0CF6E9E97948}']
    procedure put_AudioSource(value: Core_IMediaSource); safecall;
    function get_AudioSource: Core_IMediaSource; safecall;
    procedure put_VideoSource(value: Core_IMediaSource); safecall;
    function get_VideoSource: Core_IMediaSource; safecall;
    property AudioSource: Core_IMediaSource read get_AudioSource write put_AudioSource;
    property VideoSource: Core_IMediaSource read get_VideoSource write put_VideoSource;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCaptureVideoProfile
  // Used Types:  Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription
  }
  // Windows.Media.Capture.IMediaCaptureInitializationSettings4
  Capture_IMediaCaptureInitializationSettings4 = interface(IInspectable)
  ['{F502A537-4CB7-4D28-95ED-4F9F012E0518}']
    function get_VideoProfile: Capture_IMediaCaptureVideoProfile; safecall;
    procedure put_VideoProfile(value: Capture_IMediaCaptureVideoProfile); safecall;
    function get_PreviewMediaDescription: Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    procedure put_PreviewMediaDescription(value: Capture_IMediaCaptureVideoProfileMediaDescription); safecall;
    function get_RecordMediaDescription: Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    procedure put_RecordMediaDescription(value: Capture_IMediaCaptureVideoProfileMediaDescription); safecall;
    function get_PhotoMediaDescription: Capture_IMediaCaptureVideoProfileMediaDescription; safecall;
    procedure put_PhotoMediaDescription(value: Capture_IMediaCaptureVideoProfileMediaDescription); safecall;
    property PhotoMediaDescription: Capture_IMediaCaptureVideoProfileMediaDescription read get_PhotoMediaDescription write put_PhotoMediaDescription;
    property PreviewMediaDescription: Capture_IMediaCaptureVideoProfileMediaDescription read get_PreviewMediaDescription write put_PreviewMediaDescription;
    property RecordMediaDescription: Capture_IMediaCaptureVideoProfileMediaDescription read get_RecordMediaDescription write put_RecordMediaDescription;
    property VideoProfile: Capture_IMediaCaptureVideoProfile read get_VideoProfile write put_VideoProfile;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Capture.MediaStreamType
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameSourceKind
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  // Used Types:  Windows.Perception.Spatial.ISpatialCoordinateSystem
  }
  // Windows.Media.Capture.Frames.IMediaFrameSourceInfo
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameSourceInfo)]
  Capture_Frames_IMediaFrameSourceInfo = interface(IInspectable)
  ['{87BDC9CD-4601-408F-91CF-038318CD0AF3}']
    function get_Id: HSTRING; safecall;
    function get_MediaStreamType: Capture_MediaStreamType; safecall;
    function get_SourceKind: Capture_Frames_MediaFrameSourceKind; safecall;
    function get_SourceGroup: Capture_Frames_IMediaFrameSourceGroup; safecall;
    function get_DeviceInformation: IDeviceInformation; safecall;
    function get_Properties: IMapView_2__TGuid__IInspectable; safecall;
    function get_CoordinateSystem: Spatial_ISpatialCoordinateSystem; safecall;
    property CoordinateSystem: Spatial_ISpatialCoordinateSystem read get_CoordinateSystem;
    property DeviceInformation: IDeviceInformation read get_DeviceInformation;
    property Id: HSTRING read get_Id;
    property MediaStreamType: Capture_MediaStreamType read get_MediaStreamType;
    property Properties: IMapView_2__TGuid__IInspectable read get_Properties;
    property SourceGroup: Capture_Frames_IMediaFrameSourceGroup read get_SourceGroup;
    property SourceKind: Capture_Frames_MediaFrameSourceKind read get_SourceKind;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IIterator_1__Capture_Frames_IMediaFrameSourceInfo_Base = interface(IInspectable)
  ['{443C60D8-208E-5399-BC44-EDC6FEF02293}']
  end;
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IIterator_1__Capture_Frames_IMediaFrameSourceInfo = interface(IIterator_1__Capture_Frames_IMediaFrameSourceInfo_Base)
  ['{D4E28999-0643-5C2E-860E-32108863D955}']
    function get_Current: Capture_Frames_IMediaFrameSourceInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameSourceInfo): Cardinal; safecall;
    property Current: Capture_Frames_IMediaFrameSourceInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IIterable_1__Capture_Frames_IMediaFrameSourceInfo_Base = interface(IInspectable)
  ['{2E29C5B0-6AA9-50F2-91A4-5B67A5598F2E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IIterable_1__Capture_Frames_IMediaFrameSourceInfo = interface(IIterable_1__Capture_Frames_IMediaFrameSourceInfo_Base)
  ['{577E9A7B-DE0E-508A-810B-9AF3423EA577}']
    function First: IIterator_1__Capture_Frames_IMediaFrameSourceInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  IVectorView_1__Capture_Frames_IMediaFrameSourceInfo = interface(IInspectable)
  ['{74E3E781-549E-5136-B5EB-D1F11743E465}']
    function GetAt(index: Cardinal): Capture_Frames_IMediaFrameSourceInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Capture_Frames_IMediaFrameSourceInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameSourceInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceInfo>
  }
  // Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameSourceGroup)]
  Capture_Frames_IMediaFrameSourceGroup = interface(IInspectable)
  ['{7F605B87-4832-4B5F-AE3D-412FAAB37D34}']
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_SourceInfos: IVectorView_1__Capture_Frames_IMediaFrameSourceInfo; safecall;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property SourceInfos: IVectorView_1__Capture_Frames_IMediaFrameSourceInfo read get_SourceInfos;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  // Used Types:  Windows.Media.Capture.MediaCaptureSharingMode
  // Used Types:  Windows.Media.Capture.MediaCaptureMemoryPreference
  }
  // Windows.Media.Capture.IMediaCaptureInitializationSettings5
  Capture_IMediaCaptureInitializationSettings5 = interface(IInspectable)
  ['{D5A2E3B8-2626-4E94-B7B3-5308A0F64B1A}']
    function get_SourceGroup: Capture_Frames_IMediaFrameSourceGroup; safecall;
    procedure put_SourceGroup(value: Capture_Frames_IMediaFrameSourceGroup); safecall;
    function get_SharingMode: Capture_MediaCaptureSharingMode; safecall;
    procedure put_SharingMode(value: Capture_MediaCaptureSharingMode); safecall;
    function get_MemoryPreference: Capture_MediaCaptureMemoryPreference; safecall;
    procedure put_MemoryPreference(value: Capture_MediaCaptureMemoryPreference); safecall;
    property MemoryPreference: Capture_MediaCaptureMemoryPreference read get_MemoryPreference write put_MemoryPreference;
    property SharingMode: Capture_MediaCaptureSharingMode read get_SharingMode write put_SharingMode;
    property SourceGroup: Capture_Frames_IMediaFrameSourceGroup read get_SourceGroup write put_SourceGroup;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.Capture.IMediaCaptureInitializationSettings6
  Capture_IMediaCaptureInitializationSettings6 = interface(IInspectable)
  ['{B2E26B47-3DB1-4D33-AB63-0FFA09056585}']
    function get_AlwaysPlaySystemShutterSound: Boolean; safecall;
    procedure put_AlwaysPlaySystemShutterSound(value: Boolean); safecall;
    property AlwaysPlaySystemShutterSound: Boolean read get_AlwaysPlaySystemShutterSound write put_AlwaysPlaySystemShutterSound;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.IMediaCaptureVideoProfile>
  // Used Types:  Windows.Media.Capture.KnownVideoProfile
  }
  // Windows.Media.Capture.IMediaCaptureStatics
  [WinRTClassNameAttribute(SCapture_MediaCapture)]
  Capture_IMediaCaptureStatics = interface(IInspectable)
  ['{ACEF81FF-99ED-4645-965E-1925CFC63834}']
    function IsVideoProfileSupported(videoDeviceId: HSTRING): Boolean; safecall;
    function FindAllVideoProfiles(videoDeviceId: HSTRING): IVectorView_1__Capture_IMediaCaptureVideoProfile; safecall;
    function FindConcurrentProfiles(videoDeviceId: HSTRING): IVectorView_1__Capture_IMediaCaptureVideoProfile; safecall;
    function FindKnownVideoProfiles(videoDeviceId: HSTRING; name: Capture_KnownVideoProfile): IVectorView_1__Capture_IMediaCaptureVideoProfile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Capture.ILowLagMediaRecording
  [WinRTClassNameAttribute(SCapture_LowLagMediaRecording)]
  Capture_ILowLagMediaRecording = interface(IInspectable)
  ['{41C8BAF7-FF3F-49F0-A477-F195E3CE5108}']
    function StartAsync: IAsyncAction; safecall;
    function StopAsync: IAsyncAction; safecall;
    function FinishAsync: IAsyncAction; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagMediaRecording>
  AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording_Delegate_Base = interface(IUnknown)
  ['{64A8F80C-E646-52BB-8F4B-2A1D6B0B8219}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagMediaRecording>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagMediaRecording>
  AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording = interface(AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording_Delegate_Base)
  ['{CC1AFB16-7B7E-56A5-984E-1AF16BE62978}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_ILowLagMediaRecording; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagMediaRecording>
  IAsyncOperation_1__Capture_ILowLagMediaRecording_Base = interface(IInspectable)
  ['{4FEBEFCC-BEC0-5433-A7BA-7603D1EDC7B9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagMediaRecording>
  // Used Types:  Windows.Media.Capture.ILowLagMediaRecording
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagMediaRecording>
  IAsyncOperation_1__Capture_ILowLagMediaRecording = interface(IAsyncOperation_1__Capture_ILowLagMediaRecording_Base)
  ['{28D1B875-02BB-5F2C-AE79-E28CAEC91E64}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording; safecall;
    function GetResults: Capture_ILowLagMediaRecording; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_ILowLagMediaRecording read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Media.Capture.ICapturedFrame
  [WinRTClassNameAttribute(SCapture_CapturedFrame)]
  Capture_ICapturedFrame = interface(IInspectable)
  ['{1DD2DE1F-571B-44D8-8E80-A08A1578766E}']
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    property Height: Cardinal read get_Height;
    property Width: Cardinal read get_Width;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrame
  }
  // Windows.Media.Capture.ICapturedPhoto
  [WinRTClassNameAttribute(SCapture_CapturedPhoto)]
  Capture_ICapturedPhoto = interface(IInspectable)
  ['{B0CE7E5A-CFCC-4D6C-8AD1-0869208ACA16}']
    function get_Frame: Capture_ICapturedFrame; safecall;
    function get_Thumbnail: Capture_ICapturedFrame; safecall;
    property Frame: Capture_ICapturedFrame read get_Frame;
    property Thumbnail: Capture_ICapturedFrame read get_Thumbnail;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ICapturedPhoto>
  AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto_Delegate_Base = interface(IUnknown)
  ['{FDB0AA78-04E1-56B3-B6FC-F4DE79CD41A0}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ICapturedPhoto>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ICapturedPhoto>
  AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto = interface(AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto_Delegate_Base)
  ['{4B2524D3-9AA6-5F16-B25E-B5997E21DCB2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_ICapturedPhoto; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ICapturedPhoto>
  IAsyncOperation_1__Capture_ICapturedPhoto_Base = interface(IInspectable)
  ['{AF5235B1-4778-55E1-B49F-608048EA9BD9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ICapturedPhoto>
  // Used Types:  Windows.Media.Capture.ICapturedPhoto
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ICapturedPhoto>
  IAsyncOperation_1__Capture_ICapturedPhoto = interface(IAsyncOperation_1__Capture_ICapturedPhoto_Base)
  ['{397F5882-DD79-5694-B055-FB1075CE20AF}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto; safecall;
    function GetResults: Capture_ICapturedPhoto; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_ICapturedPhoto read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ICapturedPhoto>
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Capture.ILowLagPhotoCapture
  [WinRTClassNameAttribute(SCapture_LowLagPhotoCapture)]
  Capture_ILowLagPhotoCapture = interface(IInspectable)
  ['{A37251B7-6B44-473D-8F24-F703D6C0EC44}']
    function CaptureAsync: IAsyncOperation_1__Capture_ICapturedPhoto; safecall;
    function FinishAsync: IAsyncAction; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoCapture>
  AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture_Delegate_Base = interface(IUnknown)
  ['{6CEBB368-4E84-500A-9A5F-7B9A1ADE1F44}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoCapture>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoCapture>
  AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture = interface(AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture_Delegate_Base)
  ['{4761919E-25C6-5618-9CF5-3B3E0005CDC7}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_ILowLagPhotoCapture; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoCapture>
  IAsyncOperation_1__Capture_ILowLagPhotoCapture_Base = interface(IInspectable)
  ['{AF24404B-7E0D-5FFE-BBC8-AAF6FFE208FC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoCapture>
  // Used Types:  Windows.Media.Capture.ILowLagPhotoCapture
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoCapture>
  IAsyncOperation_1__Capture_ILowLagPhotoCapture = interface(IAsyncOperation_1__Capture_ILowLagPhotoCapture_Base)
  ['{F1DCCB77-692E-52BA-A268-78F2783775D3}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture; safecall;
    function GetResults: Capture_ILowLagPhotoCapture; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoCapture read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrame
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Capture.IPhotoCapturedEventArgs
  [WinRTClassNameAttribute(SCapture_PhotoCapturedEventArgs)]
  Capture_IPhotoCapturedEventArgs = interface(IInspectable)
  ['{373BFBC1-984E-4FF0-BF85-1C00AABC5A45}']
    function get_Frame: Capture_ICapturedFrame; safecall;
    function get_Thumbnail: Capture_ICapturedFrame; safecall;
    function get_CaptureTimeOffset: TimeSpan; safecall;
    property CaptureTimeOffset: TimeSpan read get_CaptureTimeOffset;
    property Frame: Capture_ICapturedFrame read get_Frame;
    property Thumbnail: Capture_ICapturedFrame read get_Thumbnail;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.ILowLagPhotoSequenceCapture,Windows.Media.Capture.IPhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs_Delegate_Base = interface(IUnknown)
  ['{B98AAB3A-FE80-5B27-88C3-E77FF585A96B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ILowLagPhotoSequenceCapture
  // Used Types:  Windows.Media.Capture.IPhotoCapturedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.ILowLagPhotoSequenceCapture,Windows.Media.Capture.IPhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs = interface(TypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs_Delegate_Base)
  ['{A1D14777-8210-53AF-8B23-7CB85AAF01A6}']
    procedure Invoke(sender: Capture_ILowLagPhotoSequenceCapture; args: Capture_IPhotoCapturedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.ILowLagPhotoSequenceCapture,Windows.Media.Capture.IPhotoCapturedEventArgs>
  }
  // Windows.Media.Capture.ILowLagPhotoSequenceCapture
  [WinRTClassNameAttribute(SCapture_LowLagPhotoSequenceCapture)]
  Capture_ILowLagPhotoSequenceCapture = interface(IInspectable)
  ['{7CC346BB-B9A9-4C91-8FFA-287E9C668669}']
    function StartAsync: IAsyncAction; safecall;
    function StopAsync: IAsyncAction; safecall;
    function FinishAsync: IAsyncAction; safecall;
    function add_PhotoCaptured(handler: TypedEventHandler_2__Capture_ILowLagPhotoSequenceCapture__Capture_IPhotoCapturedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PhotoCaptured(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture_Delegate_Base = interface(IUnknown)
  ['{767E0FDC-9563-572D-84E1-9CAAB0DEB63F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture = interface(AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture_Delegate_Base)
  ['{899A0A19-26E2-5DE2-BBA1-A1BB5B997489}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture_Base = interface(IInspectable)
  ['{AC9F0460-9D14-5AF0-B17B-37EA2D76A80D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  // Used Types:  Windows.Media.Capture.ILowLagPhotoSequenceCapture
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture = interface(IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture_Base)
  ['{D2B2E0AB-DC80-5328-A33E-5CE648C3F893}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture; safecall;
    function GetResults: Capture_ILowLagPhotoSequenceCapture; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_ILowLagPhotoSequenceCapture read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagMediaRecording>
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Media.IMediaExtension
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoCapture>
  // Used Types:  Windows.Media.MediaProperties.IImageEncodingProperties
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.ILowLagPhotoSequenceCapture>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.Capture.MediaStreamType
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProperties
  // Used Types:  Windows.Foundation.Collections.IMap`2<Guid,Object>
  }
  // Windows.Media.Capture.IMediaCapture2
  Capture_IMediaCapture2 = interface(IInspectable)
  ['{9CC68260-7DA1-4043-B652-21B8878DAFF9}']
    function PrepareLowLagRecordToStorageFileAsync(encodingProfile: IMediaEncodingProfile; &file: IStorageFile): IAsyncOperation_1__Capture_ILowLagMediaRecording; safecall;
    function PrepareLowLagRecordToStreamAsync(encodingProfile: IMediaEncodingProfile; stream: IRandomAccessStream): IAsyncOperation_1__Capture_ILowLagMediaRecording; safecall;
    function PrepareLowLagRecordToCustomSinkAsync(encodingProfile: IMediaEncodingProfile; customMediaSink: IMediaExtension): IAsyncOperation_1__Capture_ILowLagMediaRecording; overload; safecall;
    function PrepareLowLagRecordToCustomSinkAsync(encodingProfile: IMediaEncodingProfile; customSinkActivationId: HSTRING; customSinkSettings: IPropertySet): IAsyncOperation_1__Capture_ILowLagMediaRecording; overload; safecall;
    function PrepareLowLagPhotoCaptureAsync(&type: IImageEncodingProperties): IAsyncOperation_1__Capture_ILowLagPhotoCapture; safecall;
    function PrepareLowLagPhotoSequenceCaptureAsync(&type: IImageEncodingProperties): IAsyncOperation_1__Capture_ILowLagPhotoSequenceCapture; safecall;
    function SetEncodingPropertiesAsync(mediaStreamType: Capture_MediaStreamType; mediaEncodingProperties: IMediaEncodingProperties; encoderProperties: IMap_2__TGuid__IInspectable): IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.IReference`1<Single>
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Media.Devices.CaptureSceneMode>
  // Used Types:  Windows.Foundation.IReference`1<Boolean>
  }
  // Windows.Media.Capture.ICapturedFrameControlValues
  [WinRTClassNameAttribute(SCapture_CapturedFrameControlValues)]
  Capture_ICapturedFrameControlValues = interface(IInspectable)
  ['{90C65B7F-4E0D-4CA4-882D-7A144FED0A90}']
    function get_Exposure: IReference_1__TimeSpan; safecall;
    function get_ExposureCompensation: IReference_1__Single; safecall;
    function get_IsoSpeed: IReference_1__Cardinal; safecall;
    function get_Focus: IReference_1__Cardinal; safecall;
    function get_SceneMode: IReference_1__CaptureSceneMode; safecall;
    function get_Flashed: IReference_1__Boolean; safecall;
    function get_FlashPowerPercent: IReference_1__Single; safecall;
    function get_WhiteBalance: IReference_1__Cardinal; safecall;
    function get_ZoomFactor: IReference_1__Single; safecall;
    property Exposure: IReference_1__TimeSpan read get_Exposure;
    property ExposureCompensation: IReference_1__Single read get_ExposureCompensation;
    property FlashPowerPercent: IReference_1__Single read get_FlashPowerPercent;
    property Flashed: IReference_1__Boolean read get_Flashed;
    property Focus: IReference_1__Cardinal read get_Focus;
    property IsoSpeed: IReference_1__Cardinal read get_IsoSpeed;
    property SceneMode: IReference_1__CaptureSceneMode read get_SceneMode;
    property WhiteBalance: IReference_1__Cardinal read get_WhiteBalance;
    property ZoomFactor: IReference_1__Single read get_ZoomFactor;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrame
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  Windows.Media.Capture.ICapturedFrameControlValues
  }
  // Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs
  [WinRTClassNameAttribute(SCapture_Core_VariablePhotoCapturedEventArgs)]
  Capture_Core_IVariablePhotoCapturedEventArgs = interface(IInspectable)
  ['{D1EB4C5C-1B53-4E4A-8B5C-DB7887AC949B}']
    function get_Frame: Capture_ICapturedFrame; safecall;
    function get_CaptureTimeOffset: TimeSpan; safecall;
    function get_UsedFrameControllerIndex: IReference_1__Cardinal; safecall;
    function get_CapturedFrameControlValues: Capture_ICapturedFrameControlValues; safecall;
    property CaptureTimeOffset: TimeSpan read get_CaptureTimeOffset;
    property CapturedFrameControlValues: Capture_ICapturedFrameControlValues read get_CapturedFrameControlValues;
    property Frame: Capture_ICapturedFrame read get_Frame;
    property UsedFrameControllerIndex: IReference_1__Cardinal read get_UsedFrameControllerIndex;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs_Delegate_Base = interface(IUnknown)
  ['{BAB30230-3DCD-58E2-AAC5-A45F3E6F8097}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
  // Used Types:  Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs = interface(TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs_Delegate_Base)
  ['{818A58C1-18A9-52C1-AA61-244BAB25CC56}']
    procedure Invoke(sender: Capture_Core_IVariablePhotoSequenceCapture; args: Capture_Core_IVariablePhotoCapturedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Object>
  TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable_Delegate_Base = interface(IUnknown)
  ['{2210A640-0E7B-5E8F-A617-2CBB10314A5A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Object>
  TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable = interface(TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable_Delegate_Base)
  ['{B09D0C99-44F4-56B6-BD8B-166A0B9B2950}']
    procedure Invoke(sender: Capture_Core_IVariablePhotoSequenceCapture; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture,Object>
  }
  // Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
  [WinRTClassNameAttribute(SCapture_Core_VariablePhotoSequenceCapture)]
  Capture_Core_IVariablePhotoSequenceCapture = interface(IInspectable)
  ['{D0112D1D-031E-4041-A6D6-BD742476A8EE}']
    function StartAsync: IAsyncAction; safecall;
    function StopAsync: IAsyncAction; safecall;
    function FinishAsync: IAsyncAction; safecall;
    function add_PhotoCaptured(handler: TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__Capture_Core_IVariablePhotoCapturedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PhotoCaptured(token: EventRegistrationToken); safecall;
    function add_Stopped(handler: TypedEventHandler_2__Capture_Core_IVariablePhotoSequenceCapture__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Stopped(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture_Delegate_Base = interface(IUnknown)
  ['{18A55DD3-01E3-5AE5-9B5E-C84AD40CF6B7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture = interface(AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture_Delegate_Base)
  ['{8D92F345-0FF9-5C67-9B2C-43F2AAED42A6}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture_Base = interface(IInspectable)
  ['{0327C8BC-3148-53F3-8A3D-CDB12E49E132}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  // Used Types:  Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture = interface(IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture_Base)
  ['{84E9E62A-CF4C-570F-B529-38FDAA4EF6DE}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture; safecall;
    function GetResults: Capture_Core_IVariablePhotoSequenceCapture; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Core_IVariablePhotoSequenceCapture read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Devices.MediaCaptureFocusState
  }
  // Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs
  [WinRTClassNameAttribute(SCapture_MediaCaptureFocusChangedEventArgs)]
  Capture_IMediaCaptureFocusChangedEventArgs = interface(IInspectable)
  ['{81E1BC7F-2277-493E-ABEE-D3F44FF98C04}']
    function get_FocusState: MediaCaptureFocusState; safecall;
    property FocusState: MediaCaptureFocusState read get_FocusState;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{0561D9E8-0290-5332-B15E-B0D51ABE737C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCapture
  // Used Types:  Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs = interface(TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs_Delegate_Base)
  ['{71CEE5C6-FFFF-5D12-A9F4-AEE02F3A74B6}']
    procedure Invoke(sender: Capture_IMediaCapture; args: Capture_IMediaCaptureFocusChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrame
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs
  [WinRTClassNameAttribute(SCapture_PhotoConfirmationCapturedEventArgs)]
  Capture_IPhotoConfirmationCapturedEventArgs = interface(IInspectable)
  ['{AB473672-C28A-4827-8F8D-3636D3BEB51E}']
    function get_Frame: Capture_ICapturedFrame; safecall;
    function get_CaptureTimeOffset: TimeSpan; safecall;
    property CaptureTimeOffset: TimeSpan read get_CaptureTimeOffset;
    property Frame: Capture_ICapturedFrame read get_Frame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs_Delegate_Base = interface(IUnknown)
  ['{37DC3B13-B096-5F43-8104-F0DC4302E2B5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCapture
  // Used Types:  Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs = interface(TypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs_Delegate_Base)
  ['{9DE3D879-0219-5E31-9F3D-DA1D63686BF5}']
    procedure Invoke(sender: Capture_IMediaCapture; args: Capture_IPhotoConfirmationCapturedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Core.IVariablePhotoSequenceCapture>
  // Used Types:  Windows.Media.MediaProperties.IImageEncodingProperties
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs>
  }
  // Windows.Media.Capture.IMediaCapture3
  Capture_IMediaCapture3 = interface(IInspectable)
  ['{D4136F30-1564-466E-BC0A-AF94E02AB016}']
    function PrepareVariablePhotoSequenceCaptureAsync(&type: IImageEncodingProperties): IAsyncOperation_1__Capture_Core_IVariablePhotoSequenceCapture; safecall;
    function add_FocusChanged(handler: TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureFocusChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FocusChanged(token: EventRegistrationToken); safecall;
    function add_PhotoConfirmationCaptured(handler: TypedEventHandler_2__Capture_IMediaCapture__Capture_IPhotoConfirmationCapturedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PhotoConfirmationCaptured(token: EventRegistrationToken); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IMediaExtension>
  AsyncOperationCompletedHandler_1__IMediaExtension_Delegate_Base = interface(IUnknown)
  ['{9C1B578E-FB7D-5BAB-BA39-86387FE533B6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.IMediaExtension>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IMediaExtension>
  AsyncOperationCompletedHandler_1__IMediaExtension = interface(AsyncOperationCompletedHandler_1__IMediaExtension_Delegate_Base)
  ['{9C1B578E-FB7D-5BAB-BA39-86387FE533B6}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMediaExtension; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.IMediaExtension>
  IAsyncOperation_1__IMediaExtension_Base = interface(IInspectable)
  ['{F5CB3303-1C1F-5D30-B402-EFA192E80C49}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IMediaExtension>
  // Used Types:  Windows.Media.IMediaExtension
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.IMediaExtension>
  IAsyncOperation_1__IMediaExtension = interface(IAsyncOperation_1__IMediaExtension_Base)
  ['{F5CB3303-1C1F-5D30-B402-EFA192E80C49}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMediaExtension); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMediaExtension; safecall;
    function GetResults: IMediaExtension; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMediaExtension read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Effects.IVideoEffectDefinition
  [WinRTClassNameAttribute(SCore_VideoStabilizationEffectDefinition)]
  Effects_IVideoEffectDefinition = interface(IInspectable)
  ['{39F38CF0-8D0F-4F3E-84FC-2D46A5297943}']
    function get_ActivatableClassId: HSTRING; safecall;
    function get_Properties: IPropertySet; safecall;
    property ActivatableClassId: HSTRING read get_ActivatableClassId;
    property Properties: IPropertySet read get_Properties;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Object>
  TypedEventHandler_2__Capture_IMediaCapture__IInspectable_Delegate_Base = interface(IUnknown)
  ['{44C588F1-1BB7-5E12-8413-3CF0373C0BC8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCapture
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Object>
  TypedEventHandler_2__Capture_IMediaCapture__IInspectable = interface(TypedEventHandler_2__Capture_IMediaCapture__IInspectable_Delegate_Base)
  ['{60F3CBEE-49C9-5045-8FD0-8DF644BD36C3}']
    procedure Invoke(sender: Capture_IMediaCapture; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IVideoFrame>
  AsyncOperationCompletedHandler_1__IVideoFrame_Delegate_Base = interface(IUnknown)
  ['{6086F2FB-4A29-54CA-B6A3-F2391A03BC3B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.IVideoFrame>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IVideoFrame>
  AsyncOperationCompletedHandler_1__IVideoFrame = interface(AsyncOperationCompletedHandler_1__IVideoFrame_Delegate_Base)
  ['{F61D24ED-EDC5-5C0A-AD72-E42B5472F49A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVideoFrame; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.IVideoFrame>
  IAsyncOperation_1__IVideoFrame_Base = interface(IInspectable)
  ['{F12E515D-AC45-5153-96B2-CE53AB594A57}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.IVideoFrame>
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.IVideoFrame>
  IAsyncOperation_1__IVideoFrame = interface(IAsyncOperation_1__IVideoFrame_Base)
  ['{9425A3A5-A840-55AC-98B0-5BCC74311B8C}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVideoFrame); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVideoFrame; safecall;
    function GetResults: IVideoFrame; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVideoFrame read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrame
  // Used Types:  Windows.Media.Devices.AdvancedPhotoMode
  // Used Types:  Object
  }
  // Windows.Media.Capture.IAdvancedCapturedPhoto
  [WinRTClassNameAttribute(SCapture_AdvancedCapturedPhoto)]
  Capture_IAdvancedCapturedPhoto = interface(IInspectable)
  ['{F072728B-B292-4491-9D41-99807A550BBF}']
    function get_Frame: Capture_ICapturedFrame; safecall;
    function get_Mode: AdvancedPhotoMode; safecall;
    function get_Context: IInspectable; safecall;
    property Context: IInspectable read get_Context;
    property Frame: Capture_ICapturedFrame read get_Frame;
    property Mode: AdvancedPhotoMode read get_Mode;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto_Delegate_Base = interface(IUnknown)
  ['{EDF3452C-D918-5C95-8E3A-245044DD70DF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto = interface(AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto_Delegate_Base)
  ['{775828B8-66F2-5C90-B123-FDD8D845CA94}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_IAdvancedCapturedPhoto; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  IAsyncOperation_1__Capture_IAdvancedCapturedPhoto_Base = interface(IInspectable)
  ['{8F71B217-61EC-58AB-A646-EEDE0142D568}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  // Used Types:  Windows.Media.Capture.IAdvancedCapturedPhoto
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  IAsyncOperation_1__Capture_IAdvancedCapturedPhoto = interface(IAsyncOperation_1__Capture_IAdvancedCapturedPhoto_Base)
  ['{357EEAE9-781A-52AE-866E-4F864968DEE4}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto; safecall;
    function GetResults: Capture_IAdvancedCapturedPhoto; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_IAdvancedCapturedPhoto read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrame
  // Used Types:  Object
  }
  // Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs
  [WinRTClassNameAttribute(SCapture_OptionalReferencePhotoCapturedEventArgs)]
  Capture_IOptionalReferencePhotoCapturedEventArgs = interface(IInspectable)
  ['{470F88B3-1E6D-4051-9C8B-F1D85AF047B7}']
    function get_Frame: Capture_ICapturedFrame; safecall;
    function get_Context: IInspectable; safecall;
    property Context: IInspectable read get_Context;
    property Frame: Capture_ICapturedFrame read get_Frame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs_Delegate_Base = interface(IUnknown)
  ['{843E69BA-5702-5D97-AB81-EF078DE3F9B1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IAdvancedPhotoCapture
  // Used Types:  Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs>
  TypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs = interface(TypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs_Delegate_Base)
  ['{508EE272-5577-54A4-9637-32F71737C85B}']
    procedure Invoke(sender: Capture_IAdvancedPhotoCapture; args: Capture_IOptionalReferencePhotoCapturedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Object>
  TypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable_Delegate_Base = interface(IUnknown)
  ['{5CB4A98F-ABF1-5518-9094-26DB326A5F4E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IAdvancedPhotoCapture
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Object>
  TypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable = interface(TypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable_Delegate_Base)
  ['{FCFAABE9-43D4-5DED-AB4B-C88DE63997B1}']
    procedure Invoke(sender: Capture_IAdvancedPhotoCapture; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedCapturedPhoto>
  // Used Types:  Object
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IAdvancedPhotoCapture,Object>
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Capture.IAdvancedPhotoCapture
  [WinRTClassNameAttribute(SCapture_AdvancedPhotoCapture)]
  Capture_IAdvancedPhotoCapture = interface(IInspectable)
  ['{83FFAAFA-6667-44DC-973C-A6BCE596AA0F}']
    function CaptureAsync: IAsyncOperation_1__Capture_IAdvancedCapturedPhoto; overload; safecall;
    function CaptureAsync(context: IInspectable): IAsyncOperation_1__Capture_IAdvancedCapturedPhoto; overload; safecall;
    function add_OptionalReferencePhotoCaptured(handler: TypedEventHandler_2__Capture_IAdvancedPhotoCapture__Capture_IOptionalReferencePhotoCapturedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OptionalReferencePhotoCaptured(token: EventRegistrationToken); safecall;
    function add_AllPhotosCaptured(handler: TypedEventHandler_2__Capture_IAdvancedPhotoCapture__IInspectable): EventRegistrationToken; safecall;
    procedure remove_AllPhotosCaptured(token: EventRegistrationToken); safecall;
    function FinishAsync: IAsyncAction; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture_Delegate_Base = interface(IUnknown)
  ['{D1DFAEC8-EED3-5CE3-9832-18344C98FA71}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture = interface(AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture_Delegate_Base)
  ['{F271BDDB-6CED-51B3-9426-913F2FB80912}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_IAdvancedPhotoCapture; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  IAsyncOperation_1__Capture_IAdvancedPhotoCapture_Base = interface(IInspectable)
  ['{8EB156D9-2CE4-5ECD-81F4-A08731FB74CF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  // Used Types:  Windows.Media.Capture.IAdvancedPhotoCapture
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  IAsyncOperation_1__Capture_IAdvancedPhotoCapture = interface(IAsyncOperation_1__Capture_IAdvancedPhotoCapture_Base)
  ['{530C0B1C-200C-5649-A9FB-16D4E6C39199}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture; safecall;
    function GetResults: Capture_IAdvancedPhotoCapture; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_IAdvancedPhotoCapture read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.IMediaExtension>
  // Used Types:  Windows.Media.Effects.IAudioEffectDefinition
  // Used Types:  Windows.Media.Effects.IVideoEffectDefinition
  // Used Types:  Windows.Media.Capture.MediaStreamType
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.Devices.MediaCapturePauseBehavior
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Object>
  // Used Types:  Windows.Media.Devices.CameraStreamState
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.IVideoFrame>
  // Used Types:  Windows.Media.IVideoFrame
  // Used Types:  Windows.Media.Capture.MediaCaptureThermalStatus
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IAdvancedPhotoCapture>
  // Used Types:  Windows.Media.MediaProperties.IImageEncodingProperties
  }
  // Windows.Media.Capture.IMediaCapture4
  Capture_IMediaCapture4 = interface(IInspectable)
  ['{BACD6FD6-FB08-4947-AEA2-CE14EFF0CE13}']
    function AddAudioEffectAsync(definition: Effects_IAudioEffectDefinition): IAsyncOperation_1__IMediaExtension; safecall;
    function AddVideoEffectAsync(definition: Effects_IVideoEffectDefinition; mediaStreamType: Capture_MediaStreamType): IAsyncOperation_1__IMediaExtension; safecall;
    function PauseRecordAsync(behavior: MediaCapturePauseBehavior): IAsyncAction; safecall;
    function ResumeRecordAsync: IAsyncAction; safecall;
    function add_CameraStreamStateChanged(handler: TypedEventHandler_2__Capture_IMediaCapture__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CameraStreamStateChanged(token: EventRegistrationToken); safecall;
    function get_CameraStreamState: CameraStreamState; safecall;
    function GetPreviewFrameAsync: IAsyncOperation_1__IVideoFrame; overload; safecall;
    function GetPreviewFrameAsync(destination: IVideoFrame): IAsyncOperation_1__IVideoFrame; overload; safecall;
    function add_ThermalStatusChanged(handler: TypedEventHandler_2__Capture_IMediaCapture__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ThermalStatusChanged(token: EventRegistrationToken); safecall;
    function get_ThermalStatus: Capture_MediaCaptureThermalStatus; safecall;
    function PrepareAdvancedPhotoCaptureAsync(encodingProperties: IImageEncodingProperties): IAsyncOperation_1__Capture_IAdvancedPhotoCapture; safecall;
    property CameraStreamState: CameraStreamState read get_CameraStreamState;
    property ThermalStatus: Capture_MediaCaptureThermalStatus read get_ThermalStatus;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IVideoFrame
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Capture.IMediaCapturePauseResult
  [WinRTClassNameAttribute(SCapture_MediaCapturePauseResult)]
  Capture_IMediaCapturePauseResult = interface(IInspectable)
  ['{AEC47CA3-4477-4B04-A06F-2C1C5182FE9D}']
    function get_LastFrame: IVideoFrame; safecall;
    function get_RecordDuration: TimeSpan; safecall;
    property LastFrame: IVideoFrame read get_LastFrame;
    property RecordDuration: TimeSpan read get_RecordDuration;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCapturePauseResult>
  AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult_Delegate_Base = interface(IUnknown)
  ['{FE726311-26BF-51CD-BDEB-F40F8F469D0A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCapturePauseResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCapturePauseResult>
  AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult = interface(AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult_Delegate_Base)
  ['{305994BB-0B10-552F-A655-72C2CF2A9DA5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_IMediaCapturePauseResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCapturePauseResult>
  IAsyncOperation_1__Capture_IMediaCapturePauseResult_Base = interface(IInspectable)
  ['{202A2618-5478-5EBA-9BD3-9D83F462747E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCapturePauseResult>
  // Used Types:  Windows.Media.Capture.IMediaCapturePauseResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCapturePauseResult>
  IAsyncOperation_1__Capture_IMediaCapturePauseResult = interface(IAsyncOperation_1__Capture_IMediaCapturePauseResult_Base)
  ['{38756DD0-20B5-5686-9FB6-605675A119C3}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult; safecall;
    function GetResults: Capture_IMediaCapturePauseResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_IMediaCapturePauseResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IVideoFrame
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Capture.IMediaCaptureStopResult
  [WinRTClassNameAttribute(SCapture_MediaCaptureStopResult)]
  Capture_IMediaCaptureStopResult = interface(IInspectable)
  ['{F9DB6A2A-A092-4AD1-97D4-F201F9D082DB}']
    function get_LastFrame: IVideoFrame; safecall;
    function get_RecordDuration: TimeSpan; safecall;
    property LastFrame: IVideoFrame read get_LastFrame;
    property RecordDuration: TimeSpan read get_RecordDuration;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCaptureStopResult>
  AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult_Delegate_Base = interface(IUnknown)
  ['{5D4E0674-1DF4-5326-BA78-72F6655D2A76}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCaptureStopResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCaptureStopResult>
  AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult = interface(AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult_Delegate_Base)
  ['{7E4C4CFC-460B-5390-9DCF-E1711F038CD5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_IMediaCaptureStopResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCaptureStopResult>
  IAsyncOperation_1__Capture_IMediaCaptureStopResult_Base = interface(IInspectable)
  ['{EB798827-A4A9-533A-9E83-0FB085B2AD36}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.IMediaCaptureStopResult>
  // Used Types:  Windows.Media.Capture.IMediaCaptureStopResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCaptureStopResult>
  IAsyncOperation_1__Capture_IMediaCaptureStopResult = interface(IAsyncOperation_1__Capture_IMediaCaptureStopResult_Base)
  ['{724E6290-7C04-59A0-8752-30EE7EC5E6D2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult; safecall;
    function GetResults: Capture_IMediaCaptureStopResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_IMediaCaptureStopResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameSourceGetPropertyStatus
  // Used Types:  Object
  }
  // Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameSourceGetPropertyResult)]
  Capture_Frames_IMediaFrameSourceGetPropertyResult = interface(IInspectable)
  ['{088616C2-3A64-4BD5-BD2B-E7C898D2F37A}']
    function get_Status: Capture_Frames_MediaFrameSourceGetPropertyStatus; safecall;
    function get_Value: IInspectable; safecall;
    property Status: Capture_Frames_MediaFrameSourceGetPropertyStatus read get_Status;
    property Value: IInspectable read get_Value;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult_Delegate_Base = interface(IUnknown)
  ['{D0577F0D-CE46-5C47-8F7C-4AE5626CC76D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult = interface(AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult_Delegate_Base)
  ['{439F8C7B-AEC2-5ADE-940C-F6789FF3EFDD}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult_Base = interface(IInspectable)
  ['{80003979-4986-52A7-B227-AE6BE4D2B5CD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult = interface(IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult_Base)
  ['{BCB1D30D-0981-5245-80AA-F9168C7B00DB}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult; safecall;
    function GetResults: Capture_Frames_IMediaFrameSourceGetPropertyResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGetPropertyResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus_Delegate_Base = interface(IUnknown)
  ['{F613663A-C685-5DC0-B133-60D94303A6E3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus = interface(AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus_Base = interface(IInspectable)
  ['{A1507C16-5F84-586E-8CA9-224F37E0E0DE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus = interface(IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus; safecall;
    function GetResults: Capture_Frames_MediaFrameSourceSetPropertyStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameSourceSetPropertyStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  // Used Types:  Object
  // Used Types:  Windows.Media.Devices.IVideoDeviceController
  }
  // Windows.Media.Capture.Frames.IMediaFrameSourceController
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameSourceController)]
  Capture_Frames_IMediaFrameSourceController = interface(IInspectable)
  ['{6D076635-316D-4B8F-B7B6-EEB04A8C6525}']
    function GetPropertyAsync(propertyId: HSTRING): IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult; safecall;
    function SetPropertyAsync(propertyId: HSTRING; propertyValue: IInspectable): IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus; safecall;
    function get_VideoDeviceController: IVideoDeviceController; safecall;
    property VideoDeviceController: IVideoDeviceController read get_VideoDeviceController;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IVideoMediaFrameFormat
  // Used Types:  Double
  }
  // Windows.Media.Capture.Frames.IDepthMediaFrameFormat
  [WinRTClassNameAttribute(SCapture_Frames_DepthMediaFrameFormat)]
  Capture_Frames_IDepthMediaFrameFormat = interface(IInspectable)
  ['{C312CF40-D729-453E-8780-2E04F140D28E}']
    function get_VideoFormat: Capture_Frames_IVideoMediaFrameFormat; safecall;
    function get_DepthScaleInMeters: Double; safecall;
    property DepthScaleInMeters: Double read get_DepthScaleInMeters;
    property VideoFormat: Capture_Frames_IVideoMediaFrameFormat read get_VideoFormat;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameFormat
  // Used Types:  Windows.Media.Capture.Frames.IDepthMediaFrameFormat
  // Used Types:  UInt32
  }
  // Windows.Media.Capture.Frames.IVideoMediaFrameFormat
  [WinRTClassNameAttribute(SCapture_Frames_VideoMediaFrameFormat)]
  Capture_Frames_IVideoMediaFrameFormat = interface(IInspectable)
  ['{46027FC0-D71B-45C7-8F14-6D9A0AE604E4}']
    function get_MediaFrameFormat: Capture_Frames_IMediaFrameFormat; safecall;
    function get_DepthFormat: Capture_Frames_IDepthMediaFrameFormat; safecall;
    function get_Width: Cardinal; safecall;
    function get_Height: Cardinal; safecall;
    property DepthFormat: Capture_Frames_IDepthMediaFrameFormat read get_DepthFormat;
    property Height: Cardinal read get_Height;
    property MediaFrameFormat: Capture_Frames_IMediaFrameFormat read get_MediaFrameFormat;
    property Width: Cardinal read get_Width;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.MediaProperties.IMediaRatio
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  // Used Types:  Windows.Media.Capture.Frames.IVideoMediaFrameFormat
  }
  // Windows.Media.Capture.Frames.IMediaFrameFormat
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameFormat)]
  Capture_Frames_IMediaFrameFormat = interface(IInspectable)
  ['{71902B4E-B279-4A97-A9DB-BD5A2FB78F39}']
    function get_MajorType: HSTRING; safecall;
    function get_Subtype: HSTRING; safecall;
    function get_FrameRate: IMediaRatio; safecall;
    function get_Properties: IMapView_2__TGuid__IInspectable; safecall;
    function get_VideoFormat: Capture_Frames_IVideoMediaFrameFormat; safecall;
    property FrameRate: IMediaRatio read get_FrameRate;
    property MajorType: HSTRING read get_MajorType;
    property Properties: IMapView_2__TGuid__IInspectable read get_Properties;
    property Subtype: HSTRING read get_Subtype;
    property VideoFormat: Capture_Frames_IVideoMediaFrameFormat read get_VideoFormat;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IIterator_1__Capture_Frames_IMediaFrameFormat_Base = interface(IInspectable)
  ['{83A0CFAA-6546-5A63-8CD7-F62152A75D27}']
  end;
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameFormat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IIterator_1__Capture_Frames_IMediaFrameFormat = interface(IIterator_1__Capture_Frames_IMediaFrameFormat_Base)
  ['{D8753279-10B2-5F44-8FDE-8322B6582439}']
    function get_Current: Capture_Frames_IMediaFrameFormat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameFormat): Cardinal; safecall;
    property Current: Capture_Frames_IMediaFrameFormat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IIterable_1__Capture_Frames_IMediaFrameFormat_Base = interface(IInspectable)
  ['{1F029A27-1123-538A-9261-8A380E12BAC6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IIterable_1__Capture_Frames_IMediaFrameFormat = interface(IIterable_1__Capture_Frames_IMediaFrameFormat_Base)
  ['{E35610D0-2B5F-55A8-AA66-7471FF1D3EFE}']
    function First: IIterator_1__Capture_Frames_IMediaFrameFormat; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameFormat
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  IVectorView_1__Capture_Frames_IMediaFrameFormat = interface(IInspectable)
  ['{84B24BB7-7B19-50C6-9811-31D04EB9D7C7}']
    function GetAt(index: Cardinal): Capture_Frames_IMediaFrameFormat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Capture_Frames_IMediaFrameFormat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameFormat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameSource,Object>
  TypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable_Delegate_Base = interface(IUnknown)
  ['{C7E61AA7-4716-5514-A913-EF1796B98DBD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSource
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameSource,Object>
  TypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable = interface(TypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable_Delegate_Base)
  ['{14090061-BEB7-5D84-A87E-0F3B543312FF}']
    procedure Invoke(sender: Capture_Frames_IMediaFrameSource; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceInfo
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceController
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameFormat>
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameFormat
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameSource,Object>
  // Used Types:  Windows.Media.Devices.Core.ICameraIntrinsics
  }
  // Windows.Media.Capture.Frames.IMediaFrameSource
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameSource)]
  Capture_Frames_IMediaFrameSource = interface(IInspectable)
  ['{D6782953-90DB-46A8-8ADD-2AA884A8D253}']
    function get_Info: Capture_Frames_IMediaFrameSourceInfo; safecall;
    function get_Controller: Capture_Frames_IMediaFrameSourceController; safecall;
    function get_SupportedFormats: IVectorView_1__Capture_Frames_IMediaFrameFormat; safecall;
    function get_CurrentFormat: Capture_Frames_IMediaFrameFormat; safecall;
    function SetFormatAsync(format: Capture_Frames_IMediaFrameFormat): IAsyncAction; safecall;
    function add_FormatChanged(handler: TypedEventHandler_2__Capture_Frames_IMediaFrameSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_FormatChanged(token: EventRegistrationToken); safecall;
    function TryGetCameraIntrinsics(format: Capture_Frames_IMediaFrameFormat): Core_ICameraIntrinsics; safecall;
    property Controller: Capture_Frames_IMediaFrameSourceController read get_Controller;
    property CurrentFormat: Capture_Frames_IMediaFrameFormat read get_CurrentFormat;
    property Info: Capture_Frames_IMediaFrameSourceInfo read get_Info;
    property SupportedFormats: IVectorView_1__Capture_Frames_IMediaFrameFormat read get_SupportedFormats;
  end;

  {
  // Used Types:  String
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSource
  }
  // Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = interface(IInspectable)
  ['{B9163BFE-8819-5163-A5C7-733E35FB10D2}']
    function get_Key: HSTRING; safecall;
    function get_Value: Capture_Frames_IMediaFrameSource; safecall;
    property Key: HSTRING read get_Key;
    property Value: Capture_Frames_IMediaFrameSource read get_Value;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  IIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource_Base = interface(IInspectable)
  ['{D8EC36B7-64EB-5675-AD81-62233E483E17}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  IIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = interface(IIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource_Base)
  ['{DC1CD366-7F48-5D43-845D-374A797DBE32}']
    function get_Current: IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  IIterable_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource_Base = interface(IInspectable)
  ['{A038E80F-0B3D-5CD4-849D-13036E1F506E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>>
  IIterable_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource = interface(IIterable_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource_Base)
  ['{2B62A472-F699-5F96-A899-5114B2D335D7}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__Capture_Frames_IMediaFrameSource; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource_Base = interface(IInspectable)
  ['{534EA61F-8BE7-5E93-B01B-AE1F9DD242A4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSource
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource = interface(IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource_Base)
  ['{99C0FE78-5498-5936-BE18-3B6F382F96B1}']
    function Lookup(key: HSTRING): Capture_Frames_IMediaFrameSource; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource; out second: IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameArrivedEventArgs)]
  Capture_Frames_IMediaFrameArrivedEventArgs = interface(IInspectable)
  ['{0B430ADD-A490-4435-ADA1-9AFFD55239F7}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameReader,Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs>
  TypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D3DD49CB-8D25-591A-80F7-8363D5C03EC9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReader
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameReader,Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs>
  TypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs = interface(TypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs_Delegate_Base)
  ['{BE2680C7-AD22-5A03-ACCB-35AAC671F976}']
    procedure Invoke(sender: Capture_Frames_IMediaFrameReader; args: Capture_Frames_IMediaFrameArrivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReference
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Media.Capture.Frames.IBufferMediaFrame
  [WinRTClassNameAttribute(SCapture_Frames_BufferMediaFrame)]
  Capture_Frames_IBufferMediaFrame = interface(IInspectable)
  ['{B5B153C7-9B84-4062-B79C-A365B2596854}']
    function get_FrameReference: Capture_Frames_IMediaFrameReference; safecall;
    function get_Buffer: IBuffer; safecall;
    property Buffer: IBuffer read get_Buffer;
    property FrameReference: Capture_Frames_IMediaFrameReference read get_FrameReference;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReference
  // Used Types:  Windows.Media.Capture.Frames.IVideoMediaFrame
  // Used Types:  Boolean
  }
  // Windows.Media.Capture.Frames.IInfraredMediaFrame
  [WinRTClassNameAttribute(SCapture_Frames_InfraredMediaFrame)]
  Capture_Frames_IInfraredMediaFrame = interface(IInspectable)
  ['{3FD13503-004B-4F0E-91AC-465299B41658}']
    function get_FrameReference: Capture_Frames_IMediaFrameReference; safecall;
    function get_VideoMediaFrame: Capture_Frames_IVideoMediaFrame; safecall;
    function get_IsIlluminated: Boolean; safecall;
    property FrameReference: Capture_Frames_IMediaFrameReference read get_FrameReference;
    property IsIlluminated: Boolean read get_IsIlluminated;
    property VideoMediaFrame: Capture_Frames_IVideoMediaFrame read get_VideoMediaFrame;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReference
  // Used Types:  Windows.Media.Capture.Frames.IVideoMediaFrame
  // Used Types:  Windows.Media.Capture.Frames.IDepthMediaFrameFormat
  // Used Types:  Windows.Media.Devices.Core.IDepthCorrelatedCoordinateMapper
  // Used Types:  Windows.Media.Devices.Core.ICameraIntrinsics
  // Used Types:  Windows.Perception.Spatial.ISpatialCoordinateSystem
  }
  // Windows.Media.Capture.Frames.IDepthMediaFrame
  [WinRTClassNameAttribute(SCapture_Frames_DepthMediaFrame)]
  Capture_Frames_IDepthMediaFrame = interface(IInspectable)
  ['{47135E4F-8549-45C0-925B-80D35EFDB10A}']
    function get_FrameReference: Capture_Frames_IMediaFrameReference; safecall;
    function get_VideoMediaFrame: Capture_Frames_IVideoMediaFrame; safecall;
    function get_DepthFormat: Capture_Frames_IDepthMediaFrameFormat; safecall;
    function TryCreateCoordinateMapper(cameraIntrinsics: Core_ICameraIntrinsics; coordinateSystem: Spatial_ISpatialCoordinateSystem): Core_IDepthCorrelatedCoordinateMapper; safecall;
    property DepthFormat: Capture_Frames_IDepthMediaFrameFormat read get_DepthFormat;
    property FrameReference: Capture_Frames_IMediaFrameReference read get_FrameReference;
    property VideoMediaFrame: Capture_Frames_IVideoMediaFrame read get_VideoMediaFrame;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReference
  // Used Types:  Windows.Media.Capture.Frames.IVideoMediaFrameFormat
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  // Used Types:  Windows.Media.Devices.Core.ICameraIntrinsics
  // Used Types:  Windows.Media.Capture.Frames.IInfraredMediaFrame
  // Used Types:  Windows.Media.Capture.Frames.IDepthMediaFrame
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Media.Capture.Frames.IVideoMediaFrame
  [WinRTClassNameAttribute(SCapture_Frames_VideoMediaFrame)]
  Capture_Frames_IVideoMediaFrame = interface(IInspectable)
  ['{00DD4CCB-32BD-4FE1-A013-7CC13CF5DBCF}']
    function get_FrameReference: Capture_Frames_IMediaFrameReference; safecall;
    function get_VideoFormat: Capture_Frames_IVideoMediaFrameFormat; safecall;
    function get_SoftwareBitmap: Imaging_ISoftwareBitmap; safecall;
    function get_Direct3DSurface: DirectX_Direct3D11_IDirect3DSurface; safecall;
    function get_CameraIntrinsics: Core_ICameraIntrinsics; safecall;
    function get_InfraredMediaFrame: Capture_Frames_IInfraredMediaFrame; safecall;
    function get_DepthMediaFrame: Capture_Frames_IDepthMediaFrame; safecall;
    function GetVideoFrame: IVideoFrame; safecall;
    property CameraIntrinsics: Core_ICameraIntrinsics read get_CameraIntrinsics;
    property DepthMediaFrame: Capture_Frames_IDepthMediaFrame read get_DepthMediaFrame;
    property Direct3DSurface: DirectX_Direct3D11_IDirect3DSurface read get_Direct3DSurface;
    property FrameReference: Capture_Frames_IMediaFrameReference read get_FrameReference;
    property InfraredMediaFrame: Capture_Frames_IInfraredMediaFrame read get_InfraredMediaFrame;
    property SoftwareBitmap: Imaging_ISoftwareBitmap read get_SoftwareBitmap;
    property VideoFormat: Capture_Frames_IVideoMediaFrameFormat read get_VideoFormat;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameSourceKind
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameFormat
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Collections.IMapView`2<Guid,Object>
  // Used Types:  Windows.Media.Capture.Frames.IBufferMediaFrame
  // Used Types:  Windows.Media.Capture.Frames.IVideoMediaFrame
  // Used Types:  Windows.Perception.Spatial.ISpatialCoordinateSystem
  }
  // Windows.Media.Capture.Frames.IMediaFrameReference
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameReference)]
  Capture_Frames_IMediaFrameReference = interface(IInspectable)
  ['{F6B88641-F0DC-4044-8DC9-961CEDD05BAD}']
    function get_SourceKind: Capture_Frames_MediaFrameSourceKind; safecall;
    function get_Format: Capture_Frames_IMediaFrameFormat; safecall;
    function get_SystemRelativeTime: IReference_1__TimeSpan; safecall;
    function get_Duration: TimeSpan; safecall;
    function get_Properties: IMapView_2__TGuid__IInspectable; safecall;
    function get_BufferMediaFrame: Capture_Frames_IBufferMediaFrame; safecall;
    function get_VideoMediaFrame: Capture_Frames_IVideoMediaFrame; safecall;
    function get_CoordinateSystem: Spatial_ISpatialCoordinateSystem; safecall;
    property BufferMediaFrame: Capture_Frames_IBufferMediaFrame read get_BufferMediaFrame;
    property CoordinateSystem: Spatial_ISpatialCoordinateSystem read get_CoordinateSystem;
    property Duration: TimeSpan read get_Duration;
    property Format: Capture_Frames_IMediaFrameFormat read get_Format;
    property Properties: IMapView_2__TGuid__IInspectable read get_Properties;
    property SourceKind: Capture_Frames_MediaFrameSourceKind read get_SourceKind;
    property SystemRelativeTime: IReference_1__TimeSpan read get_SystemRelativeTime;
    property VideoMediaFrame: Capture_Frames_IVideoMediaFrame read get_VideoMediaFrame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus_Delegate_Base = interface(IUnknown)
  ['{9F49B2E5-2F68-5C58-8D8B-12176FF6EA50}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus = interface(AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus_Base = interface(IInspectable)
  ['{DB8E251A-ADC6-5753-8784-C44B4D7C5B07}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameReaderStartStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus = interface(IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus; safecall;
    function GetResults: Capture_Frames_MediaFrameReaderStartStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_MediaFrameReaderStartStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMediaFrameReader,Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs>
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReference
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameReaderStartStatus>
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Capture.Frames.IMediaFrameReader
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameReader)]
  Capture_Frames_IMediaFrameReader = interface(IInspectable)
  ['{E4C94395-2028-48ED-90B0-D1C1B162E24C}']
    function add_FrameArrived(handler: TypedEventHandler_2__Capture_Frames_IMediaFrameReader__Capture_Frames_IMediaFrameArrivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FrameArrived(token: EventRegistrationToken); safecall;
    function TryAcquireLatestFrame: Capture_Frames_IMediaFrameReference; safecall;
    function StartAsync: IAsyncOperation_1__Capture_Frames_MediaFrameReaderStartStatus; safecall;
    function StopAsync: IAsyncAction; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader_Delegate_Base = interface(IUnknown)
  ['{A6214DAD-B917-5C89-A068-E32C9A7037D3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader = interface(AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader_Delegate_Base)
  ['{267D564F-2DDE-540D-BD4E-54F5E90BC946}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_IMediaFrameReader; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  IAsyncOperation_1__Capture_Frames_IMediaFrameReader_Base = interface(IInspectable)
  ['{A10CB14D-7935-5C87-9026-8ABE792A3BE5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReader
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  IAsyncOperation_1__Capture_Frames_IMediaFrameReader = interface(IAsyncOperation_1__Capture_Frames_IMediaFrameReader_Base)
  ['{30662F08-35E8-505B-9667-51911B8848F1}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader; safecall;
    function GetResults: Capture_Frames_IMediaFrameReader; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameReader read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.IMediaExtension
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCapturePauseResult>
  // Used Types:  Windows.Media.Devices.MediaCapturePauseBehavior
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCaptureStopResult>
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Media.Capture.Frames.IMediaFrameSource>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameReader>
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSource
  // Used Types:  String
  // Used Types:  Windows.Graphics.Imaging.BitmapSize
  }
  // Windows.Media.Capture.IMediaCapture5
  Capture_IMediaCapture5 = interface(IInspectable)
  ['{DA787C22-3A9B-4720-A71E-97900A316E5A}']
    function RemoveEffectAsync(effect: IMediaExtension): IAsyncAction; safecall;
    function PauseRecordWithResultAsync(behavior: MediaCapturePauseBehavior): IAsyncOperation_1__Capture_IMediaCapturePauseResult; safecall;
    function StopRecordWithResultAsync: IAsyncOperation_1__Capture_IMediaCaptureStopResult; safecall;
    function get_FrameSources: IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource; safecall;
    function CreateFrameReaderAsync(inputSource: Capture_Frames_IMediaFrameSource): IAsyncOperation_1__Capture_Frames_IMediaFrameReader; overload; safecall;
    function CreateFrameReaderAsync(inputSource: Capture_Frames_IMediaFrameSource; outputSubtype: HSTRING): IAsyncOperation_1__Capture_Frames_IMediaFrameReader; overload; safecall;
    function CreateFrameReaderAsync(inputSource: Capture_Frames_IMediaFrameSource; outputSubtype: HSTRING; outputSize: Imaging_BitmapSize): IAsyncOperation_1__Capture_Frames_IMediaFrameReader; overload; safecall;
    property FrameSources: IMapView_2__HSTRING__Capture_Frames_IMediaFrameSource read get_FrameSources;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Capture.MediaCaptureDeviceExclusiveControlStatus
  }
  // Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs
  [WinRTClassNameAttribute(SCapture_MediaCaptureDeviceExclusiveControlStatusChangedEventArgs)]
  Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs = interface(IInspectable)
  ['{9D2F920D-A588-43C6-89D6-5AD322AF006A}']
    function get_DeviceId: HSTRING; safecall;
    function get_Status: Capture_MediaCaptureDeviceExclusiveControlStatus; safecall;
    property DeviceId: HSTRING read get_DeviceId;
    property Status: Capture_MediaCaptureDeviceExclusiveControlStatus read get_Status;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{5C91F8BA-B379-53FF-A288-24E7883BF592}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.IMediaCapture
  // Used Types:  Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs>
  TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs = interface(TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs_Delegate_Base)
  ['{E80221EC-FF94-5E23-A99D-5B76A426EB08}']
    procedure Invoke(sender: Capture_IMediaCapture; args: Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs
  [WinRTClassNameAttribute(SCapture_Frames_MultiSourceMediaFrameArrivedEventArgs)]
  Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs = interface(IInspectable)
  ['{63115E01-CF51-48FD-AAB0-6D693EB48127}']
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader,Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs>
  TypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs_Delegate_Base = interface(IUnknown)
  ['{82B1AD4D-9887-56F4-9A9E-3AB18B02198C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
  // Used Types:  Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader,Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs>
  TypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs = interface(TypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs_Delegate_Base)
  ['{7005CAB7-BBA9-543B-AAD6-20B86DA753C8}']
    procedure Invoke(sender: Capture_Frames_IMultiSourceMediaFrameReader; args: Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameReference
  // Used Types:  String
  }
  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameReference
  [WinRTClassNameAttribute(SCapture_Frames_MultiSourceMediaFrameReference)]
  Capture_Frames_IMultiSourceMediaFrameReference = interface(IInspectable)
  ['{21964B1A-7FE2-44D6-92E5-298E6D2810E9}']
    function TryGetFrameReferenceBySourceId(sourceId: HSTRING): Capture_Frames_IMediaFrameReference; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus_Delegate_Base = interface(IUnknown)
  ['{18EEF24A-3332-5FEE-A0F0-72CEED330645}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus = interface(AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus_Base = interface(IInspectable)
  ['{A242B952-76AA-54E5-A13B-A8707C1098E1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  // Used Types:  Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus = interface(IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus; safecall;
    function GetResults: Capture_Frames_MultiSourceMediaFrameReaderStartStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader,Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs>
  // Used Types:  Windows.Media.Capture.Frames.IMultiSourceMediaFrameReference
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MultiSourceMediaFrameReaderStartStatus>
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
  [WinRTClassNameAttribute(SCapture_Frames_MultiSourceMediaFrameReader)]
  Capture_Frames_IMultiSourceMediaFrameReader = interface(IInspectable)
  ['{8D144402-F763-488D-98F2-B437BCF075E7}']
    function add_FrameArrived(handler: TypedEventHandler_2__Capture_Frames_IMultiSourceMediaFrameReader__Capture_Frames_IMultiSourceMediaFrameArrivedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FrameArrived(token: EventRegistrationToken); safecall;
    function TryAcquireLatestFrame: Capture_Frames_IMultiSourceMediaFrameReference; safecall;
    function StartAsync: IAsyncOperation_1__Capture_Frames_MultiSourceMediaFrameReaderStartStatus; safecall;
    function StopAsync: IAsyncAction; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader_Delegate_Base = interface(IUnknown)
  ['{69993778-A48C-50CC-A6F0-5368F58A297A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader = interface(AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader_Delegate_Base)
  ['{F13D7B11-AC4D-5DF5-81BE-EC20384703EE}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader_Base = interface(IInspectable)
  ['{53D56BE8-F110-5226-9CE1-A8C26A572576}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  // Used Types:  Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader = interface(IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader_Base)
  ['{A731E5C0-B966-5162-A185-3081E8E1F1D8}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader; safecall;
    function GetResults: Capture_Frames_IMultiSourceMediaFrameReader; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMultiSourceMediaFrameReader read get_Completed write put_Completed;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  IIterator_1__Capture_Frames_IMediaFrameSource_Base = interface(IInspectable)
  ['{D05E53CD-BBEC-5FB7-8E4E-DE86115B5E88}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  IIterator_1__Capture_Frames_IMediaFrameSource = interface(IIterator_1__Capture_Frames_IMediaFrameSource_Base)
  ['{10F4D635-CC89-501C-B9E4-B198EB88EA1C}']
    function get_Current: Capture_Frames_IMediaFrameSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameSource): Cardinal; safecall;
    property Current: Capture_Frames_IMediaFrameSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  IIterable_1__Capture_Frames_IMediaFrameSource_Base = interface(IInspectable)
  ['{0D447BE3-8C91-581D-8071-17984B8B5994}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  IIterable_1__Capture_Frames_IMediaFrameSource = interface(IIterable_1__Capture_Frames_IMediaFrameSource_Base)
  ['{8B822F20-C0FE-5686-8BBD-491A272E8006}']
    function First: IIterator_1__Capture_Frames_IMediaFrameSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Capture.IMediaCapture,Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSource>
  }
  // Windows.Media.Capture.IMediaCapture6
  Capture_IMediaCapture6 = interface(IInspectable)
  ['{228948BD-4B20-4BB1-9FD6-A583212A1012}']
    function add_CaptureDeviceExclusiveControlStatusChanged(handler: TypedEventHandler_2__Capture_IMediaCapture__Capture_IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CaptureDeviceExclusiveControlStatusChanged(token: EventRegistrationToken); safecall;
    function CreateMultiSourceFrameReaderAsync(inputSources: IIterable_1__Capture_Frames_IMediaFrameSource): IAsyncOperation_1__Capture_Frames_IMultiSourceMediaFrameReader; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.Rect>
  }
  // Windows.Media.Capture.IAdvancedCapturedPhoto2
  Capture_IAdvancedCapturedPhoto2 = interface(IInspectable)
  ['{18CF6CD8-CFFE-42D8-8104-017BB318F4A1}']
    function get_FrameBoundsRelativeToReferencePhoto: IReference_1__Rect; safecall;
    property FrameBoundsRelativeToReferencePhoto: IReference_1__Rect read get_FrameBoundsRelativeToReferencePhoto;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.Devices.MediaCapturePauseBehavior
  }
  // Windows.Media.Capture.ILowLagMediaRecording2
  Capture_ILowLagMediaRecording2 = interface(IInspectable)
  ['{6369C758-5644-41E2-97AF-8EF56A25E225}']
    function PauseAsync(behavior: MediaCapturePauseBehavior): IAsyncAction; safecall;
    function ResumeAsync: IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCapturePauseResult>
  // Used Types:  Windows.Media.Devices.MediaCapturePauseBehavior
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.IMediaCaptureStopResult>
  }
  // Windows.Media.Capture.ILowLagMediaRecording3
  Capture_ILowLagMediaRecording3 = interface(IInspectable)
  ['{5C33AB12-48F7-47DA-B41E-90880A5FE0EC}']
    function PauseWithResultAsync(behavior: MediaCapturePauseBehavior): IAsyncOperation_1__Capture_IMediaCapturePauseResult; safecall;
    function StopWithResultAsync: IAsyncOperation_1__Capture_IMediaCaptureStopResult; safecall;
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

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.WhiteBalanceGain
  }
  // Windows.Foundation.IReference`1<Windows.Media.Capture.WhiteBalanceGain>
  IReference_1__Capture_WhiteBalanceGain = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Capture_WhiteBalanceGain; safecall;
    property Value: Capture_WhiteBalanceGain read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Media.Devices.MediaCaptureFocusState>
  // Used Types:  Windows.Foundation.IReference`1<Double>
  // Used Types:  Windows.Media.MediaProperties.IMediaRatio
  // Used Types:  Windows.Foundation.IReference`1<Windows.Media.Capture.WhiteBalanceGain>
  }
  // Windows.Media.Capture.ICapturedFrameControlValues2
  Capture_ICapturedFrameControlValues2 = interface(IInspectable)
  ['{500B2B88-06D2-4AA7-A7DB-D37AF73321D8}']
    function get_FocusState: IReference_1__MediaCaptureFocusState; safecall;
    function get_IsoDigitalGain: IReference_1__Double; safecall;
    function get_IsoAnalogGain: IReference_1__Double; safecall;
    function get_SensorFrameRate: IMediaRatio; safecall;
    function get_WhiteBalanceGain: IReference_1__Capture_WhiteBalanceGain; safecall;
    property FocusState: IReference_1__MediaCaptureFocusState read get_FocusState;
    property IsoAnalogGain: IReference_1__Double read get_IsoAnalogGain;
    property IsoDigitalGain: IReference_1__Double read get_IsoDigitalGain;
    property SensorFrameRate: IMediaRatio read get_SensorFrameRate;
    property WhiteBalanceGain: IReference_1__Capture_WhiteBalanceGain read get_WhiteBalanceGain;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  }
  // Windows.Media.Capture.ICapturedFrameWithSoftwareBitmap
  Capture_ICapturedFrameWithSoftwareBitmap = interface(IInspectable)
  ['{B58E8B6E-8503-49B5-9E86-897D26A3FF3D}']
    function get_SoftwareBitmap: Imaging_ISoftwareBitmap; safecall;
    property SoftwareBitmap: Imaging_ISoftwareBitmap read get_SoftwareBitmap;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.IMediaExtension
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Capture.IMediaCaptureVideoPreview
  Capture_IMediaCaptureVideoPreview = interface(IInspectable)
  ['{27727073-549E-447F-A20A-4F03C479D8C0}']
    function StartPreviewAsync: IAsyncAction; safecall;
    function StartPreviewToCustomSinkAsync(encodingProfile: IMediaEncodingProfile; customMediaSink: IMediaExtension): IAsyncAction; overload; safecall;
    function StartPreviewToCustomSinkAsync(encodingProfile: IMediaEncodingProfile; customSinkActivationId: HSTRING; customSinkSettings: IPropertySet): IAsyncAction; overload; safecall;
    function StopPreviewAsync: IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.Media.Capture.MediaCategory
  // Used Types:  Windows.Media.AudioProcessing
  }
  // Windows.Media.Capture.IMediaCaptureSettings2
  Capture_IMediaCaptureSettings2 = interface(IInspectable)
  ['{6F9E7CFB-FA9F-4B13-9CBE-5AB94F1F3493}']
    function get_ConcurrentRecordAndPhotoSupported: Boolean; safecall;
    function get_ConcurrentRecordAndPhotoSequenceSupported: Boolean; safecall;
    function get_CameraSoundRequiredForRegion: Boolean; safecall;
    function get_Horizontal35mmEquivalentFocalLength: IReference_1__Cardinal; safecall;
    function get_PitchOffsetDegrees: IReference_1__Integer; safecall;
    function get_Vertical35mmEquivalentFocalLength: IReference_1__Cardinal; safecall;
    function get_MediaCategory: Capture_MediaCategory; safecall;
    function get_AudioProcessing: AudioProcessing; safecall;
    property AudioProcessing: AudioProcessing read get_AudioProcessing;
    property CameraSoundRequiredForRegion: Boolean read get_CameraSoundRequiredForRegion;
    property ConcurrentRecordAndPhotoSequenceSupported: Boolean read get_ConcurrentRecordAndPhotoSequenceSupported;
    property ConcurrentRecordAndPhotoSupported: Boolean read get_ConcurrentRecordAndPhotoSupported;
    property Horizontal35mmEquivalentFocalLength: IReference_1__Cardinal read get_Horizontal35mmEquivalentFocalLength;
    property MediaCategory: Capture_MediaCategory read get_MediaCategory;
    property PitchOffsetDegrees: IReference_1__Integer read get_PitchOffsetDegrees;
    property Vertical35mmEquivalentFocalLength: IReference_1__Cardinal read get_Vertical35mmEquivalentFocalLength;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  }
  // Windows.Media.Capture.IVideoStreamConfiguration
  [WinRTClassNameAttribute(SCapture_VideoStreamConfiguration)]
  Capture_IVideoStreamConfiguration = interface(IInspectable)
  ['{D8770A6F-4390-4B5E-AD3E-0F8AF0963490}']
    function get_InputProperties: IVideoEncodingProperties; safecall;
    function get_OutputProperties: IVideoEncodingProperties; safecall;
    property InputProperties: IVideoEncodingProperties read get_InputProperties;
    property OutputProperties: IVideoEncodingProperties read get_OutputProperties;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IIterator_1__Capture_Frames_IMediaFrameSourceGroup_Base = interface(IInspectable)
  ['{DC0C1F9A-B748-5CFA-9B42-A3A8FE37281A}']
  end;
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IIterator_1__Capture_Frames_IMediaFrameSourceGroup = interface(IIterator_1__Capture_Frames_IMediaFrameSourceGroup_Base)
  ['{D8A89996-8512-588A-8946-197F46D9887F}']
    function get_Current: Capture_Frames_IMediaFrameSourceGroup; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameSourceGroup): Cardinal; safecall;
    property Current: Capture_Frames_IMediaFrameSourceGroup read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IIterable_1__Capture_Frames_IMediaFrameSourceGroup_Base = interface(IInspectable)
  ['{D0B71DEB-76E8-5833-9623-2B1E1A8E1B72}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IIterable_1__Capture_Frames_IMediaFrameSourceGroup = interface(IIterable_1__Capture_Frames_IMediaFrameSourceGroup_Base)
  ['{CD764A99-2D89-5F9E-905F-9CC96D4EDFF0}']
    function First: IIterator_1__Capture_Frames_IMediaFrameSourceGroup; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = interface(IInspectable)
  ['{7F4E1865-D092-50F3-8459-5D35F3084B46}']
    function GetAt(index: Cardinal): Capture_Frames_IMediaFrameSourceGroup; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Capture_Frames_IMediaFrameSourceGroup; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCapture_Frames_IMediaFrameSourceGroup): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup_Delegate_Base = interface(IUnknown)
  ['{CFF78A64-BD44-5638-AF2F-540C23B322E7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup_Delegate_Base)
  ['{4BEF0D3D-03C7-5761-AA78-C4B33B7430B3}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup_Base = interface(IInspectable)
  ['{A795889F-6D49-5687-AABE-F2FC6237FA1A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup = interface(IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup_Base)
  ['{4979C7CE-1E28-58F9-88DA-C87C9D0A27C1}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup; safecall;
    function GetResults: IVectorView_1__Capture_Frames_IMediaFrameSourceGroup; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup_Delegate_Base = interface(IUnknown)
  ['{ADF10EEB-9FC5-553B-9164-294246992A2A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup = interface(AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup_Delegate_Base)
  ['{54FF4603-1DE6-5CFC-B86E-51BE37294158}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup_Base = interface(IInspectable)
  ['{F3256A87-B1CF-5943-B664-9F19367D2779}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup = interface(IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup_Base)
  ['{3DB30BEF-B16F-565A-A6FD-C893D88F3809}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup; safecall;
    function GetResults: Capture_Frames_IMediaFrameSourceGroup; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Capture_Frames_IMediaFrameSourceGroup read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGroup>
  // Used Types:  String
  }
  // Windows.Media.Capture.Frames.IMediaFrameSourceGroupStatics
  [WinRTClassNameAttribute(SCapture_Frames_MediaFrameSourceGroup)]
  Capture_Frames_IMediaFrameSourceGroupStatics = interface(IInspectable)
  ['{1C48BFC5-436F-4508-94CF-D5D8B7326445}']
    function FindAllAsync: IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup; safecall;
    function FromIdAsync(id: HSTRING): IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup; safecall;
    function GetDeviceSelector: HSTRING; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
  }
  // Windows.Media.Capture.Frames.IMediaFrameReader2
  Capture_Frames_IMediaFrameReader2 = interface(IInspectable)
  ['{871127B3-8531-4050-87CC-A13733CF3E9B}']
    procedure put_AcquisitionMode(value: Capture_Frames_MediaFrameReaderAcquisitionMode); safecall;
    function get_AcquisitionMode: Capture_Frames_MediaFrameReaderAcquisitionMode; safecall;
    property AcquisitionMode: Capture_Frames_MediaFrameReaderAcquisitionMode read get_AcquisitionMode write put_AcquisitionMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.Frames.MediaFrameReaderAcquisitionMode
  }
  // Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader2
  Capture_Frames_IMultiSourceMediaFrameReader2 = interface(IInspectable)
  ['{EF5C8ABD-FC5C-4C6B-9D81-3CB9CC637C26}']
    procedure put_AcquisitionMode(value: Capture_Frames_MediaFrameReaderAcquisitionMode); safecall;
    function get_AcquisitionMode: Capture_Frames_MediaFrameReaderAcquisitionMode; safecall;
    property AcquisitionMode: Capture_Frames_MediaFrameReaderAcquisitionMode read get_AcquisitionMode write put_AcquisitionMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult>
  // Used Types:  UInt8
  // Used Types:  Windows.Foundation.IReference`1
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Capture.Frames.MediaFrameSourceSetPropertyStatus>
  }
  // Windows.Media.Capture.Frames.IMediaFrameSourceController2
  Capture_Frames_IMediaFrameSourceController2 = interface(IInspectable)
  ['{EFC49FD4-FCF2-4A03-B4E4-AC9628739BEE}']
    function GetPropertyByExtendedIdAsync(extendedPropertyIdSize: Cardinal; extendedPropertyId: PByte; maxPropertyValueSize: IReference_1__Cardinal {bittime}): IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGetPropertyResult; safecall;
    function SetPropertyByExtendedIdAsync(extendedPropertyIdSize: Cardinal; extendedPropertyId: PByte; propertyValue: Byte): IAsyncOperation_1__Capture_Frames_MediaFrameSourceSetPropertyStatus; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Media.Capture.Frames.IDepthMediaFrame2
  Capture_Frames_IDepthMediaFrame2 = interface(IInspectable)
  ['{6CCA473D-C4A4-4176-B0CD-33EAE3B35AA3}']
    function get_MaxReliableDepth: Cardinal; safecall;
    function get_MinReliableDepth: Cardinal; safecall;
    property MaxReliableDepth: Cardinal read get_MaxReliableDepth;
    property MinReliableDepth: Cardinal read get_MinReliableDepth;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Capture.Core.IVariablePhotoSequenceCapture2
  Capture_Core_IVariablePhotoSequenceCapture2 = interface(IInspectable)
  ['{FE2C62BC-50B0-43E3-917C-E3B92798942F}']
    function UpdateSettingsAsync: IAsyncAction; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Media.Casting.ICastingSource
  [WinRTClassNameAttribute(SCasting_CastingSource)]
  Casting_ICastingSource = interface(IInspectable)
  ['{F429EA72-3467-47E6-A027-522923E9D727}']
    function get_PreferredSourceUri: IUriRuntimeClass; safecall;
    procedure put_PreferredSourceUri(value: IUriRuntimeClass); safecall;
    property PreferredSourceUri: IUriRuntimeClass read get_PreferredSourceUri write put_PreferredSourceUri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.CastingConnectionErrorStatus
  // Used Types:  String
  }
  // Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs
  [WinRTClassNameAttribute(SCasting_CastingConnectionErrorOccurredEventArgs)]
  Casting_ICastingConnectionErrorOccurredEventArgs = interface(IInspectable)
  ['{A7FB3C69-8719-4F00-81FB-961863C79A32}']
    function get_ErrorStatus: Casting_CastingConnectionErrorStatus; safecall;
    function get_Message: HSTRING; safecall;
    property ErrorStatus: Casting_CastingConnectionErrorStatus read get_ErrorStatus;
    property Message: HSTRING read get_Message;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingPlaybackTypes>
  AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes_Delegate_Base = interface(IUnknown)
  ['{B55E550C-DFA8-50BE-BE8F-5D42C9DAC120}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingPlaybackTypes>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingPlaybackTypes>
  AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes = interface(AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Casting_CastingPlaybackTypes; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingPlaybackTypes>
  IAsyncOperation_1__Casting_CastingPlaybackTypes_Base = interface(IInspectable)
  ['{DFF10E53-4C5E-5DBA-9269-CD61881BB8B3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingPlaybackTypes>
  // Used Types:  Windows.Media.Casting.CastingPlaybackTypes
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingPlaybackTypes>
  IAsyncOperation_1__Casting_CastingPlaybackTypes = interface(IAsyncOperation_1__Casting_CastingPlaybackTypes_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes; safecall;
    function GetResults: Casting_CastingPlaybackTypes; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Casting_CastingPlaybackTypes read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamWithContentType
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingPlaybackTypes>
  // Used Types:  Windows.Media.Casting.ICastingConnection
  }
  // Windows.Media.Casting.ICastingDevice
  [WinRTClassNameAttribute(SCasting_CastingDevice)]
  Casting_ICastingDevice = interface(IInspectable)
  ['{DE721C83-4A43-4AD1-A6D2-2492A796C3F2}']
    function get_Id: HSTRING; safecall;
    function get_FriendlyName: HSTRING; safecall;
    function get_Icon: IRandomAccessStreamWithContentType; safecall;
    function GetSupportedCastingPlaybackTypesAsync: IAsyncOperation_1__Casting_CastingPlaybackTypes; safecall;
    function CreateCastingConnection: Casting_ICastingConnection; safecall;
    property FriendlyName: HSTRING read get_FriendlyName;
    property Icon: IRandomAccessStreamWithContentType read get_Icon;
    property Id: HSTRING read get_Id;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Object>
  TypedEventHandler_2__Casting_ICastingConnection__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F1576170-9B08-5A9B-87D2-C1AC47BC6681}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingConnection
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Object>
  TypedEventHandler_2__Casting_ICastingConnection__IInspectable = interface(TypedEventHandler_2__Casting_ICastingConnection__IInspectable_Delegate_Base)
  ['{1B9DFF83-C9B9-5F0E-BFE0-C62BF5BD9355}']
    procedure Invoke(sender: Casting_ICastingConnection; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs>
  TypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs_Delegate_Base = interface(IUnknown)
  ['{78AFBBD0-9811-5F0E-9566-47C3E8CDD929}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingConnection
  // Used Types:  Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs>
  TypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs = interface(TypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs_Delegate_Base)
  ['{FBFDED1E-0522-58DB-86DF-D2F4B4C786DD}']
    procedure Invoke(sender: Casting_ICastingConnection; args: Casting_ICastingConnectionErrorOccurredEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus_Delegate_Base = interface(IUnknown)
  ['{7216A94A-A10A-5763-8E96-BF33C582ED92}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus = interface(AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Casting_CastingConnectionErrorStatus; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  IAsyncOperation_1__Casting_CastingConnectionErrorStatus_Base = interface(IInspectable)
  ['{25C821BC-DEB8-5850-8AF2-D3AC35426BD2}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  // Used Types:  Windows.Media.Casting.CastingConnectionErrorStatus
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  IAsyncOperation_1__Casting_CastingConnectionErrorStatus = interface(IAsyncOperation_1__Casting_CastingConnectionErrorStatus_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus; safecall;
    function GetResults: Casting_CastingConnectionErrorStatus; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Casting_CastingConnectionErrorStatus read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.CastingConnectionState
  // Used Types:  Windows.Media.Casting.ICastingDevice
  // Used Types:  Windows.Media.Casting.ICastingSource
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingConnection,Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.CastingConnectionErrorStatus>
  }
  // Windows.Media.Casting.ICastingConnection
  [WinRTClassNameAttribute(SCasting_CastingConnection)]
  Casting_ICastingConnection = interface(IInspectable)
  ['{CD951653-C2F1-4498-8B78-5FB4CD3640DD}']
    function get_State: Casting_CastingConnectionState; safecall;
    function get_Device: Casting_ICastingDevice; safecall;
    function get_Source: Casting_ICastingSource; safecall;
    procedure put_Source(value: Casting_ICastingSource); safecall;
    function add_StateChanged(handler: TypedEventHandler_2__Casting_ICastingConnection__IInspectable): EventRegistrationToken; safecall;
    procedure remove_StateChanged(token: EventRegistrationToken); safecall;
    function add_ErrorOccurred(handler: TypedEventHandler_2__Casting_ICastingConnection__Casting_ICastingConnectionErrorOccurredEventArgs): EventRegistrationToken; safecall;
    procedure remove_ErrorOccurred(token: EventRegistrationToken); safecall;
    function RequestStartCastingAsync(value: Casting_ICastingSource): IAsyncOperation_1__Casting_CastingConnectionErrorStatus; safecall;
    function DisconnectAsync: IAsyncOperation_1__Casting_CastingConnectionErrorStatus; safecall;
    property Device: Casting_ICastingDevice read get_Device;
    property Source: Casting_ICastingSource read get_Source write put_Source;
    property State: Casting_CastingConnectionState read get_State;
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
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.ICastingDevice>
  AsyncOperationCompletedHandler_1__Casting_ICastingDevice_Delegate_Base = interface(IUnknown)
  ['{F0C69B9E-14CB-510A-8EF0-7E86D771BAAF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.ICastingDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.ICastingDevice>
  AsyncOperationCompletedHandler_1__Casting_ICastingDevice = interface(AsyncOperationCompletedHandler_1__Casting_ICastingDevice_Delegate_Base)
  ['{B0A7DE0D-5DC5-5450-851F-5A75F11F6193}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Casting_ICastingDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.ICastingDevice>
  IAsyncOperation_1__Casting_ICastingDevice_Base = interface(IInspectable)
  ['{1B4EE058-4C69-5E70-8834-C1D171CC1B22}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Casting.ICastingDevice>
  // Used Types:  Windows.Media.Casting.ICastingDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.ICastingDevice>
  IAsyncOperation_1__Casting_ICastingDevice = interface(IAsyncOperation_1__Casting_ICastingDevice_Base)
  ['{03D3EC7A-2E35-5F46-A261-5909EE4223F5}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Casting_ICastingDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Casting_ICastingDevice; safecall;
    function GetResults: Casting_ICastingDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Casting_ICastingDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Casting.CastingPlaybackTypes
  // Used Types:  Windows.Foundation.IAsyncOperation`1<String>
  // Used Types:  Windows.Media.Casting.ICastingSource
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Casting.ICastingDevice>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Devices.Enumeration.IDeviceInformation
  }
  // Windows.Media.Casting.ICastingDeviceStatics
  [WinRTClassNameAttribute(SCasting_CastingDevice)]
  Casting_ICastingDeviceStatics = interface(IInspectable)
  ['{E7D958D7-4D13-4237-A365-4C4F6A4CFD2F}']
    function GetDeviceSelector(&type: Casting_CastingPlaybackTypes): HSTRING; safecall;
    function GetDeviceSelectorFromCastingSourceAsync(castingSource: Casting_ICastingSource): IAsyncOperation_1__HSTRING; safecall;
    function FromIdAsync(value: HSTRING): IAsyncOperation_1__Casting_ICastingDevice; safecall;
    function DeviceInfoSupportsCastingAsync(device: IDeviceInformation): IAsyncOperation_1__Boolean; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingDevice
  }
  // Windows.Media.Casting.ICastingDeviceSelectedEventArgs
  [WinRTClassNameAttribute(SCasting_CastingDeviceSelectedEventArgs)]
  Casting_ICastingDeviceSelectedEventArgs = interface(IInspectable)
  ['{DC439E86-DD57-4D0D-9400-AF45E4FB3663}']
    function get_SelectedCastingDevice: Casting_ICastingDevice; safecall;
    property SelectedCastingDevice: Casting_ICastingDevice read get_SelectedCastingDevice;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Casting.ICastingSource>
  IIterator_1__Casting_ICastingSource_Base = interface(IInspectable)
  ['{3F6C93E9-CC77-5EF4-B2B7-25CFCFC09720}']
  end;
  {
  // Used Types:  Windows.Media.Casting.ICastingSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Casting.ICastingSource>
  IIterator_1__Casting_ICastingSource = interface(IIterator_1__Casting_ICastingSource_Base)
  ['{11D83DC6-EE20-5B3C-94FE-DDFE17F24CE0}']
    function get_Current: Casting_ICastingSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCasting_ICastingSource): Cardinal; safecall;
    property Current: Casting_ICastingSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Casting.ICastingSource>
  IIterable_1__Casting_ICastingSource_Base = interface(IInspectable)
  ['{1ABB2CC9-46A2-58B1-91AA-28699D66D1AB}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Casting.ICastingSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Casting.ICastingSource>
  IIterable_1__Casting_ICastingSource = interface(IIterable_1__Casting_ICastingSource_Base)
  ['{4E266F05-5C65-51D2-A1D6-9D24CF5D4284}']
    function First: IIterator_1__Casting_ICastingSource; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingSource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Casting.ICastingSource>
  IVectorView_1__Casting_ICastingSource = interface(IInspectable)
  ['{45713C56-E6EA-5BC3-9939-C15F4F988134}']
    function GetAt(index: Cardinal): Casting_ICastingSource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Casting_ICastingSource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCasting_ICastingSource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingSource
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Casting.ICastingSource>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Casting.ICastingSource>
  IVector_1__Casting_ICastingSource = interface(IInspectable)
  ['{A71BC55B-7E69-532E-AFB7-86551493EF24}']
    function GetAt(index: Cardinal): Casting_ICastingSource; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Casting_ICastingSource; safecall;
    function IndexOf(value: Casting_ICastingSource; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Casting_ICastingSource); safecall;
    procedure InsertAt(index: Cardinal; value: Casting_ICastingSource); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Casting_ICastingSource); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCasting_ICastingSource): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCasting_ICastingSource); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Casting.ICastingSource>
  }
  // Windows.Media.Casting.ICastingDevicePickerFilter
  [WinRTClassNameAttribute(SCasting_CastingDevicePickerFilter)]
  Casting_ICastingDevicePickerFilter = interface(IInspectable)
  ['{BE8C619C-B563-4354-AE33-9FDAAD8C6291}']
    function get_SupportsAudio: Boolean; safecall;
    procedure put_SupportsAudio(value: Boolean); safecall;
    function get_SupportsVideo: Boolean; safecall;
    procedure put_SupportsVideo(value: Boolean); safecall;
    function get_SupportsPictures: Boolean; safecall;
    procedure put_SupportsPictures(value: Boolean); safecall;
    function get_SupportedCastingSources: IVector_1__Casting_ICastingSource; safecall;
    property SupportedCastingSources: IVector_1__Casting_ICastingSource read get_SupportedCastingSources;
    property SupportsAudio: Boolean read get_SupportsAudio write put_SupportsAudio;
    property SupportsPictures: Boolean read get_SupportsPictures write put_SupportsPictures;
    property SupportsVideo: Boolean read get_SupportsVideo write put_SupportsVideo;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Windows.Media.Casting.ICastingDeviceSelectedEventArgs>
  TypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{B3655B33-C4AD-5F4C-A187-B2E4C770A16B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingDevicePicker
  // Used Types:  Windows.Media.Casting.ICastingDeviceSelectedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Windows.Media.Casting.ICastingDeviceSelectedEventArgs>
  TypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs = interface(TypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs_Delegate_Base)
  ['{403A3B9B-BC19-5C05-8476-D285105333BA}']
    procedure Invoke(sender: Casting_ICastingDevicePicker; args: Casting_ICastingDeviceSelectedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Object>
  TypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable_Delegate_Base = interface(IUnknown)
  ['{A64B972B-AA63-5C61-9CDE-CD6FFEA8A247}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingDevicePicker
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Object>
  TypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable = interface(TypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable_Delegate_Base)
  ['{74A94C43-5E45-59C3-BEE5-61A76D66B5FF}']
    procedure Invoke(sender: Casting_ICastingDevicePicker; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Casting.ICastingDevicePickerFilter
  // Used Types:  Windows.Devices.Enumeration.IDevicePickerAppearance
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Windows.Media.Casting.ICastingDeviceSelectedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Casting.ICastingDevicePicker,Object>
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.UI.Popups.Placement
  }
  // Windows.Media.Casting.ICastingDevicePicker
  [WinRTClassNameAttribute(SCasting_CastingDevicePicker)]
  Casting_ICastingDevicePicker = interface(IInspectable)
  ['{DCD39924-0591-49BE-AACB-4B82EE756A95}']
    function get_Filter: Casting_ICastingDevicePickerFilter; safecall;
    function get_Appearance: IDevicePickerAppearance; safecall;
    function add_CastingDeviceSelected(handler: TypedEventHandler_2__Casting_ICastingDevicePicker__Casting_ICastingDeviceSelectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CastingDeviceSelected(token: EventRegistrationToken); safecall;
    function add_CastingDevicePickerDismissed(handler: TypedEventHandler_2__Casting_ICastingDevicePicker__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CastingDevicePickerDismissed(token: EventRegistrationToken); safecall;
    procedure Show(selection: TRectF); overload; safecall;
    procedure Show(selection: TRectF; preferredPlacement: Popups_Placement); overload; safecall;
    procedure Hide; safecall;
    property Appearance: IDevicePickerAppearance read get_Appearance;
    property Filter: Casting_ICastingDevicePickerFilter read get_Filter;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Media.Core.IDataCue
  [WinRTClassNameAttribute(SCore_DataCue)]
  Core_IDataCue = interface(IInspectable)
  ['{7C7F676D-1FBC-4E2D-9A87-EE38BD1DC637}']
    procedure put_Data(value: IBuffer); safecall;
    function get_Data: IBuffer; safecall;
    property Data: IBuffer read get_Data write put_Data;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Core.IDataCue2
  Core_IDataCue2 = interface(IInspectable)
  ['{BC561B15-95F2-49E8-96F1-8DD5DAC68D93}']
    function get_Properties: IPropertySet; safecall;
    property Properties: IPropertySet read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Media.Core.IChapterCue
  [WinRTClassNameAttribute(SCore_ChapterCue)]
  Core_IChapterCue = interface(IInspectable)
  ['{72A98001-D38A-4C0A-8FA6-75CDDAF4664C}']
    procedure put_Title(value: HSTRING); safecall;
    function get_Title: HSTRING; safecall;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.TimedTextPoint
  // Used Types:  Windows.Media.Core.TimedTextSize
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  }
  // Windows.Media.Core.IImageCue
  [WinRTClassNameAttribute(SCore_ImageCue)]
  Core_IImageCue = interface(IInspectable)
  ['{52828282-367B-440B-9116-3C84570DD270}']
    function get_Position: Core_TimedTextPoint; safecall;
    procedure put_Position(value: Core_TimedTextPoint); safecall;
    function get_Extent: Core_TimedTextSize; safecall;
    procedure put_Extent(value: Core_TimedTextSize); safecall;
    procedure put_SoftwareBitmap(value: Imaging_ISoftwareBitmap); safecall;
    function get_SoftwareBitmap: Imaging_ISoftwareBitmap; safecall;
    property Extent: Core_TimedTextSize read get_Extent write put_Extent;
    property Position: Core_TimedTextPoint read get_Position write put_Position;
    property SoftwareBitmap: Imaging_ISoftwareBitmap read get_SoftwareBitmap write put_SoftwareBitmap;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  }
  // Windows.Media.Core.ISpeechCue
  [WinRTClassNameAttribute(SCore_SpeechCue)]
  Core_ISpeechCue = interface(IInspectable)
  ['{AEE254DC-1725-4BAD-8043-A98499B017A2}']
    function get_Text: HSTRING; safecall;
    procedure put_Text(value: HSTRING); safecall;
    function get_StartPositionInInput: IReference_1__Integer; safecall;
    procedure put_StartPositionInInput(value: IReference_1__Integer); safecall;
    function get_EndPositionInInput: IReference_1__Integer; safecall;
    procedure put_EndPositionInInput(value: IReference_1__Integer); safecall;
    property EndPositionInInput: IReference_1__Integer read get_EndPositionInInput write put_EndPositionInInput;
    property StartPositionInInput: IReference_1__Integer read get_StartPositionInInput write put_StartPositionInInput;
    property Text: HSTRING read get_Text write put_Text;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Core.TimedTextPoint
  // Used Types:  Windows.Media.Core.TimedTextSize
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.Media.Core.TimedTextWritingMode
  // Used Types:  Windows.Media.Core.TimedTextDisplayAlignment
  // Used Types:  Windows.Media.Core.TimedTextDouble
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Core.TimedTextPadding
  // Used Types:  Windows.Media.Core.TimedTextWrapping
  // Used Types:  Int32
  // Used Types:  Windows.Media.Core.TimedTextScrollMode
  }
  // Windows.Media.Core.ITimedTextRegion
  [WinRTClassNameAttribute(SCore_TimedTextRegion)]
  Core_ITimedTextRegion = interface(IInspectable)
  ['{1ED0881F-8A06-4222-9F59-B21BF40124B4}']
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Position: Core_TimedTextPoint; safecall;
    procedure put_Position(value: Core_TimedTextPoint); safecall;
    function get_Extent: Core_TimedTextSize; safecall;
    procedure put_Extent(value: Core_TimedTextSize); safecall;
    function get_Background: Color; safecall;
    procedure put_Background(value: Color); safecall;
    function get_WritingMode: Core_TimedTextWritingMode; safecall;
    procedure put_WritingMode(value: Core_TimedTextWritingMode); safecall;
    function get_DisplayAlignment: Core_TimedTextDisplayAlignment; safecall;
    procedure put_DisplayAlignment(value: Core_TimedTextDisplayAlignment); safecall;
    function get_LineHeight: Core_TimedTextDouble; safecall;
    procedure put_LineHeight(value: Core_TimedTextDouble); safecall;
    function get_IsOverflowClipped: Boolean; safecall;
    procedure put_IsOverflowClipped(value: Boolean); safecall;
    function get_Padding: Core_TimedTextPadding; safecall;
    procedure put_Padding(value: Core_TimedTextPadding); safecall;
    function get_TextWrapping: Core_TimedTextWrapping; safecall;
    procedure put_TextWrapping(value: Core_TimedTextWrapping); safecall;
    function get_ZIndex: Integer; safecall;
    procedure put_ZIndex(value: Integer); safecall;
    function get_ScrollMode: Core_TimedTextScrollMode; safecall;
    procedure put_ScrollMode(value: Core_TimedTextScrollMode); safecall;
    property Background: Color read get_Background write put_Background;
    property DisplayAlignment: Core_TimedTextDisplayAlignment read get_DisplayAlignment write put_DisplayAlignment;
    property Extent: Core_TimedTextSize read get_Extent write put_Extent;
    property IsOverflowClipped: Boolean read get_IsOverflowClipped write put_IsOverflowClipped;
    property LineHeight: Core_TimedTextDouble read get_LineHeight write put_LineHeight;
    property Name: HSTRING read get_Name write put_Name;
    property Padding: Core_TimedTextPadding read get_Padding write put_Padding;
    property Position: Core_TimedTextPoint read get_Position write put_Position;
    property ScrollMode: Core_TimedTextScrollMode read get_ScrollMode write put_ScrollMode;
    property TextWrapping: Core_TimedTextWrapping read get_TextWrapping write put_TextWrapping;
    property WritingMode: Core_TimedTextWritingMode read get_WritingMode write put_WritingMode;
    property ZIndex: Integer read get_ZIndex write put_ZIndex;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Core.TimedTextDouble
  // Used Types:  Windows.Media.Core.TimedTextWeight
  // Used Types:  Windows.UI.Color
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Core.TimedTextFlowDirection
  // Used Types:  Windows.Media.Core.TimedTextLineAlignment
  }
  // Windows.Media.Core.ITimedTextStyle
  [WinRTClassNameAttribute(SCore_TimedTextStyle)]
  Core_ITimedTextStyle = interface(IInspectable)
  ['{1BB2384D-A825-40C2-A7F5-281EAEDF3B55}']
    function get_Name: HSTRING; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_FontFamily: HSTRING; safecall;
    procedure put_FontFamily(value: HSTRING); safecall;
    function get_FontSize: Core_TimedTextDouble; safecall;
    procedure put_FontSize(value: Core_TimedTextDouble); safecall;
    function get_FontWeight: Core_TimedTextWeight; safecall;
    procedure put_FontWeight(value: Core_TimedTextWeight); safecall;
    function get_Foreground: Color; safecall;
    procedure put_Foreground(value: Color); safecall;
    function get_Background: Color; safecall;
    procedure put_Background(value: Color); safecall;
    function get_IsBackgroundAlwaysShown: Boolean; safecall;
    procedure put_IsBackgroundAlwaysShown(value: Boolean); safecall;
    function get_FlowDirection: Core_TimedTextFlowDirection; safecall;
    procedure put_FlowDirection(value: Core_TimedTextFlowDirection); safecall;
    function get_LineAlignment: Core_TimedTextLineAlignment; safecall;
    procedure put_LineAlignment(value: Core_TimedTextLineAlignment); safecall;
    function get_OutlineColor: Color; safecall;
    procedure put_OutlineColor(value: Color); safecall;
    function get_OutlineThickness: Core_TimedTextDouble; safecall;
    procedure put_OutlineThickness(value: Core_TimedTextDouble); safecall;
    function get_OutlineRadius: Core_TimedTextDouble; safecall;
    procedure put_OutlineRadius(value: Core_TimedTextDouble); safecall;
    property Background: Color read get_Background write put_Background;
    property FlowDirection: Core_TimedTextFlowDirection read get_FlowDirection write put_FlowDirection;
    property FontFamily: HSTRING read get_FontFamily write put_FontFamily;
    property FontSize: Core_TimedTextDouble read get_FontSize write put_FontSize;
    property FontWeight: Core_TimedTextWeight read get_FontWeight write put_FontWeight;
    property Foreground: Color read get_Foreground write put_Foreground;
    property IsBackgroundAlwaysShown: Boolean read get_IsBackgroundAlwaysShown write put_IsBackgroundAlwaysShown;
    property LineAlignment: Core_TimedTextLineAlignment read get_LineAlignment write put_LineAlignment;
    property Name: HSTRING read get_Name write put_Name;
    property OutlineColor: Color read get_OutlineColor write put_OutlineColor;
    property OutlineRadius: Core_TimedTextDouble read get_OutlineRadius write put_OutlineRadius;
    property OutlineThickness: Core_TimedTextDouble read get_OutlineThickness write put_OutlineThickness;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Media.Core.ITimedTextStyle
  }
  // Windows.Media.Core.ITimedTextSubformat
  [WinRTClassNameAttribute(SCore_TimedTextSubformat)]
  Core_ITimedTextSubformat = interface(IInspectable)
  ['{D713502F-3261-4722-A0C2-B937B2390F14}']
    function get_StartIndex: Integer; safecall;
    procedure put_StartIndex(value: Integer); safecall;
    function get_Length: Integer; safecall;
    procedure put_Length(value: Integer); safecall;
    function get_SubformatStyle: Core_ITimedTextStyle; safecall;
    procedure put_SubformatStyle(value: Core_ITimedTextStyle); safecall;
    property Length: Integer read get_Length write put_Length;
    property StartIndex: Integer read get_StartIndex write put_StartIndex;
    property SubformatStyle: Core_ITimedTextStyle read get_SubformatStyle write put_SubformatStyle;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSubformat>
  IIterator_1__Core_ITimedTextSubformat_Base = interface(IInspectable)
  ['{65105E50-865C-591D-9BF4-96237DE2533F}']
  end;
  {
  // Used Types:  Windows.Media.Core.ITimedTextSubformat
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSubformat>
  IIterator_1__Core_ITimedTextSubformat = interface(IIterator_1__Core_ITimedTextSubformat_Base)
  ['{FB4AA4C4-1FC1-50E6-971F-12F37D9559AF}']
    function get_Current: Core_ITimedTextSubformat; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_ITimedTextSubformat): Cardinal; safecall;
    property Current: Core_ITimedTextSubformat read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextSubformat>
  IIterable_1__Core_ITimedTextSubformat_Base = interface(IInspectable)
  ['{CEE3AE43-C93C-56F7-8C55-9024DED72C76}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSubformat>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextSubformat>
  IIterable_1__Core_ITimedTextSubformat = interface(IIterable_1__Core_ITimedTextSubformat_Base)
  ['{38D80C41-06F4-5AF5-9F8D-6039899EF908}']
    function First: IIterator_1__Core_ITimedTextSubformat; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextSubformat
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextSubformat>
  IVectorView_1__Core_ITimedTextSubformat = interface(IInspectable)
  ['{000FFD4A-3B93-561C-9AE7-2186172AF5F5}']
    function GetAt(index: Cardinal): Core_ITimedTextSubformat; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_ITimedTextSubformat; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedTextSubformat): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextSubformat
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextSubformat>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextSubformat>
  IVector_1__Core_ITimedTextSubformat = interface(IInspectable)
  ['{D6526EDE-ADE5-5718-BD3E-512256835A37}']
    function GetAt(index: Cardinal): Core_ITimedTextSubformat; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Core_ITimedTextSubformat; safecall;
    function IndexOf(value: Core_ITimedTextSubformat; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Core_ITimedTextSubformat); safecall;
    procedure InsertAt(index: Cardinal; value: Core_ITimedTextSubformat); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Core_ITimedTextSubformat); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedTextSubformat): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCore_ITimedTextSubformat); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextSubformat>
  }
  // Windows.Media.Core.ITimedTextLine
  [WinRTClassNameAttribute(SCore_TimedTextLine)]
  Core_ITimedTextLine = interface(IInspectable)
  ['{978D7CE2-7308-4C66-BE50-65777289F5DF}']
    function get_Text: HSTRING; safecall;
    procedure put_Text(value: HSTRING); safecall;
    function get_Subformats: IVector_1__Core_ITimedTextSubformat; safecall;
    property Subformats: IVector_1__Core_ITimedTextSubformat read get_Subformats;
    property Text: HSTRING read get_Text write put_Text;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextLine>
  IIterator_1__Core_ITimedTextLine_Base = interface(IInspectable)
  ['{84C4FCAC-86D8-5C74-A138-D9BF37B749EC}']
  end;
  {
  // Used Types:  Windows.Media.Core.ITimedTextLine
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextLine>
  IIterator_1__Core_ITimedTextLine = interface(IIterator_1__Core_ITimedTextLine_Base)
  ['{F22C67D8-62B7-50F0-AB02-79895BC4EE28}']
    function get_Current: Core_ITimedTextLine; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_ITimedTextLine): Cardinal; safecall;
    property Current: Core_ITimedTextLine read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextLine>
  IIterable_1__Core_ITimedTextLine_Base = interface(IInspectable)
  ['{AEC710AD-3BD8-5A59-AE77-E7FC46FB105B}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextLine>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextLine>
  IIterable_1__Core_ITimedTextLine = interface(IIterable_1__Core_ITimedTextLine_Base)
  ['{4F04DF6F-33BD-548E-AFE2-73CB2ADA8A99}']
    function First: IIterator_1__Core_ITimedTextLine; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextLine
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextLine>
  IVectorView_1__Core_ITimedTextLine = interface(IInspectable)
  ['{D5191C8C-979C-5E6A-ADA3-0F484DBB2ECC}']
    function GetAt(index: Cardinal): Core_ITimedTextLine; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_ITimedTextLine; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedTextLine): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextLine
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextLine>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextLine>
  IVector_1__Core_ITimedTextLine = interface(IInspectable)
  ['{702EA02E-ADF3-5F5A-B2B7-1259E6884874}']
    function GetAt(index: Cardinal): Core_ITimedTextLine; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Core_ITimedTextLine; safecall;
    function IndexOf(value: Core_ITimedTextLine; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Core_ITimedTextLine); safecall;
    procedure InsertAt(index: Cardinal; value: Core_ITimedTextLine); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Core_ITimedTextLine); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedTextLine): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCore_ITimedTextLine); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextRegion
  // Used Types:  Windows.Media.Core.ITimedTextStyle
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextLine>
  }
  // Windows.Media.Core.ITimedTextCue
  [WinRTClassNameAttribute(SCore_TimedTextCue)]
  Core_ITimedTextCue = interface(IInspectable)
  ['{51C79E51-3B86-494D-B359-BB2EA7ACA9A9}']
    function get_CueRegion: Core_ITimedTextRegion; safecall;
    procedure put_CueRegion(value: Core_ITimedTextRegion); safecall;
    function get_CueStyle: Core_ITimedTextStyle; safecall;
    procedure put_CueStyle(value: Core_ITimedTextStyle); safecall;
    function get_Lines: IVector_1__Core_ITimedTextLine; safecall;
    property CueRegion: Core_ITimedTextRegion read get_CueRegion write put_CueRegion;
    property CueStyle: Core_ITimedTextStyle read get_CueStyle write put_CueStyle;
    property Lines: IVector_1__Core_ITimedTextLine read get_Lines;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.TimedTextFontStyle
  // Used Types:  Boolean
  }
  // Windows.Media.Core.ITimedTextStyle2
  Core_ITimedTextStyle2 = interface(IInspectable)
  ['{655F492D-6111-4787-89CC-686FECE57E14}']
    function get_FontStyle: Core_TimedTextFontStyle; safecall;
    procedure put_FontStyle(value: Core_TimedTextFontStyle); safecall;
    function get_IsUnderlineEnabled: Boolean; safecall;
    procedure put_IsUnderlineEnabled(value: Boolean); safecall;
    function get_IsLineThroughEnabled: Boolean; safecall;
    procedure put_IsLineThroughEnabled(value: Boolean); safecall;
    function get_IsOverlineEnabled: Boolean; safecall;
    procedure put_IsOverlineEnabled(value: Boolean); safecall;
    property FontStyle: Core_TimedTextFontStyle read get_FontStyle write put_FontStyle;
    property IsLineThroughEnabled: Boolean read get_IsLineThroughEnabled write put_IsLineThroughEnabled;
    property IsOverlineEnabled: Boolean read get_IsOverlineEnabled write put_IsOverlineEnabled;
    property IsUnderlineEnabled: Boolean read get_IsUnderlineEnabled write put_IsUnderlineEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.CodecKind
  // Used Types:  Windows.Media.Core.CodecCategory
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  String
  // Used Types:  Boolean
  }
  // Windows.Media.Core.ICodecInfo
  [WinRTClassNameAttribute(SCore_CodecInfo)]
  Core_ICodecInfo = interface(IInspectable)
  ['{51E89F85-EA97-499C-86AC-4CE5E73F3A42}']
    function get_Kind: Core_CodecKind; safecall;
    function get_Category: Core_CodecCategory; safecall;
    function get_Subtypes: IVectorView_1__HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_IsTrusted: Boolean; safecall;
    property Category: Core_CodecCategory read get_Category;
    property DisplayName: HSTRING read get_DisplayName;
    property IsTrusted: Boolean read get_IsTrusted;
    property Kind: Core_CodecKind read get_Kind;
    property Subtypes: IVectorView_1__HSTRING read get_Subtypes;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ICodecInfo>
  IIterator_1__Core_ICodecInfo_Base = interface(IInspectable)
  ['{D4141D5B-23F6-564B-B85C-5D4609F81863}']
  end;
  {
  // Used Types:  Windows.Media.Core.ICodecInfo
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ICodecInfo>
  IIterator_1__Core_ICodecInfo = interface(IIterator_1__Core_ICodecInfo_Base)
  ['{D2022C5B-7DA3-5B30-8AD8-F4E39517C86A}']
    function get_Current: Core_ICodecInfo; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_ICodecInfo): Cardinal; safecall;
    property Current: Core_ICodecInfo read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ICodecInfo>
  IIterable_1__Core_ICodecInfo_Base = interface(IInspectable)
  ['{552F7709-3BC3-59FB-93E6-1EBD28D3C008}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ICodecInfo>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ICodecInfo>
  IIterable_1__Core_ICodecInfo = interface(IIterable_1__Core_ICodecInfo_Base)
  ['{7D19D1CF-EB54-573B-99C6-EB1990904822}']
    function First: IIterator_1__Core_ICodecInfo; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ICodecInfo
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>
  IVectorView_1__Core_ICodecInfo = interface(IInspectable)
  ['{B47EFF6C-BB28-59C2-B153-0512FE334F4D}']
    function GetAt(index: Cardinal): Core_ICodecInfo; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_ICodecInfo; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ICodecInfo): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo_Delegate_Base = interface(IUnknown)
  ['{58BF2D7C-AE9B-5F1B-8B66-5FF1BBB1029A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo_Delegate_Base)
  ['{EBDC88BA-87E2-55C4-9AC1-52E5533D66A7}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Core_ICodecInfo; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  IAsyncOperation_1__IVectorView_1__Core_ICodecInfo_Base = interface(IInspectable)
  ['{C1C59EFC-71DF-5534-B03F-E18A8FBE78BB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  IAsyncOperation_1__IVectorView_1__Core_ICodecInfo = interface(IAsyncOperation_1__IVectorView_1__Core_ICodecInfo_Base)
  ['{2B7BDF8D-A3B3-50D9-83C4-F8FBC71CA835}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo; safecall;
    function GetResults: IVectorView_1__Core_ICodecInfo; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Core_ICodecInfo read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ICodecInfo>>
  // Used Types:  Windows.Media.Core.CodecKind
  // Used Types:  Windows.Media.Core.CodecCategory
  // Used Types:  String
  }
  // Windows.Media.Core.ICodecQuery
  [WinRTClassNameAttribute(SCore_CodecQuery)]
  Core_ICodecQuery = interface(IInspectable)
  ['{222A953A-AF61-4E04-808A-A4634E2F3AC4}']
    function FindAllAsync(kind: Core_CodecKind; category: Core_CodecCategory; subType: HSTRING): IAsyncOperation_1__IVectorView_1__Core_ICodecInfo; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.ISoftwareBitmap
  }
  // Windows.Media.Core.ILowLightFusionResult
  [WinRTClassNameAttribute(SCore_LowLightFusionResult)]
  Core_ILowLightFusionResult = interface(IInspectable)
  ['{78EDBE35-27A0-42E0-9CD3-738D2089DE9C}']
    function get_Frame: Imaging_ISoftwareBitmap; safecall;
    property Frame: Imaging_ISoftwareBitmap read get_Frame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double_Delegate_Base = interface(IUnknown)
  ['{79337BBF-7B7F-5F88-A2EA-8DF14AE31DE4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Core.ILowLightFusionResult,Double>
  // Used Types:  Double
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double = interface(AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double_Delegate_Base)
  ['{1B30C56A-8E0C-542A-BC1D-809D77E98F89}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double; progressInfo: Double); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double_Delegate_Base = interface(IUnknown)
  ['{4A952FC2-EFCE-5275-90D0-3689BE26F666}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Core.ILowLightFusionResult,Double>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double = interface(AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double_Delegate_Base)
  ['{AAEDAF8D-A95B-55B7-9B9A-160792CF2E0E}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Core.ILowLightFusionResult,Double>
  IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double_Base = interface(IInspectable)
  ['{A2302C2D-66B5-59C7-AB97-3F5793E21D43}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Core.ILowLightFusionResult,Double>
  // Used Types:  Windows.Media.Core.ILowLightFusionResult
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Core.ILowLightFusionResult,Double>
  IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double = interface(IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double_Base)
  ['{0BEA7B91-9AC9-5DEF-A613-97F00254488C}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double; safecall;
    function GetResults: Core_ILowLightFusionResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__Core_ILowLightFusionResult__Double read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Core_ILowLightFusionResult__Double read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.Imaging.BitmapPixelFormat>
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Core.ILowLightFusionResult,Double>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Graphics.Imaging.ISoftwareBitmap>
  }
  // Windows.Media.Core.ILowLightFusionStatics
  [WinRTClassNameAttribute(SCore_LowLightFusion)]
  Core_ILowLightFusionStatics = interface(IInspectable)
  ['{5305016D-C29E-40E2-87A9-9E1FD2F192F5}']
    function get_SupportedBitmapPixelFormats: IVectorView_1__Imaging_BitmapPixelFormat; safecall;
    function get_MaxSupportedFrameCount: Integer; safecall;
    function FuseAsync(frameSet: IIterable_1__Imaging_ISoftwareBitmap): IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double; safecall;
    property MaxSupportedFrameCount: Integer read get_MaxSupportedFrameCount;
    property SupportedBitmapPixelFormats: IVectorView_1__Imaging_BitmapPixelFormat read get_SupportedBitmapPixelFormats;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.DialAppState
  // Used Types:  String
  }
  // Windows.Media.DialProtocol.IDialAppStateDetails
  DialProtocol_IDialAppStateDetails = interface(IInspectable)
  ['{DDC4A4A1-F5DE-400D-BEA4-8C8466BB2961}']
    function get_State: DialProtocol_DialAppState; safecall;
    function get_FullXml: HSTRING; safecall;
    property FullXml: HSTRING read get_FullXml;
    property State: DialProtocol_DialAppState read get_State;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult_Delegate_Base = interface(IUnknown)
  ['{164C0AA8-3D2B-579B-94A3-CC4925C695EC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult = interface(AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DialProtocol_DialAppLaunchResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  IAsyncOperation_1__DialProtocol_DialAppLaunchResult_Base = interface(IInspectable)
  ['{4512C15E-1FC4-5648-BD49-51533A3FE6B4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  // Used Types:  Windows.Media.DialProtocol.DialAppLaunchResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  IAsyncOperation_1__DialProtocol_DialAppLaunchResult = interface(IAsyncOperation_1__DialProtocol_DialAppLaunchResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult; safecall;
    function GetResults: DialProtocol_DialAppLaunchResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DialProtocol_DialAppLaunchResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppStopResult>
  AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult_Delegate_Base = interface(IUnknown)
  ['{C755F54A-EF7B-563A-9B14-462E72D9665A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppStopResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppStopResult>
  AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult = interface(AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DialProtocol_DialAppStopResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppStopResult>
  IAsyncOperation_1__DialProtocol_DialAppStopResult_Base = interface(IInspectable)
  ['{8598F24E-0D62-517A-961C-31FCA73ACEDD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.DialAppStopResult>
  // Used Types:  Windows.Media.DialProtocol.DialAppStopResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppStopResult>
  IAsyncOperation_1__DialProtocol_DialAppStopResult = interface(IAsyncOperation_1__DialProtocol_DialAppStopResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult; safecall;
    function GetResults: DialProtocol_DialAppStopResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DialProtocol_DialAppStopResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails_Delegate_Base = interface(IUnknown)
  ['{38C62DD5-1F16-55C0-8EC7-CA0FC841D614}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails = interface(AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails_Delegate_Base)
  ['{A16156BC-153F-5EAD-9718-FACE28E16A95}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DialProtocol_IDialAppStateDetails; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  IAsyncOperation_1__DialProtocol_IDialAppStateDetails_Base = interface(IInspectable)
  ['{E50A07A2-2CEF-5FC7-B14C-D6DD8517C58E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  // Used Types:  Windows.Media.DialProtocol.IDialAppStateDetails
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  IAsyncOperation_1__DialProtocol_IDialAppStateDetails = interface(IAsyncOperation_1__DialProtocol_IDialAppStateDetails_Base)
  ['{8E5B4DD6-2050-5B27-BF3D-122463A3A3CD}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails; safecall;
    function GetResults: DialProtocol_IDialAppStateDetails; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DialProtocol_IDialAppStateDetails read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppLaunchResult>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.DialAppStopResult>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialAppStateDetails>
  }
  // Windows.Media.DialProtocol.IDialApp
  DialProtocol_IDialApp = interface(IInspectable)
  ['{555FFBD3-45B7-49F3-BBD7-302DB6084646}']
    function get_AppName: HSTRING; safecall;
    function RequestLaunchAsync(appArgument: HSTRING): IAsyncOperation_1__DialProtocol_DialAppLaunchResult; safecall;
    function StopAsync: IAsyncOperation_1__DialProtocol_DialAppStopResult; safecall;
    function GetAppStateAsync: IAsyncOperation_1__DialProtocol_IDialAppStateDetails; safecall;
    property AppName: HSTRING read get_AppName;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.DialProtocol.IDialApp
  }
  // Windows.Media.DialProtocol.IDialDevice
  DialProtocol_IDialDevice = interface(IInspectable)
  ['{FFF0EDAF-759F-41D2-A20A-7F29CE0B3784}']
    function get_Id: HSTRING; safecall;
    function GetDialApp(appName: HSTRING): DialProtocol_IDialApp; safecall;
    property Id: HSTRING read get_Id;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialDevice>
  AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice_Delegate_Base = interface(IUnknown)
  ['{81BC7D1B-7D06-555F-811B-42EC0FA71B55}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialDevice>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialDevice>
  AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice = interface(AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice_Delegate_Base)
  ['{2DE4643B-1D68-5BD1-B49D-25E8D8F84147}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__DialProtocol_IDialDevice; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialDevice>
  IAsyncOperation_1__DialProtocol_IDialDevice_Base = interface(IInspectable)
  ['{471CADA5-1EE4-51C0-B6B5-BF72F5F50422}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.DialProtocol.IDialDevice>
  // Used Types:  Windows.Media.DialProtocol.IDialDevice
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialDevice>
  IAsyncOperation_1__DialProtocol_IDialDevice = interface(IAsyncOperation_1__DialProtocol_IDialDevice_Base)
  ['{91136866-7F9F-5D80-B952-1FD092B571D8}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice; safecall;
    function GetResults: DialProtocol_IDialDevice; safecall;
    property Completed: AsyncOperationCompletedHandler_1__DialProtocol_IDialDevice read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.IDialDevice
  }
  // Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs
  [WinRTClassNameAttribute(SDialProtocol_DialDeviceSelectedEventArgs)]
  DialProtocol_IDialDeviceSelectedEventArgs = interface(IInspectable)
  ['{480B92AD-AC76-47EB-9C06-A19304DA0247}']
    function get_SelectedDialDevice: DialProtocol_IDialDevice; safecall;
    property SelectedDialDevice: DialProtocol_IDialDevice read get_SelectedDialDevice;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.IDialDevice
  }
  // Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs
  [WinRTClassNameAttribute(SDialProtocol_DialDisconnectButtonClickedEventArgs)]
  DialProtocol_IDialDisconnectButtonClickedEventArgs = interface(IInspectable)
  ['{52765152-9C81-4E55-ADC2-0EBE99CDE3B6}']
    function get_Device: DialProtocol_IDialDevice; safecall;
    property Device: DialProtocol_IDialDevice read get_Device;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<String>
  }
  // Windows.Media.DialProtocol.IDialDevicePickerFilter
  [WinRTClassNameAttribute(SDialProtocol_DialDevicePickerFilter)]
  DialProtocol_IDialDevicePickerFilter = interface(IInspectable)
  ['{C17C93BA-86C0-485D-B8D6-0F9A8F641590}']
    function get_SupportedAppNames: IVector_1__HSTRING; safecall;
    property SupportedAppNames: IVector_1__HSTRING read get_SupportedAppNames;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{8375C0D7-E7C3-56BC-9880-46B69CA10D45}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.IDialDevicePicker
  // Used Types:  Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs = interface(TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs_Delegate_Base)
  ['{66E97340-5F01-570E-80FD-38CA3D3C8A6C}']
    procedure Invoke(sender: DialProtocol_IDialDevicePicker; args: DialProtocol_IDialDeviceSelectedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs_Delegate_Base = interface(IUnknown)
  ['{13492AF0-1C7F-57E8-B57E-A5AE8F2C462E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.IDialDevicePicker
  // Used Types:  Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs = interface(TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs_Delegate_Base)
  ['{C144F3DB-C6C9-5207-8ABA-3B28650B89EC}']
    procedure Invoke(sender: DialProtocol_IDialDevicePicker; args: DialProtocol_IDialDisconnectButtonClickedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Object>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable_Delegate_Base = interface(IUnknown)
  ['{DAC94028-1B44-5F45-B9E3-ABCF4AB044BF}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.IDialDevicePicker
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Object>
  TypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable = interface(TypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable_Delegate_Base)
  ['{A12903C1-1444-55CF-8B95-806AD3EA4E64}']
    procedure Invoke(sender: DialProtocol_IDialDevicePicker; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.DialProtocol.IDialDevicePickerFilter
  // Used Types:  Windows.Devices.Enumeration.IDevicePickerAppearance
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.DialProtocol.IDialDevicePicker,Object>
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.UI.Popups.Placement
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.DialProtocol.IDialDevice>
  // Used Types:  Windows.Media.DialProtocol.IDialDevice
  // Used Types:  Windows.Media.DialProtocol.DialDeviceDisplayStatus
  }
  // Windows.Media.DialProtocol.IDialDevicePicker
  [WinRTClassNameAttribute(SDialProtocol_DialDevicePicker)]
  DialProtocol_IDialDevicePicker = interface(IInspectable)
  ['{BA7E520A-FF59-4F4B-BDAC-D89F495AD6E1}']
    function get_Filter: DialProtocol_IDialDevicePickerFilter; safecall;
    function get_Appearance: IDevicePickerAppearance; safecall;
    function add_DialDeviceSelected(handler: TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDeviceSelectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DialDeviceSelected(token: EventRegistrationToken); safecall;
    function add_DisconnectButtonClicked(handler: TypedEventHandler_2__DialProtocol_IDialDevicePicker__DialProtocol_IDialDisconnectButtonClickedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DisconnectButtonClicked(token: EventRegistrationToken); safecall;
    function add_DialDevicePickerDismissed(handler: TypedEventHandler_2__DialProtocol_IDialDevicePicker__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DialDevicePickerDismissed(token: EventRegistrationToken); safecall;
    procedure Show(selection: TRectF); overload; safecall;
    procedure Show(selection: TRectF; preferredPlacement: Popups_Placement); overload; safecall;
    function PickSingleDialDeviceAsync(selection: TRectF): IAsyncOperation_1__DialProtocol_IDialDevice; overload; safecall;
    function PickSingleDialDeviceAsync(selection: TRectF; preferredPlacement: Popups_Placement): IAsyncOperation_1__DialProtocol_IDialDevice; overload; safecall;
    procedure Hide; safecall;
    procedure SetDisplayStatus(device: DialProtocol_IDialDevice; status: DialProtocol_DialDeviceDisplayStatus); safecall;
    property Appearance: IDevicePickerAppearance read get_Appearance;
    property Filter: DialProtocol_IDialDevicePickerFilter read get_Filter;
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
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,String>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING_Delegate_Base = interface(IUnknown)
  ['{39BB624E-B5C6-5785-BA46-3F45AAF3EF35}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,String>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,String>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING = interface(AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING_Delegate_Base)
  ['{39BB624E-B5C6-5785-BA46-3F45AAF3EF35}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMap_2__HSTRING__HSTRING; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,String>>
  IAsyncOperation_1__IMap_2__HSTRING__HSTRING_Base = interface(IInspectable)
  ['{84E30B9C-351D-5FCB-8B0A-BC145407F915}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,String>>
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,String>>
  IAsyncOperation_1__IMap_2__HSTRING__HSTRING = interface(IAsyncOperation_1__IMap_2__HSTRING__HSTRING_Base)
  ['{84E30B9C-351D-5FCB-8B0A-BC145407F915}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING; safecall;
    function GetResults: IMap_2__HSTRING__HSTRING; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__HSTRING read get_Completed write put_Completed;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Effects.IVideoCompositorDefinition
  Effects_IVideoCompositorDefinition = interface(IInspectable)
  ['{7946B8D0-2010-4AE3-9AB2-2CEF42EDD4D2}']
    function get_ActivatableClassId: HSTRING; safecall;
    function get_Properties: IPropertySet; safecall;
    property ActivatableClassId: HSTRING read get_ActivatableClassId;
    property Properties: IPropertySet read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  }
  // Windows.Media.Editing.IEmbeddedAudioTrack
  [WinRTClassNameAttribute(SEditing_EmbeddedAudioTrack)]
  Editing_IEmbeddedAudioTrack = interface(IInspectable)
  ['{55EE5A7A-2D30-3FBA-A190-4F1A6454F88F}']
    function GetAudioEncodingProperties: IAudioEncodingProperties; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IIterator_1__Editing_IEmbeddedAudioTrack_Base = interface(IInspectable)
  ['{C9FA7F51-B52C-578E-99F9-012CD5641247}']
  end;
  {
  // Used Types:  Windows.Media.Editing.IEmbeddedAudioTrack
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IIterator_1__Editing_IEmbeddedAudioTrack = interface(IIterator_1__Editing_IEmbeddedAudioTrack_Base)
  ['{A457FE75-3D28-5A78-95F9-9A2B79D95994}']
    function get_Current: Editing_IEmbeddedAudioTrack; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEditing_IEmbeddedAudioTrack): Cardinal; safecall;
    property Current: Editing_IEmbeddedAudioTrack read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IIterable_1__Editing_IEmbeddedAudioTrack_Base = interface(IInspectable)
  ['{32FABED0-E1E6-578E-86E5-B4E6ABEB22D6}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IIterable_1__Editing_IEmbeddedAudioTrack = interface(IIterable_1__Editing_IEmbeddedAudioTrack_Base)
  ['{5F1F3071-3D4A-5C50-8D07-85F2DB66F6D1}']
    function First: IIterator_1__Editing_IEmbeddedAudioTrack; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IEmbeddedAudioTrack
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  IVectorView_1__Editing_IEmbeddedAudioTrack = interface(IInspectable)
  ['{4721D1E5-015C-5C79-85A8-384AE06EC54C}']
    function GetAt(index: Cardinal): Editing_IEmbeddedAudioTrack; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Editing_IEmbeddedAudioTrack; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IEmbeddedAudioTrack): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IVideoEffectDefinition>
  IIterator_1__Effects_IVideoEffectDefinition_Base = interface(IInspectable)
  ['{9D82379D-4958-558E-A155-3A809BB16C04}']
  end;
  {
  // Used Types:  Windows.Media.Effects.IVideoEffectDefinition
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IVideoEffectDefinition>
  IIterator_1__Effects_IVideoEffectDefinition = interface(IIterator_1__Effects_IVideoEffectDefinition_Base)
  ['{9D82379D-4958-558E-A155-3A809BB16C04}']
    function get_Current: Effects_IVideoEffectDefinition; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEffects_IVideoEffectDefinition): Cardinal; safecall;
    property Current: Effects_IVideoEffectDefinition read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Effects.IVideoEffectDefinition>
  IIterable_1__Effects_IVideoEffectDefinition_Base = interface(IInspectable)
  ['{EB567F6F-B014-513D-99CD-F16C226C3C41}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Effects.IVideoEffectDefinition>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Effects.IVideoEffectDefinition>
  IIterable_1__Effects_IVideoEffectDefinition = interface(IIterable_1__Effects_IVideoEffectDefinition_Base)
  ['{EB567F6F-B014-513D-99CD-F16C226C3C41}']
    function First: IIterator_1__Effects_IVideoEffectDefinition; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Effects.IVideoEffectDefinition
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Effects.IVideoEffectDefinition>
  IVectorView_1__Effects_IVideoEffectDefinition = interface(IInspectable)
  ['{A44B4F8E-7CA3-53B1-B68B-098BAF45C73E}']
    function GetAt(index: Cardinal): Effects_IVideoEffectDefinition; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Effects_IVideoEffectDefinition; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEffects_IVideoEffectDefinition): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Effects.IVideoEffectDefinition
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Effects.IVideoEffectDefinition>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IVideoEffectDefinition>
  IVector_1__Effects_IVideoEffectDefinition = interface(IInspectable)
  ['{7CA161ED-E201-5615-AACC-25348564F0B3}']
    function GetAt(index: Cardinal): Effects_IVideoEffectDefinition; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Effects_IVideoEffectDefinition; safecall;
    function IndexOf(value: Effects_IVideoEffectDefinition; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Effects_IVideoEffectDefinition); safecall;
    procedure InsertAt(index: Cardinal; value: Effects_IVideoEffectDefinition); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Effects_IVideoEffectDefinition); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEffects_IVideoEffectDefinition): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PEffects_IVideoEffectDefinition); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IEmbeddedAudioTrack>
  // Used Types:  UInt32
  // Used Types:  Double
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IAudioEffectDefinition>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IVideoEffectDefinition>
  }
  // Windows.Media.Editing.IMediaClip
  [WinRTClassNameAttribute(SEditing_MediaClip)]
  Editing_IMediaClip = interface(IInspectable)
  ['{53F25366-5FBA-3EA4-8693-24761811140A}']
    function get_TrimTimeFromStart: TimeSpan; safecall;
    procedure put_TrimTimeFromStart(value: TimeSpan); safecall;
    function get_TrimTimeFromEnd: TimeSpan; safecall;
    procedure put_TrimTimeFromEnd(value: TimeSpan); safecall;
    function get_OriginalDuration: TimeSpan; safecall;
    function get_TrimmedDuration: TimeSpan; safecall;
    function get_UserData: IMap_2__HSTRING__HSTRING; safecall;
    function Clone: Editing_IMediaClip; safecall;
    function get_StartTimeInComposition: TimeSpan; safecall;
    function get_EndTimeInComposition: TimeSpan; safecall;
    function get_EmbeddedAudioTracks: IVectorView_1__Editing_IEmbeddedAudioTrack; safecall;
    function get_SelectedEmbeddedAudioTrackIndex: Cardinal; safecall;
    procedure put_SelectedEmbeddedAudioTrackIndex(value: Cardinal); safecall;
    procedure put_Volume(value: Double); safecall;
    function get_Volume: Double; safecall;
    function GetVideoEncodingProperties: IVideoEncodingProperties; safecall;
    function get_AudioEffectDefinitions: IVector_1__Effects_IAudioEffectDefinition; safecall;
    function get_VideoEffectDefinitions: IVector_1__Effects_IVideoEffectDefinition; safecall;
    property AudioEffectDefinitions: IVector_1__Effects_IAudioEffectDefinition read get_AudioEffectDefinitions;
    property EmbeddedAudioTracks: IVectorView_1__Editing_IEmbeddedAudioTrack read get_EmbeddedAudioTracks;
    property EndTimeInComposition: TimeSpan read get_EndTimeInComposition;
    property OriginalDuration: TimeSpan read get_OriginalDuration;
    property SelectedEmbeddedAudioTrackIndex: Cardinal read get_SelectedEmbeddedAudioTrackIndex write put_SelectedEmbeddedAudioTrackIndex;
    property StartTimeInComposition: TimeSpan read get_StartTimeInComposition;
    property TrimTimeFromEnd: TimeSpan read get_TrimTimeFromEnd write put_TrimTimeFromEnd;
    property TrimTimeFromStart: TimeSpan read get_TrimTimeFromStart write put_TrimTimeFromStart;
    property TrimmedDuration: TimeSpan read get_TrimmedDuration;
    property UserData: IMap_2__HSTRING__HSTRING read get_UserData;
    property VideoEffectDefinitions: IVector_1__Effects_IVideoEffectDefinition read get_VideoEffectDefinitions;
    property Volume: Double read get_Volume write put_Volume;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Double
  // Used Types:  Windows.Media.Editing.IMediaOverlay
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  Boolean
  }
  // Windows.Media.Editing.IMediaOverlay
  [WinRTClassNameAttribute(SEditing_MediaOverlay)]
  Editing_IMediaOverlay = interface(IInspectable)
  ['{A902AE5D-7869-4830-8AB1-94DC01C05FA4}']
    function get_Position: TRectF; safecall;
    procedure put_Position(value: TRectF); safecall;
    procedure put_Delay(value: TimeSpan); safecall;
    function get_Delay: TimeSpan; safecall;
    function get_Opacity: Double; safecall;
    procedure put_Opacity(value: Double); safecall;
    function Clone: Editing_IMediaOverlay; safecall;
    function get_Clip: Editing_IMediaClip; safecall;
    function get_AudioEnabled: Boolean; safecall;
    procedure put_AudioEnabled(value: Boolean); safecall;
    property AudioEnabled: Boolean read get_AudioEnabled write put_AudioEnabled;
    property Clip: Editing_IMediaClip read get_Clip;
    property Delay: TimeSpan read get_Delay write put_Delay;
    property Opacity: Double read get_Opacity write put_Opacity;
    property Position: TRectF read get_Position write put_Position;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface>
  // Used Types:  Windows.Media.IVideoFrame
  // Used Types:  Windows.Media.Editing.IMediaOverlay
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  }
  // Windows.Media.Effects.ICompositeVideoFrameContext
  [WinRTClassNameAttribute(SEffects_CompositeVideoFrameContext)]
  Effects_ICompositeVideoFrameContext = interface(IInspectable)
  ['{6C30024B-F514-4278-A5F7-B9188049D110}']
    function get_SurfacesToOverlay: IVectorView_1__DirectX_Direct3D11_IDirect3DSurface; safecall;
    function get_BackgroundFrame: IVideoFrame; safecall;
    function get_OutputFrame: IVideoFrame; safecall;
    function GetOverlayForSurface(surfaceToOverlay: DirectX_Direct3D11_IDirect3DSurface): Editing_IMediaOverlay; safecall;
    property BackgroundFrame: IVideoFrame read get_BackgroundFrame;
    property OutputFrame: IVideoFrame read get_OutputFrame;
    property SurfacesToOverlay: IVectorView_1__DirectX_Direct3D11_IDirect3DSurface read get_SurfacesToOverlay;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaClip>
  IIterator_1__Editing_IMediaClip_Base = interface(IInspectable)
  ['{2DFD20B2-06D8-577D-AB06-771E0414FC00}']
  end;
  {
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaClip>
  IIterator_1__Editing_IMediaClip = interface(IIterator_1__Editing_IMediaClip_Base)
  ['{54A2E07F-5DD7-53AF-93B7-E4BB8AF40D71}']
    function get_Current: Editing_IMediaClip; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEditing_IMediaClip): Cardinal; safecall;
    property Current: Editing_IMediaClip read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaClip>
  IIterable_1__Editing_IMediaClip_Base = interface(IInspectable)
  ['{FF2E9B5C-26D0-575D-A3EB-7D938BD16F17}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaClip>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaClip>
  IIterable_1__Editing_IMediaClip = interface(IIterable_1__Editing_IMediaClip_Base)
  ['{A31E1D08-4635-56A2-834D-D628D7EAA025}']
    function First: IIterator_1__Editing_IMediaClip; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaClip>
  IVectorView_1__Editing_IMediaClip = interface(IInspectable)
  ['{92688D76-BA1C-54AF-93A3-34F4D307E8B0}']
    function GetAt(index: Cardinal): Editing_IMediaClip; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Editing_IMediaClip; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IMediaClip): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaClip>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaClip>
  IVector_1__Editing_IMediaClip = interface(IInspectable)
  ['{93C531EC-879C-51F1-9425-BB736DAB7576}']
    function GetAt(index: Cardinal): Editing_IMediaClip; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Editing_IMediaClip; safecall;
    function IndexOf(value: Editing_IMediaClip; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Editing_IMediaClip); safecall;
    procedure InsertAt(index: Cardinal; value: Editing_IMediaClip); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Editing_IMediaClip); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IMediaClip): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PEditing_IMediaClip); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  // Used Types:  Double
  // Used Types:  Windows.Media.Editing.IBackgroundAudioTrack
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Effects.IAudioEffectDefinition>
  }
  // Windows.Media.Editing.IBackgroundAudioTrack
  [WinRTClassNameAttribute(SEditing_BackgroundAudioTrack)]
  Editing_IBackgroundAudioTrack = interface(IInspectable)
  ['{4B91B3BD-9E21-4266-A9C2-67DD011A2357}']
    function get_TrimTimeFromStart: TimeSpan; safecall;
    procedure put_TrimTimeFromStart(value: TimeSpan); safecall;
    function get_TrimTimeFromEnd: TimeSpan; safecall;
    procedure put_TrimTimeFromEnd(value: TimeSpan); safecall;
    function get_OriginalDuration: TimeSpan; safecall;
    function get_TrimmedDuration: TimeSpan; safecall;
    function get_UserData: IMap_2__HSTRING__HSTRING; safecall;
    procedure put_Delay(value: TimeSpan); safecall;
    function get_Delay: TimeSpan; safecall;
    procedure put_Volume(value: Double); safecall;
    function get_Volume: Double; safecall;
    function Clone: Editing_IBackgroundAudioTrack; safecall;
    function GetAudioEncodingProperties: IAudioEncodingProperties; safecall;
    function get_AudioEffectDefinitions: IVector_1__Effects_IAudioEffectDefinition; safecall;
    property AudioEffectDefinitions: IVector_1__Effects_IAudioEffectDefinition read get_AudioEffectDefinitions;
    property Delay: TimeSpan read get_Delay write put_Delay;
    property OriginalDuration: TimeSpan read get_OriginalDuration;
    property TrimTimeFromEnd: TimeSpan read get_TrimTimeFromEnd write put_TrimTimeFromEnd;
    property TrimTimeFromStart: TimeSpan read get_TrimTimeFromStart write put_TrimTimeFromStart;
    property TrimmedDuration: TimeSpan read get_TrimmedDuration;
    property UserData: IMap_2__HSTRING__HSTRING read get_UserData;
    property Volume: Double read get_Volume write put_Volume;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IIterator_1__Editing_IBackgroundAudioTrack_Base = interface(IInspectable)
  ['{18B0F692-8635-577A-9EFA-CB904770D6E5}']
  end;
  {
  // Used Types:  Windows.Media.Editing.IBackgroundAudioTrack
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IIterator_1__Editing_IBackgroundAudioTrack = interface(IIterator_1__Editing_IBackgroundAudioTrack_Base)
  ['{173F9DCA-3476-5BDF-9C49-1537141B20E3}']
    function get_Current: Editing_IBackgroundAudioTrack; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEditing_IBackgroundAudioTrack): Cardinal; safecall;
    property Current: Editing_IBackgroundAudioTrack read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IIterable_1__Editing_IBackgroundAudioTrack_Base = interface(IInspectable)
  ['{3FC05BA2-30F6-5219-9047-1197FFAE8DBA}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IBackgroundAudioTrack>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IIterable_1__Editing_IBackgroundAudioTrack = interface(IIterable_1__Editing_IBackgroundAudioTrack_Base)
  ['{184B8107-785C-5344-A12D-4473A05EA38A}']
    function First: IIterator_1__Editing_IBackgroundAudioTrack; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IBackgroundAudioTrack
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IVectorView_1__Editing_IBackgroundAudioTrack = interface(IInspectable)
  ['{9EAAB854-FB6A-5F88-AF6F-EF8FB492B659}']
    function GetAt(index: Cardinal): Editing_IBackgroundAudioTrack; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Editing_IBackgroundAudioTrack; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IBackgroundAudioTrack): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IBackgroundAudioTrack
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IBackgroundAudioTrack>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IVector_1__Editing_IBackgroundAudioTrack = interface(IInspectable)
  ['{58EF15C7-96DE-5D00-8042-2F99F62379E1}']
    function GetAt(index: Cardinal): Editing_IBackgroundAudioTrack; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Editing_IBackgroundAudioTrack; safecall;
    function IndexOf(value: Editing_IBackgroundAudioTrack; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Editing_IBackgroundAudioTrack); safecall;
    procedure InsertAt(index: Cardinal; value: Editing_IBackgroundAudioTrack); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Editing_IBackgroundAudioTrack); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IBackgroundAudioTrack): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PEditing_IBackgroundAudioTrack); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double_Delegate_Base = interface(IUnknown)
  ['{009C6245-0E59-53B0-9FD2-D250E45A00A3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  // Used Types:  Double
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double = interface(AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double_Delegate_Base)
  ['{E309A77A-10C5-5333-B24D-E22BBA8A53EC}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double; progressInfo: Double); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double_Delegate_Base = interface(IUnknown)
  ['{080F1890-4FCA-5165-A989-4B07DA8E0B53}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double = interface(AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double_Delegate_Base)
  ['{77A9A9A2-F0FC-51B8-8B0B-20EA78F25D9A}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double_Base = interface(IInspectable)
  ['{272EEC20-4B64-5D53-A644-F9917B3D19D8}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  // Used Types:  Windows.Media.Transcoding.TranscodeFailureReason
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double = interface(IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double_Base)
  ['{171791B3-C620-58EC-AF24-5C4B14F6FA1C}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double; safecall;
    function GetResults: Transcoding_TranscodeFailureReason; safecall;
    property Progress: AsyncOperationProgressHandler_2__Transcoding_TranscodeFailureReason__Double read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Transcoding_TranscodeFailureReason__Double read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.MediaStreamSourceClosedReason
  }
  // Windows.Media.Core.IMediaStreamSourceClosedRequest
  [WinRTClassNameAttribute(SCore_MediaStreamSourceClosedRequest)]
  Core_IMediaStreamSourceClosedRequest = interface(IInspectable)
  ['{907C00E9-18A3-4951-887A-2C1EEBD5C69E}']
    function get_Reason: Core_MediaStreamSourceClosedReason; safecall;
    property Reason: Core_MediaStreamSourceClosedReason read get_Reason;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSourceClosedRequest
  }
  // Windows.Media.Core.IMediaStreamSourceClosedEventArgs
  [WinRTClassNameAttribute(SCore_MediaStreamSourceClosedEventArgs)]
  Core_IMediaStreamSourceClosedEventArgs = interface(IInspectable)
  ['{CD8C7EB2-4816-4E24-88F0-491EF7386406}']
    function get_Request: Core_IMediaStreamSourceClosedRequest; safecall;
    property Request: Core_IMediaStreamSourceClosedRequest read get_Request;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceClosedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs_Delegate_Base = interface(IUnknown)
  ['{238CC251-D0B8-5A34-81D4-0DD1F936A20D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMediaStreamSourceClosedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceClosedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs = interface(TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs_Delegate_Base)
  ['{F0F13B5A-50DC-5917-918A-5D5D9D6BA876}']
    procedure Invoke(sender: Core_IMediaStreamSource; args: Core_IMediaStreamSourceClosedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Core.IMediaStreamSourceStartingRequestDeferral
  [WinRTClassNameAttribute(SCore_MediaStreamSourceStartingRequestDeferral)]
  Core_IMediaStreamSourceStartingRequestDeferral = interface(IInspectable)
  ['{3F1356A5-6340-4DC4-9910-068ED9F598F8}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Media.Core.IMediaStreamSourceStartingRequestDeferral
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Core.IMediaStreamSourceStartingRequest
  [WinRTClassNameAttribute(SCore_MediaStreamSourceStartingRequest)]
  Core_IMediaStreamSourceStartingRequest = interface(IInspectable)
  ['{2A9093E4-35C4-4B1B-A791-0D99DB56DD1D}']
    function get_StartPosition: IReference_1__TimeSpan; safecall;
    function GetDeferral: Core_IMediaStreamSourceStartingRequestDeferral; safecall;
    procedure SetActualStartPosition(position: TimeSpan); safecall;
    property StartPosition: IReference_1__TimeSpan read get_StartPosition;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSourceStartingRequest
  }
  // Windows.Media.Core.IMediaStreamSourceStartingEventArgs
  [WinRTClassNameAttribute(SCore_MediaStreamSourceStartingEventArgs)]
  Core_IMediaStreamSourceStartingEventArgs = interface(IInspectable)
  ['{F41468F2-C274-4940-A5BB-28A572452FA7}']
    function get_Request: Core_IMediaStreamSourceStartingRequest; safecall;
    property Request: Core_IMediaStreamSourceStartingRequest read get_Request;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceStartingEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs_Delegate_Base = interface(IUnknown)
  ['{A93D5846-C660-586E-B6B5-A52FB81F9240}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMediaStreamSourceStartingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceStartingEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs = interface(TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs_Delegate_Base)
  ['{0606F8AF-9EB8-5EC1-B4CE-8336AF9F5167}']
    procedure Invoke(sender: Core_IMediaStreamSource; args: Core_IMediaStreamSourceStartingEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Object>
  TypedEventHandler_2__Core_IMediaStreamSource__IInspectable_Delegate_Base = interface(IUnknown)
  ['{6FD6DED7-421B-5EF5-8BF5-EDEA45401665}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Object>
  TypedEventHandler_2__Core_IMediaStreamSource__IInspectable = interface(TypedEventHandler_2__Core_IMediaStreamSource__IInspectable_Delegate_Base)
  ['{1BF402DC-E381-5B37-908F-18E15AA67651}']
    procedure Invoke(sender: Core_IMediaStreamSource; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  }
  // Windows.Media.Core.IMediaStreamDescriptor
  Core_IMediaStreamDescriptor = interface(IInspectable)
  ['{80F16E6E-92F7-451E-97D2-AFD80742DA70}']
    function get_IsSelected: Boolean; safecall;
    procedure put_Name(value: HSTRING); safecall;
    function get_Name: HSTRING; safecall;
    procedure put_Language(value: HSTRING); safecall;
    function get_Language: HSTRING; safecall;
    property IsSelected: Boolean read get_IsSelected;
    property Language: HSTRING read get_Language write put_Language;
    property Name: HSTRING read get_Name write put_Name;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Core.IMediaStreamSourceSampleRequestDeferral
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSampleRequestDeferral)]
  Core_IMediaStreamSourceSampleRequestDeferral = interface(IInspectable)
  ['{7895CC02-F982-43C8-9D16-C62D999319BE}']
    procedure Complete; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSample,Object>
  TypedEventHandler_2__Core_IMediaStreamSample__IInspectable_Delegate_Base = interface(IUnknown)
  ['{D4DC5EF1-C1CB-5C32-803D-F2F9A7AD9916}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSample
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSample,Object>
  TypedEventHandler_2__Core_IMediaStreamSample__IInspectable = interface(TypedEventHandler_2__Core_IMediaStreamSample__IInspectable_Delegate_Base)
  ['{BD57C7BA-B003-53E5-B88B-461AB65C4BA9}']
    procedure Invoke(sender: Core_IMediaStreamSample; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Media.Core.IMediaStreamSampleProtectionProperties
  [WinRTClassNameAttribute(SCore_MediaStreamSampleProtectionProperties)]
  Core_IMediaStreamSampleProtectionProperties = interface(IInspectable)
  ['{4EB88292-ECDF-493E-841D-DD4ADD7CACA2}']
    procedure SetKeyIdentifier(valueSize: Cardinal; value: PByte); safecall;
    procedure GetKeyIdentifier(valueSize: Cardinal; value: PByte); safecall;
    procedure SetInitializationVector(valueSize: Cardinal; value: PByte); safecall;
    procedure GetInitializationVector(valueSize: Cardinal; value: PByte); safecall;
    procedure SetSubSampleMapping(valueSize: Cardinal; value: PByte); safecall;
    procedure GetSubSampleMapping(valueSize: Cardinal; value: PByte); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSample,Object>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Collections.IMap`2<Guid,Object>
  // Used Types:  Windows.Media.Core.IMediaStreamSampleProtectionProperties
  // Used Types:  Boolean
  }
  // Windows.Media.Core.IMediaStreamSample
  [WinRTClassNameAttribute(SCore_MediaStreamSample)]
  Core_IMediaStreamSample = interface(IInspectable)
  ['{5C8DB627-4B80-4361-9837-6CB7481AD9D6}']
    function add_Processed(handler: TypedEventHandler_2__Core_IMediaStreamSample__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Processed(token: EventRegistrationToken); safecall;
    function get_Buffer: IBuffer; safecall;
    function get_Timestamp: TimeSpan; safecall;
    function get_ExtendedProperties: IMap_2__TGuid__IInspectable; safecall;
    function get_Protection: Core_IMediaStreamSampleProtectionProperties; safecall;
    procedure put_DecodeTimestamp(value: TimeSpan); safecall;
    function get_DecodeTimestamp: TimeSpan; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    function get_Duration: TimeSpan; safecall;
    procedure put_KeyFrame(value: Boolean); safecall;
    function get_KeyFrame: Boolean; safecall;
    procedure put_Discontinuous(value: Boolean); safecall;
    function get_Discontinuous: Boolean; safecall;
    property Buffer: IBuffer read get_Buffer;
    property DecodeTimestamp: TimeSpan read get_DecodeTimestamp write put_DecodeTimestamp;
    property Discontinuous: Boolean read get_Discontinuous write put_Discontinuous;
    property Duration: TimeSpan read get_Duration write put_Duration;
    property ExtendedProperties: IMap_2__TGuid__IInspectable read get_ExtendedProperties;
    property KeyFrame: Boolean read get_KeyFrame write put_KeyFrame;
    property Protection: Core_IMediaStreamSampleProtectionProperties read get_Protection;
    property Timestamp: TimeSpan read get_Timestamp;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamDescriptor
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSampleRequestDeferral
  // Used Types:  Windows.Media.Core.IMediaStreamSample
  // Used Types:  UInt32
  }
  // Windows.Media.Core.IMediaStreamSourceSampleRequest
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSampleRequest)]
  Core_IMediaStreamSourceSampleRequest = interface(IInspectable)
  ['{4DB341A9-3501-4D9B-83F9-8F235C822532}']
    function get_StreamDescriptor: Core_IMediaStreamDescriptor; safecall;
    function GetDeferral: Core_IMediaStreamSourceSampleRequestDeferral; safecall;
    procedure put_Sample(value: Core_IMediaStreamSample); safecall;
    function get_Sample: Core_IMediaStreamSample; safecall;
    procedure ReportSampleProgress(progress: Cardinal); safecall;
    property Sample: Core_IMediaStreamSample read get_Sample write put_Sample;
    property StreamDescriptor: Core_IMediaStreamDescriptor read get_StreamDescriptor;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSampleRequest
  }
  // Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSampleRequestedEventArgs)]
  Core_IMediaStreamSourceSampleRequestedEventArgs = interface(IInspectable)
  ['{10F9BB9E-71C5-492F-847F-0DA1F35E81F8}']
    function get_Request: Core_IMediaStreamSourceSampleRequest; safecall;
    property Request: Core_IMediaStreamSourceSampleRequest read get_Request;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{4F1A3AE3-B8B7-5689-901D-B0B623F5A172}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs = interface(TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs_Delegate_Base)
  ['{6855C107-2EAB-5A68-9B38-A6D67F3A2E7A}']
    procedure Invoke(sender: Core_IMediaStreamSource; args: Core_IMediaStreamSourceSampleRequestedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestDeferral
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSwitchStreamsRequestDeferral)]
  Core_IMediaStreamSourceSwitchStreamsRequestDeferral = interface(IInspectable)
  ['{BEE3D835-A505-4F9A-B943-2B8CB1B4BBD9}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamDescriptor
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestDeferral
  }
  // Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequest
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSwitchStreamsRequest)]
  Core_IMediaStreamSourceSwitchStreamsRequest = interface(IInspectable)
  ['{41B8808E-38A9-4EC3-9BA0-B69B85501E90}']
    function get_OldStreamDescriptor: Core_IMediaStreamDescriptor; safecall;
    function get_NewStreamDescriptor: Core_IMediaStreamDescriptor; safecall;
    function GetDeferral: Core_IMediaStreamSourceSwitchStreamsRequestDeferral; safecall;
    property NewStreamDescriptor: Core_IMediaStreamDescriptor read get_NewStreamDescriptor;
    property OldStreamDescriptor: Core_IMediaStreamDescriptor read get_OldStreamDescriptor;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequest
  }
  // Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSwitchStreamsRequestedEventArgs)]
  Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs = interface(IInspectable)
  ['{42202B72-6EA1-4677-981E-350A0DA412AA}']
    function get_Request: Core_IMediaStreamSourceSwitchStreamsRequest; safecall;
    property Request: Core_IMediaStreamSourceSwitchStreamsRequest read get_Request;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{452B2E4A-5511-5B3C-8A8E-EE659576A4C1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs = interface(TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs_Delegate_Base)
  ['{34AD4DE5-88FC-5ADE-8503-AC4AEAF03332}']
    procedure Invoke(sender: Core_IMediaStreamSource; args: Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Guid
  }
  // Windows.Media.Protection.IMediaProtectionServiceRequest
  Protection_IMediaProtectionServiceRequest = interface(IInspectable)
  ['{B1DE0EA6-2094-478D-87A4-8B95200F85C6}']
    function get_ProtectionSystem: TGuid; safecall;
    function get_Type: TGuid; safecall;
    property ProtectionSystem: TGuid read get_ProtectionSystem;
    property &Type: TGuid read get_Type;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.Protection.IMediaProtectionServiceCompletion
  Protection_IMediaProtectionServiceCompletion = interface(IInspectable)
  ['{8B5CCA18-CFD5-44EE-A2ED-DF76010C14B5}']
    procedure Complete(success: Boolean); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IMediaProtectionServiceRequest
  // Used Types:  Windows.Media.Protection.IMediaProtectionServiceCompletion
  }
  // Windows.Media.Protection.IServiceRequestedEventArgs
  Protection_IServiceRequestedEventArgs = interface(IInspectable)
  ['{34283BAF-ABB4-4FC1-BD89-93F106573A49}']
    function get_Request: Protection_IMediaProtectionServiceRequest; safecall;
    function get_Completion: Protection_IMediaProtectionServiceCompletion; safecall;
    property Completion: Protection_IMediaProtectionServiceCompletion read get_Completion;
    property Request: Protection_IMediaProtectionServiceRequest read get_Request;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IMediaProtectionManager
  // Used Types:  Windows.Media.Protection.IServiceRequestedEventArgs
  }
  // Windows.Media.Protection.ServiceRequestedEventHandler
  Protection_ServiceRequestedEventHandler = interface(IUnknown)
  ['{D2D690BA-CAC9-48E1-95C0-D38495A84055}']
    procedure Invoke(sender: Protection_IMediaProtectionManager; e: Protection_IServiceRequestedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IMediaProtectionManager
  }
  // Windows.Media.Protection.RebootNeededEventHandler
  Protection_RebootNeededEventHandler = interface(IUnknown)
  ['{64E12A45-973B-4A3A-B260-91898A49A82C}']
    procedure Invoke(sender: Protection_IMediaProtectionManager); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.RevocationAndRenewalReasons
  // Used Types:  String
  }
  // Windows.Media.Protection.IRevocationAndRenewalItem
  Protection_IRevocationAndRenewalItem = interface(IInspectable)
  ['{3099C20C-3CF0-49EA-902D-CAF32D2DDE2C}']
    function get_Reasons: Protection_RevocationAndRenewalReasons; safecall;
    function get_HeaderHash: HSTRING; safecall;
    function get_PublicKeyHash: HSTRING; safecall;
    function get_Name: HSTRING; safecall;
    function get_RenewalId: HSTRING; safecall;
    property HeaderHash: HSTRING read get_HeaderHash;
    property Name: HSTRING read get_Name;
    property PublicKeyHash: HSTRING read get_PublicKeyHash;
    property Reasons: Protection_RevocationAndRenewalReasons read get_Reasons;
    property RenewalId: HSTRING read get_RenewalId;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IIterator_1__Protection_IRevocationAndRenewalItem_Base = interface(IInspectable)
  ['{DFB9655C-8B22-511F-8EAF-3AEA7521802B}']
  end;
  {
  // Used Types:  Windows.Media.Protection.IRevocationAndRenewalItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IIterator_1__Protection_IRevocationAndRenewalItem = interface(IIterator_1__Protection_IRevocationAndRenewalItem_Base)
  ['{62F023AD-7A84-5466-A851-7B69A759D36B}']
    function get_Current: Protection_IRevocationAndRenewalItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PProtection_IRevocationAndRenewalItem): Cardinal; safecall;
    property Current: Protection_IRevocationAndRenewalItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IIterable_1__Protection_IRevocationAndRenewalItem_Base = interface(IInspectable)
  ['{07015868-578C-556B-8A35-4039A35D1D92}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IIterable_1__Protection_IRevocationAndRenewalItem = interface(IIterable_1__Protection_IRevocationAndRenewalItem_Base)
  ['{23A7F493-CFD9-560C-BD1B-20B09C32CF96}']
    function First: IIterator_1__Protection_IRevocationAndRenewalItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IRevocationAndRenewalItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IVectorView_1__Protection_IRevocationAndRenewalItem = interface(IInspectable)
  ['{D4BED0AA-0377-58AB-829C-201E1283ABBE}']
    function GetAt(index: Cardinal): Protection_IRevocationAndRenewalItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Protection_IRevocationAndRenewalItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PProtection_IRevocationAndRenewalItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IRevocationAndRenewalItem
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  IVector_1__Protection_IRevocationAndRenewalItem = interface(IInspectable)
  ['{982757F8-7839-5622-B031-72D79B5C1684}']
    function GetAt(index: Cardinal): Protection_IRevocationAndRenewalItem; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Protection_IRevocationAndRenewalItem; safecall;
    function IndexOf(value: Protection_IRevocationAndRenewalItem; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Protection_IRevocationAndRenewalItem); safecall;
    procedure InsertAt(index: Cardinal; value: Protection_IRevocationAndRenewalItem); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Protection_IRevocationAndRenewalItem); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PProtection_IRevocationAndRenewalItem): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PProtection_IRevocationAndRenewalItem); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Protection.IRevocationAndRenewalItem>
  }
  // Windows.Media.Protection.IRevocationAndRenewalInformation
  Protection_IRevocationAndRenewalInformation = interface(IInspectable)
  ['{F3A1937B-2501-439E-A6E7-6FC95E175FCF}']
    function get_Items: IVector_1__Protection_IRevocationAndRenewalItem; safecall;
    property Items: IVector_1__Protection_IRevocationAndRenewalItem read get_Items;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IRevocationAndRenewalInformation
  // Used Types:  Windows.Media.Protection.IMediaProtectionServiceCompletion
  }
  // Windows.Media.Protection.IComponentLoadFailedEventArgs
  Protection_IComponentLoadFailedEventArgs = interface(IInspectable)
  ['{95972E93-7746-417E-8495-F031BBC5862C}']
    function get_Information: Protection_IRevocationAndRenewalInformation; safecall;
    function get_Completion: Protection_IMediaProtectionServiceCompletion; safecall;
    property Completion: Protection_IMediaProtectionServiceCompletion read get_Completion;
    property Information: Protection_IRevocationAndRenewalInformation read get_Information;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IMediaProtectionManager
  // Used Types:  Windows.Media.Protection.IComponentLoadFailedEventArgs
  }
  // Windows.Media.Protection.ComponentLoadFailedEventHandler
  Protection_ComponentLoadFailedEventHandler = interface(IUnknown)
  ['{95DA643C-6DB9-424B-86CA-091AF432081C}']
    procedure Invoke(sender: Protection_IMediaProtectionManager; e: Protection_IComponentLoadFailedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Media.Protection.ServiceRequestedEventHandler
  // Used Types:  Windows.Media.Protection.RebootNeededEventHandler
  // Used Types:  Windows.Media.Protection.ComponentLoadFailedEventHandler
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Protection.IMediaProtectionManager
  Protection_IMediaProtectionManager = interface(IInspectable)
  ['{45694947-C741-434B-A79E-474C12D93D2F}']
    function add_ServiceRequested(handler: Protection_ServiceRequestedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ServiceRequested(cookie: EventRegistrationToken); safecall;
    function add_RebootNeeded(handler: Protection_RebootNeededEventHandler): EventRegistrationToken; safecall;
    procedure remove_RebootNeeded(cookie: EventRegistrationToken); safecall;
    function add_ComponentLoadFailed(handler: Protection_ComponentLoadFailedEventHandler): EventRegistrationToken; safecall;
    procedure remove_ComponentLoadFailed(cookie: EventRegistrationToken); safecall;
    function get_Properties: IPropertySet; safecall;
    property Properties: IPropertySet read get_Properties;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable = interface(IUnknown)
  ['{7344F356-8399-5756-A2F8-ABD50C4146FF}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMap_2__HSTRING__IInspectable; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,Object>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IMap`2<String,Object>>
  IAsyncOperation_1__IMap_2__HSTRING__IInspectable = interface(IInspectable)
  ['{127E39C7-07C1-58E5-B48E-3A4729839FEC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable; safecall;
    function GetResults: IMap_2__HSTRING__IInspectable; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMap_2__HSTRING__IInspectable read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceClosedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceStartingEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs>
  // Used Types:  Windows.Media.Core.MediaStreamSourceErrorStatus
  // Used Types:  Windows.Media.Core.IMediaStreamDescriptor
  // Used Types:  Windows.Media.Protection.IMediaProtectionManager
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.FileProperties.IMusicProperties
  // Used Types:  Windows.Storage.FileProperties.IVideoProperties
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  UInt8
  }
  // Windows.Media.Core.IMediaStreamSource
  [WinRTClassNameAttribute(SCore_MediaStreamSource)]
  Core_IMediaStreamSource = interface(IInspectable)
  ['{3712D543-45EB-4138-AA62-C01E26F3843F}']
    function add_Closed(handler: TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceClosedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    function add_Starting(handler: TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceStartingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Starting(token: EventRegistrationToken); safecall;
    function add_Paused(handler: TypedEventHandler_2__Core_IMediaStreamSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Paused(token: EventRegistrationToken); safecall;
    function add_SampleRequested(handler: TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SampleRequested(token: EventRegistrationToken); safecall;
    function add_SwitchStreamsRequested(handler: TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSwitchStreamsRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SwitchStreamsRequested(token: EventRegistrationToken); safecall;
    procedure NotifyError(errorStatus: Core_MediaStreamSourceErrorStatus); safecall;
    procedure AddStreamDescriptor(descriptor: Core_IMediaStreamDescriptor); safecall;
    procedure put_MediaProtectionManager(value: Protection_IMediaProtectionManager); safecall;
    function get_MediaProtectionManager: Protection_IMediaProtectionManager; safecall;
    procedure put_Duration(value: TimeSpan); safecall;
    function get_Duration: TimeSpan; safecall;
    procedure put_CanSeek(value: Boolean); safecall;
    function get_CanSeek: Boolean; safecall;
    procedure put_BufferTime(value: TimeSpan); safecall;
    function get_BufferTime: TimeSpan; safecall;
    procedure SetBufferedRange(startOffset: TimeSpan; endOffset: TimeSpan); safecall;
    function get_MusicProperties: FileProperties_IMusicProperties; safecall;
    function get_VideoProperties: FileProperties_IVideoProperties; safecall;
    procedure put_Thumbnail(value: IRandomAccessStreamReference); safecall;
    function get_Thumbnail: IRandomAccessStreamReference; safecall;
    procedure AddProtectionKey(streamDescriptor: Core_IMediaStreamDescriptor; keyIdentifierSize: Cardinal; keyIdentifier: PByte; licenseData: Byte); safecall;
    property BufferTime: TimeSpan read get_BufferTime write put_BufferTime;
    property CanSeek: Boolean read get_CanSeek write put_CanSeek;
    property Duration: TimeSpan read get_Duration write put_Duration;
    property MediaProtectionManager: Protection_IMediaProtectionManager read get_MediaProtectionManager write put_MediaProtectionManager;
    property MusicProperties: FileProperties_IMusicProperties read get_MusicProperties;
    property Thumbnail: IRandomAccessStreamReference read get_Thumbnail write put_Thumbnail;
    property VideoProperties: FileProperties_IVideoProperties read get_VideoProperties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaClip>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IBackgroundAudioTrack>
  // Used Types:  Windows.Foundation.Collections.IMap`2<String,String>
  // Used Types:  Windows.Media.Editing.IMediaComposition
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>
  // Used Types:  Int32
  // Used Types:  Windows.Media.Editing.VideoFramePrecision
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Storage.Streams.IRandomAccessStreamWithContentType>>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Transcoding.TranscodeFailureReason,Double>
  // Used Types:  Windows.Media.Editing.MediaTrimmingPreference
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  }
  // Windows.Media.Editing.IMediaComposition
  [WinRTClassNameAttribute(SEditing_MediaComposition)]
  Editing_IMediaComposition = interface(IInspectable)
  ['{2E06E605-DC71-41D6-B837-2D2BC14A2947}']
    function get_Duration: TimeSpan; safecall;
    function get_Clips: IVector_1__Editing_IMediaClip; safecall;
    function get_BackgroundAudioTracks: IVector_1__Editing_IBackgroundAudioTrack; safecall;
    function get_UserData: IMap_2__HSTRING__HSTRING; safecall;
    function Clone: Editing_IMediaComposition; safecall;
    function SaveAsync(&file: IStorageFile): IAsyncAction; safecall;
    function GetThumbnailAsync(timeFromStart: TimeSpan; scaledWidth: Integer; scaledHeight: Integer; framePrecision: Editing_VideoFramePrecision): IAsyncOperation_1__IRandomAccessStreamWithContentType; safecall;
    function GetThumbnailsAsync(timesFromStart: IIterable_1__TimeSpan; scaledWidth: Integer; scaledHeight: Integer; framePrecision: Editing_VideoFramePrecision): IAsyncOperation_1__IVectorView_1__IRandomAccessStreamWithContentType; safecall;
    function RenderToFileAsync(destination: IStorageFile): IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double; overload; safecall;
    function RenderToFileAsync(destination: IStorageFile; trimmingPreference: Editing_MediaTrimmingPreference): IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double; overload; safecall;
    function RenderToFileAsync(destination: IStorageFile; trimmingPreference: Editing_MediaTrimmingPreference; encodingProfile: IMediaEncodingProfile): IAsyncOperationWithProgress_2__Transcoding_TranscodeFailureReason__Double; overload; safecall;
    function CreateDefaultEncodingProfile: IMediaEncodingProfile; safecall;
    function GenerateMediaStreamSource: Core_IMediaStreamSource; overload; safecall;
    function GenerateMediaStreamSource(encodingProfile: IMediaEncodingProfile): Core_IMediaStreamSource; overload; safecall;
    function GeneratePreviewMediaStreamSource(scaledWidth: Integer; scaledHeight: Integer): Core_IMediaStreamSource; safecall;
    property BackgroundAudioTracks: IVector_1__Editing_IBackgroundAudioTrack read get_BackgroundAudioTracks;
    property Clips: IVector_1__Editing_IMediaClip read get_Clips;
    property Duration: TimeSpan read get_Duration;
    property UserData: IMap_2__HSTRING__HSTRING read get_UserData;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaClip>
  AsyncOperationCompletedHandler_1__Editing_IMediaClip_Delegate_Base = interface(IUnknown)
  ['{60CDE3BC-119F-50A8-9CCB-9EA57EA96BFD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaClip>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaClip>
  AsyncOperationCompletedHandler_1__Editing_IMediaClip = interface(AsyncOperationCompletedHandler_1__Editing_IMediaClip_Delegate_Base)
  ['{0FED90DA-8827-5E5B-B4C0-2EC4702BA0A2}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Editing_IMediaClip; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaClip>
  IAsyncOperation_1__Editing_IMediaClip_Base = interface(IInspectable)
  ['{B5E699DD-B6F1-51C0-B752-E02FA0068D79}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaClip>
  // Used Types:  Windows.Media.Editing.IMediaClip
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaClip>
  IAsyncOperation_1__Editing_IMediaClip = interface(IAsyncOperation_1__Editing_IMediaClip_Base)
  ['{6373D8BB-AB90-52A3-95CF-E72CB440E719}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Editing_IMediaClip); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Editing_IMediaClip; safecall;
    function GetResults: Editing_IMediaClip; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Editing_IMediaClip read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  Windows.UI.Color
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaClip>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Media.Editing.IMediaClipStatics
  [WinRTClassNameAttribute(SEditing_MediaClip)]
  Editing_IMediaClipStatics = interface(IInspectable)
  ['{FA402B68-928F-43C4-BC6E-783A1A359656}']
    function CreateFromColor(color: Color; originalDuration: TimeSpan): Editing_IMediaClip; safecall;
    function CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IMediaClip; safecall;
    function CreateFromImageFileAsync(&file: IStorageFile; originalDuration: TimeSpan): IAsyncOperation_1__Editing_IMediaClip; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Editing.IMediaClipStatics2
  [WinRTClassNameAttribute(SEditing_MediaClip)]
  Editing_IMediaClipStatics2 = interface(IInspectable)
  ['{5B1DD7B3-854E-4D9B-877D-4774A556CD12}']
    function CreateFromSurface(surface: DirectX_Direct3D11_IDirect3DSurface; originalDuration: TimeSpan): Editing_IMediaClip; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaComposition>
  AsyncOperationCompletedHandler_1__Editing_IMediaComposition_Delegate_Base = interface(IUnknown)
  ['{EDD253F8-4EBD-56E5-9592-3C09375EBDC4}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaComposition>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaComposition>
  AsyncOperationCompletedHandler_1__Editing_IMediaComposition = interface(AsyncOperationCompletedHandler_1__Editing_IMediaComposition_Delegate_Base)
  ['{BB7FB79A-2314-5A6F-848C-65EA5C7B1644}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Editing_IMediaComposition; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaComposition>
  IAsyncOperation_1__Editing_IMediaComposition_Base = interface(IInspectable)
  ['{E170E898-D11F-5054-AB13-1080A4807636}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IMediaComposition>
  // Used Types:  Windows.Media.Editing.IMediaComposition
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaComposition>
  IAsyncOperation_1__Editing_IMediaComposition = interface(IAsyncOperation_1__Editing_IMediaComposition_Base)
  ['{B9DC8FAB-58C7-593D-B549-41CAF1DFD880}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Editing_IMediaComposition); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Editing_IMediaComposition; safecall;
    function GetResults: Editing_IMediaComposition; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Editing_IMediaComposition read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IMediaComposition>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Media.Editing.IMediaCompositionStatics
  [WinRTClassNameAttribute(SEditing_MediaComposition)]
  Editing_IMediaCompositionStatics = interface(IInspectable)
  ['{87A08F04-E32A-45CE-8F66-A30DF0766224}']
    function LoadAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IMediaComposition; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IBackgroundAudioTrack>
  AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack_Delegate_Base = interface(IUnknown)
  ['{B8830BC7-188B-5C25-A3BB-959052BCB740}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IBackgroundAudioTrack>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IBackgroundAudioTrack>
  AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack = interface(AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack_Delegate_Base)
  ['{57CC5E94-B2B8-5666-993A-B37AE6A9DDED}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Editing_IBackgroundAudioTrack; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IAsyncOperation_1__Editing_IBackgroundAudioTrack_Base = interface(IInspectable)
  ['{493DC898-6076-55F5-AB84-CCF973AC0397}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Editing.IBackgroundAudioTrack>
  // Used Types:  Windows.Media.Editing.IBackgroundAudioTrack
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IBackgroundAudioTrack>
  IAsyncOperation_1__Editing_IBackgroundAudioTrack = interface(IAsyncOperation_1__Editing_IBackgroundAudioTrack_Base)
  ['{84D9CB85-B036-5B3E-BC65-B3CAC9EC8825}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack; safecall;
    function GetResults: Editing_IBackgroundAudioTrack; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Editing_IBackgroundAudioTrack read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IBackgroundAudioTrack
  // Used Types:  Windows.Media.Editing.IEmbeddedAudioTrack
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Editing.IBackgroundAudioTrack>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Media.Editing.IBackgroundAudioTrackStatics
  [WinRTClassNameAttribute(SEditing_BackgroundAudioTrack)]
  Editing_IBackgroundAudioTrackStatics = interface(IInspectable)
  ['{D9B1C0D7-D018-42A8-A559-CB4D9E97E664}']
    function CreateFromEmbeddedAudioTrack(embeddedAudioTrack: Editing_IEmbeddedAudioTrack): Editing_IBackgroundAudioTrack; safecall;
    function CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IBackgroundAudioTrack; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlay>
  IIterator_1__Editing_IMediaOverlay_Base = interface(IInspectable)
  ['{351F6F24-4A92-56D6-A187-FAEAE748E0C7}']
  end;
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlay
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlay>
  IIterator_1__Editing_IMediaOverlay = interface(IIterator_1__Editing_IMediaOverlay_Base)
  ['{E78A6F3C-A8B3-5ACD-BFA1-6AC80BC9C6FA}']
    function get_Current: Editing_IMediaOverlay; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEditing_IMediaOverlay): Cardinal; safecall;
    property Current: Editing_IMediaOverlay read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaOverlay>
  IIterable_1__Editing_IMediaOverlay_Base = interface(IInspectable)
  ['{EFCDA247-A1FB-51DC-A776-E3E06695FB36}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlay>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaOverlay>
  IIterable_1__Editing_IMediaOverlay = interface(IIterable_1__Editing_IMediaOverlay_Base)
  ['{5833D1FF-5172-5C3E-A9E8-F7D5509772B2}']
    function First: IIterator_1__Editing_IMediaOverlay; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlay
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaOverlay>
  IVectorView_1__Editing_IMediaOverlay = interface(IInspectable)
  ['{C2D1EE9B-D163-596B-B8B3-73376867290B}']
    function GetAt(index: Cardinal): Editing_IMediaOverlay; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Editing_IMediaOverlay; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IMediaOverlay): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlay
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaOverlay>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaOverlay>
  IVector_1__Editing_IMediaOverlay = interface(IInspectable)
  ['{338149D6-D505-59AB-9D80-23CCD5A670A6}']
    function GetAt(index: Cardinal): Editing_IMediaOverlay; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Editing_IMediaOverlay; safecall;
    function IndexOf(value: Editing_IMediaOverlay; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Editing_IMediaOverlay); safecall;
    procedure InsertAt(index: Cardinal; value: Editing_IMediaOverlay); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Editing_IMediaOverlay); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IMediaOverlay): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PEditing_IMediaOverlay); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlayLayer
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaOverlay>
  // Used Types:  Windows.Media.Effects.IVideoCompositorDefinition
  }
  // Windows.Media.Editing.IMediaOverlayLayer
  [WinRTClassNameAttribute(SEditing_MediaOverlayLayer)]
  Editing_IMediaOverlayLayer = interface(IInspectable)
  ['{A6D9BA57-EEDA-46C6-BBE5-E398C84168AC}']
    function Clone: Editing_IMediaOverlayLayer; safecall;
    function get_Overlays: IVector_1__Editing_IMediaOverlay; safecall;
    function get_CustomCompositorDefinition: Effects_IVideoCompositorDefinition; safecall;
    property CustomCompositorDefinition: Effects_IVideoCompositorDefinition read get_CustomCompositorDefinition;
    property Overlays: IVector_1__Editing_IMediaOverlay read get_Overlays;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlayLayer>
  IIterator_1__Editing_IMediaOverlayLayer_Base = interface(IInspectable)
  ['{CA401ED8-63D2-525A-80BB-E494900C4CE6}']
  end;
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlayLayer
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlayLayer>
  IIterator_1__Editing_IMediaOverlayLayer = interface(IIterator_1__Editing_IMediaOverlayLayer_Base)
  ['{514F7287-8C4D-54CB-8585-8487888830D4}']
    function get_Current: Editing_IMediaOverlayLayer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PEditing_IMediaOverlayLayer): Cardinal; safecall;
    property Current: Editing_IMediaOverlayLayer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaOverlayLayer>
  IIterable_1__Editing_IMediaOverlayLayer_Base = interface(IInspectable)
  ['{7D2312D0-F3A2-5091-8A5E-41832E632C08}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Editing.IMediaOverlayLayer>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Editing.IMediaOverlayLayer>
  IIterable_1__Editing_IMediaOverlayLayer = interface(IIterable_1__Editing_IMediaOverlayLayer_Base)
  ['{FB3A9C6E-2C63-5741-A408-AA44834DB731}']
    function First: IIterator_1__Editing_IMediaOverlayLayer; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlayLayer
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaOverlayLayer>
  IVectorView_1__Editing_IMediaOverlayLayer = interface(IInspectable)
  ['{85F4D243-A090-574C-9624-7C000C421808}']
    function GetAt(index: Cardinal): Editing_IMediaOverlayLayer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Editing_IMediaOverlayLayer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IMediaOverlayLayer): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlayLayer
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Editing.IMediaOverlayLayer>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaOverlayLayer>
  IVector_1__Editing_IMediaOverlayLayer = interface(IInspectable)
  ['{B331E53D-9A53-5961-AFF1-9B41EB32A607}']
    function GetAt(index: Cardinal): Editing_IMediaOverlayLayer; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Editing_IMediaOverlayLayer; safecall;
    function IndexOf(value: Editing_IMediaOverlayLayer; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Editing_IMediaOverlayLayer); safecall;
    procedure InsertAt(index: Cardinal; value: Editing_IMediaOverlayLayer); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Editing_IMediaOverlayLayer); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PEditing_IMediaOverlayLayer): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PEditing_IMediaOverlayLayer); safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Editing.IMediaOverlayLayer>
  }
  // Windows.Media.Editing.IMediaComposition2
  Editing_IMediaComposition2 = interface(IInspectable)
  ['{A59E5372-2366-492C-BEC8-E6DFBA6D0281}']
    function get_OverlayLayers: IVector_1__Editing_IMediaOverlayLayer; safecall;
    property OverlayLayers: IVector_1__Editing_IMediaOverlayLayer read get_OverlayLayers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlay
  // Used Types:  Windows.Media.Editing.IMediaClip
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Double
  }
  // Windows.Media.Editing.IMediaOverlayFactory
  [WinRTClassNameAttribute(SEditing_MediaOverlay)]
  Editing_IMediaOverlayFactory = interface(IInspectable)
  ['{B584828A-6188-4F8F-A2E0-AA552D598E18}']
    function Create(clip: Editing_IMediaClip): Editing_IMediaOverlay; safecall;
    function CreateWithPositionAndOpacity(clip: Editing_IMediaClip; position: TRectF; opacity: Double): Editing_IMediaOverlay; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Editing.IMediaOverlayLayer
  // Used Types:  Windows.Media.Effects.IVideoCompositorDefinition
  }
  // Windows.Media.Editing.IMediaOverlayLayerFactory
  [WinRTClassNameAttribute(SEditing_MediaOverlayLayer)]
  Editing_IMediaOverlayLayerFactory = interface(IInspectable)
  ['{947CB473-A39E-4362-ABBF-9F8B5070A062}']
    function CreateWithCompositorDefinition(compositorDefinition: Effects_IVideoCompositorDefinition): Editing_IMediaOverlayLayer; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Graphics.Imaging.BitmapBounds
  }
  // Windows.Media.FaceAnalysis.IDetectedFace
  FaceAnalysis_IDetectedFace = interface(IInspectable)
  ['{8200D454-66BC-34DF-9410-E89400195414}']
    function get_FaceBox: Imaging_BitmapBounds; safecall;
    property FaceBox: Imaging_BitmapBounds read get_FaceBox;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IIterator_1__FaceAnalysis_IDetectedFace_Base = interface(IInspectable)
  ['{A0CF090E-0340-531F-898B-C21EAFB9F4AE}']
  end;
  {
  // Used Types:  Windows.Media.FaceAnalysis.IDetectedFace
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IIterator_1__FaceAnalysis_IDetectedFace = interface(IIterator_1__FaceAnalysis_IDetectedFace_Base)
  ['{90D3F012-5420-566E-A536-BDD8A9EF1E1F}']
    function get_Current: FaceAnalysis_IDetectedFace; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PFaceAnalysis_IDetectedFace): Cardinal; safecall;
    property Current: FaceAnalysis_IDetectedFace read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IIterable_1__FaceAnalysis_IDetectedFace_Base = interface(IInspectable)
  ['{25347323-3556-5CBB-9855-2B5856437F4D}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.FaceAnalysis.IDetectedFace>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IIterable_1__FaceAnalysis_IDetectedFace = interface(IIterable_1__FaceAnalysis_IDetectedFace_Base)
  ['{058589D0-1CA4-54E1-B3C1-53C603A2E03F}']
    function First: IIterator_1__FaceAnalysis_IDetectedFace; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.FaceAnalysis.IDetectedFace
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IVectorView_1__FaceAnalysis_IDetectedFace = interface(IInspectable)
  ['{DC2C389F-2996-548D-8920-BA7A896998E0}']
    function GetAt(index: Cardinal): FaceAnalysis_IDetectedFace; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: FaceAnalysis_IDetectedFace; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PFaceAnalysis_IDetectedFace): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Media.FaceAnalysis.IDetectedFace
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.FaceAnalysis.IDetectedFace>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>
  IVector_1__FaceAnalysis_IDetectedFace = interface(IInspectable)
  ['{01E93A00-9C03-547D-AF95-9975AE07E725}']
    function GetAt(index: Cardinal): FaceAnalysis_IDetectedFace; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__FaceAnalysis_IDetectedFace; safecall;
    function IndexOf(value: FaceAnalysis_IDetectedFace; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: FaceAnalysis_IDetectedFace); safecall;
    procedure InsertAt(index: Cardinal; value: FaceAnalysis_IDetectedFace); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: FaceAnalysis_IDetectedFace); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PFaceAnalysis_IDetectedFace): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PFaceAnalysis_IDetectedFace); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace_Delegate_Base = interface(IUnknown)
  ['{B0A53153-2015-58B3-9DD0-BDF291B856B2}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace = interface(AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace_Delegate_Base)
  ['{3A5F5ABE-CA0D-565E-BFAD-948FF16E368C}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  IAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace_Base = interface(IInspectable)
  ['{37F1D7DC-A1A4-5A94-B33B-74205A65A1ED}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVector`1<Windows.Media.FaceAnalysis.IDetectedFace>>
  IAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace = interface(IAsyncOperation_1__IVector_1__FaceAnalysis_IDetectedFace_Base)
  ['{6E19DC38-7D50-531F-8C84-A22BD7CA3AB6}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace; safecall;
    function GetResults: IVector_1__FaceAnalysis_IDetectedFace; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVector_1__FaceAnalysis_IDetectedFace read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Import.PhotoImportStorageMediumType
  // Used Types:  Windows.Media.Import.PhotoImportAccessMode
  // Used Types:  UInt64
  }
  // Windows.Media.Import.IPhotoImportStorageMedium
  [WinRTClassNameAttribute(SImport_PhotoImportStorageMedium)]
  Import_IPhotoImportStorageMedium = interface(IInspectable)
  ['{F2B9B093-FC85-487F-87C2-58D675D05B07}']
    function get_Name: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_SerialNumber: HSTRING; safecall;
    function get_StorageMediumType: Import_PhotoImportStorageMediumType; safecall;
    function get_SupportedAccessMode: Import_PhotoImportAccessMode; safecall;
    function get_CapacityInBytes: UInt64; safecall;
    function get_AvailableSpaceInBytes: UInt64; safecall;
    procedure Refresh; safecall;
    property AvailableSpaceInBytes: UInt64 read get_AvailableSpaceInBytes;
    property CapacityInBytes: UInt64 read get_CapacityInBytes;
    property Description: HSTRING read get_Description;
    property Name: HSTRING read get_Name;
    property SerialNumber: HSTRING read get_SerialNumber;
    property StorageMediumType: Import_PhotoImportStorageMediumType read get_StorageMediumType;
    property SupportedAccessMode: Import_PhotoImportAccessMode read get_SupportedAccessMode;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IIterator_1__Import_IPhotoImportStorageMedium_Base = interface(IInspectable)
  ['{985CB948-9769-55DC-85D9-125A5D03D6BB}']
  end;
  {
  // Used Types:  Windows.Media.Import.IPhotoImportStorageMedium
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IIterator_1__Import_IPhotoImportStorageMedium = interface(IIterator_1__Import_IPhotoImportStorageMedium_Base)
  ['{9FEDC748-7884-53EF-998E-C534BDDB0C4C}']
    function get_Current: Import_IPhotoImportStorageMedium; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImport_IPhotoImportStorageMedium): Cardinal; safecall;
    property Current: Import_IPhotoImportStorageMedium read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IIterable_1__Import_IPhotoImportStorageMedium_Base = interface(IInspectable)
  ['{3233CBFE-F9EE-560F-BD0F-E36ABE6CDA7F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportStorageMedium>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IIterable_1__Import_IPhotoImportStorageMedium = interface(IIterable_1__Import_IPhotoImportStorageMedium_Base)
  ['{0B060B18-4AC5-5B0D-BF1A-D1AD5C31220F}']
    function First: IIterator_1__Import_IPhotoImportStorageMedium; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportStorageMedium
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportStorageMedium>
  IVectorView_1__Import_IPhotoImportStorageMedium = interface(IInspectable)
  ['{D27C363D-64B0-5F16-B6B8-94504BD7922B}']
    function GetAt(index: Cardinal): Import_IPhotoImportStorageMedium; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Import_IPhotoImportStorageMedium; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImport_IPhotoImportStorageMedium): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.DateTime
  }
  // Windows.Media.Import.IPhotoImportSidecar
  [WinRTClassNameAttribute(SImport_PhotoImportSidecar)]
  Import_IPhotoImportSidecar = interface(IInspectable)
  ['{46D7D757-F802-44C7-9C98-7A71F4BC1486}']
    function get_Name: HSTRING; safecall;
    function get_SizeInBytes: UInt64; safecall;
    function get_Date: DateTime; safecall;
    property Date: DateTime read get_Date;
    property Name: HSTRING read get_Name;
    property SizeInBytes: UInt64 read get_SizeInBytes;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSidecar>
  IIterator_1__Import_IPhotoImportSidecar_Base = interface(IInspectable)
  ['{AEF5EBF0-1363-593A-86D5-F92BC230BFD6}']
  end;
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSidecar
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSidecar>
  IIterator_1__Import_IPhotoImportSidecar = interface(IIterator_1__Import_IPhotoImportSidecar_Base)
  ['{F6531CDF-A0F1-5552-988C-C51E528EFF89}']
    function get_Current: Import_IPhotoImportSidecar; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImport_IPhotoImportSidecar): Cardinal; safecall;
    property Current: Import_IPhotoImportSidecar read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportSidecar>
  IIterable_1__Import_IPhotoImportSidecar_Base = interface(IInspectable)
  ['{2B7F92AD-E596-5669-B622-FBFBC7040E89}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSidecar>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportSidecar>
  IIterable_1__Import_IPhotoImportSidecar = interface(IIterable_1__Import_IPhotoImportSidecar_Base)
  ['{2AAC9167-1E61-5938-9AAA-A7EFAF2D9191}']
    function First: IIterator_1__Import_IPhotoImportSidecar; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSidecar
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSidecar>
  IVectorView_1__Import_IPhotoImportSidecar = interface(IInspectable)
  ['{2CCF73EC-50B4-54A6-A07B-E06F53D03DC5}']
    function GetAt(index: Cardinal): Import_IPhotoImportSidecar; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Import_IPhotoImportSidecar; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImport_IPhotoImportSidecar): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Media.Import.IPhotoImportSidecar
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSidecar>
  }
  // Windows.Media.Import.IPhotoImportVideoSegment
  [WinRTClassNameAttribute(SImport_PhotoImportVideoSegment)]
  Import_IPhotoImportVideoSegment = interface(IInspectable)
  ['{623C0289-321A-41D8-9166-8C62A333276C}']
    function get_Name: HSTRING; safecall;
    function get_SizeInBytes: UInt64; safecall;
    function get_Date: DateTime; safecall;
    function get_Sibling: Import_IPhotoImportSidecar; safecall;
    function get_Sidecars: IVectorView_1__Import_IPhotoImportSidecar; safecall;
    property Date: DateTime read get_Date;
    property Name: HSTRING read get_Name;
    property Sibling: Import_IPhotoImportSidecar read get_Sibling;
    property Sidecars: IVectorView_1__Import_IPhotoImportSidecar read get_Sidecars;
    property SizeInBytes: UInt64 read get_SizeInBytes;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IIterator_1__Import_IPhotoImportVideoSegment_Base = interface(IInspectable)
  ['{C4C16A75-3310-5AB9-9307-78755AB1094D}']
  end;
  {
  // Used Types:  Windows.Media.Import.IPhotoImportVideoSegment
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IIterator_1__Import_IPhotoImportVideoSegment = interface(IIterator_1__Import_IPhotoImportVideoSegment_Base)
  ['{E970C93B-8D22-5CCD-B85D-E120E8551CF3}']
    function get_Current: Import_IPhotoImportVideoSegment; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImport_IPhotoImportVideoSegment): Cardinal; safecall;
    property Current: Import_IPhotoImportVideoSegment read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IIterable_1__Import_IPhotoImportVideoSegment_Base = interface(IInspectable)
  ['{94DD3B44-DA03-5D79-BBFB-1BEAF2EDE482}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportVideoSegment>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IIterable_1__Import_IPhotoImportVideoSegment = interface(IIterable_1__Import_IPhotoImportVideoSegment_Base)
  ['{016284C1-5540-5B25-8372-E705632D0996}']
    function First: IIterator_1__Import_IPhotoImportVideoSegment; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportVideoSegment
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportVideoSegment>
  IVectorView_1__Import_IPhotoImportVideoSegment = interface(IInspectable)
  ['{550ED523-02AD-5A38-B513-582A17288AA9}']
    function GetAt(index: Cardinal): Import_IPhotoImportVideoSegment; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Import_IPhotoImportVideoSegment; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImport_IPhotoImportVideoSegment): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  UInt64
  // Used Types:  Windows.Media.Import.PhotoImportContentType
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Media.Import.IPhotoImportSidecar
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSidecar>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportVideoSegment>
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  }
  // Windows.Media.Import.IPhotoImportItem
  [WinRTClassNameAttribute(SImport_PhotoImportItem)]
  Import_IPhotoImportItem = interface(IInspectable)
  ['{A9D07E76-9BFC-43B8-B356-633B6A988C9E}']
    function get_Name: HSTRING; safecall;
    function get_ItemKey: UInt64; safecall;
    function get_ContentType: Import_PhotoImportContentType; safecall;
    function get_SizeInBytes: UInt64; safecall;
    function get_Date: DateTime; safecall;
    function get_Sibling: Import_IPhotoImportSidecar; safecall;
    function get_Sidecars: IVectorView_1__Import_IPhotoImportSidecar; safecall;
    function get_VideoSegments: IVectorView_1__Import_IPhotoImportVideoSegment; safecall;
    function get_IsSelected: Boolean; safecall;
    procedure put_IsSelected(value: Boolean); safecall;
    function get_Thumbnail: IRandomAccessStreamReference; safecall;
    function get_ImportedFileNames: IVectorView_1__HSTRING; safecall;
    function get_DeletedFileNames: IVectorView_1__HSTRING; safecall;
    property ContentType: Import_PhotoImportContentType read get_ContentType;
    property Date: DateTime read get_Date;
    property DeletedFileNames: IVectorView_1__HSTRING read get_DeletedFileNames;
    property ImportedFileNames: IVectorView_1__HSTRING read get_ImportedFileNames;
    property IsSelected: Boolean read get_IsSelected write put_IsSelected;
    property ItemKey: UInt64 read get_ItemKey;
    property Name: HSTRING read get_Name;
    property Sibling: Import_IPhotoImportSidecar read get_Sibling;
    property Sidecars: IVectorView_1__Import_IPhotoImportSidecar read get_Sidecars;
    property SizeInBytes: UInt64 read get_SizeInBytes;
    property Thumbnail: IRandomAccessStreamReference read get_Thumbnail;
    property VideoSegments: IVectorView_1__Import_IPhotoImportVideoSegment read get_VideoSegments;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportItem>
  IIterator_1__Import_IPhotoImportItem_Base = interface(IInspectable)
  ['{D04D6068-B5A3-508E-BC6B-1DCDFCFB0D08}']
  end;
  {
  // Used Types:  Windows.Media.Import.IPhotoImportItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportItem>
  IIterator_1__Import_IPhotoImportItem = interface(IIterator_1__Import_IPhotoImportItem_Base)
  ['{EC346A78-3590-5BCE-A4C3-D5FD43F5E3BE}']
    function get_Current: Import_IPhotoImportItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImport_IPhotoImportItem): Cardinal; safecall;
    property Current: Import_IPhotoImportItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportItem>
  IIterable_1__Import_IPhotoImportItem_Base = interface(IInspectable)
  ['{82347483-3B75-5E95-BBA4-ABC0B8A320AA}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportItem>
  IIterable_1__Import_IPhotoImportItem = interface(IIterable_1__Import_IPhotoImportItem_Base)
  ['{D6AD4D82-8202-52FA-88DF-9D84F76DCB42}']
    function First: IIterator_1__Import_IPhotoImportItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportItem>
  IVectorView_1__Import_IPhotoImportItem = interface(IInspectable)
  ['{CEB9DB5E-9176-5763-9EE5-2A2CF1A80B54}']
    function GetAt(index: Cardinal): Import_IPhotoImportItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Import_IPhotoImportItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImport_IPhotoImportItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.Import.IPhotoImportSelectionChangedEventArgs
  [WinRTClassNameAttribute(SImport_PhotoImportSelectionChangedEventArgs)]
  Import_IPhotoImportSelectionChangedEventArgs = interface(IInspectable)
  ['{10461782-FA9D-4C30-8BC9-4D64911572D5}']
    function get_IsSelectionEmpty: Boolean; safecall;
    property IsSelectionEmpty: Boolean read get_IsSelectionEmpty;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportSelectionChangedEventArgs>
  TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{E67279FE-692F-5602-820B-865098D9B43E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportFindItemsResult
  // Used Types:  Windows.Media.Import.IPhotoImportSelectionChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportSelectionChangedEventArgs>
  TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs = interface(TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs_Delegate_Base)
  ['{51C404BB-F631-5B21-92ED-122203365DC8}']
    procedure Invoke(sender: Import_IPhotoImportFindItemsResult; args: Import_IPhotoImportSelectionChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSession
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportItem>
  // Used Types:  UInt32
  // Used Types:  UInt64
  }
  // Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult
  [WinRTClassNameAttribute(SImport_PhotoImportDeleteImportedItemsFromSourceResult)]
  Import_IPhotoImportDeleteImportedItemsFromSourceResult = interface(IInspectable)
  ['{F4E112F8-843D-428A-A1A6-81510292B0AE}']
    function get_Session: Import_IPhotoImportSession; safecall;
    function get_HasSucceeded: Boolean; safecall;
    function get_DeletedItems: IVectorView_1__Import_IPhotoImportItem; safecall;
    function get_PhotosCount: Cardinal; safecall;
    function get_PhotosSizeInBytes: UInt64; safecall;
    function get_VideosCount: Cardinal; safecall;
    function get_VideosSizeInBytes: UInt64; safecall;
    function get_SidecarsCount: Cardinal; safecall;
    function get_SidecarsSizeInBytes: UInt64; safecall;
    function get_SiblingsCount: Cardinal; safecall;
    function get_SiblingsSizeInBytes: UInt64; safecall;
    function get_TotalCount: Cardinal; safecall;
    function get_TotalSizeInBytes: UInt64; safecall;
    property DeletedItems: IVectorView_1__Import_IPhotoImportItem read get_DeletedItems;
    property HasSucceeded: Boolean read get_HasSucceeded;
    property PhotosCount: Cardinal read get_PhotosCount;
    property PhotosSizeInBytes: UInt64 read get_PhotosSizeInBytes;
    property Session: Import_IPhotoImportSession read get_Session;
    property SiblingsCount: Cardinal read get_SiblingsCount;
    property SiblingsSizeInBytes: UInt64 read get_SiblingsSizeInBytes;
    property SidecarsCount: Cardinal read get_SidecarsCount;
    property SidecarsSizeInBytes: UInt64 read get_SidecarsSizeInBytes;
    property TotalCount: Cardinal read get_TotalCount;
    property TotalSizeInBytes: UInt64 read get_TotalSizeInBytes;
    property VideosCount: Cardinal read get_VideosCount;
    property VideosSizeInBytes: UInt64 read get_VideosSizeInBytes;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double_Delegate_Base = interface(IUnknown)
  ['{AC6E425D-49E8-50D7-988C-CD5E42038577}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  // Used Types:  Double
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = interface(AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double_Delegate_Base)
  ['{BD06B7C0-61FA-5847-80FD-15FA0E5EE472}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double; progressInfo: Double); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double_Delegate_Base = interface(IUnknown)
  ['{5E24E7C1-F356-59C1-B0E5-B2DFB225EB4E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = interface(AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double_Delegate_Base)
  ['{71719D54-108E-53B6-8614-F1CF2C933FBB}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double_Base = interface(IInspectable)
  ['{3E2371A9-281A-5226-AE85-CAA55C0D61DE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  // Used Types:  Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double = interface(IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double_Base)
  ['{2D45F8E8-C550-52FF-A79E-DB61FFB63C4D}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double; safecall;
    function GetResults: Import_IPhotoImportDeleteImportedItemsFromSourceResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSession
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportItem>
  // Used Types:  UInt32
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  }
  // Windows.Media.Import.IPhotoImportImportItemsResult
  [WinRTClassNameAttribute(SImport_PhotoImportImportItemsResult)]
  Import_IPhotoImportImportItemsResult = interface(IInspectable)
  ['{E4D4F478-D419-4443-A84E-F06A850C0B00}']
    function get_Session: Import_IPhotoImportSession; safecall;
    function get_HasSucceeded: Boolean; safecall;
    function get_ImportedItems: IVectorView_1__Import_IPhotoImportItem; safecall;
    function get_PhotosCount: Cardinal; safecall;
    function get_PhotosSizeInBytes: UInt64; safecall;
    function get_VideosCount: Cardinal; safecall;
    function get_VideosSizeInBytes: UInt64; safecall;
    function get_SidecarsCount: Cardinal; safecall;
    function get_SidecarsSizeInBytes: UInt64; safecall;
    function get_SiblingsCount: Cardinal; safecall;
    function get_SiblingsSizeInBytes: UInt64; safecall;
    function get_TotalCount: Cardinal; safecall;
    function get_TotalSizeInBytes: UInt64; safecall;
    function DeleteImportedItemsFromSourceAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double; safecall;
    property HasSucceeded: Boolean read get_HasSucceeded;
    property ImportedItems: IVectorView_1__Import_IPhotoImportItem read get_ImportedItems;
    property PhotosCount: Cardinal read get_PhotosCount;
    property PhotosSizeInBytes: UInt64 read get_PhotosSizeInBytes;
    property Session: Import_IPhotoImportSession read get_Session;
    property SiblingsCount: Cardinal read get_SiblingsCount;
    property SiblingsSizeInBytes: UInt64 read get_SiblingsSizeInBytes;
    property SidecarsCount: Cardinal read get_SidecarsCount;
    property SidecarsSizeInBytes: UInt64 read get_SidecarsSizeInBytes;
    property TotalCount: Cardinal read get_TotalCount;
    property TotalSizeInBytes: UInt64 read get_TotalSizeInBytes;
    property VideosCount: Cardinal read get_VideosCount;
    property VideosSizeInBytes: UInt64 read get_VideosSizeInBytes;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress_Delegate_Base = interface(IUnknown)
  ['{ACD8A978-B2E1-55D0-BBF6-8DC5088D728A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  // Used Types:  Windows.Media.Import.PhotoImportProgress
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = interface(AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress_Delegate_Base)
  ['{09F43DAE-C229-5E00-AAB6-7C557FB14260}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress; progressInfo: Import_PhotoImportProgress); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress_Delegate_Base = interface(IUnknown)
  ['{0D141EC2-EE90-53A0-9318-10F0AB7F2D17}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = interface(AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress_Delegate_Base)
  ['{EEAE0DEB-A642-5F84-8304-199380D154FF}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress_Base = interface(IInspectable)
  ['{D874EC64-0951-5459-A0DD-0F8BF3917EB1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  // Used Types:  Windows.Media.Import.IPhotoImportImportItemsResult
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress = interface(IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress_Base)
  ['{91ED64C2-84AA-57B8-81C2-D96A52C22B6D}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress; safecall;
    function GetResults: Import_IPhotoImportImportItemsResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportItem
  }
  // Windows.Media.Import.IPhotoImportItemImportedEventArgs
  [WinRTClassNameAttribute(SImport_PhotoImportItemImportedEventArgs)]
  Import_IPhotoImportItemImportedEventArgs = interface(IInspectable)
  ['{42CB2FDD-7D68-47B5-BC7C-CEB73E0C77DC}']
    function get_ImportedItem: Import_IPhotoImportItem; safecall;
    property ImportedItem: Import_IPhotoImportItem read get_ImportedItem;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportItemImportedEventArgs>
  TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs_Delegate_Base = interface(IUnknown)
  ['{A3CCE94D-F26E-58D9-8138-599AD63C7069}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportFindItemsResult
  // Used Types:  Windows.Media.Import.IPhotoImportItemImportedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportItemImportedEventArgs>
  TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs = interface(TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs_Delegate_Base)
  ['{27BA5B5E-F5A8-5A92-A95D-80A4BCCDE676}']
    procedure Invoke(sender: Import_IPhotoImportFindItemsResult; args: Import_IPhotoImportItemImportedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSession
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportItem>
  // Used Types:  UInt32
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Media.Import.PhotoImportImportMode
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportSelectionChangedEventArgs>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,Windows.Media.Import.IPhotoImportItemImportedEventArgs>
  }
  // Windows.Media.Import.IPhotoImportFindItemsResult
  [WinRTClassNameAttribute(SImport_PhotoImportFindItemsResult)]
  Import_IPhotoImportFindItemsResult = interface(IInspectable)
  ['{3915E647-6C78-492B-844E-8FE5E8F6BFB9}']
    function get_Session: Import_IPhotoImportSession; safecall;
    function get_HasSucceeded: Boolean; safecall;
    function get_FoundItems: IVectorView_1__Import_IPhotoImportItem; safecall;
    function get_PhotosCount: Cardinal; safecall;
    function get_PhotosSizeInBytes: UInt64; safecall;
    function get_VideosCount: Cardinal; safecall;
    function get_VideosSizeInBytes: UInt64; safecall;
    function get_SidecarsCount: Cardinal; safecall;
    function get_SidecarsSizeInBytes: UInt64; safecall;
    function get_SiblingsCount: Cardinal; safecall;
    function get_SiblingsSizeInBytes: UInt64; safecall;
    function get_TotalCount: Cardinal; safecall;
    function get_TotalSizeInBytes: UInt64; safecall;
    procedure SelectAll; safecall;
    procedure SelectNone; safecall;
    function SelectNewAsync: IAsyncAction; safecall;
    procedure SetImportMode(value: Import_PhotoImportImportMode); safecall;
    function get_ImportMode: Import_PhotoImportImportMode; safecall;
    function get_SelectedPhotosCount: Cardinal; safecall;
    function get_SelectedPhotosSizeInBytes: UInt64; safecall;
    function get_SelectedVideosCount: Cardinal; safecall;
    function get_SelectedVideosSizeInBytes: UInt64; safecall;
    function get_SelectedSidecarsCount: Cardinal; safecall;
    function get_SelectedSidecarsSizeInBytes: UInt64; safecall;
    function get_SelectedSiblingsCount: Cardinal; safecall;
    function get_SelectedSiblingsSizeInBytes: UInt64; safecall;
    function get_SelectedTotalCount: Cardinal; safecall;
    function get_SelectedTotalSizeInBytes: UInt64; safecall;
    function add_SelectionChanged(value: TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportSelectionChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SelectionChanged(token: EventRegistrationToken); safecall;
    function ImportItemsAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress; safecall;
    function add_ItemImported(value: TypedEventHandler_2__Import_IPhotoImportFindItemsResult__Import_IPhotoImportItemImportedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ItemImported(token: EventRegistrationToken); safecall;
    property FoundItems: IVectorView_1__Import_IPhotoImportItem read get_FoundItems;
    property HasSucceeded: Boolean read get_HasSucceeded;
    property ImportMode: Import_PhotoImportImportMode read get_ImportMode;
    property PhotosCount: Cardinal read get_PhotosCount;
    property PhotosSizeInBytes: UInt64 read get_PhotosSizeInBytes;
    property SelectedPhotosCount: Cardinal read get_SelectedPhotosCount;
    property SelectedPhotosSizeInBytes: UInt64 read get_SelectedPhotosSizeInBytes;
    property SelectedSiblingsCount: Cardinal read get_SelectedSiblingsCount;
    property SelectedSiblingsSizeInBytes: UInt64 read get_SelectedSiblingsSizeInBytes;
    property SelectedSidecarsCount: Cardinal read get_SelectedSidecarsCount;
    property SelectedSidecarsSizeInBytes: UInt64 read get_SelectedSidecarsSizeInBytes;
    property SelectedTotalCount: Cardinal read get_SelectedTotalCount;
    property SelectedTotalSizeInBytes: UInt64 read get_SelectedTotalSizeInBytes;
    property SelectedVideosCount: Cardinal read get_SelectedVideosCount;
    property SelectedVideosSizeInBytes: UInt64 read get_SelectedVideosSizeInBytes;
    property Session: Import_IPhotoImportSession read get_Session;
    property SiblingsCount: Cardinal read get_SiblingsCount;
    property SiblingsSizeInBytes: UInt64 read get_SiblingsSizeInBytes;
    property SidecarsCount: Cardinal read get_SidecarsCount;
    property SidecarsSizeInBytes: UInt64 read get_SidecarsSizeInBytes;
    property TotalCount: Cardinal read get_TotalCount;
    property TotalSizeInBytes: UInt64 read get_TotalSizeInBytes;
    property VideosCount: Cardinal read get_VideosCount;
    property VideosSizeInBytes: UInt64 read get_VideosSizeInBytes;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal_Delegate_Base = interface(IUnknown)
  ['{91190F62-7956-5E8F-83F1-84F9FE011B21}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal = interface(AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal_Delegate_Base)
  ['{82C5AE94-23F3-5F41-AA1C-50C2B683A32D}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal_Delegate_Base = interface(IUnknown)
  ['{DD7A69D4-2456-5250-9653-31BD2D487104}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal_Delegate_Base)
  ['{8661BBC6-1435-5866-A267-96A65FB60717}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal_Base = interface(IInspectable)
  ['{6E6F9B4E-C6E1-5364-A650-11C35211BEAD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  // Used Types:  Windows.Media.Import.IPhotoImportFindItemsResult
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal = interface(IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal_Base)
  ['{8AB6631B-C06D-5555-9707-C27343BF2E39}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal; safecall;
    function GetResults: Import_IPhotoImportFindItemsResult; safecall;
    property Progress: AsyncOperationProgressHandler_2__Import_IPhotoImportFindItemsResult__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Import_IPhotoImportFindItemsResult__Cardinal read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSource
  // Used Types:  Guid
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Import.PhotoImportSubfolderCreationMode
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  // Used Types:  Windows.Media.Import.PhotoImportContentTypeFilter
  // Used Types:  Windows.Media.Import.PhotoImportItemSelectionMode
  }
  // Windows.Media.Import.IPhotoImportSession
  [WinRTClassNameAttribute(SImport_PhotoImportSession)]
  Import_IPhotoImportSession = interface(IInspectable)
  ['{AA63916E-ECDB-4EFE-94C6-5F5CAFE34CFB}']
    function get_Source: Import_IPhotoImportSource; safecall;
    function get_SessionId: TGuid; safecall;
    procedure put_DestinationFolder(value: IStorageFolder); safecall;
    function get_DestinationFolder: IStorageFolder; safecall;
    procedure put_AppendSessionDateToDestinationFolder(value: Boolean); safecall;
    function get_AppendSessionDateToDestinationFolder: Boolean; safecall;
    procedure put_SubfolderCreationMode(value: Import_PhotoImportSubfolderCreationMode); safecall;
    function get_SubfolderCreationMode: Import_PhotoImportSubfolderCreationMode; safecall;
    procedure put_DestinationFileNamePrefix(value: HSTRING); safecall;
    function get_DestinationFileNamePrefix: HSTRING; safecall;
    function FindItemsAsync(contentTypeFilter: Import_PhotoImportContentTypeFilter; itemSelectionMode: Import_PhotoImportItemSelectionMode): IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal; safecall;
    property AppendSessionDateToDestinationFolder: Boolean read get_AppendSessionDateToDestinationFolder write put_AppendSessionDateToDestinationFolder;
    property DestinationFileNamePrefix: HSTRING read get_DestinationFileNamePrefix write put_DestinationFileNamePrefix;
    property DestinationFolder: IStorageFolder read get_DestinationFolder write put_DestinationFolder;
    property SessionId: TGuid read get_SessionId;
    property Source: Import_IPhotoImportSource read get_Source;
    property SubfolderCreationMode: Import_PhotoImportSubfolderCreationMode read get_SubfolderCreationMode write put_SubfolderCreationMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  // Used Types:  Windows.Media.Import.PhotoImportConnectionTransport
  // Used Types:  Windows.Media.Import.PhotoImportSourceType
  // Used Types:  Windows.Media.Import.PhotoImportPowerSource
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportStorageMedium>
  // Used Types:  Windows.Foundation.IReference`1<Boolean>
  // Used Types:  Boolean
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.Media.Import.IPhotoImportSession
  }
  // Windows.Media.Import.IPhotoImportSource
  [WinRTClassNameAttribute(SImport_PhotoImportSource)]
  Import_IPhotoImportSource = interface(IInspectable)
  ['{1F8EA35E-145B-4CD6-87F1-54965A982FEF}']
    function get_Id: HSTRING; safecall;
    function get_DisplayName: HSTRING; safecall;
    function get_Description: HSTRING; safecall;
    function get_Manufacturer: HSTRING; safecall;
    function get_Model: HSTRING; safecall;
    function get_SerialNumber: HSTRING; safecall;
    function get_ConnectionProtocol: HSTRING; safecall;
    function get_ConnectionTransport: Import_PhotoImportConnectionTransport; safecall;
    function get_Type: Import_PhotoImportSourceType; safecall;
    function get_PowerSource: Import_PhotoImportPowerSource; safecall;
    function get_BatteryLevelPercent: IReference_1__Cardinal; safecall;
    function get_DateTime: IReference_1__DateTime; safecall;
    function get_StorageMedia: IVectorView_1__Import_IPhotoImportStorageMedium; safecall;
    function get_IsLocked: IReference_1__Boolean; safecall;
    function get_IsMassStorage: Boolean; safecall;
    function get_Thumbnail: IRandomAccessStreamReference; safecall;
    function CreateImportSession: Import_IPhotoImportSession; safecall;
    property BatteryLevelPercent: IReference_1__Cardinal read get_BatteryLevelPercent;
    property ConnectionProtocol: HSTRING read get_ConnectionProtocol;
    property ConnectionTransport: Import_PhotoImportConnectionTransport read get_ConnectionTransport;
    property DateTime: IReference_1__DateTime read get_DateTime;
    property Description: HSTRING read get_Description;
    property DisplayName: HSTRING read get_DisplayName;
    property Id: HSTRING read get_Id;
    property IsLocked: IReference_1__Boolean read get_IsLocked;
    property IsMassStorage: Boolean read get_IsMassStorage;
    property Manufacturer: HSTRING read get_Manufacturer;
    property Model: HSTRING read get_Model;
    property PowerSource: Import_PhotoImportPowerSource read get_PowerSource;
    property SerialNumber: HSTRING read get_SerialNumber;
    property StorageMedia: IVectorView_1__Import_IPhotoImportStorageMedium read get_StorageMedia;
    property Thumbnail: IRandomAccessStreamReference read get_Thumbnail;
    property &Type: Import_PhotoImportSourceType read get_Type;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSource>
  IIterator_1__Import_IPhotoImportSource_Base = interface(IInspectable)
  ['{7D70F831-6EE4-5130-A7B8-253A21154E82}']
  end;
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSource>
  IIterator_1__Import_IPhotoImportSource = interface(IIterator_1__Import_IPhotoImportSource_Base)
  ['{F1189FA7-294E-5CFE-B566-C8D8EB82ADEB}']
    function get_Current: Import_IPhotoImportSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImport_IPhotoImportSource): Cardinal; safecall;
    property Current: Import_IPhotoImportSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportSource>
  IIterable_1__Import_IPhotoImportSource_Base = interface(IInspectable)
  ['{40E01D62-B413-5B43-AB07-AB28B23FC886}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportSource>
  IIterable_1__Import_IPhotoImportSource = interface(IIterable_1__Import_IPhotoImportSource_Base)
  ['{2C2DEFF8-BDA2-5573-A743-77032B04FB7D}']
    function First: IIterator_1__Import_IPhotoImportSource; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportSource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>
  IVectorView_1__Import_IPhotoImportSource = interface(IInspectable)
  ['{0EEF3559-5B9B-5AF3-895C-328456DD2BF3}']
    function GetAt(index: Cardinal): Import_IPhotoImportSource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Import_IPhotoImportSource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImport_IPhotoImportSource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource_Delegate_Base = interface(IUnknown)
  ['{72CDE698-9247-5053-8CBD-D9076BFDFDA5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource = interface(AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource_Delegate_Base)
  ['{A3BA1A86-C72C-567C-9114-7ECD92B23804}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource_Base = interface(IInspectable)
  ['{3EF45F6E-39B9-5976-8643-6BAFEA4D1479}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource = interface(IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource_Base)
  ['{27E4DC99-1B11-55D6-A063-24D214B2B843}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource; safecall;
    function GetResults: IVectorView_1__Import_IPhotoImportSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IVectorView_1__Import_IPhotoImportSource read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.PhotoImportStage
  // Used Types:  Windows.Media.Import.IPhotoImportSession
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportFindItemsResult,UInt32>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportImportItemsResult,Windows.Media.Import.PhotoImportProgress>
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult,Double>
  }
  // Windows.Media.Import.IPhotoImportOperation
  [WinRTClassNameAttribute(SImport_PhotoImportOperation)]
  Import_IPhotoImportOperation = interface(IInspectable)
  ['{D9F797E4-A09A-4EE4-A4B1-20940277A5BE}']
    function get_Stage: Import_PhotoImportStage; safecall;
    function get_Session: Import_IPhotoImportSession; safecall;
    function get_ContinueFindingItemsAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal; safecall;
    function get_ContinueImportingItemsAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress; safecall;
    function get_ContinueDeletingImportedItemsFromSourceAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double; safecall;
    property ContinueDeletingImportedItemsFromSourceAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportDeleteImportedItemsFromSourceResult__Double read get_ContinueDeletingImportedItemsFromSourceAsync;
    property ContinueFindingItemsAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportFindItemsResult__Cardinal read get_ContinueFindingItemsAsync;
    property ContinueImportingItemsAsync: IAsyncOperationWithProgress_2__Import_IPhotoImportImportItemsResult__Import_PhotoImportProgress read get_ContinueImportingItemsAsync;
    property Session: Import_IPhotoImportSession read get_Session;
    property Stage: Import_PhotoImportStage read get_Stage;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportOperation>
  IIterator_1__Import_IPhotoImportOperation_Base = interface(IInspectable)
  ['{7C9DDE1A-A8A1-5957-8E0D-C401D19C9237}']
  end;
  {
  // Used Types:  Windows.Media.Import.IPhotoImportOperation
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportOperation>
  IIterator_1__Import_IPhotoImportOperation = interface(IIterator_1__Import_IPhotoImportOperation_Base)
  ['{61EAAC9A-E337-5E73-AE8C-46866038D643}']
    function get_Current: Import_IPhotoImportOperation; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PImport_IPhotoImportOperation): Cardinal; safecall;
    property Current: Import_IPhotoImportOperation read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportOperation>
  IIterable_1__Import_IPhotoImportOperation_Base = interface(IInspectable)
  ['{94F33A8F-115A-50CB-B59D-AB8483A84842}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Import.IPhotoImportOperation>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Import.IPhotoImportOperation>
  IIterable_1__Import_IPhotoImportOperation = interface(IIterable_1__Import_IPhotoImportOperation_Base)
  ['{F12CCD56-8C6A-5B1D-A322-B6F967525008}']
    function First: IIterator_1__Import_IPhotoImportOperation; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.IPhotoImportOperation
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportOperation>
  IVectorView_1__Import_IPhotoImportOperation = interface(IInspectable)
  ['{03C84016-1194-5C35-BF26-AFAEB26C1626}']
    function GetAt(index: Cardinal): Import_IPhotoImportOperation; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Import_IPhotoImportOperation; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PImport_IPhotoImportOperation): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Boolean>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportSource>>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Import.IPhotoImportOperation>
  }
  // Windows.Media.Import.IPhotoImportManagerStatics
  [WinRTClassNameAttribute(SImport_PhotoImportManager)]
  Import_IPhotoImportManagerStatics = interface(IInspectable)
  ['{2771903D-A046-4F06-9B9C-BFD662E83287}']
    function IsSupportedAsync: IAsyncOperation_1__Boolean; safecall;
    function FindAllSourcesAsync: IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource; safecall;
    function GetPendingOperations: IVectorView_1__Import_IPhotoImportOperation; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Import.IPhotoImportSource>
  AsyncOperationCompletedHandler_1__Import_IPhotoImportSource_Delegate_Base = interface(IUnknown)
  ['{DC38B22A-872E-53F8-8E97-45ED85DF0D23}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Import.IPhotoImportSource>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Import.IPhotoImportSource>
  AsyncOperationCompletedHandler_1__Import_IPhotoImportSource = interface(AsyncOperationCompletedHandler_1__Import_IPhotoImportSource_Delegate_Base)
  ['{D13718A8-C27E-5C35-A3D3-F1548B670C46}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Import_IPhotoImportSource; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Import.IPhotoImportSource>
  IAsyncOperation_1__Import_IPhotoImportSource_Base = interface(IInspectable)
  ['{C8C5DC1E-EB47-50B8-B5D9-AAFE1A82318A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Import.IPhotoImportSource>
  // Used Types:  Windows.Media.Import.IPhotoImportSource
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Import.IPhotoImportSource>
  IAsyncOperation_1__Import_IPhotoImportSource = interface(IAsyncOperation_1__Import_IPhotoImportSource_Base)
  ['{4CE1935D-7478-5009-AB7E-EA3930D4120D}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Import_IPhotoImportSource); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Import_IPhotoImportSource; safecall;
    function GetResults: Import_IPhotoImportSource; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Import_IPhotoImportSource read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Import.IPhotoImportSource>
  // Used Types:  String
  // Used Types:  Windows.Storage.IStorageFolder
  }
  // Windows.Media.Import.IPhotoImportSourceStatics
  [WinRTClassNameAttribute(SImport_PhotoImportSource)]
  Import_IPhotoImportSourceStatics = interface(IInspectable)
  ['{0528E586-32D8-467C-8CEE-23A1B2F43E85}']
    function FromIdAsync(sourceId: HSTRING): IAsyncOperation_1__Import_IPhotoImportSource; safecall;
    function FromFolderAsync(sourceRootFolder: IStorageFolder): IAsyncOperation_1__Import_IPhotoImportSource; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Import.PhotoImportSubfolderDateFormat
  // Used Types:  Boolean
  }
  // Windows.Media.Import.IPhotoImportSession2
  Import_IPhotoImportSession2 = interface(IInspectable)
  ['{2A526710-3EC6-469D-A375-2B9F4785391E}']
    procedure put_SubfolderDateFormat(value: Import_PhotoImportSubfolderDateFormat); safecall;
    function get_SubfolderDateFormat: Import_PhotoImportSubfolderDateFormat; safecall;
    procedure put_RememberDeselectedItems(value: Boolean); safecall;
    function get_RememberDeselectedItems: Boolean; safecall;
    property RememberDeselectedItems: Boolean read get_RememberDeselectedItems write put_RememberDeselectedItems;
    property SubfolderDateFormat: Import_PhotoImportSubfolderDateFormat read get_SubfolderDateFormat write put_SubfolderDateFormat;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Import.IPhotoImportFindItemsResult2
  Import_IPhotoImportFindItemsResult2 = interface(IInspectable)
  ['{FBDD6A3B-ECF9-406A-815E-5015625B0A88}']
    procedure AddItemsInDateRangeToSelection(rangeStart: DateTime; rangeLength: TimeSpan); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  String
  }
  // Windows.Media.Playback.IPlaybackMediaMarker
  Playback_IPlaybackMediaMarker = interface(IInspectable)
  ['{C4D22F5C-3C1C-4444-B6B9-778B0422D41A}']
    function get_Time: TimeSpan; safecall;
    function get_MediaMarkerType: HSTRING; safecall;
    function get_Text: HSTRING; safecall;
    property MediaMarkerType: HSTRING read get_MediaMarkerType;
    property Text: HSTRING read get_Text;
    property Time: TimeSpan read get_Time;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IPlaybackMediaMarker>
  IIterator_1__Playback_IPlaybackMediaMarker_Base = interface(IInspectable)
  ['{28607D6B-DAA4-5EEF-9F81-CC08A8297182}']
  end;
  {
  // Used Types:  Windows.Media.Playback.IPlaybackMediaMarker
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IPlaybackMediaMarker>
  IIterator_1__Playback_IPlaybackMediaMarker = interface(IIterator_1__Playback_IPlaybackMediaMarker_Base)
  ['{1F66316C-2B76-5A17-A111-315CB62DB044}']
    function get_Current: Playback_IPlaybackMediaMarker; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPlayback_IPlaybackMediaMarker): Cardinal; safecall;
    property Current: Playback_IPlaybackMediaMarker read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Windows.Media.Playback.IPlaybackMediaMarker
  }
  // Windows.Media.Playback.IPlaybackMediaMarkerSequence
  Playback_IPlaybackMediaMarkerSequence = interface(IInspectable)
  ['{F2810CEE-638B-46CF-8817-1D111FE9D8C4}']
    function get_Size: Cardinal; safecall;
    procedure Insert(value: Playback_IPlaybackMediaMarker); safecall;
    procedure Clear; safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.MediaPlayerError
  // Used Types:  Windows.Foundation.HResult
  // Used Types:  String
  }
  // Windows.Media.Playback.IMediaPlayerFailedEventArgs
  Playback_IMediaPlayerFailedEventArgs = interface(IInspectable)
  ['{2744E9B9-A7E3-4F16-BAC4-7914EBC08301}']
    function get_Error: Playback_MediaPlayerError; safecall;
    function get_ExtendedErrorCode: HRESULT; safecall;
    function get_ErrorMessage: HSTRING; safecall;
    property Error: Playback_MediaPlayerError read get_Error;
    property ErrorMessage: HSTRING read get_ErrorMessage;
    property ExtendedErrorCode: HRESULT read get_ExtendedErrorCode;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Double
  }
  // Windows.Media.Playback.IMediaPlayerRateChangedEventArgs
  Playback_IMediaPlayerRateChangedEventArgs = interface(IInspectable)
  ['{40600D58-3B61-4BB2-989F-FC65608B6CAB}']
    function get_NewRate: Double; safecall;
    property NewRate: Double read get_NewRate;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IPlaybackMediaMarker
  }
  // Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs
  Playback_IPlaybackMediaMarkerReachedEventArgs = interface(IInspectable)
  ['{578CD1B9-90E2-4E60-ABC4-8740B01F6196}']
    function get_PlaybackMediaMarker: Playback_IPlaybackMediaMarker; safecall;
    property PlaybackMediaMarker: Playback_IPlaybackMediaMarker read get_PlaybackMediaMarker;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Object>
  TypedEventHandler_2__Playback_IMediaPlayer__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F1A6A51E-D078-5C40-BA3F-348870BA5C87}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlayer
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Object>
  TypedEventHandler_2__Playback_IMediaPlayer__IInspectable = interface(TypedEventHandler_2__Playback_IMediaPlayer__IInspectable_Delegate_Base)
  ['{C518DF12-1F91-5238-AB1E-ED0D1B4AF00D}']
    procedure Invoke(sender: Playback_IMediaPlayer; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerFailedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{362C45A7-3A0A-5E27-99CE-CFF6D1B770E1}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlayer
  // Used Types:  Windows.Media.Playback.IMediaPlayerFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerFailedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs_Delegate_Base)
  ['{416FB539-55DA-5B1F-B050-E991869715AB}']
    procedure Invoke(sender: Playback_IMediaPlayer; args: Playback_IMediaPlayerFailedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs_Delegate_Base = interface(IUnknown)
  ['{67A4F43C-C254-57F0-A39D-A475A342D21D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlayer
  // Used Types:  Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs_Delegate_Base)
  ['{D606BDDF-91CB-55D2-91D2-4FFE2F1345E4}']
    procedure Invoke(sender: Playback_IMediaPlayer; args: Playback_IPlaybackMediaMarkerReachedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerRateChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{BA51D31A-5688-5D4D-AF42-122070B1EEFA}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlayer
  // Used Types:  Windows.Media.Playback.IMediaPlayerRateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerRateChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs_Delegate_Base)
  ['{921DB8BB-5597-594D-92F6-E1A10659F898}']
    procedure Invoke(sender: Playback_IMediaPlayer; args: Playback_IMediaPlayerRateChangedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Double
  // Used Types:  Windows.Media.Playback.MediaPlayerState
  // Used Types:  Windows.Media.Playback.IPlaybackMediaMarkerSequence
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Object>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerFailedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IPlaybackMediaMarkerReachedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlayer,Windows.Media.Playback.IMediaPlayerRateChangedEventArgs>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Media.Playback.IMediaPlayer
  Playback_IMediaPlayer = interface(IInspectable)
  ['{381A83CB-6FFF-499B-8D64-2885DFC1249E}']
    function get_AutoPlay: Boolean; safecall;
    procedure put_AutoPlay(value: Boolean); safecall;
    function get_NaturalDuration: TimeSpan; safecall;
    function get_Position: TimeSpan; safecall;
    procedure put_Position(value: TimeSpan); safecall;
    function get_BufferingProgress: Double; safecall;
    function get_CurrentState: Playback_MediaPlayerState; safecall;
    function get_CanSeek: Boolean; safecall;
    function get_CanPause: Boolean; safecall;
    function get_IsLoopingEnabled: Boolean; safecall;
    procedure put_IsLoopingEnabled(value: Boolean); safecall;
    function get_IsProtected: Boolean; safecall;
    function get_IsMuted: Boolean; safecall;
    procedure put_IsMuted(value: Boolean); safecall;
    function get_PlaybackRate: Double; safecall;
    procedure put_PlaybackRate(value: Double); safecall;
    function get_Volume: Double; safecall;
    procedure put_Volume(value: Double); safecall;
    function get_PlaybackMediaMarkers: Playback_IPlaybackMediaMarkerSequence; safecall;
    function add_MediaOpened(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MediaOpened(token: EventRegistrationToken); safecall;
    function add_MediaEnded(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_MediaEnded(token: EventRegistrationToken); safecall;
    function add_MediaFailed(value: TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_MediaFailed(token: EventRegistrationToken); safecall;
    function add_CurrentStateChanged(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_CurrentStateChanged(token: EventRegistrationToken); safecall;
    function add_PlaybackMediaMarkerReached(value: TypedEventHandler_2__Playback_IMediaPlayer__Playback_IPlaybackMediaMarkerReachedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PlaybackMediaMarkerReached(token: EventRegistrationToken); safecall;
    function add_MediaPlayerRateChanged(value: TypedEventHandler_2__Playback_IMediaPlayer__Playback_IMediaPlayerRateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_MediaPlayerRateChanged(token: EventRegistrationToken); safecall;
    function add_VolumeChanged(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_VolumeChanged(token: EventRegistrationToken); safecall;
    function add_SeekCompleted(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SeekCompleted(token: EventRegistrationToken); safecall;
    function add_BufferingStarted(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_BufferingStarted(token: EventRegistrationToken); safecall;
    function add_BufferingEnded(value: TypedEventHandler_2__Playback_IMediaPlayer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_BufferingEnded(token: EventRegistrationToken); safecall;
    procedure Play; safecall;
    procedure Pause; safecall;
    procedure SetUriSource(value: IUriRuntimeClass); safecall;
    property AutoPlay: Boolean read get_AutoPlay write put_AutoPlay;
    property BufferingProgress: Double read get_BufferingProgress;
    property CanPause: Boolean read get_CanPause;
    property CanSeek: Boolean read get_CanSeek;
    property CurrentState: Playback_MediaPlayerState read get_CurrentState;
    property IsLoopingEnabled: Boolean read get_IsLoopingEnabled write put_IsLoopingEnabled;
    property IsMuted: Boolean read get_IsMuted write put_IsMuted;
    property IsProtected: Boolean read get_IsProtected;
    property NaturalDuration: TimeSpan read get_NaturalDuration;
    property PlaybackMediaMarkers: Playback_IPlaybackMediaMarkerSequence read get_PlaybackMediaMarkers;
    property PlaybackRate: Double read get_PlaybackRate write put_PlaybackRate;
    property Position: TimeSpan read get_Position write put_Position;
    property Volume: Double read get_Volume write put_Volume;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Media.IMusicDisplayProperties
  IMusicDisplayProperties = interface(IInspectable)
  ['{6BBF0C59-D0A0-4D26-92A0-F978E1D18E7B}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_AlbumArtist: HSTRING; safecall;
    procedure put_AlbumArtist(value: HSTRING); safecall;
    function get_Artist: HSTRING; safecall;
    procedure put_Artist(value: HSTRING); safecall;
    property AlbumArtist: HSTRING read get_AlbumArtist write put_AlbumArtist;
    property Artist: HSTRING read get_Artist write put_Artist;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Media.IVideoDisplayProperties
  IVideoDisplayProperties = interface(IInspectable)
  ['{5609FDB1-5D2D-4872-8170-45DEE5BC2F5C}']
    function get_Title: HSTRING; safecall;
    procedure put_Title(value: HSTRING); safecall;
    function get_Subtitle: HSTRING; safecall;
    procedure put_Subtitle(value: HSTRING); safecall;
    property Subtitle: HSTRING read get_Subtitle write put_Subtitle;
    property Title: HSTRING read get_Title write put_Title;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Playback.IMediaPlaybackSource
  Playback_IMediaPlaybackSource = interface(IInspectable)
  ['{EF9DC2BC-9317-4696-B051-2BAD643177B5}']
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaCue>
  IIterator_1__Core_IMediaCue_Base = interface(IInspectable)
  ['{1A594DC8-A64B-55ED-9B34-7B274E1D5C70}']
  end;
  {
  // Used Types:  Windows.Media.Core.IMediaCue
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaCue>
  IIterator_1__Core_IMediaCue = interface(IIterator_1__Core_IMediaCue_Base)
  ['{1A594DC8-A64B-55ED-9B34-7B274E1D5C70}']
    function get_Current: Core_IMediaCue; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_IMediaCue): Cardinal; safecall;
    property Current: Core_IMediaCue read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaCue>
  IIterable_1__Core_IMediaCue_Base = interface(IInspectable)
  ['{737A2098-41BF-5D9F-A1D2-2F171C578B3C}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaCue>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaCue>
  IIterable_1__Core_IMediaCue = interface(IIterable_1__Core_IMediaCue_Base)
  ['{737A2098-41BF-5D9F-A1D2-2F171C578B3C}']
    function First: IIterator_1__Core_IMediaCue; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedMetadataTrack>
  IIterator_1__Core_ITimedMetadataTrack_Base = interface(IInspectable)
  ['{859354E5-077B-5D53-B297-1A07B97F09C3}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedMetadataTrack
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedMetadataTrack>
  IIterator_1__Core_ITimedMetadataTrack = interface(IIterator_1__Core_ITimedMetadataTrack_Base)
  ['{5C2DCA1F-749F-5EFD-BFAA-159A4EAC747D}']
    function get_Current: Core_ITimedMetadataTrack; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_ITimedMetadataTrack): Cardinal; safecall;
    property Current: Core_ITimedMetadataTrack read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedMetadataTrack>
  IIterable_1__Core_ITimedMetadataTrack_Base = interface(IInspectable)
  ['{150A4454-03BB-5DD1-8153-6A600E851F71}']
  end;
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedMetadataTrack>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedMetadataTrack>
  IIterable_1__Core_ITimedMetadataTrack = interface(IIterable_1__Core_ITimedMetadataTrack_Base)
  ['{2B6AF8CA-3ADF-5703-8D95-B712D018DB94}']
    function First: IIterator_1__Core_ITimedMetadataTrack; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedMetadataTrackError
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>
  }
  // Windows.Media.Core.ITimedTextSourceResolveResultEventArgs
  [WinRTClassNameAttribute(SCore_TimedTextSourceResolveResultEventArgs)]
  Core_ITimedTextSourceResolveResultEventArgs = interface(IInspectable)
  ['{48907C9C-DCD8-4C33-9AD3-6CDCE7B1C566}']
    function get_Error: Core_ITimedMetadataTrackError; safecall;
    function get_Tracks: IVectorView_1__Core_ITimedMetadataTrack; safecall;
    property Error: Core_ITimedMetadataTrackError read get_Error;
    property Tracks: IVectorView_1__Core_ITimedMetadataTrack read get_Tracks;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedTextSource,Windows.Media.Core.ITimedTextSourceResolveResultEventArgs>
  TypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs_Delegate_Base = interface(IUnknown)
  ['{0220562A-5DE4-5AD2-AC20-6CD26F111745}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextSource
  // Used Types:  Windows.Media.Core.ITimedTextSourceResolveResultEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedTextSource,Windows.Media.Core.ITimedTextSourceResolveResultEventArgs>
  TypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs = interface(TypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs_Delegate_Base)
  ['{38560393-CB87-5DD9-A3BE-300ECC2F9C0D}']
    procedure Invoke(sender: Core_ITimedTextSource; args: Core_ITimedTextSourceResolveResultEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ITimedTextSource,Windows.Media.Core.ITimedTextSourceResolveResultEventArgs>
  }
  // Windows.Media.Core.ITimedTextSource
  [WinRTClassNameAttribute(SCore_TimedTextSource)]
  Core_ITimedTextSource = interface(IInspectable)
  ['{C4ED9BA6-101F-404D-A949-82F33FCD93B7}']
    function add_Resolved(handler: TypedEventHandler_2__Core_ITimedTextSource__Core_ITimedTextSourceResolveResultEventArgs): EventRegistrationToken; safecall;
    procedure remove_Resolved(token: EventRegistrationToken); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSource>
  IIterator_1__Core_ITimedTextSource_Base = interface(IInspectable)
  ['{BDDED7C0-5C73-57F5-9B08-652933586DD5}']
  end;
  {
  // Used Types:  Windows.Media.Core.ITimedTextSource
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSource>
  IIterator_1__Core_ITimedTextSource = interface(IIterator_1__Core_ITimedTextSource_Base)
  ['{7B26AAC5-FA64-5F77-B899-673454375B42}']
    function get_Current: Core_ITimedTextSource; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_ITimedTextSource): Cardinal; safecall;
    property Current: Core_ITimedTextSource read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextSource>
  IIterable_1__Core_ITimedTextSource_Base = interface(IInspectable)
  ['{4FC57282-0EDF-5D85-9D89-DDC2A5692C13}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.ITimedTextSource>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedTextSource>
  IIterable_1__Core_ITimedTextSource = interface(IIterable_1__Core_ITimedTextSource_Base)
  ['{DE79E1C9-A094-57A6-95EE-91F58F4EEC5E}']
    function First: IIterator_1__Core_ITimedTextSource; safecall;
  end;

  {
  // Used Types:  Windows.Media.Core.ITimedTextSource
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextSource>
  IVectorView_1__Core_ITimedTextSource = interface(IInspectable)
  ['{BA85D72E-0B17-521D-A537-4D3333084540}']
    function GetAt(index: Cardinal): Core_ITimedTextSource; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_ITimedTextSource; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedTextSource): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Media.Core.ITimedTextSource
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedTextSource>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedTextSource>
  IVector_1__Core_ITimedTextSource = interface(IInspectable)
  ['{E0695D2A-E7B6-54B1-8564-ACA965A35E12}']
    function GetAt(index: Cardinal): Core_ITimedTextSource; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Core_ITimedTextSource; safecall;
    function IndexOf(value: Core_ITimedTextSource; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Core_ITimedTextSource); safecall;
    procedure InsertAt(index: Cardinal; value: Core_ITimedTextSource); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Core_ITimedTextSource); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedTextSource): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCore_ITimedTextSource); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Media.Core.ITimedMetadataTrack
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Core.ITimedMetadataTrack>
  IVector_1__Core_ITimedMetadataTrack = interface(IInspectable)
  ['{23E79F93-8448-589C-BB48-9AD242933EB9}']
    function GetAt(index: Cardinal): Core_ITimedMetadataTrack; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Core_ITimedMetadataTrack; safecall;
    function IndexOf(value: Core_ITimedMetadataTrack; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Core_ITimedMetadataTrack); safecall;
    procedure InsertAt(index: Cardinal; value: Core_ITimedMetadataTrack); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Core_ITimedMetadataTrack); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_ITimedMetadataTrack): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PCore_ITimedMetadataTrack); safecall;
    property Size: Cardinal read get_Size;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaTrack
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaTrack>
  IIterator_1__Core_IMediaTrack = interface(IInspectable)
  ['{1080BE0A-E89C-5E8D-8535-AEAD52CADA8D}']
    function get_Current: Core_IMediaTrack; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_IMediaTrack): Cardinal; safecall;
    property Current: Core_IMediaTrack read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMediaTrack>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaTrack>
  IIterable_1__Core_IMediaTrack = interface(IInspectable)
  ['{4B7F70F1-451D-58CD-A2F7-F80429A9A1EB}']
    function First: IIterator_1__Core_IMediaTrack; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.MediaPlaybackItemErrorCode
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Media.Playback.IMediaPlaybackItemError
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackItemError)]
  Playback_IMediaPlaybackItemError = interface(IInspectable)
  ['{69FBEF2B-DCD6-4DF9-A450-DBF4C6F1C2C2}']
    function get_ErrorCode: Playback_MediaPlaybackItemErrorCode; safecall;
    function get_ExtendedError: HRESULT; safecall;
    property ErrorCode: Playback_MediaPlaybackItemErrorCode read get_ErrorCode;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItemError
  }
  // Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackItemFailedEventArgs)]
  Playback_IMediaPlaybackItemFailedEventArgs = interface(IInspectable)
  ['{7703134A-E9A7-47C3-862C-C656D30683D4}']
    function get_Item: Playback_IMediaPlaybackItem; safecall;
    function get_Error: Playback_IMediaPlaybackItemError; safecall;
    property Error: Playback_IMediaPlaybackItemError read get_Error;
    property Item: Playback_IMediaPlaybackItem read get_Item;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{23319E7D-34B1-57B7-97E5-844948BA4719}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackList
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs_Delegate_Base)
  ['{1F76DC5C-1C50-5B41-BB8E-8D5484D21BFC}']
    procedure Invoke(sender: Playback_IMediaPlaybackList; args: Playback_IMediaPlaybackItemFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  }
  // Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs
  [WinRTClassNameAttribute(SPlayback_CurrentMediaPlaybackItemChangedEventArgs)]
  Playback_ICurrentMediaPlaybackItemChangedEventArgs = interface(IInspectable)
  ['{1743A892-5C43-4A15-967A-572D2D0F26C6}']
    function get_NewItem: Playback_IMediaPlaybackItem; safecall;
    function get_OldItem: Playback_IMediaPlaybackItem; safecall;
    property NewItem: Playback_IMediaPlaybackItem read get_NewItem;
    property OldItem: Playback_IMediaPlaybackItem read get_OldItem;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{404C5F9D-250D-5F8C-9627-6B4105C32D09}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackList
  // Used Types:  Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs_Delegate_Base)
  ['{72062F95-CEC4-5AB6-B38E-DCA1F7E0AFAD}']
    procedure Invoke(sender: Playback_IMediaPlaybackList; args: Playback_ICurrentMediaPlaybackItemChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  }
  // Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackItemOpenedEventArgs)]
  Playback_IMediaPlaybackItemOpenedEventArgs = interface(IInspectable)
  ['{CBD9BD82-3037-4FBE-AE8F-39FC39EDF4EF}']
    function get_Item: Playback_IMediaPlaybackItem; safecall;
    property Item: Playback_IMediaPlaybackItem read get_Item;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs_Delegate_Base = interface(IUnknown)
  ['{6732BBEF-3311-5F83-9C9D-82A5CF3CD82A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackList
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs>
  TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs = interface(TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs_Delegate_Base)
  ['{885F3922-DD52-5541-BE52-D6EECEED6876}']
    procedure Invoke(sender: Playback_IMediaPlaybackList; args: Playback_IMediaPlaybackItemOpenedEventArgs); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaPlaybackItem>
  IIterator_1__Playback_IMediaPlaybackItem_Base = interface(IInspectable)
  ['{AB074059-8C08-53E7-9654-02D2598FFF55}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaPlaybackItem>
  IIterator_1__Playback_IMediaPlaybackItem = interface(IIterator_1__Playback_IMediaPlaybackItem_Base)
  ['{A907ECB0-09C8-5486-914B-5FF26F18201A}']
    function get_Current: Playback_IMediaPlaybackItem; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPlayback_IMediaPlaybackItem): Cardinal; safecall;
    property Current: Playback_IMediaPlaybackItem read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaPlaybackItem>
  IIterable_1__Playback_IMediaPlaybackItem_Base = interface(IInspectable)
  ['{8B8AB4A4-0253-56E9-A232-94E335AEFA8F}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaPlaybackItem>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaPlaybackItem>
  IIterable_1__Playback_IMediaPlaybackItem = interface(IIterable_1__Playback_IMediaPlaybackItem_Base)
  ['{C6A18D55-5131-5BB3-8E5D-13B6412B951F}']
    function First: IIterator_1__Playback_IMediaPlaybackItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaPlaybackItem>
  IVectorView_1__Playback_IMediaPlaybackItem = interface(IInspectable)
  ['{8C2857DE-FC0E-55E9-AD49-247B154BBBE0}']
    function GetAt(index: Cardinal): Playback_IMediaPlaybackItem; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Playback_IMediaPlaybackItem; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPlayback_IMediaPlaybackItem): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaPlaybackItem>
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVector`1<Windows.Media.Playback.IMediaPlaybackItem>
  IVector_1__Playback_IMediaPlaybackItem = interface(IInspectable)
  ['{55C2EF00-81DA-55D1-8A4A-57146FA8F06E}']
    function GetAt(index: Cardinal): Playback_IMediaPlaybackItem; safecall;
    function get_Size: Cardinal; safecall;
    function GetView: IVectorView_1__Playback_IMediaPlaybackItem; safecall;
    function IndexOf(value: Playback_IMediaPlaybackItem; out index: Cardinal): Boolean; safecall;
    procedure SetAt(index: Cardinal; value: Playback_IMediaPlaybackItem); safecall;
    procedure InsertAt(index: Cardinal; value: Playback_IMediaPlaybackItem); safecall;
    procedure RemoveAt(index: Cardinal); safecall;
    procedure Append(value: Playback_IMediaPlaybackItem); safecall;
    procedure RemoveAtEnd; safecall;
    procedure Clear; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPlayback_IMediaPlaybackItem): Cardinal; safecall;
    procedure ReplaceAll(itemsSize: Cardinal; items: PPlayback_IMediaPlaybackItem); safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Delegate for 
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Playback.IMediaPlaybackItem>
  VectorChangedEventHandler_1__Playback_IMediaPlaybackItem_Delegate_Base = interface(IUnknown)
  ['{891BDDDE-6BF3-5D1F-80AB-5A342A16A0BB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Playback.IMediaPlaybackItem>
  // Used Types:  Windows.Foundation.Collections.IVectorChangedEventArgs
  }
  // Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Playback.IMediaPlaybackItem>
  VectorChangedEventHandler_1__Playback_IMediaPlaybackItem = interface(VectorChangedEventHandler_1__Playback_IMediaPlaybackItem_Delegate_Base)
  ['{F8775AF8-7117-526E-9A5A-253D61782515}']
    procedure Invoke(sender: IObservableVector_1__Playback_IMediaPlaybackItem; event: IVectorChangedEventArgs); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.Collections.VectorChangedEventHandler`1<Windows.Media.Playback.IMediaPlaybackItem>
  }
  // Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Playback.IMediaPlaybackItem>
  IObservableVector_1__Playback_IMediaPlaybackItem = interface(IInspectable)
  ['{12101F97-44F6-51BF-A04B-DFAE83A2BD3D}']
    function add_VectorChanged(vhnd: VectorChangedEventHandler_1__Playback_IMediaPlaybackItem): EventRegistrationToken; safecall;
    procedure remove_VectorChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackList,Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs>
  // Used Types:  Windows.Foundation.Collections.IObservableVector`1<Windows.Media.Playback.IMediaPlaybackItem>
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  UInt32
  }
  // Windows.Media.Playback.IMediaPlaybackList
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackList)]
  Playback_IMediaPlaybackList = interface(IInspectable)
  ['{7F77EE9C-DC42-4E26-A98D-7850DF8EC925}']
    function add_ItemFailed(handler: TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ItemFailed(token: EventRegistrationToken); safecall;
    function add_CurrentItemChanged(handler: TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_ICurrentMediaPlaybackItemChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_CurrentItemChanged(token: EventRegistrationToken); safecall;
    function add_ItemOpened(handler: TypedEventHandler_2__Playback_IMediaPlaybackList__Playback_IMediaPlaybackItemOpenedEventArgs): EventRegistrationToken; safecall;
    procedure remove_ItemOpened(token: EventRegistrationToken); safecall;
    function get_Items: IObservableVector_1__Playback_IMediaPlaybackItem; safecall;
    function get_AutoRepeatEnabled: Boolean; safecall;
    procedure put_AutoRepeatEnabled(value: Boolean); safecall;
    function get_ShuffleEnabled: Boolean; safecall;
    procedure put_ShuffleEnabled(value: Boolean); safecall;
    function get_CurrentItem: Playback_IMediaPlaybackItem; safecall;
    function get_CurrentItemIndex: Cardinal; safecall;
    function MoveNext: Playback_IMediaPlaybackItem; safecall;
    function MovePrevious: Playback_IMediaPlaybackItem; safecall;
    function MoveTo(itemIndex: Cardinal): Playback_IMediaPlaybackItem; safecall;
    property AutoRepeatEnabled: Boolean read get_AutoRepeatEnabled write put_AutoRepeatEnabled;
    property CurrentItem: Playback_IMediaPlaybackItem read get_CurrentItem;
    property CurrentItemIndex: Cardinal read get_CurrentItemIndex;
    property Items: IObservableVector_1__Playback_IMediaPlaybackItem read get_Items;
    property ShuffleEnabled: Boolean read get_ShuffleEnabled write put_ShuffleEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackList
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Media.Playback.MediaBreakInsertionMethod
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Boolean
  }
  // Windows.Media.Playback.IMediaBreak
  [WinRTClassNameAttribute(SPlayback_MediaBreak)]
  Playback_IMediaBreak = interface(IInspectable)
  ['{714BE270-0DEF-4EBC-A489-6B34930E1558}']
    function get_PlaybackList: Playback_IMediaPlaybackList; safecall;
    function get_PresentationPosition: IReference_1__TimeSpan; safecall;
    function get_InsertionMethod: Playback_MediaBreakInsertionMethod; safecall;
    function get_CustomProperties: IPropertySet; safecall;
    function get_CanStart: Boolean; safecall;
    procedure put_CanStart(value: Boolean); safecall;
    property CanStart: Boolean read get_CanStart write put_CanStart;
    property CustomProperties: IPropertySet read get_CustomProperties;
    property InsertionMethod: Playback_MediaBreakInsertionMethod read get_InsertionMethod;
    property PlaybackList: Playback_IMediaPlaybackList read get_PlaybackList;
    property PresentationPosition: IReference_1__TimeSpan read get_PresentationPosition;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaBreak>
  IIterator_1__Playback_IMediaBreak_Base = interface(IInspectable)
  ['{9EFD8746-F93C-524F-9F95-4B598ACF8D25}']
  end;
  {
  // Used Types:  Windows.Media.Playback.IMediaBreak
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaBreak>
  IIterator_1__Playback_IMediaBreak = interface(IIterator_1__Playback_IMediaBreak_Base)
  ['{0E52857C-CDBB-5D21-8C14-786B851771AB}']
    function get_Current: Playback_IMediaBreak; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PPlayback_IMediaBreak): Cardinal; safecall;
    property Current: Playback_IMediaBreak read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaBreak>
  IIterable_1__Playback_IMediaBreak_Base = interface(IInspectable)
  ['{04F000EC-C727-5DC0-9F7C-245C75C92F2F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Playback.IMediaBreak>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaBreak>
  IIterable_1__Playback_IMediaBreak = interface(IIterable_1__Playback_IMediaBreak_Base)
  ['{BD9FE0F7-8075-5545-83FD-10974A92FB52}']
    function First: IIterator_1__Playback_IMediaBreak; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreak
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaBreak>
  IVectorView_1__Playback_IMediaBreak = interface(IInspectable)
  ['{5364733C-FC49-5B03-812C-457C4DC654EA}']
    function GetAt(index: Cardinal): Playback_IMediaBreak; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Playback_IMediaBreak; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PPlayback_IMediaBreak): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaBreak>
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Playback.IMediaBreakSeekedOverEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaBreakSeekedOverEventArgs)]
  Playback_IMediaBreakSeekedOverEventArgs = interface(IInspectable)
  ['{E5AA6746-0606-4492-B9D3-C3C8FDE0A4EA}']
    function get_SeekedOverBreaks: IVectorView_1__Playback_IMediaBreak; safecall;
    function get_OldPosition: TimeSpan; safecall;
    function get_NewPosition: TimeSpan; safecall;
    property NewPosition: TimeSpan read get_NewPosition;
    property OldPosition: TimeSpan read get_OldPosition;
    property SeekedOverBreaks: IVectorView_1__Playback_IMediaBreak read get_SeekedOverBreaks;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSeekedOverEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs_Delegate_Base = interface(IUnknown)
  ['{A6954C30-99DC-5F84-B482-7D0692C0277B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreakManager
  // Used Types:  Windows.Media.Playback.IMediaBreakSeekedOverEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSeekedOverEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs = interface(TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs_Delegate_Base)
  ['{2551BC24-14FE-56FC-B2A2-E9A9EF24CB73}']
    procedure Invoke(sender: Playback_IMediaBreakManager; args: Playback_IMediaBreakSeekedOverEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreak
  }
  // Windows.Media.Playback.IMediaBreakStartedEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaBreakStartedEventArgs)]
  Playback_IMediaBreakStartedEventArgs = interface(IInspectable)
  ['{A87EFE71-DFD4-454A-956E-0A4A648395F8}']
    function get_MediaBreak: Playback_IMediaBreak; safecall;
    property MediaBreak: Playback_IMediaBreak read get_MediaBreak;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakStartedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs_Delegate_Base = interface(IUnknown)
  ['{4BF2CCA1-CD9D-5D88-9E47-1881201BB72D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreakManager
  // Used Types:  Windows.Media.Playback.IMediaBreakStartedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakStartedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs = interface(TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs_Delegate_Base)
  ['{96ECCA9F-F223-51A2-858A-F53108F9348F}']
    procedure Invoke(sender: Playback_IMediaBreakManager; args: Playback_IMediaBreakStartedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreak
  }
  // Windows.Media.Playback.IMediaBreakEndedEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaBreakEndedEventArgs)]
  Playback_IMediaBreakEndedEventArgs = interface(IInspectable)
  ['{32B93276-1C5D-4FEE-8732-236DC3A88580}']
    function get_MediaBreak: Playback_IMediaBreak; safecall;
    property MediaBreak: Playback_IMediaBreak read get_MediaBreak;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakEndedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs_Delegate_Base = interface(IUnknown)
  ['{04AFAFA9-D83A-5CCB-8CAB-82C9D92A19AB}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreakManager
  // Used Types:  Windows.Media.Playback.IMediaBreakEndedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakEndedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs = interface(TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs_Delegate_Base)
  ['{A1A2603F-7AA9-51C9-9C0F-F0CD263681D3}']
    procedure Invoke(sender: Playback_IMediaBreakManager; args: Playback_IMediaBreakEndedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreak
  }
  // Windows.Media.Playback.IMediaBreakSkippedEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaBreakSkippedEventArgs)]
  Playback_IMediaBreakSkippedEventArgs = interface(IInspectable)
  ['{6EE94C05-2F54-4A3E-A3AB-24C3B270B4A3}']
    function get_MediaBreak: Playback_IMediaBreak; safecall;
    property MediaBreak: Playback_IMediaBreak read get_MediaBreak;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSkippedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs_Delegate_Base = interface(IUnknown)
  ['{C530FA5D-1A56-582A-A254-1B1AE17B8D2D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreakManager
  // Used Types:  Windows.Media.Playback.IMediaBreakSkippedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSkippedEventArgs>
  TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs = interface(TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs_Delegate_Base)
  ['{A949A5FD-79B7-5D4A-AAA6-04C07E3C7D48}']
    procedure Invoke(sender: Playback_IMediaBreakManager; args: Playback_IMediaBreakSkippedEventArgs); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackSession,Object>
  TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable_Delegate_Base = interface(IUnknown)
  ['{7C70F38D-2AA1-5522-A6D6-34B52B988AE7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackSession
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackSession,Object>
  TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable = interface(TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable_Delegate_Base)
  ['{6906939A-458F-5864-9CB0-15E4F01F4BC0}']
    procedure Invoke(sender: Playback_IMediaPlaybackSession; args: IInspectable); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaPlaybackSession,Object>
  // Used Types:  Windows.Media.Playback.IMediaPlayer
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Media.Playback.MediaPlaybackState
  // Used Types:  Boolean
  // Used Types:  Double
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Rect
  // Used Types:  Windows.Media.MediaProperties.StereoscopicVideoPackingMode
  }
  // Windows.Media.Playback.IMediaPlaybackSession
  Playback_IMediaPlaybackSession = interface(IInspectable)
  ['{C32B683D-0407-41BA-8946-8B345A5A5435}']
    function add_PlaybackStateChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PlaybackStateChanged(token: EventRegistrationToken); safecall;
    function add_PlaybackRateChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PlaybackRateChanged(token: EventRegistrationToken); safecall;
    function add_SeekCompleted(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SeekCompleted(token: EventRegistrationToken); safecall;
    function add_BufferingStarted(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_BufferingStarted(token: EventRegistrationToken); safecall;
    function add_BufferingEnded(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_BufferingEnded(token: EventRegistrationToken); safecall;
    function add_BufferingProgressChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_BufferingProgressChanged(token: EventRegistrationToken); safecall;
    function add_DownloadProgressChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_DownloadProgressChanged(token: EventRegistrationToken); safecall;
    function add_NaturalDurationChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_NaturalDurationChanged(token: EventRegistrationToken); safecall;
    function add_PositionChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PositionChanged(token: EventRegistrationToken); safecall;
    function add_NaturalVideoSizeChanged(value: TypedEventHandler_2__Playback_IMediaPlaybackSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_NaturalVideoSizeChanged(token: EventRegistrationToken); safecall;
    function get_MediaPlayer: Playback_IMediaPlayer; safecall;
    function get_NaturalDuration: TimeSpan; safecall;
    function get_Position: TimeSpan; safecall;
    procedure put_Position(value: TimeSpan); safecall;
    function get_PlaybackState: Playback_MediaPlaybackState; safecall;
    function get_CanSeek: Boolean; safecall;
    function get_CanPause: Boolean; safecall;
    function get_IsProtected: Boolean; safecall;
    function get_PlaybackRate: Double; safecall;
    procedure put_PlaybackRate(value: Double); safecall;
    function get_BufferingProgress: Double; safecall;
    function get_DownloadProgress: Double; safecall;
    function get_NaturalVideoHeight: Cardinal; safecall;
    function get_NaturalVideoWidth: Cardinal; safecall;
    function get_NormalizedSourceRect: TRectF; safecall;
    procedure put_NormalizedSourceRect(value: TRectF); safecall;
    function get_StereoscopicVideoPackingMode: StereoscopicVideoPackingMode; safecall;
    procedure put_StereoscopicVideoPackingMode(value: StereoscopicVideoPackingMode); safecall;
    property BufferingProgress: Double read get_BufferingProgress;
    property CanPause: Boolean read get_CanPause;
    property CanSeek: Boolean read get_CanSeek;
    property DownloadProgress: Double read get_DownloadProgress;
    property IsProtected: Boolean read get_IsProtected;
    property MediaPlayer: Playback_IMediaPlayer read get_MediaPlayer;
    property NaturalDuration: TimeSpan read get_NaturalDuration;
    property NaturalVideoHeight: Cardinal read get_NaturalVideoHeight;
    property NaturalVideoWidth: Cardinal read get_NaturalVideoWidth;
    property NormalizedSourceRect: TRectF read get_NormalizedSourceRect write put_NormalizedSourceRect;
    property PlaybackRate: Double read get_PlaybackRate write put_PlaybackRate;
    property PlaybackState: Playback_MediaPlaybackState read get_PlaybackState;
    property Position: TimeSpan read get_Position write put_Position;
    property StereoscopicVideoPackingMode: StereoscopicVideoPackingMode read get_StereoscopicVideoPackingMode write put_StereoscopicVideoPackingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSeekedOverEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakStartedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakEndedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakManager,Windows.Media.Playback.IMediaBreakSkippedEventArgs>
  // Used Types:  Windows.Media.Playback.IMediaBreak
  // Used Types:  Windows.Media.Playback.IMediaPlaybackSession
  }
  // Windows.Media.Playback.IMediaBreakManager
  [WinRTClassNameAttribute(SPlayback_MediaBreakManager)]
  Playback_IMediaBreakManager = interface(IInspectable)
  ['{A854DDB1-FEB4-4D9B-9D97-0FDBE58E5E39}']
    function add_BreaksSeekedOver(handler: TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSeekedOverEventArgs): EventRegistrationToken; safecall;
    procedure remove_BreaksSeekedOver(token: EventRegistrationToken); safecall;
    function add_BreakStarted(handler: TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakStartedEventArgs): EventRegistrationToken; safecall;
    procedure remove_BreakStarted(token: EventRegistrationToken); safecall;
    function add_BreakEnded(handler: TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakEndedEventArgs): EventRegistrationToken; safecall;
    procedure remove_BreakEnded(token: EventRegistrationToken); safecall;
    function add_BreakSkipped(handler: TypedEventHandler_2__Playback_IMediaBreakManager__Playback_IMediaBreakSkippedEventArgs): EventRegistrationToken; safecall;
    procedure remove_BreakSkipped(token: EventRegistrationToken); safecall;
    function get_CurrentBreak: Playback_IMediaBreak; safecall;
    function get_PlaybackSession: Playback_IMediaPlaybackSession; safecall;
    procedure PlayBreak(value: Playback_IMediaBreak); safecall;
    procedure SkipCurrentBreak; safecall;
    property CurrentBreak: Playback_IMediaBreak read get_CurrentBreak;
    property PlaybackSession: Playback_IMediaPlaybackSession read get_PlaybackSession;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Object>
  TypedEventHandler_2__IMediaTimelineController__IInspectable_Delegate_Base = interface(IUnknown)
  ['{5C43E195-7D39-5D0D-A309-1991E68ACDB7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IMediaTimelineController
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Object>
  TypedEventHandler_2__IMediaTimelineController__IInspectable = interface(TypedEventHandler_2__IMediaTimelineController__IInspectable_Delegate_Base)
  ['{3DA0371A-AD02-5A49-B719-6A3FABFE85A6}']
    procedure Invoke(sender: IMediaTimelineController; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Double
  // Used Types:  Windows.Media.MediaTimelineControllerState
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Object>
  }
  // Windows.Media.IMediaTimelineController
  [WinRTClassNameAttribute(SMediaTimelineController)]
  IMediaTimelineController = interface(IInspectable)
  ['{8ED361F3-0B78-4360-BF71-0C841999EA1B}']
    procedure Start; safecall;
    procedure Resume; safecall;
    procedure Pause; safecall;
    function get_Position: TimeSpan; safecall;
    procedure put_Position(value: TimeSpan); safecall;
    function get_ClockRate: Double; safecall;
    procedure put_ClockRate(value: Double); safecall;
    function get_State: MediaTimelineControllerState; safecall;
    function add_PositionChanged(positionChangedEventHandler: TypedEventHandler_2__IMediaTimelineController__IInspectable): EventRegistrationToken; safecall;
    procedure remove_PositionChanged(eventCookie: EventRegistrationToken); safecall;
    function add_StateChanged(stateChangedEventHandler: TypedEventHandler_2__IMediaTimelineController__IInspectable): EventRegistrationToken; safecall;
    procedure remove_StateChanged(eventCookie: EventRegistrationToken); safecall;
    property ClockRate: Double read get_ClockRate write put_ClockRate;
    property Position: TimeSpan read get_Position write put_Position;
    property State: MediaTimelineControllerState read get_State;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaTimeRange>
  IIterator_1__MediaTimeRange_Base = interface(IInspectable)
  ['{29B8D190-5E46-5873-AFC0-8F2F40FBE8FD}']
  end;
  {
  // Used Types:  Windows.Media.MediaTimeRange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaTimeRange>
  IIterator_1__MediaTimeRange = interface(IIterator_1__MediaTimeRange_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: MediaTimeRange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PMediaTimeRange): Cardinal; safecall;
    property Current: MediaTimeRange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaTimeRange>
  IIterable_1__MediaTimeRange_Base = interface(IInspectable)
  ['{268204E2-9D52-5E7B-A54B-869C63DEFC8E}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaTimeRange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaTimeRange>
  IIterable_1__MediaTimeRange = interface(IIterable_1__MediaTimeRange_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__MediaTimeRange; safecall;
  end;

  {
  // Used Types:  Windows.Media.MediaTimeRange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaTimeRange>
  IVectorView_1__MediaTimeRange = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): MediaTimeRange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: MediaTimeRange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PMediaTimeRange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.Playback.IMediaPlaybackSessionBufferingStartedEventArgs
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackSessionBufferingStartedEventArgs)]
  Playback_IMediaPlaybackSessionBufferingStartedEventArgs = interface(IInspectable)
  ['{CD6AAFED-74E2-43B5-B115-76236C33791A}']
    function get_IsPlaybackInterruption: Boolean; safecall;
    property IsPlaybackInterruption: Boolean read get_IsPlaybackInterruption;
  end;

  {
  // Used Types:  UInt8[]
  }
  // Windows.Media.Protection.PlayReady.INDSendResult
  Protection_PlayReady_INDSendResult = interface(IInspectable)
  ['{E3685517-A584-479D-90B7-D689C7BF7C80}']
    function get_Response(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
    // property Response: PByte read get_Response;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDSendResult>
  AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult_Delegate_Base = interface(IUnknown)
  ['{C6C485D0-FDAB-5142-B079-97AF0567F0B6}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDSendResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDSendResult>
  AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult = interface(AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult_Delegate_Base)
  ['{C6C485D0-FDAB-5142-B079-97AF0567F0B6}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Protection_PlayReady_INDSendResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDSendResult>
  IAsyncOperation_1__Protection_PlayReady_INDSendResult_Base = interface(IInspectable)
  ['{6C3788A8-0E6D-5E29-9AD1-D88A65EB500B}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDSendResult>
  // Used Types:  Windows.Media.Protection.PlayReady.INDSendResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDSendResult>
  IAsyncOperation_1__Protection_PlayReady_INDSendResult = interface(IAsyncOperation_1__Protection_PlayReady_INDSendResult_Base)
  ['{6C3788A8-0E6D-5E29-9AD1-D88A65EB500B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult; safecall;
    function GetResults: Protection_PlayReady_INDSendResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Protection_PlayReady_INDSendResult read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Media.Protection.PlayReady.NDCertificateType
  // Used Types:  Windows.Media.Protection.PlayReady.NDCertificatePlatformID
  // Used Types:  Windows.Media.Protection.PlayReady.NDCertificateFeature[]
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.DateTime
  // Used Types:  UInt8[]
  // Used Types:  String
  }
  // Windows.Media.Protection.PlayReady.INDTransmitterProperties
  Protection_PlayReady_INDTransmitterProperties = interface(IInspectable)
  ['{E536AF23-AC4F-4ADC-8C66-4FF7C2702DD6}']
    function get_CertificateType: Protection_PlayReady_NDCertificateType; safecall;
    function get_PlatformIdentifier: Protection_PlayReady_NDCertificatePlatformID; safecall;
    function get_SupportedFeatures(resultSize: Cardinal; resultValue: PProtection_PlayReady_NDCertificateFeature): HRESULT; stdcall;
    function get_SecurityLevel: Cardinal; safecall;
    function get_SecurityVersion: Cardinal; safecall;
    function get_ExpirationDate: DateTime; safecall;
    function get_ClientID(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
    function get_ModelDigest(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
    function get_ModelManufacturerName: HSTRING; safecall;
    function get_ModelName: HSTRING; safecall;
    function get_ModelNumber: HSTRING; safecall;
    property CertificateType: Protection_PlayReady_NDCertificateType read get_CertificateType;
    // property ClientID: PByte read get_ClientID;
    property ExpirationDate: DateTime read get_ExpirationDate;
    // property ModelDigest: PByte read get_ModelDigest;
    property ModelManufacturerName: HSTRING read get_ModelManufacturerName;
    property ModelName: HSTRING read get_ModelName;
    property ModelNumber: HSTRING read get_ModelNumber;
    property PlatformIdentifier: Protection_PlayReady_NDCertificatePlatformID read get_PlatformIdentifier;
    property SecurityLevel: Cardinal read get_SecurityLevel;
    property SecurityVersion: Cardinal read get_SecurityVersion;
    // property SupportedFeatures: PProtection_PlayReady_NDCertificateFeature read get_SupportedFeatures;
  end deprecated;

  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  }
  // Windows.Media.Protection.PlayReady.INDStartResult
  Protection_PlayReady_INDStartResult = interface(IInspectable)
  ['{79F6E96E-F50F-4015-8BA4-C2BC344EBD4E}']
    function get_MediaStreamSource: Core_IMediaStreamSource; safecall;
    property MediaStreamSource: Core_IMediaStreamSource read get_MediaStreamSource;
  end deprecated;

  {
  // Used Types:  UInt32
  }
  // Windows.Media.Protection.PlayReady.INDProximityDetectionCompletedEventArgs
  Protection_PlayReady_INDProximityDetectionCompletedEventArgs = interface(IInspectable)
  ['{2A706328-DA25-4F8C-9EB7-5D0FC3658BCA}']
    function get_ProximityDetectionRetryCount: Cardinal; safecall;
    property ProximityDetectionRetryCount: Cardinal read get_ProximityDetectionRetryCount;
  end deprecated;

  {
  // Used Types:  Windows.Media.Protection.PlayReady.NDClosedCaptionFormat
  // Used Types:  Int64
  // Used Types:  UInt8[]
  }
  // Windows.Media.Protection.PlayReady.INDClosedCaptionDataReceivedEventArgs
  Protection_PlayReady_INDClosedCaptionDataReceivedEventArgs = interface(IInspectable)
  ['{4738D29F-C345-4649-8468-B8C5FC357190}']
    function get_ClosedCaptionDataFormat: Protection_PlayReady_NDClosedCaptionFormat; safecall;
    function get_PresentationTimestamp: Int64; safecall;
    function get_ClosedCaptionData(resultSize: Cardinal; resultValue: PByte): HRESULT; stdcall;
    // property ClosedCaptionData: PByte read get_ClosedCaptionData;
    property ClosedCaptionDataFormat: Protection_PlayReady_NDClosedCaptionFormat read get_ClosedCaptionDataFormat;
    property PresentationTimestamp: Int64 read get_PresentationTimestamp;
  end deprecated;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDStartResult>
  AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult_Delegate_Base = interface(IUnknown)
  ['{1E4E3760-B22B-5F0A-9058-475AFF310DB5}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDStartResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDStartResult>
  AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult = interface(AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult_Delegate_Base)
  ['{1E4E3760-B22B-5F0A-9058-475AFF310DB5}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Protection_PlayReady_INDStartResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDStartResult>
  IAsyncOperation_1__Protection_PlayReady_INDStartResult_Base = interface(IInspectable)
  ['{01FAB63E-6AAB-54A2-80F7-DBED22F58D56}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.PlayReady.INDStartResult>
  // Used Types:  Windows.Media.Protection.PlayReady.INDStartResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.PlayReady.INDStartResult>
  IAsyncOperation_1__Protection_PlayReady_INDStartResult = interface(IAsyncOperation_1__Protection_PlayReady_INDStartResult_Base)
  ['{01FAB63E-6AAB-54A2-80F7-DBED22F58D56}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult; safecall;
    function GetResults: Protection_PlayReady_INDStartResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Protection_PlayReady_INDStartResult read get_Completed write put_Completed;
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

  {
  // Used Types:  Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface(IInspectable)
  ['{643B6D83-457E-5A43-800F-B0449F91D96B}']
    function get_Current: IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIKeyValuePair_2__HSTRING__IVectorView_1__HSTRING): Cardinal; safecall;
    property Current: IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String,Windows.Foundation.Collections.IVectorView`1<String>>>
  IIterable_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING = interface(IInspectable)
  ['{A4CD6151-2CC1-56F1-9014-DF6BA3410BEB}']
    function First: IIterator_1__IKeyValuePair_2__HSTRING__IVectorView_1__HSTRING; safecall;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<String>
  // Used Types:  String
  // Used Types:  UInt32
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  }
  // Windows.Foundation.Collections.IMapView`2<String,Windows.Foundation.Collections.IVectorView`1<String>>
  IMapView_2__HSTRING__IVectorView_1__HSTRING = interface(IInspectable)
  ['{2843D34F-D3E5-5FCA-9FDC-B568DD5C1E64}']
    function Lookup(key: HSTRING): IVectorView_1__HSTRING; safecall;
    function get_Size: Cardinal; safecall;
    function HasKey(key: HSTRING): Boolean; safecall;
    procedure Split(out first: IMapView_2__HSTRING__IVectorView_1__HSTRING; out second: IMapView_2__HSTRING__IVectorView_1__HSTRING); safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  String
  }
  // Windows.Media.IMediaMarker
  IMediaMarker = interface(IInspectable)
  ['{1803DEF8-DCA5-4B6F-9C20-E3D3C0643625}']
    function get_Time: TimeSpan; safecall;
    function get_MediaMarkerType: HSTRING; safecall;
    function get_Text: HSTRING; safecall;
    property MediaMarkerType: HSTRING read get_MediaMarkerType;
    property Text: HSTRING read get_Text;
    property Time: TimeSpan read get_Time;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.IMediaMarker>
  IIterator_1__IMediaMarker_Base = interface(IInspectable)
  ['{F464661E-88BC-5CEA-93CD-0C123F17D258}']
  end;
  {
  // Used Types:  Windows.Media.IMediaMarker
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.IMediaMarker>
  IIterator_1__IMediaMarker = interface(IIterator_1__IMediaMarker_Base)
  ['{F464661E-88BC-5CEA-93CD-0C123F17D258}']
    function get_Current: IMediaMarker; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMediaMarker): Cardinal; safecall;
    property Current: IMediaMarker read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.IMediaMarker>
  IIterable_1__IMediaMarker_Base = interface(IInspectable)
  ['{A1C0A397-0364-5E4C-9DCA-7CD7011BD114}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.IMediaMarker>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.IMediaMarker>
  IIterable_1__IMediaMarker = interface(IIterable_1__IMediaMarker_Base)
  ['{A1C0A397-0364-5E4C-9DCA-7CD7011BD114}']
    function First: IIterator_1__IMediaMarker; safecall;
  end;

  {
  // Used Types:  Windows.Media.IMediaMarker
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.IMediaMarker>
  IVectorView_1__IMediaMarker = interface(IInspectable)
  ['{B543562C-02B1-5824-80A8-9854130CDADD}']
    function GetAt(index: Cardinal): IMediaMarker; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMediaMarker; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMediaMarker): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.IMediaMarker>
  }
  // Windows.Media.IMediaMarkers
  IMediaMarkers = interface(IInspectable)
  ['{AFEAB189-F8DD-466E-AA10-920B52353FDF}']
    function get_Markers: IVectorView_1__IMediaMarker; safecall;
    property Markers: IVectorView_1__IMediaMarker read get_Markers;
  end;

  {
  // Used Types:  Object
  }
  // Windows.Foundation.EventHandler`1<Object>
  EventHandler_1__IInspectable = interface(IUnknown)
  ['{C50898F6-C536-5F47-8583-8B2C2438A13B}']
    procedure Invoke(sender: IInspectable; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Media.IMediaTimelineControllerFailedEventArgs
  [WinRTClassNameAttribute(SMediaTimelineControllerFailedEventArgs)]
  IMediaTimelineControllerFailedEventArgs = interface(IInspectable)
  ['{8821F81D-3E77-43FB-BE26-4FC87A044834}']
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Windows.Media.IMediaTimelineControllerFailedEventArgs>
  TypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{07CD62FB-578D-56A6-A8EF-E653EB005D1B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IMediaTimelineController
  // Used Types:  Windows.Media.IMediaTimelineControllerFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Windows.Media.IMediaTimelineControllerFailedEventArgs>
  TypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs = interface(TypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs_Delegate_Base)
  ['{278384A3-A718-5321-8AFB-ECCE0887A9BB}']
    procedure Invoke(sender: IMediaTimelineController; args: IMediaTimelineControllerFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Windows.Media.IMediaTimelineControllerFailedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.IMediaTimelineController,Object>
  }
  // Windows.Media.IMediaTimelineController2
  IMediaTimelineController2 = interface(IInspectable)
  ['{EF74EA38-9E72-4DF9-8355-6E90C81BBADD}']
    function get_Duration: IReference_1__TimeSpan; safecall;
    procedure put_Duration(value: IReference_1__TimeSpan); safecall;
    function get_IsLoopingEnabled: Boolean; safecall;
    procedure put_IsLoopingEnabled(value: Boolean); safecall;
    function add_Failed(eventHandler: TypedEventHandler_2__IMediaTimelineController__IMediaTimelineControllerFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_Failed(token: EventRegistrationToken); safecall;
    function add_Ended(eventHandler: TypedEventHandler_2__IMediaTimelineController__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Ended(token: EventRegistrationToken); safecall;
    property Duration: IReference_1__TimeSpan read get_Duration write put_Duration;
    property IsLoopingEnabled: Boolean read get_IsLoopingEnabled write put_IsLoopingEnabled;
  end;

  {
  // Used Types:  Boolean
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
  // Used Types:  Windows.Media.Effects.ICompositeVideoFrameContext
  // Used Types:  Windows.Media.Effects.MediaEffectClosedReason
  }
  // Windows.Media.Effects.IVideoCompositor
  Effects_IVideoCompositor = interface(IInspectable)
  ['{8510B43E-420C-420F-96C7-7C98BBA1FC55}']
    function get_TimeIndependent: Boolean; safecall;
    procedure SetEncodingProperties(backgroundProperties: IVideoEncodingProperties; device: DirectX_Direct3D11_IDirect3DDevice); safecall;
    procedure CompositeFrame(context: Effects_ICompositeVideoFrameContext); safecall;
    procedure Close(reason: Effects_MediaEffectClosedReason); safecall;
    procedure DiscardQueuedFrames; safecall;
    property TimeIndependent: Boolean read get_TimeIndependent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Media.IVideoEffectsStatics
  [WinRTClassNameAttribute(SVideoEffects)]
  IVideoEffectsStatics = interface(IInspectable)
  ['{1FCDA5E8-BAF1-4521-980C-3BCEBB44CF38}']
    function get_VideoStabilization: HSTRING; safecall;
    property VideoStabilization: HSTRING read get_VideoStabilization;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.IVideoFrame
  }
  // Windows.Media.Effects.IProcessVideoFrameContext
  [WinRTClassNameAttribute(SEffects_ProcessVideoFrameContext)]
  Effects_IProcessVideoFrameContext = interface(IInspectable)
  ['{276F0E2B-6461-401E-BA78-0FDAD6114EEC}']
    function get_InputFrame: IVideoFrame; safecall;
    function get_OutputFrame: IVideoFrame; safecall;
    property InputFrame: IVideoFrame read get_InputFrame;
    property OutputFrame: IVideoFrame read get_OutputFrame;
  end;

  {
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Effects.MediaMemoryTypes
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  Windows.Graphics.DirectX.Direct3D11.IDirect3DDevice
  // Used Types:  Windows.Media.Effects.IProcessVideoFrameContext
  // Used Types:  Windows.Media.Effects.MediaEffectClosedReason
  }
  // Windows.Media.Effects.IBasicVideoEffect
  Effects_IBasicVideoEffect = interface(IInspectable)
  ['{8262C7EF-B360-40BE-949B-2FF42FF35693}']
    function get_IsReadOnly: Boolean; safecall;
    function get_SupportedMemoryTypes: Effects_MediaMemoryTypes; safecall;
    function get_TimeIndependent: Boolean; safecall;
    function get_SupportedEncodingProperties: IVectorView_1__IVideoEncodingProperties; safecall;
    procedure SetEncodingProperties(encodingProperties: IVideoEncodingProperties; device: DirectX_Direct3D11_IDirect3DDevice); safecall;
    procedure ProcessFrame(context: Effects_IProcessVideoFrameContext); safecall;
    procedure Close(reason: Effects_MediaEffectClosedReason); safecall;
    procedure DiscardQueuedFrames; safecall;
    property IsReadOnly: Boolean read get_IsReadOnly;
    property SupportedEncodingProperties: IVectorView_1__IVideoEncodingProperties read get_SupportedEncodingProperties;
    property SupportedMemoryTypes: Effects_MediaMemoryTypes read get_SupportedMemoryTypes;
    property TimeIndependent: Boolean read get_TimeIndependent;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Protection.IMediaProtectionPMPServer
  [WinRTClassNameAttribute(SProtection_MediaProtectionPMPServer)]
  Protection_IMediaProtectionPMPServer = interface(IInspectable)
  ['{0C111226-7B26-4D31-95BB-9C1B08EF7FC0}']
    function get_Properties: IPropertySet; safecall;
    property Properties: IPropertySet read get_Properties;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IMediaProtectionPMPServer
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  }
  // Windows.Media.Protection.IMediaProtectionPMPServerFactory
  [WinRTClassNameAttribute(SProtection_MediaProtectionPMPServer)]
  Protection_IMediaProtectionPMPServerFactory = interface(IInspectable)
  ['{602C8E5E-F7D2-487E-AF91-DBC4252B2182}']
    function CreatePMPServer(pProperties: IPropertySet): Protection_IMediaProtectionPMPServer; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.ProtectionCapabilityResult
  // Used Types:  String
  }
  // Windows.Media.Protection.IProtectionCapabilities
  [WinRTClassNameAttribute(SProtection_ProtectionCapabilities)]
  Protection_IProtectionCapabilities = interface(IInspectable)
  ['{C7AC5D7E-7480-4D29-A464-7BCD913DD8E4}']
    function IsTypeSupported(&type: HSTRING; keySystem: HSTRING): Protection_ProtectionCapabilityResult; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.HdcpProtection
  }
  // Windows.Foundation.IReference`1<Windows.Media.Protection.HdcpProtection>
  IReference_1__Protection_HdcpProtection = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Protection_HdcpProtection; safecall;
    property Value: Protection_HdcpProtection read get_Value;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.HdcpSetProtectionResult>
  AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult_Delegate_Base = interface(IUnknown)
  ['{19344A58-A5C1-5168-803E-632771628143}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.HdcpSetProtectionResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.HdcpSetProtectionResult>
  AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult = interface(AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Protection_HdcpSetProtectionResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.HdcpSetProtectionResult>
  IAsyncOperation_1__Protection_HdcpSetProtectionResult_Base = interface(IInspectable)
  ['{5061EE0F-899A-569C-A0A3-C2566EB88142}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Protection.HdcpSetProtectionResult>
  // Used Types:  Windows.Media.Protection.HdcpSetProtectionResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.HdcpSetProtectionResult>
  IAsyncOperation_1__Protection_HdcpSetProtectionResult = interface(IAsyncOperation_1__Protection_HdcpSetProtectionResult_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult; safecall;
    function GetResults: Protection_HdcpSetProtectionResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Protection_HdcpSetProtectionResult read get_Completed write put_Completed;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Protection.IHdcpSession,Object>
  TypedEventHandler_2__Protection_IHdcpSession__IInspectable_Delegate_Base = interface(IUnknown)
  ['{F82AE043-54FB-5366-A607-19B68E6BAB8C}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Protection.IHdcpSession
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Protection.IHdcpSession,Object>
  TypedEventHandler_2__Protection_IHdcpSession__IInspectable = interface(TypedEventHandler_2__Protection_IHdcpSession__IInspectable_Delegate_Base)
  ['{B4E73F2A-B752-50AD-8F86-8E074D63CD42}']
    procedure Invoke(sender: Protection_IHdcpSession; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Protection.HdcpProtection
  // Used Types:  Windows.Foundation.IReference`1<Windows.Media.Protection.HdcpProtection>
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Protection.HdcpSetProtectionResult>
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Protection.IHdcpSession,Object>
  }
  // Windows.Media.Protection.IHdcpSession
  [WinRTClassNameAttribute(SProtection_HdcpSession)]
  Protection_IHdcpSession = interface(IInspectable)
  ['{718845E9-64D7-426D-809B-1BE461941A2A}']
    function IsEffectiveProtectionAtLeast(protection: Protection_HdcpProtection): Boolean; safecall;
    function GetEffectiveProtection: IReference_1__Protection_HdcpProtection; safecall;
    function SetDesiredMinProtectionAsync(protection: Protection_HdcpProtection): IAsyncOperation_1__Protection_HdcpSetProtectionResult; safecall;
    function add_ProtectionChanged(handler: TypedEventHandler_2__Protection_IHdcpSession__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ProtectionChanged(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  String
  }
  // Windows.Media.Core.IMediaStreamDescriptor2
  Core_IMediaStreamDescriptor2 = interface(IInspectable)
  ['{5073010F-E8B2-4071-B00B-EBF337A76B58}']
    procedure put_Label(value: HSTRING); safecall;
    function get_Label: HSTRING; safecall;
    property &Label: HSTRING read get_Label write put_Label;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  }
  // Windows.Media.Core.IAudioStreamDescriptor2
  Core_IAudioStreamDescriptor2 = interface(IInspectable)
  ['{2E68F1F6-A448-497B-8840-85082665ACF9}']
    procedure put_LeadingEncoderPadding(value: IReference_1__Cardinal); safecall;
    function get_LeadingEncoderPadding: IReference_1__Cardinal; safecall;
    procedure put_TrailingEncoderPadding(value: IReference_1__Cardinal); safecall;
    function get_TrailingEncoderPadding: IReference_1__Cardinal; safecall;
    property LeadingEncoderPadding: IReference_1__Cardinal read get_LeadingEncoderPadding write put_LeadingEncoderPadding;
    property TrailingEncoderPadding: IReference_1__Cardinal read get_TrailingEncoderPadding write put_TrailingEncoderPadding;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IAudioStreamDescriptor
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  }
  // Windows.Media.Core.IAudioStreamDescriptorFactory
  [WinRTClassNameAttribute(SCore_AudioStreamDescriptor)]
  Core_IAudioStreamDescriptorFactory = interface(IInspectable)
  ['{4A86CE9E-4CB1-4380-8E0C-83504B7F5BF3}']
    function Create(encodingProperties: IAudioEncodingProperties): Core_IAudioStreamDescriptor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IVideoStreamDescriptor
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  }
  // Windows.Media.Core.IVideoStreamDescriptorFactory
  [WinRTClassNameAttribute(SCore_VideoStreamDescriptor)]
  Core_IVideoStreamDescriptorFactory = interface(IInspectable)
  ['{494EF6D1-BB75-43D2-9E5E-7B79A3AFCED4}']
    function Create(encodingProperties: IVideoEncodingProperties): Core_IVideoStreamDescriptor; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs
  [WinRTClassNameAttribute(SCore_MediaStreamSourceSampleRenderedEventArgs)]
  Core_IMediaStreamSourceSampleRenderedEventArgs = interface(IInspectable)
  ['{9D697B05-D4F2-4C7A-9DFE-8D6CD0B3EE84}']
    function get_SampleLag: TimeSpan; safecall;
    property SampleLag: TimeSpan read get_SampleLag;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs_Delegate_Base = interface(IUnknown)
  ['{9D812C70-9F0D-5AD5-8274-F760C9CA0C38}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs>
  TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs = interface(TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs_Delegate_Base)
  ['{C728D6F9-9B1D-585B-98D2-DB9B0D87C2FE}']
    procedure Invoke(sender: Core_IMediaStreamSource; args: Core_IMediaStreamSourceSampleRenderedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaStreamSource,Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs>
  }
  // Windows.Media.Core.IMediaStreamSource2
  Core_IMediaStreamSource2 = interface(IInspectable)
  ['{EC55D0AD-2E6A-4F74-ADBB-B562D1533849}']
    function add_SampleRendered(handler: TypedEventHandler_2__Core_IMediaStreamSource__Core_IMediaStreamSourceSampleRenderedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SampleRendered(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Media.Core.IMediaStreamSource3
  Core_IMediaStreamSource3 = interface(IInspectable)
  ['{6A2A2746-3DDD-4DDF-A121-94045ECF9440}']
    procedure put_MaxSupportedPlaybackRate(value: IReference_1__Double); safecall;
    function get_MaxSupportedPlaybackRate: IReference_1__Double; safecall;
    property MaxSupportedPlaybackRate: IReference_1__Double read get_MaxSupportedPlaybackRate write put_MaxSupportedPlaybackRate;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.Core.IMediaStreamSource4
  Core_IMediaStreamSource4 = interface(IInspectable)
  ['{1D0CFCAB-830D-417C-A3A9-2454FD6415C7}']
    procedure put_IsLive(value: Boolean); safecall;
    function get_IsLive: Boolean; safecall;
    property IsLive: Boolean read get_IsLive write put_IsLive;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMediaStreamDescriptor
  }
  // Windows.Media.Core.IMediaStreamSourceFactory
  [WinRTClassNameAttribute(SCore_MediaStreamSource)]
  Core_IMediaStreamSourceFactory = interface(IInspectable)
  ['{EF77E0D9-D158-4B7A-863F-203342FBFD41}']
    function CreateFromDescriptor(descriptor: Core_IMediaStreamDescriptor): Core_IMediaStreamSource; safecall;
    function CreateFromDescriptors(descriptor: Core_IMediaStreamDescriptor; descriptor2: Core_IMediaStreamDescriptor): Core_IMediaStreamSource; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Core.IMediaStreamSample>
  AsyncOperationCompletedHandler_1__Core_IMediaStreamSample_Delegate_Base = interface(IUnknown)
  ['{DF7AACC9-A86C-5C7D-BF98-CC371C97C67B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Core.IMediaStreamSample>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Core.IMediaStreamSample>
  AsyncOperationCompletedHandler_1__Core_IMediaStreamSample = interface(AsyncOperationCompletedHandler_1__Core_IMediaStreamSample_Delegate_Base)
  ['{279400EC-FBCD-56C9-9324-84C74B18E130}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Core_IMediaStreamSample; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Core.IMediaStreamSample>
  IAsyncOperation_1__Core_IMediaStreamSample_Base = interface(IInspectable)
  ['{3CDC5E86-4ADA-5EF7-967A-E137A4621907}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Core.IMediaStreamSample>
  // Used Types:  Windows.Media.Core.IMediaStreamSample
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Core.IMediaStreamSample>
  IAsyncOperation_1__Core_IMediaStreamSample = interface(IAsyncOperation_1__Core_IMediaStreamSample_Base)
  ['{FD0094F8-A96B-5DDC-95DB-6B77745A4C42}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Core_IMediaStreamSample); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Core_IMediaStreamSample; safecall;
    function GetResults: Core_IMediaStreamSample; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Core_IMediaStreamSample read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaStreamSample
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Core.IMediaStreamSample>
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  UInt32
  }
  // Windows.Media.Core.IMediaStreamSampleStatics
  [WinRTClassNameAttribute(SCore_MediaStreamSample)]
  Core_IMediaStreamSampleStatics = interface(IInspectable)
  ['{DFDF218F-A6CF-4579-BE41-73DD941AD972}']
    function CreateFromBuffer(buffer: IBuffer; timestamp: TimeSpan): Core_IMediaStreamSample; safecall;
    function CreateFromStreamAsync(stream: IInputStream; count: Cardinal; timestamp: TimeSpan): IAsyncOperation_1__Core_IMediaStreamSample; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  }
  // Windows.Media.Core.IMseStreamSourceStatics
  [WinRTClassNameAttribute(SCore_MseStreamSource)]
  Core_IMseStreamSourceStatics = interface(IInspectable)
  ['{465C679D-D570-43CE-BA21-0BFF5F3FBD0A}']
    function IsContentTypeSupported(contentType: HSTRING): Boolean; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseStreamSource,Object>
  TypedEventHandler_2__Core_IMseStreamSource__IInspectable_Delegate_Base = interface(IUnknown)
  ['{724BF4EF-DE7A-5DBD-815E-522A87BC3344}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMseStreamSource
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseStreamSource,Object>
  TypedEventHandler_2__Core_IMseStreamSource__IInspectable = interface(TypedEventHandler_2__Core_IMseStreamSource__IInspectable_Delegate_Base)
  ['{08C10C63-03A9-5D6A-8A44-7B55D00C64A8}']
    procedure Invoke(sender: Core_IMseStreamSource; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBufferList,Object>
  TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable_Delegate_Base = interface(IUnknown)
  ['{0FF01695-FBB2-5E95-8EC7-DA17D8E99F16}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMseSourceBufferList
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBufferList,Object>
  TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable = interface(TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable_Delegate_Base)
  ['{BBAF9BAC-3BE9-557B-BDE5-6FE15E68D71F}']
    procedure Invoke(sender: Core_IMseSourceBufferList; args: IInspectable); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBuffer,Object>
  TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable_Delegate_Base = interface(IUnknown)
  ['{187FD3D7-BB9D-541A-94FD-43C31DD84A67}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMseSourceBuffer
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBuffer,Object>
  TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable = interface(TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable_Delegate_Base)
  ['{A8082AAB-CD71-5438-A66B-A40E02D70532}']
    procedure Invoke(sender: Core_IMseSourceBuffer; args: IInspectable); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.MseTimeRange>
  IIterator_1__Core_MseTimeRange_Base = interface(IInspectable)
  ['{92A36852-FBB3-5B48-B4EC-01DDA0972A5C}']
  end;
  {
  // Used Types:  Windows.Media.Core.MseTimeRange
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.MseTimeRange>
  IIterator_1__Core_MseTimeRange = interface(IIterator_1__Core_MseTimeRange_Base)
  ['{752850B9-5ED2-5655-8DE2-262EFC26CF39}']
    function get_Current: Core_MseTimeRange; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_MseTimeRange): Cardinal; safecall;
    property Current: Core_MseTimeRange read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.MseTimeRange>
  IIterable_1__Core_MseTimeRange_Base = interface(IInspectable)
  ['{ED0C6E08-E22F-5AC2-BA14-E0FF1DF3467F}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.MseTimeRange>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.MseTimeRange>
  IIterable_1__Core_MseTimeRange = interface(IIterable_1__Core_MseTimeRange_Base)
  ['{1B6614A1-8FC5-567D-9157-410A9E0ECBC5}']
    function First: IIterator_1__Core_MseTimeRange; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.MseTimeRange
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.MseTimeRange>
  IVectorView_1__Core_MseTimeRange = interface(IInspectable)
  ['{86D0B56E-CB4E-58F0-B9A2-1528619DCD26}']
    function GetAt(index: Cardinal): Core_MseTimeRange; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_MseTimeRange; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_MseTimeRange): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBuffer,Object>
  // Used Types:  Windows.Media.Core.MseAppendMode
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.MseTimeRange>
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  UInt64
  }
  // Windows.Media.Core.IMseSourceBuffer
  [WinRTClassNameAttribute(SCore_MseSourceBuffer)]
  Core_IMseSourceBuffer = interface(IInspectable)
  ['{0C1AA3E3-DF8D-4079-A3FE-6849184B4E2F}']
    function add_UpdateStarting(handler: TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_UpdateStarting(token: EventRegistrationToken); safecall;
    function add_Updated(handler: TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Updated(token: EventRegistrationToken); safecall;
    function add_UpdateEnded(handler: TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_UpdateEnded(token: EventRegistrationToken); safecall;
    function add_ErrorOccurred(handler: TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ErrorOccurred(token: EventRegistrationToken); safecall;
    function add_Aborted(handler: TypedEventHandler_2__Core_IMseSourceBuffer__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Aborted(token: EventRegistrationToken); safecall;
    function get_Mode: Core_MseAppendMode; safecall;
    procedure put_Mode(value: Core_MseAppendMode); safecall;
    function get_IsUpdating: Boolean; safecall;
    function get_Buffered: IVectorView_1__Core_MseTimeRange; safecall;
    function get_TimestampOffset: TimeSpan; safecall;
    procedure put_TimestampOffset(value: TimeSpan); safecall;
    function get_AppendWindowStart: TimeSpan; safecall;
    procedure put_AppendWindowStart(value: TimeSpan); safecall;
    function get_AppendWindowEnd: IReference_1__TimeSpan; safecall;
    procedure put_AppendWindowEnd(value: IReference_1__TimeSpan); safecall;
    procedure AppendBuffer(buffer: IBuffer); safecall;
    procedure AppendStream(stream: IInputStream); overload; safecall;
    procedure AppendStream(stream: IInputStream; maxSize: UInt64); overload; safecall;
    procedure Abort; safecall;
    procedure Remove(start: TimeSpan; &end: IReference_1__TimeSpan); safecall;
    property AppendWindowEnd: IReference_1__TimeSpan read get_AppendWindowEnd write put_AppendWindowEnd;
    property AppendWindowStart: TimeSpan read get_AppendWindowStart write put_AppendWindowStart;
    property Buffered: IVectorView_1__Core_MseTimeRange read get_Buffered;
    property IsUpdating: Boolean read get_IsUpdating;
    property Mode: Core_MseAppendMode read get_Mode write put_Mode;
    property TimestampOffset: TimeSpan read get_TimestampOffset write put_TimestampOffset;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMseSourceBuffer>
  IIterator_1__Core_IMseSourceBuffer_Base = interface(IInspectable)
  ['{53076581-01A9-51B9-98CC-5265504CD352}']
  end;
  {
  // Used Types:  Windows.Media.Core.IMseSourceBuffer
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMseSourceBuffer>
  IIterator_1__Core_IMseSourceBuffer = interface(IIterator_1__Core_IMseSourceBuffer_Base)
  ['{272FE72F-5993-555B-90A4-641A57B42C98}']
    function get_Current: Core_IMseSourceBuffer; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PCore_IMseSourceBuffer): Cardinal; safecall;
    property Current: Core_IMseSourceBuffer read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMseSourceBuffer>
  IIterable_1__Core_IMseSourceBuffer_Base = interface(IInspectable)
  ['{5CA0DA86-6307-558A-865F-3A1EF9FE56B3}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.Core.IMseSourceBuffer>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMseSourceBuffer>
  IIterable_1__Core_IMseSourceBuffer = interface(IIterable_1__Core_IMseSourceBuffer_Base)
  ['{9CB0CD5C-931E-5ACC-9853-3D3280DF1B13}']
    function First: IIterator_1__Core_IMseSourceBuffer; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMseSourceBuffer
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMseSourceBuffer>
  IVectorView_1__Core_IMseSourceBuffer = interface(IInspectable)
  ['{F707442C-E628-5E3A-9674-9C002D487136}']
    function GetAt(index: Cardinal): Core_IMseSourceBuffer; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: Core_IMseSourceBuffer; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PCore_IMseSourceBuffer): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseSourceBufferList,Object>
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMseSourceBuffer>
  }
  // Windows.Media.Core.IMseSourceBufferList
  [WinRTClassNameAttribute(SCore_MseSourceBufferList)]
  Core_IMseSourceBufferList = interface(IInspectable)
  ['{95FAE8E7-A8E7-4EBF-8927-145E940BA511}']
    function add_SourceBufferAdded(handler: TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SourceBufferAdded(token: EventRegistrationToken); safecall;
    function add_SourceBufferRemoved(handler: TypedEventHandler_2__Core_IMseSourceBufferList__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SourceBufferRemoved(token: EventRegistrationToken); safecall;
    function get_Buffers: IVectorView_1__Core_IMseSourceBuffer; safecall;
    property Buffers: IVectorView_1__Core_IMseSourceBuffer read get_Buffers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMseStreamSource,Object>
  // Used Types:  Windows.Media.Core.IMseSourceBufferList
  // Used Types:  Windows.Media.Core.MseReadyState
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Media.Core.IMseSourceBuffer
  // Used Types:  String
  // Used Types:  Windows.Media.Core.MseEndOfStreamStatus
  }
  // Windows.Media.Core.IMseStreamSource
  [WinRTClassNameAttribute(SCore_MseStreamSource)]
  Core_IMseStreamSource = interface(IInspectable)
  ['{B0B4198D-02F4-4923-88DD-81BC3F360FFA}']
    function add_Opened(handler: TypedEventHandler_2__Core_IMseStreamSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Opened(token: EventRegistrationToken); safecall;
    function add_Ended(handler: TypedEventHandler_2__Core_IMseStreamSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Ended(token: EventRegistrationToken); safecall;
    function add_Closed(handler: TypedEventHandler_2__Core_IMseStreamSource__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Closed(token: EventRegistrationToken); safecall;
    function get_SourceBuffers: Core_IMseSourceBufferList; safecall;
    function get_ActiveSourceBuffers: Core_IMseSourceBufferList; safecall;
    function get_ReadyState: Core_MseReadyState; safecall;
    function get_Duration: IReference_1__TimeSpan; safecall;
    procedure put_Duration(value: IReference_1__TimeSpan); safecall;
    function AddSourceBuffer(mimeType: HSTRING): Core_IMseSourceBuffer; safecall;
    procedure RemoveSourceBuffer(buffer: Core_IMseSourceBuffer); safecall;
    procedure EndOfStream(status: Core_MseEndOfStreamStatus); safecall;
    property ActiveSourceBuffers: Core_IMseSourceBufferList read get_ActiveSourceBuffers;
    property Duration: IReference_1__TimeSpan read get_Duration write put_Duration;
    property ReadyState: Core_MseReadyState read get_ReadyState;
    property SourceBuffers: Core_IMseSourceBufferList read get_SourceBuffers;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.MseTimeRange
  }
  // Windows.Foundation.IReference`1<Windows.Media.Core.MseTimeRange>
  IReference_1__Core_MseTimeRange = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Core_MseTimeRange; safecall;
    property Value: Core_MseTimeRange read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Media.Core.MseTimeRange>
  }
  // Windows.Media.Core.IMseStreamSource2
  Core_IMseStreamSource2 = interface(IInspectable)
  ['{66F57D37-F9E7-418A-9CDE-A020E956552B}']
    function get_LiveSeekableRange: IReference_1__Core_MseTimeRange; safecall;
    procedure put_LiveSeekableRange(value: IReference_1__Core_MseTimeRange); safecall;
    property LiveSeekableRange: IReference_1__Core_MseTimeRange read get_LiveSeekableRange write put_LiveSeekableRange;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncActionProgressHandler`1<Double>
  AsyncActionProgressHandler_1__Double_Delegate_Base = interface(IUnknown)
  ['{44825C7C-0DA9-5691-B2B4-914F231EECED}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Double>
  // Used Types:  Double
  }
  // Windows.Foundation.AsyncActionProgressHandler`1<Double>
  AsyncActionProgressHandler_1__Double = interface(AsyncActionProgressHandler_1__Double_Delegate_Base)
  ['{44825C7C-0DA9-5691-B2B4-914F231EECED}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__Double; progressInfo: Double); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  AsyncActionWithProgressCompletedHandler_1__Double_Delegate_Base = interface(IUnknown)
  ['{94D64AC6-4491-53EF-8BE8-36481F3FF1E8}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Double>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  AsyncActionWithProgressCompletedHandler_1__Double = interface(AsyncActionWithProgressCompletedHandler_1__Double_Delegate_Base)
  ['{94D64AC6-4491-53EF-8BE8-36481F3FF1E8}']
    procedure Invoke(asyncInfo: IAsyncActionWithProgress_1__Double; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncActionProgressHandler`1<Double>
  // Used Types:  Windows.Foundation.AsyncActionWithProgressCompletedHandler`1<Double>
  }
  // Windows.Foundation.IAsyncActionWithProgress`1<Double>
  IAsyncActionWithProgress_1__Double = interface(IInspectable)
  ['{4F1430A6-A825-56CA-B047-1A9BAD52BA67}']
    procedure put_Progress(handler: AsyncActionProgressHandler_1__Double); safecall;
    function get_Progress: AsyncActionProgressHandler_1__Double; safecall;
    procedure put_Completed(handler: AsyncActionWithProgressCompletedHandler_1__Double); safecall;
    function get_Completed: AsyncActionWithProgressCompletedHandler_1__Double; safecall;
    procedure GetResults; safecall;
    property Progress: AsyncActionProgressHandler_1__Double read get_Progress write put_Progress;
    property Completed: AsyncActionWithProgressCompletedHandler_1__Double read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Transcoding.TranscodeFailureReason
  // Used Types:  Windows.Foundation.IAsyncActionWithProgress`1<Double>
  }
  // Windows.Media.Transcoding.IPrepareTranscodeResult
  [WinRTClassNameAttribute(STranscoding_PrepareTranscodeResult)]
  Transcoding_IPrepareTranscodeResult = interface(IInspectable)
  ['{05F25DCE-994F-4A34-9D68-97CCCE1730D6}']
    function get_CanTranscode: Boolean; safecall;
    function get_FailureReason: Transcoding_TranscodeFailureReason; safecall;
    function TranscodeAsync: IAsyncActionWithProgress_1__Double; safecall;
    property CanTranscode: Boolean read get_CanTranscode;
    property FailureReason: Transcoding_TranscodeFailureReason read get_FailureReason;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult_Delegate_Base = interface(IUnknown)
  ['{A44D7D07-8F74-52EE-9F02-C2B244B4FF2A}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult = interface(AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult_Delegate_Base)
  ['{AE14E17F-05D5-55CB-8F28-85A7C84ED130}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Transcoding_IPrepareTranscodeResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  IAsyncOperation_1__Transcoding_IPrepareTranscodeResult_Base = interface(IInspectable)
  ['{F5F07C13-3047-5BAB-8EB7-6E5D7D14AFAE}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  // Used Types:  Windows.Media.Transcoding.IPrepareTranscodeResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  IAsyncOperation_1__Transcoding_IPrepareTranscodeResult = interface(IAsyncOperation_1__Transcoding_IPrepareTranscodeResult_Base)
  ['{597B00B0-750D-5EAA-AAB4-6D73FF756500}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult; safecall;
    function GetResults: Transcoding_IPrepareTranscodeResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Transcoding_IPrepareTranscodeResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  // Used Types:  Windows.Media.Core.IMediaSource
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.Transcoding.MediaVideoProcessingAlgorithm
  }
  // Windows.Media.Transcoding.IMediaTranscoder2
  Transcoding_IMediaTranscoder2 = interface(IInspectable)
  ['{40531D74-35E0-4F04-8574-CA8BC4E5A082}']
    function PrepareMediaStreamSourceTranscodeAsync(source: Core_IMediaSource; destination: IRandomAccessStream; profile: IMediaEncodingProfile): IAsyncOperation_1__Transcoding_IPrepareTranscodeResult; safecall;
    procedure put_VideoProcessingAlgorithm(value: Transcoding_MediaVideoProcessingAlgorithm); safecall;
    function get_VideoProcessingAlgorithm: Transcoding_MediaVideoProcessingAlgorithm; safecall;
    property VideoProcessingAlgorithm: Transcoding_MediaVideoProcessingAlgorithm read get_VideoProcessingAlgorithm write put_VideoProcessingAlgorithm;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.Collections.IPropertySet
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Transcoding.IPrepareTranscodeResult>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  }
  // Windows.Media.Transcoding.IMediaTranscoder
  [WinRTClassNameAttribute(STranscoding_MediaTranscoder)]
  Transcoding_IMediaTranscoder = interface(IInspectable)
  ['{190C99D2-A0AA-4D34-86BC-EED1B12C2F5B}']
    procedure put_TrimStartTime(value: TimeSpan); safecall;
    function get_TrimStartTime: TimeSpan; safecall;
    procedure put_TrimStopTime(value: TimeSpan); safecall;
    function get_TrimStopTime: TimeSpan; safecall;
    procedure put_AlwaysReencode(value: Boolean); safecall;
    function get_AlwaysReencode: Boolean; safecall;
    procedure put_HardwareAccelerationEnabled(value: Boolean); safecall;
    function get_HardwareAccelerationEnabled: Boolean; safecall;
    procedure AddAudioEffect(activatableClassId: HSTRING); overload; safecall;
    procedure AddAudioEffect(activatableClassId: HSTRING; effectRequired: Boolean; configuration: IPropertySet); overload; safecall;
    procedure AddVideoEffect(activatableClassId: HSTRING); overload; safecall;
    procedure AddVideoEffect(activatableClassId: HSTRING; effectRequired: Boolean; configuration: IPropertySet); overload; safecall;
    procedure ClearEffects; safecall;
    function PrepareFileTranscodeAsync(source: IStorageFile; destination: IStorageFile; profile: IMediaEncodingProfile): IAsyncOperation_1__Transcoding_IPrepareTranscodeResult; safecall;
    function PrepareStreamTranscodeAsync(source: IRandomAccessStream; destination: IRandomAccessStream; profile: IMediaEncodingProfile): IAsyncOperation_1__Transcoding_IPrepareTranscodeResult; safecall;
    property AlwaysReencode: Boolean read get_AlwaysReencode write put_AlwaysReencode;
    property HardwareAccelerationEnabled: Boolean read get_HardwareAccelerationEnabled write put_HardwareAccelerationEnabled;
    property TrimStartTime: TimeSpan read get_TrimStartTime write put_TrimStartTime;
    property TrimStopTime: TimeSpan read get_TrimStopTime write put_TrimStopTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.Core.IHighDynamicRangeControl
  [WinRTClassNameAttribute(SCore_HighDynamicRangeControl)]
  Core_IHighDynamicRangeControl = interface(IInspectable)
  ['{55F1A7AE-D957-4DC9-9D1C-8553A82A7D99}']
    procedure put_Enabled(value: Boolean); safecall;
    function get_Enabled: Boolean; safecall;
    property Enabled: Boolean read get_Enabled write put_Enabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Double
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Devices.Core.IFrameController>
  }
  // Windows.Media.Core.IHighDynamicRangeOutput
  [WinRTClassNameAttribute(SCore_HighDynamicRangeOutput)]
  Core_IHighDynamicRangeOutput = interface(IInspectable)
  ['{0F57806B-253B-4119-BB40-3A90E51384F7}']
    function get_Certainty: Double; safecall;
    function get_FrameControllers: IVectorView_1__Core_IFrameController; safecall;
    property Certainty: Double read get_Certainty;
    property FrameControllers: IVectorView_1__Core_IFrameController read get_FrameControllers;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Capture.ICapturedFrameControlValues
  // Used Types:  Windows.Media.Core.IHighDynamicRangeOutput
  }
  // Windows.Media.Core.ISceneAnalysisEffectFrame
  [WinRTClassNameAttribute(SCore_SceneAnalysisEffectFrame)]
  Core_ISceneAnalysisEffectFrame = interface(IInspectable)
  ['{D8B10E4C-7FD9-42E1-85EB-6572C297C987}']
    function get_FrameControlValues: Capture_ICapturedFrameControlValues; safecall;
    function get_HighDynamicRange: Core_IHighDynamicRangeOutput; safecall;
    property FrameControlValues: Capture_ICapturedFrameControlValues read get_FrameControlValues;
    property HighDynamicRange: Core_IHighDynamicRangeOutput read get_HighDynamicRange;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ISceneAnalysisEffectFrame
  }
  // Windows.Media.Core.ISceneAnalyzedEventArgs
  [WinRTClassNameAttribute(SCore_SceneAnalyzedEventArgs)]
  Core_ISceneAnalyzedEventArgs = interface(IInspectable)
  ['{146B9588-2851-45E4-AD55-44CF8DF8DB4D}']
    function get_ResultFrame: Core_ISceneAnalysisEffectFrame; safecall;
    property ResultFrame: Core_ISceneAnalysisEffectFrame read get_ResultFrame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISceneAnalysisEffect,Windows.Media.Core.ISceneAnalyzedEventArgs>
  TypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs_Delegate_Base = interface(IUnknown)
  ['{48630F8C-DBDE-569E-A0C8-7588D1D2BD03}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ISceneAnalysisEffect
  // Used Types:  Windows.Media.Core.ISceneAnalyzedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISceneAnalysisEffect,Windows.Media.Core.ISceneAnalyzedEventArgs>
  TypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs = interface(TypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs_Delegate_Base)
  ['{660BEC11-8A1D-58B3-A332-1F486278AA4D}']
    procedure Invoke(sender: Core_ISceneAnalysisEffect; args: Core_ISceneAnalyzedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IHighDynamicRangeControl
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISceneAnalysisEffect,Windows.Media.Core.ISceneAnalyzedEventArgs>
  }
  // Windows.Media.Core.ISceneAnalysisEffect
  [WinRTClassNameAttribute(SCore_SceneAnalysisEffect)]
  Core_ISceneAnalysisEffect = interface(IInspectable)
  ['{C04BA319-CA41-4813-BFFD-7B08B0ED2557}']
    function get_HighDynamicRangeAnalyzer: Core_IHighDynamicRangeControl; safecall;
    procedure put_DesiredAnalysisInterval(value: TimeSpan); safecall;
    function get_DesiredAnalysisInterval: TimeSpan; safecall;
    function add_SceneAnalyzed(handler: TypedEventHandler_2__Core_ISceneAnalysisEffect__Core_ISceneAnalyzedEventArgs): EventRegistrationToken; safecall;
    procedure remove_SceneAnalyzed(cookie: EventRegistrationToken); safecall;
    property DesiredAnalysisInterval: TimeSpan read get_DesiredAnalysisInterval write put_DesiredAnalysisInterval;
    property HighDynamicRangeAnalyzer: Core_IHighDynamicRangeControl read get_HighDynamicRangeAnalyzer;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.SceneAnalysisRecommendation
  }
  // Windows.Media.Core.ISceneAnalysisEffectFrame2
  Core_ISceneAnalysisEffectFrame2 = interface(IInspectable)
  ['{2D4E29BE-061F-47AE-9915-02524B5F9A5F}']
    function get_AnalysisRecommendation: Core_SceneAnalysisRecommendation; safecall;
    property AnalysisRecommendation: Core_SceneAnalysisRecommendation read get_AnalysisRecommendation;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.FaceAnalysis.IDetectedFace>
  }
  // Windows.Media.Core.IFaceDetectionEffectFrame
  [WinRTClassNameAttribute(SCore_FaceDetectionEffectFrame)]
  Core_IFaceDetectionEffectFrame = interface(IInspectable)
  ['{8AB08993-5DC8-447B-A247-5270BD802ECE}']
    function get_DetectedFaces: IVectorView_1__FaceAnalysis_IDetectedFace; safecall;
    property DetectedFaces: IVectorView_1__FaceAnalysis_IDetectedFace read get_DetectedFaces;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IFaceDetectionEffectFrame
  }
  // Windows.Media.Core.IFaceDetectedEventArgs
  [WinRTClassNameAttribute(SCore_FaceDetectedEventArgs)]
  Core_IFaceDetectedEventArgs = interface(IInspectable)
  ['{19918426-C65B-46BA-85F8-13880576C90A}']
    function get_ResultFrame: Core_IFaceDetectionEffectFrame; safecall;
    property ResultFrame: Core_IFaceDetectionEffectFrame read get_ResultFrame;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IFaceDetectionEffect,Windows.Media.Core.IFaceDetectedEventArgs>
  TypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs_Delegate_Base = interface(IUnknown)
  ['{01F0D7A6-F9BD-5BC1-AAA9-DFF396F72F87}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IFaceDetectionEffect
  // Used Types:  Windows.Media.Core.IFaceDetectedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IFaceDetectionEffect,Windows.Media.Core.IFaceDetectedEventArgs>
  TypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs = interface(TypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs_Delegate_Base)
  ['{A50D93A2-5928-5A8A-9D31-00C3AEA49923}']
    procedure Invoke(sender: Core_IFaceDetectionEffect; args: Core_IFaceDetectedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IFaceDetectionEffect,Windows.Media.Core.IFaceDetectedEventArgs>
  }
  // Windows.Media.Core.IFaceDetectionEffect
  [WinRTClassNameAttribute(SCore_FaceDetectionEffect)]
  Core_IFaceDetectionEffect = interface(IInspectable)
  ['{AE15EBD2-0542-42A9-BC90-F283A29F46C1}']
    procedure put_Enabled(value: Boolean); safecall;
    function get_Enabled: Boolean; safecall;
    procedure put_DesiredDetectionInterval(value: TimeSpan); safecall;
    function get_DesiredDetectionInterval: TimeSpan; safecall;
    function add_FaceDetected(handler: TypedEventHandler_2__Core_IFaceDetectionEffect__Core_IFaceDetectedEventArgs): EventRegistrationToken; safecall;
    procedure remove_FaceDetected(cookie: EventRegistrationToken); safecall;
    property DesiredDetectionInterval: TimeSpan read get_DesiredDetectionInterval write put_DesiredDetectionInterval;
    property Enabled: Boolean read get_Enabled write put_Enabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.FaceDetectionMode
  // Used Types:  Boolean
  }
  // Windows.Media.Core.IFaceDetectionEffectDefinition
  [WinRTClassNameAttribute(SCore_FaceDetectionEffectDefinition)]
  Core_IFaceDetectionEffectDefinition = interface(IInspectable)
  ['{43DCA081-B848-4F33-B702-1FD2624FB016}']
    procedure put_DetectionMode(value: Core_FaceDetectionMode); safecall;
    function get_DetectionMode: Core_FaceDetectionMode; safecall;
    procedure put_SynchronousDetectionEnabled(value: Boolean); safecall;
    function get_SynchronousDetectionEnabled: Boolean; safecall;
    property DetectionMode: Core_FaceDetectionMode read get_DetectionMode write put_DetectionMode;
    property SynchronousDetectionEnabled: Boolean read get_SynchronousDetectionEnabled write put_SynchronousDetectionEnabled;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.VideoStabilizationEffectEnabledChangedReason
  }
  // Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs
  [WinRTClassNameAttribute(SCore_VideoStabilizationEffectEnabledChangedEventArgs)]
  Core_IVideoStabilizationEffectEnabledChangedEventArgs = interface(IInspectable)
  ['{187EFF28-67BB-4713-B900-4168DA164529}']
    function get_Reason: Core_VideoStabilizationEffectEnabledChangedReason; safecall;
    property Reason: Core_VideoStabilizationEffectEnabledChangedReason read get_Reason;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IVideoStabilizationEffect,Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs>
  TypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{897592E2-BFCC-5F16-8834-2C9C4F20559B}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IVideoStabilizationEffect
  // Used Types:  Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IVideoStabilizationEffect,Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs>
  TypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs = interface(TypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs_Delegate_Base)
  ['{61816F56-C54F-5740-B7E0-6ABB9CA78FC2}']
    procedure Invoke(sender: Core_IVideoStabilizationEffect; args: Core_IVideoStabilizationEffectEnabledChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IVideoStabilizationEffect,Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs>
  // Used Types:  Windows.Media.Capture.IVideoStreamConfiguration
  // Used Types:  Windows.Media.Devices.IVideoDeviceController
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  }
  // Windows.Media.Core.IVideoStabilizationEffect
  [WinRTClassNameAttribute(SCore_VideoStabilizationEffect)]
  Core_IVideoStabilizationEffect = interface(IInspectable)
  ['{0808A650-9698-4E57-877B-BD7CB2EE0F8A}']
    procedure put_Enabled(value: Boolean); safecall;
    function get_Enabled: Boolean; safecall;
    function add_EnabledChanged(handler: TypedEventHandler_2__Core_IVideoStabilizationEffect__Core_IVideoStabilizationEffectEnabledChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_EnabledChanged(cookie: EventRegistrationToken); safecall;
    function GetRecommendedStreamConfiguration(controller: IVideoDeviceController; desiredProperties: IVideoEncodingProperties): Capture_IVideoStreamConfiguration; safecall;
    property Enabled: Boolean read get_Enabled write put_Enabled;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadBitrateChangedEventArgs)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = interface(IInspectable)
  ['{670C0A44-E04E-4EFF-816A-17399F78F4BA}']
    function get_OldValue: Cardinal; safecall;
    function get_NewValue: Cardinal; safecall;
    property NewValue: Cardinal read get_NewValue;
    property OldValue: Cardinal read get_OldValue;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{AD268CAF-7DA0-5AD4-8585-CEEB903DBD50}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs = interface(TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs_Delegate_Base)
  ['{154A26A0-057A-507B-8AA9-84670A13A8F6}']
    procedure Invoke(sender: Streaming_Adaptive_IAdaptiveMediaSource; args: Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourcePlaybackBitrateChangedEventArgs)]
  Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = interface(IInspectable)
  ['{23A29F6D-7DDA-4A51-87A9-6FA8C5B292BE}']
    function get_OldValue: Cardinal; safecall;
    function get_NewValue: Cardinal; safecall;
    function get_AudioOnly: Boolean; safecall;
    property AudioOnly: Boolean read get_AudioOnly;
    property NewValue: Cardinal read get_NewValue;
    property OldValue: Cardinal read get_OldValue;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Delegate_Base = interface(IUnknown)
  ['{DF4F4E89-6173-539B-94D8-69B7CB7578A7}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs = interface(TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs_Delegate_Base)
  ['{B0D57C1B-85EF-555E-B69C-83C2ED6C5A86}']
    procedure Invoke(sender: Streaming_Adaptive_IAdaptiveMediaSource; args: Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs); safecall;
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

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.Streams.IInputStream
  // Used Types:  Windows.Storage.Streams.IBuffer
  // Used Types:  String
  // Used Types:  UInt32
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadResult)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult = interface(IInspectable)
  ['{F4AFDC73-BCEE-4A6A-9F0A-FEC41E2339B0}']
    function get_ResourceUri: IUriRuntimeClass; safecall;
    procedure put_ResourceUri(value: IUriRuntimeClass); safecall;
    function get_InputStream: IInputStream; safecall;
    procedure put_InputStream(value: IInputStream); safecall;
    function get_Buffer: IBuffer; safecall;
    procedure put_Buffer(value: IBuffer); safecall;
    function get_ContentType: HSTRING; safecall;
    procedure put_ContentType(value: HSTRING); safecall;
    function get_ExtendedStatus: Cardinal; safecall;
    procedure put_ExtendedStatus(value: Cardinal); safecall;
    property Buffer: IBuffer read get_Buffer write put_Buffer;
    property ContentType: HSTRING read get_ContentType write put_ContentType;
    property ExtendedStatus: Cardinal read get_ExtendedStatus write put_ExtendedStatus;
    property InputStream: IInputStream read get_InputStream write put_InputStream;
    property ResourceUri: IUriRuntimeClass read get_ResourceUri write put_ResourceUri;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedDeferral
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadRequestedDeferral)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedDeferral = interface(IInspectable)
  ['{05C68F64-FA20-4DBD-9821-4BF4C9BF77AB}']
    procedure Complete; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedDeferral
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadRequestedEventArgs)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs = interface(IInspectable)
  ['{C83FDFFD-44A9-47A2-BF96-03398B4BFAAF}']
    function get_ResourceType: Streaming_Adaptive_AdaptiveMediaSourceResourceType; safecall;
    function get_ResourceUri: IUriRuntimeClass; safecall;
    function get_ResourceByteRangeOffset: IReference_1__UInt64; safecall;
    function get_ResourceByteRangeLength: IReference_1__UInt64; safecall;
    function get_Result: Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult; safecall;
    function GetDeferral: Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedDeferral; safecall;
    property ResourceByteRangeLength: IReference_1__UInt64 read get_ResourceByteRangeLength;
    property ResourceByteRangeOffset: IReference_1__UInt64 read get_ResourceByteRangeOffset;
    property ResourceType: Streaming_Adaptive_AdaptiveMediaSourceResourceType read get_ResourceType;
    property ResourceUri: IUriRuntimeClass read get_ResourceUri;
    property Result: Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult read get_Result;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs_Delegate_Base = interface(IUnknown)
  ['{D3B7DBF1-FD8E-589E-9C7F-BA67397E50CD}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs = interface(TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs_Delegate_Base)
  ['{E724A0D6-68B7-52DE-9936-68BC10850256}']
    procedure Invoke(sender: Streaming_Adaptive_IAdaptiveMediaSource; args: Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs); safecall;
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

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationProgressHandler_2__IBuffer__UInt64 = interface(IUnknown)
  ['{D17F5EB6-B422-5E26-A817-7E0FD08F75D5}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 = interface(IUnknown)
  ['{ABC81235-39C7-59BF-9948-2D14A93D40FD}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IBuffer__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IBuffer,UInt64>
  // Used Types:  Windows.Storage.Streams.IBuffer
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IBuffer,UInt64>
  IAsyncOperationWithProgress_2__IBuffer__UInt64 = interface(IInspectable)
  ['{AD960E7F-D73B-56E4-A58C-6EC7678CFD88}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IBuffer__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64; safecall;
    function GetResults: IBuffer; safecall;
    property Progress: AsyncOperationProgressHandler_2__IBuffer__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IBuffer__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationProgressHandler_2__IInputStream__UInt64 = interface(IUnknown)
  ['{F9B2E7F6-762F-50DB-95DD-7F6C6EC47090}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 = interface(IUnknown)
  ['{8DB69706-3DD1-5A28-986A-93BE0776D9C3}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__IInputStream__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Storage.Streams.IInputStream,UInt64>
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Storage.Streams.IInputStream,UInt64>
  IAsyncOperationWithProgress_2__IInputStream__UInt64 = interface(IInspectable)
  ['{455AA601-F13E-5DEE-B9CB-16B531996327}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__IInputStream__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64; safecall;
    function GetResults: IInputStream; safecall;
    property Progress: AsyncOperationProgressHandler_2__IInputStream__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__IInputStream__UInt64 read get_Completed write put_Completed;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  UInt64
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  AsyncOperationProgressHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{14DA7DE7-40DF-5D4C-823F-CF310625AD39}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; progressInfo: UInt64); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 = interface(IUnknown)
  ['{BD75EEBE-E7B5-5AF6-8415-A4B9C9045202}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__HSTRING__UInt64; asyncStatus: AsyncStatus); safecall;
  end;

  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<String,UInt64>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<String,UInt64>
  // Used Types:  String
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<String,UInt64>
  IAsyncOperationWithProgress_2__HSTRING__UInt64 = interface(IInspectable)
  ['{C8BBCB29-6B64-5CE2-A831-038F6E02199E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__HSTRING__UInt64); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64; safecall;
    function GetResults: HSTRING; safecall;
    property Progress: AsyncOperationProgressHandler_2__HSTRING__UInt64 read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__HSTRING__UInt64 read get_Completed write put_Completed;
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
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadCompletedEventArgs)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs = interface(IInspectable)
  ['{19240DC3-5B37-4A1A-8970-D621CB6CA83B}']
    function get_ResourceType: Streaming_Adaptive_AdaptiveMediaSourceResourceType; safecall;
    function get_ResourceUri: IUriRuntimeClass; safecall;
    function get_ResourceByteRangeOffset: IReference_1__UInt64; safecall;
    function get_ResourceByteRangeLength: IReference_1__UInt64; safecall;
    function get_HttpResponseMessage: Http_IHttpResponseMessage; safecall;
    property HttpResponseMessage: Http_IHttpResponseMessage read get_HttpResponseMessage;
    property ResourceByteRangeLength: IReference_1__UInt64 read get_ResourceByteRangeLength;
    property ResourceByteRangeOffset: IReference_1__UInt64 read get_ResourceByteRangeOffset;
    property ResourceType: Streaming_Adaptive_AdaptiveMediaSourceResourceType read get_ResourceType;
    property ResourceUri: IUriRuntimeClass read get_ResourceUri;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs_Delegate_Base = interface(IUnknown)
  ['{CEF775DD-25B2-5588-8D51-DACDEA660A7D}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs = interface(TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs_Delegate_Base)
  ['{18ED2E26-1582-5201-BA28-D36640B7566E}']
    procedure Invoke(sender: Streaming_Adaptive_IAdaptiveMediaSource; args: Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadFailedEventArgs)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs = interface(IInspectable)
  ['{37739048-F4AB-40A4-B135-C6DFD8BD7FF1}']
    function get_ResourceType: Streaming_Adaptive_AdaptiveMediaSourceResourceType; safecall;
    function get_ResourceUri: IUriRuntimeClass; safecall;
    function get_ResourceByteRangeOffset: IReference_1__UInt64; safecall;
    function get_ResourceByteRangeLength: IReference_1__UInt64; safecall;
    function get_HttpResponseMessage: Http_IHttpResponseMessage; safecall;
    property HttpResponseMessage: Http_IHttpResponseMessage read get_HttpResponseMessage;
    property ResourceByteRangeLength: IReference_1__UInt64 read get_ResourceByteRangeLength;
    property ResourceByteRangeOffset: IReference_1__UInt64 read get_ResourceByteRangeOffset;
    property ResourceType: Streaming_Adaptive_AdaptiveMediaSourceResourceType read get_ResourceType;
    property ResourceUri: IUriRuntimeClass read get_ResourceUri;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs_Delegate_Base = interface(IUnknown)
  ['{6EE5CC44-49AD-5138-AB47-F5C075A2BC34}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs = interface(TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs_Delegate_Base)
  ['{569C79C5-DEB8-52EF-B9BD-053D702E92C9}']
    procedure Invoke(sender: Streaming_Adaptive_IAdaptiveMediaSource; args: Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  UInt32
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<UInt32>
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs>
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSource)]
  Streaming_Adaptive_IAdaptiveMediaSource = interface(IInspectable)
  ['{4C7332EF-D39F-4396-B4D9-043957A7C964}']
    function get_IsLive: Boolean; safecall;
    function get_DesiredLiveOffset: TimeSpan; safecall;
    procedure put_DesiredLiveOffset(value: TimeSpan); safecall;
    function get_InitialBitrate: Cardinal; safecall;
    procedure put_InitialBitrate(value: Cardinal); safecall;
    function get_CurrentDownloadBitrate: Cardinal; safecall;
    function get_CurrentPlaybackBitrate: Cardinal; safecall;
    function get_AvailableBitrates: IVectorView_1__Cardinal; safecall;
    function get_DesiredMinBitrate: IReference_1__Cardinal; safecall;
    procedure put_DesiredMinBitrate(value: IReference_1__Cardinal); safecall;
    function get_DesiredMaxBitrate: IReference_1__Cardinal; safecall;
    procedure put_DesiredMaxBitrate(value: IReference_1__Cardinal); safecall;
    function get_AudioOnlyPlayback: Boolean; safecall;
    function get_InboundBitsPerSecond: UInt64; safecall;
    function get_InboundBitsPerSecondWindow: TimeSpan; safecall;
    procedure put_InboundBitsPerSecondWindow(value: TimeSpan); safecall;
    function add_DownloadBitrateChanged(handler: TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DownloadBitrateChanged(token: EventRegistrationToken); safecall;
    function add_PlaybackBitrateChanged(handler: TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PlaybackBitrateChanged(token: EventRegistrationToken); safecall;
    function add_DownloadRequested(handler: TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DownloadRequested(token: EventRegistrationToken); safecall;
    function add_DownloadCompleted(handler: TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DownloadCompleted(token: EventRegistrationToken); safecall;
    function add_DownloadFailed(handler: TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSource__Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_DownloadFailed(token: EventRegistrationToken); safecall;
    property AudioOnlyPlayback: Boolean read get_AudioOnlyPlayback;
    property AvailableBitrates: IVectorView_1__Cardinal read get_AvailableBitrates;
    property CurrentDownloadBitrate: Cardinal read get_CurrentDownloadBitrate;
    property CurrentPlaybackBitrate: Cardinal read get_CurrentPlaybackBitrate;
    property DesiredLiveOffset: TimeSpan read get_DesiredLiveOffset write put_DesiredLiveOffset;
    property DesiredMaxBitrate: IReference_1__Cardinal read get_DesiredMaxBitrate write put_DesiredMaxBitrate;
    property DesiredMinBitrate: IReference_1__Cardinal read get_DesiredMinBitrate write put_DesiredMinBitrate;
    property InboundBitsPerSecond: UInt64 read get_InboundBitsPerSecond;
    property InboundBitsPerSecondWindow: TimeSpan read get_InboundBitsPerSecondWindow write put_InboundBitsPerSecondWindow;
    property InitialBitrate: Cardinal read get_InitialBitrate write put_InitialBitrate;
    property IsLive: Boolean read get_IsLive;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCreationStatus
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Web.Http.IHttpResponseMessage
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceCreationResult)]
  Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = interface(IInspectable)
  ['{4686B6B2-800F-4E31-9093-76D4782013E7}']
    function get_Status: Streaming_Adaptive_AdaptiveMediaSourceCreationStatus; safecall;
    function get_MediaSource: Streaming_Adaptive_IAdaptiveMediaSource; safecall;
    function get_HttpResponseMessage: Http_IHttpResponseMessage; safecall;
    property HttpResponseMessage: Http_IHttpResponseMessage read get_HttpResponseMessage;
    property MediaSource: Streaming_Adaptive_IAdaptiveMediaSource read get_MediaSource;
    property Status: Streaming_Adaptive_AdaptiveMediaSourceCreationStatus read get_Status;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult2
  Streaming_Adaptive_IAdaptiveMediaSourceCreationResult2 = interface(IInspectable)
  ['{1C3243BF-1C44-404B-A201-DF45AC7898E8}']
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult_Delegate_Base = interface(IUnknown)
  ['{BD68CC00-724C-5A76-A437-1464EBDDA4AC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = interface(AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult_Delegate_Base)
  ['{F744DE86-F28C-55E8-8D96-27B634737681}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult_Base = interface(IInspectable)
  ['{BE0BCC1D-D606-59D2-B2F9-FF204543DA12}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult = interface(IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult_Base)
  ['{E80E3F02-CF03-51CA-948B-35FF046A76E2}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; safecall;
    function GetResults: Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  String
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Web.Http.IHttpClient
  // Used Types:  Windows.Storage.Streams.IInputStream
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceStatics
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSource)]
  Streaming_Adaptive_IAdaptiveMediaSourceStatics = interface(IInspectable)
  ['{50A6BD5D-66EF-4CD3-9579-9E660507DC3F}']
    function IsContentTypeSupported(contentType: HSTRING): Boolean; safecall;
    function CreateFromUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; safecall;
    function CreateFromUriAsync(uri: IUriRuntimeClass; httpClient: Http_IHttpClient): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; safecall;
    function CreateFromStreamAsync(stream: IInputStream; uri: IUriRuntimeClass; contentType: HSTRING): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; safecall;
    function CreateFromStreamAsync(stream: IInputStream; uri: IUriRuntimeClass; contentType: HSTRING; httpClient: Http_IHttpClient): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Windows.Foundation.IReference`1<Double>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceAdvancedSettings)]
  Streaming_Adaptive_IAdaptiveMediaSourceAdvancedSettings = interface(IInspectable)
  ['{55DB1680-1AEB-47DC-AA08-9A11610BA45A}']
    function get_AllSegmentsIndependent: Boolean; safecall;
    procedure put_AllSegmentsIndependent(value: Boolean); safecall;
    function get_DesiredBitrateHeadroomRatio: IReference_1__Double; safecall;
    procedure put_DesiredBitrateHeadroomRatio(value: IReference_1__Double); safecall;
    function get_BitrateDowngradeTriggerRatio: IReference_1__Double; safecall;
    procedure put_BitrateDowngradeTriggerRatio(value: IReference_1__Double); safecall;
    property AllSegmentsIndependent: Boolean read get_AllSegmentsIndependent write put_AllSegmentsIndependent;
    property BitrateDowngradeTriggerRatio: IReference_1__Double read get_BitrateDowngradeTriggerRatio write put_BitrateDowngradeTriggerRatio;
    property DesiredBitrateHeadroomRatio: IReference_1__Double read get_DesiredBitrateHeadroomRatio write put_DesiredBitrateHeadroomRatio;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource2
  Streaming_Adaptive_IAdaptiveMediaSource2 = interface(IInspectable)
  ['{17890342-6760-4BB9-A58A-F7AA98B08C0E}']
    function get_AdvancedSettings: Streaming_Adaptive_IAdaptiveMediaSourceAdvancedSettings; safecall;
    property AdvancedSettings: Streaming_Adaptive_IAdaptiveMediaSourceAdvancedSettings read get_AdvancedSettings;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType
  }
  // Windows.Foundation.IReference`1<Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType>
  IReference_1__Streaming_Adaptive_AdaptiveMediaSourceResourceType = interface(IInspectable)
  ['{455ACF7B-8F11-5BB9-93BE-7A214CD5A134}']
    function get_Value: Streaming_Adaptive_AdaptiveMediaSourceResourceType; safecall;
    property Value: Streaming_Adaptive_AdaptiveMediaSourceResourceType read get_Value;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnosticType
  // Used Types:  Windows.Foundation.IReference`1<Int32>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceResourceType>
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDiagnosticAvailableEventArgs)]
  Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = interface(IInspectable)
  ['{3AF64F06-6D9C-494A-B7A9-B3A5DEE6AD68}']
    function get_DiagnosticType: Streaming_Adaptive_AdaptiveMediaSourceDiagnosticType; safecall;
    function get_RequestId: IReference_1__Integer; safecall;
    function get_Position: IReference_1__TimeSpan; safecall;
    function get_SegmentId: IReference_1__UInt64; safecall;
    function get_ResourceType: IReference_1__Streaming_Adaptive_AdaptiveMediaSourceResourceType; safecall;
    function get_ResourceUri: IUriRuntimeClass; safecall;
    function get_ResourceByteRangeOffset: IReference_1__UInt64; safecall;
    function get_ResourceByteRangeLength: IReference_1__UInt64; safecall;
    function get_Bitrate: IReference_1__Cardinal; safecall;
    property Bitrate: IReference_1__Cardinal read get_Bitrate;
    property DiagnosticType: Streaming_Adaptive_AdaptiveMediaSourceDiagnosticType read get_DiagnosticType;
    property Position: IReference_1__TimeSpan read get_Position;
    property RequestId: IReference_1__Integer read get_RequestId;
    property ResourceByteRangeLength: IReference_1__UInt64 read get_ResourceByteRangeLength;
    property ResourceByteRangeOffset: IReference_1__UInt64 read get_ResourceByteRangeOffset;
    property ResourceType: IReference_1__Streaming_Adaptive_AdaptiveMediaSourceResourceType read get_ResourceType;
    property ResourceUri: IUriRuntimeClass read get_ResourceUri;
    property SegmentId: IReference_1__UInt64 read get_SegmentId;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Delegate_Base = interface(IUnknown)
  ['{FD4CE6B5-7C3B-58F4-9EFC-1D9EE6A09D21}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs>
  TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs = interface(TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs_Delegate_Base)
  ['{DEEAE86C-0A5C-5AEC-96E6-C20A85A01BC8}']
    procedure Invoke(sender: Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics; args: Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics,Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDiagnostics)]
  Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics = interface(IInspectable)
  ['{9B24EE68-962E-448C-AEBF-B29B56098E23}']
    function add_DiagnosticAvailable(handler: TypedEventHandler_2__Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics__Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs): EventRegistrationToken; safecall;
    procedure remove_DiagnosticAvailable(token: EventRegistrationToken); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.DateTime>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceCorrelatedTimes)]
  Streaming_Adaptive_IAdaptiveMediaSourceCorrelatedTimes = interface(IInspectable)
  ['{05108787-E032-48E1-AB8D-002B0B3051DF}']
    function get_Position: IReference_1__TimeSpan; safecall;
    function get_PresentationTimeStamp: IReference_1__TimeSpan; safecall;
    function get_ProgramDateTime: IReference_1__DateTime; safecall;
    property Position: IReference_1__TimeSpan read get_Position;
    property PresentationTimeStamp: IReference_1__TimeSpan read get_PresentationTimeStamp;
    property ProgramDateTime: IReference_1__DateTime read get_ProgramDateTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource3
  Streaming_Adaptive_IAdaptiveMediaSource3 = interface(IInspectable)
  ['{BA7023FD-C334-461B-A36E-C99F54F7174A}']
    function get_MinLiveOffset: IReference_1__TimeSpan; safecall;
    function get_MaxSeekableWindowSize: IReference_1__TimeSpan; safecall;
    function get_DesiredSeekableWindowSize: IReference_1__TimeSpan; safecall;
    procedure put_DesiredSeekableWindowSize(value: IReference_1__TimeSpan); safecall;
    function get_Diagnostics: Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics; safecall;
    function GetCorrelatedTimes: Streaming_Adaptive_IAdaptiveMediaSourceCorrelatedTimes; safecall;
    property DesiredSeekableWindowSize: IReference_1__TimeSpan read get_DesiredSeekableWindowSize write put_DesiredSeekableWindowSize;
    property Diagnostics: Streaming_Adaptive_IAdaptiveMediaSourceDiagnostics read get_Diagnostics;
    property MaxSeekableWindowSize: IReference_1__TimeSpan read get_MaxSeekableWindowSize;
    property MinLiveOffset: IReference_1__TimeSpan read get_MinLiveOffset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedReason
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 = interface(IInspectable)
  ['{F3F1F444-96AE-4DE0-B540-2B3246E6968C}']
    function get_Reason: Streaming_Adaptive_AdaptiveMediaSourceDownloadBitrateChangedReason; safecall;
    property Reason: Streaming_Adaptive_AdaptiveMediaSourceDownloadBitrateChangedReason read get_Reason;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadRequestedEventArgs2 = interface(IInspectable)
  ['{B37D8BFE-AA44-4D82-825B-611DE3BCFECB}']
    function get_RequestId: Integer; safecall;
    function get_Position: IReference_1__TimeSpan; safecall;
    property Position: IReference_1__TimeSpan read get_Position;
    property RequestId: Integer read get_RequestId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<UInt64>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadResult2 = interface(IInspectable)
  ['{15552CB7-7B80-4AC4-8660-A4B97F7C70F0}']
    function get_ResourceByteRangeOffset: IReference_1__UInt64; safecall;
    procedure put_ResourceByteRangeOffset(value: IReference_1__UInt64); safecall;
    function get_ResourceByteRangeLength: IReference_1__UInt64; safecall;
    procedure put_ResourceByteRangeLength(value: IReference_1__UInt64); safecall;
    property ResourceByteRangeLength: IReference_1__UInt64 read get_ResourceByteRangeLength write put_ResourceByteRangeLength;
    property ResourceByteRangeOffset: IReference_1__UInt64 read get_ResourceByteRangeOffset write put_ResourceByteRangeOffset;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt64
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
  [WinRTClassNameAttribute(SStreaming_Adaptive_AdaptiveMediaSourceDownloadStatistics)]
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics = interface(IInspectable)
  ['{A306CEFB-E96A-4DFF-A9B8-1AE08C01AE98}']
    function get_ContentBytesReceivedCount: UInt64; safecall;
    function get_TimeToHeadersReceived: IReference_1__TimeSpan; safecall;
    function get_TimeToFirstByteReceived: IReference_1__TimeSpan; safecall;
    function get_TimeToLastByteReceived: IReference_1__TimeSpan; safecall;
    property ContentBytesReceivedCount: UInt64 read get_ContentBytesReceivedCount;
    property TimeToFirstByteReceived: IReference_1__TimeSpan read get_TimeToFirstByteReceived;
    property TimeToHeadersReceived: IReference_1__TimeSpan read get_TimeToHeadersReceived;
    property TimeToLastByteReceived: IReference_1__TimeSpan read get_TimeToLastByteReceived;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadCompletedEventArgs2 = interface(IInspectable)
  ['{704744C4-964A-40E4-AF95-9177DD6DFA00}']
    function get_RequestId: Integer; safecall;
    function get_Statistics: Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics; safecall;
    function get_Position: IReference_1__TimeSpan; safecall;
    property Position: IReference_1__TimeSpan read get_Position;
    property RequestId: Integer read get_RequestId;
    property Statistics: Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics read get_Statistics;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Int32
  // Used Types:  Windows.Foundation.HResult
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDownloadFailedEventArgs2 = interface(IInspectable)
  ['{70919568-967C-4986-90C5-C6FC4B31E2D8}']
    function get_RequestId: Integer; safecall;
    function get_ExtendedError: HRESULT; safecall;
    function get_Statistics: Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics; safecall;
    function get_Position: IReference_1__TimeSpan; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
    property Position: IReference_1__TimeSpan read get_Position;
    property RequestId: Integer read get_RequestId;
    property Statistics: Streaming_Adaptive_IAdaptiveMediaSourceDownloadStatistics read get_Statistics;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs2
  Streaming_Adaptive_IAdaptiveMediaSourceDiagnosticAvailableEventArgs2 = interface(IInspectable)
  ['{8C6DD857-16A5-4D9F-810E-00BD901B3EF9}']
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.MediaSourceState
  }
  // Windows.Media.Core.IMediaSourceStateChangedEventArgs
  [WinRTClassNameAttribute(SCore_MediaSourceStateChangedEventArgs)]
  Core_IMediaSourceStateChangedEventArgs = interface(IInspectable)
  ['{0A30AF82-9071-4BAC-BC39-CA2A93B717A9}']
    function get_OldState: Core_MediaSourceState; safecall;
    function get_NewState: Core_MediaSourceState; safecall;
    property NewState: Core_MediaSourceState read get_NewState;
    property OldState: Core_MediaSourceState read get_OldState;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaSource2
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMseStreamSource
  // Used Types:  Windows.Media.Core.IMediaSource
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  }
  // Windows.Media.Core.IMediaSourceStatics
  [WinRTClassNameAttribute(SCore_MediaSource)]
  Core_IMediaSourceStatics = interface(IInspectable)
  ['{F77D6FA4-4652-410E-B1D8-E9A5E245A45C}']
    function CreateFromAdaptiveMediaSource(mediaSource: Streaming_Adaptive_IAdaptiveMediaSource): Core_IMediaSource2; safecall;
    function CreateFromMediaStreamSource(mediaSource: Core_IMediaStreamSource): Core_IMediaSource2; safecall;
    function CreateFromMseStreamSource(mediaSource: Core_IMseStreamSource): Core_IMediaSource2; safecall;
    function CreateFromIMediaSource(mediaSource: Core_IMediaSource): Core_IMediaSource2; safecall;
    function CreateFromStorageFile(&file: IStorageFile): Core_IMediaSource2; safecall;
    function CreateFromStream(stream: IRandomAccessStream; contentType: HSTRING): Core_IMediaSource2; safecall;
    function CreateFromStreamReference(stream: IRandomAccessStreamReference; contentType: HSTRING): Core_IMediaSource2; safecall;
    function CreateFromUri(uri: IUriRuntimeClass): Core_IMediaSource2; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBindingEventArgs,Object>
  TypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable_Delegate_Base = interface(IUnknown)
  ['{3F3B10E2-B2E9-55C6-ABB3-4A258072EBB9}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaBindingEventArgs
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBindingEventArgs,Object>
  TypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable = interface(TypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable_Delegate_Base)
  ['{ED1D7C7B-E71A-51B2-9E73-47228519D0D2}']
    procedure Invoke(sender: Core_IMediaBindingEventArgs; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBindingEventArgs,Object>
  // Used Types:  Windows.Media.Core.IMediaBinder
  // Used Types:  Windows.Foundation.IDeferral
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  String
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  }
  // Windows.Media.Core.IMediaBindingEventArgs
  [WinRTClassNameAttribute(SCore_MediaBindingEventArgs)]
  Core_IMediaBindingEventArgs = interface(IInspectable)
  ['{B61CB25A-1B6D-4630-A86D-2F0837F712E5}']
    function add_Canceled(handler: TypedEventHandler_2__Core_IMediaBindingEventArgs__IInspectable): EventRegistrationToken; safecall;
    procedure remove_Canceled(token: EventRegistrationToken); safecall;
    function get_MediaBinder: Core_IMediaBinder; safecall;
    function GetDeferral: IDeferral; safecall;
    procedure SetUri(uri: IUriRuntimeClass); safecall;
    procedure SetStream(stream: IRandomAccessStream; contentType: HSTRING); safecall;
    procedure SetStreamReference(stream: IRandomAccessStreamReference; contentType: HSTRING); safecall;
    property MediaBinder: Core_IMediaBinder read get_MediaBinder;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBinder,Windows.Media.Core.IMediaBindingEventArgs>
  TypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs_Delegate_Base = interface(IUnknown)
  ['{5B133719-EE98-59B2-B432-1C9A5A56AB05}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaBinder
  // Used Types:  Windows.Media.Core.IMediaBindingEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBinder,Windows.Media.Core.IMediaBindingEventArgs>
  TypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs = interface(TypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs_Delegate_Base)
  ['{DEDF9F57-3FA7-5506-8748-79D57307CF9A}']
    procedure Invoke(sender: Core_IMediaBinder; args: Core_IMediaBindingEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaBinder,Windows.Media.Core.IMediaBindingEventArgs>
  // Used Types:  String
  // Used Types:  Windows.Media.Core.IMediaSource2
  }
  // Windows.Media.Core.IMediaBinder
  [WinRTClassNameAttribute(SCore_MediaBinder)]
  Core_IMediaBinder = interface(IInspectable)
  ['{2B7E40AA-DE07-424F-83F1-F1DE46C4FA2E}']
    function add_Binding(handler: TypedEventHandler_2__Core_IMediaBinder__Core_IMediaBindingEventArgs): EventRegistrationToken; safecall;
    procedure remove_Binding(token: EventRegistrationToken); safecall;
    function get_Token: HSTRING; safecall;
    procedure put_Token(value: HSTRING); safecall;
    function get_Source: Core_IMediaSource2; safecall;
    property Source: Core_IMediaSource2 read get_Source;
    property Token: HSTRING read get_Token write put_Token;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaSource2
  // Used Types:  Windows.Media.Core.IMediaBinder
  }
  // Windows.Media.Core.IMediaSourceStatics2
  [WinRTClassNameAttribute(SCore_MediaSource)]
  Core_IMediaSourceStatics2 = interface(IInspectable)
  ['{EEE161A4-7F13-4896-B8CB-DF0DE5BCB9F1}']
    function CreateFromMediaBinder(binder: Core_IMediaBinder): Core_IMediaSource2; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaSource2
  // Used Types:  Windows.Media.Capture.Frames.IMediaFrameSource
  }
  // Windows.Media.Core.IMediaSourceStatics3
  [WinRTClassNameAttribute(SCore_MediaSource)]
  Core_IMediaSourceStatics3 = interface(IInspectable)
  ['{453A30D6-2BEA-4122-9F73-EACE04526E35}']
    function CreateFromMediaFrameSource(frameSource: Capture_Frames_IMediaFrameSource): Core_IMediaSource2; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Media.Core.IMediaBindingEventArgs2
  Core_IMediaBindingEventArgs2 = interface(IInspectable)
  ['{0464CCEB-BB5A-482F-B8BA-F0284C696567}']
    procedure SetAdaptiveMediaSource(mediaSource: Streaming_Adaptive_IAdaptiveMediaSource); safecall;
    procedure SetStorageFile(&file: IStorageFile); safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaSource2
  // Used Types:  Windows.Media.Core.IMediaSourceStateChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaSource2,Windows.Media.Core.IMediaSourceStateChangedEventArgs>
  TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceStateChangedEventArgs = interface(IUnknown)
  ['{4CD7BABA-7EBB-5D29-9C9C-918C7626630F}']
    procedure Invoke(sender: Core_IMediaSource2; args: Core_IMediaSourceStateChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaSource2,Windows.Media.Core.IMediaSourceStateChangedEventArgs>
  // Used Types:  Windows.Media.Core.MediaSourceState
  }
  // Windows.Media.Core.IMediaSource3
  Core_IMediaSource3 = interface(IInspectable)
  ['{B59F0D9B-4B6E-41ED-BBB4-7C7509A994AD}']
    function add_StateChanged(handler: TypedEventHandler_2__Core_IMediaSource2__Core_IMediaSourceStateChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_StateChanged(token: EventRegistrationToken); safecall;
    function get_State: Core_MediaSourceState; safecall;
    procedure Reset; safecall;
    property State: Core_MediaSourceState read get_State;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Used Types:  Windows.Media.Core.IMediaStreamSource
  // Used Types:  Windows.Media.Core.IMseStreamSource
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  Windows.Foundation.IAsyncAction
  }
  // Windows.Media.Core.IMediaSource4
  Core_IMediaSource4 = interface(IInspectable)
  ['{BDAFAD57-8EFF-4C63-85A6-84DE0AE3E4F2}']
    function get_AdaptiveMediaSource: Streaming_Adaptive_IAdaptiveMediaSource; safecall;
    function get_MediaStreamSource: Core_IMediaStreamSource; safecall;
    function get_MseStreamSource: Core_IMseStreamSource; safecall;
    function get_Uri: IUriRuntimeClass; safecall;
    function OpenAsync: IAsyncAction; safecall;
    property AdaptiveMediaSource: Streaming_Adaptive_IAdaptiveMediaSource read get_AdaptiveMediaSource;
    property MediaStreamSource: Core_IMediaStreamSource read get_MediaStreamSource;
    property MseStreamSource: Core_IMseStreamSource read get_MseStreamSource;
    property Uri: IUriRuntimeClass read get_Uri;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISingleSelectMediaTrackList,Object>
  TypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable_Delegate_Base = interface(IUnknown)
  ['{21EB6E39-728A-56A9-8DCE-062BA4C81BF5}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ISingleSelectMediaTrackList
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISingleSelectMediaTrackList,Object>
  TypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable = interface(TypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable_Delegate_Base)
  ['{21EB6E39-728A-56A9-8DCE-062BA4C81BF5}']
    procedure Invoke(sender: Core_ISingleSelectMediaTrackList; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.ISingleSelectMediaTrackList,Object>
  // Used Types:  Int32
  }
  // Windows.Media.Core.ISingleSelectMediaTrackList
  Core_ISingleSelectMediaTrackList = interface(IInspectable)
  ['{77206F1F-C34F-494F-8077-2BAD9FF4ECF1}']
    function add_SelectedIndexChanged(handler: TypedEventHandler_2__Core_ISingleSelectMediaTrackList__IInspectable): EventRegistrationToken; safecall;
    procedure remove_SelectedIndexChanged(token: EventRegistrationToken); safecall;
    procedure put_SelectedIndex(value: Integer); safecall;
    function get_SelectedIndex: Integer; safecall;
    property SelectedIndex: Integer read get_SelectedIndex write put_SelectedIndex;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedMetadataTrack
  // Used Types:  String
  // Used Types:  Windows.Media.Core.TimedMetadataKind
  }
  // Windows.Media.Core.ITimedMetadataTrackFactory
  [WinRTClassNameAttribute(SCore_TimedMetadataTrack)]
  Core_ITimedMetadataTrackFactory = interface(IInspectable)
  ['{8DD57611-97B3-4E1F-852C-0F482C81AD26}']
    function Create(id: HSTRING; language: HSTRING; kind: Core_TimedMetadataKind): Core_ITimedMetadataTrack; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextSource
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  }
  // Windows.Media.Core.ITimedTextSourceStatics
  [WinRTClassNameAttribute(SCore_TimedTextSource)]
  Core_ITimedTextSourceStatics = interface(IInspectable)
  ['{7E311853-9ABA-4AC4-BB98-2FB176C3BFDD}']
    function CreateFromStream(stream: IRandomAccessStream): Core_ITimedTextSource; overload; safecall;
    function CreateFromUri(uri: IUriRuntimeClass): Core_ITimedTextSource; overload; safecall;
    function CreateFromStream(stream: IRandomAccessStream; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; safecall;
    function CreateFromUri(uri: IUriRuntimeClass; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedTextSource
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  // Used Types:  Windows.Foundation.IUriRuntimeClass
  // Used Types:  String
  }
  // Windows.Media.Core.ITimedTextSourceStatics2
  [WinRTClassNameAttribute(SCore_TimedTextSource)]
  Core_ITimedTextSourceStatics2 = interface(IInspectable)
  ['{B66B7602-923E-43FA-9633-587075812DB5}']
    function CreateFromStreamWithIndex(stream: IRandomAccessStream; indexStream: IRandomAccessStream): Core_ITimedTextSource; overload; safecall;
    function CreateFromUriWithIndex(uri: IUriRuntimeClass; indexUri: IUriRuntimeClass): Core_ITimedTextSource; overload; safecall;
    function CreateFromStreamWithIndex(stream: IRandomAccessStream; indexStream: IRandomAccessStream; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; safecall;
    function CreateFromUriWithIndex(uri: IUriRuntimeClass; indexUri: IUriRuntimeClass; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.MediaDecoderStatus
  // Used Types:  Windows.Media.Core.MediaSourceStatus
  }
  // Windows.Media.Core.IVideoTrackSupportInfo
  [WinRTClassNameAttribute(SCore_VideoTrackSupportInfo)]
  Core_IVideoTrackSupportInfo = interface(IInspectable)
  ['{4BB534A0-FC5F-450D-8FF0-778D590486DE}']
    function get_DecoderStatus: Core_MediaDecoderStatus; safecall;
    function get_MediaSourceStatus: Core_MediaSourceStatus; safecall;
    property DecoderStatus: Core_MediaDecoderStatus read get_DecoderStatus;
    property MediaSourceStatus: Core_MediaSourceStatus read get_MediaSourceStatus;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.MediaDecoderStatus
  // Used Types:  Windows.Media.Core.AudioDecoderDegradation
  // Used Types:  Windows.Media.Core.AudioDecoderDegradationReason
  // Used Types:  Windows.Media.Core.MediaSourceStatus
  }
  // Windows.Media.Core.IAudioTrackSupportInfo
  [WinRTClassNameAttribute(SCore_AudioTrackSupportInfo)]
  Core_IAudioTrackSupportInfo = interface(IInspectable)
  ['{178BEFF7-CC39-44A6-B951-4A5653F073FA}']
    function get_DecoderStatus: Core_MediaDecoderStatus; safecall;
    function get_Degradation: Core_AudioDecoderDegradation; safecall;
    function get_DegradationReason: Core_AudioDecoderDegradationReason; safecall;
    function get_MediaSourceStatus: Core_MediaSourceStatus; safecall;
    property DecoderStatus: Core_MediaDecoderStatus read get_DecoderStatus;
    property Degradation: Core_AudioDecoderDegradation read get_Degradation;
    property DegradationReason: Core_AudioDecoderDegradationReason read get_DegradationReason;
    property MediaSourceStatus: Core_MediaSourceStatus read get_MediaSourceStatus;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Media.Core.IVideoTrackOpenFailedEventArgs
  [WinRTClassNameAttribute(SCore_VideoTrackOpenFailedEventArgs)]
  Core_IVideoTrackOpenFailedEventArgs = interface(IInspectable)
  ['{7679E231-04F9-4C82-A4EE-8602C8BB4754}']
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.HResult
  }
  // Windows.Media.Core.IAudioTrackOpenFailedEventArgs
  [WinRTClassNameAttribute(SCore_AudioTrackOpenFailedEventArgs)]
  Core_IAudioTrackOpenFailedEventArgs = interface(IInspectable)
  ['{EEDDB9B9-BB7C-4112-BF76-9384676F824B}']
    function get_ExtendedError: HRESULT; safecall;
    property ExtendedError: HRESULT read get_ExtendedError;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaTrack
  // Used Types:  Windows.Media.Core.IVideoTrackOpenFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaTrack,Windows.Media.Core.IVideoTrackOpenFailedEventArgs>
  TypedEventHandler_2__Core_IMediaTrack__Core_IVideoTrackOpenFailedEventArgs = interface(IUnknown)
  ['{94DB2D4C-AB22-5621-A0F5-A9FE30900B32}']
    procedure Invoke(sender: Core_IMediaTrack; args: Core_IVideoTrackOpenFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaTrack,Windows.Media.Core.IVideoTrackOpenFailedEventArgs>
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  String
  // Used Types:  Windows.Media.Core.IVideoTrackSupportInfo
  }
  // Windows.Media.Core.IVideoTrack
  [WinRTClassNameAttribute(SCore_VideoTrack)]
  Core_IVideoTrack = interface(IInspectable)
  ['{99F3B7F3-E298-4396-BB6A-A51BE6A2A20A}']
    function add_OpenFailed(handler: TypedEventHandler_2__Core_IMediaTrack__Core_IVideoTrackOpenFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OpenFailed(token: EventRegistrationToken); safecall;
    function GetEncodingProperties: IVideoEncodingProperties; safecall;
    function get_PlaybackItem: Playback_IMediaPlaybackItem; safecall;
    function get_Name: HSTRING; safecall;
    function get_SupportInfo: Core_IVideoTrackSupportInfo; safecall;
    property Name: HSTRING read get_Name;
    property PlaybackItem: Playback_IMediaPlaybackItem read get_PlaybackItem;
    property SupportInfo: Core_IVideoTrackSupportInfo read get_SupportInfo;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.IMediaTrack
  // Used Types:  Windows.Media.Core.IAudioTrackOpenFailedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaTrack,Windows.Media.Core.IAudioTrackOpenFailedEventArgs>
  TypedEventHandler_2__Core_IMediaTrack__Core_IAudioTrackOpenFailedEventArgs = interface(IUnknown)
  ['{45D31A74-561B-5053-A805-40BB7BF258A7}']
    procedure Invoke(sender: Core_IMediaTrack; args: Core_IAudioTrackOpenFailedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Core.IMediaTrack,Windows.Media.Core.IAudioTrackOpenFailedEventArgs>
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  String
  // Used Types:  Windows.Media.Core.IAudioTrackSupportInfo
  }
  // Windows.Media.Core.IAudioTrack
  [WinRTClassNameAttribute(SCore_AudioTrack)]
  Core_IAudioTrack = interface(IInspectable)
  ['{F23B6E77-3EF7-40DE-B943-068B1321701D}']
    function add_OpenFailed(handler: TypedEventHandler_2__Core_IMediaTrack__Core_IAudioTrackOpenFailedEventArgs): EventRegistrationToken; safecall;
    procedure remove_OpenFailed(token: EventRegistrationToken); safecall;
    function GetEncodingProperties: IAudioEncodingProperties; safecall;
    function get_PlaybackItem: Playback_IMediaPlaybackItem; safecall;
    function get_Name: HSTRING; safecall;
    function get_SupportInfo: Core_IAudioTrackSupportInfo; safecall;
    property Name: HSTRING read get_Name;
    property PlaybackItem: Playback_IMediaPlaybackItem read get_PlaybackItem;
    property SupportInfo: Core_IAudioTrackSupportInfo read get_SupportInfo;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  String
  }
  // Windows.Media.Core.ITimedMetadataTrack2
  Core_ITimedMetadataTrack2 = interface(IInspectable)
  ['{21B4B648-9F9D-40BA-A8F3-1A92753AEF0B}']
    function get_PlaybackItem: Playback_IMediaPlaybackItem; safecall;
    function get_Name: HSTRING; safecall;
    property Name: HSTRING read get_Name;
    property PlaybackItem: Playback_IMediaPlaybackItem read get_PlaybackItem;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Windows.Media.Core.IMediaSource2
  }
  // Windows.Media.Playback.IMediaPlaybackItemFactory
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackItem)]
  Playback_IMediaPlaybackItemFactory = interface(IInspectable)
  ['{7133FCE1-1769-4FF9-A7C1-38D2C4D42360}']
    function Create(source: Core_IMediaSource2): Playback_IMediaPlaybackItem; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Windows.Media.Core.IMediaSource2
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Playback.IMediaPlaybackItemFactory2
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackItem)]
  Playback_IMediaPlaybackItemFactory2 = interface(IInspectable)
  ['{D77CDF3A-B947-4972-B35D-ADFB931A71E6}']
    function CreateWithStartTime(source: Core_IMediaSource2; startTime: TimeSpan): Playback_IMediaPlaybackItem; safecall;
    function CreateWithStartTimeAndDurationLimit(source: Core_IMediaSource2; startTime: TimeSpan; durationLimit: TimeSpan): Playback_IMediaPlaybackItem; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Windows.Media.Core.IMediaSource2
  }
  // Windows.Media.Playback.IMediaPlaybackItemStatics
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackItem)]
  Playback_IMediaPlaybackItemStatics = interface(IInspectable)
  ['{4B1BE7F4-4345-403C-8A67-F5DE91DF4C86}']
    function FindFromMediaSource(source: Core_IMediaSource2): Playback_IMediaPlaybackItem; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaPlaybackType
  // Used Types:  Windows.Media.IMusicDisplayProperties
  // Used Types:  Windows.Media.IVideoDisplayProperties
  // Used Types:  Windows.Storage.Streams.IRandomAccessStreamReference
  }
  // Windows.Media.Playback.IMediaItemDisplayProperties
  Playback_IMediaItemDisplayProperties = interface(IInspectable)
  ['{1E3C1B48-7097-4384-A217-C1291DFA8C16}']
    function get_Type: MediaPlaybackType; safecall;
    procedure put_Type(value: MediaPlaybackType); safecall;
    function get_MusicProperties: IMusicDisplayProperties; safecall;
    function get_VideoProperties: IVideoDisplayProperties; safecall;
    function get_Thumbnail: IRandomAccessStreamReference; safecall;
    procedure put_Thumbnail(value: IRandomAccessStreamReference); safecall;
    procedure ClearAll; safecall;
    property MusicProperties: IMusicDisplayProperties read get_MusicProperties;
    property Thumbnail: IRandomAccessStreamReference read get_Thumbnail write put_Thumbnail;
    property &Type: MediaPlaybackType read get_Type write put_Type;
    property VideoProperties: IVideoDisplayProperties read get_VideoProperties;
  end;

  // Generic Delegate for 
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakSchedule,Object>
  TypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable_Delegate_Base = interface(IUnknown)
  ['{3C57ACBF-CA07-586A-8ADB-8047DC9165A6}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreakSchedule
  // Used Types:  Object
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakSchedule,Object>
  TypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable = interface(TypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable_Delegate_Base)
  ['{37E71A74-4017-5DAC-8B46-34C3B470856F}']
    procedure Invoke(sender: Playback_IMediaBreakSchedule; args: IInspectable); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Media.Playback.IMediaBreakSchedule,Object>
  // Used Types:  Windows.Media.Playback.IMediaBreak
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaBreak>
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  }
  // Windows.Media.Playback.IMediaBreakSchedule
  [WinRTClassNameAttribute(SPlayback_MediaBreakSchedule)]
  Playback_IMediaBreakSchedule = interface(IInspectable)
  ['{A19A5813-98B6-41D8-83DA-F971D22B7BBA}']
    function add_ScheduleChanged(handler: TypedEventHandler_2__Playback_IMediaBreakSchedule__IInspectable): EventRegistrationToken; safecall;
    procedure remove_ScheduleChanged(token: EventRegistrationToken); safecall;
    procedure InsertMidrollBreak(mediaBreak: Playback_IMediaBreak); safecall;
    procedure RemoveMidrollBreak(mediaBreak: Playback_IMediaBreak); safecall;
    function get_MidrollBreaks: IVectorView_1__Playback_IMediaBreak; safecall;
    procedure put_PrerollBreak(value: Playback_IMediaBreak); safecall;
    function get_PrerollBreak: Playback_IMediaBreak; safecall;
    procedure put_PostrollBreak(value: Playback_IMediaBreak); safecall;
    function get_PostrollBreak: Playback_IMediaBreak; safecall;
    function get_PlaybackItem: Playback_IMediaPlaybackItem; safecall;
    property MidrollBreaks: IVectorView_1__Playback_IMediaBreak read get_MidrollBreaks;
    property PlaybackItem: Playback_IMediaPlaybackItem read get_PlaybackItem;
    property PostrollBreak: Playback_IMediaBreak read get_PostrollBreak write put_PostrollBreak;
    property PrerollBreak: Playback_IMediaBreak read get_PrerollBreak write put_PrerollBreak;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreakSchedule
  // Used Types:  Windows.Foundation.TimeSpan
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Boolean
  // Used Types:  Windows.Media.Playback.IMediaItemDisplayProperties
  }
  // Windows.Media.Playback.IMediaPlaybackItem2
  Playback_IMediaPlaybackItem2 = interface(IInspectable)
  ['{D859D171-D7EF-4B81-AC1F-F40493CBB091}']
    function get_BreakSchedule: Playback_IMediaBreakSchedule; safecall;
    function get_StartTime: TimeSpan; safecall;
    function get_DurationLimit: IReference_1__TimeSpan; safecall;
    function get_CanSkip: Boolean; safecall;
    procedure put_CanSkip(value: Boolean); safecall;
    function GetDisplayProperties: Playback_IMediaItemDisplayProperties; safecall;
    procedure ApplyDisplayProperties(value: Playback_IMediaItemDisplayProperties); safecall;
    property BreakSchedule: Playback_IMediaBreakSchedule read get_BreakSchedule;
    property CanSkip: Boolean read get_CanSkip write put_CanSkip;
    property DurationLimit: IReference_1__TimeSpan read get_DurationLimit;
    property StartTime: TimeSpan read get_StartTime;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  // Used Types:  Double
  // Used Types:  Windows.Media.Playback.AutoLoadedDisplayPropertyKind
  }
  // Windows.Media.Playback.IMediaPlaybackItem3
  Playback_IMediaPlaybackItem3 = interface(IInspectable)
  ['{0D328220-B80A-4D09-9FF8-F87094A1C831}']
    function get_IsDisabledInPlaybackList: Boolean; safecall;
    procedure put_IsDisabledInPlaybackList(value: Boolean); safecall;
    function get_TotalDownloadProgress: Double; safecall;
    function get_AutoLoadedDisplayProperties: Playback_AutoLoadedDisplayPropertyKind; safecall;
    procedure put_AutoLoadedDisplayProperties(value: Playback_AutoLoadedDisplayPropertyKind); safecall;
    property AutoLoadedDisplayProperties: Playback_AutoLoadedDisplayPropertyKind read get_AutoLoadedDisplayProperties write put_AutoLoadedDisplayProperties;
    property IsDisabledInPlaybackList: Boolean read get_IsDisabledInPlaybackList write put_IsDisabledInPlaybackList;
    property TotalDownloadProgress: Double read get_TotalDownloadProgress;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.IMediaBreak
  // Used Types:  Windows.Media.Playback.MediaBreakInsertionMethod
  // Used Types:  Windows.Foundation.TimeSpan
  }
  // Windows.Media.Playback.IMediaBreakFactory
  [WinRTClassNameAttribute(SPlayback_MediaBreak)]
  Playback_IMediaBreakFactory = interface(IInspectable)
  ['{4516E002-18E0-4079-8B5F-D33495C15D2E}']
    function Create(insertionMethod: Playback_MediaBreakInsertionMethod): Playback_IMediaBreak; safecall;
    function CreateWithPresentationPosition(insertionMethod: Playback_MediaBreakInsertionMethod; presentationPosition: TimeSpan): Playback_IMediaBreak; safecall;
  end;

  {
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Windows.Media.Playback.IMediaPlaybackSource
  }
  // Windows.Media.Playback.IMediaEnginePlaybackSource
  Playback_IMediaEnginePlaybackSource = interface(IInspectable)
  ['{5C1D0BA7-3856-48B9-8DC6-244BF107BF8C}']
    function get_CurrentItem: Playback_IMediaPlaybackItem; safecall;
    procedure SetPlaybackSource(source: Playback_IMediaPlaybackSource); safecall;
    property CurrentItem: Playback_IMediaPlaybackItem read get_CurrentItem;
  end deprecated;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Playback.MediaPlaybackItemChangedReason
  }
  // Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs2
  Playback_ICurrentMediaPlaybackItemChangedEventArgs2 = interface(IInspectable)
  ['{1D80A51E-996E-40A9-BE48-E66EC90B2B7D}']
    function get_Reason: Playback_MediaPlaybackItemChangedReason; safecall;
    property Reason: Playback_MediaPlaybackItemChangedReason read get_Reason;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<Windows.Foundation.TimeSpan>
  // Used Types:  Windows.Media.Playback.IMediaPlaybackItem
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Playback.IMediaPlaybackItem>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Media.Playback.IMediaPlaybackItem>
  }
  // Windows.Media.Playback.IMediaPlaybackList2
  Playback_IMediaPlaybackList2 = interface(IInspectable)
  ['{0E09B478-600A-4274-A14B-0B6723D0F48B}']
    function get_MaxPrefetchTime: IReference_1__TimeSpan; safecall;
    procedure put_MaxPrefetchTime(value: IReference_1__TimeSpan); safecall;
    function get_StartingItem: Playback_IMediaPlaybackItem; safecall;
    procedure put_StartingItem(value: Playback_IMediaPlaybackItem); safecall;
    function get_ShuffledItems: IVectorView_1__Playback_IMediaPlaybackItem; safecall;
    procedure SetShuffledItems(value: IIterable_1__Playback_IMediaPlaybackItem); safecall;
    property MaxPrefetchTime: IReference_1__TimeSpan read get_MaxPrefetchTime write put_MaxPrefetchTime;
    property ShuffledItems: IVectorView_1__Playback_IMediaPlaybackItem read get_ShuffledItems;
    property StartingItem: Playback_IMediaPlaybackItem read get_StartingItem write put_StartingItem;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IReference`1<UInt32>
  }
  // Windows.Media.Playback.IMediaPlaybackList3
  Playback_IMediaPlaybackList3 = interface(IInspectable)
  ['{DD24BBA9-BC47-4463-AA90-C18B7E5FFDE1}']
    function get_MaxPlayedItemsToKeepOpen: IReference_1__Cardinal; safecall;
    procedure put_MaxPlayedItemsToKeepOpen(value: IReference_1__Cardinal); safecall;
    property MaxPlayedItemsToKeepOpen: IReference_1__Cardinal read get_MaxPlayedItemsToKeepOpen write put_MaxPlayedItemsToKeepOpen;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.Core.ITimedMetadataTrack
  // Used Types:  Windows.Media.Playback.TimedMetadataTrackPresentationMode
  }
  // Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs
  [WinRTClassNameAttribute(SPlayback_TimedMetadataPresentationModeChangedEventArgs)]
  Playback_ITimedMetadataPresentationModeChangedEventArgs = interface(IInspectable)
  ['{D1636099-65DF-45AE-8CEF-DC0B53FDC2BB}']
    function get_Track: Core_ITimedMetadataTrack; safecall;
    function get_OldPresentationMode: Playback_TimedMetadataTrackPresentationMode; safecall;
    function get_NewPresentationMode: Playback_TimedMetadataTrackPresentationMode; safecall;
    property NewPresentationMode: Playback_TimedMetadataTrackPresentationMode read get_NewPresentationMode;
    property OldPresentationMode: Playback_TimedMetadataTrackPresentationMode read get_OldPresentationMode;
    property Track: Core_ITimedMetadataTrack read get_Track;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>
  // Used Types:  Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs
  }
  // Windows.Foundation.TypedEventHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>,Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs>
  TypedEventHandler_2__IVectorView_1__Core_ITimedMetadataTrack__Playback_ITimedMetadataPresentationModeChangedEventArgs = interface(IUnknown)
  ['{ED0CA484-0D2F-551E-BD0D-418D534C1A30}']
    procedure Invoke(sender: IVectorView_1__Core_ITimedMetadataTrack; args: Playback_ITimedMetadataPresentationModeChangedEventArgs); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.EventRegistrationToken
  // Used Types:  Windows.Foundation.TypedEventHandler`2<Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>,Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs>
  // Used Types:  Windows.Media.Playback.TimedMetadataTrackPresentationMode
  // Used Types:  UInt32
  }
  // Windows.Media.Playback.IMediaPlaybackTimedMetadataTrackList
  [WinRTClassNameAttribute(SPlayback_MediaPlaybackTimedMetadataTrackList)]
  Playback_IMediaPlaybackTimedMetadataTrackList = interface(IInspectable)
  ['{72B41319-BBFB-46A3-9372-9C9C744B9438}']
    function add_PresentationModeChanged(handler: TypedEventHandler_2__IVectorView_1__Core_ITimedMetadataTrack__Playback_ITimedMetadataPresentationModeChangedEventArgs): EventRegistrationToken; safecall;
    procedure remove_PresentationModeChanged(token: EventRegistrationToken); safecall;
    function GetPresentationMode(index: Cardinal): Playback_TimedMetadataTrackPresentationMode; safecall;
    procedure SetPresentationMode(index: Cardinal; value: Playback_TimedMetadataTrackPresentationMode); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel_Delegate_Base = interface(IUnknown)
  ['{CF61BE5D-40C3-5484-846A-3F82B8BA5738}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel = interface(AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel_Delegate_Base)
  ['{E08EC1E0-E4AE-55A1-9A15-180859E0FA0F}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  IAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel_Base = interface(IInspectable)
  ['{860C0179-BE01-546D-A9CE-5956464C98AB}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  // Used Types:  Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.ContentRestrictions.ContentAccessRestrictionLevel>
  IAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel = interface(IAsyncOperation_1__ContentRestrictions_ContentAccessRestrictionLevel_Base)
  ['{CA76FC11-A2C1-513E-B837-B4E39C42DC6B}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel; safecall;
    function GetResults: ContentRestrictions_ContentAccessRestrictionLevel; safecall;
    property Completed: AsyncOperationCompletedHandler_1__ContentRestrictions_ContentAccessRestrictionLevel read get_Completed write put_Completed;
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
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Foundation.IAsyncAction
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Storage.IStorageFile>
  // Used Types:  Windows.Storage.IStorageFolder
  // Used Types:  String
  // Used Types:  Windows.Storage.NameCollisionOption
  // Used Types:  Windows.Media.Playlists.PlaylistFormat
  }
  // Windows.Media.Playlists.IPlaylist
  [WinRTClassNameAttribute(SPlaylists_Playlist)]
  Playlists_IPlaylist = interface(IInspectable)
  ['{803736F5-CF44-4D97-83B3-7A089E9AB663}']
    function get_Files: IVector_1__IStorageFile; safecall;
    function SaveAsync: IAsyncAction; safecall;
    function SaveAsAsync(saveLocation: IStorageFolder; desiredName: HSTRING; option: NameCollisionOption): IAsyncOperation_1__IStorageFile; overload; safecall;
    function SaveAsAsync(saveLocation: IStorageFolder; desiredName: HSTRING; option: NameCollisionOption; playlistFormat: Playlists_PlaylistFormat): IAsyncOperation_1__IStorageFile; overload; safecall;
    property Files: IVector_1__IStorageFile read get_Files;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Playlists.IPlaylist>
  AsyncOperationCompletedHandler_1__Playlists_IPlaylist_Delegate_Base = interface(IUnknown)
  ['{427DEAFD-B226-5EF0-9320-C9F325E37474}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Playlists.IPlaylist>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Playlists.IPlaylist>
  AsyncOperationCompletedHandler_1__Playlists_IPlaylist = interface(AsyncOperationCompletedHandler_1__Playlists_IPlaylist_Delegate_Base)
  ['{A338C60F-5A0B-5A14-8945-FDD290DE1AB4}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__Playlists_IPlaylist; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Playlists.IPlaylist>
  IAsyncOperation_1__Playlists_IPlaylist_Base = interface(IInspectable)
  ['{8FFB74AB-912F-5BC1-87FA-2865F673CBFC}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.Playlists.IPlaylist>
  // Used Types:  Windows.Media.Playlists.IPlaylist
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.Playlists.IPlaylist>
  IAsyncOperation_1__Playlists_IPlaylist = interface(IAsyncOperation_1__Playlists_IPlaylist_Base)
  ['{C690486C-69A0-5A12-8E73-70F3B0FB6D4A}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__Playlists_IPlaylist); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__Playlists_IPlaylist; safecall;
    function GetResults: Playlists_IPlaylist; safecall;
    property Completed: AsyncOperationCompletedHandler_1__Playlists_IPlaylist read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.Playlists.IPlaylist>
  // Used Types:  Windows.Storage.IStorageFile
  }
  // Windows.Media.Playlists.IPlaylistStatics
  [WinRTClassNameAttribute(SPlaylists_Playlist)]
  Playlists_IPlaylistStatics = interface(IInspectable)
  ['{C5C331CD-81F9-4FF3-95B9-70B6FF046B68}']
    function LoadAsync(&file: IStorageFile): IAsyncOperation_1__Playlists_IPlaylist; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal_Delegate_Base = interface(IUnknown)
  ['{B9DA4AA0-26E0-5D69-A0C8-05716A406235}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Protection.RenewalStatus,UInt32>
  // Used Types:  UInt32
  }
  // Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal = interface(AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal_Delegate_Base)
  ['{C4BFC97F-A590-5D41-85C8-4536F00C4015}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal; progressInfo: Cardinal); safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal_Delegate_Base = interface(IUnknown)
  ['{EC067827-67D9-59A6-A57B-3E7CA12B89C1}']
  end;
  {
  // Used Types:  Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Protection.RenewalStatus,UInt32>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal = interface(AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal_Delegate_Base)
  ['{F0E33274-09BD-5C11-BFAC-D3B438553737}']
    procedure Invoke(asyncInfo: IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Protection.RenewalStatus,UInt32>
  IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal_Base = interface(IInspectable)
  ['{595DCC09-9AD3-5094-800A-0883CCE1EF01}']
  end;
  {
  // Used Types:  Windows.Foundation.AsyncOperationProgressHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  // Used Types:  Windows.Foundation.AsyncOperationWithProgressCompletedHandler`2<Windows.Media.Protection.RenewalStatus,UInt32>
  // Used Types:  Windows.Media.Protection.RenewalStatus
  }
  // Windows.Foundation.IAsyncOperationWithProgress`2<Windows.Media.Protection.RenewalStatus,UInt32>
  IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal = interface(IAsyncOperationWithProgress_2__Protection_RenewalStatus__Cardinal_Base)
  ['{85794F43-57E4-5D0C-B938-F23F36650C5E}']
    procedure put_Progress(handler: AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal); safecall;
    function get_Progress: AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal; safecall;
    procedure put_Completed(handler: AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal); safecall;
    function get_Completed: AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal; safecall;
    function GetResults: Protection_RenewalStatus; safecall;
    property Progress: AsyncOperationProgressHandler_2__Protection_RenewalStatus__Cardinal read get_Progress write put_Progress;
    property Completed: AsyncOperationWithProgressCompletedHandler_2__Protection_RenewalStatus__Cardinal read get_Completed write put_Completed;
  end;


  // Emit Forwarded classes
  // Windows.Media.VideoFrame
  // DualAPI
  // Implements: Windows.Media.IVideoFrame
  // Implements: Windows.Media.IMediaFrame
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Media.IVideoFrameFactory"
  TVideoFrame = class(TWinRTGenericImportF<IVideoFrameFactory>)
  public
    // -> IVideoFrameFactory
    class function Create(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): IVideoFrame; static; inline;
    class function CreateWithAlpha(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): IVideoFrame; static; inline;
  end;

  // Windows.Media.AudioBuffer
  // DualAPI
  // Implements: Windows.Media.IAudioBuffer
  // Implements: Windows.Foundation.IMemoryBuffer
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.AudioFrame
  // DualAPI
  // Implements: Windows.Media.IAudioFrame
  // Implements: Windows.Media.IMediaFrame
  // Implements: Windows.Foundation.IClosable
  // Factory: "Windows.Media.IAudioFrameFactory"
  TAudioFrame = class(TWinRTGenericImportF<IAudioFrameFactory>)
  public
    // -> IAudioFrameFactory
    class function Create(capacity: Cardinal): IAudioFrame; static; inline;
  end;

  // Windows.Media.Audio.AudioGraph
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioGraph
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Audio.IAudioGraph2
  // Statics: "Windows.Media.Audio.IAudioGraphStatics"
  TAudio_AudioGraph = class(TWinRTGenericImportS<Audio_IAudioGraphStatics>)
  public
    // -> Audio_IAudioGraphStatics
    class function CreateAsync(settings: Audio_IAudioGraphSettings): IAsyncOperation_1__Audio_ICreateAudioGraphResult; static; inline;
  end;

  // Windows.Media.Audio.CreateAudioGraphResult
  // DualAPI
  // Implements: Windows.Media.Audio.ICreateAudioGraphResult

  // Windows.Media.Audio.AudioGraphSettings
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioGraphSettings
  // Factory: "Windows.Media.Audio.IAudioGraphSettingsFactory"
  TAudio_AudioGraphSettings = class(TWinRTGenericImportF<Audio_IAudioGraphSettingsFactory>)
  public
    // -> Audio_IAudioGraphSettingsFactory
    class function Create(audioRenderCategory: Render_AudioRenderCategory): Audio_IAudioGraphSettings; static; inline;
  end;

  // Windows.Media.Audio.AudioDeviceInputNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioDeviceInputNode
  // Implements: Windows.Media.Audio.IAudioInputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Audio.IAudioInputNode2

  // Windows.Media.Audio.CreateAudioDeviceInputNodeResult
  // DualAPI
  // Implements: Windows.Media.Audio.ICreateAudioDeviceInputNodeResult

  // Windows.Media.Audio.AudioDeviceOutputNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioDeviceOutputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Audio.IAudioNodeWithListener

  // Windows.Media.Audio.CreateAudioDeviceOutputNodeResult
  // DualAPI
  // Implements: Windows.Media.Audio.ICreateAudioDeviceOutputNodeResult

  // Windows.Media.Audio.AudioFileInputNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioFileInputNode
  // Implements: Windows.Media.Audio.IAudioInputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Audio.IAudioInputNode2

  // Windows.Media.Audio.CreateAudioFileInputNodeResult
  // DualAPI
  // Implements: Windows.Media.Audio.ICreateAudioFileInputNodeResult

  // Windows.Media.Audio.AudioFileOutputNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioFileOutputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Audio.CreateAudioFileOutputNodeResult
  // DualAPI
  // Implements: Windows.Media.Audio.ICreateAudioFileOutputNodeResult

  // Windows.Media.Audio.AudioGraphUnrecoverableErrorOccurredEventArgs
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioGraphUnrecoverableErrorOccurredEventArgs

  // Windows.Media.Audio.AudioGraphBatchUpdater
  // DualAPI
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Audio.AudioFrameInputNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioFrameInputNode
  // Implements: Windows.Media.Audio.IAudioInputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Audio.IAudioInputNode2

  // Windows.Media.Audio.AudioFrameOutputNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioFrameOutputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Audio.AudioSubmixNode
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioInputNode
  // Implements: Windows.Media.Audio.IAudioNode
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Audio.IAudioInputNode2

  // Windows.Media.Audio.AudioNodeEmitter
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioNodeEmitter
  // Implements: Windows.Media.Audio.IAudioNodeEmitter2
  // Factory: "Windows.Media.Audio.IAudioNodeEmitterFactory"
  // Instantiable: "Audio_IAudioNodeEmitter"
  TAudio_AudioNodeEmitter = class(TWinRTGenericImportFI<Audio_IAudioNodeEmitterFactory, Audio_IAudioNodeEmitter>)
  public
    // -> Audio_IAudioNodeEmitterFactory
    class function CreateAudioNodeEmitter(shape: Audio_IAudioNodeEmitterShape; decayModel: Audio_IAudioNodeEmitterDecayModel; settings: Audio_AudioNodeEmitterSettings): Audio_IAudioNodeEmitter; static; inline;
  end;

  // Windows.Media.Audio.AudioNodeListener
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioNodeListener
  // Instantiable: "Audio_IAudioNodeListener"
  TAudio_AudioNodeListener = class(TWinRTGenericImportI<Audio_IAudioNodeListener>) end;

  // Windows.Media.Audio.AudioGraphConnection
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioGraphConnection

  // Windows.Media.Audio.AudioFrameCompletedEventArgs
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioFrameCompletedEventArgs

  // Windows.Media.Audio.FrameInputNodeQuantumStartedEventArgs
  // DualAPI
  // Implements: Windows.Media.Audio.IFrameInputNodeQuantumStartedEventArgs

  // Windows.Media.Audio.EqualizerBand
  // DualAPI
  // Implements: Windows.Media.Audio.IEqualizerBand

  // Windows.Media.Audio.EqualizerEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Audio.IEqualizerEffectDefinition
  // Implements: Windows.Media.Effects.IAudioEffectDefinition
  // Factory: "Windows.Media.Audio.IEqualizerEffectDefinitionFactory"
  TAudio_EqualizerEffectDefinition = class(TWinRTGenericImportF<Audio_IEqualizerEffectDefinitionFactory>)
  public
    // -> Audio_IEqualizerEffectDefinitionFactory
    class function Create(audioGraph: Audio_IAudioGraph): Audio_IEqualizerEffectDefinition; static; inline;
  end;

  // Windows.Media.Audio.ReverbEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Audio.IReverbEffectDefinition
  // Implements: Windows.Media.Effects.IAudioEffectDefinition
  // Factory: "Windows.Media.Audio.IReverbEffectDefinitionFactory"
  TAudio_ReverbEffectDefinition = class(TWinRTGenericImportF<Audio_IReverbEffectDefinitionFactory>)
  public
    // -> Audio_IReverbEffectDefinitionFactory
    class function Create(audioGraph: Audio_IAudioGraph): Audio_IReverbEffectDefinition; static; inline;
  end;

  // Windows.Media.Audio.EchoEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Audio.IEchoEffectDefinition
  // Implements: Windows.Media.Effects.IAudioEffectDefinition
  // Factory: "Windows.Media.Audio.IEchoEffectDefinitionFactory"
  TAudio_EchoEffectDefinition = class(TWinRTGenericImportF<Audio_IEchoEffectDefinitionFactory>)
  public
    // -> Audio_IEchoEffectDefinitionFactory
    class function Create(audioGraph: Audio_IAudioGraph): Audio_IEchoEffectDefinition; static; inline;
  end;

  // Windows.Media.Audio.LimiterEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Audio.ILimiterEffectDefinition
  // Implements: Windows.Media.Effects.IAudioEffectDefinition
  // Factory: "Windows.Media.Audio.ILimiterEffectDefinitionFactory"
  TAudio_LimiterEffectDefinition = class(TWinRTGenericImportF<Audio_ILimiterEffectDefinitionFactory>)
  public
    // -> Audio_ILimiterEffectDefinitionFactory
    class function Create(audioGraph: Audio_IAudioGraph): Audio_ILimiterEffectDefinition; static; inline;
  end;

  // Windows.Media.Audio.AudioNodeEmitterConeProperties
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioNodeEmitterConeProperties

  // Windows.Media.Audio.AudioNodeEmitterShape
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioNodeEmitterShape
  // Statics: "Windows.Media.Audio.IAudioNodeEmitterShapeStatics"
  TAudio_AudioNodeEmitterShape = class(TWinRTGenericImportS<Audio_IAudioNodeEmitterShapeStatics>)
  public
    // -> Audio_IAudioNodeEmitterShapeStatics
    class function CreateCone(innerAngle: Double; outerAngle: Double; outerAngleGain: Double): Audio_IAudioNodeEmitterShape; static; inline;
    class function CreateOmnidirectional: Audio_IAudioNodeEmitterShape; static; inline;
  end;

  // Windows.Media.Audio.AudioNodeEmitterNaturalDecayModelProperties
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioNodeEmitterNaturalDecayModelProperties

  // Windows.Media.Audio.AudioNodeEmitterDecayModel
  // DualAPI
  // Implements: Windows.Media.Audio.IAudioNodeEmitterDecayModel
  // Statics: "Windows.Media.Audio.IAudioNodeEmitterDecayModelStatics"
  TAudio_AudioNodeEmitterDecayModel = class(TWinRTGenericImportS<Audio_IAudioNodeEmitterDecayModelStatics>)
  public
    // -> Audio_IAudioNodeEmitterDecayModelStatics
    class function CreateNatural(minGain: Double; maxGain: Double; unityGainDistance: Double; cutoffDistance: Double): Audio_IAudioNodeEmitterDecayModel; static; inline;
    class function CreateCustom(minGain: Double; maxGain: Double): Audio_IAudioNodeEmitterDecayModel; static; inline;
  end;

  // Windows.Media.Capture.MediaCapture
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCapture
  // Implements: Windows.Media.Capture.IMediaCaptureVideoPreview
  // Implements: Windows.Media.Capture.IMediaCapture2
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Capture.IMediaCapture3
  // Implements: Windows.Media.Capture.IMediaCapture4
  // Implements: Windows.Media.Capture.IMediaCapture5
  // Implements: Windows.Media.Capture.IMediaCapture6
  // Statics: "Windows.Media.Capture.IMediaCaptureStatics"
  // Instantiable: "Capture_IMediaCapture"
  TCapture_MediaCapture = class(TWinRTGenericImportSI<Capture_IMediaCaptureStatics, Capture_IMediaCapture>)
  public
    // -> Capture_IMediaCaptureStatics
    class function IsVideoProfileSupported(videoDeviceId: HSTRING): Boolean; static; inline;
    class function FindAllVideoProfiles(videoDeviceId: HSTRING): IVectorView_1__Capture_IMediaCaptureVideoProfile; static; inline;
    class function FindConcurrentProfiles(videoDeviceId: HSTRING): IVectorView_1__Capture_IMediaCaptureVideoProfile; static; inline;
    class function FindKnownVideoProfiles(videoDeviceId: HSTRING; name: Capture_KnownVideoProfile): IVectorView_1__Capture_IMediaCaptureVideoProfile; static; inline;
  end;

  // Windows.Media.Capture.MediaCaptureVideoProfileMediaDescription
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureVideoProfileMediaDescription

  // Windows.Media.Capture.MediaCaptureVideoProfile
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureVideoProfile

  // Windows.Media.Capture.Frames.MediaFrameSourceGroup
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameSourceGroup
  // Statics: "Windows.Media.Capture.Frames.IMediaFrameSourceGroupStatics"
  TCapture_Frames_MediaFrameSourceGroup = class(TWinRTGenericImportS<Capture_Frames_IMediaFrameSourceGroupStatics>)
  public
    // -> Capture_Frames_IMediaFrameSourceGroupStatics
    class function FindAllAsync: IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup; static; inline;
    class function FromIdAsync(id: HSTRING): IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup; static; inline;
    class function GetDeviceSelector: HSTRING; static; inline;
  end;

  // Windows.Media.Capture.MediaCaptureInitializationSettings
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureInitializationSettings
  // Implements: Windows.Media.Capture.IMediaCaptureInitializationSettings2
  // Implements: Windows.Media.Capture.IMediaCaptureInitializationSettings3
  // Implements: Windows.Media.Capture.IMediaCaptureInitializationSettings4
  // Implements: Windows.Media.Capture.IMediaCaptureInitializationSettings5
  // Implements: Windows.Media.Capture.IMediaCaptureInitializationSettings6
  // Instantiable: "Capture_IMediaCaptureInitializationSettings"
  TCapture_MediaCaptureInitializationSettings = class(TWinRTGenericImportI<Capture_IMediaCaptureInitializationSettings>) end;

  // Windows.Media.Capture.MediaCaptureSettings
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureSettings
  // Implements: Windows.Media.Capture.IMediaCaptureSettings2

  // Windows.Media.Capture.LowLagMediaRecording
  // DualAPI
  // Implements: Windows.Media.Capture.ILowLagMediaRecording
  // Implements: Windows.Media.Capture.ILowLagMediaRecording2
  // Implements: Windows.Media.Capture.ILowLagMediaRecording3

  // Windows.Media.Capture.LowLagPhotoCapture
  // DualAPI
  // Implements: Windows.Media.Capture.ILowLagPhotoCapture

  // Windows.Media.Capture.LowLagPhotoSequenceCapture
  // DualAPI
  // Implements: Windows.Media.Capture.ILowLagPhotoSequenceCapture

  // Windows.Media.Capture.Core.VariablePhotoSequenceCapture
  // DualAPI
  // Implements: Windows.Media.Capture.Core.IVariablePhotoSequenceCapture
  // Implements: Windows.Media.Capture.Core.IVariablePhotoSequenceCapture2

  // Windows.Media.Capture.MediaCaptureFocusChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureFocusChangedEventArgs

  // Windows.Media.Capture.PhotoConfirmationCapturedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.IPhotoConfirmationCapturedEventArgs

  // Windows.Media.Capture.AdvancedPhotoCapture
  // DualAPI
  // Implements: Windows.Media.Capture.IAdvancedPhotoCapture

  // Windows.Media.Capture.MediaCapturePauseResult
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCapturePauseResult
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Capture.MediaCaptureStopResult
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureStopResult
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Capture.Frames.MediaFrameSource
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameSource

  // Windows.Media.Capture.Frames.MediaFrameReader
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameReader
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Capture.Frames.IMediaFrameReader2

  // Windows.Media.Capture.MediaCaptureDeviceExclusiveControlStatusChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.IMediaCaptureDeviceExclusiveControlStatusChangedEventArgs

  // Windows.Media.Capture.Frames.MultiSourceMediaFrameReader
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Capture.Frames.IMultiSourceMediaFrameReader2

  // Windows.Media.Capture.CapturedPhoto
  // DualAPI
  // Implements: Windows.Media.Capture.ICapturedPhoto

  // Windows.Media.Capture.AdvancedCapturedPhoto
  // DualAPI
  // Implements: Windows.Media.Capture.IAdvancedCapturedPhoto
  // Implements: Windows.Media.Capture.IAdvancedCapturedPhoto2

  // Windows.Media.Capture.OptionalReferencePhotoCapturedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.IOptionalReferencePhotoCapturedEventArgs

  // Windows.Media.Capture.CapturedFrame
  // DualAPI
  // Implements: Windows.Media.Capture.ICapturedFrame
  // Implements: Windows.Storage.Streams.IRandomAccessStreamWithContentType
  // Implements: Windows.Storage.Streams.IContentTypeProvider
  // Implements: Windows.Storage.Streams.IRandomAccessStream
  // Implements: Windows.Storage.Streams.IOutputStream
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Storage.Streams.IInputStream
  // Implements: Windows.Media.Capture.ICapturedFrameWithSoftwareBitmap

  // Windows.Media.Capture.PhotoCapturedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.IPhotoCapturedEventArgs

  // Windows.Media.Capture.CapturedFrameControlValues
  // DualAPI
  // Implements: Windows.Media.Capture.ICapturedFrameControlValues
  // Implements: Windows.Media.Capture.ICapturedFrameControlValues2

  // Windows.Media.Capture.VideoStreamConfiguration
  // DualAPI
  // Implements: Windows.Media.Capture.IVideoStreamConfiguration

  // Windows.Media.Capture.Frames.MediaFrameSourceInfo
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameSourceInfo

  // Windows.Media.Capture.Frames.MediaFrameSourceController
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameSourceController
  // Implements: Windows.Media.Capture.Frames.IMediaFrameSourceController2

  // Windows.Media.Capture.Frames.MediaFrameFormat
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameFormat

  // Windows.Media.Capture.Frames.MediaFrameArrivedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameArrivedEventArgs

  // Windows.Media.Capture.Frames.MediaFrameReference
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameReference
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Capture.Frames.MultiSourceMediaFrameArrivedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMultiSourceMediaFrameArrivedEventArgs

  // Windows.Media.Capture.Frames.MultiSourceMediaFrameReference
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMultiSourceMediaFrameReference
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Capture.Frames.MediaFrameSourceGetPropertyResult
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IMediaFrameSourceGetPropertyResult

  // Windows.Media.Capture.Frames.VideoMediaFrameFormat
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IVideoMediaFrameFormat

  // Windows.Media.Capture.Frames.DepthMediaFrameFormat
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IDepthMediaFrameFormat

  // Windows.Media.Capture.Frames.BufferMediaFrame
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IBufferMediaFrame

  // Windows.Media.Capture.Frames.VideoMediaFrame
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IVideoMediaFrame

  // Windows.Media.Capture.Frames.InfraredMediaFrame
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IInfraredMediaFrame

  // Windows.Media.Capture.Frames.DepthMediaFrame
  // DualAPI
  // Implements: Windows.Media.Capture.Frames.IDepthMediaFrame
  // Implements: Windows.Media.Capture.Frames.IDepthMediaFrame2

  // Windows.Media.Capture.Core.VariablePhotoCapturedEventArgs
  // DualAPI
  // Implements: Windows.Media.Capture.Core.IVariablePhotoCapturedEventArgs

  // Windows.Media.Casting.CastingSource
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingSource

  // Windows.Media.Casting.CastingConnectionErrorOccurredEventArgs
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingConnectionErrorOccurredEventArgs

  // Windows.Media.Casting.CastingDevice
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingDevice
  // Statics: "Windows.Media.Casting.ICastingDeviceStatics"
  TCasting_CastingDevice = class(TWinRTGenericImportS<Casting_ICastingDeviceStatics>)
  public
    // -> Casting_ICastingDeviceStatics
    class function GetDeviceSelector(&type: Casting_CastingPlaybackTypes): HSTRING; static; inline;
    class function GetDeviceSelectorFromCastingSourceAsync(castingSource: Casting_ICastingSource): IAsyncOperation_1__HSTRING; static; inline;
    class function FromIdAsync(value: HSTRING): IAsyncOperation_1__Casting_ICastingDevice; static; inline;
    class function DeviceInfoSupportsCastingAsync(device: IDeviceInformation): IAsyncOperation_1__Boolean; static; inline;
  end;

  // Windows.Media.Casting.CastingConnection
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingConnection
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Casting.CastingDeviceSelectedEventArgs
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingDeviceSelectedEventArgs

  // Windows.Media.Casting.CastingDevicePickerFilter
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingDevicePickerFilter

  // Windows.Media.Casting.CastingDevicePicker
  // DualAPI
  // Implements: Windows.Media.Casting.ICastingDevicePicker
  // Instantiable: "Casting_ICastingDevicePicker"
  TCasting_CastingDevicePicker = class(TWinRTGenericImportI<Casting_ICastingDevicePicker>) end;

  // Windows.Media.Core.TimedTextRegion
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextRegion
  // Instantiable: "Core_ITimedTextRegion"
  TCore_TimedTextRegion = class(TWinRTGenericImportI<Core_ITimedTextRegion>) end;

  // Windows.Media.Core.TimedTextStyle
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextStyle
  // Implements: Windows.Media.Core.ITimedTextStyle2
  // Instantiable: "Core_ITimedTextStyle"
  TCore_TimedTextStyle = class(TWinRTGenericImportI<Core_ITimedTextStyle>) end;

  // Windows.Media.Core.TimedTextLine
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextLine
  // Instantiable: "Core_ITimedTextLine"
  TCore_TimedTextLine = class(TWinRTGenericImportI<Core_ITimedTextLine>) end;

  // Windows.Media.Core.TimedTextSubformat
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextSubformat
  // Instantiable: "Core_ITimedTextSubformat"
  TCore_TimedTextSubformat = class(TWinRTGenericImportI<Core_ITimedTextSubformat>) end;

  // Windows.Media.Core.TimedTextCue
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextCue
  // Implements: Windows.Media.Core.IMediaCue
  // Instantiable: "Core_ITimedTextCue"
  TCore_TimedTextCue = class(TWinRTGenericImportI<Core_ITimedTextCue>) end;

  // Windows.Media.Core.DataCue
  // DualAPI
  // Implements: Windows.Media.Core.IDataCue
  // Implements: Windows.Media.Core.IMediaCue
  // Implements: Windows.Media.Core.IDataCue2
  // Instantiable: "Core_IDataCue"
  TCore_DataCue = class(TWinRTGenericImportI<Core_IDataCue>) end;

  // Windows.Media.Core.ChapterCue
  // DualAPI
  // Implements: Windows.Media.Core.IChapterCue
  // Implements: Windows.Media.Core.IMediaCue
  // Instantiable: "Core_IChapterCue"
  TCore_ChapterCue = class(TWinRTGenericImportI<Core_IChapterCue>) end;

  // Windows.Media.Core.ImageCue
  // DualAPI
  // Implements: Windows.Media.Core.IImageCue
  // Implements: Windows.Media.Core.IMediaCue
  // Instantiable: "Core_IImageCue"
  TCore_ImageCue = class(TWinRTGenericImportI<Core_IImageCue>) end;

  // Windows.Media.Core.SpeechCue
  // DualAPI
  // Implements: Windows.Media.Core.ISpeechCue
  // Implements: Windows.Media.Core.IMediaCue
  // Instantiable: "Core_ISpeechCue"
  TCore_SpeechCue = class(TWinRTGenericImportI<Core_ISpeechCue>) end;

  // Windows.Media.Core.CodecInfo
  // DualAPI
  // Implements: Windows.Media.Core.ICodecInfo

  // Windows.Media.Core.CodecQuery
  // DualAPI
  // Implements: Windows.Media.Core.ICodecQuery
  // Instantiable: "Core_ICodecQuery"
  TCore_CodecQuery = class(TWinRTGenericImportI<Core_ICodecQuery>) end;

  // Windows.Media.Core.LowLightFusionResult
  // DualAPI
  // Implements: Windows.Media.Core.ILowLightFusionResult
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Core.LowLightFusion
  // DualAPI
  // Statics: "Windows.Media.Core.ILowLightFusionStatics"
  TCore_LowLightFusion = class(TWinRTGenericImportS<Core_ILowLightFusionStatics>)
  public
    // -> Core_ILowLightFusionStatics
    class function get_SupportedBitmapPixelFormats: IVectorView_1__Imaging_BitmapPixelFormat; static; inline;
    class function get_MaxSupportedFrameCount: Integer; static; inline;
    class function FuseAsync(frameSet: IIterable_1__Imaging_ISoftwareBitmap): IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double; static; inline;
    class property MaxSupportedFrameCount: Integer read get_MaxSupportedFrameCount;
    class property SupportedBitmapPixelFormats: IVectorView_1__Imaging_BitmapPixelFormat read get_SupportedBitmapPixelFormats;
  end;

  // Windows.Media.DialProtocol.DialDeviceSelectedEventArgs
  // DualAPI
  // Implements: Windows.Media.DialProtocol.IDialDeviceSelectedEventArgs

  // Windows.Media.DialProtocol.DialDisconnectButtonClickedEventArgs
  // DualAPI
  // Implements: Windows.Media.DialProtocol.IDialDisconnectButtonClickedEventArgs

  // Windows.Media.DialProtocol.DialDevicePickerFilter
  // DualAPI
  // Implements: Windows.Media.DialProtocol.IDialDevicePickerFilter

  // Windows.Media.DialProtocol.DialDevicePicker
  // DualAPI
  // Implements: Windows.Media.DialProtocol.IDialDevicePicker
  // Instantiable: "DialProtocol_IDialDevicePicker"
  TDialProtocol_DialDevicePicker = class(TWinRTGenericImportI<DialProtocol_IDialDevicePicker>) end;

  // Windows.Media.Editing.MediaOverlay
  // DualAPI
  // Implements: Windows.Media.Editing.IMediaOverlay
  // Factory: "Windows.Media.Editing.IMediaOverlayFactory"
  TEditing_MediaOverlay = class(TWinRTGenericImportF<Editing_IMediaOverlayFactory>)
  public
    // -> Editing_IMediaOverlayFactory
    class function Create(clip: Editing_IMediaClip): Editing_IMediaOverlay; static; inline;
    class function CreateWithPositionAndOpacity(clip: Editing_IMediaClip; position: TRectF; opacity: Double): Editing_IMediaOverlay; static; inline;
  end;

  // Windows.Media.Effects.CompositeVideoFrameContext
  // DualAPI
  // Implements: Windows.Media.Effects.ICompositeVideoFrameContext

  // Windows.Media.Editing.MediaClip
  // DualAPI
  // Implements: Windows.Media.Editing.IMediaClip
  // Statics: "Windows.Media.Editing.IMediaClipStatics"
  // Statics: "Windows.Media.Editing.IMediaClipStatics2"
  TEditing_MediaClip = class(TWinRTGenericImportS2<Editing_IMediaClipStatics, Editing_IMediaClipStatics2>)
  public
    // -> Editing_IMediaClipStatics
    class function CreateFromColor(color: Color; originalDuration: TimeSpan): Editing_IMediaClip; static; inline;
    class function CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IMediaClip; static; inline;
    class function CreateFromImageFileAsync(&file: IStorageFile; originalDuration: TimeSpan): IAsyncOperation_1__Editing_IMediaClip; static; inline;

    // -> Editing_IMediaClipStatics2
    class function CreateFromSurface(surface: DirectX_Direct3D11_IDirect3DSurface; originalDuration: TimeSpan): Editing_IMediaClip; static; inline;
  end;

  // Windows.Media.Editing.EmbeddedAudioTrack
  // DualAPI
  // Implements: Windows.Media.Editing.IEmbeddedAudioTrack

  // Windows.Media.Editing.BackgroundAudioTrack
  // DualAPI
  // Implements: Windows.Media.Editing.IBackgroundAudioTrack
  // Statics: "Windows.Media.Editing.IBackgroundAudioTrackStatics"
  TEditing_BackgroundAudioTrack = class(TWinRTGenericImportS<Editing_IBackgroundAudioTrackStatics>)
  public
    // -> Editing_IBackgroundAudioTrackStatics
    class function CreateFromEmbeddedAudioTrack(embeddedAudioTrack: Editing_IEmbeddedAudioTrack): Editing_IBackgroundAudioTrack; static; inline;
    class function CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IBackgroundAudioTrack; static; inline;
  end;

  // Windows.Media.Editing.MediaComposition
  // DualAPI
  // Implements: Windows.Media.Editing.IMediaComposition
  // Implements: Windows.Media.Editing.IMediaComposition2
  // Statics: "Windows.Media.Editing.IMediaCompositionStatics"
  // Instantiable: "Editing_IMediaComposition"
  TEditing_MediaComposition = class(TWinRTGenericImportSI<Editing_IMediaCompositionStatics, Editing_IMediaComposition>)
  public
    // -> Editing_IMediaCompositionStatics
    class function LoadAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IMediaComposition; static; inline;
  end;

  // Windows.Media.Editing.MediaOverlayLayer
  // DualAPI
  // Implements: Windows.Media.Editing.IMediaOverlayLayer
  // Factory: "Windows.Media.Editing.IMediaOverlayLayerFactory"
  // Instantiable: "Editing_IMediaOverlayLayer"
  TEditing_MediaOverlayLayer = class(TWinRTGenericImportFI<Editing_IMediaOverlayLayerFactory, Editing_IMediaOverlayLayer>)
  public
    // -> Editing_IMediaOverlayLayerFactory
    class function CreateWithCompositorDefinition(compositorDefinition: Effects_IVideoCompositorDefinition): Editing_IMediaOverlayLayer; static; inline;
  end;

  // Windows.Media.Import.PhotoImportSource
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportSource
  // Statics: "Windows.Media.Import.IPhotoImportSourceStatics"
  TImport_PhotoImportSource = class(TWinRTGenericImportS<Import_IPhotoImportSourceStatics>)
  public
    // -> Import_IPhotoImportSourceStatics
    class function FromIdAsync(sourceId: HSTRING): IAsyncOperation_1__Import_IPhotoImportSource; static; inline;
    class function FromFolderAsync(sourceRootFolder: IStorageFolder): IAsyncOperation_1__Import_IPhotoImportSource; static; inline;
  end;

  // Windows.Media.Import.PhotoImportOperation
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportOperation

  // Windows.Media.Import.PhotoImportManager
  // DualAPI
  // Statics: "Windows.Media.Import.IPhotoImportManagerStatics"
  TImport_PhotoImportManager = class(TWinRTGenericImportS<Import_IPhotoImportManagerStatics>)
  public
    // -> Import_IPhotoImportManagerStatics
    class function IsSupportedAsync: IAsyncOperation_1__Boolean; static; inline;
    class function FindAllSourcesAsync: IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource; static; inline;
    class function GetPendingOperations: IVectorView_1__Import_IPhotoImportOperation; static; inline;
  end;

  // Windows.Media.Import.PhotoImportSession
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportSession
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Import.IPhotoImportSession2

  // Windows.Media.Import.PhotoImportFindItemsResult
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportFindItemsResult
  // Implements: Windows.Media.Import.IPhotoImportFindItemsResult2

  // Windows.Media.Import.PhotoImportImportItemsResult
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportImportItemsResult

  // Windows.Media.Import.PhotoImportDeleteImportedItemsFromSourceResult
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportDeleteImportedItemsFromSourceResult

  // Windows.Media.Import.PhotoImportStorageMedium
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportStorageMedium

  // Windows.Media.Import.PhotoImportSidecar
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportSidecar

  // Windows.Media.Import.PhotoImportVideoSegment
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportVideoSegment

  // Windows.Media.Import.PhotoImportItem
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportItem

  // Windows.Media.Import.PhotoImportSelectionChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportSelectionChangedEventArgs

  // Windows.Media.Import.PhotoImportItemImportedEventArgs
  // DualAPI
  // Implements: Windows.Media.Import.IPhotoImportItemImportedEventArgs

  // Windows.Media.Playback.MediaBreakManager
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreakManager

  // Windows.Media.Playback.MediaPlaybackSessionBufferingStartedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaPlaybackSessionBufferingStartedEventArgs

  // Windows.Media.Playback.MediaBreakSeekedOverEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreakSeekedOverEventArgs

  // Windows.Media.Playback.MediaBreakStartedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreakStartedEventArgs

  // Windows.Media.Playback.MediaBreakEndedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreakEndedEventArgs

  // Windows.Media.Playback.MediaBreakSkippedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreakSkippedEventArgs

  // Windows.Media.MediaTimelineController
  // DualAPI
  // Implements: Windows.Media.IMediaTimelineController
  // Implements: Windows.Media.IMediaTimelineController2
  // Instantiable: "IMediaTimelineController"
  TMediaTimelineController = class(TWinRTGenericImportI<IMediaTimelineController>) end;

  // Windows.Media.MediaTimelineControllerFailedEventArgs
  // DualAPI
  // Implements: Windows.Media.IMediaTimelineControllerFailedEventArgs

  // Windows.Media.Core.AudioStreamDescriptor
  // DualAPI
  // Implements: Windows.Media.Core.IAudioStreamDescriptor
  // Implements: Windows.Media.Core.IMediaStreamDescriptor
  // Implements: Windows.Media.Core.IAudioStreamDescriptor2
  // Implements: Windows.Media.Core.IMediaStreamDescriptor2
  // Factory: "Windows.Media.Core.IAudioStreamDescriptorFactory"
  TCore_AudioStreamDescriptor = class(TWinRTGenericImportF<Core_IAudioStreamDescriptorFactory>)
  public
    // -> Core_IAudioStreamDescriptorFactory
    class function Create(encodingProperties: IAudioEncodingProperties): Core_IAudioStreamDescriptor; static; inline;
  end;

  // Windows.Media.Core.VideoStreamDescriptor
  // DualAPI
  // Implements: Windows.Media.Core.IVideoStreamDescriptor
  // Implements: Windows.Media.Core.IMediaStreamDescriptor
  // Implements: Windows.Media.Core.IMediaStreamDescriptor2
  // Factory: "Windows.Media.Core.IVideoStreamDescriptorFactory"
  TCore_VideoStreamDescriptor = class(TWinRTGenericImportF<Core_IVideoStreamDescriptorFactory>)
  public
    // -> Core_IVideoStreamDescriptorFactory
    class function Create(encodingProperties: IVideoEncodingProperties): Core_IVideoStreamDescriptor; static; inline;
  end;

  // Windows.Media.VideoEffects
  // DualAPI
  // Statics: "Windows.Media.IVideoEffectsStatics"
  TVideoEffects = class(TWinRTGenericImportS<IVideoEffectsStatics>)
  public
    // -> IVideoEffectsStatics
    class function get_VideoStabilization: HSTRING; static; inline;
    class property VideoStabilization: HSTRING read get_VideoStabilization;
  end;

  // Windows.Media.Effects.ProcessVideoFrameContext
  // DualAPI
  // Implements: Windows.Media.Effects.IProcessVideoFrameContext

  // Windows.Media.Protection.MediaProtectionPMPServer
  // DualAPI
  // Implements: Windows.Media.Protection.IMediaProtectionPMPServer
  // Factory: "Windows.Media.Protection.IMediaProtectionPMPServerFactory"
  TProtection_MediaProtectionPMPServer = class(TWinRTGenericImportF<Protection_IMediaProtectionPMPServerFactory>)
  public
    // -> Protection_IMediaProtectionPMPServerFactory
    class function CreatePMPServer(pProperties: IPropertySet): Protection_IMediaProtectionPMPServer; static; inline;
  end;

  // Windows.Media.Playback.MediaPlaybackItem
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaPlaybackItem
  // Implements: Windows.Media.Playback.IMediaPlaybackSource
  // Implements: Windows.Media.Playback.IMediaPlaybackItem2
  // Implements: Windows.Media.Playback.IMediaPlaybackItem3
  // Statics: "Windows.Media.Playback.IMediaPlaybackItemStatics"
  // Factory: "Windows.Media.Playback.IMediaPlaybackItemFactory2"
  // Factory: "Windows.Media.Playback.IMediaPlaybackItemFactory"
  TPlayback_MediaPlaybackItem = class(TWinRTGenericImportF2S<Playback_IMediaPlaybackItemFactory, Playback_IMediaPlaybackItemFactory2, Playback_IMediaPlaybackItemStatics>)
  public
    // -> Playback_IMediaPlaybackItemStatics
    class function FindFromMediaSource(source: Core_IMediaSource2): Playback_IMediaPlaybackItem; static; inline;

    // -> Playback_IMediaPlaybackItemFactory2
    class function CreateWithStartTime(source: Core_IMediaSource2; startTime: TimeSpan): Playback_IMediaPlaybackItem; static; inline;
    class function CreateWithStartTimeAndDurationLimit(source: Core_IMediaSource2; startTime: TimeSpan; durationLimit: TimeSpan): Playback_IMediaPlaybackItem; static; inline;

    // -> Playback_IMediaPlaybackItemFactory
    class function Create(source: Core_IMediaSource2): Playback_IMediaPlaybackItem; static; inline;
  end;

  // Windows.Media.Protection.ProtectionCapabilities
  // DualAPI
  // Implements: Windows.Media.Protection.IProtectionCapabilities
  // Instantiable: "Protection_IProtectionCapabilities"
  TProtection_ProtectionCapabilities = class(TWinRTGenericImportI<Protection_IProtectionCapabilities>) end;

  // Windows.Media.Protection.HdcpSession
  // DualAPI
  // Implements: Windows.Media.Protection.IHdcpSession
  // Implements: Windows.Foundation.IClosable
  // Instantiable: "Protection_IHdcpSession"
  TProtection_HdcpSession = class(TWinRTGenericImportI<Protection_IHdcpSession>) end;

  // Windows.Media.Core.MediaStreamSource
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSource
  // Implements: Windows.Media.Core.IMediaSource
  // Implements: Windows.Media.Core.IMediaStreamSource2
  // Implements: Windows.Media.Core.IMediaStreamSource3
  // Implements: Windows.Media.Core.IMediaStreamSource4
  // Factory: "Windows.Media.Core.IMediaStreamSourceFactory"
  TCore_MediaStreamSource = class(TWinRTGenericImportF<Core_IMediaStreamSourceFactory>)
  public
    // -> Core_IMediaStreamSourceFactory
    class function CreateFromDescriptor(descriptor: Core_IMediaStreamDescriptor): Core_IMediaStreamSource; static; inline;
    class function CreateFromDescriptors(descriptor: Core_IMediaStreamDescriptor; descriptor2: Core_IMediaStreamDescriptor): Core_IMediaStreamSource; static; inline;
  end;

  // Windows.Media.Core.MediaStreamSourceClosedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceClosedEventArgs

  // Windows.Media.Core.MediaStreamSourceStartingEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceStartingEventArgs

  // Windows.Media.Core.MediaStreamSourceSampleRequestedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSampleRequestedEventArgs

  // Windows.Media.Core.MediaStreamSourceSwitchStreamsRequestedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestedEventArgs

  // Windows.Media.Core.MediaStreamSourceSampleRenderedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSampleRenderedEventArgs

  // Windows.Media.Core.MediaStreamSamplePropertySet
  // DualAPI
  // Implements: Windows.Foundation.Collections.IMap`2<Guid,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>

  // Windows.Media.Core.MediaStreamSample
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSample
  // Statics: "Windows.Media.Core.IMediaStreamSampleStatics"
  TCore_MediaStreamSample = class(TWinRTGenericImportS<Core_IMediaStreamSampleStatics>)
  public
    // -> Core_IMediaStreamSampleStatics
    class function CreateFromBuffer(buffer: IBuffer; timestamp: TimeSpan): Core_IMediaStreamSample; static; inline;
    class function CreateFromStreamAsync(stream: IInputStream; count: Cardinal; timestamp: TimeSpan): IAsyncOperation_1__Core_IMediaStreamSample; static; inline;
  end;

  // Windows.Media.Core.MediaStreamSampleProtectionProperties
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSampleProtectionProperties

  // Windows.Media.Core.MediaStreamSourceClosedRequest
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceClosedRequest

  // Windows.Media.Core.MediaStreamSourceStartingRequestDeferral
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceStartingRequestDeferral

  // Windows.Media.Core.MediaStreamSourceStartingRequest
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceStartingRequest

  // Windows.Media.Core.MediaStreamSourceSampleRequestDeferral
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSampleRequestDeferral

  // Windows.Media.Core.MediaStreamSourceSampleRequest
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSampleRequest

  // Windows.Media.Core.MediaStreamSourceSwitchStreamsRequestDeferral
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequestDeferral

  // Windows.Media.Core.MediaStreamSourceSwitchStreamsRequest
  // DualAPI
  // Implements: Windows.Media.Core.IMediaStreamSourceSwitchStreamsRequest

  // Windows.Media.Core.MseStreamSource
  // DualAPI
  // Implements: Windows.Media.Core.IMseStreamSource
  // Implements: Windows.Media.Core.IMediaSource
  // Implements: Windows.Media.Core.IMseStreamSource2
  // Statics: "Windows.Media.Core.IMseStreamSourceStatics"
  // Instantiable: "Core_IMseStreamSource"
  TCore_MseStreamSource = class(TWinRTGenericImportSI<Core_IMseStreamSourceStatics, Core_IMseStreamSource>)
  public
    // -> Core_IMseStreamSourceStatics
    class function IsContentTypeSupported(contentType: HSTRING): Boolean; static; inline;
  end;

  // Windows.Media.Core.MseSourceBufferList
  // DualAPI
  // Implements: Windows.Media.Core.IMseSourceBufferList

  // Windows.Media.Core.MseSourceBuffer
  // DualAPI
  // Implements: Windows.Media.Core.IMseSourceBuffer

  // Windows.Media.Transcoding.PrepareTranscodeResult
  // DualAPI
  // Implements: Windows.Media.Transcoding.IPrepareTranscodeResult

  // Windows.Media.Transcoding.MediaTranscoder
  // DualAPI
  // Implements: Windows.Media.Transcoding.IMediaTranscoder
  // Implements: Windows.Media.Transcoding.IMediaTranscoder2
  // Instantiable: "Transcoding_IMediaTranscoder"
  TTranscoding_MediaTranscoder = class(TWinRTGenericImportI<Transcoding_IMediaTranscoder>) end;

  // Windows.Media.Core.HighDynamicRangeControl
  // DualAPI
  // Implements: Windows.Media.Core.IHighDynamicRangeControl

  // Windows.Media.Core.SceneAnalysisEffect
  // DualAPI
  // Implements: Windows.Media.Core.ISceneAnalysisEffect
  // Implements: Windows.Media.IMediaExtension

  // Windows.Media.Core.SceneAnalyzedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.ISceneAnalyzedEventArgs

  // Windows.Media.Core.HighDynamicRangeOutput
  // DualAPI
  // Implements: Windows.Media.Core.IHighDynamicRangeOutput

  // Windows.Media.Core.SceneAnalysisEffectFrame
  // DualAPI
  // Implements: Windows.Media.Core.ISceneAnalysisEffectFrame
  // Implements: Windows.Media.IMediaFrame
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Core.ISceneAnalysisEffectFrame2

  // Windows.Media.Core.SceneAnalysisEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Effects.IVideoEffectDefinition
  // Instantiable: "Effects_IVideoEffectDefinition"
  TCore_SceneAnalysisEffectDefinition = class(TWinRTGenericImportI<Effects_IVideoEffectDefinition>) end;

  // Windows.Media.Core.FaceDetectionEffectFrame
  // DualAPI
  // Implements: Windows.Media.Core.IFaceDetectionEffectFrame
  // Implements: Windows.Media.IMediaFrame
  // Implements: Windows.Foundation.IClosable

  // Windows.Media.Core.FaceDetectedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IFaceDetectedEventArgs

  // Windows.Media.Core.FaceDetectionEffect
  // DualAPI
  // Implements: Windows.Media.Core.IFaceDetectionEffect
  // Implements: Windows.Media.IMediaExtension

  // Windows.Media.Core.FaceDetectionEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Effects.IVideoEffectDefinition
  // Implements: Windows.Media.Core.IFaceDetectionEffectDefinition
  // Instantiable: "Core_IFaceDetectionEffectDefinition"
  TCore_FaceDetectionEffectDefinition = class(TWinRTGenericImportI<Core_IFaceDetectionEffectDefinition>) end;

  // Windows.Media.Core.VideoStabilizationEffectEnabledChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IVideoStabilizationEffectEnabledChangedEventArgs

  // Windows.Media.Core.VideoStabilizationEffect
  // DualAPI
  // Implements: Windows.Media.Core.IVideoStabilizationEffect
  // Implements: Windows.Media.IMediaExtension

  // Windows.Media.Core.VideoStabilizationEffectDefinition
  // DualAPI
  // Implements: Windows.Media.Effects.IVideoEffectDefinition
  // Instantiable: "Effects_IVideoEffectDefinition"
  TCore_VideoStabilizationEffectDefinition = class(TWinRTGenericImportI<Effects_IVideoEffectDefinition>) end;

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSource
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource
  // Implements: Windows.Media.Core.IMediaSource
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource2
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSource3
  // Implements: Windows.Foundation.IClosable
  // Statics: "Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceStatics"
  TStreaming_Adaptive_AdaptiveMediaSource = class(TWinRTGenericImportS<Streaming_Adaptive_IAdaptiveMediaSourceStatics>)
  public
    // -> Streaming_Adaptive_IAdaptiveMediaSourceStatics
    class function IsContentTypeSupported(contentType: HSTRING): Boolean; static; inline;
    class function CreateFromUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; static; inline;
    class function CreateFromUriAsync(uri: IUriRuntimeClass; httpClient: Http_IHttpClient): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; static; inline;
    class function CreateFromStreamAsync(stream: IInputStream; uri: IUriRuntimeClass; contentType: HSTRING): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; static; inline;
    class function CreateFromStreamAsync(stream: IInputStream; uri: IUriRuntimeClass; contentType: HSTRING; httpClient: Http_IHttpClient): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult; overload; static; inline;
  end;

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCreationResult
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCreationResult2

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadBitrateChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourcePlaybackBitrateChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourcePlaybackBitrateChangedEventArgs

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadRequestedEventArgs
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedEventArgs2

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadCompletedEventArgs
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadCompletedEventArgs2

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadFailedEventArgs
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadFailedEventArgs2

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceAdvancedSettings
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceAdvancedSettings

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnostics
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnostics

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceCorrelatedTimes
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceCorrelatedTimes

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadResult
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadResult2

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadRequestedDeferral
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadRequestedDeferral

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDownloadStatistics
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDownloadStatistics

  // Windows.Media.Streaming.Adaptive.AdaptiveMediaSourceDiagnosticAvailableEventArgs
  // DualAPI
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs
  // Implements: Windows.Media.Streaming.Adaptive.IAdaptiveMediaSourceDiagnosticAvailableEventArgs2

  // Windows.Media.Core.MediaSourceError
  // DualAPI
  // Implements: Windows.Media.Core.IMediaSourceError

  // Windows.Media.Core.MediaSource
  // DualAPI
  // Implements: Windows.Media.Core.IMediaSource2
  // Implements: Windows.Foundation.IClosable
  // Implements: Windows.Media.Playback.IMediaPlaybackSource
  // Implements: Windows.Media.Core.IMediaSource3
  // Implements: Windows.Media.Core.IMediaSource4
  // Statics: "Windows.Media.Core.IMediaSourceStatics3"
  // Statics: "Windows.Media.Core.IMediaSourceStatics"
  // Statics: "Windows.Media.Core.IMediaSourceStatics2"
  TCore_MediaSource = class(TWinRTGenericImportS3<Core_IMediaSourceStatics, Core_IMediaSourceStatics2, Core_IMediaSourceStatics3>)
  public
    // -> Core_IMediaSourceStatics3
    class function CreateFromMediaFrameSource(frameSource: Capture_Frames_IMediaFrameSource): Core_IMediaSource2; static; inline;

    // -> Core_IMediaSourceStatics
    class function CreateFromAdaptiveMediaSource(mediaSource: Streaming_Adaptive_IAdaptiveMediaSource): Core_IMediaSource2; static; inline;
    class function CreateFromMediaStreamSource(mediaSource: Core_IMediaStreamSource): Core_IMediaSource2; static; inline;
    class function CreateFromMseStreamSource(mediaSource: Core_IMseStreamSource): Core_IMediaSource2; static; inline;
    class function CreateFromIMediaSource(mediaSource: Core_IMediaSource): Core_IMediaSource2; static; inline;
    class function CreateFromStorageFile(&file: IStorageFile): Core_IMediaSource2; static; inline;
    class function CreateFromStream(stream: IRandomAccessStream; contentType: HSTRING): Core_IMediaSource2; static; inline;
    class function CreateFromStreamReference(stream: IRandomAccessStreamReference; contentType: HSTRING): Core_IMediaSource2; static; inline;
    class function CreateFromUri(uri: IUriRuntimeClass): Core_IMediaSource2; static; inline;

    // -> Core_IMediaSourceStatics2
    class function CreateFromMediaBinder(binder: Core_IMediaBinder): Core_IMediaSource2; static; inline;
  end;

  // Windows.Media.Core.MediaBinder
  // DualAPI
  // Implements: Windows.Media.Core.IMediaBinder
  // Instantiable: "Core_IMediaBinder"
  TCore_MediaBinder = class(TWinRTGenericImportI<Core_IMediaBinder>) end;

  // Windows.Media.Core.MediaBindingEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaBindingEventArgs
  // Implements: Windows.Media.Core.IMediaBindingEventArgs2

  // Windows.Media.Core.MediaSourceOpenOperationCompletedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaSourceOpenOperationCompletedEventArgs

  // Windows.Media.Core.TimedTextSource
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextSource
  // Statics: "Windows.Media.Core.ITimedTextSourceStatics"
  // Statics: "Windows.Media.Core.ITimedTextSourceStatics2"
  TCore_TimedTextSource = class(TWinRTGenericImportS2<Core_ITimedTextSourceStatics, Core_ITimedTextSourceStatics2>)
  public
    // -> Core_ITimedTextSourceStatics
    class function CreateFromStream(stream: IRandomAccessStream): Core_ITimedTextSource; overload; static; inline;
    class function CreateFromUri(uri: IUriRuntimeClass): Core_ITimedTextSource; overload; static; inline;
    class function CreateFromStream(stream: IRandomAccessStream; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; static; inline;
    class function CreateFromUri(uri: IUriRuntimeClass; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; static; inline;

    // -> Core_ITimedTextSourceStatics2
    class function CreateFromStreamWithIndex(stream: IRandomAccessStream; indexStream: IRandomAccessStream): Core_ITimedTextSource; overload; static; inline;
    class function CreateFromUriWithIndex(uri: IUriRuntimeClass; indexUri: IUriRuntimeClass): Core_ITimedTextSource; overload; static; inline;
    class function CreateFromStreamWithIndex(stream: IRandomAccessStream; indexStream: IRandomAccessStream; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; static; inline;
    class function CreateFromUriWithIndex(uri: IUriRuntimeClass; indexUri: IUriRuntimeClass; defaultLanguage: HSTRING): Core_ITimedTextSource; overload; static; inline;
  end;

  // Windows.Media.Core.TimedMetadataTrack
  // DualAPI
  // Implements: Windows.Media.Core.ITimedMetadataTrack
  // Implements: Windows.Media.Core.IMediaTrack
  // Implements: Windows.Media.Core.ITimedMetadataTrack2
  // Factory: "Windows.Media.Core.ITimedMetadataTrackFactory"
  TCore_TimedMetadataTrack = class(TWinRTGenericImportF<Core_ITimedMetadataTrackFactory>)
  public
    // -> Core_ITimedMetadataTrackFactory
    class function Create(id: HSTRING; language: HSTRING; kind: Core_TimedMetadataKind): Core_ITimedMetadataTrack; static; inline;
  end;

  // Windows.Media.Core.MediaSourceStateChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaSourceStateChangedEventArgs

  // Windows.Media.Core.TimedMetadataTrackError
  // DualAPI
  // Implements: Windows.Media.Core.ITimedMetadataTrackError

  // Windows.Media.Core.MediaCueEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IMediaCueEventArgs

  // Windows.Media.Core.TimedMetadataTrackFailedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.ITimedMetadataTrackFailedEventArgs

  // Windows.Media.Core.TimedTextSourceResolveResultEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.ITimedTextSourceResolveResultEventArgs

  // Windows.Media.Core.VideoTrack
  // DualAPI
  // Implements: Windows.Media.Core.IMediaTrack
  // Implements: Windows.Media.Core.IVideoTrack

  // Windows.Media.Core.VideoTrackOpenFailedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IVideoTrackOpenFailedEventArgs

  // Windows.Media.Core.VideoTrackSupportInfo
  // DualAPI
  // Implements: Windows.Media.Core.IVideoTrackSupportInfo

  // Windows.Media.Core.AudioTrack
  // DualAPI
  // Implements: Windows.Media.Core.IMediaTrack
  // Implements: Windows.Media.Core.IAudioTrack

  // Windows.Media.Core.AudioTrackOpenFailedEventArgs
  // DualAPI
  // Implements: Windows.Media.Core.IAudioTrackOpenFailedEventArgs

  // Windows.Media.Core.AudioTrackSupportInfo
  // DualAPI
  // Implements: Windows.Media.Core.IAudioTrackSupportInfo

  // Windows.Media.Playback.MediaPlaybackAudioTrackList
  // DualAPI
  // Implements: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMediaTrack>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaTrack>
  // Implements: Windows.Media.Core.ISingleSelectMediaTrackList

  // Windows.Media.Playback.MediaPlaybackVideoTrackList
  // DualAPI
  // Implements: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.IMediaTrack>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IMediaTrack>
  // Implements: Windows.Media.Core.ISingleSelectMediaTrackList

  // Windows.Media.Playback.MediaPlaybackTimedMetadataTrackList
  // DualAPI
  // Implements: Windows.Foundation.Collections.IVectorView`1<Windows.Media.Core.ITimedMetadataTrack>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.ITimedMetadataTrack>
  // Implements: Windows.Media.Playback.IMediaPlaybackTimedMetadataTrackList

  // Windows.Media.Playback.MediaBreakSchedule
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreakSchedule

  // Windows.Media.Playback.MediaBreak
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaBreak
  // Factory: "Windows.Media.Playback.IMediaBreakFactory"
  TPlayback_MediaBreak = class(TWinRTGenericImportF<Playback_IMediaBreakFactory>)
  public
    // -> Playback_IMediaBreakFactory
    class function Create(insertionMethod: Playback_MediaBreakInsertionMethod): Playback_IMediaBreak; static; inline;
    class function CreateWithPresentationPosition(insertionMethod: Playback_MediaBreakInsertionMethod; presentationPosition: TimeSpan): Playback_IMediaBreak; static; inline;
  end;

  // Windows.Media.Playback.MediaPlaybackList
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaPlaybackList
  // Implements: Windows.Media.Playback.IMediaPlaybackSource
  // Implements: Windows.Media.Playback.IMediaPlaybackList2
  // Implements: Windows.Media.Playback.IMediaPlaybackList3
  // Instantiable: "Playback_IMediaPlaybackList"
  TPlayback_MediaPlaybackList = class(TWinRTGenericImportI<Playback_IMediaPlaybackList>) end;

  // Windows.Media.Playback.MediaPlaybackItemError
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaPlaybackItemError

  // Windows.Media.Playback.MediaPlaybackItemFailedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaPlaybackItemFailedEventArgs

  // Windows.Media.Playback.CurrentMediaPlaybackItemChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs
  // Implements: Windows.Media.Playback.ICurrentMediaPlaybackItemChangedEventArgs2

  // Windows.Media.Playback.MediaPlaybackItemOpenedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.IMediaPlaybackItemOpenedEventArgs

  // Windows.Media.Playback.TimedMetadataPresentationModeChangedEventArgs
  // DualAPI
  // Implements: Windows.Media.Playback.ITimedMetadataPresentationModeChangedEventArgs

  // Windows.Media.Playlists.Playlist
  // DualAPI
  // Implements: Windows.Media.Playlists.IPlaylist
  // Statics: "Windows.Media.Playlists.IPlaylistStatics"
  // Instantiable: "Playlists_IPlaylist"
  TPlaylists_Playlist = class(TWinRTGenericImportSI<Playlists_IPlaylistStatics, Playlists_IPlaylist>)
  public
    // -> Playlists_IPlaylistStatics
    class function LoadAsync(&file: IStorageFile): IAsyncOperation_1__Playlists_IPlaylist; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TVideoFrame }
// Factories for : "VideoFrame"
// Factory: "Windows.Media.IVideoFrameFactory"
// -> IVideoFrameFactory

class function TVideoFrame.Create(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer): IVideoFrame;
begin
  Result := Factory.Create(format, width, height);
end;

class function TVideoFrame.CreateWithAlpha(format: Imaging_BitmapPixelFormat; width: Integer; height: Integer; alpha: Imaging_BitmapAlphaMode): IVideoFrame;
begin
  Result := Factory.CreateWithAlpha(format, width, height, alpha);
end;


 { TAudioFrame }
// Factories for : "AudioFrame"
// Factory: "Windows.Media.IAudioFrameFactory"
// -> IAudioFrameFactory

class function TAudioFrame.Create(capacity: Cardinal): IAudioFrame;
begin
  Result := Factory.Create(capacity);
end;


 { TAudio_AudioGraph }

class function TAudio_AudioGraph.CreateAsync(settings: Audio_IAudioGraphSettings): IAsyncOperation_1__Audio_ICreateAudioGraphResult;
begin
  Result := Statics.CreateAsync(settings);
end;


 { TAudio_AudioGraphSettings }
// Factories for : "Audio_AudioGraphSettings"
// Factory: "Windows.Media.Audio.IAudioGraphSettingsFactory"
// -> Audio_IAudioGraphSettingsFactory

class function TAudio_AudioGraphSettings.Create(audioRenderCategory: Render_AudioRenderCategory): Audio_IAudioGraphSettings;
begin
  Result := Factory.Create(audioRenderCategory);
end;


 { TAudio_AudioNodeEmitter }
// Factories for : "Audio_AudioNodeEmitter"
// Factory: "Windows.Media.Audio.IAudioNodeEmitterFactory"
// -> Audio_IAudioNodeEmitterFactory

class function TAudio_AudioNodeEmitter.CreateAudioNodeEmitter(shape: Audio_IAudioNodeEmitterShape; decayModel: Audio_IAudioNodeEmitterDecayModel; settings: Audio_AudioNodeEmitterSettings): Audio_IAudioNodeEmitter;
begin
  Result := Factory.CreateAudioNodeEmitter(shape, decayModel, settings);
end;


 { TAudio_AudioNodeListener }

 { TAudio_EqualizerEffectDefinition }
// Factories for : "Audio_EqualizerEffectDefinition"
// Factory: "Windows.Media.Audio.IEqualizerEffectDefinitionFactory"
// -> Audio_IEqualizerEffectDefinitionFactory

class function TAudio_EqualizerEffectDefinition.Create(audioGraph: Audio_IAudioGraph): Audio_IEqualizerEffectDefinition;
begin
  Result := Factory.Create(audioGraph);
end;


 { TAudio_ReverbEffectDefinition }
// Factories for : "Audio_ReverbEffectDefinition"
// Factory: "Windows.Media.Audio.IReverbEffectDefinitionFactory"
// -> Audio_IReverbEffectDefinitionFactory

class function TAudio_ReverbEffectDefinition.Create(audioGraph: Audio_IAudioGraph): Audio_IReverbEffectDefinition;
begin
  Result := Factory.Create(audioGraph);
end;


 { TAudio_EchoEffectDefinition }
// Factories for : "Audio_EchoEffectDefinition"
// Factory: "Windows.Media.Audio.IEchoEffectDefinitionFactory"
// -> Audio_IEchoEffectDefinitionFactory

class function TAudio_EchoEffectDefinition.Create(audioGraph: Audio_IAudioGraph): Audio_IEchoEffectDefinition;
begin
  Result := Factory.Create(audioGraph);
end;


 { TAudio_LimiterEffectDefinition }
// Factories for : "Audio_LimiterEffectDefinition"
// Factory: "Windows.Media.Audio.ILimiterEffectDefinitionFactory"
// -> Audio_ILimiterEffectDefinitionFactory

class function TAudio_LimiterEffectDefinition.Create(audioGraph: Audio_IAudioGraph): Audio_ILimiterEffectDefinition;
begin
  Result := Factory.Create(audioGraph);
end;


 { TAudio_AudioNodeEmitterShape }

class function TAudio_AudioNodeEmitterShape.CreateCone(innerAngle: Double; outerAngle: Double; outerAngleGain: Double): Audio_IAudioNodeEmitterShape;
begin
  Result := Statics.CreateCone(innerAngle, outerAngle, outerAngleGain);
end;

class function TAudio_AudioNodeEmitterShape.CreateOmnidirectional: Audio_IAudioNodeEmitterShape;
begin
  Result := Statics.CreateOmnidirectional;
end;


 { TAudio_AudioNodeEmitterDecayModel }

class function TAudio_AudioNodeEmitterDecayModel.CreateNatural(minGain: Double; maxGain: Double; unityGainDistance: Double; cutoffDistance: Double): Audio_IAudioNodeEmitterDecayModel;
begin
  Result := Statics.CreateNatural(minGain, maxGain, unityGainDistance, cutoffDistance);
end;

class function TAudio_AudioNodeEmitterDecayModel.CreateCustom(minGain: Double; maxGain: Double): Audio_IAudioNodeEmitterDecayModel;
begin
  Result := Statics.CreateCustom(minGain, maxGain);
end;


 { TCapture_MediaCapture }

class function TCapture_MediaCapture.IsVideoProfileSupported(videoDeviceId: HSTRING): Boolean;
begin
  Result := Statics.IsVideoProfileSupported(videoDeviceId);
end;

class function TCapture_MediaCapture.FindAllVideoProfiles(videoDeviceId: HSTRING): IVectorView_1__Capture_IMediaCaptureVideoProfile;
begin
  Result := Statics.FindAllVideoProfiles(videoDeviceId);
end;

class function TCapture_MediaCapture.FindConcurrentProfiles(videoDeviceId: HSTRING): IVectorView_1__Capture_IMediaCaptureVideoProfile;
begin
  Result := Statics.FindConcurrentProfiles(videoDeviceId);
end;

class function TCapture_MediaCapture.FindKnownVideoProfiles(videoDeviceId: HSTRING; name: Capture_KnownVideoProfile): IVectorView_1__Capture_IMediaCaptureVideoProfile;
begin
  Result := Statics.FindKnownVideoProfiles(videoDeviceId, name);
end;


 { TCapture_Frames_MediaFrameSourceGroup }

class function TCapture_Frames_MediaFrameSourceGroup.FindAllAsync: IAsyncOperation_1__IVectorView_1__Capture_Frames_IMediaFrameSourceGroup;
begin
  Result := Statics.FindAllAsync;
end;

class function TCapture_Frames_MediaFrameSourceGroup.FromIdAsync(id: HSTRING): IAsyncOperation_1__Capture_Frames_IMediaFrameSourceGroup;
begin
  Result := Statics.FromIdAsync(id);
end;

class function TCapture_Frames_MediaFrameSourceGroup.GetDeviceSelector: HSTRING;
begin
  Result := Statics.GetDeviceSelector;
end;


 { TCapture_MediaCaptureInitializationSettings }

 { TCasting_CastingDevice }

class function TCasting_CastingDevice.GetDeviceSelector(&type: Casting_CastingPlaybackTypes): HSTRING;
begin
  Result := Statics.GetDeviceSelector(&type);
end;

class function TCasting_CastingDevice.GetDeviceSelectorFromCastingSourceAsync(castingSource: Casting_ICastingSource): IAsyncOperation_1__HSTRING;
begin
  Result := Statics.GetDeviceSelectorFromCastingSourceAsync(castingSource);
end;

class function TCasting_CastingDevice.FromIdAsync(value: HSTRING): IAsyncOperation_1__Casting_ICastingDevice;
begin
  Result := Statics.FromIdAsync(value);
end;

class function TCasting_CastingDevice.DeviceInfoSupportsCastingAsync(device: IDeviceInformation): IAsyncOperation_1__Boolean;
begin
  Result := Statics.DeviceInfoSupportsCastingAsync(device);
end;


 { TCasting_CastingDevicePicker }

 { TCore_TimedTextRegion }

 { TCore_TimedTextStyle }

 { TCore_TimedTextLine }

 { TCore_TimedTextSubformat }

 { TCore_TimedTextCue }

 { TCore_DataCue }

 { TCore_ChapterCue }

 { TCore_ImageCue }

 { TCore_SpeechCue }

 { TCore_CodecQuery }

 { TCore_LowLightFusion }

class function TCore_LowLightFusion.get_SupportedBitmapPixelFormats: IVectorView_1__Imaging_BitmapPixelFormat;
begin
  Result := Statics.get_SupportedBitmapPixelFormats;
end;

class function TCore_LowLightFusion.get_MaxSupportedFrameCount: Integer;
begin
  Result := Statics.get_MaxSupportedFrameCount;
end;

class function TCore_LowLightFusion.FuseAsync(frameSet: IIterable_1__Imaging_ISoftwareBitmap): IAsyncOperationWithProgress_2__Core_ILowLightFusionResult__Double;
begin
  Result := Statics.FuseAsync(frameSet);
end;


 { TDialProtocol_DialDevicePicker }

 { TEditing_MediaOverlay }
// Factories for : "Editing_MediaOverlay"
// Factory: "Windows.Media.Editing.IMediaOverlayFactory"
// -> Editing_IMediaOverlayFactory

class function TEditing_MediaOverlay.Create(clip: Editing_IMediaClip): Editing_IMediaOverlay;
begin
  Result := Factory.Create(clip);
end;

class function TEditing_MediaOverlay.CreateWithPositionAndOpacity(clip: Editing_IMediaClip; position: TRectF; opacity: Double): Editing_IMediaOverlay;
begin
  Result := Factory.CreateWithPositionAndOpacity(clip, position, opacity);
end;


 { TEditing_MediaClip }

class function TEditing_MediaClip.CreateFromColor(color: Color; originalDuration: TimeSpan): Editing_IMediaClip;
begin
  Result := Statics.CreateFromColor(color, originalDuration);
end;

class function TEditing_MediaClip.CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IMediaClip;
begin
  Result := Statics.CreateFromFileAsync(&file);
end;

class function TEditing_MediaClip.CreateFromImageFileAsync(&file: IStorageFile; originalDuration: TimeSpan): IAsyncOperation_1__Editing_IMediaClip;
begin
  Result := Statics.CreateFromImageFileAsync(&file, originalDuration);
end;


class function TEditing_MediaClip.CreateFromSurface(surface: DirectX_Direct3D11_IDirect3DSurface; originalDuration: TimeSpan): Editing_IMediaClip;
begin
  Result := Statics2.CreateFromSurface(surface, originalDuration);
end;


 { TEditing_BackgroundAudioTrack }

class function TEditing_BackgroundAudioTrack.CreateFromEmbeddedAudioTrack(embeddedAudioTrack: Editing_IEmbeddedAudioTrack): Editing_IBackgroundAudioTrack;
begin
  Result := Statics.CreateFromEmbeddedAudioTrack(embeddedAudioTrack);
end;

class function TEditing_BackgroundAudioTrack.CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IBackgroundAudioTrack;
begin
  Result := Statics.CreateFromFileAsync(&file);
end;


 { TEditing_MediaComposition }

class function TEditing_MediaComposition.LoadAsync(&file: IStorageFile): IAsyncOperation_1__Editing_IMediaComposition;
begin
  Result := Statics.LoadAsync(&file);
end;


 { TEditing_MediaOverlayLayer }
// Factories for : "Editing_MediaOverlayLayer"
// Factory: "Windows.Media.Editing.IMediaOverlayLayerFactory"
// -> Editing_IMediaOverlayLayerFactory

class function TEditing_MediaOverlayLayer.CreateWithCompositorDefinition(compositorDefinition: Effects_IVideoCompositorDefinition): Editing_IMediaOverlayLayer;
begin
  Result := Factory.CreateWithCompositorDefinition(compositorDefinition);
end;


 { TImport_PhotoImportSource }

class function TImport_PhotoImportSource.FromIdAsync(sourceId: HSTRING): IAsyncOperation_1__Import_IPhotoImportSource;
begin
  Result := Statics.FromIdAsync(sourceId);
end;

class function TImport_PhotoImportSource.FromFolderAsync(sourceRootFolder: IStorageFolder): IAsyncOperation_1__Import_IPhotoImportSource;
begin
  Result := Statics.FromFolderAsync(sourceRootFolder);
end;


 { TImport_PhotoImportManager }

class function TImport_PhotoImportManager.IsSupportedAsync: IAsyncOperation_1__Boolean;
begin
  Result := Statics.IsSupportedAsync;
end;

class function TImport_PhotoImportManager.FindAllSourcesAsync: IAsyncOperation_1__IVectorView_1__Import_IPhotoImportSource;
begin
  Result := Statics.FindAllSourcesAsync;
end;

class function TImport_PhotoImportManager.GetPendingOperations: IVectorView_1__Import_IPhotoImportOperation;
begin
  Result := Statics.GetPendingOperations;
end;


 { TMediaTimelineController }

 { TCore_AudioStreamDescriptor }
// Factories for : "Core_AudioStreamDescriptor"
// Factory: "Windows.Media.Core.IAudioStreamDescriptorFactory"
// -> Core_IAudioStreamDescriptorFactory

class function TCore_AudioStreamDescriptor.Create(encodingProperties: IAudioEncodingProperties): Core_IAudioStreamDescriptor;
begin
  Result := Factory.Create(encodingProperties);
end;


 { TCore_VideoStreamDescriptor }
// Factories for : "Core_VideoStreamDescriptor"
// Factory: "Windows.Media.Core.IVideoStreamDescriptorFactory"
// -> Core_IVideoStreamDescriptorFactory

class function TCore_VideoStreamDescriptor.Create(encodingProperties: IVideoEncodingProperties): Core_IVideoStreamDescriptor;
begin
  Result := Factory.Create(encodingProperties);
end;


 { TVideoEffects }

class function TVideoEffects.get_VideoStabilization: HSTRING;
begin
  Result := Statics.get_VideoStabilization;
end;


 { TProtection_MediaProtectionPMPServer }
// Factories for : "Protection_MediaProtectionPMPServer"
// Factory: "Windows.Media.Protection.IMediaProtectionPMPServerFactory"
// -> Protection_IMediaProtectionPMPServerFactory

class function TProtection_MediaProtectionPMPServer.CreatePMPServer(pProperties: IPropertySet): Protection_IMediaProtectionPMPServer;
begin
  Result := Factory.CreatePMPServer(pProperties);
end;


 { TPlayback_MediaPlaybackItem }

class function TPlayback_MediaPlaybackItem.FindFromMediaSource(source: Core_IMediaSource2): Playback_IMediaPlaybackItem;
begin
  Result := Statics.FindFromMediaSource(source);
end;

// Factories for : "Playback_MediaPlaybackItem"
// Factory: "Windows.Media.Playback.IMediaPlaybackItemFactory"
// -> Playback_IMediaPlaybackItemFactory

class function TPlayback_MediaPlaybackItem.Create(source: Core_IMediaSource2): Playback_IMediaPlaybackItem;
begin
  Result := Factory.Create(source);
end;

// Factory: "Windows.Media.Playback.IMediaPlaybackItemFactory2"
// -> Playback_IMediaPlaybackItemFactory2

class function TPlayback_MediaPlaybackItem.CreateWithStartTime(source: Core_IMediaSource2; startTime: TimeSpan): Playback_IMediaPlaybackItem;
begin
  Result := Factory2.CreateWithStartTime(source, startTime);
end;

class function TPlayback_MediaPlaybackItem.CreateWithStartTimeAndDurationLimit(source: Core_IMediaSource2; startTime: TimeSpan; durationLimit: TimeSpan): Playback_IMediaPlaybackItem;
begin
  Result := Factory2.CreateWithStartTimeAndDurationLimit(source, startTime, durationLimit);
end;


 { TProtection_ProtectionCapabilities }

 { TProtection_HdcpSession }

 { TCore_MediaStreamSource }
// Factories for : "Core_MediaStreamSource"
// Factory: "Windows.Media.Core.IMediaStreamSourceFactory"
// -> Core_IMediaStreamSourceFactory

class function TCore_MediaStreamSource.CreateFromDescriptor(descriptor: Core_IMediaStreamDescriptor): Core_IMediaStreamSource;
begin
  Result := Factory.CreateFromDescriptor(descriptor);
end;

class function TCore_MediaStreamSource.CreateFromDescriptors(descriptor: Core_IMediaStreamDescriptor; descriptor2: Core_IMediaStreamDescriptor): Core_IMediaStreamSource;
begin
  Result := Factory.CreateFromDescriptors(descriptor, descriptor2);
end;


 { TCore_MediaStreamSample }

class function TCore_MediaStreamSample.CreateFromBuffer(buffer: IBuffer; timestamp: TimeSpan): Core_IMediaStreamSample;
begin
  Result := Statics.CreateFromBuffer(buffer, timestamp);
end;

class function TCore_MediaStreamSample.CreateFromStreamAsync(stream: IInputStream; count: Cardinal; timestamp: TimeSpan): IAsyncOperation_1__Core_IMediaStreamSample;
begin
  Result := Statics.CreateFromStreamAsync(stream, count, timestamp);
end;


 { TCore_MseStreamSource }

class function TCore_MseStreamSource.IsContentTypeSupported(contentType: HSTRING): Boolean;
begin
  Result := Statics.IsContentTypeSupported(contentType);
end;


 { TTranscoding_MediaTranscoder }

 { TCore_SceneAnalysisEffectDefinition }

 { TCore_FaceDetectionEffectDefinition }

 { TCore_VideoStabilizationEffectDefinition }

 { TStreaming_Adaptive_AdaptiveMediaSource }

class function TStreaming_Adaptive_AdaptiveMediaSource.IsContentTypeSupported(contentType: HSTRING): Boolean;
begin
  Result := Statics.IsContentTypeSupported(contentType);
end;

class function TStreaming_Adaptive_AdaptiveMediaSource.CreateFromUriAsync(uri: IUriRuntimeClass): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;
begin
  Result := Statics.CreateFromUriAsync(uri);
end;

class function TStreaming_Adaptive_AdaptiveMediaSource.CreateFromUriAsync(uri: IUriRuntimeClass; httpClient: Http_IHttpClient): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;
begin
  Result := Statics.CreateFromUriAsync(uri, httpClient);
end;

class function TStreaming_Adaptive_AdaptiveMediaSource.CreateFromStreamAsync(stream: IInputStream; uri: IUriRuntimeClass; contentType: HSTRING): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;
begin
  Result := Statics.CreateFromStreamAsync(stream, uri, contentType);
end;

class function TStreaming_Adaptive_AdaptiveMediaSource.CreateFromStreamAsync(stream: IInputStream; uri: IUriRuntimeClass; contentType: HSTRING; httpClient: Http_IHttpClient): IAsyncOperation_1__Streaming_Adaptive_IAdaptiveMediaSourceCreationResult;
begin
  Result := Statics.CreateFromStreamAsync(stream, uri, contentType, httpClient);
end;


 { TCore_MediaSource }

class function TCore_MediaSource.CreateFromAdaptiveMediaSource(mediaSource: Streaming_Adaptive_IAdaptiveMediaSource): Core_IMediaSource2;
begin
  Result := Statics.CreateFromAdaptiveMediaSource(mediaSource);
end;

class function TCore_MediaSource.CreateFromMediaStreamSource(mediaSource: Core_IMediaStreamSource): Core_IMediaSource2;
begin
  Result := Statics.CreateFromMediaStreamSource(mediaSource);
end;

class function TCore_MediaSource.CreateFromMseStreamSource(mediaSource: Core_IMseStreamSource): Core_IMediaSource2;
begin
  Result := Statics.CreateFromMseStreamSource(mediaSource);
end;

class function TCore_MediaSource.CreateFromIMediaSource(mediaSource: Core_IMediaSource): Core_IMediaSource2;
begin
  Result := Statics.CreateFromIMediaSource(mediaSource);
end;

class function TCore_MediaSource.CreateFromStorageFile(&file: IStorageFile): Core_IMediaSource2;
begin
  Result := Statics.CreateFromStorageFile(&file);
end;

class function TCore_MediaSource.CreateFromStream(stream: IRandomAccessStream; contentType: HSTRING): Core_IMediaSource2;
begin
  Result := Statics.CreateFromStream(stream, contentType);
end;

class function TCore_MediaSource.CreateFromStreamReference(stream: IRandomAccessStreamReference; contentType: HSTRING): Core_IMediaSource2;
begin
  Result := Statics.CreateFromStreamReference(stream, contentType);
end;

class function TCore_MediaSource.CreateFromUri(uri: IUriRuntimeClass): Core_IMediaSource2;
begin
  Result := Statics.CreateFromUri(uri);
end;


class function TCore_MediaSource.CreateFromMediaBinder(binder: Core_IMediaBinder): Core_IMediaSource2;
begin
  Result := Statics2.CreateFromMediaBinder(binder);
end;


class function TCore_MediaSource.CreateFromMediaFrameSource(frameSource: Capture_Frames_IMediaFrameSource): Core_IMediaSource2;
begin
  Result := Statics3.CreateFromMediaFrameSource(frameSource);
end;


 { TCore_MediaBinder }

 { TCore_TimedTextSource }

class function TCore_TimedTextSource.CreateFromStream(stream: IRandomAccessStream): Core_ITimedTextSource;
begin
  Result := Statics.CreateFromStream(stream);
end;

class function TCore_TimedTextSource.CreateFromUri(uri: IUriRuntimeClass): Core_ITimedTextSource;
begin
  Result := Statics.CreateFromUri(uri);
end;

class function TCore_TimedTextSource.CreateFromStream(stream: IRandomAccessStream; defaultLanguage: HSTRING): Core_ITimedTextSource;
begin
  Result := Statics.CreateFromStream(stream, defaultLanguage);
end;

class function TCore_TimedTextSource.CreateFromUri(uri: IUriRuntimeClass; defaultLanguage: HSTRING): Core_ITimedTextSource;
begin
  Result := Statics.CreateFromUri(uri, defaultLanguage);
end;


class function TCore_TimedTextSource.CreateFromStreamWithIndex(stream: IRandomAccessStream; indexStream: IRandomAccessStream): Core_ITimedTextSource;
begin
  Result := Statics2.CreateFromStreamWithIndex(stream, indexStream);
end;

class function TCore_TimedTextSource.CreateFromUriWithIndex(uri: IUriRuntimeClass; indexUri: IUriRuntimeClass): Core_ITimedTextSource;
begin
  Result := Statics2.CreateFromUriWithIndex(uri, indexUri);
end;

class function TCore_TimedTextSource.CreateFromStreamWithIndex(stream: IRandomAccessStream; indexStream: IRandomAccessStream; defaultLanguage: HSTRING): Core_ITimedTextSource;
begin
  Result := Statics2.CreateFromStreamWithIndex(stream, indexStream, defaultLanguage);
end;

class function TCore_TimedTextSource.CreateFromUriWithIndex(uri: IUriRuntimeClass; indexUri: IUriRuntimeClass; defaultLanguage: HSTRING): Core_ITimedTextSource;
begin
  Result := Statics2.CreateFromUriWithIndex(uri, indexUri, defaultLanguage);
end;


 { TCore_TimedMetadataTrack }
// Factories for : "Core_TimedMetadataTrack"
// Factory: "Windows.Media.Core.ITimedMetadataTrackFactory"
// -> Core_ITimedMetadataTrackFactory

class function TCore_TimedMetadataTrack.Create(id: HSTRING; language: HSTRING; kind: Core_TimedMetadataKind): Core_ITimedMetadataTrack;
begin
  Result := Factory.Create(id, language, kind);
end;


 { TPlayback_MediaBreak }
// Factories for : "Playback_MediaBreak"
// Factory: "Windows.Media.Playback.IMediaBreakFactory"
// -> Playback_IMediaBreakFactory

class function TPlayback_MediaBreak.Create(insertionMethod: Playback_MediaBreakInsertionMethod): Playback_IMediaBreak;
begin
  Result := Factory.Create(insertionMethod);
end;

class function TPlayback_MediaBreak.CreateWithPresentationPosition(insertionMethod: Playback_MediaBreakInsertionMethod; presentationPosition: TimeSpan): Playback_IMediaBreak;
begin
  Result := Factory.CreateWithPresentationPosition(insertionMethod, presentationPosition);
end;


 { TPlayback_MediaPlaybackList }

 { TPlaylists_Playlist }

class function TPlaylists_Playlist.LoadAsync(&file: IStorageFile): IAsyncOperation_1__Playlists_IPlaylist;
begin
  Result := Statics.LoadAsync(&file);
end;



end.
